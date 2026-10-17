#using script_194f8050b4a6d3a1;

#namespace frontline;

// Namespace frontline
// Params 1
// Checksum 0x67ee0af2, Offset: 0x76
// Size: 0x5a
function function_3d6018358065499a( origin )
{
    closestpoint = pointonsegmentnearesttopoint( level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].minpoint, level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].maxpoint, origin );
    return closestpoint;
}

// Namespace frontline
// Params 1
// Checksum 0x994907e3, Offset: 0xd9
// Size: 0x6b
function function_319c43e923454d67( origin )
{
    closestpoint = pointonsegmentnearesttopoint( level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].minpoint, level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].maxpoint, origin );
    distsq2d = distance2dsquared( closestpoint, origin );
    return distsq2d;
}

// Namespace frontline
// Params 2
// Checksum 0xbecc8cc1, Offset: 0x14d
// Size: 0x390
function function_d8ca994cf0504f9c( origin, team )
{
    if ( !isdefined( level.var_a3f4f77285c6a7fc ) )
    {
        level.var_a3f4f77285c6a7fc = [];
    }
    
    if ( !isdefined( level.var_a3f4f77285c6a7fc[ team ] ) )
    {
        level.var_a3f4f77285c6a7fc[ team ] = spawnstruct();
    }
    
    if ( !isdefined( level.var_a3f4f77285c6a7fc[ team ].timestamp ) || level.var_a3f4f77285c6a7fc[ team ].timestamp < gettime() )
    {
        level.var_a3f4f77285c6a7fc[ team ].timestamp = gettime();
        level.var_a3f4f77285c6a7fc[ team ].lanecount = [];
        
        foreach ( lanekey, lanedata in level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].lanedata )
        {
            level.var_a3f4f77285c6a7fc[ team ].lanecount[ lanekey ] = 0;
        }
        
        friendlyplayers = teams::getfriendlyplayers( team, 1 );
        
        foreach ( player in friendlyplayers )
        {
            closestlane = undefined;
            var_7484eb329b962bf5 = undefined;
            
            foreach ( lanekey, lanedata in level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].lanedata )
            {
                var_ad14139db00b94ee = distance2dsquared( player.origin, lanedata.origin );
                
                if ( !isdefined( closestlane ) || var_ad14139db00b94ee < var_7484eb329b962bf5 )
                {
                    closestlane = lanekey;
                    var_7484eb329b962bf5 = var_ad14139db00b94ee;
                }
            }
            
            level.var_a3f4f77285c6a7fc[ team ].lanecount[ closestlane ]++;
        }
    }
    
    lowestlane = undefined;
    lowestcount = undefined;
    
    foreach ( key, playercount in level.var_a3f4f77285c6a7fc[ team ].lanecount )
    {
        if ( !isdefined( lowestlane ) || playercount < lowestcount )
        {
            lowestlane = key;
            lowestcount = playercount;
        }
    }
    
    distsq2d = distance2dsquared( level.frontlinedata[ level.var_f9f9bdd4e4094d63 ].lanedata[ lowestlane ].origin, origin );
    return distsq2d;
}

