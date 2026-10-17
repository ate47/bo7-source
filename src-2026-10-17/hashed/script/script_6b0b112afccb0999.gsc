#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_whos_keeping_score;

// Namespace zm_bgb_whos_keeping_score
// Params 0, eflags: 0x5
// Checksum 0xc7567757, Offset: 0xaa
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "whos_keeping_score", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_whos_keeping_score
// Params 0
// Checksum 0x6a453dd2, Offset: 0xcf
// Size: 0x21
function __init__()
{
    bgb::register( "whos_keeping_score", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_whos_keeping_score
// Params 0
// Checksum 0x6f97dd67, Offset: 0xf8
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "double_points" );
}

// Namespace zm_bgb_whos_keeping_score
// Params 0
// Checksum 0x35c4b09d, Offset: 0x10e
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

