#using script_25a8fa2ac8997425;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\values;

#namespace zm_bgb_perkaholic;

// Namespace zm_bgb_perkaholic
// Params 0, eflags: 0x5
// Checksum 0x7e04943c, Offset: 0xa3
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "perkaholic", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_perkaholic
// Params 0
// Checksum 0xa0f7f0d7, Offset: 0xc8
// Size: 0x21
function __init__()
{
    bgb::register( "perkaholic", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_perkaholic
// Params 0
// Checksum 0x5786f3d0, Offset: 0xf1
// Size: 0x22
function activation()
{
    self endon( #"disconnect" );
    zombie_perks::function_a0329bb1c47eda09();
    bgb::do_one_shot_use( "perkaholic" );
    waitframe();
}

// Namespace zm_bgb_perkaholic
// Params 0
// Checksum 0x9b75fcec, Offset: 0x11b
// Size: 0x1f, Type: bool
function validation()
{
    if ( zombie_perks::function_cda78d45986a51a0() || !val::get( "allow_zm_perks" ) )
    {
        return false;
    }
    
    return true;
}

