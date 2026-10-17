#using scripts\common\callbacks;

#namespace specialty_faster_reload_speed;

// Namespace specialty_faster_reload_speed
// Params 0, eflags: 0x5
// Checksum 0x9e4fda13, Offset: 0x97
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_1565e096e6d3c0e );
}

// Namespace specialty_faster_reload_speed
// Params 1, eflags: 0x4
// Checksum 0x164d35f1, Offset: 0xb7
// Size: 0x32
function private function_1565e096e6d3c0e( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_faster_reload_speed", undefined, undefined, [] );
    }
}

