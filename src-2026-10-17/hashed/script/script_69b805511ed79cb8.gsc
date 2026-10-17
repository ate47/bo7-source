#namespace render_utility;

// Namespace render_utility
// Params 4
// Checksum 0xcf969a04, Offset: 0x115
// Size: 0x8a
function function_2636a65c7f96feff( aberration, radius, strength, distortion )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    
    if ( isdefined( aberration ) )
    {
        self setclientomnvar( "chromatic_aberration_override", aberration );
    }
    
    if ( isdefined( radius ) )
    {
        self setclientomnvar( "chromatic_aberration_radius_override", radius );
    }
    
    if ( isdefined( strength ) )
    {
        self setclientomnvar( "chromatic_aberration_strength_override", strength );
    }
    
    if ( isdefined( distortion ) )
    {
        self setclientomnvar( "chromatic_aberration_distortion_override", distortion );
    }
}

// Namespace render_utility
// Params 0
// Checksum 0x7c00b15c, Offset: 0x1a7
// Size: 0x59
function function_7d5ac95f0cd3294a()
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    self setclientomnvar( "chromatic_aberration_override", 0 );
    self setclientomnvar( "chromatic_aberration_radius_override", 0 );
    self setclientomnvar( "chromatic_aberration_strength_override", 0 );
    self setclientomnvar( "chromatic_aberration_distortion_override", 0 );
}

