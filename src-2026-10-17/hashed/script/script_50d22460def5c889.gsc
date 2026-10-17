#using scripts\common\omnvar_utility;

#namespace namespace_fe8c87fda9dec1c4;

// Namespace namespace_fe8c87fda9dec1c4
// Params 0
// Checksum 0x540271a2, Offset: 0x76
// Size: 0x2b, Type: bool
function function_47a6f06f6300fa18()
{
    if ( getdvarint( @"hash_9c2e4776e95c6490", 0 ) == 0 )
    {
        return false;
    }
    
    if ( function_9340dd398350d3d0( #"hash_7c1d2feb2d7e5c50" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_fe8c87fda9dec1c4
// Params 0
// Checksum 0x2649e77d, Offset: 0xaa
// Size: 0x4
function function_3f12a36a6f8ea8d6()
{
    return 3;
}

// Namespace namespace_fe8c87fda9dec1c4
// Params 2
// Checksum 0xdc12726c, Offset: 0xb7
// Size: 0x68
function function_c2c521865350303b( omnvar, params )
{
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 0, 8, params.killcount ?? 0 );
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 8, 8, params.totalevents ?? 0 );
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 16, 16, params.totalpoints ?? 0 );
}

// Namespace namespace_fe8c87fda9dec1c4
// Params 1
// Checksum 0x5fe19fc7, Offset: 0x127
// Size: 0x35
function function_6a97578cae661d84( omnvar )
{
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 0, 8, 0 );
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 8, 8, 0 );
    omnvar_utility::function_85d5f88af471ac4b( omnvar, 16, 16, 0 );
}

