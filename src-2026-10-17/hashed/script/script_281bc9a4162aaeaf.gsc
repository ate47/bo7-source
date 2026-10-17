#using script_1aae2eb1ef28b239;
#using script_34b50456e3922412;
#using script_55b30772fa27258;
#using script_636bd827a012af12;
#using script_6b10011ac07f7291;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\gametypes\ob;
#using scripts\mp\gametypes\ob_gametype_story_mission;
#using scripts\mp\interaction;
#using scripts\mp\maps\mp_sat_ob_libra\mp_sat_ob_libra_util;
#using scripts\mp\ob\systems\ob_item_select;

#namespace namespace_e35ae375c4ce8957;

/#

    // Namespace namespace_e35ae375c4ce8957
    // Params 0
    // Checksum 0xf78609, Offset: 0x5cb
    // Size: 0x5, Type: dev
    function function_151d753a7e697233()
    {
        
    }

#/

// Namespace namespace_e35ae375c4ce8957
// Params 0, eflags: 0x5
// Checksum 0xc92ae520, Offset: 0x5d8
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_28c84d1fcdd7736e", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0, eflags: 0x4
// Checksum 0xd3a3911b, Offset: 0x601
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_LIBRA_NM_3";
    activity_common::registeractivitytype( "OB_LIBRA_NM_3", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_LIBRA_NM_3", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_LIBRA_NM_3", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_LIBRA_NM_3", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_LIBRA_NM_3" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0xe51e498f, Offset: 0x678
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

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x975531ba, Offset: 0x6dd
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

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x9dc01df6, Offset: 0x744
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 1
// Checksum 0xc55f1ee8, Offset: 0x768
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

    // Namespace namespace_e35ae375c4ce8957
    // Params 0
    // Checksum 0x474d2219, Offset: 0x80f
    // Size: 0x5, Type: dev
    function function_7b253d2a921e4cbd()
    {
        
    }

#/

// Namespace namespace_e35ae375c4ce8957
// Params 1
// Checksum 0xdd35f2c5, Offset: 0x81c
// Size: 0x30
function player_setup( player )
{
    if ( isdefined( level.boss_struct ) )
    {
        player ob_story_mission_utils::function_16e0adef86e5d052( "ob_boss_nm_mech", level.boss_struct );
    }
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x7187b7f6, Offset: 0x854
// Size: 0x2
function nightmare_start()
{
    
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0xc79f510a, Offset: 0x85e
// Size: 0x16f
function nightmare_main()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level.var_bd2748e149a8024b = self;
    level.nm_activity_instance = self;
    level.nm_activity_name = "OB_LIBRA_NM_3";
    activity_instance thread ob_story_mission_utils::item_spawn_equipment( "struct_nm_boss_medkit", "flag_libra_nm_3_complete", 1 );
    thread namespace_4759598db99787a0::arena_teleport_trigger();
    thread namespace_4759598db99787a0::arena_teleport_trigger( "boss_teleport_trig_nm" );
    level thread setup_sentry_traps( "struct_nm_sentry_trap" );
    level utility::flag_set( "flag_turret_round" );
    struct = utility::getstruct( "struct_nm_3_crate", "targetname" );
    
    if ( struct )
    {
        ob_item_select::function_95f9ecc2af4693f6( struct.origin, "super_mega_jump", "super_grappling_hook", #"tactical" );
    }
    
    level._effect[ "enemy_vfx" ] = loadfxasset( "vfx_sat_wc_ai_cradle_spawn_burst_med_01" );
    level._effect[ "generator_death" ] = loadfxasset( "vfx_sat_levels_wc_cradle_site_clean_blast" );
    level._effect[ "harper_slam" ] = loadfxasset( "vfx_sat_wc_vgo_boss_hand_aoe_ring_01" );
    thread namespace_4759598db99787a0::init_boss_ffs();
    thread boss_vista();
    ob_nm_mode::function_1f2648b3b22d9816( undefined, "nm_overlord_glich_start" );
    thread ambient_mech();
    boss_fight( "struct_libra_nm_3", "struct_libra_nm_3_boss", 750, "sat_spawner_zombie_neptune_hvt_ob" );
    level utility::flag_set( "flag_libra_nm_3_complete" );
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_e35ae375c4ce8957
// Params 4
// Checksum 0x81bf8bb4, Offset: 0x9d5
// Size: 0x2c2
function boss_fight( circle_struct, boss_struct, radius, main_boss )
{
    ob_nm_mode::function_dedbe8ae66600dd7( "nm_overlord_boss_start", "nm_boss_start" );
    self.var_9be376218db54aba = "sat_ob_objectivemarker_nm_big_boss";
    circle_struct = utility::getstruct( circle_struct, "targetname" );
    boss_struct = utility::getstruct( "struct_libra_nm_3_center", "targetname" );
    level utility::flag_clear( "nightmare_encouter_done" );
    ob_story_mission_utils::objective_text_show( %"hash_f401f4226f349fd" );
    num_bosses = 1;
    level.nm_bosses = num_bosses;
    level.var_ff552d2355510bb7 = 0;
    wait 3;
    level.final_boss_total_time = 660;
    ob_story_mission_utils::objective_timer_update( level.final_boss_total_time );
    level.final_boss_start_time = gettime();
    level thread ob_nm_mode::wave_fail_timer( level.final_boss_total_time );
    level.enemy_count_array = [ 8, 12, 16, 20 ];
    level.var_193d16d74af520ea = 0.5;
    function_a25acb62ddab20e2( "nm_minion_zombie", 1 );
    level.nm_activity_instance thread ob_nm_mode::minion_encounter( "encounter_nm_3_boss", "flag_falkner_dead" );
    level utility::flag_wait( "flag_mech_death_0" );
    
    foreach ( player in level.players )
    {
        player ob_story_mission_utils::function_5a707116af438c92();
    }
    
    foreach ( player in level.players )
    {
        if ( player.being_repulsed )
        {
            player pushplayervector( ( 0, 0, 0 ) );
            player.being_repulsed = 0;
        }
    }
    
    level notify( #"stop_mech_repulsor" );
    level utility::flag_set( "flag_falkner_dead" );
    level thread ob_nm_mode::function_70467d6be224da52( "nm_overlord_boss_dead" );
    level notify( #"cleanup_minions" );
    level utility::flag_clear( "nightmare_encouter_active" );
    level utility::flag_set( "nightmare_encouter_done" );
    level notify( #"hash_aefc5c470125baf8" );
    self.var_9be376218db54aba = undefined;
    ob_nm_mode::function_8ceb8d68eef92e5c( undefined, "nm_boss_end" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0xd86c9c4c, Offset: 0xc9f
// Size: 0xe
function function_bdbd212a7cddc11a()
{
    self endon( #"death" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x8c7ef4bd, Offset: 0xcb5
// Size: 0x141
function boss_vista()
{
    activateworldevent( "VFX_Libra_Boss_Arena_Ambient" );
    center_org = getent( "boss_rotator_1", #targetname );
    level.center_rotator = center_org;
    var_a72175da8072b605 = utility::spawn_tag_origin( center_org.origin, center_org.angles );
    level thread mp_sat_ob_libra_util::function_4f33c858a708f9d4( "boss_vista_spinning_sphere", 1, 4, 5, 10, "script_noteworthy", "stage3_done", 1, 1 );
    level.var_16bcb99dd9df160c = getentarray( "boss_floaties_outer", "targetname" );
    
    foreach ( floater in level.var_16bcb99dd9df160c )
    {
        floater linkto( var_a72175da8072b605 );
    }
    
    var_a72175da8072b605 thread namespace_4759598db99787a0::rotate_forever( ( 0, -90, 0 ), ( 0, 0, 32 ), 60, "stage1_done" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x9d0bb684, Offset: 0xdfe
// Size: 0x188
function ambient_mech()
{
    drop_spot = utility::getstruct( "mech_drop_spot", "targetname" );
    mech_pos_1 = utility::getstructarray( "mech_pos_1", "targetname" );
    mech_pos_2 = utility::getstructarray( "mech_pos_2", "targetname" );
    mech_positions = arraycombine( mech_pos_1, mech_pos_2 );
    self.var_9be376218db54aba = "sat_ob_objectivemarker_nm_big_boss";
    perimeter_mech = 1;
    base = undefined;
    new_mech = sat_libra_mech_turret::spawn_mech( drop_spot.origin, drop_spot.angles, undefined, "rocket", 0 );
    new_mech.goalradius = 128;
    new_mech.radius = 128;
    new_mech hudoutlineenable( "outline_nodepth_red" );
    new_mech aisetdesiredspeed( 100 );
    new_mech.disabledstate = 1;
    new_mech thread function_8e542965c89f7248();
    level.mech_obj_id = ob_story_mission_utils::function_804834359f20ef5a( new_mech, 196 );
    new_mech thread function_8bfde85e0340bd42( 0 );
    finisher_igc = utility::getstruct( "igc_boss_phase1_end", "targetname" );
    new_mech thread namespace_4759598db99787a0::function_95ebb5b311234fc8( mech_positions[ 0 ].origin, base, self, "stage1_done", 0, finisher_igc, 1, "sat_libra_debris_overlook_01", perimeter_mech );
    new_mech waittill( #"landed" );
    level utility::flag_set( "flag_mech_landed" );
    new_mech thread namespace_4759598db99787a0::mech_death_func( self, "kill_mech1a" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 1
// Checksum 0x8475580f, Offset: 0xf8e
// Size: 0x75
function function_8bfde85e0340bd42( mech_number )
{
    self waittill( #"disabled" );
    level notify( #"stop_mech_repulsor" );
    level utility::flag_set( "flag_mech_death_" + mech_number );
    level.nm_activity_instance ob_story_mission_utils::objective_marker_clear( level.mech_obj_id );
    playfx( level._effect[ "generator_death" ], self.origin );
    wait 2;
    sat_libra_mech_turret::function_c5e63fdb63bf7f14();
}

// Namespace namespace_e35ae375c4ce8957
// Params 1
// Checksum 0x5bf75eed, Offset: 0x100b
// Size: 0x95
function setup_sentry_traps( struct_name )
{
    a_structs = utility::getstructarray( struct_name, "targetname" );
    
    foreach ( struct in a_structs )
    {
        struct thread setup_individual_sentry();
    }
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x42e485f8, Offset: 0x10a8
// Size: 0x122
function setup_individual_sentry()
{
    level endon( #"hash_23dc72c206f93882" );
    
    while ( true )
    {
        model = spawn( "script_model", self.origin );
        model.angles = self.angles;
        model setmodel( %"streak_t10_wm_sentry_turret" );
        model hudoutlineenable( "outline_nodepth_yellow" );
        model setscriptablepartstate( #"visibility", #"show" );
        org = anglestoforward( self.angles ) * -24;
        spot = self.origin + org;
        interact = interaction::register_interact( spot + ( 0, 0, 40 ), 64, &turret_interacted, &"sat_ob_story_missions/interact_activate", undefined, undefined, undefined, "HINT_BUTTON" );
        interact.turret_struct = self;
        interact setuseholdduration( 0 );
        interact function_b7dbd12e52c5b2e1();
        interact makeunusable();
        
        if ( isdefined( model ) )
        {
            model delete();
        }
        
        interact delete();
        wait 45;
    }
}

// Namespace namespace_e35ae375c4ce8957
// Params 1
// Checksum 0x168e07df, Offset: 0x11d2
// Size: 0x2c
function turret_interacted( var_9d64a5e2cee72c8f )
{
    self notify( #"turret_used" );
    self.turret_struct ob_nm_mode::function_bd6063946e66442c( var_9d64a5e2cee72c8f, 30 );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0xf9eb1436, Offset: 0x1206
// Size: 0x27
function function_b7dbd12e52c5b2e1()
{
    level endon( #"hash_23dc72c206f93882" );
    self endon( #"turret_used" );
    level utility::flag_wait( "flag_disable_turret_interacts" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x5f8f94a1, Offset: 0x1235
// Size: 0x1b
function function_d4e0cda657cc111c()
{
    level endon( #"hash_3c3e1ed0939c3ded" );
    self waittill( #"damage" );
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0xb05cf9a4, Offset: 0x1258
// Size: 0x149
function function_8e542965c89f7248()
{
    self endon( #"death" );
    max_health = self.maxhealth;
    sat_libra_mech_turret::enable_left_arm();
    sat_libra_mech_turret::disable_right_arm();
    sat_libra_mech_turret::disable_mortar();
    
    while ( self.health > max_health * 0.8 )
    {
        waitframe();
    }
    
    namespace_4759598db99787a0::function_249fb430a585902();
    sat_libra_mech_turret::enable_right_arm();
    
    while ( self.health > max_health * 0.6 )
    {
        waitframe();
    }
    
    thread function_e91635720c6dde03();
    namespace_4759598db99787a0::function_9f96e43783063faa();
    sat_libra_mech_turret::enable_mortar();
    sat_libra_mech_turret::function_f0adce0c92372126();
    
    while ( self.health > max_health * 0.5 )
    {
        waitframe();
    }
    
    sat_libra_mech_turret::function_f0adce0c92372126();
    
    while ( self.health > max_health * 0.4 )
    {
        waitframe();
    }
    
    namespace_4759598db99787a0::function_249fb430a585902();
    sat_libra_mech_turret::function_f0adce0c92372126();
    
    while ( self.health > max_health * 0.3 )
    {
        waitframe();
    }
    
    sat_libra_mech_turret::function_f0adce0c92372126();
    
    while ( self.health > max_health * 0.2 )
    {
        waitframe();
    }
    
    thread function_e91635720c6dde03();
    namespace_4759598db99787a0::function_9f96e43783063faa();
    sat_libra_mech_turret::function_f0adce0c92372126();
    
    while ( self.health > max_health * 0.1 )
    {
        waitframe();
    }
    
    sat_libra_mech_turret::function_f0adce0c92372126();
}

// Namespace namespace_e35ae375c4ce8957
// Params 0
// Checksum 0x70627934, Offset: 0x13a9
// Size: 0x4f
function function_e91635720c6dde03()
{
    level utility::flag_set( "flag_skip_slam_below_check" );
    utility::waittill_any( "jumpfinished", "landed" );
    struct = utility::getstruct( "struct_libra_nm_3_center", "targetname" );
    level thread ob_nm_mode::function_fa2a4a74d04185e( struct.origin );
}

