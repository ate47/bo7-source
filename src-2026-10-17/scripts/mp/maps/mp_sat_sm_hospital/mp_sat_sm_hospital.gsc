#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sm_hospital\gen\mp_sat_sm_hospital_art;
#using scripts\mp\maps\mp_sat_sm_hospital\mp_sat_sm_hospital_fx;
#using scripts\mp\maps\mp_sat_sm_hospital\mp_sat_sm_hospital_lighting;

#namespace mp_sat_sm_hospital;

// Namespace mp_sat_sm_hospital
// Params 0
// Checksum 0x5f5012a8, Offset: 0x108
// Size: 0x81
function main()
{
    mp_sat_sm_hospital_art::main();
    namespace_b56b9691f77c97f3::main();
    mp_sat_sm_hospital_lighting::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_sm_hospital" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread animation_suite::animationsuite();
}

