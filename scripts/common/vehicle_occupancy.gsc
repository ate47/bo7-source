#using script_4880fce3c83f33ef;
#using scripts\common\battle_tracks;
#using scripts\common\callbacks;
#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_ai;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_collision;
#using scripts\common\vehicle_compass;
#using scripts\common\vehicle_damage;
#using scripts\common\vehicle_dlog;
#using scripts\common\vehicle_interact;
#using scripts\common\vehicle_omnvar_utility;
#using scripts\common\vehicle_spawn;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace vehicle_occupancy;

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x6b10f4aa, Offset: 0xebd
// Size: 0x19a
function get_data( vehiclename, create )
{
    if ( create && ( !vehicle::has_data( vehiclename ) || !isdefined( vehicle::get_data( vehiclename ).occupancy ) ) )
    {
        data = undefined;
        
        if ( !vehicle::has_data( vehiclename ) )
        {
            data = spawnstruct();
        }
        else
        {
            data = vehicle::get_data( vehiclename );
        }
        
        data.occupancy = spawnstruct();
        data.occupancy.seatdata = [];
        data.occupancy.restrictions = [];
        data.occupancy.damagemodifier = -1;
        data.occupancy.camera = "none";
        data.occupancy.threatbiasgroup = "Level_Vehicle";
        data.occupancy.exitextents = [];
        data.occupancy.exitoffsets = [];
        data.occupancy.exitdirections = [];
        data.occupancy.damagefeedbackgrouplight = "driver";
        data.occupancy.damagefeedbackgroupheavy = "all";
        vehicle::add_data( vehiclename, data );
    }
    
    if ( vehicle::has_data( vehiclename ) )
    {
        return vehicle::get_data( vehiclename ).occupancy;
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x2893973d, Offset: 0x105f
// Size: 0x46
function private get_out( player, vehicle, exitvehicle )
{
    if ( isdefined( player ) )
    {
        if ( player isvehicleactive() )
        {
            player leavevehicle( 0, exitvehicle );
        }
        
        assert( !player isvehicleactive() );
    }
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x7973b6d4, Offset: 0x10ad
// Size: 0xb5
function function_568cd324ac705619( vehiclename, seatid, create )
{
    if ( isstring( vehiclename ) && vehicle::has_data( vehiclename ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( vehicle::get_data( vehiclename ).vehicle ) )
            {
                vehiclename = vehicle::get_data( vehiclename ).vehicle;
            }
        }
        else if ( isdefined( vehicle::get_data( vehiclename ).bundlename ) )
        {
            vehiclename = vehicle::get_data( vehiclename ).bundlename;
        }
    }
    
    return get_data( vehiclename ).seatdata[ seatid ];
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x22359948, Offset: 0x116b
// Size: 0xb7
function register_instance( vehicle )
{
    vehicle.occupants = [];
    vehicle.occupantsreserving = [];
    vehicle.isempty = 1;
    
    /#
        leveldata = get_level_data();
        leveldata.debuginstances = function_5713d46873b29625( leveldata.debuginstances );
        leveldata.debuginstances[ leveldata.debuginstances.size ] = vehicle;
    #/
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"registerInstance" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"registerInstance" ) ]]( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xd3943311, Offset: 0x122a
// Size: 0x70
function deregister_instance( vehicle )
{
    vehicle.occupants = undefined;
    vehicle.occupantsreserving = undefined;
    vehicle.isempty = undefined;
    vehicle.preventspawninto = undefined;
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"deregisterInstance" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"deregisterInstance" ) ]]( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x4f16042c, Offset: 0x12a2
// Size: 0x18, Type: bool
function function_b20cd24c7d75deeb( vehicle )
{
    return isdefined( vehicle.occupants );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xcfb4d6e7, Offset: 0x12c3
// Size: 0x8f
function function_8a8e1601e7e6610( vehicle, var_bfba3b5977bff568 = 1 )
{
    assert( isdefined( vehicle vehicle::get_ref() ), "<dev string:x24>" );
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    assert( !var_bfba3b5977bff568 || isdefined( leveldataforvehicle ), "<dev string:x74>" );
    
    if ( isdefined( leveldataforvehicle ) && isdefined( leveldataforvehicle.seatdata ) )
    {
        return getarraykeys( leveldataforvehicle.seatdata );
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x21e9500, Offset: 0x135a
// Size: 0xab
function function_41d81defa67de264( vehicle )
{
    availableseatids = [];
    seatids = function_8a8e1601e7e6610( vehicle );
    
    foreach ( seatid in seatids )
    {
        if ( !function_42362fb16a07025e( vehicle, seatid ) )
        {
            continue;
        }
        
        availableseatids[ availableseatids.size ] = seatid;
    }
    
    return availableseatids;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x5f33bcfe, Offset: 0x140e
// Size: 0x178
function function_495d488c998ad412( vehicle )
{
    availableseatids = function_41d81defa67de264( vehicle );
    
    if ( !isdefined( availableseatids ) || availableseatids.size <= 0 )
    {
        return undefined;
    }
    else if ( availableseatids.size == 1 )
    {
        return availableseatids[ 0 ];
    }
    
    bestseat = availableseatids[ 0 ];
    bestpriority = -1;
    seatarray = vehicle_interact::get_data( vehicle vehicle::get_ref() ).var_30c65d47028f9ff4;
    assert( isdefined( seatarray ), "<dev string:xcf>" );
    
    foreach ( seatid in availableseatids )
    {
        leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
        spawnpriority = leveldataforseat.spawnpriority;
        seatorder = function_f02c63b99c9614c9( seatarray, seatid );
        
        if ( !isdefined( spawnpriority ) && isdefined( seatorder ) )
        {
            spawnpriority = seatarray.size - seatorder;
        }
        else if ( !isdefined( spawnpriority ) )
        {
            spawnpriority = 0;
        }
        else
        {
            spawnpriority = int( max( 0, spawnpriority ) );
        }
        
        if ( spawnpriority > bestpriority )
        {
            bestseat = seatid;
            bestpriority = spawnpriority;
        }
    }
    
    return bestseat;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xdc378fd9, Offset: 0x158f
// Size: 0xb7, Type: bool
function function_42362fb16a07025e( vehicle, seatid, player )
{
    assert( isdefined( vehicle.occupants ) && isdefined( vehicle.occupantsreserving ), "<dev string:xf6>" );
    occupant = vehicle.occupants[ seatid ];
    occupantreserving = vehicle.occupantsreserving[ seatid ];
    
    if ( !isdefined( occupant ) && !isdefined( occupantreserving ) )
    {
        occupant = vehicle_ai::function_a0de630828deae7e( vehicle, seatid );
        
        if ( !isdefined( occupant ) )
        {
            return true;
        }
    }
    
    if ( isdefined( player ) )
    {
        if ( occupant === player )
        {
            return true;
        }
        
        if ( occupantreserving === player )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x8320b3af, Offset: 0x164f
// Size: 0x27c, Type: bool
function function_e234097059878761( vehicle, seatid, player )
{
    contents = physics_createcontents( [ "physicscontents_vehicleclip", "physicscontents_playerclip" ] );
    ignorelist = [];
    
    foreach ( ent in vehicle getlinkedchildren( 1 ) )
    {
        if ( !isplayer( ent ) )
        {
            ignorelist[ ignorelist.size ] = ent;
        }
    }
    
    ignorelist[ ignorelist.size ] = vehicle;
    ignorelist[ ignorelist.size ] = player;
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( !isdefined( leveldataforseat.animtag ) )
    {
        return false;
    }
    
    tagpos = vehicle gettagorigin( leveldataforseat.animtag );
    tagdir = anglestoup( vehicle gettagangles( leveldataforseat.animtag ) );
    var_5ae62c844686fca3 = tagpos + tagdir * leveldataforseat.var_45486078f1fde9bc;
    var_ada3dd75eb3e9b36 = var_5ae62c844686fca3 + tagdir * leveldataforseat.var_b009ee59cc7f2d56;
    spherecastradius = leveldataforseat.var_2a812fb731a0e4cf;
    seatcast = physics_spherecast( var_5ae62c844686fca3, var_ada3dd75eb3e9b36, spherecastradius, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1 );
    
    if ( isdefined( seatcast ) && seatcast[ 1 ] )
    {
        /#
            if ( level.debugvehicleexit )
            {
                level thread function_94553a295e176da5( var_5ae62c844686fca3, var_ada3dd75eb3e9b36, spherecastradius, 60, ( 1, 0, 1 ) );
            }
        #/
        
        return true;
    }
    
    if ( isdefined( seatcast ) && ( seatcast[ 1 ] || isdefined( seatcast[ 0 ][ 0 ][ "position" ] ) ) )
    {
        /#
            if ( level.debugvehicleexit )
            {
                finalposition = seatcast[ 0 ][ 0 ][ "<dev string:x161>" ] ?? var_ada3dd75eb3e9b36;
                
                if ( isdefined( seatcast[ 0 ][ 0 ][ "<dev string:x173>" ] ) )
                {
                    level thread function_daa8eeffc9a97683( seatcast[ 0 ][ 0 ][ "<dev string:x173>" ], spherecastradius, 60, ( 1, 0, 0 ) );
                }
                
                level thread function_94553a295e176da5( var_5ae62c844686fca3, finalposition, spherecastradius, 60, ( 0, 1, 0 ) );
            }
        #/
        
        return true;
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x2bc170a1, Offset: 0x18d4
// Size: 0x6c
function function_604f6aa3a5ef5250( vehicle, seatid, var_bfba3b5977bff568 )
{
    if ( !isdefined( var_bfba3b5977bff568 ) )
    {
        var_bfba3b5977bff568 = 1;
    }
    
    assert( !var_bfba3b5977bff568 || isdefined( vehicle.occupants ), "<dev string:x17f>" );
    
    if ( isdefined( vehicle.occupants ) )
    {
        return vehicle.occupants[ seatid ];
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xacdba989, Offset: 0x1948
// Size: 0x4e
function function_6e6afd819ebbe705( vehicle, var_bfba3b5977bff568 = 1 )
{
    if ( !vehicle.occupants )
    {
        assert( !var_bfba3b5977bff568, "<dev string:x17f>" );
        return undefined;
    }
    
    return arraycopy( vehicle.occupants );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x69bffa91, Offset: 0x199f
// Size: 0x65
function function_8ed9bcd8e9ea74f5( vehicle, var_bfba3b5977bff568 )
{
    if ( !isdefined( var_bfba3b5977bff568 ) )
    {
        var_bfba3b5977bff568 = 1;
    }
    
    assert( !var_bfba3b5977bff568 || isdefined( vehicle.occupants ), "<dev string:x17f>" );
    return arraycombineunique( vehicle.occupants, vehicle.ridingplayers, vehicle.turretoccupants );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xb106e205, Offset: 0x1a0d
// Size: 0x6c
function function_b6077e40739ebc4b( vehicle, var_bfba3b5977bff568 )
{
    if ( !isdefined( var_bfba3b5977bff568 ) )
    {
        var_bfba3b5977bff568 = 1;
    }
    
    assert( !var_bfba3b5977bff568 || isdefined( vehicle.occupants ), "<dev string:x17f>" );
    
    if ( !isdefined( vehicle.occupants ) )
    {
        return undefined;
    }
    
    return arraycombineunique( vehicle.occupants, vehicle.occupantsreserving );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x5237cf84, Offset: 0x1a82
// Size: 0x5d
function get_reserving( vehicle, var_bfba3b5977bff568 )
{
    if ( !isdefined( var_bfba3b5977bff568 ) )
    {
        var_bfba3b5977bff568 = 1;
    }
    
    assert( !var_bfba3b5977bff568 || isdefined( vehicle.occupants ), "<dev string:x17f>" );
    
    if ( !isdefined( vehicle.occupants ) )
    {
        return undefined;
    }
    
    return vehicle.occupantsreserving;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x86bb7896, Offset: 0x1ae8
// Size: 0xb7
function function_338f50d73ebf6fe4( vehicle, player )
{
    assert( isdefined( vehicle.occupants ), "<dev string:x17f>" );
    
    foreach ( seatid, occupant in vehicle.occupants )
    {
        if ( isnumber( seatid ) )
        {
            continue;
        }
        
        if ( occupant == player )
        {
            return seatid;
        }
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xae70fdc3, Offset: 0x1ba8
// Size: 0xa4, Type: bool
function function_3080323254ba6900( player )
{
    if ( isdefined( player.vehicle.occupants ) )
    {
        seatid = function_338f50d73ebf6fe4( player.vehicle, player );
        leveldataforseat = function_568cd324ac705619( player.vehicle vehicle::get_ref(), seatid );
        
        if ( isdefined( leveldataforseat.animtag ) && ( leveldataforseat.animtag == "tag_seat_0" || leveldataforseat.animtag == "offset_seat_0" ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x32bcc9d6, Offset: 0x1c55
// Size: 0x3f
function get_driver( vehicle, var_e6c819f806ce2c86 )
{
    driverseatid = function_2b380f4a5c965003( vehicle, var_e6c819f806ce2c86 );
    
    if ( isdefined( driverseatid ) )
    {
        return function_604f6aa3a5ef5250( vehicle, driverseatid, !istrue( var_e6c819f806ce2c86 ) );
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xca435fc5, Offset: 0x1c9d
// Size: 0x1a
function function_2b380f4a5c965003( vehicle, var_e6c819f806ce2c86 )
{
    return "driver";
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xf2496908, Offset: 0x1cc0
// Size: 0x42, Type: bool
function function_d4f0603190ab379f( vehicle, seatid )
{
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    return leveldataforseat.ref == "driver";
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0xf178f942, Offset: 0x1d0b
// Size: 0x6f4
function enter( vehicle, seatid, player, data, immediate )
{
    assert( isdefined( vehicle vehicle::get_ref() ), "<dev string:x1ee>" );
    assert( isdefined( get_data( vehicle vehicle::get_ref() ) ), "<dev string:x240>" + vehicle.vehiclename + "<dev string:x261>" );
    assert( isdefined( vehicle.occupants ) && isdefined( vehicle.occupantsreserving ), "<dev string:x2a0>" );
    assert( !( isdefined( data ) && isdefined( data.success ) ), "<dev string:x303>" );
    var_3bcce941a1db4325 = 0;
    
    if ( isdefined( data ) && isdefined( data.useonspawn ) )
    {
        var_3bcce941a1db4325 = 1;
    }
    
    if ( !var_3bcce941a1db4325 && !player utility::callsharedfunc( #"player", #"playerisalive" ) )
    {
        return;
    }
    
    if ( player.inlaststand )
    {
        return;
    }
    
    if ( vehicle.isdestroyed )
    {
        return;
    }
    
    if ( !isdefined( vehicle ) || !isent( vehicle ) )
    {
        return;
    }
    
    foreach ( occupantreserving in vehicle.occupantsreserving )
    {
        if ( isdefined( occupantreserving ) && occupantreserving == player )
        {
            return;
        }
    }
    
    if ( !callback::response( 2, #"hash_8267c353428d4773", { #immediate:immediate, #data:data, #player:player, #seatid:seatid, #vehicle:vehicle } ) )
    {
        return;
    }
    
    oldseatid = function_338f50d73ebf6fe4( vehicle, player );
    
    if ( attempt_hijack( vehicle, seatid, player, data, immediate ) )
    {
        return;
    }
    
    function_89600d9f7c286c15( player );
    
    if ( !isdefined( data ) )
    {
        data = spawnstruct();
    }
    
    data.immediate = istrue( immediate );
    data.raceendnotify = "vehicle_race_last_call";
    data.raceendon = "vehicle_race_finished";
    
    if ( !data.immediate )
    {
        thread function_301751a8d62a4337( player, data );
        thread function_3451e846a34609d( vehicle, data );
        thread function_4f363a218b64862c( vehicle, player, seatid, oldseatid, data );
        thread race_complete( oldseatid, seatid, data );
    }
    
    if ( isdefined( oldseatid ) )
    {
        thread exit_start( vehicle, oldseatid, seatid, player, data );
    }
    
    if ( isdefined( seatid ) )
    {
        thread enter_start( vehicle, seatid, oldseatid, player, data );
    }
    
    update_occupancy( vehicle );
    
    if ( !data.immediate )
    {
        data waittill( data.raceendnotify );
        waittillframeend();
        data notify( data.raceendon );
    }
    
    if ( !vehicle_interact::function_b20cd24c7d75deeb( vehicle ) )
    {
        return;
    }
    
    success = race_results( vehicle, player, oldseatid, seatid, data );
    
    if ( isdefined( oldseatid ) )
    {
        thread exit_end( vehicle, oldseatid, seatid, player, data );
    }
    
    if ( isdefined( seatid ) )
    {
        thread enter_end( vehicle, seatid, oldseatid, player, data );
    }
    
    update_occupancy( vehicle );
    vehicle vehicle_interact::function_822281f2078b8127();
    
    if ( success )
    {
        if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"changedSeats" ) )
        {
            [[ utility::getsharedfunc( #"vehicle_occupancy", #"changedSeats" ) ]]( player, vehicle, oldseatid, seatid );
        }
        
        thread monitor_occupant( vehicle, player, seatid );
        player val::reset( "veh_occupancy_reload", "reload" );
        
        if ( isdefined( oldseatid ) )
        {
            isdriverseat = function_d4f0603190ab379f( vehicle, oldseatid );
            
            if ( isdriverseat )
            {
                if ( utility::issharedfuncdefined( #"challenges", #"stopchallengetimer" ) )
                {
                    player [[ utility::getsharedfunc( #"challenges", #"stopchallengetimer" ) ]]( "driving" );
                }
                
                vehicle thread vehicle_collision::function_9a12b1f4777c3cb3();
            }
        }
        
        if ( isdefined( seatid ) )
        {
            isdriverseat = function_d4f0603190ab379f( vehicle, seatid );
            
            if ( isdriverseat )
            {
                vehicle function_b901181db6fc2774();
                
                if ( isdefined( player.vehiclecustomization ) )
                {
                    vehicleref = vehicle vehicle::get_ref();
                    
                    if ( !isdefined( vehicle.mtx ) && !vehicle.var_1f4f9d64c04f05db )
                    {
                        mtx = vehicle::function_a634e7859d837381( player, vehicleref );
                        vehicle::set_mtx( vehicle, mtx );
                    }
                    
                    if ( isdefined( player.vehiclecustomization.horns[ vehicleref ] ) )
                    {
                        vehicle setvehiclehornsound( player.vehiclecustomization.horns[ vehicleref ] );
                    }
                    else if ( isdefined( vehicle.mtx ) && isdefined( vehicle.mtx.vehiclehorn ) )
                    {
                        vehicle setvehiclehornsound( vehicle.mtx.vehiclehorn );
                    }
                    else
                    {
                        vehicle setvehiclehornsound( "" );
                    }
                }
                
                if ( utility::issharedfuncdefined( #"challenges", #"startchallengetimer" ) )
                {
                    player [[ utility::getsharedfunc( #"challenges", #"startchallengetimer" ) ]]( "driving" );
                }
                
                vehicle setrotorsactive( 1 );
            }
        }
        
        if ( !isdefined( oldseatid ) )
        {
            entertype = "ENTERED_VEHICLE";
            
            if ( utility::issharedfuncdefined( #"challenges", #"reportVehicleEvent" ) )
            {
                player [[ utility::getsharedfunc( #"challenges", #"reportVehicleEvent" ) ]]( vehicle, "enter_vehicle" );
            }
        }
        else
        {
            entertype = "SEAT_SWITCH";
        }
        
        if ( level.var_a7bf93687486b5ba[ vehicle vehicle::get_ref() ].haswartracks )
        {
            battle_tracks::vehicle_occupancy_enter( vehicle, player, seatid, oldseatid );
        }
        
        vehicle_dlog::enter_event( vehicle, player, seatid, entertype );
        vehicle.can_hijack = undefined;
        return;
    }
    
    if ( isdefined( oldseatid ) && !data.vehicledeath )
    {
        if ( istrue( data.playerdeath ) || istrue( data.playerlaststand ) || data.playerdisconnect )
        {
            _data = spawnstruct();
            _data.playerdeath = data.playerdeath;
            _data.playerlaststand = data.playerlaststand;
            _data.playerliveragdoll = data.playerliveragdoll;
            _data.playerdisconnect = data.playerdisconnect;
            thread exit( vehicle, oldseatid, player, _data, 1 );
            return;
        }
        
        reenter( vehicle, oldseatid, seatid, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 6
// Checksum 0x4b3d9bdf, Offset: 0x2407
// Size: 0x35e
function exit( vehicle, seatid, player, data, immediate, specialexit )
{
    assert( isdefined( vehicle vehicle::get_ref() ), "<dev string:x351>" );
    assert( isdefined( get_data( vehicle vehicle::get_ref() ) ), "<dev string:x240>" + vehicle.vehiclename + "<dev string:x3a2>" );
    assert( isdefined( vehicle.occupants ) && isdefined( vehicle.occupantsreserving ), "<dev string:x3e0>" );
    
    if ( isdefined( data ) )
    {
        assert( !isdefined( data.success ), "<dev string:x442>" );
    }
    
    if ( isdefined( player ) && player function_2907aa812eda8a21() )
    {
        player notify( "interrupt_roof_exit" );
        return;
    }
    
    oldseatid = seatid;
    
    if ( isdefined( player ) )
    {
        if ( !isdefined( oldseatid ) )
        {
            oldseatid = function_338f50d73ebf6fe4( vehicle, player );
        }
        
        if ( !player utility::callsharedfunc( #"player", #"playerisalive" ) )
        {
            immediate = 1;
        }
        
        if ( player.inlaststand )
        {
            immediate = 1;
        }
        
        function_89600d9f7c286c15( player );
    }
    else
    {
        immediate = 1;
        function_448dc92adaa89078( vehicle, oldseatid );
    }
    
    if ( vehicle.isdestroyed )
    {
        immediate = 1;
    }
    
    assert( isdefined( oldseatid ), "<dev string:x48f>" );
    
    if ( !isdefined( data ) )
    {
        data = spawnstruct();
    }
    
    data.immediate = istrue( immediate );
    data.raceendnotify = "vehicle_race_last_call";
    data.raceendon = "vehicle_race_finished";
    
    if ( !data.immediate )
    {
        thread function_301751a8d62a4337( player, data );
        thread function_3451e846a34609d( vehicle, data );
        thread race_complete( oldseatid, undefined, data );
    }
    
    thread exit_start( vehicle, oldseatid, undefined, player, data, specialexit );
    
    if ( !data.immediate )
    {
        data waittill( data.raceendnotify );
        waittillframeend();
        data notify( data.raceendon );
    }
    
    success = race_results( vehicle, player, oldseatid, undefined, data );
    thread exit_end( vehicle, oldseatid, undefined, player, data, specialexit );
    update_occupancy( vehicle );
    vehicle vehicle_interact::function_822281f2078b8127();
    
    if ( istrue( vehicle.isheli ) && vehicle.isempty )
    {
        vehicle thread function_8f5c8ba353b9ffe1();
    }
    
    if ( success )
    {
        if ( isdefined( player ) )
        {
            player val::reset( "veh_occupancy_reload", "reload" );
            isdriverseat = function_d4f0603190ab379f( vehicle, oldseatid );
            
            if ( isdriverseat )
            {
                if ( utility::issharedfuncdefined( #"challenges", #"stopchallengetimer" ) )
                {
                    player [[ utility::getsharedfunc( #"challenges", #"stopchallengetimer" ) ]]( "driving" );
                }
                
                vehicle thread vehicle_collision::function_9a12b1f4777c3cb3();
            }
        }
        
        return;
    }
    
    if ( !istrue( data.playerdeath ) && !istrue( data.playerlaststand ) && !istrue( data.playerliveragdoll ) && !istrue( data.playerdisconnect ) && !data.vehicledeath )
    {
        reenter( vehicle, oldseatid, undefined, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x8d7d0b18, Offset: 0x276d
// Size: 0x150, Type: bool
function private attempt_hijack( vehicle, seatid, player, data, immediate )
{
    if ( getdvarint( @"hash_762d0b20f3d2c4d5", 0 ) != 1 || !vehicle.can_hijack || !function_d4f0603190ab379f( vehicle, seatid ) )
    {
        return false;
    }
    
    if ( !function_42362fb16a07025e( vehicle, seatid, player ) )
    {
        driver = get_driver( vehicle );
        
        if ( isagent( driver ) )
        {
            exit( vehicle, seatid, driver, data, 1 );
            broadcaststealthevent( player, "vehicle_hijack" );
            function_e48c10b042529521( player, "vehicle_hijack", player.origin, 200, 0 );
            function_e48c10b042529521( player, "vehicle_hijack", player.origin, 1000, 1 );
            vehicle notify( "stop_ai_lookahead" );
            vehicle notify( "stop_player_lookahead" );
        }
        else
        {
            return true;
        }
    }
    else
    {
        broadcaststealthevent( player, "vehicle_hijack" );
        function_e48c10b042529521( player, "vehicle_hijack", player.origin, 200, 0 );
        function_e48c10b042529521( player, "vehicle_hijack", player.origin, 1000, 1 );
        vehicle notify( "stop_ai_lookahead" );
        vehicle notify( "stop_player_lookahead" );
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x62a1fb70, Offset: 0x28c6
// Size: 0x6f
function function_8957ae4cd340941c( vehicle, player )
{
    if ( level.teambased )
    {
        return function_977daeae4e2f0e30( vehicle, player.team );
    }
    
    if ( vehicle.friendlystatusdirty )
    {
        vehicle function_6db77ed5a92ea72e( vehicle );
    }
    
    return isdefined( vehicle.playerfriendlyto ) && vehicle.playerfriendlyto == player;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x756291e0, Offset: 0x293d
// Size: 0x6f
function function_8266feb1ae1c46bd( vehicle, player )
{
    if ( level.teambased )
    {
        return function_fcf4c995a24246d1( vehicle, player.team );
    }
    
    if ( vehicle.friendlystatusdirty )
    {
        vehicle function_6db77ed5a92ea72e( vehicle );
    }
    
    return isdefined( vehicle.playerfriendlyto ) && vehicle.playerfriendlyto != player;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xcf039e6, Offset: 0x29b4
// Size: 0x5e
function function_91f3297b8e48b066( vehicle, player )
{
    if ( level.teambased )
    {
        return function_381efb9169661936( vehicle, player.team );
    }
    
    if ( vehicle.friendlystatusdirty )
    {
        vehicle function_6db77ed5a92ea72e( vehicle );
    }
    
    return !isdefined( vehicle.playerfriendlyto );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x9a92abcb, Offset: 0x2a1a
// Size: 0x3e
function function_e3f715e42f7b96c4( vehicle )
{
    if ( !level.teambased )
    {
        if ( vehicle.friendlystatusdirty )
        {
            vehicle function_6db77ed5a92ea72e( vehicle );
        }
        
        return vehicle.playerfriendlyto;
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x48e950a5, Offset: 0x2a61
// Size: 0x59
function function_977daeae4e2f0e30( vehicle, team )
{
    if ( level.teambased )
    {
        if ( vehicle.friendlystatusdirty )
        {
            vehicle function_6db77ed5a92ea72e( vehicle );
        }
        
        return ( isdefined( vehicle.teamfriendlyto ) && vehicle.teamfriendlyto === team );
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x2ea75c13, Offset: 0x2ac3
// Size: 0x59
function function_fcf4c995a24246d1( vehicle, team )
{
    if ( level.teambased )
    {
        if ( vehicle.friendlystatusdirty )
        {
            vehicle function_6db77ed5a92ea72e( vehicle );
        }
        
        return ( isdefined( vehicle.teamfriendlyto ) && vehicle.teamfriendlyto != team );
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x180b12ec, Offset: 0x2b25
// Size: 0x48
function function_381efb9169661936( vehicle, team )
{
    if ( level.teambased )
    {
        if ( vehicle.friendlystatusdirty )
        {
            vehicle function_6db77ed5a92ea72e( vehicle );
        }
        
        return !isdefined( vehicle.teamfriendlyto );
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x85226325, Offset: 0x2b76
// Size: 0x3d
function function_88fc32afbd317644( vehicle )
{
    if ( level.teambased )
    {
        if ( vehicle.friendlystatusdirty )
        {
            vehicle function_6db77ed5a92ea72e( vehicle );
        }
        
        return vehicle.teamfriendlyto;
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x25f5ce87, Offset: 0x2bbc
// Size: 0x23
function function_8b5abdda8e51a528( vehicle )
{
    vehicle.friendlystatusdirty = 1;
    vehicle_interact::set_dirty( vehicle );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xf4745f0d, Offset: 0x2be7
// Size: 0x2e2
function function_6db77ed5a92ea72e( vehicle )
{
    if ( level.teambased )
    {
        cleaned = 0;
        oldteamfriendlyto = vehicle.teamfriendlyto;
        
        if ( isdefined( vehicle.team ) && vehicle.team != "neutral" )
        {
            vehicle.teamfriendlyto = vehicle.team;
            vehicle.friendlystatusdirty = undefined;
            cleaned = 1;
        }
        
        if ( !cleaned )
        {
            foreach ( occupant in vehicle.occupants )
            {
                if ( isdefined( occupant ) )
                {
                    vehicle.teamfriendlyto = occupant.team;
                    vehicle.friendlystatusdirty = undefined;
                    cleaned = 1;
                    break;
                }
            }
        }
        
        if ( !cleaned )
        {
            vehicle.teamfriendlyto = undefined;
            vehicle.friendlystatusdirty = undefined;
        }
        
        if ( !isdefined( oldteamfriendlyto ) && !isdefined( vehicle.teamfriendlyto ) )
        {
            return 0;
        }
        
        if ( isdefined( oldteamfriendlyto ) && isdefined( vehicle.teamfriendlyto ) && oldteamfriendlyto == vehicle.teamfriendlyto )
        {
            return 0;
        }
        
        function_863cca296c26ac67( vehicle, oldteamfriendlyto, vehicle.teamfriendlyto );
        return 1;
    }
    
    cleaned = 0;
    oldplayerfriendlyto = vehicle.playerfriendlyto;
    
    if ( isdefined( vehicle.originalowner ) )
    {
        vehicle.playerfriendlyto = vehicle.originalowner;
        vehicle.friendlystatusdirty = undefined;
        cleaned = 1;
    }
    
    if ( !cleaned )
    {
        occupants = function_6e6afd819ebbe705( vehicle );
        
        foreach ( occupant in occupants )
        {
            if ( isdefined( occupant ) )
            {
                vehicle.playerfriendlyto = occupant;
                vehicle.friendlystatusdirty = undefined;
                return;
            }
        }
    }
    
    if ( !isdefined( oldplayerfriendlyto ) && !isdefined( vehicle.playerfriendlyto ) )
    {
        return 0;
    }
    
    if ( isdefined( oldplayerfriendlyto ) && isdefined( vehicle.playerfriendlyto ) && oldplayerfriendlyto == vehicle.playerfriendlyto )
    {
        return 0;
    }
    
    function_863cca296c26ac67( vehicle, oldplayerfriendlyto, vehicle.playerfriendlyto );
    return 1;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xed72b482, Offset: 0x2ed1
// Size: 0xe4
function function_863cca296c26ac67( vehicle, var_82e6ae7a41cd7ff8, var_e56f1d76e18cd597 )
{
    /#
        if ( level.teambased )
        {
            assert( !isdefined( var_82e6ae7a41cd7ff8 ) || isstring( var_82e6ae7a41cd7ff8 ), "<dev string:x4c6>" );
            assert( !isdefined( var_e56f1d76e18cd597 ) || isstring( var_e56f1d76e18cd597 ), "<dev string:x50e>" );
        }
        else
        {
            assert( !isdefined( var_82e6ae7a41cd7ff8 ) || isplayer( var_82e6ae7a41cd7ff8 ), "<dev string:x556>" );
            assert( !isdefined( var_e56f1d76e18cd597 ) || isplayer( var_e56f1d76e18cd597 ), "<dev string:x59e>" );
        }
    #/
    
    vehicle_compass::function_863cca296c26ac67( vehicle, var_82e6ae7a41cd7ff8, var_e56f1d76e18cd597 );
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    
    if ( !isdefined( leveldataforvehicle.friendlystatuschangedcallback ) )
    {
        return;
    }
    
    thread [[ leveldataforvehicle.friendlystatuschangedcallback ]]( vehicle, var_82e6ae7a41cd7ff8, var_e56f1d76e18cd597 );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x3a4a5f5e, Offset: 0x2fbd
// Size: 0x46
function function_eeedcbb30e985d5c( vehicle, player )
{
    assert( !isdefined( vehicle.originalowner ), "<dev string:x5e6>" );
    vehicle.originalowner = player;
    update_owner( vehicle );
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0x5db70490, Offset: 0x300b
// Size: 0xaf
function set_owner( vehicle, player, var_f7e4f61d9c42bc80, timeroverride )
{
    if ( !isdefined( vehicle.owners ) )
    {
        vehicle.owners = [];
    }
    else
    {
        clear_owner( vehicle, player );
        vehicle.owners = function_5713d46873b29625( vehicle.owners );
    }
    
    vehicle.owners[ vehicle.owners.size ] = player;
    
    if ( isdefined( timeroverride ) && timeroverride == -1 )
    {
    }
    else
    {
        thread watch_owner( vehicle, player, var_f7e4f61d9c42bc80, timeroverride );
    }
    
    update_owner( vehicle );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x827337cf, Offset: 0x30c2
// Size: 0x242
function update_owner( vehicle )
{
    vehicle notify( "vehicle_owner_update" );
    previousowner = vehicle.owner;
    previousownerteam = vehicle.ownerteam;
    bestowner = undefined;
    
    if ( isdefined( vehicle.owners ) )
    {
        for ( i = vehicle.owners.size - 1; i >= 0 ; i-- )
        {
            if ( function_643ca68f3bae7453( vehicle, vehicle.owners[ i ] ) )
            {
                bestowner = vehicle.owners[ i ];
                break;
            }
        }
    }
    
    if ( !isdefined( bestowner ) )
    {
        if ( function_643ca68f3bae7453( vehicle, vehicle.originalowner ) )
        {
            bestowner = vehicle.originalowner;
        }
    }
    
    vehicle.owner = bestowner;
    ownerchanged = 0;
    
    if ( isdefined( bestowner ) || isdefined( previousowner ) )
    {
        if ( !isdefined( bestowner ) && isdefined( previousowner ) )
        {
            ownerchanged = 1;
        }
        else if ( isdefined( bestowner ) && !isdefined( previousowner ) )
        {
            ownerchanged = 1;
        }
        else if ( bestowner != previousowner )
        {
            ownerchanged = 1;
        }
    }
    
    ownerteamchanged = 0;
    
    if ( isdefined( bestowner ) )
    {
        if ( !isdefined( previousownerteam ) || previousownerteam != bestowner.team )
        {
            ownerteamchanged = 1;
        }
        
        vehicle.ownerteam = bestowner.team;
        vehicle_compass::function_e527b9d6ae381350( vehicle, bestowner.team );
        thread function_6b0db91f75072859( vehicle, bestowner );
    }
    else
    {
        if ( ownerchanged )
        {
            ownerteamchanged = 1;
        }
        
        vehicle.ownerteam = undefined;
    }
    
    if ( ownerchanged )
    {
        if ( !level.teambased )
        {
            function_8b5abdda8e51a528( vehicle );
        }
        
        vehicle vehicle::function_4990747d597e6f1f();
    }
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"updateOwner" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"updateOwner" ) ]]( vehicle );
    }
    
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"updateOwner" ) )
    {
        [[ utility::getsharedfunc( vehicle vehicle::get_ref(), #"updateOwner" ) ]]( vehicle, bestowner, ownerchanged, ownerteamchanged );
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x156b7773, Offset: 0x330c
// Size: 0x7b
function clear_owner( vehicle, player )
{
    vehicle notify( "vehicle_clear_owner_" + player getentitynumber() );
    
    if ( isdefined( vehicle.owners ) )
    {
        vehicle.owners = arrayremove( vehicle.owners, player );
    }
    
    if ( isdefined( vehicle.owner ) && vehicle.owner == player )
    {
        update_owner( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x94f85232, Offset: 0x338f
// Size: 0xc7
function set_team( vehicle, team )
{
    teamchanged = !isdefined( vehicle.team ) || vehicle.team != team;
    vehicle.team = team;
    
    if ( vehicle.classname == "script_vehicle" )
    {
        vehicle_compass::function_e527b9d6ae381350( vehicle, team );
    }
    
    if ( teamchanged )
    {
        if ( level.teambased )
        {
            function_8b5abdda8e51a528( vehicle );
        }
    }
    
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"updateTeam" ) )
    {
        [[ utility::getsharedfunc( vehicle vehicle::get_ref(), #"updateTeam" ) ]]( vehicle, team, teamchanged );
    }
    
    update_owner( vehicle );
}

#using_animtree( "script_model" );

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x901c32fc, Offset: 0x345e
// Size: 0x1bf
function init()
{
    assert( isdefined( level.vehicle ), "<dev string:x643>" );
    assert( !isdefined( level.vehicle.occupancy ), "<dev string:x67d>" );
    leveldata = spawnstruct();
    level.vehicle.occupancy = leveldata;
    leveldata.var_a87413b9ffb22fc6 = getdvarint( @"hash_4bf0d02ff4ac62ed", 1 ) > 0;
    
    if ( leveldata.var_a87413b9ffb22fc6 )
    {
        leveldata.var_578122b40ca9849a = 0;
        leveldata.var_1a843af7d8cf4c6b = [];
    }
    
    init_debug();
    callback::callback( #"vehicle_occupancy_init", {} );
    level.var_9e85fa55dfcb5605 = getdvarint( @"hash_abd3bd3c25a13d43", 1 );
    level.var_e445b76f87f11639 = getdvarint( @"hash_2bf0e47506040359", 1 ) == 1;
    level.var_8b0a26b04bac3108 = getdvarfloat( @"hash_83928d2d50dc276c" ) + 50;
    level.var_51db840a745c6105 = getdvarfloat( @"hash_c9b7b0f34821b869" ) + 50;
    level.var_cb8ff8f046da9128 = getdvarfloat( @"hash_94db90babe43cdc4", 100 );
    level.vehiclelightsenabled = getdvarint( @"hash_a459bb531af563b7", 1 );
    
    if ( utility::callsharedfunc( #"game", #"isusingmatchrulesdata" ) )
    {
        leveldata.var_f706d2ddeaba4c7 = utility::callsharedfunc( #"game", #"getmatchrulesdata", "commonOption", "vehicleUnmannedKillProtectionTimeout" ) ?? 4;
    }
    
    if ( level.var_e445b76f87f11639 )
    {
        level.scr_animtree[ "player_exit_vehicle_to_roof" ] = #animtree;
    }
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0xbb782c86, Offset: 0x3625
// Size: 0x13b
function private enter_start( vehicle, seatid, oldseatid, player, data )
{
    data endon( data.raceendon );
    
    if ( player.insertingarmorplate )
    {
        player notify( "try_armor_cancel", "vehicle_enter" );
    }
    
    vehicle_damage::function_5ca0c600bb09b1d2( vehicle, player );
    vehicle.occupantsreserving[ seatid ] = player;
    player.vehiclereserved = vehicle;
    vehicle_interact::update_usability( vehicle );
    timestamp = undefined;
    
    if ( data.immediate )
    {
        timestamp = gettime();
    }
    
    if ( isdefined( data.enterstartwaitmsg ) )
    {
        player waittill( data.enterstartwaitmsg );
    }
    
    function_4793dd4d02d6e68c( vehicle, seatid, 1 );
    enterstartcallback = function_82efe2b416a05fc2( vehicle, seatid );
    
    if ( isdefined( enterstartcallback ) )
    {
        [[ enterstartcallback ]]( vehicle, seatid, oldseatid, player, data );
    }
    
    if ( !isdefined( data.enterstartcomplete ) )
    {
        data.enterstartcomplete = 1;
    }
    
    if ( data.immediate )
    {
        assert( timestamp == gettime(), "<dev string:x6b5>" );
    }
}

// Namespace vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0x5c4ac737, Offset: 0x3768
// Size: 0x10c
function private exit_start( vehicle, seatid, newseatid, player, data, specialexit )
{
    data endon( data.raceendon );
    timestamp = undefined;
    
    if ( data.immediate )
    {
        timestamp = gettime();
    }
    
    if ( isdefined( player ) )
    {
        if ( player isinvehicleleanout() )
        {
            player.var_1eccc1c617b1c217 = 1;
        }
        else
        {
            player.var_1eccc1c617b1c217 = undefined;
        }
    }
    
    exitstartcallback = function_5780eb2296e7b4b6( vehicle, seatid );
    
    if ( isdefined( exitstartcallback ) )
    {
        [[ exitstartcallback ]]( vehicle, seatid, newseatid, player, data, specialexit );
    }
    else
    {
        function_4c8c24999a19c5d1( vehicle, seatid, newseatid, player, data, specialexit );
    }
    
    if ( !isdefined( data.exitstartcomplete ) )
    {
        data.exitstartcomplete = 1;
    }
    
    if ( data.immediate )
    {
        assert( timestamp == gettime(), "<dev string:x706>" );
    }
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0xea44a849, Offset: 0x387c
// Size: 0x4c
function function_cd55d6fab4e1e132( vehicle, seatid, oldseatid, player, data )
{
    if ( data.success )
    {
        function_e291d8dcac970f8e( vehicle, seatid, oldseatid, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x41542ae2, Offset: 0x38d0
// Size: 0x3d
function private function_e291d8dcac970f8e( vehicle, seatid, oldseatid, player, data )
{
    vehicle_omnvar::function_e0aa0be8e3297e0d( vehicle, oldseatid, seatid, player );
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0x31bab379, Offset: 0x3915
// Size: 0x4c
function function_3a81035d298258ac( vehicle, seatid, newseatid, player, data )
{
    if ( data.success )
    {
        function_d7b87ab0b838d34c( vehicle, seatid, newseatid, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x7906ab8c, Offset: 0x3969
// Size: 0xe6
function private function_d7b87ab0b838d34c( vehicle, seatid, newseatid, player, data )
{
    if ( !data.playerdisconnect )
    {
        success = function_d198a4322db28cf4( vehicle, seatid, newseatid, player, data );
        
        if ( !success )
        {
            if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"handleSuicideFromVehicles" ) )
            {
                [[ utility::getsharedfunc( #"vehicle_occupancy", #"handleSuicideFromVehicles" ) ]]( player );
            }
            else if ( utility::issharedfuncdefined( #"player", #"suicide" ) )
            {
                player utility::callsharedfunc( #"player", #"suicide" );
            }
            else
            {
                player kill();
            }
        }
    }
    
    vehicle_omnvar::function_1f2d7e52383cc345( vehicle, seatid, newseatid, player );
}

// Namespace vehicle_occupancy
// Params 6
// Checksum 0x5fdf3964, Offset: 0x3a57
// Size: 0x138
function function_4c8c24999a19c5d1( vehicle, seatid, newseatid, player, data, specialexit )
{
    player endon( "disconnect" );
    data endon( data.raceendon );
    result = function_64bd1eb04cce1488( player, vehicle, seatid, newseatid, data, specialexit );
    
    if ( !result )
    {
        data.exitstartcomplete = 0;
        error_message( player, 2 );
        
        if ( !data.immediate )
        {
            waitframe();
            data notify( data.raceendnotify );
        }
        
        return;
    }
    
    if ( isdefined( data.specialexit ) && data.specialexit == "_to_roof" )
    {
        result = function_e58c1c5409a9713c( player, vehicle, seatid, data );
        
        if ( !result )
        {
            player val::reset_all( "vehicle_roof_exit" );
            player val::reset_all( "vehicle_occupant" );
            player val::reset_all( "vehicle_occupant_common" );
            vehicleref = vehicle vehicle::get_ref();
            vehicle_omnvar::clear_all( player, vehicleref );
            function_4c8c24999a19c5d1( vehicle, seatid, newseatid, player, data, undefined );
        }
    }
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x1caa67db, Offset: 0x3b97
// Size: 0x44b
function private enter_end( vehicle, seatid, oldseatid, player, data )
{
    if ( data.success )
    {
        vehicle.occupants[ seatid ] = player;
        vehicle.occupantsreserving[ seatid ] = undefined;
        player.vehicle = vehicle;
        player.vehiclereserved = undefined;
        
        if ( utility::issharedfuncdefined( #"player", #"disableclassswapallowed" ) )
        {
            self [[ utility::getsharedfunc( #"player", #"disableclassswapallowed" ) ]]();
        }
        
        function_79ec2dd10f9db026( vehicle, seatid, player, data );
        function_99517a81df462d56( player, vehicle, seatid );
        hide_occupant( vehicle, seatid, player, data );
        function_50ef45c679199e96( vehicle, seatid, oldseatid, player, data );
        function_24f5de0e1ca83fe4( vehicle, seatid, player, data );
        function_702b50a45a0bb141( vehicle, seatid, player, data );
        hide_helmet( vehicle, seatid, player, data );
        function_2f7211392db5a9ac( vehicle, player );
        
        if ( vehicle vehicle_damage::function_2b7271a5e9ac2ec6( seatid ) )
        {
            player thread vehicle_damage::function_8b54529d7c41c894( vehicle, seatid );
        }
        
        if ( !isdefined( oldseatid ) )
        {
            function_383a3536f3b70ef1( vehicle, seatid, player, data );
            vehicle vehicle_interact::function_ca5f55b11d5b4274();
            
            if ( isdefined( player.pers[ "telemetry" ] ) )
            {
                var_800f9664a7db6ed2 = player.pers[ "telemetry" ];
                isgroundvehicle = vehicle vehicle::function_145b99b7f993513b();
                
                if ( isdefined( var_800f9664a7db6ed2.ground_vehicle_used_count ) && isgroundvehicle )
                {
                    var_800f9664a7db6ed2.ground_vehicle_used_count++;
                }
                
                isairvehicle = vehicle vehicle::can_fly();
                
                if ( isdefined( var_800f9664a7db6ed2.air_vehicle_used_count ) && isairvehicle )
                {
                    var_800f9664a7db6ed2.air_vehicle_used_count++;
                }
            }
        }
        
        leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
        
        if ( isdefined( leveldataforseat.animtag ) && ( leveldataforseat.animtag == "tag_seat_0" || leveldataforseat.animtag == "offset_seat_0" ) )
        {
            set_owner( vehicle, player, 1 );
        }
        
        if ( !isdefined( oldseatid ) )
        {
            vehicle notify( "player_enter", player );
            player notify( "vehicle_enter", vehicle );
            thread function_e49d06ee6668a3ca( player, vehicle, leveldataforseat, 1 );
        }
        else
        {
            player notify( "vehicle_change_seat", vehicle );
            thread function_e49d06ee6668a3ca( player, vehicle, leveldataforseat, 0 );
        }
        
        wasdriver = function_d4f0603190ab379f( vehicle, seatid );
        
        if ( wasdriver && vehicle::get_data( vehicle vehicle::get_ref() ).isboat )
        {
            vehicle function_9d1cf0e18cb109d3();
        }
        
        if ( vehicle.isheli )
        {
            vehicle function_474d87fe62493d22();
        }
        
        if ( wasdriver && vehicle.var_3fee62740baee02f )
        {
            vehicle function_9afa8159255a47de();
        }
    }
    else
    {
        if ( isdefined( player ) )
        {
            player.vehiclereserved = undefined;
        }
        
        if ( !data.vehicledeath )
        {
            vehicle.occupantsreserving[ seatid ] = undefined;
        }
    }
    
    timestamp = gettime();
    
    if ( data.success )
    {
        player thread animate_player( vehicle, seatid, oldseatid );
        hide_weapon( vehicle, seatid, player, data );
        
        if ( vehicle is_locked() && vehicle vehicle_isphysveh() )
        {
            vehicle vehphys_parkingbrake( 1 );
        }
        
        if ( !isdefined( oldseatid ) )
        {
            params = { #vehicle:vehicle, #seatid:seatid, #player:player };
            player callback::callback( #"player_vehicle_enter", params );
        }
        else
        {
            params = { #vehicle:vehicle, #oldseatid:oldseatid, #seatid:seatid, #player:player };
            player callback::callback( #"hash_93c7735d3f9d290a", params );
        }
    }
    
    enterendcallback = function_b1f649239886599b( vehicle, seatid );
    
    if ( isdefined( enterendcallback ) )
    {
        [[ enterendcallback ]]( vehicle, seatid, oldseatid, player, data );
    }
    else
    {
        function_cd55d6fab4e1e132( vehicle, seatid, oldseatid, player, data );
    }
    
    assert( timestamp == gettime(), "<dev string:x756>" );
}

// Namespace vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0xfa84c42a, Offset: 0x3fea
// Size: 0x29c
function private exit_end( vehicle, seatid, newseatid, player, data, specialexit )
{
    if ( data.success )
    {
        vehicle.occupants[ seatid ] = undefined;
        
        if ( isdefined( player ) )
        {
            player notify( "vehicle_seat_exit" );
            
            if ( !isdefined( newseatid ) )
            {
                player.vehicle = undefined;
            }
            
            function_822f728fe96ed09( vehicle, seatid, player, data );
            function_99517a81df462d56( player, vehicle, newseatid );
            show_occupant( vehicle, seatid, player, data );
            show_weapon( vehicle, seatid, player, data );
            show_helmet( vehicle, seatid, player, data );
            function_ba3b1c53755cfe51( vehicle, newseatid, player, data );
            function_d817e42472ea2fc7( vehicle, seatid, player, data );
            function_91c2eed4926ac7c6( vehicle, seatid, player, data );
        }
        
        if ( !isdefined( newseatid ) )
        {
            function_76b0c3373e5be34f( vehicle, seatid, player, data );
        }
        
        if ( !vehicle vehicle_code::vehicle_is_stopped() && function_d4f0603190ab379f( vehicle, seatid ) )
        {
            if ( utility::issharedfuncdefined( #"br", #"challengeevaluator" ) )
            {
                paramstruct = { #exitdriver:1 };
                player thread [[ utility::getsharedfunc( #"br", #"challengeevaluator" ) ]]( "br_mastery_ghostRideWhip", paramstruct );
            }
        }
        
        if ( function_d4f0603190ab379f( vehicle, seatid ) && vehicle::get_data( vehicle vehicle::get_ref() ).isboat )
        {
            vehicle thread function_8881828632e5d04d();
        }
    }
    
    timestamp = gettime();
    exitendcallback = function_1dec8dc419914c27( vehicle, seatid );
    
    if ( isdefined( exitendcallback ) )
    {
        [[ exitendcallback ]]( vehicle, seatid, newseatid, player, data );
    }
    else
    {
        function_3a81035d298258ac( vehicle, seatid, newseatid, player, data );
    }
    
    if ( isdefined( player ) )
    {
        player usebuttondone();
        
        if ( !isdefined( newseatid ) )
        {
            if ( isdefined( player.vehoccupancy_lastseatbc ) )
            {
                player.vehoccupancy_lastseatbc = undefined;
            }
            
            if ( isdefined( player.vehoccupancy_lastbctime ) )
            {
                player.vehoccupancy_lastbctime = undefined;
            }
        }
        
        player.var_6bb95d5c412d3e98 = undefined;
    }
    
    if ( data.success && !isdefined( newseatid ) )
    {
        params = { #specialexit:specialexit, #vehicle:vehicle, #seatid:seatid, #player:player };
        player callback::callback( #"player_vehicle_exit", params );
    }
    
    assert( timestamp == gettime(), "<dev string:x791>" );
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0xcaa53a69, Offset: 0x428e
// Size: 0xd7
function private reenter( vehicle, reenterseatid, var_79c815a81d81533, player, data )
{
    thread monitor_occupant( vehicle, player, reenterseatid );
    timestamp = gettime();
    reentercallback = function_cdec1bdc4ddf3d32( vehicle, reenterseatid );
    
    if ( isdefined( reentercallback ) )
    {
        [[ reentercallback ]]( vehicle, reenterseatid, var_79c815a81d81533, player, data );
    }
    else
    {
        data.success = undefined;
        data.exitposition = undefined;
        data.exitangles = undefined;
        data.specialexit = undefined;
        data.exitdirection = undefined;
        data.exitoffset = undefined;
        thread enter( vehicle, reenterseatid, player, data, 1 );
    }
    
    assert( timestamp == gettime(), "<dev string:x7cb>" );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x39f81ecc, Offset: 0x436d
// Size: 0x4d
function get_level_data()
{
    assert( isdefined( level.vehicle ), "<dev string:x805>" );
    assert( isdefined( level.vehicle.occupancy ), "<dev string:x85a>" );
    return level.vehicle.occupancy;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x9b4b4ab1, Offset: 0x43c3
// Size: 0x12b
function private function_e49d06ee6668a3ca( player, vehicle, seatdata, var_4822120e6ef8e0c2 )
{
    if ( utility::issp() )
    {
        return;
    }
    
    assert( utility::issharedfuncdefined( #"game", #"trysaylocalsound" ) );
    soundevent = function_5049968b7024f750( vehicle, seatdata );
    
    if ( var_4822120e6ef8e0c2 )
    {
        player.vehoccupancy_lastseatbc = soundevent;
        player.vehoccupancy_lastbctime = gettime();
        thread utility::callsharedfunc( #"game", #"trysaylocalsound", player, soundevent, 1 );
        return;
    }
    
    if ( isdefined( player.vehoccupancy_lastseatbc ) && isdefined( player.vehoccupancy_lastbctime ) && player.vehoccupancy_lastseatbc != soundevent && utility::time_has_passed( player.vehoccupancy_lastbctime, 5 ) )
    {
        player.vehoccupancy_lastseatbc = soundevent;
        player.vehoccupancy_lastbctime = gettime();
        thread utility::callsharedfunc( #"game", #"trysaylocalsound", player, soundevent );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x23f748ea, Offset: 0x44f6
// Size: 0x79
function private function_5049968b7024f750( vehicle, seatdata )
{
    if ( seatdata.ref == "driver" )
    {
        if ( vehicle vehicle::ishelicopter() )
        {
            return #"ping_vehicle_pilot";
        }
        else
        {
            return #"ping_vehicle_driver";
        }
        
        return;
    }
    
    if ( seatdata.ref == "gunner" )
    {
        return #"ping_vehicle_gunner";
    }
    
    return #"ping_vehicle_rider";
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x9a524ceb, Offset: 0x4577
// Size: 0x31
function private function_448dc92adaa89078( vehicle, seatid )
{
    vehicle.occupants[ seatid ] = undefined;
    vehicle.occupantsreserving[ seatid ] = undefined;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xaa66af3, Offset: 0x45b0
// Size: 0x176
function private function_383a3536f3b70ef1( vehicle, newseatid, player, data )
{
    level notify( "enter_vehicle", vehicle, player );
    function_8b5abdda8e51a528( vehicle );
    function_a35cf989a96d5404( vehicle );
    vehicle vehicle_spawn::stop_watching_abandoned();
    player setstance( "stand" );
    player val::set_array( "vehicle_occupant_common", function_ac2b78fb4f00e87e(), 0 );
    thread function_3e0dcbfe3cd87c74( player, vehicle, newseatid );
    battle_tracks::function_383a3536f3b70ef1( vehicle, player );
    vehicle_interact::function_383a3536f3b70ef1( vehicle, player );
    namespace_258c393149f2e837::function_383a3536f3b70ef1( vehicle, player );
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"onentervehicle" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"onentervehicle" ) ]]( vehicle, newseatid, player, data );
    }
    
    params = { #data:data, #player:player, #newseatid:newseatid, #vehicle:vehicle };
    level callback::callback( "onEnterVehicle", params );
    
    /#
        if ( utility::issharedfuncdefined( #"game", #"gethostplayer" ) )
        {
            host = [[ utility::getsharedfunc( #"game", #"gethostplayer" ) ]]();
            
            if ( isdefined( host ) && player == host )
            {
                level.botvehicle = vehicle;
            }
        }
    #/
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x498c65d8, Offset: 0x472e
// Size: 0x1e3
function private function_76b0c3373e5be34f( vehicle, oldseatid, player, data )
{
    level notify( "exit_vehicle", vehicle, player );
    
    if ( !data.playerdisconnect )
    {
        player function_998629932390cbc4();
        player function_f2eda11ef5a74b2b();
        vehicle_interact::function_76b0c3373e5be34f( vehicle, player );
        
        if ( !data.playerdeath )
        {
            if ( istrue( data.playerlaststand ) || data.playerliveragdoll )
            {
                data.exittype = "DEATH";
            }
            else if ( !isdefined( data.exittype ) )
            {
                data.exittype = "VOLUNTARY";
            }
            
            thread vehicle_collision::function_e3bc60c772acd609( vehicle, player );
        }
        else
        {
            data.exittype = "DEATH";
        }
        
        thread function_128fefd1300bebc2( player, data.playerdeath, data.playerlaststand );
    }
    else
    {
        data.exittype = "DISCONNECT";
    }
    
    function_8b5abdda8e51a528( vehicle );
    function_a35cf989a96d5404( vehicle );
    vehicle thread vehicle_spawn::watch_abandoned();
    vehicle thread vehicle_spawn::function_dbc69ecc19a5dca3();
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"onexitvehicle" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"onexitvehicle" ) ]]( vehicle, oldseatid, player, data );
    }
    
    params = { #data:data, #player:player, #oldseatid:oldseatid, #vehicle:vehicle };
    level callback::callback( "onExitVehicle", params );
    player notify( "exit_vehicle" );
    vehicle_dlog::exit_event( vehicle, player, oldseatid, data );
    battle_tracks::function_76b0c3373e5be34f( vehicle, player, oldseatid );
    namespace_258c393149f2e837::function_76b0c3373e5be34f( vehicle, player );
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0xadeb2298, Offset: 0x4919
// Size: 0x95
function private function_a35cf989a96d5404( vehicle )
{
    if ( !vehicle getscriptablehaspart( "stability" ) )
    {
        return;
    }
    
    occupants = function_6e6afd819ebbe705( vehicle );
    var_9bf1a3d220aae6e5 = utility::mph_to_ips( abs( vehicle vehicle_getspeed() ) );
    
    if ( occupants.size > 0 )
    {
        vehicle utility::function_7c10ea82c1e305b8( "stability", "stable" );
        return;
    }
    
    if ( occupants.size == 0 && var_9bf1a3d220aae6e5 > vehicle.var_e08a216ed3c26f8b )
    {
        vehicle utility::function_7c10ea82c1e305b8( "stability", "unstable" );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x8f15b7f9, Offset: 0x49b6
// Size: 0x87
function update_occupancy( vehicle )
{
    if ( !function_b20cd24c7d75deeb( vehicle ) )
    {
        return;
    }
    
    availablevehicleseats = function_41d81defa67de264( vehicle );
    allvehicleseats = function_8a8e1601e7e6610( vehicle );
    vehicle.isempty = availablevehicleseats.size == allvehicleseats.size;
    vehicle.isfull = availablevehicleseats.size <= 0 ? 1 : undefined;
    vehicle_interact::set_dirty( vehicle );
    vehicle_interact::function_433c1ab359647233( vehicle );
    vehicle_interact::update_usability( vehicle );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x59f34743, Offset: 0x4a45
// Size: 0x47
function private function_82efe2b416a05fc2( vehicle, seatid )
{
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"enterStart" ) )
    {
        return utility::getsharedfunc( vehicle vehicle::get_ref(), #"enterStart" );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x8ef092da, Offset: 0x4a94
// Size: 0x47
function private function_b1f649239886599b( vehicle, seatid )
{
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"enterEnd" ) )
    {
        return utility::getsharedfunc( vehicle vehicle::get_ref(), #"enterEnd" );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xc60d9eeb, Offset: 0x4ae3
// Size: 0x47
function private function_5780eb2296e7b4b6( vehicle, seatid )
{
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"exitStart" ) )
    {
        return utility::getsharedfunc( vehicle vehicle::get_ref(), #"exitStart" );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xb810aa1a, Offset: 0x4b32
// Size: 0x47
function private function_1dec8dc419914c27( vehicle, seatid )
{
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"exitEnd" ) )
    {
        return utility::getsharedfunc( vehicle vehicle::get_ref(), #"exitEnd" );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x48703549, Offset: 0x4b81
// Size: 0x47
function private function_cdec1bdc4ddf3d32( vehicle, seatid )
{
    if ( utility::issharedfuncdefined( vehicle vehicle::get_ref(), #"reenter" ) )
    {
        return utility::getsharedfunc( vehicle vehicle::get_ref(), #"reenter" );
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x9dd01e77, Offset: 0x4bd0
// Size: 0xb1
function private function_79ec2dd10f9db026( vehicle, newseatid, player, data )
{
    if ( !function_8e768221dfa2f8a9( vehicle ) && !vehicle function_a64cc2eb8cc3ca3a() )
    {
        if ( newseatid == function_2b380f4a5c965003( vehicle ) )
        {
            function_8d05097930e273cf( vehicle, player, 0, newseatid );
        }
    }
    
    restrictions = function_3774683642a3268( vehicle, newseatid );
    player val::set_array( "vehicle_occupant", restrictions, 0 );
    
    if ( !player val::function_fa30759d39b632a9( "fire", "vehicle_occupant" ) )
    {
        player val::set_array( "vehicle_occupant", [ "fire" ], 1 );
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x3368ae0b, Offset: 0x4c89
// Size: 0x51
function private function_822f728fe96ed09( vehicle, oldseatid, player, data )
{
    if ( !data.playerdeath )
    {
        function_8d05097930e273cf( vehicle, player, 1, undefined );
        player val::reset_all( "vehicle_occupant" );
    }
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x8742d8c2, Offset: 0x4ce2
// Size: 0x31
function private function_c6b1f5dcf2712ab2()
{
    if ( !isdefined( level.var_efd968853344c68b ) )
    {
        level.var_efd968853344c68b = getdvarint( @"hash_4f6bb46a93a86d18", 1 );
    }
    
    return level.var_efd968853344c68b;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xd17bd084, Offset: 0x4d1c
// Size: 0x6f
function private hide_occupant( vehicle, newseatid, player, data )
{
    if ( function_b2d43c8350835934( vehicle, newseatid ) )
    {
        player.nocorpse = 1;
        
        if ( function_c6b1f5dcf2712ab2() )
        {
            player utility::callsharedfunc( #"player", #"playerhide" );
            return;
        }
        
        player playerhide();
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xf4b9bfe4, Offset: 0x4d93
// Size: 0x3c
function private hide_weapon( vehicle, oldseatid, player, data )
{
    if ( function_62a140633e1ef9a1( vehicle, oldseatid, player ) )
    {
        player vehicle_setstowedweaponvisibility( 0 );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xec360967, Offset: 0x4dd7
// Size: 0xb2
function private function_15bf152e11f41072( player, data )
{
    leveldata = get_level_data();
    
    if ( !leveldata.var_a87413b9ffb22fc6 )
    {
        return;
    }
    
    id = leveldata.var_578122b40ca9849a;
    leveldata.var_578122b40ca9849a++;
    player utility::callsharedfunc( #"player", #"playerhide" );
    leveldata.var_1a843af7d8cf4c6b[ id ] = player;
    
    if ( !isdefined( data.var_1a843af7d8cf4c6b ) )
    {
        data.var_1a843af7d8cf4c6b = [];
    }
    
    data.var_1a843af7d8cf4c6b[ id ] = player;
    return id;
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x21e5bb7, Offset: 0x4e92
// Size: 0xc7
function private function_8841dfac3cc31875( id, data, var_7b196ee02b72f962 )
{
    leveldata = get_level_data();
    
    if ( !leveldata.var_a87413b9ffb22fc6 )
    {
        return;
    }
    
    if ( var_7b196ee02b72f962 )
    {
        waitframe();
        waitframe();
    }
    
    if ( !leveldata.var_a87413b9ffb22fc6 )
    {
        return;
    }
    
    if ( !isdefined( leveldata.var_1a843af7d8cf4c6b[ id ] ) )
    {
        return;
    }
    
    player = leveldata.var_1a843af7d8cf4c6b[ id ];
    
    if ( isdefined( data ) && isdefined( data.var_1a843af7d8cf4c6b ) )
    {
        data.var_1a843af7d8cf4c6b[ id ] = undefined;
    }
    
    if ( isdefined( player ) )
    {
        player utility::callsharedfunc( #"player", #"playershow" );
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xff2fdd8, Offset: 0x4f61
// Size: 0x10b
function private function_d5622be2b7cbec44( data, var_7b196ee02b72f962 )
{
    leveldata = get_level_data();
    
    if ( !leveldata.var_a87413b9ffb22fc6 )
    {
        return;
    }
    
    if ( var_7b196ee02b72f962 )
    {
        waitframe();
        waitframe();
    }
    
    if ( !isdefined( data.var_1a843af7d8cf4c6b ) )
    {
        return;
    }
    
    foreach ( id, player in data.var_1a843af7d8cf4c6b )
    {
        if ( isdefined( leveldata.var_1a843af7d8cf4c6b[ id ] ) )
        {
            leveldata.var_1a843af7d8cf4c6b[ id ] = undefined;
            
            if ( isdefined( player ) )
            {
                player utility::callsharedfunc( #"player", #"playershow" );
            }
        }
    }
    
    data.var_1a843af7d8cf4c6b = undefined;
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x90f25ac9, Offset: 0x5074
// Size: 0xa9
function private function_99e5cd8ebed537cf()
{
    leveldata = get_level_data();
    
    if ( !leveldata.var_a87413b9ffb22fc6 )
    {
        return;
    }
    
    foreach ( id, player in leveldata.var_1a843af7d8cf4c6b )
    {
        if ( !isdefined( player ) )
        {
            leveldata.var_1a843af7d8cf4c6b[ id ] = undefined;
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x7a1353fa, Offset: 0x5125
// Size: 0x8a
function private show_occupant( vehicle, oldseatid, player, data )
{
    if ( !data.playerdeath )
    {
        if ( function_b2d43c8350835934( vehicle, oldseatid ) )
        {
            if ( !data.nocorpse )
            {
                player.nocorpse = undefined;
            }
            
            if ( function_c6b1f5dcf2712ab2() )
            {
                player utility::callsharedfunc( #"player", #"playershow" );
                return;
            }
            
            player playershow();
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x8794d599, Offset: 0x51b7
// Size: 0x4c
function private show_weapon( vehicle, oldseatid, player, data )
{
    if ( !data.playerdeath )
    {
        if ( function_62a140633e1ef9a1( vehicle, oldseatid, player ) )
        {
            player vehicle_setstowedweaponvisibility( 1 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x7f398ebc, Offset: 0x520b
// Size: 0x52
function private hide_helmet( vehicle, oldseatid, player, data )
{
    if ( function_38b442de2b872386( vehicle, oldseatid, player ) && player tagexists( "j_helmet_hide" ) )
    {
        player hidepart( "j_helmet_hide", undefined, 1 );
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xa1e70ab5, Offset: 0x5265
// Size: 0x52
function private show_helmet( vehicle, oldseatid, player, data )
{
    if ( function_38b442de2b872386( vehicle, oldseatid, player ) && player tagexists( "j_helmet_hide" ) )
    {
        player showpart( "j_helmet_hide", undefined, 1 );
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0xaf76e814, Offset: 0x52bf
// Size: 0x5c, Type: bool
function private function_38b442de2b872386( vehicle, seatid, player )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
    return istrue( leveldataforseat.hidehelmet );
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x729a93b3, Offset: 0x5324
// Size: 0x79
function private function_50ef45c679199e96( vehicle, seatid, oldseatid, player, data )
{
    camera = function_9cd7c58917a9d908( vehicle, seatid );
    
    if ( isdefined( camera ) && camera != "none" )
    {
        oldcamera = function_9cd7c58917a9d908( vehicle, oldseatid );
        
        if ( oldcamera != camera )
        {
            player cameraset( camera );
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xd5edd964, Offset: 0x53a5
// Size: 0x5e
function private function_ba3b1c53755cfe51( vehicle, newseatid, player, data )
{
    if ( isdefined( newseatid ) )
    {
        camera = function_9cd7c58917a9d908( vehicle, newseatid );
        
        if ( camera == "none" )
        {
            player cameradefault();
        }
        
        return;
    }
    
    player cameradefault();
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x14648ca3, Offset: 0x540b
// Size: 0x99
function private function_24f5de0e1ca83fe4( vehicle, newseatid, player, data )
{
    damagemodifier = function_cc13ecc8b4a9824e( vehicle, newseatid );
    
    if ( isdefined( damagemodifier ) && damagemodifier != -1 )
    {
        player utility::callsharedfunc( #"damage", #"adddamagemodifier", isxhashasset( vehicle vehicle::get_ref() ) ? hashcat( vehicle vehicle::get_ref(), newseatid ) : vehicle vehicle::get_ref() + newseatid, damagemodifier, 0, &function_daa30c6b6a3a6fd7 );
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x238cff00, Offset: 0x54ac
// Size: 0xa1
function private function_d817e42472ea2fc7( vehicle, oldseatid, player, data )
{
    if ( !data.playerdeath )
    {
        damagemodifier = function_cc13ecc8b4a9824e( vehicle, oldseatid );
        
        if ( isdefined( damagemodifier ) && damagemodifier != -1 )
        {
            player utility::callsharedfunc( #"damage", #"removedamagemodifier", isxhashasset( vehicle vehicle::get_ref() ) ? hashcat( vehicle vehicle::get_ref(), oldseatid ) : vehicle vehicle::get_ref() + oldseatid, 0 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xafcc86b2, Offset: 0x5555
// Size: 0xe1
function private function_3774683642a3268( vehicle, seatid )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
    restrictions = arraycopy( leveldataforseat.restrictions ?? leveldataforvehicle.restrictions );
    
    if ( leveldataforvehicle.canleanout )
    {
        if ( !vehicle vehicle_damage::function_e8fd01c9b2bad245( seatid ) )
        {
            restrictions[ restrictions.size ] = "vehicle_lean_out";
        }
        
        if ( !leveldataforseat.allowmelee )
        {
            restrictions = arraycombineunique( restrictions, [ "melee" ] );
        }
    }
    
    if ( vehicle function_e20754e93d144ee3() && function_e27ae9e6770588e8( vehicle vehicle::get_ref(), seatid ) )
    {
        restrictions[ restrictions.size ] = "fire";
    }
    
    return restrictions;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x5c7410c6, Offset: 0x563f
// Size: 0x73
function function_b2d43c8350835934( vehicle, seatid )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
    
    if ( isdefined( leveldataforseat.hideoccupant ) )
    {
        return istrue( leveldataforseat.hideoccupant );
    }
    
    return istrue( leveldataforvehicle.hideoccupant );
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x203ac9fc, Offset: 0x56ba
// Size: 0x66, Type: bool
function private function_62a140633e1ef9a1( vehicle, seatid, player )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
    return player isvehicleactive() && istrue( leveldataforseat.hidestowedweapon );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xdc697ed2, Offset: 0x5729
// Size: 0xca
function private function_9cd7c58917a9d908( vehicle, seatid )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    
    if ( isdefined( seatid ) )
    {
        leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
        camera = leveldataforvehicle.camera;
        
        if ( isdefined( leveldataforseat.camera ) )
        {
            camera = leveldataforseat.camera;
        }
        
        if ( isdefined( leveldataforseat.animtag ) && ( leveldataforseat.animtag == "tag_seat_0" || leveldataforseat.animtag == "offset_seat_0" ) )
        {
            camera = "none";
        }
    }
    else
    {
        camera = "none";
    }
    
    return camera;
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xe838d0b8, Offset: 0x57fc
// Size: 0x60, Type: bool
function private function_cc13ecc8b4a9824e( vehicle, seatid )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    leveldataforseat = leveldataforvehicle.seatdata[ seatid ];
    return leveldataforseat.damagemodifier ?? leveldataforvehicle.damagemodifier;
}

// Namespace vehicle_occupancy
// Params 7, eflags: 0x4
// Checksum 0x63d50538, Offset: 0x5865
// Size: 0xae, Type: bool
function private function_daa30c6b6a3a6fd7( inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc )
{
    if ( meansofdeath == "MOD_TRIGGER_HURT" )
    {
        return true;
    }
    
    if ( isdefined( objweapon ) && objweapon.basename == "bomb_site_mp" )
    {
        return true;
    }
    
    if ( utility::issharedfuncdefined( #"damage", #"isstuckdamage" ) && victim utility::callsharedfunc( #"damage", #"isstuckdamage", inflictor, meansofdeath ) )
    {
        return true;
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x7ec5f804, Offset: 0x591c
// Size: 0x118
function private function_2f7211392db5a9ac( vehicle, player )
{
    vehicleoobtriggers = vehicle.oobtriggers;
    playeroobtriggers = player.oobtriggers;
    
    if ( !isdefined( vehicleoobtriggers ) )
    {
        return;
    }
    
    foreach ( vehicletrigger in vehicleoobtriggers )
    {
        refreshoob = 1;
        
        if ( isdefined( playeroobtriggers ) && playeroobtriggers.size > 0 )
        {
            refreshoob = !arraycontains( playeroobtriggers, vehicletrigger );
        }
        
        if ( refreshoob )
        {
            if ( utility::issharedfuncdefined( #"game", #"onenteroobtrigger" ) )
            {
                [[ utility::getsharedfunc( #"game", #"onenteroobtrigger" ) ]]( vehicletrigger, player, 1 );
            }
            
            break;
        }
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x12937cf8, Offset: 0x5a3c
// Size: 0x63
function private monitor_occupant( vehicle, player, seatid )
{
    thread monitor_controls( vehicle, player, seatid );
    
    if ( !level.var_3a28db61277e7016 )
    {
        thread function_147f9645108810bd( vehicle, player, seatid, 1 );
        thread monitor_exit( vehicle, player, seatid );
    }
    
    thread function_d814dae8658d26d8( vehicle, player, seatid );
    thread function_3cb5e70d950d5fee( vehicle, player );
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x1a1745, Offset: 0x5aa7
// Size: 0x39
function private function_89600d9f7c286c15( player )
{
    player notify( "vehicle_occupancy_monitorControls" );
    player notify( "vehicle_occupancy_monitorSeatSwitch" );
    player notify( "vehicle_occupancy_monitorExit" );
    player notify( "vehicle_occupancy_monitorGameEnded" );
    player notify( "vehicle_occupancy_monitorLeanBlocked" );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x4d319c62, Offset: 0x5ae8
// Size: 0x95
function private function_3cb5e70d950d5fee( vehicle, player )
{
    player notify( "vehicle_occupancy_monitorLeanBlocked" );
    player endon( "vehicle_occupancy_monitorLeanBlocked" );
    player endon( "death_or_disconnect" );
    player endon( "last_stand_enter" );
    
    while ( true )
    {
        player utility::waittill_any( "vehicle_leanout_attempt_denied", "vehicle_leanout_forced_return" );
        
        if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
        {
            player [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( %"vehicles/lean_out_blocked" );
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x40490eb8, Offset: 0x5b85
// Size: 0x1cf
function private function_147f9645108810bd( vehicle, player, seatid, applydelay )
{
    if ( getdvarint( @"hash_13b2e4ab3d17e938", 0 ) != 0 )
    {
        return;
    }
    
    player endon( "death_or_disconnect" );
    player endon( "last_stand_enter" );
    vehicle endon( "death" );
    level endon( "game_ended" );
    player notify( "vehicle_occupancy_monitorSeatSwitch" );
    player endon( "vehicle_occupancy_monitorSeatSwitch" );
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    
    if ( leveldataforvehicle.seatdata.size <= 1 )
    {
        return;
    }
    
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( !isdefined( leveldataforseat.seatswitcharray ) || leveldataforseat.seatswitcharray.size <= 0 )
    {
        return;
    }
    
    if ( !isbot( player ) )
    {
        if ( applydelay )
        {
            wait 0.05;
        }
        
        while ( player vehswitchseatbuttonpressed() || player function_5f2f6ad7e7d5fb71() )
        {
            waitframe();
        }
        
        while ( !player vehswitchseatbuttonpressed() && !player function_5f2f6ad7e7d5fb71() || player.var_9b6d5e24d8eed7c4 )
        {
            waitframe();
        }
        
        if ( player function_5f2f6ad7e7d5fb71() )
        {
            switchseatid = function_7a83ea47b335b66a( vehicle, player, seatid );
        }
        else
        {
            switchseatid = function_79f80964bb18e6c6( vehicle, player, seatid );
        }
        
        seatblocked = 0;
        
        if ( getdvarint( @"hash_4f6e477f1f9079e0", 1 ) == 1 )
        {
            if ( isdefined( leveldataforseat.var_28eb861f8a5232d5 ) )
            {
                if ( function_e234097059878761( vehicle, switchseatid, player ) )
                {
                    seatblocked = 1;
                    switchseatid = undefined;
                }
            }
        }
        
        if ( isdefined( switchseatid ) )
        {
            thread enter( vehicle, switchseatid, player );
        }
        
        error_message( player, seatblocked ? 4 : 1 );
        thread function_147f9645108810bd( vehicle, player, seatid, 0 );
    }
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x80ca6e23, Offset: 0x5d5c
// Size: 0xdf
function function_79f80964bb18e6c6( vehicle, player, seatid )
{
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( !isdefined( leveldataforseat.seatswitcharray ) || leveldataforseat.seatswitcharray.size <= 0 )
    {
        return undefined;
    }
    
    foreach ( switchseatid in leveldataforseat.seatswitcharray )
    {
        if ( function_42362fb16a07025e( vehicle, switchseatid, player ) )
        {
            return switchseatid;
        }
    }
    
    return undefined;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x6cfdc88b, Offset: 0x5e44
// Size: 0xec
function function_7a83ea47b335b66a( vehicle, player, seatid )
{
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( !isdefined( leveldataforseat.seatswitcharray ) || leveldataforseat.seatswitcharray.size <= 0 )
    {
        return undefined;
    }
    
    prevseatid = undefined;
    
    foreach ( switchseatid in leveldataforseat.seatswitcharray )
    {
        if ( function_42362fb16a07025e( vehicle, switchseatid, player ) )
        {
            prevseatid = switchseatid;
        }
    }
    
    return prevseatid;
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0xe4f36928, Offset: 0x5f39
// Size: 0xf0
function private monitor_exit( vehicle, player, seatid )
{
    player notify( "vehicle_occupancy_monitorExit" );
    player endon( "vehicle_occupancy_monitorExit" );
    vehicle endon( "death" );
    level endon( "game_ended" );
    specialexit = function_c0b4c8f4cb2122d7( vehicle, player, seatid );
    data = spawnstruct();
    
    if ( isdefined( player ) )
    {
        if ( !player utility::callsharedfunc( #"player", #"playerisalive" ) )
        {
            data.playerdeath = 1;
        }
        
        if ( player.inlaststand )
        {
            data.playerlaststand = 1;
        }
        
        if ( player.liveragdoll )
        {
            data.playerliveragdoll = 1;
        }
    }
    else
    {
        data.playerdisconnect = 1;
    }
    
    thread exit( vehicle, seatid, player, data, undefined, specialexit );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xb3801e9a, Offset: 0x6031
// Size: 0x47
function function_694c2792588bc5dc( player )
{
    player endon( "death_or_disconnect" );
    player endon( "enter_live_ragdoll" );
    player endon( "vehicle_occupancy_monitorExit" );
    player waittill( "live_ragdoll_vehicle_occupant_unlink" );
    player.var_6bb95d5c412d3e98 = 1;
    player notify( "vehicle_occupant_unlink_processed" );
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x97bf8fb3, Offset: 0x6080
// Size: 0x4e5
function function_c0b4c8f4cb2122d7( vehicle, player, seatid )
{
    player endon( "death_or_disconnect" );
    player endon( "enter_live_ragdoll" );
    player endon( "vehicle_occupant_unlink_processed" );
    thread function_694c2792588bc5dc( player );
    endtime = gettime() + 50;
    buttonreleased = 0;
    data = get_data( vehicle vehicle::get_ref() );
    roofexittype = undefined;
    
    if ( isdefined( data ) )
    {
        roofexittype = data.roofexittype;
    }
    
    canstandup = istrue( level.var_e445b76f87f11639 ) && isdefined( roofexittype ) && roofexittype == "stand_up";
    var_2e2fa96c6b1300c2 = istrue( level.var_e445b76f87f11639 ) && isdefined( roofexittype ) && ( roofexittype == "stand_up" || player function_669a2f1799f2fa7b() );
    var_b50a7b057ec0e3ae = istrue( level.var_9e85fa55dfcb5605 );
    var_10cfb99222d2ee13 = utility::callsharedfunc( #"game", #"getmatchrulesdata", "commonOption", "vehicleDiveOutMinSpeed" ) ?? 10;
    player setclientomnvar( "ui_veh_exit_button_holdtime", 0 );
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    var_da8576f70fc157dd = istrue( leveldataforseat.var_da8576f70fc157dd );
    
    if ( var_da8576f70fc157dd )
    {
        endtime = gettime() + 300;
    }
    
    while ( true )
    {
        if ( !player usebuttonpressed() )
        {
            buttonreleased = 1;
        }
        
        if ( buttonreleased && gettime() >= endtime )
        {
            break;
        }
        
        waitframe();
    }
    
    updaterate = level.framedurationseconds;
    var_5190ffaf44fe09df = getdvarint( @"hash_9402582f8123db99", 250 ) / 1000;
    var_cc140c1f8e2ef223 = 0;
    var_323aded6861c3f09 = undefined;
    
    while ( true )
    {
        timeused = 0;
        usereloadconfig = player getcurrentusereloadconfig();
        var_2095e9afbe27fa21 = 0;
        player setclientomnvar( "ui_veh_exit_button_holdtime", 0 );
        requiresleanout = getdvarint( @"hash_3f21db7c43ceecb9", 1 );
        
        if ( !requiresleanout )
        {
            var_866dd2a10554f712 = min( getdvarfloat( @"hash_e240d0849c0c892" ), getdvarfloat( @"hash_f67753f018a1115b" ) );
            var_10cfb99222d2ee13 = min( var_10cfb99222d2ee13, var_866dd2a10554f712 );
        }
        
        while ( player usebuttonpressed() )
        {
            player val::set( "veh_occupancy_reload", "reload", 0 );
            player cancelreloading();
            var_2095e9afbe27fa21 = 1;
            timeused += updaterate;
            isgamepad = player usinggamepad();
            var_6897df6bb7a98f72 = player getuseholdkbmprofile();
            var_dc4fbbf513a64e3a = !isgamepad && !var_6897df6bb7a98f72;
            var_23fae11be72cc632 = !isgamepad && var_6897df6bb7a98f72;
            var_27aac7dcb199f412 = isgamepad && usereloadconfig == 0;
            var_b69d7072ddcca9ea = isgamepad && usereloadconfig > 0;
            var_e7fa5a2df8c7e0f9 = var_27aac7dcb199f412 || var_23fae11be72cc632;
            leanoutcheck = !requiresleanout || player isinvehicleleanout();
            
            if ( var_27aac7dcb199f412 || var_23fae11be72cc632 )
            {
                player setclientomnvar( "ui_veh_exit_button_holdtime", timeused / 0.3 );
            }
            
            if ( !player val::get( "vehicle_exit" ) )
            {
                wait updaterate;
                continue;
            }
            
            if ( var_e7fa5a2df8c7e0f9 && timeused > 0.3 || var_dc4fbbf513a64e3a || var_da8576f70fc157dd )
            {
                return ( var_b50a7b057ec0e3ae && leanoutcheck && vehicle vehicle_getspeed() > var_10cfb99222d2ee13 ? "_to_dive" : undefined );
            }
            else if ( var_b69d7072ddcca9ea && timeused >= var_5190ffaf44fe09df )
            {
                player val::reset( "veh_occupancy_reload", "reload" );
                player forcereloading();
            }
            
            wait updaterate;
        }
        
        if ( !player val::get( "vehicle_exit" ) )
        {
            waitframe();
            continue;
        }
        
        leanoutcheck = !requiresleanout || player isinvehicleleanout();
        
        if ( var_2095e9afbe27fa21 && player usinggamepad() && usereloadconfig > 0 && timeused < var_5190ffaf44fe09df )
        {
            return ( var_b50a7b057ec0e3ae && leanoutcheck && vehicle vehicle_getspeed() > var_10cfb99222d2ee13 ? "_to_dive" : undefined );
        }
        else if ( var_2095e9afbe27fa21 )
        {
            player val::reset( "veh_occupancy_reload", "reload" );
            player forcereloading();
        }
        
        if ( player function_cab040fe4549a850() )
        {
            return undefined;
        }
        
        if ( player function_ada679ad1827f270( roofexittype ) )
        {
            var_cc140c1f8e2ef223 |= player jumpbuttonpressed();
            
            if ( player jumpbuttonpressed() )
            {
                var_323aded6861c3f09 = gettime();
            }
            else if ( var_cc140c1f8e2ef223 && isdefined( var_323aded6861c3f09 ) && var_323aded6861c3f09 + 400 < gettime() )
            {
                var_cc140c1f8e2ef223 = 0;
            }
            
            if ( var_cc140c1f8e2ef223 && !player function_325682e4dddac927() && ( player function_669a2f1799f2fa7b() || canstandup ) )
            {
                return "_to_roof";
            }
        }
        
        waitframe();
    }
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x9d515f6, Offset: 0x656d
// Size: 0x32, Type: bool
function private function_ada679ad1827f270( roofexittype )
{
    return istrue( level.var_e445b76f87f11639 ) && isdefined( roofexittype ) && ( roofexittype == "stand_up" || self function_669a2f1799f2fa7b() );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xa38a18fd, Offset: 0x65a8
// Size: 0xc3
function private error_message( player, errorref )
{
    errorstr = undefined;
    
    switch ( errorref )
    {
        case 1:
            errorstr = %"vehicles/seat_switch_occupied";
            break;
        case 2:
            errorstr = %"vehicles/cannot_exit";
            break;
        case 4:
            errorstr = %"VEHICLES/SEAT_SWITCH_BLOCKED";
            break;
    }
    
    assert( isdefined( errorstr ), "<dev string:x8b9>" );
    
    if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
    {
        player [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( errorstr );
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x6b0794db, Offset: 0x6673
// Size: 0x60
function private function_d814dae8658d26d8( vehicle, player, seatid )
{
    player endon( "death_or_disconnect" );
    player endon( "last_stand_enter" );
    player notify( "vehicle_occupancy_monitorGameEnded" );
    player endon( "vehicle_occupancy_monitorGameEnded" );
    
    if ( seatid == function_2b380f4a5c965003( vehicle ) )
    {
        level waittill( "game_ended" );
        player allowmovement( 0 );
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0xde32170a, Offset: 0x66db
// Size: 0xc0
function private monitor_controls( vehicle, player, seatid )
{
    player endon( "death_or_disconnect" );
    player endon( "last_stand_enter" );
    vehicle endon( "death" );
    level endon( "game_ended" );
    player notify( "vehicle_occupancy_monitorControls" );
    player endon( "vehicle_occupancy_monitorControls" );
    
    if ( vehicle_omnvar::function_3a46307fb9c3a02( player ) )
    {
        return;
    }
    
    if ( true )
    {
        wait 1.5;
    }
    
    childthread function_62515deeb9d6335b( vehicle, player, seatid );
    childthread function_6b3a50cea153bb4e( vehicle, player, seatid );
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    
    if ( isdefined( leveldataforvehicle.monitorcontrolscallback ) )
    {
        childthread [[ leveldataforvehicle.monitorcontrolscallback ]]( vehicle, player, seatid, "vehicle_occupancy_monitorControls" );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x1d24615e, Offset: 0x67a3
// Size: 0x1e
function function_16f333f9d8797ee6( player )
{
    vehicle_omnvar::function_16f333f9d8797ee6( player );
    player notify( "vehicle_occupancy_monitorControls" );
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x3922e619, Offset: 0x67c9
// Size: 0x118
function private function_62515deeb9d6335b( vehicle, player, seatid )
{
    driverseatid = function_2b380f4a5c965003( vehicle );
    
    if ( seatid == driverseatid )
    {
        canfly = vehicle vehicle::can_fly();
        
        if ( canfly )
        {
            while ( true )
            {
                forward = vehicle vehicle_getinputvalue( 0 );
                turn = vehicle vehicle_getinputvalue( 2 );
                strafe = vehicle vehicle_getinputvalue( 1 );
                ascend = vehicle vehicle_getinputvalue( 3 );
                
                if ( abs( forward ) > 0 || abs( turn ) > 0 || abs( strafe ) > 0 || abs( ascend ) > 0 )
                {
                    function_16f333f9d8797ee6( player );
                }
                
                wait 0.05;
            }
            
            return;
        }
        
        while ( true )
        {
            gasinput = vehicle vehicle_getinputvalue( 4 );
            
            if ( abs( gasinput ) >= 0.2 )
            {
                function_16f333f9d8797ee6( player );
            }
            
            wait 0.05;
        }
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x711e69cf, Offset: 0x68e9
// Size: 0x88
function private function_6b3a50cea153bb4e( vehicle, player, seatid )
{
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( isdefined( leveldataforseat.turretobjweapon ) )
    {
        turret = vehicle::function_95e3c2e0c6eec800( vehicle, leveldataforseat.turretobjweapon );
        
        if ( isdefined( turret ) )
        {
            turret utility::waittill_any( "turret_fire", "turret_reload" );
            function_16f333f9d8797ee6( player );
        }
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x2d1c7e6b, Offset: 0x6979
// Size: 0xaa
function function_921d1edcf33652ee( vehicleref, seatid )
{
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
    
    return function_568cd324ac705619( vehicleref, seatid ).turretobjweapon;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xa329813d, Offset: 0x6a2c
// Size: 0xaa
function function_c1aff67bba66f89f( vehicleref, seatid )
{
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
    
    return function_568cd324ac705619( vehicleref, seatid ).turretweapon;
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xcff92dd, Offset: 0x6adf
// Size: 0xc8
function private function_301751a8d62a4337( player, data )
{
    data endon( data.raceendon );
    result = player utility::waittill_any_return_no_endon_death( "death", "disconnect", "enter_live_ragdoll", "last_stand_enter" );
    
    if ( result == "death" )
    {
        data.playerdeath = 1;
    }
    else if ( result == "disconnect" )
    {
        data.playerdisconnect = 1;
    }
    else if ( result == "enter_live_ragdoll" )
    {
        data.playerliveragdoll = 1;
    }
    else if ( result == "last_stand_enter" )
    {
        data.playerlaststand = 1;
    }
    
    data notify( data.raceendnotify );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x3c0ee9dd, Offset: 0x6baf
// Size: 0x4a
function private function_3451e846a34609d( vehicle, data )
{
    data endon( data.raceendon );
    vehicle waittill( "death" );
    data.vehicledeath = 1;
    data notify( data.raceendnotify );
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x3e543e78, Offset: 0x6c01
// Size: 0x77
function private function_4f363a218b64862c( vehicle, player, seatid, oldseatid, data )
{
    data endon( data.raceendon );
    
    while ( isdefined( vehicle ) )
    {
        if ( !function_42362fb16a07025e( vehicle, seatid, player ) )
        {
            data.seatunavailable = 1;
            data notify( data.raceendnotify );
            break;
        }
        
        waitframe();
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0xbbf70eca, Offset: 0x6c80
// Size: 0x9e
function private race_complete( oldseatid, newseatid, data )
{
    data endon( data.raceendon );
    
    if ( isdefined( oldseatid ) && isdefined( newseatid ) )
    {
        while ( !istrue( data.enterstartcomplete ) || !data.exitstartcomplete )
        {
            waitframe();
        }
    }
    else if ( isdefined( oldseatid ) )
    {
        while ( !data.exitstartcomplete )
        {
            waitframe();
        }
    }
    else
    {
        while ( !data.enterstartcomplete )
        {
            waitframe();
        }
    }
    
    data notify( data.raceendnotify );
}

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x91fae3d0, Offset: 0x6d26
// Size: 0x1e8
function private race_results( vehicle, player, oldseatid, newseatid, data )
{
    if ( !isdefined( data.success ) )
    {
        data.success = 1;
    }
    
    if ( data.immediate )
    {
        data.playerdisconnect = isdefined( player ) ? 0 : 1;
        
        if ( !data.playerdisconnect )
        {
            data.playerdeath = !player utility::callsharedfunc( #"player", #"playerisalive" );
            data.playerlaststand = istrue( player.inlaststand );
            data.playerliveragdoll = istrue( player.liveragdoll );
        }
        
        data.vehicledeath = istrue( vehicle.isdestroyed );
    }
    else if ( data.success )
    {
        if ( isdefined( oldseatid ) && !data.exitstartcomplete )
        {
            data.success = 0;
        }
        
        if ( isdefined( newseatid ) && !data.enterstartcomplete )
        {
            data.success = 0;
        }
        
        if ( data.vehicledeath )
        {
            data.success = 0;
        }
    }
    else
    {
        return 0;
    }
    
    if ( isdefined( newseatid ) )
    {
        if ( istrue( data.playerdeath ) || istrue( data.playerliveragdoll ) || istrue( data.playerlaststand ) || istrue( data.playerdisconnect ) || istrue( data.vehicledeath ) || data.seatunavailable )
        {
            data.success = 0;
        }
    }
    
    return data.success;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x5c93cdf6, Offset: 0x6f17
// Size: 0x77
function private watch_owner( vehicle, player, var_f7e4f61d9c42bc80, timeroverride )
{
    player endon( "disconnect" );
    vehicle endon( "death" );
    vehicle endon( "vehicle_clear_owner_" + player getentitynumber() );
    
    if ( var_f7e4f61d9c42bc80 )
    {
        player waittill( "vehicle_seat_exit" );
    }
    
    var_3d7e80fdea60f1c = timeroverride ?? 20;
    wait var_3d7e80fdea60f1c;
    thread clear_owner( vehicle, player );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x9a2e3f95, Offset: 0x6f96
// Size: 0x4c
function private function_6b0db91f75072859( vehicle, player )
{
    player endon( "disconnect" );
    vehicle endon( "death" );
    vehicle endon( "vehicle_owner_update" );
    player utility::waittill_any( "joined_team", "joined_spectators" );
    thread update_owner( vehicle );
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x9eebef15, Offset: 0x6fea
// Size: 0x92, Type: bool
function private function_643ca68f3bae7453( vehicle, player )
{
    if ( !isdefined( player ) )
    {
        return false;
    }
    
    if ( level.teambased && isdefined( vehicle.team ) )
    {
        if ( vehicle.team != "neutral" && player.team != vehicle.team )
        {
            return false;
        }
    }
    else if ( isdefined( vehicle.originalowner ) )
    {
        if ( player != vehicle.originalowner )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0xafd54fed, Offset: 0x7085
// Size: 0x153
function private animate_player( vehicle, seatid, oldseatid )
{
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( !isdefined( leveldataforseat.animtag ) )
    {
        return;
    }
    
    self cancelmantle();
    enterseatindex = 0;
    seattag = leveldataforseat.animtag;
    
    if ( issubstr( seattag, "tag_seat_" ) )
    {
        enterseatindex = int( getsubstr( seattag, 9 ) );
    }
    else if ( issubstr( seattag, "offset_seat_" ) )
    {
        enterseatindex = int( getsubstr( seattag, 12 ) );
    }
    else if ( issubstr( seattag, "tag_gunner" ) )
    {
        enterseatindex = int( getsubstr( seattag, 10 ) ) + 10 - 1;
    }
    else if ( issubstr( seattag, "gunner_" ) )
    {
        enterseatindex = int( getsubstr( seattag, 7 ) ) + 10 - 1;
    }
    
    isexitvehicle = !isdefined( seatid );
    get_out( self, vehicle, isexitvehicle );
    isentervehicle = !isdefined( oldseatid ) && isdefined( seatid );
    isroofentrance = self usevehicle( vehicle, enterseatindex, isentervehicle );
    
    if ( isroofentrance && vehicle vehicle_damage::function_2b7271a5e9ac2ec6( seatid ) )
    {
        vehicle vehicle_damage::function_c6b77e6af71ab7d6( seatid );
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x73cbe5ef, Offset: 0x71e0
// Size: 0x2c
function function_961dfeea38feb976()
{
    if ( self.isheli && self getscriptablehaspart( "Exhaust" ) )
    {
        self setscriptablepartstate( "Exhaust", "off" );
    }
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xd51919a0, Offset: 0x7214
// Size: 0xf3
function private function_8f5c8ba353b9ffe1()
{
    hasexhaust = self getscriptablehaspart( "Exhaust" );
    haslights = self getscriptablehaspart( "NaviLights" );
    
    if ( !hasexhaust && !haslights )
    {
        return;
    }
    
    self endon( "death" );
    self notify( "stopHeliEffectsAfterTime" );
    self endon( "stopHeliEffectsAfterTime" );
    self.var_339900b9756c9bd = "waitingToTurnOff";
    wait 6;
    
    while ( self.ishovering )
    {
        wait 2;
    }
    
    if ( !isdefined( self.var_339900b9756c9bd ) || self.var_339900b9756c9bd != "waitingToTurnOff" )
    {
        return;
    }
    
    self.var_339900b9756c9bd = undefined;
    
    if ( hasexhaust && self getscriptablepartstate( "Exhaust" ) == "on" )
    {
        self setscriptablepartstate( "Exhaust", "off" );
    }
    
    if ( haslights && self getscriptablepartstate( "NaviLights" ) == "on" )
    {
        self setscriptablepartstate( "NaviLights", "off" );
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x23fdd99d, Offset: 0x730f
// Size: 0x86
function function_474d87fe62493d22()
{
    if ( !isdefined( self.var_339900b9756c9bd ) )
    {
        if ( self getscriptablehaspart( "Exhaust" ) && vehicle_damage::get_state() == "pristine" && ( !isdefined( self.fuel ) || self.fuel > 0 ) )
        {
            self setscriptablepartstate( "Exhaust", "on" );
        }
        
        if ( self getscriptablehaspart( "NaviLights" ) )
        {
            self setscriptablepartstate( "NaviLights", "on" );
        }
    }
    
    self.var_339900b9756c9bd = "playing";
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x54f302b0, Offset: 0x739d
// Size: 0x30
function private function_8881828632e5d04d()
{
    self endon( "death" );
    self endon( "unanchored" );
    
    while ( self vehicle_getspeed() > 2 )
    {
        wait 0.2;
    }
    
    self function_c21d39b1929f7cb1( -1, 100 );
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xd0fc2366, Offset: 0x73d5
// Size: 0x11
function private function_9d1cf0e18cb109d3()
{
    self notify( "unanchored" );
    self function_c21d39b1929f7cb1( 0 );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xe81e82af, Offset: 0x73ee
// Size: 0x186
function function_92ebe8fd4c9a3c7e( bool )
{
    if ( bool )
    {
        assert( isdefined( self.firedisabled ) && self.firedisabled > 0, "<dev string:x8fc>" );
        self.firedisabled--;
        
        if ( self.firedisabled == 0 )
        {
            self.firedisabled = undefined;
            
            foreach ( occupant in function_f740a73aab507fd7() )
            {
                occupant val::set( "vehicle_occupant", "fire", 1 );
            }
        }
        
        return;
    }
    
    if ( !isdefined( self.firedisabled ) )
    {
        self.firedisabled = 0;
    }
    
    self.firedisabled++;
    
    if ( self.firedisabled == 1 )
    {
        foreach ( occupant in function_f740a73aab507fd7() )
        {
            occupant val::set( "vehicle_occupant", "fire", 0 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xc15a000a, Offset: 0x757c
// Size: 0x20, Type: bool
function function_e20754e93d144ee3()
{
    return isdefined( self ) && isdefined( self.firedisabled ) && self.firedisabled > 0;
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xf8ae2720, Offset: 0x75a5
// Size: 0xbd
function private function_f740a73aab507fd7()
{
    vehicleref = vehicle::get_ref();
    var_fcac3ef374b208ba = [];
    
    foreach ( seatid in function_8a8e1601e7e6610( self ) )
    {
        if ( function_e27ae9e6770588e8( vehicleref, seatid ) )
        {
            occupant = function_604f6aa3a5ef5250( self, seatid, 0 );
            
            if ( isplayer( occupant ) )
            {
                var_fcac3ef374b208ba[ var_fcac3ef374b208ba.size ] = occupant;
            }
        }
    }
    
    return var_fcac3ef374b208ba;
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0xd6ac1759, Offset: 0x766b
// Size: 0x3d, Type: bool
function private function_e27ae9e6770588e8( vehicleref, seatid )
{
    seatdata = function_568cd324ac705619( vehicleref, seatid );
    return isdefined( seatdata ) && istrue( seatdata.hasvehicleweapon );
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xfe42b77, Offset: 0x76b1
// Size: 0x16, Type: bool
function private function_a64cc2eb8cc3ca3a()
{
    return isdefined( self ) && self vehicle_isphysveh() && self vehphys_isgroundvehicle();
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0x2bc4f060, Offset: 0x76d0
// Size: 0x2e0
function allow_movement( vehicle, bool, showwarning = 1, var_77b1341a42d85c2f )
{
    if ( vehicle vehicle::is_static() )
    {
        return;
    }
    
    if ( bool )
    {
        assert( isdefined( vehicle.movementdisabled ) && vehicle.movementdisabled > 0, "<dev string:x8fc>" );
        vehicle.movementdisabled--;
        
        if ( vehicle.movementdisabled == 0 )
        {
            vehicle.movementdisabled = undefined;
            occupants = function_8ed9bcd8e9ea74f5( vehicle );
            
            if ( isdefined( occupants ) )
            {
                vehicle_omnvar::hide_warning( "movementDisabled", occupants, vehicle vehicle::get_ref() );
                
                if ( vehicle hascomponent( "p2p" ) )
                {
                    vehicle setconfigvalue( "p2p", "resume", 1 );
                }
                
                if ( vehicle hascomponent( "path" ) )
                {
                    vehicle setconfigvalue( "path", "resume", 1 );
                }
                
                if ( vehicle function_a64cc2eb8cc3ca3a() )
                {
                    vehicle function_92e333ef50ff2c83( 0 );
                }
                else
                {
                    foreach ( seatid, occupant in vehicle.occupants )
                    {
                        function_8d05097930e273cf( vehicle, occupant, 1, seatid );
                    }
                }
            }
            
            return 1;
        }
        
        return;
    }
    
    if ( !isdefined( vehicle.movementdisabled ) )
    {
        vehicle.movementdisabled = 0;
    }
    
    vehicle.movementdisabled++;
    
    if ( vehicle.movementdisabled == 1 )
    {
        occupants = function_8ed9bcd8e9ea74f5( vehicle );
        
        if ( isdefined( occupants ) )
        {
            if ( showwarning == 1 )
            {
                vehicle_omnvar::show_warning( "movementDisabled", occupants, vehicle vehicle::get_ref() );
            }
            
            if ( vehicle hascomponent( "p2p" ) && !var_77b1341a42d85c2f )
            {
                vehicle setconfigvalue( "p2p", "pause", 1 );
            }
            
            if ( vehicle hascomponent( "path" ) )
            {
                vehicle setconfigvalue( "path", "pause", 1 );
            }
            
            if ( vehicle function_a64cc2eb8cc3ca3a() )
            {
                vehicle function_92e333ef50ff2c83( 1 );
                vehicle.veh_throttle = 0;
            }
            else
            {
                foreach ( seatid, occupant in vehicle.occupants )
                {
                    function_8d05097930e273cf( vehicle, occupant, 0, seatid );
                }
            }
        }
        
        return 0;
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x396d7f4a, Offset: 0x79b8
// Size: 0x124
function function_8f9d5e17b693acd3( vehicle )
{
    if ( vehicle vehicle::is_static() )
    {
        return;
    }
    
    vehicle_omnvar::hide_warning( "movementDisabled", function_8ed9bcd8e9ea74f5( vehicle ), vehicle vehicle::get_ref() );
    
    if ( vehicle hascomponent( "p2p" ) )
    {
        vehicle setconfigvalue( "p2p", "resume", 1 );
    }
    
    if ( vehicle hascomponent( "path" ) )
    {
        vehicle setconfigvalue( "path", "resume", 1 );
    }
    
    if ( vehicle function_a64cc2eb8cc3ca3a() )
    {
        vehicle function_92e333ef50ff2c83( 0 );
    }
    else if ( isdefined( vehicle.occupants ) )
    {
        foreach ( seatid, occupant in vehicle.occupants )
        {
            function_8d05097930e273cf( 1, occupant, seatid );
        }
    }
    
    vehicle.movementdisabled = undefined;
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0x9a8bb097, Offset: 0x7ae4
// Size: 0x116
function function_8d05097930e273cf( vehicle, player, bool, seatid )
{
    if ( bool )
    {
        if ( player.vehicledisabledmovement )
        {
            if ( player utility::callsharedfunc( #"player", #"playerisalive" ) )
            {
                player val::reset_all( "vehicle_occupancy" );
            }
            
            player.vehicledisabledmovement = undefined;
        }
        
        return;
    }
    
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( isdefined( leveldataforseat.animtag ) && ( leveldataforseat.animtag == "tag_seat_0" || leveldataforseat.animtag == "offset_seat_0" ) )
    {
        if ( !player.vehicledisabledmovement )
        {
            if ( player utility::callsharedfunc( #"player", #"playerisalive" ) )
            {
                player val::set( "vehicle_occupancy", "allow_movement", 0 );
                player.vehicledisabledmovement = 1;
            }
        }
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x98726b2a, Offset: 0x7c02
// Size: 0x44
function function_6d028f1837a963d9( player, fromdeath )
{
    if ( !istrue( fromdeath ) && player.vehicledisabledmovement )
    {
        player val::reset_all( "vehicle_occupancy" );
    }
    
    player.vehicledisabledmovement = undefined;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x12ab1935, Offset: 0x7c4e
// Size: 0x2a, Type: bool
function function_8e768221dfa2f8a9( vehicle )
{
    return !isdefined( vehicle.movementdisabled ) || vehicle.movementdisabled <= 0;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x7e560849, Offset: 0x7c81
// Size: 0x55
function lock()
{
    allow_movement( self, 0, 0 );
    disable_engine();
    
    if ( self vehicle_isphysveh() )
    {
        self vehphys_parkingbrake( 1 );
    }
    
    self.islocked = 1;
    occupants = function_8ed9bcd8e9ea74f5( self );
    vehicle_omnvar::show_warning( "locked", occupants, vehicle::get_ref() );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x933d3292, Offset: 0x7cde
// Size: 0x5b
function unlock()
{
    allow_movement( self, 1, 0 );
    enable_engine();
    function_b901181db6fc2774();
    
    if ( self vehicle_isphysveh() )
    {
        self vehphys_parkingbrake( 0 );
    }
    
    self.islocked = undefined;
    occupants = function_8ed9bcd8e9ea74f5( self );
    vehicle_omnvar::hide_warning( "locked", occupants, vehicle::get_ref() );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x434287d8, Offset: 0x7d41
// Size: 0x12, Type: bool
function is_locked()
{
    return isdefined( self ) && istrue( self.islocked );
}

// Namespace vehicle_occupancy
// Params 7
// Checksum 0x90f03b4a, Offset: 0x7d5c
// Size: 0x2fa
function function_759b1ac7685fb992( vehicle, player, seatid, allowairexit, islaststand, specialexit, allowcrouchexits = 0 )
{
    exitboundinginfo = function_5bd5cec128647eac( vehicle );
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    
    if ( isdefined( specialexit ) )
    {
        exitid = seatid + specialexit;
        exitdirection = leveldataforvehicle.exitdirections[ exitid ];
        position = function_bba0fb218dac8c73( vehicle, player, exitid, exitboundinginfo, 1, allowcrouchexits );
        
        if ( isdefined( position ) )
        {
            angles = undefined;
            
            if ( !isdefined( leveldataforseat.animtag ) || leveldataforseat.animtag != "tag_seat_0" && leveldataforseat.animtag != "offset_seat_0" )
            {
                angles = function_30444f6fab2369f0( vehicle, player, exitid, islaststand );
            }
            
            if ( specialexit == "_to_roof" )
            {
                player notify( "roof_exit" );
            }
            
            position.angles = angles;
            position.specialexit = specialexit;
            position.direction = exitdirection;
            return position;
        }
    }
    
    skipexits = 0;
    
    /#
        skipexits = getdvarint( @"hash_7ae0d88acb509143", 0 );
    #/
    
    foreach ( exitstruct in leveldataforseat.exitids )
    {
        exitid = exitstruct.exitdirection;
        exitdirection = leveldataforvehicle.exitdirections[ exitid ];
        
        if ( exitdirection == "roof" || exitdirection == "dive" )
        {
            continue;
        }
        
        /#
            if ( skipexits > 0 )
            {
                skipexits -= 1;
                continue;
            }
        #/
        
        position = function_bba0fb218dac8c73( vehicle, player, exitid, exitboundinginfo, allowairexit, allowcrouchexits );
        
        if ( isdefined( position ) )
        {
            angles = undefined;
            
            if ( !isdefined( leveldataforseat.animtag ) || leveldataforseat.animtag != "tag_seat_0" && leveldataforseat.animtag != "offset_seat_0" )
            {
                angles = function_30444f6fab2369f0( vehicle, player, exitid, islaststand );
            }
            
            position.angles = angles;
            position.direction = exitdirection;
            return position;
        }
    }
    
    if ( getdvarint( @"hash_9c95c78d2efca328", 1 ) == 1 )
    {
        var_7237854e3be197ca = function_a0688628a927f50d( vehicle, player );
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
}

// Namespace vehicle_occupancy
// Params 6
// Checksum 0x9285e2e0, Offset: 0x805e
// Size: 0xe2a
function function_bba0fb218dac8c73( vehicle, player, exitid, exitinfo, allowairexit, allowcrouchexits = 0 )
{
    if ( !( isdefined( player ) && isdefined( vehicle ) && isdefined( exitid ) ) )
    {
        assertmsg( "<dev string:x964>" + isdefined( vehicle ) + "<dev string:x97e>" + isdefined( player ) + "<dev string:x998>" + isdefined( exitid ) );
        return;
    }
    
    data = get_data( vehicle vehicle::get_ref() );
    
    if ( !isdefined( data ) )
    {
        assertmsg( "<dev string:x9b2>" + isdefined( data ) + "<dev string:x9c9>" + vehicle.vehiclename );
        return;
    }
    
    if ( exitinfo.exitsfailed[ exitid ] )
    {
        return;
    }
    
    if ( isdefined( exitinfo.exitpositions[ exitid ] ) )
    {
        return exitinfo.exitpositions[ exitid ];
    }
    
    if ( !isdefined( data.exitoffsets[ exitid ] ) )
    {
        assertmsg( "<dev string:x9db>" + exitid + "<dev string:x9f1>" + vehicle.vehiclename );
        return;
    }
    
    if ( !isdefined( data.exitdirections[ exitid ] ) )
    {
        assertmsg( "<dev string:xa15>" + exitid + "<dev string:x9f1>" + vehicle.vehiclename );
        return;
    }
    
    exitoffset = data.exitoffsets[ exitid ];
    exitdirection = data.exitdirections[ exitid ];
    
    /#
        if ( getdvarint( @"hash_6d41518ba7b7fe27", 0 ) != 0 )
        {
            exitoffset = getdvarvector( @"hash_6d41518ba7b7fe27", exitoffset );
        }
    #/
    
    if ( exitdirection == "roof" && data.roofexittype == "animated" )
    {
        if ( getdvarint( @"hash_92092a101c9e6e0b", 0 ) == 1 )
        {
            exitposition = vehicle.origin + rotatevector( exitoffset, vehicle.angles );
            exit = { #iscrouchexit:0, #origin:exitposition };
            exitinfo.exitpositions[ exitid ] = exit;
            return exit;
        }
    }
    
    contents = physics_createcontents( [ "physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip" ] );
    ignorelist = [];
    
    foreach ( ent in vehicle getlinkedchildren( 1 ) )
    {
        if ( !isplayer( ent ) )
        {
            ignorelist[ ignorelist.size ] = ent;
        }
    }
    
    ignorelist[ ignorelist.size ] = vehicle;
    ignorelist[ ignorelist.size ] = player;
    
    if ( exitdirection == "inside" || exitdirection == "dive" || exitdirection == "roof" || exitdirection == "top" )
    {
        caststart = vehicle.origin + rotatevector( exitoffset, vehicle.angles );
        castend = caststart;
        castend = character_cast( player, caststart, castend, ignorelist, allowairexit, exitdirection );
        
        if ( !isdefined( castend ) )
        {
            exitinfo.exitsfailed[ exitid ] = 1;
            return;
        }
        
        exit = { #iscrouchexit:0, #origin:castend };
        exitinfo.exitpositions[ exitid ] = exit;
        return exit;
    }
    
    centertag = vehicle tagexists( "tag_body_animate" ) ? "tag_body_animate" : "tag_body";
    center = vehicle gettagorigin( centertag );
    
    if ( data.centeroffset )
    {
        center += rotatevector( ( data.centeroffset.x ?? 0, data.centeroffset.y ?? 0, data.centeroffset.z ?? 0 ), vehicle.angles );
    }
    
    isflipped = math::anglebetweenvectors( anglestoup( vehicle.angles ), ( 0, 0, 1 ) ) > 90;
    capsule = player getcollision( "stand" );
    playerradius = capsule.capsule_radius;
    standheight = capsule.capsule_halfheight + capsule.capsule_midpoint_height + capsule.capsule_radius;
    capsule = player getcollision( "crouch" );
    crouchheight = capsule.capsule_halfheight + capsule.capsule_midpoint_height + capsule.capsule_radius;
    tiltoffset = playerradius;
    downoffset = 0;
    castingdown = 0;
    
    switch ( exitdirection )
    {
        case #"hash_4b8799075d3a89b8":
            tiltangle = vehicle.angles[ 0 ];
            
            if ( tiltangle == 90 || tiltangle == 270 )
            {
                tilttan = 1;
            }
            else
            {
                tilttan = tan( tiltangle );
            }
            
            castingdown = tilttan > 0;
            
            if ( castingdown )
            {
                downoffset += abs( sin( tiltangle ) ) * ( data.exitextents[ "front" ] + playerradius );
                var_c5a5f0f0e5ffe1e2 = data.exitextents[ "front" ] + abs( tilttan ) * data.exitextents[ "top" ];
                tiltoffset += cos( tiltangle ) * var_c5a5f0f0e5ffe1e2;
                exitoffset = ( max( exitoffset[ 0 ], tiltoffset ), exitoffset[ 1 ], exitoffset[ 2 ] );
            }
            else
            {
                tiltoffset += min( abs( tilttan ), 1 ) * ( data.exitextents[ "bottom" ] + 10 );
                exitoffset = ( max( exitoffset[ 0 ], data.exitextents[ "front" ] + tiltoffset ), exitoffset[ 1 ], exitoffset[ 2 ] );
            }
            
            break;
        case #"hash_5163a22eb8c03302":
            tiltangle = vehicle.angles[ 0 ];
            
            if ( tiltangle == 90 || tiltangle == 270 )
            {
                tilttan = 1;
            }
            else
            {
                tilttan = tan( tiltangle );
            }
            
            castingdown = tilttan < 0;
            
            if ( castingdown )
            {
                downoffset += abs( sin( tiltangle ) ) * ( data.exitextents[ "back" ] + playerradius );
                var_c5a5f0f0e5ffe1e2 = data.exitextents[ "back" ] + abs( tilttan ) * data.exitextents[ "top" ];
                tiltoffset += cos( tiltangle ) * var_c5a5f0f0e5ffe1e2;
                exitoffset = ( min( exitoffset[ 0 ], -1 * tiltoffset ), exitoffset[ 1 ], exitoffset[ 2 ] );
            }
            else
            {
                tiltoffset += min( abs( tilttan ), 1 ) * ( data.exitextents[ "bottom" ] + 10 );
                exitoffset = ( min( exitoffset[ 0 ], -1 * ( data.exitextents[ "back" ] + tiltoffset ) ), exitoffset[ 1 ], exitoffset[ 2 ] );
            }
            
            break;
        case #"hash_c9b3133a17a3b2d0":
            tiltangle = vehicle.angles[ 2 ];
            
            if ( tiltangle == 90 || tiltangle == 270 )
            {
                tilttan = 1;
            }
            else
            {
                tilttan = tan( tiltangle );
            }
            
            castingdown = tilttan < 0;
            
            if ( castingdown )
            {
                downoffset += abs( sin( tiltangle ) ) * ( data.exitextents[ "left" ] + playerradius );
                var_c5a5f0f0e5ffe1e2 = data.exitextents[ "left" ] + abs( tilttan ) * data.exitextents[ "top" ];
                tiltoffset += cos( tiltangle ) * var_c5a5f0f0e5ffe1e2;
                exitoffset = ( exitoffset[ 0 ], max( exitoffset[ 1 ], tiltoffset ), exitoffset[ 2 ] );
            }
            else
            {
                tiltoffset += min( abs( tilttan ), 1 ) * ( data.exitextents[ "bottom" ] + 10 );
                exitoffset = ( exitoffset[ 0 ], max( exitoffset[ 1 ], data.exitextents[ "left" ] + tiltoffset ), exitoffset[ 2 ] );
            }
            
            break;
        case #"hash_96815ce4f2a3dbc5":
            tiltangle = vehicle.angles[ 2 ];
            
            if ( tiltangle == 90 || tiltangle == 270 )
            {
                tilttan = 1;
            }
            else
            {
                tilttan = tan( tiltangle );
            }
            
            castingdown = tilttan > 0;
            
            if ( castingdown )
            {
                downoffset += abs( sin( tiltangle ) ) * ( data.exitextents[ "right" ] + playerradius );
                var_c5a5f0f0e5ffe1e2 = data.exitextents[ "right" ] + abs( tilttan ) * data.exitextents[ "top" ];
                tiltoffset += cos( tiltangle ) * var_c5a5f0f0e5ffe1e2;
                exitoffset = ( exitoffset[ 0 ], min( exitoffset[ 1 ], -1 * tiltoffset ), exitoffset[ 2 ] );
            }
            else
            {
                tiltoffset += min( abs( tilttan ), 1 ) * ( data.exitextents[ "bottom" ] + 10 );
                exitoffset = ( exitoffset[ 0 ], min( exitoffset[ 1 ], -1 * ( data.exitextents[ "right" ] + tiltoffset ) ), exitoffset[ 2 ] );
            }
            
            break;
    }
    
    angles = castingdown ? ( 0, vehicle.angles[ 1 ], 0 ) : vehicle.angles;
    exitoffset = center + rotatevector( ( exitoffset[ 0 ], exitoffset[ 1 ], 10 ), angles );
    
    if ( isflipped )
    {
        exitoffset += ( 0, 0, 20 );
    }
    
    if ( !isdefined( exitinfo.spherecastradius ) )
    {
        exitinfo.spherecastradius = playerradius;
    }
    
    spherecastradius = exitinfo.spherecastradius;
    var_d85db35d6c3cf704 = physics_spherecast( center, exitoffset, spherecastradius, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1 );
    
    if ( isdefined( var_d85db35d6c3cf704 ) && var_d85db35d6c3cf704[ 1 ] )
    {
        if ( exitinfo.spherecastradius == playerradius )
        {
            exitinfo.spherecastradius = 10;
        }
        else
        {
            exitinfo.spherecastradius = 5;
        }
    }
    
    if ( isdefined( var_d85db35d6c3cf704 ) && ( var_d85db35d6c3cf704[ 1 ] || isdefined( var_d85db35d6c3cf704[ 0 ][ 0 ][ "position" ] ) ) )
    {
        /#
            if ( level.debugvehicleexit )
            {
                finalposition = var_d85db35d6c3cf704[ 0 ][ 0 ][ "<dev string:x161>" ] ?? exitoffset;
                
                if ( isdefined( var_d85db35d6c3cf704[ 0 ][ 0 ][ "<dev string:x173>" ] ) )
                {
                    level thread function_daa8eeffc9a97683( var_d85db35d6c3cf704[ 0 ][ 0 ][ "<dev string:x173>" ], 2, 60, ( 1, 0, 0 ) );
                }
                
                level thread function_94553a295e176da5( center, finalposition, spherecastradius, 60, ( 0, 1, 0 ) );
            }
        #/
        
        exitinfo.exitsfailed[ exitid ] = 1;
        return;
    }
    
    level thread function_94553a295e176da5( center, exitoffset, spherecastradius, 60, ( 0, 1, 0 ) );
    castupposition = exitoffset + ( 0, 0, 70 );
    castup = physics_spherecast( exitoffset, castupposition, playerradius, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1 );
    
    if ( isdefined( castup ) && castup.size > 0 )
    {
        if ( isdefined( castup[ 0 ][ 0 ][ "position" ] ) )
        {
            level thread function_daa8eeffc9a97683( castup[ 0 ][ 0 ][ "position" ], 2, 60, ( 1, 0, 0 ) );
        }
        
        if ( castup[ 1 ] )
        {
            level thread function_94553a295e176da5( exitoffset, castup[ 0 ][ 0 ][ "shape_position" ] ?? exitoffset, playerradius, 60, ( 1, 0, 0 ) );
            exitinfo.exitsfailed[ exitid ] = 1;
            return;
        }
        else
        {
            if ( isdefined( castup[ 0 ][ 0 ][ "shape_position" ] ) )
            {
                castupposition = castup[ 0 ][ 0 ][ "shape_position" ];
            }
            
            level thread function_94553a295e176da5( exitoffset, castupposition, playerradius, 60, ( 0, 1, 0 ) );
        }
    }
    
    castdownstart = castupposition - ( 0, 0, 1 );
    castdownend = castupposition - ( 0, 0, data.exitextents[ "bottom" ] + 125 + downoffset );
    castdown = physics_spherecast( castdownstart, castdownend, playerradius, contents, ignorelist, "physicsquery_closest", "physicsquery_any", 1 );
    castfailed = isdefined( castdown ) && castdown.size > 0 && castdown[ 1 ];
    castfailed |= castdown[ 0 ].size == 0 && !istrue( allowairexit );
    
    if ( isdefined( castdown ) && castdown.size > 0 )
    {
        if ( isdefined( castdown[ 0 ][ 0 ][ "position" ] ) )
        {
            level thread function_daa8eeffc9a97683( castdown[ 0 ][ 0 ][ "position" ], 2, 60, ( 0, 1, 0 ) );
        }
        
        if ( isdefined( castdown[ 0 ][ 0 ][ "shape_position" ] ) )
        {
            castdownend = castdown[ 0 ][ 0 ][ "shape_position" ];
        }
        
        if ( castdown[ 0 ].size == 0 )
        {
            if ( exitdirection != "top" && exitdirection != "roof" && exitdirection != "inside" )
            {
                castdownend += ( 0, 0, 40 );
            }
        }
    }
    
    totalheight = castdownstart[ 2 ] - castdownend[ 2 ] + playerradius * 2;
    castfailed |= totalheight < crouchheight;
    castfailed |= !allowcrouchexits && totalheight < standheight;
    level thread function_94553a295e176da5( castdownstart, castdownend, playerradius, 60, castfailed ? ( 1, 0, 0 ) : ( 0, 1, 1 ) );
    
    if ( castfailed )
    {
        exitinfo.exitsfailed[ exitid ] = 1;
        return;
    }
    
    exit = { #iscrouchexit:totalheight < standheight, #origin:castdownend };
    exitinfo.exitpositions[ exitid ] = exit;
    return exit;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xaaf776b7, Offset: 0x8e91
// Size: 0x397
function function_a0688628a927f50d( vehicle, player )
{
    if ( isnavmeshloaded() )
    {
        leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
        radiussize = 50;
        
        if ( leveldataforvehicle.exitextents )
        {
            foreach ( extent in leveldataforvehicle.exitextents )
            {
                radiussize = max( extent, radiussize );
            }
        }
        
        radiusincrease = radiussize;
        maxradius = radiusincrease * getdvarfloat( @"hash_ac8df14c02e380bd", 5 );
        var_594ff49a1d5c73f2 = 0;
        radiusincrease = getdvarfloat( @"hash_5264fcbe32bf9d29", radiusincrease );
        
        while ( radiussize <= maxradius )
        {
            exitpoint = function_d115ed3f24729c7( player, vehicle, radiussize, var_594ff49a1d5c73f2 );
            
            if ( isdefined( exitpoint ) )
            {
                radiussize = maxradius + 1;
                println( "<dev string:xa2e>" );
                return { #iscrouchexit:0, #direction:"nav_points", #origin:exitpoint };
            }
            
            if ( !var_594ff49a1d5c73f2 && radiussize + radiusincrease >= maxradius )
            {
                var_594ff49a1d5c73f2 = 1;
                radiussize = 50;
                continue;
            }
            
            radiussize += radiusincrease;
        }
    }
    
    ignorelist = [ player ];
    nodes = getnodesinradiussorted( vehicle.origin, 800, 0, 250, "path" );
    direction = "nodes";
    
    if ( !isdefined( nodes ) || nodes.size <= 0 )
    {
        if ( isnavmeshloaded() )
        {
            vecs = getrandomnavpoints( vehicle.origin, 800, 6 );
        }
        else
        {
            return undefined;
        }
        
        if ( !isdefined( vecs ) || vecs.size <= 0 )
        {
            return undefined;
        }
        
        nodes = [];
        
        foreach ( vec in vecs )
        {
            node = { #origin:vec };
            nodes[ nodes.size ] = node;
        }
        
        nodes = sortbydistance( nodes, vehicle.origin );
        direction = "nav_points";
    }
    
    nodestried = 0;
    
    foreach ( node in nodes )
    {
        castend = character_cast( player, node.origin, node.origin, ignorelist, 1, "inside" );
        
        if ( isdefined( castend ) )
        {
            return { #iscrouchexit:0, #direction:direction, #origin:castend };
        }
        
        nodestried += 1;
        
        if ( nodestried > 5 )
        {
            break;
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x15d1ed6c, Offset: 0x9230
// Size: 0x373
function private function_d115ed3f24729c7( player, vehicle, radius, var_594ff49a1d5c73f2 )
{
    ignorelist = [ player ];
    contents = physics_createcontents( [ "physicscontents_playernosight", "physicscontents_cameraclip", "physicscontents_glass", "physicscontents_itemclip" ] );
    attempts = 0;
    var_b677ec0c898e2861 = vehicle.origin;
    println( "<dev string:xa5d>" + var_b677ec0c898e2861 );
    
    if ( var_594ff49a1d5c73f2 )
    {
        vertical_offset = ( 0, 0, 1000 );
        content = [ "physicscontents_aiclip", "physicscontents_glass" ];
        solid_ai_contents = physics_createcontents( content );
        ray_trace = trace::ray_trace( vehicle.origin - ( 0, 0, 100 ), vehicle.origin - vertical_offset, undefined, solid_ai_contents );
        var_b677ec0c898e2861 = ray_trace[ "hittype" ] != "hittype_none" ? ray_trace[ "position" ] : vehicle.origin;
        thread function_5a2af62439f0d42c( vehicle.origin - ( 0, 0, 25 ), vehicle.origin - vertical_offset, 60, ( 0, 0, 1 ) );
        println( "<dev string:xa88>" + var_b677ec0c898e2861 );
        
        if ( var_b677ec0c898e2861 == vehicle.origin )
        {
            return undefined;
        }
    }
    
    while ( true )
    {
        segmentdegrees = randomintrange( 0, 360 );
        println( "<dev string:xab8>" + segmentdegrees );
        println( "<dev string:xae3>" + radius );
        var_21cd6c2bd1a1ccc0 = function_34f24d36df92858c( var_b677ec0c898e2861, radius, segmentdegrees );
        onnavmesh = getclosestpointonnavmesh( var_21cd6c2bd1a1ccc0, level.vehiclenavmeshlayer );
        castresults = physics_raycast( vehicle.origin, onnavmesh + ( 0, 0, 35 ), contents, [ vehicle, player ], 0, "physicsquery_closest", 1 );
        
        if ( castresults.size == 0 )
        {
            castend = character_cast( player, onnavmesh + ( 0, 0, 10 ), onnavmesh - ( 0, 0, 20 ), ignorelist, 1, "inside" );
            
            if ( !isdefined( castend ) )
            {
                thread function_5a2af62439f0d42c( vehicle.origin, onnavmesh + ( 0, 0, 35 ), 60, ( 0, 0, 1 ) );
                println( "<dev string:xb06>" );
            }
            else
            {
                thread function_5a2af62439f0d42c( vehicle.origin, onnavmesh + ( 0, 0, 35 ), 60, ( 0, 1, 0 ) );
                println( "<dev string:xb37>" );
                return castend;
            }
        }
        else
        {
            thread function_5a2af62439f0d42c( vehicle.origin, onnavmesh + ( 0, 0, 35 ), 60, ( 1, 0, 0 ) );
            println( "<dev string:xb64>" );
        }
        
        attempts++;
        
        if ( attempts > getdvarint( @"hash_8d7fbced2a67f08", 10 ) )
        {
            return undefined;
        }
    }
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x12b63a35, Offset: 0x95ab
// Size: 0x35
function private function_34f24d36df92858c( center, radius, deg )
{
    return center + ( radius * cos( deg ), radius * sin( deg ), 0 );
}

// Namespace vehicle_occupancy
// Params 3, eflags: 0x4
// Checksum 0x1604f71d, Offset: 0x95e9
// Size: 0xdb, Type: bool
function private function_b41e409298199cf3( vehicle, player, origin )
{
    ignorelist = [];
    
    foreach ( ent in vehicle getlinkedchildren( 1 ) )
    {
        if ( !isplayer( ent ) )
        {
            ignorelist[ ignorelist.size ] = ent;
        }
    }
    
    ignorelist[ ignorelist.size ] = vehicle;
    ignorelist[ ignorelist.size ] = player;
    castend = origin;
    castend = character_cast( player, origin, castend, ignorelist, 1, "inside" );
    return isdefined( castend );
}

// Namespace vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0x36cac473, Offset: 0x96cd
// Size: 0x22d
function private character_cast( player, caststart, castend, ignorelist, allowairexit, exitdirection )
{
    castfailed = 0;
    debuglinestart = undefined;
    debuglineend = undefined;
    
    /#
        debuglinestart = caststart;
        debuglineend = castend;
    #/
    
    contents = physics_createcontents( [ "physicscontents_item", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_vehicleclip", "physicscontents_playerclip", "physicscontents_characterproxy" ] );
    castresults = physics_charactercast( caststart, castend, player, 0, ( 0, 0, 0 ), contents, ignorelist, "physicsquery_closest", "physicsquery_any" );
    
    if ( isdefined( castresults ) && castresults.size > 0 )
    {
        if ( castresults[ 1 ] )
        {
            /#
                debuglineend = debuglinestart;
            #/
            
            castfailed = 1;
        }
        else if ( castresults[ 0 ].size == 0 )
        {
            if ( !allowairexit )
            {
                /#
                    debuglineend = debuglinestart;
                #/
                
                castfailed = 1;
            }
            else
            {
                if ( exitdirection != "top" && exitdirection != "roof" && exitdirection != "inside" )
                {
                    castend += ( 0, 0, 40 );
                }
                
                /#
                    debuglineend = castend;
                #/
            }
        }
        else
        {
            castend = castresults[ 0 ][ 0 ][ "shape_position" ];
            
            /#
                debuglineend = castend;
            #/
        }
    }
    
    /#
        if ( level.debugvehicleexit )
        {
            drawframes = int( ceil( 60 / level.framedurationseconds ) );
            thread function_fab637e91697ac1( debuglinestart, 15, 70, undefined, ( 0, 1, 1 ), undefined, drawframes );
            thread function_5a2af62439f0d42c( debuglinestart, debuglineend, 60, ( 0, 1, 1 ) );
            
            if ( castfailed && isdefined( castresults[ 0 ][ 0 ][ "<dev string:x173>" ] ) )
            {
                level thread function_daa8eeffc9a97683( castresults[ 0 ][ 0 ][ "<dev string:x173>" ], 2, 60, ( 1, 0, 0 ) );
            }
        }
    #/
    
    if ( castfailed )
    {
        return undefined;
    }
    
    thread function_daa8eeffc9a97683( debuglineend, 2, 60, ( 0, 1, 0 ) );
    return castend;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xfc56ba5c, Offset: 0x9903
// Size: 0x37
function function_7908774084bd703b( vehicleref, direction )
{
    data = get_data( vehicleref );
    return data.exitextents[ direction ];
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x378938dd, Offset: 0x9943
// Size: 0x7d1
function function_5bd5cec128647eac( vehicle )
{
    exitboundinginfo = undefined;
    
    if ( isdefined( vehicle.exitboundinginfo ) && vehicle.exitboundinginfo.timestamp == gettime() )
    {
        exitboundinginfo = vehicle.exitboundinginfo;
    }
    else
    {
        leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
        
        if ( isdefined( leveldataforvehicle ) && isdefined( leveldataforvehicle.exitextents ) )
        {
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xbaa>" ] ), "<dev string:xbb3>" );
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xc0a>" ] ), "<dev string:xc12>" );
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xc68>" ] ), "<dev string:xc70>" );
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xcc6>" ] ), "<dev string:xccf>" );
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xd26>" ] ), "<dev string:xd2d>" );
            assert( isdefined( leveldataforvehicle.exitextents[ "<dev string:xd82>" ] ), "<dev string:xd8c>" );
            exitboundinginfo = spawnstruct();
            vehicle.exitboundinginfo = exitboundinginfo;
            exitboundinginfo = exitboundinginfo;
            exitboundinginfo.vehicle = vehicle;
            exitboundinginfo.timestamp = gettime();
            exitboundinginfo.exitsfailed = [];
            exitboundinginfo.exitpositions = [];
            exitboundinginfo.orientedboxpoints = [];
            exitboundinginfo.unorientedboxpoints = [];
            
            /#
                angles = vehicle.angles;
                topleftfront = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xbaa>" ], leveldataforvehicle.exitextents[ "<dev string:xc68>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xd26>" ] ), angles );
                toprightfront = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xbaa>" ], leveldataforvehicle.exitextents[ "<dev string:xcc6>" ], leveldataforvehicle.exitextents[ "<dev string:xd26>" ] ), angles );
                topleftback = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xc0a>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xc68>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xd26>" ] ), angles );
                toprightback = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xc0a>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xcc6>" ], leveldataforvehicle.exitextents[ "<dev string:xd26>" ] ), angles );
                bottomleftfront = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xbaa>" ], leveldataforvehicle.exitextents[ "<dev string:xc68>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xd82>" ] * -1 ), angles );
                bottomrightfront = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xbaa>" ], leveldataforvehicle.exitextents[ "<dev string:xcc6>" ], leveldataforvehicle.exitextents[ "<dev string:xd82>" ] * -1 ), angles );
                bottomleftback = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xc0a>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xc68>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xd82>" ] * -1 ), angles );
                bottomrightback = rotatevector( ( leveldataforvehicle.exitextents[ "<dev string:xc0a>" ] * -1, leveldataforvehicle.exitextents[ "<dev string:xcc6>" ], leveldataforvehicle.exitextents[ "<dev string:xd82>" ] * -1 ), angles );
                points = [ topleftfront, toprightfront, topleftback, toprightback, bottomleftfront, bottomrightfront, bottomleftback, bottomrightback ];
                bestfront = -99999;
                bestback = 99999;
                bestleft = -99999;
                bestright = 99999;
                besttop = -99999;
                bestbot = 99999;
                anglesyawonly = ( 0, angles[ 1 ], 0 );
                
                foreach ( point in points )
                {
                    point = rotatevectorinverted( point, anglesyawonly );
                    
                    if ( point[ 0 ] > bestfront )
                    {
                        bestfront = point[ 0 ];
                    }
                    
                    if ( point[ 0 ] < bestback )
                    {
                        bestback = point[ 0 ];
                    }
                    
                    if ( point[ 1 ] < bestright )
                    {
                        bestright = point[ 1 ];
                    }
                    
                    if ( point[ 1 ] > bestleft )
                    {
                        bestleft = point[ 1 ];
                    }
                    
                    if ( point[ 2 ] > besttop )
                    {
                        besttop = point[ 2 ];
                    }
                    
                    if ( point[ 2 ] < bestbot )
                    {
                        bestbot = point[ 2 ];
                    }
                }
                
                exitboundinginfo.orientedboxpoints[ "<dev string:xde4>" ] = vehicle.origin + topleftfront;
                exitboundinginfo.orientedboxpoints[ "<dev string:xdf4>" ] = vehicle.origin + toprightfront;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe05>" ] = vehicle.origin + topleftback;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe14>" ] = vehicle.origin + toprightback;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe24>" ] = vehicle.origin + bottomleftfront;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe37>" ] = vehicle.origin + bottomrightfront;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe4b>" ] = vehicle.origin + bottomleftback;
                exitboundinginfo.orientedboxpoints[ "<dev string:xe5d>" ] = vehicle.origin + bottomrightback;
                exitboundinginfo.unorientedboxpoints[ "<dev string:xde4>" ] = vehicle.origin + rotatevector( ( bestfront, bestleft, besttop ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xdf4>" ] = vehicle.origin + rotatevector( ( bestfront, bestright, besttop ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe05>" ] = vehicle.origin + rotatevector( ( bestback, bestleft, besttop ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe14>" ] = vehicle.origin + rotatevector( ( bestback, bestright, besttop ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe24>" ] = vehicle.origin + rotatevector( ( bestfront, bestleft, bestbot ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe37>" ] = vehicle.origin + rotatevector( ( bestfront, bestright, bestbot ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe4b>" ] = vehicle.origin + rotatevector( ( bestback, bestleft, bestbot ), anglesyawonly );
                exitboundinginfo.unorientedboxpoints[ "<dev string:xe5d>" ] = vehicle.origin + rotatevector( ( bestback, bestright, bestbot ), anglesyawonly );
            #/
            
            exitboundinginfo thread function_425a931e559bef98();
            function_67fabdb37c99a2d4( exitboundinginfo );
        }
    }
    
    return exitboundinginfo;
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xa7d2800d, Offset: 0xa11d
// Size: 0x68
function private function_425a931e559bef98()
{
    waitframe();
    
    if ( isdefined( self.vehicle ) )
    {
        return;
    }
    
    if ( !isdefined( self.vehicle.exitboundinginfo ) )
    {
        return;
    }
    
    if ( self.vehicle.exitboundinginfo.timestamp != self.timestamp )
    {
        return;
    }
    
    self.vehicle.exitboundinginfo = undefined;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xf2db7368, Offset: 0xa18d
// Size: 0x2d7
function private function_30444f6fab2369f0( vehicle, player, exitid, islaststand )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    exitboundinginfo = function_5bd5cec128647eac( vehicle );
    exitposition = exitboundinginfo.exitpositions[ exitid ].origin;
    focalpoint = undefined;
    ignorelos = 0;
    
    if ( islaststand )
    {
        focalpoint = vehicle.origin + rotatevector( leveldataforvehicle.exitoffsets[ exitid ], vehicle.angles );
        ignorelos = 1;
    }
    
    if ( !isdefined( focalpoint ) )
    {
        focalpoint = player getvieworigin() + anglestoforward( player getplayerangles() ) * 550;
    }
    
    viewposition = undefined;
    
    if ( islaststand )
    {
        viewposition = exitposition + ( 0, 0, 22 );
    }
    else
    {
        viewposition = exitposition + ( 0, 0, 60 );
    }
    
    viewdirection = vectornormalize( focalpoint - viewposition );
    
    if ( !ignorelos )
    {
        contents = physics_createcontents( [ "physicscontents_vehicle", "physicscontents_item" ] );
        castresults = physics_raycast( viewposition, viewposition + viewdirection * 300, contents, undefined, 0, "physicsquery_closest", 1 );
        
        if ( isdefined( castresults ) && castresults.size > 0 )
        {
            hitent = castresults[ 0 ][ "entity" ];
            viewblocked = 0;
            
            if ( isdefined( hitent ) )
            {
                hitlist = vehicle getlinkedchildren( 1 );
                
                if ( !isdefined( hitlist ) )
                {
                    hitlist = [];
                }
                
                hitlist[ hitlist.size ] = vehicle;
                
                foreach ( ent in hitlist )
                {
                    if ( hitent == ent )
                    {
                        viewblocked = 1;
                        break;
                    }
                }
            }
            
            if ( viewblocked )
            {
                exitdirection = leveldataforvehicle.exitdirections[ exitid ];
                angles = ( 0, vehicle.angles[ 1 ], 0 );
                
                if ( exitdirection == "left" || exitdirection == "right" )
                {
                    canceldirection = anglestoright( angles );
                }
                else
                {
                    canceldirection = anglestoforward( angles );
                }
                
                viewdirection -= canceldirection * vectordot( viewdirection, canceldirection );
            }
        }
    }
    
    viewangles = vectortoangles( viewdirection );
    viewangles = ( clamp( viewangles[ 0 ], -12, 12 ), viewangles[ 1 ], 0 );
    return viewangles;
}

// Namespace vehicle_occupancy
// Params 6, eflags: 0x4
// Checksum 0x6bebd798, Offset: 0xa46d
// Size: 0x1b0
function private function_64bd1eb04cce1488( player, vehicle, oldseatid, newseatid, data, specialexit )
{
    if ( !isdefined( player ) || !isdefined( vehicle ) || isdefined( newseatid ) || istrue( data.playerdeath ) && !istrue( data.playerlaststand ) && !data.playerliveragdoll )
    {
        return 1;
    }
    
    /#
        function_d0b91dc395312ace();
    #/
    
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    allowairexit = istrue( leveldataforvehicle.allowairexit ) || istrue( data.allowairexit ) || !vehicle vehicle_isonground();
    exit = function_759b1ac7685fb992( vehicle, player, oldseatid, allowairexit, data.playerlaststand, specialexit, 1 );
    
    if ( isdefined( exit ) )
    {
        data.exitposition = exit.origin;
        data.exitangles = exit.angles;
        data.specialexit = exit.specialexit;
        data.exitdirection = exit.direction;
        data.iscrouchexit = exit.iscrouchexit;
        data.exitoffset = rotatevectorinverted( data.exitposition - vehicle.origin, vehicle.angles );
        return 1;
    }
    
    return 0;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xb04ec65c, Offset: 0xa625
// Size: 0xb6, Type: bool
function function_63c6c86801e0685c()
{
    if ( isdefined( vehicle::get_ref() ) )
    {
        leveldataforvehicle = get_data( vehicle::get_ref() );
        return ( isdefined( leveldataforvehicle.exitextents[ "top" ] ) && isdefined( leveldataforvehicle.exitextents[ "right" ] ) && isdefined( leveldataforvehicle.exitextents[ "left" ] ) && isdefined( leveldataforvehicle.exitextents[ "back" ] ) && isdefined( leveldataforvehicle.exitextents[ "front" ] ) && isdefined( leveldataforvehicle.exitextents ) && isdefined( leveldataforvehicle ) && isdefined( leveldataforvehicle.exitextents[ "bottom" ] ) );
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0x790b9aa6, Offset: 0xa6e4
// Size: 0x3c4
function function_7ce9972f31ab138b( player, vehicle, testpoint, skipmovementdirection, allowcrouchexits = 0 )
{
    if ( !( isdefined( vehicle.origin ) && isdefined( testpoint ) && isdefined( vehicle ) && isdefined( player ) && isdefined( vehicle.angles ) ) )
    {
        return;
    }
    
    data = get_data( vehicle vehicle::get_ref() );
    skipdirection = undefined;
    
    if ( skipmovementdirection )
    {
        forward = anglestoforward( vehicle.angles );
        moving = vehicle vehicle_getvelocity();
        between = math::anglebetweenvectors( forward, moving );
        
        if ( between < 45 )
        {
            skipdirection = "front";
        }
        else if ( between > 135 )
        {
            skipdirection = "back";
        }
    }
    
    exits = [];
    
    foreach ( ref, offset in data.exitoffsets )
    {
        dir = data.exitdirections[ ref ];
        
        if ( skipdirection == dir || dir == "dive" || dir == "roof" )
        {
            continue;
        }
        
        exit = { #origin:vehicle.origin + rotatevector( offset, vehicle.angles ), #dir:dir, #ref:ref };
        exits[ exits.size ] = exit;
    }
    
    exits = sortbydistance( exits, testpoint );
    exitboundinginfo = function_5bd5cec128647eac( vehicle );
    
    foreach ( exit in exits )
    {
        if ( exit.dir == "top" || exit.dir == "inside" )
        {
            continue;
        }
        
        position = function_bba0fb218dac8c73( vehicle, player, exit.ref, exitboundinginfo, 1, allowcrouchexits );
        
        if ( isdefined( position ) )
        {
            position.direction = exit.dir;
            return position;
        }
    }
    
    foreach ( exit in exits )
    {
        if ( exit.dir != "top" && exit.dir != "inside" )
        {
            continue;
        }
        
        position = function_bba0fb218dac8c73( vehicle, player, exit.ref, exitboundinginfo, 1, allowcrouchexits );
        
        if ( isdefined( position ) )
        {
            position.direction = exit.dir;
            return position;
        }
    }
    
    if ( getdvarint( @"hash_9c95c78d2efca328", 1 ) == 1 )
    {
        return function_a0688628a927f50d( vehicle, player );
    }
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0x3f148c04, Offset: 0xaab0
// Size: 0x34b
function function_d198a4322db28cf4( vehicle, seatid, newseatid, player, data )
{
    playerdeathexit = istrue( data.playerdeath ) && !istrue( data.playerlaststand ) && !istrue( data.playerliveragdoll ) && !istrue( data.var_51e28ecc5c1cbffd );
    
    if ( !isdefined( player ) || playerdeathexit || isdefined( newseatid ) || player.var_6bb95d5c412d3e98 )
    {
        if ( isdefined( player ) && !isdefined( newseatid ) )
        {
            get_out( player, vehicle, !isdefined( newseatid ) );
            player val::reset_all( "vehicle_roof_exit" );
            player val::reset_all( "vehicle_occupant_common" );
            player val::reset_all( "vehicle_occupant" );
            
            if ( isdefined( seatid ) && seatid == "driver" )
            {
                player val::group_reset( "vehicle" );
            }
            else
            {
                player val::group_reset( "vehicle_passenger" );
            }
        }
        
        return 1;
    }
    
    movedexitposition = undefined;
    
    if ( isdefined( data.exitoffset ) )
    {
        movedexitposition = vehicle.origin + rotatevector( data.exitoffset, vehicle.angles );
    }
    
    if ( isdefined( movedexitposition ) && function_b41e409298199cf3( vehicle, player, movedexitposition ) )
    {
        exitposition = movedexitposition;
    }
    else
    {
        exitposition = data.exitposition;
    }
    
    if ( isdefined( exitposition ) )
    {
        if ( isdefined( data.specialexit ) )
        {
            if ( data.specialexit == "_to_roof" )
            {
                roof_exit( player, vehicle, seatid, data );
            }
            else
            {
                player function_2fc424070ee1794c();
                player leavevehicle( 0, 1 );
                player val::reset_all( "vehicle_roof_exit" );
                player val::reset_all( "vehicle_occupant_common" );
            }
        }
        else
        {
            get_out( player, vehicle, !isdefined( newseatid ) );
            
            if ( !isdefined( player.sessionstate ) || player.sessionstate != "spectator" )
            {
                player dontinterpolate();
                
                if ( data.exitdirection == "inside" || data.exitdirection == "top" )
                {
                    player function_b24bb8a9e05f54bc( exitposition, vehicle );
                }
                else
                {
                    player setorigin( exitposition, 1, 1 );
                }
                
                player setstance( istrue( data.iscrouchexit ) ? "crouch" : "stand" );
                
                /#
                    if ( level.debugvehicleexit )
                    {
                        drawframes = int( ceil( 60 / level.framedurationseconds ) );
                        utility::draw_capsule( exitposition, 15, 70, undefined, ( 1, 1, 0 ), undefined, drawframes );
                    }
                #/
                
                if ( isdefined( data.exitangles ) )
                {
                    player setplayerangles( data.exitangles );
                }
            }
            
            player val::reset_all( "vehicle_roof_exit" );
            player val::reset_all( "vehicle_occupant_common" );
        }
        
        return 1;
    }
    
    get_out( player, vehicle, !isdefined( newseatid ) );
    player val::reset_all( "vehicle_roof_exit" );
    player val::reset_all( "vehicle_occupant_common" );
    return 0;
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x6ea253b2, Offset: 0xae03
// Size: 0x19e
function private roof_exit( player, vehicle, seatid, data )
{
    vehicleref = vehicle vehicle::get_ref();
    var_4925f33993c8d4db = get_data( vehicleref );
    
    if ( var_4925f33993c8d4db.roofexittype == "animated" )
    {
        finalposition = player function_e50a4c015224c4eb();
        
        if ( finalposition )
        {
            finalposition += ( 0, 0, 18 );
        }
        else
        {
            finalposition = vehicle.origin + rotatevector( var_4925f33993c8d4db.exitoffsets[ seatid + "_to_roof" ], vehicle.angles );
        }
    }
    else
    {
        offset = var_4925f33993c8d4db.exitoffsets[ seatid + "_to_roof" ];
        finalposition = vehicle.origin + rotatevector( offset, vehicle.angles );
    }
    
    get_out( player, vehicle, 1 );
    player thread vehicle_collision::function_e3bc60c772acd609( vehicle, player );
    stance = var_4925f33993c8d4db.roofexittype == "stand_up" ? "stand" : "crouch";
    
    if ( isbot( player ) )
    {
        player utility::callsharedfunc( #"bots", #"botsetstance", stance );
    }
    
    player setstance( stance, 1, 1, 1 );
    player dontinterpolate();
    player function_b24bb8a9e05f54bc( finalposition, vehicle );
    player val::reset_all( "vehicle_occupant_common" );
    player val::reset_all( "vehicle_roof_exit" );
}

/#

    // Namespace vehicle_occupancy
    // Params 2, eflags: 0x4
    // Checksum 0x348fc269, Offset: 0xafa9
    // Size: 0x5c, Type: dev
    function private function_f9ba3136976d8b0f( startingposition, angles )
    {
        self notify( "<dev string:xe70>" );
        self endon( "<dev string:xe70>" );
        
        while ( true )
        {
            iprintlnbold( "<dev string:xe8b>" + rotatevector( self.origin - startingposition, angles ) - ( 0, 0, 18 ) );
            waitframe();
        }
    }

#/

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x240eac44, Offset: 0xb00d
// Size: 0x185
function private function_e58c1c5409a9713c( player, vehicle, seatid, data )
{
    vehicleref = vehicle vehicle::get_ref();
    var_4925f33993c8d4db = get_data( vehicleref );
    
    if ( !isdefined( var_4925f33993c8d4db.roofexittype ) )
    {
        assertmsg( "<dev string:xe8f>" );
        return;
    }
    
    driver = get_driver( vehicle );
    
    if ( isdefined( driver ) && driver == player )
    {
        vehicle thread function_d222aac7ad917141( 8000 );
    }
    
    if ( var_4925f33993c8d4db.roofexittype == "animated" )
    {
        player endon( "death_or_disconnect" );
        player endon( "last_stand_enter" );
        player endon( "enter_live_ragdoll" );
        player endon( "interrupt_roof_exit" );
        player endon( "vehicle_roof_exit_collision_detected" );
        vehicle endon( "death" );
        player val::set_array( "vehicle_roof_exit", [ "script_weapon_switch", "weapon_switch", "melee", "vehicle_seat_switch", "allow_movement" ], 0 );
        player function_858e4d19c2817326();
        endtime = gettime() + ( player isinvehicleleanout() ? level.var_8b0a26b04bac3108 : level.var_51db840a745c6105 );
        
        while ( !player function_2907aa812eda8a21() && gettime() < endtime )
        {
            waitframe();
        }
        
        while ( player function_2907aa812eda8a21() && gettime() < endtime )
        {
            waitframe();
        }
    }
    
    return 1;
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0xf417b0db, Offset: 0xb19b
// Size: 0x15d
function private function_d222aac7ad917141( time )
{
    if ( isdefined( self.vehicletype ) )
    {
        if ( self.vehicletype == "veh9_civ_lnd_dirt_bike_physics_mp" || self.vehicletype == "veh9_civ_lnd_motorcycle_cruiser_2008_physics_mp" || self.vehicletype == "veh9_civ_lnd_scooter_eu_physics_mp" )
        {
            return;
        }
    }
    
    self notify( "maintainSpeedForTime" );
    self endon( "maintainSpeedForTime" );
    
    if ( vectordot( self vehicle_getvelocity(), anglestoforward( self.angles ) ) < 0 || self vehicle_getspeed() < 5 )
    {
        return;
    }
    
    self endon( "death" );
    self.var_3fee62740baee02f = 1;
    self removecomponent( "player" );
    self addcomponent( "p2p" );
    maxspeed = self vehicle_getspeed();
    endtime = gettime() + time;
    
    while ( gettime() < endtime && self.var_3fee62740baee02f && self vehicle_getspeed() > 5 )
    {
        self setconfigvalue( "p2p", "manualSpeed", utility::mph_to_ips( min( maxspeed, self vehicle_getspeed() ) ) );
        self setconfigvalue( "p2p", "goalPoint", self.origin + anglestoforward( self.angles ) * 2000 );
        waitframe();
    }
    
    if ( !self.var_3fee62740baee02f )
    {
        return;
    }
    
    function_9afa8159255a47de();
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x17871cb6, Offset: 0xb300
// Size: 0x28
function private function_9afa8159255a47de()
{
    self.var_3fee62740baee02f = undefined;
    self setconfigvalue( "p2p", "manualSpeed", 0 );
    self removecomponent( "p2p" );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x11199569, Offset: 0xb330
// Size: 0x1fc
function function_aabb37430ffe599( driverseatid )
{
    driver = function_604f6aa3a5ef5250( self, driverseatid );
    occupants = function_6e6afd819ebbe705( self );
    
    if ( isdefined( driver ) )
    {
        driverinput = driver getnormalizedmovement()[ 0 ];
        
        if ( abs( driverinput ) > 0.15 )
        {
            foreach ( occupant in occupants )
            {
                if ( occupant utility::callsharedfunc( #"player", #"playerisalive" ) )
                {
                    occupant function_19e78a15b22e4a8c();
                }
            }
        }
        else
        {
            foreach ( occupant in occupants )
            {
                if ( occupant utility::callsharedfunc( #"player", #"playerisalive" ) )
                {
                    occupant function_998629932390cbc4();
                }
            }
        }
        
        return;
    }
    
    if ( isdefined( occupants ) )
    {
        foreach ( occupant in occupants )
        {
            if ( occupant utility::callsharedfunc( #"player", #"playerisalive" ) )
            {
                occupant function_998629932390cbc4();
            }
        }
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x2d6d7dbc, Offset: 0xb534
// Size: 0x2b
function function_19e78a15b22e4a8c()
{
    if ( self.vehiclemoveshakeenabled )
    {
        return;
    }
    
    self.vehiclemoveshakeenabled = 1;
    self setscriptablepartstate( "vehicleMoveShake", "active1", 0 );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xbc9d0b5d, Offset: 0xb567
// Size: 0x2b
function function_998629932390cbc4()
{
    if ( !self.vehiclemoveshakeenabled )
    {
        return;
    }
    
    self.vehiclemoveshakeenabled = undefined;
    self setscriptablepartstate( "vehicleMoveShake", "neutral", 0 );
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x6f619797, Offset: 0xb59a
// Size: 0x310
function function_4a74835a652d1d7d( data )
{
    leveldataforvehicle = get_data( vehicle::get_ref() );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return;
    }
    
    if ( self.isequipment )
    {
        return;
    }
    
    if ( !isdefined( data.damage ) || data.damage <= 0 )
    {
        return;
    }
    
    if ( !isdefined( data.meansofdeath ) )
    {
        return;
    }
    
    damagefeedbacktype = undefined;
    damagefeedbackgroup = undefined;
    
    switch ( data.meansofdeath )
    {
        case #"hash_571e46e17a3cf2e3":
        case #"hash_5f1054c48d66fd1c":
        case #"hash_66cb246f3e55fbe2":
        case #"hash_966768b3f0c94767":
        case #"hash_a86d8c43482948a4":
        case #"hash_c22b13f81bed11f0":
            damagefeedbacktype = "light";
            damagefeedbackgroup = leveldataforvehicle.damagefeedbackgrouplight;
            break;
        case #"hash_3c20f39c73a1422b":
        case #"hash_a911a1880d996edb":
        case #"hash_b1078ff213fddba6":
            damagefeedbacktype = "heavy";
            damagefeedbackgroup = leveldataforvehicle.damagefeedbackgroupheavy;
            break;
    }
    
    if ( !isdefined( damagefeedbacktype ) )
    {
        return;
    }
    
    if ( !isdefined( damagefeedbackgroup ) || damagefeedbackgroup == "none" )
    {
        return;
    }
    
    players = [];
    
    if ( damagefeedbackgroup == "driver" )
    {
        foreach ( seatid, leveldataforseat in leveldataforvehicle.seatdata )
        {
            if ( !isdefined( leveldataforseat.animtag ) )
            {
                continue;
            }
            
            if ( leveldataforseat.animtag == "tag_seat_0" || leveldataforseat.animtag == "offset_seat_0" )
            {
                players = [ function_604f6aa3a5ef5250( self, seatid ) ];
                break;
            }
        }
    }
    else if ( damagefeedbackgroup == "all" && function_b20cd24c7d75deeb( self ) )
    {
        players = function_6e6afd819ebbe705( self );
    }
    
    if ( !isdefined( players ) || players.size == 0 )
    {
        return;
    }
    
    foreach ( player in players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( !player utility::callsharedfunc( #"player", #"playerisalive" ) )
        {
            continue;
        }
        
        if ( damagefeedbacktype == "light" )
        {
            player thread function_fd5e7a6f0d16c5d0();
            continue;
        }
        
        if ( damagefeedbacktype == "heavy" )
        {
            player thread function_5c6dde8258d14841();
        }
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x63e6b3ad, Offset: 0xb8b2
// Size: 0x72
function function_fd5e7a6f0d16c5d0()
{
    self endon( "disconnect" );
    self endon( "vehicle_occupancy_clearLightDamageFeedbackPlayer" );
    
    if ( !isdefined( self.vehiclelightdamagefeedbackid ) )
    {
        self.vehiclelightdamagefeedbackid = 1;
    }
    
    utility::function_7c10ea82c1e305b8( "vehicleDamageShakeLight", "active" + self.vehiclelightdamagefeedbackid );
    self.vehiclelightdamagefeedbackid = 1 + int( self.vehiclelightdamagefeedbackid + 1 ) % 3;
    wait 0.15;
    thread function_daef2fed719d68fa();
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xa5b0381, Offset: 0xb92c
// Size: 0x25
function function_daef2fed719d68fa()
{
    self notify( "vehicle_occupancy_clearLightDamageFeedbackPlayer" );
    utility::function_7c10ea82c1e305b8( "vehicleDamageShakeLight", "neutral" );
    self.vehiclelightdamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x64b67f5d, Offset: 0xb959
// Size: 0x6e
function function_5c6dde8258d14841()
{
    self endon( "disconnect" );
    self endon( "vehicle_occupancy_clearHeavyDamageFeedbackPlayer" );
    
    if ( !isdefined( self.vehicleheavydamagefeedbackid ) )
    {
        self.vehicleheavydamagefeedbackid = 1;
    }
    
    utility::function_7c10ea82c1e305b8( "vehicleDamageShakeHeavy", "active" + self.vehicleheavydamagefeedbackid );
    self.vehicleheavydamagefeedbackid = 1 + ( self.vehicleheavydamagefeedbackid + 1 ) % 3;
    wait 0.3;
    thread function_520d22bfee929413();
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xb57888f0, Offset: 0xb9cf
// Size: 0x25
function function_520d22bfee929413()
{
    self notify( "vehicle_occupancy_clearHeavyDamageFeedbackPlayer" );
    utility::function_7c10ea82c1e305b8( "vehicleDamageShakeHeavy", "neutral" );
    self.vehicleheavydamagefeedbackid = undefined;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x83a0093f, Offset: 0xb9fc
// Size: 0x10
function function_f2eda11ef5a74b2b()
{
    function_daef2fed719d68fa();
    function_520d22bfee929413();
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xd290e444, Offset: 0xba14
// Size: 0x137
function give_turret( player, vehicle, objweapon )
{
    player endon( "disconnect" );
    wasinvehicle = player isvehicleactive();
    get_out( player, vehicle );
    
    if ( wasinvehicle )
    {
        waitframe();
    }
    
    player val::set( "vehicle_turret", "unresolved_collisions", 0 );
    player val::set( "vehicle_turret", "vehicle_predictive_ragdoll", 0 );
    turret = vehicle::function_95e3c2e0c6eec800( vehicle, objweapon );
    turret.owner = player;
    turret setotherent( player );
    turret setentityowner( player );
    turret setsentryowner( player );
    player disableturretdismount();
    player utility::callsharedfunc( #"player", #"controlturreton", turret );
    
    if ( !player hasweapon( objweapon ) )
    {
        player utility::callsharedfunc( #"weapons", #"giveweapon", objweapon );
    }
    
    if ( !player utility::callsharedfunc( #"weapons", #"iscurrentweapon", objweapon ) )
    {
        player utility::callsharedfunc( #"weapons", #"domonitoredweaponswitch", objweapon, 1, 1 );
    }
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0x1c286a41, Offset: 0xbb53
// Size: 0x1e3
function take_turret( player, vehicle, objweapon, data, shouldtimeout )
{
    if ( isdefined( data.raceendon ) )
    {
        data endon( data.raceendon );
    }
    
    if ( shouldtimeout )
    {
        childthread function_8b04a89f7f3ac70e( data, 1.5 );
    }
    
    player val::reset_all( "vehicle_turret" );
    
    if ( player hasweapon( objweapon ) )
    {
        result = undefined;
        thread function_67dad5f8266910c6( player );
        
        if ( player utility::callsharedfunc( #"weapons", #"isswitchingtoweaponwithmonitoring", objweapon ) )
        {
            assert( player getcurrentweapon().basename != objweapon );
            player utility::callsharedfunc( #"weapons", #"abortmonitoredweaponswitch", makeweapon( objweapon ) );
            result = 1;
        }
        else
        {
            turret = vehicle::function_95e3c2e0c6eec800( vehicle, objweapon );
            
            if ( isdefined( turret ) )
            {
                player utility::callsharedfunc( #"player", #"controlturretoff", turret );
            }
            
            if ( player hasweapon( objweapon ) )
            {
                holdingweapon = player utility::callsharedfunc( #"weapons", #"iscurrentweapon", objweapon );
                
                if ( holdingweapon )
                {
                    player utility::callsharedfunc( #"weapons", #"takeweapon", objweapon );
                    player thread utility::callsharedfunc( #"weapons", #"forcevalidweapon" );
                }
                else
                {
                    player thread utility::callsharedfunc( #"weapons", #"getridofweapon", objweapon, 1 );
                }
            }
            
            result = 1;
        }
        
        if ( isdefined( result ) && !result )
        {
            data.success = 0;
            data notify( data.raceendnotify );
        }
    }
}

// Namespace vehicle_occupancy
// Params 2, eflags: 0x4
// Checksum 0x6b898f7, Offset: 0xbd3e
// Size: 0x34
function private function_8b04a89f7f3ac70e( data, timeout )
{
    wait timeout;
    data.success = 0;
    data notify( data.raceendnotify );
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x949586b7, Offset: 0xbd7a
// Size: 0x36
function private function_67dad5f8266910c6( player )
{
    player notify( "vehicle_occupancy_forceWeaponSwitchAllowed" );
    
    if ( player val::get( "weapon_switch" ) )
    {
        player enableweaponswitch();
        return;
    }
    
    player disableweaponswitch();
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x979f1484, Offset: 0xbdb8
// Size: 0xe9
function function_e63376f7546b7cb8( vehicle )
{
    if ( vehicle vehicle::is_husk() )
    {
        return;
    }
    
    seatids = function_8a8e1601e7e6610( vehicle );
    
    foreach ( seatid in seatids )
    {
        occupant = function_604f6aa3a5ef5250( vehicle, seatid );
        
        if ( isdefined( occupant ) )
        {
            thread vehicle_collision::function_e3bc60c772acd609( vehicle, occupant );
            data = { #exittype:"INVOLUNTARY", #allowairexit:1 };
            thread exit( vehicle, seatid, occupant, data, 1 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x972e23e5, Offset: 0xbea9
// Size: 0xf7
function function_1dafc6cf543f6545( vehicle )
{
    if ( vehicle vehicle::is_husk() )
    {
        return;
    }
    
    seatids = function_8a8e1601e7e6610( vehicle );
    
    foreach ( seatid in seatids )
    {
        if ( seatid == "driver" )
        {
            continue;
        }
        
        occupant = function_604f6aa3a5ef5250( vehicle, seatid );
        
        if ( isdefined( occupant ) )
        {
            thread vehicle_collision::function_e3bc60c772acd609( vehicle, occupant );
            data = { #exittype:"INVOLUNTARY", #allowairexit:1 };
            thread exit( vehicle, seatid, occupant, data, 1 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 5
// Checksum 0x54b7316b, Offset: 0xbfa8
// Size: 0xe0
function function_d2642bca0c636233( vehicle, weapon, attachtag, model, skinoverride )
{
    turret = spawnturret( "misc_turret", vehicle gettagorigin( attachtag ), weapon, 0 );
    turret linkto( vehicle, attachtag, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    
    if ( isdefined( skinoverride ) )
    {
        model = skinoverride + "::" + model;
    }
    
    turret setmodel( model );
    turret setmode( "sentry_offline" );
    turret setsentryowner( undefined );
    turret makeunusable();
    turret setdefaultdroppitch( 0 );
    turret setturretmodechangewait( 1 );
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xe5d3683a, Offset: 0xc091
// Size: 0x33
function reset_turret()
{
    self setmode( "sentry_offline" );
    self setsentryowner( undefined );
    self makeunusable();
    self setdefaultdroppitch( 0 );
    self setturretmodechangewait( 1 );
    self.gunner = undefined;
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0xc773888, Offset: 0xc0cc
// Size: 0x7d
function function_312f5bf4d47d6f47( vehicle, weaponname, normalraisetime, firstraisetime )
{
    raisetime = 0;
    
    if ( vehicle.playedfirstraise )
    {
        raisetime = normalraisetime ?? 850;
    }
    else
    {
        raisetime = firstraisetime ?? 2200;
    }
    
    level thread function_d70556aad6156de1( self, raisetime );
    thread give_turret( self, vehicle, weaponname );
    vehicle.playedfirstraise = 1;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xb05eabc7, Offset: 0xc151
// Size: 0xb6
function function_3d4acb78f07de5d1( data, vehicle, weaponname )
{
    turret = vehicle::function_95e3c2e0c6eec800( vehicle, weaponname );
    
    if ( !data.playerdisconnect )
    {
        self enableturretdismount();
        utility::callsharedfunc( #"player", #"controlturretoff", turret );
        thread function_9d41e9434004ca0f( self, data.playerdeath );
        
        if ( !data.playerdeath )
        {
            thread take_turret( self, vehicle, weaponname, data, 1 );
        }
    }
    
    turret.owner = undefined;
    turret setotherent( undefined );
    turret setentityowner( undefined );
    turret setsentryowner( undefined );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x46052273, Offset: 0xc20f
// Size: 0xc3
function function_ac2b78fb4f00e87e()
{
    allows = [ "crouch", "prone", "sprint", "mantle", "mount_top", "mount_side", "vehicle_use", "vehicle_predictive_ragdoll", "crate_use", "ladder_placement", "execution_attack", "execution_victim" ];
    
    if ( !isdefined( level.var_ebd0541e14d3b7c0 ) || !level.var_ebd0541e14d3b7c0 )
    {
        allows[ allows.size ] = "usability";
    }
    
    if ( getdvarint( @"hash_6c68604cd07d358", 0 ) == 1 )
    {
        allows[ allows.size ] = "offhand_weapons";
    }
    
    return allows;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xaa172b4e, Offset: 0xc2db
// Size: 0x20
function function_d166c9cd83969e0e( val = 1 )
{
    level.var_ebd0541e14d3b7c0 = val;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xf8e1f408, Offset: 0xc303
// Size: 0x39
function function_9f5282b40f2df2a9()
{
    return [ "offhand_weapons", "fire", "reload", "autoreload", "weapon_switch", "cough_gesture" ];
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xb630d6d5, Offset: 0xc345
// Size: 0x30
function function_f02bc30b02f79356()
{
    return [ "offhand_weapons", "reload", "autoreload", "weapon_switch", "cough_gesture" ];
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xd7b0d67f, Offset: 0xc37e
// Size: 0x1e
function function_64a3829f0655c0b0()
{
    return [ "offhand_weapons", "weapon_switch", "cough_gesture" ];
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x94a3fc1e, Offset: 0xc3a5
// Size: 0xc
function function_b8eb35c9e4ccc722()
{
    return [ "weapon_pickup" ];
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x3a14e4dd, Offset: 0xc3ba
// Size: 0x8
function function_24cd2940c5b56fdb()
{
    return function_9f5282b40f2df2a9();
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xea5aa207, Offset: 0xc3cb
// Size: 0x30
function function_504d83b160ed6158()
{
    restrictions = function_b8eb35c9e4ccc722();
    restrictions[ restrictions.size ] = "cough_gesture";
    restrictions[ restrictions.size ] = "offhand_weapons";
    return arrayremoveduplicates( restrictions );
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xaff8e981, Offset: 0xc404
// Size: 0xc7
function function_d70556aad6156de1( player, timems, var_bca0c8468a20ab1c )
{
    player endon( "disconnect" );
    player notify( "vehicle_occupancy_disableFireForTime" );
    player endon( "vehicle_occupancy_disableFireForTime" );
    
    if ( !self.vehicledisablefire )
    {
        player.vehicledisablefire = 1;
        player val::set( "vehicleDisableFire", "fire", 0 );
    }
    
    if ( !isdefined( player.vehicledisablefireendtime ) || !var_bca0c8468a20ab1c )
    {
        player.vehicledisablefireendtime = gettime() + timems;
    }
    
    while ( isdefined( player.vehicledisablefireendtime ) && gettime() < player.vehicledisablefireendtime )
    {
        wait 0.05;
    }
    
    thread function_9d41e9434004ca0f( player );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x904d77bc, Offset: 0xc4d3
// Size: 0x57
function function_9d41e9434004ca0f( player, fromdeath )
{
    player notify( "vehicle_occupancy_disableFireForTime" );
    
    if ( isdefined( player.vehicledisablefire ) )
    {
        if ( !fromdeath )
        {
            player val::reset_all( "vehicleDisableFire" );
        }
    }
    
    player.vehicledisablefire = undefined;
    player.vehicledisablefireendtime = undefined;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x2196d154, Offset: 0xc532
// Size: 0x58
function function_3e0dcbfe3cd87c74( player, vehicle, newseatid )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"takeriotshield" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"takeriotshield" ) ]]( player, vehicle, newseatid );
    }
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0xf0bb1edc, Offset: 0xc592
// Size: 0x58
function function_128fefd1300bebc2( player, fromdeath, fromlaststand )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"giveriotshield" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"giveriotshield" ) ]]( player, fromdeath, fromlaststand );
    }
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x3511d2f2, Offset: 0xc5f2
// Size: 0x58
function function_99517a81df462d56( player, vehicle, newseatid )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"updateRiotShield" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"updateRiotShield" ) ]]( player, vehicle, newseatid );
    }
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0x4dd45b0b, Offset: 0xc652
// Size: 0x63
function function_702b50a45a0bb141( vehicle, seatid, player, data )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"hideCashBag" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"hideCashBag" ) ]]( vehicle, seatid, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0x85c5de02, Offset: 0xc6bd
// Size: 0x63
function function_91c2eed4926ac7c6( vehicle, seatid, player, data )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"showcashbag" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"showcashbag" ) ]]( vehicle, seatid, player, data );
    }
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x76d93ee, Offset: 0xc728
// Size: 0x65
function private register_sentient( vehicle )
{
    if ( isdefined( vehicle.sentientdisabled ) && vehicle.sentientdisabled > 0 )
    {
        return;
    }
    
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"registersentient" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"registersentient" ) ]]( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0xac2823b7, Offset: 0xc795
// Size: 0x44
function private unregister_sentient( vehicle )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"unregistersentient" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_occupancy", #"unregistersentient" ) ]]( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x688bca1b, Offset: 0xc7e1
// Size: 0x44
function is_sentient( vehicle )
{
    if ( utility::issharedfuncdefined( #"vehicle_occupancy", #"issentient" ) )
    {
        return [[ utility::getsharedfunc( #"vehicle_occupancy", #"issentient" ) ]]( vehicle );
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x9b2a5057, Offset: 0xc82d
// Size: 0x93
function allow_sentient( bool )
{
    if ( bool )
    {
        assert( isdefined( self.sentientdisabled ) && self.sentientdisabled > 0, "<dev string:xece>" );
        self.sentientdisabled--;
        
        if ( self.sentientdisabled == 0 )
        {
            register_sentient( self );
        }
        
        return;
    }
    
    if ( !isdefined( self.sentientdisabled ) )
    {
        self.sentientdisabled = 0;
    }
    
    self.sentientdisabled++;
    
    if ( self.sentientdisabled == 1 )
    {
        unregister_sentient( self );
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xf2942459, Offset: 0xc8c8
// Size: 0xee
function function_3fdb556dfc812f8( vehicle, var_a0fc3fce2a67081a )
{
    linktooriginandangles = spawnstruct();
    
    if ( vehicle tagexists( var_a0fc3fce2a67081a ) )
    {
        linktooriginandangles.origin = vehicle gettagorigin( var_a0fc3fce2a67081a );
        linktooriginandangles.angles = vehicle gettagangles( var_a0fc3fce2a67081a );
    }
    else
    {
        leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), var_a0fc3fce2a67081a );
        
        if ( isdefined( leveldataforseat.animtag ) )
        {
            linktooriginandangles.origin = vehicle gettagorigin( leveldataforseat.animtag );
            linktooriginandangles.angles = vehicle gettagangles( leveldataforseat.animtag );
        }
        else
        {
            linktooriginandangles.origin = vehicle.origin;
            linktooriginandangles.angles = vehicle.angles;
        }
    }
    
    return linktooriginandangles;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x2f3e65bc, Offset: 0xc9bf
// Size: 0x92
function function_e1a19a7a2a793b7f( corpse, vehicle, var_a0fc3fce2a67081a )
{
    if ( vehicle tagexists( var_a0fc3fce2a67081a ) )
    {
        corpse enablelinkto();
        corpse linkto( vehicle, var_a0fc3fce2a67081a );
        return;
    }
    
    leveldataforseat = function_568cd324ac705619( vehicle vehicle::get_ref(), var_a0fc3fce2a67081a );
    
    if ( isdefined( leveldataforseat.animtag ) )
    {
        corpse enablelinkto();
        corpse linkto( vehicle, leveldataforseat.animtag );
        return;
    }
    
    corpse enablelinkto();
    corpse linkto( vehicle );
}

// Namespace vehicle_occupancy
// Params 4
// Checksum 0xb260ad9d, Offset: 0xca59
// Size: 0x8d
function function_7730eb57fd31aeea( corpse, vehicle, var_a0fc3fce2a67081a, deleteonseatenter )
{
    assert( !istrue( vehicle.isdestroyed ), "<dev string:xf36>" );
    
    if ( !isdefined( vehicle.corpses ) )
    {
        vehicle.corpses = [];
    }
    
    function_4793dd4d02d6e68c( vehicle, var_a0fc3fce2a67081a, 0 );
    vehicle.corpses[ var_a0fc3fce2a67081a ] = corpse;
    
    if ( !deleteonseatenter )
    {
        corpse.dontdeleteonseatenter = 1;
    }
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x70d61138, Offset: 0xcaee
// Size: 0x58
function function_e0dab587ee188096( corpse, vehicle, var_a0fc3fce2a67081a )
{
    if ( isdefined( vehicle.corpses ) && isdefined( vehicle.corpses[ var_a0fc3fce2a67081a ] ) )
    {
        vehicle.corpses[ var_a0fc3fce2a67081a ] = undefined;
    }
    
    corpse.dontdeleteonseatenter = undefined;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x36dc0c40, Offset: 0xcb4e
// Size: 0x96
function function_4793dd4d02d6e68c( vehicle, var_a0fc3fce2a67081a, var_7e0124fcc9f427af )
{
    if ( isdefined( vehicle.corpses ) && isdefined( vehicle.corpses[ var_a0fc3fce2a67081a ] ) )
    {
        corpse = vehicle.corpses[ var_a0fc3fce2a67081a ];
        
        if ( isdefined( corpse ) )
        {
            if ( !corpse.dontdeleteonseatenter || !var_7e0124fcc9f427af )
            {
                vehicle.corpses[ var_a0fc3fce2a67081a ] delete();
                vehicle.corpses[ var_a0fc3fce2a67081a ] = undefined;
            }
        }
    }
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x62980f43, Offset: 0xcbec
// Size: 0x120
function function_4116af5d3e9e02cd( vehicle )
{
    if ( isdefined( vehicle.corpses ) )
    {
        foreach ( corpse in vehicle.corpses )
        {
            if ( isdefined( corpse ) )
            {
                corpse delete();
            }
        }
    }
    
    vehicle.corpses = undefined;
    
    foreach ( ent in vehicle getlinkedchildren() )
    {
        if ( isactorcorpse( ent ) )
        {
            ent delete();
        }
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x7368764a, Offset: 0xcd14
// Size: 0xa7
function function_6d9760c4971403c2( vehicle, bool )
{
    if ( vehicle.isdestroyed || !isdefined( vehicle.occupants ) )
    {
        vehicle.preventspawninto = undefined;
        return;
    }
    
    if ( bool )
    {
        assert( isdefined( vehicle.preventspawninto ) && vehicle.preventspawninto > 0, "<dev string:xf84>" );
        vehicle.preventspawninto--;
        return;
    }
    
    if ( !isdefined( vehicle.preventspawninto ) )
    {
        vehicle.preventspawninto = 0;
    }
    
    vehicle.preventspawninto++;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0xf8c92596, Offset: 0xcdc3
// Size: 0x51, Type: bool
function function_36a2daf3189a957f( vehicle )
{
    if ( vehicle.isdestroyed || !isdefined( vehicle.occupants ) )
    {
        return false;
    }
    
    if ( isdefined( vehicle.preventspawninto ) && vehicle.preventspawninto > 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x5d10b5e6, Offset: 0xce1d
// Size: 0x8c
function function_7b5a0eb785dba6d2( seatid, seatidarr )
{
    assert( arraycontains( seatidarr, seatid ), "<dev string:xfee>" );
    seatswitcharr = [];
    foundseatid = 0;
    
    for ( i = 0; true ; i++ )
    {
        if ( !foundseatid )
        {
            if ( seatid == seatidarr[ i ] )
            {
                foundseatid = 1;
            }
            
            continue;
        }
        
        i %= seatidarr.size;
        
        if ( seatid == seatidarr[ i ] )
        {
            break;
        }
        
        seatswitcharr[ seatswitcharr.size ] = seatidarr[ i ];
    }
    
    return seatswitcharr;
}

// Namespace vehicle_occupancy
// Params 3
// Checksum 0x1769f6e0, Offset: 0xceb2
// Size: 0x324
function kill_occupants( vehicle, damagedata, exitdata )
{
    if ( !level.var_caec56ac747c5a55 )
    {
        function_4116af5d3e9e02cd( vehicle );
    }
    
    if ( !vehicle vehicle::is_vehicle() || !function_b20cd24c7d75deeb( vehicle ) )
    {
        return;
    }
    
    if ( !isdefined( damagedata.inflictor ) && isdefined( damagedata.meansofdeath ) )
    {
        switch ( damagedata.meansofdeath )
        {
            case #"hash_3c20f39c73a1422b":
            case #"hash_571e46e17a3cf2e3":
            case #"hash_66cb246f3e55fbe2":
            case #"hash_c22b13f81bed11f0":
                if ( isdefined( vehicle.killcament ) )
                {
                    vehicle.killcament delete();
                }
                
                vehicle.killcament = damagedata.inflictor;
                damagedata.inflictor = vehicle;
                break;
        }
    }
    
    if ( isdefined( damagedata ) && !isdefined( damagedata.inflictor ) )
    {
        damagedata.inflictor = undefined;
    }
    
    seatids = function_8a8e1601e7e6610( vehicle, 0 );
    
    if ( !isdefined( seatids ) )
    {
        return;
    }
    
    meansofdeath = damagedata.meansofdeath ?? "MOD_EXPLOSIVE";
    
    if ( meansofdeath == "MOD_PROJECTILE" )
    {
        meansofdeath = "MOD_PROJECTILE_SPLASH";
    }
    else if ( meansofdeath == "MOD_GRENADE" )
    {
        meansofdeath = "MOD_GRENADE_SPLASH";
    }
    
    foreach ( seatid in seatids )
    {
        occupant = function_604f6aa3a5ef5250( vehicle, seatid );
        
        if ( isdefined( occupant ) )
        {
            curattacker = damagedata.attacker;
            
            if ( !isdefined( curattacker ) || !utility::callsharedfunc( #"player", #"playersareenemies", curattacker, occupant ) )
            {
                curattacker = occupant;
            }
            
            occupant.donotmodifydamage = 1;
            var_27df2a3c3c4a1852 = 0;
            
            if ( isbrgamemode() && occupant.isjuggernaut )
            {
                if ( isdefined( occupant.juggcontext.juggconfig.vehiclecankillhealth ) && occupant.health > occupant.juggcontext.juggconfig.vehiclecankillhealth )
                {
                    var_27df2a3c3c4a1852 = 1;
                }
            }
            
            if ( !var_27df2a3c3c4a1852 && occupant utility::callsharedfunc( #"player", #"playerisalive" ) )
            {
                occupant thread function_5802afe15314e237( vehicle, curattacker, damagedata, meansofdeath );
                
                if ( isdefined( level.vehicleoccupantdeathcustomcallback ) )
                {
                    occupant thread [[ level.vehicleoccupantdeathcustomcallback ]]();
                }
            }
            
            occupant.donotmodifydamage = undefined;
            thread exit( vehicle, seatid, occupant, exitdata, 1 );
        }
    }
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0x412574b1, Offset: 0xd1de
// Size: 0xd8
function private function_5802afe15314e237( vehicle, curattacker, damagedata, meansofdeath )
{
    self endon( "death_or_disconnect" );
    origin = vehicle.origin;
    
    while ( self isvehicleactive() )
    {
        waitframe();
    }
    
    attacker = damagedata.attacker;
    inflictor = damagedata.inflictor;
    
    if ( !isdefined( attacker ) )
    {
        attacker = self.burndownattacker ?? self;
    }
    
    if ( !isdefined( attacker ) )
    {
        if ( isdefined( vehicle ) )
        {
            attacker = vehicle;
        }
        else
        {
            attacker = self;
        }
    }
    
    if ( !isdefined( inflictor ) )
    {
        inflictor = self;
    }
    
    self dodamage( self.maxhealth, origin, attacker, inflictor, meansofdeath, damagedata.objweapon, "torso_upper" );
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x5705cc72, Offset: 0xd2be
// Size: 0x473
function watch_riding( var_6aaf6e51f47e0df0, var_4594166c803842b9 )
{
    self notify( "42c03a133523ff40" );
    self endon( "42c03a133523ff40" );
    self endon( "death" );
    ref = vehicle::get_ref();
    self.onEndRiding = var_4594166c803842b9;
    onStartRiding = var_6aaf6e51f47e0df0 ?? utility::getsharedfunc( ref, #"onStartRiding" );
    onEndRiding = var_4594166c803842b9 ?? utility::getsharedfunc( ref, #"onEndRiding" );
    isInInterior = utility::getsharedfunc( ref, #"isInInterior" );
    onEnterInterior = utility::getsharedfunc( ref, #"onEnterInterior" );
    onExitInterior = utility::getsharedfunc( ref, #"onExitInterior" );
    hasinterior = isdefined( isInInterior );
    self.ridingplayers = [];
    prevonground = self vehicle_isonground();
    
    while ( true )
    {
        onground = self vehicle_isonground();
        validridingplayers = [];
        
        foreach ( player in utility::playersnear( self.origin, 550 ) )
        {
            if ( isdefined( player ) && isdefined( player.guid ) && istrue( player utility::callsharedfunc( #"player", #"playerisalive" ) ) && !player isvehicleactive() && function_dbf7952d671b64c( player, self ) && ( !function_b62197cd00c317bf( player.origin ) || player ishanging() || player ismantling() ) )
            {
                validridingplayers[ player.guid ] = 1;
                
                if ( !isdefined( self.ridingplayers[ player.guid ] ) )
                {
                    self.ridingplayers[ player.guid ] = player;
                    [[ onStartRiding ]]( player );
                    
                    if ( !onground )
                    {
                        player function_19e78a15b22e4a8c();
                    }
                }
                
                if ( hasinterior )
                {
                    ininterior = [[ isInInterior ]]( player );
                    
                    if ( !player.var_ee5e928d943532a4 && ininterior )
                    {
                        [[ onEnterInterior ]]( player );
                    }
                    else if ( player.var_ee5e928d943532a4 && !ininterior )
                    {
                        [[ onExitInterior ]]( player );
                    }
                    
                    player.var_ee5e928d943532a4 = ininterior;
                }
            }
        }
        
        foreach ( guid, player in self.ridingplayers )
        {
            if ( !validridingplayers[ guid ] )
            {
                self.ridingplayers[ guid ] = undefined;
                [[ onEndRiding ]]( player );
                
                if ( isdefined( player ) )
                {
                    player function_998629932390cbc4();
                }
                
                if ( hasinterior )
                {
                    if ( player.var_ee5e928d943532a4 )
                    {
                        [[ onExitInterior ]]( player );
                    }
                    
                    if ( isdefined( player ) )
                    {
                        player.var_ee5e928d943532a4 = undefined;
                    }
                }
            }
        }
        
        if ( onground != prevonground )
        {
            if ( !onground )
            {
                foreach ( player in self.ridingplayers )
                {
                    player function_19e78a15b22e4a8c();
                }
            }
            else
            {
                foreach ( player in self.ridingplayers )
                {
                    player function_998629932390cbc4();
                }
            }
        }
        
        prevonground = onground;
        wait 0.25;
    }
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x1f9818b8, Offset: 0xd739
// Size: 0x8d, Type: bool
function function_dbf7952d671b64c( player, vehicleplatform )
{
    if ( isdefined( vehicleplatform ) && vehicleplatform vehicle::is_vehicle() )
    {
        playerplatform = function_bfb3bb62a0e41e66( player );
        
        if ( isdefined( playerplatform ) && playerplatform == vehicleplatform )
        {
            return true;
        }
    }
    
    playerplatformparent = player getmovingplatformparent();
    
    if ( isdefined( vehicleplatform.e_navmesh ) && isdefined( vehicleplatform ) && isdefined( playerplatformparent ) && playerplatformparent == vehicleplatform.e_navmesh )
    {
        return true;
    }
    
    return false;
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x20607e60, Offset: 0xd7cf
// Size: 0x5a
function function_bfb3bb62a0e41e66( player )
{
    if ( !isdefined( player ) )
    {
        return undefined;
    }
    
    vehicleplatform = player getmovingplatformparent();
    var_9afee6fc5874bbdf = function_e960790b424f8b5a( player );
    
    if ( isdefined( var_9afee6fc5874bbdf ) )
    {
        vehicleplatform = var_9afee6fc5874bbdf;
    }
    
    if ( isdefined( vehicleplatform ) && !vehicleplatform vehicle::is_vehicle() )
    {
        return undefined;
    }
    
    return vehicleplatform;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0x14960aa8, Offset: 0xd832
// Size: 0x46
function function_d95c5411816227d7( player, vehicle )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( isdefined( vehicle ) && vehicle vehicle::is_vehicle() )
    {
        player.var_c36ea1f016ec4571 = vehicle;
        player thread function_5fc0961df3cdc5a6();
    }
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xe627dee2, Offset: 0xd880
// Size: 0x2c
function private function_5fc0961df3cdc5a6()
{
    self endon( "disconnect" );
    self endon( "disabled_force_ride" );
    level endon( "game_ended" );
    self waittill( "death" );
    self.var_c36ea1f016ec4571 = undefined;
}

// Namespace vehicle_occupancy
// Params 2
// Checksum 0xdfa5c688, Offset: 0xd8b4
// Size: 0x7b
function function_1ad9f175c154a56e( player, vehicle )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( isdefined( vehicle ) && vehicle vehicle::is_vehicle() )
    {
        if ( player utility::callsharedfunc( #"player", #"playerisalive" ) )
        {
            player dontinterpolate();
            player function_b24bb8a9e05f54bc( player.origin, vehicle );
            player notify( "disabled_force_ride" );
        }
    }
    
    player.var_c36ea1f016ec4571 = undefined;
}

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0x52169ca9, Offset: 0xd937
// Size: 0x20
function private function_e960790b424f8b5a( player )
{
    if ( !isdefined( player ) )
    {
        return undefined;
    }
    
    return player.var_c36ea1f016ec4571;
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x79483f53, Offset: 0xd960
// Size: 0xc, Type: bool
function function_741aeb8f4070df2e()
{
    return isdefined( self.enginedisabled );
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0xcef14903, Offset: 0xd975
// Size: 0x55
function enable_engine()
{
    if ( !isdefined( self.enginedisabled ) )
    {
        assertmsg( isdefined( self.enginedisabled ), "<dev string:x1010>" );
        return;
    }
    
    self.enginedisabled -= 1;
    
    if ( self.enginedisabled <= 0 )
    {
        self.enginedisabled = undefined;
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x8d42271c, Offset: 0xd9d2
// Size: 0x36
function disable_engine()
{
    if ( !isdefined( self.enginedisabled ) )
    {
        self.enginedisabled = 0;
    }
    
    self.enginedisabled += 1;
    function_d96c2b596c63c80e();
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x49bcbac9, Offset: 0xda10
// Size: 0x23
function function_b901181db6fc2774()
{
    if ( !function_741aeb8f4070df2e() )
    {
        if ( !vehicle::is_static() )
        {
            self vehicle_turnengineon();
        }
        
        vehicle_interact::function_867ea9d5b4458d20();
    }
}

// Namespace vehicle_occupancy
// Params 0
// Checksum 0x7fbbe5ec, Offset: 0xda3b
// Size: 0x19
function function_d96c2b596c63c80e()
{
    if ( !vehicle::is_static() )
    {
        self vehicle_turnengineoff();
    }
    
    vehicle_interact::function_e3ff6fb751c623a();
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x17026a32, Offset: 0xda5c
// Size: 0xf1, Type: bool
function function_6b3a6137e14e34e2( point )
{
    if ( !function_63c6c86801e0685c() )
    {
        return false;
    }
    
    localorigin = coordtransformtranspose( point, self.origin, self.angles );
    leveldataforvehicle = get_data( vehicle::get_ref() );
    return localorigin[ 0 ] > leveldataforvehicle.exitextents[ "back" ] * -1 && localorigin[ 0 ] < leveldataforvehicle.exitextents[ "front" ] && localorigin[ 1 ] > leveldataforvehicle.exitextents[ "left" ] * -1 && localorigin[ 1 ] < leveldataforvehicle.exitextents[ "right" ] && localorigin[ 2 ] > leveldataforvehicle.exitextents[ "bottom" ] * -1 && localorigin[ 2 ] < leveldataforvehicle.exitextents[ "top" ];
}

// Namespace vehicle_occupancy
// Params 1
// Checksum 0x524eb227, Offset: 0xdb56
// Size: 0x6b, Type: bool
function function_b62197cd00c317bf( point )
{
    if ( !function_63c6c86801e0685c() )
    {
        return false;
    }
    
    localorigin = coordtransformtranspose( point, self.origin, self.angles );
    leveldataforvehicle = get_data( vehicle::get_ref() );
    return localorigin[ 2 ] < leveldataforvehicle.exitextents[ "bottom" ] * -1;
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0x23dc830a, Offset: 0xdbca
// Size: 0x2b
function private init_debug()
{
    leveldata = get_level_data();
    leveldata.debuginstances = [];
    
    /#
        thread monitor_debug();
    #/
}

/#

    // Namespace vehicle_occupancy
    // Params 0, eflags: 0x4
    // Checksum 0xc38ca936, Offset: 0xdbfd
    // Size: 0x34f, Type: dev
    function private monitor_debug()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        leveldata = get_level_data();
        wait 5;
        setdevdvarifuninitialized( @"hash_2de891db9eeac685", 0 );
        setdevdvarifuninitialized( @"hash_6c296dda80496851", 0 );
        setdevdvarifuninitialized( @"hash_fdf60fe90077b559", 0 );
        setdevdvarifuninitialized( @"hash_a864c803709b59ce", 0 );
        
        while ( true )
        {
            if ( getdvarint( @"hash_5dd683c4da86681e", 0 ) > 0 )
            {
                level.debugvehicleexit = 1;
            }
            else
            {
                level.debugvehicleexit = undefined;
            }
            
            foreach ( vehicle in leveldata.debuginstances )
            {
                if ( !isdefined( vehicle ) )
                {
                    continue;
                }
                
                if ( level.debugvehicleexit )
                {
                    exitboundinginfo = function_5bd5cec128647eac( vehicle );
                }
            }
            
            host = undefined;
            
            if ( utility::issharedfuncdefined( #"game", #"gethostplayer" ) )
            {
                host = [[ utility::getsharedfunc( #"game", #"gethostplayer" ) ]]();
            }
            
            if ( isdefined( host ) )
            {
                function_934da7e52c45e47c( host );
            }
            
            if ( getdvarint( @"hash_fdf60fe90077b559", 0 ) == 1 )
            {
                setdvar( @"hash_fdf60fe90077b559", 0 );
                
                if ( isdefined( level.botvehicle ) && ( isdefined( level.friendlyvehiclebot ) || isdefined( level.enemyvehiclebot ) ) )
                {
                    bot = level.friendlyvehiclebot ?? level.enemyvehiclebot;
                    bot utility::callsharedfunc( #"bots", #"botpressbutton", "<dev string:x1066>" );
                }
            }
            
            if ( getdvarint( @"hash_a864c803709b59ce", 0 ) == 1 )
            {
                setdvar( @"hash_a864c803709b59ce", 0 );
                
                if ( isdefined( level.botvehicle ) && ( isdefined( level.friendlyvehiclebot ) || isdefined( level.enemyvehiclebot ) ) )
                {
                    bot = level.friendlyvehiclebot ?? level.enemyvehiclebot;
                    bot utility::callsharedfunc( #"bots", #"botpressbutton", "<dev string:x106e>" );
                }
            }
            
            if ( getdvarint( @"hash_6c296dda80496851", 0 ) == 1 )
            {
                setdvar( @"hash_6c296dda80496851", 0 );
                
                if ( isdefined( level.botvehicle ) && ( isdefined( level.friendlyvehiclebot ) || isdefined( level.enemyvehiclebot ) ) )
                {
                    bot = level.friendlyvehiclebot ?? level.enemyvehiclebot;
                    seatid = function_338f50d73ebf6fe4( level.botvehicle, bot );
                    
                    if ( isdefined( seatid ) )
                    {
                        switchseatid = function_79f80964bb18e6c6( level.botvehicle, bot, seatid );
                        
                        if ( isdefined( switchseatid ) )
                        {
                            enter( level.botvehicle, switchseatid, bot );
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace vehicle_occupancy
// Params 1, eflags: 0x4
// Checksum 0xbb862260, Offset: 0xdf54
// Size: 0x15d
function private function_67fabdb37c99a2d4( boundinginfo )
{
    /#
        if ( level.debugvehicleexit )
        {
            thread debug::function_5216f7041907b4f3( boundinginfo.orientedboxpoints[ "<dev string:xde4>" ], boundinginfo.orientedboxpoints[ "<dev string:xdf4>" ], boundinginfo.orientedboxpoints[ "<dev string:xe05>" ], boundinginfo.orientedboxpoints[ "<dev string:xe14>" ], boundinginfo.orientedboxpoints[ "<dev string:xe24>" ], boundinginfo.orientedboxpoints[ "<dev string:xe37>" ], boundinginfo.orientedboxpoints[ "<dev string:xe4b>" ], boundinginfo.orientedboxpoints[ "<dev string:xe5d>" ], 0.05, ( 1, 1, 1 ) );
            thread debug::function_5216f7041907b4f3( boundinginfo.unorientedboxpoints[ "<dev string:xde4>" ], boundinginfo.unorientedboxpoints[ "<dev string:xdf4>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe05>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe14>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe24>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe37>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe4b>" ], boundinginfo.unorientedboxpoints[ "<dev string:xe5d>" ], 0.05, ( 1, 1, 0 ) );
        }
    #/
}

// Namespace vehicle_occupancy
// Params 0, eflags: 0x4
// Checksum 0xcfe91680, Offset: 0xe0b9
// Size: 0xa
function private function_d0b91dc395312ace()
{
    level notify( "dbgVehExit" );
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xe72ec54, Offset: 0xe0cb
// Size: 0x48
function private function_5a2af62439f0d42c( start, end, drawtimeseconds, color )
{
    /#
        if ( level.debugvehicleexit )
        {
            debug::line( start, end, color, drawtimeseconds, "<dev string:x1077>" );
        }
    #/
}

// Namespace vehicle_occupancy
// Params 4, eflags: 0x4
// Checksum 0xe5237056, Offset: 0xe11b
// Size: 0x48
function private function_daa8eeffc9a97683( origin, radius, drawtimeseconds, color )
{
    /#
        if ( level.debugvehicleexit )
        {
            debug::sphere( origin, radius, color, drawtimeseconds, "<dev string:x1077>" );
        }
    #/
}

/#

    // Namespace vehicle_occupancy
    // Params 7, eflags: 0x4
    // Checksum 0xc399cdce, Offset: 0xe16b
    // Size: 0xb6, Type: dev
    function private function_fab637e91697ac1( pos, radius, height, angles, color, depthtest, duration )
    {
        if ( level.debugvehicleexit )
        {
            level endon( "<dev string:x1077>" );
            drawframes = int( ceil( 0.05 / level.framedurationseconds ) );
            endtime = gettime() + duration * 1000;
            
            while ( gettime() < endtime )
            {
                level childthread utility::draw_capsule( pos, radius, height, angles, color, depthtest, drawframes );
                wait 0.05;
            }
        }
    }

#/

// Namespace vehicle_occupancy
// Params 5, eflags: 0x4
// Checksum 0x9377655f, Offset: 0xe229
// Size: 0x121
function private function_94553a295e176da5( origin, otherorigin, radius, drawtimeseconds, color )
{
    /#
        if ( level.debugvehicleexit )
        {
            debug::sphere( origin, radius, color, drawtimeseconds, "<dev string:x1077>" );
            debug::sphere( otherorigin, radius, color, drawtimeseconds, "<dev string:x1077>" );
            
            foreach ( offset in [ ( radius, 0, 0 ), ( -1 * radius, 0, 0 ), ( 0, radius, 0 ), ( 0, -1 * radius, 0 ), ( 0, 0, radius ), ( 0, 0, -1 * radius ) ] )
            {
                debug::line( origin + offset, otherorigin + offset, color, drawtimeseconds, "<dev string:x1077>" );
            }
        }
    #/
}

/#

    // Namespace vehicle_occupancy
    // Params 1, eflags: 0x4
    // Checksum 0xf132e3d8, Offset: 0xe352
    // Size: 0x37d, Type: dev
    function private function_934da7e52c45e47c( host )
    {
        switchseat = 0;
        addid = getdvarint( @"hash_2de891db9eeac685", 0 );
        bot = undefined;
        
        if ( !isdefined( level.botvehicle ) || level.botvehicle.isdestroyed )
        {
            level.botvehicle = undefined;
        }
        
        if ( addid == 0 )
        {
            return;
        }
        
        if ( isdefined( level.botvehicle ) )
        {
            switch ( addid )
            {
                case 1:
                    setdevdvar( @"hash_2de891db9eeac685", 0 );
                    bot = level.friendlyvehiclebot;
                    
                    if ( isdefined( bot ) && !utility::callsharedfunc( #"player", #"playersareenemies", bot, host ) )
                    {
                        if ( isdefined( level.botvehicle ) )
                        {
                            botvehicle = bot vehicle::get_vehicle();
                            
                            if ( isdefined( botvehicle ) )
                            {
                                if ( botvehicle == level.botvehicle )
                                {
                                    switchseat = 1;
                                    break;
                                }
                                else
                                {
                                    bot = undefined;
                                }
                            }
                        }
                    }
                    
                    if ( !isdefined( bot ) )
                    {
                        players = utility::callsharedfunc( #"team_utility", #"getfriendlyplayers", host.team, 1 );
                        
                        if ( isdefined( players ) )
                        {
                            foreach ( player in players )
                            {
                                if ( !isbot( player ) )
                                {
                                    continue;
                                }
                                
                                bot = player;
                                break;
                            }
                        }
                    }
                    
                    level.friendlyvehiclebot = bot;
                    break;
                case 2:
                    setdevdvar( @"hash_2de891db9eeac685", 0 );
                    bot = level.enemyvehiclebot;
                    
                    if ( isdefined( bot ) && utility::callsharedfunc( #"player", #"playersareenemies", bot, host ) )
                    {
                        if ( isdefined( level.botvehicle ) )
                        {
                            botvehicle = bot vehicle::get_vehicle();
                            
                            if ( isdefined( botvehicle ) )
                            {
                                if ( botvehicle == level.botvehicle )
                                {
                                    switchseat = 1;
                                    break;
                                }
                                else
                                {
                                    bot = undefined;
                                }
                            }
                        }
                    }
                    
                    if ( !isdefined( bot ) )
                    {
                        players = utility::callsharedfunc( #"team_utility", #"getenemyplayers", host.team, 1 );
                        
                        if ( isdefined( players ) )
                        {
                            foreach ( player in players )
                            {
                                if ( !isbot( player ) )
                                {
                                    continue;
                                }
                                
                                bot = player;
                                break;
                            }
                        }
                    }
                    
                    level.enemyvehiclebot = bot;
                    break;
                default:
                    return;
            }
            
            if ( isdefined( bot ) )
            {
                if ( switchseat )
                {
                    function_614f3895e4c2ecf8( bot );
                }
                else
                {
                    function_e52de0cdff6aa50a( host, bot );
                }
            }
            else if ( addid != 0 )
            {
                iprintln( "<dev string:x1085>" );
            }
        }
        else if ( addid != 0 )
        {
            iprintln( "<dev string:x10a2>" );
        }
        
        setdevdvar( @"hash_2de891db9eeac685", 0 );
    }

    // Namespace vehicle_occupancy
    // Params 2, eflags: 0x4
    // Checksum 0x994121ac, Offset: 0xe6d7
    // Size: 0xfd, Type: dev
    function private function_e52de0cdff6aa50a( host, bot )
    {
        if ( utility::issharedfuncdefined( #"game", #"gethostplayer" ) )
        {
            host = [[ utility::getsharedfunc( #"game", #"gethostplayer" ) ]]();
        }
        
        if ( !isdefined( host ) )
        {
            return 0;
        }
        
        vehicle = level.botvehicle;
        
        if ( !isdefined( vehicle ) || vehicle.isdestroyed )
        {
            iprintln( "<dev string:x10a2>" );
            return 0;
        }
        
        occupants = function_b6077e40739ebc4b( vehicle );
        hostvehicle = host vehicle::get_vehicle();
        
        if ( vehicle::function_8266feb1ae1c46bd( vehicle, bot ) )
        {
            if ( occupants.size > 1 )
            {
                iprintln( "<dev string:x10c1>" );
                return 0;
            }
            else if ( isdefined( hostvehicle ) && hostvehicle == vehicle )
            {
                return function_a3fa19aa45807445( vehicle, bot, host );
            }
            
            return;
        }
        
        return function_dd1b574a9998bd15( vehicle, bot );
    }

    // Namespace vehicle_occupancy
    // Params 3, eflags: 0x4
    // Checksum 0x88bd1483, Offset: 0xe7dc
    // Size: 0xce, Type: dev
    function private function_a3fa19aa45807445( vehicle, bot, host )
    {
        vehicle_interact::allow_use( vehicle, 0 );
        thread function_e63376f7546b7cb8( vehicle );
        
        while ( true )
        {
            if ( !isdefined( host ) )
            {
                break;
            }
            
            if ( !isdefined( bot ) )
            {
                break;
            }
            
            if ( !isdefined( vehicle ) )
            {
                break;
            }
            
            hostvehicle = host vehicle::get_vehicle();
            
            if ( !isdefined( hostvehicle ) || hostvehicle != vehicle )
            {
                break;
            }
            
            waitframe();
        }
        
        if ( !isdefined( vehicle ) || vehicle.isdestroyed )
        {
            iprintln( "<dev string:x10db>" );
            return 0;
        }
        else
        {
            vehicle_interact::allow_use( vehicle, 1 );
        }
        
        if ( !isdefined( bot ) )
        {
            iprintln( "<dev string:x10db>" );
            return 0;
        }
        
        return function_dd1b574a9998bd15( vehicle, bot );
    }

    // Namespace vehicle_occupancy
    // Params 1, eflags: 0x4
    // Checksum 0x9ec1848c, Offset: 0xe8b2
    // Size: 0x8e, Type: dev
    function private function_614f3895e4c2ecf8( bot )
    {
        vehicle = level.botvehicle;
        
        if ( !isdefined( vehicle ) || vehicle.isdestroyed )
        {
            iprintln( "<dev string:x10a2>" );
            return 0;
        }
        
        seatid = function_338f50d73ebf6fe4( vehicle, bot );
        switchseatid = function_79f80964bb18e6c6( vehicle, bot, seatid );
        
        if ( !isdefined( switchseatid ) )
        {
            iprintln( "<dev string:x10f8>" );
            return 0;
        }
        
        thread enter( vehicle, switchseatid, bot );
        return 1;
    }

    // Namespace vehicle_occupancy
    // Params 2, eflags: 0x4
    // Checksum 0x511d3333, Offset: 0xe948
    // Size: 0xe0, Type: dev
    function private function_dd1b574a9998bd15( vehicle, bot )
    {
        pointrefs = vehicle_interact::function_ec354bb85bc131b2( vehicle );
        state = vehicle_interact::function_3099e0a58dde7fff();
        
        foreach ( part in pointrefs )
        {
            if ( isdefined( bot vehicle::get_vehicle() ) )
            {
                break;
            }
            
            vehicle_interact::scriptable_used( vehicle getlinkedscriptableinstance(), part, state, bot, 0 );
        }
        
        if ( !isdefined( bot vehicle::get_vehicle() ) )
        {
            iprintln( "<dev string:x10db>" );
            return 0;
        }
        
        return 1;
    }

#/
