#using scripts\common\system;
#using scripts\engine\utility;

#namespace ww_raygun;

// Namespace ww_raygun
// Params 0, eflags: 0x5
// Checksum 0x98f469fd, Offset: 0x81
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"ww_raygun", undefined, undefined, &post_main );
}

// Namespace ww_raygun
// Params 0, eflags: 0x4
// Checksum 0xe0b4dc1a, Offset: 0xa2
// Size: 0x1b
function private post_main()
{
    utility::callsharedfunc( #"ww_raygun", #"init" );
}

