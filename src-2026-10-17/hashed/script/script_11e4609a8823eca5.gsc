#using scripts\common\activity_nexus\activity_common;
#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace mp_sat_avalon_quad_04_ob_convoy_cs;

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0, eflags: 0x5
// Checksum 0x1a804278, Offset: 0x1c9
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"mp_sat_avalon_quad_04_ob_convoy_cs", #"activity_common", &function_b39ecd3d51489472, undefined );
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0xbbb870b3, Offset: 0x1f2
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0x3e83a35f, Offset: 0x203
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 2
// Checksum 0x8ed22066, Offset: 0x214
// Size: 0x8c
function main( unused, unused2 )
{
    if ( utility::flag_exist( "mp_sat_avalon_quad_04_ob_convoy_cs" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "mp_sat_avalon_quad_04_ob_convoy_cs" ) )
    {
        return;
    }
    
    activity_common::function_e1df676808c1d1e3( &function_4cd78e661617f3 );
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "mp_sat_avalon_quad_04_ob_convoy_cs" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "mp_sat_avalon_quad_04_ob_convoy_cs" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 3, eflags: 0x4
// Checksum 0xbd011790, Offset: 0x2a8
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "mp_sat_avalon_quad_04_ob_convoy_cs" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "mp_sat_avalon_quad_04_ob_convoy_cs" );
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 3, eflags: 0x4
// Checksum 0x438e16c2, Offset: 0x322
// Size: 0x2e3
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_SHIP_YARD", cf, ( 27057.9, -47224.2, 207.67 ), ( 0, 0, 0 ), "activity_nexus_spatial_zone", undefined, "OB_Spacer_Spatial_Zone", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 50 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    s.name = "ARMORED_CONVOY_Q4_SHIP_YARD";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_SHIP_YARD", cf, ( 27656.4, -47187.4, 207.18 ), ( 359.83, 0, -0.28 ), undefined, undefined, "activity_nexus_variant", "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    s.name = "ARMORED_CONVOY_Q4_CONSTRUCTION_SILOS";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_CONSTRUCTION_SILOS", cf, ( 48360.5, -5774.17, 358.61 ), ( 0, 0, 0 ), undefined, undefined, "activity_nexus_variant", "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_CONSTRUCTION_SILOS", cf, ( 59284.2, -22774.9, 2479.99 ), ( 0, 0, 0 ), "activity_nexus_spatial_zone", undefined, "OB_Spacer_Spatial_Zone", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 50 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_MOUNTAIN_RANGE", cf, ( 22255.2, -16590.8, 590.35 ), ( 0, 0, 0 ), "activity_nexus_spatial_zone", undefined, "OB_Spacer_Spatial_Zone", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 50 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_quad_04_ob_convoy_cs";
    s.name = "ARMORED_CONVOY_Q4_MOUNTAIN_RANGE";
    fe [[ f ]]( s, "ARMORED_CONVOY_Q4_MOUNTAIN_RANGE", cf, ( 22240.4, -16901.4, 561.55 ), ( 0, 0, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0, eflags: 0x4
// Checksum 0x9956942b, Offset: 0x60d
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0
// Checksum 0x7f52cadd, Offset: 0x617
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "mp_sat_avalon_quad_04_ob_convoy_cs" );
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0
// Checksum 0xcabb03ef, Offset: 0x62d
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

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 4
// Checksum 0x62242afb, Offset: 0x69c
// Size: 0x8b
function function_d4323822d7042e5a( instancename, fe, us, cf = "mp_sat_avalon_quad_04_ob_convoy_cs" )
{
    switch ( instancename )
    {
        case #"hash_e5b99a056183e3e8":
            function_c49a6a0293358e0( fe, us, cf );
            break;
        case #"hash_351cacdd05553be5":
            function_c6f0a0f8c5f55f1d( fe, us, cf );
            break;
        case #"hash_ecccdad6b02bf454":
            function_866cc51b94c43f8c( fe, us, cf );
            break;
    }
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 3
// Checksum 0x5e5889f4, Offset: 0x72f
// Size: 0x2f
function function_c49a6a0293358e0( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 3
// Checksum 0x72e02c1d, Offset: 0x766
// Size: 0x2f
function function_c6f0a0f8c5f55f1d( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 3
// Checksum 0xf948fc81, Offset: 0x79d
// Size: 0x2f
function function_866cc51b94c43f8c( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
}

// Namespace mp_sat_avalon_quad_04_ob_convoy_cs
// Params 0
// Checksum 0xf1da7e94, Offset: 0x7d4
// Size: 0x1a5
function function_d9dd7965c51c95d1()
{
    activityinstances = [];
    instancestruct = {};
    instancestruct.cf = "mp_sat_avalon_quad_04_ob_convoy_cs";
    instancestruct.scriptstructorigin = ( 27656.4, -47187.4, 207.18 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "ARMORED_CONVOY_Q4_SHIP_YARD" ] = instancestruct;
    instancestruct = {};
    instancestruct.cf = "mp_sat_avalon_quad_04_ob_convoy_cs";
    instancestruct.scriptstructorigin = ( 48360.5, -5774.17, 358.61 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "ARMORED_CONVOY_Q4_CONSTRUCTION_SILOS" ] = instancestruct;
    instancestruct = {};
    instancestruct.cf = "mp_sat_avalon_quad_04_ob_convoy_cs";
    instancestruct.scriptstructorigin = ( 22240.4, -16901.4, 561.55 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "ARMORED_CONVOY_Q4_MOUNTAIN_RANGE" ] = instancestruct;
    return activityinstances;
}

