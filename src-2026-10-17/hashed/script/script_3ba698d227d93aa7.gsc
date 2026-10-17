#using script_15ce43f40ea0fd2b;
#using script_16555c1140262e45;
#using script_1aae2eb1ef28b239;
#using script_2399696a9d953451;
#using script_2a9058c1321cd25d;
#using script_2b51dca51198db31;
#using script_31805e8ef07bfa53;
#using script_3865eabfc59f0765;
#using script_3edd59d0d3fc3262;
#using script_42808e5693e44510;
#using script_60cd1c57e94be8d7;
#using script_61b40095fd0502f0;
#using script_6dcf9f54cbf3594f;
#using script_6fd2f8dba4845b5a;
#using script_f01501ac138f999;
#using scripts\asm\asm;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\devgui;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\emp_debuff;
#using scripts\mp\loot\common_item;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\activities\ob_activity_vo_utility;
#using scripts\mp\ob\contracts\ob_contract_ui_widget;
#using scripts\mp\ob\systems\ob_music;
#using scripts\mp\ob\systems\region_difficulty_manager;
#using scripts\mp\objidpoolmanager;

#namespace ob_objectives_dawg_escort;

// Namespace ob_objectives_dawg_escort
// Params 0, eflags: 0x5
// Checksum 0x68017e3f, Offset: 0x49a
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"ob_contract_dawg_escort", #"activity_common", &function_5d8464f944eb034, undefined );
}

// Namespace ob_objectives_dawg_escort
// Params 0, eflags: 0x4
// Checksum 0xa1d1f15f, Offset: 0x4c3
// Size: 0x13
function private function_5d8464f944eb034()
{
    activity_common::registeractivitytype( "REV_OB_ESCORT_DAWG", &dawg_escort_activity_type_init );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x5db938ee, Offset: 0x4de
// Size: 0xe5
function dawg_escort_activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "REV_OB_ESCORT_DAWG", 0, &escort_idle );
    activity_common::function_944074f3079c1d4e( "REV_OB_ESCORT_DAWG", 1, &escort_init );
    activity_common::function_944074f3079c1d4e( "REV_OB_ESCORT_DAWG", 2, &escort_dawg_end );
    activity_common::function_944074f3079c1d4e( "REV_OB_ESCORT_DAWG", 3, &escort_dawg_cleanup );
    activity_common::function_944074f3079c1d4e( "REV_OB_ESCORT_DAWG", 4, &function_b621ed14c1517f42 );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined_activity, "REV_OB_ESCORT_DAWG" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerEnteredAwarenessZone", &player_enter_awareness_zone, "REV_OB_ESCORT_DAWG" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &player_left_activity, "REV_OB_ESCORT_DAWG" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerAbandon", &function_c7871b7129e9c0c8, "REV_OB_ESCORT_DAWG" );
    utility::add_fx( "vfx_sat_dawg_emp", "vfx_t10_gameplay_zm_ai_mimic_emp_pulse" );
    scriptable::scriptable_addusedcallbackbypart( "sat_ob_dawg_escort_crate", &function_6a37f5777ab5881e );
    
    /#
        level thread init_devgui();
    #/
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x121f62c0, Offset: 0x5cb
// Size: 0x18e
function escort_idle()
{
    activityvariantdefinition = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    self.variant_definition = activityvariantdefinition;
    self.var_a88d035bffef9832 = utility::getstruct( self.varianttag, "targetname" );
    self.var_f9a39cf846e53ddb = utility::getstruct( self.varianttag + "_ENDPOINT", "script_noteworthy" );
    self.emptime = activityvariantdefinition.emptime;
    self.var_767c75e61c5f7e3a = activityvariantdefinition.var_767c75e61c5f7e3a;
    self.dawghealth = activityvariantdefinition.escorthealth;
    self.script_noteworthy = self.var_a88d035bffef9832.script_noteworthy;
    self.var_24bfbee1af3220e3 = get_dawg_start_node();
    self.players_approached = 0;
    self.handler_list = [ "karm", "mars" ];
    self.var_7434362e69f8b46a = [ "voss" ];
    self.allagents = [];
    self.routedifficulty = function_abfe0e7b6a340fb( self.var_24bfbee1af3220e3.origin );
    self.difficulty_region = self.routedifficulty;
    namespace_b451b5202140ccde::function_3b7d5e996ba0c975( ob_activity_definition_utils::function_e55fda458ce2c4cc( self ), self.playerparticipants );
    [ self.interact_struct ] = utility::getstructarray( self.varianttag, "script_noteworthy" );
    thread escort_objective_marker();
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x61bc36c1, Offset: 0x761
// Size: 0x19d
function escort_init()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.ambushradius = self.variant_definition.ambushradius;
    self.floodradius = self.variant_definition.floodradius;
    self.escorticon = self.variant_definition.escorticon;
    function_9ada410d170fa5cd();
    self.crate = spawnscriptable( "sat_ob_dawg_escort_crate", self.dawg_escort.origin, self.dawg_escort.angles );
    self.crate setscriptablepartstate( #"sat_ob_dawg_escort_crate", #"usable" );
    self.crate.activity_instance = self;
    escort_init_encounter();
    level ob_music::function_96d2da3192b28f8f( self, self.dawg_escort, [ self ] );
    mission_ui::function_1ee77ed07dcad9b7( 0, self.playerparticipants );
    mission_ui::function_a706272b19d49be5( 0, self.playerparticipants );
    ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_brief" );
    
    /#
        thread function_201b08c6cc41c43c();
    #/
    
    self.crate waittill( #"escort_started" );
    mission_ui::function_a706272b19d49be5( 1, self.playerparticipants );
    function_e3defe28050bed90();
    self.crate setscriptablepartstate( #"sat_ob_dawg_escort_crate", #"hide", 0 );
    wait 1.29;
    setup_dawg_escort_agent();
    thread function_44721e237619ae40();
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x8f77b8d1, Offset: 0x906
// Size: 0x38
function player_joined_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xd28a591, Offset: 0x946
// Size: 0xc8
function player_enter_awareness_zone( relevant_info_struct )
{
    if ( self.playerparticipants.size > 0 )
    {
        foreach ( player in relevant_info_struct.playerlist )
        {
            if ( arraycontains( self.playerparticipants, player ) && !self.players_approached )
            {
                ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_near" );
                self.players_approached = 1;
                break;
            }
        }
    }
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x532851f5, Offset: 0xa16
// Size: 0x23
function player_left_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xa60df44b, Offset: 0xa41
// Size: 0xc
function function_c7871b7129e9c0c8( relevant_info_struct )
{
    
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xed658bc0, Offset: 0xa55
// Size: 0x1a
function escort_begin()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x6ff17706, Offset: 0xa77
// Size: 0xbe
function function_27e324e81537eb44( player )
{
    player endon( #"disconnect" );
    self disablescriptableplayeruse( player );
    interaction_result = ob_interactions_util::function_c7b5806740384a61( "earpiece_press_sat_ob", player, self.activity_instance.dawg_escort.hack_duration, undefined, 1, 1, 1, -1, "ClinkInteractions" );
    
    if ( !player || !self )
    {
        return;
    }
    
    if ( !arraycontains( self.activity_instance.playerparticipants, player ) )
    {
        return;
    }
    
    self enablescriptableplayeruse( player );
    
    if ( interaction_result )
    {
        self notify( #"escort_started" );
        ob_activity_vo_utility::function_639b0047db8aec67( self.activity_instance, "dawg_escort_hack" );
    }
}

// Namespace ob_objectives_dawg_escort
// Params 6, eflags: 0x4
// Checksum 0xb473dd13, Offset: 0xb3d
// Size: 0xa8
function private function_6a37f5777ab5881e( instance, part, state, player, bautouse, usestring )
{
    activity_instance = instance.activity_instance;
    var_a8839a94f36d1f2e = isplayer( player ) && isalive( player ) && !player.inlaststand && !player isreloading() && !player isgestureplaying();
    
    if ( !activity_instance || !var_a8839a94f36d1f2e )
    {
        return;
    }
    
    instance thread function_27e324e81537eb44( player );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x2f09c87a, Offset: 0xbed
// Size: 0xa0
function escort_init_encounter()
{
    v_ground = self.var_24bfbee1af3220e3.origin;
    s_encounter = utility::array_random( self.variant_definition.initialencounter );
    encounter_name = "ai_encounter:" + s_encounter.encounter;
    request_id = activity_ai_encounters::function_eb8506829193f5eb( encounter_name, v_ground, 350, 1, 0, 1, 2 );
    activity_ai_encounters::function_6bf4ff2fbde584ee( request_id, &function_c7d6076ee5428ed9, self );
    
    /#
        function_1a9d724a960fa19d( request_id, self.routedifficulty, 1 );
    #/
}

// Namespace ob_objectives_dawg_escort
// Params 2
// Checksum 0xb4337f33, Offset: 0xc95
// Size: 0xdd
function function_c7d6076ee5428ed9( request_id, activity_instance )
{
    activity_instance endon( #"instance_destroyed" );
    activity_instance endon( #"activity_ended" );
    level endon( #"game_ended" );
    encounterdata = function_9b649316adcccbaa( request_id );
    
    foreach ( agent in encounterdata.ai )
    {
        thread ai_spawn_director::_wander( agent, agent.goalradius, 0, agent.goalpos );
    }
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xc4864619, Offset: 0xd7a
// Size: 0x119
function spawn_dawg_escort()
{
    spawndata = spawnstruct();
    spawndata.angles = self.var_24bfbee1af3220e3.angles;
    spawndata.team = self.playerparticipants[ 0 ].team;
    spawndata.origin = self.var_24bfbee1af3220e3.origin;
    
    if ( self.var_a88d035bffef9832.script_noteworthy == self.script_noteworthy )
    {
        var_306891c8d6b86e73 = ai_spawn_director::function_e19f6a00c4bb7490( "dawg_escort" + self.varianttag, 0, 1, 1, 1, 4 );
        function_64ac8c4e752f4dca( var_306891c8d6b86e73, 0 );
        ai_spawn_director::function_35aa3b1d92cd8207( "OnSpawned", var_306891c8d6b86e73, &function_938a3712d1236815, { #activity_instance:self } );
        ai_spawn_director::function_9893a28f1d682a28( var_306891c8d6b86e73, "sat_dawg_sm", spawndata.origin, spawndata.angles, 1, 0, 1, spawndata.team, undefined, undefined, undefined, undefined, 4 );
    }
}

// Namespace ob_objectives_dawg_escort
// Params 4
// Checksum 0xce62173d, Offset: 0xe9b
// Size: 0x150
function function_938a3712d1236815( group_id, user_data, agent, var_23727b9f7278a780 )
{
    dawg_escort = agent;
    owner = utility::spawn_tag_origin( dawg_escort.origin, dawg_escort.angles );
    owner.team = dawg_escort.team;
    dawg_escort.spawned_tag_origin = owner;
    dawg_escort.owner = owner;
    dawg_escort.activity_instance = user_data.activity_instance;
    dawg_escort.dontattackme = 0;
    dawg_escort.var_24954f14e27b448d = 0;
    
    if ( !isdefined( dawg_escort.emp_count ) )
    {
        dawg_escort.emp_count = 0;
    }
    
    dawg_escort.var_51facf23c1a1e4a8 = 1;
    dawg_escort.var_c3c4d711e69d5ab9 = 1;
    dawg_escort ai::magic_bullet_shield();
    dawg_escort ai::set_ignoreme( 1 );
    user_data.activity_instance.dawg_escort = dawg_escort;
    user_data.activity_instance.dawg_owner = owner;
    user_data.activity_instance notify( #"dawg_spawned" );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x9f3c5180, Offset: 0xff3
// Size: 0x52
function get_dawg_start_node()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    s_startnode = utility::getstruct( self.varianttag + "_PATH_START", "targetname" );
    assert( isdefined( s_startnode ), "<dev string:x24>" );
    return s_startnode;
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x2b6e5d08, Offset: 0x104e
// Size: 0x12a
function function_9ada410d170fa5cd()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    spawn_dawg_escort();
    msg = utility::waittill_any_timeout( 30, "dawg_spawned" );
    
    if ( msg == "timeout" )
    {
        assertmsg( "<dev string:x93>" + self.varianttag );
        activity_instance_common::function_9aeeabe50fc9cc3e( self );
        return;
    }
    
    self.dawg_escort.hack_duration = self.variant_definition.hackduration;
    wait 0.1;
    self.dawg_escort dawg_mp::function_4f88815c617846a2( self.dawg_escort.origin );
    self.dawg_escort waittill( #"sentry_complete" );
    self.dawg_escort dawg_pet_asm::remove_interact();
    self.dawg_escort.script_pushable_by_ai = 0;
    self.dawg_escort.script_pushable = 0;
    self.dawg_escort.turret dawg_turret::dawg_turret_stop();
    self notify( #"crate_spawned" );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x4af86a97, Offset: 0x1180
// Size: 0x1e2
function setup_dawg_escort_agent()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    
    if ( !self.dawg_escort )
    {
        activity_instance_common::endactivity( self, 0 );
    }
    
    self.dawg_escort ai::stop_magic_bullet_shield();
    self.dawg_escort ai::set_ignoreme( 0 );
    self.dawg_escort.owner.team = self.dawg_escort.team;
    self.dawg_escort thread dawg_turret::dawg_turret_set_owner( self.dawg_escort.owner );
    self.dawg_escort thread function_263c4d59ecf50132();
    self.dawg_escort dawg::function_8f769ad7e90f97e2( self.dawg_escort.origin );
    self.dawg_escort emp_debuff::set_apply_emp_callback( &on_emp_applied );
    emp_debuff::add_emp_ent( self.dawg_escort );
    self.dawg_escort emp_debuff::set_clear_emp_callback( &on_emp_cleared );
    self.dawg_escort escort_setup( self );
    thread escort_begin();
    objidpoolmanager::update_objective_onentity( self.activity_id, self.dawg_escort );
    objidpoolmanager::update_objective_setzoffset( self.activity_id, 48 );
    self.var_ab1b84cf0764314c = "dawg_escort" + self.dawg_escort getentitynumber();
    createnavrepulsor( self.var_ab1b84cf0764314c, -1, self.dawg_escort, 60, 1, "team_hundred_ninety" );
    self.dawg_escort thread dawg_go_path( self );
    self.dawg_escort thread function_29bdeded5290455e( self );
    self.dawg_escort thread function_7484a3cb39e90254( self );
    thread function_8d549e3dc586dc26();
    thread dawg_escort_complete();
    thread dawg_escort_damage_watcher();
    thread function_adeb34efec915f62();
}

// Namespace ob_objectives_dawg_escort
// Params 0, eflags: 0x4
// Checksum 0x9abee538, Offset: 0x136a
// Size: 0x18
function private function_e3defe28050bed90()
{
    mission_ui::function_d84701041f6f95c2( 1, 100, 100, self.playerparticipants );
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xea9a10d5, Offset: 0x138a
// Size: 0x7c
function on_emp_applied( data )
{
    utility::function_32b24db3127bff40( "emp", "on" );
    dawg_mp::function_4f88815c617846a2( self.origin );
    self.script_pushable_by_ai = 0;
    self.script_pushable = 0;
    self.isemp = 1;
    self.emp_count++;
    self notify( #"dawg_disabled" );
    self.activity_instance thread function_1840a5743edf0233( self.activity_instance, self );
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xf7bd15dd, Offset: 0x140e
// Size: 0x60
function on_emp_cleared( data )
{
    utility::function_32b24db3127bff40( "emp", "off" );
    self.isemp = 0;
    function_263c4d59ecf50132();
    self notify( #"ambush_clear" );
    self notify( #"dawg_repaired" );
    self.activity_instance thread function_4268b23dcfe77122( self.activity_instance, self );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x4bdcf197, Offset: 0x1476
// Size: 0x1e5
function dawg_escort_damage_watcher()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"death" );
    n_start_health = self.dawg_escort.health;
    var_ec28a57642acf449 = 0;
    
    for ( var_d1614750c98627d4 = 0; isdefined( self.dawg_escort ) ; var_d1614750c98627d4 = 1 )
    {
        self.dawg_escort waittill( #"damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon, origin, angles, normal, einflictor, eventid );
        
        if ( isplayer( eattacker ) && isdefined( idamage ) )
        {
            self.dawg_escort.health += idamage;
        }
        else
        {
            function_10d25060ab2c82ee( self.dawg_escort.health, n_start_health );
        }
        
        if ( self.dawg_escort.health / n_start_health <= 0.75 && !var_ec28a57642acf449 )
        {
            ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_initial" );
            var_ec28a57642acf449 = 1;
        }
        
        if ( self.dawg_escort.health / n_start_health <= 0.25 && !var_d1614750c98627d4 )
        {
            ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_damage" );
        }
    }
}

// Namespace ob_objectives_dawg_escort
// Params 2, eflags: 0x4
// Checksum 0xb7439647, Offset: 0x1663
// Size: 0x59
function private function_10d25060ab2c82ee( currentvalue, totalvalue )
{
    percentagecomplete = currentvalue / totalvalue * 100;
    n_percent = clamp( percentagecomplete, 0, 100 );
    n_percent = int( n_percent );
    mission_ui::function_d84701041f6f95c2( 1, n_percent, 100, self.playerparticipants );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x488616fd, Offset: 0x16c4
// Size: 0xbf
function function_adeb34efec915f62()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"escort_completed" );
    self.dawg_escort waittill( #"death" );
    self.dawg_escort.was_killed = 1;
    self.escort_dawg_destroyed = 1;
    
    if ( isdefined( self.extractheli ) )
    {
        self.extractheli.readytoleave = 1;
        self.extractheli notify( #"hash_8182ff35fd9e24b8" );
    }
    
    thread function_d95fccdb9bdc92e3();
    self.dawg_escort.is_neutralizing = 0;
    escort_end_activity( 0 );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x107ecbd0, Offset: 0x178b
// Size: 0x9f
function function_8d549e3dc586dc26()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"death" );
    self endon( #"escort_completed" );
    self.dawg_escort.progress = 0;
    
    while ( isdefined( self.dawg_escort ) )
    {
        self.dawg_escort waittill( #"dawg_disabled" );
        thread function_64bcfad0d8736bbd( self.variant_definition.floodencounters );
        self.dawg_escort thread function_bc315954282643b0( self );
    }
}

// Namespace ob_objectives_dawg_escort
// Params 1, eflags: 0x4
// Checksum 0x8ef6436e, Offset: 0x1832
// Size: 0x8c
function private function_bc315954282643b0( activity_instance )
{
    switch ( self.progress )
    {
        case 0:
            function_f076876ffd28e1bc( 1, activity_instance, activity_instance.emptime );
            break;
        case 1:
            function_f076876ffd28e1bc( 2, activity_instance, activity_instance.emptime );
            break;
        default:
            function_f076876ffd28e1bc( 3, activity_instance, activity_instance.emptime );
            break;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xa3e8c496, Offset: 0x18c6
// Size: 0x193
function escort_setup( activity_instance )
{
    self.team = level.players[ 0 ].team;
    self.health = activity_instance.variant_definition.escorthealth;
    self.proximity = activity_instance.variant_definition.escortproximity;
    self.attractradi = activity_instance.variant_definition.escortattractor;
    self.ambushradius = activity_instance.variant_definition.ambushradius;
    self.ambushdist = activity_instance.variant_definition.ambushdistance;
    self.attackencounters = activity_instance.variant_definition.attackencounters;
    self.empencounters = activity_instance.variant_definition.var_5d25d56e2e917a8e;
    self.defendencounters = activity_instance.variant_definition.defendencounter;
    self.floodencounters = activity_instance.variant_definition.floodencounters;
    self.defendduration = activity_instance.variant_definition.defendduration;
    self setcandamage( 1 );
    self.attractor = zombie_attractor_manager::add_attractor( self, 1, self.attractradi, 1, undefined, &function_39a00a445d5be416 );
    zombie_attractor_manager::function_4c34b0f066a9d9fe( self.attractor, 90 );
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x7e4fbe20, Offset: 0x1a61
// Size: 0x1c7
function dawg_go_path( activity_instance )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    self endon( #"death" );
    self endon( #"reached_end_node" );
    self.currentnode = activity_instance.var_24bfbee1af3220e3;
    self.nextnode = utility::getstruct( self.currentnode.target, "targetname" );
    dawg::function_8f769ad7e90f97e2( self.nextnode.origin );
    function_263c4d59ecf50132();
    
    while ( true )
    {
        if ( self.being_pet )
        {
            utility::waittill_notify_or_timeout( "petting_finished", 10 );
            function_263c4d59ecf50132();
            dawg::function_8f769ad7e90f97e2( self.currentnode.origin );
        }
        
        if ( function_dd494d90ee4fbd8( self.nextnode ) )
        {
            self.currentnode = self.nextnode;
            self.nextnode = undefined;
            
            if ( self.currentnode.script_noteworthy == "ambush" )
            {
                self notify( #"ambush" );
                self waittill( #"ambush_clear" );
            }
            
            if ( isdefined( self.currentnode.target ) )
            {
                self.nextnode = utility::getstruct( self.currentnode.target, "targetname" );
            }
            else
            {
                self notify( #"reached_end_node" );
                break;
            }
        }
        
        if ( !function_16beed18c044684b( self, activity_instance ) )
        {
            activity_instance escort_end_activity( 0 );
        }
        
        dawg::function_8f769ad7e90f97e2( self.nextnode.origin );
        wait 0.1;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xb68b64b, Offset: 0x1c30
// Size: 0x76
function function_dd494d90ee4fbd8( node )
{
    var_aa2a31b62fda4aee = squared( 48 );
    dist = distancesquared( node.origin, self.origin );
    
    if ( isdefined( node.origin ) && distancesquared( node.origin, self.origin ) <= var_aa2a31b62fda4aee )
    {
        return 1;
    }
    
    return 0;
}

// Namespace ob_objectives_dawg_escort
// Params 2
// Checksum 0x795d1645, Offset: 0x1cae
// Size: 0x5a
function function_16beed18c044684b( dawg, activity_instance )
{
    if ( isdefined( activity_instance.playerparticipants ) )
    {
        player = function_47c86977a18df38b( activity_instance.playerparticipants, dawg.origin, 4000 );
    }
    
    if ( player )
    {
        return 1;
    }
    
    return 0;
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x822d1957, Offset: 0x1d10
// Size: 0x86
function function_263c4d59ecf50132()
{
    if ( self.var_b566b2d61a12539d )
    {
        self.var_b566b2d61a12539d delete();
    }
    
    asmstate = self asmgetcurrentstate( self.asmname );
    
    if ( asmstate == "sentry_mode_in" || asmstate == "sentry_mode" )
    {
        asm::function_7256f5ba459c840b( "sentry_mode_out" );
    }
    
    self.script_pushable_by_ai = 1;
    self.script_pushable = 1;
    self.turret dawg_turret::function_609516267ed6c6b3();
    dawg_mp::function_5fb9cbb29986580b();
}

// Namespace ob_objectives_dawg_escort
// Params 1, eflags: 0x4
// Checksum 0x92c1a085, Offset: 0x1d9e
// Size: 0x178
function private function_b6a0345f45205c47( radius )
{
    position = self.origin;
    empd_ents = emp_debuff::empdebuff_get_emp_ents( position, radius );
    players = getplayersinradius( position, radius );
    emp_weapon = makeweapon( "emp_pulse_mp" );
    empd_ents = arraycombineunique( empd_ents, players );
    
    foreach ( ent in empd_ents )
    {
        data = damage_utility::packdamagedata( self, ent, 1, emp_weapon );
        isvehicle = ent vehicle::is_vehicle();
        
        if ( isplayer( ent ) )
        {
            ent thread function_cc03a993b2c8005f( self.activity_instance.var_767c75e61c5f7e3a );
            continue;
        }
        
        if ( isvehicle )
        {
            ent thread emp_debuff::function_1fdeda386a85c7c7( data, self.activity_instance.emptime );
            continue;
        }
        
        ent thread emp_debuff::function_1fdeda386a85c7c7( data, self.activity_instance.emptime );
    }
    
    playfx( utility::getfx( "vfx_sat_dawg_emp" ), position );
    self playsound( "evt_dawg_emp_blast" );
}

// Namespace ob_objectives_dawg_escort
// Params 1, eflags: 0x4
// Checksum 0xcb8ecf3a, Offset: 0x1f1e
// Size: 0x38
function private function_cc03a993b2c8005f( duration_seconds )
{
    self endon( #"disconnect" );
    emp_debuff::play_emp_scramble( 1 );
    utility::waittill_any_timeout( duration_seconds, "emp_removed" );
    emp_debuff::stop_emp_scramble( 1 );
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x3df64743, Offset: 0x1f5e
// Size: 0x18a
function function_29bdeded5290455e( activity_instance )
{
    self endon( #"death" );
    self endon( #"reached_end_node" );
    n_proximity = squared( self.proximity );
    self.generateslots = 0;
    
    while ( true )
    {
        self.b_proximity = 0;
        self.n_players = 0;
        a_players = activity_instance.playerparticipants;
        
        foreach ( player in a_players )
        {
            if ( isdefined( player ) && isdefined( self ) && distancesquared( self.origin, player.origin ) <= n_proximity )
            {
                self.b_proximity = 1;
                self.n_players++;
            }
        }
        
        n_players = self.n_players - 1;
        n_players = clamp( n_players, 0, 3 );
        wait 0.5;
        
        if ( !self.b_proximity )
        {
            self notify( #"hash_de8b864ac79b2aa4" );
        }
        else
        {
            self notify( #"escorts" );
        }
        
        if ( self.b_proximity )
        {
            spawn_attractor_slots();
            continue;
        }
        
        remove_attractor_slots();
    }
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x276ac245, Offset: 0x20f0
// Size: 0x244
function function_44721e237619ae40()
{
    level endon( #"game_ended" );
    self.dawg_escort endon( #"death" );
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort waittill( #"reached_end_node" );
    self.dawg_escort dawg_mp::function_4f88815c617846a2( self.dawg_escort.origin );
    self.dawg_escort.waitingexfil = 1;
    self.dawg_escort.isemp = undefined;
    thread function_64bcfad0d8736bbd( self.dawg_escort.defendencounters );
    ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_extraction" );
    wait self.dawg_escort.defendduration;
    self.dawg_escort.waitingexfil = 1;
    self.extractheli = self.dawg_escort namespace_2fa0d8ac31fa2ddc::function_96b46bf7cb30b361( self.var_f9a39cf846e53ddb.origin, ( 360, 0, 40 ) );
    var_edd52247474c7dab = 1;
    self.dawg_escort dawg_pet_asm::remove_interact();
    ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_acknowledge" );
    self.extractheli waittill( #"loop_wait" );
    waitframe();
    self.dawg_escort ai::magic_bullet_shield();
    self.var_cb82aca39395005a = spawn( "script_model", self.extractheli.crate.origin );
    self.var_cb82aca39395005a linkto( self.extractheli.crate, "tag_origin", ( 0, 0, -34.5366 ), ( 0, 0, 0 ) );
    self.dawg_escort linkto( self.var_cb82aca39395005a );
    self.dawg_escort playsound( "evt_vtol_dawg_magnet" );
    self.extractheli.readytoleave = 1;
    self.extractheli notify( #"hash_8182ff35fd9e24b8" );
    self notify( #"escort_completed" );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x2da31b18, Offset: 0x233c
// Size: 0x119
function dawg_escort_complete()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"death" );
    self waittill( #"escort_completed" );
    zombie_attractor_manager::remove_attractor( self.dawg_escort.attractor );
    
    foreach ( agent in self.allagents )
    {
        if ( isalive( agent ) )
        {
            agent function_fa32376aaa88a7a2( self.var_f9a39cf846e53ddb.origin, 500 );
            agent setgoalpos( self.var_f9a39cf846e53ddb.origin );
            agent.favoriteenemy = undefined;
        }
    }
    
    escort_end_activity( 1 );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xeba820ed, Offset: 0x245d
// Size: 0x130
function spawn_attractor_slots()
{
    self endon( #"death" );
    
    if ( self.generateslots == 0 )
    {
        return;
    }
    
    var_e39ff8783acd10ed = anglestoforward( self.angles );
    var_a3f49416f6729b62 = anglestoright( self.angles );
    var_58e6c143f3e3a9f5 = [];
    var_d5dd98c9e922388 = generate_attractor_slot( 36, -90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    var_d5dd98c9e922388 = generate_attractor_slot( 36, 90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    var_d5dd98c9e922388 = generate_attractor_slot( -24, -90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    var_d5dd98c9e922388 = generate_attractor_slot( -24, 90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    var_d5dd98c9e922388 = generate_attractor_slot( -72, -90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    var_d5dd98c9e922388 = generate_attractor_slot( -72, 90, var_e39ff8783acd10ed, var_a3f49416f6729b62 );
    var_58e6c143f3e3a9f5 = arraycombineunique( var_58e6c143f3e3a9f5, [ var_d5dd98c9e922388 ] );
    zombie_attractor_manager::set_attractor_slots( self.attractor, var_58e6c143f3e3a9f5 );
    self.generateslots = 0;
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x93ebbdb2, Offset: 0x2595
// Size: 0x48
function remove_attractor_slots()
{
    self endon( #"death" );
    
    if ( self.generateslots == 1 )
    {
        return;
    }
    
    a_empty = [];
    zombie_attractor_manager::set_attractor_slots( self.attractor, a_empty );
    self.generateslots = 1;
}

// Namespace ob_objectives_dawg_escort
// Params 4
// Checksum 0xcc9b8e4e, Offset: 0x25e5
// Size: 0x58
function generate_attractor_slot( xoffset, yoffset, anglesforward, anglesright )
{
    var_bdcff01de571564d = spawnstruct();
    var_bdcff01de571564d.origin = self.origin + anglesforward * xoffset + anglesright * yoffset;
    return var_bdcff01de571564d;
}

// Namespace ob_objectives_dawg_escort
// Params 2
// Checksum 0xe5f405de, Offset: 0x2646
// Size: 0xb8
function function_39a00a445d5be416( attractor, zombie )
{
    if ( isdefined( zombie.var_bd22ba6c600a23a3 ) )
    {
        return 0;
    }
    
    if ( isdefined( level.players ) )
    {
        player = function_47c86977a18df38b( level.players, zombie.origin, 3500 );
        
        if ( isdefined( player ) && distance2dsquared( zombie.origin, player.origin ) < distance2dsquared( zombie.origin, attractor.source.origin ) )
        {
            return 0;
        }
    }
    
    if ( isalive( zombie ) && isdefined( attractor ) )
    {
        return 1;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 3, eflags: 0x4
// Checksum 0x769f4a79, Offset: 0x2706
// Size: 0x131
function private function_f076876ffd28e1bc( spawncount, activity_instance, f_time )
{
    self endon( #"death" );
    spawns = 0;
    s_encounter = utility::array_random( self.empencounters );
    a_s_pts = get_spawn_structs();
    assert( isdefined( a_s_pts ), "<dev string:xb1>" );
    encounter_name = "ai_encounter:" + s_encounter.encounter;
    n_spawn_radius = self.ambushradius;
    timer = f_time / spawncount;
    spawntimer = clamp( timer, 5, 15 );
    
    while ( true )
    {
        if ( isdefined( a_s_pts ) )
        {
            a_s_pts = arrayrandomize( a_s_pts );
            v_ground = a_s_pts[ 0 ].origin;
            request_id = activity_instance activity_ai_encounters::function_eb8506829193f5eb( encounter_name, v_ground, n_spawn_radius, 1, 0, 1, 2 );
            
            /#
                function_1a9d724a960fa19d( request_id, activity_instance.routedifficulty, 1 );
            #/
            
            spawns++;
            
            if ( spawns >= spawncount )
            {
                break;
            }
        }
        
        wait spawntimer;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x3eb2cba0, Offset: 0x283f
// Size: 0x10a
function function_64bcfad0d8736bbd( var_a501349ca2498cf8 )
{
    /#
        if ( getdvarint( @"hash_afe475c155b4d1a1", 0 ) == 1 )
        {
            return;
        }
    #/
    
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"death" );
    n_spawn_radius = self.floodradius;
    s_encounter = utility::array_random( var_a501349ca2498cf8 );
    encounter_name = "ai_encounter:" + s_encounter.floodencounter;
    request_id = activity_ai_encounters::function_eb8506829193f5eb( encounter_name, self.dawg_escort.origin, n_spawn_radius, 1, 0, 1, 2 );
    activity_ai_encounters::function_52d1342183200a8f( request_id, &function_8b88ea127d8976f5, self );
    
    /#
        function_1a9d724a960fa19d( request_id, self.routedifficulty, 1 );
    #/
    
    activity_ai_encounters::function_dcf6bdb6ee9d1ca0( request_id, &function_9a187520dbab3065, undefined );
    activity_ai_encounters::function_d33de057e760c97b( request_id, &function_c7f93fe30f897dde, self.dawg_escort );
}

// Namespace ob_objectives_dawg_escort
// Params 4
// Checksum 0xedec5234, Offset: 0x2951
// Size: 0xd4
function function_8b88ea127d8976f5( requestid, userdata, agent, data )
{
    agent endon( #"death" );
    
    if ( agent.type != "zombie" )
    {
        activity_instance = userdata;
        agent setgoalentity( activity_instance.dawg_escort );
        agent.goalradius = 500;
        agent setstealthstate( "combat" );
        agent.favoriteenemy = activity_instance.dawg_escort;
        agent function_fa32376aaa88a7a2( activity_instance.dawg_escort.origin, 1500 );
        activity_instance.allagents[ activity_instance.allagents.size ] = agent;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 2
// Checksum 0x9ca42540, Offset: 0x2a2d
// Size: 0x17, Type: bool
function function_9a187520dbab3065( requestid, userdata )
{
    return true;
}

// Namespace ob_objectives_dawg_escort
// Params 2
// Checksum 0xecd9becc, Offset: 0x2a4d
// Size: 0x4f, Type: bool
function function_c7f93fe30f897dde( requestid, userdata )
{
    if ( isdefined( userdata.isemp ) )
    {
        return !userdata.isemp;
    }
    
    if ( isdefined( userdata.waitingexfil ) )
    {
        return !userdata.waitingexfil;
    }
    
    return true;
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0x118ee800, Offset: 0x2aa5
// Size: 0x63
function function_7484a3cb39e90254( activity_instance )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    self endon( #"reached_end_node" );
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"ambush" );
        thread function_b6a0345f45205c47( self.ambushradius );
    }
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xa56da731, Offset: 0x2b10
// Size: 0xda
function get_encounter_spawn_location()
{
    self endon( #"death" );
    nd_current = self.currentnode;
    v_ground = undefined;
    
    if ( isdefined( nd_current ) )
    {
        v_forward = vectornormalize( anglestoforward( nd_current.angles ) ) * self.ambushdist + nd_current.origin;
    }
    else
    {
        v_forward = vectornormalize( anglestoforward( self.angles ) ) * self.ambushdist + self.origin;
    }
    
    if ( isdefined( v_forward ) )
    {
        v_ground = utility::groundpos( v_forward );
    }
    
    if ( !isdefined( v_ground ) )
    {
        if ( isdefined( self.nextnode ) )
        {
            v_ground = self.nextnode.origin;
        }
        else
        {
            v_ground = self.origin;
        }
    }
    
    return v_ground;
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xf724e328, Offset: 0x2bf3
// Size: 0x6a
function get_spawn_structs()
{
    self endon( #"death" );
    nd_current = self.currentnode;
    s_pt = undefined;
    
    if ( isdefined( nd_current.target2 ) )
    {
        a_s_pts = utility::getstructarray( nd_current.target2, "targetname" );
    }
    else
    {
        return;
    }
    
    if ( isdefined( a_s_pts ) )
    {
        return a_s_pts;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xd4341c6b, Offset: 0x2c65
// Size: 0x41
function function_b621ed14c1517f42()
{
    centerpoint = undefined;
    
    if ( isdefined( self.dawg_escort ) )
    {
        centerpoint = self.dawg_escort.origin + ( 0, 0, 48 );
    }
    
    return centerpoint;
}

// Namespace ob_objectives_dawg_escort
// Params 1
// Checksum 0xd2af378b, Offset: 0x2caf
// Size: 0x111
function escort_end_activity( success )
{
    if ( !success )
    {
        ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_fail" );
    }
    else
    {
        spawn_options = common_item::items_initspawnoptions_spawnfromposition( self.dawg_escort.origin );
        spawned_items = common_item::function_38cde6a6acb68ea6( %"hash_4949f0b4e60d6342", 1, spawn_options );
        ob_activity_vo_utility::function_639b0047db8aec67( self, "dawg_escort_success" );
        
        foreach ( player in self.playerparticipants )
        {
            if ( story_contract_util::is_activity_completed( player, #"libra_complete" ) )
            {
                thread ob_activity_vo_utility::function_5e9786e501cd7383( self, "dawg_escort_success", [ player ] );
            }
        }
    }
    
    activity_instance_common::endactivity( self, success );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x53ffbdcc, Offset: 0x2dc8
// Size: 0x4e
function escort_dawg_cleanup()
{
    level ob_music::function_be4c0727a998b18b( self );
    self.was_cancelled = 1;
    function_d95fccdb9bdc92e3();
    
    if ( self.dawg_escort && !self.escort_dawg_destroyed )
    {
        self.dawg_escort agent_utils::despawnagent();
    }
    
    function_9f78b1c62dc7d3c2();
}

// Namespace ob_objectives_dawg_escort
// Params 0, eflags: 0x4
// Checksum 0xaa0fc4c3, Offset: 0x2e1e
// Size: 0x108
function private function_d95fccdb9bdc92e3()
{
    if ( isdefined( self.crate ) )
    {
        self.crate setscriptablepartstate( #"sat_ob_dawg_escort_crate", #"hide" );
        self.crate freescriptable();
    }
    
    if ( isdefined( self.dawg_escort ) )
    {
        if ( isdefined( self.dawg_escort.attractor ) )
        {
            zombie_attractor_manager::remove_attractor( self.dawg_escort.attractor );
        }
    }
    
    if ( !isdefined( self.dawg_escort ) )
    {
        if ( isdefined( self.extractheli ) )
        {
            self.extractheli.readytoleave = 1;
            self.extractheli notify( #"hash_8182ff35fd9e24b8" );
        }
    }
    
    if ( self.var_cb82aca39395005a )
    {
        self.var_cb82aca39395005a delete();
        self.var_cb82aca39395005a = undefined;
    }
    
    if ( self.dawg_owner )
    {
        self.dawg_owner delete();
        self.dawg_owner = undefined;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x77a84b6c, Offset: 0x2f2e
// Size: 0x12
function escort_dawg_end()
{
    level ob_music::function_be4c0727a998b18b( self );
    function_9f78b1c62dc7d3c2();
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0xebd8a8c, Offset: 0x2f48
// Size: 0x70
function escort_objective_marker()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self waittill( #"crate_spawned" );
    waitframe();
    self.activity_id = namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_dawg_walk_marker", 0, 1 );
    objidpoolmanager::update_objective_position( self.activity_id, self.crate.origin + ( 0, 0, 48 ) );
}

// Namespace ob_objectives_dawg_escort
// Params 1, eflags: 0x4
// Checksum 0x410f2f49, Offset: 0x2fc0
// Size: 0x41
function private function_abfe0e7b6a340fb( location )
{
    escort_difficulty = region_difficulty_manager::get_region_difficulty( location );
    
    if ( escort_difficulty == "difficulty_undefined" )
    {
        escort_difficulty = getdvar( @"hash_b1c2f60cf246f369", "difficulty_easy" );
    }
    
    return escort_difficulty;
}

// Namespace ob_objectives_dawg_escort
// Params 0, eflags: 0x4
// Checksum 0xb39e6615, Offset: 0x300a
// Size: 0x26
function private function_9f78b1c62dc7d3c2()
{
    if ( self.var_ab1b84cf0764314c )
    {
        destroynavrepulsor( self.var_ab1b84cf0764314c );
        self.var_ab1b84cf0764314c = undefined;
    }
}

// Namespace ob_objectives_dawg_escort
// Params 2, eflags: 0x4
// Checksum 0x7049e546, Offset: 0x3038
// Size: 0x7b
function private function_1840a5743edf0233( activity_instance, dawg )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level endon( #"game_ended" );
    dawg endon( #"death" );
    wait 1;
    
    if ( dawg.emp_count == 1 )
    {
        ob_activity_vo_utility::function_639b0047db8aec67( activity_instance, "dawg_escort_emp_1" );
        return;
    }
    
    ob_activity_vo_utility::function_639b0047db8aec67( activity_instance, "dawg_escort_emp_2" );
}

// Namespace ob_objectives_dawg_escort
// Params 2, eflags: 0x4
// Checksum 0x89a6bfb7, Offset: 0x30bb
// Size: 0x7c
function private function_4268b23dcfe77122( activity_instance, dawg )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    level endon( #"game_ended" );
    dawg endon( #"death" );
    wait 1.5;
    
    if ( self.emp_count == 1 )
    {
        ob_activity_vo_utility::function_639b0047db8aec67( activity_instance, "dawg_escort_reactivate_1" );
        return;
    }
    
    ob_activity_vo_utility::function_639b0047db8aec67( activity_instance, "dawg_escort_reactivate_2" );
}

// Namespace ob_objectives_dawg_escort
// Params 0
// Checksum 0x2b72e036, Offset: 0x313f
// Size: 0x1df
function function_201b08c6cc41c43c()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.dawg_escort endon( #"death" );
    setdvarifuninitialized( @"hash_aee5cbde50a879d3", 0 );
    
    while ( true )
    {
        force_extract = getdvarint( @"hash_aee5cbde50a879d3", 0 );
        
        if ( force_extract )
        {
            self.dawg_escort dawg_mp::function_4f88815c617846a2( self.dawg_escort.origin );
            self.extractheli = self.dawg_escort namespace_2fa0d8ac31fa2ddc::function_96b46bf7cb30b361( self.dawg_escort.origin, ( 360, 0, 40 ) );
            var_edd52247474c7dab = 1;
            self.extractheli waittill( #"loop_wait" );
            waitframe();
            self.dawg_escort ai::magic_bullet_shield();
            self.var_cb82aca39395005a = spawn( "script_model", self.extractheli.crate.origin );
            self.var_cb82aca39395005a linkto( self.extractheli.crate, "tag_origin", ( 0, 0, -34.5366 ), ( 0, 0, 0 ) );
            self.dawg_escort linkto( self.var_cb82aca39395005a );
            self.extractheli.readytoleave = 1;
            self.extractheli notify( #"hash_8182ff35fd9e24b8" );
            self.extractheli.crate playsoundonmovingent( "mp_dmz_cargo_delivery_hook" );
            self notify( #"escort_completed" );
            setdvar( @"hash_aee5cbde50a879d3", 0 );
        }
        
        wait 0.1;
    }
}

/#

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0xc
    // Checksum 0x5743119, Offset: 0x3326
    // Size: 0x8f, Type: dev
    function private init_devgui()
    {
        self notify( #"hash_f2c4bf89412811f6" );
        self endon( #"hash_f2c4bf89412811f6" );
        wait 1;
        root = "<dev string:xf3>" + "<dev string:x11a>" + "<dev string:x12d>";
        devgui::function_9082edeb5db93280( root );
        devgui::add_devgui_func( "<dev string:x12f>", "<dev string:x13d>", &function_1f739084d1df9672 );
        devgui::add_devgui_func( "<dev string:x157>", "<dev string:x168>", &function_d41a5e56c6a3bbca );
        devgui::add_devgui_func( "<dev string:x185>", "<dev string:x195>", &function_695119aa72f38424 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0x4
    // Checksum 0x191e3257, Offset: 0x33bd
    // Size: 0x14f, Type: dev
    function private function_1f739084d1df9672()
    {
        me = level.players[ 0 ];
        
        if ( !me )
        {
            return;
        }
        
        m_origin = me.origin;
        d = -1;
        closest_instance = undefined;
        
        foreach ( instance in level.activities.instances )
        {
            if ( instance.type == "<dev string:x11a>" && instance.interact_struct )
            {
                td = distance2dsquared( m_origin, instance.interact_struct.origin );
                
                if ( d < 0 )
                {
                    d = td;
                    closest_instance = instance;
                }
                
                if ( td < d )
                {
                    d = td;
                    closest_instance = instance;
                }
            }
        }
        
        if ( isdefined( closest_instance ) )
        {
            me setorigin( closest_instance.interact_struct.origin );
        }
    }

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0x4
    // Checksum 0xdf05b2c5, Offset: 0x3514
    // Size: 0x6e, Type: dev
    function private function_d41a5e56c6a3bbca()
    {
        me = level.players[ 0 ];
        
        if ( !me )
        {
            return;
        }
        
        activity_instance = function_8ec4b4a8b57613e4();
        
        if ( !activity_instance )
        {
            return;
        }
        
        if ( activity_instance.crate.origin )
        {
            me setorigin( activity_instance.crate.origin );
        }
    }

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0x4
    // Checksum 0x3db86391, Offset: 0x358a
    // Size: 0x9f, Type: dev
    function private function_695119aa72f38424()
    {
        me = level.players[ 0 ];
        
        if ( !me )
        {
            return;
        }
        
        activity_instance = function_8ec4b4a8b57613e4();
        
        if ( !activity_instance )
        {
            return;
        }
        
        dog = activity_instance.dawg_escort;
        
        if ( !dog )
        {
            return;
        }
        
        end_origin = activity_instance.var_f9a39cf846e53ddb.origin;
        
        if ( !end_origin )
        {
            return;
        }
        
        me setorigin( end_origin );
        dog.origin = end_origin;
        dog notify( #"reached_end_node" );
    }

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0x4
    // Checksum 0x1b71734, Offset: 0x3631
    // Size: 0x31, Type: dev
    function private function_8ec4b4a8b57613e4()
    {
        me = level.players[ 0 ];
        
        if ( !me )
        {
            return;
        }
        
        return namespace_e55955ff7520be97::function_227ea43efd2cfb5c( me, "<dev string:x11a>" );
    }

    // Namespace ob_objectives_dawg_escort
    // Params 0, eflags: 0x4
    // Checksum 0x62398fce, Offset: 0x366a
    // Size: 0x2a, Type: dev
    function private function_9e845c0432bd0be4()
    {
        activity_instance = function_8ec4b4a8b57613e4();
        
        if ( !activity_instance )
        {
            return;
        }
        
        return activity_instance.dawg_escort;
    }

#/
