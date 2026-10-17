#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sm_chamber\gen\mp_sat_sm_chamber_art;
#using scripts\mp\maps\mp_sat_sm_chamber\mp_sat_sm_chamber_fx;
#using scripts\mp\maps\mp_sat_sm_chamber\mp_sat_sm_chamber_lighting;

#namespace mp_sat_sm_chamber;

// Namespace mp_sat_sm_chamber
// Params 0
// Checksum 0xb6b5182f, Offset: 0x115
// Size: 0x75
function main()
{
    mp_sat_sm_chamber_art::main();
    mp_sat_sm_chamber_fx::main();
    mp_sat_sm_chamber_lighting::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_sm_chamber" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

