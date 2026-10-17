#using script_1aae2eb1ef28b239;
#using scripts\common\rewards\reward_cache_settings;
#using scripts\mp\loot\common_cache;
#using scripts\mp\ob\activities\ob_activity_definition_utils;
#using scripts\mp\ob\activities\ob_objective_rewards;

#namespace ob_activity_rewards;

// Namespace ob_activity_rewards
// Params 1
// Checksum 0x5f80ee7d, Offset: 0x82
// Size: 0x66
function ob_openlootablecontainer( relevantparameters )
{
    grouprewardcache = relevantparameters.cache;
    player = relevantparameters.player;
    
    if ( !isdefined( grouprewardcache ) )
    {
        return;
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    grouprewardcache.minimumslots = function_c1e5e2430937d1dc( grouprewardcache );
    common_cache::openlootablecontainer( grouprewardcache, player );
}

// Namespace ob_activity_rewards
// Params 1
// Checksum 0x83b65ce9, Offset: 0xf0
// Size: 0x7a
function function_d5422be66a10dac0( relevantinfostruct )
{
    currentopener = relevantinfostruct.currentopener;
    
    if ( !isplayer( currentopener ) )
    {
        return;
    }
    
    lootid = relevantinfostruct.lootid;
    quantity = relevantinfostruct.quantity;
    containerindex = relevantinfostruct.containerindex;
    common_cache::function_25bee1f5701a0786( currentopener, containerindex, lootid, quantity );
}

// Namespace ob_activity_rewards
// Params 1
// Checksum 0x73d1581, Offset: 0x172
// Size: 0xa6
function function_91481a82c41f9021( relevantinfostruct )
{
    activityinstance = self;
    category = activity_instance_common::getactivitycategory( activityinstance );
    
    if ( category == "Contract" )
    {
        reward_instance = spawnstruct();
        reward_instance.difficulty_region = activityinstance ob_objective_rewards::function_978e3550d9f0313f();
        reward_instance.activity_instance = activityinstance;
        reward_instance.reward_group = relevantinfostruct.reward_group;
        cache = spawnstruct();
        reward_instance ob_objective_rewards::function_f87ed5526b8f404e( cache );
        return cache.contents;
    }
    
    return [];
}

// Namespace ob_activity_rewards
// Params 3
// Checksum 0x3f1d8506, Offset: 0x220
// Size: 0x44
function function_f23d5e30cd73e104( origin, var_c786523ebe9c85c0, var_e9aeea7e0ebb0b56 )
{
    return reward_cache_placement_struct::function_5e18091e9e0bd7e0( origin, ( 0, 0, 0 ), var_c786523ebe9c85c0 ?? 0, var_e9aeea7e0ebb0b56 ?? 100, 22, 36 );
}

// Namespace ob_activity_rewards
// Params 1, eflags: 0x4
// Checksum 0xbcf62b51, Offset: 0x26d
// Size: 0x22
function private function_c1e5e2430937d1dc( grouprewardcache )
{
    return int( max( grouprewardcache.contents.size, 4 ) );
}

// Namespace ob_activity_rewards
// Params 1, eflags: 0x4
// Checksum 0x3eb403a3, Offset: 0x298
// Size: 0x3c
function private function_1d36ad9a59be4525( activityinstance )
{
    var_880b2b26b9114f94 = ob_activity_definition_utils::function_b6096bc924663393( activityinstance );
    
    if ( var_880b2b26b9114f94.size > 0 )
    {
        var_ca21418e617c2723 = var_880b2b26b9114f94[ 0 ];
        return var_ca21418e617c2723;
    }
    
    return;
}

