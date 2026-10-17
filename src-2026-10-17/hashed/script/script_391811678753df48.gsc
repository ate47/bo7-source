#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_disable_powerups;

// Namespace zm_relic_disable_powerups
// Params 0, eflags: 0x5
// Checksum 0xe1078a3a, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_149a9d3780074f36", undefined, &init_relic_disable_powerups, undefined );
}

// Namespace zm_relic_disable_powerups
// Params 0
// Checksum 0xf5b92070, Offset: 0x97
// Size: 0xa
function init_relic_disable_powerups()
{
    level thread function_a3f4b687bd5c9134();
}

// Namespace zm_relic_disable_powerups
// Params 0
// Checksum 0x8ba4d2de, Offset: 0xa9
// Size: 0x1c
function function_a3f4b687bd5c9134()
{
    zm_relics::register_relic_functions( #"disable_powerups", &function_67d276785f14743a, &function_5c681d3b1ee35399 );
}

// Namespace zm_relic_disable_powerups
// Params 0
// Checksum 0xb3c5ea0f, Offset: 0xcd
// Size: 0x43
function function_67d276785f14743a()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level.zm_mode_modifiers.var_a56fc07f056a7549 = 1;
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_disable_powerups
// Params 0
// Checksum 0xb262bda3, Offset: 0x118
// Size: 0x42
function function_5c681d3b1ee35399()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level.zm_mode_modifiers.var_a56fc07f056a7549 = 0;
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x43>" );
    #/
}

