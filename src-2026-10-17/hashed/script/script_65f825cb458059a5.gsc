#using scripts\common\callbacks;

#namespace specialty_spawn_parachute_protection;

// Namespace specialty_spawn_parachute_protection
// Params 0, eflags: 0x1
// Checksum 0xd225d9e2, Offset: 0x9e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_spawn_parachute_protection
// Params 1
// Checksum 0xb128268a, Offset: 0xbe
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_spawn_parachute_protection", undefined, undefined, [] );
    }
}

