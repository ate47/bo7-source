#using script_63258e3c8c400b7a;

#namespace zmvote;

// Namespace zmvote
// Params 0
// Checksum 0xa2292799, Offset: 0x80
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMVote", #"zmvote" );
}

// Namespace zmvote
// Params 2
// Checksum 0x61961f36, Offset: 0x9f
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmvote
// Params 1
// Checksum 0x85716380, Offset: 0xc6
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmvote
// Params 1
// Checksum 0x952e7041, Offset: 0xe3
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmvote
// Params 2
// Checksum 0x6fa36649, Offset: 0x100
// Size: 0x22
function set_vote_status( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace zmvote
// Params 2
// Checksum 0x5d684882, Offset: 0x12a
// Size: 0x22
function function_f16299e8e4d91cc( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

// Namespace zmvote
// Params 2
// Checksum 0x1ce4f7f4, Offset: 0x154
// Size: 0x22
function function_3894d2005034cb81( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 3, value );
}

// Namespace zmvote
// Params 2
// Checksum 0x870dd1c3, Offset: 0x17e
// Size: 0x22
function set_vote_time_remaining( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 4, value );
}

