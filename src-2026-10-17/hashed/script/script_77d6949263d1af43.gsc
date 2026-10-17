#using script_4a3f958f74fe194e;
#using script_56e2519a4d33f9a2;
#using script_6995a3eb7d571a9f;
#using scripts\common\killstreaks\killstreak_shared;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\mp\hud_message;
#using scripts\mp\zm\maps\zm_sat_locust\zm_sat_locust_wunderbarrage;

#namespace zm_robot_controller_secondary;

// Namespace zm_robot_controller_secondary
// Params 0, eflags: 0x5
// Checksum 0x8995d77a, Offset: 0xb0
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_cf6a677063950a09", #"zm_robot_controller", &pre_main, undefined );
}

// Namespace zm_robot_controller_secondary
// Params 0, eflags: 0x4
// Checksum 0x9352b1b5, Offset: 0xd9
// Size: 0x17
function private pre_main()
{
    killstreak_shared::registerkillstreakinitfunction( getxhash( "zm_bernard_secondary" ), &init );
}

// Namespace zm_robot_controller_secondary
// Params 0, eflags: 0x4
// Checksum 0x21f6a835, Offset: 0xf8
// Size: 0x21
function private init()
{
    killstreaks::registerkillstreak( "zm_bernard_secondary", &function_95593d8d1cb71405, undefined, undefined, &zm_robot_controller::function_8f305741152309b9 );
    data_init();
}

// Namespace zm_robot_controller_secondary
// Params 0, eflags: 0x4
// Checksum 0xdfa490de, Offset: 0x121
// Size: 0xdc
function private data_init()
{
    bundle = level.streakglobals.streakbundles[ "zm_bernard_secondary" ];
    contents = trace::create_contents( 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1 );
    searchradius = 172;
    radius = 115;
    height = 230;
    bundle.tacpointdata = { #height:height, #radius:radius, #searchradius:searchradius, #contents:contents };
    bundle.version = "secondary";
    bundle.callbacks = [ "verify":&function_42ad13306c22d13c, "execute":&function_7fdbf35c700e57f0 ];
}

// Namespace zm_robot_controller_secondary
// Params 1
// Checksum 0x8350d157, Offset: 0x205
// Size: 0x27
function function_95593d8d1cb71405( streakinfo = killstreak_utility::createstreakinfo( "zm_bernard_secondary", self ) )
{
    return zm_robot_controller::controller_use( streakinfo );
}

// Namespace zm_robot_controller_secondary
// Params 1, eflags: 0x4
// Checksum 0xf0bebdad, Offset: 0x235
// Size: 0xb5
function private function_7fdbf35c700e57f0( params )
{
    wunderbarrage_data_struct = level.robot_wunderbarrage.defaults;
    
    if ( isdefined( params.var_c7cc8d9838136fcd.var_9e9fc8a91c11d524 ) )
    {
        wunderbarrage_data_struct = params.var_c7cc8d9838136fcd.var_9e9fc8a91c11d524;
    }
    else if ( utility::issharedfuncdefined( #"zm_robot_controller", #"get_wunderbarrage_settings", 0 ) )
    {
        wunderbarrage_data_struct = utility::callsharedfunc( #"zm_robot_controller", #"get_wunderbarrage_settings" );
    }
    
    level thread zm_sat_locust_wunderbarrage::launch_wunderbarrage( wunderbarrage_data_struct, params.player, undefined, params.position );
}

// Namespace zm_robot_controller_secondary
// Params 1, eflags: 0x4
// Checksum 0x68ece4f6, Offset: 0x2f2
// Size: 0x30, Type: bool
function private function_42ad13306c22d13c( streakinfo )
{
    if ( !zm_sat_locust_wunderbarrage::is_not_active() )
    {
        hud_message::showerrormessage( %"killstreaks/airspace_full", undefined, 1 );
        return false;
    }
    
    return true;
}

