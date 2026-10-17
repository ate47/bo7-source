#using script_aa3bac81ad4fc8e;
#using scripts\common\powerups;
#using scripts\common\system;
#using scripts\mp\supers;

#namespace zm_bgb_power_keg;

// Namespace zm_bgb_power_keg
// Params 0, eflags: 0x5
// Checksum 0xfc33df5a, Offset: 0x9e
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "power_keg", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_power_keg
// Params 0
// Checksum 0xa4111508, Offset: 0xc3
// Size: 0x21
function __init__()
{
    bgb::register( "power_keg", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_power_keg
// Params 0
// Checksum 0xd9da23cd, Offset: 0xec
// Size: 0xe
function activation()
{
    thread powerups::powerup_activate( "full_power" );
}

// Namespace zm_bgb_power_keg
// Params 0
// Checksum 0xc8075f71, Offset: 0x102
// Size: 0x8e, Type: bool
function validation()
{
    foreach ( player in level.players )
    {
        s_super = player supers_mp::getcurrentsuper();
        
        if ( isdefined( s_super ) )
        {
            return true;
        }
    }
    
    return false;
}

