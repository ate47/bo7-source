#using scripts\common\callbacks;

#namespace specialty_eod;

// Namespace specialty_eod
// Params 0, eflags: 0x1
// Checksum 0x124bd80f, Offset: 0xd4
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_eod
// Params 1
// Checksum 0x5c367f56, Offset: 0xf4
// Size: 0x4d
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_eod", undefined, undefined, [ "specialty_blastshield", "specialty_throwback", "specialty_shrapnel_resist" ] );
    }
}

