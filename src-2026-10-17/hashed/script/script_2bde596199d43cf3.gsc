#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\mp\wallbuy;

#namespace zm_bgb_wall_power;

// Namespace zm_bgb_wall_power
// Params 0, eflags: 0x5
// Checksum 0xb6a1f044, Offset: 0x8d
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "wall_power", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0x790d15f6, Offset: 0xb2
// Size: 0x2a
function __init__()
{
    bgb::register( "wall_power", "event", &event, undefined, &disable );
    wallbuy::register_upgrade_weapon( &wall_power_upgrade_weapon );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xf5747256, Offset: 0xe4
// Size: 0x33
function event()
{
    self endon( #"disconnect" );
    self endon( #"kill_wall_power" );
    self waittill( #"hash_1ca3f9339b98b409" );
    bgb::do_one_shot_use( "wall_power" );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xd37d293, Offset: 0x11f
// Size: 0xe
function disable()
{
    self notify( #"kill_wall_power" );
}

// Namespace zm_bgb_wall_power
// Params 1
// Checksum 0x3541a498, Offset: 0x135
// Size: 0x2d, Type: bool
function wall_power_upgrade_weapon( player )
{
    if ( player bgb::is_enabled( "wall_power" ) )
    {
        player notify( #"hash_1ca3f9339b98b409" );
        return true;
    }
    
    return false;
}

