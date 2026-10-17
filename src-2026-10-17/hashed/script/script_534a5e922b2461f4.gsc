#using script_31e159e3b40e909e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_60fcf8e1731b342;

// Namespace namespace_60fcf8e1731b342
// Params 0, eflags: 0x5
// Checksum 0x5302f1a, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_7e1d92939ffb1839", undefined, &function_89e542947f344df9, undefined );
}

// Namespace namespace_60fcf8e1731b342
// Params 0
// Checksum 0x4983764e, Offset: 0x97
// Size: 0xa
function function_89e542947f344df9()
{
    level thread function_16e5f79a82c91516();
}

// Namespace namespace_60fcf8e1731b342
// Params 0
// Checksum 0x99c1ff14, Offset: 0xa9
// Size: 0x1c
function function_16e5f79a82c91516()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_4a5af973a4cee44b", &function_c3a7014cd40f4d24, &function_823794fd1325790b );
}

// Namespace namespace_60fcf8e1731b342
// Params 0
// Checksum 0x12a99fdf, Offset: 0xcd
// Size: 0x5e
function function_c3a7014cd40f4d24()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        var_7d4c78b7d42d3e = %"hash_316026ac255921e9";
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_fbbb0712f33c62e6", var_7d4c78b7d42d3e );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_60fcf8e1731b342
// Params 0
// Checksum 0xce44f608, Offset: 0x133
// Size: 0x42
function function_823794fd1325790b()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level.zm_mode_modifiers.var_17778bfafdc97691 = 0;
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x54>" );
    #/
}

