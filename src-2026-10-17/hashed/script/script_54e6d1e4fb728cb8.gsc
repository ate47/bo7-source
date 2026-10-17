#using scripts\common\math;

#namespace ftue_camera;

// Namespace ftue_camera
// Params 3
// Checksum 0x9cb5a700, Offset: 0x76
// Size: 0x53
function function_7c311fa7c48e8381( lookatposition, delta, var_26c020ac116fc9fa )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    
    while ( !function_3f07ff567ee093a8( lookatposition, delta ) )
    {
        waitframe();
    }
    
    if ( isdefined( var_26c020ac116fc9fa ) )
    {
        self [[ var_26c020ac116fc9fa ]]();
    }
}

// Namespace ftue_camera
// Params 3
// Checksum 0x8834d8d9, Offset: 0xd1
// Size: 0x32
function function_9e46e8b4ec3a1434( entity, delta, mindistance )
{
    return function_3f07ff567ee093a8( entity.origin, delta, mindistance );
}

// Namespace ftue_camera
// Params 3
// Checksum 0xcaab6e3c, Offset: 0x10c
// Size: 0x6d, Type: bool
function function_3f07ff567ee093a8( position, delta, mindistance )
{
    if ( distance2d( self.origin, position ) > mindistance )
    {
        return false;
    }
    
    forward = anglestoforward( self getplayerangles( 0 ) );
    normalized = vectornormalize( position - self geteye() );
    return math::anglebetweenvectorsunit( forward, normalized ) <= delta;
}

