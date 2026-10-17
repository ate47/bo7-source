#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\mp\overlord;

#namespace ob_activity_sagittarius_vo;

// Namespace ob_activity_sagittarius_vo
// Params 1
// Checksum 0xafa00019, Offset: 0x400
// Size: 0x22
function function_3a6b015435485777( vo_events )
{
    return { #current_index:0, #vo_events:vo_events };
}

// Namespace ob_activity_sagittarius_vo
// Params 3
// Checksum 0x1babc2f9, Offset: 0x42b
// Size: 0x9e
function function_b3c7509b373055bc( vo_struct, players, delay )
{
    chosenevent = vo_struct.vo_events[ vo_struct.current_index ];
    vo_struct.current_index++;
    
    if ( vo_struct.current_index == vo_struct.vo_events.size )
    {
        vo_struct.vo_events = arrayrandomize( vo_struct.vo_events );
        vo_struct.current_index = 0;
    }
    
    overlord::playevent( chosenevent, players, delay, 0, 1 );
}

// Namespace ob_activity_sagittarius_vo
// Params 6
// Checksum 0xf8211b46, Offset: 0x4d1
// Size: 0x76
function function_f19b17747f2036c4( var_f846f108eb9c140d, min_wait_time, max_wait_time, mission_struct_endon_flag, mission_struct, squad_data )
{
    mission_struct endon( mission_struct_endon_flag );
    nag_vo_struct = function_3a6b015435485777( var_f846f108eb9c140d );
    
    while ( true )
    {
        wait randomfloatrange( min_wait_time, max_wait_time );
        function_b3c7509b373055bc( nag_vo_struct, squad_data.players );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 3
// Checksum 0xf5d3962d, Offset: 0x54f
// Size: 0x10a
function function_69bfa840c2e7f264( boss_agent, mission_struct, squad_data )
{
    boss_agent endon( #"death" );
    boss_agent waittill( #"hash_1466dc16c6fac9d9" );
    childthread bossspotted( mission_struct, boss_agent, squad_data );
    overlord::playconversation( "wheres_the_sniper", squad_data.players );
    overlord::playevent( "were_targets_out_here", squad_data.players, undefined, 0, 0 );
    mission_struct utility::ent_flag_wait( "hologram_scanned" );
    overlord::playevent( "priya_first_trace", squad_data.players, undefined, 0, 0 );
    thread function_c20f0de530b322a7( mission_struct, squad_data );
    childthread overlord::playconversation( "im_the_one_youre_looking_for", squad_data.players, 8 );
    childthread function_faf1c93b82438d5( mission_struct, boss_agent, squad_data );
    childthread function_de201adab67e8a8e( mission_struct, boss_agent, squad_data );
    childthread function_c4207508491de5cf( mission_struct, squad_data );
    childthread function_d938710d55524d6e( mission_struct, squad_data, boss_agent );
    childthread function_39a0e215431e2484( boss_agent, squad_data );
    childthread function_1d0fcc54090fae6c( boss_agent, squad_data );
    childthread function_b79d01dfa450e80f( mission_struct, squad_data, boss_agent );
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0x9eeed440, Offset: 0x661
// Size: 0x65
function private function_c20f0de530b322a7( mission_struct, squad_data )
{
    mission_struct utility::ent_flag_clear( "hologram_scanned" );
    mission_struct utility::ent_flag_wait( "hologram_scanned" );
    overlord::playevent( "priya_located_1", squad_data.players, undefined, 0, 0 );
    thread overlord::playconversation( "priya_kagan_calls", squad_data.players, 7, 0 );
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0x62618b58, Offset: 0x6ce
// Size: 0x3f
function private function_b79d01dfa450e80f( mission_struct, squad_data, boss_agent )
{
    while ( true )
    {
        childthread function_568401631cc288ca( mission_struct, squad_data, boss_agent );
        mission_struct waittill( #"hash_125fb82cce5e15d8" );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0x81b858e, Offset: 0x715
// Size: 0xbf
function private function_568401631cc288ca( mission_struct, squad_data, boss_agent )
{
    mission_struct endon( #"hash_125fb82cce5e15d8" );
    mission_struct waittill( #"hash_5242863dc17b5295" );
    childthread function_6e9b40557361d197( mission_struct, squad_data );
    
    foreach ( player in squad_data.players )
    {
        childthread function_3e60d6567204b21a( player, boss_agent );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0xac79b8c7, Offset: 0x7dc
// Size: 0x73
function private function_39a0e215431e2484( boss_agent, squad_data )
{
    while ( true )
    {
        boss_agent waittill( #"damage", amount );
        
        if ( boss_agent.health / boss_agent.maxhealth < 0.35 )
        {
            thread overlord::playconversation( "priya_to_the_death", squad_data.players, undefined, 0 );
            break;
        }
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0x86e07ab7, Offset: 0x857
// Size: 0x96
function private function_1d0fcc54090fae6c( boss_agent, squad_data )
{
    wounded_vo_struct = function_3a6b015435485777( [ "priya_wounded_1", "priya_wounded_2", "priya_wounded_3" ] );
    
    while ( true )
    {
        boss_agent waittill( #"damage", amount );
        random_float = randomfloatrange( 0, 1 );
        
        if ( random_float <= 0.15 )
        {
            function_b3c7509b373055bc( wounded_vo_struct, squad_data.players );
        }
        
        wait 10;
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0x1ee13cb5, Offset: 0x8f5
// Size: 0xa5
function private function_3e60d6567204b21a( player, boss_agent )
{
    player endon( #"death_or_disconnect" );
    player endon( #"left_squad" );
    vo_struct = function_3a6b015435485777( [ "priya_signal_1", "priya_signal_2" ] );
    distance_sqrt = 25000000;
    
    while ( true )
    {
        if ( distancesquared( player.origin, boss_agent.origin ) >= distance_sqrt )
        {
            function_b3c7509b373055bc( vo_struct, [ player ] );
            wait randomfloatrange( 12, 20 );
        }
        
        waitframe();
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0xf9190ac1, Offset: 0x9a2
// Size: 0x8c
function private function_6e9b40557361d197( mission_struct, squad_data )
{
    nags_vo_struct = function_3a6b015435485777( [ "priya_taunt_1", "priya_taunt_2", "priya_taunt_3", "priya_taunt_4", "priya_taunt_5", "priya_taunt_6", "priya_taunt_7" ] );
    
    while ( true )
    {
        wait randomfloatrange( 20, 25 );
        function_b3c7509b373055bc( nags_vo_struct, squad_data.players );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 2, eflags: 0x4
// Checksum 0xd9f4479f, Offset: 0xa36
// Size: 0x91
function private function_c4207508491de5cf( mission_struct, squad_data )
{
    cloak_vo_struct = function_3a6b015435485777( [ "priya_cloaked_2", "priya_cloaked_3", "priya_cloaked_4", "priya_cloaked_5", "priya_cloaked_6", "priya_cloaked_7", "priya_cloaked_8" ] );
    
    while ( true )
    {
        mission_struct waittill( #"hash_c6d72151e1bb9ed0" );
        function_b3c7509b373055bc( cloak_vo_struct, squad_data.players );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0xa74452b0, Offset: 0xacf
// Size: 0xd3
function private function_d938710d55524d6e( mission_struct, squad_data, boss_agent )
{
    uncloak_vo_struct = function_3a6b015435485777( [ "priya_uncloak_1", "priya_uncloak_2", "priya_uncloak_3" ] );
    var_c2ced779fb92ed37 = function_3a6b015435485777( [ "priya_spotted_1", "priya_spotted_3", "priya_spotted_4", "priya_spotted_5", "priya_spotted_6", "priya_spotted_7", "priya_spotted_8" ] );
    
    while ( true )
    {
        mission_struct waittill( #"hash_5bc666f4704dcb89" );
        function_b3c7509b373055bc( uncloak_vo_struct, squad_data.players );
        childthread function_cd4ad9dcf8607a1a( mission_struct, boss_agent, squad_data, var_c2ced779fb92ed37 );
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 4, eflags: 0x4
// Checksum 0xec220dd7, Offset: 0xbaa
// Size: 0x141
function private function_cd4ad9dcf8607a1a( mission_struct, boss_agent, squad_data, vo_struct )
{
    mission_struct endon( #"hash_c6d72151e1bb9ed0" );
    mission_struct endon( #"hash_5bc666f4704dcb89" );
    fov = cos( 35 );
    var_4297a96308301442 = 0;
    
    while ( true )
    {
        player_within_fov = 0;
        
        foreach ( player in squad_data.players )
        {
            if ( withinfov2d( player.origin, player getplayerangles(), boss_agent.origin, fov ) && sighttracepassed( player geteye(), boss_agent geteye(), 1, boss_agent, player ) )
            {
                function_b3c7509b373055bc( vo_struct, [ player ], var_4297a96308301442 );
                player_within_fov = 1;
                break;
            }
        }
        
        if ( player_within_fov )
        {
            break;
        }
        
        waitframe();
    }
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0xa044622f, Offset: 0xcf3
// Size: 0x1ed
function private bossspotted( mission_struct, boss_agent, squad_data )
{
    distance_sqrt = 2250000;
    priya_first_echo_unit = 0;
    
    while ( !isdefined( mission_struct.decoy ) )
    {
        waitframe();
    }
    
    while ( true )
    {
        foreach ( player in squad_data.players )
        {
            distancemin = distancesquared( player.origin, mission_struct.decoy.origin ) <= distance_sqrt;
            
            if ( isdefined( mission_struct.decoy ) )
            {
                ignoreents = arraycombine( squad_data.players, [ mission_struct.decoy ] );
            }
            
            canseetarget = trace::ray_trace_passed( mission_struct.decoy.origin + ( 0, 0, 60 ), player geteye(), ignoreents );
            
            if ( distancemin && canseetarget )
            {
                thread overlord::playconversation( "priya_first_echo_unit", squad_data.players );
                priya_first_echo_unit = 1;
                mission_struct notify( #"decoy_spotted" );
                wait 3;
                mission_struct utility::ent_flag_set( "echo_unit_spotted" );
                break;
            }
        }
        
        if ( priya_first_echo_unit )
        {
            break;
        }
        
        wait 1;
    }
    
    mission_struct waittill( #"hash_43d681b55f223ff7", holoorigin );
    overlord::playconversation( "priya_echo_unit_2", squad_data.players, 2 );
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0xb89d2477, Offset: 0xee8
// Size: 0x46
function private function_de201adab67e8a8e( mission_struct, boss_agent, squad_data )
{
    mission_struct waittill( #"cradle_spawn" );
    wait 2;
    overlord::playconversation( "more_friggin_monsters", squad_data.players );
}

// Namespace ob_activity_sagittarius_vo
// Params 3, eflags: 0x4
// Checksum 0xdeaf41ec, Offset: 0xf36
// Size: 0x49
function private function_faf1c93b82438d5( mission_struct, boss_agent, squad_data )
{
    boss_agent waittill( #"boss_shooting" );
    wait 1;
    overlord::playevent( "priya_that_rifle", squad_data.players, undefined, 0, 0 );
}

// Namespace ob_activity_sagittarius_vo
// Params 3
// Checksum 0xdac7046b, Offset: 0xf87
// Size: 0xa4
function function_860e2822ee021a99( currentposition, bossposition, players )
{
    if ( !( isdefined( currentposition ) && isdefined( bossposition ) ) )
    {
        return;
    }
    
    directionvector = bossposition - currentposition;
    directionvector = vectornormalize( directionvector );
    vo_event = undefined;
    
    if ( abs( directionvector[ 0 ] ) > abs( directionvector[ 1 ] ) )
    {
        vo_event = directionvector[ 0 ] > 0 ? "priya_move_west" : "priya_move_east";
    }
    else
    {
        vo_event = directionvector[ 1 ] > 0 ? "priya_move_north" : "priya_move_south";
    }
    
    overlord::playevent( vo_event, players, 0.5, 0 );
}

