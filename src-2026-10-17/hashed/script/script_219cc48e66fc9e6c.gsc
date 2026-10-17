#using scripts\autotests\autotests;
#using scripts\autotests\autotests_utility;
#using scripts\common\system;
#using scripts\common\utility;

#namespace autotests_utility_mp;

// Namespace autotests_utility_mp
// Params 0, eflags: 0x5
// Checksum 0xe5b3df1a, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"autotests_utility_mp", undefined, undefined, &init_post_main );
}

// Namespace autotests_utility_mp
// Params 0
// Checksum 0x65f15e5b, Offset: 0x97
// Size: 0x3e
function init_post_main()
{
    utility::registersharedfunc( #"autotest", #"setup", &setup );
    utility::registersharedfunc( #"autotest", #"cleanup", &cleanup );
}

// Namespace autotests_utility_mp
// Params 1, eflags: 0x4
// Checksum 0xfcf1afe8, Offset: 0xdd
// Size: 0x5a
function private setup( params )
{
    bundle = autotests::get_test_bundle( self.test.xhash_ref );
    level.autotests.test_runtime.bundle = bundle;
    autotests_utility::function_ecdb840c49382ae5( bundle );
}

// Namespace autotests_utility_mp
// Params 0, eflags: 0x4
// Checksum 0xc4683626, Offset: 0x13f
// Size: 0x2
function private cleanup()
{
    
}

