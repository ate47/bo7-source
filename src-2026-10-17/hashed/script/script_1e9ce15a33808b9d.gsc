#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_exit_strategy;

// Namespace zm_bgb_exit_strategy
// Params 0, eflags: 0x5
// Checksum 0xc6981535, Offset: 0x94
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "exit_strategy", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_exit_strategy
// Params 0
// Checksum 0x9b19f3a1, Offset: 0xb9
// Size: 0x21
function __init__()
{
    bgb::register( "exit_strategy", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_exit_strategy
// Params 0
// Checksum 0xb64e85b8, Offset: 0xe2
// Size: 0x2f
function validation()
{
    if ( utility::issharedfuncdefined( "exit_strategy", #"validation" ) )
    {
        return utility::callsharedfunc( "exit_strategy", #"validation" );
    }
    
    return 0;
}

// Namespace zm_bgb_exit_strategy
// Params 0
// Checksum 0xbc8abeec, Offset: 0x11a
// Size: 0x2e
function activation()
{
    if ( utility::issharedfuncdefined( "exit_strategy", #"activation" ) )
    {
        utility::callsharedfunc( "exit_strategy", #"activation" );
    }
}

