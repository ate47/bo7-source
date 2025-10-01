#using scripts\engine\utility;

#namespace utility_common;

// Namespace utility_common
// Params 6
// Checksum 0x775cd1a5, Offset: 0x1e6
// Size: 0x7a
function print3dtime( timer, org, msg, color, alpha, scale )
{
    newtime = timer / 0.05;
    
    for ( i = 0; i < newtime ; i++ )
    {
        /#
            print3d( org, msg, color, alpha, scale );
        #/
        
        wait 0.05;
    }
}

// Namespace utility_common
// Params 5
// Checksum 0x856693a3, Offset: 0x268
// Size: 0x95
function print3drise( org, msg, color, alpha, scale )
{
    newtime = 100;
    up = 0;
    org += utility::randomvector( 30 );
    
    for ( i = 0; i < newtime ; i++ )
    {
        up += 0.5;
        
        /#
            print3d( org + ( 0, 0, up ), msg, color, alpha, scale );
        #/
        
        wait 0.05;
    }
}

// Namespace utility_common
// Params 2
// Checksum 0xe546ec2a, Offset: 0x305
// Size: 0x28, Type: bool
function crossproduct( vec1, vec2 )
{
    return vec1[ 0 ] * vec2[ 1 ] - vec1[ 1 ] * vec2[ 0 ] > 0;
}

// Namespace utility_common
// Params 2
// Checksum 0x1932bafa, Offset: 0x336
// Size: 0x34
function safemod( a, b )
{
    result = int( a ) % b;
    result += b;
    return result % b;
}

// Namespace utility_common
// Params 1
// Checksum 0xdf9f63fc, Offset: 0x373
// Size: 0x108
function quadrantanimweights( yaw )
{
    forwardweight = cos( yaw );
    leftweight = sin( yaw );
    result[ "front" ] = 0;
    result[ "right" ] = 0;
    result[ "back" ] = 0;
    result[ "left" ] = 0;
    
    if ( isdefined( self.alwaysrunforward ) )
    {
        assert( self.alwaysrunforward );
        result[ "front" ] = 1;
        return result;
    }
    
    if ( forwardweight > 0 )
    {
        if ( leftweight > forwardweight )
        {
            result[ "left" ] = 1;
        }
        else if ( leftweight < -1 * forwardweight )
        {
            result[ "right" ] = 1;
        }
        else
        {
            result[ "front" ] = 1;
        }
    }
    else
    {
        backweight = -1 * forwardweight;
        
        if ( leftweight > backweight )
        {
            result[ "left" ] = 1;
        }
        else if ( leftweight < forwardweight )
        {
            result[ "right" ] = 1;
        }
        else
        {
            result[ "back" ] = 1;
        }
    }
    
    return result;
}

// Namespace utility_common
// Params 1
// Checksum 0x6f1f4484, Offset: 0x484
// Size: 0x67
function getquadrant( angle )
{
    angle = angleclamp( angle );
    
    if ( angle < 45 || angle > 315 )
    {
        quadrant = "front";
    }
    else if ( angle < 135 )
    {
        quadrant = "left";
    }
    else if ( angle < 225 )
    {
        quadrant = "back";
    }
    else
    {
        quadrant = "right";
    }
    
    return quadrant;
}

// Namespace utility_common
// Params 2
// Checksum 0xf37c77a9, Offset: 0x4f4
// Size: 0x41, Type: bool
function isinset( input, set )
{
    for ( i = set.size - 1; i >= 0 ; i-- )
    {
        if ( input == set[ i ] )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility_common
// Params 0
// Checksum 0x16a14c4c, Offset: 0x53e
// Size: 0x27, Type: bool
function weapon_genade_launcher()
{
    return !isnullweapon( self.weapon ) && weaponclass( self.weapon ) == "grenade";
}

// Namespace utility_common
// Params 0
// Checksum 0xb4dd56b2, Offset: 0x56e
// Size: 0x38, Type: bool
function weapon_pump_action_shotgun()
{
    return !isnullweapon( self.weapon ) && weaponisboltaction( self.weapon ) && weaponclass( self.weapon ) == "spread";
}

// Namespace utility_common
// Params 1
// Checksum 0x8446be46, Offset: 0x5af
// Size: 0x18, Type: bool
function islmg( weapon )
{
    return weaponclass( weapon ) == "mg";
}

// Namespace utility_common
// Params 1
// Checksum 0x189ae4f0, Offset: 0x5d0
// Size: 0x18, Type: bool
function ispistol( weapon )
{
    return weaponclass( weapon ) == "pistol";
}

// Namespace utility_common
// Params 1
// Checksum 0xf34ac2c7, Offset: 0x5f1
// Size: 0x18, Type: bool
function isshotgun( weapon )
{
    return weaponclass( weapon ) == "spread";
}

// Namespace utility_common
// Params 1
// Checksum 0xff54c369, Offset: 0x612
// Size: 0x18, Type: bool
function issniperrifle( weapon )
{
    return weaponclass( weapon ) == "sniper";
}

// Namespace utility_common
// Params 0
// Checksum 0x5007cadc, Offset: 0x633
// Size: 0x11, Type: bool
function isshotgunai()
{
    return isshotgun( self.primaryweapon );
}

// Namespace utility_common
// Params 0
// Checksum 0x43bb8c52, Offset: 0x64d
// Size: 0x11, Type: bool
function islongrangeai()
{
    return self aiissniper() || usingrocketlauncher();
}

// Namespace utility_common
// Params 0
// Checksum 0xa8b8f606, Offset: 0x667
// Size: 0x15, Type: bool
function usingrocketlauncher()
{
    return weaponclass( self.weapon ) == "rocketlauncher";
}

// Namespace utility_common
// Params 0
// Checksum 0x7a85309e, Offset: 0x685
// Size: 0x15, Type: bool
function usingmg()
{
    return weaponclass( self.weapon ) == "mg";
}

// Namespace utility_common
// Params 0
// Checksum 0x661e95ec, Offset: 0x6a3
// Size: 0x15, Type: bool
function isusingshotgun()
{
    return weaponclass( self.weapon ) == "spread";
}

// Namespace utility_common
// Params 1
// Checksum 0xf7cd5aa, Offset: 0x6c1
// Size: 0x68, Type: bool
function function_2fff89909fdbfbab( weapon )
{
    class = weaponclass( weapon );
    
    switch ( class )
    {
        case #"hash_690c0d6a821b42e":
        case #"hash_6191aaef9f922f96":
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa24dff6bd60a12d":
            return true;
    }
    
    return false;
}

// Namespace utility_common
// Params 3
// Checksum 0x11278c1e, Offset: 0x732
// Size: 0xef
function repeater_headshot_ammo_passive( objweapon, attacker, victim )
{
    if ( !( isdefined( attacker ) && isdefined( objweapon ) && isdefined( victim ) ) )
    {
        return;
    }
    
    if ( !isplayer( attacker ) )
    {
        return;
    }
    
    base_name = objweapon.basename;
    
    if ( base_name != "iw7_repeater" )
    {
        return;
    }
    
    if ( !isdefined( victim.damagelocation ) )
    {
        return;
    }
    
    if ( victim.damagelocation != "head" && victim.damagelocation != "helmet" )
    {
        return;
    }
    
    maxclipammo = weaponclipsize( objweapon );
    refundcount = maxclipammo * 1;
    currammo = attacker getweaponammoclip( objweapon );
    newammo = min( currammo + refundcount, maxclipammo );
    attacker setweaponammoclip( objweapon, int( newammo ) );
}

// Namespace utility_common
// Params 1
// Checksum 0x6941129, Offset: 0x829
// Size: 0xb7, Type: bool
function needtoreload( thresholdfraction )
{
    if ( isnullweapon( self.weapon ) )
    {
        return false;
    }
    
    if ( self.disablereload )
    {
        if ( self.bulletsinclip < weaponclipsize( self.weapon ) * 0.5 )
        {
            self.bulletsinclip = int( weaponclipsize( self.weapon ) * 0.5 );
        }
        
        if ( self.bulletsinclip <= 0 )
        {
            self.bulletsinclip = 0;
        }
        
        return false;
    }
    
    if ( self.bulletsinclip <= weaponclipsize( self.weapon ) * thresholdfraction )
    {
        if ( thresholdfraction == 0 )
        {
            if ( cheatammoifnecessary() )
            {
                return false;
            }
        }
        
        return true;
    }
    
    return false;
}

// Namespace utility_common
// Params 0
// Checksum 0x9691b3bd, Offset: 0x8e9
// Size: 0x115, Type: bool
function cheatammoifnecessary()
{
    assert( !self.bulletsinclip );
    
    if ( !isdefined( self.enemy ) )
    {
        return false;
    }
    
    if ( self.team != "allies" )
    {
        if ( !isplayer( self.enemy ) )
        {
            return false;
        }
    }
    
    if ( isusingsidearm() || usingrocketlauncher() )
    {
        return false;
    }
    
    if ( gettime() - self.ammocheattime < self.ammocheatinterval )
    {
        return false;
    }
    
    if ( !self cansee( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) > 65536 )
    {
        return false;
    }
    
    self.bulletsinclip = int( weaponclipsize( self.weapon ) / 2 );
    
    if ( self.bulletsinclip > weaponclipsize( self.weapon ) )
    {
        self.bulletsinclip = weaponclipsize( self.weapon );
    }
    
    self.ammocheattime = gettime();
    return true;
}

// Namespace utility_common
// Params 0
// Checksum 0xa7b868fd, Offset: 0xa07
// Size: 0x27, Type: bool
function isusingprimary()
{
    return self.weapon == self.primaryweapon && !isnullweapon( self.weapon );
}

// Namespace utility_common
// Params 0
// Checksum 0x2ce360d5, Offset: 0xa37
// Size: 0x27, Type: bool
function isusingsecondary()
{
    return self.weapon == self.secondaryweapon && !isnullweapon( self.weapon );
}

// Namespace utility_common
// Params 0
// Checksum 0xd8bfb8fc, Offset: 0xa67
// Size: 0x27, Type: bool
function isusingsidearm()
{
    return self.weapon == self.sidearm && !isnullweapon( self.weapon );
}

// Namespace utility_common
// Params 0
// Checksum 0x605279f8, Offset: 0xa97
// Size: 0xb
function getclaimednode()
{
    return self.node;
}

// Namespace utility_common
// Params 1
// Checksum 0x6718264c, Offset: 0xaab
// Size: 0x25
function shootenemywrapper( var_3194eba7c1afe666 )
{
    if ( !isdefined( var_3194eba7c1afe666 ) )
    {
        var_3194eba7c1afe666 = 1;
    }
    
    [[ anim.shootenemywrapper_func ]]( var_3194eba7c1afe666 );
}

// Namespace utility_common
// Params 1
// Checksum 0xb3db0aac, Offset: 0xad8
// Size: 0x77
function getnodeyawtoorigin( pos )
{
    assert( !utility::actor_is3d() );
    
    if ( isdefined( self.node ) )
    {
        yaw = self.node.angles[ 1 ] - utility::getyaw( pos );
    }
    else
    {
        yaw = self.angles[ 1 ] - utility::getyaw( pos );
    }
    
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility_common
// Params 0
// Checksum 0x45a18bff, Offset: 0xb58
// Size: 0xf2
function getnodeyawtoenemy()
{
    assert( !utility::actor_is3d() );
    pos = undefined;
    
    if ( isdefined( self.enemy ) )
    {
        pos = self.enemy.origin;
    }
    else
    {
        if ( isdefined( self.node ) )
        {
            forward = anglestoforward( self.node.angles );
        }
        else
        {
            forward = anglestoforward( self.angles );
        }
        
        forward *= 150;
        pos = self.origin + forward;
    }
    
    if ( isdefined( self.node ) )
    {
        yaw = self.node.angles[ 1 ] - utility::getyaw( pos );
    }
    else
    {
        yaw = self.angles[ 1 ] - utility::getyaw( pos );
    }
    
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility_common
// Params 0
// Checksum 0xd7fa49d5, Offset: 0xc53
// Size: 0x98
function getyawtoenemy()
{
    assert( !utility::actor_is3d() );
    pos = undefined;
    
    if ( isdefined( self.enemy ) )
    {
        pos = self.enemy.origin;
    }
    else
    {
        forward = anglestoforward( self.angles );
        forward *= 150;
        pos = self.origin + forward;
    }
    
    yaw = self.angles[ 1 ] - utility::getyaw( pos );
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility_common
// Params 1
// Checksum 0x46f9fce7, Offset: 0xcf4
// Size: 0x52
function getyaw2d( org )
{
    assert( !utility::actor_is3d() );
    angles = vectortoangles( ( org[ 0 ], org[ 1 ], 0 ) - ( self.origin[ 0 ], self.origin[ 1 ], 0 ) );
    return angles[ 1 ];
}

// Namespace utility_common
// Params 0
// Checksum 0x2434928b, Offset: 0xd4f
// Size: 0x6d
function absyawtoenemy()
{
    assert( !utility::actor_is3d() );
    assert( isdefined( self.enemy ) );
    yaw = self.angles[ 1 ] - utility::getyaw( self.enemy.origin );
    yaw = angleclamp180( yaw );
    
    if ( yaw < 0 )
    {
        yaw = -1 * yaw;
    }
    
    return yaw;
}

// Namespace utility_common
// Params 0
// Checksum 0x1ed0a5d6, Offset: 0xdc5
// Size: 0x6d
function absyawtoenemy2d()
{
    assert( !utility::actor_is3d() );
    assert( isdefined( self.enemy ) );
    yaw = self.angles[ 1 ] - getyaw2d( self.enemy.origin );
    yaw = angleclamp180( yaw );
    
    if ( yaw < 0 )
    {
        yaw = -1 * yaw;
    }
    
    return yaw;
}

// Namespace utility_common
// Params 1
// Checksum 0xcf556f52, Offset: 0xe3b
// Size: 0x54
function absyawtoorigin( org )
{
    assert( !utility::actor_is3d() );
    yaw = self.angles[ 1 ] - utility::getyaw( org );
    yaw = angleclamp180( yaw );
    
    if ( yaw < 0 )
    {
        yaw = -1 * yaw;
    }
    
    return yaw;
}

// Namespace utility_common
// Params 1
// Checksum 0x7376e921, Offset: 0xe98
// Size: 0x4e
function absyawtoangles( angles )
{
    assert( !utility::actor_is3d() );
    yaw = self.angles[ 1 ] - angles;
    yaw = angleclamp180( yaw );
    
    if ( yaw < 0 )
    {
        yaw = -1 * yaw;
    }
    
    return yaw;
}

// Namespace utility_common
// Params 2
// Checksum 0xea50ee0d, Offset: 0xeef
// Size: 0x3c
function getyawfromorigin( org, start )
{
    assert( !utility::actor_is3d() );
    angles = vectortoangles( org - start );
    return angles[ 1 ];
}

// Namespace utility_common
// Params 0
// Checksum 0xadd1a464, Offset: 0xf34
// Size: 0xf
function getgrenademodel()
{
    return getweaponmodel( self.grenadeweapon );
}

// Namespace utility_common
// Params 1
// Checksum 0xed42766e, Offset: 0xf4c
// Size: 0xf8
function getenemyeyepos( enemy )
{
    if ( !isdefined( enemy ) )
    {
        enemy = self.enemy;
    }
    
    if ( isdefined( enemy ) )
    {
        self.a.lastenemypos = enemy getshootatpos();
        self.a.lastenemytime = gettime();
        return self.a.lastenemypos;
    }
    
    if ( isdefined( self.a.lastenemytime ) && isdefined( self.a.lastenemypos ) && self.a.lastenemytime + 3000 < gettime() )
    {
        return self.a.lastenemypos;
    }
    
    targetpos = self getshootatpos();
    targetpos += 196 * self.lookforward;
    return targetpos;
}

// Namespace utility_common
// Params 1
// Checksum 0x88a3b2c6, Offset: 0x104c
// Size: 0xa7
function gettruenodeangles( node )
{
    if ( !isdefined( node ) )
    {
        return ( 0, 0, 0 );
    }
    
    if ( !isdefined( node.script_angles ) )
    {
        return node.angles;
    }
    
    var_70123e445fbedb76 = node.angles;
    node_x = angleclamp180( var_70123e445fbedb76[ 0 ] + node.script_angles[ 0 ] );
    node_y = var_70123e445fbedb76[ 1 ];
    node_z = angleclamp180( var_70123e445fbedb76[ 2 ] + node.script_angles[ 2 ] );
    return ( node_x, node_y, node_z );
}

// Namespace utility_common
// Params 1
// Checksum 0x5a8f5549, Offset: 0x10fc
// Size: 0xca
function getyawtoorigin( org )
{
    assert( !utility::actor_is3d() );
    
    if ( isdefined( self.type ) && utility::isnode3d( self ) )
    {
        node_angles = gettruenodeangles( self );
        forward = anglestoforward( node_angles );
        rotatedorg = rotatepointaroundvector( forward, org - self.origin, node_angles[ 2 ] * -1 );
        rotatedorg += self.origin;
        yaw = utility::getyaw( rotatedorg ) - node_angles[ 1 ];
        yaw = angleclamp180( yaw );
        return yaw;
    }
    
    yaw = utility::getyaw( org ) - self.angles[ 1 ];
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility_common
// Params 2
// Checksum 0x6b5aea31, Offset: 0x11cf
// Size: 0x6b, Type: bool
function canseepointfromexposedatcorner( point, node )
{
    yaw = node getyawtoorigin( point );
    
    if ( yaw > 60 || yaw < -60 )
    {
        return false;
    }
    
    if ( utility::isnodecoverleft( node ) && yaw < -14 )
    {
        return false;
    }
    
    if ( utility::isnodecoverright( node ) && yaw > 12 )
    {
        return false;
    }
    
    return true;
}

// Namespace utility_common
// Params 1
// Checksum 0x3aef68cd, Offset: 0x1243
// Size: 0x2b9
function getnodeoffset( node )
{
    var_7237854e3be197ca = node.offset;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    cover_left_crouch_offset = ( -26, 0.4, 36 );
    cover_left_stand_offset = ( -32, 7, 63 );
    cover_right_crouch_offset = ( 43.5, 11, 36 );
    cover_right_stand_offset = ( 36, 8.3, 63 );
    cover_crouch_offset = ( 3.5, -12.5, 45 );
    cover_stand_offset = ( -3.7, -22, 63 );
    var_cc785dd8ae24381e = ( 0, 30, 13 );
    cornernode = 0;
    nodeoffset = ( 0, 0, 0 );
    axis = anglestoaxis( node.angles );
    right = axis[ "right" ];
    forward = axis[ "forward" ];
    up = axis[ "up" ];
    nodetype = node.type;
    
    switch ( nodetype )
    {
        case #"hash_e1d8e1adebed5a61":
            higheststance = node gethighestnodestance();
            
            if ( !isdefined( higheststance ) || higheststance == "crouch" )
            {
                nodeoffset = calculatenodeoffset( right, forward, up, cover_left_crouch_offset );
            }
            else
            {
                nodeoffset = calculatenodeoffset( right, forward, up, cover_left_stand_offset );
            }
            
            break;
        case #"hash_cd3ffe799551db82":
            higheststance = node gethighestnodestance();
            
            if ( !isdefined( higheststance ) || higheststance == "crouch" )
            {
                nodeoffset = calculatenodeoffset( right, forward, up, cover_right_crouch_offset );
            }
            else
            {
                nodeoffset = calculatenodeoffset( right, forward, up, cover_right_stand_offset );
            }
            
            break;
        case #"hash_410b602cd708b472":
        case #"hash_78b110033ccb68b0":
        case #"hash_805ed2ec27b468f7":
        case #"hash_bdacbb6eaaa538c7":
            nodeoffset = calculatenodeoffset( right, forward, up, cover_stand_offset );
            break;
        case #"hash_2c4ea8d9cb1d214":
        case #"hash_776752872754e5ee":
        case #"hash_c3b74422dec48736":
            nodeoffset = calculatenodeoffset( right, forward, up, cover_crouch_offset );
            break;
        case #"hash_b786e406d37a0dd7":
            nodeoffset = getcover3dnodeoffset( node );
            break;
        case #"hash_c051a32186a33cae":
            nodeoffset = calculatenodeoffset( right, forward, up, var_cc785dd8ae24381e );
            break;
    }
    
    node.offset = nodeoffset;
    return node.offset;
}

// Namespace utility_common
// Params 2
// Checksum 0xf94c2e8d, Offset: 0x1505
// Size: 0x116
function getcover3dnodeoffset( node, leandir )
{
    assert( isdefined( node ) && node.type == "<dev string:x24>" );
    var_64d970aef87b1b2b = ( 2, -10, 35 );
    var_d68838c109759213 = ( -19, -10, 32 );
    var_8c00c7ee1f26521c = ( 16, -10, 32 );
    right = anglestoright( node.angles );
    forward = anglestoforward( node.angles );
    up = anglestoup( node.angles );
    offset = var_64d970aef87b1b2b;
    
    if ( isdefined( leandir ) )
    {
        if ( leandir == "left" )
        {
            offset = var_d68838c109759213;
        }
        else if ( leandir == "right" )
        {
            offset = var_8c00c7ee1f26521c;
        }
        else
        {
            assertmsg( "<dev string:x30>" );
        }
    }
    
    return calculatenodeoffset( right, forward, up, offset );
}

// Namespace utility_common
// Params 4
// Checksum 0xb0a7453c, Offset: 0x1624
// Size: 0x3d
function calculatenodeoffset( right, forward, up, baseoffset )
{
    return right * baseoffset[ 0 ] + forward * baseoffset[ 1 ] + up * baseoffset[ 2 ];
}

/#

    // Namespace utility_common
    // Params 2
    // Checksum 0x2d1a14ab, Offset: 0x166a
    // Size: 0x50, Type: dev
    function persistentdebugline( start, end )
    {
        self endon( "<dev string:x3f>" );
        level notify( "<dev string:x48>" );
        level endon( "<dev string:x48>" );
        
        for ( ;; )
        {
            line( start, end, ( 0.3, 1, 0 ), 1 );
            wait 0.05;
        }
    }

#/

// Namespace utility_common
// Params 0
// Checksum 0xf0e9bfb8, Offset: 0x16c2
// Size: 0x10e
function canseeenemyfromexposed()
{
    now = gettime();
    node = self.node;
    enemy = self.enemy;
    rechecktime = !isdefined( self.canseeenemyfromexposednext ) || now >= self.canseeenemyfromexposednext;
    
    if ( rechecktime || self.canseeenemyfromexposedenemy != enemy || self.canseeenemyfromexposednode != node )
    {
        self.canseeenemyfromexposed = canseeenemyfromexposedatnode( enemy, node );
        self.canseeenemyfromexposednext = now + 1000;
        self.canseeenemyfromexposednode = node;
        self.canseeenemyfromexposedenemy = enemy;
    }
    
    result = self.canseeenemyfromexposed;
    
    if ( !result )
    {
        /#
            if ( self getentitynumber() == getdvarint( @"hash_c407a6f2012f4956" ) )
            {
                thread persistentdebugline( node.origin + getnodeoffset( node ), getenemyeyepos() );
            }
        #/
    }
    
    return result;
}

// Namespace utility_common
// Params 2
// Checksum 0xe062d442, Offset: 0x17d9
// Size: 0xbb
function canseeenemyfromexposedatnode( enemy, node )
{
    if ( !isdefined( enemy ) )
    {
        return 0;
    }
    
    if ( !isdefined( node ) )
    {
        result = self cansee( enemy );
    }
    else
    {
        enemyeye = undefined;
        
        if ( isscriptedai( enemy ) )
        {
            enemyeye = enemy getapproxeyepos();
        }
        else
        {
            enemyeye = getenemyeyepos( enemy );
        }
        
        if ( utility::actor_is3d() && utility::isnode3d( node ) )
        {
            result = function_51bb3933b1f667fe( enemy, enemyeye, node );
            
            if ( !result )
            {
                enemyeye = ( enemy.origin + enemyeye ) / 2;
                result = function_51bb3933b1f667fe( enemy, enemyeye, node );
            }
        }
        else
        {
            result = function_51bb3933b1f667fe( enemy, enemyeye, node );
        }
    }
    
    return result;
}

// Namespace utility_common
// Params 3
// Checksum 0x9abc496, Offset: 0x189d
// Size: 0xc3
function function_51bb3933b1f667fe( enemy, point, node )
{
    if ( utility::isnodecoverleft( node ) || utility::isnodecoverright( node ) )
    {
        if ( !canseepointfromexposedatcorner( point, node ) )
        {
            return 0;
        }
    }
    
    nodeoffset = getnodeoffset( node );
    lookfrompoint = node.origin + nodeoffset;
    
    if ( !checkpitchvisibility( lookfrompoint, point, node ) )
    {
        return 0;
    }
    
    if ( !sighttracepassed( lookfrompoint, point, 0, enemy ) )
    {
        if ( utility::isnodecovercrouch( node ) )
        {
            lookfrompoint = ( 0, 0, 64 ) + node.origin;
            return sighttracepassed( lookfrompoint, point, 0, enemy );
        }
        
        return 0;
    }
    
    return 1;
}

// Namespace utility_common
// Params 3
// Checksum 0xeead29e8, Offset: 0x1969
// Size: 0xfe, Type: bool
function checkpitchvisibility( frompoint, topoint, atnode )
{
    minpitch = self.upaimlimit - anim.aimpitchdifftolerance;
    maxpitch = self.downaimlimit + anim.aimpitchdifftolerance;
    directionvec = topoint - frompoint;
    
    if ( utility::actor_is3d() )
    {
        if ( isdefined( atnode ) && utility::isnode3d( atnode ) )
        {
            angles = atnode.angles;
        }
        else
        {
            angles = self.angles;
        }
        
        directionvec = rotatevectorinverted( directionvec, angles );
    }
    
    pitch = angleclamp180( vectortopitch( directionvec ) );
    
    if ( pitch < minpitch )
    {
        return false;
    }
    
    if ( pitch > maxpitch )
    {
        if ( isdefined( atnode ) && !utility::isnodecovercrouch( atnode ) )
        {
            return false;
        }
        
        if ( pitch > anim.covercrouchleanpitch + maxpitch )
        {
            return false;
        }
    }
    
    return true;
}

/#

    // Namespace utility_common
    // Params 0
    // Checksum 0x6dde844c, Offset: 0x1a70
    // Size: 0xf, Type: dev
    function dontgiveuponsuppressionyet()
    {
        assertmsg( "<dev string:x58>" );
    }

#/

// Namespace utility_common
// Params 0
// Checksum 0x33a42a4a, Offset: 0x1a87
// Size: 0x9e
function cansuppressenemy()
{
    if ( !hassuppressableenemy() || self.doingambush )
    {
        self.goodshootpos = undefined;
        return 0;
    }
    
    suppressiondisabled = istrue( self.disablesuppressingfire );
    
    if ( !isplayer( self.enemy ) )
    {
        if ( !suppressiondisabled || self.forcesuppressai )
        {
            return aisuppressai();
        }
    }
    
    if ( suppressiondisabled )
    {
        return 0;
    }
    
    if ( !checkpitchvisibility( self geteye(), self.lastenemysightpos ) )
    {
        return 0;
    }
    
    startoffset = self getapproxeyepos();
    return findgoodsuppressspot( startoffset );
}

// Namespace utility_common
// Params 0
// Checksum 0x284a4975, Offset: 0x1b2e
// Size: 0x4a, Type: bool
function hassuppressableenemy()
{
    if ( !isdefined( self.enemy ) )
    {
        return false;
    }
    
    if ( !isdefined( self.lastenemysightpos ) )
    {
        return false;
    }
    
    if ( !self iscurrentenemyvalid() )
    {
        return false;
    }
    
    if ( !isdefined( self.goodshootpos ) && !needrecalculatesuppressspot() )
    {
        return false;
    }
    
    return true;
}

// Namespace utility_common
// Params 0
// Checksum 0x503c29bb, Offset: 0x1b81
// Size: 0xbe, Type: bool
function aisuppressai()
{
    if ( !self canattackenemynode() && !self.forcesuppressai )
    {
        return false;
    }
    
    shootpos = undefined;
    
    if ( isdefined( self.enemy.covernode ) )
    {
        nodeoffset = getnodeoffset( self.enemy.covernode );
        shootpos = self.enemy.covernode.origin + nodeoffset;
    }
    else
    {
        shootpos = self.enemy getshootatpos();
    }
    
    if ( !self canshoot( shootpos ) && !self.forcesuppressai )
    {
        return false;
    }
    
    self.goodshootpos = shootpos;
    return true;
}

// Namespace utility_common
// Params 1
// Checksum 0xdc77b61d, Offset: 0x1c48
// Size: 0x73
function canseeandshootpoint( point )
{
    if ( isdefined( self.a.weaponpos ) && isundefinedweapon( self.a.weaponpos[ "right" ] ) )
    {
        return 0;
    }
    
    if ( !sighttracepassed( self getshootatpos(), point, 0, undefined ) )
    {
        return 0;
    }
    
    gunpoint = self getapproxeyepos();
    return sighttracepassed( gunpoint, point, 0, undefined );
}

// Namespace utility_common
// Params 0
// Checksum 0xbcffb186, Offset: 0x1cc4
// Size: 0x6d, Type: bool
function needrecalculatesuppressspot()
{
    if ( isdefined( self.goodshootpos ) && !canseeandshootpoint( self.goodshootpos ) )
    {
        return true;
    }
    
    return !isdefined( self.lastenemysightposold ) || distancesquared( self.lastenemysightposold, self.lastenemysightpos ) > 256 || distancesquared( self.lastenemysightposselforigin, self.origin ) > 1024;
}

// Namespace utility_common
// Params 1
// Checksum 0xff66ccfc, Offset: 0x1d3a
// Size: 0x14e, Type: bool
function findgoodsuppressspot( startoffset )
{
    var_310cad2a53e7bf9d = min( self.enemy.maxvisibledist, 1024 );
    
    if ( isdefined( self.enemy ) && distancesquared( self.origin, self.enemy.origin ) > squared( var_310cad2a53e7bf9d + 768 ) )
    {
        self.goodshootpos = undefined;
        return false;
    }
    
    if ( needrecalculatesuppressspot() )
    {
        self.lastenemysightposselforigin = self.origin;
        self.lastenemysightposold = self.lastenemysightpos;
        
        if ( self.suppress_uselastenemysightpos )
        {
            self.goodshootpos = self.lastenemysightpos;
            return true;
        }
        
        currentenemypos = getenemyeyepos();
        self.goodshootpos = self aicalcsuppressspot( startoffset, currentenemypos, self.suppress_numgoodtracesneeded );
        return isdefined( self.goodshootpos );
    }
    else if ( isdefined( self.goodshootpos ) && isdefined( self.pathgoalpos ) && distancesquared( self.origin, self.goodshootpos ) < 1024 )
    {
        self.goodshootpos = undefined;
    }
    
    return isdefined( self.goodshootpos );
}

// Namespace utility_common
// Params 1
// Checksum 0xdd3780fb, Offset: 0x1e91
// Size: 0x6a, Type: bool
function canseeenemy( cacheduration )
{
    if ( !isdefined( self.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( cacheduration ) && self cansee( self.enemy, cacheduration ) || self cansee( self.enemy ) )
    {
        if ( !checkpitchvisibility( self geteye(), self.enemy getshootatpos() ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace utility_common
// Params 1
// Checksum 0x4ec8534a, Offset: 0x1f04
// Size: 0x36, Type: bool
function recentlysawenemy( time = 5 )
{
    return isdefined( self.enemy ) && self seerecently( self.enemy, time );
}

// Namespace utility_common
// Params 0
// Checksum 0x8e3856b0, Offset: 0x1f43
// Size: 0x2e
function issuppressedwrapper()
{
    if ( self.forcesuppression )
    {
        return 1;
    }
    
    if ( self.suppressionmeter <= self.suppressionthreshold )
    {
        return 0;
    }
    
    return self issuppressed();
}

// Namespace utility_common
// Params 0
// Checksum 0xb8e33521, Offset: 0x1f7a
// Size: 0xa7, Type: bool
function enemyishiding()
{
    if ( !isdefined( self.enemy ) )
    {
        return false;
    }
    
    if ( self.enemy utility::isflashed() )
    {
        return true;
    }
    
    if ( isplayer( self.enemy ) )
    {
        if ( self.enemy.health < self.enemy.maxhealth )
        {
            return true;
        }
    }
    else if ( isai( self.enemy ) && self.enemy issuppressedwrapper() )
    {
        return true;
    }
    
    if ( self.enemy.isreloading )
    {
        return true;
    }
    
    return false;
}

// Namespace utility_common
// Params 0
// Checksum 0x9345d501, Offset: 0x202a
// Size: 0x25, Type: bool
function shouldshootenemyent()
{
    assert( isdefined( self ) );
    
    if ( !canseeenemy() )
    {
        return false;
    }
    
    if ( !self canshootenemy() )
    {
        return false;
    }
    
    return true;
}

// Namespace utility_common
// Params 1
// Checksum 0x80bf4505, Offset: 0x2058
// Size: 0xfa
function sortandcullanimstructarray( animstructarray )
{
    newanimstructarray = [];
    
    foreach ( animstruct in animstructarray )
    {
        if ( animstruct.weight <= 0 )
        {
            continue;
        }
        
        for ( i = 0; i < newanimstructarray.size ; i++ )
        {
            if ( animstruct.weight < newanimstructarray[ i ].weight )
            {
                for ( j = newanimstructarray.size; j > i ; j-- )
                {
                    newanimstructarray[ j ] = newanimstructarray[ j - 1 ];
                }
                
                break;
            }
        }
        
        newanimstructarray[ i ] = animstruct;
    }
    
    return newanimstructarray;
}

// Namespace utility_common
// Params 3
// Checksum 0x7036a93d, Offset: 0x215b
// Size: 0x180
function player_can_see_ai( player, ai, latency )
{
    currenttime = gettime();
    
    if ( !isdefined( latency ) )
    {
        latency = 0;
    }
    
    if ( isdefined( ai.playerseesmetime ) && ai.playerseesmetime + latency >= currenttime )
    {
        assert( isdefined( ai.playerseesme ) );
        return ai.playerseesme;
    }
    
    ai.playerseesmetime = currenttime;
    
    if ( !utility::within_fov( player.origin, player.angles, ai.origin, 0.766 ) )
    {
        ai.playerseesme = 0;
        return 0;
    }
    
    playereye = player geteye();
    feetorigin = ai.origin;
    
    if ( sighttracepassed( playereye, feetorigin, 1, player, ai ) )
    {
        ai.playerseesme = 1;
        return 1;
    }
    
    eyeorigin = ai getapproxeyepos();
    
    if ( sighttracepassed( playereye, eyeorigin, 1, player, ai ) )
    {
        ai.playerseesme = 1;
        return 1;
    }
    
    midorigin = ( eyeorigin + feetorigin ) * 0.5;
    
    if ( sighttracepassed( playereye, midorigin, 1, player, ai ) )
    {
        ai.playerseesme = 1;
        return 1;
    }
    
    ai.playerseesme = 0;
    return 0;
}

