#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\mp\content_manager;
#using scripts\mp\doorbuy;
#using scripts\mp\interaction;

#namespace electric_power_switch;

// Namespace electric_power_switch
// Params 0
// Checksum 0x736f8acc, Offset: 0x1a5
// Size: 0xa
function init_electric_power_switch()
{
    level thread function_4d81bf7f9da07a8();
}

// Namespace electric_power_switch
// Params 0, eflags: 0x4
// Checksum 0xf700fb8e, Offset: 0x1b7
// Size: 0x9a
function private function_4d81bf7f9da07a8()
{
    content_manager::register_script( "electric_power_switch", &on_spawn_power );
    level.electric_power_switches = [];
    utility::flag_init( "electric_power_switch_init_complete" );
    mapdestinations = utility::getstructarray( "content_destination", "variantname" );
    
    if ( isdefined( mapdestinations ) && mapdestinations.size > 0 )
    {
        level.var_84ff4b746ce65cd4 = function_5e0adddca3ff112e( mapdestinations[ 0 ] );
        level thread spawn_destination( mapdestinations[ 0 ] );
    }
    else
    {
        return;
    }
    
    if ( level.var_84ff4b746ce65cd4 == 0 )
    {
        utility::flag_set( "electric_power_switch_init_complete" );
    }
    
    /#
        level thread setup_electric_power_switch_devgui();
    #/
}

// Namespace electric_power_switch
// Params 1, eflags: 0x4
// Checksum 0x6cfbfa3b, Offset: 0x259
// Size: 0x147
function private function_5e0adddca3ff112e( destination )
{
    count = 0;
    
    foreach ( location in destination.locations )
    {
        location_instance = location.instances[ "electric_power_switch" ];
        
        if ( isdefined( location_instance ) )
        {
            foreach ( instance in location_instance.versions )
            {
                switch_structs = instance.contentgroups[ "elec_switch_trigger" ];
                
                if ( isarray( switch_structs ) )
                {
                    count += switch_structs.size;
                }
            }
        }
    }
    
    return count;
}

// Namespace electric_power_switch
// Params 0
// Checksum 0x8c4b5073, Offset: 0x3a9
// Size: 0x1c
function function_dec0a4e06ef0b6b2()
{
    if ( !isdefined( level.electric_power_switches ) )
    {
        return 0;
    }
    
    return level.electric_power_switches.size;
}

// Namespace electric_power_switch
// Params 1
// Checksum 0x34aa77d1, Offset: 0x3ce
// Size: 0x118
function spawn_destination( destination )
{
    foreach ( location in destination.locations )
    {
        location_instance = location.instances[ "electric_power_switch" ];
        
        if ( isdefined( location_instance ) )
        {
            foreach ( instance in location_instance.versions )
            {
                content_manager::spawn_instance( instance );
            }
        }
    }
}

// Namespace electric_power_switch
// Params 1, eflags: 0x4
// Checksum 0x245a48b1, Offset: 0x4ee
// Size: 0x1f
function private on_spawn_power( instance )
{
    instance spawn_switches();
    instance set_lights_state( 0 );
}

/#

    // Namespace electric_power_switch
    // Params 0
    // Checksum 0xc3583053, Offset: 0x515
    // Size: 0x44, Type: dev
    function setup_electric_power_switch_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x3e>", "<dev string:x4c>", &debug_turn_on_power );
        devgui::add_devgui_func( "<dev string:x60>", "<dev string:x6f>", &function_e2b601cd18848cd1 );
        devgui::function_77df7fe7dd273e10();
    }

#/

// Namespace electric_power_switch
// Params 0
// Checksum 0x8b771c4, Offset: 0x561
// Size: 0xb
function debug_turn_on_power()
{
    function_2d462dbfcc76b0db( 1 );
}

// Namespace electric_power_switch
// Params 0
// Checksum 0xd53b7869, Offset: 0x574
// Size: 0xa
function function_e2b601cd18848cd1()
{
    function_2d462dbfcc76b0db( 0 );
}

// Namespace electric_power_switch
// Params 1
// Checksum 0x21857b0c, Offset: 0x586
// Size: 0x142
function function_2d462dbfcc76b0db( state )
{
    switch_structs = utility::getstructarray( "elec_switch_trigger", "targetname" );
    
    if ( isarray( switch_structs ) )
    {
        foreach ( ss in switch_structs )
        {
            if ( !isdefined( ss.interact ) )
            {
                continue;
            }
            
            if ( ss.interact.b_power_on && state )
            {
                continue;
            }
            
            if ( !ss.interact.b_power_on && !state )
            {
                continue;
            }
            
            if ( !isdefined( ss.var_aa7ea4e3d22120df ) || ss.var_aa7ea4e3d22120df )
            {
                iprintlnbold( "POWER CAN ONLY TURN ON ONCE. But we are forcing to turn now!" );
                ss.var_aa7ea4e3d22120df = 0;
            }
            
            ss.interact function_e17b8c37ab7db9f2( level.players[ 0 ] );
        }
    }
}

// Namespace electric_power_switch
// Params 0, eflags: 0x4
// Checksum 0x98b63754, Offset: 0x6d0
// Size: 0x96
function private spawn_switches()
{
    switch_structs = self.contentgroups[ "elec_switch_trigger" ];
    
    if ( isarray( switch_structs ) )
    {
        foreach ( ss in switch_structs )
        {
            ss thread spawn_electric_switch();
        }
    }
}

// Namespace electric_power_switch
// Params 0, eflags: 0x4
// Checksum 0x848d8c80, Offset: 0x76e
// Size: 0xf1
function private spawn_electric_switch()
{
    self.interact = interaction::register_interact( self.origin, self.radius, &function_e17b8c37ab7db9f2, &"shared_hintstrings/electric_switch_off_hint" );
    self.interact.struct = self;
    model_struct = utility::getstruct( self.target2, "targetname" );
    switch_model = model_struct.script_noteworthy ?? "t10_zm_power_switch_handle";
    self.model_switch = content_manager::spawn_script_model( model_struct, switch_model, 1, 1 );
    level.electric_power_switches[ level.electric_power_switches.size ] = self;
    
    if ( level.var_84ff4b746ce65cd4 > 0 )
    {
        level.var_84ff4b746ce65cd4--;
        
        if ( level.var_84ff4b746ce65cd4 == 0 )
        {
            utility::flag_set( "electric_power_switch_init_complete" );
        }
        
        return;
    }
    
    assertmsg( "<dev string:x84>" );
}

// Namespace electric_power_switch
// Params 1
// Checksum 0xea2f27bf, Offset: 0x867
// Size: 0xae
function function_e17b8c37ab7db9f2( player )
{
    var_632cf5e6ec540668 = 1;
    
    if ( isdefined( self.struct.var_aa7ea4e3d22120df ) )
    {
        var_632cf5e6ec540668 = self.struct.var_aa7ea4e3d22120df;
    }
    
    if ( self.struct.var_f0957ca9999a3ac3 )
    {
        level notify( #"hash_79599f9044df4715", player );
        return;
    }
    
    if ( !self.b_power_on )
    {
        turn_power_on( var_632cf5e6ec540668 );
        
        if ( isdefined( self ) )
        {
            self.b_power_on = 1;
        }
        
        return;
    }
    
    if ( !var_632cf5e6ec540668 )
    {
        turn_power_off();
        
        if ( isdefined( self ) )
        {
            self.b_power_on = 0;
        }
    }
}

// Namespace electric_power_switch
// Params 1, eflags: 0x4
// Checksum 0xbd986bc9, Offset: 0x91d
// Size: 0xbb
function private turn_power_on( use_once )
{
    power_zone = self.struct.script_noteworthy;
    power_flag = self.struct.script_flag_set;
    
    if ( !isdefined( power_zone ) )
    {
        level utility::flag_set( power_flag );
    }
    else
    {
        power_flag += power_zone;
        level utility::flag_set( power_flag );
    }
    
    set_power_items( 1, power_zone );
    thread set_switch_state( 1, use_once );
    params = spawnstruct();
    params.on = 1;
    params.flag = power_flag;
    level callback::callback( "power_switch_state_changed", params );
}

// Namespace electric_power_switch
// Params 0, eflags: 0x4
// Checksum 0x835112d8, Offset: 0x9e0
// Size: 0xac
function private turn_power_off()
{
    power_zone = self.struct.script_noteworthy;
    power_flag = self.struct.script_flag_set;
    
    if ( !isdefined( power_zone ) )
    {
        level utility::flag_clear( power_flag );
    }
    else
    {
        power_flag += power_zone;
        level utility::flag_clear( power_flag );
    }
    
    set_power_items( 0, power_zone );
    thread set_switch_state( 0 );
    params = spawnstruct();
    params.on = 0;
    params.flag = power_flag;
    level callback::callback( "power_switch_state_changed", params );
}

// Namespace electric_power_switch
// Params 2
// Checksum 0xbc09b5fb, Offset: 0xa94
// Size: 0x229
function set_switch_state( state, use_once )
{
    /#
        if ( !isdefined( self.struct.model_switch ) )
        {
            return;
        }
    #/
    
    off_rotation = self.struct.switch_bounds.off ?? 30;
    on_rotation = self.struct.switch_bounds.on ?? -90;
    rotation_axis = self.struct.rotation_axis ?? 2;
    model_switch = self.struct.model_switch;
    
    if ( rotation_axis == 2 )
    {
        model_angles = ( model_switch.angles[ 0 ], model_switch.angles[ 1 ], off_rotation );
        
        if ( state )
        {
            model_angles = ( model_switch.angles[ 0 ], model_switch.angles[ 1 ], on_rotation );
        }
    }
    else if ( rotation_axis == 1 )
    {
        model_angles = ( model_switch.angles[ 0 ], off_rotation, model_switch.angles[ 2 ] );
        
        if ( state )
        {
            model_angles = ( model_switch.angles[ 0 ], on_rotation, model_switch.angles[ 2 ] );
        }
    }
    else if ( rotation_axis == 0 )
    {
        model_angles = ( off_rotation, model_switch.angles[ 1 ], model_switch.angles[ 2 ] );
        
        if ( state )
        {
            model_angles = ( on_rotation, model_switch.angles[ 1 ], model_switch.angles[ 2 ] );
        }
    }
    else
    {
        assertmsg( "<dev string:xd0>" );
        return;
    }
    
    model_switch rotateto( model_angles, 0.5 );
    
    if ( use_once )
    {
        self makeunusable();
        model_switch utility::function_7c10ea82c1e305b8( "base", "hide" );
        return;
    }
    
    self makeusable();
    
    if ( state )
    {
        self sethintstring( &"shared_hintstrings/electric_switch_on_hint" );
        return;
    }
    
    self sethintstring( &"shared_hintstrings/electric_switch_off_hint" );
}

// Namespace electric_power_switch
// Params 2
// Checksum 0x84368676, Offset: 0xcc5
// Size: 0x2b
function set_power_items( state, power_zone )
{
    level thread doorbuy::trigger_power( state, power_zone );
    level thread set_lights_state( state, power_zone );
}

// Namespace electric_power_switch
// Params 2
// Checksum 0xfa55f556, Offset: 0xcf8
// Size: 0xec
function set_lights_state( state, power_zone )
{
    lights = getentarray( "electric_power_light", #targetname );
    var_9fff375aea3cfc44 = !isdefined( power_zone );
    
    foreach ( light in lights )
    {
        var_a507e285448e8204 = light.script_noteworthy == power_zone;
        
        if ( !var_a507e285448e8204 && !var_9fff375aea3cfc44 )
        {
            continue;
        }
        
        intensity = 0;
        
        if ( state )
        {
            intensity = 1;
        }
        
        light setlightintensity( intensity );
    }
}

