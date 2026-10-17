#using script_2fe74ee229c972c3;
#using script_762e73cd6088bff;
#using scripts\common\utility;

#namespace skill_fast_weapon_swap;

// Namespace skill_fast_weapon_swap
// Params 0, eflags: 0x1
// Checksum 0xaf34859e, Offset: 0xc6
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"fast_weapon_swap", &init );
}

// Namespace skill_fast_weapon_swap
// Params 0, eflags: 0x4
// Checksum 0x531b5ab, Offset: 0xe5
// Size: 0x3e
function private init()
{
    utility::registersharedfunc( #"fast_weapon_swap", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"fast_weapon_swap", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_fast_weapon_swap
// Params 1, eflags: 0x4
// Checksum 0xe42eb1eb, Offset: 0x12b
// Size: 0x30, Type: bool
function private on_give_skill( skill_bundle )
{
    give_perk( "specialty_skill_fast_weapon_swap" );
    self setclientomnvar( "skill_fast_weapon_swap_perk_tier", skill_bundle.skilllevel );
    return true;
}

// Namespace skill_fast_weapon_swap
// Params 1, eflags: 0x4
// Checksum 0x881f5bb6, Offset: 0x164
// Size: 0x24
function private function_c51f1692ecb73bfe( skill_bundle )
{
    remove_perk( "specialty_skill_fast_weapon_swap" );
    self setclientomnvar( "skill_fast_weapon_swap_perk_tier", 0 );
}

// Namespace skill_fast_weapon_swap
// Params 1, eflags: 0x4
// Checksum 0x67e086e4, Offset: 0x190
// Size: 0x29
function private give_perk( perk_name )
{
    if ( !isdefined( perk_name ) || perk_name == "NONE" )
    {
        return;
    }
    
    perk::giveperk( perk_name );
}

// Namespace skill_fast_weapon_swap
// Params 1, eflags: 0x4
// Checksum 0xc1660b7f, Offset: 0x1c1
// Size: 0x3b
function private remove_perk( perk_name )
{
    if ( !isdefined( perk_name ) || perk_name == "NONE" )
    {
        return;
    }
    
    if ( !isdefined( self.perks[ perk_name ] ) )
    {
        return;
    }
    
    perk::removeperk( perk_name );
}

