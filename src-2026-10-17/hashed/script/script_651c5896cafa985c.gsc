#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\mp\loot\common_item;
#using scripts\mp\weapons;

#namespace maneki_neko;

// Namespace maneki_neko
// Params 0, eflags: 0x5
// Checksum 0xbb362b10, Offset: 0x85
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"maneki_neko", undefined, &pre_main, &post_main );
}

// Namespace maneki_neko
// Params 0, eflags: 0x4
// Checksum 0xd6064aad, Offset: 0xaa
// Size: 0x2
function private pre_main()
{
    
}

// Namespace maneki_neko
// Params 0, eflags: 0x4
// Checksum 0x920131ed, Offset: 0xb4
// Size: 0x30
function private post_main()
{
    level endon( #"game_ended" );
    weapons::registerusedcallback( "maneki_neko", &maneki_neko_used );
    weapons::registeragentusedcallback( "maneki_neko", &maneki_neko_used );
}

// Namespace maneki_neko
// Params 1, eflags: 0x4
// Checksum 0x446f49b1, Offset: 0xec
// Size: 0x15
function private maneki_neko_used( grenade )
{
    function_9e9751b04fb88fb5( grenade );
}

// Namespace maneki_neko
// Params 1, eflags: 0x4
// Checksum 0x49f8a0d0, Offset: 0x109
// Size: 0x82
function private function_9e9751b04fb88fb5( grenade )
{
    grenade endon( #"death" );
    grenade waittill( #"missile_stuck", hitent );
    nearby_point = grenade function_d279b3fce7bd86f();
    
    if ( !isdefined( nearby_point ) )
    {
        grenade delete();
        return;
    }
    
    params = spawnstruct();
    params.grenade = grenade;
    callback::callback( #"maneki_neko_placed", params );
}

// Namespace maneki_neko
// Params 0, eflags: 0x4
// Checksum 0x18d7a6b9, Offset: 0x193
// Size: 0x28
function private monitor_timeout()
{
    self endon( #"death" );
    self endon( #"missile_stuck" );
    wait 8;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace maneki_neko
// Params 0, eflags: 0x4
// Checksum 0xa88c571c, Offset: 0x1c3
// Size: 0xc9
function private function_d279b3fce7bd86f()
{
    if ( isdefined( self ) )
    {
        closest_navmesh_point = getclosestpointonnavmesh( self.origin );
    }
    
    /#
        if ( getdvarint( @"scr_debug_vortex", 0 ) )
        {
            half_height = ( 0, 0, 80 );
            cylinder( self.origin - half_height, self.origin + half_height, sqrt( 16384 ), ( 0, 1, 1 ), 1, int( self.update_time * 20 ) );
        }
    #/
    
    if ( isdefined( closest_navmesh_point ) )
    {
        if ( distance2dsquared( closest_navmesh_point, self.origin ) <= 16384 && abs( closest_navmesh_point[ 2 ] - self.origin[ 2 ] ) <= 80 )
        {
            return closest_navmesh_point;
        }
    }
}

// Namespace maneki_neko
// Params 0, eflags: 0x4
// Checksum 0x21352dc5, Offset: 0x295
// Size: 0xea
function private makepickup()
{
    spawnoptions = common_item::function_bc5ff2958b71a708( self.origin, self.angles );
    spawnoptions.var_8d4f327170228364 = 1;
    spawnoptions.baseorigin = self.origin;
    spawnoptions.overrideorigin = self.origin;
    spawnoptions.var_5c41ec8e64770998 = self.origin;
    spawnoptions.dropradiusscale = 0;
    spawnoptions.var_9b09286183ced731 = 1;
    spawnoptions.var_23d3495c57d61bdf = 1;
    spawnoptions.var_b8402e625c429a31 = 1;
    spawnoptions.var_18608bd8660b3a19 = 0;
    itembundle = getscriptbundle( %"hash_11162fc3cc37c9c2" );
    item = common_item::function_61c2c0251e742ffd( itembundle, 1, spawnoptions );
    self delete();
}

