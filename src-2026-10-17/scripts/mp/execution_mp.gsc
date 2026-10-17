#using script_353e34c229ca1589;
#using scripts\common\callbacks;
#using scripts\mp\execution;

#namespace execution_mp;

// Namespace execution_mp
// Params 0
// Checksum 0xa7f5f027, Offset: 0x76
// Size: 0x75
function execution_mp_init()
{
    callback::add( #"player_on_ladder_begin", &execution::function_883b362fffe1de4f );
    callback::add( #"player_on_ladder_end", &execution::function_b003bfce85514f07 );
    callback::add( #"player_spawned", &execution::playerspawned );
    
    if ( !game_utility_mp::lpcfeaturegated() )
    {
        callback::add( #"hash_1bf3199fda4b9841", &execution::function_74d200e78e2d431f );
        callback::add( #"hash_48d4e39d6de3f7f1", &execution::function_e164d947deb2d497 );
    }
}

