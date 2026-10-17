#using scripts\common\scripted_widgets;
#using scripts\common\system;
#using scripts\common\ui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\widgets_visibility;

#namespace lockpick;

// Namespace lockpick
// Params 0, eflags: 0x5
// Checksum 0x16a8958d, Offset: 0x3bb
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"lockpick", undefined, &lockpick_init, undefined );
}

// Namespace lockpick
// Params 0, eflags: 0x4
// Checksum 0x222d02e9, Offset: 0x3dc
// Size: 0x73
function private lockpick_init()
{
    ui::lui_registercallback( "lockpick_unlocked", &lockpick_unlocked );
    ui::lui_registercallback( "lockpick_closed", &lockpick_closed );
    level.lockpicking = spawnstruct();
    level.lockpicking.var_cc8d2991c138d9da = &function_7c88d0b38d7ab4f4;
    level.lockpicking.control_type = 1;
    
    /#
        setdevdvarifuninitialized( @"lockpick_control_type", -1 );
    #/
}

// Namespace lockpick
// Params 1, eflags: 0x4
// Checksum 0x4dca1859, Offset: 0x457
// Size: 0x4b
function private function_18b5273ec6ae0548( allow_exit = 1 )
{
    helper_prompts = [];
    helper_prompts[ "prompt_control" ] = &"LOCKPICK/PICK_CONTROL";
    
    if ( allow_exit )
    {
        helper_prompts[ "prompt_exit" ] = &"scripted_widget_common/cancel_activate_prompt";
    }
    
    return helper_prompts;
}

// Namespace lockpick
// Params 1
// Checksum 0x4ea2e215, Offset: 0x4ab
// Size: 0x264
function function_7c88d0b38d7ab4f4( params )
{
    params = strtok( params, " " );
    lockpick_struct = {};
    self.lockpick = spawnstruct();
    self.lockpick.pins = 3;
    self.lockpick.difficulty = 1;
    self.lockpick.allow_close = 1;
    self.lockpick.enable_callback = &function_6005c5654adcdbad;
    self.lockpick.disable_callback = &function_e63772fed94d1286;
    
    foreach ( param in params )
    {
        if ( isstartstr( param, "lockpick" ) )
        {
            kvp = strtok( param, ":" );
            
            if ( kvp.size == 2 )
            {
                switch ( kvp[ 0 ] )
                {
                    case #"hash_d37c9212baf19360":
                        self.lockpick.pins = int( kvp[ 1 ] );
                        break;
                    case #"hash_77ab53744e1b8275":
                        if ( kvp[ 1 ] == "easy" )
                        {
                            self.lockpick.difficulty = 0;
                        }
                        else if ( kvp[ 1 ] == "medium" )
                        {
                            self.lockpick.difficulty = 1;
                        }
                        else if ( kvp[ 1 ] == "hard" )
                        {
                            self.lockpick.difficulty = 2;
                        }
                        else if ( kvp[ 1 ] == "veryhard" )
                        {
                            self.lockpick.difficulty = 3;
                        }
                        
                        break;
                    case #"hash_f492ed4acdf8da83":
                        self.lockpick.allow_close = kvp[ 1 ] != "0";
                        break;
                    case #"hash_a8e1f0acdeca55a5":
                        self.lockpick.param = kvp[ 1 ];
                        break;
                }
            }
        }
    }
}

// Namespace lockpick
// Params 0
// Checksum 0xd842d5f7, Offset: 0x717
// Size: 0xf9
function function_6005c5654adcdbad()
{
    self notify( #"hash_62d32f8f500699b2" );
    self endon( #"hash_62d32f8f500699b2" );
    self endon( #"entitydeleted" );
    self endon( #"lockpick_disabled" );
    self.lockpick.update_cursor_hint_callback = &function_bc12c16f8b01017e;
    self.open_struct.var_3de5f173c0cfbb1e = 1;
    self notify( #"hash_8d9c05eb098dfdbf" );
    
    while ( true )
    {
        self waittill( #"trigger" );
        
        if ( !self.isbashing && self.locked && isdefined( self.lockpick ) )
        {
            level.player thread lockpick_open( self.lockpick.pins, self.lockpick.difficulty, self.lockpick.allow_close, self, &function_19b73bcdbcf1890a );
        }
    }
}

// Namespace lockpick
// Params 1
// Checksum 0xa688c476, Offset: 0x818
// Size: 0x17
function function_19b73bcdbcf1890a( lock_target )
{
    lock_target.lockpick = undefined;
}

// Namespace lockpick
// Params 0
// Checksum 0x5d77278c, Offset: 0x837
// Size: 0x21
function function_e63772fed94d1286()
{
    self notify( #"lockpick_disabled" );
    self.lockpick.update_cursor_hint_callback = undefined;
}

// Namespace lockpick
// Params 0
// Checksum 0x980ca2a5, Offset: 0x860
// Size: 0x17a
function function_bc12c16f8b01017e()
{
    last_hint_string = self.door.lockpick.hint_string;
    last_hint_icon = self.door.lockpick.hint_icon;
    self.door.lockpick.hint_string = &"lockpick/cursor_hint";
    self.door.lockpick.hint_icon = "hud_icon_objective_lock";
    self.cursor_hint_ent setusewhenhandsoccupied( 0 );
    self.cursor_hint_ent setusewhenhandsoccupied( 1 );
    self.door.lockpick.hint_icon = "ui_shared_transparent";
    
    if ( last_hint_string != self.door.lockpick.hint_string )
    {
        self.cursor_hint_ent sethintstring( self.door.lockpick.hint_string );
    }
    
    if ( last_hint_icon != self.door.lockpick.hint_icon )
    {
        self.cursor_hint_ent sethinticon( self.door.lockpick.hint_icon );
    }
}

// Namespace lockpick
// Params 1
// Checksum 0x260b817b, Offset: 0x9e2
// Size: 0x22
function function_6b34017dceb51514( func )
{
    level.lockpicking.var_746578a7e7de83be = func;
}

// Namespace lockpick
// Params 0
// Checksum 0xf6620ebc, Offset: 0xa0c
// Size: 0x15
function function_88ca4ed267b1102e()
{
    level.lockpicking.var_746578a7e7de83be = undefined;
}

// Namespace lockpick
// Params 8
// Checksum 0x4f8072d0, Offset: 0xa29
// Size: 0xea
function lockpick_create( pins, difficulty, allow_close, link_tag, unlocked_callback, close_callback, display_dist, use_dist )
{
    self endon( #"death" );
    self endon( #"entitydeleted" );
    self endon( #"hint_destroyed" );
    
    if ( isdefined( self.cursor_hint_ent ) )
    {
        return;
    }
    
    self.var_3de5f173c0cfbb1e = 1;
    self.var_127a8e3076527ea9 = 1;
    hint_ent = self;
    
    if ( isdefined( self.cursor_hint_ent ) )
    {
        hint_ent = self.cursor_hint_ent;
    }
    
    while ( isdefined( hint_ent ) )
    {
        hint_ent waittill( #"trigger", player );
        player thread lockpick_open( pins, difficulty, allow_close, self, unlocked_callback, close_callback );
    }
}

// Namespace lockpick
// Params 0
// Checksum 0xda19370f, Offset: 0xb1b
// Size: 0xc
function lockpick_remove()
{
    self.var_127a8e3076527ea9 = undefined;
}

// Namespace lockpick
// Params 1
// Checksum 0xa3c69319, Offset: 0xb2f
// Size: 0x69
function function_73b536e01081758f( bool_should_hide = 1 )
{
    var_abe2f8570b0604e = "Hide";
    
    if ( !bool_should_hide )
    {
        var_abe2f8570b0604e = "Show";
    }
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"set_state" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"set_state", var_abe2f8570b0604e );
    }
}

// Namespace lockpick
// Params 8
// Checksum 0x4198e113, Offset: 0xba0
// Size: 0x3e9
function lockpick_open( pins, difficulty, allow_close, lock_target, unlocked_callback, close_callback, hide_controls, no_dof )
{
    assert( pins > 0 && pins <= 5 );
    assert( difficulty >= 0 && difficulty <= 3 );
    
    if ( !val::get( "allow_lockpick" ) )
    {
        return;
    }
    
    if ( isdefined( level.lockpicking.var_746578a7e7de83be ) && !self [[ level.lockpicking.var_746578a7e7de83be ]]( lock_target ) )
    {
        return;
    }
    
    if ( utility::callsharedfunc( #"hint", #"exists", "lockpick_hint" ) )
    {
        utility::callsharedfunc( #"hint", #"add_wait", "lockpick_hint", undefined, undefined, "lockpick_hint_close", undefined, undefined, 0 );
    }
    
    val::set_array( "allow_lockpick", [ "allow_equipment_wheel", "allow_spy_cam", "allow_interactive_map", "allow_lockpick", "allow_keypad_puzzle", "allow_frequency_puzzle", "allow_cipher_puzzle", "allow_skill_select", "allow_reward_select", "allow_connection_puzzle" ], 0 );
    val::set( "allow_lockpick", "weapon", 0 );
    scripted_widgets::create( "lockpick", "scripted_widget_lockpick" );
    scripted_widgets::set_position( "lockpick", 0, 0, 1, 1 );
    
    if ( !isdefined( hide_controls ) )
    {
        hide_controls = 0;
    }
    
    function_73b536e01081758f( hide_controls );
    
    if ( !isdefined( self.lockpick ) )
    {
        self.lockpick = spawnstruct();
    }
    
    if ( isdefined( lock_target.lockpick.param ) )
    {
        level.player lockpick_set_param( lock_target.lockpick.param );
    }
    
    self.lockpick.lock_target = lock_target;
    self.lockpick.unlocked_callback = unlocked_callback;
    self.lockpick.close_callback = close_callback;
    self.lockpick.no_dof = no_dof;
    control_type = level.lockpicking.control_type;
    
    /#
        dvar_control_type = getdvarint( @"lockpick_control_type" );
        
        if ( dvar_control_type > 0 && dvar_control_type < 2 )
        {
            control_type = dvar_control_type;
        }
    #/
    
    fields = [];
    fields[ "difficulty" ] = difficulty;
    fields[ "pins" ] = pins;
    fields[ "allow_exit" ] = allow_close;
    fields[ "control_type" ] = control_type;
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"add_array" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"add_array", "lockpick", function_18b5273ec6ae0548( allow_close ), 1 );
    }
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"set_position" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"set_position", -333, -200 );
    }
    
    scripted_widgets::function_dd7a63eea5bde0dc( "lockpick", fields, 1 );
    widgets_visibility::hide( "lockpick", "Lockpicking", 1, 1 );
    val::set( "allow_lockpick", "allow_movement", 0 );
    val::set( "allow_lockpick", "freezecontrols_allowlook", 1 );
    val::set( "allow_lockpick", "cg_drawcrosshair", 0 );
    val::set( "allow_lockpick", "usability", 0 );
    
    if ( !no_dof )
    {
        self enablephysicaldepthoffieldscripting( 3 );
        self setphysicaldepthoffield( 1, 0, 10 );
    }
    
    thread lockpick_close_on_death();
}

// Namespace lockpick
// Params 1
// Checksum 0x52cad133, Offset: 0xf91
// Size: 0x20
function lockpick_set_param( param )
{
    if ( isdefined( param ) )
    {
        scripted_widgets::set_param( "lockpick", param );
    }
}

// Namespace lockpick
// Params 1
// Checksum 0x915f0390, Offset: 0xfb9
// Size: 0x8f
function lockpick_close( delay )
{
    scripted_widgets::destroy( "lockpick" );
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"remove_group" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"remove_group", "lockpick" );
    }
    
    if ( isdefined( delay ) )
    {
        wait delay;
    }
    
    widgets_visibility::reset( "lockpick" );
    val::reset_all( "allow_lockpick" );
    
    if ( !self.lockpick.no_dof )
    {
        self disablephysicaldepthoffieldscripting();
    }
}

// Namespace lockpick
// Params 2
// Checksum 0x8ea3f98b, Offset: 0x1050
// Size: 0x7e
function lockpick_reset( delay = 0.2, jostle = 0 )
{
    if ( scripted_widgets::is_active( "lockpick" ) )
    {
        if ( jostle )
        {
            scripted_widgets::set_state( "lockpick", "JostleReset" );
        }
        else
        {
            scripted_widgets::set_state( "lockpick", "Reset" );
        }
        
        wait max( delay, 0.2 );
        scripted_widgets::set_state( "lockpick", "Default" );
    }
}

// Namespace lockpick
// Params 0
// Checksum 0x68d1736, Offset: 0x10d6
// Size: 0x1d, Type: bool
function is_lockpicking()
{
    return level utility::flag( "scripted_widgets_initialized" ) && scripted_widgets::is_active( "lockpick" );
}

// Namespace lockpick
// Params 1
// Checksum 0x42dd2c7f, Offset: 0x10fc
// Size: 0x37
function function_933f801e9442bb5e( control_type )
{
    assert( control_type >= 0 && control_type < 2 );
    level.lockpicking.control_type = control_type;
}

// Namespace lockpick
// Params 0, eflags: 0x4
// Checksum 0xf9ff909, Offset: 0x113b
// Size: 0x24
function private lockpick_close_on_death()
{
    self endon( "scripted_widget_destroyed_" + "lockpick" );
    self waittill( #"death" );
    thread lockpick_close();
}

// Namespace lockpick
// Params 1, eflags: 0x4
// Checksum 0x9038e335, Offset: 0x1167
// Size: 0xf9
function private lockpick_unlocked( val )
{
    self notify( #"unlocked" );
    
    if ( isdefined( self.lockpick.lock_target ) )
    {
        self.lockpick.lock_target notify( #"unlocked" );
    }
    
    if ( isdefined( self.lockpick.unlocked_callback ) )
    {
        self thread [[ self.lockpick.unlocked_callback ]]( self.lockpick.lock_target );
    }
    
    if ( isdefined( self.lockpick ) && isdefined( self.lockpick.lock_target ) && self.lockpick.lock_target.var_127a8e3076527ea9 )
    {
        self.lockpick.lock_target lockpick_remove();
    }
    
    lockpick_close( 0.5 );
}

// Namespace lockpick
// Params 1, eflags: 0x4
// Checksum 0x925f97a7, Offset: 0x1268
// Size: 0x95
function private lockpick_closed( val )
{
    self notify( #"lockpick_closed" );
    
    if ( isdefined( self.lockpick.lock_target ) )
    {
        self.lockpick.lock_target notify( #"lockpick_closed" );
    }
    
    if ( isdefined( self.lockpick.close_callback ) )
    {
        self thread [[ self.lockpick.close_callback ]]( self.lockpick.lock_target );
    }
    
    lockpick_close();
}

