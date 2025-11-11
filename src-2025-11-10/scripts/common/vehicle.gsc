#using script_4880fce3c83f33ef;
#using scripts\common\battle_tracks;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\vehicle_ai;
#using scripts\common\vehicle_aianim;
#using scripts\common\vehicle_build;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_collision;
#using scripts\common\vehicle_compass;
#using scripts\common\vehicle_damage;
#using scripts\common\vehicle_dlog;
#using scripts\common\vehicle_interact;
#using scripts\common\vehicle_lights;
#using scripts\common\vehicle_mines;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_omnvar_utility;
#using scripts\common\vehicle_paths;
#using scripts\common\vehicle_spawn;
#using scripts\common\vehicle_tracking;
#using scripts\engine\flags;
#using scripts\engine\math;
#using scripts\engine\scriptable;
#using scripts\engine\utility;

#namespace vehicle;

// Namespace vehicle
// Params 0
// Checksum 0x1ffea004, Offset: 0xa61
// Size: 0x45f
function init()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515", 0 ) )
    {
        return;
    }
    
    if ( getdvarint( @"hash_742caa13b3c2e685" ) )
    {
        return;
    }
    
    if ( !isdefined( level.vehicle ) )
    {
        level.vehicle = spawnstruct();
    }
    
    level.vehicle.weapons = [];
    level.vehicle.var_235af58a8cf6d697 = [];
    utility::callsharedfunc( #"vehicle", #"init" );
    
    if ( getdvarint( @"t10" ) > 0 )
    {
        level.shouldinitvehicles = 1;
    }
    
    if ( !isdefined( level.shouldinitvehicles ) )
    {
        level.shouldinitvehicles = 0;
    }
    
    if ( level.projectbundle.var_53c4124af039142e )
    {
        vehicles = function_76d195c6ec9bc1d();
        level.shouldinitvehicles |= vehicles.size > 0;
    }
    else
    {
        bundlenames = getscriptbundlenames( "vehiclebundle" );
        level.shouldinitvehicles |= bundlenames.size > 0;
    }
    
    vehicle_code::vehicle_setuplevelvariables();
    
    if ( level.shouldinitvehicles )
    {
        init_match_rules();
        vehicle_interact::init();
        vehicle_occupancy::init();
        vehicle_tracking::init();
        vehicle_mines::init();
        vehicle_damage::init();
        vehicle_spawn::init();
        vehicle_compass::init();
        vehicle_collision::init();
        battle_tracks::init();
        level thread function_3514523fc0e8de31();
        level thread function_267607a4777d0bd4();
        callback::add( #"player_connect", &onplayerconnect );
        
        if ( isdefined( level.var_1690badca6ae7ed3 ) )
        {
            foreach ( func in level.var_1690badca6ae7ed3 )
            {
                [[ func ]]();
            }
        }
        
        if ( level.projectbundle.var_53c4124af039142e )
        {
            foreach ( vehicle in vehicles )
            {
                if ( has_data( vehicle ) )
                {
                    continue;
                }
                
                generic_init( vehicle );
            }
        }
        else
        {
            var_a865865fdaaac6b7 = [];
            
            foreach ( bundlename in bundlenames )
            {
                vehicleref = getscriptbundlefieldvalue( bundlename, #"ref" );
                
                if ( vehicleref )
                {
                    if ( !isdefined( var_a865865fdaaac6b7[ vehicleref ] ) )
                    {
                        var_a865865fdaaac6b7[ vehicleref ] = [];
                    }
                    
                    var_a865865fdaaac6b7[ vehicleref ][ var_a865865fdaaac6b7[ vehicleref ].size ] = bundlename;
                }
            }
            
            foreach ( vehicleref, bundles in var_a865865fdaaac6b7 )
            {
                var_d22966c7023ef211 = bundles[ 0 ];
                
                if ( bundles.size > 1 )
                {
                    bundlename = function_451bd53633bae879( vehicleref );
                    
                    if ( bundlename && arraycontains( bundles, bundlename ) )
                    {
                        var_d22966c7023ef211 = bundlename;
                    }
                }
                
                if ( !has_data( vehicleref ) )
                {
                    generic_init( var_d22966c7023ef211 );
                }
            }
        }
        
        function_63c2b3027681cb37();
        
        /#
            level thread vehicle_code::init_vehicle_spawn_devgui();
        #/
        
        level thread vehicle_spawn::function_e4d68d1fa03b6917();
        level.var_3985cc8cf0923257 = 1;
    }
    else
    {
        vehicle_tracking::init();
        vehicle_mines::init();
        vehicle_damage::init();
        vehicle_spawn::init();
        vehicle_compass::init();
    }
    
    utility::flag_set( "vehicle_init_done" );
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x5556f182, Offset: 0xec8
// Size: 0x5f
function private init_match_rules()
{
    if ( utility::callsharedfunc( #"game", #"isusingmatchrulesdata" ) )
    {
        level.invulnerablehusks = utility::callsharedfunc( #"game", #"getmatchrulesdata", "commonOption", "vehicleInvulnerableHusks" );
    }
    
    if ( !isdefined( level.invulnerablehusks ) )
    {
        level.invulnerablehusks = 1;
    }
}

// Namespace vehicle
// Params 2
// Checksum 0x66a60ba0, Offset: 0xf2f
// Size: 0xf9
function function_f65b95a75df8d4e7( vehicleref, func )
{
    if ( !vehicleref )
    {
        println( "<dev string:x24>" );
        return;
    }
    
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    level.shouldinitvehicles = 1;
    
    if ( function_fb31e35a4605fff3( vehicleref ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_1690badca6ae7ed3 ) )
    {
        level.var_1690badca6ae7ed3 = [];
    }
    
    level.var_1690badca6ae7ed3[ vehicleref ] = func;
    
    if ( level.var_3985cc8cf0923257 )
    {
        [[ func ]]();
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x420c8eb4, Offset: 0x1030
// Size: 0x26, Type: bool
function function_fb31e35a4605fff3( vehicleref )
{
    return isdefined( level.var_1690badca6ae7ed3 ) && isdefined( level.var_1690badca6ae7ed3[ vehicleref ] );
}

// Namespace vehicle
// Params 1
// Checksum 0xf46abdcb, Offset: 0x105f
// Size: 0xe9
function force_init( vehicleref )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( level.forceinitvehiclerefs ) )
    {
        level.forceinitvehiclerefs = [];
    }
    
    level.forceinitvehiclerefs[ vehicleref ] = 1;
    
    if ( function_fb31e35a4605fff3( vehicleref ) && level.var_3985cc8cf0923257 && !is_loaded( vehicleref ) )
    {
        [[ level.var_1690badca6ae7ed3[ vehicleref ] ]]();
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x3de44a26, Offset: 0x1150
// Size: 0xe, Type: bool
function should_init( vehicleref )
{
    return true;
}

// Namespace vehicle
// Params 1
// Checksum 0x2f560fdf, Offset: 0x1167
// Size: 0x21
function function_ce37932c0f5e0c24( scriptfilename )
{
    function_4e9c5f2000e7e85e();
    return level.var_2a529f84b070fefa[ scriptfilename ][ 0 ];
}

// Namespace vehicle
// Params 1
// Checksum 0x388141eb, Offset: 0x1191
// Size: 0x1f
function function_c6ddf8290297c267( scriptfilename )
{
    function_4e9c5f2000e7e85e();
    return level.var_2a529f84b070fefa[ scriptfilename ];
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0xe994e289, Offset: 0x11b9
// Size: 0x10f
function private function_4e9c5f2000e7e85e()
{
    var_7237854e3be197ca = level.var_6a653785b40ad016;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    level.var_2a529f84b070fefa = [];
    
    foreach ( vehicle in function_76d195c6ec9bc1d() )
    {
        scriptfilename = function_568f797e7642c672( "vehicle", vehicle ).bundle.scriptfilename;
        
        if ( !scriptfilename )
        {
            continue;
        }
        
        if ( !isdefined( level.var_2a529f84b070fefa[ getxhash( scriptfilename ) ] ) )
        {
            level.var_2a529f84b070fefa[ getxhash( scriptfilename ) ] = [];
        }
        
        level.var_2a529f84b070fefa[ getxhash( scriptfilename ) ][ level.var_2a529f84b070fefa[ getxhash( scriptfilename ) ].size ] = vehicle;
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x3e317a60, Offset: 0x12d0
// Size: 0x1f
function function_c9d59ae50eee9bb1( scriptfilename )
{
    function_35e882996b45b93a();
    return level.var_6a653785b40ad016[ scriptfilename ];
}

// Namespace vehicle
// Params 1
// Checksum 0x48d0d56c, Offset: 0x12f8
// Size: 0x1f
function function_df320a3328c73fb5( scriptfilename )
{
    function_35e882996b45b93a();
    return level.var_96176789ab31fa08[ scriptfilename ];
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0xf1f307fc, Offset: 0x1320
// Size: 0x1d0
function private function_35e882996b45b93a()
{
    if ( level.var_6a653785b40ad016 )
    {
        return;
    }
    
    level.var_6a653785b40ad016 = [];
    level.var_96176789ab31fa08 = [];
    
    foreach ( bundlename in getscriptbundlenames( "vehiclebundle" ) )
    {
        bundle = function_431e68bd95544217( bundlename, [ #"scriptfilename", #"vehicle", #"ref" ] );
        bundle = { #ref:bundle.ref, #vehicle:bundle.vehicle, #scriptfilename:bundle.scriptfilename };
        
        if ( !bundle.scriptfilename || !bundle.ref )
        {
            continue;
        }
        
        hashfilename = getxhash( bundle.scriptfilename );
        
        if ( !isdefined( level.var_96176789ab31fa08[ hashfilename ] ) )
        {
            level.var_96176789ab31fa08[ hashfilename ] = [];
        }
        
        if ( !level.var_96176789ab31fa08[ hashfilename ][ bundle.ref ] )
        {
            bundlename = function_451bd53633bae879( bundle.ref );
            
            if ( bundlename )
            {
                level.var_96176789ab31fa08[ hashfilename ][ bundle.ref ] = bundlename;
                
                if ( !isdefined( level.var_6a653785b40ad016[ hashfilename ] ) )
                {
                    level.var_6a653785b40ad016[ hashfilename ] = bundlename;
                }
            }
        }
    }
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0x58706ed9, Offset: 0x14f8
// Size: 0x28
function private function_b1607ea19947d420( bundlename )
{
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    bundle = getscriptbundle( bundlename );
    return bundle;
}

// Namespace vehicle
// Params 2, eflags: 0x4
// Checksum 0x75b1e3cc, Offset: 0x1529
// Size: 0x3a
function private function_431e68bd95544217( bundlename, fields )
{
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    if ( !isdefined( fields ) )
    {
        return;
    }
    
    bundle = getscriptbundlefieldvalues( bundlename, fields );
    return bundle;
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x95341a4f, Offset: 0x156c
// Size: 0x219
function private function_77df346ea26d98d3()
{
    utility::flag_wait( "scriptables_ready" );
    
    if ( level.gamemodebundle.var_4c5f178584c92e9b && getprojectname() != "T10" )
    {
        level.gamemodebundle.var_4c5f178584c92e9b = 0;
        assertmsg( "<dev string:xda>" );
        return;
    }
    
    if ( !level.gamemodebundle.var_4c5f178584c92e9b )
    {
        return;
    }
    
    params = spawnstruct();
    params.vehicle = self;
    callback::callback( "on_vehicle_spawned", params );
    vehiclebundle = undefined;
    
    if ( !isdefined( vehiclebundle ) )
    {
        return;
    }
    
    vehicleref = vehiclebundle.ref;
    
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !isdefined( vehicleref ) || !is_loaded( vehicleref ) )
    {
        return;
    }
    
    level callback::callback( "onVehicleSpawned", params );
    spawndata = spawnstruct();
    spawndata.origin = self.origin;
    spawndata.angles = self.angles;
    spawndata.spawntype = "LEVEL";
    
    if ( isdefined( self.var_4ae4f42e05dc7b41 ) )
    {
        spawndata.var_4ae4f42e05dc7b41 = self.var_4ae4f42e05dc7b41;
    }
    
    spawndata.initai = 1;
    
    if ( utility::issharedfuncdefined( vehicleref, #"spawn" ) )
    {
        [[ utility::getsharedfunc( vehicleref, #"spawn" ) ]]( spawndata, undefined );
        return;
    }
    
    function_66838ba16389a6cd( vehicleref, spawndata, self );
}

// Namespace vehicle
// Params 3
// Checksum 0x3f910920, Offset: 0x178d
// Size: 0x2cd
function function_66838ba16389a6cd( vehicleref, spawndata, vehicle )
{
    if ( level.gamemodebundle.var_4c5f178584c92e9b && getprojectname() != "T10" )
    {
        level.gamemodebundle.var_4c5f178584c92e9b = 0;
        assertmsg( "<dev string:x162>" );
        return;
    }
    
    if ( !level.gamemodebundle.var_4c5f178584c92e9b )
    {
        return;
    }
    
    if ( !is_loaded( vehicleref ) )
    {
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x1ee>" + vehicleref );
            }
        #/
        
        return undefined;
    }
    else
    {
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x21e>" + vehicleref );
            }
        #/
    }
    
    if ( !vehicle_tracking::function_a50a15927bf945c1( spawndata ) )
    {
        return undefined;
    }
    
    callback::callback( #"hash_6fd98c62c8521a60", { #spawndata:spawndata, #vehicleref:vehicleref } );
    spawndata = vehicle_spawn::function_de8a2dba98bdeb4e( vehicleref, spawndata );
    vehicle.targetname = spawndata.script_vehicleref;
    spawndata.vehicletype = vehicle.vehicletype;
    vehicle.spawndata = spawndata;
    create( vehicle, vehicleref, spawndata );
    vehicledata = get_data( vehicleref );
    vehicle.objweapon = makeweapon( vehicle_damage::function_bbb46fd1c4790a39( vehicleref ) );
    vehicle_compass::register_instance( vehicle );
    utility::callsharedfunc( vehicleref, #"create", vehicle );
    vehicle thread function_2f34d1b2e8c87f53( istrue( vehicledata.isboat ) );
    vehicle thread function_23cb77ee148dd43a();
    
    if ( !vehicledata.interact.var_9b6fcf3000287a03 )
    {
        vehicle thread watch_flipped();
    }
    
    vehicle thread vehicle_code::function_123d1d60a34593b();
    
    if ( vehicledata.isboat )
    {
        vehicle function_c21d39b1929f7cb1( -1, level.var_cb8ff8f046da9128 ?? 100 );
    }
    else if ( !vehicle function_5bf8fedff42637e2() )
    {
        vehicle thread watch_floating();
    }
    
    if ( utility::function_6eafaf04149c97d4() && vehicledata.ai.supportsai && spawndata.initai )
    {
        vehicle vehicle_ai::function_76f7ea069893edd2( vehicledata );
    }
    
    /#
        if ( level.debugvehiclespawns )
        {
            println( "<dev string:x24c>" + vehicleref );
        }
    #/
    
    if ( utility::issharedfuncdefined( vehicleref, #"onStartRiding" ) && utility::issharedfuncdefined( vehicleref, #"onEndRiding" ) )
    {
        vehicle thread vehicle_occupancy::watch_riding();
    }
    
    if ( utility::issp() )
    {
        vehicle thread vehicle_damage::function_94850857710e138d();
        vehicle thread vehicle_damage::function_7a749bb684749078();
    }
    
    create_late( vehicle, spawndata );
    return vehicle;
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x1469094, Offset: 0x1a63
// Size: 0x104
function private function_3514523fc0e8de31()
{
    while ( !isnavmeshloaded() )
    {
        waitframe();
    }
    
    waitframe();
    
    foreach ( layer in [ "vehicle_xl", "tank_med", "vehicle_large", "vehicle_med", "soldier" ] )
    {
        if ( !isnavmeshloaded( layer ) )
        {
            continue;
        }
        
        if ( !isdefined( level.var_edce145454d96942 ) )
        {
            level.var_edce145454d96942 = layer;
        }
        
        if ( arraycontains( [ "tank_med", "vehicle_large", "vehicle_med", "soldier" ], layer ) )
        {
            level.vehiclenavmeshlayer = layer;
            break;
        }
    }
}

// Namespace vehicle
// Params 0
// Checksum 0xc3888247, Offset: 0x1b6f
// Size: 0x1aa
function function_267607a4777d0bd4()
{
    while ( true )
    {
        level waittill( "vehicle_integrity_failure", unstablevehiclelist );
        
        foreach ( unstablevehiclenotification in unstablevehiclelist )
        {
            unstablevehicle = unstablevehiclenotification[ 0 ];
            reason = unstablevehiclenotification[ 1 ];
            
            /#
                entitynum = unstablevehicle getentitynumber();
                iprintln( "<dev string:x27b>" + entitynum + "<dev string:x2aa>" + ( unstablevehicle.vehiclename ?? "<dev string:x2b6>" ) + "<dev string:x2c3>" + reason );
            #/
            
            if ( unstablevehicle is_killstreak() )
            {
                /#
                    iprintln( "<dev string:x2d1>" + unstablevehicle.streakinfo.streakname + "<dev string:x304>" + unstablevehicle.vehiclename );
                #/
                
                killstreakintegrity = unstablevehicle.var_1ed880df52e3f6df;
                
                if ( isdefined( killstreakintegrity ) )
                {
                    unstablevehicle thread [[ killstreakintegrity.failurefunc ]]( reason );
                }
                
                continue;
            }
            
            if ( unstablevehicle is_vehicle() && has_data( unstablevehicle get_ref() ) )
            {
                unstablevehicle.dontspawnhusk = 1;
                
                if ( unstablevehicle.var_9dcda86f922283e3 )
                {
                    death( unstablevehicle );
                }
                else
                {
                    unstablevehicle explode();
                }
                
                continue;
            }
            
            unstablevehicle delete();
        }
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x770736e6, Offset: 0x1d21
// Size: 0x13
function onplayerconnect( params )
{
    thread function_146de6655a115201();
}

// Namespace vehicle
// Params 0
// Checksum 0x5b728e55, Offset: 0x1d3c
// Size: 0x2c
function function_146de6655a115201()
{
    self endon( "disconnect" );
    
    while ( true )
    {
        utility::waittill_any( "ascender_attached", "ascender_detached" );
        thread vehicle_collision::function_e3bc60c772acd609( undefined, self );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0x9ae5f986, Offset: 0x1d70
// Size: 0x52, Type: bool
function function_b4b334e3af2d4d0()
{
    if ( self && is_vehicle() )
    {
        ref = get_ref();
        
        if ( ref && has_data( ref ) )
        {
            return istrue( get_data( ref ).interact.var_decd8eab2bb412 );
        }
    }
    
    return false;
}

// Namespace vehicle
// Params 0
// Checksum 0xcf6d7592, Offset: 0x1dcb
// Size: 0x1e, Type: bool
function function_f644d495b20d4991()
{
    return isdefined( self.externalvehicle ) && isdefined( self ) && isdefined( self.externalvehicleturret );
}

// Namespace vehicle
// Params 4
// Checksum 0xf39f3262, Offset: 0x1df2
// Size: 0x89
function function_a05d337b5debcbc2( player, vehicle, turret, tag )
{
    player.externalvehicle = vehicle;
    player.externalvehicleturret = turret;
    player.externalvehicletag = tag;
    
    if ( !isdefined( vehicle.turretoccupants ) )
    {
        vehicle.turretoccupants = [];
    }
    
    vehicle.turretoccupants[ vehicle.turretoccupants.size ] = player;
}

// Namespace vehicle
// Params 2
// Checksum 0x9a87ef7b, Offset: 0x1e83
// Size: 0x59
function function_6acf5e1bc693a7e0( player, vehicle )
{
    if ( isdefined( player ) )
    {
        player.externalvehicle = undefined;
        player.externalvehicleturret = undefined;
        player.externalvehicletag = undefined;
    }
    
    vehicle.turretoccupants = arrayremove( vehicle.turretoccupants, player );
}

// Namespace vehicle
// Params 0
// Checksum 0xfa2f04a3, Offset: 0x1ee4
// Size: 0x55
function function_c62afb315b385563()
{
    if ( !function_f644d495b20d4991() )
    {
        return;
    }
    
    ref = self.externalvehicle get_ref();
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    self.externalvehicleturret utility::callsharedfunc( ref, #"exitexternalturret", self, self.externalvehicle );
}

// Namespace vehicle
// Params 0
// Checksum 0x80b8bc1, Offset: 0x1f41
// Size: 0x1f, Type: bool
function is_destroyed()
{
    assert( is_vehicle(), "<dev string:x313>" );
    return istrue( self.isdestroyed );
}

// Namespace vehicle
// Params 1
// Checksum 0x42863e77, Offset: 0x1f69
// Size: 0x4e
function function_ad343fc57b149b57( ref )
{
    vehicleref = ref ?? get_ref();
    
    if ( has_data( vehicleref ) )
    {
        vehicledata = get_data( vehicleref );
        return istrue( vehicledata.var_b6a3f46ec4332fd8 );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 0
// Checksum 0xf54a29fe, Offset: 0x1fc0
// Size: 0x25, Type: bool
function is_boss()
{
    return is_vehicle() && !isdefined( self.owner ) && isdefined( self.bossinstance );
}

// Namespace vehicle
// Params 1
// Checksum 0xd3babc24, Offset: 0x1fee
// Size: 0x4e
function can_fly( ref )
{
    vehicleref = ref ?? get_ref();
    
    if ( has_data( vehicleref ) )
    {
        leveldataforvehicle = get_data( vehicleref );
        return istrue( leveldataforvehicle.canfly );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 1
// Checksum 0x11555833, Offset: 0x2045
// Size: 0x4e
function can_explode( ref )
{
    vehicleref = ref ?? get_ref();
    
    if ( has_data( vehicleref ) )
    {
        vehicledata = get_data( vehicleref );
        return istrue( vehicledata.var_9939b0b97ebcce99 );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 1
// Checksum 0xf5e6584c, Offset: 0x209c
// Size: 0x52, Type: bool
function function_1fe58ae318378aa8( ref )
{
    vehicleref = ref ?? get_ref();
    
    if ( !has_data( vehicleref ) )
    {
        return false;
    }
    
    vehicledata = get_data( vehicleref );
    return vehicledata.var_7b24e5615baa0378 ?? 0;
}

// Namespace vehicle
// Params 0
// Checksum 0xf44462a2, Offset: 0x20f7
// Size: 0xc, Type: bool
function is_husk()
{
    return istrue( self.isvehiclehusk );
}

// Namespace vehicle
// Params 0
// Checksum 0xac5f6a64, Offset: 0x210c
// Size: 0x37, Type: bool
function is_boat()
{
    if ( has_data( get_ref() ) )
    {
        leveldataforvehicle = get_data( get_ref() );
        return istrue( leveldataforvehicle.isboat );
    }
    
    return false;
}

// Namespace vehicle
// Params 0
// Checksum 0x396f3689, Offset: 0x214c
// Size: 0x1b, Type: bool
function is_killstreak()
{
    return isdefined( self ) && isdefined( self.streakinfo ) && is_vehicle();
}

// Namespace vehicle
// Params 0
// Checksum 0x6d2a51da, Offset: 0x2170
// Size: 0x14, Type: bool
function function_145b99b7f993513b()
{
    return !can_fly() && !is_boat();
}

// Namespace vehicle
// Params 1
// Checksum 0x8b6926e7, Offset: 0x218d
// Size: 0x3a
function function_1572cbe3d2550638( vehicleref )
{
    if ( !has_data( vehicleref ) )
    {
        struct = spawnstruct();
        add_data( vehicleref, struct );
    }
    
    return get_data( vehicleref );
}

// Namespace vehicle
// Params 2
// Checksum 0x1382dd3f, Offset: 0x21d0
// Size: 0x177
function generic_init( vehicleref, callbacks )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !register_data( vehicleref ) )
    {
        return;
    }
    
    if ( isdefined( callbacks ) )
    {
        foreach ( key, func in callbacks )
        {
            utility::registersharedfunc( vehicleref, key, func );
        }
    }
    
    process_data( vehicleref );
    
    if ( utility::issharedfuncdefined( vehicleref, #"init" ) )
    {
        [[ utility::getsharedfunc( vehicleref, #"init" ) ]]();
    }
    
    if ( utility::issharedfuncdefined( vehicleref, #"initLate" ) )
    {
        [[ utility::getsharedfunc( vehicleref, #"initLate" ) ]]();
    }
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0x66a0086f, Offset: 0x234f
// Size: 0xdd
function private register_data( vehicleref )
{
    if ( !isdefined( level.var_a7bf93687486b5ba ) )
    {
        level.var_a7bf93687486b5ba = [];
    }
    
    if ( level.projectbundle.var_53c4124af039142e )
    {
        hybrid = function_568f797e7642c672( "vehicle", vehicleref );
        
        if ( hybrid.bundle.ref )
        {
            add_data( vehicleref, hybrid.bundle );
            return 1;
        }
        
        return;
    }
    
    bundlename = function_451bd53633bae879( vehicleref );
    bundle = function_b1607ea19947d420( bundlename );
    
    if ( !isdefined( bundle ) )
    {
        /#
            logstring( "<dev string:x34b>" + getxhashsourcename( vehicleref ) );
        #/
        
        return 0;
    }
    
    add_data( bundle.ref, bundle, bundlename );
    return 1;
}

// Namespace vehicle
// Params 1
// Checksum 0xd16784a2, Offset: 0x2434
// Size: 0x122
function function_451bd53633bae879( vehicleref )
{
    if ( isxhashasset( vehicleref ) )
    {
        return vehicleref;
    }
    
    if ( level.gametypebundle.vehiclebundlesuffix )
    {
        bundlename = hashcat( %"vehiclebundle:", vehicleref, level.gametypebundle.vehiclebundlesuffix );
        
        if ( getscriptbundlefieldvalue( bundlename, #"ref" ) )
        {
            return bundlename;
        }
    }
    
    if ( level.gametypebundle.var_65aa9b8e4368ceb9 )
    {
        bundlename = hashcat( %"vehiclebundle:", vehicleref, level.gametypebundle.var_65aa9b8e4368ceb9 );
        
        if ( getscriptbundlefieldvalue( bundlename, #"ref" ) )
        {
            return bundlename;
        }
    }
    
    bundlename = hashcat( %"vehiclebundle:", vehicleref );
    
    if ( getscriptbundlefieldvalue( bundlename, #"ref" ) )
    {
        return bundlename;
    }
    
    bundlename = hashcat( %"vehiclebundle:", vehicleref, utility::issp() ? "_sp" : "_mp" );
    
    if ( getscriptbundlefieldvalue( bundlename, #"ref" ) )
    {
        return bundlename;
    }
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0x192329b8, Offset: 0x255e
// Size: 0x2a4f
function private process_data( vehicleref )
{
    data = get_data( vehicleref );
    utility::script_func( "process_data", vehicleref, data );
    
    if ( isdefined( data.pristineexplosion ) && isdefined( data.pristineexplosion.vfx ) )
    {
        level._effect[ isxhashasset( vehicleref ) ? hashcat( vehicleref, "_explosion" ) : vehicleref + "_explosion" ] = loadfxasset( data.pristineexplosion.vfx );
    }
    
    if ( isdefined( data.pristineexplosion ) && data.pristineexplosion.scriptable == "" )
    {
        data.pristineexplosion.scriptable = undefined;
    }
    
    if ( isdefined( data.huskexplosion ) && data.huskexplosion.scriptable == "" )
    {
        data.huskexplosion.scriptable = undefined;
    }
    
    if ( isdefined( data.huskexplosion ) && isdefined( data.husk.ref ) && data.husk.hashusk && isdefined( data.huskexplosion.vfx ) )
    {
        level._effect[ isxhashasset( vehicleref ) ? hashcat( vehicleref, "_husk_explosion" ) : vehicleref + "_husk_explosion" ] = loadfxasset( data.huskexplosion.vfx );
    }
    
    if ( isdefined( data.var_b6b22387bf32be77 ) && isdefined( data.husk.ref ) && data.husk.hashusk && isdefined( data.var_b6b22387bf32be77.vfx ) )
    {
        level._effect[ isxhashasset( vehicleref ) ? hashcat( vehicleref, "_husk_no_explosion" ) : vehicleref + "_husk_no_explosion" ] = loadfxasset( data.var_b6b22387bf32be77.vfx );
    }
    
    if ( level.projectbundle.var_53c4124af039142e )
    {
        data.model = vehicle_modelname( vehicleref );
    }
    else
    {
        if ( isdefined( data.compositemodel ) && data.compositemodel != "" )
        {
            data.model = data.compositemodel;
        }
        
        data.compositemodel = undefined;
    }
    
    if ( isdefined( data.husk.compositemodel ) && data.husk.compositemodel != "" )
    {
        data.husk.model = data.husk.compositemodel;
    }
    
    data.husk.compositemodel = undefined;
    
    if ( isdefined( data.ai.compositemodel ) && data.ai.compositemodel != "" )
    {
        data.ai.model = data.ai.compositemodel;
    }
    
    data.ai.compositemodel = undefined;
    data.occupancy.exitoffsets = [];
    data.occupancy.exitdirections = [];
    
    foreach ( exit in data.extraexits )
    {
        data.occupancy.exitoffsets[ exit.ref ] = ( exit.offset.x ?? 0, exit.offset.y ?? 0, exit.offset.z ?? 0 );
        data.occupancy.exitdirections[ exit.ref ] = exit.direction;
    }
    
    data.extraexits = undefined;
    data.occupancy.seatdata = [];
    
    foreach ( seatdata in data.seats )
    {
        data.occupancy.seatdata[ seatdata.ref ] = seatdata;
    }
    
    data.seatswitcharray = [];
    
    foreach ( index, seatdata in data.seats )
    {
        data.seatswitcharray[ index ] = seatdata.ref;
    }
    
    data.occupancy.seatids = [];
    data.occupancy.id = data.id;
    data.id = undefined;
    data.var_cff35e75ef6ee45 = [];
    
    foreach ( seatid, seatdata in data.occupancy.seatdata )
    {
        if ( seatdata.var_f10b778a5f7f1c62 )
        {
            data.var_cff35e75ef6ee45[ data.var_cff35e75ef6ee45.size ] = seatid;
        }
    }
    
    foreach ( seatid, seatdata in data.occupancy.seatdata )
    {
        if ( seatdata.restrictions == "driver_can_fire" || seatdata.restrictions == "turret_passenger" )
        {
            data.hasturrets = 1;
            seatdata.hasvehicleweapon = 1;
        }
        
        switch ( seatdata.restrictions )
        {
            case #"hash_b19724c2fdfb9d3f":
                seatdata.restrictions = vehicle_occupancy::function_9f5282b40f2df2a9();
                break;
            case #"hash_bc3a9fa5d9ee1d33":
                seatdata.restrictions = vehicle_occupancy::function_f02bc30b02f79356();
                break;
            case #"hash_25ef3e427273d0":
                seatdata.restrictions = vehicle_occupancy::function_a3d537a4bea3e85e();
                break;
            case #"hash_b92d4ef42f9f37a8":
                seatdata.restrictions = vehicle_occupancy::function_64a3829f0655c0b0();
                break;
            case #"hash_f7f9964a5172a48a":
                seatdata.restrictions = vehicle_occupancy::function_b8eb35c9e4ccc722();
                break;
            case #"hash_5890abf34002e520":
                seatdata.restrictions = vehicle_occupancy::function_504d83b160ed6158();
                break;
            case #"hash_1c8b46d9f8c121d1":
                seatdata.restrictions = vehicle_occupancy::function_24cd2940c5b56fdb();
                break;
        }
        
        if ( seatdata.animtag == "tag_turret" )
        {
            seatdata.animtag = undefined;
        }
        
        seatdata.seatswitcharray = vehicle_occupancy::function_7b5a0eb785dba6d2( seatid, data.seatswitcharray );
        
        foreach ( var_b109dfbf2cb096ff in data.var_cff35e75ef6ee45 )
        {
            seatdata.seatswitcharray = arrayremove( seatdata.seatswitcharray, var_b109dfbf2cb096ff );
        }
        
        if ( !isdefined( seatdata.damagemodifier ) )
        {
            seatdata.damagemodifier = 0;
        }
        
        if ( !isdefined( seatdata.var_86386389c0f70b5d ) )
        {
            seatdata.var_86386389c0f70b5d = 0;
        }
        
        if ( seatdata.var_86386389c0f70b5d < 0 )
        {
            seatdata.var_86386389c0f70b5d = undefined;
        }
        
        if ( isdefined( seatdata.turretweapon ) && seatdata.turretweapon != "" )
        {
            seatdata.turretobjweapon = makeweapon( seatdata.turretweapon );
            level.vehicle.weapons[ seatdata.turretweapon ] = 1;
        }
        
        data.occupancy.seatids[ seatid ] = seatdata.omnvarid ?? 0;
    }
    
    if ( data.occupancy.roofexittype == "no_roof_exit" )
    {
        data.occupancy.roofexittype = undefined;
    }
    
    data.seats = undefined;
    data.spawn.abandonedtimeoutcallback = &vehicle_spawn::function_4e5b6b2cc9cc3b30;
    
    if ( data.mtxvehicleref == "" )
    {
        data.mtxvehicleref = undefined;
    }
    
    data.damage.weapon = data.weapon;
    data.damage.visualpercents = [];
    data.damage.visualcallbacks = [];
    data.damage.visualclearcallbacks = [];
    data.damage.damagestatedata = [];
    data.damage.damageableparts = [];
    
    if ( !isdefined( data.damage.class ) )
    {
        data.damage.class = data.damage.damageclass;
    }
    
    vehicle_damage::function_6e59be779e385adc( vehicleref );
    vehicle_damage::function_f80dee5b045a4ee8( vehicleref );
    vehicle_damage::set_vehicle_hit_damage_data( vehicleref, data.damage.maxhits );
    vehicle_damage::set_death_callback( vehicleref, &explode );
    
    if ( data.weapon )
    {
        vehicle_damage::set_weapon_hit_damage_data( data.weapon, data.damage.explosivehitsperattack );
        level.vehicle.weapons[ data.weapon ] = 1;
    }
    
    data.var_1f9a4101434e0129 = 0;
    vehicle_damage::function_b84ee64d4e9bd27f( vehicleref, data.damage.var_762b2aba7d1c5ce9 );
    
    if ( data.husk.hashusk )
    {
        vehicle_damage::set_vehicle_hit_damage_data( data.husk.ref, data.damage.maxhits );
        vehicle_damage::set_death_callback( data.husk.ref, &explode );
    }
    else
    {
        data.huskexplosion = undefined;
    }
    
    data.interact.lights = [];
    
    foreach ( light in data.lights )
    {
        data.interact.lights[ light.tag ] = light;
    }
    
    data.lights = undefined;
    data.damage.var_5e5dc92250389a1f = [];
    data.damage.var_4adaed6d37ec6c16 = [];
    
    foreach ( damageablepartdata in data.damageableparts )
    {
        if ( !damageablepartdata.enabled )
        {
            continue;
        }
        
        if ( damageablepartdata.isonpristine )
        {
            data.damage.var_5e5dc92250389a1f[ damageablepartdata.scriptablepartname ] = damageablepartdata;
        }
        
        if ( damageablepartdata.isonhusk )
        {
            data.damage.var_4adaed6d37ec6c16[ damageablepartdata.scriptablepartname ] = damageablepartdata;
        }
        
        switch ( damageablepartdata.ref )
        {
            case #"hash_30ccbada37699a25":
            case #"hash_42b5a3e3285842cd":
            case #"hash_504ea34262e6d686":
            case #"hash_5a0d6719dbc731d7":
            case #"hash_b1f7d5cd648c98d8":
            case #"hash_c0bd12509f7ca46a":
            case #"hash_e1eacaf3ea9bdac4":
            case #"hash_ef7c0c9fb26d257b":
                damageablepartdata.wheelref = function_1b44a8bef83e8e02( damageablepartdata.ref, "_wheel" );
                break;
            case #"hash_299ca2ec66573f5f":
            case #"hash_3ad9dee1b2383dd0":
            case #"hash_429f675878e8e042":
            case #"hash_93cd8ed9ef8f8301":
            case #"hash_976b632eaa0990c2":
            case #"hash_aa711d7fc645b3e3":
            case #"hash_c366ad8b46c80b09":
            case #"hash_dbc0e96da272c41c":
            case #"hash_fcd5dc0af3e2a581":
                data.occupancy.hasdoors = 1;
                damageablepartdata.doorref = function_1b44a8bef83e8e02( damageablepartdata.ref, "_door" );
                break;
            case #"hash_1c7226690cdd4ebb":
            case #"hash_7759f2094c4eae28":
            case #"hash_7fa614aa388c793c":
            case #"hash_84b307d5d860ef65":
            case #"hash_ccec2206c85cd572":
            case #"hash_e6e515a681eb15e5":
            case #"hash_ebde6181acd770f2":
            case #"hash_f8f7e8f9ac33a0d7":
            case #"hash_fa41893bbe9474bd":
                seatref = function_1b44a8bef83e8e02( damageablepartdata.ref, "_window" );
                
                if ( isdefined( data.occupancy.seatdata[ seatref ] ) )
                {
                    data.occupancy.seatdata[ seatref ].doorwindowref = damageablepartdata.scriptablepartname;
                }
            case #"hash_a8e647d4b09dea3f":
                damageablepartdata.windowref = damageablepartdata.ref;
                break;
            case #"hash_d582c3286e5c390f":
                assert( isdefined( data.interact.lights[ damageablepartdata.scriptablepartname ] ), "<dev string:x3a0>" + damageablepartdata.ref + "<dev string:x3de>" + getxhashsourcename( vehicleref ) );
                break;
        }
        
        damageablepartdata.ref = undefined;
        
        if ( isdefined( damageablepartdata.wheelref ) )
        {
            switch ( damageablepartdata.wheelref )
            {
                case #"hash_19baa7ca5b52f06a":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_4d63793b20448722;
                    break;
                case #"hash_60b26be014fd7337":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_4d53fdec4c872dbf;
                    break;
                case #"hash_67ed6be3637f19ed":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_15797dca5168f05f;
                    break;
                case #"hash_227fe4df4167aa26":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_769a396f81a9b18c;
                    break;
                case #"hash_f0704f57a0dd2250":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_7faccfa4db0c08bc;
                    break;
                case #"hash_cbd67f63f80e6245":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_7c170f3977150969;
                    break;
                case #"hash_711797dce2a722a3":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_cbacf54d43d06309;
                    break;
                case #"hash_6ade103971ce6e2c":
                    damageablepartdata.var_d6aa641e123523f4 = &vehicle_damage::function_92c1df7b033bf896;
                    break;
            }
        }
        
        data.damage.damageableparts[ damageablepartdata.scriptablepartname ] = damageablepartdata;
        function_6a14477bcf586606( damageablepartdata.scriptablepartname );
        
        if ( !isdefined( level.scriptable_notify_callback_funcs[ "kill vehicle part " + damageablepartdata.scriptablepartname ] ) )
        {
            scriptable::scriptable_addnotifycallback( "kill vehicle part " + damageablepartdata.scriptablepartname, &vehicle_damage::function_6757cfd75a460ed5 );
        }
        
        if ( damageablepartdata.hasdamagedstate && !isdefined( level.scriptable_notify_callback_funcs[ "damage vehicle part " + damageablepartdata.scriptablepartname ] ) )
        {
            scriptable::scriptable_addnotifycallback( "damage vehicle part " + damageablepartdata.scriptablepartname, &vehicle_damage::function_ad39d0a9e71456f8 );
        }
        
        if ( damageablepartdata.hasdamagedstate && isdefined( damageablepartdata.damagedtag ) )
        {
            if ( !isdefined( data.damage.var_a24bea462b38d510 ) )
            {
                data.damage.var_a24bea462b38d510 = [];
            }
            
            data.damage.var_a24bea462b38d510[ damageablepartdata.damagedtag ] = damageablepartdata.scriptablepartname;
            function_6a14477bcf586606( damageablepartdata.damagedtag );
        }
    }
    
    data.damageableparts = undefined;
    data.damage.frontextents = data.damage.mineextents.front ?? 0;
    data.damage.backextents = data.damage.mineextents.back ?? 0;
    data.damage.leftextents = data.damage.mineextents.left ?? 0;
    data.damage.rightextents = data.damage.mineextents.right ?? 0;
    data.damage.bottomextents = data.damage.mineextents.bottom ?? 0;
    data.damage.topextents = data.damage.mineextents.top ?? 0;
    data.damage.loscheckoffset = ( data.damage.var_6f32bbd2d85d8a16.x ?? 0, data.damage.var_6f32bbd2d85d8a16.y ?? 0, data.damage.var_6f32bbd2d85d8a16.z ?? 0 );
    data.damage.var_6f32bbd2d85d8a16 = undefined;
    data.damage.mineextents = undefined;
    
    if ( data.damage.var_7a15d6c1c7bad2fa )
    {
        if ( !isdefined( data.damage.explosionextents.front ) )
        {
            data.damage.explosionextents.front = 0;
        }
        
        if ( !isdefined( data.damage.explosionextents.back ) )
        {
            data.damage.explosionextents.back = 0;
        }
        
        if ( !isdefined( data.damage.explosionextents.left ) )
        {
            data.damage.explosionextents.left = 0;
        }
        
        if ( !isdefined( data.damage.explosionextents.right ) )
        {
            data.damage.explosionextents.right = 0;
        }
        
        if ( !isdefined( data.damage.explosionextents.top ) )
        {
            data.damage.explosionextents.top = 0;
        }
        
        if ( !isdefined( data.damage.explosionextents.bottom ) )
        {
            data.damage.explosionextents.bottom = 0;
        }
    }
    else
    {
        data.damage.explosionextents = undefined;
    }
    
    data.occupancy.exitextents[ "front" ] = data.exitextents.front ?? 0;
    data.occupancy.exitextents[ "back" ] = data.exitextents.back ?? 0;
    data.occupancy.exitextents[ "left" ] = data.exitextents.left ?? 0;
    data.occupancy.exitextents[ "right" ] = data.exitextents.right ?? 0;
    data.occupancy.exitextents[ "top" ] = data.exitextents.top ?? 0;
    data.occupancy.exitextents[ "bottom" ] = data.exitextents.bottom ?? 0;
    data.exitextents = undefined;
    data.interact.interactiontypes = [];
    data.interact.pointdata = [];
    vehicle_interact::function_addfe642323c541( vehicleref, "single", data.seatswitcharray );
    
    if ( isdefined( level.vehicle.oob ) && isdefined( level.vehicle.oob.outoftimecallbacks ) && !data.damage.ignoreoob )
    {
        level.vehicle.oob.outoftimecallbacks[ vehicleref ] = &explode;
    }
    
    data.occupancy.data = [];
    data.occupancy.rotationids = [];
    data.occupancy.warningbits = [];
    data.occupancy.warningstartcallbacks = [];
    data.occupancy.warningendcallbacks = [];
    data.occupancy.warningclearcallbacks = [];
    data.occupancy.rotationrefsbyseatandweapon = [];
    data.occupancy.warningbits[ "burningDown" ] = 1;
    data.occupancy.warningbits[ "missileLocking" ] = 2;
    data.occupancy.warningbits[ "missileIncoming" ] = 4;
    data.occupancy.warningbits[ "movementDisabled" ] = 3;
    data.occupancy.warningbits[ "outOfFuel" ] = 6;
    data.occupancy.warningbits[ "lowFuel" ] = 5;
    data.occupancy.warningbits[ "BunkerBusterAttached" ] = 7;
    data.occupancy.warningbits[ "shockStickAttached" ] = 8;
    data.occupancy.warningbits[ "DDoSed" ] = 9;
    data.occupancy.warningbits[ "locked" ] = 10;
    data.occupancy.warningbits[ "broken" ] = 11;
    
    if ( utility::function_6eafaf04149c97d4() && data.ai.supportsai && isdefined( data.ai.vehicleanimalias ) )
    {
        assert( isdefined( data.ai.vehicleanimalias ) && data.ai.vehicleanimalias != "<dev string:x3ee>", "<dev string:x3f2>" + getxhashsourcename( vehicleref ) );
        unload_groups = [];
        unload_groups[ "default" ] = [];
        unload_groups[ "all" ] = [];
        unload_groups[ "moving" ] = [];
        
        foreach ( index, seatdata in data.aiseats )
        {
            if ( seatdata.vehicle_getinanim.id )
            {
                seatdata.vehicle_getinanim = seatdata.vehicle_getinanim.id;
            }
            else
            {
                seatdata.vehicle_getinanim = undefined;
            }
            
            if ( seatdata.var_e19d02150c7f7b20.id )
            {
                seatdata.var_e19d02150c7f7b20 = seatdata.var_e19d02150c7f7b20.id;
            }
            else
            {
                seatdata.var_e19d02150c7f7b20 = undefined;
            }
            
            if ( seatdata.vehicle_getoutanim.id )
            {
                seatdata.vehicle_getoutanim = seatdata.vehicle_getoutanim.id;
            }
            else
            {
                seatdata.vehicle_getoutanim = undefined;
            }
            
            if ( seatdata.vehicle_getoutanim_combat.id )
            {
                seatdata.vehicle_getoutanim_combat = seatdata.vehicle_getoutanim_combat.id;
            }
            else
            {
                seatdata.vehicle_getoutanim_combat = undefined;
            }
            
            if ( seatdata.vehicle_getoutanim_combat_run.id )
            {
                seatdata.vehicle_getoutanim_combat_run = seatdata.vehicle_getoutanim_combat_run.id;
            }
            else
            {
                seatdata.vehicle_getoutanim_combat_run = undefined;
            }
            
            if ( seatdata.linkoffset )
            {
                x = seatdata.linkoffset.x ?? 0;
                y = seatdata.linkoffset.y ?? 0;
                z = seatdata.linkoffset.z ?? 0;
                
                if ( x != 0 || y != 0 || z != 0 )
                {
                    seatdata.linkoffset = ( x, y, z );
                }
                else
                {
                    seatdata.linkoffset = undefined;
                }
            }
            
            if ( seatdata.linkangle )
            {
                pitch = seatdata.linkangle.x ?? 0;
                yaw = seatdata.linkangle.y ?? 0;
                roll = seatdata.linkangle.z ?? 0;
                
                if ( pitch != 0 || yaw != 0 || roll != 0 )
                {
                    seatdata.linkangle = ( pitch, yaw, roll );
                }
                else
                {
                    seatdata.linkangle = undefined;
                }
            }
            
            if ( seatdata.linkoffset && !seatdata.linkangle )
            {
                seatdata.linkangle = ( 0, 0, 0 );
            }
            
            if ( data.aianimations[ index ] )
            {
                animationdata = data.aianimations[ index ];
                
                if ( animationdata.idle.id )
                {
                    seatdata.idle = animationdata.idle.id;
                }
                
                if ( animationdata.getin.id )
                {
                    seatdata.getin = animationdata.getin.id;
                }
                
                if ( animationdata.getout.id )
                {
                    seatdata.getout = animationdata.getout.id;
                }
                
                if ( animationdata.death.id )
                {
                    seatdata.death = animationdata.death.id;
                }
                
                if ( animationdata.ragdoll_fall_anim.id )
                {
                    seatdata.ragdoll_fall_anim = animationdata.ragdoll_fall_anim.id;
                }
                
                if ( animationdata.idle_anim && animationdata.idle_anim != "" )
                {
                    seatdata.idle_anim = animationdata.idle_anim;
                }
            }
            
            if ( !seatdata.do_not_unload )
            {
                unload_groups[ "default" ][ unload_groups[ "default" ].size ] = index;
                unload_groups[ "all" ][ unload_groups[ "all" ].size ] = index;
                
                if ( index != 0 )
                {
                    unload_groups[ "moving" ][ unload_groups[ "moving" ].size ] = index;
                }
            }
            
            if ( isdefined( data.occupancy.seatdata[ "gunner" ] ) && seatdata.playerseatref == "gunner" && isdefined( data.occupancy.seatdata[ "gunner" ].turretobjweapon ) )
            {
                seatdata.turretobjweapon = data.occupancy.seatdata[ "gunner" ].turretobjweapon;
                seatdata.turretweapon = data.occupancy.seatdata[ "gunner" ].turretweapon;
                level.vehicle.weapons[ seatdata.turretweapon ] = 1;
                data.ai.var_edf8eb1de8e57f4f = 1;
            }
        }
        
        foreach ( extraunloadgroup in data.unloadgroups )
        {
            unload_groups[ extraunloadgroup.name ] = [];
            
            foreach ( index, seatdata in extraunloadgroup.seats )
            {
                unload_groups[ extraunloadgroup.name ][ unload_groups[ extraunloadgroup.name ].size ] = seatdata.seatindex ?? 0;
            }
        }
        
        if ( !isdefined( unload_groups[ "driver" ] ) )
        {
            unload_groups[ "driver" ] = [ 0 ];
        }
        
        data.unloadgroups = undefined;
        data.aianimations = undefined;
        var_ff984144fea7a891 = [];
        
        if ( isdefined( data.aifastrope ) )
        {
            foreach ( ropedata in data.aifastrope )
            {
                data.ai.vehiclesetuprope = 1;
                var_ff984144fea7a891[ ropedata.fastroperigindex ] = spawnstruct();
                
                if ( isdefined( ropedata.model ) )
                {
                    var_ff984144fea7a891[ ropedata.fastroperigindex ].model = ropedata.model;
                }
                
                if ( isdefined( ropedata.tag ) )
                {
                    var_ff984144fea7a891[ ropedata.fastroperigindex ].tag = ropedata.tag;
                }
                
                if ( isdefined( ropedata.idleanim ) && isdefined( ropedata.idleanim.id ) )
                {
                    var_ff984144fea7a891[ ropedata.fastroperigindex ].idleanim = ropedata.idleanim.id;
                }
                
                if ( isdefined( ropedata.dropanim ) && isdefined( ropedata.dropanim.id ) )
                {
                    var_ff984144fea7a891[ ropedata.fastroperigindex ].dropanim = ropedata.dropanim.id;
                }
                
                if ( isdefined( ropedata.dropusestraceorigin ) )
                {
                    var_ff984144fea7a891[ ropedata.fastroperigindex ].dropusestraceorigin = ropedata.dropusestraceorigin;
                }
            }
        }
        
        data.aifastrope = undefined;
        vehicle_build::build_template( data.ai.templateclass, data.model, data.vehicle, data.ref );
        vehicle_build::assign_aianims( data.aiseats, data.ai.vehicleanimalias );
        vehicle_build::function_51ee9c0f53cb8f70( unload_groups );
        
        if ( var_ff984144fea7a891.size > 0 )
        {
            vehicle_build::function_b36241dc6dbc0ab4( var_ff984144fea7a891 );
        }
    }
    
    if ( data.airdrop.var_e7e6ef68d34906e3 )
    {
        effect = loadfxasset( data.airdrop.vfx );
        level._effect[ isxhashasset( vehicleref ) ? hashcat( vehicleref, "_land" ) : vehicleref + "_land" ] = effect;
        data.airdrop.effect = effect;
        data.airdrop.scenename = data.ref + "_drop";
        level.scr_animtree[ "ac130" ] = data.airdrop.planeanim.animtree.id;
        level.scr_anim[ "ac130" ][ data.airdrop.scenename ] = data.airdrop.planeanim.animname.id;
        level.scr_animtree[ "parachute" ] = data.airdrop.parachuteanim.animtree.id;
        level.scr_anim[ "parachute" ][ data.airdrop.scenename ] = data.airdrop.parachuteanim.animname.id;
        level.scr_animtree[ data.ref ] = data.airdrop.vehiclemodelanim.animtree.id;
        level.scr_anim[ data.ref ][ data.airdrop.scenename ] = data.airdrop.vehiclemodelanim.animname.id;
        
        if ( isdefined( data.airdrop.realvehicleanim.animname ) && isdefined( data.airdrop.realvehicleanim ) && isdefined( data.airdrop.realvehicleanim.animname.id ) )
        {
            data.airdrop.var_bd3e5377d361f765 = data.ref + "_follow_up";
            level.scr_anim[ data.ref ][ data.airdrop.var_bd3e5377d361f765 ] = data.airdrop.realvehicleanim.animname.id;
        }
        
        data.airdrop.planeanim = undefined;
        data.airdrop.parachuteanim = undefined;
        data.airdrop.vehiclemodelanim = undefined;
        data.airdrop.realvehicleanim = undefined;
    }
    else
    {
        data.airdrop = undefined;
    }
    
    if ( data.tricks.size == 0 )
    {
        data.tricks = undefined;
        return;
    }
    
    trickmap = [];
    
    foreach ( trickdata in data.tricks )
    {
        trickmap[ trickdata.ref ] = trickdata;
    }
    
    data.tricks = trickmap;
}

// Namespace vehicle
// Params 1
// Checksum 0xde998697, Offset: 0x4fb5
// Size: 0x3b
function get_data( vehicleref )
{
    var_7237854e3be197ca = level.var_a7bf93687486b5ba[ vehicleref ];
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    assertmsg( "<dev string:x437>" );
    return undefined;
}

// Namespace vehicle
// Params 1
// Checksum 0x44e3316b, Offset: 0x4ff9
// Size: 0x19, Type: bool
function has_data( vehicleref )
{
    return isdefined( level.var_a7bf93687486b5ba[ vehicleref ] );
}

// Namespace vehicle
// Params 3
// Checksum 0x1f31f056, Offset: 0x501b
// Size: 0xf2
function add_data( vehicleref, data, bundlename )
{
    if ( level.projectbundle.var_53c4124af039142e )
    {
        if ( isxhashasset( vehicleref ) )
        {
            data.vehicle = vehicleref;
        }
        else if ( isstring( vehicleref ) )
        {
            data.ref = vehicleref;
        }
        
        if ( data.vehicle )
        {
            level.var_a7bf93687486b5ba[ data.vehicle ] = data;
        }
        
        if ( data.ref )
        {
            level.var_a7bf93687486b5ba[ data.ref ] = data;
        }
        
        return;
    }
    
    level.var_a7bf93687486b5ba[ vehicleref ] = data;
    
    if ( !isdefined( bundlename ) )
    {
        bundlename = function_451bd53633bae879( vehicleref );
    }
    
    if ( bundlename )
    {
        data.bundlename = bundlename;
        level.var_a7bf93687486b5ba[ bundlename ] = data;
    }
}

// Namespace vehicle
// Params 1
// Checksum 0xf828fe72, Offset: 0x5115
// Size: 0x14, Type: bool
function is_loaded( vehicleref )
{
    return has_data( vehicleref );
}

// Namespace vehicle
// Params 3
// Checksum 0x9e1d723f, Offset: 0x5132
// Size: 0x11d
function spawn( vehicleref, spawndata, faildata )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( isxhashasset( vehicleref ) )
    {
        spawndata.script_vehiclebundle = vehicleref;
    }
    
    if ( spawndata vehicle_spawn::has_flag( 5 ) )
    {
        huskdata = vehicle_spawn::function_ab128b19257dc458( vehicleref, spawndata );
        return create_husk( vehicleref, huskdata, faildata );
    }
    
    if ( utility::issharedfuncdefined( vehicleref, #"spawn" ) )
    {
        return [[ utility::getsharedfunc( vehicleref, #"spawn" ) ]]( spawndata, faildata );
    }
    
    return default_spawn( vehicleref, spawndata, faildata );
}

// Namespace vehicle
// Params 0
// Checksum 0x29e1728f, Offset: 0x5257
// Size: 0x2c
function function_dcbcdc00863e94d6()
{
    function_1c27aaa359763956();
    vehicleref = function_9a2a097e0f42d34d();
    
    if ( !isdefined( vehicleref ) )
    {
        return;
    }
    
    return spawn( vehicleref, self );
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0xa5de96de, Offset: 0x528c
// Size: 0xaf
function private function_1c27aaa359763956()
{
    if ( isstring( self.vehicletype ) )
    {
        var_7ca93e220eda8d82 = getxhashasset( self.vehicletype );
        
        if ( has_data( var_7ca93e220eda8d82 ) )
        {
            self.vehicletype = var_7ca93e220eda8d82;
        }
    }
    
    if ( isstring( self.script_vehiclebundle ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            var_2ef19349709e3462 = getxhashasset( self.script_vehiclebundle );
        }
        else
        {
            var_2ef19349709e3462 = hashcat( %"vehiclebundle:", self.script_vehiclebundle );
        }
        
        if ( has_data( var_2ef19349709e3462 ) )
        {
            self.script_vehiclebundle = var_2ef19349709e3462;
        }
    }
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x578558d0, Offset: 0x5343
// Size: 0x11c
function private function_9a2a097e0f42d34d()
{
    if ( has_data( self.vehicletype ) )
    {
        return self.vehicletype;
    }
    
    if ( has_data( self.script_vehiclebundle ) )
    {
        return self.script_vehiclebundle;
    }
    
    if ( isstring( self.script_vehiclerefs ) )
    {
        foreach ( vehicleref in utility::array_randomize( strtok( self.script_vehiclerefs, "," ) ) )
        {
            if ( has_data( vehicleref ) )
            {
                return vehicleref;
            }
        }
    }
    
    if ( has_data( self.script_vehicleref ) )
    {
        return self.script_vehicleref;
    }
    
    if ( has_data( self.targetname ) )
    {
        return self.targetname;
    }
    
    assertmsg( "<dev string:x49d>" );
}

// Namespace vehicle
// Params 3
// Checksum 0x3b4a1b44, Offset: 0x5467
// Size: 0x3a3
function default_spawn( vehicleref, spawndata, faildata )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !is_loaded( vehicleref ) )
    {
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x1ee>" + vehicleref );
            }
        #/
        
        return undefined;
    }
    else
    {
        /#
            if ( level.debugvehiclespawns )
            {
                println( "<dev string:x21e>" + vehicleref );
            }
        #/
    }
    
    if ( !vehicle_tracking::function_a50a15927bf945c1( spawndata ) )
    {
        return undefined;
    }
    
    callback::callback( #"hash_6fd98c62c8521a60", { #spawndata:spawndata, #vehicleref:vehicleref } );
    spawndata = vehicle_spawn::function_de8a2dba98bdeb4e( vehicleref, spawndata );
    vehicle = vehicle_tracking::spawn_vehicle( spawndata, faildata );
    
    if ( !isdefined( vehicle ) )
    {
        return undefined;
    }
    
    create( vehicle, vehicleref, spawndata );
    vehicledata = get_data( vehicleref );
    vehicleweapon = vehicle_damage::function_bbb46fd1c4790a39( vehicleref );
    
    if ( vehicleweapon )
    {
        vehicle.objweapon = makeweapon( vehicleweapon );
    }
    
    function_1c294dda0847ef13( vehicle, vehicledata, spawndata );
    
    foreach ( vehicleturret in vehicledata.vehicleturrets ?? [] )
    {
        vehicle register_turret( vehicle, undefined, vehicleturret.turretweapon, vehicleturret.isprojectile, 1 );
    }
    
    vehicle_compass::register_instance( vehicle );
    utility::callsharedfunc( vehicleref, #"create", vehicle );
    vehicle thread function_2f34d1b2e8c87f53( istrue( vehicledata.isboat ) );
    vehicle thread function_23cb77ee148dd43a();
    
    if ( !vehicledata.interact.var_9b6fcf3000287a03 )
    {
        vehicle thread watch_flipped();
    }
    
    vehicle thread vehicle_code::function_123d1d60a34593b();
    
    if ( vehicledata.isboat )
    {
        vehicle function_c21d39b1929f7cb1( -1, level.var_cb8ff8f046da9128 ?? 100 );
    }
    else if ( !vehicle function_5bf8fedff42637e2() )
    {
        vehicle thread watch_floating();
    }
    
    if ( utility::function_6eafaf04149c97d4() && vehicledata.ai.supportsai && spawndata.initai )
    {
        vehicle vehicle_ai::function_76f7ea069893edd2( vehicledata );
    }
    
    if ( isdefined( spawndata.script_vehicle_lights_on ) )
    {
        vehicle vehicle_interact::lights_on( spawndata.script_vehicle_lights_on );
    }
    
    if ( utility::issharedfuncdefined( vehicleref, #"onStartRiding" ) && utility::issharedfuncdefined( vehicleref, #"onEndRiding" ) )
    {
        vehicle thread vehicle_occupancy::watch_riding();
    }
    
    if ( utility::issp() )
    {
        vehicle thread vehicle_damage::function_94850857710e138d();
        vehicle thread vehicle_damage::function_7a749bb684749078();
    }
    
    create_late( vehicle, spawndata );
    
    /#
        if ( level.debugvehiclespawns )
        {
            println( "<dev string:x24c>" + vehicleref );
        }
    #/
    
    return vehicle;
}

// Namespace vehicle
// Params 5
// Checksum 0x9ef45922, Offset: 0x5813
// Size: 0x57e
function create_husk( vehicleref, spawndata, faildata, fallbackvehicletype, donotwatchabandoned )
{
    if ( !vehicle_tracking::function_a50a15927bf945c1( spawndata ) )
    {
        return undefined;
    }
    
    if ( !is_loaded( vehicleref ) || !get_data( vehicleref ).husk.hashusk )
    {
        return undefined;
    }
    
    data = get_data( vehicleref );
    huskref = data.husk.ref;
    callback::callback( #"hash_6fd98c62c8521a60", { #spawndata:spawndata, #vehicleref:huskref } );
    spawndata = vehicle_spawn::function_456e98b54b607964( vehicleref, spawndata, fallbackvehicletype );
    isstatic = data.husk.isstatic || spawndata.var_5c2a5a3e858d8962;
    
    if ( isstatic )
    {
        husk = vehicle_tracking::function_67616b82fb3a0d53( spawndata, faildata );
    }
    else
    {
        husk = vehicle_tracking::spawn_vehicle( spawndata, faildata );
    }
    
    if ( isdefined( spawndata.corpses ) )
    {
        foreach ( tagname, corpses in spawndata.corpses )
        {
            if ( !isarray( corpses ) )
            {
                continue;
            }
            
            foreach ( corpse in corpses )
            {
                if ( isdefined( husk ) && husk tagexists( tagname ) )
                {
                    corpse linkto( husk, tagname );
                    continue;
                }
                
                corpse delete();
            }
        }
    }
    
    if ( !isdefined( husk ) )
    {
        return undefined;
    }
    
    husk.isvehiclehusk = 1;
    husk.pristineref = vehicleref;
    create( husk, vehicleref, spawndata );
    husk.vehiclename = huskref;
    husk.objweapon = makeweapon( vehicle_damage::function_db73eaef77b6f00d( vehicleref ) );
    husk.basevehiclespawndata = spawndata.basevehiclespawndata;
    husk.isstationary = istrue( self.isstationary );
    
    if ( !isstatic && isdefined( spawndata.var_6b0d261794318b6d ) )
    {
        husk setturrettargetlocalangles( spawndata.var_6b0d261794318b6d, 0, 1 );
    }
    
    create_late( husk, spawndata );
    
    if ( utility::issharedfuncdefined( huskref, #"create" ) )
    {
        [[ utility::getsharedfunc( huskref, #"create" ) ]]( husk );
    }
    
    if ( level.invulnerablehusks )
    {
        husk.var_c82fdb1998fb5a8e = 1;
    }
    else
    {
        husk thread vehicle_spawn::watch_abandoned();
    }
    
    transitionscriptableparts = vehicle_spawn::function_b65e41134b5a89af( vehicleref );
    mtxtransitionstate = undefined;
    
    if ( isdefined( spawndata.mtx ) )
    {
        husk.mtx = spawndata.mtx;
        
        if ( isdefined( spawndata.mtx.var_d461a71290fd3dcd ) && spawndata.mtx.var_d461a71290fd3dcd != "" )
        {
            mtxtransitionstate = spawndata.mtx.var_d461a71290fd3dcd;
        }
    }
    
    var_b5fa492caf504f56 = !husk vehicle_tracking::function_d53ca0a2fd01145f() vehicle_spawn::has_flag( 5 );
    
    if ( isdefined( transitionscriptableparts ) && var_b5fa492caf504f56 )
    {
        foreach ( struct in transitionscriptableparts )
        {
            if ( isdefined( mtxtransitionstate ) && husk getscriptableparthasstate( struct.var_bfed29f09b275d4b, mtxtransitionstate ) )
            {
                husk setscriptablepartstate( struct.var_bfed29f09b275d4b, mtxtransitionstate );
                continue;
            }
            
            husk setscriptablepartstate( struct.var_bfed29f09b275d4b, "on" );
        }
    }
    
    husk vehicle_damage::function_f7cac766d4a43bba( vehicleref, husk.damageableparts, isstatic );
    
    if ( isstatic )
    {
        return husk;
    }
    
    if ( var_b5fa492caf504f56 )
    {
        if ( data.damageknockback.var_53d3481c22156866 > 0 )
        {
            husk vehicle_damage::function_bdf87ac8d69f745e();
        }
        else
        {
            husk vehicle_code::vehicle_husklaunch( undefined, vehicleref, spawndata, data.damage.huskforcemultiplier );
        }
    }
    
    husk thread function_a3dbf7bba7f161();
    husk utility::callsharedfunc( #"vehicle", #"vehicleshowonminimap", 0 );
    
    if ( husk vehicle_isphysveh() )
    {
        husk vehphys_crash();
        
        if ( !husk is_boat() && husk vehphys_isgroundvehicle() )
        {
            husk function_8646b6bbcbec5172( 0 );
        }
    }
    else
    {
        husk vehicle_occupancy::function_d96c2b596c63c80e();
    }
    
    return husk;
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x68b4cca0, Offset: 0x5d9a
// Size: 0x1f
function private function_a3dbf7bba7f161()
{
    self endon( "game_ended" );
    self endon( "death" );
    wait 0.2;
    self setrotorsactive( 0 );
}

// Namespace vehicle
// Params 0
// Checksum 0xc3428109, Offset: 0x5dc1
// Size: 0x4d
function get_ref()
{
    if ( level.projectbundle.var_53c4124af039142e )
    {
        return self.vehicletype;
    }
    
    return is_husk() ? self.pristineref : function_7dcee17e4a5045b() ?? self.vehiclename;
}

// Namespace vehicle
// Params 0
// Checksum 0xa6527aac, Offset: 0x5e16
// Size: 0x27
function function_7dcee17e4a5045b()
{
    assert( !level.projectbundle.var_53c4124af039142e );
    return self.bundlename;
}

// Namespace vehicle
// Params 0
// Checksum 0xac2a154a, Offset: 0x5e46
// Size: 0x18, Type: bool
function function_df978a2fa3318bbd()
{
    return is_vehicle() && has_data( get_ref() );
}

// Namespace vehicle
// Params 1
// Checksum 0x42ed2e60, Offset: 0x5e67
// Size: 0xc0
function function_75acd2d48a8f3605( var_d07503d4ee92d508 )
{
    if ( isdefined( level.var_a7bf93687486b5ba ) )
    {
        if ( !isdefined( var_d07503d4ee92d508 ) )
        {
            return getarraykeys( level.var_a7bf93687486b5ba );
        }
        
        refs = [];
        
        foreach ( ref, data in level.var_a7bf93687486b5ba )
        {
            if ( isxhashasset( ref ) == var_d07503d4ee92d508 )
            {
                refs[ refs.size ] = ref;
            }
        }
        
        return refs;
    }
    
    return [];
}

// Namespace vehicle
// Params 0
// Checksum 0xf499f33e, Offset: 0x5f30
// Size: 0xb
function function_dcc93c53cf94df59()
{
    return level.var_20da6f84d2d7fa2a;
}

// Namespace vehicle
// Params 3
// Checksum 0x637ca3d, Offset: 0x5f44
// Size: 0x40e
function create( vehicle, vehicleref, spawndata )
{
    data = get_data( vehicleref );
    vehicle.vehiclename = data.ref;
    
    if ( !level.projectbundle.var_53c4124af039142e )
    {
        vehicle.bundlename = data.bundlename;
    }
    
    vehicle.maxhealth = vehicle_damage::get_max_health( vehicle ) ?? 5000;
    vehicle.health = vehicle.maxhealth;
    
    if ( isdefined( spawndata.script_disconnectpaths ) )
    {
        vehicle.script_disconnectpaths = spawndata.script_disconnectpaths;
    }
    
    if ( isdefined( spawndata.script_badplace ) )
    {
        vehicle.script_badplace = spawndata.script_badplace;
    }
    
    vehicle setnodeploy( 1 );
    vehicle makeunusable();
    
    if ( !vehicle is_husk() && data.canfly )
    {
        vehicle.isheli = 1;
    }
    
    if ( spawndata vehicle_spawn::has_flag( 10 ) )
    {
        vehicle vehicle_occupancy::function_b901181db6fc2774();
        
        if ( vehicle ishelicopter() )
        {
            vehicle vehicle_occupancy::function_474d87fe62493d22();
        }
    }
    else
    {
        vehicle vehicle_occupancy::function_d96c2b596c63c80e();
    }
    
    isstatic = vehicle is_static();
    
    if ( !isstatic && vehicle vehicle_isphysveh() )
    {
        vehicle function_ae25258bd3b2a348( !vehicle is_husk() && data.interact.var_b5a941fe80597833 );
    }
    
    if ( !isstatic && !spawndata.initai && !spawndata vehicle_spawn::has_flag( 9 ) && vehicle vehicle_isphysveh() && vehicle vehphys_isgroundvehicle() )
    {
        vehicle vehphys_parkingbrake( 1 );
    }
    
    if ( isdefined( spawndata.var_4ae4f42e05dc7b41 ) )
    {
        set_mtx( vehicle, find_mtx( vehicleref, spawndata.var_4ae4f42e05dc7b41 ) );
    }
    
    if ( isdefined( spawndata.customattackfunc ) )
    {
        vehicle.customattackfunc = spawndata.customattackfunc;
    }
    
    if ( isdefined( spawndata.var_8d709d1797b48f07 ) )
    {
        vehicle.var_8d709d1797b48f07 = spawndata.var_8d709d1797b48f07;
    }
    
    vehicle_occupancy::register_instance( vehicle );
    vehicle_interact::init_fuel( vehicleref, vehicle, spawndata );
    vehicle flags::assign_unique_id();
    
    if ( utility::function_6eafaf04149c97d4() || isnavmeshloaded() )
    {
        if ( utility::issharedfuncdefined( #"vehicle", #"initAIAvoidance" ) )
        {
            vehicle thread utility::callsharedfunc( #"vehicle", #"initAIAvoidance" );
        }
        else if ( !isstatic )
        {
            if ( spawndata )
            {
                if ( spawndata.var_8e91d3ada982e3ef )
                {
                    var_6627505abbffbac = vehicle getboundshalfsize();
                    spawndata.var_d395743aa17d3e48 = var_6627505abbffbac * spawndata.var_8e91d3ada982e3ef;
                }
            }
            
            vehicle thread vehicle_code::function_2f279e91bd543e23( spawndata );
        }
    }
    
    callback::callback( #"vehicle_create", { #spawndata:spawndata, #vehicle:vehicle } );
    
    if ( !spawndata vehicle_spawn::has_flag( 6 ) && !vehicle is_husk() )
    {
        vehicle_interact::register_instance( vehicle );
    }
    
    if ( isdefined( spawndata.owner ) )
    {
        vehicle_occupancy::function_eeedcbb30e985d5c( vehicle, spawndata.owner );
    }
    
    /#
        utility::callsharedfunc( #"logging", #"addevent", spawndata.vehicletype, vehicleref, undefined, spawndata.modelname, spawndata.script_vehicleref, undefined, undefined, spawndata.origin );
    #/
    
    thread update( vehicle );
    
    if ( !isstatic )
    {
        thread vehicle_collision::update_instance( vehicle );
    }
    
    /#
        if ( getdvarint( @"hash_9824088677b15053", 0 ) == 1 )
        {
            vehicle thread function_5a8c10847228dce9();
        }
    #/
}

// Namespace vehicle
// Params 2
// Checksum 0xafab4ebe, Offset: 0x635a
// Size: 0xf7
function create_late( vehicle, spawndata )
{
    if ( spawndata.script_godmode )
    {
        vehicle.godmode = 1;
    }
    
    vehicle vehicle_damage::set_can_damage( !vehicle is_static() );
    vehicle_damage::activate_parts( vehicle, spawndata );
    vehicle_tracking::register_instance( vehicle, spawndata.owner, spawndata.team );
    vehicle_dlog::spawn_event( vehicle, spawndata.spawntype );
    
    if ( isdefined( spawndata.team ?? spawndata.script_team ) )
    {
        vehicle_occupancy::set_team( vehicle, spawndata.team ?? spawndata.script_team );
    }
    else
    {
        vehicle_occupancy::set_team( vehicle, "neutral" );
    }
    
    callback::callback( #"hash_4b3892e25246f595", { #spawndata:spawndata, #vehicle:vehicle } );
}

// Namespace vehicle
// Params 2
// Checksum 0x4986e97d, Offset: 0x6459
// Size: 0xc9
function explode( data, immediate )
{
    if ( is_destroyed() || !can_explode() )
    {
        return;
    }
    
    self notify( "explode" );
    
    if ( utility::issharedfuncdefined( get_ref(), #"explode" ) )
    {
        [[ utility::getsharedfunc( get_ref(), #"explode" ) ]]( data, immediate );
        return;
    }
    
    if ( is_husk() )
    {
        var_6fd04269d9f0829e = utility::function_edc4cc03e9e60b3e( @"hash_6fa2847af53be191", 0, level.gametypebundle.var_6fd04269d9f0829e );
        
        if ( var_6fd04269d9f0829e )
        {
            thread function_b4bc359f37c47096( data, immediate );
        }
        else
        {
            function_4c3760671e3fefef( data, immediate );
        }
        
        return;
    }
    
    default_explode( data, immediate );
}

// Namespace vehicle
// Params 0
// Checksum 0x7d07912e, Offset: 0x652a
// Size: 0x59
function function_767d9021690bb2f3()
{
    self removecomponent( "p2p" );
    self vehicle_cleardrivingstate();
    self function_d2b8ee2e1275daaf( 0 );
    
    while ( true )
    {
        self waittill( "damage", amount, attacker );
        
        if ( isplayer( attacker ) )
        {
            continue;
        }
        
        break;
    }
    
    explode( undefined, 1 );
}

// Namespace vehicle
// Params 2
// Checksum 0x673ea04c, Offset: 0x658b
// Size: 0x42
function function_4c3760671e3fefef( data, immediate )
{
    vehicle_damage::clear_visuals( undefined, undefined, 1 );
    self setscriptablepartstate( "visibility", "hide", 0 );
    thread death( self, data );
    thread vehicle_damage::explode();
}

// Namespace vehicle
// Params 2
// Checksum 0x506f4f97, Offset: 0x65d5
// Size: 0xfc
function function_b4bc359f37c47096( data, immediate )
{
    ref = get_ref();
    data = get_data( ref );
    ishusk = is_husk();
    explosiondata = data.var_b6b22387bf32be77;
    explosionposition = self gettagorigin( explosiondata.tag );
    fxname = isxhashasset( get_ref() ) ? hashcat( get_ref(), "_husk_no_explosion" ) : get_ref() + "_husk_no_explosion";
    vehicle_damage::function_c10f854d96e7458f( explosiondata, explosionposition, fxname, self.mtx );
    wait explosiondata.deathdelay ?? 0;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    vehicle_damage::clear_visuals( undefined, undefined, 1 );
    self setscriptablepartstate( "visibility", "hide", 0 );
    thread death( self, data );
    self stopsounds();
}

// Namespace vehicle
// Params 2
// Checksum 0x4651632f, Offset: 0x66d9
// Size: 0x117
function default_explode( data, immediate )
{
    if ( !isdefined( data ) )
    {
        data = spawnstruct();
        data.inflictor = self;
        data.objweapon = vehicle_damage::function_bbb46fd1c4790a39( get_ref() );
        data.meansofdeath = "MOD_EXPLOSIVE";
    }
    
    vehicle_damage::function_7d082f909fac51a3( data );
    vehicle_damage::function_3fe90cbe40505e7d( data );
    thread death( self, data );
    thread vehicle_damage::explode();
    
    if ( isdefined( data.attacker ) )
    {
        bctypename = vehicle_interact::get_data( get_ref() ).bctypename;
        
        if ( !isdefined( bctypename ) || bctypename == "" )
        {
            bctypename = "generic";
        }
        
        if ( utility::issharedfuncdefined( #"sound", #"trysaylocalsound" ) )
        {
            level thread [[ utility::getsharedfunc( #"sound", #"trysaylocalsound" ) ]]( data.attacker, hashcat( #"hash_748c50aa6182ec4b", bctypename ) );
        }
    }
}

// Namespace vehicle
// Params 2
// Checksum 0xc40ccef2, Offset: 0x67f8
// Size: 0x346
function death( vehicle, damagedata )
{
    if ( !vehicle || vehicle is_destroyed() || vehicle function_ad343fc57b149b57() )
    {
        return;
    }
    
    vehicleref = vehicle get_ref();
    hashusk = istrue( get_data( vehicleref ).husk.hashusk );
    spawnhusk = !vehicle is_husk() && hashusk && !vehicle.dontspawnhusk;
    vehicle_occupancy::kill_occupants( vehicle, damagedata );
    
    if ( vehicle is_husk() )
    {
        vehicle_damage::function_c0997f62f7c7cbd8( vehicle );
    }
    
    fallbackvehicletype = vehicle.vehicletype;
    killer = undefined;
    
    if ( isdefined( damagedata ) )
    {
        killer = damagedata.attacker;
    }
    
    vehicle function_57be2c0bb3aee8fd( vehicle, killer );
    
    if ( utility::issharedfuncdefined( vehicleref, #"delete" ) )
    {
        vehicle [[ utility::getsharedfunc( vehicleref, #"delete" ) ]]( vehicle );
    }
    
    if ( ( utility::issharedfuncdefined( vehicleref, #"onEndRiding" ) || vehicle.onEndRiding ) && isdefined( vehicle.ridingplayers ) )
    {
        onEndRiding = vehicle.onEndRiding ?? utility::getsharedfunc( vehicleref, #"onEndRiding" );
        
        foreach ( player in vehicle.ridingplayers )
        {
            if ( isdefined( player ) )
            {
                vehicle [[ onEndRiding ]]( player );
            }
        }
    }
    
    oldspawndata = vehicle vehicle_tracking::function_d2bad728e2163c17();
    
    if ( oldspawndata.initai )
    {
        vehicle vehicle_ai::function_9b3723ecd75f11e5( spawnhusk, damagedata );
    }
    
    vehicle_dlog::death_event( vehicle, damagedata );
    waitframe();
    
    if ( !isent( vehicle ) )
    {
        return;
    }
    
    spawnhusk &= !vehicle.dontspawnhusk;
    spawndata = undefined;
    
    if ( spawnhusk )
    {
        spawndata = vehicle vehicle_spawn::function_93f7a778f0b3b5cb( vehicle, vehicleref );
    }
    
    vehicle function_e424ea4fc6d0119a( vehicle );
    
    if ( !vehicle is_husk() )
    {
        vehicle callback::callback( #"vehicle_death", damagedata );
    }
    
    husk = undefined;
    
    if ( spawnhusk )
    {
        husk = create_husk( vehicleref, spawndata, undefined, fallbackvehicletype, vehicle.donotwatchabandoned );
    }
    
    if ( isdefined( husk ) )
    {
        vehicle callback::callback( #"hash_196418d7b445821d", { #husk:husk } );
        oldspawndata notify( "husk_spawn", husk );
    }
    else
    {
        vehicle callback::callback( #"vehicle_delete", damagedata );
        oldspawndata notify( "husk_failed" );
    }
    
    if ( isdefined( vehicle.reactivearmorexplosion ) )
    {
        vehicle.reactivearmorexplosion freescriptable();
    }
    
    if ( isdefined( vehicle.explosionbadplace ) )
    {
        destroynavobstacle( vehicle.explosionbadplace );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0xe3c0d94f, Offset: 0x6b46
// Size: 0x47
function function_821726d09177a949()
{
    assert( isdefined( self ) && isdefined( self.spawndata ) );
    self.spawndata endon( "husk_failed" );
    self.spawndata waittill( "husk_spawn", husk );
    return husk;
}

// Namespace vehicle
// Params 2, eflags: 0x4
// Checksum 0x4bafa1fc, Offset: 0x6b96
// Size: 0x19f
function private function_57be2c0bb3aee8fd( vehicle, killer )
{
    if ( vehicle is_destroyed() )
    {
        return;
    }
    
    vehicle notify( "death", killer );
    vehicle.isdestroyed = 1;
    
    if ( vehicle_spawn::function_7cb78fe251a14b5b() && !vehicle vehicle_tracking::function_d53ca0a2fd01145f() vehicle_spawn::has_flag( 8 ) )
    {
        ref = vehicle get_ref();
        hashusk = istrue( get_data( ref ).husk.hashusk );
        spawnhusk = !vehicle is_husk() && hashusk && !vehicle.dontspawnhusk;
        
        if ( !spawnhusk && utility::issharedfuncdefined( ref, #"ondeathrespawn" ) )
        {
            vehicle thread [[ utility::getsharedfunc( ref, #"ondeathrespawn" ) ]]();
        }
        else if ( vehicle is_husk() && !vehicle is_killstreak() )
        {
            vehicle thread vehicle_spawn::function_79bec4a35ef5586d();
        }
        else if ( !spawnhusk && !vehicle is_killstreak() )
        {
            vehicle thread vehicle_spawn::function_fd587db0cd7ec2d();
        }
    }
    
    vehicle vehicle_damage::set_can_damage( 0 );
    vehicle setnonstick( 1 );
    vehicle_compass::vehicle_hide( vehicle );
    vehicle_damage::deregister_instance( vehicle );
    vehicle_interact::deregister_instance( vehicle );
    vehicle_tracking::deregister_instance( vehicle );
    
    if ( utility::issharedfuncdefined( #"vehicle", #"deleteNextFrame" ) )
    {
        [[ utility::getsharedfunc( #"vehicle", #"deleteNextFrame" ) ]]( vehicle );
    }
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0xeaaa6948, Offset: 0x6d3d
// Size: 0xde
function private function_e424ea4fc6d0119a( vehicle )
{
    vehicle_occupancy::deregister_instance( vehicle );
    
    if ( utility::issharedfuncdefined( #"vehicle", #"deleteNextFrameLate" ) )
    {
        [[ utility::getsharedfunc( #"vehicle", #"deleteNextFrameLate" ) ]]( vehicle );
    }
    
    turrets = get_turrets( vehicle );
    
    if ( isdefined( turrets ) )
    {
        foreach ( turret in turrets )
        {
            turret delete();
        }
    }
    
    vehicle_tracking::delete_vehicle( vehicle );
}

// Namespace vehicle
// Params 5
// Checksum 0xb08e5ba5, Offset: 0x6e23
// Size: 0xc8
function drop_to_ground( vehicleref, origin, extrazoffset = 50, updist = 100, ignore )
{
    if ( !has_data( vehicleref ) )
    {
        assertmsg( "<dev string:x4de>" );
        return origin;
    }
    
    data = vehicle_occupancy::get_data( vehicleref );
    
    if ( !isdefined( data.exitextents[ "bottom" ] ) )
    {
        assertmsg( "<dev string:x51d>" );
        return origin;
    }
    
    origin = utility::drop_to_ground( origin, updist, -5000, undefined, undefined, ignore );
    origin += ( 0, 0, data.exitextents[ "bottom" ] + extrazoffset );
    return origin;
}

// Namespace vehicle
// Params 5
// Checksum 0x33fd7c95, Offset: 0x6ef4
// Size: 0x26c
function function_37bfd4038858cd15( vehicleref, origin, angles = ( 0, 0, 0 ), extrazoffset = 50, maxzdiff = 20 )
{
    if ( !has_data( vehicleref ) )
    {
        return undefined;
    }
    
    extents = vehicle_occupancy::get_data( vehicleref ).exitextents;
    
    if ( !( isdefined( extents[ "right" ] ) && isdefined( extents[ "left" ] ) && isdefined( extents[ "back" ] ) && isdefined( extents[ "front" ] ) && isdefined( extents[ "bottom" ] ) ) )
    {
        return undefined;
    }
    
    frontright = ( extents[ "front" ], extents[ "right" ], 0 );
    frontleft = ( extents[ "front" ], extents[ "left" ] * -1, 0 );
    backright = ( extents[ "back" ] * -1, extents[ "right" ], 0 );
    backleft = ( extents[ "back" ] * -1, extents[ "left" ] * -1, 0 );
    minz = undefined;
    maxz = undefined;
    centerground = undefined;
    
    foreach ( offset in [ ( 0, 0, 0 ), frontright, frontleft, backright, backleft ] )
    {
        groundorigin = utility::drop_to_ground( origin + rotatevector( offset, angles ), 5000, -5000 );
        
        if ( abs( groundorigin[ 2 ] - origin[ 2 ] ) > 4999 )
        {
            return undefined;
        }
        
        if ( !minz )
        {
            minz = groundorigin[ 2 ];
            maxz = groundorigin[ 2 ];
            centerground = groundorigin;
            continue;
        }
        
        minz = min( minz, groundorigin[ 2 ] );
        maxz = max( maxz, groundorigin[ 2 ] );
        
        if ( maxz - minz > maxzdiff )
        {
            return undefined;
        }
    }
    
    centerground = ( centerground[ 0 ], centerground[ 1 ], maxz + extents[ "bottom" ] + extrazoffset );
    return centerground;
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0x3b27b1af, Offset: 0x7169
// Size: 0x173
function private update( vehicle )
{
    vehicle notify( "vehicle_update" );
    vehicle endon( "vehicle_update" );
    level endon( "game_ended" );
    
    /#
        vehicle_interact::function_7f6d4b46409d18b0( vehicle );
    #/
    
    if ( vehicle is_husk() )
    {
        return;
    }
    
    var_c6af5e62d64e89f6 = istrue( vehicle_omnvar::get_data( vehicle get_ref() ).var_c6af5e62d64e89f6 );
    hastrailvfx = isdefined( vehicle.mtx.vehicletrail ) && vehicle.mtx.vehicletrail != "" && vehicle getscriptablehaspart( "trail" );
    canfly = vehicle can_fly();
    hasupdatefunc = utility::issharedfuncdefined( vehicle get_ref(), #"update" );
    updatefunc = undefined;
    
    if ( hasupdatefunc )
    {
        updatefunc = utility::getsharedfunc( vehicle get_ref(), #"update" );
    }
    
    if ( !var_c6af5e62d64e89f6 && !hastrailvfx && !hasupdatefunc )
    {
        return;
    }
    
    while ( isdefined( vehicle ) && !vehicle.isdestroyed )
    {
        if ( var_c6af5e62d64e89f6 )
        {
            vehicle_omnvar::function_b7e5944543c97cfa( vehicle );
        }
        
        if ( hastrailvfx )
        {
            function_5dad4b4ee60357f2( vehicle, canfly );
        }
        
        if ( hasupdatefunc )
        {
            data = spawnstruct();
            vehicle [[ updatefunc ]]( data );
        }
        
        waitframe();
    }
}

// Namespace vehicle
// Params 2, eflags: 0x4
// Checksum 0xc8f1d94c, Offset: 0x72e4
// Size: 0xe5
function private function_5dad4b4ee60357f2( vehicle, canfly )
{
    trail = vehicle.mtx.vehicletrail;
    velocity = vehicle vehicle_getvelocity();
    forward = anglestoforward( vehicle.angles );
    state = vehicle getscriptablepartstate( "trail" );
    
    if ( canfly && isdefined( vehicle_occupancy::get_driver( vehicle ) ) )
    {
        newstate = trail;
    }
    else if ( vehicle vehicle_getspeed() > 1 && vectordot( velocity, forward ) >= 0 )
    {
        newstate = trail;
    }
    else
    {
        newstate = trail + "_idle";
    }
    
    if ( state == newstate )
    {
        return;
    }
    
    if ( vehicle getscriptableparthasstate( "trail", newstate ) )
    {
        vehicle setscriptablepartstate( "trail", newstate );
    }
}

// Namespace vehicle
// Params 3
// Checksum 0xdf99f74a, Offset: 0x73d1
// Size: 0x389
function function_1c294dda0847ef13( vehicle, vehicledata, spawndata )
{
    if ( !isdefined( vehicledata.hasturrets ) )
    {
        return;
    }
    
    var_7237854e3be197ca = vehicledata.initturrets;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    vehicledata.initturrets = 1;
    vehweapons = [ vehicle getturretweapon( 0 ), vehicle getturretweapon( 1 ), vehicle getturretweapon( 2 ), vehicle getturretweapon( 3 ) ];
    
    foreach ( index, weapon in vehweapons )
    {
        if ( isnullweapon( weapon ) )
        {
            vehweapons[ index ] = undefined;
            continue;
        }
        
        function_bd90574dbbb5f255( vehicle, index, spawndata );
    }
    
    if ( vehweapons.size == 0 )
    {
        return;
    }
    
    foreach ( seatref, seat in vehicledata.occupancy.seatdata )
    {
        if ( !seat.hasvehicleweapon )
        {
            continue;
        }
        
        turretindex = undefined;
        turretweapon = undefined;
        aiseatindex = undefined;
        
        foreach ( index, weapon in vehweapons )
        {
            if ( weapon.basename == seat.turretweapon )
            {
                turretweapon = weapon;
                turretindex = index;
                break;
            }
        }
        
        if ( !isdefined( turretweapon ) )
        {
            continue;
        }
        
        if ( vehicledata.ai.var_edf8eb1de8e57f4f )
        {
            foreach ( aiindex, aiseat in vehicledata.aiseats )
            {
                if ( aiseat.playerseatref == seatref )
                {
                    aiseatindex = aiindex;
                    break;
                }
            }
        }
        
        isprojectile = turretweapon.type == "projectile";
        turretstr = { #aiseatindex:aiseatindex, #turretindex:turretindex, #turretweapon:turretweapon, #isprojectile:isprojectile, #seatref:seatref };
        
        if ( !isdefined( vehicledata.vehicleturrets ) )
        {
            vehicledata.vehicleturrets = [];
        }
        
        vehicledata.vehicleturrets[ vehicledata.vehicleturrets.size ] = turretstr;
    }
}

// Namespace vehicle
// Params 5
// Checksum 0x9282b462, Offset: 0x7762
// Size: 0x148
function register_turret( vehicle, entity, objweapon, isprojectile = 0, isvehicleturret = 0 )
{
    if ( !isvehicleturret && isdefined( entity ) && !isdefined( entity.objweapon ) )
    {
        entity.objweapon = objweapon;
    }
    
    if ( !isdefined( vehicle.turrets ) )
    {
        vehicle.turrets = [];
    }
    
    weaponname = undefined;
    
    if ( isstring( objweapon ) )
    {
        weaponname = objweapon;
    }
    else
    {
        weaponname = objweapon.basename;
    }
    
    vehicle.turrets[ weaponname ] = isvehicleturret ? vehicle : entity;
    level.vehicle.weapons[ weaponname ] = 1;
    
    if ( !isvehicleturret )
    {
        childoutlineents = vehicle.childoutlineents;
        
        if ( !isdefined( childoutlineents ) )
        {
            childoutlineents = [ vehicle ];
        }
        
        if ( isdefined( entity ) && !arraycontains( childoutlineents, entity ) )
        {
            childoutlineents[ childoutlineents.size ] = entity;
        }
        
        vehicle.childoutlineents = childoutlineents;
    }
    
    if ( isprojectile )
    {
        thread function_499fa6052246e9a2( vehicle, entity );
    }
}

// Namespace vehicle
// Params 2
// Checksum 0xd7f2c972, Offset: 0x78b2
// Size: 0xbe
function deregister_turret( vehicle, objweapon )
{
    if ( !isdefined( vehicle.turrets ) )
    {
        return;
    }
    
    weaponname = undefined;
    
    if ( isstring( objweapon ) )
    {
        weaponname = objweapon;
    }
    else
    {
        weaponname = objweapon.basename;
    }
    
    entity = vehicle.turrets[ weaponname ];
    vehicle.turrets[ weaponname ] = undefined;
    
    if ( isdefined( entity ) )
    {
        if ( entity != vehicle )
        {
            childoutlineents = vehicle.childoutlineents;
            
            if ( isdefined( childoutlineents ) )
            {
                childoutlineents = arrayremove( childoutlineents, entity );
                vehicle.childoutlineents = childoutlineents;
            }
        }
        
        entity notify( "vehicle_trackTurretProjectile" );
    }
}

// Namespace vehicle
// Params 2
// Checksum 0x668d74e2, Offset: 0x7978
// Size: 0x5f
function function_95e3c2e0c6eec800( vehicle, objweapon )
{
    if ( !isdefined( vehicle.turrets ) )
    {
        return undefined;
    }
    
    weaponname = undefined;
    
    if ( isstring( objweapon ) )
    {
        weaponname = objweapon;
    }
    else
    {
        weaponname = objweapon.basename;
    }
    
    return vehicle.turrets[ weaponname ];
}

// Namespace vehicle
// Params 1
// Checksum 0x914aa98b, Offset: 0x79e0
// Size: 0x1b, Type: bool
function get_turrets( vehicle )
{
    return vehicle.turrets ?? [];
}

// Namespace vehicle
// Params 2
// Checksum 0x573c6c70, Offset: 0x7a04
// Size: 0x172
function function_ffff4932a6fa99fb( vehicle, var_f9fd5155bab65d5e = 1 )
{
    ref = get_ref();
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    seats = vehicle_occupancy::function_8a8e1601e7e6610( vehicle );
    
    if ( !isdefined( seats ) )
    {
        return;
    }
    
    turretindexes = [];
    
    foreach ( seatid in seats )
    {
        seatdata = vehicle_occupancy::function_568cd324ac705619( ref, seatid );
        
        if ( !seatdata.animtag )
        {
            continue;
        }
        
        index = undefined;
        
        if ( var_f9fd5155bab65d5e && seatid == "driver" && seatdata.hasvehicleweapon )
        {
            index = 0;
        }
        
        switch ( seatdata.animtag )
        {
            case #"hash_d31ec6c1959f9462":
                index = 1;
                break;
            case #"hash_d31ec5c1959f92cf":
                index = 2;
                break;
            case #"hash_d31ec4c1959f913c":
                index = 3;
                break;
        }
        
        if ( isdefined( index ) )
        {
            turretindexes[ turretindexes.size ] = index;
        }
    }
    
    return turretindexes;
}

// Namespace vehicle
// Params 2
// Checksum 0x9ed1eec0, Offset: 0x7b7f
// Size: 0x6c
function function_499fa6052246e9a2( vehicle, entity )
{
    if ( !isdefined( entity ) )
    {
        entity = vehicle;
    }
    
    entity endon( "death" );
    entity notify( "vehicle_trackTurretProjectile" );
    entity endon( "vehicle_trackTurretProjectile" );
    
    while ( true )
    {
        entity waittill( "missile_fire", missile );
        
        if ( isdefined( missile ) )
        {
            missile.vehicle = vehicle;
        }
    }
}

// Namespace vehicle
// Params 3, eflags: 0x4
// Checksum 0x5fc38905, Offset: 0x7bf3
// Size: 0x3b3
function private function_bd90574dbbb5f255( vehicle, index, spawndata )
{
    if ( !isdefined( vehicle.turretoverrides ) )
    {
        vehicle.turretoverrides = [];
    }
    
    turretdata = spawnstruct();
    
    switch ( index )
    {
        case 0:
            if ( isdefined( spawndata.var_af5bf78f4f572611 ) )
            {
                turretdata.var_f1a62ae3fca0eace = spawndata.var_af5bf78f4f572611;
            }
            
            if ( isdefined( spawndata.var_2271d6e2362e707b ) )
            {
                turretdata.var_f1c93ce3fcc75a1c = spawndata.var_2271d6e2362e707b;
            }
            
            if ( isdefined( spawndata.var_38901b050337a88b ) )
            {
                turretdata.var_233f425b366ca48c = spawndata.var_38901b050337a88b;
            }
            
            if ( isdefined( spawndata.var_64e7ce8a81fcff51 ) )
            {
                turretdata.var_2362505b36930b0e = spawndata.var_64e7ce8a81fcff51;
            }
            
            if ( isdefined( spawndata.var_4791abe665e909ea ) )
            {
                turretdata.var_4f189248a397f8c3 = spawndata.var_4791abe665e909ea;
            }
            
            break;
        case 1:
            if ( isdefined( spawndata.var_482551e56dd5a813 ) )
            {
                turretdata.var_f1a62ae3fca0eace = spawndata.var_482551e56dd5a813;
            }
            
            if ( isdefined( spawndata.var_8f351ed388130925 ) )
            {
                turretdata.var_f1c93ce3fcc75a1c = spawndata.var_8f351ed388130925;
            }
            
            if ( isdefined( spawndata.var_69c2421b3a98d695 ) )
            {
                turretdata.var_233f425b366ca48c = spawndata.var_69c2421b3a98d695;
            }
            
            if ( isdefined( spawndata.var_900bce4405e37dd3 ) )
            {
                turretdata.var_2362505b36930b0e = spawndata.var_900bce4405e37dd3;
            }
            
            if ( isdefined( spawndata.var_3553e575529a6392 ) )
            {
                turretdata.var_4f189248a397f8c3 = spawndata.var_3553e575529a6392;
            }
            
            break;
        case 2:
            if ( isdefined( spawndata.var_482552e56dd5aa46 ) )
            {
                turretdata.var_f1a62ae3fca0eace = spawndata.var_482552e56dd5aa46;
            }
            
            if ( isdefined( spawndata.var_8f351bd38813028c ) )
            {
                turretdata.var_f1c93ce3fcc75a1c = spawndata.var_8f351bd38813028c;
            }
            
            if ( isdefined( spawndata.var_69c23f1b3a98cffc ) )
            {
                turretdata.var_233f425b366ca48c = spawndata.var_69c23f1b3a98cffc;
            }
            
            if ( isdefined( spawndata.var_900bcf4405e38006 ) )
            {
                turretdata.var_2362505b36930b0e = spawndata.var_900bcf4405e38006;
            }
            
            if ( isdefined( spawndata.var_3553e475529a615f ) )
            {
                turretdata.var_4f189248a397f8c3 = spawndata.var_3553e475529a615f;
            }
            
            break;
        case 3:
            if ( isdefined( spawndata.var_482553e56dd5ac79 ) )
            {
                turretdata.var_f1a62ae3fca0eace = spawndata.var_482553e56dd5ac79;
            }
            
            if ( isdefined( spawndata.var_8f351cd3881304bf ) )
            {
                turretdata.var_f1c93ce3fcc75a1c = spawndata.var_8f351cd3881304bf;
            }
            
            if ( isdefined( spawndata.var_69c2401b3a98d22f ) )
            {
                turretdata.var_233f425b366ca48c = spawndata.var_69c2401b3a98d22f;
            }
            
            if ( isdefined( spawndata.var_900bd04405e38239 ) )
            {
                turretdata.var_2362505b36930b0e = spawndata.var_900bd04405e38239;
            }
            
            if ( isdefined( spawndata.var_3553e375529a5f2c ) )
            {
                turretdata.var_4f189248a397f8c3 = spawndata.var_3553e375529a5f2c;
            }
            
            break;
        default:
            assertmsg( "<dev string:x567>" + index );
            break;
    }
    
    vehicle.turretoverrides[ index ] = turretdata;
}

// Namespace vehicle
// Params 2
// Checksum 0x244e417e, Offset: 0x7fae
// Size: 0xc6
function function_8957ae4cd340941c( vehicle, player )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_8957ae4cd340941c( vehicle, player );
    }
    
    if ( level.teambased )
    {
        team = vehicle.team;
        
        if ( !isdefined( team ) || team == "neutral" )
        {
            if ( isdefined( vehicle.owner ) )
            {
                vehicle.team = vehicle.owner.team;
            }
        }
        
        if ( !isdefined( team ) )
        {
            return 0;
        }
        
        return ( vehicle.team == player.team );
    }
    
    return vehicle.owner == player;
}

// Namespace vehicle
// Params 2
// Checksum 0xf0ae43eb, Offset: 0x807c
// Size: 0xd6
function function_8266feb1ae1c46bd( vehicle, player )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_8266feb1ae1c46bd( vehicle, player );
    }
    
    if ( level.teambased )
    {
        team = vehicle.team;
        
        if ( !isdefined( team ) || team == "neutral" )
        {
            if ( isdefined( vehicle.owner ) )
            {
                vehicle.team = vehicle.owner.team;
            }
        }
        
        if ( !isdefined( team ) )
        {
            return 0;
        }
        
        return ( vehicle.team != player.team );
    }
    
    return isdefined( vehicle.owner ) && vehicle.owner != player;
}

// Namespace vehicle
// Params 2
// Checksum 0x2fce0119, Offset: 0x815a
// Size: 0x7e
function function_91f3297b8e48b066( vehicle, player )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_91f3297b8e48b066( vehicle, player );
    }
    
    if ( level.teambased )
    {
        return ( ( !isdefined( vehicle.team ) || vehicle.team == "neutral" ) && !isdefined( vehicle.owner ) );
    }
    
    return !isdefined( vehicle.owner );
}

// Namespace vehicle
// Params 2
// Checksum 0x906a0008, Offset: 0x81e0
// Size: 0x4a
function function_977daeae4e2f0e30( vehicle, team )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_977daeae4e2f0e30( vehicle, team );
    }
    
    if ( level.teambased )
    {
        return ( vehicle.team == team );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 2
// Checksum 0x4f0a42fb, Offset: 0x8232
// Size: 0x5a
function function_fcf4c995a24246d1( vehicle, team )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_fcf4c995a24246d1( vehicle, team );
    }
    
    if ( level.teambased )
    {
        return ( isdefined( vehicle.team ) && vehicle.team != team );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 2
// Checksum 0x2fce015e, Offset: 0x8294
// Size: 0x5e
function function_381efb9169661936( vehicle, team )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_381efb9169661936( vehicle, team );
    }
    
    if ( level.teambased )
    {
        return ( !isdefined( vehicle.team ) || vehicle.team == "neutral" );
    }
    
    return undefined;
}

// Namespace vehicle
// Params 1
// Checksum 0xdec2681e, Offset: 0x82fa
// Size: 0x55
function function_88fc32afbd317644( vehicle )
{
    if ( vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return vehicle_occupancy::function_88fc32afbd317644( vehicle );
    }
    
    if ( isdefined( vehicle.team ) && vehicle.team != "neutral" )
    {
        return vehicle.team;
    }
    
    return undefined;
}

// Namespace vehicle
// Params 0
// Checksum 0x87e5cf70, Offset: 0x8357
// Size: 0xa8, Type: bool
function is_floating()
{
    if ( self vehicle_isphysveh() && self function_5bf8fedff42637e2() )
    {
        return !self vehphys_isgroundvehicle();
    }
    
    if ( !self vehphys_isgroundvehicle() )
    {
        return false;
    }
    
    data = get_data( get_ref() );
    
    if ( isdefined( data ) && isdefined( data.interact ) && self vehicle_isphysveh() )
    {
        testdepth = data.interact.depththreshold ?? 20;
        
        if ( isdefined( self.deadwheels ) )
        {
            testdepth -= 2 * self.deadwheels.size;
        }
        
        return ( self function_43f4bc8ff857e68e() > testdepth );
    }
    
    return false;
}

// Namespace vehicle
// Params 0
// Checksum 0x485acd07, Offset: 0x8408
// Size: 0x163
function watch_floating()
{
    level endon( "game_ended" );
    self endon( "death" );
    ref = get_ref();
    istank = is_tank();
    interactdata = vehicle_interact::get_data( ref );
    floattime = interactdata.floattime;
    
    while ( true )
    {
        self waittill( "floating" );
        
        while ( self function_43f4bc8ff857e68e() > 0.01 )
        {
            endtime = gettime() + 1000 * floattime;
            
            while ( true )
            {
                waitframe();
                
                if ( !is_floating() )
                {
                    break;
                }
                
                if ( gettime() >= endtime )
                {
                    break;
                }
            }
            
            if ( is_floating() )
            {
                if ( utility::issharedfuncdefined( #"vehicle", #"hash_c91a9f6e5e3f772f" ) )
                {
                    skip_logic = utility::callsharedfunc( #"vehicle", #"hash_c91a9f6e5e3f772f", {} );
                    
                    if ( skip_logic )
                    {
                        return;
                    }
                }
                
                self.flipped = 1;
                
                if ( self vehicle_isphysveh() )
                {
                    self function_8646b6bbcbec5172( 0 );
                }
                
                vehicle_occupancy::function_6d9760c4971403c2( self, 0 );
                vehicle_interact::allow_use( self, 0 );
                vehicle_occupancy::allow_movement( self, 0 );
                
                if ( !istank )
                {
                    wait 5;
                }
                
                vehicle_occupancy::function_e63376f7546b7cb8( self );
                vehicle_occupancy::disable_engine();
                wait istank ? 10 : 25;
                thread vehicle_spawn::stuck_timeout();
                return;
            }
        }
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x6b0aeae8, Offset: 0x8573
// Size: 0xb8
function function_2f34d1b2e8c87f53( isboat )
{
    level endon( "game_ended" );
    self endon( "death" );
    self waittill( "veh_submerged" );
    
    if ( utility::issharedfuncdefined( #"vehicle", #"hash_c91a9f6e5e3f772f" ) )
    {
        skip_logic = utility::callsharedfunc( #"vehicle", #"hash_c91a9f6e5e3f772f", {} );
        
        if ( skip_logic )
        {
            return;
        }
    }
    
    self.flipped = 1;
    vehicle_occupancy::function_6d9760c4971403c2( self, 0 );
    vehicle_interact::allow_use( self, 0 );
    vehicle_occupancy::allow_movement( self, 0 );
    
    if ( !isboat )
    {
        wait 1;
    }
    
    vehicle_occupancy::function_e63376f7546b7cb8( self );
    vehicle_occupancy::disable_engine();
    
    if ( !isboat )
    {
        wait 15;
    }
    
    thread vehicle_spawn::stuck_timeout();
}

// Namespace vehicle
// Params 0
// Checksum 0xe3ca5800, Offset: 0x8633
// Size: 0x2b7
function function_63c2b3027681cb37()
{
    if ( !level.gametypebundle.var_3a8941a244839a59 )
    {
        return;
    }
    
    if ( !isdefined( level.var_20da6f84d2d7fa2a ) )
    {
        level.var_20da6f84d2d7fa2a = [];
    }
    
    foreach ( structs in level.vehicle_spawns )
    {
        foreach ( struct in structs )
        {
            if ( struct.targetname )
            {
                alias = struct.targetname;
                break;
            }
        }
        
        if ( alias )
        {
            level.var_20da6f84d2d7fa2a[ alias ] = alias;
        }
    }
    
    foreach ( var_1328eb56116bb239, structs in level.struct_class_names[ "targetname" ] )
    {
        foreach ( alias in level.var_20da6f84d2d7fa2a )
        {
            if ( alias != var_1328eb56116bb239 )
            {
                continue;
            }
            
            if ( !isdefined( level.vehicle_spawns[ alias ] ) )
            {
                level.vehicle_spawns[ alias ] = [];
            }
            
            foreach ( struct in structs )
            {
                level.vehicle_spawns[ alias ][ level.vehicle_spawns[ alias ].size ] = struct;
            }
            
            break;
        }
    }
}

// Namespace vehicle
// Params 0
// Checksum 0x4a521562, Offset: 0x88f2
// Size: 0x4ff
function watch_flipped()
{
    self endon( "death" );
    self endon( "flipped_end" );
    level endon( "game_ended" );
    ref = get_ref();
    flipstart = undefined;
    
    if ( utility::issharedfuncdefined( ref, #"flippedStart" ) )
    {
        flipstart = utility::getsharedfunc( ref, #"flippedStart" );
    }
    
    flipend = &function_a99c6cd2eef88212;
    
    if ( utility::issharedfuncdefined( ref, #"flippedEnd" ) )
    {
        flipend = utility::getsharedfunc( ref, #"flippedEnd" );
    }
    
    data = vehicle_interact::get_data( ref );
    burndowntimerangle = data.burndowntimerangle;
    var_95ff2dace48e5986 = data.var_95ff2dace48e5986;
    flippedtime = data.flippedtime;
    flippedmaxspeed = data.flippedmaxspeed;
    var_f42d7e1b3668107b = data.var_f42d7e1b3668107b;
    var_53ecbb9bd6025ee1 = data.var_53ecbb9bd6025ee1 ?? 0;
    
    if ( !isdefined( flippedtime ) )
    {
        flippedtime = 3000;
    }
    
    if ( !isdefined( flippedmaxspeed ) )
    {
        flippedmaxspeed = 1;
    }
    
    if ( !isdefined( var_f42d7e1b3668107b ) )
    {
        var_f42d7e1b3668107b = 0;
    }
    
    var_58c1e289944731a3 = 0;
    var_4be2876375f80706 = 0;
    starttime = undefined;
    waittime = 1;
    
    do
    {
        wait waittime;
        
        if ( data.var_a9060bc23eef1714 )
        {
            angle = math::anglebetweenvectorsunit( ( 0, 0, 1 ), anglestoup( self.angles ) );
            
            if ( angle > data.var_5e2e5c5c203808ab )
            {
                waittime = 0.1;
                vehicle_occupancy::function_1dafc6cf543f6545( self );
            }
        }
        
        if ( self vehicle_getspeed() < flippedmaxspeed )
        {
            angle = math::anglebetweenvectorsunit( ( 0, 0, 1 ), anglestoup( self.angles ) );
            
            if ( angle > var_95ff2dace48e5986 && var_95ff2dace48e5986 != 0 )
            {
                waittime = 0.1;
                
                if ( var_f42d7e1b3668107b != 0 && self function_f7573902f8a25b82() > var_f42d7e1b3668107b )
                {
                    continue;
                }
                
                if ( data.var_4a629c5bb2c02ef )
                {
                    println( "<dev string:x5b2>" );
                    vehicle_occupancy::function_e63376f7546b7cb8( self );
                }
                else
                {
                    println( "<dev string:x5df>" );
                    var_58c1e289944731a3 = 1;
                }
                
                if ( !var_4be2876375f80706 && data.var_a78f9bf5290a6ef2 )
                {
                    var_4be2876375f80706 = 1;
                    println( "<dev string:x616>" );
                    vehicle_occupancy::function_6d9760c4971403c2( self, 0 );
                    vehicle_interact::allow_use( self, 0 );
                }
            }
            
            if ( angle > burndowntimerangle )
            {
                waittime = 0.1;
                
                if ( var_f42d7e1b3668107b != 0 && self function_f7573902f8a25b82() > var_f42d7e1b3668107b )
                {
                    continue;
                }
                
                println( "<dev string:x63a>" );
                
                if ( !isdefined( starttime ) )
                {
                    starttime = gettime() + 1500;
                }
                
                var_821aeafda2b52f9 = 0;
                
                if ( gettime() > starttime )
                {
                    if ( isdefined( flipstart ) )
                    {
                        thread [[ flipstart ]]( self );
                    }
                    
                    endtime = gettime() + flippedtime;
                    
                    do
                    {
                        wait 0.1;
                        angle = math::anglebetweenvectorsunit( ( 0, 0, 1 ), anglestoup( self.angles ) );
                        println( "<dev string:x672>" );
                        
                        if ( angle <= burndowntimerangle )
                        {
                            var_821aeafda2b52f9 = 0;
                            println( "<dev string:x699>" );
                            
                            if ( var_4be2876375f80706 && data.var_a78f9bf5290a6ef2 )
                            {
                                println( "<dev string:x6c6>" );
                                var_4be2876375f80706 = 0;
                                
                                if ( !self.isdestroyed )
                                {
                                    vehicle_occupancy::function_6d9760c4971403c2( self, 1 );
                                    vehicle_interact::allow_use( self, 1 );
                                }
                            }
                            
                            break;
                        }
                        
                        var_821aeafda2b52f9 = 1;
                    }
                    while ( gettime() < endtime );
                    
                    if ( isdefined( flipend ) )
                    {
                        thread [[ flipend ]]( self, var_821aeafda2b52f9 );
                    }
                }
                
                var_58c1e289944731a3 = var_821aeafda2b52f9;
            }
            else if ( angle > 70 )
            {
                waittime = 0.1;
            }
            else
            {
                if ( var_53ecbb9bd6025ee1 )
                {
                    starttime = undefined;
                    var_58c1e289944731a3 = 0;
                }
                
                waittime = 1;
                
                if ( var_4be2876375f80706 && !var_58c1e289944731a3 && data.var_a78f9bf5290a6ef2 )
                {
                    println( "<dev string:x6c6>" );
                    var_4be2876375f80706 = 0;
                    
                    if ( !self.isdestroyed )
                    {
                        vehicle_occupancy::function_6d9760c4971403c2( self, 1 );
                        vehicle_interact::allow_use( self, 1 );
                    }
                }
                
                if ( vehicle_occupancy::function_6e6afd819ebbe705( self ).size == 0 )
                {
                    if ( !isdefined( self.var_e2f56f41c8d24c59 ) || self.var_e2f56f41c8d24c59 == 0 )
                    {
                        self waittill( "player_enter" );
                    }
                }
            }
            
            continue;
        }
        
        starttime = undefined;
        var_58c1e289944731a3 = 0;
        waittime = 1;
    }
    while ( !var_58c1e289944731a3 || var_53ecbb9bd6025ee1 );
    
    if ( getdvarint( @"hash_ce3ffd0926397091", 0 ) == 1 || data.var_4a629c5bb2c02ef )
    {
        println( "<dev string:x6e9>" );
        vehicle_occupancy::function_e63376f7546b7cb8( self );
    }
    
    if ( getdvarint( @"hash_c084757764bcd6d2", 0 ) == 1 || data.var_a78f9bf5290a6ef2 )
    {
        println( "<dev string:x616>" );
        vehicle_occupancy::function_6d9760c4971403c2( self, 0 );
        vehicle_interact::allow_use( self, 0 );
    }
}

// Namespace vehicle
// Params 2
// Checksum 0xb426a123, Offset: 0x8df9
// Size: 0x41
function function_a99c6cd2eef88212( vehicle, timedout )
{
    if ( timedout && !vehicle.flipped )
    {
        vehicle.flipped = 1;
        vehicle thread vehicle_spawn::stuck_timeout();
    }
}

// Namespace vehicle
// Params 0
// Checksum 0x64164df7, Offset: 0x8e42
// Size: 0x68
function function_58de621582c824ba()
{
    level notify( "vehicle_deleteCollmapVehicles" );
    level endon( "vehicle_deleteCollmapVehicles" );
    wait 1;
    vehicles = getentarray( "delete_me", #targetname );
    
    if ( isdefined( vehicles ) && vehicles.size > 0 )
    {
        for ( i = vehicles.size - 1; i >= 0 ; i-- )
        {
            vehicles[ i ] delete();
        }
    }
}

// Namespace vehicle
// Params 0
// Checksum 0x96c79773, Offset: 0x8eb2
// Size: 0xc
function get_mass()
{
    return self function_8d5e756e5cd572ae( "mass" );
}

// Namespace vehicle
// Params 0
// Checksum 0xc0c9b9cc, Offset: 0x8ec7
// Size: 0xa9
function function_2827d474013c9b36()
{
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    vehicle_omnvar::show_warning( "missileLocking", occupants, get_ref() );
    
    foreach ( occupant in occupants )
    {
        occupant stoplocalsound( "veh_warning_missile_locking" );
        occupant playlocalsound( "veh_warning_missile_locking" );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0xe17ff647, Offset: 0x8f78
// Size: 0x9d
function function_64601c183a904237()
{
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    vehicle_omnvar::hide_warning( "missileLocking", occupants, get_ref() );
    
    foreach ( occupant in occupants )
    {
        occupant stoplocalsound( "veh_warning_missile_locking" );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0xe5f0a1af, Offset: 0x901d
// Size: 0x107
function function_4990747d597e6f1f()
{
    hadwarning = istrue( self.var_4c567014a63269e );
    var_6587916bf2052af1 = 0;
    
    if ( isdefined( self.bunkerbustersattached ) )
    {
        foreach ( team in self.bunkerbustersattached )
        {
            if ( !function_977daeae4e2f0e30( self, team ) )
            {
                var_6587916bf2052af1 = 1;
                break;
            }
        }
    }
    
    if ( hadwarning == var_6587916bf2052af1 )
    {
        return;
    }
    
    self.var_4c567014a63269e = var_6587916bf2052af1;
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    
    if ( var_6587916bf2052af1 )
    {
        vehicle_omnvar::show_warning( "BunkerBusterAttached", occupants, get_ref() );
        return;
    }
    
    vehicle_omnvar::hide_warning( "BunkerBusterAttached", occupants, get_ref() );
}

// Namespace vehicle
// Params 0
// Checksum 0xd1ab6a19, Offset: 0x912c
// Size: 0xa9
function incoming_callback()
{
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    vehicle_omnvar::show_warning( "missileIncoming", occupants, get_ref() );
    
    foreach ( occupant in occupants )
    {
        occupant stoplocalsound( "veh_warning_missile_incoming" );
        occupant playlocalsound( "veh_warning_missile_incoming" );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0xfa802b1, Offset: 0x91dd
// Size: 0x9d
function function_c88608287290f539()
{
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    vehicle_omnvar::hide_warning( "missileIncoming", occupants, get_ref() );
    
    foreach ( occupant in occupants )
    {
        occupant stoplocalsound( "veh_warning_missile_incoming" );
    }
}

// Namespace vehicle
// Params 0
// Checksum 0x64e1c97, Offset: 0x9282
// Size: 0x10f
function create_customization()
{
    if ( getdvarint( @"hash_742caa13b3c2e685" ) )
    {
        return undefined;
    }
    
    if ( isagent( self ) )
    {
        return undefined;
    }
    
    vehiclecustomization = spawnstruct();
    vehiclecustomization.horns = [];
    vehiclecustomization.skins = [];
    
    foreach ( ref, data in level.var_a7bf93687486b5ba )
    {
        if ( !isstring( ref ) )
        {
            continue;
        }
        
        mtxdata = function_9f6a9bf9120d5a37( ref );
        
        if ( !isdefined( mtxdata ) )
        {
            continue;
        }
        
        vehiclecustomization.skins[ ref ] = get_skin( mtxdata );
        vehiclecustomization.horns[ ref ] = get_horn( mtxdata );
    }
    
    return vehiclecustomization;
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0xcfea279c, Offset: 0x939a
// Size: 0xe3
function private get_skin( data )
{
    if ( !( isdefined( data ) && isdefined( data.mtx ) ) || data.mtx.size == 0 )
    {
        return undefined;
    }
    
    id = undefined;
    projectname = getprojectname();
    
    if ( projectname != "T10" && projectname != "WZ2" && projectname != "SAT" && projectname != "SAW" )
    {
        id = utility::callsharedfunc( #"player", #"getplayerdata", level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "camo" );
    }
    
    if ( !isdefined( id ) )
    {
        return undefined;
    }
    
    id -= 1;
    
    if ( isdefined( id ) )
    {
        return data.mtx[ id ];
    }
    
    return undefined;
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0xd86a3b01, Offset: 0x9486
// Size: 0xff
function private get_horn( data )
{
    if ( !( isdefined( data ) && isdefined( data.horns ) ) || data.horns.size == 0 )
    {
        return undefined;
    }
    
    id = undefined;
    projectname = getprojectname();
    
    if ( projectname != "T10" && projectname != "WZ2" && projectname != "SAT" && projectname != "SAW" )
    {
        id = utility::callsharedfunc( #"player", #"getplayerdata", level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "horn" );
    }
    
    if ( !isdefined( id ) )
    {
        return undefined;
    }
    
    id -= 1;
    
    if ( isdefined( id ) && isdefined( data.horns[ id ] ) )
    {
        return data.horns[ id ].alias;
    }
    
    return undefined;
}

// Namespace vehicle
// Params 2
// Checksum 0x65c34040, Offset: 0x958e
// Size: 0x1ce
function function_a634e7859d837381( player, vehicleref )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    mtx = undefined;
    
    if ( isdefined( player.vehiclecustomization.skins[ vehicleref ] ) )
    {
        mtx = player.vehiclecustomization.skins[ vehicleref ];
    }
    else if ( getdvarint( @"hash_42c1e6eb518bf4fc", 0 ) == 1 && utility::cointoss() )
    {
        data = get_data( vehicleref );
        
        if ( isdefined( data ) && isdefined( data.mtx ) && data.mtx.size > 0 )
        {
            mtx = utility::random( data.mtx );
        }
    }
    else if ( getdvarint( @"hash_d0405b9fee9d9869", -1 ) > -1 )
    {
        selectedmtx = getdvarint( @"hash_d0405b9fee9d9869", -1 );
        data = get_data( vehicleref );
        
        if ( isdefined( data ) && isdefined( data.mtx ) && data.mtx.size > 0 && selectedmtx < data.mtx.size )
        {
            mtx = data.mtx[ selectedmtx ];
        }
    }
    
    return mtx;
}

// Namespace vehicle
// Params 2
// Checksum 0xc0454ec2, Offset: 0x9765
// Size: 0x10d
function set_mtx( vehicle, mtx )
{
    if ( !isdefined( mtx ) )
    {
        return;
    }
    
    vehicle.mtx = mtx;
    bundlename = vehicle function_ab60c6b563088b74( mtx.ref );
    vehicle namespace_258c393149f2e837::function_c65ed663d13b2579( bundlename );
    
    if ( isdefined( mtx.turretcamo ) )
    {
        foreach ( turret in get_turrets( vehicle ) )
        {
            turret utility::callsharedfunc( #"vehicle", #"setvehicleturretcamo", mtx.turretcamo );
        }
    }
    
    if ( isdefined( mtx.vehicletrail ) )
    {
        vehicle thread update( vehicle );
    }
}

// Namespace vehicle
// Params 2, eflags: 0x4
// Checksum 0xf40cff03, Offset: 0x987a
// Size: 0x154
function private find_mtx( vehicleref, vehcamo )
{
    if ( isstring( vehicleref ) && has_data( vehicleref ) )
    {
        if ( level.projectbundle.var_53c4124af039142e )
        {
            if ( isdefined( get_data( vehicleref ).vehicle ) )
            {
                vehicleref = get_data( vehicleref ).vehicle;
            }
        }
        else if ( isdefined( get_data( vehicleref ).bundlename ) )
        {
            vehicleref = get_data( vehicleref ).bundlename;
        }
    }
    
    if ( !( isdefined( vehcamo ) && isdefined( vehicleref ) ) )
    {
        return;
    }
    
    data = function_9f6a9bf9120d5a37( vehicleref );
    
    if ( !( isdefined( data ) && isdefined( data.mtx ) ) )
    {
        return;
    }
    
    foreach ( struct in data.mtx )
    {
        if ( vehcamo == struct.ref )
        {
            return struct;
        }
    }
}

// Namespace vehicle
// Params 2
// Checksum 0x55feb855, Offset: 0x99d6
// Size: 0x241
function function_9f6a9bf9120d5a37( vehicleref, options )
{
    data = get_data( vehicleref );
    
    if ( !level.projectbundle.var_53c4124af039142e && data.mtxvehicleref )
    {
        vehicleref = data.mtxvehicleref;
        
        if ( !has_data( vehicleref ) )
        {
            if ( !isdefined( level.var_191c9ed011aaca31 ) )
            {
                level.var_191c9ed011aaca31 = [];
            }
            
            if ( isdefined( level.var_191c9ed011aaca31[ vehicleref ] ) )
            {
                data = level.var_191c9ed011aaca31[ vehicleref ];
            }
            else
            {
                bundlename = function_451bd53633bae879( vehicleref );
                
                if ( !bundlename )
                {
                    return undefined;
                }
                
                data = function_431e68bd95544217( bundlename, [ #"ref", #"vehicle", #"interact", #"horns", #"mtx" ] );
                data = { #mtx:data.mtx, #horns:data.horns, #interact:data.interact, #vehicle:data.vehicle, #ref:data.ref };
                data.bundlename = bundlename;
                level.var_191c9ed011aaca31[ vehicleref ] = data;
            }
        }
        else
        {
            data = get_data( vehicleref );
        }
    }
    
    if ( !( isdefined( data.vehicle ) && isdefined( data ) && isdefined( data.interact ) ) )
    {
        return undefined;
    }
    
    if ( data.interact.var_c3d9b257664dde2a && !data.var_98e937e655b0c2dd )
    {
        return undefined;
    }
    
    if ( ( !isdefined( data.horns ) || data.horns.size == 0 ) && ( !isdefined( data.mtx ) || data.mtx.size == 0 ) && !data.haswartracks )
    {
        return undefined;
    }
    
    return data;
}

/#

    // Namespace vehicle
    // Params 3
    // Checksum 0x5b2c2b6d, Offset: 0x9c20
    // Size: 0x1d1, Type: dev
    function function_b7228e49642d3ae8( vehcamo, hornindex, trailindex )
    {
        vehiclecustomization = spawnstruct();
        vehiclecustomization.horns = [];
        vehiclecustomization.skins = [];
        skinindex = undefined;
        
        if ( isint( vehcamo ) )
        {
            skinindex = vehcamo;
        }
        
        foreach ( ref, data in level.var_a7bf93687486b5ba )
        {
            if ( !isstring( ref ) )
            {
                continue;
            }
            
            data = function_9f6a9bf9120d5a37( ref );
            
            if ( isdefined( data ) && isstring( vehcamo ) && isdefined( data.mtx ) )
            {
                skinindex = undefined;
                
                foreach ( index, struct in data.mtx )
                {
                    if ( vehcamo == struct.ref )
                    {
                        skinindex = index;
                        break;
                    }
                }
            }
            
            if ( isdefined( skinindex ) )
            {
                vehiclecustomization.skins[ ref ] = function_35c48553f53ba742( data, skinindex );
            }
            
            if ( isdefined( hornindex ) )
            {
                vehiclecustomization.horns[ ref ] = function_96a828df13d5d8c2( data, hornindex );
            }
        }
        
        return vehiclecustomization;
    }

    // Namespace vehicle
    // Params 2
    // Checksum 0x7a562899, Offset: 0x9df9
    // Size: 0x5a, Type: dev
    function function_35c48553f53ba742( data, skinindex )
    {
        if ( isagent( self ) )
        {
            return undefined;
        }
        
        if ( isdefined( data.mtx ) && isdefined( data ) && isdefined( data.mtx[ skinindex ] ) )
        {
            return data.mtx[ skinindex ];
        }
        
        return undefined;
    }

    // Namespace vehicle
    // Params 2
    // Checksum 0x4b27fe7d, Offset: 0x9e5b
    // Size: 0x5a, Type: dev
    function function_96a828df13d5d8c2( data, hornindex )
    {
        if ( isdefined( data.horns ) && isdefined( data ) && isdefined( data.horns[ hornindex ] ) )
        {
            return data.horns[ hornindex ].alias;
        }
        
        return undefined;
    }

#/

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x8bb703c0, Offset: 0x9ebd
// Size: 0x10a
function private function_23cb77ee148dd43a()
{
    if ( getdvarint( @"hash_b1e5a269c62e79c7", 1 ) == 0 )
    {
        return;
    }
    
    ref = get_ref();
    
    if ( !isdefined( ref ) || !has_data( ref ) )
    {
        return;
    }
    
    data = get_data( ref );
    
    if ( !( isdefined( data ) && isdefined( data.tricks ) ) )
    {
        return;
    }
    
    self endon( "death" );
    childthread function_dc993db7c9bfc9e4();
    
    while ( true )
    {
        self waittill( "trick_in", trickname );
        
        if ( !isdefined( vehicle_occupancy::get_driver( self ) ) )
        {
            continue;
        }
        
        if ( self.var_da3d5c322baadd72[ trickname ] == gettime() )
        {
            continue;
        }
        
        if ( !isdefined( data.tricks[ trickname ] ) )
        {
            assertmsg( "<dev string:x724>" + trickname + "<dev string:x730>" );
            continue;
        }
        
        hash = getxhash( trickname );
        childthread reward_trick( trickname, data.tricks[ trickname ], hash );
    }
}

// Namespace vehicle
// Params 3, eflags: 0x4
// Checksum 0x4fed456c, Offset: 0x9fcf
// Size: 0x2c4
function private reward_trick( trickname, trickdata, hash )
{
    self notify( trickname + "_rewarding" );
    self endon( trickname + "_rewarding" );
    self endon( trickname + "_ended" );
    trickxp = utility::callsharedfunc( #"rank", #"getscoreinfoxp", hash );
    
    if ( !isdefined( trickxp ) )
    {
        return;
    }
    
    wait trickdata.delay;
    player = vehicle_occupancy::get_driver( self );
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    player utility::callsharedfunc( #"challenges", #"reportVehicleEvent", self, trickname );
    
    if ( trickname == "frontflip" || trickname == "backflip" || trickname == "nacnac_left" || trickname == "nacnac_right" || trickname == "superman" )
    {
        player utility::callsharedfunc( #"challenges", #"reportVehicleEvent", self, "any_air_trick" );
    }
    
    if ( !isdefined( self.var_5c3021badb8c2239 ) )
    {
        self.var_5c3021badb8c2239 = [];
    }
    
    index = function_f02c63b99c9614c9( self.var_5c3021badb8c2239, trickname );
    var_14e3960ded354ef0 = 1;
    
    if ( isdefined( index ) )
    {
        switch ( index )
        {
            case 0:
                var_14e3960ded354ef0 = 0.2;
                break;
            case 1:
                var_14e3960ded354ef0 = 0.4;
                break;
            case 2:
                var_14e3960ded354ef0 = 0.6;
                break;
            case 3:
                var_14e3960ded354ef0 = 0.8;
                break;
        }
    }
    
    trickxp *= var_14e3960ded354ef0;
    self.var_5c3021badb8c2239 = arrayremove( self.var_5c3021badb8c2239, trickname );
    arrayinsert( self.var_5c3021badb8c2239, trickname, 0 );
    
    if ( isdefined( self.combo ) && self.combo != trickname )
    {
        player give_xp( #"combo", utility::callsharedfunc( #"rank", #"getscoreinfoxp", #"combo" ) );
    }
    
    thread watch_combo( trickname );
    
    if ( trickdata.type == "reward_points_once" )
    {
        player give_xp( hash, int( trickxp ) );
        return;
    }
    
    decay = 1;
    
    while ( isdefined( player ) )
    {
        xp = int( max( 1, round( trickxp * decay ) ) );
        player give_xp( hash, xp );
        decay -= 0.2;
        
        if ( decay < 0.1 )
        {
            return;
        }
        
        wait 0.5;
        player = vehicle_occupancy::get_driver( self );
    }
}

// Namespace vehicle
// Params 2, eflags: 0x4
// Checksum 0xc80dc542, Offset: 0xa29b
// Size: 0x70
function private give_xp( event, xp )
{
    utility::callsharedfunc( #"rank", #"displayscoreeventpoints", xp, event );
    utility::callsharedfunc( #"rank", #"killeventtextpopup", event, 1 );
    utility::callsharedfunc( #"rank", #"giverankxp", event, xp, undefined, 1, undefined, 1 );
}

// Namespace vehicle
// Params 0, eflags: 0x4
// Checksum 0x9a67d82c, Offset: 0xa313
// Size: 0x44
function private function_dc993db7c9bfc9e4()
{
    self.var_da3d5c322baadd72 = [];
    
    while ( true )
    {
        self waittill( "trick_out", trickname );
        self notify( trickname + "_ended" );
        self.var_da3d5c322baadd72[ trickname ] = gettime();
    }
}

// Namespace vehicle
// Params 1, eflags: 0x4
// Checksum 0x488a4558, Offset: 0xa35f
// Size: 0xb2
function private watch_combo( trickname )
{
    if ( self getwheelsurface( 0 ) != "none" && self getwheelsurface( 1 ) != "none" )
    {
        return;
    }
    
    self.combo = trickname;
    self notify( "watchCombo" );
    self endon( "watchCombo" );
    self endon( "death" );
    timeonground = 0;
    
    while ( true )
    {
        if ( self getwheelsurface( 0 ) != "none" && self getwheelsurface( 1 ) != "none" )
        {
            timeonground += level.framedurationseconds;
        }
        else
        {
            timeonground = 0;
        }
        
        if ( timeonground >= 0.25 )
        {
            break;
        }
        
        waitframe();
    }
    
    self.combo = undefined;
}

/#

    // Namespace vehicle
    // Params 0
    // Checksum 0xe801620, Offset: 0xa419
    // Size: 0x87, Type: dev
    function function_29c73ed8fb254ad3()
    {
        if ( self.inlaststand )
        {
            return 0;
        }
        
        if ( isdefined( self.vehicle ) )
        {
            return 0;
        }
        
        if ( utility::callsharedfunc( #"execution", #"isinexecutionattack" ) || utility::callsharedfunc( #"execution", #"isinexecutionvictim" ) )
        {
            return 0;
        }
        
        if ( !utility::callsharedfunc( #"player", #"playerisalive" ) )
        {
            return 0;
        }
        
        if ( utility::isusingremote() )
        {
            return 0;
        }
        
        return 1;
    }

    // Namespace vehicle
    // Params 2
    // Checksum 0x212d8340, Offset: 0xa4a8
    // Size: 0xac, Type: dev
    function function_48833bc196a87e8c( vehicleref, spawndata )
    {
        if ( vehicleref == %"hash_511d52fb0fdd07c7" )
        {
            spawndata.spawnmethod = "<dev string:x760>";
            spawndata.cantimeout = 0;
        }
        
        /#
            if ( getdvarint( @"hash_e422b8f9cc30c4bb", 0 ) == 1 )
            {
                spawndata vehicle_spawn::set_flag( 3 );
            }
            
            if ( getdvarint( @"hash_7ca94be708b6afcf", 0 ) == 1 )
            {
                spawndata vehicle_spawn::set_flag( 5 );
            }
        #/
        
        vehicle = spawn( vehicleref, spawndata );
        return [ vehicle, "<dev string:x77c>" ];
    }

    // Namespace vehicle
    // Params 1
    // Checksum 0xa28d9326, Offset: 0xa55c
    // Size: 0x398, Type: dev
    function function_69fd088e96b07e30( vehicleref )
    {
        isinvehicle = function_502f53b13c796577();
        
        if ( !isinvehicle && !function_29c73ed8fb254ad3() || !has_data( vehicleref ) )
        {
            iprintln( "<dev string:x786>" );
            return;
        }
        
        data = vehicle_occupancy::get_data( vehicleref );
        spawnangles = self.angles * ( 0, 1, 0 );
        spawnposition = undefined;
        
        if ( isinvehicle )
        {
            currentdata = vehicle_occupancy::get_data( get_vehicle() get_ref() );
            forward = self.origin + rotatevector( ( ( data.exitextents[ "<dev string:x7a1>" ] ?? 300 ) + ( currentdata.exitextents[ "<dev string:x7a9>" ] ?? 300 ) + 200, 0, 0 ), spawnangles );
            back = self.origin + rotatevector( -1 * ( ( data.exitextents[ "<dev string:x7a9>" ] ?? 300 ) + ( currentdata.exitextents[ "<dev string:x7a1>" ] ?? 300 ) + 200, 0, 0 ), spawnangles );
            left = self.origin + rotatevector( -1 * ( 0, ( data.exitextents[ "<dev string:x7b2>" ] ?? 300 ) + ( currentdata.exitextents[ "<dev string:x7bb>" ] ?? 300 ) + 300, 0 ), spawnangles );
            right = self.origin + rotatevector( ( 0, ( data.exitextents[ "<dev string:x7bb>" ] ?? 300 ) + ( currentdata.exitextents[ "<dev string:x7b2>" ] ?? 300 ) + 300, 0 ), spawnangles );
            
            foreach ( origin in [ forward, back, left, right ] )
            {
                if ( vehicle_spawn::function_c49e68f891a06e6f( origin, vehicleref ) )
                {
                    spawnposition = origin;
                    break;
                }
            }
        }
        else
        {
            spawnposition = self.origin;
        }
        
        if ( !isdefined( spawnposition ) )
        {
            iprintln( "<dev string:x7c3>" );
            return;
        }
        
        spawnposition += ( 0, 0, ( data.exitextents[ "<dev string:x7e7>" ] ?? 100 ) + 50 );
        vehicle = undefined;
        seatid = undefined;
        spawndata = spawnstruct();
        spawndata.origin = spawnposition;
        spawndata.angles = spawnangles;
        spawndata.spawntype = "<dev string:x7f1>";
        [ vehicle, seatid ] = function_48833bc196a87e8c( vehicleref, spawndata );
        
        if ( !isinvehicle && isdefined( vehicle ) && vehicle_interact::function_ecedc4c793a25cb( vehicle ) )
        {
            assert( isdefined( seatid ), "<dev string:x7fb>" );
            thread vehicle_occupancy::enter( vehicle, seatid, self, undefined, 1 );
        }
        else if ( !isdefined( vehicle ) )
        {
            iprintln( "<dev string:x786>" );
        }
        
        if ( isdefined( vehicle ) && vehicle ishelicopter() )
        {
            vehicle vehicle_occupancy::function_474d87fe62493d22();
        }
        
        return vehicle;
    }

    // Namespace vehicle
    // Params 1
    // Checksum 0x9bce9d19, Offset: 0xa8fc
    // Size: 0xa2, Type: dev
    function destroy_vehicles( vehicleref )
    {
        instances = vehicle_tracking::function_ff2863e4171248be( vehicleref );
        
        if ( isdefined( instances ) && instances.size > 0 )
        {
            foreach ( instance in instances )
            {
                instance explode();
            }
        }
    }

    // Namespace vehicle
    // Params 0
    // Checksum 0x70c5db69, Offset: 0xa9a6
    // Size: 0x18, Type: dev
    function function_5a8c10847228dce9()
    {
        wait 1;
        self setscriptablepartstate( "<dev string:x844>", "<dev string:x84e>" );
    }

#/

// Namespace vehicle
// Params 3
// Checksum 0x4e8cbe88, Offset: 0xa9c6
// Size: 0x28
function vehicle_paths( node, var_ad6ef44930971fe1, var_1f8d7b4146f4fe75 )
{
    return vehicle_paths::_vehicle_paths( node, var_ad6ef44930971fe1, var_1f8d7b4146f4fe75 );
}

// Namespace vehicle
// Params 1
// Checksum 0x85f0bbff, Offset: 0xa9f7
// Size: 0x56, Type: bool
function function_502f53b13c796577( includetransitions )
{
    if ( self.vehicle && self.vehicle is_vehicle() )
    {
        return true;
    }
    
    if ( includetransitions )
    {
        if ( self.vehiclereserved && self.vehiclereserved is_vehicle() )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle
// Params 1
// Checksum 0xa0b58f6, Offset: 0xaa56
// Size: 0x32, Type: bool
function function_2ecc2cc1999058a2( dist )
{
    vehicles = vehicle_getarrayinradius( self.origin, dist );
    return vehicles && vehicles.size > 0;
}

// Namespace vehicle
// Params 0
// Checksum 0x7f30e9b, Offset: 0xaa91
// Size: 0x17
function get_vehicle()
{
    if ( !function_502f53b13c796577() )
    {
        return undefined;
    }
    
    return self.vehicle;
}

// Namespace vehicle
// Params 0
// Checksum 0x71ee426c, Offset: 0xaab1
// Size: 0xd
function godon()
{
    self.godmode = 1;
}

// Namespace vehicle
// Params 0
// Checksum 0x27c23b6b, Offset: 0xaac6
// Size: 0xc
function godoff()
{
    self.godmode = 0;
}

// Namespace vehicle
// Params 1
// Checksum 0x47cade1e, Offset: 0xaada
// Size: 0x3e
function function_5482992483c40f3b( parts )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    
    if ( !isarray( parts ) )
    {
        parts = [ parts ];
    }
    
    self.var_fb831c817947c10 = parts;
}

// Namespace vehicle
// Params 1
// Checksum 0xa110446c, Offset: 0xab20
// Size: 0x5a
function function_2d0d2f94a6742b11( parts )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    
    if ( !isdefined( self.var_bd120d4946ce78df ) )
    {
        return;
    }
    
    if ( !isarray( parts ) )
    {
        parts = [ parts ];
    }
    
    self.var_fb831c817947c10 = arrayremove( parts, self.var_bd120d4946ce78df );
}

// Namespace vehicle
// Params 0
// Checksum 0x4e7b3560, Offset: 0xab82
// Size: 0xd
function function_e9e92537da6624a6()
{
    self.demigodmode = 1;
}

// Namespace vehicle
// Params 0
// Checksum 0xad12b77c, Offset: 0xab97
// Size: 0xc
function function_d204c9d54ec98388()
{
    self.demigodmode = 0;
}

// Namespace vehicle
// Params 0
// Checksum 0xd788b363, Offset: 0xabab
// Size: 0x1a, Type: bool
function is_vehicle()
{
    return isdefined( self.vehicletype ) || isdefined( self.vehiclename );
}

// Namespace vehicle
// Params 0
// Checksum 0x4adabb09, Offset: 0xabce
// Size: 0x3e, Type: bool
function is_tank()
{
    if ( !is_vehicle() )
    {
        return false;
    }
    
    ref = get_ref();
    return has_data( ref ) && get_data( ref ).istank;
}

// Namespace vehicle
// Params 0
// Checksum 0x88f4f8e1, Offset: 0xac15
// Size: 0x29, Type: bool
function is_static()
{
    return is_vehicle() && isdefined( self.classname ) && self.classname != "script_vehicle";
}

// Namespace vehicle
// Params 0
// Checksum 0xfdfc9921, Offset: 0xac47
// Size: 0x1c
function vehicle_is_crashing()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    return vehicle_code::vehicle_iscrashing();
}

// Namespace vehicle
// Params 0
// Checksum 0x8f222855, Offset: 0xac6c
// Size: 0xa
function vehicle_kill_rumble_forever()
{
    self notify( "kill_rumble_forever" );
}

// Namespace vehicle
// Params 0
// Checksum 0x61cb5bdd, Offset: 0xac7e
// Size: 0xb
function vehicle_wheels_forward()
{
    vehicle_code::vehicle_setwheeldirection( 1 );
}

// Namespace vehicle
// Params 0
// Checksum 0xdaad7bfc, Offset: 0xac91
// Size: 0xa
function vehicle_wheels_backward()
{
    vehicle_code::vehicle_setwheeldirection( 0 );
}

// Namespace vehicle
// Params 4
// Checksum 0x8e9eb042, Offset: 0xaca3
// Size: 0x1af
function vehicle_load_ai( ai, goddriver, group, spawninvehicle )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x887>" + "<dev string:x8c0>" + "<dev string:x8d4>" );
    
    if ( !isarray( ai ) )
    {
        ai = [ ai ];
    }
    
    vehicle_aianim::load_ai( ai, goddriver, group, spawninvehicle );
    
    if ( !self.usedpositions[ 0 ] && !self.player_drivable )
    {
        assert( self.riders.size );
        riders = self.riders;
        vehicle_unload();
        utility::ent_flag_wait( "unloaded" );
        riders = function_46f9072493651dc9( riders );
        riders = arrayremove( riders, self.riders );
        
        if ( riders.size > 0 )
        {
            vehicle_load_ai( riders );
        }
        
        return;
    }
    
    vehicleanim = level.vehicle.templates.aianims[ vehicle_code::get_vehicle_classname() ];
    
    if ( isdefined( vehicleanim[ 0 ].death ) )
    {
        foreach ( rider in self.riders )
        {
            if ( rider.drivingvehicle )
            {
                thread vehicle_aianim::driverdead( rider );
            }
        }
    }
}

// Namespace vehicle
// Params 3
// Checksum 0xbcf95eb6, Offset: 0xae5a
// Size: 0xaf
function function_698648338e3e7b6d( speed, accel = 20, decel = 20 )
{
    if ( speed == 0 && self hascomponent( "c2p" ) )
    {
        accel = min( accel, 0 );
        decel = min( decel, 10 );
    }
    
    self function_ec9291bb5b9a57c3( speed, accel, decel );
    
    if ( self hascomponent( "p2p" ) )
    {
        if ( speed == 0 )
        {
            self setconfigvalue( "p2p", "pause", 1 );
        }
        else
        {
            self setconfigvalue( "p2p", "resume", 1 );
        }
    }
    
    if ( speed != 0 )
    {
        self.lastpathspeed = speed;
    }
}

// Namespace vehicle
// Params 1
// Checksum 0xea15feaa, Offset: 0xaf11
// Size: 0x57
function function_25f904e1dc108b0( accel )
{
    if ( !self hascomponent( "p2p" ) && !self hascomponent( "c2p" ) )
    {
        self resumespeed( accel );
        return;
    }
    
    if ( isnumber( self.lastpathspeed ) )
    {
        function_698648338e3e7b6d( self.lastpathspeed, accel, 0 );
    }
}

// Namespace vehicle
// Params 1
// Checksum 0x7fc61b45, Offset: 0xaf70
// Size: 0x4a
function function_51906bc4fc51948( pathdir )
{
    if ( self hascomponent( "p2p" ) )
    {
        self setconfigvalue( "p2p", "reverseForBehindGoal", pathdir == "reverse" ? 1 : 0 );
        return;
    }
    
    /#
        iprintln( "<dev string:x8e0>" );
    #/
}

// Namespace vehicle
// Params 2
// Checksum 0x91ab290f, Offset: 0xafc2
// Size: 0x51
function attach_vehicle( node, interpolate )
{
    self vehicle_teleport( node.origin, node.angles, interpolate );
    
    if ( !ishelicopter() )
    {
        waitframe();
        self attachpath( node );
    }
    
    thread vehicle_paths( node, 1 );
}

// Namespace vehicle
// Params 3
// Checksum 0xd9bee2d9, Offset: 0xb01b
// Size: 0xc1
function attach_vehicle_and_gopath( node, teleport = 1, interpolate = 0 )
{
    if ( teleport )
    {
        self vehicle_teleport( node.origin, node.angles, interpolate );
        waitframe();
    }
    
    var_a67085e06872446a = 1;
    
    if ( !ishelicopter() )
    {
        if ( !self vehicle_isphysveh() || !self hascomponent( "path" ) )
        {
            self attachpath( node );
            var_a67085e06872446a = 0;
        }
    }
    else
    {
        var_a67085e06872446a = 0;
    }
    
    self.hasstarted = 1;
    thread vehicle_paths( node );
    
    if ( var_a67085e06872446a )
    {
        vehicle_paths::function_2af4522b1fc2bcc9( node );
        return;
    }
    
    vehicle_paths::gopath( self );
}

// Namespace vehicle
// Params 1
// Checksum 0x4aa82d96, Offset: 0xb0e4
// Size: 0x19c
function vehicle_get_riders_by_group( groupname )
{
    group = [];
    assert( isdefined( self.vehicletype ) );
    classname = vehicle_code::get_vehicle_classname();
    
    if ( !isdefined( level.vehicle.templates.unloadgroups[ classname ] ) )
    {
        return group;
    }
    
    vehicles_groups = level.vehicle.templates.unloadgroups[ classname ];
    
    if ( !isdefined( groupname ) )
    {
        return group;
    }
    
    foreach ( guy in self.riders )
    {
        assert( isdefined( guy.vehicle_position ) );
        
        foreach ( groupid in vehicles_groups[ groupname ] )
        {
            if ( guy.vehicle_position == groupid )
            {
                group[ group.size ] = guy;
            }
        }
    }
    
    return group;
}

// Namespace vehicle
// Params 1
// Checksum 0xd138a610, Offset: 0xb289
// Size: 0x14
function vehicle_unload( who )
{
    return vehicle_code::_vehicle_unload( who );
}

// Namespace vehicle
// Params 0
// Checksum 0xb6c07912, Offset: 0xb2a6
// Size: 0xa
function vehicle_turret_scan_off()
{
    self notify( "stop_scanning_turret" );
}

// Namespace vehicle
// Params 2
// Checksum 0x23c6764c, Offset: 0xb2b8
// Size: 0x133
function vehicle_get_path_array( start_node, var_775231a6436d50e4 = 0 )
{
    self endon( "death" );
    apathnodes = [];
    
    if ( !isdefined( start_node ) && !isdefined( self.attachedpath ) )
    {
        return apathnodes;
    }
    
    estartnode = start_node ?? self.attachedpath;
    nextnode = estartnode;
    nextnode.counted = 0;
    
    while ( isdefined( nextnode ) )
    {
        if ( nextnode.counted )
        {
            break;
        }
        
        apathnodes[ apathnodes.size ] = nextnode;
        nextnode.counted = 1;
        
        if ( !isdefined( nextnode.target ) )
        {
            break;
        }
        
        if ( !ishelicopter() )
        {
            var_107928f86cbd5dbb = getvehiclenode( nextnode.target, #targetname );
            
            if ( !isdefined( var_107928f86cbd5dbb ) && var_775231a6436d50e4 )
            {
                nextnode = utility::getent_or_struct( nextnode.target, "targetname" );
            }
            else
            {
                nextnode = var_107928f86cbd5dbb;
            }
            
            continue;
        }
        
        nextnode = utility::getent_or_struct( nextnode.target, "targetname" );
    }
    
    return apathnodes;
}

// Namespace vehicle
// Params 2
// Checksum 0x59c5fe3a, Offset: 0xb3f4
// Size: 0x4d
function vehicle_lights_on( group, classname )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x887>" + "<dev string:x922>" + "<dev string:x8d4>" );
    
    if ( !isdefined( group ) )
    {
        group = "all";
    }
    
    vehicle_lights::lights_on( group, classname );
}

// Namespace vehicle
// Params 2
// Checksum 0x2be834f5, Offset: 0xb449
// Size: 0x4d
function vehicle_lights_off( group, classname )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x887>" + "<dev string:x941>" + "<dev string:x8d4>" );
    
    if ( !isdefined( group ) )
    {
        group = "all";
    }
    
    vehicle_lights::lights_off( group, classname );
}

// Namespace vehicle
// Params 2
// Checksum 0xd828e29c, Offset: 0xb49e
// Size: 0x30
function vehicle_switch_paths( next_node, target_node )
{
    self setswitchnode( next_node, target_node );
    self.attachedpath = target_node;
    thread vehicle_paths();
}

// Namespace vehicle
// Params 3
// Checksum 0x411ab968, Offset: 0xb4d6
// Size: 0x28
function vehicle_stop_named( stop_name, acceleration, deceleration )
{
    return vehicle_paths::_vehicle_stop_named( stop_name, acceleration, deceleration );
}

// Namespace vehicle
// Params 1
// Checksum 0x5c1d7093, Offset: 0xb507
// Size: 0x14
function vehicle_resume_named( stop_name )
{
    return vehicle_paths::_vehicle_resume_named( stop_name );
}

// Namespace vehicle
// Params 0
// Checksum 0xc90b33a8, Offset: 0xb524
// Size: 0x4e, Type: bool
function ishelicopter()
{
    if ( isdefined( self.isheli ) )
    {
        return true;
    }
    
    if ( !isdefined( self.vehicletype ) )
    {
        return false;
    }
    
    return isdefined( level.vehicle.templates.helicopter_list[ getxhashasset( self.vehicletype ) ] );
}

// Namespace vehicle
// Params 0
// Checksum 0x8ca1e6c8, Offset: 0xb57b
// Size: 0x5e, Type: bool
function isboat()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x887>" + "<dev string:x961>" + "<dev string:x8d4>" );
    
    if ( !isdefined( self.vehicletype ) )
    {
        return false;
    }
    
    return isdefined( level.vehicle.templates.boat_list[ getxhashasset( self.vehicletype ) ] );
}

// Namespace vehicle
// Params 0
// Checksum 0x2f49e3aa, Offset: 0xb5e2
// Size: 0x42, Type: bool
function isairplane()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    return isdefined( level.vehicle.templates.airplane_list[ getxhashasset( self.vehicletype ) ] );
}

// Namespace vehicle
// Params 0
// Checksum 0x37453bd5, Offset: 0xb62d
// Size: 0x52, Type: bool
function istank()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    
    if ( !isdefined( self.vehicletype ) )
    {
        return false;
    }
    
    return isdefined( level.vehicle.templates.tank_list[ getxhashasset( self.vehicletype ) ] );
}

// Namespace vehicle
// Params 0
// Checksum 0x53ce9c6d, Offset: 0xb688
// Size: 0xb
function function_8dddc3c1d00efcd()
{
    return self.damagestate;
}

// Namespace vehicle
// Params 0
// Checksum 0x2e67d88a, Offset: 0xb69c
// Size: 0xc, Type: bool
function isvehiclehusk()
{
    return istrue( self.isvehiclehusk );
}

// Namespace vehicle
// Params 0
// Checksum 0x563d2438, Offset: 0xb6b1
// Size: 0x13, Type: bool
function isvehiclealive()
{
    return is_vehicle() && !isvehiclehusk();
}

// Namespace vehicle
// Params 1
// Checksum 0xe6b3cb3, Offset: 0xb6cd
// Size: 0x23, Type: bool
function isvehicleweaponname( weaponname )
{
    return istrue( level.vehicle.weapons[ weaponname ] );
}

// Namespace vehicle
// Params 1
// Checksum 0x97234a82, Offset: 0xb6f9
// Size: 0x54, Type: bool
function isvehicleweapon( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x975>" );
        return false;
    }
    
    weaponname = undefined;
    
    if ( isweapon( weapon ) )
    {
        weaponname = weapon.basename;
    }
    else
    {
        weaponname = weapon;
    }
    
    return isvehicleweaponname( weaponname );
}

// Namespace vehicle
// Params 1
// Checksum 0x6d7878a0, Offset: 0xb756
// Size: 0x3b
function function_8f47b4d63c293bc( scale )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    assert( isdefined( scale ), "<dev string:x9b5>" );
    self.var_71c9d684a628ba6f = scale;
}

// Namespace vehicle
// Params 1
// Checksum 0x42ef417b, Offset: 0xb799
// Size: 0x3b
function function_8ca93d410bae825c( scale )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    assert( isdefined( scale ), "<dev string:x9b5>" );
    self.var_903e5eaa5ba2fd43 = scale;
}

// Namespace vehicle
// Params 0
// Checksum 0x5941f985, Offset: 0xb7dc
// Size: 0x3f
function function_42b0926dece8d7ef()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x887>" + "<dev string:x9d0>" + "<dev string:x8d4>" );
    return ( self.healthactual - self.healthbuffer ) / self.healthstarting;
}

// Namespace vehicle
// Params 0
// Checksum 0x52f003b6, Offset: 0xb824
// Size: 0xc, Type: bool
function function_ed46120613414ce0()
{
    return istrue( self.demigodmode );
}

// Namespace vehicle
// Params 0
// Checksum 0x6c608510, Offset: 0xb839
// Size: 0xc, Type: bool
function function_8f5225a51c9e101b()
{
    return istrue( self.godmode );
}

// Namespace vehicle
// Params 1
// Checksum 0xe9c70852, Offset: 0xb84e
// Size: 0x2b
function function_7580d912b2f2c8d0( bool )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    self.var_8eb97accba5b7984 = bool;
}

// Namespace vehicle
// Params 0
// Checksum 0xd5f11f67, Offset: 0xb881
// Size: 0x20, Type: bool
function function_4b457e48350d61ac()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    return istrue( self.var_8eb97accba5b7984 );
}

// Namespace vehicle
// Params 0
// Checksum 0xc945e74e, Offset: 0xb8aa
// Size: 0x48
function function_a49963d9930c48a2()
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    classname = vehicle_code::get_vehicle_classname();
    return level.vehicle.templates.hudindex[ classname ];
}

// Namespace vehicle
// Params 1
// Checksum 0x24b8b101, Offset: 0xb8fb
// Size: 0x44, Type: bool
function function_dfa3d2eee203d2d3( part )
{
    assert( !function_df978a2fa3318bbd(), "<dev string:x854>" );
    return isdefined( self.damageableparts[ part ] ) && !vehicle_damage::function_63ddfcea9493cb5( self.damageableparts[ part ] );
}

// Namespace vehicle
// Params 2
// Checksum 0x9abbcf93, Offset: 0xb948
// Size: 0xce
function function_72ad20c452340b5c( vehicle, var_46a7d3f8fe2737be )
{
    inoobtrigger = 0;
    
    if ( isdefined( vehicle.oob ) )
    {
        inoobtrigger = 1;
    }
    
    if ( !inoobtrigger && var_46a7d3f8fe2737be )
    {
        oobtriggers = level.outofboundstriggers;
        
        foreach ( trigger in oobtriggers )
        {
            if ( vehicle istouching( trigger ) )
            {
                inoobtrigger = 1;
                break;
            }
        }
    }
    
    return inoobtrigger;
}

// Namespace vehicle
// Params 1
// Checksum 0x1670ec88, Offset: 0xba1f
// Size: 0x6c
function function_6a14477bcf586606( str )
{
    if ( !isdefined( str ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_a3dce8b16e28153e ) )
    {
        level.var_a3dce8b16e28153e = [];
    }
    
    if ( !isdefined( level.var_a3dce8b16e28153e[ getxhash( "tag_origin" ) ] ) )
    {
        level.var_a3dce8b16e28153e[ getxhash( "tag_origin" ) ] = "tag_origin";
    }
    
    level.var_a3dce8b16e28153e[ getxhash( str ) ] = str;
}

// Namespace vehicle
// Params 1
// Checksum 0xda574598, Offset: 0xba93
// Size: 0x34
function function_d88b357b027cbaed( xhash )
{
    if ( !isdefined( level.var_a3dce8b16e28153e ) )
    {
        return "";
    }
    
    return level.var_a3dce8b16e28153e[ xhash ] ?? "";
}

// Namespace vehicle/event_47da3cd1faaecf41
// Params 0, eflags: 0x20
// Checksum 0xfd9226ea, Offset: 0xbad0
// Size: 0x9
function event_handler[event_47da3cd1faaecf41] codecallback_vehiclespawned()
{
    thread function_d52314a476fb7bff();
}

// Namespace vehicle
// Params 0
// Checksum 0x61fa79b6, Offset: 0xbae1
// Size: 0x15
function function_d52314a476fb7bff()
{
    function_77df346ea26d98d3();
    utility::ent_flag_set( "vehicle_spawned_callback_done" );
}

