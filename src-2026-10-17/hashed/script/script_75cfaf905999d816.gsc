#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\trace;
#using scripts\common\utility;

#namespace namespace_62d6417c8f47a982;

/#

    // Namespace namespace_62d6417c8f47a982
    // Params 0, eflags: 0x5
    // Checksum 0x390206e7, Offset: 0xd3
    // Size: 0xc, Type: dev
    function private autoexec main()
    {
        function_1daa47d9cb60a41c();
    }

#/

// Namespace namespace_62d6417c8f47a982
// Params 1
// Checksum 0x64e96585, Offset: 0xe7
// Size: 0x5d
function function_825925e0a97eedb7( ent )
{
    ent.state = 0;
    ent.ball_velocity = ( 0, 0, 0 );
    ent.var_5435357a9c9d646c = 0;
    ent thread function_310574590151544e();
    ent thread function_97d0353e47e0dcb2();
    
    /#
        ent thread draw_debug_ball();
    #/
}

// Namespace namespace_62d6417c8f47a982
// Params 5
// Checksum 0xb7250988, Offset: 0x14c
// Size: 0x7f
function function_9d6fcfde1a685656( ball, base_speed, base_acceleration, max_speed, var_b9c947075cde556a )
{
    ball.ball_base_speed = base_speed;
    ball.ball_base_acceleration = base_acceleration;
    ball.ball_max_speed = max_speed;
    ball.var_c14ef073704e2d9f = 1;
    ball.var_2b78c8680d226788 = var_b9c947075cde556a ?? 4000;
}

// Namespace namespace_62d6417c8f47a982
// Params 2
// Checksum 0x4f5c39c2, Offset: 0x1d3
// Size: 0x23
function function_f209b09df560f7db( ball, is_enabled )
{
    ball.var_7d277ed19fd09a51 = is_enabled;
}

// Namespace namespace_62d6417c8f47a982
// Params 2
// Checksum 0x74b3884, Offset: 0x1fe
// Size: 0x23
function function_192e744d83b3f2aa( ball, direct_velocity )
{
    ball.var_460de0f88706f477 = direct_velocity;
}

// Namespace namespace_62d6417c8f47a982
// Params 2
// Checksum 0x5eb10bae, Offset: 0x229
// Size: 0x2a
function function_cf9c0c9c03fe5550( ball, var_f369370f31e3a1e0 )
{
    set_homing_state( ball, var_f369370f31e3a1e0 ? 5 : 2 );
}

// Namespace namespace_62d6417c8f47a982
// Params 3
// Checksum 0xa7ad44cd, Offset: 0x25b
// Size: 0x90
function launch_ball( launch_velocity, launch_time_s, air_drag )
{
    set_homing_state( self, 2 );
    self.ball_velocity = launch_velocity;
    self.momentum_dir = vectornormalize( launch_velocity );
    self.ball_target_pos = self.origin + launch_velocity * launch_time_s;
    self.air_drag = air_drag;
    self.prev_position = self.origin;
    self.var_c14ef073704e2d9f = 1;
    self notify( #"new_homing_ball_velocity" );
}

// Namespace namespace_62d6417c8f47a982
// Params 2
// Checksum 0x3efa642b, Offset: 0x2f3
// Size: 0x52
function set_target_ent( ball, target_ent )
{
    ball.ball_target_ent = target_ent;
    
    /#
        ball ball_print( "<dev string:x24>" + target_ent getentitynumber(), self.origin + ( 0, 0, 50 ) );
    #/
}

// Namespace namespace_62d6417c8f47a982
// Params 1
// Checksum 0xd255c6f7, Offset: 0x34d
// Size: 0x16
function set_invisible( ball )
{
    set_homing_state( ball, 0 );
}

// Namespace namespace_62d6417c8f47a982
// Params 1
// Checksum 0x618a0c5e, Offset: 0x36b
// Size: 0x1a
function enable_vehicle_collision( ball )
{
    ball.vehicle_collision_enabled = 1;
}

// Namespace namespace_62d6417c8f47a982
// Params 2
// Checksum 0x2d19ba70, Offset: 0x38d
// Size: 0x55
function function_8660a257418ee3ea( max_speed_scale, duration )
{
    self notify( #"hash_58e4063d3e849e0c" );
    self endon( #"hash_58e4063d3e849e0c" );
    self endon( #"death" );
    self.var_c14ef073704e2d9f = max_speed_scale;
    wait duration;
    self.var_c14ef073704e2d9f = 1;
}

// Namespace namespace_62d6417c8f47a982
// Params 2, eflags: 0x4
// Checksum 0x8eed433c, Offset: 0x3ea
// Size: 0x94
function private set_homing_state( ball, state )
{
    if ( state != ball.state )
    {
        ball.state = state;
        
        if ( state == 3 )
        {
            assert( isdefined( self.ball_target_ent ) );
            self.var_24c85be35777abfc = distance2d( self.ball_target_ent.origin, self.origin );
        }
        
        /#
            ball ball_print( "<dev string:x32>" + get_state_name( state ) );
        #/
    }
}

// Namespace namespace_62d6417c8f47a982
// Params 0, eflags: 0x4
// Checksum 0xf4c2b468, Offset: 0x486
// Size: 0x1ea
function private function_310574590151544e()
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( self.state == 2 )
        {
            ball_speed = length( self.ball_velocity );
            
            if ( ball_speed <= 1 )
            {
                set_homing_state( self, 4 );
            }
        }
        
        var_63abd120838ffd79 = isalive( self.ball_target_ent ) && !self.ball_target_ent.ignoreme && !self.ball_target_ent.notarget && !self.ball_target_ent.aether_shroud_active;
        
        if ( self.state == 4 )
        {
            if ( !var_63abd120838ffd79 )
            {
                target_scan_radius = 3000;
                potential_targets = getplayersandaiarrayinradius( self.origin, target_scan_radius );
                
                foreach ( target in potential_targets )
                {
                    if ( isalive( target ) && target.team != self.team && !target.ignoreme && !target.notarget )
                    {
                        self.ball_target_ent = target;
                        var_63abd120838ffd79 = 1;
                        break;
                    }
                }
            }
            
            if ( var_63abd120838ffd79 )
            {
                set_homing_state( self, 3 );
            }
        }
        else if ( self.state == 3 || self.state == 5 )
        {
            if ( !var_63abd120838ffd79 )
            {
                set_homing_state( self, 4 );
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_62d6417c8f47a982
// Params 0, eflags: 0x4
// Checksum 0xd5ab0a2e, Offset: 0x678
// Size: 0x38e
function private function_97d0353e47e0dcb2()
{
    self endon( #"death" );
    move_time_interval = 0.2;
    self.prev_position = self.origin;
    self.momentum_dir = ( 0, 0, 0 );
    
    while ( true )
    {
        if ( self.state == 1 || self.state == 0 )
        {
            waitframe();
            continue;
        }
        
        self.turn_rate = getdvarfloat( @"hash_c9fae6a46956f427", 0.8 );
        target_pos = function_4b8b3f2d9657252b();
        
        if ( self.origin != self.prev_position )
        {
            self.momentum_dir = vectornormalize( self.origin - self.prev_position );
        }
        
        self.prev_position = self.origin;
        update_ball_velocity( move_time_interval, target_pos );
        movement_pos = self.ball_velocity + self.origin;
        self moveto( movement_pos, move_time_interval );
        waitresult = utility::waittill_any_timeout( move_time_interval, "movedone", "new_homing_ball_velocity" );
        
        if ( isdefined( target_pos ) && self.prev_position != self.origin && distancesquared( self.prev_position, self.origin ) > 1 )
        {
            closest_pos_to_target = pointonsegmentnearesttopoint( self.prev_position, self.origin, target_pos );
            
            if ( distancesquared( closest_pos_to_target, target_pos ) < squared( 64 ) )
            {
                function_524fad84a6eb0d1c();
            }
            
            /#
                if ( function_e5122cce0cd60bd2() )
                {
                    sphere( closest_pos_to_target, 20, ( 0, 0, 1 ) );
                    sphere( target_pos, 20, ( 0, 0.2, 0.8 ) );
                    ball_print( "<dev string:x3f>" + distance( closest_pos_to_target, target_pos ), target_pos );
                }
            #/
        }
        
        if ( self.prev_position != self.origin && distancesquared( self.prev_position, self.origin ) > 1 )
        {
            var_bb7060536ced9522 = getplayersandaiarrayinradius( averagepoint( [ self.prev_position, self.origin ] ), distance( self.prev_position, self.origin ) + 64 );
            
            foreach ( character in var_bb7060536ced9522 )
            {
                var_593881adb23c3360 = pointonsegmentnearesttopoint( self.prev_position, self.origin, character getcentroid() );
                var_2747aa75912408a8 = math::function_1243a6cc6a030f2a( var_593881adb23c3360, character getcentroid(), character getboundshalfsize(), character.angles );
                var_bd56238a03c739f0 = self.var_7d277ed19fd09a51 || self.team != character.team;
                
                if ( distancesquared( var_593881adb23c3360, var_2747aa75912408a8 ) < squared( 64 ) && var_bd56238a03c739f0 )
                {
                    params = spawnstruct();
                    params.hitcharacter = character;
                    callback::callback( "homing_ball_hit_character", params );
                }
            }
        }
    }
}

// Namespace namespace_62d6417c8f47a982
// Params 0, eflags: 0x4
// Checksum 0x1ff04e6a, Offset: 0xa0e
// Size: 0x8f
function private function_4b8b3f2d9657252b()
{
    if ( self.state == 3 || self.state == 5 )
    {
        if ( isdefined( self.ball_target_ent ) )
        {
            if ( isplayer( self.ball_target_ent ) )
            {
                self.ball_target_pos = self.ball_target_ent geteye();
            }
            else
            {
                self.ball_target_pos = self.ball_target_ent getcentroid();
            }
        }
    }
    
    if ( self.state == 4 )
    {
        self.ball_target_pos = undefined;
    }
    
    return self.ball_target_pos;
}

// Namespace namespace_62d6417c8f47a982
// Params 0, eflags: 0x4
// Checksum 0xc78fa90d, Offset: 0xaa6
// Size: 0x73
function private function_524fad84a6eb0d1c()
{
    self.var_5435357a9c9d646c = gettime();
    self.var_ad5f2394365bffce = self.state;
    
    if ( self.state == 2 && isdefined( self.ball_target_ent ) )
    {
        set_homing_state( self, 3 );
        return;
    }
    
    if ( self.state == 3 )
    {
        return;
    }
    
    if ( self.state == 4 )
    {
        return;
    }
    
    set_homing_state( self, 1 );
}

// Namespace namespace_62d6417c8f47a982
// Params 2, eflags: 0x4
// Checksum 0xabbab2c8, Offset: 0xb21
// Size: 0x48c
function private update_ball_velocity( move_time_interval, target_pos )
{
    current_angles = vectortoangles( self.momentum_dir );
    
    if ( isdefined( target_pos ) )
    {
        var_1e93f63e6c006f59 = distance2d( self.origin, target_pos );
        target_angles = calculate_target_angles( target_pos, var_1e93f63e6c006f59 );
        lerp_factor = calculate_lerp_factor( 0, var_1e93f63e6c006f59 );
        vertical_lerp_factor = calculate_lerp_factor( 1, var_1e93f63e6c006f59 );
        move_angles = ( math::angle_lerp( current_angles[ 0 ], target_angles[ 0 ], vertical_lerp_factor ), math::angle_lerp( current_angles[ 1 ], target_angles[ 1 ], lerp_factor ), 0 );
        forward_dir = anglestoforward( move_angles );
        
        if ( self.state == 2 )
        {
            ball_speed = length( self.ball_velocity );
            
            if ( isdefined( self.air_drag ) && ball_speed > 0 )
            {
                reduced_ball_speed = max( ball_speed - self.air_drag * move_time_interval, 0 );
                self.ball_velocity = reduced_ball_speed * forward_dir;
            }
        }
        
        if ( self.state == 3 )
        {
            velocity_magnitude = length( self.ball_velocity );
            
            if ( velocity_magnitude == 0 )
            {
                velocity_magnitude = 1;
            }
            
            ball_velocity = velocity_magnitude * forward_dir;
            ball_velocity += function_a515dc70af401de4( target_pos, move_time_interval, ball_velocity );
            current_speed = length( self.ball_velocity );
            new_ball_speed = current_speed;
            var_d483ef99d6d8a516 = gettime() - self.var_5435357a9c9d646c;
            var_4b17b8b1c18b5fce = self.var_2b78c8680d226788;
            
            if ( var_d483ef99d6d8a516 < var_4b17b8b1c18b5fce )
            {
                new_ball_speed = max( current_speed - self.ball_base_acceleration, self.ball_base_speed );
            }
            else
            {
                new_ball_speed = min( current_speed + self.ball_base_acceleration, self.ball_max_speed * self.var_c14ef073704e2d9f );
            }
            
            self.ball_velocity = vectornormalize( ball_velocity ) * new_ball_speed;
        }
        
        if ( self.state == 5 )
        {
            velocity = min( self.var_460de0f88706f477, self.ball_max_speed * self.var_c14ef073704e2d9f );
            
            if ( self.vehicle_collision_enabled )
            {
                tracecontents = trace::create_contents( 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0 );
            }
            else
            {
                tracecontents = trace::create_contents( 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 );
            }
            
            trace = trace::ray_trace( self.origin, target_pos, self, tracecontents );
            
            if ( trace[ "fraction" ] < 1 )
            {
                target_pos = trace[ "position" ];
                velocitymulti = trace[ "fraction" ];
            }
            
            dist_to_target = distance( self.origin, target_pos );
            var_dd2569e5d8cba19f = 20;
            
            if ( dist_to_target <= var_dd2569e5d8cba19f )
            {
                if ( !isdefined( velocitymulti ) )
                {
                    velocitymulti = dist_to_target / var_dd2569e5d8cba19f;
                }
                
                if ( velocitymulti < 0.2 )
                {
                    velocitymulti = 0;
                }
                
                velocity *= velocitymulti;
            }
            
            self.ball_velocity = velocity * anglestoforward( target_angles );
        }
    }
    
    if ( self.state == 4 )
    {
        move_angles = current_angles + ( current_angles[ 0 ] * -1, getdvarfloat( @"hash_c20b6c498e282903", 150 ) * move_time_interval, 0 );
        forward_dir = anglestoforward( move_angles );
        current_speed = length( self.ball_velocity );
        new_ball_speed = max( current_speed - self.ball_base_acceleration, self.ball_base_speed );
        self.ball_velocity = forward_dir * new_ball_speed;
    }
    
    if ( self.vehicle_collision_enabled )
    {
        tracecontents = trace::create_contents( 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0 );
    }
    else
    {
        tracecontents = trace::create_contents( 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 );
    }
    
    trace = trace::ray_trace( self.origin, self.origin + self.ball_velocity, self, tracecontents );
    
    if ( trace[ "fraction" ] < 1 )
    {
        self.ball_velocity = self.ball_velocity * -1 * getdvarfloat( @"hash_a02fb18b5abd33d5", 0.7 );
        
        /#
            if ( function_e5122cce0cd60bd2() )
            {
                line( self.origin, trace[ "<dev string:x52>" ], ( 1, 0, 0 ), 1 );
                ball_print( "<dev string:x5b>", trace[ "<dev string:x52>" ] );
            }
        #/
    }
}

// Namespace namespace_62d6417c8f47a982
// Params 2, eflags: 0x4
// Checksum 0x7ad8d48c, Offset: 0xfb5
// Size: 0xba
function private calculate_lerp_factor( is_vertical, var_1e93f63e6c006f59 )
{
    lerp_factor = self.turn_rate ?? 1;
    var_d483ef99d6d8a516 = gettime() - self.var_5435357a9c9d646c;
    acceleration_time = 5000;
    
    if ( var_d483ef99d6d8a516 < acceleration_time )
    {
        acceleration_perc = math::remap( var_d483ef99d6d8a516, 0, acceleration_time, 0, 1 );
        lerp_factor *= acceleration_perc;
    }
    else
    {
        dist_threshold = 500;
        dist_perc = clamp( math::remap( var_1e93f63e6c006f59, 0, dist_threshold, 0, 1 ), 0, 1 );
        lerp_factor += ( 1 - lerp_factor ) * ( 1 - dist_perc );
    }
    
    return lerp_factor;
}

// Namespace namespace_62d6417c8f47a982
// Params 2, eflags: 0x4
// Checksum 0x6c16cf67, Offset: 0x1078
// Size: 0x143
function private calculate_target_angles( final_target_pos, var_1e93f63e6c006f59 )
{
    target_pos = final_target_pos;
    
    if ( self.state == 3 )
    {
        vertical_lerp_factor = getdvarfloat( @"hash_db895954aaa6ff", 0.2 );
        target_pos = ( math::lerp( self.origin[ 0 ], target_pos[ 0 ], vertical_lerp_factor ), math::lerp( self.origin[ 1 ], target_pos[ 1 ], vertical_lerp_factor ), math::lerp( self.origin[ 2 ], target_pos[ 2 ], 1 ) );
        var_d483ef99d6d8a516 = gettime() - self.var_5435357a9c9d646c;
        upwards_time = 3000;
        
        if ( var_d483ef99d6d8a516 < upwards_time && self.var_ad5f2394365bffce == self.state )
        {
            upwards_angle = math::remap( var_d483ef99d6d8a516, 0, upwards_time, 0, 180 );
            var_4791d85f91a54b39 = sin( upwards_angle );
            upwards_offset = getdvarfloat( @"hash_1e6ae20696779f0d", 100 ) * var_4791d85f91a54b39;
            target_pos += ( 0, 0, upwards_offset );
        }
    }
    
    target_angles = vectortoangles( target_pos - self.origin );
    return target_angles;
}

// Namespace namespace_62d6417c8f47a982
// Params 4, eflags: 0x4
// Checksum 0x9404899b, Offset: 0x11c4
// Size: 0x130
function private function_a515dc70af401de4( final_target_pos, move_time_interval, ball_velocity, b_do_trace = 1 )
{
    push_vector = ( 0, 0, 0 );
    
    if ( b_do_trace )
    {
        trace = trace::ray_trace( self.origin, self.origin + ball_velocity, self );
        
        /#
            if ( function_e5122cce0cd60bd2() )
            {
                line( self.origin, self.origin + ball_velocity, ( 1, 1, 0 ), 0.5 );
            }
        #/
        
        if ( trace[ "fraction" ] < 1 )
        {
            ground_offset = getdvarfloat( @"hash_60864e18cad10506", 100 );
            position = trace[ "position" ] + ( 0, 0, ground_offset );
            push_vector = ( 0, 0, ball_velocity[ 2 ] * -1 );
            
            /#
                if ( function_e5122cce0cd60bd2() )
                {
                    line( self.origin, position, ( 1, 0, 0 ), 1 );
                    ball_print( "<dev string:x64>", position );
                }
            #/
        }
    }
    
    return push_vector;
}

/#

    // Namespace namespace_62d6417c8f47a982
    // Params 0
    // Checksum 0xad3d705b, Offset: 0x12fd
    // Size: 0x2e, Type: dev
    function function_1daa47d9cb60a41c()
    {
        devgui::function_9082edeb5db93280( "<dev string:x6e>" );
        devgui::add_devgui_func( "<dev string:x88>", "<dev string:xa1>", &function_1fcb4daea9318627 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_62d6417c8f47a982
    // Params 1, eflags: 0x4
    // Checksum 0x41709003, Offset: 0x1333
    // Size: 0x73, Type: dev
    function private get_state_name( state )
    {
        switch ( state )
        {
            case 0:
                return "<dev string:xba>";
            case 1:
                return "<dev string:xc4>";
            case 2:
                return "<dev string:xc9>";
            case 3:
                return "<dev string:xd5>";
        }
        
        return "<dev string:xef>";
    }

    // Namespace namespace_62d6417c8f47a982
    // Params 0, eflags: 0x4
    // Checksum 0x311a79cb, Offset: 0x13ae
    // Size: 0xc0, Type: dev
    function private draw_debug_ball()
    {
        self endon( #"death" );
        
        while ( true )
        {
            if ( !function_e5122cce0cd60bd2() )
            {
                waitframe();
                continue;
            }
            
            sphere( self.origin, 30, ( 1, 0, 0 ) );
            
            if ( isdefined( self.ball_target_pos ) )
            {
                utility::draw_arrow( self.origin, self.ball_target_pos, ( 1, 0, 0 ) );
            }
            
            print3d( self.origin + ( 0, 0, 90 ), "<dev string:xf0>" + get_state_name( self.state ), ( 1, 0, 0 ), 0.5, 0.5 );
            waitframe();
        }
    }

    // Namespace namespace_62d6417c8f47a982
    // Params 0, eflags: 0x4
    // Checksum 0x51b577b8, Offset: 0x1476
    // Size: 0x16, Type: dev
    function private function_e5122cce0cd60bd2()
    {
        return getdvarint( @"hash_b9852c62ef771212", 0 ) > 0;
    }

    // Namespace namespace_62d6417c8f47a982
    // Params 0, eflags: 0x4
    // Checksum 0xc4e7b3c, Offset: 0x1494
    // Size: 0x1a, Type: dev
    function private function_1fcb4daea9318627()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xa1>", @"hash_b9852c62ef771212" );
    }

    // Namespace namespace_62d6417c8f47a982
    // Params 2, eflags: 0x4
    // Checksum 0x82d36d5d, Offset: 0x14b6
    // Size: 0x5b, Type: dev
    function private ball_print( text, pos )
    {
        if ( function_e5122cce0cd60bd2() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:xfd>" + text, ( 1, 0, 0 ) );
        }
    }

#/
