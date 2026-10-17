#using script_315aa86810d944c;
#using script_49e4a4c208f44b76;
#using scripts\common\devgui;

#namespace namespace_4517d7469a87050b;

/#

    // Namespace namespace_4517d7469a87050b
    // Params 0
    // Checksum 0x3847605b, Offset: 0x76
    // Size: 0x89, Type: dev
    function function_8c0c83920890aa02()
    {
        if ( !isdefined( level.var_209702629f5d6123 ) || level.var_209702629f5d6123.size == 0 )
        {
            assertmsg( "<dev string:x24>" );
            return;
        }
        
        level.var_1d7efc3f2b404ad2 = -1;
        thread function_db7ca5669c416406();
        devgui::function_9082edeb5db93280( "<dev string:x69>" );
        devgui::add_devgui_func( "<dev string:x7b>", "<dev string:x8d>", &function_300cdaf1d39b6f7f );
        devgui::add_devgui_func( "<dev string:x9f>", "<dev string:xb7>", &function_cb01460db474536c );
        devgui::function_77df7fe7dd273e10();
        refreshdevgui();
    }

    // Namespace namespace_4517d7469a87050b
    // Params 6
    // Checksum 0x45cbea12, Offset: 0x107
    // Size: 0xae, Type: dev
    function function_90114e43914d1001( tool_name, var_2b07e7738353dabc, var_a3a90d6684f9d940, var_bb3669900976077b, var_f7c78baeb32c76a8, var_17cd793cf25963e9 )
    {
        if ( !isdefined( var_17cd793cf25963e9 ) )
        {
            var_17cd793cf25963e9 = undefined;
        }
        
        if ( !isdefined( level.var_209702629f5d6123 ) )
        {
            level.var_209702629f5d6123 = [];
        }
        
        if ( !isdefined( level.var_209702629f5d6123[ tool_name ] ) )
        {
            level.var_209702629f5d6123[ tool_name ] = { #var_17cd793cf25963e9:var_17cd793cf25963e9, #var_f7c78baeb32c76a8:var_f7c78baeb32c76a8, #var_bb3669900976077b:var_bb3669900976077b, #var_a3a90d6684f9d940:var_a3a90d6684f9d940, #var_2b07e7738353dabc:var_2b07e7738353dabc };
        }
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0xd15c5fbd, Offset: 0x1bd
    // Size: 0x1d3, Type: dev
    function private function_665eca4cab8c3124()
    {
        map_name = game_utility::getmapname();
        fileid = openfileinplayerdirectory( map_name + "<dev string:xcf>" + "<dev string:xd1>", "<dev string:xe1>", "<dev string:xe6>" + "<dev string:xfa>" + map_name );
        file_content = readfileinplayerdirectory( fileid );
        var_e4b8e92ae5b00eac = [];
        current_line = "<dev string:xfc>";
        
        for ( i = 0; i < file_content.size ; i++ )
        {
            if ( ( file_content[ i ] == "<dev string:xfd>" || i == file_content.size - 1 ) && current_line != "<dev string:xfc>" )
            {
                var_e4b8e92ae5b00eac[ var_e4b8e92ae5b00eac.size ] = current_line;
                current_line = "<dev string:xfc>";
                continue;
            }
            
            current_line += file_content[ i ];
        }
        
        var_97d3c7131d9e1be2 = 0;
        var_35d28ed647d22d4b = [];
        var_f1edb88d64312851 = [];
        
        foreach ( line in var_e4b8e92ae5b00eac )
        {
            if ( !var_97d3c7131d9e1be2 && issubstr( line, "<dev string:xff>" ) )
            {
                var_97d3c7131d9e1be2 = 1;
                continue;
            }
            
            if ( issubstr( line, "<dev string:x101>" ) )
            {
                values = strtok( line, "<dev string:x101>" );
                
                if ( values.size == 3 )
                {
                    var_f1edb88d64312851[ values[ 0 ] ] = [ values[ 1 ], values[ 2 ] ];
                }
                
                continue;
            }
            
            if ( issubstr( line, "<dev string:x103>" ) )
            {
                var_97d3c7131d9e1be2 = 0;
                var_35d28ed647d22d4b[ var_35d28ed647d22d4b.size ] = var_f1edb88d64312851;
            }
        }
        
        closefileinplayerdirectory( fileid );
        return var_35d28ed647d22d4b;
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0x30b36b0c, Offset: 0x398
    // Size: 0x220, Type: dev
    function private function_300cdaf1d39b6f7f()
    {
        if ( !isdefined( level.var_209702629f5d6123 ) )
        {
            iprintlnbold( "<dev string:x105>" );
            return 0;
        }
        
        var_f7b77e138be4487c = [];
        
        foreach ( tool_name, file_info in level.var_209702629f5d6123 )
        {
            var_a0395a5fce2f6511 = isdefined( file_info.var_bb3669900976077b ) ? [[ file_info.var_bb3669900976077b ]]() : "<dev string:xfc>";
            var_736f8f3cb903c1ce = namespace_ea83ef75335221dd::function_5847501232705d38( file_info.var_2b07e7738353dabc, file_info.var_a3a90d6684f9d940, var_a0395a5fce2f6511 );
            namespace_ea83ef75335221dd::function_5f9b63ec7a92782b( var_736f8f3cb903c1ce, file_info.var_a3a90d6684f9d940, var_a0395a5fce2f6511 );
            var_f7b77e138be4487c[ tool_name ] = [ var_736f8f3cb903c1ce + file_info.var_a3a90d6684f9d940, var_a0395a5fce2f6511 ];
        }
        
        map_name = game_utility::getmapname();
        fileid = openfileinplayerdirectory( map_name + "<dev string:xcf>" + "<dev string:xd1>", "<dev string:x139>", "<dev string:xe6>" + "<dev string:xfa>" + map_name );
        writelinetofileinplayerdirectory( fileid, "<dev string:xff>" );
        
        foreach ( tool_name, file_info in var_f7b77e138be4487c )
        {
            file_name = file_info[ 0 ];
            file_folder = file_info[ 1 ];
            writelinetofileinplayerdirectory( fileid, tool_name + "<dev string:x101>" + file_name + "<dev string:x101>" + file_folder );
        }
        
        writelinetofileinplayerdirectory( fileid, "<dev string:x103>" );
        closefileinplayerdirectory( fileid );
        iprintlnbold( "<dev string:x140>" );
        refreshdevgui();
    }

    // Namespace namespace_4517d7469a87050b
    // Params 1, eflags: 0x4
    // Checksum 0x426b4be8, Offset: 0x5c0
    // Size: 0x127, Type: dev
    function private function_604447c408b17d7b( group_index )
    {
        var_b82f0e39412db966 = function_665eca4cab8c3124();
        
        if ( group_index < 0 || group_index >= var_b82f0e39412db966.size )
        {
            assertmsg( "<dev string:x162>" );
            return;
        }
        
        var_f1edb88d64312851 = var_b82f0e39412db966[ group_index ];
        
        foreach ( tool_name, tool_struct in level.var_209702629f5d6123 )
        {
            if ( isdefined( var_f1edb88d64312851[ tool_name ] ) )
            {
                var_f7c78baeb32c76a8 = tool_struct.var_f7c78baeb32c76a8;
                file_name = var_f1edb88d64312851[ tool_name ][ 0 ];
                file_folder = var_f1edb88d64312851[ tool_name ][ 1 ];
                
                if ( isdefined( var_f7c78baeb32c76a8 ) )
                {
                    [[ var_f7c78baeb32c76a8 ]]( file_name, file_folder );
                }
            }
        }
        
        level.var_1d7efc3f2b404ad2 = group_index;
        iprintlnbold( "<dev string:x1a7>" + group_index + 1 + "<dev string:x1be>" );
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0x81c1fa0e, Offset: 0x6ef
    // Size: 0xc3, Type: dev
    function private function_bea3108b6bd1e86b()
    {
        map_name = game_utility::getmapname();
        fileid = openfileinplayerdirectory( map_name + "<dev string:xcf>" + "<dev string:xd1>", "<dev string:xe1>", "<dev string:xe6>" + "<dev string:xfa>" + map_name );
        file_content = readfileinplayerdirectory( fileid );
        var_9a6d83274d4c426c = 0;
        var_5489ad31dd8f5929 = 0;
        
        for ( i = 0; i < file_content.size ; i++ )
        {
            if ( !var_9a6d83274d4c426c && file_content[ i ] == "<dev string:xff>" )
            {
                var_9a6d83274d4c426c = 1;
                continue;
            }
            
            if ( var_9a6d83274d4c426c && file_content[ i ] == "<dev string:x103>" )
            {
                var_9a6d83274d4c426c = 0;
                var_5489ad31dd8f5929++;
            }
        }
        
        closefileinplayerdirectory( fileid );
        return var_5489ad31dd8f5929;
    }

    // Namespace namespace_4517d7469a87050b
    // Params 1, eflags: 0x4
    // Checksum 0xb67b0774, Offset: 0x7ba
    // Size: 0x2b, Type: dev
    function private function_4f13c56366926902( params )
    {
        group_index = int( params[ 0 ] );
        function_604447c408b17d7b( group_index );
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0x169de336, Offset: 0x7ed
    // Size: 0xab, Type: dev
    function private function_cb01460db474536c()
    {
        if ( level.var_1d7efc3f2b404ad2 != -1 )
        {
            foreach ( tool_struct in level.var_209702629f5d6123 )
            {
                if ( isdefined( tool_struct.var_17cd793cf25963e9 ) )
                {
                    [[ tool_struct.var_17cd793cf25963e9 ]]();
                }
            }
            
            iprintlnbold( "<dev string:x1c7>" );
        }
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0x7635fbc1, Offset: 0x8a0
    // Size: 0x54, Type: dev
    function private refreshdevgui()
    {
        var_5489ad31dd8f5929 = function_bea3108b6bd1e86b();
        
        for ( i = 0; i < var_5489ad31dd8f5929 ; i++ )
        {
            devgui::function_cd4e263c1f3018ae( "<dev string:x1de>" + i + 1, "<dev string:x1f7>" + i, &function_4f13c56366926902, 0, i + 2 );
        }
    }

    // Namespace namespace_4517d7469a87050b
    // Params 0, eflags: 0x4
    // Checksum 0xf0c5b41e, Offset: 0x8fc
    // Size: 0x61, Type: dev
    function private function_db7ca5669c416406()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            printtoscreen2d( 100, 900, "<dev string:x208>" + ( level.var_1d7efc3f2b404ad2 == -1 ? "<dev string:x226>" : level.var_1d7efc3f2b404ad2 + 1 ), ( 0, 0, 1 ), 1.4, 1 );
            waitframe();
        }
    }

#/
