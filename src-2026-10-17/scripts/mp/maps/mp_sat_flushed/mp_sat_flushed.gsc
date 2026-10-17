#using scripts\common\active_env\portals;
#using scripts\common\active_env\utility;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_flushed\gen\mp_sat_flushed_art;
#using scripts\mp\maps\mp_sat_flushed\mp_sat_flushed_fx;
#using scripts\mp\maps\mp_sat_flushed\mp_sat_flushed_lighting;

#namespace mp_sat_flushed;

// Namespace mp_sat_flushed
// Params 0
// Checksum 0x4e3ca1e8, Offset: 0x144
// Size: 0x15f
function main()
{
    mp_sat_flushed_art::main();
    namespace_b8e4d4871680c853::main();
    mp_sat_flushed_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_flushed" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    portals::portals_init();
    level thread animation_suite::animationsuite();
    weaponfilter = [ #"dawg":1, #"missile_turret":1, #"remote_turret":1 ];
    utility::setup_no_deploy_zones( weaponfilter );
    barrier = { #radiussquared:squared( 300 ), #origin:( -150, -2172, 59 ) };
    level.var_3d1af6b4fa55bd37 = [ barrier ];
    level.var_1094bbb6422bd39a = 1;
}

