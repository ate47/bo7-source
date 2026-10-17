#using scripts\common\callbacks;

#namespace specialty_directional_uav;

// Namespace specialty_directional_uav
// Params 0, eflags: 0x5
// Checksum 0xda812011, Offset: 0x93
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_ee561f348f7226e3 );
}

// Namespace specialty_directional_uav
// Params 1, eflags: 0x4
// Checksum 0x60be6788, Offset: 0xb3
// Size: 0x32
function private function_ee561f348f7226e3( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_directional_uav", undefined, undefined, [] );
    }
}

