#using script_aa3bac81ad4fc8e;
#using scripts\common\system;

#namespace zm_bgb_temporal_gift;

// Namespace zm_bgb_temporal_gift
// Params 0, eflags: 0x5
// Checksum 0xf59ba5dc, Offset: 0x90
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "temporal_gift", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_temporal_gift
// Params 0
// Checksum 0xe5bdb454, Offset: 0xb5
// Size: 0x2c
function __init__()
{
    bgb::register( "temporal_gift", "event", &event, undefined, &disable );
    level.powerup_timeout_override = &temporal_gift_check;
}

// Namespace zm_bgb_temporal_gift
// Params 1, eflags: 0x4
// Checksum 0x13dce34, Offset: 0xe9
// Size: 0x2f
function private temporal_gift_check( wait_time )
{
    if ( bgb::is_enabled( "temporal_gift" ) )
    {
        wait_time += 30;
        self notify( #"hash_7bbf1a12d2ccc1ea" );
    }
    
    return wait_time;
}

// Namespace zm_bgb_temporal_gift
// Params 0
// Checksum 0x9575f023, Offset: 0x121
// Size: 0x33
function event()
{
    self endon( #"disconnect" );
    self endon( #"kill_temporal_gift" );
    self waittill( #"hash_7bbf1a12d2ccc1ea" );
    bgb::do_one_shot_use( "temporal_gift" );
}

// Namespace zm_bgb_temporal_gift
// Params 0
// Checksum 0x6ba5c243, Offset: 0x15c
// Size: 0xe
function disable()
{
    self notify( #"kill_temporal_gift" );
}

