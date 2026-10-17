#using scripts\common\callbacks;

#namespace specialty_fastreload_via_loadout;

// Namespace specialty_fastreload_via_loadout
// Params 0, eflags: 0x1
// Checksum 0xfb03b844, Offset: 0x9a
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fastreload_via_loadout
// Params 1
// Checksum 0x980e4700, Offset: 0xba
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_fastreload_via_loadout" );
    }
}

