#using script_63258e3c8c400b7a;

#namespace prophuntcontrols;

// Namespace prophuntcontrols
// Params 2
// Checksum 0x4e86bd4d, Offset: 0x8a
// Size: 0x27
function unregister( player, forceclose = 0 )
{
    lui_elems::function_62219114d4882731( player, forceclose );
}

// Namespace prophuntcontrols
// Params 0
// Checksum 0xffc4555f, Offset: 0xb9
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "PropHuntControls", #"prophuntcontrols" );
}

// Namespace prophuntcontrols
// Params 2
// Checksum 0xc2b5d53d, Offset: 0xd8
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace prophuntcontrols
// Params 1
// Checksum 0x2652a98b, Offset: 0xff
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace prophuntcontrols
// Params 1
// Checksum 0x360dba4a, Offset: 0x11c
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

