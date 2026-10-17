#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_disciple_medal;

// Namespace zombie_disciple_medal
// Params 0
// Checksum 0xae2202e9, Offset: 0x76
// Size: 0x45
function function_1608872af183cf53()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_disciple_medal
// Params 4, eflags: 0x4
// Checksum 0x7e1a72a3, Offset: 0xc3
// Size: 0x86
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( victim.bound_zombies.size >= 5 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_disciplined" );
        
        if ( utility::issharedfuncdefined( #"challenges", #"hash_4dbee06d8fb19056" ) )
        {
            utility::callsharedfunc( #"challenges", #"hash_4dbee06d8fb19056", #"medal_disciplined" );
        }
    }
}

