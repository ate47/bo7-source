#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\systems\time_travel;
#using scripts\mp\zm\systems\zone_manager;

#namespace namespace_ed38d631807ab6b0;

// Namespace namespace_ed38d631807ab6b0
// Params 0, eflags: 0x5
// Checksum 0xd26ee404, Offset: 0xb1
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"anywhere_but_here_zm", "anywhere_but_here", &pre_main, &post_main );
}

// Namespace namespace_ed38d631807ab6b0
// Params 0, eflags: 0x4
// Checksum 0x3e55d699, Offset: 0xda
// Size: 0x1c
function private pre_main()
{
    utility::registersharedfunc( "anywhere_but_here", #"hash_590b47e0428d4ab3", &function_bf6363e79a1a43f6 );
}

// Namespace namespace_ed38d631807ab6b0
// Params 0, eflags: 0x4
// Checksum 0xd0c30d0a, Offset: 0xfe
// Size: 0x24
function private post_main()
{
    /#
        if ( isofflinetoolrun( 31 ) )
        {
            return;
        }
    #/
    
    function_c32b3362fe939a0e();
    level.var_a5b16f887c432c02 = &function_fd0bac65e140209a;
}

// Namespace namespace_ed38d631807ab6b0
// Params 0, eflags: 0x4
// Checksum 0x17f74195, Offset: 0x12a
// Size: 0x17f
function private function_bf6363e79a1a43f6()
{
    /#
        if ( isofflinetoolrun( 31 ) )
        {
            return;
        }
    #/
    
    var_28dfa6f197d4d46a = zone_manager::function_90e5c3e2272b0130( self.origin + ( 0, 0, 32 ) );
    
    if ( isdefined( var_28dfa6f197d4d46a ) )
    {
        var_51c533560222849c = [ var_28dfa6f197d4d46a.zone_name ];
    }
    
    if ( isdefined( level.var_55bc6f15db372852 ) )
    {
        if ( !isdefined( var_51c533560222849c ) )
        {
            var_51c533560222849c = [];
        }
        
        var_51c533560222849c = arraycombine( var_51c533560222849c, level.var_55bc6f15db372852 );
    }
    
    if ( level.timetravel )
    {
        if ( !isdefined( var_51c533560222849c ) )
        {
            var_51c533560222849c = [];
        }
        
        current_timeline = time_travel::get_current_timeline();
        var_767dd086555264ff = [];
        
        foreach ( timeline in level.timetravel.timelines )
        {
            if ( timeline.name != current_timeline.name )
            {
                if ( timeline.zones )
                {
                    var_767dd086555264ff = arraycombine( var_767dd086555264ff, timeline.zones );
                }
            }
        }
        
        var_51c533560222849c = arraycombine( var_51c533560222849c, var_767dd086555264ff );
    }
    
    return zone_manager::function_aeaa8dd788ed9b16( level.var_257b383ff3e70ec6, 0, var_51c533560222849c, undefined, 256 );
}

// Namespace namespace_ed38d631807ab6b0
// Params 0, eflags: 0x4
// Checksum 0x5e14bfd5, Offset: 0x2b2
// Size: 0xe6
function private function_c32b3362fe939a0e()
{
    a_s_respawn_points = utility::getstructarray( "player_respawn_point", "targetname" );
    level.var_2646736de1ec6a34 = [];
    
    foreach ( s_respawn_point in a_s_respawn_points )
    {
        s_zone = zone_manager::function_90e5c3e2272b0130( s_respawn_point.origin );
        s_respawn_point.zone_name = s_zone.zone_name ?? s_respawn_point.script_noteworthy;
        level.var_2646736de1ec6a34[ level.var_2646736de1ec6a34.size ] = s_respawn_point;
    }
}

// Namespace namespace_ed38d631807ab6b0
// Params 0
// Checksum 0x4c5850a5, Offset: 0x3a0
// Size: 0x9
function function_fd0bac65e140209a()
{
    zone_manager::function_fc479cad41a1ae1d();
}

// Namespace namespace_ed38d631807ab6b0
// Params 1
// Checksum 0x2d6fb268, Offset: 0x3b1
// Size: 0x4d
function function_8b6ed56c2aa29c10( ignore_zones )
{
    if ( !isarray( ignore_zones ) )
    {
        ignore_zones = [ ignore_zones ];
    }
    
    if ( !isdefined( level.var_55bc6f15db372852 ) )
    {
        level.var_55bc6f15db372852 = [];
    }
    
    level.var_55bc6f15db372852 = arraycombine( level.var_55bc6f15db372852, ignore_zones );
}

// Namespace namespace_ed38d631807ab6b0
// Params 1
// Checksum 0xbc32d726, Offset: 0x406
// Size: 0xaa
function function_b6e1bfb4a3c023ef( ignore_zones )
{
    if ( !isarray( ignore_zones ) )
    {
        ignore_zones = [ ignore_zones ];
    }
    
    foreach ( zone_name in ignore_zones )
    {
        if ( arraycontains( level.var_55bc6f15db372852, zone_name ) )
        {
            arrayremove( level.var_55bc6f15db372852, zone_name );
        }
    }
}

