#using scripts\common\callbacks;

#namespace specialty_bomb_squad;

// Namespace specialty_bomb_squad
// Params 0, eflags: 0x1
// Checksum 0x59663a72, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_bomb_squad
// Params 1
// Checksum 0x18a8e887, Offset: 0xae
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_bomb_squad", undefined, undefined, [] );
    }
}

