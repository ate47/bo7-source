#using scripts\autotests\autotests;

#namespace test_selftest_validation_failed;

// Namespace test_selftest_validation_failed/testautomation
// Params 0, eflags: 0x20
// Checksum 0xaeeb9d70, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_validation_failed", #"test", &start_test, &setup );
}

// Namespace test_selftest_validation_failed
// Params 0
// Checksum 0x87ab275c, Offset: 0xa3
// Size: 0x1e, Type: bool
function setup()
{
    println( "<dev string:x24>" + getxhashsourcename( #"test_selftest_validation_failed" ) );
    return false;
}

// Namespace test_selftest_validation_failed
// Params 0
// Checksum 0xedcbc1ca, Offset: 0xca
// Size: 0x39, Type: bool
function start_test()
{
    bundle = autotests::get_test_bundle( #"test_selftest_validation_failed" );
    println( "<dev string:x2e>" + getxhashsourcename( #"test_selftest_validation_failed" ) );
    return false;
}

