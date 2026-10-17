#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\zm_utility;

#namespace namespace_2eeba035eb07bf0b;

// Namespace namespace_2eeba035eb07bf0b
// Params 0, eflags: 0x5
// Checksum 0x52da1935, Offset: 0xb0
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_f3a5b4158bf52656", undefined, &function_f6343a7b8aca7996, undefined );
}

// Namespace namespace_2eeba035eb07bf0b
// Params 0
// Checksum 0x22cf86dd, Offset: 0xd1
// Size: 0xa
function function_f6343a7b8aca7996()
{
    level thread function_adeb61104723ead7();
}

// Namespace namespace_2eeba035eb07bf0b
// Params 0
// Checksum 0x26aea58b, Offset: 0xe3
// Size: 0x1c
function function_adeb61104723ead7()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_214f88bf31741438", &function_52b44a6386230cd3, &function_7c8e88a57999f4ee );
}

// Namespace namespace_2eeba035eb07bf0b
// Params 0
// Checksum 0x7908777e, Offset: 0x107
// Size: 0x4e
function function_52b44a6386230cd3()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_2eeba035eb07bf0b
// Params 0
// Checksum 0xcdde2337, Offset: 0x15d
// Size: 0xd7
function function_7c8e88a57999f4ee()
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
        iprintlnbold( "<dev string:x60>" );
    #/
}

// Namespace namespace_2eeba035eb07bf0b
// Params 1, eflags: 0x4
// Checksum 0xcbfad4dd, Offset: 0x23c
// Size: 0x94
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    player = dmg_struct.eattacker;
    
    if ( dmg_struct.smeansofdeath != "MOD_ELEMENTAL_ELEC" && player utility::callsharedfunc( #"zombie", #"get_ammo_mod_name", dmg_struct.sweapon ) != "deadwire" )
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

// Namespace namespace_2eeba035eb07bf0b
// Params 1, eflags: 0x4
// Checksum 0x3ad2744b, Offset: 0x2d9
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

