#using script_208a12cbcccbfa63;
#using script_4f9ce8d249a99f4a;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_debug;
#using scripts\mp\zm\ztron\ztron_hazard;

#namespace namespace_4b3d6a3674393369;

// Namespace namespace_4b3d6a3674393369
// Params 0, eflags: 0x5
// Checksum 0xd0505e59, Offset: 0xa2
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_65a0faf619f2173a", #"hash_4599115b7d4d2ff0", undefined, &init );
}

// Namespace namespace_4b3d6a3674393369
// Params 0
// Checksum 0xe9be1767, Offset: 0xcb
// Size: 0x3e
function init()
{
    ztron_hazard::function_6f661fac5fd31f1( #"air_fan", #"create", &function_434b82700ce15fdf );
    ztron_hazard::function_6f661fac5fd31f1( #"air_fan", #"arenaspawn", &function_620ec41d724b1d52 );
}

// Namespace namespace_4b3d6a3674393369
// Params 0
// Checksum 0x6ee980a1, Offset: 0x111
// Size: 0x9c
function function_620ec41d724b1d52()
{
    hazards = level.ztron.active_arena ztron_arena::function_eb3bad474c41ae42( "air_fan" );
    
    foreach ( hazard in hazards )
    {
        function_434b82700ce15fdf( hazard );
    }
}

// Namespace namespace_4b3d6a3674393369
// Params 2
// Checksum 0x46b3ae20, Offset: 0x1b5
// Size: 0x1e
function function_434b82700ce15fdf( trap, paged )
{
    thread function_57c3401e17500000( trap );
}

// Namespace namespace_4b3d6a3674393369
// Params 1
// Checksum 0x16d9c88b, Offset: 0x1db
// Size: 0x229
function function_57c3401e17500000( trap )
{
    level endon( #"ztron_game_is_over" );
    trap endon( #"destroy_hazard" );
    trap.angles = trap.angles ?? ( 0, 0, 0 );
    trap.onduration = 5;
    trap.offduration = 3;
    
    if ( isdefined( trap.script_parameters ) )
    {
        toks = strtok( trap.script_parameters, ";" );
        
        if ( toks.size > 0 )
        {
            trap.onduration = float( toks[ 0 ] );
            
            if ( toks.size > 1 )
            {
                trap.offduration = float( toks[ 1 ] );
            }
        }
    }
    
    fxscriptable = spawnscriptable( %"ztron_air_fan", trap.origin, trap.angles );
    trap.fxscriptable = fxscriptable;
    trap.fxscriptable setscriptablepartstate( "air_fan", "off" );
    dir = vectornormalize( anglestoforward( trap.angles ) );
    start = trap.origin;
    end = trap.origin + dir * 180;
    center = start + ( end - start ) / 2;
    size = ( distance( start, end ) / 2, 35, 35 );
    trigger = spawn( "trigger_box", center, 0, size, size );
    trigger.owner = trap;
    trigger.angles = trap.angles;
    trigger.dir = dir;
    trap.trigger = trigger;
    trap thread function_620bdefd07960c6d();
    trap thread function_dd16eda9f06ed675();
    
    /#
        if ( getdvarint( @"hash_e0d1acd921d5fdb5", 0 ) >= 1 )
        {
            trigger thread ztron_debug::drawtrigger();
        }
    #/
}

// Namespace namespace_4b3d6a3674393369
// Params 0
// Checksum 0x58eb2d48, Offset: 0x40c
// Size: 0x94
function function_620bdefd07960c6d()
{
    self endon( #"death", #"destroy_hazard" );
    
    while ( isdefined( self ) )
    {
        wait self.offduration;
        self.fxscriptable setscriptablepartstate( "air_fan", "on" );
        trigger::makeenterexittrigger( self.trigger, &function_6f5b29731d137c1f, undefined, undefined, undefined, &function_d1b8781a5a9c9025 );
        wait self.onduration;
        self.fxscriptable setscriptablepartstate( "air_fan", "off" );
        self.trigger notify( #"hash_73537c07898a047a" );
    }
}

// Namespace namespace_4b3d6a3674393369
// Params 3
// Checksum 0x48fd2482, Offset: 0x4a8
// Size: 0x64, Type: bool
function function_d1b8781a5a9c9025( enteringentity, trigger, payload )
{
    if ( !isplayer( enteringentity ) )
    {
        return true;
    }
    
    if ( enteringentity.var_3729e99427f12e73 || enteringentity.ztron.boss )
    {
        return true;
    }
    
    if ( player::isinlaststand( enteringentity ) )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_4b3d6a3674393369
// Params 3
// Checksum 0xb971eb4c, Offset: 0x515
// Size: 0x35
function function_6f5b29731d137c1f( enteringentity, trigger, payload )
{
    enteringentity utility::knockback_flat( trigger.dir, 800 );
}

// Namespace namespace_4b3d6a3674393369
// Params 0
// Checksum 0x353bdb9e, Offset: 0x552
// Size: 0x86
function function_dd16eda9f06ed675()
{
    self notify( #"hash_856f957f3ff53092" );
    self endon( #"hash_856f957f3ff53092" );
    level endon( #"ztron_game_is_over" );
    thread ztron_hazard::function_4d643b159a80c647( 1 );
    self waittill( #"destroy_hazard" );
    
    if ( isdefined( self.fxscriptable ) )
    {
        self.fxscriptable freescriptable();
        self.fxscriptable = undefined;
    }
    
    if ( isdefined( self.trigger ) )
    {
        self.trigger delete();
        self.trigger = undefined;
    }
}

