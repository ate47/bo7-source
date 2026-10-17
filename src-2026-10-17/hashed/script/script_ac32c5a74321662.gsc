#namespace namespace_7143065cf1b062e3;

// Namespace namespace_7143065cf1b062e3
// Params 3
// Checksum 0xaa21134, Offset: 0x87
// Size: 0x3dc
function float_move_loop( asmname, statename, params )
{
    self endon( #"death" );
    self endon( #"float_move_loop_end" );
    self.var_472f812340c3c96e = undefined;
    self.var_449e521c47cbd09f = gettime();
    
    while ( true )
    {
        waitframe();
        
        if ( !isdefined( self.var_c7f4f9790bc868e1 ) || self.var_c7f4f9790bc868e1.current_index >= self.var_c7f4f9790bc868e1.points.size - 1 )
        {
            function_49e69160997ef8d6();
            continue;
        }
        
        speed = self.var_c7f4f9790bc868e1.speed;
        current_index = self.var_c7f4f9790bc868e1.current_index;
        start_point = self.var_c7f4f9790bc868e1.points[ current_index ];
        next_point = self.var_c7f4f9790bc868e1.points[ current_index + 1 ];
        delta_z = next_point[ 2 ] - start_point[ 2 ];
        total_length = length( next_point - start_point );
        var_151be7f4c6cf0ab8 = length2d( next_point - start_point );
        to_next_point = next_point - self.origin;
        var_ff0ffec35a64ec92 = length( to_next_point );
        
        if ( var_151be7f4c6cf0ab8 > 0 && var_ff0ffec35a64ec92 > self.var_c7f4f9790bc868e1.speed )
        {
            percentage = 1 - var_ff0ffec35a64ec92 / total_length;
            
            if ( self.var_c7f4f9790bc868e1.ease_speed )
            {
                speed_percentage = 1;
                
                if ( percentage < 0.5 )
                {
                    speed_percentage = 0.7 + easesine( percentage / 0.5, 1, 0 ) * 0.3;
                }
                else
                {
                    speed_percentage = max( 1 - easesine( ( percentage - 0.5 ) / 0.5, 1, 0 ), 0.2 );
                }
                
                speed *= speed_percentage;
            }
            
            var_63bdabe9640c1301 = length2d( to_next_point );
            percentage_2d = 1 - var_63bdabe9640c1301 / var_151be7f4c6cf0ab8;
            var_13288e71444f2183 = ( to_next_point[ 0 ], to_next_point[ 1 ], 0 );
            new_origin = self.origin + vectornormalize( var_13288e71444f2183 ) * speed;
            
            if ( delta_z < var_151be7f4c6cf0ab8 )
            {
                z_percentage = easesine( percentage_2d, 1, 1 );
            }
            else
            {
                z_percentage = easepower( percentage_2d, 2, 0, 1 );
            }
            
            new_origin = ( new_origin[ 0 ], new_origin[ 1 ], start_point[ 2 ] + delta_z * z_percentage );
        }
        else
        {
            new_origin = next_point;
            self.var_c7f4f9790bc868e1.current_index = current_index + 1;
        }
        
        if ( isdefined( self.var_472f812340c3c96e ) )
        {
            real_move_dir = vectornormalize2( self.origin - self.var_472f812340c3c96e );
            real_move_dist = distance2dsquared( self.origin, self.var_472f812340c3c96e );
            need_move_dir = vectornormalize2( new_origin - self.origin );
            original_move_dir = vectornormalize2( next_point - start_point );
            dot_product_epsilon = 0.1;
            
            if ( vectordot( original_move_dir, need_move_dir ) <= dot_product_epsilon || real_move_dist > 0 && ( vectordot( need_move_dir, real_move_dir ) <= dot_product_epsilon || real_move_dist < 256 * squared( level.framedurationseconds ) ) )
            {
                self.var_c7f4f9790bc868e1.current_index = self.var_c7f4f9790bc868e1.points.size;
            }
        }
        
        self forceteleport( new_origin );
        self.var_449e521c47cbd09f = gettime();
        self.var_472f812340c3c96e = new_origin;
    }
}

// Namespace namespace_7143065cf1b062e3
// Params 3
// Checksum 0xa4b36e94, Offset: 0x46b
// Size: 0xc1
function function_dce35a336383305c( goal, speed, ease_speed )
{
    if ( !isdefined( self.var_c7f4f9790bc868e1 ) )
    {
        self.var_c7f4f9790bc868e1 = spawnstruct();
    }
    
    self.var_c7f4f9790bc868e1.points = [ self.origin, goal ];
    self.var_c7f4f9790bc868e1.current_index = 0;
    self.var_c7f4f9790bc868e1.speed = speed ?? 6;
    self.var_c7f4f9790bc868e1.ease_speed = ease_speed ?? 1;
    self function_786bb6aa1b76c7ee( "in_float_move", 1 );
    self.var_472f812340c3c96e = undefined;
}

// Namespace namespace_7143065cf1b062e3
// Params 0
// Checksum 0x145821e7, Offset: 0x534
// Size: 0x37
function function_49e69160997ef8d6()
{
    self.var_c7f4f9790bc868e1 = undefined;
    self.var_449e521c47cbd09f = undefined;
    self.var_472f812340c3c96e = undefined;
    self clearaiblackboarddynamic( "in_float_move" );
    self notify( #"hash_67e2178e6f12cd61" );
}

// Namespace namespace_7143065cf1b062e3
// Params 3
// Checksum 0x8b894f27, Offset: 0x573
// Size: 0xc3
function function_66c462b9c6c443c0( goal, speed, ease_speed )
{
    assert( isdefined( self.var_c7f4f9790bc868e1 ), "<dev string:x24>" );
    self.var_c7f4f9790bc868e1.points = [ self.origin, goal ];
    self.var_c7f4f9790bc868e1.current_index = 0;
    self.var_c7f4f9790bc868e1.speed = speed ?? self.var_c7f4f9790bc868e1.speed;
    self.var_c7f4f9790bc868e1.ease_speed = ease_speed ?? 1;
    self.var_472f812340c3c96e = undefined;
}

