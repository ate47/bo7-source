#using script_63258e3c8c400b7a;

#namespace zmboatracingmaincountdown;

// Namespace zmboatracingmaincountdown
// Params 0
// Checksum 0x9d38296e, Offset: 0x93
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMBoatRacingMainCountDown", #"zmboatracingmaincountdown" );
}

// Namespace zmboatracingmaincountdown
// Params 2
// Checksum 0x183dfd70, Offset: 0xb2
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmboatracingmaincountdown
// Params 1
// Checksum 0xfcda81c6, Offset: 0xd9
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmboatracingmaincountdown
// Params 1
// Checksum 0xec859207, Offset: 0xf6
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmboatracingmaincountdown
// Params 2
// Checksum 0xf2c6b82a, Offset: 0x113
// Size: 0x22
function set_remain_time( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace zmboatracingmaincountdown
// Params 2
// Checksum 0xdc349c93, Offset: 0x13d
// Size: 0x22
function set_countdown_description( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

