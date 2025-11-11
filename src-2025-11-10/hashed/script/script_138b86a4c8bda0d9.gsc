#using script_16ea1b94f0f381b3;
#using script_1adabd4beb172de7;
#using script_45f403e1732217d3;
#using scripts\common\shellshock_utility;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_tracking;
#using scripts\common\weapon;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\equipment_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\killstreaks\killstreak_shared;
#using scripts\mp\damage;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\weapons;

#namespace dart_mark_zero;

// Namespace dart_mark_zero
// Params 0, eflags: 0x1
// Checksum 0xae207aea, Offset: 0x790
// Size: 0xa
function autoexec main()
{
    level function_f6cc0a04973e06de();
}

// Namespace dart_mark_zero
// Params 0, eflags: 0x4
// Checksum 0xcb181e24, Offset: 0x7a2
// Size: 0x100
function private function_f6cc0a04973e06de()
{
    utility::flag_wait( "equipment_initialized" );
    equipment::registercallback( "equip_dart_mark_zero", "onGive", &function_b697c9e8f281de3a );
    equipment::registercallback( "equip_dart_mark_zero", "onTake", &function_f1122cb9171da0e0 );
    equipment::registercallback( "equip_dart_mark_zero", "onDestroyedByTrophy", &function_19461580867e34f2 );
    weapons::registerusedcallback( "dart_mark_zero", &function_9bead8d8399b79f9 );
    weapons::function_2cd25260a11d5e40( #"dart_mark_zero", &function_abf35abf38899c03 );
    utility::registersharedfunc( #"dart_mark_zero", #"hack", &hack );
    killstreak_shared::function_28d986de72ce85f8( "cruise_color_mp" );
    killstreak_shared::function_28d986de72ce85f8( "vision/killstreak_rcxd_jammed.vision" );
    val::group_register( "driving_dart_mark_zero", [ "weapon_switch", "autoreload", "reload", "shellshock", "fire", "backpack_inventory" ] );
    utility::add_fx( "dart_mark_zero_friendly_light", "vfx_sat_core_equip_dart_mark_zero_light_friendly" );
}

// Namespace dart_mark_zero
// Params 4
// Checksum 0xbf86b502, Offset: 0x8aa
// Size: 0x2e
function function_b697c9e8f281de3a( equipmentref, equipmentslot, variantid, attachments )
{
    thread function_adeb38a847419508();
}

// Namespace dart_mark_zero
// Params 2
// Checksum 0x52e0ed6, Offset: 0x8e0
// Size: 0x2e
function function_f1122cb9171da0e0( equipmentref, slot )
{
    self notify( "dart_mark_zero_on_take" );
    function_1bb10c5c0524da9e();
    self.var_7588cd7b3ce2ce66 = undefined;
}

// Namespace dart_mark_zero
// Params 0, eflags: 0xc
// Checksum 0x19ebe9d8, Offset: 0x916
// Size: 0x17d
function private function_adeb38a847419508()
{
    self notify( "f848c7a5ca6a3c1d" );
    self endon( "f848c7a5ca6a3c1d" );
    self endon( "dart_mark_zero_on_take" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    
    if ( !isdefined( self.var_7588cd7b3ce2ce66 ) )
    {
        self.var_7588cd7b3ce2ce66 = 0;
    }
    
    var_8321d76528b840a1 = self meleebuttonpressed();
    
    while ( true )
    {
        if ( self.var_6393c8b48079c059 )
        {
            self.var_6393c8b48079c059 = 0;
            function_1bb10c5c0524da9e();
            wait 1;
            self.var_7588cd7b3ce2ce66 = 0;
        }
        
        if ( self isvehicleactive() )
        {
            function_1bb10c5c0524da9e();
            self.var_7588cd7b3ce2ce66 = 0;
        }
        else if ( player::isreallyalive( self ) )
        {
            currentweapon = weapon::getgrenadeinpullback();
            
            if ( currentweapon.basename == bundle.useweapon )
            {
                if ( self meleebuttonpressed() && !var_8321d76528b840a1 )
                {
                    self.var_7588cd7b3ce2ce66 = !self.var_7588cd7b3ce2ce66;
                    self playlocalsound( "eqp_sat_dart_mark_zero_switch_mode" );
                }
                
                if ( self.var_7588cd7b3ce2ce66 )
                {
                    function_de181017e819cb35( 0 );
                }
                else
                {
                    function_de181017e819cb35( 1 );
                }
            }
            else
            {
                function_1bb10c5c0524da9e();
                self.var_7588cd7b3ce2ce66 = 0;
            }
        }
        else
        {
            function_1bb10c5c0524da9e();
            self.var_7588cd7b3ce2ce66 = 0;
        }
        
        var_8321d76528b840a1 = self meleebuttonpressed();
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x3c88a373, Offset: 0xa9b
// Size: 0x498
function function_9bead8d8399b79f9( dart )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    dart endon( "exploded" );
    killfxontag( utility::getfx( "dart_mark_zero_friendly_light" ), dart, "tag_fx" );
    self.var_6393c8b48079c059 = 1;
    isunderwater = player_utility::isswimmingunderwater();
    
    if ( isunderwater == 1 )
    {
        dart setscriptablepartstate( #"exit", #"on", 0 );
        self.var_7588cd7b3ce2ce66 = 0;
        return;
    }
    
    ref = equipment::function_fdc4a655fbde0dec( dart.weapon_name );
    tableinfo = equipment::getequipmenttableinfo( ref );
    dart.var_d995ff3a8a3cb9c = tableinfo.bundle;
    assert( isdefined( dart.var_d995ff3a8a3cb9c ), "<dev string:x24>" );
    dart.owner = self;
    dart setentityowner( self );
    dart setotherent( self );
    dart.headiconid = entityheadicons::function_e2775272ceb208ca( dart );
    dart setscriptablepartstate( #"breacher_setup", #"on", 0 );
    dart thread function_86f8280456d2be0c();
    dart thread function_37c1211d42c75ec0();
    dart thread function_8c88c1557bf4a72b();
    var_ba043a2dd29526fd = dart.var_d995ff3a8a3cb9c.var_8188aa2b5ea2096a ?? 10;
    damagefeedback = "hitequip";
    dart setcandamage( 1 );
    dart thread damage::monitordamage( var_ba043a2dd29526fd, damagefeedback, &function_e3e9b944bde1ba13 );
    namespace_9d8e359c3b1041e5::function_9b4fb0a03905926d( dart, &function_9ccf8f848600a053 );
    gunangle = self getgunangles();
    launchdirection = anglestoforward( gunangle );
    launch_offset = 15;
    dart.origin += launchdirection * launch_offset;
    
    if ( self.var_7588cd7b3ce2ce66 && !isai( self ) )
    {
        dart.var_ec2a7a632e045ea6 = 1;
        self painvisionoff();
        shellshock_utility::_stopshellshock();
        var_2c50ebc26185557b = level.sharedfuncs[ #"damage_effects" ][ #"hash_7ff5e70e05a98fb0" ];
        
        if ( var_2c50ebc26185557b )
        {
            [[ var_2c50ebc26185557b ]]( 0.2 );
        }
        
        vehicle = function_7df2784e4d123751( dart );
        
        if ( !vehicle )
        {
            function_cb0a28c730f711fc( #"explosion" );
            thread function_2d9e422485c28b56( 0.35 );
            thread function_94a1cab72c7aa78f( 0.5 );
            thread function_635585e4fbd83e8();
            thread function_761c945c08e6de5d( dart );
        }
        else
        {
            vehicle.var_92f27893e3e47b21 = 1;
            dart.var_358dc66a42bbb556 = vehicle;
            dart linkto( vehicle, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
            dart.var_14f08f0fbff8e052 = [ vehicle ];
            vehicle_init( vehicle );
        }
    }
    else
    {
        if ( dart.var_d995ff3a8a3cb9c.var_c7709714d768097c && dart.weapon_object hasattachmenthash( dart.var_d995ff3a8a3cb9c.var_c7709714d768097c ) )
        {
            var_89de50630ddefa66 = dart.var_d995ff3a8a3cb9c.var_facceaeda6db76a7;
        }
        
        if ( !isdefined( var_89de50630ddefa66 ) )
        {
            var_89de50630ddefa66 = dart.var_d995ff3a8a3cb9c.var_f90b4fdff0ac1e27 ?? 500;
        }
        
        dart thread function_f12be320efcfb2ed();
        dart thread function_4dcb70f8062232e4( launchdirection, var_89de50630ddefa66 );
        lifetime = dart.var_d995ff3a8a3cb9c.var_9014033e64a2ace ?? 6;
        dart thread function_457c2f12b540e875( lifetime );
    }
    
    if ( !isdefined( level.var_80c6e313f9c36e80 ) )
    {
        level.var_80c6e313f9c36e80 = [];
    }
    
    level.var_80c6e313f9c36e80[ level.var_80c6e313f9c36e80.size ] = dart;
    dart function_9bd258cf8a1bb961();
    self.var_7588cd7b3ce2ce66 = 0;
    
    if ( level.var_36218e71baa7e689 )
    {
        level.var_89fe7f9fa2bc945d[ level.var_89fe7f9fa2bc945d.size ] = dart;
    }
    
    if ( level.var_36218e71baa7e689 )
    {
        dart.var_c5ccf9dff3b5e393 = &function_9ccf8f848600a053;
    }
    
    if ( dart.var_d995ff3a8a3cb9c.var_24e0e7e5ebb5f557 )
    {
        dart enableplayermarks( #"equipment" );
        
        if ( level.teambased )
        {
            dart filteroutplayermarks( self.team );
            return;
        }
        
        dart filteroutplayermarks( self );
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x5e08ddff, Offset: 0xf3b
// Size: 0x65
function function_9bd258cf8a1bb961()
{
    if ( utility::issharedfuncdefined( #"spawn", #"addSpawnInfluencer" ) )
    {
        self.dangerzoneid = [[ utility::getsharedfunc( #"spawn", #"addSpawnInfluencer" ) ]]( #"equipment_small", self.origin, self.team, self.owner, self );
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x2e7acdf2, Offset: 0xfa8
// Size: 0x9a
function function_925873cc428e541f()
{
    if ( utility::issharedfuncdefined( #"spawn", #"isspawninfluenceractive" ) && utility::issharedfuncdefined( #"spawn", #"removeSpawnInfluencer" ) )
    {
        if ( self.dangerzoneid && [[ utility::getsharedfunc( #"spawn", #"isspawninfluenceractive" ) ]]( self.dangerzoneid ) )
        {
            [[ utility::getsharedfunc( #"spawn", #"removeSpawnInfluencer" ) ]]( self.dangerzoneid );
            self.dangerzoneid = undefined;
        }
    }
}

// Namespace dart_mark_zero
// Params 0, eflags: 0x4
// Checksum 0x5c990a82, Offset: 0x104a
// Size: 0xf8
function private function_f12be320efcfb2ed()
{
    self endon( "death" );
    self endon( "exploded" );
    endangles = self.angles;
    xtilt = self.angles[ 0 ] + -20;
    startangle = ( xtilt, self.angles[ 1 ], self.angles[ 2 ] );
    self.angles = anglelerpquat( self.angles, startangle, 1 );
    lerpfraction = 0;
    starttime = gettime();
    lerpduration = 2500;
    
    while ( true )
    {
        timepassed = gettime() - starttime;
        lerpfraction = timepassed / lerpduration;
        
        if ( lerpfraction < 1 )
        {
            self.angles = math::lerp( startangle, endangles, lerpfraction );
        }
        else
        {
            wait 0.2;
            function_8e2f34e3505a0faa();
        }
        
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 0, eflags: 0xc
// Checksum 0xf4187808, Offset: 0x114a
// Size: 0xf8
function private function_8e2f34e3505a0faa()
{
    self notify( "56f306de40e3c6cd" );
    self endon( "56f306de40e3c6cd" );
    self endon( "death" );
    self endon( "exploded" );
    startangle = self.angles;
    var_cdba324c0bbf4dc0 = self.angles[ 0 ] + 20;
    endangles = ( var_cdba324c0bbf4dc0, self.angles[ 1 ], self.angles[ 2 ] );
    self.angles = anglelerpquat( self.angles, endangles, 1 );
    lerpfraction = 0;
    starttime = gettime();
    lerpduration = 2500;
    
    while ( true )
    {
        timepassed = gettime() - starttime;
        lerpfraction = timepassed / lerpduration;
        
        if ( lerpfraction < 1 )
        {
            self.angles = math::lerp( startangle, endangles, lerpfraction );
        }
        
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 2, eflags: 0x4
// Checksum 0x970ffb8d, Offset: 0x124a
// Size: 0x414
function private function_4dcb70f8062232e4( direction, speed )
{
    self endon( "death" );
    self endon( "exploded" );
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    var_db9e33a8831c62c4 = 0.5;
    lifetime = self.var_d995ff3a8a3cb9c.var_9014033e64a2ace ?? 6;
    vectordistance = speed * lifetime;
    lerpduration = lifetime * 1000;
    startpos = self.origin;
    previouspos = self.origin;
    targetpos = startpos + direction * vectordistance + self.owner getvelocity() * var_db9e33a8831c62c4;
    direction = vectornormalize( targetpos - startpos );
    starttime = gettime();
    raycaststart = self.origin;
    raycastdistance = 20;
    raycastend = raycaststart + direction * raycastdistance;
    collisioncontents = trace::create_contents( 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0 );
    var_2da10fd09e300ae8 = [ self, self.owner ];
    
    while ( true )
    {
        timepassed = gettime() - starttime;
        lerpfraction = timepassed / lerpduration;
        traceresults = trace::ray_trace_get_all_results( previouspos, raycastend, var_2da10fd09e300ae8, collisioncontents, 1 );
        
        foreach ( traceresult in traceresults )
        {
            if ( !traceresult[ "hittype" ] || traceresult[ "hittype" ] == "hittype_none" )
            {
                continue;
            }
            else if ( traceresult[ "hittype" ] == "hittype_entity" )
            {
                ent = traceresult[ "entity" ];
                
                if ( ent.var_aa82c7f64e626133 )
                {
                    continue;
                }
                
                if ( isplayer( ent ) || isai( ent ) )
                {
                    if ( level.teambased && ent.team === self.owner.team )
                    {
                        continue;
                    }
                }
            }
            
            if ( traceresult[ "surfacetype" ] == "surftype_glass_pane" )
            {
                currtime = gettime();
                
                if ( !self.var_fd48c3196a686869 || ( currtime - self.var_fd48c3196a686869 ) * 0.001 > 0.1 )
                {
                    glassradiusdamage( self.origin, 100, 1000, 1000 );
                    self.var_fd48c3196a686869 = currtime;
                    continue;
                }
                
                self.var_fd48c3196a686869 = currtime;
            }
            
            thread function_e3e9b944bde1ba13();
            break;
        }
        
        if ( self.isteleporting )
        {
            newpos = self.teleportpos;
            var_446b395e40ddc565 = self.teleportpos - previouspos;
            previouspos = self.teleportpos;
            startpos += var_446b395e40ddc565;
            startpos = utility::function_6b6c127afa12d17( self.teleportpos, startpos, self.var_6c9a05d823512922 );
            targetpos += var_446b395e40ddc565;
            targetpos = utility::function_6b6c127afa12d17( self.teleportpos, targetpos, self.var_6c9a05d823512922 );
            direction = utility::function_6b6c127afa12d17( ( 0, 0, 0 ), direction, self.var_6c9a05d823512922 );
            self.angles = self.var_6c9a05d823512922;
            self.isteleporting = 0;
        }
        else
        {
            newpos = math::lerp( startpos, targetpos, lerpfraction );
            previouspos = self.origin;
        }
        
        self.origin = newpos;
        raycastend = self.origin + direction * raycastdistance;
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 2
// Checksum 0x15b0aa2f, Offset: 0x1666
// Size: 0x36
function function_6ac9d9a6de774c78( teleportpos, var_6c9a05d823512922 )
{
    self.isteleporting = 1;
    self.teleportpos = teleportpos;
    self.var_6c9a05d823512922 = var_6c9a05d823512922;
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0x38a4f0ac, Offset: 0x16a4
// Size: 0x59
function private function_457c2f12b540e875( time )
{
    self endon( "death" );
    self endon( "exploded" );
    self.owner endon( "disconnect" );
    wait time;
    
    if ( self.var_d995ff3a8a3cb9c.var_dbf04d9ef02a441b )
    {
        thread function_e3e9b944bde1ba13();
        return;
    }
    
    thread function_e3e9b944bde1ba13( undefined, 1 );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x5614021d, Offset: 0x1705
// Size: 0x2bb
function function_7df2784e4d123751( dart )
{
    if ( function_3fa7aee4ef2f6001( dart ) )
    {
        return undefined;
    }
    
    if ( dart.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 && dart.weapon_object hasattachmenthash( dart.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 ) )
    {
        vehicleasset = dart.bundle.var_9874f7e6d815734d ?? "veh_sat_dart_mark_zero_controlled";
    }
    else
    {
        vehicleasset = "veh_sat_dart_mark_zero_controlled";
    }
    
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    spawndata = {};
    spawndata.origin = dart.origin;
    spawndata.angles = dart.angles;
    spawndata.modelname = "tag_origin_rigid_dart_mark_zero";
    spawndata.vehicletype = vehicleasset;
    spawndata.targetname = "rcplane";
    faildata = {};
    vehicle = vehicle_tracking::spawn_vehicle( spawndata, faildata );
    
    if ( !vehicle )
    {
        /#
            thread utility::error( "<dev string:x46>" );
        #/
        
        return;
    }
    
    vehicle.angles = spawndata.angles;
    vehicle.team = self.team;
    vehicle.type = "remote";
    vehiclehealth = dart.var_d995ff3a8a3cb9c.var_8188aa2b5ea2096a ?? 10;
    vehicle.health = vehiclehealth;
    vehicle.maxhealth = vehiclehealth;
    vehicle.currenthealth = vehiclehealth;
    vehicle.owner = self;
    vehicle setentityowner( self );
    vehicle setotherent( self );
    vehicle.lifetime = dart.var_d995ff3a8a3cb9c.var_4e52a854495ab91 ?? 6;
    vehicle.weapon_name = bundle.useweapon;
    vehicle.weaponobj = dart.weapon_object;
    vehicle.owneralive = isalive( self );
    vehicle.spawnlocation = vehicle.origin;
    vehicle.vehiclename = vehicleasset;
    vehicle.var_c0de7ceb7f9a28e5 = dart;
    vehicle setvehicleteam( vehicle.team );
    vehicle_tracking::register_instance( vehicle );
    vehicle setcandamage( 0 );
    return vehicle;
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xd1f1d497, Offset: 0x19c9
// Size: 0x255, Type: bool
function function_3fa7aee4ef2f6001( dart )
{
    tracestartpos = dart.origin;
    tracedistance = 100;
    traceradius = 3;
    traceendpos = tracestartpos + anglestoforward( self getgunangles() ) * tracedistance;
    var_b2f5468e791c0094 = trace::create_contents( 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0 );
    ignorelist = [ self, dart ];
    
    if ( level.teambased && self.team )
    {
        allies = getplayersinradius( tracestartpos, tracedistance, undefined, 0, self, self.team );
        
        if ( allies )
        {
            ignorelist = arraycombine( ignorelist, allies );
        }
    }
    
    traceback = trace::sphere_trace( tracestartpos, traceendpos, traceradius, ignorelist, var_b2f5468e791c0094 );
    
    if ( traceback[ "hittype" ] != "hittype_none" )
    {
        /#
            debugtextcolor = ( 0, 1, 0 );
            debugtextscale = 2;
            debugdrawframeduration = 600;
            debugposx = 500;
            debugposy = 1000;
            var_55c913ff3ae8f46a = 30;
            printtoscreen2d( debugposx, debugposy, "<dev string:x9b>" + traceback[ "<dev string:xbf>" ], debugtextcolor, debugtextscale, debugdrawframeduration );
            
            if ( traceback[ "<dev string:xca>" ] )
            {
                printtoscreen2d( debugposx, debugposy + var_55c913ff3ae8f46a * 2, "<dev string:xd4>" + ( traceback[ "<dev string:xca>" ].classname ?? "<dev string:xe3>" ), debugtextcolor, debugtextscale, debugdrawframeduration );
                printtoscreen2d( debugposx, debugposy + var_55c913ff3ae8f46a * 3, "<dev string:xee>" + ( traceback[ "<dev string:xca>" ].model ?? "<dev string:xe3>" ), debugtextcolor, debugtextscale, debugdrawframeduration );
                printtoscreen2d( debugposx, debugposy + var_55c913ff3ae8f46a * 4, "<dev string:xf9>" + ( traceback[ "<dev string:xca>" ].owner.guid ?? "<dev string:xe3>" ), debugtextcolor, debugtextscale, debugdrawframeduration );
                printtoscreen2d( debugposx, debugposy + var_55c913ff3ae8f46a * 5, "<dev string:x109>" + ( traceback[ "<dev string:xca>" ].owner.team ?? "<dev string:xe3>" ), debugtextcolor, debugtextscale, debugdrawframeduration );
            }
        #/
        
        return true;
    }
    
    return false;
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xafb931cb, Offset: 0x1c27
// Size: 0x325
function vehicle_init( vehicle )
{
    thread function_3ce3b327870658b1( vehicle );
    self.restoreangles = self.angles;
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"defender_init" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        vehicle [[ var_32dbca3143d9c4a5 ]]( 0, 0, 0 );
    }
    
    val::group_set( "driving_dart_mark_zero", 0 );
    player::setusingremote( "equip_dart_mark_zero" );
    namespace_23c79201421792eb::function_80a95f340a7c8f67( self, self, vehicle.weaponobj, vehicle getentitynumber() );
    self notifyonplayercommand( "dart_mark_zero_detonate", "+attack" );
    self cameraunlink();
    self cameralinkto( vehicle, "tag_player", 1 );
    self usevehicle( vehicle, 0 );
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    var_4dc75c50e4d42a2f = bundle.var_574f525cbf75a6d0;
    
    if ( vehicle.var_c0de7ceb7f9a28e5 )
    {
        alertfulllength = vehicle.lifetime / 2;
        var_c3193942aa25f78 = 0.25;
        var_28e5801bce7f4815 = 0.65;
        var_b84c3eae995cb030 = 0.001;
        var_ed6c729701a7f3ed = 0.05;
        endtime = gettime() + utility::function_4b74c15943231980( vehicle.lifetime );
        vehicle.var_c0de7ceb7f9a28e5 thread killstreak_shared::function_585fb909f40d8659( endtime, alertfulllength, var_c3193942aa25f78, var_28e5801bce7f4815, var_b84c3eae995cb030, var_ed6c729701a7f3ed );
    }
    
    if ( vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 && vehicle.var_c0de7ceb7f9a28e5.weapon_object hasattachmenthash( vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 ) )
    {
        self setclientomnvar( "ui_killstreak_boost_button_enabled", 1 );
    }
    else
    {
        self setclientomnvar( "ui_killstreak_boost_button_enabled", 0 );
    }
    
    self setclientomnvar( o"ui_killstreak_controls", 29 );
    var_225c495bde49787b = 1;
    killstreak_shared::function_b3302c4317df36c6();
    var_3953c24c42c3e037 = 0;
    
    if ( utility::issharedfuncdefined( #"dart_mark_zero", #"hash_27638cfac85e6c0c" ) )
    {
        var_3953c24c42c3e037 = utility::callsharedfunc( #"dart_mark_zero", #"hash_27638cfac85e6c0c" );
    }
    
    if ( !var_3953c24c42c3e037 )
    {
        killstreak_shared::function_a402a9f43d6f7512( "killstreak_shared", undefined, undefined, var_225c495bde49787b );
    }
    
    thread function_91c68919a40c6ec2( vehicle );
    thread function_4879bddac631d15f( vehicle );
    vehicle.ispiloted = 1;
    namespace_9d8e359c3b1041e5::registerentforoobsharedfunc( vehicle, "killstreak" );
    utility::registersharedfunc( vehicle.vehiclename, #"hash_5b74b0cc7bc13e5c", &function_44bcf50464a0df06 );
    utility::registersharedfunc( vehicle.vehiclename, #"hash_3365a912c11d2ba0", &function_2d26fbfda4f66efe );
    utility::callsharedfunc( #"hash_d8976e21a6adafba", #"hash_b99e77a93a09b9d5", vehicle, &function_b2c516329ac97bf7, &function_3496a96dca04b3ff );
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x5c5a9ff5, Offset: 0x1f54
// Size: 0xa
function function_2d26fbfda4f66efe()
{
    self notify( "expired" );
}

// Namespace dart_mark_zero
// Params 2
// Checksum 0x97c9d196, Offset: 0x1f66
// Size: 0x2d, Type: bool
function function_44bcf50464a0df06( trigger, vehicle )
{
    if ( trigger.targetname == "Drone_OutOfBounds" )
    {
        return true;
    }
    
    return false;
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x677d7b46, Offset: 0x1f9c
// Size: 0x8d
function function_91c68919a40c6ec2( vehicle )
{
    self endon( "death_or_disconnect" );
    vehicle endon( "exploded" );
    var_4565558cb4444c1e = [ "missile_turret", "sentry_gun", "rcxd", "tank_drone", "counter_uav", "uav", "chopper_door_gunner", "airdrop_escort", "hellstorm_missile", "airdrop" ];
    killstreak_shared::function_505d16f50dee75d2( var_4565558cb4444c1e );
}

#using_animtree( "script_model" );

// Namespace dart_mark_zero
// Params 1
// Checksum 0x71dd7882, Offset: 0x2031
// Size: 0xf0
function function_3ce3b327870658b1( vehicle )
{
    self endon( "death_or_disconnect" );
    vehicle endon( "exploded" );
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    
    if ( !bundle.var_e9c9dc9856cdb631 )
    {
        assertmsg( "<dev string:x119>" );
        return;
    }
    
    var_c72fdbdcecc7797f = makeweapon( bundle.var_e9c9dc9856cdb631 );
    deployanim = %vm_ks_tablet_tap_raise;
    self.var_f21f0a08550fe96d = var_c72fdbdcecc7797f;
    self.var_ee17b99754dc6511 = self getcurrentweapon();
    inventory_utility::_giveweapon( var_c72fdbdcecc7797f, 0, 0, 1 );
    self function_a00aa20bed47ee69( 1 );
    switchresult = inventory_utility::domonitoredweaponswitch( var_c72fdbdcecc7797f, 1, 1 );
    self function_a00aa20bed47ee69( 0 );
    
    if ( !switchresult )
    {
        self.var_ee17b99754dc6511 = undefined;
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x42e973f1, Offset: 0x2129
// Size: 0x60
function function_f60f078487804e09()
{
    if ( !self )
    {
        return;
    }
    
    if ( self.var_f21f0a08550fe96d )
    {
        self takeweapon( self.var_f21f0a08550fe96d );
        self.var_f21f0a08550fe96d = undefined;
    }
    
    if ( isalive( self ) && self.var_ee17b99754dc6511 )
    {
        thread inventory_utility::domonitoredweaponswitch( self.var_ee17b99754dc6511, 1, 1 );
        self.var_ee17b99754dc6511 = undefined;
    }
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xf11fe79d, Offset: 0x2191
// Size: 0xef
function function_b2c516329ac97bf7( vehicle )
{
    if ( vehicle.var_e8d7f39a5478703 )
    {
        vehicle.owner function_7e8d3810af840d36( #"boost" );
    }
    
    vehicle.owner function_cb0a28c730f711fc( #"jammed" );
    vehicle.var_c0de7ceb7f9a28e5 setscriptablepartstate( #"jammed", #"on", 0 );
    vehicle.var_8903b68424de5c4a = vehicle.veh_speed ?? vehicle.veh_topspeed;
    var_968f72416b7a5ef7 = vehicle.var_8903b68424de5c4a * ( vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_f7238baad0b21895 ?? 0.5 );
    vehicle rcplane_setminspeed( var_968f72416b7a5ef7 );
    vehicle rcplane_settopspeed( var_968f72416b7a5ef7 );
    vehicle rcplane_settopspeedboost( var_968f72416b7a5ef7 );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x9e8bb5c1, Offset: 0x2288
// Size: 0xa9
function function_3496a96dca04b3ff( vehicle )
{
    vehicle.owner function_7e8d3810af840d36( #"jammed" );
    
    if ( vehicle.var_e8d7f39a5478703 )
    {
        vehicle.owner function_cb0a28c730f711fc( #"boost" );
    }
    
    vehicle.var_c0de7ceb7f9a28e5 setscriptablepartstate( #"jammed", #"off", 0 );
    vehicle rcplane_setminspeed( vehicle.var_8903b68424de5c4a );
    vehicle rcplane_settopspeed( vehicle.var_8903b68424de5c4a );
    vehicle rcplane_settopspeedboost( vehicle.var_8903b68424de5c4a );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x42009369, Offset: 0x2339
// Size: 0x161
function function_4879bddac631d15f( vehicle )
{
    level endon( "game_ended" );
    vehicle vehphys_enablecollisioncallback( 1 );
    vehicle thread function_d1124aabcac5bfa1();
    vehicle thread function_d8fc88e61f0da9c7();
    vehicle thread function_22b86bd8784f4dc1();
    vehicle thread function_32ac72f0283d4efa();
    childthread function_ad0a628cd7611060( vehicle );
    
    if ( vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 && vehicle.var_c0de7ceb7f9a28e5.weapon_object hasattachmenthash( vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_e36b84555e7df1d3 ) )
    {
        childthread function_9f7508b65c75f8a1( vehicle );
    }
    
    explodeinfo = vehicle function_69a5817d0c499fb1( "water_collision", "explode_collision", "expired", "detonate", "shot_down", "exceed_range" );
    
    if ( vehicle )
    {
        function_cec36baec949341a( vehicle );
        
        if ( vehicle.var_c0de7ceb7f9a28e5 )
        {
            if ( explodeinfo.msg == "expired" && !vehicle.var_c0de7ceb7f9a28e5.var_d995ff3a8a3cb9c.var_dbf04d9ef02a441b )
            {
                vehicle.var_c0de7ceb7f9a28e5 thread function_e3e9b944bde1ba13( undefined, 1 );
                return;
            }
            
            vehicle.var_c0de7ceb7f9a28e5 thread function_e3e9b944bde1ba13();
        }
    }
}

// Namespace dart_mark_zero
// Params 2
// Checksum 0x1956bd92, Offset: 0x24a2
// Size: 0x74
function function_5af432e99cf487eb( msg, ent )
{
    ent endon( "die" );
    self waittill( msg, param1, param2, param3, param4, param5, param6 );
    ent notify( "returned", msg, param1, param2, param3, param4, param5, param6 );
}

// Namespace dart_mark_zero
// Params 6
// Checksum 0xc668504c, Offset: 0x251e
// Size: 0x196
function function_69a5817d0c499fb1( var_19eee95063be9ec9, var_19eee65063be9830, var_19eee75063be9a63, var_19eeec5063bea562, var_19eeed5063bea795, var_19eeea5063bea0fc )
{
    self endon( "exploded" );
    ent = {};
    
    if ( var_19eee95063be9ec9 )
    {
        thread function_5af432e99cf487eb( var_19eee95063be9ec9, ent );
    }
    
    if ( var_19eee65063be9830 )
    {
        thread function_5af432e99cf487eb( var_19eee65063be9830, ent );
    }
    
    if ( var_19eee75063be9a63 )
    {
        thread function_5af432e99cf487eb( var_19eee75063be9a63, ent );
    }
    
    if ( var_19eeec5063bea562 )
    {
        thread function_5af432e99cf487eb( var_19eeec5063bea562, ent );
    }
    
    if ( var_19eeed5063bea795 )
    {
        thread function_5af432e99cf487eb( var_19eeed5063bea795, ent );
    }
    
    if ( var_19eeea5063bea0fc )
    {
        thread function_5af432e99cf487eb( var_19eeea5063bea0fc, ent );
    }
    
    ent waittill( "returned", msg, param1, param2, param3, param4, param5, param6, param7, param8 );
    explodeinfo = {};
    explodeinfo.msg = msg;
    explodeinfo.param1 = param1;
    explodeinfo.param2 = param2;
    explodeinfo.param3 = param3;
    explodeinfo.param4 = param4;
    explodeinfo.param5 = param5;
    explodeinfo.param6 = param6;
    explodeinfo.param7 = param7;
    explodeinfo.param8 = param8;
    return explodeinfo;
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x65a9fad1, Offset: 0x26bd
// Size: 0x4e
function function_d8fc88e61f0da9c7()
{
    self endon( "exploded" );
    hitwater = 0;
    
    while ( true )
    {
        var_ac69e2dda1b4de28 = self getorigin();
        
        if ( var_ac69e2dda1b4de28 )
        {
            hitwater = utility::ispointinwater( var_ac69e2dda1b4de28 );
        }
        
        if ( hitwater )
        {
            self notify( "water_collision" );
            break;
        }
        
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x8a6bb9c, Offset: 0x2713
// Size: 0x193
function function_22b86bd8784f4dc1()
{
    self endon( "exploded" );
    wait 0.3;
    
    while ( true )
    {
        self waittill( "collision", body0, body1, flag0, flag1, position, normal, impulse, ent );
        
        if ( ent )
        {
            if ( isplayer( ent ) || isai( ent ) )
            {
                if ( level.teambased && ent != self.owner && ent.team === self.owner.team )
                {
                    waitframe();
                    continue;
                }
            }
            else if ( ent.var_aa82c7f64e626133 )
            {
                continue;
            }
            else
            {
                surfacetype = physics_getsurfacetypefromflags( flag1 )[ "name" ];
                
                if ( surfacetype == "surftype_glass_pane" )
                {
                    currtime = gettime();
                    
                    if ( !self.var_fd48c3196a686869 || ( currtime - self.var_fd48c3196a686869 ) * 0.001 > 0.1 )
                    {
                        glassradiusdamage( self.origin, 100, 1000, 1000 );
                        self.var_fd48c3196a686869 = currtime;
                        waitframe();
                        continue;
                    }
                    
                    self.var_fd48c3196a686869 = currtime;
                }
                else if ( self.isteleporting )
                {
                    waitframe();
                    continue;
                }
            }
        }
        
        self notify( "explode_collision", body0, body1, flag0, flag1, position, normal, impulse, ent );
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0xf516ecdd, Offset: 0x28ae
// Size: 0x117
function function_32ac72f0283d4efa()
{
    self endon( "exploded" );
    radius = 96;
    collisioncontents = trace::create_contents( 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0 );
    var_2da10fd09e300ae8 = [ self, self.owner, self.var_c0de7ceb7f9a28e5 ];
    
    while ( true )
    {
        nearestdoor = function_9130900aeb0f3030( self.origin, radius );
        
        if ( nearestdoor && nearestdoor isscriptableinstance() )
        {
            startpos = self.origin;
            endpos = self.origin + vectornormalize( anglestoforward( self.angles ) ) * radius;
            traceresult = trace::ray_trace( startpos, endpos, var_2da10fd09e300ae8, collisioncontents );
            
            if ( traceresult[ "hittype" ] && traceresult[ "hittype" ] != "hittype_none" )
            {
                self notify( "explode_collision" );
                return;
            }
            else
            {
                wait 0.1;
            }
        }
        
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x1634cbde, Offset: 0x29cd
// Size: 0x20
function function_21afbec2b2e6bf8d()
{
    self endon( "exploded" );
    self.isteleporting = 1;
    waitframe();
    self.isteleporting = 0;
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x1c59e638, Offset: 0x29f5
// Size: 0x2c
function function_ad0a628cd7611060( vehicle )
{
    vehicle endon( "exploded" );
    wait 0.4;
    self waittill( "dart_mark_zero_detonate" );
    vehicle notify( "detonate" );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x3ab58dd3, Offset: 0x2a29
// Size: 0xbe
function function_9f7508b65c75f8a1( vehicle )
{
    vehicle endon( "exploded" );
    self setclientomnvar( "ui_killstreak_boost_recharge_percentage", 1 );
    
    while ( self sprintbuttonpressed() )
    {
        waitframe();
    }
    
    while ( !self sprintbuttonpressed() )
    {
        waitframe();
    }
    
    vehicle thread function_6c33bbf5d6195fb3();
    vehicle function_33d2754103778ebf();
    vehicle.var_e8d7f39a5478703 = 1;
    
    if ( !vehicle.isjammed )
    {
        function_cb0a28c730f711fc( #"boost" );
    }
    
    if ( vehicle.var_c0de7ceb7f9a28e5 )
    {
        vehicle.var_c0de7ceb7f9a28e5 setscriptablepartstate( #"boost", #"on", 0 );
    }
    
    if ( !utility::issp() )
    {
        self lerpfovbypreset( "valkyrie_rocket_zoom_in" );
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x58c8f41d, Offset: 0x2aef
// Size: 0x9f
function function_6c33bbf5d6195fb3()
{
    self endon( "exploded" );
    percentage = 1;
    totaltimems = 500;
    starttime = gettime();
    
    while ( self.owner )
    {
        deltatime = gettime() - starttime;
        percentage = 1 - float( deltatime ) / totaltimems;
        
        if ( percentage < 0 )
        {
            self.owner setclientomnvar( "ui_killstreak_boost_recharge_percentage", 0 );
            return;
        }
        
        self.owner setclientomnvar( "ui_killstreak_boost_recharge_percentage", percentage );
        waitframe();
    }
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0x14ffca90, Offset: 0x2b96
// Size: 0x26
function function_94a1cab72c7aa78f( var_19da703e40ca49d1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    wait var_19da703e40ca49d1;
    namespace_9d8e359c3b1041e5::clearusingremotesharedfunc();
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x6381779, Offset: 0x2bc4
// Size: 0xa9
function function_d1124aabcac5bfa1()
{
    self endon( "exploded" );
    self.var_6e6fde450878ea19 = 0;
    player = self.owner;
    self.var_1717a034842e3ec3 = self.lifetime * 1000 + gettime();
    
    while ( self.var_6e6fde450878ea19 < self.lifetime )
    {
        self.var_6e6fde450878ea19 += level.framedurationseconds;
        
        if ( player )
        {
            player setclientomnvar( "ui_killstreak_lifetime", 1 - self.var_6e6fde450878ea19 / self.lifetime );
        }
        
        waitframe();
    }
    
    self notify( "expired" );
}

// Namespace dart_mark_zero
// Params 2
// Checksum 0x398194a2, Offset: 0x2c75
// Size: 0x3de
function function_e3e9b944bde1ba13( damageinfo, var_fbbc049604f06150 )
{
    if ( self.exploding )
    {
        return;
    }
    
    self.exploding = 1;
    self notify( "exploded" );
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    
    if ( damageinfo )
    {
        if ( !isdefined( var_fbbc049604f06150 ) )
        {
            var_fbbc049604f06150 = 1;
        }
        
        attacker = damageinfo.attacker;
        
        if ( !attacker || attacker && !isplayer( attacker ) )
        {
            if ( attacker.owner && isplayer( attacker.owner ) )
            {
                attacker = attacker.owner;
            }
        }
        
        if ( player_utility::playersareenemies( self.owner, attacker ) )
        {
            attacker notify( "destroyed_equipment" );
            attacker equipment::function_ada7da3083a6c593( self, damageinfo.objweapon );
        }
    }
    
    if ( !var_fbbc049604f06150 )
    {
        self setscriptablepartstate( #"explode", #"on", 0 );
    }
    else
    {
        self setscriptablepartstate( #"explode", #"on_nodamage", 0 );
    }
    
    function_925873cc428e541f();
    
    if ( self.var_ec2a7a632e045ea6 && self.var_358dc66a42bbb556 )
    {
        if ( ( damageinfo || var_fbbc049604f06150 ) && self.owner )
        {
            self.owner function_cec36baec949341a( self.var_358dc66a42bbb556 );
        }
        
        self.var_358dc66a42bbb556 thread function_9221713817db77e5();
        self.var_358dc66a42bbb556 = undefined;
    }
    
    if ( !var_fbbc049604f06150 )
    {
        if ( self.var_d995ff3a8a3cb9c.var_c7709714d768097c && self.weapon_object hasattachmenthash( self.var_d995ff3a8a3cb9c.var_c7709714d768097c ) )
        {
            var_7349c7a6c93f7047 = self.var_d995ff3a8a3cb9c.var_433eefba41ce0630;
            var_6ca8ea59f57aad36 = self.var_d995ff3a8a3cb9c.var_4ca6380025a3705;
            var_4b909db4d9037bed = self.var_d995ff3a8a3cb9c.var_6e492af5742dca8e;
            var_e0b5eeb72cd83714 = self.var_d995ff3a8a3cb9c.var_f15cb1bd409cf663;
            var_3b5eb4a0c9aff8b2 = self.var_d995ff3a8a3cb9c.var_36a5d83bcdbc835;
            var_af73cc887e991cc7 = self.var_d995ff3a8a3cb9c.var_2e20b2b79e9fb93c;
        }
        
        if ( !isdefined( var_7349c7a6c93f7047 ) )
        {
            var_7349c7a6c93f7047 = self.var_d995ff3a8a3cb9c.var_284506057d8b61b0 ?? 60;
        }
        
        if ( !isdefined( var_6ca8ea59f57aad36 ) )
        {
            var_6ca8ea59f57aad36 = self.var_d995ff3a8a3cb9c.var_59c7b31e44ed2685 ?? 140;
        }
        
        if ( !isdefined( var_4b909db4d9037bed ) )
        {
            var_4b909db4d9037bed = self.var_d995ff3a8a3cb9c.var_c3467a93b6c0ba0e ?? 120;
        }
        
        if ( !isdefined( var_e0b5eeb72cd83714 ) )
        {
            var_e0b5eeb72cd83714 = self.var_d995ff3a8a3cb9c.var_cc4834c3860359e3 ?? 100;
        }
        
        if ( !isdefined( var_3b5eb4a0c9aff8b2 ) )
        {
            var_3b5eb4a0c9aff8b2 = self.var_d995ff3a8a3cb9c.var_e87073cef89923b5 ?? 180;
        }
        
        if ( !isdefined( var_af73cc887e991cc7 ) )
        {
            var_af73cc887e991cc7 = self.var_d995ff3a8a3cb9c.var_831e0255e132a8bc ?? 70;
        }
        
        meansofdeath = toupper( self.var_d995ff3a8a3cb9c.var_132036d3279aba56 ?? "MOD_EXPLOSIVE" );
        self radiusdamagestepped( self.origin, var_7349c7a6c93f7047, var_6ca8ea59f57aad36, var_4b909db4d9037bed, var_e0b5eeb72cd83714, var_3b5eb4a0c9aff8b2, var_af73cc887e991cc7, damageinfo.attacker ?? self.owner, meansofdeath, bundle.useweapon );
        physicsscale = 1;
        physicsexplosionsphere( self.origin, var_3b5eb4a0c9aff8b2, var_7349c7a6c93f7047, physicsscale );
    }
    
    wait 0.2;
    
    if ( self )
    {
        self delete();
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0xd9fcbdef, Offset: 0x305b
// Size: 0xc
function function_19461580867e34f2()
{
    thread function_e3e9b944bde1ba13( undefined, 1 );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xcb78d79e, Offset: 0x306f
// Size: 0x17
function function_9ccf8f848600a053( empstruct )
{
    thread function_e3e9b944bde1ba13( empstruct, 1 );
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0xba3a9c1a, Offset: 0x308e
// Size: 0x56
function function_9221713817db77e5()
{
    if ( self.owner )
    {
        self.owner setclientomnvarbit( "ui_veh_warning", 2, 0 );
    }
    
    utility::callsharedfunc( #"hash_d8976e21a6adafba", #"hash_216d35a250cd860", self );
    self notify( "exploded" );
    vehicle_tracking::deregister_instance( self );
    vehicle_tracking::delete_vehicle( self );
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xf1e18b0e, Offset: 0x30ec
// Size: 0x16c
function function_cec36baec949341a( vehicle )
{
    if ( !vehicle )
    {
        return;
    }
    
    thread namespace_23c79201421792eb::function_e097bffa2fd8f2a0( self, vehicle.weaponobj, vehicle getentitynumber(), 1 );
    
    if ( !vehicle.var_8b3c828f5635c6b8 )
    {
        vehicle.var_8b3c828f5635c6b8 = 1;
    }
    else
    {
        return;
    }
    
    if ( vehicle.ispiloted )
    {
        namespace_9d8e359c3b1041e5::clearoobsharedfunc( vehicle, 1 );
    }
    
    function_fe2123dba85371ec( self );
    thread function_f60f078487804e09();
    
    if ( isalive( self ) && vehicle.owneralive )
    {
        level thread namespace_9d8e359c3b1041e5::restorekillstreakplayeranglessharedfunc( self );
        function_cb0a28c730f711fc( #"explosion" );
        thread function_2d9e422485c28b56( 0.35 );
        self playlocalsound( "ks_exp_screen_static" );
        thread function_94a1cab72c7aa78f( 0.5 );
        thread function_635585e4fbd83e8( 0.35 );
    }
    else
    {
        thread function_94a1cab72c7aa78f( 0 );
        thread function_2d9e422485c28b56( 0.5 );
        thread function_635585e4fbd83e8();
    }
    
    function_2c0784a62f89f89b();
    self cameraunlink();
    
    if ( !utility::issp() )
    {
        self lerpfovbypreset( "default" );
    }
    
    self painvisionon();
    self setclientomnvar( "ui_killstreak_controls", 0 );
    killstreak_shared::function_76bbbe12ce816ed2();
    killstreak_shared::function_b3302c4317df36c6();
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"hash_cc313c69c23ec029" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        vehicle [[ var_32dbca3143d9c4a5 ]]();
    }
}

// Namespace dart_mark_zero
// Params 0
// Checksum 0x6f0c2186, Offset: 0x3260
// Size: 0x1b
function function_2c0784a62f89f89b()
{
    waitframe();
    
    if ( isalive( self ) && self isvehicleactive() )
    {
        self leavevehicle( 0 );
    }
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xb43d6868, Offset: 0x3283
// Size: 0x8f
function function_761c945c08e6de5d( dart )
{
    bundle = level.equipment.table[ "equip_dart_mark_zero" ].bundle;
    meansofdeath = toupper( dart.var_d995ff3a8a3cb9c.var_132036d3279aba56 ?? "MOD_EXPLOSIVE" );
    self kill( dart.origin, self, dart, meansofdeath, bundle.useweapon );
    dart thread function_e3e9b944bde1ba13();
}

// Namespace dart_mark_zero
// Params 1
// Checksum 0xb6eedf7a, Offset: 0x331a
// Size: 0x30
function function_635585e4fbd83e8( duration )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( duration )
    {
        wait duration;
    }
    
    val::group_reset( "driving_dart_mark_zero" );
}

// Namespace dart_mark_zero
// Params 0, eflags: 0xc
// Checksum 0x76fa89db, Offset: 0x3352
// Size: 0x95
function private function_86f8280456d2be0c()
{
    self notify( "dba6f58fb1440e03" );
    self endon( "dba6f58fb1440e03" );
    function_488121572102c714();
    var_63d3efab778fca39 = self.var_d995ff3a8a3cb9c.var_397791255c32ab9;
    
    if ( self.var_ec2a7a632e045ea6 && self.var_358dc66a42bbb556.owneralive )
    {
        self.var_358dc66a42bbb556.owneralive = 0;
        
        if ( var_63d3efab778fca39 )
        {
            self.owner function_cec36baec949341a( self.var_358dc66a42bbb556 );
            thread function_e3e9b944bde1ba13();
        }
    }
}

// Namespace dart_mark_zero
// Params 0, eflags: 0x4
// Checksum 0x86e59156, Offset: 0x33ef
// Size: 0x81
function private function_488121572102c714()
{
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    self.owner endon( "last_stand_enter" );
    self.owner endon( "team_kill_punish" );
    level endon( "game_ended" );
    lifetime = self.var_d995ff3a8a3cb9c.var_4e52a854495ab91 ?? 6;
    wait lifetime;
}

// Namespace dart_mark_zero
// Params 0, eflags: 0xc
// Checksum 0x756a2d86, Offset: 0x3478
// Size: 0x31
function private function_37c1211d42c75ec0()
{
    self notify( "e4f538d48c28cf49" );
    self endon( "e4f538d48c28cf49" );
    self endon( "exploded" );
    self.owner waittill( "disconnect" );
    thread function_e3e9b944bde1ba13();
}

// Namespace dart_mark_zero
// Params 0, eflags: 0xc
// Checksum 0xe82a27d, Offset: 0x34b1
// Size: 0x41
function private function_8c88c1557bf4a72b()
{
    self notify( "29c0fb2e494c9f1c" );
    self endon( "29c0fb2e494c9f1c" );
    self endon( "exploded" );
    self.owner endon( "death", "disconnect" );
    level waittill( "game_ended" );
    thread function_e3e9b944bde1ba13( undefined, 1 );
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0xeddd155d, Offset: 0x34fa
// Size: 0x27
function private function_cb0a28c730f711fc( fx_type )
{
    assert( isdefined( fx_type ), "<dev string:x154>" );
    function_935732eb06e0f22f( fx_type, 1 );
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0x956e6b55, Offset: 0x3529
// Size: 0x26
function private function_7e8d3810af840d36( fx_type )
{
    assert( isdefined( fx_type ), "<dev string:x191>" );
    function_935732eb06e0f22f( fx_type, 0 );
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0x71fa4509, Offset: 0x3557
// Size: 0x88
function private function_2d9e422485c28b56( delay_s )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( delay_s )
    {
        wait delay_s;
    }
    
    if ( self )
    {
        function_7e8d3810af840d36( #"explosion" );
        function_7e8d3810af840d36( #"hud" );
        function_7e8d3810af840d36( #"boost" );
        function_7e8d3810af840d36( #"med_signal" );
        function_7e8d3810af840d36( #"low_signal" );
        function_7e8d3810af840d36( #"jammed" );
    }
}

// Namespace dart_mark_zero
// Params 2, eflags: 0x4
// Checksum 0x4b7547b4, Offset: 0x35e7
// Size: 0x1b2
function private function_935732eb06e0f22f( fx_type, ison )
{
    switch ( fx_type )
    {
        case #"hud":
            fullscreenfxparams = { #visionset:"cruise_color_mp", #postfxbundlename:"cer_mp_valkyrie_drive" };
            break;
        case #"boost":
            fullscreenfxparams = { #visionset:undefined, #postfxbundlename:"cer_mp_valkyrie_boost" };
            break;
        case #"explosion":
            fullscreenfxparams = { #visionset:"killstreak_static", #postfxbundlename:"cer_scorestreak_transition" };
            break;
        case #"med_signal":
            fullscreenfxparams = { #visionset:undefined, #postfxbundlename:"cer_mp_valkyrie_med_signal" };
            break;
        case #"low_signal":
            fullscreenfxparams = { #visionset:undefined, #postfxbundlename:"cer_mp_valkyrie_low_signal" };
            break;
        case #"jammed":
            fullscreenfxparams = { #visionset:"vision/killstreak_rcxd_jammed.vision", #postfxbundlename:"cer_mp_rcxd_drive_jammed" };
            break;
        default:
            assertmsg( "<dev string:x1cf>" );
            fullscreenfxparams = { #visionset:undefined, #postfxbundlename:undefined };
            break;
    }
    
    if ( ison )
    {
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        return;
    }
    
    self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_fd9af8d6ec7cc6fb" ] ]]( fullscreenfxparams );
}

// Namespace dart_mark_zero
// Params 2, eflags: 0x4
// Checksum 0x8685915f, Offset: 0x37a1
// Size: 0x62
function private hack( hackeffect, attacker )
{
    if ( hackeffect.var_30e7de3d76d5a085 )
    {
        return;
    }
    
    self.owner thread equipment_utility::function_364a1a0e0c018518( self.equipmentref, #"hash_412d5726f107927d" );
    attacker thread points::doscoreevent( #"hash_32dfbbfece96181f" );
    thread function_e3e9b944bde1ba13( undefined, 1 );
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0x15a4e86c, Offset: 0x380b
// Size: 0x80
function private function_de181017e819cb35( var_2ab131289fb7863e )
{
    if ( !isdefined( self.var_208e7f8b4e8599be ) )
    {
        self.var_208e7f8b4e8599be = 0;
    }
    
    if ( var_2ab131289fb7863e && self.var_208e7f8b4e8599be != 1 )
    {
        self.var_208e7f8b4e8599be = 1;
        self setclientomnvar( "ui_dart_mark_zero_operation_mode", 1 );
        return;
    }
    
    if ( !var_2ab131289fb7863e && self.var_208e7f8b4e8599be != 2 )
    {
        self.var_208e7f8b4e8599be = 2;
        self setclientomnvar( "ui_dart_mark_zero_operation_mode", 2 );
    }
}

// Namespace dart_mark_zero
// Params 0, eflags: 0x4
// Checksum 0xf8541345, Offset: 0x3893
// Size: 0x18
function private function_1bb10c5c0524da9e()
{
    self.var_208e7f8b4e8599be = undefined;
    self setclientomnvar( "ui_dart_mark_zero_operation_mode", 0 );
}

// Namespace dart_mark_zero
// Params 1, eflags: 0x4
// Checksum 0xd11aa445, Offset: 0x38b3
// Size: 0x25
function private function_abf35abf38899c03( params )
{
    if ( weapon::function_ecbdce6df0e16a2a( #"dart_mark_zero" ) )
    {
        weapons::function_3301c61ed3c28e3();
    }
}

