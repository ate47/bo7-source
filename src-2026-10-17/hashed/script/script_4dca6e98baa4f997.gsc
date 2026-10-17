#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_15205e305e6bd729;

// Namespace namespace_15205e305e6bd729
// Params 0, eflags: 0x5
// Checksum 0x7f43d61e, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_eec81d495648c42b", undefined, &function_fbe00c66335cf112, undefined );
}

// Namespace namespace_15205e305e6bd729
// Params 0
// Checksum 0x2d643467, Offset: 0x97
// Size: 0xa
function function_fbe00c66335cf112()
{
    level thread function_a81d86d4b689834d();
}

// Namespace namespace_15205e305e6bd729
// Params 0
// Checksum 0xaea42236, Offset: 0xa9
// Size: 0x1c
function function_a81d86d4b689834d()
{
    zm_relics::register_relic_functions( #"hash_3385fa4802fa103e", &function_b17cd266c7c37a29, &function_7ae6297455c30ecc );
}

// Namespace namespace_15205e305e6bd729
// Params 0
// Checksum 0xb2f0728c, Offset: 0xcd
// Size: 0x46
function function_b17cd266c7c37a29()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_8ecfa4a159b4a6b1" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_15205e305e6bd729
// Params 0
// Checksum 0xe4b62a69, Offset: 0x11b
// Size: 0x46
function function_7ae6297455c30ecc()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_b39effb9248ec731" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x51>" );
    #/
}

