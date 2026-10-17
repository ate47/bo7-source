#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_kill_joy;

// Namespace zm_bgb_kill_joy
// Params 0, eflags: 0x5
// Checksum 0xcb509ed0, Offset: 0x9d
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "kill_joy", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_kill_joy
// Params 0
// Checksum 0x35a6392c, Offset: 0xc2
// Size: 0x21
function __init__()
{
    bgb::register( "kill_joy", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_kill_joy
// Params 0
// Checksum 0x90711e67, Offset: 0xeb
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "insta_kill" );
}

// Namespace zm_bgb_kill_joy
// Params 0
// Checksum 0x55a344c8, Offset: 0x101
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

