#using scripts\common\callbacks;

#namespace specialty_tertiary_allow_launchers;

// Namespace specialty_tertiary_allow_launchers
// Params 0, eflags: 0x1
// Checksum 0xb0190fc6, Offset: 0x9c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_54f3bd14c452b911 );
}

// Namespace specialty_tertiary_allow_launchers
// Params 1, eflags: 0x4
// Checksum 0x916306fc, Offset: 0xbc
// Size: 0x2f
function private function_54f3bd14c452b911( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tertiary_allow_launchers" );
    }
}

