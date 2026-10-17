#using script_31e159e3b40e909e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\zm_utility;

#namespace namespace_a89551cddd23d030;

// Namespace namespace_a89551cddd23d030
// Params 0, eflags: 0x5
// Checksum 0x3b336e43, Offset: 0xb3
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_a6f2be73a34ab13f", undefined, &function_6e7704efcbc125ff, undefined );
}

// Namespace namespace_a89551cddd23d030
// Params 0
// Checksum 0x1ee450ca, Offset: 0xd4
// Size: 0xa
function function_6e7704efcbc125ff()
{
    level thread function_581854c4d68d7572();
}

// Namespace namespace_a89551cddd23d030
// Params 0
// Checksum 0xc5b9454d, Offset: 0xe6
// Size: 0x1c
function function_581854c4d68d7572()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_a66bd90c6c346a5d", &function_fde4f4944a0bde18, &function_3f94e980d85bda0f );
}

// Namespace namespace_a89551cddd23d030
// Params 0
// Checksum 0x77805938, Offset: 0x10a
// Size: 0x11a
function function_fde4f4944a0bde18()
{
    level utility::registersharedfunc( #"zombie", #"hash_9390d4bfb2b44ab2", &function_eb037271d5fb2c78 );
    level callback::add( "on_zombie_ai_spawned", &on_zombie_ai_spawned );
    level.var_cdca5e730e05bc39 = 1;
    
    if ( level.active_relic_challenge )
    {
        level.active_relic_challenge.var_aaff0301aebe08c7 = 1;
    }
    
    fire_trap_switches = utility::getstructarray( "fire_trap_switch" );
    
    foreach ( trap_switch in fire_trap_switches )
    {
        trap_switch.trap_scriptable.interact setscriptablepartstate( #"interactable", #"disabled" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_a89551cddd23d030
// Params 0
// Checksum 0x867a406d, Offset: 0x22c
// Size: 0x1b5
function function_3f94e980d85bda0f()
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
    
    if ( isdefined( level.var_e8de7cb2797a5e62 ) )
    {
        level.var_a8bd4fde132565a1 = undefined;
    }
    
    if ( level.active_relic_challenge )
    {
        level.active_relic_challenge.var_aaff0301aebe08c7 = undefined;
    }
    
    fire_trap_switches = utility::getstructarray( "fire_trap_switch" );
    
    foreach ( trap_switch in fire_trap_switches )
    {
        trap_switch.trap_scriptable.interact setscriptablepartstate( #"interactable", #"usable" );
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x5a>" );
    #/
}

// Namespace namespace_a89551cddd23d030
// Params 1, eflags: 0x4
// Checksum 0x3366fde0, Offset: 0x3e9
// Size: 0x5a
function private function_eb037271d5fb2c78( dmg_struct )
{
    idamage = dmg_struct.idamage;
    
    if ( dmg_struct.eattacker.targetname != "trap_attacker" )
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

// Namespace namespace_a89551cddd23d030
// Params 1, eflags: 0x4
// Checksum 0xcf61b70, Offset: 0x44c
// Size: 0x13
function private on_zombie_ai_spawned( params )
{
    zm_relic_challenges::set_zombie_damage_invuln();
}

