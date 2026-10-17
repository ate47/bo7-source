#using script_16ea1b94f0f381b3;
#using script_1a6a1f7bdb57d7ff;
#using script_4bc38131d8ecd20b;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\status_effects\status_effects;
#using scripts\common\throttle;
#using scripts\common\utility;

#namespace zombie_utils;

// Namespace zombie_utils
// Params 0, eflags: 0x1
// Checksum 0xd3317dd3, Offset: 0x13b
// Size: 0x110
function autoexec init()
{
    utility::registersharedfunc( #"zombie_utils", #"setmovespeed", &function_a8ce00e0448cb6f0 );
    utility::registersharedfunc( #"zombie_utils", #"settarget", &set_ai_target_priority );
    utility::registersharedfunc( #"zombie_utils", #"registerdamagecallback", &function_dfae6a5bd222c586 );
    utility::registersharedfunc( #"zombie_utils", #"turn_ai", &turn_ai );
    utility::registersharedfunc( #"zombie_utils", #"turn_ai_back", &turn_ai_back );
    utility::registersharedfunc( #"zombie_utils", #"hash_ed46e37d3efd53d3", &function_bf1464d09f4e4b40 );
    utility::registersharedfunc( #"zombie_utils", #"removedamagecallback", &function_10c0c35c21e3ed9d );
    utility::registersharedfunc( #"zombie_utils", #"hash_26ee8b7489552ac7", &set_zombie_round_difficulty );
    utility::registersharedfunc( #"zombie_utils", #"get_zombie_round_difficulty", &get_zombie_round_difficulty );
}

// Namespace zombie_utils
// Params 3
// Checksum 0xf5c12bfb, Offset: 0x253
// Size: 0x300
function function_a8ce00e0448cb6f0( move_speed_value, id, priority )
{
    assert( utility::ent_flag( "<dev string:x24>" ), "<dev string:x35>" );
    
    if ( !isdefined( id ) )
    {
        id = "default";
    }
    
    if ( !isdefined( priority ) )
    {
        priority = 0;
    }
    
    if ( !isdefined( priority ) )
    {
        priority = 0;
    }
    
    if ( !isdefined( self.var_3e434da475d20265 ) )
    {
        self.var_3e434da475d20265 = [];
    }
    
    if ( isdefined( move_speed_value ) )
    {
        target_speed = getanimspeedthreshold( self, move_speed_value );
        
        if ( !isdefined( target_speed ) )
        {
            return;
        }
    }
    
    move_speed_struct = spawnstruct();
    move_speed_struct.id = id;
    move_speed_struct.move_speed_value = move_speed_value;
    move_speed_struct.priority = priority;
    
    for ( i = 0; i < self.var_3e434da475d20265.size ; i++ )
    {
        current = self.var_3e434da475d20265[ i ];
        
        if ( isdefined( current ) && current.id == id )
        {
            self.var_3e434da475d20265[ i ] = undefined;
            
            if ( isint( i ) )
            {
                function_cdc669dbc8ea2101( self.var_3e434da475d20265 );
            }
            
            break;
        }
    }
    
    b_added = 0;
    
    if ( isdefined( move_speed_value ) )
    {
        for ( i = 0; i < self.var_3e434da475d20265.size ; i++ )
        {
            current = self.var_3e434da475d20265[ i ];
            
            if ( !isdefined( current ) || current.priority < priority )
            {
                continue;
            }
            
            if ( current.priority == priority )
            {
                assertmsg( "<dev string:x7a>" + current.id + "<dev string:xb0>" + id + "<dev string:xbf>" );
                arrayinsert( self.var_3e434da475d20265, move_speed_struct, i + 1 );
                b_added = 1;
            }
            else if ( current.priority > priority )
            {
                arrayinsert( self.var_3e434da475d20265, move_speed_struct, i );
                b_added = 1;
            }
            
            break;
        }
        
        if ( !b_added )
        {
            b_added = 1;
            self.var_3e434da475d20265[ self.var_3e434da475d20265.size ] = move_speed_struct;
        }
    }
    
    if ( isarray( self.var_3e434da475d20265 ) && isstruct( self.var_3e434da475d20265[ self.var_3e434da475d20265.size - 1 ] ) )
    {
        new_move_speed = self.var_3e434da475d20265[ self.var_3e434da475d20265.size - 1 ].move_speed_value;
        
        if ( !asm_bb::bb_movetyperequested( new_move_speed ) )
        {
            asm_bb::bb_requestmovetype( new_move_speed );
            target_speed = getanimspeedthreshold( self, new_move_speed );
            
            if ( isdefined( target_speed ) )
            {
                self aisetdesiredspeed( target_speed );
                self aisettargetspeed( target_speed );
                priority = self.var_3e434da475d20265[ self.var_3e434da475d20265.size - 1 ].priority;
                callback::callback( "on_move_speed_changed", { #priority:priority, #move_speed:new_move_speed } );
            }
        }
    }
}

// Namespace zombie_utils
// Params 1
// Checksum 0xf24ab6ed, Offset: 0x55b
// Size: 0x6d, Type: bool
function function_5585d9e5cf0a0fa0( id )
{
    if ( self.var_3e434da475d20265 )
    {
        for ( i = 0; i < self.var_3e434da475d20265.size ; i++ )
        {
            current = self.var_3e434da475d20265[ i ];
            
            if ( isdefined( current ) && current.id == id )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace zombie_utils
// Params 2
// Checksum 0x115decfd, Offset: 0x5d1
// Size: 0x85, Type: bool
function function_acea107db537cb0f( target_ent, priority )
{
    if ( isdefined( target_ent ) )
    {
        for ( i = 0; i < self.var_114c3198056d5fa9.size ; i++ )
        {
            current = self.var_114c3198056d5fa9[ i ];
            
            if ( !isdefined( current ) || current.priority < priority )
            {
                continue;
            }
            
            if ( current.priority == priority )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace zombie_utils
// Params 3
// Checksum 0x3419ab39, Offset: 0x65f
// Size: 0x2c9
function set_ai_target_priority( target_ent, id = "default", priority = 0 )
{
    if ( !isdefined( self.var_114c3198056d5fa9 ) )
    {
        self.var_114c3198056d5fa9 = [];
    }
    
    target_struct = spawnstruct();
    target_struct.id = id;
    target_struct.target_ent = target_ent;
    target_struct.priority = priority;
    
    for ( i = 0; i < self.var_114c3198056d5fa9.size ; i++ )
    {
        current = self.var_114c3198056d5fa9[ i ];
        
        if ( !isalive( current.target_ent ) || isdefined( current ) && current.id == id )
        {
            self.var_114c3198056d5fa9[ i ] = undefined;
            
            if ( isint( i ) )
            {
                function_cdc669dbc8ea2101( self.var_114c3198056d5fa9 );
            }
            
            break;
        }
    }
    
    b_added = 0;
    
    if ( isdefined( target_ent ) )
    {
        for ( i = 0; i < self.var_114c3198056d5fa9.size ; i++ )
        {
            current = self.var_114c3198056d5fa9[ i ];
            
            if ( !isdefined( current ) || current.priority < priority )
            {
                continue;
            }
            
            if ( current.priority == priority )
            {
                assertmsg( "<dev string:xf2>" + current.id + "<dev string:xb0>" + id + "<dev string:xbf>" );
                arrayinsert( self.var_114c3198056d5fa9, target_struct, i + 1 );
                b_added = 1;
            }
            else if ( current.priority > priority )
            {
                arrayinsert( self.var_114c3198056d5fa9, target_struct, i );
                b_added = 1;
            }
            
            break;
        }
        
        if ( !b_added )
        {
            b_added = 1;
            self.var_114c3198056d5fa9[ self.var_114c3198056d5fa9.size ] = target_struct;
        }
    }
    
    if ( self.var_114c3198056d5fa9.size > 0 && isstruct( self.var_114c3198056d5fa9[ self.var_114c3198056d5fa9.size - 1 ] ) )
    {
        new_target = self.var_114c3198056d5fa9[ self.var_114c3198056d5fa9.size - 1 ].target_ent;
        
        if ( !isdefined( self.favoriteenemy ) && isdefined( new_target ) || isdefined( self.favoriteenemy ) && !isdefined( new_target ) || self.favoriteenemy != new_target )
        {
            self.favoriteenemy = new_target;
        }
        
        return;
    }
    
    if ( self.var_114c3198056d5fa9.size == 0 && self.favoriteenemy )
    {
        self.favoriteenemy = undefined;
    }
}

// Namespace zombie_utils
// Params 1
// Checksum 0x1a947db3, Offset: 0x930
// Size: 0x39
function function_dfae6a5bd222c586( func )
{
    if ( !isdefined( self.var_f3f3b4d926db02c7 ) )
    {
        self.var_f3f3b4d926db02c7 = [];
    }
    
    self.var_f3f3b4d926db02c7[ self.var_f3f3b4d926db02c7.size ] = func;
}

// Namespace zombie_utils
// Params 1
// Checksum 0xf59e0089, Offset: 0x971
// Size: 0x36
function function_10c0c35c21e3ed9d( func )
{
    if ( !isarray( self.var_f3f3b4d926db02c7 ) )
    {
        return;
    }
    
    self.var_f3f3b4d926db02c7 = arrayremove( self.var_f3f3b4d926db02c7, func );
}

// Namespace zombie_utils
// Params 2
// Checksum 0xd97f0b2b, Offset: 0x9af
// Size: 0x39
function function_b021918a41e1df51( weapon_name, func )
{
    if ( !isdefined( self.var_ad4a0c0e90a75e96 ) )
    {
        self.var_ad4a0c0e90a75e96 = [];
    }
    
    self.var_ad4a0c0e90a75e96[ weapon_name ] = func;
}

// Namespace zombie_utils
// Params 1
// Checksum 0xef283c2a, Offset: 0x9f0
// Size: 0x2a
function function_f856633da44fa83c( weapon_name )
{
    if ( !isarray( self.var_ad4a0c0e90a75e96 ) )
    {
        return;
    }
    
    self.var_ad4a0c0e90a75e96[ weapon_name ] = undefined;
}

// Namespace zombie_utils
// Params 0
// Checksum 0x8c047fad, Offset: 0xa22
// Size: 0x34
function get_zombie_round_difficulty()
{
    assert( isdefined( self._blackboard.difficultyround ) );
    return self._blackboard.difficultyround;
}

// Namespace zombie_utils
// Params 3
// Checksum 0xb76bab5, Offset: 0xa5f
// Size: 0xcd
function set_zombie_round_difficulty( round_number, update_health = 1, var_a14bf1d749c136ce = 1 )
{
    assert( isdefined( self._blackboard.difficultyround ) );
    self._blackboard.difficultyround = round_number;
    
    if ( update_health )
    {
        new_health = namespace_9d8e359c3b1041e5::function_bb9b98eb7368a15a( self.zombieaisettings.healthscriptbundle, round_number );
        ai::set_ai_max_health( new_health );
        self.health = self.maxhealth;
    }
    
    if ( var_a14bf1d749c136ce )
    {
        if ( isdefined( level.var_148e14aa588539af ) )
        {
            [[ level.var_148e14aa588539af ]]( self, round_number );
        }
    }
}

// Namespace zombie_utils
// Params 2
// Checksum 0x6ba83e5e, Offset: 0xb34
// Size: 0x10c
function function_580e82d21a732187( ent, unbounded = 0 )
{
    assert( isdefined( ent ) );
    
    if ( !isdefined( self.var_67de6c7cbecd5d28 ) )
    {
        self.var_67de6c7cbecd5d28 = [];
    }
    
    var_ef5fb942f0eba2b5 = !isdefined( self.var_67de6c7cbecd5d28[ ent getentitynumber() ] );
    var_f4586d1566b33464 = !var_ef5fb942f0eba2b5 && self.var_67de6c7cbecd5d28[ ent getentitynumber() ].time != gettime();
    
    if ( var_ef5fb942f0eba2b5 || var_f4586d1566b33464 )
    {
        reachable_info = spawnstruct();
        reachable_info.time = gettime();
        reachable_info.origin = self getclosestreachablepointonnavmesh( ent.origin, unbounded );
        self.var_67de6c7cbecd5d28[ ent getentitynumber() ] = reachable_info;
    }
    
    var_e16d7c2a575fc93f = self.var_67de6c7cbecd5d28[ ent getentitynumber() ].origin;
    return var_e16d7c2a575fc93f;
}

// Namespace zombie_utils
// Params 2
// Checksum 0xb7bb9823, Offset: 0xc49
// Size: 0xe4
function update_bt_goal( pos, priority )
{
    assert( isdefined( pos ) );
    
    if ( !isdefined( priority ) )
    {
        priority = 0;
    }
    
    if ( isdefined( level.var_d0bbf6f7bd75504e ) && isdefined( level.get_zone_distance ) )
    {
        zone_cost = [[ level.get_zone_distance ]]( self.origin, pos );
        path = undefined;
        
        if ( zone_cost > 2 )
        {
            path = [[ level.var_d0bbf6f7bd75504e ]]( self.origin, pos );
        }
        
        if ( isarray( path ) && path.size > 2 )
        {
            /#
                self.last_goal_reason = "<dev string:x120>";
            #/
            
            self setbtgoalpos( priority, path[ 1 ].origin );
            return;
        }
    }
    
    /#
        self.last_goal_reason = "<dev string:x12a>";
    #/
    
    self setbtgoalpos( priority, pos );
}

// Namespace zombie_utils
// Params 2
// Checksum 0xd8e37d53, Offset: 0xd35
// Size: 0x39
function function_7ae8d980fd719e78( id, value )
{
    if ( !isdefined( self.bt_params ) )
    {
        self.bt_params = [];
    }
    
    self.bt_params[ id ] = value;
}

// Namespace zombie_utils
// Params 1
// Checksum 0xd6ff662e, Offset: 0xd76
// Size: 0x30
function function_b292d64a276f14cc( id )
{
    assert( isdefined( self.bt_params[ id ] ) );
    return self.bt_params[ id ];
}

// Namespace zombie_utils
// Params 0
// Checksum 0xd416bba5, Offset: 0xdaf
// Size: 0xd
function is_turned()
{
    return utility::ent_flag( "turned" );
}

// Namespace zombie_utils
// Params 0
// Checksum 0xc0ac5304, Offset: 0xdc5
// Size: 0xd
function is_brainrotted()
{
    return status_effects::function_98e705c3c729bbbc( "charm" );
}

// Namespace zombie_utils
// Params 0
// Checksum 0xde9cc3e7, Offset: 0xddb
// Size: 0x12, Type: bool
function function_bf1464d09f4e4b40()
{
    return is_turned() || is_brainrotted();
}

// Namespace zombie_utils
// Params 2
// Checksum 0x1bf6ed60, Offset: 0xdf6
// Size: 0x99
function turn_ai( attacker, scriptable_payload )
{
    if ( is_turned() )
    {
        return;
    }
    
    utility::ent_flag_set( "turned" );
    callback::callback( "on_turned", { #scriptable_payload:scriptable_payload, #attacker:attacker } );
    self.health = self.maxhealth;
    self.allowpain = 0;
    
    if ( isdefined( attacker ) && isdefined( attacker.team ) )
    {
        self.team = attacker.team;
    }
    
    self clearpath();
}

// Namespace zombie_utils
// Params 3
// Checksum 0x276cccc6, Offset: 0xe97
// Size: 0x91
function turn_ai_back( originalteam, scriptablepart, scriptablestate )
{
    if ( !is_turned() || !originalteam )
    {
        return;
    }
    
    utility::ent_flag_clear( "turned" );
    params = spawnstruct();
    callback::callback( "on_brainrot_end", params );
    self.health = self.maxhealth;
    self.allowpain = 1;
    
    if ( scriptablepart )
    {
        utility::function_32b24db3127bff40( scriptablepart, scriptablestate );
    }
    
    self.team = originalteam;
}

// Namespace zombie_utils
// Params 4
// Checksum 0x1ef92626, Offset: 0xf30
// Size: 0x72
function brainrot_ai( attacker, time_override, skip_augments, force )
{
    if ( is_brainrotted() )
    {
        return;
    }
    
    if ( utility::issharedfuncdefined( #"zombie", #"brainrot_zombie" ) )
    {
        utility::callsharedfunc( #"zombie", #"brainrot_zombie", 0, attacker, undefined, undefined, undefined, undefined, undefined, 0, time_override, skip_augments, force );
    }
}

// Namespace zombie_utils
// Params 5
// Checksum 0xc1e27d94, Offset: 0xfaa
// Size: 0x42
function get_closest_zombie( origin, team, zombie_subclass, max_dist, filter )
{
    return ai::get_ai_closest( origin, team, "zombie", zombie_subclass, max_dist, filter );
}

// Namespace zombie_utils
// Params 1
// Checksum 0xdfa1fba7, Offset: 0xff5
// Size: 0x66
function function_a225e7aa4a243fb2( aitypescriptbundle )
{
    assert( isdefined( aitypescriptbundle ) );
    zombieaisettingsbundle = getscriptbundle( "zombieaisettings:" + aitypescriptbundle.zombieaisetting );
    
    if ( isdefined( zombieaisettingsbundle.var_394d3c5e6fa40c50 ) )
    {
        var_d3de1a9faac42deb = getscriptbundle( zombieaisettingsbundle.var_394d3c5e6fa40c50 );
        return var_d3de1a9faac42deb;
    }
}

// Namespace zombie_utils
// Params 1
// Checksum 0xb7480666, Offset: 0x1064
// Size: 0x7b
function function_4e99fb1239980783( params )
{
    if ( isdefined( params.body ) )
    {
        return params.body;
    }
    
    if ( isdefined( params.bodyentnum ) )
    {
        body = getentbynum( params.bodyentnum );
        
        if ( isactorcorpse( body ) && body.classname == params.origclassname )
        {
            return body;
        }
    }
}

// Namespace zombie_utils
// Params 5
// Checksum 0xe51d57d, Offset: 0x10e7
// Size: 0x208
function function_607ff821e430d594( origin, knockdownradius = 128, stunduration = 1.75, team = "allies", var_b92e88d28029b2ed = 0 )
{
    if ( !isdefined( origin ) )
    {
        return;
    }
    
    if ( !isdefined( level.zombie_util_knockdown_throttle ) )
    {
        level.zombie_util_knockdown_throttle = throttle::throttle_initialize( "zombie_util_knockdown", 3, level.framedurationseconds );
    }
    
    nearby_zombies = getaiarrayinradius( origin, knockdownradius );
    
    if ( isplayer( self ) )
    {
        if ( utility::issharedfuncdefined( #"zm", #"hash_275603844e04e7ac" ) )
        {
            nearby_zombies = level [[ utility::getsharedfunc( #"zm", #"hash_275603844e04e7ac" ) ]]( nearby_zombies, self );
        }
    }
    
    foreach ( zombie in nearby_zombies )
    {
        if ( zombie.team == team )
        {
            continue;
        }
        
        if ( !isalive( zombie ) )
        {
            continue;
        }
        
        if ( isdefined( zombie.aicategory ) )
        {
            if ( zombie.aicategory == "normal" )
            {
                if ( zombie zombie_knockdown::function_2eb6752428726543() )
                {
                    zombie zombie_knockdown::knockdown_ai( origin );
                }
                else
                {
                    zombie zombie_stun::stun_ai( stunduration );
                }
            }
            else if ( var_b92e88d28029b2ed )
            {
                zombie zombie_stun::stun_ai( stunduration );
            }
        }
        else if ( zombie.unittype == "human" )
        {
            zombie notify( #"flashbang", zombie.origin, 1, 1, undefined, team );
        }
        
        throttle::throttle_wait_in_queue( level.zombie_util_knockdown_throttle, self );
    }
}

// Namespace zombie_utils
// Params 1
// Checksum 0xf64817e2, Offset: 0x12f7
// Size: 0xbc, Type: bool
function function_46ea1b3f9d0c30e9( leavecorpse = 0 )
{
    if ( !isdefined( self.asmname ) || !self asmhasstate( self.asmname, "despawn_in" ) )
    {
        return false;
    }
    
    aliases = archetypegetaliases( self.animsetname, "despawn" );
    
    if ( !isdefined( aliases ) || aliases.size == 0 )
    {
        return false;
    }
    
    if ( self.disallow_despawn )
    {
        return false;
    }
    
    if ( !self._blackboard.zombieindespawn )
    {
        self notify( #"despawn" );
        
        if ( !leavecorpse )
        {
            self.var_b1d9042e7d29abb8 = 1;
        }
        
        asm::asm_setstate( "despawn_in" );
    }
    
    return true;
}

// Namespace zombie_utils
// Params 2
// Checksum 0xedaef0d, Offset: 0x13bc
// Size: 0x11f
function register_health_state_callback( health_pct, callback )
{
    if ( !( isdefined( health_pct ) && isdefined( callback ) ) )
    {
        return;
    }
    
    if ( !isdefined( self.health_state_callbacks ) )
    {
        self.health_state_callbacks = [];
    }
    
    if ( !self.health_state_callbacks.size )
    {
        self.health_state_callbacks[ self.health_state_callbacks.size ] = { #callback:callback, #health_pct:health_pct };
        return;
    }
    
    foreach ( index, health_state in self.health_state_callbacks )
    {
        if ( health_pct < health_state.health_pct )
        {
            arrayinsert( self.health_state_callbacks, { #callback:callback, #health_pct:health_pct }, index );
            return;
        }
    }
}

// Namespace zombie_utils
// Params 2
// Checksum 0x7a7f45d0, Offset: 0x14e3
// Size: 0x102, Type: bool
function function_584d912c70295d81( healthpct, var_45f2beaaf602ef55 )
{
    if ( !isdefined( self.zombieaisettings.var_a8c018f581370760 ) )
    {
        return false;
    }
    
    foreach ( shield_data in self.zombieaisettings.var_a8c018f581370760 )
    {
        if ( shield_data.healthpct > 0 && shield_data.healthpct == healthpct )
        {
            self.var_2127b832226be646 = clamp( 1 - shield_data.reducedamage, 0, 1 );
            self.var_45f2beaaf602ef55 = var_45f2beaaf602ef55;
            return true;
        }
    }
    
    return false;
}

// Namespace zombie_utils
// Params 0
// Checksum 0xc3bcdbf5, Offset: 0x15ee
// Size: 0x16
function function_6467c6da3b68c7e5()
{
    self.var_2127b832226be646 = undefined;
    self.var_45f2beaaf602ef55 = undefined;
}

