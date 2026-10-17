#using scripts\common\callbacks;

#namespace specialty_shock_resist;

// Namespace specialty_shock_resist
// Params 0, eflags: 0x1
// Checksum 0x6c261b63, Offset: 0x90
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_shock_resist
// Params 1
// Checksum 0xf2be427, Offset: 0xb0
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_shock_resist" );
    }
}

