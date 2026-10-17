#using scripts\common\callbacks;

#namespace specialty_tracker_jammer;

// Namespace specialty_tracker_jammer
// Params 0, eflags: 0x1
// Checksum 0xd438b648, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_tracker_jammer
// Params 1
// Checksum 0xb7354920, Offset: 0xb2
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_tracker_jammer", undefined, undefined, [] );
    }
}

