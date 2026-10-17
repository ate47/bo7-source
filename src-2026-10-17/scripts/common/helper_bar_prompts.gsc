#using scripts\common\scripted_widgets;
#using scripts\common\system;
#using scripts\common\utility;

#namespace helper_bar_prompts;

// Namespace helper_bar_prompts
// Params 0, eflags: 0x5
// Checksum 0x2f3d30c7, Offset: 0x16e
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"helper_prompts", undefined, undefined, &post_main );
}

// Namespace helper_bar_prompts
// Params 0, eflags: 0x4
// Checksum 0x42482ccd, Offset: 0x18f
// Size: 0x9
function private post_main()
{
    thread function_9772463bd96c47ea();
}

// Namespace helper_bar_prompts
// Params 0, eflags: 0x4
// Checksum 0xba272ed3, Offset: 0x1a0
// Size: 0x1cd
function private function_9772463bd96c47ea()
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515", 0 ) != 0 )
        {
            return;
        }
    #/
    
    level utility::flag_wait( "scripted_widgets_initialized" );
    level.var_8df7cb70718a19a8 = scripted_widgets::function_652736891a41e948( "scripted_widget_helper_bar_prompts" );
    assert( isdefined( level.var_8df7cb70718a19a8 ), "<dev string:x24>" + "<dev string:x7e>" + "<dev string:xa1>" );
    level.var_d6dc5011703961f = scripted_widgets::function_652736891a41e948( "scripted_widget_helper_bar_prompt_text" );
    assert( isdefined( level.var_d6dc5011703961f ), "<dev string:xb5>" + "<dev string:x114>" + "<dev string:xa1>" );
    utility::registersharedfunc( #"helper_bar_prompts", #"add", &function_1e3ed50fec84e584 );
    utility::registersharedfunc( #"helper_bar_prompts", #"add_array", &function_dea2e02912453960 );
    utility::registersharedfunc( #"helper_bar_prompts", #"set_position", &prompt_set_position );
    utility::registersharedfunc( #"helper_bar_prompts", #"set_state", &function_e3a29d9137ae2b0a );
    utility::registersharedfunc( #"helper_bar_prompts", #"hash_fd954ad8304a3b48", &function_c6739a4d2c44b28 );
    utility::registersharedfunc( #"helper_bar_prompts", #"set_prompt_string", &function_ab024b1bda02abd2 );
    utility::registersharedfunc( #"helper_bar_prompts", #"show_backing", &prompt_show_backing );
    utility::registersharedfunc( #"helper_bar_prompts", #"remove", &function_8844a64767fa1e46 );
    utility::registersharedfunc( #"helper_bar_prompts", #"remove_group", &function_9831ab25a5bc51dc );
    utility::registersharedfunc( #"helper_bar_prompts", #"clear", &function_159577d25bcbda7 );
    level utility::flag_set( "helper_prompts_initialized" );
}

// Namespace helper_bar_prompts
// Params 0, eflags: 0x4
// Checksum 0xee405099, Offset: 0x375
// Size: 0x69
function private function_2e74c09ac7e4123f()
{
    self.helper_bar_prompts = {};
    self.helper_bar_prompts.var_9c53b7862b5d614a = [];
    self.helper_bar_prompts.var_8f8e901b3dbe09d8 = [];
    
    for ( i = 0; i < 7 ; i++ )
    {
        self.helper_bar_prompts.var_9c53b7862b5d614a[ i ] = i;
    }
}

// Namespace helper_bar_prompts
// Params 2, eflags: 0x4
// Checksum 0x63478e79, Offset: 0x3e6
// Size: 0x149, Type: bool
function private function_2eb0e7b1b4c5fd73( prompt_group, prompt_ref )
{
    if ( !( isdefined( self.helper_bar_prompts ) && isdefined( self.helper_bar_prompts.var_9c53b7862b5d614a ) ) )
    {
        function_2e74c09ac7e4123f();
    }
    
    if ( self.helper_bar_prompts.var_9c53b7862b5d614a.size > 0 )
    {
        if ( !isdefined( self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ] ) )
        {
            self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ] = [];
        }
        
        if ( !isdefined( self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] ) )
        {
            self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] = self.helper_bar_prompts.var_9c53b7862b5d614a[ 0 ];
            self.helper_bar_prompts.var_9c53b7862b5d614a[ 0 ] = undefined;
            function_cdc669dbc8ea2101( self.helper_bar_prompts.var_9c53b7862b5d614a );
            scripted_widgets::function_2ac0ab23c4b54848( "helper_bar_prompts", prompt_group + prompt_ref, level.var_d6dc5011703961f );
        }
    }
    else
    {
        assert( 0, "<dev string:x13b>" );
    }
    
    return self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] ?? undefined;
}

// Namespace helper_bar_prompts
// Params 2, eflags: 0x4
// Checksum 0x2c7af973, Offset: 0x538
// Size: 0x8a
function private function_a4009340a631c0d4( prompt_group, prompt_ref )
{
    if ( isdefined( self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] ) )
    {
        self.helper_bar_prompts.var_9c53b7862b5d614a[ self.helper_bar_prompts.var_9c53b7862b5d614a.size ] = self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ];
        self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] = undefined;
    }
}

// Namespace helper_bar_prompts
// Params 4, eflags: 0x4
// Checksum 0xdaf1870a, Offset: 0x5ca
// Size: 0x7f
function private function_181d0f4b4f6ff150( prompt_group, prompt_ref, prompt_string, var_b5b0b56db466e01b = undefined )
{
    fields = [];
    fields[ "locstring_index" ] = getlocstringindex( prompt_string );
    fields[ "gamepad_override_locstring_index" ] = isdefined( var_b5b0b56db466e01b ) ? getlocstringindex( var_b5b0b56db466e01b ) : undefined;
    function_2eb0e7b1b4c5fd73( prompt_group, prompt_ref );
    scripted_widgets::function_7d1f65dbcfbe74ef( "helper_bar_prompts", prompt_group + prompt_ref, fields, 1 );
}

// Namespace helper_bar_prompts
// Params 0, eflags: 0x4
// Checksum 0x219848ce, Offset: 0x651
// Size: 0x1f
function private function_1923e27f30332708()
{
    assert( isplayer( self ), "<dev string:x164>" );
    return scripted_widgets::is_active( "helper_bar_prompts" );
}

// Namespace helper_bar_prompts
// Params 3
// Checksum 0x6745c823, Offset: 0x679
// Size: 0x134
function function_dea2e02912453960( prompt_group, var_4a4c58cb954d6dec, var_f16f3024f52a1dd2 = 1 )
{
    assert( isarray( var_4a4c58cb954d6dec ) );
    level utility::flag_wait( "scripted_widgets_initialized" );
    
    if ( !scripted_widgets::is_active( "helper_bar_prompts" ) )
    {
        scripted_widgets::list_create( "helper_bar_prompts", level.var_8df7cb70718a19a8 );
        scripted_widgets::set_priority( "helper_bar_prompts", 7 );
    }
    
    foreach ( prompt_ref, prompt in var_4a4c58cb954d6dec )
    {
        if ( isarray( prompt ) )
        {
            loc_string = prompt[ 0 ];
            var_b5b0b56db466e01b = prompt[ 1 ];
            function_181d0f4b4f6ff150( prompt_group, prompt_ref, loc_string, var_b5b0b56db466e01b );
            continue;
        }
        
        function_181d0f4b4f6ff150( prompt_group, prompt_ref, prompt );
    }
    
    if ( var_f16f3024f52a1dd2 )
    {
        function_e3a29d9137ae2b0a( "DisplayBacking" );
    }
    
    prompt_set_position();
}

// Namespace helper_bar_prompts
// Params 5
// Checksum 0xa1e9cd46, Offset: 0x7b5
// Size: 0xb7
function function_1e3ed50fec84e584( prompt_group, prompt_ref, loc_string, loc_string_alt = undefined, var_f16f3024f52a1dd2 = 1 )
{
    assert( isstring( prompt_group ) && isstring( prompt_ref ) && isdefined( loc_string ), "<dev string:x199>" );
    
    if ( !function_1923e27f30332708() )
    {
        scripted_widgets::list_create( "helper_bar_prompts", level.var_8df7cb70718a19a8 );
        scripted_widgets::set_priority( "helper_bar_prompts", 7 );
        prompt_set_position();
    }
    
    function_181d0f4b4f6ff150( prompt_group, prompt_ref, loc_string, loc_string_alt );
    
    if ( var_f16f3024f52a1dd2 )
    {
        function_e3a29d9137ae2b0a( "DisplayBacking" );
    }
}

// Namespace helper_bar_prompts
// Params 4
// Checksum 0xce3dac85, Offset: 0x874
// Size: 0x69
function prompt_set_position( var_199a1928c5489f36 = 0, var_6d13ecb54543759b = -85, var_e8ef69772b2c707d = 1, var_3e2cf537151a4487 = 2 )
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    scripted_widgets::set_position( "helper_bar_prompts", var_199a1928c5489f36, var_6d13ecb54543759b, var_e8ef69772b2c707d, var_3e2cf537151a4487, 1 );
}

// Namespace helper_bar_prompts
// Params 1
// Checksum 0xfde068e8, Offset: 0x8e5
// Size: 0x38
function function_e3a29d9137ae2b0a( string_state )
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    assert( isstring( string_state ), "<dev string:x205>" );
    scripted_widgets::set_state( "helper_bar_prompts", string_state );
}

// Namespace helper_bar_prompts
// Params 3
// Checksum 0xb9db80fd, Offset: 0x925
// Size: 0x57
function function_c6739a4d2c44b28( prompt_group, prompt_ref, string_state )
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    assert( isstring( prompt_ref ) && isstring( string_state ), "<dev string:x24c>" );
    scripted_widgets::function_12e7d25479e189f9( "helper_bar_prompts", prompt_group + prompt_ref, string_state );
}

// Namespace helper_bar_prompts
// Params 4
// Checksum 0x9a0d026c, Offset: 0x984
// Size: 0x78
function function_ab024b1bda02abd2( prompt_group, prompt_ref, loc_string, loc_string_alt )
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    fields = [];
    fields[ "locstring_index" ] = getlocstringindex( loc_string );
    fields[ "gamepad_override_locstring_index" ] = isdefined( loc_string_alt ) ? getlocstringindex( loc_string_alt ) : undefined;
    scripted_widgets::function_7d1f65dbcfbe74ef( "helper_bar_prompts", prompt_group + prompt_ref, fields, 1 );
}

// Namespace helper_bar_prompts
// Params 1
// Checksum 0xb3f7f1b7, Offset: 0xa04
// Size: 0x2e
function prompt_show_backing( var_180702cbcee343fe = 1 )
{
    function_e3a29d9137ae2b0a( var_180702cbcee343fe ? "DisplayBacking" : "Default" );
}

// Namespace helper_bar_prompts
// Params 3
// Checksum 0xe04fda04, Offset: 0xa3a
// Size: 0x88
function function_8844a64767fa1e46( prompt_group, prompt_ref, var_f55208cc7abddfd0 = 1 )
{
    assert( isstring( prompt_group ) && isstring( prompt_ref ), "<dev string:x29e>" );
    
    if ( !function_1923e27f30332708() || !isdefined( self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ][ prompt_ref ] ) )
    {
        return;
    }
    
    scripted_widgets::list_remove_item( "helper_bar_prompts", prompt_group + prompt_ref, var_f55208cc7abddfd0 );
    function_a4009340a631c0d4( prompt_group, prompt_ref );
}

// Namespace helper_bar_prompts
// Params 2
// Checksum 0xa0f8a11e, Offset: 0xaca
// Size: 0xf0
function function_9831ab25a5bc51dc( prompt_group, var_f55208cc7abddfd0 = 1 )
{
    assert( isstring( prompt_group ), "<dev string:x2f0>" );
    
    if ( !function_1923e27f30332708() || !isdefined( self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ] ) )
    {
        return;
    }
    
    foreach ( prompt_ref, index in self.helper_bar_prompts.var_8f8e901b3dbe09d8[ prompt_group ] )
    {
        scripted_widgets::list_remove_item( "helper_bar_prompts", prompt_group + prompt_ref, var_f55208cc7abddfd0 );
        function_a4009340a631c0d4( prompt_group, prompt_ref );
    }
}

// Namespace helper_bar_prompts
// Params 0
// Checksum 0xbe551bc0, Offset: 0xbc2
// Size: 0x2f
function function_159577d25bcbda7()
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    scripted_widgets::function_8ea01fb9860ffa54( "helper_bar_prompts" );
    self.helper_bar_prompts = undefined;
    function_e3a29d9137ae2b0a( "Default" );
}

// Namespace helper_bar_prompts
// Params 0
// Checksum 0x38414f8a, Offset: 0xbf9
// Size: 0x3d
function function_7dc51c6061e11d4b()
{
    if ( !function_1923e27f30332708() )
    {
        return;
    }
    
    if ( scripted_widgets::is_active( "helper_bar_prompts" ) )
    {
        scripted_widgets::function_8ea01fb9860ffa54( "helper_bar_prompts" );
        scripted_widgets::list_destroy( "helper_bar_prompts" );
        self.helper_bar_prompts = undefined;
    }
}

