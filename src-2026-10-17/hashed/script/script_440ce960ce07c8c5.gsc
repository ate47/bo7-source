#using script_1aae2eb1ef28b239;
#using script_636bd827a012af12;
#using script_66878054d141dbc0;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\coop;
#using scripts\mp\gameobjects;
#using scripts\mp\gametypes\ob_gametype_story_mission;
#using scripts\mp\maps\mp_sat_ob_leo\mp_sat_ob_leo_audio;
#using scripts\mp\maps\mp_sat_ob_leo\mp_sat_ob_leo_util;

#namespace namespace_4891183a38168ea3;

/#

    // Namespace namespace_4891183a38168ea3
    // Params 0
    // Checksum 0xfc2f81fd, Offset: 0x1bc
    // Size: 0x5, Type: dev
    function function_151d753a7e697233()
    {
        
    }

#/

// Namespace namespace_4891183a38168ea3
// Params 0, eflags: 0x5
// Checksum 0x6cd08f5, Offset: 0x1c9
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_c53d4af0fcdc0fae", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_4891183a38168ea3
// Params 0, eflags: 0x4
// Checksum 0x2f7b96ef, Offset: 0x1f2
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_LEO_FACILITY_TO_JUNGLE";
    activity_common::registeractivitytype( "OB_LEO_FACILITY_TO_JUNGLE", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_LEO_FACILITY_TO_JUNGLE", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_LEO_FACILITY_TO_JUNGLE", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_LEO_FACILITY_TO_JUNGLE", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_LEO_FACILITY_TO_JUNGLE" );
}

// Namespace namespace_4891183a38168ea3
// Params 0
// Checksum 0xabd31df0, Offset: 0x269
// Size: 0x5d
function activity_setup()
{
    level.request_ids = undefined;
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance facility_to_jungle_start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_4891183a38168ea3
// Params 0
// Checksum 0x36e6b7cf, Offset: 0x2ce
// Size: 0x3d
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level.current_activity = activity_instance;
    activity_instance thread facility_to_jungle_main();
}

// Namespace namespace_4891183a38168ea3
// Params 0
// Checksum 0x61181a02, Offset: 0x313
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_4891183a38168ea3
// Params 1
// Checksum 0x1e382f9d, Offset: 0x337
// Size: 0xb4
function player_joined_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
    
    foreach ( player in player_list )
    {
        activity_instance thread player_setup( player );
    }
}

/#

    // Namespace namespace_4891183a38168ea3
    // Params 0
    // Checksum 0xbb9525ed, Offset: 0x3f3
    // Size: 0x5, Type: dev
    function function_7b253d2a921e4cbd()
    {
        
    }

#/

// Namespace namespace_4891183a38168ea3
// Params 1
// Checksum 0xd85ad82b, Offset: 0x400
// Size: 0x19
function player_setup( player )
{
    activity_instance = self;
}

// Namespace namespace_4891183a38168ea3
// Params 0
// Checksum 0xbb8fc849, Offset: 0x421
// Size: 0x2a
function facility_to_jungle_start()
{
    mp_sat_ob_leo_util::unlock_door( "atrium_to_nic_door" );
    thread mp_sat_ob_leo_util::function_5bc972408ebad07a();
    thread mp_sat_ob_leo_util::function_81942b7272d9ec15();
    hwconfiguratoraddasset( %"hw_sat_ob_fogheightmapfade_1" );
}

// Namespace namespace_4891183a38168ea3
// Params 0
// Checksum 0x699b5404, Offset: 0x453
// Size: 0x1e1
function facility_to_jungle_main()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    if ( !level utility::flag( "facility_escape_2_complete" ) )
    {
        struct = utility::getstruct( "facility_to_jungle_door_interact" );
        prompt = gameobjects::createhintobject( struct.origin, "HINT_BUTTON", undefined, &"mp_dmz_locks/unlock_door" );
        prompt waittill( #"trigger", player );
        prompt delete();
    }
    
    structs = ob_story_mission_utils::get_activity_starts( "OB_LEO_JUNGLE_INTRO" );
    initiator_struct = utility::getstruct( "facility_to_jungle_door_interact" );
    level thread coop::play_cinematic( "sat_leo_igc_trans_nic", { #initiator:initiator_struct, #timeout:77, #flag:"flag_leo_transition_igc_done", #flag_countdown:"flag_leo_transition_igc_start", #structs:structs } );
    level utility::flag_wait( "flag_leo_transition_igc_start" );
    level notify( #"hash_e9f85cf1a2dc8e0d" );
    
    foreach ( player in level.players )
    {
        player thread leo_audio::function_92b919d7fcfede0f();
    }
    
    utility::stop_exploder( "facility_cradle_volumes" );
    level utility::flag_wait( "flag_leo_transition_igc_done" );
    thread namespace_a350a26c6d662a6a::function_9ac30cec520d32b6( "light", 3 );
    hwconfiguratorremoveasset( %"hw_sat_ob_fogheightmapfade_1" );
    level utility::flag_set( "facility_to_jungle_complete" );
    activity_instance_common::endactivity( activity_instance, 1 );
}

