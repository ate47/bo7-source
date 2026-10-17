#using scripts\common\callbacks;

#namespace specialty_sliding_ads_speed_reduce;

// Namespace specialty_sliding_ads_speed_reduce
// Params 0, eflags: 0x5
// Checksum 0x35349cb1, Offset: 0x9c
// Size: 0x2b
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_e30ce4fdc42670d4 );
    setdvar( @"hash_f6007dad9d1c506e", 1.3 );
}

// Namespace specialty_sliding_ads_speed_reduce
// Params 1, eflags: 0x4
// Checksum 0x4dc1bdb2, Offset: 0xcf
// Size: 0x32
function private function_e30ce4fdc42670d4( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_sliding_ads_speed_reduce", undefined, undefined, [] );
    }
}

