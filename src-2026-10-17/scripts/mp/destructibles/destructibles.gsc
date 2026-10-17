#using scripts\common\devgui;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\destructibles\destructibles_actions;
#using scripts\mp\destructibles\destructibles_behaviors;

#namespace destructible;

// Namespace destructible
// Params 0, eflags: 0x5
// Checksum 0x806ca94c, Offset: 0x11d
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"destructibles", undefined, &function_7cf8dacb278a2665, &postmain_init );
}

// Namespace destructible
// Params 0
// Checksum 0x39c303a0, Offset: 0x142
// Size: 0x54
function function_7cf8dacb278a2665()
{
    if ( !is_destructibles_system_enabled() )
    {
        return;
    }
    
    level.destructibles = { #groups:[], #instances:[], #data:{} };
    destructible_actions::init();
    destructible_behaviors::init();
    scriptable::scriptable_addnotifycallback( "destructible_register", &register_destructible );
}

// Namespace destructible
// Params 0, eflags: 0x4
// Checksum 0xedf27084, Offset: 0x19e
// Size: 0x21, Type: bool
function private is_destructibles_system_enabled()
{
    map_info_bundle = getactivemapinfobundle();
    return map_info_bundle.var_c32976879a1599cd ?? 0;
}

// Namespace destructible
// Params 4, eflags: 0x4
// Checksum 0xe1134c5f, Offset: 0x1c8
// Size: 0xda
function private register_destructible( instance, note, param, var_64ffacba090c91be )
{
    if ( is_registered( instance ) )
    {
        return;
    }
    
    instance.destructible_data = { #behaviors:[], #actions:[] };
    
    if ( !isdefined( level.destructibles.instances[ instance.type ] ) )
    {
        level.destructibles.instances[ instance.type ] = [];
    }
    
    level.destructibles.instances[ instance.type ][ level.destructibles.instances[ instance.type ].size ] = instance;
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0xb14f8c6e, Offset: 0x2aa
// Size: 0x55, Type: bool
function private is_registered( instance )
{
    return isdefined( level.destructibles.instances[ instance.type ] ) && arraycontains( level.destructibles.instances[ instance.type ], instance );
}

// Namespace destructible
// Params 0
// Checksum 0xf47e0528, Offset: 0x308
// Size: 0x106
function postmain_init()
{
    if ( !is_destructibles_system_enabled() )
    {
        return;
    }
    
    utility::flag_wait( "scriptables_ready" );
    level.destructibles.data = getactivemapinfobundle().destructibles;
    
    foreach ( destructible_entry in level.destructibles.data )
    {
        if ( !isdefined( destructible_entry.destructibles ) || destructible_entry.destructibles.size == 0 )
        {
            assertmsg( "<dev string:x24>" );
            continue;
        }
        
        thread function_1f07fb9541786459( destructible_entry );
    }
    
    utility::flag_set( "destructibles_ready" );
    
    /#
        init_dev_commands();
    #/
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0xdb026260, Offset: 0x416
// Size: 0x303
function private function_1f07fb9541786459( destructible_entry )
{
    instances = [];
    group = [];
    
    foreach ( destructible in destructible_entry.destructibles )
    {
        instances = arraycombine( instances, get_instances( destructible.scriptable ) );
        group[ group.size ] = destructible.scriptable;
    }
    
    if ( !isdefined( instances ) || instances.size == 0 )
    {
        return;
    }
    
    level.destructibles.groups[ level.destructibles.groups.size ] = group;
    random_seed = utility::callsharedfunc( #"zombie", #"get_persistent_random_seed" ) ?? randomint( 10 );
    instances = utility::function_40662075b6c8798c( instances, random_seed );
    instances_to_spawn = int( floor( instances.size * destructible_entry.spawnpercent / 100 ) );
    params = { #events:destructible_entry.events, #behaviors:destructible_entry.behaviors };
    
    foreach ( instance in instances )
    {
        instance hide();
    }
    
    if ( isdefined( destructible_entry.spawnnotify ) )
    {
        level waittill( destructible_entry.spawnnotify );
    }
    
    foreach ( instance in instances )
    {
        if ( instances_to_spawn <= 0 )
        {
            break;
        }
        
        instance function_57c6f67724f460ec( params );
        waitframe();
        instance spawn();
        instances_to_spawn--;
    }
    
    foreach ( destructible in group )
    {
        utility::flag_set( destructible + "_destructible_ready" );
    }
}

// Namespace destructible
// Params 1
// Checksum 0x808ea8dd, Offset: 0x721
// Size: 0x175
function function_919f39b38db04950( scriptable )
{
    var_b6af40eef3f33fe2 = undefined;
    
    foreach ( destructible_entry in level.destructibles.data )
    {
        if ( isdefined( destructible_entry.destructibles ) )
        {
            foreach ( destructible_scriptable_struct in destructible_entry.destructibles )
            {
                if ( destructible_scriptable_struct.scriptable == scriptable.type )
                {
                    var_b6af40eef3f33fe2 = destructible_entry;
                    break;
                }
            }
        }
    }
    
    if ( !var_b6af40eef3f33fe2 )
    {
        return;
    }
    
    params = { #events:var_b6af40eef3f33fe2.events, #behaviors:var_b6af40eef3f33fe2.behaviors };
    scriptable function_57c6f67724f460ec( params );
}

// Namespace destructible
// Params 1
// Checksum 0xb6aaeb05, Offset: 0x89e
// Size: 0x22
function get_instances( destructible_name )
{
    return level.destructibles.instances[ destructible_name ];
}

// Namespace destructible
// Params 1
// Checksum 0x1a7ce1ab, Offset: 0x8c9
// Size: 0x11c
function function_c28a5f35d1a84d43( destructible_name )
{
    instances = [];
    
    foreach ( group in level.destructibles.groups )
    {
        if ( arraycontains( group, destructible_name ) )
        {
            foreach ( entry in group )
            {
                instances = arraycombine( instances, get_instances( entry ) );
            }
        }
    }
    
    instances = arrayremoveduplicates( instances );
    return instances;
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0xbeca3e26, Offset: 0x9ee
// Size: 0x248
function private function_57c6f67724f460ec( params )
{
    foreach ( event in params.events )
    {
        event_id = event.variant_object.eventid;
        
        foreach ( entry in event.variant_object.actions )
        {
            action_id = entry.variant_object.actionid;
            action = destructible_actions::get_action( action_id );
            action.params = entry.variant_object.params;
            add_action( event_id, action );
        }
        
        foreach ( entry in event.variant_object.behaviors )
        {
            behavior_id = entry.variant_object.behaviorid;
            behavior = destructible_behaviors::get_behavior( behavior_id );
            behavior.params = entry.variant_object.params;
            add_behavior( event_id, behavior );
        }
    }
    
    set_enabled();
}

// Namespace destructible
// Params 2
// Checksum 0x50910624, Offset: 0xc3e
// Size: 0x7f
function add_action( event_id, action )
{
    if ( !isdefined( self.destructible_data.actions[ event_id ] ) )
    {
        self.destructible_data.actions[ event_id ] = [];
    }
    
    self.destructible_data.actions[ event_id ][ self.destructible_data.actions[ event_id ].size ] = action;
    register_event( event_id );
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0xf4eaf924, Offset: 0xcc5
// Size: 0x2b
function private register_event( event_id )
{
    if ( !isdefined( level.scriptable_notify_callback_funcs[ event_id ] ) )
    {
        scriptable::scriptable_addnotifycallback( event_id, &on_event );
    }
}

// Namespace destructible
// Params 4, eflags: 0x4
// Checksum 0xc8adae22, Offset: 0xcf8
// Size: 0x86
function private on_event( instance, event_id, param, var_64ffacba090c91be )
{
    instance execute_actions( event_id );
    
    if ( isdefined( self.destructible_data.var_d07ac647e538bd03 ) )
    {
        instance stop_behaviors( self.destructible_data.var_d07ac647e538bd03 );
    }
    
    instance thread execute_behaviors( event_id );
    instance.destructible_data.var_d07ac647e538bd03 = event_id;
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0xf8b9bac5, Offset: 0xd86
// Size: 0xa3
function private execute_actions( event_id )
{
    foreach ( action in self.destructible_data.actions[ event_id ] )
    {
        self thread [[ action.execute ]]( action.params );
    }
}

// Namespace destructible
// Params 2, eflags: 0x4
// Checksum 0x2ddebb90, Offset: 0xe31
// Size: 0x7f
function private add_behavior( event_id, behavior )
{
    if ( !isdefined( self.destructible_data.behaviors[ event_id ] ) )
    {
        self.destructible_data.behaviors[ event_id ] = [];
    }
    
    self.destructible_data.behaviors[ event_id ][ self.destructible_data.behaviors[ event_id ].size ] = behavior;
    register_event( event_id );
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0x96e685b6, Offset: 0xeb8
// Size: 0xba
function private execute_behaviors( event_id )
{
    level endon( #"game_ended" );
    self endon( event_id + "_stop" );
    
    foreach ( behavior in self.destructible_data.behaviors[ event_id ] )
    {
        self childthread [[ behavior.execute ]]( behavior.params );
    }
}

// Namespace destructible
// Params 1, eflags: 0x4
// Checksum 0x12f834a3, Offset: 0xf7a
// Size: 0xb2
function private stop_behaviors( event_id )
{
    foreach ( behavior in self.destructible_data.behaviors[ event_id ] )
    {
        self notify( event_id + "_stop" );
        
        if ( isdefined( behavior.stop ) )
        {
            self thread [[ behavior.stop ]]();
        }
    }
}

// Namespace destructible
// Params 2
// Checksum 0xc31adbca, Offset: 0x1034
// Size: 0xde
function remove_action( event_id, action )
{
    foreach ( entry in self.destructible_data.actions[ event_id ] )
    {
        if ( entry.execute == action.execute )
        {
            self.destructible_data.actions[ event_id ] = arrayremove( self.destructible_data.actions[ event_id ], entry );
        }
    }
}

// Namespace destructible
// Params 0, eflags: 0x4
// Checksum 0x710d52db, Offset: 0x111a
// Size: 0xd
function private set_enabled()
{
    self.enabled = 1;
}

// Namespace destructible
// Params 0, eflags: 0x4
// Checksum 0xe09d32af, Offset: 0x112f
// Size: 0xb
function private is_enabled()
{
    return self.enabled;
}

// Namespace destructible
// Params 1
// Checksum 0xecacb10d, Offset: 0x1143
// Size: 0x127
function hide_destructibles( b_hide = 1 )
{
    foreach ( entry in level.destructibles.instances )
    {
        foreach ( instance in entry )
        {
            if ( !instance is_enabled() )
            {
                continue;
            }
            
            if ( b_hide )
            {
                instance setscriptablepartstate( "body", "hidden" );
                continue;
            }
            
            instance unhide();
        }
    }
}

// Namespace destructible
// Params 1
// Checksum 0xcdea5098, Offset: 0x1272
// Size: 0x1b
function waittill_ready( destructible_name )
{
    utility::flag_wait( destructible_name + "_destructible_ready" );
}

// Namespace destructible
// Params 0
// Checksum 0xb9978ee1, Offset: 0x1295
// Size: 0x26, Type: bool
function is_destroyed()
{
    return self getscriptablepartstate( "body" ) == "destruction" || self getscriptablepartstate( "body" ) == "destroyed";
}

// Namespace destructible
// Params 0
// Checksum 0x186eeb58, Offset: 0x12c4
// Size: 0x12, Type: bool
function is_hidden()
{
    return self getscriptablepartstate( "body" ) == "hidden";
}

// Namespace destructible
// Params 0
// Checksum 0x89f56e00, Offset: 0x12df
// Size: 0x12
function destroy()
{
    self setscriptablepartstate( "body", "destruction" );
}

// Namespace destructible
// Params 0
// Checksum 0xbd71bfdd, Offset: 0x12f9
// Size: 0x12
function spawn()
{
    self setscriptablepartstate( "body", "spawn" );
}

// Namespace destructible
// Params 0
// Checksum 0x91b59d4b, Offset: 0x1313
// Size: 0x12
function hide()
{
    self setscriptablepartstate( "body", "hidden" );
}

// Namespace destructible
// Params 0
// Checksum 0x8b28e2ff, Offset: 0x132d
// Size: 0x12
function unhide()
{
    self setscriptablepartstate( "body", "healthy" );
}

/#

    // Namespace destructible
    // Params 0, eflags: 0x4
    // Checksum 0xcc04d243, Offset: 0x1347
    // Size: 0x1d7, Type: dev
    function private init_dev_commands()
    {
        destructible_entries = level.destructibles.data;
        
        for ( i = 0; i < destructible_entries.size ; i++ )
        {
            destructible_entry = destructible_entries[ i ];
            name = isdefined( destructible_entry.groupid ) ? getxhashsourcename( destructible_entry.groupid ) : destructible_entry.destructibles[ 0 ].scriptable;
            devgui::function_9082edeb5db93280( "<dev string:x73>" + name + "<dev string:x88>" );
            devgui::function_cd4e263c1f3018ae( "<dev string:x8a>", "<dev string:x93>" + "<dev string:x9c>" + i, &function_5fd23496b9d5ea89, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x9e>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + destructible_entry.spawnpercent, &function_ec9b238e4c871e33, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:xc8>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + "<dev string:xdc>", &function_ec9b238e4c871e33, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:xe0>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + "<dev string:xf3>", &function_ec9b238e4c871e33, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:xf6>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + "<dev string:x109>", &function_ec9b238e4c871e33, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x10c>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + "<dev string:x11f>", &function_ec9b238e4c871e33, 0 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x122>", "<dev string:xb9>" + "<dev string:x9c>" + i + "<dev string:x9c>" + "<dev string:x134>", &function_ec9b238e4c871e33, 0 );
            devgui::function_77df7fe7dd273e10();
        }
    }

    // Namespace destructible
    // Params 1, eflags: 0x4
    // Checksum 0xb9091bba, Offset: 0x1526
    // Size: 0x4b, Type: dev
    function private function_5fd23496b9d5ea89( params )
    {
        id = int( params[ 0 ] );
        destructible_entry = level.destructibles.data[ id ];
        thread function_1f07fb9541786459( destructible_entry );
    }

    // Namespace destructible
    // Params 1, eflags: 0x4
    // Checksum 0x29870f7b, Offset: 0x1579
    // Size: 0x62, Type: dev
    function private function_ec9b238e4c871e33( params )
    {
        id = int( params[ 0 ] );
        spawn_percent = int( params[ 1 ] );
        destructible_entry = level.destructibles.data[ id ];
        destructible_entry.spawnpercent = spawn_percent;
    }

#/
