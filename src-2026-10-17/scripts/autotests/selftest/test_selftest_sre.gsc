#using scripts\autotests\autotests;

#namespace test_selftest_sre;

// Namespace test_selftest_sre/testautomation
// Params 0, eflags: 0x20
// Checksum 0x7e6b8b02, Offset: 0x76
// Size: 0x20
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_sre", #"test", &start_test );
}

// Namespace test_selftest_sre
// Params 0
// Checksum 0xe433f32c, Offset: 0x9e
// Size: 0x3e
function start_test()
{
    println( "<dev string:x24>" + getxhashsourcename( #"test_selftest_sre" ) );
    println( "<dev string:x30>" );
    
    if ( undefined.size > 0 )
    {
        println( "<dev string:x5c>" );
    }
}

