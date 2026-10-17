#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_85631793772f11db;

// Namespace namespace_85631793772f11db
// Params 0, eflags: 0x5
// Checksum 0x775d60a4, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_977ffa807a76f281", undefined, &function_2eaed64df9f77528, undefined );
}

// Namespace namespace_85631793772f11db
// Params 0
// Checksum 0xcf7bc0c1, Offset: 0x97
// Size: 0xa
function function_2eaed64df9f77528()
{
    level thread function_e15ccbee1a555c87();
}

// Namespace namespace_85631793772f11db
// Params 0
// Checksum 0xed15fed6, Offset: 0xa9
// Size: 0x1c
function function_e15ccbee1a555c87()
{
    zm_relics::register_relic_functions( #"no_self_revives", &function_225cc3a0aa8c7a63, &function_862c5ca01462f51e );
}

// Namespace namespace_85631793772f11db
// Params 0
// Checksum 0x903ede14, Offset: 0xcd
// Size: 0x46
function function_225cc3a0aa8c7a63()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_36ef036793a13743" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_85631793772f11db
// Params 0
// Checksum 0x55399e07, Offset: 0x11b
// Size: 0x46
function function_862c5ca01462f51e()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_786cc79d952b8fc3" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x46>" );
    #/
}

