#namespace join_team_aggregator;

// Namespace join_team_aggregator
// Params 1
// Checksum 0x35e3c72f, Offset: 0x92
// Size: 0xbc
function onplayerjointeam( player )
{
    thread onplayerjointeamnospectator( player );
    
    if ( isdefined( level.onjointeamcallbacks ) )
    {
        foreach ( callback in level.onjointeamcallbacks )
        {
            self [[ callback ]]( player );
        }
    }
    
    level notify( #"player_joined_team", player );
    level notify( player.team + "_new_member" );
}

// Namespace join_team_aggregator
// Params 1
// Checksum 0xc0152aaf, Offset: 0x156
// Size: 0x39
function registeronplayerjointeamcallback( callback )
{
    if ( !isdefined( level.onjointeamcallbacks ) )
    {
        level.onjointeamcallbacks = [];
    }
    
    level.onjointeamcallbacks[ level.onjointeamcallbacks.size ] = callback;
}

// Namespace join_team_aggregator
// Params 1
// Checksum 0x64ee12cf, Offset: 0x197
// Size: 0xe4
function onplayerjointeamnospectator( player )
{
    player notify( #"onplayerjointeamnospectator" );
    
    if ( player.sessionstate == "spectator" )
    {
        player endon( #"death_or_disconnect" );
        player endon( #"onplayerjointeamnospectator" );
        
        while ( player.sessionstate == "spectator" )
        {
            waitframe();
        }
    }
    
    if ( isdefined( level.onjointeamnospectatorcallbacks ) )
    {
        foreach ( callback in level.onjointeamnospectatorcallbacks )
        {
            self [[ callback ]]( player );
        }
    }
}

// Namespace join_team_aggregator
// Params 1
// Checksum 0xb0579fe7, Offset: 0x283
// Size: 0x39
function registeronplayerjointeamnospectatorcallback( callback )
{
    if ( !isdefined( level.onjointeamnospectatorcallbacks ) )
    {
        level.onjointeamnospectatorcallbacks = [];
    }
    
    level.onjointeamnospectatorcallbacks[ level.onjointeamnospectatorcallbacks.size ] = callback;
}

