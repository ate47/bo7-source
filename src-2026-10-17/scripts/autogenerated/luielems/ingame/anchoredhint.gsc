#using script_63258e3c8c400b7a;

#namespace anchoredhint;

// Namespace anchoredhint
// Params 0
// Checksum 0x90751870, Offset: 0x86
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "AnchoredHint", #"anchoredhint" );
}

// Namespace anchoredhint
// Params 2
// Checksum 0xd1fc427e, Offset: 0xa5
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace anchoredhint
// Params 1
// Checksum 0x351b3ec8, Offset: 0xcc
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace anchoredhint
// Params 1
// Checksum 0x25442d09, Offset: 0xe9
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace anchoredhint
// Params 2
// Checksum 0x45377016, Offset: 0x106
// Size: 0x22
function set_entitynumber( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace anchoredhint
// Params 2
// Checksum 0x60822a3a, Offset: 0x130
// Size: 0x22
function set_hintstring( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

