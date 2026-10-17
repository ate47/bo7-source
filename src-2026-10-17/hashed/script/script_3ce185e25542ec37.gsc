#using scripts\common\callbacks;

#namespace specialty_scavenger_equipment;

// Namespace specialty_scavenger_equipment
// Params 0, eflags: 0x1
// Checksum 0x82934dd0, Offset: 0x97
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_scavenger_equipment
// Params 1
// Checksum 0xe19eb294, Offset: 0xb7
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_scavenger_equipment" );
    }
}

