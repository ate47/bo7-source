#using script_8f5fd77c34416a9;
#using scripts\asm\asm_bb;
#using scripts\common\math;
#using scripts\common\utility;

#namespace zombie_phobos_move;

// Namespace zombie_phobos_move
// Params 0
// Checksum 0x419190e9, Offset: 0x9d
// Size: 0x2
function function_d09624bb6e4f4dc1()
{
    
}

// Namespace zombie_phobos_move
// Params 0
// Checksum 0xd4200b7c, Offset: 0xa7
// Size: 0x28
function init_zombie_phobos_move()
{
    self.var_a91bd029284b1261 = getdvarint( @"hash_98f841d5f0c962f1", 1 );
    thread update_speed();
    thread function_188eec41e85b8309();
}

// Namespace zombie_phobos_move
// Params 0, eflags: 0x4
// Checksum 0x5bed43cf, Offset: 0xd7
// Size: 0x367
function private update_speed()
{
    self endon( #"death" );
    self.norm_speed = 0;
    
    while ( true )
    {
        var_316149904859a0e = getdvarfloat( @"phobos_speed", -1 );
        
        if ( var_316149904859a0e > 0 )
        {
            self aisetdesiredspeed( var_316149904859a0e );
            self aisettargetspeed( var_316149904859a0e );
            waitframe();
            continue;
        }
        
        if ( utility::ent_flag( "in_melee" ) )
        {
            waitframe();
            continue;
        }
        
        speed_range = undefined;
        
        if ( asm_bb::bb_movetyperequested( "run" ) )
        {
            speed_range = [ 260, getdvarfloat( @"hash_9b9a497a6eaf6ffc", 350 ) ];
        }
        else if ( asm_bb::bb_movetyperequested( "walk" ) )
        {
            speed_range = [ 150, getdvarfloat( @"hash_a7794709e6e60ad0", 210 ) ];
        }
        
        if ( !isdefined( speed_range ) )
        {
            waitframe();
            continue;
        }
        
        var_73907523da8accb4 = getdvarfloat( @"hash_1ed5a241a1f39c50", 1 );
        var_4d395e738e5475e0 = getdvarfloat( @"hash_545645cc06c862c2", 2 );
        
        if ( self._blackboard.var_606bf8ea1f70975d == 0 && zombie_phobos_enraged::is_enraged() )
        {
            var_73907523da8accb4 = getdvarfloat( @"hash_1e76e799df9f15ef", 4 );
        }
        
        var_f94281509c5def5 = getdvarfloat( @"hash_ba4e63ceb0d3249f", 250 );
        accel_rate = level.framedurationseconds / var_73907523da8accb4;
        var_7d1a27a574d80981 = level.framedurationseconds / var_4d395e738e5475e0;
        is_recently_damaged = isdefined( self.last_dmg_struct.timehit ) && gettime() - self.last_dmg_struct.timehit < var_f94281509c5def5;
        var_1e709a6c59e3ec5d = 0;
        health_percent = self.health / self.maxhealth;
        
        if ( health_percent > 0.5 && health_percent < 0.75 || health_percent < 0.25 )
        {
            var_1e709a6c59e3ec5d = 0.5;
        }
        
        var_12232b932fba82de = var_1e709a6c59e3ec5d;
        
        if ( is_recently_damaged )
        {
            var_12232b932fba82de = 1;
        }
        else if ( isdefined( self.enemy ) )
        {
            dist_to_enemy = distance( self.enemy.origin, self.origin );
            max_dist = 1000;
            
            if ( dist_to_enemy < max_dist )
            {
                var_12232b932fba82de = 1 - math::remap( dist_to_enemy, 300, max_dist, var_1e709a6c59e3ec5d, 1 );
            }
        }
        
        if ( var_12232b932fba82de > self.norm_speed )
        {
            self.norm_speed = min( self.norm_speed + accel_rate, var_12232b932fba82de );
        }
        else if ( var_12232b932fba82de < self.norm_speed )
        {
            self.norm_speed = max( self.norm_speed - var_7d1a27a574d80981, var_12232b932fba82de );
        }
        
        new_speed = math::remap( self.norm_speed, 0, 1, speed_range[ 0 ], speed_range[ 1 ] );
        self aisetdesiredspeed( new_speed );
        self aisettargetspeed( new_speed );
        
        /#
            if ( debug_move() )
            {
                print3d( self.origin + ( 0, 0, 200 ), "<dev string:x24>" + self.norm_speed + "<dev string:x37>" + new_speed, ( 0.5, 0.7, 0.5 ), 1, 1.2 );
            }
        #/
        
        waitframe();
    }
}

// Namespace zombie_phobos_move
// Params 0, eflags: 0x4
// Checksum 0x48143d13, Offset: 0x446
// Size: 0x2df
function private function_188eec41e85b8309()
{
    self endon( #"death" );
    var_7cb5896c0f3999f5 = 0.001;
    
    while ( true )
    {
        var_557b7103fe26067c = getdvarfloat( @"hash_b8a18afd3897c249", 0.025 ) * level.framedurationseconds;
        
        if ( !asm_bb::bb_movetyperequested( "walk" ) || utility::ent_flag( "in_melee" ) )
        {
            var_557b7103fe26067c *= 2;
        }
        
        var_557b7103fe26067c *= math::remap( self.norm_speed, 0, 1, 1, 1.5 );
        open_fraction = 1;
        navtrace_lookahead_dist = getdvarfloat( @"hash_abd60994bd80f185", 300 );
        navtrace_results = navtrace( self.origin, self.origin + anglestoforward( self.angles ) * navtrace_lookahead_dist, self, 1 );
        
        if ( isdefined( navtrace_results ) )
        {
            open_fraction = navtrace_results[ "fraction" ];
            
            /#
                sphere( navtrace_results[ "<dev string:x43>" ], 10, ( 1, 0, 0 ), 1 );
                print3d( navtrace_results[ "<dev string:x43>" ], "<dev string:x4c>" + navtrace_results[ "<dev string:x53>" ], ( 1, 0, 0 ) );
            #/
        }
        
        path = self getpath();
        
        if ( isdefined( path ) )
        {
            first_path_point = path[ 0 ];
            yaw_to_point = utility::getyawtospot( first_path_point );
            min_turn_rate = getdvarfloat( @"phobos_turn_rate", 1e-05 );
            
            if ( !asm_bb::bb_movetyperequested( "walk" ) || utility::ent_flag( "in_melee" ) )
            {
                min_turn_rate = getdvarfloat( @"hash_b267286e10997f35", 0.1 );
            }
            
            max_turn_rate = getdvarfloat( @"hash_e44d57c2f1a897f5", 0.28 );
            var_557b7103fe26067c *= math::remap( open_fraction, 0, 1, getdvarfloat( @"hash_6f751f27967e61c0", 5 ), 1 );
            var_e8b2156faf10e60 = getdvarfloat( @"hash_18e6600ae0355c84", 15 );
            var_3b8cac548067e0f7 = clamp( math::remap( abs( yaw_to_point ), var_e8b2156faf10e60, getdvarfloat( @"hash_953327139a6da46a", 90 ), min_turn_rate, max_turn_rate ), 0, max_turn_rate );
            var_7cb5896c0f3999f5 = var_3b8cac548067e0f7;
            
            if ( abs( yaw_to_point ) < var_e8b2156faf10e60 )
            {
                var_7cb5896c0f3999f5 = min_turn_rate;
            }
            
            self.turnrate = min( self.turnrate, var_7cb5896c0f3999f5 );
            
            if ( abs( self.turnrate - var_7cb5896c0f3999f5 ) > var_557b7103fe26067c )
            {
                self.turnrate += utility::sign( var_7cb5896c0f3999f5 - self.turnrate ) * var_557b7103fe26067c;
            }
            else
            {
                self.turnrate = var_7cb5896c0f3999f5;
            }
        }
        else
        {
            self.turnrate = getdvarfloat( @"phobos_turn_rate", 0.02 );
        }
        
        waitframe();
    }
}

/#

    // Namespace zombie_phobos_move
    // Params 0, eflags: 0x4
    // Checksum 0x31915ab1, Offset: 0x72d
    // Size: 0x16, Type: dev
    function private debug_move()
    {
        return getdvarint( @"hash_682b6127a16b673", 0 ) > 0;
    }

#/
