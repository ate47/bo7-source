#namespace concussion_utility;

// Namespace concussion_utility
// Params 1
// Checksum 0xaf384e7a, Offset: 0x76
// Size: 0x1d
function calculateinterruptdelay( duration )
{
    return max( 0, duration - 2.6 ) * 1000;
}

