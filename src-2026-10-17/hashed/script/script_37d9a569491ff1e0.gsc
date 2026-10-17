#using script_26ccbfe3954cacf4;
#using script_49e4a4c208f44b76;
#using script_d74ae0b4aa21186;

#namespace nearby_targets;

// Namespace nearby_targets
// Params 1
// Checksum 0x5659d2ef, Offset: 0x97
// Size: 0xba
function createevent( radius )
{
    event = mind::function_1d123cae6381160b();
    event.radius = radius;
    event.radiussquared = radius * radius;
    event.result = [];
    event.var_6dc6ec2c09336ba2 = game_utility::getgametype() == "ob" || getdvarint( @"hash_484a3169a5caef10", 1 );
    eventstream = self.mind.eventstream;
    eventstream.nearbytargets = event;
    eventstream.events[ eventstream.events.size ] = event;
}

// Namespace nearby_targets
// Params 2
// Checksum 0x48627450, Offset: 0x159
// Size: 0x233
function getevent( radius, var_f068a8e25185aa37 )
{
    event = self.mind.eventstream.nearbytargets;
    
    if ( event.result.size > 0 )
    {
        event.result = [];
    }
    
    players = self function_b3cf04aea570be1( radius, var_f068a8e25185aa37 );
    
    foreach ( player in players )
    {
        if ( player.delayedspawnedplayernotify || player manager::isuibot() )
        {
            continue;
        }
        
        event.result[ event.result.size ] = player;
    }
    
    if ( event.var_6dc6ec2c09336ba2 && isdefined( level.agentarray ) )
    {
        agents = function_10926c30e8c04655( self.origin, radius * radius );
        
        foreach ( agent in agents )
        {
            event.result[ event.result.size ] = agent;
        }
        
        if ( agents.size > 0 )
        {
            event.result = sortbydistance( event.result, self.origin );
        }
    }
    
    event.origin = self.origin;
    filter = { #result:event.result, #event:event };
    return filter;
}

