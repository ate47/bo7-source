#using scripts\common\callbacks;

#namespace specialty_ping_attacker_on_laststand;

// Namespace specialty_ping_attacker_on_laststand
// Params 0, eflags: 0x1
// Checksum 0xdde7d091, Offset: 0x9e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_ping_attacker_on_laststand
// Params 1
// Checksum 0xbeea2ff9, Offset: 0xbe
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_ping_attacker_on_laststand", undefined, undefined, [] );
    }
}

