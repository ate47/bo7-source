#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_no_mystery_box;

// Namespace zm_relic_no_mystery_box
// Params 0, eflags: 0x5
// Checksum 0xd97f3a, Offset: 0x88
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_5f837b494e3337c1", undefined, &init_relic_no_mystery_box, undefined );
}

// Namespace zm_relic_no_mystery_box
// Params 0
// Checksum 0x9ba0f87, Offset: 0xa9
// Size: 0xa
function init_relic_no_mystery_box()
{
    level thread function_6097646bc57598b3();
}

// Namespace zm_relic_no_mystery_box
// Params 0
// Checksum 0x9fd1d25, Offset: 0xbb
// Size: 0x1c
function function_6097646bc57598b3()
{
    zm_relics::register_relic_functions( #"no_mystery_box", &function_f6da026b8f39a833, &function_77a50f37906292ce );
}

// Namespace zm_relic_no_mystery_box
// Params 0
// Checksum 0xa63c6441, Offset: 0xdf
// Size: 0x52
function function_f6da026b8f39a833()
{
    utility::flag_wait( "magicbox_ready" );
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_no_mystery_box" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_no_mystery_box
// Params 0
// Checksum 0x3bc54713, Offset: 0x139
// Size: 0x46
function function_77a50f37906292ce()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_no_mystery_box" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x47>" );
    #/
}

