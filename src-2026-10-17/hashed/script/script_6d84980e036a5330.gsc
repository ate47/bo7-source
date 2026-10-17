#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_phoenix_up;

// Namespace zm_bgb_phoenix_up
// Params 0, eflags: 0x5
// Checksum 0xedb7f74f, Offset: 0xa3
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "phoenix_up", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_phoenix_up
// Params 0
// Checksum 0x6598d6e, Offset: 0xc8
// Size: 0x40
function __init__()
{
    bgb::register( "phoenix_up", "activated", 1, undefined, undefined, &validation, &activation );
    bgb::register_lost_perk_override( "phoenix_up", &lost_perk_override, 1 );
    bgb::function_ecc4426f6a3d4e88( "phoenix_up" );
}

// Namespace zm_bgb_phoenix_up
// Params 0
// Checksum 0x662fca52, Offset: 0x110
// Size: 0xe7, Type: bool
function validation()
{
    players = level.players;
    
    foreach ( player in players )
    {
        if ( player.team != self.team )
        {
            continue;
        }
        
        if ( player.var_a0b1f41aaeb1ce10 )
        {
            return false;
        }
        
        if ( isdefined( level.var_6965477c3d0b042a ) && self [[ level.var_6965477c3d0b042a ]]( player, 1, 1 ) )
        {
            return true;
        }
        
        if ( player.inlaststand )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_bgb_phoenix_up
// Params 0
// Checksum 0xc0d6c432, Offset: 0x200
// Size: 0x17
function activation()
{
    utility::callsharedfunc( "phoenix_up", #"activation" );
}

// Namespace zm_bgb_phoenix_up
// Params 1
// Checksum 0x2530c8ad, Offset: 0x21f
// Size: 0x24, Type: bool
function lost_perk_override( params )
{
    if ( params.reason === "last_stand_bgb" )
    {
        return true;
    }
    
    return false;
}

