#using scripts\engine\math;
#using scripts\engine\utility;

#namespace trace;

// Namespace trace
// Params 8
// Checksum 0xfbd9caa, Offset: 0x3db
// Size: 0xf2
function ray_trace( start, end, ignore, contentoverride, getsurfacetype, ignoreclutter, allowscriptables, var_1d354f0580d8cca0 )
{
    trace = physics_raycast( start, end, contentoverride ?? create_default_contents(), ignore, 0, "physicsquery_closest", istrue( ignoreclutter ), allowscriptables, var_1d354f0580d8cca0 );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"ray", start, end, undefined, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0xc3577787, Offset: 0x4d6
// Size: 0xf2
function ray_trace_ents( start, end, ents, contentoverride, getsurfacetype, ignoreclutter, var_4493f393bfd59162 )
{
    content = contentoverride ?? create_default_contents();
    trace = physics_raycastents( start, end, content, ents, 0, "physicsquery_closest", var_4493f393bfd59162 );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"ray", start, end, undefined, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 4
// Checksum 0xb43eed6a, Offset: 0x5d1
// Size: 0x81
function player_viewangles( collisioncontents = create_all_contents(), getsurfacetype = 1, ignoreclutter = 1, allowscriptables = 1 )
{
    assert( isplayer( self ) );
    return ray_trace( self geteye(), self geteye() + anglestoforward( self getplayerangles() ) * 10000, self, collisioncontents, getsurfacetype, ignoreclutter, allowscriptables );
}

// Namespace trace
// Params 9
// Checksum 0x47afde96, Offset: 0x65b
// Size: 0x10c
function _bullet_trace( start, end, hitcharacters, ignore, itemclip, var_47161858d46d0532, testvehicleclip, noshotclip, testglass )
{
    content = [ "physicscontents_clipshot", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item" ];
    
    if ( hitcharacters )
    {
        content[ content.size ] = "physicscontents_characterproxy";
    }
    
    if ( itemclip )
    {
        content[ content.size ] = "physicscontents_itemclip";
    }
    
    if ( testvehicleclip )
    {
        content[ content.size ] = "physicscontents_vehicleclip";
    }
    
    if ( !noshotclip )
    {
        content[ content.size ] = "physicscontents_clipshot";
    }
    
    if ( !isdefined( testglass ) || testglass )
    {
        content[ content.size ] = "physicscontents_glass";
    }
    
    if ( var_47161858d46d0532 )
    {
        return ray_trace_detail( start, end, ignore, physics_createcontents( content ), 1 );
    }
    
    return ray_trace( start, end, ignore, physics_createcontents( content ), 1 );
}

// Namespace trace
// Params 4
// Checksum 0x2820a7ea, Offset: 0x76f
// Size: 0x3a
function _bullet_trace_passed( start, end, hitcharacters, ignore )
{
    return ray_trace_passed( start, end, ignore, create_default_contents( !hitcharacters ) );
}

// Namespace trace
// Params 7
// Checksum 0x3e62fdf4, Offset: 0x7b2
// Size: 0x122
function ray_trace_detail( start, end, ignore, contentoverride, getsurfacetype, ignoreclutter, allowscriptables )
{
    content = contentoverride ?? create_default_contents();
    shouldignoreclutter = ignoreclutter ?? 0;
    
    if ( isdefined( allowscriptables ) )
    {
        trace = physics_raycast( start, end, content, ignore, 1, "physicsquery_closest", shouldignoreclutter, allowscriptables );
    }
    else
    {
        trace = physics_raycast( start, end, content, ignore, 1, "physicsquery_closest", shouldignoreclutter );
    }
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"ray", start, end, undefined, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 6
// Checksum 0x1f355cff, Offset: 0x8dd
// Size: 0x13c
function ray_trace_get_all_results( start, end, ignore, contentoverride, getsurfacetype, allowscriptables )
{
    content = contentoverride ?? create_default_contents();
    trace = physics_raycast( start, end, content, ignore, 0, "physicsquery_all", 0, allowscriptables );
    
    if ( getsurfacetype )
    {
        foreach ( i, t in trace )
        {
            trace[ i ] = convert_surface_flag( t );
        }
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"ray", start, end, undefined, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 4
// Checksum 0xfad572eb, Offset: 0xa22
// Size: 0x4f, Type: bool
function ray_trace_passed( start, end, ignore, contentoverride )
{
    content = contentoverride ?? create_default_contents();
    return !physics_raycast( start, end, content, ignore, 0, "physicsquery_any" );
}

// Namespace trace
// Params 4
// Checksum 0xaaad9db4, Offset: 0xa7a
// Size: 0x50, Type: bool
function ray_trace_detail_passed( start, end, ignore, contentoverride )
{
    content = contentoverride ?? create_default_contents();
    return !physics_raycast( start, end, content, ignore, 1, "physicsquery_any" );
}

// Namespace trace
// Params 3
// Checksum 0xa2d94318, Offset: 0xad3
// Size: 0x81, Type: bool
function can_see_origin( origin, test_characters, fov )
{
    assert( isdefined( origin ), "<dev string:x24>" );
    assert( isplayer( self ) || isai( self ), "<dev string:x61>" );
    
    if ( !isdefined( test_characters ) )
    {
        test_characters = 1;
    }
    
    if ( !math::point_in_fov( origin, fov ) )
    {
        return false;
    }
    
    return ray_trace_passed( self geteye(), origin, self, create_contents( test_characters, 1, 0, 1, 0, 1 ) );
}

// Namespace trace
// Params 8
// Checksum 0x98fd0139, Offset: 0xb5d
// Size: 0xfd
function sphere_trace( start, end, radius, ignore, contentoverride, getsurfacetype, allowscriptables, var_91b5e03a7005bf3 )
{
    content = contentoverride ?? create_default_contents();
    trace = physics_spherecast( start, end, radius, content, ignore, "physicsquery_closest", undefined, allowscriptables, var_91b5e03a7005bf3 );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"sphere", start, end, radius, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0x2cd5cc97, Offset: 0xc63
// Size: 0xf9
function sphere_trace_get_all_results( start, end, radius, ignore, contentoverride, getsurfacetype, allowscriptables )
{
    content = contentoverride ?? create_default_contents();
    trace = physics_spherecast( start, end, radius, content, ignore, "physicsquery_all", undefined, allowscriptables );
    
    if ( getsurfacetype )
    {
        for ( i = 0; i < trace.size ; i++ )
        {
            trace[ i ] = convert_surface_flag( trace[ i ] );
        }
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"sphere", start, end, radius, undefined, undefined, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 5
// Checksum 0x7658bde3, Offset: 0xd65
// Size: 0x58, Type: bool
function sphere_trace_passed( start, end, radius, ignore, contentoverride )
{
    content = contentoverride ?? create_default_contents();
    return !physics_spherecast( start, end, radius, content, ignore, "physicsquery_any" );
}

// Namespace trace
// Params 6
// Checksum 0xb0c01594, Offset: 0xdc6
// Size: 0xe9
function sphere_get_closest_point( position, radius, search_distance, ignore, contentoverride, getsurfacetype )
{
    content = contentoverride ?? create_default_contents();
    trace = physics_getclosestpointtosphere( position, radius, search_distance, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( position );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"sphere", position, undefined, radius, undefined, undefined, search_distance, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 8
// Checksum 0xc4829f7, Offset: 0xeb8
// Size: 0x13b
function capsule_trace( start, end, radius, height, angles, ignore, contentoverride, getsurfacetype )
{
    if ( !isdefined( angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    
    content = contentoverride ?? create_default_contents();
    capsule_data = convert_capsule_data( start, end, radius, height, angles );
    trace = physics_capsulecast( capsule_data[ "trace_start" ], capsule_data[ "trace_end" ], radius, capsule_data[ "half_height" ], angles, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"capsule", start, end, radius, height, angles, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 8
// Checksum 0xd100d3b, Offset: 0xffc
// Size: 0x18a
function capsule_trace_get_all_results( start, end, radius, height, angles, ignore, contentoverride, getsurfacetype )
{
    if ( !isdefined( angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    
    content = contentoverride ?? create_default_contents();
    capsule_data = convert_capsule_data( start, end, radius, height, angles );
    trace = physics_capsulecast( capsule_data[ "trace_start" ], capsule_data[ "trace_end" ], radius, capsule_data[ "half_height" ], angles, content, ignore, "physicsquery_all" );
    
    if ( getsurfacetype )
    {
        foreach ( t in trace )
        {
            t = convert_surface_flag( t );
        }
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"capsule", start, end, radius, height, angles, undefined, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0xe4094f91, Offset: 0x118f
// Size: 0xab, Type: bool
function capsule_trace_passed( start, end, radius, height, angles, ignore, contentoverride )
{
    if ( !isdefined( angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    
    content = contentoverride ?? create_default_contents();
    capsule_data = convert_capsule_data( start, end, radius, height, angles );
    return !physics_capsulecast( capsule_data[ "trace_start" ], capsule_data[ "trace_end" ], radius, capsule_data[ "half_height" ], angles, content, ignore, "physicsquery_any" );
}

// Namespace trace
// Params 8
// Checksum 0xb5c6dcf, Offset: 0x1243
// Size: 0x137
function capsule_get_closest_point( position, radius, height, angles, search_distance, ignore, contentoverride, getsurfacetype )
{
    if ( !isdefined( angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    
    content = contentoverride ?? create_default_contents();
    capsule_data = convert_capsule_data( position, undefined, radius, height, angles );
    trace = physics_getclosestpointtocapsule( capsule_data[ "trace_start" ], radius, capsule_data[ "half_height" ], angles, search_distance, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( position );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"capsule", position, undefined, radius, height, angles, search_distance, undefined );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0x1ad44110, Offset: 0x1383
// Size: 0x123
function player_trace( start, end, angles, ignore, contentoverride, getsurfacetype, ground_clearance )
{
    if ( !isplayer( self ) )
    {
        assertmsg( "<dev string:x9b>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self getplayerangles();
    }
    
    content = contentoverride ?? create_default_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    trace = physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", start, end, undefined, undefined, angles, undefined, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0x95147425, Offset: 0x14af
// Size: 0x172
function player_trace_get_all_results( start, end, angles, ignore, contentoverride, getsurfacetype, ground_clearance )
{
    if ( !isplayer( self ) )
    {
        assertmsg( "<dev string:xcb>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self getplayerangles();
    }
    
    content = contentoverride ?? create_default_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    trace = physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_all" );
    
    if ( getsurfacetype )
    {
        foreach ( t in trace )
        {
            t = convert_surface_flag( t );
        }
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", start, end, undefined, undefined, angles, undefined, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 6
// Checksum 0xeb039820, Offset: 0x162a
// Size: 0x93
function player_trace_passed( start, end, angles, ignore, contentoverride, ground_clearance )
{
    if ( !isplayer( self ) )
    {
        assertmsg( "<dev string:x10b>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self getplayerangles();
    }
    
    content = contentoverride ?? create_default_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    return !physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_any" );
}

// Namespace trace
// Params 4
// Checksum 0x92982fb1, Offset: 0x16c6
// Size: 0x45
function player_get_closest_point_static( search_distance, ignore, contentoverride, getsurfacetype )
{
    return player_get_closest_point( self.origin, self.angles, search_distance, ignore, contentoverride, getsurfacetype );
}

// Namespace trace
// Params 6
// Checksum 0x81175628, Offset: 0x1714
// Size: 0x130
function player_get_closest_point( position, angles, search_distance, ignore, contentoverride, getsurfacetype )
{
    if ( !isplayer( self ) )
    {
        assertmsg( "<dev string:x142>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self getplayerangles();
    }
    
    if ( !isdefined( search_distance ) )
    {
        search_distance = 0;
    }
    
    if ( isarray( ignore ) )
    {
        ignore[ ignore.size ] = self;
    }
    else
    {
        ignore = self;
    }
    
    content = contentoverride ?? create_default_contents();
    trace = physics_getclosestpointtocharacter( position, self, 0, angles, search_distance, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( position );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", position, undefined, undefined, undefined, angles, search_distance, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0x91c6d701, Offset: 0x184d
// Size: 0x127
function ai_trace( start, end, angles, ignore, contentoverride, getsurfacetype, ground_clearance )
{
    if ( !isai( self ) )
    {
        assertmsg( "<dev string:x17e>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self.angles;
    }
    
    content = contentoverride ?? create_solid_ai_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    trace = physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( end );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", start, end, undefined, undefined, angles, undefined, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 7
// Checksum 0x5d1dba54, Offset: 0x197d
// Size: 0x176
function ai_trace_get_all_results( start, end, angles, ignore, contentoverride, getsurfacetype, ground_clearance )
{
    if ( !isai( self ) )
    {
        assertmsg( "<dev string:x1a7>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self.angles;
    }
    
    content = contentoverride ?? create_solid_ai_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    trace = physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_all" );
    
    if ( getsurfacetype )
    {
        foreach ( t in trace )
        {
            t = convert_surface_flag( t );
        }
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", start, end, undefined, undefined, angles, undefined, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 6
// Checksum 0x585bd7be, Offset: 0x1afc
// Size: 0x97
function ai_trace_passed( start, end, angles, ignore, contentoverride, ground_clearance )
{
    if ( !isai( self ) )
    {
        assertmsg( "<dev string:x17e>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self.angles;
    }
    
    content = contentoverride ?? create_solid_ai_contents();
    
    if ( !isdefined( ground_clearance ) )
    {
        ground_clearance = 0;
    }
    
    return !physics_charactercast( start, end, self, ground_clearance, angles, content, ignore, "physicsquery_any" );
}

// Namespace trace
// Params 6
// Checksum 0x8dba56d2, Offset: 0x1b9c
// Size: 0x11e
function ai_get_closest_point( position, angles, search_distance, ignore, contentoverride, getsurfacetype )
{
    if ( !isai( self ) )
    {
        assertmsg( "<dev string:x17e>" );
        return;
    }
    
    if ( !isdefined( angles ) )
    {
        angles = self.angles;
    }
    
    if ( !isdefined( search_distance ) )
    {
        search_distance = 0;
    }
    
    content = contentoverride ?? create_solid_ai_contents();
    trace = physics_getclosestpointtocharacter( position, self, 0, angles, search_distance, content, ignore, "physicsquery_closest" );
    
    if ( trace.size )
    {
        trace = trace[ 0 ];
    }
    else
    {
        trace = internal_pack_default_trace( position );
    }
    
    if ( getsurfacetype )
    {
        trace = convert_surface_flag( trace );
    }
    
    /#
        if ( getdvarint( @"hash_b9081b72704d2585", 1 ) == 0 )
        {
            trace[ #"debugdata" ][ #"info" ] = #"hash_80eca68a7dc6004f";
        }
        else
        {
            trace = internal_create_debug_data( trace, #"character", position, undefined, undefined, undefined, angles, search_distance, self );
        }
    #/
    
    return trace;
}

// Namespace trace
// Params 1
// Checksum 0x655a5eb2, Offset: 0x1cc3
// Size: 0x4b
function create_solid_ai_contents( ignore_characters )
{
    content = [ "physicscontents_aiclip", "physicscontents_glass", "physicscontents_vehicle" ];
    
    if ( !ignore_characters )
    {
        content[ content.size ] = "physicscontents_characterproxy";
    }
    
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x66c4d138, Offset: 0x1d17
// Size: 0x39
function function_d436792385c352aa()
{
    content = [ "physicscontents_solid", "physicscontents_playerclip", "physicscontents_characterproxy", "physicscontents_glass" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 2
// Checksum 0x424654a2, Offset: 0x1d59
// Size: 0x5c
function create_opaque_ai_contents( ignore_character, ignore_foliage )
{
    contents = [ "physicscontents_ainosight", "physicscontents_vehicle" ];
    
    if ( !ignore_character )
    {
        contents[ contents.size ] = "physicscontents_characterproxy";
    }
    
    if ( !ignore_foliage )
    {
        contents[ contents.size ] = "physicscontents_foliage";
    }
    
    return physics_createcontents( contents );
}

// Namespace trace
// Params 0
// Checksum 0x1c480e99, Offset: 0x1dbe
// Size: 0x27
function function_75d39778b2b14b81()
{
    contents = [ "physicscontents_foliage", "physicscontents_foliage_audio" ];
    return physics_createcontents( contents );
}

// Namespace trace
// Params 0
// Checksum 0xa6c07557, Offset: 0x1dee
// Size: 0x1e
function create_ainosight_contents()
{
    content = [ "physicscontents_ainosight" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0xafcb3b30, Offset: 0x1e15
// Size: 0x27
function create_world_contents()
{
    content = [ "physicscontents_itemclip", "physicscontents_water" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x473edad2, Offset: 0x1e45
// Size: 0x10
function function_bbd81e56529ef225()
{
    return physics_createcontents( [ "physicscontents_water" ] );
}

// Namespace trace
// Params 0
// Checksum 0xb862d233, Offset: 0x1e5e
// Size: 0x1e
function create_glass_contents()
{
    content = [ "physicscontents_glass" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0xad8f6fb5, Offset: 0x1e85
// Size: 0x1e
function create_ainoshoot_contents()
{
    content = [ "physicscontents_ainoshoot" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x6cd40244, Offset: 0x1eac
// Size: 0x1e
function create_item_contents()
{
    content = [ "physicscontents_item" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0xdcbf4481, Offset: 0x1ed3
// Size: 0x1e
function create_itemclip_contents()
{
    content = [ "physicscontents_itemclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x29d1a1f8, Offset: 0x1efa
// Size: 0x1e
function create_vehicle_contents()
{
    content = [ "physicscontents_vehicle" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x2be417c0, Offset: 0x1f21
// Size: 0x1e
function function_95e6759db38fe94e()
{
    content = [ "physicscontents_vehicleclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x18101bf0, Offset: 0x1f48
// Size: 0x27
function create_shotclip_contents()
{
    content = [ "physicscontents_clipshot", "physicscontents_missileclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x3d28e5f4, Offset: 0x1f78
// Size: 0x1e
function create_playerclip_contents()
{
    content = [ "physicscontents_playerclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0xf9f691c6, Offset: 0x1f9f
// Size: 0x1e
function create_character_contents()
{
    content = [ "physicscontents_characterproxy" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 0
// Checksum 0x8c0d7021, Offset: 0x1fc6
// Size: 0x1e
function function_c0d3ab83fb6e9efb()
{
    content = [ "physicscontents_cameraclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 1
// Checksum 0x6b305d0d, Offset: 0x1fed
// Size: 0x4a, Type: bool
function create_default_contents( ignore_characters )
{
    if ( ignore_characters )
    {
        return ( level.tracecontents[ #"hash_9c68a7d42423c367" ] ?? function_41e6f1cfccdca785() );
    }
    
    return level.tracecontents[ #"hash_3b87644c44e5a89f" ] ?? function_7e09a15185b5ee19();
}

// Namespace trace
// Params 0, eflags: 0x4
// Checksum 0xecc60319, Offset: 0x2040
// Size: 0x31
function private function_41e6f1cfccdca785()
{
    level.tracecontents[ #"hash_9c68a7d42423c367" ] = function_db0147ce380c82fd( 1 );
    return level.tracecontents[ #"hash_9c68a7d42423c367" ];
}

// Namespace trace
// Params 0, eflags: 0x4
// Checksum 0xaaabb2b5, Offset: 0x207a
// Size: 0x30
function private function_7e09a15185b5ee19()
{
    level.tracecontents[ #"hash_3b87644c44e5a89f" ] = function_db0147ce380c82fd( 0 );
    return level.tracecontents[ #"hash_3b87644c44e5a89f" ];
}

// Namespace trace
// Params 1, eflags: 0x4
// Checksum 0xf12eb26, Offset: 0x20b3
// Size: 0x1e
function private function_db0147ce380c82fd( ignore_characters )
{
    return create_contents( !ignore_characters, 1, 1, 1, 0, 1 );
}

// Namespace trace
// Params 13
// Checksum 0x13cff26c, Offset: 0x20da
// Size: 0x1cd
function create_contents( character, _world, glass, shotclip, item, vehicle, playerclip, ainosight, itemclip, vehicleclip, waterclip, cameraclip, excludewaterclip )
{
    content = 0;
    contentcache = level.var_f8566a3afd9187c8 ?? function_63b69288208a3639();
    
    if ( character )
    {
        content |= contentcache.character;
    }
    
    if ( _world )
    {
        content |= contentcache._world;
    }
    
    if ( glass )
    {
        content |= contentcache.glass;
    }
    
    if ( shotclip )
    {
        content |= contentcache.shotclip;
    }
    
    if ( item )
    {
        content |= contentcache.item;
    }
    
    if ( vehicle )
    {
        content |= contentcache.vehicle;
    }
    
    if ( playerclip )
    {
        content |= contentcache.playerclip;
    }
    
    if ( ainosight )
    {
        content |= contentcache.ainosight;
    }
    
    if ( itemclip )
    {
        content |= contentcache.itemclip;
    }
    
    if ( vehicleclip )
    {
        content |= contentcache.vehicleclip;
    }
    
    if ( waterclip && !excludewaterclip )
    {
        content |= contentcache.waterclip;
    }
    
    if ( cameraclip )
    {
        content |= contentcache.cameraclip;
    }
    
    if ( excludewaterclip && content | contentcache.waterclip )
    {
        content -= contentcache.waterclip;
    }
    
    return content;
}

// Namespace trace
// Params 0
// Checksum 0x7879c7e4, Offset: 0x22b0
// Size: 0xc9
function function_63b69288208a3639()
{
    level.var_f8566a3afd9187c8 = { #cameraclip:function_c0d3ab83fb6e9efb(), #waterclip:function_bbd81e56529ef225(), #vehicleclip:function_95e6759db38fe94e(), #itemclip:create_itemclip_contents(), #ainosight:create_ainosight_contents(), #playerclip:create_playerclip_contents(), #vehicle:create_vehicle_contents(), #item:create_item_contents(), #shotclip:create_shotclip_contents(), #glass:create_glass_contents(), #_world:create_world_contents(), #character:create_character_contents() };
    return level.var_f8566a3afd9187c8;
}

// Namespace trace
// Params 0
// Checksum 0xaa684328, Offset: 0x2382
// Size: 0xb7
function create_all_contents()
{
    content = [ "physicscontents_foliage", "physicscontents_foliage_audio", "physicscontents_edge", "physicscontents_glass", "physicscontents_water", "physicscontents_ainoshoot", "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicleclip", "physicscontents_itemclip", "physicscontents_ainosight", "physicscontents_clipshot", "physicscontents_characterproxy", "physicscontents_playerclip", "physicscontents_aiclip", "physicscontents_trigger", "physicscontents_vehicle", "physicscontents_useclip" ];
    return physics_createcontents( content );
}

// Namespace trace
// Params 1
// Checksum 0xea6982e1, Offset: 0x2442
// Size: 0x4b
function convert_surface_flag( trace )
{
    trace = arraycopy( trace );
    var_6a158acb78626840 = physics_getsurfacetypefromflags( trace[ "surfaceflags" ] );
    trace[ "surfaceindex" ] = var_6a158acb78626840[ "index" ];
    trace[ "surfacetype" ] = var_6a158acb78626840[ "name" ];
    return trace;
}

// Namespace trace
// Params 5
// Checksum 0x574445b9, Offset: 0x2496
// Size: 0xb7
function convert_capsule_data( var_92dd99861f2ca9ad, var_d482c786daf8d456, radius, height, angles )
{
    if ( !isdefined( angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    
    half_height = height * 0.5;
    up = anglestoup( angles );
    capsule_data = [];
    capsule_data[ "trace_start" ] = var_92dd99861f2ca9ad + up * half_height;
    
    if ( isdefined( var_d482c786daf8d456 ) )
    {
        capsule_data[ "trace_end" ] = var_d482c786daf8d456 + up * half_height;
    }
    
    capsule_data[ "radius" ] = radius;
    capsule_data[ "angles" ] = angles;
    capsule_data[ "half_height" ] = half_height;
    return capsule_data;
}

/#

    // Namespace trace
    // Params 4
    // Checksum 0x75d4213a, Offset: 0x2556
    // Size: 0x140, Type: dev
    function draw_trace( trace, color, display_details, duration )
    {
        if ( !isdefined( trace ) )
        {
            return;
        }
        
        if ( getdvarint( @"hash_b9081b72704d2585", 0 ) == 0 )
        {
            assertmsg( "<dev string:x1e0>" );
            setdvar( @"hash_b9081b72704d2585", 1 );
            return;
        }
        
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        if ( isdefined( trace[ #"debugdata" ] ) )
        {
            draw_trace_type( trace[ #"debugdata" ], color, duration );
        }
        
        if ( isdefined( trace[ 0 ] ) )
        {
            foreach ( t in trace )
            {
                thread draw_trace_hit( t, trace[ #"debugdata" ], color, display_details, duration );
            }
            
            return;
        }
        
        thread draw_trace_hit( trace, trace[ #"debugdata" ], color, display_details, duration );
    }

    // Namespace trace
    // Params 5, eflags: 0x4
    // Checksum 0x9ec297f6, Offset: 0x269e
    // Size: 0x3d3, Type: dev
    function private draw_trace_hit( trace, debug_data, color, display_details, duration )
    {
        if ( !isdefined( duration ) )
        {
            duration = 1;
        }
        
        if ( isdefined( trace[ "<dev string:x246>" ] ) )
        {
            half_color = color * 0.25;
            is_white = gettime() / 50 / 2 == int( gettime() / 50 / 2 );
            
            if ( is_white )
            {
                color = ( 1, 1, 1 );
            }
            
            sphere( trace[ "<dev string:x246>" ], 5, color, 1, duration );
            line( trace[ "<dev string:x246>" ], trace[ "<dev string:x246>" ] + trace[ "<dev string:x252>" ] * 15, color, 1, 1, duration );
            
            if ( display_details && isdefined( level.player ) )
            {
                cam_angles = level.player getplayerangles();
                cam_up = anglestoup( cam_angles );
                text_scale = 0.25;
                new_line = 11 * text_scale;
                normal_len = 15;
                
                if ( isdefined( trace[ "<dev string:x25c>" ] ) )
                {
                    normal_len = trace[ "<dev string:x25c>" ];
                }
                
                text_pos = trace[ "<dev string:x246>" ] + trace[ "<dev string:x252>" ] * normal_len;
                print3d( text_pos, "<dev string:x268>" + trace[ "<dev string:x246>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                
                if ( isdefined( trace[ "<dev string:x277>" ] ) )
                {
                    print3d( text_pos - cam_up * new_line * 1, "<dev string:x289>" + trace[ "<dev string:x277>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                }
                else
                {
                    print3d( text_pos - cam_up * new_line * 1, "<dev string:x298>", ( 1, 1, 1 ), 1, text_scale, duration );
                }
                
                print3d( text_pos - cam_up * new_line * 2, "<dev string:x2ad>" + trace[ "<dev string:x252>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                
                if ( isdefined( trace[ "<dev string:x2b9>" ] ) )
                {
                    print3d( text_pos - cam_up * new_line * 3, "<dev string:x2c5>" + trace[ "<dev string:x2b9>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                }
                else if ( isdefined( trace[ "<dev string:x25c>" ] ) )
                {
                    print3d( text_pos - cam_up * new_line * 3, "<dev string:x2d3>" + trace[ "<dev string:x25c>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                }
                else
                {
                    print3d( text_pos - cam_up * new_line * 3, "<dev string:x2e1>", ( 1, 1, 1 ), 1, text_scale, duration );
                }
                
                if ( isdefined( trace[ "<dev string:x2eb>" ] ) )
                {
                    print3d( text_pos - cam_up * new_line * 4, "<dev string:x2fa>" + trace[ "<dev string:x2eb>" ], ( 1, 1, 1 ), 1, text_scale, duration );
                }
                else
                {
                    print3d( text_pos - cam_up * new_line * 4, "<dev string:x30c>", ( 1, 1, 1 ), 1, text_scale, duration );
                }
                
                if ( isdefined( trace[ "<dev string:x32e>" ] ) )
                {
                    print3d( text_pos - cam_up * new_line * 5, "<dev string:x338>", ( 1, 1, 1 ), 1, text_scale, duration );
                    print3d( text_pos - cam_up * new_line * 6, "<dev string:x34d>" + trace[ "<dev string:x32e>" ] getentitynumber(), ( 1, 1, 1 ), 1, text_scale, duration );
                    print3d( text_pos - cam_up * new_line * 7, "<dev string:x360>" + trace[ "<dev string:x32e>" ].classname, ( 1, 1, 1 ), 1, text_scale, duration );
                    return;
                }
                
                print3d( text_pos - cam_up * new_line * 5, "<dev string:x372>", ( 1, 1, 1 ), 1, text_scale, duration );
            }
        }
    }

    // Namespace trace
    // Params 3, eflags: 0x4
    // Checksum 0xec09805a, Offset: 0x2a79
    // Size: 0x3ea, Type: dev
    function private draw_trace_type( debugdata, color, duration )
    {
        if ( !isdefined( duration ) )
        {
            duration = 1;
        }
        
        half_color = color * 0.75;
        no_color = color * 0.1;
        start = debugdata[ #"start" ];
        
        if ( debugdata[ #"type" ] == #"ray" )
        {
            end = debugdata[ #"end" ];
            dist = distance( debugdata[ #"start" ], debugdata[ #"end" ] );
            sphere( start, 0.15, no_color, 1, duration );
            sphere( end, 0.15, half_color, 1, duration );
            utility::draw_arrow( start, end, no_color, 1, 0, duration );
            line( start, end, half_color, 1, 1, duration );
            return;
        }
        
        if ( debugdata[ #"type" ] == #"sphere" )
        {
            radius = debugdata[ #"radius" ];
            
            if ( isdefined( debugdata[ #"end" ] ) )
            {
                end = debugdata[ #"end" ];
                dist = distance( debugdata[ #"start" ], debugdata[ #"end" ] );
                count = max( ceil( dist / 128 ), 1 );
                
                for ( i = 0; i <= count ; i++ )
                {
                    sphere( vectorlerp( start, end, i / count ), radius, no_color, 0, duration );
                    sphere( vectorlerp( start, end, i / count ), radius, half_color, 1, duration );
                }
                
                utility::draw_arrow( start, end, no_color, 1, 0, duration );
                line( start, end, half_color, 1, 1, duration );
            }
            else
            {
                sphere( start, radius, no_color, 0, duration );
                sphere( start, radius, half_color, 1, duration );
            }
            
            return;
        }
        
        if ( debugdata[ #"type" ] == #"capsule" || debugdata[ #"type" ] == "<dev string:x388>" )
        {
            if ( debugdata[ #"type" ] == "<dev string:x388>" & isdefined( debugdata[ #"character" ] ) )
            {
                angles = debugdata[ #"angles" ];
                capsule_data = debugdata[ #"character" ] physics_getcharactercollisioncapsule();
                radius = capsule_data[ "<dev string:x395>" ];
                height = capsule_data[ "<dev string:x39f>" ] * 2;
            }
            else
            {
                radius = debugdata[ #"radius" ];
                angles = debugdata[ #"angles" ];
                height = debugdata[ #"height" ];
            }
            
            if ( isdefined( debugdata[ #"end" ] ) )
            {
                end = debugdata[ #"end" ];
                dist = distance( debugdata[ #"start" ], debugdata[ #"end" ] );
                count = max( ceil( dist / 128 ), 1 );
                
                for ( i = 0; i <= count ; i++ )
                {
                    utility::draw_capsule( vectorlerp( start, end, i / count ), radius, height, angles, no_color, 0, duration );
                    utility::draw_capsule( vectorlerp( start, end, i / count ), radius, height, angles, half_color, 1, duration );
                }
                
                up = anglestoup( angles );
                start_top = start + up * height;
                end_top = end + up * height;
                utility::draw_arrow( start, end, no_color, 1, 0, duration );
                line( start, end, half_color, 1, 1, duration );
                utility::draw_arrow( start_top, end_top, no_color, 1, 0, duration );
                line( start_top, end_top, half_color, 1, 1, duration );
                return;
            }
            
            utility::draw_capsule( start, radius, height, angles, no_color, 0 );
        }
    }

#/

// Namespace trace
// Params 1
// Checksum 0x686cb556, Offset: 0x2e6b
// Size: 0x64
function internal_pack_default_trace( pos )
{
    return [ "hittype":"hittype_none", "contact_normal":( 0, 0, 0 ), "normal":( 0, 0, 0 ), "shape_position":pos, "position":pos, "distance":0, "surfaceflags":0, "fraction":1 ];
}

/#

    // Namespace trace
    // Params 9, eflags: 0x4
    // Checksum 0x7149a599, Offset: 0x2ed8
    // Size: 0xc7, Type: dev
    function private internal_create_debug_data( trace, type, start, end, radius, height, angles, search_distance, character )
    {
        trace[ #"debugdata" ] = [ #"character":character, #"search_distance":search_distance, #"angles":angles, #"height":height, #"radius":radius, #"end":end, #"start":start, #"type":type ];
        return trace;
    }

#/
