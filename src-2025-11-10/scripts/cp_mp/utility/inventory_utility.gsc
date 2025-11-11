#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\weapon;
#using scripts\engine\utility;

#namespace inventory_utility;

// Namespace inventory_utility
// Params 5
// Checksum 0x14ef8673, Offset: 0x2b5
// Size: 0x92
function _giveweapon( weapon, variant, dualwieldoverride, usedbefore, var_31b84291bf81176d )
{
    if ( !isdefined( variant ) )
    {
        variant = -1;
    }
    
    if ( !isdefined( usedbefore ) )
    {
        usedbefore = utility::shouldskipfirstraise();
    }
    
    /#
        if ( getdvarint( @"hash_111ef391787da7e1", 0 ) == 1 )
        {
            usedbefore = 0;
            self iprintlnbold( "<dev string:x24>" );
        }
    #/
    
    self giveweapon( weapon, variant, istrue( dualwieldoverride ), -1, usedbefore, istrue( var_31b84291bf81176d ) );
    callback::callback( #"hash_b02776c64786db5b" );
}

// Namespace inventory_utility
// Params 1
// Checksum 0xd9211307, Offset: 0x34f
// Size: 0x4e
function _switchtoweapon( weapon )
{
    if ( isweapon( weapon ) || isstring( weapon ) )
    {
        /#
            debugweaponchangeprint( "<dev string:x44>", weapon );
        #/
        
        self switchtoweapon( weapon );
        return;
    }
    
    assertmsg( "<dev string:x5c>" + weapon );
}

// Namespace inventory_utility
// Params 1
// Checksum 0xe24e25ab, Offset: 0x3a5
// Size: 0x25
function _switchtoweaponimmediate( weapon )
{
    /#
        debugweaponchangeprint( "<dev string:x87>", weapon );
    #/
    
    self switchtoweaponimmediate( weapon );
}

// Namespace inventory_utility
// Params 1
// Checksum 0x79d09f6b, Offset: 0x3d2
// Size: 0x108
function _takeweapon( weapon )
{
    /#
        if ( getdvarint( @"hash_e6a5211d6811a3e", 0 ) != 0 )
        {
            debugweaponchangeprint( "<dev string:xa8>", weapon );
            
            if ( iscurrentweapon( weapon ) )
            {
                println( "<dev string:xbc>" );
            }
        }
    #/
    
    if ( isweapon( weapon ) && isnullweapon( weapon ) )
    {
        assertmsg( "<dev string:xdb>" );
        return;
    }
    
    var_f3cb828363807f0e = 0;
    
    if ( isweapon( weapon ) )
    {
        var_f3cb828363807f0e = self gethighpriorityweapon() == weapon;
    }
    else
    {
        assert( isstring( weapon ) );
        var_f3cb828363807f0e = getcompleteweaponname( self gethighpriorityweapon() ) == weapon;
    }
    
    if ( var_f3cb828363807f0e )
    {
        weaponstring = weapon;
        
        if ( !isstring( weaponstring ) && isweapon( weapon ) )
        {
            weaponstring = getcompleteweaponname( weapon );
        }
        
        assertmsg( "<dev string:x102>" + weaponstring + "<dev string:x149>" );
        self clearhighpriorityweapon( weapon );
    }
    
    self takeweapon( weapon );
    callback::callback( #"hash_a53dbb54312833e9" );
}

// Namespace inventory_utility
// Params 1
// Checksum 0x8ce6607b, Offset: 0x4e2
// Size: 0x82
function takeweaponwhensafe( weapon )
{
    self endon( "death" );
    self endon( "disconnect" );
    
    while ( true )
    {
        var_342a2e2a90f812bd = 0;
        
        if ( !iscurrentweapon( weapon ) )
        {
            meleeoverrideweapon = self getweaponmeleeslot();
            
            if ( !isnullweapon( meleeoverrideweapon ) && self.currentweapon == meleeoverrideweapon )
            {
                var_342a2e2a90f812bd = 0;
            }
            else
            {
                var_342a2e2a90f812bd = 1;
            }
        }
        
        if ( var_342a2e2a90f812bd )
        {
            break;
        }
        
        waitframe();
    }
    
    _takeweapon( weapon );
}

// Namespace inventory_utility
// Params 0
// Checksum 0xeb141c40, Offset: 0x56c
// Size: 0x27
function getcurrentmonitoredweaponswitchweapon()
{
    validatehighpriorityflag();
    currenthighpriorityweapon = self gethighpriorityweapon();
    
    if ( isnullweapon( currenthighpriorityweapon ) )
    {
        return undefined;
    }
    
    return currenthighpriorityweapon;
}

// Namespace inventory_utility
// Params 0
// Checksum 0x2b28c7d6, Offset: 0x59c
// Size: 0x9, Type: bool
function isanymonitoredweaponswitchinprogress()
{
    return isdefined( getcurrentmonitoredweaponswitchweapon() );
}

// Namespace inventory_utility
// Params 1
// Checksum 0xf7329079, Offset: 0x5ae
// Size: 0x41, Type: bool
function isswitchingtoweaponwithmonitoring( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    currentswitchweapon = getcurrentmonitoredweaponswitchweapon();
    return currentswitchweapon == weaponobj && !iscurrentweapon( weaponobj );
}

// Namespace inventory_utility
// Params 2
// Checksum 0xa8790a25, Offset: 0x5f8
// Size: 0x14c, Type: bool
function candomonitoredswitchtoweapon( weapon, var_e90b0e794aa74425 )
{
    if ( !self hasweapon( weapon ) )
    {
        return false;
    }
    
    if ( !val::get( "weapon" ) )
    {
        return false;
    }
    
    if ( !var_e90b0e794aa74425 && !val::get( "weapon_switch" ) && !val::get( "script_weapon_switch" ) )
    {
        return false;
    }
    
    if ( self isviewmodelanimplaying() )
    {
        return false;
    }
    
    currenthighpriorityweapon = getcurrentmonitoredweaponswitchweapon();
    
    if ( isdefined( currenthighpriorityweapon ) )
    {
        weaponbasename = getweaponbasename( weapon );
        newweaponhaspriority = 0;
        
        if ( weaponbasename == "briefcase_bomb_mp" || weaponbasename == "briefcase_bomb_defuse_mp" || weaponbasename == "briefcase_silent_mp" || weaponbasename == "briefcase_defuse_silent_mp" || weaponbasename == "counter_attack_bomb_mp" || weaponbasename == "counter_attack_bomb_defuse_mp" || weaponbasename == "counter_attack_bomb_silent_mp" || weaponbasename == "counter_attack_bomb_defuse_silent_mp" || weaponbasename == "briefcase_bomb_mp_nuke" || weaponbasename == "iw9_cyberemp_mp" || weaponbasename == "iw7_tdefball_mp" )
        {
            newweaponhaspriority = 1;
        }
        else if ( weaponinventorytype( currenthighpriorityweapon ) == "primary" )
        {
            newweaponhaspriority = 1;
        }
        
        if ( !newweaponhaspriority )
        {
            return false;
        }
    }
    
    if ( iscurrentweapon( weapon ) )
    {
        return false;
    }
    
    return true;
}

// Namespace inventory_utility
// Params 1
// Checksum 0x569b35f8, Offset: 0x74d
// Size: 0x4f
function abortmonitoredweaponswitch( weapon )
{
    /#
        debugweaponchangeprint( "<dev string:x16a>", weapon );
    #/
    
    assert( !iscurrentweapon( weapon ), "<dev string:x177>" );
    
    if ( self gethighpriorityweapon() == weapon )
    {
        self clearhighpriorityweapon( weapon );
    }
    
    _takeweapon( weapon );
}

// Namespace inventory_utility
// Params 4
// Checksum 0xd02e58f1, Offset: 0x7a5
// Size: 0x15f
function domonitoredweaponswitch( weapon, switchimmediate, var_e90b0e794aa74425, canceloffhand )
{
    self endon( "disconnect" );
    self endon( "death" );
    
    if ( !isdefined( weapon ) )
    {
        return 0;
    }
    
    /#
        debugweaponchangeprint( "<dev string:x1c4>", weapon );
    #/
    
    if ( !candomonitoredswitchtoweapon( weapon, var_e90b0e794aa74425 ) )
    {
        /#
            debugweaponchangeprint( "<dev string:x1eb>", weapon );
        #/
        
        return 0;
    }
    
    if ( isanymonitoredweaponswitchinprogress() )
    {
        self clearhighpriorityweapon( getcurrentmonitoredweaponswitchweapon() );
    }
    
    self sethighpriorityweapon( weapon );
    
    if ( switchimmediate )
    {
        _switchtoweaponimmediate( weapon );
    }
    
    while ( true )
    {
        if ( iscurrentweapon( weapon ) )
        {
            validatehighpriorityflag();
            
            /#
                debugweaponchangeprint( "<dev string:x219>", weapon );
            #/
            
            return 1;
        }
        
        if ( !self ishighpriorityweapon( weapon ) || !self hasweapon( weapon ) )
        {
            /#
                debugweaponchangeprint( "<dev string:x242>", weapon );
            #/
            
            return 0;
        }
        
        if ( !val::get( "weapon" ) || !var_e90b0e794aa74425 && !val::get( "weapon_switch" ) && !val::get( "script_weapon_switch" ) )
        {
            /#
                debugweaponchangeprint( "<dev string:x287>", weapon );
            #/
            
            self clearhighpriorityweapon( weapon );
            return 0;
        }
        
        if ( canceloffhand && !isnullweapon( self getheldoffhand() ) )
        {
            self canceloffhands();
        }
        
        waitframe();
    }
}

// Namespace inventory_utility
// Params 0
// Checksum 0xb44d5e8f, Offset: 0x90c
// Size: 0x7
function function_17bee3f2e45888ee()
{
    return "iw9_gunless_mp";
}

// Namespace inventory_utility
// Params 0
// Checksum 0x97f96dd7, Offset: 0x91c
// Size: 0x7
function function_772803634a9c0f0a()
{
    return "iw9_gunless_quickdrop_mp";
}

// Namespace inventory_utility
// Params 1
// Checksum 0xef38ef91, Offset: 0x92c
// Size: 0x1a
function givegunlessweapon( switchimmediate )
{
    return function_9ecb1e4c6649d1c2( switchimmediate, function_17bee3f2e45888ee() );
}

// Namespace inventory_utility
// Params 1
// Checksum 0xd2ac5b99, Offset: 0x94f
// Size: 0x1a
function function_c13571020bd38158( switchimmediate )
{
    return function_9ecb1e4c6649d1c2( switchimmediate, function_772803634a9c0f0a() );
}

// Namespace inventory_utility
// Params 2
// Checksum 0x5a317da6, Offset: 0x972
// Size: 0xf0
function function_9ecb1e4c6649d1c2( switchimmediate, weaponname )
{
    self endon( "death_or_disconnect" );
    
    if ( !isdefined( weaponname ) )
    {
        return;
    }
    
    if ( isdefined( self.gunnlessweapon ) )
    {
        return;
    }
    
    gunless = makeweapon( weaponname );
    _giveweapon( gunless, undefined, undefined, 1 );
    self.gunnlessweapon = gunless;
    val::reset_all( "gunless" );
    val::set( "gunless", "script_weapon_switch", 1 );
    println( self.name + "<dev string:x2bf>" );
    
    if ( !isdefined( switchimmediate ) )
    {
        switchimmediate = 0;
    }
    
    success = domonitoredweaponswitch( gunless, switchimmediate );
    
    if ( !success )
    {
        _takeweapon( gunless );
        forcevalidweapon();
    }
    
    val::reset( "gunless", "script_weapon_switch" );
    println( self.name + "<dev string:x2ea>" );
    return success;
}

// Namespace inventory_utility
// Params 1
// Checksum 0x355c7a02, Offset: 0xa6b
// Size: 0x165
function takegunlessweapon( restoredweapon )
{
    self endon( "death_or_disconnect" );
    
    if ( !isdefined( self.gunnlessweapon ) )
    {
        return;
    }
    
    if ( !self hasweapon( self.gunnlessweapon ) )
    {
        self.gunnlessweapon = undefined;
        return;
    }
    
    if ( utility::ent_flag_exist( "swapLoadout_pending" ) && utility::ent_flag( "swapLoadout_pending" ) )
    {
        utility::ent_flag_wait( "swapLoadout_complete" );
    }
    
    val::reset_all( "gunless" );
    val::set( "gunless", "script_weapon_switch", 1 );
    println( self.name + "<dev string:x315>" );
    
    while ( isdefined( self.gunnlessweapon ) && self hasweapon( self.gunnlessweapon ) )
    {
        if ( !iscurrentweapon( self.gunnlessweapon ) )
        {
            abortmonitoredweaponswitch( self.gunnlessweapon );
        }
        else
        {
            _takeweapon( self.gunnlessweapon );
            
            if ( isweapon( restoredweapon ) )
            {
                domonitoredweaponswitch( restoredweapon );
                
                if ( self getcurrentweapon().basename == "none" )
                {
                    forcevalidweapon();
                }
            }
            else
            {
                forcevalidweapon();
            }
        }
        
        waitframe();
    }
    
    self.gunnlessweapon = undefined;
    val::reset( "gunless", "script_weapon_switch" );
    println( self.name + "<dev string:x340>" );
}

// Namespace inventory_utility
// Params 0
// Checksum 0xf2867b51, Offset: 0xbd8
// Size: 0x25
function validatehighpriorityflag()
{
    currentweapon = self getcurrentweapon();
    
    if ( self ishighpriorityweapon( currentweapon ) )
    {
        self clearhighpriorityweapon( currentweapon );
    }
}

// Namespace inventory_utility
// Params 2
// Checksum 0xd9236c22, Offset: 0xc05
// Size: 0x13b, Type: bool
function getridofweapon( weapon, switchimmediate )
{
    self endon( "death" );
    self endon( "disconnect" );
    
    if ( !isdefined( self ) )
    {
        return false;
    }
    
    if ( !self hasweapon( weapon ) )
    {
        return false;
    }
    
    if ( !iscurrentweapon( weapon ) )
    {
        _takeweapon( weapon );
        return true;
    }
    
    while ( isanymonitoredweaponswitchinprogress() )
    {
        waitframe();
    }
    
    if ( !iscurrentweapon( weapon ) )
    {
        _takeweapon( weapon );
        return true;
    }
    
    lastvalidweapon = self.lastdroppableweaponobj;
    
    if ( utility::issharedfuncdefined( #"weapons", #"isCurrentTertiaryWeapon" ) && [[ utility::getsharedfunc( #"weapons", #"isCurrentTertiaryWeapon" ) ]]( self, self.lastnormalweaponobj ) )
    {
        lastvalidweapon = self.lastnormalweaponobj;
    }
    
    switchresult = domonitoredweaponswitch( lastvalidweapon, switchimmediate );
    
    if ( isai( self ) || function_f1a5d89558b6fbdd( self ) )
    {
        self switchtoweaponimmediate( nullweapon() );
        switchresult = 1;
    }
    
    _takeweapon( weapon );
    self notify( "bomb_allow_offhands" );
    
    if ( !switchresult && !isdefined( self.vehicle ) )
    {
        forcevalidweapon();
    }
    
    return true;
}

// Namespace inventory_utility
// Params 1
// Checksum 0x3f09adda, Offset: 0xd49
// Size: 0x242
function forcevalidweapon( bestweaponobj )
{
    self endon( "death" );
    self endon( "disconnect" );
    
    while ( isnullweapon( self getcurrentweapon() ) )
    {
        if ( self isswitchingweapon() || isanymonitoredweaponswitchinprogress() )
        {
            waitframe();
            continue;
        }
        
        var_fdce5d6df27760eb = bestweaponobj;
        
        if ( self.isjuggernaut )
        {
            var_a3742a26443de44b = "iw9_minigunksjugg_mp";
            
            if ( utility::issharedfuncdefined( #"juggernaut", #"getMinigunWeapon" ) )
            {
                var_a3742a26443de44b = self [[ utility::getsharedfunc( #"juggernaut", #"getMinigunWeapon" ) ]]();
            }
            
            if ( utility::issharedfuncdefined( #"juggernaut", #"canUseWeaponPickups" ) )
            {
                canUseWeaponPickups = self [[ utility::getsharedfunc( #"juggernaut", #"canUseWeaponPickups" ) ]]();
                
                if ( canUseWeaponPickups )
                {
                    if ( isdefined( self.lastdroppableweaponobj ) && self hasweapon( self.lastdroppableweaponobj ) )
                    {
                        var_a3742a26443de44b = self.lastdroppableweaponobj;
                    }
                    else
                    {
                        currentprimaries = getcurrentprimaryweaponsminusalt();
                        
                        if ( currentprimaries.size > 0 )
                        {
                            var_a3742a26443de44b = currentprimaries[ 0 ];
                        }
                    }
                }
            }
            
            if ( isstring( var_a3742a26443de44b ) )
            {
                var_fdce5d6df27760eb = makeweapon( var_a3742a26443de44b );
            }
            else
            {
                var_fdce5d6df27760eb = var_a3742a26443de44b;
            }
        }
        else
        {
            currentprimaries = getcurrentprimaryweaponsminusalt();
            
            if ( !isdefined( var_fdce5d6df27760eb ) || !self hasweapon( var_fdce5d6df27760eb ) )
            {
                if ( ( !isdefined( self.lastdroppableweaponobj ) || self.lastdroppableweaponobj.basename == "none" ) && !self hasweapon( level.defaultfist ) )
                {
                    assertmsg( "<dev string:x36b>" );
                    break;
                }
                
                if ( self hasweapon( self.lastdroppableweaponobj ) )
                {
                    var_fdce5d6df27760eb = self.lastdroppableweaponobj;
                }
                else if ( currentprimaries.size > 0 )
                {
                    var_fdce5d6df27760eb = currentprimaries[ 0 ];
                }
            }
            
            if ( self hasweapon( level.defaultfist ) )
            {
                if ( currentprimaries.size == 1 )
                {
                    var_fdce5d6df27760eb = currentprimaries[ 0 ];
                }
                else if ( currentprimaries.size == 2 && self hasweapon( level.var_69de91814bc11b10 ) )
                {
                    if ( weapon::isfistweapon( currentprimaries[ 0 ] ) )
                    {
                        var_fdce5d6df27760eb = currentprimaries[ 0 ];
                    }
                    else
                    {
                        var_fdce5d6df27760eb = currentprimaries[ 1 ];
                    }
                }
            }
        }
        
        domonitoredweaponswitch( var_fdce5d6df27760eb );
        waitframe();
    }
}

// Namespace inventory_utility
// Params 1
// Checksum 0x46c7f5db, Offset: 0xf93
// Size: 0x2d
function iscurrentweapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    return issameweapon( self getcurrentweapon(), weaponobj, 1 );
}

// Namespace inventory_utility
// Params 0
// Checksum 0x389ff0a1, Offset: 0xfc9
// Size: 0x9d
function getcurrentprimaryweaponsminusalt()
{
    primaryweapons = [];
    currentweapons = self getweaponslistprimaries();
    
    foreach ( weapon in currentweapons )
    {
        if ( !weapon.isalternate )
        {
            primaryweapons[ primaryweapons.size ] = weapon;
        }
    }
    
    return primaryweapons;
}

/#

    // Namespace inventory_utility
    // Params 2
    // Checksum 0x182193da, Offset: 0x106f
    // Size: 0x60, Type: dev
    function debugweaponchangeprint( message, weapon )
    {
        weaponstring = undefined;
        
        if ( isstring( weapon ) )
        {
            weaponstring = weapon;
        }
        else
        {
            weaponstring = getcompleteweaponname( weapon );
        }
        
        if ( getdvarint( @"hash_e6a5211d6811a3e", 0 ) != 0 )
        {
            println( message + "<dev string:x3d0>" + weaponstring );
        }
    }

#/
