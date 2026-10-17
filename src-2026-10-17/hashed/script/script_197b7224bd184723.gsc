#using scripts\common\callbacks;

#namespace specialty_reduce_regen_delay_on_plate;

// Namespace specialty_reduce_regen_delay_on_plate
// Params 0, eflags: 0x1
// Checksum 0xb01649c9, Offset: 0x9f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_cb0d1a7e76480297 );
}

// Namespace specialty_reduce_regen_delay_on_plate
// Params 1
// Checksum 0x2261c676, Offset: 0xbf
// Size: 0x32
function function_cb0d1a7e76480297( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reduce_regen_delay_on_plate", undefined, undefined, [] );
    }
}

