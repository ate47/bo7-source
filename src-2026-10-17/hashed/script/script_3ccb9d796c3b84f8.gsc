#using scripts\common\callbacks;

#namespace specialty_onehanded_plating;

// Namespace specialty_onehanded_plating
// Params 0, eflags: 0x1
// Checksum 0x1540a709, Offset: 0x95
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_onehanded_plating
// Params 1
// Checksum 0x764d5861, Offset: 0xb5
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_onehanded_plating", undefined, undefined, [] );
    }
}

