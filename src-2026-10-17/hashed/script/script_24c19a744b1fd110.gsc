#using scripts\common\callbacks;

#namespace specialty_jump_ads_reduce;

// Namespace specialty_jump_ads_reduce
// Params 0, eflags: 0x5
// Checksum 0x220b33cb, Offset: 0x93
// Size: 0x2b
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_cfe9203c28947acd );
    setdvar( @"hash_f6c17e8b6d373bee", 1.3 );
}

// Namespace specialty_jump_ads_reduce
// Params 1, eflags: 0x4
// Checksum 0x44372e1d, Offset: 0xc6
// Size: 0x32
function private function_cfe9203c28947acd( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_jump_ads_reduce", undefined, undefined, [] );
    }
}

