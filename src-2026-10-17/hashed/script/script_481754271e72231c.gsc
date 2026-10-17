#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_immolation_liquidation;

// Namespace zm_bgb_immolation_liquidation
// Params 0, eflags: 0x5
// Checksum 0x3477ae80, Offset: 0xaa
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "immolation_liquidation", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_immolation_liquidation
// Params 0
// Checksum 0x61c2e7ef, Offset: 0xcf
// Size: 0x21
function __init__()
{
    bgb::register( "immolation_liquidation", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_immolation_liquidation
// Params 0
// Checksum 0xb0825ef6, Offset: 0xf8
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "fire_sale" );
}

// Namespace zm_bgb_immolation_liquidation
// Params 0
// Checksum 0x11a13980, Offset: 0x10e
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

