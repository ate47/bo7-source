#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_co_rm_firingrange2\gen\mp_sat_co_rm_firingrange2_art;
#using scripts\mp\maps\mp_sat_co_rm_firingrange2\mp_sat_co_rm_firingrange2_fx;
#using scripts\mp\maps\mp_sat_co_rm_firingrange2\mp_sat_co_rm_firingrange2_lighting;

#namespace mp_sat_co_rm_firingrange2;

// Namespace mp_sat_co_rm_firingrange2
// Params 0
// Checksum 0x4763a88, Offset: 0x14f
// Size: 0xd5
function main()
{
    mp_sat_co_rm_firingrange2_art::main();
    namespace_d66e207d07cfd823::main();
    namespace_42b16c82786ced59::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_co_rm_firingrange2" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level.var_904399428c749bf6 = 1;
}

