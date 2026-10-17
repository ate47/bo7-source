#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_abom_medal;

// Namespace zombie_abom_medal
// Params 0
// Checksum 0xdad3bf58, Offset: 0x76
// Size: 0x45
function function_69609f334e1c25a7()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_abom_medal
// Params 4, eflags: 0x4
// Checksum 0x6276d2e8, Offset: 0xc3
// Size: 0x5f
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_decapitated" );
    
    if ( victim.last_dmg_struct.swallowgrenadedamage )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_opportunist" );
    }
}

