#using scripts\common\callbacks;

#namespace specialty_faster_plating;

// Namespace specialty_faster_plating
// Params 0, eflags: 0x5
// Checksum 0xb2c0ec5e, Offset: 0x92
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_ee86515d6422cdd1 );
}

// Namespace specialty_faster_plating
// Params 1, eflags: 0x4
// Checksum 0x2fffe3fc, Offset: 0xb2
// Size: 0x32
function private function_ee86515d6422cdd1( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_faster_plating", undefined, undefined, [] );
    }
}

