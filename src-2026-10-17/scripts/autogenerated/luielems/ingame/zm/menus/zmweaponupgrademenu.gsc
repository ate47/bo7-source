#using script_63258e3c8c400b7a;

#namespace zmweaponupgrademenu;

// Namespace zmweaponupgrademenu
// Params 0
// Checksum 0x6f896d36, Offset: 0x8d
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMWeaponUpgradeMenu", #"zmweaponupgrademenu" );
}

// Namespace zmweaponupgrademenu
// Params 2
// Checksum 0xfd8f3843, Offset: 0xac
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmweaponupgrademenu
// Params 1
// Checksum 0x196844f5, Offset: 0xd3
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmweaponupgrademenu
// Params 1
// Checksum 0x9375734, Offset: 0xf0
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

