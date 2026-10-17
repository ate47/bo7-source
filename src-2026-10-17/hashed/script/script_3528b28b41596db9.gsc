#using scripts\common\callbacks;

#namespace specialty_noplayertarget;

// Namespace specialty_noplayertarget
// Params 0, eflags: 0x1
// Checksum 0x1125d15f, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_noplayertarget
// Params 1
// Checksum 0x72282e1b, Offset: 0xb2
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_noplayertarget" );
    }
}

