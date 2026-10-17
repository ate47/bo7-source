#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\zm_utility;

#namespace zm_relic_challenge_only_explosive_kills;

// Namespace zm_relic_challenge_only_explosive_kills
// Params 0, eflags: 0x5
// Checksum 0x941d298d, Offset: 0x128
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_5681c0663cd1d177", undefined, &init_relic_challenge_only_explosive_kills, undefined );
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 0
// Checksum 0xae75fddf, Offset: 0x149
// Size: 0xa
function init_relic_challenge_only_explosive_kills()
{
    level thread function_ac657e02d0c904e();
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 0
// Checksum 0xd3ecf6ad, Offset: 0x15b
// Size: 0x1c
function function_ac657e02d0c904e()
{
    zm_relic_challenges::register_relic_challenge_functions( #"only_explosive_kills", &function_1d7778f48afb6370, &function_4ad33dcdf760e847 );
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 0
// Checksum 0x73597ab5, Offset: 0x17f
// Size: 0x60
function function_1d7778f48afb6370()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_killed", &on_zombie_ai_killed );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 0
// Checksum 0xab572ec8, Offset: 0x1e7
// Size: 0xe9
function function_4ad33dcdf760e847()
{
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    level callback::remove( "on_zombie_ai_killed", &on_zombie_ai_killed );
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
        iprintlnbold( "<dev string:x59>" );
    #/
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 1, eflags: 0x4
// Checksum 0xe2dc16fc, Offset: 0x2d8
// Size: 0xd8
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    
    if ( dmg_struct.smeansofdeath != "MOD_EXPLOSIVE" && dmg_struct.smeansofdeath != "MOD_PROJECTILE" && dmg_struct.smeansofdeath != "MOD_GRENADE" && dmg_struct.smeansofdeath != "MOD_GRENADE_SPLASH" && dmg_struct.smeansofdeath != "MOD_PROJECTILE_SPLASH" && dmg_struct.smeansofdeath != "MOD_IMPACT" || dmg_struct.objweapon.basename == "sat_combataxe_zm" )
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

// Namespace zm_relic_challenge_only_explosive_kills
// Params 1, eflags: 0x4
// Checksum 0x25d8caf8, Offset: 0x3b9
// Size: 0x47
function private on_zombie_ai_killed( params )
{
    if ( utility::percent_chance( 25 ) )
    {
        spawnoptions = common_item::items_initspawnoptions_spawnfromentity( self );
        item = common_item::function_38cde6a6acb68ea6( %"itemspawnlist:zm_sat_items_equipment", 1, spawnoptions );
    }
}

// Namespace zm_relic_challenge_only_explosive_kills
// Params 1, eflags: 0x4
// Checksum 0x3eef009a, Offset: 0x408
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

