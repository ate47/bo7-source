#using scripts\common\callbacks;

#namespace specialty_tactical_recon;

// Namespace specialty_tactical_recon
// Params 0, eflags: 0x1
// Checksum 0x52ae4487, Offset: 0xd5
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_tactical_recon
// Params 1
// Checksum 0x9ba47061, Offset: 0xf5
// Size: 0x4d
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tactical_recon", undefined, undefined, [ "specialty_engineer", "specialty_markequipment", "specialty_hack" ] );
    }
}

