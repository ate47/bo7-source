#using scripts\common\utility;

#namespace vehicle_mines_mp;

// Namespace vehicle_mines_mp
// Params 0
// Checksum 0xbbd592cf, Offset: 0x76
// Size: 0x20
function vehicle_mines_mp_init()
{
    utility::registersharedfunc( #"vehicle_mines", #"trigger", &vehicle_mines_mp_minetrigger );
}

// Namespace vehicle_mines_mp
// Params 2
// Checksum 0x9b50f127, Offset: 0x9e
// Size: 0x15
function vehicle_mines_mp_minetrigger( vehicle, mine )
{
    
}

