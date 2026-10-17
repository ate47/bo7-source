#using scripts\common\active_env\active_env;
#using scripts\common\utility;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_cortex\gen\mp_sat_cortex_art;
#using scripts\mp\maps\mp_sat_cortex\mp_sat_cortex_fx;
#using scripts\mp\maps\mp_sat_cortex\mp_sat_cortex_lighting;

#namespace mp_sat_cortex;

// Namespace mp_sat_cortex
// Params 0
// Checksum 0xc7a441a7, Offset: 0x184
// Size: 0x16b
function main()
{
    mp_sat_cortex_art::main();
    namespace_9ebfb127bd4e0823::main();
    namespace_2d893dfd24559d59::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_cortex" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    setdvar( @"hash_fbb8d521a6914269", 25 );
    setdvar( @"hash_592417bef799b135", 25 );
    setdvar( @"hash_3bdc2896f05e40ac", 0.8 );
    setdvar( @"hash_37f05b20e6e2b254", 100 );
    setdvar( @"hash_44a9f0f91a98f576", 100 );
    barrier = { #radiussquared:squared( 236 ), #origin:( 341, -595, 67 ) };
    level.var_3d1af6b4fa55bd37 = [ barrier ];
    level thread animation_suite::animationsuite();
    level thread function_b1e0810132ada350();
}

// Namespace mp_sat_cortex
// Params 0
// Checksum 0xd594022e, Offset: 0x2f7
// Size: 0xd6
function function_b1e0810132ada350()
{
    utility::flag_wait( "scriptables_ready" );
    var_217582839d71c362 = getentarray( "vent_cover_predictive_trig", #script_noteworthy );
    
    foreach ( t_trig in var_217582839d71c362 )
    {
        var_b6d831cd05f63805 = getentitylessscriptablearray( t_trig.target, #targetname );
        
        if ( var_b6d831cd05f63805.size == 0 )
        {
            continue;
        }
        
        scr_vent_cover = var_b6d831cd05f63805[ 0 ];
        scr_vent_cover thread active_env::vent_cover_watcher();
    }
}

