#using scripts\common\ai;
#using scripts\common\ai_lookat;
#using scripts\common\anim;
#using scripts\common\callbacks;
#using scripts\common\notetrack;
#using scripts\common\scene;
#using scripts\common\scene_debug;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\visibility_mode;
#using scripts\common\weapon;
#using scripts\engine\utility;

#namespace scene;

// Namespace scene
// Params 0, eflags: 0x5
// Checksum 0xc66b70fd, Offset: 0x11cc
// Size: 0xd1
function private autoexec function_852d3e27a342a948()
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515" ) )
        {
            return;
        }
        
        thread scene_debug::function_194590af69906dd3();
    #/
    
    setdvarifuninitialized( @"hash_4eff5e73bc4ee422", 1 );
    
    if ( isinfrontend() )
    {
        return;
    }
    
    scenebundles = getscriptbundlenames( "scenescriptbundle" );
    
    foreach ( scenescriptbundle in scenebundles )
    {
        scenescriptbundle = getscriptbundle( scenescriptbundle );
        scenescriptbundle function_8666fb2470ee0b61();
        
        if ( isdefined( scenescriptbundle ) )
        {
            scenescriptbundle function_8ac744fc3e7dee();
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x1890a012, Offset: 0x12a5
// Size: 0x532
function private function_9faf48fca9716acd()
{
    if ( !isdefined( level.scene ) )
    {
        level.scene = spawnstruct();
    }
    
    level.scene.prestreamtime = 2;
    
    if ( !isdefined( level.scene.fnsceneplay ) )
    {
        level.scene.fnsceneplay = &play;
    }
    
    if ( !isdefined( level.scene.modehandlers ) )
    {
        level.scene.modehandlers = [];
        
        if ( level.gametypebundle.var_a6d8281234bcca0c )
        {
            function_8eae84e23a4f5614( "modePlayerSkip", &function_1dcd5307e18e1464 );
        }
        else
        {
            function_8eae84e23a4f5614( "modePlayerSkip", &player_scene_play_wait_skip );
        }
    }
    
    if ( !isdefined( level.scene.objecthandlers ) )
    {
        level.scene.objecthandlers = [];
        function_3a06b41e384fbf58( "Types_Object", "objectSpawn", &object_spawn );
        function_3a06b41e384fbf58( "Types_Object", "objectSetup", &object_setup );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectPrepare", &function_90aaff2103125c26 );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectSetup", &function_8207af582343cc24 );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectLinkSetup", &function_240bf4f132c66497 );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectFirstFrame", &function_dee587549ec427a2 );
        function_3a06b41e384fbf58( "Types_Object", "objectMatchEntity", &function_9fb3f4e85f34d87b );
        function_3a06b41e384fbf58( "Types_Object", "objectGetAnimEntity", &function_15e572f4ed82dd1c );
        function_3a06b41e384fbf58( "Types_Object", "objectGetLinkEnts", &function_f2fb9eed776f75ff );
        function_3a06b41e384fbf58( "Types_Object", "objectGetAnimRoot", &function_de784fc1d0ea14bf );
        function_3a06b41e384fbf58( "Types_Object", "objectTeleport", &object_teleport );
        function_3a06b41e384fbf58( "Types_Object", "objectVelocity", &object_velocity );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectPlayAnim", &object_play_anim );
        function_3a06b41e384fbf58( "Types_Object", "objectWaitNotes", &function_26364b7b16eb9611 );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectStopAnim", &function_2d0d8b2ed2c4709a );
        function_3a06b41e384fbf58( "Types_Object", "shotObjectCleanup", &function_5a563c79ceb8a795 );
        function_3a06b41e384fbf58( "Types_Object", "objectCleanup", &object_cleanup );
        function_3a06b41e384fbf58( "Types_Object", "objectDelete", &object_delete );
        function_3a06b41e384fbf58( "Types_Object", "objectKill", &object_kill );
        function_3a06b41e384fbf58( "Types_Vehicle", "objectSpawn", &function_6f17a7d85a11f168 );
        function_3a06b41e384fbf58( "Types_Vehicle", "shotObjectSetup", &function_247fd4fdf1e19551 );
        function_3a06b41e384fbf58( "Types_Vehicle", "objectMatchEntity", &function_20b1309c9e58e1e6 );
        function_3a06b41e384fbf58( "Types_Vehicle", "shotObjectStopAnim", &function_94c7074995321b81 );
        function_3a06b41e384fbf58( "Types_ClientChar", "objectSpawn", &function_7624a82cebcf9c61 );
        function_3a06b41e384fbf58( "Types_ClientChar", "objectSetAnimName", &function_2535ce3d8e09fa05 );
        function_3a06b41e384fbf58( "Types_ClientChar", "objectMatchEntity", &function_dd0009340cb25d87 );
        function_3a06b41e384fbf58( "Types_ClientChar", "shotObjectPlayAnim", &function_27be1a15599d865c );
        function_3a06b41e384fbf58( "Types_ClientChar", "shotObjectStopAnim", &function_4450d8e5e58a15fe );
        function_3a06b41e384fbf58( "Types_ClientChar", "objectTeleport", &function_8831768043b7d8dd );
        function_3a06b41e384fbf58( "Types_ClientChar", "shotObjectLinkAnim", &function_9ef66aebc21d7192 );
        function_3a06b41e384fbf58( "Types_Mayhem", "objectSpawn", &mayhem_spawn );
        function_3a06b41e384fbf58( "Types_Mayhem", "shotObjectSetup", &function_fc408f57f842ae );
        function_3a06b41e384fbf58( "Types_Mayhem", "shotObjectFirstFrame", &function_33db5df1418bb6c8 );
        function_3a06b41e384fbf58( "Types_Mayhem", "shotObjectPlayAnim", &function_8f7ba32b21c24c7e );
        function_3a06b41e384fbf58( "Types_Mayhem", "shotObjectStopAnim", &function_4f1730d1da8c5710 );
        function_3a06b41e384fbf58( "Types_Mayhem", "objectDelete", &mayhem_delete );
        function_3a06b41e384fbf58( "Types_XCam", "objectSpawn", &xcam_spawn );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectSetup", &function_e770a2937db5fd28 );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectCleanup", &function_ce4a84e6cdf6ee71 );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectFirstFrame", &function_b73062822847941e );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectPreStream", &function_524845ca311375cd );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectPlayAnim", &function_fbd4860eebc2ba8c );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectSkipAnim", &function_a2ff48defd65ed33 );
        function_3a06b41e384fbf58( "Types_XCam", "shotObjectStopAnim", &function_ff81a969d869304e );
        function_3a06b41e384fbf58( "Types_XCam", "objectDelete", &xcam_delete );
        function_3a06b41e384fbf58( "Types_XCam", "objectMatchEntity", &function_78150143df380fd7 );
        function_3a06b41e384fbf58( "Types_XCam", "objectCleanup", &xcam_cleanup );
        function_3a06b41e384fbf58( "Types_XCam", "objectParticipatingCinematics", &function_5f31e9fc1b086d5f );
        function_3a06b41e384fbf58( "Types_Prop", "objectSpawn", &function_a881bacbb6969065 );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x316c14cf, Offset: 0x17df
// Size: 0xd1
function private function_dc6ad1d9a0057d1c( str_flag )
{
    utility::flag_wait( str_flag );
    
    foreach ( s_scene in level.var_8b929db1c0421d07 )
    {
        if ( isdefined( s_scene.spawnflags ) )
        {
            if ( ( s_scene.spawnflags & 2 ) == 2 )
            {
                s_scene thread play();
                continue;
            }
            
            if ( ( s_scene.spawnflags & 1 ) == 1 )
            {
                s_scene thread init();
            }
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xa3f4efd5, Offset: 0x18b8
// Size: 0x36
function private function_24d710698a8bf244()
{
    sceneroot = self;
    function_9faf48fca9716acd();
    
    if ( isdefined( sceneroot.scenestatic ) )
    {
        return;
    }
    
    sceneroot.scenestatic = spawnstruct();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x8c4778f8, Offset: 0x18f6
// Size: 0x35d
function private function_b4cfd3b6e6f6987d()
{
    sceneroot = self;
    
    if ( !isdefined( sceneroot ) )
    {
        return;
    }
    
    function_9faf48fca9716acd();
    
    if ( isdefined( sceneroot.scenedata ) && sceneroot.scenedata.state != "NotInit" )
    {
        return isdefined( sceneroot.scenedata.scenescriptbundle );
    }
    
    scenedata = spawnstruct();
    sceneroot.scenedata = scenedata;
    scenedata.sceneroot = sceneroot;
    
    /#
        sceneroot scene_debug::register();
    #/
    
    scenedata.state = "NotSetup";
    scenedata.sceneplay = [];
    scenedata.scenescriptbundle = sceneroot scene_scriptbundle();
    scenedata.sceneobjectdata = [];
    scenedata.var_f6e1a451af0a2b43 = [];
    
    if ( !isdefined( scenedata.scenescriptbundle ) )
    {
        /#
            scriptbundlename = sceneroot function_baebb0795b75d9ca();
            
            if ( isdefined( scriptbundlename ) )
            {
                println( "<dev string:x24>" + getxhashsourcename( scriptbundlename ) + "<dev string:x53>" );
            }
        #/
        
        return 0;
    }
    
    scenedata.scenescriptbundle function_8666fb2470ee0b61();
    objectcount = scenedata.scenescriptbundle function_bd663a9606d90ac1();
    
    for ( objectindex = 0; objectindex < objectcount ; objectindex++ )
    {
        sceneobjectdata = spawnstruct();
        scenedata.sceneobjectdata[ objectindex ] = sceneobjectdata;
        sceneobjectdata.index = objectindex;
        sceneobjectdata.sceneroot = sceneroot;
        sceneobjectdata.sceneplay = undefined;
        sceneobjectdata.scenedata = scenedata;
        sceneobjectdata.sceneobject = scenedata.scenescriptbundle function_45cf04bf56228582( objectindex );
        sceneobjectdata.functable = level.scene.var_503e815140d769a6[ sceneobjectdata.sceneobject function_827f7d9bd7a46afd() ];
        sceneobjectdata.entity = undefined;
        sceneobjectdata.existingentity = undefined;
        sceneobjectdata.active = undefined;
        sceneobjectdata.var_caa911de855ae014 = undefined;
        sceneobjectdata.animtreeprevious = undefined;
        sceneobjectdata.activeanimationtype = undefined;
        sceneobjectdata.activeanimation = undefined;
        sceneobjectdata.activeanimationplaying = undefined;
        sceneobjectdata.var_2d749d02fccaab1 = undefined;
        sceneobjectdata.playbacksuccessful = undefined;
        sceneobjectdata.alignmentinfo = undefined;
        sceneobjectdata.issetup = undefined;
        sceneobjectdata.linkedtag = undefined;
        sceneobjectdata.xcamplaying = undefined;
        sceneobjectdata.alignmentinfo = undefined;
        sceneobjectdata.mayhemname = undefined;
        sceneobjectdata.pausestate = undefined;
        hasanimations = sceneobjectdata.sceneobject function_b1e1b14a9d31f8a6();
        sceneobjectdata.nonvisible = sceneobjectdata function_9a1b14ef2ca6596f() ? 1 : undefined;
        sceneobjectdata.notanimated = hasanimations.size == 0 ? 1 : undefined;
        sceneobjectdata.var_7b6f3f539c4ce1da = !hasanimations[ "DeltaAnimation" ] ? 1 : undefined;
        scenedata.var_f6e1a451af0a2b43[ sceneobjectdata.sceneobject function_e8fb13f70b9a4db6() ] = objectindex;
    }
    
    return 1;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xb63f4191, Offset: 0x1c5c
// Size: 0x32
function private function_d7e70c3295257a7()
{
    sceneroot = self;
    waittillframeend();
    
    if ( function_9ff5a5ba55728756() )
    {
        return;
    }
    
    if ( sceneroot get_state() == "Stopped" )
    {
        sceneroot scene_reset();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xddd7de77, Offset: 0x1c96
// Size: 0x10e
function private scene_reset()
{
    sceneroot = self;
    state = sceneroot get_state();
    
    if ( state == "NotInit" || state == "NotSetup" )
    {
        return;
    }
    
    if ( state == "Playing" )
    {
        sceneroot stop();
    }
    
    if ( isdefined( sceneroot.scenedata ) )
    {
        for ( sceneobjectindex = 0; sceneobjectindex < sceneroot.scenedata.sceneobjectdata.size ; sceneobjectindex++ )
        {
            sceneobjectdata = sceneroot.scenedata.sceneobjectdata[ sceneobjectindex ];
            
            if ( isdefined( sceneobjectdata ) && isdefined( sceneobjectdata.entity ) )
            {
                sceneobjectdata object_cleanup();
            }
        }
    }
    
    sceneroot function_902aff781fb98f0f( "NotSetup" );
    
    if ( isdefined( sceneroot.scenedata ) && sceneroot.scenedata.scenescriptbundle function_cf08117a77afbc1e() )
    {
        sceneroot cleanup();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x8b4de25, Offset: 0x1dac
// Size: 0x35
function private function_534c5ebe7d240503()
{
    sceneroot = self;
    scenescriptbundle = sceneroot scene_scriptbundle();
    
    if ( isdefined( scenescriptbundle ) )
    {
        return scenescriptbundle function_cf6d109b139cfdbf();
    }
    
    return 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2737937, Offset: 0x1de9
// Size: 0x29
function private function_de0c3faf7f92b366()
{
    sceneroot = self;
    scenescriptbundle = sceneroot scene_scriptbundle();
    return scenescriptbundle function_2ae71d4375525d5a();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xad823810, Offset: 0x1e1b
// Size: 0x29
function private function_78308b2c7baaf7ee()
{
    sceneroot = self;
    scenescriptbundle = sceneroot scene_scriptbundle();
    return scenescriptbundle function_c7c350c8df3d0e0a();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xc263476a, Offset: 0x1e4d
// Size: 0x17f
function private function_d1bb58bd28875f50()
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    var_79b71dd6eb150719 = [];
    
    if ( !isdefined( scenedata ) )
    {
        return var_79b71dd6eb150719;
    }
    
    foreach ( sceneobjectdata in scenedata.sceneobjectdata )
    {
        if ( isplayer( sceneobjectdata.entity ) )
        {
            var_79b71dd6eb150719[ sceneobjectdata.entity getentitynumber() ] = sceneobjectdata.entity;
            continue;
        }
        
        if ( sceneobjectdata.sceneobject.variant_type === "Types_XCam" )
        {
            var_2edb20fbedfb0fdc = sceneobjectdata function_931d12df9abebc7f();
            
            foreach ( player in var_2edb20fbedfb0fdc )
            {
                var_79b71dd6eb150719[ player getentitynumber() ] = player;
            }
        }
    }
    
    return var_79b71dd6eb150719;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xc230a85c, Offset: 0x1fd5
// Size: 0xa2
function private function_5d3c9762c4e7799()
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    animrate = undefined;
    
    if ( isdefined( sceneroot.scenestatic ) )
    {
        animrate = sceneroot.scenestatic.animrate;
    }
    
    if ( !isdefined( scenedata ) )
    {
        return;
    }
    
    for ( sceneobjectindex = 0; sceneobjectindex < scenedata.sceneobjectdata.size ; sceneobjectindex++ )
    {
        sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
        sceneobjectdata function_909c00577c56aa35( animrate );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x5f183152, Offset: 0x207f
// Size: 0x1ce
function private function_c17d9607a8faffc3( var_737cff255011346c )
{
    sceneroot = self;
    scenestatic = sceneroot.scenestatic;
    
    if ( !isdefined( var_737cff255011346c ) )
    {
        return;
    }
    
    scriptbundlename = sceneroot function_baebb0795b75d9ca();
    
    if ( !isdefined( scriptbundlename ) )
    {
        return;
    }
    
    if ( isdefined( level.scene.funcs[ scriptbundlename ] ) && isdefined( level.scene.funcs ) && isdefined( level.scene.funcs[ scriptbundlename ][ var_737cff255011346c ] ) )
    {
        foreach ( func in level.scene.funcs[ scriptbundlename ][ var_737cff255011346c ] )
        {
            sceneroot thread [[ func ]]();
        }
    }
    
    if ( isdefined( scenestatic.funcs[ scriptbundlename ] ) && isdefined( scenestatic.funcs ) && isdefined( scenestatic ) && isdefined( scenestatic.funcs[ scriptbundlename ][ var_737cff255011346c ] ) )
    {
        foreach ( func in scenestatic.funcs[ scriptbundlename ][ var_737cff255011346c ] )
        {
            sceneroot thread [[ func ]]();
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe13f5e3, Offset: 0x2255
// Size: 0x12a
function private function_4b5fdbefe3851660( var_efe6d0277f731e05 )
{
    sceneroot = self;
    shotindexes = var_efe6d0277f731e05;
    
    if ( isdefined( shotindexes ) )
    {
        scenescriptbundle = sceneroot scene_scriptbundle();
        shotcount = scenescriptbundle function_30fd977cf5a4a95e();
        
        if ( !isarray( shotindexes ) )
        {
            shotindexes = [ shotindexes ];
        }
        
        for ( i = 0; i < shotindexes.size ; i++ )
        {
            shotindex = shotindexes[ i ];
            
            if ( isdefined( shotindex ) && !isint( shotindex ) )
            {
                shotindexes[ i ] = -1;
                
                for ( checkshotindex = 0; checkshotindex < shotcount ; checkshotindex++ )
                {
                    shot = scenescriptbundle function_6404fde3adf1f642( checkshotindex );
                    shotname = shot function_31132eddb426e3fd();
                    
                    if ( shotname == shotindex )
                    {
                        shotindexes[ i ] = checkshotindex;
                        break;
                    }
                }
            }
        }
    }
    else
    {
        shotindexes = [];
        shotcount = sceneroot.scenedata.scenescriptbundle function_30fd977cf5a4a95e();
        
        for ( shotindex = 0; shotindex < shotcount ; shotindex++ )
        {
            shotindexes[ shotindexes.size ] = shotindex;
        }
    }
    
    return shotindexes;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x132d1d00, Offset: 0x2388
// Size: 0xbf
function private function_a446556e2efa8a4e( shotindices )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    scenescriptbundle = sceneroot scene_scriptbundle();
    shotcount = scenescriptbundle function_30fd977cf5a4a95e();
    
    if ( !isarray( shotindices ) )
    {
        shotindices = [ shotindices ];
    }
    
    result = getxhash( "SSK" );
    
    for ( i = 0; i < shotindices.size ; i++ )
    {
        shotindex = shotindices[ i ];
        assert( isint( shotindex ) );
        result = hashcat( result, "_" + shotindex );
    }
    
    return result;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x197684b4, Offset: 0x2450
// Size: 0x194
function private function_42248a6e028ecfa2( shotnames, var_d2c07a25a9a590c )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    shotindices = sceneroot function_4b5fdbefe3851660( shotnames );
    sequencekey = sceneroot function_a446556e2efa8a4e( shotindices );
    
    if ( isdefined( scenedata.sceneplay[ sequencekey ] ) )
    {
        return scenedata.sceneplay[ sequencekey ];
    }
    
    if ( !var_d2c07a25a9a590c )
    {
        return undefined;
    }
    
    sceneplay = spawnstruct();
    sceneplay.sceneroot = sceneroot;
    sceneplay.var_eb6d7fbdd0bb47f8 = [];
    sceneplay.shotindices = shotindices;
    sceneplay.shotindicesindex = undefined;
    sceneplay.var_ec8b7af923c063a9 = shotnames;
    
    for ( shotindex = 0; shotindex < shotindices.size ; shotindex++ )
    {
        var_fb9b282f30ab6dfd = shotindices[ shotindex ];
        shot = scenedata.scenescriptbundle function_6404fde3adf1f642( var_fb9b282f30ab6dfd );
        
        if ( isdefined( shot ) && !shot function_22dbcb174ae164e7() )
        {
            sceneplay.var_eb6d7fbdd0bb47f8[ sceneplay.var_eb6d7fbdd0bb47f8.size ] = var_fb9b282f30ab6dfd;
        }
    }
    
    if ( isdefined( sceneplay.var_eb6d7fbdd0bb47f8[ 0 ] ) )
    {
        sceneplay.shotinit = sceneplay.var_eb6d7fbdd0bb47f8[ 0 ];
    }
    else
    {
        sceneplay.shotinit = 0;
    }
    
    scenedata.sceneplay[ sequencekey ] = sceneplay;
    return sceneplay;
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xc4153075, Offset: 0x25ed
// Size: 0x18a
function private scene_coordinated_reach( sceneplay, shotindex, speed_baseline, guy_anim )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneplay notify( "scene_coordinated_reach" );
    sceneplay endon( "scene_coordinated_reach" );
    
    if ( isdefined( sceneplay.currentshotreachspeed ) )
    {
        sceneplay.currentshotreachspeed = min( sceneplay.currentshotreachspeed, speed_baseline );
    }
    else
    {
        sceneplay.currentshotreachspeed = speed_baseline;
    }
    
    if ( !isdefined( sceneplay.var_3a7c353d808dda66 ) )
    {
        sceneplay.var_3a7c353d808dda66 = [];
    }
    
    sceneplay.var_3a7c353d808dda66[ sceneplay.var_3a7c353d808dda66.size ] = guy_anim;
    waittillframeend();
    sceneroot animation::function_91a1da37e0f88ea8( sceneplay.var_3a7c353d808dda66, sceneplay.currentshotreachspeed );
    
    foreach ( guy_anim in sceneplay.var_3a7c353d808dda66 )
    {
        guy = guy_anim[ 0 ];
        
        if ( isdefined( guy ) )
        {
            guy notify( "scene_coordinated_reach" );
        }
    }
    
    sceneplay.var_3a7c353d808dda66 = undefined;
    sceneplay.currentshotreachspeed = undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x48ba4046, Offset: 0x277f
// Size: 0x153
function private function_a792a1f58632796b( arrivaltypegdt )
{
    if ( !isdefined( level.var_7dc9218ae5d2578a ) )
    {
        level.var_7dc9218ae5d2578a = [];
        level.var_7dc9218ae5d2578a[ "Exposed" ] = "Exposed";
        level.var_7dc9218ae5d2578a[ "ExposedMoving" ] = "Exposed Moving";
        level.var_7dc9218ae5d2578a[ "ExposedCrouch" ] = "Exposed Crouch";
        level.var_7dc9218ae5d2578a[ "CoverCrouch" ] = "Cover Crouch";
        level.var_7dc9218ae5d2578a[ "CoverStand" ] = "Cover Stand";
        level.var_7dc9218ae5d2578a[ "CoverProne" ] = "Cover Prone";
        level.var_7dc9218ae5d2578a[ "CoverLeft" ] = "Cover Left";
        level.var_7dc9218ae5d2578a[ "CoverLeftCrouch" ] = "Cover Left Crouch";
        level.var_7dc9218ae5d2578a[ "CoverRight" ] = "Cover Right";
        level.var_7dc9218ae5d2578a[ "CoverRightCrouch" ] = "Cover Right Crouch";
        level.var_7dc9218ae5d2578a[ "CoverCrouchLMG" ] = "Cover Crouch LMG";
        level.var_7dc9218ae5d2578a[ "CoverStandLMG" ] = "Cover Stand LMG";
    }
    
    if ( !isdefined( level.var_7dc9218ae5d2578a[ arrivaltypegdt ] ) )
    {
        println( "<dev string:x58>" + arrivaltypegdt );
        return "Exposed";
    }
    
    return level.var_7dc9218ae5d2578a[ arrivaltypegdt ];
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xe3c91ba8, Offset: 0x28db
// Size: 0x12a
function private reach_speed( demeanor, locomotion )
{
    speed_baseline = 225;
    
    switch ( demeanor )
    {
        case #"hash_186d745a92c317d9":
            speed_baseline = 53;
            break;
        case #"hash_9128327eb51e0b7b":
            speed_baseline = 48;
            break;
        case #"hash_46fdaf04e9be63e4":
            speed_baseline = 75;
            break;
        case #"hash_d320ccf96c495f71":
            speed_baseline = 47;
            break;
        case #"hash_1a53266c17b7d481":
        case #"hash_9a93c307fd4015ae":
        case #"hash_9e02cd4a0f3ca981":
        case #"hash_a7db48ba68421306":
            if ( locomotion == "sprint" )
            {
                speed_baseline = 225;
            }
            else
            {
                speed_baseline = 140;
            }
            
            break;
        case #"hash_eb06fed69a41dab5":
            speed_baseline = 225;
            break;
    }
    
    if ( demeanor != "patrol" && demeanor != "alert" )
    {
        switch ( locomotion )
        {
            case #"hash_bdea5e7441323370":
                speed_baseline *= 0.5;
                break;
            case #"hash_5c7fca6c3a403003":
                speed_baseline *= 0.75;
                break;
        }
    }
    
    return speed_baseline;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x7ea4b2d8, Offset: 0x2a0e
// Size: 0x30
function private function_4b100730bcea788()
{
    sceneplay = self;
    typefunc = function_ecb3770041e3e379( "modeStartMonitoringPlayers" );
    
    if ( isdefined( typefunc ) )
    {
        sceneplay thread [[ typefunc ]]();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xd7a12cdd, Offset: 0x2a46
// Size: 0x30
function private function_ca4b8bd505800128()
{
    sceneplay = self;
    typefunc = function_ecb3770041e3e379( "modeStopMonitoringPlayers" );
    
    if ( isdefined( typefunc ) )
    {
        sceneplay [[ typefunc ]]();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe69f9c11, Offset: 0x2a7e
// Size: 0x25
function private function_e4f8202c937ebe9()
{
    typefunc = function_ecb3770041e3e379( "modeXCamRespectsStartingTimeOnClients" );
    
    if ( isdefined( typefunc ) )
    {
        return [[ typefunc ]]();
    }
    
    return 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x955413ee, Offset: 0x2aac
// Size: 0x36, Type: bool
function private function_68d2c57d9f9e8a7e()
{
    sceneobjectdata = self;
    return sceneobjectdata.sceneobject.variant_object.playerlinktag ?? "tag_player";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x5f0eb8ed, Offset: 0x2aeb
// Size: 0x2f, Type: bool
function private function_70903a2d7e1583c7()
{
    sceneobjectdata = self;
    return istrue( sceneobjectdata.sceneobject.variant_object.allowusability );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xdbeed122, Offset: 0x2b23
// Size: 0x2f, Type: bool
function private function_58b62b656cb29e76()
{
    sceneobjectdata = self;
    return istrue( sceneobjectdata.sceneobject.variant_object.isfemale );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x6a1b1fd2, Offset: 0x2b5b
// Size: 0x5c
function private function_f43455d85847000( entity, sceneobjectdata )
{
    if ( !isdefined( entity ) )
    {
        return 0;
    }
    
    if ( sceneobjectdata.scenedata.var_3bb93b020e59c4de )
    {
        typefunc = function_ecb3770041e3e379( "modePlayerMatchingObjectForFemale" );
        
        if ( isdefined( typefunc ) )
        {
            return [[ typefunc ]]( entity, sceneobjectdata );
        }
    }
    
    return 1;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x3d0ae042, Offset: 0x2bc0
// Size: 0x169
function private function_2b6fe9f287188c01()
{
    sceneobjectdata = self;
    
    if ( isplayer( sceneobjectdata.entity ) )
    {
        curweapon = sceneobjectdata.entity getcurrentprimaryweapon();
        
        if ( !isdefined( curweapon ) )
        {
            curweapon = sceneobjectdata.entity.primaryweaponobj;
        }
        else if ( isnullweapon( curweapon ) )
        {
            curweapon = sceneobjectdata.entity.primaryweaponobj;
        }
        
        if ( isdefined( curweapon ) && !isnullweapon( curweapon ) )
        {
            weaponclass = weaponclass( curweapon.basename );
            weapontype = weapontype( curweapon.basename );
            
            if ( weapontype == "riotshield" )
            {
                return "";
            }
            
            ismeleeonly = istrue( curweapon.ismelee );
            
            if ( ismeleeonly )
            {
                return "Knife";
            }
            
            islauncher = weaponclass == "rocketlauncher";
            
            if ( islauncher )
            {
                return "Launcher";
            }
            
            ispistol = weaponclass == "pistol";
            
            if ( ispistol )
            {
                return "Pistol";
            }
            
            isshotgun = weaponclass == "spread";
            
            if ( isshotgun )
            {
                return "Shotgun";
            }
            
            issniper = weaponclass == "sniper";
            
            if ( issniper )
            {
                return "Sniper";
            }
        }
    }
    
    return "";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x3ab3a58f, Offset: 0x2d32
// Size: 0x2f, Type: bool
function private function_f0e8d8f1099045cc()
{
    sceneobjectdata = self;
    return istrue( sceneobjectdata.sceneobject.variant_object.var_3ae2d0f5046fd077 );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x90515c77, Offset: 0x2d6a
// Size: 0xe2
function private function_a3f6bcdd044bde4a( shotindex )
{
    sceneobjectdata = self;
    var_734783cad6a0b52d = [ "melee", "sprint", "allow_jump", "mantle" ];
    
    if ( !sceneobjectdata function_70903a2d7e1583c7() )
    {
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "usability";
    }
    
    if ( sceneobjectdata.sceneobject function_3c6fe393ccd02d3c( shotindex ) != "Keep" )
    {
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "weapon";
    }
    
    if ( !sceneobjectdata.sceneobject function_96ce751feb7dd9c9( shotindex ) )
    {
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "weapon_switch";
    }
    
    if ( !sceneobjectdata.sceneobject function_b978488b0468bee7( shotindex ) )
    {
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "offhand_weapons";
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "offhand_primary_weapons";
        var_734783cad6a0b52d[ var_734783cad6a0b52d.size ] = "offhand_secondary_weapons";
    }
    
    return var_734783cad6a0b52d;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x7797eac, Offset: 0x2e55
// Size: 0x54, Type: bool
function private function_627f3dc4b23c76c3( shotindex )
{
    sceneobjectdata = self;
    shotobject = sceneobjectdata.sceneobject.variant_object.shots[ shotindex ];
    return shotobject.playernoteleport ?? 0;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x2e2a7367, Offset: 0x2eb2
// Size: 0x42
function private function_f6d96a431ef86a5( enabled, lerptime = 0 )
{
    assert( isplayer( self ) );
    player = self;
    player utility::letterbox_enable( enabled, lerptime );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xd35601ed, Offset: 0x2efc
// Size: 0x9c
function private function_367943e54489cb93( tweenout, duration, hidemodel, stopxcam )
{
    assert( isplayer( self ) );
    player = self;
    
    if ( !isdefined( hidemodel ) || hidemodel )
    {
        player val::set( "scene_scene_xcam", "fire", 0 );
        player thread utility::delaythreadendon( duration + level.framedurationseconds, "disconnect", &val::reset, "scene_scene_xcam", "fire" );
    }
    
    player startcameratween( duration, hidemodel, "ease_inout_sine", 0, stopxcam );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x5866ea9b, Offset: 0x2fa0
// Size: 0xb6
function private function_335a5029491c4471()
{
    sceneplay = self;
    scenescriptbundle = sceneplay.sceneroot scene_scriptbundle();
    result = [];
    
    foreach ( shotindex in sceneplay.var_eb6d7fbdd0bb47f8 )
    {
        result[ result.size ] = scenescriptbundle function_d74f9d413aca8704( shotindex );
    }
    
    return result;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x58340b8, Offset: 0x305f
// Size: 0x28c
function private function_69e565b8af8a06a2( shotindex )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        if ( isdefined( scenedata ) && isdefined( var_1d42c5b8ad0adc80[ shotindex ] ) )
        {
            sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
            sceneobjectdata.alignmentinfo = scenedata.scenescriptbundle function_83bfd4c94b262c65( sceneroot, shotindex, sceneobjectindex, sceneobjectdata.alignmentinfo );
        }
    }
    
    sceneplay.objectorder = [];
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        addorder = [];
        
        for ( var_6660094668730fde = sceneobjectindex; isdefined( var_6660094668730fde ) && isdefined( scenedata.sceneobjectdata[ var_6660094668730fde ] ) && !isdefined( sceneplay.objectorder[ var_6660094668730fde ] ) ; var_6660094668730fde = undefined )
        {
            addorder[ addorder.size ] = var_6660094668730fde;
            
            if ( !isdefined( scenedata.sceneobjectdata[ var_6660094668730fde ].alignmentinfo ) )
            {
                scenedata.sceneobjectdata[ var_6660094668730fde ].alignmentinfo = scenedata.scenescriptbundle function_83bfd4c94b262c65( sceneroot, shotindex, sceneobjectindex );
            }
            
            nextindex = scenedata.sceneobjectdata[ var_6660094668730fde ].alignmentinfo.alignobjectindex;
            
            if ( isdefined( nextindex ) && nextindex != var_6660094668730fde )
            {
                var_6660094668730fde = nextindex;
                continue;
            }
        }
        
        for ( i = addorder.size - 1; i >= 0 ; i-- )
        {
            sceneplay.objectorder[ addorder[ i ] ] = sceneplay.var_caf7bc39e6b19dd5[ addorder[ i ] ];
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x102a4a7f, Offset: 0x32f3
// Size: 0x111
function private function_1d07da6ed2bd0f6b( isskipping )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.state = "Playing";
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
        
        if ( isdefined( sceneobjectdata ) )
        {
            sceneobjectdata.sceneplay = sceneplay;
            sceneobjectdata notify( "scene_play" );
        }
    }
    
    sceneplay notify( "scene_play" );
    
    if ( !isskipping )
    {
        sceneplay thread scene_play_wait_skip();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x72a43aa1, Offset: 0x340c
// Size: 0x1e3
function private scene_play_wait_skip()
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    
    if ( !sceneroot function_534c5ebe7d240503() )
    {
        return;
    }
    
    var_b68db5ad6fed6199 = utility::callsharedfunc( #"scene", #"hash_cb6e53ab5178b5a5", sceneroot, sceneplay );
    
    if ( isdefined( var_b68db5ad6fed6199 ) && !var_b68db5ad6fed6199 )
    {
        return;
    }
    
    var_d4d39ccecbff9143 = function_ecb3770041e3e379( "modePlayerSkip" );
    
    if ( !isdefined( var_d4d39ccecbff9143 ) )
    {
        return;
    }
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
        
        if ( isplayer( sceneobjectdata.entity ) )
        {
            sceneobjectdata.entity thread [[ var_d4d39ccecbff9143 ]]( sceneplay );
            continue;
        }
        
        if ( sceneobjectdata.sceneobject.variant_type === "Types_XCam" )
        {
            players = sceneobjectdata function_931d12df9abebc7f();
            
            foreach ( player in players )
            {
                player thread [[ var_d4d39ccecbff9143 ]]( sceneplay );
            }
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x46d572f8, Offset: 0x35f7
// Size: 0x121
function private function_495a812f7545da04( player, pos )
{
    sceneplay = self;
    assert( isplayer( player ) );
    assert( isvector( pos ) );
    clientnum = player getentitynumber();
    
    if ( !isdefined( sceneplay.prestream.players ) )
    {
        sceneplay.prestream.players = [];
    }
    
    if ( !isdefined( sceneplay.prestream.players[ clientnum ] ) )
    {
        sceneplay.prestream.players[ clientnum ] = spawnstruct();
    }
    
    playerinfo = sceneplay.prestream.players[ clientnum ];
    playerinfo.player = player;
    
    if ( !isdefined( playerinfo.cameraorigins ) )
    {
        playerinfo.cameraorigins = [];
    }
    
    playerinfo.cameraorigins[ playerinfo.cameraorigins.size ] = pos;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xd94e06ee, Offset: 0x3720
// Size: 0xe9
function private function_97739bae625d1f27( boolval )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    
    if ( isdefined( sceneroot ) )
    {
        scenedata = sceneroot.scenedata;
    }
    
    if ( !isdefined( scenedata ) )
    {
        return;
    }
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
        
        if ( isdefined( sceneobjectdata ) )
        {
            sceneobjectdata function_5f1315ff984eb193( boolval );
        }
    }
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x5e456820, Offset: 0x3811
// Size: 0x28c
function private function_edd2a6bcd2ce7fb9( timefromend = 0.5, fadeinouttime = 0.5, var_ec2444526e086a70 = 0, var_aaab39a49b11387e = 0 )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    state = sceneroot get_state();
    
    if ( state != "Playing" )
    {
        return;
    }
    
    var_79b71dd6eb150719 = sceneroot function_d1bb58bd28875f50();
    var_79b71dd6eb150719 = function_f943bef551ff028c( var_79b71dd6eb150719 );
    
    if ( fadeinouttime > 0 )
    {
        level notify( "scene_skip_fade_start" );
        
        foreach ( player in var_79b71dd6eb150719 )
        {
            player notify( "scene_skip_fade_start" );
            player thread utility::function_2d7d63e0a26cf67d( player, 1, fadeinouttime, undefined, "scene_skipping_fade" );
            player val::set( "scene_skipping", "show_hud", 0 );
            player val::set( "scene_skipping", "freezecontrols", 1 );
        }
        
        wait fadeinouttime;
        waitframe();
    }
    
    totalseconds = 0;
    
    foreach ( shotindex in sceneplay.var_eb6d7fbdd0bb47f8 )
    {
        totalseconds += sceneroot function_b38b94c97d1d44c6( sceneplay, shotindex );
    }
    
    if ( totalseconds <= 0 || timefromend >= totalseconds )
    {
        sceneplay thread function_a4845232f44c4b32( 0, var_79b71dd6eb150719, fadeinouttime, var_ec2444526e086a70 );
        return;
    }
    
    timefrac = ( totalseconds - timefromend ) / totalseconds;
    sceneplay function_4fbd928ce143468f( sceneplay.var_eb6d7fbdd0bb47f8, timefrac, var_aaab39a49b11387e );
    sceneroot function_b2fc5acea9f2c27f( undefined, sceneplay.var_ec8b7af923c063a9, undefined, timefrac, sceneplay.currentshot, var_aaab39a49b11387e );
    sceneplay thread function_a4845232f44c4b32( 1, var_79b71dd6eb150719, fadeinouttime, var_ec2444526e086a70 );
    sceneroot function_c17d9607a8faffc3( "callback_skipped" );
    sceneroot function_263a428cb3b06bb6();
}

// Namespace scene
// Params 4, eflags: 0xc
// Checksum 0x863f20d4, Offset: 0x3aa5
// Size: 0x28b
function private function_a4845232f44c4b32( skipped, var_79b71dd6eb150719, fadeinouttime, var_ec2444526e086a70 )
{
    self notify( "d235162957479cf3" );
    self endon( "d235162957479cf3" );
    assert( isthreaded() );
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    
    if ( !skipped && fadeinouttime > 0 )
    {
        foreach ( player in var_79b71dd6eb150719 )
        {
            player thread utility::function_2d7d63e0a26cf67d( player, 0, fadeinouttime, undefined, "scene_skipping_fade" );
        }
    }
    else if ( fadeinouttime > 0 )
    {
        utility::function_1b1f0962c505f82f( var_79b71dd6eb150719 );
        
        if ( isdefined( sceneroot.var_685ee97bdd7a6dda ) )
        {
            var_ec2444526e086a70 = sceneroot.var_685ee97bdd7a6dda;
        }
        
        if ( var_ec2444526e086a70 > 0 )
        {
            foreach ( player in var_79b71dd6eb150719 )
            {
                player utility::delaythread( var_ec2444526e086a70, &utility::function_2d7d63e0a26cf67d, player, 0, fadeinouttime, undefined, "scene_skipping_fade" );
            }
        }
        else
        {
            foreach ( player in var_79b71dd6eb150719 )
            {
                player thread utility::function_2d7d63e0a26cf67d( player, 0, fadeinouttime, undefined, "scene_skipping_fade" );
            }
        }
    }
    
    foreach ( player in var_79b71dd6eb150719 )
    {
        if ( !isplayer( player ) )
        {
            continue;
        }
        
        player val::reset_all( "scene_skipping" );
    }
}

// Namespace scene
// Params 1, eflags: 0xc
// Checksum 0xa5265712, Offset: 0x3d38
// Size: 0x101
function private player_scene_play_wait_skip( sceneplay )
{
    self notify( "aa2a04613c02f525" );
    self endon( "aa2a04613c02f525" );
    assert( isplayer( self ) );
    player = self;
    player endon( "death_or_disconnect" );
    sceneplay endon( "scene_stop" );
    sceneplay endon( "Stopped" );
    player setclientomnvar( "ui_is_bink_skippable", 1 );
    player.var_447f739b52f0598d = 1;
    
    while ( true )
    {
        player waittillmatch( "luinotifyserver", "skip_bink_input" );
        
        if ( sceneplay.state != "Playing" )
        {
            break;
        }
        
        player.var_447f739b52f0598d = undefined;
        player setclientomnvar( "ui_is_bink_skippable", 0 );
        sceneplay thread function_edd2a6bcd2ce7fb9( 0.5, 0.5, 0, !utility::issp() && getdvarint( @"hash_4eff5e73bc4ee422", 1 ) != 0 );
        return;
    }
    
    player.var_447f739b52f0598d = undefined;
    player setclientomnvar( "ui_is_bink_skippable", 0 );
}

// Namespace scene
// Params 1, eflags: 0xc
// Checksum 0xae8eab10, Offset: 0x3e41
// Size: 0x33
function private function_1dcd5307e18e1464( sceneplay )
{
    self notify( "657e83aaae87b2e" );
    self endon( "657e83aaae87b2e" );
    assert( isplayer( self ) );
    sceneplay thread function_df96e06deade3f76( self );
}

// Namespace scene
// Params 1, eflags: 0xc
// Checksum 0x1e3e0e10, Offset: 0x3e7c
// Size: 0x24b
function private function_df96e06deade3f76( player )
{
    self notify( "c7b57b068f265514" );
    self endon( "c7b57b068f265514" );
    assert( isplayer( player ) );
    sceneplay = self;
    sceneplay endon( "scene_skip_abort" );
    sceneplay thread function_f0da178eb06ccf2d( 0 );
    playersquadindex = player.sessionuimemberindex ?? 0;
    sceneplay.var_5a749a778d69d623[ playersquadindex ] = player;
    waittillframeend();
    
    foreach ( player in sceneplay.var_5a749a778d69d623 )
    {
        player utility::ent_flag_clear( "skip_bink_input" );
        player setclientomnvar( "ui_is_bink_skippable", 1 );
        player setclientomnvar( "ui_player_movie_state", 0 );
        player setclientomnvar( "ui_coop_bink_overlay_state", 4 );
        player.var_447f739b52f0598d = 1;
    }
    
    var_7c04fe39361cfd6b = 0;
    var_8eb50b495cebd4b6 = 0;
    
    while ( !var_7c04fe39361cfd6b && sceneplay.state == "Playing" )
    {
        var_7c04fe39361cfd6b = 1;
        
        foreach ( playersquadindex, player in sceneplay.var_5a749a778d69d623 )
        {
            var_3108f0e1472c57f4 = player utility::ent_flag( "skip_bink_input" );
            
            if ( var_3108f0e1472c57f4 )
            {
                var_8eb50b495cebd4b6 |= 1 << playersquadindex;
            }
            
            player setclientomnvar( "ui_player_movie_state", var_8eb50b495cebd4b6 );
            var_7c04fe39361cfd6b = var_7c04fe39361cfd6b && var_3108f0e1472c57f4;
        }
        
        waitframe();
    }
    
    sceneplay thread function_f0da178eb06ccf2d( 1 );
    
    if ( sceneplay.state == "Playing" )
    {
        sceneplay thread function_edd2a6bcd2ce7fb9( 0.5, 0.5, 0.5, !utility::issp() && getdvarint( @"hash_4eff5e73bc4ee422", 1 ) != 0 );
    }
}

// Namespace scene
// Params 1, eflags: 0xc
// Checksum 0x9c966129, Offset: 0x40cf
// Size: 0xf0
function private function_f0da178eb06ccf2d( var_4e636c6ba11fe16b )
{
    self notify( "34e6e46bdbce801e" );
    self endon( "34e6e46bdbce801e" );
    sceneplay = self;
    
    if ( !var_4e636c6ba11fe16b )
    {
        sceneplay utility::waittill_any( "scene_stop", "Stopped" );
        sceneplay notify( "scene_skip_abort" );
    }
    
    foreach ( player in sceneplay.var_5a749a778d69d623 )
    {
        player utility::ent_flag_clear( "skip_bink_input", 1 );
        player setclientomnvar( "ui_is_bink_skippable", 0 );
        player setclientomnvar( "ui_coop_bink_overlay_state", 0 );
        player.var_447f739b52f0598d = undefined;
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x3594f48a, Offset: 0x41c7
// Size: 0x84
function private function_4fbd928ce143468f( var_eb6d7fbdd0bb47f8, fromtimefrac = 0, var_aaab39a49b11387e = 0 )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    sceneplay.var_a173fd36d9f698cb = undefined;
    
    if ( !isdefined( fromtimefrac ) || fromtimefrac == 0 )
    {
        return;
    }
    
    sceneplay.var_a173fd36d9f698cb = sceneplay function_5dd68723df85d7bb( var_eb6d7fbdd0bb47f8, fromtimefrac, undefined, var_aaab39a49b11387e );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x886151e0, Offset: 0x4253
// Size: 0x262
function private function_5dd68723df85d7bb( var_eb6d7fbdd0bb47f8, fromtimefrac = 0, includeshotanimations = 0, var_aaab39a49b11387e = 0 )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    var_a173fd36d9f698cb = spawnstruct();
    var_a173fd36d9f698cb.fromtimefrac = clamp( fromtimefrac, 0, 1 );
    var_a173fd36d9f698cb.totaltimesec = 0;
    var_a173fd36d9f698cb.shottimeinfo = [];
    var_a173fd36d9f698cb.var_aaab39a49b11387e = var_aaab39a49b11387e;
    
    foreach ( shotindex in var_eb6d7fbdd0bb47f8 )
    {
        shottimeinfo = spawnstruct();
        shottimeinfo.startsec = var_a173fd36d9f698cb.totaltimesec;
        shottimeinfo.durationsec = sceneroot function_b38b94c97d1d44c6( sceneplay, shotindex );
        var_a173fd36d9f698cb.shottimeinfo[ shotindex ] = shottimeinfo;
        var_a173fd36d9f698cb.totaltimesec += shottimeinfo.durationsec;
        
        if ( includeshotanimations && isdefined( sceneplay.var_caf7bc39e6b19dd5[ shotindex ] ) )
        {
            shottimeinfo.objectanimtimes = [];
            
            for ( i = 0; i < sceneplay.var_caf7bc39e6b19dd5[ shotindex ].size ; i++ )
            {
                sceneobjectindex = sceneplay.var_caf7bc39e6b19dd5[ shotindex ][ i ];
                
                if ( !isdefined( sceneobjectindex ) )
                {
                    continue;
                }
                
                shottimeinfo.objectanimtimes[ sceneobjectindex ] = spawnstruct();
                sceneroot function_6ec994d609cfec6d( sceneplay, shotindex, sceneobjectindex, shottimeinfo.objectanimtimes[ sceneobjectindex ] );
            }
        }
    }
    
    var_a173fd36d9f698cb.fromtimesec = var_a173fd36d9f698cb.totaltimesec * var_a173fd36d9f698cb.fromtimefrac;
    return var_a173fd36d9f698cb;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x6aaf5dd1, Offset: 0x44be
// Size: 0xdf
function private function_72c1490d8adfba34( pausestate )
{
    sceneplay = self;
    
    if ( sceneplay.state != "Playing" )
    {
        return;
    }
    
    scenedata = sceneplay.sceneroot.scenedata;
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.var_caf7bc39e6b19dd5 )
    {
        sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
        sceneobjectdata object_pause( pausestate );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x5414e81b, Offset: 0x45a5
// Size: 0x167
function private function_7c2ba4cf9486f648( shotindex )
{
    scenedata = self;
    var_a11daf0a3d76391c = scenedata.sceneroot.scenestatic.exclusiveplayers ?? level.players;
    
    if ( scenedata.sceneroot.scenestatic.var_bc227a74d38bdd36 == 0 )
    {
        return;
    }
    
    foreach ( player in var_a11daf0a3d76391c )
    {
        if ( isdefined( player ) )
        {
            player setclientomnvar( "ui_scene_shot_index", shotindex );
        }
    }
    
    wait 0.5;
    
    foreach ( player in var_a11daf0a3d76391c )
    {
        if ( isdefined( player ) )
        {
            player setclientomnvar( "ui_scene_shot_index", -1 );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x1df53470, Offset: 0x4714
// Size: 0x3d2
function private function_962847dd6f8bf33e( sceneplay, shotindex )
{
    sceneroot = self;
    success = 1;
    scenedata = sceneroot.scenedata;
    sceneplay.currentshot = shotindex;
    sceneplay function_69e565b8af8a06a2( shotindex );
    sceneroot function_c17d9607a8faffc3( scenedata.scenescriptbundle function_d74f9d413aca8704( shotindex ) );
    
    if ( scenedata.isclientscene )
    {
        scenedata thread function_7c2ba4cf9486f648( shotindex );
    }
    
    sceneplay function_26af26a461d13032( "prepare", shotindex );
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.objectorder )
    {
        if ( isdefined( var_1d42c5b8ad0adc80[ shotindex ] ) )
        {
            sceneroot thread function_d36b9282057340df( sceneplay, "prepare", shotindex, sceneobjectindex );
        }
    }
    
    sceneplay function_5ef9dbff368a95ac( "prepare" );
    
    /#
        var_86d2948ebb49a2f9 = getdvarint( @"hash_36ab188f318b1392", 0 );
        
        if ( var_86d2948ebb49a2f9 )
        {
            var_f1be55806e0d5f25 = gettime();
            
            if ( isdefined( sceneroot.var_92148924baa5c73c ) )
            {
                assert( sceneroot.var_92148924baa5c73c == var_f1be55806e0d5f25 );
                
                if ( sceneroot.var_92148924baa5c73c != var_f1be55806e0d5f25 )
                {
                    here = 0;
                }
            }
            
            sceneroot.var_f1be55806e0d5f25 = var_f1be55806e0d5f25;
        }
    #/
    
    if ( !sceneplay function_177d435a8fba3dc0() )
    {
        /#
            sceneplay scene_debug::function_ba32edc20462b709( shotindex );
        #/
        
        sceneroot function_11225a57ae9c96b2( sceneplay, shotindex, 1 );
        sceneplay function_26af26a461d13032( "anim", shotindex );
        
        foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.objectorder )
        {
            if ( isdefined( var_1d42c5b8ad0adc80[ shotindex ] ) )
            {
                sceneroot thread function_dd772943c28ca228( sceneplay, "anim", shotindex, sceneobjectindex );
            }
        }
        
        shot = sceneroot.scenedata.scenescriptbundle function_6404fde3adf1f642( shotindex );
        
        if ( shot function_9f4fd3f147cf9375() )
        {
            currentshotlength = sceneroot function_b3c7b792a7a154fa( shotindex, 1 );
            alignedshotlength = function_ae674e0cc66e65e( currentshotlength );
            
            if ( alignedshotlength > 0 )
            {
                sceneplay utility::delaythread( alignedshotlength, &function_cd7f523143988bf, "anim" );
            }
        }
        
        sceneplay function_5ef9dbff368a95ac( "anim" );
        
        /#
            if ( var_86d2948ebb49a2f9 )
            {
                sceneroot.var_92148924baa5c73c = gettime();
            }
        #/
        
        /#
            sceneplay scene_debug::function_566e3d31befe1331();
        #/
    }
    
    foreach ( sceneobjectindex, var_1d42c5b8ad0adc80 in sceneplay.objectorder )
    {
        if ( isdefined( var_1d42c5b8ad0adc80[ shotindex ] ) )
        {
            sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
            
            if ( isdefined( sceneobjectdata.playbacksuccessful ) && !sceneobjectdata.playbacksuccessful )
            {
                success = 0;
            }
        }
    }
    
    if ( isdefined( sceneroot.scenedata ) )
    {
        sceneroot function_11225a57ae9c96b2( sceneplay, shotindex, 0 );
    }
    
    sceneplay notify( "scene_shot_cleanup" );
    return success;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x8cb780e9, Offset: 0x4aef
// Size: 0x69
function private function_ae674e0cc66e65e( shot_length )
{
    var_f515c6c2311e98a6 = 50;
    
    if ( level.frameduration > 0 )
    {
        var_f515c6c2311e98a6 = level.frameduration;
    }
    
    lengthms = round( shot_length * 1000 );
    modms = lengthms % var_f515c6c2311e98a6;
    adjustedlength = ( lengthms - modms ) / 1000;
    return adjustedlength;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x28fc71e8, Offset: 0x4b61
// Size: 0x94
function private function_b38b94c97d1d44c6( sceneplay, shotindex )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    maxtimesec = 0;
    
    if ( !isdefined( scenedata ) )
    {
        return maxtimesec;
    }
    
    for ( sceneobjectindex = 0; sceneobjectindex < scenedata.sceneobjectdata.size ; sceneobjectindex++ )
    {
        objectshottimesec = sceneroot function_6ec994d609cfec6d( sceneplay, shotindex, sceneobjectindex );
        maxtimesec = max( maxtimesec, objectshottimesec );
    }
    
    return maxtimesec;
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x50e7caf, Offset: 0x4bfe
// Size: 0xbf
function private function_11225a57ae9c96b2( sceneplay, shotindex, isprepare )
{
    sceneroot = self;
    shot = sceneroot.scenedata.scriptbundle.shots[ shotindex ];
    
    if ( !isdefined( shot ) )
    {
        return;
    }
    
    if ( isprepare )
    {
        sceneroot function_f4ffc6c74497327f( sceneplay, shotindex, shot function_c9e351e000109356(), &hide );
        sceneroot function_f4ffc6c74497327f( sceneplay, shotindex, shot function_87e703acab37289f(), &show );
        return;
    }
    
    sceneroot function_f4ffc6c74497327f( sceneplay, shotindex, shot function_a694d6b567b8f510(), &hide );
    sceneroot function_f4ffc6c74497327f( sceneplay, shotindex, shot function_6f4f7d54201dbbb(), &show );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xf0d5c8ff, Offset: 0x4cc5
// Size: 0x145
function private function_f4ffc6c74497327f( sceneplay, shotindex, targetsstring, func )
{
    if ( !isstring( targetsstring ) )
    {
        return;
    }
    
    targets = strtok( targetsstring, " ,;" );
    
    foreach ( targetname in targets )
    {
        foundentities = getentarray( targetname, "targetname" );
        foundentities = arraycombine( foundentities, getentarray( targetname, "script_noteworthy" ) );
        
        foreach ( foundent in foundentities )
        {
            foundent builtin [[ func ]]();
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xdb2306e7, Offset: 0x4e12
// Size: 0xb7
function private function_26af26a461d13032( objecttask, shotindex )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.waitobjects[ objecttask ] = [];
    
    for ( sceneobjectindex = 0; sceneobjectindex < scenedata.sceneobjectdata.size ; sceneobjectindex++ )
    {
        if ( isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) && isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ][ shotindex ] ) )
        {
            sceneplay.waitobjects[ objecttask ][ sceneobjectindex ] = sceneobjectindex;
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xaea51ccc, Offset: 0x4ed1
// Size: 0x58
function private function_1b11770bc73d1ce8( objecttask, objectindex )
{
    sceneplay = self;
    
    if ( isdefined( sceneplay.waitobjects ) && isdefined( sceneplay.waitobjects[ objecttask ] ) )
    {
        sceneplay.waitobjects[ objecttask ][ objectindex ] = undefined;
    }
    
    sceneplay notify( objecttask );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x76a30fc9, Offset: 0x4f31
// Size: 0x56
function private function_5ef9dbff368a95ac( objecttask )
{
    sceneplay = self;
    
    while ( isdefined( sceneplay.waitobjects[ objecttask ] ) && sceneplay.waitobjects[ objecttask ].size > 0 )
    {
        sceneplay waittill( objecttask );
    }
    
    sceneplay.waitobjects[ objecttask ] = undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x8e052184, Offset: 0x4f8f
// Size: 0xd8
function private function_cd7f523143988bf( objecttask )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    
    if ( !isdefined( sceneplay ) )
    {
        return;
    }
    
    if ( !isdefined( sceneplay.waitobjects[ objecttask ] ) )
    {
        return;
    }
    
    for ( i = 0; isdefined( sceneplay.waitobjects[ objecttask ] ) && i < sceneplay.waitobjects[ objecttask ].size ; i++ )
    {
        sceneobjectindex = sceneplay.waitobjects[ objecttask ][ i ];
        
        if ( isdefined( sceneobjectindex ) )
        {
            sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
            sceneobjectdata function_8f2e8c264c93b535();
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe4e3e4a1, Offset: 0x506f
// Size: 0x161
function private function_f64303bc1cfe9a4a( var_c37d91c04c760f06 )
{
    sceneplay = self;
    sceneroot = sceneplay.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneplay.stoprequested = 1;
    sceneplay notify( "scene_stop" );
    sceneroot notify( "scene_stop" );
    
    for ( sceneobjectindex = 0; sceneobjectindex < scenedata.sceneobjectdata.size ; sceneobjectindex++ )
    {
        if ( isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) )
        {
            sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
            sceneroot function_2302629af55b51bd( sceneobjectindex );
        }
    }
    
    waittillframeend();
    
    while ( sceneplay.state == "Playing" )
    {
        anyactive = 0;
        
        for ( sceneobjectindex = 0; sceneobjectindex < scenedata.sceneobjectdata.size ; sceneobjectindex++ )
        {
            if ( isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) )
            {
                sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
                
                if ( isdefined( sceneobjectdata.active ) )
                {
                    anyactive = 1;
                    break;
                }
            }
        }
        
        if ( !anyactive )
        {
            sceneplay.state = "Stopped";
        }
        
        waitframe();
    }
    
    if ( var_c37d91c04c760f06 )
    {
        sceneplay function_fd69bbc76c8dac86();
    }
    
    sceneplay.stoprequested = undefined;
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x7aba7ae3, Offset: 0x51d8
// Size: 0x12b
function private function_d36b9282057340df( sceneplay, objecttask, shotindex, objectindex )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneobjectdata = scenedata.sceneobjectdata[ objectindex ];
    
    if ( sceneobjectdata utility::ent_flag( "scene_object_active" ) )
    {
        keepanim = sceneobjectdata.sceneobject function_ac528c4b94dc121f( shotindex );
        sceneroot function_2302629af55b51bd( objectindex, keepanim );
    }
    
    sceneobjectdata utility::function_adae3a467e19ce3( "scene_object_active" );
    sceneobjectdata utility::ent_flag_set( "scene_object_active" );
    animtype = sceneobjectdata.sceneobject function_e497f52b15295ba5();
    sceneobjectdata.var_caa911de855ae014 = [];
    sceneobjectdata.var_caa911de855ae014[ animtype ] = "prepare" + shotindex + objectindex;
    sceneobjectdata.active = "prepare";
    sceneobjectdata function_4395eb62ee2212b9( 1 );
    sceneobjectdata function_90aaff2103125c26( sceneplay, shotindex, objectindex );
    sceneplay function_1b11770bc73d1ce8( objecttask, objectindex );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xa294ec8a, Offset: 0x530b
// Size: 0x585
function private function_dd772943c28ca228( sceneplay, objecttask, shotindex, objectindex )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneobjectdata = scenedata.sceneobjectdata[ objectindex ];
    sceneobjectdata.var_caa911de855ae014 = undefined;
    
    if ( !isdefined( sceneobjectdata.active ) )
    {
        sceneplay function_1b11770bc73d1ce8( objecttask, objectindex );
        return;
    }
    
    if ( sceneobjectdata.sceneobject function_8c27db859ca12a4f( shotindex ) )
    {
        sceneplay function_1b11770bc73d1ce8( objecttask, objectindex );
    }
    
    animated = sceneobjectdata function_fd41f2c45f2ff86a();
    cameraanimation = sceneobjectdata function_64466e4b9ed25e4c( shotindex );
    shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
    var_ce31daa306d9074 = isarray( shotanimations ) && shotanimations.size > 0;
    sceneobjectdata function_8207af582343cc24( sceneplay, shotindex, cameraanimation, shotanimations );
    sceneobjectdata.active = "anim";
    sceneobjectdata.playbacksuccessful = 1;
    var_861c4187e5de611f = 0;
    animstartsec = 0;
    lerptime = sceneobjectdata.sceneobject function_27059363c715d947( shotindex );
    blendtime = sceneobjectdata.sceneobject function_1c54677f7be74c59( shotindex );
    blendcurve = sceneobjectdata.sceneobject function_e4fd4fd04ed73e1b( shotindex );
    overridelerp = sceneobjectdata function_aa1705ea1d6cddfa( shotindex, "lerp" );
    overrideblend = sceneobjectdata function_aa1705ea1d6cddfa( shotindex, "blend" );
    
    if ( isdefined( overridelerp ) )
    {
        lerptime = float( overridelerp );
    }
    
    if ( isdefined( overrideblend ) )
    {
        blendtime = float( overrideblend );
    }
    
    sceneobjectdata object_alignment_link( sceneplay, sceneobjectdata.alignmentinfo, "scene_init_play", lerptime, 0 );
    
    if ( animated )
    {
        animtype = sceneobjectdata.sceneobject function_e497f52b15295ba5();
        
        if ( isdefined( sceneplay.var_a173fd36d9f698cb ) )
        {
            shotdurationsec = sceneroot function_6ec994d609cfec6d( sceneplay, shotindex, objectindex );
            shotstartsec = sceneplay.var_a173fd36d9f698cb.shottimeinfo[ shotindex ].startsec;
            var_861c4187e5de611f = shotstartsec;
            var_b7300a99e9514444 = shotstartsec + shotdurationsec;
            animstartsec = 0;
            
            if ( var_b7300a99e9514444 < sceneplay.var_a173fd36d9f698cb.fromtimesec )
            {
                sceneobjectdata.active = undefined;
                
                if ( var_ce31daa306d9074 )
                {
                    for ( animationindex = 0; animationindex < shotanimations.size ; animationindex++ )
                    {
                        var_2128c2949707fedd = animtype + shotindex + objectindex + animationindex;
                        sceneobjectdata function_1e43ac4c885e2751( sceneobjectdata.alignmentinfo, shotanimations[ animationindex ], var_2128c2949707fedd, 0, 1, animtype );
                    }
                }
                
                if ( isdefined( cameraanimation ) )
                {
                    var_2128c2949707fedd = animtype + shotindex + objectindex + ( animationindex ?? "" ) + 0;
                    sceneobjectdata function_1e43ac4c885e2751( sceneobjectdata.alignmentinfo, cameraanimation, var_2128c2949707fedd, 0, 1, "CameraAnimation" );
                }
                
                sceneobjectdata function_898611fe961dc90d( 0, sceneplay, objecttask, shotindex, objectindex );
                return;
            }
            else
            {
                var_861c4187e5de611f = sceneplay.var_a173fd36d9f698cb.fromtimesec - shotstartsec;
            }
        }
        
        if ( sceneobjectdata.active == "anim" )
        {
            if ( isdefined( cameraanimation ) )
            {
                var_2128c2949707fedd = animtype + shotindex + objectindex + 0;
                var_142c2c5d44216f2a = 0;
                
                if ( isdefined( sceneplay.var_a173fd36d9f698cb ) )
                {
                    var_142c2c5d44216f2a = clamp( var_861c4187e5de611f / sceneobjectdata function_58a93a40f02daed7( cameraanimation, "CameraAnimation" ), 0, 1 );
                    sceneobjectdata function_1e43ac4c885e2751( sceneobjectdata.alignmentinfo, cameraanimation, var_2128c2949707fedd, 0, var_142c2c5d44216f2a, "CameraAnimation" );
                }
                
                var_35dfbfd4015881b0 = "CameraAnimation" + shotindex + objectindex;
                sceneobjectdata childthread object_play_anim( shotindex, 0, var_35dfbfd4015881b0, sceneobjectdata.alignmentinfo, cameraanimation, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, "CameraAnimation" );
            }
            
            if ( var_ce31daa306d9074 )
            {
                animationindex = 0;
                
                while ( animationindex < shotanimations.size )
                {
                    var_2128c2949707fedd = animtype + shotindex + objectindex + animationindex;
                    var_142c2c5d44216f2a = 0;
                    
                    if ( var_861c4187e5de611f > animstartsec )
                    {
                        animdurationsec = sceneobjectdata function_58a93a40f02daed7( shotanimations[ animationindex ], animtype );
                        
                        if ( animdurationsec > 0 )
                        {
                            var_142c2c5d44216f2a = clamp( ( var_861c4187e5de611f - animstartsec ) / animdurationsec, 0, 1 );
                            sceneobjectdata function_1e43ac4c885e2751( sceneobjectdata.alignmentinfo, shotanimations[ animationindex ], var_2128c2949707fedd, 0, var_142c2c5d44216f2a, animtype );
                            
                            if ( var_142c2c5d44216f2a > 1 )
                            {
                                animstartsec += animdurationsec;
                                animationindex++;
                                continue;
                            }
                        }
                        else
                        {
                            animationindex++;
                            continue;
                        }
                    }
                    
                    animdurationsec = sceneobjectdata object_play_anim( shotindex, animationindex, var_2128c2949707fedd, sceneobjectdata.alignmentinfo, shotanimations[ animationindex ], var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animtype );
                    
                    if ( isdefined( animdurationsec ) )
                    {
                        var_861c4187e5de611f += animdurationsec;
                        animstartsec += animdurationsec;
                    }
                    
                    animationindex++;
                    
                    if ( sceneobjectdata.active != "anim" || sceneobjectdata.sceneplay != sceneplay || !isdefined( sceneobjectdata.scenedata ) )
                    {
                        break;
                    }
                }
            }
        }
    }
    
    while ( isdefined( sceneobjectdata.var_caa911de855ae014 ) && sceneobjectdata.var_caa911de855ae014.size > 0 )
    {
        sceneobjectdata waittill( "scene_anim_ended" );
    }
    
    sceneobjectdata function_898611fe961dc90d( animated, sceneplay, objecttask, shotindex, objectindex );
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0xaf7635ec, Offset: 0x5898
// Size: 0xd3
function private function_898611fe961dc90d( animated, sceneplay, objecttask, shotindex, objectindex )
{
    sceneobjectdata = self;
    
    if ( !sceneobjectdata.sceneobject function_af186866fc828d5d() )
    {
        if ( animated && !isdefined( sceneobjectdata.activeanimation ) )
        {
            sceneobjectdata thread function_d87cb823e217a4ec( sceneobjectdata.alignmentinfo );
        }
    }
    
    sceneobjectdata function_5a563c79ceb8a795( shotindex );
    
    if ( sceneobjectdata function_fac82f7b6f86f286( sceneplay, shotindex ) )
    {
        sceneobjectdata thread function_745fc41786a6109a( level.framedurationseconds );
    }
    
    if ( sceneobjectdata )
    {
        sceneobjectdata.active = undefined;
        sceneobjectdata utility::ent_flag_clear( "scene_object_active" );
    }
    
    if ( sceneplay )
    {
        sceneplay function_1b11770bc73d1ce8( objecttask, objectindex );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x54aff91b, Offset: 0x5973
// Size: 0x5e
function private function_745fc41786a6109a( timer )
{
    sceneobjectdata = self;
    sceneobjectdata endon( "scene_play" );
    sceneobjectdata endon( "death_or_disconnect" );
    sceneobjectdata endon( "stop_delay_thread" );
    
    if ( sceneobjectdata.entity )
    {
        sceneobjectdata.entity endon( "death_or_disconnect" );
    }
    
    wait timer;
    thread object_cleanup();
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xaef8047, Offset: 0x59d9
// Size: 0xdc, Type: bool
function private function_4b60fcb5255695e6( sceneplay )
{
    sceneobjectdata = self;
    assert( isdefined( sceneplay ) );
    assert( isarray( sceneplay.var_eb6d7fbdd0bb47f8 ) );
    assert( isint( sceneplay.shotindicesindex ) );
    objectindex = sceneobjectdata.index;
    
    if ( !isdefined( sceneplay.var_caf7bc39e6b19dd5[ objectindex ] ) )
    {
        return false;
    }
    
    for ( sceneplayshotindex = sceneplay.shotindicesindex + 1; sceneplayshotindex < sceneplay.var_eb6d7fbdd0bb47f8.size ; sceneplayshotindex++ )
    {
        var_62e26c87a288f764 = sceneplay.var_eb6d7fbdd0bb47f8[ sceneplayshotindex ];
        
        if ( isdefined( sceneplay.var_caf7bc39e6b19dd5[ objectindex ][ var_62e26c87a288f764 ] ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xdcef4f81, Offset: 0x5abe
// Size: 0x189, Type: bool
function private function_fac82f7b6f86f286( sceneplay, shotindex )
{
    sceneobjectdata = self;
    sceneroot = sceneobjectdata.sceneroot;
    scenedata = sceneroot.scenedata;
    
    if ( !isdefined( scenedata ) )
    {
        return true;
    }
    
    if ( sceneplay != sceneobjectdata.sceneplay )
    {
        return false;
    }
    
    if ( isdefined( sceneobjectdata.activeanimation ) )
    {
        return false;
    }
    
    if ( sceneroot.scenedata.scenescriptbundle && sceneroot.scenedata.scenescriptbundle function_18b6837bdb9e4208() )
    {
        return false;
    }
    
    if ( sceneobjectdata && !sceneobjectdata function_fd41f2c45f2ff86a() )
    {
        return false;
    }
    
    if ( !sceneplay.var_eb6d7fbdd0bb47f8 || sceneplay.var_eb6d7fbdd0bb47f8.size == 0 || shotindex == sceneplay.var_eb6d7fbdd0bb47f8[ sceneplay.var_eb6d7fbdd0bb47f8.size - 1 ] )
    {
        return true;
    }
    
    if ( sceneobjectdata.sceneobject )
    {
        deletetype = sceneobjectdata.sceneobject function_772de5acb2e194c7();
        
        if ( sceneobjectdata.sceneobject function_827f7d9bd7a46afd() == "Types_XCam" || deletetype == "DeleteAlwaysNotInvolved" || deletetype == "DeleteSpawnedNotInvolved" && !sceneobjectdata.existingentity )
        {
            if ( !sceneobjectdata function_4b60fcb5255695e6( sceneplay ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x4c3dc7ae, Offset: 0x5c50
// Size: 0x1a2
function private function_6ec994d609cfec6d( sceneplay, shotindex, objectindex, resultobjectanimtimes )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneobjectdata = scenedata.sceneobjectdata[ objectindex ];
    
    if ( !isdefined( sceneobjectdata ) )
    {
        return;
    }
    
    if ( isdefined( sceneplay.var_a173fd36d9f698cb ) && isdefined( sceneplay.var_a173fd36d9f698cb.shottimeinfo[ shotindex ] ) )
    {
        return sceneplay.var_a173fd36d9f698cb.shottimeinfo[ shotindex ].durationsec;
    }
    
    deltatimesec = 0;
    cameratimesec = 0;
    cameraanimation = sceneobjectdata function_64466e4b9ed25e4c( shotindex );
    
    if ( isdefined( cameraanimation ) )
    {
        shottimesec = sceneobjectdata function_58a93a40f02daed7( cameraanimation, "CameraAnimation" );
    }
    
    animtype = sceneobjectdata.sceneobject function_e497f52b15295ba5();
    shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
    
    for ( animationindex = 0; animationindex < shotanimations.size ; animationindex++ )
    {
        animtime = sceneobjectdata function_58a93a40f02daed7( shotanimations[ animationindex ], animtype );
        
        if ( isdefined( resultobjectanimtimes ) )
        {
            if ( !isdefined( resultobjectanimtimes.times ) )
            {
                resultobjectanimtimes.times = [];
            }
            
            resultobjectanimtimes.times[ animationindex ] = animtime;
        }
        
        deltatimesec += animtime;
    }
    
    return max( cameratimesec, deltatimesec );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x54d324a9, Offset: 0x5dfb
// Size: 0x9e
function private function_2302629af55b51bd( sceneobjectindex, keepanim = 0 )
{
    sceneroot = self;
    scenedata = sceneroot.scenedata;
    sceneobjectdata = scenedata.sceneobjectdata[ sceneobjectindex ];
    sceneobjectdata.active = undefined;
    sceneobjectdata.playbacksuccessful = 0;
    sceneobjectdata notify( "scene_stop" );
    sceneobjectdata function_8f2e8c264c93b535();
    
    if ( !keepanim )
    {
        sceneobjectdata function_2d0d8b2ed2c4709a();
    }
    
    sceneobjectdata utility::ent_flag_clear( "scene_object_active" );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xadfe9a70, Offset: 0x5ea1
// Size: 0x1c6
function private function_902aff781fb98f0f( newstate )
{
    sceneroot = self;
    assert( newstate != "<dev string:x8f>" );
    assert( newstate != "<dev string:x9a>" );
    
    if ( isdefined( sceneroot.scenedata ) && sceneroot.scenedata.state != newstate )
    {
        if ( newstate != "NotInit" )
        {
            sceneroot.scenedata.state = newstate;
            sceneroot function_7ae4ca45fe9ff944( sceneroot.scenedata.state );
            return;
        }
        
        assert( sceneroot.scenedata.state == "<dev string:xa5>" );
        
        if ( isdefined( sceneroot.scenedata.sceneobjectdata ) && isdefined( sceneroot.scenedata.scenescriptbundle ) )
        {
            objectcount = sceneroot.scenedata.scenescriptbundle function_bd663a9606d90ac1();
            
            if ( isdefined( objectcount ) )
            {
                for ( objectindex = 0; objectindex < objectcount ; objectindex++ )
                {
                    if ( objectindex < sceneroot.scenedata.sceneobjectdata.size )
                    {
                        sceneroot.scenedata.sceneobjectdata[ objectindex ].scenedata = undefined;
                    }
                }
            }
        }
        
        utility::function_cacdd05a312a4bf0( sceneroot.scenedata.scriptbundle );
        
        /#
            sceneroot scene_debug::unregister();
        #/
        
        sceneroot.scenedata.sceneroot = undefined;
        sceneroot.scenedata = undefined;
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x759a21f1, Offset: 0x606f
// Size: 0xbc
function private function_7ae4ca45fe9ff944( state )
{
    sceneroot = self;
    
    if ( isdefined( sceneroot.scenestatic.notifyobject ) && isdefined( sceneroot.scenestatic ) && isdefined( sceneroot.scenestatic.notifyevent ) )
    {
        if ( !isdefined( sceneroot.scenestatic.notifymatch ) || sceneroot.scenestatic.notifymatch == state )
        {
            sceneroot.scenestatic.notifyobject notify( sceneroot.scenestatic.notifyevent );
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xb210dbf3, Offset: 0x6133
// Size: 0x1a
function private function_baebb0795b75d9ca()
{
    sceneroot = self;
    return sceneroot.script_scenescriptbundle;
}

// Namespace scene
// Params 0
// Checksum 0x6a0c3be7, Offset: 0x6156
// Size: 0x98
function scene_scriptbundle()
{
    sceneroot = self;
    sceneroot function_b4cfd3b6e6f6987d();
    
    if ( !isdefined( sceneroot.scenedata.scriptbundle ) )
    {
        scenescriptbundlename = sceneroot function_baebb0795b75d9ca();
        
        if ( isdefined( scenescriptbundlename ) )
        {
            sceneroot.scenedata.scriptbundle = utility::function_dc226e1c2f06ea0b( isxhashasset( scenescriptbundlename ) ? scenescriptbundlename : hashcat( %"scenescriptbundle:", scenescriptbundlename ) );
        }
    }
    
    return sceneroot.scenedata.scriptbundle;
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0xe41f8315, Offset: 0x61f7
// Size: 0x72
function private function_3a06b41e384fbf58( typename, funcname, func )
{
    function_9faf48fca9716acd();
    
    if ( !isdefined( level.scene.objecthandlers[ typename ] ) )
    {
        level.scene.objecthandlers[ typename ] = [];
    }
    
    level.scene.objecthandlers[ typename ][ funcname ] = func;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xcade8f1f, Offset: 0x6271
// Size: 0x2fb
function private function_a8d91578e2556475()
{
    assert( isdefined( level.scene.objecthandlers ) );
    assert( isdefined( level.scene.objecthandlers[ "<dev string:xb1>" ] ) );
    assert( !isdefined( level.scene.var_503e815140d769a6 ) );
    level.scene.var_503e815140d769a6 = [];
    var_7348ab4794f6ea97 = [ "Types_Object", "Types_Prop", "Types_Actor", "Types_Player", "Types_EnemyPlayer", "Types_FakePlayer", "Types_FakeActor", "Types_Vehicle", "Types_Mayhem", "Types_XCam", "Types_ClientChar" ];
    
    foreach ( sceneobjecttype in var_7348ab4794f6ea97 )
    {
        level.scene.var_503e815140d769a6[ sceneobjecttype ] = [];
        
        foreach ( functype, func in level.scene.objecthandlers[ "Types_Object" ] )
        {
            level.scene.var_503e815140d769a6[ sceneobjecttype ][ functype ] = func;
        }
    }
    
    foreach ( sceneobjecttype, functable in level.scene.objecthandlers )
    {
        if ( sceneobjecttype == "Types_Object" )
        {
            continue;
        }
        
        foreach ( functype, func in functable )
        {
            level.scene.var_503e815140d769a6[ sceneobjecttype ][ functype ] = func;
        }
    }
    
    level.scene.objecthandlers = undefined;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xa4dc2fab, Offset: 0x6574
// Size: 0x61
function private function_8eae84e23a4f5614( funcname, func )
{
    function_9faf48fca9716acd();
    
    if ( !isdefined( level.scene.modehandlers ) )
    {
        level.scene.modehandlers = [];
    }
    
    level.scene.modehandlers[ funcname ] = func;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xad6096d6, Offset: 0x65dd
// Size: 0x4a
function private function_ecb3770041e3e379( functype )
{
    typefunc = undefined;
    
    if ( isdefined( level.scene.modehandlers ) )
    {
        typefunc = level.scene.modehandlers[ functype ];
    }
    
    return typefunc;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9d4bb5dc, Offset: 0x6630
// Size: 0x18
function private function_2b6f213d891785e5( functype )
{
    return self.functable[ functype ];
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x8d2b4a3c, Offset: 0x6651
// Size: 0x3a0
function private object_spawn( alignmentinfo, shotinit )
{
    sceneobjectdata = self;
    scenestatic = sceneobjectdata.sceneroot.scenestatic;
    entity = undefined;
    sceneobjecttype = sceneobjectdata.sceneobject function_827f7d9bd7a46afd();
    sceneobjectassettype = sceneobjectdata.sceneobject function_fc09a0af0b50d3d4();
    sceneobjectassetname = sceneobjectdata.sceneobject function_ccb2b599f3b8ef77();
    sceneobjectname = sceneobjectdata.sceneobject function_e8fb13f70b9a4db6();
    spawnorigin = alignmentinfo.origin;
    spawnangles = alignmentinfo.angles;
    
    if ( isdefined( shotinit ) )
    {
        shotanimations = sceneobjectdata function_6bf501072826e845( shotinit );
        
        if ( isdefined( shotanimations ) && shotanimations.size > 0 && isanimation( shotanimations[ 0 ] ) )
        {
            spawnorigin = getstartorigin( alignmentinfo.origin, alignmentinfo.angles, shotanimations[ 0 ] );
            spawnangles = getstartangles( alignmentinfo.origin, alignmentinfo.angles, shotanimations[ 0 ] );
        }
    }
    
    /#
        scene_debug::object_event( sceneobjectdata, "<dev string:xc1>", spawnorigin, spawnangles );
    #/
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSpawn" );
    
    if ( isdefined( typefunc ) && typefunc != &object_spawn )
    {
        entity = sceneobjectdata [[ typefunc ]]( spawnorigin, spawnangles );
    }
    
    if ( !isdefined( entity ) )
    {
        entity = sceneobjectdata function_f17638b31ca85f5f( spawnorigin, spawnangles );
    }
    
    /#
        if ( !isdefined( entity ) )
        {
            if ( sceneobjecttype != "<dev string:xca>" && sceneobjecttype != "<dev string:xda>" )
            {
                println( "<dev string:xe8>" + sceneobjectname + "<dev string:x111>" + sceneobjectassettype + "<dev string:x11e>" + sceneobjectassetname + "<dev string:x53>" );
            }
        }
    #/
    
    if ( isdefined( scenestatic ) && isdefined( entity ) && isdefined( scenestatic.spawnfunctions ) && !isplayer( entity ) )
    {
        entity.sceneobjectdata = sceneobjectdata;
        checktables = [ sceneobjectname, sceneobjecttype, "_object_all_" ];
        
        foreach ( tablename in checktables )
        {
            if ( isdefined( scenestatic.spawnfunctions[ tablename ] ) )
            {
                foreach ( spawnfunc in scenestatic.spawnfunctions[ tablename ] )
                {
                    entity thread [[ spawnfunc ]]();
                }
            }
        }
    }
    
    if ( isdefined( entity ) )
    {
        switch ( sceneobjectdata.sceneobject function_37b12fc2df71936b() )
        {
            case #"hash_5a532485943b3d4b":
                entity.targetname = "_scene_global_" + sceneobjectname;
                break;
            case #"hash_6d8a4db48060bf8":
                entity.script_noteworthy = "_scene_global_" + sceneobjectname;
                break;
        }
    }
    
    return entity;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x16ae7950, Offset: 0x69fa
// Size: 0x278
function private function_f17638b31ca85f5f( spawnorigin, spawnangles )
{
    sceneobjectdata = self;
    entity = undefined;
    scenescriptbundle = sceneobjectdata.sceneroot scene_scriptbundle();
    sceneobjectassettype = sceneobjectdata.sceneobject function_fc09a0af0b50d3d4();
    sceneobjectassetname = sceneobjectdata.sceneobject function_ccb2b599f3b8ef77();
    spawnflags = 0;
    
    if ( sceneobjectdata.sceneobject function_16e90b61b72fb539() || scenescriptbundle function_26e347b43304e05e() )
    {
        spawnflags |= 2147483648;
    }
    
    if ( sceneobjectassettype == "xmodel" || sceneobjectassettype == "xcompositemodel" )
    {
        entity = spawn( "script_model", spawnorigin, spawnflags );
        
        if ( isdefined( entity ) )
        {
            entity val::set( "scene_scene", "cinematics_participant", 1 );
            entity.angles = spawnangles;
            entity setmodel( sceneobjectassetname );
            animtree = sceneobjectdata.sceneobject function_4641057744100c08();
            
            if ( isdefined( animtree ) )
            {
                entity useanimtree( animtree );
            }
            
            entity visibility_mode::function_db9ed9dc5c19305b();
        }
    }
    else if ( sceneobjectassettype == "character" )
    {
        character = getxhashasset( sceneobjectassetname );
        
        if ( isdefined( level.fncharacter ) && isdefined( level.fncharacter[ character ] ) )
        {
            entity = spawn( "script_model", spawnorigin, spawnflags );
            
            if ( isdefined( entity ) )
            {
                entity val::set( "scene_scene", "cinematics_participant", 1 );
                func = level.fncharacter[ character ];
                entity [[ func ]]();
                entity.angles = spawnangles;
                animtree = sceneobjectdata.sceneobject function_4641057744100c08();
                
                if ( isdefined( animtree ) )
                {
                    entity useanimtree( animtree );
                }
                
                entity visibility_mode::function_db9ed9dc5c19305b();
            }
        }
    }
    
    if ( sceneobjectassettype == "bulletweapon" )
    {
        weaponvariantid = sceneobjectdata.sceneobject function_6280c600ae0d180d();
        weapon = weapon::function_bfc8095d723355fa( sceneobjectassetname, weaponvariantid );
        name = getcompleteweaponname( weapon );
        entity = spawn( "weapon_" + name, spawnorigin, spawnflags );
        
        if ( isdefined( entity ) )
        {
            entity val::set( "scene_scene", "cinematics_participant", 1 );
            entity.angles = spawnangles;
        }
    }
    
    return entity;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x45c2191b, Offset: 0x6c7b
// Size: 0x18c
function private function_4395eb62ee2212b9( visible = 1 )
{
    sceneobjectdata = self;
    
    if ( !visible )
    {
        entities = sceneobjectdata function_f2fb9eed776f75ff();
        
        if ( isarray( entities ) )
        {
            foreach ( entity in entities )
            {
                if ( !isdefined( entity ) || isplayer( entity ) )
                {
                    continue;
                }
                
                entity val::set( "scene_scene", "hide", 2 );
            }
        }
        
        sceneobjectdata.prestreamhidden = 1;
        return;
    }
    
    if ( sceneobjectdata.prestreamhidden )
    {
        entities = sceneobjectdata function_f2fb9eed776f75ff();
        
        if ( isarray( entities ) )
        {
            foreach ( entity in entities )
            {
                if ( !isdefined( entity ) )
                {
                    continue;
                }
                
                entity val::reset( "scene_scene", "hide" );
            }
        }
        
        sceneobjectdata.prestreamhidden = undefined;
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x50e1590, Offset: 0x6e0f
// Size: 0x8a
function private function_71ee00d5cd22094( newsceneroot )
{
    sceneobjectdata = self;
    
    if ( !isdefined( sceneobjectdata ) )
    {
        return;
    }
    
    if ( isdefined( sceneobjectdata.sceneplay ) && isdefined( sceneobjectdata.active ) )
    {
        sceneobjectdata.sceneplay function_1b11770bc73d1ce8( sceneobjectdata.active, sceneobjectdata.index );
    }
    
    sceneobjectdata function_8f2e8c264c93b535();
    sceneobjectdata object_cleanup( newsceneroot, 1 );
    sceneobjectdata utility::ent_flag_clear( "scene_object_active" );
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0x48083fdd, Offset: 0x6ea1
// Size: 0x109
function private function_741d59e7b6c8d2fc( sceneroot, sceneplay, entity, existing, inittype )
{
    sceneobjectdata = self;
    
    if ( isdefined( entity ) && isdefined( entity.sceneobjectdata ) && sceneplay != entity.sceneobjectdata.sceneplay )
    {
        if ( inittype != "scene_init_prestream" && entity.sceneobjectdata != sceneobjectdata )
        {
            entity.sceneobjectdata function_71ee00d5cd22094( sceneroot );
        }
    }
    
    if ( isent( sceneobjectdata.entity ) )
    {
        if ( sceneobjectdata.entity === entity )
        {
            return;
        }
        
        if ( !sceneobjectdata.existingentity )
        {
            sceneobjectdata object_cleanup();
            sceneobjectdata object_delete();
        }
    }
    
    sceneobjectdata.entity = entity;
    sceneobjectdata.existingentity = existing;
    sceneobjectdata function_8a371c59effcd21c();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x8cd7a670, Offset: 0x6fb2
// Size: 0x49
function private function_8a371c59effcd21c()
{
    sceneobjectdata = self;
    sceneobjectdata.animaltname = undefined;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAltAnim" );
    
    if ( isdefined( typefunc ) && typefunc != &function_8a371c59effcd21c )
    {
        sceneobjectdata [[ typefunc ]]();
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x36b94897, Offset: 0x7003
// Size: 0x2e1
function private object_setup( sceneplay )
{
    sceneobjectdata = self;
    sceneobjectdata.sceneplay = sceneplay;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        scenescriptbundle = sceneobjectdata.sceneroot scene_scriptbundle();
        sceneobjectname = sceneobjectdata.sceneobject function_e8fb13f70b9a4db6();
        sceneobjecttree = sceneobjectdata.sceneobject function_4641057744100c08();
        sceneobjectdata function_6eed58b13f778351( sceneobjectname, sceneobjecttree );
        
        if ( !isdefined( sceneobjectdata.restoredontmelee ) )
        {
            sceneobjectdata.restoredontmelee = sceneobjectdata.entity.dontmelee;
        }
        
        sceneobjectdata.entity.dontmelee = 1;
        sceneobjectdata.entity utility::ent_flag_set( "scene_active" );
        
        if ( isplayer( sceneobjectdata.entity ) )
        {
            if ( sceneobjectdata.scenedata.scenescriptbundle function_7f138cc8a9e70cf4() )
            {
                sceneobjectdata.entity val::set( "scene_scene", "show_hud", 0 );
            }
        }
        
        if ( scenescriptbundle function_4ce73dcda6de9f22() == "AllObjects" )
        {
            sceneobjectdata.entity val::set( "scene_scene", "high_net_lod", 1 );
        }
        
        if ( scenescriptbundle function_a9260c3d77b784c3() == "UseCurrentTime" )
        {
            sceneobjectdata.entity val::set( "scene_scene", "anim_current_time", 1 );
        }
        
        objtype = sceneobjectdata.sceneobject function_827f7d9bd7a46afd();
        gameplay = sceneobjectdata.sceneroot function_de0c3faf7f92b366();
        values = level.scene.values[ objtype ][ gameplay ];
        
        if ( isdefined( values ) )
        {
            foreach ( valname, value in values )
            {
                sceneobjectdata.entity val::set( "scene_scene", valname, value );
            }
        }
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetup" );
    
    if ( isdefined( typefunc ) && typefunc != &object_setup )
    {
        sceneobjectdata [[ typefunc ]]( sceneplay );
    }
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity.sceneobjectdata = sceneobjectdata;
    }
    
    sceneobjectdata.issetup = 1;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x7ed15420, Offset: 0x72ec
// Size: 0x1a4
function private function_6eed58b13f778351( animname, animtree )
{
    sceneobjectdata = self;
    
    if ( !isdefined( sceneobjectdata.entity ) )
    {
        return;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAnimName" );
    
    if ( isdefined( typefunc ) && typefunc != &function_6eed58b13f778351 )
    {
        sceneobjectdata [[ typefunc ]]( animname, animtree );
        return;
    }
    
    if ( isdefined( animname ) )
    {
        if ( !isplayer( sceneobjectdata.entity ) && isdefined( animtree ) && ( !isdefined( sceneobjectdata.entity.animtree ) || sceneobjectdata.entity.animtree == "" ) )
        {
            if ( !isdefined( sceneobjectdata.animtreeprevious ) )
            {
                sceneobjectdata.animtreeprevious = sceneobjectdata.entity.animtree;
            }
            
            var_989435f1f1696302 = undefined;
            
            if ( sceneobjectdata.entity isusinganimtree() )
            {
                var_989435f1f1696302 = function_156899f9c79df9a2( sceneobjectdata.entity );
            }
            
            if ( animtree != var_989435f1f1696302 )
            {
                sceneobjectdata.entity useanimtree( animtree );
            }
        }
        
        if ( !isdefined( sceneobjectdata.entity.animname ) )
        {
            sceneobjectdata.entity.animname = animname;
        }
        
        return;
    }
    
    if ( isdefined( sceneobjectdata.animtreeprevious ) )
    {
        sceneobjectdata.entity useanimtree( sceneobjectdata.animtreeprevious );
    }
    
    sceneobjectdata.animtreeprevious = undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xa8e486bd, Offset: 0x7498
// Size: 0x70
function private function_4a9835edd174d8e3( animasset )
{
    sceneobjectdata = self;
    sceneobjectdata.activeanimationplaying = undefined;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAnimPlaying" );
    
    if ( isdefined( typefunc ) && typefunc != &function_4a9835edd174d8e3 )
    {
        sceneobjectdata [[ typefunc ]]( animasset );
        return;
    }
    
    sceneobjectdata.activeanimationplaying = animasset;
    sceneobjectdata notify( "scene_anim_playing", animasset );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x74f44353, Offset: 0x7510
// Size: 0x12e
function private function_5f1315ff984eb193( boolval )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectParticipatingCinematics" );
    
    if ( isdefined( typefunc ) && typefunc != &function_5f1315ff984eb193 )
    {
        sceneobjectdata [[ typefunc ]]( boolval );
        return;
    }
    
    entities = sceneobjectdata function_f2fb9eed776f75ff();
    
    if ( isarray( entities ) )
    {
        foreach ( entity in entities )
        {
            if ( isent( entity ) )
            {
                if ( boolval )
                {
                    entity val::set( "scene_scene", "cinematics_participant", 1 );
                    entity val::set( "scene_scene", "third_person_toggle", 0 );
                    continue;
                }
                
                entity val::reset( "scene_scene", "cinematics_participant" );
                entity val::reset( "scene_scene", "third_person_toggle" );
            }
        }
    }
}

// Namespace scene
// Params 4, eflags: 0x44 variadic
// Checksum 0xdf1cce96, Offset: 0x7646
// Size: 0x43
function private function_2b192928688bd1d( endonevent, func, ... )
{
    sceneobjectdata = self;
    sceneobjectdata thread function_f1d6d9665bdaca0a( endonevent, func, flat_args( vararg, varargcount ) );
}

// Namespace scene
// Params 4, eflags: 0x44 variadic
// Checksum 0x5397b05d, Offset: 0x7691
// Size: 0xff
function private function_f1d6d9665bdaca0a( endonevent, func, ... )
{
    sceneobjectdata = self;
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    if ( !isdefined( sceneobjectdata.activeanimationplaying ) )
    {
        entity endon( "death_or_disconnect" );
        
        if ( isdefined( endonevent ) )
        {
            if ( !isarray( endonevent ) )
            {
                endonevent = [ endonevent ];
            }
            
            foreach ( endonname in endonevent )
            {
                entity endon( endonname );
            }
        }
        
        sceneobjectdata waittill( "scene_anim_playing" );
    }
    
    entity builtin [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe12660d1, Offset: 0x7798
// Size: 0xa8
function private function_909c00577c56aa35( animrate )
{
    sceneobjectdata = self;
    
    if ( !isdefined( animrate ) )
    {
        animrate = 1;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAnimRate" );
    
    if ( isdefined( typefunc ) && typefunc != &function_909c00577c56aa35 )
    {
        sceneobjectdata [[ typefunc ]]( animrate );
        return;
    }
    
    if ( isdefined( sceneobjectdata.activeanimation ) && sceneobjectdata.activeanimationtype == "DeltaAnimation" )
    {
        entity = sceneobjectdata function_15e572f4ed82dd1c();
        
        if ( isdefined( entity ) )
        {
            entity setanimrate( sceneobjectdata.activeanimation, animrate );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x4cdb0277, Offset: 0x7848
// Size: 0x8b
function private function_4c574c265ff9cd1e( animasset, timefrac )
{
    sceneobjectdata = self;
    
    if ( !isdefined( timefrac ) )
    {
        timefrac = 0;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAnimTime" );
    
    if ( isdefined( typefunc ) && typefunc != &function_4c574c265ff9cd1e )
    {
        sceneobjectdata [[ typefunc ]]( animasset, timefrac );
        return;
    }
    
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( isdefined( entity ) )
    {
        entity setanimtime( animasset, timefrac );
        entity dontinterpolate();
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x21b405f6, Offset: 0x78db
// Size: 0x106
function private function_51d450f220b5b126( lerptime, velocity )
{
    sceneobjectdata = self;
    
    if ( !isdefined( lerptime ) )
    {
        lerptime = 0;
    }
    
    if ( !isdefined( velocity ) )
    {
        velocity = ( 0, 0, 0 );
    }
    
    waittillframeend();
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetAnimLerp" );
    
    if ( isdefined( typefunc ) && typefunc != &function_51d450f220b5b126 )
    {
        sceneobjectdata [[ typefunc ]]( lerptime, velocity );
        return;
    }
    
    entities = sceneobjectdata function_f2fb9eed776f75ff();
    
    foreach ( entity in entities )
    {
        if ( isanimscripted( entity ) )
        {
            entity animscripted_blendin( lerptime, velocity, undefined, 1 );
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xc9c86be9, Offset: 0x79e9
// Size: 0x114
function private function_836a2a9d9ba59594( enabled )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSetProcBones" );
    
    if ( isdefined( typefunc ) && typefunc != &function_836a2a9d9ba59594 )
    {
        sceneobjectdata [[ typefunc ]]( enabled );
        return;
    }
    
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    proc_node = undefined;
    
    if ( isdefined( entity.animtree ) )
    {
        proc_node = function_b9b2c118602e27a6( "proc_node", entity );
    }
    
    if ( !isdefined( proc_node ) && sceneobjectdata.sceneobject.variant_object.animtree.name === "script_model" )
    {
        proc_node = function_2636cab8e33b8618();
    }
    
    if ( isdefined( proc_node ) )
    {
        weight = 1;
        
        if ( !enabled )
        {
            weight = 0;
        }
        
        if ( !isdefined( sceneobjectdata.activeanimationplaying ) )
        {
            sceneobjectdata waittill( "scene_anim_playing" );
        }
        
        entity setanim( proc_node, weight, 0 );
    }
}

#using_animtree( "script_model" );

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x3d674a1b, Offset: 0x7b05
// Size: 0xb
function private function_2636cab8e33b8618()
{
    return %script_model_proc_node;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xdb4f5b6e, Offset: 0x7b19
// Size: 0x71
function private function_9fb3f4e85f34d87b( entity )
{
    sceneobjectdata = self;
    
    if ( !isent( entity ) )
    {
        return 0;
    }
    
    if ( isspawner( entity ) )
    {
        return 0;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectMatchEntity" );
    
    if ( isdefined( typefunc ) && typefunc != &function_9fb3f4e85f34d87b )
    {
        return sceneobjectdata [[ typefunc ]]( entity );
    }
    
    return entity.classname == "script_model";
}

// Namespace scene
// Params 7, eflags: 0x4
// Checksum 0x10c09111, Offset: 0x7b93
// Size: 0x1da
function private function_8c745f4ef7a9726f( sceneroot, sceneplay, sceneobjectname, matchset, matchanimname, existing, inittype )
{
    sceneobjectdata = self;
    
    if ( isarray( matchset ) )
    {
        matchset = arraycopy( matchset );
        
        if ( isdefined( sceneobjectdata.entity ) )
        {
            foreach ( matchsetindex, existingent in matchset )
            {
                if ( isent( existingent ) && sceneobjectdata function_9fb3f4e85f34d87b( existingent ) )
                {
                    if ( existingent == sceneobjectdata.entity || existingent.animname == sceneobjectdata.entity.animname )
                    {
                        sceneobjectdata function_741d59e7b6c8d2fc( sceneroot, sceneplay, existingent, existing, inittype );
                        matchset[ matchsetindex ] = undefined;
                        break;
                    }
                }
            }
            
            return matchset;
        }
        
        foreach ( matchsetindex, existingent in matchset )
        {
            if ( isent( existingent ) && sceneobjectdata function_9fb3f4e85f34d87b( existingent ) )
            {
                if ( !matchanimname || existingent.animname == sceneobjectname )
                {
                    sceneobjectdata function_741d59e7b6c8d2fc( sceneroot, sceneplay, existingent, existing, inittype );
                    matchset[ matchsetindex ] = undefined;
                    break;
                }
            }
        }
    }
    
    return matchset;
}

// Namespace scene
// Params 6, eflags: 0x4
// Checksum 0x644ed9b1, Offset: 0x7d76
// Size: 0x154
function private function_46476cf72237e890( sceneroot, sceneplay, sceneobjectname, usedset, keyname, inittype )
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata function_741d59e7b6c8d2fc( sceneroot, sceneplay, sceneobjectdata.entity, 1, inittype );
        entnum = sceneobjectdata.entity getentitynumber();
        usedset[ entnum ] = sceneobjectdata.entity;
        return usedset;
    }
    
    foundentities = getentarray( sceneobjectname, keyname );
    
    foreach ( foundent in foundentities )
    {
        entnum = foundent getentitynumber();
        
        if ( isdefined( usedset ) && isdefined( usedset[ entnum ] ) )
        {
            continue;
        }
        
        if ( sceneobjectdata function_9fb3f4e85f34d87b( foundent ) )
        {
            sceneobjectdata function_741d59e7b6c8d2fc( sceneroot, sceneplay, foundent, 1, inittype );
            usedset[ entnum ] = foundent;
            break;
        }
    }
    
    return usedset;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xc9d6d38b, Offset: 0x7ed3
// Size: 0x5b
function private function_15e572f4ed82dd1c()
{
    sceneobjectdata = self;
    
    if ( !isdefined( sceneobjectdata.entity ) )
    {
        return undefined;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectGetAnimEntity" );
    
    if ( isdefined( typefunc ) && typefunc != &function_15e572f4ed82dd1c )
    {
        return sceneobjectdata [[ typefunc ]]();
    }
    
    return sceneobjectdata.entity;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x68791810, Offset: 0x7f37
// Size: 0x57
function private function_f2fb9eed776f75ff()
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectGetLinkEnts" );
    
    if ( isdefined( typefunc ) && typefunc != &function_f2fb9eed776f75ff )
    {
        return sceneobjectdata [[ typefunc ]]();
    }
    
    animentity = sceneobjectdata function_15e572f4ed82dd1c();
    return [ animentity ];
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xb784ca3d, Offset: 0x7f97
// Size: 0x72
function private function_de784fc1d0ea14bf()
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectGetAnimRoot" );
    
    if ( isdefined( typefunc ) && typefunc != &function_de784fc1d0ea14bf )
    {
        return sceneobjectdata [[ typefunc ]]();
    }
    
    entity = function_15e572f4ed82dd1c();
    
    if ( isdefined( entity ) && isdefined( entity.anim_getrootfunc ) )
    {
        return [[ entity.anim_getrootfunc ]]();
    }
    
    return undefined;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xbf191bcf, Offset: 0x8012
// Size: 0x117
function private object_teleport( origin, angles )
{
    sceneobjectdata = self;
    
    /#
        scene_debug::object_event( sceneobjectdata, "<dev string:x12c>", origin, angles );
    #/
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectTeleport" );
    
    if ( isdefined( typefunc ) && typefunc != &object_teleport )
    {
        sceneobjectdata [[ typefunc ]]( origin, angles );
        return;
    }
    
    entities = sceneobjectdata function_f2fb9eed776f75ff();
    
    foreach ( entity in entities )
    {
        if ( isdefined( entity ) )
        {
            entity dontinterpolate();
            
            if ( isdefined( origin ) )
            {
                entity.origin = origin;
            }
            
            if ( isdefined( angles ) )
            {
                entity.angles = angles;
            }
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe8546bc, Offset: 0x8131
// Size: 0x4b
function private object_velocity()
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectVelocity" );
    
    if ( isdefined( typefunc ) && typefunc != &object_velocity )
    {
        return sceneobjectdata [[ typefunc ]]();
    }
    
    return ( 0, 0, 0 );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xf0ed48c0, Offset: 0x8185
// Size: 0x5f, Type: bool
function private function_2b6987b67b25886a( previousentity, previoustag, newentity, newtag )
{
    if ( !isdefined( previousentity ) )
    {
        return false;
    }
    
    if ( !isdefined( newentity ) )
    {
        return false;
    }
    
    if ( previousentity != newentity )
    {
        return false;
    }
    
    if ( !isdefined( previoustag ) )
    {
        return false;
    }
    
    if ( !isdefined( newtag ) )
    {
        return false;
    }
    
    if ( previoustag != newtag )
    {
        return false;
    }
    
    return true;
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0x9b84729d, Offset: 0x81ed
// Size: 0x82
function private object_alignment_link( sceneplay, alignmentinfo, inittype, lerptime, initializing )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectLinkAnim" );
    
    if ( isdefined( typefunc ) && typefunc != &object_alignment_link )
    {
        sceneobjectdata [[ typefunc ]]( sceneplay, alignmentinfo, inittype, lerptime, initializing );
        return;
    }
    
    sceneobjectdata function_66fc84a0876a4b7c( sceneplay, alignmentinfo, inittype, lerptime );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0xe32bd58a, Offset: 0x8277
// Size: 0x497
function private function_66fc84a0876a4b7c( sceneplay, alignmentinfo, inittype, lerptime )
{
    sceneobjectdata = self;
    
    if ( inittype === "scene_init_prestream" )
    {
        return;
    }
    
    sceneobjectdata notify( "object_alignment_link" );
    function_7caec59d5958332( alignmentinfo );
    linkents = sceneobjectdata function_f2fb9eed776f75ff();
    
    if ( !( inittype === "scene_init_play" ) && isdefined( sceneplay ) && !sceneobjectdata function_240bf4f132c66497( sceneplay.shotinit ) )
    {
        return;
    }
    
    foreach ( entity in linkents )
    {
        if ( !isent( entity ) )
        {
            continue;
        }
        
        entity notify( "object_alignment_link" );
        linkedparent = entity getlinkedparent();
        
        if ( !isdefined( alignmentinfo ) || !isent( alignmentinfo.alignent ) )
        {
            if ( isdefined( linkedparent ) && isdefined( sceneobjectdata.linkedent ) )
            {
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x138>", entity.origin, entity.angles );
                #/
                
                entity notify( "object_alignment_unlink" );
                entity unlink();
                sceneobjectdata.linkedtag = undefined;
                sceneobjectdata.linkedent = undefined;
            }
            
            continue;
        }
        
        prevorigin = entity.origin;
        prevangles = entity.angles;
        var_fadcdafa4ba90e44 = function_2b6987b67b25886a( sceneobjectdata.linkedent, sceneobjectdata.linkedtag, alignmentinfo.alignent, alignmentinfo.aligntag );
        
        if ( !var_fadcdafa4ba90e44 && alignmentinfo.alignent != entity && !entity isragdoll() && ( linkedparent != alignmentinfo.alignent || ( sceneobjectdata.linkedtag ?? "" ) != ( alignmentinfo.aligntag ?? "" ) ) )
        {
            if ( !isdefined( lerptime ) || lerptime <= 0 )
            {
                sceneobjectdata object_teleport( alignmentinfo.origin, alignmentinfo.angles );
            }
            
            if ( isstring( alignmentinfo.aligntag ) )
            {
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x142>" + alignmentinfo.aligntag, alignmentinfo.alignent gettagorigin( alignmentinfo.aligntag ), alignmentinfo.alignent gettagangles( alignmentinfo.aligntag ) );
                #/
                
                if ( isplayer( entity ) )
                {
                    if ( !isdefined( entity.var_b36f7e54832612a4 ) )
                    {
                        entity playerlinkto( alignmentinfo.alignent, alignmentinfo.aligntag );
                    }
                }
                else if ( isagent( entity ) )
                {
                    entity linktomoveoffset( alignmentinfo.alignent, alignmentinfo.aligntag );
                    entity playerlinkedoffsetenable();
                    entity fixlinktointerpolationbug( 1 );
                }
                else
                {
                    entity linkto( alignmentinfo.alignent, alignmentinfo.aligntag, ( 0, 0, 0 ), ( 0, 0, 0 ) );
                }
                
                sceneobjectdata.linkedtag = alignmentinfo.aligntag;
                sceneobjectdata.linkedent = alignmentinfo.alignent;
                
                if ( lerptime > 0 )
                {
                    sceneobjectdata object_teleport( prevorigin, prevangles );
                }
                
                continue;
            }
            
            /#
                scene_debug::object_event( sceneobjectdata, "<dev string:x14b>", entity.origin, entity.angles );
            #/
            
            sceneobjectdata.linkedtag = undefined;
            sceneobjectdata.linkedent = alignmentinfo.alignent;
            
            if ( isplayer( entity ) )
            {
                if ( !isdefined( entity.var_b36f7e54832612a4 ) )
                {
                    entity playerlinkto( alignmentinfo.alignent );
                }
                
                continue;
            }
            
            if ( isagent( entity ) )
            {
                entity linktomoveoffset( alignmentinfo.alignent );
                entity playerlinkedoffsetenable();
                entity fixlinktointerpolationbug( 1 );
                continue;
            }
            
            entity linkto( alignmentinfo.alignent );
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x538a525e, Offset: 0x8716
// Size: 0x1a7
function private function_d87cb823e217a4ec( alignmentinfo )
{
    sceneobjectdata = self;
    sceneobjectdata notify( "object_alignment_unlink" );
    sceneobjectdata endon( "object_alignment_unlink" );
    sceneobjectdata endon( "object_alignment_link" );
    linkents = sceneobjectdata function_f2fb9eed776f75ff();
    
    foreach ( entity in linkents )
    {
        if ( !isent( entity ) )
        {
            continue;
        }
        
        entity notify( "object_alignment_unlink" );
        entity endon( "object_alignment_unlink" );
        entity endon( "object_alignment_link" );
    }
    
    waittillframeend();
    
    foreach ( entity in linkents )
    {
        if ( !isent( entity ) )
        {
            continue;
        }
        
        linkedparent = entity getlinkedparent();
        
        if ( linkedparent == alignmentinfo.alignent )
        {
            /#
                scene_debug::object_event( sceneobjectdata, "<dev string:x138>", entity.origin, entity.angles );
            #/
            
            entity unlink();
            sceneobjectdata.linkedtag = undefined;
            sceneobjectdata.linkedent = undefined;
        }
    }
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0x4a4f886e, Offset: 0x88c5
// Size: 0x3d7
function private function_b51fccb24b16290a( sceneplay, blink, bsetup, alignmentinfo, lerptime )
{
    sceneobjectdata = self;
    
    if ( blink )
    {
        function_7caec59d5958332( alignmentinfo );
    }
    
    linkents = sceneobjectdata function_f2fb9eed776f75ff();
    
    if ( bsetup && isdefined( sceneplay ) && !sceneobjectdata function_240bf4f132c66497( sceneplay.shotinit ) )
    {
        return;
    }
    
    foreach ( entity in linkents )
    {
        if ( !isent( entity ) )
        {
            continue;
        }
        
        linkedparent = entity getlinkedparent();
        
        if ( !isdefined( alignmentinfo ) || !isent( alignmentinfo.alignent ) )
        {
            if ( isdefined( linkedparent ) )
            {
                entity unlink();
            }
            
            return;
        }
        
        if ( blink )
        {
            prevorigin = entity.origin;
            prevangles = entity.angles;
            var_fadcdafa4ba90e44 = function_2b6987b67b25886a( sceneobjectdata.linkedent, sceneobjectdata.linkedtag, alignmentinfo.alignent, alignmentinfo.aligntag );
            
            if ( !var_fadcdafa4ba90e44 && alignmentinfo.alignent != entity && !entity isragdoll() && ( linkedparent != alignmentinfo.alignent || ( sceneobjectdata.linkedtag ?? "" ) != ( alignmentinfo.aligntag ?? "" ) ) )
            {
                if ( !isdefined( lerptime ) || lerptime <= 0 )
                {
                    sceneobjectdata object_teleport( alignmentinfo.origin, alignmentinfo.angles );
                }
                
                if ( isstring( alignmentinfo.aligntag ) )
                {
                    if ( isplayer( entity ) )
                    {
                        if ( !isdefined( entity.var_b36f7e54832612a4 ) )
                        {
                            entity playerlinkto( alignmentinfo.alignent, alignmentinfo.aligntag );
                        }
                    }
                    else if ( isagent( entity ) )
                    {
                        entity linktomoveoffset( alignmentinfo.alignent, alignmentinfo.aligntag );
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug( 1 );
                    }
                    else
                    {
                        entity linkto( alignmentinfo.alignent, alignmentinfo.aligntag, ( 0, 0, 0 ), ( 0, 0, 0 ) );
                    }
                    
                    sceneobjectdata.linkedtag = alignmentinfo.aligntag;
                    sceneobjectdata.linkedent = alignmentinfo.alignent;
                    
                    if ( lerptime > 0 )
                    {
                        sceneobjectdata object_teleport( prevorigin, prevangles );
                    }
                }
                else
                {
                    sceneobjectdata.linkedtag = undefined;
                    sceneobjectdata.linkedent = alignmentinfo.alignent;
                    
                    if ( isplayer( entity ) )
                    {
                        entity playerlinkto( alignmentinfo.alignent );
                    }
                    else if ( isagent( entity ) )
                    {
                        entity linktomoveoffset( alignmentinfo.alignent );
                        entity playerlinkedoffsetenable();
                        entity fixlinktointerpolationbug( 1 );
                    }
                    else
                    {
                        entity linkto( alignmentinfo.alignent );
                    }
                }
            }
            
            continue;
        }
        
        if ( linkedparent == alignmentinfo.alignent )
        {
            entity unlink();
            sceneobjectdata.linkedtag = undefined;
            sceneobjectdata.linkedent = undefined;
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x67e2f7be, Offset: 0x8ca4
// Size: 0x1d4
function private function_dee587549ec427a2( alignmentinfo, shotindex )
{
    sceneobjectdata = self;
    
    if ( !isdefined( shotindex ) )
    {
        shotindex = sceneobjectdata.sceneplay.shotinit;
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectFirstFrame" );
    
    if ( isdefined( typefunc ) && typefunc != &function_dee587549ec427a2 )
    {
        sceneobjectdata [[ typefunc ]]( alignmentinfo, shotindex );
    }
    else
    {
        if ( !isdefined( sceneobjectdata.entity ) )
        {
            return;
        }
        
        shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
        
        if ( shotanimations.size != 0 )
        {
            entity = sceneobjectdata function_15e572f4ed82dd1c();
            animasset = shotanimations[ 0 ];
            
            if ( isent( entity ) && entity.model != "" )
            {
                entity stopanimscripted();
                entity.origin = getstartorigin( alignmentinfo.origin, alignmentinfo.angles, animasset );
                entity.angles = getstartangles( alignmentinfo.origin, alignmentinfo.angles, animasset );
                entity setanimknob( animasset, 1, 0, 0 );
                entity setanimtime( animasset, 0 );
                entity dontinterpolate();
                
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x153>" + getxhashsourcename( getanimname( animasset ) ), entity.origin, entity.angles );
                #/
                
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x163>" + getxhashsourcename( getanimname( animasset ) ), alignmentinfo.origin, alignmentinfo.angles );
                #/
            }
        }
    }
    
    sceneobjectdata childthread object_shot_death_wait( sceneobjectdata.sceneplay, shotindex, sceneobjectdata.index );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x99025cdc, Offset: 0x8e80
// Size: 0x40
function private function_f63807284220f334()
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectCanAnimate" );
    
    if ( isdefined( typefunc ) && typefunc != &function_f63807284220f334 )
    {
        return sceneobjectdata [[ typefunc ]]();
    }
    
    return 1;
}

// Namespace scene
// Params 10, eflags: 0x4
// Checksum 0x94e64a25, Offset: 0x8ec9
// Size: 0x4ac
function private object_play_anim( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype )
{
    sceneobjectdata = self;
    sceneobjectdata.activeanimationtype = animationtype;
    sceneobjectdata.activeanimation = animasset;
    sceneobjectdata function_cef36d8c3e65c8c4( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype );
    
    if ( isdefined( animationtype ) )
    {
        sceneobjectdata.var_caa911de855ae014[ animationtype ] = notifystring;
    }
    
    if ( !isdefined( animationtype ) )
    {
        animationtype = "DeltaAnimation";
    }
    
    animplaybacktime = 0;
    
    if ( isent( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity notify( "scene_play_anim" );
    }
    
    sceneobjectdata notify( "scene_play_anim" );
    
    if ( animationtype == "DeltaAnimation" )
    {
        objecttype = sceneobjectdata object_get_type();
        
        if ( !isent( sceneobjectdata.entity ) )
        {
            n_anim_length = getanimlength( animasset );
            starttimeinseconds = 0;
            
            if ( var_142c2c5d44216f2a > 0 )
            {
                starttimeinseconds = n_anim_length * var_142c2c5d44216f2a;
            }
            
            var_1ae8ed0ceeb0170c = n_anim_length - starttimeinseconds;
            sceneobjectdata utility::waittill_any_timeout( var_1ae8ed0ceeb0170c, "scene_anim_ended" );
            sceneobjectdata function_df0d9181caf90b23( animasset, animationtype, notifystring );
            sceneobjectdata function_b635d3c89c265ba4( animationtype, shotindex, animindex );
            return;
        }
        
        anim_entity = sceneobjectdata function_15e572f4ed82dd1c();
        
        if ( !isdefined( anim_entity ) || anim_entity.model == "" && objecttype != "Types_ClientChar" )
        {
            sceneobjectdata function_df0d9181caf90b23( animasset, animationtype, notifystring );
            sceneobjectdata function_b635d3c89c265ba4( animationtype, shotindex, animindex );
            return;
        }
        
        if ( sceneobjectdata.sceneobject function_669f3ba695235683( shotindex ) )
        {
            function_7caec59d5958332( alignmentinfo );
            sceneobjectdata function_dee587549ec427a2( sceneobjectdata.alignmentinfo, shotindex );
            sceneobjectdata function_df0d9181caf90b23( animasset, animationtype, notifystring );
            sceneobjectdata function_b635d3c89c265ba4( animationtype, shotindex, animindex );
            return;
        }
        
        sceneobjectdata.entity endon( "death_or_disconnect" );
        anim_entity endon( "death_or_disconnect" );
        sceneobjectdata thread object_play_anim_waittill_end( animasset, [ sceneobjectdata.entity, anim_entity ], "death_or_disconnect", animationtype, notifystring );
        
        /#
            debugname = getxhashsourcename( getanimname( animasset ) );
            scene_debug::object_event( sceneobjectdata, "<dev string:x179>" + debugname, alignmentinfo.origin, alignmentinfo.angles );
        #/
        
        typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPlayAnim" );
        
        if ( isdefined( typefunc ) && typefunc != &object_play_anim )
        {
            animplaybacktime = sceneobjectdata [[ typefunc ]]( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime );
        }
        
        /#
            scene_debug::object_event( sceneobjectdata, "<dev string:x187>" + debugname, alignmentinfo.origin, alignmentinfo.angles );
        #/
    }
    else if ( animationtype == "CameraAnimation" )
    {
        /#
            scene_debug::object_event( sceneobjectdata, "<dev string:x195>" + animasset, alignmentinfo.origin, alignmentinfo.angles );
        #/
        
        typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPlayAnim" );
        
        if ( isdefined( typefunc ) && typefunc != &object_play_anim )
        {
            animplaybacktime = sceneobjectdata [[ typefunc ]]( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime );
        }
        
        /#
            scene_debug::object_event( sceneobjectdata, "<dev string:x1a3>" + animasset, alignmentinfo.origin, alignmentinfo.angles );
        #/
    }
    else if ( animationtype == "MayhemAnimation" )
    {
        if ( sceneobjectdata.sceneobject function_669f3ba695235683( shotindex ) )
        {
            function_7caec59d5958332( alignmentinfo );
            sceneobjectdata function_dee587549ec427a2( sceneobjectdata.alignmentinfo );
            sceneobjectdata function_df0d9181caf90b23( animasset, animationtype, notifystring );
            sceneobjectdata function_b635d3c89c265ba4( animationtype, shotindex, animindex );
            return;
        }
        
        /#
            scene_debug::object_event( sceneobjectdata, "<dev string:x1b1>" + animasset, alignmentinfo.origin, alignmentinfo.angles );
        #/
        
        typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPlayAnim" );
        
        if ( isdefined( typefunc ) && typefunc != &object_play_anim )
        {
            animplaybacktime = sceneobjectdata [[ typefunc ]]( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime );
        }
        
        /#
            scene_debug::object_event( sceneobjectdata, "<dev string:x1c1>" + animasset, alignmentinfo.origin, alignmentinfo.angles );
        #/
    }
    
    sceneobjectdata function_df0d9181caf90b23( animasset, animationtype, notifystring );
    sceneobjectdata function_b635d3c89c265ba4( animationtype, shotindex, animindex );
    return animplaybacktime;
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0xa691c2c9, Offset: 0x937e
// Size: 0xa2
function private object_play_anim_waittill_end( animasset, var_d3370a7b4787be17, waitfor, animationtype, notifystring )
{
    sceneobjectdata = self;
    
    if ( isdefined( animasset ) && animationtype == "DeltaAnimation" )
    {
        suffix = getxhashhexname( getanimname( animasset ) );
    }
    else
    {
        suffix = "";
    }
    
    sceneobjectdata notify( "object_play_anim_waittill_end" + suffix );
    sceneobjectdata endon( "object_play_anim_waittill_end" + suffix );
    utility::waittill_any_ents_array( var_d3370a7b4787be17, waitfor );
    
    if ( isdefined( sceneobjectdata ) )
    {
        sceneobjectdata thread function_df0d9181caf90b23( animasset, animationtype, notifystring );
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x458bd630, Offset: 0x9428
// Size: 0x1b4
function private function_df0d9181caf90b23( animasset, animationtype, notifystring )
{
    sceneobjectdata = self;
    
    if ( isdefined( animasset ) && animationtype == "DeltaAnimation" )
    {
        suffix = getxhashhexname( getanimname( animasset ) );
    }
    else
    {
        suffix = "";
    }
    
    sceneobjectdata notify( "object_play_anim_waittill_end" + suffix );
    ended = 0;
    
    if ( isdefined( sceneobjectdata.var_caa911de855ae014 ) )
    {
        foreach ( activeanimationtype, activenotifystring in sceneobjectdata.var_caa911de855ae014 )
        {
            if ( !isdefined( animationtype ) || animationtype == activeanimationtype )
            {
                if ( !isdefined( notifystring ) || notifystring == activenotifystring )
                {
                    sceneobjectdata notify( activenotifystring, "end" );
                    ended = 1;
                }
            }
        }
    }
    
    if ( ended )
    {
        if ( isdefined( animationtype ) )
        {
            sceneobjectdata.var_caa911de855ae014[ animationtype ] = undefined;
        }
        else
        {
            sceneobjectdata.var_caa911de855ae014 = undefined;
        }
    }
    
    if ( !isdefined( animasset ) || isdefined( sceneobjectdata.activeanimationtype ) && sceneobjectdata.activeanimationtype == animationtype && sceneobjectdata.activeanimation == animasset )
    {
        sceneobjectdata.activeanimation = undefined;
        sceneobjectdata.activeanimationtype = undefined;
        sceneobjectdata.activeanimationplaying = undefined;
        sceneobjectdata.pausestate = undefined;
    }
    
    sceneobjectdata notify( "scene_anim_ended" );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x849aa0f6, Offset: 0x95e4
// Size: 0x88
function private function_26364b7b16eb9611( notifystring, animasset )
{
    sceneobjectdata = self;
    sceneobjectdata childthread function_f41f57a25d231b2( notifystring );
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectWaitNotes" );
    
    if ( isdefined( typefunc ) && typefunc != &function_26364b7b16eb9611 )
    {
        sceneobjectdata [[ typefunc ]]( notifystring, animasset );
        return;
    }
    
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( isdefined( entity ) )
    {
        sceneobjectdata childthread notetrack::start_notetrack_wait( entity, notifystring, undefined, undefined, animasset );
    }
}

// Namespace scene
// Params 6, eflags: 0x4
// Checksum 0xc0fc45b9, Offset: 0x9674
// Size: 0x216
function private function_1e43ac4c885e2751( alignmentinfo, animasset, notifystring, var_142c2c5d44216f2a, var_ab6f54ef0991868f, animationtype )
{
    sceneobjectdata = self;
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( animationtype == "DeltaAnimation" )
    {
        assert( var_142c2c5d44216f2a >= 0 );
        assert( var_142c2c5d44216f2a <= 1 );
        assert( var_ab6f54ef0991868f >= 0 );
        assert( var_ab6f54ef0991868f <= 1 );
        typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectSkipAnim" );
        
        if ( isdefined( typefunc ) && typefunc != &function_1e43ac4c885e2751 )
        {
            sceneobjectdata [[ typefunc ]]( alignmentinfo, animasset, notifystring, var_142c2c5d44216f2a, var_ab6f54ef0991868f, animationtype );
            return;
        }
        
        if ( entity.model )
        {
            currenttime = entity getanimtime( animasset );
            
            if ( animislooping( animasset ) && var_ab6f54ef0991868f == 1 )
            {
                var_ab6f54ef0991868f = 0.999999;
            }
            
            notes = getnotetracks( animasset );
            
            foreach ( note in notes )
            {
                notetime = note[ "time" ];
                
                if ( notetime < var_142c2c5d44216f2a )
                {
                    continue;
                }
                
                if ( notetime > var_ab6f54ef0991868f )
                {
                    break;
                }
                
                notename = note[ "name" ];
                pfx = getsubstr( notename, 0, 3 );
                
                if ( pfx == "fs_" || pfx == "fc_" )
                {
                    thread notetrack::notetrack_handler( entity, undefined, notename, entity.animname, [], entity, undefined );
                }
            }
            
            entity setanimtime( animasset, var_ab6f54ef0991868f, undefined, 1 );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x7c05e71f, Offset: 0x9892
// Size: 0x21c
function private function_f41f57a25d231b2( notifystring, specificnotifyitem )
{
    sceneobjectdata = self;
    scenestatic = sceneobjectdata.sceneroot.scenestatic;
    
    if ( !( isdefined( scenestatic ) && isdefined( scenestatic.notifies ) ) )
    {
        return;
    }
    
    sceneobjecttype = sceneobjectdata.sceneobject function_827f7d9bd7a46afd();
    sceneobjectname = sceneobjectdata.sceneobject function_e8fb13f70b9a4db6();
    notifies = [];
    checktables = [ sceneobjectname, sceneobjecttype ];
    
    foreach ( tablename in checktables )
    {
        if ( isdefined( scenestatic.notifies[ tablename ] ) )
        {
            foreach ( notifyitem in scenestatic.notifies[ tablename ] )
            {
                notifies[ notifies.size ] = notifyitem;
            }
        }
    }
    
    foreach ( notifyitem in notifies )
    {
        if ( !isdefined( specificnotifyitem ) || specificnotifyitem == notifyitem )
        {
            sceneobjectdata thread function_5e29e5e1066417e1( notifystring, notifyitem );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x21ed3c97, Offset: 0x9ab6
// Size: 0x47
function private function_5e29e5e1066417e1( notifystring, notifyitem )
{
    sceneobjectdata = self;
    entity = sceneobjectdata function_15e572f4ed82dd1c();
    
    if ( isdefined( entity ) )
    {
        entity function_84ed189dc2017575( notifystring, notifyitem, sceneobjectdata );
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x28b77077, Offset: 0x9b05
// Size: 0x5f7
function private object_shot_death_wait( sceneplay, shotindex, sceneobjectindex )
{
    sceneobjectdata = self;
    sceneroot = sceneobjectdata.sceneroot;
    scenedata = sceneroot.scenedata;
    sceneobjectdata notify( "object_shot_death_wait" );
    sceneobjectdata endon( "object_shot_death_wait" );
    deathanim = sceneobjectdata.sceneobject function_e93b454561075f4a( shotindex );
    deathscenestop = sceneobjectdata.sceneobject function_6ff76756d536e49a();
    
    if ( !deathscenestop && !isdefined( deathanim ) )
    {
        return;
    }
    
    sceneplay endon( "scene_shot_cleanup" );
    entity = sceneobjectdata.entity;
    
    if ( isalive( entity ) )
    {
        entity val::set( "scene_shot", "death", 0 );
        attacker = undefined;
        point = undefined;
        meansofdeath = undefined;
        objweapon = undefined;
        inflictor = undefined;
        
        while ( entity.health > 1 )
        {
            entity waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        }
        
        if ( isagent( entity ) || !isdefined( direction_vec ) || direction_vec[ 0 ] == 0 && direction_vec[ 1 ] == 0 && direction_vec[ 2 ] == 0 && point[ 0 ] == 0 && point[ 1 ] == 0 && point[ 2 ] == 0 )
        {
            point = undefined;
        }
        
        if ( isdefined( entity ) && isdefined( deathanim ) )
        {
            animentity = sceneobjectdata function_15e572f4ed82dd1c();
            
            if ( isdefined( animentity ) )
            {
                animtype = sceneobjectdata.sceneobject function_e497f52b15295ba5();
                
                if ( !isdefined( sceneobjectdata.var_caa911de855ae014 ) )
                {
                    sceneobjectdata.var_caa911de855ae014 = [];
                }
                
                if ( !isdefined( sceneobjectdata.var_caa911de855ae014[ animtype ] ) )
                {
                    sceneobjectdata.var_caa911de855ae014[ animtype ] = "prepare" + shotindex + sceneobjectindex;
                }
                
                notifystring = sceneobjectdata.var_caa911de855ae014[ animtype ];
                sceneobjectdata.var_caa911de855ae014[ animtype ] = undefined;
                sceneobjectdata function_a11389d0848682df( attacker );
                var_e48b02e5abc87d9c = sceneobjectdata.sceneobject function_fc193fefe28dad3e( shotindex );
                
                if ( isdefined( var_e48b02e5abc87d9c ) )
                {
                    var_e48b02e5abc87d9c = strtok( var_e48b02e5abc87d9c, "," );
                    var_1874a1a2711b696d = [];
                    
                    foreach ( objectname in var_e48b02e5abc87d9c )
                    {
                        var_969ce076455a514d = sceneroot get_object( objectname );
                        
                        if ( isdefined( var_969ce076455a514d ) )
                        {
                            otheranimtype = var_969ce076455a514d.sceneobject function_e497f52b15295ba5();
                            
                            if ( !isdefined( var_969ce076455a514d.var_caa911de855ae014 ) )
                            {
                                var_969ce076455a514d.var_caa911de855ae014 = [];
                            }
                            
                            if ( !isdefined( var_969ce076455a514d.var_caa911de855ae014[ otheranimtype ] ) )
                            {
                                var_969ce076455a514d.var_caa911de855ae014[ otheranimtype ] = "prepare" + shotindex + var_969ce076455a514d.index;
                            }
                            
                            othernotifystring = var_969ce076455a514d.var_caa911de855ae014[ otheranimtype ];
                            otherdeathanim = var_969ce076455a514d.sceneobject function_e93b454561075f4a( shotindex );
                            
                            if ( isdefined( otherdeathanim ) )
                            {
                                var_969ce076455a514d.var_bf1c906895c88a1b = 1;
                                var_969ce076455a514d.var_2d749d02fccaab1 = var_969ce076455a514d.activeanimationplaying;
                                var_969ce076455a514d thread object_play_anim( shotindex, -1, othernotifystring, var_969ce076455a514d.alignmentinfo, otherdeathanim );
                                var_1874a1a2711b696d[ var_1874a1a2711b696d.size ] = var_969ce076455a514d;
                            }
                        }
                    }
                }
                
                sceneobjectdata.var_bf1c906895c88a1b = 1;
                params = { #currentshotname:sceneobjectdata.scenedata.scenescriptbundle function_d74f9d413aca8704( shotindex ), #var_1874a1a2711b696d:var_1874a1a2711b696d, #entity:entity, #sweapon:objweapon, #vpoint:point, #smeansofdeath:meansofdeath, #einflictor:inflictor, #eattacker:attacker };
                sceneobjectdata.sceneroot callback::callback( "callback_death_anim", params );
                sceneobjectdata object_play_anim( shotindex, -1, notifystring, sceneobjectdata.alignmentinfo, deathanim );
            }
        }
        
        if ( isdefined( var_1874a1a2711b696d ) )
        {
            foreach ( var_969ce076455a514d in var_1874a1a2711b696d )
            {
                if ( isalive( var_969ce076455a514d.entity ) )
                {
                    var_969ce076455a514d.entity val::set( "scene_shot", "death", 1 );
                    var_969ce076455a514d thread object_kill( attacker, point, meansofdeath, objweapon, inflictor );
                    var_969ce076455a514d.var_bf1c906895c88a1b = undefined;
                }
            }
        }
        
        entity val::set( "scene_shot", "death", 1 );
        sceneobjectdata object_kill( attacker, point, meansofdeath, objweapon, inflictor );
        sceneobjectdata.var_bf1c906895c88a1b = undefined;
    }
    
    if ( deathscenestop )
    {
        sceneroot thread stop();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x7b56f520, Offset: 0xa104
// Size: 0x1b, Type: bool
function private function_fd41f2c45f2ff86a()
{
    sceneobjectdata = self;
    return !sceneobjectdata.notanimated;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xd39d7bed, Offset: 0xa128
// Size: 0x5b
function private function_58a93a40f02daed7( animasset, animationtype )
{
    switch ( animationtype )
    {
        case #"hash_db2a102a7b3b4349":
            return getanimlength( animasset );
        case #"hash_3c9daf4fd5203d1c":
            return function_516be5ef89c77c57( animasset );
        case #"hash_eb9c9817350b0b1e":
            break;
    }
    
    return 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2a253af6, Offset: 0xa18c
// Size: 0xee
function private function_8f2e8c264c93b535()
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectAnimEnd" );
    
    if ( isdefined( typefunc ) && typefunc != &function_8f2e8c264c93b535 )
    {
        sceneobjectdata [[ typefunc ]]();
    }
    else if ( isdefined( sceneobjectdata.entity ) && isdefined( sceneobjectdata.var_caa911de855ae014 ) )
    {
        foreach ( message in sceneobjectdata.var_caa911de855ae014 )
        {
            sceneobjectdata.entity notify( message, "end" );
        }
    }
    
    sceneobjectdata.var_caa911de855ae014 = undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xca8e4d21, Offset: 0xa282
// Size: 0x88
function private object_pause( pausestate )
{
    sceneobjectdata = self;
    
    if ( ( sceneobjectdata.pausestate ?? 0 ) == pausestate )
    {
        return;
    }
    
    result = 1;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPauseAnim" );
    
    if ( isdefined( typefunc ) && typefunc != &object_pause )
    {
        result = sceneobjectdata [[ typefunc ]]( pausestate );
    }
    
    if ( result )
    {
        sceneobjectdata.pausestate = pausestate ? 1 : undefined;
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x231c0e7, Offset: 0xa312
// Size: 0x10b
function private function_2d0d8b2ed2c4709a()
{
    sceneobjectdata = self;
    
    /#
        if ( isdefined( sceneobjectdata.entity ) )
        {
            scene_debug::object_event( sceneobjectdata, "<dev string:x1d1>", sceneobjectdata.entity.origin, sceneobjectdata.entity.angles );
        }
    #/
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectStopAnim" );
    
    if ( isdefined( typefunc ) && typefunc != &function_2d0d8b2ed2c4709a )
    {
        sceneobjectdata [[ typefunc ]]();
    }
    else if ( isdefined( sceneobjectdata.entity ) && sceneobjectdata.activeanimationtype == "DeltaAnimation" )
    {
        sceneobjectdata.entity stopanimscripted();
    }
    
    sceneobjectdata.activeanimationtype = undefined;
    sceneobjectdata.activeanimation = undefined;
    sceneobjectdata.var_2d749d02fccaab1 = sceneobjectdata.activeanimationplaying;
    sceneobjectdata.activeanimationplaying = undefined;
    sceneobjectdata.pausestate = undefined;
    sceneobjectdata function_df0d9181caf90b23();
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x2795d45f, Offset: 0xa425
// Size: 0x185
function private object_cleanup( newsceneroot, var_d3db51aca025c1b1 )
{
    sceneobjectdata = self;
    
    if ( sceneobjectdata.issetup )
    {
        sceneobjectdata thread function_d87cb823e217a4ec( sceneobjectdata.alignmentinfo );
        typefunc = sceneobjectdata function_2b6f213d891785e5( "objectCleanup" );
        
        if ( isdefined( typefunc ) && typefunc != &object_cleanup )
        {
            sceneobjectdata [[ typefunc ]]( newsceneroot );
        }
        
        if ( isdefined( sceneobjectdata.entity ) )
        {
            /#
                if ( isplayer( sceneobjectdata.entity ) )
                {
                    sceneobjectdata.entity scene_debug::function_24a6aeb21d33a19b();
                }
            #/
            
            sceneobjectdata.entity val::reset_all( "scene_scene" );
            sceneobjectdata.entity utility::ent_flag_clear( "scene_active" );
            sceneobjectdata.entity.sceneobjectdata = undefined;
            sceneobjectdata function_6eed58b13f778351( undefined, undefined );
            
            if ( isdefined( sceneobjectdata.restoredontmelee ) )
            {
                sceneobjectdata.entity.dontmelee = sceneobjectdata.restoredontmelee;
            }
        }
        
        sceneobjectdata notify( "scene_ai_stealth" );
        
        if ( !isdefined( newsceneroot ) && sceneobjectdata function_664551610cc4c09f() )
        {
            sceneobjectdata object_delete();
        }
        
        if ( var_d3db51aca025c1b1 || sceneobjectdata object_get_type() == "Types_Actor" )
        {
            sceneobjectdata.entity = undefined;
            sceneobjectdata.existingentity = undefined;
        }
        
        sceneobjectdata.issetup = undefined;
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x82e2bf51, Offset: 0xa5b2
// Size: 0x85, Type: bool
function private function_664551610cc4c09f()
{
    sceneobjectdata = self;
    deletetype = sceneobjectdata.sceneobject function_772de5acb2e194c7();
    deletealways = deletetype == "DeleteAlways" || deletetype == "DeleteAlwaysNotInvolved";
    deletespawned = ( deletetype == "DeleteSpawned" || deletetype == "DeleteSpawnedNotInvolved" ) && !sceneobjectdata.existingentity;
    
    if ( deletealways || deletespawned )
    {
        return true;
    }
    
    return false;
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0xffa1f1be, Offset: 0xa640
// Size: 0x9f
function private object_kill( attacker, point, meansofdeath, objweapon, inflictor )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectKill" );
    
    if ( isdefined( typefunc ) && typefunc != &object_kill )
    {
        sceneobjectdata [[ typefunc ]]( point, attacker, inflictor, meansofdeath, objweapon );
        return;
    }
    
    if ( isalive( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity kill( point, attacker, inflictor, meansofdeath, objweapon );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x1c56ef99, Offset: 0xa6e7
// Size: 0x49
function private function_a11389d0848682df( attacker )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectSceneDeath" );
    
    if ( isdefined( typefunc ) && typefunc != &function_a11389d0848682df )
    {
        sceneobjectdata [[ typefunc ]]( attacker );
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xffba0213, Offset: 0xa738
// Size: 0xd2
function private object_delete()
{
    sceneobjectdata = self;
    
    /#
        if ( isdefined( sceneobjectdata.entity ) )
        {
            scene_debug::object_event( sceneobjectdata, "<dev string:x1d9>", sceneobjectdata.entity.origin, sceneobjectdata.entity.angles );
        }
    #/
    
    visibility_mode::function_4e6c654251b854e0( sceneobjectdata.entity );
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectDelete" );
    
    if ( isdefined( typefunc ) && typefunc != &object_delete )
    {
        sceneobjectdata [[ typefunc ]]();
    }
    else if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity delete();
    }
    
    sceneobjectdata.entity = undefined;
    sceneobjectdata.existingentity = undefined;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x4d51bf0f, Offset: 0xa812
// Size: 0x4a
function private function_2e0ec39304a5a328()
{
    sceneobjectdata = self;
    
    if ( sceneobjectdata.xcamplaying )
    {
        if ( isplayer( sceneobjectdata.entity ) )
        {
            sceneobjectdata.entity stopxcam();
        }
        
        sceneobjectdata.xcamplaying = undefined;
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x377463e9, Offset: 0xa864
// Size: 0x4e9
function private function_3c2e9847ed1dd391( sceneplay, shotindex )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPreStream" );
    
    if ( isdefined( typefunc ) && typefunc != &function_3c2e9847ed1dd391 )
    {
        sceneobjectdata [[ typefunc ]]( sceneplay, shotindex );
    }
    
    sceneobjectdata function_7caec59d5958332( sceneobjectdata.alignmentinfo );
    prestreamassets = sceneobjectdata.sceneroot.scenestatic.prestreamassets[ shotindex ];
    
    if ( isdefined( prestreamassets ) )
    {
        foreach ( assettype, var_f6e2e741f3d592bb in prestreamassets )
        {
            foreach ( assetindex, asset in var_f6e2e741f3d592bb.assets )
            {
                if ( assettype == "entity" )
                {
                    sceneplay.prestream.objects[ sceneplay.prestream.objects.size ] = { #origin:var_f6e2e741f3d592bb.origins[ assetindex ], #entity:asset };
                    continue;
                }
                
                assert( assettype == "<dev string:x1e3>" );
                sceneplay.prestream.models = 1;
                sceneplay.prestream.objects[ sceneplay.prestream.objects.size ] = { #origin:var_f6e2e741f3d592bb.origins[ assetindex ], #model:asset };
            }
        }
    }
    
    if ( isdefined( sceneobjectdata.alignmentinfo ) )
    {
        cameraanimation = sceneobjectdata function_64466e4b9ed25e4c( shotindex );
        shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
        
        if ( isplayer( sceneobjectdata.entity ) )
        {
            player = sceneobjectdata.entity;
            streamcameraorigin = undefined;
            
            if ( isdefined( cameraanimation ) )
            {
                streamcameraorigin = player getxcamposition( cameraanimation, 0, 0, sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles );
            }
            else if ( isdefined( shotanimations ) && shotanimations.size > 0 )
            {
                linktag = sceneobjectdata function_68d2c57d9f9e8a7e();
                animentity = sceneobjectdata function_15e572f4ed82dd1c();
                offset = ( 0, 0, player getplayerviewheight() );
                
                if ( animentity.model )
                {
                    startposang = animentity animation::function_bcb776397b6f4ce( shotanimations[ 0 ], linktag, 0, sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles );
                    
                    if ( isdefined( startposang ) )
                    {
                        streamcameraorigin = startposang[ "origin" ];
                        offset = rotatevector( offset, startposang[ "angles" ] );
                    }
                }
                
                if ( !isdefined( streamcameraorigin ) )
                {
                    streamcameraorigin = getstartorigin( sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles, shotanimations[ 0 ] );
                }
                
                if ( linktag != "tag_camera" )
                {
                    streamcameraorigin += offset;
                }
            }
            
            if ( isdefined( streamcameraorigin ) )
            {
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x1ec>", streamcameraorigin, ( 0, 0, 0 ) );
                #/
                
                playerinfo = sceneplay function_495a812f7545da04( player, streamcameraorigin );
            }
        }
        
        entity = sceneobjectdata function_15e572f4ed82dd1c();
        
        if ( isdefined( entity ) )
        {
            if ( shotanimations[ 0 ] && sceneobjectdata function_514b2f4dda4105ef( shotindex ) )
            {
                objectorigin = getstartorigin( sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles, shotanimations[ 0 ] );
            }
            else
            {
                objectorigin = sceneobjectdata.alignmentinfo.origin;
            }
            
            sceneplay.prestream.objects[ sceneplay.prestream.objects.size ] = { #origin:objectorigin, #entity:entity };
        }
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x3f5fdbd6, Offset: 0xad55
// Size: 0xf2
function private function_90aaff2103125c26( sceneplay, shotindex, sceneobjectindex )
{
    sceneobjectdata = self;
    sceneplay endon( "scene_stop" );
    sceneobjectdata endon( "scene_stop" );
    
    foreach ( message in sceneobjectdata.var_caa911de855ae014 )
    {
        sceneobjectdata endon( message );
    }
    
    sceneobjectdata childthread object_shot_death_wait( sceneplay, shotindex, sceneobjectindex );
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPrepare" );
    
    if ( isdefined( typefunc ) && typefunc != &function_90aaff2103125c26 )
    {
        sceneobjectdata [[ typefunc ]]( sceneplay, shotindex, sceneobjectindex );
    }
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x94683173, Offset: 0xae4f
// Size: 0x361
function private function_8207af582343cc24( sceneplay, shotindex, cameraanimation, shotanimations )
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        if ( sceneobjectdata.sceneobject function_aea14e0e13bbd667( shotindex ) )
        {
            sceneobjectdata.entity flagteleport();
        }
        
        if ( sceneobjectdata.sceneobject function_32571802b2e452ec( shotindex ) )
        {
            sceneobjectdata.entity val::set( "scene_scene", "hide", 2 );
            sceneobjectdata.entity val::set( "scene_scene", "ignoreall", 1 );
            sceneobjectdata.entity val::set( "scene_scene", "ignoreme", 1 );
            
            if ( isplayer( sceneobjectdata.entity ) )
            {
                sceneobjectdata.entity val::set( "scene_scene", "fire", 0 );
            }
        }
        
        if ( sceneobjectdata.sceneobject function_dd5572420d3225( shotindex ) )
        {
            sceneobjectdata.entity val::reset( "scene_scene", "hide" );
            sceneobjectdata.entity show();
            
            if ( isagent( sceneobjectdata.entity ) )
            {
                sceneobjectdata.entity visiblesolid();
            }
            
            sceneobjectdata.entity val::reset( "scene_scene", "ignoreall" );
            sceneobjectdata.entity val::reset( "scene_scene", "ignoreme" );
            
            if ( isplayer( sceneobjectdata.entity ) )
            {
                sceneobjectdata.entity val::reset( "scene_scene", "fire" );
            }
        }
        
        sceneobjectdata.entity val::set( "scene_scene", "cast_shadow", sceneobjectdata.sceneobject function_a7e0b6b74f965439( shotindex ) );
        
        if ( !sceneobjectdata.sceneobject function_6ea442b0feacbc1() && !sceneobjectdata.sceneobject function_599407b70d85262c( shotindex ) )
        {
            sceneobjectdata.entity val::set( "scene_shot", "damage", 0 );
        }
        
        if ( isplayer( sceneobjectdata.entity ) )
        {
            tweenin = sceneobjectdata.sceneobject function_abc779ad811bdf13( shotindex );
            
            if ( tweenin > 0 )
            {
                viewmodelvisible = sceneobjectdata.sceneobject function_3f64f25a6a59bb06( shotindex );
                stopxcam = sceneobjectdata.sceneobject function_7136c10c7e8929fa( shotindex );
                
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x1fa>" + sceneobjectdata.entity getentitynumber(), sceneobjectdata.entity.origin, sceneobjectdata.entity.angles );
                #/
                
                sceneobjectdata.entity function_367943e54489cb93( 0, tweenin, !viewmodelvisible, stopxcam );
            }
        }
    }
    
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectSetup" );
    
    if ( isdefined( typefunc ) && typefunc != &function_8207af582343cc24 )
    {
        sceneobjectdata [[ typefunc ]]( shotindex, cameraanimation, shotanimations );
    }
    
    sceneobjectdata function_4e92f5a18dba45e9( sceneplay, shotindex );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xa265d4e, Offset: 0xb1b8
// Size: 0x202
function private function_4e92f5a18dba45e9( sceneplay, shotindex )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectPlayerVisUpdate" );
    
    if ( isdefined( typefunc ) && typefunc != &function_4e92f5a18dba45e9 )
    {
        sceneobjectdata [[ typefunc ]]( sceneplay, shotindex );
        return;
    }
    
    playervis = sceneobjectdata.sceneobject function_efc13d404c1080ac( shotindex );
    
    switch ( playervis )
    {
        case #"hash_3ad6948f3f563d6":
            var_dab149a7be99cf48 = sceneplay.var_e721f1409fd57ca9;
            var_301dbca30c15232a = 1;
            break;
        case #"hash_e5385d60528b88a5":
            var_dab149a7be99cf48 = arraydifference( level.players, sceneplay.var_e721f1409fd57ca9 );
            var_301dbca30c15232a = 1;
            break;
        case #"hash_53001182cd15d423":
            var_301dbca30c15232a = 0;
            break;
        default:
            var_dab149a7be99cf48 = sceneobjectdata.sceneroot.scenestatic.exclusiveplayers;
            var_301dbca30c15232a = isarray( sceneobjectdata.var_dab149a7be99cf48 ) || isarray( var_dab149a7be99cf48 );
            break;
    }
    
    if ( var_301dbca30c15232a )
    {
        animentities = sceneobjectdata function_f2fb9eed776f75ff();
        
        foreach ( animentity in animentities )
        {
            if ( !isent( animentity ) )
            {
                continue;
            }
            
            if ( isdefined( var_dab149a7be99cf48 ) )
            {
                animentity val::set( "scene_exclusive", "hide", var_dab149a7be99cf48 );
            }
            else
            {
                animentity val::reset( "scene_exclusive", "hide" );
            }
            
            sceneobjectdata.var_dab149a7be99cf48 = var_dab149a7be99cf48;
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x5f580c17, Offset: 0xb3c2
// Size: 0x4b
function private function_240bf4f132c66497( shotindex )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectLinkSetup" );
    
    if ( isdefined( typefunc ) && typefunc != &function_240bf4f132c66497 )
    {
        return sceneobjectdata [[ typefunc ]]( shotindex );
    }
    
    return 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x6ec66e88, Offset: 0xb416
// Size: 0x175
function private function_5a563c79ceb8a795( shotindex )
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity val::reset_all( "scene_shot" );
        
        if ( isplayer( sceneobjectdata.entity ) )
        {
            tweenout = sceneobjectdata.sceneobject function_c602a792da7056a0( shotindex );
            
            if ( tweenout > 0 )
            {
                viewmodelvisible = sceneobjectdata.sceneobject function_1201bc2837054709( shotindex );
                stopxcam = sceneobjectdata.sceneobject function_e844c8047276c3f9( shotindex );
                
                /#
                    scene_debug::object_event( sceneobjectdata, "<dev string:x20e>" + sceneobjectdata.entity getentitynumber(), sceneobjectdata.entity.origin, sceneobjectdata.entity.angles );
                #/
                
                sceneobjectdata.entity function_367943e54489cb93( 1, tweenout, !viewmodelvisible, stopxcam );
            }
        }
    }
    
    if ( isent( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity notify( "scene_shot_cleanup" );
    }
    
    sceneobjectdata notify( "scene_shot_cleanup" );
    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectCleanup" );
    
    if ( isdefined( typefunc ) && typefunc != &function_5a563c79ceb8a795 )
    {
        sceneobjectdata [[ typefunc ]]( shotindex );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x1741d65e, Offset: 0xb593
// Size: 0x136
function private function_6bf501072826e845( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    animations = [];
    objtype = sceneobject function_827f7d9bd7a46afd();
    
    switch ( objtype )
    {
        case #"hash_873689dd62a87ffa":
            shotanimations = sceneobject.variant_object.shots[ shotindex ].mayhemanimations;
            
            if ( isdefined( shotanimations ) )
            {
                for ( animationindex = 0; animationindex < shotanimations.size ; animationindex++ )
                {
                    animations[ animationindex ] = shotanimations[ animationindex ].mayhemanimation;
                }
            }
            
            break;
        default:
            shotanimations = sceneobject.variant_object.shots[ shotindex ].deltaanimations;
            
            if ( isdefined( shotanimations ) )
            {
                for ( animationindex = 0; animationindex < shotanimations.size ; animationindex++ )
                {
                    shotanimation = shotanimations[ animationindex ];
                    animasset = sceneobjectdata function_465d05ff89283a66( shotindex, shotanimation );
                    animations[ animationindex ] = animasset;
                }
            }
            
            break;
    }
    
    return animations;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xd5f38f51, Offset: 0xb6d2
// Size: 0xdb
function private function_465d05ff89283a66( shotindex, shotanimation )
{
    sceneobjectdata = self;
    
    if ( isdefined( shotanimation.alternateanimations ) && isdefined( sceneobjectdata.animaltname ) )
    {
        for ( altnameidx = 0; altnameidx < sceneobjectdata.animaltname.size ; altnameidx++ )
        {
            hashindex = getxhash( sceneobjectdata.animaltname[ altnameidx ] );
            altanim = shotanimation.alternateanimations[ hashindex ];
            
            if ( isdefined( altanim.animation.id ) )
            {
                return altanim.animation.id;
            }
        }
    }
    
    return shotanimation.deltaanimation.id;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x3c1b78b2, Offset: 0xb7b6
// Size: 0xd5
function private function_87d0356b39cc55c7( shotindex, animationindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    shotanimations = sceneobject.variant_object.shots[ shotindex ].deltaanimations;
    
    if ( isdefined( shotanimations ) )
    {
        shotanimation = shotanimations[ animationindex ];
        
        if ( isdefined( shotanimation.alternateanimations ) )
        {
            altanim = shotanimation.alternateanimations[ #"hash_311bb5e0639d55f9" ];
            
            if ( isdefined( altanim.animation.id ) )
            {
                return altanim.animation.id;
            }
        }
    }
    
    return undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xc06b0841, Offset: 0xb894
// Size: 0xb5
function private function_64466e4b9ed25e4c( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    
    if ( isplayer( sceneobjectdata.entity ) )
    {
        if ( sceneobject.variant_object.shots[ shotindex ].var_6d1caa948c9f0eb3 )
        {
            if ( sceneobjectdata.entity getcamerathirdperson() )
            {
                return undefined;
            }
        }
    }
    
    cameraanimation = sceneobject.variant_object.shots[ shotindex ].cameraanimation;
    
    if ( cameraanimation == "" )
    {
        cameraanimation = undefined;
    }
    
    return cameraanimation;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe027f140, Offset: 0xb952
// Size: 0x69, Type: bool
function private function_514b2f4dda4105ef( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    var_9a610c3ddeb968a6 = sceneobject function_18f1564ba0e28c5( shotindex );
    var_f3215d4735cea02f = !sceneobject.variant_object.var_ca0583007f3fc927;
    return var_9a610c3ddeb968a6 && var_f3215d4735cea02f;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x6b8f5bdf, Offset: 0xb9c4
// Size: 0xff, Type: bool
function private function_7a4516ac3b008d7( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    var_321b4a288e57064f = istrue( shotobject.removeweapon );
    var_54a7695fe9771ba8 = istrue( sceneobject.variant_object.removeweapon );
    var_d638fc76d53bdbc1 = undefined;
    
    if ( isplayer( sceneobjectdata.entity ) || !isdefined( sceneobjectdata.entity ) )
    {
        var_d638fc76d53bdbc1 = 1;
    }
    else
    {
        entity_weapon = sceneobjectdata.entity.weapon;
        var_d638fc76d53bdbc1 = isdefined( entity_weapon ) && !isnullweapon( entity_weapon );
    }
    
    if ( ( var_321b4a288e57064f || var_54a7695fe9771ba8 ) && var_d638fc76d53bdbc1 )
    {
        return true;
    }
    
    return false;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x8f83b2be, Offset: 0xbacc
// Size: 0x5c, Type: bool
function private function_9ac3c230848eee95( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.var_4e81bbeb05c06014 );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xca408baa, Offset: 0xbb31
// Size: 0x5c, Type: bool
function private function_3e768ed8916f0542( shotindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.var_b296b7b37154feec );
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x713c199b, Offset: 0xbb96
// Size: 0x79
function private function_bb5b08e9ff4407ee( shotindex, overridetype, overridevalue )
{
    sceneobjectdata = self;
    
    if ( !isdefined( sceneobjectdata.shotoverrides ) )
    {
        sceneobjectdata.shotoverrides = [];
    }
    
    if ( !isdefined( sceneobjectdata.shotoverrides[ overridetype ] ) )
    {
        sceneobjectdata.shotoverrides[ overridetype ] = [];
    }
    
    sceneobjectdata.shotoverrides[ overridetype ][ shotindex ] = overridevalue;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x1fa032b9, Offset: 0xbc17
// Size: 0x67
function private function_aa1705ea1d6cddfa( shotindex, overridetype )
{
    sceneobjectdata = self;
    assert( isint( shotindex ) );
    
    if ( !isdefined( sceneobjectdata.shotoverrides ) )
    {
        return undefined;
    }
    
    if ( !isdefined( sceneobjectdata.shotoverrides[ overridetype ] ) )
    {
        return undefined;
    }
    
    return sceneobjectdata.shotoverrides[ overridetype ][ shotindex ];
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x85b819e1, Offset: 0xbc87
// Size: 0x35, Type: bool
function private function_9a1b14ef2ca6596f()
{
    sceneobjectdata = self;
    objtype = sceneobjectdata object_get_type();
    return objtype == "Types_XCam" || objtype == "Types_Mayhem";
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0xa14a257a, Offset: 0xbcc5
// Size: 0x3d5
function private function_11c95ca4a274fbdb( shotindexes, sceneplay, sceneobjectindex )
{
    sceneobjectdata = self;
    scenedata = sceneobjectdata.scenedata;
    scenestatic = sceneobjectdata.sceneroot.scenestatic;
    
    if ( sceneobjectdata.sceneobject function_5c6f9c08917e11e6() || sceneobjectdata.var_bf1c906895c88a1b )
    {
        return 0;
    }
    
    if ( scenestatic.excludeplayers && sceneobjectdata object_get_type() == "Types_Player" )
    {
        return 0;
    }
    
    /#
        if ( getdvarint( @"hash_582006711e98ef1", 0 ) && sceneobjectdata object_get_type() == "<dev string:x223>" || getdvarint( @"hash_b45889edacd89047", 0 ) && sceneobjectdata object_get_type() == "<dev string:x233>" )
        {
            return 0;
        }
        
        if ( getdvarint( @"hash_2f8a6d96bf83a0a9", 0 ) && sceneobjectdata object_get_type() == "<dev string:x242>" )
        {
            return 0;
        }
    #/
    
    if ( scenestatic.var_9e562de25765fd05 && sceneobjectdata object_get_type() != "Types_Player" )
    {
        return 0;
    }
    
    if ( !isarray( shotindexes ) )
    {
        shotindexes = [ shotindexes ];
    }
    
    if ( sceneobjectdata.sceneobject function_1fcfdc7f5267fb97() )
    {
        return 0;
    }
    
    if ( scenestatic.var_854da17aefaac034 && sceneobjectdata object_get_type() == "Types_XCam" && scenestatic.var_854da17aefaac034 != sceneobjectdata.sceneobject function_e8fb13f70b9a4db6() )
    {
        return 0;
    }
    
    result = 0;
    animated = sceneobjectdata function_fd41f2c45f2ff86a();
    
    foreach ( shotindex in shotindexes )
    {
        var_839923cce2b81937 = sceneobjectdata function_ba7dd0b6fdbc2793( shotindex );
        
        if ( var_839923cce2b81937 == "ForceNotInvolved" )
        {
            continue;
        }
        else if ( var_839923cce2b81937 == "ForceInvolved" )
        {
            if ( isdefined( sceneplay ) && isdefined( sceneobjectindex ) )
            {
                if ( !isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) )
                {
                    sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] = [];
                }
                
                sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ][ shotindex ] = 1;
                result = 1;
            }
            else
            {
                return 1;
            }
            
            continue;
        }
        
        doeshide = sceneobjectdata.sceneobject function_32571802b2e452ec( shotindex );
        doesshow = sceneobjectdata.sceneobject function_dd5572420d3225( shotindex );
        
        if ( !sceneobjectdata.nonvisible && ( !animated || doeshide || doesshow ) )
        {
            if ( isdefined( sceneplay ) && isdefined( sceneobjectindex ) )
            {
                if ( !isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) )
                {
                    sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] = [];
                }
                
                sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ][ shotindex ] = 1;
                result = 1;
            }
            else
            {
                return 1;
            }
            
            continue;
        }
        
        shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
        cameraanimation = sceneobjectdata function_64466e4b9ed25e4c( shotindex );
        
        if ( shotanimations.size != 0 || isdefined( cameraanimation ) )
        {
            if ( isdefined( sceneplay ) && isdefined( sceneobjectindex ) )
            {
                if ( !isdefined( sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] ) )
                {
                    sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ] = [];
                }
                
                sceneplay.var_caf7bc39e6b19dd5[ sceneobjectindex ][ shotindex ] = 1;
                result = 1;
                continue;
            }
            
            return 1;
        }
    }
    
    return result;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x554639a5, Offset: 0xc0a3
// Size: 0x45
function private function_ba7dd0b6fdbc2793( shotindex )
{
    sceneobjectdata = self;
    return sceneobjectdata.sceneobject.variant_object.shots[ shotindex ].ForceInvolved;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x21949745, Offset: 0xc0f1
// Size: 0x20
function private object_get_type()
{
    sceneobjectdata = self;
    return sceneobjectdata.sceneobject function_827f7d9bd7a46afd();
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xf35beb53, Offset: 0xc11a
// Size: 0x214
function private object_lookat_target( shotindex, enable )
{
    sceneobjectdata = self;
    
    if ( !( isdefined( anim.var_7a467f51952fc7be ) && isdefined( anim.var_89690e2f5b3c4893 ) ) || !isent( sceneobjectdata.entity ) )
    {
        return;
    }
    
    if ( enable )
    {
        lookbehavior = sceneobjectdata.sceneobject function_42b2d28bdc6a24c2( shotindex );
        
        if ( isdefined( lookbehavior ) )
        {
            sceneobjectdata.entity val::set( "scene_shot", "look_behavior", lookbehavior );
        }
    }
    
    if ( isdefined( sceneobjectdata.var_259086f4136ca3af ) )
    {
        sceneobjectdata.entity notify( "object_lookat_target" );
        sceneobjectdata.entity [[ anim.var_89690e2f5b3c4893 ]]( sceneobjectdata.var_259086f4136ca3af );
        sceneobjectdata.var_259086f4136ca3af = undefined;
    }
    
    if ( enable )
    {
        targetname = sceneobjectdata.sceneobject function_2f5f32051e506c1a( shotindex );
        
        if ( isdefined( targetname ) )
        {
            if ( tolower( targetname ) == "player" )
            {
                [ sceneobjectdata.var_259086f4136ca3af ] = utility::get_array_of_closest( sceneobjectdata.entity.origin, level.players );
            }
            else
            {
                sceneroot = sceneobjectdata.sceneroot;
                var_969ce076455a514d = sceneroot get_object( targetname );
                
                if ( isdefined( var_969ce076455a514d ) )
                {
                    sceneobjectdata.var_259086f4136ca3af = var_969ce076455a514d function_15e572f4ed82dd1c();
                }
                
                if ( !isdefined( sceneobjectdata.var_259086f4136ca3af ) )
                {
                    sceneobjectdata.var_259086f4136ca3af = function_2c2907d07310b0e( targetname );
                }
            }
            
            if ( isdefined( sceneobjectdata.var_259086f4136ca3af ) )
            {
                sceneobjectdata.entity utility::delaythreadendon( level.framedurationseconds, [ "scene_shot_cleanup", "object_lookat_target" ], anim.var_7a467f51952fc7be, sceneobjectdata.var_259086f4136ca3af );
            }
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x55d78055, Offset: 0xc336
// Size: 0x19b
function private function_ede93dead318f379( entity )
{
    sceneobjectdata = self;
    
    if ( isdefined( entity ) )
    {
        body = undefined;
        head = undefined;
        hat = undefined;
        
        if ( isdefined( sceneobjectdata.sceneobject.variant_object.overridebody ) )
        {
            body = sceneobjectdata.sceneobject.variant_object.overridebody;
        }
        
        if ( isdefined( sceneobjectdata.sceneobject.variant_object.overridehead ) )
        {
            head = sceneobjectdata.sceneobject.variant_object.overridehead;
        }
        
        if ( isdefined( sceneobjectdata.sceneobject.variant_object.overridehat ) )
        {
            hat = sceneobjectdata.sceneobject.variant_object.overridehat;
        }
        
        if ( isdefined( head ) || isdefined( body ) || isdefined( hat ) )
        {
            if ( !isdefined( body ) )
            {
                body = entity.model;
            }
            
            if ( !isdefined( head ) )
            {
                head = entity.headmodel;
            }
            
            if ( !isdefined( hat ) )
            {
                hat = entity.hatmodel;
            }
            
            if ( isdefined( body ) )
            {
                entity detachall();
                entity setmodel( body );
            }
            
            if ( isdefined( head ) || isdefined( hat ) )
            {
                entity detachall();
                
                if ( isdefined( head ) )
                {
                    entity attach( head );
                }
                
                if ( isdefined( hat ) )
                {
                    entity attach( hat );
                }
            }
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x8916fb48, Offset: 0xc4d9
// Size: 0xb
function private function_827f7d9bd7a46afd()
{
    return self.variant_type;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x29977b12, Offset: 0xc4ed
// Size: 0x38
function private function_e497f52b15295ba5()
{
    sceneobject = self;
    animtype = "DeltaAnimation";
    
    if ( sceneobject function_827f7d9bd7a46afd() == "Types_Mayhem" )
    {
        animtype = "MayhemAnimation";
    }
    
    return animtype;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x4149aaf6, Offset: 0xc52e
// Size: 0x114
function private function_fc09a0af0b50d3d4()
{
    sceneobject = self;
    
    if ( sceneobject function_827f7d9bd7a46afd() == "Types_ClientChar" )
    {
        return undefined;
    }
    
    if ( isdefined( sceneobject.variant_object.aitypename ) )
    {
        return "aitype";
    }
    
    if ( isdefined( sceneobject.variant_object.charactername ) )
    {
        return "character";
    }
    
    if ( sceneobject.variant_object vehicle::get_ref() || sceneobject.variant_object.vehiclename )
    {
        return "vehicle";
    }
    
    if ( isdefined( sceneobject.variant_object.xcompositemodelname ) )
    {
        return "xcompositemodel";
    }
    
    if ( isdefined( sceneobject.variant_object.xmodelname ) )
    {
        return "xmodel";
    }
    
    if ( isdefined( sceneobject.variant_object.var_db1bc880a4afead0 ) )
    {
        return "operatorskin";
    }
    
    if ( isdefined( sceneobject.variant_object.bulletweaponname ) )
    {
        return "bulletweapon";
    }
    
    return "mayhem";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x88f18e9c, Offset: 0xc64b
// Size: 0x151
function private function_ccb2b599f3b8ef77()
{
    sceneobject = self;
    
    if ( sceneobject function_827f7d9bd7a46afd() == "Types_ClientChar" )
    {
        return undefined;
    }
    
    if ( isdefined( sceneobject.variant_object.aitypename ) )
    {
        return sceneobject.variant_object.aitypename;
    }
    
    if ( isdefined( sceneobject.variant_object.charactername ) )
    {
        return sceneobject.variant_object.charactername;
    }
    
    if ( isdefined( sceneobject.variant_object.vehiclename ) )
    {
        return sceneobject.variant_object.vehiclename;
    }
    
    if ( isdefined( sceneobject.variant_object.xcompositemodelname ) )
    {
        return sceneobject.variant_object.xcompositemodelname;
    }
    
    if ( isdefined( sceneobject.variant_object.var_db1bc880a4afead0 ) )
    {
        return sceneobject.variant_object.var_db1bc880a4afead0;
    }
    
    if ( isdefined( sceneobject.variant_object.bulletweaponname ) )
    {
        return sceneobject.variant_object.bulletweaponname;
    }
    
    return sceneobject.variant_object.xmodelname;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x94a6d11a, Offset: 0xc7a5
// Size: 0x25, Type: bool
function private function_16e90b61b72fb539()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_e6841d0ebec79853 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe6fa406c, Offset: 0xc7d3
// Size: 0x3f
function private function_6280c600ae0d180d()
{
    sceneobject = self;
    
    if ( isdefined( sceneobject.variant_object.var_f8a7bf5180afeefa ) )
    {
        return sceneobject.variant_object.var_f8a7bf5180afeefa;
    }
    
    return 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xdb1961e2, Offset: 0xc81b
// Size: 0x24
function private function_e8fb13f70b9a4db6()
{
    sceneobject = self;
    return sceneobject.variant_object.name;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2bb6035b, Offset: 0xc848
// Size: 0x25, Type: bool
function private function_e3e0913c7903daa4()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.firstframe );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xfcf640e1, Offset: 0xc876
// Size: 0x4d, Type: bool
function private function_669f3ba695235683( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return isdefined( shotobject ) && shotobject.firstframeonly;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x9d3b9d75, Offset: 0xc8cc
// Size: 0x25, Type: bool
function private function_5c6f9c08917e11e6()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.disabled );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x1ac58b2, Offset: 0xc8fa
// Size: 0x2c, Type: bool
function private function_772de5acb2e194c7()
{
    sceneobject = self;
    return sceneobject.variant_object.deletetype ?? "None";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x174d0768, Offset: 0xc92f
// Size: 0x2c, Type: bool
function private function_37b12fc2df71936b()
{
    sceneobject = self;
    return sceneobject.variant_object.globaltype ?? "None";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xbe85b699, Offset: 0xc964
// Size: 0x25, Type: bool
function private function_6ea442b0feacbc1()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.takedamage );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xc0af75c, Offset: 0xc992
// Size: 0x25, Type: bool
function private function_6ff76756d536e49a()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_b1188d6a6c31ca63 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xf9ce85a9, Offset: 0xc9c0
// Size: 0x28, Type: bool
function private function_8d6340a41bdf10ed()
{
    sceneobject = self;
    return sceneobject.variant_object.clientcharacterindex ?? 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe4c1334c, Offset: 0xc9f1
// Size: 0x25, Type: bool
function private function_1fcfdc7f5267fb97()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_f5a633a119babf80 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2ef6ef02, Offset: 0xca1f
// Size: 0x25, Type: bool
function private function_93b14828f5b45de6()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_4710a4012f0c88cd );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x405a25a5, Offset: 0xca4d
// Size: 0x49
function private function_4641057744100c08()
{
    sceneobject = self;
    
    if ( isdefined( sceneobject.variant_object.animtree ) )
    {
        return sceneobject.variant_object.animtree.id;
    }
    
    return undefined;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xdff53f6c, Offset: 0xca9f
// Size: 0x25, Type: bool
function private function_6b060c2167962186()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.strictmatching );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x4df3d1bc, Offset: 0xcacd
// Size: 0x25, Type: bool
function private function_af186866fc828d5d()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_c25c6de963c32422 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2df9309, Offset: 0xcafb
// Size: 0x25, Type: bool
function private function_641be9c20b5bac24()
{
    sceneobject = self;
    return istrue( sceneobject.variant_object.var_137797a1eb1eeb5c );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xee39dc1a, Offset: 0xcb29
// Size: 0x11a
function private function_b1e1b14a9d31f8a6()
{
    sceneobject = self;
    objtype = sceneobject function_827f7d9bd7a46afd();
    result = [];
    
    for ( shotindex = 0; shotindex < sceneobject.variant_object.shots.size ; shotindex++ )
    {
        switch ( objtype )
        {
            case #"hash_873689dd62a87ffa":
                if ( sceneobject.variant_object.shots[ shotindex ].mayhemanimations.size > 0 )
                {
                    result[ "MayhemAnimation" ] = 1;
                    return result;
                }
                
                break;
            default:
                if ( sceneobject.variant_object.shots[ shotindex ].deltaanimations.size > 0 )
                {
                    result[ "DeltaAnimation" ] = 1;
                }
                
                if ( isdefined( sceneobject.variant_object.shots[ shotindex ].cameraanimation ) )
                {
                    result[ "CameraAnimation" ] = 1;
                }
                
                break;
        }
    }
    
    return result;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe27815da, Offset: 0xcc4c
// Size: 0x1bc
function private function_dc0adcd93b6ab4c4( shotindex )
{
    sceneobject = self;
    lengths = [];
    objtype = sceneobject function_827f7d9bd7a46afd();
    
    if ( shotindex < 0 || shotindex > sceneobject.variant_object.shots.size - 1 )
    {
        return lengths;
    }
    
    switch ( objtype )
    {
        case #"hash_873689dd62a87ffa":
            shotanimations = sceneobject.variant_object.shots[ shotindex ].mayhemanimations;
            
            if ( isdefined( shotanimations ) )
            {
                animationcount = shotanimations.size;
                
                for ( animationindex = 0; animationindex < animationcount ; animationindex++ )
                {
                    lengths[ animationindex ] = 0;
                    
                    if ( isdefined( shotanimations[ animationindex ].framecount ) && isdefined( shotanimations[ animationindex ].framerate ) )
                    {
                        lengths[ animationindex ] = shotanimations[ animationindex ].framecount * 1 / float( shotanimations[ animationindex ].framerate );
                    }
                }
            }
            
            break;
        default:
            shotanimations = sceneobject.variant_object.shots[ shotindex ].deltaanimations;
            
            if ( isdefined( shotanimations ) )
            {
                animationcount = shotanimations.size;
                
                for ( animationindex = 0; animationindex < animationcount ; animationindex++ )
                {
                    lengths[ animationindex ] = 0;
                    
                    if ( isanimation( shotanimations[ animationindex ].deltaanimation.id ) )
                    {
                        lengths[ animationindex ] = getanimlength( shotanimations[ animationindex ].deltaanimation.id );
                    }
                }
            }
            
            break;
    }
    
    return lengths;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xb0076b63, Offset: 0xce11
// Size: 0x61
function private function_e93b454561075f4a( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    
    if ( isdefined( shotobject.deathanim ) )
    {
        return shotobject.deathanim.id;
    }
    
    return undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9b667bcf, Offset: 0xce7b
// Size: 0x46
function private function_fc193fefe28dad3e( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_e48b02e5abc87d9c;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x11e86aa, Offset: 0xceca
// Size: 0x47, Type: bool
function private function_18f1564ba0e28c5( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return !shotobject.var_ca0583007f3fc927;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x364855fa, Offset: 0xcf1a
// Size: 0x47, Type: bool
function private function_32571802b2e452ec( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.preparehide );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x364855fa, Offset: 0xcf6a
// Size: 0x47, Type: bool
function private function_dd5572420d3225( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.prepareshow );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xa9924427, Offset: 0xcfba
// Size: 0x4e, Type: bool
function private function_efc13d404c1080ac( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.playervis ?? "All";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe268b341, Offset: 0xd011
// Size: 0x4b, Type: bool
function private function_a7e0b6b74f965439( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.castshadows ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x1feb900b, Offset: 0xd065
// Size: 0x47, Type: bool
function private function_9ba0e21c7f6dad44( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.castshadowsrig );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x10f18778, Offset: 0xd0b5
// Size: 0x47, Type: bool
function private function_599407b70d85262c( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.takedamage );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xd5757864, Offset: 0xd105
// Size: 0x47, Type: bool
function private function_aea14e0e13bbd667( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.teleport );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x78735987, Offset: 0xd155
// Size: 0x47, Type: bool
function private function_ac528c4b94dc121f( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.preparekeepanim );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9a4ffcb2, Offset: 0xd1a5
// Size: 0x4e, Type: bool
function private function_27059363c715d947( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.float_lerptime ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x3196df39, Offset: 0xd1fc
// Size: 0x4e, Type: bool
function private function_1c54677f7be74c59( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.float_blendtime ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe61442a5, Offset: 0xd253
// Size: 0x4e, Type: bool
function private function_e4fd4fd04ed73e1b( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.blendcurve ?? "linear";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xa1699a6c, Offset: 0xd2aa
// Size: 0x46
function private function_2f5f32051e506c1a( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.lookattarget;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x6120dd1c, Offset: 0xd2f9
// Size: 0x4e, Type: bool
function private function_42b2d28bdc6a24c2( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.lookbehavior ?? "ai_default";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x5c3d7b4e, Offset: 0xd350
// Size: 0x4e, Type: bool
function private function_d59e2a5bf7ebcf90( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.reachtype ?? "Teleport";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x33e1937, Offset: 0xd3a7
// Size: 0x4e, Type: bool
function private function_5e398dcb8782e632( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.arrivaltype ?? "Exposed";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x79f074af, Offset: 0xd3fe
// Size: 0x4e, Type: bool
function private function_274782f8d123ede4( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.demeanorstart ?? "DEFAULT";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xeb56ebbd, Offset: 0xd455
// Size: 0x4e, Type: bool
function private function_22704d940236cf5d( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.demeanorend ?? "DEFAULT";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xba5c8b26, Offset: 0xd4ac
// Size: 0x4e, Type: bool
function private function_60303d122294b28e( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.locomotionstart ?? "DEFAULT";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xcdb5b932, Offset: 0xd503
// Size: 0x4a, Type: bool
function private function_f0f1ea94325df082( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_a9c545f88b5b304f ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe0f32e9, Offset: 0xd556
// Size: 0x4e, Type: bool
function private function_3c6fe393ccd02d3c( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.weaponuse ?? "DropQuick";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xc94ce0f3, Offset: 0xd5ad
// Size: 0x4b, Type: bool
function private function_96ce751feb7dd9c9( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.weaponswitch ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x493ef730, Offset: 0xd601
// Size: 0x4a, Type: bool
function private function_b978488b0468bee7( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.weaponoffhand ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x369adc33, Offset: 0xd654
// Size: 0x52
function private function_80e82120471ba03a( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return tolower( shotobject.stancebegin ?? "stand" );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x331771ed, Offset: 0xd6af
// Size: 0x52
function private function_528210ecf3ecc9b6( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return tolower( shotobject.stanceend ?? "stand" );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x7790039a, Offset: 0xd70a
// Size: 0x4a, Type: bool
function private function_5200dc4f3cd33282( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_2f48c14c4400c4e8 ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x3f0b31a0, Offset: 0xd75d
// Size: 0x47, Type: bool
function private function_e90795a54254dbaa( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.stancematch );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x6de49a22, Offset: 0xd7ad
// Size: 0x4b, Type: bool
function private function_e138e9b97f54f49c( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_97e58f008f0d6fc1 ?? 45;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe9a402db, Offset: 0xd801
// Size: 0x4b, Type: bool
function private function_1ddc5aeafdb7a9d2( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.playerviewarcenabled ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x8a96d1c6, Offset: 0xd855
// Size: 0x4b, Type: bool
function private function_ffaa41b71b8c5dc9( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_f72b1222ac044722 ?? 45;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xa782790e, Offset: 0xd8a9
// Size: 0x4b, Type: bool
function private function_dbfd130ece46c860( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_24988a14c97c8bb ?? 15;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x2d1685ce, Offset: 0xd8fd
// Size: 0x4b, Type: bool
function private function_cf806cfc65d6c9e( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_a815fbabb5f0ea63 ?? 15;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x1815f2ad, Offset: 0xd951
// Size: 0x4b, Type: bool
function private function_82593eb0d840ae91( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.usetagangles ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xe7691348, Offset: 0xd9a5
// Size: 0x47, Type: bool
function private function_b97cb81433e705a5( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return istrue( shotobject.autocenter );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xee3c89b4, Offset: 0xd9f5
// Size: 0x4e, Type: bool
function private function_640261b8d0d5cba4( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.float_viewfraction ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9fa84551, Offset: 0xda4c
// Size: 0x4a, Type: bool
function private function_8c27db859ca12a4f( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.noanimwait ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x4a57c6fc, Offset: 0xda9f
// Size: 0x4a, Type: bool
function private function_c68f88c2b5f207d3( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.nospawn ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x743306d7, Offset: 0xdaf2
// Size: 0x4e, Type: bool
function private function_abc779ad811bdf13( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweenin ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xd932ba89, Offset: 0xdb49
// Size: 0x4b, Type: bool
function private function_3f64f25a6a59bb06( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweeninvisible ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x760375be, Offset: 0xdb9d
// Size: 0x4a, Type: bool
function private function_7136c10c7e8929fa( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweeninstopxcam ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xb3110b6, Offset: 0xdbf0
// Size: 0x4e, Type: bool
function private function_c602a792da7056a0( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweenout ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x49366f80, Offset: 0xdc47
// Size: 0x4b, Type: bool
function private function_1201bc2837054709( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweenoutvisible ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xb413c7af, Offset: 0xdc9b
// Size: 0x4a, Type: bool
function private function_e844c8047276c3f9( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.cameratweenoutstopxcam ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9a4f6cf5, Offset: 0xdcee
// Size: 0x4b, Type: bool
function private function_618b92dbb2955a1a( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.xcamfirstperson ?? 1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x93d5c9e8, Offset: 0xdd42
// Size: 0x4a, Type: bool
function private function_8d495684dbf8f02b( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.xcamthirdperson ?? 0;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xdc81a7ea, Offset: 0xdd95
// Size: 0x4a, Type: bool
function private function_89d3a2e8f36b1cf4( shotindex )
{
    sceneobject = self;
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    return shotobject.var_423dc3e955f2bb2e ?? 0;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x59e4f414, Offset: 0xdde8
// Size: 0xa3
function private function_6f17a7d85a11f168( spawnorigin, spawnangles )
{
    sceneobjectdata = self;
    entity = undefined;
    sceneobjectassettype = sceneobjectdata.sceneobject function_fc09a0af0b50d3d4();
    sceneobjectassetname = sceneobjectdata.sceneobject function_ccb2b599f3b8ef77();
    
    if ( sceneobjectassettype == "vehicle" )
    {
        entity = spawnvehicle( vehicle_modelname( sceneobjectassetname ), "scene_system_vehicle", sceneobjectassetname, spawnorigin, spawnangles );
        
        if ( isdefined( entity ) )
        {
            entity useanimtree( sceneobjectdata.sceneobject function_4641057744100c08() );
        }
    }
    
    return entity;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xc923079a, Offset: 0xde94
// Size: 0x3b, Type: bool
function private function_20b1309c9e58e1e6( entity )
{
    if ( entity.classname == "script_vehicle" )
    {
        return true;
    }
    
    if ( entity.classname == "script_model" )
    {
        return true;
    }
    
    return false;
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x63c46d8b, Offset: 0xded8
// Size: 0x57
function private function_247fd4fdf1e19551( shotindex, cameraanimation, shotanimations )
{
    sceneobjectdata = self;
    vehicle = sceneobjectdata.entity;
    
    if ( isdefined( vehicle ) && vehicle vehicle_isphysveh() )
    {
        vehicle vehphys_forcekeyframedmotion();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xf9d4e0d5, Offset: 0xdf37
// Size: 0xd8
function private function_94c7074995321b81()
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity notify( "stop_loop" );
        sceneobjectdata.entity notify( "single anim", "end" );
        sceneobjectdata.entity notify( "looping anim", "end" );
        sceneobjectdata.entity notify( "stop_animmode" );
        sceneobjectdata.entity notify( "vehicle_scene_stop" );
        sceneobjectdata.entity stopanimscripted();
        
        if ( sceneobjectdata.entity vehicle_isphysveh() )
        {
            sceneobjectdata.entity function_d2b8ee2e1275daaf( 0 );
            sceneobjectdata.entity vehphys_setdefaultmotion();
            return;
        }
        
        sceneobjectdata.entity solid();
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x493820a6, Offset: 0xe017
// Size: 0x1e9
function private function_8ac744fc3e7dee()
{
    scenescriptbundle = self;
    sceneobjectcount = scenescriptbundle function_bd663a9606d90ac1();
    
    for ( sceneobjectindex = 0; sceneobjectindex < sceneobjectcount ; sceneobjectindex++ )
    {
        sceneobject = scenescriptbundle function_45cf04bf56228582( sceneobjectindex );
        sceneobjectassettype = sceneobject function_fc09a0af0b50d3d4();
        sceneobjectassetname = sceneobject function_ccb2b599f3b8ef77();
        
        if ( !isdefined( sceneobjectassetname ) )
        {
            continue;
        }
        
        if ( !isdefined( sceneobjectassettype ) )
        {
            continue;
        }
        
        if ( sceneobjectassettype == "aitype" )
        {
        }
        else if ( sceneobjectassettype == "character" )
        {
            character = getxhashasset( sceneobjectassetname );
            
            if ( isdefined( level.fncharacterprecache ) && isdefined( level.fncharacterprecache[ character ] ) )
            {
                funcprecache = level.fncharacterprecache[ character ];
                level [[ funcprecache ]]();
            }
        }
        else if ( sceneobjectassettype == "vehicle" )
        {
            precachevehicle( sceneobjectassetname );
            modelname = vehicle_modelname( sceneobjectassetname );
            
            if ( modelname != "" )
            {
                precachemodel( modelname );
            }
        }
        else if ( sceneobjectassettype == "operatorskin" )
        {
            models = function_b438f97d7c4dd1f1( sceneobjectassetname );
            
            if ( models.isvalid )
            {
                precachemodel( models.body );
                precachemodel( models.head );
            }
        }
        else if ( sceneobjectassettype == "bulletweapon" )
        {
        }
        else
        {
            precachemodel( sceneobjectassetname );
        }
        
        if ( isdefined( sceneobject.variant_object.overridebody ) )
        {
            precachemodel( sceneobject.variant_object.overridebody );
        }
        
        if ( isdefined( sceneobject.variant_object.overridehead ) )
        {
            precachemodel( sceneobject.variant_object.overridehead );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x9a088095, Offset: 0xe208
// Size: 0x184
function private function_7624a82cebcf9c61( spawnorigin, spawnangles )
{
    sceneobjectdata = self;
    luaindex = sceneobjectdata.sceneobject function_8d6340a41bdf10ed();
    characterindex = luaindex - 1;
    
    if ( !isdefined( level.client_characters ) )
    {
        level.client_characters = [];
    }
    
    spawnorigin = sceneobjectdata.alignmentinfo.origin;
    spawnangles = sceneobjectdata.alignmentinfo.angles;
    entity = level.client_characters[ characterindex ];
    
    if ( !isdefined( entity ) )
    {
        entity = spawn( "script_character", spawnorigin, 0, 0, characterindex, "MPClientCharacter" );
        level.client_characters[ characterindex ] = entity;
    }
    
    if ( isdefined( entity ) )
    {
        entity val::set( "scene_scene", "cinematics_participant", 1 );
        entity.angles = spawnangles;
        entity.origin = spawnorigin;
        
        if ( getdvarint( @"hash_204f67bbaa6705ea", 0 ) && getdvarint( @"hash_bf4836935350bfc0", 1 ) )
        {
            entity function_76025bf1685180e2( 1 );
        }
    }
    
    entity show();
    var_a475b2d5a1199e43 = function_bf960a70adcedd68();
    
    if ( isdefined( var_a475b2d5a1199e43 ) )
    {
        entity setmodel( var_a475b2d5a1199e43 );
        entity useanimtree( sceneobjectdata.sceneobject function_4641057744100c08() );
    }
    
    sceneobjectdata.entity = entity;
    return entity;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x366205bb, Offset: 0xe395
// Size: 0x7e, Type: bool
function private function_dd0009340cb25d87( entity )
{
    sceneobjectdata = self;
    
    if ( getdvarint( @"hash_c609cebf6abef30", 0 ) )
    {
        if ( isdefined( entity ) && entity.classname == "script_character" )
        {
            entitycharacterindex = entity.characterindex;
            objectcharacterindex = sceneobjectdata.sceneobject function_8d6340a41bdf10ed() - 1;
            return ( entitycharacterindex == objectcharacterindex );
        }
    }
    
    return false;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x13124811, Offset: 0xe41c
// Size: 0x171
function private function_bf960a70adcedd68()
{
    if ( !isdefined( level.var_33e8b386492841c7 ) )
    {
        level.var_33e8b386492841c7 = level.projectbundle.var_35f2bfd0ee424080;
        
        if ( !isdefined( level.var_33e8b386492841c7 ) )
        {
            gamemodebundle = level.gamemodebundle;
            operatorlistbundle = getoperatorlistscriptbundle( gamemodebundle.operatorlist );
            validoperatorref = undefined;
            
            foreach ( operatorentry in operatorlistbundle.operatorlist )
            {
                if ( isdefined( operatorentry.operator ) )
                {
                    validoperatorref = operatorentry.operator;
                    break;
                }
            }
            
            assert( isdefined( validoperatorref ), "<dev string:x250>" );
            defaultoperator = getoperatorscriptbundle( validoperatorref );
            defaultskin = getoperatorskinscriptbundle( defaultoperator.defaultskin );
            var_c2f7e4641e292c16 = getscriptbundle( defaultskin.body );
            level.var_33e8b386492841c7 = var_c2f7e4641e292c16.defaultbody;
        }
    }
    
    return level.var_33e8b386492841c7;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x85698cbc, Offset: 0xe596
// Size: 0x38
function private function_2535ce3d8e09fa05( animname, animtree )
{
    if ( isdefined( self.entity ) )
    {
        self.entity.animname = animname;
    }
}

// Namespace scene
// Params 9, eflags: 0x4
// Checksum 0xee5f1a7f, Offset: 0xe5d7
// Size: 0x6b
function private function_27be1a15599d865c( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime )
{
    n_length = getanimlength( animasset );
    wait n_length;
    return n_length;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x3bbfe179, Offset: 0xe64b
// Size: 0x2
function private function_4450d8e5e58a15fe()
{
    
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x74689fd7, Offset: 0xe656
// Size: 0x61
function private function_8831768043b7d8dd( origin, angles )
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity.origin = origin;
        sceneobjectdata.entity.angles = angles;
    }
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0xb8dbf40f, Offset: 0xe6bf
// Size: 0x30
function private function_9ef66aebc21d7192( sceneplay, alignmentinfo, inittype, lerptime, initializing )
{
    
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x173aa9a9, Offset: 0xe6f8
// Size: 0x64d
function private function_83bfd4c94b262c65( sceneroot, shotindex, objectindex, prevalignmentinfo )
{
    scenescriptbundle = self;
    
    if ( isdefined( prevalignmentinfo ) && prevalignmentinfo.shotindex === shotindex )
    {
        if ( prevalignmentinfo.var_8f099063c7618054 && !isent( prevalignmentinfo.alignent ) )
        {
            var_969ce076455a514d = sceneroot get_object( prevalignmentinfo.aligntarget );
            
            if ( isdefined( var_969ce076455a514d ) )
            {
                aligntarget = var_969ce076455a514d function_15e572f4ed82dd1c();
                
                if ( isent( aligntarget ) )
                {
                    prevalignmentinfo.alignobjectindex = var_969ce076455a514d.index;
                    prevalignmentinfo.alignent = aligntarget;
                    prevalignmentinfo.origin = aligntarget.origin ?? ( 0, 0, 0 );
                    prevalignmentinfo.angles = aligntarget.angles ?? ( 0, 0, 0 );
                }
            }
        }
        
        return prevalignmentinfo;
    }
    
    alignmentinfo = spawnstruct();
    alignmentinfo.aligntarget = undefined;
    alignmentinfo.aligntag = undefined;
    alignmentinfo.alignent = undefined;
    alignmentinfo.alignobjectindex = undefined;
    alignmentinfo.var_8f099063c7618054 = undefined;
    alignmentinfo.originoffset = ( 0, 0, 0 );
    alignmentinfo.anglesoffset = ( 0, 0, 0 );
    alignmentinfo.shotindex = shotindex;
    shot = scenescriptbundle function_6404fde3adf1f642( shotindex );
    sceneobject = scenescriptbundle function_45cf04bf56228582( objectindex );
    shotobject = sceneobject.variant_object.shots[ shotindex ];
    aligncheck = [ shotobject, sceneobject.variant_object, shot.variant_object, scenescriptbundle ];
    
    for ( aligncheckindex = 0; aligncheckindex < aligncheck.size ; aligncheckindex++ )
    {
        alignobj = aligncheck[ aligncheckindex ];
        
        if ( isdefined( alignobj.aligntarget ) )
        {
            alignmentinfo.aligntarget = alignobj.aligntarget;
            
            if ( isdefined( alignobj.aligntargettag ) )
            {
                alignmentinfo.aligntag = tolower( alignobj.aligntargettag );
            }
            
            break;
        }
    }
    
    alignmentinfo.originoffset += function_a66a57442e4dc34e( shotobject.var_53f05c59f875d40a, shotobject.var_53f05d59f875d63d, shotobject.var_53f05a59f875cfa4 );
    alignmentinfo.anglesoffset += function_a66a57442e4dc34e( shotobject.var_d8037ffae060ee24, shotobject.var_d80380fae060f057, shotobject.var_d80381fae060f28a );
    alignmentinfo.originoffset += function_a66a57442e4dc34e( sceneobject.variant_object.var_53f05c59f875d40a, sceneobject.variant_object.var_53f05d59f875d63d, sceneobject.variant_object.var_53f05a59f875cfa4 );
    alignmentinfo.anglesoffset += function_a66a57442e4dc34e( sceneobject.variant_object.var_d8037ffae060ee24, sceneobject.variant_object.var_d80380fae060f057, sceneobject.variant_object.var_d80381fae060f28a );
    alignmentinfo.originoffset += function_a66a57442e4dc34e( shot.variant_object.var_53f05c59f875d40a, shot.variant_object.var_53f05d59f875d63d, shot.variant_object.var_53f05a59f875cfa4 );
    alignmentinfo.anglesoffset += function_a66a57442e4dc34e( shot.variant_object.var_d8037ffae060ee24, shot.variant_object.var_d80380fae060f057, shot.variant_object.var_d80381fae060f28a );
    alignmentinfo.originoffset += function_a66a57442e4dc34e( scenescriptbundle.var_53f05c59f875d40a, scenescriptbundle.var_53f05d59f875d63d, scenescriptbundle.var_53f05a59f875cfa4 );
    alignmentinfo.anglesoffset += function_a66a57442e4dc34e( scenescriptbundle.var_d8037ffae060ee24, scenescriptbundle.var_d80380fae060f057, scenescriptbundle.var_d80381fae060f28a );
    aligntarget = undefined;
    
    if ( !sceneroot.var_ddb502ad28f6362d && isdefined( alignmentinfo.aligntarget ) )
    {
        var_969ce076455a514d = sceneroot get_object( alignmentinfo.aligntarget );
        
        if ( isdefined( var_969ce076455a514d ) )
        {
            alignmentinfo.var_8f099063c7618054 = 1;
            aligntarget = var_969ce076455a514d function_15e572f4ed82dd1c();
            
            if ( isdefined( aligntarget ) )
            {
                alignmentinfo.alignobjectindex = var_969ce076455a514d.index;
            }
        }
        
        if ( !isdefined( aligntarget ) )
        {
            aligntarget = function_2c2907d07310b0e( alignmentinfo.aligntarget );
            
            if ( isdefined( aligntarget ) && isdefined( aligntarget.sceneobjectdata ) )
            {
                alignmentinfo.alignobjectindex = aligntarget.sceneobjectdata.index;
            }
        }
    }
    
    if ( !isdefined( aligntarget ) )
    {
        aligntarget = sceneroot;
    }
    
    alignmentinfo.alignent = aligntarget;
    alignmentinfo.origin = alignmentinfo.alignent.origin ?? ( 0, 0, 0 );
    alignmentinfo.angles = alignmentinfo.alignent.angles ?? ( 0, 0, 0 );
    return alignmentinfo;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xf863021e, Offset: 0xed4e
// Size: 0x1b, Type: bool
function private function_cf6d109b139cfdbf()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.bool_skippable );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x8b228878, Offset: 0xed72
// Size: 0x1b, Type: bool
function private function_2ae71d4375525d5a()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.bool_gameplay );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xa550f0cf, Offset: 0xed96
// Size: 0x1b, Type: bool
function private function_c7c350c8df3d0e0a()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.var_75f0f6409c3cfa98 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe3a2b4fe, Offset: 0xedba
// Size: 0x1b, Type: bool
function private function_18b6837bdb9e4208()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.bool_looping );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xbd7cc69, Offset: 0xedde
// Size: 0x1b, Type: bool
function private function_f38a33a196064424()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.bool_cinematicmotion );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x79a7c2b1, Offset: 0xee02
// Size: 0x1b, Type: bool
function private function_26e347b43304e05e()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.var_e6841d0ebec79853 );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xf39f7732, Offset: 0xee26
// Size: 0x22, Type: bool
function private function_a9260c3d77b784c3()
{
    scenescriptbundle = self;
    return scenescriptbundle.var_2d5be34ad37dc02b ?? "None";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x30c6377, Offset: 0xee51
// Size: 0x22, Type: bool
function private function_4ce73dcda6de9f22()
{
    scenescriptbundle = self;
    return scenescriptbundle.var_2f4981e3dd60abe4 ?? "None";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xf863021e, Offset: 0xee7c
// Size: 0x1b, Type: bool
function private function_f4f80fb91ec747f3()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.bool_letterbox );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xd71659aa, Offset: 0xeea0
// Size: 0x1e, Type: bool
function private function_fe0a6ac8d702190f()
{
    scenescriptbundle = self;
    return scenescriptbundle.var_236299f42af1f10f ?? 0;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2bda8045, Offset: 0xeec7
// Size: 0x1f, Type: bool
function private function_cf08117a77afbc1e()
{
    scenescriptbundle = self;
    return scenescriptbundle.autocleanup ?? 1;
}

// Namespace scene
// Params 0
// Checksum 0x612a5854, Offset: 0xeeef
// Size: 0x1b
function function_bd663a9606d90ac1()
{
    scenescriptbundle = self;
    return scenescriptbundle.objects.size;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x9b6ee5d9, Offset: 0xef13
// Size: 0x27
function private function_45cf04bf56228582( index )
{
    scenescriptbundle = self;
    return scenescriptbundle.objects[ index ];
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x13515f1d, Offset: 0xef43
// Size: 0xa9
function private function_8666fb2470ee0b61()
{
    scenescriptbundle = self;
    
    foreach ( sceneobject in scenescriptbundle.objects )
    {
        charindex = sceneobject function_8d6340a41bdf10ed();
        
        if ( charindex > 0 )
        {
            sceneobject.variant_type = "Types_ClientChar";
        }
    }
}

// Namespace scene
// Params 0
// Checksum 0x4662bc5f, Offset: 0xeff4
// Size: 0x1b
function function_30fd977cf5a4a95e()
{
    scenescriptbundle = self;
    return scenescriptbundle.shots.size;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x8477a955, Offset: 0xf018
// Size: 0x27
function private function_6404fde3adf1f642( index )
{
    scenescriptbundle = self;
    return scenescriptbundle.shots[ index ];
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x43c0a783, Offset: 0xf048
// Size: 0xef
function private function_965b893bb918d34d( var_3556b15f71d46b40 )
{
    scenescriptbundle = self;
    var_4c519aad39052750 = isstring( var_3556b15f71d46b40 );
    b_isint = isint( var_3556b15f71d46b40 );
    
    foreach ( index, shot in scenescriptbundle.shots )
    {
        if ( !isdefined( var_3556b15f71d46b40 ) )
        {
            return index;
        }
        
        if ( b_isint && var_3556b15f71d46b40 == index )
        {
            return index;
        }
        
        if ( var_4c519aad39052750 && shot.variant_object.name == var_3556b15f71d46b40 )
        {
            return index;
        }
    }
    
    return -1;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xb89f6f08, Offset: 0xf140
// Size: 0x2d
function private function_d74f9d413aca8704( index )
{
    scenescriptbundle = self;
    return scenescriptbundle.shots[ index ] function_31132eddb426e3fd();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe454361f, Offset: 0xf176
// Size: 0x1b, Type: bool
function private function_4f6556149db5309e()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.autostream );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xa7dca15, Offset: 0xf19a
// Size: 0x22, Type: bool
function private function_e676aa1c58e71d88()
{
    scenescriptbundle = self;
    return scenescriptbundle.var_66e170b4aea88741 ?? "AnimScripted";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xd739481c, Offset: 0xf1c5
// Size: 0x22, Type: bool
function private function_cf01ff8a72173036()
{
    scenescriptbundle = self;
    return scenescriptbundle.var_621ac137db968583 ?? "Default";
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x86134638, Offset: 0xf1f0
// Size: 0x78
function private function_d12c299f7ca4bf79( shotname )
{
    scenescriptbundle = self;
    foundshotindex = undefined;
    shotcount = scenescriptbundle function_30fd977cf5a4a95e();
    
    for ( shotindex = 0; shotindex < shotcount ; shotindex++ )
    {
        shot = scenescriptbundle function_6404fde3adf1f642( shotindex );
        
        if ( shot function_31132eddb426e3fd() == shotname )
        {
            foundshotindex = shotindex;
            break;
        }
    }
    
    return foundshotindex;
}

// Namespace scene
// Params 0
// Checksum 0x4e6553f7, Offset: 0xf271
// Size: 0x1b, Type: bool
function function_7f138cc8a9e70cf4()
{
    scenescriptbundle = self;
    return istrue( scenescriptbundle.disablehud );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x85ea6c6d, Offset: 0xf295
// Size: 0x2d
function private function_31132eddb426e3fd()
{
    shot = self;
    
    if ( !isdefined( shot ) )
    {
        return undefined;
    }
    
    return shot.variant_object.name;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x880a8b63, Offset: 0xf2cb
// Size: 0x25, Type: bool
function private function_22dbcb174ae164e7()
{
    shot = self;
    return istrue( shot.variant_object.disableshot );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xfb1fa7a8, Offset: 0xf2f9
// Size: 0x29, Type: bool
function private function_207777fd99d7a922()
{
    shot = self;
    return shot.variant_object.autostream ?? 1;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x6cea4254, Offset: 0xf32b
// Size: 0x3c, Type: bool
function private function_9f4fd3f147cf9375()
{
    shot = self;
    
    /#
        if ( getdvarint( @"hash_b279d32f047f16db", 0 ) )
        {
            return true;
        }
    #/
    
    return istrue( shot.variant_object.syncend );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe3f57424, Offset: 0xf370
// Size: 0x24
function private function_c9e351e000109356()
{
    shot = self;
    return shot.variant_object.preparehide;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xb3b0613c, Offset: 0xf39d
// Size: 0x24
function private function_87e703acab37289f()
{
    shot = self;
    return shot.variant_object.prepareshow;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x75072dce, Offset: 0xf3ca
// Size: 0x24
function private function_a694d6b567b8f510()
{
    shot = self;
    return shot.variant_object.completehide;
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x2b81bc63, Offset: 0xf3f7
// Size: 0x24
function private function_6f4f7d54201dbbb()
{
    shot = self;
    return shot.variant_object.completeshow;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x925b13b3, Offset: 0xf424
// Size: 0x15
function private mayhem_spawn( alignmentinfo, shotinit )
{
    
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x183c78d6, Offset: 0xf441
// Size: 0xdd
function private function_fc408f57f842ae( shotindex, cameraanimation, shotanimations )
{
    sceneobjectdata = self;
    
    if ( sceneobjectdata.sceneobject function_32571802b2e452ec( shotindex ) )
    {
        if ( !isdefined( sceneobjectdata.mayhemname ) )
        {
            sceneobjectdata function_33db5df1418bb6c8( sceneobjectdata.alignmentinfo );
        }
        
        if ( isdefined( sceneobjectdata.mayhemname ) )
        {
            hidemayhem( sceneobjectdata.mayhemname );
        }
    }
    
    if ( sceneobjectdata.sceneobject function_dd5572420d3225( shotindex ) )
    {
        if ( !isdefined( sceneobjectdata.mayhemname ) )
        {
            sceneobjectdata function_33db5df1418bb6c8( sceneobjectdata.alignmentinfo );
        }
        
        if ( isdefined( sceneobjectdata.mayhemname ) )
        {
            showmayhem( sceneobjectdata.mayhemname );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x2212d429, Offset: 0xf526
// Size: 0x9c
function private function_33db5df1418bb6c8( alignmentinfo, shotindex )
{
    sceneobjectdata = self;
    
    if ( !isdefined( shotindex ) )
    {
        shotindex = sceneobjectdata.sceneplay.shotinit;
    }
    
    shotanimations = sceneobjectdata function_6bf501072826e845( shotindex );
    
    if ( shotanimations.size != 0 )
    {
        sceneobjectdata thread function_8f7ba32b21c24c7e( sceneobjectdata.sceneplay.shotinit, shotindex, "mayhem", alignmentinfo, shotanimations[ 0 ], 0, 0, 0, 0, "MayhemAnimation" );
        pausemayhem( sceneobjectdata.mayhemname );
    }
}

// Namespace scene
// Params 10, eflags: 0x4
// Checksum 0xb9937e76, Offset: 0xf5ca
// Size: 0x158
function private function_8f7ba32b21c24c7e( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype )
{
    sceneobjectdata = self;
    sceneobjectdata mayhem_delete();
    
    if ( !isdefined( level.scene.mayhemindex ) )
    {
        level.scene.mayhemindex = 0;
    }
    
    level.scene.mayhemindex++;
    sceneobjectdata.mayhemname = sceneobjectdata.sceneroot.script_scenescriptbundle + "_mayhem" + level.scene.mayhemindex;
    function_7caec59d5958332( alignmentinfo );
    animlengths = sceneobjectdata.sceneobject function_dc0adcd93b6ab4c4( shotindex );
    
    if ( animlengths.size == 0 )
    {
        return;
    }
    
    spawnmayhem( sceneobjectdata.mayhemname, animasset, alignmentinfo.origin, alignmentinfo.angles );
    utility::waittill_match_or_timeout( notifystring, "end", animlengths[ animindex ] );
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x7b04b1d7, Offset: 0xf72a
// Size: 0x18
function private function_4f1730d1da8c5710()
{
    sceneobjectdata = self;
    sceneobjectdata mayhem_delete();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x1f3eb1c0, Offset: 0xf74a
// Size: 0x39
function private mayhem_delete()
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.mayhemname ) )
    {
        killmayhem( sceneobjectdata.mayhemname );
        sceneobjectdata.mayhemname = undefined;
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xc47e62ad, Offset: 0xf78b
// Size: 0x15
function private xcam_spawn( alignmentinfo, shotinit )
{
    
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x19c6a450, Offset: 0xf7a8
// Size: 0x4f2
function private function_e770a2937db5fd28( shotindex, cameraanimation, shotanimations )
{
    sceneobjectdata = self;
    
    if ( !isdefined( cameraanimation ) )
    {
        return;
    }
    
    scenescriptbundle = sceneobjectdata.sceneroot scene_scriptbundle();
    letterbox = scenescriptbundle function_f4f80fb91ec747f3();
    var_236299f42af1f10f = scenescriptbundle function_fe0a6ac8d702190f();
    xcamplayers = sceneobjectdata function_931d12df9abebc7f( shotindex );
    disable_hud = scenescriptbundle function_7f138cc8a9e70cf4();
    sceneobjectdata.xcamplayers = xcamplayers;
    sceneobjectdata.xcamplayers = function_5713d46873b29625( sceneobjectdata.xcamplayers );
    
    if ( letterbox )
    {
        foreach ( player in xcamplayers )
        {
            player function_f6d96a431ef86a5( 1, var_236299f42af1f10f );
        }
    }
    
    foreach ( player in xcamplayers )
    {
        player val::set( "scene_scene_xcam", "cinematic_motion", scenescriptbundle function_f38a33a196064424() );
        player val::set( "scene_scene_xcam", "anim_adjust_transfer", scenescriptbundle function_a9260c3d77b784c3() == "AdjustStartFrame" );
    }
    
    if ( disable_hud )
    {
        foreach ( player in xcamplayers )
        {
            player val::set( "scene_scene_xcam", "show_hud", 0 );
        }
    }
    
    if ( sceneobjectdata.sceneobject function_32571802b2e452ec( shotindex ) )
    {
        foreach ( player in xcamplayers )
        {
            player val::set( "scene_shot_xcam", "hide", 2 );
            player val::set( "scene_shot_xcam", "ignoreall", 1 );
            player val::set( "scene_shot_xcam", "ignoreme", 1 );
            player val::set( "scene_shot_xcam", "fire", 0 );
        }
    }
    
    if ( sceneobjectdata.sceneobject function_dd5572420d3225( shotindex ) )
    {
        foreach ( player in xcamplayers )
        {
            player val::reset( "scene_shot_xcam", "hide" );
            player show();
            player val::reset( "scene_shot_xcam", "ignoreall" );
            player val::reset( "scene_shot_xcam", "ignoreme" );
            player val::reset( "scene_shot_xcam", "fire" );
        }
    }
    
    tweenin = sceneobjectdata.sceneobject function_abc779ad811bdf13( shotindex );
    scenescriptbundle = sceneobjectdata.sceneroot scene_scriptbundle();
    
    if ( tweenin > 0 )
    {
        foreach ( player in xcamplayers )
        {
            if ( sceneobjectdata function_7a4516ac3b008d7( shotindex ) )
            {
                player val::set( "scene_shot_xcam", "take_weapons", 1 );
            }
            
            stopxcam = sceneobjectdata.sceneobject function_7136c10c7e8929fa( shotindex );
            
            /#
                scene_debug::object_event( sceneobjectdata, "<dev string:x1fa>" + player getentitynumber(), player.origin, player.angles );
            #/
            
            player function_367943e54489cb93( 0, tweenin, 1, stopxcam );
        }
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xcda79c1d, Offset: 0xfca2
// Size: 0x12a
function private function_ce4a84e6cdf6ee71( shotindex )
{
    sceneobjectdata = self;
    tweenout = sceneobjectdata.sceneobject function_c602a792da7056a0( shotindex );
    players = sceneobjectdata function_931d12df9abebc7f( shotindex );
    utility::array_thread( players, &val::reset_all, "scene_shot_xcam" );
    
    if ( tweenout > 0 )
    {
        foreach ( player in players )
        {
            stopxcam = sceneobjectdata.sceneobject function_e844c8047276c3f9( shotindex );
            
            /#
                scene_debug::object_event( sceneobjectdata, "<dev string:x20e>" + player getentitynumber(), player.origin, player.angles );
            #/
            
            player function_367943e54489cb93( 1, tweenout, 1, stopxcam );
        }
    }
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xba11783, Offset: 0xfdd4
// Size: 0x15
function private function_b73062822847941e( alignmentinfo, shotindex )
{
    
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0x4a28467, Offset: 0xfdf1
// Size: 0x146
function private function_524845ca311375cd( sceneplay, shotindex )
{
    sceneobjectdata = self;
    sceneobjectdata function_7caec59d5958332( sceneobjectdata.alignmentinfo );
    
    if ( isdefined( sceneobjectdata.alignmentinfo ) )
    {
        cameraanimation = sceneobjectdata function_64466e4b9ed25e4c( shotindex );
        
        if ( isdefined( cameraanimation ) )
        {
            players = sceneobjectdata function_931d12df9abebc7f( shotindex );
            
            foreach ( player in players )
            {
                streamcameraorigin = player getxcamposition( cameraanimation, 0, 0, sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles );
                
                if ( isdefined( streamcameraorigin ) )
                {
                    /#
                        scene_debug::object_event( sceneobjectdata, "<dev string:x1ec>", streamcameraorigin, ( 0, 0, 0 ) );
                    #/
                    
                    sceneplay function_495a812f7545da04( player, streamcameraorigin );
                }
            }
        }
    }
}

// Namespace scene
// Params 10, eflags: 0x4
// Checksum 0x347ee72a, Offset: 0xff3f
// Size: 0x1f9
function private function_fbd4860eebc2ba8c( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype )
{
    sceneobjectdata = self;
    sceneobjectdata xcam_delete();
    
    if ( level.players.size == 0 )
    {
        return 0;
    }
    
    function_7caec59d5958332( alignmentinfo );
    sceneobjectdata endon( "scene_stop" );
    sceneobjectdata endon( "scene_play_anim" );
    sceneobjectdata.xcamplaying = 1;
    players = sceneobjectdata function_931d12df9abebc7f( shotindex );
    
    foreach ( player in players )
    {
        sceneobjectdata childthread function_3368cba813eece14( "scene_shot_xcam", player, animasset, var_142c2c5d44216f2a, notifystring, alignmentinfo, shotindex );
    }
    
    waittime = function_516be5ef89c77c57( animasset, var_142c2c5d44216f2a );
    
    if ( getxcamlooping( animasset ) )
    {
        sceneobjectdata waittillmatch( notifystring, "end" );
    }
    else if ( waittime > 0 )
    {
        sceneobjectdata utility::waittill_match_or_timeout( notifystring, "end", waittime );
    }
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        player val::reset_all( "scene_shot_xcam" );
    }
    
    return waittime;
}

// Namespace scene
// Params 7, eflags: 0x4
// Checksum 0x4e8ea1cc, Offset: 0x10141
// Size: 0x3eb
function private function_3368cba813eece14( valgroup, player, animasset, var_142c2c5d44216f2a, notifystring, alignmentinfo, shotindex )
{
    sceneobjectdata = self;
    assert( isplayer( player ) );
    
    if ( function_3e768ed8916f0542( shotindex ) )
    {
        player endon( "disconnect" );
    }
    else
    {
        player endon( "death_or_disconnect" );
    }
    
    /#
        scene_debug::object_event( sceneobjectdata, "<dev string:x27b>" + shotindex, alignmentinfo.origin, alignmentinfo.angles );
    #/
    
    waittime = 0;
    player val::set( valgroup, "cg_drawcrosshair", 0 );
    player val::set( valgroup, "freezecontrols", 1 );
    player val::set( valgroup, "freezecontrols_allowlook", 1 );
    player val::set( valgroup, "show_legs_and_shadow", 0 );
    gameplay = sceneobjectdata.sceneroot function_de0c3faf7f92b366();
    
    if ( !gameplay )
    {
        player val::set( valgroup, "show_hud_names", 0 );
        player val::set( valgroup, "allow_equipment_wheel", 0 );
    }
    
    values = level.scene.values[ "Types_Player" ][ gameplay ];
    
    if ( isdefined( values ) )
    {
        foreach ( valname, value in values )
        {
            player val::set( valgroup, valname, value );
        }
    }
    
    if ( animasset != "" )
    {
        starttime = 0;
        
        if ( var_142c2c5d44216f2a > 0 )
        {
            starttime = getxcamlength( animasset ) * var_142c2c5d44216f2a;
        }
        
        var_3ca631df22ba91e8 = !sceneobjectdata.sceneobject function_89d3a2e8f36b1cf4( shotindex );
        var_c4e84a1d620c3008 = function_e4f8202c937ebe9();
        thirdpersonplayer = sceneobjectdata.sceneobject function_8d495684dbf8f02b( shotindex );
        firstpersonplayer = sceneobjectdata.sceneobject function_618b92dbb2955a1a( shotindex );
        player notify( "scene_play_xcam" );
        
        if ( isent( alignmentinfo.alignent ) )
        {
            alignent = alignmentinfo.alignent;
            
            if ( isdefined( alignmentinfo.alignent.var_3544485fbc851ac2 ) )
            {
                aligntag = alignmentinfo.alignent.var_3544485fbc851ac2;
            }
            else if ( isdefined( alignmentinfo.aligntag ) && alignmentinfo.aligntag != "" )
            {
                aligntag = alignmentinfo.aligntag;
            }
        }
        
        if ( isdefined( alignent ) && isdefined( aligntag ) )
        {
            player playxcamontag( animasset, 0, alignent, aligntag, starttime, 1, var_3ca631df22ba91e8, var_c4e84a1d620c3008, thirdpersonplayer, firstpersonplayer );
        }
        else
        {
            player playxcam( animasset, 0, alignmentinfo.origin, alignmentinfo.angles, starttime, 1, var_3ca631df22ba91e8, var_c4e84a1d620c3008, thirdpersonplayer, firstpersonplayer );
        }
        
        if ( var_c4e84a1d620c3008 )
        {
            if ( sceneobjectdata.scenedata.scenescriptbundle function_cf01ff8a72173036() == "UseOffset" )
            {
                player function_dc6d1931148169ed( 1 );
            }
        }
        
        player.scenexcam = { #time:gettime(), #animasset:animasset };
        
        if ( getxcamlooping( animasset ) )
        {
            sceneobjectdata waittillmatch( notifystring, "end" );
        }
        else
        {
            waittime = function_516be5ef89c77c57( animasset, var_142c2c5d44216f2a );
            
            if ( waittime > 0 )
            {
                sceneobjectdata utility::waittill_match_or_timeout( notifystring, "end", waittime );
            }
        }
        
        player notify( "scene_play_xcam_done" );
    }
    
    return waittime;
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xaa25bd28, Offset: 0x10535
// Size: 0x47
function private function_516be5ef89c77c57( animasset, var_142c2c5d44216f2a )
{
    cameraanimationtime = getxcamlength( animasset );
    starttime = 0;
    
    if ( var_142c2c5d44216f2a > 0 )
    {
        starttime = cameraanimationtime * var_142c2c5d44216f2a;
        cameraanimationtime -= starttime;
    }
    
    return cameraanimationtime;
}

// Namespace scene
// Params 6, eflags: 0x4
// Checksum 0xe85e97fd, Offset: 0x10585
// Size: 0x39
function private function_a2ff48defd65ed33( alignmentinfo, animasset, notifystring, var_142c2c5d44216f2a, var_ab6f54ef0991868f, animationtype )
{
    
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0xe53af06, Offset: 0x105c6
// Size: 0x1a
function private function_ff81a969d869304e()
{
    sceneobjectdata = self;
    sceneobjectdata xcam_delete( 1 );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xbcb99acc, Offset: 0x105e8
// Size: 0x157
function private xcam_delete( var_48d758a6e255795d )
{
    sceneobjectdata = self;
    scenescriptbundle = sceneobjectdata.sceneroot scene_scriptbundle();
    letterbox = scenescriptbundle function_f4f80fb91ec747f3();
    var_236299f42af1f10f = scenescriptbundle function_fe0a6ac8d702190f();
    players = sceneobjectdata function_931d12df9abebc7f( -1 );
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( isdefined( player.scenexcam.time ) && gettime() - player.scenexcam.time <= level.frameduration )
        {
            continue;
        }
        
        player stopxcam();
        
        if ( var_48d758a6e255795d )
        {
            player val::reset_all( "scene_scene_xcam" );
            
            if ( letterbox )
            {
                player function_f6d96a431ef86a5( 0, var_236299f42af1f10f );
            }
        }
    }
    
    sceneobjectdata.xcamplaying = undefined;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x431f9a13, Offset: 0x10747
// Size: 0xd, Type: bool
function private function_78150143df380fd7( entity )
{
    return false;
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xd1bee025, Offset: 0x1075d
// Size: 0x24
function private xcam_cleanup( newsceneroot )
{
    sceneobjectdata = self;
    sceneobjectdata xcam_delete( 1 );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x10f57d12, Offset: 0x10789
// Size: 0xe0
function private function_5f31e9fc1b086d5f( boolval )
{
    foreach ( player in level.players )
    {
        if ( !isent( player ) )
        {
            continue;
        }
        
        if ( boolval )
        {
            player val::set( "scene_scene", "cinematics_participant", 1 );
            player val::set( "scene_scene", "third_person_toggle", 0 );
            continue;
        }
        
        player val::reset( "scene_scene", "cinematics_participant" );
        player val::reset( "scene_scene", "third_person_toggle" );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xbb35bfad, Offset: 0x10871
// Size: 0x144
function private function_931d12df9abebc7f( shotindex )
{
    sceneobjectdata = self;
    playervis = "All";
    
    if ( isdefined( shotindex ) )
    {
        if ( shotindex == -1 )
        {
            return sceneobjectdata.xcamplayers;
        }
        
        playervis = sceneobjectdata.sceneobject function_efc13d404c1080ac( shotindex );
    }
    
    switch ( playervis )
    {
        case #"hash_3ad6948f3f563d6":
            var_dab149a7be99cf48 = sceneobjectdata.sceneplay.var_e721f1409fd57ca9 ?? [];
            break;
        case #"hash_e5385d60528b88a5":
            var_dab149a7be99cf48 = arraydifference( level.players, sceneobjectdata.sceneplay.var_e721f1409fd57ca9 ?? [] );
            break;
        default:
            if ( isdefined( sceneobjectdata.xcamplayers ) )
            {
                sceneobjectdata.xcamplayers = function_5713d46873b29625( sceneobjectdata.xcamplayers );
            }
            
            var_dab149a7be99cf48 = sceneobjectdata.xcamplayers ?? sceneobjectdata.sceneroot.scenestatic.exclusiveplayers ?? level.players;
            break;
    }
    
    return function_5713d46873b29625( var_dab149a7be99cf48 );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xf00dacb3, Offset: 0x109be
// Size: 0x4b
function private function_a881bacbb6969065( spawnorigin, spawnangles )
{
    sceneobjectdata = self;
    entity = sceneobjectdata function_f17638b31ca85f5f( spawnorigin, spawnangles );
    
    if ( isent( entity ) )
    {
        sceneobjectdata function_ede93dead318f379( entity );
    }
    
    return entity;
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x26caa8f, Offset: 0x10a12
// Size: 0x3b
function private function_a66a57442e4dc34e( paramx = 0, paramy = 0, paramz = 0 )
{
    return ( paramx, paramy, paramz );
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xc0788ccd, Offset: 0x10a56
// Size: 0x1d5
function private function_7caec59d5958332( alignmentinfo )
{
    alignmentinfo.origin = ( 0, 0, 0 );
    alignmentinfo.angles = ( 0, 0, 0 );
    
    if ( isent( alignmentinfo.alignent ) && isdefined( alignmentinfo.aligntag ) )
    {
        alignmentinfo.origin = alignmentinfo.alignent gettagorigin( alignmentinfo.aligntag, 1, 0, 0 );
        
        if ( !isdefined( alignmentinfo.origin ) )
        {
            alignmentinfo.origin = ( 0, 0, 0 );
        }
        
        alignmentinfo.angles = alignmentinfo.alignent gettagangles( alignmentinfo.aligntag, 1, 0, 0 );
        
        if ( !isdefined( alignmentinfo.angles ) )
        {
            alignmentinfo.angles = ( 0, 0, 0 );
        }
    }
    else
    {
        if ( isdefined( alignmentinfo.alignent.origin ) )
        {
            alignmentinfo.origin = alignmentinfo.alignent.origin;
        }
        
        if ( isdefined( alignmentinfo.alignent.angles ) )
        {
            alignmentinfo.angles = alignmentinfo.alignent.angles;
        }
    }
    
    alignmentinfo.origin += rotatevector( alignmentinfo.originoffset, alignmentinfo.angles );
    alignmentinfo.angles = combineangles( alignmentinfo.angles, alignmentinfo.anglesoffset );
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x83614e71, Offset: 0x10c33
// Size: 0x1a5
function private function_84ed189dc2017575( notifystring, notifyitem, sceneobjectdata )
{
    entity = self;
    
    if ( !isent( self ) )
    {
        return;
    }
    
    if ( !( isdefined( notifystring ) && isdefined( notifyitem.notifyobject ) ) )
    {
        return;
    }
    
    if ( !notifyitem.notifyrepeat && notifyitem.notifytriggered )
    {
        return;
    }
    
    note = tolower( notifyitem.notifynote );
    singletonnotify = "ewnr_" + self getentitynumber() + "_" + notifystring + "_" + note + "_" + ( notifyitem.notifyrepeat ? "_r" : "" );
    notifyitem.notifyobject notify( singletonnotify );
    notifyitem.notifyobject endon( singletonnotify );
    waittillframeend();
    
    if ( notifyitem.notifynote != "end" )
    {
        entity thread function_572b0278363e08b7( notifystring, "end", "entity_wait_note_abort" );
        entity endon( "entity_wait_note_abort" );
    }
    
    while ( true )
    {
        entity waittillmatch( notifystring, note );
        
        if ( isdefined( notifyitem.notifyobject ) )
        {
            if ( notifyitem.notifyrepeat || !notifyitem.notifytriggered )
            {
                notifyitem.notifyobject notify( notifyitem.notifynote );
                notifyitem.notifytriggered = 1;
            }
            
            if ( !notifyitem.notifyrepeat || notifyitem.notifynote == "end" )
            {
                return;
            }
        }
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0xbf050007, Offset: 0x10de0
// Size: 0x3e
function private function_572b0278363e08b7( notifystring, match, notifyresult )
{
    entity = self;
    entity waittillmatch( notifystring, match );
    
    if ( isdefined( entity ) )
    {
        entity notify( notifyresult );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0xcac65424, Offset: 0x10e26
// Size: 0x57
function private function_323ad75fb6c8b93( animasset )
{
    maxdist = 0;
    animtime = 0.25;
    
    while ( animtime <= 1 )
    {
        maxdist = max( maxdist, length( getmovedelta( animasset, 0, animtime ) ) );
        animtime += 0.25;
    }
    
    return maxdist;
}

// Namespace scene
// Params 5, eflags: 0x4
// Checksum 0xf3c110b6, Offset: 0x10e86
// Size: 0x8b
function private function_2d3d749de2362f93( sceneplay, alignmentinfo, inittype, lerptime, initializing )
{
    sceneobjectdata = self;
    
    if ( initializing )
    {
        reachtype = sceneobjectdata.sceneobject function_d59e2a5bf7ebcf90( sceneplay.shotinit );
        
        if ( reachtype != "Teleport" )
        {
            function_7caec59d5958332( alignmentinfo );
            return;
        }
    }
    
    sceneobjectdata function_66fc84a0876a4b7c( sceneplay, alignmentinfo, inittype, lerptime );
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x31d0cced, Offset: 0x10f19
// Size: 0x313
function private function_aa5b435587ec4d41( sceneplay, shotindex, objectindex )
{
    sceneobjectdata = self;
    sceneroot = sceneplay.sceneroot;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        aientity = sceneobjectdata.entity;
        demeanorstart = sceneobjectdata.sceneobject function_274782f8d123ede4( shotindex );
        locomotionstart = sceneobjectdata.sceneobject function_60303d122294b28e( shotindex );
        
        if ( demeanorstart != "DEFAULT" )
        {
            aientity val::set( "scene_shot", "demeanor", demeanorstart );
        }
        
        if ( sceneobjectdata function_7a4516ac3b008d7( shotindex ) )
        {
            aientity val::set( "scene_shot", "take_weapons", 1 );
        }
        
        if ( !sceneobjectdata.sceneroot function_de0c3faf7f92b366() )
        {
            aientity val::set( "scene_shot", "ignore_triggers", 1 );
            stealthreactlevel = sceneobjectdata function_e3a980d7b7e4538();
            
            if ( stealthreactlevel == "None" )
            {
                aientity val::set( "scene_shot", "ai_lightweight", 1 );
            }
        }
        
        if ( isdefined( sceneobjectdata.scenedata.var_a173fd36d9f698cb ) )
        {
            return;
        }
        
        reachtype = sceneobjectdata.sceneobject function_d59e2a5bf7ebcf90( shotindex );
        
        if ( reachtype != "Teleport" && sceneobjectdata.existingentity )
        {
            scenedata = sceneroot.scenedata;
            animasset = sceneobjectdata function_6bf501072826e845( shotindex )[ 0 ];
            
            if ( isdefined( animasset ) )
            {
                function_7caec59d5958332( sceneobjectdata.alignmentinfo );
                animstartorigin = getstartorigin( sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles, animasset );
                
                if ( distancesquared( aientity.origin, animstartorigin ) > squared( 16 ) )
                {
                    typefunc = sceneobjectdata function_2b6f213d891785e5( "shotObjectStopAnim" );
                    
                    if ( isdefined( typefunc ) && typefunc != &function_2d0d8b2ed2c4709a )
                    {
                        sceneobjectdata [[ typefunc ]]();
                    }
                    
                    speed_baseline = reach_speed( demeanorstart, locomotionstart );
                    arrivaltype = undefined;
                    
                    if ( reachtype == "ReachArrive" )
                    {
                        arrivaltype = function_a792a1f58632796b( sceneobjectdata.sceneobject function_5e398dcb8782e632( shotindex ) );
                    }
                    
                    /#
                        scene_debug::object_event( sceneobjectdata, "<dev string:x284>", sceneobjectdata.alignmentinfo.origin, sceneobjectdata.alignmentinfo.angles );
                    #/
                    
                    sceneroot childthread scene_coordinated_reach( sceneplay, shotindex, speed_baseline, [ aientity, animasset, sceneobjectdata.alignmentinfo, arrivaltype ] );
                    aientity utility::waittill_any( "scene_coordinated_reach", "death_or_disconnect" );
                }
            }
        }
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x7a76256, Offset: 0x11234
// Size: 0xf2
function private function_1ca92947a807ba17()
{
    sceneobjectdata = self;
    assert( isai( sceneobjectdata.entity ) );
    sceneobjectdata.entity endon( "death_or_disconnect" );
    sceneobjectdata endon( "scene_ai_stealth" );
    
    while ( isai( sceneobjectdata.entity ) )
    {
        lookatplayer = sceneobjectdata.entity function_e0fdabbc38d26482( 0.25 );
        
        if ( isdefined( lookatplayer ) && sceneobjectdata.var_d98952c22f4386d != lookatplayer )
        {
            sceneobjectdata.var_d98952c22f4386d = lookatplayer;
            sceneobjectdata.entity ai_lookat::enablelookatentity( sceneobjectdata.var_d98952c22f4386d );
        }
        else if ( isdefined( sceneobjectdata.var_d98952c22f4386d ) )
        {
            sceneobjectdata.entity ai_lookat::disablelookatentity( sceneobjectdata.var_d98952c22f4386d );
            sceneobjectdata.var_d98952c22f4386d = undefined;
        }
        
        waitframe();
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x2ea92e12, Offset: 0x1132e
// Size: 0xb4
function private function_681a51f2cc596bd3( reactlevel )
{
    if ( reactlevel == "None" )
    {
        return;
    }
    
    sceneobjectdata = self;
    assert( isai( sceneobjectdata.entity ) );
    sceneobjectdata.entity endon( "death_or_disconnect" );
    sceneobjectdata endon( "scene_ai_stealth" );
    
    if ( reactlevel == "Investigate" )
    {
        sceneobjectdata.entity utility::waittillmatch_any_return( "stealth_state_change", 1, 3 );
    }
    else
    {
        sceneobjectdata.entity waittillmatch( "stealth_state_change", 3 );
    }
    
    sceneobjectdata function_8f2e8c264c93b535();
    sceneobjectdata function_2d0d8b2ed2c4709a();
    sceneobjectdata thread object_cleanup( undefined, 1 );
}

// Namespace scene
// Params 4, eflags: 0x4
// Checksum 0x578966b, Offset: 0x113ea
// Size: 0xeb
function private function_eec9525757393421( attacker, inflictor, meansofdeath, objweapon )
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        assert( isai( sceneobjectdata.entity ) );
        aientity = sceneobjectdata.entity;
        aientity.allowdeath = 1;
        aientity.deathanimmode = "nophysics";
        aientity.disabledeathorient = 1;
        aientity.noragdoll = 1;
        aientity.skipdeathanim = 1;
        aientity.diequietly = 1;
        
        if ( aientity.magic_bullet_shield )
        {
            aientity ai::stop_magic_bullet_shield();
        }
        
        aientity kill( undefined, attacker, inflictor, meansofdeath, objweapon );
    }
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x9d38ccc9, Offset: 0x114dd
// Size: 0x36, Type: bool
function private function_e3a980d7b7e4538()
{
    sceneobjectdata = self;
    return sceneobjectdata.sceneobject.variant_object.stealthreact ?? "None";
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x45144e0f, Offset: 0x1151c
// Size: 0x2f, Type: bool
function private function_ad9c3b38f67b93f()
{
    sceneobjectdata = self;
    return istrue( sceneobjectdata.sceneobject.variant_object.navrepulsor );
}

// Namespace scene
// Params 2, eflags: 0x4
// Checksum 0xab9593a6, Offset: 0x11554
// Size: 0xbc
function private function_2c2907d07310b0e( searchname, ignorespawners = 1 )
{
    aligntargets = utility::function_461c2723a6988991( searchname, "targetname", ignorespawners );
    
    if ( !isdefined( aligntargets ) || aligntargets.size == 0 )
    {
        aligntarget = utility::function_461c2723a6988991( searchname, "script_noteworthy", ignorespawners );
    }
    
    if ( !isdefined( aligntargets ) || aligntargets.size == 0 )
    {
        aligntarget = utility::function_461c2723a6988991( "_scene_global_" + searchname, "targetname", ignorespawners );
    }
    
    if ( !isdefined( aligntargets ) || aligntargets.size == 0 )
    {
        aligntarget = utility::function_461c2723a6988991( "_scene_global_" + searchname, "script_noteworthy", ignorespawners );
    }
    
    if ( aligntargets.size > 1 )
    {
    }
    
    return aligntargets[ 0 ];
}

// Namespace scene
// Params 10, eflags: 0x4
// Checksum 0x9cd0e6d3, Offset: 0x11619
// Size: 0x9a
function private function_cef36d8c3e65c8c4( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectStoreAnimRequest" );
    
    if ( isdefined( typefunc ) )
    {
        sceneobjectdata [[ typefunc ]]( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype );
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0x94852b8c, Offset: 0x116bb
// Size: 0x52
function private function_b635d3c89c265ba4( animationtype, shotindex, animindex )
{
    sceneobjectdata = self;
    typefunc = sceneobjectdata function_2b6f213d891785e5( "objectClearAnimRequest" );
    
    if ( isdefined( typefunc ) )
    {
        sceneobjectdata [[ typefunc ]]( animationtype, shotindex, animindex );
    }
}

// Namespace scene
// Params 1, eflags: 0x4
// Checksum 0x7d99b50c, Offset: 0x11715
// Size: 0xf4
function private function_b438f97d7c4dd1f1( var_77859fc99c983bce )
{
    valid = 0;
    bodymodel = undefined;
    headmodel = undefined;
    var_c63a35cf597d1eeb = getoperatorskinscriptbundle( var_77859fc99c983bce );
    
    if ( isdefined( var_c63a35cf597d1eeb ) )
    {
        if ( function_d3d2d68859f2d1e0( #"hash_e628945a034fe8cb" ) )
        {
            bodymodel = var_c63a35cf597d1eeb.bodymodel;
            headmodel = var_c63a35cf597d1eeb.headmodel;
            valid = 1;
        }
        else
        {
            var_50e503c48edf58e3 = getscriptbundle( var_c63a35cf597d1eeb.body );
            
            if ( isdefined( var_50e503c48edf58e3 ) )
            {
                bodymodel = var_50e503c48edf58e3.model;
                var_b546fa30a0d41661 = getscriptbundle( var_c63a35cf597d1eeb.head );
                
                if ( isdefined( var_b546fa30a0d41661 ) )
                {
                    headmodel = var_b546fa30a0d41661.model;
                    valid = 1;
                }
            }
        }
    }
    
    return { #head:headmodel, #body:bodymodel, #isvalid:valid };
}

