#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_enemy_health_regen;

// Namespace zm_relic_enemy_health_regen
// Params 0, eflags: 0x5
// Checksum 0xedf3e464, Offset: 0x9c
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_9bc9ec1b775036e3", undefined, &init_relic_enemy_health_regen, undefined );
}

// Namespace zm_relic_enemy_health_regen
// Params 0
// Checksum 0xdc28d496, Offset: 0xbd
// Size: 0xa
function init_relic_enemy_health_regen()
{
    level thread function_d6ac0a2a077d0df5();
}

// Namespace zm_relic_enemy_health_regen
// Params 0
// Checksum 0xe751e407, Offset: 0xcf
// Size: 0x1c
function function_d6ac0a2a077d0df5()
{
    zm_relics::register_relic_functions( #"enemy_health_regen", &function_86d74ed183354ad1, &function_c35994a1c71fa7b4 );
}

// Namespace zm_relic_enemy_health_regen
// Params 0
// Checksum 0xebbcb9ff, Offset: 0xf3
// Size: 0x29f
function function_86d74ed183354ad1()
{
    params = {};
    params.regen_rate = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_8d8ef3dcd7ee3537;
    params.var_1f2e7fef2279c144 = [];
    params.var_1f2e7fef2279c144[ "normal" ] = {};
    params.var_1f2e7fef2279c144[ "normal" ].health_perc = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_67d7ed75d224cd1e;
    params.var_1f2e7fef2279c144[ "normal" ].var_2ebe82c4c0441f06 = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_5103fa4c6f434673;
    params.var_1f2e7fef2279c144[ "special" ] = {};
    params.var_1f2e7fef2279c144[ "special" ].health_perc = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_de79d16d8e880788;
    params.var_1f2e7fef2279c144[ "special" ].var_2ebe82c4c0441f06 = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_9cf5385eec3b4136;
    params.var_1f2e7fef2279c144[ "elite" ] = {};
    params.var_1f2e7fef2279c144[ "elite" ].health_perc = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_d1ca59b4c0552e88;
    params.var_1f2e7fef2279c144[ "elite" ].var_2ebe82c4c0441f06 = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_265eb8b2ea14ce36;
    params.var_1f2e7fef2279c144[ "boss" ] = {};
    params.var_1f2e7fef2279c144[ "boss" ].health_perc = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_bc587fab73d9b22;
    params.var_1f2e7fef2279c144[ "boss" ].var_2ebe82c4c0441f06 = level.zm_relic_modifiers[ #"enemy_health_regen" ].var_4dd28cec87d68190;
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_enemy_health_regen", params );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_enemy_health_regen
// Params 0
// Checksum 0x32816ca6, Offset: 0x39a
// Size: 0x46
function function_c35994a1c71fa7b4()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_enemy_health_regen" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x49>" );
    #/
}

