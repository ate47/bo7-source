#using scripts\common\callbacks;

#namespace specialty_tac_resist;

// Namespace specialty_tac_resist
// Params 0, eflags: 0x1
// Checksum 0xe1a4c70a, Offset: 0x120
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_8c08613018dc29a8 );
}

// Namespace specialty_tac_resist
// Params 1
// Checksum 0xea08a433, Offset: 0x140
// Size: 0x5f
function function_8c08613018dc29a8( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tac_resist", undefined, undefined, [ "specialty_stun_resistance", "specialty_emp_resist", "specialty_gas_grenade_resist", "specialty_scrambler_resist", "specialty_snapshot_immunity" ] );
    }
}

