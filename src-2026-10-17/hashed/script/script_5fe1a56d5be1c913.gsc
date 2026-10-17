#using scripts\common\callbacks;

#namespace specialty_throwback;

// Namespace specialty_throwback
// Params 0, eflags: 0x1
// Checksum 0x1e3cea9a, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_throwback
// Params 1
// Checksum 0x7d3115de, Offset: 0xad
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_throwback" );
    }
}

