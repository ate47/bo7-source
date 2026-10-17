#using script_3063a3a5a2e024a0;
#using scripts\common\callbacks;

#namespace zombie_vermin_leap_attack;

// Namespace zombie_vermin_leap_attack
// Params 0
// Checksum 0xd88392c4, Offset: 0xd4
// Size: 0x49
function function_e048cfb0a8e71467()
{
    zombie_leap_attack::init_zombie_leap_attack_global();
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &function_b7dd02b2f0d6a2c1 );
    callback::get_template( self.animsetname ) callback::add( "on_turned", &function_a4944ca11f0ecb0e );
}

// Namespace zombie_vermin_leap_attack
// Params 0
// Checksum 0xc7c8c47b, Offset: 0x125
// Size: 0x50
function init_zombie_vermin_leap_attack()
{
    self.leap_attack_state = "leap_attack_in";
    
    if ( !isdefined( self.var_577dec43cf1caedf ) )
    {
        self.var_577dec43cf1caedf = 1;
    }
    
    self function_786bb6aa1b76c7ee( "leap_max_target_count", self.var_577dec43cf1caedf );
    zombie_leap_attack::init_zombie_leap_attack();
    thread function_a20e9207db32b2be();
    thread function_c90fbb7c1378982b();
}

// Namespace zombie_vermin_leap_attack
// Params 0, eflags: 0x4
// Checksum 0xd17ef97f, Offset: 0x17d
// Size: 0x75
function private function_a20e9207db32b2be()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"leap_attack_start" );
        
        if ( isplayer( self.enemy ) )
        {
            self.leaptarget = self.enemy;
            self.leaptarget function_a58e1bd7ca9f6222( "leap_attack" );
        }
        
        self.var_542134bab16723fb = self.var_a13bed1ac47e1b2c;
        self.var_a13bed1ac47e1b2c = 1;
    }
}

// Namespace zombie_vermin_leap_attack
// Params 0, eflags: 0x4
// Checksum 0x48de5263, Offset: 0x1fa
// Size: 0x6c
function private function_c90fbb7c1378982b()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"leap_attack_end" );
        
        if ( isalive( self.leaptarget ) )
        {
            self.leaptarget function_31d0b50675d9d6e( "leap_attack" );
            self.leaptarget = undefined;
        }
        
        self.var_a13bed1ac47e1b2c = self.var_542134bab16723fb;
        self.var_542134bab16723fb = undefined;
    }
}

// Namespace zombie_vermin_leap_attack
// Params 1, eflags: 0x4
// Checksum 0xc3ebd88b, Offset: 0x26e
// Size: 0x2c
function private function_b7dd02b2f0d6a2c1( params )
{
    if ( isdefined( self.leaptarget ) )
    {
        self.leaptarget function_31d0b50675d9d6e( "leap_attack" );
    }
}

// Namespace zombie_vermin_leap_attack
// Params 1, eflags: 0x4
// Checksum 0x65ffef1d, Offset: 0x2a2
// Size: 0x14
function private function_a4944ca11f0ecb0e( params )
{
    zombie_leap_attack::set_leap_attack_cooldown( 0 );
}

