#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\mp\magicbox;

#namespace zm_bgb_crate_power;

// Namespace zm_bgb_crate_power
// Params 0, eflags: 0x5
// Checksum 0x6ced09eb, Offset: 0x8e
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "crate_power", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_crate_power
// Params 0
// Checksum 0xf0e2be7e, Offset: 0xb3
// Size: 0x2a
function __init__()
{
    bgb::register( "crate_power", "event", &event, undefined, &disable );
    magicbox::register_upgrade_weapon( &upgrade_weapon );
}

// Namespace zm_bgb_crate_power
// Params 0
// Checksum 0x3b8520af, Offset: 0xe5
// Size: 0x33
function event()
{
    self endon( #"disconnect" );
    self endon( #"kill_crate_power" );
    self waittill( #"hash_a28ea66e48e08ef6" );
    bgb::do_one_shot_use( "crate_power" );
}

// Namespace zm_bgb_crate_power
// Params 0
// Checksum 0x8d6a373f, Offset: 0x120
// Size: 0xe
function disable()
{
    self notify( #"kill_crate_power" );
}

// Namespace zm_bgb_crate_power
// Params 1
// Checksum 0xb0d6310a, Offset: 0x136
// Size: 0x2d, Type: bool
function upgrade_weapon( player )
{
    if ( player bgb::is_enabled( "crate_power" ) )
    {
        player notify( #"hash_a28ea66e48e08ef6" );
        return true;
    }
    
    return false;
}

