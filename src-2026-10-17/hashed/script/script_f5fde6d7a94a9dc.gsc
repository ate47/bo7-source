#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_amalgam_medal;

// Namespace zombie_amalgam_medal
// Params 0
// Checksum 0x1f847a9a, Offset: 0x76
// Size: 0x45
function function_3e2ebd0315b2a350()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_amalgam_medal
// Params 4, eflags: 0x4
// Checksum 0x8616fab0, Offset: 0xc3
// Size: 0x77
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_exorcised" );
    
    if ( victim.partsdestroyedcount >= 5 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_amputator" );
    }
    
    if ( !victim.var_19c07e250767547 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_malpractice" );
    }
}

