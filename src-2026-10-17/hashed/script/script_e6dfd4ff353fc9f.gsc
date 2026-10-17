#using scripts\common\callbacks;
#using scripts\common\values;

#namespace zm_zombie_wither;

// Namespace zm_zombie_wither
// Params 2
// Checksum 0x83a19761, Offset: 0x1f3
// Size: 0x88
function precache( classname, aitypescriptbundle )
{
    if ( isdefined( level.var_43aaaba03dc1a506 ) )
    {
        return;
    }
    
    level.var_43aaaba03dc1a506 = 1;
    level callback::add( "on_zombie_wither_spawned", &on_zombie_wither_spawned );
    level callback::add( "on_zombie_wither_boss_fight_spawned", &on_zombie_wither_spawned );
    level callback::add( "on_zombie_wither_downed_spawned", &on_zombie_wither_spawned );
    level callback::add( "on_zombie_wither_bomb_spawned", &on_zombie_wither_spawned );
    level callback::add( "on_zombie_wither_shadow_spawned", &on_zombie_wither_spawned );
}

// Namespace zm_zombie_wither
// Params 1
// Checksum 0xad357b14, Offset: 0x283
// Size: 0x1aa
function on_zombie_wither_spawned( params )
{
    val::set( "zombie_wither", "trigger_hurt_damage", 0 );
    val::set( "zombie_wither", "ignore_cleanup", 1 );
    val::set( "zombie_wither", "allow_dismember", 0 );
    self.b_cleanup_no_respawn = 1;
    self.var_825b17c932865df = 1;
    self.var_15598d8e493afe88 = 1;
    self.ignore_enemy_count = 1;
    self.var_317816f65dd8fd6c = 2;
    self.var_dfe404a5b854dd0c = 1;
    self.var_1bc1a37495c8ca04 = 1;
    self.b_ignore_monkey_bomb = 1;
    self.b_ignore_frenzied_guard = 1;
    self.no_powerups = 1;
    self.var_a13bed1ac47e1b2c = 1;
    self.ignore_nuke = 1;
    self.var_7ee152b43c7188e1 = 1;
    self.always_knockback = 1;
    self.var_33d9fb83f023e633 = 1;
    
    switch ( self.subclass )
    {
        case #"hash_a38a8f1e60b2e94":
        case #"hash_9aba444aeda95fcd":
            self.var_6cd3687f6622091c = "j_head";
            break;
        case #"hash_bd1aa87d8ed98be0":
            self.var_6cd3687f6622091c = "tag_origin";
            break;
        case #"hash_9de4699c88b66354":
            self.var_6cd3687f6622091c = "j_spine4";
            self.energy_mine_spire_offset = -10;
            break;
    }
    
    if ( self.subclass == "zombie_wither_boss_fight" || self.subclass == "zombie_wither_downed" || self.subclass == "zombie_wither_bomb" )
    {
        self.var_a8fa61d92872fc74 = 1;
    }
}

