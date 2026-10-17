#using script_1a6a1f7bdb57d7ff;
#using script_290c63919fb4afde;
#using script_3ff59e7e6c39c05f;
#using script_6c2f6a14fa53759e;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace zombie_phobos_tail_slam;

// Namespace zombie_phobos_tail_slam
// Params 1
// Checksum 0xed4ef27, Offset: 0xd0
// Size: 0xc
function function_f07df5f77bb2a165( var_4b4d72d84afd1ebd )
{
    
}

/#

    // Namespace zombie_phobos_tail_slam
    // Params 0
    // Checksum 0x737c1595, Offset: 0xe4
    // Size: 0xc, Type: dev
    function function_9617329bae4ffaf4()
    {
        function_e098d3cdcc071a66();
    }

#/

// Namespace zombie_phobos_tail_slam
// Params 0
// Checksum 0x297cfdd4, Offset: 0xf8
// Size: 0x2a
function init_phobos_tail_slam()
{
    assert( isdefined( self.zombieaisettings.var_d3de1a9faac42deb ), "<dev string:x24>" );
    thread function_fffcbc4576ccb80c();
}

// Namespace zombie_phobos_tail_slam
// Params 0, eflags: 0x4
// Checksum 0xc452d2af, Offset: 0x12a
// Size: 0x2a
function private function_fffcbc4576ccb80c()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"phobos_tail_slam_start" );
        function_77320b2a2628d6cd();
    }
}

// Namespace zombie_phobos_tail_slam
// Params 0, eflags: 0x4
// Checksum 0xb1ea3ef2, Offset: 0x15c
// Size: 0x3a
function private function_77320b2a2628d6cd()
{
    self endon( #"death" );
    self endon( #"bmeleeended" );
    
    while ( true )
    {
        utility::waittill_notify_or_timeout( "hit", 1.25 );
        thread function_9fc58a162b42a8a2();
    }
}

// Namespace zombie_phobos_tail_slam
// Params 0, eflags: 0xc
// Checksum 0x25d79b44, Offset: 0x19e
// Size: 0x359
function private function_9fc58a162b42a8a2()
{
    self notify( #"hash_111f07fe6089c429" );
    self endon( #"hash_111f07fe6089c429" );
    var_f6f39fe0e57c49c2 = self gettagorigin( "j_tail3" );
    tail_pos = var_f6f39fe0e57c49c2 + anglestoforward( self gettagangles( "j_tail3" ) ) * 0;
    ground_center = getgroundposition( tail_pos, 15 );
    range = 300;
    tail_slam_damage = self.zombieaisettings.var_d3de1a9faac42deb.var_312803b9b764a41d ?? 120;
    tail_slam_outer = self.zombieaisettings.var_d3de1a9faac42deb.var_f2b01462ff599805 ?? 60;
    tail_slam_scriptable_state = "on";
    var_67f64562426f0bd2 = gettime() - ( self.var_820f12baf6569517 ?? 0 );
    
    if ( var_67f64562426f0bd2 < 2000 )
    {
        tail_slam_scriptable_state = "on_small";
    }
    
    self.var_820f12baf6569517 = gettime();
    utility::function_7c10ea82c1e305b8( "tail_slam", tail_slam_scriptable_state );
    earthquake( 0.4, 3, ground_center, range + 100 );
    hit_ents = function_797bdec91c5f796e( self, ground_center, range );
    outer_hit_ents = function_797bdec91c5f796e( self, ground_center, range * 1 );
    var_8cc756edb2e0df49 = arrayremove( outer_hit_ents, hit_ents );
    
    foreach ( hit_ent in hit_ents )
    {
        if ( hit_ent utility::ent_flag( "tail_slammed" ) && !hit_ent isonground() )
        {
            continue;
        }
        
        if ( zombie_phobos_collision::is_player_attached( hit_ent ) )
        {
            continue;
        }
        
        if ( hit_ent.inlaststand )
        {
            continue;
        }
        
        hit_ent utility::ent_flag_set( "tail_slammed" );
        hit_ent thread utility::ent_flag_clear_delayed( "tail_slammed", 10 );
        
        if ( isplayer( hit_ent ) )
        {
            hit_ent dodamage( tail_slam_damage, self.origin, self, self, "MOD_MELEE" );
            knockback_player( self, hit_ent );
            hit_ent playrumbleonentity( "heavy_2s" );
            continue;
        }
        
        if ( isai( hit_ent ) )
        {
            hit_ent zombie_knockdown::knockdown_ai( ground_center, 300, 50 );
            
            if ( hit_ent.team != self.team )
            {
                hit_ent dodamage( tail_slam_damage, self.origin, self, self, "MOD_MELEE" );
            }
        }
    }
    
    foreach ( hit_ent in var_8cc756edb2e0df49 )
    {
        if ( hit_ent utility::ent_flag( "tail_slammed" ) )
        {
            continue;
        }
        
        if ( zombie_phobos_collision::is_player_attached( hit_ent ) )
        {
            continue;
        }
        
        if ( isplayer( hit_ent ) )
        {
            hit_ent dodamage( tail_slam_outer, self.origin, self, self, "MOD_MELEE" );
            function_3b6d1c4ba861b9a7( self, hit_ent );
        }
    }
}

// Namespace zombie_phobos_tail_slam
// Params 3, eflags: 0x4
// Checksum 0x4f796ac7, Offset: 0x4ff
// Size: 0x119
function private function_797bdec91c5f796e( phobos, center, radius )
{
    targets = [];
    potential_targets = getplayersandaiarrayinradius( center, radius );
    
    foreach ( target in potential_targets )
    {
        if ( target == phobos )
        {
            continue;
        }
        
        if ( isplayer( target ) && target.team == phobos.team )
        {
            continue;
        }
        
        targets[ targets.size ] = target;
        
        /#
            if ( debug_tail_slam() )
            {
                line( target getcentroid(), center, ( 1, 0, 0 ) );
            }
        #/
    }
    
    /#
        if ( debug_tail_slam() )
        {
            utility::draw_circle( center, radius );
        }
    #/
    
    return targets;
}

// Namespace zombie_phobos_tail_slam
// Params 2, eflags: 0x4
// Checksum 0x80fe36bc, Offset: 0x621
// Size: 0xc0
function private knockback_player( phobos, player )
{
    player_velocity = player getvelocity();
    to_player = undefined;
    
    if ( length( player_velocity ) > 200 && length2dsquared( player_velocity ) > 0 )
    {
        to_player = vectornormalize2( player_velocity );
    }
    else
    {
        to_player = vectornormalize2( player.origin - phobos.origin );
    }
    
    var_5353cc84fc825d3 = anglestoright( vectortoangles( to_player ) );
    knockback_dir = rotatepointaroundvector( var_5353cc84fc825d3, to_player, getdvarfloat( @"hash_b27c04183d179395", 75 ) );
    player knockback( knockback_dir, getdvarfloat( @"hash_8974c77c4c4563cc", 700 ), 1 );
}

// Namespace zombie_phobos_tail_slam
// Params 2, eflags: 0x4
// Checksum 0x1169ae2e, Offset: 0x6e9
// Size: 0x6f
function private function_3b6d1c4ba861b9a7( phobos, player )
{
    to_player = vectornormalize2( player.origin - phobos.origin );
    var_5353cc84fc825d3 = anglestoright( vectortoangles( to_player ) );
    knockback_dir = rotatepointaroundvector( var_5353cc84fc825d3, to_player, 30 );
    player knockback( knockback_dir, 100, 1 );
}

/#

    // Namespace zombie_phobos_tail_slam
    // Params 0, eflags: 0x4
    // Checksum 0xb8be2daa, Offset: 0x760
    // Size: 0x44, Type: dev
    function private function_e098d3cdcc071a66()
    {
        devgui::function_9082edeb5db93280( "<dev string:x98>" );
        devgui::add_devgui_func( "<dev string:xb0>", "<dev string:xc0>", &force_tail_slam );
        devgui::add_devgui_func( "<dev string:xd7>", "<dev string:xe7>", &function_6382a892bfba071f );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_phobos_tail_slam
    // Params 1, eflags: 0x4
    // Checksum 0x59c73f84, Offset: 0x7ac
    // Size: 0x4b, Type: dev
    function private force_tail_slam( params )
    {
        phobos = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:xfe>" );
        
        if ( isdefined( phobos ) )
        {
            phobos namespace_2823e49aa0908abb::function_e5b80d1457b1280();
        }
    }

    // Namespace zombie_phobos_tail_slam
    // Params 1, eflags: 0x4
    // Checksum 0x2af58fe7, Offset: 0x7ff
    // Size: 0x24, Type: dev
    function private function_6382a892bfba071f( params )
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x10c>", @"hash_cc61e29715266e9c" );
    }

    // Namespace zombie_phobos_tail_slam
    // Params 0, eflags: 0x4
    // Checksum 0xaed7f83c, Offset: 0x82b
    // Size: 0x16, Type: dev
    function private debug_tail_slam()
    {
        return getdvarint( @"hash_cc61e29715266e9c", 0 ) > 0;
    }

#/
