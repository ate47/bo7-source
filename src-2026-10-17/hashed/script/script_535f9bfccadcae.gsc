#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_110017181faa407a;

// Namespace namespace_110017181faa407a
// Params 0, eflags: 0x5
// Checksum 0xb80f32ff, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_eeb05de90358f743", undefined, &function_cdfc7621ada84003, undefined );
}

// Namespace namespace_110017181faa407a
// Params 0
// Checksum 0x2614d5b2, Offset: 0x97
// Size: 0xa
function function_cdfc7621ada84003()
{
    level thread function_d3bf86b8ebc2f4be();
}

// Namespace namespace_110017181faa407a
// Params 0
// Checksum 0x5bf7a486, Offset: 0xa9
// Size: 0x1c
function function_d3bf86b8ebc2f4be()
{
    zm_relics::register_relic_functions( #"hash_c0b55876ba2d886f", &function_45deb2ec439e98cc, &function_c80623d8dd485db3 );
}

// Namespace namespace_110017181faa407a
// Params 0
// Checksum 0x32462a58, Offset: 0xcd
// Size: 0x72
function function_45deb2ec439e98cc()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        perk_limit = level.zm_relic_modifiers[ #"hash_c0b55876ba2d886f" ].var_f180062fd8380015;
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_7dfc9bdac73805a2", perk_limit );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_110017181faa407a
// Params 0
// Checksum 0x2a7dae91, Offset: 0x147
// Size: 0x47
function function_c80623d8dd485db3()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_cf734eacedf02322" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x49>" );
    #/
}

