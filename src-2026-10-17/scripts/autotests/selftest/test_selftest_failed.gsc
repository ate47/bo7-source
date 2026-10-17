#using scripts\autotests\autotests;

#namespace test_selftest_failed;

// Namespace test_selftest_failed/testautomation
// Params 0, eflags: 0x20
// Checksum 0x9ef75ede, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_failed", #"test", &start_test, &setup );
}

// Namespace test_selftest_failed
// Params 0
// Checksum 0xb7b7e4f3, Offset: 0xa3
// Size: 0x1f, Type: bool
function setup()
{
    println( "<dev string:x24>" + getxhashsourcename( #"test_selftest_failed" ) );
    return true;
}

// Namespace test_selftest_failed
// Params 0
// Checksum 0xaaad0253, Offset: 0xcb
// Size: 0x3a, Type: bool
function start_test()
{
    bundle = autotests::get_test_bundle( #"test_selftest_failed" );
    println( "<dev string:x2e>" + getxhashsourcename( #"test_selftest_failed" ) );
    return true;
}

