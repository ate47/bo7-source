#using script_3774b0533d79d9a0;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\status_effects\status_effects;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_base_dismemberment;

// Namespace zombie_base_dismemberment
// Params 0, eflags: 0x1
// Checksum 0x340d0199, Offset: 0x3de
// Size: 0x20
function autoexec init()
{
    utility::registersharedfunc( #"zombie_dismemberment", #"dismemberhead", &dismember_head );
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0xde818642, Offset: 0x406
// Size: 0xd4
function init_zombie_base_dismemberment_precache( aitypescriptbundle )
{
    if ( isdefined( aitypescriptbundle.zombieaisetting ) )
    {
        settings = getscriptbundle( hashcat( %"zombieaisettings:", aitypescriptbundle.zombieaisetting ) );
        
        if ( isdefined( settings ) )
        {
            prefix = settings.vfxaliasprefix ?? "zombie";
            
            if ( settings.annihilatevfx )
            {
                utility::add_fx( prefix + "_annihilate", settings.annihilatevfx );
            }
            
            if ( settings.annihilatevfxsafe )
            {
                utility::add_fx( prefix + "_annihilate_safe", settings.annihilatevfxsafe );
            }
        }
    }
    
    utility::registersharedfunc( #"ai", #"islimbdismembered", &is_limb_dismembered );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x2d0a3b7a, Offset: 0x4e2
// Size: 0xa0
function init_zombie_base_dismemberment_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_damaged", &on_damaged_dismember );
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &on_killed_dismember );
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &function_d53144e797d1857 );
    callback::get_template( self.animsetname ) callback::add( "on_corpse_annihilated", &on_corpse_annihilated );
    utility::registersharedfunc( #"zombie", #"hash_a32faecccd434d84", &function_14463e39cc414bab );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0xcf3b306f, Offset: 0x58a
// Size: 0x53
function init_zombie_base_dismemberment()
{
    if ( getdvarint( @"hash_bcec05140f24d4a1", 0 ) )
    {
        return;
    }
    
    self._blackboard.dismemberedlimbs = 0;
    self.func_dismember_head = &dismember_head;
    self.var_cb7646dfc8fffd78 = &is_head_dismembered;
    self.func_dismember_annihilate = &dismember_annihilate;
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x44b66820, Offset: 0x5e5
// Size: 0x1e
function function_a6a09861ae148e04()
{
    assert( !isalive( self ), "<dev string:x24>" );
    detach_limbs( 16 );
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x660a021b, Offset: 0x60b
// Size: 0x17
function dismember_head( is_lethal )
{
    dismember( 16, is_lethal );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x3af2084b, Offset: 0x62a
// Size: 0x32
function is_head_dismembered()
{
    if ( !isdefined( self._blackboard.dismemberedlimbs ) )
    {
        return 0;
    }
    
    return self._blackboard.dismemberedlimbs & 16;
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x59abffca, Offset: 0x665
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

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x9a632cf4, Offset: 0x71a
// Size: 0xd
function dismember_left_arm()
{
    dismember( 2, 0, 0 );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0xb17a501b, Offset: 0x72f
// Size: 0xd
function dismember_right_arm()
{
    dismember( 1, 0, 0 );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x2d0d32b4, Offset: 0x744
// Size: 0xd
function dismember_arms()
{
    dismember( 3, 0, 0 );
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x77edd26a, Offset: 0x759
// Size: 0x18
function dismember_left_leg( is_lethal_dmg )
{
    dismember( 8, is_lethal_dmg, 0 );
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x5cf4ae8a, Offset: 0x779
// Size: 0x18
function dismember_right_leg( is_lethal_dmg )
{
    dismember( 4, is_lethal_dmg, 0 );
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x3ce1b756, Offset: 0x799
// Size: 0x18
function dismember_legs( is_lethal_dmg )
{
    dismember( 12, is_lethal_dmg, 0 );
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0xbe980c02, Offset: 0x7b9
// Size: 0xf
function dismember_annihilate()
{
    dismember( 15, 1, 1 );
}

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0xb2a39610, Offset: 0x7d0
// Size: 0x6c, Type: bool
function private allow_dismemberment( shitloc )
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

// Namespace zombie_base_dismemberment
// Params 2, eflags: 0x4
// Checksum 0x4845b187, Offset: 0x845
// Size: 0x75, Type: bool
function private is_friendly_damage( agent, attacker )
{
    if ( isdefined( attacker ) && isdefined( agent ) && isdefined( agent.team ) )
    {
        if ( attacker.team == agent.team )
        {
            return true;
        }
        
        if ( attacker.owner.team == agent.team )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x87da051, Offset: 0x8c3
// Size: 0x42b
function private on_damaged_dismember( params )
{
    if ( is_friendly_damage( self, params.eattacker ) || !allow_dismemberment( params.shitloc ) || weaponisimpaling( params.sweapon ) )
    {
        return;
    }
    
    is_lethal_dmg = params.idamage >= self.health;
    is_explosion = isexplosivedamagemod( params.smeansofdeath );
    limb = function_7838e35455091288( params.shitloc );
    
    if ( is_lethal_dmg )
    {
        if ( should_annihilate( params.eattacker, params.shitloc, params.sweapon, params.idamage ) )
        {
            dismember( 15, is_lethal_dmg, 1 );
            return;
        }
        
        if ( is_explosion )
        {
            function_14463e39cc414bab( is_lethal_dmg );
            
            if ( is_lethal_dmg && ( params.smeansofdeath != "MOD_PROJECTILE_SPLASH" && params.smeansofdeath != "MOD_PROJECTILE" && params.weaponelementtype != "fire" && params.sweapon.classname != "throwingknife" || function_94d6b4a927b1e0a0( params.sweapon ) ) )
            {
                self.forceragdollimmediate = 1;
                var_13605a17fee734d5 = getdvarfloat( @"hash_7203d10072b66cc9", 100 );
                var_dc1d9d7f5f172f31 = getdvarfloat( @"hash_b82aefef04f63ebd", 1500 );
                var_457399733c8f983c = getdvarfloat( @"hash_cd037fbfa057f118", 100 );
                var_24674a480ef455b6 = getdvarfloat( @"hash_6d2f434b6e94dbfa", 2500 );
                var_9d418738f90e5a0a = clamp( math::remap( distance( self.origin, params.vpoint ), 0, var_457399733c8f983c, 0, 1 ), 0, 1 );
                up_vector = ( 0, 0, 1 ) * ( var_dc1d9d7f5f172f31 + ( 1 - var_9d418738f90e5a0a ) * var_24674a480ef455b6 );
                self.ragdollimpactvector = ( params.vdir ?? ( 0, 0, 0 ) ) * var_13605a17fee734d5 + up_vector;
                self.ragdollhitloc = "torso_lower";
            }
            
            return;
        }
        
        if ( limb != 0 && limb != 1 )
        {
            dismember( limb, is_lethal_dmg );
            return;
        }
        
        if ( !zombie_emergence_spawning::function_7922b2bb1359d329() && randomint( 100 ) < 50 )
        {
            function_14463e39cc414bab( is_lethal_dmg );
            
            if ( randomint( 100 ) < 50 )
            {
                function_14463e39cc414bab( is_lethal_dmg );
            }
        }
        
        return;
    }
    
    health_percent = self.maxhealth > 0 ? self.health / self.maxhealth : 0;
    damage_percent = self.maxhealth > 0 ? params.idamage / self.maxhealth : 1;
    
    if ( is_explosion && health_percent - damage_percent < self.zombieaisettings.var_ecf2834107695254 && utility::percent_chance( damage_percent * 100 ) )
    {
        dismember( 12, is_lethal_dmg );
    }
    
    if ( limb == 16 )
    {
        if ( health_percent - damage_percent < self.zombieaisettings.var_b964a71d0bd52af && randomint( 100 ) < 50 )
        {
            dismember( 16, is_lethal_dmg );
        }
        
        return;
    }
    
    if ( limb == 2 || limb == 0 )
    {
        if ( damage_percent > self.zombieaisettings.var_e32dccf015c46ec4 / 100 && randomint( 100 ) < 5 )
        {
            dismember( 2, is_lethal_dmg );
        }
        
        return;
    }
    
    if ( limb == 4 || limb == 8 )
    {
        if ( damage_percent >= self.zombieaisettings.var_8bc498800d892ae3 && utility::percent_chance( 30 ) )
        {
            dismember( limb, is_lethal_dmg );
        }
    }
}

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x3ba1ce4d, Offset: 0xcf6
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

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0xfa956164, Offset: 0xd53
// Size: 0xbc
function private function_d53144e797d1857( params )
{
    if ( !isdefined( params.body ) )
    {
        return;
    }
    
    params.body.var_4ffaa2be1f30674d = self.var_4ffaa2be1f30674d;
    
    if ( !isdefined( self._blackboard.dismemberedlimbs ) )
    {
        return;
    }
    
    if ( self._blackboard.dismemberedlimbs == 0 )
    {
        return;
    }
    
    params.body detach_limbs( self._blackboard.dismemberedlimbs );
    params.body.dismembered_limbs = self._blackboard.dismemberedlimbs;
}

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x473c6373, Offset: 0xe17
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

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x89d5613, Offset: 0xea7
// Size: 0xda
function private function_7838e35455091288( str_location )
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

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0x2000220, Offset: 0xf8a
// Size: 0x56
function function_14463e39cc414bab( b_is_lethal )
{
    if ( !allow_dismemberment() )
    {
        return;
    }
    
    InvalidOpCode( 0x5e, self._blackboard.dismemberedlimbs, 15 );
    // Unknown operator ( 0x5e, t11, PC )
}

// Namespace zombie_base_dismemberment
// Params 2, eflags: 0x4
// Checksum 0x330fecad, Offset: 0x103b
// Size: 0xdd
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
        if ( utility::function_9f2c41c1dcc8c94( "base", "base_injected_eyes" ) )
        {
            utility::function_7c10ea82c1e305b8( "base", "base_off" );
        }
        
        if ( is_lethal_dmg == 0 )
        {
            utility::function_7c10ea82c1e305b8( "gib_head", "gibbed_alive" );
            callback::callback( "zombie_base_dismember_head_alive" );
            return;
        }
        
        utility::function_7c10ea82c1e305b8( "gib_head", "gibbed" );
    }
}

// Namespace zombie_base_dismemberment
// Params 3, eflags: 0x4
// Checksum 0x2a52492e, Offset: 0x1120
// Size: 0x189
function private dismember( limbs, is_lethal_dmg, annihilate )
{
    self notify( #"on_dismembered" );
    
    if ( !allow_dismemberment() )
    {
        return;
    }
    
    var_94cab157d198225a = limbs;
    var_94cab157d198225a &= ~self._blackboard.dismemberedlimbs;
    
    if ( var_94cab157d198225a & 3 && self._blackboard.dismemberedlimbs & 3 )
    {
        var_94cab157d198225a &= ~3;
    }
    
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
        utility::function_7c10ea82c1e305b8( "ambient", "off" );
        
        if ( !is_lethal_dmg || !val::get( "death" ) )
        {
            thread function_59ddc82751098cc4();
        }
    }
    
    if ( var_94cab157d198225a & 12 && !is_lethal_dmg )
    {
        set_crawling( 1 );
        zombie_emergence_spawning::disable_emergence_spawning();
    }
    
    if ( var_94cab157d198225a & 16 )
    {
        zombie_emergence_spawning::disable_emergence_spawning();
    }
    
    if ( annihilate )
    {
        annihilate();
    }
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0xe80cc0c4, Offset: 0x12b1
// Size: 0x120
function annihilate( var_3ea297bb39182f77 )
{
    callback::callback( "on_annihilated" );
    self.nocorpse = 1;
    self.annihilated = 1;
    
    if ( isdefined( self.var_4ffaa2be1f30674d ) && isdefined( level._effect[ self.var_4ffaa2be1f30674d ] ) )
    {
        effect_id = level._effect[ self.var_4ffaa2be1f30674d ];
    }
    else
    {
        prefix = self.zombieaisettings.vfxaliasprefix ?? "zombie";
        
        if ( var_3ea297bb39182f77 || !isdismembermentenabled() )
        {
            effect_id = level._effect[ prefix + "_annihilate_safe" ];
        }
        else
        {
            effect_id = level._effect[ prefix + "_annihilate" ];
        }
    }
    
    if ( isdefined( effect_id ) )
    {
        effect_pos = self gettagorigin( "j_spine4" );
        effect_angles = self gettagangles( "j_spine4" );
        
        if ( isdefined( effect_pos ) && isdefined( effect_angles ) )
        {
            playfx( effect_id, effect_pos, anglestoforward( effect_angles ), anglestoup( effect_angles ) );
        }
    }
}

// Namespace zombie_base_dismemberment
// Params 4
// Checksum 0x2b340d92, Offset: 0x13d9
// Size: 0xfb, Type: bool
function should_annihilate( eattacker, str_hit_loc, weapon, n_damage )
{
    if ( self.b_disable_annihilate || utility::isweaponthrowingknife( weapon ) )
    {
        return false;
    }
    
    if ( isdefined( eattacker ) && isdefined( eattacker.vehicle ) && eattacker.vehicle.forceannihilation )
    {
        return true;
    }
    
    if ( isdefined( weapon ) && n_damage > self.health && weapongetshouldannihilate( weapon ) )
    {
        return true;
    }
    
    if ( isdefined( weapon ) && weaponclass( weapon ) == "spread" && !weapongetblueprintdisableannihilation( weapon ) )
    {
        damage_percent = ( self.maxhealth > 0 ? n_damage / self.maxhealth : 1 ) * 100;
        return ( n_damage > self.maxhealth && damage_percent >= 75 );
    }
    
    return false;
}

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x68356db9, Offset: 0x14dd
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

// Namespace zombie_base_dismemberment
// Params 0, eflags: 0x4
// Checksum 0xfed34a45, Offset: 0x1519
// Size: 0x206
function private function_59ddc82751098cc4()
{
    self endon( #"death" );
    self.var_1480bf6f03b7e0be = self.last_dmg_struct;
    
    if ( !asm_bb::bb_movetyperequested( "walk" ) )
    {
        zombie_utils::function_a8ce00e0448cb6f0( "walk", "zombie_base_headless", 28 );
    }
    
    utility::ent_flag_waitopen_any( "stop_dismember_headless_dot" );
    self._blackboard.zombiemeleerange = 0;
    utility::ent_flag_set( "zm_mod_health_regen_disable" );
    wait 1;
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
            
            if ( last_damage_weapon == level.weaponnone && self.var_1480bf6f03b7e0be.sweapon != level.weaponnone )
            {
                last_damage_weapon = self.var_1480bf6f03b7e0be.sweapon;
            }
            
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

// Namespace zombie_base_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x1e8ef2c8, Offset: 0x1727
// Size: 0x2a, Type: bool
function private function_94d6b4a927b1e0a0( weapon )
{
    return utility::callsharedfunc( #"ai", #"hash_dc7f360ca2fd1558", weapon ) ?? 0;
}

// Namespace zombie_base_dismemberment
// Params 1
// Checksum 0xb077debc, Offset: 0x175a
// Size: 0x86
function set_crawling( is_crawling )
{
    already_crawling = is_crawling();
    assert( is_crawling || !already_crawling, "<dev string:x35>" );
    
    if ( is_crawling != already_crawling && isdefined( self._blackboard.var_6391b373c0f57a6d ) )
    {
        self._blackboard.var_6391b373c0f57a6d = is_crawling;
        self.currentpose = "prone";
        callback::callback( "on_is_crawling_changed" );
    }
}

// Namespace zombie_base_dismemberment
// Params 0
// Checksum 0x2980428c, Offset: 0x17e8
// Size: 0x16, Type: bool
function is_crawling()
{
    return istrue( self._blackboard.var_6391b373c0f57a6d );
}

/#

    // Namespace zombie_base_dismemberment
    // Params 0
    // Checksum 0x31e480ad, Offset: 0x1807
    // Size: 0xc8, Type: dev
    function setup_dismemberment_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x60>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x71>", "<dev string:x80>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:x92>", "<dev string:xa6>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:xbd>", "<dev string:xd0>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:xe6>", "<dev string:xfa>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:x111>", "<dev string:x124>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:x13a>", "<dev string:x14e>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:x165>", "<dev string:x17a>", &debug_dismember );
        devgui::function_cd4e263c1f3018ae( "<dev string:x192>", "<dev string:x1aa>", &make_crawlers );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_base_dismemberment
    // Params 1
    // Checksum 0xbfd3dd72, Offset: 0x18d7
    // Size: 0xd2, Type: dev
    function debug_dismember( param )
    {
        switch ( param[ 0 ] )
        {
            case #"hash_b107b5547c755d23":
                debug_dismember_all_ai( 16, 0, 0 );
                break;
            case #"hash_948f3990649345f0":
                debug_dismember_all_ai( 1, 0, 0 );
                break;
            case #"hash_657829471a2d778d":
                debug_dismember_all_ai( 2, 0, 0 );
                break;
            case #"hash_3341ee903158263a":
                debug_dismember_all_ai( 4, 0, 0 );
                break;
            case #"hash_12529c46ee2fd68f":
                debug_dismember_all_ai( 8, 0, 0 );
                break;
            case #"hash_e98e93069693d456":
                debug_dismember_all_ai( 12, 0, 0 );
                break;
            case #"hash_b5ccd1af3942a54":
                debug_dismember_all_ai( 15, 1, 1 );
                break;
        }
    }

    // Namespace zombie_base_dismemberment
    // Params 1, eflags: 0x4
    // Checksum 0x1c605000, Offset: 0x19b1
    // Size: 0x91, Type: dev
    function private make_crawlers( params )
    {
        all_ai = getaiarray();
        
        foreach ( ai in all_ai )
        {
            ai set_crawling( 1 );
        }
    }

    // Namespace zombie_base_dismemberment
    // Params 3
    // Checksum 0x97a51556, Offset: 0x1a4a
    // Size: 0xf0, Type: dev
    function debug_dismember_all_ai( limbs, is_lethal_dmg, annihilate )
    {
        player = level.players[ 0 ];
        all_ai = getaiarray();
        
        foreach ( ai in all_ai )
        {
            if ( !isdefined( ai._blackboard.dismemberedlimbs ) )
            {
                continue;
            }
            
            ai dismember( limbs, is_lethal_dmg, annihilate );
            
            if ( is_lethal_dmg )
            {
                ai kill( player.origin, player );
            }
        }
    }

#/
