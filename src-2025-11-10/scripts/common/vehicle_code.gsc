#using scripts\common\ai;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_ai;
#using scripts\common\vehicle_aianim;
#using scripts\common\vehicle_airdrop;
#using scripts\common\vehicle_occupancy;
#using scripts\engine\math;
#using scripts\engine\throttle;
#using scripts\engine\utility;

#namespace vehicle_code;

// Namespace vehicle_code
// Params 0
// Checksum 0x1e0ed01e, Offset: 0xb27
// Size: 0xe9b
function vehicle_initlevelvariables()
{
    setdvarifuninitialized( @"hash_b8d9dce6bbc23e00", 0 );
    setdvarifuninitialized( @"hash_fb816855f6554343", 0 );
    setdvarifuninitialized( @"hash_80e8717f617516cf", 0 );
    setdvarifuninitialized( @"hash_9cdcaf7a53494c37", 0 );
    setdvarifuninitialized( @"hash_cfd8073837710cef", 0 );
    setdvarifuninitialized( @"hash_a56728daa842e5e", 0 );
    setdvarifuninitialized( @"hash_f0f3e5a83f3f2843", 1 );
    setdvarifuninitialized( @"hash_7598045ee90e851d", 1 );
    setdvarifuninitialized( @"hash_4bd69b09131419ca", 1 );
    setdvarifuninitialized( @"hash_3a76c9f686d280fc", 0 );
    setdvarifuninitialized( @"hash_fd46728789917a5", 0 );
    setdvarifuninitialized( @"hash_6f7d4369d136d19a", 0 );
    
    if ( utility::issp() )
    {
        setsaveddvar( @"movingplatformcinematicmotion", 1 );
        setsaveddvar( @"hash_b2b4f1e1cf04437f", 1 );
    }
    
    if ( !isdefined( level.vehicle ) )
    {
        level.vehicle = spawnstruct();
    }
    
    level.vehicle.templates = spawnstruct();
    level.vehicle.helicopter_crash_locations = getentarray( "helicopter_crash_location", #targetname );
    level.vehicle.helicopter_crash_locations = arraycombine( level.vehicle.helicopter_crash_locations, utility::getstructarray_delete( "helicopter_crash_location", "targetname" ) );
    level.vehicle.templates.team = [];
    level.vehicle.templates.deathmodel = [];
    level.vehicle.templates.death_thread = [];
    level.vehicle.templates.driveidle = [];
    level.vehicle.templates.driveidle_r = [];
    level.vehicle.templates.rumble = [];
    level.vehicle.templates.mainturret = [];
    level.vehicle.templates.mgturret = [];
    level.vehicle.templates.death_earthquake = [];
    level.vehicle.templates.surface_effects = [];
    level.vehicle.templates.unloadgroups = [];
    level.vehicle.templates.aianims = [];
    level.vehicle.templates.landanims = [];
    level.vehicle.templates.exhaust_fx = [];
    level.vehicle.templates.engine_fx = [];
    level.vehicle.templates.shoot_shock = [];
    level.vehicle.templates.hide_part_list = [];
    level.vehicle.templates.destructible_model = [];
    level.vehicle.templates.grenade_shield = [];
    level.vehicle.templates.var_d499c951c21f6dbb = [];
    level.vehicle.templates.bullet_shield = [];
    level.vehicle.templates.collision_shield = [];
    level.vehicle.templates.death_jolt = [];
    level.vehicle.templates.death_badplace = [];
    level.vehicle.templates.idle_anim = [];
    level.vehicle.templates.helicopter_list = [];
    level.vehicle.templates.boat_list = [];
    level.vehicle.templates.airplane_list = [];
    level.vehicle.templates.tank_list = [];
    level.vehicle.templates.single_tread_list = [];
    level.vehicle.templates.deathanimations = [];
    level.vehicle.templates.vehicle_death_fx = [];
    level.vehicle.templates.vehicle_rocket_death_fx = [];
    level.vehicle.templates.var_5cc6ecb6fb44af7c = [];
    level.vehicle.templates.death_radiusdamage = [];
    level.vehicle.templates.model = [];
    level.vehicle.templates.husk = [];
    level.vehicle.templates.var_bc8fe258d26d514 = [];
    level.vehicle.templates.iw9physics = [];
    level.vehicle.templates.hudindex = [];
    level.vehicle.templates.dependentparts = [];
    level.vehicle.damageableparts = [];
    level.vehicle.var_f601a32decc8f632 = throttle::throttle_initialize( "stoppedVehicle_throttle", 10 );
    
    if ( utility::issp() )
    {
        partdamagel = function_2628f73dceb39b8a( 3, 3 );
        var_c31008c7889ca83 = function_2628f73dceb39b8a( 5, 5 );
        var_c30fa8c7889bd51 = function_2628f73dceb39b8a( 5, 5 );
        var_c31018c7889ccb6 = function_2628f73dceb39b8a( 3, 3 );
        level.vehicle.damageableparts[ "tag_mirror_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_mirror_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_mirror_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_mirror_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_left_2" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_right_2" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_left_2" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_right_2" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_top_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_top_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_middle" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_front_top" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_back_top" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_parking_front_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_parking_front_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_parking_back_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_parking_back_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_fog_left_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_light_fog_right_d0" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_antenna" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_hubcap_front_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_hubcap_front_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_hubcap_back_left" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_hubcap_back_right" ] = partdamagel;
        level.vehicle.damageableparts[ "tag_windshield_front" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_windshield_front_pristine" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_windshield_front_web" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_windshield_back" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_front_left" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_front_right" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_back_left" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_back_right" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_back_left_corner" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_back_right_corner" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_window_sunroof" ] = var_c31008c7889ca83;
        level.vehicle.damageableparts[ "tag_door_front_left" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_front_right" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_back_left" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_back_right" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_front_left_d0" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_front_right_d0" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_back_left_d0" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_door_back_right_d0" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_hood" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_hood_d0" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_trunk" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_bumper_front" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_bumper_back" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_bumper_front_damaged" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_bumper_back_damaged" ] = var_c30fa8c7889bd51;
        level.vehicle.damageableparts[ "tag_wheel_center_front_left" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_center_front_right" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_center_middle_left" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_center_middle_right" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_center_back_left" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_center_back_right" ] = var_c31018c7889ccb6;
        level.vehicle.damageableparts[ "tag_wheel_spare" ] = var_c31018c7889ccb6;
        
        foreach ( name, _ in level.vehicle.damageableparts )
        {
            vehicle::function_6a14477bcf586606( name );
        }
    }
}

// Namespace vehicle_code
// Params 2, eflags: 0x4
// Checksum 0x5a01906c, Offset: 0x19ca
// Size: 0x43
function private function_2628f73dceb39b8a( healthvalue, explosivedamagehealthvalue )
{
    part = spawnstruct();
    part.healthvalue = healthvalue;
    part.explosivedamagehealthvalue = explosivedamagehealthvalue;
    return part;
}

// Namespace vehicle_code
// Params 2
// Checksum 0x8b0f762f, Offset: 0x1a16
// Size: 0x121
function _getvehiclespawnerarray( value, key )
{
    /#
        if ( isdefined( value ) || isdefined( key ) )
        {
            assert( isdefined( value ) && isdefined( key ), "<dev string:x24>" );
        }
    #/
    
    newarray = [];
    
    if ( isdefined( value ) && isdefined( key ) )
    {
        check_classname = 1;
        vehicles = getentarray( value, key );
    }
    else
    {
        check_classname = 0;
        vehicles = getentarray( "script_vehicle", #code_classname );
    }
    
    foreach ( vehicle in vehicles )
    {
        if ( check_classname && vehicle.code_classname != "script_vehicle" )
        {
            continue;
        }
        
        if ( isspawner( vehicle ) )
        {
            newarray[ newarray.size ] = vehicle;
        }
    }
    
    return newarray;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x727ed301, Offset: 0x1b40
// Size: 0x3f
function _mainturretoff()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    self.script_turretmain = 0;
    
    if ( !isdefined( self.mainturret ) )
    {
        return;
    }
    
    _turretoffshared( self.mainturret );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xa4f0a456, Offset: 0x1b87
// Size: 0x40
function _mainturreton()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    self.script_turretmain = 1;
    
    if ( !isdefined( self.mainturret ) )
    {
        return;
    }
    
    _turretonshared( self.mainturret );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xa28cc787, Offset: 0x1bcf
// Size: 0xed
function _mgoff()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    self.script_turretmg = 0;
    
    if ( vehicle::ishelicopter() && hashelicopterturret() )
    {
        if ( isdefined( level.chopperturretfunc ) )
        {
            assert( isdefined( level.chopperturretofffunc ), "<dev string:x7c>" );
            self thread [[ level.chopperturretofffunc ]]();
            return;
        }
    }
    
    if ( !isdefined( self.mgturret ) )
    {
        return;
    }
    
    foreach ( turret in self.mgturret )
    {
        _turretoffshared( turret );
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x6abecdce, Offset: 0x1cc4
// Size: 0xe8
function _mgon()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    self.script_turretmg = 1;
    
    if ( vehicle::ishelicopter() && hashelicopterturret() )
    {
        assert( isdefined( level.chopperturretonfunc ), "<dev string:x7c>" );
        self thread [[ level.chopperturretonfunc ]]();
        return;
    }
    
    if ( !isdefined( self.mgturret ) )
    {
        return;
    }
    
    foreach ( turret in self.mgturret )
    {
        turret show();
        _turretonshared( turret );
    }
}

// Namespace vehicle_code
// Params 1
// Checksum 0x77b2e2dc, Offset: 0x1db4
// Size: 0x34
function _turretoffshared( turret )
{
    if ( isdefined( turret.script_fireondrones ) )
    {
        turret.script_fireondrones = 0;
    }
    
    turret setmode( "manual" );
}

// Namespace vehicle_code
// Params 1
// Checksum 0xe46b50ad, Offset: 0x1df0
// Size: 0x76
function _turretonshared( turret )
{
    if ( isdefined( turret.script_fireondrones ) )
    {
        turret.script_fireondrones = 1;
    }
    
    if ( isdefined( turret.defaultonmode ) )
    {
        if ( turret.defaultonmode != "sentry" )
        {
            turret setmode( turret.defaultonmode );
        }
    }
    else
    {
        turret setmode( "auto_nonai" );
    }
    
    set_turret_team( turret );
}

// Namespace vehicle_code
// Params 1
// Checksum 0xd78badbe, Offset: 0x1e6e
// Size: 0x592
function _vehicle_unload( who )
{
    self endon( "death" );
    
    if ( isdefined( who ) )
    {
        self.unload_group = who;
    }
    
    if ( isdefined( self.var_90e7b611090c5e09 ) )
    {
        result = self [[ self.var_90e7b611090c5e09 ]]();
        
        if ( isdefined( result ) )
        {
            return result;
        }
    }
    
    if ( isdefined( level.func[ "vehicle_unload" ] ) )
    {
        result = self [[ level.func[ "vehicle_unload" ] ]]();
        
        if ( isdefined( result ) )
        {
            return result;
        }
    }
    
    if ( utility::ent_flag_exist( "no_riders_until_unload" ) )
    {
        utility::ent_flag_set( "no_riders_until_unload" );
        ai = spawn_unload_group( self.unload_group );
        
        foreach ( a in ai )
        {
            ai::spawn_failed( a );
        }
        
        waittillframeend();
    }
    
    self notify( "unloading" );
    ai = [];
    unloadgroups = level.vehicle.templates.unloadgroups[ get_vehicle_classname() ];
    
    if ( isdefined( unloadgroups ) )
    {
        unloadgroup = vehicle_aianim::get_unload_group();
        
        if ( self.vehiclesetuprope )
        {
            for ( i = 0; i < level.vehicle.templates.aianims[ get_vehicle_classname() ].size ; i++ )
            {
                animpos = level.vehicle.templates.aianims[ get_vehicle_classname() ][ i ];
                
                if ( animpos.setuprope )
                {
                    usingrope = 0;
                    
                    foreach ( rider in self.riders )
                    {
                        if ( isdefined( rider.vehicle_position ) && isdefined( unloadgroup[ rider.vehicle_position ] ) && rider.vehicle_position != i )
                        {
                            rideranimpos = vehicle_aianim::anim_pos( self, rider.vehicle_position );
                            
                            if ( rideranimpos.fastroperig == animpos.fastroperig )
                            {
                                usingrope = 1;
                                break;
                            }
                        }
                    }
                    
                    if ( usingrope )
                    {
                        foreach ( rider in self.riders )
                        {
                            if ( isalive( rider ) && isdefined( rider.vehicle_position ) && rider.vehicle_position == i )
                            {
                                vehicle_aianim::guy_setup_rope( rider, animpos );
                                break;
                            }
                        }
                    }
                }
            }
        }
        
        foreach ( rider in self.riders )
        {
            if ( isdefined( rider.vehicle_position ) && isalive( rider ) && isdefined( unloadgroup[ rider.vehicle_position ] ) )
            {
                if ( isdefined( level.vehicle.aianimcheck[ "unload" ] ) && ![[ level.vehicle.aianimcheck[ "unload" ] ]]( rider, rider.vehicle_position ) )
                {
                    continue;
                }
                
                animpos = vehicle_aianim::anim_pos( self, rider.vehicle_position );
                
                if ( isdefined( animpos ) && animpos.do_not_unload )
                {
                    continue;
                }
                
                rider setbattlechatterflag( "unloading", 1, 3 );
                rider setbattlechatterflag( "disabled", 0 );
                
                if ( isdefined( level.vehicle.aianimthread[ "unload" ] ) )
                {
                    if ( !animpos.setuprope )
                    {
                        rider notify( "newanim" );
                        
                        if ( rider != self.aidriver && who == "moving" )
                        {
                            rider._blackboard.var_b9c6f854e130fe2a = 1;
                        }
                        
                        if ( rider == self.aidriver && who == "moving" )
                        {
                            continue;
                        }
                        
                        thread [[ level.vehicle.aianimthread[ "unload" ] ]]( rider, rider.vehicle_position );
                        rider notify( "unload" );
                        rider.vehicle = undefined;
                        
                        if ( isdefined( animpos.mgturret ) )
                        {
                            rider ai::stop_use_turret();
                        }
                        
                        ai[ ai.size ] = rider;
                    }
                }
            }
        }
    }
    
    return ai;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x80ec3f57, Offset: 0x2409
// Size: 0x3c
function vehicle_setuplevelvariables()
{
    if ( !utility::add_init_script( "vehicle_vars", &vehicle_setuplevelvariables ) )
    {
        return;
    }
    
    vehicle_initlevelvariables();
    
    /#
        if ( getprojectname() == "<dev string:xec>" )
        {
            init_vehicle_spawner_devgui();
        }
    #/
    
    vehicle_aianim::setup_aianimthreads();
}

// Namespace vehicle_code
// Params 1
// Checksum 0x11afcda4, Offset: 0x244d
// Size: 0xa1
function vehicle_triggerkillspawner( trigger )
{
    trigger waittill( "trigger" );
    
    foreach ( vehiclespawner in vehicle_getspawnerarray() )
    {
        if ( vehiclespawner.script_kill_vehicle_spawner == trigger.script_kill_vehicle_spawner )
        {
            vehiclespawner delete();
        }
    }
}

// Namespace vehicle_code
// Params 1
// Checksum 0x9284e0cb, Offset: 0x24f6
// Size: 0x178
function vehicle_spawnaiarray( spawners )
{
    totalspawnedai = [];
    forcespawn = utility::ent_flag_exist( "no_riders_until_unload" ) && utility::ent_flag( "no_riders_until_unload" );
    
    foreach ( spawner in spawners )
    {
        spawner.count = 1;
        dronespawn = 0;
        
        if ( spawner.script_drone )
        {
            dronespawn = 1;
            spawned = utility::script_func( "dronespawn_bodyonly", spawner );
            spawned utility::script_func( "drone_give_soul" );
        }
        else if ( spawner.script_fakeactor || spawner.script_bodyonly )
        {
            dronespawn = 1;
            spawned = utility::script_func( "bodyonlyspawn", spawner );
            spawned utility::script_func( "fakeactor_give_soul" );
        }
        else
        {
            spawned = spawner utility::script_func( "spawn_ai", forcespawn );
        }
        
        if ( !dronespawn && !isalive( spawned ) )
        {
            continue;
        }
        
        totalspawnedai[ totalspawnedai.size ] = spawned;
    }
    
    riders = vehicle_removenonridersfromaiarray( totalspawnedai );
    return riders;
}

// Namespace vehicle_code
// Params 1
// Checksum 0x5d261b3e, Offset: 0x2677
// Size: 0x98
function vehicle_removenonridersfromaiarray( aiarray )
{
    living_ai = [];
    
    foreach ( ai in aiarray )
    {
        if ( !ai_should_be_added( ai ) )
        {
            continue;
        }
        
        living_ai[ living_ai.size ] = ai;
    }
    
    return living_ai;
}

// Namespace vehicle_code
// Params 1
// Checksum 0x66646737, Offset: 0x2718
// Size: 0x44, Type: bool
function ai_should_be_added( ai )
{
    if ( isalive( ai ) )
    {
        return true;
    }
    
    if ( !isdefined( ai ) )
    {
        return false;
    }
    
    if ( !isdefined( ai.classname ) )
    {
        return false;
    }
    
    return ai.classname == "script_model";
}

// Namespace vehicle_code
// Params 0
// Checksum 0x8013e47b, Offset: 0x2765
// Size: 0x6b
function spawn_riders()
{
    if ( utility::ent_flag_exist( "no_riders_until_unload" ) && !utility::ent_flag( "no_riders_until_unload" ) )
    {
        self notify( "spawnedRiders" );
        return [];
    }
    
    spawners = get_vehicle_riders_spawners();
    
    if ( !spawners.size )
    {
        self notify( "spawnedRiders" );
        return [];
    }
    
    riders = spawn_group( spawners );
    self notify( "spawnedRiders", riders );
    return riders;
}

// Namespace vehicle_code
// Params 1
// Checksum 0x647d27bd, Offset: 0x27d9
// Size: 0xbc
function spawn_group( spawners )
{
    ai = vehicle_spawnaiarray( spawners );
    ai = sort_by_startingpos( ai );
    
    if ( vehicle::function_df978a2fa3318bbd() )
    {
        thread vehicle_ai::load( ai, 1 );
    }
    else
    {
        foreach ( guy in ai )
        {
            thread vehicle_aianim::guy_enter( guy );
        }
    }
    
    thread set_loaded_when_full( ai );
    return ai;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xeb10ae94, Offset: 0x289e
// Size: 0x24
function set_loaded_when_full( ai )
{
    utility::array_wait( ai, "loaded", 1 );
    vehicle_aianim::vehicle_loaded_if_full( self );
}

// Namespace vehicle_code
// Params 1
// Checksum 0x64b0cf2, Offset: 0x28ca
// Size: 0x2aa
function spawn_unload_group( who )
{
    if ( !isdefined( who ) )
    {
        return spawn_riders();
    }
    
    assert( utility::ent_flag_exist( "<dev string:xf3>" ) && utility::ent_flag( "<dev string:xf3>" ), "<dev string:x10d>" );
    spawners = get_vehicle_riders_spawners();
    
    if ( !spawners.size )
    {
        return [];
    }
    
    group_spawners = [];
    classname = get_vehicle_classname();
    
    if ( isdefined( level.vehicle.templates.unloadgroups[ classname ] ) && isdefined( level.vehicle.templates.unloadgroups[ classname ][ who ] ) )
    {
        group = level.vehicle.templates.unloadgroups[ classname ][ who ];
        
        for ( i = 0; i < group.size ; i++ )
        {
            if ( isdefined( spawners[ i ] ) )
            {
                spawners[ i ].script_startingposition = group[ i ];
            }
        }
        
        spawners = sort_by_startingpos( spawners );
        
        foreach ( ride_pos in group )
        {
            foreach ( spawner in spawners )
            {
                if ( spawner.script_startingposition == ride_pos )
                {
                    group_spawners[ group_spawners.size ] = spawner;
                }
            }
        }
        
        ai = vehicle_spawnaiarray( group_spawners );
        
        foreach ( guy in ai )
        {
            thread vehicle_aianim::guy_enter( guy );
        }
        
        self notify( "spawnedRiders", ai );
        return ai;
    }
    
    return spawn_riders();
}

// Namespace vehicle_code
// Params 1
// Checksum 0x6c7f1082, Offset: 0x2b7c
// Size: 0xb2
function sort_by_startingpos( guysarray )
{
    firstarray = [];
    secondarray = [];
    
    foreach ( guy in guysarray )
    {
        if ( isdefined( guy.script_startingposition ) )
        {
            firstarray[ firstarray.size ] = guy;
            continue;
        }
        
        secondarray[ secondarray.size ] = guy;
    }
    
    return arraycombine( firstarray, secondarray );
}

// Namespace vehicle_code
// Params 1
// Checksum 0x4abf3f31, Offset: 0x2c37
// Size: 0x28
function function_2f279e91bd543e23( spawndata )
{
    if ( vehicle::ishelicopter() )
    {
        thread vehicle_ai_avoidance_heli( spawndata );
        return;
    }
    
    thread vehicle_ai_avoidance_logic();
}

// Namespace vehicle_code
// Params 0
// Checksum 0xcd202a71, Offset: 0x2c67
// Size: 0x3d
function get_vehicle_classname()
{
    var_7237854e3be197ca = self.classname_mp;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    var_7237854e3be197ca = self.classname_sp;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return self.classname;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x7bf375b8, Offset: 0x2cad
// Size: 0x4b
function function_3f2131cd26f094cb()
{
    var_7237854e3be197ca = self.modelhack;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    model = self.vehiclemodel;
    
    if ( model == "" )
    {
        model = self.model;
    }
    
    return model;
}

#using_animtree( "vehicles" );

// Namespace vehicle_code
// Params 0
// Checksum 0x5414ef3c, Offset: 0x2d01
// Size: 0x20b
function vehicle_deathcleanup()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x153>" + "<dev string:x18c>" + "<dev string:x1b2>" );
    self notify( "stop_looping_death_fx" );
    self notify( "death_finished" );
    
    if ( isdefined( self.navobstacleid ) )
    {
        destroynavobstacle( self.navobstacleid );
    }
    
    destroynavrepulsor( "veh_" + self getentitynumber() );
    
    if ( isdefined( self.rumbletrigger ) )
    {
        self.rumbletrigger delete();
    }
    
    if ( isdefined( self.mgturret ) )
    {
        utility::array_delete( self.mgturret );
    }
    
    if ( isdefined( self.mainturret ) )
    {
        self.mainturret delete();
    }
    
    if ( level.vehicle.templates.has_main_turret[ self.model ] )
    {
        self clearturrettarget();
    }
    
    classname = get_vehicle_classname();
    
    if ( isdefined( level.vehicle.templates.rumble[ classname ] ) )
    {
        self stoprumble( level.vehicle.templates.rumble[ classname ].rumble );
    }
    
    if ( !utility::issp() )
    {
        return;
    }
    
    self useanimtree( #animtree );
    
    if ( isdefined( level.vehicle.templates.driveidle[ self.model ] ) )
    {
        self clearanim( level.vehicle.templates.driveidle[ self.model ], 0 );
    }
    
    if ( isdefined( level.vehicle.templates.driveidle_r[ self.model ] ) )
    {
        self clearanim( level.vehicle.templates.driveidle_r[ self.model ], 0 );
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0xee29b86e, Offset: 0x2f14
// Size: 0xc, Type: bool
function vehicle_iscrashing()
{
    return istrue( self.vehiclecrashing );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xd79607cc, Offset: 0x2f29
// Size: 0x9
function vehicle_killriders()
{
    vehicle_ai::kill_riders();
}

// Namespace vehicle_code
// Params 2
// Checksum 0x1cd2bd36, Offset: 0x2f3a
// Size: 0x1bf
function vehicle_landanims( isunloadnode, hasnextnode )
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    self endon( "death" );
    classname = get_vehicle_classname();
    
    if ( !isdefined( level.vehicle.templates.landanims[ classname ] ) )
    {
        return;
    }
    
    landanims = level.vehicle.templates.landanims[ classname ];
    
    foreach ( lanim in landanims )
    {
        self setanim( lanim.land, 1, 0.2, 1 );
    }
    
    if ( !hasnextnode )
    {
        return;
    }
    
    if ( isdefined( isunloadnode ) )
    {
        self waittill( "unloaded" );
    }
    else
    {
        self waittill( "continuepath" );
    }
    
    foreach ( lanim in landanims )
    {
        self clearanim( lanim.land, 0 );
        self setanim( lanim.takeoff, 1, 0.2, 1 );
    }
}

// Namespace vehicle_code
// Params 1
// Checksum 0x54def9c6, Offset: 0x3101
// Size: 0xcd
function waittill_stable( node )
{
    offset = 12;
    stabletime = 400;
    timer = gettime() + stabletime;
    prevangles = self.angles;
    
    while ( isdefined( self ) )
    {
        if ( abs( angleclamp180( self.angles[ 0 ] ) ) > offset || abs( angleclamp180( self.angles[ 2 ] ) ) > offset || abs( self.angles[ 1 ] - prevangles[ 1 ] ) > 0.5 )
        {
            timer = gettime() + stabletime;
        }
        
        if ( gettime() > timer )
        {
            break;
        }
        
        prevangles = self.angles;
        wait 0.05;
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x61b781d9, Offset: 0x31d6
// Size: 0xa
function vehicle_kill_badplace_forever()
{
    self notify( "kill_badplace_forever" );
}

// Namespace vehicle_code
// Params 1
// Checksum 0x4d582aca, Offset: 0x31e8
// Size: 0x17
function function_b6c635d769164cf1( node )
{
    return node.target;
}

// Namespace vehicle_code
// Params 1
// Checksum 0x1dbbbd05, Offset: 0x3208
// Size: 0x111
function get_from_spawnstruct( node )
{
    array = utility::getstructarray( node.target, "targetname" );
    
    if ( array.size == 1 )
    {
        return array[ 0 ];
    }
    
    foreach ( element in array )
    {
        poi_definition = isdefined( element.script_poi ) ? element.script_poi : element.poi;
        var_795f8b8921c5b492 = isdefined( self.script_poi ) ? self.script_poi : self.poi;
        
        if ( poi_definition == var_795f8b8921c5b492 )
        {
            return element;
        }
    }
    
    return array[ 0 ];
}

// Namespace vehicle_code
// Params 1
// Checksum 0xfa7e6581, Offset: 0x3321
// Size: 0x43
function get_from_entity( node )
{
    ent = getentarray( node.target, #targetname );
    
    if ( ent.size > 0 )
    {
        return ent[ randomint( ent.size ) ];
    }
    
    return undefined;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xc6651319, Offset: 0x336d
// Size: 0x24
function get_from_vehicle_node( node )
{
    return getvehiclenode( node.target, #targetname );
}

// Namespace vehicle_code
// Params 1
// Checksum 0xd3650c6a, Offset: 0x339a
// Size: 0x4b
function set_lookat_from_dest( dest )
{
    viewtarget = getent( dest.script_linkto, #script_linkname );
    
    if ( !isdefined( viewtarget ) )
    {
        return;
    }
    
    self setlookatent( viewtarget );
    self.set_lookat_point = 1;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x495c5cad, Offset: 0x33ed
// Size: 0x66, Type: bool
function hashelicopterturret()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    
    if ( !isdefined( self.vehicletype ) )
    {
        return false;
    }
    
    if ( self.vehicletype == "cobra" )
    {
        return true;
    }
    
    if ( self.vehicletype == "cobra_player" )
    {
        return true;
    }
    
    if ( self.vehicletype == "viper" )
    {
        return true;
    }
    
    return false;
}

// Namespace vehicle_code
// Params 0
// Checksum 0xcf103e8d, Offset: 0x345c
// Size: 0x18
function vehicle_ai_avoidance_cleanup()
{
    self waittill( "death" );
    vehicle_remove_navobstacle();
    vehicle_remove_navrepulsor();
}

// Namespace vehicle_code
// Params 0
// Checksum 0xaf56372, Offset: 0x347c
// Size: 0x121
function vehicle_ai_avoidance_logic()
{
    self endon( "death" );
    thread vehicle_ai_avoidance_cleanup();
    isphysicsvehicle = self vehicle_isphysveh();
    var_95f636000669c3d5 = 56.25;
    vehicleref = vehicle::get_ref();
    
    if ( vehicle::has_data( vehicleref ) )
    {
        bundledata = vehicle::get_data( vehicleref );
        var_95f636000669c3d5 = bundledata.nudgethreshold * bundledata.nudgethreshold;
    }
    
    while ( true )
    {
        throttle::function_cc0eee553a602af0( level.vehicle.var_f601a32decc8f632, self );
        vehicle_navobstacle();
        
        for ( currentorigin = self.origin; function_a45a8093293194a7( isphysicsvehicle ) ; currentorigin = self.origin )
        {
            wait 0.5;
            
            if ( length2dsquared( self.origin - currentorigin ) > var_95f636000669c3d5 )
            {
                vehicle_remove_navobstacle();
                vehicle_navobstacle();
            }
        }
        
        vehicle_remove_navobstacle();
        vehicle_navrepulsor();
        
        while ( !function_a45a8093293194a7( isphysicsvehicle ) )
        {
            wait 0.1;
        }
        
        vehicle_remove_navrepulsor();
    }
}

// Namespace vehicle_code
// Params 1
// Checksum 0x3bf72216, Offset: 0x35a5
// Size: 0x9e, Type: bool
function function_a45a8093293194a7( isphysicsvehicle )
{
    if ( !vehicle_is_stopped( 1 ) )
    {
        return false;
    }
    
    if ( isphysicsvehicle && !self vehicle_isonground() )
    {
        return false;
    }
    
    if ( !utility::issp() )
    {
        if ( !self vehicle_isphysveh() )
        {
            return false;
        }
        
        if ( self hascomponent( "p2p" ) && self function_24e10bf6894fa869( "p2p", "manualSpeed" ) > 0 )
        {
            return false;
        }
        
        if ( self hascomponent( "path" ) && !self function_24e10bf6894fa869( "path", "pause" ) && self function_24e10bf6894fa869( "path", "targetSpeed" ) > 0 )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xb16dbe58, Offset: 0x364c
// Size: 0x6d, Type: bool
function vehicle_is_stopped( var_ed87b2c2706620c4 )
{
    velocity = self vehicle_getvelocity();
    
    if ( !isdefined( velocity ) )
    {
        return true;
    }
    
    speed = var_ed87b2c2706620c4 ? length( ( velocity[ 0 ], velocity[ 1 ], 0 ) ) : length( velocity );
    
    if ( self vehicle_isphysveh() )
    {
        return ( speed / 17.6 < 0.25 );
    }
    
    return speed / 17.6 == 0;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xd7e32d63, Offset: 0x36c2
// Size: 0xb2
function vehicle_ai_avoidance_heli( spawndata )
{
    self endon( "death" );
    thread vehicle_ai_avoidance_cleanup();
    
    while ( true )
    {
        if ( spawndata.var_d395743aa17d3e48 )
        {
            function_c20e7a724922fd1d( spawndata.var_d395743aa17d3e48 );
        }
        else
        {
            vehicle_navobstacle();
        }
        
        while ( self vehicle_getspeed() == 0 && ( !isdefined( self.script_disconnectpaths ) || self.script_disconnectpaths ) )
        {
            wait 0.1;
        }
        
        vehicle_remove_navobstacle();
        
        while ( self vehicle_getspeed() != 0 || isdefined( self.script_disconnectpaths ) && !self.script_disconnectpaths )
        {
            wait 0.1;
        }
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x1035ec21, Offset: 0x377c
// Size: 0x42
function vehicle_navrepulsor()
{
    if ( isdefined( self.script_badplace ) && !self.script_badplace )
    {
        return;
    }
    
    createnavrepulsor( self.unique_id + "vehicle_badplace", -1, self, -1, 0, "allies", "axis" );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xe9bf80c8, Offset: 0x37c6
// Size: 0x16
function vehicle_remove_navrepulsor()
{
    destroynavrepulsor( self.unique_id + "vehicle_badplace" );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xf43e9d83, Offset: 0x37e4
// Size: 0x2c
function vehicle_navobstacle()
{
    if ( isdefined( self.script_disconnectpaths ) && !self.script_disconnectpaths )
    {
        return;
    }
    
    self.navobstacleid = createnavbadplacebyent( self );
}

// Namespace vehicle_code
// Params 1
// Checksum 0xce984919, Offset: 0x3818
// Size: 0x49
function function_c20e7a724922fd1d( bounds )
{
    if ( isdefined( self.script_disconnectpaths ) && !self.script_disconnectpaths )
    {
        return;
    }
    
    self.navobstacleid = createnavbadplacebybounds( self.origin, bounds, self.angles );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xc6aa83cb, Offset: 0x3869
// Size: 0x27
function vehicle_remove_navobstacle()
{
    if ( isdefined( self.navobstacleid ) )
    {
        destroynavobstacle( self.navobstacleid );
        self.navobstacleid = undefined;
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x5f2bdd17, Offset: 0x3898
// Size: 0x13
function vehicle_disable_navrepulsors()
{
    self.script_badplace = 0;
    vehicle_remove_navrepulsor();
}

// Namespace vehicle_code
// Params 0
// Checksum 0xf2c593ce, Offset: 0x38b3
// Size: 0x1d
function vehicle_enable_navrepulsors()
{
    self.script_badplace = undefined;
    
    if ( !function_a45a8093293194a7() )
    {
        vehicle_navrepulsor();
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x70e74ae5, Offset: 0x38d8
// Size: 0x13
function vehicle_disable_navobstacles()
{
    self.script_disconnectpaths = 0;
    vehicle_remove_navobstacle();
}

// Namespace vehicle_code
// Params 0
// Checksum 0x37bf5deb, Offset: 0x38f3
// Size: 0x2a
function vehicle_enable_navobstacles()
{
    self.script_disconnectpaths = undefined;
    
    if ( !self.navobstacleid && function_a45a8093293194a7() )
    {
        vehicle_navobstacle();
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0xc121aa4b, Offset: 0x3925
// Size: 0xfb
function mainturretinit()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    classname = get_vehicle_classname();
    
    if ( !isdefined( level.vehicle.templates.mainturret[ classname ] ) )
    {
        return;
    }
    
    turret_template = level.vehicle.templates.mainturret[ classname ];
    
    if ( !isdefined( turret_template ) )
    {
        return;
    }
    
    allowed_turrets = "";
    
    if ( isdefined( self.script_turrets ) )
    {
        allowed_turrets = self.script_turrets;
    }
    
    self.mainturret = turretinitshared( turret_template );
    
    if ( !isdefined( self.script_turretmain ) )
    {
        self.script_turretmain = 1;
    }
    
    if ( self.script_turretmain == 0 )
    {
        thread _mainturretoff();
        return;
    }
    
    self.script_turretmain = 1;
    thread _mainturreton();
}

// Namespace vehicle_code
// Params 0
// Checksum 0xa020f75c, Offset: 0x3a28
// Size: 0x1ab
function mginit()
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    classname = get_vehicle_classname();
    
    if ( isdefined( self.script_nomg ) && self.script_nomg > 0 )
    {
        return;
    }
    
    if ( !isdefined( level.vehicle.templates.mgturret[ classname ] ) )
    {
        return;
    }
    
    turret_templates = level.vehicle.templates.mgturret[ classname ];
    
    if ( !isdefined( turret_templates ) )
    {
        return;
    }
    
    allowed_turrets = "";
    
    if ( isdefined( self.script_turrets ) )
    {
        allowed_turrets = self.script_turrets;
    }
    
    foreach ( index, turret_template in turret_templates )
    {
        if ( isdefined( turret_template.referencename ) && !issubstr( allowed_turrets, turret_template.referencename ) )
        {
            continue;
        }
        
        self.mgturret[ index ] = turretinitshared( turret_template );
    }
    
    if ( !isdefined( self.script_turretmg ) )
    {
        self.script_turretmg = 1;
    }
    
    if ( self.script_turretmg == 0 )
    {
        thread _mgoff();
        return;
    }
    
    self.script_turretmg = 1;
    thread _mgon();
}

// Namespace vehicle_code
// Params 1
// Checksum 0x9b8930f4, Offset: 0x3bdb
// Size: 0x2a1
function turretinitshared( turret_template )
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    mgangle = 0;
    
    if ( isdefined( self.script_mg_angle ) )
    {
        mgangle = self.script_mg_angle;
    }
    
    turret = spawnturret( "misc_turret", ( 0, 0, 0 ), turret_template.info );
    linkoffset = turret_template.offset_tag ?? ( 0, 0, 0 );
    parent = self;
    
    if ( isdefined( turret_template.mainturretchild ) )
    {
        if ( !isdefined( self.mainturret ) )
        {
            assertmsg( "<dev string:x1be>" + get_vehicle_classname() + "<dev string:x1d5>" );
        }
        
        parent = self.mainturret;
    }
    
    turret linkto( parent, turret_template.tag, linkoffset, ( 0, -1 * mgangle, 0 ) );
    bodymodel = function_3f2131cd26f094cb();
    array = strtok( bodymodel, "::" );
    
    if ( array.size > 1 )
    {
        color = array[ 0 ] + "::";
    }
    else
    {
        color = "";
    }
    
    turret setmodel( color + turret_template.model );
    turret.angles = self.angles;
    turret.isvehicleattached = 1;
    turret.ownervehicle = self;
    turret.weaponinfo = turret_template.info;
    assert( isdefined( self.script_team ) );
    turret.script_team = self.script_team;
    turret makeusable();
    set_turret_team( turret );
    level thread vehicle_turret_difficulty( turret, utility::getdifficulty() );
    
    if ( isdefined( self.script_fireondrones ) )
    {
        turret.script_fireondrones = self.script_fireondrones;
    }
    
    if ( isdefined( turret_template.deletedelay ) )
    {
        turret.deletedelay = turret_template.deletedelay;
    }
    
    if ( isdefined( turret_template.defaultdroppitch ) )
    {
        turret setdefaultdroppitch( turret_template.defaultdroppitch );
    }
    
    if ( isdefined( turret_template.referencename ) )
    {
        turret.referencename = turret_template.referencename;
    }
    
    if ( isdefined( turret_template.defaultonmode ) )
    {
        turret turret_set_default_on_mode( turret_template.defaultonmode );
    }
    
    return turret;
}

// Namespace vehicle_code
// Params 2
// Checksum 0xe5351793, Offset: 0x3e85
// Size: 0xbf
function vehicle_turret_difficulty( turret, difficulty )
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    turret.convergencetime = level.mgturretsettings[ difficulty ][ "convergenceTime" ];
    turret.suppressiontime = level.mgturretsettings[ difficulty ][ "suppressionTime" ];
    turret.accuracy = level.mgturretsettings[ difficulty ][ "accuracy" ];
    turret.aispread = level.mgturretsettings[ difficulty ][ "aiSpread" ];
    turret.playerspread = level.mgturretsettings[ difficulty ][ "playerSpread" ];
}

// Namespace vehicle_code
// Params 1
// Checksum 0x347a9430, Offset: 0x3f4c
// Size: 0x17
function turret_set_default_on_mode( defaultonmode )
{
    self.defaultonmode = defaultonmode;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xd005687f, Offset: 0x3f6b
// Size: 0xc7
function set_turret_team( turret )
{
    switch ( self.script_team )
    {
        case #"hash_5f54b9bf7583687f":
        case #"hash_ecada18a31eceade":
            turret setturretteam( "allies" );
            break;
        case #"hash_3e323a3a6f36e18b":
        case #"hash_7c2d091e6337bf54":
            turret setturretteam( "axis" );
            break;
        case #"hash_24b14065e10b1f8d":
            turret setturretteam( "team3" );
            break;
        case #"hash_a571cacc018623b8":
            turret setturretteam( "neutral" );
            break;
        default:
            assertmsg( "<dev string:x22c>" + self.script_team );
            break;
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x528b5004, Offset: 0x403a
// Size: 0x70
function vehicle_setteam()
{
    classname = get_vehicle_classname();
    
    if ( !isdefined( self.script_team ) && isdefined( level.vehicle.templates.team[ classname ] ) )
    {
        self.script_team = level.vehicle.templates.team[ classname ];
    }
}

// Namespace vehicle_code
// Params 1
// Checksum 0x5b8eee2e, Offset: 0x40b2
// Size: 0x9d
function get_vehiclenode_any_dynamic( target )
{
    path_start = getvehiclenode( target, #targetname );
    
    if ( !isdefined( path_start ) )
    {
        path_start = getent( target, #targetname );
    }
    else if ( vehicle::ishelicopter() )
    {
        /#
            println( "<dev string:x245>" + path_start.targetname );
            println( "<dev string:x265>" + self.vehicletype );
        #/
        
        assertmsg( "<dev string:x276>" );
    }
    
    if ( !isdefined( path_start ) )
    {
        path_start = utility::getstruct( target, "targetname" );
    }
    
    return path_start;
}

// Namespace vehicle_code
// Params 1
// Checksum 0x949c0a29, Offset: 0x4158
// Size: 0x69, Type: bool
function vehicle_isalive( vehicle )
{
    assert( !vehicle::function_df978a2fa3318bbd(), "<dev string:x49>" );
    
    if ( !isdefined( vehicle ) )
    {
        return false;
    }
    
    if ( vehicle.health < vehicle.healthbuffer )
    {
        return false;
    }
    
    if ( vehicle.health <= 0 )
    {
        return false;
    }
    
    if ( vehicle.isvehiclehusk )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_code
// Params 1
// Checksum 0xdc6c18e9, Offset: 0x41ca
// Size: 0x22
function vehicle_setwheeldirection( direction )
{
    self.vehiclewheeldirection = direction <= 0 ? 0 : 1;
}

// Namespace vehicle_code
// Params 0
// Checksum 0xc8b2d3b1, Offset: 0x41f4
// Size: 0x54
function vehicle_pathdetach()
{
    self.attachedpath = undefined;
    self notify( "newpath" );
    
    if ( vehicle::ishelicopter() )
    {
        self setgoalyaw( utility::flat_angle( self.angles )[ 1 ] );
        self setvehgoalpos( self.origin + ( 0, 0, 4 ), 1 );
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0x36208fe1, Offset: 0x4250
// Size: 0x1b
function deathrollon()
{
    if ( self.health > 0 )
    {
        self.rollingdeath = 1;
    }
}

// Namespace vehicle_code
// Params 0
// Checksum 0xba3f325b, Offset: 0x4273
// Size: 0x14
function deathrolloff()
{
    self.rollingdeath = undefined;
    self notify( "deathrolloff" );
}

// Namespace vehicle_code
// Params 0
// Checksum 0xed9b841c, Offset: 0x428f
// Size: 0x189
function get_vehicle_riders_spawners()
{
    spawners = [];
    
    if ( isdefined( self.target ) )
    {
        targets = utility::noself_func_return( "getspawnerarray", self.target );
        
        if ( !isdefined( targets ) )
        {
            targets = utility::getstructarray( self.target, "targetname" );
        }
        
        if ( !isdefined( targets ) )
        {
            targets = [];
        }
        
        foreach ( target in targets )
        {
            if ( isstruct( target ) )
            {
                if ( !isdefined( target.script_demeanor ) )
                {
                    continue;
                }
            }
            else
            {
                if ( !issubstr( target.code_classname, "actor" ) && !issubstr( target.code_classname, "vehicle" ) )
                {
                    continue;
                }
                
                if ( issubstr( target.code_classname, "actor" ) )
                {
                    if ( !isspawner( target ) )
                    {
                        continue;
                    }
                    else if ( issubstr( target.code_classname, "vehicle" ) )
                    {
                        if ( !( target.spawnflags & 2 ) )
                        {
                            continue;
                        }
                    }
                }
            }
            
            if ( isdefined( target.dont_auto_ride ) )
            {
                continue;
            }
            
            spawners[ spawners.size ] = target;
        }
    }
    
    return spawners;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x7654ef06, Offset: 0x4421
// Size: 0x3a
function helicopter_unloading_watcher()
{
    if ( !vehicle::ishelicopter() )
    {
        return;
    }
    
    self endon( "vehicle_crashDone" );
    self waittill( "unloading" );
    self.unloading = 1;
    self waittill( "unloaded" );
    self.unloading = undefined;
}

// Namespace vehicle_code
// Params 0
// Checksum 0x290d9518, Offset: 0x4463
// Size: 0x14, Type: bool
function vehicle_iscorpse()
{
    return isdefined( self ) && get_vehicle_classname() == "script_vehicle_corpse";
}

// Namespace vehicle_code
// Params 0
// Checksum 0x4be6d205, Offset: 0x4480
// Size: 0x77
function detach_getoutrigs()
{
    if ( !isdefined( self.fastroperig ) )
    {
        return;
    }
    
    if ( !self.fastroperig.size )
    {
        return;
    }
    
    keys = getarraykeys( self.fastroperig );
    
    for ( i = 0; i < keys.size ; i++ )
    {
        if ( isdefined( self.fastroperig[ keys[ i ] ] ) )
        {
            self.fastroperig[ keys[ i ] ] unlink();
        }
    }
}

// Namespace vehicle_code
// Params 4
// Checksum 0xa239a131, Offset: 0x44ff
// Size: 0x37a
function vehicle_husklaunch( parent, vehicleref, spawndata, forcemultiplier )
{
    if ( vehicle::is_static() || !self vehicle_isphysveh() )
    {
        return;
    }
    
    if ( isdefined( parent ) && parent.p2phusk )
    {
        return;
    }
    
    if ( isdefined( parent ) && parent.headondeath )
    {
        return;
    }
    
    if ( isdefined( parent ) && isdefined( parent.damageinfo ) )
    {
        damagestrength = parent.damageinfo[ "amount" ];
        damagedir = parent.damageinfo[ "direction_vec" ];
        damagelocation = parent.damageinfo[ "damageLocation" ];
        damagemod = parent.damageinfo[ "MOD" ];
    }
    else
    {
        damagestrength = 600;
        damagedir = undefined;
        damagelocation = self.origin;
        damagemod = "";
    }
    
    if ( isdefined( parent ) && isdefined( parent.var_52e328d5399ca9af ) && gettime() - parent.var_52e328d5399ca9af < 1000 )
    {
        if ( getdvarint( @"hash_cfd8073837710cef" ) )
        {
            /#
                print3d( damagelocation + ( 0, 0, -3 ), "<dev string:x2ac>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            #/
        }
        
        damagestrength *= 0.1;
    }
    
    if ( isdefined( damagedir ) )
    {
        damagedir = ( damagedir[ 0 ], damagedir[ 1 ], 0.25 );
    }
    else
    {
        damagedir = ( randomfloatrange( -0.25, 0.25 ), randomfloatrange( -0.25, 0.25 ), 0.25 );
    }
    
    launchstrength = function_1aaf8ca18b62a037( damagestrength, damagemod, damagelocation, 0.3 );
    
    if ( isdefined( forcemultiplier ) )
    {
        launchstrength *= forcemultiplier;
    }
    
    if ( isdefined( level.sharedfuncs ) && isdefined( vehicleref ) && isdefined( level.sharedfuncs[ vehicleref ] ) )
    {
        var_5dc9baf4f1183a0d = level.sharedfuncs[ vehicleref ][ "vehicle_huskLaunch" ];
        
        if ( isdefined( var_5dc9baf4f1183a0d ) )
        {
            self [[ var_5dc9baf4f1183a0d ]]( spawndata.initialvelocity );
            
            if ( isdefined( self.damagedir ) )
            {
                damagedir = self.damagedir;
            }
            
            if ( isdefined( self.launchstrength ) )
            {
                launchstrength = self.launchstrength;
            }
        }
    }
    
    self vehphys_impulse( damagedir, launchstrength, 1 );
    
    if ( getdvarint( @"hash_cfd8073837710cef" ) )
    {
        /#
            print3d( damagelocation + ( 0, 0, 6 ), "<dev string:x2e2>" + gettime(), ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        /#
            print3d( damagelocation + ( 0, 0, 3 ), "<dev string:x2ec>" + launchstrength, ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        /#
            print3d( damagelocation + ( 0, 0, 0 ), "<dev string:x306>" + self function_c3fd96c6ac9b6b9d( "<dev string:x310>" ) + "<dev string:x318>" + damagestrength, ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        utility::draw_arrow_time( damagelocation, damagelocation + anglestoforward( vectortoangles( damagedir ) ) * launchstrength, ( 1, 0, 1 ), 1000 );
    }
    
    self.var_52e328d5399ca9af = gettime();
}

// Namespace vehicle_code
// Params 4
// Checksum 0x3ac5abb9, Offset: 0x4881
// Size: 0x31e
function function_43313ddf40c5ccdd( amount, damagedir, damagelocation, meansofdeath )
{
    if ( !self vehicle_isphysveh() )
    {
        return;
    }
    
    if ( self.isstationary )
    {
        if ( getdvarint( @"hash_cfd8073837710cef" ) )
        {
            /#
                print3d( damagelocation + ( 0, 0, -3 ), "<dev string:x329>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            #/
        }
        
        return;
    }
    
    if ( self.healthactual <= self.healthbuffer + 1 )
    {
        if ( getdvarint( @"hash_cfd8073837710cef" ) )
        {
            /#
                print3d( damagelocation + ( 0, 0, -3 ), "<dev string:x348>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            #/
        }
        
        return;
    }
    
    if ( isdefined( self.parentlaunchtime ) && gettime() - self.parentlaunchtime < 1000 )
    {
        if ( getdvarint( @"hash_cfd8073837710cef" ) )
        {
            /#
                print3d( damagelocation + ( 0, 0, -3 ), "<dev string:x368>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            #/
        }
        
        amount *= 0.1;
    }
    
    if ( !isdefined( self.var_52e328d5399ca9af ) )
    {
        self.var_52e328d5399ca9af = gettime();
    }
    else if ( gettime() - self.var_52e328d5399ca9af < 1000 )
    {
        if ( getdvarint( @"hash_cfd8073837710cef" ) )
        {
            /#
                print3d( damagelocation + ( 0, 0, -3 ), "<dev string:x3a0>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            #/
        }
        
        amount *= 0.1;
    }
    
    launchstrength = function_1aaf8ca18b62a037( amount, meansofdeath, damagelocation );
    damagedir = ( damagedir[ 0 ], damagedir[ 1 ], 0.25 );
    self vehphys_impulse( damagedir, launchstrength, 1 );
    
    if ( getdvarint( @"hash_cfd8073837710cef" ) )
    {
        /#
            print3d( damagelocation + ( 0, 0, 6 ), "<dev string:x2e2>" + gettime() + "<dev string:x3d1>" + self.var_52e328d5399ca9af, ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        /#
            print3d( damagelocation + ( 0, 0, 3 ), "<dev string:x3ef>" + launchstrength, ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        /#
            print3d( damagelocation + ( 0, 0, 0 ), "<dev string:x306>" + self function_c3fd96c6ac9b6b9d( "<dev string:x310>" ) + "<dev string:x318>" + amount, ( 1, 0, 1 ), 1, 0.2, 1000, 1 );
        #/
        
        utility::draw_arrow_time( damagelocation, damagelocation + anglestoforward( vectortoangles( damagedir ) ) * launchstrength, ( 1, 0, 1 ), 1000 );
    }
    
    self.var_52e328d5399ca9af = gettime();
}

// Namespace vehicle_code
// Params 4
// Checksum 0x26515a17, Offset: 0x4ba7
// Size: 0x12d
function function_1aaf8ca18b62a037( amount, meansofdeath, damagelocation, launchscalar )
{
    if ( !isdefined( launchscalar ) )
    {
        launchscalar = 1;
    }
    
    amount = amount > 600 ? 600 : amount;
    
    if ( isdefined( meansofdeath ) )
    {
        meansofdeath = tolower( meansofdeath );
        
        if ( meansofdeath == "mod_projectile_splash" )
        {
            amount *= 0.75;
        }
    }
    
    if ( self hascomponent( "p2p" ) )
    {
        amount *= 0.1;
    }
    
    mass = self function_c3fd96c6ac9b6b9d( "mass" );
    maxlaunchstrength = mass * 0.1 * launchscalar;
    normalizedamount = math::normalize_value( 600, 0, amount );
    launchstrength = maxlaunchstrength * normalizedamount;
    launchstrength = min( launchstrength, 16250 );
    
    if ( getdvarint( @"hash_cfd8073837710cef" ) )
    {
        /#
            print3d( damagelocation + ( 0, 0, 9 ), "<dev string:x408>" + amount + "<dev string:x422>" + normalizedamount, ( 0, 1, 0 ), 1, 0.2, 1000, 1 );
        #/
    }
    
    return launchstrength;
}

// Namespace vehicle_code
// Params 0
// Checksum 0xf15068ee, Offset: 0x4cdd
// Size: 0x181
function function_123d1d60a34593b()
{
    if ( !self isscriptable() )
    {
        return;
    }
    
    self endon( "death" );
    utility::flag_wait( "scriptables_ready" );
    
    if ( !self getscriptablehaspart( "flag" ) )
    {
        return;
    }
    
    assert( self getscriptableparthasstate( "<dev string:x439>", "<dev string:x441>" ) );
    assert( self getscriptableparthasstate( "<dev string:x439>", "<dev string:x449>" ) );
    assert( self getscriptableparthasstate( "<dev string:x439>", "<dev string:x453>" ) );
    assert( self getscriptableparthasstate( "<dev string:x439>", "<dev string:x45b>" ) );
    speedsqfast = squared( 616 );
    speedsqmedium = squared( 123.2 );
    speedsqslow = squared( 35.2 );
    state = self getscriptablepartstate( "flag" );
    
    while ( true )
    {
        self waittill( "player_enter" );
        
        while ( true )
        {
            prevstate = state;
            speedsquared = lengthsquared( self vehicle_getvelocity() );
            
            if ( speedsquared > speedsqfast )
            {
                state = "fast";
            }
            else if ( speedsquared > speedsqmedium )
            {
                state = "medium";
            }
            else if ( speedsquared > speedsqslow )
            {
                state = "slow";
            }
            else
            {
                state = "stopped";
            }
            
            if ( prevstate != state )
            {
                self setscriptablepartstate( "flag", state );
            }
            
            if ( speedsquared < 1 && vehicle_occupancy::function_6e6afd819ebbe705( self ).size == 0 )
            {
                break;
            }
            
            wait 0.1;
        }
    }
}

/#

    // Namespace vehicle_code
    // Params 0
    // Checksum 0x7c1fc81b, Offset: 0x4e66
    // Size: 0x390, Type: dev
    function init_vehicle_spawn_devgui()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        wait 5;
        setdvarifuninitialized( @"scr_vehiclefriendlydamage", 0 );
        setdvarifuninitialized( @"hash_e422b8f9cc30c4bb", 0 );
        setdvarifuninitialized( @"hash_7ca94be708b6afcf", 0 );
        devgui::function_9082edeb5db93280( "<dev string:x466>" );
        
        foreach ( vehicleref in utility::alphabetize( vehicle::function_75acd2d48a8f3605( 0 ) ) )
        {
            data = vehicle::get_data( vehicleref );
            
            if ( data.var_1a9fc8dddc15c33 )
            {
                if ( !isdefined( level.var_b96db0666a9817b1 ) )
                {
                    category = "<dev string:x479>";
                    devgui::add_devgui_command( category + vehicleref + "<dev string:x48d>", "<dev string:x497>" + vehicleref, 1 );
                    devgui::add_devgui_command( category + vehicleref + "<dev string:x4b8>", "<dev string:x4c4>" + vehicleref, 2 );
                }
                
                continue;
            }
            
            category = "<dev string:x4e7>";
            
            if ( data.canfly )
            {
                category = "<dev string:x4f9>";
            }
            else if ( data.isboat )
            {
                category = "<dev string:x50a>";
            }
            
            if ( isstartstr( data.ref, "<dev string:x51d>" ) )
            {
                category += "<dev string:x525>";
            }
            else if ( isstartstr( data.ref, "<dev string:x52c>" ) )
            {
                category += "<dev string:x537>";
            }
            else if ( isstartstr( data.ref, "<dev string:x53f>" ) )
            {
                category += "<dev string:x54a>";
            }
            else if ( isstartstr( data.ref, "<dev string:x552>" ) )
            {
                category += "<dev string:x55d>";
            }
            else if ( isstartstr( data.ref, "<dev string:x565>" ) )
            {
                category += "<dev string:x570>";
            }
            
            devgui::add_devgui_command( category + vehicleref + "<dev string:x48d>", "<dev string:x578>" + vehicleref, 1 );
            devgui::add_devgui_command( category + vehicleref + "<dev string:x4b8>", "<dev string:x593>" + vehicleref, 2 );
            devgui::add_devgui_command( category + vehicleref + "<dev string:x5b0>", "<dev string:x497>" + vehicleref, 3 );
            devgui::add_devgui_command( category + vehicleref + "<dev string:x5c6>", "<dev string:x4c4>" + vehicleref, 4 );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:x5de>" );
        devgui::add_devgui_command( "<dev string:x601>", "<dev string:x616>" );
        devgui::add_devgui_command( "<dev string:x638>", "<dev string:x64e>" );
        devgui::add_devgui_command( "<dev string:x670>", "<dev string:x688>" );
        devgui::add_devgui_command( "<dev string:x6aa>", "<dev string:x6c3>" );
        devgui::add_devgui_command( "<dev string:x6e5>", "<dev string:x6fc>" );
        devgui::add_devgui_command( "<dev string:x71e>", "<dev string:x738>" );
        devgui::add_devgui_command( "<dev string:x75c>", "<dev string:x777>" );
        devgui::add_devgui_command( "<dev string:x79b>", "<dev string:x7b3>" );
        devgui::add_devgui_command( "<dev string:x7d4>", "<dev string:x7ec>" );
        devgui::add_devgui_command( "<dev string:x80d>", "<dev string:x825>" );
        devgui::add_devgui_command( "<dev string:x846>", "<dev string:x85e>" );
        devgui::add_devgui_command( "<dev string:x87f>", "<dev string:x897>" );
        devgui::add_devgui_command( "<dev string:x8b8>", "<dev string:x8d0>" );
        devgui::function_77df7fe7dd273e10();
        level thread function_2c6dd6aadcae44d8();
    }

    // Namespace vehicle_code
    // Params 0, eflags: 0x4
    // Checksum 0x884f836a, Offset: 0x51fe
    // Size: 0x6dd, Type: dev
    function private function_2c6dd6aadcae44d8()
    {
        while ( true )
        {
            vehicleref = getdvar( @"scr_spawnvehicle", "<dev string:x8f1>" );
            
            if ( vehicleref != "<dev string:x8f1>" )
            {
                player = level.players[ 0 ];
                
                if ( isdefined( player ) )
                {
                    if ( vehicle_airdrop::can_airdrop( vehicleref ) )
                    {
                        spawndata = spawnstruct();
                        spawndata.origin = player.origin + ( 0, 0, 100 );
                        spawndata.angles = player.angles * ( 0, 1, 0 );
                        spawndata.spawntype = "<dev string:x8f5>";
                        level.var_53ee440e883f18de = level vehicle_airdrop::vehicle_airdrop( vehicleref, spawndata );
                    }
                    else
                    {
                        if ( player vehicle::function_502f53b13c796577( 1 ) && getdvarint( @"hash_8af4302fef6d5e56" ) )
                        {
                            player.vehicle.dontspawnhusk = 1;
                            vehicle::death( player.vehicle );
                        }
                        
                        level.var_53ee440e883f18de = player thread vehicle::function_69fd088e96b07e30( vehicleref );
                    }
                }
                
                setdevdvar( @"scr_spawnvehicle", "<dev string:x8f1>" );
            }
            
            host = function_711615b269dcc3c();
            
            if ( !isdefined( host ) )
            {
                waitframe();
                continue;
            }
            
            forward = anglestoforward( host.angles );
            vehicleref = getdvar( @"hash_6a4bdbee44239d75", "<dev string:x8f1>" );
            
            if ( vehicleref != "<dev string:x8f1>" )
            {
                setdevdvar( @"hash_6a4bdbee44239d75", "<dev string:x8f1>" );
                spawnposition = host.origin + ( 0, 0, 100 ) + forward * 300;
                spawnangles = host.angles * ( 0, 1, 0 );
                vehicle = undefined;
                seatid = undefined;
                spawndata = spawnstruct();
                spawndata.origin = spawnposition;
                spawndata.angles = spawnangles;
                spawndata.spawntype = "<dev string:x8f5>";
                [ vehicle, seatid ] = vehicle::function_48833bc196a87e8c( vehicleref, spawndata );
                level.var_53ee440e883f18de = vehicle;
                
                if ( getdvarint( @"hash_19956db1f58cf7c", 0 ) == 1 )
                {
                    vehicle function_edc1329b6c257a41( spawnposition, forward );
                }
                else
                {
                    vehicle addcomponent( "<dev string:x8ff>" );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x906>", 1 );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x915>", 1 );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x92c>", 300 );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x93d>", 1 );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x953>", 0.5 );
                    vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x967>", 4 );
                }
                
                vehicle vehicle_turnengineon();
                
                if ( !isdefined( level.devvehicles ) )
                {
                    level.devvehicles = [ vehicle ];
                }
                else
                {
                    level.devvehicles[ level.devvehicles.size ] = vehicle;
                }
            }
            
            drivedvar = getdvarint( @"hash_b48b64507c871c18", 0 );
            
            if ( isdefined( level.devvehicles ) && drivedvar )
            {
                setdevdvar( @"hash_b48b64507c871c18", 0 );
                
                foreach ( vehicle in level.devvehicles )
                {
                    switch ( drivedvar )
                    {
                        case 2:
                            if ( vehicle.vehiclename == "<dev string:x97d>" || vehicle.vehiclename == "<dev string:x98c>" )
                            {
                                break;
                            }
                            
                            direction = vectornormalize( vehicle.origin - host.origin );
                            endpoint = direction * 3000 + vehicle.origin;
                            vehicle thread vehicle_ai::function_1a6c0d0264fdd63c( vehicle.origin, endpoint, 300 );
                            break;
                        case 1:
                            if ( vehicle.vehiclename == "<dev string:x97d>" || vehicle.vehiclename == "<dev string:x98c>" )
                            {
                                break;
                            }
                            
                            direction = vectornormalize( host.origin - vehicle.origin );
                            endpoint = direction * -300 + host.origin;
                            vehicle thread vehicle_ai::function_1a6c0d0264fdd63c( vehicle.origin, endpoint, 300 );
                            break;
                        case 3:
                            vehicle notify( "<dev string:x99e>" );
                            vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x9ae>", 0 );
                            vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x906>", 1 );
                            vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x9bd>", vehicle.origin );
                            vehicle stoppath();
                            vehicle vehicle_setspeedimmediate( 0, 1, 1 );
                            vehicle vehicle_cleardrivingstate();
                            break;
                        default:
                            break;
                    }
                }
            }
            
            destroydvar = getdvar( @"hash_aba9a0c99545e4f6", "<dev string:x8f1>" );
            
            if ( destroydvar != "<dev string:x8f1>" && isdefined( level.devvehicles ) )
            {
                setdevdvar( @"hash_aba9a0c99545e4f6", "<dev string:x8f1>" );
                
                foreach ( index, vehicle in level.devvehicles )
                {
                    if ( vehicle.vehiclename == destroydvar )
                    {
                        level.devvehicles[ index ] = undefined;
                        vehicle notify( "<dev string:x99e>" );
                        vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x9ae>", 0 );
                        vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x906>", 1 );
                        vehicle setconfigvalue( "<dev string:x8ff>", "<dev string:x9bd>", vehicle.origin );
                        vehicle stoppath();
                        vehicle vehicle_setspeedimmediate( 0, 1, 1 );
                        vehicle vehicle_cleardrivingstate();
                        break;
                    }
                }
                
                setdvar( @"hash_37b6962333b896f9", destroydvar );
            }
            
            waitframe();
        }
    }

    // Namespace vehicle_code
    // Params 0, eflags: 0x4
    // Checksum 0x4a371391, Offset: 0x58e3
    // Size: 0xc1, Type: dev
    function private function_711615b269dcc3c()
    {
        if ( !isdefined( level.players ) )
        {
            return undefined;
        }
        
        hostplayer = undefined;
        
        foreach ( player in level.players )
        {
            if ( isplayer( player ) && player utility::callsharedfunc( #"player", #"ishost" ) )
            {
                hostplayer = player;
                break;
            }
        }
        
        return hostplayer;
    }

    // Namespace vehicle_code
    // Params 0
    // Checksum 0xa50af010, Offset: 0x59ac
    // Size: 0x225, Type: dev
    function init_vehicle_spawner_devgui()
    {
        setdvarifuninitialized( @"hash_e73c951b937ce2c2", "<dev string:x8f1>" );
        var_337d4e7b01c3603a = function_e102ffad881bafe9();
        ground_vehicles = [];
        water_vehicles = [];
        air_vehicles = [];
        
        if ( isdefined( var_337d4e7b01c3603a ) )
        {
            foreach ( var_c63888efdaddcd6e in var_337d4e7b01c3603a )
            {
                if ( isdefined( var_c63888efdaddcd6e.type ) && isdefined( var_c63888efdaddcd6e.model ) )
                {
                    if ( var_c63888efdaddcd6e.type == "<dev string:x9ca>" )
                    {
                        ground_vehicles[ ground_vehicles.size ] = var_c63888efdaddcd6e;
                        continue;
                    }
                    
                    if ( var_c63888efdaddcd6e.type == "<dev string:x9d4>" )
                    {
                        water_vehicles[ water_vehicles.size ] = var_c63888efdaddcd6e;
                        continue;
                    }
                    
                    if ( var_c63888efdaddcd6e.type == "<dev string:x9dd>" )
                    {
                        air_vehicles[ air_vehicles.size ] = var_c63888efdaddcd6e;
                    }
                }
            }
        }
        
        devgui::function_9082edeb5db93280( "<dev string:x9e4>" );
        
        for ( index = 0; index < ground_vehicles.size ; index++ )
        {
            vehicletype = getxhashsourcename( ground_vehicles[ index ].vehicletype );
            devgui::function_cd4e263c1f3018ae( vehicletype, "<dev string:xa08>" + vehicletype, &function_33a8d9cc076a760 );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:xa2c>" );
        
        for ( index = 0; index < water_vehicles.size ; index++ )
        {
            vehicletype = getxhashsourcename( water_vehicles[ index ].vehicletype );
            devgui::function_cd4e263c1f3018ae( vehicletype, "<dev string:xa08>" + vehicletype, &function_33a8d9cc076a760 );
        }
        
        devgui::function_77df7fe7dd273e10();
        devgui::function_9082edeb5db93280( "<dev string:xa4f>" );
        
        for ( index = 0; index < air_vehicles.size ; index++ )
        {
            vehicletype = getxhashsourcename( air_vehicles[ index ].vehicletype );
            devgui::function_cd4e263c1f3018ae( vehicletype, "<dev string:xa08>" + vehicletype, &function_33a8d9cc076a760 );
        }
        
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace vehicle_code
    // Params 2
    // Checksum 0x47b35ecd, Offset: 0x5bd9
    // Size: 0x14c, Type: dev
    function function_edc1329b6c257a41( spawnposition, forward )
    {
        if ( getdvarint( @"hash_19956db1f58cf7c", 0 ) == 1 )
        {
            vehicle = self;
            var_658b3c60f55be51c = 1500 + 1000 * getdvarint( @"hash_6f7d4369d136d19a", 0 );
            vehicle.var_fe235c34c3ed8888 = spawnposition;
            vehicle.var_778ef4f53292ff6e = vehicle.origin + anglestoforward( vehicle.angles ) * var_658b3c60f55be51c;
            vehicle.distancetogoal = 50;
            vehicle.var_89739d842134105c = utility::mph_to_ips( vehicle vehicle_gettopspeedforward() );
            
            if ( vehicle vehicle::ishelicopter() )
            {
                vehicle.var_fe235c34c3ed8888 = vehicle.var_fe235c34c3ed8888 + ( 0, 100, 0 ) + forward * 300;
                vehicle.var_778ef4f53292ff6e = vehicle.var_778ef4f53292ff6e + ( 0, 100, 0 ) + forward * 300;
                vehicle.distancetogoal = 5000;
                vehicle.var_89739d842134105c /= 2;
            }
            
            vehicle thread function_3f67fe231df1c8af();
        }
    }

    // Namespace vehicle_code
    // Params 0
    // Checksum 0xbe2e00af, Offset: 0x5d2d
    // Size: 0xeb, Type: dev
    function function_33d2567fd2cf0336()
    {
        vehicletype = getdvar( @"hash_e73c951b937ce2c2", "<dev string:x8f1>" );
        
        if ( vehicletype != "<dev string:x8f1>" )
        {
            player = level.players[ 0 ];
            
            if ( !isdefined( player ) )
            {
                return;
            }
            
            forward = anglestoforward( player.angles );
            spawnposition = player.origin + ( 0, 0, 100 ) + forward * 300;
            spawnangles = player.angles * ( 0, 1, 0 );
            vehicle = spawnvehicle( undefined, "<dev string:xa70>", vehicletype, spawnposition, spawnangles );
            
            if ( !isdefined( vehicle.interactdata ) )
            {
                vehicle makeusable();
            }
            
            vehicle function_edc1329b6c257a41( spawnposition, forward );
        }
    }

    // Namespace vehicle_code
    // Params 1
    // Checksum 0xb385036c, Offset: 0x5e20
    // Size: 0x42, Type: dev
    function function_33a8d9cc076a760( param )
    {
        vehicletype = param[ 0 ];
        setdvar( @"hash_e73c951b937ce2c2", vehicletype );
        iprintln( "<dev string:xa87>" + vehicletype );
        function_33d2567fd2cf0336();
    }

    // Namespace vehicle_code
    // Params 0
    // Checksum 0x203a6964, Offset: 0x5e6a
    // Size: 0x165, Type: dev
    function function_3f67fe231df1c8af()
    {
        targetposition = self.var_fe235c34c3ed8888;
        self endon( "<dev string:xaa5>" );
        
        while ( true )
        {
            if ( !self hascomponent( "<dev string:x8ff>" ) )
            {
                if ( targetposition == self.var_fe235c34c3ed8888 )
                {
                    targetposition = self.var_778ef4f53292ff6e;
                }
                else
                {
                    targetposition = self.var_fe235c34c3ed8888;
                }
                
                println( "<dev string:xaae>" + targetposition );
                var_c5331c6576c90dfe = getdvarint( @"hash_fd46728789917a5", 0 ) == 1;
                self addcomponent( "<dev string:x8ff>" );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:x906>", 1 );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:xac2>", 0 );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:x9bd>", targetposition );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:x9ae>", self.var_89739d842134105c );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:xad0>", var_c5331c6576c90dfe );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:x92c>", 25 );
                self setconfigvalue( "<dev string:x8ff>", "<dev string:xae8>", 0.5 );
            }
            else
            {
                if ( distance2dsquared( self.origin, targetposition ) <= self.distancetogoal )
                {
                    self removecomponent( "<dev string:x8ff>" );
                }
                
                println( "<dev string:xb00>" + distance2dsquared( self.origin, targetposition ) );
            }
            
            waitframe();
        }
    }

#/
