#namespace namespace_dce2b2614ee05427;

// Namespace namespace_dce2b2614ee05427
// Params 3
// Checksum 0x65d8095b, Offset: 0x81
// Size: 0x164
function create_category( var_7bdff97009197402, var_c64b7d522b7f4728 = 0, var_214e4112306fa828 = 0 )
{
    assert( isdefined( level ) );
    
    if ( !isdefined( level.var_6265b35248049006 ) )
    {
        level.var_6265b35248049006 = spawnstruct();
        level.var_6265b35248049006.categories = [];
        level.var_6265b35248049006.var_6e5b98a5775cb1fd = 1;
    }
    
    if ( isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        assert( var_214e4112306fa828 );
        return level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    }
    
    level.var_6265b35248049006.categories[ var_7bdff97009197402 ] = spawnstruct();
    category = level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    category.objarray = [];
    category.intid = level.var_6265b35248049006.var_6e5b98a5775cb1fd;
    category.var_c64b7d522b7f4728 = var_c64b7d522b7f4728;
    level.var_6265b35248049006.var_6e5b98a5775cb1fd++;
    assert( level.var_6265b35248049006.var_6e5b98a5775cb1fd < 254 );
    return category;
}

// Namespace namespace_dce2b2614ee05427
// Params 1
// Checksum 0xb8c32350, Offset: 0x1ee
// Size: 0x23, Type: bool
function function_9610dcc083b0f8c8( var_7bdff97009197402 )
{
    return isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] );
}

// Namespace namespace_dce2b2614ee05427
// Params 2
// Checksum 0x40e207e9, Offset: 0x21a
// Size: 0x4d
function add( var_7bdff97009197402, obj )
{
    assert( isdefined( obj ) );
    assert( isstring( var_7bdff97009197402 ) );
    category = level function_6038b7a51a411204( var_7bdff97009197402 );
    add_helper( category, obj );
}

// Namespace namespace_dce2b2614ee05427
// Params 2
// Checksum 0xaa570de8, Offset: 0x26f
// Size: 0xb4
function add_array( var_7bdff97009197402, objarray )
{
    assert( isdefined( objarray ) );
    assert( isstring( var_7bdff97009197402 ) );
    category = level function_6038b7a51a411204( var_7bdff97009197402 );
    
    foreach ( obj in objarray )
    {
        add_helper( category, obj );
    }
}

// Namespace namespace_dce2b2614ee05427
// Params 2, eflags: 0x4
// Checksum 0x25096241, Offset: 0x32b
// Size: 0xcc
function private add_helper( category, obj )
{
    idx = category.objarray.size;
    
    if ( category.var_c64b7d522b7f4728 )
    {
        category.objarray[ idx ] = spawnstruct();
        objelement = category.objarray[ idx ];
        objelement.obj = obj;
        obj.var_93644fc0c12b68b2 = function_7dbfe73dffd45e75( category.intid, idx, obj.origin );
        return;
    }
    
    category.objarray[ idx ] = obj;
    function_7dbfe73dffd45e75( category.intid, idx, obj.origin );
}

// Namespace namespace_dce2b2614ee05427
// Params 2
// Checksum 0x26603140, Offset: 0x3ff
// Size: 0xd3
function remove( var_7bdff97009197402, obj )
{
    assert( isdefined( obj ) );
    assert( isstring( var_7bdff97009197402 ) );
    
    if ( !isdefined( level.var_6265b35248049006 ) || !isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    category = level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    
    if ( !category.var_c64b7d522b7f4728 )
    {
        assertmsg( "<dev string:x59>" );
        return;
    }
    
    if ( !isdefined( obj.var_93644fc0c12b68b2 ) )
    {
        assertmsg( "<dev string:x81>" );
        return;
    }
    
    function_1af14cbaa07f5ce2( obj.var_93644fc0c12b68b2 );
}

// Namespace namespace_dce2b2614ee05427
// Params 1
// Checksum 0x25a8155c, Offset: 0x4da
// Size: 0x131
function remove_all( var_7bdff97009197402 )
{
    assert( isstring( var_7bdff97009197402 ) );
    
    if ( !isdefined( level.var_6265b35248049006 ) || !isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        assertmsg( "<dev string:xb8>" );
        return;
    }
    
    category = level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    
    if ( !category.var_c64b7d522b7f4728 )
    {
        assertmsg( "<dev string:x59>" );
        return;
    }
    
    foreach ( obj in category.objarray )
    {
        function_1af14cbaa07f5ce2( obj.obj.var_93644fc0c12b68b2 );
    }
    
    level.var_6265b35248049006.categories[ var_7bdff97009197402 ] = undefined;
}

// Namespace namespace_dce2b2614ee05427
// Params 4
// Checksum 0x788f3e33, Offset: 0x613
// Size: 0x106
function move( var_7bdff97009197402, obj, movetoorigin, previousorigin )
{
    assert( isdefined( obj ) );
    assert( isstring( var_7bdff97009197402 ) );
    assert( isdefined( movetoorigin ) );
    
    if ( !isdefined( previousorigin ) )
    {
        previousorigin = obj.origin;
    }
    
    if ( !isdefined( level.var_6265b35248049006 ) || !isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        assertmsg( "<dev string:xf1>" );
        return;
    }
    
    category = level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    
    if ( !category.var_c64b7d522b7f4728 )
    {
        assertmsg( "<dev string:x124>" );
        return;
    }
    
    if ( !isdefined( obj.var_93644fc0c12b68b2 ) )
    {
        assertmsg( "<dev string:x14a>" );
        return;
    }
    
    function_46480eb294cb5313( obj.var_93644fc0c12b68b2, movetoorigin );
}

// Namespace namespace_dce2b2614ee05427
// Params 3
// Checksum 0x8767aefb, Offset: 0x721
// Size: 0x13f
function query( var_7bdff97009197402, origin, radius )
{
    if ( !isdefined( level.var_6265b35248049006 ) || !isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        return [];
    }
    
    category = level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
    queryarray = function_37c8b3d275041e4a( category.intid, origin, radius );
    returnarray = [];
    
    foreach ( idx in queryarray )
    {
        if ( category.var_c64b7d522b7f4728 )
        {
            returnarray[ returnarray.size ] = category.objarray[ idx ].obj;
            continue;
        }
        
        returnarray[ returnarray.size ] = category.objarray[ idx ];
    }
    
    return returnarray;
}

// Namespace namespace_dce2b2614ee05427
// Params 1, eflags: 0x4
// Checksum 0x1b675816, Offset: 0x869
// Size: 0x55
function private function_6038b7a51a411204( var_7bdff97009197402 )
{
    if ( !isdefined( level.var_6265b35248049006 ) || !isdefined( level.var_6265b35248049006.categories[ var_7bdff97009197402 ] ) )
    {
        return create_category( var_7bdff97009197402 );
    }
    
    return level.var_6265b35248049006.categories[ var_7bdff97009197402 ];
}

