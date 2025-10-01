#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\utility;

#namespace combat_utility;

// Namespace combat_utility
// Params 0
// Checksum 0x92725b41, Offset: 0x142
// Size: 0x2
function shootuntilshootbehaviorchange()
{
    
}

// Namespace combat_utility
// Params 0
// Checksum 0xc4704538, Offset: 0x14c
// Size: 0x2
function initgrenadethrowanims()
{
    
}

// Namespace combat_utility
// Params 0
// Checksum 0x50baa3e9, Offset: 0x156
// Size: 0xc8
function throwgrenadeatplayerasap_combat_utility()
{
    assert( utility::issp() && self isbadguy() );
    
    for ( i = 0; i < level.players.size ; i++ )
    {
        if ( level.players[ i ] function_ea1c30d42bd9c659() == 0 )
        {
            aisetgrenadetimer( level.players[ i ], "lethal", 0 );
        }
    }
    
    function_bee5df22fff6b7cc( 1 );
    
    /#
        enemies = getaiarray( "<dev string:x24>" );
        
        if ( enemies.size == 0 )
        {
            return;
        }
        
        var_bcc25f4f6641905d = 0;
        
        for ( i = 0; i < enemies.size ; i++ )
        {
            if ( enemies[ i ].grenadeammo > 0 )
            {
                return;
            }
        }
        
        println( "<dev string:x30>" );
    #/
}

/#

    // Namespace combat_utility
    // Params 1
    // Checksum 0x3721e2fc, Offset: 0x226
    // Size: 0xa5, Type: dev
    function function_6b6f2fb367e67c7( grenadetimer )
    {
        if ( grenadetimer.isplayertimer )
        {
            for ( i = 0; i < level.players.size ; i++ )
            {
                if ( level.players[ i ] == grenadetimer.player )
                {
                    break;
                }
            }
            
            return ( "<dev string:x84>" + i + 1 + "<dev string:x8f>" + grenadetimer.weapon.basename );
        }
        
        return "<dev string:x94>" + grenadetimer.weapon.basename;
    }

#/

// Namespace combat_utility
// Params 7
// Checksum 0x8e8e6c22, Offset: 0x2d3
// Size: 0x42
function trygrenadethrow( throwingat, destination, optionalanimation, armoffset, fastthrow, withbounce, throwinthread )
{
    
}

// Namespace combat_utility
// Params 0
// Checksum 0x514e2849, Offset: 0x31d
// Size: 0x93
function getgrenadedropvelocity()
{
    yaw = randomfloat( 360 );
    pitch = randomfloatrange( 30, 75 );
    amntz = sin( pitch );
    cospitch = cos( pitch );
    amntx = cos( yaw ) * cospitch;
    amnty = sin( yaw ) * cospitch;
    speed = randomfloatrange( 100, 200 );
    velocity = ( amntx, amnty, amntz ) * speed;
    return velocity;
}

// Namespace combat_utility
// Params 0
// Checksum 0xd13aca2, Offset: 0x3b9
// Size: 0x41
function dropgrenade()
{
    if ( isdefined( self.nodropgrenade ) )
    {
        return;
    }
    
    grenadeorigin = self gettagorigin( "tag_accessory_right" );
    velocity = getgrenadedropvelocity();
    self magicgrenademanual( grenadeorigin, velocity, 3 );
}

// Namespace combat_utility
// Params 1
// Checksum 0x31a6eaaa, Offset: 0x402
// Size: 0x49
function getpitchtoshootspot( spot )
{
    if ( !isdefined( spot ) )
    {
        return 0;
    }
    
    vectortoenemy = spot - self getshootatpos();
    vectortoenemy = vectornormalize( vectortoenemy );
    pitchdelta = vectortoangles( vectortoenemy )[ 0 ];
    return angleclamp180( pitchdelta );
}

// Namespace combat_utility
// Params 0
// Checksum 0xb56840a6, Offset: 0x454
// Size: 0x69
function watchreloading()
{
    self.isreloading = 0;
    self.lastreloadstarttime = -1;
    
    while ( true )
    {
        self waittill( "reload_start" );
        self.isreloading = 1;
        self.lastreloadstarttime = gettime();
        
        if ( isdefined( level.battlechatter ) )
        {
            function_98ae1f41148cc661( self, undefined, "reload" );
        }
        
        waittillreloadfinished();
        self.isreloading = 0;
    }
}

// Namespace combat_utility
// Params 0
// Checksum 0xbb2d024b, Offset: 0x4c5
// Size: 0x67
function waittillreloadfinished()
{
    thread timednotify( 4, "reloadtimeout" );
    self endon( "reloadtimeout" );
    self endon( "weapon_taken" );
    
    while ( true )
    {
        self waittill( "reload" );
        weap = self getcurrentweapon();
        
        if ( isnullweapon( weap ) )
        {
            break;
        }
        
        if ( self getcurrentweaponclipammo() >= weaponclipsize( weap ) )
        {
            break;
        }
    }
    
    self notify( "reloadtimeout" );
}

// Namespace combat_utility
// Params 2
// Checksum 0x58cdfe76, Offset: 0x534
// Size: 0x22
function timednotify( time, msg )
{
    self endon( msg );
    wait time;
    self notify( msg );
}

// Namespace combat_utility
// Params 0
// Checksum 0x79011bea, Offset: 0x55e
// Size: 0x183
function monitorflash()
{
    self endon( "death" );
    
    if ( !isdefined( level.neverstopmonitoringflash ) )
    {
        self endon( "stop_monitoring_flash" );
    }
    
    while ( true )
    {
        amount_distance = undefined;
        origin = undefined;
        amount_angle = undefined;
        attacker = undefined;
        attackerteam = undefined;
        self waittill( "flashbang", origin, amount_distance, amount_angle, attacker, attackerteam, duration );
        
        if ( self.flashbangimmunity )
        {
            continue;
        }
        
        if ( isdefined( self.script_immunetoflash ) && self.script_immunetoflash != 0 )
        {
            continue;
        }
        
        if ( self.team == attackerteam )
        {
            amount_distance = 3 * ( amount_distance - 0.75 );
            
            if ( amount_distance < 0 )
            {
                continue;
            }
            
            if ( isdefined( self.teamflashbangimmunity ) )
            {
                continue;
            }
        }
        
        if ( utility::function_92f6c5dd7f8b6166( "flashbang", attackerteam ) )
        {
            continue;
        }
        
        var_4fb784d13a0390ce = 0.2;
        
        if ( amount_distance > 1 - var_4fb784d13a0390ce )
        {
            amount_distance = 1;
        }
        else
        {
            amount_distance /= 1 - var_4fb784d13a0390ce;
        }
        
        if ( !isdefined( duration ) )
        {
            duration = 4.5;
        }
        
        duration *= amount_distance;
        
        if ( duration < 0.25 )
        {
            continue;
        }
        
        if ( getdvarfloat( @"hash_737dfcd28a218a8f", 0 ) )
        {
            duration = getdvarfloat( @"hash_737dfcd28a218a8f" );
        }
        
        self.flashingteam = attackerteam;
        flashbangstart( duration );
        self notify( "doFlashBanged", origin, attacker );
    }
}

// Namespace combat_utility
// Params 1
// Checksum 0x9e1f0bb7, Offset: 0x6e9
// Size: 0xcc
function flashbangstart( duration )
{
    assert( isdefined( self ) );
    assert( isdefined( duration ) );
    
    if ( self.flashbangimmunity )
    {
        return;
    }
    
    if ( isdefined( self.syncedmeleetarget ) )
    {
        return;
    }
    
    if ( self isinscriptedstate() || asm_bb::bb_isanimscripted() )
    {
        return;
    }
    
    if ( !self ispainallowed() )
    {
        return;
    }
    
    newflashendtime = gettime() + int( duration * 1000 );
    
    if ( isdefined( self.flashendtime ) )
    {
        self.flashendtime = int( max( self.flashendtime, newflashendtime ) );
    }
    else
    {
        self.flashendtime = newflashendtime;
        
        if ( isdefined( self.asm ) )
        {
            asm::asm_setstate( "pain_flashed_transition" );
        }
    }
    
    self notify( "flashed" );
}

// Namespace combat_utility
// Params 0
// Checksum 0x2143524f, Offset: 0x7bd
// Size: 0x7
function fasteranimspeed()
{
    return 1.5;
}

/#

    // Namespace combat_utility
    // Params 0
    // Checksum 0x7f602999, Offset: 0x7cd
    // Size: 0x1d6, Type: dev
    function showgrenadetimers()
    {
        setdvarifuninitialized( @"hash_b4fd9ea4f6486d24", "<dev string:x9b>" );
        huds = undefined;
        playerhuds = undefined;
        
        while ( true )
        {
            if ( getdvarint( @"hash_b4fd9ea4f6486d24" ) == 0 )
            {
                function_90bf7070c1f68ccf( huds );
                function_90bf7070c1f68ccf( playerhuds );
                huds = undefined;
                playerhuds = undefined;
                wait 0.2;
                continue;
            }
            
            if ( !isdefined( huds ) )
            {
                [ huds, playerhuds ] = function_71fa487faf272381();
            }
            
            foreach ( key, hud in huds )
            {
                hud.value = anim.meleechargetimers[ key ] - gettime();
                
                if ( hud.value < 0 )
                {
                    continue;
                }
                
                hud setvalue( hud.value );
            }
            
            foreach ( key, hud in playerhuds )
            {
                hud.value = anim.meleechargeplayertimers[ key ] - gettime();
                
                if ( hud.value < 0 )
                {
                    continue;
                }
                
                hud setvalue( hud.value );
            }
            
            wait 0.05;
        }
    }

    // Namespace combat_utility
    // Params 0
    // Checksum 0x57565ac8, Offset: 0x9ab
    // Size: 0x1cd, Type: dev
    function function_71fa487faf272381()
    {
        huds = [];
        count = 0;
        
        foreach ( key, item in anim.meleechargetimers )
        {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<dev string:xa0>" + key + "<dev string:xaf>";
            hud setvalue( 0 );
            hud.value = 0;
            huds[ key ] = hud;
            count++;
        }
        
        count++;
        playerhuds = [];
        
        foreach ( key, item in anim.meleechargeplayertimers )
        {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<dev string:xb5>" + key + "<dev string:xaf>";
            hud setvalue( 0 );
            hud.value = 0;
            playerhuds[ key ] = hud;
            count++;
        }
        
        return [ huds, playerhuds ];
    }

    // Namespace combat_utility
    // Params 1
    // Checksum 0xad24225a, Offset: 0xb80
    // Size: 0x87, Type: dev
    function function_90bf7070c1f68ccf( huds )
    {
        if ( !isdefined( huds ) )
        {
            return;
        }
        
        foreach ( hud in huds )
        {
            hud destroy();
        }
    }

#/
