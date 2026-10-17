#using scripts\mp\mp_agent;
#using scripts\mp\zm\zm_utility;

#namespace agent_manager;

// Namespace agent_manager
// Params 4
// Checksum 0x9f3023d4, Offset: 0x76
// Size: 0x6f
function spawn_agent( var_bc661ad67960c4e3, position, angles = ( 0, 0, 0 ), team = zm_utility::get_zombie_team() )
{
    var_bc661ad67960c4e3 = function_b3988325430ce242( var_bc661ad67960c4e3 ) ?? var_bc661ad67960c4e3;
    agent = mp_agent::spawnnewagentaitype( var_bc661ad67960c4e3, position, angles, team );
    return agent;
}

