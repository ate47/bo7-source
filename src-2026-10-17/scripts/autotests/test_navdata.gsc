#using scripts\autotests\autotests;

#namespace test_navdata;

// Namespace test_navdata/testautomation
// Params 0, eflags: 0x20
// Checksum 0x966b255f, Offset: 0x10f
// Size: 0x21
function event_handler[testautomation] main()
{
    autotests::register_tests( "scripts/autotests/test_navdata.gsc", #"ai", &start_test, &setup );
}

// Namespace test_navdata
// Params 0
// Checksum 0x2fde3a67, Offset: 0x138
// Size: 0xb, Type: bool
function setup()
{
    autotests::function_5c8c87763724c132();
    return true;
}

// Namespace test_navdata
// Params 0
// Checksum 0xe9578493, Offset: 0x14c
// Size: 0xaa, Type: bool
function start_test()
{
    bundle = autotests::get_test_bundle( self.test.xhash_ref );
    autotests::function_d84657f448aaeef6( "Map has navmesh?", isnavmeshloaded(), "scripts/autotests/test_navdata.gsc", 24 );
    nav_bounds = getnavbounds();
    autotests::function_d84657f448aaeef6( "Map has nav bounds?", isdefined( nav_bounds ), "scripts/autotests/test_navdata.gsc", 27 );
    autotests::function_d84657f448aaeef6( "Map has tacgraph?", hastacgraph(), "scripts/autotests/test_navdata.gsc", 29 );
    autotests::function_e5040106e5cc1c59( "Map has nav zones?", getzonecount(), 0, "scripts/autotests/test_navdata.gsc", 31 );
    autotests::function_e5040106e5cc1c59( "Map has fixed path nodes?", getpathfixednodecount(), 0, "scripts/autotests/test_navdata.gsc", 33 );
    return false;
}

