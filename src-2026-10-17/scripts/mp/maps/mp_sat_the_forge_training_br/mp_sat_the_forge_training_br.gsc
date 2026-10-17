#using script_49e4a4c208f44b76;
#using scripts\common\active_env\moving_platforms;
#using scripts\common\utility;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\flags;
#using scripts\mp\gametypes\sat_training_course;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_the_forge_training_br\gen\mp_sat_the_forge_training_br_art;
#using scripts\mp\maps\mp_sat_the_forge_training_br\mp_sat_the_forge_training_br_fx;
#using scripts\mp\maps\mp_sat_the_forge_training_br\mp_sat_the_forge_training_br_lighting;

#namespace mp_sat_the_forge_training_br;

// Namespace mp_sat_the_forge_training_br
// Params 0
// Checksum 0x9ffa16a3, Offset: 0x1ce
// Size: 0xdd
function main()
{
    mp_sat_the_forge_training_br_art::main();
    namespace_b1610eb5b176e37f::main();
    namespace_9e6613e5c83b5425::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_the_forge_training_br" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    level.var_409cf34875e21eb5 = 0.5;
    level.var_75d8bf80bd40a615 = 175;
    level.var_6dd339a918cc7198 = 64;
    level.var_5ac924e35a6a476 = 0.3;
    
    if ( game_utility::getgametype() == "training_course" || game_utility::getgametype() == "br_training_course" )
    {
        thread sat_training_course::trainingcourse_init();
    }
    
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread animation_suite::animationsuite();
    level thread moving_platforms::moving_platforms_init();
}

// Namespace mp_sat_the_forge_training_br
// Params 0
// Checksum 0x9eee6829, Offset: 0x2b3
// Size: 0xce
function forge_turret_controller()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    var_d837ba3329221216 = getscriptablearray( "forge_turret", #script_noteworthy );
    var_9cdd550610bb80d9 = getscriptablearray( "turret_pigeon", #script_noteworthy );
    
    if ( var_d837ba3329221216.size == 0 || var_9cdd550610bb80d9.size == 0 )
    {
        return;
    }
    
    if ( level.prematchperiod > 0 )
    {
        flags::gameflagwait( "prematch_done" );
    }
    
    for ( i = 0; i < var_d837ba3329221216.size ; i++ )
    {
        var_d837ba3329221216[ i ] setscriptablepartstate( "base", "idle" );
        var_9cdd550610bb80d9[ i ] setscriptablepartstate( "base", "fly_in" );
        childthread function_e64afe1da9c9e504( var_d837ba3329221216[ i ], var_9cdd550610bb80d9[ i ] );
    }
}

// Namespace mp_sat_the_forge_training_br
// Params 2
// Checksum 0x56e8db1e, Offset: 0x389
// Size: 0x11b
function function_e64afe1da9c9e504( scr_forge_turret, var_e84a891c8565b66c )
{
    var_19369eb17170a50 = 0;
    var_d0e6552c7b13f061 = getdvarint( @"hash_aa28e36e07da4c54", 4 );
    var_99f989d038e733ce = getdvarint( @"hash_6aa38eb6bd5e7ab8", 1 );
    var_d0e6552c7b13f061 = max( 1, var_d0e6552c7b13f061 );
    var_99f989d038e733ce = max( 1, var_99f989d038e733ce );
    var_52d6df8a75442078 = 1;
    
    while ( true )
    {
        scr_forge_turret waittillmatch( #"scriptablenotification", #"idle_anim_done" );
        var_19369eb17170a50++;
        var_f3191c2eaf0284c8 = var_52d6df8a75442078 ? var_99f989d038e733ce : var_d0e6552c7b13f061;
        
        if ( var_19369eb17170a50 < var_f3191c2eaf0284c8 )
        {
            continue;
        }
        
        scr_forge_turret setscriptablepartstate( "base", "test_sequence" );
        var_e84a891c8565b66c setscriptablepartstate( "base", "turret_sequence" );
        var_52d6df8a75442078 = 0;
        scr_forge_turret waittillmatch( #"scriptablenotification", #"hash_b5c5532047d9d030" );
        scr_forge_turret setscriptablepartstate( "base", "idle" );
        var_e84a891c8565b66c setscriptablepartstate( "base", "fly_in" );
        var_19369eb17170a50 = 0;
    }
}

