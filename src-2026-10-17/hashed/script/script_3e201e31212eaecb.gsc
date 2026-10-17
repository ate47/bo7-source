#using script_1f7b0304d26d6272;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;

#namespace zm_bgb_dead_drop;

// Namespace zm_bgb_dead_drop
// Params 0, eflags: 0x5
// Checksum 0x158a01df, Offset: 0x8b
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "dead_drop", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_dead_drop
// Params 0
// Checksum 0x7fbd62ee, Offset: 0xb0
// Size: 0x31
function __init__()
{
    bgb::register( "dead_drop", "time", 300, &enable, &disable, &validation );
    loot_drops::function_935f8b619d093b69( &check_dead_drop );
}

// Namespace zm_bgb_dead_drop
// Params 0
// Checksum 0xf17f03cc, Offset: 0xe9
// Size: 0x2
function enable()
{
    
}

// Namespace zm_bgb_dead_drop
// Params 0
// Checksum 0x4d9a86af, Offset: 0xf3
// Size: 0x2
function disable()
{
    
}

// Namespace zm_bgb_dead_drop
// Params 0
// Checksum 0x147390e7, Offset: 0xfd
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_dead_drop
// Params 1
// Checksum 0xb4cde043, Offset: 0x10a
// Size: 0x3c, Type: bool
function check_dead_drop( params )
{
    if ( isplayer( params.eattacker ) && params.eattacker bgb::is_enabled( "dead_drop" ) )
    {
        return true;
    }
    
    return false;
}

