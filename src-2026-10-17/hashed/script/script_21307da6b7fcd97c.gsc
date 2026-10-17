#using scripts\autotests\autotests;

#namespace test_gscunittest_patch_far;

// Namespace test_gscunittest_patch_far
// Params 0
// Checksum 0xdb95daac, Offset: 0xc3
// Size: 0x17
function patch_far()
{
    autotests::function_d84657f448aaeef6( "patch_far", 1, "scripts/autotests/gscunittest/test_gscunittest_patch_far.gsc", 7 );
}

// Namespace test_gscunittest_patch_far
// Params 0
// Checksum 0x8370eeb9, Offset: 0xe2
// Size: 0xe
function patch_far_notify()
{
    level notify( #"patch_far_notify" );
}

// Namespace test_gscunittest_patch_far
// Params 0
// Checksum 0x7aaf6b7b, Offset: 0xf8
// Size: 0x2
function patch_far_wait()
{
    
}

