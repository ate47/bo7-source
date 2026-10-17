#using script_63258e3c8c400b7a;

#namespace zmperkchoicemenu;

// Namespace zmperkchoicemenu
// Params 0
// Checksum 0xb8d39a28, Offset: 0x8a
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMPerkChoiceMenu", #"zmperkchoicemenu" );
}

// Namespace zmperkchoicemenu
// Params 2
// Checksum 0x74980d12, Offset: 0xa9
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmperkchoicemenu
// Params 1
// Checksum 0x907f71a4, Offset: 0xd0
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmperkchoicemenu
// Params 1
// Checksum 0x80206265, Offset: 0xed
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

