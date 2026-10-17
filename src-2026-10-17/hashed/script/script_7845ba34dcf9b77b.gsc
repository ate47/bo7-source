#using script_d74ae0b4aa21186;
#using scripts\mp\gameobjects;

#namespace interactable_fobs;

// Namespace interactable_fobs
// Params 0
// Checksum 0x927fdd53, Offset: 0x76
// Size: 0x67
function createevent()
{
    event = mind::function_1d123cae6381160b();
    event.result = [];
    eventstream = self.mind.eventstream;
    eventstream.var_dada0225e9db408 = event;
    eventstream.events[ eventstream.events.size ] = event;
}

// Namespace interactable_fobs
// Params 0
// Checksum 0xe430b110, Offset: 0xe5
// Size: 0x14b
function getevent()
{
    event = self.mind.eventstream.var_dada0225e9db408;
    
    if ( !event.evaluated )
    {
        if ( event.result.size > 0 )
        {
            event.result = [];
        }
        
        if ( !isdefined( level.allfobs ) )
        {
            return event.result;
        }
        
        foreach ( fob in level.allfobs )
        {
            fobobject = fob.trigger.gameobject;
            
            if ( !fobobject gameobjects::caninteractwith( self.team ) )
            {
                continue;
            }
            
            event.result[ event.result.size ] = fob;
        }
        
        event.evaluated = 1;
    }
    
    return event.result;
}

