#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_d1e0de55b150be0a;

// Namespace namespace_d1e0de55b150be0a
// Params 0, eflags: 0x5
// Checksum 0x4bb715c7, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_912ef24afd4946b4", undefined, &function_530cec1028dc3a47, undefined );
}

// Namespace namespace_d1e0de55b150be0a
// Params 0
// Checksum 0x4d6c5cb0, Offset: 0x97
// Size: 0xa
function function_530cec1028dc3a47()
{
    level thread function_25dde5d5610e7d46();
}

// Namespace namespace_d1e0de55b150be0a
// Params 0
// Checksum 0xe480632f, Offset: 0xa9
// Size: 0x1c
function function_25dde5d5610e7d46()
{
    zm_relics::register_relic_functions( #"zombies_explode_on_death", &function_2d883f411fd18a94, &function_c1c84cad7eaf18db );
}

// Namespace namespace_d1e0de55b150be0a
// Params 0
// Checksum 0x30cfa9, Offset: 0xcd
// Size: 0x46
function function_2d883f411fd18a94()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_2caa8db4289a072" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_d1e0de55b150be0a
// Params 0
// Checksum 0xd6a97fa2, Offset: 0x11b
// Size: 0x46
function function_c1c84cad7eaf18db()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_9eb1ad3b8dd931f2" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x4f>" );
    #/
}

