#using script_340c4d9122dfd527;
#using scripts\common\callbacks;

#namespace zombie_mangler_ranged_attack;

// Namespace zombie_mangler_ranged_attack
// Params 0
// Checksum 0xf8dee9e3, Offset: 0x25b
// Size: 0x82
function function_20fe09ffbe284aa()
{
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_damaged", &mangler_cannon_damage_callback );
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &function_a0994569ff29c8e1 );
    callback::get_template( self.animsetname ) callback::add( "out_playable_space", &out_playable_space );
    callback::get_template( self.animsetname ) callback::add( "in_playable_space", &in_playable_space );
}

// Namespace zombie_mangler_ranged_attack
// Params 0
// Checksum 0xfdad6b2e, Offset: 0x2e5
// Size: 0x1ff
function init_mangler_ranged_attack()
{
    thread function_2915e61c4aab7f74();
    thread function_fdc1569b61cab0b6();
    self.var_b3e22725548b81d3 = &function_b3e22725548b81d3;
    function_56896f88f1cb71fe();
    self.gun_damage_taken = 0;
    self.var_22679ec68e9c55c0 = self.zombieaisettings.var_d3de1a9faac42deb.staggerdamagethreshold * self.health;
    self.var_727f4a2566bea620 = self.zombieaisettings.var_d3de1a9faac42deb.var_b2cbfd0d1258985e;
    self.torpedo_cooldown = self.zombieaisettings.var_d3de1a9faac42deb.torpedocooldown;
    self.consecutive_ranged_attack = self.zombieaisettings.var_d3de1a9faac42deb.var_ef0b8a60fbe0d2ab;
    self.consecutive_ranged_attack_cooldown = self.zombieaisettings.var_d3de1a9faac42deb.var_6fa7ba2577bc6bee;
    self.var_acdcb2f336cfc9 = 0;
    self.interrupt_ranged_attack_cooldown = self.zombieaisettings.var_d3de1a9faac42deb.var_5fd24c4c5397f36f;
    
    if ( !isdefined( self.var_577dec43cf1caedf ) )
    {
        self.var_577dec43cf1caedf = 1;
    }
    
    self function_786bb6aa1b76c7ee( "torpedo_cooldown", int( self.torpedo_cooldown * 1000 ) );
    self function_786bb6aa1b76c7ee( "can_interrupt_cannon", 0 );
    self function_786bb6aa1b76c7ee( "torpedo_min_attack_range", self.zombieaisettings.var_d3de1a9faac42deb.torpedominrange );
    self function_786bb6aa1b76c7ee( "torpedo_max_attack_range", self.zombieaisettings.var_d3de1a9faac42deb.torpedomaxrange );
    self function_786bb6aa1b76c7ee( "torpedo_max_target_count", self.var_577dec43cf1caedf );
    self.var_5234da73eeab6e09 = 10;
    self.var_fd762e426e638cda = cos( self.zombieaisettings.var_d3de1a9faac42deb.var_93a88173ded27359 );
}

// Namespace zombie_mangler_ranged_attack
// Params 1
// Checksum 0xdf70bdad, Offset: 0x4ec
// Size: 0x49
function function_2685f4f10e1b1b49( b_enable )
{
    if ( b_enable && !self.var_d54138bfd4334f7d && !self.b_in_spawn_closet )
    {
        self function_786bb6aa1b76c7ee( "can_ranged_attack", 1 );
        return;
    }
    
    self function_786bb6aa1b76c7ee( "can_ranged_attack", 0 );
}

// Namespace zombie_mangler_ranged_attack
// Params 0
// Checksum 0x1c37d6d1, Offset: 0x53d
// Size: 0x13
function function_56896f88f1cb71fe()
{
    function_2685f4f10e1b1b49( !self.b_in_spawn_closet );
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0xea5e1e71, Offset: 0x558
// Size: 0x14
function private out_playable_space( params )
{
    function_2685f4f10e1b1b49( 0 );
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0xc5c33926, Offset: 0x574
// Size: 0x15
function private in_playable_space( params )
{
    function_2685f4f10e1b1b49( 1 );
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0x8cc7c5c1, Offset: 0x591
// Size: 0xd4
function private mangler_cannon_damage_callback( params )
{
    if ( self getaiblackboarddynamic( "can_interrupt_cannon" ) )
    {
        if ( params.metabonename == "j_weapon_spin" )
        {
            self.gun_damage_taken += params.idamage;
            self setscriptablepartstate( "cannon_weakpoint", "hit" );
            
            if ( self.gun_damage_taken >= self.var_22679ec68e9c55c0 && !self.var_d54138bfd4334f7d )
            {
                self setscriptablepartstate( "cannon_charge", "interrupt" );
                self function_786bb6aa1b76c7ee( "torpedo_cooldown", int( self.interrupt_ranged_attack_cooldown * 1000 ) );
                self function_786bb6aa1b76c7ee( "can_interrupt_cannon", 0 );
                self function_786bb6aa1b76c7ee( "torpedo_attack_interrupted", 1 );
            }
            
            self setscriptablepartstate( "cannon_weakpoint", "default" );
        }
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0x53d6c887, Offset: 0x66d
// Size: 0xbb
function private function_fdc1569b61cab0b6()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"enter_ranged_attack" );
        self.var_7db4a2db403fa485 = undefined;
        function_6fd1ef5a500103ad();
        self setbtgoalstationary( 2 );
        self clearpath();
        self setscriptablepartstate( "cannon_charge", "charge" );
        self setscriptablepartstate( "cannon_glow", "cannon_glow_on" );
        childthread function_cb963e9e08673d4f();
        self waittill( #"exit_ranged_attack" );
        
        if ( !self.var_7db4a2db403fa485 )
        {
            function_ff3db6553561bf1( self.torpedo_target_cached );
        }
        
        self setscriptablepartstate( "cannon_charge", "default" );
        self setscriptablepartstate( "cannon_glow", "cannon_glow_off" );
        self clearbtgoal( 2 );
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0xc93d5064, Offset: 0x730
// Size: 0x29
function private function_a0994569ff29c8e1( params )
{
    if ( !self.var_7db4a2db403fa485 )
    {
        function_ff3db6553561bf1( self.torpedo_target_cached );
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0x9a838d5d, Offset: 0x761
// Size: 0x37
function private function_6fd1ef5a500103ad()
{
    if ( isplayer( self.enemy ) )
    {
        self.enemy function_a58e1bd7ca9f6222( "torpedo_attack" );
        self.torpedo_target_cached = self.enemy;
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0x84b3fff1, Offset: 0x7a0
// Size: 0x21
function private function_ff3db6553561bf1( torpedo_target )
{
    if ( isplayer( torpedo_target ) )
    {
        torpedo_target function_31d0b50675d9d6e( "torpedo_attack" );
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0xaaa1ac83, Offset: 0x7c9
// Size: 0x3e
function private function_cb963e9e08673d4f()
{
    self endon( #"enter_ranged_attack" );
    self endon( #"exit_ranged_attack" );
    self.gun_damage_taken = 0;
    self waittill( #"interrupt_window_start" );
    self function_786bb6aa1b76c7ee( "can_interrupt_cannon", 1 );
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0x802061f1, Offset: 0x80f
// Size: 0x3c6
function private function_b3e22725548b81d3()
{
    self setscriptablepartstate( "cannon_charge", "shoot" );
    self setscriptablepartstate( "cannon_glow", "cannon_glow_off" );
    
    if ( self._blackboard.zombieattractoristarget )
    {
        target = undefined;
        target_pos = self._blackboard.var_aead9ff2aa3beb9f;
    }
    else if ( isdefined( self.enemy ) )
    {
        target = self.enemy;
        target_pos = self.enemy.origin;
    }
    else
    {
        target = undefined;
        target_pos = function_5afc2b1caf30744c( self.zombieaisettings.var_d3de1a9faac42deb.torpedomaxrange );
    }
    
    torpedo_pos = self gettagorigin( "j_weapon_spin" );
    self function_786bb6aa1b76c7ee( "torpedo_cooldown", int( self.torpedo_cooldown * 1000 ) );
    
    if ( self.consecutive_ranged_attack )
    {
        if ( self.var_acdcb2f336cfc9 < gettime() )
        {
            self.var_acdcb2f336cfc9 = gettime() + int( self.consecutive_ranged_attack_cooldown * 1000 );
            self function_786bb6aa1b76c7ee( "torpedo_cooldown", 0 );
        }
    }
    
    self function_786bb6aa1b76c7ee( "can_interrupt_cannon", 0 );
    launch_direction = get_torpedo_launch_direction( anglestoforward( self.angles ), torpedo_pos, target_pos, self.var_fd762e426e638cda );
    projectilemodel = "tag_origin_mangler_torpedo";
    
    if ( isdefined( self.zombieaisettings.var_d3de1a9faac42deb.projectilemodel ) )
    {
        if ( self.zombieaisettings.var_d3de1a9faac42deb.projectilemodel != "" )
        {
            projectilemodel = self.zombieaisettings.var_d3de1a9faac42deb.projectilemodel;
        }
    }
    
    damage_outer = self.zombieaisettings.var_d3de1a9faac42deb.var_e1eaf1c261d15387;
    damage_inner = self.zombieaisettings.var_d3de1a9faac42deb.var_3d7fca6a765d052c;
    
    if ( isdefined( self.ranged_damage_multiplier ) )
    {
        damage_outer = max( damage_outer * self.ranged_damage_multiplier, 0 );
        damage_inner = max( damage_inner * self.ranged_damage_multiplier, 0 );
    }
    
    if ( isplayer( target ) && !( self.torpedo_target_cached === target ) )
    {
        function_ff3db6553561bf1( self.torpedo_target_cached );
        function_6fd1ef5a500103ad();
    }
    
    self.var_7db4a2db403fa485 = isplayer( target );
    manglercannon_torpedo::mangler_cannon_shoot_torpedo( torpedo_pos, launch_direction, target, target_pos, self.zombieaisettings.var_d3de1a9faac42deb.torpedodetonationdist, self.zombieaisettings.var_d3de1a9faac42deb.torpedovelocity, self.zombieaisettings.var_d3de1a9faac42deb.torpedomoveintervaltime, self.zombieaisettings.var_d3de1a9faac42deb.torpedomaxrange, self.zombieaisettings.var_d3de1a9faac42deb.var_f33c9afdc4ae8b93, self.zombieaisettings.var_d3de1a9faac42deb.torpedoradius, self.zombieaisettings.var_d3de1a9faac42deb.torpedoblastradius, damage_outer, damage_inner, self.zombieaisettings.var_d3de1a9faac42deb.var_7a2fb685dc8df39c, self.zombieaisettings.var_d3de1a9faac42deb.var_7a0ca485dc67844e, 0, 0, 0, 1, "none", projectilemodel, &function_ff3db6553561bf1 );
}

// Namespace zombie_mangler_ranged_attack
// Params 4, eflags: 0x4
// Checksum 0xcbe05645, Offset: 0xbdd
// Size: 0xb8
function private get_torpedo_launch_direction( forward_dir, torpedo_pos, torpedo_target_pos, max_angle )
{
    if ( torpedo_target_pos == torpedo_pos )
    {
        return ( 0, 0, 0 );
    }
    
    vec_to_enemy = torpedo_target_pos - torpedo_pos;
    vec_to_enemy_normal = vectornormalize( vec_to_enemy );
    angle_to_enemy = vectordot( forward_dir, vec_to_enemy_normal );
    
    if ( angle_to_enemy >= max_angle )
    {
        return vec_to_enemy_normal;
    }
    
    plane_normal = vectorcross( forward_dir, vec_to_enemy_normal );
    perpendicular_normal = vectorcross( plane_normal, forward_dir );
    torpedo_dir = forward_dir * cos( max_angle ) + perpendicular_normal * sin( max_angle );
    return torpedo_dir;
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0xa8682af2, Offset: 0xc9e
// Size: 0x2a
function private function_2915e61c4aab7f74()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"bshoottorpedostarted" );
        thread function_36be823944d2ed1c();
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 0, eflags: 0xc
// Checksum 0x76b4330e, Offset: 0xcd0
// Size: 0x65
function private function_36be823944d2ed1c()
{
    self notify( #"hash_e17c99792e9ad709" );
    self endon( #"hash_e17c99792e9ad709" );
    self endon( #"death" );
    self endon( #"hash_36e06f5a5d81d945" );
    self endon( #"bshoottorpedostarted" );
    waitframe();
    self waittill( #"hash_2d0be06705f91632" );
    
    if ( isdefined( self.var_b3e22725548b81d3 ) )
    {
        [[ self.var_b3e22725548b81d3 ]]();
    }
}

// Namespace zombie_mangler_ranged_attack
// Params 1, eflags: 0x4
// Checksum 0x8c6fc597, Offset: 0xd3d
// Size: 0x46
function private function_5afc2b1caf30744c( maxrange )
{
    start = self geteye();
    dir = anglestoforward( self.angles );
    end = start + maxrange * dir;
    return end;
}

