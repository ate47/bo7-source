#using scripts\common\scene_debug;
#using scripts\common\scene_internal;
#using scripts\common\values;
#using scripts\engine\utility;

#namespace scene;

// Namespace scene
// Params 0
// Checksum 0x71047f6f, Offset: 0x1f4
// Size: 0x80
function function_6c37456303b2e980()
{
    if ( !isinfrontend() )
    {
        return;
    }
    
    level.players = [ self ];
    function_9faf48fca9716acd();
    function_3a06b41e384fbf58( "Types_ClientChar", "objectDelete", &function_a2816310f8e01445 );
    function_3a06b41e384fbf58( "Types_ClientChar", "shotObjectPrepare", &function_88b717bec001f592 );
    function_3a06b41e384fbf58( "Types_Prop", "shotObjectPlayAnim", &function_8384f562f0cb4abe );
    function_3a06b41e384fbf58( "Types_XCam", "shotObjectPlayAnim", &function_e5fa611bc31131e8 );
    function_a8d91578e2556475();
}

// Namespace scene
// Params 0, eflags: 0x4
// Checksum 0x79a23d56, Offset: 0x27c
// Size: 0x80
function private function_a2816310f8e01445()
{
    sceneobjectdata = self;
    
    if ( isdefined( sceneobjectdata.entity ) )
    {
        sceneobjectdata.entity hide();
        
        if ( sceneobjectdata.sceneroot.var_c46929fa56699327 )
        {
            sceneobjectdata.sceneroot.var_c46929fa56699327 = arrayremove( sceneobjectdata.sceneroot.var_c46929fa56699327, sceneobjectdata.entity );
        }
    }
}

// Namespace scene
// Params 3, eflags: 0x4
// Checksum 0xa455fc1e, Offset: 0x304
// Size: 0xa2
function private function_88b717bec001f592( sceneplay, shotindex, sceneobjectindex )
{
    sceneobjectdata = self;
    sceneobject = sceneobjectdata.sceneobject;
    var_dac9072a6d0b14bd = sceneobject.variant_object.shots[ shotindex ];
    characterindex = sceneobject function_8d6340a41bdf10ed() - 1;
    character = level.client_characters[ characterindex ];
    character function_de4866729f37f5d2( var_dac9072a6d0b14bd.deltaanimations.size > 0 );
}

// Namespace scene
// Params 9, eflags: 0x4
// Checksum 0xdabd24b2, Offset: 0x3ae
// Size: 0x269
function private function_8384f562f0cb4abe( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime )
{
    sceneobjectdata = self;
    entity = sceneobjectdata.entity;
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    animlengthtime = 0;
    done = 0;
    
    if ( entity.model == "" )
    {
        println( "<dev string:x24>" + sceneobjectdata.sceneobject.variant_object.name + "<dev string:x57>" );
        return 0;
    }
    
    entity val::set( "scene_shot", "cinematics_participant", 1 );
    
    if ( !isdefined( blendtime ) )
    {
        blendtime = 0;
    }
    
    if ( !isdefined( lerptime ) )
    {
        lerptime = 0;
    }
    
    if ( !isdefined( var_142c2c5d44216f2a ) )
    {
        var_142c2c5d44216f2a = 0;
    }
    
    if ( isdefined( sceneobjectdata.scenedata.var_a173fd36d9f698cb ) )
    {
        blendtime = 0;
        lerptime = 0;
    }
    
    var_20a98ee68cb249af = getanimname( animasset );
    function_7caec59d5958332( alignmentinfo );
    var_3d2460219c7907a = "none";
    
    if ( blendtime > 0 && blendtime < 1 )
    {
        var_3d2460219c7907a = "normal";
    }
    else if ( blendtime >= 1 )
    {
        var_3d2460219c7907a = "slow";
    }
    
    starttimeinseconds = 0;
    n_anim_length = getanimlength( animasset );
    
    if ( var_142c2c5d44216f2a > 0 )
    {
        starttimeinseconds = n_anim_length * var_142c2c5d44216f2a;
    }
    
    b_looping = animislooping( animasset );
    
    if ( var_142c2c5d44216f2a < 1 )
    {
        sceneobjectdata childthread function_26364b7b16eb9611( notifystring, animasset );
    }
    
    entity scriptmodelclearanim();
    entity useanimtree( sceneobjectdata.sceneobject function_4641057744100c08() );
    entity animscripted( notifystring, alignmentinfo.origin, alignmentinfo.angles, animasset, undefined, undefined, blendtime );
    entity scriptmodelplayanim( var_20a98ee68cb249af, undefined, starttimeinseconds, 1, var_3d2460219c7907a );
    sceneobjectdata function_4a9835edd174d8e3( animasset );
    animlengthtime += getanimlength( animasset );
    
    if ( b_looping )
    {
        sceneobjectdata waittillmatch( notifystring, "end" );
    }
    else if ( animlengthtime > 0 )
    {
        sceneobjectdata utility::waittill_match_or_timeout( notifystring, "end", animlengthtime );
    }
    
    return animlengthtime - var_142c2c5d44216f2a * animlengthtime;
}

// Namespace scene
// Params 10, eflags: 0x4
// Checksum 0x2bba50ec, Offset: 0x620
// Size: 0x1f8
function private function_e5fa611bc31131e8( shotindex, animindex, notifystring, alignmentinfo, animasset, var_142c2c5d44216f2a, blendtime, blendcurve, lerptime, animationtype )
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
    players = sceneobjectdata function_931d12df9abebc7f();
    
    foreach ( player in players )
    {
        sceneobjectdata childthread function_d3e02207e3f1f850( "scene_shot_xcam", player, animasset, var_142c2c5d44216f2a, notifystring, alignmentinfo, shotindex );
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
// Checksum 0xa4b168d0, Offset: 0x821
// Size: 0x228
function private function_d3e02207e3f1f850( valgroup, player, animasset, var_142c2c5d44216f2a, notifystring, alignmentinfo, shotindex )
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
        scene_debug::object_event( sceneobjectdata, "<dev string:x5c>" + shotindex, alignmentinfo.origin, alignmentinfo.angles );
    #/
    
    waittime = 0;
    
    if ( animasset != "" )
    {
        starttime = 0;
        
        if ( var_142c2c5d44216f2a > 0 )
        {
            starttime = getxcamlength( animasset ) * var_142c2c5d44216f2a;
        }
        
        player notify( "scene_play_xcam" );
        player endon( "scene_play_xcam" );
        
        if ( !isdefined( level.var_26b9bd60c95fd049 ) )
        {
            level.var_26b9bd60c95fd049 = spawn( "script_model", alignmentinfo.origin );
            level.var_26b9bd60c95fd049 setmodel( "tag_origin" );
        }
        
        level.var_26b9bd60c95fd049.origin = alignmentinfo.origin;
        level.var_26b9bd60c95fd049.angles = alignmentinfo.angles;
        blendtime = sceneobjectdata.sceneobject function_1c54677f7be74c59( shotindex );
        
        if ( blendtime == 0 )
        {
            sceneobjectdata thread function_85ae4b01cd8305f2();
        }
        
        function_41797a7aad14e175( animasset, 0, blendtime, level.var_26b9bd60c95fd049 );
        player cameralinkto( level.var_26b9bd60c95fd049, "tag_origin" );
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
// Params 0, eflags: 0x4
// Checksum 0x525014ff, Offset: 0xa52
// Size: 0x56
function private function_85ae4b01cd8305f2()
{
    sceneobjectdata = self;
    var_a5534827805425ee = "client_scene_teleport:" + sceneobjectdata.activeanimation;
    setdvar( @"hash_b8cc749b90dd2705", var_a5534827805425ee );
    level.active_section.name = var_a5534827805425ee;
    waitframe();
    completescenetransition();
}

