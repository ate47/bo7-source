#using script_2fe74ee229c972c3;
#using scripts\common\utility;

#namespace skill_monkey_bomb_upgrade;

// Namespace skill_monkey_bomb_upgrade
// Params 0, eflags: 0x1
// Checksum 0xfd44ab45, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"monkey_bomb_upgrade", &init );
}

// Namespace skill_monkey_bomb_upgrade
// Params 0
// Checksum 0x752c2591, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"monkey_bomb_upgrade", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"monkey_bomb_upgrade", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_monkey_bomb_upgrade
// Params 1, eflags: 0x4
// Checksum 0x5f7ee4ac, Offset: 0xdb
// Size: 0xe, Type: bool
function private on_give_skill( skill_bundle )
{
    return true;
}

// Namespace skill_monkey_bomb_upgrade
// Params 1, eflags: 0x4
// Checksum 0x76bf4ae0, Offset: 0xf2
// Size: 0xc
function private function_c51f1692ecb73bfe( skill_bundle )
{
    
}

