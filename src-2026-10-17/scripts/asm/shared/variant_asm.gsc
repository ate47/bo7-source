#using scripts\asm\asm;

#namespace variant_asm;

// Namespace variant_asm
// Params 3
// Checksum 0xb13e02bc, Offset: 0xc1
// Size: 0x13c
function register_anim_variant( anim_id, selector_fn, on_complete_fn )
{
    if ( !isdefined( level.variant_type_max ) )
    {
        level.variant_type_max = [];
    }
    
    if ( !isdefined( level.variant_type_selector ) )
    {
        level.variant_type_selector = [];
    }
    
    if ( !isdefined( level.variant_type_on_complete ) )
    {
        level.variant_type_on_complete = [];
    }
    
    if ( !isdefined( level.variant_type_max[ self.animsetname ] ) )
    {
        level.variant_type_max[ self.animsetname ] = [];
    }
    
    if ( !isdefined( level.variant_type_selector[ self.animsetname ] ) )
    {
        level.variant_type_selector[ self.animsetname ] = [];
    }
    
    assert( !isdefined( level.variant_type_max[ self.animsetname ][ anim_id ] ), "<dev string:x24>" + self.animsetname + "<dev string:x36>" + anim_id + "<dev string:x44>" );
    level.variant_type_max[ self.animsetname ][ anim_id ] = [];
    level.variant_type_selector[ self.animsetname ][ anim_id ] = selector_fn;
    level.variant_type_on_complete[ self.animsetname ][ anim_id ] = on_complete_fn;
}

// Namespace variant_asm
// Params 3
// Checksum 0xaef6384e, Offset: 0x205
// Size: 0xb6
function function_6ffb0fbe59bdcb82( anim_id, base_struct, num_variants )
{
    assert( isdefined( level.variant_type_max[ self.animsetname ] ) );
    
    if ( !isdefined( level.variant_type_max[ self.animsetname ][ anim_id ] ) )
    {
        level.variant_type_max[ self.animsetname ][ anim_id ] = [];
    }
    
    index = level.variant_type_max[ self.animsetname ][ anim_id ].size;
    base_struct.num_variants = num_variants;
    level.variant_type_max[ self.animsetname ][ anim_id ][ index ] = base_struct;
}

// Namespace variant_asm
// Params 1
// Checksum 0xa7acdbc9, Offset: 0x2c3
// Size: 0x1a
function function_1f4998dd94d74b28( anim_id )
{
    self.variant_cache[ anim_id ] = [];
}

// Namespace variant_asm
// Params 1
// Checksum 0x467e6ca1, Offset: 0x2e5
// Size: 0x237
function function_1e9b4a2fe400d128( anim_id )
{
    function_1f4998dd94d74b28( anim_id );
    self.variant_cache[ anim_id ][ "alias" ] = "";
    animset = self.animsetname;
    
    if ( !( isdefined( level.variant_type_max[ self.animsetname ] ) && isdefined( level.variant_type_max[ self.animsetname ] ) ) )
    {
        animset = self findoverridearchetype( "default" );
    }
    
    assert( isdefined( level.variant_type_max[ animset ][ anim_id ] ) );
    assert( isdefined( level.variant_type_selector[ animset ][ anim_id ] ) );
    
    foreach ( variant_type in level.variant_type_max[ animset ][ anim_id ] )
    {
        alias = [[ level.variant_type_selector[ animset ][ anim_id ] ]]( variant_type );
        
        if ( isdefined( alias ) )
        {
            self.variant_cache[ anim_id ][ "alias" ] = alias;
            
            if ( isdefined( variant_type.num_variants ) )
            {
                variant_index = randomint( variant_type.num_variants );
                self.variant_cache[ anim_id ][ "variant_index" ] = variant_index;
                self.variant_cache[ anim_id ][ "alias" ] = self.variant_cache[ anim_id ][ "alias" ] + "_v" + ( variant_index < 10 ? "0" : "" ) + string( variant_index );
            }
            
            if ( isdefined( level.variant_type_on_complete[ animset ][ anim_id ] ) )
            {
                self [[ level.variant_type_on_complete[ animset ][ anim_id ] ]]( self.variant_cache[ anim_id ][ "alias" ] );
            }
            
            return self.variant_cache[ anim_id ][ "alias" ];
        }
    }
    
    assertmsg( "<dev string:x58>" + anim_id );
    return "failed_anim_variant";
}

// Namespace variant_asm
// Params 3
// Checksum 0xa2cc39e2, Offset: 0x525
// Size: 0x66
function function_e1be2607c10431a8( asmname, statename, params )
{
    anim_id = params;
    
    if ( !isdefined( self.variant_cache[ anim_id ][ "alias" ] ) )
    {
        function_1e9b4a2fe400d128( anim_id );
    }
    
    return asm::asm_lookupanimfromalias( statename, self.variant_cache[ anim_id ][ "alias" ] );
}

// Namespace variant_asm
// Params 3
// Checksum 0x5bf46b4, Offset: 0x594
// Size: 0x61
function function_fc41ef48ceb7504( asmname, statename, params )
{
    anim_id = params;
    assert( isdefined( self.variant_cache[ anim_id ][ "<dev string:x9f>" ] ) );
    return asm::asm_lookupanimfromalias( statename, self.variant_cache[ anim_id ][ "alias" ] );
}

// Namespace variant_asm
// Params 3
// Checksum 0x368dcfae, Offset: 0x5fe
// Size: 0x68
function function_17a1e2617269a304( asmname, statename, params )
{
    anim_id = params;
    
    if ( !isdefined( self.variant_cache[ anim_id ][ "alias" ] ) )
    {
        return asm::asm_chooseanim( asmname, statename, undefined );
    }
    
    return asm::asm_lookupanimfromalias( statename, self.variant_cache[ anim_id ][ "alias" ] );
}

