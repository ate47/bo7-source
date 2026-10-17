#using scripts\common\activity_nexus\activity_common;
#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace sat_ob_activity_scorpio_interior_cs;

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0, eflags: 0x5
// Checksum 0x92b79666, Offset: 0x120
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"sat_ob_activity_scorpio_interior_cs", #"activity_common", &function_b39ecd3d51489472, undefined );
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0, eflags: 0x4
// Checksum 0x671d0276, Offset: 0x149
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0, eflags: 0x4
// Checksum 0xe226d19a, Offset: 0x15a
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 2
// Checksum 0x2e5b2883, Offset: 0x16b
// Size: 0x8c
function main( unused, unused2 )
{
    if ( utility::flag_exist( "sat_ob_activity_scorpio_interior_cs" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "sat_ob_activity_scorpio_interior_cs" ) )
    {
        return;
    }
    
    activity_common::function_e1df676808c1d1e3( &function_4cd78e661617f3 );
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "sat_ob_activity_scorpio_interior_cs" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "sat_ob_activity_scorpio_interior_cs" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 3, eflags: 0x4
// Checksum 0x61a46555, Offset: 0x1ff
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "sat_ob_activity_scorpio_interior_cs" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "sat_ob_activity_scorpio_interior_cs" );
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 3, eflags: 0x4
// Checksum 0x11497d3c, Offset: 0x279
// Size: 0xb6
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "sat_ob_activity_scorpio_interior_cs";
    s.activity_bundle = "sat_activitydef_scorpio_interior";
    s.name = "OB_SCORPIO_INTERIOR";
    fe [[ f ]]( s, "OB_SCORPIO_INTERIOR", cf, ( -90, 875, 68 ), ( 0, 0, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link" );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0, eflags: 0x4
// Checksum 0x39df9cce, Offset: 0x337
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0
// Checksum 0xa3f7b818, Offset: 0x341
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "sat_ob_activity_scorpio_interior_cs" );
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0
// Checksum 0x77d2b2b9, Offset: 0x357
// Size: 0x44
function function_4cd78e661617f3()
{
    activityinfostruct = {};
    activityinfostruct.mainfunction = &main;
    activityinfostruct.var_934f068483ae4ddb = &function_d4323822d7042e5a;
    activityinfostruct.metadatafunction = &function_d9dd7965c51c95d1;
    return activityinfostruct;
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 4
// Checksum 0x95ea9cec, Offset: 0x3a4
// Size: 0x57
function function_d4323822d7042e5a( instancename, fe, us, cf = "sat_ob_activity_scorpio_interior_cs" )
{
    switch ( instancename )
    {
        case #"hash_2462a4615917e517":
            function_6491b1c24ee40b3f( fe, us, cf );
            break;
    }
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 3
// Checksum 0x83d707e7, Offset: 0x403
// Size: 0x2f
function function_6491b1c24ee40b3f( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace sat_ob_activity_scorpio_interior_cs
// Params 0
// Checksum 0x771057c6, Offset: 0x43a
// Size: 0xae
function function_d9dd7965c51c95d1()
{
    activityinstances = [];
    instancestruct = {};
    instancestruct.scriptbundle = "sat_activitydef_scorpio_interior";
    instancestruct.cf = "sat_ob_activity_scorpio_interior_cs";
    instancestruct.scriptstructorigin = ( -90, 875, 68 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "OB_SCORPIO_INTERIOR" ] = instancestruct;
    return activityinstances;
}

