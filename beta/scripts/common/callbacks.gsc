#using scripts\engine\utility;

#namespace callback;

// Namespace callback
// Params 2
// Checksum 0x47b4c222, Offset: 0x7f
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
// Checksum 0x8ce8eb61, Offset: 0x15b
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
// Checksum 0x231533f1, Offset: 0x2bf
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
// Checksum 0xb41a6287, Offset: 0x360
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
// Checksum 0x54d64770, Offset: 0x413
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
// Checksum 0xbb80c112, Offset: 0x4af
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
// Checksum 0xe4ad42bf, Offset: 0x67f
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
// Checksum 0x904a7d88, Offset: 0x78d
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
// Checksum 0x8b1c00cb, Offset: 0x88a
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
// Checksum 0x5f55c6db, Offset: 0xa04
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
// Params 3
// Checksum 0xb07aaf90, Offset: 0xa4a
// Size: 0x114, Type: bool
function exists( event, func, var_82a9e1b3da572654 )
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
// Checksum 0x21019665, Offset: 0xb67
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
// Checksum 0x14fbe4, Offset: 0xbbb
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
// Checksum 0x22dd5cfc, Offset: 0xc06
// Size: 0x4d, Type: bool
function function_494399dbf14431f0( template_name )
{
    return isdefined( level.callback_templates[ template_name ] ) && self != level && isdefined( self.var_947e48b35db244d1[ template_name ] ) && self.var_947e48b35db244d1[ template_name ] == level.callback_templates[ template_name ];
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0xe8b19e78, Offset: 0xc5c
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
// Checksum 0x6741f400, Offset: 0xda1
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
// Checksum 0x657ec02d, Offset: 0xe8d
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
// Checksum 0x14f29c29, Offset: 0xee3
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
// Checksum 0x97261409, Offset: 0xf3e
// Size: 0x1e
function private event_handler[mantle_begin] function_b46fe58b93bafaf3( params )
{
    callback( #"mantle_begin", params );
}

// Namespace callback/mantle_end
// Params 1, eflags: 0x24
// Checksum 0x58c25310, Offset: 0xf64
// Size: 0x1e
function private event_handler[mantle_end] function_8e55b1e07fa2546b( params )
{
    callback( #"mantle_end", params );
}

// Namespace callback/jump_begin
// Params 1, eflags: 0x24
// Checksum 0x4978a6d5, Offset: 0xf8a
// Size: 0x1e
function private event_handler[jump_begin] function_8ab5d89bd83b5406( params )
{
    callback( #"jump_begin", params );
}

// Namespace callback/jump_end
// Params 1, eflags: 0x24
// Checksum 0x2a58c8a6, Offset: 0xfb0
// Size: 0x1e
function private event_handler[jump_end] function_e36a1a3231321172( params )
{
    callback( #"jump_end", params );
}

// Namespace callback/dtp_begin
// Params 1, eflags: 0x24
// Checksum 0xf4908d80, Offset: 0xfd6
// Size: 0x1e
function private event_handler[dtp_begin] function_ab46866dc1e4c80e( params )
{
    callback( #"dtp_begin", params );
}

// Namespace callback/dtp_end
// Params 1, eflags: 0x24
// Checksum 0xe091bdb3, Offset: 0xffc
// Size: 0x36
function private event_handler[dtp_end] function_f522d1b4d1522eaa( params = {} )
{
    params.time = gettime();
    callback( #"dtp_end", params );
}

// Namespace callback/event_35fdbb1a25e6bc2
// Params 1, eflags: 0x24
// Checksum 0x6f6d7b31, Offset: 0x103a
// Size: 0x1e
function private event_handler[event_35fdbb1a25e6bc2] function_c0a49e255eff5c00( params )
{
    callback( #"hash_be5d6ef21120e023", params );
}

// Namespace callback/event_e7b2909656c54d2e
// Params 1, eflags: 0x24
// Checksum 0x7b2e01f0, Offset: 0x1060
// Size: 0x1e
function private event_handler[event_e7b2909656c54d2e] function_1de5ac96dc1e9bfc( params )
{
    callback( #"hash_da84f662d754013b", params );
}

// Namespace callback/explode
// Params 1, eflags: 0x24
// Checksum 0x48622532, Offset: 0x1086
// Size: 0x1e
function private event_handler[explode] explode_callback( params )
{
    callback( #"explode", params );
}

// Namespace callback/input_type_changed
// Params 1, eflags: 0x24
// Checksum 0xa4a64ae7, Offset: 0x10ac
// Size: 0x1e
function private event_handler[input_type_changed] function_480cd18c2fdbb2e6( params )
{
    callback( #"input_type_changed", params );
}

// Namespace callback/sprint_begin
// Params 1, eflags: 0x24
// Checksum 0x23aba721, Offset: 0x10d2
// Size: 0x1e
function private event_handler[sprint_begin] function_8b2ffab5b798a532( params )
{
    callback( #"sprint_begin", params );
}

// Namespace callback/sprint_end
// Params 1, eflags: 0x24
// Checksum 0x3b27eb1f, Offset: 0x10f8
// Size: 0x36
function private event_handler[sprint_end] function_c8e59309d5563f3e( params = {} )
{
    params.time = gettime();
    callback( #"sprint_end", params );
}

// Namespace callback/sprint_slide_begin
// Params 1, eflags: 0x24
// Checksum 0xd5c5c418, Offset: 0x1136
// Size: 0x1e
function private event_handler[sprint_slide_begin] function_bb2f202daca0b6d8( params )
{
    callback( #"sprint_slide_begin", params );
}

// Namespace callback/sprint_slide_end
// Params 1, eflags: 0x24
// Checksum 0x423a3a28, Offset: 0x115c
// Size: 0x36
function private event_handler[sprint_slide_end] function_720325cacef69c84( params = {} )
{
    params.time = gettime();
    callback( #"sprint_slide_end", params );
}

// Namespace callback/event_b70217d016f49960
// Params 1, eflags: 0x24
// Checksum 0x107c816f, Offset: 0x119a
// Size: 0x36
function private event_handler[event_b70217d016f49960] function_5916270813189d5e( params = {} )
{
    params.time = gettime();
    callback( #"hash_3f03a307b9f6e227", params );
}

// Namespace callback/player_ads_end
// Params 1, eflags: 0x24
// Checksum 0x2b15dad, Offset: 0x11d8
// Size: 0x1e
function private event_handler[player_ads_end] function_bd104b2c8998717a( params )
{
    callback( #"player_ads_end", params );
}

// Namespace callback/event_2e10fc85899f0d88
// Params 1, eflags: 0x24
// Checksum 0xf9db1447, Offset: 0x11fe
// Size: 0x1e
function private event_handler[event_2e10fc85899f0d88] function_57cd1ac3b8465136( params )
{
    callback( #"hash_884a4bf94d95eb67", params );
}

// Namespace callback/event_761f161a3eab12c4
// Params 1, eflags: 0x24
// Checksum 0xd76ad94, Offset: 0x1224
// Size: 0x1e
function private event_handler[event_761f161a3eab12c4] function_e5b623d7919406a2( params )
{
    callback( #"hash_75eeb7e76060544f", params );
}

// Namespace callback/event_bb6f8df1716434d4
// Params 1, eflags: 0x24
// Checksum 0x355e3667, Offset: 0x124a
// Size: 0x1e
function private event_handler[event_bb6f8df1716434d4] function_7573185818218bb2( params )
{
    callback( #"hash_1bf3199fda4b9841", params );
}

// Namespace callback/event_8de4d4a7f21f4700
// Params 1, eflags: 0x24
// Checksum 0x9ab6691a, Offset: 0x1270
// Size: 0x1e
function private event_handler[event_8de4d4a7f21f4700] function_88b54ecc6d6bc1be( params )
{
    callback( #"hash_48d4e39d6de3f7f1", params );
}

// Namespace callback/event_1512c0cb63ead69
// Params 1, eflags: 0x24
// Checksum 0x3897a4e7, Offset: 0x1296
// Size: 0x1e
function private event_handler[event_1512c0cb63ead69] function_4e63c03587871f15( params )
{
    callback( #"hash_bfe74b2130bdd498", params );
}

// Namespace callback/noent_volume_trigger
// Params 1, eflags: 0x24
// Checksum 0xe176ef77, Offset: 0x12bc
// Size: 0x1e
function private event_handler[noent_volume_trigger] function_908233942e9dd354( params )
{
    callback( #"noent_volume_trigger", params );
}

// Namespace callback/event_4fdd34de468d6c40
// Params 1, eflags: 0x24
// Checksum 0xedd2e23c, Offset: 0x12e2
// Size: 0x1e
function private event_handler[event_4fdd34de468d6c40] function_20ca138bfae1e2fe( params )
{
    callback( #"hash_ed2b0e3798247d41", params );
}

// Namespace callback/event_96aca87614d0130c
// Params 1, eflags: 0x24
// Checksum 0xfc54ea9, Offset: 0x1308
// Size: 0x1e
function private event_handler[event_96aca87614d0130c] function_84ca91c635f1331a( params )
{
    callback( #"hash_ad99e3d3c9ff54f1", params );
}

// Namespace callback/event_2115f771335ab05
// Params 1, eflags: 0x24
// Checksum 0x8461158a, Offset: 0x132e
// Size: 0x1e
function private event_handler[event_2115f771335ab05] function_fb3740c03688e3d1( params )
{
    callback( #"hash_3d6dbc87534bb18c", params );
}

// Namespace callback/event_79f25152ebd7f085
// Params 1, eflags: 0x24
// Checksum 0x1bedbfe1, Offset: 0x1354
// Size: 0x1e
function private event_handler[event_79f25152ebd7f085] function_4b529126a9adcc51( params )
{
    callback( #"hash_ea2512ff9da98548", params );
}

