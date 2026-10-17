#using scripts\common\callbacks;

#namespace specialty_minimap_scramble_immune;

// Namespace specialty_minimap_scramble_immune
// Params 0, eflags: 0x1
// Checksum 0x89014c59, Offset: 0x9b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_minimap_scramble_immune
// Params 1
// Checksum 0xea0cb31d, Offset: 0xbb
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_minimap_scramble_immune" );
    }
}

