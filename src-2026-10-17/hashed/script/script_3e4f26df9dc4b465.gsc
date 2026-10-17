#using script_16ea1b94f0f381b3;
#using script_4fa22bc28608e9bd;
#using script_6c2f6a14fa53759e;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace namespace_6825c954c0756ce0;

/#

    // Namespace namespace_6825c954c0756ce0
    // Params 0
    // Checksum 0x42861767, Offset: 0x172
    // Size: 0xc, Type: dev
    function function_63f5a985c0b6a5bb()
    {
        function_bb600c5a1f42bd87();
    }

#/

// Namespace namespace_6825c954c0756ce0
// Params 0
// Checksum 0xb200a383, Offset: 0x186
// Size: 0x3a5
function init_zombie_disciple_summon()
{
    if ( self getaiblackboarddynamic( "can_summon_zombies" ) )
    {
        self.summon_cooldown = 0;
        self.var_a24bc8ccbb8cfe25 = 0;
        self.var_8addb07108c6327b = 0;
        self.var_9361df999d755b2a = 0;
        self.var_78b7f11564f2c12b = self.zombieaisettings.var_d3de1a9faac42deb.var_3a3e1fe2a96a0b55;
        self.summon_count_total = self.zombieaisettings.var_d3de1a9faac42deb.var_465cb861342050ee;
        self.var_48425c01c743116 = self.zombieaisettings.var_d3de1a9faac42deb.var_71821e764018b6d5 * 1000;
        self.summon_invulnerability = self.zombieaisettings.var_d3de1a9faac42deb.var_d9acd43b2234339a;
        self.var_cb717f4cdfadb860 = self.zombieaisettings.var_d3de1a9faac42deb.var_4371e21436f3b288;
        self.var_a099349bf07c96cb = self.zombieaisettings.var_d3de1a9faac42deb.var_100b91767024be00;
        self.var_ea046820dce63610 = self.zombieaisettings.var_d3de1a9faac42deb.enableheadicon;
        self.var_28da8c0ac0af5f52 = self.zombieaisettings.var_d3de1a9faac42deb.headiconmaxdistance;
        thread function_42b45ccf7082f833();
        self.var_1499f13dda031383 = [];
        self.var_1499f13dda031383[ 0 ] = spawnstruct();
        self.var_1499f13dda031383[ 0 ].name = level.var_c9fa5883a2c15ba5;
        self.var_1499f13dda031383[ 0 ].count = self.var_78b7f11564f2c12b;
        self.var_1499f13dda031383[ 0 ].var_10f0b78c5a3ab69d = 0;
        self.var_1499f13dda031383[ 0 ].countmax = 0;
        var_897f7e46c75fc79c = self.zombieaisettings.var_d3de1a9faac42deb.overridespawnaitypearray;
        var_ef042502ec9d162d = 0;
        
        if ( var_897f7e46c75fc79c.size > 0 )
        {
            foreach ( index, struct in var_897f7e46c75fc79c )
            {
                self.var_1499f13dda031383[ index ] = spawnstruct();
                self.var_1499f13dda031383[ index ].name = struct.overridespawnaitype && struct.overridespawnaitype != "" ? struct.overridespawnaitype : function_b3988325430ce242( "zombie_base" );
                self.var_1499f13dda031383[ index ].count = struct.var_8027b08468f0abba;
                self.var_1499f13dda031383[ index ].var_10f0b78c5a3ab69d = struct.var_10f0b78c5a3ab69d;
                self.var_1499f13dda031383[ index ].maxcount = struct.var_4e1a9e88fe00c270;
                var_ef042502ec9d162d += struct.var_8027b08468f0abba;
            }
            
            assert( var_ef042502ec9d162d <= self.var_78b7f11564f2c12b, "<dev string:x24>" );
        }
        
        assert( self.var_1499f13dda031383.size > 0, "<dev string:x85>" );
    }
}

// Namespace namespace_6825c954c0756ce0
// Params 1
// Checksum 0x87031786, Offset: 0x533
// Size: 0xf3, Type: bool
function can_summon_zombies( n_to_spawn )
{
    if ( getdvarint( @"hash_6489e49220d549c2", 0 ) > 0 )
    {
        return false;
    }
    
    if ( self.b_in_spawn_closet )
    {
        return false;
    }
    
    if ( !utility::ent_flag( "ai_init_complete" ) )
    {
        return false;
    }
    
    if ( self.var_cb717f4cdfadb860 )
    {
        if ( self.var_8addb07108c6327b > 0 )
        {
            return false;
        }
    }
    
    if ( self.summon_cooldown > gettime() )
    {
        return false;
    }
    
    if ( !isdefined( n_to_spawn ) )
    {
        n_to_spawn = self.var_78b7f11564f2c12b;
    }
    
    if ( namespace_9d8e359c3b1041e5::getfreeaicount_sharedfunc() < n_to_spawn )
    {
        return false;
    }
    
    var_23b51ee73fa11909 = getdvarint( @"hash_34e7b88612b97d52", -1 );
    
    if ( var_23b51ee73fa11909 > -1 )
    {
        n_to_spawn = int( min( n_to_spawn, var_23b51ee73fa11909 ) );
        self.summon_count_total = var_23b51ee73fa11909;
    }
    
    if ( self.var_a24bc8ccbb8cfe25 + n_to_spawn > self.summon_count_total )
    {
        return false;
    }
    
    if ( namespace_d4e7a14ee55bd048::function_87343acd4de8793d() < n_to_spawn )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_6825c954c0756ce0
// Params 0
// Checksum 0x36e17ce, Offset: 0x62f
// Size: 0xdb
function function_42b45ccf7082f833()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"summon_loop_start" );
        
        if ( self.summon_invulnerability )
        {
            self.var_a9e9679c0535fe1b = 1;
            
            if ( isdefined( level.var_23e78374f5295e4 ) && isdefined( level.players ) )
            {
                foreach ( player in level.players )
                {
                    player [[ level.var_23e78374f5295e4 ]]( 1 );
                }
            }
        }
        
        thread function_c1f1ebd722c22f6b();
    }
}

// Namespace namespace_6825c954c0756ce0
// Params 0
// Checksum 0xa0dd9f04, Offset: 0x712
// Size: 0xc9
function function_f030cf06d682165d()
{
    self endon( #"death" );
    var_23b51ee73fa11909 = getdvarint( @"hash_34e7b88612b97d52", -1 );
    num_to_spawn = var_23b51ee73fa11909 > -1 ? var_23b51ee73fa11909 : self.var_78b7f11564f2c12b;
    spawn_points = ai::function_7bcb54b16c07d1ec( num_to_spawn, self.origin, 75, 150, 80, 1, 0, 360, 0 );
    self.summon_spawn_points = [];
    
    for ( spawn_point_index = 0; spawn_point_index < spawn_points.size ; spawn_point_index++ )
    {
        spawn_point = utility::drop_to_ground( spawn_points[ spawn_point_index ], 32, -100 );
        
        if ( isdefined( spawn_point ) )
        {
            self.summon_spawn_points[ self.summon_spawn_points.size ] = spawn_point;
        }
    }
}

// Namespace namespace_6825c954c0756ce0
// Params 1
// Checksum 0xb0e3045c, Offset: 0x7e3
// Size: 0x136
function function_279242d5165b1fad( params )
{
    disciple = self.commander;
    
    if ( isalive( disciple ) )
    {
        disciple.var_8addb07108c6327b--;
        
        if ( disciple.var_8addb07108c6327b == 0 && disciple.var_cb717f4cdfadb860 )
        {
            disciple.summon_cooldown = gettime() + disciple.var_48425c01c743116;
            disciple namespace_d4e7a14ee55bd048::function_cd1baf9ffcd917cc( disciple.var_86fae3f99538b683 );
            disciple.var_9361df999d755b2a = 0;
            disciple.var_a9e9679c0535fe1b = 0;
            
            if ( isdefined( level.var_23e78374f5295e4 ) && isdefined( level.players ) )
            {
                foreach ( player in level.players )
                {
                    player [[ level.var_23e78374f5295e4 ]]( 0 );
                }
            }
        }
    }
}

// Namespace namespace_6825c954c0756ce0
// Params 1
// Checksum 0xbe42f963, Offset: 0x921
// Size: 0x1d8, Type: bool
function function_829267885277d39f( aitype )
{
    spawn_point = utility::array_get_first_item( self.summon_spawn_points );
    spawn_angles = vectortoangles( self.origin - spawn_point );
    new_zombie = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( aitype, spawn_point, spawn_angles, self.team );
    
    if ( isdefined( new_zombie ) )
    {
        new_zombie thread namespace_9d8e359c3b1041e5::animscripted_sharedfunc( "spawn", "spawn_end", undefined, undefined, "spawn_animating" );
        new_zombie callback::add( "on_ai_killed", &function_279242d5165b1fad );
        params = spawnstruct();
        params.zombie = new_zombie;
        new_zombie callback::callback( "on_disciple_summon_spawned", params );
        
        if ( self.var_a099349bf07c96cb )
        {
            new_zombie.var_33d9fb83f023e633 = 1;
        }
        
        if ( self.var_ea046820dce63610 )
        {
            new_zombie.headicon = createheadicon( new_zombie );
            setheadiconimage( new_zombie.headicon, "jup_hud_enemy_archetype_elite_white" );
            setheadicondrawinmap( new_zombie.headicon, 1 );
            setheadiconzoffset( new_zombie.headicon, 20 );
            setheadiconsizeworld( new_zombie.headicon, "icon_medium" );
            setheadiconmaxdistance( new_zombie.headicon, self.var_28da8c0ac0af5f52 );
        }
        
        namespace_d4e7a14ee55bd048::function_bed09be6d0f32085( new_zombie );
        self.var_a24bc8ccbb8cfe25++;
        self.var_8addb07108c6327b++;
        self.summon_spawn_points = arrayremove( self.summon_spawn_points, spawn_point );
        
        if ( self._blackboard.var_ea5eb773cb969ee1 )
        {
            new_zombie zombie_utils::turn_ai( self );
            new_zombie.forceannihilate = 1;
        }
        
        new_zombie.var_5d3022108c155ed4 = #"hash_76b6069e721f145b";
        return true;
    }
    
    return false;
}

// Namespace namespace_6825c954c0756ce0
// Params 0
// Checksum 0xeacdb5d0, Offset: 0xb02
// Size: 0x1e3
function function_c1f1ebd722c22f6b()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    thread function_f030cf06d682165d();
    utility::function_32b24db3127bff40( "summon", "summon_on" );
    
    while ( true )
    {
        waitframe();
        
        if ( isarray( self.summon_spawn_points ) )
        {
            break;
        }
    }
    
    foreach ( struct in self.var_1499f13dda031383 )
    {
        aitype = struct.name;
        count = struct.count;
        i = 0;
        
        while ( i < count )
        {
            waitframe();
            
            if ( self.summon_spawn_points.size == 0 )
            {
                break;
            }
            
            if ( namespace_9d8e359c3b1041e5::getfreeaicount_sharedfunc() == 0 )
            {
                break;
            }
            
            if ( !self getaiblackboarddynamic( "in_summon" ) )
            {
                break;
            }
            
            if ( function_829267885277d39f( aitype ) )
            {
                i++;
                wait 2;
            }
        }
        
        if ( self.var_cb717f4cdfadb860 )
        {
            if ( struct.var_10f0b78c5a3ab69d && struct.count < struct.maxcount )
            {
                struct.count++;
                self.var_78b7f11564f2c12b++;
                self.bind_max++;
            }
        }
    }
    
    if ( self.var_cb717f4cdfadb860 )
    {
        self.var_9361df999d755b2a = 1;
    }
    
    utility::function_32b24db3127bff40( "summon", "summon_off" );
    self function_786bb6aa1b76c7ee( "in_summon", 0 );
    self.summon_cooldown = gettime() + self.var_48425c01c743116;
}

/#

    // Namespace namespace_6825c954c0756ce0
    // Params 0, eflags: 0x4
    // Checksum 0x1452323d, Offset: 0xced
    // Size: 0x5a, Type: dev
    function private function_bb600c5a1f42bd87()
    {
        devgui::function_9082edeb5db93280( "<dev string:xaf>" );
        devgui::add_devgui_func( "<dev string:xc9>", "<dev string:xd6>", &force_summon );
        devgui::add_devgui_func( "<dev string:xe3>", "<dev string:xf0>", &function_75c039c9d1a44478 );
        devgui::add_devgui_func( "<dev string:xfd>", "<dev string:x113>", &function_c031970186ab0ff2 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_6825c954c0756ce0
    // Params 0, eflags: 0x4
    // Checksum 0xbfde4d78, Offset: 0xd4f
    // Size: 0x47, Type: dev
    function private force_summon()
    {
        disciple = ai::get_ai_closest( level.players[ 0 ].origin, undefined, undefined, "<dev string:x12a>" );
        
        if ( isdefined( disciple ) )
        {
            disciple function_786bb6aa1b76c7ee( "<dev string:x13a>", 1 );
        }
    }

    // Namespace namespace_6825c954c0756ce0
    // Params 0, eflags: 0x4
    // Checksum 0xfb0ab666, Offset: 0xd9e
    // Size: 0x1a, Type: dev
    function private function_75c039c9d1a44478()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x144>", @"hash_30a05f00a62a2579" );
    }

    // Namespace namespace_6825c954c0756ce0
    // Params 0, eflags: 0x4
    // Checksum 0x86ad275a, Offset: 0xdc0
    // Size: 0x1a, Type: dev
    function private function_c031970186ab0ff2()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x15a>", @"hash_6489e49220d549c2" );
    }

    // Namespace namespace_6825c954c0756ce0
    // Params 2, eflags: 0x4
    // Checksum 0x943c75ae, Offset: 0xde2
    // Size: 0x63, Type: dev
    function private debug_print_summon( text, pos )
    {
        if ( getdvarint( @"hash_30a05f00a62a2579", 0 ) )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x171>" + text, ( 1, 0, 0 ) );
        }
    }

#/
