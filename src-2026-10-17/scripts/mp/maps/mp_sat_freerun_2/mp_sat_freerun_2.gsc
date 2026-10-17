#using scripts\common\active_env\moving_platforms;
#using scripts\common\active_env\portals;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_freerun_2\gen\mp_sat_freerun_2_art;
#using scripts\mp\maps\mp_sat_freerun_2\mp_sat_freerun_2_fx;
#using scripts\mp\maps\mp_sat_freerun_2\mp_sat_freerun_2_lighting;

#namespace mp_sat_freerun_2;

// Namespace mp_sat_freerun_2
// Params 0
// Checksum 0xec949ed1, Offset: 0x114
// Size: 0x85
function main()
{
    mp_sat_freerun_2_art::main();
    namespace_4dcde0bad4940e38::main();
    namespace_db88d71c64a05746::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_freerun_2" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread moving_platforms::moving_platforms_init();
    level thread portals::portals_init();
}

