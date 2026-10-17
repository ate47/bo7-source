#using script_2fe74ee229c972c3;
#using script_762e73cd6088bff;
#using scripts\common\utility;

#namespace skill_wingsuit_expert;

// Namespace skill_wingsuit_expert
// Params 0, eflags: 0x1
// Checksum 0x4a90fc02, Offset: 0xbc
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"wingsuit_expert", &init );
}

// Namespace skill_wingsuit_expert
// Params 0
// Checksum 0x9ce3466f, Offset: 0xdb
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"wingsuit_expert", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"wingsuit_expert", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_wingsuit_expert
// Params 1, eflags: 0x4
// Checksum 0x19f77fb8, Offset: 0x121
// Size: 0x30, Type: bool
function private on_give_skill( skill_bundle )
{
    perk::giveperk( "specialty_skill_wingsuit_expert" );
    self setclientomnvar( "skill_wingsuit_expert_perk_tier", skill_bundle.skilllevel );
    return true;
}

// Namespace skill_wingsuit_expert
// Params 1, eflags: 0x4
// Checksum 0xaa79981b, Offset: 0x15a
// Size: 0x24
function private function_c51f1692ecb73bfe( skill_bundle )
{
    perk::removeperk( "specialty_skill_wingsuit_expert" );
    self setclientomnvar( "skill_wingsuit_expert_perk_tier", 0 );
}

