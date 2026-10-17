#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_ava_rm_dig\gen\mp_sat_ava_rm_dig_art;
#using scripts\mp\maps\mp_sat_ava_rm_dig\mp_sat_ava_rm_dig_fx;
#using scripts\mp\maps\mp_sat_ava_rm_dig\mp_sat_ava_rm_dig_lighting;

#namespace mp_sat_ava_rm_dig;

// Namespace mp_sat_ava_rm_dig
// Params 0
// Checksum 0x625ab9f3, Offset: 0x155
// Size: 0xc6
function main()
{
    mp_sat_ava_rm_dig_art::main();
    namespace_b8dbd24d3a6fa9b3::main();
    namespace_7cca39cf72293469::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    compass::setupminimap( "compass_map_mp_sat_ava_rm_dig" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

