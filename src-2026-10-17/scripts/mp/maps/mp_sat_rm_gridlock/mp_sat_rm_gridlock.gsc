#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_gridlock\gen\mp_sat_rm_gridlock_art;
#using scripts\mp\maps\mp_sat_rm_gridlock\mp_sat_rm_gridlock_fx;
#using scripts\mp\maps\mp_sat_rm_gridlock\mp_sat_rm_gridlock_lighting;

#namespace mp_sat_rm_gridlock;

// Namespace mp_sat_rm_gridlock
// Params 0
// Checksum 0xb2c9a640, Offset: 0x148
// Size: 0xeb
function main()
{
    mp_sat_rm_gridlock_art::main();
    namespace_9c9f8c0d689cab99::main();
    namespace_e7a432c923e915c7::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_gridlock" );
    setdvar( @"r_umbraminobjectcontribution", 8 );
    setdvar( @"hash_a09cd65f2dcf772d", 3500 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

