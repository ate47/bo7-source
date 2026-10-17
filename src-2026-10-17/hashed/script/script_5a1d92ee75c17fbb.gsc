#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_b5e90a065f09deed;

// Namespace namespace_b5e90a065f09deed
// Params 0, eflags: 0x5
// Checksum 0x8256582c, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_e382295ea75b053f", undefined, &function_8db6c9a06146f826, undefined );
}

// Namespace namespace_b5e90a065f09deed
// Params 0
// Checksum 0x57bf79f6, Offset: 0x97
// Size: 0xa
function function_8db6c9a06146f826()
{
    level thread function_983a7b4684c40659();
}

// Namespace namespace_b5e90a065f09deed
// Params 0
// Checksum 0x7c18f7e5, Offset: 0xa9
// Size: 0x1c
function function_983a7b4684c40659()
{
    zm_relics::register_relic_functions( #"hash_4f7c03ce0b91409f", &function_ee4c51da3480ca74, &function_1e5f42c9edb0593b );
}

// Namespace namespace_b5e90a065f09deed
// Params 0
// Checksum 0x3cb36bac, Offset: 0xcd
// Size: 0x46
function function_ee4c51da3480ca74()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_2ec63fc4ecf657ea" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_b5e90a065f09deed
// Params 0
// Checksum 0xdc5b3248, Offset: 0x11b
// Size: 0x46
function function_1e5f42c9edb0593b()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_1d327898b0ab96a" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x46>" );
    #/
}

