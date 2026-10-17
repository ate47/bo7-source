#using scripts\common\callbacks;

#namespace specialty_quartermaster;

// Namespace specialty_quartermaster
// Params 0, eflags: 0x1
// Checksum 0x743f8be0, Offset: 0x91
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_6a21be1544039dc5 );
}

// Namespace specialty_quartermaster
// Params 1
// Checksum 0x9fade64b, Offset: 0xb1
// Size: 0x32
function function_6a21be1544039dc5( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_quartermaster", undefined, undefined, [] );
    }
}

