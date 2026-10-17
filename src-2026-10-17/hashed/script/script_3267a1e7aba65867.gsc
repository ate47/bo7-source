#using script_aa3bac81ad4fc8e;
#using scripts\common\system;

#namespace zm_bgb_elementary;

// Namespace zm_bgb_elementary
// Params 0, eflags: 0x5
// Checksum 0x81334698, Offset: 0x8c
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "elementary", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_elementary
// Params 0
// Checksum 0x1b6c029, Offset: 0xb1
// Size: 0x20
function __init__()
{
    bgb::register( "elementary", "time", 180, &enable, &disable, undefined );
}

// Namespace zm_bgb_elementary
// Params 0
// Checksum 0x5e376e08, Offset: 0xd9
// Size: 0x2
function enable()
{
    
}

// Namespace zm_bgb_elementary
// Params 0
// Checksum 0xe2d2eb6b, Offset: 0xe3
// Size: 0x2
function disable()
{
    
}

