#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_ava_fort_skr\gen\mp_sat_ava_fort_skr_art;
#using scripts\mp\maps\mp_sat_ava_fort_skr\mp_sat_ava_fort_skr_fx;
#using scripts\mp\maps\mp_sat_ava_fort_skr\mp_sat_ava_fort_skr_lighting;

#namespace mp_sat_ava_fort_skr;

// Namespace mp_sat_ava_fort_skr
// Params 0
// Checksum 0x18dd9079, Offset: 0x117
// Size: 0x75
function main()
{
    mp_sat_ava_fort_skr_art::main();
    namespace_1a9702c24a263c67::main();
    namespace_516e1d9bca14fcd::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_ava_fort_skr" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

