#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_galileo_medal;

// Namespace zombie_galileo_medal
// Params 0
// Checksum 0x8f46d481, Offset: 0x76
// Size: 0x45
function function_6a00ce83890d953b()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_galileo_medal
// Params 4, eflags: 0x4
// Checksum 0x23ae2fae, Offset: 0xc3
// Size: 0x6d
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_drivefailure" );
    
    if ( victim.combatstarttime && gettime() - victim.combatstarttime <= 10000 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_maxefficiency" );
    }
}

