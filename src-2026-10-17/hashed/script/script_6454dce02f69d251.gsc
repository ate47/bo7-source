#namespace glass_fence;

// Namespace glass_fence
// Params 1
// Checksum 0x9fc7451, Offset: 0x94
// Size: 0xb1
function init_glass_fence( trigname )
{
    level endon( #"game_ended" );
    level waittill( #"matchstarttimer_done" );
    glass_triggers = getentarray( trigname, #targetname );
    
    foreach ( trig in glass_triggers )
    {
        thread function_99e653f9dd7a131( trig, trigname );
    }
}

// Namespace glass_fence
// Params 2
// Checksum 0x16ae93b5, Offset: 0x14d
// Size: 0x101
function function_99e653f9dd7a131( trig, trigname )
{
    level endon( #"game_ended" );
    glass_count = getentarray( trigname, #targetname );
    
    while ( glass_count.size > 0 )
    {
        if ( !isdefined( trig.scriptable ) )
        {
            scriptables = getentitylessscriptablearray( "glass_clip", #targetname );
            trig.scriptable = sortbydistance( scriptables, trig.origin )[ 0 ];
        }
        
        glass = getglass( trig.scriptable.target );
        trig waittill( #"trigger" );
        
        if ( isglassdestroyed( glass ) )
        {
            trig.scriptable setscriptablepartstate( "base", "dead" );
            trig delete();
            glass_count = getentarray( trigname, #targetname );
            break;
        }
    }
}

