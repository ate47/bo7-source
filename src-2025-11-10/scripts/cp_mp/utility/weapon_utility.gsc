#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace weapon_utility;

// Namespace weapon_utility
// Params 5
// Checksum 0xe52398f0, Offset: 0x4c2
// Size: 0x71
function _magicbullet( objweapon, start, end, owner, event_ent )
{
    assert( !isstring( objweapon ), "<dev string:x24>" );
    missile = magicbullet( objweapon, start, end, owner, event_ent );
    
    if ( isdefined( missile ) && isdefined( owner ) )
    {
        missile setotherent( owner );
    }
    
    return missile;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xe2f0f040, Offset: 0x53c
// Size: 0x20
function islockonlauncher( objweapon )
{
    if ( !function_c1972d0d01397a22( objweapon ) )
    {
        return 0;
    }
    
    return getweaponcanlockon( objweapon );
}

// Namespace weapon_utility
// Params 2
// Checksum 0x5c980683, Offset: 0x565
// Size: 0x102
function addlockedon( entity, attacker )
{
    if ( !isdefined( entity.islockedon ) )
    {
        entity.islockedon = 0;
        entity.attackerslockedon = [];
    }
    
    if ( entity.islockedon == 0 )
    {
        if ( isdefined( entity.lockedoncallback ) )
        {
            entity thread [[ entity.lockedoncallback ]]();
        }
    }
    
    if ( isdefined( attacker ) )
    {
        assert( !isdefined( attacker.entlockedonto ), "<dev string:x67>" );
        attacker.entlockedonto = entity;
        assert( !isdefined( entity.attackerslockedon[ attacker getentitynumber() ] ), "<dev string:xb9>" );
        entity.attackerslockedon[ attacker getentitynumber() ] = attacker;
        
        if ( isplayer( attacker ) )
        {
            attacker utility::callsharedfunc( #"game", #"hash_b59823ee25c7e338" );
        }
    }
    
    entity.islockedon++;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x2d00627f, Offset: 0x66f
// Size: 0xcb
function removelockedon( entity, attacker )
{
    if ( !isdefined( entity.islockedon ) )
    {
        return;
    }
    
    assert( islockedonto( entity ), "<dev string:x108>" );
    
    if ( entity.islockedon == 1 )
    {
        if ( isdefined( entity.lockedonremovedcallback ) )
        {
            entity thread [[ entity.lockedonremovedcallback ]]();
        }
    }
    
    if ( isdefined( attacker ) )
    {
        if ( attacker.entlockedonto == entity )
        {
            attacker.entlockedonto = undefined;
        }
        
        entity.attackerslockedon[ attacker.entnum ?? utility::function_6ed37478a8ad7320( attacker ) ] = undefined;
    }
    
    if ( entity.islockedon > 0 )
    {
        entity.islockedon--;
    }
}

// Namespace weapon_utility
// Params 2
// Checksum 0x1bf0b649, Offset: 0x742
// Size: 0x23
function setlockedoncallback( entity, lockedoncallback )
{
    entity.lockedoncallback = lockedoncallback;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x4ba33aaf, Offset: 0x76d
// Size: 0x23
function setlockedonremovedcallback( entity, lockedonremovedcallback )
{
    entity.lockedonremovedcallback = lockedonremovedcallback;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xb3475cb2, Offset: 0x798
// Size: 0x14a
function clearlockedon( entity )
{
    entity notify( "clearLockedOn" );
    
    if ( islockedonto( entity ) )
    {
        if ( isdefined( entity.lockedonremovedcallback ) )
        {
            entity thread [[ entity.lockedonremovedcallback ]]();
        }
        
        foreach ( attacker in entity.attackerslockedon )
        {
            if ( isdefined( attacker ) )
            {
                if ( attacker.entlockedonto == entity )
                {
                    attacker.entlockedonto = undefined;
                }
            }
        }
    }
    
    entity.islockedon = undefined;
    entity.attackerslockedon = undefined;
    entity.lockedoncallback = undefined;
    entity.lockedonremovedcallback = undefined;
    
    if ( hasincoming( entity ) )
    {
        if ( isdefined( entity.incomingremovedcallback ) )
        {
            entity thread [[ entity.incomingremovedcallback ]]();
        }
    }
    
    entity.hasincoming = undefined;
    entity.incomingcallback = undefined;
    entity.incomingremovedcallback = undefined;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x7210f6a1, Offset: 0x8ea
// Size: 0x34
function clearlockedonondisconnect( player )
{
    if ( isdefined( self.entlockedonto ) )
    {
        removelockedon( self.entlockedonto, self );
    }
    
    self.entlockedonto = undefined;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x1a6dabe8, Offset: 0x926
// Size: 0x19, Type: bool
function islockedonto( entity )
{
    return entity.islockedon > 0;
}

// Namespace weapon_utility
// Params 3
// Checksum 0x69b9e0f5, Offset: 0x948
// Size: 0x62, Type: bool
function isinflictorstucktoplayer( inflictor, victim, equipref )
{
    if ( isdefined( inflictor ) )
    {
        if ( isdefined( inflictor.equipmentref ) && isdefined( equipref ) && inflictor.equipmentref != equipref )
        {
            return false;
        }
        
        if ( inflictor.stuckto == victim )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x8bc635ef, Offset: 0x9b3
// Size: 0x17
function function_46f7fffc626f2e7b( allowed )
{
    self.var_46f7fffc626f2e7b = allowed;
}

// Namespace weapon_utility
// Params 0
// Checksum 0xc17f5297, Offset: 0x9d2
// Size: 0x1b
function isMissileLauncherLockOnAllowed()
{
    if ( isdefined( self.var_46f7fffc626f2e7b ) )
    {
        return self.var_46f7fffc626f2e7b;
    }
    
    return 1;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x3f9ae99, Offset: 0x9f6
// Size: 0x1a, Type: bool
function hasBunkerBustersAttached( entity )
{
    return entity.bunkerbustersattached.size > 0;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x4a9d06e0, Offset: 0xa19
// Size: 0x23
function function_3bb81d4e40d27159( entity, var_55a7086fe1e5fcdd )
{
    entity.var_55a7086fe1e5fcdd = var_55a7086fe1e5fcdd;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x1c8ac5da, Offset: 0xa44
// Size: 0x23
function function_d6464586cc293251( entity, var_d9221ef5bff7298d )
{
    entity.var_d9221ef5bff7298d = var_d9221ef5bff7298d;
}

// Namespace weapon_utility
// Params 2
// Checksum 0xa96cf1e5, Offset: 0xa6f
// Size: 0x6c
function function_b2f98346d4b4da5( entity, ownerteam )
{
    if ( !isdefined( entity.bunkerbustersattached ) )
    {
        entity.bunkerbustersattached = [];
    }
    
    entity.bunkerbustersattached[ entity.bunkerbustersattached.size ] = ownerteam;
    
    if ( isdefined( entity.var_55a7086fe1e5fcdd ) )
    {
        entity thread [[ entity.var_55a7086fe1e5fcdd ]]();
    }
}

// Namespace weapon_utility
// Params 2
// Checksum 0x9dbdbe28, Offset: 0xae3
// Size: 0x13c
function function_83acd124c7845a3e( entity, ownerteam )
{
    if ( !isdefined( entity.bunkerbustersattached ) )
    {
        return;
    }
    
    assert( hasBunkerBustersAttached( entity ), "<dev string:x147>" );
    teams = entity.bunkerbustersattached;
    entity.bunkerbustersattached = [];
    removed = 0;
    
    foreach ( team in teams )
    {
        if ( !removed && team == ownerteam )
        {
            removed = 1;
            continue;
        }
        
        entity.bunkerbustersattached[ entity.bunkerbustersattached.size ] = team;
    }
    
    if ( entity.bunkerbustersattached.size == 0 )
    {
        entity.bunkerbustersattached = undefined;
    }
    
    if ( isdefined( entity.var_d9221ef5bff7298d ) )
    {
        entity thread [[ entity.var_d9221ef5bff7298d ]]();
    }
}

// Namespace weapon_utility
// Params 1
// Checksum 0xbea7db0e, Offset: 0xc27
// Size: 0x64
function addincoming( entity )
{
    if ( !isdefined( entity.hasincoming ) )
    {
        entity.hasincoming = 0;
    }
    
    if ( entity.hasincoming == 0 )
    {
        if ( isdefined( entity.incomingcallback ) )
        {
            entity thread [[ entity.incomingcallback ]]();
        }
    }
    
    entity.hasincoming++;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x7d024156, Offset: 0xc93
// Size: 0x6e
function removeincoming( entity )
{
    if ( !isdefined( entity.hasincoming ) )
    {
        return;
    }
    
    assert( hasincoming( entity ), "<dev string:x1a4>" );
    
    if ( entity.hasincoming == 1 )
    {
        if ( isdefined( entity.incomingremovedcallback ) )
        {
            entity thread [[ entity.incomingremovedcallback ]]();
        }
    }
    
    entity.hasincoming--;
}

// Namespace weapon_utility
// Params 2
// Checksum 0xf5d956d8, Offset: 0xd09
// Size: 0x1e
function giveandfireoffhandreliable( objweapon, var_48e9b160167e8daf )
{
    return weapon::giveandfireoffhandreliable( objweapon, var_48e9b160167e8daf );
}

// Namespace weapon_utility
// Params 2
// Checksum 0xd444d6e2, Offset: 0xd30
// Size: 0x1f
function function_34d323a1366782ec( player, objweapon )
{
    weapon::function_34d323a1366782ec( player, objweapon );
}

// Namespace weapon_utility
// Params 2
// Checksum 0xd444d6e2, Offset: 0xd57
// Size: 0x1f
function function_5fe9c9d0b33ce41d( player, objweapon )
{
    weapon::function_5fe9c9d0b33ce41d( player, objweapon );
}

// Namespace weapon_utility
// Params 2
// Checksum 0x54adb599, Offset: 0xd7e
// Size: 0x23
function setincomingcallback( entity, incomingcallback )
{
    entity.incomingcallback = incomingcallback;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x65000855, Offset: 0xda9
// Size: 0x23
function setincomingremovedcallback( entity, incomingremovedcallback )
{
    entity.incomingremovedcallback = incomingremovedcallback;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xba342b6c, Offset: 0xdd4
// Size: 0x19, Type: bool
function hasincoming( entity )
{
    return entity.hasincoming > 0;
}

// Namespace weapon_utility
// Params 2
// Checksum 0xc245a41, Offset: 0xdf6
// Size: 0x5b
function watchtargetlockedontobyprojectile( target, projectile )
{
    target endon( "clearLockedOn" );
    addlockedon( target );
    addincoming( target );
    projectile utility::waittill_any( "death", "clearTargetLockedOntoByProjectile" );
    
    if ( isdefined( target ) )
    {
        removelockedon( target );
        removeincoming( target );
    }
}

// Namespace weapon_utility
// Params 1
// Checksum 0x6a475753, Offset: 0xe59
// Size: 0x15
function clearprojectilelockedon( projectile )
{
    projectile notify( "clearTargetLockedOntoByProjectile" );
}

// Namespace weapon_utility
// Params 4
// Checksum 0x5e9f00, Offset: 0xe76
// Size: 0x2ca
function dropweaponfordeathlaunch( item, weapongroup, damage, angles )
{
    if ( item physics_getnumbodies() == 0 )
    {
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self.angles;
    }
    
    if ( !isdefined( damage ) )
    {
        damage = 0;
    }
    
    normalizeddamage = math::normalize_value( 0, 200, damage );
    
    if ( weapongroup == "weapon_melee2" )
    {
        var_f97d42f076ad0ffe = randomfloatrange( 25, 100 );
        var_56038b786eb34e7 = randomfloatrange( 75, 175 );
        var_21060ccead987aae = math::factor_value( 450, 800, normalizeddamage );
        var_95ba8343f05e0134 = math::factor_value( -1.16667, -0.833333, normalizeddamage );
        var_fa44270a600bd3d3 = math::factor_value( 0.125, 0.183333, normalizeddamage );
    }
    else if ( weapongroup == "weapon_pistol" )
    {
        var_f97d42f076ad0ffe = randomfloatrange( 100, 200 );
        var_56038b786eb34e7 = randomfloatrange( 150, 250 );
        var_21060ccead987aae = math::factor_value( 950, 1300, normalizeddamage );
        var_95ba8343f05e0134 = math::factor_value( -1.75, -1.25, normalizeddamage );
        var_fa44270a600bd3d3 = math::factor_value( 0.5625, 0.825, normalizeddamage );
    }
    else
    {
        var_f97d42f076ad0ffe = randomfloatrange( 150, 350 );
        var_56038b786eb34e7 = randomfloatrange( 150, 250 );
        var_21060ccead987aae = math::factor_value( 950, 1300, normalizeddamage );
        var_95ba8343f05e0134 = math::factor_value( -7, -5, normalizeddamage );
        var_fa44270a600bd3d3 = math::factor_value( 0.75, 1.1, normalizeddamage );
    }
    
    if ( utility::cointoss() )
    {
        var_56038b786eb34e7 *= -1;
    }
    
    if ( !isdefined( item ) )
    {
        println( "<dev string:x1e7>" );
        return;
    }
    
    itemcenterofmass = item physics_getentitycenterofmass();
    
    if ( isdefined( itemcenterofmass ) )
    {
        itemcenterofmass = itemcenterofmass[ "unscaled" ];
    }
    else
    {
        itemcenterofmass = item.origin;
    }
    
    launchvelocity = ( 0, 0, 0 );
    launchvelocity += anglestoforward( angles ) * var_f97d42f076ad0ffe;
    launchvelocity += anglestoright( angles ) * var_56038b786eb34e7;
    launchvelocity += anglestoup( angles ) * var_21060ccead987aae;
    weaponangles = item gettagangles( "tag_flash", 1 );
    
    if ( !isdefined( weaponangles ) )
    {
        weaponangles = item.angles;
    }
    
    if ( utility::cointoss() )
    {
        var_fa44270a600bd3d3 *= -1;
    }
    
    launchorigin = itemcenterofmass;
    launchorigin += anglestoforward( weaponangles ) * var_95ba8343f05e0134;
    launchorigin += anglestoright( weaponangles ) * var_fa44270a600bd3d3;
    logprint( "PhysicsLaunchServerItem" );
    logprint( "item.classname = " + item.classname );
    logprint( "launchOrigin   = " + launchorigin );
    logprint( "launchVelocity = " + launchvelocity );
    item physicslaunchserveritem( launchorigin, launchvelocity );
}

// Namespace weapon_utility
// Params 2
// Checksum 0x51a4cfc5, Offset: 0x1148
// Size: 0xaf
function function_cd7fc4f6ba97876c( droppeditem, weaponobj )
{
    if ( !isdefined( droppeditem ) )
    {
        return;
    }
    
    weaponname = getcompleteweaponname( weaponobj );
    
    if ( self.tookweaponfrom[ weaponname ].var_3a1cc6241650f669 )
    {
        droppeditem.owner = self.tookweaponfrom[ weaponname ].var_3a1cc6241650f669;
        self.tookweaponfrom[ weaponname ].var_3a1cc6241650f669 = undefined;
    }
    else
    {
        droppeditem.owner = self;
    }
    
    droppeditem.targetname = "dropped_weapon";
    droppeditem.objweapon = weaponobj;
}

// Namespace weapon_utility
// Params 0
// Checksum 0x4d66c2db, Offset: 0x11ff
// Size: 0xc
function function_b6883e5e149bdb1f()
{
    self.tookweaponfrom = [];
}

// Namespace weapon_utility
// Params 2
// Checksum 0x1a0bc481, Offset: 0x1213
// Size: 0x53, Type: bool
function function_6901d4a87ebafa4f( weaponobj, targetplayer )
{
    weaponname = getcompleteweaponname( weaponobj );
    return self.tookweaponfrom[ weaponname ].var_3a1cc6241650f669.team == targetplayer.team;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x8f8de72b, Offset: 0x126f
// Size: 0x81, Type: bool
function isbulletweaponobject( weaponobj )
{
    if ( weaponobj.isalternate )
    {
        if ( level.var_b4cb3f56d98881fe[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ] ?? function_401fa5972e75b5ae( weaponobj ) )
        {
            return true;
        }
        
        return false;
    }
    
    if ( level.var_8d7b00b42b9b4880[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ] ?? function_adc8c634de18b430( weaponobj ) )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1, eflags: 0x4
// Checksum 0x831e129e, Offset: 0x12f9
// Size: 0x72
function private function_adc8c634de18b430( weaponobj )
{
    if ( level.var_8d7b00b42b9b4880.size > 300 )
    {
        level.var_8d7b00b42b9b4880 = [];
    }
    
    level.var_8d7b00b42b9b4880[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ] = function_6c277efdcd51749f( weaponobj );
    return level.var_8d7b00b42b9b4880[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ];
}

// Namespace weapon_utility
// Params 1, eflags: 0x4
// Checksum 0x69d48cf2, Offset: 0x1374
// Size: 0x72
function private function_401fa5972e75b5ae( weaponobj )
{
    if ( level.var_b4cb3f56d98881fe.size > 300 )
    {
        level.var_b4cb3f56d98881fe = [];
    }
    
    level.var_b4cb3f56d98881fe[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ] = function_6c277efdcd51749f( weaponobj );
    return level.var_b4cb3f56d98881fe[ weaponobj.basenamehash ?? #"hash_2db1ec1962f1dc38" ];
}

// Namespace weapon_utility
// Params 1, eflags: 0x4
// Checksum 0xc3f1f2a9, Offset: 0x13ef
// Size: 0xb5
function private function_6c277efdcd51749f( weaponobj )
{
    if ( !isdefined( weaponobj ) || isnullweapon( weaponobj ) )
    {
        return 0;
    }
    
    if ( isriotshieldobject( weaponobj ) || isknifeonly( weaponobj ) )
    {
        return 0;
    }
    
    if ( weaponobj.inventorytype === "model_only" )
    {
        return 0;
    }
    
    switch ( weaponclass( weaponobj ) )
    {
        case #"hash_690c0d6a821b42e":
        case #"hash_6191aaef9f922f96":
        case #"hash_719417cb1de832b6":
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa24dff6bd60a12d":
            return 1;
        default:
            return 0;
    }
}

// Namespace weapon_utility
// Params 1
// Checksum 0xb8cdeb26, Offset: 0x14ac
// Size: 0x41, Type: bool
function isbulletweapon( weaponobj )
{
    if ( !isdefined( weaponobj ) )
    {
        assertmsg( "<dev string:x220>" );
        return false;
    }
    
    if ( !isweapon( weaponobj ) )
    {
        weaponobj = utility::function_64003742d8f5c781( weaponobj );
    }
    
    return isbulletweaponobject( weaponobj );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x9302c51b, Offset: 0x14f6
// Size: 0x5c, Type: bool
function function_186e07887b6bbeb1( weaponobj )
{
    if ( !isweapon( weaponobj ) )
    {
        weaponobj = utility::function_64003742d8f5c781( weaponobj );
    }
    
    if ( !isdefined( weaponobj ) )
    {
        assertmsg( "<dev string:x262>" );
        return false;
    }
    
    if ( isnullweapon( weaponobj ) )
    {
        return false;
    }
    
    if ( weaponobj.type == "projectile" )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x4afe8ec, Offset: 0x155b
// Size: 0x4b, Type: bool
function function_72753cbca8f2699f( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x2a6>" );
        return false;
    }
    
    if ( isnullweapon( weapon ) )
    {
        return false;
    }
    
    return weapon.classname == "sniper";
}

// Namespace weapon_utility
// Params 1
// Checksum 0x5bd45769, Offset: 0x15af
// Size: 0x52, Type: bool
function function_c1972d0d01397a22( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x262>" );
        return false;
    }
    
    if ( isnullweapon( weapon ) )
    {
        return false;
    }
    
    if ( weapon.classname == "rocketlauncher" )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xec3cc492, Offset: 0x160a
// Size: 0x4b, Type: bool
function isgrenadeweapon( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x2ed>" );
        return false;
    }
    
    if ( isnullweapon( weapon ) )
    {
        return false;
    }
    
    return weapon.classname == "grenade";
}

// Namespace weapon_utility
// Params 1
// Checksum 0x83ff0d0b, Offset: 0x165e
// Size: 0x4b, Type: bool
function isoffhandweapon( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x335>" );
        return false;
    }
    
    if ( isnullweapon( weapon ) )
    {
        return false;
    }
    
    return weapon.inventorytype == "offhand";
}

// Namespace weapon_utility
// Params 1
// Checksum 0xb038f594, Offset: 0x16b2
// Size: 0xe0, Type: bool
function function_1bf655fc8f1fda2d( weapon )
{
    if ( getdvarint( @"hash_86c5f9dae77ee49e", 1 ) == 0 )
    {
        return false;
    }
    
    var_7536c5e941b0d00c = [ %"riotshield", %"iw9_me_riotshield_mp", %"iw9_la_juliet_mp", %"iw9_la_gromeo_mp", %"iw9_me_sword01_mp", %"iw9_me_kamas_mp" ];
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) || isnullweapon( weaponobj ) )
    {
        return false;
    }
    
    if ( weapon::isakimbo( weapon ) )
    {
        return true;
    }
    
    for ( i = 0; i < var_7536c5e941b0d00c.size ; i++ )
    {
        if ( var_7536c5e941b0d00c[ i ] == weaponobj.basenamehash )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1
// Checksum 0x41d1e135, Offset: 0x179b
// Size: 0x18, Type: bool
function isriotshieldobject( weaponobj )
{
    return weapontype( weaponobj ) == "riotshield";
}

// Namespace weapon_utility
// Params 1
// Checksum 0xbaeeec9e, Offset: 0x17bc
// Size: 0x31, Type: bool
function isriotshield( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return false;
    }
    
    return isriotshieldobject( weaponobj );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x74acac99, Offset: 0x17f6
// Size: 0x5a, Type: bool
function isknifeonly( weapon )
{
    rootname = weapon::getweaponrootname( weapon );
    isknife = level.weaponmapdata[ rootname ].isknife;
    return isknife || rootname == "iw9_me_knife" || rootname == "jup_jp23_me_knife";
}

// Namespace weapon_utility
// Params 1
// Checksum 0x49469599, Offset: 0x1859
// Size: 0xa0, Type: bool
function isSharpMeleeWeapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return false;
    }
    
    rootname = weapon::getweaponrootname( weaponobj );
    var_77f83d3835410d2e = istrue( level.weaponmapdata[ rootname ].var_77f83d3835410d2e );
    return var_77f83d3835410d2e || weaponobj.basenamehash == %"iw9_me_knife_mp" || weaponobj == level.var_69de91814bc11b10 || weaponobj.basenamehash == %"iw9_me_sword01_mp";
}

// Namespace weapon_utility
// Params 1
// Checksum 0x30f690ca, Offset: 0x1902
// Size: 0x2c, Type: bool
function function_724ac858ee9ecfb8( weapon )
{
    if ( weapon.isalternate )
    {
        if ( getweaponhasperk( weapon, "specialty_molotov_shots" ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xc4afb1da, Offset: 0x1937
// Size: 0x40
function ischainsword( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x37d>" );
        return 0;
    }
    
    return issubstr( weapon.basename, "me_swhiskey" );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x7237431a, Offset: 0x1980
// Size: 0x24
function function_50055d29b455bc79( objweapon )
{
    if ( isdefined( objweapon ) && getweaponhasperk( objweapon, "specialty_stealth_shot" ) )
    {
        return 1;
    }
}

// Namespace weapon_utility
// Params 0
// Checksum 0x51eb7907, Offset: 0x19ac
// Size: 0x70
function saveweaponstates()
{
    if ( utility::issharedfuncdefined( #"weapons", #"savetogglescopestates" ) )
    {
        self [[ utility::getsharedfunc( #"weapons", #"savetogglescopestates" ) ]]();
    }
    
    if ( utility::issharedfuncdefined( #"weapons", #"savealtstates" ) )
    {
        self [[ utility::getsharedfunc( #"weapons", #"savealtstates" ) ]]();
    }
}

// Namespace weapon_utility
// Params 2
// Checksum 0x337ec28a, Offset: 0x1a24
// Size: 0x9a
function restoreweaponstates( lastweaponobj, updatetogglescopestate )
{
    if ( self isalternatemode( lastweaponobj ) )
    {
        if ( utility::issharedfuncdefined( #"weapons", #"updatesavedaltstate" ) )
        {
            lastweaponobj = self [[ utility::getsharedfunc( #"weapons", #"updatesavedaltstate" ) ]]( lastweaponobj );
        }
    }
    
    if ( updatetogglescopestate && utility::issharedfuncdefined( #"weapons", #"updatetogglescopestate" ) )
    {
        self [[ utility::getsharedfunc( #"weapons", #"updatetogglescopestate" ) ]]( lastweaponobj );
    }
    
    return lastweaponobj;
}

// Namespace weapon_utility
// Params 10
// Checksum 0x1e76f79d, Offset: 0x1ac7
// Size: 0x1bf
function function_926700ffa3fbe9e( idamage, attacker, victim, smeansofdeath, shitloc, inflictor, vpoint, lightarmordamage, heavyarmordamage, helmetdamage )
{
    if ( isdefined( level.var_dc4402d991756a00 ) )
    {
        distmsg = "";
        
        if ( isexplosivedamagemod( smeansofdeath ) && isdefined( victim.origin ) )
        {
            dmgorigin = vpoint;
            
            if ( isdefined( inflictor ) && isdefined( inflictor.origin ) )
            {
                dmgorigin = inflictor.origin;
            }
            
            distmsg = " EXPL_DIST: " + int( distance( dmgorigin, victim.origin ) );
        }
        else if ( isdefined( vpoint ) )
        {
            distmsg = " DIST:" + int( distance( attacker.origin, vpoint ) );
        }
        
        armormsg = "";
        
        if ( lightarmordamage > 0 )
        {
            armormsg = " ArmorDmg: " + lightarmordamage;
        }
        else if ( heavyarmordamage > 0 )
        {
            armormsg = " ArmorDmg: " + heavyarmordamage;
        }
        
        helmetmsg = "";
        
        if ( helmetdamage > 0 )
        {
            helmetmsg = " HelmetDmg: " + helmetdamage;
        }
        
        victimtext = isai( victim ) ? "AI-" : "Plyr-";
        iprintln( victimtext + "DMG:" + idamage + " LOC:" + shitloc + " HEALTH: " + victim.health + "/" + victim.maxhealth + distmsg + armormsg + helmetmsg );
    }
}

// Namespace weapon_utility
// Params 1
// Checksum 0x9670ef04, Offset: 0x1c8e
// Size: 0x14
function function_d2c8356dc369d9ce( weaponstring )
{
    return weapon::function_d2c8356dc369d9ce( weaponstring );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x99051690, Offset: 0x1cab
// Size: 0x31
function makedefaultweapon( weaponstring )
{
    attachments = getweapondefaultattachments( weaponstring );
    weaponobj = function_80745a4905e8ac4c( weaponstring, attachments );
    return weaponobj;
}

// Namespace weapon_utility
// Params 0
// Checksum 0x760c1984, Offset: 0x1ce5
// Size: 0x31
function function_dbe865d63516d5e8()
{
    if ( isagent( self ) )
    {
        cachevalue = "ai_" + self getentitynumber();
    }
    else
    {
        cachevalue = self.guid;
    }
    
    return cachevalue;
}

// Namespace weapon_utility
// Params 2
// Checksum 0x4b9201a7, Offset: 0x1d1f
// Size: 0x97
function function_502496613f00eb2a( objweapon, var_938188821853c1eb )
{
    if ( !isdefined( level.var_e14b75034d106d4b ) )
    {
        level.var_e14b75034d106d4b = [];
    }
    
    if ( !isdefined( level.var_e14b75034d106d4b[ objweapon.basenamehash ] ) )
    {
        weaponowners = [];
        level.var_e14b75034d106d4b[ objweapon.basenamehash ] = weaponowners;
    }
    
    level.var_e14b75034d106d4b[ objweapon.basenamehash ][ self.guid ] = var_938188821853c1eb;
    thread function_848d1fe899fe91c4( objweapon );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x5d04b202, Offset: 0x1dbe
// Size: 0x6d
function function_848d1fe899fe91c4( objweapon )
{
    weapname = weapon::getweaponname( objweapon );
    note = "removeWeaponParent_" + weapname;
    self notify( note );
    self endon( note );
    uniqueid = self.guid;
    wait 5;
    level.var_e14b75034d106d4b[ objweapon.basenamehash ][ uniqueid ] = undefined;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xe16bf2d8, Offset: 0x1e33
// Size: 0x9c
function function_8097c50c526bd683( objweapon )
{
    if ( !isdefined( objweapon ) )
    {
        return nullweapon();
    }
    
    if ( isstring( objweapon ) )
    {
        return objweapon;
    }
    
    weaponnamehash = objweapon.basenamehash;
    
    if ( !isdefined( level.var_e14b75034d106d4b[ weaponnamehash ] ) )
    {
        return objweapon;
    }
    
    if ( !isdefined( level.var_e14b75034d106d4b[ weaponnamehash ][ self.guid ] ) )
    {
        assertmsg( "<dev string:x3be>" + weaponnamehash + "<dev string:x3f9>" );
        return objweapon;
    }
    
    return level.var_e14b75034d106d4b[ weaponnamehash ][ self.guid ];
}

// Namespace weapon_utility
// Params 1
// Checksum 0xc17ddbe8, Offset: 0x1ed8
// Size: 0x1e
function function_5ba4049e1c74f6a8( objweapon )
{
    objweapon = utility::function_64003742d8f5c781( objweapon );
    return function_8097c50c526bd683( objweapon );
}

// Namespace weapon_utility
// Params 3
// Checksum 0xbb247a21, Offset: 0x1eff
// Size: 0x5f, Type: bool
function function_433cd8ffe864ddc8( eattacker, victim, idflags )
{
    hand = function_deff5471cdf04d56( idflags );
    victimentnum = function_4ec08fffae2d922d( victim );
    return istrue( eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_77e7ce207984d5d8 );
}

// Namespace weapon_utility
// Params 1
// Checksum 0x1643d97f, Offset: 0x1f67
// Size: 0x24
function function_deff5471cdf04d56( idflags )
{
    if ( idflags & 2048 )
    {
        return "lHandWeap";
    }
    
    return "rHandWeap";
}

// Namespace weapon_utility
// Params 1
// Checksum 0x3fe5948f, Offset: 0x1f93
// Size: 0x12
function function_4ec08fffae2d922d( victim )
{
    return victim getentitynumber();
}

// Namespace weapon_utility
// Params 4
// Checksum 0xecd463c2, Offset: 0x1fae
// Size: 0xd1
function function_ceb194a906bf4a4c( eattacker, victim, idflags, idamage )
{
    hand = function_deff5471cdf04d56( idflags );
    victimentnum = function_4ec08fffae2d922d( victim );
    var_76e29d4e61df4835 = eattacker.pelletweaponvictimids[ hand ][ victimentnum ];
    
    if ( !isdefined( var_76e29d4e61df4835 ) )
    {
        return idamage;
    }
    
    var_57dfd4c4337d402e = var_76e29d4e61df4835.var_57dfd4c4337d402e;
    var_8c8eb6b39a4c19ad = var_76e29d4e61df4835.var_8c8eb6b39a4c19ad;
    
    if ( var_8c8eb6b39a4c19ad < var_57dfd4c4337d402e )
    {
        idamage = clamp( idamage, 0, var_57dfd4c4337d402e - var_8c8eb6b39a4c19ad );
        var_76e29d4e61df4835.var_8c8eb6b39a4c19ad += idamage;
        return idamage;
    }
    
    return 0;
}

// Namespace weapon_utility
// Params 4
// Checksum 0x72385c1d, Offset: 0x2087
// Size: 0x82
function function_853dbbe8f0c9de3( eattacker, victim, idflags, idamage )
{
    hand = function_deff5471cdf04d56( idflags );
    victimentnum = function_4ec08fffae2d922d( victim );
    
    if ( !isdefined( eattacker.pelletweaponvictimids[ hand ][ victimentnum ] ) )
    {
        return;
    }
    
    eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed[ 0 ] = idamage;
}

// Namespace weapon_utility
// Params 4
// Checksum 0xec7b8c9d, Offset: 0x2111
// Size: 0x9c
function function_f6354e5e65144a2e( eattacker, victim, idflags, amount )
{
    hand = function_deff5471cdf04d56( idflags );
    victimentnum = function_4ec08fffae2d922d( victim );
    
    if ( !isdefined( eattacker.pelletweaponvictimids[ hand ][ victimentnum ] ) )
    {
        return 0;
    }
    
    eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_8c8eb6b39a4c19ad += amount;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xc67d8319, Offset: 0x21b5
// Size: 0x2c
function cleanupconcussionstun( time )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait time;
    
    if ( !self )
    {
        return;
    }
    
    utility::setplayerunstunned();
}

// Namespace weapon_utility
// Params 2
// Checksum 0x49cf81aa, Offset: 0x21e9
// Size: 0x37
function function_3044cc8c7b9a712a( time, var_4d6be7f39ac22259 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait time;
    
    if ( !self )
    {
        return;
    }
    
    utility::function_f6dbf59c1adea4c2( var_4d6be7f39ac22259 );
}

// Namespace weapon_utility
// Params 2
// Checksum 0xc47cf384, Offset: 0x2228
// Size: 0x109
function function_73b6be1968a97ac3( weaponobj, scaleoverride )
{
    shellshockdata = spawnstruct();
    
    if ( isdefined( scaleoverride ) )
    {
        shellshockdata.scalemin = scaleoverride;
        shellshockdata.scalemid = scaleoverride;
        shellshockdata.scalemax = scaleoverride;
    }
    
    if ( weapon::iskillstreakweapon( weaponobj ) )
    {
        shellshockdata.enable = 1;
        shellshockdata.duration = 1;
        shellshockdata.scalemin = 0.05;
        shellshockdata.scalemid = 0.15;
        shellshockdata.scalemax = 0.25;
        shellshockdata.rumbletype = "artillery_rumble_heavy";
        shellshockdata.rangemin = 1200;
        shellshockdata.rangemid = 1000;
        shellshockdata.rangemax = 800;
        shellshockdata.var_6931c25fe3e52b11 = shellshockdata.rangemin;
    }
    
    return shellshockdata;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xd822e9f1, Offset: 0x233a
// Size: 0x4c
function function_66f7c63df61623d9( weapon )
{
    gametypename = getgametypenamekey();
    gametypeattachment = function_ed24309ec468327d( weapon, gametypename );
    
    if ( isdefined( gametypeattachment ) && weapon hasattachment( gametypeattachment ) )
    {
        return weapon withoutattachment( gametypeattachment );
    }
    
    return weapon;
}

// Namespace weapon_utility
// Params 2
// Checksum 0xc5f371b2, Offset: 0x238e
// Size: 0x15d
function function_82abd5dde633d1a3( weapon, pickup_source )
{
    if ( !weapon::iswonderweapon( weapon ) )
    {
        return weapon;
    }
    
    weaponvariantindex = getweaponvariantindex( weapon );
    
    if ( isdefined( weaponvariantindex ) )
    {
        return weapon;
    }
    
    weaponrootname = weapon::getweaponrootname( weapon );
    
    if ( isenumvaluevalid( level.loadoutsgroup, "WonderWeapon", getxhashasset( weaponrootname ) ) )
    {
        path = %"customizationsetup";
        
        if ( getprojectname() == "SAT" || getprojectname() == "SAW" )
        {
            path = "customizations";
        }
        
        blueprintname = self getplayerdata( level.loadoutsgroup, path, "wonderWeaponCustomization", weaponrootname, "blueprintName" );
        weaponassetname = level.weaponmapdata[ weaponrootname ].assetname;
        
        if ( isdefined( weaponassetname ) && isxhashasset( blueprintname ) && blueprintname != %"" )
        {
            camo = getweaponcamoname( weapon );
            blueprintweapon = weapon::function_bfc8095d723355fa( weaponassetname, blueprintname, camo );
            
            if ( isdefined( pickup_source ) )
            {
                callback::callback( #"hash_ab8dca76e6e4b303", { #source:pickup_source, #objweapon:blueprintweapon } );
            }
            
            return blueprintweapon;
        }
    }
    
    return weapon;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xb620c6ba, Offset: 0x24f4
// Size: 0x4b, Type: bool
function function_7f3fdce4d25dd061( grenade )
{
    var_d458b9253595dffa = level.scoreeventglobals.var_d458b9253595dffa ?? 800;
    
    if ( gettime() - grenade.birthtime >= var_d458b9253595dffa )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon_utility
// Params 6
// Checksum 0x4796d852, Offset: 0x2548
// Size: 0xba
function function_5a4e4e85b51159b6( inflictor, limbfx, torsofx, headfx, sfx, deletebody )
{
    if ( !isdefined( inflictor ) )
    {
        assertmsg( "<dev string:x47e>" );
        return;
    }
    
    fxdata = spawnstruct();
    fxdata.limbfx = limbfx;
    fxdata.torsofx = torsofx;
    fxdata.headfx = headfx;
    fxdata.sfx = sfx;
    fxdata.deletebody = deletebody ?? 1;
    inflictor.var_1e131f764e128ab1 = fxdata;
}

// Namespace weapon_utility
// Params 1
// Checksum 0xd4345488, Offset: 0x260a
// Size: 0x26
function function_4472360fbd7a5812( inflictor )
{
    if ( isdefined( inflictor.var_1e131f764e128ab1 ) )
    {
        inflictor.var_1e131f764e128ab1 = undefined;
    }
}

// Namespace weapon_utility
// Params 2
// Checksum 0x518f27b5, Offset: 0x2638
// Size: 0x92, Type: bool
function function_584becf6a5ddf5f0( inflictor, victim )
{
    if ( isdefined( inflictor.var_1e131f764e128ab1 ) )
    {
        fxdata = inflictor.var_1e131f764e128ab1;
        
        if ( isdefined( victim ) )
        {
            playdeathvfx( victim, victim.body, fxdata.limbfx, fxdata.torsofx, fxdata.headfx, fxdata.sfx, fxdata.deletebody );
            return true;
        }
        
        return false;
    }
    
    return false;
}

// Namespace weapon_utility
// Params 7
// Checksum 0xfa28f303, Offset: 0x26d3
// Size: 0x107
function playdeathvfx( victim, corpstable, limbfx, torsofx, headfx, sfx, deletebody )
{
    if ( !isdefined( victim ) )
    {
        return;
    }
    
    function_626fe75ad9d2d09b( victim, "j_shoulder_ri", limbfx );
    function_626fe75ad9d2d09b( victim, "j_shoulder_le", limbfx );
    function_626fe75ad9d2d09b( victim, "j_elbow_ri", limbfx );
    function_626fe75ad9d2d09b( victim, "j_elbow_le", limbfx );
    function_626fe75ad9d2d09b( victim, "j_hip_ri", limbfx );
    function_626fe75ad9d2d09b( victim, "j_hip_le", limbfx );
    function_626fe75ad9d2d09b( victim, "j_knee_ri", limbfx );
    function_626fe75ad9d2d09b( victim, "j_knee_le", limbfx );
    function_626fe75ad9d2d09b( victim, "j_spineupper", torsofx );
    function_626fe75ad9d2d09b( victim, "j_head", headfx );
    
    if ( isdefined( sfx ) )
    {
        victim playsound( sfx );
    }
    
    if ( deletebody )
    {
        function_f1337d8a77853c84( victim, corpstable );
    }
}

// Namespace weapon_utility
// Params 3
// Checksum 0x7a40fb20, Offset: 0x27e2
// Size: 0x6a
function function_626fe75ad9d2d09b( fxent, fxtag, fxref )
{
    if ( fxent tagexists( fxtag ) )
    {
        org = fxent gettagorigin( fxtag );
        ang = fxent gettagangles( fxtag );
        playfx( level._effect[ fxref ], org, anglestoforward( ang ), anglestoup( ang ) );
    }
}

// Namespace weapon_utility
// Params 2
// Checksum 0xc48d07c9, Offset: 0x2854
// Size: 0x57
function function_f1337d8a77853c84( victim, corpstable )
{
    if ( !isdefined( corpstable ) )
    {
        return;
    }
    
    function_ac43a34a98fd15f( corpstable );
    
    if ( corpstable.targetname == "player_corpse" )
    {
        corpstable hide();
        return;
    }
    
    if ( isagent( victim ) )
    {
        victim thread function_552743d7a3bb3776( corpstable );
    }
}

// Namespace weapon_utility
// Params 1, eflags: 0x4
// Checksum 0x2b134ece, Offset: 0x28b3
// Size: 0x11a
function private function_ac43a34a98fd15f( corpstable )
{
    linkedchildren = corpstable getlinkedchildren();
    
    foreach ( child in linkedchildren )
    {
        if ( child.iscrossbowbolt )
        {
            child utility::callsharedfunc( "crossbow", "boltUnlink" );
        }
        
        if ( isdefined( child.equipmentref ) )
        {
            switch ( child.equipmentref )
            {
                case #"hash_8df9cfc147eb2d86":
                case #"hash_9ba0a6ff6081954e":
                case #"hash_de4641ddbc44a7ba":
                case #"hash_e156752cb79526e8":
                case #"hash_f0907f858c134cb4":
                    child unlink();
                    break;
                default:
                    break;
            }
        }
    }
}

// Namespace weapon_utility
// Params 1, eflags: 0x4
// Checksum 0xd2f41325, Offset: 0x29d5
// Size: 0x1a
function private function_552743d7a3bb3776( corpsetable )
{
    waitframe();
    
    if ( isdefined( corpsetable ) )
    {
        corpsetable delete();
    }
}

