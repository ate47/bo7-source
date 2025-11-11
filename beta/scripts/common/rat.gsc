#namespace rat;

// Namespace rat
// Params 0
// Checksum 0x9e3dd41b, Offset: 0x22a
// Size: 0x169
function init()
{
    if ( isdefined( level.var_855c138311a366fb ) )
    {
        return;
    }
    
    level.var_855c138311a366fb = [];
    level.var_ade95642d19836cd = [];
    ratregisterfunction( "RatGetPlayerPosition", &ratgetplayerposition, "vector3" );
    ratregisterfunction( "RatGetPlayerAngles", &ratgetplayerangles, "vector3" );
    ratregisterfunction( "RatGetPlayerIsSwitchingWeapon", &ratgetplayerisswitchingweapon, "bool" );
    ratregisterfunction( "RatGetPlayerIsReloading", &ratgetplayerisreloading, "bool" );
    ratregisterfunction( "RatGetPlayerIsMeleeing", &ratgetplayerismeleeing, "bool" );
    ratregisterfunction( "RatGetPlayerADS", &ratgetplayerads, "float" );
    ratregisterfunction( "RatGetPlayerStance", &ratgetplayerstance, "string" );
    ratregisterfunction( "RatGetPlayerHealth", &ratgetplayerhealth, "int64_t" );
    ratregisterfunction( "RatSetPlayerHealth", &ratsetplayerhealth );
    ratregisterfunction( "RatDoDamage", &ratdodamage, "bool" );
    ratregisterfunction( "RatGetClipAmmoCount", &ratgetclipammocount, "int64_t" );
    ratregisterfunction( "RatGetTotalAmmoCount", &ratgettotalammocount, "int64_t" );
    ratregisterfunction( "RatGetCompleteWeaponName", &ratgetcompleteweaponname, "string" );
    ratregisterfunction( "RatGetPlayerKills", &ratgetplayerkills, "int64_t" );
    ratregisterfunction( "RatGetPlayerDeaths", &ratgetplayerdeaths, "int64_t" );
}

// Namespace rat
// Params 3
// Checksum 0xc1720ad6, Offset: 0x39b
// Size: 0x4c
function ratregisterfunction( function_name, function_ref, return_type )
{
    key = tolower( function_name );
    level.var_855c138311a366fb[ key ] = function_ref;
    level.var_ade95642d19836cd[ key ] = return_type;
}

// Namespace rat
// Params 1
// Checksum 0xced467bd, Offset: 0x3ef
// Size: 0x47
function function_5dcc3c9b5e08f7d5( function_name )
{
    init();
    key = tolower( function_name );
    
    if ( isdefined( level.var_ade95642d19836cd[ key ] ) )
    {
        return level.var_ade95642d19836cd[ key ];
    }
    
    return "";
}

// Namespace rat
// Params 1
// Checksum 0xa0711c01, Offset: 0x43f
// Size: 0x6b
function function_23d093e60b946bcc( params )
{
    assert( isdefined( params._cmd ) );
    key = tolower( params._cmd );
    assert( isdefined( level.var_855c138311a366fb[ key ] ) );
    func = level.var_855c138311a366fb[ key ];
    return [[ func ]]( params );
}

// Namespace rat
// Params 1
// Checksum 0x879be5b0, Offset: 0x4b3
// Size: 0xe5
function getplayer( params )
{
    if ( isdefined( params.xuid ) )
    {
        xuid = int( params.xuid );
        players = getentarray( "player", #classname );
        
        for ( index = 0; index < players.size ; index++ )
        {
            player = players[ index ];
            
            if ( !isdefined( player.bot ) )
            {
                params.xuid = int( player getxuid() );
                
                if ( xuid == params.xuid )
                {
                    return player;
                }
            }
        }
    }
    
    if ( !( isdefined( level.players ) && isdefined( level.players[ 0 ] ) ) )
    {
        return level.player;
    }
    
    return level.players[ 0 ];
}

// Namespace rat
// Params 1
// Checksum 0x3217e220, Offset: 0x5a1
// Size: 0x39
function ratgetplayerposition( params )
{
    player = getplayer( params );
    return player.origin + ( 0, 0, 60 );
}

// Namespace rat
// Params 1
// Checksum 0x41a523fc, Offset: 0x5e3
// Size: 0x4c
function ratgetplayerangles( params )
{
    player = getplayer( params );
    playerangles = player getplayerangles();
    return ( ( playerangles[ 0 ] + 360 ) % 360, ( playerangles[ 1 ] + 360 ) % 360, playerangles[ 2 ] );
}

// Namespace rat
// Params 1
// Checksum 0xb34f5113, Offset: 0x638
// Size: 0x26
function ratgetplayerisswitchingweapon( params )
{
    player = getplayer( params );
    return player isswitchingweapon();
}

// Namespace rat
// Params 1
// Checksum 0xe18d9cc0, Offset: 0x667
// Size: 0x26
function ratgetplayerisreloading( params )
{
    player = getplayer( params );
    return player isreloading();
}

// Namespace rat
// Params 1
// Checksum 0xab558649, Offset: 0x696
// Size: 0x26
function ratgetplayerismeleeing( params )
{
    player = getplayer( params );
    return player ismeleeing();
}

// Namespace rat
// Params 1
// Checksum 0x2bf14f84, Offset: 0x6c5
// Size: 0x26
function ratgetplayerads( params )
{
    player = getplayer( params );
    return player playerads();
}

// Namespace rat
// Params 1
// Checksum 0xa18a96cc, Offset: 0x6f4
// Size: 0x26
function ratgetplayerstance( params )
{
    player = getplayer( params );
    return player getstance();
}

// Namespace rat
// Params 1
// Checksum 0xedadf604, Offset: 0x723
// Size: 0x2b
function ratgetplayerhealth( params )
{
    player = getplayer( params );
    return player.health;
}

// Namespace rat
// Params 1
// Checksum 0x93fdfca0, Offset: 0x757
// Size: 0x4e
function ratsetplayerhealth( params )
{
    amount = intvalue( params.amount, 1 );
    player = getplayer( params );
    player.health = amount;
}

// Namespace rat
// Params 1
// Checksum 0x85c2b410, Offset: 0x7ad
// Size: 0xcf
function ratdodamage( params )
{
    amount = floatvalue( params.amount, 1 );
    force_damage = boolvalue( params.force_damage, 0 );
    player = getplayer( params );
    
    if ( force_damage )
    {
        var_8a6e95df9229044b = getdvarint( @"hash_45dd70c0ac1afda2" );
        setdvar( @"hash_45dd70c0ac1afda2", 1 );
        success = player dodamage( amount, player.origin );
        setdvar( @"hash_45dd70c0ac1afda2", var_8a6e95df9229044b );
    }
    else
    {
        success = player dodamage( amount, player.origin, player );
    }
    
    return success;
}

// Namespace rat
// Params 1
// Checksum 0x5562bb9, Offset: 0x885
// Size: 0x26
function ratgetclipammocount( params )
{
    player = getplayer( params );
    return player getcurrentweaponclipammo();
}

// Namespace rat
// Params 1
// Checksum 0x6520f4a6, Offset: 0x8b4
// Size: 0x37
function ratgettotalammocount( params )
{
    player = getplayer( params );
    currentweapon = player getcurrentweapon();
    return player getammocount( currentweapon );
}

// Namespace rat
// Params 1
// Checksum 0x8511215a, Offset: 0x8f4
// Size: 0x42
function ratgetcompleteweaponname( params )
{
    player = getplayer( params );
    currentweapon = player getcurrentweapon();
    weaponname = getcompleteweaponname( currentweapon );
    return weaponname;
}

// Namespace rat
// Params 1
// Checksum 0xf8e28c06, Offset: 0x93f
// Size: 0x2b
function ratgetplayerkills( params )
{
    player = getplayer( params );
    return player.kills;
}

// Namespace rat
// Params 1
// Checksum 0xe4485360, Offset: 0x973
// Size: 0x2b
function ratgetplayerdeaths( params )
{
    player = getplayer( params );
    return player.deaths;
}

// Namespace rat
// Params 2
// Checksum 0xfeedb090, Offset: 0x9a7
// Size: 0x25
function intvalue( param, default_val )
{
    if ( !isdefined( param ) )
    {
        return default_val;
    }
    
    return int( param );
}

// Namespace rat
// Params 2
// Checksum 0x98e7196f, Offset: 0x9d5
// Size: 0x25
function floatvalue( param, default_val )
{
    if ( !isdefined( param ) )
    {
        return default_val;
    }
    
    return float( param );
}

// Namespace rat
// Params 2
// Checksum 0x4ddc6fbf, Offset: 0xa03
// Size: 0x4c
function boolvalue( param, default_val )
{
    if ( !isdefined( param ) )
    {
        return default_val;
    }
    
    param_lower = tolower( param );
    
    if ( param_lower == "false" || param_lower == "0" )
    {
        return 0;
    }
    
    return 1;
}

