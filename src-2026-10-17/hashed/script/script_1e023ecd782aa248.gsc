#using script_16ea1b94f0f381b3;
#using script_4966d09e65e628d2;
#using script_4bc38131d8ecd20b;
#using script_4fa22bc28608e9bd;
#using script_7fb36ba07573578a;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\objective_marker_bundle_helper;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\ai_behavior;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\ob;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\loot\common_item;
#using scripts\mp\ob\activities\ob_activity_starter;
#using scripts\mp\ob\systems\region_difficulty_manager;
#using scripts\mp\objectives\exfil;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\overlord;
#using scripts\mp\radiation;

#namespace aether_storm;

// Namespace aether_storm
// Params 0, eflags: 0x5
// Checksum 0x12cc5471, Offset: 0x706
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"aether_storm", #"radiation", undefined, &function_2d60b4d1db2d5e1a );
}

// Namespace aether_storm
// Params 0, eflags: 0x4
// Checksum 0xb9256480, Offset: 0x72f
// Size: 0x1e
function private function_2d60b4d1db2d5e1a()
{
    set_timer_state( 4 );
    utility::flag_set( "aether_storm_post_main" );
    thread init();
}

// Namespace aether_storm
// Params 3
// Checksum 0x454223f9, Offset: 0x755
// Size: 0x8f6
function init( no_final_exfil = 0, no_timer = 0, disable_ai = 0 )
{
    if ( getdvarint( @"aether_storm_enabled", 1 ) == 0 )
    {
        return;
    }
    
    utility::flag_wait( "aether_storm_post_main" );
    level.aether_storm = spawnstruct();
    gametype_settings_bundle = ob::get_ob_settings();
    
    if ( !gametype_settings_bundle.stormenabled )
    {
        return;
    }
    
    level.aether_storm.var_274f3d593d1a5bb1 = gametype_settings_bundle.stormdifficulty.var_80317088c8931dc1;
    level.aether_storm.var_2ea7ab642429c86 = gametype_settings_bundle.stormdifficulty.var_85d9f96011992e96;
    level.aether_storm.difficulty = level.region_difficulty_manager.difficulties[ gametype_settings_bundle.stormdifficulty.var_2b82be949fd1dd22 ];
    
    if ( gametype_settings_bundle.stormdifficulty.var_2b82be949fd1dd22 <= 1 )
    {
        region_difficulty_int = region_difficulty_manager::get_region_difficulty_int( level.aether_storm.starting_origin );
        var_7f2d198890bbe51 = minint( region_difficulty_int + 1, 3 );
        level.aether_storm.difficulty = level.region_difficulty_manager.difficulties[ var_7f2d198890bbe51 ];
    }
    
    assert( isdefined( level.aether_storm.difficulty ) );
    assert( level.region_difficulty_manager.region_difficulty_to_int[ level.aether_storm.difficulty ] > 1, "<dev string:x24>" );
    level.aether_storm.var_3c34af6bdb5bdfa5 = gametype_settings_bundle.stormdifficulty.var_c9f3335f492c16c1;
    level.aether_storm.var_c61f7b342a182d27 = gametype_settings_bundle.stormdifficulty.var_be52f36a5b4606e1;
    level.aether_storm.var_86371fde5552d1ae = gametype_settings_bundle.stormdifficulty.var_880498bd83468624;
    level.aether_storm.agent_damage_percent = gametype_settings_bundle.stormdifficulty.var_321f87a49aa2f9f7;
    level.aether_storm.agent_damage_cooldown = gametype_settings_bundle.stormdifficulty.var_d7fb11e9d99273dc;
    level.aether_storm.damage_initial = gametype_settings_bundle.stormdifficulty.initialdamage;
    level.aether_storm.damage_expansion = gametype_settings_bundle.stormdifficulty.expansiondamage;
    level.aether_storm.var_4174d31098d8b9f8 = gametype_settings_bundle.stormdifficulty.damagerate;
    
    if ( level.aether_storm.var_3c34af6bdb5bdfa5 == 0 )
    {
        assertmsg( "<dev string:xb7>" );
        level.aether_storm.var_3c34af6bdb5bdfa5 = 2;
    }
    
    if ( isdvardefined( @"aether_storm_starting_origin" ) )
    {
        level.aether_storm.starting_origin = getdvarvector( @"aether_storm_starting_origin" );
    }
    else
    {
        start_points = utility::getstructarray( "aether_storm_spawnpoint", "targetname" );
        
        if ( start_points.size > 0 )
        {
            level.aether_storm.starting_origin = start_points[ randomint( start_points.size ) ].origin;
        }
        else
        {
            assertmsg( "<dev string:xfc>" );
            level.aether_storm.starting_origin = ( 0, 0, 0 );
        }
    }
    
    assert( isdefined( level.aether_storm.starting_origin ) );
    level.aether_storm.spawn_delay = gametype_settings_bundle.var_a2005fee22d1bf85;
    level.aether_storm.starting_radius = gametype_settings_bundle.var_6cfa65bebba1b4c3;
    level.aether_storm.quest_circle = gametype_settings_bundle.var_d15fa07a6778c68d;
    level.aether_storm.expansion_radius = gametype_settings_bundle.var_54880b13fbf00696;
    level.aether_storm.expansion_duration_seconds = gametype_settings_bundle.var_be20ba2077403710;
    
    if ( level.aether_storm.expansion_duration_seconds == 0 )
    {
        assertmsg( "<dev string:x157>" );
        level.aether_storm.expansion_duration_seconds = 900;
    }
    
    if ( getdvarint( @"scr_ob_exfil_door", 0 ) > 0 && gametype_settings_bundle.var_68f47f41496ec473 )
    {
        level.aether_storm.var_ea5a8dfab8f1969f = 1;
    }
    else if ( getdvarint( @"scr_ob_exfil_door", 0 ) == 0 && !gametype_settings_bundle.var_68f47f41496ec473 )
    {
        level.aether_storm.var_ea5a8dfab8f1969f = 0;
    }
    else
    {
        assertmsg( "<dev string:x1c0>" );
        return;
    }
    
    level.aether_storm.final_exfil_disabled = no_final_exfil;
    level.aether_storm.final_exfil_duration = gametype_settings_bundle.var_63842b82961ccc33;
    level.aether_storm.lightning_strikes_enabled = gametype_settings_bundle.stormlightning.enabled;
    level.aether_storm.var_1daade908d378f41 = gametype_settings_bundle.stormlightning.var_d16ac2e699da9d6e;
    level.aether_storm.var_500a3fef3609d40f = gametype_settings_bundle.stormlightning.var_55c323b304ed09c3;
    level.aether_storm.var_698f1f09d025887d = gametype_settings_bundle.stormlightning.var_e40ccf24eb650c26;
    level.aether_storm.var_980578ab8a358206 = gametype_settings_bundle.stormlightning.var_db57fe850bb00931;
    level.aether_storm.lightning_strikes_damage = gametype_settings_bundle.stormlightning.damage;
    level.aether_storm.lightning_strikes_damage_radius = gametype_settings_bundle.stormlightning.damageradius;
    level.aether_storm.lightning_strikes_stun_duration = gametype_settings_bundle.stormlightning.stunduration;
    level.aether_storm.var_f177d74dbe25bf6a = gametype_settings_bundle.stormlightning.objectivemarkerfadestart;
    level.aether_storm.var_54faf6e6698ab79d = gametype_settings_bundle.stormlightning.var_40d6daebb7460eca;
    level.aether_storm.var_a3a6e163b64f9ce8 = gametype_settings_bundle.stormcaller.enabled;
    level.aether_storm.var_5a02d7948055f06 = gametype_settings_bundle.stormcaller.participationdamage;
    level.aether_storm.show_timer_delay = getdvarfloat( @"hash_2f9db323da7ff325", 0 );
    level.aether_storm.timer_disabled = no_timer;
    level.ontimelimit = &start_expansion;
    utility::registersharedfunc( #"exfil", #"hash_4b0ec51fa4b05300", &function_f368c65468c4bed1 );
    utility::registersharedfunc( #"exfil", #"hash_5e7a1f9e07bb1d56", &select_final_exfil );
    utility::registersharedfunc( #"aether storm", #"expansionstarted", &expansion_started );
    utility::registersharedfunc( #"aether storm", #"startexpansion", &start_expansion );
    utility::registersharedfunc( #"aether storm", #"agentsupdate", &function_7949f90115588fab );
    utility::registersharedfunc( #"aether storm", #"hash_b8c6224f358331f5", &function_cec01c2c2cdc82f5 );
    callback::add( "aether_storm_expansion_started", &function_ae040278e8960fdb );
    
    if ( !no_final_exfil )
    {
        callback::add( #"hash_5848300c673f351a", &function_5d7a55b875c456a2 );
    }
    
    thread function_be68af46b0f9ed4( disable_ai );
    
    /#
        thread _debug_init();
    #/
    
    utility::flag_set( "aether_storm_initialized" );
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0x3dffeb82, Offset: 0x1053
// Size: 0x29
function private function_be68af46b0f9ed4( disable_ai )
{
    wait level.aether_storm.spawn_delay;
    create_storm( disable_ai );
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0xfd679efc, Offset: 0x1084
// Size: 0x140
function private create_storm( disable_ai )
{
    if ( isdefined( level.aether_storm.radiation ) )
    {
        return;
    }
    
    level.aether_storm.radiation = radiation::create( level.aether_storm.starting_origin, level.aether_storm.starting_radius, level.aether_storm.var_4174d31098d8b9f8, level.aether_storm.quest_circle, 1 );
    level.aether_storm.radiation radiation::set_damage( level.aether_storm.damage_initial );
    level.aether_storm.radiation callback::add( "player_entered_radiation", &on_player_enter_aether_storm );
    level.aether_storm.radiation callback::add( "player_exited_radiation", &on_player_exit_aether_storm );
    level callback::add( #"player_death", &on_player_death_aether_storm );
    
    if ( !disable_ai )
    {
        thread spawn_floodfill();
        thread spawn_stormcaller();
    }
    
    thread function_bd19c7666bbb8b2d();
    thread function_7949f90115588fab();
    thread function_cec01c2c2cdc82f5();
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0xb8db7624, Offset: 0x11cc
// Size: 0x126
function private function_5d7a55b875c456a2( params )
{
    if ( level.exfilspawnpoints.size == 0 )
    {
        assertmsg( "<dev string:x24e>" );
        return;
    }
    
    level.aether_storm.final_exfil = sortbydistance( level.exfilspawnpoints, level.aether_storm.starting_origin )[ level.exfilspawnpoints.size - 1 ];
    level.exfilspawnpoints = arrayremove( level.exfilspawnpoints, level.aether_storm.final_exfil );
    radius_delta = distance2d( level.aether_storm.final_exfil.origin, level.aether_storm.starting_origin ) - level.aether_storm.starting_radius;
    level.aether_storm.var_daf65605507e6f78 = level.aether_storm.expansion_radius / radius_delta / level.aether_storm.expansion_duration_seconds;
}

// Namespace aether_storm
// Params 0
// Checksum 0x3b6f1485, Offset: 0x12fa
// Size: 0x2d, Type: bool
function expansion_started()
{
    return isdefined( level.aether_storm.radiation ) && level.aether_storm.expansion_started;
}

// Namespace aether_storm
// Params 0
// Checksum 0x1fe0bceb, Offset: 0x1330
// Size: 0x25e
function start_expansion()
{
    if ( level.aether_storm.expansion_started || !isdefined( level.aether_storm.radiation ) || getdvarint( @"hash_d255f69a6c34b1ac", 0 ) )
    {
        return;
    }
    
    if ( !isdefined( level.aether_storm.var_daf65605507e6f78 ) )
    {
        if ( !level.aether_storm.final_exfil_disabled )
        {
            assertmsg( "<dev string:x2a5>" );
        }
        
        level.aether_storm.var_daf65605507e6f78 = level.aether_storm.expansion_duration_seconds;
    }
    
    level.aether_storm.expansion_started = 1;
    level.aether_storm.radiation callback::add( "radiation_transform_update", &function_46317bed7f18df71 );
    level.aether_storm.radiation callback::add( "radiation_transform_completed", &function_269a7ae8f88813b );
    level.aether_storm.radiation radiation::transform( level.aether_storm.starting_origin, level.aether_storm.expansion_radius, level.aether_storm.var_daf65605507e6f78 );
    level.aether_storm.radiation radiation::set_damage( level.aether_storm.damage_expansion );
    level callback::callback( "aether_storm_expansion_started" );
    utility::flag_set( "aether_storm_expansion_started" );
    all_exfils = exfil::get_all_exfils();
    
    foreach ( exfil in all_exfils )
    {
        exfil.var_7d45d2a1e824842 = "aether_storm_exfil_called_acknowledged";
    }
    
    setomnvar( "ui_dmz_radiation_spreading", 1 );
    set_timer_time( level.aether_storm.expansion_duration_seconds );
    set_timer_state( 9 );
    begin_final_exfil();
}

// Namespace aether_storm
// Params 1
// Checksum 0x2086bbe6, Offset: 0x1596
// Size: 0x3f7
function function_46317bed7f18df71( params )
{
    if ( isdefined( level.aether_storm.update_waiting ) )
    {
        return;
    }
    
    level.aether_storm.update_waiting = 1;
    wait 0.5;
    level.aether_storm.update_waiting = undefined;
    
    if ( isdefined( level.var_e607236b193eb0c1 ) && isdefined( level.var_e607236b193eb0c1.var_9433e6119f67c877 ) )
    {
        i = 0;
        
        while ( i < level.var_e607236b193eb0c1.var_9433e6119f67c877.size )
        {
            activity_starter = level.var_e607236b193eb0c1.var_9433e6119f67c877[ i ];
            
            if ( isdefined( activity_starter ) && radiation::is_position_inside( activity_starter.origin ) )
            {
                activity_starter.var_4d30a4ab99bcbf83 = undefined;
                activity_starter ob_activity_starter::hide_activity_starter();
            }
            
            i += 1;
        }
    }
    
    if ( !level.aether_storm.var_351c57a8c6bbe977 && !level.aether_storm.final_exfil_disabled )
    {
        if ( level.aether_storm.var_ea5a8dfab8f1969f )
        {
            var_676d82ee60430bba = 0;
            active_doors = arraycopy( level.exfildoors.activedoors );
            
            foreach ( door in active_doors )
            {
                if ( !radiation::is_position_inside( door.origin ) || door.location == level.aether_storm.final_exfil )
                {
                    continue;
                }
                
                if ( door.nearbyplayers.size == 0 )
                {
                    door.state = "closed";
                    door notify( #"exfil_captured" );
                    door notify( #"closed" );
                    door thread ob_exfil_door::function_ae42eb835f799e63();
                    continue;
                }
                
                var_676d82ee60430bba++;
            }
            
            remaining_exfils = [];
            
            foreach ( point in level.exfilspawnpoints )
            {
                if ( !radiation::is_position_inside( point.origin ) )
                {
                    remaining_exfils[ remaining_exfils.size ] = point;
                }
            }
            
            level.exfilspawnpoints = remaining_exfils;
            return;
        }
        
        all_exfils = exfil::get_all_exfils();
        var_6ce933c4b8597924 = 0;
        
        foreach ( exfil in all_exfils )
        {
            if ( exfil == level.aether_storm.final_exfil )
            {
                continue;
            }
            
            if ( radiation::is_position_inside( exfil.origin ) )
            {
                exfil.b_reset_disabled = 1;
                
                if ( !exfil.b_disabled )
                {
                    exfil::exfil_disable( exfil );
                }
                
                continue;
            }
            
            if ( !exfil.b_disabled )
            {
                var_6ce933c4b8597924 += 1;
            }
        }
        
        if ( var_6ce933c4b8597924 == 0 )
        {
            thread begin_final_exfil();
        }
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0xacd8b954, Offset: 0x1995
// Size: 0xa4
function function_269a7ae8f88813b( params )
{
    if ( level.aether_storm.final_exfil_disabled )
    {
        wait 5;
    }
    
    if ( !level.aether_storm.var_351c57a8c6bbe977 )
    {
        wait 60;
        
        if ( level.aether_storm.var_351c57a8c6bbe977 )
        {
            return;
        }
        
        assertmsg( "<dev string:x2f5>" );
    }
    else
    {
        level.aether_storm.final_exfil endon( #"exfil_complete_timeout" );
        wait 180;
        assertmsg( "<dev string:x374>" );
    }
    
    finish_final_exfil();
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0xbdd71ce5, Offset: 0x1a41
// Size: 0x17c
function private function_f368c65468c4bed1( heli )
{
    if ( expansion_started() )
    {
        var_3a8ae6b203a03334 = getscriptbundle( %"itemspawnentry:ob_jup_item_gasmask" );
        
        if ( !isdefined( var_3a8ae6b203a03334 ) )
        {
            assertmsg( "<dev string:x3f6>" + getxhashsourcename( %"itemspawnentry:ob_jup_item_gasmask" ) + "<dev string:x43f>" );
            return;
        }
        
        gasmaskangles = heli.angles + ( 0, 90, 0 );
        gasmaskoffsets = [ ( 33, 40, -198 ), ( -15, 40, -198 ), ( -58, 40, -198 ), ( -105, 40, -198 ) ];
        
        foreach ( offset in gasmaskoffsets )
        {
            gasmaskorigin = heli.origin + rotatevector( offset, heli.angles );
            gasmask = common_item::function_a87dc047f584d2c7( var_3a8ae6b203a03334, gasmaskorigin, gasmaskangles, 1, 1 );
            thread function_187553fed3a656d0( heli, gasmask );
        }
    }
}

// Namespace aether_storm
// Params 2, eflags: 0x4
// Checksum 0x91e3566f, Offset: 0x1bc5
// Size: 0x39
function private function_187553fed3a656d0( heli, gasmask )
{
    gasmask endon( #"death" );
    heli waittill( #"exfil_vehicle_gone" );
    common_item::function_869d7676e359a627( gasmask );
}

// Namespace aether_storm
// Params 0
// Checksum 0x80a4ab71, Offset: 0x1c06
// Size: 0x18a
function select_final_exfil()
{
    if ( level.var_e584ab91aed38e8c.size == 0 )
    {
        assertmsg( "<dev string:x24e>" );
        return;
    }
    
    level.aether_storm.final_exfil = sortbydistance( level.var_e584ab91aed38e8c, level.aether_storm.starting_origin )[ level.var_e584ab91aed38e8c.size - 1 ];
    
    if ( !isdefined( level.aether_storm.final_exfil ) )
    {
        assertmsg( "<dev string:x459>" );
        level.aether_storm.final_exfil = { #origin:( 50000, 50000, 0 ) };
    }
    
    namespace_9085ae059032a84f::function_74af1ab4059e3c06( "exfil_final_activity_ob_definition", "FINAL_EXFIL_OB" );
    level.aether_storm.final_exfil.var_b0a60f3dd6dac61a = "FINAL_EXFIL_OB";
    radius_delta = distance2d( level.aether_storm.final_exfil.origin, level.aether_storm.starting_origin ) - level.aether_storm.starting_radius;
    level.aether_storm.var_daf65605507e6f78 = level.aether_storm.expansion_radius / radius_delta / level.aether_storm.expansion_duration_seconds;
    return level.aether_storm.final_exfil;
}

// Namespace aether_storm
// Params 0
// Checksum 0x868e2e30, Offset: 0x1d99
// Size: 0xb5
function function_c96abd706dfb8ce()
{
    hud_util::showsplashtoall( #"ob_door_final_escape" );
    wait 5;
    var_f39159ba1f19d9e8 = level.exfildoors.activedoors.size;
    thread ob_exfil_door::spawnexfildoor( level.aether_storm.final_exfil, 1 );
    
    while ( level.exfildoors.activedoors.size == var_f39159ba1f19d9e8 )
    {
        waitframe();
    }
    
    final_exfil_door = level.exfildoors.activedoors[ level.exfildoors.activedoors.size - 1 ];
    final_exfil_door waittill( #"closed" );
}

// Namespace aether_storm
// Params 0
// Checksum 0x65072aae, Offset: 0x1e56
// Size: 0x7ec
function function_707078bea073404b()
{
    level.aether_storm.final_exfil.mdl_exfil = spawnscriptable( "cp_mp_exfil_site_entityless", level.aether_storm.final_exfil.origin, level.aether_storm.final_exfil.angles );
    level.aether_storm.final_exfil.mdl_exfil setscriptablepartstate( "cp_mp_exfil_site", "standby" );
    level.aether_storm.final_exfil.mdl_exfil.n_obj_id = objidpoolmanager::requestobjectiveid( 1 );
    objidpoolmanager::objective_add_objective( level.aether_storm.final_exfil.mdl_exfil.n_obj_id, "invisible", level.aether_storm.final_exfil.mdl_exfil.origin, "ui_icon_hud_exfil_chopper", "icon_regular" );
    objective_state( level.aether_storm.final_exfil.mdl_exfil.n_obj_id, "current" );
    objective_setlabel( level.aether_storm.final_exfil.mdl_exfil.n_obj_id, &"jup_ob/final_exfil" );
    objective_setplayintro( level.aether_storm.final_exfil.mdl_exfil.n_obj_id, 1 );
    
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && !player exfil::function_fc901adb1952a733() )
        {
            objective_addclienttomask( level.aether_storm.final_exfil.mdl_exfil.n_obj_id, player );
        }
    }
    
    objective_showtoplayersinmask( level.aether_storm.final_exfil.mdl_exfil.n_obj_id );
    thread overlord::playevent( "aether_storm_final_exfil_revealed", level.players, 0, 1 );
    exfil_start_delay = ( level.aether_storm.timer_finish_time - gettime() ) / 1000;
    exfil_start_delay -= level.aether_storm.final_exfil_duration;
    exfil_start_delay -= getdvarint( @"hash_eb873c5e99093d11", 50 );
    exfil_start_delay -= getdvarint( @"hash_346baccb7a031727", 7 );
    
    if ( exfil_start_delay > 0 )
    {
        /#
            level.aether_storm.var_5ba0271cb5405b06 = 1;
        #/
        
        level utility::waittill_notify_or_timeout( "aether_storm_force_start_final_exfil", exfil_start_delay );
        
        /#
            level.aether_storm.var_5ba0271cb5405b06 = 0;
        #/
    }
    
    level.aether_storm.final_exfil.b_disabled = undefined;
    level.aether_storm.final_exfil.var_dd15ab1f1e29e875 = 1;
    level.aether_storm.final_exfil.var_a3762004625747f8 = level.aether_storm.final_exfil_duration;
    level.aether_storm.final_exfil.var_ad0db8ace639b9b6 = min( 80, level.aether_storm.final_exfil_duration );
    level.aether_storm.final_exfil.var_98b77b5122d0fb93 = 1;
    level.aether_storm.final_exfil.var_b571585ab43de0b1 = 1;
    level.aether_storm.final_exfil.var_55fa9c1357e6134b = 1;
    level.aether_storm.final_exfil.var_9ed2304bd5fb8457 = 1;
    level.aether_storm.final_exfil.var_1469030464b194a6 = "dmzwhite";
    level.aether_storm.final_exfil.var_7d45d2a1e824842 = "aether_storm_exfil_called_acknowledged";
    level.aether_storm.final_exfil.var_8760cc6fcd476652 = "aether_storm_final_exfil_leaving";
    level.aether_storm.final_exfil.var_5cb3a4fb6e8938c3 = &function_cbe4a896ad5ca7ad;
    exfil::exfil_start_communal( level.aether_storm.final_exfil, level.aether_storm.final_exfil_duration );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &function_e4bdf8a427fa9852, "REV_OB_EXFIL" );
    activity_common::function_2dd4f07fa5c3e911( "ActivityEnd", &function_e4bdf8a427fa9852, "REV_OB_EXFIL" );
    
    foreach ( player in level.players )
    {
        player thread hud_message::showsplash( "aether_storm_final_exfil_inbound", undefined, undefined, undefined, 1, "splash_list_jup_ob" );
    }
    
    while ( true )
    {
        level waittill( #"exfil_time_remaining", time_remaining, exfil );
        
        if ( exfil != level.aether_storm.final_exfil )
        {
            continue;
        }
        
        if ( time_remaining <= 60 )
        {
            thread overlord::playevent( "aether_storm_final_exfil_warning", level.players, 0, 1 );
            break;
        }
    }
    
    if ( !level.aether_storm.final_exfil utility::ent_flag( "exfil_complete_timeout" ) )
    {
        level.aether_storm.final_exfil utility::waittill_any( "exfil_complete_timeout", "exfil_players_dead" );
    }
    
    objidpoolmanager::returnobjectiveid( level.aether_storm.final_exfil.mdl_exfil.n_obj_id );
    level.aether_storm.final_exfil.mdl_exfil.n_obj_id = undefined;
    level.aether_storm.final_exfil utility::waittill_notify_or_timeout( "exfil_vehicle_gone", getdvarfloat( @"hash_98a99c8faf0974fd", 20 ) );
    var_15cdd4b1fc49890c = 1;
    
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) || player.sessionstate != "playing" )
        {
            continue;
        }
        
        if ( !player.b_completed_exfil && !player.var_22bd8935826c4bc5 )
        {
            var_15cdd4b1fc49890c = 0;
            break;
        }
    }
    
    thread overlord::playconversation( var_15cdd4b1fc49890c ? "aether_storm_final_exfil_success" : "aether_storm_final_exfil_missing", level.players );
}

// Namespace aether_storm
// Params 0
// Checksum 0xc437315c, Offset: 0x264a
// Size: 0xd9
function begin_final_exfil()
{
    if ( level.aether_storm.final_exfil_disabled )
    {
        return;
    }
    
    if ( !isdefined( level.aether_storm.final_exfil ) )
    {
        assertmsg( "<dev string:x4c2>" );
        delay = ( level.aether_storm.timer_finish_time - gettime() ) / 1000;
        
        if ( delay > 0 )
        {
            wait delay;
        }
        
        finish_final_exfil();
        return;
    }
    
    if ( level.aether_storm.var_351c57a8c6bbe977 )
    {
        return;
    }
    
    level.aether_storm.var_351c57a8c6bbe977 = 1;
    
    if ( level.aether_storm.var_ea5a8dfab8f1969f )
    {
        function_c96abd706dfb8ce();
    }
    else
    {
        function_707078bea073404b();
    }
    
    wait 5;
    thread finish_final_exfil();
}

// Namespace aether_storm
// Params 1
// Checksum 0x6da3fbcf, Offset: 0x272b
// Size: 0x61
function function_cbe4a896ad5ca7ad( s_exfil )
{
    exfil_duration = max( 0, ( level.aether_storm.timer_finish_time - gettime() ) / 1000 );
    level.aether_storm.final_exfil.var_ad0db8ace639b9b6 = min( 80, exfil_duration );
    return exfil_duration;
}

// Namespace aether_storm
// Params 1
// Checksum 0xaaec609b, Offset: 0x2795
// Size: 0xc9
function function_e4bdf8a427fa9852( info_struct )
{
    waitframe();
    
    foreach ( player in info_struct.playerlist )
    {
        if ( isalive( player ) && player.sessionstate == "playing" && !player.b_completed_exfil )
        {
            player exfil::function_e20be95da96bff4f( level.aether_storm.final_exfil );
        }
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0xb118a4d0, Offset: 0x2866
// Size: 0x103
function finish_final_exfil( params )
{
    foreach ( player in level.players )
    {
        if ( isdefined( player ) && !player.b_completed_exfil )
        {
            player thread ob::function_daeaf0f2a453b0fb();
            
            if ( isalive( player ) && player.sessionstate == "playing" )
            {
                player kill();
            }
        }
    }
    
    if ( !level.gameended )
    {
        wait 25;
        level notify( #"game_ended_aether_storm" );
        level thread gamelogic_mp::endgame( "none", game[ "end_reason" ][ "time_limit_reached" ], game[ "end_reason" ][ "time_limit_reached" ] );
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0x1b571f69, Offset: 0x2971
// Size: 0x18
function set_timer_state( state )
{
    setomnvar( "ui_br_circle_state", state );
}

// Namespace aether_storm
// Params 1
// Checksum 0xee22e92c, Offset: 0x2991
// Size: 0x4c
function set_timer_time( seconds )
{
    level.aether_storm.timer_finish_time = gettime() + int( seconds * 1000 );
    setomnvar( "ui_ob_match_timer", level.aether_storm.timer_finish_time );
}

// Namespace aether_storm
// Params 0, eflags: 0x4
// Checksum 0xe404e6ed, Offset: 0x29e5
// Size: 0x99
function private function_bd19c7666bbb8b2d()
{
    if ( level.aether_storm.timer_disabled )
    {
        return;
    }
    
    while ( !flags::gameflagexists( "prematch_done" ) )
    {
        waitframe();
    }
    
    flags::gameflagwait( "prematch_done" );
    level.aether_storm.prematch_done_time = gettime();
    
    /#
        childthread function_f156c6c3802d187();
    #/
    
    if ( level.aether_storm.show_timer_delay > 0 )
    {
        wait level.aether_storm.show_timer_delay;
    }
    
    if ( !expansion_started() )
    {
        set_timer_state( 5 );
    }
}

/#

    // Namespace aether_storm
    // Params 0, eflags: 0x4
    // Checksum 0x5b363988, Offset: 0x2a86
    // Size: 0x6d, Type: dev
    function private function_f156c6c3802d187()
    {
        level endon( #"game_ended_aether_storm" );
        
        while ( true )
        {
            level waittill( #"update_timelimit" );
            
            if ( expansion_started() )
            {
                break;
            }
            
            if ( gettime() >= level.aether_storm.prematch_done_time + level.aether_storm.show_timer_delay )
            {
                set_timer_state( 9 );
                break;
            }
        }
    }

#/

// Namespace aether_storm
// Params 0
// Checksum 0x53a02658, Offset: 0x2afb
// Size: 0x97
function spawn_floodfill()
{
    if ( !level.aether_storm.var_c61f7b342a182d27 )
    {
        return;
    }
    
    utility::flag_wait( "ai_spawn_director_initialized" );
    requestid = ai_spawn_director::spawn_request( %"hash_9e0bbb938665af4", level.aether_storm.starting_origin, level.aether_storm.starting_radius, 1, 1, 1 );
    function_1a9d724a960fa19d( requestid, level.aether_storm.difficulty, 1 );
    ai_spawn_director::function_53289c032f506bb1( requestid, &function_6443e07f30843559 );
}

// Namespace aether_storm
// Params 4, eflags: 0x4
// Checksum 0x2afd7199, Offset: 0x2b9a
// Size: 0x2d, Type: bool
function private function_6443e07f30843559( requestid, instance, agent, ai_data )
{
    return expansion_started();
}

// Namespace aether_storm
// Params 0
// Checksum 0xe654e764, Offset: 0x2bd0
// Size: 0x22a
function spawn_stormcaller()
{
    if ( !level.aether_storm.var_a3a6e163b64f9ce8 )
    {
        return;
    }
    
    utility::flag_wait( "ai_spawn_director_initialized" );
    spawnpoint = getclosestpointonnavmesh( level.aether_storm.starting_origin );
    var_5fb499fde19fe768 = namespace_9d8e359c3b1041e5::get_aitype_by_subclass_sharedfunc( "zombie_disciple_hvt_stormcaller" );
    
    while ( !isdefined( level.aether_storm.stormcaller ) )
    {
        wait 1;
        level.aether_storm.stormcaller = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( var_5fb499fde19fe768[ 0 ], spawnpoint, ( 0, 0, 0 ), "team_two_hundred" );
    }
    
    level.aether_storm.stormcaller_participants = [];
    level.aether_storm.stormcaller._blackboard.zombiewanderorigin = spawnpoint;
    difficulty = getdvar( @"hash_a80863b2558da960", level.aether_storm.difficulty );
    level.aether_storm.stormcaller region_difficulty_manager::function_410b4f83b0a5b98( difficulty );
    level.aether_storm.stormcaller callback::add( "on_zombie_ai_damaged", &function_d211080e31c898a3 );
    level.aether_storm.stormcaller callback::add( "on_zombie_ai_killed", &function_13111534742c8d45 );
    thread function_a847b6207c63a0a2();
    level utility::flag_set( "aether_storm_stormcaller_spawned" );
    level.aether_storm.stormcaller_encounter = ai_spawn_director::spawn_request( %"hash_142f7ced2439e733", level.aether_storm.starting_origin, level.aether_storm.starting_radius, 1, 1 );
    function_1a9d724a960fa19d( level.aether_storm.stormcaller_encounter, level.aether_storm.difficulty, 1 );
    ai_spawn_director::function_71b3c575c1426546( level.aether_storm.stormcaller_encounter, &function_1cf2c07b0b13dd0d );
}

// Namespace aether_storm
// Params 4, eflags: 0x4
// Checksum 0xd843a1ad, Offset: 0x2e02
// Size: 0x7e
function private function_1cf2c07b0b13dd0d( requestid, instance, agent, ai_data )
{
    waitframe();
    level utility::flag_wait( "aether_storm_stormcaller_spawned" );
    agent region_difficulty_manager::function_410b4f83b0a5b98( level.aether_storm.difficulty );
    
    if ( !agent utility::ent_flag( "disciple_bound" ) )
    {
        level.aether_storm.stormcaller namespace_d4e7a14ee55bd048::function_bed09be6d0f32085( agent );
    }
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0xc209696f, Offset: 0x2e88
// Size: 0x80
function private function_d211080e31c898a3( params )
{
    if ( isplayer( params.eattacker ) && isdefined( params.idamage ) && params.idamage >= level.aether_storm.var_5a02d7948055f06 )
    {
        level.aether_storm.stormcaller_participants[ params.eattacker getentitynumber() ] = params.eattacker;
    }
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0xe1ddab3b, Offset: 0x2f10
// Size: 0x22a
function private function_13111534742c8d45( params )
{
    if ( !isdefined( params.smeansofdeath ) || params.smeansofdeath == "MOD_SUICIDE" )
    {
        spawnpoint = getclosestpointonnavmesh( level.aether_storm.starting_origin );
        var_5fb499fde19fe768 = namespace_9d8e359c3b1041e5::get_aitype_by_subclass_sharedfunc( "zombie_disciple_hvt_stormcaller" );
        level.aether_storm.stormcaller = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( var_5fb499fde19fe768[ 0 ], spawnpoint, ( 0, 0, 0 ), "team_two_hundred" );
        level.aether_storm.stormcaller._blackboard.zombiewanderorigin = spawnpoint;
        level.aether_storm.stormcaller region_difficulty_manager::function_410b4f83b0a5b98( getdvar( @"hash_a80863b2558da960", level.aether_storm.difficulty ) );
        level.aether_storm.stormcaller callback::add( "on_zombie_ai_damaged", &function_d211080e31c898a3 );
        level.aether_storm.stormcaller callback::add( "on_zombie_ai_killed", &function_13111534742c8d45 );
        return;
    }
    
    ai_spawn_director::cancel_spawn_request( level.aether_storm.stormcaller_encounter );
    
    foreach ( player in level.aether_storm.stormcaller_participants )
    {
        player thread hud_message::showsplash( "aether_storm_stormcaller_eliminated", undefined, undefined, undefined, 1, "splash_list_jup_ob" );
    }
    
    level.aether_storm.stormcaller_encounter = undefined;
    level.aether_storm.stormcaller_participants = undefined;
    level.aether_storm.stormcaller = undefined;
}

// Namespace aether_storm
// Params 0, eflags: 0x4
// Checksum 0xf4e72668, Offset: 0x3142
// Size: 0x1ba
function private function_a847b6207c63a0a2()
{
    level endon( #"aether_storm_expansion_started" );
    
    while ( isdefined( level.aether_storm.stormcaller ) )
    {
        if ( distance2dsquared( level.aether_storm.stormcaller.origin, level.aether_storm.radiation.origin ) > level.aether_storm.radiation.radiussq * 1.5 )
        {
            wait 10;
            
            if ( isdefined( level.aether_storm.stormcaller ) && distance2dsquared( level.aether_storm.stormcaller.origin, level.aether_storm.radiation.origin ) > level.aether_storm.radiation.radiussq * 1.5 )
            {
                restore_health = level.aether_storm.stormcaller.health;
                level.aether_storm.stormcaller kill( level.aether_storm.stormcaller.origin, level.aether_storm.stormcaller, level.aether_storm.stormcaller, "MOD_SUICIDE" );
                waitframe();
                level.aether_storm.stormcaller.health = restore_health;
            }
        }
        
        wait 5;
    }
}

// Namespace aether_storm
// Params 1, eflags: 0x4
// Checksum 0x1fa1954f, Offset: 0x3304
// Size: 0x14a
function private function_ae040278e8960fdb( params )
{
    while ( true )
    {
        if ( !isdefined( level.aether_storm.stormcaller ) )
        {
            return;
        }
        
        tether_origin = level.aether_storm.stormcaller.origin;
        between_vector = ( level.aether_storm.radiation.origin[ 0 ], level.aether_storm.radiation.origin[ 1 ], 0 ) - ( tether_origin[ 0 ], tether_origin[ 1 ], 0 );
        distance_between = length( between_vector );
        var_6e36a1d6cbc59f3b = distance_between + level.aether_storm.starting_radius - level.aether_storm.radiation.radius;
        
        if ( var_6e36a1d6cbc59f3b > 0 )
        {
            push_direction = between_vector / distance_between;
            tether_origin = getclosestpointonnavmesh( tether_origin + var_6e36a1d6cbc59f3b * push_direction );
        }
        
        level.aether_storm.stormcaller._blackboard.zombiewanderorigin = tether_origin;
        wait 5;
    }
}

// Namespace aether_storm
// Params 0
// Checksum 0xd6815799, Offset: 0x3456
// Size: 0x55c
function function_7949f90115588fab()
{
    level endon( #"game_ended" );
    level.aether_storm.radiation endon( #"radiation_destroyed" );
    updated_counter = 0;
    nearby_agents = [];
    flee_point = undefined;
    var_2a669c0765836c0e = undefined;
    var_b5220ce1d7cce472 = undefined;
    
    while ( level.aether_storm.radiation.active )
    {
        nearby_agents = getaiarrayinradius( level.aether_storm.radiation.origin, level.aether_storm.radiation.radius * 1.25, "all" );
        
        foreach ( agent in nearby_agents )
        {
            if ( !isalive( agent ) || agent.var_1e2afba6dedb6c52 )
            {
                updated_counter += 0.1;
                continue;
            }
            
            var_b5220ce1d7cce472 = level.aether_storm.radiation radiation::is_position_inside( agent.origin );
            
            if ( agent.type == "zombie" )
            {
                if ( agent == level.aether_storm.stormcaller || !isdefined( agent.zombieaisettings ) )
                {
                    updated_counter += 0.1;
                    continue;
                }
                else if ( var_b5220ce1d7cce472 )
                {
                    if ( !agent.var_169f013f86401cf6 )
                    {
                        agent.var_169f013f86401cf6 = 1;
                        region_difficulty_int = region_difficulty_manager::get_region_difficulty_int( agent.origin );
                        
                        if ( level.aether_storm.var_274f3d593d1a5bb1 == "SET" )
                        {
                            new_difficulty_int = level.aether_storm.var_2ea7ab642429c86;
                        }
                        else
                        {
                            new_difficulty_int = region_difficulty_int + level.aether_storm.var_2ea7ab642429c86;
                        }
                        
                        new_difficulty_int = minint( new_difficulty_int, 4 );
                        new_difficulty = level.region_difficulty_manager.difficulties[ new_difficulty_int ];
                        
                        if ( agent.difficulty == level.region_difficulty_manager.difficulties[ region_difficulty_int ] )
                        {
                            agent region_difficulty_manager::function_410b4f83b0a5b98( new_difficulty );
                        }
                        
                        agent ai::set_ai_max_health( int( agent.maxhealth * level.aether_storm.var_3c34af6bdb5bdfa5 ) );
                        agent.health = agent.maxhealth;
                        
                        if ( issubstr( agent.subclass, "zombie_base" ) && !agent utility::ent_flag( "disciple_bound" ) )
                        {
                            agent utility::function_32b24db3127bff40( "bound", "bound_on" );
                        }
                    }
                }
                else if ( agent.var_169f013f86401cf6 )
                {
                    agent.var_169f013f86401cf6 = 0;
                    old_health = agent.health;
                    agent region_difficulty_manager::function_410b4f83b0a5b98( region_difficulty_manager::get_region_difficulty( agent.origin ) );
                    
                    if ( old_health < agent.max_health )
                    {
                        agent.health = old_health;
                    }
                    
                    if ( issubstr( agent.subclass, "zombie_base" ) && !agent utility::ent_flag( "disciple_bound" ) )
                    {
                        agent utility::function_32b24db3127bff40( "bound", "bound_off" );
                    }
                }
            }
            else
            {
                if ( level.aether_storm.agent_damage_percent > 0 && var_b5220ce1d7cce472 )
                {
                    if ( !isdefined( agent.var_cc41f0cd121f9736 ) || gettime() - agent.var_cc41f0cd121f9736 >= level.aether_storm.agent_damage_cooldown )
                    {
                        damage = ( agent.maxhealth ?? 100 ) * level.aether_storm.agent_damage_percent;
                        agent dodamage( damage, agent.origin, undefined, undefined, "MOD_TRIGGER_HURT", level.radiation.damageweapon, "torso_upper" );
                        agent.var_cc41f0cd121f9736 = gettime();
                    }
                }
                
                if ( level.aether_storm.var_86371fde5552d1ae && isalive( agent ) && !agent.combatrushing )
                {
                    flee_point = agent.origin + 2000 * vectornormalize( agent.origin - level.aether_storm.radiation.origin );
                    var_2a669c0765836c0e = getclosestpointonnavmesh( flee_point );
                    
                    if ( lengthsquared( flee_point - var_2a669c0765836c0e ) < 1000000 )
                    {
                        thread ai_behavior::behavior_combatRushOrigin( agent, flee_point );
                    }
                }
            }
            
            updated_counter += 1;
            
            if ( updated_counter > 5 )
            {
                updated_counter = 0;
                waitframe();
            }
        }
        
        updated_counter = 0;
        wait 1;
    }
}

// Namespace aether_storm
// Params 0
// Checksum 0x9ea3a4c, Offset: 0x39ba
// Size: 0x3bc
function function_cec01c2c2cdc82f5()
{
    level endon( #"game_ended" );
    level.aether_storm.radiation endon( #"radiation_destroyed" );
    
    /#
        level endon( #"hash_d23d31cc7ae693b0" );
    #/
    
    if ( !level.aether_storm.lightning_strikes_enabled )
    {
        return;
    }
    
    level.aether_storm.lightning_strikes_scriptable = spawnscriptable( %"aether_storm_lightning_strike", level.aether_storm.starting_origin );
    scriptable::scriptable_addnotifycallback( "aether_storm_lightning_strike_damage", &_lightning_strike_damage );
    scriptable::scriptable_addnotifycallback( "aether_storm_lightning_strike_finished", &_lightning_strike_finished );
    level.aether_storm.lightning_strikes_objectivemarker = objective_marker_bundle_helper::function_d98e9d627f2d8c28( "aether_storm_lightning_strike" );
    objidpoolmanager::function_de3fb937d4f45f38( level.aether_storm.lightning_strikes_objectivemarker, level.aether_storm.var_f177d74dbe25bf6a, level.aether_storm.var_54faf6e6698ab79d );
    objective_disableping( level.aether_storm.lightning_strikes_objectivemarker, 1 );
    objective_setpings( level.aether_storm.lightning_strikes_objectivemarker, 0 );
    objective_setpingavailablewheninvisible( level.aether_storm.lightning_strikes_objectivemarker, 0 );
    objective_usefadingwhenparachuting( level.aether_storm.lightning_strikes_objectivemarker, 1 );
    players_inside = [];
    cluster_origin = ( 0, 0, 0 );
    
    while ( true )
    {
        if ( randomintrange( 0, 100 ) < level.aether_storm.var_500a3fef3609d40f )
        {
            players_inside = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( level.aether_storm.radiation.origin, level.aether_storm.radiation.radius );
            
            if ( players_inside.size )
            {
                random_player = players_inside[ randomintrange( 0, players_inside.size ) ];
                cluster_origin = random_player.origin;
                var_2c95effb1970f58 = vectornormalize2( cluster_origin - level.aether_storm.radiation.origin );
                var_a85eb585985127cb = level.aether_storm.radiation.origin + var_2c95effb1970f58 * level.aether_storm.radiation.radius;
                var_603ed4b36115822 = distance2d( cluster_origin, var_a85eb585985127cb );
                
                if ( var_603ed4b36115822 < level.aether_storm.var_980578ab8a358206 )
                {
                    cluster_origin = var_a85eb585985127cb + var_2c95effb1970f58 * -1 * ( level.aether_storm.var_980578ab8a358206 - var_603ed4b36115822 );
                }
            }
            else
            {
                cluster_origin_angle = randomfloat( 360 );
                cluster_origin_dist = randomfloat( level.aether_storm.radiation.radius );
                cluster_origin = ( level.aether_storm.radiation.origin[ 0 ] + cos( cluster_origin_angle ) * cluster_origin_dist, level.aether_storm.radiation.origin[ 1 ] + sin( cluster_origin_angle ) * cluster_origin_dist, level.aether_storm.radiation.origin[ 2 ] );
            }
            
            function_fd5dfc3c569e05e0( cluster_origin );
            wait level.aether_storm.var_698f1f09d025887d;
            continue;
        }
        
        wait 1;
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0x43061f3e, Offset: 0x3d7e
// Size: 0x1d7
function function_fd5dfc3c569e05e0( cluster_origin )
{
    strike_origin_angle = undefined;
    strike_origin_dist = undefined;
    strike_origin = undefined;
    
    /#
        level.aether_storm.var_e50ee40fd3a289c5 = cluster_origin;
    #/
    
    strike_count = 0;
    
    while ( strike_count < level.aether_storm.var_1daade908d378f41 )
    {
        strike_origin_angle = randomfloat( 360 );
        strike_origin_dist = randomfloat( level.aether_storm.var_980578ab8a358206 );
        strike_origin = ( cluster_origin[ 0 ] + cos( strike_origin_angle ) * strike_origin_dist, cluster_origin[ 1 ] + sin( strike_origin_angle ) * strike_origin_dist, cluster_origin[ 2 ] );
        strike_origin = getgroundposition( strike_origin, 1, 2048, 1024 );
        objidpoolmanager::update_objective_position( level.aether_storm.lightning_strikes_objectivemarker, strike_origin );
        objidpoolmanager::update_objective_state( level.aether_storm.lightning_strikes_objectivemarker, "current" );
        objidpoolmanager::objective_playermask_showtoall( level.aether_storm.lightning_strikes_objectivemarker );
        level.aether_storm.lightning_strikes_scriptable.origin = strike_origin;
        level.aether_storm.lightning_strikes_scriptable setscriptablepartstate( #"strike", #"on" );
        level.aether_storm.lightning_strikes_scriptable waittill( #"aether_storm_lightning_strike_finished" );
        objidpoolmanager::objective_playermask_hidefromall( level.aether_storm.lightning_strikes_objectivemarker );
        objidpoolmanager::update_objective_state( level.aether_storm.lightning_strikes_objectivemarker, "empty" );
        strike_count += 1;
    }
    
    /#
        level.aether_storm.var_e50ee40fd3a289c5 = undefined;
    #/
}

// Namespace aether_storm
// Params 4, eflags: 0x4
// Checksum 0xc22da6a, Offset: 0x3f5d
// Size: 0x2cb
function private _lightning_strike_damage( instance, note, param, var_64ffacba090c91be )
{
    radiusdamage( instance.origin, level.aether_storm.lightning_strikes_damage_radius, level.aether_storm.lightning_strikes_damage, level.aether_storm.lightning_strikes_damage, undefined, undefined, undefined, 1, 1 );
    players = namespace_9d8e359c3b1041e5::getplayersinradiussharedfunc( instance.origin, level.aether_storm.lightning_strikes_damage_radius );
    
    foreach ( player in players )
    {
        thread lightning_strike_on_player( player, level.aether_storm.lightning_strikes_stun_duration, level.aether_storm.lightning_strikes_damage );
    }
    
    zombies = getaiarrayinradius( instance.origin, level.aether_storm.lightning_strikes_damage_radius, "team_two_hundred" );
    
    foreach ( zombie in zombies )
    {
        thread function_7d456c43692283e4( zombie, level.aether_storm.lightning_strikes_stun_duration, level.aether_storm.lightning_strikes_damage );
    }
    
    soldiers = getaiarrayinradius( instance.origin, level.aether_storm.lightning_strikes_damage_radius, "team_hundred_ninety" );
    
    foreach ( soldier in soldiers )
    {
        thread function_3e388fde8403d9e0( soldier, level.aether_storm.lightning_strikes_stun_duration, level.aether_storm.lightning_strikes_damage );
    }
}

// Namespace aether_storm
// Params 4, eflags: 0x4
// Checksum 0x5833eccd, Offset: 0x4230
// Size: 0x34
function private _lightning_strike_finished( instance, note, param, var_64ffacba090c91be )
{
    instance notify( #"aether_storm_lightning_strike_finished" );
}

// Namespace aether_storm
// Params 3
// Checksum 0x5565008e, Offset: 0x426c
// Size: 0x143
function lightning_strike_on_player( victim, shock_duration, damage )
{
    victim shock_stick::function_904e61c3aefb61c2( 1 );
    
    if ( victim.revivingteammate )
    {
        victim.var_45ab03788f1a0a4d = 1;
    }
    
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    
    if ( isplayer( victim ) )
    {
        gestureref = "vm_ges_shockstick_react";
        curweapon = victim getcurrentweapon();
        
        if ( weapon::isfistweapon( curweapon ) )
        {
            gestureref = "vm_ges_shockstick_react_fists";
        }
        
        while ( !victim isgestureplaying( gestureref ) )
        {
            victim forceplaygestureviewmodel( gestureref );
            waitframe();
        }
    }
    
    victim startforcedfire();
    victim shock_stick::function_ef03efbecb279b8a( 1 );
    victim setmovespeedscale( 0.8 );
    victim setempjammed( 1 );
    wait shock_duration;
    victim shock_stick::function_904e61c3aefb61c2( 0 );
    victim stopgestureviewmodel( gestureref );
    victim stopforcedfire();
    victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    victim shock_stick::function_ef03efbecb279b8a( 0 );
    victim setmovespeedscale( 1 );
    victim setempjammed( 0 );
}

// Namespace aether_storm
// Params 3
// Checksum 0xad38055e, Offset: 0x43b7
// Size: 0x81
function function_7d456c43692283e4( victim, shock_duration, damage )
{
    victim zombie_stun::stun_ai( shock_duration );
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    wait shock_duration;
    
    if ( isalive( victim ) )
    {
        victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    }
}

// Namespace aether_storm
// Params 3
// Checksum 0xb54a4ea1, Offset: 0x4440
// Size: 0xe6
function function_3e388fde8403d9e0( victim, shock_duration, damage )
{
    firstshock = gettime() > victim._blackboard.var_ba9517cfc0287af8 + 1;
    victim._blackboard.var_ba9517cfc0287af8 = gettime();
    
    if ( victim asmhaspainstate( victim.asmname ) && firstshock )
    {
        victim asmevalpaintransition( victim.asmname );
    }
    
    victim utility::function_32b24db3127bff40( "shockStickVfx", "vfx_start" );
    victim dodamage( damage, victim.origin, victim, victim, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
    wait shock_duration;
    
    if ( isalive( victim ) )
    {
        victim utility::function_32b24db3127bff40( "shockStickVfx", "off" );
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0x1bf9824d, Offset: 0x452e
// Size: 0x3c
function on_player_enter_aether_storm( params )
{
    player = params.player;
    
    if ( isdefined( player ) )
    {
        player utility::function_32b24db3127bff40( "aether_storm_sfx", "activate" );
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0x5d533f19, Offset: 0x4572
// Size: 0x3c
function on_player_exit_aether_storm( params )
{
    player = params.player;
    
    if ( isdefined( player ) )
    {
        player utility::function_32b24db3127bff40( "aether_storm_sfx", "off" );
    }
}

// Namespace aether_storm
// Params 1
// Checksum 0x7779821d, Offset: 0x45b6
// Size: 0x22
function on_player_death_aether_storm( sparams )
{
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "aether_storm_sfx", "off" );
    }
}

/#

    // Namespace aether_storm
    // Params 0, eflags: 0x4
    // Checksum 0x2d436af5, Offset: 0x45e0
    // Size: 0x665, Type: dev
    function private _debug_init()
    {
        level endon( #"game_ended" );
        devgui::function_9082edeb5db93280( "<dev string:x543>" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x554>", @"hash_c970fe9ef25b9a04" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x564>", "<dev string:x572>", &function_ef97f013cc15d562 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x59e>", "<dev string:x5ac>", &function_ef97f013cc15d562 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x5d8>", "<dev string:x5e6>", &function_ef97f013cc15d562 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x612>", "<dev string:x620>", &function_ef97f013cc15d562 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x64c>", "<dev string:x65a>", &function_ef97f013cc15d562 );
        devgui::function_cd4e263c1f3018ae( "<dev string:x686>", "<dev string:x695>", &function_ef97f013cc15d562 );
        devgui::function_eaac4ba4b3caf621( "<dev string:x6c2>", @"hash_e2d799f3be57182c" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x6da>", @"hash_15f2625555966cc5" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x6f2>", @"hash_427ed1f525368516" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x70a>", @"hash_bd3120ea0bb6d372" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x724>", @"hash_d6c6f72d0fa198e1" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x73c>", @"hash_1ba1d0074052d695" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x753>", @"hash_e240cfe5c52e96b9" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x76b>", @"hash_e045509608ce5be3" );
        devgui::function_77df7fe7dd273e10();
        thread function_45b55307b9ddfb93();
        setdvar( @"hash_bd3120ea0bb6d372", level.aether_storm.lightning_strikes_enabled );
        
        while ( true )
        {
            waitframe();
            
            if ( getdvarint( @"hash_c970fe9ef25b9a04", 0 ) )
            {
                setdvar( @"hash_c970fe9ef25b9a04", 0 );
                println( "<dev string:x782>" );
                create_storm();
                start_expansion();
            }
            
            if ( getdvarint( @"hash_578143de415fb426", 0 ) )
            {
                percent = getdvarfloat( @"hash_578143de415fb426", 0 );
                setdvar( @"hash_578143de415fb426", 0 );
                println( "<dev string:x7c1>" + percent + "<dev string:x818>" );
                
                if ( isdefined( level.aether_storm.radiation ) )
                {
                    function_ef97f013cc15d562( [ percent ] );
                }
            }
            
            if ( getdvarint( @"hash_15f2625555966cc5", 0 ) )
            {
                setdvar( @"hash_15f2625555966cc5", 0 );
                
                if ( !isdefined( level.aether_storm.final_exfil ) )
                {
                    println( "<dev string:x81b>" );
                    continue;
                }
                
                println( "<dev string:x84c>" + level.aether_storm.final_exfil.origin );
                
                foreach ( player in level.players )
                {
                    x = level.aether_storm.final_exfil.origin[ 0 ];
                    y = level.aether_storm.final_exfil.origin[ 1 ];
                    z = level.aether_storm.final_exfil.origin[ 2 ] + 128;
                    player setorigin( ( x, y, z ) );
                }
            }
            
            if ( getdvarint( @"hash_427ed1f525368516", 0 ) )
            {
                setdvar( @"hash_427ed1f525368516", 0 );
                println( "<dev string:x893>" );
                
                if ( !level.aether_storm.final_exfil.b_exfil_started && !level.aether_storm.var_5ba0271cb5405b06 )
                {
                    thread begin_final_exfil();
                }
                
                level notify( #"aether_storm_force_start_final_exfil" );
            }
            
            if ( getdvarint( @"hash_bd3120ea0bb6d372", 1 ) != level.aether_storm.lightning_strikes_enabled )
            {
                level.aether_storm.lightning_strikes_enabled = getdvarint( @"hash_bd3120ea0bb6d372", 1 );
                
                if ( level.aether_storm.lightning_strikes_enabled )
                {
                    println( "<dev string:x8c5>" );
                    thread function_cec01c2c2cdc82f5();
                }
                else
                {
                    println( "<dev string:x8fb>" );
                    level notify( #"hash_d23d31cc7ae693b0" );
                }
            }
            
            if ( getdvarint( @"hash_e240cfe5c52e96b9", 0 ) )
            {
                setdvar( @"hash_e240cfe5c52e96b9", 0 );
                player = level.players[ 0 ];
                forward = anglestoforward( player getplayerangles() );
                trace = trace::ray_trace( player geteye(), player geteye() + forward * 150000 );
                
                if ( isdefined( trace[ "<dev string:x932>" ] ) && trace[ "<dev string:x93b>" ] < 1 )
                {
                    function_fd5dfc3c569e05e0( trace[ "<dev string:x932>" ] );
                }
            }
            
            if ( getdvarint( @"hash_e045509608ce5be3", 0 ) )
            {
                setdvar( @"hash_e045509608ce5be3", 0 );
                player = level.players[ 0 ];
                forward = anglestoforward( player getplayerangles() );
                trace = trace::ray_trace( player geteye(), player geteye() + forward * 150000 );
                
                if ( isdefined( trace[ "<dev string:x932>" ] ) && trace[ "<dev string:x93b>" ] < 1 )
                {
                    objidpoolmanager::update_objective_position( level.aether_storm.lightning_strikes_objectivemarker, trace[ "<dev string:x932>" ] );
                    objidpoolmanager::objective_playermask_showtoall( level.aether_storm.lightning_strikes_objectivemarker );
                    level.aether_storm.lightning_strikes_scriptable.origin = trace[ "<dev string:x932>" ];
                    level.aether_storm.lightning_strikes_scriptable setscriptablepartstate( #"strike", #"on" );
                    level.aether_storm.lightning_strikes_scriptable waittill( #"aether_storm_lightning_strike_finished" );
                    objidpoolmanager::objective_playermask_hidefromall( level.aether_storm.lightning_strikes_objectivemarker );
                }
            }
        }
    }

    // Namespace aether_storm
    // Params 0, eflags: 0x4
    // Checksum 0xec66f593, Offset: 0x4c4d
    // Size: 0x24d, Type: dev
    function private function_45b55307b9ddfb93()
    {
        level endon( #"game_ended" );
        
        for ( timer = 0; true ; timer = 0 )
        {
            if ( getdvarint( @"hash_e2d799f3be57182c", 0 ) && timer == 0 )
            {
                print3d( level.aether_storm.final_exfil.origin + ( 0, 0, 300 ), "<dev string:x944>", ( 1, 1, 1 ), 1, 25, 5, 1 );
                sphere( level.aether_storm.final_exfil.origin, 360, ( 1, 1, 1 ), 0, 5 );
            }
            
            if ( getdvarint( @"hash_d6c6f72d0fa198e1", 0 ) && isdefined( level.aether_storm.var_e50ee40fd3a289c5 ) )
            {
                cylinder( level.aether_storm.var_e50ee40fd3a289c5, level.aether_storm.var_e50ee40fd3a289c5 + ( 0, 0, 1 ), level.aether_storm.var_980578ab8a358206, ( 1, 0, 1 ), 0, 1 );
            }
            
            if ( getdvarint( @"hash_1ba1d0074052d695", 0 ) && isdefined( level.aether_storm.lightning_strikes_scriptable ) )
            {
                cylinder( level.aether_storm.lightning_strikes_scriptable.origin, level.aether_storm.lightning_strikes_scriptable.origin + ( 0, 0, 1 ), level.aether_storm.lightning_strikes_damage_radius, ( 0.5, 0, 1 ), 0, 1 );
                line( level.aether_storm.lightning_strikes_scriptable.origin, level.aether_storm.lightning_strikes_scriptable.origin + ( 0, 0, 1024 ), ( 0.5, 0, 1 ), 1, 0, 1 );
            }
            
            waitframe();
            timer++;
            
            if ( timer >= 5 )
            {
            }
        }
    }

    // Namespace aether_storm
    // Params 1
    // Checksum 0xda55bef, Offset: 0x4ea2
    // Size: 0x44b, Type: dev
    function function_ef97f013cc15d562( params )
    {
        percent = float( params[ 0 ] ) / 100;
        
        if ( !level.aether_storm.radiation.transforming )
        {
            create_storm();
            start_expansion();
            waitframe();
        }
        
        level.aether_storm.radiation.var_529f706a694afa7e = percent * level.aether_storm.expansion_duration_seconds;
        set_timer_time( level.aether_storm.expansion_duration_seconds - level.aether_storm.radiation.var_529f706a694afa7e );
        progress = level.aether_storm.radiation.var_529f706a694afa7e / level.aether_storm.radiation.var_9990052340fe6496;
        level.aether_storm.radiation.origin = vectorlerp( level.aether_storm.radiation.var_3cc42b91d0c21ef, level.aether_storm.radiation.var_16724ff093cee252, progress );
        level.aether_storm.radiation.radius = math::lerp( level.aether_storm.radiation.var_d2c71adb0574e513, level.aether_storm.radiation.var_735f96414bfa5936, progress );
        exfil_start_delay = ( level.aether_storm.timer_finish_time - gettime() ) / 1000;
        exfil_start_delay -= level.aether_storm.final_exfil_duration;
        exfil_start_delay -= getdvarint( @"hash_eb873c5e99093d11", 50 );
        exfil_start_delay -= getdvarint( @"hash_346baccb7a031727", 7 );
        
        if ( exfil_start_delay > 0 )
        {
            thread function_d8fc8b264c210610( "<dev string:x95d>", exfil_start_delay );
        }
        else
        {
            if ( !level.aether_storm.final_exfil.b_exfil_started && !level.aether_storm.var_5ba0271cb5405b06 )
            {
                thread begin_final_exfil();
            }
            
            level notify( #"aether_storm_force_start_final_exfil" );
        }
        
        if ( isdefined( level.aether_storm.radiation.brcircle ) )
        {
            level.aether_storm.radiation.brcircle delete();
            level.aether_storm.radiation.brcircle = spawnbrcircle( level.aether_storm.radiation.origin[ 0 ], level.aether_storm.radiation.origin[ 1 ], level.aether_storm.radiation.radius );
            
            if ( level.aether_storm.radiation.var_529f706a694afa7e < level.aether_storm.radiation.var_9990052340fe6496 )
            {
                level.aether_storm.radiation.brcircle brcirclemoveto( level.aether_storm.radiation.var_16724ff093cee252[ 0 ], level.aether_storm.radiation.var_16724ff093cee252[ 1 ], level.aether_storm.radiation.var_735f96414bfa5936, level.aether_storm.radiation.var_9990052340fe6496 - level.aether_storm.radiation.var_529f706a694afa7e );
            }
        }
    }

    // Namespace aether_storm
    // Params 2
    // Checksum 0xdf56fdcf, Offset: 0x52f5
    // Size: 0x25, Type: dev
    function function_d8fc8b264c210610( notification, delay )
    {
        level endon( notification );
        wait delay;
        level notify( notification );
    }

#/
