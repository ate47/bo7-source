#using script_380194b81c38cd1a;
#using script_4bc38131d8ecd20b;
#using script_6dfd03280678b65d;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_base_abom_crawler;

// Namespace zombie_base_abom_crawler
// Params 2
// Checksum 0x940bf7a6, Offset: 0x300
// Size: 0x95
function precache( classname, aitypescriptbundle )
{
    if ( utility::flag( "init_zombie_base_abom_crawler" ) )
    {
        return;
    }
    
    utility::flag_set( "init_zombie_base_abom_crawler" );
    callback::add( "on_zombie_base_abom_crawler_spawned", &on_zombie_base_abom_crawler_spawned );
    callback::add( "on_zombie_base_abom_crawler_hvt_spawned", &on_zombie_base_abom_crawler_spawned );
    callback::add( "on_zombie_base_abom_crawler_nest_spawned", &on_zombie_base_abom_crawler_spawned );
    level._effect[ "zombie_base_abom_crawler_explode" ] = loadfxasset( "vfx_jup_ob_gameplay_zm_ai_megabomb_crawler_explo" );
    level._effect[ "zombie_base_abom_crawler_aoe" ] = loadfxasset( "vfx_jup_ob_gameplay_zm_ai_megabomb_crawler_aoe" );
}

// Namespace zombie_base_abom_crawler
// Params 1, eflags: 0x4
// Checksum 0x441c3a6f, Offset: 0x39d
// Size: 0x5a
function private on_zombie_base_abom_crawler_spawned( params )
{
    utility::thread_on_notify( "bmeleestarted", &function_6940a032b0e5224f );
    utility::thread_on_notify( "explode_death", &function_9bef1162c24d3d4a );
    callback::add( "on_zombie_ai_damaged", &function_9e6aada58ec4db50 );
    self.var_f9d9fa071693601c = 1;
    zombie_base_dismemberment::set_crawling( 1 );
    thread wander_listener();
}

// Namespace zombie_base_abom_crawler
// Params 1, eflags: 0x4
// Checksum 0x7f01f0d2, Offset: 0x3ff
// Size: 0x66
function private function_9e6aada58ec4db50( dmg_struct )
{
    if ( dmg_struct.smeansofdeath == "MOD_EXPLOSIVE" || dmg_struct.smeansofdeath == "MOD_EXPLOSIVE_BULLET" || dmg_struct.smeansofdeath == "MOD_GRENADE_SPLASH" || dmg_struct.smeansofdeath == "MOD_PROJECTILE_SPLASH" )
    {
        function_9bef1162c24d3d4a();
    }
}

// Namespace zombie_base_abom_crawler
// Params 0, eflags: 0x4
// Checksum 0x3283d59e, Offset: 0x46d
// Size: 0x30
function private function_6940a032b0e5224f()
{
    self notify( #"hash_fc4289749ece4a8a" );
    utility::function_32b24db3127bff40( "explode", "charge" );
    utility::function_32b24db3127bff40( "audio_explode", "rise" );
}

// Namespace zombie_base_abom_crawler
// Params 0, eflags: 0x4
// Checksum 0x3e5b5c00, Offset: 0x4a5
// Size: 0x89
function private function_9bef1162c24d3d4a()
{
    self notify( #"hash_fc4289749ece4a8a" );
    playfx( level._effect[ "zombie_base_abom_crawler_explode" ], self.origin );
    playfx( level._effect[ "zombie_base_abom_crawler_aoe" ], self.origin );
    utility::function_32b24db3127bff40( "audio_explode", "explode" );
    thread abom_crawler_explosion( self.origin, self.team );
    wait 0.2;
    self.nocorpse = 1;
    self kill();
}

// Namespace zombie_base_abom_crawler
// Params 2, eflags: 0x4
// Checksum 0x4b77b8d1, Offset: 0x536
// Size: 0x1ba
function private abom_crawler_explosion( position, friendly_team )
{
    damage_source = utility::spawn_script_origin();
    time_interval = 0.5;
    total_time_limit = 3.5;
    aoe_radius = 150;
    damage_tick = 10;
    initial_damage = 20;
    time_counter = 0;
    
    while ( time_counter <= total_time_limit )
    {
        /#
            if ( abom_crawler_debug() )
            {
                sphere( position, aoe_radius, ( 1, 0, 0 ) );
            }
        #/
        
        target_query = physics_querypoint( position, aoe_radius, physics_createcontents( [ "physicscontents_characterproxy" ] ), [ self ], "physicsquery_all" );
        
        foreach ( potential_target in target_query )
        {
            target_ent = potential_target[ "entity" ];
            
            if ( !isalive( target_ent ) || target_ent.team == friendly_team )
            {
                continue;
            }
            
            if ( isai( potential_target ) )
            {
                if ( potential_target.type == "zombie" )
                {
                    potential_target zombie_stun::stun_ai( time_interval );
                }
            }
            
            damage = time_counter == 0 ? initial_damage : damage_tick;
            target_ent dodamage( damage, position, damage_source );
        }
        
        wait time_interval;
        time_counter += time_interval;
    }
    
    damage_source delete();
}

// Namespace zombie_base_abom_crawler
// Params 0, eflags: 0x4
// Checksum 0x4b021a89, Offset: 0x6f8
// Size: 0x54
function private wander_listener()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"wander_start" );
        self._blackboard.zombiewanderorigin = self.origin;
        thread function_dbbb0503e1e0ba7d();
        self waittill( #"wander_end" );
    }
}

// Namespace zombie_base_abom_crawler
// Params 0, eflags: 0x4
// Checksum 0xac2d4c63, Offset: 0x754
// Size: 0xa5
function private function_dbbb0503e1e0ba7d()
{
    self endon( #"death" );
    self endon( #"wander_end" );
    search_time = 10;
    wait search_time;
    
    if ( isdefined( self.abom_parent ) )
    {
        var_23f68221f1042c10 = distance2dsquared( self.abom_parent.origin, self.origin );
        give_up_dist_threshold = 1500;
        
        if ( var_23f68221f1042c10 > give_up_dist_threshold * give_up_dist_threshold )
        {
            self kill();
        }
        
        self._blackboard.zombiewanderorigin = self.abom_parent.origin;
    }
}

// Namespace zombie_base_abom_crawler
// Params 0, eflags: 0x4
// Checksum 0xd79b40e3, Offset: 0x801
// Size: 0xbb
function private function_601a5aaa12cf536()
{
    ambient_cap = 3;
    self endon( #"death" );
    self endon( #"hash_fc4289749ece4a8a" );
    wait randomfloatrange( 1, 3 );
    played_vox = 0;
    
    while ( true )
    {
        if ( self.movemode == "stop" )
        {
            wait 1;
            continue;
        }
        
        if ( isdefined( level.zombie_ambient_count ) )
        {
            level.zombie_ambient_count++;
            
            if ( level.zombie_ambient_count < ambient_cap )
            {
                played_vox = 1;
                level thread zombie_vox::play_vox( self, "ambient_normal", "vox_ai_abom_crawl_ambient", 1 );
            }
        }
        
        if ( played_vox )
        {
            played_vox = 0;
            wait randomfloatrange( 0.1, 0.3 );
            continue;
        }
        
        wait 0.1;
    }
}

/#

    // Namespace zombie_base_abom_crawler
    // Params 0, eflags: 0x4
    // Checksum 0x1b915908, Offset: 0x8c4
    // Size: 0x16, Type: dev
    function private abom_crawler_debug()
    {
        return getdvarint( @"abom_crawler_debug", 0 ) > 0;
    }

#/
