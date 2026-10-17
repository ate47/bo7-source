#using scripts\common\create_script_utility;
#using scripts\common\utility;

#namespace zm_sat_ruby_initial_player_spawn_points_create_script;

// Namespace zm_sat_ruby_initial_player_spawn_points_create_script
// Params 2
// Checksum 0xde95ae93, Offset: 0xe4
// Size: 0x80
function main( unused, unused2 )
{
    if ( utility::flag_exist( "zm_sat_ruby_initial_player_spawn_points_create_script" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "zm_sat_ruby_initial_player_spawn_points_create_script" ) )
    {
        return;
    }
    
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "zm_sat_ruby_initial_player_spawn_points_create_script" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "zm_sat_ruby_initial_player_spawn_points_create_script" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace zm_sat_ruby_initial_player_spawn_points_create_script
// Params 3, eflags: 0x4
// Checksum 0xedfe4c15, Offset: 0x16c
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "zm_sat_ruby_initial_player_spawn_points_create_script" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "zm_sat_ruby_initial_player_spawn_points_create_script" );
}

// Namespace zm_sat_ruby_initial_player_spawn_points_create_script
// Params 3, eflags: 0x4
// Checksum 0x3cf9dbb3, Offset: 0x1e6
// Size: 0x187
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "zm_sat_ruby_initial_player_spawn_points_create_script";
    s.script_int = int( 1 );
    fe [[ f ]]( s, us, cf, ( -2878.25, 141.97, -0.24 ), ( 0, 354.3, 0 ), "initial_spawn_points" );
    s = {};
    s.script_cs_flag = "zm_sat_ruby_initial_player_spawn_points_create_script";
    s.script_int = int( 2 );
    fe [[ f ]]( s, us, cf, ( -2930.02, -140.43, -3.16 ), ( 0, 1.2, 0 ), "initial_spawn_points" );
    s = {};
    s.script_cs_flag = "zm_sat_ruby_initial_player_spawn_points_create_script";
    s.script_int = int( 3 );
    fe [[ f ]]( s, us, cf, ( -2837.05, 234.87, -2.59 ), ( 0, 356.4, 0 ), "initial_spawn_points" );
    s = {};
    s.script_cs_flag = "zm_sat_ruby_initial_player_spawn_points_create_script";
    s.script_int = int( 0 );
    fe [[ f ]]( s, us, cf, ( -2939.43, -285.37, -20.85 ), ( 0, 5.3, 0 ), "initial_spawn_points" );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace zm_sat_ruby_initial_player_spawn_points_create_script
// Params 0, eflags: 0x4
// Checksum 0x7cec9f83, Offset: 0x375
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace zm_sat_ruby_initial_player_spawn_points_create_script
// Params 0
// Checksum 0x2fad9158, Offset: 0x37f
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "zm_sat_ruby_initial_player_spawn_points_create_script" );
}

