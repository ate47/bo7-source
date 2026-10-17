#using script_657e27b4628aaf50;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_weapon_change_carousel;

// Namespace zm_relic_weapon_change_carousel
// Params 0, eflags: 0x5
// Checksum 0x7a2fe4fa, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_e096d939db65b17d", undefined, &init_relic_weapon_change_carousel, undefined );
}

// Namespace zm_relic_weapon_change_carousel
// Params 0
// Checksum 0xc1d303af, Offset: 0x97
// Size: 0xa
function init_relic_weapon_change_carousel()
{
    level thread function_cc8a747dedacd444();
}

// Namespace zm_relic_weapon_change_carousel
// Params 0
// Checksum 0x4d3cc65d, Offset: 0xa9
// Size: 0x1c
function function_cc8a747dedacd444()
{
    zm_relics::register_relic_functions( #"weapon_change_carousel", &function_8f93a21101be801e, &function_dd4b609a44cbe53d );
}

// Namespace zm_relic_weapon_change_carousel
// Params 0
// Checksum 0xeb9a8a55, Offset: 0xcd
// Size: 0x47
function function_8f93a21101be801e()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_weapon_change_carousel" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_weapon_change_carousel
// Params 0
// Checksum 0xe924fcbf, Offset: 0x11c
// Size: 0x47
function function_dd4b609a44cbe53d()
{
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_weapon_change_carousel" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x4c>" );
    #/
}

