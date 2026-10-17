#using scripts\common\callbacks;

#namespace specialty_adaptive_sprint_fire;

// Namespace specialty_adaptive_sprint_fire
// Params 0, eflags: 0x5
// Checksum 0x985ed7cf, Offset: 0x98
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_22a35467549ed4b );
}

// Namespace specialty_adaptive_sprint_fire
// Params 1, eflags: 0x4
// Checksum 0xd24043ec, Offset: 0xb8
// Size: 0x32
function private function_22a35467549ed4b( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_adaptive_sprint_fire", undefined, undefined, [] );
    }
}

