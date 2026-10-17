#using script_15ce43f40ea0fd2b;
#using script_1a6a1f7bdb57d7ff;
#using script_1aae2eb1ef28b239;
#using script_2399696a9d953451;
#using script_2a9058c1321cd25d;
#using script_389453bced5e788e;
#using script_501664a0dffc664d;
#using script_636bd827a012af12;
#using script_66878054d141dbc0;
#using script_6dfd03280678b65d;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\hud_util;
#using scripts\common\math;
#using scripts\common\scene;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\coop;
#using scripts\mp\gametypes\ob_gametype_story_mission;
#using scripts\mp\maps\mp_sat_ob_gemini\mp_sat_ob_gemini_audio;
#using scripts\mp\maps\mp_sat_ob_gemini\mp_sat_ob_gemini_util;
#using scripts\mp\maps\mp_sat_ob_gemini\mp_sat_ob_gemini_vo;

#namespace namespace_2466a4c786927f0a;

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x5
// Checksum 0x3445ff81, Offset: 0x12c6
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_4bf44c79256f4ee2", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x91ff6746, Offset: 0x12ef
// Size: 0x6f
function private function_538033a540e63c70()
{
    level.current_activity_name = "OB_GEMINI_PRISON_MINECARTS";
    activity_common::registeractivitytype( "OB_GEMINI_PRISON_MINECARTS", &ob_gametype_story_mission::activity_type_init );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_PRISON_MINECARTS", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_PRISON_MINECARTS", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "OB_GEMINI_PRISON_MINECARTS", 3, &activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "OB_GEMINI_PRISON_MINECARTS" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0xe15a853c, Offset: 0x1366
// Size: 0x59
function activity_setup()
{
    level.request_ids = undefined;
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        activity_instance prison_minecarts_start();
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x4979a807, Offset: 0x13c7
// Size: 0x39
function activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    activity_instance prison_minecarts_main();
    activity_instance_common::endactivity( activity_instance, 1 );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0xdf9cebab, Offset: 0x1408
// Size: 0x1c
function activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace namespace_2466a4c786927f0a
// Params 1
// Checksum 0x942f6bbe, Offset: 0x142c
// Size: 0xca
function player_joined_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
    
    if ( !threatbiasgroupexists( "threatbias_minecarts_prison_player" ) )
    {
        activity_instance function_e2faa5709401981e();
    }
    
    foreach ( player in player_list )
    {
        activity_instance thread prison_minecarts_player_setup( player );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0xb345c073, Offset: 0x14fe
// Size: 0x6e
function prison_minecarts_start()
{
    activity_instance = self;
    gemini_util::function_34a3d0cff5de2d7d();
    gemini_util::function_dfcbf5f9b3b2e6a0();
    level utility::flag_set_array( [ "flag_trig_prison_minecarts_player_entered", "flag_underground_barrier_01_opened" ] );
    activity_instance thread gemini_util::function_139e7e4c5feaaa9d();
    activity_instance thread ob_story_mission_utils::function_e6799e9a19df2365( "s_prison_underground_cache" );
    level.minecarts_manager = function_162e972ee20d92ba();
    activity_instance function_e2faa5709401981e();
    function_d67d028e3a76d9a();
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x7af02477, Offset: 0x1574
// Size: 0x13b
function prison_minecarts_main()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    level endon( #"game_ended" );
    level.var_d53163b0ef2a4488 = 1;
    
    if ( !isdefined( level.minecarts_manager ) )
    {
        level.minecarts_manager = function_162e972ee20d92ba();
    }
    
    activity_instance thread prison_minecarts_murderholes();
    activity_instance childthread function_4f8e20d66a665423();
    activity_instance childthread gemini_vo::function_881c3d0559c13e81();
    activity_instance thread function_e77682b6292e8afe();
    activity_instance thread ob_story_mission_utils::item_spawn_weapon( "s_minecarts_weapon", undefined, 1 );
    activity_instance thread ob_story_mission_utils::item_spawn_equipment( "s_prison_minecarts_equipment", undefined, 1 );
    activity_instance thread function_ee5fbc7b9b6ce836();
    activity_instance thread function_683639709926f1f8();
    activity_instance thread function_9ec5504d443fba88();
    activity_instance thread function_f9e13d2e56c4b73c();
    utility::flag_wait_any( "flag_minecarts_disable_murderholes", "flag_prison_minecarts_completed" );
    activity_instance thread namespace_31b2bab150bfb17a::function_b317ecf8c6509b49();
    activity_instance thread namespace_31b2bab150bfb17a::function_4c86d412ebfdbccd();
    level utility::flag_wait( "flag_prison_minecarts_completed" );
    minecart = getent( "gemini_prison_minecart_02", #targetname );
    
    if ( isdefined( minecart ) )
    {
        createnavobstaclebybounds( minecart.origin, ( 80, 40, 80 ), minecart.angles );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 1
// Checksum 0x93f9b7dc, Offset: 0x16b7
// Size: 0x92
function prison_minecarts_player_setup( player )
{
    activity_instance = self;
    
    if ( player utility::ent_flag( "flag_prison_minecarts_player_setup" ) )
    {
        return;
    }
    
    player utility::ent_flag_set( "flag_prison_minecarts_player_setup" );
    
    if ( !threatbiasgroupexists( "threatbias_minecarts_prison_player" ) )
    {
        activity_instance function_e2faa5709401981e();
    }
    
    player setthreatbiasgroup( "threatbias_minecarts_prison_player" );
    
    if ( activity_instance.additionalspawndata.is_startpoint_start )
    {
        player thread gemini_util::player_cold_breath_toggle( "flag_gemini_exfil_igc_begin" );
    }
    
    player thread function_e302b1730723bf02();
    player thread gemini_util::prison_ai_corpse_cleanup();
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0xa8a01ae1, Offset: 0x1751
// Size: 0xb9
function function_e2faa5709401981e()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    
    if ( threatbiasgroupexists( "threatbias_minecarts_prison_soldier" ) && threatbiasgroupexists( "threatbias_minecarts_prison_player" ) )
    {
        return;
    }
    
    createthreatbiasgroup( "threatbias_minecarts_prison_soldier" );
    createthreatbiasgroup( "threatbias_minecarts_prison_player" );
    setthreatbias( "threatbias_minecarts_prison_player", "threatbias_minecarts_prison_soldier", 99999 );
    
    if ( threatbiasgroupexists( "armory_entrance_zombies" ) && threatbiasgroupexists( "armory_entrance_door_soldiers" ) )
    {
        return;
    }
    
    createthreatbiasgroup( "armory_entrance_zombies" );
    createthreatbiasgroup( "armory_entrance_door_soldiers" );
    setthreatbias( "armory_entrance_zombies", "armory_entrance_door_soldiers", 1000 );
    setthreatbias( "armory_entrance_door_soldiers", "armory_entrance_zombies", 1000 );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x36e3692f, Offset: 0x1812
// Size: 0x51
function function_ee5fbc7b9b6ce836()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    
    if ( !utility::flag( "flag_prison_minecarts_soldiers_spawned" ) )
    {
        activity_instance thread function_8173444db806cc26();
    }
    
    waitframe();
    activity_instance function_61952654ce586cb5();
    waitframe();
    activity_instance function_46e9fae59562f192();
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0xc
// Checksum 0xdb93688c, Offset: 0x186b
// Size: 0x10f
function private function_e302b1730723bf02()
{
    self notify( #"hash_d48c3e67eab31b65" );
    self endon( #"hash_d48c3e67eab31b65" );
    level endon( #"game_ended", #"flag_prison_minecarts_completed" );
    self endon( #"death" );
    var_954434fe592db004 = getnoentvolumearray( "vol_minecarts_murderhole_grenade_monitor", #targetname );
    
    if ( var_954434fe592db004.size == 0 )
    {
        return;
    }
    
    while ( !level utility::flag( "flag_minecarts_disable_murderholes" ) )
    {
        self waittill( #"grenade_fire", grenade, weapon );
        
        if ( isdefined( grenade ) )
        {
            foreach ( vol_noent in var_954434fe592db004 )
            {
                childthread function_59d9254eb2ac3e85( grenade, weapon, vol_noent );
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 3, eflags: 0x4
// Checksum 0x7226622, Offset: 0x1982
// Size: 0x12b
function private function_59d9254eb2ac3e85( grenade, weapon, vol_noent )
{
    level endon( #"game_ended", #"flag_minecarts_disable_murderholes" );
    self endon( #"death" );
    var_b2075cfb38436756 = [ "sat_frag_grenade_ob", "sat_concussion_grenade_ob", "sat_molotov_ob", "sat_semtex_ob", "sat_cluster_grenade_ob", "sat_flash_grenade_ob", "sat_gas_grenade_ob", "sat_c4_ob", "sat_smoke_grenade_ob", "sat_impact_grenade_ob" ];
    
    if ( isdefined( weapon ) && isdefined( weapon.basename ) )
    {
        if ( !arraycontains( var_b2075cfb38436756, weapon.basename ) )
        {
            return;
        }
    }
    
    b_istouching = 0;
    
    while ( true )
    {
        if ( !isdefined( grenade ) )
        {
            return;
        }
        
        if ( grenade istouching( vol_noent ) )
        {
            b_istouching = 1;
            break;
        }
        
        waitframe();
    }
    
    if ( b_istouching && isdefined( grenade ) )
    {
        grenade waittill( #"explode", position );
        thread function_9bbd3b3facc3ee35( vol_noent );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 1, eflags: 0x4
// Checksum 0xf208080d, Offset: 0x1ab5
// Size: 0x139
function private function_9bbd3b3facc3ee35( vol_noent )
{
    level endon( #"game_ended" );
    s_murderhole = vol_noent utility::get_linked_structs()[ 0 ];
    
    if ( isdefined( s_murderhole ) && !s_murderhole utility::ent_flag( "flag_minecarts_murderhole_pause" ) )
    {
        if ( s_murderhole.turret_disabled )
        {
            return;
        }
        
        if ( isdefined( self ) )
        {
            self notify( #"hash_6209370487c5c80e" );
        }
        
        s_murderhole utility::ent_flag_set( "flag_minecarts_murderhole_pause" );
        
        if ( isdefined( s_murderhole.turret && !s_murderhole.turret_disabled ) )
        {
            s_murderhole.turret laseroff();
            s_murderhole.turret laserforceoff();
            
            /#
                iprintlnbold( "<dev string:x24>" );
            #/
        }
        
        wait randomfloatrange( 8, 12 );
        
        if ( !level utility::flag( "flag_minecarts_disable_murderholes" ) )
        {
            s_murderhole utility::ent_flag_clear( "flag_minecarts_murderhole_pause" );
            
            if ( isdefined( s_murderhole.turret && !s_murderhole.turret_disabled ) )
            {
                s_murderhole.turret laseron();
                s_murderhole.turret laserforceon();
                
                /#
                    iprintlnbold( "<dev string:x4f>" );
                #/
            }
        }
    }
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0xca6b58e5, Offset: 0x1bf6
    // Size: 0x5, Type: dev
    function function_bd35a25defaa37c7()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x1db60626, Offset: 0x1c03
// Size: 0xa0
function private function_61952654ce586cb5()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    level endon( #"game_ended" );
    utility::flag_wait_or_timeout( "flag_prison_minecarts_bridge_soldiers_spawned", 3 );
    request_id = activity_instance activity_ai_encounters::function_92b671064b0b1ce2( "sat_sm04_gemini_ai_encounter_minecarts_allyzombies_armored", 0, 1, 1, 2 );
    activity_ai_encounters::function_6bf4ff2fbde584ee( request_id, &prison_minecarts_armored_zombies_spawned );
    activity_ai_encounters::function_52d1342183200a8f( request_id, &function_17e04585040441ee );
    activity_ai_encounters::function_dcf6bdb6ee9d1ca0( request_id, &function_b0a0282a86971e4a );
    activity_ai_encounters::function_d33de057e760c97b( request_id, &function_5ced9ca0ff5f448b );
    activity_ai_encounters::function_48582991402cac50( request_id, 1 );
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0x3466581a, Offset: 0x1cab
// Size: 0x21
function private prison_minecarts_armored_zombies_spawned( requestid, userdata )
{
    utility::flag_set( "flag_prison_minecarts_armored_zombies_spawned" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x6c39c15d, Offset: 0x1cd4
// Size: 0x9e
function private function_46e9fae59562f192()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    level endon( #"game_ended" );
    utility::flag_wait_all( "flag_prison_minecarts_armored_zombies_spawned", "flag_prison_minecarts_pushing_zombies_spawned" );
    activity_instance thread function_6d8378f9f2f0f1c2( "sat_sm04_gemini_ai_encounter_minecarts_allyzombies_lower_prio", undefined, 25, 1 );
    wait 1;
    activity_instance thread function_6d8378f9f2f0f1c2( "sat_sm04_gemini_ai_encounter_minecarts_allyzombies_lower_prio2", undefined, 25, 0 );
    wait 1;
    activity_instance thread function_6d8378f9f2f0f1c2( "sat_sm04_gemini_ai_encounter_minecarts_allyzombies_lower_prio3", undefined, 20, 1 );
    wait 1;
    activity_instance thread function_6d8378f9f2f0f1c2( "sat_sm04_gemini_ai_encounter_minecarts_allyzombies_lower_prio4", undefined, 20, 0 );
}

// Namespace namespace_2466a4c786927f0a
// Params 1
// Checksum 0xb828fe14, Offset: 0x1d7a
// Size: 0x1c7
function function_1e1b533d7d40ba19( requestid )
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    level endon( #"game_ended" );
    s_minecarts_breakable_barrier = utility::getstruct( "s_minecarts_breakable_barrier", "targetname" );
    forward_pos = s_minecarts_breakable_barrier.origin;
    distance_buffer = 512;
    var_950ecf2e62eeedf = undefined;
    
    while ( !level utility::flag( "flag_minecarts_disable_murderholes" ) )
    {
        var_22b65f6dbdf06919 = utility::function_4325398d215ecda5( forward_pos, activity_instance.playerparticipants );
        
        if ( !isent( var_22b65f6dbdf06919 ) || !isplayer( var_22b65f6dbdf06919 ) )
        {
            wait 2;
            continue;
        }
        
        if ( !isdefined( level.minecarts_manager.var_a9b20485583a126f ) )
        {
            waitframe();
            continue;
        }
        
        minecart = function_47c86977a18df38b( level.minecarts_manager.var_a9b20485583a126f, var_22b65f6dbdf06919.origin, 800 );
        function_28fe15d9e2bfab0d( requestid );
        
        if ( isdefined( minecart ) )
        {
            var_950ecf2e62eeedf = minecart;
        }
        else
        {
            var_950ecf2e62eeedf = var_22b65f6dbdf06919;
        }
        
        function_c505198907e0d306( requestid, var_950ecf2e62eeedf, 1 );
        activity_instance function_beb8f595d5995c2c( forward_pos, var_22b65f6dbdf06919, distance_buffer, requestid );
        
        /#
            if ( getdvarint( @"hash_374af06e51ddb737", 0 ) )
            {
                activity_instance childthread function_6347d74e674350ce( var_950ecf2e62eeedf );
            }
        #/
        
        wait 2;
    }
    
    waitframe();
    s_minecarts_zombie_floodfill_front = utility::getstruct( "s_minecarts_zombie_floodfill_front", "targetname" );
    
    if ( isdefined( s_minecarts_zombie_floodfill_front ) )
    {
        spawn_pos = s_minecarts_zombie_floodfill_front.origin;
        radius = 512;
    }
    else
    {
        spawn_pos = forward_pos;
        radius = 768;
    }
    
    function_1ac3703e7bc56a8( requestid, spawn_pos, radius, 1 );
}

// Namespace namespace_2466a4c786927f0a
// Params 4, eflags: 0x4
// Checksum 0xa7c70190, Offset: 0x1f49
// Size: 0x168
function private function_beb8f595d5995c2c( forward_pos, var_22b65f6dbdf06919, distance_buffer, requestid )
{
    var_1f30ece26f79f525 = distance2d( forward_pos, var_22b65f6dbdf06919.origin ) + distance_buffer;
    data = function_9b649316adcccbaa( requestid );
    b_fast_despawn = 0;
    
    if ( data.ai.size > 3 )
    {
        b_fast_despawn = 1;
    }
    
    foreach ( ai in data.ai )
    {
        if ( isdefined( ai ) )
        {
            players = getplayersinradius( ai.origin, 256 );
            
            if ( players.size > 0 )
            {
                waitframe();
                continue;
            }
            
            var_778463950afa2a8e = distance2d( forward_pos, ai.origin );
            
            if ( var_778463950afa2a8e > var_1f30ece26f79f525 )
            {
                ai gemini_util::ai_zombie_despawn();
                
                if ( b_fast_despawn )
                {
                    wait randomfloatrange( 0.1, 0.9 );
                }
                else
                {
                    wait randomfloatrange( 0.5, 1.5 );
                }
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 1, eflags: 0x4
// Checksum 0x3e226eca, Offset: 0x20b9
// Size: 0x3e
function private function_6347d74e674350ce( var_950ecf2e62eeedf )
{
    if ( isdefined( var_950ecf2e62eeedf ) )
    {
        /#
            gemini_util::debug_draw_cylinder( var_950ecf2e62eeedf.origin, 1, 500, 2, ( 0, 1, 0 ) );
        #/
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 4, eflags: 0x4
// Checksum 0xefa192e3, Offset: 0x20ff
// Size: 0x12a
function private function_6d8378f9f2f0f1c2( ai_encounter_targetname, var_49b30b1eee2bf508, var_939a6122b3f49ea1 = 20, forward_cycling = 0 )
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    request_id = activity_instance activity_ai_encounters::function_92b671064b0b1ce2( ai_encounter_targetname, 0, 1, 1, 2 );
    activity_ai_encounters::function_52d1342183200a8f( request_id, &function_17e04585040441ee );
    activity_ai_encounters::function_dcf6bdb6ee9d1ca0( request_id, &function_b03f119df58de22b );
    activity_ai_encounters::function_d33de057e760c97b( request_id, &function_5ced9ca0ff5f448b );
    
    while ( !utility::flag( "flag_prison_minecarts_completed" ) )
    {
        level utility::flag_wait_or_timeout( "flag_minecarts_free_the_prisoners", 5 );
        count_all_ai = getaicount();
        
        if ( count_all_ai <= var_939a6122b3f49ea1 )
        {
            activity_ai_encounters::function_48582991402cac50( request_id, 1 );
            
            if ( isdefined( var_49b30b1eee2bf508 ) )
            {
                utility::flag_set( var_49b30b1eee2bf508 );
            }
            
            break;
        }
        
        wait 1;
    }
    
    if ( !utility::flag( "flag_prison_minecarts_completed" ) && forward_cycling == 1 )
    {
        activity_instance thread function_1e1b533d7d40ba19( request_id );
        return;
    }
    
    activity_instance thread function_2d312879dee7fd2c( request_id );
}

// Namespace namespace_2466a4c786927f0a
// Params 1, eflags: 0x4
// Checksum 0xba64484b, Offset: 0x2231
// Size: 0x8d
function private function_2d312879dee7fd2c( request_id )
{
    s_minecarts_zombie_floodfill_front = utility::getstruct( "s_minecarts_zombie_floodfill_front", "targetname" );
    s_minecarts_zombie_floodfill_back = utility::getstruct( "s_minecarts_zombie_floodfill_back", "targetname" );
    
    if ( isdefined( s_minecarts_zombie_floodfill_back ) )
    {
        function_1ac3703e7bc56a8( request_id, s_minecarts_zombie_floodfill_back.origin, 768, 1 );
    }
    
    level utility::flag_wait( "flag_minecarts_disable_murderholes" );
    
    if ( isdefined( s_minecarts_zombie_floodfill_front ) )
    {
        function_1ac3703e7bc56a8( request_id, s_minecarts_zombie_floodfill_front.origin, 512, 1 );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 4, eflags: 0x4
// Checksum 0x8bafa31b, Offset: 0x22c6
// Size: 0x392
function private function_17e04585040441ee( requestid, instance, agent, data )
{
    level endon( #"game_ended" );
    agent endon( #"death" );
    agent gemini_util::function_376f4cf6d212ef9b( 5 );
    agent childthread function_7ee00cab3090dfaa();
    agent childthread gemini_util::function_11266ff8ae084f14( "flag_trig_prison_minecarts_player_entered" );
    agent childthread function_7f9b153e5d0e8aa0();
    
    if ( isdefined( agent.directorspawndata.script_noteworthy ) )
    {
        if ( agent.directorspawndata.script_noteworthy == "armored_building01" )
        {
            var_95390fbe07385588 = utility::getstruct( "s_barrier_building_01", "targetname" );
            var_bf7fe66580dabc2c = utility::getstructarray( "s_building_01_attack_point", "targetname" );
            agent function_6c3af37e8484faa6( var_95390fbe07385588, var_bf7fe66580dabc2c, "flag_minecarts_building01_gate_opened" );
        }
        else if ( agent.directorspawndata.script_noteworthy == "armored_building02" )
        {
            var_e54dfc1a84327771 = utility::getstruct( "s_barrier_building_02", "targetname" );
            var_2de5570c5575aaa5 = utility::getstructarray( "s_building_02_attack_point", "targetname" );
            agent function_6c3af37e8484faa6( var_e54dfc1a84327771, var_2de5570c5575aaa5, "flag_minecarts_building02_gate_opened" );
        }
    }
    
    if ( utility::flag( "flag_minecarts_armory_entrance" ) && isdefined( agent.og_maxhealth ) )
    {
        agent.maxhealth = agent.og_maxhealth;
    }
    
    while ( !utility::flag( "flag_prison_minecarts_barrier_destroyed" ) && !utility::flag( "flag_prison_minecarts_soldiers_defeated" ) )
    {
        var_a97d79fac8e7a1c7 = utility::get_noteworthy_array( "prison_minecarts_soldier" );
        var_a97d79fac8e7a1c7 = utility::array_removedead_or_dying( var_a97d79fac8e7a1c7, 1 );
        
        if ( var_a97d79fac8e7a1c7.size > 0 )
        {
            ai_target = function_47c86977a18df38b( var_a97d79fac8e7a1c7, agent.origin, 6400 );
            
            if ( isalive( ai_target ) && !ai_target.ignoreme && ai_target.type != "zombie" )
            {
                agent setbtgoalent( 0, ai_target );
                ai_target utility::waittill_notify_or_timeout( "death", 10 );
                agent clearbtgoal( 0 );
            }
        }
        
        wait 1;
    }
    
    agent gemini_util::ai_nerf( 3, "run" );
    
    if ( threatbiasgroupexists( "armory_entrance_zombies" ) )
    {
        agent setthreatbiasgroup( "armory_entrance_zombies" );
    }
    
    utility::flag_wait( "flag_prison_minecarts_barrier_destroyed" );
    s_armory_entrance = utility::getstruct( "s_prison_armory_entrance_zombie_attractor", "targetname" );
    agent function_fa32376aaa88a7a2( s_armory_entrance.origin, 6400 );
    
    if ( isdefined( level.var_6f1e76adcacad587 ) )
    {
        while ( level.var_6f1e76adcacad587.ai_array.size > 0 )
        {
            attackable_soldier = utility::array_random( level.var_6f1e76adcacad587.ai_array );
            
            if ( isalive( attackable_soldier ) && attackable_soldier.type != "zombie" )
            {
                agent setbtgoalent( 0, attackable_soldier );
                attackable_soldier utility::waittill_notify_or_timeout( "death", 10 );
                agent clearbtgoal( 0 );
            }
            
            wait 1;
        }
    }
    
    utility::flag_wait( "flag_prison_armory_entrance_soldiers_defeated" );
    agent clearbtgoal( 0 );
    s_armory_ambush = utility::getstruct( "s_prison_armory_ambush_zombie_attractor", "targetname" );
    agent function_fa32376aaa88a7a2( s_armory_ambush.origin, 4000 );
    agent thread gemini_util::ai_delete_when_out_of_sight( 512, 1024 );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0xa927e2d5, Offset: 0x2660
// Size: 0x8c
function private function_7f9b153e5d0e8aa0()
{
    level endon( #"game_ended", #"flag_prison_minecarts_soldiers_defeated" );
    
    if ( utility::flag( "flag_prison_minecarts_soldiers_defeated" ) )
    {
        return;
    }
    
    while ( isalive( self ) )
    {
        if ( level.players.size > 2 )
        {
            gemini_util::function_f53463c3213de6a1( "s_minecarts_breakable_barrier", "flag_prison_minecarts_completed", 20, 10 );
            wait randomfloatrange( 1, 9 );
            continue;
        }
        
        gemini_util::function_f53463c3213de6a1( "s_minecarts_breakable_barrier", "flag_prison_minecarts_completed", 25, 15 );
        wait randomfloatrange( 5, 15 );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x35497ae5, Offset: 0x26f4
// Size: 0x2d1
function function_683639709926f1f8()
{
    level endon( #"game_ended" );
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    trig = getnoentvolumearray( "trig_prison_minecarts_zombie_kill", #targetname )[ 0 ];
    
    if ( !isdefined( trig ) )
    {
        return;
    }
    
    b_grenade = 0;
    
    while ( !utility::flag( "flag_trig_prison_minecarts_zombie_kill" ) )
    {
        a_zombies = getaiarray( level.players[ 0 ].team );
        
        foreach ( zombie in a_zombies )
        {
            if ( !isalive( zombie ) )
            {
                waitframe();
                continue;
            }
            
            if ( zombie utility::ent_flag( "scene_active" ) || zombie utility::ent_flag( "spawn_animating" ) )
            {
                waitframe();
                continue;
            }
            
            if ( isdefined( zombie.magic_bullet_shield ) )
            {
                waitframe();
                continue;
            }
            
            if ( !zombie istouching( trig ) )
            {
                waitframe();
                continue;
            }
            
            a_players = getplayersinradius( zombie.origin, 256 );
            
            if ( !b_grenade && a_players.size == 0 && isdefined( level.minecarts_enemy_soldiers ) && level.minecarts_enemy_soldiers.ai_array.size > 0 )
            {
                tempowner = level.minecarts_enemy_soldiers.ai_array[ 0 ];
                
                if ( isdefined( tempowner ) && isdefined( zombie ) )
                {
                    tempowner launchgrenade( "sat_frag_grenade_mp", zombie.origin + ( 0, 0, 10 ), ( 0, 0, 0 ), 0.05 );
                    b_grenade = 1;
                }
            }
            else
            {
                switch ( randomint( 9 ) )
                {
                    case 0:
                        zombie zombie_base_dismemberment::dismember_annihilate();
                        zombie kill();
                        break;
                    case 1:
                        zombie zombie_base_dismemberment::dismember_head();
                        b_grenade = 0;
                        break;
                    case 2:
                    case 3:
                        zombie zombie_base_dismemberment::dismember_left_arm();
                        break;
                    case 4:
                    case 5:
                        zombie zombie_base_dismemberment::dismember_right_arm();
                        break;
                    default:
                        zombie zombie_base_dismemberment::function_14463e39cc414bab( 1 );
                        break;
                }
            }
            
            wait randomfloatrange( 0.1, 0.3 );
        }
        
        wait 0.1;
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2
// Checksum 0x863e0cc8, Offset: 0x29cd
// Size: 0x27e
function function_7ee00cab3090dfaa( dist_close = 384, b_vulnerable = 0 )
{
    level endon( #"game_ended", #"flag_minecarts_cart_reached_end", #"flag_minecarts_armory_entrance" );
    self endon( #"death" );
    distsq_close = squared( dist_close );
    n_hits = 0;
    
    while ( true )
    {
        self waittill( #"damage", amount, attacker, direction, point, damagetype, modelname, tagname, partname, idflags, objweapon );
        
        if ( isdefined( objweapon ) && getweaponbasename( objweapon ) == "sat_ob_turret_gemini" )
        {
            n_hits++;
            var_9f74b7296c79d3d9 = 50;
            
            if ( b_vulnerable )
            {
                var_9f74b7296c79d3d9 += randomintrange( 25, 100 );
            }
            else if ( isdefined( attacker.origin ) )
            {
                distsq = distancesquared( self.origin, attacker.origin );
                distfrac = ( distsq - distsq_close ) / distsq;
                distfrac = clamp( distfrac, 0, 1 );
                var_9f74b7296c79d3d9 = math::lerp( 150, 0, distfrac ) + n_hits * 30;
            }
            
            if ( self.subclass == "zombie_base_armored_heavy" || utility::ent_flag( "flag_zombie_barrier_attacker" ) )
            {
                var_9f74b7296c79d3d9 -= 50;
            }
            
            if ( var_9f74b7296c79d3d9 > 75 )
            {
                if ( utility::percent_chance( var_9f74b7296c79d3d9 ) )
                {
                    zombie_base_dismemberment::dismember_annihilate();
                    self kill();
                }
            }
            else if ( var_9f74b7296c79d3d9 > 50 )
            {
                if ( utility::percent_chance( var_9f74b7296c79d3d9 ) )
                {
                    n_height = point[ 2 ] - self.origin[ 2 ];
                    
                    if ( n_height > 48 )
                    {
                        zombie_base_dismemberment::dismember_head();
                    }
                    else
                    {
                        switch ( randomint( 5 ) )
                        {
                            case 0:
                                zombie_base_dismemberment::dismember_left_arm();
                                break;
                            case 1:
                                zombie_base_dismemberment::dismember_right_arm();
                                break;
                            default:
                                zombie_base_dismemberment::function_14463e39cc414bab( 1 );
                                break;
                        }
                    }
                }
            }
            else if ( utility::cointoss() )
            {
                zombie_knockdown::topple_ai( point, amount * 2 );
            }
        }
        
        wait 0.1;
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 3, eflags: 0x4
// Checksum 0x656339ff, Offset: 0x2c53
// Size: 0xcb
function private function_6c3af37e8484faa6( s_barrier, var_91b2413e9dd30742, var_9d88e82a2f9e49db )
{
    self endon( #"death" );
    self.attractor = zombie_attractor_manager::function_7eb1aaa8bc7cc15( s_barrier, 1, 256, 1, undefined, undefined, 0, "team_hundred_ninety", 1 );
    zombie_attractor_manager::function_4c34b0f066a9d9fe( self.attractor, 120 );
    
    if ( isarray( var_91b2413e9dd30742 ) )
    {
        zombie_attractor_manager::set_attractor_slots( self.attractor, var_91b2413e9dd30742 );
    }
    
    if ( isdefined( var_9d88e82a2f9e49db ) )
    {
        utility::flag_wait_any( var_9d88e82a2f9e49db, "flag_prison_minecarts_barrier_destroyed" );
    }
    else
    {
        utility::flag_wait( "flag_prison_minecarts_barrier_destroyed" );
    }
    
    zombie_attractor_manager::function_dcfb4c31f1d97cd2( self.attractor );
    
    if ( utility::flag( "flag_prison_minecarts_barrier_destroyed" ) )
    {
        gemini_util::ai_delete_when_out_of_sight( 512, 1024 );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0x14628afd, Offset: 0x2d26
// Size: 0x5d, Type: bool
function private function_b03f119df58de22b( requestid, userdata )
{
    count_all_ai = getaicount();
    
    if ( !utility::flag( "flag_trig_prison_minecarts_player_entered" ) )
    {
        if ( count_all_ai > 20 )
        {
            return false;
        }
    }
    else if ( count_all_ai > 25 )
    {
        return false;
    }
    
    if ( utility::flag( "flag_prison_minecarts_completed" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0xc1513221, Offset: 0x2d8c
// Size: 0x41, Type: bool
function private function_b0a0282a86971e4a( requestid, userdata )
{
    count_all_ai = getaicount();
    
    if ( count_all_ai > 35 )
    {
        return false;
    }
    
    if ( utility::flag( "flag_prison_minecarts_completed" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0xc990cee4, Offset: 0x2dd6
// Size: 0x27, Type: bool
function private function_5ced9ca0ff5f448b( requestid, userdata )
{
    if ( utility::flag( "flag_prison_minecarts_completed" ) )
    {
        return true;
    }
    
    return false;
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0xc82aebae, Offset: 0x2e06
    // Size: 0x5, Type: dev
    function function_75a45b38e9980e4c()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x3ff161bb, Offset: 0x2e13
// Size: 0xd6
function function_8173444db806cc26()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    level endon( #"game_ended" );
    
    if ( !isdefined( level.minecarts_enemy_soldiers ) )
    {
        level.minecarts_enemy_soldiers = spawnstruct();
        
        if ( !isdefined( level.minecarts_enemy_soldiers.ai_array ) )
        {
            level.minecarts_enemy_soldiers.ai_array = [];
        }
    }
    
    if ( !threatbiasgroupexists( "threatbias_minecarts_prison_soldier" ) )
    {
        activity_instance function_e2faa5709401981e();
    }
    
    if ( !utility::flag( "flag_prison_minecarts_bridge_soldiers_spawned" ) )
    {
        activity_instance function_f6837de7b194f4a4();
        waitframe();
    }
    
    activity_instance gemini_util::function_51e3aaef58423855( "sat_sm04_gemini_ai_encounter_minecarts_soldiers", &function_7fe0d09470b3b9aa, undefined, "flag_minecarts_disable_murderholes", 2, 0, &function_83966e712aed6fdd, &function_3526b9de0730f68e );
    waitframe();
    activity_instance childthread function_e76f4c3c5d5d991e();
}

// Namespace namespace_2466a4c786927f0a
// Params 3, eflags: 0x4
// Checksum 0xfaac75a9, Offset: 0x2ef1
// Size: 0x4c, Type: bool
function private function_83966e712aed6fdd( requestid, userdata, wavenumber )
{
    if ( level utility::flag( "flag_trig_prison_minecarts_armory_approach" ) )
    {
        ai_spawn_director::cancel_spawn_request( requestid, 0 );
        return false;
    }
    
    if ( level utility::flag( "flag_prison_minecarts_soldiers_reinforce" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0x740fefe6, Offset: 0x2f46
// Size: 0x21
function private function_3526b9de0730f68e( requestid, userdata )
{
    utility::flag_set( "flag_prison_minecarts_soldiers_spawned" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x24bcb3f1, Offset: 0x2f6f
// Size: 0x57
function function_f6837de7b194f4a4()
{
    activity_instance = self;
    level endon( #"game_ended" );
    
    if ( !threatbiasgroupexists( "threatbias_minecarts_prison_soldier" ) )
    {
        activity_instance function_e2faa5709401981e();
    }
    
    level utility::flag_set( "flag_prison_minecarts_bridge_soldiers_spawned" );
    activity_instance gemini_util::function_51e3aaef58423855( "sat_sm04_gemini_ai_encounter_minecarts_soldiers_bridge", &function_7fe0d09470b3b9aa, undefined, "flag_minecarts_disable_murderholes" );
}

// Namespace namespace_2466a4c786927f0a
// Params 4, eflags: 0x4
// Checksum 0x6fceb088, Offset: 0x2fce
// Size: 0x25e
function private function_7fe0d09470b3b9aa( requestid, instance, agent, userdata )
{
    level endon( #"game_ended" );
    agent endon( #"death" );
    
    if ( !isdefined( level.minecarts_enemy_soldiers ) )
    {
        level.minecarts_enemy_soldiers = spawnstruct();
        
        if ( !isdefined( level.minecarts_enemy_soldiers.ai_array ) )
        {
            level.minecarts_enemy_soldiers.ai_array = [];
        }
    }
    
    agent.grenadeammo = 0;
    agent agent_utils::function_1874e18b42e6d814( &gemini_util::function_cb3d5af3567a0360 );
    
    if ( agent.directorspawndata.script_noteworthy == "prison_minecarts_soldier_unreachable" )
    {
        agent.is_unreachable = 1;
        agent ai::set_ignoreme( 1 );
        
        if ( threatbiasgroupexists( "threatbias_minecarts_prison_soldier" ) )
        {
            agent setthreatbiasgroup( "threatbias_minecarts_prison_soldier" );
        }
        else
        {
            /#
                iprintln( "<dev string:x66>" );
            #/
        }
        
        if ( !utility::flag( "flag_underground_barrier_01_opened" ) )
        {
            agent ai::set_ignoreall( 1 );
            utility::flag_wait( "flag_underground_barrier_01_opened" );
            agent ai::set_ignoreall( 0 );
        }
    }
    else
    {
        agent thread gemini_util::function_7653e4bbe774fb50( level.minecarts_enemy_soldiers );
        
        if ( !utility::flag( "flag_underground_barrier_01_opened" ) )
        {
            agent ai::set_ignoreme( 1 );
            agent ai::set_ignoreall( 1 );
            utility::flag_wait( "flag_underground_barrier_01_opened" );
            agent ai::set_ignoreme( 0 );
            agent ai::set_ignoreall( 0 );
        }
    }
    
    random_player = utility::array_random( level.players );
    
    if ( random_player )
    {
        agent getenemyinfo( random_player );
    }
    
    agent demeanoroverride( "combat" );
    
    if ( agent.is_unreachable )
    {
        level utility::flag_wait_any( "flag_minecarts_disable_murderholes", "flag_trig_prison_minecarts_flanker_nerf" );
        agent gemini_util::ai_nerf();
        utility::flag_wait_or_timeout( "flag_minecarts_armory_entrance", 5 );
        agent gemini_util::ai_delete_when_out_of_sight( 512, 1024 );
        return;
    }
    
    level utility::flag_wait( "flag_minecarts_disable_murderholes" );
    agent gemini_util::ai_nerf();
    v_minecarts_soldiers_back = getent( "v_minecarts_soldiers_back", #targetname );
    
    if ( isdefined( v_minecarts_soldiers_back ) )
    {
        agent setgoalvolumeauto( v_minecarts_soldiers_back );
        return;
    }
    
    /#
        iprintlnbold( "<dev string:xcc>" );
    #/
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x940fd6fd, Offset: 0x3234
// Size: 0xc1
function private function_e76f4c3c5d5d991e()
{
    activity_instance = self;
    utility::flag_wait( "flag_prison_minecarts_soldiers_spawned" );
    assert( isdefined( level.minecarts_enemy_soldiers ), "<dev string:x115>" );
    
    while ( true )
    {
        waitframe();
        level.minecarts_enemy_soldiers gemini_util::ai_array_cleanup( "soldier" );
        
        if ( !utility::flag( "flag_prison_minecarts_soldiers_reinforce" ) && level.minecarts_enemy_soldiers.ai_array.size < 2 )
        {
            utility::flag_set( "flag_prison_minecarts_soldiers_reinforce" );
            wait 1;
        }
        
        if ( level.minecarts_enemy_soldiers.ai_array.size <= 0 )
        {
            break;
        }
    }
    
    utility::flag_set( "flag_prison_minecarts_soldiers_defeated" );
    
    /#
        iprintlnbold( "<dev string:x148>" );
    #/
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0x8400b9c3, Offset: 0x32fd
    // Size: 0x5, Type: dev
    function function_a153d28e50824b51()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0xa5eaf295, Offset: 0x330a
// Size: 0x41
function private function_f9e13d2e56c4b73c()
{
    activity_instance = self;
    activity_instance thread gemini_util::function_bad374b9f21345b( "e_prison_minecarts_building1_gate", "flag_minecarts_building01_gate_opened", undefined, "flag_prison_armory_oob_enabled" );
    activity_instance thread gemini_util::function_bad374b9f21345b( "e_prison_minecarts_building2_gate", "flag_minecarts_building02_gate_opened", undefined, "flag_prison_armory_oob_enabled" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x7bb28757, Offset: 0x3353
// Size: 0x3d
function private function_e77682b6292e8afe()
{
    activity_instance = self;
    level endon( #"flag_prison_minecarts_completed" );
    utility::flag_wait( "flag_minecarts_armory_entrance" );
    utility::flag_set( "flag_minecarts_disable_murderholes" );
    level.onplayerdamaged = undefined;
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0xf4d8aff7, Offset: 0x3398
    // Size: 0x5, Type: dev
    function function_671e5ee77b95466b()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x9a3f575b, Offset: 0x33a5
// Size: 0xa9
function private function_9ec5504d443fba88()
{
    activity_instance = self;
    s_minecarts_breakable_barrier = utility::getstruct( "s_minecarts_breakable_barrier", "targetname" );
    s_minecarts_breakable_barrier.sm_barrier = getent( "sm_minecarts_breakable_barrier", #targetname );
    s_minecarts_breakable_barrier.sbm_barrier = getent( "sbm_minecarts_breakable_barrier", #targetname );
    a_s_minecarts_breakable_barrier = utility::getstructarray( "s_minecarts_breakable_barrier_att_point", "targetname" );
    activity_instance thread function_7a864488159d8c23( s_minecarts_breakable_barrier, a_s_minecarts_breakable_barrier );
    activity_instance thread function_ac2588d6ae906399();
    activity_instance thread function_47c4200d5f02618( s_minecarts_breakable_barrier, "flag_minecarts_armory_entrance", "flag_prison_minecarts_barrier_destroyed", 25 );
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0xe90e537f, Offset: 0x3456
// Size: 0x1ea
function private function_7a864488159d8c23( s_barrier, var_a2d856f418c07d6a )
{
    level endon( #"game_ended", #"flag_prison_minecarts_barrier_destroyed" );
    sm_barrier = s_barrier.sm_barrier;
    sbm_barrier = s_barrier.sbm_barrier;
    utility::flag_wait( "flag_prison_minecarts_soldiers_defeated" );
    level thread function_cb73f272150c67b5();
    sm_barrier setcandamage( 0 );
    sm_barrier.health = 750;
    s_attackable = zombie_attractor_manager::add_attractor( s_barrier, 3, 3072, 1, undefined, &function_817890260bda8272, 0, "team_hundred_ninety" );
    zombie_attractor_manager::function_4c34b0f066a9d9fe( s_attackable, 90 );
    zombie_attractor_manager::set_attractor_slots( s_attackable, var_a2d856f418c07d6a );
    s_minecarts_armory_gate_allplayers = utility::getstruct( "s_minecarts_armory_gate_allplayers", "targetname" );
    childthread gemini_util::function_c346435ed6d8395e( "flag_minecarts_armory_entrance", s_minecarts_armory_gate_allplayers, 384, 5 );
    sm_barrier childthread function_74ad72d5c3faa0e0( s_minecarts_armory_gate_allplayers );
    first_change = 0;
    second_change = 0;
    
    while ( sm_barrier.health > 0 )
    {
        sm_barrier waittill( #"damage" );
        sm_barrier playsound( "evt_sat_gem_zombies_gate_impacts" );
        
        if ( sm_barrier.health <= 450 && !first_change )
        {
            first_change = 1;
            sm_barrier setscriptablepartstate( "main", "damaged" );
        }
        else if ( sm_barrier.health <= 225 && !second_change )
        {
            second_change = 1;
            sm_barrier setscriptablepartstate( "main", "breaking" );
        }
        
        /#
            iprintln( "<dev string:x170>" + string( sm_barrier.health ) );
        #/
        
        waitframe();
    }
    
    sbm_barrier hide();
    sbm_barrier connectpaths();
    sm_barrier setscriptablepartstate( "main", "dead" );
    zombie_attractor_manager::remove_attractor( s_attackable );
    utility::flag_set( "flag_prison_minecarts_barrier_destroyed" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x5bcdc3b7, Offset: 0x3648
// Size: 0x98
function function_cb73f272150c67b5()
{
    s_minecarts_breakable_barrier = utility::getstruct( "s_minecarts_breakable_barrier", "targetname" );
    a_zombies_near_gate = getaiarrayinradius( s_minecarts_breakable_barrier.origin, 1024, level.players[ 0 ].team );
    
    if ( a_zombies_near_gate.size > 8 )
    {
        level utility::flag_set_delayed( "flag_prison_minecarts_zombies_attractor_expand", 5 );
        return;
    }
    
    if ( a_zombies_near_gate.size > 4 )
    {
        level utility::flag_set_delayed( "flag_prison_minecarts_zombies_attractor_expand", 2 );
        return;
    }
    
    level utility::flag_set( "flag_prison_minecarts_zombies_attractor_expand" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x8902c816, Offset: 0x36e8
// Size: 0x93
function private function_ac2588d6ae906399()
{
    level endon( #"game_ended" );
    utility::flag_wait( "flag_prison_minecarts_soldiers_defeated" );
    s_spectator = utility::getstruct( "s_minecarts_breakable_barrier_spectator", "targetname" );
    var_18abf64ea4bec417 = utility::getstructarray( "s_minecarts_breakable_barrier_spectator_point", "targetname" );
    spectator_attractor = zombie_attractor_manager::add_attractor( s_spectator, 0, 3072, 0, undefined, &function_817890260bda8272, 0, "team_hundred_ninety" );
    zombie_attractor_manager::set_attractor_slots( spectator_attractor, var_18abf64ea4bec417 );
    level utility::flag_wait( "flag_prison_minecarts_barrier_destroyed" );
    zombie_attractor_manager::remove_attractor( spectator_attractor );
}

// Namespace namespace_2466a4c786927f0a
// Params 1, eflags: 0x4
// Checksum 0xecf639f2, Offset: 0x3783
// Size: 0x57
function private function_74ad72d5c3faa0e0( s_gate )
{
    level endon( #"game_ended" );
    
    while ( self.health > 0 )
    {
        b_can_damage = function_509cdc288ce95f14( s_gate );
        
        if ( b_can_damage )
        {
            self setcandamage( 1 );
        }
        else
        {
            self setcandamage( 0 );
        }
        
        wait 1;
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 1, eflags: 0x4
// Checksum 0xd2d771b5, Offset: 0x37e2
// Size: 0xe8, Type: bool
function private function_509cdc288ce95f14( s_gate )
{
    a_zombies_near_gate = getaiarrayinradius( s_gate.origin, 256, level.players[ 0 ].team );
    
    if ( utility::flag( "flag_minecarts_armory_entrance" ) && !isdefined( s_gate.timeout_start ) )
    {
        s_gate.timeout_start = gettime();
        s_gate.timeout_end = s_gate.timeout_start + utility::function_4b74c15943231980( 3 );
    }
    
    n_zombies = 3;
    
    if ( gettime() > s_gate.timeout_end )
    {
        n_zombies = 1;
    }
    
    if ( utility::flag( "flag_minecarts_armory_entrance" ) && a_zombies_near_gate.size >= n_zombies )
    {
        utility::flag_set( "flag_prison_minecarts_zombies_near_gate" );
        return true;
    }
    
    utility::flag_clear( "flag_prison_minecarts_zombies_near_gate" );
    return false;
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0x36cd150, Offset: 0x38d3
// Size: 0x124, Type: bool
function private function_817890260bda8272( attractor, zombie )
{
    if ( !isalive( zombie ) || !isdefined( attractor ) )
    {
        return false;
    }
    
    if ( zombie zombie_base_dismemberment::is_crawling() )
    {
        return false;
    }
    
    if ( zombie utility::ent_flag( "scene_active" ) )
    {
        return false;
    }
    
    if ( isdefined( zombie.directorspawndata.script_noteworthy ) )
    {
        if ( zombie.directorspawndata.script_noteworthy == "armored_building01" )
        {
            if ( utility::flag( "flag_minecarts_building01_gate_opened" ) )
            {
                return true;
            }
        }
        else if ( zombie.directorspawndata.script_noteworthy == "armored_building02" )
        {
            if ( utility::flag( "flag_minecarts_building02_gate_opened" ) )
            {
                return true;
            }
        }
        
        return false;
    }
    
    if ( !utility::flag( "flag_prison_minecarts_zombies_attractor_expand" ) )
    {
        s_minecarts_breakable_barrier = utility::getstruct( "s_minecarts_breakable_barrier", "targetname" );
        
        if ( distance2dsquared( zombie.origin, s_minecarts_breakable_barrier.origin ) > 1048576 )
        {
            return false;
        }
    }
    
    zombie utility::ent_flag_set( "flag_zombie_barrier_attacker" );
    return true;
}

// Namespace namespace_2466a4c786927f0a
// Params 4, eflags: 0x4
// Checksum 0xb262bf62, Offset: 0x3a00
// Size: 0x81
function private function_47c4200d5f02618( barrier, var_2ac6c24c806432f4, var_7d71e31e58069f2d, var_c68402cc845e5bec )
{
    level endon( var_7d71e31e58069f2d );
    utility::flag_wait( var_2ac6c24c806432f4 );
    
    /#
        iprintlnbold( "<dev string:x181>" + var_c68402cc845e5bec );
    #/
    
    wait var_c68402cc845e5bec;
    
    if ( isdefined( barrier.barrier_sm.health ) )
    {
        barrier.barrier_sm.health = 0;
    }
    
    zombie_attractor_manager::remove_attractor( barrier );
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0x2e18eb69, Offset: 0x3a89
    // Size: 0x5, Type: dev
    function function_9d119d41805b1d40()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x540ab8c6, Offset: 0x3a96
// Size: 0xf5
function function_162e972ee20d92ba()
{
    minecarts_manager = spawnstruct();
    var_2b75a939d5b42137 = function_5ecf0f07bdb2ad79( "gemini_prison_minecart_01" );
    var_2b75aa39d5b4236a = function_5ecf0f07bdb2ad79( "gemini_prison_minecart_02" );
    var_2b75ab39d5b4259d = function_5ecf0f07bdb2ad79( "gemini_prison_minecart_03" );
    minecarts_manager.var_a9b20485583a126f = [ var_2b75a939d5b42137.mover_object, var_2b75aa39d5b4236a.mover_object, var_2b75ab39d5b4259d.mover_object ];
    minecarts_manager.a_minecarts = [ var_2b75a939d5b42137, var_2b75aa39d5b4236a, var_2b75ab39d5b4259d ];
    level thread function_5875b3494c610f43( minecarts_manager.a_minecarts );
    level thread function_55e24d4d0c92bfa5();
    utility::array_thread( minecarts_manager.a_minecarts, &gemini_audio::minecart_audio );
    utility::array_thread( minecarts_manager.a_minecarts, &function_b650df9a5320dbd4 );
    return minecarts_manager;
}

// Namespace namespace_2466a4c786927f0a
// Params 1
// Checksum 0x33b7244, Offset: 0x3b94
// Size: 0x229
function function_5ecf0f07bdb2ad79( str_type )
{
    moving_cover = { #a_clip:getentarray( str_type + "_clip", #targetname ), #mover_object:getent( str_type, #targetname ), #id:str_type };
    
    if ( !isdefined( moving_cover.mover_object ) )
    {
        return;
    }
    
    moving_cover.mover_object markkeyframedmover();
    moving_cover.mover_object forcenetfieldhighlod( 1 );
    moving_cover.mover_object setmoveroptimized( 1 );
    moving_cover.mover_object setmoverantilagged( 1 );
    repulsorattach = utility::spawn_tag_origin( moving_cover.mover_object.origin, moving_cover.mover_object.angles );
    repulsorattach.health = 99999;
    repulsorattach linkto( moving_cover.mover_object );
    createnavrepulsor( moving_cover.id + "_navRepulsor", 1000000, repulsorattach, 100, 1 );
    
    foreach ( clip in moving_cover.a_clip )
    {
        clip linkto( moving_cover.mover_object );
        clip markkeyframedmover();
        clip forcenetfieldhighlod( 1 );
        clip setmoveroptimized( 1 );
        clip setmoverantilagged( 1 );
        
        if ( clip.script_noteworthy == str_type + "_platform" )
        {
            clip.moverdoesnotkill = 1;
            clip.carriabletype = 1;
        }
    }
    
    if ( !isdefined( moving_cover ) )
    {
        /#
            iprintlnbold( "<dev string:x1a7>" + str_type );
        #/
        
        return;
    }
    
    moving_cover thread function_22b00505657f2c2d();
    return moving_cover;
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x52ae3fce, Offset: 0x3dc6
// Size: 0x2e
function function_22b00505657f2c2d()
{
    level endon( #"game_ended" );
    utility::flag_wait( "flag_prison_minecarts_barrier_destroyed" );
    destroynavrepulsor( self.id + "_navRepulsor" );
}

// Namespace namespace_2466a4c786927f0a
// Params 1
// Checksum 0x52eec3ba, Offset: 0x3dfc
// Size: 0x197
function function_5875b3494c610f43( a_minecarts )
{
    level endon( #"flag_prison_minecarts_barrier_destroyed", #"flag_minecarts_armory_entrance" );
    animnode = { #angles:( 0, 0, 0 ), #origin:( -47661, 4825, -176 ) };
    animnode scene::set_scriptbundle( "sat_cin_gem_zmb_minecart_push_path" );
    animnode_left = { #angles:( 0, 0, 0 ), #origin:( -47661, 4825, -176 ) };
    animnode_left scene::set_scriptbundle( "sat_cin_gem_zmb_minecart_push_left" );
    animnode_right = { #angles:( 0, 0, 0 ), #origin:( -47661, 4825, -176 ) };
    animnode_right scene::set_scriptbundle( "sat_cin_gem_zmb_minecart_push_right" );
    utility::flag_wait_any( "flag_trig_prison_minecarts_player_entered", "flag_underground_barrier_01_opened" );
    a_minecarts[ 0 ] thread function_36b79e8e36442499();
    animnode childthread function_b99e38bed04b611b( a_minecarts[ 0 ], "path_middle" );
    animnode_left childthread function_b99e38bed04b611b( a_minecarts[ 2 ], "path_left_idle" );
    animnode_right childthread function_b99e38bed04b611b( a_minecarts[ 1 ], "path_right_idle" );
    utility::flag_wait_or_timeout( "flag_trig_prison_minecarts_begin_left_minecart", 8 );
    animnode_left childthread function_b99e38bed04b611b( a_minecarts[ 2 ], "path_left" );
    
    if ( !utility::flag( "flag_prison_minecarts_middle_cart_end" ) )
    {
        utility::flag_wait_or_timeout( "flag_prison_minecarts_middle_cart_end", 3 );
    }
    
    animnode_right childthread function_b99e38bed04b611b( a_minecarts[ 1 ], "path_right" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x5203c21a, Offset: 0x3f9b
// Size: 0x3f
function function_55e24d4d0c92bfa5()
{
    level endon( #"game_ended" );
    level utility::waittill_all_in_array( [ "minecart_anim_zombie_01_spawned", "minecart_anim_zombie_02_spawned", "minecart_anim_zombie_03_spawned" ] );
    level utility::flag_set( "flag_prison_minecarts_pushing_zombies_spawned" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0xb748b77, Offset: 0x3fe2
// Size: 0xc5
function function_36b79e8e36442499()
{
    level endon( #"flag_prison_minecarts_barrier_destroyed", #"flag_minecarts_armory_entrance" );
    utility::flag_wait( "flag_prison_minecarts_middle_cart_end" );
    
    if ( isdefined( level.players[ 0 ] ) )
    {
        molotov_owner = level.players[ 0 ];
        
        if ( isdefined( molotov_owner ) )
        {
            fire_ent = spawn( "script_model", self.mover_object.origin );
            fire_ent.owner = molotov_owner;
            thread molotov::molotov_simulate_impact( fire_ent, self.mover_object.origin, self.mover_object.angles, self, ( 0, 0, 0 ), gettime(), undefined );
        }
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2
// Checksum 0xdc21653c, Offset: 0x40af
// Size: 0x2a2
function function_b99e38bed04b611b( minecart, shotname )
{
    animnode = self;
    a_strings = strtok( minecart.id, "_" );
    id = a_strings[ 3 ];
    
    if ( !isdefined( minecart.zombie ) )
    {
        if ( shotname == "path_middle" )
        {
            thread function_ba93403230dcd3f2( minecart, 1 );
        }
        else
        {
            thread function_ba93403230dcd3f2( minecart );
        }
        
        while ( !isdefined( minecart.zombie ) || !isdefined( minecart.mover_object ) )
        {
            wait 0.1;
        }
        
        level notify( "minecart_anim_zombie_" + id + "_spawned" );
        zombie_tag_pos = minecart.zombie gettagorigin( "J_MainRoot" );
        minecart.var_30ff43a982735c76 = spawn( "script_model", zombie_tag_pos );
        minecart.var_30ff43a982735c76 setmodel( "sat_spawner_zombie_base_sm_friend_hvk" );
        minecart.var_30ff43a982735c76 linktomoveoffset( minecart.zombie, "J_MainRoot", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        minecart.zombie endon( #"notify_prison_minecarts_cancel_minecart_animation" );
    }
    
    minecart.mover_object.animname = "cart" + id;
    minecart.zombie.animname = "zombie" + id;
    
    if ( shotname == "path_left_idle" || shotname == "path_right_idle" )
    {
        animnode thread scene::play( [ minecart.zombie, minecart.mover_object ], shotname );
        return;
    }
    
    animnode scene::play( [ minecart.zombie, minecart.mover_object ], shotname );
    minecart.zombie notify( #"NOTIFY_PRISON_MINECARTS_ANIMATION_COMPLETE" );
    minecart.mover_object thread function_6609fd9c01c988e7();
    
    if ( !isdefined( minecart.nav_obstacle ) )
    {
        minecart.nav_obstacle = createnavobstaclebybounds( minecart.mover_object.origin, ( 80, 40, 80 ), minecart.mover_object.angles );
    }
    
    if ( shotname == "path_middle" )
    {
        utility::flag_set( "flag_prison_minecarts_middle_cart_end" );
        return;
    }
    
    utility::flag_set( "flag_minecarts_cart_reached_end" );
}

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x7ac96082, Offset: 0x4359
// Size: 0x167
function function_b650df9a5320dbd4()
{
    while ( !isdefined( self.mover_object ) || !isdefined( self.zombie ) )
    {
        wait 0.5;
    }
    
    self.zombie endon( #"NOTIFY_PRISON_MINECARTS_ANIMATION_COMPLETE" );
    self.zombie endon( #"notify_prison_minecarts_cancel_minecart_animation" );
    radius = 55;
    distance = radius * radius;
    origin_offset = anglestoforward( self.mover_object.angles ) * -10 + ( 0, 0, 25 );
    
    while ( true )
    {
        foreach ( player in level.players )
        {
            if ( distancesquared( player.origin, self.mover_object.origin + origin_offset ) <= distance )
            {
                player playrumbleonpositionforclient( "train_rumble_light_short", self.mover_object.origin + origin_offset );
            }
        }
        
        wait 1.25;
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2
// Checksum 0xba5eebc1, Offset: 0x44c8
// Size: 0x252
function function_9e7aac4c72a58d43( moving_cover, travel_time )
{
    activity_instance = self;
    level endon( #"game_ended", #"hash_1f5983e20fed56ce" );
    activity_instance endon( #"flag_prison_minecarts_completed" );
    splineid = moving_cover.splineid;
    
    if ( isdefined( moving_cover.animnode ) )
    {
        mover_object = moving_cover.animnode;
    }
    else
    {
        mover_object = moving_cover.mover_object;
    }
    
    if ( !isdefined( splineid ) )
    {
        /#
            iprintlnbold( "<dev string:x1d5>" );
        #/
        
        return 0;
    }
    
    splinepointcount = getcsplinepointcount( splineid );
    splinelength = getcsplinelength( splineid );
    angles = vectortoangles( calccsplinetangent( splineid, 0, 0 ) );
    forward = anglestoforward( angles );
    waittime = 0.05;
    fcount = travel_time / waittime;
    tick = ( splinepointcount - 1 ) / fcount;
    mover_object.angles = angles;
    lambda = 0;
    delta = 0;
    
    if ( splinepointcount < 2 )
    {
        /#
            iprintlnbold( "<dev string:x204>" );
        #/
        
        return 0;
    }
    
    for ( i = 0; i < splinepointcount - 1 ; i++ )
    {
        lambda = abs( 0 + delta );
        
        while ( lambda >= 0 && lambda <= 1 )
        {
            forward = calccsplinetangent( splineid, i, lambda );
            position = calccsplineposition( splineid, i, lambda );
            assert( isdefined( forward ) && isdefined( position ) );
            mover_object.origin = position;
            mover_object.angles = vectortoangles( forward );
            
            if ( lambda < 1 )
            {
                lambda += tick * 2.5;
            }
            
            wait waittime;
        }
        
        delta = lambda - 1;
    }
    
    moving_cover.var_f7303a4df1fa3616 = 1;
    
    if ( mover_object.targetname == "gemini_prison_minecart_02_scene" || mover_object.targetname == "gemini_prison_minecart_03_scene" )
    {
        utility::flag_set( "flag_minecarts_cart_reached_end" );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2
// Checksum 0x77e05748, Offset: 0x4722
// Size: 0xf9
function function_ba93403230dcd3f2( minecart, var_779916dc724c1a33 = 0 )
{
    data = spawnstruct();
    data.minecart = minecart;
    data.activity_instance = self;
    data.var_779916dc724c1a33 = var_779916dc724c1a33;
    groupid = ai_spawn_director::function_e19f6a00c4bb7490( minecart.id + "_zombie", 0, 1, 1, 0, 4 );
    ai_spawn_director::function_35aa3b1d92cd8207( "OnSpawned", groupid, &function_9ee0870fdf53d5e3, data );
    target_struct = utility::getstruct( minecart.id + "_zombie" );
    
    if ( !isdefined( target_struct ) )
    {
        return;
    }
    
    ai_spawn_director::function_9893a28f1d682a28( groupid, "sat_spawner_zombie_base_sm_friend", target_struct.origin, target_struct.angles, undefined, undefined, undefined, level.players[ 0 ].team );
}

// Namespace namespace_2466a4c786927f0a
// Params 4
// Checksum 0x557d6573, Offset: 0x4823
// Size: 0x29f
function function_9ee0870fdf53d5e3( groupid, userdata, agent, var_6d63bc1fea0a37c2 )
{
    agent endon( #"death" );
    minecart = userdata.minecart;
    minecart.zombie = agent;
    minecart.zombie.murderhole_protection = 1;
    minecart.zombie ai::magic_bullet_shield( 1 );
    minecart.zombie gemini_util::function_376f4cf6d212ef9b( 5 );
    msg = utility::waittill_any_ents_return( minecart.zombie, "NOTIFY_PRISON_MINECARTS_ANIMATION_COMPLETE", level, "flag_prison_minecarts_barrier_destroyed" );
    
    if ( userdata.var_779916dc724c1a33 || msg == "flag_prison_minecarts_barrier_destroyed" )
    {
        minecart.zombie notify( #"notify_prison_minecarts_cancel_minecart_animation" );
        
        if ( isdefined( minecart.var_30ff43a982735c76 ) )
        {
            minecart.var_30ff43a982735c76 thread function_4d150d21ed267dd0();
        }
        
        minecart.zombie stopanimscripted();
        utility::flag_set( "flag_prison_minecarts_middle_cart_end" );
        
        if ( isdefined( minecart.zombie.magic_bullet_shield ) )
        {
            minecart.zombie ai::stop_magic_bullet_shield();
        }
        
        waitframe();
        minecart.zombie.murderhole_protection = 0;
        minecart.zombie ai::set_ai_max_health( 1 );
        
        if ( isdefined( level.minecarts_enemy_soldiers.ai_array[ 0 ] ) )
        {
            tempowner = level.minecarts_enemy_soldiers.ai_array[ 0 ];
            tempowner launchgrenade( "sat_frag_grenade_mp", minecart.zombie.origin + ( 0, 0, 10 ), ( 0, 0, 0 ), 0.05 );
        }
        else
        {
            minecart.zombie zombie_base_dismemberment::dismember_annihilate();
            minecart.zombie kill();
        }
        
        return;
    }
    
    if ( msg == "NOTIFY_PRISON_MINECARTS_ANIMATION_COMPLETE" )
    {
        utility::flag_set( "flag_prison_minecarts_side_cart_end" );
        
        if ( isdefined( minecart.var_30ff43a982735c76 ) )
        {
            minecart.var_30ff43a982735c76 thread function_4d150d21ed267dd0();
        }
        
        if ( isdefined( minecart.zombie.magic_bullet_shield ) )
        {
            minecart.zombie ai::stop_magic_bullet_shield();
        }
        
        waitframe();
        minecart.zombie.murderhole_protection = 0;
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x45b6a8b1, Offset: 0x4aca
// Size: 0x22
function private function_4d150d21ed267dd0()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"death" );
    self unlink();
    waitframe();
    self delete();
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0x2ab9bd13, Offset: 0x4af4
// Size: 0x87
function private function_6609fd9c01c988e7()
{
    minecart = self;
    
    foreach ( player in level.players )
    {
        player thread function_e5159405bc687003( minecart );
    }
}

// Namespace namespace_2466a4c786927f0a
// Params 2, eflags: 0x4
// Checksum 0x94e9d5d7, Offset: 0x4b83
// Size: 0x1a9
function private function_e5159405bc687003( minecart, var_21cfe31a5e93b9b9 )
{
    player = self;
    player endon( #"disconnect" );
    level endon( #"game_ended", #"flag_prison_armory_complete" );
    
    if ( !isdefined( var_21cfe31a5e93b9b9 ) )
    {
        var_21cfe31a5e93b9b9 = 10;
    }
    
    var_a31dd176652af061 = 0;
    
    while ( isdefined( player ) )
    {
        if ( var_a31dd176652af061 >= var_21cfe31a5e93b9b9 )
        {
            a_s_start = ob_gametype_story_mission::get_player_spawn_starts( "OB_GEMINI_PRISON_MINECARTS" );
            
            if ( isdefined( a_s_start ) && isdefined( player ) )
            {
                player freezecontrols( 1 );
                waitframe();
                player notify( #"player_teleport_start" );
                player.is_teleporting = 1;
                player playsoundtoplayer( "evt_plr_out_of_bounds_respawn_fall", player );
                player thread ob_story_mission_utils::function_909630e8d19e7cf();
                fade_time = 0.15;
                player hud_util::fade_out( fade_time, "white" );
                wait fade_time;
                coop::teleport_players( [ player ], a_s_start );
                player playsoundtoplayer( "evt_plr_out_of_bounds_respawn", player );
                wait fade_time;
                player hud_util::fade_in( fade_time, "white" );
                player freezecontrols( 0 );
                player.is_teleporting = 0;
                player notify( #"player_teleport_end" );
                namespace_a350a26c6d662a6a::function_9ac30cec520d32b6( "light", 1.5, undefined, player );
            }
            
            break;
        }
        
        if ( !isdefined( minecart ) )
        {
            break;
        }
        
        dist = distance2dsquared( player.origin, ( -48752, 4368, -176 ) );
        
        if ( dist < 1936 && player.origin[ 2 ] < -160 )
        {
            var_a31dd176652af061++;
        }
        else
        {
            var_a31dd176652af061 = 0;
        }
        
        wait 1;
    }
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0x497619ce, Offset: 0x4d34
    // Size: 0x5, Type: dev
    function function_11e5b798bdc59959()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0xb58f80a0, Offset: 0x4d41
// Size: 0x1bc
function private function_4f8e20d66a665423()
{
    activity_instance = self;
    ob_story_mission_utils::objective_text_show( "OB_GEMINI_PRISON_UNDERGROUND" );
    activity_instance.obj_id = gemini_util::function_70fecc661764c00a( "s_obj_prison_underground_02", undefined, undefined, undefined, undefined, "active" );
    level utility::flag_wait_all( "flag_underground_barrier_01_opened", "flag_trig_prison_minecarts_player_entered" );
    ob_story_mission_utils::objective_marker_clear( activity_instance.obj_id );
    waitframe();
    ob_story_mission_utils::objective_text_show( "OB_GEMINI_PRISON_MINECARTS_PUSH" );
    mission_ui::function_759924b87215156b( 0, 1, level.players );
    s_obj = utility::getstruct( "s_obj_prison_minecarts_armory_door", "targetname" );
    
    foreach ( player in level.players )
    {
        activity_instance thread gemini_util::function_8ff6409d7606f259( player, s_obj.origin, 128, undefined, level, "flag_prison_minecarts_barrier_destroyed", undefined, 1500 );
    }
    
    str_flag_returned = level utility::flag_wait_any_return( "flag_trig_prison_minecarts_player_reached_end", "flag_prison_minecarts_barrier_destroyed" );
    waitframe();
    
    if ( str_flag_returned != "flag_prison_minecarts_barrier_destroyed" )
    {
        ob_story_mission_utils::objective_text_show( "OB_GEMINI_PRISON_MINECARTS_BREACH" );
        level utility::flag_wait( "flag_prison_minecarts_barrier_destroyed" );
        mission_ui::function_759924b87215156b( 1, 1, level.players );
    }
    
    activity_instance.obj_id = gemini_util::function_70fecc661764c00a( "s_obj_prison_minecarts_end", undefined, undefined, undefined, undefined, "active" );
    level utility::flag_wait( "flag_prison_minecarts_completed" );
    ob_story_mission_utils::objective_marker_clear( activity_instance.obj_id );
}

// Namespace namespace_2466a4c786927f0a
// Params 0, eflags: 0x4
// Checksum 0xb5004bed, Offset: 0x4f05
// Size: 0x11f
function private function_d67d028e3a76d9a()
{
    e_underground_cart_door_l = getent( "e_underground_cart_door_l", #targetname );
    e_underground_cart_door_r = getent( "e_underground_cart_door_r", #targetname );
    e_underground_cart_door_clip = getent( "e_underground_cart_door_clip", #targetname );
    var_bfda908ba7f13c6e = getentarray( "e_underground_cart_door_clip_outer", #targetname );
    
    if ( isdefined( e_underground_cart_door_l ) )
    {
        e_underground_cart_door_l delete();
    }
    
    if ( isdefined( e_underground_cart_door_r ) )
    {
        e_underground_cart_door_r delete();
    }
    
    if ( isdefined( e_underground_cart_door_clip ) )
    {
        e_underground_cart_door_clip connectpaths();
        e_underground_cart_door_clip delete();
    }
    
    if ( var_bfda908ba7f13c6e.size > 0 )
    {
        foreach ( clip in var_bfda908ba7f13c6e )
        {
            clip connectpaths();
            clip delete();
        }
    }
}

/#

    // Namespace namespace_2466a4c786927f0a
    // Params 0
    // Checksum 0x2a64d6d3, Offset: 0x502c
    // Size: 0x5, Type: dev
    function function_aea1612bc69ce296()
    {
        
    }

#/

// Namespace namespace_2466a4c786927f0a
// Params 0
// Checksum 0x54a51130, Offset: 0x5039
// Size: 0xa3
function prison_minecarts_murderholes()
{
    level endon( #"game_ended" );
    activity_instance = self;
    activity_instance endon( #"activity_ended", #"instance_destroyed" );
    murderhole_data = gemini_util::setup_murderhole_shared_data( "flag_prison_minecarts_barrier_destroyed", "gemini_prison_minecart", "murderhole_idle_struct", "trig_prison_minecarts_murderhole_close", "trig_prison_minecarts_murderhole_safe" );
    murderhole_data.activity_instance = activity_instance;
    murderhole_data.a_turrets = activity_instance gemini_util::setup_murderhole_turrets( "murderhole_source_struct", murderhole_data );
    murderhole_data.var_89471d72b7447daf = activity_instance gemini_util::function_c8fde0e84ad9d3( "murderhole_fake_struct", murderhole_data, "flag_trig_prison_minecarts_player_entered" );
}

