#using script_1aae2eb1ef28b239;
#using script_2a9058c1321cd25d;
#using script_61b40095fd0502f0;
#using script_636bd827a012af12;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\ai\ai_spawn_director_utility;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\gametypes\ob_gametype_story_mission;
#using scripts\mp\maps\mp_sat_ob_capricorn\mp_sat_ob_capricorn;
#using scripts\mp\maps\mp_sat_ob_capricorn\mp_sat_ob_capricorn_vo;
#using scripts\mp\mp_agent;

#namespace namespace_7f1127741c37730b;

// Namespace namespace_7f1127741c37730b
// Params 0, eflags: 0x5
// Checksum 0x4de1c75e, Offset: 0x275
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_e05bea3fd4a3d8da", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_7f1127741c37730b
// Params 0, eflags: 0x4
// Checksum 0xb5a6b47, Offset: 0x29e
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_CAPRICORN_HIJACK_BOSS";
    activity_common::registeractivitytype( "OB_CAPRICORN_HIJACK_BOSS", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_CAPRICORN_HIJACK_BOSS", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_CAPRICORN_HIJACK_BOSS", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_CAPRICORN_HIJACK_BOSS", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_CAPRICORN_HIJACK_BOSS" );
}

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0xfa78be35, Offset: 0x315
// Size: 0xa2
function activity_setup()
{
    level.request_ids = undefined;
    thread ob_story_mission_utils::item_spawn_weapon( "p1_activity_hijacked_boss_weapons", "hijack_staged_gear_clean_up", 1 );
    thread ob_story_mission_utils::item_spawn_equipment( "p1_activity_hijacked_boss_equipment", "hijack_staged_gear_clean_up", 1 );
    thread ob_story_mission_utils::function_fa27c4afc0f886da( "p1_activity_hijacked_boss_item", "hijack_staged_gear_clean_up", 1 );
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    mp_sat_ob_capricorn::set_minimap( "hijacked" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0x6cf0f99b, Offset: 0x3bf
// Size: 0x3d
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance main();
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0xf7f697a3, Offset: 0x404
// Size: 0x29
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
    level utility::flag_set( "hijack_staged_gear_clean_up" );
}

// Namespace namespace_7f1127741c37730b
// Params 1
// Checksum 0x7d6b372e, Offset: 0x435
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

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0x61742766, Offset: 0x4f1
// Size: 0xf
function start()
{
    activity_instance = self;
}

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0x796493a, Offset: 0x508
// Size: 0x13d
function main()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level utility::flag_set( "flag_igc_ended" );
    utility::flag_wait( "squad_play_begin" );
    
    if ( level.coop_reload == 1 )
    {
        mp_sat_ob_capricorn::function_4fb7fff71f7b9c03();
    }
    
    thread mp_sat_ob_capricorn_vo::function_4e424ef6fb2890c9();
    thread ob_story_mission_utils::objective_text_show( "OB_CAPRICORN_HIJACK_BOSS" );
    thread function_212c851ae24965bf();
    
    foreach ( player in level.players )
    {
        player utility::callsharedfunc( #"hint", #"add_simple", "hint_black_hat", &"sat_ob_story_missions_capricorn/black_hat_hint", 10 );
    }
    
    level utility::flag_wait( "flag_encounter_hijack_defend_vtol_reinforcement_completed" );
    
    if ( isalive( level.var_cfabb5f5e2963e56 ) )
    {
        level.var_cfabb5f5e2963e56 waittill( #"death" );
    }
}

// Namespace namespace_7f1127741c37730b
// Params 2, eflags: 0x4
// Checksum 0x9be99baf, Offset: 0x64d
// Size: 0x35, Type: bool
function private function_b9deac1ae17d690b( encounter_id, should_spawn_struct )
{
    if ( should_spawn_struct.var_c114be1c6909ec22 > 0 )
    {
        should_spawn_struct.var_c114be1c6909ec22--;
        return true;
    }
    
    return false;
}

// Namespace namespace_7f1127741c37730b
// Params 2, eflags: 0x4
// Checksum 0x74d3e0ba, Offset: 0x68b
// Size: 0x1e
function private function_259560a64c6624b1( encounter_id, userdata )
{
    thread function_1ca14f3f1fb14b9( encounter_id );
}

// Namespace namespace_7f1127741c37730b
// Params 0
// Checksum 0x267b8280, Offset: 0x6b1
// Size: 0xad
function function_212c851ae24965bf()
{
    level endon( #"hijack_boss_done" );
    should_spawn_struct = { #var_c114be1c6909ec22:1 };
    encounter_id = activity_ai_encounters::function_92b671064b0b1ce2( "encounter_hijack_defend", 1, 1, 1, 1 );
    ai_spawn_director::function_71b3c575c1426546( encounter_id, &defend_spawn_func );
    ai_spawn_director::function_c99d360d62c49a9c( encounter_id, &function_b9deac1ae17d690b, should_spawn_struct );
    ai_spawn_director::function_5a08798970350207( encounter_id, &function_259560a64c6624b1 );
    thread activity_ai_encounters::function_e9091e3a4b3537eb( self, "encounter_hijack_defend_vtol_reinforcement", "flag_encounter_hijack_defend_vtol_reinforcement_completed" );
    dawg_struct = utility::getstruct( "ai_encounter_capricorn_hijacked_reinforcement_dawg", "targetname" );
    level.var_cfabb5f5e2963e56 = spawn_dawg( dawg_struct );
    waitframe();
}

// Namespace namespace_7f1127741c37730b
// Params 1
// Checksum 0x5e5700a0, Offset: 0x766
// Size: 0x4d
function function_1ca14f3f1fb14b9( encounter_id )
{
    self notify( #"hash_efa11843e43a4a34" );
    level endon( #"hijack_boss_done" );
    self endon( #"hash_efa11843e43a4a34" );
    
    while ( ai_spawn_director::function_16096fa7d6fa6642( encounter_id, 0 ) )
    {
        waitframe();
    }
    
    level utility::flag_set( "hijack_boss_done" );
}

// Namespace namespace_7f1127741c37730b
// Params 1, eflags: 0x4
// Checksum 0x401ffb26, Offset: 0x7bb
// Size: 0x34
function private player_setup( player )
{
    activity_instance = self;
    utility::callsharedfunc( #"gametype", #"hash_b64530c1428fda8", player );
}

// Namespace namespace_7f1127741c37730b
// Params 4
// Checksum 0x71073632, Offset: 0x7f7
// Size: 0x6f
function defend_spawn_func( requestid, instance, agent, ai_data )
{
    closest_player = function_47c86977a18df38b( level.players, agent.origin );
    agent getenemyinfo( closest_player );
    agent forcethreatupdate();
    agent function_fa32376aaa88a7a2( closest_player.origin, 2048 );
}

// Namespace namespace_7f1127741c37730b
// Params 1, eflags: 0x4
// Checksum 0xa6e3571e, Offset: 0x86e
// Size: 0x98
function private spawn_dawg( struct )
{
    dawg = mp_agent::spawnnewagentaitype( "sat_dawg_sm", struct.origin, struct.angles, "team_hundred_ninety" );
    owner = utility::spawn_tag_origin( struct.origin, struct.angles );
    owner.team = "team_hundred_ninety";
    setupstruct = { #timeout_disabled:1 };
    dawg dawg::dawgpostinit( owner, setupstruct );
    return dawg;
}

// Namespace namespace_7f1127741c37730b
// Params 3, eflags: 0x4
// Checksum 0xe58c5585, Offset: 0x90f
// Size: 0xca
function private spawnaiencounter( encounter_targetname, activity_instance, shutdown_callback = undefined )
{
    encounter_ids = activity_instance activity_ai_encounters::function_dd54dae45031dade( encounter_targetname, 1, 1, 2, 1 );
    
    foreach ( encounter_id in encounter_ids )
    {
        activity_ai_encounters::function_202051e510314502( encounter_id, &function_10ce9a6dcccdd4a0, activity_instance );
        
        if ( isdefined( shutdown_callback ) )
        {
            ai_spawn_director::function_a49c35b72d6b6fea( encounter_id, shutdown_callback );
        }
    }
}

// Namespace namespace_7f1127741c37730b
// Params 2, eflags: 0x4
// Checksum 0xb746f930, Offset: 0x9e1
// Size: 0x1f
function private function_10ce9a6dcccdd4a0( request_id, activity_instance )
{
    activity_instance activity_ai_encounters::function_43917fc6522a277( request_id );
}

