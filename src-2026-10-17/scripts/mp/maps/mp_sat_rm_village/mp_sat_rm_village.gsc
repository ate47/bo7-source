#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_village\gen\mp_sat_rm_village_art;
#using scripts\mp\maps\mp_sat_rm_village\mp_sat_rm_village_fx;
#using scripts\mp\maps\mp_sat_rm_village\mp_sat_rm_village_lighting;

#namespace mp_sat_rm_village;

// Namespace mp_sat_rm_village
// Params 0
// Checksum 0x743d7032, Offset: 0x147
// Size: 0xca
function main()
{
    mp_sat_rm_village_art::main();
    namespace_579c63d49a9fa2be::main();
    mp_sat_rm_village_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_village" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

