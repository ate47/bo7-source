#using script_2fc7d77589e8af1b;
#using scripts\code\struct;
#using scripts\common\callbacks;
#using scripts\common\scene;
#using scripts\common\ui;
#using scripts\common\utility;
#using scripts\cp_mp\frontendfiringrange;
#using scripts\cp_mp\scene_frontend;
#using scripts\engine\utility;

#namespace frontendutils;

// Namespace frontendutils
// Params 0
// Checksum 0xd9ed21d3, Offset: 0x4bc9
// Size: 0x17
function init_frontend_utils()
{
    create_camera_position_list();
    setup_initial_entities();
    struct::dummy();
}

/#

    // Namespace frontendutils
    // Params 0
    // Checksum 0x490760c7, Offset: 0x4be8
    // Size: 0x5e, Type: dev
    function function_dd77993942850706()
    {
        while ( true )
        {
            var_a661c22541f0cc60 = getdvarint( @"hash_be485550bea2743", 0 );
            sceneroot = level;
            sceneplaying = sceneroot scene::get_state() == "<dev string:x24>";
            
            if ( !var_a661c22541f0cc60 && sceneplaying )
            {
                client_scene_stop();
            }
            
            waitframe();
        }
    }

    // Namespace frontendutils
    // Params 0
    // Checksum 0xdaf19080, Offset: 0x4c4e
    // Size: 0x62, Type: dev
    function function_1c648417bf9191d()
    {
        while ( true )
        {
            var_c7f7bb0d465ba9db = getdvarint( @"hash_349914f8fe26aa6b", -1 );
            
            if ( level.client_characters[ var_c7f7bb0d465ba9db ] )
            {
                var_f0b73c649149da9f = level.client_characters[ var_c7f7bb0d465ba9db ] getentitynumber();
                setdvar( @"hash_305a7db16a11dd02", var_f0b73c649149da9f );
            }
            
            waitframe();
        }
    }

    // Namespace frontendutils
    // Params 0
    // Checksum 0xdc33142a, Offset: 0x4cb8
    // Size: 0x265, Type: dev
    function function_4dbf025e46bc2e18()
    {
        level.var_b276f5acc2808109 = 0;
        
        while ( true )
        {
            var_8330d549e217ea09 = getdvarint( @"hash_7fda6d75e833692d" );
            
            if ( var_8330d549e217ea09 != level.var_b276f5acc2808109 )
            {
                if ( var_8330d549e217ea09 )
                {
                    level.var_9ad00eb6a518bf32 = level.playerviewowner.origin;
                    level.var_9f0069409b7032b8 = level.playerviewowner.angles;
                    xcamdata = function_fcd62fd219292ac7();
                    
                    if ( isdefined( xcamdata ) )
                    {
                        camerapos = level.playerviewowner getxcamposition( xcamdata.name, 0, xcamdata.index, xcamdata.entity.origin, xcamdata.entity.angles );
                        cameraangles = level.playerviewowner getxcamangles( xcamdata.name, 0, xcamdata.index, xcamdata.entity.origin, xcamdata.entity.angles );
                    }
                    else
                    {
                        camerapos = level.camera_anchor.origin;
                        cameraangles = level.camera_anchor.angles;
                    }
                    
                    setdvar( @"hash_f83aafe36491d7eb", 1 );
                    setdvar( @"lui_enabled", 0 );
                    
                    if ( !level.playerviewowner isufo() )
                    {
                        level.playerviewowner ufo();
                    }
                    
                    if ( isdefined( camerapos ) && isdefined( cameraangles ) )
                    {
                        level.playerviewowner setorigin( camerapos );
                        level.playerviewowner setplayerangles( cameraangles );
                    }
                }
                else
                {
                    level.playerviewowner setorigin( level.var_9ad00eb6a518bf32 );
                    level.playerviewowner setplayerangles( level.var_9f0069409b7032b8 );
                    level.var_9ad00eb6a518bf32 = undefined;
                    level.var_9f0069409b7032b8 = undefined;
                    setdvar( @"hash_f83aafe36491d7eb", 0 );
                    setdvar( @"lui_enabled", 1 );
                    
                    if ( level.playerviewowner isufo() )
                    {
                        level.playerviewowner ufo();
                    }
                }
                
                level.var_b276f5acc2808109 = var_8330d549e217ea09;
            }
            
            waitframe();
        }
    }

#/

// Namespace frontendutils
// Params 1
// Checksum 0xbb124ce5, Offset: 0x4f25
// Size: 0x42
function client_scene_begin_transition( fadetime = 0.1 )
{
    println( "<dev string:x2f>" );
    frontendscenecamerafade( 0, fadetime );
    wait fadetime + 0.05;
    setomnvar( "frontend_screen_black", 1 );
}

// Namespace frontendutils
// Params 1
// Checksum 0xf6e8f059, Offset: 0x4f6f
// Size: 0x44
function client_scene_end_transition( delayms )
{
    println( "<dev string:x43>" );
    fadetime = delayms ?? 100;
    frontendscenecamerafade( 1, fadetime / 1000 );
    setomnvar( "frontend_screen_black", 0 );
}

// Namespace frontendutils
// Params 2
// Checksum 0x36b35cb3, Offset: 0x4fbb
// Size: 0x104
function client_scene_play( scenename, args )
{
    println( "<dev string:x55>" );
    channel = args[ 0 ];
    isimmediate = int( args[ 1 ] ) == 1;
    var_7453e171886cd548 = args[ 2 ];
    shots = [];
    
    for ( i = 3; i < args.size ; i++ )
    {
        shots[ shots.size ] = args[ i ];
    }
    
    if ( shots.size == 0 )
    {
        shots = undefined;
    }
    
    if ( isdefined( scenename ) )
    {
        if ( client_scene_stop( isimmediate ) )
        {
            level.var_e1ef2c5e3a98354e = spawnstruct();
            
            if ( var_7453e171886cd548 && var_7453e171886cd548.size > 0 )
            {
                level.var_e1ef2c5e3a98354e.script_scenescriptbundle = scenename;
                level.var_e1ef2c5e3a98354e scene::function_a2a5e7f267b0ca05( var_7453e171886cd548 );
            }
            
            level.var_e1ef2c5e3a98354e thread scene::play( undefined, shots, scenename );
        }
    }
    
    setomnvar( "ui_client_scene_ready_1", gettime() );
}

// Namespace frontendutils
// Params 1
// Checksum 0xd2d9cbb3, Offset: 0x50c7
// Size: 0x19a, Type: bool
function client_scene_stop( immediate )
{
    self notify( "8c4d182ee1af0621" );
    self endon( "8c4d182ee1af0621" );
    
    if ( !immediate )
    {
        client_scene_begin_transition();
    }
    
    if ( isdefined( level.var_e1ef2c5e3a98354e ) )
    {
        level.var_e1ef2c5e3a98354e scene::stop();
        level.var_e1ef2c5e3a98354e scene::cleanup();
    }
    
    if ( isdefined( level.var_a68b535c077ea5c7 ) )
    {
        level.var_a68b535c077ea5c7 scene::stop();
        level.var_a68b535c077ea5c7 scene::cleanup();
    }
    
    if ( isdefined( level.var_3807038a8b9f5e45 ) )
    {
        level.var_3807038a8b9f5e45 scene::stop();
        level.var_3807038a8b9f5e45 scene::cleanup();
    }
    
    if ( isdefined( level.var_42d224f3167f13db ) )
    {
        level.var_42d224f3167f13db scene::stop();
        level.var_42d224f3167f13db scene::cleanup();
    }
    
    foreach ( character in level.client_characters )
    {
        if ( isdefined( character ) )
        {
            character function_de4866729f37f5d2( 1 );
        }
    }
    
    function_88b02b89da25811d();
    
    if ( isdefined( level.playerviewowner ) )
    {
        level.playerviewowner cameralinkto( level.camera_anchor, "tag_origin" );
    }
    
    setomnvar( "ui_client_scene_ready_1", gettime() );
    return true;
}

// Namespace frontendutils
// Params 2
// Checksum 0xe6dec700, Offset: 0x526a
// Size: 0x2dc
function operator_scene_play( scenename, args )
{
    if ( !isdefined( level.var_a68b535c077ea5c7 ) )
    {
        level.var_a68b535c077ea5c7 = spawnstruct();
    }
    
    if ( !isdefined( level.var_3807038a8b9f5e45 ) )
    {
        level.var_3807038a8b9f5e45 = spawnstruct();
    }
    
    channel = args[ 0 ];
    faction = args[ 1 ];
    shottype = args[ 2 ];
    resetcharacter = args[ 3 ] == "true";
    var_4f5d892f1378b0c7 = args[ 4 ] == "true";
    sceneroot = undefined;
    var_877769e93149cb16 = undefined;
    shots = undefined;
    
    if ( var_4f5d892f1378b0c7 )
    {
        if ( faction == "west" )
        {
            alignent = getent( "charroom_char_tango_scene_west_cer", #targetname );
        }
        else if ( faction == "east" )
        {
            alignent = getent( "charroom_char_tango_scene_east_cer", #targetname );
        }
        
        var_877769e93149cb16 = "ui_client_scene_ready_1";
        level.var_a68b535c077ea5c7 scene::cleanup();
        level.var_3807038a8b9f5e45 scene::cleanup();
        level.client_characters[ 15 ] function_de4866729f37f5d2( 0 );
        level.client_characters[ 14 ] function_de4866729f37f5d2( 0 );
    }
    
    if ( faction == "west" )
    {
        sceneroot = level.var_a68b535c077ea5c7;
        
        if ( !isdefined( var_877769e93149cb16 ) )
        {
            var_877769e93149cb16 = "ui_client_scene_ready_1";
        }
        
        scenecharacter = level.client_characters[ 14 ];
    }
    else if ( faction == "east" )
    {
        sceneroot = level.var_3807038a8b9f5e45;
        
        if ( !isdefined( var_877769e93149cb16 ) )
        {
            var_877769e93149cb16 = "ui_client_scene_ready_2";
        }
        
        scenecharacter = level.client_characters[ 15 ];
    }
    
    if ( !isdefined( alignent ) )
    {
        alignent = getent( "charroom_char_tango_scene_center_cer", #targetname );
    }
    
    assert( isdefined( alignent ) );
    sceneroot.origin = alignent.origin;
    sceneroot.angles = alignent.angles;
    
    if ( shottype == "select" )
    {
        shots = [ "intro", "loop" ];
    }
    else
    {
        shots = [ "conf_intro", "conf_loop" ];
    }
    
    sceneroot notify( "operator_scene_play" );
    sceneroot endon( "operator_scene_play" );
    setomnvar( var_877769e93149cb16, gettime() );
    
    if ( isdefined( sceneroot ) && !var_4f5d892f1378b0c7 )
    {
        sceneroot scene::cleanup();
    }
    
    sceneroot.script_scenescriptbundle = scenename;
    sceneroot scene::function_f40e088831060345( 0 );
    sceneroot childthread scene::play( undefined, shots, scenename );
    scenecharacter function_de4866729f37f5d2( 1 );
    
    if ( resetcharacter )
    {
        scenecharacter dontinterpolate();
    }
    
    println( "<dev string:x63>" + faction + "<dev string:x76>" + shottype + "<dev string:x76>" + getxhashsourcename( scenename ) );
}

// Namespace frontendutils
// Params 3
// Checksum 0x76861e10, Offset: 0x554e
// Size: 0x46
function function_a422fa18c901092e( sceneroot, scenecharacter, var_877769e93149cb16 )
{
    if ( isdefined( sceneroot ) )
    {
        sceneroot scene::cleanup();
    }
    
    if ( isdefined( scenecharacter ) )
    {
        scenecharacter function_de4866729f37f5d2( 0 );
    }
    
    setomnvar( var_877769e93149cb16, gettime() );
}

// Namespace frontendutils
// Params 2
// Checksum 0x45cdb32a, Offset: 0x559c
// Size: 0xc6
function operator_scene_stop( unused, args )
{
    channel = args[ 0 ];
    faction = args[ 1 ];
    
    if ( !isdefined( faction ) || faction == "west" )
    {
        sceneroot = level.var_a68b535c077ea5c7;
        scenecharacter = level.client_characters[ 14 ];
        var_877769e93149cb16 = "ui_client_scene_ready_1";
        function_a422fa18c901092e( sceneroot, scenecharacter, var_877769e93149cb16 );
    }
    
    if ( !isdefined( faction ) || faction == "east" )
    {
        sceneroot = level.var_3807038a8b9f5e45;
        scenecharacter = level.client_characters[ 15 ];
        var_877769e93149cb16 = "ui_client_scene_ready_2";
        function_a422fa18c901092e( sceneroot, scenecharacter, var_877769e93149cb16 );
    }
}

// Namespace frontendutils
// Params 0
// Checksum 0xeff6dff2, Offset: 0x566a
// Size: 0xd1
function function_5ed2e69bf39fa531()
{
    if ( !isdefined( level.var_42d224f3167f13db ) )
    {
        level.var_42d224f3167f13db = spawnstruct();
    }
    
    scenecharacters = level.var_42d224f3167f13db scene::function_48ea223b2dfda0();
    
    if ( isdefined( scenecharacters ) )
    {
        foreach ( character in scenecharacters )
        {
            level.client_characters[ character.characterindex - 1 ] function_de4866729f37f5d2( 0 );
        }
    }
    
    level.var_42d224f3167f13db scene::cleanup();
}

// Namespace frontendutils
// Params 2
// Checksum 0xe4b5b2fd, Offset: 0x5743
// Size: 0x50
function battlepass_scene_stop( unused, args )
{
    self notify( "269a7ff9aadd455b" );
    self endon( "269a7ff9aadd455b" );
    channel = args[ 0 ];
    client_scene_begin_transition();
    function_5ed2e69bf39fa531();
    setomnvar( "ui_client_scene_ready_1", gettime() );
}

// Namespace frontendutils
// Params 2
// Checksum 0x7bca5516, Offset: 0x579b
// Size: 0x187
function battlepass_scene_play( scenename, args )
{
    channel = args[ 0 ];
    
    if ( !isdefined( level.var_42d224f3167f13db ) )
    {
        level.var_42d224f3167f13db = spawnstruct();
    }
    
    aligntarget = function_28d43ffc378eedeb( "battlepass_align_target_cer" );
    
    if ( isdefined( aligntarget ) )
    {
        level.var_42d224f3167f13db.origin = aligntarget.origin;
        level.var_42d224f3167f13db.angles = aligntarget.angles;
    }
    
    if ( isdefined( scenename ) )
    {
        function_5ed2e69bf39fa531();
        level.var_42d224f3167f13db.script_scenescriptbundle = scenename;
        scenecharacters = level.var_42d224f3167f13db scene::function_48ea223b2dfda0();
        
        if ( isdefined( scenecharacters ) )
        {
            foreach ( character in scenecharacters )
            {
                level.client_characters[ character.characterindex - 1 ] function_de4866729f37f5d2( 1 );
            }
        }
        
        level.var_42d224f3167f13db thread scene::play( undefined, undefined, scenename );
        setomnvar( "ui_client_scene_ready_1", gettime() );
        client_scene_end_transition();
    }
}

// Namespace frontendutils
// Params 2
// Checksum 0x5a27ff82, Offset: 0x592a
// Size: 0x1e1
function function_e61ab3600302cfb0( unused, args )
{
    channel = args[ 0 ];
    xcamref = args[ 1 ];
    alignref = args[ 2 ];
    blendtime = float( args[ 3 ] ?? 0.1 );
    fov = args[ 4 ] ? float( args[ 4 ] ) : undefined;
    fstop = args[ 5 ] ? float( args[ 5 ] ) : undefined;
    focusdistance = args[ 6 ] ? float( args[ 6 ] ) : undefined;
    focusspeed = args[ 7 ] ? float( args[ 7 ] ) : undefined;
    aperturespeed = args[ 8 ] ? float( args[ 8 ] ) : undefined;
    fadeouttime = args[ 9 ] ? float( args[ 9 ] ) : undefined;
    fadeintime = args[ 10 ] ? float( args[ 10 ] ) : undefined;
    
    if ( fadeouttime > 0 )
    {
        frontendscenecamerafade( 0, fadeouttime );
        wait fadeouttime;
    }
    
    if ( isdefined( xcamref ) && isdefined( alignref ) )
    {
        alignent = function_28d43ffc378eedeb( alignref );
        level.xcam_anchor.origin = alignent.origin;
        level.xcam_anchor.angles = alignent.angles;
        function_3fcf5d33b6d4cdfc( xcamref, 0, blendtime, level.xcam_anchor );
        wait blendtime;
    }
    
    if ( isdefined( fov ) )
    {
        frontendscenecamerafov( fov, blendtime );
    }
    
    if ( isdefined( fstop ) && isdefined( focusdistance ) )
    {
        self setphysicaldepthoffield( fstop, focusdistance, focusspeed, aperturespeed );
    }
    
    if ( fadeintime > 0 )
    {
        frontendscenecamerafade( 1, fadeintime );
    }
}

// Namespace frontendutils
// Params 2
// Checksum 0x37d3ea21, Offset: 0x5b13
// Size: 0x68
function function_49ac8cd8d3cc2474( unused, args )
{
    channel = args[ 0 ];
    pbgbank = int( args[ 1 ] );
    transitiontime = int( args[ 2 ] );
    
    if ( pbgbank < 1 || pbgbank > 8 )
    {
        pbgbank = 1;
    }
    
    function_ad915db840c90fb3( 1023, pbgbank, transitiontime );
}

// Namespace frontendutils
// Params 2
// Checksum 0xabc053c7, Offset: 0x5b83
// Size: 0x10b
function function_c788a94f8af5678e( statekey, args )
{
    channel = args[ 0 ];
    scriptablename = args[ 1 ];
    partname = args[ 2 ];
    assert( isdefined( scriptablename ) );
    assert( isdefined( partname ) );
    assert( isdefined( statekey ) );
    scriptables = getscriptablearray( "scriptable_" + scriptablename, #classname );
    
    if ( scriptables.size == 0 )
    {
        scriptables = getscriptablearray( scriptablename, #classname );
    }
    
    foreach ( scriptable in scriptables )
    {
        scriptable utility::function_7c10ea82c1e305b8( partname, statekey );
    }
}

// Namespace frontendutils
// Params 0
// Checksum 0x192a5474, Offset: 0x5c96
// Size: 0x17c
function function_206e476c61647ec1()
{
    if ( !level.var_88cd03d85d960fe0 )
    {
        setup_rarity_ui_images();
    }
    
    initialize_transition_array();
    function_d18261add9ef0f1();
    level ui::function_770abf131329ffc7( "client_scene_play", &client_scene_play );
    level ui::lui_registercallback( "client_scene_stop", &client_scene_stop );
    level ui::lui_registercallback( "client_scene_begin_transition", &client_scene_begin_transition );
    level ui::lui_registercallback( "client_scene_end_transition", &client_scene_end_transition );
    level ui::function_770abf131329ffc7( "operator_scene_play", &operator_scene_play );
    level ui::function_770abf131329ffc7( "operator_scene_stop", &operator_scene_stop );
    level ui::function_770abf131329ffc7( "battlepass_scene_play", &battlepass_scene_play );
    level ui::function_770abf131329ffc7( "battlepass_scene_stop", &battlepass_scene_stop );
    level ui::function_770abf131329ffc7( "set_xcam", &function_e61ab3600302cfb0 );
    level ui::function_770abf131329ffc7( "enable_pbg_bank", &function_49ac8cd8d3cc2474 );
    level ui::function_770abf131329ffc7( "reset_preview_weapon_loc", &reset_preview_weapon_loc );
    level ui::function_770abf131329ffc7( "set_scriptable_part_state", &function_c788a94f8af5678e );
    
    /#
        thread debug_frontend();
        thread function_f6794b7a210ff9ff();
        thread function_850dd9a21b448b1();
        thread function_dd77993942850706();
        thread function_1c648417bf9191d();
        thread function_4dbf025e46bc2e18();
    #/
    
    scene::function_6c37456303b2e980();
    function_1b330152ff680483();
    function_9af2b71c5be87a60();
    function_5df3d82b0e04c187();
    function_ad915db840c90fb3( 1023, 1, 0 );
    thread frontend_camera_watcher( &camera_section_change );
    thread luinotifylistener();
    level thread function_701e6afbffd77a75();
    callback::add( "on_camera_section_change", &on_camera_section_change );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x18a32e75, Offset: 0x5e1a
// Size: 0x126
function private function_1b330152ff680483()
{
    if ( !isdefined( level.gamemodebundle.lobbyscene ) )
    {
        return;
    }
    
    var_1c9fda0e4ae3280e = { #script_scenescriptbundle:level.gamemodebundle.lobbyscene };
    a_str_shot_names = var_1c9fda0e4ae3280e scene::function_837e044d37c5d180();
    
    foreach ( str_shot_name in a_str_shot_names )
    {
        scene::add_scene_func( level.gamemodebundle.lobbyscene, &function_664032a4fd238731, str_shot_name );
    }
    
    scene::add_scene_func( level.gamemodebundle.lobbyscene, &function_8d919afa271a4c61, "callback_play" );
    scene::add_scene_func( level.gamemodebundle.lobbyscene, &function_ffaf15b6f8fc3543, "callback_stop" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x9044e658, Offset: 0x5f48
// Size: 0xe
function private function_8d919afa271a4c61()
{
    function_2fc5be39a1fe02a1( "off" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x779b2191, Offset: 0x5f5e
// Size: 0x41
function private function_ffaf15b6f8fc3543()
{
    function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
    function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
    function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xc988b68c, Offset: 0x5fa7
// Size: 0x25
function private function_2fc5be39a1fe02a1( str_state )
{
    function_bb689db6e91e0502();
    function_caec36e072ddb3b3( level.var_70ef0fa6eb5df70c, str_state );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xb18410c6, Offset: 0x5fd4
// Size: 0x122
function private function_df35313bef805210()
{
    switch ( getprojectname() )
    {
        case #"hash_7e32e86cd2341797":
            if ( !isdefined( level.var_558465f7607afc67 ) )
            {
                level.var_558465f7607afc67 = getscriptablearray( "scriptable_sat_frontend_bink_screen_lobby_a", #classname );
            }
            
            if ( !isdefined( level.var_558466f7607afe9a ) )
            {
                level.var_558466f7607afe9a = getscriptablearray( "scriptable_sat_frontend_bink_screen_lobby_b", #classname );
            }
            
            if ( !isdefined( level.var_558467f7607b00cd ) )
            {
                level.var_558467f7607b00cd = getscriptablearray( "scriptable_sat_frontend_bink_screen_lobby_c", #classname );
            }
            
            break;
        case #"hash_5997716cbf245d52":
        default:
            if ( !isdefined( level.var_558465f7607afc67 ) )
            {
                level.var_558465f7607afc67 = getscriptablearray( "scriptable_t10_frontend_bink_screen_lobby_a", #classname );
            }
            
            if ( !isdefined( level.var_558466f7607afe9a ) )
            {
                level.var_558466f7607afe9a = getscriptablearray( "scriptable_t10_frontend_bink_screen_lobby_b", #classname );
            }
            
            if ( !isdefined( level.var_558467f7607b00cd ) )
            {
                level.var_558467f7607b00cd = getscriptablearray( "scriptable_t10_frontend_bink_screen_lobby_c", #classname );
            }
            
            break;
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x7c37bda3, Offset: 0x60fe
// Size: 0x86
function private function_bb689db6e91e0502()
{
    switch ( getprojectname() )
    {
        case #"hash_7e32e86cd2341797":
            if ( !isdefined( level.var_70ef0fa6eb5df70c ) )
            {
                level.var_70ef0fa6eb5df70c = getscriptablearray( "scriptable_sat_frontend_playlist_select_bink_player", #classname );
            }
            
            break;
        case #"hash_5997716cbf245d52":
        default:
            if ( !isdefined( level.var_70ef0fa6eb5df70c ) )
            {
                level.var_70ef0fa6eb5df70c = getscriptablearray( "scriptable_t10_frontend_playlist_select_bink_player", #classname );
            }
            
            break;
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xdda9e221, Offset: 0x618c
// Size: 0x443
function private function_664032a4fd238731()
{
    foreach ( sceneplay in self.scenedata.sceneplay )
    {
        var_388edf622604c6d3 = sceneplay.currentshot;
        
        if ( isdefined( var_388edf622604c6d3 ) )
        {
            break;
        }
    }
    
    str_shot = self.scenedata.scenescriptbundle.shots[ var_388edf622604c6d3 ].variant_object.name;
    function_df35313bef805210();
    
    switch ( str_shot )
    {
        case #"hash_90dda3800030aa83":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_90e7358000384c1e":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_90ea3b80003a9427":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_90e0a9800032f28c":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_90e42f8000360415":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "on" );
            break;
        case #"hash_90c12d80001a2a72":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_90c4b380001d3bfb":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "on" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_97e5188003c5c8a5":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_97e2128003c3809c":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_97eb248003ca58b7":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "on" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
        case #"hash_97e81e8003c810ae":
            function_caec36e072ddb3b3( level.var_558465f7607afc67, "off" );
            function_caec36e072ddb3b3( level.var_558466f7607afe9a, "off" );
            function_caec36e072ddb3b3( level.var_558467f7607b00cd, "off" );
            break;
    }
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xae774b03, Offset: 0x65d7
// Size: 0x189
function private function_caec36e072ddb3b3( var_6a3a0b4565af50e6, str_state )
{
    var_37d54380e839c06b = function_23c9640ec20fd50c();
    
    if ( issubstr( str_state, "on" ) )
    {
        if ( getdvar( @"hash_641acaf7833ae51f", "" ) != "" )
        {
            var_f853cfc72c46eea = getdvar( @"hash_641acaf7833ae51f", "" );
        }
        
        if ( isdefined( var_37d54380e839c06b ) )
        {
            if ( isdefined( var_f853cfc72c46eea ) )
            {
                var_2d76d6eb8271950e = var_f853cfc72c46eea + "_" + var_37d54380e839c06b;
            }
            
            var_35cf3de562fb9379 = str_state + "_" + var_37d54380e839c06b;
        }
    }
    
    foreach ( scriptable in var_6a3a0b4565af50e6 )
    {
        b_success = 0;
        
        if ( isdefined( var_2d76d6eb8271950e ) )
        {
            b_success = scriptable utility::function_7c10ea82c1e305b8( "base", var_2d76d6eb8271950e );
        }
        
        if ( !b_success && isdefined( var_35cf3de562fb9379 ) )
        {
            b_success = scriptable utility::function_7c10ea82c1e305b8( "base", var_35cf3de562fb9379 );
        }
        
        if ( !b_success && isdefined( var_f853cfc72c46eea ) )
        {
            b_success = scriptable utility::function_7c10ea82c1e305b8( "base", var_f853cfc72c46eea );
        }
        
        if ( !b_success )
        {
            b_success = scriptable utility::function_7c10ea82c1e305b8( "base", str_state );
        }
    }
    
    /#
        level thread function_79e6fee36800eae0();
    #/
}

/#

    // Namespace frontendutils
    // Params 0, eflags: 0xc
    // Checksum 0xb0622156, Offset: 0x6768
    // Size: 0x1e3, Type: dev
    function private function_79e6fee36800eae0()
    {
        self notify( "bea91e02db0b1fab" );
        self endon( "bea91e02db0b1fab" );
        function_df35313bef805210();
        function_bb689db6e91e0502();
        
        if ( !isdefined( level.var_40ff98ff027fd5e3 ) )
        {
            level.var_40ff98ff027fd5e3 = arraycombineunique( level.var_558465f7607afc67, level.var_558466f7607afe9a, level.var_558467f7607b00cd, level.var_70ef0fa6eb5df70c );
        }
        
        while ( true )
        {
            if ( getdvarint( @"hash_f5d38e563184f94c", 0 ) )
            {
                var_b93a03605a117bc2 = undefined;
                
                foreach ( index, scriptable in level.var_40ff98ff027fd5e3 )
                {
                    var_b93a03605a117bc2 = index;
                    var_d358329fd85f95c = scriptable getscriptablepartstate( "<dev string:x7b>", 1 );
                    
                    if ( isdefined( var_d358329fd85f95c ) )
                    {
                        part = "<dev string:x7b>";
                        state = var_d358329fd85f95c;
                    }
                    else
                    {
                        var_b3a1c4e95c8e52fb = scriptable getscriptablepartstate( "<dev string:x83>", 1 );
                        part = "<dev string:x83>";
                        state = var_b3a1c4e95c8e52fb;
                    }
                    
                    if ( isdefined( state ) )
                    {
                        printtoscreen2d( 750, 600 + 25 * index, function_41bec0232e24ee41( scriptable.classname, "<dev string:x8f>" ) + "<dev string:x9e>" + part + "<dev string:xa9>" + state, ( 0, 1, 0 ), 1.5 );
                    }
                }
                
                var_b93a03605a117bc2++;
                printtoscreen2d( 750, 600 + 25 * var_b93a03605a117bc2, "<dev string:xb6>" + getdvar( @"hash_641acaf7833ae51f", "<dev string:xec>" ), ( 0, 1, 0 ), 1.5 );
            }
            
            waitframe();
        }
    }

#/

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xd6ca576e, Offset: 0x6953
// Size: 0x126
function private function_9af2b71c5be87a60()
{
    if ( !isdefined( level.gamemodebundle.var_79407e020d08ab08 ) )
    {
        return;
    }
    
    var_1c9fda0e4ae3280e = { #script_scenescriptbundle:level.gamemodebundle.var_79407e020d08ab08 };
    a_str_shot_names = var_1c9fda0e4ae3280e scene::function_837e044d37c5d180();
    
    foreach ( str_shot_name in a_str_shot_names )
    {
        scene::add_scene_func( level.gamemodebundle.var_79407e020d08ab08, &function_32a49cbd092e6d0c, str_shot_name );
    }
    
    scene::add_scene_func( level.gamemodebundle.var_79407e020d08ab08, &function_1199b73f976c57e8, "callback_play" );
    scene::add_scene_func( level.gamemodebundle.var_79407e020d08ab08, &function_7450cc218d57de9e, "callback_stop" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x8ff65d05, Offset: 0x6a81
// Size: 0xe
function private function_1199b73f976c57e8()
{
    function_2fc5be39a1fe02a1( "on" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x682994f1, Offset: 0x6a97
// Size: 0xe
function private function_7450cc218d57de9e()
{
    function_2fc5be39a1fe02a1( "off" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xcbad3f36, Offset: 0x6aad
// Size: 0x139
function private function_32a49cbd092e6d0c()
{
    foreach ( sceneplay in self.scenedata.sceneplay )
    {
        var_388edf622604c6d3 = sceneplay.currentshot;
        
        if ( isdefined( var_388edf622604c6d3 ) )
        {
            break;
        }
    }
    
    str_shot = self.scenedata.scenescriptbundle.shots[ var_388edf622604c6d3 ].variant_object.name;
    
    switch ( str_shot )
    {
        case #"hash_e99c5ce6d74f7088":
            function_2fc5be39a1fe02a1( "on" );
            break;
        case #"hash_39bff9b4728ed016":
            var_381165bd70d2eccb = getprojectname() == "WZ2" ? "on_barracks_wz" : "on_barracks";
            function_2fc5be39a1fe02a1( var_381165bd70d2eccb );
            break;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x4f3190ad, Offset: 0x6bee
// Size: 0x132
function private on_camera_section_change( params )
{
    var_ab96ca81f17085d6 = function_23c9640ec20fd50c();
    
    if ( isdefined( var_ab96ca81f17085d6 ) )
    {
        if ( params.newroom == "character_faction_select_l_detail" || params.newroom == "character_tango" )
        {
            level notify( "frontendWorldEvent_singleton" );
            var_4f28aae36427663 = function_cd25f78cc260b2ec();
            
            if ( isdefined( var_4f28aae36427663 ) )
            {
                foreach ( var_c99c6862bc75ff26 in var_4f28aae36427663 )
                {
                    deactivateworldevent( var_c99c6862bc75ff26 );
                }
            }
            
            function_63289211f9b2d936( "base" );
            return;
        }
        
        if ( params.previousroom == "character_faction_select_l_detail" || params.previousroom == "character_tango" )
        {
            var_4f28aae36427663 = function_cd25f78cc260b2ec();
            
            if ( isdefined( var_4f28aae36427663 ) )
            {
                level thread function_71281d1ce6e7636f( var_4f28aae36427663 );
            }
            
            function_63289211f9b2d936( var_ab96ca81f17085d6 );
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x5d26d404, Offset: 0x6d28
// Size: 0x14
function private function_5df3d82b0e04c187()
{
    level ui::function_770abf131329ffc7( "toggle_scriptable_bink", &toggle_scriptable_bink );
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0x4cd5e27, Offset: 0x6d44
// Size: 0x86
function private toggle_scriptable_bink( value, args )
{
    channel = args[ 0 ];
    statename = args[ 1 ];
    
    if ( statename == "on" || statename == "off" )
    {
        function_df35313bef805210();
        function_caec36e072ddb3b3( level.var_558465f7607afc67, statename );
        function_caec36e072ddb3b3( level.var_558466f7607afe9a, statename );
        function_caec36e072ddb3b3( level.var_558467f7607b00cd, statename );
    }
}

// Namespace frontendutils
// Params 0
// Checksum 0xcd4ee846, Offset: 0x6dd2
// Size: 0xdd
function function_cd25f78cc260b2ec()
{
    var_813779cdf59c896a = [];
    level.gamemodebundle = getgamemodescriptbundle();
    
    if ( isdefined( level.gamemodebundle.var_b1892deda6f2a9e3 ) )
    {
        foreach ( var_65b4f4a1125fad53 in level.gamemodebundle.var_b1892deda6f2a9e3 )
        {
            if ( isdefined( var_65b4f4a1125fad53.var_231ba564e573a34a ) )
            {
                var_813779cdf59c896a[ var_813779cdf59c896a.size ] = var_65b4f4a1125fad53.var_231ba564e573a34a;
            }
        }
    }
    
    var_813779cdf59c896a = function_5713d46873b29625( var_813779cdf59c896a );
    
    if ( var_813779cdf59c896a.size )
    {
        return var_813779cdf59c896a;
    }
    
    return undefined;
}

// Namespace frontendutils
// Params 0
// Checksum 0x981d8b91, Offset: 0x6eb8
// Size: 0x22
function function_23c9640ec20fd50c()
{
    level.gamemodebundle = getgamemodescriptbundle();
    return level.gamemodebundle.var_bf2ae5dfc2aa83cd;
}

// Namespace frontendutils
// Params 1
// Checksum 0x995a925b, Offset: 0x6ee3
// Size: 0x199
function function_63289211f9b2d936( gametype )
{
    scriptables = getentitylessscriptablearray( undefined, undefined, undefined, undefined, "gametype" );
    
    foreach ( thing in scriptables )
    {
        if ( thing getscriptableparthasstate( "gametype", gametype ) )
        {
            thing setscriptablepartstate( "gametype", gametype, 1 );
            continue;
        }
        
        thing setscriptablepartstate( "gametype", "base" );
    }
    
    var_28cd373276224d96 = getscriptablearray();
    
    foreach ( var_190128148d2b4261 in var_28cd373276224d96 )
    {
        if ( !var_190128148d2b4261 getscriptablehaspart( "gametype" ) )
        {
            continue;
        }
        
        if ( var_190128148d2b4261 getscriptableparthasstate( "gametype", gametype ) )
        {
            var_190128148d2b4261 setscriptablepartstate( "gametype", gametype, 1 );
            continue;
        }
        
        if ( var_190128148d2b4261 getscriptableparthasstate( "gametype", "base" ) )
        {
            var_190128148d2b4261 setscriptablepartstate( "gametype", "base" );
        }
    }
    
    /#
        level thread function_79e6fee36800eae0();
    #/
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x5483ef7b, Offset: 0x7084
// Size: 0xdd
function private function_71281d1ce6e7636f( var_244b166fc159c48e )
{
    self notify( "frontendWorldEvent_singleton" );
    self endon( "frontendWorldEvent_singleton" );
    var_2c4853f08d3ac696 = getdvarfloat( @"hash_9a16f0a0d73bb50c", 5 );
    var_64c2869d6b6368ae = 0.05;
    total_attempts = var_2c4853f08d3ac696 / var_64c2869d6b6368ae;
    
    for ( attempt = 0; attempt < total_attempts ; attempt++ )
    {
        foreach ( world_event in var_244b166fc159c48e )
        {
            activateworldevent( world_event );
        }
        
        wait var_64c2869d6b6368ae;
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x63e2b633, Offset: 0x7169
// Size: 0x50
function private function_701e6afbffd77a75()
{
    var_538e8850f2c65569 = function_cd25f78cc260b2ec();
    var_ab96ca81f17085d6 = function_23c9640ec20fd50c() ?? "base";
    
    if ( isdefined( var_538e8850f2c65569 ) )
    {
        level thread function_71281d1ce6e7636f( var_538e8850f2c65569 );
    }
    else
    {
        level notify( "frontendWorldEvent_singleton" );
    }
    
    function_63289211f9b2d936( var_ab96ca81f17085d6 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x62172020, Offset: 0x71c1
// Size: 0x12, Type: bool
function private function_7176f1c79eb11a24()
{
    return getdvarint( @"hash_33590a296e061", 0 ) != 0;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x2f7fb3bd, Offset: 0x71dc
// Size: 0x1d, Type: bool
function private function_294daffdcd621d5b()
{
    return level.projectbundle.var_ae604c1391d69161 ?? "";
}

// Namespace frontendutils
// Params 1
// Checksum 0xe35a261e, Offset: 0x7202
// Size: 0x78
function function_28d43ffc378eedeb( entname )
{
    projectname = function_294daffdcd621d5b();
    camera_ent = getent( entname + projectname, #targetname );
    
    if ( projectname != "" && !isdefined( camera_ent ) )
    {
        println( "<dev string:xf0>" + entname + projectname + "<dev string:x125>" );
        camera_ent = getent( entname, #targetname );
    }
    
    return camera_ent;
}

// Namespace frontendutils
// Params 1
// Checksum 0xf2a3bf3, Offset: 0x7283
// Size: 0x78
function function_55f1609e123f6a51( entname )
{
    projectname = function_294daffdcd621d5b();
    var_35bbca8e2cd7f059 = getentarray( entname + projectname, #targetname );
    
    if ( projectname != "" && !isdefined( var_35bbca8e2cd7f059 ) )
    {
        println( "<dev string:x151>" + entname + projectname + "<dev string:x125>" );
        var_35bbca8e2cd7f059 = getentarray( entname, #targetname );
    }
    
    return var_35bbca8e2cd7f059;
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0x6cb1241c, Offset: 0x7304
// Size: 0x143
function private frontend_camera_setup( origin, angles )
{
    level.camera_anchor = spawn( "script_model", origin );
    level.camera_anchor setmodel( "tag_origin" );
    level.camera_anchor.angles = angles;
    level.xcam_anchor = spawn( "script_model", origin );
    level.xcam_anchor setmodel( "tag_origin" );
    level.xcam_anchor.angles = angles;
    level.xcam_anchor.intransition = 0;
    function_15b08432d581df98();
    utility::flag_init( "started_mm" );
    utility::flag_init( "lobby_member_increase" );
    utility::flag_init( "zoom_triggered" );
    utility::flag_init( "zoom_clear" );
    utility::flag_init( "loadout_data_set" );
    utility::flag_init( "force_weapon_update" );
    level.var_ca17ffe77c84226e = getdvarint( @"hash_50f29ef95283dc5d", 0 );
    level.var_4c31323596bf3cdf = getdvarint( @"hash_b704cdc607351cd6", 0 );
    level.cargoenabled = getdvarint( @"hash_ffc75510a2b66232", 0 );
    
    /#
        level thread function_ee91ae6dd9589a34();
    #/
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xfd394d37, Offset: 0x744f
// Size: 0x98
function private function_15b08432d581df98()
{
    level.var_3f7007725429a46f = 0.3;
    level.var_541de3af4cfb72 = [ "tag_silencer", "tag_barrel_attach_small", "tag_barrel_attach_large", "tag_grip_attach", "tag_mag_attach", "j_mag1", "tag_scope", "tag_reflex", "tag_pistolgrip_attach", "tag_stock_attach", "tag_rack_attach", "j_gun", "tag_bipod_attach", "ammo_display_origin" ];
}

// Namespace frontendutils
// Params 0
// Checksum 0x60af85ef, Offset: 0x74ef
// Size: 0x59
function function_43d3e8175a0475e3()
{
    var_f2c04a43f6b0017b = frontendscenegetactivesection();
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    if ( ismgl && var_f2c04a43f6b0017b.name == "" )
    {
        var_f2c04a43f6b0017b.name = "squad_lobby";
    }
    
    return var_f2c04a43f6b0017b;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x369d0ee7, Offset: 0x7551
// Size: 0x249
function private frontend_camera_watcher( var_c445b0d2e33be572 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    assert( isdefined( var_c445b0d2e33be572 ) );
    var_552baa3ae5be9b38 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( !var_552baa3ae5be9b38 )
    {
        if ( getdvarint( @"hash_be485550bea2743", 0 ) )
        {
            frontendscenecamerafade( 0, 0 );
        }
        else if ( isdefined( level.camera_anchor ) )
        {
            self cameralinkto( level.camera_anchor, "tag_origin" );
        }
    }
    
    level.active_section = function_43d3e8175a0475e3();
    [[ var_c445b0d2e33be572 ]]( level.active_section );
    waitframe();
    
    while ( true )
    {
        requested_section = function_43d3e8175a0475e3();
        camera_offsets = function_c0a66894a8558a8e();
        
        if ( !isdefined( level.var_58e40f2765eb474a ) )
        {
            function_f459249a04863bba( camera_offsets );
        }
        else if ( !function_d752a8b42b215271( camera_offsets ) )
        {
            function_f459249a04863bba( camera_offsets );
            waitframe();
            [[ var_c445b0d2e33be572 ]]( requested_section );
        }
        
        if ( requested_section.name == level.active_section.name && isdefined( level.var_24341f580e01cc98 ) && !level.var_24341f580e01cc98 )
        {
            if ( level.active_section.name == getdvar( @"hash_b8cc749b90dd2705" ) && level.active_section.name.size > 0 )
            {
                completescenetransition();
            }
            
            waitframe();
            continue;
        }
        
        if ( requested_section.name.size > 0 )
        {
            level.active_section = requested_section;
            level.var_24341f580e01cc98 = 0;
            setomnvar( "frontend_weapon_position_updated", 0 );
            setomnvar( "frontend_screen_black", 0 );
            level.active_section = requested_section;
            setomnvar( "frontend_weapon_position_updated", 0 );
            setomnvar( "frontend_screen_black", 0 );
            setomnvar( "frontend_weapon_position_force_update", 0 );
            [[ var_c445b0d2e33be572 ]]( requested_section );
            println( "<dev string:x18c>" + requested_section.name );
            continue;
        }
        
        if ( getdvarint( @"hash_95db3fa9650949a0", 1 ) == 1 )
        {
            level.currentsectionname = "";
            level.active_section = requested_section;
        }
        
        waitframe();
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x2d11f5ce, Offset: 0x77a2
// Size: 0xc0
function private function_c0a66894a8558a8e()
{
    cameraoffsets = spawnstruct();
    cameraoffsets.isenabled = getdvarint( @"hash_7e06254351806a5" );
    cameraoffsets.positionoffsets = ( getdvarfloat( @"hash_c7b84c68b4a18696", 0 ), getdvarfloat( @"hash_e26c4a7c1b9dd59f", 0 ), getdvarfloat( @"hash_b20b2898d43b8a68", 0 ) );
    cameraoffsets.orientationoffsets = ( getdvarfloat( @"hash_ff04a85e5dbe51b2", 0 ), getdvarfloat( @"hash_f443ad27538b3297", 0 ), 0 );
    cameraoffsets.var_386c5534018d8e4 = getdvarfloat( @"hash_53605a953e200942", 0 );
    return cameraoffsets;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x3f5abeb2, Offset: 0x786b
// Size: 0x5c
function private function_f459249a04863bba( cameraoffsets )
{
    level.var_7240febd4ea9f2f0 = cameraoffsets.isenabled;
    level.var_58e40f2765eb474a = cameraoffsets.positionoffsets;
    level.var_4d0a590761cc5e5b = cameraoffsets.orientationoffsets;
    level.var_83561b9108e1b9ac = cameraoffsets.var_386c5534018d8e4;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x64a95efa, Offset: 0x78cf
// Size: 0x77
function private function_d752a8b42b215271( cameraoffsets )
{
    if ( level.var_7240febd4ea9f2f0 == cameraoffsets.isenabled && level.var_58e40f2765eb474a == cameraoffsets.positionoffsets && level.var_4d0a590761cc5e5b == cameraoffsets.orientationoffsets && level.var_83561b9108e1b9ac == cameraoffsets.var_386c5534018d8e4 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xff473d54, Offset: 0x794e
// Size: 0xdf
function private camera_section_change( requestedsection )
{
    level notify( "started_scene_change" );
    
    if ( requestedsection.name == "" )
    {
        return;
    }
    
    sectionstate = get_section_state( requestedsection );
    
    if ( !( isdefined( sectionstate[ "scene" ] ) && isdefined( sectionstate[ "camera" ] ) ) )
    {
        level.currentsectionname = requestedsection.name;
        return;
    }
    
    set_active_camera( sectionstate[ "scene" ], sectionstate[ "camera" ] );
    execute_transition( requestedsection, level.currentsectionname );
    callback::callback( "on_camera_section_change", { #previousroom:level.currentsectionname, #newroom:requestedsection.name } );
    level.currentsectionname = requestedsection.name;
    level notify( "finished_scene_change" );
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xaa06c77a, Offset: 0x7a35
// Size: 0x2b
function private set_active_camera( scene, camera )
{
    level.active_scene_data = scene;
    level.active_camera = camera;
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xd0397987, Offset: 0x7a68
// Size: 0x4bd
function private execute_transition( requestedsection, sectionfrom )
{
    var_8bf60784d6fd5e81 = !isdefined( level.active_scene_data ) || level.transition_interrupted;
    
    while ( level.var_9a9e574f38255764 )
    {
        waitframe();
    }
    
    if ( var_8bf60784d6fd5e81 )
    {
        thread frontend_camera_teleport( level.active_camera, level.active_scene_data.myfov, level.active_scene_data.cinematic, 0, 0.2, &update_entities_and_camera );
    }
    
    assert( isdefined( level.transitionarray ), "<dev string:x1ad>" );
    transitionarray = level.transitionarray;
    speed = undefined;
    fov = undefined;
    callback = undefined;
    transition = undefined;
    fadeouttime = undefined;
    fadeintime = undefined;
    cinematicname = undefined;
    accelscalar = undefined;
    decelscalar = undefined;
    movetime = undefined;
    use_bounce = undefined;
    keepxcam = undefined;
    
    if ( isdefined( transitionarray[ requestedsection.name ] ) )
    {
        sectiontransition = transitionarray[ requestedsection.name ];
        defaulttransition = sectiontransition[ "default" ];
        
        if ( isdefined( sectionfrom ) && isdefined( sectiontransition[ sectionfrom ] ) )
        {
            callback = sectiontransition[ sectionfrom ][ "callback" ];
            fov = sectiontransition[ sectionfrom ][ "fov" ];
            speed = sectiontransition[ sectionfrom ][ "speed" ];
            fadeouttime = sectiontransition[ sectionfrom ][ "fadeOutTime" ];
            fadeintime = sectiontransition[ sectionfrom ][ "fadeInTime" ];
            cinematicname = sectiontransition[ sectionfrom ][ "cinematicName" ];
            accelscalar = sectiontransition[ sectionfrom ][ "accelScalar" ];
            decelscalar = sectiontransition[ sectionfrom ][ "decelScalar" ];
            movetime = sectiontransition[ sectionfrom ][ "moveTime" ];
            use_bounce = sectiontransition[ sectionfrom ][ "use_bounce" ];
            keepxcam = sectiontransition[ sectionfrom ][ "keepXCam" ];
            
            if ( isdefined( sectiontransition[ sectionfrom ][ "transition" ] ) )
            {
                transition = sectiontransition[ sectionfrom ][ "transition" ];
            }
        }
        
        if ( !isdefined( callback ) )
        {
            callback = defaulttransition[ "callback" ];
        }
        
        if ( !isdefined( transition ) )
        {
            transition = defaulttransition[ "transition" ];
            
            if ( !isdefined( fov ) )
            {
                fov = defaulttransition[ "fov" ];
            }
            
            if ( !isdefined( speed ) )
            {
                speed = defaulttransition[ "speed" ];
            }
            
            if ( !isdefined( fadeouttime ) )
            {
                fadeouttime = defaulttransition[ "fadeOutTime" ];
            }
            
            if ( !isdefined( fadeintime ) )
            {
                fadeintime = defaulttransition[ "fadeInTime" ];
            }
            
            if ( !isdefined( cinematicname ) )
            {
                cinematicname = defaulttransition[ "cinematicName" ];
            }
            
            if ( !isdefined( accelscalar ) )
            {
                accelscalar = defaulttransition[ "accelScalar" ];
            }
            
            if ( !isdefined( decelscalar ) )
            {
                decelscalar = defaulttransition[ "decelScalar" ];
            }
            
            if ( !isdefined( movetime ) )
            {
                movetime = defaulttransition[ "moveTime" ];
            }
            
            if ( !isdefined( use_bounce ) )
            {
                use_bounce = defaulttransition[ "use_bounce" ];
            }
            
            if ( !isdefined( keepxcam ) )
            {
                keepxcam = defaulttransition[ "keepXCam" ];
            }
        }
    }
    else
    {
        transition = &frontend_camera_teleport;
        callback = &update_camera_depth_of_field;
        tagname = function_8e87b77f70835fd4( requestedsection.name );
        
        if ( isdefined( tagname ) && isdefined( level.var_1d22ece93818d778[ tagname ] ) )
        {
            callback = &set_xcam;
        }
    }
    
    assert( isdefined( transition ) );
    
    if ( transition == &frontend_camera_teleport )
    {
        if ( !isdefined( fov ) )
        {
            fov = level.active_scene_data.myfov;
        }
        
        if ( !isdefined( fadeouttime ) )
        {
            fadeouttime = 0.2;
        }
        
        if ( !isdefined( fadeintime ) )
        {
            fadeintime = 0.2;
        }
        
        if ( !isdefined( cinematicname ) )
        {
            cinematicname = level.active_scene_data.cinematic;
        }
        
        if ( !isdefined( keepxcam ) )
        {
            keepxcam = 0;
        }
        
        [[ transition ]]( level.active_camera, fov, cinematicname, fadeouttime, fadeintime, callback, keepxcam );
    }
    else if ( transition == &frontend_camera_move )
    {
        if ( !isdefined( fov ) )
        {
            fov = level.active_scene_data.myfov;
        }
        
        if ( !isdefined( accelscalar ) )
        {
            accelscalar = 0.1;
        }
        
        if ( !isdefined( decelscalar ) )
        {
            decelscalar = 0.1;
        }
        
        if ( !isdefined( speed ) )
        {
            speed = 5000;
        }
        
        if ( !isdefined( use_bounce ) )
        {
            use_bounce = 0;
        }
        
        if ( !isdefined( movetime ) )
        {
            movetime = 0;
        }
        
        update_camera_depth_of_field();
        frontendscenecamerafov( fov, movetime );
        
        if ( callback == &update_camera_depth_of_field )
        {
            callback = &update_camera_depth_of_field_slowly;
        }
        
        [[ transition ]]( level.active_camera, speed, 0, 1, callback, accelscalar, decelscalar, use_bounce, movetime );
    }
    else
    {
        assert( 0, "<dev string:x1fc>" );
    }
    
    if ( isdefined( level.var_5da65e2e8ad689d0 ) && isdefined( requestedsection.name ) && isdefined( level.var_5da65e2e8ad689d0[ requestedsection.name ] ) )
    {
        [[ level.var_5da65e2e8ad689d0[ requestedsection.name ] ]]( sectionfrom );
    }
    
    if ( isdefined( level.var_d66b59842079fb8e ) && isdefined( sectionfrom ) && isdefined( level.var_d66b59842079fb8e[ sectionfrom ] ) )
    {
        [[ level.var_d66b59842079fb8e[ sectionfrom ] ]]( sectionfrom );
    }
}

// Namespace frontendutils
// Params 6, eflags: 0x4
// Checksum 0xc41be855, Offset: 0x7f2d
// Size: 0x1ff
function private camera_move_helper( moveto, movetime, var_1adb39a59259db47, accelscalar, decelscalar, use_bounce )
{
    level.playerviewowner function_fa0ccd6d13222597( moveto.origin );
    
    if ( movetime < 0.05 )
    {
        movetime = 0.05;
    }
    
    var_eb0caeeb90286a8d = 0;
    var_f7271cfc31d01b2c = 0;
    
    if ( var_1adb39a59259db47 )
    {
        var_eb0caeeb90286a8d = movetime * accelscalar;
        var_f7271cfc31d01b2c = movetime * decelscalar;
    }
    
    if ( use_bounce )
    {
        var_6ca00cff9ec79492 = 1.3;
        dir = vectornormalize( moveto.origin - level.camera_anchor.origin );
        var_b2f8071d8913b538 = moveto.origin + dir * var_6ca00cff9ec79492;
        bouncetime = movetime / 2;
        var_8dbc26a997bde5e4 = bouncetime * 0;
        var_db5b07305d884c0d = bouncetime * 0.5;
        var_7b8eef1937b0111 = bouncetime * 0.5;
        var_f53f29d2d9ed963c = bouncetime * 0;
        level.camera_anchor moveto( var_b2f8071d8913b538, bouncetime, var_8dbc26a997bde5e4, var_db5b07305d884c0d );
        level.camera_anchor rotateto( moveto.angles, bouncetime, var_8dbc26a997bde5e4, var_db5b07305d884c0d );
        wait bouncetime;
        level.camera_anchor moveto( moveto.origin, bouncetime, var_7b8eef1937b0111, var_f53f29d2d9ed963c );
        wait bouncetime;
    }
    else
    {
        level.camera_anchor.move_target = moveto;
        level.camera_anchor moveto( moveto.origin, movetime, var_eb0caeeb90286a8d, var_f7271cfc31d01b2c );
        level.camera_anchor rotateto( moveto.angles, movetime, var_eb0caeeb90286a8d, var_f7271cfc31d01b2c );
    }
    
    level.playerviewowner clearpredictedstreampos();
}

// Namespace frontendutils
// Params 9, eflags: 0x4
// Checksum 0x764b8244, Offset: 0x8134
// Size: 0x45a
function private frontend_camera_move( movetoorigin, speed, var_739d2e550cb0522d, var_1adb39a59259db47, var_5b95545ebb6a9e5d, accelscalar, decelscalar, use_bounce, movetime )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( !isdefined( level.var_6f52e4f6ab0ac2d8 ) )
    {
        level.var_6f52e4f6ab0ac2d8 = [];
    }
    
    if ( !isdefined( level.var_6f52e4f6ab0ac2d8[ movetoorigin.targetname ] ) )
    {
        cameraposition = spawnstruct();
        cameraposition.origin = movetoorigin.origin;
        cameraposition.angles = movetoorigin.angles;
        level.var_6f52e4f6ab0ac2d8[ movetoorigin.targetname ] = cameraposition;
    }
    
    var_e54248c1e29da7df = ( 0, 0, 0 );
    var_dbc4fbf1ce860064 = ( 0, 0, 0 );
    
    if ( getdvarint( @"hash_7e06254351806a5" ) == 1 )
    {
        var_e54248c1e29da7df = ( getdvarfloat( @"hash_c7b84c68b4a18696", 0 ), getdvarfloat( @"hash_e26c4a7c1b9dd59f", 0 ), getdvarfloat( @"hash_b20b2898d43b8a68", 0 ) );
        var_dbc4fbf1ce860064 = ( getdvarfloat( @"hash_ff04a85e5dbe51b2", 0 ), getdvarfloat( @"hash_f443ad27538b3297", 0 ), 0 );
    }
    
    if ( isdefined( level.camera_anchor.move_target ) )
    {
        level.camera_anchor.origin = level.camera_anchor.move_target.origin;
        level.camera_anchor.angles = level.camera_anchor.move_target.angles;
    }
    
    movetoorigin.origin = level.var_6f52e4f6ab0ac2d8[ movetoorigin.targetname ].origin + var_e54248c1e29da7df;
    movetoorigin.angles = level.var_6f52e4f6ab0ac2d8[ movetoorigin.targetname ].angles + var_dbc4fbf1ce860064;
    level notify( "camera_move" );
    level endon( "camera_move" );
    
    if ( !isdefined( speed ) )
    {
        speed = 900;
    }
    
    moveto_origin = movetoorigin;
    
    if ( movetime == 0 )
    {
        dist = distance( level.camera_anchor.origin, moveto_origin.origin );
        movetime = dist / speed;
    }
    
    xcamscene = undefined;
    
    if ( isdefined( level.active_section.name ) )
    {
        xcamscene = level.active_section.name;
        
        if ( !isdefined( level.var_1d22ece93818d778[ xcamscene ] ) )
        {
            xcamscene = function_8e87b77f70835fd4( xcamscene );
        }
    }
    
    var_ea049a95e9728e95 = isdefined( xcamscene ) && isdefined( level.var_1d22ece93818d778[ xcamscene ] );
    var_21133fa861eb1001 = var_5b95545ebb6a9e5d == &set_xcam || var_5b95545ebb6a9e5d == &function_2aa9003d1deb6e99;
    var_4ec6cb721a39a68d = var_739d2e550cb0522d || var_ea049a95e9728e95 && var_21133fa861eb1001;
    
    if ( var_4ec6cb721a39a68d )
    {
        level.camera_anchor.origin = moveto_origin.origin;
        level.camera_anchor.angles = moveto_origin.angles;
    }
    else
    {
        camera_move_helper( moveto_origin, movetime, var_1adb39a59259db47, accelscalar, decelscalar, use_bounce );
    }
    
    var_4f75ec1e76510365 = accelscalar + decelscalar;
    
    if ( var_4f75ec1e76510365 > 1 )
    {
        accelscalar /= var_4f75ec1e76510365;
        decelscalar /= var_4f75ec1e76510365;
    }
    
    while ( isdefined( moveto_origin.target ) && !var_ea049a95e9728e95 )
    {
        if ( !isdefined( moveto_origin.target ) )
        {
            return;
        }
        
        moveto_origin = getent( moveto_origin.target, #targetname );
        camera_move_helper( moveto_origin, movetime, var_1adb39a59259db47, accelscalar, decelscalar, use_bounce );
    }
    
    level.camera_anchor.move_target = undefined;
    
    if ( isdefined( var_5b95545ebb6a9e5d ) )
    {
        self thread [[ var_5b95545ebb6a9e5d ]]();
    }
    
    completescenetransition();
}

// Namespace frontendutils
// Params 7, eflags: 0x4
// Checksum 0x73e3ec90, Offset: 0x8596
// Size: 0x35a
function private frontend_camera_teleport( camera, fov, cinematicname, fadeouttime, fadeintime, var_d1ecabb6e179bdcf, keepxcam )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "camera_teleport" );
    level endon( "camera_teleport" );
    level.playerviewowner function_fa0ccd6d13222597( camera.origin );
    level.transition_interrupted = 1;
    frontendscenecamerafade( 0, fadeouttime );
    wait fadeouttime + 0.05;
    setomnvar( "frontend_screen_black", 1 );
    xcam = function_fcd62fd219292ac7();
    
    if ( isdefined( xcam ) && !keepxcam )
    {
        end_current_xcam();
    }
    
    if ( !isdefined( level.var_6f52e4f6ab0ac2d8 ) )
    {
        level.var_6f52e4f6ab0ac2d8 = [];
    }
    
    if ( !isdefined( level.var_6f52e4f6ab0ac2d8[ camera.targetname ] ) || issubstr( camera.targetname, "cam_bp" ) )
    {
        cameraposition = spawnstruct();
        cameraposition.origin = camera.origin;
        cameraposition.angles = camera.angles;
        level.var_6f52e4f6ab0ac2d8[ camera.targetname ] = cameraposition;
    }
    
    var_e54248c1e29da7df = ( 0, 0, 0 );
    var_dbc4fbf1ce860064 = ( 0, 0, 0 );
    fov_offset = 0;
    
    if ( getdvarint( @"hash_7e06254351806a5" ) == 1 )
    {
        var_e54248c1e29da7df = ( getdvarfloat( @"hash_c7b84c68b4a18696", 0 ), getdvarfloat( @"hash_e26c4a7c1b9dd59f", 0 ), getdvarfloat( @"hash_b20b2898d43b8a68", 0 ) );
        var_dbc4fbf1ce860064 = ( getdvarfloat( @"hash_ff04a85e5dbe51b2", 0 ), getdvarfloat( @"hash_f443ad27538b3297", 0 ), 0 );
        fov_offset = getdvarint( @"hash_53605a953e200942" );
    }
    
    frontendscenecamerafov( fov + fov_offset, 0 );
    level.camera_anchor dontinterpolate();
    level.camera_anchor.origin = level.var_6f52e4f6ab0ac2d8[ camera.targetname ].origin + var_e54248c1e29da7df;
    level.camera_anchor.angles = level.var_6f52e4f6ab0ac2d8[ camera.targetname ].angles + var_dbc4fbf1ce860064;
    level.camera_anchor.move_target = undefined;
    
    if ( isdefined( cinematicname ) )
    {
        frontendscenecameracinematic( cinematicname );
    }
    
    wait 0.1;
    
    if ( function_dc431df3348b6bf2( level.currentsectionname ) )
    {
        update_weapon_loc();
    }
    
    if ( isdefined( var_d1ecabb6e179bdcf ) )
    {
        waitforxcam = undefined;
        
        if ( var_d1ecabb6e179bdcf == &set_xcam )
        {
            waitforxcam = 1;
        }
        
        if ( waitforxcam )
        {
            waitforxcam = [[ var_d1ecabb6e179bdcf ]]();
        }
        else
        {
            [[ var_d1ecabb6e179bdcf ]]();
        }
        
        if ( waitforxcam )
        {
            while ( !isdefined( function_fcd62fd219292ac7() ) )
            {
                waitframe();
            }
        }
    }
    
    frontendscenecamerafade( 1, fadeintime );
    level.transition_interrupted = 0;
    completescenetransition();
    setomnvar( "frontend_screen_black", 0 );
    level.playerviewowner clearpredictedstreampos();
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x53447fc, Offset: 0x88f8
// Size: 0x10a
function private update_character_pos()
{
    /#
        level.var_8b66c86c025c60d5 = [];
    #/
    
    if ( isdefined( level.active_scene_data.update_char_loc ) )
    {
        [[ level.active_scene_data.update_char_loc ]]();
        return;
    }
    
    if ( isdefined( level.active_scene_data.char_loc ) )
    {
        charindex = 0;
        
        if ( isdefined( level.active_scene_data.char_index ) )
        {
            charindex = level.active_scene_data.char_index;
        }
        
        if ( isdefined( level.client_characters[ charindex ] ) )
        {
            function_e2652b74f40fe569( charindex, level.active_scene_data.char_loc.origin, level.active_scene_data.char_loc.angles );
        }
        
        /#
            level function_83a6e6f7190358a4( charindex, level.active_scene_data.char_loc, "<dev string:x229>" + charindex );
        #/
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x271b7833, Offset: 0x8a0a
// Size: 0x1e
function private update_player_character_showcase()
{
    update_character_pos();
    update_weapon_loc();
    update_camera_depth_of_field();
    update_spot_limit();
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x86865b49, Offset: 0x8a30
// Size: 0x62
function private update_camera_depth_of_field()
{
    values = level.active_camera.depthoffieldvalues;
    var_9a0cbb5acae177b2 = 0;
    
    if ( getdvarint( @"hash_7e06254351806a5" ) == 1 )
    {
        var_9a0cbb5acae177b2 = getdvarint( @"hash_53605a953e200942" );
    }
    
    self setphysicaldepthoffield( values[ 0 ], values[ 1 ] + var_9a0cbb5acae177b2, 20, 20 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x8bd087ad, Offset: 0x8a9a
// Size: 0x62
function private update_camera_depth_of_field_slowly()
{
    values = level.active_camera.depthoffieldvalues;
    var_9a0cbb5acae177b2 = 0;
    
    if ( getdvarint( @"hash_7e06254351806a5" ) == 1 )
    {
        var_9a0cbb5acae177b2 = getdvarint( @"hash_53605a953e200942" );
    }
    
    self setphysicaldepthoffield( values[ 0 ], values[ 1 ] + var_9a0cbb5acae177b2, 3, 3 );
}

/#

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0xb3338df2, Offset: 0x8b04
    // Size: 0xe1, Type: dev
    function private function_ee91ae6dd9589a34()
    {
        pval1 = getdvarint( @"hash_e1e483a72c23e49c", 10 );
        pval2 = getdvarint( @"hash_e1e483a72c23e49c", 10 );
        
        while ( true )
        {
            val1 = getdvarint( @"hash_e1e483a72c23e49c", 10 );
            val2 = getdvarint( @"hash_e1e486a72c23eb35", 10 );
            
            if ( isdefined( level.active_camera ) && isdefined( level.active_camera.depthoffieldvalues ) )
            {
                values = level.active_camera.depthoffieldvalues;
            }
            
            if ( pval1 != val1 || pval2 != val2 )
            {
                level.playerviewowner setphysicaldepthoffield( val1, val2, 20, 20 );
                pval1 = val1;
                pval2 = val2;
            }
            
            waitframe();
        }
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x6ad849be, Offset: 0x8bed
    // Size: 0x43, Type: dev
    function private debug_frontend()
    {
        level.var_8b66c86c025c60d5 = [];
        level thread function_9fdd941c429a2a00();
        
        while ( true )
        {
            self waittill( "<dev string:x23c>", msg );
            
            if ( msg == "<dev string:x24f>" )
            {
                function_7a6147bc4943e370();
            }
        }
    }

    // Namespace frontendutils
    // Params 3, eflags: 0x4
    // Checksum 0xf860f59d, Offset: 0x8c38
    // Size: 0x72, Type: dev
    function private function_83a6e6f7190358a4( charindex, charloc, name )
    {
        var_f8b2c3d00edd94e3 = spawnstruct();
        var_f8b2c3d00edd94e3.charindex = charindex;
        var_f8b2c3d00edd94e3.charloc = charloc;
        var_f8b2c3d00edd94e3.name = name;
        level.var_8b66c86c025c60d5[ level.var_8b66c86c025c60d5.size ] = var_f8b2c3d00edd94e3;
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x841b2218, Offset: 0x8cb2
    // Size: 0x5, Type: dev
    function private function_c3d15450ad4a6762()
    {
        
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x93fc14e1, Offset: 0x8cbf
    // Size: 0xbe, Type: dev
    function private function_93105caf41f86382()
    {
        level endon( "<dev string:x266>" );
        self endon( "<dev string:x274>" );
        
        while ( true )
        {
            var_65058f47e7e11621 = getdvarint( @"hash_54d877684382d6b6" );
            
            if ( var_65058f47e7e11621 != -1 )
            {
                foreach ( active_character in level.var_8b66c86c025c60d5 )
                {
                    if ( active_character.charindex == var_65058f47e7e11621 )
                    {
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0xb89b61bf, Offset: 0x8d85
    // Size: 0xed, Type: dev
    function private function_9fdd941c429a2a00()
    {
        level endon( "<dev string:x266>" );
        self endon( "<dev string:x274>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_fcf3e4b333ad71c4" ) )
            {
                foreach ( active_character in level.var_8b66c86c025c60d5 )
                {
                    cylinder( active_character.charloc.origin, active_character.charloc.origin + ( 0, 0, 72 ), 12, ( 0, 0.9, 0 ) );
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xbcf5f6b, Offset: 0x8e7a
// Size: 0xf2
function private update_entities()
{
    update_character_pos();
    
    if ( isdefined( level.active_section ) )
    {
        if ( level.active_section.name == "loadout_showcase_p" || level.active_section.name == "loadout_showcase_s" )
        {
            reset_preview_weapon_loc( undefined, undefined );
        }
    }
    
    update_weapon_loc();
    update_camera_depth_of_field();
    update_spot_limit();
    frontendname = function_610a2cf441ee44();
    
    if ( isdefined( frontendname ) )
    {
        switch ( frontendname )
        {
            case #"hash_33b49ceb2ad730ea":
                function_3094ef6149d9e871();
                break;
            case #"hash_5c36384d9a0c1c35":
                if ( isdefined( level.active_section ) && level.active_section.name == "squad_lobby" )
                {
                    thread update_heli();
                }
                
                break;
            default:
                break;
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xd5dfc14b, Offset: 0x8f74
// Size: 0x1a9
function private update_heli()
{
    level notify( "update_heli" );
    level endon( "game_ended" );
    level endon( "update_heli" );
    level endon( "started_scene_change" );
    self endon( "disconnect" );
    helient = getent( "heli", #targetname );
    
    if ( !isdefined( helient ) )
    {
        return;
    }
    
    if ( !isdefined( level.helibaseorigin ) )
    {
        level.helibaseorigin = helient.origin;
    }
    
    baseorigin = level.helibaseorigin;
    helient.origin = baseorigin;
    totaltime = getdvarfloat( @"hash_9470a7e70b0d21f", 3 ) * 1000;
    timeleft = totaltime;
    up = 1;
    var_158efc5f612e04df = getdvarfloat( @"hash_c6f6bef537c6978d", 5 );
    
    if ( isdefined( level.client_characters[ 0 ] ) )
    {
        level.client_characters[ 0 ] linkto( helient );
        thread function_f0eef59ae34fa43b( helient, level.client_characters[ 0 ] );
    }
    
    while ( true )
    {
        starttime = gettime();
        scalar = easesine( 1 - timeleft / totaltime );
        direction = up ? 1 : -1;
        helient.origin = ( 0, 0, var_158efc5f612e04df * scalar * direction ) + baseorigin;
        waitframe();
        elapsedtime = gettime() - starttime;
        timeleft -= elapsedtime;
        
        if ( timeleft <= 0 )
        {
            baseorigin = helient.origin;
            timeleft = totaltime;
            up = !up;
        }
    }
}

// Namespace frontendutils
// Params 2, eflags: 0xc
// Checksum 0x4b422382, Offset: 0x9125
// Size: 0x5c
function private function_f0eef59ae34fa43b( helient, clientcharacter )
{
    self notify( "793459a73cb6f848" );
    self endon( "793459a73cb6f848" );
    level endon( "game_ended" );
    level endon( "update_heli" );
    self endon( "disconnect" );
    
    if ( !isdefined( helient ) || !isdefined( clientcharacter ) )
    {
        return;
    }
    
    level waittill( "started_scene_change" );
    clientcharacter unlink();
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x3d6d681, Offset: 0x9189
// Size: 0x36
function private update_entities_and_camera( previousscene )
{
    if ( !isdefined( previousscene ) )
    {
        end_current_xcam();
    }
    else if ( function_8e2c1dc1a32a131f( previousscene ) )
    {
        end_current_xcam();
    }
    
    update_entities();
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x87954367, Offset: 0x91c7
// Size: 0x4d
function private update_spot_limit()
{
    if ( isdefined( level.active_scene_data.spotlimit ) )
    {
        setdvar( @"hash_63eb1893f96ac98d", level.active_scene_data.spotlimit );
        return;
    }
    
    setdvar( @"hash_63eb1893f96ac98d", 2 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x382889af, Offset: 0x921c
// Size: 0x1c
function private function_889af88b96ec2f73()
{
    level endon( "game_ended" );
    
    while ( !isdefined( level.var_221796408996e78f ) )
    {
        waitframe();
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x737d6780, Offset: 0x9240
// Size: 0xa09
function private function_7c2d9572caa97fd7( scene )
{
    if ( !isdefined( level.var_221796408996e78f ) )
    {
        function_889af88b96ec2f73();
    }
    
    if ( isdefined( level.var_221796408996e78f ) && level.var_221796408996e78f != scene )
    {
        ismgl = getdvarint( @"mgl", 0 ) > 0;
        
        foreach ( light in level.lightsall )
        {
            light setlightintensity( 0 );
        }
        
        switch ( scene )
        {
            case #"hash_a3d0a83d345a23d9":
                foreach ( light in level.var_fb155cce43da8b9b )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_721dfaa45ab40da3":
                foreach ( light in level.lightsloadout )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_fa9a9f82be7c7750":
                foreach ( light in level.lightscharacter )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_4c6b30f761704c3d":
                foreach ( light in level.lightsoperator )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_d07077b120b56c3e":
                foreach ( light in level.var_e6722c4d18a2c12b )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_f47573a9016e4779":
                foreach ( light in level.var_b9466f9953908544 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_79e89985d0d418c1":
                foreach ( light in level.var_5156c564106cbd70 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_abe21a1fe3c6e374":
                foreach ( light in level.var_3e01573f7fd9f305 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_f59ec880fd3a1e59":
                foreach ( light in level.var_7c8efdf6dc8362f5 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_2d25a7a4dac9123e":
                foreach ( light in level.var_3348476b92fdb9a3 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                foreach ( light in level.var_af0293df1c4dc9c9 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_acd02ca6864b64a6":
                foreach ( light in level.var_d56efe3084c2cde4 )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
            case #"hash_2b7def4e6421f0a2":
                foreach ( light in level.lightsstore )
                {
                    light setlightintensity( light.var_a04f31996e6b5246 );
                }
                
                break;
        }
    }
    
    level.var_221796408996e78f = scene;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x6760e8ea, Offset: 0x9c51
// Size: 0x7a
function private move_weapon_to_loc( index )
{
    level.weapons[ index ].origin = level.active_scene_data.weapon_locs[ index ].origin;
    level.weapons[ index ].angles = level.active_scene_data.weapon_locs[ index ].angles;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xf65d09e0, Offset: 0x9cd3
// Size: 0xb1
function private update_weapon_loc()
{
    if ( isdefined( level.active_scene_data.weapon_locs ) )
    {
        if ( isarray( level.active_scene_data.weapon_locs ) )
        {
            for ( locindex = 0; locindex <= 3 ; locindex++ )
            {
                assert( isdefined( level.weapons[ locindex ] ) );
                
                if ( isdefined( level.active_scene_data.weapon_locs[ locindex ] ) )
                {
                    move_weapon_to_loc( locindex );
                }
            }
        }
    }
    
    if ( issubstr( level.active_section.name, "loadout_showcase_preview" ) )
    {
        setomnvar( "frontend_weapon_position_updated", 1 );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xe0437071, Offset: 0x9d8c
// Size: 0x154
function private function_24387b6af8430fc4()
{
    level.dmz_weapons = [];
    
    for ( wallweaponindex = 0; wallweaponindex < 12 ; wallweaponindex++ )
    {
        weapon_loc = getent( "dmz_wpn_" + wallweaponindex + 1, #targetname );
        
        if ( isdefined( weapon_loc ) )
        {
            weapon_loc hide();
            level.dmz_weapons[ wallweaponindex ] = spawn( "script_weapon", weapon_loc.origin, 0, 0, wallweaponindex );
            level.dmz_weapons[ wallweaponindex ].angles = weapon_loc.angles;
        }
    }
    
    wpnindex = 12;
    
    for ( loadoutweaponindex = 1; loadoutweaponindex <= 3 ; loadoutweaponindex++ )
    {
        for ( var_c9621a4e5e9363aa = 1; var_c9621a4e5e9363aa <= 4 ; var_c9621a4e5e9363aa++ )
        {
            weapon_loc = getent( "dmz_locker_" + loadoutweaponindex + "_wpn_" + var_c9621a4e5e9363aa, #targetname );
            
            if ( isdefined( weapon_loc ) )
            {
                weapon_loc hide();
                level.dmz_weapons[ wpnindex ] = spawn( "script_weapon", weapon_loc.origin, 0, 0, wpnindex );
                level.dmz_weapons[ wpnindex ].angles = weapon_loc.angles;
                wpnindex++;
            }
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x91fde501, Offset: 0x9ee8
// Size: 0x1a4
function private update_arena_char_loc()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    for ( charindex = 0; charindex < 8 ; charindex++ )
    {
        if ( charindex < 4 )
        {
            charloc = function_28d43ffc378eedeb( "tourroom_charslot_left_0" + charindex + 1 );
        }
        else
        {
            adjustedcharindex = charindex - 4;
            charloc = function_28d43ffc378eedeb( "tourroom_charslot_right_0" + adjustedcharindex + 1 );
        }
        
        function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
        
        /#
            if ( charindex < 4 )
            {
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x282>" + charindex + 1 );
                continue;
            }
            
            level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x28f>" + charindex / 2 + 1 );
        #/
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        
        if ( index <= 3 )
        {
            charloc = function_28d43ffc378eedeb( "tourroom_charslot_left_0" + index + "_dog" );
        }
        else
        {
            adjustedindex = index - 3;
            charloc = function_28d43ffc378eedeb( "tourroom_charslot_right_0" + adjustedindex + "_dog" );
        }
        
        function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
        
        /#
            level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x29d>" + index );
        #/
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x563b8007, Offset: 0xa094
// Size: 0x136
function private function_56ec697557e5bcb9()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = function_28d43ffc378eedeb( "social_charslot_01" );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    for ( charindex = 1; charindex < 8 ; charindex++ )
    {
        index = charindex + 1;
        
        if ( index < 10 )
        {
            charloc = function_28d43ffc378eedeb( "social_charslot_0" + index );
        }
        else
        {
            charloc = function_28d43ffc378eedeb( "social_charslot_" + index );
        }
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
        }
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        charloc = function_28d43ffc378eedeb( "social_charslot_0" + index + "_dog" );
        function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xb304d36b, Offset: 0xa1d2
// Size: 0x20a
function private update_lobby_char_loc()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = function_28d43ffc378eedeb( "lobby_charslot_01" );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 0, charloc, "<dev string:x2a9>" );
    #/
    
    if ( isdefined( level.var_bb92290a220ddeaa ) )
    {
        level.var_bb92290a220ddeaa.origin = level.var_bb92290a220ddeaa.originallocation;
        level.var_bb92290a220ddeaa.angles = level.var_bb92290a220ddeaa.originalangles;
        
        if ( isdefined( level.var_901d015765c1117e ) )
        {
            level.var_901d015765c1117e.origin = level.var_901d015765c1117e.originallocation;
        }
    }
    
    for ( charindex = 1; charindex < 8 ; charindex++ )
    {
        index = charindex + 1;
        
        if ( index < 10 )
        {
            charloc = function_28d43ffc378eedeb( "lobby_charslot_0" + index );
        }
        else
        {
            charloc = function_28d43ffc378eedeb( "lobby_charslot_" + index );
        }
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x2bd>" + charindex );
            #/
        }
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        charloc = function_28d43ffc378eedeb( "lobby_charslot_0" + index + "_dog" );
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x29d>" + index );
            #/
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x3430532f, Offset: 0xa3e4
// Size: 0x1f8
function private function_44dd9635c9699967()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = function_28d43ffc378eedeb( "lobby_br_charslot_01" );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 0, charloc, "<dev string:x2c6>" );
    #/
    
    if ( isdefined( level.var_bb92290a220ddeaa ) )
    {
        level.var_bb92290a220ddeaa.origin = ( -7035, 2380, 0 );
        level.var_bb92290a220ddeaa.angles = ( 0, 90, 0 );
        
        if ( isdefined( level.var_901d015765c1117e ) )
        {
            level.var_901d015765c1117e.origin = ( 0, 0, 10000 );
        }
    }
    
    for ( charindex = 1; charindex < 8 ; charindex++ )
    {
        index = charindex + 1;
        
        if ( index < 10 )
        {
            charloc = function_28d43ffc378eedeb( "lobby_br_charslot_0" + index );
        }
        else
        {
            charloc = function_28d43ffc378eedeb( "lobby_br_charslot_" + index );
        }
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x2dc>" + charindex );
            #/
        }
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        charloc = function_28d43ffc378eedeb( "lobby_br_charslot_0" + index + "_dog" );
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x2e7>" + index );
            #/
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xc61b5b22, Offset: 0xa5e4
// Size: 0x197
function private function_150f0637729246ac()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = getent( "lobby_dmz_charslot_01", #targetname );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 0, charloc, "<dev string:x2f5>" );
    #/
    
    for ( charindex = 1; charindex < 8 ; charindex++ )
    {
        index = charindex + 1;
        
        if ( index < 10 )
        {
            charloc = getent( "lobby_dmz_charslot_0" + index, #targetname );
        }
        else
        {
            charloc = getent( "lobby_dmz_charslot_" + index, #targetname );
        }
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x30c>" + charindex );
            #/
        }
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        charloc = getent( "lobby_dmz_charslot_0" + index + "_dog", #targetname );
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x317>" + index );
            #/
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x35248179, Offset: 0xa783
// Size: 0x17b
function private function_74a35d05491a35e()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = function_28d43ffc378eedeb( "crib_dmz_charslot_01" );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 0, charloc, "<dev string:x2f5>" );
    #/
    
    for ( charindex = 1; charindex < 8 ; charindex++ )
    {
        index = charindex + 1;
        
        if ( index < 10 )
        {
            charloc = function_28d43ffc378eedeb( "crib_dmz_charslot_0" + index );
        }
        else
        {
            charloc = function_28d43ffc378eedeb( "crib_dmz_charslot_" + index );
        }
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x326>" + charindex );
            #/
        }
    }
    
    for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
    {
        index = var_2a5740e626ef08b1 + 1;
        charindex = 8 + var_2a5740e626ef08b1;
        charloc = function_28d43ffc378eedeb( "crib_dmz_charslot_0" + index + "_dog" );
        
        if ( isdefined( charloc ) )
        {
            function_e2652b74f40fe569( charindex, charloc.origin, charloc.angles );
            
            /#
                level function_83a6e6f7190358a4( charindex, charloc, "<dev string:x331>" + index );
            #/
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x10bbccc2, Offset: 0xa906
// Size: 0xda
function private update_main_menu_char_loc()
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    charloc = function_28d43ffc378eedeb( "charroom_char_tango_east" );
    function_e2652b74f40fe569( 14, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 14, charloc, "<dev string:x33f>" );
    #/
    
    charloc = function_28d43ffc378eedeb( "charroom_char_tango_west" );
    function_e2652b74f40fe569( 15, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 15, charloc, "<dev string:x34f>" );
    #/
    
    update_operator_west_char_loc();
    update_operator_east_char_loc();
    level.client_characters[ 15 ] function_de4866729f37f5d2( 1 );
    level.client_characters[ 14 ] function_de4866729f37f5d2( 1 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xe8972e69, Offset: 0xa9e8
// Size: 0x4c
function private update_operator_west_char_loc()
{
    charloc = function_28d43ffc378eedeb( "charroom_char_west_b_dog" );
    function_e2652b74f40fe569( 6, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 6, charloc, "<dev string:x35f>" );
    #/
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x3fca06a7, Offset: 0xaa3c
// Size: 0x4c
function private update_operator_east_char_loc()
{
    charloc = function_28d43ffc378eedeb( "charroom_char_east_a_dog" );
    function_e2652b74f40fe569( 7, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 7, charloc, "<dev string:x372>" );
    #/
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xe8ea595b, Offset: 0xaa90
// Size: 0xef
function private function_c2e9d8d8407b0064()
{
    var_ec04f2fab5b324f2 = level.var_3d353e3274a23c81 && getdvarint( @"hash_ceeadc2015e19f38" );
    
    if ( var_ec04f2fab5b324f2 )
    {
        return;
    }
    
    charloc = function_28d43ffc378eedeb( "char_gunbench" );
    function_e2652b74f40fe569( 0, charloc.origin, charloc.angles );
    
    if ( level.var_ccc8d1ad327315cd )
    {
        level.client_characters[ 0 ].origin -= 1000;
    }
    
    /#
        level function_83a6e6f7190358a4( 0, charloc, "<dev string:x385>" );
    #/
    
    charloc = function_28d43ffc378eedeb( "char_gunbench_dog" );
    function_e2652b74f40fe569( 6, charloc.origin, charloc.angles );
    
    /#
        level function_83a6e6f7190358a4( 6, charloc, "<dev string:x395>" );
    #/
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x44e4f8c1, Offset: 0xab87
// Size: 0x270
function private raritycamera( camera )
{
    switch ( camera )
    {
        case #"hash_5971965ed985a26c":
            foreach ( bg in level.ui_bg_images_2d )
            {
                bg.origin = level.raritycamsmall.origin;
            }
            
            break;
        case #"hash_c71b112fe04823d6":
            foreach ( bg in level.ui_bg_images_2d )
            {
                bg.origin = level.raritycammedium.origin;
            }
            
            break;
        case #"hash_4bf33d595d8f4894":
            foreach ( bg in level.ui_bg_images_2d )
            {
                bg.origin = level.raritycamlarge.origin;
            }
            
            break;
        case #"hash_763ef102433d0808":
            foreach ( bg in level.ui_bg_images_2d )
            {
                bg.origin = level.raritycamwatch.origin;
            }
            
            break;
    }
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0x41813049, Offset: 0xadff
// Size: 0x95
function private function_b8b5fc49caf5f121( scenename, waittime )
{
    level notify( "new_operator_xcam" );
    level endon( "game_ended" );
    self endon( "disconnect" );
    level endon( "xcam_transition" );
    level endon( "new_operator_xcam" );
    wait waittime / 1000;
    function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], 0, 0.05, level.xcam_anchor );
    level thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], level.xcam_anchor );
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xd604d48b, Offset: 0xae9c
// Size: 0x3e5
function private function_3fad19a839960056( scenename, flagmsg, previousscene )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_transition" );
    level endon( "xcam_transition" );
    level.xcam_anchor.intransition = 1;
    level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
    level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    
    while ( true )
    {
        if ( !( isdefined( level.var_ddbddc069152b02f ) && isdefined( level.var_4f103db18dbbaee4 ) ) )
        {
            if ( !isdefined( function_fcd62fd219292ac7() ) )
            {
                blendtime = 0;
                
                if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ] ) )
                {
                    blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
                    
                    if ( isdefined( previousscene ) && isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ] ) )
                    {
                        blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ];
                    }
                }
                
                function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], 0, blendtime, level.xcam_anchor );
                level thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], level.xcam_anchor );
            }
            else if ( function_fcd62fd219292ac7().name == "iw9_fe_op_select_east_edit_in_xcam" || function_fcd62fd219292ac7().name == "iw9_fe_op_select_west_edit_in_xcam" )
            {
                blendtime = 0;
                
                if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ] ) )
                {
                    blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
                    
                    if ( isdefined( previousscene ) && isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ] ) )
                    {
                        blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ];
                    }
                }
                
                function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], 0, 0.35, level.xcam_anchor );
                level thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 4 ], level.xcam_anchor );
            }
            
            waitframe();
            continue;
        }
        
        var_e5d3fe1e80e96248 = level.var_ddbddc069152b02f;
        gender = level.var_4f103db18dbbaee4;
        
        if ( gender == 1 )
        {
            gender++;
        }
        
        xcamindex = var_e5d3fe1e80e96248 + gender;
        level.var_ddbddc069152b02f = undefined;
        level.var_4f103db18dbbaee4 = undefined;
        level notify( "new_operator_xcam" );
        blendtime = 0;
        
        if ( isdefined( previousscene ) && isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ] ) && previousscene != "" )
        {
            blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
            
            if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ] ) )
            {
                blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ];
            }
        }
        
        leng = 0;
        
        if ( !level.var_e365d8f09a7f6f27 )
        {
            function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ xcamindex ], 0, blendtime, level.xcam_anchor );
            leng = function_9773f7f795e37351( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ xcamindex ] );
        }
        
        level.var_e365d8f09a7f6f27 = undefined;
        level thread function_b8b5fc49caf5f121( scenename, leng );
        previousscene = "";
        waitframe();
    }
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0x762f1cf1, Offset: 0xb289
// Size: 0x446
function private LUA_TRIGGERED_XCAM_MM( scenename, flagmsg, previousscene )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_transition" );
    level endon( "xcam_transition" );
    level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
    level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    lobbyxcam = level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ];
    
    if ( isdefined( level.var_fa7c8f43d063eb71 ) )
    {
        lobbyxcam = level.var_fa7c8f43d063eb71;
    }
    
    function_3fcf5d33b6d4cdfc( lobbyxcam, 0, 0, level.xcam_anchor );
    level.var_fa7c8f43d063eb71 = lobbyxcam;
    level.xcam_anchor.intransition = 1;
    thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], level.xcam_anchor );
    waittime = undefined;
    waitframe();
    
    while ( true )
    {
        waitframe();
        
        if ( isarray( flagmsg ) )
        {
            utility::function_438248c9d72fbbb3( flagmsg );
            
            foreach ( flagtoclear in flagmsg )
            {
                utility::flag_clear( flagtoclear );
            }
        }
        else
        {
            utility::flag_wait( flagmsg );
            utility::flag_clear( flagmsg );
        }
        
        level notify( "xcam_loop" );
        currentcam = function_fcd62fd219292ac7();
        blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
        
        if ( level.currentflagmsg == "match_making" )
        {
            blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "started_mm" ];
            function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 2 ], 0, blendtime, level.xcam_anchor );
            waittime = max( function_9773f7f795e37351( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 2 ] ) - 1500, 0 );
            break;
        }
        
        if ( level.currentflagmsg == "lobby_member_increase" && level.var_c111bc9d2e9166a9 == 1 && isdefined( currentcam ) && currentcam.name != "fe_lobby_plow_cam_01_idle_01_xcam" )
        {
            blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "lobby_member_increase" ];
            function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], 0, blendtime, level.xcam_anchor );
            thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], level.xcam_anchor );
            level.var_fa7c8f43d063eb71 = level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ];
            continue;
        }
        
        if ( level.currentflagmsg == "lobby_member_increase" && level.var_c111bc9d2e9166a9 > 1 && isdefined( currentcam ) && currentcam.name != "fe_lobby_plow_cam_01_idle_squad_01_xcam" )
        {
            blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "lobby_member_increase" ];
            function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 1 ], 0, blendtime, level.xcam_anchor );
            thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], level.xcam_anchor );
            level.var_fa7c8f43d063eb71 = level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 1 ];
        }
    }
    
    level.var_fa7c8f43d063eb71 = undefined;
    
    if ( waittime > 0 )
    {
        thread function_c127478f4e169197( waittime );
    }
    
    level.xcam_anchor.intransition = 0;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xcffae8d3, Offset: 0xb6d7
// Size: 0x5f
function private function_c127478f4e169197( waittime )
{
    level notify( "matchmaking_fade" );
    level endon( "game_ended" );
    level endon( "matchmaking_fade" );
    level endon( "xcam_transition" );
    level endon( "disconnect" );
    wait waittime / 1000;
    frontendscenecamerafade( 0, 1.5 );
    thread function_1820160e3d227430();
    wait 1.5;
    setomnvar( "frontend_screen_black", 1 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x9fb771fb, Offset: 0xb73e
// Size: 0x43
function private function_1820160e3d227430()
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "camera_teleport" );
    level utility::waittill_any( "xcam_set", "finished_scene_change" );
    frontendscenecamerafade( 1, 0.2 );
    setomnvar( "frontend_screen_black", 0 );
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xa3b2272f, Offset: 0xb789
// Size: 0x44
function private function_8f61bece4244b228( scenename, flagmsg )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "xcam_transition" );
    utility::flag_wait( "zoom_clear" );
    level thread LUA_TRIGGERED_ATTACHMENT_ZOOM( scenename, flagmsg );
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0x555c6c29, Offset: 0xb7d5
// Size: 0x410
function private LUA_TRIGGERED_ATTACHMENT_ZOOM( scenename, flagmsg, previousscene )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_transition" );
    level endon( "xcam_transition" );
    level.xcam_anchor.intransition = 1;
    level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
    level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    
    if ( distancesquared( level.xcam_anchor.origin, ( -5872.09, -3436.26, 0 ) ) > 14000 )
    {
        level.var_b039ebcdd7535c8a = undefined;
        utility::flag_clear( "force_weapon_update" );
        update_weapon_loc();
        waitframe();
        setomnvar( "frontend_weapon_position_force_update", 1 );
        utility::flag_wait( "force_weapon_update" );
        level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
        level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    }
    
    function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], 0, 0, level.xcam_anchor );
    
    if ( isarray( flagmsg ) )
    {
        utility::function_438248c9d72fbbb3( flagmsg );
        
        foreach ( flagtoclear in flagmsg )
        {
            utility::flag_clear( flagtoclear );
        }
    }
    else
    {
        utility::flag_wait( flagmsg );
        utility::flag_clear( flagmsg );
    }
    
    index = 0;
    
    switch ( level.var_7079bd5d79593f20 )
    {
        case #"hash_2630d03d6f5fc192":
            index = 1;
            break;
        case #"hash_ac8941a3f4be6fc5":
            index = 0;
            break;
        case #"hash_6fc1c97a058fdcc9":
            index = 2;
            break;
        case #"hash_c693ed0e3896fe7b":
            index = 3;
            break;
        case #"hash_3c53eb274322e803":
            index = 4;
            break;
        case #"hash_e32d2a49d1ac024c":
            index = 5;
            break;
        case #"hash_c9e63a9bddd371e":
            index = 6;
            break;
        case #"hash_412112410dc298ec":
            index = 7;
            break;
        case #"hash_754f51acf0f54d82":
            index = 8;
            break;
        case #"hash_1f1886e1d0bae31d":
            index = 9;
            break;
        case #"hash_bba42a71d53ec8d0":
            index = 0;
            break;
    }
    
    while ( level.active_section.name == scenename )
    {
        utility::flag_wait( "zoom_triggered" );
        utility::flag_clear( "zoom_triggered" );
        level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
        level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
        function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ index ], 0, level.var_3f7007725429a46f, level.xcam_anchor );
        
        if ( index == 0 )
        {
            level.var_3f7007725429a46f = 0.3;
        }
    }
    
    level.xcam_anchor.intransition = 0;
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0x7e5dac53, Offset: 0xbbed
// Size: 0x13a
function private function_2aa9003d1deb6e99( scenename, flagmsg, previousscene )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_transition" );
    level endon( "xcam_transition" );
    blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
    
    if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ] ) )
    {
        blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ previousscene ];
    }
    
    while ( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ] == "" )
    {
        waitframe();
    }
    
    level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
    level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], 0, blendtime, level.xcam_anchor );
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xf1e6fa84, Offset: 0xbd2f
// Size: 0x9a
function private loop_xcam( xcam, xcam_anchor )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_loop" );
    level endon( "xcam_loop" );
    level endon( "xcam_transition" );
    level endon( "new_operator_xcam" );
    
    while ( true )
    {
        leng = function_9773f7f795e37351( xcam );
        
        if ( leng <= 0 )
        {
            waitframe();
            continue;
        }
        else
        {
            wait leng / 1000;
        }
        
        function_3fcf5d33b6d4cdfc( xcam, 0, 0.3, xcam_anchor );
    }
    
    level.xcam_anchor.intransition = 0;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x4f33ada4, Offset: 0xbdd1
// Size: 0x2ec
function private xcam_transition( scenename )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "xcam_transition" );
    level endon( "xcam_transition" );
    transitionsize = level.var_1d22ece93818d778[ scenename ][ "transitions" ].size;
    
    if ( transitionsize == 0 )
    {
        return;
    }
    
    if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "callback" ] ) && isdefined( level.var_1d22ece93818d778[ scenename ][ "flag_msg" ] ) )
    {
        level thread [[ level.var_1d22ece93818d778[ scenename ][ "callback" ] ]]( scenename, level.var_1d22ece93818d778[ scenename ][ "flag_msg" ], level.currentsectionname );
        return;
    }
    
    if ( isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ] ) )
    {
        blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ "default" ];
        
        if ( isdefined( level.currentsectionname ) && isdefined( level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ level.currentsectionname ] ) )
        {
            blendtime = level.var_1d22ece93818d778[ scenename ][ "blend_time" ][ level.currentsectionname ];
        }
    }
    
    if ( !isdefined( blendtime ) )
    {
        blendtime = 0;
    }
    
    level.xcam_anchor.origin = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].origin;
    level.xcam_anchor.angles = level.var_1d22ece93818d778[ scenename ][ "xcam_data" ].angles;
    
    if ( transitionsize == 1 )
    {
        function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], 0, blendtime, level.xcam_anchor );
        
        if ( level.var_1d22ece93818d778[ scenename ][ "loop_last" ] )
        {
            level thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ 0 ], level.xcam_anchor );
        }
        
        return;
    }
    
    level.xcam_anchor.intransition = 1;
    
    for ( i = 0; i < transitionsize ; i++ )
    {
        function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ i ], 0, blendtime, level.xcam_anchor );
        
        if ( i < transitionsize - 1 )
        {
            leng = function_9773f7f795e37351( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ i ] );
            wait leng / 1000;
        }
    }
    
    if ( level.var_1d22ece93818d778[ scenename ][ "loop_last" ] )
    {
        level thread loop_xcam( level.var_1d22ece93818d778[ scenename ][ "transitions" ][ transitionsize - 1 ], level.xcam_anchor );
        return;
    }
    
    level.xcam_anchor.intransition = 0;
}

// Namespace frontendutils
// Params 4, eflags: 0x4
// Checksum 0x6c1f3c02, Offset: 0xc0c5
// Size: 0x80
function private function_3fcf5d33b6d4cdfc( xcam, subcamera, blendtime, xcam_anchor )
{
    tmpanchor = xcam_anchor;
    
    if ( isdefined( level.xcam_offset ) )
    {
        tmpanchor.origin += level.xcam_offset;
    }
    
    level.xcam_offset = undefined;
    function_41797a7aad14e175( xcam, subcamera, blendtime, tmpanchor );
    level notify( "xcam_set" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x4afbdc8e, Offset: 0xc14d
// Size: 0xec
function private set_xcam()
{
    update_entities_and_camera( level.currentsectionname );
    
    if ( !isdefined( level.var_1d22ece93818d778 ) )
    {
        return;
    }
    
    scenename = level.active_section.name;
    
    if ( !function_270ae4327a1f5bbd( scenename ) && !function_dc431df3348b6bf2( scenename ) && level.var_b039ebcdd7535c8a )
    {
        level.var_b039ebcdd7535c8a = undefined;
    }
    
    if ( function_dc431df3348b6bf2( scenename ) )
    {
        function_adcb617248dab87e();
    }
    
    if ( !isdefined( level.var_1d22ece93818d778[ scenename ] ) )
    {
        scenename = function_8e87b77f70835fd4( scenename );
    }
    
    if ( isdefined( scenename ) && isdefined( level.var_1d22ece93818d778[ scenename ] ) )
    {
        if ( function_610a2cf441ee44() == "mp_frontend3" )
        {
            function_1e51608a0fb8becd( scenename );
        }
        
        level.xcam_anchor.intransition = 0;
        level thread xcam_transition( scenename );
        return 1;
    }
    
    return 0;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x8ff47ff1, Offset: 0xc242
// Size: 0x1c7, Type: bool
function private function_8e2c1dc1a32a131f( previousscene )
{
    activexcam = function_fcd62fd219292ac7();
    scenename = level.active_section.name;
    
    if ( !isdefined( activexcam ) )
    {
        return false;
    }
    
    if ( !isdefined( level.transitionarray[ scenename ] ) )
    {
        return true;
    }
    
    transition = undefined;
    
    if ( isdefined( level.transitionarray[ scenename ][ previousscene ] ) && isdefined( level.transitionarray[ scenename ][ previousscene ][ "transition" ] ) )
    {
        transition = level.transitionarray[ scenename ][ previousscene ][ "transition" ];
    }
    else if ( isdefined( level.transitionarray[ scenename ][ "default" ] ) && isdefined( level.transitionarray[ scenename ][ "default" ][ "transition" ] ) )
    {
        transition = level.transitionarray[ scenename ][ "default" ][ "transition" ];
    }
    
    if ( !isdefined( transition ) )
    {
        return true;
    }
    
    if ( transition == &frontend_camera_teleport )
    {
        return true;
    }
    
    callback = undefined;
    
    if ( isdefined( level.transitionarray[ scenename ][ previousscene ] ) && isdefined( level.transitionarray[ scenename ][ previousscene ][ "callback" ] ) )
    {
        callback = level.transitionarray[ scenename ][ previousscene ][ "callback" ];
    }
    else if ( isdefined( level.transitionarray[ scenename ][ "default" ] ) && isdefined( level.transitionarray[ scenename ][ "default" ][ "callback" ] ) )
    {
        callback = level.transitionarray[ scenename ][ "default" ][ "callback" ];
    }
    
    if ( !isdefined( callback ) )
    {
        return true;
    }
    
    if ( transition == &frontend_camera_move && callback == &set_xcam )
    {
        return false;
    }
    
    return true;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xc489080b, Offset: 0xc412
// Size: 0x24
function private end_current_xcam()
{
    function_88b02b89da25811d();
    level notify( "xcam_transition" );
    level.xcam_anchor.intransition = 0;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x5a8aa30e, Offset: 0xc43e
// Size: 0x6e
function private function_d18261add9ef0f1()
{
    var_979aed150dd7f5f5 = undefined;
    
    if ( isxhashasset( level.projectbundle.var_db0a9a855f1018e5 ) )
    {
        var_979aed150dd7f5f5 = getscriptbundle( level.projectbundle.var_db0a9a855f1018e5 );
    }
    
    if ( !isdefined( var_979aed150dd7f5f5 ) || getdvarint( @"hash_adcc772a13e07413", 0 ) )
    {
        function_86333647f10b7941();
        return;
    }
    
    function_5cd9e9cb98bb5453( var_979aed150dd7f5f5 );
}

// Namespace frontendutils
// Params 1
// Checksum 0xefa698cf, Offset: 0xc4b4
// Size: 0x16a
function function_5cd9e9cb98bb5453( var_979aed150dd7f5f5 )
{
    var_1d22ece93818d778 = [];
    
    foreach ( xcamanchor in var_979aed150dd7f5f5.var_db0a9a855f1018e5 )
    {
        var_d02cd06ffe133a56 = getscriptbundle( xcamanchor.var_bab505ce5ab925b9 );
        
        if ( isdefined( var_d02cd06ffe133a56 ) && !isdefined( var_1d22ece93818d778[ var_d02cd06ffe133a56.sectionname ] ) )
        {
            var_1d22ece93818d778[ var_d02cd06ffe133a56.sectionname ] = [];
            var_1d22ece93818d778[ var_d02cd06ffe133a56.sectionname ] = function_966a53d8bb70bfed( var_d02cd06ffe133a56 );
            continue;
        }
        
        if ( !isdefined( var_d02cd06ffe133a56 ) )
        {
            assert( 0, "<dev string:x3a8>" + xcamanchor.var_bab505ce5ab925b9 + "<dev string:x3da>" );
            continue;
        }
        
        if ( isdefined( var_d02cd06ffe133a56 ) && isdefined( var_1d22ece93818d778[ var_d02cd06ffe133a56.sectionname ] ) )
        {
            assert( 0, "<dev string:x41d>" );
        }
    }
    
    level.var_29d3d6d1ca17b761 = [];
    level.var_29d3d6d1ca17b761[ 0 ] = "";
    level.var_29d3d6d1ca17b761[ 1 ] = "";
    level.var_1d22ece93818d778 = var_1d22ece93818d778;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xb2e42be, Offset: 0xc626
// Size: 0x3ef
function private function_966a53d8bb70bfed( var_69828e4c36ce3972 )
{
    assert( isdefined( var_69828e4c36ce3972 ), "<dev string:x48b>" );
    var_51f05b419fa744c7 = [];
    
    if ( isdefined( var_69828e4c36ce3972.origindata ) )
    {
        var_51f05b419fa744c7[ "xcam_data" ] = spawnstruct();
        origindata = var_69828e4c36ce3972.origindata;
        xcamorigin = ( origindata.xcamoriginx ?? 0, origindata.xcamoriginy ?? 0, origindata.xcamoriginz ?? 0 );
        xcamangles = ( origindata.var_b5087044b5864cff ?? 0, origindata.var_b5086f44b5864acc ?? 0, origindata.var_b5087244b5865165 ?? 0 );
        var_595e8162f476472f = ( 0, 0, 0 );
        originentityangles = ( 0, 0, 0 );
        
        if ( isdefined( var_69828e4c36ce3972.entity ) && var_69828e4c36ce3972.entity.hasentity )
        {
            originentity = function_28d43ffc378eedeb( var_69828e4c36ce3972.entity.entityname );
            
            if ( isdefined( originentity ) )
            {
                var_595e8162f476472f = originentity.origin;
                originentityangles = originentity.angles;
            }
        }
        
        var_51f05b419fa744c7[ "xcam_data" ].origin = var_595e8162f476472f + xcamorigin;
        var_51f05b419fa744c7[ "xcam_data" ].angles = originentityangles + xcamangles;
    }
    
    var_51f05b419fa744c7[ "transitions" ] = [];
    
    if ( isdefined( var_69828e4c36ce3972.transitions ) )
    {
        for ( i = 0; i < var_69828e4c36ce3972.transitions.size ; i++ )
        {
            var_51f05b419fa744c7[ "transitions" ][ i ] = var_69828e4c36ce3972.transitions[ i ].transition;
        }
    }
    
    var_51f05b419fa744c7[ "blend_time" ] = [];
    
    if ( isdefined( var_69828e4c36ce3972.blendtimes ) )
    {
        foreach ( blendtime in var_69828e4c36ce3972.blendtimes )
        {
            var_51f05b419fa744c7[ "blend_time" ][ blendtime.sectionref ] = blendtime.blendtime ?? 0;
        }
    }
    
    if ( var_69828e4c36ce3972.looplast )
    {
        var_51f05b419fa744c7[ "loop_last" ] = 1;
    }
    
    switch ( var_69828e4c36ce3972.callbacktype )
    {
        case #"hash_83e910d043e7613a":
            var_51f05b419fa744c7[ "callback" ] = &LUA_TRIGGERED_XCAM_MM;
            break;
        case #"hash_daf4861dedb70c73":
            var_51f05b419fa744c7[ "callback" ] = &function_3fad19a839960056;
            break;
        case #"hash_be26b70a0de5b599":
            var_51f05b419fa744c7[ "callback" ] = &LUA_TRIGGERED_ATTACHMENT_ZOOM;
            break;
        case #"hash_9bdce31b93c9f5ca":
            var_51f05b419fa744c7[ "callback" ] = &function_2aa9003d1deb6e99;
            break;
    }
    
    if ( isarray( var_69828e4c36ce3972.var_eb7a1cb794e53a18 ) || var_69828e4c36ce3972.var_eb7a1cb794e53a18.size > 0 )
    {
        var_51f05b419fa744c7[ "flag_msg" ] = [];
        
        foreach ( entry in var_69828e4c36ce3972.var_eb7a1cb794e53a18 )
        {
            var_51f05b419fa744c7[ "flag_msg" ][ var_51f05b419fa744c7[ "flag_msg" ].size ] = entry.flagmessage;
        }
    }
    
    return var_51f05b419fa744c7;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x91c765e8, Offset: 0xca1e
// Size: 0x23f9
function private function_86333647f10b7941()
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    var_1d22ece93818d778 = [];
    lobbyxcam = ismgl ? "mgl_fe_op_lobby_01_xcam" : "jup_fe_lobby_plow_cam_01_idle_squad_01_xcam";
    lobbychar = function_28d43ffc378eedeb( "lobby_charslot_01" );
    var_1d22ece93818d778[ "squad_lobby" ] = [];
    var_1d22ece93818d778[ "squad_lobby" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "squad_lobby" ][ "xcam_data" ].origin = lobbychar.origin + ( ismgl ? getdvarvector( @"hash_a64f75b19dd8a93", ( 2.8, 20, -3.5 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby" ][ "xcam_data" ].angles = lobbychar.angles + ( ismgl ? getdvarvector( @"hash_840e8f5916f3fb19", ( 0, 0, 0 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "squad_lobby" ][ "transitions" ][ 0 ] = lobbyxcam;
    
    if ( !ismgl )
    {
        var_1d22ece93818d778[ "squad_lobby" ][ "transitions" ][ 1 ] = "jup_fe_lobby_plow_cam_01_idle_squad_01_xcam";
        var_1d22ece93818d778[ "squad_lobby" ][ "transitions" ][ 2 ] = "jup_fe_lobby_plow_cam_01_idle_squad_01_xcam";
        var_1d22ece93818d778[ "squad_lobby" ][ "callback" ] = &LUA_TRIGGERED_XCAM_MM;
        var_1d22ece93818d778[ "squad_lobby" ][ "flag_msg" ] = [ "lobby_member_increase", "started_mm" ];
    }
    
    var_1d22ece93818d778[ "squad_lobby" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "squad_lobby" ][ "blend_time" ][ "lobby_member_increase" ] = getdvarfloat( @"hash_6c2ffd9e1138c485", 4 );
    var_1d22ece93818d778[ "squad_lobby" ][ "blend_time" ][ "started_mm" ] = getdvarfloat( @"hash_acefefc58946a4b7", 2 );
    lobbyxcam = ismgl ? "mgl_fe_op_lobby_01_xcam" : "fe_lobby_plow_cam_01_idle_01_xcam";
    
    if ( level.var_a4d14a560c391aa0 )
    {
        lobbychar = getent( "lobby_dmz_charslot_01", #targetname );
    }
    
    var_1d22ece93818d778[ "squad_lobby_dmz" ] = [];
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "xcam_data" ].origin = lobbychar.origin + ( ismgl ? getdvarvector( @"hash_a64f75b19dd8a93", ( 2.8, 20, -3.5 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "xcam_data" ].angles = lobbychar.angles + ( ismgl ? getdvarvector( @"hash_840e8f5916f3fb19", ( 0, 0, 0 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "transitions" ][ 0 ] = lobbyxcam;
    
    if ( !ismgl )
    {
        var_1d22ece93818d778[ "squad_lobby_dmz" ][ "transitions" ][ 1 ] = "fe_lobby_plow_cam_01_idle_squad_01_xcam";
        var_1d22ece93818d778[ "squad_lobby_dmz" ][ "transitions" ][ 2 ] = "fe_lobby_plow_cam_01_mm_01_xcam";
        var_1d22ece93818d778[ "squad_lobby_dmz" ][ "callback" ] = &LUA_TRIGGERED_XCAM_MM;
        var_1d22ece93818d778[ "squad_lobby_dmz" ][ "flag_msg" ] = [ "lobby_member_increase", "started_mm" ];
    }
    
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "blend_time" ][ "lobby_member_increase" ] = getdvarfloat( @"hash_6c2ffd9e1138c485", 4 );
    var_1d22ece93818d778[ "squad_lobby_dmz" ][ "blend_time" ][ "started_mm" ] = getdvarfloat( @"hash_acefefc58946a4b7", 2 );
    lobbyxcam = ismgl ? "mgl_fe_op_lobby_01_xcam" : "fe_lobby_plow_cam_01_idle_01_xcam";
    
    if ( level.var_a4d14a560c391aa0 )
    {
        lobbychar = getent( "lobby_br_charslot_01", #targetname );
    }
    
    var_1d22ece93818d778[ "squad_lobby_br" ] = [];
    var_1d22ece93818d778[ "squad_lobby_br" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "squad_lobby_br" ][ "xcam_data" ].origin = lobbychar.origin + ( ismgl ? getdvarvector( @"hash_a64f75b19dd8a93", ( 2.8, 20, -3.5 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby_br" ][ "xcam_data" ].angles = lobbychar.angles + ( ismgl ? getdvarvector( @"hash_840e8f5916f3fb19", ( 0, 0, 0 ) ) : ( 0, 0, 0 ) );
    var_1d22ece93818d778[ "squad_lobby_br" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "squad_lobby_br" ][ "transitions" ][ 0 ] = lobbyxcam;
    
    if ( !ismgl )
    {
        var_1d22ece93818d778[ "squad_lobby_br" ][ "transitions" ][ 1 ] = "fe_lobby_plow_cam_01_idle_squad_01_xcam";
        var_1d22ece93818d778[ "squad_lobby_br" ][ "transitions" ][ 2 ] = "fe_lobby_plow_cam_01_mm_01_xcam";
        var_1d22ece93818d778[ "squad_lobby_br" ][ "callback" ] = &LUA_TRIGGERED_XCAM_MM;
        var_1d22ece93818d778[ "squad_lobby_br" ][ "flag_msg" ] = [ "lobby_member_increase", "started_mm" ];
    }
    
    var_1d22ece93818d778[ "squad_lobby_br" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "squad_lobby_br" ][ "blend_time" ][ "lobby_member_increase" ] = getdvarfloat( @"hash_6c2ffd9e1138c485", 4 );
    var_1d22ece93818d778[ "squad_lobby_br" ][ "blend_time" ][ "started_mm" ] = getdvarfloat( @"hash_acefefc58946a4b7", 2 );
    var_1d22ece93818d778[ "character_tango" ] = [];
    var_1d22ece93818d778[ "character_tango" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_tango" ][ "xcam_data" ].origin = ( -5910.26, -3473.5, 0 );
    var_1d22ece93818d778[ "character_tango" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "character_tango" ][ "transitions" ] = [];
    
    if ( function_7176f1c79eb11a24() )
    {
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 0 ] = "iw9_fe_op_select_idle_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 1 ] = "iw9_fe_op_select_idle_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 2 ] = "iw9_fe_op_select_idle_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 3 ] = "iw9_fe_op_select_idle_01_xcam";
    }
    else
    {
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 0 ] = "iw9_fe_op_select_generic_male_west_intro_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 1 ] = "iw9_fe_op_select_generic_male_east_intro_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 2 ] = "iw9_fe_op_select_generic_female_west_intro_01_xcam";
        var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 3 ] = "iw9_fe_op_select_generic_female_east_intro_01_xcam";
    }
    
    var_1d22ece93818d778[ "character_tango" ][ "transitions" ][ 4 ] = "iw9_fe_op_select_idle_01_xcam";
    var_1d22ece93818d778[ "character_tango" ][ "callback" ] = &function_3fad19a839960056;
    var_1d22ece93818d778[ "character_tango" ][ "flag_msg" ] = "none";
    var_1d22ece93818d778[ "character_tango" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "character_tango" ][ "blend_time" ][ "character_faction_select_l_detail" ] = 0.1;
    var_1d22ece93818d778[ "character_tango" ][ "blend_time" ][ "character_faction_select_r_detail" ] = 0.1;
    var_1d22ece93818d778[ "character_faction_select_l" ] = [];
    var_1d22ece93818d778[ "character_faction_select_l" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_faction_select_l" ][ "xcam_data" ].origin = ( -5910.26, -3473.5, 0 );
    var_1d22ece93818d778[ "character_faction_select_l" ][ "xcam_data" ].angles = ( 0, -133, 0 );
    var_1d22ece93818d778[ "character_faction_select_l" ][ "transitions" ] = [];
    
    if ( function_7176f1c79eb11a24() )
    {
        var_1d22ece93818d778[ "character_faction_select_r" ][ "transitions" ][ 1 ] = level.var_2012113081d2a67f + "fe_op_select_idle_01_xcam";
    }
    else
    {
        var_1d22ece93818d778[ "character_faction_select_l" ][ "transitions" ][ 0 ] = level.var_2012113081d2a67f + "fe_op_select_generic_male_east_intro_01_xcam";
        var_1d22ece93818d778[ "character_faction_select_l" ][ "transitions" ][ 1 ] = level.var_2012113081d2a67f + "fe_op_select_idle_01_xcam";
    }
    
    var_1d22ece93818d778[ "character_faction_select_l_clone" ] = [];
    var_1d22ece93818d778[ "character_faction_select_l_clone" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_faction_select_l_clone" ][ "xcam_data" ].origin = ( -5872.09, -3436.26, 0 );
    var_1d22ece93818d778[ "character_faction_select_l_clone" ][ "xcam_data" ].angles = ( 0, -133, 0 );
    var_1d22ece93818d778[ "character_faction_select_l_clone" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "character_faction_select_l_detail" ] = [];
    var_1d22ece93818d778[ "character_faction_select_l_detail" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_faction_select_l_detail" ][ "xcam_data" ].origin = ( -5910.26, -3473.5, 0 );
    var_1d22ece93818d778[ "character_faction_select_l_detail" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "character_faction_select_l_detail" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "character_faction_select_l_detail" ][ "transitions" ][ 0 ] = "iw9_fe_op_select_west_edit_in_xcam";
    var_1d22ece93818d778[ "character_faction_select_r" ] = [];
    var_1d22ece93818d778[ "character_faction_select_r" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_faction_select_r" ][ "xcam_data" ].origin = ( -5910.26, -3473.5, 0 );
    var_1d22ece93818d778[ "character_faction_select_r" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "character_faction_select_r" ][ "transitions" ] = [];
    
    if ( function_7176f1c79eb11a24() )
    {
        var_1d22ece93818d778[ "character_faction_select_r" ][ "transitions" ][ 1 ] = level.var_2012113081d2a67f + "fe_op_select_idle_01_xcam";
    }
    else
    {
        var_1d22ece93818d778[ "character_faction_select_r" ][ "transitions" ][ 0 ] = level.var_2012113081d2a67f + "fe_op_select_generic_male_east_intro_01_xcam";
        var_1d22ece93818d778[ "character_faction_select_r" ][ "transitions" ][ 1 ] = level.var_2012113081d2a67f + "fe_op_select_idle_01_xcam";
    }
    
    var_1d22ece93818d778[ "character_faction_select_r_detail" ] = [];
    var_1d22ece93818d778[ "character_faction_select_r_detail" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "character_faction_select_r_detail" ][ "xcam_data" ].origin = ( -5910.26, -3473.5, 0 );
    var_1d22ece93818d778[ "character_faction_select_r_detail" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "character_faction_select_r_detail" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "character_faction_select_r_detail" ][ "transitions" ][ 0 ] = "iw9_fe_op_select_east_edit_in_xcam";
    var_d059a427c80ca72f = getdvarint( @"hash_4302546668942883", 0 );
    var_1d22ece93818d778[ "loadout_showcase_overview" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_overview" ][ "transitions" ] = [];
    
    if ( var_d059a427c80ca72f )
    {
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "xcam_data" ] = function_28d43ffc378eedeb( "loadout_align" );
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "transitions" ][ 0 ] = "t10_fe_xcam_loadout_overview";
    }
    else
    {
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "xcam_data" ] = spawnstruct();
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "xcam_data" ].origin = ( -5872.09, -3436.26, 0 );
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
        var_1d22ece93818d778[ "loadout_showcase_overview" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_loadout_01_xcam";
    }
    
    var_1d22ece93818d778[ "loadout_showcase_overview" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_overview" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_overview" ][ "blend_time" ][ "loadout_showcase" ] = 0.3;
    var_1d22ece93818d778[ "loadout_showcase_overview" ][ "blend_time" ][ "loadout_showcase_overview" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase" ] = [];
    var_1d22ece93818d778[ "loadout_showcase" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase" ][ "xcam_data" ].origin = ( -5872.09, -3436.26, 0 );
    var_1d22ece93818d778[ "loadout_showcase" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "loadout_showcase" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase" ][ "transitions" ][ 0 ] = "fe_op_crib_xcam_loadout_02_xcam";
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_overview" ] = 0.3;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase" ][ "loop_last" ] = 1;
    var_8dd0793e629c4787 = -206.4;
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "xcam_data" ].origin = level.camera_loadout_showcase_preview_small.basecam.origin;
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "xcam_data" ].angles = level.camera_loadout_showcase_preview_small.basecam.angles;
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_01_xcam";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 1 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 2 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_fg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 3 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_gp_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 4 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 5 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mz_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 6 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_op_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 7 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_st_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 8 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_um_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 9 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_ammo_zoom";
    
    if ( ismgl )
    {
        var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "transitions" ][ 10 ] = "mgl_fe_op_crib_xcam_gunbench_01_topright_xcam";
    }
    
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "callback" ] = &LUA_TRIGGERED_ATTACHMENT_ZOOM;
    var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "flag_msg" ] = "zoom_triggered";
    var_1d22ece93818d778[ "loadout_showcase_preview" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "xcam_data" ].origin = level.camera_loadout_showcase_preview.basecam.origin;
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "xcam_data" ].angles = level.camera_loadout_showcase_preview.basecam.angles;
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_02_xcam";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 1 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 2 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_fg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 3 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_gp_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 4 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 5 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mz_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 6 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_op_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 7 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_st_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 8 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_um_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 9 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_ammo_zoom";
    
    if ( ismgl )
    {
        var_1d22ece93818d778[ "loadout_showcase_preview" ][ "transitions" ][ 10 ] = "mgl_fe_op_crib_xcam_gunbench_02_topright_xcam";
    }
    
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "callback" ] = &LUA_TRIGGERED_ATTACHMENT_ZOOM;
    var_1d22ece93818d778[ "loadout_showcase_preview" ][ "flag_msg" ] = "zoom_triggered";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "xcam_data" ].origin = level.camera_loadout_showcase_preview_large.basecam.origin;
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "xcam_data" ].angles = level.camera_loadout_showcase_preview_large.basecam.angles;
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_03_xcam";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 1 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 2 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_fg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 3 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_gp_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 4 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mg_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 5 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mz_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 6 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_op_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 7 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_st_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 8 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_um_zoom";
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 9 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_ammo_zoom";
    
    if ( ismgl )
    {
        var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "transitions" ][ 10 ] = "mgl_fe_op_crib_xcam_gunbench_03_topright_xcam";
    }
    
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "callback" ] = &LUA_TRIGGERED_ATTACHMENT_ZOOM;
    var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "flag_msg" ] = "zoom_triggered";
    var_1d22ece93818d778[ "loadout_showcase_perks" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "xcam_data" ].origin = ( -5872.09, -3436.26, 0 );
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "transitions" ][ 0 ] = "fe_op_crib_xcam_loadout_pkp_xcam";
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_perks" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "xcam_data" ].origin = ( -5872.09, -3436.26, 0 );
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "xcam_data" ].angles = ( 0, -139.143, 0 );
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "transitions" ][ 0 ] = "fe_op_crib_xcam_loadout_fu_xcam";
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.25;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_field_upgrade" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_p" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "xcam_data" ].origin = ( -5905.82, -3649.48, 44.0002 );
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "xcam_data" ].angles = ( 0, 270, 90 );
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "transitions" ][ 0 ] = "";
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_p" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_s" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "xcam_data" ].origin = ( -5897.97, -3658.72, 44.0002 );
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "xcam_data" ].angles = ( 179.99, 270, 90 );
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "transitions" ][ 0 ] = "";
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_s" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_o" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "xcam_data" ].origin = ( -5897.97, -3658.72, 44.0002 );
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "xcam_data" ].angles = ( 179.99, 270, 90 );
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "transitions" ][ 0 ] = "";
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_o" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_l" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "xcam_data" ].origin = ( -5879.75, -3642.25, 42.15 );
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "xcam_data" ].angles = ( 0, 230, 0 );
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_loadout_equip_xcam";
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_t" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_l" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "loadout_showcase_t" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "xcam_data" ].origin = ( -5880.75, -3659, 42.15 );
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "xcam_data" ].angles = ( 0, 230, 0 );
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "transitions" ][ 0 ] = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_loadout_equip_xcam";
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_s" ] = 0.2;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_p" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_o" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_perks" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_field_upgrade" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase_l" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "blend_time" ][ "loadout_showcase" ] = 0.15;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "callback" ] = &function_2aa9003d1deb6e99;
    var_1d22ece93818d778[ "loadout_showcase_t" ][ "flag_msg" ] = "loadout_data_set";
    var_1d22ece93818d778[ "weapon_preview_riot" ] = [];
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam";
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_preview_riot" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_progression" ] = [];
    var_1d22ece93818d778[ "weapon_progression" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_progression" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_progression" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_progression" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_progression" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_topright_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam";
    var_1d22ece93818d778[ "weapon_progression" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_progression" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_progression_small" ] = [];
    var_1d22ece93818d778[ "weapon_progression_small" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_progression_small" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_progression_small" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_progression_small" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_progression_small" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_01_topright_xcam" : "fe_op_crib_xcam_gunbundle_01_xcam";
    var_1d22ece93818d778[ "weapon_progression_small" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_progression_small" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_progression_large" ] = [];
    var_1d22ece93818d778[ "weapon_progression_large" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_progression_large" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_progression_large" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_progression_large" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_progression_large" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_03_topright_xcam" : "fe_op_crib_xcam_gunbench_03_xcam";
    var_1d22ece93818d778[ "weapon_progression_large" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_progression_large" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_customize" ] = [];
    var_1d22ece93818d778[ "weapon_customize" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_customize" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_customize" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_customize" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_customize" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_top_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam";
    var_1d22ece93818d778[ "weapon_customize" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_customize" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_customize_small" ] = [];
    var_1d22ece93818d778[ "weapon_customize_small" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_customize_small" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_customize_small" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_customize_small" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_customize_small" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_01_top_xcam" : "fe_op_crib_xcam_gunbundle_01_xcam";
    var_1d22ece93818d778[ "weapon_customize_small" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_customize_small" ][ "blend_time" ][ "default" ] = 0;
    var_1d22ece93818d778[ "weapon_customize_large" ] = [];
    var_1d22ece93818d778[ "weapon_customize_large" ][ "xcam_data" ] = spawnstruct();
    var_1d22ece93818d778[ "weapon_customize_large" ][ "xcam_data" ].origin = ( -3072, 3072, 0 );
    var_1d22ece93818d778[ "weapon_customize_large" ][ "xcam_data" ].angles = ( 0, 180, 0 );
    var_1d22ece93818d778[ "weapon_customize_large" ][ "transitions" ] = [];
    var_1d22ece93818d778[ "weapon_customize_large" ][ "transitions" ][ 0 ] = ismgl ? "mgl_fe_op_crib_xcam_gunbench_03_top_xcam" : "fe_op_crib_xcam_gunbench_03_xcam";
    var_1d22ece93818d778[ "weapon_customize_large" ][ "blend_time" ] = [];
    var_1d22ece93818d778[ "weapon_customize_large" ][ "blend_time" ][ "default" ] = 0;
    level.var_29d3d6d1ca17b761 = [];
    level.var_29d3d6d1ca17b761[ 0 ] = "";
    level.var_29d3d6d1ca17b761[ 1 ] = "";
    level.var_1d22ece93818d778 = var_1d22ece93818d778;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xdeec8689, Offset: 0xee1f
// Size: 0x27
function private function_dd44ecf00812addc( tagarray )
{
    attachtype = tagarray[ 1 ];
    
    if ( !isdefined( attachtype ) )
    {
        return undefined;
    }
    
    return attachtype;
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xc87b087a, Offset: 0xee4f
// Size: 0xe8
function private function_27c7889021d20b28( tagarray, weaponpreview, currentscene )
{
    xcamname = function_b7fc60e11b93d6a8( tagarray[ 2 ], weaponpreview, currentscene );
    
    if ( !isdefined( xcamname ) )
    {
        return undefined;
    }
    
    tagstruct = spawnstruct();
    tagstruct.name = tagarray[ 2 ];
    tagstruct.xcam = xcamname;
    tagstruct.origin = ( float( tagarray[ 3 ] ), float( tagarray[ 4 ] ), float( tagarray[ 5 ] ) );
    tagstruct.angles = ( float( tagarray[ 6 ] ), float( tagarray[ 7 ] ), float( tagarray[ 8 ] ) );
    
    if ( isdefined( tagarray[ 9 ] ) )
    {
        tagstruct.class = tagarray[ 9 ];
    }
    
    if ( isdefined( tagarray[ 10 ] ) )
    {
        tagstruct.weaponname = tagarray[ 10 ];
    }
    
    return tagstruct;
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0x598a212a, Offset: 0xef40
// Size: 0xd5
function private function_7007bd7f0543df4a( tagarray, weaponpreview, currentscene )
{
    xcamname = function_b7fc60e11b93d6a8( tagarray[ 0 ], weaponpreview, currentscene );
    
    if ( !isdefined( xcamname ) )
    {
        return undefined;
    }
    
    zangle = float( tagarray[ 6 ] );
    
    if ( tagarray[ 0 ] == "tag_laser_attach" )
    {
        zangle = 90;
    }
    
    tagstruct = spawnstruct();
    tagstruct.name = tagarray[ 0 ];
    tagstruct.xcam = xcamname;
    tagstruct.origin = ( float( tagarray[ 1 ] ), float( tagarray[ 2 ] ), float( tagarray[ 3 ] ) );
    tagstruct.angles = ( float( tagarray[ 4 ] ), float( tagarray[ 5 ] ), zangle );
    return tagstruct;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xf56cf078, Offset: 0xf01e
// Size: 0x4d, Type: bool
function private function_e67750d82fc610b1( class )
{
    if ( !isdefined( class ) )
    {
        return false;
    }
    
    return class == "weapon_projectile" || class == "weapon_classic_s" || class == "weapon_melee2" || class == "weapon_melee" || class == "weapon_classic_p";
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x733de3f, Offset: 0xf074
// Size: 0x192
function private function_f06cf0469ec1c48( currentscene )
{
    if ( !isdefined( currentscene ) )
    {
        return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_02_xcam" );
    }
    
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    switch ( currentscene )
    {
        case #"hash_5cc66fe2e71f720a":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_01_xcam" : "fe_op_crib_xcam_gunbundle_01_xcam" );
        case #"hash_7e8acee7da2d9002":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_01_xcam" );
        case #"hash_5e1d833551ca1661":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_01_top_xcam" : "fe_op_crib_xcam_gunbundle_01_xcam" );
        case #"hash_c364c37a7df6456":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
        case #"hash_248405f0613a37fd":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
        case #"hash_19ed0e9de6d8f60e":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_02_xcam" );
        case #"hash_2ad4511c672b3479":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_top_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
        case #"hash_be3bd585498a6ae6":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_03_xcam" : "fe_op_crib_xcam_gunbundle_03_xcam" );
        case #"hash_c36ef36dd1c5f0be":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_03_xcam" );
        case #"hash_facaeaf0ac11387d":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_03_top_xcam" : "fe_op_crib_xcam_gunbundle_03_xcam" );
        default:
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_02_xcam" );
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x8fee14c3, Offset: 0xf20e
// Size: 0xc8
function private function_ab30ef267649ed79( currentscene )
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    if ( !isdefined( currentscene ) )
    {
        return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_topright_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
    }
    
    switch ( currentscene )
    {
        case #"hash_fb8d15ff96772235":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_01_topright_xcam" : "fe_op_crib_xcam_gunbundle_01_xcam" );
        case #"hash_3fec9c3219804c0d":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_topright_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
        case #"hash_1d26c8f742a4ef31":
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_03_topright_xcam" : "fe_op_crib_xcam_gunbench_03_xcam" );
        default:
            return ( ismgl ? "mgl_fe_op_crib_xcam_gunbench_02_topright_xcam" : "fe_op_crib_xcam_gunbundle_02_xcam" );
    }
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xe7479194, Offset: 0xf2de
// Size: 0x24c
function private function_b7fc60e11b93d6a8( tag, weaponpreview, currentscene )
{
    switch ( tag )
    {
        case #"hash_2ebbd10bc3f36e0e":
        case #"hash_7bdd7b80127fa4f4":
            return function_f06cf0469ec1c48( currentscene );
        case #"hash_2f9cdb76a336eceb":
            return function_ab30ef267649ed79( currentscene );
        case #"hash_c140f05197182dbf":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_mz_xcam" );
        case #"hash_b74aa2c7e628b458":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_pistol_xcam" );
        case #"hash_8aaca5091d505bc4":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_xcam" );
        case #"hash_96d433e5bdc6bf10":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_br_sniper_xcam" );
        case #"hash_b1b3f69cc133ac94":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_fg_xcam" );
        case #"hash_19a1970c29085405":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_lz_xcam" );
        case #"hash_635902b104004521":
        case #"hash_9a1cf7dcaacdd82c":
            return "fe_op_crib_xcam_gunbench_mg_xcam";
        case #"hash_84eed77be6815580":
        case #"hash_a52679d5a5b05b52":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_op_xcam" );
        case #"hash_d49595fe0280fea1":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_gp_xcam" );
        case #"hash_dd3f3b9997ed3d6a":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_st_pistol_xcam" );
        case #"hash_57b788e828981035":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_st_xcam" );
        case #"hash_6920bec13886425c":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_um_xcam" );
        case #"hash_385d996ef17d925d":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_ammo" );
        case #"hash_a4daec5079604c53":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_ch_xcam" );
        case #"hash_3f0ecc42f886065f":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_gs_xcam" );
        case #"hash_8501367b06a03483":
            return ( level.var_3ff084b89b959f13 + "fe_op_crib_xcam_gunbench_stkrs_xcam" );
        case #"hash_ea364af169c3280e":
            return "fe_op_crib_xcam_gunbench_stkrs_sh_xcam";
        default:
            return undefined;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xe2392a08, Offset: 0xf532
// Size: 0x2be
function private function_8e87b77f70835fd4( scenename )
{
    switch ( scenename )
    {
        case #"hash_2bc9361cebbbcbd2":
        case #"hash_3287498ac2bdec62":
        case #"hash_7e5fff2eb82441c6":
        case #"hash_703c7fd9224070b1":
            return "tag_silencer";
        case #"hash_21aa25df730e1363":
        case #"hash_1a02be6831832733":
        case #"hash_bed1face88fdcb22":
        case #"hash_bed1f9ce88fdc98f":
        case #"hash_b03e7af96e0cc592":
        case #"hash_5c8cf8ab59b4ef97":
            return "tag_barrel_attach";
        case #"hash_1a96f606bada8c07":
        case #"hash_3d5aa4ebe484d097":
        case #"hash_e2a532526c4b1986":
            return "tag_grip_attach";
        case #"hash_77f7b408606d1238":
        case #"hash_ea6b42a40068e528":
        case #"hash_a5e0219576906481":
        case #"hash_c3c7633ef4e5e971":
        case #"hash_c39eb86ef6e2f365":
        case #"hash_77f7b708606d16f1":
            return "tag_pistolgrip_attach";
        case #"hash_1e404931df187946":
        case #"hash_c9fc556dd4fb88f6":
        case #"hash_b91600265f2dd072":
        case #"hash_5161faf8fea12ebc":
        case #"hash_5161fdf8fea13375":
            return "tag_laser_attach";
        case #"hash_ce66d785edbb652d":
        case #"hash_72931d90e9f9c4fd":
        case #"hash_a29c118653f671":
        case #"hash_7ec8461faf149064":
        case #"hash_7ec8491faf14951d":
        case #"hash_594a0c65c7d7cc28":
        case #"hash_bce86e3a86f0c8ed":
        case #"hash_bce86b3a86f0c434":
            return "j_mag1";
        case #"hash_b254a9604b488320":
        case #"hash_b32dd453b0b185ef":
        case #"hash_a271bcda8ca803bc":
        case #"hash_ffa5b7c1c1a799f0":
            return "tag_reflex";
        case #"hash_189960eb1cd2112f":
        case #"hash_a8d85b2b5283a5cb":
        case #"hash_5890922b50b3f2ce":
        case #"hash_46b9834d37017c5f":
        case #"hash_4194b71a94fb817e":
        case #"hash_4194b61a94fb7feb":
            return "tag_stock_attach";
        case #"hash_ae36caa1297604f2":
        case #"hash_472c95bf362ca54a":
        case #"hash_472c92bf362ca091":
        case #"hash_989642de7c8f0501":
        case #"hash_472c90bf362c9d6b":
        case #"hash_4379b9c7a2831922":
        case #"hash_98963fde7c8f0048":
        case #"hash_19ed0e9de6d8f60e":
        case #"hash_fda8d24e03c1db76":
            return "j_gun";
        default:
            return undefined;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x8a99f057, Offset: 0xf7f8
// Size: 0x396
function private function_4a31f3d861553676( tagarray )
{
    primaryarray = [];
    secondaryarray = [];
    lethalarray = [];
    tacticalarray = [];
    var_96cdf61ebedc1408 = [];
    var_96cdf61ebedc1408[ 2 ] = -5910;
    var_96cdf61ebedc1408[ 3 ] = -3650;
    var_96cdf61ebedc1408[ 4 ] = 45;
    var_96cdf61ebedc1408[ 5 ] = 0;
    var_96cdf61ebedc1408[ 6 ] = 270;
    var_96cdf61ebedc1408[ 7 ] = 90;
    var_b22ba03db4e68b4 = [];
    var_b22ba03db4e68b4[ 10 ] = -5894;
    var_b22ba03db4e68b4[ 11 ] = -3658;
    var_b22ba03db4e68b4[ 12 ] = 45;
    var_b22ba03db4e68b4[ 13 ] = 360;
    var_b22ba03db4e68b4[ 14 ] = 90;
    var_b22ba03db4e68b4[ 15 ] = 90;
    var_5a0fcc3d02a00d32 = [];
    var_5a0fcc3d02a00d32[ 17 ] = -5878;
    var_5a0fcc3d02a00d32[ 18 ] = -3642;
    var_5a0fcc3d02a00d32[ 19 ] = 42;
    var_5a0fcc3d02a00d32[ 20 ] = 0;
    var_5a0fcc3d02a00d32[ 21 ] = 227;
    var_5a0fcc3d02a00d32[ 22 ] = 0;
    var_1ebbdd09cf4235a3 = [];
    var_1ebbdd09cf4235a3[ 24 ] = -5879;
    var_1ebbdd09cf4235a3[ 25 ] = -3659;
    var_1ebbdd09cf4235a3[ 26 ] = 44;
    var_1ebbdd09cf4235a3[ 27 ] = 0;
    var_1ebbdd09cf4235a3[ 28 ] = 235;
    var_1ebbdd09cf4235a3[ 29 ] = 0;
    
    for ( i = 0; i < tagarray.size ; i++ )
    {
        if ( i > 7 && i < 16 )
        {
            if ( tagarray[ i ] != "none" )
            {
                secondaryarray[ secondaryarray.size ] = tagarray[ i ];
            }
            else
            {
                secondaryarray[ secondaryarray.size ] = var_b22ba03db4e68b4[ i ];
            }
            
            continue;
        }
        
        if ( i >= 16 && i < 23 )
        {
            if ( tagarray[ i ] != "none" )
            {
                lethalarray[ lethalarray.size ] = tagarray[ i ];
            }
            else
            {
                lethalarray[ lethalarray.size ] = var_5a0fcc3d02a00d32[ i ];
            }
            
            continue;
        }
        
        if ( i >= 23 )
        {
            if ( tagarray[ i ] != "none" )
            {
                tacticalarray[ tacticalarray.size ] = tagarray[ i ];
            }
            else
            {
                tacticalarray[ tacticalarray.size ] = var_1ebbdd09cf4235a3[ i ];
            }
            
            continue;
        }
        
        if ( tagarray[ i ] != "none" )
        {
            primaryarray[ primaryarray.size ] = tagarray[ i ];
            continue;
        }
        
        primaryarray[ primaryarray.size ] = var_96cdf61ebedc1408[ i ];
    }
    
    var_b60617b6b29dd45c = function_1eba9adf23e98508( primaryarray[ 1 ] );
    var_6e5290620ac09e14 = function_68190f6a4d8cf26a( secondaryarray[ 1 ] );
    
    if ( !( isdefined( var_b60617b6b29dd45c ) && isdefined( var_6e5290620ac09e14 ) ) )
    {
        return undefined;
    }
    
    var_268bfe0a9c21273b = spawnstruct();
    var_268bfe0a9c21273b.name = "loadout_showcase_p";
    var_268bfe0a9c21273b.xcam = var_b60617b6b29dd45c;
    var_268bfe0a9c21273b.origin = ( float( primaryarray[ 2 ] ), float( primaryarray[ 3 ] ), float( primaryarray[ 4 ] ) );
    var_7f6db7f3102c6cff = spawnstruct();
    var_7f6db7f3102c6cff.name = function_da403ea21456c938( secondaryarray[ 1 ] );
    var_7f6db7f3102c6cff.xcam = var_6e5290620ac09e14;
    var_7f6db7f3102c6cff.origin = ( float( secondaryarray[ 2 ] ), float( secondaryarray[ 3 ] ), float( secondaryarray[ 4 ] ) );
    level.var_1d22ece93818d778[ "loadout_showcase_o" ][ "transitions" ] = [];
    level.var_1d22ece93818d778[ "loadout_showcase_o" ][ "transitions" ][ 0 ] = var_7f6db7f3102c6cff.xcam;
    var_b78cd189590c2281 = spawnstruct();
    var_b78cd189590c2281.name = "loadout_showcase_l";
    var_b78cd189590c2281.xcam = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_loadout_equip_xcam";
    var_c6f373451cd1cf8a = spawnstruct();
    var_c6f373451cd1cf8a.name = "loadout_showcase_t";
    var_c6f373451cd1cf8a.xcam = level.var_3ff084b89b959f13 + "fe_op_crib_xcam_loadout_equip_xcam";
    return [ var_268bfe0a9c21273b, var_7f6db7f3102c6cff, var_b78cd189590c2281, var_c6f373451cd1cf8a ];
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x93b0358a, Offset: 0xfb97
// Size: 0xac
function private function_da403ea21456c938( weaponname )
{
    switch ( weaponname )
    {
        case #"hash_bef5ec0b3e197ae":
        case #"hash_16cf6289ab06bd30":
        case #"hash_47368bc0d2ef1565":
        case #"hash_8af0086b038622b5":
        case #"hash_9d18adab1b65a661":
        case #"hash_ab10f9c080fe4faf":
        case #"hash_c095d67337b1f5a1":
        case #"hash_dd616da0b395a0b0":
            return "loadout_showcase_s";
        case #"hash_34340d457a63e7f1":
        case #"hash_86b11ac21f992552":
            return "loadout_showcase_s";
        default:
            return "loadout_showcase_s";
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xf31296d7, Offset: 0xfc4b
// Size: 0xc0
function private function_1eba9adf23e98508( tag )
{
    switch ( tag )
    {
        case #"hash_a1f27f97be15d620":
        case #"hash_ab10f9c080fe4faf":
            return "fe_op_crib_xcam_loadout_smg_xcam";
        case #"hash_16cf6289ab06bd30":
        case #"hash_47368bc0d2ef1565":
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            return "fe_op_crib_xcam_loadout_ar_xcam";
        case #"hash_bef5ec0b3e197ae":
        case #"hash_86b11ac21f992552":
        case #"hash_9d18adab1b65a661":
        case #"hash_c095d67337b1f5a1":
            return "fe_op_crib_xcam_loadout_sn_xcam";
        case #"hash_34340d457a63e7f1":
            return "fe_op_crib_xcam_loadout_pi_xcam";
        default:
            return undefined;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xc4ff009d, Offset: 0xfd13
// Size: 0xc0
function private function_68190f6a4d8cf26a( tag )
{
    switch ( tag )
    {
        case #"hash_a1f27f97be15d620":
        case #"hash_ab10f9c080fe4faf":
            return "fe_op_crib_xcam_loadout_smg_xcam";
        case #"hash_16cf6289ab06bd30":
        case #"hash_47368bc0d2ef1565":
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            return "fe_op_crib_xcam_loadout_ar_xcam";
        case #"hash_bef5ec0b3e197ae":
        case #"hash_86b11ac21f992552":
        case #"hash_9d18adab1b65a661":
        case #"hash_c095d67337b1f5a1":
            return "fe_op_crib_xcam_loadout_sn_xcam";
        case #"hash_34340d457a63e7f1":
            return "fe_op_crib_xcam_loadout_pi_xcam";
        default:
            return undefined;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xf61a2b9a, Offset: 0xfddb
// Size: 0x1f
function private function_febedc1ff5575e0d( sectionfrom )
{
    level.playerviewowner function_a565dafac620d68e( "hw_mp_frontend_lobby_rt" );
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x20ee9454, Offset: 0xfe02
// Size: 0x1f
function private function_b805afcca2376345( sectionfrom )
{
    level.playerviewowner function_72cf2eee8e035013( "hw_mp_frontend_lobby_rt" );
}

// Namespace frontendutils
// Params 0
// Checksum 0xe67aab04, Offset: 0xfe29
// Size: 0x40
function function_badbc5e8e324e2ec()
{
    level.var_5da65e2e8ad689d0 = [];
    level.var_5da65e2e8ad689d0[ "squad_lobby" ] = &function_febedc1ff5575e0d;
    level.var_d66b59842079fb8e = [];
    level.var_d66b59842079fb8e[ "squad_lobby" ] = &function_b805afcca2376345;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x17b1122d, Offset: 0xfe71
// Size: 0xeb
function private initialize_transition_array()
{
    var_870578de2aac0499 = undefined;
    var_12983533bcbeb69 = undefined;
    
    if ( isxhashasset( level.projectbundle.frontendsectionlist ) )
    {
        var_870578de2aac0499 = getscriptbundle( level.projectbundle.frontendsectionlist );
    }
    
    if ( isxhashasset( level.projectbundle.transitiondatalist ) )
    {
        var_12983533bcbeb69 = getscriptbundle( level.projectbundle.transitiondatalist );
    }
    
    if ( !( isdefined( var_870578de2aac0499 ) && isdefined( var_12983533bcbeb69 ) ) || !isxhashasset( level.projectbundle.frontendsectionlist ) || !isxhashasset( level.projectbundle.transitiondatalist ) || getdvarint( @"hash_6226d9fc2c8ab9e7", 0 ) )
    {
        function_1d2f44f3950e3e9a();
        return;
    }
    
    function_6e8f2d82e8dbffb8( var_870578de2aac0499, var_12983533bcbeb69 );
}

// Namespace frontendutils
// Params 2
// Checksum 0x712b1cfe, Offset: 0xff64
// Size: 0x404
function function_6e8f2d82e8dbffb8( var_870578de2aac0499, var_12983533bcbeb69 )
{
    frontendsectionlist = [];
    
    foreach ( section in var_870578de2aac0499.frontendsectionlist )
    {
        sectionscriptbundle = getscriptbundle( hashcat( %"hash_68ebd7ee3c465855", section.frontendsection ) );
        
        if ( !isdefined( sectionscriptbundle ) )
        {
            assert( 0, "<dev string:x3a8>" + section.frontendsection + "<dev string:x4c3>" );
            continue;
        }
        
        if ( !isdefined( sectionscriptbundle.sectionname ) || sectionscriptbundle.sectionname == "" )
        {
            assert( 0, "<dev string:x505>" + section.frontendsection + "<dev string:x529>" );
            continue;
        }
        
        if ( !isdefined( frontendsectionlist[ sectionscriptbundle.sectionname ] ) )
        {
            frontendsectionlist[ sectionscriptbundle.sectionname ] = sectionscriptbundle;
            continue;
        }
        
        assert( 0, "<dev string:x555>" + sectionscriptbundle.sectionname + "<dev string:x595>" );
    }
    
    transitiondatalist = [];
    
    foreach ( transition in var_12983533bcbeb69.transitiondatalist )
    {
        if ( !isdefined( transitiondatalist[ transition.transitiondata ] ) )
        {
            var_ec49eabf08173852 = getscriptbundle( hashcat( %"hash_847a8b38dfabe09", transition.transitiondata ) );
            transitiondatalist[ transition.transitiondata ] = [];
            transitiondatalist[ transition.transitiondata ] = function_8c25621b7e6287c6( var_ec49eabf08173852 );
            transitiondatalist[ transition.transitiondata ][ "name" ] = transition.transitiondata;
            continue;
        }
        
        assert( 0, "<dev string:x59b>" );
    }
    
    transitionarray = [];
    
    foreach ( section in frontendsectionlist )
    {
        transitionarray[ section.sectionname ] = [];
        
        if ( section.var_8b733a02ea9e464c && isdefined( section.defaulttransition ) )
        {
            transitionarray[ section.sectionname ][ "default" ] = [];
            transitionarray[ section.sectionname ][ "default" ] = function_8c25621b7e6287c6( section.defaulttransition );
            transitionarray[ section.sectionname ][ "default" ][ "name" ] = "default";
        }
        
        foreach ( transition in section.transitions )
        {
            transitionarray[ section.sectionname ][ transition.sectionref ] = transitiondatalist[ transition.transitiondata ];
        }
    }
    
    level.transitionarray = transitionarray;
}

// Namespace frontendutils
// Params 1
// Checksum 0x78fa6568, Offset: 0x10370
// Size: 0x25e
function function_8c25621b7e6287c6( var_2e54b8e3bc926c40 )
{
    var_1845ec84d9ab2f53 = [];
    
    if ( !isdefined( var_2e54b8e3bc926c40 ) )
    {
        assert( 0, "<dev string:x608>" );
    }
    
    var_1845ec84d9ab2f53[ "fadeOutTime" ] = var_2e54b8e3bc926c40.fadeouttime;
    
    if ( !isdefined( var_2e54b8e3bc926c40.fadeouttime ) && var_2e54b8e3bc926c40.var_8cdb3ce2b46cd858 )
    {
        var_1845ec84d9ab2f53[ "fadeOutTime" ] = 0;
    }
    
    var_1845ec84d9ab2f53[ "fadeInTime" ] = var_2e54b8e3bc926c40.fadeintime;
    
    if ( !isdefined( var_2e54b8e3bc926c40.fadeintime ) && var_2e54b8e3bc926c40.var_e43744f32099e34b )
    {
        var_1845ec84d9ab2f53[ "fadeInTime" ] = 0;
    }
    
    var_1845ec84d9ab2f53[ "fov" ] = var_2e54b8e3bc926c40.var_9c69ca1ce3509372;
    var_1845ec84d9ab2f53[ "speed" ] = var_2e54b8e3bc926c40.speed;
    var_1845ec84d9ab2f53[ "moveTime" ] = var_2e54b8e3bc926c40.movetime;
    var_1845ec84d9ab2f53[ "accelScalar" ] = var_2e54b8e3bc926c40.accelscalar;
    var_1845ec84d9ab2f53[ "decelScalar" ] = var_2e54b8e3bc926c40.decelscalar;
    var_1845ec84d9ab2f53[ "use_bounce" ] = var_2e54b8e3bc926c40.usebounce;
    var_1845ec84d9ab2f53[ "keepXCam" ] = var_2e54b8e3bc926c40.keepxcam;
    
    if ( isdefined( var_2e54b8e3bc926c40.transitiontype ) )
    {
        switch ( var_2e54b8e3bc926c40.transitiontype )
        {
            case #"hash_223f759868af15fe":
                var_1845ec84d9ab2f53[ "transition" ] = &frontend_camera_teleport;
                break;
            case #"hash_1fd03afa5ab05c54":
                var_1845ec84d9ab2f53[ "transition" ] = &frontend_camera_move;
                break;
        }
    }
    
    if ( isdefined( var_2e54b8e3bc926c40.callbacktype ) )
    {
        switch ( var_2e54b8e3bc926c40.callbacktype )
        {
            case #"hash_7906c5a21c5912ff":
                var_1845ec84d9ab2f53[ "callback" ] = &update_entities_and_camera;
                break;
            case #"hash_3e3d0b677a32918":
                var_1845ec84d9ab2f53[ "callback" ] = &set_xcam;
                break;
            case #"hash_88e0c61ba5df42cf":
                var_1845ec84d9ab2f53[ "callback" ] = &update_camera_depth_of_field;
                break;
            case #"hash_67f220df07c40521":
                var_1845ec84d9ab2f53[ "callback" ] = &update_player_character_showcase;
                break;
            case #"hash_e54d500699823fe7":
                var_1845ec84d9ab2f53[ "callback" ] = &update_entities;
                break;
            case #"hash_a2683b0b0bd42a1b":
            default:
                var_1845ec84d9ab2f53[ "callback" ] = undefined;
                break;
        }
    }
    
    return var_1845ec84d9ab2f53;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x3c623b15, Offset: 0x105d7
// Size: 0x4315
function private function_1d2f44f3950e3e9a()
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    transitionarray = [];
    transitionarray[ "loadout_showcase" ] = [];
    transitionarray[ "loadout_showcase" ][ "default" ] = [];
    transitionarray[ "loadout_showcase" ][ "default" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase" ][ "default" ][ "fov" ] = 85;
    transitionarray[ "loadout_showcase" ][ "character_tango" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "character_tango" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase" ][ "character_tango" ][ "fov" ] = 85;
    transitionarray[ "loadout_showcase" ][ "character_tango" ][ "fadeOutTime" ] = 0.1;
    transitionarray[ "loadout_showcase" ][ "character_tango" ][ "fadeInTime" ] = 0.1;
    var_da8c17f38bf0f6b4 = [];
    var_da8c17f38bf0f6b4[ "transition" ] = &frontend_camera_move;
    var_da8c17f38bf0f6b4[ "callback" ] = &update_entities_and_camera;
    var_da8c17f38bf0f6b4[ "fov" ] = 50;
    var_da8c17f38bf0f6b4[ "speed" ] = 200;
    var_da8c17f38bf0f6b4[ "accelScalar" ] = 0.9;
    var_da8c17f38bf0f6b4[ "moveTime" ] = 0.4;
    var_da8c17f38bf0f6b4[ "decelScalar" ] = 0.1;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_overview" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_p" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_p_large" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_o" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_o_large" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_s" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_l" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_t" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_field_upgrade" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_field_upgrade_01" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_field_upgrade_02" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_perks" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_x" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_y" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_z" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "loadout_showcase_watch" ] = var_da8c17f38bf0f6b4;
    transitionarray[ "loadout_showcase" ][ "squad_lobby" ] = [];
    transitionarray[ "loadout_showcase" ][ "squad_lobby" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "squad_lobby" ][ "fov" ] = 85;
    transitionarray[ "loadout_showcase" ][ "black_screen" ] = [];
    transitionarray[ "loadout_showcase" ][ "black_screen" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "black_screen" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase" ][ "social" ] = [];
    transitionarray[ "loadout_showcase" ][ "social" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "social" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase" ][ "social_showcase" ] = [];
    transitionarray[ "loadout_showcase" ][ "social_showcase" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "social_showcase" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase" ][ "weapon_preview_riot" ] = [];
    transitionarray[ "loadout_showcase" ][ "weapon_preview_riot" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase" ][ "weapon_preview_riot" ][ "fov" ] = 50;
    var_3fb14ad38154c835 = [];
    var_3fb14ad38154c835[ "transition" ] = &frontend_camera_move;
    var_3fb14ad38154c835[ "callback" ] = &set_xcam;
    var_3fb14ad38154c835[ "fov" ] = 50;
    var_3fb14ad38154c835[ "speed" ] = 75;
    var_3fb14ad38154c835[ "accelScalar" ] = 0.9;
    var_3fb14ad38154c835[ "moveTime" ] = 0.4;
    var_3fb14ad38154c835[ "decelScalar" ] = 0.1;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview" ] = var_3fb14ad38154c835;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_large" ] = var_3fb14ad38154c835;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_small" ] = var_3fb14ad38154c835;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_large" ] = var_3fb14ad38154c835;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_small" ] = var_3fb14ad38154c835;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview" ] = var_3fb14ad38154c835;
    var_becc99297a4bf045 = [];
    var_becc99297a4bf045[ "transition" ] = &frontend_camera_teleport;
    var_becc99297a4bf045[ "callback" ] = &update_entities;
    var_becc99297a4bf045[ "fov" ] = 50;
    var_becc99297a4bf045[ "fadeOutTime" ] = 0.025;
    var_becc99297a4bf045[ "fadeInTime" ] = 0.025;
    var_becc99297a4bf045[ "keepXCam" ] = 1;
    transitionarray[ "loadout_showcase_preview" ][ "default" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_barrel" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_barrel_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_barrel_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_laser" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_laser_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_laser_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_large_laser" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_magazine" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_magazine_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_magazine_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_muzzle" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_muzzle_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_optic" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_optic_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_reargrip" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_reargrip_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_reargrip_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_stock" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_stock_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_stock_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_large_stock_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_underbarrel" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_charm" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_charm_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_charm_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_charm_alt3" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_charm_alt4" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_sticker" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_sticker_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_sticker_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_sticker_alt3" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_preview_sticker_alt4" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "default" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_barrel" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_laser" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_muzzle" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_optic" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_magazine" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_magazine_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_reargrip" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_stock" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_trigger" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_charm" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_preview_small_sticker" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "default" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_barrel" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_barrel_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_laser" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_laser" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_magazine" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_magazine_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_magazine_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_muzzle" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_optic" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_reargrip" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_reargrip_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_stock" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_stock_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_underbarrel" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_underbarrel_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_charm" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_charm_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_charm_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_sticker" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_sticker_alt1" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_sticker_alt2" ] = var_becc99297a4bf045;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_preview_large_sticker_alt3" ] = var_becc99297a4bf045;
    var_d059a427c80ca72f = getdvarint( @"hash_4302546668942883", 0 );
    var_ebfe548515a82582 = var_d059a427c80ca72f ? &set_xcam : &update_entities_and_camera;
    transitionarray[ "loadout_showcase_overview" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_overview" ][ "default" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "accelScalar" ] = 0.9;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "moveTime" ] = 0.4;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase" ][ "decelScalar" ] = 0.1;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "accelScalar" ] = 0.9;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "moveTime" ] = 0.4;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_p" ][ "decelScalar" ] = 0.1;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_watch" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_watch" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_watch" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_watch" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "character_tango" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_overview" ][ "character_tango" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "character_tango" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "character_tango" ][ "fadeOutTime" ] = 0;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_01" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_01" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_01" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_01" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_02" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_02" ][ "callback" ] = var_ebfe548515a82582;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_02" ][ "speed" ] = 200;
    transitionarray[ "loadout_showcase_overview" ][ "loadout_showcase_field_upgrade_02" ][ "fov" ] = 50;
    previewtransition = [];
    previewtransition[ "transition" ] = &frontend_camera_teleport;
    previewtransition[ "callback" ] = &set_xcam;
    previewtransition[ "fov" ] = 50;
    previewtransition[ "fadeOutTime" ] = 0.1;
    previewtransition[ "fadeInTime" ] = 0.1;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "weapon_progression" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "weapon_progression_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "weapon_progression_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview" ][ "weapon_customize" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_o_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_progression" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_progression_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_progression_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_customize_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large" ][ "weapon_customize_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "weapon_progression_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "weapon_progression" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "weapon_progression_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small" ][ "weapon_customize_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_riot" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_riot" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "loadout_showcase_o_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_riot" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt1" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt2" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt3" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_sticker_alt4" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small_sticker" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_small_sticker" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_small_sticker" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_preview_small_sticker" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large_sticker" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_large_sticker" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_large_sticker" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "loadout_showcase_preview_large_sticker" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_charm" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_charm" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt1" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt2" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt3" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_charm_alt4" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_small_charm" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_small_charm" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_small_charm" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "loadout_showcase_preview_large_charm" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_large_charm" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_large_charm" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_preview" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_preview" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_preview" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_preview" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "weapon_progression" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "weapon_customize" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "social" ] = previewtransition;
    transitionarray[ "weapon_preview" ][ "social_showcase" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_preview_large" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_preview_large" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_preview_large" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "weapon_progression_large" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "weapon_customize_large" ] = previewtransition;
    transitionarray[ "weapon_preview_large" ][ "weapon_customize_riot" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_preview_small" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_preview_small" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_preview_small" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "loadout_showcase_preview_small" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "weapon_progression_small" ] = previewtransition;
    transitionarray[ "weapon_preview_small" ][ "weapon_customize_small" ] = previewtransition;
    transitionarray[ "weapon_preview_riot" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_preview_riot" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "weapon_preview_riot" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_preview_riot" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_preview_riot" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_preview_riot" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_progression" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_progression" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_preview" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "weapon_progression" ][ "weapon_customize" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_progression_large" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_progression_large" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_progression_large" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "weapon_customize_large" ] = previewtransition;
    transitionarray[ "weapon_progression_large" ][ "weapon_customize_riot" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_progression_small" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "weapon_progression_small" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_progression_small" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "loadout_showcase_preview_small" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "weapon_progression_small" ][ "weapon_customize_small" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_customize" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "weapon_customize" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_o" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_preview" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "weapon_preview" ] = previewtransition;
    transitionarray[ "weapon_customize" ][ "weapon_progression" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_customize_large" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "weapon_customize_large" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_customize_large" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "loadout_showcase_preview_large" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "weapon_preview_large" ] = previewtransition;
    transitionarray[ "weapon_customize_large" ][ "weapon_progression_large" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_customize_small" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "weapon_customize_small" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_customize_small" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "loadout_showcase_p_large" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "loadout_showcase_preview_small" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "weapon_preview_small" ] = previewtransition;
    transitionarray[ "weapon_customize_small" ][ "weapon_progression_small" ] = previewtransition;
    transitionarray[ "weapon_customize_riot" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_customize_riot" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "weapon_customize_riot" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "weapon_customize_riot" ][ "loadout_showcase_p" ] = previewtransition;
    transitionarray[ "weapon_customize_riot" ][ "loadout_showcase_s" ] = previewtransition;
    transitionarray[ "weapon_customize_riot" ][ "weapon_preview_riot" ] = previewtransition;
    transitionarray[ "bundle_preview" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "bundle_preview" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "bundle_preview_large" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "bundle_preview_large" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "bundle_preview_small" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "bundle_preview_small" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "bundle_preview_riot" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "bundle_preview_riot" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "loadout_showcase_preview_watch" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "loadout_showcase_preview_watch" ][ "default" ][ "callback" ] = &set_xcam;
    transitionarray[ "loadout_showcase_preview_watch" ][ "loadout_showcase_watch" ] = previewtransition;
    var_5f8eed20cddec162[ "transition" ] = &frontend_camera_teleport;
    var_5f8eed20cddec162[ "callback" ] = &update_entities_and_camera;
    var_5f8eed20cddec162[ "fadeOutTime" ] = 0.2;
    var_5f8eed20cddec162[ "fadeInTime" ] = 0.2;
    var_5f8eed20cddec162[ "fov" ] = 50;
    var_9adb3c8bfb080950 = [];
    var_9adb3c8bfb080950[ "transition" ] = &frontend_camera_move;
    var_9adb3c8bfb080950[ "callback" ] = &update_entities_and_camera;
    var_9adb3c8bfb080950[ "fov" ] = 50;
    var_9adb3c8bfb080950[ "speed" ] = 200;
    var_9adb3c8bfb080950[ "accelScalar" ] = 0.9;
    var_9adb3c8bfb080950[ "moveTime" ] = 0.4;
    var_9adb3c8bfb080950[ "decelScalar" ] = 0.1;
    transitionarray[ "loadout_showcase_p" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_overview" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "loadout_showcase_preview" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p" ][ "weapon_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "weapon_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "weapon_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "weapon_preview_riot" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p" ][ "social_showcase" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_p_large" ][ "weapon_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "weapon_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "weapon_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "weapon_preview_riot" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_p_large" ][ "social_showcase" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_field_upgrade" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_s" ][ "weapon_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "weapon_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "weapon_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "weapon_preview_riot" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_s" ][ "social_showcase" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o" ][ "weapon_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "weapon_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "weapon_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "weapon_preview_riot" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o" ][ "social_showcase" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_o_large" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "weapon_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "weapon_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "weapon_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "weapon_preview_riot" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_o_large" ][ "social_showcase" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_l" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_l" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_field_upgrade_01" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_field_upgrade_02" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_t" ][ "loadout_showcase_perks_vest" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_specialist" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_x" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_specialist" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_y" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_specialist" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_z" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_specialist" ][ "loadout_showcase_watch" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "default" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_p" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_p_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_s" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_o" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_o_large" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_l" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_t" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_field_upgrade" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_perks" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_x" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_y" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_z" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_watch" ][ "loadout_showcase_overview" ] = var_9adb3c8bfb080950;
    transitionarray[ "character_tango" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_tango" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_tango" ][ "default" ][ "fov" ] = level.camera_character_tango.myfov;
    transitionarray[ "character_tango" ][ "default" ][ "fadeOutTime" ] = 0.2;
    transitionarray[ "character_tango" ][ "default" ][ "fadeInTime" ] = 0.2;
    transitionarray[ "character_tango" ][ "character_faction_select_l_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_tango" ][ "character_faction_select_l_detail" ][ "fov" ] = level.camera_character_tango.myfov;
    transitionarray[ "character_tango" ][ "character_faction_select_l_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_tango" ][ "character_faction_select_r_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_tango" ][ "character_faction_select_r_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_tango" ][ "character_faction_select_r_detail" ][ "fov" ] = level.camera_character_tango.myfov;
    transitionarray[ "character_faction_select_l" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_l" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l" ][ "default" ][ "fov" ] = level.camera_character_faction_select_l.myfov;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_l_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_l_detail" ][ "speed" ] = 150;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_l_detail" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_l_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_l_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l" ][ "character_faction_select_r" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_l_clone" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_l_clone" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l_clone" ][ "default" ][ "fov" ] = level.camera_character_faction_select_l.myfov;
    transitionarray[ "character_faction_select_l_detail" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_l_detail" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l_detail" ][ "default" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_faction_select_l_detail" ][ "default" ][ "fadeOutTime" ] = 0.2;
    transitionarray[ "character_faction_select_l_detail" ][ "default" ][ "fadeInTime" ] = 0.2;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_r_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_r_detail" ][ "fov" ] = level.camera_character_faction_select_r_detail.myfov;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_r_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l_detail" ][ "character_tango" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_l_detail" ][ "character_tango" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_faction_select_l_detail" ][ "character_tango" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_l" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_l" ][ "speed" ] = 150;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_l" ][ "fov" ] = level.camera_character_faction_select_l.myfov;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_l" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_l_detail" ][ "character_faction_select_l" ][ "use_bounce" ] = 1;
    transitionarray[ "character_faction_select_r" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_r" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r" ][ "default" ][ "fov" ] = level.camera_character_faction_select_r.myfov;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_r_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_r_detail" ][ "speed" ] = 150;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_r_detail" ][ "fov" ] = level.camera_character_faction_select_r_detail.myfov;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_r_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_r_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "character_faction_select_r" ][ "character_faction_select_l" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_r_detail" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_faction_select_r_detail" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r_detail" ][ "default" ][ "fov" ] = level.camera_character_faction_select_r_detail.myfov;
    transitionarray[ "character_faction_select_r_detail" ][ "default" ][ "fadeOutTime" ] = 0.2;
    transitionarray[ "character_faction_select_r_detail" ][ "default" ][ "fadeInTime" ] = 0.2;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_l_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_l_detail" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_l_detail" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r_detail" ][ "character_tango" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_r_detail" ][ "character_tango" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_faction_select_r_detail" ][ "character_tango" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_r" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_r" ][ "speed" ] = 150;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_r" ][ "fov" ] = level.camera_character_faction_select_r.myfov;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_r" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_faction_select_r_detail" ][ "character_faction_select_r" ][ "use_bounce" ] = 1;
    transitionarray[ "character_preview_select" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_preview_select" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_preview_select" ][ "default" ][ "fov" ] = level.camera_character_faction_select_l.myfov;
    transitionarray[ "character_preview_select" ][ "character_preview_select_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_preview_select" ][ "character_preview_select_detail" ][ "speed" ] = 150;
    transitionarray[ "character_preview_select" ][ "character_preview_select_detail" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_preview_select" ][ "character_preview_select_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "character_preview_select" ][ "character_preview_select" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_preview_select_detail" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_preview_select_detail" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_preview_select_detail" ][ "default" ][ "fov" ] = level.camera_character_faction_select_l_detail.myfov;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select_detail" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select_detail" ][ "fov" ] = level.camera_character_faction_select_r_detail.myfov;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select" ][ "speed" ] = 150;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select" ][ "fov" ] = level.camera_character_faction_select_l.myfov;
    transitionarray[ "character_preview_select_detail" ][ "character_preview_select" ][ "use_bounce" ] = 1;
    transitionarray[ "character_tournaments" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "character_tournaments" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "character_tournaments" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby" ][ "squad_lobby_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby" ][ "squad_lobby_detail" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby" ][ "squad_lobby_detail" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby" ][ "squad_lobby_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "squad_lobby" ][ "loadout_showcase_overview" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby" ][ "loadout_showcase_overview" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby" ][ "loadout_showcase_overview" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby" ][ "loadout_showcase_overview" ][ "fadeOutTime" ] = 0;
    transitionarray[ "squad_lobby_dmz" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby_dmz" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby_dmz" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_dmz" ][ "squad_lobby_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby_dmz" ][ "squad_lobby_detail" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby_dmz" ][ "squad_lobby_detail" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_dmz" ][ "squad_lobby_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "squad_lobby_dmz" ][ "loadout_showcase_overview" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby_dmz" ][ "loadout_showcase_overview" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby_dmz" ][ "loadout_showcase_overview" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_dmz" ][ "loadout_showcase_overview" ][ "fadeOutTime" ] = 0;
    transitionarray[ "squad_lobby_br" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby_br" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby_br" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_br" ][ "squad_lobby_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby_br" ][ "squad_lobby_detail" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby_br" ][ "squad_lobby_detail" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_br" ][ "squad_lobby_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "squad_lobby_br" ][ "loadout_showcase_overview" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby_br" ][ "loadout_showcase_overview" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby_br" ][ "loadout_showcase_overview" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_br" ][ "loadout_showcase_overview" ][ "fadeOutTime" ] = 0;
    transitionarray[ "squad_lobby_detail" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "squad_lobby_detail" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "squad_lobby_detail" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby" ][ "use_bounce" ] = 1;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_dmz" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_dmz" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_dmz" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_dmz" ][ "use_bounce" ] = 1;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_br" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_br" ][ "speed" ] = 150;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_br" ][ "fov" ] = 36;
    transitionarray[ "squad_lobby_detail" ][ "squad_lobby_br" ][ "use_bounce" ] = 1;
    transitionarray[ "social" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "social" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "social" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "social" ][ "social_detail" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "social" ][ "social_detail" ][ "speed" ] = 150;
    transitionarray[ "social" ][ "social_detail" ][ "fov" ] = 36;
    transitionarray[ "social" ][ "social_detail" ][ "use_bounce" ] = 1;
    transitionarray[ "social_detail" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "social_detail" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "social_detail" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "social_detail" ][ "social" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "social_detail" ][ "social" ][ "speed" ] = 150;
    transitionarray[ "social_detail" ][ "social" ][ "fov" ] = 36;
    transitionarray[ "social_detail" ][ "social" ][ "use_bounce" ] = 1;
    transitionarray[ "social_wide" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "social_wide" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "social_wide" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "social_showcase" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "social_showcase" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "social_showcase" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "showcase_operator" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "showcase_operator" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "showcase_operator" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "showcase_weapon" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "showcase_weapon" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "showcase_weapon" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "aar_performance" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "aar_performance" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "aar_performance" ][ "default" ][ "fov" ] = 36;
    transitionarray[ "ui_bg_01" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "ui_bg_01" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "ui_bg_01" ][ "default" ][ "fov" ] = 28;
    transitionarray[ "weapon_showcase" ] = [];
    transitionarray[ "weapon_showcase" ][ "default" ] = [];
    transitionarray[ "weapon_showcase" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "weapon_showcase" ][ "default" ][ "callback" ] = &update_camera_depth_of_field;
    transitionarray[ "weapon_showcase" ][ "default" ][ "fov" ] = 50;
    transitionarray[ "barracks" ] = [];
    transitionarray[ "barracks" ][ "default" ] = [];
    transitionarray[ "barracks" ][ "default" ][ "transition" ] = &frontend_camera_move;
    transitionarray[ "barracks" ][ "default" ][ "callback" ] = &update_camera_depth_of_field;
    transitionarray[ "barracks" ][ "default" ][ "speed" ] = 100;
    transitionarray[ "barracks" ][ "weapon_showcase" ][ "speed" ] = 5000;
    transitionarray[ "player_character_showcase" ] = [];
    transitionarray[ "player_character_showcase" ][ "default" ] = [];
    transitionarray[ "player_character_showcase" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "player_character_showcase" ][ "default" ][ "callback" ] = &update_player_character_showcase;
    var_43207c931b7e484e = [];
    var_43207c931b7e484e[ "transition" ] = &frontend_camera_teleport;
    var_43207c931b7e484e[ "fadeOutTime" ] = 0.1;
    var_43207c931b7e484e[ "fadeInTime" ] = 0.15;
    transitionarray[ "battle_pass_vehicle" ][ "default" ] = var_43207c931b7e484e;
    transitionarray[ "battle_pass_vehicle" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "battle_pass_character" ][ "default" ] = var_43207c931b7e484e;
    transitionarray[ "battle_pass_character" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "battle_pass_weapon" ][ "default" ] = var_43207c931b7e484e;
    transitionarray[ "battle_pass_weapon" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "battle_pass_items" ][ "default" ] = var_43207c931b7e484e;
    transitionarray[ "battle_pass_items" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    transitionarray[ "battle_pass_vehicle" ][ "social" ] = [];
    transitionarray[ "battle_pass_vehicle" ][ "social" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "battle_pass_vehicle" ][ "social" ][ "fadeOutTime" ] = 0;
    transitionarray[ "battle_pass_vehicle" ][ "social" ][ "fadeInTime" ] = 0;
    transitionarray[ "battle_pass_character" ][ "social" ] = [];
    transitionarray[ "battle_pass_character" ][ "social" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "battle_pass_character" ][ "social" ][ "fadeOutTime" ] = 0;
    transitionarray[ "battle_pass_character" ][ "social" ][ "fadeInTime" ] = 0;
    transitionarray[ "battle_pass_weapon" ][ "social" ] = [];
    transitionarray[ "battle_pass_weapon" ][ "social" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "battle_pass_weapon" ][ "social" ][ "fadeOutTime" ] = 0;
    transitionarray[ "battle_pass_weapon" ][ "social" ][ "fadeInTime" ] = 0;
    transitionarray[ "battle_pass_items" ][ "social" ] = [];
    transitionarray[ "battle_pass_items" ][ "social" ][ "transition" ] = &frontend_camera_teleport;
    transitionarray[ "battle_pass_items" ][ "social" ][ "fadeOutTime" ] = 0;
    transitionarray[ "battle_pass_items" ][ "social" ][ "fadeInTime" ] = 0;
    transitionarray[ "firingrange" ][ "default" ] = var_43207c931b7e484e;
    transitionarray[ "firingrange" ][ "default" ][ "callback" ] = &update_entities_and_camera;
    
    if ( level.var_3d353e3274a23c81 )
    {
        transitionarray[ "frontendwalkablescene" ] = [];
        transitionarray[ "frontendwalkablescene" ][ "default" ] = var_43207c931b7e484e;
        transitionarray[ "frontendwalkablescene" ][ "default" ][ "transition" ] = &frontend_camera_teleport;
    }
    
    transitionarray[ "loadout_showcase_field_upgrade" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "loadout_showcase_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "loadout_showcase_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "bundle_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "bundle_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "bundle_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade" ][ "battle_pass_character_detail" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "loadout_showcase_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "loadout_showcase_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "bundle_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "bundle_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "bundle_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_01" ][ "battle_pass_character_detail" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "loadout_showcase_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "loadout_showcase_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "loadout_showcase_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "bundle_preview" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "bundle_preview_large" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "bundle_preview_small" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_field_upgrade_02" ][ "battle_pass_character_detail" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks_vest" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks_gloves" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks_boots" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks_gear_1" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks_gear_2" ][ "default" ] = var_9adb3c8bfb080950;
    transitionarray[ "loadout_showcase_perks_vest" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks_gloves" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks_boots" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks_gear_1" ][ "social" ] = var_5f8eed20cddec162;
    transitionarray[ "loadout_showcase_perks_gear_2" ][ "social" ] = var_5f8eed20cddec162;
    level.transitionarray = transitionarray;
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x961b5ae4, Offset: 0x148f4
// Size: 0x27fa
function private get_section_state( requestedsection )
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    sectionstate = [];
    var_8bf60784d6fd5e81 = !isdefined( level.active_scene_data ) || level.transition_interrupted;
    
    if ( isdefined( level.playerviewowner ) )
    {
        level.playerviewowner visionsetnakedforplayer( "", 0 );
    }
    
    switch ( requestedsection.name )
    {
        case #"hash_34a12a8952ff9f73":
        case #"hash_34a12b8952ffa106":
        case #"hash_34a12f8952ffa752":
        case #"hash_34a1318952ffaa78":
        case #"hash_34a1338952ffad9e":
        case #"hash_34a1348952ffaf31":
        case #"hash_34a1468952ffcb87":
        case #"hash_34a1478952ffcd1a":
        case #"hash_45ebf138ab51a7d1":
        case #"hash_4a375d7e61a6c1e7":
            sectionscriptbundle = getscriptbundle( hashcat( %"hash_68ebd7ee3c465855", requestedsection.name ) );
            
            if ( !isdefined( sectionscriptbundle ) )
            {
                return;
            }
            
            break;
        default:
            break;
    }
    
    switch ( requestedsection.name )
    {
        case #"hash_1326142e1033cb47":
            break;
        case #"hash_9dd6064e8ca4a5d5":
            sectionstate[ "scene" ] = level.var_1e446196eb4e97e6;
            sectionstate[ "camera" ] = level.var_1e446196eb4e97e6.basecam;
            break;
        case #"hash_1b3ccd8c05bf147a":
            sectionstate[ "scene" ] = level.camera_lobby;
            sectionstate[ "camera" ] = level.camera_lobby.basecam;
            function_5bb771346af1d9d3();
            function_5bb770346af1d7a0();
            break;
        case #"hash_a03b1add89f2d35e":
            sectionstate[ "scene" ] = level.camera_lobby_detail;
            sectionstate[ "camera" ] = level.camera_lobby_detail.basecam;
            break;
        case #"hash_f7f91c417f08f99a":
            if ( level.var_a4d14a560c391aa0 )
            {
                sectionstate[ "scene" ] = level.var_68d0b3379d2dd026;
                sectionstate[ "camera" ] = level.var_68d0b3379d2dd026.basecam;
            }
            else
            {
                sectionstate[ "scene" ] = level.camera_lobby_detail;
                sectionstate[ "camera" ] = level.camera_lobby_detail.basecam;
            }
            
            break;
        case #"hash_97752ff2d2989d0f":
            if ( level.var_a4d14a560c391aa0 )
            {
                sectionstate[ "scene" ] = level.var_545e67652767893;
                sectionstate[ "camera" ] = level.var_545e67652767893.basecam;
            }
            else
            {
                sectionstate[ "scene" ] = level.camera_lobby_detail;
                sectionstate[ "camera" ] = level.camera_lobby_detail.basecam;
            }
            
            break;
        case #"hash_82bd1bffd7e1f1a6":
            sectionstate[ "scene" ] = level.var_545e67652767893;
            sectionstate[ "camera" ] = level.var_545e67652767893.basecam;
            break;
        case #"hash_110fbc0b986c29aa":
            sectionstate[ "scene" ] = level.var_b2a8c49dc8332075;
            sectionstate[ "camera" ] = level.var_b2a8c49dc8332075.basecam;
            break;
        case #"hash_f014ffc8aa724fb":
            sectionstate[ "scene" ] = level.var_68d0b3379d2dd026;
            sectionstate[ "camera" ] = level.var_68d0b3379d2dd026.basecam;
            break;
        case #"hash_ee2ab54cbbc82cbd":
            sectionstate[ "scene" ] = level.var_c85b13255e4d9ca;
            sectionstate[ "camera" ] = level.var_c85b13255e4d9ca.basecam;
            break;
        case #"hash_a4ee0391db6b651f":
            sectionstate[ "scene" ] = level.camera_crib_dmz;
            sectionstate[ "camera" ] = level.camera_crib_dmz.basecam;
            break;
        case #"hash_787e7e5e19624661":
            sectionstate[ "scene" ] = level.camera_crib_dmz_detail;
            sectionstate[ "camera" ] = level.camera_crib_dmz_detail.basecam;
            break;
        case #"hash_40248e51024c9732":
            sectionstate[ "scene" ] = level.camera_social;
            sectionstate[ "camera" ] = level.camera_social.basecam;
            break;
        case #"hash_1319c1ff531ed768":
            sectionstate[ "scene" ] = level.var_bd9fdc0042f54651;
            sectionstate[ "camera" ] = level.var_bd9fdc0042f54651.basecam;
            break;
        case #"hash_fa98418ade667a96":
            sectionstate[ "scene" ] = level.var_27430ca78f382807;
            sectionstate[ "camera" ] = level.var_27430ca78f382807.basecam;
            break;
        case #"hash_94165ff5cf7fa155":
            sectionstate[ "scene" ] = level.var_1edba9f9c2490f58;
            sectionstate[ "camera" ] = level.var_1edba9f9c2490f58.basecam;
            break;
        case #"hash_a155b5016bfdb759":
            sectionstate[ "scene" ] = level.var_ddfac298df244b5c;
            sectionstate[ "camera" ] = level.var_ddfac298df244b5c.basecam;
            break;
        case #"hash_15c453ef442d22e6":
            sectionstate[ "scene" ] = level.var_753f787bb8419e6d;
            sectionstate[ "camera" ] = level.var_753f787bb8419e6d.basecam;
            break;
        case #"hash_104db2c291aca36e":
        case #"hash_e48e69ed48eb8872":
            sectionstate[ "scene" ] = level.camera_character_tango;
            sectionstate[ "camera" ] = level.camera_character_tango.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            function_5bb771346af1d9d3();
            function_f1bc4aed1032ba22();
            function_d38a01950fd7d9b5();
            function_5bb770346af1d7a0();
            break;
        case #"hash_c9bb3dc88b9fd73d":
            sectionstate[ "scene" ] = level.var_57de6213f23231ac;
            sectionstate[ "camera" ] = level.var_57de6213f23231ac.basecam;
            function_7c2d9572caa97fd7( "battlepass_character" );
            break;
        case #"hash_e455bc38a3035527":
            sectionstate[ "scene" ] = level.var_3abacfeb6235b358;
            sectionstate[ "camera" ] = level.var_3abacfeb6235b358.basecam;
            function_7c2d9572caa97fd7( "store_character" );
            function_5bb771346af1d9d3();
            break;
        case #"hash_65314805226740a":
            sectionstate[ "scene" ] = level.var_3f38ce7f2f49b95;
            sectionstate[ "camera" ] = level.var_3f38ce7f2f49b95.basecam;
            break;
        case #"hash_2c9fc69edeb2af26":
            sectionstate[ "scene" ] = level.var_4635780be563d7b;
            sectionstate[ "camera" ] = level.var_4635780be563d7b.basecam;
            break;
        case #"hash_6a6ef27fa322fdb6":
            sectionstate[ "scene" ] = level.var_3f817d1c8dbca9bd;
            sectionstate[ "camera" ] = level.var_3f817d1c8dbca9bd.basecam;
            break;
        case #"hash_ab7920a236c7c262":
            sectionstate[ "scene" ] = level.var_799ac2be8984ef6d;
            sectionstate[ "camera" ] = level.var_799ac2be8984ef6d.basecam;
            break;
        case #"hash_8576db07bac8d6c2":
            sectionstate[ "scene" ] = level.var_a0cab3c394a9f731;
            sectionstate[ "camera" ] = level.var_a0cab3c394a9f731.basecam;
            break;
        case #"hash_521816631cee456":
            sectionstate[ "scene" ] = level.var_4f8ccb757ba677d5;
            sectionstate[ "camera" ] = level.var_4f8ccb757ba677d5.basecam;
            break;
        case #"hash_8b6b4b1228fa1fe9":
            sectionstate[ "scene" ] = level.var_3631e1a2f608396c;
            sectionstate[ "camera" ] = level.var_3631e1a2f608396c.basecam;
            break;
        case #"hash_51de71777d38997":
            sectionstate[ "scene" ] = level.var_fe01ffda20f02a93;
            sectionstate[ "camera" ] = level.var_fe01ffda20f02a93.basecam;
            function_2dc1ae88b7014cc9();
            break;
        case #"hash_e4c9908a0579dd88":
            sectionstate[ "scene" ] = level.camera_walkable_space;
            sectionstate[ "camera" ] = level.camera_walkable_space.basecam;
            break;
        case #"hash_4b6d3aaf28ce27af":
            sectionstate[ "scene" ] = level.camera_character_faction_select_l;
            sectionstate[ "camera" ] = level.camera_character_faction_select_l.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_95b65e00718558d":
            sectionstate[ "scene" ] = level.camera_character_faction_select_l;
            sectionstate[ "camera" ] = level.camera_character_faction_select_l.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_d75ba083b1c5e911":
            sectionstate[ "scene" ] = level.camera_character_faction_select_l_detail;
            sectionstate[ "camera" ] = level.camera_character_faction_select_l_detail.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_e68fc7cfd8cc07b8":
            sectionstate[ "scene" ] = level.camera_character_preview_select;
            sectionstate[ "camera" ] = level.camera_character_preview_select.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_88359450d2fe1974":
            sectionstate[ "scene" ] = level.camera_character_preview_select_detail;
            sectionstate[ "camera" ] = level.camera_character_preview_select_detail.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_4b6d30af28ce17f1":
            sectionstate[ "scene" ] = level.camera_character_faction_select_r;
            sectionstate[ "camera" ] = level.camera_character_faction_select_r.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_442dd9aded5a5adb":
            sectionstate[ "scene" ] = level.camera_character_faction_select_r_detail;
            sectionstate[ "camera" ] = level.camera_character_faction_select_r_detail.basecam;
            function_7c2d9572caa97fd7( "Operator" );
            break;
        case #"hash_5fb647ebf45ace9b":
            sectionstate[ "scene" ] = level.camera_character_tournaments;
            sectionstate[ "camera" ] = level.camera_character_tournaments.basecam;
            break;
        case #"hash_4205f17832919979":
        case #"hash_d96b102da878bf0f":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_overview;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_overview.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            function_816538d08541ca79();
            function_2dc1ae88b7014cc9();
            function_a8d269be08ab20c8();
            function_5bb770346af1d7a0();
            break;
        case #"hash_c364c37a7df6456":
            sectionstate[ "scene" ] = level.var_338dfe185b350354;
            sectionstate[ "camera" ] = level.var_338dfe185b350354.basecam;
            raritycamera( "medium" );
            function_7c2d9572caa97fd7( "Gunbench" );
            function_d38a01950fd7d9b5();
            function_a8d269be08ab20c8();
            function_a02aeaf6a41a0a14();
            level.playerviewowner visionsetnakedforplayer( "mp_frontend_jup_01_weapon_preview", 0 );
            break;
        case #"hash_be3bd585498a6ae6":
            sectionstate[ "scene" ] = level.var_189d78a7903a9a80;
            sectionstate[ "camera" ] = level.var_189d78a7903a9a80.basecam;
            raritycamera( "large" );
            function_7c2d9572caa97fd7( "Gunbench" );
            level.playerviewowner visionsetnakedforplayer( "mp_frontend_jup_01_weapon_preview", 0 );
            break;
        case #"hash_5cc66fe2e71f720a":
            sectionstate[ "scene" ] = level.var_5f1b4955dce209a8;
            sectionstate[ "camera" ] = level.var_5f1b4955dce209a8.basecam;
            raritycamera( "small" );
            function_7c2d9572caa97fd7( "Gunbench" );
            level.playerviewowner visionsetnakedforplayer( "mp_frontend_jup_01_weapon_preview", 0 );
            break;
        case #"hash_248405f0613a37fd":
            sectionstate[ "scene" ] = level.var_7f88ff3202fe9db;
            sectionstate[ "camera" ] = level.var_7f88ff3202fe9db.basecam;
            break;
        case #"hash_3fec9c3219804c0d":
            sectionstate[ "scene" ] = level.var_6adcae182bd719a7;
            sectionstate[ "camera" ] = level.var_6adcae182bd719a7.basecam;
            raritycamera( "medium" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_1d26c8f742a4ef31":
            sectionstate[ "scene" ] = level.var_bebcc67049d3b6f7;
            sectionstate[ "camera" ] = level.var_bebcc67049d3b6f7.basecam;
            raritycamera( "large" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_fb8d15ff96772235":
            sectionstate[ "scene" ] = level.var_df6d55bd563ae15f;
            sectionstate[ "camera" ] = level.var_df6d55bd563ae15f.basecam;
            raritycamera( "small" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_2ad4511c672b3479":
            sectionstate[ "scene" ] = level.var_90277a8d8fbafd03;
            sectionstate[ "camera" ] = level.var_90277a8d8fbafd03.basecam;
            raritycamera( "medium" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_facaeaf0ac11387d":
            sectionstate[ "scene" ] = level.var_81e8a4c928f3a923;
            sectionstate[ "camera" ] = level.var_81e8a4c928f3a923.basecam;
            raritycamera( "large" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_5e1d833551ca1661":
            sectionstate[ "scene" ] = level.var_9b12b18630bc671b;
            sectionstate[ "camera" ] = level.var_9b12b18630bc671b.basecam;
            raritycamera( "small" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_98e7b38df85ca168":
            sectionstate[ "scene" ] = level.var_fc6c44693316787a;
            sectionstate[ "camera" ] = level.var_fc6c44693316787a.basecam;
            raritycamera( "large" );
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_19ed0e9de6d8f60e":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview.basecam;
            raritycamera( "medium" );
            function_d38a01950fd7d9b5();
            function_a8d269be08ab20c8();
            function_a02aeaf6a41a0a14();
            function_2dc1ae88b7014cc9();
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_c36ef36dd1c5f0be":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large.basecam;
            raritycamera( "large" );
            function_a8d269be08ab20c8();
            function_d38a01950fd7d9b5();
            function_a02aeaf6a41a0a14();
            function_2dc1ae88b7014cc9();
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_7e8acee7da2d9002":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small.basecam;
            raritycamera( "small" );
            function_a8d269be08ab20c8();
            function_d38a01950fd7d9b5();
            function_a02aeaf6a41a0a14();
            function_2dc1ae88b7014cc9();
            function_7c2d9572caa97fd7( "Gunbench" );
            break;
        case #"hash_44ddc2242369a755":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_riot;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_riot.basecam;
            break;
        case #"hash_bfc3955a42dd0442":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_watch;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_watch.basecam;
            raritycamera( "watch" );
            break;
        case #"hash_1a02be6831832733":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_barrel;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_barrel.basecam;
            break;
        case #"hash_bed1face88fdcb22":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_barrel_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_barrel_alt1.basecam;
            break;
        case #"hash_bed1f9ce88fdc98f":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_barrel_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_barrel_alt2.basecam;
            break;
        case #"hash_ae36caa1297604f2":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_charm;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_charm.basecam;
            break;
        case #"hash_472c92bf362ca091":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_charm_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_charm_alt1.basecam;
            break;
        case #"hash_472c8fbf362c9bd8":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_charm_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_charm_alt2.basecam;
            break;
        case #"hash_472c90bf362c9d6b":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_charm_alt3;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_charm_alt3.basecam;
            break;
        case #"hash_472c95bf362ca54a":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_charm_alt4;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_charm_alt4.basecam;
            break;
        case #"hash_c9fc556dd4fb88f6":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_laser;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_laser.basecam;
            break;
        case #"hash_5161fdf8fea13375":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_laser_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_laser_alt1.basecam;
            break;
        case #"hash_5161faf8fea12ebc":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_laser_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_laser_alt2.basecam;
            break;
        case #"hash_ce66d785edbb652d":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_magazine;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_magazine.basecam;
            break;
        case #"hash_7ec8461faf149064":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_magazine_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_magazine_alt1.basecam;
            break;
        case #"hash_7ec8491faf14951d":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_magazine_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_magazine_alt2.basecam;
            break;
        case #"hash_2bc9361cebbbcbd2":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_muzzle;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_muzzle.basecam;
            break;
        case #"hash_703c7fd9224070b1":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_muzzle_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_muzzle_alt1.basecam;
            break;
        case #"hash_b254a9604b488320":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_optic;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_optic.basecam;
            break;
        case #"hash_b32dd453b0b185ef":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_optic_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_optic_alt1.basecam;
            break;
        case #"hash_a5e0219576906481":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_reargrip;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_reargrip.basecam;
            break;
        case #"hash_77f7b408606d1238":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_reargrip_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_reargrip_alt1.basecam;
            break;
        case #"hash_77f7b708606d16f1":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_reargrip_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_reargrip_alt2.basecam;
            break;
        case #"hash_d566f0bff3ad6ffe":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_sticker;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_sticker.basecam;
            break;
        case #"hash_9aea309bf7e7e9ed":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_sticker_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_sticker_alt1.basecam;
            break;
        case #"hash_9aea2d9bf7e7e534":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_sticker_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_sticker_alt2.basecam;
            break;
        case #"hash_9aea2e9bf7e7e6c7":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_sticker_alt3;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_sticker_alt3.basecam;
            break;
        case #"hash_9aea2b9bf7e7e20e":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_sticker_alt4;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_sticker_alt4.basecam;
            break;
        case #"hash_46b9834d37017c5f":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_stock;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_stock.basecam;
            break;
        case #"hash_4194b71a94fb817e":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_stock_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_stock_alt1.basecam;
            break;
        case #"hash_4194b61a94fb7feb":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_stock_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_stock_alt2.basecam;
            break;
        case #"hash_1a96f606bada8c07":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_underbarrel;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_underbarrel.basecam;
            break;
        case #"hash_21aa25df730e1363":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_barrel;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_barrel.basecam;
            break;
        case #"hash_b03e7af96e0cc592":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_barrel_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_barrel_alt1.basecam;
            break;
        case #"hash_4379b9c7a2831922":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_charm;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_charm.basecam;
            break;
        case #"hash_989642de7c8f0501":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_charm_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_charm_alt1.basecam;
            break;
        case #"hash_98963fde7c8f0048":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_charm_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_charm_alt2.basecam;
            break;
        case #"hash_1e404931df187946":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_laser;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_laser.basecam;
            break;
        case #"hash_72931d90e9f9c4fd":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_magazine;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_magazine.basecam;
            break;
        case #"hash_bce86b3a86f0c434":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_magazine_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_magazine_alt1.basecam;
            break;
        case #"hash_bce86e3a86f0c8ed":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_magazine_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_magazine_alt2.basecam;
            break;
        case #"hash_3287498ac2bdec62":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_muzzle;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_muzzle.basecam;
            break;
        case #"hash_5bbe3fca9d4cc6c1":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_muzzle_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_muzzle_alt1.basecam;
            break;
        case #"hash_ffa5b7c1c1a799f0":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_optic;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_optic.basecam;
            break;
        case #"hash_c3c7633ef4e5e971":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_reargrip;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_reargrip.basecam;
            break;
        case #"hash_ea6b42a40068e528":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_reargrip_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_reargrip_alt1.basecam;
            break;
        case #"hash_f1629b80ba25d36e":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_sticker;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_sticker.basecam;
            break;
        case #"hash_646e277328ea1c5d":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_sticker_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_sticker_alt1.basecam;
            break;
        case #"hash_646e247328ea17a4":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_sticker_alt2;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_sticker_alt2.basecam;
            break;
        case #"hash_646e257328ea1937":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_sticker_alt3;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_sticker_alt3.basecam;
            break;
        case #"hash_189960eb1cd2112f":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_stock;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_stock.basecam;
            break;
        case #"hash_5890922b50b3f2ce":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_stock_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_stock_alt1.basecam;
            break;
        case #"hash_3d5aa4ebe484d097":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_underbarrel;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_underbarrel.basecam;
            break;
        case #"hash_e2a532526c4b1986":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_large_underbarrel_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_large_underbarrel_alt1.basecam;
            break;
        case #"hash_5c8cf8ab59b4ef97":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_barrel;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_barrel.basecam;
            break;
        case #"hash_fda8d24e03c1db76":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_charm;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_charm.basecam;
            break;
        case #"hash_b91600265f2dd072":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_laser;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_laser.basecam;
            break;
        case #"hash_a29c118653f671":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_magazine;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_magazine.basecam;
            break;
        case #"hash_594a0c65c7d7cc28":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_magazine_alt1;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_magazine_alt1.basecam;
            break;
        case #"hash_7e5fff2eb82441c6":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_muzzle;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_muzzle.basecam;
            break;
        case #"hash_a271bcda8ca803bc":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_optic;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_optic.basecam;
            break;
        case #"hash_c39eb86ef6e2f365":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_reargrip;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_reargrip.basecam;
            break;
        case #"hash_5d37977ba99ef70a":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_sticker;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_sticker.basecam;
            break;
        case #"hash_a8d85b2b5283a5cb":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_stock;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_stock.basecam;
            break;
        case #"hash_e20e17a8dfe74e9":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_preview_small_trigger;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_preview_small_trigger.basecam;
            break;
        case #"hash_eabd7b3e2f655111":
            sectionstate[ "scene" ] = level.camera_loadout_showcase;
            sectionstate[ "camera" ] = level.camera_loadout_showcase.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            function_5bb771346af1d9d3();
            function_a8d269be08ab20c8();
            function_5bb770346af1d7a0();
            break;
        case #"hash_4ed1bd50498307a0":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_armory;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_armory.basecam;
            break;
        case #"hash_34a12b8952ffa106":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_p;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_p.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            function_5bb770346af1d7a0();
            function_2dc1ae88b7014cc9();
            break;
        case #"hash_2d78680345ec28d6":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_p_large;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_p_large.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            function_5bb770346af1d7a0();
            function_2dc1ae88b7014cc9();
            break;
        case #"hash_34a12a8952ff9f73":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_s;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_s.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            function_5bb770346af1d7a0();
            break;
        case #"hash_34a1468952ffcb87":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_o;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_o.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_de5d7c1255c8ccb7":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_o_large;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_o_large.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_34a1478952ffcd1a":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_l;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_l.basecam;
            function_7c2d9572caa97fd7( "Loadout_lethal" );
            
            if ( ismgl )
            {
                level.playerviewowner visionsetnakedforplayer( "mp_frontend_mgl_lethal", 0 );
            }
            
            break;
        case #"hash_34a12f8952ffa752":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_t;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_t.basecam;
            function_7c2d9572caa97fd7( "Loadout_tactical" );
            
            if ( ismgl )
            {
                level.playerviewowner visionsetnakedforplayer( "mp_frontend_mgl_tactical", 0 );
            }
            
            break;
        case #"hash_45ebf138ab51a7d1":
            sectionstate[ "scene" ] = level.var_9fc572fb1e83f719;
            sectionstate[ "camera" ] = level.var_9fc572fb1e83f719.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_337d36b77d1fa16d":
            sectionstate[ "scene" ] = level.var_91fb6c633cf72815;
            sectionstate[ "camera" ] = level.var_91fb6c633cf72815.basecam;
            function_7c2d9572caa97fd7( "Loadout_fu" );
            break;
        case #"hash_337d33b77d1f9cb4":
            sectionstate[ "scene" ] = level.var_91fb69633cf7217c;
            sectionstate[ "camera" ] = level.var_91fb69633cf7217c.basecam;
            break;
        case #"hash_4a375d7e61a6c1e7":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_perks;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_perks.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_6e4e92fa76f6812a":
            sectionstate[ "scene" ] = level.var_884e0f465e9bf917;
            sectionstate[ "camera" ] = level.var_884e0f465e9bf917.basecam;
            function_7c2d9572caa97fd7( "Loadout_vest" );
            break;
        case #"hash_82307786bffffc0e":
            sectionstate[ "scene" ] = level.var_884e10465e9bfb4a;
            sectionstate[ "camera" ] = level.var_884e10465e9bfb4a.basecam;
            function_7c2d9572caa97fd7( "Loadout_vest" );
            break;
        case #"hash_3461177fb9a87859":
            sectionstate[ "scene" ] = level.var_884e11465e9bfd7d;
            sectionstate[ "camera" ] = level.var_884e11465e9bfd7d.basecam;
            function_7c2d9572caa97fd7( "Loadout_boot" );
            break;
        case #"hash_fe9236004518ddc7":
            sectionstate[ "scene" ] = level.var_884e0a465e9bee18;
            sectionstate[ "camera" ] = level.var_884e0a465e9bee18.basecam;
            function_7c2d9572caa97fd7( "Loadout_helmet" );
            break;
        case #"hash_fe9237004518df5a":
            sectionstate[ "scene" ] = level.var_884e0b465e9bf04b;
            sectionstate[ "camera" ] = level.var_884e0b465e9bf04b.basecam;
            function_7c2d9572caa97fd7( "Loadout_helmet" );
            break;
        case #"hash_34a1338952ffad9e":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_x;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_x.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_34a1348952ffaf31":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_y;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_y.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_34a1318952ffaa78":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_z;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_z.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_2b806046ece6c597":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_specialist;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_specialist.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_97f23301828b3019":
            sectionstate[ "scene" ] = level.camera_loadout_showcase_watch;
            sectionstate[ "camera" ] = level.camera_loadout_showcase_watch.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_ca521a71d39e3a33":
            sectionstate[ "scene" ] = level.camera_ui_bg_01;
            sectionstate[ "camera" ] = level.camera_ui_bg_01.basecam;
            function_7c2d9572caa97fd7( "Loadout" );
            break;
        case #"hash_8f69629c3ee1c05e":
            var_f84c9602ae906743 = var_8bf60784d6fd5e81 ? level.camera_ui_bg_01 : level.active_scene_data;
            sectionstate[ "scene" ] = level.camera_ui_bg_01;
            sectionstate[ "camera" ] = level.camera_ui_bg_01.basecam;
            break;
        case #"hash_2181393f28efb190":
            sectionstate[ "scene" ] = level.camera_ui_bg_01;
            sectionstate[ "camera" ] = level.camera_ui_bg_01.basecam;
            break;
        case #"hash_c7392efa00b519fb":
        case #"hash_1ed76e35223c5eb3":
        case #"hash_fe2e514b823e174":
        case #"hash_891351905d305bb4":
        case #"hash_c94d87799a3dda5":
        case #"hash_3f3b504a81e338eb":
        case #"hash_d34149c8260f5222":
            sectionstate[ "scene" ] = level.var_2a78f2095be6d912;
            sectionstate[ "camera" ] = level.var_2a78f2095be6d912.basecam;
            break;
        case #"hash_9fcebcde5c2cb4d2":
        case #"hash_71c9ee90bb1ef8bf":
            break;
        default:
            assert( 0, "<dev string:x63a>" );
            break;
    }
    
    return sectionstate;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x59ebbd6b, Offset: 0x170f7
// Size: 0x498
function private function_4a5f5f2416798696()
{
    var_12fb015cacc91c9e = level.var_3d353e3274a23c81 ? &function_c2e9d8d8407b0064 : undefined;
    var_12fb015cacc91c9e = level.var_3d353e3274a23c81 ? &function_c2e9d8d8407b0064 : undefined;
    level.camera_loadout_showcase = spawnstruct();
    level.camera_loadout_showcase.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith" );
    
    if ( level.camera_loadout_showcase.basecam )
    {
        level.camera_loadout_showcase.basecam.depthoffieldvalues = [ 12, 48 ];
        level.camera_loadout_showcase.myfov = 60;
        level.camera_loadout_showcase.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
        level.camera_loadout_showcase.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
        level.camera_loadout_showcase.weapon_locs[ 2 ] = function_28d43ffc378eedeb( "weapon_loc_hq3" );
        level.camera_loadout_showcase.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
        level.camera_loadout_showcase.spotlimit = 8;
        level.camera_loadout_showcase.update_char_loc = var_12fb015cacc91c9e;
    }
    
    level.camera_loadout_showcase_overview = spawnstruct();
    level.camera_loadout_showcase_overview.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_overview" );
    
    if ( level.camera_loadout_showcase_overview.basecam )
    {
        level.camera_loadout_showcase_overview.basecam.depthoffieldvalues = [ 10, 35 ];
        level.camera_loadout_showcase_overview.myfov = 50;
        level.camera_loadout_showcase_overview.update_char_loc = var_12fb015cacc91c9e;
        level.camera_loadout_showcase_overview.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
        level.camera_loadout_showcase_overview.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
        level.camera_loadout_showcase_overview.weapon_locs[ 2 ] = function_28d43ffc378eedeb( "weapon_loc_hq3" );
        level.camera_loadout_showcase_overview.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
        level.camera_loadout_showcase_overview.spotlimit = 8;
    }
    
    level.camera_loadout_showcase_preview = spawnstruct();
    level.camera_loadout_showcase_preview.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview" );
    level.camera_loadout_showcase_preview.basecam.depthoffieldvalues = [ 8, 42 ];
    level.camera_loadout_showcase_preview.myfov = 50;
    level.camera_loadout_showcase_preview.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview.spotlimit = 8;
    level.camera_loadout_showcase_preview_large = spawnstruct();
    level.camera_loadout_showcase_preview_large.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large" );
    level.camera_loadout_showcase_preview_large.basecam.depthoffieldvalues = [ 4, 38 ];
    level.camera_loadout_showcase_preview_large.myfov = 50;
    level.camera_loadout_showcase_preview_large.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large.spotlimit = 8;
    level.camera_loadout_showcase_preview_small = spawnstruct();
    level.camera_loadout_showcase_preview_small.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_secondary" );
    level.camera_loadout_showcase_preview_small.basecam.depthoffieldvalues = [ 3.5, 28 ];
    level.camera_loadout_showcase_preview_small.myfov = 50;
    level.camera_loadout_showcase_preview_small.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small.spotlimit = 8;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xbd658075, Offset: 0x17597
// Size: 0x56fa
function private create_camera_position_list()
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    if ( level.var_88cd03d85d960fe0 )
    {
        level.camera_walkable_space = spawnstruct();
        level.camera_walkable_space.basecam = spawn( "script_origin", level.playerspawnent.origin + ( 0, 0, 72 ) );
        level.camera_walkable_space.basecam.depthoffieldvalues = [ 2, 256 ];
        level.camera_walkable_space.basecam.targetname = "camera_walkable_space";
        level.camera_walkable_space.myfov = 65;
        function_4a5f5f2416798696();
        return;
    }
    
    function_4a5f5f2416798696();
    level.camera_loadout_showcase_preview_watch = spawnstruct();
    level.camera_loadout_showcase_preview_watch.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_watch" );
    level.camera_loadout_showcase_preview_watch.basecam.depthoffieldvalues = [ 20, 16 ];
    level.camera_loadout_showcase_preview_watch.myfov = 50;
    level.camera_loadout_showcase_preview_watch.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_watch.spotlimit = 8;
    level.camera_loadout_showcase_armory = spawnstruct();
    level.camera_loadout_showcase_armory.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_armory" );
    level.camera_loadout_showcase_armory.basecam.depthoffieldvalues = [ 7, 67 ];
    level.camera_loadout_showcase_armory.myfov = 50;
    level.camera_loadout_showcase_armory.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_armory.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_armory.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_armory.spotlimit = 8;
    level.camera_loadout_showcase_p = spawnstruct();
    level.camera_loadout_showcase_p.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_p" );
    level.camera_loadout_showcase_p.basecam.depthoffieldvalues = [ 3, 33 ];
    level.camera_loadout_showcase_p.myfov = 50;
    level.camera_loadout_showcase_p.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_p.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_p.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_p.spotlimit = 8;
    level.camera_loadout_showcase_p_large = spawnstruct();
    level.camera_loadout_showcase_p_large.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_p_large" );
    level.camera_loadout_showcase_p_large.basecam.depthoffieldvalues = [ 5, 42 ];
    level.camera_loadout_showcase_p_large.myfov = 50;
    level.camera_loadout_showcase_p_large.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_p_large.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_p_large.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_p_large.spotlimit = 8;
    level.camera_loadout_showcase_s = spawnstruct();
    level.camera_loadout_showcase_s.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_s" );
    level.camera_loadout_showcase_s.basecam.depthoffieldvalues = [ 3.5, 28 ];
    level.camera_loadout_showcase_s.myfov = 50;
    level.camera_loadout_showcase_s.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_s.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_s.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_s.spotlimit = 8;
    level.camera_loadout_showcase_o = spawnstruct();
    level.camera_loadout_showcase_o.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_o_large" );
    level.camera_loadout_showcase_o.basecam.depthoffieldvalues = [ 3, 33 ];
    level.camera_loadout_showcase_o.myfov = 50;
    level.camera_loadout_showcase_o.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_o.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_o.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_o.spotlimit = 8;
    level.camera_loadout_showcase_o_large = spawnstruct();
    level.camera_loadout_showcase_o_large.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_o_large" );
    level.camera_loadout_showcase_o_large.basecam.depthoffieldvalues = [ 5, 42 ];
    level.camera_loadout_showcase_o_large.myfov = 50;
    level.camera_loadout_showcase_o_large.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_o_large.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_o_large.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_o_large.spotlimit = 8;
    level.camera_loadout_showcase_l = spawnstruct();
    level.camera_loadout_showcase_l.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_l" );
    level.camera_loadout_showcase_l.basecam.depthoffieldvalues = [ 4.5, 18 ];
    level.camera_loadout_showcase_l.myfov = 50;
    level.camera_loadout_showcase_l.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_l.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_l.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_l.spotlimit = 8;
    level.camera_loadout_showcase_t = spawnstruct();
    level.camera_loadout_showcase_t.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_t" );
    level.camera_loadout_showcase_t.basecam.depthoffieldvalues = [ 3, 20.3 ];
    level.camera_loadout_showcase_t.myfov = 50;
    level.camera_loadout_showcase_t.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_t.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_t.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_t.spotlimit = 8;
    level.var_9fc572fb1e83f719 = spawnstruct();
    level.var_9fc572fb1e83f719.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_field_upgrade" );
    level.var_9fc572fb1e83f719.basecam.depthoffieldvalues = [ 2, 14 ];
    level.var_9fc572fb1e83f719.myfov = 50;
    level.var_9fc572fb1e83f719.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.var_9fc572fb1e83f719.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.var_9fc572fb1e83f719.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.var_9fc572fb1e83f719.spotlimit = 8;
    
    if ( !ismgl )
    {
        level.var_91fb6c633cf72815 = spawnstruct();
        level.var_91fb6c633cf72815.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_loadout_field_upgrade_01" );
        level.var_91fb6c633cf72815.basecam.depthoffieldvalues = [ 3, 40.5 ];
        level.var_91fb6c633cf72815.myfov = 50;
        level.var_91fb6c633cf72815.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
        level.var_91fb6c633cf72815.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
        level.var_91fb6c633cf72815.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
        level.var_91fb6c633cf72815.spotlimit = 8;
        level.var_91fb69633cf7217c = spawnstruct();
        level.var_91fb69633cf7217c.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_loadout_field_upgrade_02" );
        level.var_91fb69633cf7217c.basecam.depthoffieldvalues = [ 6, 35 ];
        level.var_91fb69633cf7217c.myfov = 50;
        level.var_91fb69633cf7217c.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
        level.var_91fb69633cf7217c.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
        level.var_91fb69633cf7217c.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
        level.var_91fb69633cf7217c.spotlimit = 8;
    }
    
    level.camera_loadout_showcase_perks = spawnstruct();
    level.camera_loadout_showcase_perks.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_perks" );
    level.camera_loadout_showcase_perks.basecam.depthoffieldvalues = [ 6, 45 ];
    level.camera_loadout_showcase_perks.myfov = 50;
    level.camera_loadout_showcase_perks.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_perks.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_perks.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_perks.spotlimit = 8;
    level.camera_loadout_showcase_x = spawnstruct();
    level.camera_loadout_showcase_x.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_x" );
    level.camera_loadout_showcase_x.basecam.depthoffieldvalues = [ 5, 20 ];
    level.camera_loadout_showcase_x.myfov = 50;
    level.camera_loadout_showcase_x.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_x.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_x.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_x.spotlimit = 8;
    level.camera_loadout_showcase_y = spawnstruct();
    level.camera_loadout_showcase_y.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_y" );
    level.camera_loadout_showcase_y.basecam.depthoffieldvalues = [ 4, 21 ];
    level.camera_loadout_showcase_y.myfov = 50;
    level.camera_loadout_showcase_y.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_y.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_y.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_y.spotlimit = 8;
    level.camera_loadout_showcase_z = spawnstruct();
    level.camera_loadout_showcase_z.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_z" );
    level.camera_loadout_showcase_z.basecam.depthoffieldvalues = [ 6, 20 ];
    level.camera_loadout_showcase_z.myfov = 50;
    level.camera_loadout_showcase_z.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_z.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_z.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_z.spotlimit = 8;
    level.camera_loadout_showcase_specialist = spawnstruct();
    level.camera_loadout_showcase_specialist.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_specialist" );
    level.camera_loadout_showcase_specialist.basecam.depthoffieldvalues = [ 22, 16 ];
    level.camera_loadout_showcase_specialist.myfov = 50;
    level.camera_loadout_showcase_specialist.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_specialist.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_specialist.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_specialist.spotlimit = 8;
    level.camera_loadout_showcase_watch = spawnstruct();
    level.camera_loadout_showcase_watch.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_alt_watch" );
    level.camera_loadout_showcase_watch.basecam.depthoffieldvalues = [ 22, 8 ];
    level.camera_loadout_showcase_watch.myfov = 50;
    level.camera_loadout_showcase_watch.weapon_locs[ 0 ] = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    level.camera_loadout_showcase_watch.weapon_locs[ 1 ] = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    level.camera_loadout_showcase_watch.weapon_locs[ 3 ] = function_28d43ffc378eedeb( "weapon_loc_watch" );
    level.camera_loadout_showcase_watch.spotlimit = 8;
    level.camera_loadout_showcase_preview_riot = spawnstruct();
    level.camera_loadout_showcase_preview_riot.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_riot" );
    level.camera_loadout_showcase_preview_riot.basecam.depthoffieldvalues = [ 16, 152 ];
    level.camera_loadout_showcase_preview_riot.myfov = 80;
    level.camera_loadout_showcase_preview_riot.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_riot.spotlimit = 8;
    level.var_338dfe185b350354 = spawnstruct();
    level.var_338dfe185b350354.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview" );
    level.var_338dfe185b350354.basecam.depthoffieldvalues = [ 22, 56 ];
    level.var_338dfe185b350354.myfov = 80;
    level.var_338dfe185b350354.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.var_338dfe185b350354.spotlimit = 8;
    level.var_189d78a7903a9a80 = spawnstruct();
    level.var_189d78a7903a9a80.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_large" );
    level.var_189d78a7903a9a80.basecam.depthoffieldvalues = [ 22, 64 ];
    level.var_189d78a7903a9a80.myfov = 80;
    level.var_189d78a7903a9a80.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.var_189d78a7903a9a80.spotlimit = 8;
    level.var_5f1b4955dce209a8 = spawnstruct();
    level.var_5f1b4955dce209a8.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_secondary" );
    level.var_5f1b4955dce209a8.basecam.depthoffieldvalues = [ 22, 36 ];
    level.var_5f1b4955dce209a8.myfov = 80;
    level.var_5f1b4955dce209a8.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.var_5f1b4955dce209a8.spotlimit = 8;
    level.var_7f88ff3202fe9db = spawnstruct();
    level.var_7f88ff3202fe9db.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_riot" );
    level.var_7f88ff3202fe9db.basecam.depthoffieldvalues = [ 16, 152 ];
    level.var_7f88ff3202fe9db.myfov = 80;
    level.var_7f88ff3202fe9db.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.var_7f88ff3202fe9db.spotlimit = 8;
    
    if ( !ismgl && !level.var_3d353e3274a23c81 )
    {
        level.var_799ac2be8984ef6d = spawnstruct();
        level.var_799ac2be8984ef6d.basecam = function_28d43ffc378eedeb( "camera_mp_bundle_preview" );
        level.var_799ac2be8984ef6d.basecam.depthoffieldvalues = [ 22, 56 ];
        level.var_799ac2be8984ef6d.myfov = 36;
        level.var_799ac2be8984ef6d.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_bundle_preview" );
        level.var_799ac2be8984ef6d.spotlimit = 8;
        level.var_a0cab3c394a9f731 = spawnstruct();
        level.var_a0cab3c394a9f731.basecam = function_28d43ffc378eedeb( "camera_mp_bundle_preview_large" );
        level.var_a0cab3c394a9f731.basecam.depthoffieldvalues = [ 22, 64 ];
        level.var_a0cab3c394a9f731.myfov = 36;
        level.var_a0cab3c394a9f731.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_bundle_preview" );
        level.var_a0cab3c394a9f731.spotlimit = 8;
        level.var_4f8ccb757ba677d5 = spawnstruct();
        level.var_4f8ccb757ba677d5.basecam = function_28d43ffc378eedeb( "camera_mp_bundle_preview_secondary" );
        level.var_4f8ccb757ba677d5.basecam.depthoffieldvalues = [ 22, 36 ];
        level.var_4f8ccb757ba677d5.myfov = 36;
        level.var_4f8ccb757ba677d5.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_bundle_preview" );
        level.var_4f8ccb757ba677d5.spotlimit = 8;
        level.var_3631e1a2f608396c = spawnstruct();
        level.var_3631e1a2f608396c.basecam = function_28d43ffc378eedeb( "camera_mp_bundle_preview_riot" );
        level.var_3631e1a2f608396c.basecam.depthoffieldvalues = [ 22, 152 ];
        level.var_3631e1a2f608396c.myfov = 36;
        level.var_3631e1a2f608396c.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_bundle_preview" );
        level.var_3631e1a2f608396c.spotlimit = 8;
    }
    else
    {
        level.var_6adcae182bd719a7 = spawnstruct();
        level.var_6adcae182bd719a7.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview" );
        level.var_6adcae182bd719a7.basecam.depthoffieldvalues = [ 22, 56 ];
        level.var_6adcae182bd719a7.myfov = 36;
        level.var_6adcae182bd719a7.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_6adcae182bd719a7.spotlimit = 8;
        level.var_bebcc67049d3b6f7 = spawnstruct();
        level.var_bebcc67049d3b6f7.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_large" );
        level.var_bebcc67049d3b6f7.basecam.depthoffieldvalues = [ 22, 64 ];
        level.var_bebcc67049d3b6f7.myfov = 36;
        level.var_bebcc67049d3b6f7.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_bebcc67049d3b6f7.spotlimit = 8;
        level.var_df6d55bd563ae15f = spawnstruct();
        level.var_df6d55bd563ae15f.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_secondary" );
        level.var_df6d55bd563ae15f.basecam.depthoffieldvalues = [ 22, 36 ];
        level.var_df6d55bd563ae15f.myfov = 36;
        level.var_df6d55bd563ae15f.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_df6d55bd563ae15f.spotlimit = 8;
        level.var_90277a8d8fbafd03 = spawnstruct();
        level.var_90277a8d8fbafd03.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview" );
        level.var_90277a8d8fbafd03.basecam.depthoffieldvalues = [ 22, 56 ];
        level.var_90277a8d8fbafd03.myfov = 36;
        level.var_90277a8d8fbafd03.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_90277a8d8fbafd03.spotlimit = 8;
        level.var_81e8a4c928f3a923 = spawnstruct();
        level.var_81e8a4c928f3a923.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_large" );
        level.var_81e8a4c928f3a923.basecam.depthoffieldvalues = [ 22, 64 ];
        level.var_81e8a4c928f3a923.myfov = 36;
        level.var_81e8a4c928f3a923.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_81e8a4c928f3a923.spotlimit = 8;
        level.var_9b12b18630bc671b = spawnstruct();
        level.var_9b12b18630bc671b.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_secondary" );
        level.var_9b12b18630bc671b.basecam.depthoffieldvalues = [ 22, 36 ];
        level.var_9b12b18630bc671b.myfov = 36;
        level.var_9b12b18630bc671b.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_9b12b18630bc671b.spotlimit = 8;
        level.var_fc6c44693316787a = spawnstruct();
        level.var_fc6c44693316787a.basecam = function_28d43ffc378eedeb( "camera_mp_weapon_preview_riot" );
        level.var_fc6c44693316787a.basecam.depthoffieldvalues = [ 22, 64 ];
        level.var_fc6c44693316787a.myfov = 36;
        level.var_fc6c44693316787a.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
        level.var_fc6c44693316787a.spotlimit = 8;
    }
    
    level.camera_loadout_showcase_preview_barrel = spawnstruct();
    level.camera_loadout_showcase_preview_barrel.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_barrel" );
    level.camera_loadout_showcase_preview_barrel.basecam.depthoffieldvalues = [ 8, 34 ];
    level.camera_loadout_showcase_preview_barrel.myfov = 36;
    level.camera_loadout_showcase_preview_barrel.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_barrel.spotlimit = 8;
    level.camera_loadout_showcase_preview_barrel_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_barrel_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_barrel_alt1" );
    level.camera_loadout_showcase_preview_barrel_alt1.basecam.depthoffieldvalues = [ 8, 48 ];
    level.camera_loadout_showcase_preview_barrel_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_barrel_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_barrel_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_barrel_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_barrel_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_barrel_alt2" );
    level.camera_loadout_showcase_preview_barrel_alt2.basecam.depthoffieldvalues = [ 8, 54 ];
    level.camera_loadout_showcase_preview_barrel_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_barrel_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_barrel_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_charm = spawnstruct();
    level.camera_loadout_showcase_preview_charm.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_charm" );
    level.camera_loadout_showcase_preview_charm.basecam.depthoffieldvalues = [ 21, 16 ];
    level.camera_loadout_showcase_preview_charm.myfov = 36;
    level.camera_loadout_showcase_preview_charm.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_charm.spotlimit = 8;
    level.camera_loadout_showcase_preview_charm_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_charm_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_charm_alt1" );
    level.camera_loadout_showcase_preview_charm_alt1.basecam.depthoffieldvalues = [ 21, 16 ];
    level.camera_loadout_showcase_preview_charm_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_charm_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_charm_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_charm_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_charm_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_charm_alt2" );
    level.camera_loadout_showcase_preview_charm_alt2.basecam.depthoffieldvalues = [ 21, 16 ];
    level.camera_loadout_showcase_preview_charm_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_charm_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_charm_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_charm_alt3 = spawnstruct();
    level.camera_loadout_showcase_preview_charm_alt3.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_charm_alt3" );
    level.camera_loadout_showcase_preview_charm_alt3.basecam.depthoffieldvalues = [ 21, 16 ];
    level.camera_loadout_showcase_preview_charm_alt3.myfov = 36;
    level.camera_loadout_showcase_preview_charm_alt3.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_charm_alt3.spotlimit = 8;
    level.camera_loadout_showcase_preview_charm_alt4 = spawnstruct();
    level.camera_loadout_showcase_preview_charm_alt4.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_charm_alt4" );
    level.camera_loadout_showcase_preview_charm_alt4.basecam.depthoffieldvalues = [ 21, 18 ];
    level.camera_loadout_showcase_preview_charm_alt4.myfov = 36;
    level.camera_loadout_showcase_preview_charm_alt4.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_charm_alt4.spotlimit = 8;
    level.camera_loadout_showcase_preview_laser = spawnstruct();
    level.camera_loadout_showcase_preview_laser.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_laser" );
    level.camera_loadout_showcase_preview_laser.basecam.depthoffieldvalues = [ 8, 25 ];
    level.camera_loadout_showcase_preview_laser.myfov = 36;
    level.camera_loadout_showcase_preview_laser.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_laser.spotlimit = 8;
    level.camera_loadout_showcase_preview_laser_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_laser_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_laser_alt1" );
    level.camera_loadout_showcase_preview_laser_alt1.basecam.depthoffieldvalues = [ 8, 25 ];
    level.camera_loadout_showcase_preview_laser_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_laser_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_laser_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_laser_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_laser_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_laser_alt2" );
    level.camera_loadout_showcase_preview_laser_alt2.basecam.depthoffieldvalues = [ 8, 25 ];
    level.camera_loadout_showcase_preview_laser_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_laser_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_laser_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_magazine = spawnstruct();
    level.camera_loadout_showcase_preview_magazine.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_magazine" );
    level.camera_loadout_showcase_preview_magazine.basecam.depthoffieldvalues = [ 8, 24 ];
    level.camera_loadout_showcase_preview_magazine.myfov = 36;
    level.camera_loadout_showcase_preview_magazine.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_magazine.spotlimit = 8;
    level.camera_loadout_showcase_preview_magazine_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_magazine_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_magazine_alt1" );
    level.camera_loadout_showcase_preview_magazine_alt1.basecam.depthoffieldvalues = [ 8, 24 ];
    level.camera_loadout_showcase_preview_magazine_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_magazine_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_magazine_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_magazine_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_magazine_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_magazine_alt2" );
    level.camera_loadout_showcase_preview_magazine_alt2.basecam.depthoffieldvalues = [ 8, 24 ];
    level.camera_loadout_showcase_preview_magazine_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_magazine_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_magazine_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_muzzle = spawnstruct();
    level.camera_loadout_showcase_preview_muzzle.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_muzzle" );
    level.camera_loadout_showcase_preview_muzzle.basecam.depthoffieldvalues = [ 12, 30 ];
    level.camera_loadout_showcase_preview_muzzle.myfov = 36;
    level.camera_loadout_showcase_preview_muzzle.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_muzzle.spotlimit = 8;
    level.camera_loadout_showcase_preview_muzzle_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_muzzle_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_muzzle_alt1" );
    level.camera_loadout_showcase_preview_muzzle_alt1.basecam.depthoffieldvalues = [ 18, 32 ];
    level.camera_loadout_showcase_preview_muzzle_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_muzzle_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_muzzle_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_optic = spawnstruct();
    level.camera_loadout_showcase_preview_optic.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_optic" );
    level.camera_loadout_showcase_preview_optic.basecam.depthoffieldvalues = [ 21.5, 17 ];
    level.camera_loadout_showcase_preview_optic.myfov = 36;
    level.camera_loadout_showcase_preview_optic.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_optic.spotlimit = 8;
    level.camera_loadout_showcase_preview_optic_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_optic_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_optic_alt1" );
    level.camera_loadout_showcase_preview_optic_alt1.basecam.depthoffieldvalues = [ 21.5, 17 ];
    level.camera_loadout_showcase_preview_optic_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_optic_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_optic_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_reargrip = spawnstruct();
    level.camera_loadout_showcase_preview_reargrip.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_reargrip" );
    level.camera_loadout_showcase_preview_reargrip.basecam.depthoffieldvalues = [ 8, 20 ];
    level.camera_loadout_showcase_preview_reargrip.myfov = 36;
    level.camera_loadout_showcase_preview_reargrip.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_reargrip.spotlimit = 8;
    level.camera_loadout_showcase_preview_reargrip_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_reargrip_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_reargrip_alt1" );
    level.camera_loadout_showcase_preview_reargrip_alt1.basecam.depthoffieldvalues = [ 8, 20 ];
    level.camera_loadout_showcase_preview_reargrip_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_reargrip_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_reargrip_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_reargrip_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_reargrip_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_reargrip_alt2" );
    level.camera_loadout_showcase_preview_reargrip_alt2.basecam.depthoffieldvalues = [ 12, 22 ];
    level.camera_loadout_showcase_preview_reargrip_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_reargrip_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_reargrip_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_sticker = spawnstruct();
    level.camera_loadout_showcase_preview_sticker.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_sticker" );
    level.camera_loadout_showcase_preview_sticker.basecam.depthoffieldvalues = [ 20, 32 ];
    level.camera_loadout_showcase_preview_sticker.myfov = 36;
    level.camera_loadout_showcase_preview_sticker.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_sticker.spotlimit = 8;
    level.camera_loadout_showcase_preview_sticker_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_sticker_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_sticker_alt1" );
    level.camera_loadout_showcase_preview_sticker_alt1.basecam.depthoffieldvalues = [ 20, 32 ];
    level.camera_loadout_showcase_preview_sticker_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_sticker_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_sticker_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_sticker_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_sticker_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_sticker_alt2" );
    level.camera_loadout_showcase_preview_sticker_alt2.basecam.depthoffieldvalues = [ 20, 34 ];
    level.camera_loadout_showcase_preview_sticker_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_sticker_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_sticker_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_sticker_alt3 = spawnstruct();
    level.camera_loadout_showcase_preview_sticker_alt3.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_sticker_alt3" );
    level.camera_loadout_showcase_preview_sticker_alt3.basecam.depthoffieldvalues = [ 20, 34 ];
    level.camera_loadout_showcase_preview_sticker_alt3.myfov = 36;
    level.camera_loadout_showcase_preview_sticker_alt3.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_sticker_alt3.spotlimit = 8;
    level.camera_loadout_showcase_preview_sticker_alt4 = spawnstruct();
    level.camera_loadout_showcase_preview_sticker_alt4.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_sticker_alt4" );
    level.camera_loadout_showcase_preview_sticker_alt4.basecam.depthoffieldvalues = [ 20, 34 ];
    level.camera_loadout_showcase_preview_sticker_alt4.myfov = 36;
    level.camera_loadout_showcase_preview_sticker_alt4.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_sticker_alt4.spotlimit = 8;
    level.camera_loadout_showcase_preview_stock = spawnstruct();
    level.camera_loadout_showcase_preview_stock.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_stock" );
    level.camera_loadout_showcase_preview_stock.basecam.depthoffieldvalues = [ 12, 40 ];
    level.camera_loadout_showcase_preview_stock.myfov = 36;
    level.camera_loadout_showcase_preview_stock.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_stock.spotlimit = 8;
    level.camera_loadout_showcase_preview_stock_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_stock_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_stock_alt1" );
    level.camera_loadout_showcase_preview_stock_alt1.basecam.depthoffieldvalues = [ 12, 40 ];
    level.camera_loadout_showcase_preview_stock_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_stock_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_stock_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_stock_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_stock_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_stock_alt2" );
    level.camera_loadout_showcase_preview_stock_alt2.basecam.depthoffieldvalues = [ 16, 43 ];
    level.camera_loadout_showcase_preview_stock_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_stock_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_stock_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_underbarrel = spawnstruct();
    level.camera_loadout_showcase_preview_underbarrel.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_underbarrel" );
    level.camera_loadout_showcase_preview_underbarrel.basecam.depthoffieldvalues = [ 10, 34 ];
    level.camera_loadout_showcase_preview_underbarrel.myfov = 36;
    level.camera_loadout_showcase_preview_underbarrel.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_underbarrel.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_barrel = spawnstruct();
    level.camera_loadout_showcase_preview_small_barrel.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_barrel" );
    level.camera_loadout_showcase_preview_small_barrel.basecam.depthoffieldvalues = [ 12, 22.5 ];
    level.camera_loadout_showcase_preview_small_barrel.myfov = 36;
    level.camera_loadout_showcase_preview_small_barrel.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_barrel.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_charm = spawnstruct();
    level.camera_loadout_showcase_preview_small_charm.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_charm" );
    level.camera_loadout_showcase_preview_small_charm.basecam.depthoffieldvalues = [ 21, 15 ];
    level.camera_loadout_showcase_preview_small_charm.myfov = 36;
    level.camera_loadout_showcase_preview_small_charm.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_small_charm.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_laser = spawnstruct();
    level.camera_loadout_showcase_preview_small_laser.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_laser" );
    level.camera_loadout_showcase_preview_small_laser.basecam.depthoffieldvalues = [ 12, 19 ];
    level.camera_loadout_showcase_preview_small_laser.myfov = 36;
    level.camera_loadout_showcase_preview_small_laser.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_laser.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_magazine = spawnstruct();
    level.camera_loadout_showcase_preview_small_magazine.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_magazine" );
    level.camera_loadout_showcase_preview_small_magazine.basecam.depthoffieldvalues = [ 12, 20 ];
    level.camera_loadout_showcase_preview_small_magazine.myfov = 36;
    level.camera_loadout_showcase_preview_small_magazine.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_magazine.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_magazine_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_small_magazine_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_magazine_alt1" );
    level.camera_loadout_showcase_preview_small_magazine_alt1.basecam.depthoffieldvalues = [ 12, 20 ];
    level.camera_loadout_showcase_preview_small_magazine_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_small_magazine_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_magazine_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_muzzle = spawnstruct();
    level.camera_loadout_showcase_preview_small_muzzle.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_muzzle" );
    level.camera_loadout_showcase_preview_small_muzzle.basecam.depthoffieldvalues = [ 16, 25 ];
    level.camera_loadout_showcase_preview_small_muzzle.myfov = 36;
    level.camera_loadout_showcase_preview_small_muzzle.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_muzzle.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_optic = spawnstruct();
    level.camera_loadout_showcase_preview_small_optic.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_optic" );
    level.camera_loadout_showcase_preview_small_optic.basecam.depthoffieldvalues = [ 20, 15 ];
    level.camera_loadout_showcase_preview_small_optic.myfov = 36;
    level.camera_loadout_showcase_preview_small_optic.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_optic.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_reargrip = spawnstruct();
    level.camera_loadout_showcase_preview_small_reargrip.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_reargrip" );
    level.camera_loadout_showcase_preview_small_reargrip.basecam.depthoffieldvalues = [ 12, 20 ];
    level.camera_loadout_showcase_preview_small_reargrip.myfov = 36;
    level.camera_loadout_showcase_preview_small_reargrip.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_reargrip.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_sticker = spawnstruct();
    level.camera_loadout_showcase_preview_small_sticker.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_sticker" );
    level.camera_loadout_showcase_preview_small_sticker.basecam.depthoffieldvalues = [ 16, 22 ];
    level.camera_loadout_showcase_preview_small_sticker.myfov = 36;
    level.camera_loadout_showcase_preview_small_sticker.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_small_sticker.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_stock = spawnstruct();
    level.camera_loadout_showcase_preview_small_stock.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_stock" );
    level.camera_loadout_showcase_preview_small_stock.basecam.depthoffieldvalues = [ 16, 36 ];
    level.camera_loadout_showcase_preview_small_stock.myfov = 36;
    level.camera_loadout_showcase_preview_small_stock.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_stock.spotlimit = 8;
    level.camera_loadout_showcase_preview_small_trigger = spawnstruct();
    level.camera_loadout_showcase_preview_small_trigger.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_small_trigger" );
    level.camera_loadout_showcase_preview_small_trigger.basecam.depthoffieldvalues = [ 21, 12 ];
    level.camera_loadout_showcase_preview_small_trigger.myfov = 36;
    level.camera_loadout_showcase_preview_small_trigger.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_small_trigger.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_barrel = spawnstruct();
    level.camera_loadout_showcase_preview_large_barrel.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_barrel" );
    level.camera_loadout_showcase_preview_large_barrel.basecam.depthoffieldvalues = [ 12, 46 ];
    level.camera_loadout_showcase_preview_large_barrel.myfov = 36;
    level.camera_loadout_showcase_preview_large_barrel.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_barrel.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_charm = spawnstruct();
    level.camera_loadout_showcase_preview_large_charm.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_charm" );
    level.camera_loadout_showcase_preview_large_charm.basecam.depthoffieldvalues = [ 21, 17 ];
    level.camera_loadout_showcase_preview_large_charm.myfov = 36;
    level.camera_loadout_showcase_preview_large_charm.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_charm.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_charm_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_charm_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_charm_alt1" );
    level.camera_loadout_showcase_preview_large_charm_alt1.basecam.depthoffieldvalues = [ 21, 17 ];
    level.camera_loadout_showcase_preview_large_charm_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_charm_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_charm_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_charm_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_large_charm_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_charm_alt2" );
    level.camera_loadout_showcase_preview_large_charm_alt2.basecam.depthoffieldvalues = [ 21, 17 ];
    level.camera_loadout_showcase_preview_large_charm_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_large_charm_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_charm_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_barrel_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_barrel_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_barrel_alt1" );
    level.camera_loadout_showcase_preview_large_barrel_alt1.basecam.depthoffieldvalues = [ 16, 52 ];
    level.camera_loadout_showcase_preview_large_barrel_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_barrel_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_barrel_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_laser = spawnstruct();
    level.camera_loadout_showcase_preview_large_laser.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_laser" );
    level.camera_loadout_showcase_preview_large_laser.basecam.depthoffieldvalues = [ 12, 26 ];
    level.camera_loadout_showcase_preview_large_laser.myfov = 36;
    level.camera_loadout_showcase_preview_large_laser.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_laser.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_magazine = spawnstruct();
    level.camera_loadout_showcase_preview_large_magazine.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_magazine" );
    level.camera_loadout_showcase_preview_large_magazine.basecam.depthoffieldvalues = [ 14, 32 ];
    level.camera_loadout_showcase_preview_large_magazine.myfov = 36;
    level.camera_loadout_showcase_preview_large_magazine.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_magazine.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_magazine_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_magazine_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_magazine_alt1" );
    level.camera_loadout_showcase_preview_large_magazine_alt1.basecam.depthoffieldvalues = [ 14, 32 ];
    level.camera_loadout_showcase_preview_large_magazine_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_magazine_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_magazine_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_magazine_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_large_magazine_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_magazine_alt2" );
    level.camera_loadout_showcase_preview_large_magazine_alt2.basecam.depthoffieldvalues = [ 14, 32 ];
    level.camera_loadout_showcase_preview_large_magazine_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_large_magazine_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_magazine_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_muzzle = spawnstruct();
    level.camera_loadout_showcase_preview_large_muzzle.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_muzzle" );
    level.camera_loadout_showcase_preview_large_muzzle.basecam.depthoffieldvalues = [ 21, 34 ];
    level.camera_loadout_showcase_preview_large_muzzle.myfov = 36;
    level.camera_loadout_showcase_preview_large_muzzle.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_muzzle.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_muzzle_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_muzzle_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_muzzle_alt1" );
    level.camera_loadout_showcase_preview_large_muzzle_alt1.basecam.depthoffieldvalues = [ 21, 32 ];
    level.camera_loadout_showcase_preview_large_muzzle_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_muzzle_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_muzzle_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_optic = spawnstruct();
    level.camera_loadout_showcase_preview_large_optic.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_optic" );
    level.camera_loadout_showcase_preview_large_optic.basecam.depthoffieldvalues = [ 21.5, 25 ];
    level.camera_loadout_showcase_preview_large_optic.myfov = 36;
    level.camera_loadout_showcase_preview_large_optic.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_optic.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_reargrip = spawnstruct();
    level.camera_loadout_showcase_preview_large_reargrip.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_reargrip" );
    level.camera_loadout_showcase_preview_large_reargrip.basecam.depthoffieldvalues = [ 12, 23 ];
    level.camera_loadout_showcase_preview_large_reargrip.myfov = 36;
    level.camera_loadout_showcase_preview_large_reargrip.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_reargrip.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_reargrip_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_reargrip_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_reargrip_alt1" );
    level.camera_loadout_showcase_preview_large_reargrip_alt1.basecam.depthoffieldvalues = [ 12, 21 ];
    level.camera_loadout_showcase_preview_large_reargrip_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_reargrip_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_reargrip_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_sticker = spawnstruct();
    level.camera_loadout_showcase_preview_large_sticker.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_sticker" );
    level.camera_loadout_showcase_preview_large_sticker.basecam.depthoffieldvalues = [ 20, 32 ];
    level.camera_loadout_showcase_preview_large_sticker.myfov = 36;
    level.camera_loadout_showcase_preview_large_sticker.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_sticker.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_sticker_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_sticker_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_sticker_alt1" );
    level.camera_loadout_showcase_preview_large_sticker_alt1.basecam.depthoffieldvalues = [ 20, 35 ];
    level.camera_loadout_showcase_preview_large_sticker_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_sticker_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_sticker_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_sticker_alt2 = spawnstruct();
    level.camera_loadout_showcase_preview_large_sticker_alt2.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_sticker_alt2" );
    level.camera_loadout_showcase_preview_large_sticker_alt2.basecam.depthoffieldvalues = [ 20, 32 ];
    level.camera_loadout_showcase_preview_large_sticker_alt2.myfov = 36;
    level.camera_loadout_showcase_preview_large_sticker_alt2.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_sticker_alt2.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_sticker_alt3 = spawnstruct();
    level.camera_loadout_showcase_preview_large_sticker_alt3.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_sticker_alt3" );
    level.camera_loadout_showcase_preview_large_sticker_alt3.basecam.depthoffieldvalues = [ 20, 35 ];
    level.camera_loadout_showcase_preview_large_sticker_alt3.myfov = 36;
    level.camera_loadout_showcase_preview_large_sticker_alt3.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_weapon_preview" );
    level.camera_loadout_showcase_preview_large_sticker_alt3.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_stock = spawnstruct();
    level.camera_loadout_showcase_preview_large_stock.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_stock" );
    level.camera_loadout_showcase_preview_large_stock.basecam.depthoffieldvalues = [ 16, 43 ];
    level.camera_loadout_showcase_preview_large_stock.myfov = 36;
    level.camera_loadout_showcase_preview_large_stock.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_stock.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_stock_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_stock_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_stock_alt1" );
    level.camera_loadout_showcase_preview_large_stock_alt1.basecam.depthoffieldvalues = [ 16, 43 ];
    level.camera_loadout_showcase_preview_large_stock_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_stock_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_stock_alt1.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_underbarrel = spawnstruct();
    level.camera_loadout_showcase_preview_large_underbarrel.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_underbarrel" );
    level.camera_loadout_showcase_preview_large_underbarrel.basecam.depthoffieldvalues = [ 20, 35 ];
    level.camera_loadout_showcase_preview_large_underbarrel.myfov = 36;
    level.camera_loadout_showcase_preview_large_underbarrel.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_underbarrel.spotlimit = 8;
    level.camera_loadout_showcase_preview_large_underbarrel_alt1 = spawnstruct();
    level.camera_loadout_showcase_preview_large_underbarrel_alt1.basecam = function_28d43ffc378eedeb( "camera_mp_gunsmith_preview_large_underbarrel_alt1" );
    level.camera_loadout_showcase_preview_large_underbarrel_alt1.basecam.depthoffieldvalues = [ 20, 36 ];
    level.camera_loadout_showcase_preview_large_underbarrel_alt1.myfov = 36;
    level.camera_loadout_showcase_preview_large_underbarrel_alt1.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.camera_loadout_showcase_preview_large_underbarrel_alt1.spotlimit = 8;
    var_ed88be54979a06c7 = level.var_3d353e3274a23c81 ? &update_main_menu_char_loc : undefined;
    level.camera_character_tango = spawnstruct();
    level.camera_character_tango.basecam = function_28d43ffc378eedeb( "char_tango" );
    level.camera_character_tango.basecam.depthoffieldvalues = [ 12, 140 ];
    level.camera_character_tango.myfov = 28;
    level.camera_character_tango.update_char_loc = var_ed88be54979a06c7;
    level.camera_character_tango.spotlimit = 8;
    level.camera_character_faction_select_l = spawnstruct();
    level.camera_character_faction_select_l.basecam = function_28d43ffc378eedeb( "char_west_b_detail" );
    level.camera_character_faction_select_l.basecam.depthoffieldvalues = [ 22, 98 ];
    level.camera_character_faction_select_l.myfov = 37;
    level.camera_character_faction_select_l.update_char_loc = &update_main_menu_char_loc;
    level.camera_character_faction_select_l.spotlimit = 8;
    level.camera_character_faction_select_l_detail = spawnstruct();
    level.camera_character_faction_select_l_detail.basecam = function_28d43ffc378eedeb( "char_west_b" );
    level.camera_character_faction_select_l_detail.basecam.depthoffieldvalues = [ 18, 100 ];
    level.camera_character_faction_select_l_detail.myfov = 37;
    level.camera_character_faction_select_l_detail.update_char_loc = &update_main_menu_char_loc;
    level.camera_character_faction_select_l_detail.spotlimit = 8;
    level.camera_character_faction_select_r = spawnstruct();
    level.camera_character_faction_select_r.basecam = function_28d43ffc378eedeb( "char_east_a_detail" );
    level.camera_character_faction_select_r.basecam.depthoffieldvalues = [ 22, 98 ];
    level.camera_character_faction_select_r.myfov = 37;
    level.camera_character_faction_select_r.update_char_loc = &update_main_menu_char_loc;
    level.camera_character_faction_select_r.char_index = 1;
    level.camera_character_faction_select_r.spotlimit = 8;
    level.camera_character_faction_select_r_detail = spawnstruct();
    level.camera_character_faction_select_r_detail.basecam = function_28d43ffc378eedeb( "char_east_a" );
    level.camera_character_faction_select_r_detail.basecam.depthoffieldvalues = [ 18, 100 ];
    level.camera_character_faction_select_r_detail.myfov = 37;
    level.camera_character_faction_select_r_detail.update_char_loc = &update_main_menu_char_loc;
    level.camera_character_faction_select_r_detail.char_index = 1;
    level.camera_character_faction_select_r_detail.spotlimit = 8;
    level.camera_character_preview_select = spawnstruct();
    level.camera_character_preview_select.basecam = function_28d43ffc378eedeb( "char_preview_detail" );
    level.camera_character_preview_select.basecam.depthoffieldvalues = [ 22, 60 ];
    level.camera_character_preview_select.myfov = 37;
    level.camera_character_preview_select.char_loc = function_28d43ffc378eedeb( "charroom_char_preview" );
    level.camera_character_preview_select.spotlimit = 8;
    level.camera_character_preview_select_detail = spawnstruct();
    level.camera_character_preview_select_detail.basecam = function_28d43ffc378eedeb( "char_preview" );
    level.camera_character_preview_select_detail.basecam.depthoffieldvalues = [ 22, 181 ];
    level.camera_character_preview_select_detail.myfov = 37;
    level.camera_character_preview_select_detail.char_loc = function_28d43ffc378eedeb( "charroom_char_preview" );
    level.camera_character_preview_select_detail.spotlimit = 8;
    level.camera_lobby = spawnstruct();
    level.camera_lobby.basecam = function_28d43ffc378eedeb( "char_lobby" );
    level.camera_lobby.basecam.depthoffieldvalues = ismgl ? [ 22, 98 ] : [ 2, 83 ];
    level.camera_lobby.myfov = ismgl ? 37 : 55;
    level.camera_lobby.update_char_loc = &update_lobby_char_loc;
    level.camera_lobby.spotlimit = 8;
    level.camera_lobby_detail = spawnstruct();
    level.camera_lobby_detail.basecam = function_28d43ffc378eedeb( "char_lobby_detail" );
    level.camera_lobby_detail.basecam.depthoffieldvalues = [ 3, 100 ];
    level.camera_lobby_detail.myfov = 36;
    level.camera_lobby_detail.update_char_loc = &update_lobby_char_loc;
    level.camera_lobby_detail.spotlimit = 8;
    level.var_545e67652767893 = spawnstruct();
    level.var_545e67652767893.basecam = function_28d43ffc378eedeb( "char_lobby_br" );
    level.camera_crib_dmz = spawnstruct();
    level.camera_crib_dmz.basecam = function_28d43ffc378eedeb( "camera_crib_dmz" );
    level.camera_crib_dmz.basecam.depthoffieldvalues = [ 3.5, 225 ];
    level.camera_crib_dmz.myfov = 36;
    level.camera_crib_dmz.update_char_loc = &function_74a35d05491a35e;
    level.camera_crib_dmz.spotlimit = 6;
    level.camera_crib_dmz_detail = spawnstruct();
    level.camera_crib_dmz_detail.basecam = function_28d43ffc378eedeb( "camera_crib_dmz_detail" );
    level.camera_crib_dmz_detail.basecam.depthoffieldvalues = [ 3, 100 ];
    level.camera_crib_dmz_detail.myfov = 36;
    level.camera_crib_dmz_detail.update_char_loc = &function_74a35d05491a35e;
    level.camera_crib_dmz_detail.spotlimit = 6;
    level.camera_social = spawnstruct();
    level.camera_social.basecam = function_28d43ffc378eedeb( "char_social" );
    level.camera_social.basecam.depthoffieldvalues = [ 2, 150 ];
    level.camera_social.myfov = 36;
    level.camera_social.update_char_loc = &function_56ec697557e5bcb9;
    level.camera_social.spotlimit = 6;
    level.var_bd9fdc0042f54651 = spawnstruct();
    level.var_bd9fdc0042f54651.basecam = function_28d43ffc378eedeb( "char_social_wide" );
    level.var_bd9fdc0042f54651.basecam.depthoffieldvalues = [ 3, 325 ];
    level.var_bd9fdc0042f54651.myfov = 36;
    level.var_bd9fdc0042f54651.update_char_loc = &function_56ec697557e5bcb9;
    level.var_bd9fdc0042f54651.spotlimit = 6;
    level.var_753f787bb8419e6d = spawnstruct();
    level.var_753f787bb8419e6d.basecam = function_28d43ffc378eedeb( "char_social_alt" );
    level.var_753f787bb8419e6d.basecam.depthoffieldvalues = [ 3, 150 ];
    level.var_753f787bb8419e6d.myfov = 36;
    level.var_753f787bb8419e6d.update_char_loc = &function_56ec697557e5bcb9;
    level.var_753f787bb8419e6d.spotlimit = 6;
    
    if ( !ismgl )
    {
        level.var_27430ca78f382807 = spawnstruct();
        level.var_27430ca78f382807.basecam = function_28d43ffc378eedeb( "char_social_showcase" );
        level.var_27430ca78f382807.basecam.depthoffieldvalues = [ 2, 150 ];
        level.var_27430ca78f382807.myfov = 36;
        level.var_27430ca78f382807.update_char_loc = &function_56ec697557e5bcb9;
        level.var_27430ca78f382807.spotlimit = 3;
    }
    
    level.var_1edba9f9c2490f58 = spawnstruct();
    level.var_1edba9f9c2490f58.basecam = function_28d43ffc378eedeb( "social_showcase_character" );
    level.var_1edba9f9c2490f58.basecam.depthoffieldvalues = [ 10, 100 ];
    level.var_1edba9f9c2490f58.myfov = 36;
    level.var_1edba9f9c2490f58.update_char_loc = &function_56ec697557e5bcb9;
    level.var_1edba9f9c2490f58.spotlimit = 8;
    level.var_ddfac298df244b5c = spawnstruct();
    level.var_ddfac298df244b5c.basecam = function_28d43ffc378eedeb( "social_showcase_weapon" );
    level.var_ddfac298df244b5c.basecam.depthoffieldvalues = [ 10, 80 ];
    level.var_ddfac298df244b5c.myfov = 36;
    level.var_ddfac298df244b5c.update_char_loc = &function_56ec697557e5bcb9;
    level.var_ddfac298df244b5c.spotlimit = 8;
    
    if ( !level.var_3d353e3274a23c81 )
    {
        level.camera_character_tournaments = spawnstruct();
        level.camera_character_tournaments.basecam = function_28d43ffc378eedeb( "char_tournament_overcam" );
        level.camera_character_tournaments.basecam.depthoffieldvalues = [ 22, 256 ];
        level.camera_character_tournaments.myfov = 36;
        level.camera_character_tournaments.update_char_loc = &update_arena_char_loc;
    }
    
    level.var_fe01ffda20f02a93 = spawnstruct();
    level.var_fe01ffda20f02a93.basecam = function_28d43ffc378eedeb( "cam_firing_range" );
    level.var_fe01ffda20f02a93.basecam.depthoffieldvalues = [ 2, 256 ];
    level.var_fe01ffda20f02a93.myfov = 65;
    
    if ( level.var_3d353e3274a23c81 )
    {
        level.camera_walkable_space = spawnstruct();
        level.camera_walkable_space.basecam = function_28d43ffc378eedeb( "crib_cam_01" );
        level.camera_walkable_space.basecam.depthoffieldvalues = [ 2, 256 ];
        level.camera_walkable_space.myfov = 65;
    }
    
    level.var_57de6213f23231ac = spawnstruct();
    level.var_57de6213f23231ac.basecam = function_28d43ffc378eedeb( "cam_bp_character" );
    level.var_6f0e01b35c5dff9a = level.var_57de6213f23231ac.basecam.origin;
    level.var_88fbef8446591798 = level.var_57de6213f23231ac.basecam.angles;
    level.var_57de6213f23231ac.spotlimit = 4;
    
    if ( isdefined( level.var_57de6213f23231ac.basecam ) )
    {
        level.var_57de6213f23231ac.basecam.depthoffieldvalues = [ 20, 170 ];
        level.var_77e5de91420a0d25 = level.var_57de6213f23231ac.basecam.depthoffieldvalues;
        level.var_57de6213f23231ac.myfov = 45;
        level.var_57de6213f23231ac.char_loc = function_28d43ffc378eedeb( "bp_character_figurine_01" );
    }
    
    level.var_3abacfeb6235b358 = spawnstruct();
    level.var_3abacfeb6235b358.basecam = function_28d43ffc378eedeb( "cam_bp_character_detail" );
    level.var_3abacfeb6235b358.spotlimit = 4;
    
    if ( isdefined( level.var_3abacfeb6235b358.basecam ) )
    {
        level.var_3abacfeb6235b358.basecam.depthoffieldvalues = [ 22, 100 ];
        level.var_3abacfeb6235b358.myfov = 35;
        level.var_3abacfeb6235b358.char_loc = function_28d43ffc378eedeb( "bp_character_figurine_01" );
    }
    
    level.var_3f38ce7f2f49b95 = spawnstruct();
    level.var_3f38ce7f2f49b95.basecam = function_28d43ffc378eedeb( "cam_bp_weapon" );
    level.var_f22cbcacfee72421 = level.var_3f38ce7f2f49b95.basecam.origin;
    level.var_27f476ad46fd672f = level.var_3f38ce7f2f49b95.basecam.angles;
    level.var_3f38ce7f2f49b95.spotlimit = 4;
    
    if ( isdefined( level.var_3f38ce7f2f49b95.basecam ) )
    {
        level.var_3f38ce7f2f49b95.basecam.depthoffieldvalues = [ 20, 80 ];
        level.var_e21c474897524f4 = level.var_3f38ce7f2f49b95.basecam.depthoffieldvalues;
        level.var_3f38ce7f2f49b95.myfov = 35;
        level.var_3f38ce7f2f49b95.weapon_locs[ 6 ] = function_28d43ffc378eedeb( "bp_weapon_figurine_01" );
    }
    
    level.var_4635780be563d7b = spawnstruct();
    level.var_4635780be563d7b.basecam = function_28d43ffc378eedeb( "cam_bp_vehicle" );
    level.var_95e42b9350fd91a7 = level.var_4635780be563d7b.basecam.origin;
    level.var_a600b0ee22b74269 = level.var_4635780be563d7b.basecam.angles;
    level.var_4635780be563d7b.spotlimit = 4;
    
    if ( isdefined( level.var_4635780be563d7b.basecam ) )
    {
        level.var_4635780be563d7b.basecam.depthoffieldvalues = [ 20, 150 ];
        level.var_afa5d0831670b6e = level.var_4635780be563d7b.basecam.depthoffieldvalues;
        level.var_4635780be563d7b.myfov = 35;
        level.var_4635780be563d7b.char_loc = function_28d43ffc378eedeb( "bp_vehicle_figurine_01" );
    }
    
    var_b8f1aa65aece8708 = ismgl ? "cam_bp_vehicle_detail" : "cam_bp_items";
    level.var_3f817d1c8dbca9bd = spawnstruct();
    level.var_3f817d1c8dbca9bd.basecam = getent( var_b8f1aa65aece8708, #targetname );
    level.var_2b542c8a7664e769 = level.var_3f817d1c8dbca9bd.basecam.origin;
    level.var_427c4294787e3bf7 = level.var_3f817d1c8dbca9bd.basecam.angles;
    level.var_3f817d1c8dbca9bd.spotlimit = 4;
    
    if ( isdefined( level.var_3f817d1c8dbca9bd.basecam ) )
    {
        level.var_3f817d1c8dbca9bd.basecam.depthoffieldvalues = [ 10, 100 ];
        level.var_b6dd51b4e692769c = level.var_3f817d1c8dbca9bd.basecam.depthoffieldvalues;
        level.var_3f817d1c8dbca9bd.myfov = 45;
        level.var_3f817d1c8dbca9bd.char_loc = function_28d43ffc378eedeb( "bp_vehicle_items" );
    }
    
    level.var_1e446196eb4e97e6 = spawnstruct();
    level.var_1e446196eb4e97e6.basecam = function_28d43ffc378eedeb( "camera_black" );
    level.var_1e446196eb4e97e6.basecam.depthoffieldvalues = [ 2, 256 ];
    level.var_1e446196eb4e97e6.myfov = 45;
    level.var_2a78f2095be6d912 = spawnstruct();
    level.var_2a78f2095be6d912.basecam = function_28d43ffc378eedeb( "camera_black" );
    level.var_2a78f2095be6d912.basecam.depthoffieldvalues = [ 10, 64 ];
    level.var_2a78f2095be6d912.myfov = 50;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x90b5ea9b, Offset: 0x1cc99
// Size: 0x447
function private function_ddaecdd78b18ce8e()
{
    wait 0.25;
    level.lightsall = function_55f1609e123f6a51( "lights" );
    level.var_fb155cce43da8b9b = [];
    level.lightsloadout = [];
    level.lightscharacter = [];
    level.lightsoperator = [];
    level.var_e6722c4d18a2c12b = [];
    level.var_b9466f9953908544 = [];
    level.var_5156c564106cbd70 = [];
    level.var_3e01573f7fd9f305 = [];
    level.var_7c8efdf6dc8362f5 = [];
    level.var_3348476b92fdb9a3 = [];
    level.var_af0293df1c4dc9c9 = [];
    level.var_d56efe3084c2cde4 = [];
    level.lightsstore = [];
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    foreach ( light in level.lightsall )
    {
        if ( isdefined( light.script_noteworthy ) )
        {
            tags = strtok( light.script_noteworthy, "+" );
            
            foreach ( tag in tags )
            {
                switch ( tag )
                {
                    case #"hash_eef52d343c64d74c":
                        level.var_fb155cce43da8b9b[ level.var_fb155cce43da8b9b.size ] = light;
                        break;
                    case #"hash_bb6fa2433bb2f28":
                        level.lightsloadout[ level.lightsloadout.size ] = light;
                        break;
                    case #"hash_cc702aacc4874235":
                        level.lightscharacter[ level.lightscharacter.size ] = light;
                        break;
                    case #"hash_a5cb0d7ce465ba6a":
                        level.lightsoperator[ level.lightsoperator.size ] = light;
                        break;
                    case #"hash_f47accb277c8759e":
                        level.var_e6722c4d18a2c12b[ level.var_e6722c4d18a2c12b.size ] = light;
                        break;
                    case #"hash_ee1e4c865aaf58d9":
                        level.var_b9466f9953908544[ level.var_b9466f9953908544.size ] = light;
                        break;
                    case #"hash_a3579f9cf8f38d21":
                        level.var_5156c564106cbd70[ level.var_5156c564106cbd70.size ] = light;
                        break;
                    case #"hash_eaaaccc406742d4":
                        level.var_3e01573f7fd9f305[ level.var_3e01573f7fd9f305.size ] = light;
                        break;
                    case #"hash_3bd768aaef471cb9":
                        level.var_7c8efdf6dc8362f5[ level.var_7c8efdf6dc8362f5.size ] = light;
                        break;
                    case #"hash_8fee3a513769719e":
                        level.var_3348476b92fdb9a3[ level.var_3348476b92fdb9a3.size ] = light;
                        break;
                    case #"hash_6d79cb16a608f8e2":
                        level.var_af0293df1c4dc9c9[ level.var_af0293df1c4dc9c9.size ] = light;
                        break;
                    case #"hash_6f16240205e44a3a":
                        level.var_d56efe3084c2cde4[ level.var_d56efe3084c2cde4.size ] = light;
                        break;
                    case #"hash_123089890ba86a0e":
                        level.lightsstore[ level.lightsstore.size ] = light;
                        break;
                }
            }
        }
    }
    
    level.var_221796408996e78f = "DUNNO";
    waitframe();
    
    foreach ( light in level.lightsall )
    {
        light.var_a04f31996e6b5246 = light getlightintensity();
    }
    
    function_7c2d9572caa97fd7( "Gunbench" );
}

// Namespace frontendutils
// Params 0
// Checksum 0xa2249e1d, Offset: 0x1d0e8
// Size: 0x8e
function function_b4f9b56c79fe847a()
{
    cards = getentarray( "bakeonly_bouncecards", #targetname );
    
    foreach ( card in cards )
    {
        card hide();
    }
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xbee48aa, Offset: 0x1d17e
// Size: 0xc0
function private function_e2652b74f40fe569( charindex, origin = ( 0, 0, 0 ), angles = ( 0, 0, 0 ) )
{
    if ( !isdefined( level.client_characters[ charindex ] ) )
    {
        level.client_characters[ charindex ] = spawn( "script_character", origin, 0, 0, charindex, "MPClientCharacter" );
    }
    
    level.client_characters[ charindex ].origin = origin;
    level.client_characters[ charindex ].angles = angles;
    level.client_characters[ charindex ].characterindex = charindex;
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xe58fff54, Offset: 0x1d246
// Size: 0xa3
function private spawn_script_weapon( weaponindex, origin = ( 0, 0, 0 ), angles = ( 0, 0, 0 ) )
{
    if ( !isdefined( level.weapons[ weaponindex ] ) )
    {
        level.weapons[ weaponindex ] = spawn( "script_weapon", origin, 0, 0, weaponindex );
    }
    
    level.weapons[ weaponindex ].origin = origin;
    level.weapons[ weaponindex ].angles = angles;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xb3d5d829, Offset: 0x1d2f1
// Size: 0x60b
function private setup_initial_entities()
{
    ismgl = getdvarint( @"mgl", 0 ) > 0;
    
    if ( !level.var_88cd03d85d960fe0 )
    {
        level.client_characters = [];
        
        if ( !isdefined( level.client_characters ) )
        {
            level.client_characters = [];
        }
        
        for ( charindex = 0; charindex < 8 ; charindex++ )
        {
            charloc = undefined;
            index = charindex + 1;
            
            if ( index < 10 )
            {
                charloc = function_28d43ffc378eedeb( "lobby_charslot_0" + index );
            }
            else
            {
                charloc = function_28d43ffc378eedeb( "lobby_charslot_" + index );
            }
            
            function_e2652b74f40fe569( charindex, charloc.origin );
        }
        
        for ( var_2a5740e626ef08b1 = 0; var_2a5740e626ef08b1 < 6 ; var_2a5740e626ef08b1++ )
        {
            index = var_2a5740e626ef08b1 + 1;
            charindex = 8 + var_2a5740e626ef08b1;
            charloc = function_28d43ffc378eedeb( "lobby_charslot_0" + index + "_dog" );
            
            if ( isdefined( charloc ) )
            {
                function_e2652b74f40fe569( charindex, charloc.origin );
            }
        }
        
        var_9c71223253a60ee1 = function_28d43ffc378eedeb( "charroom_char_tango_east" );
        function_e2652b74f40fe569( 14, var_9c71223253a60ee1.origin, var_9c71223253a60ee1.angles );
        var_8c04bce854586fe3 = function_28d43ffc378eedeb( "charroom_char_tango_west" );
        function_e2652b74f40fe569( 15, var_8c04bce854586fe3.origin, var_8c04bce854586fe3.angles );
        var_c8b126744b94fc67 = ( var_9c71223253a60ee1.origin + var_8c04bce854586fe3.origin ) / 2;
        var_5fadabd9c51ece29 = ( var_9c71223253a60ee1.angles + var_8c04bce854586fe3.angles ) / 2;
        function_e2652b74f40fe569( 16, var_c8b126744b94fc67, var_5fadabd9c51ece29 );
        
        if ( level.var_3d353e3274a23c81 )
        {
            charloc = function_28d43ffc378eedeb( "charroom_char_tango_solo" );
            function_e2652b74f40fe569( 18, charloc.origin, charloc.angles );
        }
        else
        {
            charloc = function_28d43ffc378eedeb( "charroom_char_tango_east" );
            function_e2652b74f40fe569( 18, charloc.origin );
        }
        
        charloc = function_28d43ffc378eedeb( "battlepass_align_target_cer" );
        function_e2652b74f40fe569( 19, charloc.origin, charloc.angles );
    }
    
    level.weapons = [];
    weapon_loc = function_28d43ffc378eedeb( "weapon_loc_hq1" );
    spawn_script_weapon( 0, weapon_loc.origin, weapon_loc.angles );
    weapon_loc2 = function_28d43ffc378eedeb( "weapon_loc_hq2" );
    spawn_script_weapon( 1, weapon_loc2.origin, weapon_loc2.angles );
    weapon_loc3 = function_28d43ffc378eedeb( "weapon_loc_hq3" );
    spawn_script_weapon( 2, weapon_loc3.origin, weapon_loc3.angles );
    preview_weapon_loc = function_28d43ffc378eedeb( "weapon_loc_preview" );
    spawn_script_weapon( 6, preview_weapon_loc.origin, preview_weapon_loc.angles );
    weapon_watch = function_28d43ffc378eedeb( "weapon_loc_watch" );
    spawn_script_weapon( 3, weapon_watch.origin, weapon_watch.angles );
    var_928452ee14a6b944 = function_28d43ffc378eedeb( "weapon_loc_preview_battlepass" );
    spawn_script_weapon( 4, var_928452ee14a6b944.origin, var_928452ee14a6b944.angles );
    weapon_store = function_28d43ffc378eedeb( "weapon_loc_preview_battlepass" );
    spawn_script_weapon( 5, weapon_store.origin, weapon_store.angles );
    
    if ( !level.var_88cd03d85d960fe0 )
    {
        level.var_bb92290a220ddeaa = getent( "br_cargoplane_exterior", #targetname );
        level.var_901d015765c1117e = getent( "br_cargoplane_car", #targetname );
        level.var_b1e0e9d9980f8174 = getentarray( "br_cargoplane", #targetname );
        
        if ( isdefined( level.var_bb92290a220ddeaa ) )
        {
            if ( isdefined( level.var_b1e0e9d9980f8174 ) )
            {
                foreach ( item in level.var_b1e0e9d9980f8174 )
                {
                    item linkto( level.var_bb92290a220ddeaa );
                }
            }
            
            level.var_bb92290a220ddeaa.originallocation = level.var_bb92290a220ddeaa.origin;
            level.var_bb92290a220ddeaa.originalangles = level.var_bb92290a220ddeaa.angles;
        }
        
        if ( isdefined( level.var_901d015765c1117e ) )
        {
            level.var_901d015765c1117e.originallocation = level.var_901d015765c1117e.origin;
        }
    }
    
    if ( level.var_88cd03d85d960fe0 )
    {
        function_24387b6af8430fc4();
    }
    
    if ( function_610a2cf441ee44() == "mp_frontend3" )
    {
        thread function_6177ea35e1f80d7e();
    }
    
    if ( level.var_88cd03d85d960fe0 )
    {
        frontend_camera_setup( level.camera_walkable_space.basecam.origin, level.camera_walkable_space.basecam.angles );
    }
    else
    {
        frontend_camera_setup( level.camera_lobby_detail.basecam.origin, level.camera_lobby_detail.basecam.angles );
    }
    
    thread function_ddaecdd78b18ce8e();
    thread function_b4f9b56c79fe847a();
}

#using_animtree( "client_character" );

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xe59656d7, Offset: 0x1d904
// Size: 0x2a8
function private function_6177ea35e1f80d7e()
{
    level endon( "game_ended" );
    
    while ( !isdefined( level.struct_class_names ) )
    {
        waitframe();
    }
    
    if ( level.var_4c31323596bf3cdf )
    {
        var_c132c0dd46cfac09 = utility::getstruct( "fe_mil_base_anim_01", "targetname" );
        level.vehicles[ 0 ] = spawn( "script_model", var_c132c0dd46cfac09.origin );
        level.vehicles[ 0 ] setmodel( "veh9_mil_lnd_jltv_lobby" );
        level.vehicles[ 0 ].animname = "vehicle";
        level.vehicles[ 0 ].var_ece8fc427845ef06 = "jltv";
        level.vehicles[ 0 ] useanimtree( #animtree );
        level.vehicles[ 1 ] = spawn( "script_model", var_c132c0dd46cfac09.origin );
        level.vehicles[ 1 ] setmodel( "veh9_mil_air_heli_medium_lobby" );
        level.vehicles[ 1 ].animname = "vehicle";
        level.vehicles[ 1 ].var_ece8fc427845ef06 = "small_bird";
        level.vehicles[ 1 ] useanimtree( #animtree );
    }
    
    if ( level.var_ca17ffe77c84226e )
    {
        var_c132bfdd46cfa9d6 = utility::getstruct( "fe_mil_base_anim_02", "targetname" );
        level.vehicles[ 2 ] = spawn( "script_model", ( -7161.34, 3702.8, 117.042 ) );
        level.vehicles[ 2 ] setmodel( "veh9_mil_air_heli_blima_lobby" );
        level.vehicles[ 2 ].animname = "vehicle";
        level.vehicles[ 2 ].var_ece8fc427845ef06 = "medium_bird";
        level.vehicles[ 2 ] useanimtree( #animtree );
        function_28148d715ddbd451( level.vehicles[ 2 ] );
    }
    
    if ( level.cargoenabled )
    {
        var_c132bedd46cfa7a3 = utility::getstruct( "fe_mil_base_anim_03", "targetname" );
        level.vehicles[ 3 ] = spawn( "script_model", var_c132bedd46cfa7a3.origin );
        level.vehicles[ 3 ] setmodel( "veh9_mil_lnd_cargo_truck_lobby" );
        level.vehicles[ 3 ].animname = "vehicle";
        level.vehicles[ 3 ].var_ece8fc427845ef06 = "cargo";
        level.vehicles[ 3 ] useanimtree( #animtree );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x1b960192, Offset: 0x1dbb4
// Size: 0xff
function private function_3094ef6149d9e871()
{
    if ( level.var_4c31323596bf3cdf )
    {
        var_c132c0dd46cfac09 = utility::getstruct( "fe_mil_base_anim_01", "targetname" );
        level.vehicles[ 0 ].origin = var_c132c0dd46cfac09.origin;
        level.vehicles[ 1 ].origin = var_c132c0dd46cfac09.origin;
    }
    
    if ( level.var_ca17ffe77c84226e )
    {
        var_c132bfdd46cfa9d6 = utility::getstruct( "fe_mil_base_anim_02", "targetname" );
        level.vehicles[ 2 ].origin = ( -7161.34, 3702.8, 117.042 );
    }
    
    if ( level.cargoenabled )
    {
        var_c132bedd46cfa7a3 = utility::getstruct( "fe_mil_base_anim_03", "targetname" );
        level.vehicles[ 3 ].origin = var_c132bedd46cfa7a3.origin;
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x2494fae1, Offset: 0x1dcbb
// Size: 0x69
function private function_1e51608a0fb8becd( scenename )
{
    if ( scenename != "squad_lobby" || level.var_af7ed2bba5627cd1 )
    {
        return;
    }
    
    level.var_af7ed2bba5627cd1 = 1;
    
    if ( level.var_4c31323596bf3cdf )
    {
        thread function_e6c4ec101f3b9479();
    }
    
    if ( level.var_ca17ffe77c84226e )
    {
        thread function_d89e3f43ca46d23c();
    }
    
    if ( level.cargoenabled )
    {
        thread cargo_anims();
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x9908efbe, Offset: 0x1dd2c
// Size: 0x1cd
function private function_e6c4ec101f3b9479()
{
    level endon( "game_ended" );
    starttimelow = getdvarint( @"hash_b453ec118b6f9c37", 30 );
    starttimehigh = getdvarint( @"hash_b476fa118b9602b9", 180 );
    
    while ( true )
    {
        delaytime = randomintrange( starttimelow, starttimehigh );
        wait delaytime;
        vehicle_node = utility::getstruct( "fe_mil_base_anim_01", "targetname" );
        level.vehicles[ 0 ] animscripted( "iw9_fe_jltv_enter_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_jltv_enter_01 );
        level.vehicles[ 1 ] animscripted( "iw9_fe_small_bird_enter_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_small_bird_enter_01 );
        wait getanimlength( %iw9_fe_jltv_enter_01 );
        level.vehicles[ 0 ] animscripted( "iw9_fe_jltv_loop_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_jltv_loop_01 );
        level.vehicles[ 1 ] animscripted( "iw9_fe_small_bird_loop_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_small_bird_loop_01 );
        wait getdvarint( @"hash_4ba87d948942d27e", 60 );
        level.vehicles[ 0 ] animscripted( "iw9_fe_jltv_exit_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_jltv_exit_01 );
        level.vehicles[ 1 ] animscripted( "iw9_fe_small_bird_exit_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_small_bird_exit_01 );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xa3100932, Offset: 0x1df01
// Size: 0x20
function private function_d89e3f43ca46d23c()
{
    level endon( "game_ended" );
    level.vehicles[ 2 ] scriptmodelplayanim( "iw9_fe_medium_bird_loop_01" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xa27dcc09, Offset: 0x1df29
// Size: 0x131
function private cargo_anims()
{
    level endon( "game_ended" );
    starttimelow = getdvarint( @"hash_7469506e01034889", 30 );
    starttimehigh = getdvarint( @"hash_7446426e00dce207", 180 );
    
    while ( true )
    {
        delaytime = randomintrange( starttimelow, starttimehigh );
        wait delaytime;
        vehicle_node = utility::getstruct( "fe_mil_base_anim_03", "targetname" );
        level.vehicles[ 3 ] animscripted( "iw9_fe_cargo_truck_enter_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_cargo_truck_enter_01 );
        wait getanimlength( %iw9_fe_cargo_truck_enter_01 );
        level.vehicles[ 3 ] animscripted( "iw9_fe_cargo_truck_loop_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_cargo_truck_loop_01 );
        wait getdvarint( @"hash_61e0ef762c4aa27c", 60 );
        level.vehicles[ 3 ] animscripted( "iw9_fe_cargo_truck_exit_01", vehicle_node.origin, vehicle_node.angles, %iw9_fe_cargo_truck_exit_01 );
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xfda90443, Offset: 0x1e062
// Size: 0xdc
function private function_28148d715ddbd451( blima )
{
    if ( blima tagexists( "TAG_TAIL_ROTOR_BLADE_01" ) )
    {
        blima hidepart( "TAG_TAIL_ROTOR_BLADE_01" );
    }
    
    if ( blima tagexists( "TAG_TAIL_ROTOR_BLADE_02" ) )
    {
        blima hidepart( "TAG_TAIL_ROTOR_BLADE_02" );
    }
    
    if ( blima tagexists( "TAG_TAIL_ROTOR_BLADE_03" ) )
    {
        blima hidepart( "TAG_TAIL_ROTOR_BLADE_03" );
    }
    
    if ( blima tagexists( "TAG_TAIL_ROTOR_BLADE_04" ) )
    {
        blima hidepart( "TAG_TAIL_ROTOR_BLADE_04" );
    }
    
    if ( blima tagexists( "TAG_MAIN_ROTOR_BLADE_01" ) )
    {
        blima hidepart( "TAG_MAIN_ROTOR_BLADE_01" );
    }
    
    if ( blima tagexists( "TAG_MAIN_ROTOR_BLADE_02" ) )
    {
        blima hidepart( "TAG_MAIN_ROTOR_BLADE_02" );
    }
    
    if ( blima tagexists( "TAG_MAIN_ROTOR_BLADE_03" ) )
    {
        blima hidepart( "TAG_MAIN_ROTOR_BLADE_03" );
    }
    
    if ( blima tagexists( "TAG_MAIN_ROTOR_BLADE_04" ) )
    {
        blima hidepart( "TAG_MAIN_ROTOR_BLADE_04" );
    }
}

// Namespace frontendutils
// Params 2, eflags: 0x4
// Checksum 0xd5a37429, Offset: 0x1e146
// Size: 0x81
function private reset_preview_weapon_loc( unused, args )
{
    weapontransform = function_28d43ffc378eedeb( "weapon_loc_preview" );
    level.weapons[ 6 ] dontinterpolate();
    level.weapons[ 6 ].origin = weapontransform.origin;
    level.weapons[ 6 ].angles = weapontransform.angles;
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x43a7f881, Offset: 0x1e1cf
// Size: 0x16
function private getgunbenchents()
{
    level.gunbenchbulletent = function_28d43ffc378eedeb( "gunbench_bullets" );
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x5bfe7d07, Offset: 0x1e1ed
// Size: 0xac
function private devui_bg_swap( bgnumber )
{
    foreach ( bg in level.ui_bg_images_2d )
    {
        bg hide();
    }
    
    if ( bgnumber > 0 && bgnumber <= level.ui_bg_images_2d.size )
    {
        level.ui_bg_images_2d[ bgnumber ] show();
    }
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0xf50220ad, Offset: 0x1e2a1
// Size: 0x7c
function private function_bb440638a4e00fd0( rewardscriptbundle, basecam, initialvalues )
{
    var_1b6a4e5f7e2f1d81 = rewardscriptbundle.var_1b6a4e5f7e2f1d81;
    var_e21c58c4e7a3cd24 = rewardscriptbundle.var_e21c58c4e7a3cd24;
    
    if ( !isdefined( var_1b6a4e5f7e2f1d81 ) )
    {
        var_1b6a4e5f7e2f1d81 = initialvalues[ 0 ];
    }
    
    if ( !isdefined( var_e21c58c4e7a3cd24 ) )
    {
        var_e21c58c4e7a3cd24 = initialvalues[ 1 ];
    }
    
    basecam.depthoffieldvalues = [ var_1b6a4e5f7e2f1d81, var_e21c58c4e7a3cd24 ];
}

// Namespace frontendutils
// Params 3, eflags: 0x4
// Checksum 0x171decce, Offset: 0x1e325
// Size: 0x3c6
function private function_69ff5cb4bd194557( rewardscriptbundle, var_d0cd1d5c97cc75c8, var_24341f580e01cc98 )
{
    if ( isdefined( rewardscriptbundle ) )
    {
        level.var_a6ac8df48acba8aa = ( 0, 0, 0 );
        level.currentcameraangles = ( 0, 0, 0 );
        cameraxoffset = rewardscriptbundle.cameraxoffset;
        camerayoffset = rewardscriptbundle.camerayoffset;
        camerazoffset = rewardscriptbundle.camerazoffset;
        var_e7b84c8915f944c9 = rewardscriptbundle.var_e7b84c8915f944c9;
        
        if ( !isdefined( cameraxoffset ) )
        {
            cameraxoffset = 0;
        }
        
        if ( !isdefined( camerayoffset ) )
        {
            camerayoffset = 0;
        }
        
        if ( !isdefined( camerazoffset ) )
        {
            camerazoffset = 0;
        }
        
        if ( !isdefined( var_e7b84c8915f944c9 ) )
        {
            var_e7b84c8915f944c9 = 0;
        }
        
        if ( var_d0cd1d5c97cc75c8 == 1 )
        {
            level.var_57de6213f23231ac.basecam.origin = level.var_6f0e01b35c5dff9a + ( cameraxoffset, camerayoffset, camerazoffset );
            level.var_57de6213f23231ac.basecam.angles = level.var_88fbef8446591798 + ( var_e7b84c8915f944c9, 0, 0 );
            level.currentcamera = function_28d43ffc378eedeb( "cam_bp_character" );
            println( "<dev string:x66e>" + level.var_57de6213f23231ac.basecam.origin );
            
            if ( level.active_section.name == "battle_pass_character" )
            {
                println( "<dev string:x69a>" );
                level.var_24341f580e01cc98 = 1;
            }
            
            function_bb440638a4e00fd0( rewardscriptbundle, level.var_57de6213f23231ac.basecam, level.var_77e5de91420a0d25 );
        }
        else if ( var_d0cd1d5c97cc75c8 == 2 )
        {
            level.var_3f38ce7f2f49b95.basecam.origin = level.var_f22cbcacfee72421 + ( cameraxoffset, camerayoffset, camerazoffset );
            level.var_3f38ce7f2f49b95.basecam.angles = level.var_27f476ad46fd672f + ( var_e7b84c8915f944c9, 0, 0 );
            level.currentcamera = function_28d43ffc378eedeb( "cam_bp_weapon" );
            function_bb440638a4e00fd0( rewardscriptbundle, level.var_3f38ce7f2f49b95.basecam, level.var_e21c474897524f4 );
        }
        else if ( var_d0cd1d5c97cc75c8 == 3 )
        {
            level.var_4635780be563d7b.basecam.origin = level.var_95e42b9350fd91a7 + ( cameraxoffset, camerayoffset, camerazoffset );
            level.var_4635780be563d7b.basecam.angles = level.var_a600b0ee22b74269 + ( var_e7b84c8915f944c9, 0, 0 );
            level.currentcamera = function_28d43ffc378eedeb( "cam_bp_vehicle" );
            function_bb440638a4e00fd0( rewardscriptbundle, level.var_4635780be563d7b.basecam, level.var_afa5d0831670b6e );
        }
        else if ( var_d0cd1d5c97cc75c8 == 4 )
        {
            level.var_3f817d1c8dbca9bd.basecam.origin = level.var_2b542c8a7664e769 + ( cameraxoffset, camerayoffset, camerazoffset );
            level.var_3f817d1c8dbca9bd.basecam.angles = level.var_427c4294787e3bf7 + ( var_e7b84c8915f944c9, 0, 0 );
            level.currentcamera = function_28d43ffc378eedeb( "cam_bp_items" );
            function_bb440638a4e00fd0( rewardscriptbundle, level.var_3f817d1c8dbca9bd.basecam, level.var_b6dd51b4e692769c );
        }
        
        if ( isdefined( var_24341f580e01cc98 ) )
        {
            level.var_24341f580e01cc98 = 1;
        }
        
        setomnvar( "ui_battlepass_camera_changed", level.var_b1ceac8f1516219c );
    }
}

// Namespace frontendutils
// Params 4, eflags: 0x4
// Checksum 0x9c0fb1a0, Offset: 0x1e6f3
// Size: 0x4c
function private function_153cefe70c091fe2( requestedsection, rewardscriptbundle, var_d0cd1d5c97cc75c8, var_24341f580e01cc98 )
{
    level endon( "clear_camera_thread" );
    camera_section_change( requestedsection );
    function_69ff5cb4bd194557( rewardscriptbundle, var_d0cd1d5c97cc75c8, var_24341f580e01cc98 );
    camera_section_change( requestedsection );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x5cd2cc08, Offset: 0x1e747
// Size: 0x1b31
function private luinotifylistener()
{
    self endon( "disconnect" );
    getgunbenchents();
    level.currentdropcount = 0;
    
    while ( true )
    {
        self waittill( "luinotifyserver", msg, arg );
        channel = strtok( msg, "," )[ 0 ];
        
        if ( level.lui_callbacks[ channel ] || level.var_8140645f7e3c6266[ channel ] )
        {
            continue;
        }
        
        println( "<dev string:x6b4>" + msg );
        
        if ( isdefined( level._effect[ "vfx_frontend_store_operator_motes_med" ] ) && !isdefined( level.var_40e706d68a688a56 ) )
        {
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 1548.76, 2986.94, -27 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 1518.69, 3474.11, -24 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 1534.24, 3259.83, -25 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 1533.78, 3162.83, -26 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( -3000, 3000, -27 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( -3000, 3000, -24 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( -3000, 3000, -25 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( -3000, 3000, -26 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 2828.76, 2986.94, -27 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 2828.76, 3474.11, -24 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 2828.76, 3259.83, -25 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 2828.76, 3162.83, -26 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 4108.76, 2986.94, -27 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 4108.76, 3474.11, -24 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 4108.76, 3259.83, -25 ) );
            playfx( utility::getfx( "vfx_frontend_store_operator_motes_med" ), ( 4108.76, 3162.83, -26 ) );
            level.var_40e706d68a688a56 = 1;
        }
        
        if ( msg == "end_current_xcam" )
        {
            end_current_xcam();
            continue;
        }
        
        if ( msg == "loadout_showcase_entered" )
        {
            level.bulletsinitialstate = 1;
            level.currentdropcount = 0;
            level.var_7ee813dc4c2b115f.origin = level.var_8015fd9f3d7dea27;
            level.var_7ee813dc4c2b115f.angles = level.var_4ed6509f8c903c94 ?? ( 0, 0, 0 );
            continue;
        }
        
        if ( msg == "primary_weapon_changed" )
        {
            var_54db66b0c7c910fd = int( arg );
            
            if ( level.bulletsinitialstate )
            {
                level.bulletsinitialstate = 0;
                continue;
            }
            
            if ( level.currentdropcount == 0 )
            {
            }
            
            level.currentdropcount++;
            
            if ( level.currentdropcount > 3 )
            {
                level.currentdropcount = 1;
            }
            
            continue;
        }
        
        if ( msg == "set_ui_rarity_image" )
        {
            var_fec0938e0a0bf66d = int( arg );
            devui_bg_swap( var_fec0938e0a0bf66d );
            continue;
        }
        
        if ( msg == "entered_firing_range_after_target_settings" )
        {
            numplates = int( arg );
            thread namespace_98fc1f2179e42c26::function_2de3b0117ec0842c( numplates );
            end_current_xcam();
            thread namespace_98fc1f2179e42c26::function_2e0a8c011b3d1851( 1 );
            continue;
        }
        
        if ( msg == "entered_firing_range_after_pause" )
        {
            end_current_xcam();
            thread namespace_98fc1f2179e42c26::function_2e0a8c011b3d1851( 1 );
            continue;
        }
        
        if ( msg == "entered_firing_range_pause_menu" )
        {
            thread namespace_98fc1f2179e42c26::function_3fb8295621b2f890();
            continue;
        }
        
        if ( msg == "entered_firing_range_from_social" )
        {
            thread namespace_98fc1f2179e42c26::function_3fb8295621b2f890();
            continue;
        }
        
        if ( msg == "entered_firing_range" )
        {
            end_current_xcam();
            thread namespace_98fc1f2179e42c26::function_232489312b237c86();
            continue;
        }
        
        if ( msg == "force_exit_firing_range" )
        {
            thread namespace_98fc1f2179e42c26::function_7eb21b04340b04d();
            continue;
        }
        
        if ( msg == "switch_loadouts" )
        {
            end_current_xcam();
            
            if ( getomnvar( "ui_firing_range_has_started" ) && self.settospectate )
            {
                thread namespace_98fc1f2179e42c26::function_2e0a8c011b3d1851( 0 );
            }
            
            thread namespace_98fc1f2179e42c26::function_b4d2e3406027eec5();
            continue;
        }
        
        if ( msg == "exit_firing_range" )
        {
            thread namespace_98fc1f2179e42c26::function_4dbdb6e6debb40ee();
            set_xcam();
            continue;
        }
        
        if ( msg == "restart_xcam_in_firing_range" )
        {
            thread namespace_98fc1f2179e42c26::function_975c17bde7e82d6();
            set_xcam();
            continue;
        }
        
        if ( msg == "enter_frontend_walkable_space" )
        {
            thread namespace_e3dadaab7220964b::function_867cd6025b5f3ea7( arg );
            continue;
        }
        
        if ( msg == "set_frontend_scriptable_part_state" )
        {
            thread namespace_e3dadaab7220964b::function_42cec6872280e398( arg );
            continue;
        }
        
        if ( msg == "set_dmz_fob_scriptable_states" )
        {
            thread namespace_e3dadaab7220964b::function_b14158045d06087d( arg );
            continue;
        }
        
        if ( msg == "pause_frontend_walkable_space" )
        {
            thread namespace_e3dadaab7220964b::function_d86b6171373c7132();
            continue;
        }
        
        if ( msg == "pause_frontend_walkable_space_quick_access" )
        {
            thread namespace_e3dadaab7220964b::function_d86b6171373c7132( 1 );
            continue;
        }
        
        if ( msg == "unpause_frontend_walkable_space" )
        {
            thread namespace_e3dadaab7220964b::function_4ca96946a95337ad( 1 );
            continue;
        }
        
        if ( msg == "update_frontend_walkable_space_operator_model" )
        {
            thread namespace_e3dadaab7220964b::function_56408659ca302e();
            continue;
        }
        
        if ( msg == "exit_frontend_walkable_space" )
        {
            thread namespace_e3dadaab7220964b::function_b01ea89ac6576abd();
            continue;
        }
        
        if ( msg == "update_backpack_size" )
        {
            thread namespace_e3dadaab7220964b::function_1b6fa013c0c2b251( arg );
            continue;
        }
        
        if ( msg == "hint_walkable_space_models" )
        {
            thread namespace_e3dadaab7220964b::function_93b1960c20cec5f8();
            continue;
        }
        
        if ( msg == "pre_match_making" )
        {
            thread namespace_98fc1f2179e42c26::function_7eb21b04340b04d();
            println( "<dev string:x6c9>" );
            utility::flag_clear( "started_mm" );
            
            if ( !isdefined( level.active_scene_data ) )
            {
                level thread function_7e34ddd9ad834c78();
            }
            
            continue;
        }
        
        if ( msg == "match_making" )
        {
            println( "<dev string:x6e1>" );
            level.var_ba534d680d3e177d = getpartyinfo().size;
            
            /#
                if ( getdvarint( @"hash_cbd831de958955e3" ) )
                {
                    level.var_ba534d680d3e177d = getdvarint( @"hash_6e71a0ce997a3f8a" );
                }
            #/
            
            level.currentflagmsg = "match_making";
            utility::flag_set( "started_mm" );
            continue;
        }
        
        if ( msg == "lobby_members_changed" )
        {
            if ( !level.overridenumplayers )
            {
                level.var_c111bc9d2e9166a9 = arg;
            }
            
            level.currentflagmsg = "lobby_member_increase";
            utility::flag_set( "lobby_member_increase" );
            continue;
        }
        
        if ( msg == "crib_op_intro_anim_rotated" )
        {
            if ( arg >> 3 )
            {
                if ( ( arg & 2 ) == 0 )
                {
                    level.client_characters[ 14 ].angles = ( 0, -153, 0 );
                }
                else
                {
                    level.client_characters[ 14 ].angles = ( 0, -126, 0 );
                }
            }
            else
            {
                level.client_characters[ 14 ].angles = ( 0, -139.143, 0 );
                level.var_ddbddc069152b02f = arg & 2;
                level.var_4f103db18dbbaee4 = arg & 1;
                level.var_e365d8f09a7f6f27 = ( arg & 2 ) >> 1;
            }
            
            continue;
        }
        
        if ( msg == "crib_op_intro_anim_forward" )
        {
            level.var_ddbddc069152b02f = arg & 2;
            level.var_4f103db18dbbaee4 = arg & 1;
            level.var_e365d8f09a7f6f27 = ( arg & 2 ) >> 1;
            continue;
        }
        
        if ( msg == "streak_select_trigger" )
        {
            if ( arg == 1 )
            {
                function_3fcf5d33b6d4cdfc( "fe_op_crib_xcam_killstreak_01_in_xcam", 0, 0.05, level.xcam_anchor );
            }
            else
            {
                function_3fcf5d33b6d4cdfc( "fe_op_crib_xcam_killstreak_01_out_xcam", 0, 0.05, level.xcam_anchor );
            }
            
            continue;
        }
        
        if ( msg == "operator_store_preview" )
        {
            if ( isdefined( level.var_6d9f8ea019296372 ) )
            {
                level.var_6d9f8ea019296372 setmodel( "bp_diorama_background_simple_s2_v0" );
                level.var_6d9f8ea019296372.origin = level.var_cfec6213d70ba3ae;
            }
            
            var_aed6800ca6eb0a6f = function_28d43ffc378eedeb( "shop_character_01" );
            
            if ( arg == "default_vision_set" )
            {
                visionset = "";
            }
            else
            {
                visionset = arg;
            }
            
            level.playerviewowner visionsetnakedforplayer( visionset, 0 );
            level.client_characters[ 0 ].angles = var_aed6800ca6eb0a6f.angles ?? ( 0, 0, 0 );
            level.client_characters[ 0 ].origin = var_aed6800ca6eb0a6f.origin ?? ( 0, 0, 0 );
            continue;
        }
        
        if ( msg == "update_operator_crib_vision" )
        {
            if ( arg == "default_vision_set" )
            {
                visionset = "";
            }
            else
            {
                visionset = arg;
            }
            
            level.playerviewowner visionsetnakedforplayer( visionset, 0 );
            continue;
        }
        
        if ( msg == "update_weapon_store_background" )
        {
            args = strtok( arg, "," );
            xoffset = int( args[ 0 ] );
            isprotuned = int( args[ 1 ] );
            var_ed8bb102efe9181d = int( args[ 2 ] );
            var_cd68f937664ec541 = ( 4103.15, 3095.33, 2 );
            
            if ( isprotuned == 1 )
            {
                if ( !isdefined( level.var_f067fdec0909c449 ) )
                {
                    level.var_f067fdec0909c449 = spawnfx( utility::getfx( "vfx_frontend_weapon_protune_aura" ), var_cd68f937664ec541, ( 1, 0, 0 ), ( 0, -1, 0 ) );
                }
                else
                {
                    level.var_f067fdec0909c449 delete();
                    level.var_f067fdec0909c449 = spawnfx( utility::getfx( "vfx_frontend_weapon_protune_aura" ), var_cd68f937664ec541, ( 1, 0, 0 ), ( 0, -1, 0 ) );
                }
                
                triggerfx( level.var_f067fdec0909c449 );
            }
            else if ( isdefined( level.var_f067fdec0909c449 ) )
            {
                level.var_f067fdec0909c449 delete();
            }
            
            if ( var_ed8bb102efe9181d == 1 )
            {
            }
            
            level.var_7ee813dc4c2b115f setmodel( "" );
            level.var_7ee813dc4c2b115f.origin = level.var_8015fd9f3d7dea27;
            level.var_7ee813dc4c2b115f.angles = level.var_4ed6509f8c903c94 ?? ( 0, 0, 0 );
            continue;
        }
        
        if ( msg == "update_gunscreen_store_background" )
        {
            level.var_7ee813dc4c2b115f setmodel( "" );
            level.var_7ee813dc4c2b115f.origin = ( -3072, 3072, -50 );
            level.var_7ee813dc4c2b115f.angles = ( 0, 70, 0 );
            continue;
        }
        
        if ( msg == "remove_protuned_weapon_vfx" )
        {
            if ( isdefined( level.var_f067fdec0909c449 ) )
            {
                level.var_f067fdec0909c449 delete();
            }
            
            continue;
        }
        
        if ( msg == "swap_gun_foam" )
        {
            arg = int( arg );
            
            if ( !isdefined( arg ) )
            {
                return;
            }
            
            level.foamlarge = function_28d43ffc378eedeb( "foam_large" );
            level.foammedium = function_28d43ffc378eedeb( "foam_med" );
            level.foamsmall = function_28d43ffc378eedeb( "foam_small" );
            
            if ( arg == 3 )
            {
                level.foamlarge show();
                level.foammedium hide();
                level.foamsmall hide();
            }
            else if ( arg == 2 )
            {
                level.foamlarge hide();
                level.foammedium show();
                level.foamsmall hide();
            }
            else if ( arg == 1 )
            {
                level.foamlarge hide();
                level.foammedium hide();
                level.foamsmall show();
            }
            
            continue;
        }
        
        if ( msg == "battlemap_sector_update" )
        {
            assert( getdvarint( @"mgl", 0 ) == 0, "<dev string:x6fe>" );
            level notify( "clear_camera_thread" );
            args = strtok( arg, "+" );
            var_45c75c5a7b3983d8 = args[ 0 ];
            var_d0cd1d5c97cc75c8 = int( args[ 1 ] );
            level.var_b1ceac8f1516219c = -1;
            
            if ( isdefined( level.var_6d9f8ea019296372 ) )
            {
                level.var_6d9f8ea019296372.origin += ( 0, 0, -1000 );
            }
            
            rewardscriptbundle = getscriptbundle( hashcat( %"hash_6e3aa7ae38b4c049", var_45c75c5a7b3983d8 ) );
            
            if ( isdefined( args[ 3 ] ) )
            {
                level.var_b1ceac8f1516219c = int( args[ 3 ] );
            }
            
            if ( isdefined( args[ 2 ] ) && args[ 2 ] != "none" )
            {
                requestedsection = spawnstruct();
                requestedsection.name = args[ 2 ];
                requestedsection.index = 0;
                level.active_section = requestedsection;
                setomnvar( "frontend_weapon_position_updated", 0 );
                setomnvar( "frontend_screen_black", 0 );
                thread function_153cefe70c091fe2( requestedsection, rewardscriptbundle, var_d0cd1d5c97cc75c8, args[ 4 ] );
            }
            else
            {
                thread function_69ff5cb4bd194557( rewardscriptbundle, var_d0cd1d5c97cc75c8, args[ 4 ] );
            }
            
            continue;
        }
        
        if ( msg == "camera_control_position_value" )
        {
            if ( !isdefined( arg ) )
            {
                level.camera_control_position_value = 1;
            }
            
            level.camera_control_position_value = float( arg );
            continue;
        }
        
        if ( msg == "camera_control_rotation_value" )
        {
            if ( !isdefined( arg ) )
            {
                level.camera_control_rotation_value = 1;
            }
            
            level.camera_control_rotation_value = float( arg );
            continue;
        }
        
        if ( msg == "camera_control_update" )
        {
            end_current_xcam();
            
            if ( !isdefined( arg ) )
            {
                return;
            }
            
            if ( !isdefined( level.currentcamera ) )
            {
                if ( !isdefined( level.active_camera ) )
                {
                    return;
                }
            }
            
            arg = int( arg );
            
            if ( !isdefined( level.var_a6ac8df48acba8aa ) || arg == 17 )
            {
                level.var_a6ac8df48acba8aa = ( 0, 0, 0 );
                level.currentcameraangles = ( 0, 0, 0 );
            }
            
            if ( !isdefined( level.camera_control_position_value ) )
            {
                level.camera_control_position_value = 1;
            }
            
            if ( !isdefined( level.camera_control_rotation_value ) )
            {
                level.camera_control_rotation_value = 1;
            }
            
            if ( arg == 1 )
            {
                level.var_a6ac8df48acba8aa += ( level.camera_control_position_value, 0, 0 );
            }
            else if ( arg == 2 )
            {
                level.var_a6ac8df48acba8aa += ( level.camera_control_position_value * -1, 0, 0 );
            }
            else if ( arg == 3 )
            {
                level.var_a6ac8df48acba8aa += ( 0, level.camera_control_position_value, 0 );
            }
            else if ( arg == 4 )
            {
                level.var_a6ac8df48acba8aa += ( 0, level.camera_control_position_value * -1, 0 );
            }
            else if ( arg == 5 )
            {
                level.var_a6ac8df48acba8aa += ( 0, 0, level.camera_control_position_value );
            }
            else if ( arg == 6 )
            {
                level.var_a6ac8df48acba8aa += ( 0, 0, level.camera_control_position_value * -1 );
            }
            else if ( arg == 15 )
            {
                level.var_a6ac8df48acba8aa = ( 0, 0, 0 );
            }
            else if ( arg == 7 )
            {
                level.currentcameraangles += ( level.camera_control_rotation_value, 0, 0 );
            }
            else if ( arg == 8 )
            {
                level.currentcameraangles += ( level.camera_control_rotation_value * -1, 0, 0 );
            }
            else if ( arg == 13 )
            {
                level.currentcameraangles += ( 0, level.camera_control_rotation_value, 0 );
            }
            else if ( arg == 14 )
            {
                level.currentcameraangles += ( 0, level.camera_control_rotation_value * -1, 0 );
            }
            else if ( arg == 16 )
            {
                level.currentcameraangles = ( 0, 0, 0 );
            }
            else if ( arg == 9 )
            {
                var_72eba66ec6ef6e1 = level.active_camera.depthoffieldvalues[ 0 ] + 1;
                
                if ( var_72eba66ec6ef6e1 <= 0 )
                {
                    var_72eba66ec6ef6e1 = 0;
                }
                
                level.active_camera.depthoffieldvalues[ 0 ] = var_72eba66ec6ef6e1;
                update_camera_depth_of_field();
            }
            else if ( arg == 10 )
            {
                var_72eba66ec6ef6e1 = level.active_camera.depthoffieldvalues[ 0 ] - 1;
                
                if ( var_72eba66ec6ef6e1 <= 0 )
                {
                    var_72eba66ec6ef6e1 = 0;
                }
                
                level.active_camera.depthoffieldvalues[ 0 ] = var_72eba66ec6ef6e1;
                update_camera_depth_of_field();
            }
            else if ( arg == 11 )
            {
                level.active_camera.depthoffieldvalues[ 1 ] += 1;
                update_camera_depth_of_field();
            }
            else if ( arg == 12 )
            {
                level.active_camera.depthoffieldvalues[ 1 ] -= 1;
                update_camera_depth_of_field();
            }
            
            movetoorigin = spawnstruct();
            camera = level.active_camera;
            
            if ( isdefined( level.currentcamera ) )
            {
                camera = level.currentcamera;
            }
            
            movetoorigin.origin = camera.origin + level.var_a6ac8df48acba8aa;
            movetoorigin.angles = camera.angles + level.currentcameraangles;
            camera_move_helper( movetoorigin, 0, 0, 0, 0, 0 );
            continue;
        }
        
        if ( msg == "pass_store_weapon_update" )
        {
            utility::flag_set( "force_weapon_update" );
            continue;
        }
        
        tagarray = strtok( msg, "," );
        isloadout = tagarray.size > 7;
        var_9e4aaa1a68f7ce48 = tagarray[ 0 ] == "attach_zoom";
        isweaponpreview = tagarray[ 0 ] == "weapon_preview";
        
        if ( var_9e4aaa1a68f7ce48 || isweaponpreview )
        {
            tagstruct = function_27c7889021d20b28( tagarray, isweaponpreview, level.active_section.name );
        }
        else if ( isloadout )
        {
            tagstruct = function_4a31f3d861553676( tagarray );
        }
        else
        {
            tagstruct = function_7007bd7f0543df4a( tagarray, isweaponpreview, level.active_section.name );
        }
        
        if ( !isdefined( tagstruct ) )
        {
            continue;
        }
        
        if ( !isarray( tagstruct ) )
        {
            tagstruct = [ tagstruct ];
        }
        
        if ( isweaponpreview )
        {
            foreach ( index, struct in tagstruct )
            {
                if ( struct.name == "tag_cosmetic" )
                {
                    struct.angles = ( 10, 190, 30 );
                }
                
                if ( struct.name == "tag_sticker" || struct.name == "tag_sticker_shotgun" )
                {
                    struct.angles = ( 10, 190, 42 );
                }
                
                if ( function_e67750d82fc610b1( struct.class ) )
                {
                    struct.angles = ( 0, 180, 0 );
                }
                
                level.var_1d22ece93818d778[ struct.name ][ "transitions" ] = [];
                level.var_1d22ece93818d778[ struct.name ][ "transitions" ][ 0 ] = struct.xcam;
                level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ] = spawnstruct();
                level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].origin = struct.origin;
                level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].angles = struct.angles;
                blendtime = getdvarfloat( @"hash_4773a268cb735013", 0.2 );
                
                if ( distancesquared( struct.origin, ( 25887, -5425, 73 ) ) < 10000 )
                {
                    level.xcam_anchor.origin = struct.origin;
                    level.xcam_anchor.angles = struct.angles;
                    function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ struct.name ][ "transitions" ][ 0 ], 0, blendtime, level.xcam_anchor );
                }
            }
            
            continue;
        }
        
        if ( !var_9e4aaa1a68f7ce48 )
        {
            foreach ( index, struct in tagstruct )
            {
                if ( !isloadout )
                {
                    if ( struct.name == "tag_origin" )
                    {
                        struct.name = "j_gun";
                        struct.origin = level.active_camera.origin;
                    }
                    
                    level.var_1d22ece93818d778[ struct.name ][ "transitions" ] = [];
                    level.var_1d22ece93818d778[ struct.name ][ "transitions" ][ 0 ] = struct.xcam;
                    level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ] = spawnstruct();
                    level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].origin = struct.origin;
                    level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].angles = struct.angles;
                    level.var_c4693a5cb9b2cebd = 1;
                    level.xcam_anchor.origin = struct.origin;
                    level.xcam_anchor.angles = struct.angles;
                    blendtime = getdvarfloat( @"hash_4773a268cb735013", 0.2 );
                    function_3fcf5d33b6d4cdfc( level.var_1d22ece93818d778[ struct.name ][ "transitions" ][ 0 ], 0, blendtime, level.xcam_anchor );
                    continue;
                }
                
                if ( isdefined( level.var_29d3d6d1ca17b761[ index ] ) && struct.xcam != level.var_29d3d6d1ca17b761[ index ] )
                {
                    level.var_1d22ece93818d778[ struct.name ][ "transitions" ][ 0 ] = struct.xcam;
                    level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].origin = struct.origin;
                    
                    if ( index == 1 )
                    {
                        level.var_1d22ece93818d778[ "loadout_showcase_o" ][ "transitions" ][ 0 ] = struct.xcam;
                        level.var_1d22ece93818d778[ "loadout_showcase_o" ][ "xcam_data" ].origin = struct.origin;
                    }
                    
                    continue;
                }
                
                if ( isdefined( struct.origin ) && struct.origin != level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].origin )
                {
                    level.var_1d22ece93818d778[ struct.name ][ "xcam_data" ].origin = struct.origin;
                    
                    if ( index == 1 )
                    {
                        level.var_1d22ece93818d778[ "loadout_showcase_o" ][ "xcam_data" ].origin = struct.origin;
                    }
                }
            }
            
            if ( isloadout )
            {
                level.var_29d3d6d1ca17b761[ 0 ] = tagstruct[ 0 ].xcam;
                level.var_29d3d6d1ca17b761[ 1 ] = tagstruct[ 1 ].xcam;
            }
            
            continue;
        }
        
        var_7079bd5d79593f20 = function_dd44ecf00812addc( tagarray );
        
        if ( var_7079bd5d79593f20 != "receiver" )
        {
            continue;
        }
        
        if ( level.var_b039ebcdd7535c8a )
        {
            utility::flag_set( "zoom_triggered" );
            level.var_7079bd5d79593f20 = var_7079bd5d79593f20;
            continue;
        }
        
        foreach ( struct in tagstruct )
        {
            level.var_1d22ece93818d778[ "loadout_showcase_preview" ][ "xcam_data" ].origin = struct.origin;
            level.var_1d22ece93818d778[ "loadout_showcase_preview" ][ "xcam_data" ].angles = struct.angles;
            level.var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "xcam_data" ].origin = struct.origin;
            level.var_1d22ece93818d778[ "loadout_showcase_preview_small" ][ "xcam_data" ].angles = struct.angles;
            level.var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "xcam_data" ].origin = struct.origin;
            level.var_1d22ece93818d778[ "loadout_showcase_preview_large" ][ "xcam_data" ].angles = struct.angles;
            level.var_b039ebcdd7535c8a = 1;
            utility::flag_set( "force_weapon_update" );
        }
        
        level.var_7079bd5d79593f20 = var_7079bd5d79593f20;
        utility::flag_set( "zoom_triggered" );
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x34cf104, Offset: 0x20280
// Size: 0x1e, Type: bool
function private function_270ae4327a1f5bbd( scenename )
{
    if ( !isdefined( scenename ) )
    {
        return false;
    }
    
    return isdefined( function_8e87b77f70835fd4( scenename ) );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xdf354609, Offset: 0x202a7
// Size: 0x18
function private function_7e34ddd9ad834c78()
{
    level waittill( "finished_scene_change" );
    level.currentflagmsg = "pre_match_making";
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xebc6418f, Offset: 0x202c7
// Size: 0x20
function private function_dc431df3348b6bf2( scenename )
{
    if ( !isdefined( scenename ) )
    {
        return 0;
    }
    
    return issubstr( scenename, "weapon_preview" );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xf05aabb9, Offset: 0x202f0
// Size: 0xa9
function private function_adcb617248dab87e()
{
    level.var_3f7007725429a46f = 0;
    
    foreach ( tag in level.var_541de3af4cfb72 )
    {
        if ( isdefined( level.var_1d22ece93818d778 ) && isdefined( level.var_1d22ece93818d778[ tag ] ) )
        {
            level.var_1d22ece93818d778[ tag ] = undefined;
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x2c56de7a, Offset: 0x203a1
// Size: 0xb6
function private loadandplayholoeffect()
{
    if ( !isdefined( level.holoeffect ) )
    {
        level.holoeffect = loadfxasset( "vfx_iw8_mp_watches_holo_watch" );
        wait 1;
    }
    
    level.watchfx = spawnfx( level.holoeffect, level.weapons[ 3 ].origin );
    level.watchfx.angles = ( 221, -34.753, 181.997 );
    level.watchfx.origin += ( 1, -0.66, 0.98 );
    waitframe();
    triggerfx( level.watchfx );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xf77819ff, Offset: 0x2045f
// Size: 0x55
function private updaterotatedebug()
{
    while ( true )
    {
        if ( getdvarint( @"hash_97e86d4661a38d", -1 ) != -1 )
        {
            val = getdvarint( @"hash_97e86d4661a38d" );
            moveeffect( val );
            
            /#
                setdevdvar( @"hash_97e86d4661a38d", -1 );
            #/
        }
        
        waitframe();
    }
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0xc2d4ac4d, Offset: 0x204bc
// Size: 0x11d
function private moveeffect( val )
{
    watchx = 0;
    watchy = 0;
    watchz = 0;
    
    if ( val == 1 )
    {
        watchx = 0.1;
    }
    
    if ( val == 2 )
    {
        watchx = -0.1;
    }
    
    if ( val == 3 )
    {
        watchy = 0.1;
    }
    
    if ( val == 4 )
    {
        watchy = -0.1;
    }
    
    if ( val == 5 )
    {
        watchz = 0.1;
    }
    
    if ( val == 6 )
    {
        watchz = -0.1;
    }
    
    angle = level.watchfx.angles;
    newpos = level.watchfx.origin + ( watchx, watchy, watchz );
    level.watchfx delete();
    level.watchfx = spawnfx( level.holoeffect, newpos );
    level.watchfx.angles = angle;
    triggerfx( level.watchfx );
    println( newpos );
}

// Namespace frontendutils
// Params 1, eflags: 0x4
// Checksum 0x9c1c7974, Offset: 0x205e1
// Size: 0x121
function private rotateeffect( val )
{
    watchx = 0;
    watchy = 0;
    watchz = 0;
    
    if ( val == 1 )
    {
        watchx = 10;
    }
    
    if ( val == 2 )
    {
        watchx = -10;
    }
    
    if ( val == 3 )
    {
        watchy = 10;
    }
    
    if ( val == 4 )
    {
        watchy = -10;
    }
    
    if ( val == 5 )
    {
        watchz = 10;
    }
    
    if ( val == 6 )
    {
        watchz = -10;
    }
    
    newangles = level.watchfx.angles + ( watchx, watchy, watchz );
    level.watchfx delete();
    level.watchfx = spawnfx( level.holoeffect, level.weapons[ 3 ].origin + ( 1, -0.66, 1.1 ) );
    level.watchfx.angles = newangles;
    triggerfx( level.watchfx );
    println( level.watchfx.angles );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x16d4dc0c, Offset: 0x2070a
// Size: 0xf0
function private setup_rarity_ui_images()
{
    level.ui_bg_images_2d = [];
    level.ui_bg_images_2d[ 1 ] = function_28d43ffc378eedeb( "weapRarity01" );
    level.ui_bg_images_2d[ 2 ] = function_28d43ffc378eedeb( "weapRarity02" );
    level.ui_bg_images_2d[ 3 ] = function_28d43ffc378eedeb( "weapRarity03" );
    level.ui_bg_images_2d[ 4 ] = function_28d43ffc378eedeb( "weapRarity04" );
    level.ui_bg_images_2d[ 5 ] = function_28d43ffc378eedeb( "weapRarity05" );
    level.raritycamsmall = utility::getstruct( "weapRaritySmall", "targetname" );
    level.raritycammedium = utility::getstruct( "weapRarityMedium", "targetname" );
    level.raritycamlarge = utility::getstruct( "weapRarityLarge", "targetname" );
    level.raritycamwatch = utility::getstruct( "weapRarityWatch", "targetname" );
    devui_bg_swap( 0 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x6c2d4bbc, Offset: 0x20802
// Size: 0x100
function private function_d38a01950fd7d9b5()
{
    ceilinglights = getentarray( "gunsmith_ceiling_square_01", #targetname );
    
    foreach ( light in ceilinglights )
    {
        light.original_intensity = light getlightintensity();
    }
    
    foreach ( light in ceilinglights )
    {
        light setlightintensity( 0 );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x182681d2, Offset: 0x2090a
// Size: 0xa8
function private function_816538d08541ca79()
{
    ceilinglights = getentarray( "gunsmith_ceiling_square_01", #targetname );
    
    foreach ( light in ceilinglights )
    {
        if ( isdefined( light.original_intensity ) )
        {
            light setlightintensity( light.original_intensity );
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x503b0b47, Offset: 0x209ba
// Size: 0x42
function private function_2dc1ae88b7014cc9()
{
    setdvar( @"hash_5d66c2ef5a9612e0", 1 );
    setdvar( @"hash_f9190cd77b0b2463", 4 );
    setdvar( @"hash_dacffbfd52c2fdc5", 16 );
    setdvar( @"hash_ea4c44a08cd23d5d", 3 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x571f2d54, Offset: 0x20a04
// Size: 0x61
function private function_5bb771346af1d9d3()
{
    setdvar( @"hash_5d66c2ef5a9612e0", 0 );
    setdvar( @"hash_eca4b727b01fd254", 8 );
    setdvar( @"hash_f9190cd77b0b2463", 1 );
    setdvar( @"hash_dacffbfd52c2fdc5", 32 );
    setdvar( @"hash_ea4c44a08cd23d5d", 1 );
    setdvar( @"hash_e918bd4613339eeb", 2 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xf3e72733, Offset: 0x20a6d
// Size: 0x100
function private function_f1bc4aed1032ba22()
{
    ceilinglights = getentarray( "operator_ceiling_light", #targetname );
    
    foreach ( light in ceilinglights )
    {
        light.original_intensity = light getlightintensity();
    }
    
    foreach ( light in ceilinglights )
    {
        light setlightintensity( 0 );
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x84d50b44, Offset: 0x20b75
// Size: 0xa8
function private function_a8d269be08ab20c8()
{
    ceilinglights = getentarray( "operator_ceiling_light", #targetname );
    
    foreach ( light in ceilinglights )
    {
        if ( isdefined( light.original_intensity ) )
        {
            light setlightintensity( light.original_intensity );
        }
    }
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0xef99cd74, Offset: 0x20c25
// Size: 0x11
function private function_a02aeaf6a41a0a14()
{
    setdvar( @"hash_e918bd4613339eeb", 0 );
}

// Namespace frontendutils
// Params 0, eflags: 0x4
// Checksum 0x6f8ac196, Offset: 0x20c3e
// Size: 0x12
function private function_5bb770346af1d7a0()
{
    setdvar( @"hash_e918bd4613339eeb", 2 );
}

/#

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x19389df8, Offset: 0x20c58
    // Size: 0xd5, Type: dev
    function private function_f6794b7a210ff9ff()
    {
        setdevdvar( @"hash_902a293944d16b28", 0 );
        setdevdvar( @"hash_47ad1705c52e610", "<dev string:xec>" );
        setdevdvar( @"hash_e4612a44320c55af", 0 );
        setdevdvar( @"hash_a2635942d6da077f", 0 );
        
        for ( ;; )
        {
            if ( getdvarint( @"hash_e4612a44320c55af" ) == 1 )
            {
                thread function_507bb4debee300fc();
            }
            else if ( getdvarint( @"hash_902a293944d16b28" ) == 1 )
            {
                thread function_8de3d4a8ea9f37bd();
            }
            else if ( getdvar( @"hash_47ad1705c52e610", "<dev string:xec>" ) != "<dev string:xec>" )
            {
                thread function_e122c3a901c31fa7();
            }
            else if ( getdvarint( @"hash_a2635942d6da077f" ) == 1 )
            {
                thread function_1c62b0ae507c19ae();
            }
            
            wait ( level.weaponmapdata.size + 1 ) * 0.01;
        }
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x55d69761, Offset: 0x20d35
    // Size: 0x24, Type: dev
    function private function_8de3d4a8ea9f37bd()
    {
        adddebugcommand( "<dev string:x750>" + "<dev string:x75c>" );
        setdevdvar( @"hash_902a293944d16b28", 0 );
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x96b3caf2, Offset: 0x20d61
    // Size: 0xcd, Type: dev
    function private function_e122c3a901c31fa7()
    {
        var_ad3182a403eb283 = getdvar( @"hash_47ad1705c52e610" );
        
        foreach ( weaponref in level.weaponmapdata )
        {
            if ( weaponref.assetname == var_ad3182a403eb283 )
            {
                adddebugcommand( "<dev string:x765>" + "<dev string:x776>" + weaponref.weaponlootid );
            }
            
            waitframe();
        }
        
        setdevdvar( @"hash_47ad1705c52e610", "<dev string:xec>" );
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0xb39f82a7, Offset: 0x20e36
    // Size: 0xa1, Type: dev
    function private function_507bb4debee300fc()
    {
        foreach ( weaponref in level.weaponmapdata )
        {
            adddebugcommand( "<dev string:x765>" + "<dev string:x776>" + weaponref.weaponlootid );
            waitframe();
        }
        
        setdevdvar( @"hash_e4612a44320c55af", 0 );
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0xfc33105f, Offset: 0x20edf
    // Size: 0x24, Type: dev
    function private function_1c62b0ae507c19ae()
    {
        adddebugcommand( "<dev string:x783>" + "<dev string:x794>" );
        setdevdvar( @"hash_a2635942d6da077f", 0 );
    }

    // Namespace frontendutils
    // Params 0, eflags: 0x4
    // Checksum 0x28cfa812, Offset: 0x20f0b
    // Size: 0x11a, Type: dev
    function private function_850dd9a21b448b1()
    {
        while ( true )
        {
            var_c523b7e898f1d9a5 = getdvarint( @"hash_c64c3bd538ca07a7", 0 );
            
            if ( var_c523b7e898f1d9a5 > 0 )
            {
                setdevdvar( @"hash_c64c3bd538ca07a7", 0 );
                level.var_c111bc9d2e9166a9 = var_c523b7e898f1d9a5;
                level.overridenumplayers = 1;
                level.currentflagmsg = "<dev string:x7a0>";
                utility::flag_set( "<dev string:x7a0>" );
            }
            
            startmm = getdvarint( @"hash_14743422cbaa5593", 0 );
            
            if ( startmm )
            {
                setdevdvar( @"hash_14743422cbaa5593", 0 );
                
                if ( !isdefined( level.var_c111bc9d2e9166a9 ) )
                {
                    level.var_ba534d680d3e177d = 1;
                }
                else
                {
                    level.var_ba534d680d3e177d = level.var_c111bc9d2e9166a9;
                }
                
                level.currentflagmsg = "<dev string:x7b9>";
                utility::flag_set( "<dev string:x7c9>" );
            }
            
            endxcam = getdvarint( @"hash_51ac823f87aca451", 0 );
            
            if ( endxcam )
            {
                setdevdvar( @"hash_51ac823f87aca451", 0 );
                end_current_xcam();
            }
            
            wait 1;
        }
    }

#/
