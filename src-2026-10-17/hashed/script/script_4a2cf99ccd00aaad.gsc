#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\zm_utility;

#namespace namespace_efa25a363a79b393;

// Namespace namespace_efa25a363a79b393
// Params 0, eflags: 0x5
// Checksum 0xd0250f70, Offset: 0xda
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_25da1a169a138fae", undefined, &function_ecfebb08e8c7baee, undefined );
}

// Namespace namespace_efa25a363a79b393
// Params 0
// Checksum 0xd72a033f, Offset: 0xfb
// Size: 0xa
function function_ecfebb08e8c7baee()
{
    level thread function_8453d273a8a8ac31();
}

// Namespace namespace_efa25a363a79b393
// Params 0
// Checksum 0xcf3c9f49, Offset: 0x10d
// Size: 0x1c
function function_8453d273a8a8ac31()
{
    zm_relic_challenges::register_relic_challenge_functions( #"only_melee_damage", &function_5c4f58e512f389ad, &function_cac18c906d09ea0 );
}

// Namespace namespace_efa25a363a79b393
// Params 0
// Checksum 0xc9630cf0, Offset: 0x131
// Size: 0x4e
function function_5c4f58e512f389ad()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_efa25a363a79b393
// Params 0
// Checksum 0xa6304902, Offset: 0x187
// Size: 0xd7
function function_cac18c906d09ea0()
{
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    level callback::remove( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 0;
    all_zombies = getaiarray( zm_utility::get_zombie_team() );
    
    foreach ( zombie in all_zombies )
    {
        if ( isalive( zombie ) )
        {
            zombie zm_relic_challenges::function_908a1b8613e50514();
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x5b>" );
    #/
}

// Namespace namespace_efa25a363a79b393
// Params 1, eflags: 0x4
// Checksum 0x12e4fb20, Offset: 0x266
// Size: 0xad
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    
    if ( dmg_struct.smeansofdeath != "MOD_MELEE" && ( dmg_struct.sweapon.basename != "sat_ww_locust_fireball" || dmg_struct.sweapon.basename != "sat_ww_locust_zm" || dmg_struct.sweapon.basename != "sat_ww_locust" ) )
    {
        idamage *= 0;
        zm_relic_challenges::set_zombie_damage_invuln();
    }
    else
    {
        zm_relic_challenges::function_908a1b8613e50514();
    }
    
    return idamage;
}

// Namespace namespace_efa25a363a79b393
// Params 1, eflags: 0x4
// Checksum 0xebac78d3, Offset: 0x31c
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

