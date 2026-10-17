#namespace connect_event_aggregator;

// Namespace connect_event_aggregator
// Params 0
// Checksum 0x773571cb, Offset: 0x76
// Size: 0xa
function init()
{
    level thread onplayerconnect();
}

// Namespace connect_event_aggregator
// Params 0
// Checksum 0x820850f2, Offset: 0x88
// Size: 0x3d
function onplayerconnect()
{
    if ( !isdefined( level.onplayerconnectcallbacks ) )
    {
        level.onplayerconnectcallbacks = [];
    }
    
    for ( ;; )
    {
        level waittill( #"connected", player );
        player thread onplayerconnected();
    }
}

// Namespace connect_event_aggregator
// Params 1
// Checksum 0x6bc8498b, Offset: 0xcd
// Size: 0x39
function registeronconnectcallback( callback )
{
    if ( !isdefined( level.onplayerconnectcallbacks ) )
    {
        level.onplayerconnectcallbacks = [];
    }
    
    level.onplayerconnectcallbacks[ level.onplayerconnectcallbacks.size ] = callback;
}

// Namespace connect_event_aggregator
// Params 0
// Checksum 0x898f694d, Offset: 0x10e
// Size: 0x84
function onplayerconnected()
{
    self endon( #"disconnect" );
    
    foreach ( callback in level.onplayerconnectcallbacks )
    {
        self [[ callback ]]();
    }
}

