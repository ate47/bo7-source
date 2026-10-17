#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace mp_saw_sierra_s1;

// Namespace mp_saw_sierra_s1
// Params 0, eflags: 0x5
// Checksum 0x2e95ee65, Offset: 0xc7
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"mp_saw_sierra_s1", undefined, &function_b39ecd3d51489472, undefined );
}

// Namespace mp_saw_sierra_s1
// Params 0, eflags: 0x4
// Checksum 0x45d8f3b3, Offset: 0xe8
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace mp_saw_sierra_s1
// Params 0, eflags: 0x4
// Checksum 0xc0e3205f, Offset: 0xf9
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace mp_saw_sierra_s1
// Params 2
// Checksum 0x700a7616, Offset: 0x10a
// Size: 0x80
function main( unused, unused2 )
{
    if ( utility::flag_exist( "mp_saw_sierra_s1" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "mp_saw_sierra_s1" ) )
    {
        return;
    }
    
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "mp_saw_sierra_s1" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "mp_saw_sierra_s1" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace mp_saw_sierra_s1
// Params 3, eflags: 0x4
// Checksum 0x43619490, Offset: 0x192
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "mp_saw_sierra_s1" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "mp_saw_sierra_s1" );
}

// Namespace mp_saw_sierra_s1
// Params 3, eflags: 0x4
// Checksum 0xb09ef7c3, Offset: 0x20c
// Size: 0x14a
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_saw_sierra_s1";
    s.is_cs_trigger = 1;
    s.is_cs_noent_volume = 1;
    s.var_2786cd7f4a19a76f = ( 243, 63, 83 );
    s.var_2763db7f49f37e81 = ( 214, 85, 86 );
    s.height = 128;
    s.length = "128";
    s.width = "128";
    fe [[ f ]]( s, us, cf, ( 26562, -1103, -834 ), ( 0, 315.05, 0 ), "stadium_kt", undefined, "stadium_kt" );
    s = {};
    s.script_cs_flag = "mp_saw_sierra_s1";
    fe [[ f ]]( s, us, cf, ( 280, 161, -850 ), ( 0, 0, 0 ), "s1_test" );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace mp_saw_sierra_s1
// Params 0, eflags: 0x4
// Checksum 0xf336d197, Offset: 0x35e
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace mp_saw_sierra_s1
// Params 0
// Checksum 0x813249dd, Offset: 0x368
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "mp_saw_sierra_s1" );
}

