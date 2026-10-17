#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_hazard;
#using scripts\mp\zm\ztron\ztron_main;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_b707a42eddfb6cf4;

// Namespace namespace_b707a42eddfb6cf4
// Params 0, eflags: 0x5
// Checksum 0x8acc71b4, Offset: 0x12a
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_5a6d7094e41a1d3d", #"hash_4599115b7d4d2ff0", undefined, &init );
}

// Namespace namespace_b707a42eddfb6cf4
// Params 0
// Checksum 0x4c8dba8e, Offset: 0x153
// Size: 0x4f
function init()
{
    ztron_hazard::function_6f661fac5fd31f1( #"fireball", #"create", &function_f8b3e1f72186d094 );
    ztron_hazard::function_6f661fac5fd31f1( #"fireball", #"arenaspawn", &function_5efc8ea63b8db9bb );
    ztron_sound::function_4ac735395b173fe( "ztron_fireball_emit", "zmb_ztron_fireball_emit" );
}

// Namespace namespace_b707a42eddfb6cf4
// Params 0
// Checksum 0x2f714546, Offset: 0x1aa
// Size: 0x4a
function function_307b74ef26cc307f()
{
    self notify( #"hash_e46ff54a43f0c4d8" );
    self endon( #"hash_e46ff54a43f0c4d8" );
    thread ztron_hazard::function_4d643b159a80c647();
    self waittill( #"destroy_hazard" );
    waitframe();
    
    if ( isdefined( self.hazard ) )
    {
        self.hazard delete();
    }
}

// Namespace namespace_b707a42eddfb6cf4
// Params 2
// Checksum 0x59f97505, Offset: 0x1fc
// Size: 0x11d
function function_f8b3e1f72186d094( trap, paged )
{
    trap.weapon = level.ztron.fireballweapon;
    
    if ( isdefined( trap.script_parameters ) )
    {
        toks = strtok( trap.script_parameters, ";" );
        
        if ( toks.size > 0 )
        {
            trap.model = toks[ 0 ];
            
            if ( toks[ 1 ] == "gravity" )
            {
                trap.weapon = level.ztron.var_f8817e403683ca16;
            }
        }
    }
    
    if ( !isdefined( trap.model ) )
    {
        trap.model = "ztron_fireball_trap";
    }
    
    hazard = utility::spawn_model( trap.model, trap.origin, trap.angles );
    trap.hazard = hazard;
    trap.velocity = 200;
    trap thread function_2ddd57986a26b331();
    return trap;
}

// Namespace namespace_b707a42eddfb6cf4
// Params 0
// Checksum 0x5545cf8d, Offset: 0x322
// Size: 0xf7
function function_5efc8ea63b8db9bb()
{
    level.ztron.var_803907f9bdaeaa4d = [];
    level.ztron.fireballweapon = makeweapon( "sat_la_ztron_fireball" );
    level.ztron.var_f8817e403683ca16 = makeweapon( "sat_la_ztron_fireball_gravity" );
    
    if ( ztron_main::function_4da200e9b8d58a3c() == 1 )
    {
        traps = level.ztron.active_arena ztron_arena::function_eb3bad474c41ae42( "fireball" );
    }
    
    foreach ( trap in traps )
    {
        function_f8b3e1f72186d094( trap );
    }
}

// Namespace namespace_b707a42eddfb6cf4
// Params 0
// Checksum 0xbead11b5, Offset: 0x421
// Size: 0x1c2
function function_2ddd57986a26b331()
{
    self notify( #"hash_4e0249c75e956ac1" );
    self endon( #"hash_4e0249c75e956ac1" );
    level endon( #"ztron_game_is_over" );
    self endon( #"death" );
    thread function_307b74ef26cc307f();
    
    if ( !isdefined( self.hazard ) )
    {
        self notify( #"destroy_hazard" );
        return;
    }
    
    self.hazard endon( #"death" );
    waitframe();
    
    if ( self.hazard tagexists( "tag_flash_lvl3_le" ) )
    {
        origin = self.hazard gettagorigin( "tag_flash_lvl3_le" );
        angles = self.hazard gettagangles( "tag_flash_lvl3_le" );
    }
    else
    {
        origin = self.hazard.origin;
        angles = self.hazard.angles;
    }
    
    basevelocity = self.velocity;
    veljitter = self.velocity * 0.08;
    minwait = 5;
    maxwait = 10;
    
    while ( true )
    {
        closestplayer = ztron_util::function_5daccb5b5c655ae5( origin, 1800 );
        
        if ( !isdefined( closestplayer ) )
        {
            wait 2;
            continue;
        }
        
        for ( rounds = randomint( 3 ) + 1; rounds > 0 ; rounds-- )
        {
            launchvector = 10000 * anglestoforward( angles );
            ztron_sound::ztron_playsound( "ztron_fireball_emit", undefined, self.hazard );
            magicbullet( self.weapon, origin, origin + launchvector );
            wait randomfloatrange( 1, 4 );
        }
        
        wait randomfloatrange( minwait, maxwait );
    }
}

