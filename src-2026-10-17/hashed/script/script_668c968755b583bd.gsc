#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_6d21cd8fcfa0bd2b;

// Namespace namespace_6d21cd8fcfa0bd2b
// Params 0, eflags: 0x5
// Checksum 0x1ac0d9bd, Offset: 0xa9
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_9b1416741ee00586", undefined, undefined, &init );
}

// Namespace namespace_6d21cd8fcfa0bd2b
// Params 0
// Checksum 0x750d278a, Offset: 0xca
// Size: 0xa
function init()
{
    level thread post_init();
}

// Namespace namespace_6d21cd8fcfa0bd2b
// Params 0
// Checksum 0xfea29e01, Offset: 0xdc
// Size: 0x2f
function post_init()
{
    level utility::flag_wait( "ruby_boss_fight_complete" );
    level.var_9881b011f1094b24 = #"r_mod_unlock_ruby";
    level.var_23850f4ef56baf27 = "r_mod_unlocked_ruby";
}

