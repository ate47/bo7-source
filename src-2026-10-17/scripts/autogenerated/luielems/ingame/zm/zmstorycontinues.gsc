#using script_63258e3c8c400b7a;

#namespace zmstorycontinues;

// Namespace zmstorycontinues
// Params 0
// Checksum 0xd793c7a1, Offset: 0x8a
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMStoryContinues", #"zmstorycontinues" );
}

// Namespace zmstorycontinues
// Params 2
// Checksum 0xc46b8b2b, Offset: 0xa9
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmstorycontinues
// Params 1
// Checksum 0x208cf79d, Offset: 0xd0
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmstorycontinues
// Params 1
// Checksum 0x30d3e45c, Offset: 0xed
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmstorycontinues
// Params 2
// Checksum 0x81f47949, Offset: 0x10a
// Size: 0x22
function function_2a405f2305b41d0d( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace zmstorycontinues
// Params 2
// Checksum 0x18fd28f0, Offset: 0x134
// Size: 0x22
function function_2a405c2305b41674( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

// Namespace zmstorycontinues
// Params 2
// Checksum 0xb3b5773d, Offset: 0x15e
// Size: 0x22
function function_6b01c1b38f973ca8( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 3, value );
}

// Namespace zmstorycontinues
// Params 2
// Checksum 0xf4150dea, Offset: 0x188
// Size: 0x22
function function_258ab16a0328f235( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 4, value );
}

