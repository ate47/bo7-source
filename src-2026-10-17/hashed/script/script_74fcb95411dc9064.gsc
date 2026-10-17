#using scripts\common\callbacks;

#namespace specialty_prone_reduce_recoil;

// Namespace specialty_prone_reduce_recoil
// Params 0, eflags: 0x5
// Checksum 0xc49b3795, Offset: 0x97
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_cdab331b95aec68f );
}

// Namespace specialty_prone_reduce_recoil
// Params 1, eflags: 0x4
// Checksum 0x1459a66a, Offset: 0xb7
// Size: 0x32
function private function_cdab331b95aec68f( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_prone_reduce_recoil", undefined, undefined, [] );
    }
}

