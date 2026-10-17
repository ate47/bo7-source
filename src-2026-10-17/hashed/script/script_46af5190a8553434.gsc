#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_power_vacuum;

// Namespace zm_bgb_power_vacuum
// Params 0, eflags: 0x5
// Checksum 0x166f281c, Offset: 0x8e
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "power_vacuum", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_power_vacuum
// Params 0
// Checksum 0x145e522a, Offset: 0xb3
// Size: 0x21
function __init__()
{
    bgb::register( "power_vacuum", "time", 300, &enable, &disable, undefined );
}

// Namespace zm_bgb_power_vacuum
// Params 0
// Checksum 0x4db7c455, Offset: 0xdc
// Size: 0x17
function enable()
{
    utility::callsharedfunc( "power_vacuum", #"enable" );
}

// Namespace zm_bgb_power_vacuum
// Params 0
// Checksum 0x7a1d7e1b, Offset: 0xfb
// Size: 0x17
function disable()
{
    utility::callsharedfunc( "power_vacuum", #"disable" );
}

