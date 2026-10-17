#using scripts\common\utility;

#namespace virgo_lighting;

// Namespace virgo_lighting
// Params 0
// Checksum 0xbe324a52, Offset: 0xf3
// Size: 0x2
function main()
{
    
}

// Namespace virgo_lighting
// Params 0
// Checksum 0x4043061d, Offset: 0xfd
// Size: 0x6a
function function_830efdc5e59d5260()
{
    utility::flag_wait( "flag_intro_to_inverted_bink_done" );
    function_290c267015661b7a( #"hash_31adff910522475b" );
    utility::flag_wait( "flag_frogger_to_crashsite_bink_done" );
    function_290c267015661b7a( #"hash_d3e9e670203e5b9b" );
    utility::flag_wait( "flag_void_1_bink_done" );
    function_290c267015661b7a( #"gate_japan" );
    utility::flag_wait( "flag_void_2_bink_done" );
    function_290c267015661b7a( #"gate_carrier" );
}

