#using script_63258e3c8c400b7a;

#namespace zmdialoguespeaker;

// Namespace zmdialoguespeaker
// Params 0
// Checksum 0xf3325739, Offset: 0x8b
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMDialogueSpeaker", #"zmdialoguespeaker" );
}

// Namespace zmdialoguespeaker
// Params 2
// Checksum 0x169f87bb, Offset: 0xaa
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmdialoguespeaker
// Params 1
// Checksum 0xf278fb0d, Offset: 0xd1
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmdialoguespeaker
// Params 1
// Checksum 0xe227e8cc, Offset: 0xee
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

// Namespace zmdialoguespeaker
// Params 2
// Checksum 0x489061fa, Offset: 0x10b
// Size: 0x22
function set_speaker_name( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 1, value );
}

// Namespace zmdialoguespeaker
// Params 2
// Checksum 0x475dd045, Offset: 0x135
// Size: 0x22
function set_speaker_image( player, value )
{
    lui_elems::function_dccebe4829a93560( player, 2, value );
}

