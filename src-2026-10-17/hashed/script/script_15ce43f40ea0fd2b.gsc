#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\scriptable;
#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace zombie_attractor_manager;

// Namespace zombie_attractor_manager
// Params 0, eflags: 0x1
// Checksum 0xbf4e6b46, Offset: 0x387
// Size: 0xad
function autoexec init()
{
    utility::registersharedfunc( #"zombie_attractor", #"init", &init_zombie_attractor_manager );
    utility::registersharedfunc( #"zombie_attractor", #"addattractor", &add_attractor );
    utility::registersharedfunc( #"zombie_attractor", #"removeattractor", &remove_attractor );
    utility::registersharedfunc( #"zombie_attractor", #"addonself", &function_7eb1aaa8bc7cc15 );
    utility::registersharedfunc( #"zombie_attractor", #"removeonself", &function_dcfb4c31f1d97cd2 );
    namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"hash_14cd05bcce8c23a3", &function_e3743c2577dbec4a );
}

// Namespace zombie_attractor_manager
// Params 0, eflags: 0x5
// Checksum 0xb11740a9, Offset: 0x43c
// Size: 0x6d
function private autoexec init_zombie_attractor_manager()
{
    if ( level.gametypebundle.var_8318eed5fd779573 )
    {
        return;
    }
    
    level.active_attractors = [];
    level.var_f1c750caecfbc463 = [];
    callback::get_template( "zombie" ) callback::add( "damage_point", &on_damage_point );
    scriptable::scriptable_adddamagedcallback( &function_baa87485292b417 );
    thread function_1760643af2232fc2();
    thread function_65e71f6a299ba6c9();
    
    /#
        thread debug_attractors();
    #/
}

// Namespace zombie_attractor_manager
// Params 10
// Checksum 0x6876a64a, Offset: 0x4b1
// Size: 0x141
function add_attractor( ent_or_struct, priority, range, is_attackable, var_b29803c8278047e1, var_1466dd1a94ffa11e, var_9c041edf3c73110f, override_team, force_reachable, var_e359b706d5b60ecf )
{
    assert( isent( ent_or_struct ) || isstruct( ent_or_struct ) || !isent( ent_or_struct ) && ent_or_struct isscriptableinstance() );
    assert( isdefined( ent_or_struct.origin ) );
    
    if ( !isdefined( ent_or_struct.origin ) )
    {
        return;
    }
    
    attractor_struct = spawnstruct();
    attractor_struct.source = ent_or_struct;
    attractor_struct.var_1466dd1a94ffa11e = var_1466dd1a94ffa11e;
    
    if ( isdefined( override_team ) )
    {
        attractor_struct.source.team = override_team;
    }
    
    if ( !isdefined( attractor_struct.source.team ) )
    {
        attractor_struct.source.team = "allies";
    }
    
    level function_6d637e25ef974f4b( attractor_struct, priority, range, is_attackable, var_b29803c8278047e1, var_9c041edf3c73110f, force_reachable, var_e359b706d5b60ecf );
    return attractor_struct;
}

// Namespace zombie_attractor_manager
// Params 10
// Checksum 0xd35a642f, Offset: 0x5fb
// Size: 0x147
function function_7eb1aaa8bc7cc15( ent_or_struct, priority, range, is_attackable, var_b29803c8278047e1, var_1466dd1a94ffa11e, var_9c041edf3c73110f, override_team, force_reachable, var_e359b706d5b60ecf )
{
    assert( isent( ent_or_struct ) || isstruct( ent_or_struct ) );
    assert( isdefined( ent_or_struct.origin ) );
    
    if ( !isdefined( ent_or_struct.origin ) )
    {
        return;
    }
    
    attractor_struct = spawnstruct();
    attractor_struct.source = ent_or_struct;
    attractor_struct.var_1466dd1a94ffa11e = var_1466dd1a94ffa11e;
    
    if ( isdefined( override_team ) )
    {
        attractor_struct.source.team = override_team;
    }
    
    if ( !isdefined( attractor_struct.source.team ) )
    {
        attractor_struct.source.team = "allies";
    }
    
    level.var_f1c750caecfbc463 = arraycombineunique( level.var_f1c750caecfbc463, [ self ] );
    function_6d637e25ef974f4b( attractor_struct, priority, range, is_attackable, var_b29803c8278047e1, var_9c041edf3c73110f, force_reachable, var_e359b706d5b60ecf );
    return attractor_struct;
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0xc5d130c6, Offset: 0x74b
// Size: 0x15
function remove_attractor( var_66e511e2765463fe )
{
    return level function_78391879e45332b0( var_66e511e2765463fe );
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0xca5ca535, Offset: 0x769
// Size: 0x14
function function_dcfb4c31f1d97cd2( var_66e511e2765463fe )
{
    return function_78391879e45332b0( var_66e511e2765463fe );
}

// Namespace zombie_attractor_manager
// Params 0
// Checksum 0xc7975bf, Offset: 0x786
// Size: 0x404, Type: bool
function calculate_target_attractor()
{
    potential_attractors = self function_af79ce8d7dd29cdf();
    
    if ( !isdefined( potential_attractors ) || potential_attractors.size <= 0 )
    {
        self.target_attractor = undefined;
        return false;
    }
    
    best_attractor = undefined;
    best_attractor_slots = [];
    var_2d9536db6c4052c2 = 1;
    closest_dist_sq = undefined;
    best_attractor_priority = undefined;
    
    foreach ( attractor in potential_attractors )
    {
        if ( attractor.priority < best_attractor_priority )
        {
            break;
        }
        
        if ( isdefined( attractor.var_1466dd1a94ffa11e ) && ![[ attractor.var_1466dd1a94ffa11e ]]( attractor, self ) )
        {
            continue;
        }
        
        if ( !attractor.skipteamcheck && isdefined( attractor.source ) && self.team == attractor.source.team )
        {
            continue;
        }
        
        if ( utility::issharedfuncdefined( #"zm", #"hash_57e52c648ecc4c3c" ) )
        {
            if ( !level [[ utility::getsharedfunc( #"zm", #"hash_57e52c648ecc4c3c" ) ]]( attractor, self ) )
            {
                continue;
            }
        }
        
        available_slots = [];
        var_67b227f26a3f7eb0 = 0;
        
        if ( attractor.attractor_slots.size > 0 )
        {
            available_slots = [];
            
            foreach ( slot in attractor.attractor_slots )
            {
                if ( !isalive( slot.assigned_ai ) && gettime() > slot.var_5a25d62d7ccac022 + attractor.slot_cooldown_ms && ( !isdefined( slot.subclass ) || slot.subclass == self.subclass ) )
                {
                    available_slots[ available_slots.size ] = slot;
                    continue;
                }
                
                if ( slot.assigned_ai === self )
                {
                    var_67b227f26a3f7eb0 = 1;
                }
            }
            
            if ( available_slots.size <= 0 && !var_67b227f26a3f7eb0 )
            {
                continue;
            }
        }
        
        dist_sq = distancesquared( attractor.source.origin, self.origin );
        
        if ( !isdefined( closest_dist_sq ) || closest_dist_sq > dist_sq )
        {
            best_attractor = attractor.var_9c041edf3c73110f ? undefined : attractor;
            best_attractor_slots = available_slots;
            best_attractor_priority = attractor.priority;
            var_2d9536db6c4052c2 = !var_67b227f26a3f7eb0;
            closest_dist_sq = dist_sq;
        }
    }
    
    if ( var_2d9536db6c4052c2 )
    {
        slot = undefined;
        
        if ( best_attractor_slots.size > 0 )
        {
            slot = function_47c86977a18df38b( best_attractor_slots, self.origin );
        }
        
        if ( isdefined( self.target_attractor_slot ) )
        {
            self.target_attractor_slot.assigned_ai = undefined;
        }
        
        self.target_attractor_slot = slot;
        
        if ( isdefined( slot ) )
        {
            slot.assigned_ai = self;
        }
    }
    
    if ( ( !isdefined( self.target_attractor ) || !( self.target_attractor === best_attractor ) ) && isdefined( best_attractor ) )
    {
        params = { #target_ai:self, #target_attractor:best_attractor };
        callback::callback( "on_ai_acquire_attractor", params );
    }
    else if ( isdefined( self.target_attractor ) && !isdefined( best_attractor ) )
    {
        callback::callback( "on_ai_lose_attractor" );
    }
    
    self.target_attractor = best_attractor;
    return true;
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0x94ef92f5, Offset: 0xb93
// Size: 0x62
function function_3803e8d052e47b39( attractor )
{
    if ( isdefined( attractor.var_b29803c8278047e1 ) )
    {
        return [[ attractor.var_b29803c8278047e1 ]]( attractor, self );
    }
    
    if ( isdefined( self.target_attractor_slot ) )
    {
        return self.target_attractor_slot.origin;
    }
    
    return attractor.source.origin;
}

// Namespace zombie_attractor_manager
// Params 0
// Checksum 0xaf24085e, Offset: 0xbfe
// Size: 0x198
function function_f84fb37f6c524103()
{
    assert( isdefined( self.target_attractor ) );
    var_ef5fb942f0eba2b5 = !isdefined( self.var_30203b3e0cbdc098 );
    var_f4586d1566b33464 = !var_ef5fb942f0eba2b5 && self.var_30203b3e0cbdc098.time != gettime();
    calculated_goal = undefined;
    var_8bf9fb43578b26b0 = 0;
    b_goal_changed = 0;
    
    if ( var_f4586d1566b33464 )
    {
        var_8bf9fb43578b26b0 = self.var_30203b3e0cbdc098.attractor != self.target_attractor;
        
        if ( !var_8bf9fb43578b26b0 )
        {
            calculated_goal = function_3803e8d052e47b39( self.target_attractor );
            b_goal_changed = self.var_30203b3e0cbdc098.goal != calculated_goal;
        }
    }
    
    if ( var_ef5fb942f0eba2b5 || var_8bf9fb43578b26b0 || b_goal_changed )
    {
        goal = calculated_goal ?? function_3803e8d052e47b39( self.target_attractor );
        closest_reachable_point = getclosestreachable3dpointonnavmesh( goal, self );
        
        if ( !isdefined( closest_reachable_point ) && self.target_attractor.force_reachable )
        {
            closest_reachable_point = self getclosestreachablepointonnavmesh( goal );
        }
        
        if ( isdefined( closest_reachable_point ) )
        {
            attractor_info = spawnstruct();
            attractor_info.time = gettime();
            attractor_info.attractor = self.target_attractor;
            attractor_info.goal = goal;
            attractor_info.reachable_goal = closest_reachable_point;
            self.var_30203b3e0cbdc098 = attractor_info;
        }
    }
    
    return self.var_30203b3e0cbdc098;
}

// Namespace zombie_attractor_manager
// Params 2
// Checksum 0x54436b57, Offset: 0xd9f
// Size: 0xb5
function set_attractor_slots( attractor_struct, slots_array )
{
    assert( isarray( slots_array ) );
    assert( isstruct( attractor_struct ) );
    
    foreach ( slot in slots_array )
    {
        slot.var_5a25d62d7ccac022 = 0;
    }
    
    attractor_struct.attractor_slots = slots_array;
}

// Namespace zombie_attractor_manager
// Params 2
// Checksum 0x7db68d26, Offset: 0xe5c
// Size: 0x41
function function_4c34b0f066a9d9fe( attractor_struct, attractor_angle )
{
    assert( isdefined( attractor_angle ) );
    assert( attractor_struct.is_attackable );
    attractor_struct.attack_angle_threshold = attractor_angle;
}

// Namespace zombie_attractor_manager
// Params 2
// Checksum 0xf722c08c, Offset: 0xea5
// Size: 0x39
function set_attractor_cooldown_time( attractor_struct, slot_cooldown_ms )
{
    assert( isdefined( attractor_struct ) );
    assert( isdefined( slot_cooldown_ms ) );
    attractor_struct.slot_cooldown_ms = slot_cooldown_ms;
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0x401289, Offset: 0xee6
// Size: 0xc8
function function_c9e40c55fa068d00( attractor_struct )
{
    assert( isdefined( attractor_struct ) );
    ai_list = [];
    
    if ( isdefined( attractor_struct.attractor_slots ) )
    {
        foreach ( slot in attractor_struct.attractor_slots )
        {
            if ( isalive( slot.assigned_ai ) )
            {
                ai_list[ ai_list.size ] = slot.assigned_ai;
            }
        }
    }
    
    return ai_list;
}

// Namespace zombie_attractor_manager
// Params 2
// Checksum 0x24b44979, Offset: 0xfb7
// Size: 0x71
function function_e8b05e26d8b2ede( attractor_struct, scriptmodel )
{
    assert( isdefined( scriptmodel ) );
    assert( attractor_struct.is_attackable );
    assert( scriptmodel.classname == "<dev string:x24>" );
    attractor_struct.var_9aaae8ef943ddb6a = scriptmodel;
    assert( isdefined( scriptmodel physics_getentityaabb() ), "<dev string:x31>" );
}

// Namespace zombie_attractor_manager
// Params 4
// Checksum 0xdbdeb083, Offset: 0x1030
// Size: 0x64
function function_a2aab3762aaa055f( attractor_struct, box_origin, box_half_size, box_angles )
{
    assert( attractor_struct.is_attackable );
    attractor_struct.var_bff6ba3f2de5971e = box_origin;
    attractor_struct.var_3b9e0fec4458d497 = box_half_size;
    attractor_struct.var_b53796b885d2abb4 = box_angles;
}

// Namespace zombie_attractor_manager
// Params 5
// Checksum 0x887cb638, Offset: 0x109c
// Size: 0x1b5
function function_1497469a46932be2( attractor_struct, origin, angles, radius, num_spots )
{
    if ( !isdefined( origin ) )
    {
        assertmsg( "<dev string:x78>" );
        return;
    }
    
    level endon( #"game_ended" );
    slots = [];
    
    for ( spot_i = 0; spot_i < num_spots ; spot_i++ )
    {
        angle_i = math::remap( spot_i, 0, num_spots, 0, 360 );
        x = radius * cos( angle_i + ( angles[ 1 ] ?? 0 ) );
        y = radius * sin( angle_i + ( angles[ 1 ] ?? 0 ) );
        pos = ( x, y, 0 ) + origin;
        capsule_height = 60;
        capsule_radius = 15;
        
        if ( isent( attractor_struct.source ) && !attractor_struct.source aiphysicstracepassed( origin + ( 0, 0, 5 ), pos + ( 0, 0, 5 ), capsule_radius, capsule_height, 1 ) )
        {
            if ( spot_i % 2 == 1 )
            {
                waitframe();
            }
            
            continue;
        }
        
        end_pos = physicstrace( pos + ( 0, 0, 10 ), pos - ( 0, 0, 10 ) );
        pos_on_navmesh = getclosestpointonnavmesh( end_pos );
        slot = spawnstruct();
        slot.origin = pos_on_navmesh;
        slots[ slots.size ] = slot;
    }
    
    set_attractor_slots( attractor_struct, slots );
}

// Namespace zombie_attractor_manager
// Params 8, eflags: 0x4
// Checksum 0xba9e1a36, Offset: 0x1259
// Size: 0x12f
function private function_6d637e25ef974f4b( attractor_struct, priority, range, is_attackable, var_b29803c8278047e1, var_9c041edf3c73110f, force_reachable, var_e359b706d5b60ecf )
{
    attractor_struct.priority = priority ?? 0;
    attractor_struct.range = range ?? -1;
    attractor_struct.is_attackable = is_attackable ?? 0;
    attractor_struct.var_9c041edf3c73110f = var_9c041edf3c73110f ?? 0;
    attractor_struct.force_reachable = force_reachable ?? 0;
    attractor_struct.var_b29803c8278047e1 = var_b29803c8278047e1;
    attractor_struct.var_e359b706d5b60ecf = var_e359b706d5b60ecf;
    attractor_struct.attractor_slots = [];
    attractor_struct.slot_cooldown_ms = 0;
    
    if ( is_attackable )
    {
        function_4c34b0f066a9d9fe( attractor_struct, 45 );
    }
    
    if ( !isdefined( self.active_attractors ) )
    {
        self.active_attractors = [];
    }
    
    if ( !isdefined( self.active_attractors ) )
    {
        self.active_attractors = [];
    }
    
    self.active_attractors[ self.active_attractors.size ] = attractor_struct;
}

// Namespace zombie_attractor_manager
// Params 1, eflags: 0x4
// Checksum 0x51f742c1, Offset: 0x1390
// Size: 0xe3, Type: bool
function private function_78391879e45332b0( ent_or_struct )
{
    b_removed = 0;
    var_a71cd7086763676d = [];
    
    if ( !isdefined( self.active_attractors ) )
    {
        return false;
    }
    
    foreach ( attractor in self.active_attractors )
    {
        if ( attractor == ent_or_struct )
        {
            b_removed = 1;
            continue;
        }
        
        if ( attractor.source == ent_or_struct )
        {
            b_removed = 1;
            continue;
        }
        
        var_a71cd7086763676d[ var_a71cd7086763676d.size ] = attractor;
    }
    
    if ( b_removed )
    {
        self.active_attractors = var_a71cd7086763676d;
        return true;
    }
    
    return false;
}

// Namespace zombie_attractor_manager
// Params 0, eflags: 0x4
// Checksum 0x31a47e6, Offset: 0x147c
// Size: 0x379
function private function_1760643af2232fc2()
{
    level endon( #"game_ended" );
    var_749eefed89a6c447 = 3;
    
    for ( updated_counter = 0; true ; updated_counter = 0 )
    {
        zombie_array = getaispeciesarray( "all", "zombie" );
        
        if ( isdefined( zombie_array ) )
        {
            foreach ( ai in zombie_array )
            {
                if ( isalive( ai ) )
                {
                    found_potential_attractors = ai calculate_target_attractor();
                    
                    if ( isalive( ai ) )
                    {
                        if ( isdefined( ai.target_attractor ) )
                        {
                            goal_info = ai function_f84fb37f6c524103();
                            
                            if ( isalive( ai ) )
                            {
                                if ( !ai._blackboard.zombieattractoristarget )
                                {
                                    ai._blackboard.zombieattractoristarget = 1;
                                    ai function_b1fcfc3cc2092665( 1 );
                                }
                                
                                ai._blackboard.var_b010d8a858880160 = isdefined( goal_info ) ? goal_info.reachable_goal : ai.origin;
                                
                                if ( ai.target_attractor.is_attackable )
                                {
                                    ai._blackboard.var_13e853497403856c = 1;
                                    
                                    if ( ai.target_attractor.var_e359b706d5b60ecf )
                                    {
                                        ai._blackboard.var_aead9ff2aa3beb9f = [[ ai.target_attractor.var_e359b706d5b60ecf ]]( ai.target_attractor, ai );
                                    }
                                    else
                                    {
                                        ai._blackboard.var_aead9ff2aa3beb9f = ai.target_attractor.source.origin;
                                    }
                                    
                                    if ( isdefined( ai.target_attractor.attack_angle_threshold ) )
                                    {
                                        ai._blackboard.var_4e1319950e5ff032 = ai.target_attractor.attack_angle_threshold;
                                    }
                                    
                                    attractor_obb = get_attractor_obb( ai.target_attractor );
                                    
                                    if ( isdefined( attractor_obb ) )
                                    {
                                        attractor_half_height = attractor_obb.origin[ 2 ] - ai.target_attractor.source.origin[ 2 ];
                                        ai._blackboard.var_559361239b8febff = attractor_half_height;
                                    }
                                    else
                                    {
                                        ai._blackboard.var_559361239b8febff = 0;
                                    }
                                }
                                else
                                {
                                    ai._blackboard.var_13e853497403856c = 0;
                                }
                            }
                        }
                        else if ( ai._blackboard.zombieattractoristarget )
                        {
                            ai._blackboard.zombieattractoristarget = 0;
                            ai function_b1fcfc3cc2092665( 0 );
                        }
                    }
                }
                
                if ( found_potential_attractors )
                {
                    updated_counter += 1;
                }
                else
                {
                    updated_counter += 0.1;
                }
                
                if ( updated_counter > var_749eefed89a6c447 )
                {
                    updated_counter = 0;
                    waitframe();
                }
            }
        }
        
        waitframe();
    }
}

// Namespace zombie_attractor_manager
// Params 0, eflags: 0x4
// Checksum 0xee625cd, Offset: 0x17fd
// Size: 0x101
function private function_65e71f6a299ba6c9()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        level cleanup_attractor_array();
        var_c57ab981cf13fdf8 = [];
        b_removed = 0;
        
        foreach ( ent in level.var_f1c750caecfbc463 )
        {
            if ( !isalive( ent ) )
            {
                b_removed = 1;
                continue;
            }
            
            if ( ent cleanup_attractor_array() )
            {
                if ( !isdefined( ent.active_attractors ) || ent.active_attractors.size <= 0 )
                {
                    b_removed = 1;
                    continue;
                }
            }
            
            var_c57ab981cf13fdf8[ var_c57ab981cf13fdf8.size ] = ent;
        }
        
        if ( b_removed )
        {
            level.var_f1c750caecfbc463 = var_c57ab981cf13fdf8;
        }
        
        waitframe();
    }
}

// Namespace zombie_attractor_manager
// Params 0, eflags: 0x4
// Checksum 0xf25750ec, Offset: 0x1906
// Size: 0x1a7
function private cleanup_attractor_array()
{
    b_removed = 0;
    var_a71cd7086763676d = [];
    
    if ( !isdefined( self.active_attractors ) )
    {
        self.active_attractors = [];
    }
    
    foreach ( attractor in self.active_attractors )
    {
        if ( !( isdefined( attractor ) && isdefined( attractor.source ) && isdefined( attractor.source.origin ) ) )
        {
            b_removed = 1;
            continue;
        }
        
        foreach ( slot in attractor.attractor_slots )
        {
            if ( isdefined( slot.assigned_ai ) && !isalive( slot.assigned_ai ) )
            {
                slot.assigned_ai = undefined;
                slot.var_5a25d62d7ccac022 = gettime();
            }
        }
        
        var_a71cd7086763676d[ var_a71cd7086763676d.size ] = attractor;
    }
    
    if ( b_removed )
    {
        self.active_attractors = var_a71cd7086763676d.size <= 0 ? undefined : var_a71cd7086763676d;
    }
    
    return b_removed;
}

// Namespace zombie_attractor_manager
// Params 1, eflags: 0x4
// Checksum 0xa2605182, Offset: 0x1ab6
// Size: 0x1ae
function private on_damage_point( params )
{
    if ( !isdefined( self.target_attractor ) )
    {
        return;
    }
    
    obb = get_attractor_obb( self.target_attractor );
    
    if ( !isdefined( obb ) )
    {
        return;
    }
    
    var_a4ec8f192ced84e2 = math::function_1243a6cc6a030f2a( params.origin, obb.origin, obb.half_size, obb.angles );
    dist_threshold = 32 + ( params.radius ?? 0 );
    
    if ( distancesquared( var_a4ec8f192ced84e2, params.origin ) < squared( dist_threshold ) )
    {
        collision_ent = self.target_attractor.var_9aaae8ef943ddb6a ?? self.target_attractor.source;
        
        if ( !isdefined( collision_ent ) )
        {
            return;
        }
        
        collision_ent notify( #"hit_from_attracted_zombie", params );
        
        if ( collision_ent vehicle::is_vehicle() )
        {
            ref = collision_ent vehicle::get_ref();
            data = vehicle::get_data( ref );
            
            if ( !data.damage.var_64c36f110db1c196 )
            {
                return;
            }
        }
        
        if ( isent( collision_ent ) )
        {
            collision_ent dodamage( params.damage, params.origin, self, self, params.meansofdeath );
            return;
        }
        
        if ( collision_ent isscriptableinstance() )
        {
            collision_ent scriptabledodamage( params.damage, self, self, params.origin, undefined, params.meansofdeath );
        }
    }
}

// Namespace zombie_attractor_manager
// Params 11, eflags: 0x4
// Checksum 0x9fb5821c, Offset: 0x1c6c
// Size: 0x13e
function private function_baa87485292b417( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, vpoint, modelindex, partname )
{
    assert( isdefined( instance ), "<dev string:xad>" );
    
    if ( !isdefined( instance ) || !instance.attractor )
    {
        return;
    }
    
    if ( !isai( eattacker ) && instance.attractor )
    {
        return;
    }
    
    dmg_struct = { #partname:partname, #modelindex:modelindex, #vpoint:vpoint, #vdir:vdir, #objweapon:objweapon, #smeansofdeath:smeansofdeath, #idflags:idflags, #idamage:idamage, #instance:instance, #eattacker:eattacker, #einflictor:einflictor };
    instance callback::callback( "on_attractor_damaged", dmg_struct );
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0xea2efdbd, Offset: 0x1db2
// Size: 0x1b0
function get_attractor_obb( attractor_struct )
{
    if ( isdefined( attractor_struct.var_bff6ba3f2de5971e ) && isdefined( attractor_struct.var_3b9e0fec4458d497 ) && isdefined( attractor_struct.var_b53796b885d2abb4 ) )
    {
        obb = spawnstruct();
        obb.origin = attractor_struct.var_bff6ba3f2de5971e;
        obb.half_size = attractor_struct.var_3b9e0fec4458d497;
        obb.angles = attractor_struct.var_b53796b885d2abb4;
        return obb;
    }
    
    collision_ent = attractor_struct.var_9aaae8ef943ddb6a ?? attractor_struct.source;
    
    if ( !isent( collision_ent ) )
    {
        return;
    }
    
    if ( isplayer( collision_ent ) )
    {
        return;
    }
    
    if ( collision_ent.classname != "script_model" && collision_ent.classname != "script_brushmodel" && collision_ent.classname != "script_vehicle" && collision_ent.classname != "scriptable" )
    {
        return;
    }
    
    aabb = collision_ent physics_getentityaabb();
    
    if ( !isdefined( aabb ) )
    {
        return;
    }
    
    mid_point = vectorlerp( aabb[ "min" ], aabb[ "max" ], 0.5 );
    bounds = ( aabb[ "max" ] - aabb[ "min" ] ) * 0.5;
    obb = spawnstruct();
    obb.origin = mid_point;
    obb.half_size = bounds;
    obb.angles = collision_ent.angles;
    return obb;
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0xf6db2909, Offset: 0x1f6b
// Size: 0x58
function function_e3743c2577dbec4a( params )
{
    log_array = function_c9d17cad763ffcf1();
    iprintlnbold( "Printing Attractor Debug to Logs (" + log_array.size + " lines)" );
    line_i = 0;
    
    while ( line_i < log_array.size )
    {
        logstring( log_array[ line_i ] );
        line_i += 1;
    }
}

// Namespace zombie_attractor_manager
// Params 0
// Checksum 0x6fc27527, Offset: 0x1fcb
// Size: 0x220
function function_c9d17cad763ffcf1()
{
    str_array = [];
    str_array[ str_array.size ] = "Debugging AI with Local Attractors - Num of AI: " + level.var_f1c750caecfbc463.size;
    
    foreach ( ent in level.var_f1c750caecfbc463 )
    {
        str_array = arraycombine( str_array, function_f3e2263f329cde34( ent ) );
    }
    
    all_ai = getaiarray();
    var_e984c5ba27e3e371 = [];
    
    foreach ( ai in all_ai )
    {
        if ( !arraycontains( level.var_f1c750caecfbc463, ai ) )
        {
            var_e984c5ba27e3e371[ var_e984c5ba27e3e371.size ] = ai;
        }
    }
    
    str_array[ str_array.size ] = "Debugging AI without Local Attractors - Num of AI: " + var_e984c5ba27e3e371.size;
    
    foreach ( ent in var_e984c5ba27e3e371 )
    {
        str_array = arraycombine( str_array, function_f3e2263f329cde34( ent ) );
    }
    
    str_array[ str_array.size ] = "Debugging All Global Attractors - Total Global Attractors: " + level.active_attractors.size;
    attractor_i = 0;
    
    while ( attractor_i < level.active_attractors.size )
    {
        str_array = arraycombine( str_array, function_cad31afe3bcef28a( level.active_attractors[ attractor_i ], "[Global Attractor #" + attractor_i + "]" ) );
        attractor_i += 1;
    }
    
    return str_array;
}

// Namespace zombie_attractor_manager
// Params 1
// Checksum 0x1bbae2bf, Offset: 0x21f4
// Size: 0x100
function function_f3e2263f329cde34( ai )
{
    str_array = [];
    str_array[ str_array.size ] = "AI EntNum(" + ai getentitynumber() + ") - Attractor Exists: " + ( ai.target_attractor ? "YES" : "NO" ) + " - Enemy Exists: " + ( ai.enemy ? "YES" : "NO" ) + " - Subclass: " + ai.subclass;
    
    if ( ai.target_attractor )
    {
        str_array = arraycombine( str_array, function_cad31afe3bcef28a( ai.target_attractor, "\t[Target Attractor] " ) );
    }
    
    attractor_i = 0;
    
    while ( attractor_i < ai.active_attractors.size )
    {
        str_array = arraycombine( str_array, function_cad31afe3bcef28a( ai.active_attractors[ attractor_i ], "\t[Active Attractor #" + attractor_i + "] " ) );
        attractor_i += 1;
    }
    
    return str_array;
}

// Namespace zombie_attractor_manager
// Params 2, eflags: 0x4
// Checksum 0x3dfa10ee, Offset: 0x22fd
// Size: 0x12f
function private function_cad31afe3bcef28a( attractor_struct, str_prefix )
{
    str_array = [];
    str_array[ str_array.size ] = str_prefix + "Source Type: " + ( isstruct( attractor_struct.source ) ? "STRUCT" : "ENT" ) + " - Origin: " + attractor_struct.source.origin + " - Angles: " + attractor_struct.source.angles;
    str_array[ str_array.size ] = str_prefix + "Range: " + attractor_struct.range + " - Priority: " + attractor_struct.priority + " - Is Attackable: " + attractor_struct.attackable + " - Num Slots: " + attractor_struct.attractor_slots.size;
    
    if ( isent( attractor_struct.source ) )
    {
        str_array[ str_array.size ] = str_prefix + "Source Ent Num: " + attractor_struct.source getentitynumber() + " - Source Ent Classname: " + ( attractor_struct.source.classname ?? "unknown" );
    }
    
    return str_array;
}

/#

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x7bea7646, Offset: 0x2435
    // Size: 0xd0, Type: dev
    function private debug_attractors()
    {
        devgui::function_9082edeb5db93280( "<dev string:xe4>" );
        devgui::add_devgui_func( "<dev string:xf6>", "<dev string:x115>", &function_1855c9bd82861914 );
        devgui::add_devgui_func( "<dev string:x134>", "<dev string:x150>", &function_a811e7a72410a9a9 );
        devgui::add_devgui_func( "<dev string:x163>", "<dev string:x18b>", &function_e99d2acecf8efa90 );
        devgui::add_devgui_func( "<dev string:x1a9>", "<dev string:x1cd>", &function_ab9c07e1fb6e9470 );
        devgui::add_devgui_func( "<dev string:x1ef>", "<dev string:x216>", &function_946ebddec9848893 );
        devgui::add_devgui_func( "<dev string:x23b>", "<dev string:x260>", &function_72bdb79a463bf5f8 );
        devgui::add_devgui_func( "<dev string:x280>", "<dev string:x29c>", &function_fb307fecfaf4f3cb );
        devgui::add_devgui_func( "<dev string:x2b8>", "<dev string:x2d6>", &function_e3743c2577dbec4a );
        devgui::function_77df7fe7dd273e10();
        level thread debug_draw_attractors();
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x9cc58dad, Offset: 0x250d
    // Size: 0x6d, Type: dev
    function private function_a811e7a72410a9a9()
    {
        pos = devgui::function_97024c0a6d1256a6();
        struct = spawnstruct();
        struct.origin = pos;
        
        if ( !isdefined( level.test_attractors ) )
        {
            level.test_attractors = [];
        }
        
        level.test_attractors[ level.test_attractors.size ] = struct;
        add_attractor( struct, undefined, 500 );
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x39af457f, Offset: 0x2582
    // Size: 0x4c, Type: dev
    function private function_e99d2acecf8efa90()
    {
        if ( isdefined( level.test_attractors ) )
        {
            sorted = utility::get_array_of_closest( level.players[ 0 ].origin, level.test_attractors );
            remove_attractor( sorted[ 0 ] );
        }
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0xa5b7e3ea, Offset: 0x25d6
    // Size: 0xaf, Type: dev
    function private function_ab9c07e1fb6e9470()
    {
        pos = devgui::function_97024c0a6d1256a6();
        zombies = getaispeciesarray( "<dev string:x2ec>", "<dev string:x2f1>" );
        closest_zombie = utility::get_array_of_closest( level.players[ 0 ].origin, zombies )[ 0 ];
        struct = spawnstruct();
        struct.origin = pos;
        
        if ( !isdefined( level.test_attractors_closest_zombie ) )
        {
            level.test_attractors_closest_zombie = [];
        }
        
        level.test_attractors_closest_zombie[ level.test_attractors_closest_zombie.size ] = struct;
        closest_zombie function_7eb1aaa8bc7cc15( struct, undefined, 400 );
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0xa4d5660c, Offset: 0x268d
    // Size: 0xd6, Type: dev
    function private function_946ebddec9848893()
    {
        zombies = getaispeciesarray( "<dev string:x2ec>", "<dev string:x2f1>" );
        closest_zombie = utility::get_array_of_closest( level.players[ 0 ].origin, zombies )[ 0 ];
        
        if ( !isdefined( level.test_attractors_closest_zombie ) )
        {
            level.test_attractors_closest_zombie = [];
        }
        
        foreach ( struct in level.test_attractors_closest_zombie )
        {
            closest_zombie function_dcfb4c31f1d97cd2( struct );
        }
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x3e807b80, Offset: 0x276b
    // Size: 0x6a, Type: dev
    function private function_72bdb79a463bf5f8()
    {
        if ( !isdefined( level.var_edc1d0d87f8b0df5 ) )
        {
            level.var_edc1d0d87f8b0df5 = 0;
        }
        
        if ( !level.var_edc1d0d87f8b0df5 )
        {
            level.var_edc1d0d87f8b0df5 = 1;
            add_attractor( level.players[ 0 ], undefined, 500, 1 );
            return;
        }
        
        level.var_edc1d0d87f8b0df5 = 0;
        remove_attractor( level.players[ 0 ] );
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x2d101076, Offset: 0x27dd
    // Size: 0xb8, Type: dev
    function private function_fb307fecfaf4f3cb()
    {
        pos = devgui::function_97024c0a6d1256a6();
        pos -= ( 0, 0, 4 );
        table = spawn( "<dev string:x24>", pos );
        table setmodel( "<dev string:x2f5>" );
        table.health = 100;
        table disconnectpaths();
        table setcandamage( 1 );
        attractor = add_attractor( table, 10, 400, 1 );
        function_1497469a46932be2( attractor, attractor.source.origin, attractor.source.angles, 50, 5 );
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x8e389d78, Offset: 0x289d
    // Size: 0x2b, Type: dev
    function private function_1855c9bd82861914()
    {
        setdvar( @"debug_attractors", getdvarint( @"debug_attractors" ) > 0 ? 0 : 1 );
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0x48630f0a, Offset: 0x28d0
    // Size: 0xc9, Type: dev
    function private debug_draw_attractors()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            waitframe();
            
            if ( !isdefined( level.active_attractors ) )
            {
                continue;
            }
            
            if ( getdvarint( @"debug_attractors", 0 ) <= 0 )
            {
                continue;
            }
            
            level function_d1fd914110a1357c();
            ai_array = getaiarray();
            
            foreach ( ai in ai_array )
            {
                ai function_d1fd914110a1357c();
            }
        }
    }

    // Namespace zombie_attractor_manager
    // Params 0, eflags: 0x4
    // Checksum 0xddc8c5c1, Offset: 0x29a1
    // Size: 0xb6, Type: dev
    function private function_d1fd914110a1357c()
    {
        if ( !isdefined( self.active_attractors ) || self.active_attractors.size <= 0 )
        {
            return;
        }
        
        foreach ( attractor in self.active_attractors )
        {
            if ( !( isdefined( attractor ) && isdefined( attractor.source ) ) )
            {
                continue;
            }
            
            function_d84b9fe9d6db67be( attractor );
        }
    }

    // Namespace zombie_attractor_manager
    // Params 1, eflags: 0x4
    // Checksum 0x36d7488, Offset: 0x2a5f
    // Size: 0x2e8, Type: dev
    function private function_d84b9fe9d6db67be( attractor )
    {
        color = self == level ? ( 1, 0, 0 ) : ( 0, 0, 1 );
        utility::draw_circle( attractor.source.origin, 15, ( 1, 0, 0 ), 1, 1, 1 );
        range_text = attractor.range > 0 ? "<dev string:x305>" + attractor.range : "<dev string:x310>";
        collision_ent = attractor.var_9aaae8ef943ddb6a ?? attractor.source;
        health_text = isdefined( collision_ent.health ) ? "<dev string:x311>" + string( collision_ent.health ?? 0 ) : "<dev string:x310>";
        print3d( attractor.source.origin + ( 0, 0, 32 ), "<dev string:x31a>" + string( attractor.priority ) + range_text, color );
        
        if ( attractor.is_attackable )
        {
            print3d( attractor.source.origin + ( 0, 0, 24 ), "<dev string:x329>" + health_text, color );
            function_b2e2cd02cda76ae5( attractor );
        }
        
        sphere( attractor.source.origin, 15, color );
        
        if ( attractor.range > 0 )
        {
            utility::draw_circle( attractor.source.origin, attractor.range, color );
        }
        
        foreach ( slot in attractor.attractor_slots )
        {
            b_is_open = !isalive( slot.assigned_ai );
            b_is_on_cooldown = gettime() < slot.var_5a25d62d7ccac022 + attractor.slot_cooldown_ms;
            slot_color = b_is_open ? b_is_on_cooldown ? ( 1, 0.5, 0.5 ) : ( 0, 1, 0 ) : ( 1, 0, 0 );
            utility::draw_circle( slot.origin, 5, slot_color );
        }
    }

    // Namespace zombie_attractor_manager
    // Params 1, eflags: 0x4
    // Checksum 0x1cb609cf, Offset: 0x2d4f
    // Size: 0x20b, Type: dev
    function private function_b2e2cd02cda76ae5( attractor )
    {
        obb = get_attractor_obb( attractor );
        
        if ( !isdefined( obb ) )
        {
            return;
        }
        
        var_b997226e65e9c8a1[ 0 ] = obb.origin + obb.half_size;
        var_b997226e65e9c8a1[ 1 ] = obb.origin + obb.half_size * ( 1, 1, -1 );
        var_b997226e65e9c8a1[ 2 ] = obb.origin + obb.half_size * ( -1, 1, -1 );
        var_b997226e65e9c8a1[ 3 ] = obb.origin + obb.half_size * ( -1, 1, 1 );
        var_b9971f6e65e9c208[ 0 ] = obb.origin + obb.half_size * ( 1, -1, 1 );
        var_b9971f6e65e9c208[ 1 ] = obb.origin + obb.half_size * ( 1, -1, -1 );
        var_b9971f6e65e9c208[ 2 ] = obb.origin + obb.half_size * ( -1, -1, -1 );
        var_b9971f6e65e9c208[ 3 ] = obb.origin + obb.half_size * ( -1, -1, 1 );
        
        for ( i = 0; i < 4 ; i++ )
        {
            j = i + 1;
            
            if ( j == 4 )
            {
                j = 0;
            }
            
            line( var_b997226e65e9c8a1[ i ], var_b997226e65e9c8a1[ j ], ( 1, 0, 0 ), 1, 0, 1 );
            line( var_b9971f6e65e9c208[ i ], var_b9971f6e65e9c208[ j ], ( 1, 0, 0 ), 1, 0, 1 );
            line( var_b997226e65e9c8a1[ i ], var_b9971f6e65e9c208[ i ], ( 1, 0, 0 ), 1, 0, 1 );
        }
    }

#/
