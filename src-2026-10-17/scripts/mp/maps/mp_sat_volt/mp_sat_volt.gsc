#using scripts\common\active_env\moving_platforms;
#using scripts\common\callbacks;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_volt\gen\mp_sat_volt_art;
#using scripts\mp\maps\mp_sat_volt\mp_sat_volt_fx;
#using scripts\mp\maps\mp_sat_volt\mp_sat_volt_lighting;

#namespace mp_sat_volt;

// Namespace mp_sat_volt
// Params 0
// Checksum 0x1e4c9a06, Offset: 0x18c
// Size: 0x1ae
function main()
{
    var_67ef742e93e9dfc = getent( "rotating_pipe", #targetname );
    probe = getent( "rotating_pipe_probe", "targetname" );
    probe linkto( var_67ef742e93e9dfc );
    mp_sat_volt_art::main();
    namespace_ccf427682e4ece45::main();
    namespace_1af3daf6893cd913::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_volt" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    callback::add( #"player_spawn_init", &on_spawn_init );
    level thread animation_suite::animationsuite();
    b_disable_mover = getdvarint( @"hash_2b53c975351f41b0", 0 );
    level thread moving_platforms::moving_platforms_init( b_disable_mover );
    setup_no_deploy_zones();
    barrier = { #radiussquared:squared( 360 ), #origin:( 468, 1199, 687 ) };
    level.var_3d1af6b4fa55bd37 = [ barrier ];
    setdvar( @"hash_1673bfd92c93a024", 296 );
    level.var_a79151b196b4e70c = 450;
}

// Namespace mp_sat_volt
// Params 1
// Checksum 0x857356f, Offset: 0x342
// Size: 0xc
function on_spawn_init( params )
{
    
}

// Namespace mp_sat_volt
// Params 0, eflags: 0x4
// Checksum 0x1a097fdf, Offset: 0x356
// Size: 0xd4
function private setup_no_deploy_zones()
{
    var_619d6a48f5a56867 = getentarray( "no_equipment_zone", #script_noteworthy );
    weaponfilter = [ #"dart_mark_zero":1, #"drone_launcher":1 ];
    
    foreach ( var_4f16c60769e4f39a in var_619d6a48f5a56867 )
    {
        var_4f16c60769e4f39a.weaponfilter = weaponfilter;
    }
    
    callback::callback( #"hash_500e33f5505ca842", { #var_619d6a48f5a56867:var_619d6a48f5a56867 } );
}

