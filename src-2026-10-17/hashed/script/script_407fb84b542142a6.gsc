#using script_2aa77b5f4dfc2051;
#using scripts\common\system;
#using scripts\common\utility;

#namespace br_sidequest_boat_horn;

// Namespace br_sidequest_boat_horn
// Params 0, eflags: 0x5
// Checksum 0x7c25f4f7, Offset: 0xe0
// Size: 0x25
function private autoexec __init__system__()
{
    system::register( #"hash_d39ef39277062124", #"br_interact_sidequest", &pre_main, &post_main );
}

// Namespace br_sidequest_boat_horn
// Params 0
// Checksum 0x4e6e202a, Offset: 0x10d
// Size: 0x3e
function pre_main()
{
    utility::registersharedfunc( #"interact_sidequest", getxhash( "boat_horn_dock" ), &on_complete );
    utility::registersharedfunc( #"interact_sidequest", getxhash( "boat_horn_factory" ), &on_complete );
}

// Namespace br_sidequest_boat_horn
// Params 0
// Checksum 0x5eb34a3b, Offset: 0x153
// Size: 0x15
function post_main()
{
    game[ "dialog" ][ "boat_horn_successful" ] = "reeb_wzan_boho";
}

// Namespace br_sidequest_boat_horn
// Params 1
// Checksum 0xd196b942, Offset: 0x170
// Size: 0x2e
function on_complete( player )
{
    level thread br_public::brleaderdialogteam( "boat_horn_successful", player.team, 1, 5, undefined, "dx_br_mpje_" );
}

