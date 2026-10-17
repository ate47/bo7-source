#using scripts\mp\flags;

#namespace mp_sat_coolant_fx;

// Namespace mp_sat_coolant_fx
// Params 0
// Checksum 0x4213a4b6, Offset: 0x9e
// Size: 0xa
function main()
{
    level thread function_15c103706a01e62e();
}

// Namespace mp_sat_coolant_fx
// Params 0, eflags: 0x4
// Checksum 0xb9a0d70b, Offset: 0xb0
// Size: 0x27
function private function_15c103706a01e62e()
{
    level endon( #"hash_ae78a05a1f3ffddb" );
    level flags::function_2f3408423ccc9b2e( "potg_finalized" );
    activateworldevent( "we_vfx_camera_snow", 1 );
}

