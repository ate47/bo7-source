#using script_1aae2eb1ef28b239;
#using script_34b50456e3922412;
#using script_49e4a4c208f44b76;
#using script_636bd827a012af12;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\chyron;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\gametypes\ob;
#using scripts\mp\gametypes\ob_gametype_story_mission;
#using scripts\mp\mp_agent;
#using scripts\mp\ob\systems\ob_item_select;

#namespace namespace_52c8ff3eed7be1af;

/#

    // Namespace namespace_52c8ff3eed7be1af
    // Params 0
    // Checksum 0x2942eef1, Offset: 0x401
    // Size: 0x5, Type: dev
    function function_151d753a7e697233()
    {
        
    }

#/

// Namespace namespace_52c8ff3eed7be1af
// Params 0, eflags: 0x5
// Checksum 0x3116e027, Offset: 0x40e
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_4e341988578dcc14", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0, eflags: 0x4
// Checksum 0xfa16f9e3, Offset: 0x437
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_ARIES_NM_JUNGLE";
    activity_common::registeractivitytype( "OB_ARIES_NM_JUNGLE", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_NM_JUNGLE", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_NM_JUNGLE", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_ARIES_NM_JUNGLE", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_ARIES_NM_JUNGLE" );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0
// Checksum 0x8778f3f2, Offset: 0x4ae
// Size: 0x5d
function activity_setup()
{
    level.request_ids = undefined;
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance nightmare_start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0
// Checksum 0xf5338bc7, Offset: 0x513
// Size: 0x5f
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level.current_activity = activity_instance;
    level.request_ids = [];
    
    if ( !ob::nightmare() )
    {
        activity_instance waittill( #"hash_1e9bc5e84aa89155" );
    }
    
    activity_instance thread nightmare_main();
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0
// Checksum 0xb475750e, Offset: 0x57a
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 1
// Checksum 0xa739a495, Offset: 0x59e
// Size: 0x9f
function player_joined_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    
    foreach ( player in player_list )
    {
        activity_instance thread player_setup( player );
    }
}

/#

    // Namespace namespace_52c8ff3eed7be1af
    // Params 0
    // Checksum 0x6ef84ae1, Offset: 0x645
    // Size: 0x5, Type: dev
    function function_7b253d2a921e4cbd()
    {
        
    }

#/

// Namespace namespace_52c8ff3eed7be1af
// Params 1
// Checksum 0xef0db6c5, Offset: 0x652
// Size: 0xc
function player_setup( player )
{
    
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0
// Checksum 0x5832df0e, Offset: 0x666
// Size: 0x2
function nightmare_start()
{
    
}

// Namespace namespace_52c8ff3eed7be1af
// Params 0
// Checksum 0xa6f3abcc, Offset: 0x670
// Size: 0x322
function nightmare_main()
{
    activity_instance = self;
    level.var_bd2748e149a8024b = self;
    level.nm_activity_instance = self;
    level.nm_activity_name = "OB_ARIES_NM_JUNGLE";
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    utility::add_fx( "spawn_smoke", "vfx_sat_levels_mp_odysseus_cradle_base_lrg" );
    level._effect[ "enemy_vfx" ] = loadfxasset( "vfx_sat_wc_ai_cradle_spawn_burst_med_01" );
    chyron::function_d41002779543c80e( undefined, 0.01, 0.01 );
    thread ob_nm_mode::watch_solo_player();
    struct = utility::getstruct( "struct_nm_ability_crate_jungle", "targetname" );
    ob_item_select::function_95f9ecc2af4693f6( struct.origin, "super_portal_summon", "super_black_hat", #"tactical" );
    struct = utility::getstruct( "struct_nm_ability_crate_gorge", "targetname" );
    
    if ( struct )
    {
        ob_item_select::function_95f9ecc2af4693f6( struct.origin, "super_annihilator", "super_war_machine", #"default" );
    }
    
    activity_instance thread ob_story_mission_utils::item_spawn_equipment( "struct_nm_medkit_jungle", "flag_nm_jungle_complete", 1 );
    var_be03be141abf5452 = utility::getstruct( "struct_jungle_br_circle_3", "targetname" );
    circle = ob_nm_mode::function_21689e5c8bddd87c( var_be03be141abf5452.origin, 1200 );
    ob_nm_mode::function_1f2648b3b22d9816( undefined, "nm_overlord_glich_start" );
    ob_nm_mode::setup_rhino_crates();
    level utility::flag_set( "flag_remote_robot_event" );
    level.enemy_count_array = [ 12, 16, 20, 24 ];
    level.var_193d16d74af520ea = 0.5;
    level.minion_kill_obj = level.players.size * 20 * 3;
    ob_nm_mode::killstreak_frenzy( "nm_jungle_boss_struct", undefined, "encounter_nm_jungle_activity", %"hash_7f68feaa2bf2247b" );
    ob_nm_mode::nightmare_prepare();
    ai_bosses = [];
    ai_bosses[ ai_bosses.size ] = "sat_dawg_ob_nm";
    ai_bosses[ ai_bosses.size ] = "sat_dawg_ob_nm";
    ai_bosses[ ai_bosses.size ] = "sat_dawg_ob_nm";
    ai_bosses[ ai_bosses.size ] = "sat_dawg_ob_nm";
    level.enemy_count_array = [ 8, 10, 12, 16 ];
    level.var_193d16d74af520ea = 2;
    level utility::flag_set( "flag_dawg_shield" );
    level utility::delaycall( 5, &utility::flag_set, "flag_disable_rhino_crates" );
    function_5441ab9ea4a96617( "struct_jungle_br_circle", "nm_jungle_boss_struct", 750, ai_bosses, undefined, "encounter_nm_jungle_miniboss", 0, 1, %"hash_53feffc32fc5202e" );
    level.enemy_count_array = undefined;
    level utility::flag_clear( "flag_dawg_shield" );
    level utility::flag_set( "aries_big_dawg_killed" );
    level utility::flag_set( "flag_disable_rhino_crates" );
    level thread ob_nm_mode::end_remote_robot();
    level utility::flag_clear( "flag_remote_robot_event" );
    level utility::flag_set( "flag_nm_jungle_complete" );
    ob_nm_mode::nightmare_teleport( "OB_ARIES_NM_BARGE" );
    level thread ob_nm_mode::function_5dd43e7cb0682d57( "struct_jungle_br_circle", "OB_ARIES_NM_BARGE" );
    
    if ( isdefined( circle ) )
    {
        circle delete();
    }
    
    level.nm_respawn_struct = undefined;
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 9
// Checksum 0x5835495, Offset: 0x99a
// Size: 0x3f6
function function_5441ab9ea4a96617( circle_struct, boss_struct, radius = 1500, main_boss = "sat_spawner_zombie_mimic_ob", static_circle = undefined, minion_encounter_name, big_boss = 0, spawn_minions = 1, objective_asset )
{
    ob_nm_mode::function_dedbe8ae66600dd7( "nm_overlord_boss_start", "nm_miniboss_start" );
    circle_struct = utility::getstruct( circle_struct, "targetname" );
    boss_struct = utility::getstructarray( boss_struct, "targetname" );
    boss_struct = arrayrandomize( boss_struct );
    level utility::flag_clear( "nightmare_encouter_done" );
    obj = objective_asset ?? %"hash_58ceb76ce380e3be";
    ob_story_mission_utils::objective_text_show( obj );
    time_modifier = ob_nm_mode::function_3fc7f1f10018b737( 360 );
    ob_story_mission_utils::objective_timer_update( time_modifier );
    level thread ob_nm_mode::wave_fail_timer( time_modifier );
    waitframe();
    num_bosses = 1;
    
    if ( level.players.size > 2 )
    {
        num_bosses = 2;
    }
    
    level.nm_bosses = num_bosses;
    level.var_ff552d2355510bb7 = 0;
    ob_story_mission_utils::function_315d79883d962ba7( level.var_ff552d2355510bb7, level.nm_bosses );
    level thread function_a2667269ff468c75( boss_struct[ 0 ] );
    wait 2;
    
    if ( isdefined( static_circle ) )
    {
        circle_move_time = 20;
        start_radius = 6000;
        circle = ob_nm_mode::function_21689e5c8bddd87c( circle_struct.origin, start_radius );
        circle brcirclemoveto( circle_struct.origin[ 0 ], circle_struct.origin[ 1 ], radius, circle_move_time );
        level thread ob_nm_mode::function_1ba5643bacfcc530( circle, circle_struct.origin, circle_struct.origin, start_radius, radius, circle_move_time );
        obj_id = ob_story_mission_utils::function_b9cb179f9577f32a( circle_struct.origin, 24 );
        wait circle_move_time;
        ob_story_mission_utils::function_db37c902cddcf209( obj_id );
    }
    
    level.var_8dc544962712d2ff = [];
    
    for ( i = 0; i < num_bosses ; i++ )
    {
        if ( isarray( main_boss ) )
        {
            enemy_type = main_boss[ i ];
        }
        else
        {
            enemy_type = main_boss;
        }
        
        if ( issubstr( enemy_type, "zom" ) )
        {
            team = "team_two_hundred";
        }
        else
        {
            team = "team_hundred_ninety";
        }
        
        spawn_pos = getclosestpointonnavmesh( boss_struct[ i ].origin );
        playfx( level._effect[ "enemy_vfx" ], spawn_pos + ( 0, 0, 32 ) );
        level.var_8dc544962712d2ff[ i ] = mp_agent::spawnnewagentaitype( enemy_type, spawn_pos, boss_struct[ i ].angles, team );
        level.var_8dc544962712d2ff[ i ] thread ob_nm_mode::miniboss_setup( enemy_type, self );
        level.var_8dc544962712d2ff[ i ].var_be5ccf6d16f6b59e = 1;
        
        if ( !big_boss )
        {
            thread ob_nm_mode::miniboss_objective( level.var_8dc544962712d2ff[ i ] );
        }
        
        waitframe();
    }
    
    level utility::flag_set( "nightmare_encouter_active" );
    
    if ( spawn_minions )
    {
        thread ob_nm_mode::minion_encounter( minion_encounter_name, "nightmare_encouter_done" );
    }
    
    while ( level.var_8dc544962712d2ff.size )
    {
        level.var_8dc544962712d2ff = utility::array_removedead_or_dying( level.var_8dc544962712d2ff );
        wait 0.5;
    }
    
    level notify( #"cleanup_minions" );
    level notify( #"hash_aefc5c470125baf8" );
    level utility::flag_clear( "nightmare_encouter_active" );
    level utility::flag_set( "nightmare_encouter_done" );
    level notify( #"stop_circle" );
    
    if ( isdefined( circle ) )
    {
        if ( isdefined( circle.mapcircle ) )
        {
            circle game_utility::questcircle_delete();
        }
        
        circle delete();
    }
    
    self.var_9be376218db54aba = undefined;
    ob_nm_mode::function_8ceb8d68eef92e5c( "nm_overlord_boss_dead" );
}

// Namespace namespace_52c8ff3eed7be1af
// Params 1
// Checksum 0xf00e606d, Offset: 0xd98
// Size: 0x8e
function function_a2667269ff468c75( struct )
{
    offset = ( 0, 0, 0 );
    tag = utility::function_1808878d1c511ce8( struct.origin + offset, struct.angles );
    playfxontag( level._effect[ "spawn_smoke" ], tag, "tag_origin" );
    wait 5;
    stopfxontag( level._effect[ "spawn_smoke" ], tag, "tag_origin" );
    tag delete();
}

