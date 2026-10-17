#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rift\gen\mp_sat_rift_art;
#using scripts\mp\maps\mp_sat_rift\mp_sat_rift_fx;
#using scripts\mp\maps\mp_sat_rift\mp_sat_rift_lighting;

#namespace mp_sat_rift;

// Namespace mp_sat_rift
// Params 0
// Checksum 0xcc063c58, Offset: 0x141
// Size: 0xca
function main()
{
    mp_sat_rift_art::main();
    namespace_7d20de44a36d8119::main();
    namespace_f0315036765b1f47::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rift" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

