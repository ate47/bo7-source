#using scripts\common\callbacks;

#namespace specialty_restock;

// Namespace specialty_restock
// Params 0, eflags: 0x1
// Checksum 0x3658504f, Offset: 0x8b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_6a21be1544039dc5 );
}

// Namespace specialty_restock
// Params 1
// Checksum 0xddca3de4, Offset: 0xab
// Size: 0x32
function function_6a21be1544039dc5( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_restock", undefined, undefined, [] );
    }
}

