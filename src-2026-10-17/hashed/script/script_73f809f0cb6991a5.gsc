#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_448bdf8fd7b7ecfd;

// Namespace namespace_448bdf8fd7b7ecfd
// Params 0, eflags: 0x5
// Checksum 0x8541e1a4, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_7a875af976670cf3", undefined, &function_4b0bf257eadf4b98, undefined );
}

// Namespace namespace_448bdf8fd7b7ecfd
// Params 0
// Checksum 0x10d5e73c, Offset: 0x97
// Size: 0xa
function function_4b0bf257eadf4b98()
{
    level thread function_a6710113edee7b51();
}

// Namespace namespace_448bdf8fd7b7ecfd
// Params 0
// Checksum 0xa17d828f, Offset: 0xa9
// Size: 0x1c
function function_a6710113edee7b51()
{
    zm_relics::register_relic_functions( #"hash_f3e8a30323baa1f4", &function_5aa289353840d171, &function_45bdee2354b5cbd4 );
}

// Namespace namespace_448bdf8fd7b7ecfd
// Params 0
// Checksum 0x52a67f27, Offset: 0xcd
// Size: 0x46
function function_5aa289353840d171()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_952324a16c7cdfa5" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_448bdf8fd7b7ecfd
// Params 0
// Checksum 0xae2be65c, Offset: 0x11b
// Size: 0x46
function function_45bdee2354b5cbd4()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_a6783edcfb547925" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x62>" );
    #/
}

