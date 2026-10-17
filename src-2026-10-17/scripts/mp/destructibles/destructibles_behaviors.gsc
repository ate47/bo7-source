#using script_22b6a37515112f37;

#namespace destructible_behaviors;

// Namespace destructible_behaviors
// Params 0
// Checksum 0x6602a05d, Offset: 0x76
// Size: 0x17
function init()
{
    register_behavior( #"soul_harvest", &soul_harvest::execute );
}

// Namespace destructible_behaviors
// Params 3, eflags: 0x4
// Checksum 0xf720dd06, Offset: 0x95
// Size: 0x77
function private register_behavior( id, execute_callback, stop_callback )
{
    if ( !isdefined( level.destructibles.behaviors ) )
    {
        level.destructibles.behaviors = [];
    }
    
    level.destructibles.behaviors[ id ] = { #stop:stop_callback, #execute:execute_callback };
}

// Namespace destructible_behaviors
// Params 1
// Checksum 0x5a47fbe4, Offset: 0x114
// Size: 0x4e
function get_behavior( behavior_id )
{
    behavior = level.destructibles.behaviors[ behavior_id ];
    
    if ( !isdefined( behavior ) )
    {
        assertmsg( "<dev string:x24>" + behavior_id + "<dev string:x5f>" );
        return;
    }
    
    return behavior;
}

