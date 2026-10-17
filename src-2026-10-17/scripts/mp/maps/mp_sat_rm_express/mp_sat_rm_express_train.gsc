#using script_12f27689484d598;
#using script_16ea1b94f0f381b3;
#using script_1e8bac323888e21b;
#using script_2c52716c770ac80c;
#using script_2d9114caf581498f;
#using script_324387a2fac81207;
#using script_35ea2ad71d73089b;
#using script_3772e1b53b6011dc;
#using script_38a2a2c62d6be2ed;
#using script_400030cfadc03f31;
#using script_4966d09e65e628d2;
#using script_4d0423a04b5e07d6;
#using script_501664a0dffc664d;
#using script_548343c84a710bdd;
#using script_5734f982c50530c8;
#using script_593d3c2f92cbc61b;
#using script_5f79c84fc810da15;
#using script_6367c716a6f4211a;
#using script_6dcf9f54cbf3594f;
#using script_72ace123f7289772;
#using script_72b7a9ef90d206fc;
#using script_7e08b74a0a0053c0;
#using script_d4343cc8d54c793;
#using scripts\common\active_env\utility;
#using scripts\common\utility;
#using scripts\mp\flags;
#using scripts\mp\juggernaut;

#namespace mp_sat_rm_express_train;

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x8c2f22a3, Offset: 0x57b
// Size: 0xae
function main()
{
    /#
        if ( isofflinetoolrun( 4 ) )
        {
            return;
        }
    #/
    
    /#
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"train", &function_2883653ca6300d6f );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"gates", &function_c56ccb23ec4cf2a8 );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"playtrain", &function_e025f75ff52c5dc7 );
        namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"pausetrain", &function_a8a71dc181155f37 );
    #/
    
    level thread function_b7555032599d6b48();
    level thread function_f66f95751c888ef2();
    level thread function_f8811ef20776826();
    
    /#
        var_31f92796ec1bdb5d = getdvarint( @"hash_5e777e17fa080d85", 0 );
        
        if ( var_31f92796ec1bdb5d )
        {
            level.onplayerconnect = &on_player_connect;
        }
    #/
}

/#

    // Namespace mp_sat_rm_express_train
    // Params 1
    // Checksum 0xabf526cf, Offset: 0x631
    // Size: 0x4d, Type: dev
    function on_player_connect( e_player )
    {
        if ( isbot( e_player ) )
        {
            return;
        }
        
        e_player thread function_257f2e0038a68596();
        e_player thread function_d09d80aebf9cc158();
        e_player notifyonplayercommand( "<dev string:x24>", "<dev string:x31>" );
        e_player notifyonplayercommand( "<dev string:x24>", "<dev string:x3b>" );
    }

#/

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xe52a8bf4, Offset: 0x686
// Size: 0x2ac
function private function_b7555032599d6b48()
{
    level endon( #"game_ended" );
    e_train_engine = getent( "train_engine", "script_noteworthy" );
    a_cars = init_train_cars( e_train_engine );
    s_spline = function_a8ea49d4c21c7c85( "train_test" );
    b_init_done = s_spline function_8e0379ca80bddc88();
    level.t_nav_obstacle = getent( "train_nav_obstacle", #script_noteworthy );
    
    if ( isdefined( level.t_nav_obstacle ) )
    {
        level.t_nav_obstacle thread function_13a5da870a56bf15();
    }
    
    if ( getdvarint( @"hash_78260c8f15c5000", 0 ) )
    {
        return;
    }
    
    level.e_train_engine = e_train_engine;
    level.train_track = s_spline;
    level.var_e4fc95b309dcbf16 = a_cars;
    level.var_27bfa909c7410481 = [ ( 750, -2000, 400 ), ( -50, -700, 350 ), ( -50, 700, 350 ), ( 750, 2000, 350 ) ];
    var_aaa4069fa53a6dae = getentarray( "gate", #script_noteworthy );
    e_gate_clip = getent( "gate_clip", #script_noteworthy );
    e_gate_clip linkto( var_aaa4069fa53a6dae[ 0 ] );
    level thread function_51b4b6125cecc777( var_aaa4069fa53a6dae );
    level thread function_448456a500bc4d6d();
    
    /#
        b_show_debug = getdvarint( @"hash_e344bbfec76a4bae", 0 );
        
        if ( b_show_debug )
        {
            n_resolution = 10;
            n_num_points = s_spline.a_n_points.size;
            var_955247ddf71c38e9 = [];
            level.var_d686e3c9eda313d7 = [];
            level.var_3af133cad5584c82 = [];
            
            for ( i = 0; i < n_num_points - 1 ; i++ )
            {
                for ( r = 0; r < n_resolution ; r++ )
                {
                    t = r / n_resolution;
                    n_next_index = var_955247ddf71c38e9.size;
                    var_955247ddf71c38e9[ n_next_index ] = calccsplineposition( s_spline.n_id, i, t );
                    
                    if ( n_next_index > 1 )
                    {
                        var_7c5e287d726facfa = vectornormalize( var_955247ddf71c38e9[ n_next_index - 1 ] - var_955247ddf71c38e9[ n_next_index ] );
                        level.var_3af133cad5584c82[ n_next_index ] = { #angles:vectortoangles( var_7c5e287d726facfa ), #origin:var_955247ddf71c38e9[ n_next_index ], #n_id:n_next_index };
                    }
                }
            }
            
            level thread function_2b693c046f1b9fc5( var_955247ddf71c38e9, ( 0, 1, 0 ) );
            level thread function_36e191cf340244c3( a_cars );
        }
    #/
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xd1e6a613, Offset: 0x93a
// Size: 0x3a
function private crush_watcher()
{
    level endon( #"game_ended" );
    t_crush_zone = self;
    t_crush_zone thread utility::function_5ca354a4734a1bd8();
    level waittill( #"hash_83c0c90875c4e1f2" );
    t_crush_zone thread utility::function_9074f7fdf422f8e5();
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x3de8cb33, Offset: 0x97c
// Size: 0x3d
function private function_f45049d6ba04e1f0( var_3f39464619c21e0e )
{
    if ( isdefined( level.t_nav_obstacle ) )
    {
        if ( var_3f39464619c21e0e )
        {
            level.t_nav_obstacle disconnectpaths();
            return;
        }
        
        level.t_nav_obstacle connectpaths();
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xc747de62, Offset: 0x9c1
// Size: 0x22
function private function_13a5da870a56bf15()
{
    level endon( #"game_ended" );
    level waittill( #"scriptables_ready" );
    waitframe();
    self connectpaths();
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x9f1c4466, Offset: 0x9eb
// Size: 0x18
function private function_c56ccb23ec4cf2a8( params )
{
    level notify( #"hash_25e8bd1a1836773b" );
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0xd4868d24, Offset: 0xa0b
// Size: 0x18
function private function_e025f75ff52c5dc7( params )
{
    level notify( #"hash_bfd4b5b4a229ac0" );
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0xf278a6f9, Offset: 0xa2b
// Size: 0x7d
function private function_448456a500bc4d6d( params )
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        level waittill( #"hash_bfd4b5b4a229ac0" );
        level.var_516a75519780598b = 0;
        level thread play_train();
        level thread play_alarm_inside();
        level notify( #"hash_25e8bd1a1836773b" );
        wait 2.5;
        level.var_516a75519780598b = 1;
        level waittill( #"hash_f1d7a74013de8050" );
        level notify( #"hash_25e8bd1a1836773b" );
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x9704c56d, Offset: 0xab0
// Size: 0x2d4
function private init_train_cars( e_engine )
{
    if ( !isdefined( e_engine ) )
    {
        return [];
    }
    
    var_6dc692eb98feaee1 = [];
    var_3ec20c7ba40a5346 = getentarray( "train_clip", #script_noteworthy );
    a_e_clips = [];
    level.var_7e467f468a45f847 = [];
    
    foreach ( e_clip in var_3ec20c7ba40a5346 )
    {
        a_e_clips[ e_clip.targetname ] = e_clip;
    }
    
    var_7b3d868807b3c67a = undefined;
    
    for ( i = 0; i < 21 ; i++ )
    {
        if ( i == 0 )
        {
            e_car = e_engine;
        }
        else if ( isdefined( var_7b3d868807b3c67a.target ) )
        {
            e_car = getent( var_7b3d868807b3c67a.target, #targetname );
        }
        
        if ( !isdefined( e_car ) )
        {
            continue;
        }
        
        e_car markkeyframedmover();
        e_car function_2735e38f58370a0f( 1 );
        e_car.b_is_active = 0;
        b_is_head = i == 0;
        var_44f037be7f65f270 = i == 20;
        n_length = b_is_head || var_44f037be7f65f270 ? 612 : 511;
        v_center = e_car.origin + anglestoup( e_car.angles ) * 176 / 2;
        var_afd74bf62cde8434 = b_is_head || var_44f037be7f65f270 ? "head" : "passenger";
        e_clip_master = a_e_clips[ var_afd74bf62cde8434 ];
        e_clip_copy = spawn( "script_model", v_center );
        e_clip_copy.angles = ( 0, 90, 0 );
        
        if ( var_44f037be7f65f270 )
        {
            e_clip_copy addyaw( 180 );
        }
        
        e_clip_copy clonebrushmodeltoscriptmodel( e_clip_master, 0 );
        e_clip_copy setmoveroptimized( 1 );
        e_clip_copy setmoverantilagged( 1 );
        e_clip_copy setmovingplatformdef( "movingplatform_rotator" );
        e_clip_copy linkto( e_car );
        e_car.e_clip = e_clip_copy;
        level.var_7e467f468a45f847[ level.var_7e467f468a45f847.size ] = e_car.e_clip;
        e_car.count = level.var_7e467f468a45f847.size;
        e_car.var_f166f2009ce48f4 = 1;
        e_car.e_clip.var_f166f2009ce48f4 = 1;
        e_clip_copy thread function_42950d4b7c7a34b8();
        var_6dc692eb98feaee1[ i ] = e_car;
        var_7b3d868807b3c67a = e_car;
    }
    
    return var_6dc692eb98feaee1;
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x74df7ec4, Offset: 0xd8d
// Size: 0x241
function private function_42950d4b7c7a34b8()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        a_params = utility::waittill_any_return_params( "touch", "player_pushed" );
        
        if ( a_params.size == 0 )
        {
            continue;
        }
        
        e_ent = a_params[ 0 ];
        
        if ( !isplayer( e_ent ) && !isai( e_ent ) )
        {
            e_ent kill( undefined, undefined, undefined, "MOD_CRUSH" );
            continue;
        }
        
        if ( isplayer( e_ent ) && isalive( e_ent ) && !e_ent.var_68e45a37bdbbde )
        {
            closest_camera_position = level.var_27bfa909c7410481[ 0 ];
            var_96083ef31aee47c5 = distancesquared( e_ent.origin, level.var_27bfa909c7410481[ 0 ] );
            
            for ( i = 1; i < level.var_27bfa909c7410481.size ; i++ )
            {
                dist_sq = distancesquared( e_ent.origin, level.var_27bfa909c7410481[ i ] );
                
                if ( var_96083ef31aee47c5 > dist_sq )
                {
                    var_96083ef31aee47c5 = dist_sq;
                    closest_camera_position = level.var_27bfa909c7410481[ i ];
                }
            }
            
            e_ent lockdeathcamera( 1 );
            e_ent function_3d0aa95561289b03( closest_camera_position );
            e_ent function_6a623c74d49d4e61( e_ent.origin );
            
            if ( e_ent.isjuggernaut && e_ent.var_e4dae87a649544c3 )
            {
                damagedata = spawnstruct();
                damagedata.instantdeath = 1;
                e_ent thread function_99914abfea48e8dc();
                e_ent juggernaut::jugg_removejuggernaut( damagedata );
                e_ent thread function_5c49b4817cb738e1();
                continue;
            }
            
            function_fec9e972366e2fd6( e_ent );
            
            if ( e_ent.isdeploying )
            {
                e_ent.nocorpse = 1;
                e_ent killstreakdeploy::streakdeploy_cancelalldeployments();
                e_ent kill( self.origin, e_ent, undefined, "MOD_CRUSH" );
                e_ent thread function_5c49b4817cb738e1();
                continue;
            }
            
            if ( e_ent.usingremote == "remote_turret" )
            {
                e_ent thread function_d7843abb87930c9c( self.origin );
                continue;
            }
            
            e_ent dodamage( 999999, e_ent.origin, self, self, "MOD_CRUSH" );
        }
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0xc1ba8f9e, Offset: 0xfd6
// Size: 0xb3
function private function_fec9e972366e2fd6( player )
{
    if ( self == level.e_train_engine.e_clip )
    {
        v_forward = anglestoright( self.angles );
        var_96d4bdbac5f68d92 = ( player.origin[ 0 ], player.origin[ 1 ], self.origin[ 2 ] );
        var_bc999241a86c216c = vectornormalize( var_96d4bdbac5f68d92 - self.origin );
        var_5edf198e0123e3ad = vectordot( v_forward, var_bc999241a86c216c );
        
        if ( var_5edf198e0123e3ad >= 0.95 )
        {
            player.nocorpse = 1;
        }
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x25bce840, Offset: 0x1091
// Size: 0x44
function private function_d7843abb87930c9c( var_9cfdc7a5333f2638 )
{
    self notify( #"remotesentry_deploytabletfinished" );
    waitframe();
    self notify( #"hash_7e67061db4b45f79" );
    waitframe();
    self notify( #"hash_597999d7b5a801e2" );
    wait 1;
    self kill( var_9cfdc7a5333f2638, self, undefined, "MOD_CRUSH" );
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xd272d91a, Offset: 0x10dd
// Size: 0x3a
function private function_99914abfea48e8dc()
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    
    if ( isdefined( self ) )
    {
        self.var_68e45a37bdbbde = 1;
        wait 0.3;
        self.var_68e45a37bdbbde = 0;
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x689c2d89, Offset: 0x111f
// Size: 0x34
function private function_5c49b4817cb738e1()
{
    self stopcinematicforplayer( 1, 1 );
    wait 0.3;
    self setclientomnvar( "ui_using_killstreak_remote", 0 );
    self setclientomnvar( "ui_mobile_killstreak_is_deploying", 0 );
    self stopcinematicforplayer( 1, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0xfec8339c, Offset: 0x115b
// Size: 0x43f
function private play_train( params )
{
    level endon( #"game_ended" );
    level notify( #"train_started" );
    
    if ( !utility::flag_exist( "train_is_running" ) )
    {
        utility::flag_init( "train_is_running" );
    }
    
    utility::flag_set( "train_is_running" );
    var_9373c01897ad049a = 0;
    level.b_train_is_running = 1;
    level.e_train_engine thread function_feb2954a60fd9e75();
    level thread function_75186a5ccaa487b2();
    level thread function_f45049d6ba04e1f0( 1 );
    var_57eeec9e996260fe = level.e_train_engine;
    s_spline = level.train_track;
    var_1b99caa153c5074b = 0;
    var_7f04062d245ba887 = ( 0, 0, -500 );
    var_fea41e0c7a8b1e5c = 52;
    s_effect_emitters = function_53f2fe0ea54a39d9( s_spline, 4 );
    level thread function_ca3318001b4e01f3( s_effect_emitters );
    level thread function_686b120f315f286d( s_effect_emitters );
    var_6a0199dd4514c38a = 21;
    
    while ( true )
    {
        var_8582cfc8177b140b = undefined;
        var_8805192b840343cb = undefined;
        
        foreach ( var_a45c4677c13cb962, e_car in level.var_e4fc95b309dcbf16 )
        {
            /#
                if ( var_a45c4677c13cb962 >= var_6a0199dd4514c38a )
                {
                    break;
                }
            #/
            
            var_6036d2ac72b7c9c9 = var_a45c4677c13cb962 == var_6a0199dd4514c38a - 1;
            var_3743b757158dd1ba = 511;
            var_275427e3b77fd990 = var_3743b757158dd1ba / 2;
            var_414af99c676406d1 = var_1b99caa153c5074b + var_3743b757158dd1ba * ( 1 - var_a45c4677c13cb962 );
            
            if ( var_a45c4677c13cb962 == 0 )
            {
                var_414af99c676406d1 += var_fea41e0c7a8b1e5c;
            }
            else if ( var_6036d2ac72b7c9c9 )
            {
                var_414af99c676406d1 -= var_fea41e0c7a8b1e5c;
            }
            
            if ( var_414af99c676406d1 <= var_275427e3b77fd990 )
            {
                continue;
            }
            
            n_front_dist = var_414af99c676406d1 + var_275427e3b77fd990;
            var_6b00a3b2c643d23d = s_spline.n_total_length - var_fea41e0c7a8b1e5c / 2;
            var_8e69c9108657ae63 = s_spline.n_total_length * 0.74 - var_fea41e0c7a8b1e5c / 2;
            
            if ( !e_car.b_is_active && !( n_front_dist >= var_6b00a3b2c643d23d ) )
            {
                e_car flagteleport();
                e_car.b_is_active = 1;
                e_car function_8dcc1f24954b4b7b( var_a45c4677c13cb962 );
            }
            
            if ( e_car.b_is_active )
            {
                if ( n_front_dist >= var_6b00a3b2c643d23d )
                {
                    function_ab8230d40e82bc8f( e_car );
                    e_car thread function_d0f929905bc10ae0( 0 );
                    e_car flagteleport();
                    e_car.origin = var_7f04062d245ba887;
                    e_car.b_is_active = 0;
                    e_car stoploopsound();
                    
                    if ( var_a45c4677c13cb962 == 0 )
                    {
                        var_8582cfc8177b140b = undefined;
                        e_car notify( #"hash_a58a5f526363c769" );
                    }
                    
                    if ( var_6036d2ac72b7c9c9 )
                    {
                        var_8805192b840343cb = undefined;
                        level.b_train_is_running = 0;
                        utility::flag_clear( "train_is_running" );
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }
                else if ( n_front_dist >= var_8e69c9108657ae63 )
                {
                    if ( var_6036d2ac72b7c9c9 )
                    {
                        level notify( #"hash_f1d7a74013de8050" );
                        var_9373c01897ad049a = 1;
                        level thread function_f45049d6ba04e1f0( 0 );
                    }
                }
                
                var_db4d9a20022eb10 = s_spline function_9d5911ddd78256d0( var_414af99c676406d1 + var_275427e3b77fd990, 1 );
                var_ee1b07ef59447564 = s_spline function_9d5911ddd78256d0( var_414af99c676406d1 - var_275427e3b77fd990, 1 );
                v_front = var_db4d9a20022eb10.v_point;
                v_back = var_ee1b07ef59447564.v_point;
                
                if ( var_a45c4677c13cb962 == 0 )
                {
                    var_9a2bc7375c3b1bbb = var_db4d9a20022eb10;
                }
                else if ( var_6036d2ac72b7c9c9 )
                {
                    var_ce9dcb1e8a4cde09 = var_ee1b07ef59447564;
                }
                
                level notify( #"train_moved", var_9a2bc7375c3b1bbb, var_ce9dcb1e8a4cde09, var_9373c01897ad049a );
                
                if ( var_6036d2ac72b7c9c9 )
                {
                    v_temp = v_front;
                    v_front = v_back;
                    v_back = v_temp;
                }
                
                v_center = ( v_front + v_back ) / 2;
                e_car.origin = v_center;
                e_car.angles = vectortoangles( v_front - v_back ) - ( 0, 90, 0 );
            }
        }
        
        if ( level.var_516a75519780598b )
        {
            var_1b99caa153c5074b += 20;
        }
        
        waitframe();
    }
}

// Namespace mp_sat_rm_express_train
// Params 2, eflags: 0x4
// Checksum 0xe55a1c71, Offset: 0x15a2
// Size: 0xcf
function private function_53f2fe0ea54a39d9( s_spline, n_res = 1 )
{
    n_points = s_spline.a_n_points.size;
    var_5e2047bdbe660e45 = [];
    
    for ( i = 0; i < n_points ; i++ )
    {
        for ( j = 0; j < n_res ; j++ )
        {
            v_point = calccsplineposition( s_spline.n_id, i, j / n_res );
            e_emitter = spawn( "script_origin", v_point );
            var_5e2047bdbe660e45[ var_5e2047bdbe660e45.size ] = e_emitter;
        }
    }
    
    s_effect_emitters = { #n_res:n_res, #var_5e2047bdbe660e45:var_5e2047bdbe660e45 };
    return s_effect_emitters;
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x6434684b, Offset: 0x167a
// Size: 0xb2
function private function_8dcc1f24954b4b7b( var_a45c4677c13cb962 )
{
    e_car = self;
    
    if ( var_a45c4677c13cb962 == 20 )
    {
        n_alias = "evt_train_end";
    }
    else
    {
        switch ( var_a45c4677c13cb962 % 4 )
        {
            case 0:
                str_suffix = "a";
                break;
            case 1:
                str_suffix = "b";
                break;
            case 2:
                str_suffix = "c";
                break;
            case 3:
                str_suffix = "d";
                break;
        }
        
        n_alias = "evt_train_lp_" + str_suffix;
    }
    
    e_car playloopsound( n_alias );
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0xc
// Checksum 0x97459fb3, Offset: 0x1734
// Size: 0x1e1
function private function_ca3318001b4e01f3( s_effect_emitters )
{
    self notify( #"hash_919067d402935477" );
    self endon( #"hash_919067d402935477" );
    level endon( #"game_ended" );
    
    /#
        if ( getdvarint( @"hash_fe1dcc129483e6ad", 0 ) )
        {
            level thread function_33103ca1a0bee156( s_effect_emitters.var_5e2047bdbe660e45 );
        }
    #/
    
    foreach ( e_emitter in s_effect_emitters.var_5e2047bdbe660e45 )
    {
        e_emitter.b_is_active = 0;
    }
    
    while ( utility::flag( "train_is_running" ) )
    {
        level waittill( #"train_moved", var_db4d9a20022eb10, var_ee1b07ef59447564, var_9373c01897ad049a );
        
        if ( isdefined( var_db4d9a20022eb10 ) )
        {
            e_emitter = function_bea2ef6c9ab6e045( s_effect_emitters, var_db4d9a20022eb10 );
            
            if ( !e_emitter.b_is_active )
            {
                e_emitter.b_is_active = 1;
            }
        }
        
        if ( isdefined( var_ee1b07ef59447564 ) )
        {
            e_emitter = function_bea2ef6c9ab6e045( s_effect_emitters, var_ee1b07ef59447564 );
            
            if ( e_emitter.b_is_active )
            {
                e_emitter.b_is_active = 0;
            }
        }
    }
    
    foreach ( e_emitter in s_effect_emitters.var_a66713102ef82add )
    {
        e_emitter.b_is_active = 0;
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0xc
// Checksum 0xff30c486, Offset: 0x191d
// Size: 0xf7
function private function_686b120f315f286d( s_emitters )
{
    self notify( #"hash_827b4292a6242383" );
    self endon( #"hash_827b4292a6242383" );
    level endon( #"game_ended" );
    
    while ( utility::flag( "train_is_running" ) )
    {
        foreach ( e_emitter in s_emitters.var_5e2047bdbe660e45 )
        {
            if ( e_emitter.b_is_active )
            {
                earthquake( 0.15, getframeduration() / 1000, e_emitter.origin, 300 );
                playrumbleonposition( "artillery_rumble_light", e_emitter.origin );
            }
        }
        
        waitframe();
    }
}

// Namespace mp_sat_rm_express_train
// Params 2, eflags: 0x4
// Checksum 0x2e369118, Offset: 0x1a1c
// Size: 0x92
function private function_bea2ef6c9ab6e045( s_emitters, var_746b90613069bc1d )
{
    n_point_idx = var_746b90613069bc1d.n_point_idx;
    var_af7925bf5051fb5e = var_746b90613069bc1d.var_af7925bf5051fb5e;
    var_b8cffb4446b35425 = s_emitters.n_res * ( n_point_idx + var_af7925bf5051fb5e );
    var_b8cffb4446b35425 -= var_b8cffb4446b35425 % 1 / s_emitters.n_res;
    var_b8cffb4446b35425 = int( var_b8cffb4446b35425 );
    e_emitter = s_emitters.var_5e2047bdbe660e45[ var_b8cffb4446b35425 ];
    return e_emitter;
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x5ec5f21e, Offset: 0x1ab7
// Size: 0x190
function private function_a8ea49d4c21c7c85( str_targetname )
{
    n_id = getcsplineid( str_targetname );
    
    if ( !isdefined( n_id ) )
    {
        return;
    }
    
    n_count = getcsplinepointcount( n_id );
    var_c143ab00a6021a3f = [];
    a_n_points = [ 0 ];
    n_point = 0;
    n_norm = 0;
    var_af7925bf5051fb5e = 0;
    
    /#
        v_prev_origin = undefined;
    #/
    
    while ( true )
    {
        v_tangent = calccsplinetangent( n_id, n_point, var_af7925bf5051fb5e );
        n_norm = length( v_tangent );
        
        if ( !n_norm || n_norm == 0 )
        {
            return;
        }
        
        var_c143ab00a6021a3f[ var_c143ab00a6021a3f.size ] = var_af7925bf5051fb5e;
        
        /#
            if ( getdvarint( @"hash_a05b593fbc6e50ed", 0 ) != 0 )
            {
                v_origin = calccsplineposition( n_id, n_point, var_af7925bf5051fb5e );
                
                if ( isdefined( v_prev_origin ) )
                {
                    level thread utility::draw_line_for_time( v_prev_origin, v_origin, 1, 1, 1, 1000 );
                }
                
                v_prev_origin = v_origin;
            }
        #/
        
        var_af7925bf5051fb5e += 30 / n_norm;
        
        while ( var_af7925bf5051fb5e > 1 )
        {
            var_af7925bf5051fb5e -= 1;
            n_point += 1;
            
            if ( n_point >= n_count - 1 )
            {
                break;
            }
            
            a_n_points[ n_point ] = var_c143ab00a6021a3f.size;
        }
        
        if ( n_point >= n_count - 1 )
        {
            break;
        }
    }
    
    n_total_length = var_c143ab00a6021a3f.size * 30 + var_af7925bf5051fb5e * n_norm;
    return { #a_n_points:a_n_points, #var_c143ab00a6021a3f:var_c143ab00a6021a3f, #n_count:n_count, #n_total_length:n_total_length, #n_id:n_id };
}

// Namespace mp_sat_rm_express_train
// Params 2, eflags: 0x4
// Checksum 0xb1e2ece, Offset: 0x1c50
// Size: 0x1cc
function private function_9d5911ddd78256d0( n_dist, b_looping = 0 )
{
    assert( function_8e0379ca80bddc88() );
    
    if ( b_looping )
    {
        n_dist = mod( n_dist, self.n_total_length );
    }
    else if ( n_dist > self.n_total_length )
    {
        return calccsplineposition( self.n_id, self.n_count - 2, 1 );
    }
    
    index = int( min( self.var_c143ab00a6021a3f.size - 1, n_dist / 30 ) );
    var_4cc526d494224a30 = n_dist - index * 30;
    var_af7925bf5051fb5e = self.var_c143ab00a6021a3f[ index ];
    n_point = 0;
    
    foreach ( var_f054dbe0a28772a2, n_min_point_index in self.a_n_points )
    {
        if ( index < n_min_point_index )
        {
            break;
        }
        
        n_point = var_f054dbe0a28772a2;
    }
    
    var_af7925bf5051fb5e += var_4cc526d494224a30 / length( calccsplinetangent( self.n_id, n_point, var_af7925bf5051fb5e ) );
    
    while ( var_af7925bf5051fb5e > 1 )
    {
        var_af7925bf5051fb5e -= 1;
        n_point = ( n_point + 1 ) % ( self.n_count - 1 );
    }
    
    v_point = calccsplineposition( self.n_id, n_point, var_af7925bf5051fb5e );
    s_point = { #var_af7925bf5051fb5e:var_af7925bf5051fb5e, #n_point_idx:n_point, #v_point:v_point };
    return s_point;
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xf7ba1f3d, Offset: 0x1e25
// Size: 0x40, Type: bool
function private function_8e0379ca80bddc88()
{
    return isdefined( self.n_id ) && isdefined( self.n_total_length ) && isdefined( self.var_c143ab00a6021a3f ) && isdefined( self.a_n_points ) && isdefined( self.n_count );
}

/#

    // Namespace mp_sat_rm_express_train
    // Params 2
    // Checksum 0x746d6095, Offset: 0x1e6e
    // Size: 0x7c, Type: dev
    function function_2b693c046f1b9fc5( a_n_points, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        level endon( #"game_ended" );
        
        while ( true )
        {
            n_prev_point = a_n_points[ 0 ];
            
            for ( i = 1; i < a_n_points.size ; i++ )
            {
                line( n_prev_point, a_n_points[ i ], color );
                n_prev_point = a_n_points[ i ];
            }
            
            waitframe();
        }
    }

#/

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x3285c1d, Offset: 0x1ef2
// Size: 0x47
function private play_alarm_inside()
{
    level endon( #"game_ended" );
    s_alarm = utility::getstruct( "alarm_inside", "script_noteworthy" );
    
    if ( !isdefined( s_alarm ) )
    {
        return;
    }
    
    playsoundatpos( s_alarm.origin, "evt_train_alarm_in" );
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x673d146d, Offset: 0x1f41
// Size: 0x175
function private function_51b4b6125cecc777( var_aaa4069fa53a6dae )
{
    level endon( #"game_ended" );
    var_8f02ffaa7cc7316e = getnoentvolumearray( "crush_zone", #script_noteworthy );
    utility::function_e73b16a1b35af044( var_8f02ffaa7cc7316e );
    
    for ( var_2ffa446d1394a4a0 = 1; true ; var_2ffa446d1394a4a0 = !var_2ffa446d1394a4a0 )
    {
        level waittill( #"hash_25e8bd1a1836773b" );
        
        foreach ( t_crush_zone in var_8f02ffaa7cc7316e )
        {
            t_crush_zone thread crush_watcher();
        }
        
        n_move_dir = -2 * var_2ffa446d1394a4a0 + 1;
        
        foreach ( e_gate in var_aaa4069fa53a6dae )
        {
            e_gate thread function_73b9c132c6efea86( var_2ffa446d1394a4a0 );
            e_gate movez( n_move_dir * 172, 5 );
        }
        
        wait 5;
        level notify( #"hash_83c0c90875c4e1f2" );
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0xf9eed5c9, Offset: 0x20be
// Size: 0xf5
function private function_73b9c132c6efea86( var_2ffa446d1394a4a0 )
{
    level endon( #"game_ended" );
    e_gate = self;
    var_12f69542f5329b11 = e_gate.origin + ( 0, 0, 86 );
    v_alarm_pos = e_gate.origin + ( 0, 0, 136 );
    s_sound_emitter = spawn( "script_origin", var_12f69542f5329b11 );
    playsoundatpos( v_alarm_pos, "evt_train_alarm_out" );
    n_length_ms = lookupsoundlength( "evt_train_gate_start" );
    s_sound_emitter playsound( "evt_train_gate_start" );
    wait n_length_ms / 1000;
    s_sound_emitter playloopsound( "evt_train_gate_loop" );
    level waittill( #"hash_83c0c90875c4e1f2" );
    s_sound_emitter stoploopsound( "evt_train_gate_loop" );
    n_length_ms = lookupsoundlength( "evt_train_gate_end" );
    s_sound_emitter playsound( "evt_train_gate_end" );
    wait n_length_ms / 1000;
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x1307d320, Offset: 0x21bb
// Size: 0x98
function private function_f66f95751c888ef2()
{
    level endon( #"game_ended" );
    
    /#
        if ( getdvarint( @"hash_2740fbc6f07d63fd", 0 ) )
        {
            return;
        }
    #/
    
    if ( level.prematchperiod > 0 )
    {
        flags::gameflagwait( "prematch_done" );
    }
    
    n_start_time = gettime();
    var_a3f6c14f3ac0f268 = getdvarint( @"hash_742a8ac3dbea63fe", 150 ) * 1000;
    
    while ( true )
    {
        n_time_elapsed = gettime() - n_start_time;
        
        if ( n_time_elapsed >= var_a3f6c14f3ac0f268 )
        {
            function_e025f75ff52c5dc7();
            n_start_time = gettime();
        }
        
        waitframe();
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x5d9809a, Offset: 0x225b
// Size: 0x26d
function private function_f8811ef20776826()
{
    level.var_4f976f4af41f874a = [];
    level.var_4f976f4af41f874a[ "equip_c4" ] = &function_daa0d160fe0b404a;
    level.var_4f976f4af41f874a[ "equip_ied" ] = &destroy_ied;
    level.var_4f976f4af41f874a[ "equip_shockstick" ] = &destroy_shockstick;
    level.var_4f976f4af41f874a[ "equip_thermobaric_grenade" ] = &destroy_thermobaric_grenade;
    level.var_4f976f4af41f874a[ "equip_molotov" ] = &destroy_molotov;
    level.var_4f976f4af41f874a[ "equip_smoke" ] = &destroy_smoke;
    level.var_4f976f4af41f874a[ "equip_combataxe" ] = &destroy_combataxe;
    level.var_4f976f4af41f874a[ "equip_cluster_grenade" ] = &destroy_cluster_grenade;
    level.var_4f976f4af41f874a[ "equip_bunkerbuster" ] = &destroy_bunkerbuster;
    level.var_4f976f4af41f874a[ "equip_mini_sentry" ] = &mini_sentry::on_destruction;
    level.var_4f976f4af41f874a[ "equip_decoy" ] = &decoy_grenade::_destroy;
    level.var_4f976f4af41f874a[ "equip_sensor_grenade" ] = &sensor_grenade::destroy_sensor_grenade;
    level.var_4f976f4af41f874a[ "equip_proximity_alarm" ] = &proximity_alarm::proximity_alarm_destroy;
    level.var_4f976f4af41f874a[ "equip_smart_seeker" ] = &smart_seeker::function_16e1c3f278107106;
    level.var_4f976f4af41f874a[ "equip_drone_launcher" ] = &destroy_drone_launcher;
    level.var_4f976f4af41f874a[ "super_drone_launcher" ] = &function_6ead10556500a837;
    level.var_4f976f4af41f874a[ "equip_combat_hologram" ] = &destroy_combat_hologram;
    level.var_4f976f4af41f874a[ "super_ammo_drop" ] = &destroy_assault_pack;
    level.var_4f976f4af41f874a[ "equip_tac_insert" ] = &destroy_tac_insert;
    level.var_4f976f4af41f874a[ "equip_trophy" ] = &destroy_trophy;
    level.var_4f976f4af41f874a[ "equip_landmine" ] = &destroy_landmine;
    level.var_4f976f4af41f874a[ "equip_gas_trap_plantable" ] = &gas_trap::gas_trap_destroy;
    level.var_4f976f4af41f874a[ "equip_jammer" ] = &jammer::jammer_destroy;
    level.var_4f976f4af41f874a[ "super_combat_link" ] = &combat_link::handle_death;
    level.var_4f976f4af41f874a[ "dawg" ] = &destroy_dawg;
    level.var_4f976f4af41f874a[ "missile_turret" ] = &destroy_sam_turret;
    level.var_4f976f4af41f874a[ "remote_turret" ] = &destroy_remote_turret;
    level.var_4f976f4af41f874a[ "airdrop_crate" ] = &destroy_crate;
    level.var_4f976f4af41f874a[ "sabattack_flag" ] = &destroy_sabattack_flag;
}

// Namespace mp_sat_rm_express_train
// Params 2, eflags: 0x4
// Checksum 0x3c5d4885, Offset: 0x24d0
// Size: 0xb3
function private destroy_ent( ent, str_ent_name )
{
    if ( arraycontains( [ "equip_cluster_grenade_submunition", "equip_semtex", "equip_frag", "equip_emp" ], str_ent_name ) )
    {
        ent detonate();
        return;
    }
    
    if ( arraycontains( [ "rcxd", "sniper_drone", "tank_drone", "ground_drone_unit" ], str_ent_name ) )
    {
        ent dodamage( 999999, self.origin );
        return;
    }
    
    if ( isdefined( level.var_4f976f4af41f874a[ str_ent_name ] ) )
    {
        ent thread [[ level.var_4f976f4af41f874a[ str_ent_name ] ]]();
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x365c761c, Offset: 0x258b
// Size: 0x120
function private function_d0f929905bc10ae0( var_c349922ed8ad2007 )
{
    a_equipment = [[ level.getactiveequipmentarray ]]();
    var_dab072d2afa4788b = arraycombine( level.activekillstreaks, a_equipment, level.grenades, level.vehicle.all, level.cratedata.crates );
    var_dab072d2afa4788b = function_5713d46873b29625( var_dab072d2afa4788b );
    var_dab072d2afa4788b = arrayremoveduplicates( var_dab072d2afa4788b );
    
    if ( 0 && isdefined( level.var_e4d7f49e8039a388 ) )
    {
        var_dab072d2afa4788b[ var_dab072d2afa4788b.size ] = level.var_e4d7f49e8039a388;
    }
    
    foreach ( ent in var_dab072d2afa4788b )
    {
        str_target_ref = get_target_ref( ent );
        function_8951543f6006ab82( ent, str_target_ref, var_c349922ed8ad2007 );
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xcbce496e, Offset: 0x26b3
// Size: 0x33
function private function_feb2954a60fd9e75()
{
    level endon( #"game_ended" );
    self endon( #"hash_a58a5f526363c769" );
    
    while ( level.b_train_is_running )
    {
        function_d0f929905bc10ae0( 1 );
        waitframe();
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0xe73e16b8, Offset: 0x26ee
// Size: 0x25
function private function_75186a5ccaa487b2()
{
    level endon( #"game_ended" );
    
    while ( level.b_train_is_running )
    {
        function_e064a0c1f1b3176b();
        waitframe();
    }
}

// Namespace mp_sat_rm_express_train
// Params 1, eflags: 0x4
// Checksum 0x5c39362d, Offset: 0x271b
// Size: 0x99
function private get_target_ref( ent )
{
    if ( isdefined( ent.equipmentref ) )
    {
        return ent.equipmentref;
    }
    
    if ( isdefined( ent.streakname ) )
    {
        return ent.streakname;
    }
    
    if ( isdefined( ent.streakref ) )
    {
        return ent.streakref;
    }
    
    if ( isdefined( ent.superref ) )
    {
        return ent.superref;
    }
    
    if ( ent == level.var_e4d7f49e8039a388 )
    {
        return "sabattack_flag";
    }
}

// Namespace mp_sat_rm_express_train
// Params 3, eflags: 0x4
// Checksum 0x6d28f650, Offset: 0x27bc
// Size: 0x183
function private function_8951543f6006ab82( ent, targetref, var_c349922ed8ad2007 )
{
    var_9cc54dfa89450726 = distancesquared( self.origin, ent.origin );
    
    if ( var_c349922ed8ad2007 )
    {
        var_89beee78faf43c2d = 0.988;
        var_dbfbc334e0db80ec = ent.origin[ 2 ] - self.origin[ 2 ] > 150;
        
        if ( var_dbfbc334e0db80ec )
        {
            return;
        }
        
        v_forward = anglestoright( self.angles );
        var_1b6f68f579f6fa58 = ( ent.origin[ 0 ], ent.origin[ 1 ], self.origin[ 2 ] );
        var_5edf198e0123e3ad = vectordot( v_forward, vectornormalize( self.origin - var_1b6f68f579f6fa58 ) );
        var_6e6aa6f8a8b5c8e5 = targetref == "airdrop_crate";
        
        if ( var_6e6aa6f8a8b5c8e5 )
        {
            var_c4f22d2856d3e70b = abs( vectordot( v_forward, anglestoright( ent.angles ) ) );
            var_89beee78faf43c2d -= var_c4f22d2856d3e70b * 0.2;
        }
        
        if ( var_5edf198e0123e3ad >= var_89beee78faf43c2d && var_9cc54dfa89450726 < 150000 )
        {
            ent.var_95bfba95499bb5ee = 0;
            destroy_ent( ent, targetref );
        }
        
        return;
    }
    
    if ( var_9cc54dfa89450726 < 300000 )
    {
        ent.var_95bfba95499bb5ee = 1;
        destroy_ent( ent, targetref );
    }
}

// Namespace mp_sat_rm_express_train
// Params 0, eflags: 0x4
// Checksum 0x4b549db1, Offset: 0x2947
// Size: 0x13b
function private function_e064a0c1f1b3176b()
{
    if ( level.molotov.scriptables.size )
    {
        foreach ( scr_molotov in level.molotov.scriptables )
        {
            foreach ( e_train_clip in level.var_7e467f468a45f847 )
            {
                var_97c07ff9c9fb64b7 = distancesquared( e_train_clip.origin, scr_molotov.origin );
                
                if ( var_97c07ff9c9fb64b7 < 100000 )
                {
                    scr_molotov function_13e4627eee678242( e_train_clip );
                    return;
                }
            }
        }
    }
}

/#

    // Namespace mp_sat_rm_express_train
    // Params 0
    // Checksum 0xc5a37cd2, Offset: 0x2a8a
    // Size: 0x5, Type: dev
    function function_bcb424fdeb938d96()
    {
        
    }

#/

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x8696647d, Offset: 0x2a97
// Size: 0x30
function function_daa0d160fe0b404a()
{
    if ( isdefined( self.var_95bfba95499bb5ee ) && self.var_95bfba95499bb5ee )
    {
        c4::c4_delete( 0, 0 );
        return;
    }
    
    c4::c4_explode( self );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x951a3b7e, Offset: 0x2acf
// Size: 0xa
function destroy_ied()
{
    ied::ied_explode( self );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x9407929d, Offset: 0x2ae1
// Size: 0xe
function destroy_thermobaric_grenade()
{
    self notify( #"instant_explode" );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xdfedac20, Offset: 0x2af7
// Size: 0xa
function destroy_shockstick()
{
    shock_stick::shockstick_destroy( 0 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x8c9017f8, Offset: 0x2b09
// Size: 0x9
function destroy_molotov()
{
    molotov::function_884f345c3db7df55();
}

// Namespace mp_sat_rm_express_train
// Params 1
// Checksum 0x22674be9, Offset: 0x2b1a
// Size: 0x15
function function_13e4627eee678242( var_6188706888afc67 )
{
    thread molotov::molotov_pool_end( 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x1375295d, Offset: 0x2b37
// Size: 0x8
function destroy_smoke()
{
    self detonate();
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xbd509dea, Offset: 0x2b47
// Size: 0xe
function destroy_cluster_grenade()
{
    self stopsounds();
    self detonate();
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x1b3d82f4, Offset: 0x2b5d
// Size: 0x1b
function destroy_combataxe()
{
    level endon( #"game_ended" );
    wait 0.1;
    combataxe::deletepickup();
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x18e15357, Offset: 0x2b80
// Size: 0xa
function destroy_bunkerbuster()
{
    bunkerbuster::_detonate( self );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x1603143a, Offset: 0x2b92
// Size: 0xb
function destroy_drone_launcher()
{
    drone_launcher::destroy_launcher( undefined, 0 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x8df078e, Offset: 0x2ba5
// Size: 0xc
function function_6ead10556500a837()
{
    drone_launcher::destroy_drone( undefined, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x6001c85a, Offset: 0x2bb9
// Size: 0xc
function destroy_combat_hologram()
{
    combat_hologram::combatholo_destroy( undefined, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xaf092355, Offset: 0x2bcd
// Size: 0xd
function destroy_assault_pack()
{
    ammo_box::ammobox_delete( 1, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x88a72666, Offset: 0x2be2
// Size: 0xb
function destroy_tac_insert()
{
    tac_insert::tacinsert_destroy( 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xc21e5129, Offset: 0x2bf5
// Size: 0xb
function destroy_trophy()
{
    trophy_system::trophy_destroy( 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xfc959ea0, Offset: 0x2c08
// Size: 0x51
function destroy_landmine()
{
    if ( isdefined( self.var_95bfba95499bb5ee ) && self.var_95bfba95499bb5ee )
    {
        thread utility::callsharedfunc( #"landmine", #"deletemine" );
        return;
    }
    
    thread utility::callsharedfunc( #"landmine", #"hash_e6633009f3a8858a" );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x8d6699b1, Offset: 0x2c61
// Size: 0x12
function destroy_sam_turret()
{
    self notify( #"kill_turret", 1, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x69eaaee2, Offset: 0x2c7b
// Size: 0x33
function destroy_dawg()
{
    self.var_c4e26a8fd03fdeea = 1;
    self.var_4e066f8aa40be1ae = 1;
    self dodamage( 999999, self.origin, undefined, undefined, "MOD_CRUSH" );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x59553f67, Offset: 0x2cb6
// Size: 0x15
function destroy_remote_turret()
{
    self notify( #"kill_turret", 1, 1, 0, 1 );
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0x6b1b712e, Offset: 0x2cd3
// Size: 0x8a
function destroy_crate()
{
    level endon( #"game_ended" );
    
    if ( self.cratetype == "dawg" )
    {
        dawg_mp::oncrateactivated( 1 );
        waitframe();
        self.dawg destroy_dawg();
        return;
    }
    
    if ( self.cratetype == "killstreak" )
    {
        self.boobytrapped = 1;
        self.var_53caaa320dbae415 = 1;
        self.var_88529b256d95a199 = 0;
        thread airdrop::capturecrate( undefined );
        self notify( #"carepackage_detonated" );
        thread airdrop::deletecrateimmediate();
    }
}

// Namespace mp_sat_rm_express_train
// Params 0
// Checksum 0xefda03be, Offset: 0x2d65
// Size: 0x2e
function destroy_sabattack_flag()
{
    level endon( #"game_ended" );
    wait 0.1;
    level.flagstate = "reset";
    level notify( #"flag_state_changed" );
}

/#

    // Namespace mp_sat_rm_express_train
    // Params 0
    // Checksum 0x92b36568, Offset: 0x2d9b
    // Size: 0x5, Type: dev
    function function_fe0e76033247e089()
    {
        
    }

    // Namespace mp_sat_rm_express_train
    // Params 1, eflags: 0x4
    // Checksum 0x4fb6aa60, Offset: 0x2da8
    // Size: 0x22, Type: dev
    function private function_2883653ca6300d6f( params )
    {
        level.var_516a75519780598b = 1;
        level thread play_train();
    }

    // Namespace mp_sat_rm_express_train
    // Params 0, eflags: 0x4
    // Checksum 0x16100402, Offset: 0x2dd2
    // Size: 0x2e, Type: dev
    function private function_257f2e0038a68596()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            self waittill( #"toggle_train" );
            function_a8a71dc181155f37( undefined );
        }
    }

    // Namespace mp_sat_rm_express_train
    // Params 0, eflags: 0x4
    // Checksum 0xa7e07f03, Offset: 0x2e08
    // Size: 0x2d, Type: dev
    function private function_d09d80aebf9cc158()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            self waittill( #"weapon_inspect" );
            function_e025f75ff52c5dc7();
        }
    }

    // Namespace mp_sat_rm_express_train
    // Params 1, eflags: 0xc
    // Checksum 0x34780d18, Offset: 0x2e3d
    // Size: 0x11e, Type: dev
    function private function_33103ca1a0bee156( var_12523d3da2c98f9b )
    {
        self notify( #"hash_8b52d9886a93d0f7" );
        self endon( #"hash_8b52d9886a93d0f7" );
        level endon( #"game_ended" );
        
        while ( utility::flag( "<dev string:x45>" ) )
        {
            foreach ( e_emitter in var_12523d3da2c98f9b )
            {
                v_color = e_emitter.b_is_active ? ( 0, 1, 0 ) : ( 1, 0, 0 );
                str_text = e_emitter.b_is_active ? "<dev string:x56>" : "<dev string:x5e>";
                debugstar( e_emitter.origin, v_color, 1, str_text );
            }
            
            waitframe();
        }
    }

    // Namespace mp_sat_rm_express_train
    // Params 1, eflags: 0x4
    // Checksum 0x57d97099, Offset: 0x2f63
    // Size: 0x17c, Type: dev
    function private function_36e191cf340244c3( var_6dc692eb98feaee1 )
    {
        level endon( #"game_ended" );
        var_cd55eea067c5cdf1 = ( 1, 1, 1 );
        debug_color_center = ( 0, 1, 0 );
        
        while ( true )
        {
            for ( i = 0; i < var_6dc692eb98feaee1.size ; i++ )
            {
                car = var_6dc692eb98feaee1[ i ];
                n_length = i == 0 || i == 20 ? 612 : 511;
                center = car.origin;
                front = car.origin + anglestoforward( car.angles + ( 0, 90, 0 ) ) * n_length / 2;
                back = car.origin - anglestoforward( car.angles + ( 0, 90, 0 ) ) * n_length / 2;
                debugstar( front, var_cd55eea067c5cdf1, 1, "<dev string:x62>" + i + "<dev string:x64>", 2 );
                debugstar( back, var_cd55eea067c5cdf1, 1, "<dev string:x62>" + i + "<dev string:x6c>", 2 );
                debugstar( center, debug_color_center, 1, "<dev string:x62>" + i + "<dev string:x73>", 2 );
            }
            
            waitframe();
        }
    }

    // Namespace mp_sat_rm_express_train
    // Params 1, eflags: 0x4
    // Checksum 0xa93ec4c6, Offset: 0x30e7
    // Size: 0x22, Type: dev
    function private function_a8a71dc181155f37( params )
    {
        level.var_516a75519780598b = !level.var_516a75519780598b;
    }

#/
