#using script_1243911b5893214a;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;

#namespace zombie_melee;

// Namespace zombie_melee
// Params 0
// Checksum 0xa2f50ef4, Offset: 0x14f
// Size: 0x3f
function init_zombie_melee_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &function_cf1a41dfcd2a9982 );
    level.var_bc5de1efb65763be = !level.gametypebundle.var_8318eed5fd779573;
}

// Namespace zombie_melee
// Params 0
// Checksum 0xd36f86e2, Offset: 0x196
// Size: 0x23
function init_zombie_melee()
{
    thread function_f98058533d9911cf();
    
    if ( !isdefined( self.var_d4a397a6f6cddafa ) )
    {
        self.var_d4a397a6f6cddafa = &function_d4a397a6f6cddafa;
    }
}

// Namespace zombie_melee
// Params 12
// Checksum 0xaf17b446, Offset: 0x1c1
// Size: 0x175
function register_melee_settings( damage_amount, range, var_814f0979ce1429b8, var_26724459d0b1639d, damage_to_ai_multiplier, var_6b413efe024099f0, always_knockback, knockback_strength, knockback_angle, var_8eed320b7873f7d6, var_2966c3d9ec29d388, var_f1cb4f6133640cfe )
{
    assert( isdefined( range ) );
    self.melee_damage = damage_amount ?? 30;
    self.melee_damage_base = self.melee_damage;
    self.melee_range = range;
    self.var_a94ea9449f3053dd = var_814f0979ce1429b8;
    self.var_42ddbc8ee376c279 = damage_to_ai_multiplier ?? 1;
    self.var_6b413efe024099f0 = var_6b413efe024099f0;
    self.always_knockback = always_knockback;
    self.knockback_strength = knockback_strength;
    self.knockback_angle = knockback_angle;
    self.var_8eed320b7873f7d6 = var_8eed320b7873f7d6;
    self.var_2966c3d9ec29d388 = var_2966c3d9ec29d388;
    self.var_f1cb4f6133640cfe = var_f1cb4f6133640cfe;
    self._blackboard.zombiemeleerange = self.melee_range;
    self._blackboard.var_cedd501bdb70cc3f = var_26724459d0b1639d ?? 90;
    self._blackboard.var_f98a47aa5cd0dadf = 45;
    zombie_utils::function_7ae8d980fd719e78( "melee_range", self.melee_range );
}

// Namespace zombie_melee
// Params 2
// Checksum 0xc3e05608, Offset: 0x33e
// Size: 0x39
function function_2cc3729a3cdeadbf( movetype, range_override )
{
    if ( !isdefined( self.var_f417c9b84e331083 ) )
    {
        self.var_f417c9b84e331083 = [];
    }
    
    self.var_f417c9b84e331083[ movetype ] = range_override;
}

// Namespace zombie_melee
// Params 1
// Checksum 0x5cec0a8c, Offset: 0x37f
// Size: 0x75
function function_cf1a41dfcd2a9982( params )
{
    if ( isdefined( self._blackboard.movetype ) && isdefined( self.var_f417c9b84e331083[ self._blackboard.movetype ] ) )
    {
        self._blackboard.var_cedd501bdb70cc3f = self.var_f417c9b84e331083[ self._blackboard.movetype ];
    }
}

// Namespace zombie_melee
// Params 2
// Checksum 0xd1a53c0a, Offset: 0x3fc
// Size: 0xd0
function request_melee( var_7cb783ab199e109e, is_moving_melee )
{
    self.var_3eaa5cd097e43179 = var_7cb783ab199e109e;
    
    if ( isvector( var_7cb783ab199e109e ) && self._blackboard.zombieattackpoint != var_7cb783ab199e109e )
    {
        self._blackboard.zombieattackpoint = var_7cb783ab199e109e;
    }
    
    if ( !isdefined( is_moving_melee ) || self.zombieaisettings.var_86f358fbcc9b90ed )
    {
        is_moving_melee = calculate_is_moving_melee( var_7cb783ab199e109e );
    }
    
    self._blackboard.zombiemeleeismoving = is_moving_melee;
    
    if ( self.is_moving_melee != is_moving_melee )
    {
        self.is_moving_melee = is_moving_melee;
        callback::callback( "on_is_moving_melee_changed" );
    }
    
    callback::callback( "on_is_melee_started" );
    zombie_melee_asm::request_melee_asm_state();
}

// Namespace zombie_melee
// Params 2
// Checksum 0xac586e26, Offset: 0x4d4
// Size: 0x448
function function_d4a397a6f6cddafa( msg, melee_direction )
{
    assert( isdefined( self.melee_range ) && isdefined( self.melee_damage ) );
    var_7cb783ab199e109e = self.var_3eaa5cd097e43179;
    melee_damage = self.melee_damage;
    
    if ( isai( var_7cb783ab199e109e ) )
    {
        melee_damage = int( melee_damage * self.var_42ddbc8ee376c279 );
    }
    
    var_cc5154831fffb0e8 = getdvarfloat( @"zombie_melee_damage_multiplier", -1 );
    
    if ( var_cc5154831fffb0e8 >= 0 )
    {
        melee_damage = int( melee_damage * var_cc5154831fffb0e8 );
    }
    
    if ( isalive( var_7cb783ab199e109e ) && isdefined( var_7cb783ab199e109e.var_9bf1b202c502399d ) )
    {
        initial_time = gettime();
        cooldown = 200;
        last_hit_time = var_7cb783ab199e109e.var_9bf1b202c502399d;
        
        for ( delay_time_ms = cooldown - gettime() - last_hit_time; delay_time_ms > 0 ; delay_time_ms = cooldown - gettime() - last_hit_time )
        {
            if ( delay_time_ms > 0 )
            {
                wait delay_time_ms / 1000;
                
                if ( !isalive( var_7cb783ab199e109e ) || gettime() - initial_time > 500 )
                {
                    return;
                }
            }
        }
    }
    
    params = spawnstruct();
    params.meleetarget = var_7cb783ab199e109e;
    params.meleedamage = melee_damage;
    params.var_948a2ae89285ee6a = 0;
    callback::callback( "zombie_melee_pre", params );
    melee_range = function_b18453c9674478c1( var_7cb783ab199e109e ) + params.var_948a2ae89285ee6a;
    meleedamageoverride = getdvarint( @"zombie_melee_damage_override", -1 );
    
    if ( meleedamageoverride >= 0 )
    {
        melee_damage = meleedamageoverride;
    }
    
    hit_ent = self melee( melee_direction, melee_damage, melee_range, 16, 16 );
    self._blackboard.var_55582424d78862f5 = !isdefined( hit_ent );
    damage_point = self.origin + anglestoforward( self.angles ) * melee_range * 0.5 + ( 0, 0, 1 ) * self.height * 0.5;
    
    if ( level.var_bc5de1efb65763be )
    {
        params = spawnstruct();
        params.damage = melee_damage;
        params.origin = damage_point;
        params.radius = melee_range * 0.5;
        params.meansofdeath = "MOD_MELEE";
        callback::callback( "damage_point", params );
        
        /#
            recordsphere( params.origin, 5, ( 1, 0, 0 ) );
        #/
    }
    
    if ( isdefined( hit_ent ) && self.var_6b413efe024099f0 && isplayer( hit_ent ) )
    {
        if ( self.always_knockback || msg == "knockback" )
        {
            if ( self.knockback_angle > 0 )
            {
                knockback_dir = hit_ent.origin - self.origin;
                right_dir = vectorcross( knockback_dir, ( 0, 0, 1 ) );
                knockback_dir = rotatepointaroundvector( right_dir, knockback_dir, self.knockback_angle );
                hit_ent knockback( knockback_dir, self.knockback_strength, 1 );
            }
            else
            {
                hit_ent utility::knockback_flat( hit_ent.origin - self.origin, self.knockback_strength );
            }
            
            if ( self.var_8eed320b7873f7d6 > 0 && self.var_2966c3d9ec29d388 > 0 )
            {
                hit_ent earthquakeforplayer( self.var_8eed320b7873f7d6, self.var_2966c3d9ec29d388, hit_ent.origin, 1000 );
                hit_ent playrumbleonentity( self.var_8eed320b7873f7d6 > 0.5 ? "heavy_1s" : "light_1s" );
            }
        }
    }
    
    if ( isdefined( hit_ent ) )
    {
        hit_ent.var_9bf1b202c502399d = gettime();
    }
    
    params = spawnstruct();
    params.meleehitent = hit_ent;
    params.damagepoint = damage_point;
    params.msg = msg;
    callback::callback( "zombie_melee", params );
}

// Namespace zombie_melee
// Params 0, eflags: 0x4
// Checksum 0x5967dff9, Offset: 0x924
// Size: 0x130
function private function_f98058533d9911cf()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"bmeleestarted" );
        
        if ( self.var_f1cb4f6133640cfe )
        {
            val::set( "melee_pain", "pain", 0 );
        }
        
        if ( isdefined( self._blackboard.meleerequestedtarget ) )
        {
            var_7cb783ab199e109e = self._blackboard.meleerequestedtarget;
        }
        else if ( isdefined( self._blackboard.zombieattackpoint ) )
        {
            var_7cb783ab199e109e = self._blackboard.zombieattackpoint;
        }
        else
        {
            var_7cb783ab199e109e = self.enemy;
        }
        
        if ( isdefined( self.var_35bc94cfee6a37e6 ) && ![[ self.var_35bc94cfee6a37e6 ]]( var_7cb783ab199e109e ) )
        {
            waitframe();
        }
        else
        {
            request_melee( var_7cb783ab199e109e, self._blackboard.zombiemeleeismoving );
            thread function_9e17df9d0b6ee375();
            self waittill( #"bmeleeended" );
        }
        
        if ( self.var_f1cb4f6133640cfe )
        {
            val::set( "melee_pain", "pain", 1 );
        }
        
        self.in_melee = 0;
    }
}

// Namespace zombie_melee
// Params 0, eflags: 0x4
// Checksum 0x71aa181d, Offset: 0xa5c
// Size: 0x56
function private function_9e17df9d0b6ee375()
{
    self endon( #"death" );
    self endon( #"bmeleeended" );
    
    while ( true )
    {
        self waittill( #"hit_melee", msg );
        
        if ( isdefined( self.var_d4a397a6f6cddafa ) )
        {
            [[ self.var_d4a397a6f6cddafa ]]( msg );
        }
    }
}

// Namespace zombie_melee
// Params 1
// Checksum 0x8396e78c, Offset: 0xaba
// Size: 0x38
function function_b18453c9674478c1( var_7cb783ab199e109e )
{
    if ( self.var_a94ea9449f3053dd >= 0 )
    {
        if ( calculate_is_moving_melee( var_7cb783ab199e109e ) )
        {
            return self.var_a94ea9449f3053dd;
        }
    }
    
    return self.melee_range;
}

// Namespace zombie_melee
// Params 1, eflags: 0x4
// Checksum 0xe2078e9b, Offset: 0xafb
// Size: 0x141
function private calculate_is_moving_melee( var_7cb783ab199e109e )
{
    moving_melee_threshold = self.zombieaisettings.var_df57861840604837 ?? getdvarint( @"hash_b17a9432a377356d", 65 );
    is_moving_melee = lengthsquared( self.velocity ) > squared( moving_melee_threshold );
    
    if ( is_moving_melee && isdefined( var_7cb783ab199e109e ) && self.zombieaisettings.var_8230020417290c5d )
    {
        if ( isalive( var_7cb783ab199e109e ) )
        {
            target = var_7cb783ab199e109e;
            target_pos = target.origin;
        }
        else
        {
            target_pos = var_7cb783ab199e109e;
        }
        
        if ( isvector( target_pos ) )
        {
            to_target = target_pos - self.origin;
            range_sqr = lengthsquared( to_target );
            
            if ( range_sqr < squared( self.melee_range ) )
            {
                if ( isdefined( target ) )
                {
                    if ( target vehicle::is_vehicle() )
                    {
                        target_vel = target vehicle_getvelocity();
                    }
                    else
                    {
                        target_vel = target getentityvelocity();
                    }
                    
                    is_moving_melee = vectordot2( target_vel, to_target ) > 0 && length2dsquared( target_vel ) > squared( 30 );
                }
                else
                {
                    is_moving_melee = 0;
                }
            }
        }
    }
    
    return is_moving_melee;
}

