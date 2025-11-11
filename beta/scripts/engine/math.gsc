#using scripts\engine\utility;

#namespace math;

// Namespace math
// Params 2
// Checksum 0xf4a431a6, Offset: 0xc6
// Size: 0x36
function anglebetweenvectors( vector1, vector2 )
{
    return acos( clamp( vectordot( vector1, vector2 ) / length( vector1 ) * length( vector2 ), -1, 1 ) );
}

// Namespace math
// Params 2
// Checksum 0x2621d8c8, Offset: 0x105
// Size: 0x20
function anglebetweenvectorsunit( v1, v2 )
{
    return acos( vectordot( v1, v2 ) );
}

// Namespace math
// Params 3
// Checksum 0x69e2281d, Offset: 0x12e
// Size: 0x83
function anglebetweenvectorssigned( vector1, vector2, reference_norm )
{
    vec1 = vectornormalize( vector1 );
    vec2 = vectornormalize( vector2 );
    angle = acos( clamp( vectordot( vec1, vec2 ), -1, 1 ) );
    cross = vectorcross( vec1, vec2 );
    
    if ( vectordot( cross, reference_norm ) < 0 )
    {
        angle *= -1;
    }
    
    return angle;
}

// Namespace math
// Params 3
// Checksum 0x4eb99f13, Offset: 0x1ba
// Size: 0x27
function lerp( from, to, frac )
{
    return from + ( to - from ) * frac;
}

// Namespace math
// Params 3
// Checksum 0x5040f002, Offset: 0x1ea
// Size: 0x27
function lerp_fraction( from, to, n )
{
    return ( n - from ) / ( to - from );
}

// Namespace math
// Params 3
// Checksum 0xb5299743, Offset: 0x21a
// Size: 0x4d
function fake_slerp( from, to, fraction )
{
    return ( angle_lerp( from[ 0 ], to[ 0 ], fraction ), angle_lerp( from[ 1 ], to[ 1 ], fraction ), angle_lerp( from[ 2 ], to[ 2 ], fraction ) );
}

// Namespace math
// Params 3
// Checksum 0x52b154ea, Offset: 0x270
// Size: 0x30
function angle_lerp( from, to, fraction )
{
    return angleclamp( from + angleclamp180( to - from ) * fraction );
}

// Namespace math
// Params 3
// Checksum 0x4aac0286, Offset: 0x2a9
// Size: 0x55
function get_dot( start_origin, start_angles, end_origin )
{
    normal = vectornormalize( end_origin - start_origin );
    forward = anglestoforward( start_angles );
    dot = vectordot( forward, normal );
    return dot;
}

// Namespace math
// Params 2
// Checksum 0x283f391e, Offset: 0x307
// Size: 0x2d
function vector_project_onto_plane( vector, normal )
{
    return vector - vectordot( normal, vector ) / squared( length( normal ) ) * normal;
}

// Namespace math
// Params 3
// Checksum 0xda790339, Offset: 0x33d
// Size: 0x67
function vector_project_endpoint( origin, angles, len )
{
    assert( isdefined( origin ) );
    assert( isdefined( angles ) );
    assert( isdefined( len ) );
    dir = anglestoforward( angles );
    dir *= len;
    end = origin + dir;
    return end;
}

// Namespace math
// Params 2
// Checksum 0x1fc3b06a, Offset: 0x3ad
// Size: 0x28
function vector_reflect( vector, normal )
{
    return vectornormalize( 2 * vector_project_onto_plane( vector, normal ) - vector );
}

// Namespace math
// Params 3
// Checksum 0x6a159af8, Offset: 0x3de
// Size: 0x74
function vector_area_parallelogram( v, a, b )
{
    assert( isdefined( v ) );
    assert( isdefined( a ) );
    assert( isdefined( b ) );
    return a[ 0 ] * b[ 1 ] - a[ 1 ] * b[ 0 ] + b[ 0 ] * v[ 1 ] - v[ 0 ] * b[ 1 ] + v[ 0 ] * a[ 1 ] - a[ 0 ] * v[ 1 ];
}

// Namespace math
// Params 2
// Checksum 0x847e81dd, Offset: 0x45b
// Size: 0x21
function scalar_projection( veca, vecb )
{
    return vectordot( vectornormalize( veca ), vecb );
}

// Namespace math
// Params 4
// Checksum 0x2f352b9a, Offset: 0x485
// Size: 0x86
function get_point_on_parabola( start, end, height, t )
{
    parabolic_t = t * 2 - 1;
    direction = end - start;
    up = ( 0, 0, 1 );
    result = start + t * direction;
    result += ( parabolic_t * parabolic_t * -1 + 1 ) * height * up;
    return result;
}

// Namespace math
// Params 2
// Checksum 0xc0c8bef1, Offset: 0x514
// Size: 0x41
function get_mid_point( point_1, point_2 )
{
    return ( ( point_1[ 0 ] + point_2[ 0 ] ) * 0.5, ( point_1[ 1 ] + point_2[ 1 ] ) * 0.5, ( point_1[ 2 ] + point_2[ 2 ] ) * 0.5 );
}

// Namespace math
// Params 3
// Checksum 0x41420f6b, Offset: 0x55e
// Size: 0xe3
function round_float( value, precision, down )
{
    assert( isdefined( value ), "<dev string:x24>" );
    assert( isdefined( precision ), "<dev string:x3e>" );
    assert( precision == int( precision ), "<dev string:x5c>" );
    precision = int( precision );
    
    if ( precision < 0 || precision > 4 )
    {
        assertmsg( "<dev string:x7d>" + precision );
        return value;
    }
    
    decimal_offset = 1;
    
    for ( i = 1; i <= precision ; i++ )
    {
        decimal_offset *= 10;
    }
    
    var_6a228c18a70107df = value * decimal_offset;
    
    if ( !isdefined( down ) || down )
    {
        var_6a228c18a70107df = floor( var_6a228c18a70107df );
    }
    else
    {
        var_6a228c18a70107df = ceil( var_6a228c18a70107df );
    }
    
    value = var_6a228c18a70107df / decimal_offset;
    return value;
}

// Namespace math
// Params 3
// Checksum 0xdc659b1a, Offset: 0x64a
// Size: 0x4a
function round_millisec_on_sec( value, precision, down )
{
    value_seconds = value / 1000;
    value_seconds = round_float( value_seconds, precision, down );
    value = value_seconds * 1000;
    return int( value );
}

// Namespace math
// Params 5
// Checksum 0x182adbd3, Offset: 0x69d
// Size: 0x40
function remap( value, min1, max1, min2, max2 )
{
    return min2 + ( value - min1 ) * ( max2 - min2 ) / ( max1 - min1 );
}

// Namespace math
// Params 3
// Checksum 0x5baa2964, Offset: 0x6e6
// Size: 0x8a
function normalize_value( clamp_a, clamp_b, var_be1bef06e8004725 )
{
    if ( clamp_a > clamp_b )
    {
        upper = clamp_a;
        clamp_a = clamp_b;
        clamp_b = upper;
    }
    
    if ( var_be1bef06e8004725 > clamp_b )
    {
        return 1;
    }
    else if ( var_be1bef06e8004725 < clamp_a )
    {
        return 0;
    }
    else if ( clamp_a == clamp_b )
    {
        assertmsg( "<dev string:xcf>" + clamp_a + "<dev string:xdc>" + clamp_b + "<dev string:xe7>" );
    }
    
    return ( var_be1bef06e8004725 - clamp_a ) / ( clamp_b - clamp_a );
}

// Namespace math
// Params 3
// Checksum 0x5b83bd8a, Offset: 0x779
// Size: 0x2c
function normalized_to_growth_clamps( min, max, value )
{
    return ( max - min ) * squared( value ) + min;
}

// Namespace math
// Params 3
// Checksum 0x257566df, Offset: 0x7ae
// Size: 0x2c
function normalized_to_decay_clamps( min, max, value )
{
    return normalized_to_growth_clamps( min, max, 1 - value );
}

// Namespace math
// Params 1
// Checksum 0xe3d44547, Offset: 0x7e3
// Size: 0x1e
function normalized_parabola( x )
{
    return -1 * squared( 2 * x - 1 ) + 1;
}

// Namespace math
// Params 1
// Checksum 0x51d78632, Offset: 0x80a
// Size: 0x42
function normalized_sin_wave( x )
{
    y = x * 2 * 3.14159 - 1.5708;
    y = ( sin( radians_to_degrees( y ) ) + 1 ) * 0.5;
    return y;
}

// Namespace math
// Params 1
// Checksum 0xce3de474, Offset: 0x855
// Size: 0x3c
function normalized_cos_wave( x )
{
    y = x * 2 * 3.14159;
    y = ( cos( radians_to_degrees( y ) ) + 1 ) * 0.5;
    return y;
}

// Namespace math
// Params 2
// Checksum 0x2bc7b950, Offset: 0x89a
// Size: 0x3a
function normalized_offset( value, offsetamount )
{
    value += offsetamount;
    
    if ( value > 1 )
    {
        value -= 1;
    }
    
    if ( value < 0 )
    {
        value += 1;
    }
    
    return value;
}

// Namespace math
// Params 1
// Checksum 0x9fef121b, Offset: 0x8dd
// Size: 0x14
function radians_to_degrees( radians )
{
    return radians * 57.2958;
}

// Namespace math
// Params 1
// Checksum 0x44328ce1, Offset: 0x8fa
// Size: 0x14
function degrees_to_radians( degrees )
{
    return degrees * 0.0174533;
}

// Namespace math
// Params 3
// Checksum 0xf9a16855, Offset: 0x917
// Size: 0x2b
function factor_value( min_val, max_val, factor_val )
{
    return max_val * factor_val + min_val * ( 1 - factor_val );
}

// Namespace math
// Params 1
// Checksum 0x85d9d02f, Offset: 0x94b
// Size: 0x5e
function function_9ea98c1d15ba99ce( num )
{
    if ( num < 0.5 )
    {
        num *= 2;
        num = normalized_float_smooth_in( num );
        num *= 0.5;
    }
    else
    {
        num = ( num - 0.5 ) * 2;
        num = normalized_float_smooth_out( num );
        num = num * 0.5 + 0.5;
    }
    
    return num;
}

// Namespace math
// Params 1
// Checksum 0xbcc97535, Offset: 0x9b2
// Size: 0x10
function normalized_float_smooth_in( num )
{
    return num * num;
}

// Namespace math
// Params 1
// Checksum 0xf678f75b, Offset: 0x9cb
// Size: 0x22
function normalized_float_smooth_out( num )
{
    num = 1 - num;
    num *= num;
    num = 1 - num;
    return num;
}

// Namespace math
// Params 4
// Checksum 0x63b7d12f, Offset: 0x9f6
// Size: 0x8b
function line_to_plane_intersection( var_d4a14c1c2935f5ca, var_d4a14b1c2935f397, plane_point, plane_normal )
{
    d = vectordot( plane_normal, plane_point );
    ray = var_d4a14b1c2935f397 - var_d4a14c1c2935f5ca;
    var_fb8c52976cbf82f6 = vectordot( plane_normal, ray );
    
    if ( var_fb8c52976cbf82f6 == 0 )
    {
        return undefined;
    }
    
    t = ( d - vectordot( plane_normal, var_d4a14c1c2935f5ca ) ) / var_fb8c52976cbf82f6;
    intersection_point = var_d4a14c1c2935f5ca + ray * t;
    return intersection_point;
}

// Namespace math
// Params 3
// Checksum 0x9031a6cd, Offset: 0xa8a
// Size: 0x64, Type: bool
function function_47d0ed373b25c699( point, aabb_min, aabb_max )
{
    return point[ 0 ] <= aabb_max[ 0 ] && point[ 0 ] >= aabb_min[ 0 ] && point[ 1 ] <= aabb_max[ 1 ] && point[ 1 ] >= aabb_min[ 1 ] && point[ 2 ] <= aabb_max[ 2 ] && point[ 2 ] >= aabb_min[ 2 ];
}

// Namespace math
// Params 4
// Checksum 0xb168c0f9, Offset: 0xaf7
// Size: 0x9b, Type: bool
function function_4cf4185ddbaca596( point, yaw, var_bd160eb7f794536d, var_aef1d9ace20c6967 )
{
    var_ce7447cbebe28d4c = anglestoaxis( ( 0, yaw, 0 ) );
    v = point - var_bd160eb7f794536d;
    return abs( vectordot( v, var_ce7447cbebe28d4c[ "forward" ] ) ) <= var_aef1d9ace20c6967[ 0 ] && abs( vectordot( v, var_ce7447cbebe28d4c[ "right" ] ) ) <= var_aef1d9ace20c6967[ 1 ] && abs( vectordot( v, var_ce7447cbebe28d4c[ "up" ] ) ) <= var_aef1d9ace20c6967[ 2 ];
}

// Namespace math
// Params 4
// Checksum 0xaec7e7fb, Offset: 0xb9b
// Size: 0x38
function ray_to_plane_intersection_distance( rayorigin, raydirection, var_349301d833e3afa9, planenormal )
{
    return vectordot( var_349301d833e3afa9 - rayorigin, planenormal ) / vectordot( raydirection, planenormal );
}

// Namespace math
// Params 3
// Checksum 0xccfacee, Offset: 0xbdc
// Size: 0x8c
function function_f0bb04c1592d3497( point_a, point_b, location )
{
    if ( distancesquared( point_a, point_b ) < 0.1 )
    {
        return distancesquared( point_a, location );
    }
    
    var_d897dee97b062905 = location - point_a;
    a_to_b = point_b - point_a;
    var_ee1bbdc865f36457 = clamp( vectordot( var_d897dee97b062905, a_to_b ) / vectordot( a_to_b, a_to_b ), 0, 1 );
    closest_point = point_a + a_to_b * var_ee1bbdc865f36457;
    return lengthsquared( location - closest_point );
}

// Namespace math
// Params 5
// Checksum 0x21cd4cb7, Offset: 0xc71
// Size: 0x182, Type: bool
function function_5795923c67b62e4e( pointa, pointb, boxorigin, boxangles, boxbounds )
{
    pointa = coordtransformtranspose( pointa, boxorigin, boxangles );
    pointb = coordtransformtranspose( pointb, boxorigin, boxangles );
    var_5cc1c67022fe6da0 = pointb - pointa;
    var_cff7681bc6ecca27 = 1 / vectornormalize( var_5cc1c67022fe6da0 );
    halfbounds = boxbounds / 2;
    negativehalfbounds = -1 * halfbounds;
    t1 = ( negativehalfbounds[ 0 ] - pointa[ 0 ] ) * var_cff7681bc6ecca27[ 0 ];
    t2 = ( halfbounds[ 0 ] - pointa[ 0 ] ) * var_cff7681bc6ecca27[ 0 ];
    t3 = ( negativehalfbounds[ 1 ] - pointa[ 1 ] ) * var_cff7681bc6ecca27[ 1 ];
    t4 = ( halfbounds[ 1 ] - pointa[ 1 ] ) * var_cff7681bc6ecca27[ 1 ];
    t5 = ( negativehalfbounds[ 2 ] - pointa[ 2 ] ) * var_cff7681bc6ecca27[ 2 ];
    t6 = ( halfbounds[ 2 ] - pointa[ 2 ] ) * var_cff7681bc6ecca27[ 2 ];
    tmin = max( max( min( t1, t2 ), min( t3, t4 ) ), min( t5, t6 ) );
    tmax = min( min( max( t1, t2 ), max( t3, t4 ) ), max( t5, t6 ) );
    
    if ( tmax < 0 )
    {
        return false;
    }
    
    if ( tmin > tmax )
    {
        return false;
    }
    
    if ( tmin > length( var_5cc1c67022fe6da0 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace math
// Params 3
// Checksum 0x148e6972, Offset: 0xdfc
// Size: 0x92, Type: bool
function function_5f3cda415a9be47c( point, start, end )
{
    point2d = ( point[ 0 ], point[ 1 ], 0 );
    start2d = ( start[ 0 ], start[ 1 ], 0 );
    end2d = ( end[ 0 ], end[ 1 ], 0 );
    topoint = vectornormalize( point2d - start2d );
    forward = vectornormalize( end2d - start2d );
    dot = vectordot( topoint, forward );
    return dot > 0;
}

// Namespace math
// Params 4
// Checksum 0x61de2e23, Offset: 0xe97
// Size: 0x1ed
function function_14a305b0209b352c( start, end, circlecenter, circleradius )
{
    x1 = start[ 0 ] - circlecenter[ 0 ];
    y1 = start[ 1 ] - circlecenter[ 1 ];
    x2 = end[ 0 ] - circlecenter[ 0 ];
    y2 = end[ 1 ] - circlecenter[ 1 ];
    r = float( circleradius );
    dx = x2 - x1;
    dy = y2 - y1;
    dr = dx * dx + dy * dy;
    d = x1 * y2 - x2 * y1;
    dis = r * r * dr - d * d;
    
    if ( dis < 0 )
    {
        return;
    }
    
    if ( dis == 0 )
    {
        pointx = d * dy / dr + circlecenter[ 0 ];
        pointy = -1 * d * dx / dr + circlecenter[ 1 ];
        return [ ( pointx, pointy, 0 ) ];
    }
    
    sqrtdis = sqrt( dis );
    xa = d * dy;
    xb = utility::sign( dy ) * dx * sqrtdis;
    point1x = ( xa + xb ) / dr + circlecenter[ 0 ];
    point2x = ( xa - xb ) / dr + circlecenter[ 0 ];
    ya = -1 * d * dx;
    yb = abs( dy ) * sqrtdis;
    point1y = ( ya + yb ) / dr + circlecenter[ 1 ];
    point2y = ( ya - yb ) / dr + circlecenter[ 1 ];
    return [ ( point1x, point1y, 0 ), ( point2x, point2y, 0 ) ];
}

// Namespace math
// Params 4
// Checksum 0x16e05d7f, Offset: 0x108c
// Size: 0xf2
function function_58dd1731345885d3( var_985142fcf9952f76, radius1, center2, radius2 )
{
    distance = distance2d( var_985142fcf9952f76, center2 );
    
    if ( distance >= radius1 + radius2 )
    {
        return undefined;
    }
    
    if ( distance <= abs( radius1 - radius2 ) )
    {
        if ( radius1 < radius2 )
        {
            return { #var_f93905958736347f:1, #radius:radius1, #center:var_985142fcf9952f76 };
        }
        else
        {
            return { #var_f93905958736347f:1, #radius:radius2, #center:center2 };
        }
    }
    
    maxradius = ( radius1 + radius2 - distance ) / 2;
    direction = ( center2 - var_985142fcf9952f76 ) / distance;
    var_491917f3daa85d4e = var_985142fcf9952f76 + direction * ( radius1 - maxradius );
    return { #radius:maxradius, #center:var_491917f3daa85d4e };
}

// Namespace math
// Params 4
// Checksum 0x22acddf0, Offset: 0x1187
// Size: 0x107
function function_d7775bc5c201ec83( start, end, circleorigin, circleradius )
{
    result = function_14a305b0209b352c( start, end, circleorigin, circleradius );
    
    if ( !isdefined( result ) )
    {
        return;
    }
    
    if ( result.size == 1 )
    {
        if ( function_5f3cda415a9be47c( result[ 0 ], start, end ) )
        {
            return result;
        }
        
        return;
    }
    
    pt1valid = function_5f3cda415a9be47c( result[ 0 ], start, end );
    pt2valid = function_5f3cda415a9be47c( result[ 1 ], start, end );
    
    if ( !pt1valid && !pt2valid )
    {
        return;
    }
    
    if ( pt1valid && !pt2valid )
    {
        return result[ 0 ];
    }
    
    if ( pt2valid && !pt1valid )
    {
        return result[ 1 ];
    }
    
    distsq1 = distance2dsquared( start, result[ 0 ] );
    distsq2 = distance2dsquared( start, result[ 1 ] );
    
    if ( distsq1 < distsq2 )
    {
        return result[ 0 ];
    }
    
    return result[ 1 ];
}

// Namespace math
// Params 3
// Checksum 0xde2acdcc, Offset: 0x1296
// Size: 0x65
function function_13baf942c4a29776( point, firstsegment, secondsegment )
{
    closestpointa = pointonsegmentnearesttopoint( firstsegment[ 0 ], firstsegment[ 1 ], point );
    closestpointb = pointonsegmentnearesttopoint( secondsegment[ 0 ], secondsegment[ 1 ], point );
    
    if ( distance2dsquared( point, closestpointa ) > distance2dsquared( point, closestpointb ) )
    {
        return closestpointa;
    }
    
    return closestpointb;
}

// Namespace math
// Params 4
// Checksum 0x16130ccd, Offset: 0x1304
// Size: 0x8b, Type: bool
function segmentvssphere( pointa, pointb, spherecenter, sphereradius )
{
    if ( pointa == pointb )
    {
        return false;
    }
    
    var_d643e9ac5916e2a5 = spherecenter - pointa;
    atob = pointb - pointa;
    atobscalar = clamp( vectordot( var_d643e9ac5916e2a5, atob ) / vectordot( atob, atob ), 0, 1 );
    closestpoint = pointa + atob * atobscalar;
    return lengthsquared( spherecenter - closestpoint ) <= sphereradius * sphereradius;
}

// Namespace math
// Params 8
// Checksum 0x42c970d2, Offset: 0x1398
// Size: 0xb6, Type: bool
function pointvscone( point, coneorigin, coneforward, coneup, conelen, conelenoffset, coneang, conehalfheight )
{
    starttopoint = point - coneorigin;
    starttopointforward = vectordot( starttopoint, coneforward );
    starttopointup = vectordot( starttopoint, coneup );
    
    if ( starttopointforward > conelen )
    {
        return false;
    }
    
    if ( starttopointforward < conelenoffset )
    {
        return false;
    }
    
    if ( isdefined( conehalfheight ) )
    {
        if ( abs( starttopointup ) > conehalfheight )
        {
            return false;
        }
    }
    
    if ( anglebetweenvectors( coneforward, starttopoint ) > coneang )
    {
        return false;
    }
    
    return true;
}

// Namespace math
// Params 5
// Checksum 0x90df7f73, Offset: 0x1457
// Size: 0x85, Type: bool
function pointvscylinder( point, radiussqr, height, origin, up )
{
    btwn = point - origin;
    vmag = vectordot( btwn, up );
    
    if ( vmag < 0 || vmag > height )
    {
        return false;
    }
    
    btwn -= vmag * up;
    var_bcd73deb9a8030ed = lengthsquared( btwn );
    
    if ( var_bcd73deb9a8030ed > radiussqr )
    {
        return false;
    }
    
    return true;
}

// Namespace math
// Params 3
// Checksum 0x747187ce, Offset: 0x14e5
// Size: 0x4a
function point_side_of_line2d( v, a, b )
{
    area = vector_area_parallelogram( v, a, b );
    
    if ( area > 0 )
    {
        return "left";
    }
    
    return "right";
}

// Namespace math
// Params 3
// Checksum 0x154a67da, Offset: 0x1538
// Size: 0x56
function wrap( min, max, value )
{
    range_size = max - min + 1;
    
    if ( value < min )
    {
        value += range_size * int( ( min - value ) / range_size + 1 );
    }
    
    return min + ( value - min ) % range_size;
}

// Namespace math
// Params 3
// Checksum 0xf78aa703, Offset: 0x1597
// Size: 0x9e
function point_in_fov( origin, fov, checkpitch )
{
    if ( !isdefined( origin ) )
    {
        return;
    }
    
    if ( !isdefined( fov ) )
    {
        fov = 0.766;
    }
    
    if ( isent( self ) && isplayer( self ) )
    {
        forward = anglestoforward( self getplayerangles( !checkpitch ) );
    }
    else
    {
        forward = anglestoforward( self.angles );
    }
    
    normalvec = vectornormalize( origin - self.origin );
    dot = vectordot( forward, normalvec );
    return dot > fov;
}

// Namespace math
// Params 4
// Checksum 0x44f83eba, Offset: 0x163e
// Size: 0x69, Type: bool
function within_fov_2d( start_origin, start_angles, end_origin, fov )
{
    normal = vectornormalize( ( end_origin[ 0 ], end_origin[ 1 ], 0 ) - ( start_origin[ 0 ], start_origin[ 1 ], 0 ) );
    forward = anglestoforward( ( 0, start_angles[ 1 ], 0 ) );
    return vectordot( forward, normal ) >= fov;
}

// Namespace math
// Params 1
// Checksum 0x13719b12, Offset: 0x16b0
// Size: 0x87, Type: bool
function is_point_in_front( point )
{
    dot = 0;
    
    if ( isent( self ) && isplayer( self ) )
    {
        to_point = point - self getorigin();
        forward = anglestoforward( self getplayerangles( 1 ) );
        dot = vectordot( to_point, forward );
    }
    else
    {
        to_point = point - self.origin;
        forward = anglestoforward( self.angles );
        dot = vectordot( to_point, forward );
    }
    
    return dot > 0;
}

// Namespace math
// Params 1
// Checksum 0x9f2f86ff, Offset: 0x1740
// Size: 0x7e, Type: bool
function is_point_on_right( point )
{
    dot = 0;
    
    if ( isplayer( self ) )
    {
        to_point = point - self getorigin();
        right = anglestoright( self getplayerangles( 1 ) );
        dot = vectordot( to_point, right );
    }
    else
    {
        to_point = point - self.origin;
        right = anglestoright( self.angles );
        dot = vectordot( to_point, right );
    }
    
    return dot > 0;
}

// Namespace math
// Params 3
// Checksum 0x1ee4471a, Offset: 0x17c7
// Size: 0x5c, Type: bool
function function_84e592007021cc09( dir, forward_vec, up_vec )
{
    if ( !isdefined( up_vec ) )
    {
        up_vec = ( 0, 0, 1 );
    }
    
    cross = vectorcross( forward_vec, up_vec );
    dot = vectordot( cross, dir );
    return dot > 0;
}

// Namespace math
// Params 4
// Checksum 0x824cd3ae, Offset: 0x182c
// Size: 0xca
function function_1243a6cc6a030f2a( point, center, half_size, forward_angles )
{
    var_f9879ff969b2ef1a = point - center;
    result = center;
    axis_array = anglestoaxis( forward_angles );
    axis_vecs = [ axis_array[ "forward" ], axis_array[ "right" ], axis_array[ "up" ] ];
    
    for ( i = 0; i <= 2 ; i++ )
    {
        dist = vectordot( axis_vecs[ i ], var_f9879ff969b2ef1a );
        dist = clamp( dist, -1 * half_size[ i ], half_size[ i ] );
        result += dist * axis_vecs[ i ];
    }
    
    return result;
}

// Namespace math
// Params 3
// Checksum 0x49b7f2fa, Offset: 0x18ff
// Size: 0x88
function function_2e0e9b10b9c74d9e( point, var_57136d99fd1ddd84, var_524c017e561062fd )
{
    var_78b4bb7db693be9a = var_524c017e561062fd - var_57136d99fd1ddd84;
    var_869d7adaacf23a0b = point - var_57136d99fd1ddd84;
    var_58c5e9b71b63dbc5 = vectordot( var_78b4bb7db693be9a, var_78b4bb7db693be9a );
    
    if ( var_58c5e9b71b63dbc5 == 0 )
    {
        return var_57136d99fd1ddd84;
    }
    
    t = vectordot( var_869d7adaacf23a0b, var_78b4bb7db693be9a ) / var_58c5e9b71b63dbc5;
    t = clamp( t, 0, 1 );
    closest_point = var_57136d99fd1ddd84 + t * var_78b4bb7db693be9a;
    return closest_point;
}

// Namespace math
// Params 0
// Checksum 0xe67aa0b2, Offset: 0x1990
// Size: 0x27
function random_vector_2d()
{
    var_4d9b73147ea83832 = randomfloat( 360 );
    return ( cos( var_4d9b73147ea83832 ), sin( var_4d9b73147ea83832 ), 0 );
}

// Namespace math
// Params 1
// Checksum 0x60638f21, Offset: 0x19c0
// Size: 0x58
function set_matrix_from_up( new_up )
{
    current_foward = anglestoforward( self.angles );
    new_right = vectorcross( current_foward, new_up );
    new_forward = vectorcross( new_up, new_right );
    self.angles = axistoangles( new_forward, new_right, new_up );
}

// Namespace math
// Params 2
// Checksum 0x76926de2, Offset: 0x1a20
// Size: 0x39
function set_matrix_from_up_and_angles( new_up, var_6212749e8a0bfd6e )
{
    if ( !isdefined( var_6212749e8a0bfd6e ) )
    {
        var_6212749e8a0bfd6e = self.angles;
    }
    
    self.angles = build_matrix_from_up_and_angles( new_up, var_6212749e8a0bfd6e );
}

// Namespace math
// Params 2
// Checksum 0xc6ff3ffb, Offset: 0x1a61
// Size: 0x6c
function build_matrix_from_up_and_angles( new_up, var_6212749e8a0bfd6e )
{
    var_4457dd7dff80535a = acos( -1 * vectordot( anglestoforward( var_6212749e8a0bfd6e ), new_up ) );
    new_forward = anglestoup( var_6212749e8a0bfd6e + ( var_4457dd7dff80535a, 0, 0 ) );
    new_right = vectorcross( new_forward, new_up );
    new_forward = vectorcross( new_up, new_right );
    return axistoangles( new_forward, new_right, new_up );
}

// Namespace math
// Params 3
// Checksum 0x2a84796a, Offset: 0x1ad6
// Size: 0x29
function critically_damped_move_to( target_pos, spring_factor, start_speed )
{
    thread critically_damped_move_to_thread( target_pos, spring_factor, start_speed );
}

// Namespace math
// Params 3
// Checksum 0x73033412, Offset: 0x1b07
// Size: 0xae
function critically_damped_move_to_thread( target_pos, spring_factor, start_speed )
{
    self endon( "death" );
    self endon( "stop_spring" );
    
    if ( !isdefined( start_speed ) )
    {
        start_speed = 1;
    }
    
    spring_index = spring_make_critically_damped( spring_factor, self.origin, anglestoforward( self.angles ) * start_speed );
    
    while ( distancesquared( self.origin, target_pos ) > squared( 0.1 ) )
    {
        self.origin = spring_update( spring_index, target_pos );
        wait 0.05;
    }
    
    self notify( "movedone" );
    spring_delete( spring_index );
}

// Namespace math
// Params 3
// Checksum 0xeec95efd, Offset: 0x1bbd
// Size: 0x29
function critically_damped_move_and_rotate_to( target_pos, spring_factor, start_speed )
{
    thread critically_damped_move_and_rotate_to_thread( target_pos, spring_factor, start_speed );
}

// Namespace math
// Params 3
// Checksum 0x750f82dd, Offset: 0x1bee
// Size: 0xc3
function critically_damped_move_and_rotate_to_thread( target_pos, spring_factor, start_speed )
{
    self endon( "death" );
    self endon( "stop_spring" );
    
    if ( !isdefined( start_speed ) )
    {
        start_speed = 1;
    }
    
    spring_index = spring_make_critically_damped( spring_factor, self.origin, anglestoforward( self.angles ) * start_speed );
    
    while ( distancesquared( self.origin, target_pos ) > squared( 0.1 ) )
    {
        self.origin = spring_update( spring_index, target_pos );
        self.angles = vectortoangles( spring_get_vel( spring_index ) );
        wait 0.05;
    }
    
    self notify( "movedone" );
    spring_delete( spring_index );
}

// Namespace math
// Params 4
// Checksum 0x40077042, Offset: 0x1cb9
// Size: 0x8d
function function_5cf1e88395e33eba( start_point, target_point, yaw_limit, start_yaw )
{
    yaw = start_yaw;
    target_yaw = vectortoyaw( target_point - start_point );
    diff = angleclamp180( target_yaw - yaw );
    new_yaw = undefined;
    
    if ( abs( diff ) < yaw_limit )
    {
        new_yaw = target_yaw;
    }
    else
    {
        new_yaw = yaw + utility::sign( diff ) * yaw_limit;
    }
    
    return int( new_yaw );
}

// Namespace math
// Params 3
// Checksum 0x109a9291, Offset: 0x1d4f
// Size: 0x62
function function_27800ff2fd4867c6( start_angle, target_angle, limit )
{
    diff = angleclamp180( target_angle - start_angle );
    new_angle = undefined;
    
    if ( abs( diff ) < limit )
    {
        new_angle = target_angle;
    }
    else
    {
        new_angle = start_angle + utility::sign( diff ) * limit;
    }
    
    return new_angle;
}

// Namespace math
// Params 3
// Checksum 0x84ccd39a, Offset: 0x1dba
// Size: 0x6a
function function_235fe1fdb403e4b2( vector, pitch, up_vector = ( 0, 0, 1 ) )
{
    assert( vector != up_vector, "<dev string:x105>" );
    right_vec = vectorcross( vector, up_vector );
    new_vector = rotatepointaroundvector( right_vec, vector, pitch );
    return new_vector;
}

// Namespace math
// Params 3
// Checksum 0xf9c28c6c, Offset: 0x1e2d
// Size: 0x5e
function function_b77296185c2d6c26( start_value, target_value, limit )
{
    diff = target_value - start_value;
    new_value = undefined;
    
    if ( abs( diff ) < limit )
    {
        new_value = target_value;
    }
    else
    {
        new_value = start_value + utility::sign( diff ) * limit;
    }
    
    return new_value;
}

// Namespace math
// Params 3
// Checksum 0xc4a84d7, Offset: 0x1e94
// Size: 0x5c
function function_b642fd3e37ae7eb4( start_vector, target_vector, limit )
{
    diff = target_vector - start_vector;
    new_vector = undefined;
    
    if ( length( diff ) < limit )
    {
        new_vector = target_vector;
    }
    else
    {
        new_vector = start_vector + vectornormalize( diff ) * limit;
    }
    
    return new_vector;
}

// Namespace math
// Params 5
// Checksum 0x3483fae3, Offset: 0x1ef9
// Size: 0xb7
function function_562709d61af16bd4( center, outer_radius, inner_radius, begin_yaw, end_yaw )
{
    ratio = 0;
    
    if ( isdefined( inner_radius ) )
    {
        ratio = clamp( inner_radius / outer_radius, 0, 1 );
    }
    
    if ( !isdefined( begin_yaw ) )
    {
        begin_yaw = 0;
    }
    
    if ( !isdefined( end_yaw ) )
    {
        end_yaw = 360;
    }
    
    radius = outer_radius * sqrt( randomfloatrange( ratio * ratio, 1 ) );
    theta = randomfloatrange( begin_yaw, end_yaw );
    offset = ( cos( theta ) * radius, sin( theta ) * radius, 0 );
    return center + offset;
}

// Namespace math
// Params 4
// Checksum 0xb80fff3b, Offset: 0x1fb9
// Size: 0x34
function over_damped_move_to( target_pos, spring_factor, spring_drag, start_speed )
{
    thread over_damped_move_to_thread( target_pos, spring_factor, spring_drag, start_speed );
}

// Namespace math
// Params 4
// Checksum 0x650cd943, Offset: 0x1ff5
// Size: 0xb8
function over_damped_move_to_thread( target_pos, spring_factor, spring_drag, start_speed )
{
    self endon( "death" );
    self endon( "stop_spring" );
    
    if ( !isdefined( start_speed ) )
    {
        start_speed = 1;
    }
    
    spring_index = spring_make_over_damped( spring_factor, spring_drag, self.origin, anglestoforward( self.angles ) * start_speed );
    
    while ( distancesquared( self.origin, target_pos ) > squared( 0.1 ) )
    {
        self.origin = spring_update( spring_index, target_pos );
        wait 0.05;
    }
    
    self notify( "movedone" );
    spring_delete( spring_index );
}

// Namespace math
// Params 4
// Checksum 0x750fb1bc, Offset: 0x20b5
// Size: 0x34
function under_damped_move_to( target_pos, freq, damp, start_speed )
{
    thread under_damped_move_to_thread( target_pos, freq, damp, start_speed );
}

// Namespace math
// Params 4
// Checksum 0x696ef94e, Offset: 0x20f1
// Size: 0xd2
function under_damped_move_to_thread( target_pos, freq, damp, start_speed )
{
    self endon( "death" );
    self endon( "stop_spring" );
    
    if ( !isdefined( start_speed ) )
    {
        start_speed = 1;
    }
    
    spring_index = spring_make_under_damped( freq, damp, self.origin, anglestoforward( self.angles ) * start_speed );
    
    while ( distancesquared( self.origin, target_pos ) > squared( 0.1 ) || length( spring_get_vel( spring_index ) ) < squared( 0.1 ) )
    {
        self.origin = spring_update( spring_index, target_pos );
        wait 0.05;
    }
    
    self notify( "movedone" );
    spring_delete( spring_index );
}

// Namespace math
// Params 3
// Checksum 0x325754c2, Offset: 0x21cb
// Size: 0xea
function spring_make_critically_damped( spring_factor, start_pos, start_vel )
{
    spring_index = spring_add( start_pos, start_vel );
    k = spring_factor * level.framedurationseconds;
    e = exp( -1 * k );
    level.springs[ spring_index ].c0 = ( k + 1 ) * e;
    level.springs[ spring_index ].c1 = e;
    level.springs[ spring_index ].c2 = -1 * k * k * e;
    level.springs[ spring_index ].c3 = ( 1 - k ) * e;
    spring_set_pos( spring_index, start_pos );
    spring_set_vel( spring_index, start_vel );
    return spring_index;
}

// Namespace math
// Params 4
// Checksum 0x80760ec7, Offset: 0x22be
// Size: 0x1b4
function spring_make_over_damped( spring_factor, spring_drag, start_pos, start_vel )
{
    assert( spring_drag > 0 );
    spring_index = spring_add( start_pos, start_vel );
    k = spring_factor * spring_factor;
    c = -1 * sqrt( spring_drag * spring_drag + 4 * k );
    r1 = 0.5 * ( c + spring_drag );
    r2 = 0.5 * ( c - spring_drag );
    dr = r2 - r1;
    rdr = 1 / dr;
    e1 = exp( r1 * level.framedurationseconds );
    e2 = exp( r2 * level.framedurationseconds );
    de = e2 - e1;
    level.springs[ spring_index ].c1 = de * rdr;
    level.springs[ spring_index ].c0 = e1 - r1 * level.springs[ spring_index ].c1;
    level.springs[ spring_index ].c3 = ( r2 * e2 - r1 * e1 ) * rdr;
    level.springs[ spring_index ].c2 = r1 * ( e1 - level.springs[ spring_index ].c3 );
    spring_set_pos( spring_index, start_pos );
    spring_set_vel( spring_index, start_vel );
    return spring_index;
}

// Namespace math
// Params 4
// Checksum 0xa28749a2, Offset: 0x247b
// Size: 0x16d
function spring_make_under_damped( freq, damp, start_pos, start_vel )
{
    assert( freq > 0 );
    spring_index = spring_add( start_pos, start_vel );
    h = -0.5 * damp;
    w = freq;
    e = exp( h * level.framedurationseconds ) / w;
    angle = angleclamp( w * level.framedurationseconds );
    s = sin( angle );
    c = cos( angle );
    wc = w * c;
    hs = h * s;
    level.springs[ spring_index ].c0 = e * ( wc - hs );
    level.springs[ spring_index ].c1 = e * s;
    level.springs[ spring_index ].c2 = e * -1 * s * ( h * h + w * w );
    level.springs[ spring_index ].c3 = e * ( wc + hs );
    spring_set_pos( spring_index, start_pos );
    spring_set_vel( spring_index, start_vel );
    return spring_index;
}

// Namespace math
// Params 4
// Checksum 0xdf10291a, Offset: 0x25f1
// Size: 0x157
function spring_update( spring_index, target_pos, overwrite_pos, overwrite_vel )
{
    if ( isdefined( overwrite_pos ) )
    {
        spring_set_pos( spring_index, overwrite_pos );
    }
    
    if ( isdefined( overwrite_vel ) )
    {
        spring_set_vel( spring_index, overwrite_vel );
    }
    
    adjusted_pos = level.springs[ spring_index ].pos - target_pos;
    new_pos = level.springs[ spring_index ].c0 * adjusted_pos + level.springs[ spring_index ].c1 * level.springs[ spring_index ].vel;
    new_vel = level.springs[ spring_index ].c2 * adjusted_pos + level.springs[ spring_index ].c3 * level.springs[ spring_index ].vel;
    level.springs[ spring_index ].pos = new_pos + target_pos;
    level.springs[ spring_index ].vel = new_vel;
    return level.springs[ spring_index ].pos;
}

// Namespace math
// Params 1
// Checksum 0x13796763, Offset: 0x2751
// Size: 0x18
function spring_delete( spring_index )
{
    level.springs[ spring_index ] = undefined;
}

// Namespace math
// Params 1
// Checksum 0x3708502e, Offset: 0x2771
// Size: 0x22
function spring_get_pos( spring_index )
{
    return level.springs[ spring_index ].pos;
}

// Namespace math
// Params 1
// Checksum 0x4462ce35, Offset: 0x279c
// Size: 0x22
function spring_get_vel( spring_index )
{
    return level.springs[ spring_index ].vel;
}

// Namespace math
// Params 0
// Checksum 0xdcf3e118, Offset: 0x27c7
// Size: 0x24
function spring_init()
{
    if ( !isdefined( level.springs ) )
    {
        level.springs = [];
        level.spring_count = 0;
    }
}

// Namespace math
// Params 2
// Checksum 0x6839fed7, Offset: 0x27f3
// Size: 0xde
function spring_add( start_pos, start_vel )
{
    spring_init();
    var_448195b2a6947143 = level.spring_count;
    level.spring_count++;
    level.springs[ var_448195b2a6947143 ] = spawnstruct();
    level.springs[ var_448195b2a6947143 ].pos = start_pos;
    level.springs[ var_448195b2a6947143 ].vel = start_vel;
    level.springs[ var_448195b2a6947143 ].c0 = 0;
    level.springs[ var_448195b2a6947143 ].c1 = 0;
    level.springs[ var_448195b2a6947143 ].c2 = 0;
    level.springs[ var_448195b2a6947143 ].c3 = 0;
    return var_448195b2a6947143;
}

// Namespace math
// Params 2
// Checksum 0xa499e922, Offset: 0x28da
// Size: 0x2d
function spring_set_pos( spring_index, pos )
{
    level.springs[ spring_index ].pos = pos;
}

// Namespace math
// Params 2
// Checksum 0xd7f370d5, Offset: 0x290f
// Size: 0x2d
function spring_set_vel( spring_index, vel )
{
    level.springs[ spring_index ].vel = vel;
}

// Namespace math
// Params 4
// Checksum 0x706470c1, Offset: 0x2944
// Size: 0xcd
function random_normal_distribution( mean, std_deviation, lower_bound, upper_bound )
{
    x1 = 0;
    x2 = 0;
    w = 1;
    y1 = 0;
    
    while ( w >= 1 )
    {
        x1 = 2 * randomfloatrange( 0, 1 ) - 1;
        x2 = 2 * randomfloatrange( 0, 1 ) - 1;
        w = x1 * x1 + x2 * x2;
    }
    
    w = sqrt( -2 * log( w ) / w );
    y1 = x1 * w;
    number = mean + y1 * std_deviation;
    
    if ( number < lower_bound )
    {
        number = lower_bound;
    }
    
    if ( number > upper_bound )
    {
        number = upper_bound;
    }
    
    return number;
}

// Namespace math
// Params 2
// Checksum 0x89a8bf4e, Offset: 0x2a1a
// Size: 0x6e
function function_78a5b128a3e32460( origin, radius )
{
    r = sqrt( radius );
    theta = randomfloat( 360 );
    offset = ( r * cos( theta ), r * sin( theta ), 0 );
    randompoint = origin + offset;
    randompoint = getclosestpointonnavmesh( randompoint );
    return randompoint;
}

// Namespace math
// Params 4
// Checksum 0x34c268ec, Offset: 0x2a91
// Size: 0x19d
function function_ad1b3fbc486397da( var_e2607b109a0b1419, var_56c01eedcd65f5ee, var_b23738be0590b3a6, n_delta_time )
{
    var_56c01eedcd65f5ee = vectornormalize( var_56c01eedcd65f5ee );
    var_1999be4f1fd880b2 = ( cos( var_b23738be0590b3a6 ) + squared( var_56c01eedcd65f5ee[ 0 ] ) * ( 1 - cos( var_b23738be0590b3a6 ) ), var_56c01eedcd65f5ee[ 0 ] * var_56c01eedcd65f5ee[ 1 ] * ( 1 - cos( var_b23738be0590b3a6 ) ) - var_56c01eedcd65f5ee[ 2 ] * sin( var_b23738be0590b3a6 ), var_56c01eedcd65f5ee[ 0 ] * var_56c01eedcd65f5ee[ 2 ] * ( 1 - cos( var_b23738be0590b3a6 ) ) + var_56c01eedcd65f5ee[ 1 ] * sin( var_b23738be0590b3a6 ) );
    var_1999bf4f1fd882e5 = ( var_56c01eedcd65f5ee[ 1 ] * var_56c01eedcd65f5ee[ 0 ] * ( 1 - cos( var_b23738be0590b3a6 ) ) + var_56c01eedcd65f5ee[ 2 ] * sin( var_b23738be0590b3a6 ), cos( var_b23738be0590b3a6 ) + squared( var_56c01eedcd65f5ee[ 1 ] ) * ( 1 - cos( var_b23738be0590b3a6 ) ), var_56c01eedcd65f5ee[ 1 ] * var_56c01eedcd65f5ee[ 2 ] * ( 1 - cos( var_b23738be0590b3a6 ) - var_56c01eedcd65f5ee[ 0 ] * sin( var_b23738be0590b3a6 ) ) );
    var_1999bc4f1fd87c4c = ( var_56c01eedcd65f5ee[ 2 ] * var_56c01eedcd65f5ee[ 0 ] * ( 1 - cos( var_b23738be0590b3a6 ) ) - var_56c01eedcd65f5ee[ 1 ] * sin( var_b23738be0590b3a6 ), var_56c01eedcd65f5ee[ 2 ] * var_56c01eedcd65f5ee[ 1 ] * ( 1 - cos( var_b23738be0590b3a6 ) + var_56c01eedcd65f5ee[ 0 ] * sin( var_b23738be0590b3a6 ) ), cos( var_b23738be0590b3a6 ) + squared( var_56c01eedcd65f5ee[ 2 ] ) * ( 1 - cos( var_b23738be0590b3a6 ) ) );
    var_c703ee67dccce7f3 = self.origin - var_e2607b109a0b1419;
    var_3461ff8bd4ac79b9 = ( vectordot( var_1999be4f1fd880b2, var_c703ee67dccce7f3 ), vectordot( var_1999bf4f1fd882e5, var_c703ee67dccce7f3 ), vectordot( var_1999bc4f1fd87c4c, var_c703ee67dccce7f3 ) );
    var_ac363df0c4bb98e4 = var_e2607b109a0b1419 + var_3461ff8bd4ac79b9;
    self moveto( var_ac363df0c4bb98e4, n_delta_time );
}

// Namespace math
// Params 9, eflags: 0x40 variadic
// Checksum 0xe5632dac, Offset: 0x2c36
// Size: 0x21a
function function_2f40252ef1a28501( center, radius, num_points = 8, starting_angles = ( 0, 0, 0 ), draw_debug = 0, alternate_direction = 0, var_56375ecf63b3bc10, ... )
{
    center_x = center[ 0 ];
    center_y = center[ 1 ];
    center_z = center[ 2 ];
    var_d72b411c52576bde = anglesdelta( ( 0, 0, 0 ), starting_angles );
    anglefrac = 360 / num_points;
    
    if ( !isdefined( var_56375ecf63b3bc10 ) )
    {
        points = [];
    }
    
    /#
        if ( draw_debug )
        {
            sphere( center, 20, ( 0, 0, 0 ), 0, 50 );
        }
    #/
    
    for ( i = 0; i < num_points ; i++ )
    {
        angle = anglefrac * i;
        
        if ( alternate_direction && i % 2 == 1 )
        {
            angle *= -1;
        }
        
        angle += var_d72b411c52576bde;
        xadd = cos( angle ) * radius;
        yadd = sin( angle ) * radius;
        point = ( center_x + xadd, center_y + yadd, center_z );
        
        if ( isdefined( var_56375ecf63b3bc10 ) )
        {
            var_9d5a46a2c7604aa6 = [[ var_56375ecf63b3bc10 ]]( point, flat_args( vararg, varargcount ) );
            
            if ( var_9d5a46a2c7604aa6 )
            {
                /#
                    if ( draw_debug )
                    {
                        sphere( point, 20, ( 0, 1, 0 ), 0, 50 );
                    }
                #/
                
                return point;
            }
            
            /#
                if ( draw_debug )
                {
                    sphere( point, 20, ( 1, 0, 0 ), 0, 50 );
                }
            #/
            
            continue;
        }
        
        /#
            if ( draw_debug )
            {
                sphere( point, 20, ( 0, 0, 1 ), 0, 50 );
            }
        #/
        
        points[ points.size ] = point;
    }
    
    return points;
}

