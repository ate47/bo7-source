#using scripts\common\callbacks;

#namespace specialty_fast_hands;

// Namespace specialty_fast_hands
// Params 0, eflags: 0x1
// Checksum 0xd6077034, Offset: 0xe1
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fast_hands
// Params 1
// Checksum 0x127b9a48, Offset: 0x101
// Size: 0x4d
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_fast_hands", undefined, undefined, [ "specialty_quickswap", "specialty_throwback", "specialty_throwback_extrafusetime" ] );
    }
}

