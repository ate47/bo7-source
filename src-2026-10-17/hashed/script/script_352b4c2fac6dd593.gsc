#using scripts\common\system;
#using scripts\common\utility;

#namespace ww_raygun;

// Namespace ww_raygun
// Params 0, eflags: 0x5
// Checksum 0x201a98e2, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"ww_raygun", undefined, &pre_main, undefined );
}

// Namespace ww_raygun
// Params 0, eflags: 0x4
// Checksum 0x7da85a49, Offset: 0x97
// Size: 0x20
function private pre_main()
{
    utility::registersharedfunc( #"ww_raygun", #"init", &init );
}

// Namespace ww_raygun
// Params 0, eflags: 0x4
// Checksum 0xe7292b9f, Offset: 0xbf
// Size: 0x2
function private init()
{
    
}

