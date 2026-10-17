#using scripts\common\utility;

#namespace compass_ping;

// Namespace compass_ping
// Params 3
// Checksum 0x891908f9, Offset: 0x76
// Size: 0xb7
function ping( visibility_radius = 1200, visibility_height = 500, duration_ms = 1000 )
{
    player = self;
    player endon( #"death_or_disconnect" );
    level endon( #"game_ended" );
    teams_nearby = utility::function_d6c8833c6628c415( player.origin, visibility_radius, visibility_height, 0, player );
    
    if ( teams_nearby.size <= 0 )
    {
        return;
    }
    
    player function_7b4f73a93178f87d( 6, teams_nearby, player, 1 );
    waitframe();
    player function_71c7c5be98d11198( teams_nearby, duration_ms, 1 );
    player function_7b4f73a93178f87d( 6, teams_nearby, player, 0 );
}

