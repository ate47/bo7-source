#using scripts\common\vehicle_build;

#namespace empty_nocollision;

// Namespace empty_nocollision
// Params 3
// Checksum 0x4c415998, Offset: 0x82
// Size: 0x4a
function main( model, type, classname )
{
    vehicle_build::build_template( type, model, undefined, classname );
    vehicle_build::build_localinit( &init_local );
    vehicle_build::build_life( 90000 );
    vehicle_build::build_is_airplane();
}

// Namespace empty_nocollision
// Params 0
// Checksum 0x68ea516b, Offset: 0xd4
// Size: 0x13
function init_local()
{
    self.disable_wash = 1;
    self hideallparts();
}

