#using script_14d76aa023628152;
#using script_1aae2eb1ef28b239;
#using script_2a9058c1321cd25d;
#using script_30152080457bb762;
#using script_30a611dc97bb45c;
#using script_3a459cb70cbfb426;
#using script_5c67a8e3564266df;
#using script_60cd1c57e94be8d7;
#using script_6d32c773f74edb3d;
#using script_6fd2f8dba4845b5a;
#using script_73a03aaf11b641f5;
#using script_78c71390bb3043df;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\mp\calloutmarkerping;
#using scripts\mp\interaction;
#using scripts\mp\loot\common_cache;
#using scripts\mp\loot\common_item;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\activities\ob_activity_utility;
#using scripts\mp\ob\activities\ob_activity_vo_utility;
#using scripts\mp\ob\jailbreak_machine;
#using scripts\mp\ob\systems\ob_humans;
#using scripts\mp\ob\systems\ob_music;
#using scripts\mp\ob\systems\region_difficulty_manager;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\tripwire;

#namespace ob_activity_merc_stronghold;

// Namespace ob_activity_merc_stronghold
// Params 0, eflags: 0x5
// Checksum 0x5c39162d, Offset: 0x7a1
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"ob_activity_merc_stronghold", #"activity_common", &function_74e7ba836873b011, undefined );
}

// Namespace ob_activity_merc_stronghold
// Params 0, eflags: 0x4
// Checksum 0xf6606c62, Offset: 0x7ca
// Size: 0x13
function private function_74e7ba836873b011()
{
    activity_common::registeractivitytype( "REV_OB_MERC_STRONGHOLD", &function_5fc334c23337cf11 );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x3cae6c60, Offset: 0x7e5
// Size: 0x14c
function function_5fc334c23337cf11()
{
    activity_common::function_944074f3079c1d4e( "REV_OB_MERC_STRONGHOLD", 0, &function_967d2398999f8e58 );
    activity_common::function_944074f3079c1d4e( "REV_OB_MERC_STRONGHOLD", 1, &function_a71783b87326e6d8 );
    activity_common::function_944074f3079c1d4e( "REV_OB_MERC_STRONGHOLD", 2, &function_cd6be31f3c6370d4 );
    activity_common::function_944074f3079c1d4e( "REV_OB_MERC_STRONGHOLD", 3, &function_67ffd405d04b427 );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &function_7730c783c0e4be5c, "REV_OB_MERC_STRONGHOLD" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &player_left_activity, "REV_OB_MERC_STRONGHOLD" );
    
    /#
        level thread function_19ad3d93d3481d87();
    #/
    
    utility::registersharedfunc( "ob_merc_stronghold_door", #"hack", &function_ec00319d5c9ab121 );
    utility::registersharedfunc( "ob_merc_stronghold_door", #"start_hacking", &function_b0b67ab23297e563 );
    utility::registersharedfunc( "ob_merc_stronghold_rollup_door", #"hack", &function_dc125b66ee3ec220 );
    utility::registersharedfunc( "ob_merc_stronghold_rollup_door", #"start_hacking", &function_b0b67ab23297e563 );
    scriptable::scriptable_addusedcallbackbypart( "stronghold_door_usable", &door_lock_scriptable_used );
    
    if ( !level.var_3b56f00a3f54ab26 )
    {
        level.var_3b56f00a3f54ab26 = throttle::throttle_initialize( "ob_stronghold_lockdoor", 2 );
    }
    
    level.var_82d9194bfc9e8cc8 = throttle::throttle_initialize( "ob_stronghold_cache", 1 );
    level.ob_stronghold_tripwire_throttle = throttle::throttle_initialize( "ob_stronghold_tripwire", 1 );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x95f09731, Offset: 0x939
// Size: 0x64c
function function_967d2398999f8e58()
{
    if ( !isdefined( self ) )
    {
        println( "<dev string:x24>" );
        return;
    }
    
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    self.variant_definition = namespace_9085ae059032a84f::function_837a0c8626c9b419();
    self.variant_settings = namespace_9085ae059032a84f::function_9129cd8075c85c09( self );
    self.main_struct = utility::getstruct( self.varianttag + "_main", "targetname" );
    level ob_music::function_ef5b9bf8dee0f26d( self );
    
    if ( !isdefined( self.main_struct ) )
    {
        println( "<dev string:xcd>" + self.varianttag + "<dev string:xe7>" );
        return;
    }
    
    if ( !isdefined( self.main_struct.target ) )
    {
        println( "<dev string:xcd>" + self.varianttag + "<dev string:x173>" );
        return;
    }
    
    root_structs = utility::getstructarray( self.main_struct.target, "targetname" );
    
    if ( !isdefined( root_structs ) || root_structs.size == 0 )
    {
        println( "<dev string:xcd>" + self.varianttag + "<dev string:x209>" );
        return;
    }
    
    self.root_struct = function_47c86977a18df38b( root_structs, self.main_struct.origin );
    [ self.var_e30504b949ebb78c ] = strtok( self.root_struct.target, "_" );
    
    if ( !isdefined( self.root_struct ) )
    {
        println( "<dev string:xcd>" + self.varianttag + "<dev string:x295>" );
        return;
    }
    
    self.root_struct.activityinstance = self;
    self.floor_count = 1;
    
    if ( isdefined( self.root_struct.script_noteworthy ) )
    {
        self.floor_count = int( self.root_struct.script_noteworthy );
    }
    
    self.var_632325932a5077b5 = istrue( self.variant_settings.var_78511fa2912ca753 );
    scriptables = getentitylessscriptablearray( self.root_struct.target, #targetname, self.root_struct.origin, 1500 );
    other_structs = arraycombine( utility::getstructarray( self.root_struct.target, "targetname" ), scriptables, getnoentvolumearray( self.root_struct.target, #targetname ) );
    self.door_interact_nodes = [];
    self.var_b65091063dffc8f1 = [];
    self.var_d4c224d9c5d1d32f = [];
    self.lootcache_spawns = [];
    self.tripwires = [];
    self.current_soldiers = [];
    self.alarm_lights = [];
    self.reinforce_vehicles = [];
    
    foreach ( struct in other_structs )
    {
        if ( !isdefined( struct.script_noteworthy ) )
        {
            continue;
        }
        
        switch ( struct.script_noteworthy )
        {
            case #"hash_2a78ee15440a7a06":
                struct.canunlock = 1;
                self.var_b65091063dffc8f1[ self.var_b65091063dffc8f1.size ] = struct;
                break;
            case #"hash_106df5d1729e996":
                self.var_b65091063dffc8f1[ self.var_b65091063dffc8f1.size ] = struct;
                break;
            case #"hash_c7833a7b1cbbcbb8":
                self.lootcache_spawns[ self.lootcache_spawns.size ] = struct;
                break;
            case #"hash_c4b0e76a67e9b991":
                self.var_d4c224d9c5d1d32f[ self.var_d4c224d9c5d1d32f.size ] = struct;
                break;
        }
    }
    
    function_42a927ae2958f129();
    function_1f8e81b283e9e63f();
    self.region_difficulty = region_difficulty_manager::get_region_difficulty( self.root_struct.origin );
    
    switch ( self.region_difficulty )
    {
        case #"hash_7bb2cd766703d463":
            self.lootcache_regular_count = self.variant_settings.var_8041690962eab948 ?? 3;
            self.lootcache_legendary_count = self.variant_settings.var_8041690962eab948 ?? 2;
            self.tripwire_count = self.variant_settings.var_9345ad01ff97d48a ?? 2;
            break;
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
        case #"hash_af83e47edfa8900a":
        case #"hash_c0250ffc2e87f2ff":
            self.lootcache_regular_count = self.variant_settings.var_8041690962eab948 ?? 2;
            self.lootcache_legendary_count = self.variant_settings.var_8041690962eab948 ?? 3;
            self.tripwire_count = self.variant_settings.var_c110e9f74ad1ea0f ?? 3;
            break;
        default:
            println( "<dev string:xcd>" + self.varianttag + "<dev string:x315>" );
            activity_instance_common::function_9aeeabe50fc9cc3e( self );
            return;
    }
    
    condition = 1;
    function_d4761a98b77c7e41( scriptables );
    thread function_2e79134b3a37cd6c();
    thread function_1ce0da2b2375428f();
    function_63fba4dca5ce837b();
    setup_jailbreak_machines();
    waitframe();
    ob_activity_utility::ob_enable_cover_nodes();
    function_d0081dbcec2b9ec();
    function_bd51947eb0af8588();
    namespace_e81a4357e5094976::function_3844a29027b73897();
    
    if ( getdvarint( @"hash_63bbdbbd9de47265", 0 ) == 1 )
    {
        activity_participation::function_a45fd1c5cc774007( self );
    }
    else
    {
        activity_participation::function_5e5913e13bf9cb28( self );
    }
    
    function_a38c516bfe0723e2( self );
    childthread function_f3812f02bde609c0();
    self waittill( #"hash_538b9e78ccfb0ce5" );
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x62a1703b, Offset: 0xf8d
// Size: 0x1a
function function_a71783b87326e6d8()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x8cb6e408, Offset: 0xfaf
// Size: 0xa5
function function_cd6be31f3c6370d4()
{
    function_7f914a6a81114341();
    function_704265ecc605c1b9();
    
    foreach ( light in self.alarm_lights )
    {
        light setscriptablepartstate( "base", "alert_off" );
    }
    
    self endon( #"instance_destroyed" );
    ob_music::function_3d5e3c9ec30e3784( self );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x1a31fd6d, Offset: 0x105c
// Size: 0x99
function function_67ffd405d04b427()
{
    thread function_c47ea7f87bafb4bd();
    function_f3bad1593fdca0a3();
    
    foreach ( light in self.alarm_lights )
    {
        light setscriptablepartstate( "base", "off" );
    }
    
    function_b9ce0c1555fad68e( self );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x415a6c77, Offset: 0x10fd
// Size: 0x261
function function_c47ea7f87bafb4bd()
{
    level endon( #"game_ended" );
    
    if ( !activity_instance_common::function_6bb0be4a3940d6e3( self ) )
    {
        foreach ( jailbreak in self.jailbreak_machine_array )
        {
            jailbreak setscriptablepartstate( #"body", #"invisible" );
        }
    }
    
    if ( isdefined( self.var_592890cbcd7cfad1 ) && self.var_592890cbcd7cfad1.size > 0 )
    {
        thread ob_soldier_util::function_3604220db3a0a0cf( self.var_592890cbcd7cfad1 );
    }
    
    ob_activity_utility::ob_disable_cover_nodes();
    
    foreach ( mine in self.traps.mines )
    {
        if ( isdefined( mine ) )
        {
            mine thread at_mine::at_mine_destroy();
        }
    }
    
    ob_activity_utility::function_1467dab20b2d22();
    function_7f914a6a81114341();
    function_bc312ba9323eb095();
    
    foreach ( vehicle in self.reinforce_vehicles )
    {
        vehicle thread ob_activity_utility::function_16f13e7feb0abb24( 3000 );
    }
    
    foreach ( cache in self.lootcache_scriptable_array )
    {
        cache freescriptable();
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x64ce445f, Offset: 0x1366
// Size: 0x8d
function function_3c3908a467d4e7b4()
{
    self.var_67b5d852093df0d1 = activity_ai_encounters::function_92b671064b0b1ce2( self.varianttag + "_reinforcement", 1, 0, 1, 2 );
    
    if ( isdefined( self.var_67b5d852093df0d1 ) )
    {
        thread function_d797b035ad18ae66( self.var_67b5d852093df0d1 );
        ai_spawn_director::function_71b3c575c1426546( self.var_67b5d852093df0d1, &function_985b8413c3d747c6, self );
        ai_spawn_director::function_baa5d26d8804d5da( self.var_67b5d852093df0d1, &function_e8aecaa6a426631a, self );
        activity_ai_encounters::function_edecd8fd32cc3ec5( self.var_67b5d852093df0d1, &function_189d7c1c744a68b4, self );
        thread function_4f3033ce84d54c49();
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0xd4791466, Offset: 0x13fb
// Size: 0x142
function function_d797b035ad18ae66( encounter_id )
{
    self notify( #"hash_24c84880dfebb261" );
    self endon( #"hash_24c84880dfebb261" );
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    var_21fd0d8034ab1cca = getvehiclenode( self.varianttag + "_GROUND", #targetname );
    assert( isdefined( var_21fd0d8034ab1cca ) );
    var_9f042ff152592eee = "ai_encounter_despawning_" + encounter_id;
    
    if ( isdefined( var_21fd0d8034ab1cca ) )
    {
        while ( true )
        {
            check_player_array = getplayersinradius( var_21fd0d8034ab1cca.origin, 2000 );
            
            if ( check_player_array.size > 5 || ob_activity_utility::function_e710f3efecb65567( check_player_array, var_21fd0d8034ab1cca.origin, 500 ) || ob_activity_utility::function_2ffc785b6076484e( check_player_array, var_21fd0d8034ab1cca.origin ) )
            {
                function_1a9d724a960fa19d( encounter_id, "parachute_allowed", 1 );
            }
            else
            {
                function_1a9d724a960fa19d( encounter_id, "ground_vehicle_allowed", 1 );
            }
            
            level waittill( var_9f042ff152592eee );
            function_1a9d724a960fa19d( encounter_id, "ground_vehicle_allowed", 0 );
            function_1a9d724a960fa19d( encounter_id, "parachute_allowed", 0 );
            self waittill( #"hash_f8a623598b1d3f00" );
        }
        
        return;
    }
    
    function_1a9d724a960fa19d( encounter_id, "parachute_allowed", 1 );
}

// Namespace ob_activity_merc_stronghold
// Params 3
// Checksum 0x6a44fb6e, Offset: 0x1545
// Size: 0x5d
function function_189d7c1c744a68b4( requestid, userdata, spawnedvehicle )
{
    activityinstance = userdata;
    
    if ( !spawnedvehicle vehicle::is_ground_vehicle() )
    {
        return;
    }
    
    activityinstance.reinforce_vehicles[ activityinstance.reinforce_vehicles.size ] = spawnedvehicle;
    ob_convoy_util::function_1b365c78e86f6916( spawnedvehicle );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xdf0d525a, Offset: 0x15aa
// Size: 0xeb
function function_4f3033ce84d54c49()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    var_9f042ff152592eee = "ai_encounter_despawning_" + ( self.var_67b5d852093df0d1 ?? "" );
    
    while ( true )
    {
        level utility::waittill_any( var_9f042ff152592eee );
        
        foreach ( vehicle in self.reinforce_vehicles )
        {
            vehicle thread ob_activity_utility::function_16f13e7feb0abb24( 3000 );
            self.reinforce_vehicles = arrayremove( self.reinforce_vehicles, vehicle );
        }
        
        self.reinforce_vehicles = [];
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0xfd933f42, Offset: 0x169d
// Size: 0x1d9
function function_d4761a98b77c7e41( scriptables )
{
    if ( !isdefined( level.var_c0402a9389a09e35 ) )
    {
        tripwire::init();
        level.tripwireweaponname = "t10_frag_grenade_zm";
        
        if ( isdefined( level.var_d2a069e71fe9643b ) )
        {
            [[ level.var_d2a069e71fe9643b ]]();
        }
    }
    
    self.scriptables = scriptables;
    
    foreach ( scriptable in self.scriptables )
    {
        if ( isdefined( scriptable.classname ) && issubstr( scriptable.classname, "nest" ) )
        {
            continue;
        }
        
        if ( isdefined( scriptable.classname ) && issubstr( scriptable.classname, "scriptable_blocker" ) )
        {
            scriptable setscriptablepartstate( "state", "visible" );
        }
        
        if ( isdefined( scriptable.classname ) && issubstr( scriptable.classname, "scriptable_ob_toggleable" ) )
        {
            scriptable setscriptablepartstate( "state", "visible" );
        }
        
        if ( isdefined( scriptable.classname ) && issubstr( scriptable.classname, "tripwire" ) )
        {
            self.tripwires[ self.tripwires.size ] = scriptable;
        }
        
        if ( isdefined( scriptable.classname ) && issubstr( scriptable.classname, "lights" ) )
        {
            self.alarm_lights[ self.alarm_lights.size ] = scriptable;
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x522f8e13, Offset: 0x187e
// Size: 0x14a
function function_2e79134b3a37cd6c()
{
    self.tripwires = arrayrandomize( self.tripwires );
    
    if ( !isdefined( self.tripwire_count ) )
    {
        self.tripwire_count = self.tripwires.size;
    }
    
    if ( self.tripwire_count > self.tripwires.size )
    {
        self.tripwire_count = self.tripwires.size;
    }
    
    for ( i = 0; i < self.tripwire_count ; i++ )
    {
        tripwire = self.tripwires[ i ];
        throttle::throttle_wait_in_queue( level.ob_stronghold_tripwire_throttle, { #tripwire:tripwire } );
        targets = getentitylessscriptablearray( tripwire.target, #targetname, tripwire.origin, 500 );
        [[ level.var_c0402a9389a09e35 ]]( self.tripwires[ i ], "team_hundred_ninety", targets );
        self.tripwires[ i ].activityinstance = self;
        self.tripwires[ i ].var_b4c81558b4af6d74 = self.variant_settings.tripwiregrenadeweapon ?? undefined;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x6f4a4477, Offset: 0x19d0
// Size: 0x80
function function_bc312ba9323eb095()
{
    foreach ( tripwire in self.tripwires )
    {
        [[ level.var_4e09347566c3e902 ]]( tripwire );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xff7c15a6, Offset: 0x1a58
// Size: 0x464
function function_42a927ae2958f129()
{
    self.locked_doors = [];
    self.locked_buttons = [];
    zone = spatial_zone_container::function_f7fc3e6c249a8256( self, "Proximity_Join_Zone" );
    searchradius = min( 1500, spatial_zone_container::function_231d9e91d8ef7b5f( zone[ 0 ] ) );
    mapdoors = getentitylessscriptablearray( undefined, undefined, self.main_struct.origin, searchradius, "door" );
    mapbuttons = getentitylessscriptablearray( undefined, undefined, self.main_struct.origin, searchradius, "arcwire_transmitter" );
    
    /#
        if ( getdvarint( @"hash_9c3d7b7ac76a359c", 0 ) == 1 )
        {
            thread debug::drawsphere( self.main_struct.origin, searchradius, 900, ( 0, 1, 1 ) );
            
            foreach ( mappeddoor in mapdoors )
            {
                thread debug::drawsphere( mappeddoor.origin, 1, 900, ( 1, 1, 1 ) );
            }
        }
    #/
    
    foreach ( var_25cb8d020dc582ca in self.var_d4c224d9c5d1d32f )
    {
        /#
            if ( getdvarint( @"hash_9c3d7b7ac76a359c", 0 ) == 1 )
            {
                thread debug::drawsphere( var_25cb8d020dc582ca.origin, 5, 900, ( 0.25, 0, 0.5 ) );
            }
        #/
        
        button_scriptables = namespace_2745d12b842cc671::function_3387024fc85970f7( var_25cb8d020dc582ca.origin, undefined, undefined, mapbuttons );
        
        foreach ( button in button_scriptables )
        {
            button setscriptablepartstate( #"arcwire_transmitter", #"disabled" );
            button setscriptablepartstate( #"health_listener", #"disabled_no_notify" );
            function_cf23ce3cfcc67467( button );
            self.locked_buttons[ self.locked_buttons.size ] = button;
        }
    }
    
    foreach ( var_a40b5ebaaffd1dea in self.var_b65091063dffc8f1 )
    {
        /#
            if ( getdvarint( @"hash_9c3d7b7ac76a359c", 0 ) == 1 )
            {
                thread debug::drawsphere( var_a40b5ebaaffd1dea.origin, 5, 900, ( 0.25, 0, 0.5 ) );
            }
        #/
        
        doorscriptables = [];
        doorscriptables = namespace_2745d12b842cc671::function_f4d67875159a0119( var_a40b5ebaaffd1dea, doorscriptables, "human_stronghold", istrue( var_a40b5ebaaffd1dea.canunlock ), 1, mapdoors, 150 );
        
        foreach ( door in doorscriptables )
        {
            if ( arraycontains( self.locked_doors, door ) )
            {
                continue;
            }
            
            thread function_2e3b0a5bee6342a4( door, var_a40b5ebaaffd1dea );
            self.locked_doors[ self.locked_doors.size ] = door;
        }
    }
    
    mapdoors = undefined;
    mapbuttons = undefined;
}

// Namespace ob_activity_merc_stronghold
// Params 0, eflags: 0x4
// Checksum 0xb36baa40, Offset: 0x1ec4
// Size: 0xb7
function private function_1f8e81b283e9e63f()
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    
    while ( true )
    {
        all_closed = 1;
        
        foreach ( door in self.locked_doors )
        {
            if ( !door scriptabledoorisclosed() )
            {
                all_closed = 0;
                break;
            }
        }
        
        if ( all_closed )
        {
            break;
        }
        
        waitframe();
    }
}

// Namespace ob_activity_merc_stronghold
// Params 6, eflags: 0x4
// Checksum 0xff6c5015, Offset: 0x1f83
// Size: 0x43
function private door_lock_scriptable_used( instance, part, state, player, bautouse, usestring )
{
    instance thread function_faf578848c15052f( player );
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0x567310af, Offset: 0x1fce
// Size: 0xd3
function private function_faf578848c15052f( player )
{
    if ( self.players_interacting.size )
    {
        return;
    }
    
    stronghold_activity = self.stronghold_activity;
    
    if ( stronghold_activity.fortressunlocking )
    {
        return;
    }
    
    if ( !isdefined( stronghold_activity.hacking_players ) )
    {
        stronghold_activity.hacking_players = [];
    }
    
    stronghold_activity.hacking_players[ stronghold_activity.hacking_players.size ] = player;
    interaction_result = ob_interactions_util::function_c7b5806740384a61( "earpiece_press_sat_ob", player, 5, self, 1, 1, 1, -1, "ClinkInteractions" );
    
    if ( !player || !self )
    {
        return;
    }
    
    stronghold_activity.hacking_players = arrayremove( stronghold_activity.hacking_players, player );
    
    if ( interaction_result )
    {
        stronghold_activity thread function_50b935a10b933b7b();
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0x2458c874, Offset: 0x20a9
// Size: 0x168
function private function_cf23ce3cfcc67467( button )
{
    button.stronghold_activity = self;
    button.var_cebadb03a69247f8 = &function_8c9565ec41e5814e;
    button_pos = button.origin + rotatevector( ( 0, -10, 5 ), button.angles );
    node = button function_3c4d2faf4c43b79( button_pos, button.angles - ( 0, 90, 0 ), "ob_merc_stronghold_rollup_door" );
    node.button = button;
    node.stronghold_activity = self;
    var_b3d36ee554d1661b = getentitylessscriptablearray( button.target, #targetname );
    
    foreach ( door in var_b3d36ee554d1661b )
    {
        if ( door getscriptablepartstate( #"arcwire_receiver" ) == #"set" )
        {
            door setscriptablepartstate( #"arcwire_receiver", #"reset" );
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 2, eflags: 0x4
// Checksum 0xd7ab40f2, Offset: 0x2219
// Size: 0x1f8
function private function_2e3b0a5bee6342a4( door, var_a40b5ebaaffd1dea )
{
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    throttle::throttle_wait_in_queue( level.var_3b56f00a3f54ab26, var_a40b5ebaaffd1dea );
    
    while ( !door scriptabledoorisclosed() )
    {
        door scriptabledoorclose();
        waitframe();
    }
    
    var_379606ccf80af9c8 = 200;
    var_373542293c8085a9 = vehicle_getarrayinradius( door.origin, var_379606ccf80af9c8 );
    
    foreach ( e_ent in var_373542293c8085a9 )
    {
        e_ent.dontspawnhusk = 1;
        thread vehicle::death( e_ent );
    }
    
    door scriptabledoorlock();
    door function_7653c765b6c7b815();
    
    if ( !var_a40b5ebaaffd1dea.canunlock || door.doubledoor && !issubstr( door.classname, "saloon" ) )
    {
        return;
    }
    
    door.stronghold_activity = self;
    door.var_de79f5d2971427a8 = &function_8c9565ec41e5814e;
    var_35963c626d7dc21 = rotatevector( ( 4, 0, 0 ), var_a40b5ebaaffd1dea.angles );
    node_pos = door.origin + rotatevector( ( 45, 0, 35 ), door.angles ) + var_35963c626d7dc21;
    node = door function_3c4d2faf4c43b79( node_pos, var_a40b5ebaaffd1dea.angles, "ob_merc_stronghold_door" );
    node.stronghold_activity = self;
    node.door = door;
}

// Namespace ob_activity_merc_stronghold
// Params 3, eflags: 0x4
// Checksum 0x65f414d4, Offset: 0x2419
// Size: 0x13b
function private function_3c4d2faf4c43b79( position, angles, black_hat_ref )
{
    attached_scriptable = spawnscriptable( %"sat_ob_stronghold_door_lock", position, angles );
    attached_scriptable interaction::set_interact_hint_callback( &function_2422418112b60331 );
    attached_scriptable.stronghold_activity = self.stronghold_activity;
    self.stronghold_activity.door_interact_nodes[ self.stronghold_activity.door_interact_nodes.size ] = attached_scriptable;
    
    /#
        if ( getdvarint( @"hash_9c3d7b7ac76a359c", 0 ) )
        {
            var_e0d3072fe21bed24 = attached_scriptable.origin + anglestoforward( attached_scriptable.angles ) * 20;
            thread debug::drawsphere( attached_scriptable.origin, 1, 1000, ( 0, 1, 0 ) );
            thread debug::drawline( attached_scriptable.origin, var_e0d3072fe21bed24, 1000, ( 1, 0, 0 ) );
        }
    #/
    
    if ( getdvarint( @"hash_9d42c309d434a9c7", 1 ) )
    {
        utility::callsharedfunc( #"gametype", #"hash_cbc683d4d23144e5", black_hat_ref );
    }
    
    return attached_scriptable;
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0xa5b3b665, Offset: 0x255d
// Size: 0xda
function function_2422418112b60331( usable, player )
{
    if ( usable.stronghold_activity.fortressunlocking )
    {
        return { #string:&"sat_ob_activities/interaction_hacking_in_progress", #type:"HINT_NOBUTTON" };
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
    }
    
    return { #string:&"sat_ob_activities/activity_merc_stronghold_unlock_door", #type:"HINT_NOICON" };
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0xd1d1a20d, Offset: 0x2640
// Size: 0xd, Type: bool
function function_f84d0e8ff9558884( player )
{
    return false;
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0x767e35db, Offset: 0x2656
// Size: 0x8f
function function_b0b67ab23297e563( params )
{
    player = params.hacker;
    black_hat_data = params.black_hat_data;
    assert( isdefined( player ) && isdefined( black_hat_data ) );
    player endon( #"death_or_disconnect" );
    
    while ( black_hat_data.state == "hacking" )
    {
        wait 0.2;
    }
    
    if ( isdefined( black_hat_data.hackingprogress ) )
    {
        black_hat_data.hackingprogress = 0;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0x669b7623, Offset: 0x26ed
// Size: 0x33
function function_dc125b66ee3ec220( hack_effect, attacker )
{
    stronghold_activity = self.stronghold_activity;
    stronghold_activity thread function_50b935a10b933b7b();
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0x313ff25c, Offset: 0x2728
// Size: 0x33
function function_ec00319d5c9ab121( hack_effect, attacker )
{
    stronghold_activity = self.stronghold_activity;
    stronghold_activity thread function_50b935a10b933b7b();
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0x7991e6d2, Offset: 0x2763
// Size: 0x41
function function_8c9565ec41e5814e( instance, player )
{
    level endon( #"game_ended" );
    stronghold_activity = instance.stronghold_activity;
    stronghold_activity thread function_50b935a10b933b7b();
}

// Namespace ob_activity_merc_stronghold
// Params 0, eflags: 0x4
// Checksum 0x83296151, Offset: 0x27ac
// Size: 0x4d
function private function_50b935a10b933b7b()
{
    level endon( #"game_ended" );
    
    if ( !isdefined( self.fortressunlocking ) )
    {
        self.fortressunlocking = 1;
        function_9c7c043e084f6944();
        self notify( #"hash_538b9e78ccfb0ce5" );
        thread function_c89920436582b41( spatial_zone_container::function_84f653d797112085( self, "Awareness_Zone" ) );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0, eflags: 0x4
// Checksum 0x27236b5b, Offset: 0x2801
// Size: 0x25d
function private function_f3bad1593fdca0a3()
{
    foreach ( button in self.locked_buttons )
    {
        namespace_2745d12b842cc671::function_bfec62fe69e3f84b( button );
        button utility::callsharedfunc( #"gametype", #"hash_6e7ad51030328c8e" );
    }
    
    foreach ( var_c489902621efa11e in self.locked_doors )
    {
        var_c489902621efa11e scriptabledoorunlock();
        var_c489902621efa11e function_e203bba36cfb19d0();
        var_c489902621efa11e utility::callsharedfunc( #"gametype", #"hash_6e7ad51030328c8e" );
    }
    
    foreach ( node in self.door_interact_nodes )
    {
        node freescriptable();
    }
    
    self.locked_doors = [];
    self.door_interact_nodes = [];
    
    if ( self.hacking_players )
    {
        self.hacking_players = function_5713d46873b29625( self.hacking_players );
        
        foreach ( player in self.hacking_players )
        {
            player notify( #"cancel" );
        }
        
        self.hacking_players = undefined;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x23ccb90f, Offset: 0x2a66
// Size: 0x3a0
function function_1ce0da2b2375428f()
{
    building_center = self.root_struct.origin;
    building_radius = 1000;
    awareness_radii = spatial_zone_container::function_f7fc3e6c249a8256( self, "Awareness_Zone" );
    
    if ( awareness_radii.size )
    {
        building_center = awareness_radii[ 0 ].origin;
        building_radius = awareness_radii[ 0 ].radius;
    }
    
    var_aff8e20a07b39ad9 = [ "sat_ob_loot_cache", "sat_ob_loot_cache_legendary" ];
    var_5e02eede71d84e06 = getlootscriptablearrayinradius( var_aff8e20a07b39ad9, undefined, building_center, building_radius );
    var_4c9c209c689a41a2 = [];
    var_b7b37f00ebb7fb39 = [];
    
    foreach ( cache in var_5e02eede71d84e06 )
    {
        if ( cache.type == "sat_ob_loot_cache" )
        {
            var_4c9c209c689a41a2[ var_4c9c209c689a41a2.size ] = cache;
            continue;
        }
        
        if ( cache.type == "sat_ob_loot_cache_legendary" )
        {
            var_b7b37f00ebb7fb39[ var_b7b37f00ebb7fb39.size ] = cache;
            continue;
        }
        
        assert( 0, "<dev string:x37a>" + cache.type + "<dev string:x3a5>" );
    }
    
    regular_count = var_4c9c209c689a41a2.size;
    legendary_count = var_b7b37f00ebb7fb39.size;
    self.lootcache_spawns = arrayrandomize( self.lootcache_spawns );
    self.lootcache_scriptable_array = [];
    
    foreach ( spawnpoint in self.lootcache_spawns )
    {
        var_630b42febcceab4a = 0;
        
        foreach ( cache in var_5e02eede71d84e06 )
        {
            if ( distancesquared( cache.origin, spawnpoint.origin ) < 5625 )
            {
                var_630b42febcceab4a = 1;
                break;
            }
        }
        
        if ( !var_630b42febcceab4a )
        {
            throttle::throttle_wait_in_queue( level.var_82d9194bfc9e8cc8, spawnpoint );
            origin = ob_activity_utility::function_fd8fc0e0d2300792( spawnpoint.origin );
            
            if ( regular_count < self.lootcache_regular_count )
            {
                cache = common_cache::function_9bc018c1b8aad720( #"activity_stronghold_merc", origin, spawnpoint.angles );
                cache setscriptablepartstate( "body", "closed_usable" );
                self.lootcache_scriptable_array[ self.lootcache_scriptable_array.size ] = cache;
                regular_count += 1;
                continue;
            }
            
            if ( legendary_count < self.lootcache_legendary_count )
            {
                cache = common_cache::function_9bc018c1b8aad720( #"hash_c1d0ea6db3f38ac5", origin, spawnpoint.angles );
                cache setscriptablepartstate( "body", "closed_usable" );
                self.lootcache_scriptable_array[ self.lootcache_scriptable_array.size ] = cache;
                legendary_count += 1;
                continue;
            }
            
            break;
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x797bead3, Offset: 0x2e0e
// Size: 0x38
function function_63fba4dca5ce837b()
{
    covertargetname = "e_cover_" + self.main_struct.target;
    self.var_592890cbcd7cfad1 = ob_soldier_util::function_a315cc5d1dee425a( covertargetname );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x7358d500, Offset: 0x2e4e
// Size: 0xe9
function function_dc0ab1e3655d34d3()
{
    self endon( #"activity_ended" );
    
    if ( self.region_difficulty == "difficulty_easy" )
    {
        return;
    }
    
    spawnchance = getdvarfloat( @"hash_915df6618ac2897d", 0.5 );
    
    if ( randomfloat( 1 ) > spawnchance )
    {
        return;
    }
    
    wait 0.5;
    alivesoldiers = utility::array_removedead_or_dying( self.current_soldiers );
    
    if ( alivesoldiers.size == 0 )
    {
        return;
    }
    
    ownersoldier = alivesoldiers[ 0 ];
    
    if ( isdefined( self.killstreak_support_point ) )
    {
        spawnpoint = self.killstreak_support_point.origin;
        spawnangles = self.killstreak_support_point.angles;
    }
    else
    {
        spawnpoint = ownersoldier getorigin();
        spawnangles = ownersoldier getplayerangles();
    }
    
    ob_activity_utility::function_ded5fcf7673a2ae6( ownersoldier, spawnpoint, spawnangles );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x504ee1d5, Offset: 0x2f3f
// Size: 0x17c
function function_bd51947eb0af8588()
{
    self endon( #"activity_ended" );
    s_child_struct = utility::getstruct( self.varianttag + "_Exterior_encounter", "targetname" );
    var_1e6822b67fd63000 = utility::getstructarray( s_child_struct.target, "targetname" );
    vehiclestructs = [];
    
    foreach ( struct in var_1e6822b67fd63000 )
    {
        if ( struct.script_label == "vehicle" )
        {
            vehiclestructs[ vehiclestructs.size ] = struct;
        }
    }
    
    if ( vehiclestructs.size > 0 )
    {
        if ( vehiclestructs.size > 1 )
        {
            n_min_vehicles = int( min( vehiclestructs.size, 1 ) );
            n_max_vehicles = int( min( vehiclestructs.size, 3 ) );
            
            if ( n_max_vehicles > n_min_vehicles )
            {
                n_vehicles = randomintrange( n_min_vehicles, n_max_vehicles );
            }
            else
            {
                n_vehicles = n_min_vehicles;
            }
            
            structs_random = arrayrandomize( vehiclestructs );
            var_5e04ae23afbe9c4f = utility::array_slice( structs_random, 0, n_vehicles );
        }
        else
        {
            var_5e04ae23afbe9c4f = vehiclestructs;
        }
        
        ob_activity_utility::function_4ad66bfa02812252( "veh_sat_medium_truck_ob", var_5e04ae23afbe9c4f, 3000 );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xfeeba621, Offset: 0x30c3
// Size: 0x244
function function_d0081dbcec2b9ec()
{
    if ( !getdvarint( @"hash_636734c956278c03", 1 ) )
    {
        return;
    }
    
    request_id = activity_ai_encounters::function_92b671064b0b1ce2( self.varianttag + "_Exterior_encounter", 1, 1, 1, 2 );
    
    if ( request_id )
    {
        activity_ai_encounters::function_52d1342183200a8f( request_id, &function_91a352fddcb84c74, self );
        function_1a9d724a960fa19d( request_id, self.region_difficulty, 1 );
    }
    
    s_child_struct = utility::getstruct( self.varianttag + "_Exterior_encounter", "targetname" );
    self.traps = spawnstruct();
    self.traps.mines = [];
    trap_owner = ob_activity_utility::function_d12ca4c58fe5faf0();
    var_1e6822b67fd63000 = utility::getstructarray( s_child_struct.target, "targetname" );
    
    foreach ( struct in var_1e6822b67fd63000 )
    {
        if ( struct.script_noteworthy == "mine" )
        {
            mine = ob_soldier_util::ob_mine_spawn( struct.origin, undefined, trap_owner, undefined, struct.angles, 1 );
            
            if ( getdvarint( @"hash_d670f137f06e577f", 0 ) )
            {
                ob_resource_manager::function_4d956586279ad989( mine );
            }
            
            self.traps.mines[ self.traps.mines.size ] = mine;
            continue;
        }
        
        if ( struct.script_noteworthy == "sentry_turret" )
        {
            if ( self.region_difficulty != "difficulty_easy" )
            {
                struct.allowemp = 1;
                struct.var_b9ac62a4e325b4be = #"killstreak";
                ob_activity_utility::ob_activity_spawn_turret( struct, undefined, trap_owner, 0, 1 );
            }
            
            continue;
        }
        
        if ( struct.script_noteworthy == "killstreak_support" )
        {
            self.killstreak_support_point = struct;
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 4
// Checksum 0xb7a6131, Offset: 0x330f
// Size: 0xf5
function function_91a352fddcb84c74( requestid, activity_instance, agent, data )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance endon( #"hash_538b9e78ccfb0ce5" );
    level endon( "ai_encounter_despawning_" + requestid );
    
    if ( !isdefined( activity_instance.var_c6e0d99655ab8afd ) )
    {
        activity_instance.var_c6e0d99655ab8afd = [];
    }
    
    activity_instance.var_c6e0d99655ab8afd[ activity_instance.var_c6e0d99655ab8afd.size ] = agent;
    activity_instance thread activity_participation::function_d041ee0ec570299d( agent );
    agent waittill( #"death", attacker );
    activity_instance.var_c6e0d99655ab8afd = arrayremove( activity_instance.var_c6e0d99655ab8afd, agent );
    wait 0.5;
    
    if ( activity_instance.var_c6e0d99655ab8afd.size == 0 )
    {
        activity_instance ob_activity_utility::function_894ac80e038636c5( "wcastrongholdextclear" );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xd6a05dcd, Offset: 0x340c
// Size: 0xf7
function function_9c7c043e084f6944()
{
    self.encounter = activity_ai_encounters::function_92b671064b0b1ce2( self.root_struct.target, 1, 0, 1, 2 );
    
    if ( isdefined( self.encounter ) )
    {
        function_1a9d724a960fa19d( self.encounter, self.region_difficulty, 1 );
        activity_ai_encounters::function_52d1342183200a8f( self.encounter, &function_106401fdb9c0c782, self );
        activity_ai_encounters::function_16b0131751c4fb39( self.encounter, &function_cb3902349dfee80d, self );
        activity_ai_encounters::function_6bf4ff2fbde584ee( self.encounter, &function_5da02861c00734c9, self );
        ai_spawn_director::function_c4cace40604d2bf9( self.encounter, &function_b95414105344b9b3, self );
    }
    
    encounterdata = function_9b649316adcccbaa( self.encounter );
    
    if ( isdefined( encounterdata ) )
    {
        self.encounterorigin = encounterdata.origin;
        self.encounterradius = encounterdata.radius;
    }
    
    thread function_3d80f56f833101e0();
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0x11ef7310, Offset: 0x350b
// Size: 0x4f
function function_b95414105344b9b3( encounterid, activityinstance )
{
    if ( self == activityinstance.stronghold_boss )
    {
        activityinstance namespace_d7fa4530141146a5::function_501e44ea1cb9219d( activityinstance.var_a1e462ff5f205346 );
        activityinstance.stronghold_boss = undefined;
        activityinstance.var_a1e462ff5f205346 = undefined;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 4
// Checksum 0x6407a990, Offset: 0x3562
// Size: 0x13b
function function_106401fdb9c0c782( encounterid, activityinstance, agent, data )
{
    level endon( #"game_ended" );
    agent endon( #"death" );
    agent.activityinstance = activityinstance;
    activityinstance thread activity_participation::function_d041ee0ec570299d( agent );
    
    if ( data.spawnfilter == #"stronghold_master" )
    {
        agent.var_e94a0381e288005e = #"activity_stronghold_boss";
        activityinstance.stronghold_boss = agent;
        activityinstance.var_a1e462ff5f205346 = activityinstance namespace_d7fa4530141146a5::function_de87bf7072515cd3( "sat_ob_merc_stronghold_boss_marker", 0, 1 );
        objidpoolmanager::update_objective_onentity( activityinstance.var_a1e462ff5f205346, agent );
        activityinstance notify( #"hash_f8a623598b1d3f00" );
        
        /#
            agent thread function_244e8a04db292379();
        #/
    }
    else
    {
        activityinstance.current_soldiers[ activityinstance.current_soldiers.size ] = agent;
    }
    
    agent.disabledropfromcombat = 1;
    
    if ( agent.stealth )
    {
        agent utility::ent_flag_wait( "stealth_enabled" );
        agent setstealthstate( "combat" );
        agent function_d5806f1ef80bfbca( agent, activityinstance );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 3
// Checksum 0xe5eace30, Offset: 0x36a5
// Size: 0x62
function function_5da02861c00734c9( requestid, activityinstance, data )
{
    activityinstance function_f3bad1593fdca0a3();
    
    if ( !isdefined( activityinstance.stronghold_boss ) )
    {
        assertmsg( "<dev string:x3d3>" );
        activity_instance_common::endactivity( activityinstance, 1 );
        return;
    }
    
    activityinstance thread function_df5c418ef57ef55();
    activityinstance thread function_dc0ab1e3655d34d3();
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x2413d463, Offset: 0x370f
// Size: 0x84
function function_3d80f56f833101e0()
{
    activityinstance = self;
    self endon( #"instance_destroyed" );
    self endon( #"activity_ended" );
    activityinstance childthread stronghold_alarm();
    timer = 30;
    
    while ( timer > 0 )
    {
        timer--;
        
        /#
            iprintlnbold( "<dev string:x437>" + timer );
        #/
        
        wait 1;
    }
    
    player_list = spatial_zone_container::function_84f653d797112085( self, "Awareness_Zone" );
    activityinstance thread function_3c3908a467d4e7b4();
    activityinstance function_7f914a6a81114341();
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xa59ba92a, Offset: 0x379b
// Size: 0xa0
function function_7f914a6a81114341()
{
    foreach ( tripwire in self.tripwires )
    {
        if ( !isdefined( tripwire.navobstacleid ) )
        {
            continue;
        }
        
        destroynavobstacle( tripwire.navobstacleid );
        tripwire.navobstacleid = undefined;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x8a31580, Offset: 0x3843
// Size: 0x19a
function setup_jailbreak_machines()
{
    self.var_eac35ee769381bbf = getdvarint( @"hash_92bf38652682366d", self.variant_settings.var_f6f0720852b5d829 );
    self.var_6c66996d52be50e7 = getdvarint( @"hash_6a9106695daf1985", self.variant_settings.var_451f4da67d212af1 );
    self.jailbreak_machine_array = [];
    scriptable_array = getentitylessscriptablearray( self.varianttag, #target, self.root_struct.origin, 1500 );
    
    foreach ( scriptable in scriptable_array )
    {
        if ( scriptable.script_noteworthy == "jbm_scriptable" )
        {
            if ( !scriptable.var_e094be5b695e90a8 )
            {
                scriptable jailbreak_machine::init( 1, 1, 0 );
                scriptable.var_e094be5b695e90a8 = 1;
            }
            
            scriptable jailbreak_machine::set_objective_complete( 0 );
            scriptable setscriptablepartstate( #"jailbreak_icon", #"off" );
            scriptable.interact.var_9c7d8a932434abba = [];
            scriptable notify( #"jailbreak_setup" );
            self.jailbreak_machine_array[ self.jailbreak_machine_array.size ] = scriptable;
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x70f6a85, Offset: 0x39e5
// Size: 0x18f
function function_704265ecc605c1b9()
{
    foreach ( scriptable in self.jailbreak_machine_array )
    {
        if ( scriptable.script_noteworthy == "jbm_scriptable" )
        {
            allowed_players = undefined;
            
            if ( self.var_6c66996d52be50e7 )
            {
                allowed_players = self.playerparticipants;
            }
            
            scriptable jailbreak_machine::set_objective_complete( 1, allowed_players );
            
            foreach ( player in self.playerparticipants )
            {
                pingindex = player calloutmarkerping::function_920a63c06abdefe8( scriptable.index );
                player calloutmarkerping_hide( pingindex );
                player calloutmarkerping_show( pingindex, player );
                player thread calloutmarkerping::function_3c501da3379eca0a( player, pingindex, undefined, [ "jbm_used" ], 120 );
            }
        }
    }
    
    if ( self.var_eac35ee769381bbf )
    {
        level thread function_d57b9a22bd9e512c( self.jailbreak_machine_array, self.var_eac35ee769381bbf );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 2, eflags: 0x4
// Checksum 0x5601deb8, Offset: 0x3b7c
// Size: 0x133
function private function_d57b9a22bd9e512c( jailbreaks, duration )
{
    level endon( #"game_ended" );
    
    foreach ( jailbreak in jailbreaks )
    {
        jailbreak endon( #"jailbreak_setup" );
    }
    
    wait duration;
    
    foreach ( jailbreak in jailbreaks )
    {
        jailbreak calloutmarkerping::function_608710c894185549();
        jailbreak jailbreak_machine::set_objective_complete( 0 );
        jailbreak setscriptablepartstate( #"jailbreak_icon", #"off" );
        jailbreak.isexpired = 1;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0xf5ed18d2, Offset: 0x3cb7
// Size: 0x101
function stronghold_alarm()
{
    foreach ( light in self.alarm_lights )
    {
        light setscriptablepartstate( "base", "alert_on" );
    }
    
    alarm_alias = "sat_ob_activity_stronghold_alarm";
    awareness_zone_origin = spatial_zone_container::function_f7fc3e6c249a8256( self, "Awareness_Zone" )[ 0 ].origin;
    alarm_origin = ( awareness_zone_origin[ 0 ], awareness_zone_origin[ 1 ], awareness_zone_origin[ 2 ] + 200 );
    var_4a7e50a07112c158 = max( level.framedurationseconds, lookupsoundlength( alarm_alias ) / 1000 );
    
    while ( true )
    {
        playsoundatpos( alarm_origin, alarm_alias );
        wait var_4a7e50a07112c158;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x380d1a4, Offset: 0x3dc0
// Size: 0x92
function function_df5c418ef57ef55()
{
    self notify( #"hash_c50aef8517316e2a" );
    self endon( #"hash_c50aef8517316e2a" );
    self endon( #"activity_ended" );
    self endon( #"instance_destroyed" );
    level endon( "ai_encounter_despawning_" + self.encounter );
    self.stronghold_boss waittill( #"death" );
    namespace_9085ae059032a84f::updateprogress( 1, self );
    namespace_d7fa4530141146a5::function_501e44ea1cb9219d( self.var_a1e462ff5f205346 );
    thread ob_activity_utility::function_894ac80e038636c5( "wcastrongholdsuccess", undefined, undefined, undefined, undefined, &function_ba05a4c0a190cd3f );
    activity_instance_common::endactivity( self, 1 );
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0x56042d8d, Offset: 0x3e5a
// Size: 0x37
function function_ba05a4c0a190cd3f( var_73f4f05f29c6770a )
{
    if ( var_73f4f05f29c6770a == "wcastrongholdsuccess_kagan" || var_73f4f05f29c6770a == "wcastrongholdsuccess_razor" )
    {
        return [ "wcastrongholdclapback", "wcastrongholdlastword" ];
    }
}

// Namespace ob_activity_merc_stronghold
// Params 3
// Checksum 0x109f1afb, Offset: 0x3e9a
// Size: 0x1f, Type: bool
function function_cb3902349dfee80d( encounterid, activityinstance, Wave )
{
    return false;
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0x4bd103de, Offset: 0x3ec2
// Size: 0xf9
function private function_4e5ea6ccea6a8d98( activityinstance )
{
    agent = self;
    
    if ( !( isdefined( agent.script_stealthgroup ) && isdefined( level.stealth.combat_volumes[ agent.script_stealthgroup ] ) ) )
    {
        defend_radius = 500;
        reinforcementposition = activityinstance.main_struct.origin;
        reinforcementposition = getclosestpointonnavmesh( reinforcementposition );
        agent.goalheight = 80;
        agent setgoalpos( reinforcementposition, defend_radius );
        
        /#
            if ( getdvarint( @"scr_ob_activity_merc_stronghold_debug", 0 ) == 1 )
            {
                level thread debug::drawline( activityinstance.main_struct.origin, reinforcementposition, 9999, game[ "<dev string:x451>" ][ "<dev string:x458>" ] );
                level thread debug::drawsphere( reinforcementposition, 24, 9999, game[ "<dev string:x451>" ][ "<dev string:x458>" ] );
            }
        #/
    }
}

// Namespace ob_activity_merc_stronghold
// Params 4
// Checksum 0xefd618c5, Offset: 0x3fc3
// Size: 0x80
function function_985b8413c3d747c6( encounterid, activityinstance, agent, data )
{
    level endon( #"game_ended" );
    agent endon( #"death" );
    agent.qsetgoalpos = 1;
    agent.disabledropfromcombat = 1;
    agent utility::ent_flag_wait( "stealth_enabled" );
    agent setstealthstate( "combat" );
    agent function_4e5ea6ccea6a8d98( activityinstance );
}

// Namespace ob_activity_merc_stronghold
// Params 2
// Checksum 0x1ec3a5eb, Offset: 0x404b
// Size: 0xd4
function function_d5806f1ef80bfbca( agent, activityinstance )
{
    if ( !isdefined( agent ) || !agent.isactive )
    {
        return;
    }
    
    perfect_awareness_buffer = 120;
    var_4e878d7d0d490a4d = activityinstance.encounterorigin;
    var_c586c93e1fc6087a = activityinstance.encounterradius + perfect_awareness_buffer;
    
    if ( isdefined( var_4e878d7d0d490a4d ) && isdefined( var_c586c93e1fc6087a ) )
    {
        /#
            if ( getdvarint( @"scr_ob_activity_merc_stronghold_debug", 0 ) == 1 )
            {
                level thread debug::drawline( var_4e878d7d0d490a4d, agent.origin, 9999, game[ "<dev string:x451>" ][ "<dev string:x458>" ] );
                level thread debug::drawsphere( var_4e878d7d0d490a4d, var_c586c93e1fc6087a, 9999, game[ "<dev string:x451>" ][ "<dev string:x458>" ] );
            }
        #/
        
        agent function_fa32376aaa88a7a2( var_4e878d7d0d490a4d, var_c586c93e1fc6087a );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 3
// Checksum 0x9ba182e8, Offset: 0x4127
// Size: 0xb7
function function_e8aecaa6a426631a( encounterid, activityinstance, agent )
{
    level endon( #"game_ended" );
    agent endon( #"death" );
    agent ob_activity_utility::function_311417deee5b4c1c();
    
    if ( !activityinstance.var_7b084f2dfa516e52 )
    {
        activityinstance thread function_f3bad1593fdca0a3();
        activityinstance.var_7b084f2dfa516e52 = 1;
    }
    
    waitframe();
    agent function_4e5ea6ccea6a8d98( activityinstance );
    
    while ( true )
    {
        reinforcement_timeout = 45;
        utility::waittill_notify_or_timeout( "goal", reinforcement_timeout );
        
        if ( self iswithinscriptgoalradius() )
        {
            break;
        }
    }
    
    agent.var_a2591b7b6a16fd5d = 0;
    function_d5806f1ef80bfbca( agent, activityinstance );
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0xb0b285a2, Offset: 0x41e6
// Size: 0x57
function player_left_activity( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    
    if ( isdefined( activity_instance ) && activity_instance.state != "Ended" )
    {
        ob_activity_utility::function_894ac80e038636c5( "wcastrongholdfail", player_list );
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0x5ad401e5, Offset: 0x4245
// Size: 0x39
function function_7730c783c0e4be5c( relevant_info_struct )
{
    activity_instance = self;
    player_list = relevant_info_struct.playerlist;
    ob_activity_definition_utils::function_f23bdcfc447427ae( undefined, 0, 1 );
}

// Namespace ob_activity_merc_stronghold
// Params 0
// Checksum 0x74b4f86, Offset: 0x4286
// Size: 0xdc
function function_f3812f02bde609c0()
{
    briefing_zone = spatial_zone_container::function_f7fc3e6c249a8256( self, "Awareness_Zone" )[ 0 ];
    origin = spatial_zone_container::function_2676e037929f0833( briefing_zone );
    radius = spatial_zone_container::function_231d9e91d8ef7b5f( briefing_zone );
    
    while ( true )
    {
        wait 0.2;
        player_list = function_d63fe6a4c08ba6f5( origin, radius, 2000, 0, self.var_56ae48f9eceb8b3a );
        
        foreach ( player in player_list )
        {
            function_b388898e2d274453( player );
        }
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0xa7c5786e, Offset: 0x436a
// Size: 0xd1
function private function_c89920436582b41( players )
{
    /#
        ob_humans::function_718254d8560b5513( self, "<dev string:x45e>" );
    #/
    
    if ( !isarray( players ) || players.size == 0 )
    {
        return;
    }
    
    foreach ( player in players )
    {
        params = spawnstruct();
        params.player = player;
        callback::callback( "on_unlock_merc_stronghold", params );
    }
    
    ob_activity_utility::function_894ac80e038636c5( "wcastrongholdbrsuccess", players );
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0x432a9258, Offset: 0x4443
// Size: 0x75
function private function_a38c516bfe0723e2( activityinstance )
{
    instid = activity_instance_common::getinstanceid( activityinstance );
    activitytype = activity_instance_common::getactivitytype( activityinstance );
    
    if ( activitytype == "REV_OB_MERC_STRONGHOLD" )
    {
        assert( !isdefined( level.activities.strongholdinstances[ instid ] ) );
        level.activities.strongholdinstances[ instid ] = activityinstance;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0x4e8a10a4, Offset: 0x44c0
// Size: 0x53
function private function_b9ce0c1555fad68e( activityinstance )
{
    uniqueid = activity_instance_common::getinstanceid( activityinstance );
    activitytype = activity_instance_common::getactivitytype( activityinstance );
    
    if ( activitytype == "REV_OB_MERC_STRONGHOLD" )
    {
        level.activities.strongholdinstances[ uniqueid ] = undefined;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 1, eflags: 0x4
// Checksum 0xa06f2831, Offset: 0x451b
// Size: 0x7c
function private function_b388898e2d274453( player )
{
    assert( isdefined( player ) );
    
    /#
        ob_humans::function_5224f34d2833fe25( player, self, "<dev string:x47f>" );
    #/
    
    if ( !isdefined( self.var_56ae48f9eceb8b3a ) )
    {
        self.var_56ae48f9eceb8b3a = [];
    }
    
    if ( !arraycontains( self.var_56ae48f9eceb8b3a, player ) )
    {
        ob_activity_utility::function_894ac80e038636c5( "wcastrongholdbrief", [ player ] );
        self.var_56ae48f9eceb8b3a[ self.var_56ae48f9eceb8b3a.size ] = player;
    }
}

// Namespace ob_activity_merc_stronghold
// Params 2, eflags: 0x4
// Checksum 0x8d4edade, Offset: 0x459f
// Size: 0x31c
function private function_381c7f71a93d8baa( players, scriptableref )
{
    /#
        ob_humans::function_718254d8560b5513( self, "<dev string:x49b>" );
    #/
    
    if ( !isarray( players ) || players.size == 0 || !isdefined( scriptableref ) )
    {
        return;
    }
    
    var_edf094f6f941163a = "activity_merc_stronghold_success_generic";
    
    if ( issubstr( scriptableref, "allforone" ) )
    {
        var_edf094f6f941163a = "activity_merc_stronghold_success_all_for_one";
    }
    else if ( issubstr( scriptableref, "chemist" ) )
    {
        var_edf094f6f941163a = "activity_merc_stronghold_success_chemist";
    }
    else if ( issubstr( scriptableref, "maestro" ) )
    {
        var_edf094f6f941163a = "activity_merc_stronghold_success_maestro";
    }
    else if ( issubstr( scriptableref, "rainmaker" ) )
    {
        var_edf094f6f941163a = "activity_merc_stronghold_success_rainmaker";
    }
    
    if ( isdefined( var_edf094f6f941163a ) )
    {
        var_296b3965dee9889 = [];
        
        foreach ( player in players )
        {
            if ( !isdefined( player ) || arraycontains( var_296b3965dee9889, player ) )
            {
                continue;
            }
            
            on_mission = ( namespace_e81a4357e5094976::is_squad_on_mission( player, 17078 ) || getdvarint( @"hash_7b8b09c504a0c9a0", 0 ) ) && var_edf094f6f941163a == "activity_merc_stronghold_success_all_for_one";
            
            if ( on_mission )
            {
                params = spawnstruct();
                params.player = player;
                params.warlord = "allforone";
                callback::callback( "merc_warlord_success", params );
                squadmembers = player squad_utility::getsquadmembers( player.team, 1 );
                
                foreach ( squadmember in squadmembers )
                {
                    var_296b3965dee9889[ var_296b3965dee9889.size ] = squadmember;
                }
            }
        }
        
        foreach ( player in players )
        {
            if ( !isdefined( player ) || arraycontains( var_296b3965dee9889, player ) )
            {
                /#
                    ob_humans::function_5224f34d2833fe25( player, self, "<dev string:x4b9>" );
                #/
                
                continue;
            }
            
            /#
                ob_humans::function_b43e56660c5cfc1f( player );
                ob_humans::function_5224f34d2833fe25( player, self, "<dev string:x4ef>" + var_edf094f6f941163a + "<dev string:x50f>" );
            #/
            
            var_df05bfe0d860f4b1 = namespace_e81a4357e5094976::function_203aabe755cf54aa( player );
            thread namespace_e81a4357e5094976::function_6caa1743696a5163( var_df05bfe0d860f4b1, var_edf094f6f941163a, [ player ] );
        }
        
        return;
    }
    
    /#
        ob_humans::function_718254d8560b5513( self, "<dev string:x511>" );
    #/
}

// Namespace ob_activity_merc_stronghold
// Params 1
// Checksum 0x8eb1ee9a, Offset: 0x48c3
// Size: 0x20
function function_fc9aa2d5ea87af51( variant_tag )
{
    if ( isdefined( variant_tag ) )
    {
        ob_activity_utility::function_fe0fd74238abb635( "REV_OB_SUPPLY_DROP", variant_tag );
    }
}

/#

    // Namespace ob_activity_merc_stronghold
    // Params 0, eflags: 0x4
    // Checksum 0xa54eda86, Offset: 0x48eb
    // Size: 0x34, Type: dev
    function private function_19ad3d93d3481d87()
    {
        wait 5;
        devgui::function_9082edeb5db93280( "<dev string:x548>" );
        devgui::add_devgui_func( "<dev string:x586>", "<dev string:x59f>", &function_aaae5e466ac3be83 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_activity_merc_stronghold
    // Params 0
    // Checksum 0x4b586db, Offset: 0x4927
    // Size: 0xa9, Type: dev
    function function_aaae5e466ac3be83()
    {
        foreach ( player in level.players )
        {
            spawnoptions = common_item::items_initspawnoptions_spawnfromposition( player.origin );
            item = common_item::function_325e28c0fb65c36a( "<dev string:x5d0>", 1, spawnoptions );
        }
    }

    // Namespace ob_activity_merc_stronghold
    // Params 0
    // Checksum 0xcdda9ee, Offset: 0x49d8
    // Size: 0x60, Type: dev
    function function_244e8a04db292379()
    {
        level endon( #"game_ended" );
        self endon( #"death" );
        setdvar( @"hash_c907a978a4c8a2f8", 0 );
        
        while ( true )
        {
            wait 0.2;
            
            if ( getdvarint( @"hash_c907a978a4c8a2f8", 0 ) )
            {
                setdvar( @"hash_c907a978a4c8a2f8", 0 );
                self kill();
            }
        }
    }

#/
