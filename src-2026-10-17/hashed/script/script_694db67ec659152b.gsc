#using scripts\common\callbacks;

#namespace specialty_noscopeoutline;

// Namespace specialty_noscopeoutline
// Params 0, eflags: 0x1
// Checksum 0x5f35774d, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_noscopeoutline
// Params 1
// Checksum 0x3c388809, Offset: 0xb2
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_noscopeoutline" );
    }
}

