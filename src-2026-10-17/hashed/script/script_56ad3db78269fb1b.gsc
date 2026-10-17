#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_on_the_house;

// Namespace zm_bgb_on_the_house
// Params 0, eflags: 0x5
// Checksum 0xce874373, Offset: 0xa0
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "on_the_house", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_on_the_house
// Params 0
// Checksum 0xa3b024c4, Offset: 0xc5
// Size: 0x21
function __init__()
{
    bgb::register( "on_the_house", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_on_the_house
// Params 0
// Checksum 0x4fde1f76, Offset: 0xee
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "free_perk" );
}

// Namespace zm_bgb_on_the_house
// Params 0
// Checksum 0x4b10e2d7, Offset: 0x104
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

