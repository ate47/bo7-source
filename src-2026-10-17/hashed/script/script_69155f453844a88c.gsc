#using script_7c5632db7555b4f5;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_slaylist;

// Namespace zm_bgb_slaylist
// Params 0, eflags: 0x5
// Checksum 0xe03c5038, Offset: 0xa0
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "slaylist", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_slaylist
// Params 0
// Checksum 0x8f2c3127, Offset: 0xc5
// Size: 0x21
function __init__()
{
    bgb::register( "slaylist", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_slaylist
// Params 0
// Checksum 0x910d2ec9, Offset: 0xee
// Size: 0x39
function activation()
{
    playlist = function_710ebc0d0721c7ea();
    random_track = utility::array_random( playlist );
    level musicbank_utility::function_5aca66c390aa347d( level.players, random_track );
}

// Namespace zm_bgb_slaylist
// Params 0
// Checksum 0x7ecf8a20, Offset: 0x12f
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_slaylist
// Params 0
// Checksum 0xe115ed6, Offset: 0x13c
// Size: 0x49
function function_710ebc0d0721c7ea()
{
    track_num = 23;
    array = [];
    
    for ( i = 0; i < track_num ; i++ )
    {
        array[ i ] = getxhash( "bgb_slaylist_" + i + 1 );
    }
    
    return array;
}

