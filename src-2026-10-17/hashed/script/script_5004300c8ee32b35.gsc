#using script_6c2f6a14fa53759e;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\status_effects\status_effects;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_dismemberment;

// Namespace zombie_dismemberment
// Params 0
// Checksum 0x79d40f77, Offset: 0x2e4
// Size: 0x62
function init_zombie_dismemberment_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &on_killed_dismember );
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &function_d53144e797d1857 );
    callback::get_template( self.animsetname ) callback::add( "on_corpse_annihilated", &on_corpse_annihilated );
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0xe9f8580c, Offset: 0x34e
// Size: 0x53
function init_zombie_dismemberment()
{
    if ( getdvarint( @"hash_7ffbc35f9f67972", 0 ) )
    {
        return;
    }
    
    self._blackboard.dismemberedlimbs = 0;
    self.func_dismember_head = &dismember_head;
    self.var_cb7646dfc8fffd78 = &is_head_dismembered;
    self.func_dismember_annihilate = &dismember_annihilate;
}

// Namespace zombie_dismemberment
// Params 3
// Checksum 0x93527921, Offset: 0x3a9
// Size: 0x84
function dismember_limb( is_lethal, limb, str_location )
{
    assert( isdefined( is_lethal ), "<dev string:x24>" );
    assert( isdefined( limb ) || isdefined( str_location ), "<dev string:x59>" );
    assert( is_dismemberment_allowed(), "<dev string:x8a>" );
    
    if ( isdefined( limb ) )
    {
        dismember( limb, is_lethal, 0 );
        return;
    }
    
    if ( isdefined( str_location ) )
    {
        dismember( function_7838e35455091288( str_location ), is_lethal, 0 );
    }
}

// Namespace zombie_dismemberment
// Params 1
// Checksum 0xc519db97, Offset: 0x435
// Size: 0xda
function function_7838e35455091288( str_location )
{
    switch ( str_location )
    {
        case #"hash_5d5aac570f6fd382":
        case #"hash_d42e71cd9f1e822f":
        case #"hash_da2f35145aa58933":
            return 1;
        case #"hash_da51cc36a471058":
        case #"hash_51d5d0b9add9cc5a":
        case #"hash_a7980c387477e7bb":
            return 2;
        case #"hash_1cbc508a2fe01b79":
        case #"hash_9536712388e65bce":
        case #"hash_a638fec9040cfcf4":
            return 4;
        case #"hash_168c74e879f0ba11":
        case #"hash_7b36142458a6c2d5":
        case #"hash_810a7426c8bac3ac":
            return 8;
        case #"hash_8a1772f5f912c880":
        case #"hash_92bbfe494d03d772":
        case #"hash_b107b5547c755d23":
            return 16;
    }
    
    return 0;
}

// Namespace zombie_dismemberment
// Params 1
// Checksum 0xd79d5458, Offset: 0x518
// Size: 0x69
function function_14463e39cc414bab( b_is_lethal )
{
    assert( is_dismemberment_allowed(), "<dev string:x8a>" );
    
    if ( !is_dismemberment_allowed() )
    {
        return;
    }
    
    InvalidOpCode( 0x5e, self._blackboard.dismemberedlimbs, 15 );
    // Unknown operator ( 0x5e, t11, PC )
}

// Namespace zombie_dismemberment
// Params 1
// Checksum 0x98e6371, Offset: 0x5dc
// Size: 0x2a
function dismember_head( is_lethal )
{
    assert( is_dismemberment_allowed(), "<dev string:x8a>" );
    dismember( 16, is_lethal );
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0x2b32094a, Offset: 0x60e
// Size: 0x31
function function_a6a09861ae148e04()
{
    assert( !isalive( self ), "<dev string:xab>" );
    assert( is_dismemberment_allowed(), "<dev string:x8a>" );
    detach_limbs( 16 );
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0x76b736ef, Offset: 0x647
// Size: 0xf
function dismember_annihilate()
{
    dismember( 15, 1, 1 );
}

// Namespace zombie_dismemberment
// Params 1
// Checksum 0xc0959beb, Offset: 0x65e
// Size: 0x6c, Type: bool
function is_dismemberment_allowed( shitloc )
{
    if ( !isalive( self ) )
    {
        return false;
    }
    
    if ( status_effects::function_98e705c3c729bbbc( "charm" ) )
    {
        return false;
    }
    
    if ( !val::get( "allow_dismember" ) )
    {
        return false;
    }
    
    if ( self.damageshield )
    {
        return false;
    }
    
    if ( isdefined( shitloc ) && self.var_711b6d4b0194162c && function_7838e35455091288( shitloc ) == 16 )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_dismemberment
// Params 1
// Checksum 0x942f724a, Offset: 0x6d3
// Size: 0xac, Type: bool
function is_limb_dismembered( str_location )
{
    limb_flag = function_7838e35455091288( str_location );
    dismembered_limbs = 0;
    
    if ( isalive( self ) )
    {
        if ( isdefined( self._blackboard.dismemberedlimbs ) )
        {
            dismembered_limbs = self._blackboard.dismemberedlimbs;
        }
    }
    else
    {
        corpse = utility::callsharedfunc( #"ai", #"getcorpseentity" );
        
        if ( isdefined( corpse ) && isdefined( corpse.dismembered_limbs ) )
        {
            dismembered_limbs = corpse.dismembered_limbs;
        }
    }
    
    return ( dismembered_limbs & limb_flag ) > 0;
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0xf77685cb, Offset: 0x788
// Size: 0x32
function is_head_dismembered()
{
    if ( !isdefined( self._blackboard.dismemberedlimbs ) )
    {
        return 0;
    }
    
    return self._blackboard.dismemberedlimbs & 16;
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0xfb0ff297, Offset: 0x7c3
// Size: 0xd
function function_ef98436f345764e3()
{
    self.var_711b6d4b0194162c = 1;
}

// Namespace zombie_dismemberment
// Params 4
// Checksum 0x200c154c, Offset: 0x7d8
// Size: 0x128, Type: bool
function should_annihilate( eattacker, str_hit_loc, weapon, n_damage )
{
    if ( self.b_disable_annihilate || utility::isweaponthrowingknife( weapon ) )
    {
        return false;
    }
    
    if ( self.var_65522105f3bdca37 || isdefined( self.var_bd22ba6c600a23a3 ) || self.forceannihilate || self.b_cleaned_up )
    {
        return true;
    }
    
    if ( isdefined( eattacker ) && isdefined( eattacker.vehicle ) && eattacker.vehicle.forceannihilation )
    {
        return true;
    }
    
    if ( isdefined( weapon ) && weapongetshouldannihilate( weapon ) )
    {
        return true;
    }
    
    if ( isdefined( weapon ) && isdefined( n_damage ) && weaponclass( weapon ) == "spread" && !weapongetblueprintdisableannihilation( weapon ) )
    {
        damage_percent = ( self.maxhealth > 0 ? n_damage / self.maxhealth : 1 ) * 100;
        return ( n_damage > self.maxhealth && damage_percent >= 75 );
    }
    
    return false;
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0xe404cf0c, Offset: 0x909
// Size: 0x16, Type: bool
function is_crawling()
{
    return istrue( self._blackboard.var_6391b373c0f57a6d );
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0x7c7f7d35, Offset: 0x928
// Size: 0x3c
function set_crawling()
{
    if ( !is_crawling() )
    {
        self._blackboard.var_6391b373c0f57a6d = 1;
        self.currentpose = "prone";
        callback::callback( "on_is_crawling_changed" );
    }
}

// Namespace zombie_dismemberment
// Params 1, eflags: 0x4
// Checksum 0xf38ef4a0, Offset: 0x96c
// Size: 0x55
function private on_killed_dismember( params )
{
    if ( self.var_65522105f3bdca37 || isdefined( self.var_bd22ba6c600a23a3 ) && !self.var_cbec80f89c82213a || self.forceannihilate )
    {
        if ( !self.b_cleaned_up )
        {
            annihilate();
        }
    }
}

// Namespace zombie_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x862f983e, Offset: 0x9c9
// Size: 0xaa
function private function_d53144e797d1857( params )
{
    body = zombie_utils::function_4e99fb1239980783( params );
    
    if ( !isdefined( body ) )
    {
        return;
    }
    
    body.var_4ffaa2be1f30674d = self.var_4ffaa2be1f30674d;
    
    if ( !isdefined( self._blackboard.dismemberedlimbs ) || self._blackboard.dismemberedlimbs == 0 )
    {
        return;
    }
    
    body detach_limbs( self._blackboard.dismemberedlimbs );
    body.dismembered_limbs = self._blackboard.dismemberedlimbs;
}

// Namespace zombie_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x8f13599e, Offset: 0xa7b
// Size: 0x88
function private on_corpse_annihilated( params )
{
    level endon( #"game_ended" );
    corpse = params.corpse;
    
    if ( isdefined( corpse ) )
    {
        if ( isdefined( params.annihilate_time ) )
        {
            wait_time = params.annihilate_time - level.framedurationseconds;
            
            if ( wait_time >= level.framedurationseconds )
            {
                wait wait_time;
            }
            else
            {
                waittillframeend();
            }
        }
        
        if ( isdefined( corpse ) )
        {
            corpse annihilate();
        }
    }
}

// Namespace zombie_dismemberment
// Params 2, eflags: 0x4
// Checksum 0x2b72f076, Offset: 0xb0b
// Size: 0xad
function private detach_limbs( limbs, is_lethal_dmg )
{
    if ( limbs & 1 )
    {
        utility::function_7c10ea82c1e305b8( "gib_arm_right", "gibbed" );
    }
    
    if ( limbs & 2 )
    {
        utility::function_7c10ea82c1e305b8( "gib_arm_left", "gibbed" );
    }
    
    if ( limbs & 4 )
    {
        utility::function_7c10ea82c1e305b8( "gib_leg_right", "gibbed" );
    }
    
    if ( limbs & 8 )
    {
        utility::function_7c10ea82c1e305b8( "gib_leg_left", "gibbed" );
    }
    
    if ( limbs & 16 )
    {
        if ( is_lethal_dmg == 0 )
        {
            utility::function_7c10ea82c1e305b8( "gib_head", "gibbed_alive" );
            return;
        }
        
        utility::function_7c10ea82c1e305b8( "gib_head", "gibbed" );
    }
}

// Namespace zombie_dismemberment
// Params 3, eflags: 0x4
// Checksum 0xb9fc77b0, Offset: 0xbc0
// Size: 0x136
function private dismember( limbs, is_lethal_dmg, annihilate )
{
    self notify( #"on_dismembered" );
    
    if ( !is_dismemberment_allowed() )
    {
        return;
    }
    
    var_94cab157d198225a = limbs;
    var_94cab157d198225a &= ~self._blackboard.dismemberedlimbs;
    
    if ( var_94cab157d198225a == 0 )
    {
        return;
    }
    
    if ( gettime() != level.dismember_last_time )
    {
        level.dismember_last_time = gettime();
        level.var_a1ff66b46fd88c30 = 1;
    }
    else
    {
        level.var_a1ff66b46fd88c30++;
        
        if ( level.var_a1ff66b46fd88c30 > 5 )
        {
            return;
        }
    }
    
    self._blackboard.dismemberedlimbs |= var_94cab157d198225a;
    detach_limbs( var_94cab157d198225a, is_lethal_dmg );
    
    if ( var_94cab157d198225a & 16 )
    {
        utility::function_7c10ea82c1e305b8( "base", "base_off" );
        
        if ( !is_lethal_dmg || !val::get( "death" ) )
        {
            thread function_8187a3a57993af4a();
        }
    }
    
    if ( var_94cab157d198225a & 12 && !is_lethal_dmg )
    {
        set_crawling();
    }
    
    if ( annihilate )
    {
        annihilate();
    }
}

// Namespace zombie_dismemberment
// Params 0
// Checksum 0xbc92adb9, Offset: 0xcfe
// Size: 0x1f
function annihilate()
{
    callback::callback( "on_annihilated" );
    utility::function_32b24db3127bff40( "death", "death_annihilate" );
}

// Namespace zombie_dismemberment
// Params 1, eflags: 0x4
// Checksum 0xa5b1e039, Offset: 0xd25
// Size: 0x33
function private count_limbs( limbs )
{
    num_parts = 0;
    
    while ( limbs > 0 )
    {
        num_parts++;
        limbs -= limbs & 0 - limbs;
    }
    
    return num_parts;
}

// Namespace zombie_dismemberment
// Params 0, eflags: 0x4
// Checksum 0x1d2b4a46, Offset: 0xd61
// Size: 0x1b6
function private function_8187a3a57993af4a()
{
    self endon( #"death" );
    self._blackboard.zombiemeleerange = 0;
    self.var_1480bf6f03b7e0be = self.last_dmg_struct;
    
    if ( !asm_bb::bb_movetyperequested( "walk" ) )
    {
        zombie_utils::function_a8ce00e0448cb6f0( "walk", "zombie_shade_headless", 28 );
    }
    
    wait 1;
    self function_786bb6aa1b76c7ee( "shade_headless_last_moments", 1 );
    time = 4;
    damage_amount = self.health / max( time - 1, 1 ) + 1;
    
    while ( true )
    {
        if ( self.health == 1 || damage_amount >= self.health )
        {
            self.do_immediate_ragdoll = !self.noragdoll;
            self.ragdollhitloc = "head";
            self.ragdollimpactvector = ( 0, 0, -1 );
            var_d85c6b92e2f088f0 = isdefined( self.last_dmg_struct ) ? self.last_dmg_struct.eattacker : undefined;
            last_damage_weapon = isdefined( self.last_dmg_struct ) ? self.last_dmg_struct.objweapon : undefined;
            
            if ( self.magic_bullet_shield )
            {
                ai::stop_magic_bullet_shield();
            }
            
            if ( val::get( "damageshield" ) )
            {
                val::nuke( "damageshield" );
            }
            
            self kill( self.origin, var_d85c6b92e2f088f0, undefined, undefined, last_damage_weapon );
            return;
        }
        
        self.health = int( max( 1, self.health - damage_amount ) );
        wait 1;
    }
}

