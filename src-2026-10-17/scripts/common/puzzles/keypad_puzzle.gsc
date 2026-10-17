#using scripts\common\scripted_widgets;
#using scripts\common\system;
#using scripts\common\ui;
#using scripts\common\utility;
#using scripts\common\values;

#namespace keypad_puzzle;

// Namespace keypad_puzzle
// Params 0, eflags: 0x5
// Checksum 0x504bb94a, Offset: 0x407
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"keypad_puzzle", undefined, undefined, &init_keypad );
}

// Namespace keypad_puzzle
// Params 0
// Checksum 0x702f00f3, Offset: 0x428
// Size: 0x283
function init_keypad()
{
    var_7237854e3be197ca = level.keypad_puzzles;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    level.keypad_puzzles = spawnstruct();
    ui::lui_registercallback( "keypad_puzzle_success", &keypad_success );
    ui::lui_registercallback( "keypad_puzzle_fail", &keypad_fail );
    ui::lui_registercallback( "keypad_puzzle_closed", &keypad_close );
    keypads = getentarray( "script_model_puzzle_keypad", #classname );
    
    foreach ( keypad in keypads )
    {
        difficulty = 1;
        
        if ( isdefined( keypad.var_8abddc2766670136 ) )
        {
            switch ( keypad.var_8abddc2766670136 )
            {
                case #"hash_22ce4003c1e5227b":
                    difficulty = 0;
                    break;
                case #"hash_c71b112fe04823d6":
                    difficulty = 1;
                    break;
                case #"hash_cc9157548a55043c":
                    difficulty = 2;
                    break;
                case #"hash_af69c25c0104f7a0":
                    difficulty = 3;
                    break;
            }
        }
        
        if ( keypad.script_keypad_seed > 0 )
        {
            keypad setup_keypad( keypad.var_f5461f8f5ca3a499, keypad.var_854ac2577ee91cfc, difficulty, keypad.var_bf22e9f23d070203, keypad.var_fcf795765d070cfd, 1, undefined, undefined, undefined, keypad.script_keypad_seed, keypad.var_fb0a254fa361dbe3, keypad.script_keypad_widget, keypad.script_keypad_param, keypad.var_9c0c82e80f12367b, keypad.var_d89a88f6132e2997, keypad.var_f032fe045730e152, keypad.var_a7f5c3cad8a6f870 );
            continue;
        }
        
        keypad setup_keypad( keypad.var_f5461f8f5ca3a499, keypad.var_854ac2577ee91cfc, difficulty, keypad.var_bf22e9f23d070203, keypad.var_fcf795765d070cfd, 1, undefined, undefined, undefined, undefined, undefined, keypad.script_keypad_widget, keypad.script_keypad_param, keypad.var_9c0c82e80f12367b, keypad.var_d89a88f6132e2997, keypad.var_f032fe045730e152, keypad.var_a7f5c3cad8a6f870 );
    }
}

// Namespace keypad_puzzle
// Params 2, eflags: 0x4
// Checksum 0x5e965d00, Offset: 0x6b3
// Size: 0x84
function private function_18b5273ec6ae0548( allow_exit = 1, blacklight_usable = 1 )
{
    helper_prompts = [];
    helper_prompts[ "prompt_select" ] = &"scripted_widget_common/select_mouse_left_prompt";
    
    if ( blacklight_usable )
    {
        helper_prompts[ "prompt_blacklight_toggle" ] = &"keypad_puzzle/blacklight_toggle_button";
        helper_prompts[ "prompt_blacklight_movement" ] = &"keypad_puzzle/blacklight_movement_button";
    }
    
    if ( allow_exit )
    {
        helper_prompts[ "prompt_exit" ] = &"scripted_widget_common/cancel_activate_prompt";
    }
    
    return helper_prompts;
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x20b795df, Offset: 0x740
// Size: 0x22
function function_49306d34679844ff( func )
{
    level.keypad_puzzles.var_746578a7e7de83be = func;
}

// Namespace keypad_puzzle
// Params 0
// Checksum 0x3709135c, Offset: 0x76a
// Size: 0x15
function function_9af217f0370576d()
{
    level.keypad_puzzles.var_746578a7e7de83be = undefined;
}

// Namespace keypad_puzzle
// Params 17
// Checksum 0x734b0dd0, Offset: 0x787
// Size: 0x24c
function setup_keypad( digits, chances, difficulty, var_abe82846b03761fe, allow_exit, make_usable, success_callback, fail_callback, exit_callback, seed, seed_is_solution, widget, param, blacklight_usable = 1, always_fail = 0, blacklight_on = 0, var_e0aa17561464f56f )
{
    self.keypad_puzzle = spawnstruct();
    self.keypad_puzzle.digits = digits ?? 4;
    self.keypad_puzzle.chances = chances ?? 4;
    self.keypad_puzzle.difficulty = difficulty ?? 0;
    self.keypad_puzzle.var_abe82846b03761fe = istrue( var_abe82846b03761fe );
    self.keypad_puzzle.allow_exit = istrue( allow_exit );
    self.keypad_puzzle.blacklight_usable = istrue( blacklight_usable );
    self.keypad_puzzle.blacklight_on = istrue( blacklight_on );
    self.keypad_puzzle.always_fail = istrue( always_fail );
    self.keypad_puzzle.success_callback = success_callback;
    self.keypad_puzzle.fail_callback = fail_callback;
    self.keypad_puzzle.exit_callback = exit_callback;
    self.keypad_puzzle.seed = seed ?? randomint( 22 );
    self.keypad_puzzle.seed_is_solution = istrue( seed_is_solution );
    self.keypad_puzzle.widget = widget;
    self.keypad_puzzle.param = param;
    self.keypad_puzzle.var_e0aa17561464f56f = var_e0aa17561464f56f;
    
    if ( make_usable )
    {
        thread activate_keypad( self );
    }
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x56ec407d, Offset: 0x9db
// Size: 0x45e
function use_keypad( keypad )
{
    if ( !val::get( "allow_keypad_puzzle" ) || isdefined( level.keypad_puzzles.var_746578a7e7de83be ) && !self [[ level.keypad_puzzles.var_746578a7e7de83be ]]( keypad ) )
    {
        return;
    }
    
    if ( getstealthdetectstate() == "spotted" )
    {
        if ( getlocstringindex( &"hash_2371fe8ab76169b9" ) != 0 )
        {
            utility::callsharedfunc( #"hint", #"add_simple", "keypad_spotted_not_usable", &"hash_2371fe8ab76169b9", 3 );
        }
        
        return;
    }
    
    self notify( #"activated_keypad" );
    
    if ( utility::callsharedfunc( #"hint", #"exists", "keypad_hint" ) )
    {
        utility::callsharedfunc( #"hint", #"add_wait", "keypad_hint", undefined, undefined, "keypad_hint_close", undefined, undefined, 0 );
    }
    
    scripted_widgets::create( "keypad_puzzle", keypad.keypad_puzzle.widget ?? scripted_widgets::function_652736891a41e948( "scripted_widget_keypad_puzzle" ) );
    scripted_widgets::set_position( "keypad_puzzle", 0, 0, 3, 3 );
    allow_exit = keypad.keypad_puzzle.allow_exit;
    blacklight_usable = keypad.keypad_puzzle.blacklight_usable;
    blacklight_on = keypad.keypad_puzzle.blacklight_on || level.player.blacklight.ison;
    fields = [];
    fields[ "chances" ] = keypad.keypad_puzzle.chances;
    fields[ "difficulty" ] = keypad.keypad_puzzle.difficulty;
    fields[ "reset_on_fail" ] = keypad.keypad_puzzle.var_abe82846b03761fe;
    fields[ "allow_exit" ] = allow_exit;
    fields[ "blacklight_usable" ] = blacklight_usable;
    fields[ "blacklight_on" ] = blacklight_on;
    fields[ "always_fail" ] = keypad.keypad_puzzle.always_fail;
    fields[ "seed" ] = keypad.keypad_puzzle.seed;
    fields[ "seed_is_solution" ] = keypad.keypad_puzzle.seed_is_solution;
    scripted_widgets::function_dd7a63eea5bde0dc( "keypad_puzzle", fields, 1 );
    self setclientomnvar( "ui_scripted_widget_keypad_num_digits", keypad.keypad_puzzle.digits );
    
    if ( isdefined( keypad.keypad_puzzle.param ) )
    {
        scripted_widgets::set_param( "keypad_puzzle", keypad.keypad_puzzle.param );
    }
    
    val::set( "keypad_puzzle", "allow_movement", 0 );
    val::set( "keypad_puzzle", "freezecontrols_allowlook", 1 );
    val::set( "keypad_puzzle", "show_hud", 0 );
    val::set( "keypad_puzzle", "hide_viewmodel", 1 );
    val::set( "keypad_puzzle", "usability", 0 );
    val::set_array( "keypad_puzzle", [ "allow_equipment_wheel", "allow_spy_cam", "allow_interactive_map", "allow_lockpick", "allow_keypad_puzzle", "allow_frequency_puzzle", "allow_cipher_puzzle", "allow_skill_select", "allow_reward_select", "allow_connection_puzzle" ], 0 );
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"add_array" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"add_array", "keypad_puzzle", function_18b5273ec6ae0548( allow_exit, blacklight_usable ), allow_exit || blacklight_usable );
    }
    
    if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"set_position" ) )
    {
        utility::callsharedfunc( #"helper_bar_prompts", #"set_position", 0, -30, 1, 2 );
    }
    
    self enablephysicaldepthoffieldscripting( 3 );
    self setphysicaldepthoffield( 1, 0, 10 );
    self.current_keypad = keypad;
    thread function_bdb95973daf68a0();
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x2ee04df1, Offset: 0xe41
// Size: 0x28
function reset_keypad( keypad )
{
    keypad.keypad_puzzle.seed = randomint( 22 );
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x89e87c55, Offset: 0xe71
// Size: 0x93
function activate_keypad( keypad )
{
    keypad endon( #"death_or_disconnect" );
    keypad endon( #"entitydeleted" );
    keypad endon( #"deactivate_keypad" );
    keypad.var_3de5f173c0cfbb1e = 1;
    keypad utility::callsharedfunc( #"cursor_hint", #"create", undefined, undefined, &"keypad_puzzle/keypad" );
    
    while ( true )
    {
        keypad waittill( #"trigger", player );
        player use_keypad( keypad );
    }
}

// Namespace keypad_puzzle
// Params 0, eflags: 0xc
// Checksum 0x71e78747, Offset: 0xf0c
// Size: 0x46
function private function_bdb95973daf68a0()
{
    self notify( #"hash_ff79fb9fcfb0cb95" );
    self endon( #"hash_ff79fb9fcfb0cb95" );
    self.current_keypad endon( #"keypad_puzzle_closed" );
    utility::waittill_any( "death_or_disconnect", "last_stand_enter" );
    thread keypad_close();
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x79d009bb, Offset: 0xf5a
// Size: 0x34
function deactivate_keypad( keypad )
{
    keypad notify( #"deactivate_keypad" );
    keypad utility::callsharedfunc( #"cursor_hint", #"remove" );
}

// Namespace keypad_puzzle
// Params 1
// Checksum 0x89634597, Offset: 0xf96
// Size: 0x123
function keypad_close( val )
{
    if ( isdefined( self.current_keypad ) )
    {
        if ( isdefined( self.current_keypad.var_8d5c209cc963c2e1 ) )
        {
            self.current_keypad notify( self.current_keypad.var_8d5c209cc963c2e1, self );
        }
        
        if ( utility::issharedfuncdefined( #"helper_bar_prompts", #"remove_group" ) )
        {
            utility::callsharedfunc( #"helper_bar_prompts", #"remove_group", "keypad_puzzle" );
        }
        
        if ( isdefined( self.current_keypad.keypad_puzzle.exit_callback ) )
        {
            self.current_keypad thread [[ self.current_keypad.keypad_puzzle.exit_callback ]]( self );
        }
        
        if ( isplayer( self ) )
        {
            scripted_widgets::destroy( "keypad_puzzle" );
            val::reset_all( "keypad_puzzle" );
            self disablephysicaldepthoffieldscripting();
        }
        
        level notify( #"keypad_puzzle_closed" );
        self.current_keypad notify( #"keypad_puzzle_closed" );
        self.current_keypad = undefined;
    }
}

// Namespace keypad_puzzle
// Params 0
// Checksum 0x7bb68bda, Offset: 0x10c1
// Size: 0xd
function is_active()
{
    return scripted_widgets::is_active( "keypad_puzzle" );
}

// Namespace keypad_puzzle
// Params 1, eflags: 0x4
// Checksum 0x8b342ca6, Offset: 0x10d7
// Size: 0x21b
function private keypad_success( val )
{
    self endon( #"death_or_disconnect" );
    
    if ( isdefined( self.current_keypad ) )
    {
        if ( isdefined( self.current_keypad.var_95920e561b32eca ) )
        {
            self.current_keypad notify( self.current_keypad.var_95920e561b32eca, self );
        }
        
        if ( isdefined( self.current_keypad.target ) )
        {
            targ_ents = getentarray( self.current_keypad.target, #targetname );
            
            foreach ( targ_ent in targ_ents )
            {
                if ( isdefined( targ_ent ) && targ_ent.script_noteworthy == "interactive_door" && isdefined( level.interactive_doors.fnunlockdoor ) )
                {
                    targ_ent [[ level.interactive_doors.fnunlockdoor ]]();
                    
                    if ( isdefined( self.keypad_puzzle.var_e0aa17561464f56f ) )
                    {
                        targ_ent thread utility::playsoundonentity( self.keypad_puzzle.var_e0aa17561464f56f );
                    }
                }
            }
        }
        
        self.current_keypad notify( #"keypad_puzzle_success" );
        
        if ( isdefined( self.current_keypad.keypad_puzzle.success_callback ) )
        {
            self.current_keypad thread [[ self.current_keypad.keypad_puzzle.success_callback ]]( self );
        }
    }
    
    level notify( #"keypad_puzzle_success", self );
    wait 0.25;
    
    if ( isdefined( self.current_keypad ) )
    {
        deactivate_keypad( self.current_keypad );
        keypad_close( val );
    }
}

// Namespace keypad_puzzle
// Params 1, eflags: 0x4
// Checksum 0xde8fe384, Offset: 0x12fa
// Size: 0xfb
function private keypad_fail( val )
{
    if ( isdefined( self.current_keypad ) )
    {
        if ( isdefined( self.current_keypad.var_9c98b9d902c8186d ) )
        {
            self.current_keypad notify( self.current_keypad.var_9c98b9d902c8186d, self );
        }
        
        if ( self.current_keypad.keypad_puzzle.var_abe82846b03761fe )
        {
            self.current_keypad.keypad_puzzle.seed = val;
        }
        
        self.current_keypad notify( #"keypad_puzzle_fail" );
        
        if ( isdefined( self.current_keypad.keypad_puzzle.fail_callback ) )
        {
            self.current_keypad thread [[ self.current_keypad.keypad_puzzle.fail_callback ]]( self );
        }
    }
    
    level notify( #"keypad_puzzle_fail", self );
}

