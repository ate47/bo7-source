#using script_16ea1b94f0f381b3;
#using script_3bedf5e032fdac85;
#using script_4f9ce8d249a99f4a;
#using script_56e2519a4d33f9a2;
#using script_6995a3eb7d571a9f;
#using script_71028291285363d;
#using script_7acec0c0a67ad677;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\killstreaks\killstreak_shared;
#using scripts\common\shellshock_utility;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_damage;
#using scripts\mp\hud_util;
#using scripts\mp\interaction;
#using scripts\mp\loot\common_cache;
#using scripts\mp\objidpoolmanager;

#namespace quest_race;

// Namespace quest_race
// Params 0, eflags: 0x5
// Checksum 0xe1b9c0e9, Offset: 0x62d
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"rcxd_race", #"br_map_quest", &init, undefined );
}

// Namespace quest_race
// Params 0
// Checksum 0x348dfa6f, Offset: 0x656
// Size: 0x6c
function init()
{
    quest = { #on_infil:&on_infil, #on_prematch_end:&on_prematch_end, #on_start:&on_start, #on_precache:&on_precache, #on_init:&on_init, #name:"rcxd_race" };
    br_map_quest::register( quest );
}

// Namespace quest_race
// Params 0
// Checksum 0xdf384b51, Offset: 0x6ca
// Size: 0x1a
function on_init()
{
    set_dvars();
    function_cb1918f58e2ef6fa();
    
    /#
        debug_init();
    #/
}

// Namespace quest_race
// Params 0
// Checksum 0xbc84526b, Offset: 0x6ec
// Size: 0x2
function on_precache()
{
    
}

// Namespace quest_race
// Params 0
// Checksum 0x6df22bea, Offset: 0x6f6
// Size: 0x2
function on_start()
{
    
}

// Namespace quest_race
// Params 0
// Checksum 0x81b9f7db, Offset: 0x700
// Size: 0x2
function on_prematch_end()
{
    
}

// Namespace quest_race
// Params 0
// Checksum 0x2dae26fd, Offset: 0x70a
// Size: 0x9
function on_infil()
{
    thread setup_race_interacts();
}

// Namespace quest_race
// Params 0
// Checksum 0x9a47c7ed, Offset: 0x71b
// Size: 0x81
function set_dvars()
{
    br_map_quest::add_setting( "rcxd_race_checkpoint_timer_duration", 5 );
    br_map_quest::add_setting( "rcxd_race_reset_duration", 15000 );
    br_map_quest::add_setting( "rcxd_race_grotto_enabled", 1 );
    br_map_quest::add_setting( "rcxd_race_town_enabled", 1 );
    br_map_quest::add_setting( "rcxd_race_town_2_enabled", 1 );
    br_map_quest::add_setting( "rcxd_race_keep_enabled", 1 );
    br_map_quest::add_setting( "rcxd_race_beach_enabled", 1 );
    br_map_quest::add_setting( "race_killstreak_reward_amount", 3 );
    br_map_quest::add_setting( "race_plunder_reward_amount", 2 );
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0x8d737cc5, Offset: 0x7a4
// Size: 0xa7
function private function_cb1918f58e2ef6fa()
{
    self.races = [];
    function_55c9a59448001882();
    
    foreach ( name in getarraykeys( self.races ) )
    {
        new_race = setup_race_properties( name );
        self.races[ name ] = new_race;
    }
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0xfcb58189, Offset: 0x853
// Size: 0x349
function private function_55c9a59448001882()
{
    checkpoint_structs = utility::getstructarray( "quest_rcxd_race_checkpoint", "targetname" );
    assert( isdefined( checkpoint_structs ), "<dev string:x24>" + "<dev string:x49>" );
    
    foreach ( checkpoint in checkpoint_structs )
    {
        race_name = checkpoint.script_label;
        
        if ( !isdefined( br_map_quest::get_setting( "rcxd_race_" + tolower( race_name ) + "_enabled" ) ) )
        {
            continue;
        }
        
        if ( !isdefined( self.races[ race_name ] ) )
        {
            self.races[ race_name ] = { #checkpoints:[] };
        }
        
        self.races[ race_name ].checkpoints[ self.races[ race_name ].checkpoints.size ] = checkpoint;
    }
    
    prop_locs = utility::getstructarray( "quest_rcxd_race_prop", "targetname" );
    
    foreach ( prop_loc in prop_locs )
    {
        race_name = prop_loc.script_label;
        
        if ( isdefined( self.races[ race_name ] ) )
        {
            self.races[ race_name ].prop_loc = prop_loc;
        }
    }
    
    start_locs = utility::getstructarray( "quest_rcxd_race_start", "targetname" );
    
    foreach ( start_loc in start_locs )
    {
        race_name = start_loc.script_label;
        
        if ( isdefined( self.races[ race_name ] ) )
        {
            self.races[ race_name ].start_loc = start_loc;
        }
    }
    
    reward_cache_locs = utility::getstructarray( "quest_rcxd_race_reward_cache", "targetname" );
    
    foreach ( reward_cache_loc in reward_cache_locs )
    {
        race_name = reward_cache_loc.script_label;
        
        if ( isdefined( self.races[ race_name ] ) )
        {
            self.races[ race_name ].reward_cache_loc = reward_cache_loc;
        }
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xdde1745b, Offset: 0xba4
// Size: 0x15a
function private setup_race_properties( race_name )
{
    race = spawnstruct();
    race.quest = self;
    race.name = race_name;
    race.checkpoint_structs = sort_checkpoints( self.races[ race_name ].checkpoints );
    race.prop_loc = self.races[ race_name ].prop_loc;
    race.start_loc = self.races[ race_name ].start_loc;
    race.reward_cache_loc = self.races[ race_name ].reward_cache_loc;
    race.current_checkpoint_index = 0;
    race.start_index = 0;
    race.finish_index = race.checkpoint_structs.size - 1;
    race.reward_origin = race.checkpoint_structs[ race.finish_index ].origin;
    race.checkpoint_duration = br_map_quest::get_setting( "rcxd_race_checkpoint_timer_duration" );
    race.already_completed = 0;
    race.just_completed = 0;
    return race;
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x21988a08, Offset: 0xd07
// Size: 0xa1
function private sort_checkpoints( var_8bd03e449c2dfbfa )
{
    sorted_checkpoint_structs = [];
    
    foreach ( checkpoint in var_8bd03e449c2dfbfa )
    {
        checkpoint_index = int( checkpoint.script_noteworthy );
        sorted_checkpoint_structs[ checkpoint_index ] = checkpoint;
    }
    
    return sorted_checkpoint_structs;
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0x7b3d1368, Offset: 0xdb1
// Size: 0x87
function private setup_race_interacts()
{
    level endon( #"game_ended" );
    
    foreach ( race in self.races )
    {
        spawn_reward_cache( race );
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xbd62d182, Offset: 0xe40
// Size: 0x24e
function private spawn_checkpoints( race )
{
    race.checkpoint_scriptables = [];
    
    for ( i = 0; i < race.checkpoint_structs.size ; i++ )
    {
        checkpoint_struct = race.checkpoint_structs[ i ];
        payload = [ #"teamselect", race.player getentitynumber() ];
        scr_type = "quest_saw_rcxd_race_checkpoint";
        trigger_size = 40;
        air = 0;
        angle_offset = ( 0, 0, 0 );
        origin_offset = ( 0, 0, 30 );
        trigger_type = "noent_volume_trigger_radius";
        
        if ( i == race.finish_index )
        {
            scr_type = "quest_saw_rcxd_race_finish";
        }
        else if ( isdefined( checkpoint_struct.air ) && int( checkpoint_struct.air ) == 1 )
        {
            scr_type = "quest_jup_parkour_race_checkpoint_air";
            trigger_size = 90;
            air = 1;
            angle_offset = checkpoint_struct.angles + ( 90, 0, 0 );
            origin_offset = ( 0, 0, 10 );
            trigger_type = "noent_volume_trigger_rotatable_radius";
        }
        
        spawned_checkpoint = spawnscriptable( scr_type, checkpoint_struct.origin, checkpoint_struct.angles, undefined, payload );
        spawned_checkpoint.air = air;
        trigger = spawn( trigger_type, spawned_checkpoint.origin + origin_offset, 0, trigger_size, trigger_size );
        trigger.angles += angle_offset;
        spawned_checkpoint.trigger = trigger;
        spawned_checkpoint.race = race;
        spawned_checkpoint setscriptablepartstate( "quest_saw_rcxd_partname", "hidden" );
        race.checkpoint_scriptables[ race.checkpoint_scriptables.size ] = spawned_checkpoint;
        
        if ( i == 0 )
        {
            spawned_checkpoint setscriptablepartstate( "quest_saw_rcxd_partname", "visible" );
            thread function_29df7ea207f544de( spawned_checkpoint );
            race.current_checkpoint = spawned_checkpoint;
        }
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x90623bbc, Offset: 0x1096
// Size: 0x18b
function private spawn_reward_cache( race )
{
    cache = common_cache::spawncache( %"hash_643f22d0e61243d6", race.reward_cache_loc.origin + ( 0, 0, 3 ), race.reward_cache_loc.angles );
    common_cache::function_a136b84fc5c0dfab( cache, %"hash_68053588187eb265", br_map_quest::get_setting( "race_killstreak_reward_amount" ), 1 );
    common_cache::function_a136b84fc5c0dfab( cache, %"hash_4d6eda1b48d1bb86", br_map_quest::get_setting( "race_plunder_reward_amount" ), 1 );
    common_cache::function_81144e13eed673e( cache );
    common_cache::function_9d6321275c249932( cache );
    cache setscriptablepartstate( "body", "lege_closed_unusable" );
    cache.panic_type = "survival";
    race.cache = cache;
    race.prop = spawnscriptable( "quest_saw_rcxd_prop", race.prop_loc.origin, race.prop_loc.angles );
    race.prop = interaction::register_scriptable_interact( race.prop, &function_f673a1e82d8bcbe0, undefined, undefined, &function_b9a6c49e073144dd );
    race.prop setscriptablepartstate( "usable", "enabled" );
    race.prop.race = race;
    race.prop thread function_3fd0e42b9f5c0d55();
}

// Namespace quest_race
// Params 0
// Checksum 0x8fb0beb0, Offset: 0x1229
// Size: 0x5e
function function_3fd0e42b9f5c0d55()
{
    level endon( #"game_ended" );
    hit_time = br_circle_util::gettimetilldangerforpoint( self.origin );
    
    if ( level utility::waittill_notify_or_timeout_return( "br_circle_relocation", hit_time ) == "timeout" )
    {
        wait 1;
        self setscriptablepartstate( "usable", "off" );
        return;
    }
    
    thread function_3fd0e42b9f5c0d55();
    return;
}

// Namespace quest_race
// Params 2, eflags: 0x4
// Checksum 0xfbebb18c, Offset: 0x128f
// Size: 0xbd
function private function_b9a6c49e073144dd( scriptable, player )
{
    if ( gettime() < scriptable.race.cooldown_time )
    {
        return { #params:[ int( ( scriptable.race.cooldown_time - gettime() + 1000 ) / 1000 ) ], #var_26bbd300351fde34:0, #string:&"MP_SAW_SM_ISLAND/QUEST_RCXD_RACE_COOLDOWN", #type:"HINT_NOBUTTON" };
    }
    
    return { #var_26bbd300351fde34:0, #string:&"MP_SAW_SM_ISLAND/QUEST_RCXD_START_RACE", #type:"HINT_BUTTON" };
}

// Namespace quest_race
// Params 2
// Checksum 0xe056ac9c, Offset: 0x1355
// Size: 0x14d
function activate_rcxd( player, race )
{
    streakitem = killstreaks::createstreakitemstruct( "rcxd" );
    streakitem.available = 1;
    streakitem.quantity = 1;
    streakinfo = killstreak_utility::createstreakinfo( "rcxd", player );
    streakinfo.mpstreaksysteminfo = streakitem;
    rcxd = rcxd_shared::creatercxd( "rcxd", player, streakinfo, race.start_loc.origin );
    rcxd.maxhealth = 100;
    rcxd.health = 100;
    rcxd.currenthealth = 100;
    rcxd.lifetime = 999;
    
    if ( !isdefined( rcxd ) )
    {
        return;
    }
    
    rcxd vehicle_teleport( rcxd.origin, race.start_loc.angles );
    player function_aff5382dadd1a572( rcxd );
    player.var_43a2ff155b0e6580 = rcxd;
    player setclientomnvar( "ui_killstreak_lifetime", 1 );
    player setclientomnvar( "ui_is_rcxd_race", 1 );
    rcxd thread rcxd_shared::function_899aef7aa02b06ec();
    race.rcxd = rcxd;
}

// Namespace quest_race
// Params 1
// Checksum 0xb0319dc, Offset: 0x14aa
// Size: 0x1d1
function function_aff5382dadd1a572( rcxd )
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    
    if ( utility::isusingremote() )
    {
        player::clearusingremote();
    }
    
    player::setusingremote( rcxd.streakinfo.streakname );
    rcxd vehicle_damage::set_can_damage( 0 );
    data = spawnstruct();
    data.deathoverridecallback = &rcxd_shared::function_86ce53096e8db304;
    rcxd thread namespace_9d8e359c3b1041e5::handlemovingplatformssharedfunc( data );
    rcxd setotherent( self );
    rcxd.driver = self;
    rcxd.ispiloted = 1;
    
    if ( rcxd.empcount > 0 )
    {
        namespace_9d8e359c3b1041e5::freezelookcontrolssharedfunc( 1 );
    }
    else
    {
        self usevehicle( rcxd, 0 );
    }
    
    rcxd.controlslinked = 1;
    self painvisionoff();
    killstreak_shared::killstreak_savenvgstate();
    rcxd.starttime = gettime();
    rcxd.endtime = rcxd.starttime + int( rcxd.lifetime * 1000 );
    self setclientomnvar( "ui_killstreak_countdown", rcxd.endtime );
    self setclientomnvar( "ui_killstreak_health", 1 );
    self setclientomnvar( "ui_killstreak_damage_state", 0 );
    namespace_9d8e359c3b1041e5::function_f6af4ffa6dbb4645( rcxd.streakinfo.streakname, "on" );
    killstreak_shared::function_9fc2f7ee10890d99( "rcxd" );
    shellshock_utility::_stopshellshock();
    val::set( "rcxd", "shellshock", 0 );
    namespace_9d8e359c3b1041e5::registerentforoobsharedfunc( rcxd, "killstreak" );
    val::set( "rcxd_spawn", "player_for_spawn_logic", 0 );
    namespace_9d8e359c3b1041e5::addspawnviewersharedfunc( rcxd );
    function_3d87a59a4ab8b451();
    namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 1 );
}

// Namespace quest_race
// Params 1
// Checksum 0x3219df50, Offset: 0x1683
// Size: 0x15a
function function_97ec301a6784838a( rcxd )
{
    level endon( #"game_ended" );
    
    if ( !isdefined( rcxd ) )
    {
        return;
    }
    
    rcxd function_8f57751bc1b28779( 0 );
    rcxd function_ccacc3fd2c146e8( 0 );
    namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 1 );
    rcxd setscriptablepartstate( #"destroy", #"on", 0 );
    rcxd setscriptablepartstate( #"lights", #"off", 0 );
    rcxd thread rcxd_shared::rcxd_camerashake();
    
    if ( utility::isusingremote() )
    {
        player::clearusingremote();
    }
    
    self playlocalsound( "evt_rcxd_fade_out" );
    var_947bb4706c5ccfaa = hud_util::function_cd054751d2d5b5c5( "black" );
    
    if ( isalive( self ) )
    {
        var_947bb4706c5ccfaa thread hud_util::function_d69ae82e9a4716aa( self, 0.5, 1, 1, 1 );
        wait 0.5;
    }
    else
    {
        var_947bb4706c5ccfaa thread hud_util::function_d69ae82e9a4716aa( self, 0, 3, 1, 1 );
    }
    
    rcxd_shared::function_97ec301a6784838a( rcxd );
    self.var_43a2ff155b0e6580 = undefined;
    self setplayerangles( self.restoreangles );
    self setclientomnvar( "ui_is_rcxd_race", 0 );
    
    if ( isdefined( rcxd ) )
    {
        rcxd delete();
    }
    
    wait 2;
    namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    val::reset( "rcxd_race", "killstreaks" );
    val::reset( "rcxd_race", "vehicle_use" );
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0xc87ccefb, Offset: 0x17e5
// Size: 0x85
function private function_3d87a59a4ab8b451()
{
    bundle = level.streakglobals.streakbundles[ "rcxd" ];
    fullscreenfxparams = { #visionset:bundle.var_28b586ad7dc362cb ?? "killstreak_rcxd_drive", #postfxbundlename:bundle.var_1f1feedfdba0656d };
    self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
}

// Namespace quest_race
// Params 2, eflags: 0x4
// Checksum 0x767fba4e, Offset: 0x1872
// Size: 0x321
function private rcxd_race_start( race, player )
{
    race notify( #"sidequest_race_start" );
    race endon( #"sidequest_race_start" );
    race endon( #"sidequest_race_end" );
    level endon( #"game_ended" );
    player endon( #"death_or_disconnect" );
    race.player = player;
    player namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 1 );
    player val::set( "rcxd_race", "killstreaks", 0 );
    player val::set( "rcxd_race", "vehicle_use", 0 );
    
    if ( !level callback::exists( #"player_damaged", &on_player_interrupted ) )
    {
        level callback::add( #"player_damaged", &on_player_interrupted );
    }
    
    if ( !level callback::exists( #"player_death", &on_player_interrupted ) )
    {
        level callback::add( #"player_death", &on_player_interrupted );
    }
    
    if ( !level callback::exists( #"player_disconnect", &on_player_interrupted ) )
    {
        level callback::add( #"player_disconnect", &on_player_interrupted );
    }
    
    race.prop setscriptablepartstate( "usable", "off" );
    player playlocalsound( "evt_rcxd_fade_in" );
    var_947bb4706c5ccfaa = player hud_util::function_cd054751d2d5b5c5( "black" );
    var_947bb4706c5ccfaa thread hud_util::function_d69ae82e9a4716aa( player, 1, 2, 2, 1 );
    wait 1;
    player.restoreangles = player getplayerangles();
    player setplayerangles( race.start_loc.angles );
    player namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    activate_rcxd( player, race );
    spawn_checkpoints( race );
    wait 4;
    player thread play_countdown();
    wait 3;
    player namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    player playlocalsound( "evt_parkour_race_start" );
    create_objective( race, race.player );
    
    while ( race.checkpoint_duration >= 0 && !race.just_completed )
    {
        starttime = gettime();
        race.player setclientomnvar( "ui_race_timer", ( race.checkpoint_duration + 1 ) * 1000 + starttime );
        
        if ( race.checkpoint_duration < 3 && race.checkpoint_duration > -1 )
        {
            player playlocalsound( "evt_parkour_race_time_ticking_0" + 1 + race.checkpoint_duration );
        }
        
        wait 1;
        race.checkpoint_duration--;
        
        if ( isdefined( race.current_checkpoint ) )
        {
            /#
                print3d( race.current_checkpoint.origin, race.checkpoint_duration + 1, ( 1, 0, 0 ), 1, 2, 21 );
            #/
        }
    }
    
    if ( !race.just_completed )
    {
        thread race_reset( race );
    }
    
    race notify( #"sidequest_race_end" );
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0xd7bb4c76, Offset: 0x1b9b
// Size: 0xf6
function private play_countdown()
{
    self endon( #"death_or_disconnect" );
    starttime = gettime();
    self setclientomnvar( "ui_race_timer", 3000 + starttime );
    
    /#
        printtoscreen2d( 1300, 500, "<dev string:x9e>", ( 1, 0, 0 ), 4, 20 );
    #/
    
    self playlocalsound( "evt_parkour_race_time_ticking_01" );
    wait 1;
    
    /#
        printtoscreen2d( 1300, 500, "<dev string:xa0>", ( 1, 0, 0 ), 4, 20 );
    #/
    
    self playlocalsound( "evt_parkour_race_time_ticking_01" );
    wait 1;
    
    /#
        printtoscreen2d( 1300, 500, "<dev string:xa2>", ( 1, 0, 0 ), 4, 20 );
    #/
    
    self playlocalsound( "evt_parkour_race_time_ticking_01" );
    wait 1;
    
    /#
        printtoscreen2d( 1300, 500, "<dev string:xa4>", ( 0, 1, 0 ), 4, 20 );
    #/
    
    self setclientomnvar( "ui_race_active", 1 );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xdb4a2d1e, Offset: 0x1c99
// Size: 0x12d
function private race_reset( race )
{
    if ( !race.just_completed )
    {
        function_c575a39101231bbf( race );
        race.player playlocalsound( "evt_parkour_race_failure" );
        race.player thread function_97ec301a6784838a( race.rcxd );
        race.prop setscriptablepartstate( "usable", "enabled" );
        race.cooldown_time = gettime() + br_map_quest::get_setting( "rcxd_race_reset_duration" );
        race.player setclientomnvar( "ui_race_active", 0 );
        race.player = undefined;
    }
    
    race.current_checkpoint_index = 0;
    race.checkpoint_duration = br_map_quest::get_setting( "rcxd_race_checkpoint_timer_duration" );
    race.just_completed = 0;
    level callback::remove( #"player_damaged", &on_player_interrupted );
    level callback::remove( #"player_death", &on_player_interrupted );
    level callback::remove( #"player_disconnect", &on_player_interrupted );
    race notify( #"sidequest_race_end" );
}

// Namespace quest_race
// Params 0, eflags: 0x4
// Checksum 0xe5e39e41, Offset: 0x1dce
// Size: 0x7b
function private race_reset_all()
{
    foreach ( race in self.races )
    {
        thread race_reset( race );
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xcb613476, Offset: 0x1e51
// Size: 0xf5
function private race_completed( race )
{
    level endon( #"game_ended" );
    race.player playlocalsound( "evt_parkour_race_success" );
    function_c575a39101231bbf( race );
    race.already_completed = 1;
    race.just_completed = 1;
    thread quest_complete( race.player );
    wait 1;
    race.prop setscriptablepartstate( "usable", "off" );
    race.prop setscriptablepartstate( "body", "hidden" );
    race.cache setscriptablepartstate( "body", "lege_closed_usable" );
    race.player function_97ec301a6784838a( race.rcxd );
    race.player setclientomnvar( "ui_race_active", 0 );
    race notify( #"sidequest_race_end" );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x1e76bacf, Offset: 0x1f4e
// Size: 0x3d
function private quest_complete( player )
{
    params = { #completed_by:[ player ], #is_successful:1 };
    br_map_quest::on_completed( params );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x1bdf5b17, Offset: 0x1f93
// Size: 0x2f
function private function_56163fe660b30326( race )
{
    level.player setorigin( race.prop.origin );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xf256c9b7, Offset: 0x1fca
// Size: 0x55
function private function_d9b94d2d5a158a3a( race )
{
    if ( isdefined( race.rcxd ) )
    {
        race.rcxd vehicle_teleport( race.start_loc.origin, race.start_loc.angles );
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xdc60cad7, Offset: 0x2027
// Size: 0x15d
function private checkpoint_increment( race )
{
    race endon( #"sidequest_race_end" );
    level endon( #"game_ended" );
    current_checkpoint = race.current_checkpoint;
    current_checkpoint setscriptablepartstate( "quest_saw_rcxd_partname", "hidden" );
    
    if ( race.current_checkpoint_index == race.finish_index )
    {
        function_e0983d3432d72e5c( race );
        return;
    }
    
    current_checkpoint notify( #"checkpoint_removed" );
    
    if ( race.current_checkpoint_index == race.finish_index - 1 )
    {
        objidpoolmanager::returnobjectiveid( race.checkpoint_objid );
        race.checkpoint_objid = undefined;
        create_objective( race, race.player );
    }
    
    race.current_checkpoint_index++;
    next_checkpoint = race.checkpoint_scriptables[ race.current_checkpoint_index ];
    next_checkpoint setscriptablepartstate( "quest_saw_rcxd_partname", "visible" );
    race.current_checkpoint = next_checkpoint;
    race.objectivemarker moveto( next_checkpoint.origin, 1, 0, 0.75 );
    thread function_29df7ea207f544de( next_checkpoint );
    race.checkpoint_duration = br_map_quest::get_setting( "rcxd_race_checkpoint_timer_duration" );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xf8cd041f, Offset: 0x218c
// Size: 0xb0
function private function_29df7ea207f544de( checkpoint )
{
    race = checkpoint.race;
    player = race.player;
    rcxd = race.rcxd;
    level endon( #"game_ended" );
    race endon( #"sidequest_race_end" );
    checkpoint endon( #"checkpoint_removed" );
    
    while ( true )
    {
        checkpoint.trigger waittill( #"trigger", ent );
        
        if ( ent == rcxd )
        {
            break;
        }
        
        waitframe();
    }
    
    thread on_checkpoint_reached( checkpoint );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x18d6b5e8, Offset: 0x2244
// Size: 0x11b
function private function_c575a39101231bbf( race )
{
    if ( isdefined( race.checkpoint_objid ) )
    {
        objidpoolmanager::returnobjectiveid( race.checkpoint_objid );
        race.checkpoint_objid = undefined;
    }
    
    if ( isdefined( race.finish_objid ) )
    {
        objidpoolmanager::returnobjectiveid( race.finish_objid );
        race.finish_objid = undefined;
    }
    
    foreach ( checkpoint in race.checkpoint_scriptables )
    {
        if ( isdefined( checkpoint.trigger ) )
        {
            checkpoint.trigger delete();
        }
        
        checkpoint freescriptable();
    }
    
    if ( isdefined( race.objectivemarker ) )
    {
        race.objectivemarker delete();
    }
}

// Namespace quest_race
// Params 2, eflags: 0x4
// Checksum 0x596caf66, Offset: 0x2367
// Size: 0x140
function private create_objective( race, player )
{
    objid = objidpoolmanager::requestobjectiveid( 99 );
    
    if ( race.current_checkpoint_index == race.finish_index - 1 )
    {
        icon = "saw_hud_icon_checkered_flag";
        race.finish_objid = objid;
    }
    else
    {
        icon = "hud_icon_ctf_flag";
        race.checkpoint_objid = objid;
    }
    
    icon_size = "icon_small";
    icon_z_offset = 70;
    race.objectivemarker = spawn( "script_model", race.current_checkpoint.origin );
    objidpoolmanager::objective_add_objective( objid, "current", race.current_checkpoint.origin, icon, icon_size );
    objidpoolmanager::objective_set_play_intro( objid, 0 );
    objidpoolmanager::update_objective_setzoffset( objid, icon_z_offset );
    objidpoolmanager::update_objective_setbackground( objid, 1 );
    objidpoolmanager::objective_showdistance( objid, 1 );
    objective_onentity( objid, race.objectivemarker );
    objective_sethideonminimap( objid, 1 );
    objective_disableping( objid, 1 );
    objidpoolmanager::objective_playermask_addshowplayer( objid, player );
    return objid;
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xa60b0068, Offset: 0x24b0
// Size: 0x53
function private function_f673a1e82d8bcbe0( player )
{
    if ( gettime() < self.race.cooldown_time )
    {
        return;
    }
    
    quest = br_map_quest::get_quest( "rcxd_race" );
    quest thread rcxd_race_start( self.race, player );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xcbf89e7c, Offset: 0x250b
// Size: 0x103
function private on_player_interrupted( params )
{
    quest = br_map_quest::get_quest( "rcxd_race" );
    
    foreach ( race in quest.races )
    {
        if ( params.victim == race.player )
        {
            race.player namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
            race.player val::reset( "rcxd_race", "killstreaks" );
            race.player val::reset( "rcxd_race", "vehicle_use" );
            quest thread race_reset( race );
            return;
        }
    }
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0x159aba47, Offset: 0x2616
// Size: 0x4d
function private on_checkpoint_reached( checkpoint )
{
    race = checkpoint.race;
    player = race.player;
    player playlocalsound( "evt_parkour_race_checkpoint" );
    thread checkpoint_increment( race );
}

// Namespace quest_race
// Params 1, eflags: 0x4
// Checksum 0xf10dca43, Offset: 0x266b
// Size: 0x15
function private function_e0983d3432d72e5c( race )
{
    thread race_completed( race );
}

/#

    // Namespace quest_race
    // Params 0, eflags: 0x4
    // Checksum 0xca11382e, Offset: 0x2688
    // Size: 0xc, Type: dev
    function private debug_init()
    {
        devgui_init();
    }

    // Namespace quest_race
    // Params 0, eflags: 0x4
    // Checksum 0xd52c1a23, Offset: 0x269c
    // Size: 0x13c, Type: dev
    function private devgui_init()
    {
        devgui::function_9082edeb5db93280( "<dev string:xa7>" + "<dev string:xb6>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:xc1>", "<dev string:xd6>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:xe8>", "<dev string:xf8>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x10a>", "<dev string:x118>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x12a>", "<dev string:x143>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x155>", "<dev string:x16c>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x17e>", "<dev string:x197>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1a9>", "<dev string:x1c1>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1d3>", "<dev string:x1ea>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1fc>", "<dev string:x20c>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x21e>", "<dev string:x22c>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x23e>", "<dev string:x24e>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x261>", "<dev string:x270>", &devgui_rcxd_race );
        devgui::function_cd4e263c1f3018ae( "<dev string:x283>", "<dev string:x291>", &devgui_rcxd_race );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace quest_race
    // Params 1, eflags: 0x4
    // Checksum 0x901dad59, Offset: 0x27e0
    // Size: 0x19, Type: dev
    function private devgui_rcxd_race( params )
    {
        level thread debug_rcxd_race( params );
    }

    // Namespace quest_race
    // Params 1
    // Checksum 0xed551d4a, Offset: 0x2801
    // Size: 0x417, Type: dev
    function debug_rcxd_race( params )
    {
        quest = br_map_quest::get_quest( "<dev string:x2a4>" );
        
        switch ( int( params[ 0 ] ) )
        {
            case 0:
                foreach ( race in quest.races )
                {
                    foreach ( idx, str_checkpoint in race.checkpoint_structs )
                    {
                        str_color = ( 0, 0, 1 );
                        
                        if ( idx == 0 )
                        {
                            str_color = ( 0, 1, 0 );
                        }
                        else if ( idx == race.checkpoint_structs.size - 1 )
                        {
                            str_color = ( 1, 0, 0 );
                        }
                        
                        sphere( str_checkpoint.origin, 25, str_color, 0, 300 );
                    }
                }
                
                break;
            case 1:
                race_reset_all();
                break;
            case 2:
                quest.races[ "<dev string:x2ae>" ].cache setscriptablepartstate( "<dev string:x2b5>", "<dev string:x2ba>" );
                quest.races[ "<dev string:x2cd>" ].cache setscriptablepartstate( "<dev string:x2b5>", "<dev string:x2ba>" );
                quest.races[ "<dev string:x2d2>" ].cache setscriptablepartstate( "<dev string:x2b5>", "<dev string:x2ba>" );
                quest.races[ "<dev string:x2d9>" ].cache setscriptablepartstate( "<dev string:x2b5>", "<dev string:x2ba>" );
                quest.races[ "<dev string:x2df>" ].cache setscriptablepartstate( "<dev string:x2b5>", "<dev string:x2ba>" );
                break;
            case 3:
                function_56163fe660b30326( quest.races[ "<dev string:x2ae>" ] );
                break;
            case 4:
                function_56163fe660b30326( quest.races[ "<dev string:x2cd>" ] );
                break;
            case 5:
                function_56163fe660b30326( quest.races[ "<dev string:x2d2>" ] );
                break;
            case 6:
                function_56163fe660b30326( quest.races[ "<dev string:x2d9>" ] );
                break;
            case 7:
                function_56163fe660b30326( quest.races[ "<dev string:x2df>" ] );
                break;
            case 8:
                quest thread race_reset( quest.races[ "<dev string:x2ae>" ] );
                break;
            case 9:
                quest thread race_reset( quest.races[ "<dev string:x2cd>" ] );
                break;
            case 10:
                quest thread race_reset( quest.races[ "<dev string:x2d2>" ] );
                break;
            case 11:
                quest thread race_reset( quest.races[ "<dev string:x2d9>" ] );
                break;
            case 12:
                quest thread race_reset( quest.races[ "<dev string:x2df>" ] );
                break;
        }
    }

#/
