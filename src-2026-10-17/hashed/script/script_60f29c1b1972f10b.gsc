#using scripts\common\callbacks;

#namespace specialty_outline_immunity;

// Namespace specialty_outline_immunity
// Params 0, eflags: 0x1
// Checksum 0x4bddf752, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_outline_immunity
// Params 1
// Checksum 0x28d00816, Offset: 0xb4
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_outline_immunity" );
    }
}

