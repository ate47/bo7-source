#using scripts\common\callbacks;

#namespace specialty_uav_buff;

// Namespace specialty_uav_buff
// Params 0, eflags: 0x1
// Checksum 0xf966af9a, Offset: 0x8c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_uav_buff
// Params 1
// Checksum 0xb8a87d6f, Offset: 0xac
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_uav_buff", undefined, undefined, [] );
    }
}

