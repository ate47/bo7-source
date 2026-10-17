#using scripts\common\callbacks;

#namespace specialty_tac_resist_br;

// Namespace specialty_tac_resist_br
// Params 0, eflags: 0x1
// Checksum 0x6e7793a6, Offset: 0x125
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_8c08613018dc29a8 );
}

// Namespace specialty_tac_resist_br
// Params 1
// Checksum 0xdb8ba4a3, Offset: 0x145
// Size: 0x5f
function function_8c08613018dc29a8( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tac_resist_br", undefined, undefined, [ "specialty_stun_resistance", "specialty_gas_grenade_resist", "specialty_snapshot_immunity", "specialty_frangible_resist", "specialty_shock_resist" ] );
    }
}

