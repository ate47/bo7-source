#using script_16ea1b94f0f381b3;
#using scripts\common\utility;

#namespace zombie_vermin_medal;

// Namespace zombie_vermin_medal
// Params 0
// Checksum 0xb723e08b, Offset: 0x76
// Size: 0x45
function function_5b9d1100ed8bd937()
{
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", self.animsetname, &on_killed_medal );
    }
}

// Namespace zombie_vermin_medal
// Params 4, eflags: 0x4
// Checksum 0x629bdab7, Offset: 0xc3
// Size: 0x7d
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( !isdefined( self.vermin_kill_count ) )
    {
        self.vermin_kill_count = 0;
    }
    
    if ( self.vermin_kill_count == 0 )
    {
        thread function_1ffa4f4a646a34f1();
    }
    
    self.vermin_kill_count++;
    
    if ( self.vermin_kill_count % 3 == 0 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_pesticide" );
    }
}

// Namespace zombie_vermin_medal
// Params 0, eflags: 0x4
// Checksum 0x8ed08354, Offset: 0x148
// Size: 0x17
function private function_1ffa4f4a646a34f1()
{
    wait 0.1;
    
    if ( isdefined( self ) )
    {
        self.vermin_kill_count = 0;
    }
}

