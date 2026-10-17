#using script_63258e3c8c400b7a;

#namespace minimapborder;

// Namespace minimapborder
// Params 0
// Checksum 0x6446be32, Offset: 0x87
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "MinimapBorder", #"minimapborder" );
}

// Namespace minimapborder
// Params 2
// Checksum 0x9bc2fba, Offset: 0xa6
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace minimapborder
// Params 1
// Checksum 0xed5b530c, Offset: 0xcd
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace minimapborder
// Params 1
// Checksum 0xfd0440cd, Offset: 0xea
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

