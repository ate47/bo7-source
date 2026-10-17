#using script_2b51dca51198db31;
#using script_2fe74ee229c972c3;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\agents\agent_utils;

#namespace skill_big_hit;

// Namespace skill_big_hit
// Params 0, eflags: 0x1
// Checksum 0xd652d8a1, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"big_hit", &init );
}

// Namespace skill_big_hit
// Params 0
// Checksum 0xdf96a5f4, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"big_hit", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"big_hit", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_big_hit
// Params 1, eflags: 0x4
// Checksum 0xcb064104, Offset: 0xdb
// Size: 0x50, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_cce8b331c2b93218 = { #bundle:skill_bundle };
    zombie_utils::function_dfae6a5bd222c586( &on_ai_damaged );
    agent_utils::function_bc89b9076dd93902( &on_ai_damaged );
    callback::add( #"hash_2346898712859996", &on_player_damaged );
    return true;
}

// Namespace skill_big_hit
// Params 1, eflags: 0x4
// Checksum 0x1fb08d6e, Offset: 0x134
// Size: 0x9c
function private on_player_damaged( params )
{
    valid_shot = damage_utility::validshotcheck( params.smeansofdeath, params.eattacker );
    is_critical = damage_utility::isheadshot( params.shitloc, params.smeansofdeath, params.eattacker, valid_shot );
    params.idamage = params.victim function_418a5ba88030f8fa( params.eattacker, params.idamage, is_critical );
}

// Namespace skill_big_hit
// Params 1, eflags: 0x4
// Checksum 0x182feb85, Offset: 0x1d8
// Size: 0x33
function private on_ai_damaged( params )
{
    return function_418a5ba88030f8fa( params.eattacker, params.idamage, params.biscritical );
}

// Namespace skill_big_hit
// Params 3, eflags: 0x4
// Checksum 0xeecec6fb, Offset: 0x214
// Size: 0x6e
function private function_418a5ba88030f8fa( attacker, damage, is_critical )
{
    assert( isplayer( attacker ) );
    
    if ( is_critical && self.health == self.maxhealth )
    {
        damage *= attacker.var_cce8b331c2b93218.bundle.var_6b7da2d374eaf9ed;
    }
    
    return damage;
}

// Namespace skill_big_hit
// Params 1, eflags: 0x4
// Checksum 0xb190d168, Offset: 0x28b
// Size: 0x5a
function private function_c51f1692ecb73bfe( skill_bundle )
{
    zombie_utils::function_10c0c35c21e3ed9d( &on_ai_damaged );
    agent_utils::function_def5273cfe3c9109( &on_ai_damaged );
    
    if ( callback::exists( #"hash_2346898712859996", &on_player_damaged ) )
    {
        callback::remove( #"hash_2346898712859996", &on_player_damaged );
    }
    
    self.var_cce8b331c2b93218 = undefined;
}

