#using script_16ea1b94f0f381b3;
#using script_6c2f6a14fa53759e;
#using scripts\common\ai;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\metabone;
#using scripts\common\trace;
#using scripts\common\utility;

#namespace zombie_deathworm;

// Namespace zombie_deathworm
// Params 1
// Checksum 0xcbcd863b, Offset: 0x20a
// Size: 0x3d
function init_beam_attack_precache( aitypescriptbundle )
{
    settings = zombie_utils::function_a225e7aa4a243fb2( aitypescriptbundle );
    
    if ( isdefined( settings ) )
    {
        utility::add_fx( "deathworm_beam_vfx", settings.beamvfx );
    }
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0x5b20d5e, Offset: 0x24f
// Size: 0xa7
function init_beam_attack()
{
    self.worm_target_ent = undefined;
    self.worm_target_yaw = 0;
    self.worm_target_dist = 400;
    self.worm_beam_start_time = 0;
    self.var_6bb47f7753e4188d = 0;
    self.worm_beam = undefined;
    self.worm_beam_target_ent = spawn( "script_model", self.origin );
    self.worm_beam_target_ent setmodel( self.zombieaisettings.var_d3de1a9faac42deb.var_f4615ecafed1394d );
    thread utility::delete_on_death( self.worm_beam_target_ent );
    thread function_7c758e39cf7d3bc4();
    
    /#
        init_beam_attack_devgui();
    #/
}

// Namespace zombie_deathworm
// Params 4
// Checksum 0x1e48f72, Offset: 0x2fe
// Size: 0x7a, Type: bool
function function_6a45376d254099c2( asmname, statename, tostatename, params )
{
    var_d1bc21baf5f18f5d = gettime() - self.worm_beam_start_time;
    worm_beam_time = get_beaming_time() + get_pause_time();
    
    if ( worm_beam_time > 0 && var_d1bc21baf5f18f5d >= worm_beam_time )
    {
        /#
            beam_print( "<dev string:x24>" );
        #/
        
        return true;
    }
    
    return false;
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x2f684da6, Offset: 0x381
// Size: 0x12
function private get_pause_time()
{
    return getdvarfloat( @"worm_beam_pause_time", 600 );
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x88d8b41f, Offset: 0x39c
// Size: 0xb
function private get_beaming_time()
{
    return self.var_a4a2b1f3f3b58ce9;
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x74488ed7, Offset: 0x3b0
// Size: 0x7c4
function private function_4f723fcaf2ed1d76()
{
    self endon( #"death" );
    self endon( #"beam_attack_end" );
    self.var_a4a2b1f3f3b58ce9 = getdvarfloat( @"worm_beam_time", 2000 );
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    alive_percentage = [[ self.var_3c8a8a999d3d0d2e ]]();
    is_injured = self.health < self.maxhealth * 0.5;
    
    if ( gettime() - self.var_6bb47f7753e4188d < 30000 || var_4912869f02b165bf >= 4 || var_4912869f02b165bf > 1 && alive_percentage >= 1 || is_injured )
    {
        self.var_a4a2b1f3f3b58ce9 *= 0.5;
    }
    
    target_yaw = 0;
    
    if ( isdefined( self.worm_target_ent ) )
    {
        target_ent_velocity = ( 0, 0, 0 );
        
        if ( isagent( self.worm_target_ent ) || isplayer( self.worm_target_ent ) )
        {
            target_ent_velocity = self.worm_target_ent getvelocity();
            
            if ( isdefined( self.worm_target_ent.vehicle ) )
            {
                target_ent_velocity = self.worm_target_ent.vehicle vehicle_getvelocity();
            }
        }
        
        target_ent_pos = self.worm_target_ent.origin;
        dist_perc = distance2d( self.origin, target_ent_pos ) / 2000;
        predicted_pos = target_ent_pos + target_ent_velocity * ( get_pause_time() + get_beaming_time() * dist_perc ) / 1000;
        
        /#
            if ( debug_beam_attack() )
            {
                line( target_ent_pos, predicted_pos, ( 1, 0, 0 ) );
                beam_print( "<dev string:x41>", predicted_pos );
            }
        #/
        
        target_ent_pos = predicted_pos;
        target_yaw = utility::getyawtospot( target_ent_pos );
        target_yaw = clamp( target_yaw, -70, 70 );
    }
    
    target_vec_normalized = anglestoforward( ( 0, target_yaw + self.angles[ 1 ], 0 ) );
    max_beam_length = getdvarfloat( @"worm_beam_max_length", 3000 );
    self function_536f8624346a747b( target_yaw );
    self function_ba5334b674dfb9d0( 0 );
    wait get_pause_time() / 1000;
    start_time = gettime();
    end_time = start_time + get_beaming_time();
    self.worm_beam = playfxontagsbetweenclients( utility::getfx( "deathworm_beam_vfx" ), self, "tag_fx_beam_rotate", self.worm_beam_target_ent, "tag_origin" );
    
    if ( isdefined( self.worm_beam ) )
    {
        self.worm_beam namespace_9d8e359c3b1041e5::forcenetfieldhighlod_sharedfunc( 1 );
        thread utility::function_9a9165839779317f( self.worm_beam, "beam_attack_end" );
    }
    
    self.worm_beam_target_ent utility::function_32b24db3127bff40( "beam_target", "beam_target_on" );
    self.worm_beam_target_ent dontinterpolate();
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    
    while ( true )
    {
        aim_start_pos = self gettagorigin( "tag_fx_beam_rotate" );
        time_perc = math::remap( gettime(), start_time, end_time, 0, 1 );
        dist_perc = time_perc;
        
        if ( var_4912869f02b165bf < 7 )
        {
            dist_perc = easepower( time_perc, getdvarfloat( @"hash_3e747e1d7b24b293", 1.25 ), 1, 0 );
        }
        
        target_dist = math::remap( dist_perc, 0, 1, 300, 2000 );
        target_dist = clamp( target_dist, 300, 2000 );
        target_aim_pos = target_vec_normalized * target_dist + self.origin;
        var_b150449b2916bef9 = vectornormalize( target_aim_pos - aim_start_pos );
        target_aim_pos = aim_start_pos + var_b150449b2916bef9 * max_beam_length;
        a_trace_results = trace::ray_trace_get_all_results( aim_start_pos, target_aim_pos );
        hit_ents = [];
        hit_position = target_aim_pos;
        
        foreach ( trace_result in a_trace_results )
        {
            if ( trace_result[ "hittype" ] == "hittype_world" )
            {
                hit_position = trace_result[ "position" ];
                break;
            }
            
            if ( trace_result[ "hittype" ] == "hittype_entity" )
            {
                hit_ents[ hit_ents.size ] = trace_result[ "entity" ];
            }
        }
        
        blast_radius = 80;
        var_2c4896a24434f88b = getplayersandaiarrayinradius( hit_position, blast_radius );
        hit_ents = arraycombineunique( hit_ents, var_2c4896a24434f88b );
        
        foreach ( hit_ent in hit_ents )
        {
            if ( !isalive( hit_ent ) || self == hit_ent )
            {
                continue;
            }
            
            if ( hit_ent utility::ent_flag( "worm_beamed" ) )
            {
                /#
                    beam_print( "<dev string:x4f>", hit_ent.origin );
                #/
                
                continue;
            }
            
            beam_damage = 50;
            beam_should_kill = 0;
            
            if ( isplayer( hit_ent ) )
            {
                beam_damage = 250;
            }
            else if ( isai( hit_ent ) )
            {
                if ( hit_ent.subclass == "zombie_hellhound_pet" )
                {
                    beam_damage = 7500;
                }
                else if ( ( !isdefined( hit_ent.aicategory ) || hit_ent.aicategory == "normal" ) && !hit_ent.damageshield )
                {
                    beam_should_kill = 1;
                }
                else if ( hit_ent.aicategory == "special" )
                {
                    beam_damage = 50000;
                }
                else if ( hit_ent.aicategory == "elite" || hit_ent.aicategory == "hvt" )
                {
                    beam_damage = 25000;
                }
            }
            
            if ( beam_should_kill )
            {
                hit_ent utility::ent_flag_set( "dissolve" );
                hit_ent kill( aim_start_pos, self, self, "MOD_PROJECTILE" );
                continue;
            }
            
            if ( self.var_60d920f687db580a && self.var_6005157a6615b97f > 1 && isplayer( hit_ent ) )
            {
                hit_ent dodamage( beam_damage, aim_start_pos, self, self, "MOD_PROJECTILE" );
            }
            
            hit_ent dodamage( beam_damage, aim_start_pos, self, self, "MOD_PROJECTILE" );
            hit_ent utility::ent_flag_set( "worm_beamed" );
            hit_ent thread utility::ent_flag_clear_delayed( "worm_beamed", 0.5 );
            
            /#
                beam_print( "<dev string:x5d>", hit_ent.origin );
            #/
        }
        
        /#
            if ( debug_beam_attack() )
            {
                sphere( hit_position, blast_radius, ( 1, 0, 0 ) );
            }
        #/
        
        self.worm_beam_target_ent.origin = hit_position;
        self.worm_target_yaw = target_yaw;
        self.worm_target_dist = target_dist;
        
        /#
            if ( debug_beam_attack() )
            {
                line( aim_start_pos, self.worm_beam_target_ent.origin, ( 1, 0, 0 ) );
                beam_print( "<dev string:x7b>", self.worm_beam_target_ent.origin );
                line( self.worm_beam_target_ent.origin, target_aim_pos, ( 1, 1, 0 ), 0.3 );
            }
        #/
        
        self function_536f8624346a747b( self.worm_target_yaw );
        self function_ba5334b674dfb9d0( self.worm_target_dist );
        waitframe();
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x444b8ca3, Offset: 0xb7c
// Size: 0xf4
function private function_7c758e39cf7d3bc4()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"beam_attack_start" );
        self.worm_beam_start_time = gettime();
        self.worm_target_ent = self.enemy;
        utility::function_32b24db3127bff40( "mouth", "beam" );
        metabone::set_metabone_active( "beaming_head", 1 );
        yaw_to_enemy = 0;
        
        if ( isdefined( self.enemy ) )
        {
            yaw_to_enemy = utility::getyawtospot( self.enemy.origin );
            
            if ( abs( yaw_to_enemy ) < getdvarfloat( @"hash_290f687417871da4", 130 ) )
            {
                self.turnrate = getdvarfloat( @"hash_600c759093c68d43", 0.025 );
            }
            else
            {
                self.turnrate = 0.01;
            }
        }
        
        thread function_4f723fcaf2ed1d76();
        thread utility::thread_on_notify( "beam_attack_end", &on_beam_attack_end, self );
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x4dd76251, Offset: 0xc78
// Size: 0x74
function private on_beam_attack_end()
{
    utility::function_32b24db3127bff40( "mouth", "off" );
    utility::function_32b24db3127bff40( "audio", "beam_off" );
    self.worm_beam_target_ent utility::function_32b24db3127bff40( "beam_target", "beam_target_off" );
    metabone::set_metabone_active( "beaming_head", 0 );
    ai::set_blackboard_cooldown( "beam_attack_cooldown", getdvarint( @"worm_beam_cooldown", 16000 ) );
    self.var_6bb47f7753e4188d = gettime();
}

/#

    // Namespace zombie_deathworm
    // Params 0
    // Checksum 0xed72d387, Offset: 0xcf4
    // Size: 0x44, Type: dev
    function init_beam_attack_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x86>" );
        devgui::add_devgui_func( "<dev string:xa2>", "<dev string:xb4>", &force_beam_attack );
        devgui::add_devgui_func( "<dev string:xcb>", "<dev string:xdd>", &function_1a3b3a6ad2d7ea45 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0xc47896f8, Offset: 0xd40
    // Size: 0x72, Type: dev
    function private force_beam_attack()
    {
        worm = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:xf4>" );
        
        if ( !isdefined( worm ) )
        {
            worm = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x105>" );
            
            if ( !isdefined( worm ) )
            {
                return;
            }
        }
        
        worm function_786bb6aa1b76c7ee( "<dev string:x11b>", 1 );
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0xb9d98b03, Offset: 0xdba
    // Size: 0x16, Type: dev
    function private debug_beam_attack()
    {
        return getdvarint( @"hash_f6e0c15a97baed74", 0 ) > 0;
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x607a9e51, Offset: 0xdd8
    // Size: 0x1a, Type: dev
    function private function_1a3b3a6ad2d7ea45()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x12a>", @"hash_f6e0c15a97baed74" );
    }

    // Namespace zombie_deathworm
    // Params 2, eflags: 0x4
    // Checksum 0x911106d8, Offset: 0xdfa
    // Size: 0x5b, Type: dev
    function private beam_print( text, pos )
    {
        if ( debug_beam_attack() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x146>" + text, ( 1, 0, 0 ) );
        }
    }

#/
