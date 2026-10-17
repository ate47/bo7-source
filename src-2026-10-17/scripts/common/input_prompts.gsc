#using scripts\common\scripted_widgets;
#using scripts\common\system;
#using scripts\common\ui;

#namespace input_prompts;

// Namespace input_prompts
// Params 0, eflags: 0x5
// Checksum 0x84742bf1, Offset: 0x17c
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"input_prompts", undefined, undefined, &post_main );
}

// Namespace input_prompts
// Params 0, eflags: 0x4
// Checksum 0xf2b5d7c9, Offset: 0x19d
// Size: 0xdb
function private post_main()
{
    if ( !isdefined( level.input_prompts ) )
    {
        level.input_prompts = spawnstruct();
    }
    
    level.input_prompts.groups = [];
    level.input_prompts.lookups = [];
    ui::lui_registercallback( "input_prompt_success", &success );
    groups = getscriptbundlenames( "inputpromptgroup" );
    
    foreach ( group in groups )
    {
        function_c160b02563a8d9bb( group );
    }
}

// Namespace input_prompts
// Params 1
// Checksum 0x4d84f97, Offset: 0x280
// Size: 0x36b
function function_c160b02563a8d9bb( var_ce68b1137c30acf2 )
{
    if ( !isxhashasset( var_ce68b1137c30acf2 ) )
    {
        var_ce68b1137c30acf2 = hashcat( %"hash_2e2c28b413c2b7e7", var_ce68b1137c30acf2 );
    }
    
    data = getscriptbundle( var_ce68b1137c30acf2 );
    
    if ( isstring( data.var_eb7e38a39768db91 ) )
    {
        switch ( data.var_eb7e38a39768db91 )
        {
            case #"hash_fcca13ff94fb6ab0":
                data.var_eb7e38a39768db91 = 0;
                break;
            case #"hash_a653d8ebf51ebac4":
                data.var_eb7e38a39768db91 = 1;
                break;
            case #"hash_5b6fb3c943bab625":
                data.var_eb7e38a39768db91 = 2;
                break;
            case #"hash_175a301ae8d1236a":
                data.var_eb7e38a39768db91 = 3;
                break;
            default:
                data.var_eb7e38a39768db91 = undefined;
                break;
        }
    }
    
    if ( isstring( data.var_ca61c727deca1f5f ) )
    {
        switch ( data.var_ca61c727deca1f5f )
        {
            case #"hash_58baad6cbe764d7c":
                data.var_ca61c727deca1f5f = 0;
                break;
            case #"hash_4fdc8686e8ea358":
                data.var_ca61c727deca1f5f = 1;
                break;
            case #"hash_62df33229372c36a":
                data.var_ca61c727deca1f5f = 2;
                break;
            case #"hash_175a301ae8d1236a":
                data.var_ca61c727deca1f5f = 3;
                break;
            default:
                data.var_ca61c727deca1f5f = undefined;
                break;
        }
    }
    
    if ( isstring( data.var_c7641e5e0586c7d ) )
    {
        switch ( data.var_c7641e5e0586c7d )
        {
            case #"hash_fcca13ff94fb6ab0":
                data.var_c7641e5e0586c7d = 0;
                break;
            case #"hash_a653d8ebf51ebac4":
                data.var_c7641e5e0586c7d = 1;
                break;
            case #"hash_5b6fb3c943bab625":
                data.var_c7641e5e0586c7d = 2;
                break;
            case #"hash_175a301ae8d1236a":
                data.var_c7641e5e0586c7d = 3;
                break;
            default:
                data.var_c7641e5e0586c7d = undefined;
                break;
        }
    }
    
    if ( isstring( data.var_65fff9104f3f519b ) )
    {
        switch ( data.var_65fff9104f3f519b )
        {
            case #"hash_58baad6cbe764d7c":
                data.var_65fff9104f3f519b = 0;
                break;
            case #"hash_4fdc8686e8ea358":
                data.var_65fff9104f3f519b = 1;
                break;
            case #"hash_62df33229372c36a":
                data.var_65fff9104f3f519b = 2;
                break;
            case #"hash_175a301ae8d1236a":
                data.var_65fff9104f3f519b = 3;
                break;
            default:
                data.var_65fff9104f3f519b = undefined;
                break;
        }
    }
    
    register_group( data.name, data.list_widget, data.prompt_widget, data.x_pos, data.y_pos, data.var_eb7e38a39768db91, data.var_ca61c727deca1f5f, data.var_c7641e5e0586c7d, data.var_65fff9104f3f519b );
}

// Namespace input_prompts
// Params 9
// Checksum 0x3a74b97a, Offset: 0x5f3
// Size: 0x1e3
function register_group( group_name, list_widget = "scripted_widget_generic_list", prompt_widget = "scripted_widget_input_prompt", pos_x, pos_y, var_eb7e38a39768db91, var_ca61c727deca1f5f, var_c7641e5e0586c7d, var_65fff9104f3f519b )
{
    group_name = tolower( group_name );
    level.input_prompts.groups[ group_name ] = spawnstruct();
    level.input_prompts.groups[ group_name ].pos_x = pos_x ?? 0;
    level.input_prompts.groups[ group_name ].pos_y = pos_y ?? 0;
    level.input_prompts.groups[ group_name ].list_widget = list_widget;
    level.input_prompts.groups[ group_name ].prompt_widget = prompt_widget;
    level.input_prompts.groups[ group_name ].var_eb7e38a39768db91 = var_eb7e38a39768db91 ?? 1;
    level.input_prompts.groups[ group_name ].var_ca61c727deca1f5f = var_ca61c727deca1f5f ?? 1;
    level.input_prompts.groups[ group_name ].var_c7641e5e0586c7d = var_c7641e5e0586c7d ?? 1;
    level.input_prompts.groups[ group_name ].var_65fff9104f3f519b = var_65fff9104f3f519b ?? 1;
    level.input_prompts.groups[ group_name ].prompts = [];
}

// Namespace input_prompts
// Params 9
// Checksum 0x326fd070, Offset: 0x7de
// Size: 0x2e7
function function_d36f98198e651223( group_name, prompt_ref, prompt_text, hold_time, clientside_input, consume_input, keep_filled, success_callback, prompt_widget_override )
{
    group_name = tolower( group_name );
    prompt_ref = tolower( prompt_ref );
    assert( isdefined( level.input_prompts ) && isdefined( level.input_prompts.groups[ group_name ] ), "<dev string:x24>" + group_name + "<dev string:x83>" );
    
    if ( !scripted_widgets::is_active( group_name ) )
    {
        scripted_widgets::list_create( group_name, level.input_prompts.groups[ group_name ].list_widget );
        scripted_widgets::set_position( group_name, level.input_prompts.groups[ group_name ].pos_x, level.input_prompts.groups[ group_name ].pos_y, level.input_prompts.groups[ group_name ].var_eb7e38a39768db91, level.input_prompts.groups[ group_name ].var_ca61c727deca1f5f );
        scripted_widgets::function_428b263004632f8( group_name, level.input_prompts.groups[ group_name ].var_c7641e5e0586c7d, level.input_prompts.groups[ group_name ].var_65fff9104f3f519b );
    }
    
    if ( !isdefined( prompt_widget_override ) )
    {
        prompt_widget_override = level.input_prompts.groups[ group_name ].prompt_widget;
    }
    
    if ( !scripted_widgets::function_be2e1c2559f8f915( group_name, prompt_ref ) )
    {
        scripted_widgets::function_2ac0ab23c4b54848( group_name, prompt_ref, prompt_widget_override );
    }
    
    var_4739cab0f24a9960 = spawnstruct();
    var_4739cab0f24a9960.group = group_name;
    var_4739cab0f24a9960.prompt = prompt_ref;
    item_index = scripted_widgets::function_186afd5afa926606( group_name, prompt_ref );
    level.input_prompts.lookups[ item_index ] = var_4739cab0f24a9960;
    fields = [];
    fields[ "locstring_index" ] = getlocstringindex( prompt_text );
    fields[ "time" ] = hold_time ?? 0;
    fields[ "clientside_input" ] = istrue( clientside_input );
    fields[ "consume_input" ] = istrue( consume_input );
    fields[ "keep_filled_when_full" ] = istrue( keep_filled );
    level.input_prompts.groups[ group_name ].prompts[ prompt_ref ] = spawnstruct();
    level.input_prompts.groups[ group_name ].prompts[ prompt_ref ].success_callback = success_callback;
    scripted_widgets::function_7d1f65dbcfbe74ef( group_name, prompt_ref, fields );
}

// Namespace input_prompts
// Params 7
// Checksum 0x611218fa, Offset: 0xacd
// Size: 0x97
function set_prompt_fields( group_name, prompt_ref, text, hold_time, clientside_input, consume_input, keep_filled )
{
    if ( isdefined( text ) )
    {
        set_text( group_name, prompt_ref, text );
    }
    
    if ( isdefined( hold_time ) )
    {
        set_hold_time( group_name, prompt_ref, hold_time );
    }
    
    if ( isdefined( clientside_input ) )
    {
        set_clientside_input( group_name, prompt_ref, clientside_input );
    }
    
    if ( isdefined( consume_input ) )
    {
        set_consume_input( group_name, prompt_ref, consume_input );
    }
    
    if ( isdefined( keep_filled ) )
    {
        set_keep_filled_when_full( group_name, prompt_ref, keep_filled );
    }
}

// Namespace input_prompts
// Params 3
// Checksum 0x6203fca3, Offset: 0xb6c
// Size: 0x33
function set_text( group_name, prompt_ref, text )
{
    scripted_widgets::function_97f1566c9c555e26( group_name, prompt_ref, "locstring_index", getlocstringindex( text ) );
}

// Namespace input_prompts
// Params 3
// Checksum 0x18253f69, Offset: 0xba7
// Size: 0x3d
function set_hold_time( group_name, prompt_ref, hold_time )
{
    scripted_widgets::function_97f1566c9c555e26( group_name, prompt_ref, "time", hold_time );
    scripted_widgets::function_dca70380626a41a4( group_name, prompt_ref, gettime() );
}

// Namespace input_prompts
// Params 3
// Checksum 0x60de3ea5, Offset: 0xbec
// Size: 0x2f
function set_clientside_input( group_name, prompt_ref, clientside_input )
{
    scripted_widgets::function_97f1566c9c555e26( group_name, prompt_ref, "clientside_input", clientside_input );
}

// Namespace input_prompts
// Params 3
// Checksum 0xb79ad1e6, Offset: 0xc23
// Size: 0x2f
function set_consume_input( group_name, prompt_ref, consume_input )
{
    scripted_widgets::function_97f1566c9c555e26( group_name, prompt_ref, "consume_input", consume_input );
}

// Namespace input_prompts
// Params 3
// Checksum 0xbfb15001, Offset: 0xc5a
// Size: 0x2f
function set_keep_filled_when_full( group_name, prompt_ref, keep_filled )
{
    scripted_widgets::function_97f1566c9c555e26( group_name, prompt_ref, "keep_filled_when_full", keep_filled );
}

// Namespace input_prompts
// Params 3
// Checksum 0xb20d722f, Offset: 0xc91
// Size: 0x29
function set_prompt_param( group_name, prompt_ref, param_ref )
{
    scripted_widgets::function_ca1923c3c73e56c5( group_name, prompt_ref, param_ref );
}

// Namespace input_prompts
// Params 3
// Checksum 0xb20d722f, Offset: 0xcc2
// Size: 0x29
function set_prompt_state( group_name, prompt_ref, state_ref )
{
    scripted_widgets::function_12e7d25479e189f9( group_name, prompt_ref, state_ref );
}

// Namespace input_prompts
// Params 2
// Checksum 0x847ff327, Offset: 0xcf3
// Size: 0x23
function function_a38bedc6160c624f( group_name, prompt_ref )
{
    scripted_widgets::function_dca70380626a41a4( group_name, prompt_ref, gettime() );
}

// Namespace input_prompts
// Params 3
// Checksum 0xb8400e22, Offset: 0xd1e
// Size: 0x104
function function_994403d43e370193( group_name, prompt_ref, var_c0748f9bb9134010 = 1 )
{
    group_name = tolower( group_name );
    prompt_ref = tolower( prompt_ref );
    assert( isdefined( level.input_prompts ) && isdefined( level.input_prompts.groups[ group_name ] ), "<dev string:xbb>" + group_name + "<dev string:x83>" );
    item_index = scripted_widgets::function_186afd5afa926606( group_name, prompt_ref );
    
    if ( isdefined( item_index ) )
    {
        level.input_prompts.lookups[ item_index ] = undefined;
        level.input_prompts.groups[ group_name ].prompts[ prompt_ref ] = undefined;
        scripted_widgets::list_remove_item( group_name, prompt_ref, 1 );
        
        if ( var_c0748f9bb9134010 )
        {
            if ( level.input_prompts.groups[ group_name ].prompts.size == 0 )
            {
                scripted_widgets::list_destroy( group_name );
            }
        }
    }
}

// Namespace input_prompts
// Params 1
// Checksum 0x72f83424, Offset: 0xe2a
// Size: 0xb1
function clear_group( group_name )
{
    group_name = tolower( group_name );
    
    if ( scripted_widgets::is_active( group_name ) )
    {
        foreach ( prompt_ref, prompt in level.input_prompts.groups[ group_name ].prompts )
        {
            function_994403d43e370193( group_name, prompt_ref, 0 );
        }
    }
}

// Namespace input_prompts
// Params 1
// Checksum 0x42f653d9, Offset: 0xee3
// Size: 0x15c
function close_group( group_name )
{
    group_name = tolower( group_name );
    
    if ( scripted_widgets::is_active( group_name ) )
    {
        indices = [];
        
        foreach ( index, data in level.input_prompts.lookups )
        {
            if ( data.group == group_name )
            {
                indices[ indices.size ] = index;
            }
        }
        
        foreach ( index in indices )
        {
            level.input_prompts.lookups[ index ] = undefined;
        }
        
        level.input_prompts.groups[ group_name ].prompts = [];
        scripted_widgets::list_destroy( group_name );
    }
}

// Namespace input_prompts
// Params 2
// Checksum 0xbeae299a, Offset: 0x1047
// Size: 0x1f, Type: bool
function is_prompt_active( group_name, prompt_ref )
{
    return isdefined( scripted_widgets::function_186afd5afa926606( group_name, prompt_ref ) );
}

// Namespace input_prompts
// Params 1, eflags: 0x4
// Checksum 0x64d1fdbd, Offset: 0x106f
// Size: 0xa4
function private success( var_238f1ab4b19a6eb )
{
    var_4739cab0f24a9960 = level.input_prompts.lookups[ var_238f1ab4b19a6eb ];
    assert( isdefined( var_238f1ab4b19a6eb ) );
    success_callback = level.input_prompts.groups[ var_4739cab0f24a9960.group ].prompts[ var_4739cab0f24a9960.prompt ].success_callback;
    
    if ( isdefined( success_callback ) )
    {
        self [[ success_callback ]]( var_4739cab0f24a9960.group, var_4739cab0f24a9960.prompt );
    }
}

