#using script_16ea1b94f0f381b3;
#using script_194f8050b4a6d3a1;
#using script_1aae2eb1ef28b239;
#using script_2a9058c1321cd25d;
#using script_3455b106458253e7;
#using script_4966d09e65e628d2;
#using script_49e4a4c208f44b76;
#using script_4bc38131d8ecd20b;
#using script_52000d51c914acf6;
#using script_60cd1c57e94be8d7;
#using script_636bd827a012af12;
#using script_6c2f6a14fa53759e;
#using script_6fd2f8dba4845b5a;
#using script_7129baf8ee832ed2;
#using script_73a03aaf11b641f5;
#using script_78c71390bb3043df;
#using script_7eca8aa39a084054;
#using script_f01501ac138f999;
#using scripts\asm\asm;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\ai\aitypes\zombie_galileo\zombie_galileo;
#using scripts\common\ai\aitypes\zombie_neptune\zombie_neptune;
#using scripts\common\ai\aitypes\zombie_neptune\zombie_neptune_metabones;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\hud_util;
#using scripts\common\script;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\calloutmarkerping;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\interaction;
#using scripts\mp\loot\common_item;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\activities\ob_activity_strike_boss_shared;
#using scripts\mp\ob\activities\ob_activity_utility;
#using scripts\mp\ob\jailbreak_machine;
#using scripts\mp\ob\systems\ob_item_select;
#using scripts\mp\ob\systems\region_difficulty_manager;
#using scripts\mp\objidpoolmanager;

#namespace ob_activity_strike_boss;

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x5
// Checksum 0x7bef335f, Offset: 0x9d5
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"ob_activity_strike_boss", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xaecb3366, Offset: 0x9fe
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "REV_OB_STRIKE_BOSS", &toxin_bomb_activity_type_init );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x1dc32575, Offset: 0xa19
// Size: 0xe8
function private toxin_bomb_activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "REV_OB_STRIKE_BOSS", 0, &strike_boss_activity_setup );
    activity_common::function_944074f3079c1d4e( "REV_OB_STRIKE_BOSS", 1, &strike_boss_activity_begin );
    activity_common::function_944074f3079c1d4e( "REV_OB_STRIKE_BOSS", 2, &strike_boss_activity_end );
    activity_common::function_944074f3079c1d4e( "REV_OB_STRIKE_BOSS", 3, &strike_boss_activity_destroy );
    activity_common::function_944074f3079c1d4e( "REV_OB_STRIKE_BOSS", 4, &function_c5995ac9729f9432 );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &on_player_joined_activity, "REV_OB_STRIKE_BOSS" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &on_player_left_activity, "REV_OB_STRIKE_BOSS" );
    scriptable::scriptable_addusedcallbackbypart( "strike_boss_cradle_crate", &cradle_crate_used );
    setdvar( @"hash_3f0d3a2d3b10d7ef", 1 );
    level callback::add( "on_zombie_viper_eject", &function_df419e0e03604139 );
    utility::registersharedfunc( #"zombie_neptune", #"hash_fbd76818aa0a93", &function_8edede1864597301 );
    
    /#
        level thread init_devgui();
    #/
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x973d354b, Offset: 0xb09
// Size: 0x283
function private strike_boss_activity_setup()
{
    variant_definition = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    self.bomb_explode_countdown = variant_definition.explodecountdown;
    self.var_124d37318b71248a = variant_definition.var_b0e7811b12bc18cd;
    self.region_difficulty = "difficulty5";
    min_start_time = variant_definition.minstarttime;
    max_start_time = variant_definition.maxstarttime;
    start_time = min_start_time;
    
    if ( max_start_time > min_start_time )
    {
        start_time = randomintrange( min_start_time, max_start_time );
    }
    
    self.boss_circle_radius = get_override_setting( "boss_circle_radius", 2000 );
    self.skip_unlock_join_radius = get_override_setting( "skip_unlock_join_radius", 3000 );
    start_time = get_override_setting( "start_wait", start_time );
    activity_info = level.var_e607236b193eb0c1.var_5992a4946aeeca5a[ self.varianttag ];
    cooldown = activity_info.var_622af9ed9146813f.instancecooldown ?? -1;
    activity_info.var_622af9ed9146813f.instancecooldown = get_override_setting( "respawn_cooldown", cooldown );
    activity_info.var_7045a7bcdef0ce48 = get_override_setting( "max_repeat", 5 );
    self.var_2c7df72824504573 = 0;
    self.var_124d37318b71248a = get_override_setting( "min_boss_damage_ratio", self.var_124d37318b71248a );
    
    /#
        self.bomb_explode_countdown = function_a5cd5a36ccebe58( "<dev string:x24>", self.bomb_explode_countdown );
    #/
    
    self.var_c64d73a547cae97d = level.activity_strike_boss_spawned;
    
    /#
        if ( function_a5cd5a36ccebe58( "<dev string:x3b>", 0 ) == 1 )
        {
            self.var_c64d73a547cae97d = 1;
        }
    #/
    
    setgameprops( %"sat_ob_toxin_bomb" );
    self.s_master = utility::getstruct( self.varianttag, "targetname" );
    phase_structs = [];
    phase_structs = self.s_master utility::get_linked_structs();
    
    /#
        if ( function_12b3b66b7683566b() )
        {
            self.phase_structs = phase_structs;
            function_bc7f37b9e2f7927b();
            return;
        }
    #/
    
    var_b63b359caa131deb = utility::array_random( phase_structs );
    setup_phase_struct( var_b63b359caa131deb );
    self.var_b63b359caa131deb = var_b63b359caa131deb;
    
    if ( !level.activity_strike_boss_spawned && start_time )
    {
        wait start_time;
    }
    
    level.activity_strike_boss_spawned = 1;
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x287d312d, Offset: 0xd94
// Size: 0x3a0
function private strike_boss_activity_begin()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    ob_activity_definition_utils::function_f23bdcfc447427ae( undefined, 0, 1 );
    thread function_66c17bd942de7a99( self.var_b63b359caa131deb, self.var_c64d73a547cae97d );
    self waittill( #"phase_end" );
    
    if ( self.var_124d37318b71248a > 0 )
    {
        var_77013cab2cfe49a5 = [];
        var_ce8e547981b990fb = [];
        var_bfd2870910858fe = self.var_124d37318b71248a * self.var_2c7df72824504573 / 100;
        
        foreach ( player in self.playerparticipants )
        {
            var_3f000c9156465fcf = self.var_d37b5fa0bcc48a74[ player getxuid() ];
            
            if ( !var_3f000c9156465fcf || var_3f000c9156465fcf < var_bfd2870910858fe )
            {
                var_77013cab2cfe49a5[ player getxuid() ] = player;
                continue;
            }
            
            var_ce8e547981b990fb[ player getxuid() ] = player;
        }
        
        foreach ( player in var_77013cab2cfe49a5 )
        {
            squadcredit = 0;
            squad = teams::function_72b89edf6b47c40a( player );
            
            foreach ( squadmate in squad.players )
            {
                if ( squadmate == player )
                {
                    continue;
                }
                
                if ( isplayer( var_ce8e547981b990fb[ squadmate getxuid() ] ) )
                {
                    squadcredit = 1;
                    break;
                }
            }
            
            if ( !squadcredit )
            {
                var_3f000c9156465fcf = self.var_d37b5fa0bcc48a74[ player getxuid() ];
                logstring( "[STRIKE_BOSS] player " + player.name + " removed from activity rewards due to insufficient boss damage: " + ( var_3f000c9156465fcf ?? 0 ) + " / " + self.var_2c7df72824504573 );
                activity_participation::function_61aa2b2879f2c0a2( self, player );
            }
        }
    }
    
    function_125852f491cf7e5d();
    
    foreach ( player in self.playerparticipants )
    {
        if ( player function_5b4e71806497d77a() )
        {
            if ( player function_e3822c24efb138e8() )
            {
                state = " step10 quest active";
            }
            else
            {
                state = " step10 quest complete";
            }
        }
        else if ( player.var_a1bb7e25335e7165 )
        {
            state = " is on quest " + player.var_a1bb7e25335e7165.id;
        }
        else
        {
            state = " have not active quest";
        }
        
        logstring( "[STRIKE_BOSS] " + ( player.name ?? "<player>" ) + state );
    }
    
    activity_instance_common::endactivity( self, 1 );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x57d554bf, Offset: 0x113c
// Size: 0x69
function private strike_boss_activity_end()
{
    self endon( #"instance_destroyed" );
    toxin_bomb_activity_cleanup();
    params = { #radius:self.var_b63b359caa131deb.radius, #origin:self.var_b63b359caa131deb.origin };
    level callback::callback( "activity_nightmare_zone_finish", params );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x55567d19, Offset: 0x11ad
// Size: 0x9
function private strike_boss_activity_destroy()
{
    toxin_bomb_activity_cleanup();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x89025edf, Offset: 0x11be
// Size: 0xb2
function private toxin_bomb_activity_cleanup()
{
    var_b63b359caa131deb = self.var_b63b359caa131deb;
    var_b63b359caa131deb function_8a7d76b89ec2cf8();
    var_b63b359caa131deb cleanup_br_circle();
    var_b63b359caa131deb function_54efd1cd90aee6f0( self );
    var_b63b359caa131deb cleanup_boss_objective_marker();
    var_b63b359caa131deb function_2bb49caeb1c9a07f();
    var_b63b359caa131deb clear_flash();
    var_b63b359caa131deb function_e2772ec04057c99a( self );
    
    if ( var_b63b359caa131deb.cradle_crate_ambient_objective_name )
    {
        function_71799ce2c69ce5a9( var_b63b359caa131deb.cradle_crate_ambient_objective_name );
        var_b63b359caa131deb.cradle_crate_ambient_objective_name = undefined;
    }
    
    if ( var_b63b359caa131deb.boss_ambient_objective_name )
    {
        function_71799ce2c69ce5a9( var_b63b359caa131deb.boss_ambient_objective_name );
        var_b63b359caa131deb.boss_ambient_objective_name = undefined;
    }
    
    ob_activity_strike_boss_shared::function_61aa7b6027b4191e( self );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x20d2b299, Offset: 0x1278
// Size: 0x1f
function private function_c5995ac9729f9432()
{
    return self.var_b63b359caa131deb.cradle_crate.origin;
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x629a21be, Offset: 0x12a0
// Size: 0x35
function private on_player_joined_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
    self.var_b63b359caa131deb function_7156bba523537dac( player_list );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x1de54d83, Offset: 0x12dd
// Size: 0x35
function private on_player_left_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
    self.var_b63b359caa131deb function_530d5e82cd6fa756( player_list );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x7b55da94, Offset: 0x131a
// Size: 0x1dd
function private setup_phase_struct( phasestruct )
{
    boss_type = get_spawn_boss_type();
    boss_structs = phasestruct namespace_be3150865da9d2f1::get_linked_structs_filtered( "boss_spawn", "script_noteworthy" );
    var_8db985351ff268f1 = [];
    
    if ( boss_type == "neptune" )
    {
        foreach ( boss_struct in boss_structs )
        {
            if ( boss_struct.script_parameters == "boss_all" )
            {
                var_8db985351ff268f1[ var_8db985351ff268f1.size ] = boss_struct;
            }
        }
    }
    else
    {
        var_8db985351ff268f1 = boss_structs;
    }
    
    phasestruct.boss_structs = var_8db985351ff268f1;
    phasestruct.s_boss = utility::array_random( var_8db985351ff268f1 );
    phasestruct.s_boss.type = boss_type;
    phasestruct.activity_instance = self;
    phasestruct setup_cradle_crate();
    return_points = phasestruct namespace_be3150865da9d2f1::get_linked_structs_filtered( "return_point", "script_noteworthy" );
    phasestruct.return_points = [];
    
    foreach ( return_point in return_points )
    {
        phasestruct.return_points[ phasestruct.return_points.size ] = return_point.origin;
    }
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x77aab4ae, Offset: 0x14ff
// Size: 0xd2
function private function_a062b5f3ed53f11a( usable, player )
{
    if ( !player function_a142598b91e82b89() )
    {
        return { #string:&"", #type:"HINT_NOICON" };
    }
    
    if ( usable.players_interacting.size )
    {
        if ( arraycontains( usable.players_interacting, player ) )
        {
            return { #string:&"", #type:"HINT_NOICON" };
        }
        else
        {
            return { #string:&"sat_ob_activities/interaction_hacking_in_progress", #type:"HINT_NOBUTTON" };
        }
        
        return;
    }
    
    return { #string:&"sat_ob_activities/contract_taurus_destroy_supplies_interact", #type:"HINT_NOICON" };
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x51a3a6c4, Offset: 0x15d9
// Size: 0x520
function private function_66c17bd942de7a99( phasestruct, skip_unlock )
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    activity_participation::function_5e5913e13bf9cb28( self );
    phasestruct.started = 1;
    
    if ( !skip_unlock )
    {
        namespace_9085ae059032a84f::function_a0a94881bc380bbf( 0, self );
        namespace_9085ae059032a84f::updateprogress( 0, self, 100 );
        phasestruct.cradle_crate setscriptablepartstate( #"strike_boss_cradle_crate", #"usable" );
        phasestruct setup_cradle_crate_objective_marker( self );
        phasestruct notify_players_activity_begin( phasestruct.cradle_crate.objidnum );
        phasestruct.cradle_crate interaction::set_interact_hint_callback( &function_a062b5f3ed53f11a );
        phasestruct.cradle_crate_ambient_objective_name = self.varianttag + "_cradle_crate_ambient_objective";
        function_1c4c7ef874191be2( phasestruct.cradle_crate_ambient_objective_name, phasestruct.cradle_crate.origin, 2000 );
        phasestruct waittill( #"cradle_crate_used", player );
        wait 5;
        spatial_zone_struct = spatial_zone_container::function_847140d2863dfbf8( self, "Awareness_Zone", phasestruct.cradle_crate.origin, 2000, 1 );
        activity_participation::function_a45fd1c5cc774007( self );
        
        if ( player )
        {
            activity_participation::function_bc67362dace4370c( self, player );
        }
        
        phasestruct function_d7abcacdd4b382f5();
        phasestruct function_a76d3530c19ddf03();
        phasestruct function_7156bba523537dac( self.playerparticipants );
        phasestruct waittill( #"hash_745f9dfb87f9cbea" );
        thread activity_ai_encounters::function_ef590f5a067bcaf5();
        function_71799ce2c69ce5a9( phasestruct.cradle_crate_ambient_objective_name );
        phasestruct.cradle_crate_ambient_objective_name = undefined;
        wait 1;
        phasestruct function_2bb49caeb1c9a07f();
        namespace_9085ae059032a84f::function_a0a94881bc380bbf( 1, self );
        namespace_9085ae059032a84f::updateprogress( 0, self, 1 );
        disabled_area = ob_activity_manager::function_2359b9c5c7e92432( phasestruct.origin, phasestruct.radius );
        phasestruct thread function_368a5c717b3f267d();
        phasestruct function_2dd4ea1adec3dd04();
        phasestruct.cradle_crate utility::function_32b24db3127bff40( #"complete_fx", #"on" );
        earthquake( 0.68, 4, phasestruct.cradle_crate.origin, 1200 );
        
        foreach ( player in self.playerparticipants )
        {
            if ( distancesquared( player.origin, phasestruct.cradle_crate.origin ) < 1440000 )
            {
                player playrumbleonentity( "heavy_2s" );
            }
        }
        
        phasestruct thread function_f8161530e839a585();
        bomb_explode_countdown( self.bomb_explode_countdown, phasestruct );
        phasestruct function_8a7d76b89ec2cf8();
        spatial_zone_container::function_ddcd5f35f0032b25( self, "Awareness_Zone", spatial_zone_struct );
        spatial_zone_struct = spatial_zone_container::function_847140d2863dfbf8( self, "Awareness_Zone", phasestruct.origin, phasestruct.radius, 1 );
        ob_activity_strike_boss_shared::function_33d7c1273681ab9f( phasestruct.origin, phasestruct.radius );
        ob_activity_strike_boss_shared::function_faeba2b042cc0dd6( self );
        phasestruct toxin_bomb_explode();
        waitframe();
        phasestruct function_e2772ec04057c99a( self );
        phasestruct setup_explode_objective_marker( self );
        ob_activity_strike_boss_shared::function_e67794b46217642e( self.varianttag + "phase" + phasestruct.phase_index, phasestruct.origin, phasestruct.radius, phasestruct.height );
        ob_activity_strike_boss_shared::function_794686ee5a2eb3b6( phasestruct.origin, phasestruct.radius, phasestruct.cradle_crate.origin );
        phasestruct setup_br_circle( 5 );
    }
    
    namespace_9085ae059032a84f::function_a0a94881bc380bbf( 2, self );
    phasestruct spawn_ai( self, phasestruct.s_boss );
    phasestruct.boss_ambient_objective_name = self.varianttag + "_boss_ambient_objective";
    function_1c4c7ef874191be2( phasestruct.boss_ambient_objective_name, phasestruct.s_boss.origin, 4000 );
    phasestruct waittill( #"boss_killed" );
    function_71799ce2c69ce5a9( phasestruct.boss_ambient_objective_name );
    phasestruct.boss_ambient_objective_name = undefined;
    phasestruct function_54efd1cd90aee6f0( self );
    
    if ( !skip_unlock )
    {
        ob_activity_manager::function_2db7d17b1053ea5b( disabled_area );
        phasestruct function_9402936a7a7a40be();
        phasestruct cleanup_br_circle( 3 );
    }
    
    phasestruct.ended = 1;
    self notify( "phase_" + phasestruct.phase_index + "_end" );
    self notify( #"phase_end" );
    wait 1;
    activity_participation::function_5e5913e13bf9cb28( self );
    
    if ( spatial_zone_struct )
    {
        spatial_zone_container::function_ddcd5f35f0032b25( self, "Awareness_Zone", spatial_zone_struct );
    }
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x52404150, Offset: 0x1b01
// Size: 0x96
function private bomb_explode_countdown( seconds, phasestruct )
{
    if ( seconds )
    {
        hud_util::showsplashtoall( #"hash_8821474d5f6df666" );
        setomnvar( o"ui_world_event_timer", gettime() + seconds * 1000 );
        namespace_9085ae059032a84f::updatetimer( seconds, self );
        waittime = seconds - 7;
        
        if ( waittime > 0 )
        {
            wait waittime;
            phasestruct.flash_finished = 1;
            wait 7;
        }
        else
        {
            phasestruct.flash_finished = 1;
            wait seconds;
        }
    }
    
    namespace_9085ae059032a84f::updatetimer( 0, self );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x50e38aa, Offset: 0x1b9f
// Size: 0x5e
function private toxin_bomb_explode()
{
    self.cradle_crate setscriptablepartstate( #"strike_boss_cradle_crate", #"unusable_destroyed" );
    self.cradle_crate thread clip_remove();
    wait 2;
    hud_util::showsplashtoall( #"hash_23407724e82846c9" );
    player_effective( self.origin, self.radius );
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x4851dd53, Offset: 0x1c05
// Size: 0xea
function private player_effective( explode_pos, radius )
{
    extra_radius = 10000;
    players_near_explosion = getplayersinradius( explode_pos, radius + extra_radius, undefined, 1 );
    
    foreach ( player in players_near_explosion )
    {
        dist = distance( player.origin, explode_pos );
        
        if ( dist <= radius || utility::within_fov( player geteye(), player getplayerangles(), explode_pos, 0.34202 ) )
        {
            player thread function_20dd5f051647ac66();
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x46310604, Offset: 0x1cf7
// Size: 0xcd
function private function_20dd5f051647ac66()
{
    player = self;
    player endon( #"disconnect" );
    player.var_753b31fc1dd0e162 = 1;
    player.var_33cc5b033ddc1c9d = 1;
    player hud_util::function_a7b5c7ac6074b623( "red_tint", "white", ( 0.2, 0, 0.02 ) );
    player playlocalsound( "amb_cradled_start_heavy" );
    player giveandfireoffhand( "sat_ob_activity_crash_site_blast_start" );
    player thread hud_util::fade_out( 1, "red_tint" );
    msg = player utility::waittill_notify_or_timeout_return( "death", 1.5 );
    
    if ( msg != "death" )
    {
        player thread hud_util::fade_in( 1, "red_tint" );
    }
    
    player.var_753b31fc1dd0e162 = undefined;
    player.var_33cc5b033ddc1c9d = undefined;
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xeac8ac58, Offset: 0x1dcc
// Size: 0x61
function private setup_br_circle( duration )
{
    self.br_circle = spawnbrcircle( self.origin[ 0 ], self.origin[ 1 ], 0 );
    self.br_circle brcirclemoveto( self.origin[ 0 ], self.origin[ 1 ], self.radius, duration );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xa4a76d33, Offset: 0x1e35
// Size: 0x79
function private cleanup_br_circle( duration )
{
    level endon( #"game_ended" );
    
    if ( !self.br_circle )
    {
        return;
    }
    
    br_circle = self.br_circle;
    self.br_circle = undefined;
    
    if ( duration )
    {
        br_circle brcirclemoveto( br_circle.origin[ 0 ], br_circle.origin[ 1 ], 0, duration );
        wait duration;
    }
    
    br_circle delete();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xe36b80d8, Offset: 0x1eb6
// Size: 0x2e
function private function_d178d3a6203f9dda()
{
    speed_value = "run";
    
    if ( self.subclass == "zombie_neptune" )
    {
        speed_value = "sprint";
    }
    
    return speed_value;
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x582b51ca, Offset: 0x1eed
// Size: 0x1f8
function private function_86e8446c583cf643( position )
{
    agent = self;
    agent endon( #"death" );
    agent clearbtgoal( 0 );
    agent clearbtgoal( 1 );
    agent clearbtgoal( 3 );
    
    if ( self.subclass == "zombie_galileo" )
    {
        zombie_galileo::teleport_to_location( position + ( 0, 0, 50 ) );
        agent clearenemy();
        return 1;
    }
    
    wait randomfloatrange( 1, 2 );
    agent setbtgoalpos( 0, position );
    agent setbtgoalpos( 1, position );
    agent setbtgoalradius( 0, 256 );
    agent setbtgoalradius( 1, 256 );
    speed_value = agent function_d178d3a6203f9dda();
    agent zombie_utils::function_a8ce00e0448cb6f0( speed_value, "oob", 1000 );
    
    while ( true )
    {
        msg = agent utility::waittill_any_timeout( 1, "goal", "bad_path", "goal_reached", "bt_goal" );
        
        if ( msg != "timeout" )
        {
            if ( msg == "bad_path" )
            {
                /#
                    script::demoforcesre( "<dev string:x4c>" + agent.origin + "<dev string:x86>" + position );
                    debugstar( agent.origin, ( 1, 0, 0 ), 10000, "<dev string:x8d>", 1 );
                    debugstar( position, ( 1, 0, 0 ), 10000, "<dev string:x9b>", 1 );
                #/
                
                bad_path = 1;
            }
            else
            {
                goalreached = 1;
            }
        }
        
        if ( bad_path || goalreached || distance( agent.origin, position ) <= 256 )
        {
            break;
        }
    }
    
    agent clearbtgoal( 0 );
    agent clearbtgoal( 1 );
    agent clearbtgoal( 3 );
    agent clearenemy();
    agent zombie_utils::function_a8ce00e0448cb6f0( undefined, "oob", 1000 );
    return goalreached;
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0x5e15a54e, Offset: 0x20ee
// Size: 0x231
function private function_fd5d1c4d005b2eba( var_b63b359caa131deb, return_points, origin, radius )
{
    activity_instance = var_b63b359caa131deb.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    self endon( #"death" );
    
    if ( !isdefined( return_points ) )
    {
        return_points = var_b63b359caa131deb.return_points;
    }
    
    if ( !isdefined( origin ) )
    {
        origin = var_b63b359caa131deb.origin;
    }
    
    if ( !isdefined( radius ) )
    {
        radius = var_b63b359caa131deb.radius;
    }
    
    while ( true )
    {
        max_path_distance = get_override_setting( "path_distance", 5000 );
        distance = distance2d( self.origin, origin );
        is_oob = distance > radius;
        
        if ( is_oob )
        {
            target_point = self.spawn_point;
            
            if ( !target_point || distance2d( target_point, self.origin ) > 5000 )
            {
                if ( return_points )
                {
                    target_point = utility::function_4325398d215ecda5( self.origin, return_points, max_path_distance );
                    
                    /#
                        if ( function_12b3b66b7683566b() )
                        {
                            foreach ( point in return_points )
                            {
                                sphere( point, 50, ( 1, 0, 0 ), 0, 10000 );
                            }
                        }
                    #/
                }
                
                if ( !target_point )
                {
                    target_point = origin;
                    
                    if ( distance > max_path_distance )
                    {
                        target_point = self.origin + ( origin - self.origin ) * max_path_distance / distance;
                    }
                }
            }
            
            rally_point = getclosestpointonnavmesh( target_point, self );
            
            /#
                if ( function_12b3b66b7683566b() )
                {
                    sphere( rally_point, 100, ( 0, 1, 0 ), 0, 10000 );
                }
            #/
            
            if ( !function_86e8446c583cf643( rally_point ) )
            {
                break;
            }
        }
        
        waitframe();
    }
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0xf637d6a7, Offset: 0x2327
// Size: 0x45f
function private function_49aec247af5e6f8e( agent, var_ae9703559d262883 )
{
    var_b63b359caa131deb = self;
    activity_instance = var_b63b359caa131deb.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    agent endon( #"death" );
    var_b63b359caa131deb.objective_visible_players = [];
    circle_visible_players = [];
    var_cd6d1883c5480c45 = [];
    objective_removeallclientsfrommask( var_b63b359caa131deb.objidnum );
    
    while ( true )
    {
        if ( var_b63b359caa131deb.var_9b25ffe2ea627147 )
        {
            waitframe();
        }
        
        origin = agent.origin;
        
        if ( distance2d( origin, var_b63b359caa131deb game_utility::questcircle_getorigin() ) > activity_instance.boss_circle_radius )
        {
            var_8ab3796720882ae2 = function_58a48b475151b2ca( origin );
            var_b63b359caa131deb game_utility::questcircle_move( var_8ab3796720882ae2 );
            objidpoolmanager::update_objective_position( var_b63b359caa131deb.var_f5c810a9fb1c44a7, var_8ab3796720882ae2 + ( 0, 0, 500 ) );
        }
        
        var_dd31ae14e0da26a7 = getplayersinradius( var_b63b359caa131deb.origin, var_b63b359caa131deb.radius );
        players_in_circle = getplayersinradius( origin, var_ae9703559d262883 );
        var_47e5dc4547b7bf15 = arrayintersection( players_in_circle, var_dd31ae14e0da26a7 );
        var_7ed1757c5990cc75 = arrayremove( var_b63b359caa131deb.objective_visible_players, var_47e5dc4547b7bf15 );
        namespace_d7fa4530141146a5::function_831cf83f2b250537( var_7ed1757c5990cc75, var_b63b359caa131deb.var_a1e462ff5f205346 );
        var_b63b359caa131deb hide_boss_healthbar( var_7ed1757c5990cc75 );
        var_7f018ac8429ecb8c = arrayremove( var_47e5dc4547b7bf15, var_b63b359caa131deb.objective_visible_players );
        namespace_d7fa4530141146a5::function_7c5730b9151d91( var_7f018ac8429ecb8c, var_b63b359caa131deb.var_a1e462ff5f205346 );
        var_b63b359caa131deb update_boss_healthbar( var_7f018ac8429ecb8c );
        var_b63b359caa131deb.objective_visible_players = var_47e5dc4547b7bf15;
        var_10ed0875aab33010 = arrayremove( var_dd31ae14e0da26a7, var_47e5dc4547b7bf15 );
        new_circle_visible_players = arrayremove( var_10ed0875aab33010, circle_visible_players );
        
        foreach ( player in new_circle_visible_players )
        {
            var_b63b359caa131deb game_utility::questcircle_showtoplayer( player );
        }
        
        namespace_d7fa4530141146a5::function_7c5730b9151d91( new_circle_visible_players, var_b63b359caa131deb.var_f5c810a9fb1c44a7 );
        var_aff02970e376eb6c = arrayremove( circle_visible_players, var_10ed0875aab33010 );
        
        foreach ( player in var_aff02970e376eb6c )
        {
            var_b63b359caa131deb game_utility::questcircle_hidefromplayer( player );
        }
        
        namespace_d7fa4530141146a5::function_831cf83f2b250537( var_aff02970e376eb6c, var_b63b359caa131deb.var_f5c810a9fb1c44a7 );
        circle_visible_players = var_10ed0875aab33010;
        var_9151a8848e2247c8 = function_d9c71b6666747ae9();
        var_912cd4565b3b9a71 = arrayremove( level.players, var_dd31ae14e0da26a7 );
        var_bed2a9141c3ed261 = arrayintersection( var_912cd4565b3b9a71, var_9151a8848e2247c8 );
        var_c51626b8a9bf7a = arrayremove( var_bed2a9141c3ed261, var_cd6d1883c5480c45 );
        
        foreach ( player in var_c51626b8a9bf7a )
        {
            objective_addclienttomask( var_b63b359caa131deb.objidnum, player );
        }
        
        var_bfc125e3408d6e2f = arrayremove( var_cd6d1883c5480c45, var_bed2a9141c3ed261 );
        
        foreach ( player in var_bfc125e3408d6e2f )
        {
            objective_removeclientfrommask( var_b63b359caa131deb.objidnum, player );
        }
        
        var_cd6d1883c5480c45 = var_bed2a9141c3ed261;
        wait 0.1;
    }
}

// Namespace ob_activity_strike_boss
// Params 3, eflags: 0x4
// Checksum 0x8f0bcefa, Offset: 0x278e
// Size: 0x334
function private function_414c5c7df7ca737f( agent, var_ae9703559d262883, var_554da2cf5cdf6684 )
{
    var_b63b359caa131deb = self;
    activity_instance = var_b63b359caa131deb.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    agent endon( #"death" );
    var_b63b359caa131deb.objective_visible_players = [];
    circle_visible_players = [];
    
    while ( true )
    {
        if ( var_b63b359caa131deb.var_9b25ffe2ea627147 )
        {
            waitframe();
        }
        
        origin = agent.origin;
        
        if ( distance2d( origin, var_b63b359caa131deb game_utility::questcircle_getorigin() ) > activity_instance.boss_circle_radius )
        {
            var_8ab3796720882ae2 = function_58a48b475151b2ca( origin );
            var_b63b359caa131deb game_utility::questcircle_move( var_8ab3796720882ae2 );
            objidpoolmanager::update_objective_position( var_b63b359caa131deb.var_f5c810a9fb1c44a7, var_8ab3796720882ae2 + ( 0, 0, 500 ) );
        }
        
        var_dd31ae14e0da26a7 = getplayersinradius( origin, var_554da2cf5cdf6684 );
        players_in_circle = getplayersinradius( origin, var_ae9703559d262883 );
        var_47e5dc4547b7bf15 = arrayintersection( players_in_circle, var_dd31ae14e0da26a7 );
        var_9151a8848e2247c8 = function_d9c71b6666747ae9();
        var_b7cdb13f72ee76fb = arrayremove( var_9151a8848e2247c8, players_in_circle );
        var_7ed1757c5990cc75 = arrayremove( var_b63b359caa131deb.objective_visible_players, var_47e5dc4547b7bf15 );
        namespace_d7fa4530141146a5::function_831cf83f2b250537( var_7ed1757c5990cc75, var_b63b359caa131deb.var_a1e462ff5f205346 );
        var_b63b359caa131deb hide_boss_healthbar( var_7ed1757c5990cc75 );
        var_7f018ac8429ecb8c = arrayremove( var_47e5dc4547b7bf15, var_b63b359caa131deb.objective_visible_players );
        namespace_d7fa4530141146a5::function_7c5730b9151d91( var_7f018ac8429ecb8c, var_b63b359caa131deb.var_a1e462ff5f205346 );
        var_b63b359caa131deb update_boss_healthbar( var_7f018ac8429ecb8c );
        var_b63b359caa131deb.objective_visible_players = var_47e5dc4547b7bf15;
        var_ba85bf248fc7586d = arrayremove( activity_instance.playerparticipants, players_in_circle );
        var_516d8906d9624a = arraycombineunique( var_ba85bf248fc7586d, var_b7cdb13f72ee76fb );
        new_circle_visible_players = arrayremove( var_516d8906d9624a, circle_visible_players );
        
        foreach ( player in new_circle_visible_players )
        {
            var_b63b359caa131deb game_utility::questcircle_showtoplayer( player );
        }
        
        namespace_d7fa4530141146a5::function_7c5730b9151d91( new_circle_visible_players, var_b63b359caa131deb.var_f5c810a9fb1c44a7 );
        var_aff02970e376eb6c = arrayremove( circle_visible_players, var_516d8906d9624a );
        
        foreach ( player in var_aff02970e376eb6c )
        {
            var_b63b359caa131deb game_utility::questcircle_hidefromplayer( player );
        }
        
        namespace_d7fa4530141146a5::function_831cf83f2b250537( var_aff02970e376eb6c, var_b63b359caa131deb.var_f5c810a9fb1c44a7 );
        circle_visible_players = var_516d8906d9624a;
        wait 0.1;
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xa19801b0, Offset: 0x2aca
// Size: 0x19
function private function_58a48b475151b2ca( bossorigin )
{
    return utility::function_9e0df7b136ab833c() * 500 + bossorigin;
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xb0b16c65, Offset: 0x2aec
// Size: 0x199
function private setup_boss_objective_marker( agent )
{
    phasestruct = self;
    activityinstance = self.activity_instance;
    circle_origin = function_58a48b475151b2ca( agent.origin );
    phasestruct game_utility::questcircle_create( "Toxin_Bomb_Boss_Ob", circle_origin, 2000 );
    phasestruct game_utility::questcircle_hidefromall();
    phasestruct.var_f5c810a9fb1c44a7 = activityinstance namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_red_flood_boss_marker", 0, 0 );
    objective_showtoplayersinmask( phasestruct.var_f5c810a9fb1c44a7 );
    objective_removeallfrommask( phasestruct.var_f5c810a9fb1c44a7 );
    objidpoolmanager::update_objective_position( phasestruct.var_f5c810a9fb1c44a7, circle_origin + ( 0, 0, 500 ) );
    setup_hovercard( phasestruct.var_f5c810a9fb1c44a7 );
    phasestruct.var_a1e462ff5f205346 = activityinstance namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_red_flood_boss_marker", 0, 0 );
    objidpoolmanager::update_objective_onentity( phasestruct.var_a1e462ff5f205346, agent );
    objective_showtoplayersinmask( phasestruct.var_a1e462ff5f205346 );
    objective_removeallfrommask( phasestruct.var_a1e462ff5f205346 );
    setup_hovercard( phasestruct.var_a1e462ff5f205346 );
    function_92750efba138579a();
    
    if ( activityinstance.var_c64d73a547cae97d )
    {
        objidpoolmanager::update_objective_state( phasestruct.var_f5c810a9fb1c44a7, "active" );
        phasestruct thread function_414c5c7df7ca737f( agent, 2000, activityinstance.skip_unlock_join_radius );
        notify_players_activity_begin( phasestruct.var_f5c810a9fb1c44a7 );
        return;
    }
    
    phasestruct thread function_49aec247af5e6f8e( agent, 2000 );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xe9c7d478, Offset: 0x2c8d
// Size: 0x7e
function private function_7871d7bfff217343()
{
    boss = self.current_boss;
    
    if ( boss.subclass == "zombie_neptune" )
    {
        switch ( boss.n_fight_phase )
        {
            case 1:
                return 200;
            case 2:
                return 280;
            case 3:
                return 380;
            default:
                return 200;
        }
    }
    
    return 140;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x28bbf644, Offset: 0x2d14
// Size: 0x7b
function private function_92750efba138579a()
{
    if ( self.var_a1e462ff5f205346 )
    {
        height = function_7871d7bfff217343();
        objidpoolmanager::update_objective_setzoffset( self.var_a1e462ff5f205346, height );
        self.var_9b25ffe2ea627147 = 1;
        namespace_d7fa4530141146a5::function_831cf83f2b250537( self.objective_visible_players, self.var_a1e462ff5f205346 );
        waitframe();
        namespace_d7fa4530141146a5::function_7c5730b9151d91( self.objective_visible_players, self.var_a1e462ff5f205346 );
        waitframe();
        self.var_9b25ffe2ea627147 = undefined;
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x3b6e348d, Offset: 0x2d97
// Size: 0x81
function private cleanup_boss_objective_marker()
{
    if ( self.var_f5c810a9fb1c44a7 )
    {
        self.activity_instance namespace_d7fa4530141146a5::function_501e44ea1cb9219d( self.var_f5c810a9fb1c44a7 );
        self.var_f5c810a9fb1c44a7 = undefined;
    }
    
    if ( self.var_a1e462ff5f205346 )
    {
        self.activity_instance namespace_d7fa4530141146a5::function_501e44ea1cb9219d( self.var_a1e462ff5f205346 );
        self.var_a1e462ff5f205346 = undefined;
    }
    
    game_utility::questcircle_delete();
    hide_boss_healthbar( self.objective_visible_players );
    self.objective_visible_players = undefined;
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0xc
// Checksum 0xcff73118, Offset: 0x2e20
// Size: 0xe6
function private boss_killed_process( boss )
{
    self notify( #"hash_a35c26e7df941db" );
    self endon( #"hash_a35c26e7df941db" );
    activity_instance = self.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance.reward_pos = boss.origin;
    
    if ( activity_instance.var_c64d73a547cae97d )
    {
        if ( boss.var_913f4c7e63bf151f )
        {
            spatial_zone_container::function_ddcd5f35f0032b25( activity_instance, "Awareness_Zone", boss.var_913f4c7e63bf151f );
            activity_participation::function_5e5913e13bf9cb28( activity_instance );
            activity_participation::function_3edfb79e1bae6698( activity_instance );
        }
    }
    
    if ( boss.subclass == "zombie_neptune" )
    {
        wait 5;
    }
    
    self.boss_killed = 1;
    self notify( #"boss_killed" );
    cleanup_boss_objective_marker();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xf269d9cb, Offset: 0x2f0e
// Size: 0x32
function private on_boss_killed( params )
{
    var_b63b359caa131deb = self.var_b63b359caa131deb;
    
    if ( !var_b63b359caa131deb )
    {
        return;
    }
    
    var_b63b359caa131deb thread boss_killed_process( self );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x95527778, Offset: 0x2f48
// Size: 0x154
function private function_125852f491cf7e5d()
{
    spawn_pos = self.reward_pos;
    
    if ( getdvarint( @"hash_5405370ce35bfb0f", 1 ) == 1 )
    {
        timersec = getdvarint( @"hash_98f90bc50d795949", 120 );
        level thread jailbreak_machine::function_455ec409a27f78d9( spawn_pos, self.playerparticipants, timersec );
        return;
    }
    
    spawn_options = common_item::items_initspawnoptions_spawnfromposition( spawn_pos );
    exotic_weapon = common_item::function_61c2c0251e742ffd( %"hash_6746660b468e32bb", undefined, spawn_options );
    exotic_weapon.scriptable_index = exotic_weapon getscriptableindex();
    ob_item_select::function_1dfd8b3bc8e33dd8( exotic_weapon );
    ob_item_select::function_923ddf97f6cdbee( exotic_weapon, self.playerparticipants );
    
    foreach ( player in self.playerparticipants )
    {
        ping_id = player calloutmarkerping::function_920a63c06abdefe8( exotic_weapon.scriptable_index );
        player calloutmarkerping_hide( ping_id );
        player calloutmarkerping_show( ping_id, player );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x67b16052, Offset: 0x30a4
// Size: 0x63
function private create_boss_healthbar( boss )
{
    self.boss_healthbar_asset = boss get_boss_healthbar_asset();
    boss.ob_boss_healthbar_priority = 1;
    
    if ( boss.subclass == "zombie_neptune" )
    {
        neptune_func = &zombie_neptune::function_aa647407d5c4af0;
        boss zombie_boss_healthbar::function_d16104a6c7125d2d( neptune_func );
    }
    
    boss thread function_b9d89bb349dd89c9();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xceae4911, Offset: 0x310f
// Size: 0x54
function private function_b9d89bb349dd89c9()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"damage" );
        visible_players = self.var_b63b359caa131deb.objective_visible_players;
        self.var_b63b359caa131deb update_boss_healthbar( visible_players );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x55190904, Offset: 0x316b
// Size: 0xbd
function private function_4277594377debb5b( params )
{
    visible_players = self.var_b63b359caa131deb.objective_visible_players;
    
    foreach ( player in visible_players )
    {
        if ( player.var_71c37977095602df == self.var_b63b359caa131deb.boss_healthbar_asset )
        {
            player ob_story_mission_utils::player_boss_healthbar_immune();
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xb90f92f, Offset: 0x3230
// Size: 0xbd
function private function_eee51fa9c4016f7( params )
{
    visible_players = self.var_b63b359caa131deb.objective_visible_players;
    
    foreach ( player in visible_players )
    {
        if ( player.var_71c37977095602df == self.var_b63b359caa131deb.boss_healthbar_asset )
        {
            player ob_story_mission_utils::player_boss_healthbar_show();
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xe3edfcbe, Offset: 0x32f5
// Size: 0x10a
function private function_568aa46f55672ff9()
{
    self endon( #"death" );
    level endon( #"game_ended" );
    
    if ( !self.var_b63b359caa131deb )
    {
        return;
    }
    
    activity_instance = self.var_b63b359caa131deb.activity_instance;
    
    while ( true )
    {
        self waittill( #"damage", damage, attacker );
        attackerplayer = isplayer( attacker ) ? attacker : attacker.owner;
        
        if ( isplayer( attackerplayer ) )
        {
            activity_instance = self.var_b63b359caa131deb.activity_instance;
            
            if ( !isdefined( activity_instance.var_d37b5fa0bcc48a74 ) )
            {
                activity_instance.var_d37b5fa0bcc48a74 = [];
            }
            
            var_d37b5fa0bcc48a74 = activity_instance.var_d37b5fa0bcc48a74;
            
            if ( !isdefined( var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] ) )
            {
                var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] = 0;
            }
            
            var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] += damage;
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x7832ce5e, Offset: 0x3407
// Size: 0xdc
function private function_ee796d3f0bfba9ed( params )
{
    if ( !self.var_b63b359caa131deb )
    {
        return;
    }
    
    eattacker = params.eattacker;
    attackerplayer = isplayer( eattacker ) ? eattacker : eattacker.owner;
    
    if ( isplayer( attackerplayer ) )
    {
        activity_instance = self.var_b63b359caa131deb.activity_instance;
        
        if ( !isdefined( activity_instance.var_d37b5fa0bcc48a74 ) )
        {
            activity_instance.var_d37b5fa0bcc48a74 = [];
        }
        
        var_d37b5fa0bcc48a74 = activity_instance.var_d37b5fa0bcc48a74;
        
        if ( !isdefined( var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] ) )
        {
            var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] = 0;
        }
        
        var_d37b5fa0bcc48a74[ attackerplayer getxuid() ] += params.idamage;
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xa25c3f5d, Offset: 0x34eb
// Size: 0x17
function private awareness_zone_get_center( agent )
{
    return agent.origin;
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0xde76ae4a, Offset: 0x350b
// Size: 0x3ba
function private boss_spawned_callback( requestid, userdata, agent, data )
{
    var_b63b359caa131deb = userdata[ 0 ];
    boss_struct = userdata[ 1 ];
    activity_instance = var_b63b359caa131deb.activity_instance;
    var_b63b359caa131deb.current_boss = agent;
    agent.var_e94a0381e288005e = #"hash_99917007a6eaa6b4";
    agent.suppress_minimap_icon = 1;
    agent.var_33d9fb83f023e633 = 1;
    agent._blackboard.zombiewanderorigin = boss_struct.origin;
    agent._blackboard.var_8d11b98561e1eb81 = 100;
    agent._blackboard.var_8d34ab856208146f = 200;
    agent.var_b63b359caa131deb = var_b63b359caa131deb;
    agent.spawn_point = agent.origin;
    
    if ( agent.subclass == "zombie_galileo" )
    {
        agent zombie_galileo::deploy();
        agent callback::add( "on_galileo_immune", &function_4277594377debb5b );
        agent callback::add( "on_galileo_non_immune", &function_eee51fa9c4016f7 );
    }
    else if ( agent.subclass == "zombie_neptune" )
    {
        agent callback::add( #"hash_b5e0b8a43edf3a0a", &function_587dbbd84b2564b5 );
        agent zombie_utils::function_dfae6a5bd222c586( &function_d22e024c904e080c );
        agent callback::add( #"hash_696b6f168d1d9c5c", &function_4575ac53c34c4acc );
    }
    
    var_2c1fe57a11983137 = 0;
    
    if ( agent.subclass == "zombie_viper_hvt" )
    {
        var_98c94d1c3650d11b = function_b3988325430ce242( agent.zombieaisettings.var_d3de1a9faac42deb.ejectedsubclass );
        
        if ( !agent.var_c3746c711044489d && var_98c94d1c3650d11b )
        {
            var_2c1fe57a11983137 = 1;
            
            if ( !isdefined( agent.var_e128f7e1227e3b81 ) )
            {
                agent.var_e128f7e1227e3b81 = {};
            }
            
            agent.var_e128f7e1227e3b81.var_b63b359caa131deb = var_b63b359caa131deb;
            agent.var_e128f7e1227e3b81.spawn_point = agent.spawn_point;
            agent.var_e94a0381e288005e = undefined;
        }
    }
    
    if ( !var_2c1fe57a11983137 )
    {
        agent callback::add( #"on_ai_killed", &on_boss_killed );
    }
    
    var_b63b359caa131deb create_boss_healthbar( agent );
    var_b63b359caa131deb setup_boss_objective_marker( agent );
    
    if ( agent.subclass == "zombie_neptune" )
    {
        agent thread function_fd5d1c4d005b2eba( var_b63b359caa131deb, [], boss_struct.origin, boss_struct.radius );
    }
    else
    {
        agent thread function_fd5d1c4d005b2eba( var_b63b359caa131deb );
    }
    
    /#
        var_f791e93cc48c0c97 = function_a5cd5a36ccebe58( "<dev string:xae>", 0 );
        
        if ( var_f791e93cc48c0c97 )
        {
            agent.maxhealth = var_f791e93cc48c0c97;
            agent.health = var_f791e93cc48c0c97;
        }
    #/
    
    activity_instance.var_2c7df72824504573 += agent.health;
    agent callback::add( #"on_ai_killed", &function_ee796d3f0bfba9ed );
    agent thread function_568aa46f55672ff9();
    
    if ( activity_instance.var_c64d73a547cae97d )
    {
        spatial_zone_container::function_5252f95edcf9e32c( activity_instance, "Awareness_Zone", &awareness_zone_get_center, [ agent ] );
        var_913f4c7e63bf151f = spatial_zone_container::function_847140d2863dfbf8( activity_instance, "Awareness_Zone", undefined, activity_instance.skip_unlock_join_radius );
        activity_participation::function_a45fd1c5cc774007( activity_instance );
        agent.var_913f4c7e63bf151f = var_913f4c7e63bf151f;
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xe5da590a, Offset: 0x38cd
// Size: 0xa3
function private function_d22e024c904e080c( params )
{
    if ( self getaiblackboarddynamic( "immune" ) )
    {
        return 0;
    }
    
    damage = params.idamage;
    
    if ( self.n_fight_phase < 3 && self.health - damage < self.maxhealth - self.maxhealth / 3 * self.n_fight_phase )
    {
        damage = self.health - self.maxhealth - self.maxhealth / 3 * self.n_fight_phase + 1;
    }
    
    return damage;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x4fac8d91, Offset: 0x3979
// Size: 0x81
function private get_boss_healthbar_asset()
{
    switch ( self.subclass )
    {
        case #"hash_37f10bbc40bd509d":
            return "ob_boss_viper";
        case #"hash_736757d9a4744e":
        case #"hash_113b5b5dbf0d98af":
            return "ob_boss_viper_mini";
        case #"hash_cbf6d6666fca2f7d":
            return "ob_boss_galileo";
        case #"hash_da25b9d8214181":
            return "ob_boss_neptune";
        default:
            assertmsg( "<dev string:xba>" );
            return;
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xa9c1861, Offset: 0x3a02
// Size: 0x14f
function private function_8878a4153f4ddcbd( player )
{
    if ( !self.current_boss )
    {
        return;
    }
    
    player endon( #"disconnect" );
    
    if ( !player zombie_boss_healthbar::function_44d523f97fcaa324() )
    {
        if ( !player.var_71c37977095602df )
        {
            player ob_story_mission_utils::function_16e0adef86e5d052( self.boss_healthbar_asset, self.current_boss );
        }
        else if ( player.var_71c37977095602df == self.boss_healthbar_asset )
        {
            player ob_story_mission_utils::player_boss_healthbar_show();
        }
        else if ( player ob_story_mission_utils::function_6ec505041dcea08e( self.current_boss ) )
        {
            player ob_story_mission_utils::function_5a707116af438c92();
            player ob_story_mission_utils::function_16e0adef86e5d052( self.boss_healthbar_asset, self.current_boss );
        }
    }
    else if ( player ob_story_mission_utils::function_6ec505041dcea08e( self.current_boss ) )
    {
        player ob_story_mission_utils::function_5a707116af438c92();
        player ob_story_mission_utils::function_16e0adef86e5d052( self.boss_healthbar_asset, self.current_boss );
    }
    
    if ( player.var_71c37977095602df == self.boss_healthbar_asset )
    {
        if ( self.current_boss.immune || self.current_boss getaiblackboarddynamic( "immune" ) )
        {
            player ob_story_mission_utils::player_boss_healthbar_immune();
        }
        
        player ob_story_mission_utils::function_e231206f1628d4c6( 1 );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x6c630955, Offset: 0x3b59
// Size: 0x7e
function private update_boss_healthbar( players )
{
    foreach ( player in players )
    {
        thread function_8878a4153f4ddcbd( player );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x6a3050fa, Offset: 0x3bdf
// Size: 0x96
function private hide_boss_healthbar( players )
{
    foreach ( player in players )
    {
        if ( player.var_71c37977095602df == self.boss_healthbar_asset )
        {
            player ob_story_mission_utils::function_5a707116af438c92();
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0xc
// Checksum 0x46ec2ad8, Offset: 0x3c7d
// Size: 0x1ba
function private function_587dbbd84b2564b5( params )
{
    self notify( #"hash_7c1ed44e49521b12" );
    self endon( #"hash_7c1ed44e49521b12" );
    level endon( #"game_ended" );
    self endon( #"death" );
    settings = self.zombieaisettings.var_d3de1a9faac42deb;
    
    if ( self.n_fight_phase >= 2 )
    {
        self.var_6b413efe024099f0 = 1;
        self.always_knockback = 1;
        self.melee_damage = settings.meleedamage;
        self.knockback_strength = settings.knockbackstrength;
        self.knockback_angle = settings.knockbackangle;
        self.var_8eed320b7873f7d6 = settings.var_6707cfb0acb9e092;
        self.var_2966c3d9ec29d388 = settings.var_402bd8e634cdb1bc;
    }
    
    self function_786bb6aa1b76c7ee( "immune", 1 );
    function_4277594377debb5b();
    thread utility::callsharedfunc( #"zombie_neptune", #"hash_5bde7c89509f5672" );
    utility::waittill_any_in_array( [ "transition_explode_end", "special_pain_end" ] );
    increase_fight_phase();
    hide_neptune();
    wait settings.transitionwait;
    thread utility::callsharedfunc( #"zombie_neptune", #"hash_de07abc80a636fba" );
    utility::waittill_notify_or_timeout( "transition_trails_done", 9 );
    show_neptune();
    zombie_neptune_metabones::reset_metabones();
    zombie_neptune_metabones::function_4f4390eb16a079e7();
    self function_786bb6aa1b76c7ee( "immune", 0 );
    function_eee51fa9c4016f7();
    utility::callsharedfunc( #"zombie_neptune", #"hash_ac8eb8136345157e" );
    self.var_8f1c21afe4877bb5 = 0;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xf46c7535, Offset: 0x3e3f
// Size: 0x3b
function private increase_fight_phase()
{
    assert( self.n_fight_phase < 3 );
    self.n_fight_phase += 1;
    callback::callback( #"hash_696b6f168d1d9c5c" );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xd5d30692, Offset: 0x3e82
// Size: 0x5a
function private hide_neptune()
{
    asm::function_7256f5ba459c840b( "idle_in" );
    self invisiblenotsolid();
    self hide();
    self hideallparts();
    zombie_neptune_metabones::function_c35ccbc3b1fbcab9();
    utility::function_32b24db3127bff40( "eye", "off" );
    utility::function_32b24db3127bff40( "movement", "off" );
    utility::function_32b24db3127bff40( "speed_boost", "off" );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x99d2ad99, Offset: 0x3ee4
// Size: 0xb3
function private show_neptune()
{
    settings = self.zombieaisettings.var_d3de1a9faac42deb;
    models = [ self.model, settings.var_8dd4e71c890f6f29, settings.var_8dd4e61c890f6cf6 ];
    self setmodel( models[ self.n_fight_phase - 1 ] );
    self visiblesolid();
    self show();
    self showallparts();
    utility::function_32b24db3127bff40( "eye", "on_" + self.n_fight_phase );
    utility::function_32b24db3127bff40( "movement", "on_" + self.n_fight_phase );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xc2856831, Offset: 0x3f9f
// Size: 0x66
function private function_4575ac53c34c4acc( params )
{
    if ( self.n_fight_phase == 2 )
    {
        self aisetbounds( 60, 200, 0, 0, 0 );
    }
    else if ( self.n_fight_phase == 3 )
    {
        self aisetbounds( 80, 300, 0, 0, 0 );
    }
    
    var_b63b359caa131deb = self.var_b63b359caa131deb;
    var_b63b359caa131deb function_92750efba138579a();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xc3142ce, Offset: 0x400d
// Size: 0x1b3
function private function_df419e0e03604139( params )
{
    eject_agent = params.eject_ai;
    var_b63b359caa131deb = params.var_e128f7e1227e3b81.var_b63b359caa131deb;
    activity_instance = var_b63b359caa131deb.activity_instance;
    
    if ( var_b63b359caa131deb.activity_instance.type != "REV_OB_STRIKE_BOSS" )
    {
        return;
    }
    
    var_b63b359caa131deb cleanup_boss_objective_marker();
    var_b63b359caa131deb.current_boss = eject_agent;
    eject_agent.suppress_minimap_icon = 1;
    eject_agent.var_33d9fb83f023e633 = 1;
    eject_agent.spawn_point = params.var_e128f7e1227e3b81.spawn_point;
    eject_agent.var_b63b359caa131deb = var_b63b359caa131deb;
    eject_agent.var_e94a0381e288005e = #"hash_99917007a6eaa6b4";
    eject_agent callback::add( #"on_ai_killed", &on_boss_killed );
    var_b63b359caa131deb create_boss_healthbar( eject_agent );
    var_b63b359caa131deb setup_boss_objective_marker( eject_agent );
    eject_agent thread function_fd5d1c4d005b2eba( var_b63b359caa131deb );
    var_b63b359caa131deb.activity_instance activity_participation::function_d041ee0ec570299d( eject_agent );
    
    /#
        var_f791e93cc48c0c97 = function_a5cd5a36ccebe58( "<dev string:xae>", 0 );
        
        if ( var_f791e93cc48c0c97 )
        {
            eject_agent.maxhealth = var_f791e93cc48c0c97;
            eject_agent.health = var_f791e93cc48c0c97;
        }
    #/
    
    activity_instance.var_2c7df72824504573 += eject_agent.health;
    eject_agent callback::add( #"on_ai_killed", &function_ee796d3f0bfba9ed );
    eject_agent thread function_568aa46f55672ff9();
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x4d058f44, Offset: 0x41c8
// Size: 0x36, Type: bool
function private should_shutdown_flood( requestid, userdata )
{
    var_b63b359caa131deb = userdata[ 0 ];
    
    if ( var_b63b359caa131deb.boss_killed )
    {
        return true;
    }
    
    return false;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x39fabfcb, Offset: 0x4207
// Size: 0x7
function private get_spawn_boss_type()
{
    return "galileo";
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x74fcf46d, Offset: 0x4217
// Size: 0xe7
function private spawn_ai( activityinstance, boss_struct )
{
    boss_struct.spawned = 1;
    tag = boss_struct.type ?? get_spawn_boss_type();
    request_id = activityinstance activity_ai_encounters::function_eb8506829193f5eb( "ai_encounter:sat_enc_ob_red_flood_boss", boss_struct.origin, 500, 1, 1, 1, 0 );
    function_1a9d724a960fa19d( request_id, tag, 1 );
    activityinstance activity_ai_encounters::function_48582991402cac50( request_id, 1 );
    activityinstance activity_ai_encounters::function_52d1342183200a8f( request_id, &boss_spawned_callback, [ self, boss_struct ] );
    function_64ac8c4e752f4dca( request_id, 0 );
    flood_request_id = activityinstance activity_ai_encounters::function_eb8506829193f5eb( "ai_encounter:sat_enc_ob_toxin_bomb_flood", boss_struct.origin, 1000, 1, 0, 1, 0 );
    activity_ai_encounters::function_d33de057e760c97b( flood_request_id, &should_shutdown_flood, [ self ] );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x4bda0405, Offset: 0x4306
// Size: 0x2d
function private function_a76d3530c19ddf03()
{
    self.cradle_crate game_utility::questcircle_create( "Toxin_Bomb_Boss_Ob", self.cradle_crate.origin, 2000 );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xd3ef2d2d, Offset: 0x433b
// Size: 0x12
function private function_2bb49caeb1c9a07f()
{
    self.cradle_crate game_utility::questcircle_delete();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x83b6b4b8, Offset: 0x4355
// Size: 0xcc
function private function_7156bba523537dac( players )
{
    if ( self.cradle_crate game_utility::questcircle_exists() )
    {
        foreach ( player in players )
        {
            self.cradle_crate game_utility::questcircle_showtoplayer( player );
        }
    }
    
    if ( isdefined( self.cradle_crate.objidnum ) )
    {
        namespace_d7fa4530141146a5::function_7c5730b9151d91( players, self.cradle_crate.objidnum );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xd72294af, Offset: 0x4429
// Size: 0x13c
function private function_530d5e82cd6fa756( players )
{
    if ( self.cradle_crate game_utility::questcircle_exists() )
    {
        foreach ( player in players )
        {
            self.cradle_crate game_utility::questcircle_hidefromplayer( player );
        }
    }
    
    if ( isdefined( self.cradle_crate.objidnum ) )
    {
        foreach ( player in players )
        {
            if ( !player function_5b4e71806497d77a() )
            {
                namespace_d7fa4530141146a5::function_831cf83f2b250537( [ player ], self.cradle_crate.objidnum );
            }
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xcba16a45, Offset: 0x456d
// Size: 0x27
function private function_2dd4ea1adec3dd04()
{
    game_utility::questcircle_create( "Toxin_Bomb_Warn_Ob", self.origin, self.radius );
    game_utility::questcircle_showtoall();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xedb8e1f9, Offset: 0x459c
// Size: 0x9
function private function_8a7d76b89ec2cf8()
{
    game_utility::questcircle_delete();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x7070f50c, Offset: 0x45ad
// Size: 0x36
function private setup_hovercard( objidnum )
{
    hovercardid = function_43b5ed5a14a56573( #"scriptbundle_hovercard", %"hovercard:hovercard_sat_ob_activity_strike_boss" );
    objective_sethovercardindex( objidnum, hovercardid );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x5b32c559, Offset: 0x45eb
// Size: 0x40
function private function_2cdcd7e181d42766()
{
    level endon( #"game_ended" );
    var_b63b359caa131deb = self;
    var_b63b359caa131deb endon( #"objective_removed" );
    wait 120;
    objidpoolmanager::update_objective_state( self.objidnum, "active" );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x4ed1070, Offset: 0x4633
// Size: 0xba
function private setup_explode_objective_marker( activityinstance )
{
    self.objidnum = activityinstance namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_objectivemarker_red_flood", 0, 0 );
    objidpoolmanager::update_objective_position( self.objidnum, self.cradle_crate.origin + ( 0, 0, 1000 ) );
    objective_showtoplayersinmask( self.objidnum );
    objective_removeallclientsfrommask( self.objidnum );
    objidpoolmanager::update_objective_state( self.objidnum, "active" );
    setup_hovercard( self.objidnum );
    visible_players = function_d9c71b6666747ae9();
    namespace_d7fa4530141146a5::function_7c5730b9151d91( visible_players, self.objidnum );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xbcdffc62, Offset: 0x46f5
// Size: 0x41
function private function_54efd1cd90aee6f0( activityinstance )
{
    if ( isdefined( self.objidnum ) )
    {
        self notify( #"objective_removed" );
        activityinstance namespace_d7fa4530141146a5::function_501e44ea1cb9219d( self.objidnum );
        self.objidnum = undefined;
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x5c4653a4, Offset: 0x473e
// Size: 0x87
function private function_fe1ce28b49bcf531()
{
    level endon( #"game_ended" );
    self endon( #"hash_ad7c545b2fa818d3" );
    objidnum = self.cradle_crate.objidnum;
    visible_players = [];
    
    while ( true )
    {
        should_visible_players = function_d9c71b6666747ae9();
        new_visible_players = arrayremove( should_visible_players, visible_players );
        
        if ( new_visible_players.size )
        {
            namespace_d7fa4530141146a5::function_7c5730b9151d91( new_visible_players, objidnum );
            visible_players = should_visible_players;
        }
        
        wait 0.1;
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xbe4585b, Offset: 0x47cd
// Size: 0x93
function private setup_cradle_crate_objective_marker( activityinstance )
{
    objidnum = activityinstance namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_objectivemarker_red_flood", 0, 0 );
    objidpoolmanager::update_objective_position( objidnum, self.cradle_crate.origin + ( 0, 0, 30 ) );
    objective_showtoplayersinmask( objidnum );
    objective_removeallclientsfrommask( objidnum );
    objidpoolmanager::update_objective_state( objidnum, "active" );
    setup_hovercard( objidnum );
    self.cradle_crate.objidnum = objidnum;
    thread function_fe1ce28b49bcf531();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x4b816995, Offset: 0x4868
// Size: 0xbb
function private notify_players_activity_begin( objidnum )
{
    quest_active_players = get_quest_active_players();
    
    foreach ( player in quest_active_players )
    {
        ping_id = player calloutmarkerping::function_5d7b7302e94b97c2( objidnum );
        player calloutmarkerping_hide( ping_id );
        player calloutmarkerping_show( ping_id, player );
        player thread hud_message::showsplash( #"hash_7ab5f3c1de4ed1c4" );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x4ffe8ba7, Offset: 0x492b
// Size: 0x5e
function private function_e2772ec04057c99a( activityinstance )
{
    if ( isdefined( self.cradle_crate.objidnum ) )
    {
        self notify( #"hash_ad7c545b2fa818d3" );
        activityinstance namespace_d7fa4530141146a5::function_501e44ea1cb9219d( self.cradle_crate.objidnum );
        self.cradle_crate.objidnum = undefined;
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x307f38b9, Offset: 0x4991
// Size: 0x2bf
function private function_368a5c717b3f267d()
{
    if ( !ob_resource_manager::function_516cca136bef547f() )
    {
        return;
    }
    
    level endon( #"game_ended" );
    activity_instance = self.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    self endon( #"boss_killed" );
    resources = [ { #amount:get_override_setting( "reserved_entity", 30 ), #type:"entities" }, { #amount:get_override_setting( "reserved_scriptable", 70 ), #type:"scriptables" }, { #amount:get_override_setting( "reserved_vehicle", 10 ), #type:"vehicles" } ];
    end_time = gettime() + utility::function_4b74c15943231980( get_override_setting( "reserve_duration", 40 ) );
    
    while ( true )
    {
        success = 1;
        
        foreach ( resource in resources )
        {
            resource_type = resource.type;
            resource_amount = resource.amount;
            
            if ( !isdefined( self.var_8f690038836c9b4c[ resource_type ] ) )
            {
                self.var_8f690038836c9b4c[ resource_type ] = 0;
            }
            
            if ( self.var_8f690038836c9b4c[ resource_type ] < resource_amount )
            {
                reserved_amount = activity_instance ob_resource_manager::function_7e6ceb9ece0c87e7( resource_type, resource_amount - self.var_8f690038836c9b4c[ resource_type ] );
                self.var_8f690038836c9b4c[ resource_type ] += reserved_amount;
                
                if ( self.var_8f690038836c9b4c[ resource_type ] < resource_amount )
                {
                    success = 0;
                }
            }
        }
        
        if ( success )
        {
            break;
        }
        
        if ( gettime() >= end_time )
        {
            break;
        }
        
        waitframe();
    }
    
    /#
        foreach ( type, amount in self.var_8f690038836c9b4c )
        {
            println( "<dev string:xd0>" + type + "<dev string:xef>" + amount );
        }
    #/
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xfd4fc604, Offset: 0x4c58
// Size: 0x84
function private function_9402936a7a7a40be()
{
    if ( !ob_resource_manager::function_516cca136bef547f() )
    {
        return;
    }
    
    activity_instance = self.activity_instance;
    reserved_vehicles = self.var_8f690038836c9b4c[ "vehicles" ];
    reserved_entities = self.var_8f690038836c9b4c[ "entities" ];
    reserved_scriptables = self.var_8f690038836c9b4c[ "scriptables" ];
    self.var_8f690038836c9b4c = undefined;
    activity_instance ob_resource_manager::function_2948ca4364d60860( reserved_vehicles, reserved_entities, reserved_scriptables );
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0xdc07ce70, Offset: 0x4ce4
// Size: 0x2a
function private get_override_setting( name, defaultvalue )
{
    return getdvarint( hashcat( @"hash_d0fcd4ff72738c8", name ), defaultvalue );
}

// Namespace ob_activity_strike_boss
// Params 6, eflags: 0x4
// Checksum 0x22c0d4b, Offset: 0x4d17
// Size: 0x43
function private cradle_crate_used( instance, part, state, player, bautouse, usestring )
{
    instance thread function_a339ced7169179a1( player );
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0xf7c18beb, Offset: 0x4d62
// Size: 0xcc
function private function_a339ced7169179a1( player )
{
    if ( !player function_a142598b91e82b89() )
    {
        return;
    }
    
    if ( !self.var_b63b359caa131deb || self.var_b63b359caa131deb.activity_instance.type != "REV_OB_STRIKE_BOSS" )
    {
        return;
    }
    
    if ( self.players_interacting.size )
    {
        return;
    }
    
    interaction_result = ob_interactions_util::function_c7b5806740384a61( "earpiece_press_sat_ob", player, 5, self, 1, 1, 1, -1, "ClinkInteractions" );
    
    if ( !player || !self )
    {
        return;
    }
    
    if ( interaction_result )
    {
        self.var_b63b359caa131deb notify( #"cradle_crate_used", player );
        self setscriptablepartstate( #"strike_boss_cradle_crate", #"unusable_planting" );
        thread clip_management();
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xc87cab92, Offset: 0x4e36
// Size: 0x1d
function private function_a142598b91e82b89()
{
    /#
        if ( function_a5cd5a36ccebe58( "<dev string:xf9>", 0 ) )
        {
            return 1;
        }
    #/
    
    return function_5b4e71806497d77a();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xa9dd0382, Offset: 0x4e5c
// Size: 0x6c
function private clip_management()
{
    self endon( #"death" );
    toxin_site_clip = spawn( "script_model", self.origin );
    toxin_site_clip setmodel( "sat_ob_toxin_bomb_site_clip" );
    self.toxin_site_clip = toxin_site_clip;
    wait 3.6;
    toxin_site_clip moveto( self.origin + ( 0, 0, 30 ), 2.5 );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x21ef0276, Offset: 0x4ed0
// Size: 0x22
function private clip_remove()
{
    wait 0.5;
    
    if ( self.toxin_site_clip )
    {
        self.toxin_site_clip delete();
    }
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x433f5d80, Offset: 0x4efa
// Size: 0x105
function private setup_cradle_crate()
{
    activity_instance = self.activity_instance;
    crate_struct = namespace_be3150865da9d2f1::get_linked_struct_filtered( "cradle_crate", "script_noteworthy" );
    
    if ( crate_struct )
    {
        origin = crate_struct.origin;
        angles = crate_struct.angles;
    }
    else
    {
        origin = utility::drop_to_ground( self.origin, 10000 );
        angles = self.angles;
    }
    
    origin = ob_activity_utility::function_fd8fc0e0d2300792( origin );
    angles = ob_activity_utility::function_fd8fc0e0d2300792( angles );
    crate = getentitylessscriptablearray( undefined, undefined, origin, 100, #"strike_boss_cradle_crate" )[ 0 ];
    
    if ( !crate )
    {
        crate = spawnscriptable( "sat_ob_strike_boss_cradle_crate", origin, angles );
        crate.var_b63b359caa131deb = self;
        crate setscriptablepartstate( #"strike_boss_cradle_crate", #"visible" );
        activity_instance ob_activity_instance_common::function_9c6b2d04234d7b5e( activity_instance, crate );
    }
    
    self.cradle_crate = crate;
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x3b2778d3, Offset: 0x5007
// Size: 0x60
function private function_402009bcdf3c11de( startpos, endpos )
{
    path_info = function_fdee9f19da89757d( startpos, endpos );
    function_2bcff8b80bc30d8( startpos, endpos, path_info.bezier_end_pos, path_info.bezier_control_pos, path_info.random_radius, path_info.spiral_height );
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x3ad35db9, Offset: 0x506f
// Size: 0x114
function private function_fdee9f19da89757d( startpos, endpos )
{
    random_radius = randomintrange( 50, 151 );
    var_be45aa444243dd60 = randomintrange( -50, 51 );
    var_724163bd4b3d2439 = randomintrange( 30, 91 );
    var_473a4a2e7060cbdd = vectortoangles( endpos - startpos );
    var_c7f1904230e9da61 = int( var_473a4a2e7060cbdd[ 1 ] - var_724163bd4b3d2439 );
    bezier_end_pos = endpos + ( random_radius * cos( var_c7f1904230e9da61 ), random_radius * sin( var_c7f1904230e9da61 ), 0 ) + ( 0, 0, var_be45aa444243dd60 );
    var_16b36c997f81e1e = var_c7f1904230e9da61 + 90;
    bezier_control_pos = bezier_end_pos + anglestoforward( ( 0, var_16b36c997f81e1e, 0 ) ) * -0.5 * distance( startpos, endpos ) + ( 0, 0, var_be45aa444243dd60 );
    spiral_height = bezier_end_pos[ 2 ] - endpos[ 2 ];
    return { #spiral_height:spiral_height, #random_radius:random_radius, #bezier_control_pos:bezier_control_pos, #bezier_end_pos:bezier_end_pos };
}

// Namespace ob_activity_strike_boss
// Params 6, eflags: 0x4
// Checksum 0xd9012a3d, Offset: 0x518c
// Size: 0x1d3
function private function_2bcff8b80bc30d8( startpos, endpos, bezier_end, bezier_control_point, radius, spiral_height )
{
    var_b304159877816eb9 = distancesquared( startpos, bezier_end );
    var_58c89811f3b06a50 = mapfloat( 0, 360000, 0.35, 0.65, var_b304159877816eb9 );
    var_324fd5ce37eb5bfa = max( 1, 3.14159 * radius / 500 );
    
    if ( !isdefined( self.var_8b45b0401d2cc8a3 ) )
    {
        self.var_8b45b0401d2cc8a3 = 0;
    }
    
    if ( self.var_8b45b0401d2cc8a3 >= 15 || distance2d( startpos, endpos ) >= 2000 )
    {
        wait var_58c89811f3b06a50 + 2 + 0.2;
        return;
    }
    
    self.var_8b45b0401d2cc8a3++;
    mover = utility::spawn_model( "tag_origin", startpos, ( 0, 0, 0 ) );
    debug_path = 0;
    
    /#
        if ( getdvarint( @"hash_b1ab1359416a2026", 0 ) )
        {
            debug_path = 1;
            thread function_4e1052cf54a5a800( startpos, endpos, bezier_end, bezier_control_point, radius, spiral_height, mover, var_324fd5ce37eb5bfa );
        }
    #/
    
    scriptable = spawnscriptable( %"sat_ob_red_flood_cradle_collect_fx", startpos );
    scriptable utility::scriptable_setparententity( mover );
    mover utility::function_8001268940441423( startpos, bezier_end, bezier_control_point, var_58c89811f3b06a50, debug_path, 1 );
    mover utility::follow_spiral( radius, 0, ( 0, 0, 1 ), spiral_height * -1, var_324fd5ce37eb5bfa, endpos, 1, 0 );
    
    /#
        if ( debug_path )
        {
            mover.var_e2fd305459d7c640 = 1;
        }
    #/
    
    scriptable setscriptablepartstate( #"body", #"impact" );
    wait 0.2;
    scriptable freescriptable();
    mover delete();
    self.var_8b45b0401d2cc8a3--;
}

/#

    // Namespace ob_activity_strike_boss
    // Params 8, eflags: 0x4
    // Checksum 0x496f02fb, Offset: 0x5367
    // Size: 0x191, Type: dev
    function private function_4e1052cf54a5a800( startpos, endpos, bezier_end, bezier_control_point, radius, spiral_height, mover, var_324fd5ce37eb5bfa )
    {
        level endon( #"game_ended" );
        mover endon( #"death" );
        sphere( startpos, 5, ( 0, 1, 0 ), 0, int( 10 / level.framedurationseconds ) );
        sphere( endpos, 5, ( 0, 1, 0 ), 0, int( 10 / level.framedurationseconds ) );
        sphere( bezier_end, 5, ( 1, 0, 0 ), 0, int( 10 / level.framedurationseconds ) );
        sphere( bezier_control_point, 5, ( 0, 0, 1 ), 0, int( 10 / level.framedurationseconds ) );
        line( bezier_end, bezier_control_point, ( 1, 1, 1 ), 1, 0, int( 10 / level.framedurationseconds ) );
        mover waittill( #"hash_63c37028d5d0eecc" );
        
        for ( oldpos = mover.origin; !mover.var_e2fd305459d7c640 ; oldpos = mover.origin )
        {
            waitframe();
            mover thread utility::draw_line_for_time( mover.origin, oldpos, 1, 1, 1, var_324fd5ce37eb5bfa * 10 );
        }
    }

#/

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x5f343d29, Offset: 0x5500
// Size: 0x20
function private function_3f996c8bc9980cf8( requestid, phasestruct )
{
    return phasestruct.var_c63209be75d96ba;
}

// Namespace ob_activity_strike_boss
// Params 3, eflags: 0x4
// Checksum 0x5636654b, Offset: 0x5529
// Size: 0x12a
function private function_eb72b9ebf4b92bf2( pos, progress, ischampion )
{
    vfx_end_pos = self.cradle_crate.origin + ( 0, 0, 60 );
    
    if ( ischampion )
    {
        for ( i = 0; i < 5 ; i++ )
        {
            if ( i < 4 )
            {
                thread function_402009bcdf3c11de( pos, vfx_end_pos );
                wait 0.2;
                continue;
            }
            
            function_402009bcdf3c11de( pos, vfx_end_pos );
        }
    }
    else
    {
        function_402009bcdf3c11de( pos, vfx_end_pos );
    }
    
    if ( self.var_ac3f65cae6d3b9fe < 100 )
    {
        self.var_ac3f65cae6d3b9fe = clamp( self.var_ac3f65cae6d3b9fe + progress, 0, 100 );
        namespace_9085ae059032a84f::updateprogress( self.var_ac3f65cae6d3b9fe, self.activity_instance );
        self.cradle_crate function_92da89aece774300( self.var_ac3f65cae6d3b9fe );
        self notify( #"cradle_collect_progress_incremented" );
        
        if ( self.var_ac3f65cae6d3b9fe >= 100 )
        {
            self.var_c63209be75d96ba = 1;
            self notify( #"hash_745f9dfb87f9cbea" );
        }
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x14c3c227, Offset: 0x565b
// Size: 0xb4
function private function_92da89aece774300( progress )
{
    if ( progress >= 100 )
    {
        utility::function_32b24db3127bff40( #"charge_fx", #"full" );
    }
    else if ( progress >= 60 )
    {
        utility::function_32b24db3127bff40( #"charge_fx", #"high" );
    }
    else if ( progress >= 30 )
    {
        utility::function_32b24db3127bff40( #"charge_fx", #"low" );
    }
    
    if ( progress > 0 )
    {
        state_progress = floor( progress / 5 ) * 5;
        state_progress = getxhash( state_progress + "_pcr" );
        utility::function_32b24db3127bff40( #"miscellaneous", state_progress );
    }
}

// Namespace ob_activity_strike_boss
// Params 2, eflags: 0x4
// Checksum 0x8d837f2d, Offset: 0x5717
// Size: 0x86
function private function_f739bad011c913bd( params, var_b63b359caa131deb )
{
    if ( self.death_source != "despawn" )
    {
        pos = self gettagorigin( "j_head" );
        
        if ( self.ischampion )
        {
            progress = get_override_setting( "cradle_per_kill_champion", 10 );
        }
        else
        {
            progress = get_override_setting( "cradle_per_kill", 1 );
        }
        
        var_b63b359caa131deb thread function_eb72b9ebf4b92bf2( pos, progress, self.ischampion );
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0xc
// Checksum 0x64da5964, Offset: 0x57a5
// Size: 0x70
function private function_76a060200a66f6ad( phasestruct )
{
    self notify( #"hash_8fe75a0fdd29e159" );
    self endon( #"hash_8fe75a0fdd29e159" );
    level endon( #"game_ended" );
    self endon( #"death" );
    phasestruct waittill( #"hash_745f9dfb87f9cbea" );
    self.var_a13bed1ac47e1b2c = 1;
    self.dropweapon = 0;
    self.nodrop = 1;
    self kill();
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0xdb99691e, Offset: 0x581d
// Size: 0x144
function private function_2d319a1918e6fe32( requestid, userdata, agent, data )
{
    phasestruct = userdata[ 0 ];
    var_6cebdaa9bd9d1316 = userdata[ 1 ];
    agent region_difficulty_manager::function_410b4f83b0a5b98( "difficulty5" );
    agent setgoalpos( phasestruct.cradle_crate.origin, 1000 );
    agent function_fa32376aaa88a7a2( agent.origin, phasestruct.radius );
    agent._blackboard.zombiewanderorigin = agent.origin;
    agent._blackboard.var_8d11b98561e1eb81 = 100;
    agent._blackboard.var_8d34ab856208146f = 400;
    agent._blackboard.var_6a8c50efac75caa1 = 3000;
    agent.ischampion = var_6cebdaa9bd9d1316;
    agent thread function_76a060200a66f6ad( phasestruct );
    agent setscriptablepartstate( #"burned_cradle", #"burned_on", 0 );
    agent callback::add( #"on_ai_killed", &function_f739bad011c913bd, phasestruct );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x2c5120ba, Offset: 0x5969
// Size: 0x253
function private function_9fad8ee06c74b659()
{
    activity_instance = self.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    self endon( #"hash_745f9dfb87f9cbea" );
    stages = [ { #progress:10 }, { #var_1ed33963730d913f:20, #tag:"champion" }, { #var_1ed33963730d913f:45, #tag:"champion_2" }, { #var_1ed33963730d913f:85, #tag:"champion_3" } ];
    
    foreach ( stage in stages )
    {
        if ( stage.progress )
        {
            while ( true )
            {
                self waittill( #"cradle_collect_progress_incremented" );
                
                if ( self.var_ac3f65cae6d3b9fe >= stage.progress )
                {
                    break;
                }
            }
            
            continue;
        }
        
        tag = stage.tag;
        request_id = activity_instance activity_ai_encounters::function_eb8506829193f5eb( "ai_encounter:sat_ob_enc_red_flood_champion", self.cradle_crate.origin, 1000, 1, 1, 1, 2 );
        function_1a9d724a960fa19d( request_id, tag, 1 );
        activity_instance activity_ai_encounters::function_52d1342183200a8f( request_id, &function_2d319a1918e6fe32, [ self, 1 ] );
        self.pause_flood_fill = self.var_ac3f65cae6d3b9fe >= stage.var_1ed33963730d913f;
        var_d8f9cc3d992b5e00 = "ai_encounter_shutdown_" + request_id;
        
        while ( true )
        {
            msg = utility::waittill_any_ents_return( self, "cradle_collect_progress_incremented", level, var_d8f9cc3d992b5e00 );
            
            if ( msg == "cradle_collect_progress_incremented" )
            {
                self.pause_flood_fill = self.var_ac3f65cae6d3b9fe >= stage.var_1ed33963730d913f;
                continue;
            }
            
            break;
        }
    }
    
    self.pause_flood_fill = 0;
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0x58d4d8c, Offset: 0x5bc4
// Size: 0x41, Type: bool
function private function_62212b736bfb1729( requestid, userdata, agent, data )
{
    var_b63b359caa131deb = userdata;
    return !var_b63b359caa131deb.pause_flood_fill;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xe05bf5d1, Offset: 0x5c0e
// Size: 0x95
function private function_d7abcacdd4b382f5()
{
    self.var_ac3f65cae6d3b9fe = 0;
    activity_instance = self.activity_instance;
    flood_request_id = activity_instance activity_ai_encounters::function_eb8506829193f5eb( "ai_encounter:sat_ob_enc_red_flood_flood_fill", self.cradle_crate.origin, 1000, 1, 1, 1, 2 );
    activity_ai_encounters::function_d33de057e760c97b( flood_request_id, &function_3f996c8bc9980cf8, self );
    ai_spawn_director::function_c99d360d62c49a9c( flood_request_id, &function_62212b736bfb1729, self );
    activity_instance activity_ai_encounters::function_52d1342183200a8f( flood_request_id, &function_2d319a1918e6fe32, [ self, 0 ] );
    thread function_9fad8ee06c74b659();
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xa053119f, Offset: 0x5cab
// Size: 0x21b
function private function_f8161530e839a585()
{
    phasestruct = self;
    activity_instance = self.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    scriptable::scriptable_addnotifycallback( "red_flood_lightning_strike_damage", &_lightning_strike_damage );
    scriptable::scriptable_addnotifycallback( "red_flood_lightning_strike_finished", &_lightning_strike_finished );
    crate_origin = phasestruct.cradle_crate.origin;
    lightning_strike_range = arrayrandomize( [ 100, 200, 300, 400, 500, 600, 700, 800 ] );
    lightning_strike_angle = arrayrandomize( [ [ 0, 45 ], [ 45, 90 ], [ 90, 135 ], [ 135, 180 ], [ 180, 225 ], [ 225, 270 ], [ 270, 315 ], [ 315, 360 ] ] );
    lightning_strike_count = 0;
    
    while ( true )
    {
        if ( phasestruct.flash_finished )
        {
            break;
        }
        
        lightning_strike_count++;
        
        if ( lightning_strike_count == 8 )
        {
            lightning_strike_count = 0;
        }
        
        cluster_origin = crate_origin + ( lightning_strike_range[ lightning_strike_count ] * cos( randomfloatrange( lightning_strike_angle[ lightning_strike_count ][ 0 ], lightning_strike_angle[ lightning_strike_count ][ 1 ] ) ), lightning_strike_range[ lightning_strike_count ] * sin( randomfloatrange( lightning_strike_angle[ lightning_strike_count ][ 0 ], lightning_strike_angle[ lightning_strike_count ][ 1 ] ) ), 0 );
        strike_origin = getclosestpointonnavmesh( cluster_origin );
        lightning_strikes_scriptable = spawnscriptable( %"sat_ob_red_flood_lightning_strike", strike_origin );
        lightning_strikes_scriptable.phasestruct = phasestruct;
        lightning_strikes_scriptable thread function_fd5dfc3c569e05e0();
        wait randomfloatrange( 1, 2 );
    }
}

// Namespace ob_activity_strike_boss
// Params 3, eflags: 0x4
// Checksum 0x1047c430, Offset: 0x5ece
// Size: 0x172
function private lightning_strike_on_player( victim, shock_duration, damage )
{
    victim endon( #"death" );
    victim endon( #"disconnect" );
    victim shock_stick::function_904e61c3aefb61c2( 1 );
    
    if ( victim.revivingteammate )
    {
        victim.var_45ab03788f1a0a4d = 1;
    }
    
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start_red" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    
    if ( isplayer( victim ) )
    {
        playsoundatpos( victim.origin, "evt_lightning_strike_impact" );
        gestureref = "vm_ges_shockstick_react";
        curweapon = victim getcurrentweapon();
        
        if ( weapon::isfistweapon( curweapon ) )
        {
            gestureref = "vm_ges_shockstick_react_fists";
        }
        
        while ( !victim isgestureplaying( gestureref ) )
        {
            victim forceplaygestureviewmodel( gestureref );
            waitframe();
        }
    }
    
    victim startforcedfire();
    victim shock_stick::function_ef03efbecb279b8a( 1 );
    victim setmovespeedscale( 0.8 );
    victim setempjammed( 1 );
    wait shock_duration;
    victim shock_stick::function_904e61c3aefb61c2( 0 );
    victim stopgestureviewmodel( gestureref );
    victim stopforcedfire();
    victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    victim shock_stick::function_ef03efbecb279b8a( 0 );
    victim setmovespeedscale( 1 );
    victim setempjammed( 0 );
}

// Namespace ob_activity_strike_boss
// Params 3, eflags: 0x4
// Checksum 0x7d1131a1, Offset: 0x6048
// Size: 0x81
function private function_7d456c43692283e4( victim, shock_duration, damage )
{
    victim zombie_stun::stun_ai( shock_duration );
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start_red" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    wait shock_duration;
    
    if ( isalive( victim ) )
    {
        victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    }
}

// Namespace ob_activity_strike_boss
// Params 3, eflags: 0x4
// Checksum 0x65637a5e, Offset: 0x60d1
// Size: 0xe6
function private function_3e388fde8403d9e0( victim, shock_duration, damage )
{
    firstshock = gettime() > victim._blackboard.var_ba9517cfc0287af8 + 1;
    victim._blackboard.var_ba9517cfc0287af8 = gettime();
    
    if ( victim asmhaspainstate( victim.asmname ) && firstshock )
    {
        victim asmevalpaintransition( victim.asmname );
    }
    
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start_red" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    wait shock_duration;
    
    if ( isalive( victim ) )
    {
        victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    }
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0x93145ad0, Offset: 0x61bf
// Size: 0x247
function private _lightning_strike_damage( instance, note, param, var_64ffacba090c91be )
{
    phasestruct = instance.phasestruct;
    random = randomintrange( 0, 10 );
    
    if ( phasestruct && random < 3 )
    {
        phasestruct thread function_aaa2c8d2463ebe4d( instance.origin );
    }
    
    radiusdamage( instance.origin, 105, 50, 50, undefined, undefined, undefined, 1, 1 );
    players = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( instance.origin, 105 );
    
    foreach ( player in players )
    {
        thread lightning_strike_on_player( player, 1, 50 );
    }
    
    zombies = getaiarrayinradius( instance.origin, 105, "team_two_hundred" );
    
    foreach ( zombie in zombies )
    {
        thread function_7d456c43692283e4( zombie, 1, 50 );
    }
    
    soldiers = getaiarrayinradius( instance.origin, 105, "team_hundred_ninety" );
    
    foreach ( soldier in soldiers )
    {
        thread function_3e388fde8403d9e0( soldier, 1, 50 );
    }
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0x41040685, Offset: 0x640e
// Size: 0x34
function private _lightning_strike_finished( instance, note, param, var_64ffacba090c91be )
{
    instance notify( #"red_flood_lightning_strike_finished" );
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x3f5c3a63, Offset: 0x644a
// Size: 0x63
function private function_fd5dfc3c569e05e0()
{
    random = randomintrange( 0, 2 );
    
    if ( random == 1 )
    {
        self setscriptablepartstate( #"strike", #"on" );
    }
    else
    {
        self setscriptablepartstate( #"strike", #"no_damage" );
    }
    
    self waittill( #"red_flood_lightning_strike_finished" );
    self freescriptable();
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x8781b1d1, Offset: 0x64b5
// Size: 0x84
function private function_aaa2c8d2463ebe4d( cluster_origin )
{
    phasestruct = self;
    activity_instance = self.activity_instance;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    flood_request_id = activity_instance activity_ai_encounters::function_eb8506829193f5eb( "ai_encounter:sat_ob_enc_red_flood_flash", cluster_origin, 100, 1, 1, 1, 0 );
    activity_instance activity_ai_encounters::function_52d1342183200a8f( flood_request_id, &function_32176b963a974548, [ phasestruct, cluster_origin ] );
}

// Namespace ob_activity_strike_boss
// Params 4, eflags: 0x4
// Checksum 0x56ec1110, Offset: 0x6541
// Size: 0xe4
function private function_32176b963a974548( requestid, userdata, agent, data )
{
    phasestruct = userdata[ 0 ];
    strike_origin = userdata[ 1 ];
    agent region_difficulty_manager::function_410b4f83b0a5b98( "difficulty5" );
    agent setgoalpos( strike_origin, 100 );
    agent function_fa32376aaa88a7a2( agent.origin, phasestruct.radius );
    agent._blackboard.zombiewanderorigin = agent.origin;
    agent._blackboard.var_8d11b98561e1eb81 = 100;
    agent._blackboard.var_8d34ab856208146f = 400;
    agent._blackboard.var_6a8c50efac75caa1 = 650;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x2778c24b, Offset: 0x662d
// Size: 0x2d
function private clear_flash()
{
    phasestruct = self;
    
    if ( phasestruct.lightning_strikes_scriptable )
    {
        phasestruct.lightning_strikes_scriptable freescriptable();
    }
}

// Namespace ob_activity_strike_boss
// Params 1, eflags: 0x4
// Checksum 0x66ee0b39, Offset: 0x6662
// Size: 0x34, Type: bool
function private function_8edede1864597301( victim )
{
    if ( !victim.aicategory || victim.aicategory == "normal" )
    {
        return false;
    }
    
    return true;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xa522acd6, Offset: 0x669f
// Size: 0x65, Type: bool
function private function_e3822c24efb138e8()
{
    /#
        if ( function_a5cd5a36ccebe58( "<dev string:x10d>", 0 ) == 1 )
        {
            return true;
        }
    #/
    
    if ( utility::callsharedfunc( #"ob_quest", #"get_active_quest", self ) == #"hash_d6e6bc790a472e53" )
    {
        return !utility::callsharedfunc( #"ob_quest", #"hash_e98cb49910a093f9", self, #"sat_wc_quest_act1_quest10_strike_boss" );
    }
    
    return false;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xf918e9a6, Offset: 0x670d
// Size: 0x8c
function private function_16f6a3ecf9e30fa3()
{
    /#
        if ( function_a5cd5a36ccebe58( "<dev string:x10d>", 0 ) == 2 )
        {
            return 1;
        }
    #/
    
    if ( utility::callsharedfunc( #"ob_quest", #"is_quest_completed", self, #"hash_d6e6bc790a472e53" ) )
    {
        return 1;
    }
    
    if ( utility::callsharedfunc( #"ob_quest", #"get_active_quest", self ) == #"hash_d6e6bc790a472e53" )
    {
        return utility::callsharedfunc( #"ob_quest", #"hash_e98cb49910a093f9", self, #"sat_wc_quest_act1_quest10_strike_boss" );
    }
    
    return 0;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x16a4cc2a, Offset: 0x67a2
// Size: 0x33, Type: bool
function private function_5b4e71806497d77a()
{
    /#
        if ( function_a5cd5a36ccebe58( "<dev string:x10d>", 0 ) == 2 )
        {
            return true;
        }
    #/
    
    if ( function_e3822c24efb138e8() )
    {
        return true;
    }
    
    if ( function_16f6a3ecf9e30fa3() )
    {
        return true;
    }
    
    return false;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0x1964050f, Offset: 0x67de
// Size: 0x91
function private function_d9c71b6666747ae9()
{
    players = [];
    
    foreach ( player in level.players )
    {
        if ( player function_5b4e71806497d77a() )
        {
            players[ players.size ] = player;
        }
    }
    
    return players;
}

// Namespace ob_activity_strike_boss
// Params 0, eflags: 0x4
// Checksum 0xaafea29a, Offset: 0x6878
// Size: 0x91
function private get_quest_active_players()
{
    players = [];
    
    foreach ( player in level.players )
    {
        if ( player function_e3822c24efb138e8() )
        {
            players[ players.size ] = player;
        }
    }
    
    return players;
}

/#

    // Namespace ob_activity_strike_boss
    // Params 2, eflags: 0x4
    // Checksum 0x2a34faa9, Offset: 0x6912
    // Size: 0x22, Type: dev
    function private function_a5cd5a36ccebe58( name, defaultvalue )
    {
        return get_override_setting( name, defaultvalue );
    }

    // Namespace ob_activity_strike_boss
    // Params 0, eflags: 0x4
    // Checksum 0xfe69d4a1, Offset: 0x693c
    // Size: 0x2c, Type: dev
    function private init_devgui()
    {
        wait 1;
        devgui::function_9082edeb5db93280( "<dev string:x119>" );
        devgui::add_devgui_command( "<dev string:x152>", "<dev string:x162>" );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_activity_strike_boss
    // Params 0, eflags: 0x4
    // Checksum 0xf85259f3, Offset: 0x6970
    // Size: 0x16, Type: dev
    function private function_12b3b66b7683566b()
    {
        return getdvarint( @"hash_3d27abad91bc1f13", 0 ) != 0;
    }

    // Namespace ob_activity_strike_boss
    // Params 1, eflags: 0x4
    // Checksum 0x78fa768a, Offset: 0x698e
    // Size: 0x96, Type: dev
    function private function_9548a1569f16e32b( params )
    {
        variant_tag = params[ 0 ];
        phase_index = int( params[ 1 ] );
        boss_index = int( params[ 2 ] );
        activity_instance = level.var_78e2a4c5cb8c721e[ variant_tag ];
        var_b63b359caa131deb = activity_instance.phase_structs[ phase_index ];
        boss_struct = var_b63b359caa131deb.boss_structs[ boss_index ];
        var_b63b359caa131deb.s_boss = boss_struct;
    }

    // Namespace ob_activity_strike_boss
    // Params 1, eflags: 0x4
    // Checksum 0xb3f3666e, Offset: 0x6a2c
    // Size: 0x103, Type: dev
    function private debug_draw_boss_struct( index )
    {
        var_f948e10375322ae4 = 10;
        duration_seconds = level.framedurationseconds * var_f948e10375322ae4;
        
        while ( true )
        {
            origin = self.origin;
            radius = self.radius;
            color = ( 1, 0, 0 );
            
            if ( self.spawned )
            {
                color = ( 0, 1, 0 );
            }
            
            cylinder( origin, origin + ( 0, 0, 10 ), radius, color, 0, var_f948e10375322ae4 );
            print3d( origin + ( 0, 0, 0 ), "<dev string:x184>" + index, color, 1, 1, var_f948e10375322ae4 );
            print3d( origin + ( 0, 0, -20 ), "<dev string:x18a>" + self.radius, color, 1, 1, var_f948e10375322ae4 );
            wait duration_seconds;
        }
    }

    // Namespace ob_activity_strike_boss
    // Params 1, eflags: 0x4
    // Checksum 0xcab9b9cd, Offset: 0x6b37
    // Size: 0x138, Type: dev
    function private debug_start_phase( params )
    {
        variant_tag = params[ 0 ];
        phase_index = int( params[ 1 ] );
        activity_instance = level.var_78e2a4c5cb8c721e[ variant_tag ];
        var_b63b359caa131deb = activity_instance.phase_structs[ phase_index ];
        
        if ( var_b63b359caa131deb.started )
        {
            return;
        }
        
        activity_instance.var_b63b359caa131deb = var_b63b359caa131deb;
        var_b63b359caa131deb.phase_index = phase_index;
        activity_instance setup_phase_struct( var_b63b359caa131deb );
        activity_instance thread function_66c17bd942de7a99( var_b63b359caa131deb );
        devgui::function_9082edeb5db93280( "<dev string:x119>" + variant_tag + "<dev string:x192>" );
        
        for ( i = 0; i < var_b63b359caa131deb.boss_structs.size ; i++ )
        {
            devgui::function_cd4e263c1f3018ae( var_b63b359caa131deb.phase_struct_name + "<dev string:x194>" + i, "<dev string:x1a1>" + variant_tag + "<dev string:x1b9>" + phase_index + "<dev string:x1b9>" + i, &function_9548a1569f16e32b );
            boss_struct = var_b63b359caa131deb.boss_structs[ i ];
            boss_struct thread debug_draw_boss_struct( i );
        }
        
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_activity_strike_boss
    // Params 0, eflags: 0x4
    // Checksum 0xe6708a8e, Offset: 0x6c77
    // Size: 0x12b, Type: dev
    function private debug_draw_phase_struct()
    {
        var_f948e10375322ae4 = 10;
        duration_seconds = level.framedurationseconds * var_f948e10375322ae4;
        
        while ( true )
        {
            origin = self.origin;
            radius = self.radius;
            height = self.height;
            color = ( 1, 0, 0 );
            
            if ( self.started )
            {
                color = ( 0, 1, 0 );
            }
            
            cylinder( origin, origin + ( 0, 0, height ), radius, color, 0, var_f948e10375322ae4 );
            print3d( origin + ( 0, 0, height / 2 ), "<dev string:x1bb>" + self.phase_struct_name, color, 1, 1, var_f948e10375322ae4 );
            print3d( origin + ( 0, 0, height / 2 - 20 ), "<dev string:x18a>" + self.radius, color, 1, 1, var_f948e10375322ae4 );
            print3d( origin + ( 0, 0, height / 2 - 40 ), "<dev string:x1c2>" + self.height, color, 1, 1, var_f948e10375322ae4 );
            wait duration_seconds;
        }
    }

    // Namespace ob_activity_strike_boss
    // Params 0, eflags: 0x4
    // Checksum 0x8aee22da, Offset: 0x6daa
    // Size: 0x10c, Type: dev
    function private function_bc7f37b9e2f7927b()
    {
        iprintlnbold( "<dev string:x1ca>" );
        level.var_78e2a4c5cb8c721e[ self.varianttag ] = self;
        devgui::function_9082edeb5db93280( "<dev string:x119>" + self.varianttag + "<dev string:x192>" );
        phase_names = [];
        
        for ( i = 0; i < self.phase_structs.size ; i++ )
        {
            var_b63b359caa131deb = self.phase_structs[ i ];
            phase_struct_name = var_b63b359caa131deb.script_noteworthy ?? "<dev string:x1e7>" + i;
            
            if ( arraycontains( phase_names, phase_struct_name ) )
            {
                phase_struct_name = phase_struct_name + "<dev string:x1f1>" + i;
            }
            
            phase_names[ phase_names.size ] = phase_struct_name;
            var_b63b359caa131deb.phase_struct_name = phase_struct_name;
            devgui::function_cd4e263c1f3018ae( phase_struct_name + "<dev string:x1f3>", "<dev string:x200>" + self.varianttag + "<dev string:x1b9>" + i, &debug_start_phase );
            var_b63b359caa131deb thread debug_draw_phase_struct();
        }
        
        devgui::function_77df7fe7dd273e10();
    }

#/
