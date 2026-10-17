#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;

#namespace zombie_callisto_vehicle_attack;

// Namespace zombie_callisto_vehicle_attack
// Params 0
// Checksum 0x48773042, Offset: 0xec
// Size: 0xe
function init_zombie_callisto_vehicle_attack()
{
    self function_786bb6aa1b76c7ee( "in_vehicle_attack_mode", 0 );
}

// Namespace zombie_callisto_vehicle_attack
// Params 2
// Checksum 0x8a505c69, Offset: 0x102
// Size: 0x5d, Type: bool
function ZombieCallistoEnterVehicleMode( taskid, params )
{
    self function_786bb6aa1b76c7ee( "in_vehicle_attack_mode", 1 );
    zombie_utils::function_a8ce00e0448cb6f0( "super_sprint", "callisto_vehicle_attack", 4 );
    callback::callback( "on_in_vehicle_mode_changed" );
    self function_786bb6aa1b76c7ee( "charge_cooldown", self.charge_cooldown / 2 );
    return true;
}

// Namespace zombie_callisto_vehicle_attack
// Params 2
// Checksum 0x73f93ce5, Offset: 0x168
// Size: 0x52, Type: bool
function ZombieCallistoExitVehicleMode( taskid, params )
{
    self function_786bb6aa1b76c7ee( "in_vehicle_attack_mode", 0 );
    zombie_utils::function_a8ce00e0448cb6f0( undefined, "callisto_vehicle_attack", 4 );
    callback::callback( "on_in_vehicle_mode_changed" );
    self function_786bb6aa1b76c7ee( "charge_cooldown", self.charge_cooldown );
    return true;
}

