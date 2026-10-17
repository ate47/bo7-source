#using scripts\common\callbacks;

#namespace specialty_covert_ops;

// Namespace specialty_covert_ops
// Params 0, eflags: 0x1
// Checksum 0x9db5dbb6, Offset: 0x115
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_covert_ops
// Params 1
// Checksum 0xa31791fb, Offset: 0x135
// Size: 0x5f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_covert_ops", undefined, undefined, [ "specialty_blindeye", "specialty_noscopeoutline", "specialty_coldblooded", "specialty_noplayertarget", "specialty_sixth_sense_immune" ] );
    }
}

