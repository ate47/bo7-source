#using script_610d4a9bb9b2d531;
#using scripts\asm\asm;
#using scripts\common\utility;

#namespace zombie_cannonball;

// Namespace zombie_cannonball
// Params 0, eflags: 0x5
// Checksum 0xbab26885, Offset: 0xed
// Size: 0x20
function private autoexec init()
{
    utility::registersharedfunc( #"zombie", #"cannonballzombie", &cannonball_ai );
}

// Namespace zombie_cannonball
// Params 4
// Checksum 0x24ed9349, Offset: 0x115
// Size: 0x218, Type: bool
function cannonball_ai( launch_dir, launch_magnitude = 300, settings, anim_alias = "default" )
{
    if ( !isalive( self ) || !isai( self ) )
    {
        return false;
    }
    
    if ( self.disallow_cannonball || self.disallow_knockdown )
    {
        return false;
    }
    
    if ( !( isdefined( launch_dir ) && isdefined( launch_magnitude ) ) )
    {
        return false;
    }
    
    archetype_override = self findoverridearchetype( "animscript" );
    
    if ( isdefined( archetype_override ) && archetype_override != self getbasearchetype() )
    {
        return false;
    }
    
    if ( zombie_traverse::is_traversing() )
    {
        return false;
    }
    
    if ( !function_9c6cc815e69389cd() )
    {
        return false;
    }
    
    if ( !isdefined( anim_alias ) )
    {
        anim_alias = "default";
    }
    
    self function_695b8e1b655c2796( "cannonball", anim_alias );
    launch_vec = vectornormalize( launch_dir ) * launch_magnitude;
    default_settings = adv_settings();
    
    if ( !isdefined( settings ) )
    {
        settings = default_settings;
    }
    
    self._blackboard.var_b6a894e28098cb2c = launch_vec;
    self._blackboard.var_a78d00bc500c9142 = settings.gravity_scalar ?? default_settings.gravity_scalar;
    self._blackboard.var_7f10cc358db1d109 = settings.var_56bf017a61a8b3f2 ?? default_settings.var_56bf017a61a8b3f2;
    self._blackboard.var_b11edfed122e3043 = settings.facing_source ?? default_settings.facing_source;
    self._blackboard.var_b7e5685c3aeaa25a = settings.var_90390ae034d0dd6c ?? default_settings.var_90390ae034d0dd6c;
    
    if ( isdefined( settings.ignore_ents ) )
    {
        self function_f82a07bd6a453e48( settings.ignore_ents );
    }
    
    self animmode( "noclip" );
    asm::function_7256f5ba459c840b( "cannonball_in" );
    thread function_86c3df436d85b1f1( undefined, settings.var_c83cbcdc64328a4e );
    return true;
}

// Namespace zombie_cannonball
// Params 6
// Checksum 0xb8ec7ea1, Offset: 0x336
// Size: 0xbb
function adv_settings( gravity_scalar, var_56bf017a61a8b3f2, facing_source, var_90390ae034d0dd6c, ignore_ents, var_c83cbcdc64328a4e )
{
    settings = spawnstruct();
    settings.gravity_scalar = gravity_scalar ?? 1;
    settings.var_56bf017a61a8b3f2 = var_56bf017a61a8b3f2 ?? 0;
    settings.facing_source = facing_source ?? 1;
    settings.var_90390ae034d0dd6c = var_90390ae034d0dd6c ?? 0;
    settings.var_c83cbcdc64328a4e = var_c83cbcdc64328a4e ?? 0;
    
    if ( isdefined( ignore_ents ) )
    {
        settings.ignore_ents = ignore_ents;
    }
    
    return settings;
}

// Namespace zombie_cannonball
// Params 1
// Checksum 0x58755ec6, Offset: 0x3fa
// Size: 0x17
function function_c47b4675a71d8167( func )
{
    self.cannonball_failsafe_func = func;
}

// Namespace zombie_cannonball
// Params 1
// Checksum 0x683f9bf6, Offset: 0x419
// Size: 0x26
function set_callback_hit_wall( func )
{
    thread utility::thread_on_notify( "hit_wall", func, self, self, [ "cannonball_end" ] );
}

// Namespace zombie_cannonball
// Params 1
// Checksum 0x7eb60a81, Offset: 0x447
// Size: 0x1b
function set_callback_on_end( func )
{
    thread utility::thread_on_notify( "cannonball_end", func, self );
}

// Namespace zombie_cannonball
// Params 0
// Checksum 0xfd3df780, Offset: 0x46a
// Size: 0x16, Type: bool
function function_aa1319badace3306()
{
    return istrue( self._blackboard.var_5c6f406c1ffc2b5c );
}

// Namespace zombie_cannonball
// Params 0
// Checksum 0xd30c2e6, Offset: 0x489
// Size: 0x15
function function_9c6cc815e69389cd()
{
    return self asmhasstate( self.asmname, "cannonball_in" );
}

// Namespace zombie_cannonball
// Params 2, eflags: 0xc
// Checksum 0x937ddd74, Offset: 0x4a7
// Size: 0x136
function private function_86c3df436d85b1f1( func, var_c83cbcdc64328a4e )
{
    self notify( #"hash_833e27d7333187b9" );
    self endon( #"hash_833e27d7333187b9" );
    self endon( #"death" );
    self endon( #"cannonball_end" );
    
    if ( func )
    {
        self.cannonball_failsafe_func = func;
    }
    
    self waittill( #"cannonball_start" );
    msg = utility::waittill_any_return( "cannonball_failsafe", "cannonball_end" );
    
    if ( msg == "cannonball_failsafe" )
    {
        assert( msg + "<dev string:x24>" );
        
        if ( isdefined( self.cannonball_failsafe_func ) )
        {
            [[ self.cannonball_failsafe_func ]]();
        }
        else
        {
            closest_navmesh_point = getclosestpointonnavmesh( self.origin );
            self forceteleport( closest_navmesh_point, self.angles, 10, 1 );
        }
        
        return;
    }
    
    if ( msg == "cannonball_end" && var_c83cbcdc64328a4e != 0 )
    {
        closest_navmesh_point = getclosestpointonnavmesh( self.origin );
        
        if ( distancesquared( self.origin, closest_navmesh_point ) > squared( var_c83cbcdc64328a4e ) )
        {
            self.death_source = "cannonball_failsafe";
            self kill();
        }
    }
}

