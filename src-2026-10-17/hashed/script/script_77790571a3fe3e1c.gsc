#using scripts\common\callbacks;

#namespace specialty_faster_tactical_lethal_deploy;

// Namespace specialty_faster_tactical_lethal_deploy
// Params 0, eflags: 0x5
// Checksum 0x11c2d33f, Offset: 0x9a
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_2e4387b1280cc3a9 );
}

// Namespace specialty_faster_tactical_lethal_deploy
// Params 1, eflags: 0x4
// Checksum 0xb954c1f7, Offset: 0xba
// Size: 0x32
function private function_2e4387b1280cc3a9( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_faster_tactical_lethal", undefined, undefined, [] );
    }
}

