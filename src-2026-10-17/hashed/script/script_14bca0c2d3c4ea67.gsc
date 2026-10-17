#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_a0181e8fa6bed3;

// Namespace namespace_a0181e8fa6bed3
// Params 0, eflags: 0x5
// Checksum 0x52ae866a, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_43909687ec89a361", undefined, &function_a321b2bfc6faf8c2, undefined );
}

// Namespace namespace_a0181e8fa6bed3
// Params 0
// Checksum 0xb6a4dcd9, Offset: 0x97
// Size: 0xa
function function_a321b2bfc6faf8c2()
{
    level thread function_7d3f00b61b9a5607();
}

// Namespace namespace_a0181e8fa6bed3
// Params 0
// Checksum 0x4a23427, Offset: 0xa9
// Size: 0x1c
function function_7d3f00b61b9a5607()
{
    zm_relics::register_relic_functions( #"hash_5bb600c492d2656e", &function_8bdd48a10798cebb, &function_f6db951dbfcfcb56 );
}

// Namespace namespace_a0181e8fa6bed3
// Params 0
// Checksum 0xd6b3b402, Offset: 0xcd
// Size: 0x46
function function_8bdd48a10798cebb()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_fc4a6888094c2e9b" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_a0181e8fa6bed3
// Params 0
// Checksum 0xd9828adc, Offset: 0x11b
// Size: 0x46
function function_f6db951dbfcfcb56()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_3e65155aca0efc1b" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x51>" );
    #/
}

