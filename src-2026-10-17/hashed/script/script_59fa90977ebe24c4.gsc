#using scripts\common\objective_marker_bundle_helper;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\objidpoolmanager;

#namespace objective_marker_bundle_helper_mp;

// Namespace objective_marker_bundle_helper_mp
// Params 0, eflags: 0x5
// Checksum 0x2bdcdbdc, Offset: 0x7b
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"objective_marker_bundle_helper_mp", undefined, &function_48e00e00713c881e, undefined );
}

// Namespace objective_marker_bundle_helper_mp
// Params 0, eflags: 0x4
// Checksum 0xd1ffe5c5, Offset: 0x9c
// Size: 0x20
function private function_48e00e00713c881e()
{
    utility::registersharedfunc( #"objective_marker_bundle_helper", #"createobjectivemarkerfrombundlexhash", &mp_createobjectivemarkerfrombundlexhash );
}

// Namespace objective_marker_bundle_helper_mp
// Params 2
// Checksum 0xf2ceac2f, Offset: 0xc4
// Size: 0xc8
function mp_createobjectivemarkerfrombundlexhash( bundlexhash, cache )
{
    if ( !objective_marker_bundle_helper::function_276df282305685bb() )
    {
        objective_marker_bundle_helper::function_aded78d14325f551();
    }
    
    objectivemarkerbundle = function_5a72ef0b7b724172( bundlexhash, cache );
    
    if ( isdefined( objectivemarkerbundle ) )
    {
        objectivemarkerid = objidpoolmanager::requestobjectiveid( 0 );
        
        if ( objectivemarkerid == -1 )
        {
            assertmsg( "<dev string:x24>" + getxhashsourcename( bundlexhash ) + "<dev string:x87>" );
            return -1;
        }
        
        function_31bfe34edc7da63d( objectivemarkerbundle, objectivemarkerid );
        function_7d81afbc7684683a( objectivemarkerbundle, objectivemarkerid );
        function_8c801ad3990ce621( objectivemarkerbundle, objectivemarkerid );
        function_8bd8dfe54f451d79( objectivemarkerbundle, objectivemarkerid );
        function_5a0a5b7362437fe4( objectivemarkerbundle, objectivemarkerid );
        return objectivemarkerid;
    }
    
    assertmsg( "<dev string:x97>" + getxhashsourcename( bundlexhash ) + "<dev string:xb8>" );
    return -1;
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0x5bb9de8b, Offset: 0x195
// Size: 0x6e
function private function_5a72ef0b7b724172( bundlexhash, cache )
{
    objectivemarkerbundle = level.objectivemarkerbundles[ bundlexhash ];
    
    if ( !isdefined( objectivemarkerbundle ) )
    {
        objectivemarkerbundle = getscriptbundle( bundlexhash );
        
        if ( isdefined( objectivemarkerbundle ) && cache )
        {
            if ( !isdefined( level.objectivemarkerbundles ) )
            {
                level.objectivemarkerbundles = [];
            }
            
            level.objectivemarkerbundles[ bundlexhash ] = objectivemarkerbundle;
        }
    }
    
    return objectivemarkerbundle;
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0xf79f978b, Offset: 0x20c
// Size: 0x151
function private function_31bfe34edc7da63d( objectivemarkerbundle, objectivemarkerid )
{
    generalsettings = objectivemarkerbundle.generalsettings;
    objective_icon( objectivemarkerid, generalsettings.var_7aed872ac463b234 );
    objective_state( objectivemarkerid, generalsettings.state );
    objective_setisoptional( objectivemarkerid, generalsettings.isoptional );
    objective_setownerteam( objectivemarkerid, generalsettings.ownerteam );
    backgroundoption = level.var_fdb512e0da2d2fc7.backgroundoptions[ generalsettings.background ];
    objective_setbackground( objectivemarkerid, backgroundoption );
    
    if ( isdefined( generalsettings.var_dc10495f590deded ) )
    {
        var_dc10495f590deded = ( 0, 0, 0 );
        var_dc01b6bac8d24e0 = generalsettings.var_dc10495f590deded;
        var_21f669501225774f = strtok( var_dc01b6bac8d24e0, " " );
        
        if ( var_21f669501225774f.size == 4 )
        {
            var_dc10495f590deded = ( float( var_21f669501225774f[ 0 ] ) * 255, float( var_21f669501225774f[ 1 ] ) * 255, float( var_21f669501225774f[ 2 ] ) * 255 );
        }
        
        objective_settint( objectivemarkerid, int( var_dc10495f590deded[ 0 ] ), int( var_dc10495f590deded[ 1 ] ), int( var_dc10495f590deded[ 2 ] ) );
    }
    
    function_2cc2af8943549bb9( objectivemarkerid, generalsettings.var_dbf3b8752a1c3b35 );
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0xf5f9d987, Offset: 0x365
// Size: 0x86
function private function_7d81afbc7684683a( objectivemarkerbundle, objectivemarkerid )
{
    minimapsettings = objectivemarkerbundle.minimapsettings;
    objective_setminimapiconsize( objectivemarkerid, minimapsettings.minimapsize );
    objective_sethideonminimap( objectivemarkerid, minimapsettings.hideonminimap );
    objective_sethideonminimapwhenclipped( objectivemarkerid, minimapsettings.hideonminimapwhenclipped );
    objective_setplayrevealaniminminimap( objectivemarkerid, minimapsettings.playrevealaniminminimap );
    objective_setrotateonminimap( objectivemarkerid, minimapsettings.var_173d6b2a5b0c211f );
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0xa9cd7ff2, Offset: 0x3f3
// Size: 0x74
function private function_8c801ad3990ce621( objectivemarkerbundle, objectivemarkerid )
{
    tacmapsettings = objectivemarkerbundle.tacmapsettings;
    objective_setshowdirectionindicatorintacmap( objectivemarkerid, tacmapsettings.var_9c62f4aa15e546c5 );
    objective_setshownewnessindicatorintacmap( objectivemarkerid, tacmapsettings.var_9b9011be55d95bfd );
    objective_setplayrevealanimintacmap( objectivemarkerid, tacmapsettings.playrevealanimintacmap );
    objective_sethideelevation( objectivemarkerid, tacmapsettings.hideelevation );
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0x3a5b9116, Offset: 0x46f
// Size: 0x3e
function private function_8bd8dfe54f451d79( objectivemarkerbundle, objectivemarkerid )
{
    compasssettings = objectivemarkerbundle.compasssettings;
    objective_setshowoncompass( objectivemarkerid, compasssettings.showoncompass );
}

// Namespace objective_marker_bundle_helper_mp
// Params 2, eflags: 0x4
// Checksum 0xf36692fe, Offset: 0x4b5
// Size: 0x29e
function private function_5a0a5b7362437fe4( objectivemarkerbundle, objectivemarkerid )
{
    hudsettings = objectivemarkerbundle.hudsettings;
    objective_setpulsate( objectivemarkerid, hudsettings.shouldpulsate );
    objective_setshowprogress( objectivemarkerid, hudsettings.showprogressbar );
    objective_setplayintro( objectivemarkerid, hudsettings.var_f779b90197fe825b );
    objective_setplayoutro( objectivemarkerid, hudsettings.var_b211cd4ac71330ce );
    objective_setshowdistance( objectivemarkerid, hudsettings.showdistance );
    objective_setzoffset( objectivemarkerid, hudsettings.zoffset );
    
    if ( isdefined( hudsettings.var_ee7bc8b53cebd37e ) && hudsettings.var_1e1ecace3b3c2a63 > 0 && hudsettings.var_ee7bc8b53cebd37e > 0 )
    {
        objective_setfadingdistance( objectivemarkerid, hudsettings.var_1e1ecace3b3c2a63, hudsettings.var_ee7bc8b53cebd37e );
    }
    
    if ( isdefined( hudsettings.hudtext.label ) && hudsettings.hudtext.label != &"" )
    {
        objective_setlabel( objectivemarkerid, hudsettings.hudtext.label );
    }
    
    if ( isdefined( hudsettings.hudtext.friendlylabel ) && hudsettings.hudtext.friendlylabel != &"" )
    {
        objective_setfriendlylabel( objectivemarkerid, hudsettings.hudtext.friendlylabel );
    }
    
    if ( isdefined( hudsettings.hudtext.enemylabel ) && hudsettings.hudtext.enemylabel != &"" )
    {
        objective_setenemylabel( objectivemarkerid, hudsettings.hudtext.enemylabel );
    }
    
    if ( isdefined( hudsettings.hudtext.neutrallabel ) && hudsettings.hudtext.neutrallabel != &"" )
    {
        objective_setneutrallabel( objectivemarkerid, hudsettings.hudtext.neutrallabel );
    }
    
    if ( isdefined( hudsettings.hudtext.description ) && hudsettings.hudtext.description != &"" )
    {
        objective_setdescription( objectivemarkerid, hudsettings.hudtext.description );
    }
}

