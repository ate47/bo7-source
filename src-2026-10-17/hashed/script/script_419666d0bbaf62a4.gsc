#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_ce678cba674f5118;

// Namespace namespace_ce678cba674f5118
// Params 0, eflags: 0x5
// Checksum 0x6177446f, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_734fb1760196f80e", undefined, &function_8c142224989fec9, undefined );
}

// Namespace namespace_ce678cba674f5118
// Params 0
// Checksum 0xa0abb9be, Offset: 0x97
// Size: 0xa
function function_8c142224989fec9()
{
    level thread function_856f194b5e6e467c();
}

// Namespace namespace_ce678cba674f5118
// Params 0
// Checksum 0xb032ea87, Offset: 0xa9
// Size: 0x1c
function function_856f194b5e6e467c()
{
    zm_relics::register_relic_functions( #"hash_811ac96901a51875", &function_62c2f801586ced5a, &function_bbdcd365591e6639 );
}

// Namespace namespace_ce678cba674f5118
// Params 0
// Checksum 0x5491a72, Offset: 0xcd
// Size: 0x46
function function_62c2f801586ced5a()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_a681a2a6dfb281f0" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_ce678cba674f5118
// Params 0
// Checksum 0x3a4dd4d1, Offset: 0x11b
// Size: 0x46
function function_bbdcd365591e6639()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_4268a7072b021370" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x56>" );
    #/
}

