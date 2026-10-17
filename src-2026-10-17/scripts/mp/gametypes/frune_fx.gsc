#using script_208a12cbcccbfa63;

#namespace frune_fx;

// Namespace frune_fx
// Params 0
// Checksum 0xa48ec19, Offset: 0x9b
// Size: 0x9
function init()
{
    function_b804292deb870d69();
}

// Namespace frune_fx
// Params 0, eflags: 0x4
// Checksum 0x13effdd1, Offset: 0xac
// Size: 0x99
function private function_b804292deb870d69()
{
    worldeventtriggers = getentarray( "world_event_trigger", "targetname" );
    
    foreach ( trigger in worldeventtriggers )
    {
        trigger::makeenterexittrigger( trigger, &function_7211300e217808d1, undefined, undefined, undefined, &function_fe1fb3d2b2e0e810 );
    }
}

// Namespace frune_fx
// Params 2, eflags: 0x4
// Checksum 0x21734b28, Offset: 0x14d
// Size: 0x54, Type: bool
function private function_fe1fb3d2b2e0e810( triggeringent, enttrigger )
{
    if ( !isplayer( triggeringent ) || !isalive( triggeringent ) )
    {
        return true;
    }
    
    playerid = triggeringent getentitynumber();
    
    if ( enttrigger.triggeredplayers[ playerid ] )
    {
        return true;
    }
    
    return false;
}

// Namespace frune_fx
// Params 2, eflags: 0x4
// Checksum 0x211397ec, Offset: 0x1aa
// Size: 0x4b
function private function_7211300e217808d1( triggeringent, enttrigger )
{
    playerid = triggeringent getentitynumber();
    enttrigger.triggeredplayers[ playerid ] = 1;
    activateworldevent( enttrigger.script_noteworthy, undefined, triggeringent );
}

