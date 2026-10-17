#using script_63258e3c8c400b7a;

#namespace descriptionhud;

// Namespace descriptionhud
// Params 0
// Checksum 0x6ea98e6e, Offset: 0x88
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "Descriptionhud", #"descriptionhud" );
}

// Namespace descriptionhud
// Params 2
// Checksum 0x7d01ca60, Offset: 0xa7
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace descriptionhud
// Params 1
// Checksum 0x99e6b6d6, Offset: 0xce
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace descriptionhud
// Params 1
// Checksum 0x89b9a517, Offset: 0xeb
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace descriptionhud
// Params 2
// Checksum 0x6937e47f, Offset: 0x108
// Size: 0x22
function set_description( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace descriptionhud
// Params 2
// Checksum 0x40a8368a, Offset: 0x132
// Size: 0x22
function set_endtime( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

