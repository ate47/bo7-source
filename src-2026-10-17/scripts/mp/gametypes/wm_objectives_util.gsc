#using script_194f8050b4a6d3a1;

#namespace wm_objectives_util;

// Namespace wm_objectives_util
// Params 2
// Checksum 0x3d72befd, Offset: 0x9d
// Size: 0x69
function getobjectiveparam( member, defvalue )
{
    if ( isdefined( level.zone ) && isdefined( level.zone.objective.params[ member ] ) )
    {
        return level.zone.objective.params[ member ];
    }
    
    return defvalue;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0xdf0244bc, Offset: 0x10f
// Size: 0x8e, Type: bool
function function_1873b4024a26afb7( zone )
{
    foreach ( player in level.players )
    {
        if ( player.isplanting )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0x270d7af3, Offset: 0x1a6
// Size: 0x12a, Type: bool
function function_8ee2d56dd607cfa7( zone )
{
    sam_sites = zone.turrets;
    
    foreach ( turret in sam_sites )
    {
        if ( !isdefined( turret ) )
        {
            continue;
        }
        
        if ( turret.samsitestate == "defuse" )
        {
            return false;
        }
    }
    
    foreach ( player in level.players )
    {
        if ( player.var_656c75764302edc1 )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0x24fa4211, Offset: 0x2d9
// Size: 0x9b, Type: bool
function function_67b316ac48344f73( zone )
{
    foreach ( capture_zone in zone.capture_zones )
    {
        if ( capture_zone.touchlist[ game[ "attackers" ] ].size > 0 )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0x734d9143, Offset: 0x37d
// Size: 0x95, Type: bool
function function_6aa161da52a5fbe6( zone )
{
    if ( !isdefined( level.escortvehicles[ 0 ] ) )
    {
        return true;
    }
    
    tank = level.escortvehicles[ 0 ];
    nearbyrange = getdvarint( @"hash_9133c54c3f6aee07", 300 );
    attackers = teams::getteamdata( game[ "attackers" ], "alivePlayers" );
    nearbyattackers = sortbydistancecullbyradius( attackers, tank.origin, nearbyrange );
    
    if ( nearbyattackers.size > 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0xf69e70fc, Offset: 0x41b
// Size: 0xb3, Type: bool
function function_efad2a9c9d82a0f4( zone )
{
    foreach ( hackzone in zone.hackzones )
    {
        if ( hackzone.ishacking )
        {
            return false;
        }
        
        if ( hackzone.hacked && !hackzone.complete )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace wm_objectives_util
// Params 1
// Checksum 0xca8ccc9a, Offset: 0x4d7
// Size: 0x90, Type: bool
function function_5f3f1056cae339d1( zone )
{
    foreach ( contestzone in zone.contestzones )
    {
        if ( contestzone.robbed )
        {
            return false;
        }
    }
    
    return true;
}

