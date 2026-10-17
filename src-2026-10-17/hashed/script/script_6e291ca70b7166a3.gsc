#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\ztron\ztron_bonus_room;
#using scripts\mp\zm\ztron\ztron_item;

#namespace namespace_4b253b469ac655ee;

// Namespace namespace_4b253b469ac655ee
// Params 0, eflags: 0x5
// Checksum 0x60bc3dcb, Offset: 0xe8
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_a4a6f6844bbd12b5", undefined, undefined, &init );
}

// Namespace namespace_4b253b469ac655ee
// Params 0
// Checksum 0x20d78ea9, Offset: 0x109
// Size: 0xa
function init()
{
    level thread function_ac078535c7a1e24a();
}

// Namespace namespace_4b253b469ac655ee
// Params 0
// Checksum 0xf8e13794, Offset: 0x11b
// Size: 0xb4
function function_ac078535c7a1e24a()
{
    level utility::flag_wait( "ztron_bonus_room_initialized" );
    rooms = ztron_bonus_room::function_98dedbfc79dc3572( "duck_farm" );
    
    if ( rooms.size > 0 )
    {
        foreach ( room in rooms )
        {
            room.setupcallback = &function_94097d2ad5e6074;
            room.var_6a5f366ee6f9f320 = 1;
        }
    }
}

// Namespace namespace_4b253b469ac655ee
// Params 1
// Checksum 0xab18837b, Offset: 0x1d7
// Size: 0x8b
function function_94097d2ad5e6074( room )
{
    level endon( #"ztron_game_is_over" );
    level endon( #"bonus_room_expired" );
    level endon( #"bonus_room_exit_taken" );
    level waittill( #"hash_9d2492f7742c7564" );
    utility::registersharedfunc( #"egg", #"getspawnlist", &function_ea8b4f2070cb0d3a );
    spawnpoints = sortspawnpoints( room.lootpoints );
    room ztron_item::function_6607be6e510e8f54( spawnpoints );
    room thread function_5011fb6f2df386a5();
}

// Namespace namespace_4b253b469ac655ee
// Params 0, eflags: 0x4
// Checksum 0xc0230d8d, Offset: 0x26a
// Size: 0x3e
function private function_5011fb6f2df386a5()
{
    result = level utility::waittill_any_return( "bonus_room_expired", "ztron_game_is_over", "bonus_room_exit_taken" );
    utility::registersharedfunc( #"egg", #"getspawnlist", undefined );
}

// Namespace namespace_4b253b469ac655ee
// Params 0, eflags: 0x4
// Checksum 0xbf76d868, Offset: 0x2b0
// Size: 0xb
function private function_ea8b4f2070cb0d3a()
{
    return %"hash_786f02f084aeb838";
}

// Namespace namespace_4b253b469ac655ee
// Params 2, eflags: 0x4
// Checksum 0x29fd11ed, Offset: 0x2c4
// Size: 0x32, Type: bool
function private sortfunc( a, b )
{
    return a.origin[ 2 ] > b.origin[ 2 ];
}

// Namespace namespace_4b253b469ac655ee
// Params 1, eflags: 0x4
// Checksum 0xa1ccce67, Offset: 0x2ff
// Size: 0x18
function private sortspawnpoints( points )
{
    return arraysort( points, undefined, &sortfunc );
}

