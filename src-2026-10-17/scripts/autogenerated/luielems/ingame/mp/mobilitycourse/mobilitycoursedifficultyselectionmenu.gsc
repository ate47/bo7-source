#using script_63258e3c8c400b7a;

#namespace mobilitycoursedifficultyselectionmenu;

// Namespace mobilitycoursedifficultyselectionmenu
// Params 0
// Checksum 0x50288a5e, Offset: 0x9f
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "MobilityCourseDifficultySelectionMenu", #"mobilitycoursedifficultyselectionmenu" );
}

// Namespace mobilitycoursedifficultyselectionmenu
// Params 2
// Checksum 0x11862bf5, Offset: 0xbe
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace mobilitycoursedifficultyselectionmenu
// Params 1
// Checksum 0xf5615743, Offset: 0xe5
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace mobilitycoursedifficultyselectionmenu
// Params 1
// Checksum 0xe53e4482, Offset: 0x102
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

