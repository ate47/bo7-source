#using script_15ce43f40ea0fd2b;
#using script_6c2f6a14fa53759e;

#namespace zombie_attractor;

// Namespace zombie_attractor
// Params 2
// Checksum 0x7aa254d9, Offset: 0x8e
// Size: 0xb2
function function_3bc77d754dfe41fa( taskid, params )
{
    range = zombie_utils::function_b292d64a276f14cc( params );
    
    if ( !isdefined( self.target_attractor ) || !self.target_attractor.is_attackable )
    {
        return anim.failure;
    }
    
    goal_info = zombie_attractor_manager::function_f84fb37f6c524103();
    
    if ( distancesquared( goal_info.goal, goal_info.reachable_goal ) > squared( range ) )
    {
        return anim.failure;
    }
    
    zombie_utils::update_bt_goal( goal_info.reachable_goal );
    return anim.success;
}

// Namespace zombie_attractor
// Params 2
// Checksum 0xe7a2fea9, Offset: 0x149
// Size: 0x58
function setmovespeed( taskid, params )
{
    move_speed = params;
    
    if ( move_speed == "" )
    {
        return anim.failure;
    }
    
    thread zombie_utils::function_a8ce00e0448cb6f0( move_speed, "zombie_attractor", 34 );
    thread function_e1d60810b7a524af();
    return anim.success;
}

// Namespace zombie_attractor
// Params 0, eflags: 0xc
// Checksum 0x3a67e467, Offset: 0x1aa
// Size: 0x5d
function private function_e1d60810b7a524af()
{
    self notify( #"hash_cc1b3b16d2062cb5" );
    self endon( #"hash_cc1b3b16d2062cb5" );
    level endon( #"game_ended" );
    self endon( #"death" );
    
    while ( true )
    {
        if ( !self.target_attractor )
        {
            zombie_utils::function_a8ce00e0448cb6f0( undefined, "zombie_attractor", 34 );
            return;
        }
        
        wait 0.1;
    }
}

