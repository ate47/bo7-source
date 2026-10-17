#using scripts\common\callbacks;

#namespace specialty_improvedholdbreath;

// Namespace specialty_improvedholdbreath
// Params 0, eflags: 0x1
// Checksum 0xe3b9f1a4, Offset: 0x96
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_improvedholdbreath
// Params 1
// Checksum 0x80b40ee0, Offset: 0xb6
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_improvedholdbreath" );
    }
}

