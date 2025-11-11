#using scripts\common\callbacks;
#using scripts\common\damage_tuning;
#using scripts\common\telemetry_utils;
#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace callbacksetup;

// Namespace callbacksetup
// Params 0
// Checksum 0xf64f7836, Offset: 0x153
// Size: 0x41
function codecallback_startgametype()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515" ) == 1 )
    {
        level waittill( "eternity" );
    }
    
    if ( !level.gametypestarted )
    {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

// Namespace callbacksetup
// Params 0
// Checksum 0x6259e85f, Offset: 0x19c
// Size: 0x3e
function codecallback_playeractive()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515" ) == 1 )
    {
        level waittill( "eternity" );
    }
    
    self endon( "disconnect" );
    
    if ( isdefined( level.callbackplayeractive ) )
    {
        [[ level.callbackplayeractive ]]();
    }
}

// Namespace callbacksetup
// Params 0
// Checksum 0x55f18a29, Offset: 0x1e2
// Size: 0x4f
function codecallback_playerconnect()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515" ) == 1 )
    {
        level waittill( "eternity" );
    }
    
    self endon( "disconnect" );
    function_9d9ee863596cdc91();
    [[ level.callbackplayerconnect ]]();
    callback::callback( #"player_connect" );
    function_b71f4e11fde6c146();
}

// Namespace callbacksetup
// Params 0, eflags: 0x4
// Checksum 0x83d5d570, Offset: 0x239
// Size: 0xf6
function private function_9d9ee863596cdc91()
{
    /#
        var_30060f0d9bbf3770 = level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] ?? #"hash_ba5f6be5f6406dfa";
        
        switch ( var_30060f0d9bbf3770 )
        {
            case #"hash_ba5f6be5f6406dfa":
            case #"disconnected":
                break;
            case #"connecting":
                assertmsg( "<dev string:x24>" );
                break;
            case #"connected":
                assertmsg( "<dev string:x57>" );
                break;
            case #"disconnecting":
                assertmsg( "<dev string:xa3>" );
                break;
            default:
                assertmsg( "<dev string:xe2>" );
                break;
        }
        
        level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] = #"connecting";
    #/
}

// Namespace callbacksetup
// Params 0, eflags: 0x4
// Checksum 0x7913468f, Offset: 0x337
// Size: 0x2c
function private function_b71f4e11fde6c146()
{
    /#
        level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] = #"connected";
    #/
}

// Namespace callbacksetup
// Params 1
// Checksum 0xdedaf6c0, Offset: 0x36b
// Size: 0xc7
function codecallback_playerdisconnect( reason )
{
    self notify( "disconnect" );
    self notify( "death_or_disconnect" );
    self.isdisconnecting = 1;
    function_f51414240894150d();
    var_46d8c510a04d7126 = self function_c9980b59cc6aa434();
    
    if ( var_46d8c510a04d7126 )
    {
        isplayerreloading = self isreloading();
        
        if ( isplayerreloading )
        {
            telemetrydata = spawnstruct();
            telemetrydata.player = self;
            telemetrydata.reloadcanceltime = getsystemtimeinmicroseconds();
            telemetrydata.cancelreason = "DISCONNECT";
            telemetry_utils::function_af2d366f9522f76f( "callback_on_reload_cancel", telemetrydata );
        }
    }
    
    [[ level.callbackplayerdisconnect ]]( reason );
    callback::callback( #"player_disconnect" );
    function_ac6878cfb1e39cb0();
}

// Namespace callbacksetup
// Params 0, eflags: 0x4
// Checksum 0x14a8f61a, Offset: 0x43a
// Size: 0xfd
function private function_f51414240894150d()
{
    /#
        var_30060f0d9bbf3770 = level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] ?? #"unknown";
        
        switch ( var_30060f0d9bbf3770 )
        {
            case #"connecting":
                break;
            case #"connected":
                break;
            case #"disconnecting":
                assertmsg( "<dev string:x118>" );
                break;
            case #"disconnected":
                assertmsg( "<dev string:x157>" );
                break;
            case #"unknown":
            default:
                if ( self )
                {
                    assertmsg( "<dev string:x195>" );
                }
                else
                {
                    assertmsg( "<dev string:x1d0>" );
                }
                
                break;
        }
        
        level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] = #"disconnecting";
    #/
}

// Namespace callbacksetup
// Params 0, eflags: 0x4
// Checksum 0x3d734198, Offset: 0x53f
// Size: 0x2c
function private function_ac6878cfb1e39cb0()
{
    /#
        level.var_e50620d524b12629[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] = #"disconnected";
    #/
}

// Namespace callbacksetup
// Params 1
// Checksum 0x47758a17, Offset: 0x573
// Size: 0x23
function function_88983266715d6fb4( objweapon )
{
    self endon( "disconnect" );
    self [[ level.var_c6a23d27f33a948c ]]( objweapon );
}

// Namespace callbacksetup
// Params 18
// Checksum 0x6fdf84ff, Offset: 0x59e
// Size: 0xf0
function codecallback_playerdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_2300d396e46c0fe7, var_cdd29ad5d1362c2, var_6e998899533df3cf, willknockdown, additionalparams )
{
    self endon( "disconnect" );
    profilestart();
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        objweapon = [[ level.weaponmapfunc ]]( objweapon, einflictor );
    }
    
    [[ level.callbackplayerdamage ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_2300d396e46c0fe7, var_cdd29ad5d1362c2, var_6e998899533df3cf, willknockdown, additionalparams );
    profilestop();
}

// Namespace callbacksetup
// Params 12
// Checksum 0xd6436155, Offset: 0x696
// Size: 0x92
function function_949f2f9945dcccf5( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, lightarmordamage, heavyarmordamage )
{
    self endon( "disconnect" );
    return [[ level.callbackplayerdamagescore ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, lightarmordamage, heavyarmordamage );
}

// Namespace callbacksetup
// Params 8
// Checksum 0x826c918f, Offset: 0x731
// Size: 0x6c
function function_da233b5b3addd485( idamage, eattacker, evictim, smeansofdeath, vpoint, lightarmordamage, objweapon, shitloc )
{
    self endon( "disconnect" );
    [[ level.callbackplayerdamageeffects ]]( idamage, undefined, eattacker, evictim, smeansofdeath, vpoint, lightarmordamage, objweapon, shitloc );
}

// Namespace callbacksetup
// Params 2
// Checksum 0x13eaa279, Offset: 0x7a5
// Size: 0x78
function codecallback_playerfinishweaponchange( objoldweapon, objnewweapon )
{
    self endon( "disconnect" );
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        [[ level.weaponmapfunc ]]( objoldweapon );
        [[ level.weaponmapfunc ]]( objnewweapon );
    }
    
    if ( isdefined( level.callbackfinishweaponchange ) )
    {
        [[ level.callbackfinishweaponchange ]]( objnewweapon, objoldweapon, objnewweapon.isalternate, objoldweapon.isalternate );
    }
}

// Namespace callbacksetup
// Params 10
// Checksum 0x5b155c78, Offset: 0x825
// Size: 0x9a
function codecallback_playerimpaled( eattacker, objweapon, vpointclient, vpoint, vdir, shitloc, spartname, var_56243ba4fafee4a5, var_ea333e2537a8fa73, var_2e6727b4a3db5100 )
{
    self endon( "disconnect" );
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        [[ level.weaponmapfunc ]]( objweapon );
    }
    
    [[ level.callbackplayerimpaled ]]( eattacker, objweapon, vpointclient, vpoint, vdir, shitloc, spartname, var_56243ba4fafee4a5, var_ea333e2537a8fa73, var_2e6727b4a3db5100 );
}

// Namespace callbacksetup
// Params 5
// Checksum 0xd105ba12, Offset: 0x8c7
// Size: 0x67
function function_2730c29ebd22f69e( eattacker, objweapon, vdir, magnitude, shitloc )
{
    self endon( "disconnect" );
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        [[ level.weaponmapfunc ]]( objweapon );
    }
    
    [[ level.var_8f62eac141f8bdb6 ]]( eattacker, objweapon, vdir, magnitude, shitloc, 0 );
}

// Namespace callbacksetup
// Params 10
// Checksum 0x6859690b, Offset: 0x936
// Size: 0x9b
function codecallback_playerkilled( einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration )
{
    self endon( "disconnect" );
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        [[ level.weaponmapfunc ]]( objweapon, einflictor );
    }
    
    [[ level.callbackplayerkilled ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration );
}

// Namespace callbacksetup
// Params 14
// Checksum 0x1a0ab6f4, Offset: 0x9d9
// Size: 0x1cf
function codecallback_vehicledamage( inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid )
{
    partname = vehicle::function_d88b357b027cbaed( partname );
    attachtagname = vehicle::function_d88b357b027cbaed( attachtagname );
    
    if ( isdefined( self.nullownerdamagefunc ) )
    {
        nulldamage = [[ self.nullownerdamagefunc ]]( attacker );
        
        if ( nulldamage )
        {
            return;
        }
    }
    
    if ( isdefined( level.weaponmapfunc ) )
    {
        objweapon = [[ level.weaponmapfunc ]]( objweapon, inflictor );
    }
    
    if ( isdefined( self.var_20cb8f4e47f3353e ) )
    {
        damage = damage_tuning::getmodifieddamageusingdamagetuning( attacker, objweapon, meansofdeath, damage, self.maxhealth, self.var_20cb8f4e47f3353e, { #iskillstreak:self.iskillstreak, #inflictor:inflictor } );
    }
    
    if ( isdefined( self.damagecallback ) )
    {
        self [[ self.damagecallback ]]( inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid );
        return;
    }
    
    if ( isdefined( level.vehicles.damagecallback ) && isdefined( level.vehicles ) && isdefined( self.vehiclename ) )
    {
        self [[ level.vehicles.damagecallback ]]( inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid );
        return;
    }
    
    self vehicle_finishdamage( inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname );
}

// Namespace callbacksetup
// Params 9
// Checksum 0xbbaf2f84, Offset: 0xbb0
// Size: 0xf5
function codecallback_playerlaststand( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration )
{
    self endon( "disconnect" );
    
    if ( isdefined( self.perks[ "specialty_pistoldeath" ] ) || isdefined( self.perks[ "specialty_survivor" ] ) || level.var_28e3415171f7169b )
    {
        if ( isdefined( level.weaponmapfunc ) )
        {
            [[ level.weaponmapfunc ]]( objweapon, einflictor );
        }
        
        return [[ level.callbackplayerlaststand ]]( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration );
    }
    
    if ( isdefined( eattacker ) && isdefined( eattacker.team ) )
    {
        level notify( "down_enemy_laststand_" + eattacker.team, eattacker, self );
    }
    
    return 0;
}

// Namespace callbacksetup
// Params 1
// Checksum 0x46d72d1, Offset: 0xcad
// Size: 0x27
function codecallback_spawnpointsprecalc( team )
{
    if ( isdefined( level.callbackspawnpointprecalc ) )
    {
        [[ level.callbackspawnpointprecalc ]]( team );
    }
}

// Namespace callbacksetup
// Params 3
// Checksum 0x4270565d, Offset: 0xcdc
// Size: 0x40
function codecallback_spawnpointscore( player, spawnpoint, team )
{
    if ( isdefined( level.callbackspawnpointscore ) )
    {
        return player [[ level.callbackspawnpointscore ]]( spawnpoint, team );
    }
    
    return 0;
}

// Namespace callbacksetup
// Params 3
// Checksum 0xa51b0b95, Offset: 0xd25
// Size: 0x77
function codecallback_spawnpointcritscore( player, spawnpoint, team )
{
    result = "primary";
    
    if ( isdefined( level.callbackspawnpointcritscore ) )
    {
        result = player [[ level.callbackspawnpointcritscore ]]( spawnpoint, team );
    }
    
    if ( result == "primary" )
    {
        return 100;
    }
    else if ( result == "secondary" )
    {
        return 50;
    }
    
    return 0;
}

// Namespace callbacksetup
// Params 0
// Checksum 0xd68357c3, Offset: 0xda5
// Size: 0x16
function codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level.callbackplayermigrated ]]();
}

// Namespace callbacksetup
// Params 0
// Checksum 0x11e54126, Offset: 0xdc3
// Size: 0xe
function codecallback_hostmigration()
{
    [[ level.callbackhostmigration ]]();
}

// Namespace callbacksetup
// Params 0
// Checksum 0x7662dba4, Offset: 0xdd9
// Size: 0x31
function function_d60785e1491a537()
{
    if ( getdvarint( @"hash_e6afce2cf5cf7515" ) == 1 )
    {
        level waittill( "eternity" );
    }
    
    self endon( "disconnect" );
    [[ level.var_4524771918fe585f ]]();
}

// Namespace callbacksetup
// Params 1
// Checksum 0xc1246644, Offset: 0xe12
// Size: 0x22
function function_4b77b0a7af0613e( reason )
{
    self notify( "disconnectmayrejoin" );
    [[ level.var_880cfcfec57ca836 ]]( reason );
}

// Namespace callbacksetup
// Params 2
// Checksum 0x67ad94a9, Offset: 0xe3c
// Size: 0x24
function function_9e329f71be2400fd( achievementid, progressdata )
{
    [[ level.var_16eab40d8f2ae445 ]]( achievementid, progressdata );
}

// Namespace callbacksetup
// Params 0
// Checksum 0x992e56fb, Offset: 0xe68
// Size: 0x43
function function_42c350929ba6a5e6()
{
    if ( !isdefined( level.autopilot ) )
    {
        return 0;
    }
    
    assert( isdefined( level.autopilot.var_c4f4308cd814658d ) );
    return [[ level.autopilot.var_c4f4308cd814658d ]]();
}

// Namespace callbacksetup
// Params 0
// Checksum 0x52267e0d, Offset: 0xeb4
// Size: 0x18
function function_1c91f56cd6f6c996()
{
    [[ level.autopilot.var_3564d4561f8e39f6 ]]();
}

// Namespace callbacksetup
// Params 0
// Checksum 0xdc22d971, Offset: 0xed4
// Size: 0x18
function function_b31ed5f182c7b8()
{
    [[ level.autopilot.var_94abf03bbaf9fe40 ]]();
}

// Namespace callbacksetup
// Params 0
// Checksum 0x42a29c26, Offset: 0xef4
// Size: 0xd5
function abortlevel()
{
    println( "<dev string:x1fd>" );
    level.callbackstartgametype = &callbackvoid;
    level.callbackplayeractive = &callbackvoid;
    level.callbackplayerconnect = &callbackvoid;
    level.callbackplayerdisconnect = &callbackvoid;
    level.callbackplayerdamage = &callbackvoid;
    level.callbackplayerimpaled = &callbackvoid;
    level.var_8f62eac141f8bdb6 = &callbackvoid;
    level.callbackplayerkilled = &callbackvoid;
    level.callbackplayerlaststand = &callbackvoid;
    level.callbackplayermigrated = &callbackvoid;
    level.callbackhostmigration = &callbackvoid;
    level.var_4524771918fe585f = &callbackvoid;
    level.var_880cfcfec57ca836 = &callbackvoid;
    level.gametype = undefined;
    exitlevel( 0 );
}

// Namespace callbacksetup
// Params 0
// Checksum 0x655330b0, Offset: 0xfd1
// Size: 0x2
function callbackvoid()
{
    
}

// Namespace callbacksetup
// Params 0
// Checksum 0xa35b98bb, Offset: 0xfdb
// Size: 0x2
function function_62798d1a2c45f983()
{
    
}

