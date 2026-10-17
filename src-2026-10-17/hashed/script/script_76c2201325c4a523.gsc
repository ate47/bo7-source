#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_spawn;

#namespace namespace_bd84f01aeefe9bd9;

// Namespace namespace_bd84f01aeefe9bd9
// Params 0
// Checksum 0x2676284c, Offset: 0xa0
// Size: 0x1d
function init_vehicles()
{
    if ( utility::flag( "sat_init_vehicles" ) )
    {
        return;
    }
    
    utility::flag_set( "sat_init_vehicles" );
}

// Namespace namespace_bd84f01aeefe9bd9
// Params 1
// Checksum 0xa8d7a2fe, Offset: 0xc5
// Size: 0x1d2
function function_9e9164d9466ec5be( var_da54647c3bae40b4 )
{
    level utility::flag_wait( "vehicle_init_done" );
    a_s_spawnpoints = [];
    
    foreach ( s_group in var_da54647c3bae40b4 )
    {
        foreach ( refname in vehicle::function_75acd2d48a8f3605( 1 ) )
        {
            if ( !vehicle_spawn::can_spawn_vehicle( refname ) )
            {
                continue;
            }
            
            vh_spawn_structs = vehicle_spawn::get_spawn_structs( refname );
            
            foreach ( s_spawn in vh_spawn_structs )
            {
                if ( isdefined( s_spawn.script_string ) && isdefined( s_group.script_string ) && s_spawn.script_string == s_group.script_string )
                {
                    s_spawn.refname = refname;
                    a_s_spawnpoints[ a_s_spawnpoints.size ] = s_spawn;
                }
            }
        }
    }
    
    return a_s_spawnpoints;
}

// Namespace namespace_bd84f01aeefe9bd9
// Params 0
// Checksum 0x47bee1bf, Offset: 0x2a0
// Size: 0x1fb
function function_afb3d1d504450ff2()
{
    var_a395317a31d832e4 = getdvarint( @"hash_e70605bdd7aa1e98", 0 );
    var_9dfceed9cdc01a6 = getdvarint( @"hash_771650cbeeca1ab2", 0 );
    
    if ( var_a395317a31d832e4 > var_9dfceed9cdc01a6 )
    {
        var_a395317a31d832e4 = var_9dfceed9cdc01a6;
    }
    
    if ( var_a395317a31d832e4 >= 0 && var_9dfceed9cdc01a6 > 0 && var_a395317a31d832e4 < var_9dfceed9cdc01a6 )
    {
        var_9dfceed9cdc01a6 = randomintrange( var_a395317a31d832e4, var_9dfceed9cdc01a6 + 1 );
    }
    
    var_d1432126ea82e59a = 0;
    level utility::flag_wait( "vehicle_init_done" );
    a_s_spawnpoints = [];
    var_f5de2b1206eb8f75 = [];
    wonder_veh_array = [];
    
    foreach ( refname in vehicle::function_75acd2d48a8f3605( 1 ) )
    {
        if ( !vehicle_spawn::can_spawn_vehicle( refname ) )
        {
            continue;
        }
        
        vh_spawn_structs = vehicle_spawn::get_spawn_structs( refname );
        
        foreach ( s_spawn in vh_spawn_structs )
        {
            s_spawn.refname = refname;
        }
        
        if ( refname == %"hash_1b24b36c27a04014" )
        {
            var_f5de2b1206eb8f75 = arrayrandomize( vh_spawn_structs );
            
            if ( var_f5de2b1206eb8f75.size >= var_9dfceed9cdc01a6 )
            {
                for ( i = 0; i < var_9dfceed9cdc01a6 ; i++ )
                {
                    wonder_veh_array[ i ] = var_f5de2b1206eb8f75[ i ];
                }
            }
            
            a_s_spawnpoints = arraycombine( a_s_spawnpoints, wonder_veh_array );
            continue;
        }
        
        a_s_spawnpoints = arraycombine( a_s_spawnpoints, vh_spawn_structs );
    }
    
    return arrayrandomize( a_s_spawnpoints );
}

// Namespace namespace_bd84f01aeefe9bd9
// Params 1
// Checksum 0x52f43062, Offset: 0x4a4
// Size: 0x2b
function spawn_vehicle( s_spawn )
{
    vehicle::spawn( s_spawn.refname, s_spawn );
    s_spawn.refname = undefined;
}

// Namespace namespace_bd84f01aeefe9bd9
// Params 1
// Checksum 0x57ef5cd6, Offset: 0x4d7
// Size: 0x316
function spawn_vehicle_groups( var_da54647c3bae40b4 )
{
    if ( getdvarint( @"hash_a6e925b5c1930590", 0 ) )
    {
        return;
    }
    
    level utility::flag_wait( "vehicle_init_done" );
    
    foreach ( s_group in var_da54647c3bae40b4 )
    {
        s_group.var_239ddca6ca7e56e7 = [];
        
        foreach ( refname in vehicle::function_75acd2d48a8f3605( 1 ) )
        {
            vh_spawn_structs = vehicle_spawn::get_spawn_structs( refname );
            
            foreach ( s_spawn in vh_spawn_structs )
            {
                if ( isdefined( s_spawn.script_string ) && isdefined( s_group.script_string ) && s_spawn.script_string == s_group.script_string )
                {
                    s_group.var_239ddca6ca7e56e7[ s_group.var_239ddca6ca7e56e7.size ] = s_spawn;
                    s_group.var_239ddca6ca7e56e7[ s_group.var_239ddca6ca7e56e7.size - 1 ].refname = refname;
                }
            }
        }
    }
    
    foreach ( s_group in var_da54647c3bae40b4 )
    {
        var_dae2a7b04cda9e15 = arrayrandomize( s_group.var_239ddca6ca7e56e7 );
        
        if ( isdefined( var_dae2a7b04cda9e15[ 0 ] ) )
        {
            var_bb13be486cc64a57 = vehicle::spawn( var_dae2a7b04cda9e15[ 0 ].refname, var_dae2a7b04cda9e15[ 0 ] );
            
            if ( var_dae2a7b04cda9e15[ 0 ].refname == %"hash_21df6558fa3c728b" )
            {
                for ( i = 1; i < var_dae2a7b04cda9e15.size - 1 ; i++ )
                {
                    if ( var_dae2a7b04cda9e15[ i ].refname == %"hash_21df6558fa3c728b" )
                    {
                        vh_atv = vehicle::spawn( var_dae2a7b04cda9e15[ i ].refname, var_dae2a7b04cda9e15[ i ] );
                    }
                }
            }
        }
    }
}

