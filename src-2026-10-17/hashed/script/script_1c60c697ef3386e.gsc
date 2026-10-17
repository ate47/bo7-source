#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\points;

#namespace bgb_profit_sharing_zm;

// Namespace bgb_profit_sharing_zm
// Params 0, eflags: 0x5
// Checksum 0x8873737f, Offset: 0xbe
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"profit_sharing_zm", "profit_sharing", &pre_main, undefined );
}

// Namespace bgb_profit_sharing_zm
// Params 0, eflags: 0x4
// Checksum 0xdd99f7b2, Offset: 0xe3
// Size: 0x1c
function private pre_main()
{
    utility::registersharedfunc( "profit_sharing", #"add_to_player_score_override", &add_to_player_score_override );
}

// Namespace bgb_profit_sharing_zm
// Params 3
// Checksum 0x4ee458b7, Offset: 0x107
// Size: 0x24b, Type: bool
function add_to_player_score_override( n_points, str_awarded_by, var_f73031792a7a61f4 )
{
    if ( !isdefined( str_awarded_by ) )
    {
        return false;
    }
    
    switch ( str_awarded_by )
    {
        case #"profit_sharing":
        case #"powerup_bonus_points_team":
        case #"hash_495c0c1b33d9b414":
        case #"bgb_gift_card":
        case #"hash_94a335b456789386":
        case #"hash_9fbcf64817cd3e0c":
        case #"powerup_nuke":
        case #"hash_f0666fbe26b6cffa":
            return false;
        default:
            break;
    }
    
    if ( !var_f73031792a7a61f4 )
    {
        foreach ( e_player in level.players )
        {
            if ( isdefined( e_player ) && self.team == e_player.team && e_player bgb::is_enabled( "profit_sharing" ) )
            {
                if ( isdefined( e_player.var_d2d61a0b77c6612 ) && arraycontains( e_player.var_d2d61a0b77c6612, self ) )
                {
                    e_player points::zm_give_points( #"profit_sharing", n_points );
                    e_player playlocalsound( #"hash_12138bab37bdc070" );
                }
            }
        }
    }
    else if ( self.var_d2d61a0b77c6612.size > 0 )
    {
        foreach ( e_player in self.var_d2d61a0b77c6612 )
        {
            if ( isdefined( e_player ) && self.team == e_player.team )
            {
                e_player points::zm_give_points( #"profit_sharing", n_points );
                e_player playlocalsound( #"hash_12138bab37bdc070" );
            }
        }
    }
    
    return false;
}

