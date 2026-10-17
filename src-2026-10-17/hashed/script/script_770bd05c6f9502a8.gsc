#using script_3063a3a5a2e024a0;
#using scripts\common\math;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;

#namespace zombie_viper_leap_attack;

// Namespace zombie_viper_leap_attack
// Params 0
// Checksum 0x753d7712, Offset: 0xfa
// Size: 0x9
function init_global()
{
    zombie_leap_attack::init_zombie_leap_attack_global();
}

// Namespace zombie_viper_leap_attack
// Params 0
// Checksum 0x5d75f403, Offset: 0x10b
// Size: 0x17
function init()
{
    zombie_leap_attack::init_zombie_leap_attack();
    thread function_85140bf7907cff79();
    thread function_df19c57a27d37868();
}

// Namespace zombie_viper_leap_attack
// Params 2
// Checksum 0xe5db31ce, Offset: 0x12a
// Size: 0x40a, Type: bool
function function_442ca7a890390ccb( taskid, params )
{
    assert( self.enemy );
    
    foreach ( player in level.players )
    {
        if ( player vehicle::is_in_vehicle() )
        {
            if ( distancesquared( player.origin, self.enemy.origin ) < 4000000 )
            {
                return false;
            }
        }
    }
    
    target_vel = self.enemy getentityvelocity();
    gravity = getgravity();
    target_vel_flat = ( target_vel[ 0 ], target_vel[ 1 ], 0 );
    var_9b2074841dc5ff3f = self.enemy.origin + target_vel_flat * 1.167;
    to_enemy = var_9b2074841dc5ff3f - self.origin;
    to_enemy_flat = ( to_enemy[ 0 ], to_enemy[ 1 ], 0 );
    dist_to_enemy = length( to_enemy );
    clamped_dist = clamp( dist_to_enemy, self._blackboard.var_7a0ed1d8a025653, self._blackboard.var_6dc50e9edbfedf79 );
    range = self._blackboard.var_6dc50e9edbfedf79 - self._blackboard.var_7a0ed1d8a025653;
    fraction = ( clamped_dist - self._blackboard.var_7a0ed1d8a025653 ) / range;
    leap_speed = math::lerp( self._blackboard.var_ed8e43492e9992f3, self._blackboard.var_93c0b68a5d2543c5, fraction );
    var_56824d0cdb420bc5 = function_7c5e5df2de8967bf( to_enemy_flat, target_vel_flat, leap_speed );
    var_b9c1820fa83d0c2e = var_9b2074841dc5ff3f + target_vel * var_56824d0cdb420bc5;
    nav_trace_result = navtrace( self.enemy.origin, var_b9c1820fa83d0c2e, self, 1 );
    var_b9c1820fa83d0c2e = nav_trace_result[ "position" ];
    angle = math::anglebetweenvectorsunit( vectornormalize2( self.origin - self.enemy.origin ), vectornormalize2( target_vel_flat ) );
    offset_dist = math::remap( angle, 0, 180, 100, 200 );
    var_273d5beb82f57260 = var_b9c1820fa83d0c2e - self.origin;
    var_51cc1f09d2a6f12c = length2d( var_273d5beb82f57260 );
    leap_dist = min( var_51cc1f09d2a6f12c - offset_dist, self._blackboard.var_6dc50e9edbfedf79 );
    var_78b9f9eaceced753 = var_51cc1f09d2a6f12c - leap_dist;
    leap_pos = var_b9c1820fa83d0c2e - vectornormalize2( var_273d5beb82f57260 ) * var_78b9f9eaceced753;
    var_7cc25b1fa79f682b = leap_pos - self.origin;
    
    if ( vectordot( var_7cc25b1fa79f682b, anglestoforward( self.angles ) ) <= 0 )
    {
        return false;
    }
    
    nav_trace_result = navtrace( var_b9c1820fa83d0c2e, leap_pos, self, 1 );
    leap_pos = nav_trace_result[ "position" ];
    
    if ( nav_trace_result[ "fraction" ] < 1 )
    {
        var_de25f678797ad8a3 = distance2dsquared( leap_pos, var_b9c1820fa83d0c2e );
        
        if ( var_de25f678797ad8a3 < offset_dist * offset_dist )
        {
            return false;
        }
    }
    
    vehicles = vehicle_getarrayinradius( leap_pos, 750, 500 );
    
    if ( vehicles.size > 0 )
    {
        return false;
    }
    
    leap_pos = self function_351cbae8705f818b( leap_pos, ( 0, 0, 0 ), 0 );
    
    if ( !isdefined( leap_pos ) || self function_115ace7999b27fd4( leap_pos ) )
    {
        return false;
    }
    
    self._blackboard.var_497e751941b50bed = leap_pos;
    return true;
}

// Namespace zombie_viper_leap_attack
// Params 3, eflags: 0x4
// Checksum 0x769a5463, Offset: 0x53d
// Size: 0x162
function private function_7c5e5df2de8967bf( var_53fbcf1a49783ec0, target_vel, intercept_speed )
{
    rr = vectordot( var_53fbcf1a49783ec0, var_53fbcf1a49783ec0 );
    rv = vectordot( var_53fbcf1a49783ec0, target_vel );
    vv = vectordot( target_vel, target_vel );
    a = vv - intercept_speed * intercept_speed;
    b = 2 * rv;
    c = rr;
    
    if ( abs( a ) < 0.001 )
    {
        if ( abs( b ) < 0.001 )
        {
            return 0;
        }
        
        t = c * -1 / b;
        
        if ( t > 0.001 )
        {
            return t;
        }
        
        return 0;
    }
    
    d = b * b - 4 * a * c;
    
    if ( d < 0 )
    {
        return 0;
    }
    
    var_cb3a6dba2ce4e037 = sqrt( d );
    t1 = ( b * -1 - var_cb3a6dba2ce4e037 ) / 2 * a;
    t2 = ( b * -1 + var_cb3a6dba2ce4e037 ) / 2 * a;
    
    if ( t1 > 0.001 && t2 > 0.001 )
    {
        return min( t1, t2 );
    }
    else if ( t1 > 0.001 )
    {
        return t1;
    }
    else if ( t2 > 0.001 )
    {
        return t2;
    }
    
    return 0;
}

// Namespace zombie_viper_leap_attack
// Params 0, eflags: 0x4
// Checksum 0xaef1fe11, Offset: 0x6a8
// Size: 0xc3
function private function_85140bf7907cff79()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"leap_attack_start" );
        
        if ( isplayer( self.enemy ) )
        {
            self.leaptarget = self.enemy;
        }
        
        self.var_542134bab16723fb = self.var_a13bed1ac47e1b2c;
        self.var_a13bed1ac47e1b2c = 1;
        val::set( "viper_leap_attack", "disallow_stun", 1 );
        val::set( "viper_leap_attack", "stunned", 0 );
        val::set( "viper_leap_attack", "pain", 0 );
        val::set( "viper_leap_attack", "special_pain", 0 );
        utility::function_32b24db3127bff40( "thruster", "on" );
        thread rocket_thruster_watcher();
    }
}

// Namespace zombie_viper_leap_attack
// Params 0, eflags: 0x4
// Checksum 0xb264f7d4, Offset: 0x773
// Size: 0x55
function private function_df19c57a27d37868()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"leap_attack_end" );
        self.leaptarget = undefined;
        self.var_a13bed1ac47e1b2c = self.var_542134bab16723fb;
        self.var_542134bab16723fb = undefined;
        val::reset_all( "viper_leap_attack" );
    }
}

// Namespace zombie_viper_leap_attack
// Params 0, eflags: 0x4
// Checksum 0x939297bf, Offset: 0x7d0
// Size: 0x9b
function private rocket_thruster_watcher()
{
    self endon( #"death" );
    curr_z = self.origin[ 2 ];
    timeout = gettime() + 3000;
    
    while ( self.origin[ 2 ] >= curr_z && gettime() <= timeout )
    {
        curr_z = self.origin[ 2 ];
        wait 0.1;
    }
    
    utility::function_32b24db3127bff40( "thruster", "off" );
    self waittill( #"leap_landed" );
    utility::function_32b24db3127bff40( "thruster", "landed" );
}

