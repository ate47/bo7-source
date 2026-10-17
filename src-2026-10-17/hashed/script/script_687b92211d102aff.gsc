#using scripts\common\activity_nexus\activity_common;
#using scripts\common\create_script_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs;

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0, eflags: 0x5
// Checksum 0x4618586e, Offset: 0x1c5
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"mp_sat_avalon_q2_ob_activity_cradle_vent_cs", #"activity_common", &function_b39ecd3d51489472, undefined );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0, eflags: 0x4
// Checksum 0xb73a03e9, Offset: 0x1ee
// Size: 0x9
function private function_b39ecd3d51489472()
{
    thread structs_init();
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0, eflags: 0x4
// Checksum 0x3201d005, Offset: 0x1ff
// Size: 0x9
function private structs_init()
{
    main();
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 2
// Checksum 0xd973b29c, Offset: 0x210
// Size: 0x8c
function main( unused, unused2 )
{
    if ( utility::flag_exist( "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" ) )
    {
        return;
    }
    
    if ( !create_script_utility::filter( "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" ) )
    {
        return;
    }
    
    activity_common::function_e1df676808c1d1e3( &function_4cd78e661617f3 );
    us = create_script_utility::function_4579dd5df27ceeca();
    utility::flag_init( "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" );
    s = {};
    level thread cs_return_and_wait_for_flag( us, s, "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" );
    
    if ( !create_script_utility::cs_is_starttime() )
    {
        create_script_utility::endcreatescript( s );
    }
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3, eflags: 0x4
// Checksum 0xb18364ca, Offset: 0x2a4
// Size: 0x72
function private cs_return_and_wait_for_flag( us, s, cf )
{
    level endon( #"game_ended" );
    create_script_utility::wait_for_cs_flag( cf );
    
    if ( !isdefined( us ) )
    {
        us = "pfx";
    }
    
    s create_script_utility::cs_setup_arrays( us, "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" );
    create_script_utility::cs_flags_init( s );
    level thread createstructs( s, us, cf );
    level thread create_script_utility::wait_for_flags( s, "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3, eflags: 0x4
// Checksum 0xbe40c07a, Offset: 0x31e
// Size: 0x408
function private createstructs( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.activity_bundle = "sat_activitydefinition_cradle_vents";
    s.name = "CRADLE_VENTS_STABLE";
    fe [[ f ]]( s, "CRADLE_VENTS_STABLE", cf, ( 33815.5, 47357.9, 1414.74 ), ( 0, 86, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    fe [[ f ]]( s, "CRADLE_VENTS_STABLE", cf, ( 33936.3, 47463.1, 1415.25 ), ( 0, 86, 0 ), "activity_nexus_spatial_zone", undefined, "join_radius", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 2500 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.activity_bundle = "sat_activitydefinition_cradle_vents";
    s.name = "CRADLE_VENTS_FIELD";
    fe [[ f ]]( s, "CRADLE_VENTS_FIELD", cf, ( 3920.64, 40751.5, 464.37 ), ( 0, 164.6, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    fe [[ f ]]( s, "CRADLE_VENTS_FIELD", cf, ( 3801.39, 40844.7, 451.31 ), ( 0, 164.6, 0 ), "activity_nexus_spatial_zone", undefined, "join_radius", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 2500 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.activity_bundle = "sat_activitydefinition_cradle_vents";
    s.name = "CRADLE_VENTS_POLICE";
    fe [[ f ]]( s, "CRADLE_VENTS_POLICE", cf, ( 1605.3, 25470.2, 502.59 ), ( 350.41, 282.82, -0.74 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    fe [[ f ]]( s, "CRADLE_VENTS_POLICE", cf, ( 1578.87, 25324.7, 504.72 ), ( 350.41, 282.82, -0.74 ), "activity_nexus_spatial_zone", undefined, "join_radius", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 2500 );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.activity_bundle = "sat_activitydefinition_cradle_vents";
    s.name = "CRADLE_VENTS_COLOSSEUM";
    fe [[ f ]]( s, "CRADLE_VENTS_COLOSSEUM", cf, ( 47158.3, 19268.8, 282.76 ), ( 0, 296.9, 0 ), "activity_nexus_variant", undefined, undefined, "activity_link", undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    fe [[ f ]]( s, "CRADLE_VENTS_COLOSSEUM", cf, ( 47108.7, 19116.6, 287.09 ), ( 0, 296.9, 0 ), "activity_nexus_spatial_zone", undefined, "join_radius", undefined, "activity_link", ( 0, 0, 0 ), ( 0, 0, 0 ), 2500 );
    fe utility::ent_flag_set( "cs_objects_created" );
    function_75f4a755dfd427b6();
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0, eflags: 0x4
// Checksum 0xcef706d1, Offset: 0x72e
// Size: 0x2
function private function_75f4a755dfd427b6()
{
    
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0
// Checksum 0x73d0b987, Offset: 0x738
// Size: 0xe
function cleanup()
{
    create_script_utility::cleanup_cs_file_structs( "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0
// Checksum 0x1ef46eb6, Offset: 0x74e
// Size: 0x66
function function_4cd78e661617f3()
{
    activityinfostruct = {};
    activityinfostruct.name = "REV_OB_CRADLE_VENTS";
    activityinfostruct.scriptbundle = "sat_activitydefinition_cradle_vents";
    activityinfostruct.mainfunction = &main;
    activityinfostruct.var_934f068483ae4ddb = &function_d4323822d7042e5a;
    activityinfostruct.metadatafunction = &function_d9dd7965c51c95d1;
    return activityinfostruct;
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 4
// Checksum 0xc45f525f, Offset: 0x7bd
// Size: 0xa5
function function_d4323822d7042e5a( instancename, fe, us, cf = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs" )
{
    switch ( instancename )
    {
        case #"hash_3a7e8de9e525b10d":
            function_a136f6bed94a5e65( fe, us, cf );
            break;
        case #"hash_eace2f85adf0874e":
            function_2bc5e6e73418c366( fe, us, cf );
            break;
        case #"hash_2c1bf74ad429c198":
            function_809e62ef5775ed90( fe, us, cf );
            break;
        case #"hash_2b41c39d0dbc3980":
            function_bbf12add1e0bbc78( fe, us, cf );
            break;
    }
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3
// Checksum 0x7613bb8d, Offset: 0x86a
// Size: 0xab
function function_a136f6bed94a5e65( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.name = "power_core";
    fe [[ f ]]( s, "CRADLE_VENTS_STABLE", cf, ( 33968.3, 47431.9, 1415.39 ), ( 0, 230.69, 0 ), "power_core", undefined, "CRADLE_VENTS_STABLE", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3
// Checksum 0xc2b8e068, Offset: 0x91d
// Size: 0xab
function function_2bc5e6e73418c366( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.name = "power_core";
    fe [[ f ]]( s, "CRADLE_VENTS_FIELD", cf, ( 3838.3, 40869.9, 449.47 ), ( 354.4, 309.29, 0 ), "power_core", undefined, "CRADLE_VENTS_FIELD", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3
// Checksum 0x19261b37, Offset: 0x9d0
// Size: 0xab
function function_809e62ef5775ed90( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.name = "power_core";
    fe [[ f ]]( s, "CRADLE_VENTS_POLICE", cf, ( 1539.3, 25344.9, 503.33 ), ( 359.87, 67.82, -2.32 ), "power_core", undefined, "CRADLE_VENTS_POLICE", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 3
// Checksum 0x1f6a478c, Offset: 0xa83
// Size: 0xab
function function_bbf12add1e0bbc78( fe, us, cf )
{
    f = &create_script_utility::strike_additem;
    s = {};
    s.script_cs_flag = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    s.name = "power_core";
    fe [[ f ]]( s, "CRADLE_VENTS_COLOSSEUM", cf, ( 47065.2, 19126.9, 286.19 ), ( 0, 81.59, 0 ), "power_core", undefined, "CRADLE_VENTS_COLOSSEUM", undefined, undefined, ( 0, 0, 0 ), ( 0, 0, 0 ) );
}

// Namespace mp_sat_avalon_q2_ob_activity_cradle_vent_cs
// Params 0
// Checksum 0x2eff682a, Offset: 0xb36
// Size: 0x26d
function function_d9dd7965c51c95d1()
{
    activityinstances = [];
    instancestruct = {};
    instancestruct.scriptbundle = "sat_activitydefinition_cradle_vents";
    instancestruct.cf = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    instancestruct.scriptstructorigin = ( 33815.5, 47357.9, 1414.74 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "CRADLE_VENTS_STABLE" ] = instancestruct;
    instancestruct = {};
    instancestruct.scriptbundle = "sat_activitydefinition_cradle_vents";
    instancestruct.cf = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    instancestruct.scriptstructorigin = ( 3920.64, 40751.5, 464.37 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "CRADLE_VENTS_FIELD" ] = instancestruct;
    instancestruct = {};
    instancestruct.scriptbundle = "sat_activitydefinition_cradle_vents";
    instancestruct.cf = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    instancestruct.scriptstructorigin = ( 1605.3, 25470.2, 502.59 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "CRADLE_VENTS_POLICE" ] = instancestruct;
    instancestruct = {};
    instancestruct.scriptbundle = "sat_activitydefinition_cradle_vents";
    instancestruct.cf = "mp_sat_avalon_q2_ob_activity_cradle_vent_cs";
    instancestruct.scriptstructorigin = ( 47158.3, 19268.8, 282.76 );
    instancestruct.scriptstructoriginoffset = ( 0, 0, 0 );
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_ccd7cc494eeab31b = [];
    instancestruct.locationradius = [];
    activityinstances[ "CRADLE_VENTS_COLOSSEUM" ] = instancestruct;
    return activityinstances;
}

