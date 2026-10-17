#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_ava_clifftown_skr\gen\mp_sat_ava_clifftown_skr_art;
#using scripts\mp\maps\mp_sat_ava_clifftown_skr\mp_sat_ava_clifftown_skr_fx;
#using scripts\mp\maps\mp_sat_ava_clifftown_skr\mp_sat_ava_clifftown_skr_lighting;

#namespace mp_sat_ava_clifftown_skr;

// Namespace mp_sat_ava_clifftown_skr
// Params 0
// Checksum 0xfa93126, Offset: 0x11c
// Size: 0x75
function main()
{
    mp_sat_ava_clifftown_skr_art::main();
    namespace_4128313564175cc6::main();
    namespace_8daca53823b8c5ac::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_ava_clifftown_skr" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

