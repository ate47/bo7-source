#using script_2fe74ee229c972c3;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\agents\agent_utils;

#namespace namespace_5fb90b1eb7087af8;

// Namespace namespace_5fb90b1eb7087af8
// Params 0, eflags: 0x1
// Checksum 0x97e38d8, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"berzerker", &init );
}

// Namespace namespace_5fb90b1eb7087af8
// Params 0
// Checksum 0xe3478d0, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"berzerker", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"berzerker", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace namespace_5fb90b1eb7087af8
// Params 1, eflags: 0x4
// Checksum 0xd4f605c7, Offset: 0xdb
// Size: 0x68, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_d397a3049141f0a5 = { #bundle:skill_bundle };
    zombie_utils::function_dfae6a5bd222c586( &on_ai_damage );
    agent_utils::function_bc89b9076dd93902( &on_ai_damage );
    
    if ( !callback::exists( #"hash_2346898712859996", &on_player_damaged_callback ) )
    {
        callback::add( #"hash_2346898712859996", &on_player_damaged_callback );
    }
    
    return true;
}

// Namespace namespace_5fb90b1eb7087af8
// Params 1, eflags: 0x4
// Checksum 0xdfaf76d, Offset: 0x14c
// Size: 0x5a
function private function_c51f1692ecb73bfe( skill_bundle )
{
    zombie_utils::function_10c0c35c21e3ed9d( &on_ai_damage );
    agent_utils::function_def5273cfe3c9109( &on_ai_damage );
    
    if ( callback::exists( #"hash_2346898712859996", &on_player_damaged_callback ) )
    {
        callback::remove( #"hash_2346898712859996", &on_player_damaged_callback );
    }
    
    self.var_d397a3049141f0a5 = undefined;
}

// Namespace namespace_5fb90b1eb7087af8
// Params 1, eflags: 0x4
// Checksum 0xc08f4b92, Offset: 0x1ae
// Size: 0x94
function private on_player_damaged_callback( params )
{
    skill_data = params.eattacker.var_d397a3049141f0a5;
    assert( skill_data, "<dev string:x24>" );
    bundle = skill_data.bundle;
    params.idamage = function_13ad81fc9fb7eeff( params.eattacker, params.idamage, bundle.var_7bc28909b7c8fac5 ?? 1, bundle.var_1da626aa47b8d6dd );
}

// Namespace namespace_5fb90b1eb7087af8
// Params 1, eflags: 0x4
// Checksum 0xe2215ac6, Offset: 0x24a
// Size: 0x88
function private on_ai_damage( params )
{
    skill_data = params.eattacker.var_d397a3049141f0a5;
    assert( skill_data, "<dev string:x24>" );
    bundle = skill_data.bundle;
    return function_13ad81fc9fb7eeff( params.eattacker, params.idamage, bundle.var_937aabe5779c425e ?? 1, bundle.var_1da626aa47b8d6dd );
}

// Namespace namespace_5fb90b1eb7087af8
// Params 4, eflags: 0x4
// Checksum 0x9ec15bd6, Offset: 0x2db
// Size: 0x7c
function private function_13ad81fc9fb7eeff( player, damage, damage_multiplier, health_percent_activation )
{
    assert( isplayer( player ), "<dev string:x4d>" );
    
    if ( player.inlaststand )
    {
        return damage;
    }
    
    health_percent = player.health / player.maxhealth;
    
    if ( health_percent_activation < health_percent )
    {
        return damage;
    }
    
    return damage * damage_multiplier;
}

