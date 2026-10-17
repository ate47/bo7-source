#using script_1aae2eb1ef28b239;
#using script_636bd827a012af12;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;
#using scripts\mp\gametypes\ob_gametype_story_mission;

#namespace namespace_f87c33e0e013f75f;

// Namespace namespace_f87c33e0e013f75f
// Params 0, eflags: 0x5
// Checksum 0xa6ae2809, Offset: 0x9f
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_62e1aec6a7593a4a", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_f87c33e0e013f75f
// Params 0, eflags: 0x4
// Checksum 0xf77eef13, Offset: 0xc8
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_GEMINI_TUNNELS_INTRO";
    activity_common::registeractivitytype( "OB_GEMINI_TUNNELS_INTRO", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_TUNNELS_INTRO", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_TUNNELS_INTRO", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_TUNNELS_INTRO", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_GEMINI_TUNNELS_INTRO" );
}

// Namespace namespace_f87c33e0e013f75f
// Params 0
// Checksum 0xf8d33b2e, Offset: 0x13f
// Size: 0x5d
function activity_setup()
{
    level.request_ids = undefined;
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance tunnels_intro_start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_f87c33e0e013f75f
// Params 0
// Checksum 0xdbb49570, Offset: 0x1a4
// Size: 0x3d
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance tunnels_intro_main();
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_f87c33e0e013f75f
// Params 0
// Checksum 0xb91d63fe, Offset: 0x1e9
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_f87c33e0e013f75f
// Params 1
// Checksum 0xfb9978a4, Offset: 0x20d
// Size: 0xb4
function player_joined_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
    
    foreach ( player in player_list )
    {
        activity_instance thread tunnels_intro_player_setup( player );
    }
}

// Namespace namespace_f87c33e0e013f75f
// Params 0
// Checksum 0xafa73eb0, Offset: 0x2c9
// Size: 0xf
function tunnels_intro_start()
{
    activity_instance = self;
}

// Namespace namespace_f87c33e0e013f75f
// Params 0
// Checksum 0xc590ef44, Offset: 0x2e0
// Size: 0x30
function tunnels_intro_main()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    ob_story_mission_utils::function_6314f03dfe2adbc5();
}

// Namespace namespace_f87c33e0e013f75f
// Params 1
// Checksum 0x1e18e3f6, Offset: 0x318
// Size: 0x19
function tunnels_intro_player_setup( player )
{
    activity_instance = self;
}

