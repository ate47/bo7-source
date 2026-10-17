#using script_63258e3c8c400b7a;

#namespace zmboatracingmainui;

// Namespace zmboatracingmainui
// Params 0
// Checksum 0xa37745ff, Offset: 0x8c
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMBoatRacingMainUI", #"zmboatracingmainui" );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0x3bb7b71d, Offset: 0xab
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmboatracingmainui
// Params 1
// Checksum 0xdf50cbab, Offset: 0xd2
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmboatracingmainui
// Params 1
// Checksum 0xcf0fd86a, Offset: 0xef
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0xd14cf247, Offset: 0x10c
// Size: 0x22
function set_remain_time( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0x73a422e5, Offset: 0x136
// Size: 0x22
function set_score( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0xf13ede90, Offset: 0x160
// Size: 0x22
function function_91b602a84036d09f( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 3, value );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0xc872e3b8, Offset: 0x18a
// Size: 0x22
function set_rank( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 4, value );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0x48811f05, Offset: 0x1b4
// Size: 0x22
function set_total_player( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 5, value );
}

// Namespace zmboatracingmainui
// Params 2
// Checksum 0x877bcf91, Offset: 0x1de
// Size: 0x22
function function_d4e665cb192670c4( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 6, value );
}

