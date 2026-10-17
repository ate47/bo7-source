#using scripts\common\callbacks;

#namespace specialty_sprintoffhand;

// Namespace specialty_sprintoffhand
// Params 0, eflags: 0x1
// Checksum 0x486f0b27, Offset: 0x91
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_sprintoffhand
// Params 1
// Checksum 0x2b62f44f, Offset: 0xb1
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_sprintoffhand", undefined, undefined, [] );
    }
}

