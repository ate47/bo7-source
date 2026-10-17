#using script_6c2f6a14fa53759e;
#using scripts\common\devgui;
#using scripts\common\utility;

#namespace zombie_deathworm;

// Namespace zombie_deathworm
// Params 1
// Checksum 0xc885833, Offset: 0x118
// Size: 0x6f
function init_arena_precache( aitypescriptbundle )
{
    if ( utility::flag( "deathworm_arena_precache_init" ) )
    {
        return;
    }
    
    utility::flag_set( "deathworm_arena_precache_init" );
    process_arena_structs();
    level.var_28dd04f9f480d5b1 = getnoentvolumearray( "deathworm_exclude_unburrow", #script_noteworthy );
    level.var_6c7067692ba0c727 = getnoentvolumearray( "deathworm_exclude_melee", #script_noteworthy );
    
    /#
        level thread draw_arena();
    #/
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0x9392ff6f, Offset: 0x18f
// Size: 0xa6
function init_arena()
{
    arena_struct = function_73c9382b02f4adc( self.origin );
    
    if ( !isdefined( arena_struct ) )
    {
        level.arena_id_count++;
        arena_struct = { #arena_id:level.arena_id_count, #radius:2000, #origin:self.origin };
        level.worm_arena_structs[ level.worm_arena_structs.size ] = arena_struct;
        level.var_4398231e0c7c7480[ level.arena_id_count ] = [ arena_struct ];
    }
    
    set_home_arena( arena_struct );
    
    /#
        init_deathworm_arena_devgui();
    #/
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0x515013b4, Offset: 0x23d
// Size: 0x34
function get_home_pos()
{
    assert( isdefined( self.var_bd1f15490f7391d.origin ) );
    return self.var_bd1f15490f7391d.origin;
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0xe0f44fac, Offset: 0x27a
// Size: 0x34
function get_home_radius()
{
    assert( isdefined( self.var_bd1f15490f7391d.radius ) );
    return self.var_bd1f15490f7391d.radius;
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0x5a40121f, Offset: 0x2b7
// Size: 0x34
function get_home_arena_id()
{
    assert( isdefined( self.var_bd1f15490f7391d.arena_id ) );
    return self.var_bd1f15490f7391d.arena_id;
}

// Namespace zombie_deathworm
// Params 1
// Checksum 0xe7043d94, Offset: 0x2f4
// Size: 0x45
function set_home_arena( arena_struct )
{
    assert( isdefined( arena_struct.origin ) );
    assert( isdefined( arena_struct.radius ) );
    self.var_bd1f15490f7391d = arena_struct;
}

// Namespace zombie_deathworm
// Params 1
// Checksum 0x57ae9875, Offset: 0x341
// Size: 0x8a, Type: bool
function function_9073d5c7012a71b6( pos )
{
    foreach ( volume in level.var_28dd04f9f480d5b1 )
    {
        if ( ispointinvolume( pos, volume ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zombie_deathworm
// Params 1
// Checksum 0x6fc0dce3, Offset: 0x3d4
// Size: 0x8a, Type: bool
function function_c1592b3e647c3368( pos )
{
    foreach ( volume in level.var_6c7067692ba0c727 )
    {
        if ( ispointinvolume( pos, volume ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zombie_deathworm
// Params 1
// Checksum 0xb8e4eee7, Offset: 0x467
// Size: 0xaf
function function_73c9382b02f4adc( pos )
{
    foreach ( arena_struct in level.worm_arena_structs )
    {
        dist_sq = distancesquared( arena_struct.origin, pos );
        
        if ( dist_sq < squared( arena_struct.radius ) )
        {
            return arena_struct;
        }
    }
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0x189e4ed0, Offset: 0x51f
// Size: 0x102
function function_933a125e28cb04b5()
{
    self endon( #"death" );
    
    while ( utility::ent_flag( "is_underground" ) )
    {
        arena_id = get_home_arena_id();
        
        if ( level.var_4398231e0c7c7480[ arena_id ].size <= 1 )
        {
            return;
        }
        
        best_arena_struct = undefined;
        var_9c934b9e29e875f8 = -1;
        
        foreach ( arena_struct in level.var_4398231e0c7c7480[ arena_id ] )
        {
            influence = getplayerinfluenceatposition( arena_struct.origin, 1 );
            
            if ( influence > var_9c934b9e29e875f8 )
            {
                var_9c934b9e29e875f8 = influence;
                best_arena_struct = arena_struct;
            }
            
            waitframe();
        }
        
        set_home_arena( best_arena_struct );
        waitframe();
    }
}

// Namespace zombie_deathworm
// Params 0
// Checksum 0xb57c11d5, Offset: 0x629
// Size: 0xbe
function process_arena_structs()
{
    while ( !isdefined( level.struct_class_names ) )
    {
        waitframe();
    }
    
    level.var_4398231e0c7c7480 = [];
    level.worm_arena_structs = [];
    arena_structs = utility::getstructarray( "deathworm_arena", "script_noteworthy" );
    level.arena_id_count = 0;
    
    foreach ( arena_struct in arena_structs )
    {
        function_8d188c61de6a181( arena_struct );
    }
}

// Namespace zombie_deathworm
// Params 1
// Checksum 0xf385c08d, Offset: 0x6ef
// Size: 0xe8
function function_8d188c61de6a181( arena_struct )
{
    if ( !isdefined( arena_struct ) )
    {
        level.arena_id_count++;
        return level.arena_id_count;
    }
    
    if ( isdefined( arena_struct.arena_id ) )
    {
        return arena_struct.arena_id;
    }
    
    target_struct = undefined;
    
    if ( isdefined( arena_struct.target ) )
    {
        target_struct = utility::getstruct( arena_struct.target, "targetname" );
    }
    
    arena_id = function_8d188c61de6a181( target_struct );
    arena_struct.arena_id = arena_id;
    
    if ( !isdefined( level.var_4398231e0c7c7480[ arena_id ] ) )
    {
        level.var_4398231e0c7c7480[ arena_id ] = [];
    }
    
    level.var_4398231e0c7c7480[ arena_id ][ level.var_4398231e0c7c7480[ arena_id ].size ] = arena_struct;
    level.worm_arena_structs[ level.worm_arena_structs.size ] = arena_struct;
    return arena_id;
}

/#

    // Namespace zombie_deathworm
    // Params 0
    // Checksum 0xf0464fb9, Offset: 0x7e0
    // Size: 0x2e, Type: dev
    function init_deathworm_arena_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x40>", "<dev string:x4c>", &toggle_debug_arena );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x6d923d71, Offset: 0x816
    // Size: 0x16, Type: dev
    function private debug_arena()
    {
        return getdvarint( @"deathworm_debug_arena", 0 ) > 0;
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x1a53df6d, Offset: 0x834
    // Size: 0x1a, Type: dev
    function private toggle_debug_arena()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x5d>", @"deathworm_debug_arena" );
    }

    // Namespace zombie_deathworm
    // Params 2, eflags: 0x4
    // Checksum 0xed6d16fb, Offset: 0x856
    // Size: 0x5b, Type: dev
    function private arena_print( text, pos )
    {
        if ( debug_arena() )
        {
            if ( !isdefined( pos ) )
            {
                pos = self.origin + ( 0, 0, 70 );
            }
            
            print3d( pos, "<dev string:x73>" + text, ( 1, 0, 0 ) );
        }
    }

    // Namespace zombie_deathworm
    // Params 0, eflags: 0x4
    // Checksum 0x2b9c16a9, Offset: 0x8b9
    // Size: 0x32b, Type: dev
    function private draw_arena()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            if ( !debug_arena() )
            {
                waitframe();
                continue;
            }
            
            if ( !isdefined( level.players[ 0 ] ) )
            {
                waitframe();
                continue;
            }
            
            worm = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x85>" );
            
            if ( isdefined( worm ) )
            {
                arena_color = ( 0, 0.5, 1 );
                utility::draw_circle( worm get_home_pos(), worm get_home_radius(), arena_color, 1, 1, 1 );
                sphere( worm get_home_pos(), 100, arena_color, 1, 1 );
                print3d( worm get_home_pos(), "<dev string:x96>", arena_color );
                var_aaf3810410e21411 = ( 1, 0.2, 0.2 );
                sphere( worm.worm_underground_ent.origin, 30, var_aaf3810410e21411, 1, 1 );
                print3d( worm.worm_underground_ent.origin + ( 0, 0, -10 ), "<dev string:xab>", var_aaf3810410e21411, 0.8, 0.5 );
            }
            
            foreach ( arena_struct in level.worm_arena_structs )
            {
                arena_color = ( 0.2, 0.5, 0.8 );
                
                if ( isdefined( arena_struct.radius ) )
                {
                    influence = getplayerinfluenceatposition( arena_struct.origin, 1 );
                    utility::draw_circle( arena_struct.origin, arena_struct.radius, arena_color, 0.7, 1, 1 );
                    sphere( arena_struct.origin, 50, arena_color, 1, 1 );
                    print3d( arena_struct.origin, "<dev string:xc7>" + arena_struct.arena_id + "<dev string:xdd>" + influence, arena_color, 0.7 );
                }
            }
            
            foreach ( exclude_volume in level.var_28dd04f9f480d5b1 )
            {
                orientedbox( exclude_volume.origin, ( 20, 20, 20 ), exclude_volume.angles, ( 1, 0, 0 ), 1, 1 );
                print3d( exclude_volume.origin, "<dev string:xee>", ( 1, 0, 0 ), 0.7, 0.5 );
            }
            
            waitframe();
        }
    }

#/
