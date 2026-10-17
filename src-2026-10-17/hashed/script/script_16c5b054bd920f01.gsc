#using scripts\common\callbacks;

#namespace specialty_faster_crouch_prone;

// Namespace specialty_faster_crouch_prone
// Params 0, eflags: 0x5
// Checksum 0xda8fd899, Offset: 0x97
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_b3e5e26595e24a92 );
}

// Namespace specialty_faster_crouch_prone
// Params 1, eflags: 0x4
// Checksum 0x528d377b, Offset: 0xb7
// Size: 0x32
function private function_b3e5e26595e24a92( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_faster_crouch_prone", undefined, undefined, [] );
    }
}

