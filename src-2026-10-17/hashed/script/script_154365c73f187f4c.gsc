#using scripts\common\callbacks;

#namespace specialty_focus;

// Namespace specialty_focus
// Params 0, eflags: 0x1
// Checksum 0xfd7a09c7, Offset: 0xc8
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_focus
// Params 1
// Checksum 0x831d9195, Offset: 0xe8
// Size: 0x44
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_focus", undefined, undefined, [ "specialty_viewkick_override", "specialty_improvedholdbreath" ] );
    }
}

