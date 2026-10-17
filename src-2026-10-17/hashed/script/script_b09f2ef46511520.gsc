#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_parasite_medal;

// Namespace zombie_parasite_medal
// Params 0
// Checksum 0x7eef1038, Offset: 0x80
// Size: 0x45
function function_774fb122cb5c4051()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_parasite_medal
// Params 4, eflags: 0x4
// Checksum 0x13e6e063, Offset: 0xcd
// Size: 0x145
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( sweapon.type == "bullet" )
    {
        if ( !isdefined( self.parasitekillinfo ) )
        {
            self.parasitekillinfo = { #killcount:1, #triggerid:self.var_30f392ef3b86faf0 };
            return;
        }
        
        if ( self.parasitekillinfo.triggerid != self.var_30f392ef3b86faf0 )
        {
            self.parasitekillinfo.triggerid = self.var_30f392ef3b86faf0;
            self.parasitekillinfo.killcount = 1;
            return;
        }
        
        self.parasitekillinfo.killcount++;
        
        if ( self.parasitekillinfo.killcount % 3 == 0 )
        {
            namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_antiparasitic" );
        }
        
        if ( utility::issharedfuncdefined( #"challenges", #"hash_4dbee06d8fb19056" ) )
        {
            utility::callsharedfunc( #"challenges", #"hash_4dbee06d8fb19056", #"medal_antiparasitic" );
        }
    }
}

