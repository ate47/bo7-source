#using script_2fe74ee229c972c3;
#using scripts\common\utility;
#using scripts\mp\playerhealth;

#namespace skill_health_recovery;

// Namespace skill_health_recovery
// Params 0, eflags: 0x1
// Checksum 0xfdacff40, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"health_recovery", &init );
}

// Namespace skill_health_recovery
// Params 0
// Checksum 0x80eb84a0, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"health_recovery", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"health_recovery", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_health_recovery
// Params 1, eflags: 0x4
// Checksum 0xd72fce07, Offset: 0xdb
// Size: 0x57, Type: bool
function private on_give_skill( skill_bundle )
{
    if ( !skill_bundle.var_dc39ac56f1eeb616 )
    {
        assertmsg( "<dev string:x24>" );
        return false;
    }
    
    playerhealth::function_b1fb4d148779580e( #"health_recovery_regen_delay" );
    playerhealth::function_fd91e6d94cab77e7( #"health_recovery_regen_delay", skill_bundle.var_dc39ac56f1eeb616 );
    return true;
}

// Namespace skill_health_recovery
// Params 1, eflags: 0x4
// Checksum 0x4760d406, Offset: 0x13b
// Size: 0x1c
function private function_c51f1692ecb73bfe( skill_bundle )
{
    playerhealth::function_b1fb4d148779580e( #"health_recovery_regen_delay" );
}

