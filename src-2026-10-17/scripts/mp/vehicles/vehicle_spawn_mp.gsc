#using scripts\common\utility;

#namespace vehicle_spawn_mp;

// Namespace vehicle_spawn_mp
// Params 0
// Checksum 0x99ea0409, Offset: 0x97
// Size: 0x20
function vehicle_spawn_mp_init()
{
    utility::registersharedfunc( #"vehicle_spawn", #"canspawnvehicle", &vehicle_spawn_mp_canspawnvehicle );
}

// Namespace vehicle_spawn_mp
// Params 3
// Checksum 0x9854a32c, Offset: 0xbf
// Size: 0x50, Type: bool
function vehicle_spawn_mp_canspawnvehicle( vehicleref, owner, team )
{
    if ( !getmatchrulesdata( "commonOption", "allowVehicles" ) )
    {
        return false;
    }
    
    if ( getdvarint( hashcat( @"hash_e4fa5e1677f011e4", vehicleref ), 1 ) == 0 )
    {
        return false;
    }
    
    return true;
}

