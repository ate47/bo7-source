#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_elemental_base_zombies;

// Namespace zm_relic_elemental_base_zombies
// Params 0, eflags: 0x5
// Checksum 0x41411d3d, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_f452630738f912b9", undefined, &init_relic_elemental_base_zombies, undefined );
}

// Namespace zm_relic_elemental_base_zombies
// Params 0
// Checksum 0x2aaeec4, Offset: 0x97
// Size: 0xa
function init_relic_elemental_base_zombies()
{
    level thread function_5e63be747449d98f();
}

// Namespace zm_relic_elemental_base_zombies
// Params 0
// Checksum 0x2b577709, Offset: 0xa9
// Size: 0x1c
function function_5e63be747449d98f()
{
    zm_relics::register_relic_functions( #"elemental_base_zombies", &function_4e841e9d86ee921b, &function_f0bea1bef46cea36 );
}

// Namespace zm_relic_elemental_base_zombies
// Params 0
// Checksum 0xe819dc73, Offset: 0xcd
// Size: 0x46
function function_4e841e9d86ee921b()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_elemental_base_zombies" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_elemental_base_zombies
// Params 0
// Checksum 0x492e365, Offset: 0x11b
// Size: 0x46
function function_f0bea1bef46cea36()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_elemental_base_zombies" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x4d>" );
    #/
}

