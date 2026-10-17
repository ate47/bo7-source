#using script_63258e3c8c400b7a;

#namespace zmboatracingstartcountdown;

// Namespace zmboatracingstartcountdown
// Params 0
// Checksum 0x48a4fe41, Offset: 0x94
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMBoatRacingStartCountDown", #"zmboatracingstartcountdown" );
}

// Namespace zmboatracingstartcountdown
// Params 2
// Checksum 0x5135e16d, Offset: 0xb3
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmboatracingstartcountdown
// Params 1
// Checksum 0xb5d29ddb, Offset: 0xda
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmboatracingstartcountdown
// Params 1
// Checksum 0xa58d8e1a, Offset: 0xf7
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmboatracingstartcountdown
// Params 2
// Checksum 0xbbcea437, Offset: 0x114
// Size: 0x22
function set_remain_time( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

