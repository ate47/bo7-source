#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_socotra2\gen\mp_sat_rm_socotra2_art;
#using scripts\mp\maps\mp_sat_rm_socotra2\mp_sat_rm_socotra2_fx;
#using scripts\mp\maps\mp_sat_rm_socotra2\mp_sat_rm_socotra2_lighting;

#namespace mp_sat_rm_socotra2;

// Namespace mp_sat_rm_socotra2
// Params 0
// Checksum 0xde54a122, Offset: 0x148
// Size: 0xca
function main()
{
    mp_sat_rm_socotra2_art::main();
    namespace_b4936fedcb3c7eff::main();
    namespace_9adcf82af28773a5::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_socotra2" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

