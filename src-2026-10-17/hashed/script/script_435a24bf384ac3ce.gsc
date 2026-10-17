#using scripts\common\callbacks;

#namespace specialty_blindeye;

// Namespace specialty_blindeye
// Params 0, eflags: 0x1
// Checksum 0x64ab1436, Offset: 0x8c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_blindeye
// Params 1
// Checksum 0x7a6eb72, Offset: 0xac
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_blindeye" );
    }
}

