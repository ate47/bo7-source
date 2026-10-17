#using scripts\mp\flags;

#namespace player_frame_update_aggregator;

// Namespace player_frame_update_aggregator
// Params 0
// Checksum 0x86296319, Offset: 0x87
// Size: 0x14
function init()
{
    level.playerframeupdatecallbacks = [];
    level thread runupdates();
}

// Namespace player_frame_update_aggregator
// Params 0
// Checksum 0xa2f803ab, Offset: 0xa3
// Size: 0x121
function runupdates()
{
    level endon( #"game_ended" );
    flags::gameflagwait( "prematch_done" );
    
    if ( level.playerframeupdatecallbacks.size == 0 )
    {
        level.playerframeupdatecallbacks = undefined;
        return;
    }
    
    while ( true )
    {
        foreach ( player in level.players )
        {
            foreach ( callback in level.playerframeupdatecallbacks )
            {
                player [[ callback ]]();
            }
        }
        
        waitframe();
    }
}

// Namespace player_frame_update_aggregator
// Params 1
// Checksum 0xb6702c73, Offset: 0x1cc
// Size: 0x4e
function registerplayerframeupdatecallback( callback )
{
    assert( !game[ "<dev string:x24>" ], "<dev string:x30>" );
    
    if ( !isdefined( level.playerframeupdatecallbacks ) )
    {
        level.playerframeupdatecallbacks = [];
    }
    
    level.playerframeupdatecallbacks[ level.playerframeupdatecallbacks.size ] = callback;
}

