#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_co_sm_flat\gen\mp_sat_co_sm_flat_art;
#using scripts\mp\maps\mp_sat_co_sm_flat\mp_sat_co_sm_flat_fx;
#using scripts\mp\maps\mp_sat_co_sm_flat\mp_sat_co_sm_flat_lighting;

#namespace mp_sat_co_sm_flat;

// Namespace mp_sat_co_sm_flat
// Params 0
// Checksum 0x39f5ff8d, Offset: 0x12c
// Size: 0x90
function main()
{
    mp_sat_co_sm_flat_art::main();
    namespace_790af16636933b09::main();
    namespace_6a8c18b10db3ceb7::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_co_sm_flat" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

