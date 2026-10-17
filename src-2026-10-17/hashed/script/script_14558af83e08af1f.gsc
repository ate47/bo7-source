#using script_16ea1b94f0f381b3;
#using scripts\autotests\autotests;
#using scripts\autotests\autotests_utility_player;

#namespace autotests_utility_agents;

// Namespace autotests_utility_agents
// Params 0
// Checksum 0x765950c3, Offset: 0xf8
// Size: 0x15, Type: bool
function setup()
{
    autotests::set_dvar( @"ai_enabled", 0 );
    return true;
}

// Namespace autotests_utility_agents
// Params 2
// Checksum 0xb53b8261, Offset: 0x116
// Size: 0x13d
function spawn_ai( player, aisubclass = "ob_soldier" )
{
    var_63a718d91714219d = autotests::function_d84657f448aaeef6( "Has valid player?", isdefined( player ), "scripts/autotests/mp/autotests_utility_agents.gsc", 25 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    ai_type = namespace_9d8e359c3b1041e5::get_aitype_by_subclass_sharedfunc( aisubclass )[ 0 ];
    location = player autotests_utility_player::function_c18463940ac9de4();
    ai = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( ai_type, location, ( 0, 0, 0 ), "team_hundred_ninety" );
    var_63a718d91714219d = autotests::function_d84657f448aaeef6( "Could spawn AI?", isdefined( ai ), "scripts/autotests/mp/autotests_utility_agents.gsc", 30 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    aiangles = ai getplayerangles();
    player autotests_utility_player::set_player_location( ai, 60, anglestoforward( aiangles ) );
    player autotests_utility_player::function_a29ba7836e10842e( ai, ( 0, 0, 6 ) );
    level.autotests.test_runtime.enemy_agent = ai;
    return ai;
}

// Namespace autotests_utility_agents
// Params 1
// Checksum 0xc2a92ba7, Offset: 0x25c
// Size: 0x6d
function cleanup_ai( ai = undefined )
{
    enemy_agent = ai ?? level.autotests.test_runtime.enemy_agent;
    
    if ( !enemy_agent )
    {
        return;
    }
    
    enemy_agent kill();
    level.autotests.test_runtime.enemy_agent = undefined;
}

