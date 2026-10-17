#using scripts\common\callbacks;

#namespace specialty_fire_delay_sliding_reduce;

// Namespace specialty_fire_delay_sliding_reduce
// Params 0, eflags: 0x5
// Checksum 0x39b67a55, Offset: 0x9d
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_92a0fdbb6df89f42 );
}

// Namespace specialty_fire_delay_sliding_reduce
// Params 1, eflags: 0x4
// Checksum 0xb94163ae, Offset: 0xbd
// Size: 0x32
function private function_92a0fdbb6df89f42( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_fire_delay_sliding_reduce", undefined, undefined, [] );
    }
}

