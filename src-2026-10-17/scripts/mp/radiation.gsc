#using script_49e4a4c208f44b76;
#using script_4f9ce8d249a99f4a;
#using script_636b34758a0fb434;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\gasmask;
#using scripts\common\math;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\mp\armor;
#using scripts\mp\emp_debuff;
#using scripts\mp\operator;

#namespace radiation;

// Namespace radiation
// Params 0, eflags: 0x5
// Checksum 0x9ed2a769, Offset: 0x212
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"radiation", undefined, &function_552428f5ac9f6827, &function_2d60b4d1db2d5e1a );
}

// Namespace radiation
// Params 0, eflags: 0x4
// Checksum 0x4e8380d, Offset: 0x237
// Size: 0xfd
function private function_552428f5ac9f6827()
{
    level.radiation = spawnstruct();
    level.radiation.instances = [];
    level.radiation.damageweapon = getdvar( @"hash_f08ac6061fce744a", "danger_circle_br" );
    level.radiation.var_f5ee7dc71b9a24d4 = getdvarint( @"hash_229c4da4191ab249", 1 ) != 0;
    level.radiation.coughchance = getdvarint( @"hash_1e0f719f2b363047", 20 );
    level.radiation.coughcooldown = getdvarint( @"hash_7f28cb77cb8b8417", 5 );
    utility::registersharedfunc( #"radiation", #"radiation_isinit", &function_39a3da372d10f18a );
    utility::registersharedfunc( #"radiation", #"radiation_signeddistancefromradiationcircle", &function_3667f46ce3bad59d );
    utility::flag_set( "radiation_initialized" );
}

// Namespace radiation
// Params 0, eflags: 0x4
// Checksum 0x95253c33, Offset: 0x33c
// Size: 0x1f
function private function_2d60b4d1db2d5e1a()
{
    /#
        level.radiation.debug_selected = undefined;
        thread function_e9101b881c1e5439();
    #/
}

// Namespace radiation
// Params 6
// Checksum 0x9050493f, Offset: 0x363
// Size: 0x16e
function create( origin, radius, var_2e9a9a1ddaf4e640, quest_circle_template, show_br_circle, inverted )
{
    radius = float( radius );
    instance = spawnstruct();
    instance.origin = origin;
    instance.angles = ( 0, 0, 0 );
    instance.active = 1;
    instance.radius = radius;
    instance.radiussq = squared( radius );
    instance.tickrate = var_2e9a9a1ddaf4e640;
    instance.inverted = inverted;
    instance.damagebase = 0;
    
    if ( show_br_circle )
    {
        instance.brcircle = spawnbrcircle( origin[ 0 ], origin[ 1 ], radius );
    }
    
    if ( isdefined( quest_circle_template ) )
    {
        instance game_utility::questcircle_create( quest_circle_template, origin, radius );
        instance game_utility::questcircle_showtoall();
    }
    
    instance thread function_aa2c1f7c3c94a788();
    instance thread function_f85bc03b027e9b65();
    instance callback::add( "player_entered_radiation", &function_625dd0c2f2aaaf40 );
    instance callback::add( "player_exited_radiation", &function_7464599c0ca1d7ec );
    level.radiation.instances[ level.radiation.instances.size ] = instance;
    return instance;
}

// Namespace radiation
// Params 3
// Checksum 0xc766ea84, Offset: 0x4da
// Size: 0xdd
function transform( new_origin, new_radius, duration )
{
    if ( new_origin == self.origin && new_radius == self.radius )
    {
        return;
    }
    
    new_radius = float( new_radius );
    callback::callback( "radiation_transform_started" );
    self notify( #"radiation_transform_started" );
    self.transforming = 1;
    self.var_529f706a694afa7e = 0;
    self.var_3cc42b91d0c21ef = self.origin;
    self.var_d2c71adb0574e513 = self.radius;
    self.var_9990052340fe6496 = duration;
    self.var_16724ff093cee252 = new_origin;
    self.var_735f96414bfa5936 = new_radius;
    
    if ( isdefined( self.brcircle ) )
    {
        self.brcircle brcirclemoveto( new_origin[ 0 ], new_origin[ 1 ], new_radius, duration );
    }
}

// Namespace radiation
// Params 0
// Checksum 0x71936250, Offset: 0x5bf
// Size: 0xbf
function destroy()
{
    assert( self.active, "<dev string:x24>" );
    self.active = 0;
    callback::callback( "radiation_destroyed" );
    self notify( #"radiation_destroyed" );
    
    if ( game_utility::questcircle_exists() )
    {
        game_utility::questcircle_delete();
    }
    
    if ( isdefined( self.brcircle ) )
    {
        self.brcircle delete();
    }
    
    level.radiation.instances = arrayremove( level.radiation.instances, self );
    
    /#
        if ( self == level.radiation.debug_selected )
        {
            level.radiation.debug_selected = undefined;
        }
    #/
}

// Namespace radiation
// Params 3
// Checksum 0x6ccaeae, Offset: 0x686
// Size: 0x44
function set_vision_set( vision_set, transition_time, inside )
{
    self.visionset = vision_set;
    self.visionsetinside = inside ?? 1;
    self.var_5658dafc2b6a1118 = transition_time;
}

// Namespace radiation
// Params 4
// Checksum 0xaa5afff4, Offset: 0x6d2
// Size: 0x5c
function set_radar_scramble( should_scramble, scramble_level, is_jammer, inside )
{
    self.radarscramble = should_scramble;
    self.var_b7f75c78edeef401 = scramble_level;
    self.var_e6ace642339c2f41 = is_jammer ?? 0;
    self.var_5b9b5dabae9769 = inside ?? 1;
}

// Namespace radiation
// Params 1
// Checksum 0x42c9ff3c, Offset: 0x736
// Size: 0x23
function set_tick_rate( tick_rate )
{
    assert( tick_rate > 0 );
    self.tickrate = tick_rate;
}

// Namespace radiation
// Params 5
// Checksum 0xa50c2744, Offset: 0x761
// Size: 0xa6
function set_damage( base_damage, damage_increase, damage_increase_rate, damage_increase_max, var_8cc82c0aab989537 )
{
    self.damagebase = float( base_damage );
    
    if ( isdefined( damage_increase ) && isdefined( damage_increase_rate ) )
    {
        assert( damage_increase != 0 && damage_increase_rate > 0, "<dev string:x70>" );
        self.damageincrease = float( damage_increase );
        self.var_80a80a635d565349 = float( damage_increase_rate );
        self.var_2b5cac0af83c3a4b = isdefined( damage_increase_max ) ? float( damage_increase_max ) : undefined;
        self.var_901e1b2081e1f305 = var_8cc82c0aab989537;
    }
}

// Namespace radiation
// Params 0
// Checksum 0x49061b8f, Offset: 0x80f
// Size: 0x30
function function_dd353ada13e719d2()
{
    if ( !self.transforming )
    {
        return;
    }
    
    return distance2d( self.var_16724ff093cee252, self.var_3cc42b91d0c21ef ) / self.var_9990052340fe6496;
}

// Namespace radiation
// Params 0
// Checksum 0xd815f855, Offset: 0x848
// Size: 0x2d
function function_76e0602fb7f0447e()
{
    if ( !self.transforming )
    {
        return;
    }
    
    return ( self.var_735f96414bfa5936 - self.var_d2c71adb0574e513 ) / self.var_9990052340fe6496;
}

// Namespace radiation
// Params 1
// Checksum 0x7c5cc749, Offset: 0x87e
// Size: 0x4f
function is_position_inside( pos )
{
    if ( self.inverted )
    {
        return ( distance2dsquared( pos, self.origin ) > self.radiussq );
    }
    
    return distance2dsquared( pos, self.origin ) < self.radiussq;
}

// Namespace radiation
// Params 1
// Checksum 0xdc7a3972, Offset: 0x8d5
// Size: 0x25
function function_1cfc1ecb93409d26( pos )
{
    return distance2d( pos, self.origin ) - self.radius;
}

// Namespace radiation
// Params 1
// Checksum 0x2d09b61a, Offset: 0x903
// Size: 0x54
function function_ca7a405fde79979f( pos )
{
    if ( !self.transforming )
    {
        return;
    }
    
    target_radius = distance2d( pos, self.var_3cc42b91d0c21ef );
    radius_speed = function_76e0602fb7f0447e();
    return ( target_radius - self.radius ) / radius_speed;
}

// Namespace radiation
// Params 0
// Checksum 0x96bf24c0, Offset: 0x960
// Size: 0x11b
function function_6104e81286096d0()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( !player::isreallyalive() )
    {
        return;
    }
    
    if ( self.isjuggernaut )
    {
        return;
    }
    
    if ( gettime() < self.var_1121b62c259b160f )
    {
        return;
    }
    
    self.var_1121b62c259b160f = gettime() + level.radiation.coughcooldown;
    
    if ( !isai( self ) )
    {
        self playsoundtoplayer( #"gas_player_cough", self, self );
    }
    
    var_553ba779c31e442 = "allies_male_cough";
    defaultoperatorteam = operator::function_1e32019139bf7206();
    
    if ( defaultoperatorteam == "axis" )
    {
        if ( operator::isfemale() )
        {
            var_553ba779c31e442 = "axis_female_cough";
        }
        else
        {
            var_553ba779c31e442 = "axis_male_cough";
        }
    }
    else if ( operator::isfemale() )
    {
        var_553ba779c31e442 = "allies_female_cough";
    }
    else
    {
        var_553ba779c31e442 = "allies_male_cough";
    }
    
    var_8d27e0901584cdf7 = randomint( game[ "dialogue" ][ var_553ba779c31e442 ].size );
    coughsoundalias = game[ "dialogue" ][ var_553ba779c31e442 ][ var_8d27e0901584cdf7 ];
    self playsound( coughsoundalias, self, self );
}

// Namespace radiation
// Params 0
// Checksum 0x4183ac96, Offset: 0xa83
// Size: 0xc, Type: bool
function function_39a3da372d10f18a()
{
    return isdefined( level.radiation );
}

// Namespace radiation
// Params 1
// Checksum 0xa82f4259, Offset: 0xa98
// Size: 0x6c
function function_3667f46ce3bad59d( pos )
{
    closest_distance = 999999;
    sorted_instances = sortbydistance( level.radiation.instances, pos );
    
    if ( sorted_instances.size > 0 )
    {
        return ( distance2d( pos, sorted_instances[ 0 ].origin ) - sorted_instances[ 0 ].radius );
    }
    
    return closest_distance;
}

// Namespace radiation
// Params 0, eflags: 0x4
// Checksum 0x8cb120f0, Offset: 0xb0d
// Size: 0x139
function private function_aa2c1f7c3c94a788()
{
    level endon( #"game_ended" );
    self endon( #"radiation_destroyed" );
    
    while ( self.active )
    {
        waitframe();
        
        if ( self.transforming )
        {
            progress = self.var_529f706a694afa7e / self.var_9990052340fe6496;
            
            if ( progress >= 1 )
            {
                progress = 1;
            }
            
            self.origin = vectorlerp( self.var_3cc42b91d0c21ef, self.var_16724ff093cee252, progress );
            self.radius = math::lerp( self.var_d2c71adb0574e513, self.var_735f96414bfa5936, progress );
            self.radiussq = self.radius * self.radius;
            
            if ( game_utility::questcircle_exists() )
            {
                game_utility::questcircle_move( self.origin );
                game_utility::function_d46d8731ed9d281( self.radius );
            }
            
            callback::callback( "radiation_transform_update" );
            self.var_529f706a694afa7e += level.framedurationseconds;
            
            if ( progress >= 1 )
            {
                self.transforming = undefined;
                callback::callback( "radiation_transform_completed" );
            }
        }
    }
}

// Namespace radiation
// Params 0, eflags: 0x4
// Checksum 0xc91d23e4, Offset: 0xc4e
// Size: 0x41d
function private function_f85bc03b027e9b65()
{
    level endon( #"game_ended" );
    self endon( #"radiation_destroyed" );
    self.player_enter_times = [];
    self.var_d543cc3cb6726b5d = [];
    
    while ( self.active )
    {
        wait self.tickrate;
        
        foreach ( player in level.players )
        {
            player_entity_number = player getentitynumber();
            player_inside_radiation = is_position_inside( player.origin );
            
            if ( player_inside_radiation )
            {
                if ( !isdefined( self.player_enter_times[ player_entity_number ] ) )
                {
                    self.player_enter_times[ player_entity_number ] = gettime();
                    self.var_d543cc3cb6726b5d[ player_entity_number ] = 0;
                    callback::callback( "player_entered_radiation", { #player:player } );
                }
            }
            else if ( isdefined( self.player_enter_times[ player_entity_number ] ) )
            {
                self.player_enter_times[ player_entity_number ] = undefined;
                self.var_d543cc3cb6726b5d[ player_entity_number ] = undefined;
                callback::callback( "player_exited_radiation", { #player:player } );
            }
            
            if ( !isalive( player ) )
            {
                continue;
            }
            
            if ( callback::response( 0, "player_should_immune_damage", { #player:player } ) )
            {
                continue;
            }
            
            damage = 0;
            
            if ( !player_inside_radiation || player.plotarmor )
            {
                damage = 0;
            }
            else if ( !self.var_901e1b2081e1f305 && isdefined( self.damageincrease ) && isdefined( self.var_80a80a635d565349 ) )
            {
                damage = self.damagebase + function_e304d19b9d6175b9( player_entity_number );
            }
            else
            {
                damage = self.damagebase;
            }
            
            if ( gasmask::hasgasmask( player ) && !player.gasmaskswapinprogress )
            {
                if ( player_inside_radiation )
                {
                    if ( isdefined( level.var_548004405d16dcf8 ) )
                    {
                        player [[ level.var_548004405d16dcf8 ]]( "radiation" );
                    }
                    
                    if ( damage > 0 )
                    {
                        player gasmask::processdamage( damage );
                        damage = 0;
                    }
                }
                else if ( isdefined( level.var_7518fcc73a6d4676 ) )
                {
                    player [[ level.var_7518fcc73a6d4676 ]]( "radiation" );
                }
            }
            
            if ( player_inside_radiation && !player.plotarmor && self.var_901e1b2081e1f305 && isdefined( self.damageincrease ) && isdefined( self.var_80a80a635d565349 ) )
            {
                damage = self.damagebase + function_e304d19b9d6175b9( player_entity_number );
            }
            
            if ( damage > 0 )
            {
                if ( self.var_d543cc3cb6726b5d[ player_entity_number ] > 0 )
                {
                    damage += self.var_d543cc3cb6726b5d[ player_entity_number ];
                    self.var_d543cc3cb6726b5d[ player_entity_number ] = 0;
                }
                
                damage_int = int( damage );
                damage_diff = damage - float( damage_int );
                
                if ( damage_diff > 0.01 )
                {
                    self.var_d543cc3cb6726b5d[ player_entity_number ] = damage_diff;
                }
                
                if ( damage_int <= 0 )
                {
                    assertmsg( "<dev string:xe5>" + damage + "<dev string:xfe>" + self.damagebase + "<dev string:x157>" );
                    damage_int = self.damagebase;
                }
                
                player dodamage( damage_int, player.origin, player, undefined, "MOD_TRIGGER_HURT", level.radiation.damageweapon );
                player armor::damagearmor( damage_int, undefined, player, "MOD_TRIGGER_HURT" );
                
                if ( randomint( 100 ) < level.radiation.coughchance )
                {
                    player function_6104e81286096d0();
                }
                
                player callback::callback( "radiation_damage_player", { #damage:damage_int, #radiation:self } );
            }
        }
    }
}

// Namespace radiation
// Params 1, eflags: 0x4
// Checksum 0x78ee5647, Offset: 0x1073
// Size: 0xa3
function private function_e304d19b9d6175b9( player_entity_number )
{
    assert( isdefined( self.player_enter_times[ player_entity_number ] ) );
    assert( isdefined( self.damageincrease ) && isdefined( self.var_80a80a635d565349 ) );
    secondsinside = ( gettime() - self.player_enter_times[ player_entity_number ] ) / 1000;
    IncreaseAmount = self.damageincrease * int( secondsinside / self.var_80a80a635d565349 );
    
    if ( IncreaseAmount > self.var_2b5cac0af83c3a4b )
    {
        IncreaseAmount = self.var_2b5cac0af83c3a4b;
    }
    
    return IncreaseAmount;
}

// Namespace radiation
// Params 1
// Checksum 0x4014bc03, Offset: 0x111f
// Size: 0xc6
function function_625dd0c2f2aaaf40( params )
{
    player = params.player;
    
    if ( isdefined( self.visionset ) )
    {
        if ( self.visionsetinside )
        {
            player vision_utility::function_89d3efe42060754c( self.visionset, self.var_5658dafc2b6a1118 );
        }
        else
        {
            player vision_utility::function_6cb9d8e0202ee81( self.visionset, self.var_5658dafc2b6a1118 );
        }
    }
    
    if ( self.radarscramble )
    {
        if ( self.var_5b9b5dabae9769 )
        {
            player emp_debuff::play_scramble( self.var_b7f75c78edeef401, self.var_e6ace642339c2f41 );
            return;
        }
        
        player emp_debuff::stop_scramble( self.var_b7f75c78edeef401, self.var_e6ace642339c2f41 );
    }
}

// Namespace radiation
// Params 1
// Checksum 0x6dc9faaf, Offset: 0x11ed
// Size: 0xc6
function function_7464599c0ca1d7ec( params )
{
    player = params.player;
    
    if ( isdefined( self.visionset ) )
    {
        if ( self.visionsetinside )
        {
            player vision_utility::function_6cb9d8e0202ee81( self.visionset, self.var_5658dafc2b6a1118 );
        }
        else
        {
            player vision_utility::function_89d3efe42060754c( self.visionset, self.var_5658dafc2b6a1118 );
        }
    }
    
    if ( self.radarscramble )
    {
        if ( self.var_5b9b5dabae9769 )
        {
            player emp_debuff::stop_scramble( self.var_b7f75c78edeef401, self.var_e6ace642339c2f41 );
            return;
        }
        
        player emp_debuff::play_scramble( self.var_b7f75c78edeef401, self.var_e6ace642339c2f41 );
    }
}

/#

    // Namespace radiation
    // Params 0, eflags: 0x4
    // Checksum 0xff972063, Offset: 0x12bb
    // Size: 0x1ee, Type: dev
    function private function_e9101b881c1e5439()
    {
        devgui::function_9082edeb5db93280( "<dev string:x15a>" );
        devgui::add_devgui_func( "<dev string:x16b>", "<dev string:x17c>", &function_ae74a25d373a3d2d );
        devgui::add_devgui_func( "<dev string:x197>", "<dev string:x1a8>", &function_9acdbcddd716d0f5 );
        devgui::add_devgui_func( "<dev string:x1c3>", "<dev string:x1d1>", &debug_select );
        devgui::add_devgui_func( "<dev string:x1e2>", "<dev string:x1f4>", &debug_deselect );
        devgui::add_devgui_func( "<dev string:x207>", "<dev string:x217>", &function_8b61ef883ae5aecf );
        devgui::function_cd4e263c1f3018ae( "<dev string:x231>", "<dev string:x24d>", &function_b9eea9f6cf3d7edf );
        devgui::function_cd4e263c1f3018ae( "<dev string:x26e>", "<dev string:x28a>", &function_b9eea9f6cf3d7edf );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2aa>", "<dev string:x2c9>", &function_b9eea9f6cf3d7edf );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2ed>", "<dev string:x310>", &function_fee517814fd7f539 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x333>", "<dev string:x356>", &function_fee517814fd7f539 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x379>", "<dev string:x39c>", &function_fee517814fd7f539 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x3bf>", "<dev string:x3e2>", &function_fee517814fd7f539 );
        devgui::add_devgui_func( "<dev string:x405>", "<dev string:x42c>", &function_ffe28724af750aa5 );
        devgui::add_devgui_func( "<dev string:x453>", "<dev string:x479>", &function_c34414dadda0fafe );
        devgui::add_devgui_func( "<dev string:x49f>", "<dev string:x4c5>", &function_83779d78ed08eba6 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x4eb>", "<dev string:x50f>", &function_bdee6b166dc94dee );
        devgui::function_cd4e263c1f3018ae( "<dev string:x533>", "<dev string:x557>", &function_bdee6b166dc94dee );
        devgui::function_cd4e263c1f3018ae( "<dev string:x57b>", "<dev string:x59f>", &function_bdee6b166dc94dee );
        devgui::function_cd4e263c1f3018ae( "<dev string:x5c3>", "<dev string:x5e7>", &function_bdee6b166dc94dee );
        devgui::function_cd4e263c1f3018ae( "<dev string:x60b>", "<dev string:x62f>", &function_bdee6b166dc94dee );
        devgui::function_cd4e263c1f3018ae( "<dev string:x653>", "<dev string:x677>", &function_bdee6b166dc94dee );
        devgui::function_77df7fe7dd273e10();
        level thread function_45b55307b9ddfb93();
    }

    // Namespace radiation
    // Params 0, eflags: 0x4
    // Checksum 0x1f1f9b55, Offset: 0x14b1
    // Size: 0x1f3, Type: dev
    function private function_45b55307b9ddfb93()
    {
        level endon( #"game_ended" );
        var_6e712c584c4b889c = 0;
        
        while ( true )
        {
            if ( var_6e712c584c4b889c != 5 )
            {
                var_6e712c584c4b889c += 1;
                waitframe();
                continue;
            }
            
            var_6e712c584c4b889c = 0;
            
            if ( isdefined( level.radiation.debug_selected ) )
            {
                cylinder( level.radiation.debug_selected.origin, level.radiation.debug_selected.origin + ( 0, 0, 10000 ), level.radiation.debug_selected.radius, ( 1, 0, 0 ), 0, 5 );
                line( level.radiation.debug_selected.origin - ( level.radiation.debug_selected.radius, 0, 0 ), level.radiation.debug_selected.origin + ( level.radiation.debug_selected.radius, 0, 0 ), ( 1, 0, 0 ), 1, 0, 5 );
                line( level.radiation.debug_selected.origin - ( 0, level.radiation.debug_selected.radius, 0 ), level.radiation.debug_selected.origin + ( 0, level.radiation.debug_selected.radius, 0 ), ( 1, 0, 0 ), 1, 0, 5 );
            }
        }
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x55c33d5a, Offset: 0x16ac
    // Size: 0x28, Type: dev
    function function_ae74a25d373a3d2d()
    {
        return create( ( 0, 0, 0 ), 2048, 1.5, "<dev string:x69b>", 1 );
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x95283325, Offset: 0x16dc
    // Size: 0x8c, Type: dev
    function function_9acdbcddd716d0f5()
    {
        player = level.players[ 0 ];
        forward = anglestoforward( player getplayerangles() );
        trace = trace::ray_trace( player geteye(), player geteye() + forward * 150000 );
        
        if ( isdefined( trace[ "<dev string:x6a9>" ] ) && trace[ "<dev string:x6b2>" ] < 1 )
        {
            return create( trace[ "<dev string:x6a9>" ], 2048, 1.5, "<dev string:x69b>", 1 );
        }
        
        return;
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x5230c596, Offset: 0x1770
    // Size: 0xf9, Type: dev
    function debug_select()
    {
        if ( level.radiation.instances.size == 0 )
        {
            return;
        }
        
        player = level.players[ 0 ];
        forward = anglestoforward( player getplayerangles() );
        trace = trace::ray_trace( player geteye(), player geteye() + forward * 150000 );
        
        if ( isdefined( trace[ "<dev string:x6a9>" ] ) && trace[ "<dev string:x6b2>" ] < 1 )
        {
            level.radiation.instances = sortbydistance( level.radiation.instances, trace[ "<dev string:x6a9>" ] );
            level.radiation.debug_selected = level.radiation.instances[ 0 ];
            return;
        }
        
        level.radiation.debug_selected = undefined;
    }

    // Namespace radiation
    // Params 0
    // Checksum 0xecd8614d, Offset: 0x1871
    // Size: 0x18, Type: dev
    function debug_deselect()
    {
        level.radiation.debug_selected = undefined;
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x18abc57f, Offset: 0x1891
    // Size: 0x42, Type: dev
    function function_8b61ef883ae5aecf()
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x6bb>" );
            return;
        }
        
        level.radiation.debug_selected destroy();
    }

    // Namespace radiation
    // Params 1
    // Checksum 0x3afc6cbe, Offset: 0x18db
    // Size: 0x13d, Type: dev
    function function_fee517814fd7f539( params )
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x6e5>" );
            return;
        }
        
        direction = params[ 0 ];
        dist = int( params[ 1 ] );
        time = int( params[ 2 ] );
        offset = ( 0, 0, 0 );
        
        switch ( direction )
        {
            case #"hash_f96ec5f6bcd1b209":
                offset = ( 0, dist, 0 );
                break;
            case #"hash_f96ec4f6bcd1b076":
                offset = ( dist, 0, 0 );
                break;
            case #"hash_f95bc1f6bcc2a133":
                offset = ( 0, dist * -1, 0 );
                break;
            case #"hash_f95bc0f6bcc29fa0":
                offset = ( dist * -1, 0, 0 );
                break;
        }
        
        level.radiation.debug_selected transform( level.radiation.debug_selected.origin + offset, level.radiation.debug_selected.radius, time );
    }

    // Namespace radiation
    // Params 1
    // Checksum 0x6a46934f, Offset: 0x1a20
    // Size: 0xb0, Type: dev
    function function_b9eea9f6cf3d7edf( params )
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x719>" );
            return;
        }
        
        increase = int( params[ 0 ] );
        time = int( params[ 1 ] );
        level.radiation.debug_selected transform( level.radiation.debug_selected.origin, level.radiation.debug_selected.radius + increase, time );
    }

    // Namespace radiation
    // Params 0
    // Checksum 0xec12bd9f, Offset: 0x1ad8
    // Size: 0x64, Type: dev
    function function_ffe28724af750aa5()
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x741>" );
            return;
        }
        
        level.radiation.debug_selected.radarscramble = !level.radiation.debug_selected.radarscramble;
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x3ab76323, Offset: 0x1b44
    // Size: 0x64, Type: dev
    function function_c34414dadda0fafe()
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x79b>" );
            return;
        }
        
        level.radiation.debug_selected.var_5b9b5dabae9769 = !level.radiation.debug_selected.var_5b9b5dabae9769;
    }

    // Namespace radiation
    // Params 0
    // Checksum 0x344569e8, Offset: 0x1bb0
    // Size: 0x64, Type: dev
    function function_83779d78ed08eba6()
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x818>" );
            return;
        }
        
        level.radiation.debug_selected.var_e6ace642339c2f41 = !level.radiation.debug_selected.var_e6ace642339c2f41;
    }

    // Namespace radiation
    // Params 1
    // Checksum 0xa898ac2f, Offset: 0x1c1c
    // Size: 0x57, Type: dev
    function function_bdee6b166dc94dee( params )
    {
        if ( !isdefined( level.radiation.debug_selected ) )
        {
            iprintlnbold( "<dev string:x885>" );
            return;
        }
        
        level.radiation.debug_selected.var_b7f75c78edeef401 = int( params[ 0 ] );
    }

#/
