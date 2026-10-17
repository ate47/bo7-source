#using scripts\common\callbacks;

#namespace specialty_gpsjammer;

// Namespace specialty_gpsjammer
// Params 0, eflags: 0x1
// Checksum 0x332fd6e6, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_gpsjammer
// Params 1
// Checksum 0x5022298e, Offset: 0xad
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_gpsjammer", undefined, undefined, [] );
    }
}

