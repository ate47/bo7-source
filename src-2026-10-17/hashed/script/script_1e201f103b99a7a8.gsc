#using script_3774b0533d79d9a0;
#using script_6dfd03280678b65d;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_base_emergence_spawning;

// Namespace zombie_base_emergence_spawning
// Params 0
// Checksum 0x43320e06, Offset: 0xfa
// Size: 0x22
function function_5424383cc2c5d969()
{
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &should_disable_emergence_spawning );
}

// Namespace zombie_base_emergence_spawning
// Params 0
// Checksum 0x39c679ee, Offset: 0x124
// Size: 0x15
function init_zombie_base_emergence_spawning()
{
    zombie_emergence_spawning::register_emergence_spawning_through_death_func( &function_88fe73b39bedf2ee );
    thread function_2fdec2227163a8e6();
}

// Namespace zombie_base_emergence_spawning
// Params 0, eflags: 0x4
// Checksum 0x8cb83e2e, Offset: 0x141
// Size: 0x2b
function private function_2fdec2227163a8e6()
{
    self endon( #"death" );
    utility::ent_flag_wait( "post_host_spawn_enable_emergence_spawning_through_death_finished" );
    callback::add( "on_zombie_ai_damaged", &function_c9ae28ffcc107c8 );
}

// Namespace zombie_base_emergence_spawning
// Params 1, eflags: 0x4
// Checksum 0x18e2cc9, Offset: 0x174
// Size: 0x76
function private function_c9ae28ffcc107c8( dmg_struct )
{
    if ( dmg_struct.idamage >= self.health && gettime() != self._blackboard.var_d922503bad49d017 )
    {
        if ( gettime() - self._blackboard.var_d922503bad49d017 <= 500 )
        {
            self._blackboard.var_1499c965638cbfd7 = 0;
        }
    }
}

// Namespace zombie_base_emergence_spawning
// Params 2, eflags: 0x4
// Checksum 0x6df4b795, Offset: 0x1f2
// Size: 0x29
function private function_88fe73b39bedf2ee( corpse, spawning_ai_subclass )
{
    if ( spawning_ai_subclass == "zombie_vermin" )
    {
        corpse zombie_base_dismemberment::function_a6a09861ae148e04();
    }
}

// Namespace zombie_base_emergence_spawning
// Params 1, eflags: 0x4
// Checksum 0x5eaf2f68, Offset: 0x223
// Size: 0x52
function private should_disable_emergence_spawning( params )
{
    if ( zombie_base_dismemberment::should_annihilate( params.eattacker, params.shitloc, params.eattacker.currentprimaryweapon, params.idamage ) )
    {
        zombie_emergence_spawning::disable_emergence_spawning();
    }
}

