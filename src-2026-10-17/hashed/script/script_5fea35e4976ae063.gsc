#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_challenge_disable_purchases;

// Namespace zm_relic_challenge_disable_purchases
// Params 0, eflags: 0x5
// Checksum 0xc3aa073a, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_94c83726b8992a3e", undefined, &init_relic_challenge_disable_purchases, undefined );
}

// Namespace zm_relic_challenge_disable_purchases
// Params 0
// Checksum 0x46ce7f2, Offset: 0x97
// Size: 0xa
function init_relic_challenge_disable_purchases()
{
    level thread function_10e8597be013f561();
}

// Namespace zm_relic_challenge_disable_purchases
// Params 0
// Checksum 0x527c2fa7, Offset: 0xa9
// Size: 0x1c
function function_10e8597be013f561()
{
    zm_relic_challenges::register_relic_challenge_functions( #"disable_purchases", &function_edddeaf4ae1291ed, &function_375b1e0b05bbbde0 );
}

// Namespace zm_relic_challenge_disable_purchases
// Params 0
// Checksum 0xdca81e7a, Offset: 0xcd
// Size: 0xbe
function function_edddeaf4ae1291ed()
{
    level callback::add( #"player_spawned", &on_player_spawned );
    
    foreach ( player in level.players )
    {
        player function_174c337ae60e88a3( 1 );
    }
    
    utility::callsharedfunc( #"Traps", #"hash_bec4853d43d80950", 1 );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_challenge_disable_purchases
// Params 0
// Checksum 0x27e3011f, Offset: 0x193
// Size: 0xbc
function function_375b1e0b05bbbde0()
{
    level callback::remove( #"player_spawned", &on_player_spawned );
    
    foreach ( player in level.players )
    {
        player function_174c337ae60e88a3( 0 );
    }
    
    utility::callsharedfunc( #"Traps", #"hash_bec4853d43d80950", 0 );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x55>" );
    #/
}

// Namespace zm_relic_challenge_disable_purchases
// Params 1
// Checksum 0x23179811, Offset: 0x257
// Size: 0x85
function function_174c337ae60e88a3( b_disable )
{
    self.var_432159241a2f9367 = b_disable;
    self.var_e830497a1d286f74 = b_disable;
    self.arsenal_disabled = b_disable;
    self.crafting_table_disabled = b_disable;
    self.ammo_cache_disabled = b_disable;
    level.var_c139731c583cae6b = b_disable;
    level.var_96d4f8dc0c3cfea3 = b_disable;
    self.bgb_machine_disabled = b_disable;
    self.var_73e2de392faa52c6 = b_disable;
    self.doorbuy_disabled = b_disable;
    self.var_2314a9263fbe04b9 = b_disable;
}

// Namespace zm_relic_challenge_disable_purchases
// Params 1, eflags: 0x4
// Checksum 0x3cd8b9a2, Offset: 0x2e4
// Size: 0x15
function private on_player_spawned( params )
{
    function_174c337ae60e88a3( 1 );
}

