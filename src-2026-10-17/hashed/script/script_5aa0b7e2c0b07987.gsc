#using scripts\common\callbacks;
#using scripts\common\values;

#namespace zm_zombie_weyward;

// Namespace zm_zombie_weyward
// Params 2
// Checksum 0xc6b9d58b, Offset: 0x139
// Size: 0x40
function precache( classname, aitypescriptbundle )
{
    if ( isdefined( level.var_b721ae262117cb06 ) )
    {
        return;
    }
    
    level.var_b721ae262117cb06 = 1;
    level callback::add( "on_zombie_weyward_spawned", &on_zombie_weyward_spawned );
}

// Namespace zm_zombie_weyward
// Params 1
// Checksum 0xcd1b8e36, Offset: 0x181
// Size: 0x144
function on_zombie_weyward_spawned( params )
{
    callback::add( "new_weyward_phase", &function_a91d3e8a43ae8814 );
    val::set( "zombie_weyward", "trigger_hurt_damage", 0 );
    val::set( "zombie_weyward", "ignore_cleanup", 1 );
    val::set( "zombie_weyward", "allow_dismember", 0 );
    self.b_cleanup_no_respawn = 1;
    self.var_825b17c932865df = 1;
    self.var_15598d8e493afe88 = 1;
    self.ignore_enemy_count = 1;
    self.var_317816f65dd8fd6c = 2;
    self.var_dfe404a5b854dd0c = 1;
    self.var_1bc1a37495c8ca04 = 1;
    self.var_bfa7ca2a8740bf7b = 1;
    self.b_ignore_monkey_bomb = 1;
    self.b_ignore_frenzied_guard = 1;
    self.b_disable_annihilate = 1;
    self.no_powerups = 1;
    self.var_a8fa61d92872fc74 = 1;
    self.var_a13bed1ac47e1b2c = 1;
    self.ignore_nuke = 1;
    self.var_7ee152b43c7188e1 = 1;
    self.always_knockback = 1;
    self.var_33d9fb83f023e633 = 1;
    self.energy_mine_spire_offset = 100;
    self.var_6cd3687f6622091c = "j_spineupper";
    callback::add( "on_summoned_by_weyward", &on_summoned_by_weyward );
}

// Namespace zm_zombie_weyward
// Params 1, eflags: 0x4
// Checksum 0xf20a0ef1, Offset: 0x2cd
// Size: 0x47
function private function_a91d3e8a43ae8814( params )
{
    health_cap = int( self.var_aebba24aed9f1efd[ self.shadow_soul_phase - 1 ] * self.maxhealth );
    self.var_d200801f77f0de0 = health_cap;
}

// Namespace zm_zombie_weyward
// Params 1, eflags: 0x4
// Checksum 0xbab6d245, Offset: 0x31c
// Size: 0x42
function private on_summoned_by_weyward( params )
{
    ent = params.ent;
    assert( ent );
    ent val::set( "zombie_weyward_summon", "ignore_cleanup", 1 );
}

