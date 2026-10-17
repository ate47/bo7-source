#using scripts\common\callbacks;

#namespace specialty_tempered;

// Namespace specialty_tempered
// Params 0, eflags: 0x1
// Checksum 0xfd05d25d, Offset: 0x8c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_tempered
// Params 1
// Checksum 0xbccb00a8, Offset: 0xac
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tempered", undefined, undefined, [] );
    }
}

