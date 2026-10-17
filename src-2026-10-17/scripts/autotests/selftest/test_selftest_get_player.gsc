#using scripts\autotests\autotests;
#using scripts\autotests\autotests_utility_player;

#namespace test_selftest_get_player;

// Namespace test_selftest_get_player/testautomation
// Params 0, eflags: 0x20
// Checksum 0x68c409d6, Offset: 0x76
// Size: 0x25
function event_handler[testautomation] main()
{
    autotests::register_test( #"test_selftest_get_player", #"test", &start_test, &setup );
}

// Namespace test_selftest_get_player
// Params 0
// Checksum 0xde8e5f59, Offset: 0xa3
// Size: 0x8
function setup()
{
    return autotests::function_5c8c87763724c132();
}

// Namespace test_selftest_get_player
// Params 0
// Checksum 0xcc1bb9cc, Offset: 0xb4
// Size: 0x15, Type: bool
function start_test()
{
    player = autotests_utility_player::get_player();
    return false;
}

