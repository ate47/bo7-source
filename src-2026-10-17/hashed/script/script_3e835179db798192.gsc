#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_no_arsenal;

// Namespace zm_relic_no_arsenal
// Params 0, eflags: 0x5
// Checksum 0x4337826d, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_7759fd5834dc2894", undefined, &init_relic_no_arsenal, undefined );
}

// Namespace zm_relic_no_arsenal
// Params 0
// Checksum 0x2d77519a, Offset: 0x97
// Size: 0xa
function init_relic_no_arsenal()
{
    level thread function_5271f176b46d5cf6();
}

// Namespace zm_relic_no_arsenal
// Params 0
// Checksum 0x863fbc01, Offset: 0xa9
// Size: 0x1c
function function_5271f176b46d5cf6()
{
    zm_relics::register_relic_functions( #"no_arsenal", &function_80c53d48928c8094, &function_927a34c97a3e6adb );
}

// Namespace zm_relic_no_arsenal
// Params 0
// Checksum 0xe719cecb, Offset: 0xcd
// Size: 0x46
function function_80c53d48928c8094()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_no_arsenal" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_no_arsenal
// Params 0
// Checksum 0x310244fe, Offset: 0x11b
// Size: 0x46
function function_927a34c97a3e6adb()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_no_arsenal" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x41>" );
    #/
}

