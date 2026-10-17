#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_ava_hightown_skr\gen\mp_sat_ava_hightown_skr_art;
#using scripts\mp\maps\mp_sat_ava_hightown_skr\mp_sat_ava_hightown_skr_fx;
#using scripts\mp\maps\mp_sat_ava_hightown_skr\mp_sat_ava_hightown_skr_lighting;

#namespace mp_sat_ava_hightown_skr;

// Namespace mp_sat_ava_hightown_skr
// Params 0
// Checksum 0x69f5413f, Offset: 0x11b
// Size: 0x75
function main()
{
    mp_sat_ava_hightown_skr_art::main();
    namespace_5a99c5628b2bc9b8::main();
    namespace_95bfb9691d9596c6::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_ava_hightown_skr" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

