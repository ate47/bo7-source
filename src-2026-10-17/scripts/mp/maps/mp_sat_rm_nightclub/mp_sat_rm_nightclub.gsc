#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_nightclub\gen\mp_sat_rm_nightclub_art;
#using scripts\mp\maps\mp_sat_rm_nightclub\mp_sat_rm_nightclub_fx;
#using scripts\mp\maps\mp_sat_rm_nightclub\mp_sat_rm_nightclub_lighting;

#namespace mp_sat_rm_nightclub;

// Namespace mp_sat_rm_nightclub
// Params 0
// Checksum 0xf697199e, Offset: 0x149
// Size: 0xd5
function main()
{
    mp_sat_rm_nightclub_art::main();
    namespace_345c285b4b46c5f0::main();
    mp_sat_rm_nightclub_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_nightclub" );
    level.var_86587f097a6ea895 = 1;
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
}

