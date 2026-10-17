#using scripts\common\callbacks;

#namespace specialty_warhead;

// Namespace specialty_warhead
// Params 0, eflags: 0x1
// Checksum 0xec6e7fc6, Offset: 0xd3
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_warhead
// Params 1
// Checksum 0xba16ba68, Offset: 0xf3
// Size: 0x4d
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_warhead", undefined, undefined, [ "specialty_quickswap", "specialty_fastreload", "specialty_fastoffhand" ] );
    }
}

