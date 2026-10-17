#using script_31e159e3b40e909e;
#using scripts\common\powerups;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_b4d8298fe2b101cb;

// Namespace namespace_b4d8298fe2b101cb
// Params 0, eflags: 0x5
// Checksum 0xfc57f6c1, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_8bbe250e14b1cd82", undefined, &function_b0de6741a1c9a942, undefined );
}

// Namespace namespace_b4d8298fe2b101cb
// Params 0
// Checksum 0xd9834a57, Offset: 0x97
// Size: 0xa
function function_b0de6741a1c9a942()
{
    level thread function_69b48917d4004ff7();
}

// Namespace namespace_b4d8298fe2b101cb
// Params 0
// Checksum 0x5190bfd9, Offset: 0xa9
// Size: 0x1c
function function_69b48917d4004ff7()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_a30093ea55795340", &function_d6c51bc9fa81ab6f, &function_ec389fe9637302ca );
}

// Namespace namespace_b4d8298fe2b101cb
// Params 0
// Checksum 0x352a2402, Offset: 0xcd
// Size: 0xcd
function function_d6c51bc9fa81ab6f()
{
    powerups::register_powerup_dropped_callback( &function_ac8b95bb5965f259 );
    level.var_db574ba71bb3d2ef = level.powerups_root.dropped_callbacks.size - 1;
    root = powerups::get_powerups_root();
    level.var_63cf0c728a61f6b0 = root.var_e976cc211ff8126;
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_wallbuy_refill_ammo" );
    }
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"set_no_ammo_cache" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_b4d8298fe2b101cb
// Params 0
// Checksum 0x1da73748, Offset: 0x1a2
// Size: 0xbf
function function_ec389fe9637302ca()
{
    level.powerups_root.dropped_callbacks[ level.var_db574ba71bb3d2ef ] = undefined;
    root = powerups::get_powerups_root();
    root.var_e976cc211ff8126 = level.var_63cf0c728a61f6b0;
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        level utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_wallbuy_refill_ammo" );
    }
    
    if ( utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"hash_d0e6560a86f1d651" ) )
    {
        utility::callsharedfunc( #"hash_b40a9d0e3ded2b0f", #"disable_no_ammo_cache" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x55>" );
    #/
}

// Namespace namespace_b4d8298fe2b101cb
// Params 1, eflags: 0x4
// Checksum 0xcd22c8af, Offset: 0x269
// Size: 0x2c
function private function_ac8b95bb5965f259( powerup )
{
    root = powerups::get_powerups_root();
    root.var_e976cc211ff8126 = 9;
}

