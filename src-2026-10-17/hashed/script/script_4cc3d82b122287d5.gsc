#using scripts\common\callbacks;

#namespace specialty_missileprediction;

// Namespace specialty_missileprediction
// Params 0, eflags: 0x1
// Checksum 0xda4b6ba1, Offset: 0x95
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_missileprediction
// Params 1
// Checksum 0xb94694e5, Offset: 0xb5
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_missileprediction" );
    }
}

