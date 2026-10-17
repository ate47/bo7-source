#using script_15ce43f40ea0fd2b;
#using script_16ea1b94f0f381b3;
#using script_4bc38131d8ecd20b;
#using script_6c2f6a14fa53759e;
#using scripts\common\ai;
#using scripts\common\ai\aitypes\zombie_disciple\zombie_disciple;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\throttle;
#using scripts\common\utility;

#namespace namespace_d4e7a14ee55bd048;

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0xe8c94d12, Offset: 0x2b7
// Size: 0x3d
function function_a13ce4b7ef033fc6( aitypescriptbundle )
{
    settings = zombie_utils::function_a225e7aa4a243fb2( aitypescriptbundle );
    
    if ( isdefined( settings ) )
    {
        utility::add_fx( "disciple_binding_trail_fx", settings.var_8417d5259afd45bd );
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xda23f939, Offset: 0x2fc
// Size: 0x16
function function_475849a0c68c6e47()
{
    level.var_86b1a5e1af185c5d = [];
    
    /#
        function_6bac40e4542b29df();
    #/
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0x55be3209, Offset: 0x31a
// Size: 0xc2
function init_zombie_disciple_bind()
{
    self.bound_zombies = [];
    self.bind_cooldown = 0;
    self.bind_counter = 0;
    self.bind_max = self.zombieaisettings.var_d3de1a9faac42deb.var_853cccc95dc0ca6;
    self.var_86fae3f99538b683 = self.zombieaisettings.var_d3de1a9faac42deb.var_406f8dce0b79bc09;
    self.bind_disable = self.zombieaisettings.var_d3de1a9faac42deb.disablebind;
    callback::add( #"on_ai_killed", &function_bf731e5c7eae0684 );
    
    if ( self getaiblackboarddynamic( "can_bind_zombies" ) )
    {
        thread function_7abdb1f886503db2();
        thread function_75f2872d153ffa88();
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xd99910b9, Offset: 0x3e4
// Size: 0x5b
function function_75f2872d153ffa88()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"bind_start" );
        utility::ent_flag_set( "playing_binding_anim" );
        childthread function_444a1d8601b3d4a3();
        self waittill( #"bind_stop" );
        utility::ent_flag_clear( "playing_binding_anim" );
        self function_786bb6aa1b76c7ee( "in_bind", 0 );
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xb2c6620c, Offset: 0x447
// Size: 0x1b
function function_87343acd4de8793d()
{
    return max( self.bind_max - self.bound_zombies.size, 0 );
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0x5b368e6d, Offset: 0x46b
// Size: 0xc4, Type: bool
function can_bind_zombies()
{
    if ( function_87343acd4de8793d() <= 0 || self.bind_cooldown > gettime() || utility::ent_flag( "playing_binding_anim" ) )
    {
        return false;
    }
    
    self.var_9512792ecf8ee81e = utility::function_8391781ea0784541( self.var_9512792ecf8ee81e );
    closest_target = function_47c86977a18df38b( self.var_9512792ecf8ee81e, self.origin );
    
    if ( isdefined( closest_target ) )
    {
        trigger_dist = 10000;
        
        if ( lengthsquared( closest_target.velocity ) > lengthsquared( self.velocity ) )
        {
            trigger_dist = 20000;
        }
        
        if ( distancesquared( closest_target.origin, self.origin ) < trigger_dist )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xf3a9d935, Offset: 0x538
// Size: 0xe, Type: bool
function has_binding_zombies()
{
    return self.binding_zombies.size > 0;
}

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0x9b5daaaf, Offset: 0x54f
// Size: 0x77
function function_bf731e5c7eae0684( params )
{
    if ( isplayer( params.eattacker ) && isdefined( self.bound_zombies ) && self.bound_zombies.size >= 5 )
    {
        params.eattacker namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"disciple_cultivated" );
    }
    
    function_cd1baf9ffcd917cc( self.var_86fae3f99538b683 );
    level.var_86b1a5e1af185c5d[ self getentitynumber() ] = undefined;
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0x7926bb23, Offset: 0x5ce
// Size: 0x317
function function_444a1d8601b3d4a3()
{
    var_f90cb96dac6d45f5 = function_87343acd4de8793d();
    self.var_9512792ecf8ee81e = utility::function_8391781ea0784541( self.var_9512792ecf8ee81e );
    binding_zombies = utility::get_array_of_closest( self.origin, self.var_9512792ecf8ee81e, self.bound_zombies, var_f90cb96dac6d45f5, 200 );
    self.binding_zombies = function_46f9072493651dc9( binding_zombies );
    
    if ( self.binding_zombies.size <= 0 )
    {
        self function_786bb6aa1b76c7ee( "in_bind", 0 );
        return;
    }
    
    bind_time = 2000;
    bind_time += max( 0, self.binding_zombies.size - 1 ) * 2000;
    
    foreach ( zombie in self.binding_zombies )
    {
        zombie zombie_stun::stun_ai( bind_time / 1000 + 1 );
        zombie utility::ent_flag_set( "disciple_binding" );
    }
    
    initial_bind_time = 2000;
    
    if ( self.bound_zombies.size == 0 )
    {
        initial_bind_time *= 0.25;
    }
    
    bind_time_finished = gettime() + initial_bind_time;
    
    while ( true )
    {
        waitframe();
        self.binding_zombies = function_46f9072493651dc9( self.binding_zombies );
        
        if ( self.binding_zombies.size <= 0 )
        {
            break;
        }
        
        if ( !self getaiblackboarddynamic( "in_bind" ) )
        {
            break;
        }
        
        function_eba7523133f10744();
        
        if ( gettime() > bind_time_finished )
        {
            var_310366f5854fb0aa = utility::array_get_first_item( self.binding_zombies );
            var_310366f5854fb0aa zombie_stun::clear_stun();
            var_310366f5854fb0aa utility::ent_flag_clear( "disciple_binding" );
            function_bed09be6d0f32085( var_310366f5854fb0aa );
            bind_time_additional = 2000;
            
            if ( self.bind_counter < 5 )
            {
                bind_time_additional = 500;
            }
            
            bind_time_finished = gettime() + bind_time_additional;
            self.binding_zombies = arrayremove( self.binding_zombies, var_310366f5854fb0aa );
        }
    }
    
    self function_786bb6aa1b76c7ee( "in_bind", 0 );
    
    foreach ( zombie in self.binding_zombies )
    {
        if ( isdefined( zombie ) )
        {
            zombie zombie_stun::clear_stun();
            zombie utility::ent_flag_clear( "disciple_binding" );
            zombie utility::function_32b24db3127bff40( "bound", "bound_off" );
        }
    }
    
    self.var_59d2648db909ddd2 = undefined;
    self.binding_zombies = undefined;
    
    if ( self.bind_counter >= 5 )
    {
        self.bind_cooldown = gettime() + 10000;
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0x7d6cbbb0, Offset: 0x8ed
// Size: 0x17b
function function_eba7523133f10744()
{
    var_310366f5854fb0aa = utility::array_get_first_item( self.binding_zombies );
    
    if ( isalive( var_310366f5854fb0aa ) )
    {
        var_310366f5854fb0aa utility::function_32b24db3127bff40( "bound", "bound_in" );
        yaw_to_zombie = vectortoyaw( var_310366f5854fb0aa.origin - self.origin );
        yaw_diff = absangleclamp180( yaw_to_zombie - self.angles[ 1 ] );
        self orientmode( "face angle", yaw_to_zombie );
        
        if ( yaw_diff <= 30 && self.var_385d082dbe678eb6 != var_310366f5854fb0aa )
        {
            palm_pos = self getcentroid() + ( 0, 0, 20 );
            target_pos = var_310366f5854fb0aa.origin + ( 0, 0, 50 );
            bolt_speed = getdvarfloat( @"hash_7e729eb90dd89489", 400 );
            assert( bolt_speed > 0 );
            n_time = distance( palm_pos, target_pos ) / bolt_speed;
            e_bolt = utility::spawn_model( "tag_origin", palm_pos );
            
            if ( isdefined( e_bolt ) )
            {
                utility::function_32b24db3127bff40( "sound_vo", "bind_vo" );
                playfxontag( utility::getfx( "disciple_binding_trail_fx" ), e_bolt, "tag_origin" );
                e_bolt moveto( target_pos, n_time );
                e_bolt thread function_8b6076077ffecca5( var_310366f5854fb0aa );
            }
            
            self.var_385d082dbe678eb6 = var_310366f5854fb0aa;
        }
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0x8a380d27, Offset: 0xa70
// Size: 0xa8
function function_8b6076077ffecca5( e_target )
{
    self endon( #"death" );
    n_timeout = gettime() + 15000;
    
    while ( isdefined( e_target ) && gettime() < n_timeout && e_target utility::ent_flag( "disciple_binding" ) )
    {
        dist_threshold = getdvarfloat( @"hash_dbcf496cc1cc3580", 20 );
        
        if ( distancesquared( self.origin, e_target.origin + ( 0, 0, 50 ) ) < squared( dist_threshold ) )
        {
            self delete();
            return;
        }
        
        waitframe();
    }
    
    self delete();
}

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0x509a7a3c, Offset: 0xb20
// Size: 0x165
function function_bed09be6d0f32085( zombie )
{
    if ( zombie utility::ent_flag( "disciple_bound" ) )
    {
        return;
    }
    
    callback::callback( "on_ai_bound" );
    zombie ai::set_ai_max_health( int( zombie.maxhealth * 2 ) );
    zombie.health = zombie.maxhealth;
    zombie.commander = self;
    zombie clearenemy();
    zombie clearpath();
    zombie callback::add( #"on_ai_killed", &zombie_bound_killed );
    zombie utility::ent_flag_set( "disciple_bound" );
    
    if ( issubstr( self.subclass, "zombie_disciple_skoll" ) )
    {
        zombie utility::function_32b24db3127bff40( "injected", "injected_on" );
        
        if ( issubstr( zombie.subclass, "zombie_vermin" ) )
        {
            zombie utility::function_32b24db3127bff40( "eyes", "injected_on" );
        }
        
        if ( issubstr( zombie.subclass, "zombie_base" ) )
        {
            zombie utility::function_32b24db3127bff40( "base", "base_injected_eyes" );
        }
    }
    else
    {
        zombie utility::function_32b24db3127bff40( "bound", "bound_on" );
    }
    
    zombie callback::callback( "on_ai_bound" );
    zombie thread function_75c64efd74f1a891();
    self.bound_zombies[ self.bound_zombies.size ] = zombie;
    self.bind_counter++;
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xa23161f8, Offset: 0xc8d
// Size: 0xd8
function unbind_zombie()
{
    assert( isalive( self ) );
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    callback::callback( "on_ai_unbound" );
    ai::set_ai_max_health( int( self.maxhealth / 2 ) );
    old_health = self.health;
    self.health = self.maxhealth;
    self.commander = undefined;
    
    if ( old_health < self.maxhealth )
    {
        self dodamage( self.maxhealth - old_health, self.origin );
    }
    
    self clearenemy();
    self clearpath();
    callback::remove( #"on_ai_killed", &zombie_bound_killed );
    utility::ent_flag_clear( "disciple_bound" );
    utility::function_32b24db3127bff40( "bound", "bound_off" );
}

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0x6e5fdff2, Offset: 0xd6d
// Size: 0x18e
function zombie_bound_killed( params )
{
    if ( isalive( self.commander ) && isdefined( self.commander.bound_zombies ) )
    {
        self.commander.bound_zombies = arrayremove( self.commander.bound_zombies, self );
        
        if ( self.commander.bound_zombies.size == 0 && self.commander.summon_invulnerability )
        {
            self.commander.var_a9e9679c0535fe1b = 0;
            self.commander playsound( "vox_ai_aether_disciple_vulnerable" );
            
            if ( isdefined( level.var_23e78374f5295e4 ) && isdefined( level.players ) )
            {
                foreach ( player in level.players )
                {
                    player [[ level.var_23e78374f5295e4 ]]( 0 );
                }
            }
        }
        
        if ( self.commander._blackboard.var_ea5eb773cb969ee1 != 1 )
        {
            self.commander utility::function_32b24db3127bff40( "bound_audio", "bound_zombie_killed" );
        }
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 1
// Checksum 0x1d87ddba, Offset: 0xf03
// Size: 0x16f
function function_cd1baf9ffcd917cc( var_86fae3f99538b683 )
{
    if ( isdefined( self.binding_zombies ) )
    {
        foreach ( zombie in self.binding_zombies )
        {
            if ( isdefined( zombie ) )
            {
                zombie zombie_stun::clear_stun();
                zombie utility::ent_flag_clear( "disciple_binding" );
                zombie utility::function_32b24db3127bff40( "bound", "bound_off" );
            }
        }
    }
    
    if ( isdefined( self.bound_zombies ) )
    {
        foreach ( zombie in self.bound_zombies )
        {
            if ( isalive( zombie ) )
            {
                if ( var_86fae3f99538b683 )
                {
                    zombie kill();
                    continue;
                }
                
                zombie zombie_stun::stun_ai( 0.5 );
                zombie utility::delaythread( 0.5, &unbind_zombie );
            }
        }
        
        self.bound_zombies = [];
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0
// Checksum 0xef534aa, Offset: 0x107a
// Size: 0x1d3
function function_766769d2750f286f()
{
    if ( !self.zombieaisettings.var_d3de1a9faac42deb.var_8f971c2cfc3d7b4e )
    {
        return;
    }
    
    level.var_86b1a5e1af185c5d[ self getentitynumber() ] = undefined;
    
    if ( function_87343acd4de8793d() <= 0 )
    {
        return;
    }
    
    if ( !isarray( self.var_9512792ecf8ee81e ) || self.var_9512792ecf8ee81e.size == 0 )
    {
        return;
    }
    
    if ( self.bind_disable )
    {
        return;
    }
    
    var_3c987f7ce374dbe2 = 200;
    
    foreach ( target in self.var_9512792ecf8ee81e )
    {
        if ( !isalive( target ) )
        {
            continue;
        }
        
        if ( distancesquared( self.origin, target.origin ) > squared( 1000 ) )
        {
            continue;
        }
        
        if ( zombie_disciple::function_7e89c2b6e30b1cf3( target.origin ) )
        {
            continue;
        }
        
        closest_area = function_47c86977a18df38b( level.var_86b1a5e1af185c5d, target.origin );
        
        if ( !isdefined( closest_area ) || distance2dsquared( closest_area.origin, target.origin ) > squared( closest_area.radius ) )
        {
            claim_area = spawnstruct();
            claim_area.origin = target.origin;
            claim_area.radius = 200;
            level.var_86b1a5e1af185c5d[ self getentitynumber() ] = claim_area;
            return target;
        }
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0, eflags: 0x4
// Checksum 0xa9569ff6, Offset: 0x1256
// Size: 0x13b
function private function_4f5309583e4d133f()
{
    level endon( #"game_ended" );
    
    if ( isdefined( level.var_e6db27b9375ab51f ) )
    {
        return;
    }
    
    while ( true )
    {
        level.var_e6db27b9375ab51f = [];
        potential_targets = getaispeciesarray( "all", "zombie" );
        var_75bc8205d8096ce6 = 0;
        
        foreach ( target in potential_targets )
        {
            if ( issubstr( target.subclass, "zombie_disciple" ) )
            {
                var_75bc8205d8096ce6 = 1;
                continue;
            }
            
            if ( target utility::ent_flag( "disciple_binding" ) || target utility::ent_flag( "disciple_bound" ) )
            {
                continue;
            }
            
            if ( !target getscriptablehaspart( "bound" ) )
            {
                continue;
            }
            
            level.var_e6db27b9375ab51f[ level.var_e6db27b9375ab51f.size ] = target;
        }
        
        if ( !var_75bc8205d8096ce6 )
        {
            break;
        }
        
        wait 1;
    }
    
    level.var_e6db27b9375ab51f = undefined;
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0, eflags: 0x4
// Checksum 0x81a97618, Offset: 0x1399
// Size: 0x20b
function private function_7abdb1f886503db2()
{
    self endon( #"death" );
    
    if ( !isdefined( level.disciple_bind_seek_throttle ) )
    {
        level.disciple_bind_seek_throttle = throttle::throttle_initialize( "disciple_bind_seek", 1 );
    }
    
    self.var_9512792ecf8ee81e = [];
    
    while ( true )
    {
        wait 0.1;
        throttle::throttle_wait_in_queue( level.disciple_bind_seek_throttle, self );
        self.var_9512792ecf8ee81e = [];
        
        if ( function_87343acd4de8793d() <= 0 )
        {
            continue;
        }
        
        scan_dist = 1000;
        scan_dist -= self.bound_zombies.size * 170;
        scan_dist = max( scan_dist, 200 );
        seek_targets = [];
        var_e6db27b9375ab51f = getaiarrayinradius( self.origin, scan_dist, self.team );
        
        foreach ( bind_target in var_e6db27b9375ab51f )
        {
            if ( !isalive( bind_target ) )
            {
                continue;
            }
            
            if ( bind_target.aicategory == "special" || bind_target.aicategory == "elite" || bind_target.aicategory == "hvt" || bind_target.aicategory == "boss" )
            {
                continue;
            }
            
            if ( bind_target utility::ent_flag( "disciple_binding" ) || bind_target utility::ent_flag( "disciple_bound" ) )
            {
                continue;
            }
            
            if ( !bind_target isscriptable() )
            {
                continue;
            }
            
            if ( !bind_target getscriptablehaspart( "bound" ) )
            {
                continue;
            }
            
            seek_targets[ seek_targets.size ] = bind_target;
            
            if ( seek_targets.size > self.bind_max * 2 )
            {
                break;
            }
        }
        
        self.var_9512792ecf8ee81e = sortbydistance( seek_targets, self.origin );
    }
}

// Namespace namespace_d4e7a14ee55bd048
// Params 0, eflags: 0x4
// Checksum 0x469c29bf, Offset: 0x15ac
// Size: 0x1c4
function private function_75c64efd74f1a891()
{
    self endon( #"death" );
    
    if ( !isdefined( level.disciple_bound_wander_throttle ) )
    {
        level.disciple_bound_wander_throttle = throttle::throttle_initialize( "disciple_bound_wander", 1 );
    }
    
    var_f1dd0db8025c683f = self._blackboard.var_dd1cb4e12c4c12d2;
    self._blackboard.var_dd1cb4e12c4c12d2 = -1;
    s_attractor_temp = { #team:"neutral", #origin:self.origin };
    
    while ( true )
    {
        wait 0.1;
        throttle::throttle_wait_in_queue( level.disciple_bound_wander_throttle, self );
        
        if ( !isdefined( self.commander ) )
        {
            break;
        }
        
        if ( isdefined( self.enemy ) )
        {
            continue;
        }
        
        if ( distancesquared( self.commander.origin, self.origin ) < 40000 )
        {
            continue;
        }
        
        s_attractor_temp.origin = getclosestpointonnavmesh( self.commander.origin );
        zombie_attractor_manager::function_7eb1aaa8bc7cc15( s_attractor_temp );
        
        while ( true )
        {
            wait 0.1;
            throttle::throttle_wait_in_queue( level.disciple_bound_wander_throttle, self );
            
            if ( !isdefined( self.commander ) )
            {
                break;
            }
            
            if ( isdefined( self.enemy ) )
            {
                break;
            }
            
            if ( distancesquared( s_attractor_temp.origin, self.origin ) < 10000 )
            {
                break;
            }
        }
        
        zombie_attractor_manager::function_dcfb4c31f1d97cd2( s_attractor_temp );
        self._blackboard.zombiewanderorigin = self.origin;
    }
    
    self._blackboard.var_dd1cb4e12c4c12d2 = var_f1dd0db8025c683f;
}

/#

    // Namespace namespace_d4e7a14ee55bd048
    // Params 0, eflags: 0x4
    // Checksum 0xb9653b30, Offset: 0x1778
    // Size: 0x5a, Type: dev
    function private function_6bac40e4542b29df()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x3e>", "<dev string:x49>", &force_bind );
        devgui::add_devgui_func( "<dev string:x54>", "<dev string:x5f>", &function_ca65dca18bf68700 );
        devgui::add_devgui_func( "<dev string:x6a>", "<dev string:x80>", &function_6b606a9c8bcc7c14 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_d4e7a14ee55bd048
    // Params 0, eflags: 0x4
    // Checksum 0xcce0c84, Offset: 0x17da
    // Size: 0x47, Type: dev
    function private force_bind()
    {
        disciple = ai::get_ai_closest( level.players[ 0 ].origin, undefined, undefined, "<dev string:x94>" );
        
        if ( isdefined( disciple ) )
        {
            disciple function_786bb6aa1b76c7ee( "<dev string:xa4>", 1 );
        }
    }

    // Namespace namespace_d4e7a14ee55bd048
    // Params 0, eflags: 0x4
    // Checksum 0x85b65d46, Offset: 0x1829
    // Size: 0x1a, Type: dev
    function private function_ca65dca18bf68700()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xac>", @"hash_bcd6dcf5babd2641" );
    }

    // Namespace namespace_d4e7a14ee55bd048
    // Params 0, eflags: 0x4
    // Checksum 0xe0891822, Offset: 0x184b
    // Size: 0x42, Type: dev
    function private function_6b606a9c8bcc7c14()
    {
        disciple = ai::get_ai_closest( level.players[ 0 ].origin, undefined, undefined, "<dev string:x94>" );
        
        if ( isdefined( disciple ) )
        {
            disciple function_cd1baf9ffcd917cc();
        }
    }

    // Namespace namespace_d4e7a14ee55bd048
    // Params 2, eflags: 0x4
    // Checksum 0x2ac16fd7, Offset: 0x1895
    // Size: 0x63, Type: dev
    function private debug_print_bind( text, pos )
    {
        if ( getdvarint( @"hash_bcd6dcf5babd2641", 0 ) )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:xc0>" + text, ( 1, 0, 0 ) );
        }
    }

#/
