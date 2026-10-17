#using script_49e4a4c208f44b76;

#namespace team_gun;

// Namespace team_gun
// Params 0
// Checksum 0x9e02050f, Offset: 0x8a
// Size: 0xe, Type: bool
function function_ab3051539fb113f1()
{
    return game_utility::getgametype() == "team_gun";
}

// Namespace team_gun
// Params 0
// Checksum 0xc866d7f0, Offset: 0xa1
// Size: 0x91
function function_7f7964a1bdd7adc5()
{
    player = self;
    
    if ( isbot( player ) )
    {
        team = player.bot_team;
    }
    else
    {
        team = player.pers[ "team" ];
    }
    
    player.gungamegunindex = function_db57c6d06e6168e( team );
    
    if ( player.gungamegunindex == 0 )
    {
        player.gungameprevgunindex = 0;
        return;
    }
    
    player.gungameprevgunindex = player.gungamegunindex - 1;
}

// Namespace team_gun
// Params 1
// Checksum 0xf2fea637, Offset: 0x13a
// Size: 0x2b
function function_db57c6d06e6168e( team )
{
    if ( !isdefined( level.var_4eeecb77cf60cfea[ team ] ) )
    {
        return 0;
    }
    
    return level.var_4eeecb77cf60cfea[ team ];
}

