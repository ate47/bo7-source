#namespace lui_game_event_aggregator;

// Namespace lui_game_event_aggregator
// Params 0
// Checksum 0x5d7d8ff7, Offset: 0x81
// Size: 0xa
function init()
{
    level thread onplayerconnect();
}

// Namespace lui_game_event_aggregator
// Params 0
// Checksum 0x4cfff0be, Offset: 0x93
// Size: 0x3a
function onplayerconnect()
{
    function_78b4de56e3c7923a();
    level notify( #"lui_game_event_aggregator_initialized" );
    
    for ( ;; )
    {
        level waittill( #"connected", player );
        player thread onplayerconnected();
    }
}

// Namespace lui_game_event_aggregator
// Params 2
// Checksum 0x33239b1a, Offset: 0xd5
// Size: 0x61
function registeronluieventcallback( callback, channel = "__all__" )
{
    function_78b4de56e3c7923a();
    
    if ( !isdefined( level.var_9398dff023585316[ channel ] ) )
    {
        level.var_9398dff023585316[ channel ] = [];
    }
    
    level.var_9398dff023585316[ channel ][ level.var_9398dff023585316[ channel ].size ] = callback;
}

// Namespace lui_game_event_aggregator
// Params 0
// Checksum 0xc54ae21b, Offset: 0x13e
// Size: 0x13f
function onplayerconnected()
{
    self endon( #"disconnect" );
    level endon( #"game_ended" );
    
    for ( ;; )
    {
        self waittill( #"luinotifyserver", channel, val );
        
        if ( isdefined( level.var_9398dff023585316[ channel ] ) )
        {
            foreach ( callback in level.var_9398dff023585316[ channel ] )
            {
                self [[ callback ]]( channel, val );
            }
        }
        
        foreach ( callback in level.var_9398dff023585316[ "__all__" ] )
        {
            self [[ callback ]]( channel, val );
        }
    }
}

// Namespace lui_game_event_aggregator
// Params 0
// Checksum 0x9de64f6b, Offset: 0x285
// Size: 0x3b
function function_78b4de56e3c7923a()
{
    if ( !isdefined( level.var_9398dff023585316 ) )
    {
        level.var_9398dff023585316 = [];
    }
    
    if ( !isdefined( level.var_9398dff023585316[ "__all__" ] ) )
    {
        level.var_9398dff023585316[ "__all__" ] = [];
    }
}

