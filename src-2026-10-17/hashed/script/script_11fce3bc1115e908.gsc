#using script_2ed27b7aecded97e;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace pluto_spawn;

// Namespace pluto_spawn
// Params 0, eflags: 0x5
// Checksum 0xdfdf3301, Offset: 0xae
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"pluto", undefined, undefined, &post_main );
}

// Namespace pluto_spawn
// Params 0
// Checksum 0x9054d3b3, Offset: 0xcf
// Size: 0x63
function post_main()
{
    if ( !pluto_veh::function_bdd68e56b5bb1269() )
    {
        return;
    }
    
    level endon( #"game_ended" );
    level utility::flag_wait( "vehicle_init_done" );
    spawn_struct = utility::getstruct( "pluto_start_spawn", "targetname" );
    assert( spawn_struct, "<dev string:x24>" );
    vehicle::spawn( %"hash_62a07b56f29782f5", spawn_struct );
}

