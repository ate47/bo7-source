#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_ghoul_medal;

// Namespace zombie_ghoul_medal
// Params 0
// Checksum 0xed792bce, Offset: 0x76
// Size: 0x45
function function_c4fe4b7bc84836a7()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_ghoul_medal
// Params 4, eflags: 0x4
// Checksum 0x4c370639, Offset: 0xc3
// Size: 0xa1
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( isdefined( victim ) && victim.var_da701e38d0bbf750 )
    {
        if ( victim.last_dmg_struct.biscritical )
        {
            namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_domed" );
            
            if ( utility::issharedfuncdefined( #"challenges", #"hash_4dbee06d8fb19056" ) )
            {
                utility::callsharedfunc( #"challenges", #"hash_4dbee06d8fb19056", #"medal_domed" );
            }
        }
    }
}

