#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\metabone;
#using scripts\common\utility;

#namespace zombie_abom_metabones;

// Namespace zombie_abom_metabones
// Params 0, eflags: 0x1
// Checksum 0xab84c98, Offset: 0x100
// Size: 0xbd
function autoexec main()
{
    var_fb56e56d94279338 = "zombie_abom";
    metabone::function_cd947f1a3391c065( var_fb56e56d94279338, &on_metabone_destroyed );
    level.var_2aeaf66762db8e14 = [];
    level.var_2aeaf66762db8e14[ "head_le" ] = 0;
    level.var_2aeaf66762db8e14[ "head_mid" ] = 1;
    level.var_2aeaf66762db8e14[ "head_ri" ] = 2;
    level.var_93e6be4b24339ce4 = [];
    level.var_93e6be4b24339ce4[ 0 ] = "head_le";
    level.var_93e6be4b24339ce4[ 1 ] = "head_mid";
    level.var_93e6be4b24339ce4[ 2 ] = "head_ri";
    utility::registersharedfunc( #"zombie_abom_metabones", #"hash_7dd1871877d05ca4", &is_head_alive );
}

// Namespace zombie_abom_metabones
// Params 1, eflags: 0x4
// Checksum 0xa2cbbc5d, Offset: 0x1c5
// Size: 0x1e
function private on_metabone_destroyed( params )
{
    function_6f9f3a371b224bac( params.metabone_name );
}

// Namespace zombie_abom_metabones
// Params 1, eflags: 0x4
// Checksum 0xd33d2908, Offset: 0x1eb
// Size: 0xb9
function private function_6f9f3a371b224bac( metabone_name )
{
    if ( self getscriptablehaspart( metabone_name ) )
    {
        self setscriptablepartstate( metabone_name, "destroyed" );
        metabone::set_metabone_state( metabone_name, "destroyed" );
        asm::function_7256f5ba459c840b( "head_destroyed_in" );
        self notify( "head_destroyed_" + level.var_2aeaf66762db8e14[ metabone_name ] );
        heads_remaining = get_heads_alive( self );
        params = spawnstruct();
        params.metabone_name = metabone_name;
        params.heads_remaining = heads_remaining;
        callback::callback( "head_destroyed", params );
        update_head_health( heads_remaining );
        return;
    }
    
    assertmsg( "<dev string:x24>" + metabone_name );
}

// Namespace zombie_abom_metabones
// Params 1
// Checksum 0x2582fb36, Offset: 0x2ac
// Size: 0x139
function update_head_health( heads_remaining = get_heads_alive( self ) )
{
    if ( heads_remaining.size == 2 )
    {
        foreach ( head_name in heads_remaining )
        {
            metabone::function_dbe4a2c3b0797294( head_name, self.maxhealth * 0.15, "open" );
        }
        
        return;
    }
    
    if ( heads_remaining.size == 1 )
    {
        foreach ( head_name in heads_remaining )
        {
            metabone::set_metabone_health( head_name, self.health, "open" );
        }
        
        return;
    }
    
    self.killondamage = 1;
}

// Namespace zombie_abom_metabones
// Params 1
// Checksum 0x7439c04, Offset: 0x3ed
// Size: 0x5d
function get_heads_alive( entity )
{
    heads_alive = [];
    
    for ( head_index = 0; head_index <= 2 ; head_index++ )
    {
        if ( is_head_alive( entity, head_index ) )
        {
            metabone = level.var_93e6be4b24339ce4[ head_index ];
            heads_alive[ heads_alive.size ] = metabone;
        }
    }
    
    return heads_alive;
}

// Namespace zombie_abom_metabones
// Params 1
// Checksum 0x28633701, Offset: 0x453
// Size: 0x47
function function_621da7a4dc0c0695( entity )
{
    heads_alive = [];
    
    for ( head_index = 0; head_index <= 2 ; head_index++ )
    {
        if ( is_head_alive( entity, head_index ) )
        {
            heads_alive[ heads_alive.size ] = head_index;
        }
    }
    
    return heads_alive;
}

// Namespace zombie_abom_metabones
// Params 2
// Checksum 0xa31e5ea3, Offset: 0x4a3
// Size: 0x56, Type: bool
function is_head_alive( entity, head_index )
{
    assert( head_index >= 0 && head_index <= 2, "<dev string:x4f>" );
    metabone = level.var_93e6be4b24339ce4[ head_index ];
    return entity metabone::get_metabone_state_name( metabone ) != "destroyed";
}

// Namespace zombie_abom_metabones
// Params 3
// Checksum 0xf9511138, Offset: 0x502
// Size: 0x98
function set_head_open_state( entity, head_index, is_open )
{
    assert( head_index >= 0 && head_index <= 2, "<dev string:x4f>" );
    metabone_state = is_open ? "open" : "closed";
    
    if ( !is_head_alive( entity, head_index ) )
    {
        metabone_state = "destroyed";
    }
    
    entity metabone::set_metabone_active( level.var_93e6be4b24339ce4[ head_index ], istrue( is_open ) );
    entity metabone::set_metabone_state( level.var_93e6be4b24339ce4[ head_index ], metabone_state );
}

// Namespace zombie_abom_metabones
// Params 1
// Checksum 0x84d3a280, Offset: 0x5a2
// Size: 0x23
function function_316f556358b6282b( metabone_name )
{
    if ( self getscriptablehaspart( metabone_name ) )
    {
        return level.var_2aeaf66762db8e14[ metabone_name ];
    }
}

