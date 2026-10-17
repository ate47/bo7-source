#using scripts\common\callbacks;

#namespace specialty_tracker_pro;

// Namespace specialty_tracker_pro
// Params 0, eflags: 0x1
// Checksum 0x738e3ee5, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_tracker_pro
// Params 1
// Checksum 0x1083c18d, Offset: 0xaf
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_tracker_pro", undefined, undefined, [] );
    }
}

