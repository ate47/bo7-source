#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_no_ammo_cache;

// Namespace zm_relic_no_ammo_cache
// Params 0, eflags: 0x5
// Checksum 0xd94b7f4b, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_61a092c8b5babe9d", undefined, &init_relic_no_ammo_cache, undefined );
}

// Namespace zm_relic_no_ammo_cache
// Params 0
// Checksum 0xff645992, Offset: 0x97
// Size: 0xa
function init_relic_no_ammo_cache()
{
    level thread function_705bff51974bc42f();
}

// Namespace zm_relic_no_ammo_cache
// Params 0
// Checksum 0xcec665d4, Offset: 0xa9
// Size: 0x1c
function function_705bff51974bc42f()
{
    zm_relics::register_relic_functions( #"no_ammo_cache", &function_9f5d431810a6767, &function_55145fa6720e53a2 );
}

// Namespace zm_relic_no_ammo_cache
// Params 0
// Checksum 0x468153f6, Offset: 0xcd
// Size: 0x46
function function_9f5d431810a6767()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_no_ammo_cache" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_no_ammo_cache
// Params 0
// Checksum 0x40b5d2e7, Offset: 0x11b
// Size: 0x46
function function_55145fa6720e53a2()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_no_ammo_cache" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x45>" );
    #/
}

