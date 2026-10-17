#using script_2fe74ee229c972c3;
#using script_762e73cd6088bff;
#using scripts\common\utility;

#namespace skill_quick_deploy;

// Namespace skill_quick_deploy
// Params 0, eflags: 0x1
// Checksum 0x2ab24b1a, Offset: 0xc9
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"quick_deploy", &init );
}

// Namespace skill_quick_deploy
// Params 0
// Checksum 0x3abef9fb, Offset: 0xe8
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"quick_deploy", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"quick_deploy", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_quick_deploy
// Params 1, eflags: 0x4
// Checksum 0x87b09dce, Offset: 0x12e
// Size: 0x51, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_432aeb35bfd9cf59 = { #bundle:skill_bundle };
    perk::giveperk( "specialty_pitcher" );
    perk::giveperk( "specialty_skill_multitasker" );
    self setclientomnvar( "skill_multitasker_perk_tier", skill_bundle.skilllevel );
    return true;
}

// Namespace skill_quick_deploy
// Params 1, eflags: 0x4
// Checksum 0x768d4792, Offset: 0x188
// Size: 0x60
function private function_c51f1692ecb73bfe( skill_bundle )
{
    if ( isdefined( self.perks[ "specialty_skill_multitasker" ] ) )
    {
        perk::removeperk( "specialty_skill_multitasker" );
    }
    
    if ( isdefined( self.perks[ "specialty_pitcher" ] ) )
    {
        perk::removeperk( "specialty_pitcher" );
    }
    
    self setclientomnvar( "skill_multitasker_perk_tier", 0 );
    self.var_432aeb35bfd9cf59 = undefined;
}

