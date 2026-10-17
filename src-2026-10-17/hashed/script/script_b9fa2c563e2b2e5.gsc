#using script_31e159e3b40e909e;
#using script_4f9ce8d249a99f4a;
#using script_734dce84c468439b;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\supers;
#using scripts\mp\zm\zm_utility;

#namespace namespace_41b4175cf8944fb;

// Namespace namespace_41b4175cf8944fb
// Params 0, eflags: 0x5
// Checksum 0xf45a4aa, Offset: 0xd8
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_93b49a4454504018", undefined, &function_ed52a8ec6cf195d8, undefined );
}

// Namespace namespace_41b4175cf8944fb
// Params 0
// Checksum 0xda8cafe5, Offset: 0xf9
// Size: 0xa
function function_ed52a8ec6cf195d8()
{
    level thread function_b0902416e99b2aaf();
}

// Namespace namespace_41b4175cf8944fb
// Params 0
// Checksum 0x1fe1ba93, Offset: 0x10b
// Size: 0x1c
function function_b0902416e99b2aaf()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_dae9777bc22ff8fe", &function_cf1f3a863c07a9e7, &function_b8a3b0d03d0e7f22 );
}

// Namespace namespace_41b4175cf8944fb
// Params 0
// Checksum 0x7ce97683, Offset: 0x12f
// Size: 0x13f
function function_cf1f3a863c07a9e7()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level callback::add( #"player_spawned", &recharge_field_upgrade );
    level callback::add( "energy_mine_ball_spawned", &on_energy_mine_ball_spawned );
    
    if ( level.field_upgrade_bundles[ "super_toxic_growth" ] )
    {
        level.var_13067a485f31e10d = level.field_upgrade_bundles[ "super_toxic_growth" ].var_ea637cbf53813f21;
        level.field_upgrade_bundles[ "super_toxic_growth" ].var_ea637cbf53813f21 = 60;
    }
    
    foreach ( player in level.players )
    {
        player thread recharge_field_upgrade();
    }
    
    level.var_cdca5e730e05bc39 = 1;
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_41b4175cf8944fb
// Params 1, eflags: 0xc
// Checksum 0x2d5cb70, Offset: 0x276
// Size: 0x10e
function private recharge_field_upgrade( params )
{
    self notify( #"hash_8d149549cb0a22e0" );
    self endon( #"hash_8d149549cb0a22e0" );
    self endon( #"disconnect" );
    level endon( #"hash_ab3f1f51b15781de" );
    
    while ( true )
    {
        s_super = supers_mp::getcurrentsuper();
        b_super_ready = supers_mp::issuperready();
        n_total_points_needed = supers_mp::getsuperpointsneeded();
        var_1bb81fd0858d75e1 = getdvarint( @"hash_fdb7725b39c391e1", 20 );
        var_3a56159a96aa1dfb = n_total_points_needed / var_1bb81fd0858d75e1;
        
        if ( isalive( self ) && !player::isinlaststand( self ) && !b_super_ready )
        {
            superpointsmod = level.var_8a3e2af27738ffdc[ s_super.staticdata.ref ] ?? level.superpointsmod;
            var_6510b7df9c4e1e6 = ceil( var_3a56159a96aa1dfb / superpointsmod );
            supers_mp::givesuperpoints( var_6510b7df9c4e1e6, undefined, 1 );
        }
        
        wait 1;
    }
}

// Namespace namespace_41b4175cf8944fb
// Params 0
// Checksum 0xd2e2d7c0, Offset: 0x38c
// Size: 0x140
function function_b8a3b0d03d0e7f22()
{
    level callback::remove( #"player_spawned", &recharge_field_upgrade );
    level notify( #"hash_ab3f1f51b15781de" );
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    level callback::remove( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 0;
    level callback::remove( "energy_mine_ball_spawned", &on_energy_mine_ball_spawned );
    
    if ( level.field_upgrade_bundles[ "super_toxic_growth" ] )
    {
        level.field_upgrade_bundles[ "super_toxic_growth" ].var_ea637cbf53813f21 = level.var_13067a485f31e10d;
    }
    
    all_zombies = getaiarray( zm_utility::get_zombie_team() );
    
    foreach ( zombie in all_zombies )
    {
        if ( isalive( zombie ) )
        {
            zombie zm_relic_challenges::function_908a1b8613e50514();
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x63>" );
    #/
}

// Namespace namespace_41b4175cf8944fb
// Params 1, eflags: 0x4
// Checksum 0xcbbea236, Offset: 0x4d4
// Size: 0xee
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    player = dmg_struct.eattacker;
    player function_aad22aaf576cc06a();
    var_9908bb4c86f01f8f = player.var_568623dc77af5450 || player.group_frenzied_guard_active || player.var_57436ea3d87868a1.size > 0 || player.toxic_growth_array.size > 0 || player.mary_paris_mdl;
    
    if ( !player utility::ent_flag( "field_upgrade_in_use" ) && !var_9908bb4c86f01f8f && !player supers_mp::issuperinuse() && !player is_field_upgrade_damage( dmg_struct.sweapon ) )
    {
        idamage *= 0;
        zm_relic_challenges::set_zombie_damage_invuln();
    }
    else
    {
        zm_relic_challenges::function_908a1b8613e50514();
    }
    
    return idamage;
}

// Namespace namespace_41b4175cf8944fb
// Params 1, eflags: 0x4
// Checksum 0xdd496420, Offset: 0x5cb
// Size: 0xfb, Type: bool
function private is_field_upgrade_damage( sweapon )
{
    if ( sweapon.var_1616e6fbba9a722d == %"energy_mine" )
    {
        return true;
    }
    
    if ( sweapon.var_1616e6fbba9a722d == %"toxic_growth" )
    {
        return true;
    }
    
    if ( sweapon.var_1616e6fbba9a722d == %"mary_paris" )
    {
        return true;
    }
    
    if ( sweapon.var_1616e6fbba9a722d == %"tesla_storm" )
    {
        return true;
    }
    
    if ( isdefined( self.last_healing_aura ) && self.last_healing_aura + 5000 > gettime() )
    {
        return true;
    }
    
    if ( weapon::issuperweapon( sweapon ) )
    {
        return true;
    }
    
    var_897afd39d0a1399c = self.super.weaponobj;
    var_28ad4d962dc90b43 = self.tacticalsuper.weaponobj;
    
    if ( var_897afd39d0a1399c == sweapon || var_28ad4d962dc90b43 == sweapon )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_41b4175cf8944fb
// Params 1, eflags: 0x4
// Checksum 0x1e5c8fbb, Offset: 0x6cf
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

// Namespace namespace_41b4175cf8944fb
// Params 1, eflags: 0x4
// Checksum 0x1c2993d4, Offset: 0x6ea
// Size: 0x4b
function private on_energy_mine_ball_spawned( params )
{
    params.mdl_ball endon( #"death" );
    wait 45;
    
    if ( params.mdl_ball )
    {
        params.mdl_ball.var_ab7ed321b7eab6e3 = 1;
    }
}

// Namespace namespace_41b4175cf8944fb
// Params 0, eflags: 0x4
// Checksum 0x9246bbeb, Offset: 0x73d
// Size: 0xb3
function private function_aad22aaf576cc06a()
{
    if ( self.toxic_growth_array.size > 0 )
    {
        foreach ( key, toxic_growth in self.toxic_growth_array )
        {
            if ( !toxic_growth.e_grenade )
            {
                self.toxic_growth_array[ key ] = undefined;
                
                if ( isint( key ) )
                {
                    function_cdc669dbc8ea2101( self.toxic_growth_array );
                }
            }
        }
    }
}

