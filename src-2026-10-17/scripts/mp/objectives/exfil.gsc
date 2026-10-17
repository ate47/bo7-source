#using script_14d76aa023628152;
#using script_1aae2eb1ef28b239;
#using script_1caeae196852962;
#using script_49e4a4c208f44b76;
#using script_4e547d9fe57999c6;
#using script_4f9ce8d249a99f4a;
#using script_569138730a0a130f;
#using script_b90e9249b83faa5;
#using script_f01501ac138f999;
#using scripts\anim\utility_common;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\activity_nexus\activity_participation;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\progress_tracker_container;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_damage;
#using scripts\common\vehicle_interact;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_tracking;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\calloutmarkerping;
#using scripts\mp\content_manager;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\interaction;
#using scripts\mp\mp_agent;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\outofbounds;
#using scripts\mp\overlord;

#namespace exfil;

// Namespace exfil
// Params 0
// Checksum 0x13e2a147, Offset: 0xec1
// Size: 0x123
function init_exfil()
{
    utility::flag_init( "exfil_initialized" );
    namespace_9085ae059032a84f::function_74af1ab4059e3c06( level.var_5d57c0ef0a0a2e4f, level.var_a347479bbc614700 );
    activity_common::registeractivitytype( "REV_OB_EXFIL", &exfil_activity_type_init );
    content_manager::register_script( "exfil", &function_3867121d66a72fb8 );
    level.var_e584ab91aed38e8c = [];
    level.var_a9dd851e37e9eedf = [];
    level.var_12b4cd9ef7a86c02 = [];
    level.var_c8ab615737888686 = [];
    level.var_bf46df4bfc90e3bf = 1;
    callback::add( #"player_spawned", &on_player_spawned );
    callback::add( #"player_disconnect", &on_player_disconnect );
    callback::add( #"on_ai_killed", &on_ai_killed );
    callback::add( "on_zombie_ai_damaged", &on_ai_damaged );
    callback::add( "on_turned", &function_85632c549469dd91 );
    setdvarifuninitialized( @"hash_bc321023e9100f4", 0 );
    setdvarifuninitialized( @"hash_ab8956c864b4d3a4", 0 );
    setdvarifuninitialized( @"hash_348544f95be5e424", 0 );
    function_2880df3073531a72( [ "walkable_heli_navmesh" ] );
    level thread exfil_postmain();
}

// Namespace exfil
// Params 0
// Checksum 0x18ba5b7f, Offset: 0xfec
// Size: 0x17, Type: bool
function function_9aa9df8577941cb0()
{
    if ( getdvarint( @"hash_348544f95be5e424", 0 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 1
// Checksum 0x9198cdf1, Offset: 0x100c
// Size: 0x44, Type: bool
function is_quest_exfil( s_exfil )
{
    if ( isdefined( s_exfil ) && isdefined( s_exfil.instance ) && s_exfil.instance.script_noteworthy == "quest_exfil" )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 1
// Checksum 0x355ae627, Offset: 0x1059
// Size: 0x15b
function start_exfil_defend_mode( s_exfil )
{
    s_exfil notify( #"endon_start_exfil_defend_mode" );
    s_exfil endon( #"endon_start_exfil_defend_mode" );
    
    while ( !isdefined( s_exfil.vh_exfil ) )
    {
        wait 0.5;
    }
    
    s_exfil.vh_exfil endon( #"death" );
    
    if ( !s_exfil.var_dd15ab1f1e29e875 )
    {
        s_exfil.vh_exfil utility::ent_flag_wait( "landed" );
    }
    
    n_exfil_timer = s_exfil.var_a3762004625747f8 ?? 35;
    
    if ( isdefined( s_exfil.var_5cb3a4fb6e8938c3 ) )
    {
        n_exfil_timer = [[ s_exfil.var_5cb3a4fb6e8938c3 ]]( s_exfil );
    }
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            player thread exfil_timer_player_ui( n_exfil_timer, s_exfil );
        }
    }
    
    level thread exfil_timer( s_exfil, n_exfil_timer );
}

// Namespace exfil
// Params 0
// Checksum 0xbb05422b, Offset: 0x11bc
// Size: 0x60
function exfil_activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "REV_OB_EXFIL", 0, &exfil_activity_setup );
    activity_common::function_944074f3079c1d4e( "REV_OB_EXFIL", 1, &exfil_activity_start );
    activity_common::function_944074f3079c1d4e( "REV_OB_EXFIL", 2, &exfil_activity_cleanup );
    activity_common::function_944074f3079c1d4e( "REV_OB_EXFIL", 3, &activity_instance_common::function_bc98ac5775bd8084 );
    activity_common::function_944074f3079c1d4e( "REV_OB_EXFIL", 4, &function_6c6e855b2bd7df12 );
}

// Namespace exfil
// Params 0
// Checksum 0xcc49287f, Offset: 0x1224
// Size: 0x4a
function get_difficulty_region_string()
{
    difficulty_region = undefined;
    
    if ( isdefined( level.var_bd706167fc97713c ) )
    {
        difficulty_region = [[ level.var_bd706167fc97713c ]]( function_6c6e855b2bd7df12() );
    }
    
    if ( !isdefined( difficulty_region ) || difficulty_region == "difficulty_undefined" )
    {
        return "difficulty_easy";
    }
    
    return difficulty_region;
}

// Namespace exfil
// Params 0
// Checksum 0x69eb8b98, Offset: 0x1277
// Size: 0x19
function exfil_activity_setup()
{
    self.difficulty_region = get_difficulty_region_string();
    activity_instance_common::function_46135a69bddfec2c( self );
}

// Namespace exfil
// Params 1
// Checksum 0x95574cac, Offset: 0x1298
// Size: 0x27
function on_player_disconnect( params )
{
    if ( isdefined( self.var_5147067c69d8c534 ) )
    {
        self.var_5147067c69d8c534 delete();
    }
}

// Namespace exfil
// Params 1
// Checksum 0xac36b27, Offset: 0x12c7
// Size: 0x59
function on_player_spawned( params )
{
    self endon( #"death_or_disconnect" );
    
    /#
        utility::flag_wait( "<dev string:x24>" );
        
        if ( level.var_bf46df4bfc90e3bf && isarray( level.var_e584ab91aed38e8c ) && level.var_e584ab91aed38e8c.size )
        {
            function_bf46df4bfc90e3bf();
        }
    #/
}

// Namespace exfil
// Params 1
// Checksum 0x4ab10f47, Offset: 0x1328
// Size: 0x90
function function_4c8ac0dbd10c57( str_name )
{
    foreach ( s_exfil in level.var_e584ab91aed38e8c )
    {
        if ( s_exfil.name == str_name )
        {
            return s_exfil;
        }
    }
}

// Namespace exfil
// Params 3
// Checksum 0x920444e6, Offset: 0x13c0
// Size: 0xdf
function function_d56d196028ca0259( str_name, var_4a57fc55856b7913, var_4a57fb55856b76e0 )
{
    n_ent_num = 0;
    
    if ( isdefined( var_4a57fc55856b7913 ) && isdefined( var_4a57fb55856b76e0 ) )
    {
        n_ent_num = int( var_4a57fb55856b76e0 );
    }
    else if ( isdefined( var_4a57fc55856b7913 ) )
    {
        n_ent_num = int( var_4a57fc55856b7913 );
    }
    
    foreach ( player in level.players )
    {
        if ( player.name == str_name || player getentitynumber() == n_ent_num )
        {
            return player;
        }
    }
}

/#

    // Namespace exfil
    // Params 0
    // Checksum 0xab251c0d, Offset: 0x14a7
    // Size: 0x259, Type: dev
    function setup_exfil_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x37>" );
        devgui::add_devgui_func( "<dev string:x44>", "<dev string:x57>", &function_f0f983e6a0dc7429, 1 );
        devgui::function_77df7fe7dd273e10();
        waitframe();
        devgui::function_9082edeb5db93280( "<dev string:x6a>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            s_exfil function_830e072dba77380e();
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x8e>" + s_exfil.name + "<dev string:x9e>", &function_175d1c332cf947cf );
        }
        
        devgui::function_77df7fe7dd273e10();
        waitframe();
        devgui::function_9082edeb5db93280( "<dev string:xa5>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            s_exfil function_830e072dba77380e();
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x8e>" + s_exfil.name + "<dev string:xce>", &function_175d1c332cf947cf );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:xd4>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            s_exfil function_830e072dba77380e();
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:xfa>" + s_exfil.name + "<dev string:xce>", &function_87bdbd2607a433f5 );
        }
        
        devgui::function_77df7fe7dd273e10();
        waitframe();
        utility::flag_set( "<dev string:x24>" );
    }

    // Namespace exfil
    // Params 0
    // Checksum 0x2e9aa342, Offset: 0x1708
    // Size: 0x857, Type: dev
    function function_f0f983e6a0dc7429()
    {
        var_344c87cda146b92c = ( 0, 0, 4 );
        n_text_size = 0.25;
        
        while ( true )
        {
            foreach ( s_exfil in level.var_e584ab91aed38e8c )
            {
                if ( !isdefined( s_exfil.mdl_exfil ) )
                {
                    continue;
                }
                
                var_d876b0c0fe4d6eba = "<dev string:x114>";
                
                if ( isent( s_exfil.mdl_exfil.interact ) && s_exfil.mdl_exfil.interact tagexists( "<dev string:x11f>" ) )
                {
                    v_position = s_exfil.mdl_exfil gettagorigin( "<dev string:x11f>" );
                    var_d876b0c0fe4d6eba = "<dev string:x11f>";
                }
                else if ( isdefined( s_exfil.mdl_exfil.interact ) )
                {
                    v_position = s_exfil.mdl_exfil.interact.origin;
                }
                else
                {
                    v_position = s_exfil.origin;
                }
                
                if ( function_9aa9df8577941cb0() )
                {
                    interact_use_range = 394;
                }
                else
                {
                    interact_use_range = 64;
                }
                
                utility::draw_circle( v_position, interact_use_range, ( 0, 0, 1 ), 1, 0, 1 );
                sphere( v_position, 200, ( 0, 0, 1 ) );
                print3d( v_position, "<dev string:x128>" + s_exfil.name, ( 0, 1, 0 ), 1, n_text_size );
                print3d( v_position - var_344c87cda146b92c * 1, "<dev string:x135>" + s_exfil.a_exfil_players.size, ( 0, 1, 0 ), 1, n_text_size );
                print3d( v_position - var_344c87cda146b92c * 2, "<dev string:x151>" + s_exfil.a_potential_players.size, ( 0, 1, 0 ), 1, n_text_size );
                print3d( v_position - var_344c87cda146b92c * 3, "<dev string:x170>" + ( s_exfil.b_exfil_started ? "<dev string:x17c>" : "<dev string:x180>" ), ( 0, 1, 0 ), 1, n_text_size );
                
                if ( isdefined( s_exfil.s_exfil_destination ) )
                {
                    var_e15ae1b5594b8b06 = s_exfil.s_exfil_destination.origin;
                    var_5ec9841fc2b11976 = 0;
                    
                    if ( isdefined( s_exfil.targetname ) && isdefined( utility::getstruct( s_exfil.targetname + "<dev string:x183>", "<dev string:x189>" ) ) )
                    {
                        s_landing_spot = utility::getstruct( s_exfil.targetname + "<dev string:x183>", "<dev string:x189>" );
                        var_e15ae1b5594b8b06 = s_landing_spot.origin;
                    }
                    else if ( s_exfil.s_exfil_destination == s_exfil )
                    {
                        var_e15ae1b5594b8b06 -= var_344c87cda146b92c * 4;
                        var_5ec9841fc2b11976 = 1;
                    }
                    
                    if ( var_5ec9841fc2b11976 )
                    {
                        print3d( var_e15ae1b5594b8b06, "<dev string:x19b>", ( 0, 1, 0 ), 1, n_text_size );
                    }
                    else
                    {
                        utility::draw_circle( var_e15ae1b5594b8b06, 200, ( 0, 0, 1 ), 1, 0, 1 );
                        sphere( var_e15ae1b5594b8b06, 200, ( 0, 0, 1 ) );
                        line( v_position, var_e15ae1b5594b8b06 );
                        print3d( var_e15ae1b5594b8b06, "<dev string:x1c1>" + s_exfil.name, ( 0, 1, 0 ), 1, n_text_size );
                    }
                    
                    if ( !function_9aa9df8577941cb0() )
                    {
                        print3d( var_e15ae1b5594b8b06 - var_344c87cda146b92c * 1, "<dev string:x1d8>" + function_664072bb6ca45820( s_exfil ), ( 0, 1, 0 ), 1, n_text_size );
                    }
                }
                else if ( isdefined( s_exfil.target2 ) )
                {
                    var_5c885eaadf6ac2cb = utility::getstructarray( s_exfil.target2, "<dev string:x1ea>" );
                    
                    foreach ( n_index, s_exfil_destination in var_5c885eaadf6ac2cb )
                    {
                        utility::draw_circle( s_exfil_destination.origin, 200, ( 1, 0, 0 ), 1, 0, 1 );
                        sphere( s_exfil_destination.origin, 200, ( 1, 0, 0 ) );
                        line( v_position, s_exfil_destination.origin );
                        print3d( s_exfil_destination.origin, "<dev string:x1f5>" + n_index + "<dev string:x209>" + s_exfil.name, ( 0, 1, 0 ), 1, n_text_size );
                    }
                }
                
                foreach ( player in s_exfil.a_exfil_players )
                {
                    if ( isplayer( player ) )
                    {
                        print3d( player.origin, "<dev string:x20f>" + s_exfil.name, ( 0, 1, 0 ), 1, n_text_size );
                    }
                }
                
                s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
                
                foreach ( ai in s_exfil.var_79507aedd281f84d )
                {
                    if ( isalive( ai ) )
                    {
                        print3d( ai.origin, "<dev string:x20f>" + s_exfil.name, ( 0, 1, 0 ), 1, n_text_size );
                        print3d( ai.origin - var_344c87cda146b92c, "<dev string:x226>" + s_exfil.var_79507aedd281f84d.size, ( 0, 1, 0 ), 1, n_text_size );
                    }
                }
                
                if ( isdefined( s_exfil.vh_exfil ) )
                {
                    utility::draw_circle( s_exfil.vh_exfil.origin, 500, ( 0, 1, 0 ), 1, 0, 1 );
                    print3d( s_exfil.vh_exfil.origin, s_exfil.vh_exfil vehicle_getspeed() + "<dev string:x237>", ( 0, 1, 0 ), 1, n_text_size * 4 );
                    
                    if ( isdefined( s_exfil.s_exfil_destination ) )
                    {
                        line( s_exfil.vh_exfil.origin, s_exfil.s_exfil_destination.origin, ( 0, 1, 0 ) );
                        n_speed_mph = s_exfil.vh_exfil vehicle_getspeed();
                        
                        if ( n_speed_mph > 0 )
                        {
                            n_distance_away = distance( s_exfil.vh_exfil.origin, s_exfil.s_exfil_destination.origin ) / 63360;
                            n_time_away = n_distance_away / n_speed_mph;
                            n_time_away *= 3600;
                            print3d( s_exfil.vh_exfil.origin - var_344c87cda146b92c, "<dev string:x23c>" + n_time_away + "<dev string:x259>", ( 0, 1, 0 ), 1, n_text_size * 4 );
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace exfil
    // Params 0
    // Checksum 0x98e12da9, Offset: 0x1f67
    // Size: 0x4f4, Type: dev
    function function_bf46df4bfc90e3bf()
    {
        if ( self.var_1f12052064b5e3ae )
        {
            return;
        }
        
        self.var_1f12052064b5e3ae = 1;
        str_player_name = self.name ?? "<dev string:x262>" + self getentitynumber();
        devgui::function_9082edeb5db93280( "<dev string:x26a>" + str_player_name + "<dev string:x283>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            if ( isdefined( s_exfil.target2 ) )
            {
                var_9af374cfc2dd171c = utility::getstructarray( s_exfil.target2, "<dev string:x1ea>" );
                
                foreach ( n_index, s_exfil_destination in var_9af374cfc2dd171c )
                {
                    devgui::function_cd4e263c1f3018ae( s_exfil.name + "<dev string:x285>" + n_index + "<dev string:x29a>", "<dev string:x29c>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + n_index + "<dev string:x2a9>" + self getentitynumber(), &devgui_exfil_start );
                }
                
                continue;
            }
            
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x29c>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + self getentitynumber(), &devgui_exfil_start );
        }
        
        devgui::function_77df7fe7dd273e10();
        waitframe();
        devgui::function_9082edeb5db93280( "<dev string:x2ab>" + str_player_name + "<dev string:x283>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x2c3>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + self getentitynumber(), &function_10d2fe9b0af0b298 );
        }
        
        devgui::function_77df7fe7dd273e10();
        waitframe();
        devgui::function_9082edeb5db93280( "<dev string:x2cf>" + str_player_name + "<dev string:x283>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x2ea>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + self getentitynumber(), &function_34040c8803bf7a4a );
        }
        
        devgui::function_77df7fe7dd273e10();
        waitframe();
        devgui::function_9082edeb5db93280( "<dev string:x2f9>" + str_player_name + "<dev string:x283>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x31a>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + self getentitynumber(), &function_2207c51a3812b6e8 );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:x327>" + str_player_name + "<dev string:x283>" );
        
        foreach ( s_exfil in level.var_e584ab91aed38e8c )
        {
            devgui::function_cd4e263c1f3018ae( s_exfil.name, "<dev string:x348>" + s_exfil.name + "<dev string:x2a9>" + str_player_name + "<dev string:x2a9>" + self getentitynumber(), &function_a10c1fa91226e6d1 );
        }
        
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace exfil
    // Params 1
    // Checksum 0xd82578a8, Offset: 0x2463
    // Size: 0xac, Type: dev
    function devgui_exfil_start( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        player = function_d56d196028ca0259( params[ 1 ], params[ 2 ], params[ 3 ] );
        
        if ( isdefined( s_exfil ) )
        {
            if ( isdefined( params[ 2 ] ) && isdefined( params[ 3 ] ) )
            {
                s_exfil.var_607f52acce04a484 = int( params[ 2 ] );
            }
            
            setdvar( @"hash_bc321023e9100f4", 1 );
            s_exfil.b_disabled = undefined;
            s_exfil exfil_interact_init();
            s_exfil.mdl_exfil.interact on_use_exfil_interact( player );
        }
    }

    // Namespace exfil
    // Params 1
    // Checksum 0xd311f88d, Offset: 0x2517
    // Size: 0x4a, Type: dev
    function function_10d2fe9b0af0b298( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        player = function_d56d196028ca0259( params[ 1 ], params[ 2 ] );
        player.var_62c769ea7a03f7b8 = 1;
    }

    // Namespace exfil
    // Params 1
    // Checksum 0xcc3528b5, Offset: 0x2569
    // Size: 0x4a, Type: dev
    function function_34040c8803bf7a4a( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        player = function_d56d196028ca0259( params[ 1 ], params[ 2 ] );
        player.var_5918064de972f502 = 1;
    }

    // Namespace exfil
    // Params 1
    // Checksum 0x2a00493a, Offset: 0x25bb
    // Size: 0x149, Type: dev
    function function_175d1c332cf947cf( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        
        if ( !isdefined( s_exfil ) || !s_exfil.b_exfil_started )
        {
            return;
        }
        
        if ( params[ 1 ] == "<dev string:x363>" )
        {
            function_f8fa6a3486e9ed21( s_exfil );
            s_exfil.n_kills = function_7759b15fe5ee89e9( s_exfil );
            
            if ( utility::issharedfuncdefined( #"exfil", #"hash_727362151127a027" ) )
            {
                foreach ( player in s_exfil.a_exfil_players )
                {
                    player utility::callsharedfunc( #"exfil", #"hash_727362151127a027", s_exfil );
                }
            }
            else
            {
                s_exfil.s_activity_instance progress_tracker_container::function_c47bfeecd65c7559( "<dev string:x368>", function_664072bb6ca45820( s_exfil ) );
            }
            
            function_f910f5c95b5f9a04( s_exfil );
            return;
        }
        
        s_exfil notify( #"exfil_timer_force_complete" );
    }

    // Namespace exfil
    // Params 1
    // Checksum 0xbc406a, Offset: 0x270c
    // Size: 0x5f, Type: dev
    function function_87bdbd2607a433f5( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        
        if ( !isdefined( s_exfil ) || !s_exfil.b_exfil_started )
        {
            return;
        }
        
        if ( isdefined( s_exfil.vh_exfil ) )
        {
            s_exfil.vh_exfil exfil_vehicle_delete( s_exfil );
        }
    }

    // Namespace exfil
    // Params 1
    // Checksum 0x1fc4f492, Offset: 0x2773
    // Size: 0x8b, Type: dev
    function function_2207c51a3812b6e8( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        player = function_d56d196028ca0259( params[ 1 ], params[ 2 ] );
        
        if ( isdefined( s_exfil.vh_exfil ) )
        {
            if ( function_6c954b552067189f() )
            {
                s_exfil.vh_exfil thread function_185c01ffe37a9db7( player, 1 );
                return;
            }
            
            s_exfil.vh_exfil.interact function_508d7657b4bfef45( player );
        }
    }

    // Namespace exfil
    // Params 1
    // Checksum 0xdc64beed, Offset: 0x2806
    // Size: 0x71, Type: dev
    function function_a10c1fa91226e6d1( params )
    {
        s_exfil = function_4c8ac0dbd10c57( params[ 0 ] );
        player = function_d56d196028ca0259( params[ 1 ], params[ 2 ] );
        
        if ( isdefined( s_exfil.s_exfil_destination ) && isplayer( player ) )
        {
            player setorigin( s_exfil.s_exfil_destination.origin );
        }
    }

#/

// Namespace exfil
// Params 0
// Checksum 0xf75703c2, Offset: 0x287f
// Size: 0x799
function exfil_postmain()
{
    level endon( #"game_ended" );
    wait 1;
    
    if ( isdefined( level.var_6694eca554285e63 ) && !getdvarint( @"scr_ob_exfil_spawn_all", 0 ) )
    {
        delayspawntime = [[ level.var_6694eca554285e63 ]]();
        
        if ( delayspawntime > 0 )
        {
            wait delayspawntime;
        }
    }
    
    exfilspawnfilter = getdvar( @"scr_exfil_spawn_filter", "" );
    a_destinations = utility::getstructarray( "content_destination", "variantname" );
    
    foreach ( destination in a_destinations )
    {
        if ( destination.script_noteworthy == "quest_destination" )
        {
            continue;
        }
        
        if ( exfilspawnfilter != "" && destination.script_label != exfilspawnfilter )
        {
            continue;
        }
        
        level thread function_98f09d96c30c3105( destination );
    }
    
    wait 0.5;
    var_288c06f658da68dc = utility::getstructarray( "content_struct", "variantname" );
    
    foreach ( i, s_content in var_288c06f658da68dc )
    {
        if ( s_content.content_key == "exfil_interact" && !arraycontains( level.var_e584ab91aed38e8c, s_content ) )
        {
            if ( exfilspawnfilter != "" && s_content.script_label != exfilspawnfilter )
            {
                continue;
            }
            
            level.var_e584ab91aed38e8c[ level.var_e584ab91aed38e8c.size ] = s_content;
        }
    }
    
    level.var_e584ab91aed38e8c = arrayrandomize( level.var_e584ab91aed38e8c );
    
    if ( function_9aa9df8577941cb0() )
    {
        if ( getdvarint( @"scr_ob_exfil_spawn_all", 0 ) )
        {
            foreach ( s_exfil in level.var_e584ab91aed38e8c )
            {
                s_exfil exfil_interact_init();
                level thread start_exfil_spawns_at_destination( s_exfil );
            }
            
            var_cfd258624129c9f4 = level.var_e584ab91aed38e8c;
            
            if ( isdefined( level.var_557007fc804faab8 ) )
            {
                var_95ce3d6cd087ad3a = [[ level.var_557007fc804faab8 ]]( var_cfd258624129c9f4 );
                
                foreach ( s_exfil in var_95ce3d6cd087ad3a )
                {
                    s_exfil.b_disabled = 0;
                }
            }
        }
        else if ( level.ob_pvpve && level.ob_spawn_point_override && isdefined( level.var_e535066d2e47e0f0 ) )
        {
            var_12bc38709b909e80 = sortbydistance( level.var_e584ab91aed38e8c, [[ level.var_e535066d2e47e0f0 ]]() );
            var_cfd258624129c9f4 = [ var_12bc38709b909e80[ 0 ], var_12bc38709b909e80[ 1 ], var_12bc38709b909e80[ 2 ] ];
            
            foreach ( s_exfil in var_cfd258624129c9f4 )
            {
                s_exfil exfil_interact_init();
                level thread start_exfil_spawns_at_destination( s_exfil );
            }
            
            if ( isdefined( level.var_557007fc804faab8 ) )
            {
                var_95ce3d6cd087ad3a = [[ level.var_557007fc804faab8 ]]( var_cfd258624129c9f4 );
                
                foreach ( s_exfil in var_95ce3d6cd087ad3a )
                {
                    s_exfil.b_disabled = 0;
                }
            }
        }
        else
        {
            var_cfd258624129c9f4 = [];
            
            foreach ( s_exfil in level.var_e584ab91aed38e8c )
            {
                if ( s_exfil.script_parameters != "disabled" )
                {
                    var_cfd258624129c9f4[ var_cfd258624129c9f4.size ] = s_exfil;
                }
            }
            
            if ( isdefined( level.var_557007fc804faab8 ) )
            {
                var_95ce3d6cd087ad3a = [[ level.var_557007fc804faab8 ]]( var_cfd258624129c9f4 );
                
                foreach ( s_exfil in var_95ce3d6cd087ad3a )
                {
                    s_exfil.b_disabled = 0;
                }
                
                vehicle_tracking::reserve_vehicle( var_95ce3d6cd087ad3a.size );
            }
            else
            {
                n_enabled = 0;
                
                foreach ( s_exfil in var_cfd258624129c9f4 )
                {
                    s_exfil.b_disabled = 0;
                    n_enabled += 1;
                    
                    if ( n_enabled >= 4 )
                    {
                        break;
                    }
                }
            }
            
            foreach ( s_exfil in level.var_e584ab91aed38e8c )
            {
                if ( !isdefined( s_exfil.b_disabled ) )
                {
                    s_exfil.b_disabled = 1;
                }
                
                s_exfil exfil_interact_init();
                
                if ( !s_exfil.b_disabled )
                {
                    level thread start_exfil_spawns_at_destination( s_exfil );
                }
            }
        }
    }
    else
    {
        foreach ( i, s_exfil in level.var_e584ab91aed38e8c )
        {
            s_exfil exfil_interact_init();
        }
    }
    
    wait 1;
    utility::flag_set( "exfil_initialized" );
    
    /#
        setup_exfil_devgui();
    #/
}

// Namespace exfil
// Params 1
// Checksum 0x9a902058, Offset: 0x3020
// Size: 0x142
function function_98f09d96c30c3105( destination )
{
    if ( !isdefined( destination.locations ) )
    {
        assertmsg( "<dev string:x37e>" + destination.targetname );
        return;
    }
    
    foreach ( location in destination.locations )
    {
        exfil_instance = location.instances[ "exfil" ];
        
        if ( isdefined( exfil_instance ) )
        {
            foreach ( instance in exfil_instance.versions )
            {
                content_manager::spawn_instance( instance );
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x80b0c608, Offset: 0x316a
// Size: 0x1b6
function function_3867121d66a72fb8( instance )
{
    if ( isarray( instance.contentgroups[ "exfil_interact" ] ) )
    {
        var_47529d5e6c73e088 = getdvar( @"hash_e497b4cbd51708bd", "" );
        var_530eeba8f12e36c4 = strtok( var_47529d5e6c73e088, "," );
        level.var_e584ab91aed38e8c = arraycombineunique( level.var_e584ab91aed38e8c, instance.contentgroups[ "exfil_interact" ] );
        str_destination = instance.location.destination.targetname;
        
        foreach ( s_exfil in instance.contentgroups[ "exfil_interact" ] )
        {
            s_exfil.instance = instance;
            s_exfil.str_destination = str_destination;
            
            if ( !isdefined( level.var_a9dd851e37e9eedf[ str_destination ] ) )
            {
                level.var_a9dd851e37e9eedf[ str_destination ] = [];
            }
            
            level.var_a9dd851e37e9eedf[ str_destination ] = arraycombineunique( level.var_a9dd851e37e9eedf[ str_destination ], [ s_exfil ] );
            
            if ( var_530eeba8f12e36c4.size && isdefined( s_exfil.targetname ) && arraycontains( var_530eeba8f12e36c4, s_exfil.targetname ) )
            {
                s_exfil.script_parameters = "disabled";
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x231f519a, Offset: 0x3328
// Size: 0x5f
function function_3e68f7962cd82ad3( s_exfil )
{
    var_71d0d3e50df16349 = level.var_a347479bbc614700 ?? "REV_OB_EXFIL";
    
    if ( isdefined( s_exfil.var_b0a60f3dd6dac61a ) )
    {
        var_71d0d3e50df16349 = s_exfil.var_b0a60f3dd6dac61a;
    }
    
    s_activity = namespace_9085ae059032a84f::getactivitydefinition( var_71d0d3e50df16349 );
    return namespace_9085ae059032a84f::function_9129cd8075c85c09( s_activity );
}

// Namespace exfil
// Params 0
// Checksum 0x73560cc6, Offset: 0x3390
// Size: 0x54
function function_830e072dba77380e()
{
    if ( !isdefined( self.name ) )
    {
        if ( !isdefined( level.var_17493d1b4d4a2a83 ) )
        {
            level.var_17493d1b4d4a2a83 = 0;
        }
        
        self.name = self.targetname ?? "Exfil_" + level.var_17493d1b4d4a2a83;
        level.var_17493d1b4d4a2a83++;
    }
}

// Namespace exfil
// Params 0
// Checksum 0x624b14f2, Offset: 0x33ec
// Size: 0x4c1
function exfil_interact_init()
{
    s_exfil_activity_bundle = function_3e68f7962cd82ad3( self );
    self.var_9abb14c772c4203f = s_exfil_activity_bundle.var_f816233d1a8c8545 ?? "tag_origin";
    
    if ( function_9aa9df8577941cb0() )
    {
        if ( !isdefined( self.radius ) )
        {
            self.radius = 394;
        }
    }
    else if ( !isdefined( self.radius ) )
    {
        self.radius = 64;
    }
    
    if ( !isdefined( self.angles ) )
    {
        self.angles = ( 0, 0, 0 );
    }
    
    self.a_potential_players = [];
    self.a_exfil_players = [];
    self.var_79507aedd281f84d = [];
    self.var_9af374cfc2dd171c = [];
    self.n_kills = 0;
    self.var_bca9cc9d4e28fff5 = 0;
    function_73335ef7f523fb05( 0, self );
    function_830e072dba77380e();
    
    if ( function_9aa9df8577941cb0() )
    {
        self.origin = getgroundposition( self.origin + ( 0, 0, 8 ), 16 ) + ( 0, 0, 2 );
    }
    
    exfil_spawn_interact( self );
    
    if ( !isdefined( self.mdl_exfil.interact ) )
    {
        if ( isent( self.mdl_exfil ) && !is_quest_exfil( self ) )
        {
            if ( isdefined( level.var_df4e6fb4f853185b ) )
            {
                self.mdl_exfil.interact = interaction::register_interact( self.mdl_exfil, self.radius, &on_use_exfil_interact );
                self.mdl_exfil.interact interaction::set_interact_hint_callback( level.var_df4e6fb4f853185b );
            }
            else
            {
                self.mdl_exfil.interact = interaction::register_interact( self.mdl_exfil, self.radius, &on_use_exfil_interact, level.var_cdacce741094543b ?? &"shared_hintstrings/exfil_start_use_generic" );
            }
            
            self.mdl_exfil.interact sethintonobstruction( "show" );
        }
        else
        {
            self.mdl_exfil.interact = interaction::register_scriptable_interact( self.mdl_exfil, &on_use_exfil_interact );
        }
        
        self.mdl_exfil.interact interaction::function_e4a4753e6eac02d7();
    }
    
    if ( isent( self.mdl_exfil.interact ) && !is_quest_exfil( self ) )
    {
        if ( !isdefined( level.var_fc592a2a0271da96 ) )
        {
            level.var_fc592a2a0271da96 = 1500;
        }
        
        self.mdl_exfil.interact setuseholdduration( level.var_fc592a2a0271da96 );
        
        if ( self.mdl_exfil.interact tagexists( "tag_hint" ) )
        {
            self.mdl_exfil.interact sethinttag( "tag_hint" );
        }
    }
    else
    {
        self.mdl_exfil.interact utility::function_7c10ea82c1e305b8( "cp_mp_exfil_site", "ready" );
    }
    
    self.mdl_exfil.interact.s_exfil = self;
    
    if ( function_9aa9df8577941cb0() )
    {
        function_1cda128151c81f5( self );
        self.s_exfil_destination = utility::array_random( self.var_9af374cfc2dd171c );
        exfil_spawn_destination( self );
        self.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "default_icon" );
    }
    
    if ( self.b_disabled )
    {
        if ( isdefined( self.mdl_exfil.interact ) )
        {
            if ( isent( self.mdl_exfil.interact ) )
            {
                self.mdl_exfil.interact delete();
            }
            else
            {
                self.mdl_exfil.interact freescriptable();
            }
        }
        
        if ( isdefined( self.mdl_exfil ) )
        {
            if ( isent( self.mdl_exfil ) )
            {
                self.mdl_exfil delete();
            }
            else
            {
                self.mdl_exfil freescriptable();
            }
        }
        
        if ( isdefined( self.s_exfil_destination.mdl_destination ) )
        {
            if ( isent( self.s_exfil_destination.mdl_destination ) )
            {
                self.s_exfil_destination.mdl_destination delete();
                return;
            }
            
            self.s_exfil_destination.mdl_destination freescriptable();
        }
        
        return;
    }
    
    level.var_12b4cd9ef7a86c02[ level.var_12b4cd9ef7a86c02.size ] = self;
    function_ee13561bfe62be01();
}

// Namespace exfil
// Params 1
// Checksum 0x76bdbdc6, Offset: 0x38b5
// Size: 0x11a
function exfil_spawn_interact( s_exfil )
{
    if ( !isdefined( s_exfil.mdl_exfil ) )
    {
        if ( is_quest_exfil( s_exfil ) && isdefined( s_exfil.var_58e8d4230bad45f4 ) )
        {
            s_exfil.mdl_exfil = content_manager::spawn_script_model( s_exfil, s_exfil.var_58e8d4230bad45f4, 0, 1 );
            params = spawnstruct();
            params.mdl_exfil = s_exfil.mdl_exfil;
            callback::callback( "quest_exfil_spawned", params );
        }
        else if ( function_9aa9df8577941cb0() )
        {
            if ( !isdefined( level.var_96afffe9eb3c07da ) )
            {
                level.var_96afffe9eb3c07da = "cp_mp_exfil_site_entityless";
            }
            
            s_exfil.mdl_exfil = spawnscriptable( level.var_96afffe9eb3c07da, s_exfil.origin, s_exfil.angles );
        }
        else
        {
            s_exfil.mdl_exfil = content_manager::spawn_script_model( s_exfil, s_exfil.var_9abb14c772c4203f, 0, 1 );
        }
    }
    
    calloutmarkerping::function_6052d1ed5729bcfc( s_exfil.mdl_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0x47259387, Offset: 0x39d7
// Size: 0xaf
function exfil_spawn_destination( s_exfil )
{
    if ( isdefined( level.var_c81b9848be2307f4 ) )
    {
        level thread [[ level.var_c81b9848be2307f4 ]]( s_exfil );
        return;
    }
    
    if ( !isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        if ( function_9aa9df8577941cb0() && isdefined( s_exfil.mdl_exfil ) )
        {
            s_exfil.s_exfil_destination.mdl_destination = s_exfil.mdl_exfil;
            return;
        }
        
        s_exfil.s_exfil_destination.mdl_destination = content_manager::spawn_script_model( s_exfil.s_exfil_destination, "cp_mp_exfil_site_xmodel", 0, 1 );
    }
}

// Namespace exfil
// Params 0
// Checksum 0x1324d8db, Offset: 0x3a8e
// Size: 0xfe
function function_ee13561bfe62be01()
{
    if ( isdefined( level.var_86a37deb48edc350 ) )
    {
        self.mdl_exfil thread [[ level.var_86a37deb48edc350 ]]();
        return;
    }
    
    exfil_icon = "ui_icon_hud_exfil_chopper";
    
    if ( is_quest_exfil( self ) )
    {
        exfil_icon = "ui_map_icon_ob_quest_exfil";
    }
    
    if ( level.var_c4d360df2f5424a6 )
    {
        n_obj_id = objidpoolmanager::requestobjectiveid( 1 );
        self.mdl_exfil.n_obj_id = n_obj_id;
        objidpoolmanager::objective_add_objective( n_obj_id, "invisible", self.mdl_exfil.origin, exfil_icon, "icon_regular" );
        
        if ( isent( self.mdl_exfil ) )
        {
            objidpoolmanager::update_objective_onentity( n_obj_id, self.mdl_exfil );
        }
        
        objidpoolmanager::function_a9c7f671147b1e21( n_obj_id, "icon_regular" );
        objective_setlabel( n_obj_id, &"shared_hintstrings/exfil" );
        objective_setplayintro( n_obj_id, 0 );
        self.mdl_exfil thread exfil_interact_objective_distance( 1024 );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x7c4c2e31, Offset: 0x3b94
// Size: 0x22c
function exfil_interact_objective_distance( n_distance )
{
    self notify( #"end_exfil_interact_objective_distance" );
    self endon( #"death" );
    self endon( #"end_exfil_interact_objective_distance" );
    
    if ( !isdefined( self.n_obj_id ) )
    {
        return;
    }
    
    n_obj_id = self.n_obj_id;
    n_distance_sq = n_distance * n_distance;
    
    while ( true )
    {
        objective_showtoplayersinmask( n_obj_id );
        
        foreach ( player in level.players )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            if ( isdefined( level.var_d1c505330bef7d45 ) )
            {
                if ( !self [[ level.var_d1c505330bef7d45 ]]( player ) )
                {
                    if ( isdefined( self.s_exfil.minimap_scriptable ) )
                    {
                        self.s_exfil.minimap_scriptable setscriptablepartstate( "content_interact", "hidden" );
                    }
                    
                    self disableplayeruse( player );
                    objective_removeclientfrommask( n_obj_id, player );
                    continue;
                }
                
                self enableplayeruse( player );
                
                if ( isdefined( self.s_exfil.minimap_scriptable ) )
                {
                    self.s_exfil.minimap_scriptable setscriptablepartstate( "content_interact", "visible" );
                }
            }
            
            if ( player function_fc901adb1952a733() )
            {
                objective_removeclientfrommask( n_obj_id, player );
                continue;
            }
            
            if ( isdefined( self.s_exfil ) && ( self.s_exfil.b_exfil_started || self.s_exfil.b_disabled ) )
            {
                objective_removeclientfrommask( n_obj_id, player );
                continue;
            }
            
            if ( distancesquared( player.origin, self.origin ) <= n_distance_sq )
            {
                objective_addclienttomask( n_obj_id, player );
            }
            else
            {
                objective_removeclientfrommask( n_obj_id, player );
            }
            
            waitframe();
        }
        
        wait 0.5;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x94d3a8f4, Offset: 0x3dc8
// Size: 0x151
function on_use_exfil_interact( player )
{
    if ( !isdefined( self.s_exfil ) || self.s_exfil.b_exfil_started )
    {
        if ( isdefined( self.s_exfil ) )
        {
            logstring( "==CPMP EXFIL: Exfil " + self.s_exfil.name + " is already active and was never properly reset!" );
            return;
        }
        
        logstring( "==CPMP Exfil: Exfil at " + player.origin + " does not have a valid struct assigned!" );
        return;
    }
    
    if ( isdefined( level.var_d1c505330bef7d45 ) )
    {
        if ( !self [[ level.var_d1c505330bef7d45 ]]( player ) )
        {
            if ( isent( self ) )
            {
                self playsoundtoplayer( #"ui_zm_core_door_purchase_deny", player );
            }
            
            return;
        }
    }
    
    if ( level.var_75cb3c4da4343267 && isdefined( level.var_b5de30d26ddb6403 ) )
    {
        params = spawnstruct();
        params.s_exfil = self.s_exfil;
        
        if ( !player [[ level.var_b5de30d26ddb6403 ]]( #"hash_eea98455a74fc364", params ) )
        {
            return;
        }
    }
    
    level.var_12b4cd9ef7a86c02 = arrayremove( level.var_12b4cd9ef7a86c02, self.s_exfil );
    function_c85a388074ac2fb0( 0 );
    level thread exfil_start( self.s_exfil, player );
}

// Namespace exfil
// Params 1
// Checksum 0x6b89c050, Offset: 0x3f21
// Size: 0x66
function function_c85a388074ac2fb0( b_usable = 1 )
{
    if ( isent( self ) && !is_quest_exfil( self.s_exfil ) )
    {
        self setusableenabled( b_usable );
        return;
    }
    
    if ( b_usable )
    {
        utility::function_7c10ea82c1e305b8( "cp_mp_exfil_site", "ready" );
        return;
    }
    
    utility::function_7c10ea82c1e305b8( "cp_mp_exfil_site", "standby" );
}

// Namespace exfil
// Params 0
// Checksum 0xa8a3caf4, Offset: 0x3f8f
// Size: 0x20, Type: bool
function function_fc901adb1952a733()
{
    if ( isdefined( self.s_exfil ) || self.var_28eba4283d3b4190 )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 0
// Checksum 0x583b1fe3, Offset: 0x3fb8
// Size: 0x17, Type: bool
function function_6c954b552067189f()
{
    if ( getdvarint( @"hash_ab8956c864b4d3a4", 0 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 2
// Checksum 0x1c7e315a, Offset: 0x3fd8
// Size: 0x5e
function function_73335ef7f523fb05( n_spawns, s_exfil = level.s_exfil_active )
{
    if ( isdefined( level.var_dbe95828c647bfa5 ) )
    {
        s_exfil.var_de40c16d7ce53e6f = [[ level.var_dbe95828c647bfa5 ]]();
        return;
    }
    
    if ( isdefined( s_exfil ) )
    {
        s_exfil.var_de40c16d7ce53e6f = n_spawns;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x35728638, Offset: 0x403e
// Size: 0x33, Type: bool
function function_7759b15fe5ee89e9( s_exfil = level.s_exfil_active )
{
    if ( isdefined( s_exfil ) )
    {
        return ( s_exfil.var_de40c16d7ce53e6f ?? 0 );
    }
    
    return false;
}

// Namespace exfil
// Params 1
// Checksum 0x4145dcf, Offset: 0x407a
// Size: 0x45, Type: bool
function function_325d6fb86c92b4b7( s_exfil = level.s_exfil_active )
{
    var_c87074cff3e82c46 = function_7759b15fe5ee89e9( s_exfil );
    
    if ( s_exfil.var_bca9cc9d4e28fff5 >= var_c87074cff3e82c46 )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 1
// Checksum 0xf6c0cc11, Offset: 0x40c8
// Size: 0x60
function function_7c921bb325ee0536( s_exfil = level.s_exfil_active )
{
    if ( isdefined( s_exfil ) && isarray( s_exfil.var_79507aedd281f84d ) )
    {
        s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
        return s_exfil.var_79507aedd281f84d.size;
    }
    
    return 0;
}

// Namespace exfil
// Params 1
// Checksum 0x6fa4c9b0, Offset: 0x4131
// Size: 0x2f
function function_d3439734b6bf8cf6( s_exfil = level.s_exfil_active )
{
    if ( isdefined( s_exfil ) )
    {
        return s_exfil.n_kills;
    }
    
    return 0;
}

// Namespace exfil
// Params 1
// Checksum 0x5754c4cc, Offset: 0x4169
// Size: 0x50
function function_664072bb6ca45820( s_exfil = level.s_exfil_active )
{
    if ( isdefined( s_exfil ) )
    {
        n_kills_remaining = function_7759b15fe5ee89e9( s_exfil ) - function_d3439734b6bf8cf6( s_exfil );
        n_kills_remaining = max( n_kills_remaining, 0 );
        return int( n_kills_remaining );
    }
    
    return 0;
}

// Namespace exfil
// Params 0
// Checksum 0x676d11d7, Offset: 0x41c2
// Size: 0x2
function exfil_activity_start()
{
    
}

// Namespace exfil
// Params 0
// Checksum 0x11af4b22, Offset: 0x41cc
// Size: 0x2
function exfil_activity_cleanup()
{
    
}

// Namespace exfil
// Params 0
// Checksum 0x5e236b14, Offset: 0x41d6
// Size: 0x8c
function function_6c6e855b2bd7df12()
{
    if ( isdefined( self.s_exfil ) )
    {
        if ( isdefined( self.s_exfil.s_exfil_destination ) )
        {
            return self.s_exfil.s_exfil_destination.origin;
        }
        else
        {
            return self.s_exfil.origin;
        }
    }
    else if ( isdefined( level.s_exfil_active ) )
    {
        return level.s_exfil_active.origin;
    }
    
    return ( 0, 0, 0 );
}

// Namespace exfil
// Params 2
// Checksum 0xa9e4f56e, Offset: 0x426b
// Size: 0x502
function exfil_start( s_exfil, player_activator )
{
    level utility::flag_set( "exfil_start" );
    level.s_exfil_active = s_exfil;
    s_exfil.b_exfil_started = 1;
    var_71d0d3e50df16349 = level.var_a347479bbc614700 ?? "REV_OB_EXFIL";
    
    if ( isdefined( s_exfil.var_b0a60f3dd6dac61a ) )
    {
        var_71d0d3e50df16349 = s_exfil.var_b0a60f3dd6dac61a;
    }
    
    s_exfil.s_activity_instance = activity_instance_common::createactivityinstance( "REV_OB_EXFIL", var_71d0d3e50df16349 );
    s_exfil.s_activity_instance.s_exfil = s_exfil;
    s_exfil.player_activator = player_activator;
    var_de83b0f21ea359d4 = exfil_opt_in( s_exfil, player_activator );
    s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
    
    if ( !s_exfil.a_exfil_players.size || isdefined( var_de83b0f21ea359d4 ) && !var_de83b0f21ea359d4 )
    {
        s_exfil.b_exfil_started = undefined;
        
        foreach ( player in s_exfil.a_potential_players )
        {
            player.s_exfil = undefined;
        }
        
        s_exfil.player_activator = undefined;
        
        if ( isdefined( s_exfil.mdl_exfil ) )
        {
            s_exfil.mdl_exfil notify( #"end_exfil_interact_objective_distance" );
        }
        
        if ( !level.var_eb6c6cf97fb75559 )
        {
            if ( function_9aa9df8577941cb0() )
            {
                n_reset_time = 1;
            }
            else
            {
                n_reset_time = getdvarint( @"hash_62412da41b8eaf67", 60 );
            }
            
            logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " will reset in " + n_reset_time + " seconds!" );
            level utility::delaythread( n_reset_time, &reset_exfil, s_exfil );
        }
        
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " was unable to be opted into! Resetting Exfil in " + 60 + " seconds" );
        level utility::flag_clear( "exfil_start" );
        return;
    }
    
    level callback::callback( "on_exfil_start", s_exfil );
    s_exfil.b_disabled = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
    }
    
    if ( is_quest_exfil( s_exfil ) )
    {
        if ( isdefined( level.var_61a016357f2fd8df ) )
        {
            self thread [[ level.var_61a016357f2fd8df ]]( s_exfil, player_activator );
        }
    }
    else
    {
        if ( !isdefined( s_exfil.var_7d45d2a1e824842 ) )
        {
            s_exfil.var_7d45d2a1e824842 = "exfil_called_acknowledged";
        }
        
        s_exfil.a_exfil_players thread utility::delaythread( 3.5, &function_8a8a9be80ffa5dc3, s_exfil, s_exfil.var_7d45d2a1e824842 );
        
        foreach ( player in s_exfil.a_exfil_players )
        {
            player callback::callback( "exfil_acknowledged" );
        }
    }
    
    if ( isdefined( level.func_exfil_start ) )
    {
        level thread [[ level.func_exfil_start ]]( s_exfil, player_activator );
        return;
    }
    
    function_1cda128151c81f5( s_exfil );
    s_exfil.s_exfil_destination = function_dd5b11260a2eefa4( s_exfil );
    
    if ( !isdefined( s_exfil.s_exfil_destination.angles ) )
    {
        s_exfil.s_exfil_destination.angles = ( 0, 0, 0 );
    }
    
    s_exfil.s_exfil_destination.b_exfil_started = 1;
    n_exfil_timer = adjust_exfil_timer( s_exfil );
    s_exfil.n_time_remaining = n_exfil_timer;
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            if ( !function_9aa9df8577941cb0() )
            {
                player thread exfil_timer_player_ui( n_exfil_timer, s_exfil );
            }
            
            player thread function_694296349dc659ae( s_exfil );
        }
    }
    
    level thread function_b1e8db6ed72919da( s_exfil, player_activator );
    level thread exfil_spawning( s_exfil, player_activator );
    level thread function_d0e1a00f67a1df6c( s_exfil );
    
    if ( !function_9aa9df8577941cb0() )
    {
        level thread exfil_timer( s_exfil, n_exfil_timer );
    }
    
    level thread function_24e77cd5c2b8e218( s_exfil );
}

// Namespace exfil
// Params 2
// Checksum 0xa0dbba02, Offset: 0x4775
// Size: 0x458
function exfil_start_communal( s_exfil, n_exfil_timer )
{
    if ( s_exfil.b_disabled )
    {
        println( "<dev string:x3c6>" );
        return;
    }
    
    level utility::flag_set( "exfil_start" );
    level.s_exfil_active = s_exfil;
    s_exfil.b_exfil_started = 1;
    var_71d0d3e50df16349 = level.var_a347479bbc614700 ?? "REV_OB_EXFIL";
    
    if ( isdefined( s_exfil.var_b0a60f3dd6dac61a ) )
    {
        var_71d0d3e50df16349 = s_exfil.var_b0a60f3dd6dac61a;
    }
    
    s_exfil.s_activity_instance = activity_instance_common::createactivityinstance( "REV_OB_EXFIL", var_71d0d3e50df16349 );
    s_exfil.s_activity_instance.s_exfil = s_exfil;
    s_exfil.a_exfil_players = [];
    
    foreach ( player in level.players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" && !isdefined( player.s_exfil ) )
        {
            if ( isdefined( s_exfil.var_3545f678237ae533 ) && s_exfil [[ s_exfil.var_3545f678237ae533 ]]( player ) )
            {
                continue;
            }
            
            player.s_exfil = s_exfil;
            s_exfil.a_exfil_players[ s_exfil.a_exfil_players.size ] = player;
            activity_participation::function_bc67362dace4370c( s_exfil.s_activity_instance, player );
            
            if ( !s_exfil.var_b571585ab43de0b1 )
            {
                player hud_message::showsplash( "cp_mp_exfil_inbound" );
            }
        }
    }
    
    level callback::callback( "on_exfil_start", s_exfil );
    s_exfil utility::ent_flag_set( "player_reached_exfil" );
    
    if ( !isdefined( s_exfil.var_7d45d2a1e824842 ) )
    {
        s_exfil.var_7d45d2a1e824842 = "exfil_called_acknowledged";
    }
    
    s_exfil.a_exfil_players thread utility::delaythread( 3, &function_8a8a9be80ffa5dc3, s_exfil, s_exfil.var_7d45d2a1e824842 );
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        player callback::callback( "exfil_acknowledged" );
    }
    
    function_1cda128151c81f5( s_exfil );
    
    if ( s_exfil.a_exfil_players.size > 0 )
    {
        s_exfil.s_exfil_destination = function_dd5b11260a2eefa4( s_exfil );
    }
    else
    {
        s_exfil.s_exfil_destination = utility::array_random( s_exfil.var_9af374cfc2dd171c );
    }
    
    if ( !isdefined( s_exfil.s_exfil_destination.angles ) )
    {
        s_exfil.s_exfil_destination.angles = ( 0, 0, 0 );
    }
    
    s_exfil.s_exfil_destination.b_exfil_started = 1;
    s_exfil.n_time_remaining = n_exfil_timer;
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            if ( !function_9aa9df8577941cb0() )
            {
                player thread exfil_timer_player_ui( n_exfil_timer, s_exfil );
            }
            
            player thread function_694296349dc659ae( s_exfil );
        }
    }
    
    level thread function_b1e8db6ed72919da( s_exfil, undefined );
    level thread exfil_spawning( s_exfil, undefined );
    level thread function_d0e1a00f67a1df6c( s_exfil );
    
    if ( function_9aa9df8577941cb0() )
    {
        level thread start_exfil_spawns_at_destination( s_exfil );
        return;
    }
    
    level thread exfil_timer( s_exfil, n_exfil_timer );
}

// Namespace exfil
// Params 1
// Checksum 0xb27c5c5c, Offset: 0x4bd5
// Size: 0x162
function function_1cda128151c81f5( s_exfil )
{
    if ( isdefined( s_exfil.target2 ) && !issubstr( s_exfil.target2, "exit" ) )
    {
        s_exfil.var_5c885eaadf6ac2cb = utility::getstructarray( s_exfil.target2, "targetname" );
        
        if ( isdefined( s_exfil.var_607f52acce04a484 ) )
        {
            s_exfil.var_9af374cfc2dd171c = [ s_exfil.var_5c885eaadf6ac2cb[ s_exfil.var_607f52acce04a484 ] ];
            s_exfil.var_607f52acce04a484 = undefined;
        }
        else
        {
            foreach ( s_exfil_destination in s_exfil.var_5c885eaadf6ac2cb )
            {
                if ( !s_exfil_destination.b_exfil_started )
                {
                    s_exfil.var_9af374cfc2dd171c = arraycombineunique( s_exfil.var_9af374cfc2dd171c, [ s_exfil_destination ] );
                }
            }
        }
        
        return;
    }
    
    s_exfil.var_7f75e127c1f57499 = 1;
    s_exfil.var_9af374cfc2dd171c = [ s_exfil ];
}

// Namespace exfil
// Params 1
// Checksum 0x24404148, Offset: 0x4d3f
// Size: 0xe1
function function_f62bb05ee8ef1c6a( s_progress_tracker )
{
    n_time_remaining = s_progress_tracker.currentprogressvalue;
    level notify( #"exfil_time_remaining", n_time_remaining, self.s_exfil );
    self.s_exfil.n_time_remaining = int( n_time_remaining );
    
    foreach ( player in self.s_exfil.a_exfil_players )
    {
        if ( isdefined( player ) )
        {
            player notify( #"exfil_time_remaining", n_time_remaining );
        }
    }
}

// Namespace exfil
// Params 2
// Checksum 0x1152fd84, Offset: 0x4e28
// Size: 0x281
function exfil_opt_in( s_exfil, player_activator )
{
    if ( isdefined( level.func_exfil_opt_in ) )
    {
        var_de83b0f21ea359d4 = level [[ level.func_exfil_opt_in ]]( s_exfil, player_activator );
        return var_de83b0f21ea359d4;
    }
    
    a_squad_members = player_activator squad_utility::getsquadmembers( undefined, 1 );
    s_exfil.a_potential_players = arraycombineunique( [ player_activator ], a_squad_members );
    
    foreach ( player in level.players )
    {
        if ( !player function_fc901adb1952a733() && distance( player_activator.origin, player.origin ) <= 5000 )
        {
            player.var_28eba4283d3b4190 = 1;
            s_exfil.a_potential_players = arraycombineunique( s_exfil.a_potential_players, [ player ] );
        }
    }
    
    utility::array_thread( s_exfil.a_potential_players, &hud_message::showsplash, "cp_mp_exfil_ready" );
    callback::callback( "on_exfil_player_available", s_exfil );
    wait 3;
    utility::array_thread( s_exfil.a_potential_players, &function_e63dd85ee14b6641, s_exfil, 10, player_activator );
    
    if ( s_exfil.a_exfil_players.size < s_exfil.a_potential_players.size )
    {
        s_exfil utility::waittill_any_timeout( 10, "exfil_opt_in_done" );
    }
    
    s_exfil notify( #"exfil_opt_in_done" );
    s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
    
    if ( !s_exfil.var_b571585ab43de0b1 )
    {
        utility::array_thread( s_exfil.a_exfil_players, &hud_message::showsplash, "cp_mp_exfil_inbound" );
    }
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        activity_participation::function_bc67362dace4370c( s_exfil.s_activity_instance, player );
    }
    
    return 1;
}

// Namespace exfil
// Params 1
// Checksum 0xf9ac0606, Offset: 0x50b2
// Size: 0x15f
function function_8f558ac84185c259( n_timer )
{
    if ( isbot( self ) )
    {
        wait 4;
        
        if ( getdvarint( @"hash_6e8b31590c83b6", 0 ) )
        {
            self.var_62c769ea7a03f7b8 = 1;
            return;
        }
        
        if ( level.var_abdc09fe56c52fe9 )
        {
            self.var_62c769ea7a03f7b8 = 1;
            return;
        }
        
        self.var_5918064de972f502 = 1;
        return;
    }
    
    self endon( #"disconnect" );
    self notifyonplayercommand( "exfil_vote_accept", "-actionslot 1" );
    self notifyonplayercommand( "exfil_vote_decline", "-actionslot 2" );
    
    if ( !self usinggamepad() )
    {
        self notifyonplayercommand( "exfil_vote_accept", "accept_vote" );
        self notifyonplayercommand( "exfil_vote_decline", "decline_vote" );
    }
    
    msg = utility::waittill_any_timeout( n_timer, "exfil_vote_accept", "exfil_vote_decline", "exfil_opt_in_done" );
    
    if ( isdefined( level.var_91493985819d703b ) )
    {
        self [[ level.var_91493985819d703b ]]( msg );
    }
    
    if ( msg == "exfil_vote_accept" )
    {
        self.var_62c769ea7a03f7b8 = 1;
    }
    else if ( msg == "exfil_vote_decline" )
    {
        self.var_5918064de972f502 = 1;
    }
    
    self notifyonplayercommandremove( "exfil_vote_accept", "-actionslot 1" );
    self notifyonplayercommandremove( "exfil_vote_decline", "-actionslot 2" );
    self notifyonplayercommandremove( "exfil_vote_accept", "accept_vote" );
    self notifyonplayercommandremove( "exfil_vote_decline", "decline_vote" );
}

// Namespace exfil
// Params 4
// Checksum 0x9c28e68d, Offset: 0x5219
// Size: 0x30e
function function_e63dd85ee14b6641( s_exfil, n_time, player_activator, var_adaf055e5d71bfbc )
{
    n_timer = n_time ?? 10;
    self.var_28eba4283d3b4190 = 1;
    self.hud_exfil_opt_in = hud_util::createtimer( "hudsmall", 1 );
    self.hud_exfil_opt_in.x = 0;
    self.hud_exfil_opt_in.y = 0;
    
    if ( self usinggamepad() )
    {
        self.hud_exfil_opt_in.label = &"shared_hintstrings/exfil_opt_in";
    }
    else
    {
        self.hud_exfil_opt_in.label = &"shared_hintstrings/exfil_opt_in_kbm";
    }
    
    self.hud_exfil_opt_in.alignx = "center";
    self.hud_exfil_opt_in.aligny = "middle";
    self.hud_exfil_opt_in.horzalign = "center";
    self.hud_exfil_opt_in.vertalign = "middle";
    self.hud_exfil_opt_in.alpha = 1;
    self.hud_exfil_opt_in.glowalpha = 0;
    self.hud_exfil_opt_in.archived = 0;
    self.hud_exfil_opt_in settimer( n_timer );
    thread function_bddc18d9927a5938( s_exfil );
    thread function_8f558ac84185c259( n_timer );
    
    while ( isalive( self ) && n_timer >= 0 )
    {
        if ( self.var_62c769ea7a03f7b8 || player_activator == self || s_exfil.a_exfil_players.size >= var_adaf055e5d71bfbc )
        {
            self.s_exfil = s_exfil;
            s_exfil.a_exfil_players = arraycombineunique( s_exfil.a_exfil_players, [ self ] );
            self.hud_exfil_opt_in.label = &"shared_hintstrings/exfil_opt_in_waiting_for_other_players";
            
            if ( s_exfil.a_exfil_players.size >= s_exfil.a_potential_players.size )
            {
                s_exfil notify( #"exfil_opt_in_done" );
            }
            
            callback::callback( "on_exfil_player_joined", s_exfil );
            self notify( #"exfil_opt_in_done" );
            break;
        }
        else if ( self.var_5918064de972f502 )
        {
            s_exfil.a_potential_players = arrayremove( s_exfil.a_potential_players, self );
            self.hud_exfil_opt_in.label = &"shared_hintstrings/exfil_opt_in_waiting_for_other_players";
            
            if ( s_exfil.a_exfil_players.size >= s_exfil.a_potential_players.size )
            {
                s_exfil notify( #"exfil_opt_in_done" );
            }
            
            self notify( #"exfil_opt_in_done" );
            break;
        }
        
        waitframe();
        n_timer -= level.framedurationseconds;
    }
    
    if ( isdefined( self ) )
    {
        self.var_28eba4283d3b4190 = undefined;
        self.var_62c769ea7a03f7b8 = undefined;
        self.var_5918064de972f502 = undefined;
    }
}

// Namespace exfil
// Params 1, eflags: 0x4
// Checksum 0x7612319e, Offset: 0x552f
// Size: 0x41
function private function_bddc18d9927a5938( s_exfil )
{
    self endon( #"disconnect" );
    s_exfil waittill( #"exfil_opt_in_done" );
    
    if ( isdefined( self.hud_exfil_opt_in ) )
    {
        self.hud_exfil_opt_in destroy();
    }
}

// Namespace exfil
// Params 1
// Checksum 0x55935b65, Offset: 0x5578
// Size: 0x124
function function_dd5b11260a2eefa4( s_exfil )
{
    if ( isdefined( level.var_890cd8c298d2e74f ) )
    {
        s_exfil_destination = [[ level.var_890cd8c298d2e74f ]]( s_exfil );
        return s_exfil_destination;
    }
    
    var_e7c4c8fc148fcf79 = [];
    var_f28ba4a9b84600a4 = [];
    v_pos = ( 0, 0, 0 );
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        v_pos += player.origin;
    }
    
    v_pos /= s_exfil.a_exfil_players.size;
    s_exfil_destination = utility::get_array_of_farthest( v_pos, s_exfil.var_9af374cfc2dd171c )[ 0 ];
    
    if ( !isdefined( s_exfil_destination ) )
    {
        s_exfil_destination = utility::array_random( s_exfil.var_9af374cfc2dd171c );
    }
    
    return s_exfil_destination;
}

// Namespace exfil
// Params 1
// Checksum 0x747bccfd, Offset: 0x56a5
// Size: 0x15f
function on_ai_killed( params )
{
    if ( isdefined( level.var_c345d20c7156a1d4 ) )
    {
        self [[ level.var_c345d20c7156a1d4 ]]( params );
        return;
    }
    
    if ( self.var_8fc9a42738beb960 && !isdefined( self.var_bd22ba6c600a23a3 ) )
    {
        attacker = params.eattacker;
        player_attacker = isplayer( attacker ) ? attacker : undefined;
        var_7aad6d75262d979 = 0;
        
        if ( !isdefined( attacker ) )
        {
            return;
        }
        
        if ( isdefined( attacker.var_bd22ba6c600a23a3 ) )
        {
            var_7aad6d75262d979 = 1;
            player_attacker = attacker.var_bd22ba6c600a23a3;
        }
        
        if ( attacker vehicle::is_vehicle() && !var_7aad6d75262d979 )
        {
            player_attacker = params.eattacker.owner;
        }
        
        var_2854080ef988f697 = isplayer( player_attacker ) && player_attacker.var_3560f6b1ef954e6f && player_attacker.s_exfil == self.s_exfil;
        var_95ac3c08b4b8af25 = !var_2854080ef988f697 && attacker function_220801213cd3f346( self.s_exfil );
        
        if ( var_2854080ef988f697 || self.nuked || var_95ac3c08b4b8af25 )
        {
            println( "<dev string:x400>" );
            update_kill_count( self.s_exfil );
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x8e01e230, Offset: 0x580c
// Size: 0xee
function on_ai_damaged( params )
{
    level.var_c8ab615737888686 = function_5713d46873b29625( level.var_c8ab615737888686 );
    
    foreach ( vh_exfil in level.var_c8ab615737888686 )
    {
        if ( function_6c954b552067189f() && vh_exfil palfa_shared::function_2f4a28086a3dcef2( self.origin ) )
        {
            if ( isdefined( self.func_dismember_annihilate ) && params.idamage >= self.health )
            {
                self.var_a13bed1ac47e1b2c = 1;
                self [[ self.func_dismember_annihilate ]]();
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x22eb622f, Offset: 0x5902
// Size: 0x53
function function_85632c549469dd91( params )
{
    if ( isdefined( self.s_exfil ) )
    {
        if ( isdefined( level.var_a0d7720b6da9b277 ) )
        {
            self [[ level.var_a0d7720b6da9b277 ]]( params );
            return;
        }
        
        println( "<dev string:x400>" );
        update_kill_count( self.s_exfil );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x3988483c, Offset: 0x595d
// Size: 0x65
function update_kill_count( s_exfil = level.s_exfil_active )
{
    if ( !isdefined( s_exfil.var_79507aedd281f84d ) )
    {
        return;
    }
    
    s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
    
    if ( s_exfil.kill_count_reached )
    {
        return;
    }
    
    s_exfil.n_kills++;
}

// Namespace exfil
// Params 1
// Checksum 0xf391492d, Offset: 0x59ca
// Size: 0x17b
function adjust_exfil_timer( s_exfil )
{
    v_start = ( 0, 0, 0 );
    a_players = s_exfil.a_exfil_players;
    
    foreach ( player in a_players )
    {
        v_start += player.origin;
    }
    
    v_start /= a_players.size;
    n_dist = distance2d( s_exfil.s_exfil_destination.origin, v_start );
    var_5f2612b6db0b2aa8 = n_dist / 10000;
    
    if ( isdefined( level.var_d3b3ca406bfc1284 ) && isdefined( [[ level.var_d3b3ca406bfc1284 ]]( s_exfil ) ) )
    {
        n_adjusted_time = [[ level.var_d3b3ca406bfc1284 ]]( s_exfil );
    }
    else if ( isdefined( level.var_d52bb6769ac8f826 ) )
    {
        n_adjusted_time = level.var_d52bb6769ac8f826;
    }
    else
    {
        n_adjusted_time = max( var_5f2612b6db0b2aa8 * 120, 120 ) + 60 + max( -30, min( 30, 3 * ( level.star_rating ?? 1 ) ) );
    }
    
    return int( min( 600, n_adjusted_time ) );
}

// Namespace exfil
// Params 1
// Checksum 0x51b5ace2, Offset: 0x5b4e
// Size: 0xe8
function function_d0e1a00f67a1df6c( s_exfil )
{
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    
    while ( true )
    {
        b_all_players_dead = 1;
        
        foreach ( player in s_exfil.a_exfil_players )
        {
            if ( isalive( player ) && player.sessionstate == "playing" )
            {
                b_all_players_dead = 0;
                break;
            }
        }
        
        if ( b_all_players_dead )
        {
            s_exfil notify( #"exfil_players_dead" );
            break;
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 4
// Checksum 0x92a72813, Offset: 0x5c3e
// Size: 0x37c
function function_82f71643e34041a8( s_exfil, n_speed, n_acceleration, str_surface_type )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"death" );
    
    if ( self.leaving )
    {
        return;
    }
    
    if ( !isdefined( n_speed ) )
    {
        n_speed = 25;
    }
    
    if ( !isdefined( n_acceleration ) )
    {
        n_acceleration = 15;
    }
    
    if ( !isdefined( str_surface_type ) )
    {
        str_surface_type = "air";
    }
    
    if ( self issuspendedvehicle() )
    {
        self wakeupvehicle();
    }
    
    self notify( #"leaving" );
    self.leaving = 1;
    self clearlookatent();
    self.var_300686ebe3a78e39 = 1;
    function_2cb1277f20ee1f9f( s_exfil );
    function_e375225728c23ec9();
    vehicle_code::vehicle_disable_navobstacles();
    
    if ( s_exfil.var_ef0af734c85a355b )
    {
        function_71799ce2c69ce5a9( s_exfil.name );
        s_exfil.var_ef0af734c85a355b = undefined;
    }
    
    s_exit_path = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination.target2 ) )
    {
        var_97e82b8099275fb3 = utility::getstructarray( s_exfil.s_exfil_destination.target2, "targetname" );
        s_exit_path = utility::array_random( var_97e82b8099275fb3 );
    }
    
    if ( isstruct( s_exit_path ) )
    {
        while ( isstruct( s_exit_path ) )
        {
            v_goal = s_exit_path.origin;
            n_speed = s_exit_path.script_speed ?? n_speed;
            n_acceleration = s_exit_path.script_accel ?? n_acceleration;
            n_deceleration = s_exit_path.script_decel ?? n_acceleration / 2;
            self vehicle_setspeed( n_speed, n_acceleration, n_deceleration );
            function_1e41fd9b66088249( v_goal, 0 );
            self waittill( #"goal" );
            
            if ( isdefined( s_exit_path.target ) )
            {
                var_97e82b8099275fb3 = utility::getstructarray( s_exit_path.target, "targetname" );
                s_exit_path = utility::array_random( var_97e82b8099275fb3 );
                continue;
            }
            
            break;
        }
    }
    else
    {
        if ( str_surface_type == "air" )
        {
            self vehicle_setspeed( n_speed, n_acceleration );
            v_goal = self.origin + ( 0, 0, 2000 );
        }
        else
        {
            self vehicle_setspeed( n_speed, n_acceleration );
            v_goal = self.origin + anglestoforward( ( 0, randomint( 360 ), 0 ) ) * 500;
        }
        
        function_1e41fd9b66088249( v_goal, 1 );
        self waittill( #"goal" );
        pathrandomness = 150;
        halfdistance = 25000;
        yaw = self.angles[ 1 ];
        direction = ( 0, yaw, 0 );
        v_end = self.origin + anglestoforward( direction ) * halfdistance;
        
        if ( str_surface_type == "air" )
        {
            v_end_z = max( v_end[ 2 ], getdvarfloat( @"hash_7f6b2729e5a85bb5", 6000 ) );
            v_end = ( v_end[ 0 ], v_end[ 1 ], v_end_z );
        }
        
        self vehicle_setspeed( n_speed * 3 );
        function_1e41fd9b66088249( v_end, 0 );
        thread function_4f2b50cdb23bab82();
        self waittill( #"goal" );
    }
    
    self stoploopsound();
    
    if ( isdefined( self.mdl_rope ) )
    {
        self.mdl_rope delete();
    }
    
    function_25ebbe6e8a21f6b8();
    function_67ecd0b2b982cff2( s_exfil, 1 );
    s_exfil notify( #"exfil_vehicle_gone" );
    self notify( #"exfil_vehicle_gone" );
    thread exfil_vehicle_delete( s_exfil );
}

// Namespace exfil
// Params 5, eflags: 0x4
// Checksum 0x7053358e, Offset: 0x5fc2
// Size: 0x17e
function private function_f52dfe60d5e51588( s_exfil, str_player_team, iterations, ignoregroundent = 0, distance = 1000 )
{
    self endon( #"death" );
    a_nearby_ai = s_exfil.var_79507aedd281f84d;
    a_nearby_ai = arraycombineunique( a_nearby_ai, getaiarrayinradius( self.origin, distance ) );
    
    for ( iteration = 0; iteration < iterations ; iteration++ )
    {
        foreach ( ai in a_nearby_ai )
        {
            if ( isalive( ai ) && ai.team != str_player_team )
            {
                groundent = ai getgroundentity();
                
                if ( ignoregroundent || isdefined( groundent ) && self == ai getgroundentity() )
                {
                    ai.var_a13bed1ac47e1b2c = 1;
                    
                    if ( isdefined( ai.func_dismember_annihilate ) )
                    {
                        ai [[ ai.func_dismember_annihilate ]]();
                    }
                    
                    ai kill();
                    wait 0.2;
                }
            }
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 1
// Checksum 0xd7476146, Offset: 0x6148
// Size: 0x1b2
function function_2cb1277f20ee1f9f( s_exfil )
{
    if ( isarray( self.var_13ccca8001231cf8 ) )
    {
        self.var_1f8510e8c2dfcedb = 1;
        str_player_team = "allies";
        
        if ( isdefined( s_exfil ) )
        {
            if ( isdefined( s_exfil.player_activator ) )
            {
                str_player_team = s_exfil.player_activator.team;
            }
            
            function_f52dfe60d5e51588( s_exfil, str_player_team, 1 );
        }
        
        waitframe();
        
        foreach ( str_navlink in self.var_13ccca8001231cf8 )
        {
            destroynavlink( str_navlink );
            waitframe();
        }
        
        a_nearby_ai = getaiarrayinradius( self.origin, 1000 );
        
        foreach ( ai in a_nearby_ai )
        {
            ai clearpath();
        }
        
        wait 0.2;
        self.var_13ccca8001231cf8 = undefined;
        
        if ( isdefined( s_exfil ) )
        {
            function_f52dfe60d5e51588( s_exfil, str_player_team, 2 );
            wait 1;
            function_f52dfe60d5e51588( s_exfil, str_player_team, 1, 1, 300 );
        }
        
        self.var_1f8510e8c2dfcedb = undefined;
    }
}

// Namespace exfil
// Params 0
// Checksum 0x856c803a, Offset: 0x6302
// Size: 0x29
function function_6e11aeaf5898bc82()
{
    if ( isdefined( self.e_navmesh ) )
    {
        self.e_navmesh dockmovingplatform( undefined );
        self.var_8fa710da66a36be0 = 1;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x496048c5, Offset: 0x6333
// Size: 0x5f
function function_e375225728c23ec9( var_4388bca50f7359e8 )
{
    if ( isdefined( self.e_navmesh ) && self.var_8fa710da66a36be0 )
    {
        var_69154c7d4892e00e = getdvarint( @"hash_272475e1eed3e1d0", var_4388bca50f7359e8 ?? 0 );
        self.e_navmesh undockmovingplatform( var_69154c7d4892e00e );
        self.var_8fa710da66a36be0 = undefined;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x2b0d5c26, Offset: 0x639a
// Size: 0x12e
function function_2880df3073531a72( var_e976814839225a7c )
{
    if ( !isarray( var_e976814839225a7c ) )
    {
        return;
    }
    
    foreach ( str_targetname in var_e976814839225a7c )
    {
        a_e_pool = getentarray( str_targetname, #targetname );
        
        if ( !isdefined( a_e_pool ) || !( a_e_pool.size > 0 ) )
        {
            a_e_pool = utility::getstructarray( str_targetname, "targetname" );
        }
        
        foreach ( e_pool in a_e_pool )
        {
            e_pool notsolid();
            e_pool hide();
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x706af4d2, Offset: 0x64d0
// Size: 0x113
function function_620e1a672ca793b1( var_e976814839225a7c )
{
    if ( !isarray( var_e976814839225a7c ) )
    {
        return;
    }
    
    foreach ( str_targetname in var_e976814839225a7c )
    {
        a_e_pool = getentarray( str_targetname, #targetname );
        
        foreach ( e_pool in a_e_pool )
        {
            if ( !isdefined( e_pool.vh_exfil ) )
            {
                return e_pool;
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0xba5e5c94, Offset: 0x65ec
// Size: 0x36c, Type: bool
function function_8ae9818165e25a9c( var_8d423848a1600df0 )
{
    if ( !isdefined( var_8d423848a1600df0 ) )
    {
        return false;
    }
    
    self.var_8affbb79c07337fb = 0;
    
    if ( !isdefined( self.e_navmesh ) )
    {
        var_e976814839225a7c = var_8d423848a1600df0.var_e976814839225a7c ?? [];
        e_pool = function_620e1a672ca793b1( var_e976814839225a7c );
        
        if ( isdefined( e_pool ) )
        {
            self.e_navmesh = e_pool;
            e_pool.vh_exfil = self;
            e_pool.origin = self.origin;
            e_pool.angles = self.angles;
            e_pool show();
            e_pool solid();
            str_link_tag = var_8d423848a1600df0.str_link_tag ?? "tag_origin";
            v_link_offset = var_8d423848a1600df0.v_link_offset ?? ( 0, 0, -6 );
            var_94d8b3084a534b9a = var_8d423848a1600df0.var_94d8b3084a534b9a ?? ( 0, 0, 0 );
            e_pool linkto( self, str_link_tag, v_link_offset, var_94d8b3084a534b9a );
        }
    }
    
    if ( !isdefined( self.e_navmesh ) )
    {
        return false;
    }
    
    function_6e11aeaf5898bc82();
    self.e_navmesh.moverdoesnotkill = 1;
    self.e_navmesh.carriabletype = 1;
    var_97a796626baef1fa = var_8d423848a1600df0.var_97a796626baef1fa ?? [];
    
    if ( var_97a796626baef1fa.size > 0 )
    {
        if ( !isdefined( level.var_9d359c138a6842e8 ) )
        {
            level.var_9d359c138a6842e8 = 0;
        }
        
        level.var_9d359c138a6842e8 += 1;
        n_ent_num = level.var_9d359c138a6842e8;
        
        if ( !isdefined( self.var_13ccca8001231cf8 ) )
        {
            self.var_13ccca8001231cf8 = [];
        }
        
        foreach ( s_navlink in var_97a796626baef1fa )
        {
            b_reverse = s_navlink.b_reverse ?? 1;
            str_traverse = s_navlink.str_traverse_type;
            str_forward = s_navlink.str_name_prefix + "_" + n_ent_num;
            self.var_13ccca8001231cf8[ self.var_13ccca8001231cf8.size ] = str_forward;
            
            if ( isdefined( str_traverse ) )
            {
                createnavlink( str_forward, s_navlink.v_outside, s_navlink.v_inside, str_traverse );
            }
            else
            {
                createnavlink( str_forward, s_navlink.v_outside, s_navlink.v_inside );
            }
            
            if ( b_reverse )
            {
                str_back = s_navlink.str_name_prefix + "_reverse_" + n_ent_num;
                self.var_13ccca8001231cf8[ self.var_13ccca8001231cf8.size ] = str_back;
                
                if ( isdefined( str_traverse ) )
                {
                    createnavlink( str_back, s_navlink.v_inside, s_navlink.v_outside, str_traverse );
                    continue;
                }
                
                createnavlink( str_back, s_navlink.v_inside, s_navlink.v_outside );
            }
        }
    }
    
    return true;
}

// Namespace exfil
// Params 0
// Checksum 0x57e2fe9c, Offset: 0x6961
// Size: 0xae
function function_25ebbe6e8a21f6b8()
{
    if ( !isdefined( self.e_navmesh ) )
    {
        return;
    }
    
    while ( self.var_1f8510e8c2dfcedb )
    {
        waitframe();
    }
    
    self.e_navmesh unlink();
    function_e375225728c23ec9();
    self.e_navmesh.vh_exfil = undefined;
    self.e_navmesh notsolid();
    self.e_navmesh hide();
    self.e_navmesh.origin -= ( 0, 0, 500 );
    self.e_navmesh = undefined;
    self.var_13ccca8001231cf8 = undefined;
}

// Namespace exfil
// Params 0
// Checksum 0x3e82712f, Offset: 0x6a17
// Size: 0x4df
function function_3fb34074bdaba690()
{
    v_ang_rear = self gettagangles( "tag_turret_rear" ) + ( 0, 90, 0 );
    v_pos_rear = self gettagorigin( "tag_turret_rear" ) + anglestoforward( v_ang_rear ) * 100;
    var_ab14142200434b06 = v_pos_rear + anglestoforward( v_ang_rear ) * 30;
    v_ang_left = self gettagangles( "tag_turret_left" );
    v_pos_left = self gettagorigin( "tag_turret_left" ) + anglestoforward( v_ang_left ) * -20 + anglestoforward( v_ang_rear ) * 10;
    var_93d751c22a197159 = v_pos_left + anglestoforward( v_ang_left ) * 80;
    v_ang_right = self gettagangles( "tag_turret_right" );
    v_pos_right = self gettagorigin( "tag_turret_right" ) + anglestoforward( v_ang_right ) * -20 + anglestoforward( v_ang_rear ) * 10;
    var_b3eaf1a2770dcf1e = v_pos_right + anglestoforward( v_ang_right ) * 80 + anglestoforward( v_ang_rear ) * -10;
    var_6fe30893fbf9dd8c = v_pos_rear + ( 0, 0, 4 ) + anglestoforward( v_ang_left ) * 20;
    var_132b5c76d04e9dce = var_ab14142200434b06 + anglestoforward( v_ang_left ) * 20;
    var_2207a78fe9c62f9 = v_pos_rear + ( 0, 0, 4 ) + anglestoforward( v_ang_right ) * 20;
    var_dcb90e9f9a7c223f = var_ab14142200434b06 + anglestoforward( v_ang_right ) * 20;
    var_308d44558d62db11 = self gettagangles( "wheel_rear_left" );
    var_6000aea434929f97 = self gettagorigin( "wheel_rear_left" ) + ( 0, 0, 100 );
    var_693689844f21451d = self gettagorigin( "wheel_rear_left" ) + anglestoleft( var_308d44558d62db11 ) * 70;
    var_19bb1f507cead068 = self gettagangles( "wheel_rear_right" );
    var_97e387091b419776 = self gettagorigin( "wheel_rear_right" ) + ( 0, 0, 100 );
    var_e8caa3227446e898 = self gettagorigin( "wheel_rear_right" ) + anglestoright( var_19bb1f507cead068 ) * 70;
    var_bfc6c9851b2d34f = self gettagorigin( "wheel_rear_left" ) + ( 0, 0, 100 ) + anglestoforward( var_308d44558d62db11 ) * 60;
    var_e54dc6fe612367d5 = self gettagorigin( "wheel_rear_left" ) + anglestoforward( var_308d44558d62db11 ) * 140;
    var_64d5c898ecdac76a = self gettagorigin( "wheel_rear_right" ) + ( 0, 0, 100 ) + anglestoforward( var_19bb1f507cead068 ) * 60;
    var_80e4b60192330ddc = self gettagorigin( "wheel_rear_right" ) + anglestoforward( var_19bb1f507cead068 ) * 140;
    var_97a796626baef1fa = [];
    var_97a796626baef1fa[ 0 ] = { #b_reverse:1, #v_inside:var_6fe30893fbf9dd8c, #v_outside:var_132b5c76d04e9dce, #str_name_prefix:"traverse_helicopter_rear_left" };
    var_97a796626baef1fa[ 1 ] = { #b_reverse:1, #v_inside:var_2207a78fe9c62f9, #v_outside:var_dcb90e9f9a7c223f, #str_name_prefix:"traverse_helicopter_rear_right" };
    var_97a796626baef1fa[ 2 ] = { #b_reverse:1, #v_inside:v_pos_left + ( 0, 0, 4 ), #v_outside:var_93d751c22a197159, #str_name_prefix:"traverse_helicopter_left" };
    var_97a796626baef1fa[ 3 ] = { #b_reverse:1, #v_inside:v_pos_right + ( 0, 0, 4 ), #v_outside:var_b3eaf1a2770dcf1e, #str_name_prefix:"traverse_helicopter_right" };
    var_97a796626baef1fa[ 4 ] = { #b_reverse:1, #v_inside:var_6000aea434929f97, #v_outside:var_693689844f21451d, #str_name_prefix:"traverse_helicopter_wing_left" };
    var_97a796626baef1fa[ 5 ] = { #b_reverse:1, #v_inside:var_97e387091b419776, #v_outside:var_e8caa3227446e898, #str_name_prefix:"traverse_helicopter_wing_right" };
    var_97a796626baef1fa[ 6 ] = { #b_reverse:1, #v_inside:var_bfc6c9851b2d34f, #v_outside:var_e54dc6fe612367d5, #str_name_prefix:"traverse_helicopter_wing_front_left" };
    var_97a796626baef1fa[ 7 ] = { #b_reverse:1, #v_inside:var_64d5c898ecdac76a, #v_outside:var_80e4b60192330ddc, #str_name_prefix:"traverse_helicopter_wing_front_right" };
    return { #var_97a796626baef1fa:var_97a796626baef1fa, #var_94d8b3084a534b9a:( 0, 0, 0 ), #v_link_offset:( 0, 0, -6 ), #str_link_tag:"tag_origin", #var_e976814839225a7c:[ "walkable_heli_navmesh" ] };
}

// Namespace exfil
// Params 3
// Checksum 0x24846278, Offset: 0x6eff
// Size: 0x50f
function exfil_timer( s_exfil, n_exfil_timer, var_b6cb4a3a261aea93 )
{
    s_exfil notify( #"end_exfil_timer" );
    s_exfil endon( #"end_exfil_timer" );
    s_exfil.var_b09c68be26c84664 = 1;
    
    if ( utility::issharedfuncdefined( #"exfil", #"hash_f31fd3cb1a652981" ) )
    {
        level thread utility::callsharedfunc( #"exfil", #"hash_f31fd3cb1a652981", s_exfil, n_exfil_timer );
    }
    else
    {
        if ( isdefined( s_exfil.s_activity_instance.progresstrackers[ "exfil_timer" ] ) )
        {
            s_exfil.s_activity_instance namespace_45ef22ffd1bf8e55::function_3ff7386bdfd71aca( "exfil_timer" );
        }
        
        s_exfil.s_activity_instance namespace_45ef22ffd1bf8e55::function_61568a80767f1652( "exfil_timer", n_exfil_timer, &function_f62bb05ee8ef1c6a );
    }
    
    str_result = s_exfil utility::waittill_any_timeout( n_exfil_timer, "exfil_timer_force_complete", "exfil_players_dead" );
    s_exfil notify( #"exfil_complete_timeout" );
    s_exfil utility::ent_flag_set( "exfil_complete_timeout" );
    level notify( #"exfil_time_remaining", 0, s_exfil );
    level callback::callback( "on_exfil_complete_timeout", s_exfil );
    
    if ( isdefined( s_exfil.vh_exfil.interact ) && !function_6c954b552067189f() )
    {
        s_exfil.vh_exfil.interact setusableenabled( 0 );
    }
    
    if ( isdefined( s_exfil.s_exfil_destination.mdl_destination.n_obj_id ) )
    {
        if ( isdefined( s_exfil.mdl_exfil ) )
        {
            s_exfil.mdl_exfil notify( #"end_exfil_interact_objective_distance" );
        }
        
        objidpoolmanager::returnobjectiveid( s_exfil.s_exfil_destination.mdl_destination.n_obj_id );
        s_exfil.s_exfil_destination.mdl_destination.n_obj_id = undefined;
    }
    
    waitframe();
    activity_instance_common::endactivity( s_exfil.s_activity_instance, 0 );
    
    if ( isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "disabled_icon" );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "stop" );
    }
    
    s_exfil.s_exfil_destination.b_exfil_started = undefined;
    s_exfil.b_exfil_started = undefined;
    
    if ( !function_9aa9df8577941cb0() || function_9aa9df8577941cb0() && !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        s_exfil.vh_exfil thread function_82f71643e34041a8( s_exfil );
        wait 1;
    }
    
    if ( !function_9aa9df8577941cb0() && isent( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination delete();
    }
    
    if ( !function_9aa9df8577941cb0() )
    {
        s_exfil.s_exfil_destination = undefined;
    }
    
    s_exfil.s_activity_instance = undefined;
    
    foreach ( ai in s_exfil.var_79507aedd281f84d )
    {
        ai.s_exfil = undefined;
    }
    
    s_exfil.var_79507aedd281f84d = [];
    s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        player.var_79507aedd281f84d = [];
        
        if ( isdefined( player.hud_exfil ) )
        {
            player.hud_exfil destroy();
        }
        
        if ( function_9aa9df8577941cb0() )
        {
            player setclientomnvar( "ui_match_start_countdown", -1 );
            player setclientomnvar( "ui_is_exfil_countdown", 0 );
        }
    }
    
    function_67ecd0b2b982cff2( s_exfil );
    
    if ( isdefined( level.var_34a9951ec909c526 ) && !isdefined( var_b6cb4a3a261aea93 ) )
    {
        var_b6cb4a3a261aea93 = [[ level.var_34a9951ec909c526 ]]();
    }
    
    n_reset_time = var_b6cb4a3a261aea93 ?? getdvarint( @"hash_62412da41b8eaf67", 60 );
    logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " will reset in " + n_reset_time + " seconds!" );
    level utility::delaythread( n_reset_time, &reset_exfil, s_exfil );
}

// Namespace exfil
// Params 2
// Checksum 0xaf37833b, Offset: 0x7416
// Size: 0x221
function exfil_timer_player_ui( n_exfil_timer, s_exfil )
{
    self notify( #"endon_exfil_timer_player_ui" );
    self endon( #"endon_exfil_timer_player_ui" );
    
    if ( function_9aa9df8577941cb0() )
    {
        thread exfil_defend_mode_timer( s_exfil );
    }
    
    str_notify = s_exfil utility::waittill_any_timeout( n_exfil_timer, "exfil_complete_timeout", "exfil_players_dead" );
    
    if ( isalive( self ) && str_notify != "exfil_players_dead" && ( self.b_completed_exfil || self.var_22bd8935826c4bc5 ) )
    {
        if ( function_6c954b552067189f() )
        {
            if ( self.var_22bd8935826c4bc5 )
            {
                a_squad_members = squad_utility::getsquadmembers();
                
                foreach ( squad_member in a_squad_members )
                {
                    if ( !isalive( squad_member ) )
                    {
                        break;
                    }
                }
                
                if ( isdefined( level.var_459b210b1257abae ) )
                {
                    if ( ![[ level.var_459b210b1257abae ]]( a_squad_members ) )
                    {
                        thread function_db6cd5f3b6a797da( s_exfil );
                    }
                }
                else
                {
                    thread function_db6cd5f3b6a797da( s_exfil );
                }
                
                params = spawnstruct();
                params.s_exfil = s_exfil;
                callback::callback( "on_exfil_exiting_ao", params );
                s_exfil.vh_exfil.interact function_508d7657b4bfef45( self );
            }
            else if ( self.b_completed_exfil )
            {
                if ( function_9aa9df8577941cb0() )
                {
                    exfil_player_fail( s_exfil );
                }
                else
                {
                    s_exfil.vh_exfil thread function_185c01ffe37a9db7( self, 1 );
                }
            }
        }
    }
    else
    {
        exfil_player_fail( s_exfil );
    }
    
    if ( str_notify == "timeout" || str_notify == "exfil_complete_timeout" )
    {
        self notify( #"exfil_time_remaining", 0 );
    }
    
    if ( isdefined( self ) )
    {
        self.s_exfil = undefined;
        self.var_3560f6b1ef954e6f = undefined;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x1be64eaf, Offset: 0x763f
// Size: 0x6e
function function_db6cd5f3b6a797da( s_exfil )
{
    if ( is_quest_exfil( s_exfil ) )
    {
        return;
    }
    
    if ( !s_exfil.var_55fa9c1357e6134b )
    {
        a_ai_in_vehicle = function_d2d1fbcc599547e5( s_exfil );
        
        if ( a_ai_in_vehicle.size )
        {
            thread utility::delaythread( 7, &function_8a8a9be80ffa5dc3, s_exfil, "exfil_called_exiting_ao_zombies_inside" );
            return;
        }
        
        thread utility::delaythread( 7, &function_8a8a9be80ffa5dc3, s_exfil, "exfil_called_exiting_ao" );
    }
}

// Namespace exfil
// Params 1
// Checksum 0xc3b2df22, Offset: 0x76b5
// Size: 0x139
function exfil_player_fail( s_exfil )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"disconnect" );
    
    if ( !isdefined( s_exfil.var_8760cc6fcd476652 ) )
    {
        s_exfil.var_8760cc6fcd476652 = "exfil_called_timeout";
    }
    
    if ( !is_quest_exfil( s_exfil ) )
    {
        thread function_8a8a9be80ffa5dc3( s_exfil, s_exfil.var_8760cc6fcd476652 );
    }
    
    if ( function_9aa9df8577941cb0() && function_6c954b552067189f() )
    {
        s_exfil utility::waittill_any_timeout( 15, "exfil_vehicle_gone" );
        
        if ( isdefined( s_exfil.vh_exfil ) && isdefined( s_exfil.vh_exfil.playersinside[ self.guid ] ) && isalive( self ) )
        {
            self.var_bdeeca1e699ddbdb = 1;
            s_exfil.vh_exfil.interact function_508d7657b4bfef45( self );
            return;
        }
    }
    
    if ( !level.var_a4fc99047bac7beb )
    {
        thread hud_message::showsplash( "cp_mp_exfil_failure" );
    }
    
    callback::callback( "on_exfil_player_failure", s_exfil );
    
    if ( isdefined( s_exfil.s_activity_instance ) )
    {
        s_exfil.s_activity_instance activity_participation::function_61aa2b2879f2c0a2( s_exfil.s_activity_instance, self );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x834cbe8, Offset: 0x77f6
// Size: 0x354
function function_aa8c7bf68451dd7b( s_exfil = level.s_exfil_active )
{
    if ( !isdefined( s_exfil.s_activity_instance ) )
    {
        return;
    }
    
    var_bc61f1601422ce32 = 0;
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" && player.var_3560f6b1ef954e6f )
        {
            var_bc61f1601422ce32 = 1;
            break;
        }
    }
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( s_exfil.kill_count_reached )
        {
            if ( utility::issharedfuncdefined( #"exfil", #"hash_879c50917e34912" ) )
            {
                player utility::callsharedfunc( #"exfil", #"hash_879c50917e34912", s_exfil );
            }
            else
            {
                s_exfil.s_activity_instance activity_player_broadcasting::function_14b649cbfe7ea3c4( "exfil_get_to_vehicle", [ player ] );
                s_exfil.s_activity_instance activity_player_broadcasting::function_14b649cbfe7ea3c4( "exfil_kills_remaining", [ player ] );
                
                if ( !function_9aa9df8577941cb0() )
                {
                    s_exfil.s_activity_instance activity_player_broadcasting::function_cb4750c84882dd07( "exfil_board_vehicle", [ player ] );
                }
            }
            
            continue;
        }
        
        if ( player.var_3560f6b1ef954e6f || level.var_a28325c5a7af814e && var_bc61f1601422ce32 )
        {
            if ( utility::issharedfuncdefined( #"exfil", #"hash_727362151127a027" ) )
            {
                player utility::callsharedfunc( #"exfil", #"hash_727362151127a027", s_exfil );
            }
            else if ( function_9aa9df8577941cb0() )
            {
                if ( player.var_22bd8935826c4bc5 )
                {
                }
            }
            else
            {
                s_exfil.s_activity_instance activity_player_broadcasting::function_14b649cbfe7ea3c4( "exfil_get_to_vehicle", [ player ] );
                s_exfil.s_activity_instance activity_player_broadcasting::function_cb4750c84882dd07( "exfil_kills_remaining", [ player ] );
            }
            
            continue;
        }
        
        if ( !player.var_3560f6b1ef954e6f || level.var_a28325c5a7af814e && !var_bc61f1601422ce32 )
        {
            if ( utility::issharedfuncdefined( #"exfil", #"hash_c5693f391aa3429c" ) )
            {
                player utility::callsharedfunc( #"exfil", #"hash_c5693f391aa3429c", s_exfil );
                continue;
            }
            
            if ( function_9aa9df8577941cb0() )
            {
                continue;
            }
            
            s_exfil.s_activity_instance activity_player_broadcasting::function_14b649cbfe7ea3c4( "exfil_kills_remaining", [ player ] );
            s_exfil.s_activity_instance activity_player_broadcasting::function_cb4750c84882dd07( "exfil_get_to_vehicle", [ player ] );
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0xa7a14e5, Offset: 0x7b52
// Size: 0x19b
function function_694296349dc659ae( s_exfil = level.s_exfil_active )
{
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    self endon( #"disconnect" );
    
    if ( !isdefined( s_exfil.a_exfil_players ) )
    {
        s_exfil.a_exfil_players = [];
    }
    
    s_exfil.a_exfil_players = arraycombineunique( s_exfil.a_exfil_players, [ self ] );
    waitframe();
    
    if ( function_220801213cd3f346( s_exfil ) )
    {
        self.var_3560f6b1ef954e6f = 1;
        s_exfil utility::ent_flag_set( "player_reached_exfil" );
    }
    
    function_aa8c7bf68451dd7b( s_exfil );
    
    while ( true )
    {
        if ( isdefined( s_exfil.s_exfil_destination ) )
        {
            var_377bd4abb127e9c1 = self.var_3560f6b1ef954e6f;
            
            if ( self.var_3560f6b1ef954e6f && ( !isalive( self ) || !function_220801213cd3f346( s_exfil ) ) )
            {
                self.var_3560f6b1ef954e6f = undefined;
                function_aa8c7bf68451dd7b( s_exfil );
            }
            else if ( !self.var_3560f6b1ef954e6f && function_220801213cd3f346( s_exfil ) )
            {
                self.var_3560f6b1ef954e6f = 1;
                s_exfil utility::ent_flag_set( "player_reached_exfil" );
                function_aa8c7bf68451dd7b( s_exfil );
            }
            
            if ( !( var_377bd4abb127e9c1 === self.var_3560f6b1ef954e6f ) )
            {
                level callback::callback( #"hash_8a9c77a2d77b7469", { #var_3560f6b1ef954e6f:self.var_3560f6b1ef954e6f, #s_exfil:s_exfil, #player:self } );
            }
        }
        
        wait 0.5;
    }
}

// Namespace exfil
// Params 1
// Checksum 0xab446031, Offset: 0x7cf5
// Size: 0x63
function function_220801213cd3f346( s_exfil )
{
    if ( isdefined( level.var_7862f3f9948a7589 ) )
    {
        return [[ level.var_7862f3f9948a7589 ]]( s_exfil );
    }
    else if ( isdefined( s_exfil.s_exfil_destination ) )
    {
        return ( distancesquared( self.origin, s_exfil.s_exfil_destination.origin ) <= 3062500 );
    }
    
    return 0;
}

// Namespace exfil
// Params 2
// Checksum 0xf13d3045, Offset: 0x7d61
// Size: 0x277
function function_b1e8db6ed72919da( s_exfil, player_activator )
{
    if ( isdefined( level.var_b278ea7214c9362f ) )
    {
        level thread [[ level.var_b278ea7214c9362f ]]( s_exfil, player_activator );
        return;
    }
    
    exfil_spawn_destination( s_exfil );
    s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_site", "standby" );
    
    if ( is_quest_exfil( s_exfil ) )
    {
        level thread br_contract_manager::utilflare_shootflare( s_exfil.s_exfil_destination.origin, "dmz_exfil", undefined, 1 );
    }
    else
    {
        level thread br_contract_manager::utilflare_shootflare( s_exfil.s_exfil_destination.origin, "dmz_exfil" );
    }
    
    if ( !function_9aa9df8577941cb0() && isent( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination makeunusable();
    }
    
    if ( level.var_c4d360df2f5424a6 && !s_exfil.var_98b77b5122d0fb93 )
    {
        n_obj_id = objidpoolmanager::requestobjectiveid( 1 );
        s_exfil.s_exfil_destination.mdl_destination.n_obj_id = n_obj_id;
        objidpoolmanager::objective_add_objective( n_obj_id, "invisible", s_exfil.s_exfil_destination.mdl_destination.origin, "ui_icon_hud_exfil_chopper", "icon_small" );
        
        if ( isent( s_exfil.s_exfil_destination.mdl_destination ) )
        {
            objidpoolmanager::update_objective_onentity( n_obj_id, s_exfil.s_exfil_destination.mdl_destination );
        }
        
        objidpoolmanager::update_objective_setzoffset( n_obj_id, 40 );
        objidpoolmanager::update_objective_setbackground( n_obj_id, 1 );
        objective_setlabel( n_obj_id, &"shared_hintstrings/exfil" );
        
        foreach ( player in s_exfil.a_exfil_players )
        {
            objective_addclienttomask( n_obj_id, player );
            objective_showtoplayersinmask( n_obj_id );
        }
    }
    
    level thread function_cd2b4547ffe3217a( s_exfil, player_activator );
    s_exfil utility::ent_flag_wait( "exfil_complete_kill_count" );
}

// Namespace exfil
// Params 1
// Checksum 0xfced2ff2, Offset: 0x7fe0
// Size: 0x110
function function_2cbf325d4a811e3f( s_exfil )
{
    self endon( #"leaving" );
    s_exfil endon( #"exfil_complete_timeout" );
    self waittill( #"death" );
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( isdefined( player ) )
        {
            player.s_exfil = undefined;
            player.var_3560f6b1ef954e6f = undefined;
        }
    }
    
    if ( s_exfil.var_b09c68be26c84664 )
    {
        s_exfil notify( #"exfil_timer_force_complete" );
    }
    else
    {
        level thread exfil_timer( s_exfil, 1, 1 );
        s_exfil notify( #"exfil_timer_force_complete" );
    }
    
    if ( isdefined( self ) )
    {
        function_2cb1277f20ee1f9f( s_exfil );
        exfil_vehicle_delete( s_exfil );
    }
}

// Namespace exfil
// Params 2
// Checksum 0xe4d6f7f3, Offset: 0x80f8
// Size: 0x5f
function function_768405811aaaff19( n_time, v_destination )
{
    n_speed = 30;
    
    if ( n_time > 0 )
    {
        var_f6858a2e1bd83142 = n_time / 3600;
        n_distance_away = distance( self.origin, v_destination ) / 63360;
        n_speed = n_distance_away / var_f6858a2e1bd83142;
    }
    
    return n_speed;
}

// Namespace exfil
// Params 3
// Checksum 0x670877e5, Offset: 0x8160
// Size: 0x1014
function function_cd2b4547ffe3217a( s_exfil, player_activator, str_surface_type )
{
    n_speed = 150;
    n_acceleration = 15;
    var_6ac06bc3285f7d0b = s_exfil.s_exfil_destination.origin;
    
    if ( !isdefined( str_surface_type ) )
    {
        str_surface_type = "air";
    }
    
    var_daa1fdc7ce6215c4 = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination.target ) && !s_exfil.var_7f75e127c1f57499 )
    {
        var_40cb63f2f7e8f711 = utility::getstructarray( s_exfil.s_exfil_destination.target, "targetname" );
        var_daa1fdc7ce6215c4 = utility::array_random( var_40cb63f2f7e8f711 );
    }
    
    if ( isdefined( level.var_a347479bbc614700 ) && isdefined( s_exfil.targetname ) && isdefined( utility::getstruct( s_exfil.targetname, "script_noteworthy" ) ) )
    {
        var_daa1fdc7ce6215c4 = utility::getstruct( s_exfil.targetname, "script_noteworthy" );
    }
    
    if ( isstruct( var_daa1fdc7ce6215c4 ) )
    {
        v_vehicle_spawn = var_daa1fdc7ce6215c4.origin;
        s_exfil.v_spawn_ang = var_daa1fdc7ce6215c4.angles;
    }
    else
    {
        var_4c08500dbe3113d9 = level.mapcenter - var_6ac06bc3285f7d0b;
        var_4c08500dbe3113d9 = vectornormalize( ( var_4c08500dbe3113d9[ 0 ], var_4c08500dbe3113d9[ 1 ], 0 ) );
        v_vehicle_spawn = var_4c08500dbe3113d9 * -30000 + ( 0, 0, 1 ) * 1000 * 2 + ( 0, 0, var_6ac06bc3285f7d0b[ 2 ] );
    }
    
    s_exfil.vh_exfil = exfil_vehicle_spawn( s_exfil, player_activator, v_vehicle_spawn );
    s_exfil.vh_exfil thread function_2cbf325d4a811e3f( s_exfil );
    s_exfil.vh_exfil endon( #"death" );
    s_exfil.vh_exfil endon( #"leaving" );
    s_exfil.vh_exfil function_15170ad2ec72fe5f( 1 );
    var_f6858a2e1bd83142 = getdvarint( @"hash_eb873c5e99093d11", 50 );
    
    if ( isdefined( level.var_3ab1eb83383f8760 ) )
    {
        var_f6858a2e1bd83142 = level.var_3ab1eb83383f8760;
    }
    
    n_speed = s_exfil.vh_exfil function_768405811aaaff19( var_f6858a2e1bd83142, var_6ac06bc3285f7d0b );
    
    if ( n_speed <= 15 )
    {
        n_speed = 15;
    }
    
    n_start_time = gettime();
    s_exfil.vh_exfil thread function_7770f37bce8f446( s_exfil );
    
    if ( isstruct( var_daa1fdc7ce6215c4 ) )
    {
        while ( isstruct( var_daa1fdc7ce6215c4 ) )
        {
            v_goal = var_daa1fdc7ce6215c4.origin;
            n_node_speed = var_daa1fdc7ce6215c4.script_speed ?? n_speed;
            n_acceleration = var_daa1fdc7ce6215c4.script_accel ?? n_acceleration;
            n_deceleration = var_daa1fdc7ce6215c4.script_decel ?? n_acceleration / 2;
            s_exfil.vh_exfil vehicle_setspeed( n_node_speed, n_acceleration, n_deceleration );
            s_exfil.vh_exfil function_1e41fd9b66088249( v_goal, !isdefined( var_daa1fdc7ce6215c4.target ) );
            msg = s_exfil.vh_exfil utility::waittill_any_timeout( 40, "goal" );
            
            if ( isdefined( var_daa1fdc7ce6215c4.target ) )
            {
                var_40cb63f2f7e8f711 = utility::getstructarray( var_daa1fdc7ce6215c4.target, "targetname" );
                var_daa1fdc7ce6215c4 = utility::array_random( var_40cb63f2f7e8f711 );
                continue;
            }
            
            break;
        }
    }
    
    if ( !isdefined( var_8e96f231b0fedb41 ) )
    {
        var_8e96f231b0fedb41 = 0;
    }
    
    if ( isdefined( level.var_786872eda5caaa89 ) )
    {
        var_8e96f231b0fedb41 = level.var_786872eda5caaa89;
    }
    
    if ( isdefined( level.var_a347479bbc614700 ) && isdefined( s_exfil.targetname ) && isdefined( utility::getstruct( s_exfil.targetname + "_dest", "script_noteworthy" ) ) )
    {
        s_exfil.s_land = utility::getstruct( s_exfil.targetname + "_dest", "script_noteworthy" );
        s_exfil.v_land = s_exfil.s_land.origin;
        v_enter_end = s_exfil.v_land + ( 0, 0, 1000 );
    }
    else
    {
        v_enter_end = var_6ac06bc3285f7d0b + ( 0, 0, 1000 );
    }
    
    s_exfil.vh_exfil vehicle_setspeed( n_speed, n_acceleration );
    s_exfil.vh_exfil function_1e41fd9b66088249( v_enter_end, 1 );
    str_return = s_exfil.vh_exfil utility::waittill_any_timeout( var_f6858a2e1bd83142 + 15, "goal" );
    
    if ( str_return == "timeout" )
    {
        s_exfil.vh_exfil.origin = v_enter_end;
    }
    else if ( str_return == "goal" )
    {
        s_exfil notify( #"chopper_arrival" );
    }
    
    n_elapsed_time = utility::function_6f5d2e1f1ff70482( gettime() - n_start_time );
    
    /#
        iprintln( "<dev string:x410>" + s_exfil.name + "<dev string:x426>" + n_elapsed_time + "<dev string:x42d>" );
    #/
    
    logstring( "Exfil Helicopter at: " + s_exfil.name + " took " + n_elapsed_time + " seconds to arrive" );
    s_exfil.vh_exfil utility::delaythread( 6, &function_15170ad2ec72fe5f, 0 );
    
    if ( function_9aa9df8577941cb0() )
    {
        s_exfil utility::ent_flag_wait( "player_reached_exfil" );
    }
    else
    {
        s_exfil utility::ent_flag_wait( "exfil_complete_kill_count" );
    }
    
    if ( !s_exfil.var_cfaf4da7160f1198 )
    {
        if ( isdefined( level.var_e018ed766dd5f4c2 ) )
        {
            foreach ( player in s_exfil.a_exfil_players )
            {
                if ( ![[ level.var_e018ed766dd5f4c2 ]]( player ) )
                {
                    player thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_landing" );
                }
            }
        }
        else
        {
            s_exfil.a_exfil_players thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_landing" );
        }
    }
    
    if ( isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "dissipate" );
    }
    
    var_b53ad4385926463e = s_exfil.vh_exfil tagexists( "tag_ground" ) ? "tag_ground" : "tag_origin_static";
    
    if ( !isdefined( var_b53ad4385926463e ) )
    {
        var_b53ad4385926463e = "tag_origin";
    }
    
    if ( function_6c954b552067189f() )
    {
        if ( isdefined( level.var_a347479bbc614700 ) && isdefined( s_exfil.v_land ) )
        {
            v_descend = s_exfil.v_land;
            var_b53ad4385926463e = "tag_origin";
        }
        else
        {
            v_halfsize = s_exfil.vh_exfil getboundshalfsize();
            var_6985b265ccf6e04f = getgroundposition( var_6ac06bc3285f7d0b + ( 0, 0, 8 ), max( v_halfsize[ 0 ], v_halfsize[ 1 ] ) ) + ( 0, 0, 4 );
            v_descend = var_6985b265ccf6e04f;
        }
    }
    else
    {
        if ( !level.var_d2eb1794cd937603 )
        {
            s_exfil.vh_exfil.mdl_rope = utility::spawn_model( "br_plunder_extraction_delivery_rope", s_exfil.vh_exfil.origin, s_exfil.vh_exfil.angles );
            s_exfil.vh_exfil.mdl_rope linkto( s_exfil.vh_exfil, var_b53ad4385926463e, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        }
        
        v_descend = var_6ac06bc3285f7d0b + ( 0, 0, ( 1000 + var_8e96f231b0fedb41 ) / 3.25 );
    }
    
    var_1b3b2d85fddefd10 = s_exfil.vh_exfil function_768405811aaaff19( getdvarfloat( @"hash_346baccb7a031727", 7 ), v_descend );
    s_exfil.vh_exfil vehicle_setspeed( var_1b3b2d85fddefd10, 2 );
    n_goal_yaw = undefined;
    
    if ( isdefined( level.var_a347479bbc614700 ) && isdefined( s_exfil.s_land ) )
    {
        s_exfil.vh_exfil function_1e41fd9b66088249( v_descend, 1, s_exfil.s_land.angles );
        n_goal_yaw = s_exfil.s_land.angles[ 1 ];
    }
    else
    {
        s_exfil.vh_exfil function_1e41fd9b66088249( v_descend, 1, s_exfil.s_exfil_destination.angles );
        n_goal_yaw = s_exfil.s_exfil_destination.angles[ 1 ];
    }
    
    v_halfsize = s_exfil.vh_exfil getboundshalfsize();
    n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
    
    if ( function_6c954b552067189f() )
    {
        s_exfil.vh_exfil.interact = s_exfil.vh_exfil;
        s_exfil.vh_exfil.interact.s_exfil = s_exfil;
        s_exfil.vh_exfil thread function_5961d70a23314f7b( var_b53ad4385926463e, v_descend );
        
        while ( true )
        {
            var_9922884e75fbc5d = s_exfil.vh_exfil gettagorigin( var_b53ad4385926463e );
            var_a99e157fc596dfdd = s_exfil.vh_exfil vehicle_getspeed();
            var_d98fb546147f7794 = s_exfil.vh_exfil.angles[ 1 ] - n_goal_yaw;
            n_height_diff = var_9922884e75fbc5d[ 2 ] - v_descend[ 2 ];
            
            if ( abs( n_height_diff ) <= 4 || s_exfil.vh_exfil.var_e7e03d4a1a5a6363 )
            {
                break;
            }
            
            foreach ( player in level.players )
            {
                if ( function_9aa9df8577941cb0() )
                {
                    continue;
                }
                
                if ( isalive( player ) && player.sessionstate == "playing" && distance( player.origin, v_descend ) < n_radius )
                {
                    dir = vectornormalize( v_descend - player.origin );
                    vel = dir * -150;
                    player setvelocity( vel );
                }
            }
            
            var_52f92a588de11a5f = getentarrayinradius( "script_vehicle", #code_classname, v_descend, n_radius, 1 );
            
            foreach ( vehicle in var_52f92a588de11a5f )
            {
                if ( vehicle == s_exfil.vh_exfil )
                {
                    continue;
                }
                
                if ( isalive( vehicle ) )
                {
                    if ( vehicle istouching( s_exfil.vh_exfil ) )
                    {
                        vehicle_occupancy::eject_all_occupants( vehicle );
                        vehicle dodamage( vehicle.health + 666, vehicle.origin );
                    }
                }
            }
            
            a_nearby_ai = getaiarrayinradius( v_descend, n_radius );
            
            foreach ( ai in a_nearby_ai )
            {
                if ( isalive( ai ) && ai istouching( s_exfil.vh_exfil ) )
                {
                    ai kill();
                }
            }
            
            waitframe();
        }
    }
    else
    {
        if ( !isdefined( level.var_cfe1d326c601b127 ) )
        {
            level.var_cfe1d326c601b127 = 100;
        }
        
        s_exfil.vh_exfil.interact = interaction::register_interact( s_exfil.s_exfil_destination.origin + ( 0, 0, 16 ), level.var_cfe1d326c601b127, &function_508d7657b4bfef45, &"shared_hintstrings/exfil_complete_use" );
        s_exfil.vh_exfil.interact.s_exfil = s_exfil;
        s_exfil.vh_exfil.interact interaction::function_e4a4753e6eac02d7();
        s_exfil.vh_exfil.interact setusepriority( -1, 1 );
        msg = s_exfil.vh_exfil utility::waittill_any_timeout( 10, "goal" );
    }
    
    s_exfil.vh_exfil utility::ent_flag_set( "landed" );
    s_exfil notify( #"chopper_landing" );
    
    if ( isdefined( s_exfil.mdl_exfil ) && isdefined( s_exfil.vh_exfil ) )
    {
        if ( !isdefined( s_exfil.vh_exfil.index ) )
        {
            s_exfil.vh_exfil.index = s_exfil.vh_exfil getentitynumber();
        }
        
        calloutmarkerping::function_9bd4bf4f8fe74b16( s_exfil.mdl_exfil, s_exfil.vh_exfil, undefined, ( 0, 0, 72 ) );
    }
    
    if ( !s_exfil.var_1baaa59325724d73 )
    {
        s_exfil.a_exfil_players thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_touchdown" );
    }
    
    if ( s_exfil.vh_exfil vehicle::ishelicopter() && function_6c954b552067189f() )
    {
        s_exfil.vh_exfil sethoverparams( 0, 0, 0 );
        s_exfil.vh_exfil cleargoalyaw();
        s_exfil.vh_exfil settargetyaw( utility::flat_angle( s_exfil.vh_exfil.angles )[ 1 ] );
    }
    
    s_exfil.vh_exfil vehicle_code::vehicle_remove_navobstacle();
    s_exfil.vh_exfil.navobstacleid = createnavbadplacebyent( s_exfil.vh_exfil );
    wait 0.5;
    s_exfil.vh_exfil vehicle_code::vehicle_remove_navobstacle();
    s_exfil.vh_exfil.navobstacleid = createnavbadplacebyent( s_exfil.vh_exfil );
    a_nearby_ai = getaiarrayinradius( v_descend, n_radius );
    
    foreach ( ai in a_nearby_ai )
    {
        if ( isalive( ai ) && ai istouching( s_exfil.vh_exfil ) )
        {
            ai kill();
            waitframe();
        }
    }
    
    if ( function_9aa9df8577941cb0() && getdvarint( @"hash_46e4f95ef8ccb491", 0 ) )
    {
        waitframe();
        var_8d423848a1600df0 = s_exfil.vh_exfil function_3fb34074bdaba690();
        s_exfil.vh_exfil function_8ae9818165e25a9c( var_8d423848a1600df0 );
    }
    
    s_exfil.vh_exfil thread function_d4a2f444abe3af13( s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0xcc09e9e5, Offset: 0x917c
// Size: 0xb1
function function_7770f37bce8f446( s_exfil )
{
    self endon( #"death" );
    self endon( #"landed" );
    
    while ( isdefined( s_exfil.s_exfil_destination ) && !s_exfil.var_b11444efae37456f )
    {
        n_time_away = distance( self.origin, s_exfil.s_exfil_destination.origin ) / 63360 / max( 1, self vehicle_getspeed() );
        n_time_away *= 3600;
        
        if ( n_time_away <= 15 )
        {
            s_exfil.a_exfil_players thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_15_out" );
            return;
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 3
// Checksum 0x4f08a683, Offset: 0x9235
// Size: 0xcd
function function_1e41fd9b66088249( v_pos, var_fce200b1865853f7, v_ang )
{
    if ( isstruct( v_pos ) )
    {
        v_ang = v_pos.angles;
        v_pos = v_pos.origin;
    }
    
    if ( self vehicle_isphysveh() && self hascomponent( "p2p" ) )
    {
        self function_eb88c4e66edbc855( "p2p", "brakeAtGoal", istrue( var_fce200b1865853f7 ) );
        self function_eb88c4e66edbc855( "p2p", "goalPoint", v_pos );
        
        if ( isdefined( v_ang ) )
        {
            self function_eb88c4e66edbc855( "p2p", "goalAngles", ( 0, v_ang[ 1 ], 0 ) );
        }
        
        return;
    }
    
    self setvehgoalpos( v_pos, var_fce200b1865853f7 );
    
    if ( isdefined( v_ang ) )
    {
        self setgoalyaw( utility::flat_angle( v_ang )[ 1 ] );
        self settargetyaw( utility::flat_angle( v_ang )[ 1 ] );
    }
}

// Namespace exfil
// Params 0
// Checksum 0x4b6eaf18, Offset: 0x930a
// Size: 0xc3
function function_4f2b50cdb23bab82()
{
    self endon( #"goal" );
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"collision", body0, body1, flag0, flag1, position, normal, normalspeed, ent, partenum );
        
        if ( !( isdefined( ent ) && isdefined( ent.classname ) ) || ent.classname == "worldspawn" )
        {
            self notify( #"goal" );
            return;
        }
    }
}

// Namespace exfil
// Params 2
// Checksum 0x8ead5e0, Offset: 0x93d5
// Size: 0xe0
function function_5961d70a23314f7b( var_b53ad4385926463e, v_descend )
{
    self endon( #"death" );
    self endon( #"landed" );
    v_previous_origin = self gettagorigin( var_b53ad4385926463e );
    var_331320e31b6e8f89 = 0;
    var_6baa813a3e35a54 = 20;
    var_f4769272a26c06dc = 0;
    
    while ( true )
    {
        v_current_origin = self gettagorigin( var_b53ad4385926463e );
        n_height_diff = v_current_origin[ 2 ] - v_descend[ 2 ];
        
        if ( distance( v_current_origin, v_previous_origin ) < 5 )
        {
            var_331320e31b6e8f89 += 1;
        }
        else
        {
            v_previous_origin = v_current_origin;
            var_331320e31b6e8f89 = 0;
        }
        
        if ( abs( n_height_diff ) <= 200 )
        {
            var_f4769272a26c06dc += 1;
        }
        
        if ( var_331320e31b6e8f89 >= 5 || var_f4769272a26c06dc >= var_6baa813a3e35a54 )
        {
            self.var_e7e03d4a1a5a6363 = 1;
            break;
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x45378239, Offset: 0x94bd
// Size: 0x198
function exfil_vehicle_delete( s_exfil )
{
    function_25ebbe6e8a21f6b8();
    
    if ( isent( self.mdl_rope ) )
    {
        self.mdl_rope delete();
    }
    
    if ( isarray( self.pilots ) )
    {
        foreach ( pilot in self.pilots )
        {
            if ( isent( pilot ) )
            {
                pilot delete();
            }
        }
    }
    
    foreach ( player in level.players )
    {
        if ( player.liveragdoll && palfa_shared::function_2f4a28086a3dcef2( player.origin ) )
        {
            player setorigin( s_exfil.origin + ( 0, 0, 4 ) );
        }
    }
    
    level.var_c8ab615737888686 = arrayremove( level.var_c8ab615737888686, self );
    thread vehicle_tracking::delete_vehicle( self );
    vehicle_tracking::reserve_vehicle();
}

// Namespace exfil
// Params 1
// Checksum 0x51467dde, Offset: 0x965d
// Size: 0x11f
function function_d4a2f444abe3af13( s_exfil )
{
    self endon( #"death" );
    
    if ( !function_9aa9df8577941cb0() || getdvarint( @"hash_46e4f95ef8ccb491", 0 ) )
    {
        return;
    }
    
    v_halfsize = self getboundshalfsize();
    n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
    
    if ( isdefined( s_exfil.player_activator ) )
    {
        str_player_team = s_exfil.player_activator.team;
    }
    else
    {
        str_player_team = "allies";
    }
    
    while ( true )
    {
        a_ai = function_d2d1fbcc599547e5( s_exfil );
        
        foreach ( ai in a_ai )
        {
            ai kill();
            waitframe();
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 1
// Checksum 0xee4c3b0b, Offset: 0x9784
// Size: 0x12e
function function_d2d1fbcc599547e5( s_exfil )
{
    v_halfsize = self getboundshalfsize();
    n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
    
    if ( isdefined( s_exfil.player_activator ) )
    {
        str_player_team = s_exfil.player_activator.team;
    }
    else
    {
        str_player_team = "allies";
    }
    
    a_ai = getaiarrayinradius( self.origin, n_radius );
    a_ai_in_vehicle = [];
    
    foreach ( ai in a_ai )
    {
        if ( isalive( ai ) && ai.team != str_player_team && palfa_shared::function_2f4a28086a3dcef2( ai.origin ) )
        {
            a_ai_in_vehicle[ a_ai_in_vehicle.size ] = ai;
        }
    }
    
    return a_ai_in_vehicle;
}

// Namespace exfil
// Params 1
// Checksum 0xd0de7e66, Offset: 0x98bb
// Size: 0x46
function function_15170ad2ec72fe5f( b_enable )
{
    if ( b_enable )
    {
        if ( self vehicle_isphysveh() )
        {
            self function_d2b8ee2e1275daaf( b_enable );
        }
        else
        {
            self notsolid();
        }
        
        return;
    }
    
    if ( self vehicle_isphysveh() )
    {
        self function_d2b8ee2e1275daaf( b_enable );
        return;
    }
    
    self solid();
}

// Namespace exfil
// Params 3
// Checksum 0xbbc7265, Offset: 0x9909
// Size: 0x290
function exfil_vehicle_spawn( s_exfil, player_activator, v_vehicle_spawn )
{
    if ( function_6c954b552067189f() )
    {
        vh_exfil = function_920ea0c844c7e00d( s_exfil, player_activator, v_vehicle_spawn );
        vh_exfil.var_ce834c472e64bb2 = 1;
        vh_exfil function_773d3c80518533c4();
    }
    else
    {
        spawndata = spawnstruct();
        spawndata.origin = function_be4318402c9c1594( v_vehicle_spawn );
        spawndata.angles = ( 0, 0, 0 );
        spawndata.spawntype = "GAME_MODE";
        spawndata.var_305ce2bb6ec0993d = s_exfil.var_1469030464b194a6;
        spawndata.script_modelname = level.var_efa59ce269f371c8;
        spawndata.var_499a16b493ff31ed = 1;
        spawndata.triggerrecycle = 1;
        s_exfil_activity_bundle = function_3e68f7962cd82ad3( s_exfil );
        var_944b42c82cee9a53 = s_exfil_activity_bundle.var_48ea3f48f1624ab3 ?? "veh9_palfa";
        n_tries = 0;
        
        while ( true )
        {
            vh_exfil = vehicle::spawn( var_944b42c82cee9a53, spawndata );
            
            if ( isdefined( vh_exfil ) )
            {
                break;
            }
            
            n_tries++;
            wait 1;
            var_4c08500dbe3113d9 = level.mapcenter - s_exfil.s_exfil_destination.origin;
            var_4c08500dbe3113d9 = vectornormalize( ( var_4c08500dbe3113d9[ 0 ], var_4c08500dbe3113d9[ 1 ], 0 ) );
            n_distance_away = -30000 + n_tries * 2000;
            spawndata.origin = var_4c08500dbe3113d9 * n_distance_away + ( 0, 0, 1 ) * 1000 * 2;
            
            if ( n_tries > 15 )
            {
                spawndata.origin = s_exfil.s_exfil_destination.origin + ( 0, 0, 1000 );
            }
        }
        
        vehicle_interact::allow_use( vh_exfil, 0 );
    }
    
    vh_exfil.s_exfil = s_exfil;
    vh_exfil.godmode = 1;
    vh_exfil val::set( "exfil", "vehicle_disallow_lockon", 1 );
    vh_exfil vehicle_code::vehicle_disable_navobstacles();
    level.var_c8ab615737888686[ level.var_c8ab615737888686.size ] = vh_exfil;
    
    if ( utility::issharedfuncdefined( #"exfil", #"hash_4b0ec51fa4b05300" ) )
    {
        [[ utility::getsharedfunc( #"exfil", #"hash_4b0ec51fa4b05300" ) ]]( vh_exfil );
    }
    
    vh_exfil callback::callback( "on_exfil_vehicle_spawned" );
    return vh_exfil;
}

// Namespace exfil
// Params 3, eflags: 0x4
// Checksum 0x9273402f, Offset: 0x9ba2
// Size: 0x328
function private function_920ea0c844c7e00d( s_exfil, player_activator, v_vehicle_spawn )
{
    spawndata = spawnstruct();
    spawndata.origin = function_be4318402c9c1594( v_vehicle_spawn );
    
    if ( isdefined( s_exfil.v_spawn_ang ) )
    {
        v_spawn_ang = s_exfil.v_spawn_ang;
    }
    else
    {
        v_spawn_ang = ( 0, 0, 0 );
    }
    
    spawndata.angles = v_spawn_ang;
    spawndata.spawntype = "GAME_MODE";
    spawndata.var_305ce2bb6ec0993d = s_exfil.var_1469030464b194a6;
    spawndata.var_499a16b493ff31ed = 1;
    spawndata.triggerrecycle = 1;
    s_exfil_activity_bundle = function_3e68f7962cd82ad3( s_exfil );
    spawndata.vehicletype = s_exfil_activity_bundle.var_48ea3f48f1624ab3 ?? "veh9_palfa";
    heli = undefined;
    n_tries = 0;
    
    while ( true )
    {
        vehicle_tracking::function_4f76f5b4541acef1();
        faildata = {};
        heli = vehicle::spawn( spawndata.vehicletype, spawndata, faildata );
        
        if ( isdefined( heli ) )
        {
            break;
        }
        
        n_tries++;
        vehicle_tracking::reserve_vehicle();
        logstring( "==CPMP Exfil: Walkable vehicle failed to spawn at " + spawndata.origin + " for exfil: " + s_exfil.name + ". Attempts: " + n_tries + ". Reason: " + ( faildata.fail ?? "unknown" ) );
        wait 0.5;
        
        if ( n_tries > 60 )
        {
            spawndata.origin = s_exfil.s_exfil_destination.origin + ( 0, 0, 1000 );
            continue;
        }
        
        var_4c08500dbe3113d9 = s_exfil.s_exfil_destination.origin - level.mapcenter;
        var_4c08500dbe3113d9 = vectornormalize( ( var_4c08500dbe3113d9[ 0 ], var_4c08500dbe3113d9[ 1 ], 0 ) );
        n_distance_away = -30000 + n_tries * 500;
        spawndata.origin = var_4c08500dbe3113d9 * n_distance_away + ( 0, 0, 1 ) * 1000 * 2;
        
        /#
            iprintln( "<dev string:x440>" + s_exfil.name + "<dev string:x45e>" + distance( spawndata.origin, s_exfil.s_exfil_destination.origin ) + "<dev string:x463>" );
        #/
    }
    
    vehicle_interact::allow_use( heli, 0 );
    heli vehicle_damage::set_can_damage( 0 );
    heli.callingteam = isdefined( player_activator ) ? player_activator.team : undefined;
    heli.playersinside = [];
    heli.onstartriding = &function_9fc64d712269c3b8;
    heli.onendriding = &function_5447956cdd6d64d6;
    heli.unload_land_offset = 255;
    heli.var_19a36b17776e8e85 = 1;
    heli.var_24dfe30364488f30 = 1;
    return heli;
}

// Namespace exfil
// Params 1
// Checksum 0x526a8da2, Offset: 0x9ed3
// Size: 0x13d
function function_773d3c80518533c4( var_e555084b18a3253a )
{
    var_7a9514a516d8f9ef = [ "body_sp_ally_pilot_western_vm_fullbody", "body_sp_ally_pilot_western_vm_fullbody" ];
    var_e882642c5a8f5ac9 = [ "iw9_mp_heli_palfa_seat_0_idle", "iw9_heli_palfa_seat_1_idle" ];
    var_e95121c0e4dc8c10 = [ "tag_seat_0", "tag_seat_1" ];
    self.pilots = [];
    var_e555084b18a3253a = isdefined( var_e555084b18a3253a ) ? min( var_e555084b18a3253a, var_e95121c0e4dc8c10.size ) : var_e95121c0e4dc8c10.size;
    pilot_count = 0;
    
    foreach ( i, var_40d811ae13304e9a in var_7a9514a516d8f9ef )
    {
        if ( pilot_count >= var_e555084b18a3253a )
        {
            break;
        }
        
        mdl_pilot = spawn_pilot( i, var_e95121c0e4dc8c10[ i ], var_e882642c5a8f5ac9[ i ], var_40d811ae13304e9a );
        
        if ( isdefined( mdl_pilot ) )
        {
            self.pilots[ self.pilots.size ] = mdl_pilot;
            pilot_count++;
        }
    }
}

// Namespace exfil
// Params 5
// Checksum 0xbb8a54aa, Offset: 0xa018
// Size: 0x11c
function spawn_pilot( posindex, tag, animname, model, headmodel )
{
    v_pos = self gettagorigin( tag );
    v_ang = self gettagangles( tag );
    
    if ( !( isdefined( v_pos ) && isdefined( v_ang ) ) )
    {
        return;
    }
    
    mdl_pilot = utility::spawn_model( model, v_pos, v_ang );
    v_pos = mdl_pilot gettagorigin( "j_spine4" );
    v_ang = mdl_pilot gettagangles( "j_spine4" );
    mdl_pilot.linkedents = [];
    
    if ( isdefined( headmodel ) )
    {
        head = spawn( "script_model", v_pos );
        head.angles = v_ang;
        head setmodel( headmodel );
        head linkto( mdl_pilot, "j_spine4" );
        mdl_pilot.linkedents[ mdl_pilot.linkedents.size ] = head;
        mdl_pilot.head = head;
    }
    
    mdl_pilot linkto( self );
    
    if ( isdefined( animname ) )
    {
        mdl_pilot scriptmodelplayanim( animname );
    }
    
    return mdl_pilot;
}

// Namespace exfil
// Params 1
// Checksum 0x50f2d2fa, Offset: 0xa13d
// Size: 0x15
function function_9fc64d712269c3b8( player )
{
    thread function_ed5ec55bb5b1e961( player );
}

// Namespace exfil
// Params 1, eflags: 0x4
// Checksum 0x2742084a, Offset: 0xa15a
// Size: 0x492
function private function_ed5ec55bb5b1e961( player )
{
    player notify( #"hash_50e6f4d741bee789" );
    player endon( #"hash_50e6f4d741bee789" );
    player endon( #"disconnect" );
    player.var_22bd8935826c4bc5 = 1;
    player.var_a10f7b74f982f0f0 = self;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    s_exfil = self.s_exfil ?? player.s_exfil;
    
    if ( !isdefined( s_exfil ) )
    {
        logstring( "==CPMP Exfil: Exfil vehicle exists, but can't get actual Exfil struct!" );
        return;
    }
    
    utility::ent_flag_wait( "landed" );
    s_exfil.a_exfil_players = arraycombineunique( s_exfil.a_exfil_players, [ player ] );
    s_exfil.a_exfil_players = function_46f9072493651dc9( s_exfil.a_exfil_players );
    self.playersinside = function_dd31ebe361ca1538( self.playersinside );
    
    if ( !isdefined( self.playersinside[ player.guid ] ) )
    {
        self.playersinside[ player.guid ] = player;
        outofbounds::enableoobimmunity( player );
        function_aa8c7bf68451dd7b( s_exfil );
        
        if ( !function_9aa9df8577941cb0() )
        {
            player function_aafd590d53fc6ba4( s_exfil );
        }
    }
    
    if ( function_9aa9df8577941cb0() )
    {
        if ( !isdefined( s_exfil.player_activator ) )
        {
            return;
        }
        
        a_squad_members = s_exfil.player_activator squad_utility::getsquadmembers( undefined, 1 );
        var_615aa88f55b0277d = 0;
        var_e48d899bc1566656 = 0;
        
        foreach ( squad_member in a_squad_members )
        {
            if ( squad_member.var_22bd8935826c4bc5 )
            {
                var_e48d899bc1566656++;
            }
        }
        
        if ( var_e48d899bc1566656 == a_squad_members.size )
        {
            var_615aa88f55b0277d = 1;
        }
        else
        {
            var_615aa88f55b0277d = 0;
            
            if ( var_e48d899bc1566656 >= a_squad_members.size / 2 )
            {
                a_players_inside = [];
                var_7ca960c5e4835de7 = [];
                
                foreach ( squad_member in a_squad_members )
                {
                    if ( squad_member.var_22bd8935826c4bc5 )
                    {
                        a_players_inside[ a_players_inside.size ] = squad_member;
                        continue;
                    }
                    
                    var_7ca960c5e4835de7[ var_7ca960c5e4835de7.size ] = squad_member;
                }
                
                if ( s_exfil.n_time_remaining > 5 )
                {
                    a_players_inside thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_missing" );
                }
            }
        }
        
        if ( var_615aa88f55b0277d && !s_exfil.var_693d6f7949691721 )
        {
            s_exfil.var_693d6f7949691721 = 1;
            
            if ( s_exfil.n_time_remaining > 5 )
            {
                if ( !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
                {
                    level thread function_4103414ca5f4f486( s_exfil );
                }
                
                return;
            }
            
            if ( !s_exfil.var_9ed2304bd5fb8457 )
            {
                s_exfil.a_exfil_players thread utility::delaythread( 6, &function_8a8a9be80ffa5dc3, s_exfil, "exfil_called_lastsecond" );
            }
        }
        
        return;
    }
    
    foreach ( player_heli in s_exfil.a_exfil_players )
    {
        if ( !player_heli.var_22bd8935826c4bc5 )
        {
            return;
        }
    }
    
    foreach ( player_heli in s_exfil.a_exfil_players )
    {
        self.interact function_508d7657b4bfef45( player_heli );
    }
    
    if ( !self.leaving && !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        activity_instance_common::endactivity( s_exfil.s_activity_instance, 1 );
        thread function_82f71643e34041a8( s_exfil );
    }
}

// Namespace exfil
// Params 1
// Checksum 0xbaad8842, Offset: 0xa5f4
// Size: 0xc4
function exfil_defend_mode_timer( s_exfil )
{
    self notify( #"endon_exfil_defend_mode_timer" );
    self endon( #"endon_exfil_defend_mode_timer" );
    self endon( #"death_or_disconnect" );
    self setclientomnvar( "ui_is_exfil_countdown", 1 );
    var_23367f342abe5aed = s_exfil.var_ad0db8ace639b9b6 ?? 35;
    
    while ( true )
    {
        self waittill( #"exfil_time_remaining", n_time_remaining );
        
        if ( n_time_remaining <= var_23367f342abe5aed )
        {
            n_time_remaining = int( n_time_remaining );
            self setclientomnvar( "ui_match_start_countdown", n_time_remaining );
            self setclientomnvar( "ui_is_exfil_countdown", 1 );
            
            if ( n_time_remaining <= 0 )
            {
                self setclientomnvar( "ui_match_start_countdown", -1 );
                self setclientomnvar( "ui_is_exfil_countdown", 0 );
                break;
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x75ff9f79, Offset: 0xa6c0
// Size: 0x173
function function_4103414ca5f4f486( s_exfil )
{
    var_29e56745d0bfa799 = 5;
    
    if ( isplayer( s_exfil.player_activator ) )
    {
        a_squad_members = s_exfil.player_activator squad_utility::getsquadmembers();
        
        foreach ( player in s_exfil.a_exfil_players )
        {
            if ( isplayer( player ) && !player.var_22bd8935826c4bc5 && !arraycontains( a_squad_members, player ) )
            {
                var_29e56745d0bfa799 = 10;
                break;
            }
        }
    }
    
    if ( !is_quest_exfil( s_exfil ) )
    {
        s_exfil.a_exfil_players thread function_8a8a9be80ffa5dc3( s_exfil, "exfil_called_shortcut" );
    }
    
    if ( isdefined( s_exfil.s_activity_instance.progresstrackers[ "exfil_timer" ] ) )
    {
        s_exfil.s_activity_instance namespace_45ef22ffd1bf8e55::function_3ff7386bdfd71aca( "exfil_timer" );
    }
    
    s_exfil.s_activity_instance namespace_45ef22ffd1bf8e55::function_61568a80767f1652( "exfil_timer", int( var_29e56745d0bfa799 ), &function_f62bb05ee8ef1c6a );
    wait var_29e56745d0bfa799 - 1;
    s_exfil notify( #"exfil_timer_force_complete" );
}

// Namespace exfil
// Params 1
// Checksum 0xf581b917, Offset: 0xa83b
// Size: 0xc9
function function_5447956cdd6d64d6( player )
{
    if ( player isjumping() && palfa_shared::function_2f4a28086a3dcef2( player.origin ) )
    {
        thread exfil_vehicle_jump_hack( player );
        return;
    }
    
    player notify( #"hash_50e6f4d741bee789" );
    self.playersinside[ player.guid ] = undefined;
    
    if ( outofbounds::isoobimmune( player ) )
    {
        outofbounds::disableoobimmunity( player );
    }
    
    s_exfil = self.interact.s_exfil;
    player.var_22bd8935826c4bc5 = undefined;
    player.var_a10f7b74f982f0f0 = undefined;
    
    if ( player.var_4c1251d28c2b0dde )
    {
        player val::reset( "exfil", "damage" );
    }
    
    function_aa8c7bf68451dd7b( s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0x9282b0b9, Offset: 0xa90c
// Size: 0x6a
function exfil_vehicle_jump_hack( player )
{
    self endon( #"death" );
    player notify( #"endon_exfil_vehicle_jump_hack" );
    player endon( #"disconnect" );
    player endon( #"endon_exfil_vehicle_jump_hack" );
    
    while ( player isjumping() )
    {
        waitframe();
    }
    
    if ( !palfa_shared::function_2f4a28086a3dcef2( player.origin ) )
    {
        function_5447956cdd6d64d6( player );
    }
}

// Namespace exfil
// Params 2
// Checksum 0x1abb5694, Offset: 0xa97e
// Size: 0x93
function function_185c01ffe37a9db7( player, b_force_inside )
{
    self endon( #"death" );
    
    if ( function_9aa9df8577941cb0() && !b_force_inside && !self.leaving )
    {
        return;
    }
    
    if ( ( self.leaving || b_force_inside ) && !player.var_22bd8935826c4bc5 )
    {
        game_utility::fadetoblackforplayerkeepui( player, 1, 0.25 );
        player setorigin( self gettagorigin( "tag_seat_7" ) );
        level thread game_utility::fadetoblackforplayerkeepui( player, 0, 0.25 );
    }
}

// Namespace exfil
// Params 2
// Checksum 0x42244c9d, Offset: 0xaa19
// Size: 0x18b
function function_67ecd0b2b982cff2( s_exfil, b_immediate_completion )
{
    if ( function_9aa9df8577941cb0() && function_6c954b552067189f() && isdefined( s_exfil.vh_exfil ) )
    {
        foreach ( player in level.players )
        {
            if ( isalive( player ) && player.sessionstate == "playing" && ( s_exfil.vh_exfil palfa_shared::function_2f4a28086a3dcef2( player.origin ) || isdefined( s_exfil.vh_exfil.playersinside[ player.guid ] ) ) && !player.var_1f12c6803897a86d )
            {
                logstring( "==CPMP Exfil: Attempting to fallback complete exfil for " + ( player.name ?? "unknown" ) + " at exfil " + s_exfil.name );
                
                if ( b_immediate_completion )
                {
                    player.var_bdeeca1e699ddbdb = 1;
                }
                
                player.s_exfil = s_exfil;
                s_exfil.vh_exfil.interact function_508d7657b4bfef45( player );
            }
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0xf130e7b0, Offset: 0xabac
// Size: 0xf7
function function_508d7657b4bfef45( player )
{
    if ( !isplayer( player ) || player.var_1f12c6803897a86d || getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        return;
    }
    
    s_exfil = self.s_exfil ?? player.s_exfil;
    player function_aafd590d53fc6ba4( s_exfil );
    player.var_1f12c6803897a86d = 1;
    
    if ( !isdefined( player.s_exfil ) )
    {
        player.s_exfil = s_exfil;
    }
    
    logstring( "==CPMP Exfil: Start of exfil completion for " + ( player.name ?? "unknown" ) + " at " + s_exfil.name );
    level notify( #"hash_5872f13e4be1c312" );
    
    if ( isdefined( level.var_9f0a7ee32653dd0a ) )
    {
        self thread [[ level.var_9f0a7ee32653dd0a ]]( player );
        return;
    }
    
    /#
        player iprintlnbold( "<dev string:x46e>" );
    #/
}

// Namespace exfil
// Params 1
// Checksum 0x80ea3246, Offset: 0xacab
// Size: 0x90
function function_aafd590d53fc6ba4( s_exfil )
{
    if ( self.b_completed_exfil || getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        return;
    }
    
    self.b_completed_exfil = 1;
    
    if ( !function_9aa9df8577941cb0() )
    {
        thread hud_message::showsplash( "cp_mp_exfil_success" );
    }
    
    thread exfil_board_vehicle( s_exfil );
    callback::callback( "on_exfil_board_vehicle", s_exfil );
    
    if ( isdefined( s_exfil.s_activity_instance ) )
    {
        s_exfil.s_activity_instance activity_participation::function_61aa2b2879f2c0a2( s_exfil.s_activity_instance, self );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x91f531cc, Offset: 0xad43
// Size: 0x1bb
function exfil_board_vehicle( s_exfil )
{
    if ( self.var_22bd8935826c4bc5 || s_exfil.var_9ee6eba1bf8d756b )
    {
        return;
    }
    
    self endon( #"disconnect" );
    self.var_5147067c69d8c534 = utility::spawn_model( "tag_origin", self.origin, self.angles );
    self lerpviewangleclamp( 1, 0, 0, 45, 45, 45, 45, 1 );
    self playerlinktodelta( self.var_5147067c69d8c534, "tag_origin", 1, 60, 60, 45, 45, 1 );
    var_33077839ea2718ce = 11;
    
    for ( i = 2; i <= var_33077839ea2718ce ; i++ )
    {
        var_55c6991531b023e0 = "tag_seat_" + i;
        
        if ( !isdefined( s_exfil.vh_exfil.var_d95a8bc2e3979f97 ) )
        {
            s_exfil.vh_exfil.var_d95a8bc2e3979f97 = [];
        }
        
        if ( !arraycontains( s_exfil.vh_exfil.var_d95a8bc2e3979f97, var_55c6991531b023e0 ) && s_exfil.vh_exfil tagexists( var_55c6991531b023e0 ) )
        {
            s_exfil.vh_exfil.var_d95a8bc2e3979f97[ s_exfil.vh_exfil.var_d95a8bc2e3979f97.size ] = var_55c6991531b023e0;
            level game_utility::fadetoblackforplayerkeepui( self, 1, 0.5 );
            self.var_5147067c69d8c534 linkto( s_exfil.vh_exfil, var_55c6991531b023e0, ( 0, 0, 20 ), ( 0, 0, 0 ) );
            level thread game_utility::fadetoblackforplayerkeepui( self, 0, 0.5 );
            self.var_22bd8935826c4bc5 = 1;
            break;
        }
    }
}

// Namespace exfil
// Params 2
// Checksum 0xa13cc178, Offset: 0xaf06
// Size: 0x43c
function exfil_spawning( s_exfil = level.s_exfil_active, player_activator )
{
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    
    if ( isdefined( level.var_2fa29f760fb6ace5 ) )
    {
        level thread [[ level.var_2fa29f760fb6ace5 ]]( s_exfil, player_activator );
        return;
    }
    
    n_player_count = s_exfil.a_exfil_players.size;
    
    switch ( n_player_count )
    {
        case 1:
            function_73335ef7f523fb05( 35, s_exfil );
            break;
        case 2:
            function_73335ef7f523fb05( int( 46.9 ), s_exfil );
            break;
        case 3:
            function_73335ef7f523fb05( int( 59.5 ), s_exfil );
            break;
        case 4:
        default:
            function_73335ef7f523fb05( int( 71.4 ), s_exfil );
            break;
    }
    
    var_6ac06bc3285f7d0b = s_exfil.s_exfil_destination.origin;
    team = "team_two_hundred";
    n_max_ai = 60;
    s_exfil.var_e8874d05e088458f = int( min( n_max_ai / ( s_exfil.a_exfil_players.size + 1 ), n_max_ai / 3 ) );
    
    if ( !function_9aa9df8577941cb0() )
    {
        s_exfil.s_activity_instance namespace_45ef22ffd1bf8e55::function_c3f4671492898d76( "exfil_kills_remaining", function_7759b15fe5ee89e9( s_exfil ), 0 );
    }
    
    function_aa8c7bf68451dd7b( s_exfil );
    str_encounter_bundle = undefined;
    
    if ( isdefined( level.var_e3788ed969087ff7 ) )
    {
        str_encounter_bundle = [[ level.var_e3788ed969087ff7 ]]( s_exfil, 1 );
    }
    
    level thread function_da1a47c00c185ac2( s_exfil );
    
    if ( !function_9aa9df8577941cb0() )
    {
        level thread track_exfil_ai_at_destination( s_exfil, 3, 1, 1 );
    }
    
    if ( isdefined( str_encounter_bundle ) )
    {
        if ( !function_9aa9df8577941cb0() )
        {
            level thread start_exfil_spawns_at_destination( s_exfil );
        }
        
        if ( !getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
        {
            return;
        }
        
        s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
        s_exfil.var_a5ab8da4cabaa148 = ai_spawn_director::spawn_request( str_encounter_bundle, s_exfil.origin, 10000, 1, 0 );
        
        if ( isdefined( s_exfil.var_a5ab8da4cabaa148 ) )
        {
            function_b417a9d813542c31( s_exfil.var_a5ab8da4cabaa148, s_exfil.a_exfil_players );
            ai_spawn_director::function_c99d360d62c49a9c( s_exfil.var_a5ab8da4cabaa148, &function_ac641e45d6b777af, s_exfil );
            ai_spawn_director::function_71b3c575c1426546( s_exfil.var_a5ab8da4cabaa148, &function_1a288714a30f1c44, s_exfil );
            ai_spawn_director::function_53289c032f506bb1( s_exfil.var_a5ab8da4cabaa148, &function_2328bf7ff3278360, s_exfil );
            
            foreach ( player in s_exfil.a_exfil_players )
            {
                player.var_c81a58ce8a0e6720 = s_exfil.var_a5ab8da4cabaa148;
            }
        }
        
        return;
    }
    
    if ( !getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        return;
    }
    
    while ( true )
    {
        if ( function_7c921bb325ee0536( s_exfil ) < function_664072bb6ca45820( s_exfil ) )
        {
            foreach ( player in s_exfil.a_exfil_players )
            {
                if ( isalive( player ) && player.sessionstate == "playing" && !player::isinlaststand( player ) )
                {
                    player thread function_89f6921bb760337f( s_exfil, var_6ac06bc3285f7d0b, team, s_exfil.var_e8874d05e088458f );
                }
            }
        }
        
        wait randomfloatrange( 5, 10 );
    }
}

// Namespace exfil
// Params 4
// Checksum 0x36e7d460, Offset: 0xb34a
// Size: 0x1f4
function track_exfil_ai_at_destination( s_exfil, var_980827fef2b7d72e = 5, var_9e0e61606161c332 = 0, var_e1de2059933c45b1 = 0 )
{
    s_exfil notify( #"hash_ec789cf5180710d3" );
    s_exfil endon( #"hash_ec789cf5180710d3" );
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    
    while ( true )
    {
        var_e0059352e51fce23 = function_54bc4b828652edac( s_exfil );
        
        if ( var_9e0e61606161c332 )
        {
            n_max_remaining = max( function_664072bb6ca45820( s_exfil ), var_e0059352e51fce23.size );
        }
        else
        {
            n_max_remaining = function_664072bb6ca45820( s_exfil );
        }
        
        if ( n_max_remaining > 0 )
        {
            if ( utility::issharedfuncdefined( #"exfil", #"hash_727362151127a027" ) )
            {
                foreach ( player in s_exfil.a_exfil_players )
                {
                    if ( isdefined( player ) )
                    {
                        player utility::callsharedfunc( #"exfil", #"hash_727362151127a027", s_exfil );
                        continue;
                    }
                    
                    s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
                }
            }
            else
            {
                s_exfil.s_activity_instance progress_tracker_container::function_c47bfeecd65c7559( "exfil_kills_remaining", n_max_remaining );
            }
        }
        
        if ( function_664072bb6ca45820( s_exfil ) <= 0 && ( !var_9e0e61606161c332 || var_e0059352e51fce23.size <= var_980827fef2b7d72e ) && ( !var_e1de2059933c45b1 || !s_exfil utility::ent_flag( "exfil_boss_alive" ) ) )
        {
            break;
        }
        
        wait 0.25;
    }
    
    level thread function_f910f5c95b5f9a04( s_exfil );
}

// Namespace exfil
// Params 4
// Checksum 0xd7a466b8, Offset: 0xb546
// Size: 0xc7
function function_1a288714a30f1c44( requestid, userdata, agent, data )
{
    s_exfil = userdata;
    
    if ( !function_9aa9df8577941cb0() )
    {
        s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
        closest_player = utility::get_array_of_closest( agent.origin, s_exfil.a_exfil_players )[ 0 ];
        function_7ab1f22f29a03979( s_exfil, agent, closest_player );
    }
    else
    {
        agent.s_exfil = s_exfil;
        s_exfil.var_79507aedd281f84d[ s_exfil.var_79507aedd281f84d.size ] = agent;
    }
    
    agent callback::callback( "on_exfil_ai_spawned" );
}

// Namespace exfil
// Params 4
// Checksum 0xc144943d, Offset: 0xb615
// Size: 0xce
function function_fc75727f9e1e4bd3( requestid, userdata, agent, data )
{
    s_exfil = userdata;
    
    if ( !function_9aa9df8577941cb0() )
    {
        s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
        closest_player = utility::get_array_of_closest( agent.origin, s_exfil.a_exfil_players )[ 0 ];
        function_7ab1f22f29a03979( s_exfil, agent, closest_player );
    }
    else
    {
        agent.s_exfil = s_exfil;
        s_exfil.var_79507aedd281f84d = arraycombineunique( s_exfil.var_79507aedd281f84d, [ agent ] );
    }
    
    agent callback::callback( "on_exfil_ai_spawned" );
}

// Namespace exfil
// Params 2
// Checksum 0x580390f9, Offset: 0xb6eb
// Size: 0x143, Type: bool
function function_2328bf7ff3278360( requestid, userdata )
{
    s_exfil = userdata;
    
    if ( getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        if ( s_exfil utility::ent_flag( "exfil_complete_timeout" ) || !s_exfil.b_exfil_started )
        {
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_764e610b8936abfa( requestid );
                function_a8c7910253bb1f28( requestid );
            }
            
            return true;
        }
        
        return false;
    }
    
    if ( function_325d6fb86c92b4b7( s_exfil ) )
    {
        function_764e610b8936abfa( requestid );
        return true;
    }
    
    var_cc6eb3f82d727a8 = function_7a4ffce9b1d0a25f( s_exfil );
    
    if ( var_cc6eb3f82d727a8 >= s_exfil.a_exfil_players.size * 0.75 || !s_exfil.b_exfil_started )
    {
        function_764e610b8936abfa( requestid );
        return true;
    }
    
    if ( isdefined( s_exfil.vh_exfil ) && s_exfil.vh_exfil utility::ent_flag( "landed" ) || s_exfil utility::ent_flag( "exfil_complete_kill_count" ) || s_exfil utility::ent_flag( "exfil_complete_timeout" ) || !s_exfil.b_exfil_started )
    {
        s_exfil.var_a5ab8da4cabaa148 = undefined;
        function_764e610b8936abfa( requestid );
        return true;
    }
    
    return false;
}

// Namespace exfil
// Params 2
// Checksum 0xdbf0f6e2, Offset: 0xb837
// Size: 0x11c, Type: bool
function function_727172fa132571db( requestid, userdata )
{
    s_exfil = userdata;
    
    if ( function_9aa9df8577941cb0() )
    {
        if ( isdefined( s_exfil.vh_exfil ) && s_exfil.vh_exfil.leaving || s_exfil utility::ent_flag( "exfil_complete_timeout" ) )
        {
            s_exfil.var_c81a58ce8a0e6720 = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_a8c7910253bb1f28( requestid );
            }
            
            return true;
        }
    }
    else
    {
        if ( function_664072bb6ca45820( s_exfil ) <= 0 )
        {
            s_exfil.var_c81a58ce8a0e6720 = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_a8c7910253bb1f28( requestid );
            }
            
            return true;
        }
        
        if ( s_exfil utility::ent_flag( "exfil_complete_kill_count" ) || s_exfil utility::ent_flag( "exfil_complete_timeout" ) || !s_exfil.b_exfil_started )
        {
            s_exfil.var_c81a58ce8a0e6720 = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_a8c7910253bb1f28( requestid );
            }
            
            return true;
        }
    }
    
    return false;
}

// Namespace exfil
// Params 2
// Checksum 0x98bca4fc, Offset: 0xb95c
// Size: 0x9a, Type: bool
function function_ac641e45d6b777af( requestid, userdata )
{
    s_exfil = userdata;
    function_f06942fe55b334a8( s_exfil, requestid );
    
    if ( getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        return !s_exfil utility::ent_flag( "exfil_complete_timeout" );
    }
    
    if ( function_664072bb6ca45820( s_exfil ) <= 0 )
    {
        return false;
    }
    
    var_cc6eb3f82d727a8 = function_7a4ffce9b1d0a25f( s_exfil );
    
    if ( var_cc6eb3f82d727a8 >= s_exfil.a_exfil_players.size * 0.5 || !s_exfil.b_exfil_started )
    {
        return false;
    }
    
    return true;
}

// Namespace exfil
// Params 2
// Checksum 0xdff22690, Offset: 0xb9ff
// Size: 0x73, Type: bool
function function_7115188ee745d86a( requestid, userdata )
{
    s_exfil = userdata;
    function_f06942fe55b334a8( s_exfil, requestid );
    
    if ( function_9aa9df8577941cb0() )
    {
        if ( gettime() - s_exfil.var_68017b70267b7bb8 > 30000 && !s_exfil.b_exfil_started )
        {
            return false;
        }
    }
    else if ( function_664072bb6ca45820( s_exfil ) <= 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace exfil
// Params 2
// Checksum 0xdf944b0e, Offset: 0xba7b
// Size: 0x177
function function_f06942fe55b334a8( s_exfil, requestid )
{
    if ( isdefined( s_exfil ) && isarray( s_exfil.var_79507aedd281f84d ) )
    {
        var_7d661e4f3393538f = 0;
        var_e0cbe19de521e663 = 0;
        s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
        
        foreach ( ai in s_exfil.var_79507aedd281f84d )
        {
            if ( isdefined( ai.aicategory ) )
            {
                switch ( ai.aicategory )
                {
                    case #"hash_8c089e813083e510":
                        var_7d661e4f3393538f++;
                        break;
                    case #"hash_7b0e2f2ed84f34":
                        var_e0cbe19de521e663++;
                        break;
                }
            }
        }
        
        if ( var_7d661e4f3393538f >= s_exfil.var_cef5eb6c7161e00 )
        {
            function_1a9d724a960fa19d( requestid, "exfil_bucket_zombie_special", 0 );
        }
        else
        {
            function_1a9d724a960fa19d( requestid, "exfil_bucket_zombie_special", 1 );
        }
        
        if ( var_e0cbe19de521e663 >= s_exfil.var_c804e2b28c4fce40 )
        {
            function_1a9d724a960fa19d( requestid, "exfil_bucket_zombie_elite", 0 );
            return;
        }
        
        function_1a9d724a960fa19d( requestid, "exfil_bucket_zombie_elite", 1 );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x606b5980, Offset: 0xbbfa
// Size: 0x94
function start_exfil_spawns_at_destination( s_exfil )
{
    s_exfil notify( #"hash_3e09930918537ad3" );
    s_exfil endon( #"hash_3e09930918537ad3" );
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    s_exfil.var_68017b70267b7bb8 = gettime();
    
    if ( function_9aa9df8577941cb0() )
    {
        s_exfil utility::ent_flag_wait( "player_reached_exfil" );
        function_6f4ed4ebe04c84d6( s_exfil );
        level thread start_exfil_defend_mode( s_exfil );
        return;
    }
    
    s_exfil utility::ent_flag_wait( "player_reached_exfil" );
    function_6f4ed4ebe04c84d6( s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0x960f32eb, Offset: 0xbc96
// Size: 0x110
function function_6f4ed4ebe04c84d6( s_exfil )
{
    if ( is_quest_exfil( s_exfil ) )
    {
        return;
    }
    
    str_encounter_bundle = undefined;
    
    if ( isdefined( level.var_e3788ed969087ff7 ) )
    {
        str_encounter_bundle = [[ level.var_e3788ed969087ff7 ]]( s_exfil, 0 );
    }
    
    if ( isdefined( str_encounter_bundle ) )
    {
        s_exfil.var_c81a58ce8a0e6720 = ai_spawn_director::spawn_request( str_encounter_bundle, s_exfil.s_exfil_destination.origin, 1500, 1, 0 );
        
        if ( isdefined( s_exfil.var_c81a58ce8a0e6720 ) )
        {
            if ( getdvarint( @"hash_faf56f135b3692d6", 0 ) )
            {
                s_exfil.var_ef0af734c85a355b = 1;
                function_1c4c7ef874191be2( s_exfil.name, s_exfil.origin, 1500, 1 );
            }
            
            ai_spawn_director::function_c99d360d62c49a9c( s_exfil.var_c81a58ce8a0e6720, &function_7115188ee745d86a, s_exfil );
            ai_spawn_director::function_71b3c575c1426546( s_exfil.var_c81a58ce8a0e6720, &function_fc75727f9e1e4bd3, s_exfil );
            ai_spawn_director::function_53289c032f506bb1( s_exfil.var_c81a58ce8a0e6720, &function_727172fa132571db, s_exfil );
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0xd8bccd1b, Offset: 0xbdae
// Size: 0xf8
function function_e950f413292ddc8d( var_6ac06bc3285f7d0b )
{
    const_n_spawn_dist = 1500;
    v_ai_spawn = self.origin;
    
    if ( self.var_3560f6b1ef954e6f )
    {
        v_ai_spawn = var_6ac06bc3285f7d0b;
    }
    else
    {
        v_mod = get_player_velocity_modifier();
        v_dir = vectornormalize( var_6ac06bc3285f7d0b - self.origin );
        v_ai_spawn = self.origin + v_dir * const_n_spawn_dist;
    }
    
    min = 0;
    max = 250;
    
    while ( true )
    {
        random_x = randomfloatrange( min, max ) * ( utility::cointoss() ? 1 : -1 );
        random_y = randomfloatrange( min, max ) * ( utility::cointoss() ? 1 : -1 );
        v_ai_spawn = getclosestpointonnavmesh( v_ai_spawn + ( random_x, random_y, 0 ) );
        
        if ( isdefined( v_ai_spawn ) )
        {
            break;
        }
        
        waitframe();
    }
    
    return v_ai_spawn;
}

// Namespace exfil
// Params 0
// Checksum 0x518be239, Offset: 0xbeaf
// Size: 0x23
function get_player_velocity_modifier()
{
    velocity = self getvelocity();
    n_weight = 7;
    return velocity * n_weight;
}

// Namespace exfil
// Params 1
// Checksum 0xb91b9fe0, Offset: 0xbedb
// Size: 0x9c
function function_7a4ffce9b1d0a25f( s_exfil )
{
    var_cc6eb3f82d727a8 = 0;
    
    foreach ( player in s_exfil.a_exfil_players )
    {
        if ( player.var_3560f6b1ef954e6f )
        {
            var_cc6eb3f82d727a8++;
        }
    }
    
    return var_cc6eb3f82d727a8;
}

// Namespace exfil
// Params 4
// Checksum 0xb5acc500, Offset: 0xbf80
// Size: 0x19e
function function_89f6921bb760337f( s_exfil, var_6ac06bc3285f7d0b, str_enemy_team, var_e8874d05e088458f )
{
    self notify( #"hash_c26c386414e7e572" );
    self endon( #"death" );
    self endon( #"hash_c26c386414e7e572" );
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    
    if ( !isdefined( self.var_79507aedd281f84d ) )
    {
        self.var_79507aedd281f84d = [];
    }
    
    self.var_79507aedd281f84d = utility::array_removedead_or_dying( self.var_79507aedd281f84d );
    
    while ( self.var_79507aedd281f84d.size < var_e8874d05e088458f )
    {
        if ( function_325d6fb86c92b4b7( s_exfil ) && function_7c921bb325ee0536( s_exfil ) >= function_664072bb6ca45820( s_exfil ) )
        {
            waitframe();
            continue;
        }
        
        v_ai_spawn = function_e950f413292ddc8d( var_6ac06bc3285f7d0b );
        
        if ( !isdefined( v_ai_spawn ) )
        {
            waitframe();
            continue;
        }
        
        aitype = undefined;
        
        if ( isdefined( level.var_9b826d9aa08bb857 ) )
        {
            aitype = [[ level.var_9b826d9aa08bb857 ]]();
        }
        else if ( getaitypecount() > 0 )
        {
            aitype = utility::array_random( getarraykeys( getaitypenames() ) );
        }
        
        aitype = getdvar( @"ai_spawnaitype", aitype );
        
        if ( !isdefined( aitype ) || aitype == "" )
        {
            println( "<dev string:x485>" );
            return;
        }
        
        agent = mp_agent::spawnnewagentaitype( aitype, v_ai_spawn, ( 0, 0, 0 ), str_enemy_team );
        
        if ( isdefined( agent ) )
        {
            function_7ab1f22f29a03979( s_exfil, agent, self );
            agent callback::callback( "on_exfil_ai_spawned" );
        }
        
        waitframe();
    }
}

// Namespace exfil
// Params 4
// Checksum 0x2a5c4798, Offset: 0xc126
// Size: 0x103
function function_7ab1f22f29a03979( s_exfil = level.s_exfil_active, ai, player, var_b6d67574188077e5 )
{
    ai.s_exfil = s_exfil;
    s_exfil.var_79507aedd281f84d[ s_exfil.var_79507aedd281f84d.size ] = ai;
    s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
    
    if ( ai function_220801213cd3f346( s_exfil ) || var_b6d67574188077e5 )
    {
        ai function_f35054d6fe1fb8e( s_exfil );
    }
    
    if ( isplayer( player ) )
    {
        if ( !isdefined( player.var_79507aedd281f84d ) )
        {
            player.var_79507aedd281f84d = [];
        }
        
        player.var_79507aedd281f84d[ player.var_79507aedd281f84d.size ] = ai;
        player.var_79507aedd281f84d = utility::array_removedead_or_dying( player.var_79507aedd281f84d );
        ai.exfil_player = player;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x8bf39e42, Offset: 0xc231
// Size: 0xbd
function function_376be1634c46bac2( s_exfil )
{
    ai_list = [];
    
    foreach ( ai in s_exfil.var_79507aedd281f84d )
    {
        if ( ( ai function_220801213cd3f346( s_exfil ) || ai.var_8fc9a42738beb960 ) && !ai.ignore_enemy_count )
        {
            ai_list[ ai_list.size ] = ai;
        }
    }
    
    return ai_list;
}

// Namespace exfil
// Params 1
// Checksum 0x1341af53, Offset: 0xc2f7
// Size: 0x30
function function_f35054d6fe1fb8e( s_exfil )
{
    if ( !self.var_8fc9a42738beb960 )
    {
        self.var_8fc9a42738beb960 = 1;
        s_exfil.var_bca9cc9d4e28fff5++;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x518ce631, Offset: 0xc32f
// Size: 0x105
function function_f910f5c95b5f9a04( s_exfil )
{
    s_exfil.kill_count_reached = 1;
    s_exfil utility::ent_flag_set( "exfil_complete_kill_count" );
    
    if ( utility::issharedfuncdefined( #"exfil", #"hash_727362151127a027" ) )
    {
        foreach ( player in s_exfil.a_exfil_players )
        {
            player utility::callsharedfunc( #"exfil", #"hash_727362151127a027", s_exfil );
        }
    }
    else
    {
        s_exfil.s_activity_instance progress_tracker_container::function_c47bfeecd65c7559( "exfil_kills_remaining", 0 );
    }
    
    level callback::callback( "on_exfil_complete_kill_count", s_exfil );
    function_aa8c7bf68451dd7b( s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0x7c1e5fb8, Offset: 0xc43c
// Size: 0x3ae
function reset_exfil( s_exfil )
{
    if ( s_exfil.b_reset_disabled )
    {
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " has resetting disabled" );
        return;
    }
    
    logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " is resetting" );
    s_exfil utility::ent_flag_clear( "exfil_complete_kill_count" );
    s_exfil utility::ent_flag_clear( "exfil_complete_timeout" );
    s_exfil utility::ent_flag_clear( "player_reached_exfil" );
    calloutmarkerping::function_ab4e5514677fba94( s_exfil.mdl_exfil );
    
    if ( isdefined( s_exfil.s_exfil_destination ) )
    {
        s_exfil.s_exfil_destination.b_exfil_started = undefined;
        s_exfil.s_exfil_destination = undefined;
    }
    
    s_exfil.a_potential_players = [];
    s_exfil.a_exfil_players = [];
    s_exfil.var_79507aedd281f84d = [];
    s_exfil.var_9af374cfc2dd171c = [];
    s_exfil.n_kills = 0;
    s_exfil.var_bca9cc9d4e28fff5 = 0;
    s_exfil.var_86828435af3dd26f = undefined;
    s_exfil.kill_count_reached = undefined;
    s_exfil.var_693d6f7949691721 = undefined;
    s_exfil.var_b09c68be26c84664 = undefined;
    s_exfil.b_exfil_started = undefined;
    function_73335ef7f523fb05( 0, s_exfil );
    
    if ( isdefined( s_exfil.mdl_exfil.interact ) )
    {
        s_exfil.mdl_exfil.interact function_c85a388074ac2fb0( 1 );
    }
    else
    {
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " interact was somehow deleted. Respawning and reenabling it" );
        exfil_spawn_interact( s_exfil );
        
        if ( !isdefined( s_exfil.mdl_exfil.interact ) )
        {
            if ( isent( s_exfil.mdl_exfil ) && !is_quest_exfil( s_exfil ) )
            {
                s_exfil.mdl_exfil.interact = interaction::register_interact( s_exfil.mdl_exfil, s_exfil.radius, &on_use_exfil_interact, level.var_cdacce741094543b ?? &"shared_hintstrings/exfil_start_use_generic" );
                s_exfil.mdl_exfil.interact sethintonobstruction( "show" );
            }
            else
            {
                s_exfil.mdl_exfil.interact = interaction::register_scriptable_interact( s_exfil.mdl_exfil, &on_use_exfil_interact );
            }
            
            s_exfil.mdl_exfil.interact interaction::function_e4a4753e6eac02d7();
        }
        
        s_exfil.mdl_exfil.interact function_c85a388074ac2fb0( 1 );
    }
    
    if ( isdefined( s_exfil.vh_exfil ) )
    {
        s_exfil notify( #"exfil_vehicle_gone" );
        self notify( #"exfil_vehicle_gone" );
        s_exfil.vh_exfil exfil_vehicle_delete( s_exfil );
    }
    
    if ( function_9aa9df8577941cb0() )
    {
        function_1cda128151c81f5( s_exfil );
        s_exfil.s_exfil_destination = utility::array_random( s_exfil.var_9af374cfc2dd171c );
        exfil_spawn_destination( s_exfil );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "smoking" );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "default_icon" );
        level thread start_exfil_spawns_at_destination( s_exfil );
        s_exfil function_ee13561bfe62be01();
    }
    
    level.var_12b4cd9ef7a86c02[ level.var_12b4cd9ef7a86c02.size ] = s_exfil;
    level callback::callback( "on_exfil_reset", s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0xc72d6325, Offset: 0xc7f2
// Size: 0x18e
function function_f8fa6a3486e9ed21( s_exfil )
{
    level endon( #"game_ended" );
    
    if ( !isdefined( s_exfil ) )
    {
        s_exfil = level.s_exfil_active;
    }
    
    if ( isarray( s_exfil.var_79507aedd281f84d ) )
    {
        s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
        
        foreach ( zombie in s_exfil.var_79507aedd281f84d )
        {
            if ( isalive( zombie ) )
            {
                zombie dodamage( zombie.health + 990, zombie.origin );
            }
        }
    }
    
    a_remaining_ai = function_54bc4b828652edac( s_exfil );
    
    foreach ( zombie in a_remaining_ai )
    {
        if ( isalive( zombie ) )
        {
            zombie dodamage( zombie.health + 990, zombie.origin );
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x9ababb30, Offset: 0xc988
// Size: 0x129
function function_24e77cd5c2b8e218( s_exfil )
{
    s_exfil endon( #"exfil_complete_timeout" );
    var_2936f60019c0bd1a = 875;
    
    if ( isdefined( s_exfil.var_3256fb27cfbaa37d ) )
    {
        var_2936f60019c0bd1a = s_exfil.var_3256fb27cfbaa37d;
    }
    
    while ( true )
    {
        if ( isdefined( s_exfil.vh_exfil ) && s_exfil.vh_exfil.leaving )
        {
            break;
        }
        
        var_3c58501802b10b4a = utility::get_array_of_closest( s_exfil.s_exfil_destination.origin, level.players, s_exfil.a_exfil_players, undefined, var_2936f60019c0bd1a );
        
        foreach ( player in var_3c58501802b10b4a )
        {
            player thread function_e20be95da96bff4f( s_exfil );
        }
        
        wait 1;
    }
}

// Namespace exfil
// Params 1
// Checksum 0xf99eb897, Offset: 0xcab9
// Size: 0x10c
function function_e20be95da96bff4f( s_exfil )
{
    self endon( #"disconnect" );
    
    if ( !isalive( self ) || self.s_exfil == s_exfil || !isdefined( s_exfil.s_activity_instance ) || self.var_b652151f6e8ea354 )
    {
        return;
    }
    
    self.var_b652151f6e8ea354 = 1;
    function_c628843257429820();
    self.s_exfil = s_exfil;
    activity_participation::function_bc67362dace4370c( s_exfil.s_activity_instance, self );
    
    if ( !s_exfil.var_b571585ab43de0b1 )
    {
        thread hud_message::showsplash( "cp_mp_exfil_inbound" );
    }
    
    callback::callback( "on_exfil_player_joined", s_exfil );
    function_4953d4926d0c96dc( s_exfil );
    thread function_694296349dc659ae( s_exfil );
    
    while ( true )
    {
        level waittill( #"exfil_time_remaining", n_time_remaining, s_exfil_time );
        
        if ( self.s_exfil == s_exfil_time )
        {
            thread exfil_timer_player_ui( n_time_remaining, s_exfil );
            self.var_b652151f6e8ea354 = undefined;
            break;
        }
    }
}

// Namespace exfil
// Params 0
// Checksum 0x3417eb05, Offset: 0xcbcd
// Size: 0x98
function function_c628843257429820()
{
    if ( isdefined( self.s_exfil.s_activity_instance ) )
    {
        var_c152bd93610ea1a = self.s_exfil;
        activity_participation::function_61aa2b2879f2c0a2( var_c152bd93610ea1a.s_activity_instance, self );
        var_c152bd93610ea1a.a_exfil_players = arrayremove( var_c152bd93610ea1a.a_exfil_players, self );
        self.s_exfil = undefined;
        self notify( #"endon_exfil_defend_mode_timer" );
        self notify( #"endon_exfil_timer_player_ui" );
        self setclientomnvar( "ui_match_start_countdown", -1 );
        self setclientomnvar( "ui_is_exfil_countdown", 0 );
    }
}

// Namespace exfil
// Params 1
// Checksum 0x435b6713, Offset: 0xcc6d
// Size: 0xb7
function function_4953d4926d0c96dc( s_exfil )
{
    n_player_count = s_exfil.a_exfil_players.size;
    
    switch ( n_player_count )
    {
        case 1:
            function_73335ef7f523fb05( 35, s_exfil );
            break;
        case 2:
            function_73335ef7f523fb05( int( 46.9 ), s_exfil );
            break;
        case 3:
            function_73335ef7f523fb05( int( 59.5 ), s_exfil );
            break;
        case 4:
        default:
            function_73335ef7f523fb05( int( 71.4 ), s_exfil );
            break;
    }
}

// Namespace exfil
// Params 1
// Checksum 0xec2b90e2, Offset: 0xcd2c
// Size: 0x1f5
function function_54bc4b828652edac( s_exfil )
{
    a_ai = getaiarray();
    var_e0059352e51fce23 = [];
    s_exfil utility::ent_flag_clear( "exfil_boss_alive" );
    
    foreach ( ai in a_ai )
    {
        if ( isalive( ai ) && ai.unittype == "zombie" && !isdefined( ai.var_bd22ba6c600a23a3 ) && ai function_220801213cd3f346( s_exfil ) && !ai.ignore_enemy_count )
        {
            var_e0059352e51fce23 = arraycombineunique( var_e0059352e51fce23, [ ai ] );
            
            if ( !isdefined( ai.s_exfil ) )
            {
                s_exfil.a_exfil_players = function_5713d46873b29625( s_exfil.a_exfil_players );
                closest_player = utility::get_array_of_closest( ai.origin, s_exfil.a_exfil_players )[ 0 ];
                function_7ab1f22f29a03979( s_exfil, ai, closest_player, 1 );
                ai callback::callback( "on_exfil_ai_spawned" );
            }
            
            if ( isdefined( ai.aicategory ) && ( ai.aicategory == "special" || ai.aicategory == "elite" || ai.aicategory == "hvt" || ai.aicategory == "boss" ) )
            {
                s_exfil utility::ent_flag_set( "exfil_boss_alive" );
            }
        }
    }
    
    s_exfil.var_79507aedd281f84d = utility::array_removedead_or_dying( s_exfil.var_79507aedd281f84d );
    return var_e0059352e51fce23;
}

// Namespace exfil
// Params 1
// Checksum 0x1b8953e9, Offset: 0xcf2a
// Size: 0x150
function function_da1a47c00c185ac2( s_exfil )
{
    s_exfil endon( #"exfil_complete_kill_count" );
    s_exfil endon( #"exfil_complete_timeout" );
    var_6682323a956dea1e = 3000;
    n_cleanup_dist_sq = 1000000;
    var_19d3292bbd9ed028 = 1;
    
    if ( !isdefined( s_exfil.n_cleanups_processed_this_frame ) )
    {
        s_exfil.n_cleanups_processed_this_frame = 0;
    }
    
    n_next_eval = 0;
    
    while ( true )
    {
        waitframe();
        n_time = gettime();
        
        if ( n_time < n_next_eval )
        {
            continue;
        }
        
        n_next_eval += var_6682323a956dea1e;
        a_ai_enemies = s_exfil.var_79507aedd281f84d;
        
        foreach ( ai_enemy in a_ai_enemies )
        {
            if ( !isalive( ai_enemy ) )
            {
                continue;
            }
            
            if ( s_exfil.n_cleanups_processed_this_frame >= var_19d3292bbd9ed028 )
            {
                s_exfil.n_cleanups_processed_this_frame = 0;
                waitframe();
            }
            
            ai_enemy do_cleanup_check( s_exfil, n_cleanup_dist_sq );
        }
    }
}

// Namespace exfil
// Params 2
// Checksum 0x88522fdc, Offset: 0xd082
// Size: 0x196
function do_cleanup_check( s_exfil, n_cleanup_dist_sq )
{
    var_204d345c9382f138 = 5000;
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( self.b_ignore_exfil_cleanup )
    {
        return;
    }
    
    if ( !isdefined( self.spawntime ) )
    {
        return;
    }
    
    n_time_alive = gettime() - self.spawntime;
    
    if ( n_time_alive < var_204d345c9382f138 )
    {
        return;
    }
    
    if ( self.var_e7c55cc6f77d9b35 )
    {
        return;
    }
    
    var_679c11a9b64e0bf8 = function_220801213cd3f346( s_exfil );
    s_exfil.n_cleanups_processed_this_frame++;
    
    if ( !var_679c11a9b64e0bf8 )
    {
        n_dist_sq_min = 10000000;
        players = s_exfil.a_exfil_players;
        e_closest_player = players[ 0 ];
        
        foreach ( player in players )
        {
            if ( !isalive( player ) || player.sessionstate == "spectator" )
            {
                continue;
            }
            
            n_dist_sq = distancesquared( self.origin, player.origin );
            
            if ( n_dist_sq < n_dist_sq_min )
            {
                n_dist_sq_min = n_dist_sq;
                e_closest_player = player;
            }
        }
        
        if ( n_dist_sq_min >= n_cleanup_dist_sq )
        {
            thread delete_zombie_noone_looking_wrapper( s_exfil );
        }
    }
}

// Namespace exfil
// Params 1
// Checksum 0x98614ebd, Offset: 0xd220
// Size: 0x2f
function delete_zombie_noone_looking_wrapper( s_exfil )
{
    self.var_e7c55cc6f77d9b35 = 1;
    delete_zombie_noone_looking( s_exfil );
    
    if ( isdefined( self ) )
    {
        self.var_e7c55cc6f77d9b35 = undefined;
    }
}

// Namespace exfil
// Params 1
// Checksum 0x167ce700, Offset: 0xd257
// Size: 0xcf
function delete_zombie_noone_looking( s_exfil )
{
    if ( self.in_the_ground )
    {
        return;
    }
    
    if ( !self.takedamage )
    {
        return;
    }
    
    foreach ( player in level.players )
    {
        if ( !isalive( player ) || player.sessionstate == "spectator" )
        {
            continue;
        }
        
        if ( utility_common::player_can_see_ai( player, self ) )
        {
            return;
        }
    }
    
    cleanup_zombie( s_exfil );
}

// Namespace exfil
// Params 1
// Checksum 0xb01891f2, Offset: 0xd32e
// Size: 0xb5
function cleanup_zombie( s_exfil )
{
    if ( !isalive( self ) )
    {
        println( "<dev string:x4b2>" );
        return;
    }
    
    /#
    #/
    
    self.b_cleaned_up = 1;
    self.var_bde88f28bc9ee20e = 1;
    self.allowdeath = 1;
    self.var_a13bed1ac47e1b2c = 1;
    self.no_powerups = 1;
    s_exfil.var_79507aedd281f84d = arrayremove( s_exfil.var_79507aedd281f84d, self );
    
    if ( self.var_8fc9a42738beb960 )
    {
        s_exfil.var_bca9cc9d4e28fff5--;
    }
    
    self kill();
    waitframe();
    
    if ( isdefined( self ) )
    {
        if ( isagent( self ) )
        {
            agent_utils::despawnagent();
            return;
        }
        
        self delete();
    }
}

// Namespace exfil
// Params 3
// Checksum 0x977e07b9, Offset: 0xd3eb
// Size: 0x6c
function function_8a8a9be80ffa5dc3( s_exfil, var_e6825e5508ff8094, b_conversation )
{
    a_players = self;
    
    if ( !isarray( a_players ) )
    {
        a_players = [ a_players ];
    }
    
    if ( b_conversation )
    {
        overlord::playconversation( var_e6825e5508ff8094, a_players );
        return;
    }
    
    utility::callsharedfunc( #"overlord", #"playevent", var_e6825e5508ff8094, a_players );
}

// Namespace exfil
// Params 2
// Checksum 0xbe0ef9cd, Offset: 0xd45f
// Size: 0x286
function exfil_disable( s_exfil, var_adff25dea87573fe )
{
    if ( !isdefined( s_exfil ) || s_exfil.b_exfil_started )
    {
        return;
    }
    
    s_exfil.b_disabled = 1;
    s_exfil notify( #"hash_3e09930918537ad3" );
    level.var_12b4cd9ef7a86c02 = arrayremove( level.var_12b4cd9ef7a86c02, s_exfil );
    
    if ( isdefined( s_exfil.mdl_exfil ) )
    {
        s_exfil.mdl_exfil notify( #"end_exfil_interact_objective_distance" );
        
        if ( isdefined( s_exfil.mdl_exfil.n_obj_id ) )
        {
            objidpoolmanager::returnobjectiveid( s_exfil.mdl_exfil.n_obj_id );
            s_exfil.mdl_exfil.n_obj_id = undefined;
        }
        
        if ( isdefined( s_exfil.mdl_exfil.interact ) )
        {
            if ( isent( s_exfil.mdl_exfil.interact ) )
            {
                if ( s_exfil.mdl_exfil.interact isusable() )
                {
                    s_exfil.mdl_exfil.interact setusableenabled( 0 );
                }
            }
            else
            {
                s_exfil.mdl_exfil.interact setscriptablepartstate( "cp_mp_exfil_icon", var_adff25dea87573fe ? "empty_icon" : "disabled_icon" );
                s_exfil.mdl_exfil.interact setscriptablepartstate( "cp_mp_exfil_site", "standby" );
                s_exfil.mdl_exfil.interact setscriptablepartstate( "cp_mp_exfil_smoke", "stop" );
            }
        }
    }
    
    if ( isdefined( s_exfil.s_exfil_destination ) && isdefined( s_exfil.s_exfil_destination.mdl_destination ) && s_exfil.mdl_exfil != s_exfil.s_exfil_destination.mdl_destination )
    {
        s_exfil.s_exfil_destination.mdl_destination setusableenabled( 0 );
        
        if ( isdefined( s_exfil.s_exfil_destination.mdl_destination.n_obj_id ) )
        {
            objidpoolmanager::returnobjectiveid( s_exfil.s_exfil_destination.mdl_destination.n_obj_id );
            s_exfil.s_exfil_destination.mdl_destination.n_obj_id = undefined;
        }
    }
}

// Namespace exfil
// Params 0
// Checksum 0x62adb4b9, Offset: 0xd6ed
// Size: 0xb
function get_all_exfils()
{
    return level.var_e584ab91aed38e8c;
}

// Namespace exfil
// Params 0
// Checksum 0x7ebfaf4c, Offset: 0xd701
// Size: 0xb
function get_enabled_exfils()
{
    return level.var_12b4cd9ef7a86c02;
}

