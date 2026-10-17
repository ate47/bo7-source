#using script_63258e3c8c400b7a;

#namespace zmquestcontinueplayingscreen;

// Namespace zmquestcontinueplayingscreen
// Params 0
// Checksum 0x2d158b34, Offset: 0x96
// Size: 0x16
function register()
{
    return lui_elems::register_lui_elem( "ZMQuestContinuePlayingScreen", #"zmquestcontinueplayingscreen" );
}

// Namespace zmquestcontinueplayingscreen
// Params 2
// Checksum 0x3696a325, Offset: 0xb5
// Size: 0x1f
function open( player, flags )
{
    lui_elems::function_4a07e613bedbe7f( player, flags );
}

// Namespace zmquestcontinueplayingscreen
// Params 1
// Checksum 0xd271df93, Offset: 0xdc
// Size: 0x15
function close( player )
{
    lui_elems::function_2557a1e4a129a093( player );
}

// Namespace zmquestcontinueplayingscreen
// Params 1
// Checksum 0xc22ecc52, Offset: 0xf9
// Size: 0x14
function is_open( player )
{
    return lui_elems::function_174a11670f95f430( player );
}

