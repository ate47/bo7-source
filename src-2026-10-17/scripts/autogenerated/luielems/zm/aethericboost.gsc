#using script_63258e3c8c400b7a;

#namespace aethericboost;

// Namespace aethericboost
// Params 0
// Checksum 0xe99f9983, Offset: 0x87
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "AethericBoost", #"aethericboost" );
}

// Namespace aethericboost
// Params 2
// Checksum 0x2fa6a097, Offset: 0xa6
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace aethericboost
// Params 1
// Checksum 0xcb41dc21, Offset: 0xcd
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace aethericboost
// Params 1
// Checksum 0xdb1ecfe0, Offset: 0xea
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace aethericboost
// Params 2
// Checksum 0xb80c67c0, Offset: 0x107
// Size: 0x22
function function_8fce088b10434e8b( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace aethericboost
// Params 2
// Checksum 0xd2c2528d, Offset: 0x131
// Size: 0x22
function set_splash_visible( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

// Namespace aethericboost
// Params 2
// Checksum 0x1a9d07e7, Offset: 0x15b
// Size: 0x22
function set_description_visible( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 3, value );
}

// Namespace aethericboost
// Params 2
// Checksum 0xb03bf7b4, Offset: 0x185
// Size: 0x22
function set_current_level( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 4, value );
}

// Namespace aethericboost
// Params 2
// Checksum 0x73debab6, Offset: 0x1af
// Size: 0x22
function set_upgrade_desc( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 5, value );
}

