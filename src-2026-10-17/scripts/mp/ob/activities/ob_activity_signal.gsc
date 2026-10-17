#using script_1aae2eb1ef28b239;
#using script_2a9058c1321cd25d;
#using script_3a459cb70cbfb426;
#using script_6d32c773f74edb3d;
#using script_78c71390bb3043df;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\puzzles\signal_detected;
#using scripts\common\scene;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_cache;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\activities\ob_activity_utility;
#using scripts\mp\ob\activities\ob_activity_vo_utility;
#using scripts\mp\ob\systems\region_difficulty_manager;

#namespace ob_activity_signal;

// Namespace ob_activity_signal
// Params 0, eflags: 0x5
// Checksum 0xd52d4fae, Offset: 0x226
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_ecfc1ced063c8eb1", #"activity_common", &function_538033a540e63c70, undefined );
}

// Namespace ob_activity_signal
// Params 0, eflags: 0x4
// Checksum 0x6b6dfa35, Offset: 0x24f
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "REV_OB_SIGNAL", &activity_type_init );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x38b80d29, Offset: 0x26a
// Size: 0x79
function activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "REV_OB_SIGNAL", 0, &signal_activity_setup );
    activity_common::function_944074f3079c1d4e( "REV_OB_SIGNAL", 1, &signal_activity_begin );
    activity_common::function_944074f3079c1d4e( "REV_OB_SIGNAL", 2, &signal_activity_ended );
    activity_common::function_944074f3079c1d4e( "REV_OB_SIGNAL", 3, &signal_activity_destroy );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &signal_player_joined_activity, "REV_OB_SIGNAL" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &signal_player_left_activity, "REV_OB_SIGNAL" );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x10e6167a, Offset: 0x2eb
// Size: 0x2a6
function signal_activity_setup()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activityvariantdefinition = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    self.variant_definition = activityvariantdefinition;
    self.signalencounters = activity_instance.variant_definition.var_27ba0f662855e60c;
    self.ambushradius = activity_instance.variant_definition.ambushradius;
    self.ambushchance = activity_instance.variant_definition.ambushchance;
    self.minechance = activity_instance.variant_definition.minechance;
    self.botchance = activity_instance.variant_definition.botchance;
    var_c4a06f4179c15fc3 = utility::getent_or_struct_array( self.varianttag + "_object", "targetname" );
    self.mines = [];
    self.mines_spawnpoints = [];
    self.ai_encounter_spawnpoints = [];
    self.ambush_triggers = [];
    self.var_22ee17551f2d53f0 = [];
    self.ambush_triggered = 0;
    
    foreach ( struct in var_c4a06f4179c15fc3 )
    {
        switch ( struct.script_noteworthy )
        {
            case #"hash_897efa1e1a715859":
                self.var_7b00a80cb52806b8 = struct;
                break;
            case #"hash_bfabb834c595ff16":
                self.mines_spawnpoints[ self.mines_spawnpoints.size ] = struct;
                break;
            case #"hash_74b110c460d7c809":
                self.ai_encounter_spawnpoints[ self.ai_encounter_spawnpoints.size ] = struct;
                break;
            case #"hash_857d06b3cdc5796a":
                struct.activity_instance = self;
                self.ambush_trigger = struct;
                break;
            case #"hash_61aebea857c4c90d":
                self.var_22ee17551f2d53f0[ self.var_22ee17551f2d53f0.size ] = struct;
                break;
        }
    }
    
    if ( self.var_7b00a80cb52806b8 )
    {
        self.difficulty_region = region_difficulty_manager::get_region_difficulty( self.var_7b00a80cb52806b8 );
    }
    else
    {
        self.difficulty_region = "difficulty_easy";
    }
    
    activity_instance_common::function_46135a69bddfec2c( activity_instance );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x41adec72, Offset: 0x599
// Size: 0xb6
function signal_activity_begin()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_participation::function_a45fd1c5cc774007( self );
    function_d7d6df87c5df7708();
    thread spawn_bots();
    
    if ( utility::percent_chance( self.minechance ) || getdvarint( @"scr_signal_mines", 0 ) == 1 )
    {
        trap_owner = ob_activity_utility::function_d12ca4c58fe5faf0();
        thread function_d52b869b4b094f1d( trap_owner );
    }
    
    if ( utility::percent_chance( self.botchance ) || getdvarint( @"hash_6ff9ef129bd81ab5", 0 ) == 1 )
    {
        self.ambush_trigger thread ambushwatchtriggerenter();
    }
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0xa3513033, Offset: 0x657
// Size: 0x1c1
function function_d7d6df87c5df7708()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    signal_object = spawnscriptable( "sat_ob_loot_cache", self.var_7b00a80cb52806b8.origin, self.var_7b00a80cb52806b8.angles );
    signal_object setscriptablepartstate( "body", #"closed_usable_no_collision" );
    item_amount = 3;
    loot_list = "ob_sat_items_activity_roadside_assistance_tier_1";
    common_cache::fillcontentsfromlist( signal_object, loot_list, item_amount );
    signal_object.activity_instance = self;
    signal_object.var_6e39895e14c70e34 = &function_ed4af28bdf234e5a;
    ent = spawn( "script_model", self.var_7b00a80cb52806b8.origin );
    trigger = getnoentvolumearray( self.var_7b00a80cb52806b8.target, #targetname )[ 0 ];
    assert( isdefined( trigger ), "<dev string:x24>" + "<dev string:x4c>" );
    self.radio_data = { #looping_sound:"uin_sat_radio_puzzle_static_lp", #paramname:"signal", #pauseintro:0, #y_pos:80, #x_pos:0, #entitynum:ent getentitynumber(), #entity:ent, #registered_players:[], #volume:trigger };
    trigger.radio_data = self.radio_data;
    trigger childthread signal_detected::function_8a1ab9c1bb59bbd3();
    trigger thread function_c18b8849bc4409c0( activity_instance );
    return signal_object;
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0xc2f639f6, Offset: 0x821
// Size: 0xac
function function_c18b8849bc4409c0( activity_instance )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    
    while ( true )
    {
        self waittill( #"trigger", enteringentity );
        
        if ( !isdefined( enteringentity ) )
        {
            continue;
        }
        
        if ( self.var_dc7f729fa4fc4489 )
        {
            continue;
        }
        
        if ( isplayer( enteringentity ) )
        {
            if ( !activity_participation::function_e7fc1202ac164928( activity_instance, enteringentity ) )
            {
                activity_participation::function_bc67362dace4370c( activity_instance, enteringentity );
                namespace_e81a4357e5094976::function_3a48100939e009e9( activity_instance, "signal_brief" );
            }
        }
        
        wait 0.5;
    }
}

// Namespace ob_activity_signal
// Params 2
// Checksum 0xb606f1f2, Offset: 0x8d5
// Size: 0x66
function function_ed4af28bdf234e5a( instance, player )
{
    activity_instance = instance.activity_instance;
    radio_data_cleanup( activity_instance );
    
    if ( isdefined( activity_instance ) && activity_instance_common::getactivitystate( activity_instance ) == "Active" )
    {
        namespace_e81a4357e5094976::function_3a48100939e009e9( activity_instance, "signal_success" );
        activity_instance_common::endactivity( activity_instance, 1 );
    }
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0x2f925c77, Offset: 0x943
// Size: 0xd9
function function_d52b869b4b094f1d( owner )
{
    foreach ( struct in self.mines_spawnpoints )
    {
        mine = ob_soldier_util::ob_mine_spawn( struct.origin, undefined, owner, undefined, struct.angles, 1 );
        
        if ( getdvarint( @"hash_d670f137f06e577f", 0 ) )
        {
            ob_resource_manager::function_4d956586279ad989( mine );
        }
        
        self.mines[ self.mines.size ] = mine;
    }
}

// Namespace ob_activity_signal
// Params 0, eflags: 0x4
// Checksum 0x3d2ce28c, Offset: 0xa24
// Size: 0xdd
function private spawn_bots()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    level endon( #"game_ended" );
    
    foreach ( struct in self.var_22ee17551f2d53f0 )
    {
        struct.activity_instance = self;
        struct scene::init();
        bot = struct scene::get_entity( 0 );
        
        if ( isdefined( bot ) )
        {
            struct thread scene::play( undefined, "idle" );
            bot childthread spawn_bot();
        }
    }
}

// Namespace ob_activity_signal
// Params 0, eflags: 0x4
// Checksum 0xb6f6ec74, Offset: 0xb09
// Size: 0xe8
function private spawn_bot()
{
    spawn_struct = self.sceneobjectdata.sceneroot;
    self.activity_instance = spawn_struct.activity_instance;
    self.team = "team_hundred_ninety";
    self.var_24954f14e27b448d = 0;
    self.ignoreme = 1;
    self.ignoreall = 1;
    self disableaimassist();
    self.activity_instance waittill( #"activate" );
    spawn_delay = randomfloatrange( 0.1, 0.9 );
    wait spawn_delay;
    exit_anim_index = randomintrange( 1, 4 );
    spawn_struct thread scene::play( undefined, "exit_0" + exit_anim_index );
    wait 1.6;
    self.ignoreme = 0;
    self.ignoreall = 0;
    self.var_24954f14e27b448d = 1;
    self enableaimassist();
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x79bf7f1b, Offset: 0xbf9
// Size: 0xe7
function ambushwatchtriggerenter()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self.activity_instance endon( #"activity_ended" );
    self.activity_instance endon( #"instance_destroyed" );
    
    while ( true )
    {
        self waittill( #"trigger", enteringentity );
        
        if ( !isdefined( enteringentity ) )
        {
            continue;
        }
        
        if ( self.var_dc7f729fa4fc4489 )
        {
            continue;
        }
        
        if ( isplayer( enteringentity ) )
        {
            if ( !self.activity_instance.ambush_triggered )
            {
                self.activity_instance.ambush_triggered = 1;
                self.activity_instance notify( #"activate" );
                self.activity_instance namespace_e81a4357e5094976::function_3a48100939e009e9( self.activity_instance, "signal_ambush" );
                break;
            }
        }
    }
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0x1158668a, Offset: 0xce8
// Size: 0xcf
function function_96dd8af1e8f23b63( enteringentity )
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    s_encounter = utility::array_random( self.signalencounters );
    encounter_name = "ai_encounter:" + s_encounter.encounter;
    encounter_spawnpoint = function_47c86977a18df38b( self.ai_encounter_spawnpoints, enteringentity.origin );
    self.request_id = activity_instance activity_ai_encounters::function_eb8506829193f5eb( encounter_name, encounter_spawnpoint.origin, 0, 1, 0, 1, 2 );
    activity_ai_encounters::function_6bf4ff2fbde584ee( self.request_id, &finished_spawning, activity_instance );
    self.enemies = [];
}

// Namespace ob_activity_signal
// Params 2
// Checksum 0x300de850, Offset: 0xdbf
// Size: 0x3e
function finished_spawning( requestid, activity_instance )
{
    encounterdata = function_9b649316adcccbaa( requestid );
    activity_instance.enemies = encounterdata.ai;
}

// Namespace ob_activity_signal
// Params 1, eflags: 0x4
// Checksum 0xb72038ec, Offset: 0xe05
// Size: 0x13a
function private radio_data_cleanup( activity_instance )
{
    if ( isdefined( activity_instance.radio_data ) )
    {
        if ( isdefined( activity_instance.radio_data.volume ) )
        {
            activity_instance.radio_data.volume notify( #"exit" );
            activity_instance.radio_data.volume.radio_data = undefined;
            activity_instance.radio_data.volume = undefined;
        }
        
        foreach ( player in level.players )
        {
            if ( player.radio_signal.active_entity == activity_instance.radio_data.entitynum )
            {
                player signal_detected::radio_signal_close();
            }
        }
        
        activity_instance.radio_data = undefined;
    }
}

// Namespace ob_activity_signal
// Params 0, eflags: 0x4
// Checksum 0x7a862766, Offset: 0xf47
// Size: 0x81
function private mine_cleanup()
{
    foreach ( mine in self.mines )
    {
        if ( isdefined( mine ) )
        {
            mine thread at_mine::at_mine_destroy();
        }
    }
}

// Namespace ob_activity_signal
// Params 0, eflags: 0x4
// Checksum 0x28b4bea5, Offset: 0xfd0
// Size: 0x2b
function private activity_cleanup()
{
    thread activity_ai_encounters::function_ef590f5a067bcaf5();
    
    if ( isdefined( self.encounter_id ) )
    {
        function_b43716082f77e5e5( self.encounter_id );
    }
    
    mine_cleanup();
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0xc5b51cef, Offset: 0x1003
// Size: 0x26
function signal_activity_ended( activity_succeeded )
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x206ea236, Offset: 0x1031
// Size: 0x1c
function signal_activity_destroy()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0x69f1982e, Offset: 0x1055
// Size: 0xf
function get_activity_center_point()
{
    return ( 0, 0, 0 );
}

// Namespace ob_activity_signal
// Params 0
// Checksum 0xa1ae23f6, Offset: 0x106d
// Size: 0x44
function function_470b4f0cecef4cf4()
{
    var_983974fc347bb3cb = spawnstruct();
    var_983974fc347bb3cb.origin = ( 0, 0, 0 );
    var_983974fc347bb3cb.angles = ( 0, 0, 0 );
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0x34a1ac6d, Offset: 0x10b9
// Size: 0x43
function signal_player_joined_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
    var_99e714060e093089 = relevant_info_struct.playerjoinreason;
    ob_activity_definition_utils::function_f23bdcfc447427ae( undefined, 0, 1 );
}

// Namespace ob_activity_signal
// Params 1
// Checksum 0x6ba8dcab, Offset: 0x1104
// Size: 0x23
function signal_player_left_activity( relevant_info_struct )
{
    player_list = relevant_info_struct.playerlist;
}

