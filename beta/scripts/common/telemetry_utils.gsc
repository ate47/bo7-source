#namespace telemetry_utils;

// Namespace telemetry_utils
// Params 2
// Checksum 0xb8762732, Offset: 0x197
// Size: 0x68
function function_5995f9c2ef729dbd( callback, func )
{
    if ( !isdefined( level.telemetry_callbacks ) )
    {
        level.telemetry_callbacks = [];
    }
    
    if ( !isdefined( level.telemetry_callbacks[ callback ] ) )
    {
        level.telemetry_callbacks[ callback ] = [];
    }
    
    level.telemetry_callbacks[ callback ][ level.telemetry_callbacks[ callback ].size ] = func;
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x90ddd7da, Offset: 0x207
// Size: 0x19, Type: bool
function function_7ffb9ee91a85ee0d( callback )
{
    return isdefined( level.telemetry_callbacks[ callback ] );
}

// Namespace telemetry_utils
// Params 2
// Checksum 0xe2da9b75, Offset: 0x229
// Size: 0x10f
function function_af2d366f9522f76f( callback, data )
{
    callbacks = level.telemetry_callbacks[ callback ];
    
    if ( !isdefined( callbacks ) )
    {
        return;
    }
    
    if ( isdefined( data ) )
    {
        foreach ( callbackfunc in callbacks )
        {
            thread [[ callbackfunc ]]( data );
        }
        
        return;
    }
    
    foreach ( callbackfunc in callbacks )
    {
        thread [[ callbackfunc ]]();
    }
}

// Namespace telemetry_utils
// Params 2
// Checksum 0x7ed65eee, Offset: 0x340
// Size: 0x69
function function_bce6584b90db3f0d( eventname, position )
{
    assert( isplayer( self ) );
    var_7062606e10c1ad6e = { #position:position ?? self.origin, #eventname:eventname, #player:self };
    function_af2d366f9522f76f( "callback_on_game_event", var_7062606e10c1ad6e );
}

// Namespace telemetry_utils
// Params 2
// Checksum 0x301c0438, Offset: 0x3b1
// Size: 0xc1
function function_8fab541f1654a751( ability, damage )
{
    if ( !isplayer( self ) || !isstring( ability ) )
    {
        return;
    }
    
    self dlog_recordplayerevent( "dlog_event_ability_activated", [ "ability", ability, "damage", damage ?? 0, "time_msfrommatchstart", gettime() - ( level.starttime ?? 0 ), "playerposx", self.origin[ 0 ], "playerposy", self.origin[ 1 ], "playerposz", self.origin[ 2 ] ] );
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x4188d225, Offset: 0x47a
// Size: 0x47
function function_7f67db3f792cdc72( basetime )
{
    timefrom = basetime;
    
    if ( isdefined( level.starttimefrommatchstart ) )
    {
        timefrom -= level.starttimefrommatchstart;
        
        if ( timefrom < 0 )
        {
            timefrom = 0;
        }
    }
    else
    {
        timefrom = 0;
    }
    
    return timefrom;
}

// Namespace telemetry_utils
// Params 0
// Checksum 0xc8db1c79, Offset: 0x4ca
// Size: 0x5e
function function_cae236c583ce98fe()
{
    mountstring = self playermounttype();
    
    if ( isdefined( mountstring ) )
    {
        switch ( mountstring )
        {
            case #"hash_b882c19d3b9f4eb6":
                return "MOUNT_LEFT";
            case #"hash_c00b1399e3e96eeb":
                return "MOUNT_RIGHT";
            case #"hash_d45b94ed344be47e":
                return "MOUNT_TOP";
        }
    }
    
    return "MOUNT_NONE";
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x44901a24, Offset: 0x531
// Size: 0x40, Type: bool
function is_valid_client( client )
{
    if ( game[ "isLaunchChunk" ] )
    {
        return false;
    }
    
    if ( !isdefined( client ) )
    {
        return false;
    }
    else if ( isagent( client ) )
    {
        return false;
    }
    else if ( !isplayer( client ) )
    {
        return false;
    }
    
    return true;
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x8748e8de, Offset: 0x57a
// Size: 0x8a, Type: bool
function function_ac165ec93ebac8d5( data )
{
    if ( !isdefined( data.player ) )
    {
        return false;
    }
    
    if ( !isdefined( data.player.pers ) )
    {
        return false;
    }
    
    if ( !isdefined( data.player.pers[ "telemetry" ] ) )
    {
        return false;
    }
    
    if ( !isdefined( data.player.pers[ "telemetry" ].life ) )
    {
        return false;
    }
    
    return true;
}

// Namespace telemetry_utils
// Params 0
// Checksum 0x9a89994f, Offset: 0x60d
// Size: 0xab
function get_objective_type()
{
    objectivetype = "hub";
    
    if ( isdefined( level.active_objectives_string ) )
    {
        objectivetype = level.active_objectives_string;
    }
    else if ( isdefined( level.contentmanager ) && isdefined( level.contentmanager.activeobjective ) )
    {
        instance = level.contentmanager.activeobjective;
        location = instance.targetname;
        
        if ( isdefined( location ) )
        {
            objectivetype = location;
        }
    }
    else if ( isdefined( level.lastobjective ) )
    {
        objectivetype = level.lastobjective;
    }
    
    return objectivetype;
}

// Namespace telemetry_utils
// Params 1
// Checksum 0xa7406c48, Offset: 0x6c1
// Size: 0x32
function function_5e023df7bfb08695( client )
{
    if ( is_valid_client( client ) )
    {
        return ( client.clientid < level.maxlogclients );
    }
    
    return 0;
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x9bdd2849, Offset: 0x6fb
// Size: 0x5d, Type: bool
function function_e6eefbdfebae39bf( player )
{
    if ( is_valid_client( player ) && !isbot( player ) && getdvarint( @"hash_5e2f0f222e2d7721" ) > 0 )
    {
        var_954f21fb207ebeb6 = player function_28ce5f44a5393018();
        return ( var_954f21fb207ebeb6 >= getdvarint( @"hash_5e2f0f222e2d7721" ) * 1000 );
    }
    
    return false;
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x110ce174, Offset: 0x761
// Size: 0x57
function function_c54601d44e7b8e8a( player )
{
    if ( !function_e6eefbdfebae39bf( player ) && player.pers[ "telemetry" ].reached_match_end == 0 )
    {
        player.pers[ "telemetry" ].reached_match_end = 1;
    }
}

// Namespace telemetry_utils
// Params 1
// Checksum 0x1a569f16, Offset: 0x7c0
// Size: 0x2c
function validatetuningdata( value )
{
    if ( !isfloat( value ) )
    {
        assert( "<dev string:x24>" );
        value = -1e+06;
    }
    
    return value;
}

