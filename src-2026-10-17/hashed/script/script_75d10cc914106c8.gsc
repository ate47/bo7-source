#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\values;

#namespace zm_bgb_wall_power;

// Namespace zm_bgb_wall_power
// Params 0, eflags: 0x5
// Checksum 0xbbd8ca7f, Offset: 0xef
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "aftertaste", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0x355ae771, Offset: 0x114
// Size: 0x31
function __init__()
{
    bgb::register( "aftertaste", "event", &event, undefined, &disable );
    bgb::register_lost_perk_override( "aftertaste", &lost_perk_override, 1 );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xbdd8acdb, Offset: 0x14d
// Size: 0x45
function event()
{
    self endon( #"disconnect" );
    self endon( #"kill_aftertaste" );
    val::set( "bgb_aftertaste", "show_perk_decay", 0 );
    self waittill( #"bgb_aftertaste_used" );
    bgb::do_one_shot_use( "aftertaste" );
}

// Namespace zm_bgb_wall_power
// Params 0
// Checksum 0xa55f43b, Offset: 0x19a
// Size: 0x1f
function disable()
{
    val::reset( "bgb_aftertaste", "show_perk_decay" );
    self notify( #"kill_aftertaste" );
}

// Namespace zm_bgb_wall_power
// Params 1
// Checksum 0xddc19e5c, Offset: 0x1c1
// Size: 0x50, Type: bool
function lost_perk_override( params )
{
    if ( bgb::is_enabled( "aftertaste" ) && params.reason != "last_stand_revived_quick_revive_augment" )
    {
        params.reason = "last_stand_bgb";
        self notify( #"bgb_aftertaste_used" );
        return true;
    }
    
    return false;
}

