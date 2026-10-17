#using script_353e34c229ca1589;
#using scripts\common\utility;
#using scripts\mp\playerstats;

#namespace zm_playerstats;

// Namespace zm_playerstats
// Params 0
// Checksum 0xd192c6dd, Offset: 0x8d
// Size: 0x3d
function init()
{
    utility::registersharedfunc( #"player", #"initplayerstats", &initplayer );
    
    if ( !level.var_cc0c7bf608489ed8 )
    {
        return;
    }
    
    level.zmplayerstats = playerstats::function_3d300f501f20e5aa();
}

// Namespace zm_playerstats
// Params 0
// Checksum 0x989790a0, Offset: 0xd2
// Size: 0x63
function initplayer()
{
    if ( !level.var_cc0c7bf608489ed8 )
    {
        return;
    }
    
    if ( isdefined( self.pers[ "zmplayerstats" ] ) )
    {
        self.zmplayerstats = self.pers[ "zmplayerstats" ];
    }
    else
    {
        self.zmplayerstats = playerstats::function_66626e35d76bc952();
    }
    
    if ( !game_utility_mp::runleanthreadmode() )
    {
        thread playerstats::bufferedstatwritethink( "zm" );
    }
}

