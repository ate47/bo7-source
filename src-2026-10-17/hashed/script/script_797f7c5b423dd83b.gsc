#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_cd11ac6b11092c64;

// Namespace namespace_cd11ac6b11092c64
// Params 0, eflags: 0x5
// Checksum 0x1d418e17, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_491876eb20559a1a", undefined, &function_bec1ffb3c0a1ca47, undefined );
}

// Namespace namespace_cd11ac6b11092c64
// Params 0
// Checksum 0x4fd0c9c8, Offset: 0x97
// Size: 0xa
function function_bec1ffb3c0a1ca47()
{
    level thread function_d1b25e93d7f7ee20();
}

// Namespace namespace_cd11ac6b11092c64
// Params 0
// Checksum 0x79e8fbf9, Offset: 0xa9
// Size: 0x1c
function function_d1b25e93d7f7ee20()
{
    zm_relics::register_relic_functions( #"hash_6338753196da732b", &function_9d41b22bb38f58ee, &function_c9e4f7b97bde67ed );
}

// Namespace namespace_cd11ac6b11092c64
// Params 0
// Checksum 0x88c02a87, Offset: 0xcd
// Size: 0x46
function function_9d41b22bb38f58ee()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_545ec0b85eae52fc" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_cd11ac6b11092c64
// Params 0
// Checksum 0xd1557462, Offset: 0x11b
// Size: 0x46
function function_c9e4f7b97bde67ed()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_8d7cb05856e28f7c" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x50>" );
    #/
}

