#using script_142c4b49b738e3d8;
#using script_7e916efe0ee8c563;
#using scripts\asm\shared\variant_asm;
#using scripts\common\ai\aitypes\zombie_amalgam\zombie_amalgam;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace namespace_a60ccad3ba8b2b4f;

// Namespace namespace_a60ccad3ba8b2b4f
// Params 0
// Checksum 0x3baff8aa, Offset: 0x13a
// Size: 0x69
function function_8bf5e3edf86ea58d()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_melee_started", &on_is_melee_started );
    callback::get_template( self.animsetname ) callback::add( "zombie_melee_pre", &function_b5996c5d0bcfacdb );
    callback::get_template( self.animsetname ) callback::add( "zombie_melee", &function_9b83ff472c0cbb39 );
    function_7b997cdc469d44cb();
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 0
// Checksum 0x21eb2bfb, Offset: 0x1ab
// Size: 0x1e
function init_zombie_amalgam_melee()
{
    thread target_watcher();
    
    if ( self.knockback_strength > 0 )
    {
        thread function_3714eae8891ac99d();
    }
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 0, eflags: 0x4
// Checksum 0x2920db81, Offset: 0x1d1
// Size: 0x30
function private target_watcher()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"enemy" );
        waitframe();
        variant_asm::function_1e9b4a2fe400d128( "melee" );
    }
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 0, eflags: 0x4
// Checksum 0x27a468ef, Offset: 0x209
// Size: 0x7d
function private function_3714eae8891ac99d()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"melee_knockback" );
        hit_ent = self melee( anglestoforward( self.angles ), 1, zombie_melee::function_b18453c9674478c1(), 16, 16 );
        
        if ( isplayer( hit_ent ) )
        {
            hit_ent utility::knockback_flat( hit_ent.origin - self.origin, self.knockback_strength );
        }
    }
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 0, eflags: 0x4
// Checksum 0x7e4350ec, Offset: 0x28e
// Size: 0x91
function private function_7b997cdc469d44cb()
{
    variant_asm::register_anim_variant( "melee", &function_a51510d63b8a632, &function_3301a5711e996c8 );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 1, 0, undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, 0, undefined ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, 1, "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, 1, "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "melee", function_774051f9d32fd993( 0, 1, "sprint" ) );
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 3, eflags: 0x4
// Checksum 0x9f7e5c3f, Offset: 0x327
// Size: 0x5a
function private function_774051f9d32fd993( should_eat, is_moving_melee, move_type )
{
    struct = spawnstruct();
    struct.should_eat = should_eat;
    struct.is_moving_melee = is_moving_melee;
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0xbe9bf62d, Offset: 0x38a
// Size: 0x19b
function private function_a51510d63b8a632( struct )
{
    alias = "";
    
    if ( struct.should_eat )
    {
        if ( self.team == "team_hundred_eighty_nine" && isalive( self.enemy ) && !isplayer( self.enemy ) && self.enemy.unittype == "zombie" && self.enemy.aicategory == "normal" || self.enemy.unittype == "soldier" )
        {
            return "eat";
        }
        
        return;
    }
    
    if ( isdefined( struct.is_moving_melee ) )
    {
        if ( istrue( self.is_moving_melee ) != struct.is_moving_melee )
        {
            return;
        }
        
        if ( self.is_moving_melee )
        {
            alias = "move";
        }
        else
        {
            alias = "static";
            
            if ( isplayer( self.enemy ) )
            {
                dist_sqr = distancesquared( self.origin, self.enemy.origin );
                
                if ( dist_sqr < 2025 )
                {
                    alias += "_short";
                }
            }
        }
    }
    
    if ( isdefined( struct.move_type ) )
    {
        if ( self._blackboard.movetype != struct.move_type )
        {
            return;
        }
        
        alias += "_" + struct.move_type;
    }
    
    return alias;
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0x31c45086, Offset: 0x52e
// Size: 0x19
function private function_3301a5711e996c8( alias )
{
    self function_695b8e1b655c2796( "melee", alias );
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0x4f709c1e, Offset: 0x54f
// Size: 0x18
function private on_is_melee_started( params )
{
    variant_asm::function_1e9b4a2fe400d128( "melee" );
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0x4b1e745f, Offset: 0x56f
// Size: 0x133
function private function_b5996c5d0bcfacdb( params )
{
    if ( self.team == "team_hundred_eighty_nine" && isent( params.meleetarget ) && !isplayer( params.meleetarget ) && self function_9e71e576c68bf0a( "melee" ) == "eat" && !isdefined( self.var_8da6b6c99fa544f5 ) )
    {
        var_7bf206d13e099edd = params.meleetarget.unittype == "zombie" && params.meleetarget.aicategory == "normal";
        
        if ( var_7bf206d13e099edd || params.meleetarget.unittype == "soldier" )
        {
            if ( var_7bf206d13e099edd )
            {
                params.meleetarget.var_dd62e2042418b7e5 = 1;
            }
            
            params.meleetarget.forceannihilate = 1;
            params.meleetarget.killondamage = 1;
            self.absorb_target = params.meleetarget;
        }
    }
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0x7b382472, Offset: 0x6aa
// Size: 0xbb
function private function_9b83ff472c0cbb39( params )
{
    if ( isdefined( params.meleehitent ) )
    {
        if ( self.absorb_target === params.meleehitent )
        {
            if ( !isalive( params.meleehitent ) )
            {
                zombie_amalgam_regen::start_health_regen( params.meleehitent.unittype == "zombie" );
            }
        }
        else if ( self.extra_arm_count > 1 )
        {
            thread function_f5769425318426d( params.meleehitent );
        }
        
        if ( self.team == "team_hundred_eighty_nine" )
        {
            zombie_amalgam::reset_opportunistic_attack();
            variant_asm::function_1e9b4a2fe400d128( "melee" );
        }
    }
    
    self.absorb_target = undefined;
}

// Namespace namespace_a60ccad3ba8b2b4f
// Params 1, eflags: 0x4
// Checksum 0x40d7f626, Offset: 0x76d
// Size: 0x103
function private function_f5769425318426d( melee_hit_ent )
{
    self endon( #"death" );
    wait self.zombieaisettings.var_d3de1a9faac42deb.var_505edc8671ce8e64;
    
    if ( isalive( melee_hit_ent ) && self.extra_arm_count >= 1 )
    {
        hit_ent = self melee( undefined, self.zombieaisettings.var_d3de1a9faac42deb.var_1f32a58e8569b771, self.melee_range, 16, 16 );
        
        if ( self.extra_arm_count > 5 )
        {
            wait self.zombieaisettings.var_d3de1a9faac42deb.var_505edc8671ce8e64;
            
            if ( isalive( melee_hit_ent ) && self.extra_arm_count >= 4 )
            {
                hit_ent = self melee( undefined, self.zombieaisettings.var_d3de1a9faac42deb.var_1f32a58e8569b771, self.melee_range, 16, 16 );
            }
        }
    }
}

