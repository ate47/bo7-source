#using scripts\common\vehicle_build;

#namespace empty_heli;

// Namespace empty_heli
// Params 3
// Checksum 0x2df929d1, Offset: 0x90
// Size: 0x3a
function main( model, type, classname )
{
    vehicle_build::build_template( "empty_heli", model, type, classname );
    vehicle_build::build_is_helicopter( "empty_heli" );
}

