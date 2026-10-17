#using script_194f8050b4a6d3a1;
#using scripts\common\rat;
#using scripts\mp\equipment;

#namespace rat_mp;

// Namespace rat_mp
// Params 0
// Checksum 0xe5989bab, Offset: 0x106
// Size: 0x5f
function init()
{
    level.var_855c138311a366fb = undefined;
    level.var_ade95642d19836cd = undefined;
    rat::init();
    rat::ratregisterfunction( "RatGetPlayerTeam", &ratgetplayerteam, "string" );
    rat::ratregisterfunction( "RatGetTeamCount", &ratgetteamcount, "int64_t" );
    rat::ratregisterfunction( "RatGetPlayerEquipment", &ratgetplayerequipment, "string" );
}

// Namespace rat_mp
// Params 1
// Checksum 0x61544d42, Offset: 0x16d
// Size: 0x2b
function ratgetplayerteam( params )
{
    player = rat::getplayer( params );
    return player.team;
}

// Namespace rat_mp
// Params 1
// Checksum 0x17c71e1d, Offset: 0x1a1
// Size: 0x81
function ratgetteamcount( params )
{
    target_team = params.team ?? "player";
    player_team = ratgetplayerteam( params );
    
    if ( target_team == "player" )
    {
        target_team = player_team;
    }
    
    if ( target_team == "enemy" )
    {
        if ( player_team == "axis" )
        {
            target_team = "allies";
        }
        else
        {
            target_team = "axis";
        }
    }
    
    return teams::getteamdata( target_team, "players" ).size;
}

// Namespace rat_mp
// Params 1
// Checksum 0x807cd11a, Offset: 0x22b
// Size: 0x52
function ratgetplayerequipment( params )
{
    target_slot = params.slot ?? "primary";
    player = rat::getplayer( params );
    equip = player equipment_mp::getcurrentequipment( target_slot );
    return equip;
}

