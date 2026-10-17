#using script_63258e3c8c400b7a;

#namespace objectivecompletehud;

// Namespace objectivecompletehud
// Params 0
// Checksum 0xb8732f02, Offset: 0x8e
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "Objectivecompletehud", #"objectivecompletehud" );
}

// Namespace objectivecompletehud
// Params 2
// Checksum 0x2072ecaa, Offset: 0xad
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace objectivecompletehud
// Params 1
// Checksum 0xc495901c, Offset: 0xd4
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace objectivecompletehud
// Params 1
// Checksum 0xd4ca83dd, Offset: 0xf1
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace objectivecompletehud
// Params 2
// Checksum 0x7759944c, Offset: 0x10e
// Size: 0x22
function function_1faee175fc3e0f1e( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

