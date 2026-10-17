#using scripts\common\callbacks;

#namespace specialty_faster_weapon_swap;

// Namespace specialty_faster_weapon_swap
// Params 0, eflags: 0x5
// Checksum 0x20661faf, Offset: 0x96
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_2ecf673200977e89 );
}

// Namespace specialty_faster_weapon_swap
// Params 1, eflags: 0x4
// Checksum 0x39cab5f7, Offset: 0xb6
// Size: 0x32
function private function_2ecf673200977e89( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_faster_weapon_swap", undefined, undefined, [] );
    }
}

