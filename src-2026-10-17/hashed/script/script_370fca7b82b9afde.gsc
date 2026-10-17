#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_771edb71374fd13e;

// Namespace namespace_771edb71374fd13e
// Params 0, eflags: 0x5
// Checksum 0x922b0848, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_bde6704db4d1bae0", undefined, &function_fb3b08378fc5f513, undefined );
}

// Namespace namespace_771edb71374fd13e
// Params 0
// Checksum 0x343b11f2, Offset: 0x97
// Size: 0xa
function function_fb3b08378fc5f513()
{
    level thread function_75595be4d36b8bc2();
}

// Namespace namespace_771edb71374fd13e
// Params 0
// Checksum 0xf6631fd9, Offset: 0xa9
// Size: 0x1c
function function_75595be4d36b8bc2()
{
    zm_relics::register_relic_functions( #"only_critical_damage", &function_22b7cc463678af18, &function_d7912624ee5ef50f );
}

// Namespace namespace_771edb71374fd13e
// Params 0
// Checksum 0x83b696f8, Offset: 0xcd
// Size: 0x46
function function_22b7cc463678af18()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_55a9a58c14db7f76" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_771edb71374fd13e
// Params 0
// Checksum 0x76f9205c, Offset: 0x11b
// Size: 0x46
function function_d7912624ee5ef50f()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_bc21eef9c580b8f6" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x52>" );
    #/
}

