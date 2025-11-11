#using scripts\common\utility;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_spawn;
#using scripts\common\vehicle_tracking;
#using scripts\engine\utility;

#namespace vehicle_compass;

// Namespace vehicle_compass
// Params 1
// Checksum 0x9247f7c4, Offset: 0xa6
// Size: 0x58
function register_instance( vehicle )
{
    leveldata = get_level_data();
    leveldata.instances[ vehicle getentitynumber() ] = vehicle;
    vehicle_show( vehicle );
    
    if ( vehicle vehicle_tracking::function_d2bad728e2163c17() vehicle_spawn::has_flag( 7 ) )
    {
        vehicle_hide( vehicle );
    }
}

// Namespace vehicle_compass
// Params 1
// Checksum 0x75f147, Offset: 0x106
// Size: 0x30
function deregister_instance( vehicle )
{
    leveldata = get_level_data();
    leveldata.instances[ vehicle getentitynumber() ] = undefined;
}

// Namespace vehicle_compass
// Params 1
// Checksum 0x877720b4, Offset: 0x13e
// Size: 0x33, Type: bool
function function_b20cd24c7d75deeb( vehicle )
{
    leveldata = get_level_data();
    return leveldata.instances[ vehicle getentitynumber() ] == vehicle;
}

// Namespace vehicle_compass
// Params 3
// Checksum 0xb535daba, Offset: 0x17a
// Size: 0x61
function function_484c1142d4f4e710( vehicle, player, var_e6c819f806ce2c86 )
{
    if ( !player.hasspawned )
    {
        return;
    }
    
    if ( !function_461bc9a9504d10ed( vehicle, var_e6c819f806ce2c86 ) )
    {
        return;
    }
    
    vehicle builtin [[ level.sharedfuncs[ #"vehicle" ][ #"vehicleshowonminimapforclient" ] ]]( player, 1 );
}

// Namespace vehicle_compass
// Params 3
// Checksum 0xb21e7815, Offset: 0x1e3
// Size: 0xcc
function function_f43158fa5698deb9( vehicle, players, var_e6c819f806ce2c86 )
{
    if ( !function_461bc9a9504d10ed( vehicle, var_e6c819f806ce2c86 ) )
    {
        return;
    }
    
    foreach ( player in players )
    {
        if ( !player.hasspawned )
        {
            continue;
        }
        
        vehicle builtin [[ level.sharedfuncs[ #"vehicle" ][ #"vehicleshowonminimapforclient" ] ]]( player, 1 );
    }
}

// Namespace vehicle_compass
// Params 2, eflags: 0x4
// Checksum 0xcd6966c3, Offset: 0x2b7
// Size: 0x88, Type: bool
function private function_461bc9a9504d10ed( vehicle, var_e6c819f806ce2c86 )
{
    leveldata = get_level_data();
    
    if ( !leveldata.visibilityisscriptcontrolled )
    {
        return false;
    }
    
    if ( !isdefined( vehicle ) )
    {
        return false;
    }
    
    if ( !function_b20cd24c7d75deeb( vehicle ) )
    {
        if ( !var_e6c819f806ce2c86 )
        {
            assertmsg( "<dev string:x24>" );
        }
        
        return false;
    }
    
    if ( !isdefined( level.sharedfuncs[ #"vehicle" ][ #"vehicleshowonminimapforclient" ] ) )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_compass
// Params 2
// Checksum 0x6ede92eb, Offset: 0x348
// Size: 0xd4
function function_875431dd0d57f2fd( vehicle, var_e6c819f806ce2c86 )
{
    if ( !function_461bc9a9504d10ed( vehicle ) )
    {
        return;
    }
    
    var_cbaf02c53ccec36d = level.sharedfuncs[ #"vehicle" ][ #"vehicleshowonminimapforclient" ];
    
    foreach ( player in level.players )
    {
        if ( !player.hasspawned )
        {
            continue;
        }
        
        vehicle builtin [[ var_cbaf02c53ccec36d ]]( player, 1 );
    }
}

// Namespace vehicle_compass
// Params 2
// Checksum 0xb1a194ca, Offset: 0x424
// Size: 0x102
function function_3e3244741bc2a2ec( player, var_e6c819f806ce2c86 )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    leveldata = get_level_data();
    
    if ( !leveldata.visibilityisscriptcontrolled )
    {
        return;
    }
    
    if ( !leveldata.instances.size )
    {
        return;
    }
    
    var_cbaf02c53ccec36d = level.sharedfuncs[ #"vehicle" ][ #"vehicleshowonminimapforclient" ];
    
    if ( !isdefined( var_cbaf02c53ccec36d ) )
    {
        return;
    }
    
    foreach ( instance in leveldata.instances )
    {
        if ( !isdefined( instance ) )
        {
            continue;
        }
        
        instance builtin [[ var_cbaf02c53ccec36d ]]( player, 1 );
    }
}

// Namespace vehicle_compass
// Params 1
// Checksum 0x958647e9, Offset: 0x52e
// Size: 0x9b
function vehicle_show( vehicle )
{
    leveldata = get_level_data();
    
    if ( leveldata.visibilityisscriptcontrolled )
    {
        vehicle utility::callsharedfunc( #"vehicle", #"vehicleshowonminimap", 1 );
    }
    
    if ( isdefined( leveldata.instances[ vehicle getentitynumber() ] ) )
    {
        if ( level.teambased )
        {
            function_e527b9d6ae381350( vehicle, vehicle_occupancy::function_88fc32afbd317644( vehicle ) );
        }
        else
        {
            function_df8b8a691bf004f8( vehicle, vehicle_occupancy::function_e3f715e42f7b96c4( vehicle ) );
        }
        
        function_875431dd0d57f2fd( vehicle, 1 );
    }
}

// Namespace vehicle_compass
// Params 1
// Checksum 0x1891b564, Offset: 0x5d1
// Size: 0x5a
function vehicle_hide( vehicle )
{
    leveldata = get_level_data();
    leveldata.instances[ vehicle getentitynumber() ] = undefined;
    
    if ( leveldata.visibilityisscriptcontrolled )
    {
        vehicle utility::callsharedfunc( #"vehicle", #"vehicleshowonminimap", 0 );
    }
}

// Namespace vehicle_compass
// Params 2
// Checksum 0xe368229d, Offset: 0x633
// Size: 0x54
function function_e527b9d6ae381350( vehicle, team )
{
    if ( !isdefined( team ) || team == "neutral" || team == "none" )
    {
        team = utility::issp() ? "neutral" : "none";
    }
    
    vehicle setvehicleteam( team );
}

// Namespace vehicle_compass
// Params 2
// Checksum 0x3fbc3495, Offset: 0x68f
// Size: 0x1d
function function_df8b8a691bf004f8( vehicle, player )
{
    vehicle setentityowner( undefined );
}

// Namespace vehicle_compass
// Params 0
// Checksum 0x7a1e380c, Offset: 0x6b4
// Size: 0x10a
function init()
{
    assert( isdefined( level.vehicle ), "<dev string:x76>" );
    assert( !isdefined( level.vehicle.compass ), "<dev string:xaf>" );
    leveldata = spawnstruct();
    level.vehicle.compass = leveldata;
    leveldata.instances = [];
    runleanthreadmode = 0;
    
    if ( utility::issharedfuncdefined( #"game", #"runleanthreadmode" ) )
    {
        runleanthreadmode = [[ utility::getsharedfunc( #"game", #"runleanthreadmode" ) ]]();
    }
    
    leveldata.visibilityisscriptcontrolled = !runleanthreadmode || getdvarint( @"hash_61d6ab22f59b15a6", 1 ) > 0;
    
    if ( utility::issharedfuncdefined( #"vehicle_compass", #"init" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_compass", #"init" ) ]]();
    }
}

// Namespace vehicle_compass
// Params 0
// Checksum 0xea19d326, Offset: 0x7c6
// Size: 0x36
function get_level_data()
{
    assert( isdefined( level.vehicle.compass ), "<dev string:xe6>" );
    return level.vehicle.compass;
}

// Namespace vehicle_compass
// Params 3
// Checksum 0x19931973, Offset: 0x805
// Size: 0x99
function function_863cca296c26ac67( vehicle, var_82e6ae7a41cd7ff8, var_e56f1d76e18cd597 )
{
    leveldata = get_level_data();
    isregistered = isdefined( leveldata.instances[ vehicle getentitynumber() ] ) && leveldata.instances[ vehicle getentitynumber() ] == vehicle;
    
    if ( !isregistered )
    {
        return;
    }
    
    if ( level.teambased )
    {
        function_e527b9d6ae381350( vehicle, var_e56f1d76e18cd597 );
    }
    else
    {
        function_df8b8a691bf004f8( vehicle, var_e56f1d76e18cd597 );
    }
    
    function_875431dd0d57f2fd( vehicle );
}

// Namespace vehicle_compass
// Params 1
// Checksum 0xfd68636d, Offset: 0x8a6
// Size: 0x23
function function_e6e64dc4b4bfff6f( player )
{
    if ( !level.teambased )
    {
        return;
    }
    
    function_3e3244741bc2a2ec( player );
}

// Namespace vehicle_compass
// Params 1
// Checksum 0x7e11b5d, Offset: 0x8d1
// Size: 0x14
function function_c02c43393e108dc4( params )
{
    function_3e3244741bc2a2ec( self );
}

