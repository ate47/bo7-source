#using script_63258e3c8c400b7a;

#namespace augmentselectionluielem;

// Namespace augmentselectionluielem
// Params 0
// Checksum 0x176dfb9, Offset: 0x91
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "augmentSelectionLuielem", #"augmentselectionluielem" );
}

// Namespace augmentselectionluielem
// Params 2
// Checksum 0xd4ac25db, Offset: 0xb0
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace augmentselectionluielem
// Params 1
// Checksum 0x304b596d, Offset: 0xd7
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace augmentselectionluielem
// Params 1
// Checksum 0x20144aac, Offset: 0xf4
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

