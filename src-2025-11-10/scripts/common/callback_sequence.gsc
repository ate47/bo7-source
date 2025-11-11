#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace callback;

// Namespace callback
// Params 3
// Checksum 0xcd132f75, Offset: 0x81
// Size: 0x71
function register_sequence( event, callback_sequence, var_5299ed3e8dbf4549 )
{
    if ( !var_5299ed3e8dbf4549 && isdefined( level.var_330751f04fff2168[ event ] ) )
    {
        assertmsg( "<dev string:x24>" + event );
        return;
    }
    
    if ( !isdefined( level.var_330751f04fff2168[ event ] ) )
    {
        level.var_330751f04fff2168[ event ] = [];
    }
    
    level.var_330751f04fff2168[ event ] = callback_sequence;
}

// Namespace callback
// Params 4
// Checksum 0x379e4cda, Offset: 0xfa
// Size: 0x1f5
function function_dc654a4d4126a928( event, step, func, var_82a9e1b3da572654 )
{
    if ( !isfunction( func ) )
    {
        assertmsg( "<dev string:x53>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) + "<dev string:x6c>" );
        return;
    }
    
    if ( !isdefined( event ) )
    {
        assertmsg( "<dev string:x8c>" );
        return;
    }
    
    if ( !arraycontains( level.var_330751f04fff2168[ event ], step ) )
    {
        assertmsg( "<dev string:xbf>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) + "<dev string:x10e>" + ( isxhash( step ) ? getxhashsourcename( step ) : step ) );
        return;
    }
    
    if ( !isdefined( self.var_ec01d7b38dc438f[ event ] ) )
    {
        self.var_ec01d7b38dc438f[ event ] = [];
    }
    
    if ( !isdefined( self.var_ec01d7b38dc438f[ event ][ step ] ) )
    {
        self.var_ec01d7b38dc438f[ event ][ step ] = [];
    }
    
    /#
        foreach ( callback in self.var_ec01d7b38dc438f[ event ][ step ] )
        {
            if ( isarray( callback ) && callback[ 0 ] == func )
            {
                if ( !isdefined( callback[ 1 ] ) && !isdefined( var_82a9e1b3da572654 ) || callback[ 1 ] == var_82a9e1b3da572654 )
                {
                    assertmsg( "<dev string:x119>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) );
                }
            }
        }
    #/
    
    self.var_ec01d7b38dc438f[ event ][ step ][ self.var_ec01d7b38dc438f[ event ][ step ].size ] = [ func, var_82a9e1b3da572654 ];
}

// Namespace callback
// Params 4
// Checksum 0x5158ba6b, Offset: 0x2f7
// Size: 0x49
function function_a5ba9bab3a8b0b6( event, step, func, var_82a9e1b3da572654 )
{
    if ( !isdefined( event ) )
    {
        assertmsg( "<dev string:x14a>" );
        return;
    }
    
    thread function_2efff1776240a8ba( event, step, func, var_82a9e1b3da572654 );
}

// Namespace callback
// Params 2
// Checksum 0xbc0777c8, Offset: 0x348
// Size: 0xaf
function callback_sequence( event, params )
{
    steps = level.var_330751f04fff2168[ event ];
    
    if ( !isdefined( steps ) )
    {
        callback( event, params );
        return;
    }
    
    num_steps = steps.size;
    
    for ( step_index = 0; step_index < num_steps ; step_index++ )
    {
        function_2f7fd5c1ae12d286( event, steps[ step_index ], params );
    }
    
    /#
        if ( self.callbacks[ event ].size > 0 )
        {
            assertmsg( "<dev string:x18e>" + ( isxhash( event ) ? getxhashsourcename( event ) : event ) + "<dev string:x19b>" );
        }
    #/
}

// Namespace callback
// Params 3, eflags: 0x4
// Checksum 0x48ade190, Offset: 0x3ff
// Size: 0x112
function private function_2f7fd5c1ae12d286( event, step, params = {} )
{
    assert( isstruct( params ), "<dev string:x1ff>" );
    callbacks = level.var_ec01d7b38dc438f[ event ][ step ];
    
    if ( callbacks.size > 0 )
    {
        function_53912b0b5d985913( callbacks, params );
    }
    
    if ( self != level )
    {
        callbacks = self.var_ec01d7b38dc438f[ event ][ step ];
        
        if ( callbacks.size > 0 )
        {
            function_53912b0b5d985913( callbacks, params );
        }
        
        if ( isdefined( self.var_947e48b35db244d1 ) )
        {
            foreach ( callback_template in self.var_947e48b35db244d1 )
            {
                callback_sequence( callback_template, params );
            }
        }
    }
}

// Namespace callback
// Params 2, eflags: 0x4
// Checksum 0x3c9b57b, Offset: 0x519
// Size: 0x6b
function private function_53912b0b5d985913( callbacks, params )
{
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
// Params 4, eflags: 0x4
// Checksum 0xd3aabbce, Offset: 0x58c
// Size: 0x184
function private function_2efff1776240a8ba( event, step, func, var_82a9e1b3da572654 )
{
    if ( !isdefined( self.var_ec01d7b38dc438f[ event ][ step ] ) )
    {
        return;
    }
    
    if ( func === #"all" )
    {
        foreach ( callback in self.var_ec01d7b38dc438f[ event ][ step ] )
        {
            callback[ 0 ] = &utility::empty_init_func;
        }
    }
    else
    {
        var_d4239310c8dded2f = function_adec29e3187f2b( event, step, func, var_82a9e1b3da572654 );
        
        if ( !isdefined( var_d4239310c8dded2f ) )
        {
            return;
        }
        
        self.var_ec01d7b38dc438f[ event ][ step ][ var_d4239310c8dded2f ][ 0 ] = &utility::empty_init_func;
        func = &utility::empty_init_func;
    }
    
    waittillframeend();
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.var_ec01d7b38dc438f[ event ][ step ] ) )
    {
        return;
    }
    
    if ( func === #"all" )
    {
        self.var_ec01d7b38dc438f[ event ][ step ] = [];
        return;
    }
    
    var_d4239310c8dded2f = function_adec29e3187f2b( event, step, func, var_82a9e1b3da572654 );
    
    if ( isdefined( var_d4239310c8dded2f ) )
    {
        self.var_ec01d7b38dc438f[ event ][ step ][ var_d4239310c8dded2f ] = undefined;
        
        if ( isint( var_d4239310c8dded2f ) )
        {
            function_cdc669dbc8ea2101( self.var_ec01d7b38dc438f[ event ][ step ] );
        }
    }
}

// Namespace callback
// Params 4, eflags: 0x4
// Checksum 0x1892f021, Offset: 0x718
// Size: 0x149
function private function_adec29e3187f2b( event, step, func, var_82a9e1b3da572654 )
{
    removed_index = undefined;
    
    if ( isdefined( var_82a9e1b3da572654 ) )
    {
        foreach ( index, func_group in self.var_ec01d7b38dc438f[ event ][ step ] )
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
        foreach ( index, func_group in self.var_ec01d7b38dc438f[ event ][ step ] )
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

