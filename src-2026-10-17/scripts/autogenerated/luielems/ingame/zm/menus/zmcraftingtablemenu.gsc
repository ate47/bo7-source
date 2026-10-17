#using script_63258e3c8c400b7a;

#namespace zmcraftingtablemenu;

// Namespace zmcraftingtablemenu
// Params 0
// Checksum 0xc98e66f5, Offset: 0x8d
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMCraftingTableMenu", #"zmcraftingtablemenu" );
}

// Namespace zmcraftingtablemenu
// Params 2
// Checksum 0x3786e0b9, Offset: 0xac
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmcraftingtablemenu
// Params 1
// Checksum 0xd3619c0f, Offset: 0xd3
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmcraftingtablemenu
// Params 1
// Checksum 0xc33e8fce, Offset: 0xf0
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

