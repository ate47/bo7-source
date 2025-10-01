#using scripts\engine\utility;

#namespace system;

// Namespace system
// Params 4
// Checksum 0xc7bbc6a6, Offset: 0x14f
// Size: 0x158
function register( str_name, reqs, func_preinit, func_postinit )
{
    print( "<dev string:x24>" + ( isxhash( str_name ) ? getxhashsourcename( str_name ) : str_name ) + "<dev string:x3a>" );
    
    if ( !isdefined( level.system_funcs ) )
    {
        level.system_funcs = [];
    }
    
    if ( isdefined( level.system_funcs[ str_name ] ) )
    {
        /#
            if ( !( level.system_funcs[ str_name ].flags & 1 ) )
            {
                system_error( "<dev string:x40>" + ( isxhash( str_name ) ? getxhashsourcename( str_name ) : str_name ) + "<dev string:x4c>" );
            }
        #/
        
        return;
    }
    
    system = { #flags:0, #reqs:reqs, #postfunc:func_postinit, #prefunc:func_preinit, #systemname:str_name };
    system.flags |= !isdefined( func_preinit ) ? 2 : 0;
    system.flags |= !isdefined( func_postinit ) ? 4 : 0;
    level.system_funcs[ str_name ] = system;
}

// Namespace system
// Params 1
// Checksum 0xc65eb676, Offset: 0x2af
// Size: 0x9a
function ignore( str_name )
{
    if ( !isdefined( level.system_funcs[ str_name ] ) )
    {
        register( str_name );
    }
    
    if ( isdefined( level.system_funcs[ str_name ].prefunc ) && level.system_funcs[ str_name ].flags & 2 )
    {
        system_error( "Ignored systems must be set before pre_main begins for that system, use autoexec to ignore immediately without any waits." );
        return;
    }
    
    level.system_funcs[ str_name ].flags |= 1;
}

// Namespace system/event_7b93597c75b40af7
// Params 0, eflags: 0x20
// Checksum 0x105fe18c, Offset: 0x351
// Size: 0xbd
function event_handler[event_7b93597c75b40af7] function_10e3c751b4555649()
{
    if ( !isdefined( level.system_funcs ) )
    {
        return;
    }
    
    utility::flag_set( "system_preinit_started" );
    
    foreach ( func in level.system_funcs )
    {
        function_3b60b24986df0b24( func );
        
        if ( !( func.flags & 8 ) )
        {
            thread exec_pre_system( func );
        }
    }
    
    utility::flag_set( "system_preinit_complete" );
}

// Namespace system/event_14fc8041665deb8e
// Params 0, eflags: 0x20
// Checksum 0x9b346af4, Offset: 0x416
// Size: 0xbb
function event_handler[event_14fc8041665deb8e] function_10a47e33bee6ee46()
{
    if ( !isdefined( level.system_funcs ) )
    {
        return;
    }
    
    foreach ( func in level.system_funcs )
    {
        function_895434efc7b1807d( func );
        
        if ( !( func.flags & 8 ) )
        {
            thread exec_post_system( func );
        }
    }
    
    level.system_funcs = undefined;
    utility::flag_set( "system_postinit_complete" );
}

// Namespace system
// Params 1, eflags: 0x4
// Checksum 0x73e0670d, Offset: 0x4d9
// Size: 0x1d5
function private exec_post_system( func )
{
    if ( !isdefined( func ) || func.flags & 1 )
    {
        return;
    }
    
    if ( isdefined( func.reqs ) )
    {
        if ( isarray( func.reqs ) )
        {
            foreach ( req in func.reqs )
            {
                if ( level.system_funcs[ req ].flags & 1 )
                {
                    level.system_funcs[ func.systemname ].flags |= 1;
                    return;
                }
            }
        }
        else if ( level.system_funcs[ func.reqs ].flags & 1 )
        {
            level.system_funcs[ func.systemname ].flags |= 1;
            return;
        }
    }
    
    if ( !( func.flags & 4 ) )
    {
        if ( isdefined( func.reqs ) )
        {
            function_895434efc7b1807d( func );
        }
        
        func.flags |= 4;
        [[ func.postfunc ]]();
    }
}

// Namespace system
// Params 1, eflags: 0x4
// Checksum 0x897f13ea, Offset: 0x6b6
// Size: 0x1d5
function private function_895434efc7b1807d( func )
{
    /#
        if ( !( func.flags & 2 || func.flags & 1 ) )
        {
            system_error( "<dev string:x97>" );
            func.flags |= 8;
            return;
        }
    #/
    
    if ( isdefined( func.reqs ) )
    {
        if ( isarray( func.reqs ) )
        {
            foreach ( req in func.reqs )
            {
                /#
                    if ( !isdefined( req ) )
                    {
                        system_error( "<dev string:x103>" + req + "<dev string:x12c>" );
                        func.flags |= 8;
                        continue;
                    }
                #/
                
                thread exec_post_system( level.system_funcs[ req ] );
            }
            
            return;
        }
        
        /#
            if ( !isdefined( level.system_funcs[ func.reqs ] ) )
            {
                system_error( "<dev string:x103>" + ( isxhash( func.reqs ) ? getxhashsourcename( func.reqs ) : func.reqs ) + "<dev string:x12c>" );
                func.flags |= 8;
                return;
            }
        #/
        
        thread exec_post_system( level.system_funcs[ func.reqs ] );
    }
}

// Namespace system
// Params 1, eflags: 0x4
// Checksum 0xd5d01fb, Offset: 0x893
// Size: 0x1d5
function private exec_pre_system( func )
{
    if ( !isdefined( func ) || func.flags & 1 )
    {
        return;
    }
    
    if ( isdefined( func.reqs ) )
    {
        if ( isarray( func.reqs ) )
        {
            foreach ( req in func.reqs )
            {
                if ( level.system_funcs[ req ].flags & 1 )
                {
                    level.system_funcs[ func.systemname ].flags |= 1;
                    return;
                }
            }
        }
        else if ( level.system_funcs[ func.reqs ].flags & 1 )
        {
            level.system_funcs[ func.systemname ].flags |= 1;
            return;
        }
    }
    
    if ( !( func.flags & 2 ) )
    {
        if ( isdefined( func.reqs ) )
        {
            function_3b60b24986df0b24( func );
        }
        
        [[ func.prefunc ]]();
        func.flags |= 2;
    }
}

// Namespace system
// Params 1, eflags: 0x4
// Checksum 0x6314dcf5, Offset: 0xa70
// Size: 0x187
function private function_3b60b24986df0b24( func )
{
    if ( isdefined( func.reqs ) )
    {
        if ( isarray( func.reqs ) )
        {
            foreach ( req in func.reqs )
            {
                /#
                    if ( !isdefined( req ) )
                    {
                        system_error( "<dev string:x103>" + req + "<dev string:x12c>" );
                        func.flags |= 8;
                        continue;
                    }
                #/
                
                thread exec_pre_system( level.system_funcs[ req ] );
            }
            
            return;
        }
        
        /#
            if ( !isdefined( level.system_funcs[ func.reqs ] ) )
            {
                system_error( "<dev string:x103>" + ( isxhash( func.reqs ) ? getxhashsourcename( func.reqs ) : func.reqs ) + "<dev string:x12c>" );
                func.flags |= 8;
                return;
            }
        #/
        
        thread exec_pre_system( level.system_funcs[ func.reqs ] );
    }
}

// Namespace system
// Params 0
// Checksum 0xbf10bdd0, Offset: 0xbff
// Size: 0xf
function function_eca4bddb3f37e51b()
{
    level utility::flag_wait( "system_preinit_complete" );
}

// Namespace system
// Params 0
// Checksum 0x8bc4a82b, Offset: 0xc16
// Size: 0xf
function function_85885b7687429f06()
{
    level utility::flag_wait( "system_postinit_complete" );
}

// Namespace system
// Params 1
// Checksum 0x6f612f08, Offset: 0xc2d
// Size: 0x4c
function system_error( msg )
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515" ) != 0 || getdvarint( @"g_connectpaths" ) != 0 )
        {
            print( "<dev string:x131>" + msg );
            return;
        }
    #/
    
    assertmsg( msg );
}

