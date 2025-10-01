#using scripts\common\callbacks;

#namespace specialty_gungho;

// Namespace specialty_gungho
// Params 0, eflags: 0x1
// Checksum 0xcc62aaf8, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_gungho
// Params 1
// Checksum 0x5b0af09f, Offset: 0xb4
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_gungho", undefined, undefined, [] );
    }
}

