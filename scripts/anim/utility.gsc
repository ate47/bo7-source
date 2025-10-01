#using scripts\anim\utility_common;
#using scripts\common\gameskill;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace utility;

// Namespace utility
// Params 1
// Checksum 0x2424260b, Offset: 0x31d
// Size: 0xc
function initialize( type )
{
    
}

#using_animtree( "generic_human" );

// Namespace utility
// Params 0
// Checksum 0xe8d0d7ba, Offset: 0x331
// Size: 0x13d
function updateanimpose()
{
    assert( self.a.movement == "<dev string:x24>" || self.a.movement == "<dev string:x2c>" || self.a.movement == "<dev string:x34>", "<dev string:x3b>" + self.currentpose + "<dev string:x4e>" + self.a.movement );
    
    if ( isdefined( self.desired_anim_pose ) && self.desired_anim_pose != self.currentpose )
    {
        if ( self.currentpose == "prone" )
        {
            exitpronewrapper( 0.5 );
        }
        
        if ( self.desired_anim_pose == "prone" )
        {
            self setproneanimnodes( -45, 45, %prone_legs_down, %exposed_aiming, %prone_legs_up );
            enterpronewrapper( 0.5 );
            self setanimknoball( lookupanim( "default_prone", "straight_level" ), %body, 1, 0.1, 1 );
        }
    }
    
    self.desired_anim_pose = undefined;
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0x287ac9b3, Offset: 0x476
    // Size: 0xd0, Type: dev
    function checkgrenadeinhand( animscript )
    {
        self endon( "<dev string:x53>" );
        
        if ( animscript == "<dev string:x65>" || animscript == "<dev string:x6d>" )
        {
            wait 0.05;
            waittillframeend();
        }
        
        attachsize = self getattachsize();
        
        for ( i = 0; i < attachsize ; i++ )
        {
            model = tolower( self getattachmodelname( i ) );
            assert( model != "<dev string:x76>", "<dev string:x8c>" + self.origin );
            assert( model != "<dev string:xe6>", "<dev string:x8c>" + self.origin );
            assert( model != "<dev string:x106>", "<dev string:x8c>" + self.origin );
        }
    }

#/

// Namespace utility
// Params 0
// Checksum 0x79d111ae, Offset: 0x54e
// Size: 0x5e
function printdisplaceinfo()
{
    self endon( "death" );
    self notify( "displaceprint" );
    self endon( "displaceprint" );
    
    for ( ;; )
    {
        /#
            print3d( self.origin + ( 0, 0, 60 ), "<dev string:x121>", ( 0, 0.4, 0.7 ), 0.85, 0.5 );
        #/
        
        wait 0.05;
    }
}

/#

    // Namespace utility
    // Params 0
    // Checksum 0x3ccc4b38, Offset: 0x5b4
    // Size: 0x25, Type: dev
    function isdebugon()
    {
        return getdvarint( @"animdebug" ) == 1 || anim.debugent == self;
    }

    // Namespace utility
    // Params 4
    // Checksum 0xc0089d84, Offset: 0x5e1
    // Size: 0x53, Type: dev
    function drawdebuglineinternal( frompoint, topoint, color, durationframes )
    {
        for ( i = 0; i < durationframes ; i++ )
        {
            line( frompoint, topoint, color );
            wait 0.05;
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0xdbb4ee11, Offset: 0x63c
    // Size: 0x40, Type: dev
    function drawdebugline( frompoint, topoint, color, durationframes )
    {
        if ( isdebugon() )
        {
            thread drawdebuglineinternal( frompoint, topoint, color, durationframes );
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0xe8ecbede, Offset: 0x684
    // Size: 0x56, Type: dev
    function debugline( frompoint, topoint, color, durationframes )
    {
        for ( i = 0; i < durationframes * 20 ; i++ )
        {
            line( frompoint, topoint, color );
            wait 0.05;
        }
    }

#/

// Namespace utility
// Params 3
// Checksum 0xd5edfd07, Offset: 0x6e2
// Size: 0x33
function notifyaftertime( notifystring, killmestring, time )
{
    self endon( "death" );
    self endon( killmestring );
    wait time;
    self notify( notifystring );
}

// Namespace utility
// Params 4
// Checksum 0xa962ada3, Offset: 0x71d
// Size: 0x66
function drawstringtime( msg, org, color, timer )
{
    maxtime = timer * 20;
    
    for ( i = 0; i < maxtime ; i++ )
    {
        /#
            print3d( org, msg, color, 1, 1 );
        #/
        
        wait 0.05;
    }
}

// Namespace utility
// Params 1
// Checksum 0x92cb7b39, Offset: 0x78b
// Size: 0xb4
function showlastenemysightpos( string )
{
    self notify( "got known enemy2" );
    self endon( "got known enemy2" );
    self endon( "death" );
    
    if ( !isdefined( self.enemy ) )
    {
        return;
    }
    
    if ( self.enemy.team == "allies" )
    {
        color = ( 0.4, 0.7, 1 );
    }
    else
    {
        color = ( 1, 0.7, 0.4 );
    }
    
    while ( true )
    {
        wait 0.05;
        
        if ( !isdefined( self.lastenemysightpos ) )
        {
            continue;
        }
        
        /#
            print3d( self.lastenemysightpos, string, color, 1, 2.15 );
        #/
    }
}

/#

    // Namespace utility
    // Params 4
    // Checksum 0x970628f9, Offset: 0x847
    // Size: 0x96, Type: dev
    function function_2d157e8584292eb( string, org, printtime, color )
    {
        level notify( "<dev string:x12e>" + org );
        level endon( "<dev string:x12e>" + org );
        
        if ( !isdefined( color ) )
        {
            color = ( 0.3, 0.9, 0.6 );
        }
        
        timer = printtime * 20;
        i = 0;
        
        while ( i < timer )
        {
            wait 0.05;
            print3d( org, string, color, 1, 1 );
            i += 1;
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0x13ae49ad, Offset: 0x8e5
    // Size: 0x53, Type: dev
    function printdebugtext( string, org, printtime, color )
    {
        if ( getdvar( @"anim_debug", "<dev string:x143>" ) != "<dev string:x143>" )
        {
            level thread function_2d157e8584292eb( string, org, printtime, color );
        }
    }

#/

// Namespace utility
// Params 0
// Checksum 0x593223bb, Offset: 0x940
// Size: 0x33
function hasenemysightpos()
{
    if ( isdefined( self.node ) )
    {
        return ( utility_common::canseeenemyfromexposed() || self cansuppressenemyfromexposed() );
    }
    
    return utility_common::canseeenemy() || utility_common::cansuppressenemy();
}

// Namespace utility
// Params 0
// Checksum 0x38698a9c, Offset: 0x97b
// Size: 0xb
function getenemysightpos()
{
    return self.goodshootpos;
}

// Namespace utility
// Params 0
// Checksum 0x676d5e8b, Offset: 0x98f
// Size: 0xd
function debugtimeout()
{
    wait 5;
    self notify( "timeout" );
}

// Namespace utility
// Params 3
// Checksum 0xd6ad970a, Offset: 0x9a4
// Size: 0xc1
function debugposinternal( org, string, size )
{
    self endon( "death" );
    self notify( "stop debug " + org );
    self endon( "stop debug " + org );
    ent = spawnstruct();
    ent thread debugtimeout();
    ent endon( "timeout" );
    
    if ( self.enemy.team == "allies" )
    {
        color = ( 0.4, 0.7, 1 );
    }
    else
    {
        color = ( 1, 0.7, 0.4 );
    }
    
    /#
        while ( true )
        {
            wait 0.05;
            print3d( org, string, color, 1, size );
        }
    #/
}

// Namespace utility
// Params 2
// Checksum 0x4dd96037, Offset: 0xa6d
// Size: 0x24
function debugpos( org, string )
{
    thread debugposinternal( org, string, 2.15 );
}

// Namespace utility
// Params 3
// Checksum 0xa64e57c8, Offset: 0xa99
// Size: 0x29
function debugpossize( org, string, size )
{
    thread debugposinternal( org, string, size );
}

// Namespace utility
// Params 2
// Checksum 0x75fcd30f, Offset: 0xaca
// Size: 0xc2
function debugburstprint( numshots, maxshots )
{
    burstsize = numshots / maxshots;
    burstsizestr = undefined;
    
    if ( numshots == self.bulletsinclip )
    {
        burstsizestr = "all rounds";
    }
    else if ( burstsize < 0.25 )
    {
        burstsizestr = "small burst";
    }
    else if ( burstsize < 0.5 )
    {
        burstsizestr = "med burst";
    }
    else
    {
        burstsizestr = "long burst";
    }
    
    thread debugpossize( self.origin + ( 0, 0, 42 ), burstsizestr, 1.5 );
    thread debugpos( self.origin + ( 0, 0, 60 ), "Suppressing" );
}

/#

    // Namespace utility
    // Params 0
    // Checksum 0x56a94626, Offset: 0xb94
    // Size: 0xa5, Type: dev
    function printshootproc()
    {
        self endon( "<dev string:x6d>" );
        self notify( "<dev string:x147>" + self.export );
        self endon( "<dev string:x147>" + self.export );
        printtime = 0.25;
        timer = printtime * 20;
        i = 0;
        
        while ( i < timer )
        {
            wait 0.05;
            print3d( self.origin + ( 0, 0, 70 ), "<dev string:x156>", ( 1, 0, 0 ), 1, 1 );
            i += 1;
        }
    }

    // Namespace utility
    // Params 0
    // Checksum 0x4fda270d, Offset: 0xc41
    // Size: 0x1f, Type: dev
    function printshoot()
    {
        if ( getdvarint( @"anim_debug" ) == 3 )
        {
            thread printshootproc();
        }
    }

#/

// Namespace utility
// Params 4
// Checksum 0x877da72b, Offset: 0xc68
// Size: 0x6e
function showdebugproc( frompoint, topoint, color, printtime )
{
    /#
        self endon( "<dev string:x6d>" );
        timer = printtime * 20;
        i = 0;
        
        while ( i < timer )
        {
            wait 0.05;
            line( frompoint, topoint, color );
            i += 1;
        }
    #/
}

// Namespace utility
// Params 4
// Checksum 0xa69978c3, Offset: 0xcde
// Size: 0x42
function showdebugline( frompoint, topoint, color, printtime )
{
    thread showdebugproc( frompoint, topoint + ( 0, 0, -5 ), color, printtime );
}

// Namespace utility
// Params 1
// Checksum 0x1a01f6a2, Offset: 0xd28
// Size: 0xdf
function shootenemywrapper_normal( var_3194eba7c1afe666 )
{
    self._blackboard.shootparams_lastshoottime = gettime();
    gameskill::set_accuracy_based_on_situation();
    self notify( "shooting" );
    
    if ( self aiissniper() && self._blackboard.shootparams_valid && isdefined( self._blackboard.shootparams_pos ) )
    {
        if ( isdefined( self.var_819a7890692fc6d5 ) && self.var_1fbbbbeed4c2dd18 > gettime() - 250 )
        {
            self shoot( 1, self.var_819a7890692fc6d5, 1, 0, 1 );
        }
        else
        {
            self shoot( 1, self._blackboard.shootparams_pos, 1, 0, 1 );
        }
        
        return;
    }
    
    if ( isagent( self ) )
    {
        var_3194eba7c1afe666 = 1;
    }
    
    self shoot( 1, undefined, var_3194eba7c1afe666 );
}

// Namespace utility
// Params 1
// Checksum 0xd62a7a35, Offset: 0xe0f
// Size: 0x1e
function shootenemywrapper_shootnotify( var_3194eba7c1afe666 )
{
    level notify( "an_enemy_shot", self );
    shootenemywrapper_normal( var_3194eba7c1afe666 );
}

// Namespace utility
// Params 2
// Checksum 0x6a1d31e1, Offset: 0xe35
// Size: 0xb3
function shootposwrapper( shootpos, var_3194eba7c1afe666 )
{
    self._blackboard.shootparams_lastshoottime = gettime();
    
    if ( !isdefined( var_3194eba7c1afe666 ) )
    {
        var_3194eba7c1afe666 = 1;
    }
    
    self notify( "shooting" );
    
    if ( self aiissniper() )
    {
        self shoot( 1, shootpos, 1, 1, 1 );
        return;
    }
    
    bignoreenemy = 0;
    
    if ( isdefined( self.enemy ) && self.enemy.underlowcover )
    {
        bignoreenemy = 1;
    }
    
    endpos = bulletspread( self getmuzzlepos(), shootpos, 4 );
    self shoot( 1, endpos, var_3194eba7c1afe666, bignoreenemy );
}

// Namespace utility
// Params 0
// Checksum 0x5178cab4, Offset: 0xef0
// Size: 0x20e
function throwgun()
{
    org = spawn( "script_model", ( 0, 0, 0 ) );
    org setmodel( "temp" );
    org.origin = self gettagorigin( "tag_weapon_right" ) + ( 50, 50, 0 );
    org.angles = self gettagangles( "tag_weapon_right" );
    right = anglestoright( org.angles );
    right *= 15;
    forward = anglestoforward( org.angles );
    forward *= 15;
    org movegravity( ( 0, 50, 150 ), 100 );
    weaponclass = "weapon_" + getcompleteweaponname( self.weapon );
    weapon = spawn( weaponclass, org.origin );
    weapon.angles = self gettagangles( "tag_weapon_right" );
    weapon linkto( org );
    lastorigin = org.origin;
    
    while ( isdefined( weapon ) && isdefined( weapon.origin ) )
    {
        start = lastorigin;
        end = org.origin;
        angles = vectortoangles( end - start );
        forward = anglestoforward( angles );
        forward *= 4;
        trace = trace::_bullet_trace( end, end + forward, 1, weapon );
        
        if ( isalive( trace[ "entity" ] ) && trace[ "entity" ] == self )
        {
            wait 0.05;
            continue;
        }
        
        if ( trace[ "fraction" ] < 1 )
        {
            break;
        }
        
        lastorigin = org.origin;
        wait 0.05;
    }
    
    if ( isdefined( weapon ) && isdefined( weapon.origin ) )
    {
        weapon unlink();
    }
    
    org delete();
}

// Namespace utility
// Params 0
// Checksum 0x4cd8436a, Offset: 0x1106
// Size: 0xc3
function personalcoldbreath()
{
    tag = "TAG_EYE";
    self endon( "death" );
    self notify( "stop personal effect" );
    self endon( "stop personal effect" );
    
    while ( isdefined( self ) )
    {
        wait 0.05;
        
        if ( !isdefined( self ) )
        {
            break;
        }
        
        if ( isdefined( self.a.movement ) && self.a.movement == "stop" )
        {
            if ( isdefined( self.isindoor ) && self.isindoor == 1 )
            {
                continue;
            }
            
            playfxontag( level._effect[ "cold_breath" ], self, tag );
            wait 2.5 + randomfloat( 3 );
            continue;
        }
        
        wait 0.5;
    }
}

// Namespace utility
// Params 0
// Checksum 0x1bcf3e44, Offset: 0x11d1
// Size: 0x25
function ispartiallysuppressedwrapper()
{
    if ( self.suppressionmeter <= self.suppressionthreshold * 0.25 )
    {
        return 0;
    }
    
    return self issuppressed();
}

/#

    // Namespace utility
    // Params 3
    // Checksum 0xe09cb412, Offset: 0x11ff
    // Size: 0x5e, Type: dev
    function showlines( start, end, end2 )
    {
        for ( ;; )
        {
            line( start, end, ( 1, 0, 0 ), 1 );
            wait 0.05;
            line( start, end2, ( 0, 0, 1 ), 1 );
            wait 0.05;
        }
    }

#/

// Namespace utility
// Params 0
// Checksum 0xefa885df, Offset: 0x1265
// Size: 0xf
function usingboltactionweapon()
{
    return weaponisboltaction( self.weapon );
}

// Namespace utility
// Params 3
// Checksum 0xa1e918f4, Offset: 0x127d
// Size: 0x8c
function setfootstepeffect( type, name, fx )
{
    assert( isdefined( name ), "<dev string:x15f>" );
    assert( isdefined( fx ), "<dev string:x18c>" );
    assert( isdefined( type ), "<dev string:x1b3>" );
    
    if ( !isdefined( anim.optionalstepeffects ) )
    {
        anim.optionalstepeffects = [];
    }
    
    anim.optionalstepeffects[ name ] = 1;
    level._effect[ "step_" + name ][ type ] = fx;
}

// Namespace utility
// Params 3
// Checksum 0xfd20815a, Offset: 0x1311
// Size: 0x8c
function setfootstepeffectsmall( type, name, fx )
{
    assert( isdefined( name ), "<dev string:x15f>" );
    assert( isdefined( fx ), "<dev string:x18c>" );
    assert( isdefined( type ), "<dev string:x1b3>" );
    
    if ( !isdefined( anim.optionalstepeffectssmall ) )
    {
        anim.optionalstepeffectssmall = [];
    }
    
    anim.optionalstepeffectssmall[ name ] = 1;
    level._effect[ "step_small_" + name ][ type ] = fx;
}

// Namespace utility
// Params 3
// Checksum 0x836ddcfe, Offset: 0x13a5
// Size: 0xa4
function setfootprinteffect( type, name, fx )
{
    assert( isdefined( name ), "<dev string:x15f>" );
    assert( isdefined( fx ), "<dev string:x18c>" );
    assert( isdefined( type ), "<dev string:x1b3>" );
    
    if ( !isdefined( anim.optionalfootprinteffects ) )
    {
        anim.optionalfootprinteffects = [];
    }
    
    if ( !isdefined( anim.flirfootprinteffects ) )
    {
        anim.flirfootprinteffects = 0;
    }
    
    anim.optionalfootprinteffects[ name ] = 1;
    level._effect[ "footprint_" + name ][ type ] = fx;
}

// Namespace utility
// Params 1
// Checksum 0xaad25c1e, Offset: 0x1451
// Size: 0x47
function unsetfootstepeffect( name )
{
    assert( isdefined( name ), "<dev string:x1dc>" );
    
    if ( isdefined( anim.optionalstepeffects ) )
    {
        anim.optionalstepeffects[ name ] = undefined;
    }
    
    level._effect[ "step_" + name ] = undefined;
}

// Namespace utility
// Params 1
// Checksum 0xf3a8308f, Offset: 0x14a0
// Size: 0x47
function unsetfootstepeffectsmall( name )
{
    assert( isdefined( name ), "<dev string:x1dc>" );
    
    if ( isdefined( anim.optionalstepeffectssmall ) )
    {
        anim.optionalstepeffectssmall[ name ] = undefined;
    }
    
    level._effect[ "step_small_" + name ] = undefined;
}

// Namespace utility
// Params 1
// Checksum 0x5064e2c1, Offset: 0x14ef
// Size: 0x47
function unsetfootprinteffect( name )
{
    assert( isdefined( name ), "<dev string:x1dc>" );
    
    if ( isdefined( anim.optionalfootprinteffects ) )
    {
        anim.optionalfootprinteffects[ name ] = undefined;
    }
    
    level._effect[ "footprint_" + name ] = undefined;
}

// Namespace utility
// Params 6
// Checksum 0xf2909482, Offset: 0x153e
// Size: 0xe7
function setnotetrackeffect( notetrack, tag, surfacename, fx, sound_prefix, sound_suffix )
{
    assert( isdefined( notetrack ) );
    assert( isdefined( tag ) );
    assert( isdefined( fx ) );
    assert( isstring( notetrack ), "<dev string:x212>" );
    
    if ( !isdefined( surfacename ) )
    {
        surfacename = "all";
    }
    
    if ( !isdefined( level._notetrackfx ) )
    {
        level._notetrackfx = [];
    }
    
    level._notetrackfx[ notetrack ][ surfacename ] = spawnstruct();
    level._notetrackfx[ notetrack ][ surfacename ].tag = tag;
    level._notetrackfx[ notetrack ][ surfacename ].fx = fx;
    setnotetracksound( notetrack, surfacename, sound_prefix, sound_suffix );
}

// Namespace utility
// Params 4
// Checksum 0x624537a0, Offset: 0x162d
// Size: 0xba
function setnotetracksound( notetrack, surfacename, sound_prefix, sound_suffix )
{
    if ( !isdefined( surfacename ) )
    {
        surfacename = "all";
    }
    
    if ( !isdefined( level._notetrackfx ) )
    {
        level._notetrackfx = [];
    }
    
    if ( isdefined( level._notetrackfx[ notetrack ][ surfacename ] ) )
    {
        struct = level._notetrackfx[ notetrack ][ surfacename ];
    }
    else
    {
        struct = spawnstruct();
        level._notetrackfx[ notetrack ][ surfacename ] = struct;
    }
    
    if ( isdefined( sound_prefix ) )
    {
        struct.sound_prefix = sound_prefix;
    }
    
    if ( isdefined( sound_suffix ) )
    {
        struct.sound_suffix = sound_suffix;
    }
}

// Namespace utility
// Params 1
// Checksum 0x7c33776d, Offset: 0x16ef
// Size: 0x15
function enterpronewrapper( timer )
{
    thread enterpronewrapperproc( timer );
}

// Namespace utility
// Params 1
// Checksum 0xeaa0982a, Offset: 0x170c
// Size: 0x81
function enterpronewrapperproc( timer )
{
    self endon( "death" );
    self notify( "anim_prone_change" );
    self endon( "anim_prone_change" );
    self enterprone( timer, isdefined( self.a.onback ) );
    self waittill( "killanimscript" );
    
    if ( self.currentpose != "prone" && !isdefined( self.a.onback ) )
    {
        self.currentpose = "prone";
    }
}

// Namespace utility
// Params 0
// Checksum 0xcddbfcab, Offset: 0x1795
// Size: 0x21
function stoponback()
{
    exitpronewrapper( 1 );
    self.a.onback = undefined;
}

// Namespace utility
// Params 1
// Checksum 0x728ef303, Offset: 0x17be
// Size: 0x15
function exitpronewrapper( timer )
{
    thread exitpronewrapperproc( timer );
}

// Namespace utility
// Params 1
// Checksum 0x39f13f8f, Offset: 0x17db
// Size: 0x54
function exitpronewrapperproc( timer )
{
    self endon( "death" );
    self notify( "anim_prone_change" );
    self endon( "anim_prone_change" );
    self exitprone( timer );
    self waittill( "killanimscript" );
    
    if ( self.currentpose == "prone" )
    {
        self.currentpose = "crouch";
    }
}

// Namespace utility
// Params 0
// Checksum 0xcc41e1fd, Offset: 0x1837
// Size: 0xb
function getaiprimaryweapon()
{
    return self.primaryweapon;
}

// Namespace utility
// Params 0
// Checksum 0xa84af35f, Offset: 0x184b
// Size: 0xb
function getaisecondaryweapon()
{
    return self.secondaryweapon;
}

// Namespace utility
// Params 0
// Checksum 0x47d371e3, Offset: 0x185f
// Size: 0xb
function getaisidearmweapon()
{
    return self.sidearm;
}

// Namespace utility
// Params 0
// Checksum 0xfd494f57, Offset: 0x1873
// Size: 0xb
function getaicurrentweapon()
{
    return self.weapon;
}

// Namespace utility
// Params 0
// Checksum 0x952649ea, Offset: 0x1887
// Size: 0x6c
function getaicurrentweaponslot()
{
    if ( self.weapon == self.primaryweapon )
    {
        return "primary";
    }
    
    if ( self.weapon == self.secondaryweapon )
    {
        return "secondary";
    }
    
    if ( self.weapon == self.sidearm )
    {
        return "sidearm";
    }
    
    assertmsg( "<dev string:x235>" );
}

// Namespace utility
// Params 1
// Checksum 0x1249eb46, Offset: 0x18fb
// Size: 0x40, Type: bool
function aihasweapon( objweapon )
{
    assert( isweapon( objweapon ) );
    weaponname = getcompleteweaponname( objweapon );
    
    if ( isdefined( self.weaponinfo[ weaponname ] ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0xb8132ebf, Offset: 0x1944
// Size: 0x28
function getanimendpos( theanim )
{
    movedelta = getmovedelta( theanim, 0, 1 );
    return self localtoworldcoords( movedelta );
}

// Namespace utility
// Params 1
// Checksum 0xea36c86b, Offset: 0x1975
// Size: 0xc7
function ragdolldeath( moveanim )
{
    self endon( "killanimscript" );
    lastorg = self.origin;
    movevec = ( 0, 0, 0 );
    
    for ( ;; )
    {
        wait 0.05;
        force = distance( self.origin, lastorg );
        lastorg = self.origin;
        
        if ( self.health == 1 )
        {
            self.a.nodeath = 1;
            self startragdoll();
            self clearanim( moveanim, 0.1 );
            wait 0.05;
            physicsexplosionsphere( lastorg, 600, 0, force * 0.1 );
            self notify( "killanimscript" );
            return;
        }
    }
}

// Namespace utility
// Params 0
// Checksum 0x2e6b273e, Offset: 0x1a44
// Size: 0xc, Type: bool
function iscqbwalkingorfacingenemy()
{
    return !self.facemotion;
}

// Namespace utility
// Params 0
// Checksum 0x946509d6, Offset: 0x1a59
// Size: 0x1c
function randomizeidleset()
{
    self.a.idleset = randomint( 2 );
}

// Namespace utility
// Params 2
// Checksum 0x8a68f342, Offset: 0x1a7d
// Size: 0x48
function getrandomintfromseed( intseed, intmax )
{
    assert( intmax > 0 );
    index = intseed % anim.randominttablesize;
    return anim.randominttable[ index ] % intmax;
}

// Namespace utility
// Params 0
// Checksum 0xbde279de, Offset: 0x1ace
// Size: 0x2f
function getcurrentweaponslotname()
{
    assert( isdefined( self ) );
    
    if ( utility_common::isusingsecondary() )
    {
        return "secondary";
    }
    
    if ( utility_common::isusingsidearm() )
    {
        return "sidearm";
    }
    
    return "primary";
}

// Namespace utility
// Params 2
// Checksum 0xfb7ef348, Offset: 0x1b06
// Size: 0xf1
function lookupanim( animset_name, anim_index )
{
    assert( isai( self ) );
    
    if ( isdefined( self.animarchetype ) )
    {
        assert( isdefined( anim.archetypes[ self.animarchetype ] ), "<dev string:x262>" + self.animarchetype );
        
        if ( isdefined( anim.archetypes[ self.animarchetype ][ animset_name ] ) && isdefined( anim.archetypes[ self.animarchetype ][ animset_name ][ anim_index ] ) )
        {
            return anim.archetypes[ self.animarchetype ][ animset_name ][ anim_index ];
        }
    }
    
    assert( isdefined( anim.archetypes[ "<dev string:x27e>" ][ animset_name ][ anim_index ] ), "<dev string:x289>" + animset_name + "<dev string:x2b2>" + anim_index + "<dev string:x2b8>" );
    return anim.archetypes[ "soldier" ][ animset_name ][ anim_index ];
}

// Namespace utility
// Params 1
// Checksum 0x8f2f0260, Offset: 0x1c00
// Size: 0x148
function lookupanimarray( animset_name )
{
    assert( isai( self ) );
    
    if ( isdefined( self.animarchetype ) )
    {
        assert( isdefined( anim.archetypes[ self.animarchetype ] ), "<dev string:x262>" + self.animarchetype );
        
        if ( isdefined( anim.archetypes[ self.animarchetype ][ animset_name ] ) )
        {
            animset = anim.archetypes[ "soldier" ][ animset_name ];
            
            foreach ( key, value in anim.archetypes[ self.animarchetype ][ animset_name ] )
            {
                animset[ key ] = value;
            }
            
            return animset;
        }
    }
    
    assert( isdefined( anim.archetypes[ "<dev string:x27e>" ][ animset_name ] ), "<dev string:x2bd>" + animset_name + "<dev string:x2b8>" );
    return anim.archetypes[ "soldier" ][ animset_name ];
}

// Namespace utility
// Params 1
// Checksum 0xbb83e784, Offset: 0x1d51
// Size: 0x12
function isenergyweapon( weapon )
{
    return weaponusesenergybullets( weapon );
}

// Namespace utility
// Params 3
// Checksum 0xf1a8c755, Offset: 0x1d6c
// Size: 0xf8
function function_72b6372d2d8c997( str_gestureweapon, disallow_reload, b_forcestream = 0 )
{
    assert( isdefined( str_gestureweapon ), "<dev string:x2ec>" );
    
    if ( !isdefined( disallow_reload ) )
    {
        disallow_reload = 0;
    }
    
    if ( disallow_reload )
    {
        self cancelreload();
    }
    
    gestureweapon = makeweapon( str_gestureweapon );
    
    if ( gestureweapon === level.weaponnone )
    {
        return;
    }
    
    if ( b_forcestream )
    {
        wmodel = getweaponmodel( gestureweapon );
        self prestreamasset( "model", getxhashasset( wmodel ), 1000 );
    }
    
    self giveandfireoffhand( gestureweapon );
    
    if ( !self hasweapon( gestureweapon ) )
    {
        if ( b_forcestream )
        {
            self prestreamclear( "model" );
        }
        
        return;
    }
    
    if ( disallow_reload )
    {
        thread function_efe2fa9330798198( gestureweapon );
        self allowreload( 0 );
        waittill_any( "offhand_fired", "weapon_gesture_failed" );
        self allowreload( 1 );
    }
    
    if ( b_forcestream )
    {
        self prestreamclear( "model" );
    }
    
    return gestureweapon;
}

// Namespace utility
// Params 1
// Checksum 0xaeed527b, Offset: 0x1e6d
// Size: 0x32
function function_efe2fa9330798198( gestureweapon )
{
    self endon( "offhand_fired" );
    self endon( "death_or_disconnect" );
    
    while ( self hasweapon( gestureweapon ) )
    {
        waitframe();
    }
    
    self notify( "weapon_gesture_failed" );
}

