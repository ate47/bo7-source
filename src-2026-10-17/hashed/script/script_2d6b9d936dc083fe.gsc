#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_no_augments;

// Namespace zm_relic_no_augments
// Params 0, eflags: 0x5
// Checksum 0x74543394, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_235a6ffbcd99b0ba", undefined, &init_relic_no_augments, undefined );
}

// Namespace zm_relic_no_augments
// Params 0
// Checksum 0x475a169a, Offset: 0x97
// Size: 0xa
function init_relic_no_augments()
{
    level thread function_e53671b20c326808();
}

// Namespace zm_relic_no_augments
// Params 0
// Checksum 0x3a0ec63a, Offset: 0xa9
// Size: 0x1c
function function_e53671b20c326808()
{
    zm_relics::register_relic_functions( #"no_augments", &function_bc1e99f79dad4dce, &function_fef9fd560eac474d );
}

// Namespace zm_relic_no_augments
// Params 0
// Checksum 0x90483255, Offset: 0xcd
// Size: 0x46
function function_bc1e99f79dad4dce()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_no_augments" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_no_augments
// Params 0
// Checksum 0xb4aa626a, Offset: 0x11b
// Size: 0x12
function function_fef9fd560eac474d()
{
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x42>" );
    #/
}

