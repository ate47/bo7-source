#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_co_rm_veiled\gen\mp_sat_co_rm_veiled_art;
#using scripts\mp\maps\mp_sat_co_rm_veiled\mp_sat_co_rm_veiled_fx;
#using scripts\mp\maps\mp_sat_co_rm_veiled\mp_sat_co_rm_veiled_lighting;

#namespace mp_sat_co_rm_veiled;

// Namespace mp_sat_co_rm_veiled
// Params 0
// Checksum 0xc9e176f2, Offset: 0x149
// Size: 0xca
function main()
{
    mp_sat_co_rm_veiled_art::main();
    namespace_9ac9be78de06eb42::main();
    namespace_cecc7894beb44ae8::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_co_rm_veiled" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

