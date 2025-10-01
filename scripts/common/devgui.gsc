#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace devgui;

/#

    // Namespace devgui
    // Params 0
    // Checksum 0x3396e91a, Offset: 0x7f
    // Size: 0x6c, Type: dev
    function init_devgui()
    {
        if ( !isdefined( level.var_c25fe25f3a6198c3 ) )
        {
            level.var_c25fe25f3a6198c3 = [];
        }
        
        if ( !isdefined( level.var_279e8c0ef2494a66 ) )
        {
            level.var_279e8c0ef2494a66 = [];
        }
        
        if ( !isdefined( level.devgui_threads ) )
        {
            level.devgui_threads = [];
        }
        
        level notify( "<dev string:x24>" );
        level thread monitor_devgui();
        setdevdvarifuninitialized( @"hash_81d89e4abec64203", 0 );
    }

    // Namespace devgui
    // Params 0
    // Checksum 0x353e00ac, Offset: 0xf3
    // Size: 0x206, Type: dev
    function function_b9667fe2ffa90775()
    {
        while ( level.var_3faf24edbc51cefd )
        {
            wait 0.1;
        }
        
        if ( level.var_b9667fe2ffa90775.size == 0 )
        {
            return;
        }
        
        level.var_3faf24edbc51cefd = 1;
        
        if ( !utility::issp() )
        {
            level utility::flag_wait( "<dev string:x3c>" );
        }
        
        if ( getdvarint( @"hash_a16da1867b1c0848", 0 ) == 1 )
        {
            while ( !isdefined( level.players.size ) || level.players.size < getdvarint( @"hash_6ad5a8e0d95c5aa4", 1 ) )
            {
                waitframe();
            }
        }
        else
        {
            while ( !isdefined( level.player ) )
            {
                waitframe();
            }
        }
        
        for ( i = 0; i < level.var_b9667fe2ffa90775.size ; i++ )
        {
            cmd = level.var_b9667fe2ffa90775[ i ];
            cmd += "<dev string:x57>";
            
            while ( !adddebugcommand( cmd ) )
            {
                waitframe();
            }
            
            if ( getdvarint( @"hash_a16da1867b1c0848", 0 ) == 1 && utility::issharedfuncdefined( #"devgui", #"hash_4977958f159a16fc", 0 ) && utility::callsharedfunc( #"game", #"isdedicatedserver" ) )
            {
                foreach ( player in level.players )
                {
                    if ( isdefined( player ) )
                    {
                        while ( !utility::callsharedfunc( #"devgui", #"hash_4977958f159a16fc", player, cmd ) )
                        {
                            wait 1;
                            
                            if ( !isdefined( player ) )
                            {
                                break;
                            }
                        }
                    }
                }
                
                if ( i % 10 == 0 )
                {
                    waitframe();
                }
            }
        }
        
        level.var_3faf24edbc51cefd = undefined;
        level.var_b9667fe2ffa90775 = undefined;
    }

    // Namespace devgui
    // Params 1
    // Checksum 0xba76c7, Offset: 0x301
    // Size: 0x45, Type: dev
    function add_debug_command( cmd )
    {
        if ( !isdefined( level.var_b9667fe2ffa90775 ) )
        {
            level.var_b9667fe2ffa90775 = [];
        }
        
        level.var_b9667fe2ffa90775[ level.var_b9667fe2ffa90775.size ] = cmd;
        thread function_b9667fe2ffa90775();
    }

    // Namespace devgui
    // Params 3
    // Checksum 0xbb4133dc, Offset: 0x34e
    // Size: 0xc6, Type: dev
    function add_devgui_command( path, cmd, index )
    {
        if ( !isdefined( index ) )
        {
            assert( isdefined( level.var_900614a0226892b7 ) );
            index = level.var_900614a0226892b7.index;
            level.var_900614a0226892b7.index++;
        }
        
        if ( isdefined( level.var_900614a0226892b7 ) && isdefined( level.var_900614a0226892b7.base_path ) )
        {
            path = level.var_900614a0226892b7.base_path + path;
        }
        
        thread add_debug_command( "<dev string:x5c>" + path + "<dev string:x6c>" + index + "<dev string:x71>" + cmd + "<dev string:x78>" );
    }

    // Namespace devgui
    // Params 5
    // Checksum 0x9955173, Offset: 0x41c
    // Size: 0x110, Type: dev
    function function_502a7d5e4d9dfa5b( path, name, func, toggle, index )
    {
        if ( !isdefined( index ) )
        {
            assert( isdefined( level.var_900614a0226892b7 ) );
            index = level.var_900614a0226892b7.index;
            level.var_900614a0226892b7.index++;
        }
        
        if ( isdefined( level.var_900614a0226892b7 ) && isdefined( level.var_900614a0226892b7.base_path ) )
        {
            path = level.var_900614a0226892b7.base_path + path;
        }
        
        name = utility::string_replace( name, "<dev string:x7e>", "<dev string:x83>", 100 );
        thread add_debug_command( "<dev string:x5c>" + path + "<dev string:x6c>" + index + "<dev string:x88>" + "<dev string:x95>" + "<dev string:x7e>" + name + "<dev string:x78>" );
        level.var_c25fe25f3a6198c3[ name ] = create_cmd( func, toggle );
    }

    // Namespace devgui
    // Params 3
    // Checksum 0x12d17633, Offset: 0x534
    // Size: 0xc6, Type: dev
    function function_581b7f2e243b8ae4( path, dvar, index )
    {
        if ( !isdefined( index ) )
        {
            assert( isdefined( level.var_900614a0226892b7 ) );
            index = level.var_900614a0226892b7.index;
            level.var_900614a0226892b7.index++;
        }
        
        if ( isdefined( level.var_900614a0226892b7 ) && isdefined( level.var_900614a0226892b7.base_path ) )
        {
            path = level.var_900614a0226892b7.base_path + path;
        }
        
        thread add_debug_command( "<dev string:xa7>" + path + "<dev string:x6c>" + index + "<dev string:xb8>" + dvar + "<dev string:x57>" );
    }

    // Namespace devgui
    // Params 3
    // Checksum 0x2b6eeca4, Offset: 0x602
    // Size: 0xd2, Type: dev
    function function_eaac4ba4b3caf621( path, dvar_xhash, index )
    {
        if ( !isdefined( index ) )
        {
            assert( isdefined( level.var_900614a0226892b7 ) );
            index = level.var_900614a0226892b7.index;
            level.var_900614a0226892b7.index++;
        }
        
        if ( isdefined( level.var_900614a0226892b7 ) && isdefined( level.var_900614a0226892b7.base_path ) )
        {
            path = level.var_900614a0226892b7.base_path + path;
        }
        
        setdevdvarifuninitialized( dvar_xhash, 0 );
        thread add_debug_command( "<dev string:x5c>" + path + "<dev string:x6c>" + index + "<dev string:xbe>" + getxhashsourcename( dvar_xhash ) + "<dev string:xcd>" );
    }

    // Namespace devgui
    // Params 5
    // Checksum 0xb4b097f0, Offset: 0x6dc
    // Size: 0x147, Type: dev
    function function_cd4e263c1f3018ae( path, var_e11b81b22afc5869, func, toggle, index )
    {
        var_e11b81b22afc5869 = utility::string_replace( var_e11b81b22afc5869, "<dev string:x7e>", "<dev string:x83>", 100 );
        params = strtok( var_e11b81b22afc5869, "<dev string:xd7>" );
        name = params[ 0 ];
        params[ 0 ] = undefined;
        
        if ( isint( 0 ) )
        {
            function_cdc669dbc8ea2101( params );
        }
        
        if ( !isdefined( index ) )
        {
            assert( isdefined( level.var_900614a0226892b7 ) );
            index = level.var_900614a0226892b7.index;
            level.var_900614a0226892b7.index++;
        }
        
        if ( isdefined( level.var_900614a0226892b7 ) && isdefined( level.var_900614a0226892b7.base_path ) )
        {
            path = level.var_900614a0226892b7.base_path + path;
        }
        
        thread add_debug_command( "<dev string:x5c>" + path + "<dev string:x6c>" + index + "<dev string:x88>" + "<dev string:x95>" + "<dev string:x7e>" + var_e11b81b22afc5869 + "<dev string:x78>" );
        level.var_279e8c0ef2494a66[ name ] = create_cmd( func, toggle );
    }

    // Namespace devgui
    // Params 1
    // Checksum 0x82d2973c, Offset: 0x82b
    // Size: 0x8d, Type: dev
    function function_9082edeb5db93280( base_path )
    {
        assert( !isdefined( level.var_900614a0226892b7 ), "<dev string:xdc>" );
        
        if ( isdefined( level.var_900614a0226892b7 ) )
        {
            assertmsg( "<dev string:x116>" + level.var_900614a0226892b7.base_path );
        }
        
        level.var_900614a0226892b7 = spawnstruct();
        level.var_900614a0226892b7.index = 0;
        level.var_900614a0226892b7.base_path = base_path;
    }

    // Namespace devgui
    // Params 0
    // Checksum 0x4acdc9d2, Offset: 0x8c0
    // Size: 0x21, Type: dev
    function function_77df7fe7dd273e10()
    {
        assert( isdefined( level.var_900614a0226892b7 ) );
        level.var_900614a0226892b7 = undefined;
    }

    // Namespace devgui
    // Params 0
    // Checksum 0x6b0189b7, Offset: 0x8e9
    // Size: 0xaf, Type: dev
    function function_97024c0a6d1256a6()
    {
        player = level.players[ 0 ];
        player_forward = anglestoforward( player getplayerangles() );
        result = trace::ray_trace( player geteye(), player geteye() + player_forward * 10000 );
        
        if ( isdefined( result[ "<dev string:x13f>" ] ) && isdefined( result[ "<dev string:x14b>" ] ) && result[ "<dev string:x14b>" ] < 1 )
        {
            new_pos = utility::drop_to_ground( result[ "<dev string:x13f>" ] + -1 * player_forward * 32, 24, -300 ) + ( 0, 0, 16 );
            return new_pos;
        }
        
        return undefined;
    }

    // Namespace devgui
    // Params 1
    // Checksum 0xf866db83, Offset: 0x9a0
    // Size: 0x68, Type: dev
    function function_847216deb449a506( params )
    {
        model = params[ 0 ];
        spawn_location = function_97024c0a6d1256a6();
        var_14e04bfa0c8ea51e = getdvarfloat( @"hash_2ae4e76b04454913", 0 );
        spawned_object = spawn( "<dev string:x157>", spawn_location + ( 0, 0, var_14e04bfa0c8ea51e ) );
        spawned_object setmodel( model );
    }

    // Namespace devgui
    // Params 2
    // Checksum 0xd8c00241, Offset: 0xa10
    // Size: 0x43, Type: dev
    function function_3f8a26ec96988e80( dvar, dvar_hash )
    {
        iprintlnbold( "<dev string:x167>" + dvar + "<dev string:x172>" + !getdvarint( dvar_hash, 0 ) );
        setdvar( dvar_hash, !getdvarint( dvar_hash, 0 ) );
    }

    // Namespace devgui
    // Params 1
    // Checksum 0xf0f1cd5d, Offset: 0xa5b
    // Size: 0x2f, Type: dev
    function function_d6e3d253db54504f( name )
    {
        return isdefined( self.devgui_threads ) && isdefined( self ) && isdefined( self.devgui_threads[ name ] );
    }

    // Namespace devgui
    // Params 3
    // Checksum 0x774ab7e4, Offset: 0xa92
    // Size: 0xbb, Type: dev
    function toggle_thread( name, func, params )
    {
        if ( !isdefined( self.devgui_threads ) )
        {
            self.devgui_threads = [];
        }
        
        if ( function_d6e3d253db54504f( name ) )
        {
            self.devgui_threads[ name ] notify( "<dev string:x178>" );
            self.devgui_threads[ name ] = undefined;
            return;
        }
        
        self.devgui_threads[ name ] = spawnstruct();
        self.devgui_threads[ name ] endon( "<dev string:x178>" );
        self.devgui_threads[ name ] endon( "<dev string:x18f>" );
        
        if ( isdefined( params ) )
        {
            [[ func ]]( params );
        }
        else
        {
            [[ func ]]();
        }
        
        self.devgui_threads[ name ] = undefined;
    }

    // Namespace devgui
    // Params 0, eflags: 0x4
    // Checksum 0x44c642d4, Offset: 0xb55
    // Size: 0x164, Type: dev
    function private monitor_devgui()
    {
        level endon( "<dev string:x198>" );
        level endon( "<dev string:x24>" );
        
        while ( true )
        {
            waitframe();
            name = getdvar( @"hash_f8ef099ef036c45e" );
            
            if ( name == "<dev string:x1a6>" )
            {
                continue;
            }
            
            setdvar( @"hash_f8ef099ef036c45e", "<dev string:x1a6>" );
            
            if ( isdefined( level.var_c25fe25f3a6198c3[ name ] ) )
            {
                if ( level.var_c25fe25f3a6198c3[ name ].toggle )
                {
                    level thread toggle_thread( name, level.var_c25fe25f3a6198c3[ name ].func );
                }
                else
                {
                    thread [[ level.var_c25fe25f3a6198c3[ name ].func ]]();
                }
                
                continue;
            }
            
            tokens = strtok( name, "<dev string:xd7>" );
            name = tokens[ 0 ];
            params = arraycopy( tokens );
            params[ 0 ] = undefined;
            
            if ( isint( 0 ) )
            {
                function_cdc669dbc8ea2101( params );
            }
            
            if ( isdefined( level.var_279e8c0ef2494a66[ name ] ) )
            {
                if ( level.var_279e8c0ef2494a66[ name ].toggle )
                {
                    level thread toggle_thread( name, level.var_279e8c0ef2494a66[ name ].func, params );
                    continue;
                }
                
                thread [[ level.var_279e8c0ef2494a66[ name ].func ]]( params );
            }
        }
    }

    // Namespace devgui
    // Params 2, eflags: 0x4
    // Checksum 0x98adcd9d, Offset: 0xcc1
    // Size: 0x48, Type: dev
    function private create_cmd( func, toggle )
    {
        cmd = spawnstruct();
        cmd.func = func;
        cmd.toggle = istrue( toggle );
        return cmd;
    }

#/
