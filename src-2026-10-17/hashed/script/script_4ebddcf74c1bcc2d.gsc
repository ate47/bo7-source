#using scripts\common\callbacks;

#namespace specialty_walljump_buffed;

// Namespace specialty_walljump_buffed
// Params 0, eflags: 0x1
// Checksum 0xf2e5e8ba, Offset: 0x93
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_walljump_buffed
// Params 1
// Checksum 0x91e817fe, Offset: 0xb3
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_walljump_buffed" );
    }
}

