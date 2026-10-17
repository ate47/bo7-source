#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace namespace_1646b3e6cd65adbc;

// Namespace namespace_1646b3e6cd65adbc
// Params 0, eflags: 0x5
// Checksum 0x26ae03aa, Offset: 0x88
// Size: 0x17
function private autoexec main()
{
    vehicle::register_vehicle_init( %"hash_1ffb8dc1bc638508", &function_5e5b1cdc7ade8b60 );
}

// Namespace namespace_1646b3e6cd65adbc
// Params 0, eflags: 0x4
// Checksum 0x589aa9a3, Offset: 0xa7
// Size: 0x20
function private function_5e5b1cdc7ade8b60()
{
    utility::registersharedfunc( %"hash_1ffb8dc1bc638508", #"spawn", &function_4919dc74a72cac01 );
}

// Namespace namespace_1646b3e6cd65adbc
// Params 2, eflags: 0x4
// Checksum 0x118208ad, Offset: 0xcf
// Size: 0x7c
function private function_4919dc74a72cac01( spawndata, faildata )
{
    if ( self.classname == "script_vehicle" )
    {
        vehicle = vehicle::function_66838ba16389a6cd( %"hash_1ffb8dc1bc638508", spawndata, self );
    }
    else
    {
        vehicle = vehicle::default_spawn( %"hash_1ffb8dc1bc638508", spawndata, faildata );
    }
    
    if ( !isdefined( vehicle ) )
    {
        return;
    }
    
    vehicle.var_e2f56f41c8d24c59 = 1;
    vehicle vehicle_allowplayerstandon( 0 );
    return vehicle;
}

