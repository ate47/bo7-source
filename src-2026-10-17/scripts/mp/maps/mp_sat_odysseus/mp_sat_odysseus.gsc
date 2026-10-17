#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_odysseus\gen\mp_sat_odysseus_art;
#using scripts\mp\maps\mp_sat_odysseus\mp_sat_odysseus_fx;
#using scripts\mp\maps\mp_sat_odysseus\mp_sat_odysseus_lighting;

#namespace mp_sat_odysseus;

// Namespace mp_sat_odysseus
// Params 0
// Checksum 0x2d27435, Offset: 0x131
// Size: 0xaf
function main()
{
    mp_sat_odysseus_art::main();
    namespace_a5718649ca26ca0d::main();
    namespace_3d3f3485f0e4bdb::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_odysseus" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

