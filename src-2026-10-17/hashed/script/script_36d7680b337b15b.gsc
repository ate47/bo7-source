#using script_1187904f70bad0ea;
#using script_16ea1b94f0f381b3;
#using script_193e3e231841082f;
#using script_1a6a1f7bdb57d7ff;
#using script_6c2f6a14fa53759e;
#using scripts\common\ai;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\trace;
#using scripts\common\utility;

#namespace namespace_636cb8a8ba015294;

// Namespace namespace_636cb8a8ba015294
// Params 0
// Checksum 0x471e36ec, Offset: 0x1ef
// Size: 0x33
function init_snake_bite()
{
    self.worm_target_ent = undefined;
    self.worm_target_yaw = 0;
    self.worm_target_dist = 400;
    thread function_398073a26711516d();
    
    /#
        function_30d7615d3ccedd25();
    #/
}

// Namespace namespace_636cb8a8ba015294
// Params 3
// Checksum 0x3f9a6d41, Offset: 0x22a
// Size: 0xdc
function startsnakebite( asmname, statename, params )
{
    if ( isdefined( self.var_b014f929d0a7a12a ) && gettime() - self.var_b014f929d0a7a12a < 17000 )
    {
        self function_786bb6aa1b76c7ee( "snakebite_fast", 1 );
        return;
    }
    
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    alive_percentage = [[ self.var_3c8a8a999d3d0d2e ]]();
    is_injured = self.health < self.maxhealth * 0.5;
    
    if ( var_4912869f02b165bf >= 4 || var_4912869f02b165bf > 1 && alive_percentage >= 1 || is_injured )
    {
        self function_786bb6aa1b76c7ee( "snakebite_fast", 1 );
        return;
    }
    
    self function_786bb6aa1b76c7ee( "snakebite_fast", 0 );
}

// Namespace namespace_636cb8a8ba015294
// Params 3
// Checksum 0x9dda71b1, Offset: 0x30e
// Size: 0x37
function exitsnakebite( asmname, statename, params )
{
    self function_786bb6aa1b76c7ee( "in_snake_bite", 0 );
    self.var_b014f929d0a7a12a = gettime();
}

// Namespace namespace_636cb8a8ba015294
// Params 0, eflags: 0x4
// Checksum 0x1f26fe64, Offset: 0x34d
// Size: 0x487
function private function_c3d419f59db1a3cb()
{
    self endon( #"death" );
    self endon( #"snake_bite_end" );
    self.worm_target_yaw = 0;
    self.worm_target_dist = 400;
    self.worm_target_pos = undefined;
    is_fast = istrue( self getaiblackboarddynamic( "snakebite_fast" ) );
    playback_rate = is_fast ? 2 : 1;
    tracking_time = 4000;
    alive_percentage = [[ self.var_3c8a8a999d3d0d2e ]]();
    
    if ( alive_percentage >= 1 && self.var_6005157a6615b97f >= 7 || alive_percentage >= 0.8 && self.var_6005157a6615b97f >= 13 )
    {
        tracking_time = 6000;
    }
    
    var_676e3cc22665cd23 = gettime() + tracking_time / playback_rate;
    
    while ( gettime() < var_676e3cc22665cd23 )
    {
        if ( isdefined( self.worm_target_ent ) )
        {
            if ( !zombie_deathworm::function_c1592b3e647c3368( self.worm_target_ent.origin ) )
            {
                target_yaw = utility::getyawtospot( self.worm_target_ent.origin );
                target_yaw = clamp( target_yaw, -70, 70 );
                target_dist = distance2d( self.origin, self.worm_target_ent.origin );
                target_dist = clamp( target_dist, 471, 1886 );
                self.worm_target_yaw = target_yaw;
                self.worm_target_dist = target_dist;
                self.worm_target_pos = self.worm_target_ent.origin;
                
                /#
                    if ( function_b17866d63a9e55ed() )
                    {
                        sphere( self.worm_target_pos, 20, ( 1, 0, 0 ) );
                        bite_print( "<dev string:x24>", self.worm_target_pos );
                    }
                #/
            }
            else
            {
                /#
                    bite_print( "<dev string:x2f>", self.worm_target_ent.origin );
                #/
            }
        }
        
        self function_536f8624346a747b( self.worm_target_yaw );
        self function_ba5334b674dfb9d0( self.worm_target_dist );
        
        /#
            if ( function_b17866d63a9e55ed() )
            {
                head_pos = self gettagorigin( "<dev string:x47>" );
                line( self.origin, head_pos, ( 1, 0, 0 ) );
                bite_print( "<dev string:x4e>" + distance2d( self.origin, head_pos ), head_pos );
            }
        #/
        
        waitframe();
    }
    
    thread snake_bite_danger_zone();
    
    /#
        bite_print( "<dev string:x61>" + self.worm_target_dist );
    #/
    
    if ( self.worm_target_dist > 1000 )
    {
        return;
    }
    
    self endon( #"snake_bite_about_to_hit" );
    
    while ( true )
    {
        head_pos = self gettagorigin( "j_head" );
        head_angles = self gettagangles( "j_head" );
        head_forward = anglestoforward( head_angles );
        head_up = anglestoup( head_angles );
        forward_amount = getdvarfloat( @"hash_7174d8c71ecb56dc", 450 );
        up_amount = getdvarfloat( @"hash_d5be4cd033c8e19c", 150 );
        playerclip_contents = trace::create_playerclip_contents();
        trace = trace::ray_trace( head_pos + head_forward * forward_amount * 0.5 + head_up * up_amount, head_pos + head_forward * forward_amount + head_up * up_amount, self, playerclip_contents );
        trace2 = trace::ray_trace( head_pos + head_forward * forward_amount * 0.5 - head_up * up_amount, head_pos + head_forward * forward_amount - head_up * up_amount, self, playerclip_contents );
        trace3 = trace::ray_trace( head_pos + head_forward * forward_amount * 0.5 - head_up * up_amount, head_pos + head_forward * forward_amount * 0.5 - head_up * up_amount * 2, self, playerclip_contents );
        
        /#
            if ( function_b17866d63a9e55ed() )
            {
                trace::draw_trace( trace, ( 1, 0, 0 ), 1 );
                trace::draw_trace( trace2, ( 1, 0, 0 ), 1 );
                trace::draw_trace( trace3, ( 1, 0, 0 ), 1 );
            }
        #/
        
        if ( trace[ "hittype" ] == "hittype_world" || trace2[ "hittype" ] == "hittype_world" || trace3[ "hittype" ] == "hittype_world" )
        {
            self notify( #"snake_bite_hit" );
            self asmfireevent( self.asmname, "end" );
        }
        
        waitframe();
    }
}

// Namespace namespace_636cb8a8ba015294
// Params 0, eflags: 0x4
// Checksum 0x6f4c0e0b, Offset: 0x7dc
// Size: 0xb4
function private function_398073a26711516d()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"snake_bite_start" );
        utility::ent_flag_clear( "has_snake_bite_hit" );
        thread utility::thread_on_notify( "snake_bite_end", &on_snake_bite_end, self );
        self.worm_target_ent = self.enemy;
        
        /#
            if ( function_b17866d63a9e55ed() )
            {
                if ( isdefined( self.worm_target_ent ) )
                {
                    line( self.origin, self.worm_target_ent.origin, ( 1, 0, 0 ) );
                }
                
                bite_print( "<dev string:x8b>" );
            }
        #/
        
        thread function_c3d419f59db1a3cb();
        thread function_266d9674ebed487f();
    }
}

// Namespace namespace_636cb8a8ba015294
// Params 0, eflags: 0x4
// Checksum 0x45230b75, Offset: 0x898
// Size: 0x1f4
function private snake_bite_danger_zone()
{
    self endon( #"snake_bite_hit" );
    self endon( #"snake_bite_end" );
    self endon( #"death" );
    danger_zone_radius = 200;
    self.danger_players = [];
    
    while ( true )
    {
        if ( isdefined( self.worm_target_pos ) )
        {
            players = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( self.worm_target_pos, danger_zone_radius );
            
            /#
                if ( function_b17866d63a9e55ed() )
                {
                    sphere( self.worm_target_pos, danger_zone_radius, ( 1, 1, 0 ) );
                    bite_print( "<dev string:x9c>", self.worm_target_pos );
                }
            #/
            
            foreach ( player in players )
            {
                if ( !player utility::ent_flag( "in_snake_bite_danger_zone" ) )
                {
                    player utility::function_7c10ea82c1e305b8( "deathwormVFX", "snake_bite_danger" );
                    thread function_fc42cbf703d2821b( player );
                    player utility::ent_flag_set( "in_snake_bite_danger_zone" );
                }
            }
            
            foreach ( danger_player in self.danger_players )
            {
                if ( !arraycontains( players, danger_player ) )
                {
                    danger_player utility::function_7c10ea82c1e305b8( "deathwormVFX", "off" );
                    danger_player utility::ent_flag_clear( "in_snake_bite_danger_zone" );
                }
            }
            
            self.danger_players = players;
        }
        
        waitframe();
    }
}

// Namespace namespace_636cb8a8ba015294
// Params 1, eflags: 0x4
// Checksum 0x4f8ffd30, Offset: 0xa94
// Size: 0x7a
function private function_fc42cbf703d2821b( player )
{
    self endon( #"death" );
    utility::waittill_any( "death", "snake_bite_hit", "snake_bite_end" );
    currentstate = player getscriptablepartstate( "deathwormVFX", 1 );
    
    if ( isdefined( currentstate ) && currentstate != "swallowed" )
    {
        player utility::function_7c10ea82c1e305b8( "deathwormVFX", "off" );
    }
    
    player utility::ent_flag_clear( "in_snake_bite_danger_zone" );
}

// Namespace namespace_636cb8a8ba015294
// Params 0, eflags: 0x4
// Checksum 0xd875e0ab, Offset: 0xb16
// Size: 0x3a
function private on_snake_bite_end()
{
    ai::set_blackboard_cooldown( "snake_bite_cooldown", getdvarint( @"worm_snake_bite_cooldown", 5000 ) );
    ai::set_blackboard_cooldown( "snake_bite_close_cooldown", getdvarint( @"worm_snake_bite_close_cooldown", 2000 ) );
}

// Namespace namespace_636cb8a8ba015294
// Params 3
// Checksum 0xfd49d74c, Offset: 0xb58
// Size: 0x32f
function melee_impact( attempt_swallow, damage_radius = 400, max_damage = 420 )
{
    head_pos = self gettagorigin( "j_head" );
    assert( isdefined( head_pos ) );
    special_ai_damage = 60000;
    elite_ai_damage = 50000;
    targets = getplayersandaiarrayinradius( head_pos, damage_radius );
    
    foreach ( target in targets )
    {
        target_max_damage = max_damage;
        
        if ( isplayer( target ) )
        {
            function_c7ced5c3433b647f( target, head_pos );
        }
        else if ( isai( target ) )
        {
            target_max_damage = 0;
            
            if ( isdefined( target.aicategory ) && !attempt_swallow )
            {
                if ( target.aicategory == "normal" )
                {
                    target_max_damage = target.health;
                }
                else if ( target.aicategory == "special" )
                {
                    target_max_damage = 100000;
                }
                else if ( target.aicategory == "elite" || target.aicategory == "hvt" )
                {
                    target_max_damage = 50000;
                }
            }
        }
        
        var_cb5e9e6ad0ec3bf5 = distance2d( head_pos, target.origin );
        damage_percentage = max( ( damage_radius - var_cb5e9e6ad0ec3bf5 ) / damage_radius, 0 );
        var_34323c3349a6f257 = math::remap( damage_percentage, 0, 1, 10, target_max_damage );
        
        if ( isalive( target ) )
        {
            if ( attempt_swallow )
            {
                if ( self.var_60d920f687db580a && self.var_6005157a6615b97f > 1 && target.armorhealth > 0 )
                {
                    target dodamage( var_34323c3349a6f257, head_pos, self, self, "MOD_MELEE" );
                }
                
                swallowed = zombie_deathworm::function_e918d59b09e09aa9( target, head_pos, var_34323c3349a6f257 );
                
                if ( !swallowed )
                {
                    target dodamage( var_34323c3349a6f257, head_pos, self, self, "MOD_MELEE" );
                }
            }
            else if ( isai( target ) )
            {
                target zombie_knockdown::knockdown_ai( head_pos );
                target dodamage( var_34323c3349a6f257, head_pos, self, self, "MOD_MELEE" );
            }
            else if ( isplayer( target ) )
            {
                target dodamage( var_34323c3349a6f257, head_pos, self, self, "MOD_MELEE" );
            }
        }
        
        /#
            bite_print( "<dev string:xa8>" + var_34323c3349a6f257, target.origin + ( 0, 0, 70 ) );
        #/
    }
    
    self setscriptablepartstate( "audio", "snake_bite_impact" );
    earthquake( 0.8, 0.4, head_pos, 1000 );
    
    /#
        if ( function_b17866d63a9e55ed() )
        {
            iprintlnbold( "<dev string:xb2>" );
            bite_print( "<dev string:xbf>" + targets.size + "<dev string:xc4>", head_pos );
            sphere( head_pos, damage_radius, ( 1, 0, 0 ) );
        }
    #/
}

// Namespace namespace_636cb8a8ba015294
// Params 0, eflags: 0x4
// Checksum 0x71bfb341, Offset: 0xe8f
// Size: 0x70
function private function_266d9674ebed487f()
{
    self endon( #"death" );
    self endon( #"snake_bite_start" );
    self waittill( #"snake_bite_hit" );
    utility::ent_flag_set( "has_snake_bite_hit" );
    damage = 320;
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    
    if ( var_4912869f02b165bf >= 13 )
    {
        damage = 600;
    }
    
    melee_impact( 1, undefined, damage );
}

// Namespace namespace_636cb8a8ba015294
// Params 2, eflags: 0x4
// Checksum 0xaf0944a4, Offset: 0xf07
// Size: 0x3b
function private function_c7ced5c3433b647f( player, damage_point )
{
    player utility::knockback_flat( player.origin - damage_point, 1600 );
    player playrumbleonentity( "heavy_1s" );
}

/#

    // Namespace namespace_636cb8a8ba015294
    // Params 0
    // Checksum 0x33ee3102, Offset: 0xf4a
    // Size: 0x44, Type: dev
    function function_30d7615d3ccedd25()
    {
        devgui::function_9082edeb5db93280( "<dev string:xcd>" );
        devgui::add_devgui_func( "<dev string:xe9>", "<dev string:xfa>", &function_c2a2e56a776e49fd );
        devgui::add_devgui_func( "<dev string:x10b>", "<dev string:x11c>", &function_bc80fd047d551b8c );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_636cb8a8ba015294
    // Params 0, eflags: 0x4
    // Checksum 0x310abc81, Offset: 0xf96
    // Size: 0x48, Type: dev
    function private function_c2a2e56a776e49fd()
    {
        worm = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x12d>" );
        
        if ( !isdefined( worm ) )
        {
            return;
        }
        
        worm function_786bb6aa1b76c7ee( "<dev string:x13e>", 1 );
    }

    // Namespace namespace_636cb8a8ba015294
    // Params 0, eflags: 0x4
    // Checksum 0xc747b4aa, Offset: 0xfe6
    // Size: 0x16, Type: dev
    function private function_b17866d63a9e55ed()
    {
        return getdvarint( @"hash_4c15f2ff8e7fd1bf", 0 ) > 0;
    }

    // Namespace namespace_636cb8a8ba015294
    // Params 0, eflags: 0x4
    // Checksum 0xc70492cb, Offset: 0x1004
    // Size: 0x1a, Type: dev
    function private function_bc80fd047d551b8c()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x14c>", @"hash_4c15f2ff8e7fd1bf" );
    }

    // Namespace namespace_636cb8a8ba015294
    // Params 2, eflags: 0x4
    // Checksum 0x3bd1379d, Offset: 0x1026
    // Size: 0x5b, Type: dev
    function private bite_print( text, pos )
    {
        if ( function_b17866d63a9e55ed() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x167>" + text, ( 1, 0, 0 ) );
        }
    }

#/
