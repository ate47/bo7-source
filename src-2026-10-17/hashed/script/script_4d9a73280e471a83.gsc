#using script_2fe74ee229c972c3;
#using scripts\common\utility;

#namespace skill_survival_life_drain_upgrade;

// Namespace skill_survival_life_drain_upgrade
// Params 0, eflags: 0x1
// Checksum 0xee2d830, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"survival_life_drain_upgrade", &init );
}

// Namespace skill_survival_life_drain_upgrade
// Params 0
// Checksum 0x7badfd32, Offset: 0x95
// Size: 0x7a
function init()
{
    utility::registersharedfunc( #"survival_life_drain_upgrade", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"survival_life_drain_upgrade", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    utility::registersharedfunc( #"super_survival_life_drain", #"hash_c07e6164b9ac6a24", &function_c39671a85731e860 );
    utility::registersharedfunc( #"super_survival_life_drain", #"hash_e4efac09d11d4af8", &function_164a31309973139a );
}

// Namespace skill_survival_life_drain_upgrade
// Params 1, eflags: 0x4
// Checksum 0xb29b61db, Offset: 0x117
// Size: 0x49, Type: bool
function private on_give_skill( skill_bundle )
{
    /#
        if ( skill_bundle.var_80a97dab991a0df7 )
        {
            assert( skill_bundle.var_332e741c1abd42a5 > 0 );
        }
    #/
    
    self.var_f6412220e583a288 = { #bundle:skill_bundle };
    return true;
}

// Namespace skill_survival_life_drain_upgrade
// Params 1, eflags: 0x4
// Checksum 0x743febc, Offset: 0x169
// Size: 0x16
function private function_c51f1692ecb73bfe( skill_bundle )
{
    self.var_f6412220e583a288 = undefined;
}

// Namespace skill_survival_life_drain_upgrade
// Params 0, eflags: 0x4
// Checksum 0x7c0a91c4, Offset: 0x187
// Size: 0x8e
function private function_c39671a85731e860()
{
    bundle = self.var_f6412220e583a288.bundle;
    
    if ( !bundle.var_e9ee377f0b337ccf )
    {
        return;
    }
    
    refill_data = { #lethalequipment:bundle.var_ba26f30e49015ff6, #armorplates:bundle.var_c7bf8f3f128793aa, #var_e656600881b31dd9:bundle.var_2598137e1b100fa0, #currentweaponclipammo:bundle.var_528135f34108ee48 };
    return refill_data;
}

// Namespace skill_survival_life_drain_upgrade
// Params 0, eflags: 0x4
// Checksum 0x43afebbc, Offset: 0x21e
// Size: 0x7a
function private function_164a31309973139a()
{
    bundle = self.var_f6412220e583a288.bundle;
    
    if ( !bundle.var_80a97dab991a0df7 )
    {
        return;
    }
    
    var_e3268429a108888f = { #var_3faa2d6eba2c8c69:bundle.var_167726cf99160923, #var_545a3574cac17377:bundle.var_332e741c1abd42a5, #onlylaststand:bundle.var_8018889ebe0e59bb };
    return var_e3268429a108888f;
}

