#using scripts\common\callbacks;

#namespace specialty_crouch_reduce_recoil;

// Namespace specialty_crouch_reduce_recoil
// Params 0, eflags: 0x5
// Checksum 0xcf0ca6c2, Offset: 0x98
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_e13e6cb3878dc179 );
}

// Namespace specialty_crouch_reduce_recoil
// Params 1, eflags: 0x4
// Checksum 0x6c2bbdf7, Offset: 0xb8
// Size: 0x32
function private function_e13e6cb3878dc179( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_crouch_reduce_recoil", undefined, undefined, [] );
    }
}

