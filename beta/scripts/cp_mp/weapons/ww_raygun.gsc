#using scripts\common\system;
#using scripts\engine\utility;

#namespace ww_raygun;

// Namespace ww_raygun
// Params 0, eflags: 0x5
// Checksum 0x38ab290b, Offset: 0x80
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"ww_raygun", undefined, undefined, &post_main );
}

// Namespace ww_raygun
// Params 0, eflags: 0x4
// Checksum 0xdcdbd935, Offset: 0xa1
// Size: 0x1b
function private post_main()
{
    utility::callsharedfunc( #"ww_raygun", #"init" );
}

