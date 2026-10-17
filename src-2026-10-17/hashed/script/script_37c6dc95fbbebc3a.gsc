#using script_1c6bb6c699d4cbdc;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;

#namespace auto_drone_mp;

// Namespace auto_drone_mp
// Params 0, eflags: 0x5
// Checksum 0x4e5457ae, Offset: 0x84
// Size: 0x38
function private autoexec main()
{
    killstreaks::registerkillstreak( "auto_drone", &auto_drone::function_948ef213e45dfc60 );
    utility::registersharedfunc( #"auto_drone", #"attachxrays", &auto_drone_attachxrays );
    auto_drone::init();
}

// Namespace auto_drone_mp
// Params 1
// Checksum 0x90f33e0a, Offset: 0xc4
// Size: 0x22
function auto_drone_attachxrays( autodrone )
{
    autodrone setentityhudoutlinedata( 3, autodrone.team );
    return autodrone;
}

