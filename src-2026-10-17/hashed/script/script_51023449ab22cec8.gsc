#using scripts\common\activity_nexus\activity_common;
#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace mp_sat_avalon_q1_ob_activity_convoy_cs;

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0, eflags: 0x5
// Checksum 0x992bdfd3, Offset: 0x19b
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"mp_sat_avalon_q1_ob_activity_convoy_cs", #"activity_common", &function_b39ecd3d51489472, undefined );
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0xccfad5c6, Offset: 0x1c4
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0x49c1062a, Offset: 0x1d5
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 2
// Checksum 0xfda405ac, Offset: 0x1e6
// Size: 0x8c
function main( unused, unused2 )
{
    if ( utility::flag_exist( "mp_sat_avalon_q1_ob_activity_convoy_cs" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "mp_sat_avalon_q1_ob_activity_convoy_cs" ) )
    {
        return;
    }
    
    activity_common::function_e1df676808c1d1e3( &function_4cd78e661617f3 );
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "mp_sat_avalon_q1_ob_activity_convoy_cs" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "mp_sat_avalon_q1_ob_activity_convoy_cs" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 3, eflags: 0x4
// Checksum 0xca43b2e5, Offset: 0x27a
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "mp_sat_avalon_q1_ob_activity_convoy_cs" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "mp_sat_avalon_q1_ob_activity_convoy_cs" );
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 3, eflags: 0x4
// Checksum 0xe5f51591, Offset: 0x2f4
// Size: 0x206
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q1_STADIUM", cf, ( -34128.7, 13078.4, 440 ), ( 0, 0, 0 ), "activity_nexus_spatial_zone", undefined, "OB_Spacer_Spatial_Zone", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 50 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    s.name = "ARMORED_CONVOY_Q1_STADIUM";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q1_STADIUM", cf, ( -34117.2, 12945.5, 440 ), ( 0, 0, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q1_TENNIS", cf, ( -36991.2, 25023.7, 1799.85 ), ( 0, 0, 0 ), "activity_nexus_spatial_zone", undefined, "OB_Spacer_Spatial_Zone", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 50 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    s.name = "ARMORED_CONVOY_Q1_TENNIS";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q1_TENNIS", cf, ( -13455.9, 37380.6, 939.07 ), ( 0, 0, 0 ), undefined, undefined, "activity_nexus_variant", "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0xea20b1e1, Offset: 0x502
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0
// Checksum 0x8106fa8, Offset: 0x50c
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "mp_sat_avalon_q1_ob_activity_convoy_cs" );
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0
// Checksum 0xbdf9a69a, Offset: 0x522
// Size: 0x66
function function_4cd78e661617f3()
{
    activityinfostruct = {};
    activityinfostruct.name = "REV_OB_ARMORED_CONVOY";
    activityinfostruct.scriptbundle = "sat_activitydefinition_armoredconvoy";
    activityinfostruct.mainfunction = &main;
    activityinfostruct.var_934f068483ae4ddb = &function_d4323822d7042e5a;
    activityinfostruct.metadatafunction = &function_d9dd7965c51c95d1;
    return activityinfostruct;
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 4
// Checksum 0xaeb9eb66, Offset: 0x591
// Size: 0x71
function function_d4323822d7042e5a( instancename, fe, us, cf = "mp_sat_avalon_q1_ob_activity_convoy_cs" )
{
    switch ( instancename )
    {
        case #"hash_90590d3def943873":
            function_3ec006a5007bc70b( fe, us, cf );
            break;
        case #"hash_2255fca2c0e44e07":
            function_5539eae3dc689fff( fe, us, cf );
            break;
    }
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 3
// Checksum 0x221c7a34, Offset: 0x60a
// Size: 0x2f
function function_3ec006a5007bc70b( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 3
// Checksum 0xfc8d6e2d, Offset: 0x641
// Size: 0x2f
function function_5539eae3dc689fff( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace mp_sat_avalon_q1_ob_activity_convoy_cs
// Params 0
// Checksum 0x2b3b847b, Offset: 0x678
// Size: 0x121
function function_d9dd7965c51c95d1()
{
    activityinstances = [];
    instancestruct = {};
    instancestruct.cf = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    instancestruct.scriptstructorigin = ( -34117.2, 12945.5, 440 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "ARMORED_CONVOY_Q1_STADIUM" ] = instancestruct;
    instancestruct = {};
    instancestruct.cf = "mp_sat_avalon_q1_ob_activity_convoy_cs";
    instancestruct.scriptstructorigin = ( -13455.9, 37380.6, 939.07 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "ARMORED_CONVOY_Q1_TENNIS" ] = instancestruct;
    return activityinstances;
}

