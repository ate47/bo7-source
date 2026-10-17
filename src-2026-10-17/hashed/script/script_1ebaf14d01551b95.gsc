#using script_aa3bac81ad4fc8e;
#using scripts\common\system;

#namespace zm_bgb_mr_peeks;

// Namespace zm_bgb_mr_peeks
// Params 0, eflags: 0x5
// Checksum 0x4b8d0231, Offset: 0x8f
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "mr_peeks", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_mr_peeks
// Params 0
// Checksum 0x2140181c, Offset: 0xb4
// Size: 0x21
function __init__()
{
    bgb::register( "mr_peeks", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_mr_peeks
// Params 0
// Checksum 0xd57ed829, Offset: 0xdd
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_mr_peeks
// Params 0
// Checksum 0xdfbae347, Offset: 0xea
// Size: 0x2
function activation()
{
    
}

