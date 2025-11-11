#using scripts\engine\utility;

#namespace callback;

// Namespace callback
// Params 2
// Checksum 0x5d6ecb8e, Offset: 0x80
// Size: 0xd4
function callback( event, params = {} )
{
    assert( isstruct( params ), "<dev string:x24>" );
    function_e019c346be830cd( level, event, params );
    
    if ( self != level )
    {
        function_e019c346be830cd( self, event, params );
        
        if ( isdefined( self.var_947e48b35db244d1 ) )
        {
            foreach ( callback_template in self.var_947e48b35db244d1 )
            {
                function_e019c346be830cd( callback_template, event, params );
            }
        }
    }
}

// Namespace callback
// Params 3
// Checksum 0xfd86311e, Offset: 0x15c
// Size: 0x15b
function response( type, event, params = {} )
{
    assert( isstruct( params ), "<dev string:x24>" );
    eval = function_5f5d84cefece4c79( type, level, event, params );
    
    if ( eval.done == 1 )
    {
        return eval.val;
    }
    
    if ( self != level )
    {
        eval = function_5f5d84cefece4c79( type, self, event, params );
        
        if ( eval.done == 1 )
        {
            return eval.val;
        }
        
        if ( isdefined( self.var_947e48b35db244d1 ) )
        {
            foreach ( callback_template in self.var_947e48b35db244d1 )
            {
                eval = function_5f5d84cefece4c79( type, callback_template, event, params );
                
                if ( eval.done == 1 )
                {
                    return eval.val;
                }
            }
        }
    }
    
    eval = function_9f857585dea1ad55( type, eval );
    return eval.val;
}

// Namespace callback
// Params 2
// Checksum 0x6c4f6b1, Offset: 0x2c0
// Size: 0x99
function function_dc3d72afd5b7f11( event, params )
{
    ais = getaiarray();
    
    foreach ( ai in ais )
    {
        ai function_e019c346be830cd( ai, event, params );
    }
}

// Namespace callback
// Params 2
// Checksum 0x925421a3, Offset: 0x361
// Size: 0xab
function function_48f0827691e6e0ff( event, params )
{
    players = level.players;
    
    foreach ( player in players )
    {
        player function_e019c346be830cd( level, event, params );
        player function_e019c346be830cd( player, event, params );
    }
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0x9dacf725, Offset: 0x414
// Size: 0x94
function private function_e019c346be830cd( ent, event, params )
{
    callbacks = ent.callbacks[ event ];
    
    if ( !isdefined( callbacks ) )
    {
        return;
    }
    
    for ( i = 0; i < callbacks.size ; i++ )
    {
        callback_fields = callbacks[ i ];
        callback = callback_fields[ 0 ];
        
        if ( callback_fields.size > 1 )
        {
            self thread [[ callback ]]( params, callback_fields[ 1 ] );
            continue;
        }
        
        self thread [[ callback ]]( params );
    }
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0x7cebe539, Offset: 0x4b0
// Size: 0x1c7
function private function_331b35582ffb4f0a( type, value, prev_eval )
{
    switch ( type )
    {
        case 0:
            if ( value == 1 )
            {
                return { #val:1, #done:1 };
            }
            
            break;
        case 1:
            if ( value == 0 )
            {
                return { #val:1, #done:1 };
            }
            
            break;
        case 2:
            if ( value == 0 )
            {
                return { #val:0, #done:1 };
            }
            
            break;
        case 3:
            if ( value == 1 )
            {
                return { #val:0, #done:1 };
            }
            
            break;
        case 4:
            if ( !isdefined( prev_eval.val ) || value > prev_eval.val )
            {
                return { #val:value, #done:0 };
            }
            
            return prev_eval;
        case 5:
            if ( !isdefined( prev_eval.val ) || value < prev_eval.val )
            {
                return { #val:value, #done:0 };
            }
            
            return prev_eval;
        case 6:
            combination = prev_eval.val ?? [];
            combination = arraycombine( combination, value ?? [] );
            return { #val:combination, #done:0 };
    }
    
    return { #done:0 };
}

// Namespace callback
// Params 2, eflags: 0x4
// Checksum 0xa4bbe339, Offset: 0x680
// Size: 0x105
function private function_9f857585dea1ad55( type, eval )
{
    ret = { #done:0 };
    
    switch ( type )
    {
        case 4:
        case 5:
            ret.val = eval.val ?? 0;
            break;
        case 2:
        case 3:
            ret.val = 1;
            break;
        case 0:
        case 1:
            ret.val = 0;
            break;
        case 6:
            ret.val = eval.val ?? [];
            break;
        default:
            ret.val = 0;
            break;
    }
    
    return ret;
}

// Namespace callback
// Params 4, eflags: 0x4
// Checksum 0x399c047, Offset: 0x78e
// Size: 0xf4
function private function_5f5d84cefece4c79( type, ent, event, params )
{
    profilestart();
    callbacks = ent.callbacks[ event ];
    
    if ( !isdefined( callbacks ) )
    {
        profilestop();
        return;
    }
    
    eval = { #done:0 };
    
    for ( i = 0; i < callbacks.size ; i++ )
    {
        callback_fields = callbacks[ i ];
        callback = callback_fields[ 0 ];
        
        if ( callback_fields.size > 1 )
        {
            ret = self [[ callback ]]( params, callback_fields[ 1 ] );
        }
        else
        {
            ret = self [[ callback ]]( params );
        }
        
        assert( isdefined( ret ) );
        eval = function_331b35582ffb4f0a( type, ret, eval );
        
        if ( eval.done == 1 )
        {
            profilestop();
            return eval;
        }
    }
    
    profilestop();
    return function_9f857585dea1ad55( type, eval );
}

// Namespace callback
// Params 3
// Checksum 0xc916f290, Offset: 0x88b
// Size: 0x172
function add( event, func, var_82a9e1b3da572654 )
{
    if ( !isfunction( func ) )
    {
        assertmsg( "<dev string:x60>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) + "<dev string:x79>" );
        return;
    }
    
    if ( !isdefined( event ) )
    {
        assertmsg( "<dev string:x99>" );
        return;
    }
    
    if ( !isdefined( self.callbacks[ event ] ) )
    {
        self.callbacks[ event ] = [];
    }
    
    /#
        foreach ( callback in self.callbacks[ event ] )
        {
            if ( isarray( callback ) && callback[ 0 ] == func )
            {
                if ( !isdefined( callback[ 1 ] ) && !isdefined( var_82a9e1b3da572654 ) || callback[ 1 ] == var_82a9e1b3da572654 )
                {
                    assertmsg( "<dev string:xcc>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) );
                }
            }
        }
    #/
    
    self.callbacks[ event ][ self.callbacks[ event ].size ] = [ func, var_82a9e1b3da572654 ];
}

// Namespace callback
// Params 3
// Checksum 0x25ab586e, Offset: 0xa05
// Size: 0x3e
function remove( event, func, var_82a9e1b3da572654 )
{
    if ( !isdefined( event ) )
    {
        assertmsg( "<dev string:xfd>" );
        return;
    }
    
    thread remove_internal( event, func, var_82a9e1b3da572654 );
}

// Namespace callback
// Params 4
// Checksum 0x6d0f4eb, Offset: 0xa4b
// Size: 0x125, Type: bool
function exists( event, func, var_82a9e1b3da572654, var_f073300f6d4db30b )
{
    if ( !isfunction( func ) )
    {
        assertmsg( "<dev string:x60>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) + "<dev string:x79>" );
        return false;
    }
    
    if ( !isdefined( event ) )
    {
        assertmsg( "<dev string:x133>" );
        return false;
    }
    
    if ( isdefined( self.callbacks[ event ] ) )
    {
        foreach ( callback in self.callbacks[ event ] )
        {
            if ( callback[ 0 ] == func )
            {
                if ( var_f073300f6d4db30b )
                {
                    return true;
                }
                
                if ( !isdefined( callback[ 1 ] ) && !isdefined( var_82a9e1b3da572654 ) || callback[ 1 ] == var_82a9e1b3da572654 )
                {
                    return true;
                }
            }
        }
    }
    
    return false;
}

// Namespace callback
// Params 1
// Checksum 0x756d349a, Offset: 0xb79
// Size: 0x4b
function get_template( template_name )
{
    if ( !isdefined( level.callback_templates ) )
    {
        level.callback_templates = [];
    }
    
    if ( !isdefined( level.callback_templates[ template_name ] ) )
    {
        level.callback_templates[ template_name ] = {};
    }
    
    return level.callback_templates[ template_name ];
}

// Namespace callback
// Params 1
// Checksum 0x6fe1479c, Offset: 0xbcd
// Size: 0x43
function function_99edd620ee45cd95( template_name )
{
    assert( self != level, "<dev string:x172>" );
    
    if ( !isdefined( self.var_947e48b35db244d1[ template_name ] ) )
    {
        self.var_947e48b35db244d1[ template_name ] = get_template( template_name );
    }
}

// Namespace callback
// Params 1
// Checksum 0x22dd5d8b, Offset: 0xc18
// Size: 0x4d, Type: bool
function function_494399dbf14431f0( template_name )
{
    return isdefined( level.callback_templates[ template_name ] ) && self != level && isdefined( self.var_947e48b35db244d1[ template_name ] ) && self.var_947e48b35db244d1[ template_name ] == level.callback_templates[ template_name ];
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0xe8b19943, Offset: 0xc6e
// Size: 0x13c
function private function_f01298ee2b91ffee( event, func, var_82a9e1b3da572654 )
{
    removed_index = undefined;
    
    if ( isdefined( var_82a9e1b3da572654 ) )
    {
        foreach ( index, func_group in self.callbacks[ event ] )
        {
            if ( func_group[ 0 ] == func && isdefined( func_group[ 1 ] ) && func_group[ 1 ] == var_82a9e1b3da572654 )
            {
                removed_index = index;
                break;
            }
        }
    }
    else
    {
        foreach ( index, func_group in self.callbacks[ event ] )
        {
            if ( func_group[ 0 ] == func )
            {
                removed_index = index;
                break;
            }
        }
    }
    
    return removed_index;
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0xb183ec40, Offset: 0xdb3
// Size: 0xe4
function private remove_internal( event, func, var_82a9e1b3da572654 )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.callbacks[ event ] ) )
    {
        return;
    }
    
    if ( func === #"all" )
    {
        self.callbacks[ event ] = [];
        return;
    }
    
    var_d4239310c8dded2f = function_f01298ee2b91ffee( event, func, var_82a9e1b3da572654 );
    
    if ( !isdefined( var_d4239310c8dded2f ) )
    {
        return;
    }
    
    self.callbacks[ event ][ var_d4239310c8dded2f ][ 0 ] = &utility::empty_init_func;
    func = &utility::empty_init_func;
    waittillframeend();
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.callbacks[ event ] ) )
    {
        return;
    }
    
    var_d4239310c8dded2f = function_f01298ee2b91ffee( event, func, var_82a9e1b3da572654 );
    
    if ( isdefined( var_d4239310c8dded2f ) )
    {
        self.callbacks[ event ][ var_d4239310c8dded2f ] = undefined;
        
        if ( isint( var_d4239310c8dded2f ) )
        {
            function_cdc669dbc8ea2101( self.callbacks[ event ] );
        }
    }
}

// Namespace callback/stance_changed
// Params 1, eflags: 0x24
// Checksum 0xc32c4ba6, Offset: 0xe9f
// Size: 0x4e
function private event_handler[stance_changed] function_b15e5f73f4881871( params )
{
    if ( !isdefined( params ) || !isdefined( self ) )
    {
        return;
    }
    
    params.isalive = isalive( self );
    params.time = gettime();
    callback( #"stance_changed", params );
}

// Namespace callback/event_80a9e9412264a600
// Params 1, eflags: 0x24
// Checksum 0x57b94c27, Offset: 0xef5
// Size: 0x53
function private event_handler[event_80a9e9412264a600] function_27656f000f774ebe( params )
{
    params.isalive = isalive( self );
    params.time = gettime();
    callback( #"hash_115130d3bf4d7431", params );
    self.laststancechangetime = params.time;
}

// Namespace callback/mantle_begin
// Params 1, eflags: 0x24
// Checksum 0x97260837, Offset: 0xf50
// Size: 0x1e
function private event_handler[mantle_begin] function_b46fe58b93bafaf3( params )
{
    callback( #"mantle_begin", params );
}

// Namespace callback/mantle_end
// Params 1, eflags: 0x24
// Checksum 0x58c24cdc, Offset: 0xf76
// Size: 0x1e
function private event_handler[mantle_end] function_8e55b1e07fa2546b( params )
{
    callback( #"mantle_end", params );
}

// Namespace callback/jump_begin
// Params 1, eflags: 0x24
// Checksum 0x4978beed, Offset: 0xf9c
// Size: 0x1e
function private event_handler[jump_begin] function_8ab5d89bd83b5406( params )
{
    callback( #"jump_begin", params );
}

// Namespace callback/jump_end
// Params 1, eflags: 0x24
// Checksum 0x2a58d080, Offset: 0xfc2
// Size: 0x1e
function private event_handler[jump_end] function_e36a1a3231321172( params )
{
    callback( #"jump_end", params );
}

// Namespace callback/dtp_begin
// Params 1, eflags: 0x24
// Checksum 0xf49095c0, Offset: 0xfe8
// Size: 0x1e
function private event_handler[dtp_begin] function_ab46866dc1e4c80e( params )
{
    callback( #"dtp_begin", params );
}

// Namespace callback/dtp_end
// Params 1, eflags: 0x24
// Checksum 0x3f3a7b31, Offset: 0x100e
// Size: 0x36
function private event_handler[dtp_end] function_f522d1b4d1522eaa( params = {} )
{
    params.time = gettime();
    callback( #"dtp_end", params );
}

// Namespace callback/event_35fdbb1a25e6bc2
// Params 1, eflags: 0x24
// Checksum 0x6f6d6345, Offset: 0x104c
// Size: 0x1e
function private event_handler[event_35fdbb1a25e6bc2] function_c0a49e255eff5c00( params )
{
    callback( #"hash_be5d6ef21120e023", params );
}

// Namespace callback/event_e7b2909656c54d2e
// Params 1, eflags: 0x24
// Checksum 0x7b2e19f0, Offset: 0x1072
// Size: 0x1e
function private event_handler[event_e7b2909656c54d2e] function_1de5ac96dc1e9bfc( params )
{
    callback( #"hash_da84f662d754013b", params );
}

// Namespace callback/explode
// Params 1, eflags: 0x24
// Checksum 0x48623c8a, Offset: 0x1098
// Size: 0x1e
function private event_handler[explode] explode_callback( params )
{
    callback( #"explode", params );
}

// Namespace callback/input_type_changed
// Params 1, eflags: 0x24
// Checksum 0xa4a6531b, Offset: 0x10be
// Size: 0x1e
function private event_handler[input_type_changed] function_480cd18c2fdbb2e6( params )
{
    callback( #"input_type_changed", params );
}

// Namespace callback/sprint_begin
// Params 1, eflags: 0x24
// Checksum 0x23abbe81, Offset: 0x10e4
// Size: 0x1e
function private event_handler[sprint_begin] function_8b2ffab5b798a532( params )
{
    callback( #"sprint_begin", params );
}

// Namespace callback/sprint_end
// Params 1, eflags: 0x24
// Checksum 0xe48c2cfd, Offset: 0x110a
// Size: 0x36
function private event_handler[sprint_end] function_c8e59309d5563f3e( params = {} )
{
    params.time = gettime();
    callback( #"sprint_end", params );
}

// Namespace callback/sprint_slide_begin
// Params 1, eflags: 0x24
// Checksum 0xd5c5dd94, Offset: 0x1148
// Size: 0x1e
function private event_handler[sprint_slide_begin] function_bb2f202daca0b6d8( params )
{
    callback( #"sprint_slide_begin", params );
}

// Namespace callback/sprint_slide_end
// Params 1, eflags: 0x24
// Checksum 0x9d91fdc2, Offset: 0x116e
// Size: 0x36
function private event_handler[sprint_slide_end] function_720325cacef69c84( params = {} )
{
    params.time = gettime();
    callback( #"sprint_slide_end", params );
}

// Namespace callback/event_b70217d016f49960
// Params 1, eflags: 0x24
// Checksum 0xcfd74617, Offset: 0x11ac
// Size: 0x36
function private event_handler[event_b70217d016f49960] function_5916270813189d5e( params = {} )
{
    params.time = gettime();
    callback( #"hash_3f03a307b9f6e227", params );
}

// Namespace callback/player_ads_end
// Params 1, eflags: 0x24
// Checksum 0x2b14435, Offset: 0x11ea
// Size: 0x1e
function private event_handler[player_ads_end] function_bd104b2c8998717a( params )
{
    callback( #"player_ads_end", params );
}

// Namespace callback/event_2e10fc85899f0d88
// Params 1, eflags: 0x24
// Checksum 0xf9db0d33, Offset: 0x1210
// Size: 0x1e
function private event_handler[event_2e10fc85899f0d88] function_57cd1ac3b8465136( params )
{
    callback( #"hash_884a4bf94d95eb67", params );
}

// Namespace callback/event_761f161a3eab12c4
// Params 1, eflags: 0x24
// Checksum 0xd76b4f2, Offset: 0x1236
// Size: 0x1e
function private event_handler[event_761f161a3eab12c4] function_e5b623d7919406a2( params )
{
    callback( #"hash_75eeb7e76060544f", params );
}

// Namespace callback/event_bb6f8df1716434d4
// Params 1, eflags: 0x24
// Checksum 0x355e2f7b, Offset: 0x125c
// Size: 0x1e
function private event_handler[event_bb6f8df1716434d4] function_7573185818218bb2( params )
{
    callback( #"hash_1bf3199fda4b9841", params );
}

// Namespace callback/event_8de4d4a7f21f4700
// Params 1, eflags: 0x24
// Checksum 0x9ab6701e, Offset: 0x1282
// Size: 0x1e
function private event_handler[event_8de4d4a7f21f4700] function_88b54ecc6d6bc1be( params )
{
    callback( #"hash_48d4e39d6de3f7f1", params );
}

// Namespace callback/event_1512c0cb63ead69
// Params 1, eflags: 0x24
// Checksum 0x3897bdef, Offset: 0x12a8
// Size: 0x1e
function private event_handler[event_1512c0cb63ead69] function_4e63c03587871f15( params )
{
    callback( #"hash_bfe74b2130bdd498", params );
}

// Namespace callback/noent_volume_trigger
// Params 1, eflags: 0x24
// Checksum 0xe176f65f, Offset: 0x12ce
// Size: 0x1e
function private event_handler[noent_volume_trigger] function_908233942e9dd354( params )
{
    callback( #"noent_volume_trigger", params );
}

// Namespace callback/event_4fdd34de468d6c40
// Params 1, eflags: 0x24
// Checksum 0xedd2fbc8, Offset: 0x12f4
// Size: 0x1e
function private event_handler[event_4fdd34de468d6c40] function_20ca138bfae1e2fe( params )
{
    callback( #"hash_ed2b0e3798247d41", params );
}

// Namespace callback/event_96aca87614d0130c
// Params 1, eflags: 0x24
// Checksum 0xfc556a5, Offset: 0x131a
// Size: 0x1e
function private event_handler[event_96aca87614d0130c] function_84ca91c635f1331a( params )
{
    callback( #"hash_ad99e3d3c9ff54f1", params );
}

// Namespace callback/event_2115f771335ab05
// Params 1, eflags: 0x24
// Checksum 0x84610d4e, Offset: 0x1340
// Size: 0x1e
function private event_handler[event_2115f771335ab05] function_fb3740c03688e3d1( params )
{
    callback( #"hash_3d6dbc87534bb18c", params );
}

// Namespace callback/event_79f25152ebd7f085
// Params 1, eflags: 0x24
// Checksum 0x1beda7a9, Offset: 0x1366
// Size: 0x1e
function private event_handler[event_79f25152ebd7f085] function_4b529126a9adcc51( params )
{
    callback( #"hash_ea2512ff9da98548", params );
}

