#using script_2fe74ee229c972c3;
#using scripts\common\utility;

#namespace fall_damage_reduction;

// Namespace fall_damage_reduction
// Params 0, eflags: 0x1
// Checksum 0x898268ce, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"fall_damage_reduction", &init );
}

// Namespace fall_damage_reduction
// Params 0
// Checksum 0xca277967, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"fall_damage_reduction", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"fall_damage_reduction", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace fall_damage_reduction
// Params 1
// Checksum 0xa11dd1e0, Offset: 0xdb
// Size: 0x23, Type: bool
function on_give_skill( skill_bundle )
{
    self.var_3bf56b2cb4cf6514 = { #bundle:skill_bundle };
    return true;
}

// Namespace fall_damage_reduction
// Params 1
// Checksum 0x2ed197e, Offset: 0x107
// Size: 0x16
function function_c51f1692ecb73bfe( skill_bundle )
{
    self.var_3bf56b2cb4cf6514 = undefined;
}

