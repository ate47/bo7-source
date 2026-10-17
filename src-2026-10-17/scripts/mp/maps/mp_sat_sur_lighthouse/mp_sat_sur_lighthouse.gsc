#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sur_lighthouse\gen\mp_sat_sur_lighthouse_art;
#using scripts\mp\maps\mp_sat_sur_lighthouse\mp_sat_sur_lighthouse_fx;
#using scripts\mp\maps\mp_sat_sur_lighthouse\mp_sat_sur_lighthouse_lighting;

#namespace mp_sat_sur_lighthouse;

// Namespace mp_sat_sur_lighthouse
// Params 0
// Checksum 0x19935ccd, Offset: 0x119
// Size: 0x75
function main()
{
    mp_sat_sur_lighthouse_art::main();
    mp_sat_sur_lighthouse_fx::main();
    namespace_743b3b57350d259b::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_sur_lighthouse" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

