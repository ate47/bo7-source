#using scripts\common\callbacks;
#using scripts\common\vehicle;
#using scripts\common\vehicle_spawn;
#using scripts\engine\utility;

#namespace vehicle_tracking;

// Namespace vehicle_tracking
// Params 2
// Checksum 0x25934692, Offset: 0x14a
// Size: 0x215
function spawn_vehicle( spawndata, faildata )
{
    /#
        function_e0a8c3f4eeb707e( spawndata );
    #/
    
    if ( !can_spawn_vehicle() )
    {
        if ( isdefined( faildata ) )
        {
            faildata.fail = "total_limit_exceeded";
        }
        
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x24>" + spawndata.modelname + "<dev string:x51>" + level.vehiclecount + "<dev string:x6b>" + level.maxvehiclecount );
            }
        #/
        
        return undefined;
    }
    
    if ( utility::issharedfuncdefined( #"game", #"isvalidpointinbounds" ) )
    {
        if ( ![[ utility::getsharedfunc( #"game", #"isvalidpointinbounds" ) ]]( spawndata.origin ) )
        {
            if ( isdefined( faildata ) )
            {
                faildata.fail = "spawn_invalid_location";
            }
            
            return undefined;
        }
    }
    
    vehicle = spawnvehicle( spawndata.modelname, spawndata.targetname ?? spawndata.script_vehicleref ?? spawndata.vehicletype, spawndata.vehicletype, spawndata.origin, spawndata.angles, spawndata.owner, spawndata.initialvelocity, spawndata.dospawnedcallback );
    
    if ( !isdefined( vehicle.vehiclename ) )
    {
        vehicle.vehiclename = spawndata.vehicletype;
    }
    
    if ( !isdefined( vehicle ) )
    {
        if ( isdefined( faildata ) )
        {
            faildata.fail = "total_limit_exceeded";
        }
        
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x88>" + spawndata.modelname );
            }
        #/
        
        return undefined;
    }
    
    vehicle.spawndata = spawndata;
    level.vehiclecount++;
    callback::callback( #"vehicle_spawn", { #spawndata:spawndata, #vehicle:vehicle } );
    return vehicle;
}

// Namespace vehicle_tracking
// Params 2
// Checksum 0x2a85585e, Offset: 0x368
// Size: 0xe7
function function_67616b82fb3a0d53( spawndata, faildata )
{
    /#
        function_e0a8c3f4eeb707e( spawndata );
    #/
    
    vehicle = spawn( "script_model", spawndata.origin );
    vehicle.angles = spawndata.angles;
    vehicle.targetname = spawndata.targetname ?? spawndata.script_vehicleref;
    vehicle.owner = spawndata.owner;
    vehicle.spawndata = spawndata;
    vehicle setmodel( spawndata.modelname );
    level.vehiclecount++;
    callback::callback( #"vehicle_spawn", { #spawndata:spawndata, #vehicle:vehicle } );
    return vehicle;
}

// Namespace vehicle_tracking
// Params 5
// Checksum 0x4158a37d, Offset: 0x458
// Size: 0x171
function spawn_helicopter( owner, origin, angles, type, modelname )
{
    faildata = spawnstruct();
    spawndata = spawnstruct();
    spawndata.modelname = modelname;
    spawndata.vehicletype = type;
    spawndata.origin = origin;
    spawndata.angles = angles;
    spawndata.owner = owner;
    
    if ( !can_spawn_vehicle() )
    {
        if ( isdefined( faildata ) )
        {
            faildata.fail = "total_limit_exceeded";
        }
        
        return undefined;
    }
    
    vehicle = utility::callsharedfunc( #"vehicle", #"spawnhelicopter", spawndata.owner, spawndata.origin, spawndata.angles, spawndata.vehicletype, spawndata.modelname );
    
    if ( !isdefined( vehicle ) )
    {
        if ( isdefined( faildata ) )
        {
            faildata.fail = "code";
        }
        
        return undefined;
    }
    
    level.vehiclecount++;
    vehicle.spawndata = spawndata;
    callback::callback( #"helicopter_spawn", { #spawndata:spawndata, #vehicle:vehicle } );
    return vehicle;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x685c2062, Offset: 0x5d2
// Size: 0x37, Type: bool
function delete_vehicle( vehicle )
{
    vehicle notify( "vehicle_deleted" );
    level.vehiclecount--;
    
    if ( isdefined( vehicle ) )
    {
        function_f0f2234a3b887900( vehicle );
        vehicle delete();
    }
    
    return true;
}

// Namespace vehicle_tracking
// Params 1, eflags: 0x4
// Checksum 0xda7e148c, Offset: 0x612
// Size: 0x151
function private function_f0f2234a3b887900( vehicle )
{
    if ( !isdefined( vehicle.linkedchildren ) )
    {
        return;
    }
    
    foreach ( scriptable in vehicle.linkedchildren )
    {
        if ( !isdefined( scriptable ) )
        {
            continue;
        }
        
        if ( isdefined( scriptable.type ) && utility::issharedfuncdefined( scriptable.type, #"delete" ) && scriptable [[ utility::getsharedfunc( scriptable.type, #"delete" ) ]]() )
        {
            continue;
        }
        
        scriptable notify( "death", vehicle.burndownattacker ?? vehicle );
        scriptable utility::script_func( "deregisterScriptable" );
        
        if ( scriptable getscriptableisreserved() )
        {
            scriptable freescriptable();
            continue;
        }
        
        part = scriptable function_84ad2f70189ee7c3();
        
        if ( scriptable getscriptableparthasstate( part, "hidden" ) )
        {
            scriptable setscriptablepartstate( part, "hidden" );
        }
    }
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0xa104acbc, Offset: 0x76b
// Size: 0x2b, Type: bool
function can_spawn_vehicle( count = 1 )
{
    return level.vehiclecount + count <= level.maxvehiclecount;
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0xbcd0550b, Offset: 0x79f
// Size: 0xb
function get_vehicle_count()
{
    return level.vehiclecount;
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0x1989fa94, Offset: 0x7b3
// Size: 0x96
function function_c2c7b13ef5c4446e()
{
    count = 0;
    
    foreach ( vehicle in function_5820a38c9873992e() )
    {
        if ( vehicle function_d53ca0a2fd01145f() vehicle_spawn::has_flag( 4 ) )
        {
            count += 1;
        }
    }
    
    return count;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x53d5433d, Offset: 0x852
// Size: 0x68, Type: bool
function reserve_vehicle( count )
{
    if ( can_spawn_vehicle() )
    {
        if ( !isdefined( count ) )
        {
            level.vehiclecount++;
            return true;
        }
        
        availablevehicles = level.maxvehiclecount - level.vehiclecount;
        
        if ( count <= availablevehicles )
        {
            level.vehiclecount += count;
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x732dd481, Offset: 0x8c3
// Size: 0x64
function function_4f76f5b4541acef1( count )
{
    if ( !isdefined( count ) )
    {
        count = 1;
    }
    
    level.vehiclecount -= count;
    
    /#
        if ( level.vehiclecount < 0 )
        {
            utility::error( "<dev string:xc2>" );
        }
    #/
    
    level.vehiclecount = int( max( 0, level.vehiclecount ) );
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0xf38c7007, Offset: 0x92f
// Size: 0xb
function function_d2bad728e2163c17()
{
    return self.spawndata;
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0x648c3de2, Offset: 0x943
// Size: 0x1f
function function_d53ca0a2fd01145f()
{
    if ( vehicle::is_husk() )
    {
        return self.basevehiclespawndata;
    }
    
    return function_d2bad728e2163c17();
}

// Namespace vehicle_tracking
// Params 2
// Checksum 0xf60c444d, Offset: 0x96a
// Size: 0x23d
function function_2b6c8c165ab5f521( from, to )
{
    to.modelname = from.modelname;
    to.var_305ce2bb6ec0993d = from.var_305ce2bb6ec0993d;
    to.targetname = from.targetname;
    to.script_vehicleref = from.script_vehicleref;
    to.script_vehiclerefs = from.script_vehiclerefs;
    to.vehicletype = from.vehicletype;
    to.origin = from.origin;
    to.angles = from.angles;
    to.originalorigin = from.originalorigin;
    to.originalangles = from.originalangles;
    to.owner = from.owner;
    to.initialvelocity = from.initialvelocity;
    to.spawntype = from.spawntype;
    to.team = from.team;
    to.script_team = from.script_team;
    to.ref = from.ref;
    to.script_noteworthy = from.script_noteworthy;
    to.script_modelname = from.script_modelname;
    to.script_vehicle_lights_on = from.script_vehicle_lights_on;
    to.script_disconnectpaths = from.script_disconnectpaths;
    to.script_badplace = from.script_badplace;
    to.script_startinghealth = from.script_startinghealth;
    to.script_godmode = from.script_godmode;
    to.spawnflags = from.spawnflags;
}

// Namespace vehicle_tracking
// Params 3
// Checksum 0x612e8ad, Offset: 0xbaf
// Size: 0xff
function register_instance( vehicle, owner, team )
{
    assert( isdefined( level.vehicle ), "<dev string:x108>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x14f>" );
    assert( isdefined( vehicle vehicle::get_ref() ), "<dev string:x1a0>" );
    deregister_instance( vehicle );
    entitynumber = vehicle getentitynumber();
    level.vehicle.instances[ vehicle vehicle::get_ref() ][ entitynumber ] = vehicle;
    level.vehicle.all[ entitynumber ] = vehicle;
    
    if ( vehicle vehicle::can_fly() )
    {
        level.vehicle.aircraft[ entitynumber ] = vehicle;
    }
    
    vehicle.vehicleowner = owner;
    vehicle.vehicleteam = team;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x37fe0077, Offset: 0xcb6
// Size: 0x14e
function deregister_instance( vehicle )
{
    assert( isdefined( vehicle vehicle::get_ref() ), "<dev string:x1e9>" );
    
    if ( !isdefined( level.vehicle ) )
    {
        return;
    }
    
    if ( !( isdefined( level.vehicle.instances ) && isdefined( level.vehicle.all ) ) )
    {
        return;
    }
    
    if ( !isdefined( level.vehicle.instances[ vehicle vehicle::get_ref() ] ) )
    {
        return;
    }
    
    entitynumber = vehicle getentitynumber();
    level.vehicle.instances[ vehicle vehicle::get_ref() ][ entitynumber ] = undefined;
    level.vehicle.all[ entitynumber ] = undefined;
    
    if ( isdefined( level.vehicle.aircraft[ entitynumber ] ) )
    {
        level.vehicle.aircraft[ entitynumber ] = undefined;
    }
    
    if ( level.vehicle.instances[ vehicle vehicle::get_ref() ].size <= 0 )
    {
        level.vehicle.instances[ vehicle vehicle::get_ref() ] = undefined;
    }
    
    vehicle.vehicleowner = undefined;
    vehicle.vehicleteam = undefined;
}

// Namespace vehicle_tracking
// Params 3
// Checksum 0x9d71bff0, Offset: 0xe0c
// Size: 0x108
function function_2b4ad1f3a68a848f( vehicleref, limit, message )
{
    assert( isdefined( level.vehicle ), "<dev string:x234>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x27b>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    level.vehicle.instancelimits[ vehicleref ] = limit;
    level.vehicle.instancelimitmessages[ vehicleref ] = message;
}

// Namespace vehicle_tracking
// Params 3
// Checksum 0x22d05c64, Offset: 0xf1c
// Size: 0x125
function function_8d0cbf44f999d0f9( vehicleref, spawntype, limit )
{
    assert( isdefined( level.vehicle ), "<dev string:x234>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x27b>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.vehicle.spawntypeinstancelimits[ vehicleref ] ) )
    {
        level.vehicle.spawntypeinstancelimits[ vehicleref ] = [];
    }
    
    level.vehicle.spawntypeinstancelimits[ vehicleref ][ spawntype ] = limit;
}

// Namespace vehicle_tracking
// Params 3
// Checksum 0x88874f63, Offset: 0x1049
// Size: 0x108
function function_29d71103ac6897ea( vehicleref, limit, message )
{
    assert( isdefined( level.vehicle ), "<dev string:x2cb>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x313>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    level.vehicle.ownerinstancelimits[ vehicleref ] = limit;
    level.vehicle.ownerinstancelimitmessages[ vehicleref ] = message;
}

// Namespace vehicle_tracking
// Params 3
// Checksum 0x3eec1611, Offset: 0x1159
// Size: 0x108
function function_5e28a72fa076ebb8( vehicleref, limit, message )
{
    assert( isdefined( level.vehicle ), "<dev string:x364>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x3ab>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    level.vehicle.teaminstancelimits[ vehicleref ] = limit;
    level.vehicle.teaminstancelimitmessages[ vehicleref ] = message;
}

// Namespace vehicle_tracking
// Params 5
// Checksum 0x21b8147f, Offset: 0x1269
// Size: 0x360, Type: bool
function function_279695c41be653f( vehicleref, owner, team, spawntype, sendmessage )
{
    assert( isdefined( level.vehicle ), "<dev string:x3fb>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x43f>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.vehicle.instances[ vehicleref ] ) )
    {
        return false;
    }
    
    gamelimit = level.vehicle.instancelimits[ vehicleref ];
    
    if ( isdefined( gamelimit ) )
    {
        if ( level.vehicle.instances[ vehicleref ].size >= gamelimit )
        {
            return true;
        }
    }
    
    spawntypelimit = undefined;
    spawntypecount = undefined;
    
    if ( isdefined( level.vehicle.spawntypeinstancelimits[ vehicleref ] ) && isdefined( level.vehicle.spawntypeinstancelimits ) && isdefined( spawntype ) && isdefined( level.vehicle.spawntypeinstancelimits[ vehicleref ][ spawntype ] ) )
    {
        spawntypelimit = level.vehicle.spawntypeinstancelimits[ vehicleref ][ spawntype ];
        spawntypecount = 0;
    }
    
    ownerlimit = undefined;
    ownercount = undefined;
    
    if ( isdefined( owner ) )
    {
        ownerlimit = level.vehicle.ownerinstancelimits[ vehicleref ];
        ownercount = 0;
    }
    
    teamlimit = undefined;
    teamcount = undefined;
    
    if ( isdefined( team ) )
    {
        teamlimit = level.vehicle.teaminstancelimits[ vehicleref ];
        teamcount = 0;
    }
    
    if ( !isdefined( ownerlimit ) && !isdefined( teamlimit ) && !isdefined( spawntypelimit ) )
    {
        return false;
    }
    
    foreach ( instance in level.vehicle.instances[ vehicleref ] )
    {
        if ( isdefined( ownerlimit ) && instance.vehicleowner == owner )
        {
            ownercount++;
            
            if ( ownercount >= ownerlimit )
            {
                return true;
            }
        }
        
        if ( isdefined( teamlimit ) && instance.vehicleteam == team )
        {
            teamcount++;
            
            if ( teamcount >= teamlimit )
            {
                return true;
            }
        }
        
        if ( isdefined( spawntypelimit ) && isdefined( instance.spawndata ) && instance.spawndata.spawntype == spawntype )
        {
            spawntypecount++;
            
            if ( spawntypecount >= spawntypelimit )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x6ec90a72, Offset: 0x15d2
// Size: 0xf9
function function_ff2863e4171248be( vehicleref )
{
    assert( isdefined( level.vehicle ), "<dev string:x48c>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x4d1>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.vehicle.instances[ vehicleref ] ) )
    {
        return [];
    }
    
    return level.vehicle.instances[ vehicleref ];
}

// Namespace vehicle_tracking
// Params 2
// Checksum 0x87675ba2, Offset: 0x16d4
// Size: 0x18e
function function_d3fb044434efd77d( vehicleref, owner )
{
    assert( isdefined( level.vehicle ), "<dev string:x51f>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x565>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.vehicle.instances[ vehicleref ] ) )
    {
        return [];
    }
    
    instances = [];
    
    foreach ( instance in level.vehicle.instances[ vehicleref ] )
    {
        if ( instance.vehicleowner == owner )
        {
            instances[ instances.size ] = instance;
        }
    }
    
    return instances;
}

// Namespace vehicle_tracking
// Params 2
// Checksum 0x5901d649, Offset: 0x186b
// Size: 0x18e
function function_472a3f4cbac38a9( vehicleref, team )
{
    assert( isdefined( level.vehicle ), "<dev string:x5b4>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x5f9>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.vehicle.instances[ vehicleref ] ) )
    {
        return [];
    }
    
    instances = [];
    
    foreach ( instance in level.vehicle.instances[ vehicleref ] )
    {
        if ( instance.vehicleteam == team )
        {
            instances[ instances.size ] = instance;
        }
    }
    
    return instances;
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0x66301d3, Offset: 0x1a02
// Size: 0x2c
function function_5820a38c9873992e()
{
    assert( isdefined( level.vehicle ), "<dev string:x647>" );
    return level.vehicle.all;
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0xa6de6c4e, Offset: 0x1a37
// Size: 0x13b, Type: bool
function function_b77f352821482252( vehicleref )
{
    assert( isdefined( level.vehicle ), "<dev string:x692>" );
    assert( isdefined( level.vehicle.instances ), "<dev string:x6da>" );
    
    if ( isstring( vehicleref ) && vehicle::has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehicleref ).vehicle ) )
            {
                vehicleref = vehicle::get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehicleref ).bundlename ) )
        {
            vehicleref = vehicle::get_data( vehicleref ).bundlename;
        }
    }
    
    if ( isdefined( level.vehicle.instancelimits[ vehicleref ] ) )
    {
        return true;
    }
    
    if ( isdefined( level.vehicle.ownerinstancelimits[ vehicleref ] ) )
    {
        return true;
    }
    
    if ( isdefined( level.vehicle.teaminstancelimits[ vehicleref ] ) )
    {
        return true;
    }
    
    if ( isdefined( level.vehicle.spawntypeinstancelimits[ vehicleref ] ) )
    {
        return true;
    }
    
    return false;
}

// Namespace vehicle_tracking
// Params 0
// Checksum 0xbcd74c55, Offset: 0x1b7b
// Size: 0x131
function init()
{
    assert( isdefined( level.vehicle ), "<dev string:x72b>" );
    assert( !isdefined( level.vehicle.instances ), "<dev string:x764>" );
    level.vehicle.instances = [];
    level.vehicle.all = [];
    level.vehicle.aircraft = [];
    level.vehicle.instancelimits = [];
    level.vehicle.ownerinstancelimits = [];
    level.vehicle.teaminstancelimits = [];
    level.vehicle.spawntypeinstancelimits = [];
    level.vehicle.instancelimitmessages = [];
    level.vehicle.ownerinstancelimitmessages = [];
    level.vehicle.teaminstancelimitmessages = [];
    level.vehiclecount = 0;
    level.maxvehiclecount = getdvarint( @"scr_maxvehiclecount", function_5426ab0abe3e55b5() );
}

// Namespace vehicle_tracking
// Params 1
// Checksum 0x61b55225, Offset: 0x1cb4
// Size: 0x41, Type: bool
function function_a50a15927bf945c1( spawndata )
{
    if ( !isdefined( spawndata ) )
    {
        thread utility::error( "spawnData must be defined." );
        return false;
    }
    
    if ( !isdefined( spawndata.origin ) )
    {
        thread utility::error( "spawnData.origin must be defined." );
        return false;
    }
    
    return true;
}

/#

    // Namespace vehicle_tracking
    // Params 1
    // Checksum 0x4ff6e84a, Offset: 0x1cfe
    // Size: 0x7e, Type: dev
    function function_e0a8c3f4eeb707e( spawndata )
    {
        if ( !function_a50a15927bf945c1( spawndata ) )
        {
            return 0;
        }
        
        if ( !isdefined( spawndata.vehicletype ) )
        {
            thread utility::error( "<dev string:x79b>" );
            return 0;
        }
        
        if ( !isdefined( spawndata.targetname ) && !isdefined( spawndata.script_vehicleref ) && !isdefined( spawndata.script_vehiclebundle ) )
        {
            thread utility::error( "<dev string:x7c5>" );
            return 0;
        }
        
        return 1;
    }

    // Namespace vehicle_tracking
    // Params 1
    // Checksum 0x77227d38, Offset: 0x1d84
    // Size: 0x7a, Type: dev
    function function_6b6a0c78a4707c87( spawndata )
    {
        if ( !function_a50a15927bf945c1( spawndata ) )
        {
            return 0;
        }
        
        if ( !isdefined( spawndata.owner ) )
        {
            thread utility::error( "<dev string:x80d>" );
            return 0;
        }
        
        if ( !isdefined( spawndata.vehicletype ) )
        {
            thread utility::error( "<dev string:x79b>" );
            return 0;
        }
        
        if ( !isdefined( spawndata.modelname ) )
        {
            thread utility::error( "<dev string:x831>" );
            return 0;
        }
        
        return 1;
    }

#/
