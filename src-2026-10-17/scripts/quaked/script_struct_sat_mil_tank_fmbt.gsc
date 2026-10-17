#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace namespace_b6f16a9deda62c88;

// Namespace namespace_b6f16a9deda62c88
// Params 0, eflags: 0x5
// Checksum 0x2cb98c35, Offset: 0x94
// Size: 0x17
function private autoexec main()
{
    vehicle::register_vehicle_init( %"hash_5efdddfa8f702be2", &fmbt_init );
}

// Namespace namespace_b6f16a9deda62c88
// Params 0
// Checksum 0xd1cf677d, Offset: 0xb3
// Size: 0x44
function fmbt_init()
{
    if ( !vehicle::should_init( %"hash_5efdddfa8f702be2" ) )
    {
        return;
    }
    
    vehicle::generic_init( %"hash_5efdddfa8f702be2" );
    utility::registersharedfunc( %"hash_5efdddfa8f702be2", #"spawn", &fmbt_spawn );
}

// Namespace namespace_b6f16a9deda62c88
// Params 2
// Checksum 0x653d0841, Offset: 0xff
// Size: 0xe0
function fmbt_spawn( spawndata, faildata )
{
    vehicle = vehicle::default_spawn( %"hash_5efdddfa8f702be2", spawndata, faildata );
    
    if ( !isdefined( vehicle ) )
    {
        return;
    }
    
    println( "<dev string:x24>" );
    collisionlocation = vehicle gettagorigin( "tag_turret" );
    collisionangles = vehicle gettagangles( "tag_turret" );
    collision = spawn( "script_model", collisionlocation );
    collision.angles = collisionangles;
    collision setmodel( %"veh_sat_mil_tank_fmbt_turret_hmh" );
    collision linkto( vehicle, "tag_turret" );
    collision.parent = vehicle;
    collision hideallparts();
    vehicle.turretcollision = collision;
    vehicle thread monitor_death();
    return vehicle;
}

// Namespace namespace_b6f16a9deda62c88
// Params 0, eflags: 0x4
// Checksum 0xbb0998d8, Offset: 0x1e8
// Size: 0x35
function private monitor_death()
{
    level endon( #"game_ended" );
    self endon( #"vehicle_deleted" );
    self waittill( #"death" );
    self.turretcollision delete();
}

