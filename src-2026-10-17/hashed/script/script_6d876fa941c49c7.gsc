#using script_15ce43f40ea0fd2b;
#using script_208a12cbcccbfa63;
#using script_2498b7c75f1dee2d;
#using script_4714f11e284c32a4;
#using script_4966d09e65e628d2;
#using script_4f9ce8d249a99f4a;
#using script_54d715ffd004a854;
#using script_610d4a9bb9b2d531;
#using script_64242b56109110ca;
#using script_6c2f6a14fa53759e;
#using scripts\anim\dialogue;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\ai\subclass_to_aitype_map;
#using scripts\common\callbacks;
#using scripts\common\debug;
#using scripts\common\devgui;
#using scripts\common\hud_util;
#using scripts\common\puzzles\lockpick;
#using scripts\common\scene;
#using scripts\common\scripted_widgets;
#using scripts\common\status_effects\status_effects;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\ammomods\ammo_mod;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\class;
#using scripts\mp\interaction;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\maps\zm_sat_locust\zm_sat_locust_fergus;
#using scripts\mp\zm\maps\zm_sat_locust\zm_sat_locust_util;
#using scripts\mp\zm\systems\zm_quest;
#using scripts\mp\zm\systems\zm_round_logic;
#using scripts\mp\zm\systems\zm_round_spawning;
#using scripts\mp\zm\systems\zm_save;
#using scripts\mp\zm\systems\zm_vo;
#using scripts\mp\zm\systems\zone_manager;
#using scripts\mp\zm\zm_utility;

#namespace namespace_7acb35c452673b3;

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x5
// Checksum 0xe1315e2c, Offset: 0x1982
// Size: 0x25
function private autoexec __init__system__()
{
    system::register( #"hash_7b26a8bb39d7312", #"zm_quest", &pre_main, &post_main );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xb683fec1, Offset: 0x19af
// Size: 0x32d
function private pre_main()
{
    if ( !getdvarint( @"enable_locust_mq", 0 ) )
    {
        return;
    }
    
    level.power_quest = { #var_f4bfa6e5700e9251:getdvarint( @"hash_ce20a0c8282a4dfd", 5 ), #var_227ff7a81d6823c:getdvarfloat( @"hash_567293082ca6540c", 2 ), #var_6bdb55e83904fc54:getdvarint( @"hash_fe34d04cfca273f1", 5 ), #var_4c70190657232531:getdvarint( @"hash_40f108ce5d98a4f8", 5 ), #var_5473b89dc9e703cf:getdvarint( @"hash_e031283a9eac689c", 100 ), #var_88661d5a8129d3d5:getdvarint( @"hash_5cab7476faee6e6a", 20 ), #var_8d14311d7b058c8:getdvarint( @"hash_c01ab2d4acb5a043", 3 ), #var_5a646c31c16924ef:getdvarint( @"hash_3274f721596bd75a", 60 ), #var_552b0a0c0c39c206:0, #collected_uranium:0 };
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_6f181b4d8608302", &function_7d6d613ab952c071, &function_60062348e78b78d6 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_b3d111d0de8f21b", &function_401039ddb9f83f1, &function_83c8ab698e3c8b5e );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_b3d121d0de8f3ce", &function_401009ddb9f7d58, &function_83c8aa698e3c892b );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", &function_401019ddb9f7f8b, &function_83c8a9698e3c86f8 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"open_workshop", &function_7d6d5e3ab952b9d8, &function_60062248e78b76a3 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"craft_power_source", &function_7d6d5f3ab952bc0b, &function_60062148e78b7470 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"deposit_rods", &function_e963d59dc8feaa07, &function_66f87d6979309cf4 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"rod_puzzle", &function_e963d69dc8feac3a, &function_66f880697930a38d );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_e928524cf387f1a1", &function_7d6d643ab952c70a, &function_60062848e78b83d5 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"pickup_power_source", &function_31f8869dfe36254a, &function_cc5da069c3749c2d );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_9353712e6aeb2afe", &function_31f8859dfe362317, &function_cc5d9d69c3749594 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"defend_power_source", &function_7d6d653ab952c93d, &function_60062748e78b81a2 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_24e1dca01905cb12", &function_7d6d623ab952c2a4, &function_60062648e78b7f6f );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_e67af73dad21f466", &function_1529189de92bdd20, &function_af8e3269ae6a5403 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"hash_f81611a91c90b209", &function_15291b9de92be3b9, &function_af8e3369ae6a5636 );
    zm_quest::register_quest_step( #"hash_7b26a8bb39d7312", #"laser_shadowsmith", &function_7d6d633ab952c4d7, &function_60062548e78b7d3c );
    
    /#
        debug_init();
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xff194a7c, Offset: 0x1ce4
// Size: 0x16b
function private post_main()
{
    if ( !getdvarint( @"enable_locust_mq", 0 ) )
    {
        return;
    }
    
    /#
        if ( isofflinetoolrun( 31 ) )
        {
            return;
        }
    #/
    
    level thread function_92ff2d0fb38bf2b9();
    level thread function_326eb597c93b8e03();
    level thread function_2ed6fb820448823e();
    level thread function_13598c7181377977();
    level thread function_8650c8d6c4461d64();
    level thread function_34e8fcd960613443();
    level thread function_9e2e68fbafa18958();
    level thread function_edc2596a1a0d8beb();
    level thread function_8e792b5c68afa0cb();
    level thread function_58c4a9d760f841a4();
    level thread function_751bc067c6677fbe();
    level thread function_3925ba161b714563();
    level callback::add( #"hash_525068440908e3dc", &function_edd2d96ac8f88b88 );
    level callback::add( "on_zipline_attach", &function_edd2d96ac8f88b88 );
    utility::registersharedfunc( #"hash_cc52730feee091fd", #"hash_cbceda57769d1e60", &workshop_door_move );
    utility::registersharedfunc( #"hash_cc52730feee091fd", #"hash_52c219199ae85ba", &workshop_door_move );
    utility::registersharedfunc( #"hash_33950fc5465e7cdc", #"hash_a6489be8eef67a3d", &function_8183f0813f98518 );
    utility::registersharedfunc( #"hash_33950fc5465e7cdc", #"hash_1efa92fc552bb393", &function_8988a032e94395d4 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread function_f269ac36dab433cd();
    }
    
    zm_save::function_1f44a48caae2acbf();
    level thread function_5fcbbe9b263e63cf();
    utility::flag_wait( "onStartGameTypeFinished" );
    level thread zm_quest::start_quest( #"hash_7b26a8bb39d7312" );
    zm_quest::function_3c363613c60958f5( "start_robot_power" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xa0b4820f, Offset: 0x1e57
// Size: 0x35
function private function_92ff2d0fb38bf2b9()
{
    level endon( #"mq_rp_core" );
    utility::flag_wait( "tyr_request_1" );
    wait 60;
    zm_sat_locust_util::function_a8b578b47e763d0f( "dx_zm_lomn_2eps_typa_ml2rbrprq2" );
    utility::flag_set( "tyr_request_2" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x60c84b94, Offset: 0x1e94
// Size: 0x14
function private function_326eb597c93b8e03()
{
    level callback::add( "zone_changed", &function_82cb784f7f76c339 );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x1e29ac95, Offset: 0x1eb0
// Size: 0x88
function private function_82cb784f7f76c339( params )
{
    if ( params.zone_struct.zone_name == "zone_fishery_lab" )
    {
        level callback::remove( "zone_changed", &function_82cb784f7f76c339 );
        var_ec428ca55ae51c0e = [ "dx_zm_lomn_25lu_lvtw_ml2bentlba1ln1", "dx_zm_lomn_25lu_detw_ml2bentlba1ln2" ];
        var_ec428ba55ae519db = [ "dx_zm_lomn_25lu_detw_ml2bentlba2ln1", "dx_zm_lomn_25lu_lvtw_ml2bentlba2ln2" ];
        level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 1 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xe89f127e, Offset: 0x1f40
// Size: 0x1f
function private function_edd2d96ac8f88b88( params )
{
    if ( self.var_55d09c5e6dd5f1e2 )
    {
        drop_power_source();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x504c6648, Offset: 0x1f67
// Size: 0x3b
function private function_7d6d613ab952c071( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    level callback::add( "quest_item_used", &function_61cc5423beb9936e );
    level thread function_612111f09452f94f();
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa63cd5a3, Offset: 0x1faa
// Size: 0x2e
function private function_60062348e78b78d6( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        utility::flag_set( "mq_rp_step_01" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xd8f1b982, Offset: 0x1fe0
// Size: 0x2a0
function private function_61cc5423beb9936e( params )
{
    if ( params.bundle.scriptable == %"zmloot_sat_locust_quest_jasper" || params.bundle.scriptable == %"zmloot_sat_locust_quest_jasper_guided" )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( params.player );
        
        if ( !isdefined( level.power_quest.collected_uranium ) )
        {
            level.power_quest.collected_uranium = 0;
        }
        
        level.power_quest.collected_uranium++;
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"Uranium", level.power_quest.collected_uranium + level.power_quest.var_552b0a0c0c39c206 );
        zm_quest::show_splash_item_picked_up( #"hash_570d84750250b155", #"Uranium", level.power_quest.collected_uranium, params.player );
        
        switch ( params.scriptable.script_string )
        {
            case #"hash_31103fbc01bd840c":
                params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_6229f0f80849dc09", #"bc_flavor_player_positive" );
                level.fishing_struct.force_glocke = 0;
                break;
            case #"hash_311042bc01bd88c5":
                params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_3bda90a74641290c", #"bc_flavor_player_positive" );
                break;
            case #"hash_311041bc01bd8732":
                params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_f11f3cd506b32f5", #"bc_flavor_player_positive" );
                break;
        }
        
        utility::flag_set( "mq_rp_step_01" + "_" + params.scriptable.script_string );
        zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_6f181b4d8608302", "Uranium " + params.scriptable.script_string + " picked up. Uranium Held = " + level.power_quest.collected_uranium + " Uranium in backpack = " + level.power_quest.var_552b0a0c0c39c206 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xde660389, Offset: 0x2288
// Size: 0x53
function private function_612111f09452f94f()
{
    level endon( #"game_ended" );
    utility::flag_wait_all( "mq_rp_step_01_a", "mq_rp_step_01_b", "mq_rp_step_01_c" );
    utility::flag_set( "mq_rp_step_01" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x329a0114, Offset: 0x22e3
// Size: 0x66
function private function_401039ddb9f83f1( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    level callback::add( #"hash_93b99da57e180df4", &function_e4313fcbf70f33c2 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    utility::flag_wait( "mq_rp_step_01_a" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xca7584f4, Offset: 0x2351
// Size: 0x150
function private function_83c8ab698e3c8b5e( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        if ( !isdefined( level.power_quest.collected_uranium ) )
        {
            level.power_quest.collected_uranium = 0;
        }
        
        level.power_quest.collected_uranium++;
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"Uranium", level.power_quest.collected_uranium + level.power_quest.var_552b0a0c0c39c206 );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_3a817233cf6b90fc" );
        level callback::remove( #"hash_93b99da57e180df4", &function_e4313fcbf70f33c2 );
        utility::flag_set( "mq_rp_step_01_a" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_f86ab8d0731a525c" );
        }
    }
    
    level.fishing_struct.force_glocke = 0;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x75f9c28d, Offset: 0x24a9
// Size: 0x1db
function private function_e4313fcbf70f33c2( glocke_drop_struct )
{
    if ( glocke_drop_struct.minigame.tier == getdvarint( @"hash_d9b64c007e8006d", 3 ) || zm_quest::function_b0a5181ebe7bb905() && glocke_drop_struct.minigame.tier >= 1 )
    {
        spawn_pos = glocke_drop_struct.params.request_position + ( 0, 0, glocke_drop_struct.data.loot.var_87fe6a189f87a76b );
        params = {};
        params.spawnoptions = common_item::items_initspawnoptions_spawnfromposition( spawn_pos, ( 0, 0, 0 ) );
        params.spawnoptions.var_fd47e835523b473f = 1;
        params.spawnoptions.critical = 1;
        params.spawnoptions.var_8d4f327170228364 = 0;
        params.spawnoptions.dropradiusscale = 2;
        params.spawnoptions.payload = function_67b78af3c33ac9a8( 2 );
        params.asset = %"zmloot_sat_locust_quest_jasper_guided";
        item = zm_sat_locust_util::spawn_quest_item( params );
        item.script_string = "a";
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_3a817233cf6b90fc", item );
        level callback::remove( #"hash_93b99da57e180df4", &function_e4313fcbf70f33c2 );
        utility::flag_set( #"hash_f86ab8d0731a525c" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x87d6b24d, Offset: 0x268c
// Size: 0x75
function private function_401009ddb9f7d58( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    if ( !zm_quest::function_b0a5181ebe7bb905() )
    {
        level callback::add( "on_round_start", &on_round_start_callback );
    }
    
    level callback::add( #"hash_2e6a3e8ab42d76c5", &function_b051119f80877a9a );
    level callback::add( #"hash_521d7ba37c0a60b3", &function_c2fc27d07b0e596b );
    utility::flag_wait( "mq_rp_step_01_b" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x3d12c180, Offset: 0x2709
// Size: 0x300
function private function_83c8aa698e3c892b( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_e14c6ea2335d2754" ) )
        {
            fishing_spots = zm_sat_locust_util::get_quest_reference( #"hash_e14c6ea2335d2754" );
            
            foreach ( hole in fishing_spots )
            {
                if ( hole.scriptable getscriptablepartstate( "vfx" ) == "enabled_irradiated" )
                {
                    hole.scriptable setscriptablepartstate( "vfx", "disabled" );
                }
            }
        }
        
        if ( !isdefined( level.power_quest.collected_uranium ) )
        {
            level.power_quest.collected_uranium = 0;
        }
        
        level.power_quest.collected_uranium++;
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"Uranium", level.power_quest.collected_uranium + level.power_quest.var_552b0a0c0c39c206 );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_3a817533cf6b9615" );
        level callback::remove( #"hash_2e6a3e8ab42d76c5", &function_b051119f80877a9a );
        level callback::remove( #"hash_521d7ba37c0a60b3", &function_c2fc27d07b0e596b );
        level callback::remove( "on_round_start", &on_round_start_callback );
        utility::flag_set( "mq_rp_step_01_b" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_35fd63a75bced24f" );
            utility::flag_set( #"hash_35fd64a75bced402" );
            utility::flag_set( #"hash_35fd65a75bced5b5" );
            utility::flag_set( #"hash_f86ab6d0731a4ef6" );
            utility::flag_set( #"hash_f86ab7d0731a50a9" );
            
            if ( !zm_quest::is_quest_step_complete( #"hash_ee6c8b2aae13c83", #"collect_pole" ) && zm_sat_locust_util::function_3112dc4740eb8499( #"pole_pickups" ) )
            {
                [ pickup ] = zm_sat_locust_util::get_quest_reference( #"pole_pickups" );
                common_item::items_scriptable_used( pickup, pickup function_84ad2f70189ee7c3(), #"visible", level.players[ 0 ], 0 );
            }
        }
    }
    
    level callback::remove( "on_zombie_ai_spawned", &function_429c070b10994f3f );
    function_fe3ad516eb3563db();
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x65a996a5, Offset: 0x2a11
// Size: 0xe9
function private function_2ed6fb820448823e()
{
    utility::flag_wait( "fishing_spots_ready" );
    irradiated_spots = [];
    
    foreach ( spot in level.fishing_struct.fishing_holes )
    {
        if ( spot.idx == 1 || spot.idx == 4 || spot.idx == 9 )
        {
            irradiated_spots[ irradiated_spots.size ] = spot;
        }
    }
    
    irradiated_spots = arrayrandomize( irradiated_spots );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_e14c6ea2335d2754", irradiated_spots );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x825dba43, Offset: 0x2b02
// Size: 0x1b1
function private function_13598c7181377977()
{
    utility::flag_wait( "scriptables_ready" );
    first_teleport_structs = utility::getstructarray( "mqpo_ra_te_1", "script_noteworthy" );
    
    foreach ( struct in first_teleport_structs )
    {
        struct.specific_spawns = utility::getstructarray( struct.target );
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_b7b3993133f11424", first_teleport_structs );
    second_teleport_locs = utility::getstructarray( "mqpo_ra_te_2", "script_noteworthy" );
    
    foreach ( struct in second_teleport_locs )
    {
        struct.specific_spawns = utility::getstructarray( struct.target );
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_776f972d98c7dd12", second_teleport_locs );
    final_teleport_struct = utility::getstruct( "mqpo_ra_te_3", "script_noteworthy" );
    final_teleport_struct.specific_spawns = utility::getstructarray( final_teleport_struct.target );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_c8e7c490c0d96ca", final_teleport_struct );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x9389505, Offset: 0x2cbb
// Size: 0x6c
function private on_round_start_callback( params )
{
    fishing_chance = params.roundnumber * ( params.roundnumber + 1 ) / 2;
    
    if ( utility::percent_chance( fishing_chance ) && zm_quest::is_quest_complete( #"hash_709d77ab2b2005c5" ) )
    {
        function_5826c8ca68de9fc1();
        level callback::remove( "on_round_start", &on_round_start_callback );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x16511c19, Offset: 0x2d2f
// Size: 0xbb
function function_5826c8ca68de9fc1()
{
    level.fishing_struct.var_cbec9bf7ad43437e = 1;
    
    if ( !isdefined( level.power_quest.var_e29658758f888ffd ) )
    {
        level.power_quest.var_e29658758f888ffd = 0;
    }
    
    fishing_spots = zm_sat_locust_util::get_quest_reference( #"hash_e14c6ea2335d2754" );
    scriptable = fishing_spots[ level.power_quest.var_e29658758f888ffd ].scriptable;
    scriptable setscriptablepartstate( #"vfx", #"enabled_irradiated" );
    scriptable.active_fish = 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x9cfe7c0, Offset: 0x2df2
// Size: 0x16
function private function_b051119f80877a9a( params )
{
    level thread function_b66985a3cb0d8e7d( params );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xf1ac3ae0, Offset: 0x2e10
// Size: 0x4d
function private function_c2fc27d07b0e596b( params )
{
    fishing_hole = params.fishing_hole;
    fishing_hole.scriptable setscriptablepartstate( #"vfx", #"disabled" );
    level thread function_d1e274bc07374d23();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x4ed9a44, Offset: 0x2e65
// Size: 0x88
function private function_d1e274bc07374d23()
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_01_b" );
    fishing_spots = zm_sat_locust_util::get_quest_reference( #"hash_e14c6ea2335d2754" );
    level.power_quest.var_e29658758f888ffd++;
    
    if ( level.power_quest.var_e29658758f888ffd == fishing_spots.size )
    {
        level.power_quest.var_e29658758f888ffd = 0;
        fishing_spots = arrayrandomize( fishing_spots );
    }
    
    level thread function_5826c8ca68de9fc1();
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x248cc273, Offset: 0x2ef5
// Size: 0x2
function function_a71ad83876f41112()
{
    
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x83909fa, Offset: 0x2eff
// Size: 0x20f
function private function_b66985a3cb0d8e7d( params, spawn_delay = 2 )
{
    spawn_origin = params.spawn_origin;
    spawn_node = { #angles:( 0, 0, 0 ), #origin:spawn_origin };
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        var_c2429c08ecbd101b = zm_round_logic::get_rb_round_number();
    }
    else
    {
        var_c2429c08ecbd101b = maxint( 15, zm_round_logic::get_rb_round_number() + 3 );
    }
    
    ai_type = subclass_to_aitype_map::function_427ae77ce1056e01( "zombie_shade", [ "stam_zm_sat_locust_irradiated_shade" ] );
    spawn_params = { #var_a83af9ca082b80b:0, #spawn_node:spawn_node, #difficulty_round_number:var_c2429c08ecbd101b, #spawner_zombie_type:ai_type };
    
    if ( spawn_delay > 0 )
    {
        wait spawn_delay;
    }
    
    zombie = zm_sat_locust_util::spawn_quest_zombie( spawn_params );
    
    if ( !isdefined( zombie ) )
    {
        assertmsg( "<dev string:x40>" );
        return;
    }
    
    zombie utility::ent_flag_wait( "zombie_asm_init_finished" );
    zombie.b_ignore_frenzied_guard = 1;
    zombie.b_ignore_monkey_bomb = 1;
    zombie.ignoreall = 1;
    zombie.var_7ee152b43c7188e1 = 1;
    zombie.var_33d9fb83f023e633 = 1;
    zombie.var_19238dbcc969affa = 0;
    zombie.teleporting = 1;
    zombie zombie_utils::function_dfae6a5bd222c586( &function_85c3e6f9037d111f );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_980b88deb2057ea8", zombie );
    zombie utility::function_32b24db3127bff40( "brainrot_irradiated", "brainrot_irradiated_on" );
    zombie.spawned_player = params.player;
    wait 2;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_35fd65a75bced5b5" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    zombie thread function_835d17e244f930c8();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xcbb4e19b, Offset: 0x3116
// Size: 0x68
function private function_835d17e244f930c8()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    level.power_quest.var_9ce2644b06c95783 = self.origin;
    self.teleporting = 1;
    thread function_bc85dbf3d71d7294();
    level callback::add( "on_round_start", &function_adf516e431678f71 );
    zm_quest::function_823ee6000b6e1947( zm_round_logic::get_rb_round_number() );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x7e5f5a34, Offset: 0x3186
// Size: 0xf8
function private function_adf516e431678f71( params )
{
    spawn_loc = function_6cf1be0a495a514d( level.power_quest.var_9ce2644b06c95783 );
    teleport_point = utility::array_random( spawn_loc.specific_spawns );
    var_b5a00474030439a5 = level function_bef570f816fa2a00( teleport_point.origin, teleport_point.angles );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_fc70f175ab2f21b0", var_b5a00474030439a5 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86ab6d0731a4ef6" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    zombie_shade_loot_consume::function_2c1c775b372991b0( 1 );
    level thread function_73b71b615cb78f00( params.roundnumber );
    level callback::remove( "on_round_start", &function_adf516e431678f71 );
    level callback::add( "on_zombie_ai_spawned", &function_429c070b10994f3f );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x24aa9995, Offset: 0x3286
// Size: 0xac
function private function_6cf1be0a495a514d( starting_pos, var_cf498b896e3c555d = 0 )
{
    teleport_locs = zm_sat_locust_util::get_quest_reference( #"hash_b7b3993133f11424" );
    sorted_locs = sortbydistance( teleport_locs, starting_pos, var_cf498b896e3c555d );
    possible_locs = utility::array_slice( sorted_locs, 0, 2 );
    spawn_loc = utility::array_random( possible_locs );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ddbb25d3bdb9646e" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"hash_ddbb25d3bdb9646e", spawn_loc );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ddbb25d3bdb9646e", spawn_loc );
    }
    
    return spawn_loc;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x6ac71f61, Offset: 0x333b
// Size: 0x253
function private function_bef570f816fa2a00( spawn_origin, spawn_angles = ( 0, 0, 0 ) )
{
    spawn_node = { #angles:spawn_angles, #origin:spawn_origin };
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        var_c2429c08ecbd101b = zm_round_logic::get_rb_round_number();
    }
    else
    {
        var_c2429c08ecbd101b = maxint( 15, zm_round_logic::get_rb_round_number() + 3 );
    }
    
    ai_type = subclass_to_aitype_map::function_427ae77ce1056e01( "zombie_shade", [ "stam_zm_sat_locust_irradiated_shade" ] );
    params = { #var_a83af9ca082b80b:0, #spawn_node:spawn_node, #difficulty_round_number:var_c2429c08ecbd101b, #spawner_zombie_type:ai_type };
    zombie = zm_sat_locust_util::spawn_quest_zombie( params );
    
    if ( !isdefined( zombie ) )
    {
        assertmsg( "<dev string:x5e>" );
        return;
    }
    
    if ( !isdefined( zombie.failsafe_position ) )
    {
        zombie.failsafe_position = ai::function_20e2b5e7fcba9f36( zombie.origin, 128, 0 );
    }
    
    if ( !zombie.failsafe_position )
    {
        zombie.failsafe_position = utility::getstruct( "ra_te_fs" );
        assertmsg( "<dev string:x82>" + zombie.origin );
    }
    
    zombie thread function_2057d7c9dad60ff2();
    zombie thread function_92b2c606d7193c1c();
    zombie function_3dcf471c072a2b06();
    zombie.b_ignore_frenzied_guard = 1;
    zombie.b_ignore_monkey_bomb = 1;
    zombie.ignoreall = 1;
    zombie.var_7ee152b43c7188e1 = 1;
    zombie.var_33d9fb83f023e633 = 1;
    zombie.var_19238dbcc969affa = 0;
    zombie.teleport_count = 0;
    zombie zombie_utils::function_dfae6a5bd222c586( &function_85c3e6f9037d111f );
    zombie callback::add( "on_zombie_ai_killed", &function_86296914a7e8f151 );
    zombie utility::function_32b24db3127bff40( "brainrot_irradiated", "brainrot_irradiated_on" );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"hash_980b88deb2057ea8", zombie );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_980b88deb2057ea8", zombie );
    }
    
    function_5763c91e056b33d9();
    return zombie;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0xd50e17db, Offset: 0x3597
// Size: 0x53
function private function_2057d7c9dad60ff2()
{
    self notify( #"hash_489cd9e307ba3071" );
    self endon( #"hash_489cd9e307ba3071" );
    self endon( #"death" );
    
    for ( ;; )
    {
        wait 1;
        
        if ( self.origin[ 2 ] <= -500 )
        {
            self.invalid_position = 1;
            self kill();
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xd166ef2d, Offset: 0x35f2
// Size: 0xa8
function private function_92b2c606d7193c1c()
{
    self endon( #"death" );
    max_dist = squared( 2048 );
    
    for ( ;; )
    {
        self waittill( #"bad_path", goal_pos );
        
        if ( distancesquared( self.origin, goal_pos ) < max_dist )
        {
            continue;
        }
        
        tacpoint = ai::function_20e2b5e7fcba9f36( goal_pos, 128, 0 );
        ground_pos = getclosestpointonnavmesh( tacpoint.origin );
        
        while ( zombie_traverse::is_traversing() )
        {
            waitframe();
        }
        
        self dontinterpolate();
        self forceteleport( ground_pos, self.angles, 10000 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xb7d27654, Offset: 0x36a2
// Size: 0x32
function private function_429c070b10994f3f( params )
{
    if ( self.subclass != "zombie_shade" )
    {
        return;
    }
    
    zombie_utils::function_a8ce00e0448cb6f0( "walk", "mq_power", 4 );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x35d1eebf, Offset: 0x36dc
// Size: 0x11e
function private function_85c3e6f9037d111f( params )
{
    if ( !isdefined( params.eattacker ) || self.teleporting || !isdefined( self ) )
    {
        return 0;
    }
    
    if ( self.ignoreall )
    {
        function_3dcf471c072a2b06();
        
        if ( level.power_quest.var_caf65d0f55f1d819 )
        {
            function_cc381071b07f7acd();
        }
        
        if ( utility::percent_chance( 5 ) )
        {
            function_c2d9399178ac1354( 0 );
        }
    }
    
    params.var_d3006097a8584457 = 1;
    
    if ( true )
    {
        adjusted_dmg = params.idamage * 1;
    }
    
    projected_pct = ( self.health - adjusted_dmg ) / self.maxhealth;
    var_c62a2e6b14834b5c = ( 2 - self.teleport_count ) / 3;
    
    if ( var_c62a2e6b14834b5c != 0 && projected_pct <= var_c62a2e6b14834b5c )
    {
        thread function_144a73db258585aa();
        self.teleport_count++;
        adjusted_dmg = maxint( self.health - int( self.maxhealth * var_c62a2e6b14834b5c ), 0 );
    }
    
    return adjusted_dmg;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x363842ba, Offset: 0x3803
// Size: 0x218
function private function_5763c91e056b33d9()
{
    level.power_quest.var_caf65d0f55f1d819 = [];
    
    if ( !isdefined( level.power_quest.var_438736aaa408cf2c ) )
    {
        level.power_quest.var_438736aaa408cf2c = [];
    }
    
    if ( !isdefined( level.power_quest.var_b787c20895fb4521 ) )
    {
        level.power_quest.var_b787c20895fb4521 = [];
    }
    
    var_67ca96e4298d3c34 = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
    num_to_spawn = max( 6 - level.power_quest.var_438736aaa408cf2c.size - level.power_quest.var_b787c20895fb4521.size, 0 );
    tacpoints = ai::function_76a020b1e49e4711( var_67ca96e4298d3c34.origin, 256, 16 );
    assert( tacpoints.size >= num_to_spawn );
    
    for ( i = 0; i < num_to_spawn ; i++ )
    {
        point = tacpoints[ i ].groundpos;
        zombie = function_21448d38fef98761( 0, point, 0 );
        
        if ( !zombie )
        {
            continue;
        }
        
        if ( !isdefined( zombie.failsafe_position ) )
        {
            zombie.failsafe_position = ai::function_20e2b5e7fcba9f36( zombie.origin, 128, 0 );
        }
        
        if ( !zombie.failsafe_position )
        {
            zombie.failsafe_position = utility::getstruct( "ra_te_fs" );
            assertmsg( "<dev string:x82>" + zombie.origin + "<dev string:xa8>" + point + "<dev string:xb2>" + var_67ca96e4298d3c34.origin );
        }
        
        zombie thread function_2057d7c9dad60ff2();
        zombie thread function_92b2c606d7193c1c();
        zombie zombie_utils::function_dfae6a5bd222c586( &function_efb44f9299a9c4f );
        level.power_quest.var_caf65d0f55f1d819 = arraycombineunique( level.power_quest.var_caf65d0f55f1d819, [ zombie ] );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x4f567fa2, Offset: 0x3a23
// Size: 0x52
function private function_efb44f9299a9c4f( params )
{
    if ( !isdefined( params.eattacker ) || !isdefined( self ) )
    {
        return 0;
    }
    
    var_67ca96e4298d3c34 = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
    var_67ca96e4298d3c34 function_3dcf471c072a2b06();
    function_cc381071b07f7acd();
    return -1;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x110b1942, Offset: 0x3a7e
// Size: 0xdd
function private function_cc381071b07f7acd()
{
    level notify( #"hash_2853ea076736c12e" );
    var_67ca96e4298d3c34 = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
    var_67ca96e4298d3c34 function_3dcf471c072a2b06();
    var_67ca96e4298d3c34 thread function_c2f521653eb73ebb();
    
    foreach ( zombie in level.power_quest.var_caf65d0f55f1d819 )
    {
        zombie zombie_utils::function_10c0c35c21e3ed9d( &function_efb44f9299a9c4f );
        zombie function_3dcf471c072a2b06();
    }
    
    level.power_quest.var_caf65d0f55f1d819 = undefined;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xf06404b9, Offset: 0x3b63
// Size: 0x5a
function private function_c2f521653eb73ebb()
{
    level endon( #"game_ended", #"mq_rp_step_01_b", #"hash_8775b4c428aca40b", #"hash_8dcc9a690df98965" );
    self endon( #"death", #"aggressive" );
    wait level.power_quest.var_5a646c31c16924ef;
    thread function_c2d9399178ac1354( 0 );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0xc
// Checksum 0x3a47cfa8, Offset: 0x3bc5
// Size: 0x249
function private function_73b71b615cb78f00( round_number )
{
    self notify( #"hash_c7ffd0a0497b00da" );
    self endon( #"hash_c7ffd0a0497b00da" );
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_01_b" );
    level endon( #"hash_8775b4c428aca40b" );
    level endon( #"hash_8dcc9a690df98965" );
    
    /#
        level endon( #"hash_54e157cf6ab1f177" );
    #/
    
    level.power_quest.var_df8667912641c452 = 6 + ( level.players.size - 1 ) * 3;
    
    if ( !isdefined( round_number ) )
    {
        round_number = zm_round_logic::get_rb_round_number();
    }
    
    if ( !isdefined( level.power_quest.var_438736aaa408cf2c ) )
    {
        level.power_quest.var_438736aaa408cf2c = [];
    }
    
    if ( !isdefined( level.power_quest.var_b787c20895fb4521 ) )
    {
        level.power_quest.var_b787c20895fb4521 = [];
    }
    
    current_teleport_loc = zm_sat_locust_util::get_quest_reference( #"hash_ddbb25d3bdb9646e" );
    valid_spawn_locs = function_6a293b884c444a20( level.zone_spawn_locations, current_teleport_loc.origin, current_teleport_loc.radius );
    spawn_zones = [];
    
    foreach ( spawn_loc in valid_spawn_locs )
    {
        if ( !arraycontains( spawn_zones, spawn_loc.zone_name ) )
        {
            zone_struct = zone_manager::get_zone_struct( spawn_loc.zone_name );
            spawn_zones = arraycombineunique( spawn_zones, [ zone_struct ] );
        }
    }
    
    wait 5;
    
    while ( true )
    {
        if ( level.power_quest.var_438736aaa408cf2c.size + level.power_quest.var_b787c20895fb4521.size < level.power_quest.var_df8667912641c452 )
        {
            function_21448d38fef98761( 0, undefined, undefined, spawn_zones );
        }
        
        wait zm_round_spawning::function_5f35aa2e209190da( round_number ) * 2;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 4, eflags: 0x4
// Checksum 0xe908a886, Offset: 0x3e16
// Size: 0x191
function private function_21448d38fef98761( is_aggressive = 0, spawn_position_override, var_487792fb181066ff = 0, spawn_zones )
{
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        var_c2429c08ecbd101b = zm_round_logic::get_rb_round_number();
    }
    else
    {
        var_c2429c08ecbd101b = maxint( 13, zm_round_logic::get_rb_round_number() + 1 );
    }
    
    params = { #var_a83af9ca082b80b:0, #spawn_anywhere:1, #difficulty_round_number:var_c2429c08ecbd101b, #spawner_zombie_type:"sat_spawner_zombie_shade_zm" };
    
    if ( spawn_position_override )
    {
        params.spawn_node = { #angles:( 0, 0, 0 ), #origin:spawn_position_override };
    }
    else if ( !is_aggressive )
    {
        params.spawn_zones = spawn_zones;
    }
    
    zombie = zm_sat_locust_util::spawn_quest_zombie( params );
    
    if ( !zombie )
    {
        return;
    }
    
    zombie.b_ignore_frenzied_guard = 1;
    zombie.b_ignore_monkey_bomb = 1;
    zombie.var_7ee152b43c7188e1 = 1;
    zombie.var_33d9fb83f023e633 = 1;
    zombie zombie_utils::function_dfae6a5bd222c586( &function_29718a9e29fe301a );
    zombie callback::add( "on_zombie_ai_killed", &function_9288f0710934bb5a );
    
    if ( is_aggressive )
    {
        zombie function_c2d9399178ac1354();
    }
    else
    {
        zombie function_431790344d3d9ad9();
        
        if ( var_487792fb181066ff )
        {
            zombie function_8822955601c0ff8();
        }
        else
        {
            zombie function_3dcf471c072a2b06();
        }
    }
    
    return zombie;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfe72a0d0, Offset: 0x3fb0
// Size: 0x74
function private function_29718a9e29fe301a( params )
{
    if ( self.ignoreall && level.power_quest.var_b787c20895fb4521.size < level.power_quest.var_df8667912641c452 * 0.3 && utility::percent_chance( 20 ) )
    {
        function_c2d9399178ac1354();
        zombie_utils::function_10c0c35c21e3ed9d( &function_29718a9e29fe301a );
    }
    
    return params.idamage;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xd8dacf62, Offset: 0x402d
// Size: 0x73
function private function_9288f0710934bb5a( params )
{
    if ( self.ignoreall )
    {
        level.power_quest.var_438736aaa408cf2c = arrayremove( level.power_quest.var_438736aaa408cf2c, self );
        return;
    }
    
    level.power_quest.var_b787c20895fb4521 = arrayremove( level.power_quest.var_b787c20895fb4521, self );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x945da44a, Offset: 0x40a8
// Size: 0x2df
function private function_144a73db258585aa()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    level endon( #"mq_rp_step_01_b" );
    level notify( #"hash_8775b4c428aca40b" );
    status_effects::function_4306f85454d862ba();
    self.teleporting = 1;
    self.ignoreall = 1;
    
    while ( zombie_traverse::is_traversing() )
    {
        waitframe();
    }
    
    self function_786bb6aa1b76c7ee( "in_spawn_reveal", 1 );
    utility::function_32b24db3127bff40( "portal", "portal" );
    utility::waittill_notify_or_timeout( "shade_spawn_portal_end", 0.2 );
    self hide();
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        foreach ( player in level.players )
        {
            zm_quest::function_38cacc34ddb8431c( player );
        }
    }
    
    utility::function_32b24db3127bff40( "portal", "off" );
    current_loc = zm_sat_locust_util::get_quest_reference( #"hash_ddbb25d3bdb9646e" );
    
    if ( self.teleport_count == 1 )
    {
        second_locs = zm_sat_locust_util::get_quest_reference( #"hash_776f972d98c7dd12" );
        next_loc = function_628bac9faa9d1e86( second_locs, current_loc.origin )[ 0 ];
    }
    else
    {
        next_loc = zm_sat_locust_util::get_quest_reference( #"hash_c8e7c490c0d96ca" );
    }
    
    zm_sat_locust_util::function_222215ce3aef9da1( #"hash_ddbb25d3bdb9646e", next_loc );
    wait 0.5;
    teleport_point = utility::array_random( next_loc.specific_spawns );
    function_8e7d865fff43c5e6();
    wait 4;
    self dontinterpolate();
    self forceteleport( teleport_point.origin, teleport_point.angles ?? self.angles, 10000 );
    utility::function_32b24db3127bff40( "portal", "portal" );
    self show();
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        foreach ( player in level.players )
        {
            zm_quest::function_1a1a1e0bd84ac45e( player );
        }
    }
    
    self clearaiblackboarddynamic( "in_spawn_reveal" );
    asm_bb::bb_clearanimscripted();
    wait 0.5;
    utility::function_32b24db3127bff40( "portal", "off" );
    function_3dcf471c072a2b06();
    self.teleporting = 0;
    wait 2;
    function_5763c91e056b33d9();
    level thread function_73b71b615cb78f00();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xf9e0d55c, Offset: 0x438f
// Size: 0x85
function private function_8e7d865fff43c5e6()
{
    foreach ( Ravager in level.power_quest.var_438736aaa408cf2c )
    {
        Ravager function_c2d9399178ac1354();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0x8e4c6b64, Offset: 0x441c
// Size: 0x222
function private function_61f09ffb47c7931e()
{
    self notify( #"hash_82ad9c8fd5fd9abd" );
    self endon( #"hash_82ad9c8fd5fd9abd" );
    level endon( #"game_ended" );
    self endon( #"death" );
    self endon( #"hash_d9d2c5ff77b5a717" );
    level endon( #"mq_rp_step_01_b" );
    self endon( #"move_to_new_zone" );
    self endon( #"aggressive" );
    self endon( #"hunt_uranium" );
    var_b3d2aeee7c27e6c1 = zm_sat_locust_util::get_quest_reference( #"hash_ddbb25d3bdb9646e" );
    goal_pos = ai::function_5790e62eb11d12d0( var_b3d2aeee7c27e6c1.origin, var_b3d2aeee7c27e6c1.radius, 200 ).groundpos;
    valid_point = zone_manager::is_zone_enabled( zone_manager::function_90e5c3e2272b0130( goal_pos ).script_zone_name );
    
    if ( valid_point )
    {
        attractor_loc = { #angles:( randomint( 360 ), 0, 0 ), #origin:goal_pos };
        
        if ( self.var_54b6b35eb6a860a2 )
        {
            zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.var_54b6b35eb6a860a2 );
        }
        
        self.var_54b6b35eb6a860a2 = zombie_attractor_manager::function_7eb1aaa8bc7cc15( attractor_loc, 4 );
    }
    
    start_time = gettime();
    
    while ( true )
    {
        if ( distancesquared( self.origin, goal_pos ) <= squared( 150 ) || gettime() > start_time + utility::function_4b74c15943231980( 4 ) )
        {
            goal_pos = ai::function_5790e62eb11d12d0( var_b3d2aeee7c27e6c1.origin, var_b3d2aeee7c27e6c1.radius, 200 ).groundpos;
            valid_point = zone_manager::is_zone_enabled( zone_manager::function_90e5c3e2272b0130( goal_pos ).script_zone_name );
            
            if ( valid_point )
            {
                attractor_loc = { #angles:( randomint( 360 ), 0, 0 ), #origin:goal_pos };
                
                if ( self.var_54b6b35eb6a860a2 )
                {
                    zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.var_54b6b35eb6a860a2 );
                }
                
                self.var_54b6b35eb6a860a2 = zombie_attractor_manager::function_7eb1aaa8bc7cc15( attractor_loc, 4 );
                start_time = gettime();
            }
        }
        
        wait 0.2;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x3f1c7f11, Offset: 0x4646
// Size: 0xc7
function private function_c2d9399178ac1354( var_4080c5d80677c53d = 1 )
{
    self notify( #"aggressive" );
    self.ignoreall = 0;
    
    if ( self.var_54b6b35eb6a860a2 )
    {
        zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.var_54b6b35eb6a860a2 );
    }
    
    self.var_a13bed1ac47e1b2c = 0;
    
    if ( arraycontains( level.power_quest.var_438736aaa408cf2c, self ) )
    {
        level.power_quest.var_438736aaa408cf2c = arrayremove( level.power_quest.var_438736aaa408cf2c, self );
    }
    
    if ( var_4080c5d80677c53d )
    {
        level.power_quest.var_b787c20895fb4521[ level.power_quest.var_b787c20895fb4521.size ] = self;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x5c07714a, Offset: 0x4715
// Size: 0xae
function private function_431790344d3d9ad9()
{
    self.ignoreall = 1;
    self.b_cleanup_no_respawn = 1;
    val::set( "quest_zombie", "ignore_cleanup", 1 );
    self.var_15598d8e493afe88 = 1;
    
    if ( arraycontains( level.power_quest.var_b787c20895fb4521, self ) )
    {
        level.power_quest.var_b787c20895fb4521 = arrayremove( level.power_quest.var_b787c20895fb4521, self );
    }
    
    level.power_quest.var_438736aaa408cf2c[ level.power_quest.var_438736aaa408cf2c.size ] = self;
    thread function_b40caf51526fab79();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0x6c4766e5, Offset: 0x47cb
// Size: 0x8b
function private function_b40caf51526fab79()
{
    self notify( #"hash_e28d27cbd6d52f10" );
    self endon( #"hash_e28d27cbd6d52f10" );
    level endon( #"game_ended", #"mq_rp_step_01_b" );
    self endon( #"death", #"aggressive" );
    
    while ( true )
    {
        nearby_players = getplayersinradius( self.origin, 150 );
        
        if ( nearby_players.size != 0 && utility::percent_chance( 10 ) )
        {
            break;
        }
        
        wait 0.5;
    }
    
    thread function_c2d9399178ac1354();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xe70d4ce9, Offset: 0x485e
// Size: 0x76
function private function_8822955601c0ff8()
{
    self notify( #"hash_d9d2c5ff77b5a717" );
    
    if ( self.var_54b6b35eb6a860a2 )
    {
        zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.var_54b6b35eb6a860a2 );
    }
    
    attractor_loc = { #angles:( randomint( 360 ), 0, 0 ), #origin:self.origin };
    self.var_54b6b35eb6a860a2 = zombie_attractor_manager::function_7eb1aaa8bc7cc15( attractor_loc, 4 );
    thread function_9dc8110cc109bc32();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0x6482674, Offset: 0x48dc
// Size: 0x79
function private function_9dc8110cc109bc32()
{
    self notify( #"hash_dc1bd546d229d767" );
    self endon( #"hash_dc1bd546d229d767" );
    level endon( #"game_ended" );
    self endon( #"death" );
    level endon( #"mq_rp_step_01_b" );
    level endon( #"hash_2853ea076736c12e" );
    
    while ( true )
    {
        if ( getplayersinradius( self.origin, 400 ).size > 0 )
        {
            level thread function_cc381071b07f7acd();
            break;
        }
        
        wait 0.1;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x6a350874, Offset: 0x495d
// Size: 0x25
function private function_3dcf471c072a2b06()
{
    if ( self.var_54b6b35eb6a860a2 )
    {
        zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.var_54b6b35eb6a860a2 );
    }
    
    thread function_61f09ffb47c7931e();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xf286fcad, Offset: 0x498a
// Size: 0x208
function private function_86296914a7e8f151( params )
{
    position = self.origin;
    
    if ( self.invalid_position )
    {
        position = self.failsafe_position.origin;
    }
    
    if ( !zone_manager::is_point_inside_enabled_zone( position ) )
    {
        failsafe = utility::getstruct( "ra_te_fs" );
        position = failsafe.origin;
    }
    
    params = { #spawntype:#"hash_c604389cbd8cab64", #fromangles:self.angles, #fromorigin:position + ( 0, 0, 10 ), #asset:%"zmloot_sat_locust_quest_jasper_guided" };
    params.payload = function_67b78af3c33ac9a8( 2 );
    item = zm_sat_locust_util::spawn_quest_item( params );
    item.script_string = "b";
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_3a817533cf6b9615", item );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86ab7d0731a50a9" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    if ( level.power_quest.var_3d420115e3109d >= level.power_quest.var_8d14311d7b058c8 || zm_quest::function_b0a5181ebe7bb905() )
    {
        level notify( #"hash_8dcc9a690df98965" );
        
        foreach ( Ravager in level.power_quest.var_438736aaa408cf2c )
        {
            Ravager function_c2d9399178ac1354();
        }
        
        return;
    }
    
    level thread function_4b503ab717b55005();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x67432e48, Offset: 0x4b9a
// Size: 0x1ef
function private function_4b503ab717b55005()
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_01_b" );
    wait level.power_quest.var_88661d5a8129d3d5;
    
    while ( level.power_quest.var_438736aaa408cf2c.size == 0 )
    {
        waitframe();
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_3a817533cf6b9615" ) )
    {
        item = zm_sat_locust_util::get_quest_reference( #"hash_3a817533cf6b9615" );
        attractor_loc = { #angles:item.angles, #origin:item.origin };
    }
    
    while ( item )
    {
        var_327c777d029769a0 = sortbydistance( level.power_quest.var_438736aaa408cf2c, item.origin )[ 0 ];
        
        if ( var_327c777d029769a0.subclass != "zombie_shade" )
        {
            waitframe();
            continue;
        }
        
        var_327c777d029769a0 notify( #"hunt_uranium" );
        
        if ( var_327c777d029769a0.var_54b6b35eb6a860a2 )
        {
            var_327c777d029769a0 zombie_attractor_manager::function_dcfb4c31f1d97cd2( var_327c777d029769a0.var_54b6b35eb6a860a2 );
        }
        
        var_327c777d029769a0.var_54b6b35eb6a860a2 = var_327c777d029769a0 zombie_attractor_manager::function_7eb1aaa8bc7cc15( attractor_loc, 4 );
        
        while ( isalive( var_327c777d029769a0 ) )
        {
            if ( distancesquared( var_327c777d029769a0.origin, item.origin ) <= squared( 30 ) )
            {
                consume_result = var_327c777d029769a0 zombie_shade_loot_consume::function_358b866c88d3f426( item, 3 );
                
                if ( consume_result )
                {
                    break;
                }
                else
                {
                    /#
                        iprintlnbold( "<dev string:xc3>" );
                    #/
                }
            }
            
            waitframe();
        }
        
        if ( var_327c777d029769a0.var_54b6b35eb6a860a2 )
        {
            var_327c777d029769a0 zombie_attractor_manager::function_dcfb4c31f1d97cd2( var_327c777d029769a0.var_54b6b35eb6a860a2 );
        }
        
        var_327c777d029769a0 utility::waittill_any( "consume_loot_end", "death" );
        
        if ( isalive( var_327c777d029769a0 ) )
        {
            level thread function_ad676ef3ea47f55e( var_327c777d029769a0 );
            break;
        }
        else
        {
            continue;
        }
        
        waitframe();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xbc9de8c7, Offset: 0x4d91
// Size: 0x1e4
function private function_ad676ef3ea47f55e( Ravager )
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_01_b" );
    
    if ( !isdefined( level.power_quest.var_3d420115e3109d ) )
    {
        level.power_quest.var_3d420115e3109d = 0;
    }
    
    level.power_quest.var_3d420115e3109d++;
    level.power_quest.var_9ce2644b06c95783 = Ravager.origin;
    zm_sat_locust_util::function_a70056d3a99eace5( #"hash_3a817533cf6b9615" );
    Ravager utility::function_32b24db3127bff40( "brainrot_irradiated", "brainrot_irradiated_on" );
    Ravager.teleporting = 1;
    Ravager zombie_utils::function_dfae6a5bd222c586( &function_85c3e6f9037d111f );
    
    if ( level.power_quest.var_3d420115e3109d == 1 )
    {
        var_ec428ca55ae51c0e = [ "dx_zm_lomn_2eps_lvtw_ml2ursta1ln1", "dx_zm_lomn_2eps_detw_ml2ursta1ln2" ];
        var_ec428ba55ae519db = [ "dx_zm_lomn_2eps_detw_ml2ursta2ln1", "dx_zm_lomn_2eps_lvtw_ml2ursta2ln2" ];
        level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 0.5 );
    }
    
    wait 2;
    Ravager function_bc85dbf3d71d7294();
    wait 0.5;
    teleport_locs = zm_sat_locust_util::get_quest_reference( #"hash_b7b3993133f11424" );
    spawn_loc = utility::array_random( teleport_locs );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ddbb25d3bdb9646e" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"hash_ddbb25d3bdb9646e", spawn_loc );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ddbb25d3bdb9646e", spawn_loc );
    }
    
    teleport_point = utility::array_random( spawn_loc.specific_spawns );
    level function_bef570f816fa2a00( teleport_point.origin, teleport_point.angles );
    function_8e7d865fff43c5e6();
    level thread function_73b71b615cb78f00();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xb7a876e0, Offset: 0x4f7d
// Size: 0x128
function private function_fe3ad516eb3563db()
{
    level.var_f4f8c9a351eaab32.var_2afe3d6a4d95065b = [];
    level.var_f4f8c9a351eaab32.var_e722b24f3444e929 = [];
    
    foreach ( Ravager in level.power_quest.var_438736aaa408cf2c )
    {
        Ravager thread function_bc85dbf3d71d7294();
    }
    
    foreach ( Ravager in level.power_quest.var_b787c20895fb4521 )
    {
        Ravager thread function_bc85dbf3d71d7294();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xc1705f5b, Offset: 0x50ad
// Size: 0xa7
function private function_bc85dbf3d71d7294()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self.b_cleanup_no_respawn = 1;
    self.var_15598d8e493afe88 = 1;
    callback::remove( "on_zombie_ai_killed", &function_9288f0710934bb5a );
    self function_786bb6aa1b76c7ee( "in_spawn_reveal", 1 );
    utility::function_32b24db3127bff40( "portal", "portal" );
    utility::waittill_notify_or_timeout( "shade_spawn_portal_end", 0.2 );
    
    if ( self.spawned_player )
    {
        self.spawned_player thread zm_vo::function_8c1a12974bd11f01( #"hash_4cec802b2236bf62", #"hash_5212ed7ec42f115a" );
    }
    
    zm_sat_locust_util::cleanup_zombie( 1 );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xd8abbbdf, Offset: 0x515c
// Size: 0x1d9
function private function_401019ddb9f7f8b( skipped, save_restored )
{
    utility::flag_wait( "step01_c_init" );
    zm_sat_locust_util::log_quest_step( 1, #"hash_b3d131d0de8f581", skipped, save_restored );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"vent_blocker" ) )
    {
        vent_blocker = zm_sat_locust_util::get_quest_reference( #"vent_blocker" );
        vent_blocker setscriptablepartstate( #"sat_zm_locust_vent_blocker", #"damage_detect" );
    }
    
    zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", "vent blocker state is " + ( vent_blocker ? vent_blocker getscriptablepartstate( #"sat_zm_locust_vent_blocker" ) : " NOT DEFINED" ) );
    function_3771f3e19332a345();
    
    if ( skipped || save_restored )
    {
        return;
    }
    
    spawn_struct = zm_sat_locust_util::get_quest_reference( #"hash_79f4f84a6bd436ca" );
    asset = zm_sat_locust_util::get_quest_item_ref( %"zmloot_sat_locust_quest_jasper" );
    spawn_params = { #spawntype:#"spawn_at_pos", #spawnangles:spawn_struct.angles, #spawnorigin:spawn_struct.origin, #asset:asset };
    spawn_params.payload = function_67b78af3c33ac9a8( 2 );
    item = zm_sat_locust_util::spawn_quest_item( spawn_params );
    item.script_string = "c";
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_3a817433cf6b9462", item );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"lab_door" ) && !level callback::exists( "rcxd_exploded", &function_8ebb33d5e7cdd41d ) )
    {
        level callback::add( "rcxd_exploded", &function_8ebb33d5e7cdd41d );
    }
    
    utility::flag_wait( "mq_rp_step_01_c" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xc168121c, Offset: 0x533d
// Size: 0x2dc
function private function_83c8a9698e3c86f8( skipped, save_restored )
{
    profilestart();
    zm_sat_locust_util::log_quest_step( 0, #"hash_b3d131d0de8f581", skipped, save_restored );
    
    if ( skipped || save_restored )
    {
        if ( !isdefined( level.power_quest.collected_uranium ) )
        {
            level.power_quest.collected_uranium = 0;
        }
        
        level.power_quest.collected_uranium++;
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"Uranium", level.power_quest.collected_uranium + level.power_quest.var_552b0a0c0c39c206 );
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"crab_lockpick", 1 );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_3a817433cf6b9462" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"vent_blocker" );
        zone_manager::set_zone_enabled( "zone_fishery_lab", 1 );
        utility::flag_set( "zone_fishery_lab_opened" );
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"lab_door" ) )
        {
            lab_door = zm_sat_locust_util::get_quest_reference( #"lab_door" );
            lab_door.fx freescriptable();
            
            if ( lab_door.clip )
            {
                lab_door.clip delete();
            }
            
            lab_door delete();
        }
        
        zm_sat_locust_util::function_a70056d3a99eace5( #"lab_barrels" );
        function_ace89b93a2d40a3c();
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_2d3e8588dd9589cf" );
        function_99eeed03928060ea();
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_30fcdc017552a849" );
        utility::flag_set( "mq_rp_step_01_c" );
        function_4cff45cfd956ece6( undefined, 1 );
        level callback::remove( #"player_death", &function_c3ebe56f91ed886 );
        level callback::remove( #"player_disconnect", &function_c3ebe56f91ed886 );
        zm_sat_locust_util::function_7bf944a5a2b76f39( #"hash_f461616130a30415" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86ab9d0731a540f" );
        utility::flag_set( #"hash_f86abad0731a55c2" );
        utility::flag_set( #"hash_f86abbd0731a5775" );
        utility::flag_set( #"hash_f86abcd0731a5928" );
        utility::flag_set( #"hash_f86abdd0731a5adb" );
        utility::flag_set( #"hash_f86dbad0731c8b99" );
    }
    
    level.fishing_struct.force_rcxd = 0;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    level callback::remove( "rcxd_exploded", &function_8ebb33d5e7cdd41d );
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xb6ecd868, Offset: 0x5621
// Size: 0x398
function private function_8650c8d6c4461d64()
{
    vent_blocker = getentitylessscriptablearray( %"sat_zm_locust_vent_blocker" )[ 0 ];
    
    if ( vent_blocker )
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"vent_blocker", vent_blocker );
    }
    
    lab_door = getent( "fishery_lab_door_rubble", #targetname );
    lab_door_clip = getent( "fishery_lab_door", #targetname );
    
    if ( lab_door )
    {
        lab_door.clip = lab_door_clip;
    }
    else
    {
        lab_door = lab_door_clip;
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"lab_door", lab_door );
    barrel_locs = utility::getstructarray( "mqpo_la_ba" );
    zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", "Number of Barrel locs found = " + barrel_locs.size );
    lab_door.fx = spawnscriptable( %"sat_zm_locust_lab_blocker", lab_door.origin, lab_door.angles );
    barrels = [];
    
    foreach ( loc in barrel_locs )
    {
        barrel = spawnscriptable( %"sat_zm_prop_barrel", loc.origin, loc.angles );
        barrels[ barrels.size ] = barrel;
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"lab_barrels", barrels );
    zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", "Number of Barrel scriptables spawned = " + barrels.size );
    var_e4c218f03647b817 = utility::getstruct( "mqpo_ur_sp_la" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_79f4f84a6bd436ca", var_e4c218f03647b817 );
    
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"lab_uranium_cell_door" ) )
    {
        cell_door = getent( "lab_uranium_cell_door", #targetname );
        cell_door.clip = getent( "lab_uranium_cell_door_clip", #targetname );
        
        if ( cell_door )
        {
            zm_sat_locust_util::function_295a36ef38f5acae( #"lab_uranium_cell_door", cell_door );
            
            if ( cell_door.clip )
            {
                cell_door.clip linkto( cell_door, "tag_origin" );
            }
        }
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_8786c05a63d826c9" );
    }
    
    lockpick_loc = utility::getstruct( "mqpo_ur_la_lo" );
    lockpick_interact = spawnscriptable( %"misc_puzzles_lockpick_interact", lockpick_loc.origin, lockpick_loc.angles );
    zm_sat_locust_util::register_limited_interact( lockpick_interact, &function_5d18a34399228d78, &function_4422cf229e1d5434, &function_76d0da4f099e41c0, hint );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_6c7f753a7756664", lockpick_interact );
    jars = function_86ccdfcb5859a20f();
    
    if ( !jars )
    {
        level.power_quest.lockpick_held = 1;
    }
    
    utility::add_fx( "lab_cell_open", "vfx_sat_levels_zm_locust_mq_cell_door_open_destr" );
    utility::flag_set( "step01_c_init" );
    utility::flag_wait( "scriptables_ready" );
    lockpick_interact setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"unusable" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x7adb4d05, Offset: 0x59c1
// Size: 0x345, Type: bool
function private function_86ccdfcb5859a20f()
{
    var_a0b2c3727ab63f53 = getentitylessscriptablearray( "scriptable_sat_zm_prop_kenton", "classname" )[ 0 ];
    var_f7b6fa769da6da46 = utility::getstruct( "mqpo_ya_en" );
    
    if ( !var_a0b2c3727ab63f53 || !var_f7b6fa769da6da46 )
    {
        zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", "Lab fallback triggered - Machine: " + ( var_a0b2c3727ab63f53 ? "DEFINED" : "UNDEFINED" ) + " Necro Arm: " + ( var_f7b6fa769da6da46 ? "DEFINED" : "UNDEFINED" ) );
        return false;
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        pickup_hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_cc24a7e415c2d1fa" );
        pour_hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_96f397939d24f478" );
        place_hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_a94659effa7c6b35" );
    }
    
    interaction::register_scriptable_interact( var_a0b2c3727ab63f53, &function_a0d370b03091f4c9, undefined, undefined, place_hint );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_f48d6a93accac874", var_a0b2c3727ab63f53 );
    var_a0b2c3727ab63f53.var_5411e9605c1d79a0 = 0;
    level.power_quest.var_3ff4b2737e042ae = 0;
    var_e1f0f337e9c9d010 = getentitylessscriptablearray( "scriptable_sat_zm_prop_kenneth", "classname" );
    var_755c586c3e207bf6 = [];
    var_87692895afac9198 = [];
    var_bd69b7ed499b81e4 = getentitylessscriptablearray( "scriptable_sat_zm_prop_kenneth_02", "classname" )[ 0 ];
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_2d3e8588dd9589cf", var_bd69b7ed499b81e4 );
    
    foreach ( jar in var_e1f0f337e9c9d010 )
    {
        if ( issubstr( jar.script_noteworthy, "kenton" ) )
        {
            var_755c586c3e207bf6[ var_755c586c3e207bf6.size ] = jar;
            continue;
        }
        
        var_87692895afac9198[ var_87692895afac9198.size ] = jar;
        interaction::register_scriptable_interact( jar, &function_513f657b3a0db609, undefined, undefined, pickup_hint );
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_cf19467c1279d6df", var_755c586c3e207bf6 );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_2ae4cc0540a8e80b", var_87692895afac9198 );
    var_54225e2ede4c9bb7 = utility::getstructarray( "mqpo_gi_si" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_c075a5c8360fa936", var_54225e2ede4c9bb7 );
    var_f7b6fa769da6da46 = utility::spawn_model( %"c_sat_zmb_karkinos_claw_quest", var_f7b6fa769da6da46.origin, var_f7b6fa769da6da46.angles, undefined, 0.8 );
    var_f7b6fa769da6da46 setcandamage( 0 );
    interaction::register_scriptable_interact( var_f7b6fa769da6da46 getlinkedscriptableinstance(), &function_5d102b0de182e79a, undefined, undefined, pour_hint );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_30fcdc017552a849", var_f7b6fa769da6da46 );
    lockpick_spawn_loc = utility::getstruct( "mqpo_zi_sp" );
    lockpick_spawn_loc.drop_loc = utility::getstruct( lockpick_spawn_loc.target );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ec5ede4c7c6a23f9", lockpick_spawn_loc );
    return true;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x73ab731a, Offset: 0x5d0f
// Size: 0x11f
function private function_5fcbbe9b263e63cf()
{
    if ( !zm_save::function_1dda3554974a999e() )
    {
        return;
    }
    
    utility::flag_wait( "zm_save_level_restore_keys_complete" );
    lab_open = zm_quest::function_73720cdf21c3cfd7( #"hash_7b26a8bb39d7312", #"lab_open" );
    
    if ( !isdefined( lab_open ) )
    {
        lab_open = 0;
    }
    
    zm_quest::function_4eefe6de31f5ddab( #"hash_7b26a8bb39d7312", #"lab_open", lab_open );
    
    if ( utility::flag( "mq_rp_step_01_c" ) )
    {
        return;
    }
    
    if ( lab_open )
    {
        zone_manager::set_zone_enabled( "zone_fishery_lab", 1 );
        utility::flag_set( "zone_fishery_lab_opened" );
        lab_door = zm_sat_locust_util::get_quest_reference( #"lab_door" );
        
        if ( lab_door.clip )
        {
            lab_door.clip delete();
        }
        
        lab_door delete();
        zm_sat_locust_util::function_a70056d3a99eace5( #"vent_blocker" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"lab_barrels" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_f86ab9d0731a540f" );
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x33cca061, Offset: 0x5e36
// Size: 0x38c
function private function_3771f3e19332a345()
{
    if ( level.power_quest.lockpick_held )
    {
        zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581", "Lab fallback triggered - lockpick already held" );
        lockpick_interact = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" );
        lockpick_interact setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"usable_no_hint" );
        return;
    }
    
    jar_indexes = [ 1, 2, 3, 4, 5 ];
    jar_indexes = arrayrandomize( jar_indexes );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_c74278768e6ac8e3", jar_indexes );
    var_3ff4b2737e042ae = [];
    var_755c586c3e207bf6 = zm_sat_locust_util::get_quest_reference( #"hash_cf19467c1279d6df" );
    var_87692895afac9198 = zm_sat_locust_util::get_quest_reference( #"hash_2ae4cc0540a8e80b" );
    var_bd69b7ed499b81e4 = zm_sat_locust_util::get_quest_reference( #"hash_2d3e8588dd9589cf" );
    var_54225e2ede4c9bb7 = zm_sat_locust_util::get_quest_reference( #"hash_c075a5c8360fa936" );
    
    foreach ( jar in var_755c586c3e207bf6 )
    {
        jar setscriptablepartstate( #"sat_zm_prop_kenneth", #"disabled" );
        jar setscriptablepartstate( #"usable", #"disabled" );
    }
    
    var_bd69b7ed499b81e4 setscriptablepartstate( #"usable", #"disabled" );
    var_87692895afac9198 = arrayrandomize( var_87692895afac9198 );
    
    for ( i = 0; i < jar_indexes.size ; i++ )
    {
        jar = var_87692895afac9198[ i ];
        jar_type = jar_indexes[ i ];
        jar setscriptablepartstate( #"sat_zm_prop_kenneth", hashcat( #"hash_cb1ce1d343afe605", jar_type ) );
        is_required = 0;
        
        if ( i < var_755c586c3e207bf6.size )
        {
            var_3ff4b2737e042ae[ var_3ff4b2737e042ae.size ] = jar;
            is_required = 1;
        }
        
        jar.jar_data = { #is_required:is_required, #jar_type:jar_type };
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            if ( !jar.jar_data.is_required )
            {
                jar setscriptablepartstate( #"usable", #"disabled" );
            }
        }
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_58290f97ca66b849", var_3ff4b2737e042ae );
    
    foreach ( clue in var_54225e2ede4c9bb7 )
    {
        for ( i = 0; i < var_755c586c3e207bf6.size ; i++ )
        {
            if ( int( clue.script_noteworthy ) == jar_indexes[ i ] )
            {
                clue.sign = utility::spawn_model( %"sign_lab_biological_hazard", clue.origin, clue.angles, undefined, 0.7 );
            }
        }
    }
    
    level.power_quest.var_52cf00fe62f2a886 = [];
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xb4dd20f8, Offset: 0x61ca
// Size: 0x1b8
function private function_8ebb33d5e7cdd41d( params )
{
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"lab_door" ) )
    {
        return;
    }
    
    trigger = getnoentvolumearray( "lab_damage", #targetname )[ 0 ];
    valid = ispointinvolume( params.rcxd.veh_origin, trigger, 1 ) || ispointinvolume( params.rcxd.origin, trigger, 1 );
    
    if ( !valid )
    {
        zone = zone_manager::function_90e5c3e2272b0130( params.rcxd.origin );
        player_zone = zone_manager::function_90e5c3e2272b0130( params.rcxd.owner.origin );
        
        if ( zone.zone_name != "zone_fishery_lab" || player_zone.zone_name == "zone_fishery" )
        {
            return;
        }
    }
    
    lab_door = zm_sat_locust_util::get_quest_reference( #"lab_door" );
    
    if ( valid || distance2dsquared( params.rcxd.veh_origin, lab_door.origin ) < squared( 260 ) || distance2dsquared( params.rcxd.origin, lab_door.origin ) < squared( 260 ) )
    {
        lab_open();
        level.fishing_struct.force_rcxd = 0;
        level callback::remove( "rcxd_exploded", &function_8ebb33d5e7cdd41d );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0x177bb4ef, Offset: 0x638a
// Size: 0x1cc
function private lab_open()
{
    self notify( #"hash_c3f9aba79e9cf147" );
    self endon( #"hash_c3f9aba79e9cf147" );
    zm_quest::function_4eefe6de31f5ddab( #"hash_7b26a8bb39d7312", #"lab_open", 1 );
    zone_manager::set_zone_enabled( "zone_fishery_lab", 1 );
    lab_barrels = zm_sat_locust_util::get_quest_reference( #"lab_barrels" );
    
    foreach ( barrel in lab_barrels )
    {
        barrel utility::delaycall( level.framedurationseconds, &setscriptablepartstate, #"base", #"death" );
    }
    
    lab_rubble = zm_sat_locust_util::get_quest_reference( #"lab_door" );
    lab_rubble.fx setscriptablepartstate( #"sat_zm_locust_lab_blocker", #"explode" );
    lab_rubble.fx utility::delaycall( 5, &freescriptable );
    
    if ( lab_rubble.clip )
    {
        lab_rubble.clip delete();
    }
    
    lab_rubble delete();
    trigger = getnoentvolumearray( "lab_damage", #targetname )[ 0 ];
    
    if ( trigger )
    {
        trigger delete();
    }
    
    utility::flag_set( "zone_fishery_lab_opened" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86ab9d0731a540f" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x9986d430, Offset: 0x655e
// Size: 0x77e
function private function_a0d370b03091f4c9( player )
{
    if ( self.var_5411e9605c1d79a0 < 2 && level.power_quest.var_52cf00fe62f2a886.size > 0 && !self.activated && !self.var_92312339e02c8408 )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        self setscriptablepartstate( #"sat_zm_prop_kenton", #"unusable" );
        var_755c586c3e207bf6 = zm_sat_locust_util::get_quest_reference( #"hash_cf19467c1279d6df" );
        
        for ( i = 0; i < var_755c586c3e207bf6.size ; i++ )
        {
            jar = var_755c586c3e207bf6[ i ];
            
            if ( jar.placed )
            {
                continue;
            }
            
            jar.placed = 1;
            jar setscriptablepartstate( #"sat_zm_prop_kenneth", hashcat( #"hash_cb1ce1d343afe605", level.power_quest.var_52cf00fe62f2a886[ 0 ].jar_type ) );
            jar setscriptablepartstate( #"fx", #"placed" );
            jar.jar_data = level.power_quest.var_52cf00fe62f2a886[ 0 ];
            
            if ( jar.jar_data.is_required )
            {
                level.power_quest.var_3ff4b2737e042ae++;
            }
            
            self.var_5411e9605c1d79a0++;
            
            if ( self.var_5411e9605c1d79a0 == 2 && !self.var_1417986a8419f192 )
            {
                if ( player zm_vo::is_hero_operator() )
                {
                    player thread zm_vo::function_8c1a12974bd11f01( #"hash_70a1c6e6d2e433c0" );
                }
                
                self.var_1417986a8419f192 = 1;
            }
            
            level.power_quest.var_52cf00fe62f2a886 = arrayremove( level.power_quest.var_52cf00fe62f2a886, level.power_quest.var_52cf00fe62f2a886[ 0 ] );
            break;
        }
        
        all_placed = 1;
        
        foreach ( jar in var_755c586c3e207bf6 )
        {
            if ( !jar.placed )
            {
                all_placed = 0;
                break;
            }
        }
        
        if ( all_placed )
        {
            thread function_1ac7bfe22cdffedd();
        }
        else
        {
            utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_kenton", #"usable" );
        }
        
        if ( zm_quest::function_b0a5181ebe7bb905() && utility::flag( "mq_rm_core" ) && utility::flag( "mq_rp_step_01_b" ) )
        {
            self setscriptablepartstate( #"objective", #"none" );
            
            if ( !all_placed )
            {
                jars = zm_sat_locust_util::get_quest_reference( #"hash_58290f97ca66b849" );
                
                foreach ( jar in jars )
                {
                    if ( jar getscriptablepartstate( #"sat_zm_prop_kenneth" ) != "disabled" )
                    {
                        jar setscriptablepartstate( #"objective", #"enabled" );
                    }
                }
            }
        }
        
        return;
    }
    
    if ( self.var_92312339e02c8408 )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        self setscriptablepartstate( #"sat_zm_prop_kenton", #"unusable" );
        
        if ( !self.var_73a63ba937fd338b && player zm_vo::is_hero_operator() )
        {
            player thread zm_vo::function_8c1a12974bd11f01( #"hash_8f5c700f06be8441" );
            self.var_73a63ba937fd338b = 1;
        }
        
        var_bd69b7ed499b81e4 = zm_sat_locust_util::get_quest_reference( #"hash_2d3e8588dd9589cf" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"sat_zm_prop_kenneth_02", #"disabled" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"fx", #"picked_up" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            var_bd69b7ed499b81e4 setscriptablepartstate( #"objective", #"none" );
        }
        
        level.power_quest.var_afad28a32492da42 = 1;
        
        if ( level.power_quest.var_3ff4b2737e042ae == 2 )
        {
            level.power_quest.var_1ed4540bb3e16a0d = 1;
            
            if ( zm_quest::function_b0a5181ebe7bb905() )
            {
                utility::flag_set( #"hash_f86abbd0731a5775" );
                level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
            }
        }
        
        self.var_92312339e02c8408 = 0;
        var_f7b6fa769da6da46 = zm_sat_locust_util::get_quest_reference( #"hash_30fcdc017552a849" );
        var_f7b6fa769da6da46 setscriptablepartstate( #"usable", #"on" );
        return;
    }
    
    if ( level.power_quest.var_52cf00fe62f2a886.size < 1 && self.var_5411e9605c1d79a0 > 0 )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        self setscriptablepartstate( #"sat_zm_prop_kenton", #"unusable" );
        utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_kenton", #"usable" );
        var_755c586c3e207bf6 = zm_sat_locust_util::get_quest_reference( #"hash_cf19467c1279d6df" );
        
        for ( i = var_755c586c3e207bf6.size - 1; i > -1 ; i-- )
        {
            jar = var_755c586c3e207bf6[ i ];
            
            if ( !jar.placed )
            {
                continue;
            }
            
            jar.placed = 0;
            jar setscriptablepartstate( #"sat_zm_prop_kenneth", #"disabled" );
            jar setscriptablepartstate( #"fx", #"picked_up" );
            jar.hidden = 1;
            
            if ( jar.clue )
            {
                jar.clue delete();
            }
            
            level.power_quest.var_52cf00fe62f2a886[ level.power_quest.var_52cf00fe62f2a886.size ] = jar.jar_data;
            
            if ( jar.jar_data.is_required )
            {
                level.power_quest.var_3ff4b2737e042ae--;
            }
            
            self.var_5411e9605c1d79a0--;
            jar.jar_data = undefined;
            break;
        }
        
        if ( zm_quest::function_b0a5181ebe7bb905() && utility::flag( "mq_rm_core" ) && utility::flag( "mq_rp_step_01_b" ) )
        {
            self setscriptablepartstate( #"objective", #"enabled" );
            jars = zm_sat_locust_util::get_quest_reference( #"hash_58290f97ca66b849" );
            
            foreach ( jar in jars )
            {
                jar setscriptablepartstate( #"objective", #"none" );
            }
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xc23a2bcd, Offset: 0x6ce4
// Size: 0x152
function private function_1ac7bfe22cdffedd()
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_01_c" );
    self setscriptablepartstate( #"sat_zm_prop_kenton", #"unusable" );
    self setscriptablepartstate( #"fx", #"on" );
    self.activated = 1;
    var_bd69b7ed499b81e4 = zm_sat_locust_util::get_quest_reference( #"hash_2d3e8588dd9589cf" );
    var_bd69b7ed499b81e4 setscriptablepartstate( #"fx", hashcat( #"hash_fba1d6516c093847", level.power_quest.var_3ff4b2737e042ae + 1 ) );
    wait 5;
    self.activated = 0;
    self.var_92312339e02c8408 = 1;
    self setscriptablepartstate( #"sat_zm_prop_kenton", #"usable" );
    var_bd69b7ed499b81e4 setscriptablepartstate( #"fx", #"off" );
    var_bd69b7ed499b81e4 setscriptablepartstate( #"sat_zm_prop_kenneth_02", hashcat( #"hash_9974aadae3d43296", level.power_quest.var_3ff4b2737e042ae + 1 ) );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86abad0731a55c2" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x6226ff99, Offset: 0x6e3e
// Size: 0x36
function private function_63829fb8a68f5d85( interact, player )
{
    return { #string:&"", #type:"HINT_NOICON" };
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x71808163, Offset: 0x6e7d
// Size: 0x4c5
function private function_513f657b3a0db609( player )
{
    if ( level.power_quest.var_afad28a32492da42 )
    {
        return;
    }
    
    machine = zm_sat_locust_util::get_quest_reference( #"hash_f48d6a93accac874" );
    
    if ( machine.activated || machine.var_92312339e02c8408 )
    {
        return;
    }
    
    if ( self.hidden )
    {
        if ( level.power_quest.var_52cf00fe62f2a886.size == 0 )
        {
            return;
        }
        
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        self setscriptablepartstate( #"sat_zm_prop_kenneth", hashcat( #"hash_cb1ce1d343afe605", level.power_quest.var_52cf00fe62f2a886[ 0 ].jar_type ) );
        self setscriptablepartstate( #"fx", #"placed" );
        self setscriptablepartstate( #"usable", #"disabled" );
        utility::delaycall( 1, &setscriptablepartstate, #"usable", #"enabled" );
        self.hidden = 0;
        self.jar_data = level.power_quest.var_52cf00fe62f2a886[ 0 ];
        
        if ( self.jar_data.is_required && zm_quest::function_b0a5181ebe7bb905() && utility::flag( "mq_rm_core" ) && utility::flag( "mq_rp_step_01_b" ) )
        {
            machine setscriptablepartstate( #"objective", #"none" );
            jars = zm_sat_locust_util::get_quest_reference( #"hash_58290f97ca66b849" );
            
            foreach ( jar in jars )
            {
                if ( jar getscriptablepartstate( #"sat_zm_prop_kenneth" ) != "disabled" )
                {
                    jar setscriptablepartstate( #"objective", #"enabled" );
                }
            }
        }
        
        level.power_quest.var_52cf00fe62f2a886 = arrayremove( level.power_quest.var_52cf00fe62f2a886, level.power_quest.var_52cf00fe62f2a886[ 0 ] );
        return;
    }
    
    if ( level.power_quest.var_52cf00fe62f2a886.size == 1 )
    {
        return;
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() && utility::flag( "mq_rm_core" ) && utility::flag( "mq_rp_step_01_b" ) )
    {
        machine setscriptablepartstate( #"objective", #"enabled" );
        jars = zm_sat_locust_util::get_quest_reference( #"hash_58290f97ca66b849" );
        
        foreach ( jar in jars )
        {
            jar setscriptablepartstate( #"objective", #"none" );
        }
    }
    
    if ( level.power_quest.var_52cf00fe62f2a886.size == 0 && !level.power_quest.var_197e94c7b715f219 )
    {
        level.power_quest.var_197e94c7b715f219 = 1;
        level thread battlechatter_mp::trysaylocalsound( player, #"hash_5212ed7ec42f115a" );
    }
    
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    self setscriptablepartstate( #"sat_zm_prop_kenneth", #"disabled" );
    self setscriptablepartstate( #"fx", #"picked_up" );
    self setscriptablepartstate( #"usable", #"disabled" );
    utility::delaycall( 1, &setscriptablepartstate, #"usable", #"enabled" );
    self.hidden = 1;
    
    if ( self.clue )
    {
        self.clue delete();
    }
    
    if ( !isdefined( level.power_quest.var_52cf00fe62f2a886 ) )
    {
        level.power_quest.var_52cf00fe62f2a886 = [];
    }
    
    level.power_quest.var_52cf00fe62f2a886[ level.power_quest.var_52cf00fe62f2a886.size ] = self.jar_data;
    
    /#
        self notify( #"picked_up" );
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x9754004, Offset: 0x734a
// Size: 0x36
function private function_917294790d0cc0c5( interact, player )
{
    return { #string:&"", #type:"HINT_NOICON" };
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x457cbeab, Offset: 0x7389
// Size: 0x270
function private function_5d102b0de182e79a( player )
{
    if ( !level.power_quest.var_afad28a32492da42 )
    {
        return;
    }
    
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    self setscriptablepartstate( #"fx", hashcat( #"splash_0", level.power_quest.var_3ff4b2737e042ae + 1 ) );
    
    if ( !level.power_quest.var_1ed4540bb3e16a0d )
    {
        machine = zm_sat_locust_util::get_quest_reference( #"hash_f48d6a93accac874" );
        machine utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_kenton", #"usable" );
        utility::delaycall( 1, &setscriptablepartstate, #"fx", #"off" );
        var_bd69b7ed499b81e4 = zm_sat_locust_util::get_quest_reference( #"hash_2d3e8588dd9589cf" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"sat_zm_prop_kenneth_02", #"empty" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"fx", #"placed" );
        level.power_quest.var_afad28a32492da42 = 0;
        
        if ( !level.power_quest.failed_dialogue )
        {
            var_ec428ca55ae51c0e = [ "dx_zm_lomn_25lu_lvtw_ml2bwrmxa1ln1", "dx_zm_lomn_25lu_detw_ml2bwrmxa1ln2" ];
            var_ec428ba55ae519db = [ "dx_zm_lomn_25lu_detw_ml2bwrmxa2ln1", "dx_zm_lomn_25lu_lvtw_ml2bwrmxa2ln2" ];
            level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 1 );
            level.power_quest.failed_dialogue = 1;
        }
        
        return;
    }
    
    if ( !level.power_quest.valid_dialogue )
    {
        var_ec428ca55ae51c0e = [ "dx_zm_lomn_25lu_lvtw_ml2brtmxa1ln1", "dx_zm_lomn_25lu_detw_ml2brtmxa1ln2" ];
        var_ec428ba55ae519db = [ "dx_zm_lomn_25lu_detw_ml2brtmxa2ln1", "dx_zm_lomn_25lu_lvtw_ml2brtmxa2ln2" ];
        level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 1 );
        level.power_quest.valid_dialogue = 1;
    }
    
    function_99eeed03928060ea();
    self setscriptablepartstate( #"usable", #"off" );
    utility::delaycall( 1, &setscriptablepartstate, #"fx", #"acid_on" );
    arm = zm_sat_locust_util::get_quest_reference( #"hash_30fcdc017552a849" );
    wait 3;
    arm thread function_7aebff98d12c0982();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x82779073, Offset: 0x7601
// Size: 0xf3
function private function_99eeed03928060ea()
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_2ae4cc0540a8e80b" ) )
    {
        var_87692895afac9198 = zm_sat_locust_util::get_quest_reference( #"hash_2ae4cc0540a8e80b" );
        
        foreach ( jar in var_87692895afac9198 )
        {
            jar setscriptablepartstate( #"usable", #"disabled" );
        }
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_f48d6a93accac874" ) )
    {
        machine = zm_sat_locust_util::get_quest_reference( #"hash_f48d6a93accac874" );
        machine setscriptablepartstate( #"sat_zm_prop_kenton", #"unusable" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x7c9d69c3, Offset: 0x76fc
// Size: 0x11b
function private function_7a5de9ec5f89aa17( params )
{
    if ( params.bundle.scriptable == %"zmloot_sat_locust_quest_ziggy" )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( params.player );
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"crab_lockpick", 1 );
        zm_quest::show_splash_item_picked_up( #"hash_570d84750250b155", #"crab_lockpick", 1, params.player );
        level.power_quest.lockpick_held = 1;
        level thread battlechatter_mp::trysaylocalsound( params.player, #"hash_5212ed7ec42f115a" );
        lockpick_interact = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" );
        lockpick_interact setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"usable_no_hint" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_f86abdd0731a5adb" );
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x31559d0d, Offset: 0x781f
// Size: 0x36
function private function_bb9ef181d76ded1a( interact, player )
{
    return { #string:&"", #type:"HINT_NOICON" };
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x563ec581, Offset: 0x785e
// Size: 0x16b
function private function_834fa1658fb3085a( params )
{
    is_bullet_damage = utility::isbulletdamage( params.meansofdeath );
    is_melee_damage = class::ismeleeweapon( params.objweapon ) && utility::ismeleedamage( params.meansofdeath );
    
    if ( is_bullet_damage || is_melee_damage )
    {
        if ( params.attacker ammo_mod::function_ba9b2ecd18bdbdd8( params.objweapon, "deadwire" ) )
        {
            return self.health;
        }
    }
    else if ( params.meansofdeath == "MOD_IMPACT" && issubstr( params.inflictor.equipmentref, "shockstick" ) )
    {
        params.inflictor utility::delaycall( level.framedurationseconds, &setscriptablepartstate, #"electric", #"active", 0 );
        params.inflictor utility::delaycall( level.framedurationseconds, &setscriptablepartstate, #"detonate", #"detonate", 0 );
        params.inflictor thread shock_stick::function_1d426c8b1b9484bb();
        return self.health;
    }
    else if ( params.meansofdeath == "MOD_ELEMENTAL_ELEC" )
    {
        return self.health;
    }
    
    return 0;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x970dc94, Offset: 0x79d2
// Size: 0x13e
function private function_7aebff98d12c0982( params )
{
    utility::delaycall( 0.5, &setscriptablepartstate, #"fx", #"explode" );
    wait 0.5 + level.framedurationseconds;
    self delete();
    lockpick_spawn = zm_sat_locust_util::get_quest_reference( #"hash_ec5ede4c7c6a23f9" );
    params = { #spawntype:#"spawn_to_pos_from_pos", #toangles:lockpick_spawn.drop_loc.angles, #fromorigin:lockpick_spawn.origin, #toorigin:lockpick_spawn.drop_loc.origin, #asset:%"zmloot_sat_locust_quest_ziggy" };
    item = zm_sat_locust_util::spawn_quest_item( params );
    zm_sat_locust_util::function_295a36ef38f5acae( #"lab_lockpick", item );
    level callback::add( "quest_item_used", &function_7a5de9ec5f89aa17 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86abcd0731a5928" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xe9f73d7e, Offset: 0x7b18
// Size: 0x100, Type: bool
function private function_5d18a34399228d78( player )
{
    if ( !level.power_quest.lockpick_held )
    {
        return false;
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"lab_uranium_cell_door" ) )
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_f461616130a30415", player );
        player lockpick::lockpick_open( 3, 2, 1, self, &function_4cff45cfd956ece6, &function_84a3622867cb39b );
        player lockpick::lockpick_set_param( "Locust" );
        
        if ( !level callback::exists( #"player_death", &function_c3ebe56f91ed886 ) )
        {
            level callback::add( #"player_death", &function_c3ebe56f91ed886 );
            level callback::add( #"player_disconnect", &function_c3ebe56f91ed886 );
        }
    }
    else
    {
        quest_step = zm_quest::get_quest_step( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581" );
        zm_quest::complete_step( quest_step );
    }
    
    self setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"unusable" );
    return true;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xcf808b75, Offset: 0x7c21
// Size: 0x58
function private function_c3ebe56f91ed886( params )
{
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_f461616130a30415" ) )
    {
        return;
    }
    
    if ( self == zm_sat_locust_util::get_quest_reference( #"hash_f461616130a30415" ) )
    {
        lockpick_interact = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" );
        function_84a3622867cb39b( lockpick_interact );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xc0836a05, Offset: 0x7c81
// Size: 0x33
function private function_84a3622867cb39b( lock = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" ) )
{
    lock zm_sat_locust_util::limited_interact_exited( self );
    lockpick::lockpick_close();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xa7df3032, Offset: 0x7cbc
// Size: 0x55
function private function_4422cf229e1d5434( player )
{
    zm_sat_locust_util::function_7bf944a5a2b76f39( #"hash_f461616130a30415" );
    
    if ( !self.completed && !self.var_d46b85cfdf61574e )
    {
        utility::delaycall( 1, &setscriptablepartstate, #"misc_puzzles_lockpick_interact", #"usable_no_hint" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x970b61fd, Offset: 0x7d19
// Size: 0x3f
function private function_76d0da4f099e41c0()
{
    lockpick_interact = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" );
    lockpick_interact zm_sat_locust_util::function_1a3e351820ab994c();
    lockpick_interact setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"usable_no_hint" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x9d24ee9, Offset: 0x7d60
// Size: 0x12c
function private function_4cff45cfd956ece6( lockpick, skipped = 0 )
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"lab_uranium_cell_door" ) )
    {
        cell_door = zm_sat_locust_util::get_quest_reference( #"lab_uranium_cell_door" );
        
        if ( cell_door.clip )
        {
            cell_door.clip connectpaths();
        }
        
        cell_door connectpaths();
        playfx( utility::getfx( "lab_cell_open" ), cell_door.origin );
        cell_door playsound( "evt_mq_lab_lockpick_door_open" );
        cell_door rotateby( ( 0, 90, 0 ), 2 );
        
        if ( !isdefined( lockpick ) )
        {
            lockpick = zm_sat_locust_util::get_quest_reference( #"hash_6c7f753a7756664" );
        }
        
        lockpick setscriptablepartstate( #"misc_puzzles_lockpick_interact", #"unusable" );
        lockpick.completed = 1;
    }
    
    if ( !skipped )
    {
        lockpick zm_sat_locust_util::limited_interact_exited( self );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86dbad0731c8b99" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x265de897, Offset: 0x7e94
// Size: 0x294
function private function_ace89b93a2d40a3c( activate_machine = 0 )
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_2ae4cc0540a8e80b" ) )
    {
        var_87692895afac9198 = zm_sat_locust_util::get_quest_reference( #"hash_2ae4cc0540a8e80b" );
        
        foreach ( jar in var_87692895afac9198 )
        {
            if ( jar.jar_data.is_required )
            {
                jar setscriptablepartstate( #"sat_zm_prop_kenneth", #"disabled" );
                
                if ( jar.clue )
                {
                    jar.clue delete();
                }
                
                level.power_quest.var_52cf00fe62f2a886[ level.power_quest.var_52cf00fe62f2a886.size ] = jar.jar_data;
                
                /#
                    jar notify( #"picked_up" );
                #/
            }
        }
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_cf19467c1279d6df" ) )
    {
        machine = zm_sat_locust_util::get_quest_reference( #"hash_f48d6a93accac874" );
        var_755c586c3e207bf6 = zm_sat_locust_util::get_quest_reference( #"hash_cf19467c1279d6df" );
        
        for ( i = 0; i < var_755c586c3e207bf6.size ; i++ )
        {
            jar = var_755c586c3e207bf6[ i ];
            
            if ( jar.placed )
            {
                continue;
            }
            
            jar.placed = 1;
            jar setscriptablepartstate( #"sat_zm_prop_kenneth", hashcat( #"hash_cb1ce1d343afe605", level.power_quest.var_52cf00fe62f2a886[ 0 ].jar_type ) );
            jar.jar_data = level.power_quest.var_52cf00fe62f2a886[ 0 ];
            
            if ( jar.jar_data.is_required )
            {
                level.power_quest.var_3ff4b2737e042ae++;
            }
            
            level.power_quest.var_52cf00fe62f2a886 = arrayremove( level.power_quest.var_52cf00fe62f2a886, level.power_quest.var_52cf00fe62f2a886[ 0 ] );
        }
        
        if ( activate_machine )
        {
            machine thread function_1ac7bfe22cdffedd();
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x606935e4, Offset: 0x8130
// Size: 0xc0
function private function_f269ac36dab433cd()
{
    rc_triggers = getnoentvolumearray( "rc_dm_tr", #targetname );
    rc_triggers = utility::array_sort_by_script_index( rc_triggers );
    
    foreach ( trigger in rc_triggers )
    {
        trigger.icon_struct = utility::getstruct( trigger.target );
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_a38fa644fafd9a0", rc_triggers );
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x9d9dd1db, Offset: 0x81f8
// Size: 0xa2
function function_cf98a4a07345ec2e()
{
    utility::flag_set( #"hash_5a0401a77099d2c9" );
    rc_triggers = zm_sat_locust_util::get_quest_reference( #"hash_a38fa644fafd9a0" );
    
    foreach ( trigger in rc_triggers )
    {
        trigger::makeenterexittrigger( trigger, &function_de84e645a84d5565 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2
// Checksum 0x744c323c, Offset: 0x82a2
// Size: 0x110
function function_de84e645a84d5565( ent, trigger )
{
    if ( ent.rcxdtype )
    {
        zm_quest::function_b5d75b34f712db9a();
        next_icon = trigger.icon_struct;
        var_73fb6215ee18ec22 = spawnstruct();
        var_73fb6215ee18ec22.index = level.directed_mode.var_f1879f50f4eeaca3.size;
        var_73fb6215ee18ec22.origin = isvector( next_icon ) ? next_icon : next_icon.origin;
        level.directed_mode.var_f1879f50f4eeaca3[ level.directed_mode.var_f1879f50f4eeaca3.size ] = var_73fb6215ee18ec22;
        var_73fb6215ee18ec22.objindex = zm_quest::function_b98d4144845ffc13( string( var_73fb6215ee18ec22.index ), 0, "ui_icon_zm_objective", undefined, "current", var_73fb6215ee18ec22.origin, var_73fb6215ee18ec22.offset, undefined, undefined, 1, 0 );
        trigger::cleanup_enter_exit_trigger( trigger );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x6f887b62, Offset: 0x83ba
// Size: 0x35
function private function_7d6d5e3ab952b9d8( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        level function_34e8fcd960613443();
        return;
    }
    
    utility::flag_wait( "mq_rp_step_02" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x94e51a7e, Offset: 0x83f7
// Size: 0x122
function private function_60062248e78b76a3( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"workshop_debris" ) )
        {
            debris = zm_sat_locust_util::get_quest_reference( #"workshop_debris" );
            function_8183f0813f98518();
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"workshop_door" ) )
        {
            door = zm_sat_locust_util::get_quest_reference( #"workshop_door" );
            door thread workshop_door_move( 1, 0 );
        }
        
        zm_sat_locust_util::function_a70056d3a99eace5( #"workshop_door_trigger" );
        zone_manager::set_zone_enabled( "zone_shipyard_warehouse_tunnel", 1 );
        utility::flag_set( "zone_shipyard_warehouse_tunnel_opened" );
        
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_craft_interact" ) )
        {
            claw_machine_activate();
        }
        
        utility::flag_set( "mq_rp_step_02" );
    }
    
    level.fishing_struct.force_wb = 0;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        level thread zm_quest::update_round_cap( 13, 1, 0 );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0xf85095d0, Offset: 0x8521
// Size: 0x430
function private function_34e8fcd960613443()
{
    self notify( #"hash_bff94a7c584ef0a3" );
    self endon( #"hash_bff94a7c584ef0a3" );
    
    if ( utility::flag( "workshop_setup" ) )
    {
        return;
    }
    
    level.workshop = {};
    
    if ( zm_save::function_1dda3554974a999e() )
    {
        utility::flag_wait( "zm_save_level_restore_keys_complete" );
        workshop_open = zm_quest::function_73720cdf21c3cfd7( #"hash_7b26a8bb39d7312", #"workshop_open" );
    }
    
    if ( !isdefined( workshop_open ) )
    {
        workshop_open = 0;
    }
    
    zm_quest::function_4eefe6de31f5ddab( #"hash_7b26a8bb39d7312", #"workshop_open", workshop_open );
    debris = getent( "workshop_staircase_blocker_model", #targetname );
    debris_clip = getent( "workshop_staircase_blocker", #targetname );
    
    if ( debris )
    {
        debris.clip = debris_clip;
        level.workshop.debris_clip = debris_clip;
    }
    else
    {
        debris = debris_clip;
    }
    
    level.workshop.debris = debris;
    function_8988a032e94395d4();
    door = getent( "workshop_door_model", #targetname );
    door_clip = getent( "workshop_door", #targetname );
    
    if ( door )
    {
        door.clip = door_clip;
        level.workshop.door_clip = door_clip;
    }
    else if ( door_clip )
    {
        door = door_clip;
    }
    
    level.workshop.door = door;
    level.workshop.door_is_open = 0;
    zm_sat_locust_util::function_295a36ef38f5acae( #"workshop_door", door );
    
    if ( !workshop_open )
    {
        debris setcandamage( 1 );
        debris.health = 9999;
        debris thread function_20704472f2fc33df();
        debris.fx = spawnscriptable( %"sat_zm_warehouse_debris", debris.origin, debris.angles );
        level.workshop.debris_fx = debris.fx;
        zm_sat_locust_util::function_295a36ef38f5acae( #"workshop_debris", debris );
        door.fx = spawnscriptable( %"sat_zm_warehouse_door", door.origin, door.angles );
        level.workshop.door_fx = door.fx;
        trigger = getnoentvolumearray( "workshop_door_trigger", #targetname )[ 0 ];
        zm_sat_locust_util::function_295a36ef38f5acae( #"workshop_door_trigger", trigger );
        all_nodes = [];
        var_6bd0ba8f29a84b5a = utility::getstructarray( "mqpo_wo_no" );
        
        foreach ( removal in var_6bd0ba8f29a84b5a )
        {
            nodes = getnodesinradius( removal.origin, 72, 0 );
            all_nodes = arraycombineunique( nodes, all_nodes );
        }
        
        foreach ( node in all_nodes )
        {
            enablenavlink( node, 0 );
        }
        
        debris.nodes = all_nodes;
    }
    else
    {
        function_8183f0813f98518();
        zone_manager::set_zone_enabled( "zone_shipyard_warehouse_tunnel", 1 );
        door thread workshop_door_move( 1, 0 );
        level thread claw_machine_activate();
        utility::flag_set( "mq_rp_step_02" );
    }
    
    utility::flag_set( "workshop_setup" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xc488a250, Offset: 0x8959
// Size: 0x17f
function private function_20704472f2fc33df()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon, origin, angles, normal, inflictor );
        self.health = 9999;
        
        if ( weapon.basename == "sat_zm_wunderbarrage_missile_proj" )
        {
            break;
        }
    }
    
    zm_quest::function_4eefe6de31f5ddab( #"hash_7b26a8bb39d7312", #"workshop_open", 1 );
    zone_manager::set_zone_enabled( "zone_shipyard_warehouse_tunnel", 1 );
    door = zm_sat_locust_util::get_quest_reference( #"workshop_door" );
    door thread function_e6e4c1788cef4cfb();
    claw_machine_activate();
    level.fishing_struct.force_wb = 0;
    utility::flag_set( "mq_rp_step_02" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    function_8183f0813f98518( 1 );
}

// Namespace namespace_7acb35c452673b3
// Params 1
// Checksum 0xef5363ef, Offset: 0x8ae0
// Size: 0x215
function function_8183f0813f98518( var_e8235b2f5f33405a = 0 )
{
    if ( var_e8235b2f5f33405a && level.workshop.debris_fx )
    {
        level.workshop.debris_fx setscriptablepartstate( #"sat_zm_warehouse_debris", #"explode" );
        level.workshop.debris_fx utility::delaycall( 5, &setscriptablepartstate, #"sat_zm_warehouse_debris", #"idle" );
    }
    
    if ( level.workshop.debris_clip )
    {
        level.workshop.debris_clip hide();
        level.workshop.debris_clip notsolid();
        level.workshop.debris_clip connectpaths();
    }
    
    if ( level.workshop.debris )
    {
        level.workshop.debris hide();
        level.workshop.debris notsolid();
        level.workshop.debris connectpaths();
        
        if ( level.workshop.debris.nodes )
        {
            foreach ( node in level.workshop.debris.nodes )
            {
                enablenavlink( node, 1 );
            }
        }
    }
    
    level.workshop.var_dc0780f0afb99f02 = 0;
    utility::flag_set( "zone_shipyard_warehouse_tunnel_opened" );
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0xc503d977, Offset: 0x8cfd
// Size: 0xe0
function function_8988a032e94395d4()
{
    if ( level.workshop.debris_clip )
    {
        level.workshop.debris_clip show();
        level.workshop.debris_clip solid();
        level.workshop.debris_clip disconnectpaths();
    }
    
    if ( level.workshop.debris )
    {
        level.workshop.debris show();
        level.workshop.debris solid();
        level.workshop.debris disconnectpaths();
    }
    
    level.workshop.var_dc0780f0afb99f02 = 1;
    utility::flag_clear( "zone_shipyard_warehouse_tunnel_opened" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x60f218f5, Offset: 0x8de5
// Size: 0x61
function private function_e6e4c1788cef4cfb()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    trigger = zm_sat_locust_util::get_quest_reference( #"workshop_door_trigger" );
    trigger endon( #"death" );
    trigger::makeenterexittrigger( trigger, &function_1923224aa418c8a0 );
    wait 30;
    thread workshop_door_move();
    trigger delete();
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x174bef55, Offset: 0x8e4e
// Size: 0x3b
function private function_1923224aa418c8a0( ent, trigger )
{
    if ( isplayer( ent ) )
    {
        zm_sat_locust_util::get_quest_reference( #"workshop_door" ) thread workshop_door_move();
        trigger delete();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2
// Checksum 0xe2e5ba67, Offset: 0x8e91
// Size: 0x1f1
function workshop_door_move( move_to_right = 1, time_to_move = 3 )
{
    level endon( #"game_ended" );
    var_c9d17de057343795 = vectornormalize( move_to_right ? anglestoright( self.angles ) : anglestoleft( self.angles ) );
    
    if ( self.fx )
    {
        self.fx setscriptablepartstate( #"sat_zm_warehouse_door", #"moving" );
        self.fx utility::delaycall( time_to_move + 1, &setscriptablepartstate, #"sat_zm_warehouse_door", #"idle" );
    }
    
    door_move_to_pos = self.origin + var_c9d17de057343795 * 90;
    
    if ( self.clip )
    {
        clip_move_to_pos = self.clip.origin + var_c9d17de057343795 * 90;
    }
    
    if ( time_to_move > 0 )
    {
        self moveto( door_move_to_pos, time_to_move, 0, 1 );
        earthquake( 0.2, 0.5, self.origin, 200 );
        
        if ( self.clip )
        {
            self.clip moveto( clip_move_to_pos, time_to_move, 0, 1 );
        }
        
        self waittill( #"movedone" );
    }
    else
    {
        self.origin = door_move_to_pos;
        
        if ( self.clip )
        {
            self.clip.origin = clip_move_to_pos;
        }
    }
    
    earthquake( 0.2, 0.5, self.origin, 200 );
    self connectpaths();
    self disconnectpaths();
    
    if ( self.clip )
    {
        self.clip connectpaths();
        self.clip disconnectpaths();
    }
    
    level.workshop.door_is_open = move_to_right;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xc98476e9, Offset: 0x908a
// Size: 0x21
function private function_7d6d5f3ab952bc0b( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa63cd5a3, Offset: 0x90b3
// Size: 0x2e
function private function_60062148e78b7470( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        utility::flag_set( "mq_rp_step_03" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x6860d20f, Offset: 0x90e9
// Size: 0x530
function private function_9e2e68fbafa18958()
{
    level.power_quest.claw_machine = { #rod_groups:[], #var_c680c886cc22b5c2:0 };
    level.power_quest.claw_machine.var_29ccccb8fb3e87ae = [ 9:100, 8:80, 7:63, 6:48, 5:35, 4:24, 3:15, 2:8, 1:3 ];
    table_base = getent( "leroy_table", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_craft", table_base );
    table_top = getent( "leroy_table_top", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_table_top", table_top );
    claw = getent( "xavier_main", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_claw", claw );
    claw_top = getent( "xavier_top", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_claw_top", claw_top );
    rail = getent( "leroy_rail", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_rails", rail );
    glass = getent( "leroy_glass", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_glass", glass );
    needle = getent( "leroy_needle", #targetname );
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_needle", needle );
    var_56958d018a326ec4 = getentitylessscriptablearray( %"sat_zm_prop_jasper_plug" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_7359ee4a987ef01b", var_56958d018a326ec4 );
    trackers = utility::getstructarray( "mqpo_ja_tr" );
    trackers = utility::array_sort_by_script_index( trackers );
    
    foreach ( tracker in trackers )
    {
        tracker.scriptable = utility::spawn_model( %"sat_zm_prop_jasper_tracker", tracker.origin, tracker.angles, undefined, 0.5 );
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_c503768fae0a13d4", trackers );
    needle_locs = [];
    needle_start_loc = utility::getstruct( "mqpo_le_ne_st" );
    needle.origin = needle_start_loc.origin;
    var_f6d54ccc08d76ad = utility::getstruct( needle_start_loc.target );
    needle_locs[ needle_locs.size ] = needle_start_loc;
    needle_locs[ needle_locs.size ] = var_f6d54ccc08d76ad;
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_9c0c22d41cd18ae2", needle_locs );
    level.power_quest.var_4b8b3a293ef5b69c = distance2d( needle_start_loc.origin, var_f6d54ccc08d76ad.origin );
    level.power_quest.var_c41c5999c56dbffa = 21.1;
    var_c890d8e948a38b04 = utility::getstruct( "mqpo_po_so_gr" );
    grid = function_ab800c13cd7d90b3( var_c890d8e948a38b04 );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_grid", grid );
    extra_grid = function_cbbc988d5bad0f34( var_c890d8e948a38b04 );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_7ecfedc2a3d24b60", extra_grid );
    
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_pickup" ) )
    {
        item_spawn = utility::getstruct( "mqpo_po_so_it" );
        item = utility::spawn_model( %"sat_locust_zm_jerry_animated", item_spawn.origin, item_spawn.angles );
        zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_pickup", item );
    }
    
    utility::add_fx( "claw_machine_charge_connect", "vfx_sat_levels_zm_locust_mq_power_charge_group_elec_beam" );
    utility::flag_wait( "scriptables_ready" );
    
    foreach ( var_62d18e0a7603ba5f in var_56958d018a326ec4 )
    {
        var_62d18e0a7603ba5f setscriptablepartstate( #"sat_zm_prop_jasper_plug", #"disabled" );
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_pickup" ) )
    {
        item = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
        item setscriptablepartstate( #"sat_locust_zm_jerry_animated", #"hash_cbc3080af5749a0" );
        item setscriptablepartstate( #"canisters", #"all_hidden" );
    }
    
    utility::flag_set( "claw_machine_ready" );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x1fe16fae, Offset: 0x9621
// Size: 0x49f
function private function_ab800c13cd7d90b3( ref_struct )
{
    table = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    temp_model = utility::spawn_model( %"sat_zm_radionuclonic_claw_table_01", table.origin, table.angles );
    grid = { #all_slots:[], #columns:[ 3:[], 2:[], 1:[], 0:[] ], #rows:[ 3:[], 2:[], 1:[], 0:[] ] };
    grid_pos = 1;
    var_56958d018a326ec4 = zm_sat_locust_util::get_quest_reference( #"hash_7359ee4a987ef01b" );
    
    for ( r = 0; r < grid.rows.size ; r++ )
    {
        for ( c = 0; c < grid.columns.size ; c++ )
        {
            foreach ( var_62d18e0a7603ba5f in var_56958d018a326ec4 )
            {
                if ( int( var_62d18e0a7603ba5f.script_noteworthy ) == grid_pos )
                {
                    var_61d8a47043c4a79f = var_62d18e0a7603ba5f;
                }
            }
            
            slot_num = grid_pos < 10 ? "0" + grid_pos : grid_pos;
            tag = "tag_slot_" + slot_num;
            origin = temp_model gettagorigin( tag ) + ( 0, 0, 1.2 );
            angles = temp_model gettagangles( tag ) + ( 90, 0, 0 );
            grid_slot = { #var_61d8a47043c4a79f:var_61d8a47043c4a79f, #grid_pos:grid_pos, #column:c, #row:r, #angles:angles, #origin:origin };
            grid.rows[ r ][ c ] = grid_slot;
            grid.columns[ c ][ r ] = grid_slot;
            grid.all_slots[ grid.all_slots.size ] = grid_slot;
            grid_pos++;
        }
    }
    
    level.power_quest.var_85a9323c7da1297a = distance2d( grid.rows[ 0 ][ 0 ].var_61d8a47043c4a79f.origin, grid.rows[ 1 ][ 0 ].var_61d8a47043c4a79f.origin );
    
    foreach ( slot in grid.all_slots )
    {
        slot.adjacent_slots = [];
        right = grid.rows[ slot.row ][ slot.column + 1 ];
        left = grid.rows[ slot.row ][ slot.column - 1 ];
        BELOW = grid.rows[ slot.row + 1 ][ slot.column ];
        above = grid.rows[ slot.row - 1 ][ slot.column ];
        slot.adjacent_slots[ slot.adjacent_slots.size ] = right;
        slot.adjacent_slots[ slot.adjacent_slots.size ] = left;
        slot.adjacent_slots[ slot.adjacent_slots.size ] = BELOW;
        slot.adjacent_slots[ slot.adjacent_slots.size ] = above;
    }
    
    temp_model delete();
    return grid;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xc1703041, Offset: 0x9ac9
// Size: 0x21f
function private function_cbbc988d5bad0f34( ref_struct )
{
    extra_grid = { #all_slots:[], #columns:[ "-2":[], "-1":[] ], #rows:[ "-2":[], "-1":[] ] };
    structs = utility::getstructarray( "mqpo_le_ex_gr" );
    grid_pos = 1;
    
    for ( r = 1; r < extra_grid.rows.size + 1 ; r++ )
    {
        string_r = string( r * -1 );
        
        for ( c = 1; c < extra_grid.columns.size + 1 ; c++ )
        {
            if ( r == 2 && c == 2 )
            {
                break;
            }
            
            string_c = string( c * -1 );
            
            foreach ( loc in structs )
            {
                if ( loc.script_int == grid_pos )
                {
                    origin = loc.origin;
                    angles = loc.angles;
                }
            }
            
            grid_slot = { #column:c * -1, #row:r * -1, #angles:angles, #origin:origin };
            extra_grid.rows[ string_r ][ string_c ] = grid_slot;
            extra_grid.columns[ string_c ][ string_r ] = grid_slot;
            extra_grid.all_slots[ extra_grid.all_slots.size ] = grid_slot;
            grid_pos++;
        }
    }
    
    return extra_grid;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x9d7e0d56, Offset: 0x9cf1
// Size: 0x23c
function private claw_machine_activate()
{
    utility::flag_wait( "claw_machine_ready" );
    grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"claw_machine_claw" ) )
    {
        claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
        claw.current_row = 0;
        claw.current_column = 0;
        claw.current_slot = grid.rows[ 0 ][ 0 ];
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"claw_machine_rails" ) )
        {
            rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
            rails linkto( claw, "tag_origin" );
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"claw_machine_claw_top" ) )
        {
            claw_top = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw_top" );
            claw_top linkto( claw, "tag_origin" );
            camera_ent = utility::spawn_model( "tag_origin", claw_top.origin + ( 0, 0, 10 ), claw_top.angles + ( 90, 180, 0 ) );
            camera_ent linkto( claw, "tag_origin" );
            zm_sat_locust_util::function_295a36ef38f5acae( #"hash_a28556adf16e377e", camera_ent );
        }
        
        starting_slot = grid.all_slots[ randomint( grid.all_slots.size ) ];
        claw thread function_2bf4cdec83ca42ba( starting_slot );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_f961c7a5172671d9" );
    }
    
    table = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    table setscriptablepartstate( #"usable", #"enabled" );
    interact = zm_sat_locust_util::register_limited_interact( table getlinkedscriptableinstance(), &claw_used, &claw_exited, &function_f656b0237774e507, hint );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_craft_interact", interact );
    function_cec3c39c4a2bcdcc();
    function_cbf00b4902a27c8b();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x60cb9481, Offset: 0x9f35
// Size: 0x14b
function private function_cec3c39c4a2bcdcc()
{
    grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
    var_7bc76cebb73b671b = [];
    grid.all_slots = arrayrandomize( grid.all_slots );
    
    for ( i = 0; i < 6 ; i++ )
    {
        slot = grid.all_slots[ i ];
        
        if ( i == 5 )
        {
            for ( j = i; j < grid.all_slots.size - i ; j++ )
            {
                slot = grid.all_slots[ j ];
                var_74996c88b98926b6 = arraycopy( var_7bc76cebb73b671b );
                spawn_groups = function_b3d42de3ee77969f( slot, var_74996c88b98926b6 );
                
                if ( function_2245bce68e862eab( spawn_groups, grid.all_slots ) )
                {
                    continue;
                }
                
                level.last_slot = slot;
                break;
            }
        }
        
        slot.immovable = 1;
        slot.rod_model = slot.var_61d8a47043c4a79f;
        slot.var_61d8a47043c4a79f setscriptablepartstate( #"sat_zm_prop_jasper_plug", #"inactive" );
        var_7bc76cebb73b671b[ var_7bc76cebb73b671b.size ] = slot;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xcf07c013, Offset: 0xa088
// Size: 0x174, Type: bool
function private function_2245bce68e862eab( spawn_groups, all_slots )
{
    if ( spawn_groups.size == 2 && spawn_groups[ 0 ].group_size == 3 && spawn_groups[ 1 ].group_size == 3 )
    {
        return true;
    }
    else if ( spawn_groups.size == 1 )
    {
        var_1cd40e917a1d97e1 = [];
        
        foreach ( slot in all_slots )
        {
            has_adjacent = 0;
            
            foreach ( adjacent in slot.adjacent_slots )
            {
                if ( adjacent.rod_model )
                {
                    has_adjacent = 1;
                    break;
                }
            }
            
            if ( !has_adjacent )
            {
                var_1cd40e917a1d97e1[ var_1cd40e917a1d97e1.size ] = slot;
            }
        }
        
        if ( var_1cd40e917a1d97e1.size < 2 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xcf50530, Offset: 0xa205
// Size: 0x1ca
function private function_b3d42de3ee77969f( var_b89e4f3d4d210c29, var_74996c88b98926b6 )
{
    foreach ( slot in var_74996c88b98926b6 )
    {
        slot.spawn_group = undefined;
    }
    
    var_b89e4f3d4d210c29.spawn_group = undefined;
    spawn_groups = [];
    
    for ( i = 0; i < var_74996c88b98926b6.size ; i++ )
    {
        slot = var_74996c88b98926b6[ i ];
        
        if ( slot.spawn_group || !slot.rod_model )
        {
            continue;
        }
        
        foreach ( group in spawn_groups )
        {
            if ( arraycontains( group.slots, slot ) )
            {
                slot.spawn_group = group;
                break;
            }
        }
        
        if ( slot.spawn_group )
        {
            continue;
        }
        
        new_group = function_88d0f2550c4be0fb( slot, spawn_groups );
        
        if ( !isdefined( spawn_groups ) )
        {
            spawn_groups = [];
        }
        
        spawn_groups[ spawn_groups.size ] = new_group;
        slot.spawn_group = new_group;
        new_group function_73cc16194ae07cf2( var_b89e4f3d4d210c29 );
        
        if ( new_group.group_size != 3 )
        {
            return;
        }
    }
    
    return spawn_groups;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x54841c29, Offset: 0xa3d8
// Size: 0x66
function private function_88d0f2550c4be0fb( var_a2bb348be724948c, spawn_groups )
{
    group = { #slots:[], #group_size:1, #id_slot:var_a2bb348be724948c, #id:var_a2bb348be724948c.rod_model };
    var_a2bb348be724948c.spawn_group = group;
    return group;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x9a3f4a2, Offset: 0xa447
// Size: 0x43c
function private function_73cc16194ae07cf2( var_b89e4f3d4d210c29 )
{
    primary_slot = self.id_slot;
    var_48ffa8018dd2793c = [];
    var_301806c475005f95 = [];
    var_b3c1e37f697a0d5b = [ primary_slot ];
    
    foreach ( slot in primary_slot.adjacent_slots )
    {
        if ( !slot.rod_model && slot != var_b89e4f3d4d210c29 )
        {
            continue;
        }
        
        var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ slot ] );
        
        if ( slot.spawn_group )
        {
            var_48ffa8018dd2793c = arraycombineunique( var_48ffa8018dd2793c, [ slot ] );
            continue;
        }
        
        var_301806c475005f95 = arraycombineunique( var_301806c475005f95, [ slot ] );
    }
    
    for ( i = 0; i < 5 ; i++ )
    {
        if ( var_48ffa8018dd2793c.size > 0 )
        {
            var_6e744e744a295783 = var_48ffa8018dd2793c;
            var_48ffa8018dd2793c = [];
            
            foreach ( var_e60b6c79a18c2521 in var_6e744e744a295783 )
            {
                foreach ( adj_slot in var_e60b6c79a18c2521.adjacent_slots )
                {
                    if ( !adj_slot.rod_model && adj_slot != var_b89e4f3d4d210c29 )
                    {
                        continue;
                    }
                    
                    var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ adj_slot ] );
                    
                    if ( adj_slot.spawn_group )
                    {
                        var_48ffa8018dd2793c = arraycombineunique( var_48ffa8018dd2793c, [ adj_slot ] );
                        continue;
                    }
                    
                    var_301806c475005f95 = arraycombineunique( var_301806c475005f95, [ adj_slot ] );
                }
            }
        }
        
        if ( var_301806c475005f95.size > 0 )
        {
            var_adaf7aeaa8887f02 = var_301806c475005f95;
            var_301806c475005f95 = [];
            
            foreach ( var_d2671d04f6230966 in var_adaf7aeaa8887f02 )
            {
                foreach ( adj_slot in var_d2671d04f6230966.adjacent_slots )
                {
                    if ( !adj_slot.rod_model && adj_slot != var_b89e4f3d4d210c29 )
                    {
                        continue;
                    }
                    
                    var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ adj_slot ] );
                    
                    if ( adj_slot.spawn_group )
                    {
                        var_48ffa8018dd2793c = arraycombineunique( var_48ffa8018dd2793c, [ adj_slot ] );
                        continue;
                    }
                    
                    var_301806c475005f95 = arraycombineunique( var_301806c475005f95, [ adj_slot ] );
                }
            }
        }
    }
    
    self.slots = var_b3c1e37f697a0d5b;
    self.group_size = self.slots.size;
    
    foreach ( slot in self.slots )
    {
        slot.spawn_group = self;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x5d157665, Offset: 0xa88b
// Size: 0x2d
function private function_e963d59dc8feaa07( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    utility::flag_wait( "mq_rp_step_03_a" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x72c8e85d, Offset: 0xa8c0
// Size: 0x187
function private function_66f87d6979309cf4( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        slots_used = 0;
        
        foreach ( slot in extra_grid.all_slots )
        {
            if ( slot.rod_model )
            {
                slots_used++;
            }
        }
        
        level.power_quest.collected_uranium = 3 - slots_used;
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_pickup" ) )
        {
            function_65c1a456423d0491();
            backpack = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
            backpack setscriptablepartstate( #"sat_locust_zm_jerry_animated", #"hash_793e16548e41c6d7" );
        }
        
        utility::flag_set( "mq_rp_step_03_a" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xcae3358d, Offset: 0xaa4f
// Size: 0x1cb, Type: bool
function private claw_used( player )
{
    self setscriptablepartstate( #"usable", #"disabled" );
    
    if ( !utility::flag( "mq_rp_step_03_a" ) )
    {
        utility::delaycall( 1, &setscriptablepartstate, #"usable", #"enabled" );
        
        if ( level.power_quest.collected_uranium == 0 )
        {
            zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"craft_power_source", "Tried to insert Uranium into backpack, but not holding any" );
            return false;
        }
        
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        
        if ( !isdefined( level.power_quest.var_552b0a0c0c39c206 ) )
        {
            level.power_quest.var_552b0a0c0c39c206 = 0;
        }
        
        zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"craft_power_source", "Attempting to place " + level.power_quest.collected_uranium + " Uranium in backpack - " + level.power_quest.var_552b0a0c0c39c206 + " already inserted" );
        function_65c1a456423d0491();
        
        if ( utility::flag( "mq_rp_step_01_a" ) && utility::flag( "mq_rp_step_01_b" ) && utility::flag( "mq_rp_step_01_c" ) )
        {
            backpack = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
            backpack setscriptablepartstate( #"sat_locust_zm_jerry_animated", #"hash_793e16548e41c6d7" );
            utility::flag_set( "mq_rp_step_03_a" );
            zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"craft_power_source", "All 3 Uranium inserted into backpack, backpack closing" );
        }
    }
    else if ( !self.complete && !self.failed )
    {
        player thread function_8f5a48f6b3ecb5fe();
        return true;
    }
    
    return false;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x7926ac80, Offset: 0xac23
// Size: 0xd2
function private function_65c1a456423d0491()
{
    for ( i = 0; i < level.power_quest.collected_uranium ; i++ )
    {
        level.power_quest.var_552b0a0c0c39c206++;
        zm_sat_locust_util::function_82f9bbbcb47ef102( #"hash_7b26a8bb39d7312", #"craft_power_source", "Uranium inserted - total inserted: " + level.power_quest.var_552b0a0c0c39c206 );
        backpack = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
        backpack setscriptablepartstate( #"canisters", hashcat( #"visible_", level.power_quest.var_552b0a0c0c39c206 ) );
    }
    
    level.power_quest.collected_uranium = 0;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x8ff9ca81, Offset: 0xacfd
// Size: 0x19e
function private function_cbf00b4902a27c8b()
{
    extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
    grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
    canisters = [];
    
    for ( i = 0; i < 3 ; i++ )
    {
        for ( eg = 0; eg < extra_grid.all_slots.size ; eg++ )
        {
            if ( extra_grid.all_slots[ eg ].rod_model )
            {
                continue;
            }
            
            grid_slot = extra_grid.all_slots[ eg ];
            origin = ( grid_slot.origin[ 0 ], grid_slot.origin[ 1 ], grid.all_slots[ 0 ].var_61d8a47043c4a79f.origin[ 2 ] );
            rod_model = utility::spawn_model( %"sat_locust_zm_jasper_01", origin, grid_slot.angles );
            rod_model.uranium = 1;
            grid_slot.rod_model = rod_model;
            rod_model.grid_slot = grid_slot;
            grid_slot.var_61d8a47043c4a79f = { #angles:rod_model.angles, #origin:rod_model.origin };
            canisters[ canisters.size ] = rod_model;
            break;
        }
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"claw_machine_canisters", canisters );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x3c6e254a, Offset: 0xaea3
// Size: 0x9d
function private function_e963d69dc8feac3a( skipped, save_restored )
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"claw_machine_claw" ) && zm_sat_locust_util::function_3112dc4740eb8499( #"hash_7ecfedc2a3d24b60" ) )
    {
        claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
        starting_slot = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" ).all_slots[ 1 ];
        claw thread function_2bf4cdec83ca42ba( starting_slot );
    }
    
    if ( skipped || save_restored )
    {
        return;
    }
    
    utility::flag_wait( "mq_rp_step_03_b" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x9567c821, Offset: 0xaf48
// Size: 0x32d
function private function_8f5a48f6b3ecb5fe()
{
    self endon( #"disconnect" );
    val::set( "claw_machine", "show_hud", 0 );
    val::set( "claw_machine", "freezecontrols", 1 );
    val::set( "claw_machine", "supers", 0 );
    zm_utility::function_d47920bb0d5fa327( "locust_robotpower_clawplayersetcamera" );
    zm_utility::function_92275a9d3969d91d();
    zm_utility::function_814e28ebc00f977d( "claw_machine" );
    camera = zm_sat_locust_util::get_quest_reference( #"hash_a28556adf16e377e" );
    hud_util::fade_out( 0.25, "black" );
    self cameralinkto( camera, "tag_origin", 1, 1 );
    self modifybasefov( 75 );
    self lerpfovscalefactor( 0, 0 );
    self function_f3f05a362d4b7712( 1 );
    claw_top = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw_top" );
    claw_top hidefromplayer( self );
    rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
    rails hidefromplayer( self );
    hud_util::fade_in( 0.25, "black" );
    claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
    
    if ( !claw.rod_model )
    {
        claw setscriptablepartstate( #"hash_24bc16f2bd4f9d51", #"activate" );
    }
    
    position = { #vertical_anchor:1, #horizontal_anchor:1, #top:0, #left:0 };
    widget_struct = { #position:position };
    scripted_widgets::create( "locust_mq_power_claw", "scripted_widget_input_prompts_sat_zm_locust_mq_power", widget_struct );
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"add_array" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"add_array", "locust_mq_power", function_18b5273ec6ae0548() );
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ad506315f4b635f0" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"hash_ad506315f4b635f0", self );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ad506315f4b635f0", self );
    }
    
    if ( !level callback::exists( #"player_death", &claw_player_death_or_disconnect ) )
    {
        level callback::add( #"player_death", &claw_player_death_or_disconnect );
        level callback::add( #"player_disconnect", &claw_player_death_or_disconnect );
    }
    
    thread function_924d566494d40be0();
    canisters = zm_sat_locust_util::get_quest_reference( #"claw_machine_canisters" );
    
    foreach ( canister in canisters )
    {
        if ( canister.grid_slot.row < 0 )
        {
            canister hudoutlineenableforclient( self, "outline_depth_white" );
        }
    }
    
    /#
        level.power_quest.var_a7b2f674cdb85cb1 = 1;
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x28987a97, Offset: 0xb27d
// Size: 0x66
function private function_18b5273ec6ae0548( allow_exit = 1 )
{
    helper_prompts = [];
    helper_prompts[ "prompt_claw_move" ] = [ &"zm_sat_locust/scripted_widget_helper_claw_move_gamepad" ];
    helper_prompts[ "prompt_claw_activate" ] = [ &"zm_sat_locust/scripted_widget_helper_claw_pickup_drop" ];
    
    if ( allow_exit )
    {
        helper_prompts[ "prompt_exit" ] = &"scripted_widget_common/cancel_activate_prompt";
    }
    
    return helper_prompts;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x3c70e4ed, Offset: 0xb2ec
// Size: 0x4b
function private claw_player_death_or_disconnect( params )
{
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ad506315f4b635f0" ) )
    {
        return;
    }
    
    if ( self == zm_sat_locust_util::get_quest_reference( #"hash_ad506315f4b635f0" ) )
    {
        zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" ) zm_sat_locust_util::limited_interact_exited( self );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xcfeeddb4, Offset: 0xb33f
// Size: 0xcb
function private claw_exited( player )
{
    player function_e072dd0451dfe4d1( self.var_d46b85cfdf61574e || self.failed );
    player val::reset_all( "claw_machine" );
    claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
    
    if ( !claw.rod_model )
    {
        claw setscriptablepartstate( #"hash_24bc16f2bd4f9d51", #"deactivate" );
    }
    
    if ( self.var_d46b85cfdf61574e )
    {
        level thread function_819ee9815f3fa614( player );
    }
    
    if ( !self.completed && !self.failed )
    {
        utility::delaycall( 1, &setscriptablepartstate, #"usable", #"enabled" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xa4b8673a, Offset: 0xb412
// Size: 0x1bd
function private function_e072dd0451dfe4d1( claw_reset = 0 )
{
    self endon( #"disconnect" );
    level notify( #"hash_5c7c2e9ff806dc2b" );
    hud_util::fade_out( 0.25, "black" );
    wait 0.5;
    canisters = zm_sat_locust_util::get_quest_reference( #"claw_machine_canisters" );
    
    foreach ( canister in canisters )
    {
        canister hudoutlinedisable();
    }
    
    if ( claw_reset )
    {
        claw_reset_puzzle();
    }
    
    zm_sat_locust_util::function_7bf944a5a2b76f39( #"hash_ad506315f4b635f0" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self cameraunlink();
    self modifybasefov( getdvarfloat( @"cg_targetbasefov", 65 ) );
    self lerpfovscalefactor( 1, 0 );
    self function_f3f05a362d4b7712( 0 );
    claw_top = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw_top" );
    claw_top showtoplayer( self );
    rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
    rails showtoplayer( self );
    utility::callsharedfunc( #"helper_bar_prompts", #"clear" );
    scripted_widgets::destroy( "helper_bar_prompts" );
    scripted_widgets::destroy( "locust_mq_power_claw" );
    zm_utility::function_663d59490abc834f();
    hud_util::fade_in( 0.25, "black" );
    
    /#
        level.power_quest.var_a7b2f674cdb85cb1 = 0;
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0xe48b3bc8, Offset: 0xb5d7
// Size: 0x67
function private function_924d566494d40be0()
{
    self notify( #"hash_4216e1f1a12726e" );
    self endon( #"hash_4216e1f1a12726e" );
    level endon( #"hash_5c7c2e9ff806dc2b" );
    
    while ( true )
    {
        msg = utility::waittill_any_return( "locust_mq_power_claw_pickup_drop", "locust_mq_power_claw_move_right", "locust_mq_power_claw_move_left", "locust_mq_power_claw_move_up", "locust_mq_power_claw_move_down", "locust_mq_power_claw_exit" );
        function_46bc5f651956565b( msg );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xbd85c44, Offset: 0xb646
// Size: 0x88
function private function_46bc5f651956565b( msg )
{
    claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
    
    if ( claw.busy && msg != "locust_mq_power_claw_exit" )
    {
        return;
    }
    
    if ( msg == "locust_mq_power_claw_pickup_drop" )
    {
        claw thread function_bdd18514a0abf73e();
        return;
    }
    
    if ( msg == "locust_mq_power_claw_exit" )
    {
        zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" ) zm_sat_locust_util::limited_interact_exited( self );
        return;
    }
    
    claw thread claw_move( msg );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xed1335aa, Offset: 0xb6d6
// Size: 0x459
function private claw_move( input_msg )
{
    level endon( #"game_ended" );
    row_diff = 0;
    column_diff = 0;
    table_anim = #"idle";
    current_row = self.current_row;
    current_column = self.current_column;
    
    switch ( input_msg )
    {
        case #"hash_d2bafb2e38fd5507":
            column_diff = 1;
            table_anim = #"stick_right";
            break;
        case #"hash_db428d9c9473703a":
            column_diff = -1;
            table_anim = #"stick_left";
            break;
        case #"hash_5be7ab47296e2976":
            row_diff = -1;
            table_anim = #"stick_up";
            break;
        case #"hash_4fa5df6b9a7000df":
            row_diff = 1;
            table_anim = #"stick_down";
            break;
    }
    
    table = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    table setscriptablepartstate( #"animation", table_anim );
    rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
    
    if ( column_diff != 0 )
    {
        rails unlink();
    }
    
    grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
    new_slot = grid.rows[ current_row + row_diff ][ current_column + column_diff ];
    
    if ( !new_slot )
    {
        var_df5baa8ef3a1117 = 0;
        
        if ( current_column > 0 )
        {
            return;
        }
        
        if ( ( current_row == 0 || current_row == 3 ) && row_diff != 0 )
        {
            return;
        }
        
        if ( current_row >= 0 )
        {
            if ( current_row == 0 || current_row == 1 )
            {
                new_row = "-1";
            }
            else
            {
                new_row = "-2";
            }
            
            new_column = "-1";
            var_df5baa8ef3a1117 = 1;
        }
        else
        {
            row_diff *= -1;
            
            if ( current_column == -1 && column_diff == 1 )
            {
                new_row = current_row * -1;
                new_column = 0;
                new_slot = grid.rows[ new_row ][ new_column ];
                var_df5baa8ef3a1117 = 1;
            }
            else
            {
                new_row = string( current_row + row_diff );
                new_column = string( current_column + column_diff );
            }
        }
        
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        
        if ( !isdefined( new_slot ) )
        {
            new_slot = extra_grid.rows[ new_row ][ new_column ];
        }
        
        if ( !new_slot )
        {
            rails linkto( self, "tag_origin" );
            return;
        }
    }
    
    if ( new_slot )
    {
        camera = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
        self.busy = 1;
        
        if ( var_df5baa8ef3a1117 && abs( int( current_row ) ) - abs( int( new_row ) ) != 0 )
        {
            if ( int( new_row ) == -1 )
            {
                dir = anglestoforward( rails.angles );
            }
            else
            {
                dir = anglestoforward( rails.angles ) * -1;
            }
            
            rail_move_origin = rails.origin + dir * level.power_quest.var_85a9323c7da1297a;
            rails moveto( rail_move_origin, 0.5 );
        }
        
        move_to_origin = ( new_slot.origin[ 0 ], new_slot.origin[ 1 ], camera.origin[ 2 ] );
        camera moveto( move_to_origin, 0.5 );
        bench = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
        bench setscriptablepartstate( #"fx", #"claw_move" );
        camera waittill( #"movedone" );
        bench setscriptablepartstate( #"fx", #"claw_move_done" );
        self.current_row = new_row ? int( new_row ) : self.current_row + row_diff;
        self.current_column = new_column ? int( new_column ) : self.current_column + column_diff;
        self.current_slot = new_slot;
        table setscriptablepartstate( #"animation", #"idle" );
        self.busy = 0;
    }
    
    rails linkto( self, "tag_origin" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xb00254bc, Offset: 0xbb37
// Size: 0x492
function private function_2bf4cdec83ca42ba( var_20821908e933cc3b, var_e61334e4a2bfeecd = 0 )
{
    while ( self.busy )
    {
        waitframe();
    }
    
    rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
    table_anim = #"idle";
    row_diff = abs( var_20821908e933cc3b.row ) - abs( self.current_row );
    column_diff = var_20821908e933cc3b.column - self.current_column;
    
    if ( row_diff == 0 && column_diff == 0 )
    {
        return;
    }
    
    move_duration = max( abs( column_diff ) * 0.5, abs( row_diff ) * 0.5 );
    
    if ( column_diff != 0 )
    {
        if ( column_diff > 0 )
        {
            table_anim = #"stick_right";
        }
        else if ( column_diff < 0 )
        {
            table_anim = #"stick_left";
        }
    }
    
    if ( row_diff != 0 )
    {
        if ( row_diff > 0 )
        {
            table_anim = #"stick_down";
            dir = anglestoforward( rails.angles );
        }
        else if ( row_diff < 0 )
        {
            table_anim = #"stick_up";
            dir = anglestoforward( rails.angles ) * -1;
        }
    }
    
    current_row = self.current_row;
    current_column = self.current_column;
    
    if ( var_e61334e4a2bfeecd )
    {
        table = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
        table setscriptablepartstate( #"animation", table_anim );
    }
    
    if ( column_diff != 0 )
    {
        rails unlink();
    }
    
    grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
    new_slot = grid.rows[ current_row + row_diff ][ current_column + column_diff ];
    
    if ( !new_slot )
    {
        var_df5baa8ef3a1117 = 0;
        
        if ( current_column > 0 && abs( column_diff ) < current_column )
        {
            return;
        }
        
        if ( ( current_row == 0 || current_row == 3 ) && row_diff != 0 && column_diff == 0 )
        {
            return;
        }
        
        new_row = string( var_20821908e933cc3b.row );
        new_column = string( var_20821908e933cc3b.column );
        
        if ( current_row >= 0 )
        {
            var_df5baa8ef3a1117 = 1;
        }
        else
        {
            row_diff *= -1;
            
            if ( current_column == -1 && column_diff == 1 )
            {
                new_slot = grid.rows[ new_row ][ new_column ];
                var_df5baa8ef3a1117 = 1;
            }
        }
        
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        
        if ( !isdefined( new_slot ) )
        {
            new_slot = extra_grid.rows[ new_row ][ new_column ];
        }
        
        if ( !new_slot )
        {
            rails linkto( self, "tag_origin" );
            return;
        }
    }
    
    if ( new_slot )
    {
        camera = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
        self.busy = 1;
        
        if ( abs( int( current_row ) ) - abs( int( var_20821908e933cc3b.row ) ) != 0 )
        {
            rail_move_origin = rails.origin + dir * level.power_quest.var_85a9323c7da1297a;
            rails moveto( rail_move_origin, move_duration );
        }
        
        move_to_origin = ( new_slot.origin[ 0 ], new_slot.origin[ 1 ], camera.origin[ 2 ] );
        camera moveto( move_to_origin, move_duration );
        bench = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
        bench setscriptablepartstate( #"fx", #"claw_move" );
        camera waittill( #"movedone" );
        bench setscriptablepartstate( #"fx", #"claw_move_done" );
        self.current_row = new_row ? int( new_row ) : self.current_row + row_diff;
        self.current_column = new_column ? int( new_column ) : self.current_column + column_diff;
        self.current_slot = new_slot;
        
        if ( var_e61334e4a2bfeecd )
        {
            table setscriptablepartstate( #"animation", #"idle" );
        }
        
        self.busy = 0;
    }
    
    rails linkto( self, "tag_origin" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xfee1e02d, Offset: 0xbfd1
// Size: 0x50f
function private function_bdd18514a0abf73e()
{
    level endon( #"game_ended" );
    current_slot = self.current_slot;
    power_source_craft = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    
    if ( self.rod_model && current_slot.rod_model )
    {
        return;
    }
    
    claw_top = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw_top" );
    
    if ( claw_top islinked() )
    {
        claw_top unlink();
    }
    
    rails = zm_sat_locust_util::get_quest_reference( #"claw_machine_rails" );
    
    if ( rails islinked() )
    {
        rails unlink();
    }
    
    table = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    table setscriptablepartstate( #"animation", #"button_down" );
    camera_ent = zm_sat_locust_util::get_quest_reference( #"hash_a28556adf16e377e" );
    camera_ent unlink();
    self.busy = 1;
    starting_origin = self.origin;
    move_to_origin = ( current_slot.rod_model ? current_slot.rod_model.origin : current_slot.var_61d8a47043c4a79f.origin ) + ( 0, 0, 8.25 );
    self moveto( move_to_origin, 1 );
    power_source_craft setscriptablepartstate( #"fx", #"claw_down" );
    self waittill( #"movedone" );
    power_source_craft setscriptablepartstate( #"fx", #"hash_eeafe60af67e8a64" );
    
    if ( !current_slot.immovable )
    {
        if ( current_slot.rod_model )
        {
            self setscriptablepartstate( #"hash_24bc16f2bd4f9d51", #"close" );
            wait 1;
            self.rod_model = current_slot.rod_model;
            current_slot.rod_model.grid_slot = undefined;
            current_slot.rod_model = undefined;
            self.rod_model linkto( self );
            
            if ( current_slot.row >= 0 && self.rod_model.uranium )
            {
                level.power_quest.claw_machine.var_c680c886cc22b5c2--;
                level.power_quest.claw_machine.var_d7090ddafafb33c2 = arrayremove( level.power_quest.claw_machine.var_d7090ddafafb33c2, current_slot );
                thread function_86ad03dce76c8f74( self.rod_model );
            }
            
            self.rod_model hudoutlinedisable();
        }
        else if ( self.rod_model )
        {
            current_slot.rod_model = self.rod_model;
            self.rod_model unlink();
            self.rod_model = undefined;
            current_slot.rod_model.grid_slot = current_slot;
            current_slot.ignore = 0;
            
            if ( current_slot.row >= 0 && current_slot.rod_model.uranium )
            {
                level.power_quest.claw_machine.var_c680c886cc22b5c2++;
                
                if ( !isdefined( level.power_quest.claw_machine.var_d7090ddafafb33c2 ) )
                {
                    level.power_quest.claw_machine.var_d7090ddafafb33c2 = [];
                }
                
                level.power_quest.claw_machine.var_d7090ddafafb33c2[ level.power_quest.claw_machine.var_d7090ddafafb33c2.size ] = current_slot;
                thread function_c675dbd0b1c5a363();
            }
            
            if ( current_slot.row < 0 && zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ad506315f4b635f0" ) )
            {
                player = zm_sat_locust_util::get_quest_reference( #"hash_ad506315f4b635f0" );
                current_slot.rod_model hudoutlineenableforclient( player, "outline_depth_white" );
            }
            
            self setscriptablepartstate( #"hash_24bc16f2bd4f9d51", #"open" );
            wait 1;
        }
    }
    
    move_origin = starting_origin;
    self moveto( move_origin, 1 );
    power_source_craft setscriptablepartstate( #"fx", #"claw_up" );
    self waittill( #"movedone" );
    power_source_craft setscriptablepartstate( #"fx", #"hash_555fa462875de883" );
    table setscriptablepartstate( #"animation", #"idle" );
    self.busy = 0;
    claw_top linkto( self, "tag_origin" );
    rails linkto( self, "tag_origin" );
    camera_ent linkto( self, "tag_origin" );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x13c5b398, Offset: 0xc4e8
// Size: 0x96
function private function_86ad03dce76c8f74( rod )
{
    playsoundatpos( rod.origin, "evt_mq_claw_machine_pickup" );
    function_2d9dc06397a7b746();
    function_eea01053d85bbda7();
    trackers = zm_sat_locust_util::get_quest_reference( #"hash_c503768fae0a13d4" );
    tracker = trackers[ level.power_quest.claw_machine.var_d7090ddafafb33c2.size ];
    tracker.scriptable setscriptablepartstate( #"sat_zm_prop_jasper_tracker", #"inactive" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x6135fa8b, Offset: 0xc586
// Size: 0xca
function private function_c675dbd0b1c5a363()
{
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( #"fx", #"hash_ae3c1a54ee664971" );
    function_338661031411c158();
    function_eea01053d85bbda7();
    trackers = zm_sat_locust_util::get_quest_reference( #"hash_c503768fae0a13d4" );
    tracker = trackers[ level.power_quest.claw_machine.var_d7090ddafafb33c2.size - 1 ];
    tracker.scriptable setscriptablepartstate( #"sat_zm_prop_jasper_tracker", #"active" );
    
    if ( level.power_quest.claw_machine.var_c680c886cc22b5c2 == 3 )
    {
        function_9e7a31065a561940();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x36a93f5d, Offset: 0xc658
// Size: 0x36
function private function_2d9dc06397a7b746()
{
    function_876a84e86318f160();
    
    if ( level.power_quest.claw_machine.var_d7090ddafafb33c2.size == 0 )
    {
        return;
    }
    
    function_338661031411c158( 1 );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x3a886a60, Offset: 0xc696
// Size: 0x1da
function private function_876a84e86318f160()
{
    foreach ( group in level.power_quest.claw_machine.rod_groups )
    {
        foreach ( slot in group.slots )
        {
            foreach ( beam in slot.beams )
            {
                slot function_77c7557b208b7238( beam );
                
                if ( slot.rod_model && !isent( slot.rod_model ) )
                {
                    slot.rod_model setscriptablepartstate( #"sat_zm_prop_jasper_plug", "inactive" );
                }
            }
            
            slot.charge_group = undefined;
        }
    }
    
    level.power_quest.claw_machine.rod_groups = [];
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfcc8faeb, Offset: 0xc878
// Size: 0x205
function private function_338661031411c158( pickup = 0 )
{
    if ( !pickup )
    {
        function_876a84e86318f160();
        new_group = function_254b227cd34b1f02( zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" ).current_slot );
        new_group function_bbec342f0e85ec49();
        
        /#
            iprintlnbold( "<dev string:xdc>" + new_group.group_size );
        #/
        
        new_group function_8be8f8882698fdd0();
    }
    
    foreach ( slot in level.power_quest.claw_machine.var_d7090ddafafb33c2 )
    {
        if ( slot.charge_group )
        {
            continue;
        }
        
        foreach ( group in level.power_quest.claw_machine.rod_groups )
        {
            if ( arraycontains( group.slots, slot ) )
            {
                slot.charge_group = group;
                break;
            }
        }
        
        if ( slot.charge_group )
        {
            continue;
        }
        
        new_group = function_254b227cd34b1f02( slot );
        slot.charge_group = new_group;
        new_group function_bbec342f0e85ec49();
        
        /#
            iprintlnbold( "<dev string:xdc>" + new_group.group_size );
        #/
        
        new_group function_8be8f8882698fdd0();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfc2598bb, Offset: 0xca85
// Size: 0x10e
function private function_254b227cd34b1f02( uranium_slot )
{
    if ( uranium_slot.ignore )
    {
        uranium_slot = utility::array_random( level.power_quest.claw_machine.var_d7090ddafafb33c2 );
    }
    
    group = { #slots:[], #group_size:1, #id_slot:uranium_slot, #id:uranium_slot.rod_model };
    
    if ( !isdefined( level.power_quest.claw_machine.rod_groups ) )
    {
        level.power_quest.claw_machine.rod_groups = [];
    }
    
    level.power_quest.claw_machine.rod_groups[ level.power_quest.claw_machine.rod_groups.size ] = group;
    uranium_slot.charge_group = group;
    return group;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x6ffdfcb5, Offset: 0xcb9c
// Size: 0x3d4
function private function_bbec342f0e85ec49()
{
    uranium_slot = self.id_slot;
    var_6b314407c6b87922 = [];
    var_e298d80a21c4eb07 = [];
    var_b3c1e37f697a0d5b = [ uranium_slot ];
    
    foreach ( slot in uranium_slot.adjacent_slots )
    {
        if ( !slot.rod_model || slot.ignore )
        {
            continue;
        }
        
        var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ slot ] );
        
        if ( slot.charge_group )
        {
            var_6b314407c6b87922 = arraycombineunique( var_6b314407c6b87922, [ slot ] );
            continue;
        }
        
        var_e298d80a21c4eb07 = arraycombineunique( var_e298d80a21c4eb07, [ slot ] );
    }
    
    for ( i = 0; i < 5 ; i++ )
    {
        if ( var_6b314407c6b87922.size > 0 )
        {
            already_charged = var_6b314407c6b87922;
            var_6b314407c6b87922 = [];
            
            foreach ( charged_slot in already_charged )
            {
                foreach ( adj_slot in charged_slot.adjacent_slots )
                {
                    if ( !adj_slot.rod_model || adj_slot.ignore )
                    {
                        continue;
                    }
                    
                    var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ adj_slot ] );
                    
                    if ( adj_slot.charge_group )
                    {
                        var_6b314407c6b87922 = arraycombineunique( var_6b314407c6b87922, [ adj_slot ] );
                        continue;
                    }
                    
                    var_e298d80a21c4eb07 = arraycombineunique( var_e298d80a21c4eb07, [ adj_slot ] );
                }
            }
        }
        
        if ( var_e298d80a21c4eb07.size > 0 )
        {
            not_charged = var_e298d80a21c4eb07;
            var_e298d80a21c4eb07 = [];
            
            foreach ( var_aab30e7d58826e40 in not_charged )
            {
                foreach ( adj_slot in var_aab30e7d58826e40.adjacent_slots )
                {
                    if ( !adj_slot.rod_model || adj_slot.ignore )
                    {
                        continue;
                    }
                    
                    var_b3c1e37f697a0d5b = arraycombineunique( var_b3c1e37f697a0d5b, [ adj_slot ] );
                    
                    if ( adj_slot.charge_group )
                    {
                        var_6b314407c6b87922 = arraycombineunique( var_6b314407c6b87922, [ adj_slot ] );
                        continue;
                    }
                    
                    var_e298d80a21c4eb07 = arraycombineunique( var_e298d80a21c4eb07, [ adj_slot ] );
                }
            }
        }
    }
    
    self.slots = var_b3c1e37f697a0d5b;
    self.group_size = self.slots.size;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x2bd82e4c, Offset: 0xcf78
// Size: 0x27e
function private function_8be8f8882698fdd0()
{
    foreach ( slot in self.slots )
    {
        foreach ( adj_slot in slot.adjacent_slots )
        {
            if ( arraycontains( self.slots, adj_slot ) )
            {
                already_connected = 0;
                
                foreach ( beam in slot.beams )
                {
                    if ( beam.connected_to_pos == adj_slot.grid_pos )
                    {
                        already_connected = 1;
                    }
                }
                
                if ( already_connected )
                {
                    continue;
                }
                
                foreach ( beam in adj_slot.beams )
                {
                    if ( beam.connected_to_pos == slot.grid_pos )
                    {
                        already_connected = 1;
                        break;
                    }
                }
                
                if ( already_connected )
                {
                    continue;
                }
                
                if ( adj_slot.rod_model && slot.rod_model )
                {
                    adj_slot thread function_1bd11287d19eb458( slot );
                    
                    if ( !isent( adj_slot.rod_model ) )
                    {
                        adj_slot.rod_model setscriptablepartstate( #"sat_zm_prop_jasper_plug", "active" );
                    }
                }
            }
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x115666dc, Offset: 0xd1fe
// Size: 0x13f
function private function_1bd11287d19eb458( var_b2a6e4fb5a687c1 )
{
    beam_data = { #connected_to_pos:var_b2a6e4fb5a687c1.grid_pos };
    
    if ( !isdefined( self.beam_start_ent ) )
    {
        self.beam_start_ent = utility::spawn_model( "tag_origin", self.rod_model.origin + ( 0, 0, 3.7 ), self.rod_model.angles );
    }
    
    self.beam_end_ent = var_b2a6e4fb5a687c1.beam_start_ent ?? utility::spawn_model( "tag_origin", var_b2a6e4fb5a687c1.rod_model.origin + ( 0, 0, 3.7 ), var_b2a6e4fb5a687c1.rod_model.angles );
    beam_data.beam_vfx = playfxontagsbetweenclients( utility::getfx( "claw_machine_charge_connect" ), self.beam_start_ent, "tag_origin", self.beam_end_ent, "tag_origin" );
    
    if ( !isdefined( self.beams ) )
    {
        self.beams = [];
    }
    
    self.beams[ self.beams.size ] = beam_data;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x32565ba2, Offset: 0xd345
// Size: 0x81
function private function_77c7557b208b7238( beam_data )
{
    if ( beam_data.beam_vfx )
    {
        beam_data.beam_vfx delete();
    }
    
    if ( self.beam_start_ent )
    {
        self.beam_start_ent delete();
    }
    
    if ( self.beam_end_ent )
    {
        self.beam_end_ent delete();
    }
    
    beam_data.connected_to_pos = undefined;
    self.beams = arrayremove( self.beams, beam_data );
}

// Namespace namespace_7acb35c452673b3
// Params 1
// Checksum 0x4e710dce, Offset: 0xd3ce
// Size: 0x213
function function_eea01053d85bbda7( reset_charge = 0 )
{
    total_charge = 0;
    
    if ( !reset_charge )
    {
        foreach ( group in level.power_quest.claw_machine.rod_groups )
        {
            total_charge += function_6da175c72765c04d( group.group_size );
        }
    }
    
    if ( level.power_quest.claw_machine.var_c680c886cc22b5c2 != 3 )
    {
        if ( total_charge <= 72 )
        {
            total_charge *= 0.8;
        }
    }
    
    scale = level.power_quest.var_c41c5999c56dbffa;
    
    if ( level.power_quest.claw_machine.var_c680c886cc22b5c2 == 3 )
    {
        if ( total_charge < 63 )
        {
            scale = 20.3;
        }
        else if ( total_charge > 72 )
        {
            scale = 21.8;
        }
        else
        {
            scale = 21.1;
        }
    }
    
    needle = zm_sat_locust_util::get_quest_reference( #"claw_machine_needle" );
    var_42f72604c5c35560 = clamp( scale * total_charge / 100, 0, level.power_quest.var_4b8b3a293ef5b69c );
    dir = anglestoleft( needle.angles );
    move_to_point = zm_sat_locust_util::get_quest_reference( #"hash_9c0c22d41cd18ae2" )[ 0 ].origin + dir * var_42f72604c5c35560;
    var_af3e20b7f53b2eb9 = distance2d( needle.origin, move_to_point );
    
    if ( var_af3e20b7f53b2eb9 != 0 )
    {
        needle moveto( move_to_point, var_af3e20b7f53b2eb9 / 20 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xa2bb93ad, Offset: 0xd5e9
// Size: 0xe9
function private function_9e7a31065a561940()
{
    total_charge = 0;
    
    foreach ( group in level.power_quest.claw_machine.rod_groups )
    {
        total_charge += function_6da175c72765c04d( group.group_size );
    }
    
    if ( total_charge >= 63 && total_charge <= 72 )
    {
        thread claw_success();
        
        /#
            iprintlnbold( "<dev string:xf2>" + total_charge );
        #/
        
        return;
    }
    
    thread claw_fail();
    
    /#
        iprintlnbold( "<dev string:x118>" + total_charge );
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xed1cc429, Offset: 0xd6da
// Size: 0x2c
function private function_6da175c72765c04d( size )
{
    return level.power_quest.claw_machine.var_29ccccb8fb3e87ae[ size ];
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xc5155bfb, Offset: 0xd70f
// Size: 0x18d
function private claw_success()
{
    level endon( #"game_ended" );
    wait 1.25;
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ad506315f4b635f0" ) )
    {
        player = zm_sat_locust_util::get_quest_reference( #"hash_ad506315f4b635f0" );
    }
    
    interact = zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" );
    interact.completed = 1;
    
    if ( player )
    {
        interact zm_sat_locust_util::limited_interact_exited( player );
    }
    
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( "fx", "claw_success" );
    wait 2;
    function_876a84e86318f160();
    function_eea01053d85bbda7( 1 );
    item_spawn = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
    params = { #spawntype:#"spawn_at_pos", #spawnangles:item_spawn.angles, #spawnorigin:item_spawn.origin, #asset:%"zmloot_sat_locust_quest_jerry" };
    item = zm_sat_locust_util::spawn_quest_item( params );
    item_spawn delete();
    item setscriptablepartstate( #"zmloot_sat_locust_quest_jerry", #"visible" );
    item setscriptablepartstate( #"objective", #"enabled" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_loot", item );
    utility::flag_set( "mq_rp_step_03_b" );
    utility::flag_set( "mq_rp_step_03" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x10c1dd77, Offset: 0xd8a4
// Size: 0x6d
function private claw_fail()
{
    level endon( #"game_ended", #"mq_rp_step_03_b" );
    wait 1.25;
    player = zm_sat_locust_util::get_quest_reference( #"hash_ad506315f4b635f0" );
    level thread function_819ee9815f3fa614( player );
    interact = zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" );
    interact zm_sat_locust_util::limited_interact_exited( player );
    level thread function_64cf844649f00e87();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0xc
// Checksum 0xc9a3d434, Offset: 0xd919
// Size: 0x1f1
function private function_819ee9815f3fa614( player )
{
    self notify( #"hash_4928987136f3dd09" );
    self endon( #"hash_4928987136f3dd09" );
    level endon( #"game_ended", #"mq_rp_step_03_b" );
    interact = zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" );
    interact.failed = 1;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        if ( interact.var_d46b85cfdf61574e && !interact.completed && interact.failed )
        {
            if ( !isdefined( interact.failures ) )
            {
                interact.failures = 0;
            }
            
            interact.failures++;
            
            if ( interact.failures == 4 )
            {
                thread claw_success();
                return;
            }
        }
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_f86db7d0731c8680" );
            level thread zm_quest::function_fb3af5600f6a9441( 3, 1, #"hash_e3aec2d006eaaee5", #"rod_puzzle" );
            level utility::delaythread( level.framedurationseconds, &utility::callsharedfunc, #"locust_dm", #"update_guidance" );
        }
    }
    
    if ( !isdefined( interact.failed_dialogue ) )
    {
        interact.failed_dialogue = 0;
    }
    
    if ( !interact.failed_dialogue )
    {
        interact.failed_dialogue = 1;
        level thread battlechatter_mp::trysaylocalsound( player, #"bc_flavor_player_negative" );
    }
    
    machine = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
    machine setscriptablepartstate( #"fx", #"claw_fail" );
    function_bc3b27ecda718563( player, machine.origin );
    wait 2;
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( #"fx", #"claw_cooldown" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0xc
// Checksum 0x86fdee03, Offset: 0xdb12
// Size: 0x108
function private function_bc3b27ecda718563( initiating_player, origin )
{
    self notify( #"hash_d34f1e8d7dcc75cb" );
    self endon( #"hash_d34f1e8d7dcc75cb" );
    thread function_29d2781979326664( initiating_player );
    entities_in_radius = getentarrayinradius( undefined, undefined, origin, level.power_quest.var_5473b89dc9e703cf );
    
    foreach ( entity in entities_in_radius )
    {
        if ( isplayer( entity ) && entity != initiating_player )
        {
            thread function_29d2781979326664( entity );
            continue;
        }
        
        if ( isagent( entity ) && entity.team == "team_two_hundred" )
        {
            thread function_103247ac5ae9ef8b( entity );
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x1d7d9962, Offset: 0xdc22
// Size: 0x1bc
function private claw_reset_puzzle()
{
    zm_sat_locust_util::function_a70056d3a99eace5( #"claw_machine_canisters" );
    function_cbf00b4902a27c8b();
    claw = zm_sat_locust_util::get_quest_reference( #"claw_machine_claw" );
    
    if ( claw.current_slot.rod_model.grid_slot )
    {
        claw.current_slot.rod_model.grid_slot = undefined;
    }
    
    if ( claw.rod_model )
    {
        claw setscriptablepartstate( #"hash_24bc16f2bd4f9d51", #"open" );
    }
    
    starting_slot = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" ).all_slots[ 1 ];
    claw thread function_2bf4cdec83ca42ba( starting_slot );
    level.power_quest.claw_machine.var_d7090ddafafb33c2 = [];
    level.power_quest.claw_machine.var_c680c886cc22b5c2 = 0;
    function_876a84e86318f160();
    function_eea01053d85bbda7( 1 );
    trackers = zm_sat_locust_util::get_quest_reference( #"hash_c503768fae0a13d4" );
    
    foreach ( tracker in trackers )
    {
        tracker.scriptable setscriptablepartstate( #"sat_zm_prop_jasper_tracker", #"inactive" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x2a5a4cb7, Offset: 0xdde6
// Size: 0x8d
function private function_29d2781979326664( player )
{
    level endon( #"game_ended" );
    player endon( #"death_or_disconnect" );
    data = { #victim:player };
    thread shock_stick::function_5f89a63c19349cd5( data );
    player utility::waittill_any_timeout( level.power_quest.var_4c70190657232531, "haywire_cleared", "haywire_max_duration", "shockstick_interrupt", "killed_player", "last_stand_enter" );
    shock_stick::function_396a585ccd7071f5( data, !player::isreallyalive( player ) );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x48165494, Offset: 0xde7b
// Size: 0xb5
function private function_103247ac5ae9ef8b( zombie )
{
    level endon( #"game_ended" );
    zombie endon( #"death" );
    
    if ( !zombie val::get( "allow_haywire" ) || zombie.var_91eefe62b94cf0c6 )
    {
        return;
    }
    
    shockdata = { #victim:zombie };
    thread shock_stick::shockstick_haywireagent( shockdata );
    zombie utility::waittill_any_timeout( level.power_quest.var_6bdb55e83904fc54, "haywire_cleared", "haywire_max_duration", "shockstick_interrupt", "killed_player", "last_stand_enter" );
    
    if ( zombie && isalive( zombie ) )
    {
        shock_stick::function_396a585ccd7071f5( shockdata, 0 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xd131d766, Offset: 0xdf38
// Size: 0xb0
function private function_f656b0237774e507()
{
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( "fx", "idle" );
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( "usable", "enabled" );
    interact = zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" );
    interact.failed = 0;
    interact zm_sat_locust_util::function_1a3e351820ab994c();
    function_338661031411c158();
    function_eea01053d85bbda7();
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_clear( #"hash_f86db7d0731c8680" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x50f97ab4, Offset: 0xdff0
// Size: 0x148
function private function_64cf844649f00e87()
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_03_b" );
    level waittill( #"on_round_start" );
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( "fx", "idle" );
    zm_sat_locust_util::get_quest_reference( #"power_source_craft" ) setscriptablepartstate( "usable", "enabled" );
    interact = zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" );
    interact.failed = 0;
    interact zm_sat_locust_util::function_1a3e351820ab994c();
    function_338661031411c158();
    function_eea01053d85bbda7();
    trackers = zm_sat_locust_util::get_quest_reference( #"hash_c503768fae0a13d4" );
    
    for ( i = 0; i < level.power_quest.claw_machine.var_d7090ddafafb33c2.size ; i++ )
    {
        trackers[ i ].scriptable setscriptablepartstate( #"sat_zm_prop_jasper_tracker", #"active" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_clear( #"hash_f86db7d0731c8680" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa70ed3c1, Offset: 0xe140
// Size: 0x198
function private function_66f880697930a38d( skipped, save_restored )
{
    profilestart();
    level callback::remove( #"player_death", &claw_player_death_or_disconnect );
    level callback::remove( #"player_disconnect", &claw_player_death_or_disconnect );
    claw_cleanup();
    
    if ( skipped || save_restored )
    {
        function_876a84e86318f160();
        machine = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
        machine setscriptablepartstate( #"usable", #"disabled" );
        item_spawn = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
        params = { #spawntype:#"spawn_at_pos", #spawnangles:item_spawn.angles, #spawnorigin:item_spawn.origin, #asset:%"zmloot_sat_locust_quest_jerry" };
        item = zm_sat_locust_util::spawn_quest_item( params );
        item_spawn delete();
        item setscriptablepartstate( #"zmloot_sat_locust_quest_jerry", #"visible" );
        item setscriptablepartstate( #"objective", #"enabled" );
        zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_loot", item );
        utility::flag_set( "mq_rp_step_03_b" );
        utility::flag_set( "mq_rp_step_03" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x673bc369, Offset: 0xe2e0
// Size: 0x2af
function private claw_cleanup()
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_a28556adf16e377e" ) )
    {
        zm_sat_locust_util::get_quest_reference( #"hash_a28556adf16e377e" ) delete();
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_grid" ) )
    {
        grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
        
        foreach ( slot in grid.all_slots )
        {
            if ( slot.rod_model )
            {
                if ( isent( slot.rod_model ) )
                {
                    slot.rod_model delete();
                    continue;
                }
                
                if ( slot.rod_model isscriptableinstance() )
                {
                    temp_model = utility::spawn_model( %"sat_locust_zm_jasper_02", slot.rod_model.origin, slot.rod_model.angles );
                    
                    if ( slot.rod_model getscriptableparthasstate( slot.rod_model function_84ad2f70189ee7c3(), #"disabled" ) )
                    {
                        slot.rod_model setscriptablepartstate( slot.rod_model function_84ad2f70189ee7c3(), #"disabled" );
                    }
                    else
                    {
                        slot.rod_model freescriptable();
                    }
                    
                    temp_model moveto( temp_model.origin + ( 0, 0, -4 ), 2 );
                    temp_model utility::delaycall( 4.1, &delete );
                }
            }
        }
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_7ecfedc2a3d24b60" ) )
    {
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        
        foreach ( slot in extra_grid.all_slots )
        {
            if ( slot.rod_model )
            {
                slot.rod_model delete();
            }
        }
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_clear( #"hash_f86db7d0731c8680" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x57e0e34a, Offset: 0xe597
// Size: 0x21
function private function_7d6d643ab952c70a( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa63cd5a3, Offset: 0xe5c0
// Size: 0x2e
function private function_60062848e78b83d5( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        utility::flag_set( "mq_rp_step_04" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x8ca36cd3, Offset: 0xe5f6
// Size: 0x3f
function private function_31f8869dfe36254a( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    level callback::add( "quest_item_used", &function_4305a74abe27fdad );
    utility::flag_wait( "mq_rp_step_04_a" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xe0782cdc, Offset: 0xe63d
// Size: 0xe4
function private function_cc5da069c3749c2d( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"power_source", 1 );
        zm_sat_locust_util::function_a70056d3a99eace5( #"power_source_pickup" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"power_source_loot" );
        
        /#
            if ( level.player && isalive( level.player ) )
            {
                if ( !level callback::exists( "<dev string:x149>", &function_4305a74abe27fdad ) )
                {
                    level callback::add( "<dev string:x149>", &function_4305a74abe27fdad );
                }
                
                level.player function_9cd4f43f24f6bba();
            }
        #/
        
        utility::flag_set( "mq_rp_step_04_a" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x9f0c2c07, Offset: 0xe729
// Size: 0xf1
function private function_4305a74abe27fdad( params )
{
    if ( params.bundle.scriptable == %"zmloot_sat_locust_quest_jerry" )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( params.player );
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"power_source", 1 );
        zm_quest::show_splash_item_picked_up( #"hash_570d84750250b155", #"power_source", 1, params.player );
        utility::flag_set( "mq_rp_step_04_a" );
        
        if ( !level.power_quest.var_d12afe7068fdb2f7 )
        {
            level.power_quest.var_d12afe7068fdb2f7 = 1;
            params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_3d5dc9755e88b0ab", #"bc_flavor_player_positive" );
        }
        
        params.player function_9cd4f43f24f6bba();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x5d27071, Offset: 0xe822
// Size: 0xce
function private function_9cd4f43f24f6bba()
{
    val::set( "holding_power_source", "sprint", 0 );
    val::set( "holding_power_source", "crouch", 0 );
    val::set( "holding_power_source", "prone", 0 );
    self.var_55d09c5e6dd5f1e2 = 1;
    thread function_41e1c6b415e22382( self getstance() == "crouch" || self getstance() == "prone" );
    thread function_d4eaa984649d5e80( 0 );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_holder" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"power_source_holder", self );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_holder", self );
    }
    
    function_7544edce37418716( 0 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x2802b60a, Offset: 0xe8f8
// Size: 0xe2
function private function_31f8859dfe362317( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
    power_source_loc setscriptablepartstate( "usable", "enabled" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_c352c332977dea4" );
    }
    
    interaction::register_scriptable_interact( power_source_loc, &function_63f7c8e95093d2f0, undefined, undefined, hint );
    power_source_loc function_7653c765b6c7b815();
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_holder" ) )
    {
        player = zm_sat_locust_util::get_quest_reference( #"power_source_holder" );
        
        if ( isplayer( player ) )
        {
            power_source_loc enablescriptableplayeruse( player );
        }
    }
    
    utility::flag_wait( "mq_rp_step_04_b" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xe83ff5aa, Offset: 0xe9e2
// Size: 0x126
function private function_cc5d9d69c3749594( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        power_source_loc setscriptablepartstate( "usable", "disabled" );
        power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "enabled" );
        power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
        power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_up" );
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_holder" ) )
        {
            player = zm_sat_locust_util::get_quest_reference( #"power_source_holder" );
            player function_17ac1c25a68d440b();
        }
        
        zm_sat_locust_util::function_a70056d3a99eace5( #"power_source_pickup" );
        utility::flag_set( "mq_rp_step_04_b" );
        utility::flag_set( "mq_rp_step_04" );
    }
    
    level callback::remove( "quest_item_used", &function_4305a74abe27fdad );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xe9263c93, Offset: 0xeb10
// Size: 0x1f0
function private function_edc2596a1a0d8beb()
{
    power_source_loc = utility::getstruct( "mqpo_po_so_de" );
    power_source_deposit = spawnscriptable( %"sat_zm_prop_manfred", power_source_loc.origin, power_source_loc.angles );
    power_source_deposit.attractor_slots = utility::getstructarray( power_source_loc.target );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_deposit", power_source_deposit );
    power_switch_loc = utility::getstruct( "mqpo_po_so_el_bo" );
    power_switch = spawnscriptable( %"sat_zm_prop_sylvester", power_switch_loc.origin, power_switch_loc.angles );
    power_switch.attractor_slots = utility::getstructarray( power_switch_loc.target );
    generator_loc = utility::getstruct( "mqpo_po_so_ge" );
    generator = spawnscriptable( %"sat_zm_prop_talbot", generator_loc.origin, generator_loc.angles );
    power_switch.generator_fx = generator;
    wires_loc = utility::getstruct( "mqpo_po_so_ge_wi" );
    wires = spawnscriptable( %"sat_zm_prop_talbot_02", wires_loc.origin, wires_loc.angles );
    power_switch.wires_fx = wires;
    wires_loc = utility::getstruct( "mqpo_po_so_wi" );
    wires = spawnscriptable( %"sat_zm_prop_manfred_02", wires_loc.origin, wires_loc.angles );
    power_switch.exterior_fx = wires;
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_electrical_box", power_switch );
    utility::flag_wait( "scriptables_ready" );
    
    if ( power_switch )
    {
        power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_down" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xbb1d9648, Offset: 0xed08
// Size: 0x12f
function private function_63f7c8e95093d2f0( player )
{
    if ( player.var_55d09c5e6dd5f1e2 )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        player function_17ac1c25a68d440b();
        power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        power_source_loc setscriptablepartstate( "usable", "disabled" );
        power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "enabled" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( #"hash_f86db9d0731c89e6" );
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
        
        level.power_quest.var_cf29b30fac966d56 = 1;
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_a84e67b0741d4edb" );
        }
        
        power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
        power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_down" );
        power_switch = interaction::register_scriptable_interact( power_switch, &function_436d5e0cc43f6034, undefined, undefined, hint );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xe0ae1f9b, Offset: 0xee3f
// Size: 0x36
function private function_809b3aa69e258d78( interact, player )
{
    return { #string:&"", #type:"HINT_NOICON" };
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfc101577, Offset: 0xee7e
// Size: 0x40
function private function_436d5e0cc43f6034( player )
{
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    level thread battlechatter_mp::trysaylocalsound( player, #"bc_flavor_player_positive" );
    utility::flag_set( "mq_rp_step_04_b" );
    utility::flag_set( "mq_rp_step_04" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x80e087d1, Offset: 0xeec6
// Size: 0x152
function private function_7d6d653ab952c93d( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    if ( !skipped && !save_restored )
    {
        if ( !utility::flag( "begin_round_logic" ) && zm_save::function_1dda3554974a999e() )
        {
            utility::flag_clear( "mq_rp_step_04_a" );
            utility::flag_clear( "mq_rp_step_04_b" );
            utility::flag_clear( "mq_rp_step_04" );
            power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
            power_source_loc setscriptablepartstate( #"usable", #"enabled" );
            power_source_loc setscriptablepartstate( #"model", #"disabled" );
            power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "disabled" );
            item_spawn = utility::getstruct( "mqpo_po_so_it" );
            item = utility::spawn_model( %"sat_locust_zm_jerry_animated", item_spawn.origin, item_spawn.angles );
            zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_pickup", item );
            level thread zm_quest::function_80abdea0cd4c89a7( #"hash_7b26a8bb39d7312", #"pickup_power_source" );
            return;
        }
    }
    
    level thread function_3b0df729eeb45fce();
    utility::flag_wait( "mq_rp_step_05" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x46285949, Offset: 0xf020
// Size: 0xc3
function private function_60062748e78b81a2( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        zm_sat_locust_util::function_a70056d3a99eace5( #"battery_attractor" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"generator_attractor" );
        
        if ( !zm_quest::function_b0a5181ebe7bb905() && level.power_quest.var_9d580c67156bcf1f )
        {
            level thread zm_sat_locust_util::function_6a2d4b2055f04166( #"hash_7b26a8bb39d7312", level.power_quest.var_9d580c67156bcf1f );
        }
        
        utility::flag_set( "mq_rp_step_05" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        level thread zm_quest::update_round_cap( 14, 1, 0 );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x7afe2a98, Offset: 0xf0eb
// Size: 0x1f
function private function_3b0df729eeb45fce()
{
    level thread function_886ea81099ac60f3();
    level thread function_71a73b4b8d51bf6c();
    zm_quest::function_823ee6000b6e1947( zm_round_logic::get_rb_round_number() );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xbd1649ea, Offset: 0xf112
// Size: 0x9d
function private function_886ea81099ac60f3()
{
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    level.power_quest.battery_holdout_timer = 122;
    
    while ( level.power_quest.battery_holdout_timer > 0 )
    {
        wait 1;
        level.power_quest.battery_holdout_timer--;
    }
    
    if ( zm_sat_locust_util::is_holdout_event_active( "power_source_defend" ) )
    {
        zm_sat_locust_util::end_holdout_event( "power_source_defend" );
    }
    
    level thread zm_music::function_e9fd14ede793ef0d( "battery_holdout" );
    level thread function_513f4d842e502a53();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xe261633f, Offset: 0xf1b7
// Size: 0x44b
function private function_71a73b4b8d51bf6c()
{
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"battery_attractor" ) )
    {
        power_source = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        battery = utility::spawn_model( "tag_origin", power_source.origin, power_source.angles );
        battery.deposit_scriptable = power_source;
        zm_sat_locust_util::function_295a36ef38f5acae( #"battery_attractor", battery );
    }
    else
    {
        battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
    }
    
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"generator_attractor" ) )
    {
        power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_a84e67b0741d4edb" );
        }
        
        if ( !arraycontains( level.interacts, power_switch ) )
        {
            interaction::register_scriptable_interact( power_switch, &function_db99ac92c7ccb789, undefined, undefined, hint );
        }
        else
        {
            power_switch interaction::set_interact_use_callback( &function_db99ac92c7ccb789 );
            power_switch interaction::set_interact_hint_callback( hint );
        }
        
        generator = utility::spawn_model( "tag_origin", power_switch.generator_fx.origin, power_switch.generator_fx.angles );
        generator.power_switch = power_switch;
        zm_sat_locust_util::function_295a36ef38f5acae( #"generator_attractor", generator );
    }
    else
    {
        generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
    }
    
    generator.power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_up" );
    generator.power_switch setscriptablepartstate( #"electrical_sparks", #"on" );
    generator.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_on" );
    generator.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"hash_c9835ddae1e14f9e" );
    generator.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"charging" );
    params = { #max_active_zombies:15, #forced_move_speed:"sprint", #var_d346909023f61570:5, #skip_eyes:0, #aitypes:[ { #type:"zombie_base", #weight:50 }, { #type:"zombie_base_armored_light", #weight:30 }, { #type:"zombie_base_armored_heavy", #weight:20 } ], #var_1e899b25f3766233:1, #spawn_zones:[ zone_manager::get_zone_struct( "zone_start_int" ) ], #name:"power_source_defend" };
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        params.difficulty_round_number = zm_utility::get_round_number();
    }
    else
    {
        params.difficulty_round_number = max( zm_utility::get_round_number(), 15 );
    }
    
    level thread zm_sat_locust_util::holdout_event( params );
    level thread function_9936f86db3f11882( params );
    level thread zm_music::function_c2dc5fbb02fcae3a( "battery_holdout", [ "zone_start", "zone_start_int", "zone_start_middle", "zone_start_north" ], #"mq_battery_holdout" );
    
    if ( !level.power_quest.var_3fa0f20132fe71a9 )
    {
        var_ec428ca55ae51c0e = [ "dx_zm_lomn_2rrl_lvtw_ml3dfpwsca1ln1", "dx_zm_lomn_2rrl_detw_ml3dfpwsca1ln2" ];
        var_ec428ba55ae519db = [ "dx_zm_lomn_2rrl_detw_ml3dfpwsca2ln1", "dx_zm_lomn_2rrl_lvtw_ml3dfpwsca2ln2" ];
        level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 1 );
        level.power_quest.var_3fa0f20132fe71a9 = 1;
    }
    
    battery.electrified = 1;
    level thread function_a27a31b3bebe5545();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xe74c2d30, Offset: 0xf60a
// Size: 0x1b5
function private function_24e836053723796d()
{
    level.power_quest.var_40f0faf80dc4fdec = 1;
    zombie_attractor_manager::remove_attractor( self );
    self.damaged = 1;
    battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
    battery.electrified = 0;
    battery.deposit_scriptable setscriptablepartstate( #"sat_zm_prop_manfred", "disabled" );
    self.power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_down" );
    self.power_switch setscriptablepartstate( #"electrical_sparks", #"off" );
    self.power_switch interaction::set_interact_use_callback( &function_db99ac92c7ccb789 );
    self.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"damaged_loop" );
    self.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"off" );
    self.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"disabled" );
    function_31cd0186d4560b6d();
    
    /#
        level notify( #"battery_electrified" );
        debug::print3d( battery, "<dev string:x159>", ( 1, 0, 0 ), undefined, "<dev string:x169>", undefined, undefined, undefined, 70 );
        level notify( #"generator_damage" );
        debug::print3d( self, "<dev string:x17d>", ( 1, 0, 0 ), undefined, "<dev string:x185>", "<dev string:x198>", undefined, undefined, 50 );
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xceb65df, Offset: 0xf7c7
// Size: 0x156
function private function_31cd0186d4560b6d()
{
    old_ui = level.power_quest.var_9d580c67156bcf1f;
    new_ui = level.power_quest.var_da5a700da0aabcd2;
    occupants = function_592f7d4cd010061a();
    params = { #progress:level.power_quest.battery_holdout_completion, #time:level.power_quest.battery_holdout_timer * 1000 };
    zm_sat_locust_util::function_8fc9de196aa509c9( level.power_quest.var_22a383fd30d86256, old_ui, occupants, params );
    zm_sat_locust_util::function_6a660cd129095358( level.power_quest.var_22a383fd30d86256, new_ui, occupants, params );
    
    if ( !utility::flag( #"hash_621593d8eea24f40" ) )
    {
        utility::flag_set( #"hash_621593d8eea24f40" );
    }
    else
    {
        utility::flag_clear( #"hash_621593d8eea24f40" );
    }
    
    level.power_quest.var_9d580c67156bcf1f = new_ui;
    level.power_quest.var_da5a700da0aabcd2 = old_ui;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x35fa6396, Offset: 0xf925
// Size: 0xd3
function private function_db99ac92c7ccb789( player )
{
    if ( zm_quest::function_b0a5181ebe7bb905() && !level.power_quest.var_cf29b30fac966d56 )
    {
        return;
    }
    
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    self setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_up" );
    level thread function_1a5469f011e6584e();
    
    if ( !isdefined( self.repair_dialogue ) )
    {
        self.repair_dialogue = 0;
    }
    
    if ( !self.repair_dialogue )
    {
        level thread battlechatter_mp::trysaylocalsound( player, #"bc_flavor_player_positive" );
        self.repair_dialogue = 1;
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( "mq_rp_step_04_b" );
        utility::flag_set( "mq_rp_step_04" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0xc
// Checksum 0x7e1a31cf, Offset: 0xfa00
// Size: 0x12d
function private function_ca0224975bbff90f( player )
{
    self notify( #"hash_8a7025a94a860b1d" );
    self endon( #"hash_8a7025a94a860b1d" );
    params = { #hud_description:&"shared_hintstrings/repairing", #use_object:self, #hold_time:2, #craft_reason:#"crypt_door_repair" };
    result = player zm_quest::function_e4eb2d1c1bd8fc4e( params );
    
    if ( result )
    {
        level thread function_1a5469f011e6584e();
        
        if ( !isdefined( self.repair_dialogue ) )
        {
            self.repair_dialogue = 0;
        }
        
        if ( !self.repair_dialogue )
        {
            level thread battlechatter_mp::trysaylocalsound( player, #"bc_flavor_player_positive" );
            self.repair_dialogue = 1;
        }
        
        return;
    }
    
    if ( self getscriptablepartstate( #"sat_zm_prop_sylvester" ) == "unusable_up" )
    {
        utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_sylvester", #"usable_up" );
        return;
    }
    
    utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_sylvester", #"usable_down" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x7aa6a3fa, Offset: 0xfb35
// Size: 0x39a
function private function_1a5469f011e6584e()
{
    generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
    generator.damaged = 0;
    
    if ( level.power_quest.battery_holdout_completion )
    {
        generator.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_on" );
        generator.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"hash_c9835ddae1e14f9e" );
        generator.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"charging" );
        battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
        battery.electrified = 1;
        battery.deposit_scriptable setscriptablepartstate( #"sat_zm_prop_manfred", "charging" );
        power_source = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        power_source function_5db2ffc65c240541();
        zombies = getaiarrayinradius( battery.origin, 100 );
        
        foreach ( zombie in zombies )
        {
            if ( zombie val::get( "damageshield_allow_quest_kill" ) )
            {
                zombie utility::callsharedfunc( #"ai", #"hash_c649178f35fe47cf" );
            }
            
            zombie kill();
        }
        
        level.power_quest.var_40f0faf80dc4fdec = 1;
        level thread function_fb826414dbcf775e();
        function_31cd0186d4560b6d();
        
        /#
            level notify( #"battery_electrified" );
            debug::print3d( battery, "<dev string:x19e>", ( 0, 1, 0 ), undefined, "<dev string:x169>", undefined, undefined, undefined, 70 );
        #/
    }
    else
    {
        function_ae8a2b6e508d8b02();
        
        if ( level.power_quest.var_cf29b30fac966d56 )
        {
            level thread function_3b0df729eeb45fce();
            generator.power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_up" );
            generator.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_on" );
            generator.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"hash_c9835ddae1e14f9e" );
            generator.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"charging" );
        }
        else
        {
            generator.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"off" );
            generator.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"off" );
            generator.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"disabled" );
        }
    }
    
    level notify( #"generator_repaired" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x71b80463, Offset: 0xfed7
// Size: 0x44
function private function_ae8a2b6e508d8b02()
{
    power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
    power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_down" );
    power_switch interaction::set_interact_use_callback( &function_47ff9aeafb4641c2 );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xf0a67c02, Offset: 0xff23
// Size: 0x39a
function private function_a27a31b3bebe5545()
{
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    level.power_quest.battery_holdout_completion = 0;
    level.power_quest.battery_holdout_zombies = [];
    level.power_quest.var_d677ec7c06731e67 = 0;
    battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
    battery.deposit_scriptable setscriptablepartstate( #"sat_zm_prop_manfred", #"charging" );
    battery.deposit_scriptable thread function_f1f3ebb72fdeec2e();
    
    /#
        level notify( #"battery_electrified" );
        debug::print3d( battery, "<dev string:x19e>", ( 0, 1, 0 ), undefined, "<dev string:x169>", undefined, undefined, undefined, 70 );
    #/
    
    level.power_quest.battery_zones = [ "zone_start", "zone_start_int", "zone_start_middle", "zone_start_north" ];
    level.power_quest.var_22a383fd30d86256 = zm_quest::function_b0a5181ebe7bb905() ? #"hash_e3aec2d006eaaee5" : #"hash_7b26a8bb39d7312";
    level callback::add( "zone_changed", &function_ee4021440e68742b );
    level.power_quest.var_9d580c67156bcf1f = #"defend_power_source";
    level.power_quest.var_da5a700da0aabcd2 = #"hash_621593d8eea24f40";
    occupants = function_592f7d4cd010061a();
    zm_sat_locust_util::function_21931a8eba7c0535( level.power_quest.var_22a383fd30d86256, level.power_quest.var_9d580c67156bcf1f, occupants );
    
    while ( level.power_quest.battery_holdout_completion < 60 )
    {
        if ( !battery.electrified )
        {
            waitframe();
            continue;
        }
        
        wait 1;
        level.power_quest.battery_holdout_completion = int( clamp( level.power_quest.battery_holdout_completion + 1, 0, 60 ) );
        occupants = function_592f7d4cd010061a();
        
        foreach ( player in occupants )
        {
            player zm_quest::function_9f49b2a045ece8ae( level.power_quest.battery_holdout_completion, 0, level.power_quest.var_22a383fd30d86256, level.power_quest.var_9d580c67156bcf1f );
        }
        
        if ( !battery.attractor && level.power_quest.battery_holdout_completion >= 8 )
        {
            battery function_9a63aed666d89845();
            battery thread function_d1a66af2839d64f0();
        }
        
        if ( level.power_quest.battery_holdout_completion > 60 * ( level.power_quest.var_d677ec7c06731e67 + 1 ) / 3 )
        {
            level.power_quest.var_d677ec7c06731e67++;
            zm_sat_locust_util::get_quest_reference( #"generator_attractor" ) function_24e836053723796d();
        }
    }
    
    level thread function_513f4d842e502a53( 1 );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x5d3c491f, Offset: 0x102c5
// Size: 0x9b
function private function_f1f3ebb72fdeec2e()
{
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    
    while ( true )
    {
        if ( level.power_quest.battery_holdout_completion < 30 )
        {
            self setscriptablepartstate( #"model", #"hash_d4c5222fd7e703d4" );
        }
        else
        {
            self setscriptablepartstate( #"model", #"hash_d4c5232fd7e70587" );
        }
        
        wait 1;
        self setscriptablepartstate( #"model", #"hash_d4c5252fd7e708ed" );
        wait 1;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x783cb3c9, Offset: 0x10368
// Size: 0x163
function private function_ee4021440e68742b( params )
{
    if ( params.zone_struct.zone_name && arraycontains( level.power_quest.battery_zones, params.zone_struct.zone_name ) )
    {
        var_f1c9fc9ebf3d62c4 = isdefined( params.previous_zone_struct.zone_name ) ? arraycontains( level.power_quest.battery_zones, params.previous_zone_struct.zone_name ) : undefined;
        
        if ( !params.previous_zone_struct.zone_name || !var_f1c9fc9ebf3d62c4 )
        {
            if ( !zm_quest::function_b0a5181ebe7bb905() )
            {
                zm_sat_locust_util::function_bebcac3a92f1773b( #"hash_7b26a8bb39d7312", level.power_quest.var_9d580c67156bcf1f, { #progress:level.power_quest.battery_holdout_completion, #time:level.power_quest.battery_holdout_timer * 1000 } );
            }
        }
        
        return;
    }
    
    if ( !zm_quest::function_b0a5181ebe7bb905() )
    {
        zm_sat_locust_util::function_f6dd0fd21ea7a060( #"hash_7b26a8bb39d7312", level.power_quest.var_9d580c67156bcf1f );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xca3ddb76, Offset: 0x104d3
// Size: 0x87
function private function_9a63aed666d89845()
{
    self.attractor = zombie_attractor_manager::add_attractor( self, 4, 1280, 1, undefined, &function_506934476f63a12d, undefined, undefined, 1 );
    zombie_attractor_manager::function_4c34b0f066a9d9fe( self.attractor, 240 );
    zombie_attractor_manager::set_attractor_slots( self.attractor, self.deposit_scriptable.attractor_slots );
    zombie_attractor_manager::function_a2aab3762aaa055f( self.attractor, self.origin, ( 32, 32, 32 ), self.angles );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0xc
// Checksum 0x9429cf3a, Offset: 0x10562
// Size: 0xfa
function private function_d1a66af2839d64f0()
{
    self notify( #"hash_7b5ddf7758f4b809" );
    self endon( #"hash_7b5ddf7758f4b809" );
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    self.attractor.source setcandamage( 1 );
    
    for ( ;; )
    {
        self waittill( #"damage", amount, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon );
        
        if ( isplayer( attacker ) )
        {
            continue;
        }
        
        destroyed = function_60bc98133109a1b9();
        
        if ( destroyed )
        {
            break;
        }
    }
    
    level thread function_513f4d842e502a53();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xe319981c, Offset: 0x10664
// Size: 0x177, Type: bool
function private function_60bc98133109a1b9()
{
    level.power_quest.battery_holdout_completion = int( clamp( level.power_quest.battery_holdout_completion - 8, 0, 60 ) );
    ui_quest_name = zm_quest::function_b0a5181ebe7bb905() ? #"hash_e3aec2d006eaaee5" : #"hash_7b26a8bb39d7312";
    occupants = function_592f7d4cd010061a();
    
    foreach ( player in occupants )
    {
        player zm_quest::function_9f49b2a045ece8ae( level.power_quest.battery_holdout_completion, zm_quest::function_b0a5181ebe7bb905(), ui_quest_name, level.power_quest.var_9d580c67156bcf1f );
    }
    
    if ( self.electrified )
    {
        power_source = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        level.power_quest.var_40f0faf80dc4fdec = 1;
        level thread function_fb826414dbcf775e();
        power_source function_5db2ffc65c240541();
    }
    
    if ( level.power_quest.battery_holdout_completion <= 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x82e64d55, Offset: 0x107e4
// Size: 0x3e
function private function_fb826414dbcf775e()
{
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    wait 3;
    level.power_quest.var_40f0faf80dc4fdec = 0;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x9b930a4c, Offset: 0x1082a
// Size: 0x56
function private function_5db2ffc65c240541()
{
    self setscriptablepartstate( #"electrical_blast", #"blast" );
    max_damage = namespace_775af9b7afedb6d1::get_starting_health( "health_zombie_base", 15, 1 );
    max_damage *= 2;
    radiusdamage( self.origin, 200, max_damage, 50, undefined, "MOD_ELEMENTAL_ELEC" );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x4aa6a8de, Offset: 0x10888
// Size: 0x127
function private function_9936f86db3f11882( params )
{
    level endon( #"game_ended" );
    level endon( #"hash_593be04f8033b910" );
    level endon( #"mq_rp_step_05" );
    
    while ( true )
    {
        if ( level.power_quest.battery_holdout_completion > 20 )
        {
            break;
        }
        
        wait 0.25;
    }
    
    spawn_node = utility::getstruct( "mqpo_po_so_zo_sp" );
    spawn_node.script_animation = "spawn";
    var_c2429c08ecbd101b = max( zm_utility::get_round_number(), 15 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        var_c2429c08ecbd101b = zm_utility::get_round_number();
    }
    
    ai_type = "zombie_karkinos";
    new_params = { #spawn_node:spawn_node, #difficulty_round_number:var_c2429c08ecbd101b, #spawner_zombie_type:ai_type };
    new_params.active_zombies = params.active_zombies;
    zombie = zm_sat_locust_util::spawn_quest_zombie( new_params );
    
    if ( !isdefined( zombie ) )
    {
        assertmsg( "<dev string:x1aa>" );
        return;
    }
    
    return zombie;
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfe671d5d, Offset: 0x109b8
// Size: 0x4e2
function private function_513f4d842e502a53( success = 0 )
{
    level notify( #"hash_593be04f8033b910" );
    zm_sat_locust_util::end_holdout_event( "power_source_defend" );
    level thread zm_music::function_e9fd14ede793ef0d( "battery_holdout" );
    battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
    generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
    zombie_attractor_manager::remove_attractor( battery );
    zombie_attractor_manager::remove_attractor( generator );
    
    /#
        level notify( #"generator_damage" );
    #/
    
    playersinzone = zm_quest::function_b0a5181ebe7bb905() ? level.players : function_592f7d4cd010061a();
    level callback::remove( "zone_changed", &function_ee4021440e68742b );
    
    if ( generator.power_switch.generator_fx getscriptablepartstate( #"sat_zm_prop_talbot" ) != "damaged_loop" )
    {
        generator.power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_off" );
    }
    
    generator.power_switch setscriptablepartstate( #"electrical_sparks", #"off" );
    generator.power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"off" );
    generator.power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"disabled" );
    utility::flag_clear( #"hash_621593d8eea24f40" );
    
    if ( success )
    {
        generator.power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"unusable_down" );
        battery delete();
        generator delete();
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            zm_sat_locust_util::function_8fc9de196aa509c9( #"hash_e3aec2d006eaaee5", level.power_quest.var_9d580c67156bcf1f, level.players );
        }
        else
        {
            zm_sat_locust_util::function_95f75c64fd2a760a( #"hash_7b26a8bb39d7312", level.power_quest.var_9d580c67156bcf1f, playersinzone );
        }
        
        utility::flag_set( "mq_rp_step_05" );
        return;
    }
    
    level.power_quest.battery_holdout_completion = 0;
    battery.deposit_scriptable setscriptablepartstate( #"sat_zm_prop_manfred", "disabled" );
    battery.deposit_scriptable setscriptablepartstate( #"model", "disabled" );
    drop_origin = utility::array_random( battery.deposit_scriptable.attractor_slots ).origin;
    params = { #spawntype:#"spawn_to_pos_from_pos", #toangles:battery.deposit_scriptable.angles, #fromorigin:battery.deposit_scriptable.origin, #toorigin:drop_origin, #asset:%"zmloot_sat_locust_quest_jerry" };
    item = zm_sat_locust_util::spawn_quest_item( params );
    item setscriptablepartstate( #"objective", #"enabled" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"power_source_pickup", item );
    level.power_quest.var_cf29b30fac966d56 = 0;
    
    if ( !level callback::exists( "quest_item_used", &function_7de4a7186bdcc032 ) )
    {
        level callback::add( "quest_item_used", &function_7de4a7186bdcc032 );
    }
    
    generator.power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_down" );
    zm_sat_locust_util::function_2211f14c53e8a96d( level.power_quest.var_22a383fd30d86256, level.power_quest.var_9d580c67156bcf1f, playersinzone );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_clear( "mq_rp_step_04" );
        utility::flag_clear( "mq_rp_step_04_a" );
        utility::flag_clear( "mq_rp_step_04_b" );
        utility::flag_clear( #"hash_f86db9d0731c89e6" );
        utility::delaythread( level.framedurationseconds, &utility::callsharedfunc, #"locust_dm", #"update_guidance" );
    }
    
    if ( !level.power_quest.var_670ebf50e599e765 )
    {
        var_ec428ca55ae51c0e = [ "dx_zm_lomn_2rrl_lvtw_ml3dfpsfa1ln1", "dx_zm_lomn_2rrl_detw_ml3dfpsfa1ln2" ];
        var_ec428ba55ae519db = [ "dx_zm_lomn_2rrl_detw_ml3dfpsfa2ln1", "dx_zm_lomn_2rrl_lvtw_ml3dfpsfa2ln2" ];
        level thread zm_sat_locust_util::function_1d7335486cb891d8( var_ec428ca55ae51c0e, var_ec428ba55ae519db, 1 );
        level.power_quest.var_670ebf50e599e765 = 1;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x28f2d7ce, Offset: 0x10ea2
// Size: 0xfd
function private function_7de4a7186bdcc032( params )
{
    if ( params.bundle.scriptable == %"zmloot_sat_locust_quest_jerry" )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( params.player );
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"power_source", 1 );
        zm_quest::show_splash_item_picked_up( #"hash_570d84750250b155", #"power_source", 1, params.player );
        power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        power_source_loc setscriptablepartstate( "usable", "enabled" );
        power_source_loc interaction::set_interact_use_callback( &function_a3cc451e3b3c3e0 );
        params.player function_9cd4f43f24f6bba();
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            utility::flag_set( "mq_rp_step_04_a" );
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x4bf9dadf, Offset: 0x10fa7
// Size: 0x124
function private function_a3cc451e3b3c3e0( player )
{
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"generator_attractor" ) )
    {
        generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
    }
    
    power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
    
    if ( generator.damaged )
    {
        power_switch interaction::set_interact_use_callback( &function_db99ac92c7ccb789 );
    }
    else
    {
        function_ae8a2b6e508d8b02();
    }
    
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    player function_17ac1c25a68d440b();
    level callback::remove( "quest_item_used", &function_7de4a7186bdcc032 );
    power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
    power_source_loc setscriptablepartstate( "usable", "disabled" );
    power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "enabled" );
    level.power_quest.var_cf29b30fac966d56 = 1;
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86db9d0731c89e6" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xa4413a2b, Offset: 0x110d3
// Size: 0x100
function private function_47ff9aeafb4641c2( player )
{
    if ( !level.power_quest.var_cf29b30fac966d56 )
    {
        return;
    }
    
    zm_sat_locust_util::function_63a23256772ea1b9( player );
    self setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_up" );
    self setscriptablepartstate( #"electrical_sparks", #"on" );
    self.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_on" );
    self.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"hash_c9835ddae1e14f9e" );
    self.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"charging" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( "mq_rp_step_04_b" );
        utility::flag_set( "mq_rp_step_04" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    level thread function_3b0df729eeb45fce();
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xb6063dc9, Offset: 0x111db
// Size: 0x42, Type: bool
function private function_506934476f63a12d( attractor, zombie )
{
    if ( self.subclass != "zombie_base" || level.power_quest.var_40f0faf80dc4fdec )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa9e7ffc8, Offset: 0x11226
// Size: 0xcb, Type: bool
function private function_cccb3afcf4ef09dd( attractor, zombie )
{
    if ( self.subclass != "zombie_base" )
    {
        return false;
    }
    
    foreach ( player in level.players )
    {
        if ( isalive( player ) && distance2dsquared( player.origin, zombie.origin ) <= squared( 65 ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xddebea0b, Offset: 0x112fa
// Size: 0xbb
function private function_592f7d4cd010061a()
{
    battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
    occupants = zone_manager::function_f6f925c185a652c( battery );
    
    foreach ( player in level.players )
    {
        if ( player.usingchoppergunner )
        {
            arraycombineunique( occupants, [ player ] );
        }
    }
    
    return occupants;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xb9ee8266, Offset: 0x113be
// Size: 0x21
function private function_7d6d623ab952c2a4( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xa63cd5a3, Offset: 0x113e7
// Size: 0x2e
function private function_60062648e78b7f6f( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        utility::flag_set( "mq_rp_step_06" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xefc9b42d, Offset: 0x1141d
// Size: 0x118
function private function_1529189de92bdd20( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
    params = { #spawntype:#"spawn_at_pos", #spawnangles:power_source_loc.angles, #spawnorigin:power_source_loc.origin, #asset:%"zmloot_sat_locust_quest_jerry_charged" };
    item = zm_sat_locust_util::spawn_quest_item( params );
    item setscriptablepartstate( #"objective", #"enabled" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_8c446a7ac3c0792a", item );
    power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "disabled" );
    power_source_loc setscriptablepartstate( #"model", "disabled" );
    level callback::add( "quest_item_used", &function_817f642ee9152369 );
    utility::flag_wait( "mq_rp_step_06_a" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xe0ee3b2a, Offset: 0x1153d
// Size: 0x119
function private function_af8e3269ae6a5403( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"power_source", 2 );
        
        /#
            if ( level.player && isalive( level.player ) )
            {
                if ( !level callback::exists( "<dev string:x149>", &function_817f642ee9152369 ) )
                {
                    level callback::add( "<dev string:x149>", &function_817f642ee9152369 );
                }
                
                level.player function_244b9f96e0365868();
            }
        #/
        
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_8c446a7ac3c0792a" );
        power_source_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        power_source_loc setscriptablepartstate( #"sat_zm_prop_manfred", "disabled" );
        power_source_loc setscriptablepartstate( #"model", "disabled" );
        utility::flag_set( "mq_rp_step_06_a" );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x2f89771e, Offset: 0x1165e
// Size: 0xfd
function private function_817f642ee9152369( params )
{
    if ( params.bundle.scriptable == %"zmloot_sat_locust_quest_jerry_charged" )
    {
        zm_sat_locust_util::function_63a23256772ea1b9( params.player );
        zm_quest::function_b57dfe9625966b0b( #"hash_570d84750250b155", 0, #"power_source", 2 );
        zm_quest::show_splash_item_picked_up( #"hash_570d84750250b155", #"power_source", 2, params.player );
        utility::flag_set( "mq_rp_step_06_a" );
        
        if ( !level.power_quest.var_9fdc4c3e655a5025 && params.player zm_vo::is_hero_operator() )
        {
            level.power_quest.var_9fdc4c3e655a5025 = 1;
            params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_9f1957ddc465944" );
        }
        
        params.player function_244b9f96e0365868();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x2dd1f0fa, Offset: 0x11763
// Size: 0xd5
function private function_244b9f96e0365868()
{
    val::set( "holding_power_source", "sprint", 0 );
    val::set( "holding_power_source", "crouch", 0 );
    val::set( "holding_power_source", "prone", 0 );
    self.var_55d09c5e6dd5f1e2 = 1;
    thread function_41e1c6b415e22382( self getstance() == "crouch" || self getstance() == "prone" );
    thread function_d4eaa984649d5e80();
    thread function_29547d84c15e6771();
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_55bca3f1ee545e14" ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( #"hash_55bca3f1ee545e14", self );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_55bca3f1ee545e14", self );
    }
    
    function_7544edce37418716( 1 );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xccb8f17e, Offset: 0x11840
// Size: 0x1da
function private function_7544edce37418716( is_charged = 1 )
{
    back_ent = utility::spawn_model( "tag_origin" );
    back_ent linkto( self, "j_spinelower", ( 0, 12, 0 ), ( -90, 180, 0 ) );
    back_ent function_7207895b28c71c79( 1 );
    item_type = is_charged ? %"zmloot_sat_locust_quest_jerry_charged" : %"zmloot_sat_locust_quest_jerry";
    item_type_ref = is_charged ? #"zmloot_sat_locust_quest_jerry_charged" : #"zmloot_sat_locust_quest_jerry";
    params = { #spawntype:#"spawn_at_pos", #spawnangles:( 0, 0, 0 ), #spawnorigin:( 0, 0, 0 ), #asset:item_type };
    item = zm_sat_locust_util::spawn_quest_item( params );
    item setscriptablepartstate( item_type_ref, #"visible_not_usable" );
    item setscriptablepartstate( #"objective", #"enabled" );
    item utility::scriptable_setparententity( back_ent );
    self.var_d7fbedfc8f873323 = back_ent;
    self.var_541ad04764e273e5 = item;
    power_source = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
    
    if ( power_source )
    {
        power_source enablescriptableplayeruse( self );
    }
    
    idx = is_charged ? 12 : 11;
    self setclientomnvar( "ui_hud_carried_item_index", idx );
    self setclientomnvar( "ui_hud_carried_item_count", 1 );
    self notifyonplayercommand( "drop_canister_check", "+stance" );
    self notifyonplayercommand( "drop_canister_check", "+prone" );
    self notifyonplayercommand( "drop_canister_check", "+movedown" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x6f57b219, Offset: 0x11a22
// Size: 0x77
function private function_15291b9de92be3b9( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    level callback::add( #"hash_462433e659e82d48", &function_1c0355b78505bafc );
    level thread function_dacff324b9080812();
    level thread function_24fc564aab4472cd();
    zm_quest::function_823ee6000b6e1947( zm_round_logic::get_rb_round_number() );
    zm_quest::function_823ee6000b6e1947( zm_round_logic::get_rb_round_number() + 1 );
    function_89acd6f483dc67e6();
    utility::flag_wait( "mq_rp_step_06_b" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0xe038b970, Offset: 0x11aa1
// Size: 0xf8
function private function_af8e3369ae6a5636( skipped, save_restored )
{
    profilestart();
    
    if ( level.var_6b629607b76c0354 )
    {
        level thread function_79ef73753260c9bc();
    }
    
    if ( skipped || save_restored )
    {
        level notify( #"battery_delivered" );
        var_4f4b64594f55ca94 = zm_sat_locust_util::get_quest_reference( #"hash_59d80432a1a3fdb9" );
        var_4f4b64594f55ca94 setscriptablepartstate( "usable", "disabled" );
        var_4f4b64594f55ca94 setscriptablepartstate( "body", "enabled" );
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_55bca3f1ee545e14" ) )
        {
            player = zm_sat_locust_util::get_quest_reference( #"hash_55bca3f1ee545e14" );
            player function_17ac1c25a68d440b( 1 );
        }
        
        utility::flag_set( "mq_rp_step_06_b" );
        utility::flag_set( "mq_rp_step_06" );
    }
    
    level thread function_5e542c5ed5aeed28();
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x73e0ce45, Offset: 0x11ba1
// Size: 0xaf
function private function_79ef73753260c9bc()
{
    namespace_dba99780c141b678::function_c03123422fb8e97d();
    namespace_dba99780c141b678::cleanup();
    
    if ( level.var_6b629607b76c0354.virgil_ent && isalive( level.var_6b629607b76c0354.virgil_ent ) )
    {
        virgil_ent = level.var_6b629607b76c0354.virgil_ent;
        virgil_ent val::reset_all( #"fake_virgil" );
        
        if ( virgil_ent val::get( "damageshield_allow_quest_kill" ) )
        {
            virgil_ent utility::callsharedfunc( #"ai", #"hash_c649178f35fe47cf" );
        }
        
        virgil_ent kill();
    }
    
    waitframe();
    level.var_6b629607b76c0354 = undefined;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x12287f52, Offset: 0x11c58
// Size: 0x50
function private function_8e792b5c68afa0cb()
{
    var_4f4b64594f55ca94 = utility::getstruct( "mqpo_ch_po_so_de" );
    var_4f4b64594f55ca94 = spawnscriptable( %"sat_zm_prop_neville", var_4f4b64594f55ca94.origin, var_4f4b64594f55ca94.angles );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_59d80432a1a3fdb9", var_4f4b64594f55ca94 );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xb440bd6c, Offset: 0x11cb0
// Size: 0x74
function private function_89acd6f483dc67e6()
{
    var_4f4b64594f55ca94 = zm_sat_locust_util::get_quest_reference( #"hash_59d80432a1a3fdb9" );
    var_4f4b64594f55ca94 setscriptablepartstate( "usable", "enabled" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        hint = utility::callsharedfunc( #"directed_mode", #"get_interact_func", #"hash_d09ef62e904c7cc" );
    }
    
    interaction::register_scriptable_interact( var_4f4b64594f55ca94, &function_83be0a354dde91b4, undefined, undefined, hint );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xec5c7aaa, Offset: 0x11d2c
// Size: 0xc5
function private function_83be0a354dde91b4( player )
{
    if ( player.var_55d09c5e6dd5f1e2 )
    {
        var_4f4b64594f55ca94 = zm_sat_locust_util::get_quest_reference( #"hash_59d80432a1a3fdb9" );
        var_4f4b64594f55ca94 setscriptablepartstate( "usable", "disabled" );
        var_4f4b64594f55ca94 setscriptablepartstate( "body", "enabled" );
        level notify( #"battery_delivered" );
        zm_sat_locust_util::function_63a23256772ea1b9( player );
        player function_fd496e480785b95f();
        player function_17ac1c25a68d440b( 1 );
        dialogue = !player zm_vo::is_richtofen() ? "dx_zm_lomn_2rrl_typa_ml3plpwsob" : "dx_zm_lomn_2rrl_typa_ml3plpwsobpu";
        level thread zm_sat_locust_util::function_a8b578b47e763d0f( dialogue );
        utility::flag_set( "mq_rp_step_06_b" );
        utility::flag_set( "mq_rp_step_06" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xfe7735d7, Offset: 0x11df9
// Size: 0x2e
function private function_58c4a9d760f841a4()
{
    namespace_dba99780c141b678::init();
    ice_walls = utility::getstructarray( "mqpo_ic_wa", "targetname" );
    namespace_dba99780c141b678::setup_arena_properties( ice_walls );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xd15c6e73, Offset: 0x11e2f
// Size: 0x179
function private function_dacff324b9080812()
{
    utility::flag_wait( "begin_round_logic" );
    origin = ( 4929, 7549, 308 );
    angles = ( 0, 0, 0 );
    params = { #spawn_node:{ #angles:angles, #origin:origin }, #spawner_zombie_type:"zombie_base" };
    zombie = zm_sat_locust_util::spawn_quest_zombie( params );
    
    if ( isdefined( zombie ) )
    {
        zombie asm::freeze_ai();
        zombie hide();
        zombie invisiblenotsolid();
        zombie val::set( #"fake_virgil", "death", 0 );
    }
    
    level.var_6b629607b76c0354.virgil_ent = zombie;
    var_1888b050d443f1de = structcopy( namespace_dba99780c141b678::function_f5d5ec8b4b8a5e33() );
    var_1888b050d443f1de.var_70bbf852ea79c4ba = 1;
    var_1888b050d443f1de.var_1607b7a6b428ada = 1.5;
    var_1888b050d443f1de.var_64bf2bd1792ae381 = 500;
    var_1888b050d443f1de.var_fd259abce3ad9187 = 1;
    var_1888b050d443f1de.var_6fa394937ac3d679 = 60;
    var_1888b050d443f1de.var_b8e14f53324dd439 = 0;
    var_1888b050d443f1de.var_ab36bebeec5276c8 = 12;
    var_1888b050d443f1de.var_ce34a824babdb06f = 0.1;
    var_1888b050d443f1de.var_3e9991a985d1c362 = 1;
    level thread namespace_dba99780c141b678::function_f813e384d8ce67ae( var_1888b050d443f1de );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x1391c5b3, Offset: 0x11fb0
// Size: 0xff
function private function_751bc067c6677fbe()
{
    wave_triggers = [];
    triggers = getnoentvolumearray( "s2_wave", #targetname );
    
    foreach ( trigger in triggers )
    {
        trigger triggerdisable();
        
        if ( trigger.target )
        {
            trigger.next = getnoentvolumearray( trigger.target, #targetname )[ 0 ];
            trigger.next triggerdisable();
        }
        
        wave_triggers[ trigger.script_noteworthy ] = trigger;
    }
    
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_c5c2efbb9484c026", wave_triggers );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x72a9202, Offset: 0x120b7
// Size: 0x97
function private function_24fc564aab4472cd()
{
    level.var_bec6e63e32140b38 = [];
    triggers = zm_sat_locust_util::get_quest_reference( #"hash_c5c2efbb9484c026" );
    
    foreach ( trigger in triggers )
    {
        trigger thread function_86c971bd993626d();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x7a97a166, Offset: 0x12156
// Size: 0x423
function private function_86c971bd993626d()
{
    level endon( #"game_ended" );
    level endon( #"mq_rp_step_06_b" );
    self triggerenable();
    
    for ( ;; )
    {
        self waittill( #"trigger", player );
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_holder" ) )
        {
            holder = zm_sat_locust_util::get_quest_reference( #"power_source_holder" );
            
            if ( holder == player )
            {
                break;
            }
        }
    }
    
    self triggerdisable();
    zone_dock = [ zone_manager::get_zone_struct( "zone_shipyard" ), zone_manager::get_zone_struct( "zone_shipyard_warehouse" ), zone_manager::get_zone_struct( "zone_shipyard_warehouse_2" ), zone_manager::get_zone_struct( "zone_shipyard_shore" ) ];
    zone_downtown = [ zone_manager::get_zone_struct( "zone_downtown_middle_street" ), zone_manager::get_zone_struct( "zone_downtown_building" ), zone_manager::get_zone_struct( "zone_downtown" ), zone_manager::get_zone_struct( "zone_downtown_north_street" ) ];
    zone_foundry = [ zone_manager::get_zone_struct( "zone_foundry_factory" ), zone_manager::get_zone_struct( "zone_foundry_office" ), zone_manager::get_zone_struct( "zone_foundry_middle" ) ];
    zone_market = [ zone_manager::get_zone_struct( "zone_village" ) ];
    zone_bridge = [ zone_manager::get_zone_struct( "zone_bridge" ), zone_manager::get_zone_struct( "zone_bridge_2" ) ];
    zone_map = [ "bridge":zone_bridge, "market":zone_market, "foundry":zone_foundry, "downtown":zone_downtown, "dock":zone_dock ];
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        difficulty_round_number = zm_round_logic::get_rb_round_number();
    }
    else
    {
        difficulty_round_number = 20;
    }
    
    switch ( self.script_noteworthy )
    {
        case #"hash_2c5efc9850d0cbb5":
        case #"hash_3d2f4fa412dd2fd1":
        case #"hash_4bd0decdac3b520a":
        case #"hash_f95a380a057d02fa":
            params = { #aitypes:[ { #type:"zombie_base", #weight:5 }, { #type:"zombie_base_armored_light", #weight:45 }, { #type:"zombie_base_armored_heavy", #weight:50 } ], #forced_move_speed:"sprint", #max_spawn_count:15, #max_active_zombies:15, #var_98f23c369371e8ec:0, #var_1e899b25f3766233:0, #var_d346909023f61570:difficulty_round_number, #difficulty_round_number:difficulty_round_number, #spawn_zones:zone_map[ self.script_noteworthy ], #name:"wave_" + self.script_noteworthy };
            break;
        case #"hash_bd09950854d77c70":
            if ( zm_sat_locust_util::is_holdout_event_active( "wave_bridge" ) )
            {
                return;
            }
            
            params = { #spawner_zombie_type:"zombie_base_luna", #forced_move_speed:"sprint", #max_spawn_count:20, #max_active_zombies:20, #var_98f23c369371e8ec:0, #var_1e899b25f3766233:0, #var_d346909023f61570:difficulty_round_number, #difficulty_round_number:difficulty_round_number, #spawn_zones:zone_map[ self.script_noteworthy ], #name:"wave_" + self.script_noteworthy };
            break;
        default:
            assertmsg( "<dev string:x1d6>" + self.script_noteworthy );
            return;
    }
    
    if ( params )
    {
        level thread function_5e542c5ed5aeed28();
        level thread zm_sat_locust_util::holdout_event( params );
        level.var_bec6e63e32140b38[ level.var_bec6e63e32140b38.size ] = params.name;
    }
    
    if ( self.next )
    {
        self.next thread function_86c971bd993626d();
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xf6ca503e, Offset: 0x12581
// Size: 0xd, Type: bool
function private function_1c0355b78505bafc( params )
{
    return false;
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x50408715, Offset: 0x12597
// Size: 0x86
function private function_5e542c5ed5aeed28()
{
    foreach ( var_c57d12d45b1e4707 in level.var_bec6e63e32140b38 )
    {
        level thread zm_sat_locust_util::end_holdout_event( var_c57d12d45b1e4707 );
    }
    
    level.var_bec6e63e32140b38 = [];
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x413ce51d, Offset: 0x12625
// Size: 0x2
function function_d346cae134470c46()
{
    
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xcf3e74d0, Offset: 0x1262f
// Size: 0xa7
function private function_41e1c6b415e22382( crouching )
{
    level endon( #"game_ended" );
    level endon( #"battery_delivered" );
    level endon( #"mq_rp_step_06_b" );
    self endon( #"death_or_disconnect" );
    self endon( #"power_source_dropped" );
    
    while ( true )
    {
        utility::waittill_any_return( "playing_game_over_scene", "drop_canister_check" );
        
        if ( !isalive( self ) )
        {
            break;
        }
        
        if ( self isonascender() || !self isonground() || self isonladder() || self isjumping() || self ishighjumping() )
        {
            continue;
        }
        
        break;
    }
    
    drop_power_source();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0xc
// Checksum 0x6dc85d59, Offset: 0x126de
// Size: 0x6c
function private function_d4eaa984649d5e80( is_charged )
{
    self notify( #"hash_2d7b6e1bbe2e7cf2" );
    self endon( #"hash_2d7b6e1bbe2e7cf2" );
    level endon( #"game_ended" );
    level endon( #"battery_delivered" );
    level endon( #"mq_rp_step_06_b" );
    self endon( #"power_source_dropped" );
    utility::waittill_any( "death_or_disconnect", "last_stand_enter" );
    drop_power_source();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0xc
// Checksum 0x8f6efe07, Offset: 0x12752
// Size: 0xe0
function private function_29547d84c15e6771( is_charged )
{
    self notify( #"hash_5c9d0fd9e07b42c6" );
    self endon( #"hash_5c9d0fd9e07b42c6" );
    self endon( #"death_or_disconnect" );
    self endon( #"power_source_dropped" );
    level endon( #"game_ended" );
    level endon( #"battery_delivered" );
    level endon( #"mq_rp_step_06_b" );
    
    while ( true )
    {
        wait level.power_quest.var_227ff7a81d6823c;
        self earthquakeforplayer( 0.2, 0.5, self.origin, 100 );
        
        if ( self.health <= 25 )
        {
            drop_power_source();
            return;
        }
        
        self dodamage( level.power_quest.var_f4bfa6e5700e9251, self.origin, self, undefined, undefined, level.weaponnone, undefined, undefined, 2 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x12fa5920, Offset: 0x1283a
// Size: 0x1a9
function drop_power_source()
{
    origin = ( self.origin ?? self.savedsegmentposition ) + ( 0, 0, 10 );
    is_charged = self.var_541ad04764e273e5.type == "zmloot_sat_locust_quest_jerry_charged";
    item_type = is_charged ? %"zmloot_sat_locust_quest_jerry_charged" : %"zmloot_sat_locust_quest_jerry";
    params = { #spawntype:#"hash_c604389cbd8cab64", #fromangles:undefined, #fromorigin:origin, #asset:item_type };
    item = zm_sat_locust_util::spawn_quest_item( params );
    item setscriptablepartstate( #"objective", #"enabled" );
    quest_ref = is_charged ? #"hash_8c446a7ac3c0792a" : #"power_source_pickup";
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( quest_ref ) )
    {
        zm_sat_locust_util::function_222215ce3aef9da1( quest_ref, item );
    }
    else
    {
        zm_sat_locust_util::function_295a36ef38f5acae( quest_ref, item );
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        if ( !utility::flag( "mq_rp_step_04_b" ) && utility::flag( "mq_rp_step_04_a" ) )
        {
            utility::flag_clear( "mq_rp_step_04_a" );
        }
        else if ( !utility::flag( "mq_rp_step_06_b" ) && utility::flag( "mq_rp_step_06_a" ) )
        {
            utility::flag_clear( "mq_rp_step_06_a" );
        }
        
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    function_17ac1c25a68d440b( is_charged );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xfd5cdc61, Offset: 0x129eb
// Size: 0x8c
function private function_17ac1c25a68d440b( is_charged )
{
    if ( self.var_d7fbedfc8f873323 )
    {
        self.var_d7fbedfc8f873323 delete();
    }
    
    if ( self.var_541ad04764e273e5 )
    {
        self.var_541ad04764e273e5 freescriptable();
    }
    
    power_source = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
    
    if ( power_source && isplayer( self ) )
    {
        power_source disablescriptableplayeruse( self );
    }
    
    if ( isalive( self ) )
    {
        function_fd496e480785b95f();
        self notify( #"power_source_dropped" );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0xccb009dc, Offset: 0x12a7f
// Size: 0x8b
function private function_fd496e480785b95f( is_charged = 0 )
{
    idx = is_charged ? 12 : 11;
    self setclientomnvar( "ui_hud_carried_item_index", idx );
    self setclientomnvar( "ui_hud_carried_item_count", 0 );
    self notifyonplayercommandremove( "drop_canister_check", "+stance" );
    self notifyonplayercommandremove( "drop_canister_check", "+prone" );
    self notifyonplayercommandremove( "drop_canister_check", "+movedown" );
    val::reset_all( "holding_power_source" );
    self.var_55d09c5e6dd5f1e2 = 0;
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x12888320, Offset: 0x12b12
// Size: 0x57
function private function_7d6d633ab952c4d7( skipped, save_restored )
{
    if ( skipped || save_restored )
    {
        return;
    }
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread zm_quest::nuke_zombies( 1 );
        level thread zm_round_spawning::pause_round_spawning( 1, "main_quest_pause_spawning" );
    }
    
    level thread function_c8ec93a21f70310f();
    utility::flag_wait( "mq_rp_step_07" );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x136d8025, Offset: 0x12b71
// Size: 0x187
function private function_60062548e78b7d3c( skipped, save_restored )
{
    profilestart();
    
    if ( skipped || save_restored )
    {
        utility::flag_set( "mq_rp_step_07" );
    }
    
    head = zm_sat_locust_util::get_quest_reference( #"pops_head" );
    
    if ( head.rotated )
    {
        head thread function_e5c42715c341163e( 1 );
    }
    
    zm_sat_locust_util::function_a70056d3a99eace5( #"hash_59d80432a1a3fdb9" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"tractor_beam" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"hash_5022ddc41c96cfc3" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_start" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_end" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"hash_5e5df2681a5150ee" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        utility::flag_set( #"hash_f86db8d0731c8833" );
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        level thread zm_round_spawning::pause_round_spawning( 0, "main_quest_pause_spawning" );
    }
    
    utility::flag_set( "mq_rp_core" );
    level thread zm_sat_locust_util::terminal_set_state( #"hash_1cf6abe19aa81d01" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
    }
    
    level callback::remove( #"hash_462433e659e82d48", &function_1c0355b78505bafc );
    utility::flag_clear( "safe_area_disabled" );
    utility::flag_clear( "start_robot_power" );
    level callback::remove( #"hash_525068440908e3dc", &function_edd2d96ac8f88b88 );
    profilestop();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x5df5747f, Offset: 0x12d00
// Size: 0x1d3
function private function_3925ba161b714563()
{
    head = getent( "robot_head", #targetname );
    head_lm_clip = getent( "robot_head_lm_clip", #targetname );
    head.visor = getent( "robot_visor", #targetname );
    head.visor.frame = getent( "robot_visor_frame", #targetname );
    head.visor.frame linkto( head );
    
    if ( isdefined( head_lm_clip ) )
    {
        head_lm_clip linkto( head );
    }
    
    head.starting_origin = head.origin;
    head.starting_angles = head.angles;
    head.move_to_origin = head.origin + ( -28, 24, 0 );
    head.move_to_angles = head.angles + ( 0, -58.5, 0 );
    head.visor.starting_origin = head.visor.origin;
    head.visor.starting_angles = head.visor.angles;
    head.visor.move_to_origin = head.visor.origin + ( 0, 0, -84 );
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_head", head );
    function_f194716904f0e1ea();
    function_c5cf5110c4824d3c();
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x9e912ecf, Offset: 0x12edb
// Size: 0x118
function private function_f194716904f0e1ea()
{
    utility::add_fx( "pops_tractor_beam", "vfx_sat_levels_zm_locust_robot_tractor_blackhole_looping" );
    pops_wrist = getent( "pops_wrist", "targetname" );
    pops_wrist.starting_origin = pops_wrist.origin;
    pops_wrist.starting_angles = pops_wrist.angles;
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_wrist", pops_wrist );
    pops_arm = getent( "pops_arm", "targetname" );
    pops_arm.starting_origin = pops_arm.origin;
    pops_arm.starting_angles = pops_arm.angles;
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_arm", pops_arm );
    pops_wrist linkto( pops_arm );
    tractor_beam_location = pops_wrist gettagorigin( "tag_fx" );
    tractor_beam = spawnscriptable( %"sat_zm_prop_seymour", tractor_beam_location, pops_wrist gettagangles( "tag_fx" ) );
    zm_sat_locust_util::function_295a36ef38f5acae( #"tractor_beam", tractor_beam );
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x69751264, Offset: 0x12ffb
// Size: 0xf3
function private function_c5cf5110c4824d3c( cache_fx = 1 )
{
    utility::add_fx( "virgil_impact", "vfx_sat_zm_locust_virgil_fight_impact_body" );
    beam_start = utility::getstruct( "mqpo_po_be_st" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_beam_start", beam_start );
    beam_end = utility::getstruct( "mqpo_po_be_en" );
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_beam_end", beam_end );
    
    if ( cache_fx )
    {
        utility::add_fx( "pops_beam", "vfx_sat_levels_zm_locust_robot_eye_beam_1" );
    }
    
    var_27ac8cdd50ce3359 = utility::getstruct( "mqpo_po_he_fx" );
    scriptable = spawnscriptable( %"sat_zm_pops_head_fx", var_27ac8cdd50ce3359.origin, var_27ac8cdd50ce3359.angles );
    
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_cb1438cc2faf190c" ) )
    {
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_cb1438cc2faf190c", scriptable );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x91bd6b9a, Offset: 0x130f6
// Size: 0x121
function private function_c8ec93a21f70310f()
{
    level endon( #"game_ended", #"mq_rp_step_07" );
    
    /#
        level endon( #"reset_vignette" );
    #/
    
    if ( level.var_6781718da4f78d1c.state != 2 )
    {
        zm_quest::function_823ee6000b6e1947( zm_round_logic::get_rb_round_number() );
    }
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"rh_lights" ) )
    {
        all_lights = zm_sat_locust_util::get_quest_reference( #"rh_lights" );
        
        foreach ( light in all_lights )
        {
            light setscriptablepartstate( light function_84ad2f70189ee7c3(), #"off" );
        }
    }
    
    function_9a49816744c87b8b();
    function_e3ad6e75ba84f9f2();
    function_95950b29f03d76b1();
    function_c7a2d48b783373e();
    
    /#
        level notify( #"hash_d8394acb035ff3c7" );
    #/
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x36f27d7c, Offset: 0x1321f
// Size: 0x3b
function private function_9a49816744c87b8b()
{
    utility::flag_set( "safe_area_disabled" );
    alive_players = utility::get_alive_players( 0 );
    utility::array_thread( alive_players, &function_c7426ff596c82056 );
    utility::flag_set( "start_robot_power" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x14e50f56, Offset: 0x13262
// Size: 0x69
function private function_c7426ff596c82056()
{
    self endon( #"disconnect" );
    zone = zone_manager::get_current_zone();
    
    if ( self.var_420915a121e1cc41 || zone.zone_name == "zone_robot_head" )
    {
        if ( utility::ent_flag( "fasttravel_done" ) )
        {
            utility::ent_flag_wait( "fasttravel_done" );
        }
        
        self notify( #"hash_544a6aa7b92eaeb5", 1 );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x85458bc9, Offset: 0x132d3
// Size: 0x272
function private function_e3ad6e75ba84f9f2()
{
    level endon( #"game_ended", #"mq_rp_step_07" );
    
    /#
        level endon( #"reset_vignette" );
    #/
    
    pops_wrist = zm_sat_locust_util::get_quest_reference( #"pops_wrist" );
    pops_arm = zm_sat_locust_util::get_quest_reference( #"pops_arm" );
    var_4f4b64594f55ca94 = zm_sat_locust_util::get_quest_reference( #"hash_59d80432a1a3fdb9" );
    powersource_tag_origin = utility::spawn_model( "tag_origin", var_4f4b64594f55ca94.origin, var_4f4b64594f55ca94.angles );
    zm_sat_locust_util::function_295a36ef38f5acae( #"hash_5e5df2681a5150ee", powersource_tag_origin );
    var_4f4b64594f55ca94 utility::scriptable_setparententity( powersource_tag_origin );
    pops_arm rotateto( ( 48.3309, 342.009, -51.3428 ), 10, 1, 5.5 );
    earthquake( 0.25, 1.25, pops_arm.origin, 5000 );
    pops_arm setscriptablepartstate( #"hash_6673373e4137e6b3", #"move" );
    wait 10;
    pops_arm setscriptablepartstate( #"hash_6673373e4137e6b3", #"move_stop" );
    pops_wrist unlink();
    pops_wrist rotateroll( 5000, 15, 7.5, 3 );
    earthquake( 0.25, 1.25, pops_arm.origin, 5000 );
    pops_wrist setscriptablepartstate( #"hash_18f57fec496fa7ae", #"spin" );
    wait 1.5;
    powersource_tag_origin moveto( pops_wrist gettagorigin( "tag_fx" ), 10, 2.5 );
    powersource_tag_origin rotateby( ( randomintrange( 180, 720 ), randomintrange( 180, 720 ), randomintrange( 180, 720 ) ), 10 );
    tractor_beam = zm_sat_locust_util::get_quest_reference( #"tractor_beam" );
    tractor_beam.origin = pops_wrist gettagorigin( "tag_fx" ) - ( 0, 0, 50 );
    tractor_beam setscriptablepartstate( #"fx", #"tractor_beam" );
    level thread function_ee51e73623a3aa13();
    wait 10;
    tractor_beam setscriptablepartstate( #"fx", #"tractor_beam_stop" );
    var_4f4b64594f55ca94 setscriptablepartstate( #"body", #"disabled" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"hash_5e5df2681a5150ee" );
    level thread function_503b251c1cc7e118( pops_wrist, pops_arm );
}

// Namespace namespace_7acb35c452673b3
// Params 2, eflags: 0x4
// Checksum 0x168e5b55, Offset: 0x1354d
// Size: 0xb9
function private function_503b251c1cc7e118( pops_wrist, pops_arm )
{
    pops_wrist waittill( #"rotatedone" );
    pops_wrist setscriptablepartstate( #"hash_18f57fec496fa7ae", #"spin_stop" );
    pops_wrist linkto( pops_arm, "tag_origin" );
    pops_arm rotateto( pops_arm.starting_angles, 20, 10, 6 );
    earthquake( 0.25, 1.25, pops_arm.origin, 5000 );
    pops_arm setscriptablepartstate( #"hash_6673373e4137e6b3", #"move" );
    wait 20;
    pops_arm setscriptablepartstate( #"hash_6673373e4137e6b3", #"move_stop" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x978ee6ae, Offset: 0x1360e
// Size: 0x1c7
function private function_95950b29f03d76b1()
{
    level endon( #"game_ended", #"mq_rp_step_07" );
    
    /#
        level endon( #"reset_vignette" );
    #/
    
    function_9a49816744c87b8b();
    head = zm_sat_locust_util::get_quest_reference( #"pops_head" );
    beam_start = utility::spawn_model( %"sat_zm_pops_beam_start", head.visor.origin - ( 0, 0, 64 ) + anglestoright( head.visor.angles ) * 200, head.visor.angles );
    zm_sat_locust_util::function_295a36ef38f5acae( #"beam_start", beam_start );
    beam_start linkto( head );
    head.visor moveto( head.visor.move_to_origin, 4 );
    head.visor setscriptablepartstate( head.visor function_84ad2f70189ee7c3(), #"move" );
    head.visor waittill( #"movedone" );
    head.visor setscriptablepartstate( head.visor function_84ad2f70189ee7c3(), #"move_stop" );
    
    if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_cb1438cc2faf190c" ) )
    {
        scriptable = zm_sat_locust_util::get_quest_reference( #"hash_cb1438cc2faf190c" );
        scriptable setscriptablepartstate( #"sat_zm_pops_head_fx", #"close" );
    }
    
    activateworldevent( "we_sat_zm_visor" );
    head.visor linkto( head );
    head function_e5c42715c341163e();
}

// Namespace namespace_7acb35c452673b3
// Params 1, eflags: 0x4
// Checksum 0x6eccf4ca, Offset: 0x137dd
// Size: 0x1b7
function private function_e5c42715c341163e( reversed = 0 )
{
    self setscriptablepartstate( #"effects", #"rotate" );
    
    if ( !reversed )
    {
        self moveto( self.move_to_origin, 3, 3 );
        wait 0.5;
        self rotateto( self.move_to_angles, 3, 1.5, 1.5 );
        self waittill( #"rotatedone" );
        self.rotated = 1;
    }
    else
    {
        self moveto( self.starting_origin, 6, 6 );
        wait 0.5;
        self rotateto( self.starting_angles, 6, 3, 3 );
        self waittill( #"rotatedone" );
        self.rotated = 0;
        
        if ( level.robot_head_powerups.powerup_ready && zm_sat_locust_util::function_3112dc4740eb8499( #"rh_lights" ) )
        {
            all_lights = zm_sat_locust_util::get_quest_reference( #"rh_lights" );
            
            foreach ( light in all_lights )
            {
                light setscriptablepartstate( light function_84ad2f70189ee7c3(), #"on" );
            }
        }
    }
    
    self setscriptablepartstate( #"effects", #"rotate_stop" );
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0xa83b02b3, Offset: 0x1399c
// Size: 0x99
function private function_ee51e73623a3aa13()
{
    function_ad915db840c90fb3( 1023, 2, 10 );
    wait 5.6;
    scene_struct = utility::getstruct( "virgil_power_react_scene" );
    scene_struct thread scene::play();
    function_ad915db840c90fb3( 1023, 1, 10 );
    wait 0.1;
    [ shadowsmith ] = scene_struct scene::get_entities();
    
    if ( isdefined( shadowsmith ) )
    {
        shadowsmith.is_immune = 1;
        shadowsmith thread dialogue::say_self( "dx_zm_lomn_2rrl_sslo_ml3drar2" );
        zm_sat_locust_util::function_295a36ef38f5acae( #"virgil_power", shadowsmith );
    }
}

// Namespace namespace_7acb35c452673b3
// Params 0, eflags: 0x4
// Checksum 0x85af168, Offset: 0x13a3d
// Size: 0x256
function private function_c7a2d48b783373e()
{
    level endon( #"game_ended", #"mq_rp_step_07" );
    
    /#
        level endon( #"reset_vignette" );
    #/
    
    if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"virgil_power" ) )
    {
        return;
    }
    
    head = zm_sat_locust_util::get_quest_reference( #"pops_head" );
    shadowsmith = zm_sat_locust_util::get_quest_reference( #"virgil_power" );
    beam_start = zm_sat_locust_util::get_quest_reference( #"beam_start" );
    beam_start forcenetfieldhighlod( 1 );
    zm_sat_locust_util::function_222215ce3aef9da1( #"pops_beam_start", beam_start );
    beam_end_org = shadowsmith gettagorigin( "tag_r_chest" ) + anglestoforward( shadowsmith.angles ) * 800;
    beam_end_angles = shadowsmith gettagangles( "tag_r_chest" );
    beam_end = utility::spawn_model( %"sat_zm_pops_beam_end", beam_end_org, beam_end_angles );
    beam_end linkto( shadowsmith, "tag_r_chest" );
    beam_end forcenetfieldhighlod( 1 );
    zm_sat_locust_util::function_222215ce3aef9da1( #"pops_beam_end", beam_end );
    beam_start setscriptablepartstate( #"sat_zm_pops_beam_start", #"start" );
    wait 2;
    beam_start setscriptablepartstate( #"sat_zm_pops_beam_start", #"beam" );
    beam = playfxontagsbetweenclients( utility::getfx( "pops_beam" ), beam_start, "tag_origin", beam_end, "tag_origin" );
    beam forcenetfieldhighlod( 1 );
    zm_sat_locust_util::function_295a36ef38f5acae( #"pops_beam", beam );
    beam_end setscriptablepartstate( #"sat_zm_pops_beam_end", #"start" );
    wait 1.5;
    earthquake( 0.5, 0.85, shadowsmith.origin, 10000 );
    playfx( utility::getfx( "virgil_impact" ), beam_end_org );
    wait 1.5;
    function_ad915db840c90fb3( 1023, 2, 15 );
    zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_start" );
    zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_end" );
    wait 15;
    
    if ( !level.var_4159545922f4388a )
    {
        function_ad915db840c90fb3( 1023, 1, 15 );
    }
    
    utility::flag_set( "mq_rp_step_07" );
}

// Namespace namespace_7acb35c452673b3
// Params 0
// Checksum 0x5a883f0b, Offset: 0x13c9b
// Size: 0x2
function __debug()
{
    
}

/#

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x630bea83, Offset: 0x13ca5
    // Size: 0x5fc, Type: dev
    function private debug_init()
    {
        setdvarifuninitialized( @"hash_7033f7032201c86e", 0, 0, 100 );
        setdvarifuninitialized( @"hash_3e5d6926b9b7aa1b", 18, 18, 30 );
        zm_quest::function_bc99f123a684344f( #"hash_7b26a8bb39d7312" );
        devgui::add_devgui_func( "<dev string:x1ed>", "<dev string:x205>", &function_21988422556ff49 );
        devgui::add_devgui_func( "<dev string:x217>", "<dev string:x225>", &debug_open_workshop );
        devgui::add_devgui_func( "<dev string:x23c>", "<dev string:x24b>", &function_96d93644d77ecd22 );
        devgui::add_devgui_func( "<dev string:x263>", "<dev string:x27a>", &function_788c86f804dff54c );
        devgui::add_devgui_func( "<dev string:x291>", "<dev string:x2a6>", &function_91e4f5aa6dc3a06b );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"hash_b3d121d0de8f3ce" );
        devgui::add_devgui_func( "<dev string:x2bb>", "<dev string:x2cc>", &function_d46cdc1c972749fc );
        devgui::add_devgui_func( "<dev string:x2e6>", "<dev string:x2f9>", &function_bf73c635dbf71a76 );
        devgui::add_devgui_func( "<dev string:x30e>", "<dev string:x327>", &function_155ca5d49901eddf );
        devgui::add_devgui_func( "<dev string:x343>", "<dev string:x364>", &function_ab748ee65122c129 );
        devgui::add_devgui_func( "<dev string:x388>", "<dev string:x39c>", &function_f7e66a3c9c6ad057 );
        devgui::add_devgui_func( "<dev string:x3b9>", "<dev string:x3ca>", &function_9cbc3cbb1e8b12af );
        devgui::add_devgui_func( "<dev string:x3e3>", "<dev string:x409>", &function_c2f7141c084938b6 );
        devgui::add_devgui_func( "<dev string:x422>", "<dev string:x444>", &function_ad848b7951768af2 );
        devgui::add_devgui_func( "<dev string:x461>", "<dev string:x47e>", &function_4eba458f2803882e );
        devgui::function_cd4e263c1f3018ae( "<dev string:x496>", "<dev string:x4b6>", &function_7ffcca828e68683c );
        devgui::function_cd4e263c1f3018ae( "<dev string:x4d3>", "<dev string:x4f3>", &function_7ffcca828e68683c );
        devgui::function_cd4e263c1f3018ae( "<dev string:x511>", "<dev string:x533>", &function_7ffcca828e68683c );
        devgui::function_cd4e263c1f3018ae( "<dev string:x550>", "<dev string:x57b>", &function_1ee8285b09fbc986 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x599>", "<dev string:x5bd>", &function_1ee8285b09fbc986 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x5db>", "<dev string:x5f8>", &function_41745c85d3d2a5d8 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x614>", "<dev string:x632>", &function_41745c85d3d2a5d8 );
        devgui::add_devgui_func( "<dev string:x64e>", "<dev string:x66d>", &function_1194ad6ca0c54d0f );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"hash_b3d131d0de8f581" );
        devgui::add_devgui_func( "<dev string:x68e>", "<dev string:x698>", &function_1d7b95662c80a157 );
        devgui::add_devgui_func( "<dev string:x6ab>", "<dev string:x6b4>", &function_c0ca53413779f1ce );
        devgui::add_devgui_func( "<dev string:x6c6>", "<dev string:x6d8>", &function_b8c990f327c6d506 );
        devgui::add_devgui_func( "<dev string:x6eb>", "<dev string:x6fe>", &function_f166bef3cef6bcac );
        devgui::function_cd4e263c1f3018ae( "<dev string:x712>", "<dev string:x727>", &function_190db8adfb451183 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x73d>", "<dev string:x750>", &function_190db8adfb451183 );
        devgui::add_devgui_func( "<dev string:x764>", "<dev string:x771>", &function_c38fa7eee8880da6 );
        devgui::add_devgui_func( "<dev string:x787>", "<dev string:x796>", &function_85a80d44c4570ba3 );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"rod_puzzle" );
        devgui::add_devgui_func( "<dev string:x7a9>", "<dev string:x7bc>", &function_108c8ea1ca49ba2a );
        devgui::add_devgui_func( "<dev string:x7d8>", "<dev string:x7ee>", &function_f1c5fde3e80edd5c );
        devgui::add_devgui_func( "<dev string:x80d>", "<dev string:x818>", &function_b8f85b6986180876 );
        devgui::add_devgui_func( "<dev string:x82c>", "<dev string:x847>", &function_4a211b052f54d12b );
        devgui::add_devgui_func( "<dev string:x85e>", "<dev string:x87e>", &function_6296f70ca834a198 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x896>", "<dev string:x8b5>" + "<dev string:x8cb>", &function_77344c8839c2236e );
        devgui::function_cd4e263c1f3018ae( "<dev string:x8e8>", "<dev string:x8b5>" + "<dev string:x909>", &function_77344c8839c2236e );
        devgui::function_cd4e263c1f3018ae( "<dev string:x928>", "<dev string:x8b5>" + "<dev string:x949>", &function_77344c8839c2236e );
        devgui::function_cd4e263c1f3018ae( "<dev string:x968>", "<dev string:x8b5>" + "<dev string:x98a>", &function_77344c8839c2236e );
        devgui::function_cd4e263c1f3018ae( "<dev string:x9aa>", "<dev string:x8b5>" + "<dev string:x9d1>", &function_77344c8839c2236e );
        devgui::add_devgui_func( "<dev string:x9f2>", "<dev string:xa11>", &function_1b1065c16ac84788 );
        devgui::add_devgui_func( "<dev string:xa2a>", "<dev string:xa39>", &function_5541678fb80fa98b );
        devgui::add_devgui_func( "<dev string:xa4e>", "<dev string:xa66>", &function_e385a3e87da79847 );
        devgui::add_devgui_dvar( "<dev string:xa85>", "<dev string:xa90>" );
        devgui::add_devgui_dvar( "<dev string:xaa7>", "<dev string:xab8>" );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"defend_power_source" );
        devgui::add_devgui_func( "<dev string:xad5>", "<dev string:xaec>", &function_1128542591dc3841 );
        devgui::add_devgui_func( "<dev string:xb02>", "<dev string:xb19>", &function_24ffe92e975b8952 );
        devgui::add_devgui_func( "<dev string:xb2f>", "<dev string:xb41>", &function_503ed5e0c39168b1 );
        devgui::add_devgui_func( "<dev string:xb5c>", "<dev string:xb6d>", &function_4142013065dc36f4 );
        devgui::add_devgui_func( "<dev string:xb87>", "<dev string:xb93>", &function_3f0ae097b60e004a );
        devgui::function_cd4e263c1f3018ae( "<dev string:xba8>", "<dev string:xbc0>", &function_51d2e44d434f31a0 );
        devgui::function_cd4e263c1f3018ae( "<dev string:xbd7>", "<dev string:xbec>", &function_51d2e44d434f31a0 );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"hash_24e1dca01905cb12" );
        devgui::add_devgui_func( "<dev string:xc03>", "<dev string:xc16>", &function_fc37664e35a5edd4 );
        zm_quest::function_c1400a2f4670c23f();
        zm_quest::function_1b5b11caffa04d9a( #"hash_7b26a8bb39d7312", #"laser_shadowsmith" );
        devgui::add_devgui_func( "<dev string:xc32>", "<dev string:xc40>", &debug_vignette );
        devgui::add_devgui_func( "<dev string:xc52>", "<dev string:xc5e>", &function_92d3b97ce0326794 );
        devgui::add_devgui_func( "<dev string:xc73>", "<dev string:xc80>", &debug_tractor_beam );
        devgui::add_devgui_func( "<dev string:xc96>", "<dev string:xca1>", &function_954e53f283a692ee );
        zm_quest::function_c1400a2f4670c23f();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xaf7b4ff6, Offset: 0x142a9
    // Size: 0x18c, Type: dev
    function private function_21988422556ff49()
    {
        zm_utility::open_sesame();
        var_3fb6e6959465a40a = [ #"locust_quest_pap", #"hash_709d77ab2b2005c5", #"hash_d1612ed5d50da819" ];
        
        foreach ( quest in var_3fb6e6959465a40a )
        {
            if ( !zm_quest::is_quest_complete( quest ) )
            {
                zm_quest = zm_quest::get_quest( quest );
                
                foreach ( step in zm_quest.steps )
                {
                    zm_quest::complete_step( step );
                }
            }
        }
        
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            var_b1a14dcb967831f6 = zm_quest::get_quest_step( #"hash_7b26a8bb39d7312", #"hash_b3d111d0de8f21b" );
            zm_quest::complete_step( var_b1a14dcb967831f6 );
            level thread utility::callsharedfunc( #"locust_dm", #"update_guidance" );
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x5959d966, Offset: 0x1443d
    // Size: 0x93, Type: dev
    function private debug_open_workshop()
    {
        if ( level.workshop.var_dc0780f0afb99f02 == 1 )
        {
            zm_quest::function_4eefe6de31f5ddab( #"hash_7b26a8bb39d7312", #"workshop_open", 1 );
            zone_manager::set_zone_enabled( "<dev string:xcb5>", 1 );
            claw_machine_activate();
            utility::flag_set( "<dev string:xcd4>" );
            function_8183f0813f98518();
        }
        
        if ( level.workshop.door_is_open == 0 )
        {
            level.workshop.door workshop_door_move();
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x709c7719, Offset: 0x144d8
    // Size: 0x58, Type: dev
    function private function_96d93644d77ecd22()
    {
        if ( level.workshop.var_dc0780f0afb99f02 == 0 )
        {
            function_8988a032e94395d4();
        }
        
        if ( level.workshop.door_is_open == 1 )
        {
            level.workshop.door workshop_door_move( 0 );
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xc0a96f74, Offset: 0x14538
    // Size: 0x2f, Type: dev
    function private function_788c86f804dff54c()
    {
        if ( level.workshop.var_dc0780f0afb99f02 == 1 )
        {
            function_8183f0813f98518();
            return;
        }
        
        function_8988a032e94395d4();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xc0a0d723, Offset: 0x1456f
    // Size: 0x33, Type: dev
    function private function_91e4f5aa6dc3a06b()
    {
        level.workshop.door workshop_door_move( !level.workshop.door_is_open );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0
    // Checksum 0xff3e80f1, Offset: 0x145aa
    // Size: 0x1b6, Type: dev
    function function_6296f70ca834a198()
    {
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        var_a105bd02057ca8ec = undefined;
        
        foreach ( slot in extra_grid.all_slots )
        {
            if ( !slot.rod_model )
            {
                var_a105bd02057ca8ec = slot;
                break;
            }
        }
        
        if ( !var_a105bd02057ca8ec )
        {
            iprintlnbold( "<dev string:xce2>" );
            return;
        }
        
        uranium_slots = arrayrandomize( level.power_quest.claw_machine.var_d7090ddafafb33c2 );
        uranium_slot = utility::array_random( uranium_slots );
        var_a105bd02057ca8ec.rod_model = uranium_slot.rod_model;
        var_a105bd02057ca8ec.rod_model.origin = var_a105bd02057ca8ec.origin + ( 0, 0, 1 );
        uranium_slot.rod_model = undefined;
        level.power_quest.claw_machine.var_c680c886cc22b5c2--;
        level.power_quest.claw_machine.var_d7090ddafafb33c2 = arrayremove( level.power_quest.claw_machine.var_d7090ddafafb33c2, uranium_slot );
        function_86ad03dce76c8f74();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0
    // Checksum 0x61dbf837, Offset: 0x14768
    // Size: 0x279, Type: dev
    function function_4a211b052f54d12b()
    {
        grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        uranium_slot = undefined;
        
        foreach ( slot in extra_grid.all_slots )
        {
            if ( slot.rod_model && slot.rod_model.uranium )
            {
                uranium_slot = slot;
                break;
            }
        }
        
        if ( !uranium_slot )
        {
            iprintlnbold( "<dev string:xd0c>" );
            return;
        }
        
        grid_slots = arrayrandomize( grid.all_slots );
        
        foreach ( slot in grid_slots )
        {
            if ( !slot.rod_model )
            {
                new_slot = slot;
                break;
            }
        }
        
        new_slot.rod_model = uranium_slot.rod_model;
        new_slot.rod_model.origin = new_slot.var_61d8a47043c4a79f.origin;
        uranium_slot.rod_model = undefined;
        level.power_quest.claw_machine.var_c680c886cc22b5c2++;
        
        if ( !isdefined( level.power_quest.claw_machine.var_d7090ddafafb33c2 ) )
        {
            level.power_quest.claw_machine.var_d7090ddafafb33c2 = [];
        }
        
        level.power_quest.claw_machine.var_d7090ddafafb33c2[ level.power_quest.claw_machine.var_d7090ddafafb33c2.size ] = new_slot;
        function_c675dbd0b1c5a363();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0
    // Checksum 0xb4a669d, Offset: 0x149e9
    // Size: 0x2cd, Type: dev
    function function_b8f85b6986180876()
    {
        function_876a84e86318f160();
        grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
        extra_grid = zm_sat_locust_util::get_quest_reference( #"hash_7ecfedc2a3d24b60" );
        claw = zm_sat_locust_util::get_quest_reference( #"power_source_claw" );
        
        foreach ( slot in grid.all_slots )
        {
            if ( slot.rod_model )
            {
                if ( isent( slot.rod_model ) )
                {
                    slot.rod_model delete();
                    continue;
                }
                
                slot.rod_model freescriptable();
            }
        }
        
        foreach ( slot in extra_grid.all_slots )
        {
            if ( slot.rod_model )
            {
                if ( isent( slot.rod_model ) )
                {
                    slot.rod_model delete();
                    continue;
                }
                
                slot.rod_model freescriptable();
            }
        }
        
        camera_slot = claw.current_slot;
        level.power_quest.claw_machine.var_d7090ddafafb33c2 = [];
        level.power_quest.claw_machine.rod_groups = [];
        grid = undefined;
        zm_sat_locust_util::function_7bf944a5a2b76f39( #"power_source_craft_interact" );
        zm_sat_locust_util::function_7bf944a5a2b76f39( #"power_source_grid" );
        zm_sat_locust_util::function_7bf944a5a2b76f39( #"hash_7ecfedc2a3d24b60" );
        zm_sat_locust_util::function_7bf944a5a2b76f39( #"hash_ad506315f4b635f0" );
        level.power_quest.collected_uranium = 3;
        function_9e2e68fbafa18958();
        claw_machine_activate();
        function_cbf00b4902a27c8b();
        claw.current_row = camera_slot.row;
        claw.current_column = camera_slot.column;
        claw.current_slot = camera_slot;
        zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ad506315f4b635f0", level.player );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0
    // Checksum 0x3633c3bc, Offset: 0x14cbe
    // Size: 0x62, Type: dev
    function function_108c8ea1ca49ba2a()
    {
        if ( level.power_quest.var_a7b2f674cdb85cb1 )
        {
            level.power_quest.var_a7b2f674cdb85cb1 = 0;
            zm_sat_locust_util::get_quest_reference( #"power_source_craft_interact" ) zm_sat_locust_util::limited_interact_exited( level.player );
            return;
        }
        
        level.player thread function_8f5a48f6b3ecb5fe();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0
    // Checksum 0x9513ac0b, Offset: 0x14d28
    // Size: 0x24a, Type: dev
    function function_f1c5fde3e80edd5c()
    {
        if ( level.power_quest.var_c8bf3d6e193e19cd )
        {
            level.power_quest.var_c8bf3d6e193e19cd = 0;
            level notify( #"hash_e19020fa9c92299b" );
            return;
        }
        
        level.power_quest.var_c8bf3d6e193e19cd = 1;
        grid = zm_sat_locust_util::get_quest_reference( #"power_source_grid" );
        
        foreach ( slot in grid.all_slots )
        {
            switch ( slot.row )
            {
                case 0:
                    row_color = ( 0, 1, 0 );
                    break;
                case 1:
                    row_color = ( 0, 0, 1 );
                    break;
                case 2:
                    row_color = ( 1, 0, 0 );
                    break;
                case 3:
                    row_color = ( 1, 1, 0 );
                    break;
                default:
                    break;
            }
            
            switch ( slot.column )
            {
                case 0:
                    column_color = ( 0, 1, 0 );
                    break;
                case 1:
                    column_color = ( 0, 0, 1 );
                    break;
                case 2:
                    column_color = ( 1, 0, 0 );
                    break;
                case 3:
                    column_color = ( 1, 1, 0 );
                    break;
                default:
                    break;
            }
            
            debug::sphere( slot, 2, row_color, undefined, "<dev string:xd2b>" );
            debug::sphere( slot, 1, column_color, undefined, "<dev string:xd2b>" );
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x564a6b4f, Offset: 0x14f7a
    // Size: 0xc, Type: dev
    function private function_d46cdc1c972749fc()
    {
        zm_sat_locust_fergus::function_8f1d8bfc8b242861();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xbb11dcb3, Offset: 0x14f8e
    // Size: 0xc, Type: dev
    function private function_bf73c635dbf71a76()
    {
        zm_sat_locust_fergus::function_62a43eab3b05faa();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x261ee477, Offset: 0x14fa2
    // Size: 0x33, Type: dev
    function private function_155ca5d49901eddf()
    {
        fishing_chance = 100;
        function_5826c8ca68de9fc1();
        level callback::remove( "<dev string:xd4b>", &on_round_start_callback );
        function_ab748ee65122c129();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x6a631486, Offset: 0x14fdd
    // Size: 0xc, Type: dev
    function private function_ab748ee65122c129()
    {
        zm_sat_locust_fergus::function_8c72e25539f3fa32();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x49cdf25a, Offset: 0x14ff1
    // Size: 0xb1, Type: dev
    function private function_f7e66a3c9c6ad057()
    {
        if ( level.power_quest.var_209956487aa684ca )
        {
            level.power_quest.var_209956487aa684ca = 0;
            level notify( #"hash_a1820593adc9693c" );
            return;
        }
        
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            iprintlnbold( "<dev string:xd5a>" );
            return;
        }
        
        level.power_quest.var_209956487aa684ca = 1;
        Ravager = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        debug::sphere( Ravager, 15, ( 1, 0.75, 0.75 ), undefined, "<dev string:xd6e>", "<dev string:x198>" );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x7d49be25, Offset: 0x150aa
    // Size: 0x15, Type: dev
    function private function_9cbc3cbb1e8b12af()
    {
        zm_round_logic::function_68bdb49c82c0f892( zm_round_logic::get_rb_round_number() + 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xca2188b3, Offset: 0x150c7
    // Size: 0x62, Type: dev
    function private function_c2f7141c084938b6()
    {
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            iprintlnbold( "<dev string:xd85>" );
            return;
        }
        
        level.power_quest.var_9ce2644b06c95783 = level.player.origin;
        level callback::add( "<dev string:xd4b>", &function_adf516e431678f71 );
        function_9cbc3cbb1e8b12af();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x7f754c05, Offset: 0x15131
    // Size: 0xd5, Type: dev
    function private function_ad848b7951768af2()
    {
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            iprintlnbold( "<dev string:xd9b>" );
            return;
        }
        
        Ravager = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        nav_origin = getclosestpointonnavmesh( Ravager.origin );
        var_f9415643806be034 = ( nav_origin[ 0 ], nav_origin[ 1 ], Ravager.origin[ 2 ] );
        angles = vectortoangles( Ravager.origin - var_f9415643806be034 );
        origin = nav_origin + vectornormalize( var_f9415643806be034 - Ravager.origin ) * 50;
        level.player setorigin( origin );
        level.player setplayerangles( angles );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xae745550, Offset: 0x1520e
    // Size: 0x6a, Type: dev
    function private function_4eba458f2803882e()
    {
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            iprintlnbold( "<dev string:xdb5>" );
            return;
        }
        
        Ravager = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        Ravager dodamage( Ravager.maxhealth / 2 * 10, Ravager.origin, level.player );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0xa4408b88, Offset: 0x15280
    // Size: 0x10f, Type: dev
    function private function_7ffcca828e68683c( params )
    {
        if ( params[ 0 ] == "<dev string:xdca>" )
        {
            teleport_locs = zm_sat_locust_util::get_quest_reference( #"hash_b7b3993133f11424" );
            teleport_point = function_47c86977a18df38b( teleport_locs, level.players[ 0 ].origin );
        }
        else if ( params[ 0 ] == "<dev string:xdd0>" )
        {
            teleport_locs = zm_sat_locust_util::get_quest_reference( #"hash_776f972d98c7dd12" );
            teleport_point = function_47c86977a18df38b( teleport_locs, level.players[ 0 ].origin );
        }
        else if ( params[ 0 ] == "<dev string:xdd7>" )
        {
            teleport_point = zm_sat_locust_util::get_quest_reference( #"hash_c8e7c490c0d96ca" );
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_ddbb25d3bdb9646e" ) )
        {
            zm_sat_locust_util::function_222215ce3aef9da1( #"hash_ddbb25d3bdb9646e", teleport_point );
        }
        else
        {
            zm_sat_locust_util::function_295a36ef38f5acae( #"hash_ddbb25d3bdb9646e", teleport_point );
        }
        
        level function_bef570f816fa2a00( teleport_point.origin, teleport_point.angles );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0xdb34cf03, Offset: 0x15397
    // Size: 0x1d2, Type: dev
    function private function_1ee8285b09fbc986( params )
    {
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            iprintlnbold( "<dev string:xddd>" );
            return;
        }
        
        var_bb2f43b0bee23ec2 = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        var_3d5505341c1e0125 = [ var_bb2f43b0bee23ec2 ];
        
        if ( params[ 0 ] == "<dev string:xdfb>" )
        {
            var_3d5505341c1e0125 = arraycombineunique( level.power_quest.var_b787c20895fb4521, level.power_quest.var_438736aaa408cf2c, var_3d5505341c1e0125 );
        }
        
        var_487792fb181066ff = 1;
        
        foreach ( Ravager in var_3d5505341c1e0125 )
        {
            if ( Ravager.var_4fbc083fd15ce259 )
            {
                var_487792fb181066ff = 0;
                Ravager.var_4fbc083fd15ce259 = 0;
                Ravager function_3dcf471c072a2b06();
                continue;
            }
            
            Ravager.var_4fbc083fd15ce259 = 1;
            Ravager notify( #"hash_d9d2c5ff77b5a717" );
            
            if ( Ravager.var_54b6b35eb6a860a2 )
            {
                Ravager zombie_attractor_manager::function_dcfb4c31f1d97cd2( Ravager.var_54b6b35eb6a860a2 );
            }
            
            attractor_loc = { #angles:( randomint( 360 ), 0, 0 ), #origin:Ravager.origin };
            Ravager.var_54b6b35eb6a860a2 = Ravager zombie_attractor_manager::function_7eb1aaa8bc7cc15( attractor_loc, 4 );
        }
        
        if ( var_487792fb181066ff )
        {
            level notify( #"hash_54e157cf6ab1f177" );
            return;
        }
        
        level thread function_73b71b615cb78f00();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x2aab742e, Offset: 0x15571
    // Size: 0x2e, Type: dev
    function private function_1d7b95662c80a157()
    {
        itembundle = getscriptbundle( "<dev string:xdfd>" );
        level.player common_item::function_360e96e0447f17f9( itembundle, 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xff51f5fb, Offset: 0x155a7
    // Size: 0xc, Type: dev
    function private function_c0ca53413779f1ce()
    {
        lab_open();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xd2073c48, Offset: 0x155bb
    // Size: 0x150, Type: dev
    function private function_b8c990f327c6d506()
    {
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_2ae4cc0540a8e80b" ) )
        {
            if ( !isdefined( level.power_quest.var_b8c990f327c6d506 ) )
            {
                level.power_quest.var_b8c990f327c6d506 = 0;
            }
            
            if ( !level.power_quest.var_b8c990f327c6d506 )
            {
                level.power_quest.var_b8c990f327c6d506 = 1;
                var_87692895afac9198 = zm_sat_locust_util::get_quest_reference( #"hash_2ae4cc0540a8e80b" );
                
                foreach ( jar in var_87692895afac9198 )
                {
                    if ( jar.jar_data.is_required )
                    {
                        debug::sphere( jar, 5, ( 0, 1, 0 ), undefined, "<dev string:xe28>", "<dev string:xe3e>" );
                    }
                }
                
                return;
            }
            
            level.power_quest.var_b8c990f327c6d506 = 0;
            level notify( #"hash_4569447308c85d9" );
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xa69793db, Offset: 0x15713
    // Size: 0xe, Type: dev
    function private function_f166bef3cef6bcac()
    {
        function_ace89b93a2d40a3c( 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0x1d666661, Offset: 0x15729
    // Size: 0x22c, Type: dev
    function private function_190db8adfb451183( params )
    {
        var_f7b6fa769da6da46 = zm_sat_locust_util::get_quest_reference( #"hash_30fcdc017552a849" );
        var_f7b6fa769da6da46 setscriptablepartstate( #"usable", #"off" );
        var_f7b6fa769da6da46 setscriptablepartstate( #"fx", hashcat( #"splash_0", level.power_quest.var_3ff4b2737e042ae + 1 ) );
        
        if ( params[ 0 ] == "<dev string:xe48>" )
        {
            level.power_quest.var_3ff4b2737e042ae = 2;
            var_f7b6fa769da6da46 setscriptablepartstate( #"fx", hashcat( #"splash_0", level.power_quest.var_3ff4b2737e042ae + 1 ) );
            function_99eeed03928060ea();
            var_f7b6fa769da6da46 setscriptablepartstate( #"usable", #"off" );
            var_f7b6fa769da6da46 utility::delaycall( 1, &setscriptablepartstate, #"fx", #"acid_on" );
            var_f7b6fa769da6da46 = zm_sat_locust_util::get_quest_reference( #"hash_30fcdc017552a849" );
            wait 3;
            var_f7b6fa769da6da46 thread function_7aebff98d12c0982();
            return;
        }
        
        level.power_quest.var_3ff4b2737e042ae = 0;
        var_f7b6fa769da6da46 setscriptablepartstate( #"fx", hashcat( #"splash_0", level.power_quest.var_3ff4b2737e042ae + 1 ) );
        machine = zm_sat_locust_util::get_quest_reference( #"hash_f48d6a93accac874" );
        machine utility::delaycall( 1, &setscriptablepartstate, #"sat_zm_prop_kenton", #"usable" );
        var_f7b6fa769da6da46 utility::delaycall( 1, &setscriptablepartstate, #"fx", #"off" );
        var_bd69b7ed499b81e4 = zm_sat_locust_util::get_quest_reference( #"hash_2d3e8588dd9589cf" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"sat_zm_prop_kenneth_02", #"empty" );
        var_bd69b7ed499b81e4 setscriptablepartstate( #"fx", #"placed" );
        level.power_quest.var_afad28a32492da42 = 0;
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x10a25d81, Offset: 0x1595d
    // Size: 0x2e, Type: dev
    function private function_c38fa7eee8880da6()
    {
        itembundle = getscriptbundle( "<dev string:xe50>" );
        level.player common_item::function_360e96e0447f17f9( itembundle, 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xa5f62802, Offset: 0x15993
    // Size: 0xf, Type: dev
    function private function_85a80d44c4570ba3()
    {
        function_4cff45cfd956ece6( undefined, 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0xe6d28829, Offset: 0x159aa
    // Size: 0x22, Type: dev
    function private function_77344c8839c2236e( params )
    {
        level.player function_46bc5f651956565b( params[ 0 ] );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x95f16e2a, Offset: 0x159d4
    // Size: 0x7a, Type: dev
    function private function_1b1065c16ac84788()
    {
        machine = zm_sat_locust_util::get_quest_reference( #"power_source_craft" );
        sphere( machine.origin, level.power_quest.var_5473b89dc9e703cf, ( 1, 0, 0 ), undefined, level.frameduration * 10 );
        function_bc3b27ecda718563( level.players[ 0 ], machine.origin );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xae02ac6d, Offset: 0x15a56
    // Size: 0x143, Type: dev
    function private function_5541678fb80fa98b()
    {
        needles = zm_sat_locust_util::get_quest_reference( #"hash_9c0c22d41cd18ae2" );
        debug::sphere( needles[ 0 ], 1, ( 0, 1, 0 ) );
        debug::sphere( needles[ 1 ], 1, ( 0, 1, 0 ) );
        scale_loc = needles[ 0 ].origin + anglestoleft( needles[ 0 ].angles ) * getdvarfloat( @"hash_3e5d6926b9b7aa1b", level.power_quest.var_c41c5999c56dbffa );
        
        while ( true )
        {
            scale_loc = needles[ 0 ].origin + anglestoleft( needles[ 0 ].angles ) * getdvarfloat( @"hash_3e5d6926b9b7aa1b", level.power_quest.var_c41c5999c56dbffa );
            debug::sphere( scale_loc, 1, ( 1, 0, 0 ), level.framedurationseconds );
            function_4d4203e65260ff33( getdvarint( @"hash_7033f7032201c86e", 0 ), getdvarfloat( @"hash_3e5d6926b9b7aa1b", level.power_quest.var_c41c5999c56dbffa ) );
            wait 0.2;
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 2, eflags: 0x4
    // Checksum 0x21a70203, Offset: 0x15ba1
    // Size: 0x172, Type: dev
    function private function_4d4203e65260ff33( total_charge, scale )
    {
        if ( level.power_quest.claw_machine.var_c680c886cc22b5c2 != 3 && !level.power_quest.claw_machine.var_3d6289ad41d9cb0c )
        {
            if ( total_charge <= 72 )
            {
                total_charge *= 0.8;
            }
        }
        
        if ( level.power_quest.claw_machine.var_c680c886cc22b5c2 == 3 || level.power_quest.claw_machine.var_3d6289ad41d9cb0c )
        {
            if ( total_charge < 63 )
            {
                scale = 20.3;
            }
            else if ( total_charge > 72 )
            {
                scale = 21.8;
            }
            else
            {
                scale = 21.1;
            }
        }
        
        needle = zm_sat_locust_util::get_quest_reference( #"claw_machine_needle" );
        var_42f72604c5c35560 = clamp( scale * total_charge / 100, 0, level.power_quest.var_4b8b3a293ef5b69c );
        dir = anglestoleft( needle.angles );
        move_to_point = zm_sat_locust_util::get_quest_reference( #"hash_9c0c22d41cd18ae2" )[ 0 ].origin + dir * var_42f72604c5c35560;
        needle moveto( move_to_point, 0.1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x8a777933, Offset: 0x15d1b
    // Size: 0x7b, Type: dev
    function private function_e385a3e87da79847()
    {
        if ( level.power_quest.claw_machine.var_3d6289ad41d9cb0c )
        {
            level.power_quest.claw_machine.var_3d6289ad41d9cb0c = 0;
            iprintlnbold( "<dev string:xe73>" );
            return;
        }
        
        level.power_quest.claw_machine.var_3d6289ad41d9cb0c = 1;
        iprintlnbold( "<dev string:xe99>" );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x14c6c579, Offset: 0x15d9e
    // Size: 0xd9, Type: dev
    function private function_1128542591dc3841()
    {
        if ( zm_sat_locust_util::is_holdout_event_active( "<dev string:xebd>" ) )
        {
            iprintlnbold( "<dev string:xed1>" );
            return;
        }
        
        power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
        power_switch setscriptablepartstate( #"sat_zm_prop_sylvester", #"usable_up" );
        power_switch setscriptablepartstate( #"electrical_sparks", #"on" );
        power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"turn_on" );
        power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"hash_c9835ddae1e14f9e" );
        power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"charging" );
        level thread function_3b0df729eeb45fce();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xe98121bc, Offset: 0x15e7f
    // Size: 0x1d4, Type: dev
    function private function_24ffe92e975b8952()
    {
        if ( zm_sat_locust_util::is_holdout_event_active( "<dev string:xebd>" ) )
        {
            zm_sat_locust_util::end_holdout_event( "<dev string:xebd>" );
            level thread zm_music::function_e9fd14ede793ef0d( "<dev string:xef3>" );
            level thread function_513f4d842e502a53();
        }
        
        if ( !level.power_quest.var_cf29b30fac966d56 && zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_pickup" ) )
        {
            battery_item = zm_sat_locust_util::get_quest_reference( #"power_source_pickup" );
            battery_item freescriptable();
        }
        else if ( zm_sat_locust_util::function_3112dc4740eb8499( #"hash_8c446a7ac3c0792a" ) )
        {
            battery_item = zm_sat_locust_util::get_quest_reference( #"hash_8c446a7ac3c0792a" );
            battery_item freescriptable();
        }
        
        battery_loc = zm_sat_locust_util::get_quest_reference( #"power_source_deposit" );
        battery_loc setscriptablepartstate( #"sat_zm_prop_manfred", #"enabled" );
        battery_loc setscriptablepartstate( #"usable", #"disabled" );
        function_ae8a2b6e508d8b02();
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"generator_attractor" ) )
        {
            generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
            generator.damaged = 0;
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"power_source_electrical_box" ) )
        {
            power_switch = zm_sat_locust_util::get_quest_reference( #"power_source_electrical_box" );
            power_switch.generator_fx setscriptablepartstate( #"sat_zm_prop_talbot", #"off" );
            power_switch.wires_fx setscriptablepartstate( #"sat_zm_prop_talbot_02", #"off" );
            power_switch.exterior_fx setscriptablepartstate( #"sat_zm_prop_manfred_02", #"disabled" );
        }
        
        level notify( #"generator_repaired" );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x7fcd34a1, Offset: 0x1605b
    // Size: 0x76, Type: dev
    function private function_503ed5e0c39168b1()
    {
        if ( !zm_sat_locust_util::is_holdout_event_active( "<dev string:xebd>" ) )
        {
            iprintlnbold( "<dev string:xf03>" );
            return;
        }
        
        if ( zm_sat_locust_util::function_3112dc4740eb8499( #"generator_attractor" ) )
        {
            generator = zm_sat_locust_util::get_quest_reference( #"generator_attractor" );
            generator.attractor.source.health = 0;
            generator function_24e836053723796d();
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xca27e754, Offset: 0x160d9
    // Size: 0x3f, Type: dev
    function private function_4142013065dc36f4()
    {
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"generator_attractor" ) || !zm_sat_locust_util::get_quest_reference( #"generator_attractor" ).damaged )
        {
            return;
        }
        
        level thread function_1a5469f011e6584e();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xda60b389, Offset: 0x16120
    // Size: 0x6d, Type: dev
    function private function_3f0ae097b60e004a()
    {
        if ( !zm_sat_locust_util::is_holdout_event_active( "<dev string:xebd>" ) )
        {
            iprintlnbold( "<dev string:xf03>" );
            return;
        }
        
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"battery_attractor" ) )
        {
            return;
        }
        
        battery = zm_sat_locust_util::get_quest_reference( #"battery_attractor" );
        destroyed = battery function_60bc98133109a1b9();
        
        if ( destroyed )
        {
            level thread function_513f4d842e502a53();
        }
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0x30ebcc38, Offset: 0x16195
    // Size: 0x38, Type: dev
    function private function_51d2e44d434f31a0( params )
    {
        if ( !zm_sat_locust_util::is_holdout_event_active( "<dev string:xebd>" ) )
        {
            iprintlnbold( "<dev string:xf03>" );
            return;
        }
        
        level thread function_513f4d842e502a53( int( params[ 0 ] ) );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x6eae68dd, Offset: 0x161d5
    // Size: 0xd, Type: dev
    function private function_fc37664e35a5edd4()
    {
        level thread function_dacff324b9080812();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x582a6315, Offset: 0x161ea
    // Size: 0x19, Type: dev
    function private debug_vignette()
    {
        level notify( #"reset_vignette" );
        level thread function_98e27f0b57b487c9();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x44885642, Offset: 0x1620b
    // Size: 0x61, Type: dev
    function private function_98e27f0b57b487c9()
    {
        level endon( #"reset_vignette" );
        function_45911616b1af4ce8();
        function_a142586187d0808d();
        function_e1be373f270e855();
        level thread function_c8ec93a21f70310f();
        level waittill( #"hash_d8394acb035ff3c7" );
        head = zm_sat_locust_util::get_quest_reference( #"pops_head" );
        head function_e5c42715c341163e( 1 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x35707f38, Offset: 0x16274
    // Size: 0x20, Type: dev
    function private function_92d3b97ce0326794()
    {
        level notify( #"reset_vignette" );
        function_45911616b1af4ce8();
        level thread function_95950b29f03d76b1();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x1cfe6edc, Offset: 0x1629c
    // Size: 0xb4, Type: dev
    function private function_45911616b1af4ce8()
    {
        head = zm_sat_locust_util::get_quest_reference( #"pops_head" );
        head.origin = head.starting_origin;
        head.angles = head.starting_angles;
        head.visor unlink();
        head.visor.origin = head.visor.starting_origin;
        head.visor.angles = head.visor.starting_angles;
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x264a9b16, Offset: 0x16358
    // Size: 0x20, Type: dev
    function private debug_tractor_beam()
    {
        level notify( #"reset_vignette" );
        function_a142586187d0808d();
        level thread function_e3ad6e75ba84f9f2();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0xc26ffd95, Offset: 0x16380
    // Size: 0x1a3, Type: dev
    function private function_a142586187d0808d()
    {
        pops_arm = zm_sat_locust_util::get_quest_reference( #"pops_arm" );
        pops_arm.origin = pops_arm.starting_origin;
        pops_arm.angles = pops_arm.starting_angles;
        pops_arm setscriptablepartstate( #"hash_6673373e4137e6b3", #"idle" );
        pops_wrist = zm_sat_locust_util::get_quest_reference( #"pops_wrist" );
        pops_wrist unlink();
        pops_wrist.origin = pops_wrist.starting_origin;
        pops_wrist.angles = pops_wrist.starting_angles;
        pops_wrist linkto( pops_arm );
        pops_wrist setscriptablepartstate( #"hash_18f57fec496fa7ae", #"idle" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_59d80432a1a3fdb9" );
        function_8e792b5c68afa0cb();
        zm_sat_locust_util::function_a70056d3a99eace5( #"tractor_beam" );
        tractor_beam_location = pops_wrist gettagorigin( "<dev string:xf21>" );
        tractor_beam = spawnscriptable( %"sat_zm_prop_seymour", tractor_beam_location, pops_wrist gettagangles( "<dev string:xf21>" ) );
        zm_sat_locust_util::function_295a36ef38f5acae( #"tractor_beam", tractor_beam );
        battery = zm_sat_locust_util::get_quest_reference( #"hash_59d80432a1a3fdb9" );
        battery setscriptablepartstate( #"usable", #"disabled" );
        battery setscriptablepartstate( #"body", #"enabled" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_5e5df2681a5150ee" );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x60349f55, Offset: 0x1652b
    // Size: 0x20, Type: dev
    function private function_954e53f283a692ee()
    {
        level notify( #"reset_vignette" );
        function_e1be373f270e855();
        level thread function_c7a2d48b783373e();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x2b333e5a, Offset: 0x16553
    // Size: 0x4d, Type: dev
    function private function_e1be373f270e855()
    {
        zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_start" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"pops_beam_end" );
        zm_sat_locust_util::function_a70056d3a99eace5( #"hash_cb1438cc2faf190c" );
        function_c5cf5110c4824d3c( 0 );
    }

    // Namespace namespace_7acb35c452673b3
    // Params 1, eflags: 0x4
    // Checksum 0xebfec2fd, Offset: 0x165a8
    // Size: 0x9c, Type: dev
    function private function_41745c85d3d2a5d8( params )
    {
        idx = int( params[ 0 ] );
        
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            return;
        }
        
        if ( level.power_quest.var_caf65d0f55f1d819.size > 0 )
        {
            utility::array_call( level.power_quest.var_caf65d0f55f1d819, &kill );
        }
        
        Ravager = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        Ravager.teleport_count = idx;
        Ravager thread function_144a73db258585aa();
    }

    // Namespace namespace_7acb35c452673b3
    // Params 0, eflags: 0x4
    // Checksum 0x1cb59ffa, Offset: 0x1664c
    // Size: 0x76, Type: dev
    function private function_1194ad6ca0c54d0f()
    {
        if ( !zm_sat_locust_util::function_3112dc4740eb8499( #"hash_980b88deb2057ea8" ) )
        {
            return;
        }
        
        Ravager = zm_sat_locust_util::get_quest_reference( #"hash_980b88deb2057ea8" );
        bad_pos = ( -10628, 111064, 56509 );
        Ravager dontinterpolate();
        Ravager forceteleport( bad_pos, self.angles, 10000 );
        level.player setorigin( bad_pos );
    }

#/
