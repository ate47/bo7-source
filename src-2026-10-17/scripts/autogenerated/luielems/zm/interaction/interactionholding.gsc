#using script_63258e3c8c400b7a;

#namespace interactionholding;

// Namespace interactionholding
// Params 0
// Checksum 0xa475b847, Offset: 0x8c
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "Interactionholding", #"interactionholding" );
}

// Namespace interactionholding
// Params 2
// Checksum 0x4b55c61c, Offset: 0xab
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace interactionholding
// Params 1
// Checksum 0xafb2baaa, Offset: 0xd2
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace interactionholding
// Params 1
// Checksum 0xbfeda96b, Offset: 0xef
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace interactionholding
// Params 2
// Checksum 0x5f63e803, Offset: 0x10c
// Size: 0x22
function set_description( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace interactionholding
// Params 2
// Checksum 0x6c0b4673, Offset: 0x136
// Size: 0x22
function set_progressfrac( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

// Namespace interactionholding
// Params 2
// Checksum 0xd4fe3750, Offset: 0x160
// Size: 0x22
function set_caption( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 3, value );
}

