#using scripts\common\callbacks;

#namespace specialty_nodeathicon;

// Namespace specialty_nodeathicon
// Params 0, eflags: 0x1
// Checksum 0xa6df4505, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_nodeathicon
// Params 1
// Checksum 0x1fbd109e, Offset: 0xaf
// Size: 0x47
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) && !isdefined( level.scriptperks[ "specialty_nodeathicon" ] ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_nodeathicon", undefined, undefined, [] );
    }
}

