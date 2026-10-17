#using scripts\common\telemetry_utils;

#namespace telemetry_coop;

// Namespace telemetry_coop
// Params 0
// Checksum 0x3d481977, Offset: 0x19d
// Size: 0x13
function init()
{
    telemetry_utils::function_5995f9c2ef729dbd( "callback_coop_player_oob_teleport", &function_3cca523630def532 );
}

// Namespace telemetry_coop
// Params 0
// Checksum 0xd9e41934, Offset: 0x1b8
// Size: 0x72
function function_48065623105118c3()
{
    assert( isplayer( self ) );
    telemetry_data = { #player_z:self.origin[ 2 ], #player_y:self.origin[ 1 ], #player_x:self.origin[ 0 ], #player:self };
    telemetry_utils::function_af2d366f9522f76f( "callback_coop_player_oob_teleport", telemetry_data );
}

// Namespace telemetry_coop
// Params 1
// Checksum 0x9a00f78c, Offset: 0x232
// Size: 0x138
function player_death_event( type )
{
    if ( isplayer( self ) )
    {
        attackerclass = self.lastattacker.subclass ?? "unknown";
        regiondifficulty = "difficulty_easy";
        
        if ( isfunction( level.var_bb131187d6741752 ) )
        {
            regiondifficulty = [[ level.var_bb131187d6741752 ]]( self.origin );
        }
        
        self dlog_recordplayerevent( "dlog_event_ob_player_death", [ "was_knocked", type == "was_knocked", "was_killed", type == "was_killed", "was_revived", type == "was_revived", "was_wiped", type == "was_wiped", "location_x", self.origin[ 0 ], "location_y", self.origin[ 1 ], "location_z", self.origin[ 2 ], "difficulty", regiondifficulty, "attacker", attackerclass ] );
    }
}

// Namespace telemetry_coop
// Params 1
// Checksum 0xdb5fb327, Offset: 0x372
// Size: 0x90
function function_3cca523630def532( data )
{
    player_x = data.player_x;
    player_y = data.player_y;
    player_z = data.player_z;
    data.player dlog_recordplayerevent( "dlog_event_sat_ob_sm_oob_teleport", [ "player_x", player_x, "player_y", player_y, "player_z", player_z ] );
}

