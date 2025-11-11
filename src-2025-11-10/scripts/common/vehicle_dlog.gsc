#namespace vehicle_dlog;

// Namespace vehicle_dlog
// Params 3
// Checksum 0xb89ae3ee, Offset: 0x2d0
// Size: 0xe7
function spawn_event( vehicle, spawntype = "undefined", vehicletype )
{
    if ( !isdefined( vehicletype ) )
    {
        vehicletype = vehicle.vehiclename;
    }
    
    if ( !isdefined( vehicletype ) )
    {
        return;
    }
    
    dlog_recordevent( "dlog_event_vehicle_spawn", [ "vehicle_spawn_id", vehicle get_unique_id(), "pos_x", vehicle.origin[ 0 ], "pos_y", vehicle.origin[ 1 ], "pos_z", vehicle.origin[ 2 ], "matchtime_ms", function_cd4147ab95a9f684(), "spawn_type", spawntype, "vehicle_type", vehicletype ] );
}

// Namespace vehicle_dlog
// Params 2
// Checksum 0x6fe5abbc, Offset: 0x3bf
// Size: 0x1e3
function death_event( vehicle, deathdata )
{
    killerxuid = "undefined";
    weapon = "undefined";
    meansofdeath = "undefined";
    
    if ( isdefined( deathdata ) )
    {
        if ( isplayer( deathdata.attacker ) )
        {
            killerxuid = deathdata.attacker getxuid();
        }
        
        if ( isdefined( deathdata.objweapon ) )
        {
            if ( isstring( deathdata.objweapon ) )
            {
                weapon = deathdata.objweapon;
            }
            else if ( isweapon( deathdata.objweapon ) )
            {
                weapon = deathdata.objweapon.basename;
            }
        }
        
        if ( isdefined( deathdata.meansofdeath ) )
        {
            meansofdeath = deathdata.meansofdeath;
        }
    }
    
    dlog_recordevent( "dlog_event_vehicle_death", [ "vehicle_spawn_id", vehicle get_unique_id(), "vehicle_pos_x", vehicle.origin[ 0 ], "vehicle_pos_y", vehicle.origin[ 1 ], "vehicle_pos_z", vehicle.origin[ 2 ], "vehicle_angles_x", vehicle.angles[ 0 ], "vehicle_angles_y", vehicle.angles[ 1 ], "vehicle_angles_z", vehicle.angles[ 2 ], "killer_xuid", killerxuid, "weapon", weapon, "means_of_death", meansofdeath, "matchtime_ms", function_cd4147ab95a9f684() ] );
}

// Namespace vehicle_dlog
// Params 4
// Checksum 0x2166e5a0, Offset: 0x5aa
// Size: 0x224
function exit_event( vehicle, player, seatid, data )
{
    if ( !isplayer( player ) )
    {
        return;
    }
    
    if ( !isdefined( seatid ) )
    {
        return;
    }
    
    if ( !isdefined( data.exittype ) )
    {
        return;
    }
    
    if ( !isdefined( data.exitposition ) )
    {
        return;
    }
    
    failedexits = 0;
    
    if ( isdefined( vehicle.exitboundinginfo ) && isdefined( vehicle.exitboundinginfo.exitsfailed ) )
    {
        failedexits = vehicle.exitboundinginfo.exitsfailed.size;
    }
    
    player dlog_recordplayerevent( "dlog_event_player_vehicle_exit", [ "vehicle_spawn_id", vehicle get_unique_id(), "vehicle_pos_x", vehicle.origin[ 0 ], "vehicle_pos_y", vehicle.origin[ 1 ], "vehicle_pos_z", vehicle.origin[ 2 ], "vehicle_angles_x", vehicle.angles[ 0 ], "vehicle_angles_y", vehicle.angles[ 1 ], "vehicle_angles_z", vehicle.angles[ 2 ], "exit_seat_id", seatid, "exit_type", data.exittype, "exit_direction", data.exitdirection ?? "undefined", "exit_pos_x", data.exitposition[ 0 ], "exit_pos_y", data.exitposition[ 1 ], "exit_pos_z", data.exitposition[ 2 ], "failed_exits", failedexits, "exit_matchtime_ms", function_cd4147ab95a9f684() ] );
}

// Namespace vehicle_dlog
// Params 4
// Checksum 0x3be50fdc, Offset: 0x7d6
// Size: 0x135
function enter_event( vehicle, player, seatid, entertype )
{
    if ( !isplayer( player ) )
    {
        return;
    }
    
    if ( !isdefined( seatid ) )
    {
        return;
    }
    
    if ( !isdefined( entertype ) )
    {
        return;
    }
    
    player dlog_recordplayerevent( "dlog_event_player_vehicle_enter", [ "vehicle_spawn_id", vehicle get_unique_id(), "vehicle_pos_x", vehicle.origin[ 0 ], "vehicle_pos_y", vehicle.origin[ 1 ], "vehicle_pos_z", vehicle.origin[ 2 ], "vehicle_angles_x", vehicle.angles[ 0 ], "vehicle_angles_y", vehicle.angles[ 1 ], "vehicle_angles_z", vehicle.angles[ 2 ], "enter_seat_id", seatid, "enter_matchtime_ms", function_cd4147ab95a9f684(), "enter_type", entertype ] );
}

// Namespace vehicle_dlog
// Params 0
// Checksum 0xcdaaec44, Offset: 0x913
// Size: 0x56
function get_unique_id()
{
    if ( !isdefined( level.vehicledlogid ) )
    {
        level.vehicledlogid = 0;
    }
    
    if ( !isdefined( self.dlogid ) )
    {
        self.dlogid = level.vehicledlogid;
        level.vehicledlogid += 1;
    }
    
    return self.dlogid;
}

// Namespace vehicle_dlog
// Params 0
// Checksum 0xa0846edb, Offset: 0x972
// Size: 0x42
function function_cd4147ab95a9f684()
{
    matchstarttime = game[ "startTimeFromMatchStart" ] ?? level.starttimefrommatchstart ?? 0;
    timefrom = gettime() - matchstarttime;
    
    if ( timefrom < 0 )
    {
        timefrom = 0;
    }
    
    return timefrom;
}

