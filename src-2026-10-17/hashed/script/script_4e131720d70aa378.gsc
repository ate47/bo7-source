#using script_16ea1b94f0f381b3;
#using script_6c2f6a14fa53759e;
#using scripts\common\ai\aitypes\zombie_abom\zombie_abom_metabones;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\trace;
#using scripts\common\utility;

#namespace namespace_ce58d65bf2615c99;

// Namespace namespace_ce58d65bf2615c99
// Params 1
// Checksum 0x5cd29b4d, Offset: 0x32b
// Size: 0x3d
function function_c3efc774d7b1d266( aitypescriptbundle )
{
    settings = zombie_utils::function_a225e7aa4a243fb2( aitypescriptbundle );
    
    if ( isdefined( settings ) )
    {
        utility::add_fx( "abom_beam_fx", settings.beamfx );
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 0
// Checksum 0x9592439b, Offset: 0x370
// Size: 0x18f
function init_zombie_abom_beam_attack()
{
    callback::add( #"on_ai_killed", &cleanup_beam_ents );
    thread function_9da93a97dd825327();
    thread function_84a4867977a3607b();
    self.var_7cd2a9178d92be44 = [];
    
    for ( head_index = 0; head_index <= 2 ; head_index++ )
    {
        self.var_7cd2a9178d92be44[ head_index ] = spawn( "script_model", ( 0, 0, 0 ) );
        self.var_7cd2a9178d92be44[ head_index ] setmodel( self.zombieaisettings.var_d3de1a9faac42deb.var_5a6e0a21bfa8935d );
        self.var_7cd2a9178d92be44[ head_index ] utility::function_7c10ea82c1e305b8( "beam_tip", "off" );
        thread utility::delete_on_death( self.var_7cd2a9178d92be44[ head_index ] );
    }
    
    self.abom_beams = [];
    self.var_80a2b3edd3d43109 = [];
    self.var_80a2b3edd3d43109[ 0 ] = "tag_fx_head_le_throat";
    self.var_80a2b3edd3d43109[ 1 ] = "tag_fx_head_center_throat";
    self.var_80a2b3edd3d43109[ 2 ] = "tag_fx_head_ri_throat";
    self.var_ad197ca11c039e90 = [];
    self.aimyawspeed = 10;
    self.var_e834bac54dd3efaa = 10;
    self.var_4bce31da81afb507 = 20;
    var_a532b7321c6f7d24 = self.zombieaisettings.var_d3de1a9faac42deb.var_44c46d9db2a65ba8 * 1000;
    self function_786bb6aa1b76c7ee( "beam_attack_cooldown", var_a532b7321c6f7d24 );
    self function_786bb6aa1b76c7ee( "beam_unreachable_cooldown", 5000 );
    
    /#
        function_d0a88666aaee23d4();
    #/
}

// Namespace namespace_ce58d65bf2615c99
// Params 4, eflags: 0x4
// Checksum 0x68b5c2a2, Offset: 0x507
// Size: 0x106
function private function_b893a9e913cea804( entity, hit_ent, num_beams, can_dissolve )
{
    beam_damage = 9 + num_beams * 2;
    
    if ( isai( hit_ent ) && isdefined( hit_ent.maxhealth ) )
    {
        beam_damage = max( hit_ent.maxhealth * 0.1, beam_damage * 2 );
        
        if ( can_dissolve )
        {
            if ( !self.zombieaisettings.var_d3de1a9faac42deb.var_ffb9d09ce59952d3 )
            {
                beam_damage *= 3;
            }
        }
        
        if ( hit_ent.aicategory == "boss" )
        {
            return 0;
        }
        
        if ( self.var_e2fce82443c7cf79 && hit_ent.aicategory == "hvt" )
        {
            return 0;
        }
    }
    else if ( isplayer( hit_ent ) )
    {
        beam_damage = int( beam_damage * getdvarfloat( @"hash_801a4981ce836d30", 1 ) * self.ranged_damage_multiplier );
    }
    
    return beam_damage;
}

// Namespace namespace_ce58d65bf2615c99
// Params 4
// Checksum 0xc41732d5, Offset: 0x616
// Size: 0x215, Type: bool
function function_6a45376d254099c2( asmname, statename, tostatename, params )
{
    if ( !isalive( self.enemy ) )
    {
        return true;
    }
    
    if ( !math::is_point_in_front( self.enemy.origin ) )
    {
        function_4f22c055483197a2();
        
        /#
            beam_print( "<dev string:x24>" );
        #/
        
        return true;
    }
    
    if ( distance2dsquared( self.enemy.origin, self.origin ) < squared( self.melee_range ) )
    {
        /#
            beam_print( "<dev string:x40>" );
        #/
        
        self.beam_attack_failed = 1;
        return true;
    }
    
    var_d1bc21baf5f18f5d = gettime() - ( self.var_bd9ea91ada6cf30e ?? 0 );
    abom_beam_time = getdvarint( @"abom_beam_time", 6000 );
    
    if ( abom_beam_time > 0 && var_d1bc21baf5f18f5d > abom_beam_time )
    {
        /#
            beam_print( "<dev string:x65>" );
        #/
        
        return true;
    }
    
    var_6d6c4722e727c7d2 = gettime() - ( self.var_a9983e721f3b21c2 ?? 0 );
    var_21f91b943e9027a5 = getdvarint( @"hash_5a02ebc4afef300d", 3000 );
    
    if ( var_21f91b943e9027a5 > 0 && var_6d6c4722e727c7d2 > var_21f91b943e9027a5 )
    {
        /#
            beam_print( "<dev string:x82>" );
        #/
        
        if ( !isdefined( self.var_a9983e721f3b21c2 ) || self.var_a9983e721f3b21c2 < self.var_bd9ea91ada6cf30e )
        {
            self.beam_attack_failed = 1;
        }
        
        return true;
    }
    
    aim_at_pos = self function_7d4e091be39f0a40();
    
    /#
        if ( debug_beam_attack() && isdefined( aim_at_pos ) )
        {
            beam_print( "<dev string:xa3>", aim_at_pos );
            line( self.origin, self function_7d4e091be39f0a40(), ( 1, 1, 0 ) );
        }
    #/
    
    if ( isdefined( aim_at_pos ) && !math::is_point_in_front( aim_at_pos ) )
    {
        /#
            beam_print( "<dev string:xab>" );
        #/
        
        return true;
    }
    
    return false;
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0x66e46177, Offset: 0x834
// Size: 0x52
function private function_9da93a97dd825327()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"beam_attack_intro_start" );
        utility::function_32b24db3127bff40( "beam_tell", "beam_tell_on" );
        self waittill( #"beam_attack_intro_end" );
        utility::function_32b24db3127bff40( "beam_tell", "beam_tell_off" );
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0x6b95e435, Offset: 0x88e
// Size: 0x7f
function private function_84a4867977a3607b()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"beam_attack_loop_start" );
        
        if ( self getaiblackboarddynamic( "in_beam_attack" ) )
        {
            self.var_bd9ea91ada6cf30e = gettime();
            self function_786bb6aa1b76c7ee( "beam_unreachable_cooldown", 5000 );
            self.beam_attack_failed = undefined;
            
            if ( isdefined( self.enemy ) )
            {
                self getenemyinfo( self.enemy );
            }
            
            thread beam_attack_loop();
            thread beam_attack_on_end();
        }
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0xfaf02922, Offset: 0x915
// Size: 0xc47
function private beam_attack_loop()
{
    self endon( #"death" );
    self endon( #"beam_attack_loop_finished" );
    beams_created = 0;
    attack_target_ent = self.enemy;
    beam_audio_active = 0;
    var_a1abee9062687674 = [ ( 0, 0, 0 ), ( 0, 0, 0 ), ( 0, 0, 0 ) ];
    var_7a8c168bf4869367 = [ ( 0, 0, 0 ), ( 0, 0, 0 ), ( 0, 0, 0 ) ];
    round_number = zombie_utils::get_zombie_round_difficulty();
    var_255fcf4526cbba4e = 10 + clamp( math::remap( round_number, 20, 30, 0, 25 ), 0, 25 );
    var_84ddbccc7b4142cf = 90;
    kill_queue = [];
    
    while ( true )
    {
        attack_target_ent = self.enemy;
        clamp_pitch = var_84ddbccc7b4142cf;
        
        if ( isdefined( self.var_72df982c7ce5d440 ) )
        {
            clamp_pitch = self.var_72df982c7ce5d440;
        }
        
        round_number = zombie_utils::get_zombie_round_difficulty();
        aimyawspeedpercentage = math::remap( round_number, 20, 50, 0, 1 );
        var_2315701dfa5d6fa = gettime() - ( self.var_a9983e721f3b21c2 ?? 0 );
        missing_time_threshold = 5000;
        
        if ( var_2315701dfa5d6fa > missing_time_threshold )
        {
            aimyawspeedpercentage = 1;
        }
        
        self.aimyawspeed = 10 + clamp( aimyawspeedpercentage, 0, 1 ) * 150;
        beam_length = self.var_89cc06fcebe201a1;
        head_mid_tag = self.var_80a2b3edd3d43109[ 1 ];
        head_angles = self gettagangles( head_mid_tag );
        head_angles = ( 0, head_angles[ 1 ], 0 );
        head_pos = self gettagorigin( head_mid_tag );
        head_forward_vec = anglestoforward( head_angles );
        var_110dce6d38f582a6 = function_35c19e0bf9b095b8();
        var_16af507c59384dee = [];
        
        for ( priority_i = 1; priority_i < var_110dce6d38f582a6.size ; priority_i++ )
        {
            var_16af507c59384dee[ var_16af507c59384dee.size ] = var_110dce6d38f582a6[ priority_i ];
        }
        
        secondary_targets = [];
        
        if ( var_16af507c59384dee.size > 0 && isdefined( attack_target_ent ) )
        {
            secondary_target_range = self.zombieaisettings.var_d3de1a9faac42deb.var_76982f709c010e9 ?? 250;
            var_1ecb4d67846f3df8 = physics_querypoint( attack_target_ent.origin, secondary_target_range, physics_createcontents( [ "physicscontents_characterproxy" ] ), [ self, attack_target_ent ], "physicsquery_all" );
            
            foreach ( potential_target in var_1ecb4d67846f3df8 )
            {
                if ( var_16af507c59384dee.size <= 0 )
                {
                    break;
                }
                
                target_ent = potential_target[ "entity" ];
                
                if ( !isalive( target_ent ) || target_ent.team == self.team )
                {
                    continue;
                }
                
                is_on_right = math::function_84e592007021cc09( target_ent.origin - self.origin, head_forward_vec );
                
                if ( is_on_right )
                {
                    if ( arraycontains( var_16af507c59384dee, 2 ) )
                    {
                        var_16af507c59384dee = arrayremove( var_16af507c59384dee, 2 );
                        secondary_targets[ 2 ] = target_ent;
                    }
                }
                else if ( arraycontains( var_16af507c59384dee, 0 ) )
                {
                    var_16af507c59384dee = arrayremove( var_16af507c59384dee, 0 );
                    secondary_targets[ 0 ] = target_ent;
                }
                
                /#
                    beam_print( "<dev string:xc9>" + ( is_on_right ? "<dev string:xd3>" : "<dev string:xd9>" ), target_ent.origin + ( 0, 0, 70 ) );
                #/
            }
        }
        
        primary_head_index = var_110dce6d38f582a6[ 0 ];
        
        foreach ( head_index in var_110dce6d38f582a6 )
        {
            var_dc69dd01be7a0cd6 = undefined;
            is_primary = head_index == primary_head_index;
            
            if ( is_primary || isdefined( secondary_targets[ head_index ] ) )
            {
                target_ent = is_primary ? attack_target_ent : secondary_targets[ head_index ];
                var_dc69dd01be7a0cd6 = function_67b74f762e331631( var_a1abee9062687674[ head_index ], target_ent, head_index, is_primary, head_angles, head_pos, clamp_pitch, var_255fcf4526cbba4e );
            }
            else
            {
                var_dc69dd01be7a0cd6 = var_a1abee9062687674[ primary_head_index ];
            }
            
            var_a1abee9062687674[ head_index ] = function_760bace0ade9b0b0( var_a1abee9062687674[ head_index ], var_dc69dd01be7a0cd6 );
            var_7a8c168bf4869367[ head_index ] = function_fd2c98f631ee19f9( var_a1abee9062687674[ head_index ], head_angles, head_pos, beam_length );
        }
        
        beam_end_points = [];
        var_3a13dbe5f9e2617a = [];
        var_f643d05a1eb01ec0 = [];
        current_time = gettime();
        assert( isdefined( self.var_7cd2a9178d92be44 ) );
        
        for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
        {
            if ( zombie_abom_metabones::is_head_alive( self, abom_head_index ) )
            {
                source_pos = self gettagorigin( self.var_80a2b3edd3d43109[ abom_head_index ] );
                end_pos = undefined;
                beam_trace = trace::ray_trace( self getcentroid(), source_pos );
                hit_something = beam_trace[ "fraction" ] < 1;
                
                if ( hit_something )
                {
                    end_pos = source_pos;
                }
                else
                {
                    beam_trace = trace::ray_trace( source_pos, var_7a8c168bf4869367[ abom_head_index ] );
                    end_pos = var_7a8c168bf4869367[ abom_head_index ];
                    var_e87806c43847a66b = physics_getsurfacetypefromflags( beam_trace[ "surfaceflags" ] );
                    stringsurfacename = var_e87806c43847a66b[ "name" ];
                    
                    if ( isstartstr( stringsurfacename, "surftype_water" ) )
                    {
                        beam_trace = trace::ray_trace( beam_trace[ "position" ], var_7a8c168bf4869367[ abom_head_index ] );
                    }
                    
                    hit_something = beam_trace[ "fraction" ] < 1;
                    
                    if ( hit_something )
                    {
                        end_pos = beam_trace[ "position" ];
                    }
                }
                
                is_beam_tip_off = self.var_7cd2a9178d92be44[ abom_head_index ] getscriptablepartstate( "beam_tip" ) == "off";
                
                if ( is_beam_tip_off || hit_something != self.var_ad197ca11c039e90[ abom_head_index ] )
                {
                    if ( hit_something )
                    {
                        self.var_7cd2a9178d92be44[ abom_head_index ] utility::function_7c10ea82c1e305b8( "beam_tip", "hit" );
                    }
                    else
                    {
                        self.var_7cd2a9178d92be44[ abom_head_index ] utility::function_7c10ea82c1e305b8( "beam_tip", "hit_nothing" );
                    }
                }
                
                hit_ent = beam_trace[ "entity" ];
                
                if ( isdefined( hit_ent ) )
                {
                    self.var_a9983e721f3b21c2 = current_time;
                    entnum = hit_ent getentitynumber();
                    
                    if ( !isdefined( var_3a13dbe5f9e2617a[ entnum ] ) )
                    {
                        var_3a13dbe5f9e2617a[ entnum ] = 1;
                    }
                    
                    var_f643d05a1eb01ec0[ entnum ] = hit_ent;
                }
                
                self.var_ad197ca11c039e90[ abom_head_index ] = hit_something;
                beam_end_points[ abom_head_index ] = end_pos;
                
                if ( self.zombieaisettings.var_d3de1a9faac42deb.var_986a17b1124ae7b1 )
                {
                    var_ad9d8ca78535f0c6 = 5;
                    beam_vec = end_pos - source_pos;
                    beam_length = length( beam_vec );
                    beam_dir = vectornormalize( beam_vec );
                    start_dist = var_ad9d8ca78535f0c6;
                    end_dist = beam_length - var_ad9d8ca78535f0c6;
                    add_dist = var_ad9d8ca78535f0c6 * 2;
                    var_a4d7ccdceaa16d1e = start_dist;
                    
                    while ( var_a4d7ccdceaa16d1e <= end_dist )
                    {
                        var_526ab22d759a55e5 = source_pos + beam_dir * var_a4d7ccdceaa16d1e;
                        radiusdamage( var_526ab22d759a55e5, var_ad9d8ca78535f0c6, 1000, 1000, self, undefined, undefined, 1 );
                        var_a4d7ccdceaa16d1e += add_dist;
                    }
                }
            }
        }
        
        for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
        {
            if ( zombie_abom_metabones::is_head_alive( self, abom_head_index ) )
            {
                target_ent = self.var_7cd2a9178d92be44[ abom_head_index ];
                target_ent.origin = beam_end_points[ abom_head_index ];
                
                if ( !beams_created )
                {
                    target_ent dontinterpolate();
                    self.abom_beams[ abom_head_index ] = playfxontagsbetweenclients( utility::getfx( "abom_beam_fx" ), self, self.var_80a2b3edd3d43109[ abom_head_index ], target_ent, "tag_origin" );
                    
                    if ( isdefined( self.abom_beams[ abom_head_index ] ) )
                    {
                        self.abom_beams[ abom_head_index ] namespace_9d8e359c3b1041e5::forcenetfieldhighlod_sharedfunc( 1 );
                    }
                    
                    utility::function_32b24db3127bff40( self.var_885001fb6c6706f8[ abom_head_index ] + "_weakpoint", "weakpoint_off" );
                    utility::function_32b24db3127bff40( self.var_885001fb6c6706f8[ abom_head_index ] + "_beam", "beam_on" );
                }
            }
        }
        
        beams_created = 1;
        
        if ( !beam_audio_active )
        {
            var_a00e1026570d5f6a = 0;
            
            for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
            {
                if ( zombie_abom_metabones::is_head_alive( self, abom_head_index ) )
                {
                    var_a00e1026570d5f6a++;
                }
            }
            
            if ( var_a00e1026570d5f6a > 0 )
            {
                utility::function_32b24db3127bff40( "beam_audio", "beam_audio_on_" + var_a00e1026570d5f6a );
            }
            
            beam_audio_active = 1;
        }
        
        foreach ( entnum, num_beams in var_3a13dbe5f9e2617a )
        {
            hit_ent = var_f643d05a1eb01ec0[ entnum ];
            
            if ( !isdefined( hit_ent ) )
            {
                continue;
            }
            
            assert( num_beams > 0 );
            
            if ( !hit_ent utility::ent_flag( "abom_beam_attack_hit" ) )
            {
                can_dissolve = isai( hit_ent ) && isdefined( hit_ent.subclass ) && issubstr( hit_ent.subclass, "zombie_base" );
                
                if ( can_dissolve && self.zombieaisettings.var_d3de1a9faac42deb.var_ffb9d09ce59952d3 )
                {
                    hit_ent utility::ent_flag_set( "dissolve" );
                    
                    if ( self.zombieaisettings.var_d3de1a9faac42deb.var_b290380b8f8d1c67 > 0 )
                    {
                        kill_info = spawnstruct();
                        kill_info.ent = hit_ent;
                        kill_info.time = current_time + self.zombieaisettings.var_d3de1a9faac42deb.var_b290380b8f8d1c67;
                        kill_queue[ kill_queue.size ] = kill_info;
                    }
                    else
                    {
                        hit_ent kill( self.origin, self, self, "MOD_PROJECTILE" );
                    }
                }
                else
                {
                    damage = function_b893a9e913cea804( self, hit_ent, num_beams, can_dissolve );
                    hit_ent dodamage( damage, self.origin, self, self, "MOD_PROJECTILE" );
                    
                    if ( can_dissolve && damage > hit_ent.health )
                    {
                        hit_ent utility::ent_flag_set( "dissolve" );
                    }
                    
                    /#
                        beam_print( "<dev string:xde>" + hit_ent getentitynumber() + "<dev string:xec>" + damage, hit_ent.origin + ( 0, 0, 72 ) );
                    #/
                    
                    if ( isplayer( hit_ent ) )
                    {
                        hit_ent playsoundevent( %"sndevent_abom_beam_hit_player" );
                    }
                }
                
                if ( isdefined( hit_ent ) )
                {
                    hit_ent utility::ent_flag_set( "abom_beam_attack_hit" );
                    hit_ent thread utility::ent_flag_clear_delayed( "abom_beam_attack_hit", 0.2 );
                }
            }
        }
        
        for ( kill_index = kill_queue.size - 1; kill_index >= 0 ; kill_index-- )
        {
            if ( current_time >= kill_queue[ kill_index ].time )
            {
                if ( isalive( kill_queue[ kill_index ].ent ) )
                {
                    kill_queue[ kill_index ].ent kill( self.origin, self, self, "MOD_PROJECTILE" );
                }
                
                kill_queue[ kill_index ] = kill_queue[ kill_queue.size - 1 ];
                kill_queue[ kill_queue.size - 1 ] = undefined;
            }
        }
        
        /#
            if ( debug_beam_attack() )
            {
                for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
                {
                    sphere( var_7a8c168bf4869367[ abom_head_index ], 50, ( 1, 0, 0 ) );
                    
                    if ( isdefined( beam_end_points[ abom_head_index ] ) )
                    {
                        sphere( beam_end_points[ abom_head_index ], 20, ( 1, 0, 0 ) );
                        line( self gettagorigin( self.var_80a2b3edd3d43109[ abom_head_index ] ), beam_end_points[ abom_head_index ], ( 1, 0, 0 ) );
                    }
                }
            }
        #/
        
        waitframe();
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0xd978bf34, Offset: 0x1564
// Size: 0xa7
function private function_35c19e0bf9b095b8()
{
    head_priority = [];
    ideal_head_priority = [ 1, 0, 2 ];
    
    foreach ( head_index in ideal_head_priority )
    {
        if ( zombie_abom_metabones::is_head_alive( self, head_index ) )
        {
            head_priority[ head_priority.size ] = head_index;
        }
    }
    
    return head_priority;
}

// Namespace namespace_ce58d65bf2615c99
// Params 8, eflags: 0x4
// Checksum 0xe2d70fc1, Offset: 0x1614
// Size: 0x194
function private function_67b74f762e331631( var_340b7107c0229bd, attack_target_ent, head_index, is_primary_target, head_angles, head_pos, clamp_pitch, clamp_yaw )
{
    if ( isdefined( attack_target_ent ) )
    {
        var_44dc9fcddc629a5d = attack_target_ent getcentroid();
        var_8a8157493bb7b59a = ( var_44dc9fcddc629a5d[ 2 ] - attack_target_ent.origin[ 2 ] ) * 2;
        var_2315701dfa5d6fa = gettime() - ( self.var_a9983e721f3b21c2 ?? 0 );
        missing_time_threshold = 1000;
        target_height_percentage = clamp( math::remap( var_2315701dfa5d6fa, 0, missing_time_threshold, 0, 1 ), 0, 0.8 );
        target_z_offset = ( 0, 0, var_8a8157493bb7b59a * target_height_percentage );
        
        /#
            beam_print( "<dev string:xf3>" + target_height_percentage, attack_target_ent.origin );
        #/
        
        target_pos = attack_target_ent.origin + target_z_offset;
        
        if ( is_primary_target )
        {
            self.script_aimpos = target_pos;
        }
        
        to_target_angles = vectortoangles( target_pos - head_pos );
        pitch_clamped = int( clamp( angleclamp180( to_target_angles[ 0 ] - head_angles[ 0 ] ), -1 * clamp_pitch, clamp_pitch ) );
        yaw_clamped = int( clamp( angleclamp180( to_target_angles[ 1 ] - head_angles[ 1 ] ), -1 * clamp_yaw, clamp_yaw ) );
        var_62ed609f2ef3fd46 = ( pitch_clamped, yaw_clamped, 0 );
        return var_62ed609f2ef3fd46;
    }
    
    return var_340b7107c0229bd;
}

// Namespace namespace_ce58d65bf2615c99
// Params 2, eflags: 0x4
// Checksum 0xe594b19a, Offset: 0x17b1
// Size: 0xa5
function private function_760bace0ade9b0b0( var_340b7107c0229bd, var_27e885a684bcea95 )
{
    var_507dd18728f48ddc = getdvarfloat( @"hash_f3c398f445ce88db", self.var_e834bac54dd3efaa ) * level.framedurationseconds;
    var_91dd9f063f60182d = getdvarfloat( @"hash_829b91a5ea9d859a", self.var_4bce31da81afb507 ) * level.framedurationseconds;
    new_yaw = math::function_27800ff2fd4867c6( var_340b7107c0229bd[ 1 ], var_27e885a684bcea95[ 1 ], var_507dd18728f48ddc );
    new_pitch = math::function_27800ff2fd4867c6( var_340b7107c0229bd[ 0 ], var_27e885a684bcea95[ 0 ], var_91dd9f063f60182d );
    return ( new_pitch, new_yaw, var_27e885a684bcea95[ 2 ] );
}

// Namespace namespace_ce58d65bf2615c99
// Params 4, eflags: 0x4
// Checksum 0xe4b1e043, Offset: 0x185f
// Size: 0x5d
function private function_fd2c98f631ee19f9( var_340b7107c0229bd, head_angles, head_pos, beam_length )
{
    beam_angles = angleclamp( head_angles + var_340b7107c0229bd );
    beam_forward = anglestoforward( beam_angles );
    end_point = head_pos + beam_forward * beam_length;
    return end_point;
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0x2d124870, Offset: 0x18c5
// Size: 0xed
function private beam_attack_on_end()
{
    self endon( #"death" );
    self waittill( #"beam_attack_loop_finished" );
    
    for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
    {
        if ( isdefined( self.abom_beams[ abom_head_index ] ) )
        {
            self.abom_beams[ abom_head_index ] delete();
        }
        
        if ( isdefined( self.var_7cd2a9178d92be44[ abom_head_index ] ) )
        {
            self.var_7cd2a9178d92be44[ abom_head_index ] utility::function_7c10ea82c1e305b8( "beam_tip", "end" );
        }
        
        utility::function_32b24db3127bff40( self.var_885001fb6c6706f8[ abom_head_index ] + "_beam", "beam_off" );
        utility::function_32b24db3127bff40( "beam_audio", "beam_audio_end" );
    }
    
    self clearpath();
    self clearbtgoal( 0 );
    self setbtgoalstationary( 0 );
    
    if ( utility::ent_flag( "no_beam_attack_cooldown" ) )
    {
        self function_786bb6aa1b76c7ee( "beam_attack_next", 0 );
        utility::ent_flag_clear( "no_beam_attack_cooldown" );
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 1, eflags: 0x4
// Checksum 0x1bcb8f1f, Offset: 0x19ba
// Size: 0x48
function private cleanup_beam_ents( params )
{
    for ( abom_head_index = 0; abom_head_index <= 2 ; abom_head_index++ )
    {
        if ( isdefined( self.abom_beams[ abom_head_index ] ) )
        {
            self.abom_beams[ abom_head_index ] delete();
        }
    }
}

// Namespace namespace_ce58d65bf2615c99
// Params 0, eflags: 0x4
// Checksum 0x6dfce2e2, Offset: 0x1a0a
// Size: 0x67
function private function_4f22c055483197a2()
{
    if ( !self.zombieaisettings.var_d3de1a9faac42deb.var_ef4c94e8dddcdc5b )
    {
        return;
    }
    
    if ( utility::ent_flag( "on_followup_beam_cooldown" ) )
    {
        return;
    }
    
    utility::ent_flag_set( "on_followup_beam_cooldown" );
    var_4c86d9880653f245 = 20;
    thread utility::ent_flag_clear_delayed( "on_followup_beam_cooldown", var_4c86d9880653f245 );
    utility::ent_flag_set( "no_beam_attack_cooldown" );
}

/#

    // Namespace namespace_ce58d65bf2615c99
    // Params 0
    // Checksum 0xb79af4a7, Offset: 0x1a79
    // Size: 0x44, Type: dev
    function function_d0a88666aaee23d4()
    {
        devgui::function_9082edeb5db93280( "<dev string:x105>" );
        devgui::add_devgui_func( "<dev string:x122>", "<dev string:x134>", &force_beam_attack );
        devgui::add_devgui_func( "<dev string:x14b>", "<dev string:x15d>", &function_1a3b3a6ad2d7ea45 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_ce58d65bf2615c99
    // Params 0, eflags: 0x4
    // Checksum 0xc63f7499, Offset: 0x1ac5
    // Size: 0x70, Type: dev
    function private force_beam_attack()
    {
        abom = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x174>" );
        
        if ( !isdefined( abom ) )
        {
            abom = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x180>" );
        }
        
        if ( !isdefined( abom ) )
        {
            return;
        }
        
        abom function_786bb6aa1b76c7ee( "<dev string:x191>", 1 );
    }

    // Namespace namespace_ce58d65bf2615c99
    // Params 0, eflags: 0x4
    // Checksum 0xbd834854, Offset: 0x1b3d
    // Size: 0x16, Type: dev
    function private debug_beam_attack()
    {
        return getdvarint( @"hash_e89dc8c72b8a01da", 0 ) > 0;
    }

    // Namespace namespace_ce58d65bf2615c99
    // Params 0, eflags: 0x4
    // Checksum 0xa3155eec, Offset: 0x1b5b
    // Size: 0x1a, Type: dev
    function private function_1a3b3a6ad2d7ea45()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x1a0>", @"hash_e89dc8c72b8a01da" );
    }

    // Namespace namespace_ce58d65bf2615c99
    // Params 2, eflags: 0x4
    // Checksum 0xee4e2acb, Offset: 0x1b7d
    // Size: 0x5b, Type: dev
    function private beam_print( text, pos )
    {
        if ( debug_beam_attack() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x1b7>" + text, ( 1, 0, 0 ) );
        }
    }

#/
