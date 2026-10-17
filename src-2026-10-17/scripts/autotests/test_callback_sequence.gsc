#using scripts\autotests\autotests;
#using scripts\common\callback_sequence;

#namespace test_callback_sequence;

// Namespace test_callback_sequence/testautomation
// Params 0, eflags: 0x20
// Checksum 0x3813419c, Offset: 0x360
// Size: 0x21
function event_handler[testautomation] main()
{
    autotests::register_tests( "scripts/autotests/test_callback_sequence.gsc", #"test", &start_test, &setup );
}

// Namespace test_callback_sequence
// Params 0
// Checksum 0x9e0606fb, Offset: 0x389
// Size: 0x8
function setup()
{
    return autotests::function_5c8c87763724c132();
}

// Namespace test_callback_sequence
// Params 0, eflags: 0x4
// Checksum 0x120c355, Offset: 0x39a
// Size: 0xa, Type: bool
function private start_test()
{
    test_callback_sequence();
    return false;
}

// Namespace test_callback_sequence
// Params 0, eflags: 0x4
// Checksum 0x413bc9, Offset: 0x3ad
// Size: 0x5cf
function private test_callback_sequence()
{
    level callback::register_sequence( #"callback_sequence_test", [ 4:#"hash_95ae327751c12574", 3:#"hash_95ae337751c12727", #"hash_95ae307751c1220e", 1:#"hash_95ae317751c123c1", 0:#"hash_95ae2e7751c11ea8" ] );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae307751c1220e", &function_d07affed28c25cd9 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae2e7751c11ea8", &function_d07afded28c25873 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae327751c12574", &function_d07b01ed28c2613f );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae317751c123c1", &function_d07afeed28c25aa6 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae337751c12727", &function_d07b00ed28c25f0c );
    params = setup_callback_params();
    level callback::callback_sequence( #"callback_sequence_test", params );
    autotests::function_e50d1006e5d65c04( "Step A Handled", params.var_a4e224eefe3d4285, 1, "scripts/autotests/test_callback_sequence.gsc", 55 );
    autotests::function_e50d1006e5d65c04( "Step B Handled", params.var_23ae097463c73e60, 1, "scripts/autotests/test_callback_sequence.gsc", 56 );
    autotests::function_e50d1006e5d65c04( "Step C Handled", params.var_bffe3730e24529b3, 1, "scripts/autotests/test_callback_sequence.gsc", 57 );
    autotests::function_e50d1006e5d65c04( "Step D Handled", params.var_2e7a5b047861730e, 1, "scripts/autotests/test_callback_sequence.gsc", 58 );
    autotests::function_e50d1006e5d65c04( "Step E Handled", params.var_21cc49b38aa6a521, 1, "scripts/autotests/test_callback_sequence.gsc", 59 );
    autotests::function_e50d1006e5d65c04( "Step A Order Handled", params.var_a147acc61bc609d1, 1, "scripts/autotests/test_callback_sequence.gsc", 61 );
    autotests::function_e50d1006e5d65c04( "Step B Order Handled", params.var_af38d2c5a79bc60a, 2, "scripts/autotests/test_callback_sequence.gsc", 62 );
    autotests::function_e50d1006e5d65c04( "Step C Order Handled", params.var_d45cb737400c4beb, 3, "scripts/autotests/test_callback_sequence.gsc", 63 );
    autotests::function_e50d1006e5d65c04( "Step D Order Handled", params.var_4bd00228c8984a6c, 4, "scripts/autotests/test_callback_sequence.gsc", 64 );
    autotests::function_e50d1006e5d65c04( "Step E Order Handled", params.var_3723f55ac0656255, 5, "scripts/autotests/test_callback_sequence.gsc", 65 );
    level callback::function_a5ba9bab3a8b0b6( #"callback_sequence_test", #"hash_95ae317751c123c1", &function_d07afeed28c25aa6 );
    level callback::function_a5ba9bab3a8b0b6( #"callback_sequence_test", #"hash_95ae337751c12727", &function_d07b00ed28c25f0c );
    params = setup_callback_params();
    level callback::callback_sequence( #"callback_sequence_test", params );
    autotests::function_e50d1006e5d65c04( "2.Step A Handled", params.var_a4e224eefe3d4285, 1, "scripts/autotests/test_callback_sequence.gsc", 75 );
    autotests::function_dbbd10e009ede41e( "2.Step B Not Handled", params.var_23ae097463c73e60, "scripts/autotests/test_callback_sequence.gsc", 76 );
    autotests::function_e50d1006e5d65c04( "2.Step C Handled", params.var_bffe3730e24529b3, 1, "scripts/autotests/test_callback_sequence.gsc", 77 );
    autotests::function_dbbd10e009ede41e( "2.Step D Not Handled", params.var_2e7a5b047861730e, "scripts/autotests/test_callback_sequence.gsc", 78 );
    autotests::function_e50d1006e5d65c04( "2.Step E Handled", params.var_21cc49b38aa6a521, 1, "scripts/autotests/test_callback_sequence.gsc", 79 );
    autotests::function_e50d1006e5d65c04( "2.Step A Order Handled", params.var_a147acc61bc609d1, 1, "scripts/autotests/test_callback_sequence.gsc", 81 );
    autotests::function_dbbd10e009ede41e( "2.Step B No Order Handled", params.var_af38d2c5a79bc60a, "scripts/autotests/test_callback_sequence.gsc", 82 );
    autotests::function_e50d1006e5d65c04( "2.Step C Order Handled", params.var_d45cb737400c4beb, 2, "scripts/autotests/test_callback_sequence.gsc", 83 );
    autotests::function_dbbd10e009ede41e( "2.Step D No Order Handled", params.var_4bd00228c8984a6c, "scripts/autotests/test_callback_sequence.gsc", 84 );
    autotests::function_e50d1006e5d65c04( "2.Step E Order Handled", params.var_3723f55ac0656255, 3, "scripts/autotests/test_callback_sequence.gsc", 85 );
    waitframe();
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae2e7751c11ea8", &function_fb7d47175d8552cf );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae2e7751c11ea8", &function_fb7d48175d855502 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae2e7751c11ea8", &function_fb7d49175d855735 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae307751c1220e", &function_184d151772906e19 );
    level callback::function_dc654a4d4126a928( #"callback_sequence_test", #"hash_95ae307751c1220e", &function_184d121772906780 );
    params = setup_callback_params();
    level callback::callback_sequence( #"callback_sequence_test", params );
    autotests::function_e50d1006e5d65c04( "3.Step A Handled", params.var_a4e224eefe3d4285, 1, "scripts/autotests/test_callback_sequence.gsc", 102 );
    autotests::function_dbbd10e009ede41e( "3.Step B Not Handled", params.var_23ae097463c73e60, "scripts/autotests/test_callback_sequence.gsc", 103 );
    autotests::function_e50d1006e5d65c04( "3.Step C Handled", params.var_bffe3730e24529b3, 1, "scripts/autotests/test_callback_sequence.gsc", 104 );
    autotests::function_dbbd10e009ede41e( "3.Step D Not Handled", params.var_2e7a5b047861730e, "scripts/autotests/test_callback_sequence.gsc", 105 );
    autotests::function_e50d1006e5d65c04( "3.Step E Handled", params.var_21cc49b38aa6a521, 1, "scripts/autotests/test_callback_sequence.gsc", 106 );
    autotests::function_e50d1006e5d65c04( "3.Step A Order Handled", params.var_a147acc61bc609d1, 4, "scripts/autotests/test_callback_sequence.gsc", 108 );
    autotests::function_dbbd10e009ede41e( "3.Step B No Order Handled", params.var_af38d2c5a79bc60a, "scripts/autotests/test_callback_sequence.gsc", 109 );
    autotests::function_e50d1006e5d65c04( "3.Step C Order Handled", params.var_d45cb737400c4beb, 7, "scripts/autotests/test_callback_sequence.gsc", 110 );
    autotests::function_dbbd10e009ede41e( "3.Step D No Order Handled", params.var_4bd00228c8984a6c, "scripts/autotests/test_callback_sequence.gsc", 111 );
    autotests::function_e50d1006e5d65c04( "3.Step E Order Handled", params.var_3723f55ac0656255, 8, "scripts/autotests/test_callback_sequence.gsc", 112 );
}

// Namespace test_callback_sequence
// Params 0, eflags: 0x4
// Checksum 0xa06f8187, Offset: 0x984
// Size: 0x18
function private setup_callback_params()
{
    return { #var_edaa7b796202470f:0, #is_unit_test:1 };
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0xc60d2c8a, Offset: 0x9a5
// Size: 0x3d
function private function_d07afded28c25873( params )
{
    params.var_edaa7b796202470f++;
    params.var_a147acc61bc609d1 = params.var_edaa7b796202470f;
    params.var_a4e224eefe3d4285 = 1;
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x8dbefaf6, Offset: 0x9ea
// Size: 0x3d
function private function_d07afeed28c25aa6( params )
{
    params.var_edaa7b796202470f++;
    params.var_af38d2c5a79bc60a = params.var_edaa7b796202470f;
    params.var_23ae097463c73e60 = 1;
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x200b51d, Offset: 0xa2f
// Size: 0x3d
function private function_d07affed28c25cd9( params )
{
    params.var_edaa7b796202470f++;
    params.var_d45cb737400c4beb = params.var_edaa7b796202470f;
    params.var_bffe3730e24529b3 = 1;
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x1ad9560e, Offset: 0xa74
// Size: 0x3d
function private function_d07b00ed28c25f0c( params )
{
    params.var_edaa7b796202470f++;
    params.var_4bd00228c8984a6c = params.var_edaa7b796202470f;
    params.var_2e7a5b047861730e = 1;
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x956719e5, Offset: 0xab9
// Size: 0x3d
function private function_d07b01ed28c2613f( params )
{
    params.var_edaa7b796202470f++;
    params.var_3723f55ac0656255 = params.var_edaa7b796202470f;
    params.var_21cc49b38aa6a521 = 1;
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x57a34625, Offset: 0xafe
// Size: 0x15
function private function_fb7d47175d8552cf( params )
{
    function_d07afded28c25873( params );
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0xceaa179f, Offset: 0xb1b
// Size: 0x15
function private function_fb7d48175d855502( params )
{
    function_d07afded28c25873( params );
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0xb9ad2709, Offset: 0xb38
// Size: 0x15
function private function_fb7d49175d855735( params )
{
    function_d07afded28c25873( params );
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0xba29f367, Offset: 0xb55
// Size: 0x15
function private function_184d151772906e19( params )
{
    function_d07affed28c25cd9( params );
}

// Namespace test_callback_sequence
// Params 1, eflags: 0x4
// Checksum 0x2320a2dd, Offset: 0xb72
// Size: 0x15
function private function_184d121772906780( params )
{
    function_d07affed28c25cd9( params );
}

