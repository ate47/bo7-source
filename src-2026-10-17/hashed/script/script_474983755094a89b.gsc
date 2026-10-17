#using scripts\common\callbacks;

#namespace specialty_fastcrouchmovement;

// Namespace specialty_fastcrouchmovement
// Params 0, eflags: 0x1
// Checksum 0x74da14c, Offset: 0x96
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fastcrouchmovement
// Params 1
// Checksum 0x64405e24, Offset: 0xb6
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_fastcrouchmovement", undefined, undefined, [] );
    }
}

