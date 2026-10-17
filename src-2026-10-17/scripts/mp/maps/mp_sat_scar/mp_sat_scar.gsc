#using script_353e34c229ca1589;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_scar\gen\mp_sat_scar_art;
#using scripts\mp\maps\mp_sat_scar\mp_sat_scar_fx;
#using scripts\mp\maps\mp_sat_scar\mp_sat_scar_lighting;

#namespace mp_sat_scar;

// Namespace mp_sat_scar
// Params 0
// Checksum 0xf90ee848, Offset: 0x189
// Size: 0xef
function main()
{
    mp_sat_scar_art::main();
    namespace_a13bf892519cad8b::main();
    namespace_73da2803564f2d81::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_scar" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    callback::add( #"player_spawn_init", &on_spawn_init );
    level thread animation_suite::animationsuite();
    level thread function_c6113dde5ac43052();
}

// Namespace mp_sat_scar
// Params 1
// Checksum 0x87d38e81, Offset: 0x280
// Size: 0xc
function on_spawn_init( params )
{
    
}

// Namespace mp_sat_scar
// Params 0
// Checksum 0xe0a01aee, Offset: 0x294
// Size: 0x5f
function function_c6113dde5ac43052()
{
    level waittill( #"match_start_real_countdown" );
    wait 2;
    
    if ( ( !game_utility_mp::isroundbased() || !game[ "roundsPlayed" ] ) && level.gametype != "dm" )
    {
        wait 3;
        utility::exploder( "sat_scar_infil_missile" );
        wait 4.8;
        utility::exploder( "sat_scar_infil_explo" );
        wait 1;
    }
}

