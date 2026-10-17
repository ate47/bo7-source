#using scripts\common\vehicle;
#using scripts\common\vehicle_occupancy;
#using scripts\mp\outofbounds;

#namespace vehicle_oob_mp;

// Namespace vehicle_oob_mp
// Params 2
// Checksum 0x1168c037, Offset: 0x9f
// Size: 0x37
function vehicle_oob_mp_registeroutoftimecallback( vehiclename, callback )
{
    leveldata = vehicle_oob_mp_getleveldata();
    leveldata.outoftimecallbacks[ vehiclename ] = callback;
}

// Namespace vehicle_oob_mp
// Params 0
// Checksum 0xc315c09f, Offset: 0xde
// Size: 0x90
function vehicle_oob_mp_init()
{
    assert( isdefined( level.vehicle ), "<dev string:x24>" );
    assert( !isdefined( level.vehicle.oob ), "<dev string:x58>" );
    leveldata = spawnstruct();
    leveldata.outoftimecallbacks = [];
    level.vehicle.oob = leveldata;
    outofbounds::registerooboutoftimecallback( "vehicle", &vehicle_oob_mp_outoftimecallback );
    outofbounds::registeroobclearcallback( "vehicle", &vehicle_oob_mp_clearcallback );
}

// Namespace vehicle_oob_mp
// Params 0
// Checksum 0x8005955b, Offset: 0x176
// Size: 0x4d
function vehicle_oob_mp_getleveldata()
{
    assert( isdefined( level.vehicle ), "<dev string:x8a>" );
    assert( isdefined( level.vehicle.oob ), "<dev string:xc6>" );
    return level.vehicle.oob;
}

// Namespace vehicle_oob_mp
// Params 2
// Checksum 0x9dffb07a, Offset: 0x1cc
// Size: 0x64
function vehicle_oob_mp_outoftimecallback( timeoutendnotify, clearnotify )
{
    leveldata = vehicle_oob_mp_getleveldata();
    callback = leveldata.outoftimecallbacks[ vehicle::get_ref() ];
    assert( isdefined( callback ), "<dev string:x109>" );
    self.dontspawnhusk = 1;
    self [[ callback ]]();
}

// Namespace vehicle_oob_mp
// Params 0
// Checksum 0x6d6d6e89, Offset: 0x238
// Size: 0x89
function vehicle_oob_mp_clearcallback()
{
    occupants = vehicle_occupancy::get_all_occupants( self );
    
    foreach ( occupant in occupants )
    {
        occupant setclientomnvar( "ui_out_of_bounds_countdown", 0 );
    }
}

