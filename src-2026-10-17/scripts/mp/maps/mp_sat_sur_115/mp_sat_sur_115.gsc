#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sur_115\gen\mp_sat_sur_115_art;
#using scripts\mp\maps\mp_sat_sur_115\mp_sat_sur_115_fx;
#using scripts\mp\maps\mp_sat_sur_115\mp_sat_sur_115_lighting;

#namespace mp_sat_sur_115;

// Namespace mp_sat_sur_115
// Params 0
// Checksum 0xdc910975, Offset: 0x112
// Size: 0x75
function main()
{
    mp_sat_sur_115_art::main();
    namespace_38770ea9035da3e6::main();
    namespace_74cabe7c0b53fcc::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_sur_115" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

