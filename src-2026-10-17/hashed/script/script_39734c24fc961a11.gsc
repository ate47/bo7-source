#using scripts\common\callbacks;

#namespace specialty_sixth_sense_immune;

// Namespace specialty_sixth_sense_immune
// Params 0, eflags: 0x1
// Checksum 0x19f95cec, Offset: 0x96
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_sixth_sense_immune
// Params 1
// Checksum 0x7af4a3a8, Offset: 0xb6
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_sixth_sense_immune" );
    }
}

