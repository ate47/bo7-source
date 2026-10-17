#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\ztron\ztron_hazard;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_main;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_f86b25f4d21dbe1a;

// Namespace namespace_f86b25f4d21dbe1a
// Params 0, eflags: 0x5
// Checksum 0x66e148b4, Offset: 0x14a
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_59943509a12090d9", #"hash_4599115b7d4d2ff0", undefined, &init );
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 0
// Checksum 0x5f22fcd5, Offset: 0x173
// Size: 0x42
function init()
{
    ztron_hazard::function_6f661fac5fd31f1( #"fuel_tank", #"create", &function_7375ea046d9b3754 );
    utility::add_fx( "fuel_tank_explosion", "vfx_sat_zm_tank_impacts_exp_ztron" );
    ztron_sound::function_4ac735395b173fe( "fuel_tank_destroyed", "evt_ztron_hazard_redbarrel_explosion" );
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 2
// Checksum 0xf5667dc3, Offset: 0x1bd
// Size: 0x84
function function_7375ea046d9b3754( trap, paged = 0 )
{
    if ( !isdefined( level.ztron.var_d7f680212889f013 ) )
    {
        level.ztron.var_d7f680212889f013 = [];
    }
    
    if ( paged )
    {
        level.ztron.var_d7f680212889f013[ level.ztron.var_d7f680212889f013.size ] = trap;
        return;
    }
    
    function_761e54a005456a7a( trap );
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 2, eflags: 0x4
// Checksum 0xd36819b0, Offset: 0x249
// Size: 0xe0
function private function_761e54a005456a7a( trap, paged = 0 )
{
    if ( !isdefined( trap ) )
    {
        return;
    }
    
    fuelTank = utility::spawn_model( "t10_hed_propane_tank_large_01", trap.origin, trap.angles );
    
    if ( !isdefined( fuelTank ) )
    {
        return;
    }
    
    fuelTank.hazardtype = "fuelTank";
    fuelTank setcandamage( 1 );
    fuelTank.health = 300;
    fuelTank.maxhealth = 300;
    fuelTank solid();
    fuelTank enableaimassist();
    fuelTank disconnectpaths();
    fuelTank.var_d62ad5bfd64ba592 = "tag_origin";
    trap.script_model = fuelTank;
    trap.paged = paged;
    trap thread function_f9c8e3093c254937( fuelTank );
    return trap;
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 1, eflags: 0xc
// Checksum 0x1f1c5160, Offset: 0x332
// Size: 0x5a
function private function_f9c8e3093c254937( hazard )
{
    self notify( #"hash_dcf5c4e5c6ecf9c8" );
    self endon( #"hash_dcf5c4e5c6ecf9c8" );
    level endon( #"ztron_game_is_over" );
    self endon( #"death" );
    self endon( #"destroy_hazard" );
    thread function_39ec2ecdeae1bea( hazard );
    thread function_38b9633cd59a9b4b( hazard );
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 1, eflags: 0xc
// Checksum 0x8a9898e2, Offset: 0x394
// Size: 0x15c
function private function_38b9633cd59a9b4b( hazard )
{
    self notify( #"hash_70b6700b8d1e2471" );
    self endon( #"hash_70b6700b8d1e2471" );
    self endon( #"death" );
    self endon( #"destroy_hazard" );
    
    while ( true )
    {
        hazard waittill( #"damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, dflags, objweapon );
        
        if ( isdefined( attacker ) && damage >= 0 )
        {
            damagenum = damage > hazard.maxhealth ? hazard.maxhealth : damage;
            ztron_util::function_eb8ba16055d6da7c( attacker, hazard, "none", meansofdeath, objweapon, damagenum, point, undefined, undefined, 0, 0 );
        }
        
        if ( hazard.health <= 0 )
        {
            hazard.health = 0;
            attacker ztron_sound::ztron_playsound( "fuel_tank_destroyed" );
            playfx( utility::getfx( "fuel_tank_explosion" ), hazard.origin );
            self notify( #"destroy_hazard" );
        }
    }
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 1, eflags: 0x4
// Checksum 0x9a98037b, Offset: 0x4f8
// Size: 0x8d
function private function_39ec2ecdeae1bea( hazard )
{
    self endon( #"death" );
    thread ztron_hazard::function_4d643b159a80c647( 1 );
    self waittill( #"destroy_hazard" );
    
    if ( hazard.health == 0 )
    {
        thread function_c8a7e0943b8f5d2e();
    }
    
    if ( isdefined( self.script_model ) )
    {
        self.script_model notsolid();
        self.script_model setcandamage( 0 );
        self.script_model disableaimassist();
        self.script_model thread ztron_util::function_2dcb2513692d8ffa();
    }
}

// Namespace namespace_f86b25f4d21dbe1a
// Params 0, eflags: 0x4
// Checksum 0x3305410a, Offset: 0x58d
// Size: 0x122
function private function_c8a7e0943b8f5d2e()
{
    origin = ztron_util::function_3fe38741460a4a49( self.origin ) + ( 0, 0, 100 );
    spawnoptions = common_item::function_bc5ff2958b71a708( origin );
    params = spawnstruct();
    
    if ( ztron_main::function_4da200e9b8d58a3c() == 3 )
    {
        params.overridelifetime = 9999;
    }
    
    var_1a9f174c7b10df42 = ztron_item::function_71e133b37011bee6( "ztron_vehicle_fuel" );
    
    foreach ( itemowner in level.players )
    {
        item = ztron_item::spawnitem( var_1a9f174c7b10df42, origin, 0, spawnoptions, params );
        item.owner = itemowner;
        
        if ( item )
        {
            item hide();
            item showtoplayer( itemowner );
        }
    }
}

