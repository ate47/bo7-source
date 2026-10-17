#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_sat_locust_blizzard_cs;

// Namespace zm_sat_locust_blizzard_cs
// Params 0, eflags: 0x5
// Checksum 0x70886454, Offset: 0xcf
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"zm_sat_locust_blizzard_cs", undefined, &function_b39ecd3d51489472, undefined );
}

// Namespace zm_sat_locust_blizzard_cs
// Params 0, eflags: 0x4
// Checksum 0x1d032b68, Offset: 0xf0
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace zm_sat_locust_blizzard_cs
// Params 0, eflags: 0x4
// Checksum 0x9838f884, Offset: 0x101
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace zm_sat_locust_blizzard_cs
// Params 2
// Checksum 0x28d1aecd, Offset: 0x112
// Size: 0x80
function main( unused, unused2 )
{
    if ( utility::flag_exist( "zm_sat_locust_blizzard_cs" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "zm_sat_locust_blizzard_cs" ) )
    {
        return;
    }
    
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "zm_sat_locust_blizzard_cs" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "zm_sat_locust_blizzard_cs" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace zm_sat_locust_blizzard_cs
// Params 3, eflags: 0x4
// Checksum 0x1bba4c4b, Offset: 0x19a
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "zm_sat_locust_blizzard_cs" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "zm_sat_locust_blizzard_cs" );
}

// Namespace zm_sat_locust_blizzard_cs
// Params 3, eflags: 0x4
// Checksum 0x41d82d03, Offset: 0x214
// Size: 0x44a
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "zm_sat_locust_blizzard_cs";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 288, 168, 184 );
    s.var_2763db7f49f37e81 = ( 120, 88, 32 );
    s.height = 128;
    s.length = "128";
    s.script_int = int( 1 );
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 1313.86, 6346.99, 248 ), ( 0, 9, 0 ), "blizzard_volume_zone" );
    s = {};
    s.script_cs_flag = "zm_sat_locust_blizzard_cs";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 512, 352, 64 );
    s.var_2763db7f49f37e81 = ( 704, 352, 128 );
    s.height = 128;
    s.length = "128";
    s.script_int = int( 0 );
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -138, 2783.5, -47.5 ), ( 0, 30, 0 ), "blizzard_volume_zone" );
    s = {};
    s.script_cs_flag = "zm_sat_locust_blizzard_cs";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 288, 200, 184 );
    s.var_2763db7f49f37e81 = ( 272, 312, 32 );
    s.height = 128;
    s.length = "128";
    s.script_int = int( 0 );
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( -394.9, 3547.72, 148 ), ( 0, 30, 0 ), "blizzard_volume_zone" );
    s = {};
    s.script_cs_flag = "zm_sat_locust_blizzard_cs";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 314, 320, 312 );
    s.var_2763db7f49f37e81 = ( 704, 240, 128 );
    s.height = 128;
    s.length = "128";
    s.script_int = int( 0 );
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 973.87, 1349.89, 160.5 ), ( 0, 30, 0 ), "blizzard_volume_zone" );
    s = {};
    s.script_cs_flag = "zm_sat_locust_blizzard_cs";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 203, 311.5, 152 );
    s.var_2763db7f49f37e81 = ( 161, 340.5, 168 );
    s.height = 128;
    s.length = "128";
    s.script_int = int( 1 );
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 2428, 5744.5, 311 ), ( 0, 0, 0 ), "blizzard_volume_zone" );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace zm_sat_locust_blizzard_cs
// Params 0, eflags: 0x4
// Checksum 0x3f24a6bb, Offset: 0x666
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace zm_sat_locust_blizzard_cs
// Params 0
// Checksum 0xd9e99106, Offset: 0x670
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "zm_sat_locust_blizzard_cs" );
}

