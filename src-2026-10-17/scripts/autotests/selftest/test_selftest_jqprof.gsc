#using scripts\autotests\autotests;

#namespace test_selftest_jqprof;

// Namespace test_selftest_jqprof/testautomation
// Params 0, eflags: 0x20
// Checksum 0x94f88f4e, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_jqprof", #"test", &start_test, &setup );
}

// Namespace test_selftest_jqprof
// Params 0
// Checksum 0x9e6d46cf, Offset: 0xa3
// Size: 0x4, Type: bool
function setup()
{
    return true;
}

// Namespace test_selftest_jqprof
// Params 0
// Checksum 0xc26004f0, Offset: 0xb0
// Size: 0x68, Type: bool
function start_test()
{
    bundle = autotests::get_test_bundle( #"test_selftest_jqprof" );
    setdvar( @"sv_jqprof_enabled", 1 );
    setdvar( @"sv_jqprof_continuous", 1 );
    waitframe();
    var_c71d7794c29a9ed6 = 1;
    runjqprofile( self.test.name, var_c71d7794c29a9ed6 );
    wait var_c71d7794c29a9ed6;
    return false;
}

