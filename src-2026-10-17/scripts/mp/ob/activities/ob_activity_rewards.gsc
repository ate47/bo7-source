#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\points;

#namespace ob_activity_rewards;

// Namespace ob_activity_rewards
// Params 4
// Checksum 0x6ca7f072, Offset: 0x89
// Size: 0x18c
function give_activity_rewards( players, is_major, difficulty_region, activity_origin )
{
    activity_instance = self;
    
    if ( !isdefined( players ) )
    {
        return;
    }
    
    player_list = [];
    
    if ( !isarray( players ) && isplayer( players ) )
    {
        player_list[ 0 ] = players;
    }
    else
    {
        player_list = players;
    }
    
    s_difficulty_region = "difficulty_easy";
    
    if ( isdefined( difficulty_region ) )
    {
        s_difficulty_region = difficulty_region;
    }
    else if ( isdefined( activity_origin ) && isdefined( level.var_bd706167fc97713c ) )
    {
        s_difficulty_region = [[ level.var_bd706167fc97713c ]]( activity_origin );
    }
    
    var_74ae62fc950a834e = is_major ? #"hash_8ffaedda589ef6b7" : #"hash_a9b30a9f0ebefca3";
    difficulty_tier = ob_activity_definition_utils::function_ee700758cb24d61f( activity_instance.varianttag, activity_instance );
    var_3cbdeadae26734ff = ob_activity_definition_utils::function_b0e28b51d80eaa2c( activity_instance, difficulty_tier );
    var_e2f650bcd8419ea7 = ob_activity_definition_utils::function_8cae82a5766f87d5( activity_instance, difficulty_tier );
    
    foreach ( player in player_list )
    {
        player points::ob_do_score_event( var_74ae62fc950a834e, undefined, 0, #"activity_reward", var_3cbdeadae26734ff, var_e2f650bcd8419ea7 );
    }
}

