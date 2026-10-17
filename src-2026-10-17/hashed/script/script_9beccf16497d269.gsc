#using script_2665134cf0e60190;
#using script_4a91b610b937b552;
#using script_584c09754585d57a;
#using scripts\common\utility;
#using scripts\mp\compass;
#using scripts\mp\load;

#namespace zm_sat_ztron4;

// Namespace zm_sat_ztron4
// Params 0
// Checksum 0xcab9a3ad, Offset: 0x10e
// Size: 0x75
function main()
{
    namespace_1f44eb06d6d7e754::main();
    namespace_856522730d793329::main();
    namespace_d2d9b85288057bd7::main();
    load::main();
    compass::setupminimap( "compass_map_zm_sat_ztron4" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level.ttlos_suppressasserts = 1;
    utility::flag_wait( "ztron_game_initialized" );
}

