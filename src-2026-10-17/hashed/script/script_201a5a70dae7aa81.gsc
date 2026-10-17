#using script_31e159e3b40e909e;
#using script_734dce84c468439b;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_relic_challenge_reduced_weapon_damage;

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 0, eflags: 0x5
// Checksum 0x34a93484, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_fa6a57f59199f804", undefined, &init_relic_challenge_reduced_weapon_damage, undefined );
}

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 0
// Checksum 0x67e90eb9, Offset: 0x97
// Size: 0xa
function init_relic_challenge_reduced_weapon_damage()
{
    level thread function_abaedc05033fa50b();
}

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 0
// Checksum 0x48e0b121, Offset: 0xa9
// Size: 0x1c
function function_abaedc05033fa50b()
{
    zm_relic_challenges::register_relic_challenge_functions( #"reduced_weapon_damage", &function_254a5313eddb69e7, &function_ede919290c9fbf22 );
}

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 0
// Checksum 0xce3b7771, Offset: 0xcd
// Size: 0x31
function function_254a5313eddb69e7()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_ed5070f64e2e51b6 );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 0
// Checksum 0x31ff7b5a, Offset: 0x106
// Size: 0x2c
function function_ede919290c9fbf22()
{
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x59>" );
    #/
}

// Namespace zm_relic_challenge_reduced_weapon_damage
// Params 1, eflags: 0x4
// Checksum 0xbc62b0ec, Offset: 0x13a
// Size: 0x47
function private function_ed5070f64e2e51b6( dmg_struct )
{
    idamage = dmg_struct.idamage;
    
    if ( weapon::isprimaryweapon( dmg_struct.sweapon ) )
    {
        idamage = int( idamage * 0.5 );
    }
    
    return idamage;
}

