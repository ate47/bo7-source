#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_loom_medal;

// Namespace zombie_loom_medal
// Params 0
// Checksum 0x3fe8dfc0, Offset: 0x76
// Size: 0x45
function function_b19f39e07ee0d40d()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_loom_medal
// Params 4, eflags: 0x4
// Checksum 0xcda69a77, Offset: 0xc3
// Size: 0x5a
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( !istrue( victim.var_865aafa52f1e6798 ) )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_arachnophobia" );
        return;
    }
    
    namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_deathweaver" );
}

