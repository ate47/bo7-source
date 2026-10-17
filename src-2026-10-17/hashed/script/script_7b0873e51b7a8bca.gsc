#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_ec9dd589bdf6cdf4;

// Namespace namespace_ec9dd589bdf6cdf4
// Params 0, eflags: 0x5
// Checksum 0xed2d34e2, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_aca54b37df2a6a45", undefined, &function_8801ba887cd5aeda, undefined );
}

// Namespace namespace_ec9dd589bdf6cdf4
// Params 0
// Checksum 0x72cc4e80, Offset: 0x97
// Size: 0xa
function function_8801ba887cd5aeda()
{
    level thread function_648ec1516ce2eddf();
}

// Namespace namespace_ec9dd589bdf6cdf4
// Params 0
// Checksum 0x8ccd138c, Offset: 0xa9
// Size: 0x1c
function function_648ec1516ce2eddf()
{
    zm_relics::register_relic_functions( #"hash_d8b0d1a0c6dd54d6", &function_760f29ca18674f8f, &function_ce9d639a1832ec6a );
}

// Namespace namespace_ec9dd589bdf6cdf4
// Params 0
// Checksum 0x543f7096, Offset: 0xcd
// Size: 0x72
function function_760f29ca18674f8f()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        var_b43c25da64eeab97 = level.zm_relic_modifiers[ #"hash_d8b0d1a0c6dd54d6" ].var_11f4dca635b1fc55;
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_16b8fb81542b725d", var_b43c25da64eeab97 );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_ec9dd589bdf6cdf4
// Params 0
// Checksum 0xef200bee, Offset: 0x147
// Size: 0x47
function function_ce9d639a1832ec6a()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_2cda259edf2ea2dd" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x4c>" );
    #/
}

