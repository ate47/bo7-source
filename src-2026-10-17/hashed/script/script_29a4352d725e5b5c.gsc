#using scripts\common\callbacks;

#namespace specialty_shrapnel_resist;

// Namespace specialty_shrapnel_resist
// Params 0, eflags: 0x1
// Checksum 0xd0355c02, Offset: 0x93
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_shrapnel_resist
// Params 1
// Checksum 0xb338a346, Offset: 0xb3
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_shrapnel_resist" );
    }
}

