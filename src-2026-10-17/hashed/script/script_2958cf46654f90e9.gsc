#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\mp\wallbuy;

#namespace zm_bgb_wall_to_wall_clearance;

// Namespace zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x5
// Checksum 0xf6925dcd, Offset: 0x98
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "wall_to_wall_clearance", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_wall_to_wall_clearance
// Params 0
// Checksum 0x3c9ae97a, Offset: 0xbd
// Size: 0x24
function __init__()
{
    bgb::register( "wall_to_wall_clearance", "time", 30, &enable, &disable, &validation );
}

// Namespace zm_bgb_wall_to_wall_clearance
// Params 0
// Checksum 0x4fa13e70, Offset: 0xe9
// Size: 0xe
function enable()
{
    wallbuy::register_player_weapon_cost_override( &override_wallbuy_cost );
}

// Namespace zm_bgb_wall_to_wall_clearance
// Params 0
// Checksum 0x9651582c, Offset: 0xff
// Size: 0xe
function disable()
{
    wallbuy::function_e123b2e2d54943a8( &override_wallbuy_cost );
}

// Namespace zm_bgb_wall_to_wall_clearance
// Params 0
// Checksum 0xd344cacd, Offset: 0x115
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_wall_to_wall_clearance
// Params 1
// Checksum 0xaab5ec1, Offset: 0x122
// Size: 0xe
function override_wallbuy_cost( stub )
{
    return 10;
}

