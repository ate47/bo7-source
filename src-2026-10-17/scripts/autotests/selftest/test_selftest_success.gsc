#using scripts\autotests\autotests;

#namespace test_selftest_success;

// Namespace test_selftest_success/testautomation
// Params 0, eflags: 0x20
// Checksum 0xea1ecc0c, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_success", #"test", &start_test, &setup );
}

// Namespace test_selftest_success
// Params 0
// Checksum 0xc35e7621, Offset: 0xa3
// Size: 0x1f, Type: bool
function setup()
{
    println( "<dev string:x24>" + getxhashsourcename( #"test_selftest_success" ) );
    return true;
}

// Namespace test_selftest_success
// Params 0
// Checksum 0xd20ffbd4, Offset: 0xcb
// Size: 0x39, Type: bool
function start_test()
{
    bundle = autotests::get_test_bundle( #"test_selftest_success" );
    println( "<dev string:x2e>" + getxhashsourcename( #"test_selftest_success" ) );
    return false;
}

