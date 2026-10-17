#using scripts\mp\ob\systems\region_difficulty_manager;

#namespace ob_content_manager;

// Namespace ob_content_manager
// Params 0, eflags: 0x5
// Checksum 0x93516fee, Offset: 0xee
// Size: 0x10
function private autoexec init()
{
    level.var_37ee95c5464d47be = &ob_content_manager_spawn;
}

// Namespace ob_content_manager
// Params 0
// Checksum 0x396e5642, Offset: 0x106
// Size: 0x4c
function ob_content_manager_init()
{
    if ( isdefined( level.var_fae6d1257d19cfb ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    level.var_fae6d1257d19cfb = spawnstruct();
    level.var_fae6d1257d19cfb.disable = getdvarint( @"cm_disable", 0 );
}

// Namespace ob_content_manager
// Params 0
// Checksum 0x7a2267dc, Offset: 0x15a
// Size: 0x2d
function function_aa3983ed3b4499a2()
{
    if ( !isdefined( level.var_fae6d1257d19cfb ) )
    {
        ob_content_manager_init();
    }
    
    level.var_fae6d1257d19cfb.disable = 1;
}

// Namespace ob_content_manager
// Params 0
// Checksum 0x78b27882, Offset: 0x18f
// Size: 0x2a
function ob_content_manager_is_disabled()
{
    if ( !isdefined( level.var_fae6d1257d19cfb ) )
    {
        ob_content_manager_init();
    }
    
    return level.var_fae6d1257d19cfb.disable;
}

// Namespace ob_content_manager
// Params 3
// Checksum 0xa8c48ca3, Offset: 0x1c2
// Size: 0x651
function ob_content_manager_spawn( type, instances, spawnfunction )
{
    if ( !isstring( type ) )
    {
        assertmsg( "<dev string:x52>" );
        return [];
    }
    
    if ( !isarray( instances ) )
    {
        assertmsg( "<dev string:x9d>" );
        return [];
    }
    
    var_7c7820e5a4403c33 = getdvarint( @"hash_ef289541321ac02", 10 );
    
    if ( ob_content_manager_is_disabled() )
    {
        if ( isdefined( spawnfunction ) )
        {
            for ( instanceindex = 0; instanceindex < instances.size ; instanceindex++ )
            {
                if ( instanceindex % var_7c7820e5a4403c33 == 0 )
                {
                    waitframe();
                }
                
                [[ spawnfunction ]]( instances[ instanceindex ] );
            }
        }
        
        return instances;
    }
    
    if ( level.var_bb86f77304f193c4.regiondifficultyenabled )
    {
        var_b9d4e81fd1c91ce7 = [];
        var_b9d4e81fd1c91ce7[ "difficulty_easy" ] = get_dvar_by_type( @"hash_dabb20898c754898", type, 1000 );
        var_b9d4e81fd1c91ce7[ "difficulty_normal" ] = get_dvar_by_type( @"hash_38145656dc86c56d", type, 1000 );
        var_b9d4e81fd1c91ce7[ "difficulty_hard" ] = get_dvar_by_type( @"hash_f9fd3aae4ac9fb7", type, 1000 );
        var_b9d4e81fd1c91ce7[ "difficulty_darkaether" ] = get_dvar_by_type( @"hash_f0e9cd5a5da0607c", type, 1000 );
        var_b9d4e81fd1c91ce7[ "difficulty5" ] = get_dvar_by_type( @"hash_fbf9adcc738deaf6", type, 1000 );
        var_b9d4e81fd1c91ce7[ "difficulty6" ] = get_dvar_by_type( @"hash_fbf9adcc738deaf6", type, 1000 );
        var_5c93774efbec0ec5 = [];
        var_5c93774efbec0ec5[ "difficulty_easy" ] = 0;
        var_5c93774efbec0ec5[ "difficulty_normal" ] = 0;
        var_5c93774efbec0ec5[ "difficulty_hard" ] = 0;
        var_5c93774efbec0ec5[ "difficulty_darkaether" ] = 0;
        var_5c93774efbec0ec5[ "difficulty5" ] = 0;
        var_5c93774efbec0ec5[ "difficulty6" ] = 0;
        regions = region_difficulty_manager::get_regions_randomized();
        maxregions = get_dvar_by_type( @"cm_max_region", type, 1000 );
        newregions = [];
        
        foreach ( region in regions )
        {
            regiondifficulty = region_difficulty_manager::function_d2213de17e7b3faf( region );
            
            if ( var_5c93774efbec0ec5[ regiondifficulty ] >= var_b9d4e81fd1c91ce7[ regiondifficulty ] )
            {
                continue;
            }
            
            newregions[ newregions.size ] = region;
            var_5c93774efbec0ec5[ regiondifficulty ]++;
            
            if ( newregions.size >= maxregions )
            {
                break;
            }
        }
        
        regions = newregions;
        regioncount = [];
        
        foreach ( region in regions )
        {
            regioncount[ region.index ] = 0;
        }
        
        var_72875d193357db93 = get_dvar_by_type( @"hash_6032db8987c45dac", type, 1000 );
        difficultymaxcount = [];
        difficultymaxcount[ "difficulty_easy" ] = get_dvar_by_type( @"hash_4223258f9cd27738", type, 1000 );
        difficultymaxcount[ "difficulty_normal" ] = get_dvar_by_type( @"hash_20d31e298a7c480d", type, 1000 );
        difficultymaxcount[ "difficulty_hard" ] = get_dvar_by_type( @"hash_2ba1577e853f4dd7", type, 1000 );
        difficultymaxcount[ "difficulty_darkaether" ] = get_dvar_by_type( @"hash_e6f6531887272c1c", type, 1000 );
        difficultymaxcount[ "difficulty5" ] = get_dvar_by_type( @"hash_cbd25f21e04d1d16", type, 1000 );
        difficultymaxcount[ "difficulty6" ] = get_dvar_by_type( @"hash_cbd25f21e04d1d16", type, 1000 );
        difficultycount = [];
        difficultycount[ "difficulty_easy" ] = 0;
        difficultycount[ "difficulty_normal" ] = 0;
        difficultycount[ "difficulty_hard" ] = 0;
        difficultycount[ "difficulty_darkaether" ] = 0;
        difficultycount[ "difficulty5" ] = 0;
        difficultycount[ "difficulty6" ] = 0;
    }
    
    maxtotal = get_dvar_by_type( @"cm_max", type, 1000 );
    var_31fe0f43cf0b0237 = get_dvar_by_type( @"cm_min_distance", type, 1000 );
    var_b79e61b65b92d67 = var_31fe0f43cf0b0237 * var_31fe0f43cf0b0237;
    spawnedinstances = [];
    instances = arrayrandomize( instances );
    
    for ( instanceindex = 0; instanceindex < instances.size ; instanceindex++ )
    {
        if ( instanceindex % var_7c7820e5a4403c33 == 0 )
        {
            waitframe();
        }
        
        instance = instances[ instanceindex ];
        
        if ( spawnedinstances.size >= maxtotal )
        {
            break;
        }
        
        if ( level.var_bb86f77304f193c4.regiondifficultyenabled )
        {
            region = region_difficulty_manager::get_region( instance.origin );
            
            if ( !isdefined( region ) )
            {
                continue;
            }
            
            if ( !isdefined( regioncount[ region.index ] ) || regioncount[ region.index ] >= var_72875d193357db93 )
            {
                continue;
            }
            
            regiondifficulty = region_difficulty_manager::function_d2213de17e7b3faf( region );
            
            if ( difficultycount[ regiondifficulty ] >= difficultymaxcount[ regiondifficulty ] )
            {
                continue;
            }
        }
        
        var_e0e53c794c8ac628 = 0;
        
        for ( spawnedindex = 0; spawnedindex < spawnedinstances.size ; spawnedindex++ )
        {
            if ( distance2dsquared( instance.origin, spawnedinstances[ spawnedindex ].origin ) < var_b79e61b65b92d67 )
            {
                var_e0e53c794c8ac628 = 1;
                break;
            }
        }
        
        if ( var_e0e53c794c8ac628 )
        {
            continue;
        }
        
        if ( isdefined( level.aether_storm ) && isdefined( level.aether_storm.starting_radius ) && isvector( level.aether_storm.starting_origin ) )
        {
            distancesquared = distance2dsquared( level.aether_storm.starting_origin, instance.origin );
            testdistancesquared = squared( max( level.aether_storm.starting_radius, 0 ) );
            
            if ( distancesquared <= testdistancesquared )
            {
                continue;
            }
        }
        
        if ( level.var_bb86f77304f193c4.regiondifficultyenabled )
        {
            regioncount[ region.index ]++;
            difficultycount[ regiondifficulty ]++;
        }
        
        if ( isdefined( spawnfunction ) )
        {
            [[ spawnfunction ]]( instance );
        }
        
        spawnedinstances[ spawnedinstances.size ] = instance;
    }
    
    return spawnedinstances;
}

// Namespace ob_content_manager
// Params 3, eflags: 0x4
// Checksum 0x98837ead, Offset: 0x81c
// Size: 0x4f
function private get_dvar_by_type( dvar, type, defaultvalue )
{
    typedvar = hashcat( dvar, "__" + type );
    
    if ( isdvardefined( typedvar ) )
    {
        return getdvarint( typedvar );
    }
    
    return getdvarint( dvar, defaultvalue );
}

