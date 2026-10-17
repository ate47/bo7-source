#using script_16ea1b94f0f381b3;
#using script_193e3e231841082f;
#using script_6c2f6a14fa53759e;
#using script_6ed201c5af7d130e;
#using script_75cfaf905999d816;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\mp\mp_agent_damage;

#namespace zombie_deathworm;

// Namespace zombie_deathworm
// Params 0
// Checksum 0x8975b99b, Offset: 0x1dd
// Size: 0x153
function init_spittle()
{
    self.var_89e47b7d790b5459 = 0;
    self.var_6023f91de2a2a578 = [];
    var_4912869f02b165bf = [[ self.var_24610c747736231e ]]();
    
    for ( ball_i = 0; ball_i < 6 ; ball_i++ )
    {
        self.var_6023f91de2a2a578[ ball_i ] = spawn( "script_model", self.origin );
        self.var_6023f91de2a2a578[ ball_i ] setmodel( self.zombieaisettings.var_d3de1a9faac42deb.var_1a59c79d833ed5af );
        self.var_6023f91de2a2a578[ ball_i ].var_d62ad5bfd64ba592 = "tag_origin";
        self.var_6023f91de2a2a578[ ball_i ].worm = self;
        self.var_6023f91de2a2a578[ ball_i ] callback::add( "homing_ball_hit_character", &function_9d02c3f74af350ab );
        namespace_62d6417c8f47a982::function_825925e0a97eedb7( self.var_6023f91de2a2a578[ ball_i ] );
        
        if ( var_4912869f02b165bf < 7 )
        {
            namespace_62d6417c8f47a982::function_9d6fcfde1a685656( self.var_6023f91de2a2a578[ ball_i ], 80, 12, 150 );
            continue;
        }
        
        namespace_62d6417c8f47a982::function_9d6fcfde1a685656( self.var_6023f91de2a2a578[ ball_i ], 100, 24, 200 );
    }
    
    thread function_38ac0395ebeb15fd();
    thread function_d6021a128c86f3a2();
    thread function_1ae7e61fc81aea8c();
    
    /#
        function_7e0acc3880a7ac1b();
    #/
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0xd0e0d5af, Offset: 0x338
// Size: 0x2a
function private function_1ae7e61fc81aea8c()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"spittle_start" );
        function_9aa760a719da279a();
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x4cebc0c7, Offset: 0x36a
// Size: 0x6f
function private function_9aa760a719da279a()
{
    thread utility::thread_on_notify( "spawn_spittle_ball", &function_b06fd34c3eff741b, self, self, "spittle_end" );
    thread utility::thread_on_notify( "release_ents_in_mouth", &function_a6ad0ce7e41a4f7e, self, self, "spittle_end" );
    thread utility::thread_on_notify( "open_mouth_spittle", &on_open_mouth, self );
    ai::set_blackboard_cooldown( "spittle_cooldown", getdvarint( @"worm_spittle_cooldown", 25000 ) );
    
    /#
        spittle_print( "<dev string:x24>" );
    #/
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0xfcaaa6d1, Offset: 0x3e1
// Size: 0x109
function private function_b06fd34c3eff741b()
{
    function_f4a77d5d66639ff4();
    head_pos = self gettagorigin( "tag_fx_mouth" );
    air_drag = getdvarfloat( @"hash_d03ff094337507bb", 250 );
    shoot_fov = getdvarfloat( @"hash_49eef1dc7ee5f947", 50 );
    targets = get_spittle_targets();
    var_c192abbbd3f14fcb = targets.size;
    
    if ( self.var_6005157a6615b97f > 1 )
    {
        var_c192abbbd3f14fcb = max( 4, var_c192abbbd3f14fcb );
    }
    
    var_c192abbbd3f14fcb = clamp( var_c192abbbd3f14fcb, 2, 6 );
    
    if ( self.disable_spittle )
    {
        var_c192abbbd3f14fcb = 0;
    }
    
    for ( ball_i = 0; ball_i < var_c192abbbd3f14fcb ; ball_i++ )
    {
        current_velocity = function_2e2530da63d333b8( shoot_fov, ball_i, var_c192abbbd3f14fcb );
        target = targets.size <= 0 ? undefined : targets[ ball_i % targets.size ];
        setup_spittle_ball_spawn( self.var_6023f91de2a2a578[ ball_i ], current_velocity, air_drag, head_pos, target );
        wait 0.1;
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0xd517acd6, Offset: 0x4f2
// Size: 0x9
function private function_a6ad0ce7e41a4f7e()
{
    function_f4a77d5d66639ff4();
}

// Namespace zombie_deathworm
// Params 5, eflags: 0x4
// Checksum 0xf039f72a, Offset: 0x503
// Size: 0x11d
function private setup_spittle_ball_spawn( ball, velocity, air_drag, head_pos, target_ent )
{
    ball utility::function_32b24db3127bff40( "spittle", "spittle_on" );
    ball dontinterpolate();
    ball.origin = head_pos + anglestoforward( self.angles ) * 150;
    ball namespace_62d6417c8f47a982::launch_ball( velocity, getdvarfloat( @"hash_829137421b9a9889", 3 ), air_drag );
    
    if ( isdefined( target_ent ) )
    {
        namespace_62d6417c8f47a982::set_target_ent( ball, target_ent );
    }
    
    ball setcandamage( 1 );
    ball solid();
    ball.scripthealth = getdvarint( @"hash_2851a67e797b5352", 50 );
    ball.maxhealth = 10000;
    ball.health = ball.maxhealth;
    ball.team = self.team;
    ball thread function_faf7815361b217d7();
    ball.ball_spawn_time = gettime();
    self.var_89e47b7d790b5459++;
}

// Namespace zombie_deathworm
// Params 4, eflags: 0x4
// Checksum 0x65d7c889, Offset: 0x628
// Size: 0xce
function private function_2e2530da63d333b8( shoot_fov, ball_i, num_to_spawn, use_current_speed )
{
    initial_forward_speed = getdvarfloat( @"hash_819a621ebc0c490a", 500 );
    var_ae2a3a25b259d063 = getdvarfloat( @"hash_e9a5f6f18ff08271", 100 );
    var_5c936623cd11d232 = ball_i * shoot_fov / num_to_spawn - shoot_fov * 0.5;
    forward_vec = anglestoforward( self.angles + ( 0, var_5c936623cd11d232, 0 ) );
    velocity = forward_vec * initial_forward_speed + ( 0, 0, -1 ) * var_ae2a3a25b259d063;
    
    if ( use_current_speed )
    {
        velocity = vectornormalize( velocity ) * length( self.ball_velocity );
    }
    
    return velocity;
}

// Namespace zombie_deathworm
// Params 1, eflags: 0x4
// Checksum 0xa7e34f5f, Offset: 0x6ff
// Size: 0x171
function private function_9d02c3f74af350ab( params )
{
    hit_ent = params.hitcharacter;
    
    if ( !isdefined( hit_ent ) )
    {
        return;
    }
    
    if ( self.origin[ 2 ] < hit_ent.origin[ 2 ] )
    {
        self.origin = ( self.origin[ 0 ], self.origin[ 1 ], hit_ent.origin[ 2 ] );
        return;
    }
    
    if ( utility::ent_flag( "hit_character" ) )
    {
        return;
    }
    
    spittle_damage = 30;
    
    if ( self.worm.var_60d920f687db580a && self.worm.var_6005157a6615b97f >= 7 )
    {
        spittle_damage = 60;
        
        if ( self.worm.var_6005157a6615b97f >= 13 )
        {
            spittle_damage = max( spittle_damage, hit_ent.health * 0.5 );
        }
    }
    
    hit_ent dodamage( spittle_damage, self.origin, self, self, "MOD_IMPACT" );
    utility::ent_flag_set( "hit_character" );
    thread utility::ent_flag_clear_delayed( "hit_character", 2 );
    
    if ( isplayer( hit_ent ) )
    {
        currentstate = hit_ent getscriptablepartstate( "deathwormVFX", 1 );
        
        if ( isdefined( currentstate ) && currentstate != "swallowed" )
        {
            hit_ent utility::function_32b24db3127bff40( "deathwormVFX", "hit_by_spittle" );
        }
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x5c00b040, Offset: 0x878
// Size: 0x17f
function private function_faf7815361b217d7()
{
    self endon( #"death" );
    
    while ( true )
    {
        waitframe();
        self waittill( #"damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        dmgstruct = zombie_damage::build_damage_struct( inflictor, attacker, damage, idflags, meansofdeath, undefined, point, direction_vec, undefined, undefined, undefined, undefined, objweapon );
        damage = zombie_damage::function_881dfa87252ee0ea( dmgstruct );
        self.scripthealth -= damage;
        killing_blow = 0;
        
        if ( self.scripthealth <= 0 )
        {
            function_c53b95c9159978a8();
            killing_blow = 1;
        }
        
        if ( isplayer( attacker ) )
        {
            attacker namespace_9d8e359c3b1041e5::updatehitmarker_sharedfunc( "standard", killing_blow );
            
            if ( mp_agent_damage::function_e7d118eb7b017fa4() )
            {
                namespace_9d8e359c3b1041e5::displaydamagenumber_sharedfunc( attacker, self, "none", meansofdeath, objweapon, int( damage ), self.origin, 0, undefined, 0, 0 );
            }
        }
        
        /#
            spittle_print( "<dev string:x32>" + self.health, self.origin );
        #/
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0xb6e14029, Offset: 0x9ff
// Size: 0x6a
function private function_c53b95c9159978a8()
{
    utility::function_32b24db3127bff40( "spittle", "spittle_impact" );
    namespace_62d6417c8f47a982::set_invisible( self );
    self setcandamage( 0 );
    self notsolid();
    self.scripthealth = 0;
    
    if ( isdefined( self.worm ) && isdefined( self.worm.var_89e47b7d790b5459 ) )
    {
        self.worm.var_89e47b7d790b5459--;
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x51242982, Offset: 0xa71
// Size: 0x41
function private on_open_mouth()
{
    self endon( #"death" );
    utility::function_7c10ea82c1e305b8( "mouth", "spittle" );
    utility::waittill_multiple( "close_mouth_spittle", "spittle_end" );
    utility::function_7c10ea82c1e305b8( "mouth", "off" );
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x3080ce8a, Offset: 0xaba
// Size: 0x65
function private function_38ac0395ebeb15fd()
{
    balls = self.var_6023f91de2a2a578;
    self waittill( #"death" );
    
    for ( ball_i = 0; ball_i < 6 ; ball_i++ )
    {
        balls[ ball_i ] function_c53b95c9159978a8();
    }
    
    wait 2;
    
    for ( ball_i = 0; ball_i < 6 ; ball_i++ )
    {
        balls[ ball_i ] delete();
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0x35433104, Offset: 0xb27
// Size: 0x89
function private function_d6021a128c86f3a2()
{
    self endon( #"death" );
    
    while ( true )
    {
        for ( ball_i = 0; ball_i < 6 ; ball_i++ )
        {
            ball = self.var_6023f91de2a2a578[ ball_i ];
            
            if ( ball.scripthealth > 0 )
            {
                time_alive = gettime() - ball.ball_spawn_time;
                
                if ( time_alive > 120000 )
                {
                    ball function_c53b95c9159978a8();
                }
            }
            
            waitframe();
        }
        
        wait 30;
    }
}

// Namespace zombie_deathworm
// Params 0, eflags: 0x4
// Checksum 0xcf8ad9e, Offset: 0xbb8
// Size: 0xb7
function private get_spittle_targets()
{
    scan_radius = 2000;
    potential_targets = self function_f017e352a29a57a1( self.origin, scan_radius, 1 );
    filtered_targets = [];
    
    foreach ( target in potential_targets )
    {
        if ( !target.damageshield )
        {
            filtered_targets[ filtered_targets.size ] = target;
        }
    }
    
    return filtered_targets;
}

/#

    // Namespace zombie_deathworm
    // Params 0
    // Checksum 0xbb5db44f, Offset: 0xc78
    // Size: 0x44, Type: dev
    function function_7e0acc3880a7ac1b()
    {
        devgui::function_9082edeb5db93280( "<dev string:x3b>" );
        devgui::add_devgui_func( "<dev string:x57>", "<dev string:x65>", &force_spittle );
        devgui::add_devgui_func( "<dev string:x73>", "<dev string:x81>", &function_7e420dfeb5c2a3ac );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0xb10fdc2f, Offset: 0xcc4
    // Size: 0x48, Type: dev
    function private force_spittle()
    {
        deathworm = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x8f>" );
        
        if ( !isdefined( deathworm ) )
        {
            return;
        }
        
        deathworm function_786bb6aa1b76c7ee( "<dev string:xa0>", 1 );
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x1ff5a1a4, Offset: 0xd14
    // Size: 0x16, Type: dev
    function private debug_spittle()
    {
        return getdvarint( @"hash_c4c95fbc22ee699", 0 ) > 0;
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x97d9c512, Offset: 0xd32
    // Size: 0x1a, Type: dev
    function private function_7e420dfeb5c2a3ac()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xab>", @"hash_c4c95fbc22ee699" );
    }

    // Namespace zombie_deathworm
    // Params 2, eflags: 0x4
    // Checksum 0xbf5bcc4e, Offset: 0xd54
    // Size: 0x5b, Type: dev
    function private spittle_print( text, pos )
    {
        if ( debug_spittle() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:xc3>" + text, ( 1, 0, 0 ) );
        }
    }

#/
