#using scripts\common\utility;
#using scripts\engine\utility;

#namespace ui;

// Namespace ui
// Params 2
// Checksum 0x580bfcb2, Offset: 0xba
// Size: 0xb1
function lui_registercallback( channel, callback )
{
    if ( !isdefined( level.lui_callbacks ) )
    {
        level.lui_callbacks = [];
    }
    
    assert( isstring( channel ) && channel != "<dev string:x24>" && isfunction( callback ) );
    
    if ( !isdefined( level.lui_callbacks[ channel ] ) || !arraycontains( level.lui_callbacks[ channel ], callback ) )
    {
        if ( !isdefined( level.lui_callbacks[ channel ] ) )
        {
            level.lui_callbacks[ channel ] = [];
        }
        
        level.lui_callbacks[ channel ][ level.lui_callbacks[ channel ].size ] = callback;
    }
}

// Namespace ui
// Params 2
// Checksum 0x4a486f9, Offset: 0x173
// Size: 0xd5
function function_6c9f8c2a6da4d92b( channel, callback )
{
    assert( utility::issp() );
    assert( isstring( channel ) && channel != "<dev string:x24>" && isfunction( callback ) );
    
    if ( !isdefined( level.var_7885951511acf7b5 ) )
    {
        level.var_7885951511acf7b5 = [];
    }
    
    if ( !isdefined( level.var_1042038ec3eff6a4 ) )
    {
        level.var_1042038ec3eff6a4 = [];
    }
    
    if ( !isdefined( level.var_1042038ec3eff6a4[ channel ] ) || !arraycontains( level.var_1042038ec3eff6a4[ channel ], callback ) )
    {
        if ( !isdefined( level.var_1042038ec3eff6a4[ channel ] ) )
        {
            level.var_1042038ec3eff6a4[ channel ] = [];
        }
        
        level.var_1042038ec3eff6a4[ channel ][ level.var_1042038ec3eff6a4[ channel ].size ] = callback;
    }
}

// Namespace ui
// Params 2
// Checksum 0x425d9a47, Offset: 0x250
// Size: 0xbb
function function_770abf131329ffc7( channel, callback )
{
    assert( isinfrontend() );
    assert( isstring( channel ) && channel != "<dev string:x24>" && isfunction( callback ) );
    
    if ( !isdefined( level.var_8140645f7e3c6266 ) )
    {
        level.var_8140645f7e3c6266 = [];
    }
    
    if ( !isdefined( level.var_8140645f7e3c6266[ channel ] ) || !arraycontains( level.var_8140645f7e3c6266[ channel ], callback ) )
    {
        if ( !isdefined( level.var_8140645f7e3c6266[ channel ] ) )
        {
            level.var_8140645f7e3c6266[ channel ] = [];
        }
        
        level.var_8140645f7e3c6266[ channel ][ level.var_8140645f7e3c6266[ channel ].size ] = callback;
    }
}

// Namespace ui
// Params 1
// Checksum 0xb9a73e84, Offset: 0x313
// Size: 0x5d
function function_52f4e497797fadd8( channel )
{
    if ( !isdefined( level.var_1537394bb444852c ) )
    {
        level.var_1537394bb444852c = [];
    }
    
    assert( isstring( channel ) && channel != "<dev string:x24>" );
    
    if ( !isdefined( level.var_1537394bb444852c[ channel ] ) )
    {
        level.var_1537394bb444852c[ channel ] = channel;
    }
}

// Namespace ui/lui_callback
// Params 3, eflags: 0x20
// Checksum 0x1e331b71, Offset: 0x378
// Size: 0x2c8
function event_handler[lui_callback] lui_notify_callback( channel, value, value2 )
{
    if ( isdefined( self ) )
    {
        if ( isdefined( level.lui_callbacks ) && isdefined( level.lui_callbacks[ channel ] ) )
        {
            foreach ( callback in level.lui_callbacks[ channel ] )
            {
                self.var_b458a7ace288c777 = channel;
                
                if ( isdefined( value2 ) )
                {
                    self thread [[ callback ]]( value, value2 );
                    continue;
                }
                
                self thread [[ callback ]]( value );
            }
        }
        else if ( isdefined( level.var_1537394bb444852c ) && isdefined( level.var_1537394bb444852c[ channel ] ) )
        {
            if ( value )
            {
                utility::flag_set( channel );
            }
            else
            {
                utility::flag_clear( channel );
            }
        }
        
        if ( utility::issp() )
        {
            args = strtok( channel, "," );
            channelarg = args[ 0 ];
            
            if ( isdefined( level.var_1042038ec3eff6a4 ) && isdefined( level.var_1042038ec3eff6a4[ channelarg ] ) )
            {
                foreach ( callback in level.var_1042038ec3eff6a4[ channelarg ] )
                {
                    if ( isdefined( value2 ) )
                    {
                        self thread [[ callback ]]( value, value2, args );
                        continue;
                    }
                    
                    self thread [[ callback ]]( value, args );
                }
            }
        }
        
        if ( isinfrontend() )
        {
            args = strtok( channel, ",", 1 );
            channelarg = args[ 0 ];
            
            if ( isdefined( level.var_8140645f7e3c6266 ) && isdefined( level.var_8140645f7e3c6266[ channelarg ] ) )
            {
                foreach ( callback in level.var_8140645f7e3c6266[ channelarg ] )
                {
                    if ( isdefined( value2 ) )
                    {
                        self thread [[ callback ]]( value, value2, args );
                        continue;
                    }
                    
                    self thread [[ callback ]]( value, args );
                }
            }
        }
        
        /#
            thread function_898894515d5317e0( channel );
        #/
        
        if ( isdefined( value2 ) )
        {
            self notify( "luinotifyserver", channel, value, value2 );
            return;
        }
        
        self notify( "luinotifyserver", channel, value );
    }
}

// Namespace ui
// Params 1
// Checksum 0xcf98da50, Offset: 0x648
// Size: 0x38
function function_ca488d3659619c7( shouldbevisible = 1 )
{
    asnumeric = shouldbevisible ? 1 : 0;
    setomnvar( "ui_toggle_subtitle_visibility", asnumeric );
}

/#

    // Namespace ui
    // Params 1
    // Checksum 0x1787f5d, Offset: 0x688
    // Size: 0x4f, Type: dev
    function function_898894515d5317e0( channel )
    {
        if ( isdefined( self.var_49f9d03aad9d10b9 ) )
        {
            println( "<dev string:x28>" + self.var_49f9d03aad9d10b9 + "<dev string:x41>" + channel );
        }
        
        self.var_49f9d03aad9d10b9 = channel;
        waittillframeend();
        self.var_49f9d03aad9d10b9 = undefined;
    }

#/
