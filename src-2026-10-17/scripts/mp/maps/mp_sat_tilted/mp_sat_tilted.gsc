#using script_16ea1b94f0f381b3;
#using script_353e34c229ca1589;
#using script_49ad4836e54c2e6b;
#using scripts\common\active_env\moving_platforms;
#using scripts\common\active_env\utility;
#using scripts\common\scriptable;
#using scripts\common\utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_tilted\gen\mp_sat_tilted_art;
#using scripts\mp\maps\mp_sat_tilted\mp_sat_tilted_fx;
#using scripts\mp\maps\mp_sat_tilted\mp_sat_tilted_lighting;

#namespace mp_sat_tilted;

// Namespace mp_sat_tilted
// Params 0
// Checksum 0xf1356c08, Offset: 0x358
// Size: 0x350
function main()
{
    mp_sat_tilted_art::main();
    mp_sat_tilted_fx::main();
    namespace_35e53e3d518fcb80::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_tilted" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level.var_7f0aa6db090b81f = ( 0, 0, -1500 );
    level.var_14829b28f9f3dab7 = [];
    level.var_f496666e7ee4a18f = [];
    var_e44768628f246aef = getentarray( "moving_platform", #script_noteworthy );
    
    foreach ( e_moving_platform in var_e44768628f246aef )
    {
        if ( e_moving_platform.script_objective == "pinball_scripted" )
        {
            level.var_14829b28f9f3dab7[ level.var_14829b28f9f3dab7.size ] = e_moving_platform;
            continue;
        }
        
        if ( issubstr( e_moving_platform.script_objective, "flipper_" ) )
        {
            var_1f2e99b089a7ecaf = getentarray( e_moving_platform.targetname, #target );
            
            foreach ( e_linked in var_1f2e99b089a7ecaf )
            {
                if ( e_linked.script_noteworthy == "hurt_zone" )
                {
                    e_moving_platform.t_hurt = e_linked;
                }
            }
            
            level.var_f496666e7ee4a18f[ level.var_f496666e7ee4a18f.size ] = e_moving_platform;
        }
    }
    
    level.e_archie = getent( "light_archie_head", #targetname );
    level thread moving_platforms::moving_platforms_init();
    level thread flipper_init();
    level thread pinball_init();
    level thread function_ced56aceaceb15b8();
    level thread function_b05c7ee36b778e5a();
    level thread function_217522cc982bf966();
    level thread function_41c9f597dc7aae90();
    dialog::function_192bd33a73576aca( #"mission_success", #"hash_4bbc857e7c53749e" );
    dialog::function_192bd33a73576aca( #"gamestate_win_comeback", #"hash_4bbc857e7c53749e" );
    dialog::function_192bd33a73576aca( #"mission_failure", #"hash_e0a4e2f016a48fbd" );
    
    /#
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"test_bootup", &function_42eaec8662154808 );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"test_track", &pinball_activate );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"test_flipper", &flipper_activate );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"hash_f1cdb1220524dce0", &function_e5616f7b6440df7d );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"hash_30381db161e6f4cf", &namespace_35e53e3d518fcb80::archie_blink );
    #/
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x36141023, Offset: 0x6b0
// Size: 0x6e
function private function_ced56aceaceb15b8()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    
    if ( level.prematchperiodend > 0 && game_utility_mp::isfirstround() )
    {
        level waittill( #"match_start_real_countdown" );
        wait 4;
    }
    
    level.var_83a9c774f09e4b6 = getentitylessscriptablearray( "tilted_backbox_screen", #script_noteworthy )[ 0 ];
    level thread function_230d819fa45c942();
    function_42eaec8662154808();
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0xc00b3bfb, Offset: 0x726
// Size: 0xbc
function private function_230d819fa45c942()
{
    level endon( #"game_ended" );
    
    foreach ( str_sound_alias in [ "dx_mp_tilt_startupseq1_arch", "dx_mp_tilt_startupseq2_arch", "dx_mp_tilt_startupseq3_arch" ] )
    {
        n_length_ms = lookupsoundlength( str_sound_alias ) / 1000;
        level thread function_e423e6ad3aaeb18a( 0, str_sound_alias, undefined, 1 );
        wait n_length_ms + 0.2;
    }
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0xa807112b, Offset: 0x7ea
// Size: 0x2c
function private function_42eaec8662154808( params )
{
    level thread namespace_35e53e3d518fcb80::function_eefaa8a1b597a4b3();
    level.var_83a9c774f09e4b6 setscriptablepartstate( "moving_platform_anim", "bootup" );
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0x3534892, Offset: 0x81e
// Size: 0x22
function private function_47cbee6c3d55d969( delay_s )
{
    level endon( #"game_ended" );
    wait delay_s;
    function_42eaec8662154808();
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x3021efac, Offset: 0x848
// Size: 0xe8
function private pinball_init()
{
    level endon( #"game_ended" );
    utility::flag_wait( "moving_platforms_initialized" );
    
    if ( level.prematchperiodend > 0 && game_utility_mp::isfirstround() )
    {
        level waittill( #"match_start_real_countdown" );
    }
    
    level.var_b4439af9254e20f9 = 0;
    
    foreach ( var_87e9399c6b5eb78d in level.var_14829b28f9f3dab7 )
    {
        var_87e9399c6b5eb78d thread function_54044b7257294fc8();
        var_87e9399c6b5eb78d thread function_fb30e256f827ddeb();
    }
    
    while ( true )
    {
        wait 55;
        level thread namespace_35e53e3d518fcb80::function_ee8db67cf0cce54c();
        wait 20;
        pinball_activate();
    }
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0x52ed6a93, Offset: 0x938
// Size: 0x11e
function private pinball_activate( params )
{
    foreach ( e_pinball in level.var_14829b28f9f3dab7 )
    {
        if ( e_pinball.b_launched != 1 )
        {
            e_pinball.b_launched = 1;
            moving_platforms::moving_platform_activate( e_pinball );
            e_pinball thread function_318671deb08492ea();
        }
    }
    
    level thread function_e423e6ad3aaeb18a( 0, undefined, 2.5 );
    level thread namespace_35e53e3d518fcb80::function_906efdae673be431();
    level thread namespace_35e53e3d518fcb80::function_eda7d6b7f7f9b838();
    level thread namespace_35e53e3d518fcb80::function_621ab01934993bfd();
    level thread function_e423e6ad3aaeb18a( 7, "dx_mp_tilt_nkseqfn_arch", undefined, 2 );
    level.var_b4439af9254e20f9 += 1;
    
    if ( level.var_b4439af9254e20f9 >= 2 )
    {
        level.var_b4439af9254e20f9 = 0;
        level thread function_47cbee6c3d55d969( 8 );
    }
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x75d67a43, Offset: 0xa5e
// Size: 0x2c
function private function_318671deb08492ea()
{
    level endon( #"game_ended" );
    self waittill( #"move_ended" );
    self.b_launched = 0;
    clean_ball();
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x81632558, Offset: 0xa92
// Size: 0x9b
function private clean_ball()
{
    var_6c45c07b562676d6 = getweaponarrayinradius( self.origin, self.script_radius * 2 );
    
    foreach ( e_dropped_weapon in var_6c45c07b562676d6 )
    {
        if ( isdefined( e_dropped_weapon ) )
        {
            e_dropped_weapon delete();
        }
    }
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x70995adf, Offset: 0xb35
// Size: 0x1ec
function private flipper_init()
{
    level endon( #"game_ended" );
    utility::flag_wait( "moving_platforms_initialized" );
    var_e44768628f246aef = getentarray( "moving_platform", #script_noteworthy );
    
    foreach ( e_moving_platform in var_e44768628f246aef )
    {
        var_75a4690bff619f1a = getentarray( e_moving_platform.script_objective, #script_noteworthy );
        
        foreach ( t_damage_sensor in var_75a4690bff619f1a )
        {
            if ( isdefined( t_damage_sensor ) )
            {
                t_damage_sensor thread watch_for_damage( e_moving_platform );
            }
        }
    }
    
    foreach ( var_ca50a3a78cdcc2d9 in level.var_f496666e7ee4a18f )
    {
        var_65130e5677ae0fb9 = getent( var_ca50a3a78cdcc2d9.script_objective + "_hurt_zone", #script_noteworthy );
        
        if ( isdefined( var_65130e5677ae0fb9 ) )
        {
            var_ca50a3a78cdcc2d9 thread function_54044b7257294fc8( "push_start_2" );
            var_ca50a3a78cdcc2d9 thread function_de9dc167628da481( var_65130e5677ae0fb9 );
        }
    }
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0x1fc9a9a9, Offset: 0xd29
// Size: 0x7e
function private watch_for_damage( var_8f69fc5bf423921f )
{
    level endon( #"game_ended" );
    var_d2cb4979b25337d8 = getentitylessscriptablearray( self.target, #targetname )[ 0 ];
    
    while ( true )
    {
        self waittill( #"trigger" );
        
        if ( var_8f69fc5bf423921f moving_platforms::is_moving_platform_moving() === 0 )
        {
            moving_platforms::moving_platform_activate( var_8f69fc5bf423921f );
            
            if ( isdefined( var_d2cb4979b25337d8 ) )
            {
                var_d2cb4979b25337d8 setscriptablepartstate( "base", "activate" );
            }
        }
    }
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0x26a829c5, Offset: 0xdaf
// Size: 0xac
function private flipper_activate( params )
{
    var_e44768628f246aef = getentarray( "moving_platform", #script_noteworthy );
    
    foreach ( e_moving_platform in var_e44768628f246aef )
    {
        if ( e_moving_platform.script_objective == params[ 0 ] )
        {
            moving_platforms::moving_platform_activate( e_moving_platform );
        }
    }
}

// Namespace mp_sat_tilted
// Params 2, eflags: 0x4
// Checksum 0x11e864d, Offset: 0xe63
// Size: 0x6c
function private function_54044b7257294fc8( str_start = "move_started", str_end = "move_ended" )
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( str_start );
        self.b_can_damage = 1;
        self.var_ae851f750dabfbc7 = [];
        self waittill( str_end );
        self.b_can_damage = 0;
    }
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x8eb2503c, Offset: 0xed7
// Size: 0x116
function private function_fb30e256f827ddeb()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        if ( self.b_can_damage )
        {
            foreach ( e_player in level.players )
            {
                if ( isalive( e_player ) && e_player isnoclip() === 0 && !arraycontains( self.var_ae851f750dabfbc7, e_player ) )
                {
                    var_e4cecce5481df197 = distance( e_player.origin + ( 0, 0, 32 ), self.origin );
                    
                    if ( var_e4cecce5481df197 < self.script_radius * 2 )
                    {
                        thread deal_damage( e_player );
                        level thread function_3db27e2aae72ea40();
                        clean_ball();
                    }
                }
            }
        }
        
        waitframe();
    }
}

// Namespace mp_sat_tilted
// Params 1, eflags: 0x4
// Checksum 0x48c2c992, Offset: 0xff5
// Size: 0x78
function private function_de9dc167628da481( t_hurt )
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        t_hurt waittill( #"trigger", e_player );
        
        if ( self.b_can_damage )
        {
            if ( isalive( e_player ) && e_player isnoclip() === 0 && !arraycontains( self.var_ae851f750dabfbc7, e_player ) )
            {
                thread deal_damage( e_player );
            }
        }
    }
}

// Namespace mp_sat_tilted
// Params 1
// Checksum 0x7b4c808d, Offset: 0x1075
// Size: 0xb2
function deal_damage( damage_target )
{
    level endon( #"game_ended" );
    e_owner = self.var_57dbb36cb6f37a9e ?? self;
    var_4a78634d7f5c42b = vectornormalize( damage_target.origin + ( 0, 0, 64 ) - self.origin );
    damage_target knockback( var_4a78634d7f5c42b, 750, 1 );
    wait 0.08;
    damage_target dodamage( self.script_damage, self.origin, e_owner, self, "MOD_CRUSH", "<explicitweaponnone>" );
    self.var_ae851f750dabfbc7[ self.var_ae851f750dabfbc7.size ] = damage_target;
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x76dae49, Offset: 0x112f
// Size: 0x2b
function private function_b05c7ee36b778e5a()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    scriptable::scriptable_addnotifycallback( "drop_target_hit", &function_a03bc86e48672b65 );
}

// Namespace mp_sat_tilted
// Params 4, eflags: 0x4
// Checksum 0xaa3bc732, Offset: 0x1162
// Size: 0x67
function private function_a03bc86e48672b65( e_instance, str_note, n_param, var_533710b0b76c405a )
{
    if ( isdefined( e_instance.script_noteworthy ) && e_instance getscriptableparthasstate( "sound_feedback", e_instance.script_noteworthy ) )
    {
        e_instance setscriptablepartstate( "sound_feedback", e_instance.script_noteworthy );
    }
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x3d1ba50d, Offset: 0x11d1
// Size: 0x2b
function private function_217522cc982bf966()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    scriptable::scriptable_addnotifycallback( "pinball points", &function_3db27e2aae72ea40 );
}

// Namespace mp_sat_tilted
// Params 4, eflags: 0x4
// Checksum 0x2b20dbc1, Offset: 0x1204
// Size: 0x6c
function private function_3db27e2aae72ea40( e_instance, str_note, n_param, var_533710b0b76c405a )
{
    level endon( #"game_ended" );
    
    if ( !level.var_577e2545f77bc64e )
    {
        level.var_577e2545f77bc64e = 1;
        level thread function_e423e6ad3aaeb18a( 0, "dx_mp_tilt_tltamb_arch", undefined, 2.5 );
        wait 30;
        level.var_577e2545f77bc64e = 0;
    }
}

// Namespace mp_sat_tilted
// Params 0, eflags: 0x4
// Checksum 0x8921706a, Offset: 0x1278
// Size: 0x164
function private function_41c9f597dc7aae90()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    var_a915ef1a97f14ba6 = getentitylessscriptablearray( "ball_shooter", #script_noteworthy );
    
    foreach ( scr_ball_shooter in var_a915ef1a97f14ba6 )
    {
        a_e_attached = getnoentvolumearray( scr_ball_shooter.target, #targetname );
        
        foreach ( e_attached in a_e_attached )
        {
            if ( e_attached.script_noteworthy === "crush_zone" )
            {
                scr_ball_shooter.trigger_crush_zone = e_attached;
                utility::function_9fc28d50a2652cd7( e_attached );
            }
        }
    }
    
    scriptable::scriptable_addnotifycallback( "crush_start", &crush_on_notify );
}

// Namespace mp_sat_tilted
// Params 4, eflags: 0x4
// Checksum 0xc8b27fea, Offset: 0x13e4
// Size: 0x45
function private crush_on_notify( e_instance, str_note, n_param, var_533710b0b76c405a )
{
    level endon( #"game_ended" );
    utility::function_3fcc72db54ef9ce( e_instance.trigger_crush_zone );
}

// Namespace mp_sat_tilted
// Params 4, eflags: 0x4
// Checksum 0xc83debde, Offset: 0x1431
// Size: 0x7c
function private function_e423e6ad3aaeb18a( n_delay, str_vo_alias, var_dfc0ba634a24b432 = 3, var_cecb49b2131fdbea )
{
    level endon( #"game_ended" );
    wait n_delay;
    
    if ( isdefined( str_vo_alias ) )
    {
        playsoundatpos( ( -1024, 0, 1280 ), str_vo_alias );
        var_dfc0ba634a24b432 = lookupsoundlength( str_vo_alias, 1 ) / 1000;
    }
    
    if ( isdefined( var_cecb49b2131fdbea ) )
    {
        var_dfc0ba634a24b432 -= var_cecb49b2131fdbea;
    }
    
    namespace_35e53e3d518fcb80::function_ae9dbcfa2fa9492d( var_dfc0ba634a24b432 );
}

// Namespace mp_sat_tilted
// Params 3, eflags: 0x4
// Checksum 0x4acee23a, Offset: 0x14b5
// Size: 0x35
function private function_a0c268afecb6c08( var_dc4765586c7d090, str_alias, n_delay )
{
    level endon( #"game_ended" );
    wait n_delay;
    playsoundatpos( var_dc4765586c7d090, str_alias );
}

/#

    // Namespace mp_sat_tilted
    // Params 1, eflags: 0x4
    // Checksum 0xaa20d527, Offset: 0x14f2
    // Size: 0x1d, Type: dev
    function private function_e5616f7b6440df7d( params )
    {
        namespace_35e53e3d518fcb80::function_c83267584553ecc( int( params[ 0 ] ) );
    }

#/
