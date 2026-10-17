#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;

#namespace zm_bgb_cache_back;

// Namespace zm_bgb_cache_back
// Params 0, eflags: 0x5
// Checksum 0x2d0c676, Offset: 0x9e
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "cache_back", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_cache_back
// Params 0
// Checksum 0x4ab9efe4, Offset: 0xc3
// Size: 0x21
function __init__()
{
    bgb::register( "cache_back", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_cache_back
// Params 0
// Checksum 0xa8c536ab, Offset: 0xec
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "full_ammo" );
}

// Namespace zm_bgb_cache_back
// Params 0
// Checksum 0x38d87dcd, Offset: 0x102
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

