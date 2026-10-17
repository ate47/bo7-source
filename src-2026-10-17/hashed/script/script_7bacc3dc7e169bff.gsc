#using script_16ea1b94f0f381b3;
#using script_1f14fd3ab70df73b;
#using script_41e73c1fdc7f422a;
#using script_4bc38131d8ecd20b;
#using script_6c2f6a14fa53759e;
#using script_6cff0e2cbf0ff341;
#using script_8f5fd77c34416a9;
#using scripts\common\ai\aitypes\zombie_phobos\zombie_phobos_metabones;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\utility;

#namespace zombie_phobos_roar;

// Namespace zombie_phobos_roar
// Params 1
// Checksum 0xfff2158a, Offset: 0x238
// Size: 0xc
function function_6a68654ad25a8341( var_4b4d72d84afd1ebd )
{
    
}

/#

    // Namespace zombie_phobos_roar
    // Params 0
    // Checksum 0xe4f27ef5, Offset: 0x24c
    // Size: 0xc, Type: dev
    function function_854c976a13f0454a()
    {
        setup_roar_devgui();
    }

#/

// Namespace zombie_phobos_roar
// Params 0
// Checksum 0x77291657, Offset: 0x260
// Size: 0x13
function init_zombie_phobos_roar()
{
    self.phobos_spawned_zombies = [];
    thread roar_listener();
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xdf87f6a2, Offset: 0x27b
// Size: 0x86
function function_104cfd9ccf3cfc7c( taskid, params )
{
    var_75d0b9a26ca80a5e = gettime() - ( self.roar_end_time ?? self.birthtime );
    
    if ( !utility::time_has_passed( self.roar_end_time ?? self.birthtime, 10 ) )
    {
        return 0;
    }
    
    cooldown_score = clamp( math::remap( var_75d0b9a26ca80a5e, 10, utility::function_4b74c15943231980( 90 ), 0, 1 ), 0, 1 );
    return cooldown_score;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xd4ff1da4, Offset: 0x30a
// Size: 0x5e
function function_ff7f2a7bff8ab2e1( taskid, params )
{
    if ( !isdefined( self.var_f744e8be8b657e6e ) )
    {
        return 0;
    }
    
    var_7fe1fb55bb2d6630 = zombie_phobos_spit::function_f70810ebb0103f22( self );
    var_24cb63031538dab = min( math::remap( var_7fe1fb55bb2d6630 / 3, 0, 1, 0, 0.6 ), 1 );
    return var_24cb63031538dab;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0x37326a63, Offset: 0x371
// Size: 0x8e
function function_c7897229d37d955e( taskid, params )
{
    if ( !isdefined( self.var_f744e8be8b657e6e ) )
    {
        return 0;
    }
    
    var_4e5d6d60c74d4864 = function_5713d46873b29625( self.var_f744e8be8b657e6e );
    toxic_gas_buffer = 128;
    closest_toxic_gas = function_47c86977a18df38b( var_4e5d6d60c74d4864, self.origin, 380 + toxic_gas_buffer );
    
    if ( !isdefined( closest_toxic_gas ) )
    {
        return 0.5;
    }
    
    var_defb0cc400ac09a0 = zombie_phobos_metabones::function_d106078919e7275f() / 8;
    return 1 - var_defb0cc400ac09a0;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xe6580427, Offset: 0x408
// Size: 0x6f
function function_cedfa072635ea803( taskid, params )
{
    ai_array = getaiarrayinradius( self.origin, 3000, self.team );
    num_ai = ai_array.size - 1 ?? 0;
    var_25f2d4c4ac58dfb8 = clamp( math::remap( num_ai, 0, 12, 1, 0 ), 0, 1 );
    return var_25f2d4c4ac58dfb8;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xd5b47bb9, Offset: 0x480
// Size: 0x103
function function_d3fd3b5f35883f43( taskid, params )
{
    targets = self function_f017e352a29a57a1( self.origin, 3000, 1 );
    targets_visible = 0;
    
    foreach ( target in targets )
    {
        if ( math::within_fov_2d( self.origin, self.angles, target.origin, cos( 45 ) ) )
        {
            targets_visible += 1;
        }
    }
    
    visibility_score = 0;
    
    if ( targets_visible > 0 )
    {
        visibility_score = math::remap( targets_visible / targets.size, 0, 1, 0, 0.5 );
    }
    
    return visibility_score;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0x4f86cfea, Offset: 0x58c
// Size: 0xc9
function function_ff773bbeb5f4ad55( taskid, params )
{
    ground_center = self.origin + anglestoforward( self.angles ) * 400;
    hit_wall = navtrace( self.origin, ground_center, self );
    
    /#
        if ( debug_roar() )
        {
            col = hit_wall ? ( 1, 0, 0 ) : ( 0, 1, 0 );
            line( self.origin, ground_center, col, 1, 1 );
            roar_print( "<dev string:x24>", ground_center );
        }
    #/
    
    if ( hit_wall )
    {
        return anim.failure;
    }
    
    return anim.success;
}

// Namespace zombie_phobos_roar
// Params 0, eflags: 0x4
// Checksum 0xa883045c, Offset: 0x65e
// Size: 0x2a
function private roar_listener()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"roar_start" );
        thread on_roar();
    }
}

// Namespace zombie_phobos_roar
// Params 0, eflags: 0x4
// Checksum 0xf3bd7613, Offset: 0x690
// Size: 0xdb
function private on_roar()
{
    self endon( #"death" );
    self endon( #"roar_end" );
    roar_time = 4000;
    
    if ( zombie_phobos_enraged::is_enraged() )
    {
        roar_time = 3800;
    }
    
    self function_786bb6aa1b76c7ee( "roar_end_time", roar_time );
    self waittill( #"start_roar_loop" );
    start_roar();
    thread utility::thread_on_notify( "roar_end", &cleanup_roar, self, self, [ "cleanup_roar" ] );
    
    if ( zombie_phobos_enraged::is_enraged() && !istrue( self.var_e46525bdff4f9d3b ) )
    {
        utility::function_32b24db3127bff40( "mouth", "rising_bile" );
        thread function_1160fec90724d917();
    }
    
    thread function_ace97dac694931f();
    thread roar_rumble();
    thread roar_spawn_ai();
    self waittill( #"end_roar_loop" );
    self.roar_end_time = gettime();
    cleanup_roar();
}

// Namespace zombie_phobos_roar
// Params 0
// Checksum 0x2ace9bcf, Offset: 0x773
// Size: 0x1c
function start_roar()
{
    zombie_phobos_metabones::set_mouth_state( 1 );
    utility::function_7c10ea82c1e305b8( "roar", "on" );
}

// Namespace zombie_phobos_roar
// Params 0
// Checksum 0x70f8a41f, Offset: 0x797
// Size: 0x4d
function cleanup_roar()
{
    zombie_phobos_metabones::set_mouth_state( 0 );
    utility::function_32b24db3127bff40( "mouth", "base" );
    utility::function_7c10ea82c1e305b8( "roar", "outro" );
    
    if ( zombie_phobos_jumpout::is_outside_arena() )
    {
        self notify( #"outside_arena_roar_end" );
    }
    
    self notify( #"cleanup_roar" );
}

// Namespace zombie_phobos_roar
// Params 0
// Checksum 0xdebdeb5f, Offset: 0x7ec
// Size: 0xfa
function roar_rumble()
{
    self endon( #"death" );
    self endon( #"end_roar_loop" );
    self endon( #"end_roar" );
    rumble_dist = 1400;
    
    while ( self getaiblackboarddynamic( "in_roar_loop" ) )
    {
        earthquake( 0.3, 3, self.origin, rumble_dist );
        players = getplayersinradius( self.origin, rumble_dist );
        
        foreach ( player in players )
        {
            if ( !player utility::ent_flag( "phobos_roar_rumble" ) )
            {
                thread roar_rumble_on_player( player, rumble_dist );
            }
        }
        
        wait 1;
    }
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xc23b493c, Offset: 0x8ee
// Size: 0x23
function function_dc50a71fce5760fd( phobos, func )
{
    phobos.var_4da43c6a7a1311e9 = func;
}

// Namespace zombie_phobos_roar
// Params 0
// Checksum 0xca5ce521, Offset: 0x919
// Size: 0x3d7
function roar_spawn_ai()
{
    self notify( #"hash_e53c891bcfa29c0f" );
    self endon( #"hash_e53c891bcfa29c0f" );
    self endon( #"death" );
    spawning_time = 9;
    
    if ( zombie_phobos_jumpout::is_outside_arena() )
    {
        spawning_time = zombie_phobos_jumpout::function_aa28bc246d1fda07();
    }
    
    utility::ent_flag_clear( "pause_add_spawning" );
    self notify( #"roar_spawn_ai" );
    end_time = gettime() + utility::function_4b74c15943231980( 9 );
    
    while ( gettime() < end_time )
    {
        all_spawn_points = [];
        self.var_f744e8be8b657e6e = function_5713d46873b29625( self.var_f744e8be8b657e6e );
        
        foreach ( gas in self.var_f744e8be8b657e6e )
        {
            var_3af5c6b5a0378a74 = int( max( int( gas.radius / 25 ), 2 ) );
            gas_points = getrandomnavpoints( gas.origin, gas.radius, var_3af5c6b5a0378a74 );
            all_spawn_points = arraycombine( all_spawn_points, gas_points );
        }
        
        if ( isdefined( self.var_4da43c6a7a1311e9 ) )
        {
            self childthread [[ self.var_4da43c6a7a1311e9 ]]( self, all_spawn_points );
        }
        else
        {
            all_spawn_points = arrayrandomize( all_spawn_points );
            num_nearby_players = self.nearbyplayers.size;
            num_to_spawn = 5 * num_nearby_players;
            var_dd1ec8f49d4a4046 = 40;
            aitype = function_b3988325430ce242( "zombie_base" );
            
            if ( isdefined( self.var_183395a55b9ebcf4 ) )
            {
                aitype = [[ self.var_183395a55b9ebcf4 ]]();
            }
            
            while ( num_to_spawn > 0 )
            {
                foreach ( spawn_point in all_spawn_points )
                {
                    if ( num_to_spawn <= 0 )
                    {
                        break;
                    }
                    
                    self.phobos_spawned_zombies = function_46f9072493651dc9( self.phobos_spawned_zombies );
                    
                    if ( self.phobos_spawned_zombies.size < var_dd1ec8f49d4a4046 )
                    {
                        zombie = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( aitype, spawn_point, ( 0, 0, 0 ), self.team );
                        
                        if ( isdefined( zombie ) )
                        {
                            zombie thread namespace_9d8e359c3b1041e5::animscripted_sharedfunc( "spawn", "spawn_end", undefined, undefined, "spawn_animating" );
                            zombie zombie_utils::set_zombie_round_difficulty( zombie_utils::get_zombie_round_difficulty(), 1, 1 );
                            zombie utility::ent_flag_set( "phobos_spawn" );
                            
                            if ( isdefined( self.var_7b6457a80abc9e9c ) )
                            {
                                zombie.var_50c96a5c56dab386 = self.var_7b6457a80abc9e9c;
                            }
                            
                            zombie.no_powerups = 1;
                            speed = utility::cointoss() ? "run" : "walk";
                            
                            if ( isdefined( self.adds_get_speed ) )
                            {
                                speed = zombie [[ self.adds_get_speed ]]();
                            }
                            
                            zombie zombie_utils::function_a8ce00e0448cb6f0( speed, "phobos_base", 6 );
                            
                            if ( !isdefined( self.phobos_spawned_zombies ) )
                            {
                                self.phobos_spawned_zombies = [];
                            }
                            
                            self.phobos_spawned_zombies[ self.phobos_spawned_zombies.size ] = zombie;
                            params = spawnstruct();
                            params.zombie = zombie;
                            zombie callback::callback( "on_zombie_phobos_spawn_roared", params );
                            num_to_spawn--;
                        }
                    }
                    
                    wait 0.1;
                }
                
                waitframe();
            }
        }
        
        wait 5;
    }
}

// Namespace zombie_phobos_roar
// Params 0, eflags: 0x4
// Checksum 0x3421fad2, Offset: 0xcf8
// Size: 0xc4
function private function_1160fec90724d917()
{
    self endon( #"death" );
    self endon( #"end_roar_loop" );
    self endon( #"end_roar" );
    aitype = function_b3988325430ce242( "zombie_parasite" );
    spawn_point = self gettagorigin( "j_tongue6" );
    num_to_spawn = 4;
    
    while ( num_to_spawn > 0 )
    {
        zombie = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( aitype, spawn_point, ( 0, 0, 0 ), self.team );
        
        if ( isdefined( zombie ) )
        {
            params = spawnstruct();
            params.zombie = zombie;
            zombie callback::callback( "on_zombie_phobos_spawn_parasite", params );
            num_to_spawn--;
        }
        
        waitframe();
    }
}

// Namespace zombie_phobos_roar
// Params 0, eflags: 0x4
// Checksum 0x2948c895, Offset: 0xdc4
// Size: 0x231
function private function_ace97dac694931f()
{
    self endon( #"death" );
    self endon( #"end_roar" );
    
    while ( true )
    {
        nearby_zombies = getaiarrayinradius( self.origin, 380 );
        
        foreach ( zombie in nearby_zombies )
        {
            if ( zombie.type != "zombie" )
            {
                continue;
            }
            
            if ( !issubstr( zombie.subclass, "zombie_base" ) )
            {
                continue;
            }
            
            if ( zombie utility::ent_flag( "phobos_empowered" ) )
            {
                continue;
            }
            
            nearby_players = getplayersinradius( zombie.origin, 380 );
            
            if ( nearby_players.size > 0 )
            {
                /#
                    if ( debug_roar() )
                    {
                        roar_print( "<dev string:x35>", zombie.origin );
                    }
                #/
                
                continue;
            }
            
            zombie zombie_stun::stun_ai( 5 );
        }
        
        result = utility::waittill_notify_or_timeout_return( "end_roar_loop", 1 );
        nearby_zombies = getaiarrayinradius( self.origin, 390 );
        
        if ( result != "timeout" )
        {
            foreach ( zombie in nearby_zombies )
            {
                if ( isalive( zombie ) && issubstr( zombie.subclass, "zombie_base" ) && zombie zombie_stun::is_stunned() )
                {
                    zombie.forceannihilate = 1;
                    zombie kill( self.origin, self, self, "MOD_MELEE" );
                    zombie_phobos_metabones::function_9824f865944fa41d( self, 1 );
                }
            }
            
            break;
        }
    }
}

// Namespace zombie_phobos_roar
// Params 2, eflags: 0x4
// Checksum 0x81491ab5, Offset: 0xffd
// Size: 0xee
function private roar_rumble_on_player( player, rumble_dist )
{
    player endon( #"death" );
    assert( !player utility::ent_flag( "<dev string:x53>" ) );
    player utility::ent_flag_set( "phobos_roar_rumble" );
    player playrumblelooponentity( "steady_rumble" );
    
    while ( true )
    {
        is_alive = isalive( self );
        is_far = 0;
        var_7eb7e23ce7ac5e38 = 0;
        
        if ( is_alive )
        {
            var_48607cfdb87ffbae = distance2dsquared( self.origin, player.origin );
            is_far = var_48607cfdb87ffbae > squared( rumble_dist );
            var_7eb7e23ce7ac5e38 = !self getaiblackboarddynamic( "in_roar_loop" );
        }
        
        if ( !is_alive || var_7eb7e23ce7ac5e38 || is_far )
        {
            player utility::ent_flag_clear( "phobos_roar_rumble" );
            player stoprumble( "steady_rumble" );
            return;
        }
        
        waitframe();
    }
}

// Namespace zombie_phobos_roar
// Params 1
// Checksum 0xf641e5f3, Offset: 0x10f3
// Size: 0x20
function function_4e28392984a29ec( var_e46525bdff4f9d3b = 1 )
{
    self.var_e46525bdff4f9d3b = var_e46525bdff4f9d3b;
}

// Namespace zombie_phobos_roar
// Params 2
// Checksum 0xa1333e84, Offset: 0x111b
// Size: 0x1e
function shouldroar( taskid, params )
{
    return anim.success;
}

/#

    // Namespace zombie_phobos_roar
    // Params 0
    // Checksum 0x5888b526, Offset: 0x1142
    // Size: 0x44, Type: dev
    function setup_roar_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x66>" );
        devgui::add_devgui_func( "<dev string:x7e>", "<dev string:x89>", &force_roar );
        devgui::add_devgui_func( "<dev string:x9b>", "<dev string:xa6>", &function_7491d81ce5b766d3 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_phobos_roar
    // Params 0, eflags: 0x4
    // Checksum 0xc341e6cb, Offset: 0x118e
    // Size: 0x41, Type: dev
    function private force_roar()
    {
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:xb8>" );
        
        if ( isdefined( phobos ) )
        {
            phobos namespace_896b586af011dc97::function_70cf8f67298d0e72();
        }
    }

    // Namespace zombie_phobos_roar
    // Params 1, eflags: 0x4
    // Checksum 0xdcae2a03, Offset: 0x11d7
    // Size: 0x24, Type: dev
    function private function_7491d81ce5b766d3( params )
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xc6>", @"hash_f71ad421155b2c2a" );
    }

    // Namespace zombie_phobos_roar
    // Params 0, eflags: 0x4
    // Checksum 0x9885c75, Offset: 0x1203
    // Size: 0x16, Type: dev
    function private debug_roar()
    {
        return getdvarint( @"hash_f71ad421155b2c2a", 0 ) > 0;
    }

    // Namespace zombie_phobos_roar
    // Params 2, eflags: 0x4
    // Checksum 0x1bb2ad46, Offset: 0x1221
    // Size: 0x4b, Type: dev
    function private roar_print( text, origin )
    {
        if ( debug_roar() )
        {
            print3d( origin + ( 0, 0, 70 ), "<dev string:xd8>" + text, ( 1, 0, 0 ) );
        }
    }

#/
