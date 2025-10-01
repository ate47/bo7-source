#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace manglercannon_torpedo;

// Namespace manglercannon_torpedo
// Params 22
// Checksum 0xedd05baa, Offset: 0x220
// Size: 0x29e
function function_56937fec1fbe3996( torpedo_pos, launch_direction, target, target_pos, detonation_dist, velocity, var_ba2f569f2ff3e963, max_range, var_9f41aee395f7fc25, torpedo_radius, blast_radius, var_3dce0566c67a1e0c, var_f5fcdef96e5baedf, var_934ea66ab840b605, var_9371b06ab86713bb, var_19c5437e89b71a4f, var_df18ad0e16c22c4a, var_deed69668835b4ea, var_77f0ce30fc0a0636, weapon, var_197729c15bb8934f, detonate_callback )
{
    torpedo = spawn( "script_model", torpedo_pos );
    torpedo setmodel( var_197729c15bb8934f );
    torpedo.torpedo_owner = self;
    torpedo.is_detonating = 0;
    vec_to_enemy = launch_direction;
    angles_to_enemy = vectortoangles( vec_to_enemy );
    torpedo.angles = angles_to_enemy;
    normal_vector = vectornormalize( vec_to_enemy );
    torpedo.var_d2f30a8508729137 = normal_vector;
    torpedo.knockdown_iterations = 0;
    torpedo.var_91057f4d7700706f = 0;
    torpedo.var_754562c3f0ea5926 = detonation_dist * detonation_dist;
    torpedo.var_6698bf485a6fac74 = detonation_dist;
    torpedo.torpedo_velocity = velocity;
    torpedo.var_c6fb351ac1f2f637 = var_ba2f569f2ff3e963;
    torpedo.var_3384794d4b9d0e62 = max_range;
    torpedo.var_ac9269f27fa49b29 = var_9f41aee395f7fc25;
    torpedo.torpedo_radius = torpedo_radius;
    torpedo.var_be00e689a22c2257 = blast_radius;
    torpedo.var_1e78587ee8e28c38 = var_3dce0566c67a1e0c;
    torpedo.var_35e0e16bb03c9593 = var_f5fcdef96e5baedf;
    torpedo.var_35ef1617989245d = var_934ea66ab840b605;
    torpedo.var_33bfb617962f2a3 = var_9371b06ab86713bb;
    torpedo.var_19c5437e89b71a4f = var_19c5437e89b71a4f;
    torpedo.var_deed69668835b4ea = var_deed69668835b4ea;
    torpedo.var_df18ad0e16c22c4a = var_df18ad0e16c22c4a;
    torpedo.weapon = weapon;
    torpedo.detonate_callback = detonate_callback;
    
    if ( !isdefined( level.var_4e7414065a73c00f ) )
    {
        level.var_4e7414065a73c00f = throttle::throttle_initialize( "mangler_torpedo_damage", 4 );
    }
    
    torpedo thread torpedo_monitor( target, target_pos );
    torpedo thread function_ec5968b1f92c5d13( target, target_pos );
    
    if ( var_77f0ce30fc0a0636 )
    {
        torpedo thread function_1c9da2d0439947ff( target, target_pos );
    }
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0x8eb28fc6, Offset: 0x4c6
// Size: 0x36
function private function_2245a5356a702bb7( var_b594baf6c774413d, target_pos )
{
    if ( isdefined( var_b594baf6c774413d ) )
    {
        var_102645f9fdb06e7e = var_b594baf6c774413d getcentroid();
    }
    else
    {
        var_102645f9fdb06e7e = target_pos;
    }
    
    return var_102645f9fdb06e7e;
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0xbd9b36bc, Offset: 0x505
// Size: 0x9d
function private function_1c9da2d0439947ff( torpedo_target, target_pos )
{
    self endon( "death" );
    self endon( "detonated" );
    torpedo = self;
    var_99bac538fb32abbe = isdefined( torpedo_target );
    
    while ( isdefined( torpedo ) && ( !var_99bac538fb32abbe || isdefined( torpedo_target ) ) )
    {
        if ( var_99bac538fb32abbe )
        {
            var_52ef6ef739faa662 = torpedo_target getcentroid();
        }
        else
        {
            var_52ef6ef739faa662 = target_pos;
        }
        
        if ( distancesquared( torpedo.origin, var_52ef6ef739faa662 ) <= self.var_754562c3f0ea5926 )
        {
            torpedo thread torpedo_detonate( 0, torpedo_target );
        }
        
        waitframe();
    }
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0xa87dca9d, Offset: 0x5aa
// Size: 0xdc
function private torpedo_monitor( target, target_pos )
{
    self endon( "death" );
    self endon( "detonated" );
    torpedo = self;
    var_949f39e44ca9630b = self.torpedo_velocity * self.var_c6fb351ac1f2f637;
    max_trail_iterations = int( self.var_3384794d4b9d0e62 / var_949f39e44ca9630b );
    var_99bac538fb32abbe = isdefined( target );
    
    while ( isdefined( torpedo ) )
    {
        if ( var_99bac538fb32abbe && !isdefined( target ) || torpedo.var_91057f4d7700706f >= max_trail_iterations )
        {
            torpedo thread torpedo_detonate( 0, target );
        }
        else
        {
            torpedo function_4d97da3bb38904d7( target, target_pos );
            torpedo.var_91057f4d7700706f += 1;
        }
        
        wait self.var_c6fb351ac1f2f637;
    }
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0xb6fc3962, Offset: 0x68e
// Size: 0x4d2
function private function_4d97da3bb38904d7( target, target_pos )
{
    self endon( "death" );
    self endon( "detonated" );
    
    if ( !isdefined( self.var_2068eeabd509dd7c ) )
    {
        var_593c236873bc8ff = self.var_ac9269f27fa49b29 * self.var_c6fb351ac1f2f637;
        self.var_2068eeabd509dd7c = cos( var_593c236873bc8ff );
    }
    
    var_102645f9fdb06e7e = function_2245a5356a702bb7( target, target_pos );
    vector_to_target = var_102645f9fdb06e7e - self.origin;
    normal_vector = vectornormalize( vector_to_target );
    
    if ( isdefined( self.var_d2f30a8508729137 ) )
    {
        var_21a347b2fc04a421 = vectornormalize( ( normal_vector[ 0 ], normal_vector[ 1 ], 0 ) );
        var_76f3d70e8619b13 = vectornormalize( ( self.var_d2f30a8508729137[ 0 ], self.var_d2f30a8508729137[ 1 ], 0 ) );
        dot = vectordot( var_21a347b2fc04a421, var_76f3d70e8619b13 );
        
        if ( dot >= 1 )
        {
            dot = 1;
        }
        else if ( dot <= -1 )
        {
            dot = -1;
        }
        
        if ( dot < self.var_2068eeabd509dd7c )
        {
            new_vector = normal_vector - self.var_d2f30a8508729137;
            angle_between_vectors = acos( dot );
            
            if ( !isdefined( angle_between_vectors ) )
            {
                angle_between_vectors = 180;
            }
            
            if ( angle_between_vectors == 0 )
            {
                angle_between_vectors = 0.0001;
            }
            
            var_4afd02293043a8c8 = self.var_ac9269f27fa49b29 * self.var_c6fb351ac1f2f637;
            ratio = var_4afd02293043a8c8 / angle_between_vectors;
            
            if ( ratio > 1 )
            {
                ratio = 1;
            }
            
            new_vector *= ratio;
            new_vector += self.var_d2f30a8508729137;
            normal_vector = vectornormalize( new_vector );
        }
    }
    
    move_distance = self.torpedo_velocity * self.var_c6fb351ac1f2f637;
    move_vector = move_distance * normal_vector;
    self.move_direction = normal_vector;
    move_to_point = self.origin + move_vector;
    ignoreents = [ self, self.torpedo_owner ];
    trace = trace::ray_trace_detail( self.origin, move_to_point, ignoreents, undefined, 1, 0, 1 );
    
    if ( trace[ "hittype" ] == "hittype_world" && trace[ "surfacetype" ] != "surftype_water" )
    {
        detonate_point = trace[ "position" ];
        delay = function_36353012549047b0( self.origin, detonate_point, move_distance, self.var_c6fb351ac1f2f637 );
        thread torpedo_detonate( delay, target );
    }
    else if ( trace[ "hittype" ] == "hittype_entity" )
    {
        hitentity = trace[ "entity" ];
        detonate_point = trace[ "position" ];
        
        if ( isai( hitentity ) )
        {
            zombie = hitentity;
            
            if ( self.var_deed69668835b4ea && ( zombie.aicategory == "special" || zombie.aicategory == "elite" || zombie.aicategory == "hvt" || zombie.aicategory == "boss" ) && !( self.torpedo_owner.team === zombie.team ) )
            {
                delay = function_36353012549047b0( self.origin, detonate_point, move_distance, self.var_c6fb351ac1f2f637 );
                
                if ( distancesquared( zombie.origin, detonate_point ) > squared( self.var_be00e689a22c2257 ) )
                {
                    zombie dodamage( int( ( self.var_35e0e16bb03c9593 + self.var_1e78587ee8e28c38 ) / 2 ), zombie.origin, self.torpedo_owner, self, "MOD_PROJECTILE", self.weapon, "torso_lower" );
                }
                
                thread torpedo_detonate( delay, target );
            }
        }
        else
        {
            delay = function_36353012549047b0( self.origin, detonate_point, move_distance, self.var_c6fb351ac1f2f637 );
            thread torpedo_detonate( delay, target );
        }
    }
    else if ( trace[ "hittype" ] == "hittype_scriptable" )
    {
        detonate_point = trace[ "position" ];
        scriptable = trace[ "scriptable" ];
        
        if ( isdefined( scriptable ) )
        {
            scriptable scriptabledodamage( int( ( self.var_35e0e16bb03c9593 + self.var_1e78587ee8e28c38 ) / 2 ), self, self.torpedo_owner, detonate_point, move_vector, "MOD_PROJECTILE", self.weapon );
            delay = function_36353012549047b0( self.origin, detonate_point, move_distance, self.var_c6fb351ac1f2f637 );
            thread torpedo_detonate( delay, target );
        }
    }
    
    self.var_d2f30a8508729137 = normal_vector;
    self moveto( move_to_point, self.var_c6fb351ac1f2f637 );
}

// Namespace manglercannon_torpedo
// Params 4, eflags: 0x4
// Checksum 0x6fd2506b, Offset: 0xb68
// Size: 0x66
function private function_36353012549047b0( current_point, detonate_point, move_distance, time_interval )
{
    dist_sq = distancesquared( detonate_point, current_point );
    move_dist_sq = move_distance * move_distance;
    ratio = dist_sq / move_dist_sq;
    delay = ratio * time_interval;
    return delay;
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0x4a4fca5c, Offset: 0xbd7
// Size: 0x1e0
function private torpedo_detonate( delay, target )
{
    self endon( "death" );
    self notify( "detonated" );
    self endon( "detonated" );
    torpedo = self;
    torpedo_owner = self.torpedo_owner;
    self.is_detonating = 1;
    
    if ( isdefined( self.detonate_callback ) )
    {
        [[ self.detonate_callback ]]( target );
    }
    
    if ( delay > 0 )
    {
        wait delay;
    }
    
    if ( isdefined( self ) )
    {
        function_e741ac1a6e3efae3();
        self setscriptablepartstate( "torpedo", "detonate" );
        explosion_point = torpedo.origin;
        meansofdeath = "MOD_PROJECTILE_SPLASH";
        
        if ( !isdefined( torpedo_owner ) )
        {
            torpedo_owner = undefined;
            radiusdamage( explosion_point, self.var_be00e689a22c2257, self.var_35e0e16bb03c9593, self.var_1e78587ee8e28c38, torpedo_owner, meansofdeath, self.weapon );
        }
        else
        {
            torpedo_owner radiusdamage( explosion_point, self.var_be00e689a22c2257, self.var_35e0e16bb03c9593, self.var_1e78587ee8e28c38, torpedo_owner, meansofdeath, self.weapon );
        }
        
        function_d5339a4fb9b59a50( explosion_point, torpedo_owner );
        params = spawnstruct();
        params.damage = int( ( self.var_35e0e16bb03c9593 + self.var_1e78587ee8e28c38 ) / 2 );
        params.origin = explosion_point;
        params.radius = self.var_be00e689a22c2257;
        params.meansofdeath = meansofdeath;
        
        /#
            recordsphere( params.origin, 5, ( 1, 0, 0 ) );
        #/
        
        self.torpedo_owner callback::callback( "damage_point", params );
        wait 0.5;
        
        if ( isdefined( self ) )
        {
            self delete();
        }
    }
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0xce7fa39c, Offset: 0xdbf
// Size: 0x128
function private function_d5339a4fb9b59a50( torpedo_origin, torpedo_owner )
{
    players = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( torpedo_origin, 100 );
    
    for ( i = 0; i < players.size ; i++ )
    {
        player = players[ i ];
        
        if ( !isalive( player ) )
        {
            continue;
        }
        
        if ( !player isonground() )
        {
            continue;
        }
        
        if ( isdefined( torpedo_owner ) && torpedo_owner.team === player.team )
        {
            continue;
        }
        
        n_distance = distance2dsquared( torpedo_origin, player.origin );
        
        if ( n_distance < 0.01 )
        {
            continue;
        }
        
        v_dir = player.origin - torpedo_origin;
        v_dir = ( v_dir[ 0 ], v_dir[ 1 ], 0.1 );
        v_dir = vectornormalize( v_dir );
        n_push_strength = self.var_33bfb617962f2a3;
        n_push_strength = self.var_35ef1617989245d + randomint( int( n_push_strength ) - int( self.var_35ef1617989245d ) );
        player knockback( v_dir, n_push_strength );
    }
}

// Namespace manglercannon_torpedo
// Params 0, eflags: 0x4
// Checksum 0x624d1e94, Offset: 0xeef
// Size: 0xce
function private function_e741ac1a6e3efae3()
{
    earthquake( 0.4, 0.8, self.origin, 300 );
    players = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( self.origin, self.var_6698bf485a6fac74 );
    
    foreach ( player in players )
    {
        player playrumbleonentity( "damage_heavy" );
        
        if ( player isscriptable() )
        {
            player setscriptablepartstate( "mangler_cannon_projectile_audio", "hit" );
        }
    }
}

// Namespace manglercannon_torpedo
// Params 2, eflags: 0x4
// Checksum 0x4f7cb938, Offset: 0xfc5
// Size: 0x65c
function private function_ec5968b1f92c5d13( torpedo_target, target_pos )
{
    self endon( "death" );
    self endon( "detonated" );
    
    while ( isdefined( self ) && !self.is_detonating )
    {
        a_zombies = [];
        prediction_time = 0.3;
        normal_vector = self.move_direction;
        move_distance = self.torpedo_velocity * prediction_time;
        move_vector = move_distance * normal_vector;
        self.angles = vectortoangles( move_vector );
        predicted_pos = self.origin + move_vector;
        midpoint = self.origin + move_distance / 2 * normal_vector;
        myradius = max( self.torpedo_radius, move_distance / 2 );
        myradius *= 1.2;
        a_targets = getaiarrayinradius( midpoint, myradius );
        
        /#
        #/
        
        /#
        #/
        
        if ( self.var_19c5437e89b71a4f > 0 )
        {
            scaled_damage = self.var_19c5437e89b71a4f;
            
            if ( !isai( self.torpedo_owner ) )
            {
                if ( utility::issharedfuncdefined( #"game", #"hash_1e485ee80b4faab7" ) )
                {
                    scaled_damage = [[ utility::getsharedfunc( #"game", #"hash_1e485ee80b4faab7" ) ]]( self.var_19c5437e89b71a4f, namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin ), getweaponrootstring( self.weapon ), "normal" );
                }
            }
        }
        
        var_26945e0aa73c6834 = [];
        
        foreach ( target in a_targets )
        {
            if ( !isalive( target ) || target == self.torpedo_owner )
            {
                continue;
            }
            
            if ( isplayer( self.torpedo_owner ) && self.torpedo_owner.team === target.team )
            {
                continue;
            }
            
            var_7d51d5f41a453854 = self.origin;
            enemy_pos = target getcentroid();
            facing_vec = anglestoforward( self.angles );
            enemy_vec = enemy_pos - var_7d51d5f41a453854;
            var_9daa30d9ff167aa7 = ( enemy_vec[ 0 ], enemy_vec[ 1 ], 0 );
            var_52e9e9b2cd47aea1 = ( facing_vec[ 0 ], facing_vec[ 1 ], 0 );
            var_9daa30d9ff167aa7 = vectornormalize( var_9daa30d9ff167aa7 );
            var_52e9e9b2cd47aea1 = vectornormalize( var_52e9e9b2cd47aea1 );
            enemy_dot = vectordot( var_52e9e9b2cd47aea1, var_9daa30d9ff167aa7 );
            
            if ( enemy_dot < 0 || function_714341c51423832d( self.origin, predicted_pos, enemy_pos ) > self.torpedo_radius * self.torpedo_radius )
            {
                continue;
            }
            
            /#
            #/
            
            if ( !target._blackboard.zombieinknockdown && ( !isdefined( target.aicategory ) || target.aicategory == "normal" ) )
            {
                if ( utility::issharedfuncdefined( #"zombie", #"knockdownzombie" ) )
                {
                    target [[ utility::getsharedfunc( #"zombie", #"knockdownzombie" ) ]]( self.origin );
                }
            }
            
            if ( self.var_df18ad0e16c22c4a && target.aicategory == "elite" )
            {
                if ( utility::issharedfuncdefined( #"zombie", #"stunZombie" ) )
                {
                    target [[ utility::getsharedfunc( #"zombie", #"stunZombie" ) ]]( 1 );
                }
            }
            
            if ( self.var_19c5437e89b71a4f > 0 && ( !isdefined( target.aicategory ) || target.aicategory == "normal" ) && !( target.team === self.torpedo_owner.team ) )
            {
                if ( target.health < scaled_damage )
                {
                    dir = enemy_pos - var_7d51d5f41a453854;
                    dir = vectornormalize( dir );
                    dir += ( 0, 0, 0.25 );
                    target.ragdollimpactvector = dir * 10000;
                    target.ragdollhitloc = "torso_lower";
                    
                    if ( issubstr( target.subclass, "zombie_base" ) )
                    {
                        if ( !( isdefined( self.var_62591663e6a187ce ) && !self.var_62591663e6a187ce ) && !target.noragdoll && !target.script_noragdoll )
                        {
                            target.do_immediate_ragdoll = 1;
                        }
                        
                        if ( utility::issharedfuncdefined( #"zombie", #"hash_a32faecccd434d84" ) )
                        {
                            target [[ utility::getsharedfunc( #"zombie", #"hash_a32faecccd434d84" ) ]]( 1 );
                        }
                    }
                }
                
                var_26945e0aa73c6834[ var_26945e0aa73c6834.size ] = target;
            }
        }
        
        thread function_68b15bf5b81493ed( var_26945e0aa73c6834 );
        
        if ( isdefined( level.var_e3fbaa560ceafec1 ) )
        {
            foreach ( ent in level.var_e3fbaa560ceafec1 )
            {
                if ( isdefined( ent ) && ( ent istouchingpoint( predicted_pos ) || function_714341c51423832d( self.origin, predicted_pos, ent.origin ) < self.torpedo_radius * self.torpedo_radius ) )
                {
                    ent dodamage( self.var_19c5437e89b71a4f, ent.origin, self.torpedo_owner, self, "MOD_PROJECTILE", self.weapon );
                }
            }
        }
        
        wait prediction_time;
    }
}

// Namespace manglercannon_torpedo
// Params 1, eflags: 0x4
// Checksum 0x49f7dabe, Offset: 0x1629
// Size: 0xcc
function private function_68b15bf5b81493ed( targets )
{
    foreach ( target in targets )
    {
        if ( isdefined( self ) )
        {
            if ( isalive( target ) )
            {
                target dodamage( self.var_19c5437e89b71a4f, target.origin, self.torpedo_owner, self, "MOD_PROJECTILE", self.weapon, "torso_lower" );
            }
            
            throttle::function_cc0eee553a602af0( level.var_4e7414065a73c00f, self );
        }
    }
}

// Namespace manglercannon_torpedo
// Params 1
// Checksum 0x9c7a5b3e, Offset: 0x16fd
// Size: 0x44
function function_144584dabc52a876( ent )
{
    if ( !isdefined( level.var_e3fbaa560ceafec1 ) )
    {
        level.var_e3fbaa560ceafec1 = [ ent ];
        return;
    }
    
    level.var_e3fbaa560ceafec1[ level.var_e3fbaa560ceafec1.size ] = ent;
}

// Namespace manglercannon_torpedo
// Params 1
// Checksum 0xb17d47a7, Offset: 0x1749
// Size: 0x4f
function function_507c11e00679e49d( ent )
{
    if ( !isdefined( level.var_e3fbaa560ceafec1 ) || level.var_e3fbaa560ceafec1.size == 0 )
    {
        level.var_e3fbaa560ceafec1 = undefined;
        return;
    }
    
    level.var_e3fbaa560ceafec1 = arrayremove( level.var_e3fbaa560ceafec1, ent );
}

