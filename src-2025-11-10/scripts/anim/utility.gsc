#using scripts\anim\utility_common;
#using scripts\common\gameskill;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace utility;

// Namespace utility
// Params 1
// Checksum 0x24242614, Offset: 0x31c
// Size: 0xc
function initialize( type )
{
    
}

#using_animtree( "generic_human" );

// Namespace utility
// Params 0
// Checksum 0xf51da2e5, Offset: 0x330
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
    // Checksum 0x91068578, Offset: 0x475
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
// Checksum 0xa530efa7, Offset: 0x54d
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
    // Checksum 0x554c8520, Offset: 0x5b3
    // Size: 0x25, Type: dev
    function isdebugon()
    {
        return getdvarint( @"animdebug" ) == 1 || anim.debugent == self;
    }

    // Namespace utility
    // Params 4
    // Checksum 0x62cd833c, Offset: 0x5e0
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
    // Checksum 0xd6bd4c8d, Offset: 0x63b
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
    // Checksum 0x4a29a244, Offset: 0x683
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
// Checksum 0x32aa2c30, Offset: 0x6e1
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
// Checksum 0x4fca2e0c, Offset: 0x71c
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
// Checksum 0x9e1c6962, Offset: 0x78a
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
    // Checksum 0x71aeab89, Offset: 0x846
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
    // Checksum 0x5a60af89, Offset: 0x8e4
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
// Checksum 0x8d9e7756, Offset: 0x93f
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
// Checksum 0x1ebae486, Offset: 0x97a
// Size: 0xb
function getenemysightpos()
{
    return self.goodshootpos;
}

// Namespace utility
// Params 0
// Checksum 0xe62c2907, Offset: 0x98e
// Size: 0xd
function debugtimeout()
{
    wait 5;
    self notify( "timeout" );
}

// Namespace utility
// Params 3
// Checksum 0xbfd91ee1, Offset: 0x9a3
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
// Checksum 0xa1e994fb, Offset: 0xa6c
// Size: 0x24
function debugpos( org, string )
{
    thread debugposinternal( org, string, 2.15 );
}

// Namespace utility
// Params 3
// Checksum 0x4a7ea23a, Offset: 0xa98
// Size: 0x29
function debugpossize( org, string, size )
{
    thread debugposinternal( org, string, size );
}

// Namespace utility
// Params 2
// Checksum 0xd290adea, Offset: 0xac9
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
    // Checksum 0x6ef08a1e, Offset: 0xb93
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
    // Checksum 0x6c4eac1d, Offset: 0xc40
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
// Checksum 0x25b8b4c5, Offset: 0xc67
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
// Checksum 0x24deca4c, Offset: 0xcdd
// Size: 0x42
function showdebugline( frompoint, topoint, color, printtime )
{
    thread showdebugproc( frompoint, topoint + ( 0, 0, -5 ), color, printtime );
}

// Namespace utility
// Params 1
// Checksum 0x5396ed8, Offset: 0xd27
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
// Checksum 0xcad4bffa, Offset: 0xe0e
// Size: 0x1e
function shootenemywrapper_shootnotify( var_3194eba7c1afe666 )
{
    level notify( "an_enemy_shot", self );
    shootenemywrapper_normal( var_3194eba7c1afe666 );
}

// Namespace utility
// Params 2
// Checksum 0x8ea33932, Offset: 0xe34
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
// Checksum 0x4140f6a1, Offset: 0xeef
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
// Checksum 0xe346c40c, Offset: 0x1105
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
// Checksum 0x9e415ff4, Offset: 0x11d0
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
    // Checksum 0xe09ccf67, Offset: 0x11fe
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
// Checksum 0x6febc0e6, Offset: 0x1264
// Size: 0xf
function usingboltactionweapon()
{
    return weaponisboltaction( self.weapon );
}

// Namespace utility
// Params 3
// Checksum 0xbae7e89e, Offset: 0x127c
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
// Checksum 0x304e0914, Offset: 0x1310
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
// Checksum 0x37d6f7cb, Offset: 0x13a4
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
// Checksum 0x2145b4a7, Offset: 0x1450
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
// Checksum 0xfec6d47a, Offset: 0x149f
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
// Checksum 0x4c9c693f, Offset: 0x14ee
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
// Checksum 0x5013988c, Offset: 0x153d
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
// Checksum 0x13102a05, Offset: 0x162c
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
// Checksum 0xa42490e8, Offset: 0x16ee
// Size: 0x15
function enterpronewrapper( timer )
{
    thread enterpronewrapperproc( timer );
}

// Namespace utility
// Params 1
// Checksum 0xfac835c0, Offset: 0x170b
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
// Checksum 0xb69fca8e, Offset: 0x1794
// Size: 0x21
function stoponback()
{
    exitpronewrapper( 1 );
    self.a.onback = undefined;
}

// Namespace utility
// Params 1
// Checksum 0x6334e0bb, Offset: 0x17bd
// Size: 0x15
function exitpronewrapper( timer )
{
    thread exitpronewrapperproc( timer );
}

// Namespace utility
// Params 1
// Checksum 0x244af3f1, Offset: 0x17da
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
// Checksum 0xba5c76b1, Offset: 0x1836
// Size: 0xb
function getaiprimaryweapon()
{
    return self.primaryweapon;
}

// Namespace utility
// Params 0
// Checksum 0x57fb68a6, Offset: 0x184a
// Size: 0xb
function getaisecondaryweapon()
{
    return self.secondaryweapon;
}

// Namespace utility
// Params 0
// Checksum 0x2f914e64, Offset: 0x185e
// Size: 0xb
function getaisidearmweapon()
{
    return self.sidearm;
}

// Namespace utility
// Params 0
// Checksum 0x947aed29, Offset: 0x1872
// Size: 0xb
function getaicurrentweapon()
{
    return self.weapon;
}

// Namespace utility
// Params 0
// Checksum 0xf08d8f42, Offset: 0x1886
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
// Checksum 0xea04a2a5, Offset: 0x18fa
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
// Checksum 0x9e390e38, Offset: 0x1943
// Size: 0x28
function getanimendpos( theanim )
{
    movedelta = getmovedelta( theanim, 0, 1 );
    return self localtoworldcoords( movedelta );
}

// Namespace utility
// Params 1
// Checksum 0xbde0610, Offset: 0x1974
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
// Checksum 0x99d66cbf, Offset: 0x1a43
// Size: 0xc, Type: bool
function iscqbwalkingorfacingenemy()
{
    return !self.facemotion;
}

// Namespace utility
// Params 0
// Checksum 0x3841631, Offset: 0x1a58
// Size: 0x1c
function randomizeidleset()
{
    self.a.idleset = randomint( 2 );
}

// Namespace utility
// Params 2
// Checksum 0x59fdd55f, Offset: 0x1a7c
// Size: 0x48
function getrandomintfromseed( intseed, intmax )
{
    assert( intmax > 0 );
    index = intseed % anim.randominttablesize;
    return anim.randominttable[ index ] % intmax;
}

// Namespace utility
// Params 0
// Checksum 0xad96f4a3, Offset: 0x1acd
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
// Checksum 0x838b9e0d, Offset: 0x1b05
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
// Checksum 0x52bb0019, Offset: 0x1bff
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
// Checksum 0x8ba349f3, Offset: 0x1d50
// Size: 0x12
function isenergyweapon( weapon )
{
    return weaponusesenergybullets( weapon );
}

// Namespace utility
// Params 3
// Checksum 0x76675c81, Offset: 0x1d6b
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
// Checksum 0xfaac123c, Offset: 0x1e6c
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

