#using scripts\common\callbacks;

#namespace specialty_fastreload;

// Namespace specialty_fastreload
// Params 0, eflags: 0x1
// Checksum 0xcc9109e9, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fastreload
// Params 1
// Checksum 0xaf9cf6ad, Offset: 0xae
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_fastreload" );
    }
}

