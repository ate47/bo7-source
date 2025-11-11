#using scripts\common\devgui;
#using scripts\common\scene;
#using scripts\common\scene_internal;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace scene_debug;

/#

    // Namespace scene_debug
    // Params 0
    // Checksum 0xebf894e6, Offset: 0xa8
    // Size: 0x13c, Type: dev
    function function_194590af69906dd3()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        setdvarifuninitialized( @"hash_559926a6436db818", "<dev string:x24>" );
        setdvarifuninitialized( @"hash_1aa832f211c5245e", 0 );
        setdvarifuninitialized( @"scr_debug_scene", 0 );
        setdvarifuninitialized( @"hash_143b0dff4afbd1d3", 0 );
        setdvarifuninitialized( @"hash_71fb5222b333d146", "<dev string:x24>" );
        setdvarifuninitialized( @"hash_54fd90073299424e", 0 );
        setdvarifuninitialized( @"hash_f98fc73c88850645", 0 );
        setdvarifuninitialized( @"hash_d0761d5c3f9e3bf", 0 );
        setdvarifuninitialized( @"hash_373ad6363da1c230", ( 0, 0, 0 ) );
        setdvarifuninitialized( @"hash_eab41865eb0e96ea", ( 0, 0, 0 ) );
        setdvarifuninitialized( @"hash_7dda2ca8e979b1b2", 0 );
        setdvarifuninitialized( @"hash_b279d32f047f16db", 0 );
        setdvarifuninitialized( @"hash_85e2888324463ba", 1 );
        setdvarifuninitialized( @"hash_b95e70dfa43a9845", 1 );
        setdvarifuninitialized( @"hash_bc2179c6aea6636d", "<dev string:x24>" );
        setdvarifuninitialized( @"hash_778fd26081328e2f", "<dev string:x24>" );
        level thread debug_scenes();
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0x9c64e5d8, Offset: 0x1ec
    // Size: 0xd9, Type: dev
    function register()
    {
        if ( !getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
        {
            return;
        }
        
        sceneroot = self;
        assert( isstruct( sceneroot.scenedata ) );
        
        if ( isdefined( level.scene.debuglist ) )
        {
            level.scene.debuglist.debuglistlast = sceneroot.scenedata;
        }
        
        sceneroot.scenedata.debuglistnext = level.scene.debuglist;
        sceneroot.scenedata.debuglistlast = undefined;
        level.scene.debuglist = sceneroot.scenedata;
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0xcbcc5af9, Offset: 0x2cd
    // Size: 0xff, Type: dev
    function unregister()
    {
        if ( !getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
        {
            return;
        }
        
        sceneroot = self;
        assert( isstruct( sceneroot.scenedata ) );
        
        if ( isdefined( sceneroot.scenedata.debuglistlast ) )
        {
            sceneroot.scenedata.debuglistlast.debuglistnext = sceneroot.scenedata.debuglistnext;
        }
        
        if ( level.scene.debuglist == sceneroot.scenedata )
        {
            level.scene.debuglist = sceneroot.scenedata.debuglistnext;
        }
        
        sceneroot.scenedata.debuglistlast = undefined;
        sceneroot.scenedata.debuglistnext = undefined;
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0xcf82ed5c, Offset: 0x3d4
    // Size: 0x11e, Type: dev
    function private debug_scenes()
    {
        while ( !( isdefined( level.player ) && isdefined( level.scene ) ) )
        {
            waitframe();
        }
        
        wait 0.5;
        level.scene.debug_player = level.player;
        level.scene.debug_player thread function_885778f4c26a57ba( "<dev string:x28>" );
        level.scene.debug_player thread function_885778f4c26a57ba( "<dev string:x33>" );
        level.scene.debug_player thread function_885778f4c26a57ba( "<dev string:x40>" );
        level.scene.debug_player thread function_885778f4c26a57ba( "<dev string:x4b>" );
        function_146b8cea02a5a4eb();
        function_52f6223b9b56681b();
        devgui::function_9082edeb5db93280( "<dev string:x58>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x69>", "<dev string:x7c>", &function_bd0ab793e83b94ef, 0, 1 );
        devgui::function_502a7d5e4d9dfa5b( "<dev string:x8f>", "<dev string:x9d>", &scene_menu, 0, 2 );
        devgui::function_77df7fe7dd273e10();
        level thread function_e7e798bd060cf03d();
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x26192b63, Offset: 0x4fa
    // Size: 0xef, Type: dev
    function private function_52f6223b9b56681b()
    {
        var_e29b675e10b7ca10 = [];
        
        foreach ( s_scene in level.var_8b929db1c0421d07 )
        {
            if ( function_ba02ac76b97863b8( s_scene.script_scenescriptbundle ) && !s_scene.var_b8d0b3148ac4e533 )
            {
                if ( isdefined( var_e29b675e10b7ca10[ s_scene.script_scenescriptbundle ] ) )
                {
                    var_e29b675e10b7ca10[ s_scene.script_scenescriptbundle ]++;
                }
                else
                {
                    var_e29b675e10b7ca10[ s_scene.script_scenescriptbundle ] = 1;
                }
                
                s_scene.var_d69404e803a096ca = var_e29b675e10b7ca10[ s_scene.script_scenescriptbundle ];
            }
        }
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x785c3bad, Offset: 0x5f1
    // Size: 0xab, Type: dev
    function private function_ba02ac76b97863b8( str_scene_name )
    {
        n_count = 0;
        
        foreach ( s_scene in level.var_8b929db1c0421d07 )
        {
            if ( s_scene.script_scenescriptbundle == str_scene_name )
            {
                n_count++;
            }
        }
        
        if ( n_count > 1 )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0xdb08bfe4, Offset: 0x6a4
    // Size: 0x3d, Type: dev
    function private function_e7e798bd060cf03d()
    {
        while ( true )
        {
            waitframe();
            
            if ( !getdvarint( @"scr_debug_scene", 0 ) && !getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
            {
                continue;
            }
            
            function_835db787656b0e9c();
        }
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0xf26e260, Offset: 0x6e9
    // Size: 0x316, Type: dev
    function private function_835db787656b0e9c()
    {
        countscene = 0;
        countobject = 0;
        countshot = 0;
        countbundle = 0;
        walk = level.scene.debuglist;
        
        if ( isdefined( level.globalbundles ) )
        {
            countbundle = level.globalbundles.size;
        }
        
        roots = [];
        
        while ( isdefined( walk ) )
        {
            countscene++;
            
            if ( getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
            {
                roots[ roots.size ] = spawnstruct();
                roots[ roots.size - 1 ].sceneroot = walk.sceneroot;
            }
            
            scenescriptbundle = walk.sceneroot scene::scene_scriptbundle();
            sceneshots = scenescriptbundle scene::function_30fd977cf5a4a95e();
            sceneobjects = scenescriptbundle scene::function_bd663a9606d90ac1();
            
            if ( getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
            {
                roots[ roots.size - 1 ].sceneshots = sceneshots;
                roots[ roots.size - 1 ].sceneobjects = sceneobjects;
            }
            
            countshot += sceneshots;
            countobject += sceneobjects;
            walk = walk.debuglistnext;
        }
        
        if ( getdvarint( @"hash_7dda2ca8e979b1b2", 0 ) )
        {
            roots = arraysort( roots, undefined, &function_2f7c63e77b293fe7 );
            
            foreach ( root in roots )
            {
                state = root.sceneroot scene::get_state();
                strorigin = "<dev string:xab>" + int( root.sceneroot.origin[ 0 ] ) + "<dev string:xb1>" + int( root.sceneroot.origin[ 1 ] ) + "<dev string:xb1>" + int( root.sceneroot.origin[ 2 ] ) + "<dev string:xb7>";
                strstate = isdefined( state ) ? state : "<dev string:xbd>";
                print( root.sceneroot.script_scenescriptbundle + "<dev string:xce>" + strstate + "<dev string:xd6>" + strorigin + "<dev string:xdb>" + root.sceneshots + "<dev string:xe6>" + root.sceneobjects );
            }
        }
        
        setdvar( @"hash_7dda2ca8e979b1b2", 0 );
        printtoscreen2d( 50, 60, "<dev string:xf3>" + countscene + "<dev string:xff>" + countshot + "<dev string:x10b>" + countobject + "<dev string:x119>" + countbundle, ( 1, 1, 1 ), 1 );
    }

    // Namespace scene_debug
    // Params 2, eflags: 0x4
    // Checksum 0x6ec9da56, Offset: 0xa07
    // Size: 0x49, Type: dev
    function private function_2f7c63e77b293fe7( a, b )
    {
        return stricmp( a.sceneroot.script_scenescriptbundle, b.sceneroot.script_scenescriptbundle ) < 0;
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x31f1fce4, Offset: 0xa58
    // Size: 0x179, Type: dev
    function private function_146b8cea02a5a4eb()
    {
        if ( !isdefined( level.var_18c87c2c4c3b0a2d ) )
        {
            level.var_18c87c2c4c3b0a2d = [];
        }
        
        var_851c384140f3d1c8 = getscriptbundlenames( "<dev string:x127>" );
        
        foreach ( var_4354777780bb3457 in var_851c384140f3d1c8 )
        {
            s_scenedef = getscriptbundle( var_4354777780bb3457 );
            str_scene_name = strtok( getxhashsourcename( var_4354777780bb3457 ), "<dev string:x13c>" );
            str_scene_name = str_scene_name[ 1 ];
            
            if ( !isdefined( str_scene_name ) )
            {
                continue;
            }
            
            if ( !arraycontains( level.var_18c87c2c4c3b0a2d, str_scene_name ) )
            {
                level.var_18c87c2c4c3b0a2d = arraycombineunique( level.var_18c87c2c4c3b0a2d, [ str_scene_name ] );
                s_scene = spawnstruct();
                s_scene.script_scenescriptbundle = str_scene_name;
                s_scene.origin = ( 0, 0, 0 );
                s_scene.angles = ( 0, 0, 0 );
                s_scene.var_b8d0b3148ac4e533 = 1;
                level.var_8b929db1c0421d07 = arraycombineunique( level.var_8b929db1c0421d07, [ s_scene ] );
            }
        }
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x85a2dcbf, Offset: 0xbd9
    // Size: 0x4e, Type: dev
    function private function_bd0ab793e83b94ef( params )
    {
        if ( params[ 0 ] == "<dev string:x141>" || !utility::flag( "<dev string:x14b>" ) )
        {
            utility::flag_set( "<dev string:x14b>" );
            level thread function_3c59aa392ac39dcc();
            return;
        }
        
        utility::flag_clear( "<dev string:x14b>" );
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x9b7cd17f, Offset: 0xc2f
    // Size: 0x632, Type: dev
    function private function_3c59aa392ac39dcc( params )
    {
        level notify( "<dev string:x165>" );
        level endon( "<dev string:x165>" );
        var_8d60da971d96ac26 = ( 0.8, 0.8, 0 );
        var_2baf6b7eee00cea7 = ( 0.8, 0, 0.8 );
        
        while ( utility::flag( "<dev string:x14b>" ) )
        {
            foreach ( s_scene in level.var_8b929db1c0421d07 )
            {
                var_6d822273ed66b680 = s_scene scene::get_state();
                a_ents = s_scene scene::get_entities();
                str_scene_name = isdefined( s_scene.var_d69404e803a096ca ) ? s_scene.script_scenescriptbundle + "<dev string:x180>" + s_scene.var_d69404e803a096ca : s_scene.script_scenescriptbundle;
                print3d( s_scene.origin, "<dev string:x185>" + getxhashsourcename( str_scene_name ), ( 0.8, 0, 0.8 ), 0.8, 0.2 );
                print3d( s_scene.origin + ( 0, 0, -5 ), "<dev string:x190>" + var_6d822273ed66b680, ( 0.8, 0, 0.8 ), 0.8, 0.2 );
                
                foreach ( ent in a_ents )
                {
                    if ( !isdefined( ent ) )
                    {
                        continue;
                    }
                    
                    sceneobjectdata = ent.sceneobjectdata;
                    str_anim = undefined;
                    
                    if ( isdefined( sceneobjectdata ) )
                    {
                        str_anim = sceneobjectdata.activeanimation;
                    }
                    
                    if ( isdefined( ent.var_4931cb9272551abf ) )
                    {
                        str_name = ent.var_4931cb9272551abf.animname;
                    }
                    else
                    {
                        str_name = ent.animname ?? sceneobjectdata.sceneobject.variant_object.name;
                    }
                    
                    if ( isanimation( str_anim ) && isdefined( str_name ) )
                    {
                        str_type = ent function_edcc1c2f941f4751();
                        var_c5caa5892d906e83 = "<dev string:x24>";
                        str_extra_info = "<dev string:x24>";
                        var_bad1c827136f96f = getanimlength( str_anim ) ?? 0;
                        
                        if ( isplayer( ent ) )
                        {
                            player_rig = level.player_rig ?? ent.var_4931cb9272551abf;
                            
                            if ( isdefined( player_rig ) )
                            {
                                var_b965be4ab10edc7e = player_rig getanimtime( str_anim ) ?? 0;
                                var_3ba18033860bafae = var_b965be4ab10edc7e * var_bad1c827136f96f;
                            }
                            else
                            {
                                var_b965be4ab10edc7e = 0;
                                var_3ba18033860bafae = 0;
                            }
                        }
                        else if ( ent vehicle::is_vehicle() || isai( ent ) || utility::issp() )
                        {
                            if ( isagent( ent ) && isdefined( ent.var_e073af6d35bd0942 ) )
                            {
                                var_b965be4ab10edc7e = ent aigetanimtime( "<dev string:x19b>", ent.var_e073af6d35bd0942 );
                            }
                            else
                            {
                                var_b965be4ab10edc7e = ent getanimtime( str_anim ) ?? 0;
                            }
                            
                            var_3ba18033860bafae = var_b965be4ab10edc7e * var_bad1c827136f96f;
                        }
                        else if ( isanimscripted( ent ) )
                        {
                            var_b965be4ab10edc7e = ent getanimtime( str_anim ) ?? 0;
                            var_3ba18033860bafae = var_b965be4ab10edc7e * var_bad1c827136f96f;
                        }
                        else if ( isdefined( ent.var_bbd02606816314a8 ) )
                        {
                            if ( var_3ba18033860bafae >= var_bad1c827136f96f )
                            {
                                ent.var_bbd02606816314a8 = gettime();
                            }
                            
                            var_3ba18033860bafae = ( gettime() - ent.var_bbd02606816314a8 ) / 1000;
                            var_b965be4ab10edc7e = var_3ba18033860bafae / var_bad1c827136f96f;
                        }
                        else
                        {
                            var_b965be4ab10edc7e = 0;
                            var_3ba18033860bafae = 0;
                        }
                        
                        var_b288497f88cb2852 = var_bad1c827136f96f * 30;
                        var_b577b0949f7f5e84 = int( var_b965be4ab10edc7e * var_b288497f88cb2852 );
                        str_extra_info = "<dev string:x1ab>" + var_3ba18033860bafae + "<dev string:x1ba>" + var_bad1c827136f96f + "<dev string:x1bf>" + var_b577b0949f7f5e84 + "<dev string:x1ba>" + var_b288497f88cb2852 + "<dev string:x1d3>";
                        var_b991f23f9ff3c95e = getanimname( str_anim );
                        
                        if ( isxhashasset( var_b991f23f9ff3c95e ) )
                        {
                            var_b991f23f9ff3c95e = getxhashsourcename( var_b991f23f9ff3c95e );
                        }
                        
                        if ( animislooping( str_anim ) )
                        {
                            var_c5caa5892d906e83 = "<dev string:x1d8>" + var_b991f23f9ff3c95e;
                        }
                        else
                        {
                            var_c5caa5892d906e83 = "<dev string:x1e7>" + var_b991f23f9ff3c95e;
                        }
                        
                        var_9d77361dcd71aee3 = ent.origin - ( 0, 0, 6 );
                        print3d( var_9d77361dcd71aee3, "<dev string:x1f1>" + ent getentitynumber() + str_type + "<dev string:x1fe>" + ( str_name ?? "<dev string:x20a>" + ent getentitynumber() ), ( 0.8, 0.8, 0 ), 0.8, 0.2 );
                        print3d( var_9d77361dcd71aee3 - ( 0, 0, 5 ), var_c5caa5892d906e83, ( 0.8, 0.8, 0 ), 0.8, 0.2 );
                        print3d( var_9d77361dcd71aee3 - ( 0, 0, 11 ), str_extra_info, ( 0.8, 0.8, 0 ), 0.8, 0.2 );
                        print3d( var_9d77361dcd71aee3 - ( 0, 0, 17 ), "<dev string:x215>" + ent.origin, ( 0.8, 0.8, 0 ), 0.8, 0.2 );
                        ent render_tag( "<dev string:x225>" );
                        ent render_tag( "<dev string:x239>" );
                        ent render_tag( "<dev string:x24c>" );
                        ent render_tag( "<dev string:x262>" );
                        ent render_tag( "<dev string:x270>" );
                        ent render_tag( "<dev string:x27e>" );
                        ent render_tag( "<dev string:x28b>" );
                        ent render_tag( "<dev string:x296>", "<dev string:x2a4>" );
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace scene_debug
    // Params 3, eflags: 0x4
    // Checksum 0x84f37627, Offset: 0x1269
    // Size: 0x8f, Type: dev
    function private render_tag( str_tag, str_label, b_recorder_only )
    {
        if ( !isdefined( str_label ) )
        {
            str_label = str_tag;
        }
        
        v_centroid = self getcentroid();
        v_tag_org = self gettagorigin( str_tag, 1 );
        
        if ( isdefined( v_tag_org ) )
        {
            v_tag_ang = self gettagangles( str_tag );
            anim_origin_render( v_tag_org, v_tag_ang, 2, str_label );
            line( v_centroid, v_tag_org, ( 0.3, 0.3, 0.3 ), 1.25, 1 );
        }
    }

    // Namespace scene_debug
    // Params 4, eflags: 0x4
    // Checksum 0x922193e9, Offset: 0x1300
    // Size: 0xe7, Type: dev
    function private anim_origin_render( org, angles, line_length, str_label )
    {
        if ( isdefined( org ) && isdefined( angles ) )
        {
            if ( !isdefined( line_length ) )
            {
                line_length = 6;
            }
            
            originendpoint = org + anglestoforward( angles ) * line_length;
            originrightpoint = org + anglestoright( angles ) * -1 * line_length;
            originuppoint = org + anglestoup( angles ) * line_length;
            line( org, originendpoint, ( 1, 0, 0 ) );
            line( org, originrightpoint, ( 0, 1, 0 ) );
            line( org, originuppoint, ( 0, 0, 1 ) );
            
            if ( isdefined( str_label ) )
            {
                print3d( org, str_label, ( 1, 0.5, 1 ), 2, 0.05 );
            }
        }
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x498f7c99, Offset: 0x13ef
    // Size: 0x71, Type: dev
    function private function_edcc1c2f941f4751()
    {
        str_text = "<dev string:x24>";
        
        if ( isactor( self ) || isagent( self ) )
        {
            str_text = "<dev string:x2ac>";
        }
        else if ( isplayer( self ) )
        {
            str_text = "<dev string:x2b4>";
        }
        else if ( isdefined( vehicle::get_ref() ) )
        {
            str_text = "<dev string:x2c0>";
        }
        else
        {
            str_text = "<dev string:x2cd>" + self.classname + "<dev string:x2d2>";
        }
        
        return str_text;
    }

    // Namespace scene_debug
    // Params 1
    // Checksum 0x39bc6f00, Offset: 0x1468
    // Size: 0xcee, Type: dev
    function display_scene_menu( var_c7c77583fb92fbfe )
    {
        str_type = "<dev string:x2d7>";
        level notify( "<dev string:x2e0>" );
        level endon( "<dev string:x2e0>" );
        waittillframeend();
        names = [];
        b_shot_menu = 0;
        s_scene = undefined;
        
        if ( isstring( var_c7c77583fb92fbfe ) )
        {
            s_scene = function_aade29044f6febba( var_c7c77583fb92fbfe );
            names = arraycombine( names, s_scene scene::function_837e044d37c5d180() );
            names[ names.size ] = "<dev string:x24>";
            names[ names.size ] = "<dev string:x2f6>";
            names[ names.size ] = "<dev string:x2fe>";
            names[ names.size ] = "<dev string:x24>";
            names[ names.size ] = "<dev string:x307>";
            str_title = var_c7c77583fb92fbfe + "<dev string:x30f>";
            b_shot_menu = 1;
            selected = level.scene_menu_shot_index ?? 0;
        }
        else
        {
            if ( utility::flag( "<dev string:x319>" ) )
            {
                println( "<dev string:x333>" + str_type + "<dev string:x348>" );
            }
            
            var_5d9478057df4c3e5 = 1;
            
            foreach ( s_scene in level.var_8b929db1c0421d07 )
            {
                str_scenedef = s_scene.script_scenescriptbundle;
                
                if ( !isdefined( str_scenedef ) )
                {
                    continue;
                }
                
                if ( isxhash( str_scenedef ) )
                {
                    s_scenedef = getscriptbundle( str_scenedef );
                }
                
                if ( !isdefined( s_scenedef ) && isstring( str_scenedef ) )
                {
                    s_scenedef = getscriptbundle( "<dev string:x35a>" + str_scenedef );
                }
                
                if ( !isdefined( s_scenedef ) )
                {
                    continue;
                }
                
                var_e017bea9d82be76e = isdefined( s_scene.var_d69404e803a096ca ) ? str_scenedef + "<dev string:x180>" + s_scene.var_d69404e803a096ca : str_scenedef;
                
                if ( utility::flag( "<dev string:x319>" ) )
                {
                    if ( s_scene scene::get_state() == "<dev string:x370>" )
                    {
                        names[ names.size ] = var_e017bea9d82be76e;
                        println( "<dev string:x333>" + str_type + "<dev string:xd6>" + var_5d9478057df4c3e5 + "<dev string:x37b>" + str_scenedef );
                        var_5d9478057df4c3e5++;
                    }
                    
                    continue;
                }
                
                names[ names.size ] = var_e017bea9d82be76e;
            }
            
            if ( utility::flag( "<dev string:x319>" ) )
            {
                println( "<dev string:x333>" + str_type + "<dev string:x385>" );
            }
            
            names = utility::alphabetize( names );
            
            foreach ( str_scene_name in names )
            {
                if ( issubstr( str_scene_name, "<dev string:x395>" ) )
                {
                    names = arrayremove( names, str_scene_name );
                    arrayinsert( names, str_scene_name, 0 );
                }
            }
            
            if ( isdefined( level.var_33009922f6ff7446 ) )
            {
                foreach ( str_scene_name in names )
                {
                    if ( issubstr( str_scene_name, level.var_33009922f6ff7446 ) )
                    {
                        names = arrayremove( names, str_scene_name );
                        arrayinsert( names, str_scene_name, 0 );
                    }
                }
            }
            
            names[ names.size ] = "<dev string:x24>";
            names[ names.size ] = "<dev string:x39d>";
            arrayinsert( names, "<dev string:x24>", 0 );
            arrayinsert( names, "<dev string:x3a5>", 0 );
            str_title = str_type + "<dev string:x3c7>";
            selected = level.scene_menu_index ?? 0;
        }
        
        if ( selected > names.size - 1 )
        {
            selected = 0;
        }
        
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        var_d87acc06076b58ca = gettime();
        
        while ( utility::flag( "<dev string:x3cc>" ) )
        {
            if ( !isdefined( level.scene.debug_player ) )
            {
                level.scene.debug_player = level.players[ 0 ];
                waitframe();
                continue;
            }
            
            if ( b_shot_menu )
            {
                if ( isdefined( level.last_scene_state ) && isdefined( level.last_scene_state[ var_c7c77583fb92fbfe ] ) )
                {
                    str_title = var_c7c77583fb92fbfe + "<dev string:x3e1>" + level.last_scene_state[ var_c7c77583fb92fbfe ] + "<dev string:x3e7>";
                }
            }
            
            scene_list_settext( names, selected, str_title, b_shot_menu, 1 );
            currenttime = gettime();
            pagecount = 10;
            
            if ( currenttime < var_d87acc06076b58ca )
            {
                pagecount = 0;
            }
            
            if ( !up_pressed )
            {
                if ( level.scene.debug_player buttonpressed( "<dev string:x28>" ) || level.scene.debug_player buttonpressed( "<dev string:x40>" ) )
                {
                    up_pressed = 1;
                    selected--;
                    
                    while ( !isdefined( names[ selected ] ) || names[ selected ] == "<dev string:x24>" )
                    {
                        selected--;
                        
                        if ( selected < 0 )
                        {
                            selected = names.size - 1;
                            continue;
                        }
                        
                        if ( selected >= names.size )
                        {
                            selected = 0;
                        }
                    }
                }
            }
            else if ( level.scene.debug_player function_82c6c002c1cbc8d8( "<dev string:x28>" ) || level.scene.debug_player function_82c6c002c1cbc8d8( "<dev string:x40>" ) )
            {
                held = 1;
                selected -= pagecount;
            }
            else if ( !level.scene.debug_player buttonpressed( "<dev string:x28>" ) && !level.scene.debug_player buttonpressed( "<dev string:x40>" ) )
            {
                held = 0;
                up_pressed = 0;
            }
            
            if ( !down_pressed )
            {
                if ( level.scene.debug_player buttonpressed( "<dev string:x33>" ) || level.scene.debug_player buttonpressed( "<dev string:x4b>" ) )
                {
                    down_pressed = 1;
                    selected++;
                    
                    while ( !isdefined( names[ selected ] ) || names[ selected ] == "<dev string:x24>" )
                    {
                        selected++;
                        
                        if ( selected < 0 )
                        {
                            selected = names.size - 1;
                            continue;
                        }
                        
                        if ( selected >= names.size )
                        {
                            selected = 0;
                        }
                    }
                }
            }
            else if ( level.scene.debug_player function_82c6c002c1cbc8d8( "<dev string:x33>" ) || level.scene.debug_player function_82c6c002c1cbc8d8( "<dev string:x4b>" ) )
            {
                held = 1;
                selected += pagecount;
            }
            else if ( !level.scene.debug_player buttonpressed( "<dev string:x33>" ) && !level.scene.debug_player buttonpressed( "<dev string:x4b>" ) )
            {
                held = 0;
                down_pressed = 0;
            }
            
            if ( held )
            {
                if ( selected < 0 )
                {
                    selected = 0;
                }
                else if ( selected >= names.size )
                {
                    selected = names.size - 1;
                }
            }
            else if ( selected < 0 )
            {
                selected = names.size - 1;
            }
            else if ( selected >= names.size )
            {
                selected = 0;
            }
            
            if ( held && pagecount == 10 )
            {
                var_d87acc06076b58ca = gettime() + 500;
            }
            
            if ( names[ selected ] != "<dev string:x3a5>" && names[ selected ] != "<dev string:x39d>" && !b_shot_menu )
            {
                s_scene = function_aade29044f6febba( names[ selected ] );
            }
            
            if ( level.scene.debug_player buttonpressed( "<dev string:x3ec>" ) || level.scene.debug_player buttonpressed( "<dev string:x3f8>" ) )
            {
                if ( b_shot_menu )
                {
                    while ( level.scene.debug_player buttonpressed( "<dev string:x3ec>" ) || level.scene.debug_player buttonpressed( "<dev string:x3f8>" ) )
                    {
                        waitframe();
                    }
                    
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu();
                }
                else
                {
                    level.scene_menu_index = selected;
                    var_801efcb296c81c06 = "<dev string:x402>" + getxhashhexname( @"hash_559926a6436db818" ) + "<dev string:x40a>";
                    adddebugcommand( var_801efcb296c81c06 );
                    return;
                }
            }
            
            if ( names[ selected ] != "<dev string:x39d>" && names[ selected ] != "<dev string:x3a5>" && !b_shot_menu && isdefined( s_scene ) )
            {
                if ( level.scene.debug_player buttonpressed( "<dev string:x419>" ) || level.scene.debug_player buttonpressed( "<dev string:x427>" ) )
                {
                    level.scene.debug_player setorigin( s_scene.origin );
                    
                    while ( level.scene.debug_player buttonpressed( "<dev string:x419>" ) || level.scene.debug_player buttonpressed( "<dev string:x427>" ) )
                    {
                        waitframe();
                    }
                }
                else if ( level.scene.debug_player buttonpressed( "<dev string:x435>" ) || level.scene.debug_player buttonpressed( "<dev string:x442>" ) )
                {
                    level.scene.debug_player setorigin( s_scene.origin );
                    
                    while ( level.scene.debug_player buttonpressed( "<dev string:x435>" ) || level.scene.debug_player buttonpressed( "<dev string:x442>" ) )
                    {
                        waitframe();
                    }
                }
            }
            
            if ( b_shot_menu && ( function_6524e946516b534e() || function_217ffd073ec8c363() ) && isdefined( var_c7c77583fb92fbfe ) && arraycontains( s_scene scene::function_837e044d37c5d180(), names[ selected ] ) )
            {
                if ( function_6524e946516b534e() )
                {
                    a_str_shot_names = s_scene scene::function_837e044d37c5d180();
                    var_8001b0e61b029584 = [];
                    var_946fa5ec1341b850 = 0;
                    
                    foreach ( str_shot_name in a_str_shot_names )
                    {
                        if ( str_shot_name != names[ selected ] && !var_946fa5ec1341b850 )
                        {
                            continue;
                        }
                        
                        var_946fa5ec1341b850 = 1;
                        var_8001b0e61b029584[ var_8001b0e61b029584.size ] = str_shot_name;
                    }
                    
                    s_scene thread scene::play( undefined, var_8001b0e61b029584 );
                }
                else if ( function_217ffd073ec8c363() )
                {
                    s_scene thread scene::init( undefined, names[ selected ] );
                }
                
                while ( function_217ffd073ec8c363() || function_6524e946516b534e() )
                {
                    waitframe();
                }
            }
            else if ( function_22c33fb31bec181b() && isdefined( names[ selected ] ) )
            {
                if ( !b_shot_menu && names[ selected ] == "<dev string:x3a5>" )
                {
                    if ( utility::flag( "<dev string:x319>" ) )
                    {
                        utility::flag_clear( "<dev string:x319>" );
                    }
                    else
                    {
                        utility::flag_set( "<dev string:x319>" );
                    }
                    
                    while ( function_22c33fb31bec181b() )
                    {
                        waitframe();
                    }
                    
                    level thread display_scene_menu();
                }
                else if ( !b_shot_menu )
                {
                    if ( names[ selected ] == "<dev string:x39d>" )
                    {
                        var_801efcb296c81c06 = "<dev string:x402>" + getxhashhexname( @"hash_559926a6436db818" ) + "<dev string:x40a>";
                        adddebugcommand( var_801efcb296c81c06 );
                        return;
                    }
                }
                else if ( b_shot_menu )
                {
                    if ( s_scene.var_b8d0b3148ac4e533 )
                    {
                        s_scene.origin = getdvarvector( @"hash_373ad6363da1c230" );
                        s_scene.angles = getdvarvector( @"hash_eab41865eb0e96ea" );
                    }
                    
                    if ( names[ selected ] == "<dev string:x307>" )
                    {
                        level.scene_menu_shot_index = selected;
                        
                        while ( function_22c33fb31bec181b() )
                        {
                            waitframe();
                        }
                        
                        level thread display_scene_menu();
                    }
                    else if ( names[ selected ] == "<dev string:x2f6>" )
                    {
                        s_scene thread scene::stop();
                    }
                    else if ( names[ selected ] == "<dev string:x2fe>" )
                    {
                        s_scene thread scene::cleanup( 1 );
                    }
                    else if ( names[ selected ] == "<dev string:x44f>" )
                    {
                        s_scene thread scene::init();
                    }
                    else if ( names[ selected ] == "<dev string:x457>" )
                    {
                        s_scene thread scene::play();
                    }
                    else if ( names[ selected ] != "<dev string:x24>" )
                    {
                        s_scene thread scene::play( undefined, names[ selected ] );
                    }
                }
                
                while ( function_22c33fb31bec181b() || function_6524e946516b534e() )
                {
                    waitframe();
                }
                
                if ( !b_shot_menu && names[ selected ] != "<dev string:x24>" )
                {
                    level.scene_menu_index = selected;
                    level thread display_scene_menu( names[ selected ] );
                }
            }
            
            waitframe();
        }
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x733e72f0, Offset: 0x215e
    // Size: 0xff, Type: dev
    function private function_aade29044f6febba( var_c7c77583fb92fbfe )
    {
        var_64af815746cd2fd0 = strtok( var_c7c77583fb92fbfe, "<dev string:x180>" );
        var_c7c77583fb92fbfe = var_64af815746cd2fd0[ 0 ];
        var_d69404e803a096ca = var_64af815746cd2fd0[ 1 ];
        
        if ( isdefined( var_d69404e803a096ca ) )
        {
            var_d69404e803a096ca = int( var_d69404e803a096ca );
        }
        
        s_scene = level.var_8b929db1c0421d07[ 0 ];
        
        foreach ( var_712cbb1d3431ce00 in level.var_8b929db1c0421d07 )
        {
            if ( var_c7c77583fb92fbfe == var_712cbb1d3431ce00.script_scenescriptbundle && ( !isdefined( var_d69404e803a096ca ) || var_d69404e803a096ca == var_712cbb1d3431ce00.var_d69404e803a096ca ) )
            {
                s_scene = var_712cbb1d3431ce00;
                break;
            }
        }
        
        return s_scene;
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x5137c56b, Offset: 0x2265
    // Size: 0x123, Type: dev
    function private scene_menu( params )
    {
        if ( !utility::flag( "<dev string:x3cc>" ) )
        {
            utility::flag_set( "<dev string:x3cc>" );
            level.scene.debug_player val::set( "<dev string:x45f>", "<dev string:x46e>", 0 );
            level.scene.debug_player val::set( "<dev string:x45f>", "<dev string:x47c>", 0 );
            level.scene.debug_player val::set( "<dev string:x45f>", "<dev string:x486>", 0 );
            level thread display_scene_menu();
            return;
        }
        
        utility::flag_clear( "<dev string:x3cc>" );
        level.scene.debug_player val::reset( "<dev string:x45f>", "<dev string:x46e>" );
        level.scene.debug_player val::reset( "<dev string:x45f>", "<dev string:x47c>" );
        level.scene.debug_player val::reset( "<dev string:x45f>", "<dev string:x486>" );
        function_23f91059855df63d();
    }

    // Namespace scene_debug
    // Params 5, eflags: 0x4
    // Checksum 0xcb1b82a, Offset: 0x2390
    // Size: 0x50, Type: dev
    function private scene_list_settext( strings, n_selected, str_title, b_shot_menu, var_d7c3bc47919cd2a5 )
    {
        if ( !utility::flag( "<dev string:x48f>" ) )
        {
            thread _scene_list_settext( strings, n_selected, str_title, b_shot_menu, var_d7c3bc47919cd2a5 );
        }
    }

    // Namespace scene_debug
    // Params 5, eflags: 0x4
    // Checksum 0x7cd691bf, Offset: 0x23e8
    // Size: 0x3a6, Type: dev
    function private _scene_list_settext( strings, n_selected, str_title, b_shot_menu, var_d7c3bc47919cd2a5 )
    {
        if ( !isdefined( var_d7c3bc47919cd2a5 ) )
        {
            var_d7c3bc47919cd2a5 = 1;
        }
        
        for ( i = 0; i < var_d7c3bc47919cd2a5 ; i++ )
        {
            printtoscreen2d( 100, 260, str_title, ( 1, 1, 1 ), 2 );
            str_mode = "<dev string:x4a5>";
            
            switch ( str_mode )
            {
                case #"hash_7038dec66d8275be":
                    printtoscreen2d( 100, 290, "<dev string:x4b0>", ( 1, 1, 1 ), 2 );
                    break;
                case #"hash_7da50739ef480ecb":
                    break;
                case #"hash_8d4787dcb1802e22":
                    break;
                case #"hash_d48d5b579a6c7c3":
                    break;
            }
            
            for ( i = 0; i < 16 ; i++ )
            {
                index = i + n_selected - 5;
                
                if ( isdefined( strings[ index ] ) )
                {
                    text = strings[ index ];
                }
                else
                {
                    text = "<dev string:x24>";
                }
                
                str_scene = text;
                
                if ( isdefined( level.last_scene_state ) && isdefined( level.last_scene_state[ text ] ) )
                {
                    text += "<dev string:x3e1>" + level.last_scene_state[ text ] + "<dev string:x3e7>";
                }
                
                if ( i == 5 )
                {
                    text = "<dev string:x4ed>" + text + "<dev string:x4f3>";
                    str_color = ( 0.8, 0.4, 0 );
                }
                else if ( str_scene != "<dev string:x24>" )
                {
                    str_color = ( 0, 1, 0 );
                }
                else
                {
                    str_color = ( 1, 1, 1 );
                }
                
                y_offset = i * 30;
                printtoscreen2d( 86, 350 + y_offset, text, str_color, 2 );
            }
            
            if ( b_shot_menu && !getdvarint( @"hash_303a3f39ecf974db", 0 ) )
            {
                if ( !isdefined( level.scene.var_4b3d13d75ab66180 ) )
                {
                    level.scene.var_4b3d13d75ab66180 = newhudelem();
                }
                
                level.scene.var_4b3d13d75ab66180.alignx = "<dev string:x4f8>";
                level.scene.var_4b3d13d75ab66180.x = 55;
                level.scene.var_4b3d13d75ab66180.y = 250;
                level.scene.var_4b3d13d75ab66180.fontscale = 1;
                level.scene.var_4b3d13d75ab66180.color = ( 1, 1, 1 );
                level.scene.var_4b3d13d75ab66180.horzalign = "<dev string:x500>";
                level.scene.var_4b3d13d75ab66180.vertalign = "<dev string:x500>";
                buttonprompttext = "<dev string:x24>";
                
                if ( level.scene.debug_player usinggamepad() )
                {
                    buttonprompttext = "<dev string:x50e>";
                }
                else
                {
                    buttonprompttext = "<dev string:x574>";
                }
                
                level.scene.var_4b3d13d75ab66180 setdevtext( buttonprompttext );
            }
            else
            {
                function_23f91059855df63d();
                printtoscreen2d( 100, 830, "<dev string:x5bd>", ( 1, 1, 1 ), 2 );
            }
            
            waitframe();
        }
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x2479533b, Offset: 0x2796
    // Size: 0x34, Type: dev
    function private function_23f91059855df63d()
    {
        if ( isdefined( level.scene.var_4b3d13d75ab66180 ) )
        {
            level.scene.var_4b3d13d75ab66180 destroy();
        }
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x69cb7b12, Offset: 0x27d2
    // Size: 0x69, Type: dev
    function private function_22c33fb31bec181b()
    {
        if ( level.scene.debug_player buttonpressed( "<dev string:x5e2>" ) || level.scene.debug_player buttonpressed( "<dev string:x5ee>" ) || level.scene.debug_player buttonpressed( "<dev string:x5fa>" ) )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x71b84dad, Offset: 0x2843
    // Size: 0x49, Type: dev
    function private function_6524e946516b534e()
    {
        if ( level.scene.debug_player buttonpressed( "<dev string:x603>" ) || level.scene.debug_player buttonpressed( "<dev string:x60f>" ) )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace scene_debug
    // Params 0, eflags: 0x4
    // Checksum 0x4ef00d57, Offset: 0x2894
    // Size: 0x49, Type: dev
    function private function_217ffd073ec8c363()
    {
        if ( level.scene.debug_player buttonpressed( "<dev string:x614>" ) || level.scene.debug_player buttonpressed( "<dev string:x620>" ) )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0xd0abf7c2, Offset: 0x28e5
    // Size: 0x2f, Type: dev
    function private function_82c6c002c1cbc8d8( str_button )
    {
        if ( getdvarint( @"hash_66d7268f08facc81", 0 ) )
        {
            return 0;
        }
        
        return self._holding_button[ str_button ];
    }

    // Namespace scene_debug
    // Params 1, eflags: 0x4
    // Checksum 0x7dabc602, Offset: 0x291c
    // Size: 0xcf, Type: dev
    function private function_885778f4c26a57ba( str_button )
    {
        self endon( "<dev string:x628>" );
        
        if ( !isdefined( self._holding_button ) )
        {
            self._holding_button = [];
        }
        
        self._holding_button[ str_button ] = 0;
        time_started = 0;
        
        while ( true )
        {
            if ( !isdefined( self ) )
            {
                return;
            }
            
            use_time = 250;
            
            if ( self._holding_button[ str_button ] )
            {
                if ( !self buttonpressed( str_button ) )
                {
                    self._holding_button[ str_button ] = 0;
                }
            }
            else if ( self buttonpressed( str_button ) )
            {
                if ( time_started == 0 )
                {
                    time_started = gettime();
                }
                
                if ( gettime() - time_started > use_time )
                {
                    self._holding_button[ str_button ] = 1;
                }
            }
            else if ( time_started != 0 )
            {
                time_started = 0;
            }
            
            waitframe();
        }
    }

    // Namespace scene_debug
    // Params 4
    // Checksum 0x8a9e65c9, Offset: 0x29f3
    // Size: 0x3a0, Type: dev
    function tag_thread( tag, size, duration, blendtimesec )
    {
        self endon( "<dev string:x636>" );
        self notify( "<dev string:x64d>" + tag );
        self endon( "<dev string:x64d>" + tag );
        starttime = gettime();
        
        if ( !isdefined( level.var_9b7137b1581c88f7 ) )
        {
            level.var_9b7137b1581c88f7 = [];
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 1, 0, 0 );
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 0, 1, 0 );
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 0, 0, 1 );
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 1, 1, 0 );
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 0, 1, 1 );
            level.var_9b7137b1581c88f7[ level.var_9b7137b1581c88f7.size ] = ( 1, 0, 1 );
            level.var_fddf583b6d49425e = -1;
        }
        
        color = ( 1, 1, 1 );
        blendtimems = 0;
        
        if ( !isdefined( blendtimesec ) )
        {
            level.var_fddf583b6d49425e = ( level.var_fddf583b6d49425e + 1 ) % level.var_9b7137b1581c88f7.size;
            color = level.var_9b7137b1581c88f7[ level.var_fddf583b6d49425e ];
        }
        else
        {
            blendtimems = blendtimesec * 1000;
        }
        
        start = gettime();
        
        while ( true )
        {
            waitframe();
            origin = self.origin;
            angles = self.angles;
            
            if ( blendtimems > 0 )
            {
                color = vectorlerp( ( 0, 0, 0 ), ( 1, 1, 1 ), min( 1, float( gettime() - start ) / float( blendtimems ) ) );
            }
            
            if ( tag != "<dev string:x24>" )
            {
                origin = self gettagorigin( tag, 0, 1, 0 );
                angles = self gettagangles( tag, 0, 1, 0 );
                print3d( origin + ( 0, 0, 1 ), tag, ( 1, 1, 1 ), 1, 0.15, 1, 1 );
            }
            else if ( isplayer( self ) )
            {
                origin = self geteye();
                angles = self getplayerangles();
            }
            else
            {
                print3d( origin + ( 0, 0, 1 ), "<dev string:x662>", ( 1, 1, 1 ), 1, 0.15, 1, 1 );
            }
            
            line( origin, origin + anglestoforward( angles ) * size, color, 1, 0, duration );
            line( origin, origin + anglestoright( angles ) * size, color * 0.75, 1, 0, duration );
            line( origin, origin + anglestoup( angles ) * size, ( 1, 1, 1 ), 1, 0, duration );
            print3d( origin + ( 0, 0, 5 ), "<dev string:x24>" + self getentitynumber(), ( 1, 1, 1 ), 1, 0.25, 1, 1 );
            print3d( origin + ( 0, 0, 10 ), "<dev string:x24>" + gettime() - starttime, ( 1, 1, 1 ), 1, 0.25, 1, 1 );
        }
    }

    // Namespace scene_debug
    // Params 4
    // Checksum 0x194510e7, Offset: 0x2d9b
    // Size: 0xee, Type: dev
    function object_event( sceneobjectdata, event, origin, angles )
    {
        if ( !getdvarint( @"hash_143b0dff4afbd1d3", 0 ) )
        {
            return;
        }
        
        filter = getdvar( @"hash_71fb5222b333d146", "<dev string:x24>" );
        
        if ( filter != "<dev string:x24>" && !issubstr( tolower( filter ), tolower( sceneobjectdata.sceneobject.variant_object.name ) ) && !issubstr( tolower( sceneobjectdata.sceneobject.variant_object.name ), tolower( filter ) ) && !issubstr( tolower( event ), tolower( filter ) ) )
        {
            return;
        }
        
        level thread function_bad06fca32e21947( sceneobjectdata, event, origin, angles );
    }

    // Namespace scene_debug
    // Params 4, eflags: 0xc
    // Checksum 0x95c917d1, Offset: 0x2e91
    // Size: 0x68f, Type: dev
    function private function_bad06fca32e21947( sceneobjectdata, event, origin, angles )
    {
        self notify( "d1649d6e99566155" );
        self endon( "d1649d6e99566155" );
        assert( isdefined( sceneobjectdata ) );
        assert( isdefined( event ) );
        assert( isdefined( origin ) );
        assert( isdefined( angles ) );
        
        if ( !isdefined( level.var_24e5e641eff80bfa ) )
        {
            level.var_24e5e641eff80bfa = [];
        }
        
        bucketdistsq = squared( 5 );
        duration = getdvarint( @"hash_143b0dff4afbd1d3", 0 );
        scale = 0.25;
        step = 4;
        eventlistadd = undefined;
        
        foreach ( eventlist in level.var_24e5e641eff80bfa )
        {
            if ( distancesquared( eventlist.origin, origin ) < bucketdistsq )
            {
                eventlistadd = eventlist;
                break;
            }
        }
        
        if ( !isdefined( eventlistadd ) )
        {
            eventlistadd = spawnstruct();
            eventlistadd.origin = origin;
            eventlistadd.angles = angles;
            eventlistadd.events = [];
            eventlistadd.offset = ( 0, 0, 0 );
            level.var_24e5e641eff80bfa[ level.var_24e5e641eff80bfa.size ] = eventlistadd;
        }
        
        eventadd = spawnstruct();
        eventadd.objectname = sceneobjectdata.sceneobject.variant_object.name;
        eventadd.activeanimation = sceneobjectdata.activeanimation;
        eventadd.scenename = sceneobjectdata.sceneroot.script_scenescriptbundle;
        eventadd.event = event;
        eventadd.origin = origin;
        eventadd.angles = angles;
        eventadd.time = gettime();
        eventlistadd.events[ eventlistadd.events.size ] = eventadd;
        print3d( ( 0, 0, 0 ), "<dev string:x24>", ( 1, 1, 1 ), 1, 1, 1 );
        waitframe();
        
        foreach ( eventlist in level.var_24e5e641eff80bfa )
        {
            drawnorigin = undefined;
            drawnangles = undefined;
            lastscene = undefined;
            lastobject = undefined;
            offset = ( 0, 0, 0 );
            
            for ( i = 0; i < eventlist.events.size ; i++ )
            {
                event = eventlist.events[ i ];
                
                if ( drawnorigin != event.origin || drawnangles != event.angles )
                {
                    drawnorigin = event.origin;
                    drawnangles = event.angles;
                    axis = anglestoaxis( event.angles );
                    line( event.origin, event.origin + axis[ "<dev string:x673>" ] * 10, ( 1, 0, 0 ), 1, 0, duration );
                    line( event.origin, event.origin + axis[ "<dev string:x67e>" ] * 10, ( 0, 1, 0 ), 1, 0, duration );
                    line( event.origin, event.origin + axis[ "<dev string:x687>" ] * 10, ( 0, 0, 1 ), 1, 0, duration );
                }
                
                if ( lastscene != event.scenename )
                {
                    lastscene = event.scenename;
                    print3d( eventlist.origin + offset, lastscene, ( 1, 1, 0 ), 1, scale, duration );
                    offset += ( 0, 0, step );
                }
                
                if ( lastobject != event.objectname )
                {
                    lastobject = event.objectname;
                    offset += ( 0, 0, step * 0.5 );
                    print3d( eventlist.origin + offset, lastobject, ( 0, 1, 1 ), 1, scale, duration );
                    offset += ( 0, 0, step );
                }
                
                print3d( eventlist.origin + offset, event.event + "<dev string:x3e1>" + event.time + "<dev string:x3e7>", ( 1, 1, 1 ), 1, scale, duration );
                offset += ( 0, 0, step );
                print3d( eventlist.origin + offset, "<dev string:x24>" + int( event.origin[ 0 ] ) + "<dev string:xb1>" + int( event.origin[ 1 ] ) + "<dev string:xb1>" + int( event.origin[ 2 ] ), ( 1, 1, 1 ), 1, scale, duration );
                offset += ( 0, 0, step );
                activeanimation = "<dev string:x24>";
                objectname = "<dev string:x24>";
                
                if ( isdefined( event.activeanimation ) )
                {
                    activeanimation = event.activeanimation;
                }
                
                if ( isdefined( event.objectname ) )
                {
                    objectname = event.objectname;
                }
                
                println( "<dev string:x68d>" + event.time + "<dev string:x69e>" + event.event + "<dev string:x6a4>" + objectname );
            }
        }
        
        level.var_24e5e641eff80bfa = undefined;
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0x6163ac84, Offset: 0x3528
    // Size: 0x153, Type: dev
    function function_7ec88334f954da4b()
    {
        sceneplay = self;
        sceneroot = sceneplay.sceneroot;
        scenedata = sceneroot.scenedata;
        
        if ( !isdefined( scenedata ) )
        {
            return undefined;
        }
        
        foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
        {
            sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
            
            if ( isplayer( sceneobjectdata.entity ) )
            {
                return sceneobjectdata.entity;
            }
            
            if ( sceneobjectdata.sceneobject.variant_type === "<dev string:x6ab>" )
            {
                var_c8fcc44f0afd362d = sceneobjectdata.xcamplayers ?? sceneobjectdata.sceneroot.scenestatic.exclusiveplayers ?? level.players;
                return var_c8fcc44f0afd362d[ 0 ];
            }
        }
    }

    // Namespace scene_debug
    // Params 1
    // Checksum 0x9650506f, Offset: 0x3683
    // Size: 0x364, Type: dev
    function function_ba32edc20462b709( shotindex )
    {
        sceneplay = self;
        
        if ( getdvarint( @"hash_f98fc73c88850645", 0 ) )
        {
            sceneroot = sceneplay.sceneroot;
            scenedata = sceneroot.scenedata;
            player = sceneplay function_7ec88334f954da4b();
            
            if ( !isdefined( player ) )
            {
                return;
            }
            
            sceneplay function_566e3d31befe1331();
            player.var_7b353d581f4f612c[ 0 ] = newhudelem();
            player.var_7b353d581f4f612c[ 1 ] = newhudelem();
            str_scene_name = sceneroot.script_scenescriptbundle ?? "<dev string:x24>";
            str_shot_name = sceneroot.scenedata.scenescriptbundle.shots[ shotindex ].variant_object.name ?? "<dev string:x24>";
            player.var_7b353d581f4f612c[ 0 ].alignx = "<dev string:x67e>";
            player.var_7b353d581f4f612c[ 0 ].aligny = "<dev string:x6b9>";
            player.var_7b353d581f4f612c[ 0 ].vertalign = "<dev string:x6b9>";
            player.var_7b353d581f4f612c[ 0 ].horzalign = "<dev string:x67e>";
            player.var_7b353d581f4f612c[ 0 ].font = "<dev string:x6c3>";
            player.var_7b353d581f4f612c[ 0 ].x = -20;
            player.var_7b353d581f4f612c[ 0 ].y = -90;
            player.var_7b353d581f4f612c[ 0 ].fontscale = 1;
            player.var_7b353d581f4f612c[ 0 ].color = ( 0.6, 0.6, 0.6 );
            player.var_7b353d581f4f612c[ 1 ].alignx = "<dev string:x67e>";
            player.var_7b353d581f4f612c[ 1 ].aligny = "<dev string:x6b9>";
            player.var_7b353d581f4f612c[ 1 ].vertalign = "<dev string:x6b9>";
            player.var_7b353d581f4f612c[ 1 ].horzalign = "<dev string:x67e>";
            player.var_7b353d581f4f612c[ 1 ].font = "<dev string:x6c3>";
            player.var_7b353d581f4f612c[ 1 ].x = -20;
            player.var_7b353d581f4f612c[ 1 ].y = -70;
            player.var_7b353d581f4f612c[ 1 ].fontscale = 1;
            player.var_7b353d581f4f612c[ 1 ].color = ( 0.6, 0.6, 0.6 );
            player.var_7b353d581f4f612c[ 0 ] setdevtext( "<dev string:x185>" + ( isxhashasset( str_scene_name ) ? getxhashsourcename( str_scene_name ) : str_scene_name ) );
            player.var_7b353d581f4f612c[ 1 ] thread function_11162298d42afbc9( sceneplay, str_shot_name, sceneroot.var_f1be55806e0d5f25 );
        }
    }

    // Namespace scene_debug
    // Params 3, eflags: 0xc
    // Checksum 0x4e6518b, Offset: 0x39ef
    // Size: 0xf7, Type: dev
    function private function_11162298d42afbc9( sceneplay, shotname, starttime )
    {
        self notify( "82bc872dcb5dd5c8" );
        self endon( "82bc872dcb5dd5c8" );
        self endon( "<dev string:x636>" );
        
        while ( isdefined( sceneplay.sceneroot ) )
        {
            shottime = sceneplay.sceneroot scene::function_30ae5e4baf26ba77( sceneplay.currentshot );
            
            if ( isdefined( shottime ) )
            {
                shottime = "<dev string:x6d1>" + floor( shottime * 100 );
            }
            else
            {
                shottime = "<dev string:x24>";
            }
            
            if ( isdefined( sceneplay.sceneroot.var_f1be55806e0d5f25 ) )
            {
                shottext = shottime + "<dev string:x6d7>" + shotname + "<dev string:x6e2>" + sceneplay.sceneroot.var_f1be55806e0d5f25;
            }
            else
            {
                shottext = shottime + "<dev string:x6d7>" + shotname;
            }
            
            self setdevtext( shottext );
            waitframe();
        }
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0x48731e7e, Offset: 0x3aee
    // Size: 0x111, Type: dev
    function function_566e3d31befe1331()
    {
        sceneplay = self;
        
        if ( getdvarint( @"hash_f98fc73c88850645", 0 ) )
        {
            sceneroot = sceneplay.sceneroot;
            scenedata = sceneroot.scenedata;
            player = sceneplay function_7ec88334f954da4b();
            
            if ( !isdefined( player ) )
            {
                return;
            }
            
            if ( isarray( player.var_7b353d581f4f612c ) )
            {
                foreach ( hud_elem in player.var_7b353d581f4f612c )
                {
                    if ( isdefined( hud_elem ) )
                    {
                        hud_elem destroy();
                    }
                }
                
                player.var_7b353d581f4f612c = function_5713d46873b29625( player.var_7b353d581f4f612c );
            }
        }
    }

    // Namespace scene_debug
    // Params 3
    // Checksum 0xedf6273, Offset: 0x3c07
    // Size: 0x2e7, Type: dev
    function function_bbb480647f4f57ab( shotindexes, duration, cameras )
    {
        if ( !isdefined( duration ) )
        {
            duration = 5;
        }
        
        sceneplay = self;
        player = undefined;
        
        if ( getdvarint( @"hash_f98fc73c88850645", 0 ) )
        {
            sceneroot = sceneplay.sceneroot;
            scenedata = sceneroot.scenedata;
            player = sceneplay function_7ec88334f954da4b();
            
            if ( !isdefined( player ) )
            {
                return;
            }
            
            player function_b7d86476ccd2b3ea();
            y = -35;
            player.var_af0b696397ddfea3 = [];
            str_scene_name = sceneroot.script_scenescriptbundle ?? "<dev string:x24>";
            
            foreach ( arrayindex, shotindex in shotindexes )
            {
                hudelem = newhudelem();
                str_shot_name = sceneroot.scenedata.scenescriptbundle.shots[ shotindex ].variant_object.name ?? "<dev string:x24>";
                hudelem.alignx = "<dev string:x67e>";
                hudelem.aligny = "<dev string:x6b9>";
                hudelem.vertalign = "<dev string:x6b9>";
                hudelem.horzalign = "<dev string:x67e>";
                hudelem.font = "<dev string:x6c3>";
                hudelem.x = -25;
                hudelem.y = y;
                hudelem.fontscale = 1;
                hudelem.color = ( 0, 0.6, 0 );
                cameratext = "<dev string:x24>";
                
                if ( isdefined( cameras ) && isdefined( cameras[ arrayindex ] ) )
                {
                    camerapos = cameras[ arrayindex ];
                    cameratext = "<dev string:x6ed>" + int( camerapos[ 0 ] ) + "<dev string:xb1>" + int( camerapos[ 1 ] ) + "<dev string:xb1>" + int( camerapos[ 2 ] ) + "<dev string:x6f3>";
                }
                
                hudelem setdevtext( cameratext + "<dev string:x6f9>" + getxhashsourcename( str_scene_name ) + "<dev string:x709>" + str_shot_name );
                y -= 20;
                player.var_af0b696397ddfea3[ player.var_af0b696397ddfea3.size ] = hudelem;
            }
        }
        
        if ( duration >= 0 && isdefined( player ) )
        {
            player utility::delaythreadendon( duration, "<dev string:x710>", &function_b7d86476ccd2b3ea );
        }
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0xb0db0da3, Offset: 0x3ef6
    // Size: 0xab, Type: dev
    function function_b7d86476ccd2b3ea()
    {
        self notify( "<dev string:x710>" );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isarray( self.var_af0b696397ddfea3 ) )
        {
            foreach ( hud_elem in self.var_af0b696397ddfea3 )
            {
                if ( isdefined( hud_elem ) )
                {
                    hud_elem destroy();
                }
            }
            
            self.var_af0b696397ddfea3 = undefined;
        }
    }

    // Namespace scene_debug
    // Params 2
    // Checksum 0x55a08ec4, Offset: 0x3fa9
    // Size: 0x7f, Type: dev
    function function_c4e717374c36ac3( sceneobjectindex, entitytomatch )
    {
        var_c809a3d453c003d6 = getdvarint( @"hash_3bc9bc279e3f772", 0 );
        
        if ( isdefined( entitytomatch ) )
        {
            if ( var_c809a3d453c003d6 && entitytomatch == level.players[ 0 ] )
            {
                if ( var_c809a3d453c003d6 - 1 == sceneobjectindex )
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
        }
        else if ( var_c809a3d453c003d6 )
        {
            if ( var_c809a3d453c003d6 - 1 == sceneobjectindex )
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        
        return 0;
    }

    // Namespace scene_debug
    // Params 0
    // Checksum 0xccaf1761, Offset: 0x4030
    // Size: 0x14a, Type: dev
    function function_24a6aeb21d33a19b()
    {
        assert( isplayer( self ) );
        
        if ( getdvarint( @"scr_debug_scene", 0 ) && getdvarint( @"hash_85e2888324463ba", 0 ) )
        {
            hits = trace::player_trace_get_all_results( self.origin + ( 0, 0, 0.01 ), self.origin, undefined, self );
            
            foreach ( hitinfo in hits )
            {
                if ( isent( hitinfo[ "<dev string:x734>" ] ) )
                {
                    iprintlnbold( "<dev string:x73e>" + hitinfo[ "<dev string:x734>" ] getentitynumber() + ( isdefined( hitinfo[ "<dev string:x734>" ].model ) ? "<dev string:x750>" + hitinfo[ "<dev string:x734>" ].model : "<dev string:x24>" ) );
                    continue;
                }
                
                if ( getdvarint( @"hash_85e2888324463ba", 0 ) > 1 )
                {
                    iprintlnbold( "<dev string:x75c>" );
                }
            }
        }
    }

#/
