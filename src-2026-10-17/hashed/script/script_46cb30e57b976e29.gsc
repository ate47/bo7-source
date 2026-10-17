#using scripts\common\callbacks;

#namespace specialty_hustle;

// Namespace specialty_hustle
// Params 0, eflags: 0x1
// Checksum 0xfb379358, Offset: 0xcc
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_hustle
// Params 1
// Checksum 0x7aeb6f5e, Offset: 0xec
// Size: 0x44
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_hustle", undefined, undefined, [ "specialty_supersprint_enhanced", "specialty_fastcrouchmovement" ] );
    }
}

