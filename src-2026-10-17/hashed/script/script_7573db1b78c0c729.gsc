#using scripts\common\trace;

#namespace zombie_aeon_navigation;

// Namespace zombie_aeon_navigation
// Params 2
// Checksum 0x76ae934a, Offset: 0x9a
// Size: 0x35f
function init_aeon_navigation( dark_heart_origin, var_8597641bb99fda7e )
{
    level endon( #"game_ended" );
    
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    voxel_size = getdvarfloat( @"hash_ba83c20aafaac380", 200 );
    padding = getdvarfloat( @"hash_ee96a14af4e81b1d", 100 );
    center_ref = dark_heart_origin;
    var_7089792ded87990b = [];
    var_7089792ded87990b[ var_7089792ded87990b.size ] = center_ref;
    
    foreach ( holdout in var_8597641bb99fda7e )
    {
        var_7089792ded87990b[ var_7089792ded87990b.size ] = holdout.origin;
    }
    
    min_x = var_7089792ded87990b[ 0 ][ 0 ];
    min_y = var_7089792ded87990b[ 0 ][ 1 ];
    min_z = var_7089792ded87990b[ 0 ][ 2 ];
    max_x = min_x;
    max_y = min_y;
    max_z = min_z;
    
    foreach ( point in var_7089792ded87990b )
    {
        if ( point[ 0 ] < min_x )
        {
            min_x = point[ 0 ];
        }
        
        if ( point[ 1 ] < min_y )
        {
            min_y = point[ 1 ];
        }
        
        if ( point[ 2 ] < min_z )
        {
            min_z = point[ 2 ];
        }
        
        if ( point[ 0 ] > max_x )
        {
            max_x = point[ 0 ];
        }
        
        if ( point[ 1 ] > max_y )
        {
            max_y = point[ 1 ];
        }
        
        if ( point[ 2 ] > max_z )
        {
            max_z = point[ 2 ];
        }
    }
    
    min_x -= padding;
    min_y -= padding;
    min_z -= padding;
    max_x += padding;
    max_y += padding;
    max_z += padding;
    min_pos = ( min_x, min_y, min_z );
    nx = int( ( max_x - min_x ) / voxel_size ) + 1;
    ny = int( ( max_y - min_y ) / voxel_size ) + 1;
    nz = int( ( max_z - min_z ) / voxel_size ) + 1;
    level.aeon_nav = spawnstruct();
    level.aeon_nav.voxels = [];
    level.aeon_nav.min_pos = min_pos;
    level.aeon_nav.voxel_size = voxel_size;
    level.aeon_nav.nx = nx;
    level.aeon_nav.ny = ny;
    level.aeon_nav.nz = nz;
    level.aeon_nav.b_ready = 0;
    missileclip_contents = physics_createcontents( [ "physicscontents_missileclip" ] );
    level thread function_3cd44a0ee353289c( min_pos, nx, ny, nz, voxel_size, missileclip_contents );
}

// Namespace zombie_aeon_navigation
// Params 6, eflags: 0x4
// Checksum 0x96fb65ec, Offset: 0x401
// Size: 0x85a
function private function_3cd44a0ee353289c( min_pos, nx, ny, nz, voxel_size, missileclip_contents )
{
    level endon( #"game_ended" );
    var_6433eebddcb5040a = getdvarint( @"hash_fb3c377d6dbbf224", 20 );
    obstacle_padding = getdvarint( @"hash_762335c14c9ee7cb", 1 );
    sphere_radius = voxel_size * 0.5;
    trace_count = 0;
    level.aeon_nav.sphere_radius = sphere_radius;
    level.aeon_nav.missileclip_contents = missileclip_contents;
    var_f54defac515eb0db = [];
    
    for ( iz = 0; iz < nz ; iz++ )
    {
        for ( iy = 0; iy < ny ; iy++ )
        {
            for ( ix = 0; ix < nx ; ix++ )
            {
                world_pos = min_pos + ( ix * voxel_size, iy * voxel_size, iz * voxel_size );
                key = ix + "_" + iy + "_" + iz;
                b_clear = trace::sphere_trace_passed( world_pos, world_pos + ( 0, 0, 0.1 ), sphere_radius, undefined, missileclip_contents );
                
                if ( b_clear )
                {
                    VOXEL = spawnstruct();
                    z_offset = getdvarfloat( @"hash_ef06bac91af81aa8", -300 );
                    VOXEL.origin = world_pos + ( 0, 0, z_offset );
                    VOXEL.ix = ix;
                    VOXEL.iy = iy;
                    VOXEL.iz = iz;
                    VOXEL.neighbors = [];
                    level.aeon_nav.voxels[ key ] = VOXEL;
                }
                else
                {
                    blocked = spawnstruct();
                    blocked.ix = ix;
                    blocked.iy = iy;
                    blocked.iz = iz;
                    var_f54defac515eb0db[ var_f54defac515eb0db.size ] = blocked;
                }
                
                trace_count++;
                
                if ( trace_count >= var_6433eebddcb5040a )
                {
                    trace_count = 0;
                    waitframe();
                }
            }
        }
    }
    
    if ( obstacle_padding > 0 )
    {
        foreach ( blocked in var_f54defac515eb0db )
        {
            for ( dy = obstacle_padding * -1; dy <= obstacle_padding ; dy++ )
            {
                for ( dx = obstacle_padding * -1; dx <= obstacle_padding ; dx++ )
                {
                    if ( dx == 0 && dy == 0 )
                    {
                        continue;
                    }
                    
                    pix = blocked.ix + dx;
                    piy = blocked.iy + dy;
                    piz = blocked.iz;
                    pad_key = pix + "_" + piy + "_" + piz;
                    
                    if ( isdefined( level.aeon_nav.voxels[ pad_key ] ) )
                    {
                        level.aeon_nav.voxels[ pad_key ] = undefined;
                    }
                }
            }
        }
    }
    
    a_offsets = [];
    a_offsets[ a_offsets.size ] = ( 1, 0, 0 );
    a_offsets[ a_offsets.size ] = ( -1, 0, 0 );
    a_offsets[ a_offsets.size ] = ( 0, 1, 0 );
    a_offsets[ a_offsets.size ] = ( 0, -1, 0 );
    a_offsets[ a_offsets.size ] = ( 0, 0, 1 );
    a_offsets[ a_offsets.size ] = ( 0, 0, -1 );
    a_keys = getarraykeys( level.aeon_nav.voxels );
    
    foreach ( key in a_keys )
    {
        VOXEL = level.aeon_nav.voxels[ key ];
        
        if ( !isdefined( VOXEL ) )
        {
            continue;
        }
        
        foreach ( offset in a_offsets )
        {
            nix = int( VOXEL.ix + offset[ 0 ] );
            var_8294d51d9db0c4aa = int( VOXEL.iy + offset[ 1 ] );
            var_8294d41d9db0c277 = int( VOXEL.iz + offset[ 2 ] );
            var_49bcf0a827415dbc = nix + "_" + var_8294d51d9db0c4aa + "_" + var_8294d41d9db0c277;
            
            if ( isdefined( level.aeon_nav.voxels[ var_49bcf0a827415dbc ] ) )
            {
                neighbor = level.aeon_nav.voxels[ var_49bcf0a827415dbc ];
                b_connected = trace::sphere_trace_passed( VOXEL.origin, neighbor.origin, sphere_radius, undefined, missileclip_contents );
                
                if ( b_connected )
                {
                    VOXEL.neighbors[ VOXEL.neighbors.size ] = var_49bcf0a827415dbc;
                }
                
                trace_count++;
                
                if ( trace_count >= var_6433eebddcb5040a )
                {
                    trace_count = 0;
                    waitframe();
                }
            }
        }
    }
    
    level.aeon_nav.b_ready = 1;
    var_5f7b46f287a5df5f = getarraykeys( level.aeon_nav.voxels );
    
    foreach ( key in var_5f7b46f287a5df5f )
    {
        VOXEL = level.aeon_nav.voxels[ key ];
        
        if ( !isdefined( VOXEL ) )
        {
            continue;
        }
        
        filtered_neighbors = [];
        
        foreach ( var_49bcf0a827415dbc in VOXEL.neighbors )
        {
            if ( isdefined( level.aeon_nav.voxels[ var_49bcf0a827415dbc ] ) )
            {
                filtered_neighbors[ filtered_neighbors.size ] = var_49bcf0a827415dbc;
            }
        }
        
        VOXEL.neighbors = filtered_neighbors;
    }
    
    var_5f7b46f287a5df5f = getarraykeys( level.aeon_nav.voxels );
    
    foreach ( key in var_5f7b46f287a5df5f )
    {
        VOXEL = level.aeon_nav.voxels[ key ];
        
        if ( isdefined( VOXEL ) && VOXEL.neighbors.size == 0 )
        {
            level.aeon_nav.voxels[ key ] = undefined;
        }
    }
    
    /#
        if ( getdvarint( @"hash_da6a1d946a4d9c9f", 0 ) > 0 )
        {
            level thread function_79d7deb441a0cb01();
        }
    #/
}

// Namespace zombie_aeon_navigation
// Params 1, eflags: 0x4
// Checksum 0xf4c6cab, Offset: 0xc63
// Size: 0x324
function private function_d72e36d9a0e2a877( world_pos )
{
    if ( !level.aeon_nav )
    {
        return;
    }
    
    if ( !isdefined( world_pos ) )
    {
        return;
    }
    
    voxel_size = level.aeon_nav.voxel_size;
    min_pos = level.aeon_nav.min_pos;
    ix = int( ( world_pos[ 0 ] - min_pos[ 0 ] + voxel_size * 0.5 ) / voxel_size );
    iy = int( ( world_pos[ 1 ] - min_pos[ 1 ] + voxel_size * 0.5 ) / voxel_size );
    iz = int( ( world_pos[ 2 ] - min_pos[ 2 ] + voxel_size * 0.5 ) / voxel_size );
    ix = clamp( ix, 0, level.aeon_nav.nx - 1 );
    iy = clamp( iy, 0, level.aeon_nav.ny - 1 );
    iz = clamp( iz, 0, level.aeon_nav.nz - 1 );
    key = ix + "_" + iy + "_" + iz;
    
    if ( isdefined( level.aeon_nav.voxels[ key ] ) )
    {
        return key;
    }
    
    best_key = undefined;
    best_dist = 999999;
    
    for ( radius = 1; radius <= 10 ; radius++ )
    {
        for ( dz = radius * -1; dz <= radius ; dz++ )
        {
            for ( dy = radius * -1; dy <= radius ; dy++ )
            {
                for ( dx = radius * -1; dx <= radius ; dx++ )
                {
                    if ( abs( dx ) != radius && abs( dy ) != radius && abs( dz ) != radius )
                    {
                        continue;
                    }
                    
                    six = ix + dx;
                    siy = iy + dy;
                    siz = iz + dz;
                    
                    if ( six < 0 || six >= level.aeon_nav.nx )
                    {
                        continue;
                    }
                    
                    if ( siy < 0 || siy >= level.aeon_nav.ny )
                    {
                        continue;
                    }
                    
                    if ( siz < 0 || siz >= level.aeon_nav.nz )
                    {
                        continue;
                    }
                    
                    skey = six + "_" + siy + "_" + siz;
                    
                    if ( isdefined( level.aeon_nav.voxels[ skey ] ) )
                    {
                        dist = distancesquared( world_pos, level.aeon_nav.voxels[ skey ].origin );
                        
                        if ( dist < best_dist )
                        {
                            best_dist = dist;
                            best_key = skey;
                        }
                    }
                }
            }
        }
        
        if ( isdefined( best_key ) )
        {
            return best_key;
        }
    }
}

// Namespace zombie_aeon_navigation
// Params 2
// Checksum 0xc53e71ec, Offset: 0xf90
// Size: 0x2fb
function function_5bd26d02aa72e4e7( start_pos, end_pos )
{
    if ( !level.aeon_nav.b_ready )
    {
        return;
    }
    
    start_key = function_d72e36d9a0e2a877( start_pos );
    end_key = function_d72e36d9a0e2a877( end_pos );
    
    if ( !isdefined( start_key ) || !isdefined( end_key ) )
    {
        return;
    }
    
    end_voxel = level.aeon_nav.voxels[ end_key ];
    var_84a4ef293de11769 = end_voxel.ix;
    var_84a4ee293de11536 = end_voxel.iy;
    var_84a4ed293de11303 = end_voxel.iz;
    
    if ( start_key == end_key )
    {
        return [ end_voxel.origin ];
    }
    
    visited = [];
    parent = [];
    queue = [];
    queue_head = 0;
    visited[ start_key ] = 1;
    queue[ queue.size ] = start_key;
    found_key = undefined;
    
    while ( queue_head < queue.size )
    {
        current_key = queue[ queue_head ];
        queue_head++;
        current_voxel = level.aeon_nav.voxels[ current_key ];
        
        if ( !isdefined( current_voxel ) )
        {
            continue;
        }
        
        if ( current_voxel.ix == var_84a4ef293de11769 && current_voxel.iy == var_84a4ee293de11536 && current_voxel.iz == var_84a4ed293de11303 )
        {
            found_key = current_key;
            break;
        }
        
        foreach ( var_49bcf0a827415dbc in current_voxel.neighbors )
        {
            if ( !isdefined( visited[ var_49bcf0a827415dbc ] ) )
            {
                visited[ var_49bcf0a827415dbc ] = 1;
                parent[ var_49bcf0a827415dbc ] = current_key;
                queue[ queue.size ] = var_49bcf0a827415dbc;
            }
        }
    }
    
    if ( !isdefined( found_key ) )
    {
        /#
            if ( getdvarint( @"hash_da6a1d946a4d9c9f", 0 ) > 0 )
            {
                println( "<dev string:x24>" + start_key + "<dev string:x47>" + end_key + "<dev string:x4e>" + queue.size );
            }
        #/
        
        return;
    }
    
    path = [];
    
    for ( key = found_key; isdefined( key ) && isdefined( parent[ key ] ) ; key = parent[ key ] )
    {
        path[ path.size ] = level.aeon_nav.voxels[ key ].origin;
    }
    
    reversed = [];
    
    for ( i = path.size - 1; i >= 0 ; i-- )
    {
        reversed[ reversed.size ] = path[ i ];
    }
    
    return function_c9b5a5d17d8fb107( reversed );
}

// Namespace zombie_aeon_navigation
// Params 1, eflags: 0x4
// Checksum 0x128c295a, Offset: 0x1294
// Size: 0xef
function private function_c9b5a5d17d8fb107( path )
{
    if ( path.size <= 2 )
    {
        return path;
    }
    
    dir_threshold = getdvarfloat( @"hash_12f3385807736d6b", 0.85 );
    pulled = [];
    pulled[ pulled.size ] = path[ 0 ];
    anchor = 0;
    prev_dir = vectornormalize( path[ 1 ] - path[ anchor ] );
    
    for ( i = 2; i < path.size ; i++ )
    {
        cur_dir = vectornormalize( path[ i ] - path[ anchor ] );
        dot = vectordot( prev_dir, cur_dir );
        
        if ( dot < dir_threshold )
        {
            pulled[ pulled.size ] = path[ i - 1 ];
            anchor = i - 1;
            prev_dir = vectornormalize( path[ i ] - path[ anchor ] );
            continue;
        }
        
        prev_dir = cur_dir;
    }
    
    pulled[ pulled.size ] = path[ path.size - 1 ];
    return pulled;
}

// Namespace zombie_aeon_navigation
// Params 1
// Checksum 0xfe1d8d6d, Offset: 0x138c
// Size: 0x2d
function set_nav_goal( position )
{
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    self.nav_goal = position;
}

// Namespace zombie_aeon_navigation
// Params 0
// Checksum 0x6e64b03f, Offset: 0x13c1
// Size: 0x22
function function_70c8f8eedf85e0c1()
{
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    self.nav_goal = undefined;
}

// Namespace zombie_aeon_navigation
// Params 2
// Checksum 0xf4ea038c, Offset: 0x13eb
// Size: 0x56
function function_1e49aa6db8b96807( target_pos, stop_dist )
{
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    self notify( #"stop_navigation" );
    level.aeon_nav.active_aeon = self;
    thread function_ca46b08c5cfa642a( target_pos, stop_dist );
}

// Namespace zombie_aeon_navigation
// Params 0
// Checksum 0x86d726c0, Offset: 0x1449
// Size: 0x81
function function_fe781bbfbc5ebfd1()
{
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    z_offset = getdvarfloat( @"hash_ef06bac91af81aa8", -300 );
    center_pos = level.s_dark_heart.origin + ( 0, 0, z_offset );
    self notify( #"stop_navigation" );
    level.aeon_nav.active_aeon = self;
    thread function_ec3ff1cbe468a33d( center_pos );
}

// Namespace zombie_aeon_navigation
// Params 0
// Checksum 0x656260c4, Offset: 0x14d2
// Size: 0x3f
function stop_navigation()
{
    if ( !( getdvarint( @"hash_3a8ef2bfa46a43f2", 1 ) > 0 ) )
    {
        return;
    }
    
    self notify( #"stop_navigation" );
    function_70c8f8eedf85e0c1();
    self.nav_path = undefined;
    self.nav_path_index = undefined;
}

// Namespace zombie_aeon_navigation
// Params 2, eflags: 0x4
// Checksum 0x9d784e75, Offset: 0x1519
// Size: 0x177
function private function_ca46b08c5cfa642a( target_pos, stop_dist )
{
    self endon( #"death" );
    self endon( #"stop_navigation" );
    reach_dist = getdvarfloat( @"hash_80f0ac08e4327414", 75 );
    path = function_5bd26d02aa72e4e7( self.mover.origin, target_pos );
    
    if ( !isdefined( path ) || path.size == 0 )
    {
        path = [ target_pos ];
        assertmsg( "<dev string:x59>" );
    }
    
    self.nav_path = path;
    var_f2be4bedba103e1a = 0;
    
    for ( i = 0; i < path.size ; i++ )
    {
        self.nav_path_index = i;
        waypoint = path[ i ];
        set_nav_goal( waypoint );
        
        while ( distance( self.mover.origin, waypoint ) > reach_dist )
        {
            if ( distance2d( self.mover.origin, target_pos ) <= stop_dist )
            {
                var_f2be4bedba103e1a = 1;
                break;
            }
            
            waitframe();
        }
        
        if ( var_f2be4bedba103e1a )
        {
            break;
        }
    }
    
    if ( var_f2be4bedba103e1a )
    {
        set_nav_goal( self.mover.origin );
    }
    else
    {
        set_nav_goal( target_pos );
    }
    
    self.nav_path = undefined;
    self.nav_path_index = undefined;
}

// Namespace zombie_aeon_navigation
// Params 1, eflags: 0x4
// Checksum 0x35bf2fa, Offset: 0x1698
// Size: 0x185
function private function_ec3ff1cbe468a33d( center_pos )
{
    self endon( #"death" );
    self endon( #"stop_navigation" );
    reach_dist = getdvarfloat( @"hash_80f0ac08e4327414", 75 );
    var_f167d93f17687090 = getdvarfloat( @"hash_e6b484eedef6c5ce", 150 );
    path = function_5bd26d02aa72e4e7( self.mover.origin, center_pos );
    
    if ( !isdefined( path ) || path.size == 0 )
    {
        self.nav_path = undefined;
        self.nav_path_index = undefined;
        set_nav_goal( center_pos );
        
        while ( distance( self.mover.origin, center_pos ) > var_f167d93f17687090 )
        {
            waitframe();
        }
        
        function_70c8f8eedf85e0c1();
        return;
    }
    
    self.nav_path = path;
    
    for ( i = 0; i < path.size ; i++ )
    {
        self.nav_path_index = i;
        waypoint = path[ i ];
        set_nav_goal( waypoint );
        
        while ( distance( self.mover.origin, waypoint ) > reach_dist )
        {
            waitframe();
        }
    }
    
    set_nav_goal( center_pos );
    
    while ( distance( self.mover.origin, center_pos ) > var_f167d93f17687090 )
    {
        waitframe();
    }
    
    function_70c8f8eedf85e0c1();
    self.nav_path = undefined;
    self.nav_path_index = undefined;
}

/#

    // Namespace zombie_aeon_navigation
    // Params 0, eflags: 0xc
    // Checksum 0x3476685e, Offset: 0x1825
    // Size: 0x2f5, Type: dev
    function private function_79d7deb441a0cb01()
    {
        self notify( #"hash_3c5e9343e0999363" );
        self endon( #"hash_3c5e9343e0999363" );
        level endon( #"game_ended" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_da6a1d946a4d9c9f", 0 ) <= 0 )
            {
                wait 1;
                continue;
            }
            
            a_keys = getarraykeys( level.aeon_nav.voxels );
            
            foreach ( key in a_keys )
            {
                VOXEL = level.aeon_nav.voxels[ key ];
                sphere( VOXEL.origin, 10, ( 0, 1, 0 ), 1, 1 );
                
                foreach ( var_49bcf0a827415dbc in VOXEL.neighbors )
                {
                    neighbor = level.aeon_nav.voxels[ var_49bcf0a827415dbc ];
                    line( VOXEL.origin, neighbor.origin, ( 0, 0.5, 0 ), 1, 1, 1 );
                }
            }
            
            aeon = level.aeon_nav.active_aeon;
            
            if ( isdefined( aeon ) && isdefined( aeon.nav_path ) && isdefined( aeon.nav_path_index ) )
            {
                nav_path = aeon.nav_path;
                path_idx = aeon.nav_path_index;
                
                if ( path_idx < nav_path.size )
                {
                    line( aeon.mover.origin, nav_path[ path_idx ], ( 1, 0, 0 ), 1, 1, 1 );
                    sphere( nav_path[ path_idx ], 20, ( 1, 0, 0 ), 1, 1 );
                }
                
                for ( pi = path_idx; pi < nav_path.size - 1 ; pi++ )
                {
                    line( nav_path[ pi ], nav_path[ pi + 1 ], ( 1, 1, 0 ), 1, 1, 1 );
                    sphere( nav_path[ pi + 1 ], 15, ( 1, 1, 0 ), 1, 1 );
                }
            }
            
            waitframe();
        }
    }

#/
