#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\ui;
#using scripts\common\utility;

#namespace arachnophobia_mode;

// Namespace arachnophobia_mode
// Params 0, eflags: 0x5
// Checksum 0x516027cd, Offset: 0xc9
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"arachnophobia_mode", undefined, &init, undefined );
}

// Namespace arachnophobia_mode
// Params 0
// Checksum 0xc8630e6d, Offset: 0xea
// Size: 0x43
function init()
{
    if ( utility::flag( "arachnophobia_mode_initialized" ) )
    {
        return;
    }
    
    ui::lui_registercallback( "is_arachnophobia_mode_on", &function_beed7ff0ecbffb66 );
    callback::add( #"player_connect", &function_32159864e7fbf7a3 );
    utility::flag_set( "arachnophobia_mode_initialized" );
}

// Namespace arachnophobia_mode
// Params 1
// Checksum 0x7d0bfbb0, Offset: 0x135
// Size: 0x2b
function function_beed7ff0ecbffb66( enabled )
{
    if ( isplayer( self ) && isint( enabled ) )
    {
        self setclientomnvar( "is_arachnophobia_mode_on", enabled );
    }
}

// Namespace arachnophobia_mode
// Params 1
// Checksum 0x2865db58, Offset: 0x168
// Size: 0x2c
function function_32159864e7fbf7a3( params )
{
    var_fee9bf0552b52a59 = utility::requestgamerprofile( "arachnophobiaMode" );
    function_beed7ff0ecbffb66( var_fee9bf0552b52a59 );
}

