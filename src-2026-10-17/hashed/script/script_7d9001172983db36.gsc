#using script_52000d51c914acf6;
#using script_73a03aaf11b641f5;
#using scripts\common\conditional_container;
#using scripts\common\devgui;
#using scripts\mp\ob\systems\region_difficulty_manager;

#namespace ob_activity_manager_debug;

/#

    // Namespace ob_activity_manager_debug
    // Params 0
    // Checksum 0xe1c772a, Offset: 0x76
    // Size: 0x440, Type: dev
    function ob_activity_manager_debug_init()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x33>", "<dev string:x4b>", &toggle_activity_manager );
        devgui::function_cd4e263c1f3018ae( "<dev string:x6a>", "<dev string:x83>", &toggle_activity_manager );
        devgui::add_devgui_func( "<dev string:xa3>", "<dev string:xb3>", &function_3f2e41ac25210d6a, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:xc3>", "<dev string:xdf>" + "<dev string:xf1>", &function_1b08a546cf429908, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:xfa>", "<dev string:xdf>" + "<dev string:x115>", &function_1b08a546cf429908, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x11e>", "<dev string:xdf>" + "<dev string:x13a>", &function_1b08a546cf429908, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x144>", "<dev string:xdf>" + "<dev string:x15c>", &function_1b08a546cf429908, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x163>", "<dev string:xdf>" + "<dev string:x17c>", &function_1b08a546cf429908, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x184>", "<dev string:xdf>" + "<dev string:x19b>", &function_1b08a546cf429908, 1 );
        devgui::add_devgui_func( "<dev string:x1a1>", "<dev string:x1b4>", &draw_all_clear );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1c3>", "<dev string:x1d7>" + "<dev string:xf1>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1e1>", "<dev string:x1d7>" + "<dev string:x115>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1f4>", "<dev string:x1d7>" + "<dev string:x13a>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x208>", "<dev string:x1d7>" + "<dev string:x15c>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x218>", "<dev string:x1d7>" + "<dev string:x17c>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x229>", "<dev string:x1d7>" + "<dev string:x19b>", &function_63075ff0b2066eb4, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x238>", "<dev string:x253>" + "<dev string:xf1>", &function_97dc56eb744618a7, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x264>", "<dev string:x253>" + "<dev string:x115>", &function_97dc56eb744618a7, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x27e>", "<dev string:x253>" + "<dev string:x13a>", &function_97dc56eb744618a7, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x299>", "<dev string:x253>" + "<dev string:x15c>", &function_97dc56eb744618a7, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2b0>", "<dev string:x253>" + "<dev string:x17c>", &function_97dc56eb744618a7, 1 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2c8>", "<dev string:x253>" + "<dev string:x19b>", &function_97dc56eb744618a7, 1 );
        devgui::add_devgui_func( "<dev string:x2de>", "<dev string:x2fb>", &function_2f45c0eebdbed1b0 );
        devgui::add_devgui_func( "<dev string:x318>", "<dev string:x32a>", &function_9a4b2951d8d59842 );
        devgui::add_devgui_command( "<dev string:x33c>", "<dev string:x352>" );
        devgui::add_devgui_command( "<dev string:x360>", "<dev string:x379>" );
        devgui::add_devgui_command( "<dev string:x391>", "<dev string:x3aa>" );
        devgui::add_devgui_command( "<dev string:x3c2>", "<dev string:x3dc>" );
        devgui::add_devgui_command( "<dev string:x3f5>", "<dev string:x416>" );
        devgui::add_devgui_command( "<dev string:x42f>", "<dev string:x44f>" );
        devgui::add_devgui_command( "<dev string:x472>", "<dev string:x492>" );
        devgui::add_devgui_command( "<dev string:x4b5>", "<dev string:x4d6>" );
        devgui::add_devgui_command( "<dev string:x4fa>", "<dev string:x522>" );
        devgui::add_devgui_command( "<dev string:x546>", "<dev string:x56f>" );
        devgui::add_devgui_command( "<dev string:x598>", "<dev string:x5bb>" + 1800 );
        devgui::add_devgui_command( "<dev string:x5dd>", "<dev string:x5fa>" );
        devgui::add_devgui_command( "<dev string:x61d>", "<dev string:x63d>" );
        devgui::add_devgui_command( "<dev string:x663>", "<dev string:x683>" );
        devgui::add_devgui_command( "<dev string:x6a9>", "<dev string:x6c9>" );
        devgui::add_devgui_func( "<dev string:x6ef>", "<dev string:x72f>", &function_aa9c07c628fc74f4 );
        devgui::add_devgui_func( "<dev string:x747>", "<dev string:x76f>", &function_d58694003c170a7 );
        devgui::add_devgui_func( "<dev string:x78f>", "<dev string:x7b7>", &function_39722b523a96331b );
        devgui::add_devgui_func( "<dev string:x7ce>", "<dev string:x807>", &function_1bf7638121fec089 );
        devgui::function_77df7fe7dd273e10();
        level.var_690cc31a674a33ec = spawnstruct();
        level.var_690cc31a674a33ec.updateseconds = 1;
        level thread init_region_debug();
    }

    // Namespace ob_activity_manager_debug
    // Params 2
    // Checksum 0x11e90609, Offset: 0x4be
    // Size: 0x1c5, Type: dev
    function add_debug_activity( activityclass, activitytypename )
    {
        assert( isstring( activityclass ) );
        assert( isstring( activitytypename ) );
        devgui::function_9082edeb5db93280( "<dev string:x826>" + activityclass + "<dev string:x844>" + activitytypename + "<dev string:x844>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x846>", "<dev string:x856>" + activitytypename, &toggle_activity );
        devgui::function_cd4e263c1f3018ae( "<dev string:x86e>", "<dev string:x87f>" + activitytypename, &toggle_activity );
        devgui::function_cd4e263c1f3018ae( "<dev string:x898>", "<dev string:x8af>" + activityclass + "<dev string:x8d0>" + activitytypename, &function_a0675433a861e3ba );
        devgui::function_cd4e263c1f3018ae( "<dev string:x8d2>", "<dev string:x8ee>" + activityclass + "<dev string:x8d0>" + activitytypename, &draw_activity_locations );
        regions = region_difficulty_manager::get_regions();
        
        foreach ( region in regions )
        {
            region_name = getxhashsourcename( region.name );
            devgui::function_cd4e263c1f3018ae( "<dev string:x907>" + region_name, "<dev string:x8ee>" + activityclass + "<dev string:x8d0>" + activitytypename + "<dev string:x8d0>" + region.index, &draw_activity_locations );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:x927>" );
        devgui::add_devgui_command( activityclass + "<dev string:x844>" + activitytypename, "<dev string:x956>" + activitytypename );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x8d32f4af, Offset: 0x68b
    // Size: 0x27f, Type: dev
    function private init_region_debug()
    {
        waittillframeend();
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        regions = region_difficulty_manager::get_regions();
        
        foreach ( region in regions )
        {
            region_name = getxhashsourcename( region.name );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x981>", "<dev string:x98d>" + "<dev string:xf1>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x99e>", "<dev string:x98d>" + "<dev string:x115>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x9a9>", "<dev string:x98d>" + "<dev string:x13a>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x9b5>", "<dev string:x98d>" + "<dev string:x15c>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x9bd>", "<dev string:x98d>" + "<dev string:x17c>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            devgui::function_cd4e263c1f3018ae( "<dev string:x970>" + region_name + "<dev string:x9c6>", "<dev string:x98d>" + "<dev string:x19b>" + "<dev string:x8d0>" + region.index, &function_6c0010c8e3821d1e, 1 );
            
            for ( tier = 1; tier <= 4 ; tier++ )
            {
                devgui::add_devgui_command( "<dev string:x9cd>" + region_name + "<dev string:x9f5>" + tier, "<dev string:x9ff>" + region.index + "<dev string:xa22>" + tier );
                devgui::add_devgui_command( "<dev string:xa24>" + region_name + "<dev string:x9f5>" + tier, "<dev string:xa4c>" + region.index + "<dev string:xa22>" + tier );
            }
        }
        
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x64498551, Offset: 0x912
    // Size: 0x32, Type: dev
    function private function_9a4b2951d8d59842()
    {
        setdvar( @"hash_f87b20273f0955f0", 2147483646 );
        setdvar( @"hash_d431c6b00b5d6b2a", 2147483646 );
        ob_activity_manager::function_991ecaeca9a0bd67();
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x8edd6fa6, Offset: 0x94c
    // Size: 0x49, Type: dev
    function private toggle_activity_manager( params )
    {
        switch ( params[ 0 ] )
        {
            case #"hash_6caf06e2c9e6872e":
                ob_activity_manager::ob_activity_manager_toggle( 1 );
                break;
            case #"hash_c1c88ef798270243":
                ob_activity_manager::ob_activity_manager_toggle( 0 );
                break;
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0xba9dcb45, Offset: 0x99d
    // Size: 0x78, Type: dev
    function private toggle_activity( params )
    {
        activitydvar = hashcat( @"hash_862d7d5538370d45", params[ 1 ] );
        value = getdvarint( activitydvar, 1 );
        
        switch ( params[ 0 ] )
        {
            case #"hash_6caf06e2c9e6872e":
                setdvar( activitydvar, 1 );
                break;
            case #"hash_c1c88ef798270243":
                setdvar( activitydvar, 0 );
                break;
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x6a2ac0a2, Offset: 0xa1d
    // Size: 0xf, Type: dev
    function private function_c27166571e583391( params )
    {
        
    }

    // Namespace ob_activity_manager_debug
    // Params 2, eflags: 0x4
    // Checksum 0x7153bbd5, Offset: 0xa34
    // Size: 0x3fc, Type: dev
    function private draw_activity( activityinstance, runninginstance )
    {
        duration = int( ceil( level.var_690cc31a674a33ec.updateseconds / level.framedurationseconds ) );
        spatialdistance = [[ level.var_690cc31a674a33ec.var_4ba482657d6e1cd3 ]]( @"hash_176090f07a9fa6df", activityinstance.class, 1800 );
        var_a1a6bb023f41f5f0 = ( 0.3, 0.3, 1 );
        spatialzonespheres = spatial_zone_container::function_f7fc3e6c249a8256( activityinstance, "<dev string:xa7e>" );
        
        for ( index = 0; index < spatialzonespheres.size ; index++ )
        {
            SpatialZoneSphere = spatialzonespheres[ index ];
            origin = SpatialZoneSphere.origin;
            radius = SpatialZoneSphere.radius;
            var_e43d97c215c8145e = activityinstance.var_e43d97c215c8145e;
            
            if ( !isdefined( var_e43d97c215c8145e ) || var_e43d97c215c8145e == 0 )
            {
                var_e43d97c215c8145e = "<dev string:xa95>";
            }
            
            print3d( origin + ( 0, 0, 70 ), "<dev string:xa9a>" + activityinstance.type + "<dev string:xaa0>" + activityinstance.name, ( 1, 1, 1 ), 1, 1, duration, 1 );
            print3d( origin + ( 0, 0, 50 ), "<dev string:xaa3>" + activityinstance.region.index + "<dev string:xaad>", ( 1, 1, 1 ), 1, 1, duration, 1 );
            print3d( origin + ( 0, 0, 30 ), "<dev string:xaaf>" + var_e43d97c215c8145e + "<dev string:xaad>", ( 1, 1, 1 ), 1, 1, duration, 1 );
            print3d( origin + ( 0, 0, 10 ), "<dev string:xac2>" + radius, ( 1, 1, 1 ), 1, 1, duration, 1 );
            
            if ( !runninginstance )
            {
                color = ( 0, 1, 0 );
                var_c5d2e876d57a9edc = function_ff133320403c660e( activityinstance );
                
                if ( !var_c5d2e876d57a9edc.result )
                {
                    color = ( 1, 0, 0 );
                }
                
                print3d( origin + ( 0, 0, -10 ), "<dev string:xaca>" + ( var_c5d2e876d57a9edc.result ? "<dev string:xad6>" : var_c5d2e876d57a9edc.reason ), color, 1, 1, duration, 1 );
                
                if ( isdefined( activityinstance.overlapping_activity_name ) )
                {
                    print3d( origin + ( 0, 0, -40 ), "<dev string:xadb>" + activityinstance.overlapping_activity_name + "<dev string:xaed>", color, 1, 1, duration, 1 );
                }
            }
            
            color = ( 1, 0, 0 );
            
            if ( isdefined( runninginstance ) )
            {
                color = ( 0, 1, 0 );
            }
            
            sphere( origin, 30, color, 0, duration );
            cylinder( origin, origin + ( 0, 0, 10 ), radius, color, 0, duration );
            spatialcolor = ( 1, 1, 1 );
            
            if ( spatialzonespheres.size > 1 )
            {
                spatialcolor = var_a1a6bb023f41f5f0;
            }
            
            cylinder( origin, origin + ( 0, 0, 10 ), radius + spatialdistance, spatialcolor, 0, duration );
        }
        
        for ( index = 1; index < spatialzonespheres.size ; index++ )
        {
            var_abd0a558837ea55e = spatialzonespheres[ index - 1 ];
            SpatialZoneSphere = spatialzonespheres[ index ];
            prevorigin = var_abd0a558837ea55e.origin;
            origin = SpatialZoneSphere.origin;
            line( prevorigin, origin, ( 0.8, 0.8, 1 ), 1, 0, duration );
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x7586a8b1, Offset: 0xe38
    // Size: 0x34, Type: dev
    function private function_97dc56eb744618a7( params )
    {
        if ( params.size > 0 )
        {
            setdvar( hashcat( @"hash_1f77ee2c5138ab84", "<dev string:xaf0>" + params[ 0 ] ), 1 );
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x5bda3888, Offset: 0xe74
    // Size: 0x5f, Type: dev
    function private function_2f45c0eebdbed1b0()
    {
        var_4f59973c28f149d6 = [[ level.var_690cc31a674a33ec.var_2ca79148edf22998 ]]( "<dev string:x13a>", undefined, level.players[ 0 ].origin );
        
        if ( isdefined( var_4f59973c28f149d6 ) )
        {
            [[ level.var_690cc31a674a33ec.var_6af90d5c7779f340 ]]( var_4f59973c28f149d6 );
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0xc503463a, Offset: 0xedb
    // Size: 0x6a, Type: dev
    function private function_a0675433a861e3ba( params )
    {
        var_4f59973c28f149d6 = [[ level.var_690cc31a674a33ec.var_2ca79148edf22998 ]]( params[ 0 ], params[ 1 ], level.players[ 0 ].origin );
        
        if ( isdefined( var_4f59973c28f149d6 ) )
        {
            [[ level.var_690cc31a674a33ec.var_6af90d5c7779f340 ]]( var_4f59973c28f149d6 );
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 3, eflags: 0x4
    // Checksum 0x929724bc, Offset: 0xf4d
    // Size: 0x227, Type: dev
    function private function_71735fce19e55b71( type, runningonly, drawregion )
    {
        if ( !isdefined( runningonly ) )
        {
            runningonly = 0;
        }
        
        while ( true )
        {
            foreach ( region, instancetypes in level.var_e607236b193eb0c1.activityinstances[ type ] )
            {
                if ( isdefined( drawregion ) && int( drawregion ) != region )
                {
                    continue;
                }
                
                foreach ( instancetype, instances in instancetypes )
                {
                    foreach ( instancename, instance in instances )
                    {
                        runninginstance = undefined;
                        
                        if ( isdefined( level.var_e607236b193eb0c1.runninginstances[ type ][ region ] ) && isdefined( level.var_e607236b193eb0c1.runninginstances[ type ][ region ][ instancetype ][ instancename ] ) )
                        {
                            runninginstance = level.var_e607236b193eb0c1.runninginstances[ type ][ region ][ instancetype ][ instancename ];
                        }
                        
                        if ( runningonly && !isdefined( runninginstance ) )
                        {
                            continue;
                        }
                        
                        draw_activity( instance, runninginstance );
                    }
                }
            }
            
            wait level.var_690cc31a674a33ec.updateseconds;
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x76f6fef3, Offset: 0x117c
    // Size: 0x14e8, Type: dev
    function private function_3f2e41ac25210d6a()
    {
        while ( true )
        {
            drawscale = getdvarfloat( @"hash_5b0a751f4964d0a0", 1 );
            duration = int( ceil( level.var_690cc31a674a33ec.updateseconds / level.framedurationseconds ) );
            screenx = getdvarfloat( @"hash_49e0b355f90380cf", 800 );
            screeny = getdvarfloat( @"hash_49e0b255f9037e9c", 200 );
            ydelta = 40 * drawscale;
            var_e2dcb71e1ab6584 = 35 * drawscale;
            color = ( 1, 1, 1 );
            scale = 3 * drawscale;
            scalesmall = 2 * drawscale;
            printtoscreen2d( screenx, screeny, "<dev string:xaf3>", color, scale, duration );
            screeny += ydelta;
            var_c2dc8b4f433a8983 = 0;
            
            foreach ( activityinstances in level.var_e607236b193eb0c1.activityinstances )
            {
                foreach ( var_90dd7087ae9e16ad in activityinstances )
                {
                    if ( var_90dd7087ae9e16ad.size > 0 )
                    {
                        var_c2dc8b4f433a8983++;
                    }
                }
            }
            
            printtoscreen2d( screenx, screeny, "<dev string:xb0f>" + var_c2dc8b4f433a8983, color, scale, duration );
            screeny += ydelta;
            globalcount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:x15c>" ].size;
            activitycount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:xf1>" ].size;
            contractcount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:x115>" ].size;
            objectivecount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:x13a>" ].size;
            startupcount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:x17c>" ].size;
            storycount = level.var_e607236b193eb0c1.activityinstances[ "<dev string:x19b>" ].size;
            types = [];
            instances = [];
            regions = region_difficulty_manager::get_regions();
            var_d3bb36ae177d0ea8 = ob_activity_manager::function_13745445d5f57d2a();
            
            foreach ( class in var_d3bb36ae177d0ea8 )
            {
                types[ class ] = [];
                instances[ class ] = 0;
                
                foreach ( region in regions )
                {
                    var_da8ab8eec6dcaddf = level.var_e607236b193eb0c1.activityinstances[ class ][ region.index ];
                    
                    if ( !isdefined( var_da8ab8eec6dcaddf ) )
                    {
                        continue;
                    }
                    
                    foreach ( activitytype, activityinstances in var_da8ab8eec6dcaddf )
                    {
                        types[ class ][ activitytype ] = 1;
                        instances[ class ] += activityinstances.size;
                    }
                }
            }
            
            text = "<dev string:xb1f>" + types[ "<dev string:x15c>" ].size + "<dev string:xaad>";
            text += "<dev string:xb2e>" + types[ "<dev string:xf1>" ].size + "<dev string:xaad>";
            text += "<dev string:xb39>" + types[ "<dev string:x115>" ].size + "<dev string:xaad>";
            text += "<dev string:xb44>" + types[ "<dev string:x13a>" ].size + "<dev string:xaad>";
            text += "<dev string:xb50>" + types[ "<dev string:x17c>" ].size + "<dev string:xaad>";
            text += "<dev string:xb5a>" + types[ "<dev string:x19b>" ].size + "<dev string:xaad>";
            printtoscreen2d( screenx, screeny, text, color, scale, duration );
            screeny += ydelta;
            text = "<dev string:xb62>" + instances[ "<dev string:x15c>" ] + "<dev string:xaad>";
            text += "<dev string:xb2e>" + instances[ "<dev string:xf1>" ] + "<dev string:xaad>";
            text += "<dev string:xb39>" + instances[ "<dev string:x115>" ] + "<dev string:xaad>";
            text += "<dev string:xb44>" + instances[ "<dev string:x13a>" ] + "<dev string:xaad>";
            text += "<dev string:xb50>" + instances[ "<dev string:x17c>" ] + "<dev string:xaad>";
            text += "<dev string:xb5a>" + instances[ "<dev string:x19b>" ] + "<dev string:xaad>";
            printtoscreen2d( screenx, screeny, text, color, scale, duration );
            screeny += ydelta;
            difficulties = [ "<dev string:xb75>", "<dev string:xb85>", "<dev string:xb97>", "<dev string:xba7>", "<dev string:xbbd>", "<dev string:xbc9>" ];
            var_c01e20158626cb33 = [];
            
            foreach ( class in var_d3bb36ae177d0ea8 )
            {
                var_ab639a14511123ca = [];
                
                foreach ( difficulty in difficulties )
                {
                    var_ab639a14511123ca[ difficulty ] = [[ level.var_690cc31a674a33ec.var_951b233930b84b8b ]]( class, difficulty );
                }
                
                var_c01e20158626cb33[ class ] = var_ab639a14511123ca;
            }
            
            instances = [];
            maxactivities = [];
            
            foreach ( class in var_d3bb36ae177d0ea8 )
            {
                instances[ class ] = 0;
                maxactivities[ class ] = [[ level.var_690cc31a674a33ec.var_7616efc8d41fe063 ]]( class );
                
                foreach ( region in regions )
                {
                    var_da8ab8eec6dcaddf = level.var_e607236b193eb0c1.runninginstances[ class ][ region.index ];
                    
                    if ( !isdefined( var_da8ab8eec6dcaddf ) )
                    {
                        continue;
                    }
                    
                    foreach ( activitytype, activityinstances in var_da8ab8eec6dcaddf )
                    {
                        instances[ class ] += activityinstances.size;
                    }
                }
            }
            
            text = "<dev string:xbd5>" + instances[ "<dev string:x15c>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:x15c>" ] + "<dev string:xaad>";
            text += "<dev string:xb2e>" + instances[ "<dev string:xf1>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:xf1>" ] + "<dev string:xaad>";
            text += "<dev string:xbec>" + instances[ "<dev string:x115>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:x115>" ] + "<dev string:xaad>";
            printtoscreen2d( screenx, screeny, text, color, scale, duration );
            screeny += ydelta;
            text = "<dev string:xb44>" + instances[ "<dev string:x13a>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:x13a>" ] + "<dev string:xaad>";
            text += "<dev string:xb50>" + instances[ "<dev string:x17c>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:x17c>" ] + "<dev string:xaad>";
            text += "<dev string:xb5a>" + instances[ "<dev string:x19b>" ] + "<dev string:xbe6>" + maxactivities[ "<dev string:x19b>" ] + "<dev string:xaad>";
            printtoscreen2d( screenx, screeny, text, color, scale, duration );
            screeny += ydelta;
            text = "<dev string:xbfa>";
            printtoscreen2d( screenx, screeny, text, color, scale, duration );
            screeny += ydelta;
            
            foreach ( class in var_d3bb36ae177d0ea8 )
            {
                text = "<dev string:xc0e>" + class + "<dev string:xc13>";
                printtoscreen2d( screenx, screeny, text, color, scalesmall, duration );
                var_ab639a14511123ca = var_c01e20158626cb33[ class ];
                runningactivities = [];
                runningactivities[ "<dev string:xb75>" ] = 0;
                runningactivities[ "<dev string:xb85>" ] = 0;
                runningactivities[ "<dev string:xb97>" ] = 0;
                runningactivities[ "<dev string:xba7>" ] = 0;
                runningactivities[ "<dev string:xbbd>" ] = 0;
                runningactivities[ "<dev string:xbc9>" ] = 0;
                
                foreach ( region in regions )
                {
                    regiondifficulty = region_difficulty_manager::function_d2213de17e7b3faf( region );
                    
                    if ( !isdefined( runningactivities[ regiondifficulty ] ) )
                    {
                        continue;
                    }
                    
                    var_da8ab8eec6dcaddf = level.var_e607236b193eb0c1.runninginstances[ class ][ region.index ];
                    
                    foreach ( activityinstances in var_da8ab8eec6dcaddf )
                    {
                        runningactivities[ regiondifficulty ] += activityinstances.size;
                    }
                }
                
                text = "<dev string:xc15>" + runningactivities[ "<dev string:xb75>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xb75>" ] + "<dev string:xc22>";
                text += "<dev string:xc26>" + runningactivities[ "<dev string:xb85>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xb85>" ] + "<dev string:xc22>";
                text += "<dev string:xc2e>" + runningactivities[ "<dev string:xb97>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xb97>" ] + "<dev string:xc22>";
                text += "<dev string:xc36>" + runningactivities[ "<dev string:xba7>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xba7>" ] + "<dev string:xc3b>";
                text += "<dev string:xc3e>" + runningactivities[ "<dev string:xbbd>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xbbd>" ] + "<dev string:xc3b>";
                text += "<dev string:xc3e>" + runningactivities[ "<dev string:xbc9>" ] + "<dev string:xc1c>" + var_ab639a14511123ca[ "<dev string:xbc9>" ] + "<dev string:xc3b>";
                printtoscreen2d( screenx + 500, screeny, text, color, scalesmall, duration );
                screeny += var_e2dcb71e1ab6584;
            }
            
            screeny += ydelta / 2;
            printtoscreen2d( screenx, screeny, "<dev string:xc49>", color, scale, duration );
            screeny += ydelta;
            
            foreach ( region in regions )
            {
                runningcount = [];
                runningmax = [];
                
                foreach ( class in var_d3bb36ae177d0ea8 )
                {
                    runningcount[ class ] = 0;
                    var_da8ab8eec6dcaddf = level.var_e607236b193eb0c1.runninginstances[ class ][ region.index ];
                    
                    if ( !isdefined( var_da8ab8eec6dcaddf ) )
                    {
                        continue;
                    }
                    
                    foreach ( activitytype, activityinstances in var_da8ab8eec6dcaddf )
                    {
                        runningcount[ class ] += activityinstances.size;
                    }
                    
                    runningmax[ class ] = [[ level.var_690cc31a674a33ec.var_82fb757e69918800 ]]( class, region.index );
                }
                
                text = "<dev string:xc0e>" + region.index;
                printtoscreen2d( screenx, screeny, text, color, scalesmall, duration );
                text = "<dev string:xc57>" + runningcount[ "<dev string:x15c>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:x15c>" ] + "<dev string:xaad>";
                text += "<dev string:xb2e>" + runningcount[ "<dev string:xf1>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:xf1>" ] + "<dev string:xaad>";
                text += "<dev string:xb39>" + runningcount[ "<dev string:x115>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:x115>" ] + "<dev string:xaad>";
                printtoscreen2d( screenx + 500, screeny, text, color, scalesmall, duration );
                text = "<dev string:xb44>" + runningcount[ "<dev string:x13a>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:x13a>" ] + "<dev string:xaad>";
                text += "<dev string:xb50>" + runningcount[ "<dev string:x17c>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:x17c>" ] + "<dev string:xaad>";
                text += "<dev string:xb5a>" + runningcount[ "<dev string:x19b>" ] + "<dev string:xc1c>" + runningmax[ "<dev string:x19b>" ] + "<dev string:xaad>";
                printtoscreen2d( screenx + 1400, screeny, text, color, scalesmall, duration );
                screeny += var_e2dcb71e1ab6584;
            }
            
            printtoscreen2d( screenx, screeny, "<dev string:xc5f>", color, scale, duration );
            screeny += ydelta;
            instances = [];
            
            foreach ( class in var_d3bb36ae177d0ea8 )
            {
                foreach ( region in regions )
                {
                    var_da8ab8eec6dcaddf = level.var_e607236b193eb0c1.activityinstances[ class ][ region.index ];
                    
                    if ( !isdefined( var_da8ab8eec6dcaddf ) )
                    {
                        continue;
                    }
                    
                    regiondifficulty = region_difficulty_manager::function_d2213de17e7b3faf( region );
                    
                    foreach ( activitytype, activityinstances in var_da8ab8eec6dcaddf )
                    {
                        if ( !isdefined( instances[ activitytype ] ) )
                        {
                            instances[ activitytype ] = [];
                        }
                        
                        if ( !instances[ activitytype ][ regiondifficulty ] )
                        {
                            firstkey = getfirstarraykey( activityinstances );
                            activityinstance = activityinstances[ firstkey ];
                            var_ba149d56564d95a2 = { #total:0, #running:0 };
                            var_818ba7046423598a = 0;
                            
                            switch ( regiondifficulty )
                            {
                                case #"hash_7bb2cd766703d463":
                                    var_818ba7046423598a = activityinstance.var_622af9ed9146813f.var_82f0a81c6ed90196 ?? 0;
                                    break;
                                case #"hash_af83e47edfa8900a":
                                    var_818ba7046423598a = activityinstance.var_622af9ed9146813f.var_a45684d4dd42dab7 ?? 0;
                                    break;
                                case #"hash_5343b465e56ec9a4":
                                    var_818ba7046423598a = activityinstance.var_622af9ed9146813f.var_4ea88511f05a95a9 ?? 0;
                                    break;
                                case #"hash_651f76c0ad6741ec":
                                    var_818ba7046423598a = activityinstance.var_622af9ed9146813f.var_19e7fc6c8d9b1706 ?? 0;
                                    break;
                                case #"hash_c0250ffc2e87f2ff":
                                case #"hash_c02510fc2e87f492":
                                    var_818ba7046423598a = 0;
                                    break;
                                default:
                                    var_818ba7046423598a = 2147483647;
                                    break;
                            }
                            
                            var_ba149d56564d95a2.maxrunning = var_818ba7046423598a;
                            var_ba149d56564d95a2.var_88c1322ea53298af = activityinstance.var_622af9ed9146813f.var_a378375361078de8 ?? 0;
                            instances[ activitytype ][ regiondifficulty ] = var_ba149d56564d95a2;
                        }
                        else
                        {
                            var_ba149d56564d95a2 = instances[ activitytype ][ regiondifficulty ];
                        }
                        
                        var_ba149d56564d95a2.total += activityinstances.size;
                        var_ba149d56564d95a2.running += level.var_e607236b193eb0c1.runninginstances[ class ][ region.index ][ activitytype ].size ?? 0;
                    }
                }
            }
            
            var_9cedca44aef6645 = [];
            var_9cedca44aef6645[ "<dev string:xb75>" ] = "<dev string:xc8e>";
            var_9cedca44aef6645[ "<dev string:xb85>" ] = "<dev string:xc94>";
            var_9cedca44aef6645[ "<dev string:xb97>" ] = "<dev string:xc9b>";
            var_9cedca44aef6645[ "<dev string:xba7>" ] = "<dev string:xca2>";
            var_9cedca44aef6645[ "<dev string:xbbd>" ] = "<dev string:xca6>";
            var_9cedca44aef6645[ "<dev string:xbc9>" ] = "<dev string:xca6>";
            
            foreach ( activitytype, var_1b5090cce2037d34 in instances )
            {
                text = "<dev string:xc0e>" + activitytype + "<dev string:xc13>";
                printtoscreen2d( screenx, screeny, text, color, scalesmall, duration );
                text = "<dev string:xcb0>";
                total = 0;
                totalrunning = 0;
                var_2590475dcdac2c9b = 0;
                
                foreach ( regionname, regioncolor in var_9cedca44aef6645 )
                {
                    regioninfo = var_1b5090cce2037d34[ regionname ];
                    
                    if ( regioninfo )
                    {
                        text += regioncolor + "<dev string:xcb1>" + regioninfo.running + "<dev string:x844>" + regioninfo.maxrunning + "<dev string:x844>" + regioninfo.total + "<dev string:xcb3>";
                        total += regioninfo.total;
                        totalrunning += regioninfo.running;
                        var_2590475dcdac2c9b = regioninfo.var_88c1322ea53298af;
                    }
                }
                
                text = "<dev string:xc57>" + totalrunning + "<dev string:x844>" + var_2590475dcdac2c9b + "<dev string:x844>" + total + "<dev string:xcb3>" + text;
                printtoscreen2d( screenx + 500, screeny, text, color, scalesmall, duration );
                screeny += var_e2dcb71e1ab6584;
            }
            
            wait level.var_690cc31a674a33ec.updateseconds;
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x1bb06a15, Offset: 0x266c
    // Size: 0x19, Type: dev
    function private function_63075ff0b2066eb4( params )
    {
        function_71735fce19e55b71( params[ 0 ] );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x7081bda3, Offset: 0x268d
    // Size: 0x1b, Type: dev
    function private function_1b08a546cf429908( params )
    {
        function_71735fce19e55b71( params[ 0 ], 1 );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x7d6d5fb5, Offset: 0x26b0
    // Size: 0x1e, Type: dev
    function private function_6c0010c8e3821d1e( params )
    {
        function_71735fce19e55b71( params[ 0 ], undefined, params[ 1 ] );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0xfa687bf0, Offset: 0x26d6
    // Size: 0x25, Type: dev
    function private function_3429c06a250b6d6b( name )
    {
        if ( devgui::is_toggle_thread_active( name ) )
        {
            devgui::toggle_thread( name, undefined, undefined );
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x9dc5a3f3, Offset: 0x2703
    // Size: 0x29, Type: dev
    function private draw_all_clear()
    {
        function_3429c06a250b6d6b( "<dev string:xcb6>" );
        function_3429c06a250b6d6b( "<dev string:xcbf>" );
        function_3429c06a250b6d6b( "<dev string:xcd0>" );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x5402e76c, Offset: 0x2734
    // Size: 0x2cd, Type: dev
    function private function_bde1de5cb3a34b5( params )
    {
        level notify( #"hash_216af15c068f5116" );
        level endon( #"hash_216af15c068f5116" );
        activityclass = params[ 0 ];
        activitytype = params[ 1 ];
        
        if ( params[ 2 ] )
        {
            drawregion = int( params[ 2 ] );
        }
        
        var_d7d0ed0249be9f01 = activityclass + "<dev string:xaf0>" + activitytype + "<dev string:xaf0>" + ( drawregion ?? "<dev string:xce0>" );
        
        if ( level.var_690cc31a674a33ec.var_e792ba8e70c5dcc9 == var_d7d0ed0249be9f01 )
        {
            level.var_690cc31a674a33ec.var_e792ba8e70c5dcc9 = undefined;
            return;
        }
        
        level.var_690cc31a674a33ec.var_e792ba8e70c5dcc9 = var_d7d0ed0249be9f01;
        regions = region_difficulty_manager::get_regions();
        
        while ( true )
        {
            foreach ( region in regions )
            {
                if ( isdefined( drawregion ) && drawregion != region.index )
                {
                    continue;
                }
                
                if ( !isdefined( level.var_e607236b193eb0c1.activityinstances[ activityclass ][ region.index ] ) )
                {
                    continue;
                }
                
                instances = level.var_e607236b193eb0c1.activityinstances[ activityclass ][ region.index ][ activitytype ];
                
                if ( !isdefined( instances ) )
                {
                    continue;
                }
                
                foreach ( instancename, instance in instances )
                {
                    runninginstance = undefined;
                    
                    if ( isdefined( level.var_e607236b193eb0c1.runninginstances[ activityclass ][ region.index ] ) && isdefined( level.var_e607236b193eb0c1.runninginstances[ activityclass ][ region.index ][ activitytype ][ instancename ] ) )
                    {
                        runninginstance = level.var_e607236b193eb0c1.runninginstances[ activityclass ][ region.index ][ activitytype ][ instancename ];
                    }
                    
                    draw_activity( instance, runninginstance );
                }
            }
            
            wait level.var_690cc31a674a33ec.updateseconds;
        }
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x476c80f2, Offset: 0x2a09
    // Size: 0x19, Type: dev
    function private draw_activity_locations( params )
    {
        level thread function_bde1de5cb3a34b5( params );
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x891f95e6, Offset: 0x2a2a
    // Size: 0x1a, Type: dev
    function private function_aa9c07c628fc74f4()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xce4>", @"hash_6a0e07eedeb242f8" );
    }

    // Namespace ob_activity_manager_debug
    // Params 0, eflags: 0x4
    // Checksum 0x710fccdc, Offset: 0x2a4c
    // Size: 0x1a, Type: dev
    function private function_d58694003c170a7()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xcff>", @"hash_7ac6de63251d9ee7" );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0xa4f3436c, Offset: 0x2a6e
    // Size: 0x24, Type: dev
    function private function_39722b523a96331b( params )
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xd21>", @"hash_2d8c42c7641d527" );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x9a493e66, Offset: 0x2a9a
    // Size: 0x24, Type: dev
    function private function_1bf7638121fec089( params )
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xd4a>", @"hash_733e510cb68e45a1" );
    }

    // Namespace ob_activity_manager_debug
    // Params 1, eflags: 0x4
    // Checksum 0x2ac849ea, Offset: 0x2ac6
    // Size: 0x1a3, Type: dev
    function private function_ff133320403c660e( var_657a3abce2509b48 )
    {
        reason = undefined;
        
        do
        {
            activityclass = var_657a3abce2509b48.class;
            activitytype = var_657a3abce2509b48.type;
            activityregion = var_657a3abce2509b48.region;
            var_e9ae32332b932ccd = level.var_e607236b193eb0c1.var_c766f06b2812bf7a;
            regioninformation = { #activitycategory:activityclass, #region:activityregion };
            result = conditional_container::function_fc04dbbd557e99c1( var_e9ae32332b932ccd, regioninformation );
            
            if ( !result.var_2060d7fd72693be3 )
            {
                reason = result.var_59e679186bcfdb0f;
                break;
            }
            
            var_93dfdf8e6abcde58 = level.var_e607236b193eb0c1.var_d6a1cfbd96259eca;
            var_cce758510a6ac8d3 = { #activitycategory:activityclass, #region:activityregion, #activitytype:activitytype };
            result = conditional_container::function_fc04dbbd557e99c1( var_93dfdf8e6abcde58, var_cce758510a6ac8d3 );
            
            if ( !result.var_2060d7fd72693be3 )
            {
                reason = result.var_59e679186bcfdb0f;
                break;
            }
            
            var_cfeca12531a2f64e = level.var_e607236b193eb0c1.var_f1f909264aebf6e3;
            result = conditional_container::function_fc04dbbd557e99c1( var_cfeca12531a2f64e, var_657a3abce2509b48 );
            
            if ( !result.var_2060d7fd72693be3 )
            {
                reason = result.var_59e679186bcfdb0f;
                break;
            }
        }
        while ( false );
        
        return { #reason:reason, #result:!isdefined( reason ) };
    }

#/
