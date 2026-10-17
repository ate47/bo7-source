#using scripts\common\callbacks;

#namespace specialty_quick_fix;

// Namespace specialty_quick_fix
// Params 0, eflags: 0x1
// Checksum 0xeb64d6ea, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_quick_fix
// Params 1
// Checksum 0x886929ae, Offset: 0xad
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_quick_fix" );
    }
}

