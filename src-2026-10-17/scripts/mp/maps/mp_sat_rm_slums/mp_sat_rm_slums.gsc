#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_slums\gen\mp_sat_rm_slums_art;
#using scripts\mp\maps\mp_sat_rm_slums\mp_sat_rm_slums_fx;
#using scripts\mp\maps\mp_sat_rm_slums\mp_sat_rm_slums_lighting;

#namespace mp_sat_rm_slums;

// Namespace mp_sat_rm_slums
// Params 0
// Checksum 0xa33f599d, Offset: 0x145
// Size: 0xca
function main()
{
    mp_sat_rm_slums_art::main();
    namespace_9c632ca5bb341200::main();
    mp_sat_rm_slums_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_slums" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

