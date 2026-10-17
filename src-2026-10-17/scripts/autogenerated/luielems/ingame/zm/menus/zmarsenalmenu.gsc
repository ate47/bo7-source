#using script_63258e3c8c400b7a;

#namespace zmarsenalmenu;

// Namespace zmarsenalmenu
// Params 0
// Checksum 0x5541aa2f, Offset: 0x87
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMArsenalMenu", #"zmarsenalmenu" );
}

// Namespace zmarsenalmenu
// Params 2
// Checksum 0x8bb33c1d, Offset: 0xa6
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmarsenalmenu
// Params 1
// Checksum 0x6f5440ab, Offset: 0xcd
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmarsenalmenu
// Params 1
// Checksum 0x7f0b536a, Offset: 0xea
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

