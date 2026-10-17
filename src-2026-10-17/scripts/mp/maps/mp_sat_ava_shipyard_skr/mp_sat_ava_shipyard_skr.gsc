#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_ava_shipyard_skr\gen\mp_sat_ava_shipyard_skr_art;
#using scripts\mp\maps\mp_sat_ava_shipyard_skr\mp_sat_ava_shipyard_skr_fx;
#using scripts\mp\maps\mp_sat_ava_shipyard_skr\mp_sat_ava_shipyard_skr_lighting;

#namespace mp_sat_ava_shipyard_skr;

// Namespace mp_sat_ava_shipyard_skr
// Params 0
// Checksum 0xd84e3c3d, Offset: 0x11b
// Size: 0x75
function main()
{
    mp_sat_ava_shipyard_skr_art::main();
    namespace_23f8ae5573a91bba::main();
    namespace_e66c6632f40e1320::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_ava_shipyard_skr" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

