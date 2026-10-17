#using script_6ab2268803ba358c;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sur_castle\gen\mp_sat_sur_castle_art;
#using scripts\mp\maps\mp_sat_sur_castle\mp_sat_sur_castle_fx;
#using scripts\mp\maps\mp_sat_sur_castle\mp_sat_sur_castle_lighting;

#namespace mp_sat_sur_castle;

// Namespace mp_sat_sur_castle
// Params 0
// Checksum 0x9e05e78c, Offset: 0x115
// Size: 0x84
function main()
{
    mp_sat_sur_castle_art::main();
    namespace_1f20d0c87cadd07d::main();
    namespace_be0e6bcb4c0f47cb::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_sur_castle" );
    level thread namespace_97cff5504410cab3::main();
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    setup_badplace();
}

// Namespace mp_sat_sur_castle
// Params 0
// Checksum 0x267fde93, Offset: 0x1a1
// Size: 0x74
function setup_badplace()
{
    var_cd07c866cb770ba9 = ( 1415, -22436, 231 );
    var_cd07c566cb770510 = ( 1447, -22676, 231 );
    createnavbadplacebybounds( var_cd07c866cb770ba9, ( 25, 25, 25 ), ( 0, 0, 0 ) );
    createnavbadplacebybounds( var_cd07c566cb770510, ( 80, 16, 25 ), ( 0, 15, 0 ) );
}

