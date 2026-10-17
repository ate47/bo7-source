#using script_2e54049e99139489;
#using script_31745f90afc66988;
#using script_4b1229c86835ba0c;

#namespace destructible_actions;

// Namespace destructible_actions
// Params 0
// Checksum 0x4ecd58b2, Offset: 0x76
// Size: 0x41
function init()
{
    register_action( #"spawn_loot", &spawn_loot::execute );
    register_action( #"respawn", &respawn::execute );
    register_action( #"spawn_scriptable", &spawn_scriptable::execute );
}

// Namespace destructible_actions
// Params 2, eflags: 0x4
// Checksum 0xd9c7472a, Offset: 0xbf
// Size: 0x63
function private register_action( id, action_callback )
{
    if ( !isdefined( level.destructibles.actions ) )
    {
        level.destructibles.actions = [];
    }
    
    level.destructibles.actions[ id ] = { #execute:action_callback };
}

// Namespace destructible_actions
// Params 1
// Checksum 0x351b3e77, Offset: 0x12a
// Size: 0x4e
function get_action( action_id )
{
    action = level.destructibles.actions[ action_id ];
    
    if ( !isdefined( action ) )
    {
        assertmsg( "<dev string:x24>" + action_id + "<dev string:x5f>" );
        return;
    }
    
    return action;
}

