#using script_16ea1b94f0f381b3;
#using scripts\asm\asm;
#using scripts\common\ai;
#using scripts\common\hud_util;
#using scripts\common\string;
#using scripts\common\system;
#using scripts\common\telemetry_utils;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\engine\utility;

#namespace val;

// Namespace val
// Params 0, eflags: 0x5
// Checksum 0x16da0e92, Offset: 0x15bc
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"val", undefined, &pre_main, undefined );
}

// Namespace val
// Params 0
// Checksum 0x501fe2a3, Offset: 0x15dd
// Size: 0x1a2f
function pre_main()
{
    if ( isdefined( level.var_955986e593f7c72a ) )
    {
        return;
    }
    
    level.var_955986e593f7c72a = 1;
    register( "breath_system", 1, 0, "$self", &function_d96998f0bfccd0af, "$value" );
    register( "damage", 1, 0, "$self", &function_980d507a19a6bda4, "$value" );
    register( "death", 1, 0, "$self", &function_fe5fe7cd67808fa1, "$value" );
    register( "damageshield", 0, 1, "$self", &function_51af51b23ad15aae, "$value" );
    register( "deathShieldThreshold", -1, -1, "$self", &function_c24a1bd2d82db73d, "$value" );
    register( "trigger_hurt_damage", 1, 0, "$self", &function_d570a4005ac0b537, "$value" );
    register( "interacts_with_oob_triggers", 1, 0 );
    register( "ignoresuppression", 0, 1, "$self", &function_eb87a62cdf0480f5, "$value" );
    register( "whizby", 1, 0 );
    register( "ignoreme", 0, 1, "$self", &function_95066ad96cccfad0, "$value" );
    register( "ignoreall", 0, 1, "$self", &function_c120622a6e09fe01, "$value" );
    register( "take_weapons", 0, 1, "$self", &set_takeweapons, "$value" );
    register( "weapon", 1, 0, "$self", &function_20dc6a278a598f22, "$value" );
    register( "weapon_switch", 1, 0, "$self", &function_fad3d2efb21d3796, "$value" );
    register( "weapon_switch_clip", 1, 0, "$self", &function_69663cfde5a760c0, "$value" );
    register( "script_weapon_switch", 0, 1 );
    register( "reload", 1, 0, "$self", &function_774a7b576d576eac, "$value" );
    register( "reload_speed", 1, 1, "$self", &function_a72eede1b3cfd014, "$value" );
    register( "weapon_pickup", 1, 0, "$self", &function_e208c91eb84ed565, "$value" );
    register( "fire", 1, 0, "$self", &function_14a1b35a268ca4b9, "$value" );
    register( "weapon_motion_ik", 1, 0, "$self", &function_d7a1169db9553b28, "$value" );
    register( "autoreload", 1, 0, "$self", &function_1fd9d609b5af3807, "$value" );
    register( "weapon_first_raise_anims", 1, 0, "$self", &function_f61e0e9b7270852f, "$value" );
    register( "weapon_inspect", 1, 0, "$self", &function_ae04fcfb3e401f12, "$value" );
    register( "offhand_weapons", 1, 0, "$self", &function_a1162f2424489dd0, "$value" );
    register( "force_enable_offhand_sprays", 0, 0, "$self", &function_a0d18b9a3de11d2e, "$value" );
    register( "toggle_remote_revive", 0, 1, "$self", &function_f7f7c8683c1d17b7, "$value" );
    register( "toggle_remote_self_revive", 0, 1, "$self", &function_ac426ec234868b04, "$value" );
    register( "ignore_afk", 0, 1, "$self", &function_19b569afca12ffd7, "$value" );
    register( "dont_evolve", 0, 1, "$self", &function_71e47286bc09401c, "$value" );
    register( "disallow_weapon_wallbuy", 0, 1, "$self", &disallow_weapon_wallbuy, "$value" );
    register( "disallow_wallbuy", 0, 1, "$self", &disallow_wallbuy, "$value" );
    register( "disallow_magicbox", 0, 1, "$self", &disallow_magicbox, "$value" );
    
    if ( !isdefined( level.ismp ) || level.ismp == 0 )
    {
        link( "offhand_weapons", "offhand_shield_weapons" );
    }
    
    register( "offhand_primary_weapons", 1, 0, "$self", &function_62d014caf91572e2, "$value" );
    register( "offhand_secondary_weapons", 1, 0, "$self", &function_36cea73c3b5fd96e, "$value" );
    link( "offhand_secondary_weapons", "offhand_shield_weapons" );
    register( "offhand_shield_weapons", 1, 0, "$self", &function_20012a3279532ca5, "$value" );
    register( "offhand_throwback", 1, 0, "$self", &function_37a151011f0964e7, "$value" );
    register( "allow_offhand_special", 1, 0, "$self", &function_6c087f6f845b9277, "$value" );
    register( "allow_aim_assist", 1, 0, "$self", &function_3a846d2682cc0f8c, "$value" );
    register( "usability", 1, 0, "$self", &function_d997fb9e4213c391, "$value" );
    register( "disallow_loot_but_auto_loot", 0, 1, "$self", &disallow_loot_but_auto_loot, "$value" );
    register( "disallow_usability_but_loot", 0, 1, "$self", &disallow_usability_but_loot, "$value" );
    register( "freezecontrols", 0, 1, "$self", &function_ef500d3d9308db93, "$value" );
    register( "freezecontrols_allowlook", 0, 1, "$self", &function_d9233b319f90661, "$value" );
    register( "hide", 0, 1, "$self", &set_hide, "$value" );
    register( "non_deletable", 0, 1, "$self", &function_77fbaaa4ebc4c291, "$value" );
    register( "health_regen", 1, 0, "$self", &set_health_regen, "$value" );
    register( "allow_health_regen_delay", 1, 0, "$self", &function_a7f500116a1c04b9, "$value" );
    register( "ignore_health_regen_delay", 0, 1, "$self", &set_ignore_health_regen_delay, "$value" );
    register( "allow_last_stand", 0, 0 );
    register( "stealth_social_reveal", 0, 1, "$self", &function_2005a18622e4bc7c, "$value" );
    register( "show_hud", 1, 0, "$self", &function_fb7abaa719858b69, "$value" );
    register( "show_weapon_hud", 1, 0, "$self", &function_ebf3d4d401322e8, "$value" );
    register( "show_dpad_hud", 1, 0, "$self", &function_c5e5bd6fb67422ed, "$value" );
    register( "show_targetmarker", 1, 0, "$self", &function_3bebe3c7d4a7d93d, "$value" );
    register( "world_fade", 0, 1, "$self", &function_e38774501aac185c, "$value", 0 );
    register( "total_fade", 0, 1, "$self", &function_4b876028b4dc4f0a, "$value", 0 );
    register( "hide_danger_indicator", 0, 1, "$self", &function_a68c2995da977451, "$value" );
    register( "allow_jump", 1, 0, "$self", &set_allowjump, "$value" );
    register( "allow_double_jump", 1, 0, "$self", &set_allowdoublejump, "$value" );
    register( "crouch", 1, 0, "$self", &set_allowcrouch, "$value" );
    register( "prone", 1, 0, "$self", &set_allowprone, "$value" );
    register( "stance_change", 1, 0, "$self", &function_1ae65704940e4424, "$value" );
    register( "melee", 1, 0, "$self", &set_allowmelee, "$value" );
    register( "lean", 1, 0, "$self", &set_allowlean, "$value" );
    register( "allow_melee_victim", 1, 0, "$self", &allow_melee_victim, "$value" );
    register( "mantle", 1, 0, "$self", &set_allowmantle, "$value" );
    register( "ledgehang", 1, 0, "$self", &function_5e9e3b2f69f6f529, "$value" );
    register( "mount_top", 1, 0, "$self", &set_allowmounttop, "$value" );
    register( "mount_side", 1, 0, "$self", &set_allowmountside, "$value" );
    register( "sprint", 1, 0, "$self", &set_allowsprint, "$value" );
    register( "jog", 1, 0, "$self", &set_allowjog, "$value" );
    register( "ads", 1, 0, "$self", &set_allowads, "$value" );
    register( "stand", 1, 0, "$self", &set_allowstand, "$value" );
    register( "allow_movement", 1, 0, "$self", &set_allowmovement, "$value" );
    register( "ladder", 1, 0, "$self", &set_allowladder, "$value" );
    register( "swimming", 1, 0, "$self", &function_a8117c7579bc7929, "$value" );
    register( "swimming_underwater", 1, 0, "$self", &function_7ab726a64720c8a4, "$value" );
    register( "swimming_sprint", 1, 0, "$self", &function_48acf32c9c54465c, "$value" );
    register( "swimming_jump", 1, 0, "$self", &function_115021318817a3e4, "$value" );
    register( "base_jumping", 1, 0, "$self", &function_a4ce58974995b16f, "$value" );
    register( "dtp", 1, 0, "$self", &function_1c864094a7f7b03c, "$value" );
    register( "desired_speed", 0, 0, "$self", &set_desiredspeed, "$value" );
    register( "goalradius", 2048, 2048, "$self", &function_cc381b7879a5f0d6, "$value" );
    register( "push_player", 0, 1, "$self", &set_pushplayer, "$value" );
    register( "skip_death", 0, 1, "$self", &function_1b5bfb0a108ea35, "$value" );
    register( "skip_scene_death", 0, 1, "$self", &function_2a5de6cbd48abe4e, "$value" );
    register( "supers", 1, 0, "$self", &function_877815b778be0789, "$value" );
    register( "super_pickup", 1, 1, "$self", &function_f9218624505e928d, "$value" );
    register( "super_switching", 1, 0, "$self", &function_68e3a3ac765536e7, "$value" );
    register( "wallrun", 1, 0, "$self", &function_19abbc82717ff6e, "$value" );
    register( "doublejump", 1, 0, "$self", &function_11ec4cf4a1f78d50, "$value" );
    register( "slide", 1, 0, "$self", &function_394d0e1971506f5a, "$value" );
    register( "execution_attack", 1, 0, "$self", &function_29d0c9f9c06a0716, "$value" );
    register( "execution_victim", 1, 0, "$self", &function_d8c73090e01eec0a, "$value" );
    register( "heavy_melee_execution_victim", 1, 0, "$self", &function_c024a5143db30f53, "$value" );
    register( "vehicle_use", 1, 0, "$self", &function_457b17f56ea93057, "$value" );
    register( "vehicle_lean_out", 1, 0, "$self", &function_2eaa66d57872ea23, "$value" );
    register( "vehicle_seat_switch", 1, 0, "$self", &function_8897b3febd975b3e, "$value" );
    register( "vehicle_exit", 1, 0 );
    register( "vehicle_predictive_ragdoll", 1, 0, "$self", &function_5724d3c9e7701db1, "$value" );
    register( "nvg", 1, 0, "$self", &function_bb0d10ecbfbeaeb9, "$value" );
    register( "supersprint", 1, 0, "$self", &function_797fbc5fdce1604, "$value" );
    register( "shellshock", 1, 0, "$self", &function_288bef4a53a454c1, "$value" );
    register( "cinematic_motion", 1, 0, "$self", &function_afc959ebf3565f45, "$value" );
    register( "armor", 1, 0, "$self", &function_ab098c39abd0a60, "$value" );
    register( "door_frozen", 0, 1, "$self", &function_77b5b0a45057d866, "$value" );
    register( "interactions", 1, 0, "$self", &function_36d470fc6707078c, "$value" );
    register( "action_slot_weapon", 1, 0, "$self", &function_48bbce421e2098f9, "$value" );
    register( "disallow_body_carry", 0, 1, "$self", &function_b3021de8b0f2163f, "$value" );
    register( "disallow_body_shield", 0, 1, "$self", &function_21150777a16023b1, "$value" );
    register( "no_bullet_miss_fx", 0, 1, "$self", &function_f01949d7ffcf11f7, "$value" );
    register( "allow_wall_jump", 1, 1, "$self", &function_df742befdf77ed04, "$value" );
    register( "allow_active_roll", 1, 1, "$self", &function_21ceb22acb454b71, "$value" );
    register( "allow_free_fire", 0, 0, "$self", &function_38e816a25d06e176, "$value" );
    register( "move_speed_scale", 1, 1, "$self", &set_movespeedscale, "$value" );
    register( "move_speed_scale_mult", 1, 1, "$self", &function_1b144c7826e01cfb, "$value" );
    link( "move_speed_scale", "move_speed_scale_mult", undefined, 1 );
    register( "equipment_primary", 1, 0, "$self", &function_2e13ccfdf6cd4702, "$value" );
    register( "equipment_secondary", 1, 0, "$self", &function_b2dbe5926fba028e, "$value" );
    register( "overlord_locked_priority", 0, 0, "$self", &function_89be635049f0ea2, "$value" );
    register( "backpack_inventory", 1, 0, "$self", &function_795d7b6d27c07c84, "$value" );
    register( "tacmap_scoreboard", 1, 0, "$self", &function_bfe2fb4299424726, "$value" );
    register( "demeanor", "", "", "$self", &set_demeanor, "$value" );
    register( "pain", 1, 0, "$self", &function_69c3c2915908991, "$value" );
    register( "special_pain", 1, 0, "$self", &function_fd5ee72fff1d88d1, "$value" );
    register( "infinite_ammo", 0, 1, "$self", &function_60c7f59590388bde, "$value" );
    register( "kill_on_damage", 0, 0, "$self", &function_45ca1867c7ce8e7b, "$value" );
    register( "reduce_damage_effects", 0, 0, "$self", &function_9323962b1e17315a, "$value" );
    register( "collide_with_ai_allies", 1, 0, "$self", &function_4241bb46ed306b16, "$value" );
    register( "script_pushable_by_ai", 1, 0, "$self", &function_a7120a590add6c5a, "$value" );
    register( "script_pushable", 1, 0, "$self", &function_1afc684096493969, "$value" );
    register( "hide_operator_backpack", 0, 1, "$self", &function_88432a9a2467d40f, "$value" );
    register( "show_operator_pet", 1, 0, "$self", &function_f8a70390aab483fd, "$value" );
    register( "allow_give_point", 1, 1, "$self", &function_d900bf1c1195ae61, "$value" );
    register( "allow_give_super_point", 1, 1, "$self", &function_834f82f25857f6fd, "$value" );
    register( "pause_zombie_spawning", 0, 0, "$self", &function_f3ae033c0e4d155a, "$value" );
    register( "show_healthbar", 1, 1, "$self", &function_cf1d129967b5281a, "$value" );
    register( "force_show_healthbar_distance", 0, 300, "$self", &function_9f3b98d1081b9f, "$value" );
    register( "play_ambient_vo", 1, 1, "$self", &function_a36d1e1879f4a10d, "$value" );
    register( "allow_vo", 1, 1, "$self", &function_ed80da93ca723446, "$value" );
    register( "toggle_eye_glow", 1, 1, "$self", &function_54063e236477cf2a, "$value" );
    register( "allow_unreachable_attack", 1, 1, "$self", &function_fa4076d1004abcca, "$value" );
    register( "trial_logic_activate", 1, 1, "$self", &function_be65061848197540, "$value" );
    register( "task_logic_activate", 1, 1, "$self", &function_37d8cd2d186b2a85, "$value" );
    register( "allow_combat_attractors", 1, 1, "$self", &function_c3e66f78aae7b54b, "$value" );
    register( "slide_boost", 1, 1 );
    register( "ignore_playable_area_check", 0, 1 );
    register( "allow_zm_perks", 1, 1, "$self", &function_ec7055bcdc1f62ce, "$value" );
    register( "show_perks", 1, 1, "$self", &function_3632b55e76251b18, "$value" );
    register( "show_perk_decay", 1, 1, "$self", &function_bfbaa9ffafdb11b2, "$value" );
    register( "allow_reload_without_reserve_ammo", 0, 0, "$self", &function_284901af56e908eb, "$value" );
    register( "allow_reload_when_clip_full", 0, 0, "$self", &function_7f187728abff100, "$value" );
    register( "attackeraccuracy", 1, 1, "$self", &function_2204daa2cfda7e2c, "$value" );
    register( "ascender_use", 1, 0 );
    register( "crate_use", 1, 0 );
    register( "cough_gesture", 1, 0 );
    register( "ladder_placement", 1, 0 );
    register( "killstreaks", 1, 0, "$self", &function_a887952f6b595ba4, [ "killstreaks", "$value" ] );
    register( "remote_killstreaks", 1, 0, "$self", &function_a887952f6b595ba4, [ "remote_killstreaks", "$value" ] );
    register( "one_hit_melee_victim", 1, 0 );
    register( "flashed", 1, 0 );
    register( "stunned", 1, 0 );
    register( "stick_kill", 1, 0 );
    register( "unresolved_collisions", 1, 0 );
    register( "third_person_toggle", 1, 0 );
    register( "wounded_movement", 1, 0, "$self", &function_5deacaf864fb85ed, "$value" );
    register( "disallow_knockdown", 0, 1, "$self", &function_ae7e2f9fa9af1fb9, "$value" );
    register( "disallow_stun", 0, 1, "$self", &function_14798c4cd3dbc753, "$value" );
    register( "postpone_stun", 0, 1, "$self", &function_e9c65c7b453edcbe, "$value" );
    register( "disallow_despawn", 0, 1, "$self", &function_b0fab434b7639bf3, "$value" );
    register( "disallow_bloat", 0, 1, "$self", &function_3380397d554174df, "$value" );
    register( "postpone_vortex_pull", 0, 1, "$self", &function_5a906779a5089c5c, "$value" );
    register( "disallow_slow", 0, 1, "$self", &function_72876b4dd52453b6, "$value" );
    register( "ignore_ai_collision", 0, 1, "$self", &function_8c8468a6d9dc1e2f, "$value" );
    register( "ammomod_immune", 0, 1, "$self", &function_d4ab365a2ed863cd, "$value" );
    register( "allow_dismember", 1, 0, "$self", &function_8c020e6b3e6f4762, "$value" );
    register( "allow_secondary_attack_damage", 1, 0, "$self", &function_d7aa041f31d7e32f, "$value" );
    register( "ignore_cleanup", 0, 0, "$self", &function_ef6599a498d90267, "$value" );
    register( "cleanup_dist_override", undefined, undefined, "$self", &function_ed3094fbf0019db1, "$value" );
    register( "round_spawning_ignore_player", 0, 0, "$self", &function_19b7ea3ee49651d7, "$value" );
    register( "cinematics_participant", 0, 1, "$self", &set_participating_cinematics, "$value" );
    register( "overlord_speaker", "", "", "$self", &function_c9229a2a21f96ce8, "$value" );
    register( "ai_corpse_sync", 0, 1, "$self", &function_2e0d6f33b91fc4f0, "$value" );
    register( "show_stealth_indicator", 1, 1, "$self", &function_79903c045c3972d, "$value" );
    register( "show_ui_objectives", 0, 1, "$self", &function_da9ccce0e519a93a, "$value" );
    register( "show_ui_out_of_bounds", 0, 1, "$self", &function_25f833b05462dfd6, "$value" );
    register( "cast_shadow", 1, 0, "$self", &function_61ad072a9fc2be42, "$value" );
    register( "allow_grab", 1, 0 );
    register( "allow_brot", 1, 1 );
    register( "allow_melee_me", 1, 1, "$self", &function_c071be98a06846b6, "$value" );
    register( "look_behavior", "", "", "$self", &function_60d142b5b57a7b87, "$value" );
    register( "allow_compass_messaging", 1, 0, "$self", &function_a887952f6b595ba4, [ "allow_compass_messaging", "$value" ] );
    register( "ai_lightweight", 0, 1, "$self", &function_9b639e1ff9e68cca, "$value" );
    register( "lerp_fov_scale", [ 1, 0.25 ], [ 0, 0.25 ], "$self", &function_f459c32aa8d402a3, "$value" );
    register( "allow_scripted_bgb_use", 1, 0, "$self", &function_c9ea465a772b3387, "$value" );
    register( "allow_revive_teammate", 1, 0 );
    register( "damage_knockback", 1, 1 );
    group_register( "allow_hud_in_cinematic_sequence", [ "show_hud", "show_hud_names", "cg_drawcrosshair" ] );
    register( "allow_emote", 1, 0 );
    register( "bypass_saving_throws", 0, 0 );
    
    foreach ( val in [ "allow_equipment_wheel", "allow_spy_cam", "allow_interactive_map", "allow_lockpick", "allow_keypad_puzzle", "allow_frequency_puzzle", "allow_cipher_puzzle", "allow_skill_select", "allow_reward_select", "allow_connection_puzzle" ] )
    {
        register( val, 1, 0, "$self", &function_a887952f6b595ba4, [ val, "$value" ] );
    }
    
    register( "high_net_lod", 0, 1, "$self", &function_a296153a12a6c8a3, "$value" );
    register( "ks_dont_forget", 0, 0, "$self", &function_a03a7e4c45ccf7ef, "$value" );
    register( "ai_eventlist", "", "", undefined, &function_e273ea3838556c26, "$value" );
    register( "stealth_ttlt_lkp", 8000, 8000, "$self", &function_13a57d8fbb96819b, "$value" );
    register( "stealth_ttlt_not_lkp", 3000, 3000, "$self", &function_458fa5173d52d835, "$value" );
    register( "default_time_to_drop_threat_sight", 10000, 10000, "$self", &function_73bc50501f1e58b1, "$value" );
    register( "global_esc_total_combat_time", -1, -1, "$self", &function_19800d31ca9a012e, "$value" );
    register( "global_esc_percent_threshold", 0.8, 0.8, "$self", &function_e3ffb01ce831f16a, "$value" );
    register( "vehicle_disallow_lockon", 0, 1, "$self", &function_ed1459761ea5620e, "$value" );
    register( "disallow_toggle_third_person", 0, 1, "$self", &function_1f0012a3819729d3, "$value" );
    register( "ignore_triggers", 0, 1, "$self", &function_66d62a72912f7e2b, "$value" );
    register( "hide_stowed_weapon", 0, 1, "$self", &function_7b797c8e0de52071, "$value" );
    register( "allow_battlechatter_vo", 1, 1, "$self", &function_ecab1eaf64e160fa, "$value" );
    register( "fire_time_scale", -1, 100, "$self", &function_2d21d242ff0f9794, "$value" );
    namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"hash_228e40841793f3bb", &function_9f44c474895e8804 );
    
    /#
        level thread debug_values();
        validate( "<dev string:x24>", "<dev string:x2e>", &function_7f502e3446daf922 );
        validate( "<dev string:x37>", "<dev string:x2e>", &function_f38faee63109c0a7 );
        validate( "<dev string:x40>", "<dev string:x2e>", &function_bba57c2f7dfb0704 );
    #/
}

// Namespace val
// Params 7
// Checksum 0x2e2e53, Offset: 0x3014
// Size: 0x138
function register( str_name, default_value, var_6740f247e90b0d6, call_on, func, args, var_595adb29a2481183 )
{
    assert( isstring( str_name ) );
    
    if ( !isdefined( level.values_ref ) )
    {
        level.values_ref = [];
    }
    
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        assertmsg( "<dev string:x50>" + str_name + "<dev string:x5b>" );
        return;
    }
    
    if ( isdefined( args ) )
    {
        if ( !isarray( args ) )
        {
            args = [ args ];
        }
        
        if ( args.size == 1 && args[ 0 ] == "$value" )
        {
            args = undefined;
        }
    }
    
    level.values_ref[ str_name ] = { #var_f329cf6970ab34d0:[], #var_595adb29a2481183:var_595adb29a2481183 ?? 1, #a_args:args, #var_6740f247e90b0d6:var_6740f247e90b0d6, #default_value:default_value, #func:func, #call_on:call_on == "$self" ? undefined : call_on, #str_name:str_name };
}

// Namespace val
// Params 1
// Checksum 0x22db1aa6, Offset: 0x3154
// Size: 0x25
function unregister( str_name )
{
    if ( isdefined( level.values_ref ) )
    {
        level.values_ref[ str_name ] = undefined;
    }
}

// Namespace val
// Params 2
// Checksum 0x2982f56a, Offset: 0x3181
// Size: 0x39
function group_register( group_name, value_names )
{
    if ( !isdefined( level.value_groups ) )
    {
        level.value_groups = [];
    }
    
    level.value_groups[ group_name ] = value_names;
}

// Namespace val
// Params 2
// Checksum 0xd220feab, Offset: 0x31c2
// Size: 0x65
function group_set( group_name, value )
{
    assert( isdefined( level.value_groups[ group_name ] ), "<dev string:x74>" + group_name + "<dev string:xa4>" );
    str_id = "_group_" + group_name;
    set_array( str_id, level.value_groups[ group_name ], value );
}

// Namespace val
// Params 1
// Checksum 0xad289121, Offset: 0x322f
// Size: 0x29
function group_reset( group_name )
{
    str_id = "_group_" + group_name;
    reset_all( str_id );
}

// Namespace val
// Params 4
// Checksum 0xff5f384e, Offset: 0x3260
// Size: 0x9b
function default_func( str_name, call_on, value, args )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        if ( isdefined( args ) && !isarray( args ) )
        {
            args = [ args ];
        }
        
        if ( !isdefined( args ) )
        {
            args = [];
        }
        
        s_value = level.values_ref[ str_name ];
        s_value.default_call_on = call_on;
        s_value.default_value = value;
        s_value.default_args = args;
    }
}

// Namespace val
// Params 4
// Checksum 0x82d94acf, Offset: 0x3303
// Size: 0x90
function link( str_name, var_6e3c291fc53ccd34, func, type = 0 )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        s_value = level.values_ref[ str_name ];
        s_value.links[ var_6e3c291fc53ccd34 ] = { #type:type, #func:func ?? &simple_link, #name:var_6e3c291fc53ccd34 };
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe6060204, Offset: 0x339b
// Size: 0xe
function private simple_link( b_value )
{
    return b_value;
}

// Namespace val
// Params 2
// Checksum 0xc51f92e6, Offset: 0x33b2
// Size: 0x55
function function_402f339f6d4125e5( str_name, handler )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        level.values_ref[ str_name ].var_f329cf6970ab34d0[ level.values_ref[ str_name ].var_f329cf6970ab34d0.size ] = handler;
    }
}

// Namespace val
// Params 2
// Checksum 0x14708f20, Offset: 0x340f
// Size: 0x57
function function_ec802d0a95cd1144( str_name, handler )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        level.values_ref[ str_name ].var_f329cf6970ab34d0 = arrayremove( level.values_ref[ str_name ].var_f329cf6970ab34d0, handler );
    }
}

// Namespace val
// Params 3
// Checksum 0x1799ed31, Offset: 0x346e
// Size: 0x17f
function set( str_id, str_name, value )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        if ( !isdefined( value ) )
        {
            value = level.values_ref[ str_name ].var_6740f247e90b0d6;
        }
        
        push_value( str_id, str_name, value );
        set_value( str_name, value );
        links = level.values_ref[ str_name ].links;
        
        if ( isarray( links ) )
        {
            foreach ( s_link in links )
            {
                switch ( s_link.type )
                {
                    case 0:
                        set( str_id, s_link.name, [[ s_link.func ]]( value ) );
                        break;
                    case 1:
                        set( str_id, s_link.name, [[ s_link.func ]]( get( s_link.name ) ) );
                        break;
                }
            }
        }
    }
}

// Namespace val
// Params 3
// Checksum 0x827da8a4, Offset: 0x35f5
// Size: 0x92
function set_array( str_id, var_2889f0bb4e2623fb, value )
{
    foreach ( str_name in var_2889f0bb4e2623fb )
    {
        set( str_id, str_name, value );
    }
}

// Namespace val
// Params 2
// Checksum 0x927ebbfd, Offset: 0x368f
// Size: 0x88
function reset_array( str_id, var_2889f0bb4e2623fb )
{
    foreach ( str_name in var_2889f0bb4e2623fb )
    {
        reset( str_id, str_name );
    }
}

// Namespace val
// Params 2
// Checksum 0xeeb89868, Offset: 0x371f
// Size: 0x166
function function_47773ece45ebba10( str_name, var_dfccd81e6793f145 )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        if ( isdefined( self.values ) && isdefined( self.values[ str_name ] ) )
        {
            if ( self.values[ str_name ].size )
            {
                saved_vals = self.values[ str_name ];
                
                foreach ( str_id, val in self.values[ str_name ] )
                {
                    foreach ( ignore_id in var_dfccd81e6793f145 )
                    {
                        if ( str_id == ignore_id )
                        {
                            saved_vals[ str_id ] = undefined;
                        }
                    }
                }
                
                if ( saved_vals.size )
                {
                    return saved_vals[ getlastarraykey( saved_vals ) ];
                }
            }
        }
        
        return get_default( str_name );
    }
}

// Namespace val
// Params 2
// Checksum 0x6239fef4, Offset: 0x388d
// Size: 0x4f
function function_fa30759d39b632a9( str_name, str_id )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        valuestates = self.values[ str_name ];
        
        if ( isdefined( valuestates ) && valuestates.size )
        {
            return valuestates[ str_id ];
        }
    }
}

// Namespace val
// Params 1
// Checksum 0xe3241b40, Offset: 0x38e4
// Size: 0x53
function get( str_name )
{
    if ( isdefined( level.values_ref[ str_name ] ) )
    {
        valuestates = self.values[ str_name ];
        
        if ( isdefined( valuestates ) && valuestates.size )
        {
            return valuestates[ getlastarraykey( valuestates ) ];
        }
        
        return get_default( str_name );
    }
}

// Namespace val
// Params 2
// Checksum 0x892c8075, Offset: 0x393f
// Size: 0x24
function set_radiant( str_name, value )
{
    set( "radiant", str_name, value );
}

// Namespace val
// Params 4
// Checksum 0x1849907a, Offset: 0x396b
// Size: 0x47
function set_for_time( n_time, str_id, str_name, value )
{
    self endon( "death" );
    set( str_id, str_name, value );
    wait n_time;
    reset( str_id, str_name );
}

// Namespace val
// Params 2
// Checksum 0xbca3e984, Offset: 0x39ba
// Size: 0x29
function reset( str_id, str_name )
{
    remove_value( str_id, str_name );
    reset_internal( str_id, str_name );
}

// Namespace val
// Params 2, eflags: 0x4
// Checksum 0x4806834c, Offset: 0x39eb
// Size: 0x120
function private reset_internal( str_id, str_name )
{
    valuestates = self.values[ str_name ];
    lastkey = undefined;
    
    if ( isdefined( valuestates ) )
    {
        lastkey = getlastarraykey( valuestates );
        
        if ( isdefined( lastkey ) )
        {
            value = valuestates[ lastkey ];
            set_value( str_name, value );
        }
    }
    
    if ( !isdefined( lastkey ) )
    {
        set_default( str_name );
    }
    
    if ( isarray( level.values_ref[ str_name ].links ) )
    {
        foreach ( s_link in level.values_ref[ str_name ].links )
        {
            reset( str_id, s_link.name );
        }
    }
}

// Namespace val
// Params 1
// Checksum 0x9aae9f5f, Offset: 0x3b13
// Size: 0xcf
function reset_all( str_id )
{
    if ( !( isdefined( self ) && isdefined( self.values ) ) )
    {
        return;
    }
    
    foreach ( str_name, valuestates in self.values )
    {
        lastkey = getlastarraykey( valuestates );
        
        if ( isdefined( self.values[ str_name ] ) )
        {
            self.values[ str_name ][ str_id ] = undefined;
        }
        
        if ( lastkey === str_id )
        {
            reset_internal( str_id, str_name );
        }
    }
}

// Namespace val
// Params 1
// Checksum 0x310f3f00, Offset: 0x3bea
// Size: 0x1a
function reset_radiant( str_name )
{
    reset( "radiant", str_name );
}

// Namespace val
// Params 1
// Checksum 0xb26743f9, Offset: 0x3c0c
// Size: 0x47
function nuke( str_name )
{
    if ( isdefined( self.values ) )
    {
        self.values[ str_name ] = undefined;
    }
    
    if ( level.values_ref[ str_name ].var_595adb29a2481183 )
    {
        set_default( str_name );
    }
}

// Namespace val
// Params 0
// Checksum 0x7b2bbffc, Offset: 0x3c5b
// Size: 0xfb
function nuke_all()
{
    if ( !isdefined( self.values ) )
    {
        return;
    }
    
    var_cbc1663e5003d56 = [];
    
    foreach ( str_name, value in self.values )
    {
        var_cbc1663e5003d56[ var_cbc1663e5003d56.size ] = str_name;
    }
    
    foreach ( str_name in var_cbc1663e5003d56 )
    {
        nuke( str_name );
    }
}

// Namespace val
// Params 1
// Checksum 0xad7b294, Offset: 0x3d5e
// Size: 0x192
function log_value( str_name )
{
    self_log = isent( self ) ? "Entity " + self getentitynumber() : "self";
    
    if ( !isdefined( self.values ) )
    {
        logstring( "[LOG_VALUE] " + self_log + " does not contain any values" );
        return;
    }
    
    if ( !isdefined( str_name ) )
    {
        logstring( "[LOG_VALUE] " + self_log + " contains the following values:" );
        
        foreach ( name, value_array in self.values )
        {
            if ( value_array.size > 0 )
            {
                log_value( name );
            }
        }
        
        return;
    }
    
    logstring( "[LOG_VALUE]     Logging IDs and Value for type:" + str_name );
    
    foreach ( key, value in self.values[ str_name ] )
    {
        if ( isdefined( key ) && isdefined( value ) )
        {
            logstring( "[LOG_VALUE]         ID: " + key + " -- Value: " + value );
        }
    }
}

// Namespace val
// Params 3, eflags: 0x4
// Checksum 0x8a04b7bf, Offset: 0x3ef8
// Size: 0x68
function private push_value( str_id, str_name, value )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.values ) )
    {
        self.values = [];
    }
    
    if ( !isdefined( self.values[ str_name ] ) )
    {
        self.values[ str_name ] = [];
    }
    
    self.values[ str_name ][ str_id ] = value;
}

// Namespace val
// Params 2, eflags: 0x4
// Checksum 0x387dd37, Offset: 0x3f68
// Size: 0x6f
function private remove_value( str_id, str_name )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isdefined( self.values[ str_name ] ) )
    {
        self.values[ str_name ][ str_id ] = undefined;
        
        if ( !self.values[ str_name ].size )
        {
            self.values[ str_name ] = undefined;
            
            if ( !self.values.size )
            {
                self.values = undefined;
            }
        }
    }
}

// Namespace val
// Params 2, eflags: 0x4
// Checksum 0x654cb2ad, Offset: 0x3fdf
// Size: 0x130
function private set_value( str_name, value )
{
    if ( isplayer( self ) )
    {
        self endon( "disconnect" );
    }
    
    s_value = level.values_ref[ str_name ];
    
    if ( isdefined( s_value.func ) )
    {
        call_on = s_value.call_on ?? self;
        
        if ( isdefined( s_value.a_args ) )
        {
            utility::single_func_argarray( call_on, s_value.func, replace_values( s_value.a_args, value ) );
        }
        else
        {
            call_on [[ s_value.func ]]( value );
        }
    }
    
    foreach ( handler in level.values_ref[ str_name ].var_f329cf6970ab34d0 )
    {
        [[ handler ]]( value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x80b12e51, Offset: 0x4117
// Size: 0xb5
function private get_default( str_name )
{
    default_value = undefined;
    s_value = level.values_ref[ str_name ];
    
    if ( isdefined( s_value.default_value ) )
    {
        if ( isfunction( s_value.default_value ) )
        {
            call_on = s_value.default_call_on == "$self" ? self : s_value.default_call_on;
            default_value = utility::single_func_argarray( call_on, s_value.default_value, replace_values( s_value.default_args ) );
        }
        else
        {
            default_value = s_value.default_value;
        }
    }
    
    return default_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xc0a70e80, Offset: 0x41d5
// Size: 0x30
function private set_default( str_name )
{
    default_value = get_default( str_name );
    
    if ( isdefined( default_value ) )
    {
        set_value( str_name, default_value );
    }
}

// Namespace val
// Params 3, eflags: 0x4
// Checksum 0x5ea9654f, Offset: 0x420d
// Size: 0xa8
function private function_de40350986e56615( array, str_value, replacement )
{
    array = arraycopy( array );
    
    foreach ( i, val in array )
    {
        if ( isstring( val ) && val == str_value )
        {
            array[ i ] = replacement;
        }
    }
    
    return array;
}

// Namespace val
// Params 2, eflags: 0x4
// Checksum 0xf421166b, Offset: 0x42be
// Size: 0x3e
function private replace_values( a_args, value )
{
    if ( isdefined( a_args ) )
    {
        a_args = function_de40350986e56615( a_args, "$self", self );
        a_args = function_de40350986e56615( a_args, "$value", value );
    }
    
    return a_args;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x442ef4b2, Offset: 0x4305
// Size: 0x135
function private function_9f44c474895e8804( params )
{
    str_name = params[ 0 ];
    
    foreach ( player in level.players )
    {
        player log_value( str_name );
    }
    
    ai_array = getaiarray();
    
    foreach ( ai in ai_array )
    {
        logstring( "[LOG_VALUE] Logging AI (" + ai getentitynumber() + ") of aitype: " + ai.agent_type );
        ai log_value( str_name );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcf4c41e9, Offset: 0x4442
// Size: 0x6e
function private function_980d507a19a6bda4( b_value = 0 )
{
    if ( isplayer( self ) )
    {
        if ( utility::issp() )
        {
            if ( b_value )
            {
                self disableinvulnerability();
            }
            else
            {
                self enableinvulnerability();
            }
        }
        else if ( level.var_c998633bab11f3f8 )
        {
            self.takedamage = b_value;
        }
        else
        {
            /#
                iprintln( "<dev string:xa9>" );
            #/
        }
        
        return;
    }
    
    self setcandamage( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x62ea0b86, Offset: 0x44b8
// Size: 0x31
function private function_d570a4005ac0b537( b_value = 0 )
{
    if ( b_value )
    {
        self.var_dbe8744e6b0a0409 = undefined;
        return;
    }
    
    self.var_dbe8744e6b0a0409 = 1;
}

// Namespace val
// Params 0, eflags: 0x4
// Checksum 0xfa9024e0, Offset: 0x44f1
// Size: 0x1a
function private function_7f502e3446daf922()
{
    if ( isplayer( self ) )
    {
        return !self isinvulnerable();
    }
    
    return self getcandamage();
}

// Namespace val
// Params 1
// Checksum 0x2b53db02, Offset: 0x4513
// Size: 0x4f
function function_fe5fe7cd67808fa1( b_value = 0 )
{
    if ( isdefined( self.deathshieldfunc ) )
    {
        self [[ self.deathshieldfunc ]]( !b_value );
    }
    
    if ( isagent( self ) )
    {
        self.var_62591663e6a187ce = b_value;
    }
    
    self.allowdeath = b_value;
}

// Namespace val
// Params 0, eflags: 0x4
// Checksum 0x605aebc5, Offset: 0x456a
// Size: 0xb
function private function_f38faee63109c0a7()
{
    return self.allowdeath;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3f1bfa7d, Offset: 0x457e
// Size: 0x20
function private function_51af51b23ad15aae( b_value = 1 )
{
    self.damageshield = b_value;
}

// Namespace val
// Params 0, eflags: 0x4
// Checksum 0xe8dcc714, Offset: 0x45a6
// Size: 0xb
function private function_bba57c2f7dfb0704()
{
    return self.damageshield;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8c5f7a8, Offset: 0x45ba
// Size: 0x34
function private function_c24a1bd2d82db73d( b_value = undefined )
{
    self.deathshieldthreshold = isnumber( b_value ) && b_value >= 0 ? b_value : undefined;
}

// Namespace val
// Params 0, eflags: 0x4
// Checksum 0xcfab87de, Offset: 0x45f6
// Size: 0x7
function private function_5ebabb94fa03eaa7()
{
    return self islookcontrolsfrozen();
}

// Namespace val
// Params 1
// Checksum 0x626d3e07, Offset: 0x4606
// Size: 0x1f
function function_eb87a62cdf0480f5( b_value = 0 )
{
    self.ignoresuppression = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3826595b, Offset: 0x462d
// Size: 0x17c
function private set_takeweapons_thread( b_value )
{
    self notify( "set_takeweapons_thread" );
    self endon( "set_takeweapons_thread" );
    self endon( "death_or_disconnect" );
    wait level.framedurationseconds * 3;
    
    if ( b_value )
    {
        if ( !isdefined( self.val_takeweapons ) )
        {
            self.val_takeweapons = { #current:self getcurrentweapon(), #weapons:self getweaponslistall() };
        }
        
        self takeallweapons();
        return;
    }
    
    if ( isdefined( self.val_takeweapons ) )
    {
        weaponselect = self.val_takeweapons.current;
        fallbackprimary = undefined;
        
        foreach ( weapon in self.val_takeweapons.weapons )
        {
            self giveweapon( weapon );
            
            if ( !isdefined( fallbackprimary ) && weapon.type == "bullet" )
            {
                fallbackprimary = weapon;
            }
        }
        
        if ( isdefined( fallbackprimary ) && weaponselect.basename == "none" )
        {
            weaponselect = fallbackprimary;
        }
        
        self switchtoweaponimmediate( weaponselect );
        self.val_takeweapons = undefined;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9e2087c6, Offset: 0x47b1
// Size: 0x71
function private set_takeweapons( b_value = 1 )
{
    if ( isplayer( self ) )
    {
        thread set_takeweapons_thread( b_value );
        return;
    }
    
    if ( b_value )
    {
        ai::gun_remove();
        
        if ( isdefined( anim.var_5458eb88a5c60307 ) )
        {
            self [[ anim.var_5458eb88a5c60307 ]]();
        }
        
        return;
    }
    
    ai::gun_recall();
    
    if ( isdefined( anim.var_a539877b0796cf31 ) )
    {
        self [[ anim.var_a539877b0796cf31 ]]();
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x17536033, Offset: 0x482a
// Size: 0x7a
function private function_20dc6a278a598f22( value = 0 )
{
    if ( value != 1 )
    {
        self disableweapons( isnumber( value ) && value == -1 ? 1 : 0 );
        
        if ( isdefined( level.allow_weapon_mp ) )
        {
            self [[ level.allow_weapon_mp ]]( 0 );
        }
        
        return;
    }
    
    self enableweapons();
    
    if ( isdefined( level.allow_weapon_mp ) )
    {
        self [[ level.allow_weapon_mp ]]( 1 );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x66df1073, Offset: 0x48ac
// Size: 0x28
function private function_fad3d2efb21d3796( b_value = 0 )
{
    if ( b_value )
    {
        self enableweaponswitch();
        return;
    }
    
    self disableweaponswitch();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8e2abe4b, Offset: 0x48dc
// Size: 0x2b
function private function_69663cfde5a760c0( b_value = 0 )
{
    if ( b_value )
    {
        self disableemptyclipweaponswitch( 0 );
        return;
    }
    
    self disableemptyclipweaponswitch( 1 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfb09c71a, Offset: 0x490f
// Size: 0x2b
function private function_14a1b35a268ca4b9( b_value = 0 )
{
    if ( b_value )
    {
        self allowfire( 1 );
        return;
    }
    
    self allowfire( 0 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x55864cb, Offset: 0x4942
// Size: 0x40
function private function_d7a1169db9553b28( b_value = 0 )
{
    assert( isplayer( self ) );
    assert( utility::issp() );
    setsaveddvar( @"hash_4f25696e26f5208b", !b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xef2eb8df, Offset: 0x498a
// Size: 0x7c
function private function_774a7b576d576eac( b_value = 0 )
{
    if ( b_value != 1 )
    {
        self allowreload( 0 );
        
        if ( b_value != -1 )
        {
            self cancelreload();
            telemetrydata = { #reloadcanceltime:getsystemtimeinmicroseconds(), #cancelreason:"ENTER_VEHICLE", #player:self };
            telemetry_utils::function_af2d366f9522f76f( "callback_on_reload_cancel", telemetrydata );
        }
        
        return;
    }
    
    self allowreload( 1 );
}

// Namespace val
// Params 1
// Checksum 0x2ae56437, Offset: 0x4a0e
// Size: 0x10c
function function_a72eede1b3cfd014( value = 1 )
{
    assert( isplayer( self ) );
    assert( utility::issp() );
    scale = 1;
    valuestates = self.values[ "reload_speed" ];
    
    if ( isdefined( valuestates ) && valuestates.size )
    {
        foreach ( value in valuestates )
        {
            scale *= float( value );
        }
    }
    
    setsaveddvar( @"perk_weapreloadmultiplier", scale );
    
    if ( scale != 1 )
    {
        self setperk( "specialty_fastreload", 1 );
        return;
    }
    
    self unsetperk( "specialty_fastreload", 1 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xb0d53eb, Offset: 0x4b22
// Size: 0x28
function private function_e208c91eb84ed565( b_value = 0 )
{
    if ( b_value )
    {
        self enableweaponpickup();
        return;
    }
    
    self disableweaponpickup();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x57039e89, Offset: 0x4b52
// Size: 0x28
function private function_1fd9d609b5af3807( b_value = 0 )
{
    if ( b_value )
    {
        self enableautoreload();
        return;
    }
    
    self disableautoreload();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x2ca12467, Offset: 0x4b82
// Size: 0x28
function private function_a1162f2424489dd0( b_value = 0 )
{
    if ( b_value )
    {
        self enableoffhandweapons();
        return;
    }
    
    self disableoffhandweapons();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcca38af, Offset: 0x4bb2
// Size: 0x28
function private function_62d014caf91572e2( b_value = 0 )
{
    if ( b_value )
    {
        self enableoffhandprimaryweapons();
        return;
    }
    
    self disableoffhandprimaryweapons();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xc232b77d, Offset: 0x4be2
// Size: 0x28
function private function_36cea73c3b5fd96e( b_value = 0 )
{
    if ( b_value )
    {
        self enableoffhandsecondaryweapons();
        return;
    }
    
    self disableoffhandsecondaryweapons();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5a5c127c, Offset: 0x4c12
// Size: 0x1c
function private function_20012a3279532ca5( b_value = 0 )
{
    self allowoffhandshieldweapons( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x24c3c694, Offset: 0x4c36
// Size: 0x29
function private function_37a151011f0964e7( b_value = 1 )
{
    if ( b_value )
    {
        self enableoffhandthrowback();
        return;
    }
    
    self disableoffhandthrowback();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcb2c4f63, Offset: 0x4c67
// Size: 0x19
function private function_6c087f6f845b9277( b_value )
{
    assertmsg( "<dev string:x120>" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x2957415a, Offset: 0x4c88
// Size: 0x1c
function private function_a0d18b9a3de11d2e( b_value = 0 )
{
    self function_9d8fefb12cdb497c( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe21568fd, Offset: 0x4cac
// Size: 0x3d
function private function_3a846d2682cc0f8c( b_value = 0 )
{
    if ( utility::issp() )
    {
        self function_e01cf4f8dc4d9dc8( !b_value );
        return;
    }
    
    if ( b_value )
    {
        self enableaimassist();
        return;
    }
    
    self disableaimassist();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x23e59df8, Offset: 0x4cf1
// Size: 0x32
function private function_d997fb9e4213c391( b_value = 0 )
{
    if ( b_value )
    {
        self enableusability();
    }
    else
    {
        self disableusability();
    }
    
    self notify( "usability", b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xbf17c3f7, Offset: 0x4d2b
// Size: 0x29
function private disallow_loot_but_auto_loot( b_value = 1 )
{
    if ( b_value )
    {
        self function_604255f312e3443e();
        return;
    }
    
    self function_5326242d9dc65aed();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8f351edc, Offset: 0x4d5c
// Size: 0x29
function private disallow_usability_but_loot( b_value = 1 )
{
    if ( b_value )
    {
        self function_b57dcb79e0b62bb5();
        return;
    }
    
    self function_a2dc8e29134063ac();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x623c8b35, Offset: 0x4d8d
// Size: 0x32
function private function_71e47286bc09401c( b_value = 1 )
{
    if ( b_value )
    {
        self.dont_evolve = 1;
        return;
    }
    
    self.dont_evolve = undefined;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xb1852c8b, Offset: 0x4dc7
// Size: 0x21
function private disallow_weapon_wallbuy( b_value = 1 )
{
    self.var_83480e7607063d3f = istrue( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x66f2d727, Offset: 0x4df0
// Size: 0x21
function private disallow_wallbuy( b_value = 1 )
{
    self.var_e830497a1d286f74 = istrue( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3343b1e3, Offset: 0x4e19
// Size: 0x21
function private disallow_magicbox( b_value = 1 )
{
    self.var_432159241a2f9367 = istrue( b_value );
}

// Namespace val
// Params 1
// Checksum 0x54d6eeea, Offset: 0x4e42
// Size: 0x47
function function_f7f7c8683c1d17b7( b_value = 1 )
{
    if ( b_value )
    {
        self.var_73fc3c02a3004c94 = 1;
        self.usingremoterevive = 1;
        return;
    }
    
    self.var_73fc3c02a3004c94 = undefined;
    self.usingremoterevive = undefined;
}

// Namespace val
// Params 1
// Checksum 0xc7e13415, Offset: 0x4e91
// Size: 0x32
function function_ac426ec234868b04( b_value = 1 )
{
    if ( b_value )
    {
        self.var_885f2644ce3eb19e = 1;
        return;
    }
    
    self.var_885f2644ce3eb19e = undefined;
}

// Namespace val
// Params 1
// Checksum 0xa5f96eff, Offset: 0x4ecb
// Size: 0x32
function function_19b569afca12ffd7( b_value = 1 )
{
    if ( b_value )
    {
        self.ignoreafkcheck = b_value;
        return;
    }
    
    self.ignoreafkcheck = undefined;
}

// Namespace val
// Params 1
// Checksum 0x63fa789a, Offset: 0x4f05
// Size: 0x20
function function_95066ad96cccfad0( b_value = 1 )
{
    self.ignoreme = b_value;
}

// Namespace val
// Params 1
// Checksum 0xaf375e65, Offset: 0x4f2d
// Size: 0x20
function function_c120622a6e09fe01( b_value = 1 )
{
    self.ignoreall = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x51f59a2, Offset: 0x4f55
// Size: 0x3f
function private function_9e8e7f16449b4fe3( b_value = 1 )
{
    assert( isplayer( self ) );
    
    if ( b_value )
    {
        self.nohitmarkers = undefined;
        return;
    }
    
    self.nohitmarkers = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe32c7f0d, Offset: 0x4f9c
// Size: 0x11c
function private set_hide( value = 1 )
{
    if ( !isplayer( self ) && isarray( value ) )
    {
        self hide();
        
        foreach ( player in value )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            self showtoplayer( player );
        }
        
        return;
    }
    
    if ( value )
    {
        var_f097c55b7de07a4d = value == 2;
        
        if ( isplayer( self ) )
        {
            self playerhide( var_f097c55b7de07a4d );
        }
        else if ( isagent( self ) )
        {
            self invisiblenotsolid( var_f097c55b7de07a4d );
        }
        else
        {
            self hide( var_f097c55b7de07a4d );
        }
        
        return;
    }
    
    if ( isplayer( self ) )
    {
        self playershow();
        return;
    }
    
    if ( isagent( self ) )
    {
        self visiblesolid();
        return;
    }
    
    self show();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x333c5f15, Offset: 0x50c0
// Size: 0x1d
function private function_77fbaaa4ebc4c291( b_value = 1 )
{
    self function_2edfdd35a16bb863( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5f1830ab, Offset: 0x50e5
// Size: 0x32
function private set_health_regen( b_value = 1 )
{
    if ( b_value )
    {
        self.disable_health_regen = undefined;
        return;
    }
    
    self.disable_health_regen = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xee637066, Offset: 0x511f
// Size: 0x31
function private function_a7f500116a1c04b9( b_value = 0 )
{
    if ( b_value )
    {
        self.disable_health_regen_delay = undefined;
        return;
    }
    
    self.disable_health_regen_delay = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xce6a71e3, Offset: 0x5158
// Size: 0x32
function private set_ignore_health_regen_delay( b_value = 1 )
{
    if ( b_value )
    {
        self.ignore_health_regen_delay = 1;
        return;
    }
    
    self.ignore_health_regen_delay = 0;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcc2eafe, Offset: 0x5192
// Size: 0x8c
function private function_cc381b7879a5f0d6( val )
{
    if ( isdefined( val ) )
    {
        self.goalradius = val;
        return;
    }
    
    if ( isdefined( self.radius ) )
    {
        self.goalradius = float( self.radius );
        return;
    }
    
    if ( isdefined( self.spawner.radius ) )
    {
        self.goalradius = float( self.spawner.radius );
        return;
    }
    
    self.goalradius = 2048;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x4dde4fc6, Offset: 0x5226
// Size: 0x29
function private function_1b5bfb0a108ea35( b_value = 1 )
{
    self.skipdeath = b_value ? 1 : 0;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9bfceceb, Offset: 0x5257
// Size: 0x29
function private function_2a5de6cbd48abe4e( b_value = 1 )
{
    self.skipscenedeath = b_value ? 1 : undefined;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfc34d9a1, Offset: 0x5288
// Size: 0x14
function private function_d96998f0bfccd0af( b_allow )
{
    self enableplayerbreathsystem( b_allow );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xec9b19eb, Offset: 0x52a4
// Size: 0x14
function private function_ef500d3d9308db93( b_freeze )
{
    self freezecontrols( b_freeze );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xda892691, Offset: 0x52c0
// Size: 0x14
function private function_d9233b319f90661( b_freeze )
{
    self freezelookcontrols( b_freeze );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcd79ae83, Offset: 0x52dc
// Size: 0x50
function private function_2005a18622e4bc7c( b_value = 1 )
{
    if ( !utility::ent_flag_exist( "stealth_social_reveal" ) )
    {
        utility::ent_flag_init( "stealth_social_reveal" );
    }
    
    if ( b_value )
    {
        utility::ent_flag_set( "stealth_social_reveal" );
        return;
    }
    
    utility::ent_flag_clear( "stealth_social_reveal" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x1cf86219, Offset: 0x5334
// Size: 0x30
function private function_fb7abaa719858b69( b_value )
{
    if ( b_value )
    {
        b_value = 0;
    }
    else
    {
        b_value = 1;
    }
    
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_hide_hud", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x6187ebab, Offset: 0x536c
// Size: 0x30
function private function_ebf3d4d401322e8( b_value )
{
    if ( b_value )
    {
        b_value = 0;
    }
    else
    {
        b_value = 1;
    }
    
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_hide_weapon_info", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xd5bb9c82, Offset: 0x53a4
// Size: 0x30
function private function_c5e5bd6fb67422ed( b_value )
{
    if ( b_value )
    {
        b_value = 0;
    }
    else
    {
        b_value = 1;
    }
    
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_hide_dpad_hud", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xd3912c1b, Offset: 0x53dc
// Size: 0x20
function private function_3bebe3c7d4a7d93d( b_value = 1 )
{
    self.var_c0f4dea5ee8c15f0 = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5695403b, Offset: 0x5404
// Size: 0x75
function private function_e38774501aac185c( f_value = 0 )
{
    if ( isplayer( self ) )
    {
        var_c8f282a7da3cebad = clamp( function_4c595691ba6373b9( "world_fade" ) ?? f_value, 0, 1 );
        
        if ( hasomnvar( "ui_world_fade" ) )
        {
            self setclientomnvar( "ui_world_fade", var_c8f282a7da3cebad );
            return;
        }
        
        hud_util::fade_out( 0, "black", var_c8f282a7da3cebad );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5695403b, Offset: 0x5481
// Size: 0x75
function private function_4b876028b4dc4f0a( f_value = 0 )
{
    if ( isplayer( self ) )
    {
        var_c8f282a7da3cebad = clamp( function_4c595691ba6373b9( "total_fade" ) ?? f_value, 0, 1 );
        
        if ( hasomnvar( "ui_total_fade" ) )
        {
            self setclientomnvar( "ui_total_fade", var_c8f282a7da3cebad );
            return;
        }
        
        hud_util::fade_out( 0, "black", var_c8f282a7da3cebad );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3f4b717b, Offset: 0x54fe
// Size: 0x2e
function private function_a68c2995da977451( b_value = 1 )
{
    if ( hasomnvar( "ui_hide_danger_indicator" ) )
    {
        self setclientomnvar( "ui_hide_danger_indicator", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xa70495f6, Offset: 0x5534
// Size: 0x29
function private allow_melee_victim( b_value = 1 )
{
    self.canbemeleed = b_value ? 1 : 0;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x10f049bd, Offset: 0x5565
// Size: 0x1d
function private set_allowjump( b_value = 1 )
{
    self allowjump( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8386ede5, Offset: 0x558a
// Size: 0x1d
function private set_allowdoublejump( b_value = 1 )
{
    self allowdoublejump( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7891768a, Offset: 0x55af
// Size: 0x1d
function private set_allowcrouch( b_value = 1 )
{
    self allowcrouch( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x45acdb69, Offset: 0x55d4
// Size: 0x28
function private set_allowprone( b_value = 1 )
{
    self.var_b64b12f21408f6b3 = b_value;
    self allowprone( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x30d2f64f, Offset: 0x5604
// Size: 0x119
function private function_1ae65704940e4424( b_value = 1 )
{
    if ( b_value )
    {
        self allowstand( 1 );
        self allowcrouch( 1 );
        self allowprone( 1 );
        return;
    }
    
    current = self getstance();
    
    foreach ( stance in arrayremove( [ "stand", "crouch", "prone" ], current ) )
    {
        switch ( stance )
        {
            case #"hash_c6775c88e38f7803":
                self allowstand( 0 );
                break;
            case #"hash_3fed0cbd303639eb":
                self allowcrouch( 0 );
                break;
            case #"hash_d91940431ed7c605":
                self allowprone( 0 );
                break;
        }
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x52bc1146, Offset: 0x5725
// Size: 0x1d
function private set_allowmelee( b_value = 1 )
{
    self allowmelee( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x10f049bd, Offset: 0x574a
// Size: 0x1c
function private set_allowlean( b_value = 0 )
{
    self allowlean( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7891768a, Offset: 0x576e
// Size: 0x1d
function private set_allowmantle( b_value = 1 )
{
    self allowmantle( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x914f2c7, Offset: 0x5793
// Size: 0x1d
function private function_5e9e3b2f69f6f529( b_value = 1 )
{
    self function_3f7094f6eb8242c0( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x66bdd502, Offset: 0x57b8
// Size: 0x1c
function private set_allowmounttop( b_value = 0 )
{
    self allowmounttop( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x914f2c7, Offset: 0x57dc
// Size: 0x1c
function private set_allowmountside( b_value = 0 )
{
    self allowmountside( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7891768a, Offset: 0x5800
// Size: 0x1d
function private set_allowsprint( b_value = 1 )
{
    self allowsprint( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xee30de94, Offset: 0x5825
// Size: 0x1d
function private set_allowjog( b_value = 1 )
{
    self allowjog( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x52bc1146, Offset: 0x584a
// Size: 0x1d
function private set_allowstand( b_value = 1 )
{
    self allowstand( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5ef093e2, Offset: 0x586f
// Size: 0x1d
function private set_allowmovement( b_value = 1 )
{
    self allowmovement( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7891768a, Offset: 0x5894
// Size: 0x1d
function private set_allowladder( b_value = 1 )
{
    self allowladder( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfec23cdc, Offset: 0x58b9
// Size: 0x1d
function private function_df742befdf77ed04( b_value = 1 )
{
    self function_934bce44b11115bf( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8386ede5, Offset: 0x58de
// Size: 0x1d
function private function_21ceb22acb454b71( b_value = 1 )
{
    self function_a6d285c122d6432a( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x6f863095, Offset: 0x5903
// Size: 0x51
function private function_38e816a25d06e176( b_value = 0 )
{
    if ( b_value )
    {
        if ( !self hasperk( "specialty_freefire" ) )
        {
            self setperk( "specialty_freefire", 1 );
        }
        
        return;
    }
    
    if ( self hasperk( "specialty_freefire" ) )
    {
        self unsetperk( "specialty_freefire", 1 );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5ef093e2, Offset: 0x595c
// Size: 0x1d
function private function_a8117c7579bc7929( b_value = 1 )
{
    self allowswimming( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf572245d, Offset: 0x5981
// Size: 0x1d
function private function_7ab726a64720c8a4( b_value = 1 )
{
    self allowswimmingunderwater( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x241847ed, Offset: 0x59a6
// Size: 0x1d
function private function_48acf32c9c54465c( b_value = 1 )
{
    self function_5e3d4215e59b4473( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfec23cdc, Offset: 0x59cb
// Size: 0x1d
function private function_115021318817a3e4( b_value = 1 )
{
    self function_6af484c18f98020b( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf41abb95, Offset: 0x59f0
// Size: 0x1d
function private function_a4ce58974995b16f( b_value = 1 )
{
    self skydive_setbasejumpingstatus( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xd077d2a9, Offset: 0x5a15
// Size: 0x1d
function private function_1c864094a7f7b03c( b_value = 1 )
{
    self allowdive( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xffbdb8a6, Offset: 0x5a3a
// Size: 0x39
function private set_movespeedscale( val = 1 )
{
    if ( isai( self ) )
    {
        asm::asm_setmoveplaybackrate( val );
        return;
    }
    
    if ( isplayer( self ) )
    {
        self setmovespeedscale( val );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xa7001633, Offset: 0x5a7b
// Size: 0xc4
function private function_1b144c7826e01cfb( val )
{
    scale = get( "move_speed_scale" );
    valuestates = self.values[ "move_speed_scale_mult" ];
    
    if ( isdefined( valuestates ) && valuestates.size )
    {
        foreach ( value in valuestates )
        {
            scale *= float( value );
        }
    }
    
    set_movespeedscale( scale );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf078292e, Offset: 0x5b47
// Size: 0x45
function private set_desiredspeed( val = 0 )
{
    if ( !isai( self ) )
    {
        assertmsg( "<dev string:x14d>" );
        return;
    }
    
    if ( val > 0 )
    {
        self aisetdesiredspeed( val );
        return;
    }
    
    self aiclearscriptdesiredspeed( val );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x94d13b74, Offset: 0x5b94
// Size: 0x1d
function private set_pushplayer( b_value = 1 )
{
    self pushplayer( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x605392, Offset: 0x5bb9
// Size: 0x28
function private function_877815b778be0789( b_value = 0 )
{
    if ( b_value )
    {
        self enableoffhandspecialweapons();
        return;
    }
    
    self disableoffhandspecialweapons();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x307040d8, Offset: 0x5be9
// Size: 0x1d
function private function_f9218624505e928d( b_value = 0 )
{
    self function_4d8e8ea22028572( !b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5bb8ee61, Offset: 0x5c0e
// Size: 0x4a
function private function_68e3a3ac765536e7( b_value = 1 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "super_switching" );
    }
    else
    {
        utility::ent_flag_clear( "super_switching" );
    }
    
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_super_switching_allowed", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8c173475, Offset: 0x5c60
// Size: 0x68
function private function_88432a9a2467d40f( b_value = 0 )
{
    if ( b_value )
    {
        if ( self tagexists( "TAG_STOWED_BACKPACK_HIDE" ) )
        {
            if ( self.operatorcustomization.body != "body_mp_gus_iw9_1_1" )
            {
                self hidepart( "TAG_STOWED_BACKPACK_HIDE" );
            }
        }
        
        return;
    }
    
    if ( self tagexists( "TAG_STOWED_BACKPACK_HIDE" ) )
    {
        self showpart( "TAG_STOWED_BACKPACK_HIDE" );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7db798fd, Offset: 0x5cd0
// Size: 0x1e
function private function_f8a70390aab483fd( b_value = 0 )
{
    self function_768e7142f48e0374( !b_value, self );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x485151e5, Offset: 0x5cf6
// Size: 0x1c
function private function_19abbc82717ff6e( b_value = 0 )
{
    self allowwallrun( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9554c388, Offset: 0x5d1a
// Size: 0x8d
function private function_11ec4cf4a1f78d50( b_value = 0 )
{
    if ( b_value )
    {
        self energy_setenergy( 0, self.doublejumpenergy );
        self energy_setrestorerate( 0, self.doublejumpenergyrestorerate );
        self.doublejumpenergy = undefined;
        self.doublejumpenergyrestorerate = undefined;
        self allowdoublejump( 1 );
        return;
    }
    
    self.doublejumpenergy = self energy_getenergy( 0 );
    self.doublejumpenergyrestorerate = self energy_getrestorerate( 0 );
    self energy_setenergy( 0, 0 );
    self energy_setrestorerate( 0, 0 );
    self allowdoublejump( 0 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xa2d53a7f, Offset: 0x5daf
// Size: 0x1c
function private function_394d0e1971506f5a( b_value = 0 )
{
    self allowslide( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x656b38a3, Offset: 0x5dd3
// Size: 0x36
function private function_29d0c9f9c06a0716( b_value = 0 )
{
    if ( b_value )
    {
        self [[ level.enableexecutionattackfunc ]]();
        return;
    }
    
    self [[ level.disableexecutionattackfunc ]]();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xea0ed282, Offset: 0x5e11
// Size: 0x45
function private function_d8c73090e01eec0a( b_value = 0 )
{
    if ( !isdefined( level.enableexecutionvictimfunc ) )
    {
        return;
    }
    
    if ( b_value )
    {
        self [[ level.enableexecutionvictimfunc ]]();
        return;
    }
    
    self [[ level.disableexecutionvictimfunc ]]();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x90914831, Offset: 0x5e5e
// Size: 0x45
function private function_c024a5143db30f53( b_value = 0 )
{
    if ( !isdefined( level.var_b25384e76c9c75c8 ) )
    {
        return;
    }
    
    if ( b_value )
    {
        self builtin [[ level.var_b25384e76c9c75c8 ]]();
        return;
    }
    
    self builtin [[ level.var_a12d26bb8ce6fde1 ]]();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xeaacf3c, Offset: 0x5eab
// Size: 0x1c
function private function_457b17f56ea93057( b_value = 0 )
{
    vehicle_allowplayeruse( self, b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x96d511d4, Offset: 0x5ecf
// Size: 0x1c
function private function_2eaa66d57872ea23( b_value = 0 )
{
    self function_b100a7701a3ca96f( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xa3e28951, Offset: 0x5ef3
// Size: 0x28
function private function_8897b3febd975b3e( b_value = 0 )
{
    self.var_9b6d5e24d8eed7c4 = b_value ? undefined : 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8d323690, Offset: 0x5f23
// Size: 0x1c
function private function_5724d3c9e7701db1( b_value = 0 )
{
    self allowvehiclepredictiveragdoll( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x75aaa637, Offset: 0x5f47
// Size: 0x56
function private function_bb0d10ecbfbeaeb9( b_value = 0 )
{
    nvgslot = 2;
    
    if ( b_value )
    {
        if ( !isai( self ) )
        {
            self setactionslot( nvgslot, "nightvision" );
        }
        
        return;
    }
    
    if ( !isai( self ) )
    {
        self setactionslot( nvgslot, "" );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x90d01209, Offset: 0x5fa5
// Size: 0x1c
function private function_797fbc5fdce1604( b_value = 0 )
{
    self allowsupersprint( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x694e5c7d, Offset: 0x5fc9
// Size: 0x50
function private function_288bef4a53a454c1( b_value = 0 )
{
    if ( b_value )
    {
        if ( isdefined( level.enableshellshockfunc ) )
        {
            self [[ level.enableshellshockfunc ]]();
        }
        
        return;
    }
    
    if ( isdefined( level.disableshellshockfunc ) )
    {
        self [[ level.disableshellshockfunc ]]();
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9e834a30, Offset: 0x6021
// Size: 0x75
function private function_afc959ebf3565f45( b_value = 0 )
{
    if ( isinfrontend() )
    {
        return;
    }
    
    if ( b_value )
    {
        if ( self.var_bc911f2808c4ce06 )
        {
            self.var_bc911f2808c4ce06 = undefined;
            
            if ( isdefined( self.cinematicmotionoverride ) )
            {
                self setcinematicmotionoverride( self.cinematicmotionoverride );
            }
            else
            {
                self clearcinematicmotionoverride();
            }
        }
        
        return;
    }
    
    self setcinematicmotionoverride( "disabled" );
    self.var_bc911f2808c4ce06 = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcf1f348d, Offset: 0x609e
// Size: 0x70
function private function_ab098c39abd0a60( b_value = 0 )
{
    if ( isdefined( self.armor.toggleuifunc ) )
    {
        self [[ self.armor.toggleuifunc ]]( b_value );
    }
    
    if ( isbot( self ) && isdefined( self._blackboard ) )
    {
        self._blackboard.var_50edfe96f927ca5 = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x77ea780, Offset: 0x6116
// Size: 0x5a
function private function_82e13e9ae938b8e9( ref )
{
    if ( isdefined( ref ) && !isdefined( level.equipment.table[ ref ] ) )
    {
        assertmsg( "<dev string:x182>" + ref + "<dev string:x1d8>" );
    }
    
    return level.equipment.table[ ref ];
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf5f51099, Offset: 0x6179
// Size: 0x28
function private function_e67eeb83d8502ab2( slot )
{
    if ( !isdefined( self.equipment ) )
    {
        return undefined;
    }
    
    return self.equipment[ slot ];
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf1b88da9, Offset: 0x61aa
// Size: 0x45
function private disableslotinternal( slot )
{
    if ( slot == "primary" )
    {
        self clearoffhandprimary();
        return;
    }
    
    if ( slot == "secondary" )
    {
        self clearoffhandsecondary();
        return;
    }
    
    if ( slot == "super" )
    {
        self clearoffhandspecial();
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xb8c3859f, Offset: 0x61f7
// Size: 0x35c
function private enableslotinternal( slot )
{
    ref = function_e67eeb83d8502ab2( slot );
    equipmentlist = self getweaponslistoffhands();
    weapon = undefined;
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    found = 0;
    
    foreach ( equip in equipmentlist )
    {
        equipref = undefined;
        
        foreach ( tableinfo in level.equipment.table )
        {
            if ( tableinfo.objweapon.basename == equip.basename )
            {
                equipref = tableinfo.ref;
                break;
            }
        }
        
        if ( equipref == ref )
        {
            if ( !isdefined( equip.basename ) )
            {
                return;
            }
            
            found = 1;
            attachments = equip.attachments ?? [];
            variantid = equip.variantid;
            
            if ( variantid > 0 )
            {
                weapon = makeweapon( equip.basename, attachments, undefined, undefined, variantid );
                svariantid = equip.basename + "|" + variantid;
                variantattachments = level.equipmentblueprints[ svariantid ] ?? [];
                
                foreach ( attachment, variant in variantattachments )
                {
                    weapon = weapon withattachment( attachment, variant );
                }
            }
            else if ( attachments.size > 0 )
            {
                defaultattachments = getweapondefaultattachments( equip.basename );
                weapon = makeweapon( equip.basename, defaultattachments );
                weapon = weapon withattachments( attachments );
            }
            else
            {
                tableinfo = function_82e13e9ae938b8e9( ref );
                weapon = tableinfo.objweapon;
            }
            
            break;
        }
    }
    
    tableinfo = function_82e13e9ae938b8e9( ref );
    
    if ( !found )
    {
        weapon = tableinfo.objweapon;
    }
    
    if ( isdefined( weapon ) && self hasweapon( weapon ) )
    {
        if ( isdefined( weapon ) && !tableinfo.ispassive )
        {
            if ( slot == "primary" )
            {
                self assignweaponoffhandprimary( weapon );
                return;
            }
            
            if ( slot == "secondary" )
            {
                self assignweaponoffhandsecondary( weapon );
                return;
            }
            
            if ( slot == "super" )
            {
                self assignweaponoffhandspecial( weapon );
            }
        }
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe3f0c455, Offset: 0x655b
// Size: 0x47
function private function_2e13ccfdf6cd4702( b_value = 0 )
{
    if ( utility::issp() )
    {
        function_62d014caf91572e2( b_value );
        return;
    }
    
    if ( b_value )
    {
        enableslotinternal( "primary" );
        return;
    }
    
    disableslotinternal( "primary" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x90aa019a, Offset: 0x65aa
// Size: 0x47
function private function_b2dbe5926fba028e( b_value = 0 )
{
    if ( utility::issp() )
    {
        function_36cea73c3b5fd96e( b_value );
        return;
    }
    
    if ( b_value )
    {
        enableslotinternal( "secondary" );
        return;
    }
    
    disableslotinternal( "secondary" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xff57b14, Offset: 0x65f9
// Size: 0x25
function private function_f61e0e9b7270852f( b_value = 0 )
{
    setsaveddvar( @"hash_4771e9353baf9732", !b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x42b30a98, Offset: 0x6626
// Size: 0x28
function private function_ae04fcfb3e401f12( b_value = 0 )
{
    if ( b_value )
    {
        self function_7d73d6786e51ae1f();
        return;
    }
    
    self function_60e112d2e106b00a();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3ea7d819, Offset: 0x6656
// Size: 0x1d
function private function_77b5b0a45057d866( b_value = 1 )
{
    self scriptabledoorfreeze( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x987bd0f1, Offset: 0x667b
// Size: 0x31
function private function_36d470fc6707078c( b_value = 0 )
{
    if ( b_value )
    {
        self.interactions_disabled = undefined;
        return;
    }
    
    self.interactions_disabled = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x24b037d6, Offset: 0x66b4
// Size: 0x38
function private function_795d7b6d27c07c84( b_value = 0 )
{
    if ( isplayer( self ) && self function_5c766d1d0140b86( "ui_br_inventory_disabled" ) )
    {
        self setclientomnvar( "ui_br_inventory_disabled", !b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf1d01677, Offset: 0x66f4
// Size: 0xc
function private function_bfe2fb4299424726( b_value )
{
    
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xbf446fbe, Offset: 0x6708
// Size: 0x34
function private function_962996b296b33a29( b_value = 0 )
{
    if ( b_value )
    {
        utility::flag_clear( "weapon_scanning_off" );
        return;
    }
    
    utility::flag_set( "weapon_scanning_off" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9726ffc2, Offset: 0x6744
// Size: 0x4d
function private function_48bbce421e2098f9( b_value = 0 )
{
    if ( b_value && isdefined( self.actionslotweapon ) )
    {
        self setactionslot( 1, "weapon", self.actionslotweapon );
        return;
    }
    
    self setactionslot( 1, "" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf91ecb62, Offset: 0x6799
// Size: 0x34
function private function_b3021de8b0f2163f( b_value = 0 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "disallow_body_carry" );
        return;
    }
    
    utility::ent_flag_clear( "disallow_body_carry" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7adb5d3b, Offset: 0x67d5
// Size: 0x34
function private function_21150777a16023b1( b_value = 0 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "disallow_body_shield" );
        return;
    }
    
    utility::ent_flag_clear( "disallow_body_shield" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x51d67438, Offset: 0x6811
// Size: 0x6e
function private set_demeanor( str_value )
{
    if ( isai( self ) )
    {
        if ( !isdefined( str_value ) || str_value == "" )
        {
            utility::clear_demeanor_override();
        }
        else
        {
            utility::demeanor_override( str_value );
        }
        
        return;
    }
    
    if ( isplayer( self ) && isdefined( level.var_d904ea5b8076658c ) && str_value != "" )
    {
        self [[ level.var_d904ea5b8076658c ]]( str_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf1d06bb, Offset: 0x6887
// Size: 0x1f
function private function_69c3c2915908991( b_value )
{
    if ( isai( self ) )
    {
        self.allowpain = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7d14adf1, Offset: 0x68ae
// Size: 0x1f
function private function_fd5ee72fff1d88d1( b_value )
{
    if ( isai( self ) )
    {
        self.allowspecialpain = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3a1fd4c9, Offset: 0x68d5
// Size: 0x3d
function private function_60c7f59590388bde( b_value = 1 )
{
    if ( !isplayer( self ) && !isagent( self ) )
    {
        assertmsg( "<dev string:x1dd>" );
    }
    
    self setinfiniteammo( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x49d470f0, Offset: 0x691a
// Size: 0x28
function private function_89be635049f0ea2( val )
{
    if ( isdefined( level.setoverlordlockedpriority ) )
    {
        self [[ level.setoverlordlockedpriority ]]( val );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x80656620, Offset: 0x694a
// Size: 0x29
function private function_45ca1867c7ce8e7b( b_value )
{
    if ( isai( self ) && isalive( self ) )
    {
        self.killondamage = istrue( b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x85715cf0, Offset: 0x697b
// Size: 0x33
function private function_9323962b1e17315a( b_value )
{
    if ( !isplayer( self ) || isbot( self ) || issimulationplayer( self ) )
    {
        return;
    }
    
    self.reduceddamageeffects = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x6ce4b1bc, Offset: 0x69b6
// Size: 0x20
function private function_4241bb46ed306b16( b_value )
{
    if ( isai( self ) )
    {
        self.collide_with_ai_allies = istrue( b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xd6f842ef, Offset: 0x69de
// Size: 0x20
function private function_a7120a590add6c5a( b_value )
{
    if ( isai( self ) )
    {
        self.script_pushable_by_ai = istrue( b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x15bc73b7, Offset: 0x6a06
// Size: 0x20
function private function_1afc684096493969( b_value )
{
    if ( isai( self ) )
    {
        self.script_pushable = istrue( b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x2b2cf46e, Offset: 0x6a2e
// Size: 0x3a
function private function_834f82f25857f6fd( b_value )
{
    if ( isplayer( self ) || isai( self ) )
    {
        if ( b_value )
        {
            self.var_2364be08b6facb67 = 0;
            return;
        }
        
        self.var_2364be08b6facb67 = 1;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xbefe88ce, Offset: 0x6a70
// Size: 0x32
function private function_d900bf1c1195ae61( b_value = 1 )
{
    if ( isplayer( self ) || isai( self ) )
    {
        self.var_97027ab26a161eef = !b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8b5b0e97, Offset: 0x6aaa
// Size: 0x18
function private function_f3ae033c0e4d155a( b_value )
{
    self.var_47ef4610183304be = istrue( b_value );
}

// Namespace val
// Params 2
// Checksum 0x748fa1cf, Offset: 0x6aca
// Size: 0xf6
function function_b8033e083072d1d6( str_id, value )
{
    if ( value )
    {
        set( str_id, "fire", !value );
        set( str_id, "offhand_weapons", !value );
        set( str_id, "allow_movement", !value );
        set( str_id, "allow_jump", !value );
        set( str_id, "melee", !value );
        set( str_id, "sprint", !value );
        set( str_id, "prone", !value );
        return;
    }
    
    reset( str_id, "fire" );
    reset( str_id, "offhand_weapons" );
    reset( str_id, "allow_movement" );
    reset( str_id, "allow_jump" );
    reset( str_id, "melee" );
    reset( str_id, "sprint" );
    reset( str_id, "prone" );
}

// Namespace val
// Params 2
// Checksum 0x15db0b7a, Offset: 0x6bc8
// Size: 0xb8
function function_ea6a6a9e43fc8c3f( str_id, value )
{
    if ( value )
    {
        set( str_id, "offhand_weapons", !value );
        set( str_id, "allow_movement", !value );
        set( str_id, "allow_jump", !value );
        set( str_id, "melee", !value );
        set( str_id, "sprint", !value );
        return;
    }
    
    reset( str_id, "offhand_weapons" );
    reset( str_id, "allow_movement" );
    reset( str_id, "allow_jump" );
    reset( str_id, "melee" );
    reset( str_id, "sprint" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xee30de94, Offset: 0x6c88
// Size: 0x1d
function private set_allowads( b_value = 1 )
{
    self allowads( b_value );
}

// Namespace val
// Params 2, eflags: 0x4
// Checksum 0xf1ef03b9, Offset: 0x6cad
// Size: 0x1b
function private function_a887952f6b595ba4( s_notify, b_value )
{
    self notify( s_notify, b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfe5d47f6, Offset: 0x6cd0
// Size: 0x1f
function private function_ae7e2f9fa9af1fb9( b_value )
{
    if ( isai( self ) )
    {
        self.disallow_knockdown = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xded3c322, Offset: 0x6cf7
// Size: 0x1f
function private function_14798c4cd3dbc753( b_value )
{
    if ( isai( self ) )
    {
        self.disallow_stun = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xded3c322, Offset: 0x6d1e
// Size: 0x1f
function private function_e9c65c7b453edcbe( b_value )
{
    if ( isai( self ) )
    {
        self.postpone_stun = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9972c61, Offset: 0x6d45
// Size: 0x1f
function private function_b0fab434b7639bf3( b_value )
{
    if ( isai( self ) )
    {
        self.disallow_despawn = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5282edcc, Offset: 0x6d6c
// Size: 0x1f
function private function_3380397d554174df( b_value )
{
    if ( isai( self ) )
    {
        self.disallow_bloat = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x1a3d1431, Offset: 0x6d93
// Size: 0x1f
function private function_5a906779a5089c5c( b_value )
{
    if ( isai( self ) )
    {
        self.postpone_vortex_pull = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xded3c322, Offset: 0x6dba
// Size: 0x1f
function private function_72876b4dd52453b6( b_value )
{
    if ( isai( self ) )
    {
        self.disallow_slow = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x89f0d992, Offset: 0x6de1
// Size: 0x29
function private function_8c8468a6d9dc1e2f( b_value )
{
    if ( isai( self ) )
    {
        self enableavoidance( !b_value );
        self.collide_with_ai = !b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xbeddd784, Offset: 0x6e12
// Size: 0x1f
function private function_d4ab365a2ed863cd( b_value )
{
    if ( isai( self ) )
    {
        self.var_eb92c31552620100 = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x70b625e3, Offset: 0x6e39
// Size: 0x17
function private function_79903c045c3972d( b_value )
{
    self.var_49134f204f8d2642 = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x25e06fb5, Offset: 0x6e58
// Size: 0x37
function private function_da9ccce0e519a93a( b_value )
{
    if ( !isplayer( self ) )
    {
        return;
    }
    
    if ( b_value )
    {
        self setclientomnvar( "ui_show_objectives", 1 );
        return;
    }
    
    self setclientomnvar( "ui_show_objectives", 0 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x12d68da0, Offset: 0x6e97
// Size: 0x2d
function private function_25f833b05462dfd6( b_value )
{
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_out_of_bounds_countdown", b_value );
    }
    
    self notify( "show_ui_out_of_bounds", b_value > 0 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x85b1d534, Offset: 0x6ecc
// Size: 0x20
function private function_61ad072a9fc2be42( b_value )
{
    if ( b_value )
    {
        self castshadows();
        return;
    }
    
    self dontcastshadows();
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9b205a83, Offset: 0x6ef4
// Size: 0x1f
function private function_cf1d129967b5281a( b_value = 0 )
{
    self.showhealthbar = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x4ce222ae, Offset: 0x6f1b
// Size: 0x1f
function private function_9f3b98d1081b9f( dist = 0 )
{
    self.var_10906dc66b1c7aaf = dist;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x99c85a4, Offset: 0x6f42
// Size: 0x35
function private function_a36d1e1879f4a10d( b_value = 1 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "play_ambient_vo" );
        return;
    }
    
    utility::ent_flag_clear( "play_ambient_vo" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x8d5062e2, Offset: 0x6f7f
// Size: 0x35
function private function_ed80da93ca723446( b_value = 1 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "allow_vo" );
        return;
    }
    
    utility::ent_flag_clear( "allow_vo" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x44a5772a, Offset: 0x6fbc
// Size: 0x74
function private function_54063e236477cf2a( b_turn_on = 1 )
{
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( !utility::ent_flag_exist( "toggle_eye_glow" ) )
    {
        utility::ent_flag_init( "toggle_eye_glow" );
    }
    
    if ( b_turn_on )
    {
        utility::ent_flag_set( "toggle_eye_glow" );
    }
    else
    {
        utility::ent_flag_clear( "toggle_eye_glow" );
    }
    
    if ( isdefined( self.var_9b857b12b295d09b ) )
    {
        self [[ self.var_9b857b12b295d09b ]]();
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x210df11e, Offset: 0x7038
// Size: 0x2b
function private function_fa4076d1004abcca( b_value = 1 )
{
    self._blackboard.var_252b33de40638a50 = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xcdfa963e, Offset: 0x706b
// Size: 0x35
function private function_be65061848197540( b_value = 1 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "trial_logic_activate" );
        return;
    }
    
    utility::ent_flag_clear( "trial_logic_activate" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe43041d9, Offset: 0x70a8
// Size: 0x35
function private function_37d8cd2d186b2a85( b_value = 1 )
{
    if ( b_value )
    {
        utility::ent_flag_set( "task_logic_activate" );
        return;
    }
    
    utility::ent_flag_clear( "task_logic_activate" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x9b374573, Offset: 0x70e5
// Size: 0x32
function private function_c3e66f78aae7b54b( b_value = 1 )
{
    if ( b_value )
    {
        self.var_840153567385cc6b = undefined;
        return;
    }
    
    self.var_840153567385cc6b = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x7e98b13b, Offset: 0x711f
// Size: 0x17
function private function_2204daa2cfda7e2c( b_value )
{
    self.attackeraccuracy = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3f8e47a6, Offset: 0x713e
// Size: 0x47
function private function_8c020e6b3e6f4762( b_value )
{
    if ( !utility::ent_flag_exist( "allow_dismember" ) )
    {
        utility::ent_flag_init( "allow_dismember" );
    }
    
    if ( b_value )
    {
        utility::ent_flag_set( "allow_dismember" );
        return;
    }
    
    utility::ent_flag_clear( "allow_dismember" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xe2357459, Offset: 0x718d
// Size: 0x2c
function private function_d7aa041f31d7e32f( b_value )
{
    if ( b_value )
    {
        utility::ent_flag_set( "allow_secondary_attack_damage" );
        return;
    }
    
    utility::ent_flag_clear( "allow_secondary_attack_damage" );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xf26d0337, Offset: 0x71c1
// Size: 0x17
function private function_ef6599a498d90267( b_value )
{
    self.b_ignore_cleanup = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x4ecf4f98, Offset: 0x71e0
// Size: 0x1b
function private function_ed3094fbf0019db1( overridedist )
{
    self.var_52cc30b67469d423 = squared( overridedist );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x561a3fa9, Offset: 0x7203
// Size: 0x17
function private function_19b7ea3ee49651d7( b_value )
{
    self.var_5cbeb35a4d5900e9 = b_value;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x53035e9f, Offset: 0x7222
// Size: 0x49
function private set_participating_cinematics( b_value )
{
    b_value = istrue( b_value );
    prev = self function_e7d19d7e4403c48();
    self function_589df9c1869fcee4( b_value );
    
    if ( prev != b_value )
    {
        if ( b_value )
        {
            self notify( "set_participating_cinematics_true" );
            return;
        }
        
        self notify( "set_participating_cinematics_false" );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x3dd500fb, Offset: 0x7273
// Size: 0x58
function private function_c9229a2a21f96ce8( var_85f9b34a2668217c )
{
    if ( !isdefined( var_85f9b34a2668217c ) || var_85f9b34a2668217c == "" )
    {
        if ( isdefined( level.var_8b4ae0e9bea5384c ) )
        {
            self [[ level.var_8b4ae0e9bea5384c ]]();
        }
        
        return;
    }
    
    if ( isdefined( level.var_e0b31e63f5a29e85 ) )
    {
        self [[ level.var_e0b31e63f5a29e85 ]]( var_85f9b34a2668217c );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xd9d080b6, Offset: 0x72d3
// Size: 0x1d
function private function_2e0d6f33b91fc4f0( b_value )
{
    setsaveddvar( @"ai_corpsesynch", istrue( b_value ) );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xab2eae27, Offset: 0x72f8
// Size: 0x20
function private function_ed1459761ea5620e( var_8dff5af844911c6 )
{
    if ( vehicle::is_vehicle() )
    {
        self.disablelockon = var_8dff5af844911c6;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x1cefe94f, Offset: 0x7320
// Size: 0x1f
function private function_1f0012a3819729d3( b_value )
{
    if ( isplayer( self ) )
    {
        self.var_4014e1a4c4df8dd9 = b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xc83bb19b, Offset: 0x7347
// Size: 0x24
function private function_a296153a12a6c8a3( b_value = 0 )
{
    if ( isent( self ) )
    {
        self forcenetfieldhighlod( b_value );
    }
}

// Namespace val
// Params 1
// Checksum 0x8d050d24, Offset: 0x7373
// Size: 0x1f
function function_a03a7e4c45ccf7ef( value = 0 )
{
    self.ksdontforget = value;
}

// Namespace val
// Params 1
// Checksum 0xeaa1251f, Offset: 0x739a
// Size: 0x26
function function_e273ea3838556c26( eventlist )
{
    if ( eventlist == "" )
    {
        function_117415769484a82c();
        return;
    }
    
    function_f750be7c4e3a297b( eventlist );
}

// Namespace val
// Params 1
// Checksum 0xc9ff9615, Offset: 0x73c8
// Size: 0x13
function function_13a57d8fbb96819b( val )
{
    stealthsettimetolosetargetatlkp( val );
}

// Namespace val
// Params 1
// Checksum 0x39c3c06, Offset: 0x73e3
// Size: 0x13
function function_458fa5173d52d835( val )
{
    stealthsettimetolosetargetnotatlkp( val );
}

// Namespace val
// Params 1
// Checksum 0x417dfe49, Offset: 0x73fe
// Size: 0x13
function function_73bc50501f1e58b1( val )
{
    stealthsetdefaulttimetodropthreatsight( val );
}

// Namespace val
// Params 1
// Checksum 0xf9ca870c, Offset: 0x7419
// Size: 0x13
function function_19800d31ca9a012e( val )
{
    setglobalescalationtotalcombattime( val );
}

// Namespace val
// Params 1
// Checksum 0x6e269abf, Offset: 0x7434
// Size: 0x13
function function_e3ffb01ce831f16a( val )
{
    setglobalescalationcombatpercentagethreshold( val );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x4b99246b, Offset: 0x744f
// Size: 0x28
function private function_5deacaf864fb85ed( val )
{
    if ( isdefined( level.var_2464e8c70801e60f ) )
    {
        self [[ level.var_2464e8c70801e60f ]]( val );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x224db992, Offset: 0x747f
// Size: 0x28
function private function_c071be98a06846b6( b_value = 0 )
{
    if ( issentient( self ) )
    {
        self.dontmeleeme = !b_value;
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x5b6999c, Offset: 0x74af
// Size: 0x29
function private function_66d62a72912f7e2b( b_value = 1 )
{
    self.ignoretriggers = b_value ? 1 : 0;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xfea014f6, Offset: 0x74e0
// Size: 0x32
function private function_60d142b5b57a7b87( value = "ai_default" )
{
    if ( isai( self ) )
    {
        self function_10006c8216ad87fd( "focus_behaviors", "look_state", value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x863c60d6, Offset: 0x751a
// Size: 0x27
function private function_9b639e1ff9e68cca( b_value = 1 )
{
    if ( !isai( self ) )
    {
        return;
    }
    
    self function_97a9712d0b90aae9( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x81cea0f3, Offset: 0x7549
// Size: 0x6a
function private function_f459c32aa8d402a3( arraytargettime )
{
    if ( !isplayer( self ) )
    {
        return;
    }
    
    defval = [ 1, 0.25 ];
    
    if ( !isdefined( arraytargettime ) )
    {
        arraytargettime = defval;
    }
    
    if ( !isarray( arraytargettime ) )
    {
        arraytargettime = [ arraytargettime ];
    }
    
    self lerpfovscalefactor( arraytargettime[ 0 ] ?? defval[ 0 ], arraytargettime[ 1 ] ?? defval[ 1 ] );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xbea63556, Offset: 0x75bb
// Size: 0x31
function private function_c9ea465a772b3387( b_value = 0 )
{
    if ( b_value )
    {
        self.var_eeb6ebe322e71cd1 = undefined;
        return;
    }
    
    self.var_eeb6ebe322e71cd1 = 1;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xc0a153e5, Offset: 0x75f4
// Size: 0x23
function private function_7b797c8e0de52071( b_value )
{
    if ( b_value )
    {
        self setstowedweaponvisibility( 0 );
        return;
    }
    
    self setstowedweaponvisibility( 1 );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x81cd73d5, Offset: 0x761f
// Size: 0x5d
function private function_ecab1eaf64e160fa( b_value = 1 )
{
    if ( b_value )
    {
        if ( isplayer( self ) )
        {
            self.bcdisabled = undefined;
        }
        else
        {
            self.battlechatterallowed = 1;
        }
        
        return;
    }
    
    if ( isplayer( self ) )
    {
        self.bcdisabled = 1;
        return;
    }
    
    self.battlechatterallowed = undefined;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xc29f9b85, Offset: 0x7684
// Size: 0x29
function private function_f01949d7ffcf11f7( b_value = 1 )
{
    if ( issentient( self ) )
    {
        self.var_9f4e3f5817d5c92b = istrue( b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x58db8032, Offset: 0x76b5
// Size: 0x21
function private function_ec7055bcdc1f62ce( b_value = 1 )
{
    self.var_b5253a6833765cd2 = istrue( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x75991f68, Offset: 0x76de
// Size: 0x37
function private function_3632b55e76251b18( b_value = 1 )
{
    if ( isplayer( self ) && hasomnvar( "ui_visibility_perks" ) )
    {
        self setclientomnvar( "ui_visibility_perks", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0xba9f68ed, Offset: 0x771d
// Size: 0x37
function private function_bfbaa9ffafdb11b2( b_value = 1 )
{
    if ( isplayer( self ) && hasomnvar( "ui_perk_decay_active" ) )
    {
        self setclientomnvar( "ui_perk_decay_active", b_value );
    }
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x50940414, Offset: 0x775c
// Size: 0x1c
function private function_284901af56e908eb( b_value = 0 )
{
    self function_81e34c49e8541eb4( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x62af3222, Offset: 0x7780
// Size: 0x1c
function private function_7f187728abff100( b_value = 0 )
{
    self function_cf98a32f2bcfc7dd( b_value );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x1f12db49, Offset: 0x77a4
// Size: 0x24
function private function_2d21d242ff0f9794( val )
{
    if ( val < 0 )
    {
        self setfiretimescaleoff();
        return;
    }
    
    self setfiretimescaleon( val );
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x46e50fae, Offset: 0x77d0
// Size: 0xb2
function private function_4c595691ba6373b9( str_name )
{
    result = undefined;
    
    if ( self.values[ str_name ] )
    {
        foreach ( val in self.values[ str_name ] )
        {
            if ( !isdefined( result ) )
            {
                result = val;
                continue;
            }
            
            result = max( val, result );
        }
    }
    
    return result;
}

// Namespace val
// Params 1, eflags: 0x4
// Checksum 0x53a09ef0, Offset: 0x788b
// Size: 0xb2
function private function_516a3877731df0eb( str_name )
{
    result = undefined;
    
    if ( self.values[ str_name ] )
    {
        foreach ( val in self.values[ str_name ] )
        {
            if ( !isdefined( result ) )
            {
                result = val;
                continue;
            }
            
            result = min( val, result );
        }
    }
    
    return result;
}

/#

    // Namespace val
    // Params 3, eflags: 0x4
    // Checksum 0x53c6ee46, Offset: 0x7946
    // Size: 0x8b, Type: dev
    function private validate( str_name, call_on, func )
    {
        if ( !isdefined( level.values_ref[ str_name ] ) )
        {
            assertmsg( "<dev string:x50>" + str_name + "<dev string:x21f>" );
            return;
        }
        
        s_value = level.values_ref[ str_name ];
        s_value.b_validate = 1;
        s_value.func_validate = func;
        s_value.validate_call_on = call_on;
    }

    // Namespace val
    // Params 3, eflags: 0x4
    // Checksum 0xa998a4a, Offset: 0x79d9
    // Size: 0x11c, Type: dev
    function private validate_value( str_name, value, b_assert )
    {
        if ( !isdefined( b_assert ) )
        {
            b_assert = 0;
        }
        
        s_value = level.values_ref[ str_name ];
        current_value = undefined;
        
        if ( isdefined( s_value.func_validate ) )
        {
            call_on = s_value.validate_call_on == "<dev string:x2e>" ? self : s_value.validate_call_on;
            
            if ( isdefined( s_value.validate_args ) )
            {
                current_value = utility::single_func_argarray( call_on, s_value.func_validate, replace_values( s_value.validate_args ) );
            }
            else
            {
                current_value = utility::single_func_argarray( call_on, s_value.func_validate, [] );
            }
        }
        else
        {
            current_value = 0;
        }
        
        b_match = current_value == value;
        
        if ( b_assert )
        {
            assert( b_match, "<dev string:x234>" + str_name + "<dev string:x24a>" + current_value + "<dev string:x254>" + value + "<dev string:x269>" );
        }
        
        return b_match;
    }

    // Namespace val
    // Params 0, eflags: 0x4
    // Checksum 0x5e8df38a, Offset: 0x7afd
    // Size: 0x422, Type: dev
    function private debug_values()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        setdvarifuninitialized( @"scr_debug_values", 0 );
        waitframe();
        scr_debug_values = 0;
        var_577d5cc2a903bdcf = -1;
        var_78f285248caec26c = undefined;
        
        while ( true )
        {
            if ( gettime() > var_577d5cc2a903bdcf )
            {
                scr_debug_values = getdvarint( @"scr_debug_values" );
                var_577d5cc2a903bdcf = gettime() + 1000;
            }
            
            if ( !scr_debug_values )
            {
                function_d0f5d3764c99417f( 0, 1 );
                waitframe();
                continue;
            }
            
            hud_ent = undefined;
            str_label = "<dev string:x26f>";
            str_debug_values_entity = string::to_string( getdvar( @"scr_debug_values_entity", "<dev string:x293>" ) );
            
            if ( str_debug_values_entity == "<dev string:x293>" || str_debug_values_entity == "<dev string:x297>" || str_debug_values_entity == "<dev string:x29d>" )
            {
                clientnum = int( getdvar( @"hash_13d8008e8edc58d5", "<dev string:x297>" ) );
                
                if ( clientnum != -1 )
                {
                    setdvar( @"hash_13d8008e8edc58d5", "<dev string:x297>" );
                    
                    if ( isplayer( level.players[ clientnum ] ) )
                    {
                        var_78f285248caec26c = level.players[ clientnum ];
                    }
                }
                
                if ( isplayer( var_78f285248caec26c ) )
                {
                    hud_ent = var_78f285248caec26c;
                    str_label = "<dev string:x2a5>" + hud_ent getentitynumber() + "<dev string:x2c9>" + ( hud_ent.name ?? "<dev string:x2cf>" );
                }
                else
                {
                    hud_ent = level.host ?? level.player ?? level.players[ 0 ];
                    
                    if ( isplayer( hud_ent ) )
                    {
                        str_label = "<dev string:x2d5>" + hud_ent getentitynumber() + "<dev string:x2c9>" + ( hud_ent.name ?? "<dev string:x2cf>" );
                    }
                }
            }
            else
            {
                str_value = str_debug_values_entity;
                str_key = "<dev string:x2f8>";
                
                if ( issubstr( str_value, "<dev string:x306>" ) )
                {
                    a_toks = strtok( str_value, "<dev string:x306>" );
                    str_value = a_toks[ 0 ];
                    str_key = a_toks[ 1 ];
                }
                
                hud_ent = getent( str_value, str_key, 1 );
                
                if ( hud_ent )
                {
                    str_label = "<dev string:x30b>" + hud_ent getentitynumber() + "<dev string:x2c9>" + str_value + "<dev string:x306>" + str_key;
                }
            }
            
            level.var_187744ae6566b25c = 0;
            function_80bc16659a2ffb25( 80, 100, str_label, ( 1, 1, 1 ) );
            a_all_ents = getentarray();
            
            foreach ( ent in a_all_ents )
            {
                if ( isdefined( ent.values ) )
                {
                    i = 1;
                    
                    foreach ( str_name, a_value in ent.values )
                    {
                        key = getlastarraykey( a_value );
                        
                        if ( !isdefined( key ) )
                        {
                            continue;
                        }
                        
                        top_value = a_value[ key ];
                        
                        if ( isdefined( top_value ) )
                        {
                            b_valid = 1;
                            
                            if ( level.values_ref[ str_name ].b_validate )
                            {
                                b_assert = getdvarint( @"scr_debug_values", 0 ) > 1;
                                b_valid = ent validate_value( str_name, top_value, b_assert );
                            }
                            
                            ent display_value( i, str_name, key, top_value, isdefined( hud_ent ) && b_valid, hud_ent == ent );
                            i++;
                        }
                    }
                }
            }
            
            function_d0f5d3764c99417f( level.var_187744ae6566b25c, 0 );
            waitframe();
        }
    }

    // Namespace val
    // Params 6, eflags: 0x4
    // Checksum 0xd961e46a, Offset: 0x7f27
    // Size: 0x1c0, Type: dev
    function private display_value( index, str_name, str_id, value, b_valid, on_hud )
    {
        if ( !isdefined( on_hud ) )
        {
            on_hud = 0;
        }
        
        if ( isxhash( str_id ) )
        {
            str_id = getxhashsourcename( str_id );
        }
        
        str_value = "<dev string:x293>";
        
        if ( string::to_string( str_name ) != "<dev string:x293>" )
        {
            str_value = string::rjust( str_name, 10 );
            
            if ( isarray( value ) )
            {
                str_value += "<dev string:x322>";
                
                foreach ( item in value )
                {
                    str_value += "<dev string:x32a>" + item + "<dev string:x32a>";
                }
                
                str_value += "<dev string:x32f>";
            }
            else if ( isdefined( value ) )
            {
                str_value += "<dev string:x334>" + value;
            }
            
            str_value += "<dev string:x33b>" + string::ljust( string( str_id ) + "<dev string:x341>", 15 );
        }
        
        color = b_valid ? ( 1, 1, 1 ) : ( 1, 0, 0 );
        
        if ( on_hud )
        {
            function_80bc16659a2ffb25( 80, 100 + index * 8 * 1.5, str_value, color );
        }
        
        print3d( self.origin - ( 0, 0, index * 8 ), str_value, color, 1.5, 0.3, 1 );
    }

    // Namespace val
    // Params 4, eflags: 0x4
    // Checksum 0x144a097b, Offset: 0x80ef
    // Size: 0x152, Type: dev
    function private function_80bc16659a2ffb25( x, y, text, color )
    {
        if ( !isdefined( level.var_ae866e1b43eacb0a ) )
        {
            level.var_ae866e1b43eacb0a = [];
        }
        
        if ( !isdefined( level.var_187744ae6566b25c ) )
        {
            level.var_187744ae6566b25c = 0;
        }
        
        hudelem = level.var_ae866e1b43eacb0a[ level.var_187744ae6566b25c ];
        
        if ( !isdefined( hudelem ) )
        {
            hudelem = newhudelem();
            hudelem.alignx = "<dev string:x346>";
            hudelem.aligny = "<dev string:x34e>";
            hudelem.foreground = 1;
            hudelem.fontscale = 1.5;
            hudelem.scramblerdisabled = 1;
            level.var_ae866e1b43eacb0a[ level.var_187744ae6566b25c ] = hudelem;
        }
        
        hudelem.x = x;
        hudelem.y = y;
        hudelem.color = color;
        
        if ( !hudelem.var_b666f52616d34619 || hudelem.var_b666f52616d34619 != text )
        {
            hudelem setdevtext( text );
            hudelem.var_b666f52616d34619 = text;
        }
        
        level.var_187744ae6566b25c++;
    }

    // Namespace val
    // Params 2, eflags: 0x4
    // Checksum 0xac10a4c4, Offset: 0x8249
    // Size: 0xf7, Type: dev
    function private function_d0f5d3764c99417f( startindex, cleanup )
    {
        if ( !isdefined( startindex ) )
        {
            startindex = 0;
        }
        
        if ( !isdefined( cleanup ) )
        {
            cleanup = 0;
        }
        
        level.var_187744ae6566b25c = undefined;
        
        if ( !isarray( level.var_ae866e1b43eacb0a ) )
        {
            return;
        }
        
        foreach ( index, hudelem in level.var_ae866e1b43eacb0a )
        {
            if ( !cleanup && index < startindex )
            {
                continue;
            }
            
            hudelem setdevtext( "<dev string:x293>" );
            hudelem.var_b666f52616d34619 = undefined;
            
            if ( cleanup )
            {
                hudelem destroy();
            }
        }
        
        if ( cleanup )
        {
            level.var_ae866e1b43eacb0a = undefined;
        }
    }

#/
