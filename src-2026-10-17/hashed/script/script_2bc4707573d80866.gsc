#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\zm_utility;

#namespace namespace_5f2ffd0c73dac928;

// Namespace namespace_5f2ffd0c73dac928
// Params 0, eflags: 0x5
// Checksum 0xdaa8de50, Offset: 0x8e
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_99dd92034227fc52", undefined, &function_ec110c2d01c53612, undefined );
}

// Namespace namespace_5f2ffd0c73dac928
// Params 0
// Checksum 0x60bc03aa, Offset: 0xaf
// Size: 0xa
function function_ec110c2d01c53612()
{
    level thread function_1af5f7f9de2b70a3();
}

// Namespace namespace_5f2ffd0c73dac928
// Params 0
// Checksum 0x71892842, Offset: 0xc1
// Size: 0x1c
function function_1af5f7f9de2b70a3()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_8d76bac719900756", &function_d2b085a69cfb106b, &function_e4748e1a155b35e6 );
}

// Namespace namespace_5f2ffd0c73dac928
// Params 0
// Checksum 0x6f71d17e, Offset: 0xe5
// Size: 0x68
function function_d2b085a69cfb106b()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level utility::callsharedfunc( #"zm_blizzard", #"freeze_world" );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_5f2ffd0c73dac928
// Params 0
// Checksum 0x89137cbc, Offset: 0x155
// Size: 0xf1
function function_e4748e1a155b35e6()
{
    level utility::clearsharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2" );
    level utility::callsharedfunc( #"zm_blizzard", #"unfreeze_world" );
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
        iprintlnbold( "<dev string:x57>" );
    #/
}

// Namespace namespace_5f2ffd0c73dac928
// Params 1, eflags: 0x4
// Checksum 0xa5965852, Offset: 0x24e
// Size: 0x6a
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    player = dmg_struct.eattacker;
    
    if ( player && !ispointindoors( player.origin ) )
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

// Namespace namespace_5f2ffd0c73dac928
// Params 1, eflags: 0x4
// Checksum 0xa20f0268, Offset: 0x2c1
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

