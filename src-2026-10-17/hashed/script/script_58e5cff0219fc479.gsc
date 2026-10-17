#using scripts\common\callbacks;

#namespace specialty_hip_fire_spread_reduce;

// Namespace specialty_hip_fire_spread_reduce
// Params 0, eflags: 0x5
// Checksum 0xf502d816, Offset: 0x9a
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_74e3998a4d75f11d );
}

// Namespace specialty_hip_fire_spread_reduce
// Params 1, eflags: 0x4
// Checksum 0x3ad8767a, Offset: 0xba
// Size: 0x32
function private function_74e3998a4d75f11d( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_hip_fire_spread_reduce", undefined, undefined, [] );
    }
}

