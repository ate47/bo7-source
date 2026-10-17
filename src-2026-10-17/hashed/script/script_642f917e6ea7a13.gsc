#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_delay_health_regen;

// Namespace zm_relic_delay_health_regen
// Params 0, eflags: 0x5
// Checksum 0x2b7a4540, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_cf4fc3dbed6ee2a2", undefined, &init_relic_delay_health_regen, undefined );
}

// Namespace zm_relic_delay_health_regen
// Params 0
// Checksum 0x42c9a432, Offset: 0x97
// Size: 0xa
function init_relic_delay_health_regen()
{
    level thread function_82424773b98f6620();
}

// Namespace zm_relic_delay_health_regen
// Params 0
// Checksum 0x813271a6, Offset: 0xa9
// Size: 0x1c
function function_82424773b98f6620()
{
    zm_relics::register_relic_functions( #"delay_health_regen", &function_a13e20f3a6484566, &function_82e45ef317bca145 );
}

// Namespace zm_relic_delay_health_regen
// Params 0
// Checksum 0xb5785104, Offset: 0xcd
// Size: 0x7e
function function_a13e20f3a6484566()
{
    params = {};
    params.regen_rate = level.zm_relic_modifiers[ #"delay_health_regen" ].var_c424a3ded13d25ce;
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_delay_health_regen", params );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_delay_health_regen
// Params 0
// Checksum 0xffd49bc8, Offset: 0x153
// Size: 0x46
function function_82e45ef317bca145()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_delay_health_regen" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x49>" );
    #/
}

