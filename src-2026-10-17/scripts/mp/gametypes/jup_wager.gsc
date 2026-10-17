#using script_194f8050b4a6d3a1;
#using script_596b87215f1ff115;
#using scripts\mp\gamelogic;

#namespace jup_wager;

// Namespace jup_wager
// Params 0
// Checksum 0x7f5f5628, Offset: 0x99
// Size: 0x23
function init()
{
    if ( !getdvarint( @"hash_58f1cc219ff0d6c0", 0 ) )
    {
        return;
    }
    
    level.endgame = &function_13962419b80b6e8c;
}

// Namespace jup_wager
// Params 3
// Checksum 0x4856c4ce, Offset: 0xc4
// Size: 0xd3
function function_13962419b80b6e8c( winner, endreasontext, nukedetonated )
{
    if ( isdefined( level.var_13962419b80b6e8c ) )
    {
        return;
    }
    
    level.var_13962419b80b6e8c = 1;
    
    if ( winner != "tie" )
    {
        if ( team_utility::isgameplayteam( winner ) )
        {
            topplayers = arraysort( teams::getteamdata( winner, "players" ), undefined, &gamelogic_mp::compare_player_score );
        }
        else
        {
            topplayers = level.placement[ "all" ];
        }
        
        function_75f66dcb13df9ff3( topplayers );
    }
    
    /#
        if ( !level.onlinegame && winner == "<dev string:x24>" )
        {
            topplayers = [ level.player ];
            function_75f66dcb13df9ff3( topplayers );
        }
    #/
    
    wait 5;
    level thread gamelogic_mp::endgame_regularmp( winner, endreasontext, undefined, nukedetonated );
}

// Namespace jup_wager
// Params 1
// Checksum 0xbb26b054, Offset: 0x19f
// Size: 0xf1
function function_75f66dcb13df9ff3( topplayers )
{
    foreach ( player in topplayers )
    {
        hud = newclienthudelem( player );
        hud.alignx = "center";
        hud.foreground = 1;
        hud.fontscale = 3;
        hud.alpha = 1;
        hud.x = 320;
        hud.y = 300;
        hud settext( &"jup_mp/player_wager_winner" );
    }
}

