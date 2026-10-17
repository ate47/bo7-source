#using scripts\autotests\autotests;

#namespace test_selftest_async_assert;

// Namespace test_selftest_async_assert/testautomation
// Params 0, eflags: 0x20
// Checksum 0x13e618cd, Offset: 0x101
// Size: 0x20
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_async_assert", #"test", &start_test );
}

// Namespace test_selftest_async_assert
// Params 0
// Checksum 0x6d978dab, Offset: 0x129
// Size: 0x5b
function start_test()
{
    subfunction();
    var_69231c3b36769e5c = autotests::function_47d83c11a21b624e();
    var_63a718d91714219d = autotests::function_e50d1006e5d65c04( "Only 1 failure?", var_69231c3b36769e5c.size, 1, "scripts/autotests/selftest/test_selftest_async_assert.gsc", 16 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
}

// Namespace test_selftest_async_assert
// Params 0
// Checksum 0xea581bb0, Offset: 0x18c
// Size: 0x54
function subfunction()
{
    var_63a718d91714219d = autotests::function_d84657f448aaeef6( "Sub Assert", 0, "scripts/autotests/selftest/test_selftest_async_assert.gsc", 21 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    autotests::function_d84657f448aaeef6( "Set test_fail should not run after assert", 0, "scripts/autotests/selftest/test_selftest_async_assert.gsc", 22 );
}

