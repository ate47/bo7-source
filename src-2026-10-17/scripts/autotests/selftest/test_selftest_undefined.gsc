#using scripts\autotests\autotests;

#namespace test_selftest_undefined;

// Namespace test_selftest_undefined/testautomation
// Params 0, eflags: 0x20
// Checksum 0x156833ac, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_undefined", #"test", &start_test, &setup );
}

// Namespace test_selftest_undefined
// Params 0
// Checksum 0x3c288981, Offset: 0xa3
// Size: 0x1f, Type: bool
function setup()
{
    println( "<dev string:x24>" + getxhashsourcename( #"test_selftest_undefined" ) );
    return true;
}

// Namespace test_selftest_undefined
// Params 0
// Checksum 0xbc704b81, Offset: 0xcb
// Size: 0x38
function start_test()
{
    bundle = autotests::get_test_bundle( #"test_selftest_undefined" );
    println( "<dev string:x2e>" + getxhashsourcename( #"test_selftest_undefined" ) );
}

