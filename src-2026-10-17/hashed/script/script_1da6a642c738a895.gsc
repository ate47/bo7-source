#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_randomize_wallbuys;

// Namespace zm_relic_randomize_wallbuys
// Params 0, eflags: 0x5
// Checksum 0x8af27a44, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_dca1dbdeefcbdd03", undefined, &init_relic_randomize_wallbuys, undefined );
}

// Namespace zm_relic_randomize_wallbuys
// Params 0
// Checksum 0x690976f, Offset: 0x97
// Size: 0xa
function init_relic_randomize_wallbuys()
{
    level thread function_9c5203ce28ce33dd();
}

// Namespace zm_relic_randomize_wallbuys
// Params 0
// Checksum 0x1c780ef2, Offset: 0xa9
// Size: 0x1c
function function_9c5203ce28ce33dd()
{
    zm_relics::register_relic_functions( #"randomize_wallbuys", &function_2ffafacf04671849, &function_8ad2cc501af026c );
}

// Namespace zm_relic_randomize_wallbuys
// Params 0
// Checksum 0xa23f9e49, Offset: 0xcd
// Size: 0x46
function function_2ffafacf04671849()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_randomize_wallbuys" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_randomize_wallbuys
// Params 0
// Checksum 0x35e41308, Offset: 0x11b
// Size: 0x46
function function_8ad2cc501af026c()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_randomize_wallbuys" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x50>" );
    #/
}

