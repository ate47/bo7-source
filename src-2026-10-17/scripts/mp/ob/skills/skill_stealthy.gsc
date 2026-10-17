#using script_2fe74ee229c972c3;
#using script_762e73cd6088bff;
#using scripts\common\utility;

#namespace skill_stealthy;

// Namespace skill_stealthy
// Params 0, eflags: 0x1
// Checksum 0xaca8d82c, Offset: 0xc2
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"stealthy", &init );
}

// Namespace skill_stealthy
// Params 0
// Checksum 0x23669392, Offset: 0xe1
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"stealthy", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"stealthy", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_stealthy
// Params 1, eflags: 0x4
// Checksum 0x35b3cde4, Offset: 0x127
// Size: 0x45, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_5798802691d131d = { #bundle:skill_bundle };
    perk::giveperk( "specialty_skill_stealthy_quietmove" );
    self setclientomnvar( "skill_stealthy_quietmove_perk_tier", skill_bundle.skilllevel );
    return true;
}

// Namespace skill_stealthy
// Params 1, eflags: 0x4
// Checksum 0xb92e47b3, Offset: 0x175
// Size: 0x41
function private function_c51f1692ecb73bfe( skill_bundle )
{
    if ( isdefined( self.perks[ "specialty_skill_stealthy_quietmove" ] ) )
    {
        perk::removeperk( "specialty_skill_stealthy_quietmove" );
    }
    
    self setclientomnvar( "skill_stealthy_quietmove_perk_tier", 0 );
    self.var_5798802691d131d = undefined;
}

