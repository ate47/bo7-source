#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_karkinos_medal;

// Namespace zombie_karkinos_medal
// Params 0
// Checksum 0xf0b437f8, Offset: 0x76
// Size: 0x45
function function_837d19342ee3d28a()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_karkinos_medal
// Params 4, eflags: 0x4
// Checksum 0x10f2ecb6, Offset: 0xc3
// Size: 0x72
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( victim.shield_is_on && victim.var_fd553a3e336c17f7 < gettime() && victim.last_dmg_struct.biscritical )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_shieldbreaker" );
    }
}

