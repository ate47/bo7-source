#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_snapshot_immunity;

// Namespace specialty_snapshot_immunity
// Params 0, eflags: 0x1
// Checksum 0xbc51b287, Offset: 0x95
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_snapshot_immunity
// Params 1
// Checksum 0xf3d89a4d, Offset: 0xb5
// Size: 0x34
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_snapshot_immunity", &setspecialty );
    }
}

// Namespace specialty_snapshot_immunity
// Params 0
// Checksum 0x3360a08a, Offset: 0xf1
// Size: 0xe
function setspecialty()
{
    perks::function_70e4256c5fb41ada( "specialty_snapshot_immunity" );
}

