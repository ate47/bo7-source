#using scripts\common\callbacks;

#namespace specialty_grenadier;

// Namespace specialty_grenadier
// Params 0, eflags: 0x1
// Checksum 0x50337314, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_grenadier
// Params 1
// Checksum 0x11fda1e1, Offset: 0xad
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_grenadier", undefined, undefined, [] );
    }
}

