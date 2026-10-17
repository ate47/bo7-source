#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_aac3f01b28d67012;

// Namespace namespace_aac3f01b28d67012
// Params 0, eflags: 0x5
// Checksum 0x3a0a5264, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_a124d7cc68d8a188", undefined, &function_63c481970894f39, undefined );
}

// Namespace namespace_aac3f01b28d67012
// Params 0
// Checksum 0xc356938c, Offset: 0x97
// Size: 0xa
function function_63c481970894f39()
{
    level thread function_c83867ae4483cc2e();
}

// Namespace namespace_aac3f01b28d67012
// Params 0
// Checksum 0x637ab320, Offset: 0xa9
// Size: 0x1c
function function_c83867ae4483cc2e()
{
    zm_relics::register_relic_functions( #"hash_a0057b82df40c0ad", &function_d9329f905a16db48, &function_763c1e8ff402a81f );
}

// Namespace namespace_aac3f01b28d67012
// Params 0
// Checksum 0x443c9aa3, Offset: 0xcd
// Size: 0x46
function function_d9329f905a16db48()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_e632fde24edc95ba" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_aac3f01b28d67012
// Params 0
// Checksum 0x82c878ca, Offset: 0x11b
// Size: 0x46
function function_763c1e8ff402a81f()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_27b0c2185066ee3a" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x46>" );
    #/
}

