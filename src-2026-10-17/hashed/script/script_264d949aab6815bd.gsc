#using script_1aae2eb1ef28b239;
#using script_636bd827a012af12;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;
#using scripts\mp\gametypes\ob_gametype_story_mission;

#namespace namespace_937f7263647a223f;

// Namespace namespace_937f7263647a223f
// Params 0, eflags: 0x5
// Checksum 0x50011d0c, Offset: 0x9c
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_a3d16c31b501a50", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_937f7263647a223f
// Params 0, eflags: 0x4
// Checksum 0x73173a73, Offset: 0xc5
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_ARIES_RIVER_INTRO";
    activity_common::registeractivitytype( "OB_ARIES_RIVER_INTRO", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_RIVER_INTRO", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_RIVER_INTRO", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_RIVER_INTRO", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_ARIES_RIVER_INTRO" );
}

// Namespace namespace_937f7263647a223f
// Params 0
// Checksum 0x44c99532, Offset: 0x13c
// Size: 0x5d
function activity_setup()
{
    level.request_ids = undefined;
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance river_intro_start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_937f7263647a223f
// Params 0
// Checksum 0x948fd8ba, Offset: 0x1a1
// Size: 0x3d
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance function_9c9ce336354ad59f();
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_937f7263647a223f
// Params 0
// Checksum 0x3d74b69e, Offset: 0x1e6
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_937f7263647a223f
// Params 1
// Checksum 0x86e038fe, Offset: 0x20a
// Size: 0xb4
function player_joined_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
    
    foreach ( player in player_list )
    {
        activity_instance thread function_2ff957d91463c8bd( player );
    }
}

// Namespace namespace_937f7263647a223f
// Params 0
// Checksum 0xdd7250d3, Offset: 0x2c6
// Size: 0xf
function river_intro_start()
{
    activity_instance = self;
}

// Namespace namespace_937f7263647a223f
// Params 0
// Checksum 0x446462f1, Offset: 0x2dd
// Size: 0x30
function function_9c9ce336354ad59f()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    ob_story_mission_utils::function_6314f03dfe2adbc5();
}

// Namespace namespace_937f7263647a223f
// Params 1
// Checksum 0xadae63d3, Offset: 0x315
// Size: 0x19
function function_2ff957d91463c8bd( player )
{
    activity_instance = self;
}

