#using script_480d8775b87d1c2a;
#using script_610d4a9bb9b2d531;
#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_knockdown;

// Namespace zombie_knockdown
// Params 0, eflags: 0x5
// Checksum 0xb396cf48, Offset: 0xca
// Size: 0x3e
function private autoexec init()
{
    utility::registersharedfunc( #"zombie", #"knockdownzombie", &knockdown_ai );
    utility::registersharedfunc( #"zombie", #"iszombieinknockdown", &function_19d6107cb6bdff5c );
}

// Namespace zombie_knockdown
// Params 2
// Checksum 0x37c79566, Offset: 0x110
// Size: 0x4d
function topple_ai( source_pos, intensity )
{
    topple_method = getdvarint( @"hash_84f09d47faf2262a", 0 );
    
    if ( topple_method == 1 )
    {
        if ( zombie_liveragdoll::liveragdoll_ai( source_pos, intensity ) )
        {
            return;
        }
    }
    
    knockdown_ai( source_pos );
}

// Namespace zombie_knockdown
// Params 1
// Checksum 0x1ad31960, Offset: 0x165
// Size: 0x8a, Type: bool
function function_99b2020a564d9c7e( source_pos )
{
    if ( !isalive( self ) || !isscriptedai( self ) )
    {
        return false;
    }
    
    if ( self.disallow_knockdown )
    {
        return false;
    }
    
    if ( !isvector( source_pos ) )
    {
        return false;
    }
    
    if ( !function_605c20f278a1b5a8() )
    {
        return false;
    }
    
    archetype_override = self findoverridearchetype( "animscript" );
    
    if ( isdefined( archetype_override ) && archetype_override != self getbasearchetype() )
    {
        return false;
    }
    
    if ( zombie_traverse::is_traversing() )
    {
        return false;
    }
    
    if ( !function_2eb6752428726543() )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_knockdown
// Params 3
// Checksum 0x4508fdf6, Offset: 0x1f8
// Size: 0x12f
function knockdown_ai( source_pos, var_b2eb78867e8a1555, var_1e734ef465fcd586 )
{
    if ( !function_99b2020a564d9c7e( source_pos ) )
    {
        return 0;
    }
    
    knockback_impact_vector = undefined;
    
    if ( isdefined( var_b2eb78867e8a1555 ) )
    {
        assert( isint( var_b2eb78867e8a1555 ) || isfloat( var_b2eb78867e8a1555 ) );
        
        if ( !isint( var_b2eb78867e8a1555 ) && !isfloat( var_b2eb78867e8a1555 ) )
        {
            return 0;
        }
        
        if ( !isdefined( var_1e734ef465fcd586 ) )
        {
            var_1e734ef465fcd586 = 45;
        }
        
        assert( isint( var_1e734ef465fcd586 ) || isfloat( var_1e734ef465fcd586 ) );
        
        if ( !isint( var_1e734ef465fcd586 ) && !isfloat( var_1e734ef465fcd586 ) )
        {
            return 0;
        }
        
        if ( var_1e734ef465fcd586 < 0 )
        {
            var_1e734ef465fcd586 = 0;
        }
        else if ( var_1e734ef465fcd586 > 65 )
        {
            var_1e734ef465fcd586 = 65;
        }
        
        var_ff64faf4dc87b59a = vectornormalize2( self.origin - source_pos );
        var_d9c6c56556205ccb = vectorcross( var_ff64faf4dc87b59a, anglestoup( self.angles ) );
        
        if ( lengthsquared( var_d9c6c56556205ccb ) > 0.001 )
        {
            knockback_impact_vector = rotatepointaroundvector( var_d9c6c56556205ccb, var_ff64faf4dc87b59a, var_1e734ef465fcd586 );
            knockback_impact_vector = var_b2eb78867e8a1555 * knockback_impact_vector;
        }
    }
    
    return knockdown_ai_internal( source_pos, knockback_impact_vector );
}

// Namespace zombie_knockdown
// Params 2
// Checksum 0x12b28907, Offset: 0x330
// Size: 0x76
function knockdown_ai_aerial( source_pos, var_b2eb78867e8a1555 )
{
    if ( !function_99b2020a564d9c7e( source_pos ) )
    {
        return 0;
    }
    
    assert( isint( var_b2eb78867e8a1555 ) || isfloat( var_b2eb78867e8a1555 ) );
    
    if ( !isint( var_b2eb78867e8a1555 ) && !isfloat( var_b2eb78867e8a1555 ) )
    {
        return 0;
    }
    
    knockback_impact_vector = vectornormalize( self getcentroid() - source_pos ) * var_b2eb78867e8a1555;
    return knockdown_ai_internal( source_pos, knockback_impact_vector );
}

// Namespace zombie_knockdown
// Params 2, eflags: 0x4
// Checksum 0xe69c1708, Offset: 0x3af
// Size: 0xd2, Type: bool
function private knockdown_ai_internal( source_pos, knockback_impact_vector )
{
    self._blackboard.var_cab12c69b6d910e3 = source_pos;
    self.var_d51ba58c54d7dfeb = gettime();
    
    if ( function_ced41211f9bc141e( knockback_impact_vector ) && knockback_impact_vector != ( 0, 0, 0 ) )
    {
        self._blackboard.var_c3e02ea4bff38502 = knockback_impact_vector;
        thread function_101e831de889aa17();
    }
    else
    {
        self._blackboard.var_c3e02ea4bff38502 = ( 0, 0, 0 );
        self._blackboard.zombieinknockdown = 1;
        asm::function_7256f5ba459c840b( "knockdown_in" );
        self._blackboard.zombieinknockdown = 1;
    }
    
    return true;
}

// Namespace zombie_knockdown
// Params 1, eflags: 0x4
// Checksum 0xbcf5f627, Offset: 0x48a
// Size: 0x4f, Type: bool
function private function_ced41211f9bc141e( value )
{
    if ( !isvector( value ) )
    {
        return false;
    }
    
    return value[ 0 ] * 0 == 0 && value[ 1 ] * 0 == 0 && value[ 2 ] * 0 == 0;
}

// Namespace zombie_knockdown
// Params 0
// Checksum 0x41bafe50, Offset: 0x4e2
// Size: 0x6d, Type: bool
function function_605c20f278a1b5a8()
{
    if ( self.zombieaisettings.var_1fe24b1e0c3f9a11 )
    {
        current_time = gettime();
        
        if ( self.var_d51ba58c54d7dfeb )
        {
            var_6c47c0f8623e2b10 = ( current_time - self.var_d51ba58c54d7dfeb ) * 0.001;
            
            if ( var_6c47c0f8623e2b10 < self.zombieaisettings.var_1fe24b1e0c3f9a11 )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace zombie_knockdown
// Params 0
// Checksum 0x9b8dada8, Offset: 0x558
// Size: 0x16, Type: bool
function function_19d6107cb6bdff5c()
{
    return istrue( self._blackboard.zombieinknockdown );
}

// Namespace zombie_knockdown
// Params 0
// Checksum 0xe543a896, Offset: 0x577
// Size: 0x15
function function_2eb6752428726543()
{
    return self asmhasstate( self.asmname, "knockdown_in" );
}

// Namespace zombie_knockdown
// Params 0, eflags: 0x4
// Checksum 0xcf99dd18, Offset: 0x595
// Size: 0x43
function private function_101e831de889aa17()
{
    self endon( #"death" );
    self endon( #"knockdown_end" );
    self waittill( #"hash_a825e4ab363e721d" );
    
    if ( self._blackboard.var_6f70aaf18083f64 )
    {
        self kill();
    }
}

// Namespace zombie_knockdown
// Params 3
// Checksum 0xbf1325be, Offset: 0x5e0
// Size: 0x3b6
function function_a0c03faf3694150c( var_efe02cc999d047db, speedthresholds, knockdowndatas )
{
    self notify( #"hash_fdf42da5f61c2e04" );
    self endon( #"hash_fdf42da5f61c2e04" );
    self endon( #"death" );
    
    if ( !isdefined( speedthresholds ) )
    {
        speedthresholds = self.zombieaisettings.speedthreshold_list;
    }
    
    if ( !isdefined( knockdowndatas ) )
    {
        knockdowndatas = self.zombieaisettings.knockdowndata_list;
    }
    
    if ( speedthresholds.size == 0 || knockdowndatas.size == 0 )
    {
        return;
    }
    
    min_move_speed = undefined;
    
    for ( knockdown_idx = 0; knockdown_idx < knockdowndatas.size ; knockdown_idx++ )
    {
        for ( speed_idx = 0; speed_idx < speedthresholds.size ; speed_idx++ )
        {
            if ( speedthresholds[ speed_idx ].movetype == knockdowndatas[ knockdown_idx ].movetype )
            {
                min_speed = speedthresholds[ speed_idx ].speedthreshold * knockdowndatas[ knockdown_idx ].minspeedmodifier;
                
                if ( !isdefined( min_move_speed ) || min_speed < min_move_speed )
                {
                    min_move_speed = min_speed;
                }
                
                break;
            }
        }
    }
    
    if ( !isdefined( min_move_speed ) )
    {
        return;
    }
    
    minmovespeedsqr = squared( min_move_speed );
    
    while ( !isfunction( var_efe02cc999d047db ) || [[ var_efe02cc999d047db ]]() )
    {
        knockdowndata = undefined;
        
        foreach ( entry in knockdowndatas )
        {
            if ( entry.movetype == self._blackboard.movetype )
            {
                knockdowndata = entry;
                break;
            }
        }
        
        if ( isdefined( knockdowndata ) )
        {
            velocity = self.velocity;
            speedsqr = lengthsquared( velocity );
            
            if ( speedsqr > minmovespeedsqr )
            {
                curr_time = gettime();
                
                if ( !isdefined( min_speed_time ) )
                {
                    min_speed_time = curr_time;
                }
                
                if ( min_speed_time + knockdowndata.minspeeddelay * 1000 <= curr_time )
                {
                    knockdown_pos = self.origin;
                    
                    if ( knockdowndata.velocityoffset > 0 )
                    {
                        vel_norm = vectornormalize( velocity );
                        knockdown_pos += vel_norm * knockdowndata.velocityoffset;
                    }
                    
                    /#
                    #/
                    
                    potential_targets = getaiarrayinradius( knockdown_pos, knockdowndata.radius );
                    
                    foreach ( target in potential_targets )
                    {
                        if ( isalive( target ) && target != self && target.team == self.team && ( !isdefined( target.aicategory ) || target.aicategory == "normal" ) && !target function_19d6107cb6bdff5c() )
                        {
                            target knockdown_ai( knockdown_pos );
                            target thread val::set_for_time( 5, "abom_walk_through", "ignore_ai_collision", 1 );
                        }
                    }
                }
            }
            else
            {
                min_speed_time = undefined;
            }
        }
        
        wait knockdowndata.interval ?? 1;
    }
}

