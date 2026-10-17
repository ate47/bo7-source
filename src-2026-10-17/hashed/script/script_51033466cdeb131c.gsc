#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\mp\zm\points;

#namespace zm_bgb_gift_card;

// Namespace zm_bgb_gift_card
// Params 0, eflags: 0x5
// Checksum 0xff2192f8, Offset: 0xa6
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "gift_card", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_gift_card
// Params 0
// Checksum 0x6b186928, Offset: 0xcb
// Size: 0x31
function __init__()
{
    bgb::register( "gift_card", "activated", 1, undefined, undefined, &validation, &activation );
    points::function_e2608820bbea3a5c( #"bgb_gift_card" );
}

// Namespace zm_bgb_gift_card
// Params 0
// Checksum 0xa3055e73, Offset: 0x104
// Size: 0x45
function activation()
{
    scoreparams = spawnstruct();
    scoreparams.scoreevent = #"bgb_gift_card";
    callback::callback( "zombie_score_event", scoreparams );
    self playsoundtoplayer( #"hash_ae149abdaf474bfc", self );
}

// Namespace zm_bgb_gift_card
// Params 0
// Checksum 0xfed803c0, Offset: 0x151
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

