#using script_353e34c229ca1589;
#using scripts\common\utility;

#namespace namespace_be3150865da9d2f1;

// Namespace namespace_be3150865da9d2f1
// Params 0
// Checksum 0xd6aaa27c, Offset: 0x89
// Size: 0x31
function get_linked_struct()
{
    array = utility::get_linked_structs();
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace namespace_be3150865da9d2f1
// Params 0
// Checksum 0xcf71fb75, Offset: 0xc3
// Size: 0x31
function get_linked_vehicle_node()
{
    array = game_utility_mp::get_linked_vehicle_nodes();
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x6f715787, Offset: 0xfd
// Size: 0x5b
function get_linked_vehicle_nodes_filtered( value, key )
{
    array = [];
    filtered_nodes = getvehiclenodearray( value, key );
    
    if ( isdefined( self.script_linkto ) )
    {
        linked_nodes = game_utility_mp::get_linked_vehicle_nodes();
        array = arrayintersection( linked_nodes, filtered_nodes );
    }
    
    return array;
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0xa84ff392, Offset: 0x161
// Size: 0x47
function get_linked_vehicle_node_filtered( value, key )
{
    array = get_linked_vehicle_nodes_filtered( value, key );
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x3ca40c24, Offset: 0x1b1
// Size: 0xa8
function get_linked_structs_filtered( value, key )
{
    array = [];
    filtered_structs = utility::getstructarray( value, key );
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = utility::get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            linked_structs = utility::getstructarray( linknames[ i ], "script_linkname" );
            structs = arrayintersection( linked_structs, filtered_structs );
            
            if ( structs.size > 0 )
            {
                array = arraycombine( array, structs );
            }
        }
    }
    
    return array;
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0xaa7af650, Offset: 0x262
// Size: 0x3a
function get_linked_struct_filtered( value, key )
{
    array = get_linked_structs_filtered( value, key );
    
    if ( array.size > 0 )
    {
        return array[ 0 ];
    }
    
    return;
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x3ad042a6, Offset: 0x2a4
// Size: 0xa8
function get_linked_ents_filtered( value, key )
{
    array = [];
    filtered_ents = getentarray( value, key );
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = utility::get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            linked_ents = getentarray( linknames[ i ], #script_linkname );
            ents = arrayintersection( linked_ents, filtered_ents );
            
            if ( ents.size > 0 )
            {
                array = arraycombine( array, ents );
            }
        }
    }
    
    return array;
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0xe151448, Offset: 0x355
// Size: 0x47
function get_linked_ent_filtered( value, key )
{
    array = get_linked_ents_filtered( value, key );
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x8d2707d7, Offset: 0x3a5
// Size: 0x47
function function_9386db431ab6d1c6( value, key )
{
    array = get_linked_scriptables_filtered( value, key );
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x40ee2560, Offset: 0x3f5
// Size: 0xec
function get_linked_scriptables_filtered( value, key )
{
    array = [];
    filtered_scriptables = [];
    entity_scriptables = getscriptablearray( value, key );
    entityless_scriptables = getentitylessscriptablearray( value, key );
    filtered_scriptables = arraycombineunique( entity_scriptables, entityless_scriptables );
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = utility::get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            linked_scriptables = [];
            entity_scriptables = getscriptablearray( linknames[ i ], #script_linkname );
            entityless_scriptables = getentitylessscriptablearray( linknames[ i ], #script_linkname );
            linked_scriptables = arraycombineunique( entity_scriptables, entityless_scriptables );
            scriptables = arrayintersection( linked_scriptables, filtered_scriptables );
            
            if ( scriptables.size > 0 )
            {
                array = arraycombine( array, scriptables );
            }
        }
    }
    
    return array;
}

// Namespace namespace_be3150865da9d2f1
// Params 2
// Checksum 0x6ce9b733, Offset: 0x4ea
// Size: 0xa4
function function_edb66f81f94f3870( value, key )
{
    array = [];
    filtered_volumes = getnoentvolumearray( value, key );
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = utility::get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            for ( j = 0; j < filtered_volumes.size ; j++ )
            {
                if ( linknames[ i ] == filtered_volumes[ j ].script_linkname )
                {
                    array[ array.size ] = filtered_volumes[ j ];
                }
            }
        }
    }
    
    return array;
}

