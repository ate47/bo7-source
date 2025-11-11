#namespace interactive;

// Namespace interactive/entity_used
// Params 2, eflags: 0x20
// Checksum 0x3e6271f, Offset: 0x80
// Size: 0x70
function event_handler[entity_used] entity_used( entity, player )
{
    profilestart();
    
    if ( !isdefined( entity.interactive_used_func_id ) )
    {
        profilestop();
        return;
    }
    
    if ( !isdefined( level.interactive_used_funcs ) )
    {
        profilestop();
        return;
    }
    
    if ( !isdefined( level.interactive_used_funcs[ entity.interactive_used_func_id ] ) )
    {
        profilestop();
        return;
    }
    
    thread [[ level.interactive_used_funcs[ entity.interactive_used_func_id ] ]]( entity, player );
    profilestop();
}

// Namespace interactive
// Params 2
// Checksum 0xad09075, Offset: 0xf8
// Size: 0x87
function interactive_addusedcallback( usedcallback, id )
{
    if ( !isdefined( level.interactive_used_funcs ) )
    {
        level.interactive_used_funcs = [];
        level.interactive_used_funcs_unique_id = 0;
    }
    
    if ( !isdefined( id ) )
    {
        while ( isdefined( level.interactive_used_funcs[ level.interactive_used_funcs_unique_id ] ) )
        {
            level.interactive_used_funcs_unique_id++;
        }
        
        id = level.interactive_used_funcs_unique_id;
        level.interactive_used_funcs_unique_id++;
    }
    
    level.interactive_used_funcs[ id ] = usedcallback;
    return id;
}

// Namespace interactive
// Params 1
// Checksum 0x19893b66, Offset: 0x188
// Size: 0x17
function interactive_addusedcallbacktoentity( id )
{
    self.interactive_used_func_id = id;
}

// Namespace interactive
// Params 0
// Checksum 0x122a5d37, Offset: 0x1a7
// Size: 0xc
function interactive_removeusedcallbackfromentity()
{
    self.interactive_used_func_id = undefined;
}

// Namespace interactive
// Params 2
// Checksum 0xa615ea9, Offset: 0x1bb
// Size: 0x87
function function_bb62c739af2034bc( usable, player )
{
    if ( isdefined( usable.var_b67012ddb354bc5a ) )
    {
        result = [[ usable.var_b67012ddb354bc5a ]]( usable, player );
        assert( isstruct( result ) && isdefined( result.type ) && ( isdefined( result.string ) || isdefined( result.title ) ), "<dev string:x24>" );
        return result;
    }
    
    return undefined;
}

// Namespace interactive
// Params 2
// Checksum 0xd2dc7c9c, Offset: 0x24b
// Size: 0x45
function function_c4873dab195cf2fb( usable, player )
{
    if ( isdefined( usable.var_1e6940caec363c36 ) )
    {
        result = [[ usable.var_1e6940caec363c36 ]]( usable, player );
        return result;
    }
    
    return 1;
}

