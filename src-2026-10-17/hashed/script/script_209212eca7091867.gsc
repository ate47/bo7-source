#using scripts\common\callbacks;

#namespace specialty_coldblooded;

// Namespace specialty_coldblooded
// Params 0, eflags: 0x1
// Checksum 0xd9cb3283, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_coldblooded
// Params 1
// Checksum 0xbac6cdc7, Offset: 0xaf
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_coldblooded" );
    }
}

