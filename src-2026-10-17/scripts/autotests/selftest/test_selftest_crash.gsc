#using scripts\autotests\autotests;

#namespace test_selftest_crash;

// Namespace test_selftest_crash/testautomation
// Params 0, eflags: 0x20
// Checksum 0xecc4a4cc, Offset: 0x76
// Size: 0x20
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_crash", #"test", &start_test );
}

// Namespace test_selftest_crash
// Params 0
// Checksum 0xa9f55f09, Offset: 0x9e
// Size: 0x13, Type: bool
function start_test()
{
    /#
        adddebugcommand( "<dev string:x24>" );
    #/
    
    wait 1;
    return false;
}

