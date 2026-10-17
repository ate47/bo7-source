#using scripts\common\callbacks;

#namespace specialty_quickswap;

// Namespace specialty_quickswap
// Params 0, eflags: 0x1
// Checksum 0x1ee6c076, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_quickswap
// Params 1
// Checksum 0x7deb3f32, Offset: 0xad
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_quickswap" );
    }
}

