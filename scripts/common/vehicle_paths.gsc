#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_ai;
#using scripts\common\vehicle_aianim;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_lights;
#using scripts\common\vehicle_roads;
#using scripts\engine\flags;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace vehicle_paths;

// Namespace vehicle_paths
// Params 12
// Checksum 0x4d2a45b5, Offset: 0x53e
// Size: 0x1cb
function function_53e592e2d38c05ca( checkstuck = 0, brakeatgoal = 1, autonormal = 1, brakeongoalgasbrake = 1, goalthreshold = 100, throttlespeedclose = 0, throttlespeedthreshold = 1, var_f04cadb28ee6016d = 1, throttlespeedfarbelow = 0, throttlespeedfarabove = 0, gastostopmovement = 0.9, steeringmultiplier = 2 )
{
    if ( !self hascomponent( "p2p" ) )
    {
        self addcomponent( "p2p" );
    }
    
    self function_eb88c4e66edbc855( "p2p", "checkStuck", checkstuck );
    self function_eb88c4e66edbc855( "p2p", "brakeAtGoal", brakeatgoal );
    self function_eb88c4e66edbc855( "p2p", "automaticNormal", autonormal );
    self function_eb88c4e66edbc855( "p2p", "brakeOnGoalGasbrake", brakeongoalgasbrake );
    self function_eb88c4e66edbc855( "p2p", "goalThreshold", goalthreshold );
    self function_eb88c4e66edbc855( "p2p", "throttleSpeedClose", throttlespeedclose );
    self function_eb88c4e66edbc855( "p2p", "throttleSpeedThreshold", throttlespeedthreshold );
    self function_eb88c4e66edbc855( "p2p", "automaticFastTopspeedFraction", var_f04cadb28ee6016d );
    self function_eb88c4e66edbc855( "p2p", "throttleSpeedFarBelow", throttlespeedfarbelow );
    self function_eb88c4e66edbc855( "p2p", "throttleSpeedFarAbove", throttlespeedfarabove );
    self function_eb88c4e66edbc855( "p2p", "gasToStopMovement", gastostopmovement );
    self function_eb88c4e66edbc855( "p2p", "steeringMultiplier", steeringmultiplier );
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x8e99d4f4, Offset: 0x711
// Size: 0x1b
function function_6080e3e7e4316b48()
{
    if ( !self hascomponent( "c2p" ) )
    {
        self addcomponent( "c2p" );
    }
}

// Namespace vehicle_paths
// Params 3
// Checksum 0xbf31ce39, Offset: 0x734
// Size: 0xaf
function function_44b075692bd28f39( stepradius = 300, stepspeedfactor = 2, usemanualspeed )
{
    if ( !self hascomponent( "path" ) )
    {
        self addcomponent( "path" );
    }
    
    var_9d84d0368e2af60d = self hascomponent( "c2p" );
    self.pathtype = "path_radiant";
    self function_eb88c4e66edbc855( "path", "radiusToStep", stepradius );
    self function_eb88c4e66edbc855( "path", "stepSpeedFactor", stepspeedfactor );
    self function_eb88c4e66edbc855( "path", "useManualSpeed", !var_9d84d0368e2af60d );
    self.stopping = 0;
}

// Namespace vehicle_paths
// Params 6
// Checksum 0x7dc10d53, Offset: 0x7eb
// Size: 0x1fc
function function_dc471bcc9cda9df( node, looped, tau = 0.23, usemanualspeeds = 1, yawhelper = 0, brakeatgoalonendnode = 1 )
{
    if ( !self hascomponent( "path" ) )
    {
        self addcomponent( "path" );
    }
    
    self.pathtype = "path_catmullrom";
    spline_id = 0;
    
    if ( isarray( level.vehicle.var_235af58a8cf6d697 ) && isstruct( level.vehicle.var_235af58a8cf6d697[ node.targetname ] ) )
    {
        spline_id = level.vehicle.var_235af58a8cf6d697[ node.targetname ];
    }
    else
    {
        var_d4b32d94b070889b = [];
        notetimes = [];
        curnode = node;
        
        while ( isdefined( curnode ) )
        {
            var_d4b32d94b070889b[ var_d4b32d94b070889b.size ] = curnode.origin;
            notetimes[ notetimes.size ] = 10;
            
            if ( isstring( curnode.target ) )
            {
                curnode = getvehiclenode( curnode.target, #targetname );
                continue;
            }
            
            break;
        }
        
        spline_id = function_53253e8ea222ed60( var_d4b32d94b070889b, notetimes, istrue( looped ), tau );
        
        if ( isarray( level.vehicle.var_235af58a8cf6d697 ) )
        {
            level.vehicle.var_235af58a8cf6d697[ node.targetname ] = spline_id;
        }
    }
    
    self.var_38380e8b9b984716 = spline_id;
    self function_eb88c4e66edbc855( "path", "useManualSpeed", usemanualspeeds );
    self function_eb88c4e66edbc855( "path", "yawHelper", yawhelper );
    self function_eb88c4e66edbc855( "path", "setBrakeAtGoalOnEndNode", brakeatgoalonendnode );
}

// Namespace vehicle_paths
// Params 1
// Checksum 0x76261cf7, Offset: 0x9ef
// Size: 0xff
function function_2af4522b1fc2bcc9( var_9f701152d59c1d85 )
{
    if ( !isdefined( self.pathtype ) )
    {
        /#
            iprintlnbold( "<dev string:x24>" );
        #/
        
        return;
    }
    
    if ( self hascomponent( "p2p" ) )
    {
        self function_eb88c4e66edbc855( "p2p", "resume", 1 );
    }
    
    if ( self.pathtype == "path_radiant" )
    {
        index = isstring( var_9f701152d59c1d85 ) ? getvehiclenodeindex( var_9f701152d59c1d85, #targetname ) : var_9f701152d59c1d85.index;
        assert( isdefined( index ), "<dev string:x73>" );
        self function_eb88c4e66edbc855( "path", "radiantId", index );
        
        if ( self function_24e10bf6894fa869( "path", "pause" ) )
        {
            self function_eb88c4e66edbc855( "path", "resume", 1 );
        }
        
        return;
    }
    
    if ( self.pathtype == "path_catmullrom" )
    {
        self function_eb88c4e66edbc855( "path", "catmullRomId", self.var_38380e8b9b984716 );
    }
}

// Namespace vehicle_paths
// Params 1
// Checksum 0x5defa847, Offset: 0xaf6
// Size: 0x99
function gopath( vehicle )
{
    if ( !isdefined( vehicle ) )
    {
        vehicle = self;
        assert( self.code_classname == "<dev string:x9e>", "<dev string:xb0>" );
    }
    
    vehicle endon( "death" );
    
    if ( isdefined( vehicle.hasstarted ) )
    {
        println( "<dev string:xd7>" );
        return;
    }
    else
    {
        vehicle.hasstarted = 1;
    }
    
    vehicle utility::script_delay();
    vehicle notify( "start_vehiclepath" );
    
    if ( vehicle vehicle::ishelicopter() )
    {
        vehicle notify( "start_dynamicpath" );
        return;
    }
    
    vehicle startpath();
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x1014c125, Offset: 0xb97
// Size: 0x3e
function _vehicle_paths( node, var_ad6ef44930971fe1, var_1f8d7b4146f4fe75 )
{
    if ( vehicle::ishelicopter() )
    {
        vehicle_paths_helicopter( node, var_ad6ef44930971fe1, var_1f8d7b4146f4fe75 );
        return;
    }
    
    vehicle_paths_non_heli( node );
}

// Namespace vehicle_paths
// Params 1
// Checksum 0x2e327cac, Offset: 0xbdd
// Size: 0x2ae
function trigger_process_node( node )
{
    if ( node.script_flag_set )
    {
        utility::flag_set( node.script_flag_set );
    }
    
    if ( node.script_flag_clear )
    {
        utility::flag_clear( node.script_flag_clear );
    }
    
    if ( node.script_prefab_exploder )
    {
        node.script_exploder = node.script_prefab_exploder;
        node.script_prefab_exploder = undefined;
    }
    
    if ( node.script_exploder )
    {
        delay = node.script_exploder_delay;
        
        if ( isdefined( delay ) )
        {
            level utility::delaythread( delay, &utility::exploder, node.script_exploder );
        }
        else
        {
            level utility::exploder( node.script_exploder );
        }
    }
    
    if ( node.script_flag_set )
    {
        utility::flag_set( node.script_flag_set );
    }
    
    if ( node.script_ent_flag_set )
    {
        utility::ent_flag_set( node.script_ent_flag_set );
    }
    
    if ( node.script_ent_flag_clear )
    {
        utility::ent_flag_clear( node.script_ent_flag_clear );
    }
    
    if ( node.script_flag_clear )
    {
        utility::flag_clear( node.script_flag_clear );
    }
    
    if ( node.script_noteworthy )
    {
        if ( node.script_noteworthy == "deleteme" )
        {
            if ( vehicle::function_df978a2fa3318bbd() )
            {
                self.dontspawnhusk = 1;
                thread vehicle::death( self );
                return;
            }
            else if ( isdefined( self.deathfunc ) )
            {
                vehicle_ai::delete_riders();
                level thread [[ self.deathfunc ]]( self );
                return;
            }
            else
            {
                vehicle_ai::delete_riders();
                self delete();
                return;
            }
        }
        else if ( node.script_noteworthy == "engineoff" )
        {
            self vehicle_turnengineoff();
            self notify( "engineoff" );
        }
        else
        {
            self notify( node.script_noteworthy );
            self notify( "noteworthy", node.script_noteworthy );
        }
    }
    
    if ( node.arrivedcallback )
    {
        [[ node.arrivedcallback ]]();
    }
    
    if ( node.script_badplace )
    {
        self.script_badplace = node.script_badplace;
    }
    
    if ( node.script_turretmg )
    {
        if ( node.script_turretmg )
        {
            vehicle_code::_mgon();
        }
        else
        {
            vehicle_code::_mgoff();
        }
    }
    
    if ( node.script_turretmain )
    {
        if ( node.script_turretmain )
        {
            vehicle_code::_mainturreton();
            return;
        }
        
        vehicle_code::_mainturretoff();
    }
}

// Namespace vehicle_paths
// Params 0
// Checksum 0xd3ad0f13, Offset: 0xe93
// Size: 0x19
function delete_riders()
{
    assertmsg( "<dev string:x111>" );
    vehicle_ai::delete_riders();
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xcf265abc, Offset: 0xeb4
// Size: 0x57, Type: bool
function islastnode( node )
{
    if ( !isdefined( node.target ) )
    {
        return true;
    }
    
    if ( !isdefined( getvehiclenode( node.target, #targetname ) ) && !isdefined( vehicle_code::get_vehiclenode_any_dynamic( node.target ) ) )
    {
        return true;
    }
    
    return false;
}

// Namespace vehicle_paths
// Params 2
// Checksum 0xe773be19, Offset: 0xf14
// Size: 0x80, Type: bool
function vehicle_should_unload( wait_func, nextpoint )
{
    if ( isdefined( nextpoint.script_unload ) )
    {
        return true;
    }
    
    if ( wait_func != &node_wait )
    {
        return false;
    }
    
    if ( self.dontunloadonend )
    {
        return false;
    }
    
    if ( self.vehicletype == "empty" || self.vehicletype == "empty_heli" )
    {
        return false;
    }
    
    if ( islastnode( nextpoint ) )
    {
        return !self.script_vehicle_selfremove;
    }
    
    return false;
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xb94ecf15, Offset: 0xf9d
// Size: 0x79
function overshoot_next_node( vnode )
{
    /#
        if ( !isdefined( vnode ) )
        {
            return;
        }
        
        self endon( "<dev string:x16a>" );
        vnode waittillmatch( "<dev string:x17a>", self );
        println( "<dev string:x185>" );
        println( "<dev string:x1e1>" );
        println( "<dev string:x185>" );
        println( "<dev string:x23d>" + vnode.origin + "<dev string:x26d>" );
        println( "<dev string:x291>" );
        println( "<dev string:x185>" );
    #/
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x9180d20a, Offset: 0x101e
// Size: 0xe8
function vehicle_resumepathvehicle()
{
    if ( !vehicle::ishelicopter() )
    {
        self resumespeed( 35 );
        return;
    }
    
    node = undefined;
    
    if ( isdefined( self.currentnode.target ) && !isdefined( self.currentnode.exit_node ) )
    {
        if ( isstruct( self.currentnode.target ) )
        {
            node = self.currentnode.target;
        }
        else if ( isarray( self.currentnode.target ) )
        {
            node = utility::random( self.currentnode.target );
        }
        else
        {
            node = vehicle_code::get_vehiclenode_any_dynamic( self.currentnode.target );
        }
    }
    
    if ( !isdefined( node ) )
    {
        return;
    }
    
    _vehicle_paths( node );
}

// Namespace vehicle_paths
// Params 1
// Checksum 0x20aafcbd, Offset: 0x110e
// Size: 0xf5
function get_path_getfunc( pathpoint )
{
    get_func = &vehicle_code::get_from_vehicle_node;
    
    if ( self.usenavmesh )
    {
        get_func = &vehicle_roads::function_8fe66e18c5435268;
    }
    else if ( isstruct( pathpoint.target ) )
    {
        get_func = &vehicle_code::function_b6c635d769164cf1;
    }
    else if ( isarray( pathpoint.target ) )
    {
        get_func = &function_f535f086527bcb5c;
    }
    else if ( vehicle::ishelicopter() && pathpoint.target )
    {
        if ( isdefined( vehicle_code::get_from_entity( pathpoint ) ) )
        {
            get_func = &vehicle_code::get_from_entity;
        }
        
        if ( isdefined( vehicle_code::get_from_spawnstruct( pathpoint ) ) )
        {
            get_func = &vehicle_code::get_from_spawnstruct;
        }
    }
    else if ( !utility::issp() && pathpoint.target )
    {
        if ( isdefined( vehicle_code::get_from_spawnstruct( pathpoint ) ) )
        {
            get_func = &vehicle_code::get_from_spawnstruct;
        }
    }
    else if ( isdefined( self.var_6218299ee5f410dd ) )
    {
        get_func = self.var_6218299ee5f410dd;
    }
    
    return get_func;
}

// Namespace vehicle_paths
// Params 2, eflags: 0x4
// Checksum 0x622ee1ae, Offset: 0x120c
// Size: 0x97
function private get_nextpoint( get_func, point )
{
    if ( isstring( self.veh_pathdir ) && self.veh_pathdir == "reverse" )
    {
        return point.prevpoint;
    }
    else if ( !point.target )
    {
        return undefined;
    }
    
    next_point = [[ get_func ]]( point );
    
    if ( !isdefined( next_point ) && get_func != &vehicle_roads::function_8fe66e18c5435268 )
    {
        assertmsg( "<dev string:x2ec>" + point.origin );
    }
    
    return next_point;
}

// Namespace vehicle_paths
// Params 3
// Checksum 0xd6aa5181, Offset: 0x12ac
// Size: 0xa4
function struct_wait( nextpoint, lastpoint, dist_sq )
{
    if ( !isdefined( lastpoint ) )
    {
        lastpoint = nextpoint;
    }
    
    wait 0.05;
    
    if ( lastpoint.speed >= 0 )
    {
        self vehicledriveto( nextpoint.origin, int( lastpoint.speed ) );
        
        while ( distancesquared( self.origin, nextpoint.origin ) > dist_sq )
        {
            wait 0.1;
        }
        
        return;
    }
    
    if ( lastpoint.speed < 0 )
    {
        self vehicle_setspeedimmediate( 0, 15, 15 );
    }
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x15cf32c9, Offset: 0x1358
// Size: 0x96
function node_wait( nextpoint, lastpoint, get_func )
{
    if ( isdefined( self.unique_id ) )
    {
        nodeflag = "node_flag_triggered" + self.unique_id;
    }
    else
    {
        nodeflag = "node_flag_triggered";
    }
    
    nodes_flag_triggered( nodeflag, nextpoint, get_func );
    
    if ( self.attachedpath == nextpoint )
    {
        self notify( "node_wait_terminated" );
        waittillframeend();
        return;
    }
    
    nextpoint utility::ent_flag_wait_vehicle_node( nodeflag );
    nextpoint utility::ent_flag_clear( nodeflag, 1 );
    nextpoint notify( "processed_node" + nodeflag );
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x8244d83, Offset: 0x13f6
// Size: 0x66
function nodes_flag_triggered( nodeflag, nextpoint, get_func )
{
    count = 0;
    
    while ( isdefined( nextpoint ) && count < 3 )
    {
        count++;
        thread node_flag_triggered( nodeflag, nextpoint );
        
        if ( !isdefined( nextpoint.target ) )
        {
            return;
        }
        
        nextpoint = get_nextpoint( get_func, nextpoint );
    }
}

// Namespace vehicle_paths
// Params 2
// Checksum 0xf386e069, Offset: 0x1464
// Size: 0x70
function node_flag_triggered( nodeflag, node )
{
    if ( node utility::ent_flag_exist( nodeflag ) )
    {
        return;
    }
    
    node utility::ent_flag_init( nodeflag );
    thread node_flag_triggered_cleanup( node, nodeflag );
    node endon( "processed_node" + nodeflag );
    self endon( "death" );
    self endon( "newpath" );
    self endon( "node_wait_terminated" );
    node waittillmatch( "trigger", self );
    node utility::ent_flag_set( nodeflag );
}

// Namespace vehicle_paths
// Params 2
// Checksum 0xc0324753, Offset: 0x14dc
// Size: 0x43
function node_flag_triggered_cleanup( node, nodeflag )
{
    node endon( "processed_node" + nodeflag );
    utility::waittill_any( "death", "newpath", "node_wait_terminated" );
    node utility::ent_flag_clear( nodeflag, 1 );
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xecce596f, Offset: 0x1527
// Size: 0x7fc
function vehicle_paths_non_heli( node )
{
    assert( isdefined( node ) || isdefined( self.attachedpath ), "<dev string:x343>" );
    self notify( "newpath" );
    
    if ( isdefined( node ) )
    {
        self.attachedpath = node;
    }
    
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    
    if ( !isdefined( pathstart ) )
    {
        return;
    }
    
    self endon( "newpath" );
    self endon( "death" );
    pathpoint = pathstart;
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc( pathstart );
    dist_sq = 40000;
    
    if ( self.usenavmesh && self.navobstacleid )
    {
        vehicle_code::vehicle_disable_navobstacles();
        waitframe();
    }
    
    while ( isdefined( nextpoint ) )
    {
        if ( self.usenavmesh )
        {
            vehicle_roads::navmesh_wait( nextpoint );
        }
        else if ( !isstruct( nextpoint ) )
        {
            node_wait( nextpoint, lastpoint, get_func );
        }
        else
        {
            struct_wait( nextpoint, lastpoint, dist_sq );
        }
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        trigger_process_node( nextpoint );
        self.currentnode = nextpoint;
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isdefined( nextpoint.script_team ) )
        {
            self.script_team = nextpoint.script_team;
        }
        
        if ( isdefined( nextpoint.script_turningdir ) )
        {
            self notify( "turning", nextpoint.script_turningdir );
        }
        
        if ( isdefined( nextpoint.script_deathroll ) )
        {
            if ( nextpoint.script_deathroll == 0 )
            {
                thread vehicle_code::deathrolloff();
            }
            else
            {
                thread vehicle_code::deathrollon();
            }
        }
        
        if ( isdefined( nextpoint.script_wheeldirection ) )
        {
            vehicle_code::vehicle_setwheeldirection( nextpoint.script_wheeldirection );
        }
        
        if ( vehicle_should_unload( &node_wait, nextpoint ) )
        {
            if ( islastnode( nextpoint ) )
            {
                thread unload_node( nextpoint );
            }
            else
            {
                unload_node( nextpoint );
            }
        }
        
        if ( isdefined( nextpoint.script_transmission ) )
        {
            self.veh_transmission = nextpoint.script_transmission;
            
            if ( self.veh_transmission == "forward" )
            {
                vehicle_code::vehicle_setwheeldirection( 1 );
            }
            else
            {
                vehicle_code::vehicle_setwheeldirection( 0 );
            }
        }
        
        if ( isdefined( nextpoint.script_pathdir ) )
        {
            self.veh_pathdir = nextpoint.script_pathdir;
            vehicle::function_51906bc4fc51948( nextpoint.script_pathdir );
        }
        
        if ( isdefined( nextpoint.script_brake ) )
        {
            self.veh_brake = nextpoint.script_brake;
            
            if ( self vehicle_isphysveh() )
            {
                self vehphys_parkingbrake( 1 );
            }
        }
        
        if ( isdefined( nextpoint.script_pathtype ) )
        {
            self.veh_pathtype = nextpoint.script_pathtype;
        }
        
        if ( isdefined( nextpoint.script_speed ) || isdefined( nextpoint.speed ) )
        {
            accel = undefined;
            
            if ( isdefined( nextpoint.script_accel ) )
            {
                accel = nextpoint.script_accel;
            }
            
            decel = undefined;
            
            if ( isdefined( nextpoint.script_decel ) )
            {
                decel = nextpoint.script_decel;
            }
            
            if ( self vehicle_isphysveh() && !utility::ent_flag( "vehicle_paths_scripted_speed" ) )
            {
                vehicle::function_698648338e3e7b6d( nextpoint.script_speed ?? nextpoint.speed * 0.056818, accel, decel );
            }
        }
        
        if ( isdefined( nextpoint.script_ent_flag_wait ) && !utility::ent_flag( nextpoint.script_ent_flag_wait ) )
        {
            stopped_msg = "script_ent_flag_wait_" + nextpoint.script_ent_flag_wait;
            vehicle_stop( nextpoint, stopped_msg, get_func );
            utility::ent_flag_wait( nextpoint.script_ent_flag_wait );
            
            if ( !isdefined( self ) )
            {
                return;
            }
            
            accel = 60;
            
            if ( isdefined( nextpoint.script_accel ) )
            {
                accel = nextpoint.script_accel;
            }
            
            self notify( "resumed_path" );
            _vehicle_resume_named( stopped_msg );
        }
        
        if ( isdefined( nextpoint.script_delay ) )
        {
            stopped_msg = "script_delay_" + nextpoint.script_delay;
            vehicle_stop( nextpoint, stopped_msg, get_func );
            nextpoint utility::script_delay();
            self notify( "delay_passed" );
            accel = 60;
            
            if ( isdefined( nextpoint.script_accel ) )
            {
                accel = nextpoint.script_accel;
            }
            
            self notify( "resumed_path" );
            _vehicle_resume_named( stopped_msg );
        }
        
        if ( isdefined( nextpoint.script_flag_wait ) || isdefined( nextpoint.script_flag_waitopen ) )
        {
            was_stopped = 0;
            var_52ea4d23844bb252 = isdefined( nextpoint.script_flag_wait ) && !utility::flag( nextpoint.script_flag_wait );
            var_e47e24cbe714049a = isdefined( nextpoint.script_flag_waitopen ) && utility::flag( nextpoint.script_flag_waitopen );
            stopped_msg = undefined;
            
            if ( var_52ea4d23844bb252 || var_e47e24cbe714049a || isdefined( nextpoint.script_delay_post ) )
            {
                was_stopped = 1;
                
                if ( var_52ea4d23844bb252 )
                {
                    stopped_msg = "script_flag_wait_" + nextpoint.script_flag_wait;
                }
                else if ( var_e47e24cbe714049a )
                {
                    stopped_msg = "script_flag_waitopen_" + nextpoint.script_flag_waitopen;
                }
                else if ( isdefined( nextpoint.script_flag_wait ) )
                {
                    stopped_msg = "script_delay_post_" + nextpoint.script_flag_wait;
                }
                else
                {
                    stopped_msg = "script_delay_post_" + nextpoint.script_flag_waitopen;
                }
                
                vehicle_stop( nextpoint, stopped_msg, get_func );
            }
            
            if ( var_52ea4d23844bb252 )
            {
                utility::flag_wait( nextpoint.script_flag_wait );
            }
            
            if ( var_e47e24cbe714049a )
            {
                utility::flag_waitopen( nextpoint.script_flag_waitopen );
            }
            
            if ( !isdefined( self ) )
            {
                return;
            }
            
            if ( isdefined( nextpoint.script_delay_post ) )
            {
                wait nextpoint.script_delay_post;
                
                if ( !isdefined( self ) )
                {
                    return;
                }
            }
            
            accel = 10;
            
            if ( isdefined( nextpoint.script_accel ) )
            {
                accel = nextpoint.script_accel;
            }
            
            if ( was_stopped )
            {
                self notify( "resumed_path" );
                _vehicle_resume_named( stopped_msg );
            }
            
            self notify( "delay_passed" );
        }
        
        if ( isdefined( self.set_lookat_point ) )
        {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_off ) )
        {
            thread vehicle_lights::lights_off( nextpoint.script_vehicle_lights_off );
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_on ) )
        {
            thread vehicle_lights::lights_on( nextpoint.script_vehicle_lights_on );
        }
        
        if ( isdefined( nextpoint.script_forcecolor ) )
        {
            thread utility::script_func( "forcecolor_riders", nextpoint.script_forcecolor );
        }
        
        lastpoint = nextpoint;
        nextpoint = get_nextpoint( get_func, nextpoint );
        
        if ( !isdefined( nextpoint ) )
        {
            nextpoint = lastpoint;
            break;
        }
        
        if ( !isstring( self.veh_pathdir ) || self.veh_pathdir == "forward" )
        {
            nextpoint.prevpoint = lastpoint;
        }
    }
    
    if ( self vehicle_isphysveh() && self.var_75ea1b9acbb56f2a )
    {
        starttime = gettime();
        
        while ( true )
        {
            if ( distance2dsquared( lastpoint.origin, self.origin ) < 10000 )
            {
                break;
            }
            else if ( gettime() - starttime > 5000 )
            {
                break;
            }
            
            waitframe();
        }
        
        vehicle::function_698648338e3e7b6d( 0 );
        
        if ( self.usenavmesh && self hascomponent( "path" ) )
        {
            self setconfigvalue( "path", "pause", 1 );
        }
    }
    
    self notify( "reached_dynamic_path_end" );
    
    if ( isdefined( self.script_vehicle_selfremove ) )
    {
        if ( isdefined( self.deathfunc ) )
        {
            vehicle_ai::delete_riders();
            level thread [[ self.deathfunc ]]( self );
            return;
        }
        
        vehicle_ai::delete_riders();
        self delete();
    }
}

// Namespace vehicle_paths
// Params 3
// Checksum 0xa4bfee39, Offset: 0x1d2b
// Size: 0x8d
function vehicle_stop( nextpoint, stopped_msg, get_func )
{
    accel = nextpoint.script_accel ?? 5;
    decel = nextpoint.script_decel ?? 20;
    _vehicle_stop_named( stopped_msg, accel, decel );
    childthread vehicle_notifyonstop();
    
    if ( get_func )
    {
        next_nextpoint = get_nextpoint( get_func, nextpoint );
        
        if ( isdefined( next_nextpoint ) )
        {
            childthread overshoot_next_node( next_nextpoint );
        }
    }
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x9366afe8, Offset: 0x1dc0
// Size: 0x20
function vehicle_notifyonstop()
{
    self endon( "resumed_path" );
    
    while ( !vehicle_code::vehicle_is_stopped() )
    {
        waitframe();
    }
    
    self notify( "stopped_path" );
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x1665b566, Offset: 0x1de8
// Size: 0x10
function vehicle_waittill_stopped()
{
    while ( !vehicle_code::vehicle_is_stopped() )
    {
        waitframe();
    }
}

// Namespace vehicle_paths
// Params 2
// Checksum 0xc736e455, Offset: 0x1e00
// Size: 0x24
function add_z( vec, zplus )
{
    return ( vec[ 0 ], vec[ 1 ], vec[ 2 ] + zplus );
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x13f4ba6f, Offset: 0x1e2d
// Size: 0x4b7
function vehicle_paths_helicopter( node, var_ad6ef44930971fe1, var_1f8d7b4146f4fe75 )
{
    if ( self vehicle_isphysveh() )
    {
        if ( self hascomponent( "p2p" ) )
        {
            function_4e87486ece806fb1( node );
            return;
        }
        else if ( getdvarint( @"hash_31333fbc83a5058f" ) == 0 )
        {
            println( "<dev string:x36b>" );
            return;
        }
    }
    
    assert( isdefined( node ) || isdefined( self.attachedpath ), "<dev string:x343>" );
    self notify( "newpath" );
    self endon( "newpath" );
    self endon( "death" );
    
    if ( !isdefined( var_ad6ef44930971fe1 ) )
    {
        var_ad6ef44930971fe1 = 0;
    }
    
    if ( isdefined( node ) )
    {
        self.attachedpath = node;
    }
    
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    
    if ( !isdefined( pathstart ) )
    {
        return;
    }
    
    if ( var_ad6ef44930971fe1 )
    {
        self waittill( "start_dynamicpath" );
    }
    
    if ( isdefined( var_1f8d7b4146f4fe75 ) )
    {
        elevated_node = spawnstruct();
        elevated_node.origin = add_z( self.origin, var_1f8d7b4146f4fe75 );
        heli_wait_node( elevated_node, undefined );
    }
    
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc( pathstart );
    
    while ( isdefined( nextpoint ) )
    {
        if ( isdefined( nextpoint.script_linkto ) )
        {
            vehicle_code::set_lookat_from_dest( nextpoint );
        }
        
        if ( isdefined( nextpoint.script_land ) )
        {
            hasnextpoint = 0;
            
            if ( isdefined( nextpoint.target ) )
            {
                hasnextpoint = isdefined( [[ get_func ]]( nextpoint ) );
            }
            
            if ( !vehicle::function_df978a2fa3318bbd() )
            {
                thread vehicle_code::vehicle_landanims( nextpoint.script_unload, hasnextpoint );
            }
        }
        
        if ( !isdefined( lastpoint ) )
        {
            if ( isdefined( self.var_1a16f2e24487f947 ) )
            {
                lastpoint = self.var_1a16f2e24487f947;
            }
        }
        
        if ( isdefined( nextpoint.script_land ) && utility::issharedfuncdefined( #"helicopter", #"hash_a3ce13418d47712d" ) )
        {
            thread utility::callsharedfunc( #"helicopter", #"hash_a3ce13418d47712d", nextpoint.origin );
        }
        
        heli_wait_node( nextpoint, lastpoint, var_1f8d7b4146f4fe75 );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        self.currentnode = nextpoint;
        nextpoint notify( "trigger", self );
        
        if ( isdefined( nextpoint.script_helimove ) )
        {
            self setyawspeedbyname( nextpoint.script_helimove );
            
            if ( nextpoint.script_helimove == "faster" )
            {
                self setmaxpitchroll( 25, 50 );
            }
        }
        
        trigger_process_node( nextpoint );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isdefined( nextpoint.script_team ) )
        {
            self.script_team = nextpoint.script_team;
        }
        
        if ( vehicle_should_unload( &heli_wait_node, nextpoint ) )
        {
            unload_node( nextpoint );
        }
        
        if ( self vehicle_isphysveh() )
        {
            if ( isdefined( nextpoint.script_pathtype ) )
            {
                self.veh_pathtype = nextpoint.script_pathtype;
            }
        }
        
        var_4bc864ba4959433f = 0;
        
        if ( isdefined( nextpoint.script_flag_wait ) )
        {
            var_4bc864ba4959433f = 1;
            utility::flag_wait( nextpoint.script_flag_wait );
        }
        
        if ( isdefined( nextpoint.script_flag_waitopen ) )
        {
            var_4bc864ba4959433f = 1;
            utility::flag_waitopen( nextpoint.script_flag_waitopen );
        }
        
        if ( isdefined( nextpoint.script_ent_flag_wait ) )
        {
            var_4bc864ba4959433f = 1;
            utility::ent_flag_wait( nextpoint.script_ent_flag_wait );
        }
        
        if ( var_4bc864ba4959433f )
        {
            if ( isdefined( nextpoint.script_delay_post ) )
            {
                wait nextpoint.script_delay_post;
            }
            
            self notify( "delay_passed" );
        }
        
        if ( isdefined( self.set_lookat_point ) )
        {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_off ) )
        {
            thread vehicle_lights::lights_off( nextpoint.script_vehicle_lights_off );
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_on ) )
        {
            thread vehicle_lights::lights_on( nextpoint.script_vehicle_lights_on );
        }
        
        if ( isdefined( nextpoint.script_forcecolor ) )
        {
            thread utility::script_func( "forcecolor_riders", nextpoint.script_forcecolor );
        }
        
        lastpoint = nextpoint;
        
        if ( !isdefined( nextpoint.target ) )
        {
            break;
        }
        
        nextpoint = [[ get_func ]]( nextpoint );
        
        if ( !isdefined( nextpoint ) )
        {
            nextpoint = lastpoint;
            assertmsg( "<dev string:x2ec>" + lastpoint.origin );
            break;
        }
    }
    
    self notify( "reached_dynamic_path_end" );
    
    if ( isdefined( self.script_vehicle_selfremove ) )
    {
        vehicle_ai::delete_riders();
        
        if ( isdefined( self.deathfunc ) )
        {
            level thread [[ self.deathfunc ]]( self );
            return;
        }
        
        self delete();
    }
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x2a70b4cc, Offset: 0x22ec
// Size: 0x6f3
function heli_wait_node( nextpoint, lastpoint, var_1f8d7b4146f4fe75 )
{
    self endon( "newpath" );
    self endon( "cancel_heli_wait_node" );
    origin = nextpoint.origin;
    angles = nextpoint.angles;
    
    if ( isdefined( nextpoint.script_unload ) || isdefined( nextpoint.script_land ) )
    {
        unloadoffset = 0;
        
        if ( isdefined( nextpoint.script_land ) )
        {
            utility::ent_flag_set( "landed" );
            
            if ( isdefined( self.unload_land_offset ) )
            {
                unloadoffset = self.unload_land_offset;
            }
        }
        else if ( isdefined( nextpoint.script_unload ) && isdefined( self.unload_hover_offset ) )
        {
            unloadoffset = self.unload_hover_offset;
        }
        else if ( isdefined( nextpoint.script_unload ) && isdefined( self.unload_hover_offset_max ) )
        {
            groundorg = utility::drop_to_ground( origin, undefined, undefined, undefined, trace::create_world_contents() );
            unloadoffset = origin[ 2 ] - groundorg[ 2 ];
            
            if ( unloadoffset >= self.unload_hover_offset_max )
            {
                unloadoffset = self.unload_hover_offset_max;
            }
            else if ( unloadoffset < self.unload_hover_land_height )
            {
                unloadoffset = self.unload_hover_land_height;
            }
        }
        
        nextpoint.radius = 2;
        
        if ( vehicle_ai::function_a21181ac3f485eeb() )
        {
            animation = vehicle_ai::function_1f72bceb8e93b361();
            
            if ( !isdefined( self.scenenode ) )
            {
                self.scenenode = { #angles:angles, #origin:utility::drop_to_ground( origin, 100, -10000, undefined, trace::create_world_contents() ) };
            }
            
            if ( !isdefined( self.scenenode.angles ) )
            {
                self.scenenode.angles = ( 0, 0, 0 );
            }
            
            origin = getstartorigin( self.scenenode.origin, self.scenenode.angles, animation );
            angles = getstartangles( self.scenenode.origin, self.scenenode.angles, animation );
            nextpoint.radius = vehicle_ai::function_3f791d10e984b5fc();
        }
        else if ( isdefined( nextpoint.ground_pos ) )
        {
            origin = nextpoint.ground_pos + ( 0, 0, unloadoffset );
        }
        else
        {
            neworg = utility::groundpos( origin ) + ( 0, 0, unloadoffset );
            
            if ( neworg[ 2 ] > origin[ 2 ] - 2000 )
            {
                origin = utility::groundpos( origin ) + ( 0, 0, unloadoffset );
            }
        }
        
        self sethoverparams( 0, 0, 0 );
    }
    
    if ( isdefined( lastpoint ) )
    {
        airresistance = lastpoint.script_airresistance;
        
        if ( isdefined( airresistance ) )
        {
            airresistance = float( airresistance );
        }
        
        speed = lastpoint.speed;
        accel = lastpoint.script_accel;
        decel = lastpoint.script_decel;
    }
    else
    {
        airresistance = undefined;
        speed = undefined;
        accel = undefined;
        decel = undefined;
    }
    
    stopnode = istrue( nextpoint.script_stopnode );
    unload = isdefined( nextpoint.script_unload );
    flag_wait = isdefined( nextpoint.script_flag_wait ) && !utility::flag( nextpoint.script_flag_wait );
    flag_wait = flag_wait || isdefined( nextpoint.script_flag_waitopen ) && utility::flag( nextpoint.script_flag_waitopen );
    flag_wait = flag_wait || isdefined( nextpoint.script_ent_flag_wait ) && utility::ent_flag( nextpoint.script_ent_flag_wait );
    var_5bdcdba698716361 = !isdefined( nextpoint.target );
    hasdelay = isdefined( nextpoint.script_delay );
    
    if ( isdefined( angles ) )
    {
        yaw = angles[ 1 ];
    }
    else
    {
        yaw = 0;
    }
    
    if ( self.health <= 0 )
    {
        return;
    }
    
    if ( isdefined( var_1f8d7b4146f4fe75 ) )
    {
        origin = add_z( origin, var_1f8d7b4146f4fe75 );
    }
    
    if ( isdefined( self.heliheightoverride ) )
    {
        origin = ( origin[ 0 ], origin[ 1 ], self.heliheightoverride );
    }
    
    self vehicle_helisetai( origin, speed, accel, decel, nextpoint.script_goalyaw, nextpoint.script_anglevehicle, yaw, airresistance, hasdelay, stopnode, unload, flag_wait, var_5bdcdba698716361 );
    
    if ( utility::issp() )
    {
        radius = nextpoint.radius;
    }
    else
    {
        radius = ( nextpoint.radius ?? ( nextpoint.speed ?? 60 ) * 6 ) + 200;
    }
    
    /#
        if ( getdvarint( @"hash_3c165272d6d3919", 0 ) )
        {
            start_pos = lastpoint.origin ?? self.origin;
            end_pos = origin;
            debug::line( start_pos, end_pos, undefined, 20, "<dev string:x3bc>" );
            last_radius = lastpoint.radius ?? 10;
            debug::sphere( start_pos, last_radius, ( 0, 1, 0 ), 20, "<dev string:x3bc>" );
            goal_color = stopnode || var_5bdcdba698716361 || unload || hasdelay || flag_wait ? ( 1, 0, 0 ) : ( 0, 1, 0 );
            debug::sphere( origin, radius, goal_color, 20, "<dev string:x3bc>" );
            
            if ( nextpoint.origin != origin )
            {
                debug::sphere( nextpoint.origin, radius, goal_color, 20, "<dev string:x3bc>" );
            }
        }
    #/
    
    if ( isdefined( radius ) )
    {
        self setneargoalnotifydist( radius );
        assert( radius > 0, "<dev string:x3dc>" + radius );
        utility::waittill_any( "near_goal", "goal" );
    }
    else
    {
        self waittill( "goal" );
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    trigger_process_node( nextpoint );
    
    /#
        if ( isdefined( nextpoint.script_flag_set ) )
        {
            self notify( "<dev string:x3e8>", nextpoint, nextpoint.script_flag_set );
        }
        else
        {
            self notify( "<dev string:x3e8>", nextpoint );
        }
        
        if ( getdvarint( @"hash_3c165272d6d3919", 0 ) )
        {
            level notify( "<dev string:x3bc>" );
        }
    #/
    
    if ( isdefined( nextpoint.script_firelink ) )
    {
        if ( !isdefined( level.helicopter_firelinkfunk ) )
        {
            assertmsg( "<dev string:x400>" );
        }
        
        thread [[ level.helicopter_firelinkfunk ]]( nextpoint );
    }
    
    nextpoint utility::script_delay();
    
    if ( isdefined( self.path_gobbler ) )
    {
        utility::deletestruct_ref( nextpoint );
    }
    
    self notify( "continuepath" );
}

// Namespace vehicle_paths
// Params 2
// Checksum 0x1a6ce43a, Offset: 0x29e7
// Size: 0x326
function function_4e87486ece806fb1( node, var_f886d81feaa5fab6 )
{
    assert( isdefined( node ) || isdefined( self.attachedpath ), "<dev string:x44d>" );
    self notify( "newpath" );
    self endon( "newpath" );
    self endon( "death" );
    
    if ( isdefined( node ) )
    {
        self.attachedpath = node;
    }
    
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    
    if ( !isdefined( pathstart ) )
    {
        return;
    }
    
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc( pathstart );
    
    while ( isdefined( nextpoint ) )
    {
        if ( !isdefined( lastpoint ) )
        {
            if ( isdefined( self.var_1a16f2e24487f947 ) )
            {
                lastpoint = self.var_1a16f2e24487f947;
            }
        }
        
        function_222f50fae01a745a( nextpoint, lastpoint, var_f886d81feaa5fab6 );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        self.currentnode = nextpoint;
        nextpoint notify( "trigger", self );
        
        if ( isdefined( nextpoint.script_helimove ) )
        {
            self setyawspeedbyname( nextpoint.script_helimove );
            
            if ( nextpoint.script_helimove == "faster" )
            {
                self setmaxpitchroll( 25, 50 );
            }
        }
        
        trigger_process_node( nextpoint );
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( isdefined( nextpoint.script_team ) )
        {
            self.script_team = nextpoint.script_team;
        }
        
        if ( self vehicle_isphysveh() )
        {
            if ( isdefined( nextpoint.script_pathtype ) )
            {
                self.veh_pathtype = nextpoint.script_pathtype;
            }
        }
        
        var_4bc864ba4959433f = 0;
        
        if ( isdefined( nextpoint.script_flag_wait ) )
        {
            var_4bc864ba4959433f = 1;
            utility::flag_wait( nextpoint.script_flag_wait );
        }
        
        if ( isdefined( nextpoint.script_flag_waitopen ) )
        {
            var_4bc864ba4959433f = 1;
            utility::flag_waitopen( nextpoint.script_flag_waitopen );
        }
        
        if ( var_4bc864ba4959433f )
        {
            if ( isdefined( nextpoint.script_delay_post ) )
            {
                wait nextpoint.script_delay_post;
            }
            
            self notify( "delay_passed" );
        }
        
        if ( isdefined( self.set_lookat_point ) )
        {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_off ) )
        {
            thread vehicle_lights::lights_off( nextpoint.script_vehicle_lights_off );
        }
        
        if ( isdefined( nextpoint.script_vehicle_lights_on ) )
        {
            thread vehicle_lights::lights_on( nextpoint.script_vehicle_lights_on );
        }
        
        if ( isdefined( nextpoint.script_forcecolor ) )
        {
            thread utility::script_func( "forcecolor_riders", nextpoint.script_forcecolor );
        }
        
        lastpoint = nextpoint;
        
        if ( !isdefined( nextpoint.target ) )
        {
            break;
        }
        
        nextpoint = [[ get_func ]]( nextpoint );
        
        if ( !isdefined( nextpoint ) )
        {
            nextpoint = lastpoint;
            assertmsg( "<dev string:x2ec>" + lastpoint.origin );
            break;
        }
    }
    
    self notify( "reached_dynamic_path_end" );
    
    if ( isdefined( self.script_vehicle_selfremove ) )
    {
        vehicle_ai::delete_riders();
        
        if ( isdefined( self.deathfunc ) )
        {
            level thread [[ self.deathfunc ]]( self );
            return;
        }
        
        self delete();
    }
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x75763a75, Offset: 0x2d15
// Size: 0x2ec
function function_222f50fae01a745a( nextpoint, lastpoint, var_f886d81feaa5fab6 )
{
    self endon( "newpath" );
    
    if ( isdefined( nextpoint.script_unload ) || isdefined( nextpoint.script_land ) )
    {
        assertmsg( "<dev string:x489>" );
    }
    
    if ( isdefined( lastpoint ) )
    {
        airresistance = lastpoint.script_airresistance;
        speed = lastpoint.speed;
        accel = lastpoint.script_accel;
        decel = lastpoint.script_decel;
    }
    else
    {
        airresistance = undefined;
        speed = undefined;
        accel = undefined;
        decel = undefined;
    }
    
    stopnode = istrue( nextpoint.script_stopnode );
    unload = isdefined( nextpoint.script_unload );
    flag_wait = isdefined( nextpoint.script_flag_wait ) && !utility::flag( nextpoint.script_flag_wait );
    flag_wait = flag_wait || isdefined( nextpoint.script_flag_waitopen ) && utility::flag( nextpoint.script_flag_waitopen );
    var_5bdcdba698716361 = !isdefined( nextpoint.target );
    hasdelay = isdefined( nextpoint.script_delay );
    yaw = 0;
    
    if ( isdefined( nextpoint.angles ) )
    {
        yaw = nextpoint.angles[ 1 ];
    }
    
    if ( self.health <= 0 )
    {
        return;
    }
    
    origin = nextpoint.origin;
    
    if ( isdefined( nextpoint.radius ) )
    {
        assert( nextpoint.radius > 0, "<dev string:x3dc>" + nextpoint.radius );
        self setconfigvalue( "p2p", "goalThreshold", nextpoint.radius );
    }
    
    if ( isdefined( var_f886d81feaa5fab6 ) )
    {
        origin = add_z( origin, var_f886d81feaa5fab6 );
    }
    
    self setconfigvalue( "p2p", "goalPoint", origin );
    self setconfigvalue( "p2p", "goalAngles", ( 0, yaw, 0 ) );
    self waittill( "near_goal" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    trigger_process_node( nextpoint );
    
    /#
        if ( isdefined( nextpoint.script_flag_set ) )
        {
            self notify( "<dev string:x3e8>", nextpoint, nextpoint.script_flag_set );
        }
        else
        {
            self notify( "<dev string:x3e8>", nextpoint );
        }
    #/
    
    if ( isdefined( nextpoint.script_firelink ) )
    {
        if ( !isdefined( level.helicopter_firelinkfunk ) )
        {
            assertmsg( "<dev string:x400>" );
        }
        
        thread [[ level.helicopter_firelinkfunk ]]( nextpoint );
    }
    
    nextpoint utility::script_delay();
    
    if ( isdefined( self.path_gobbler ) )
    {
        utility::deletestruct_ref( nextpoint );
    }
    
    self notify( "continuepath" );
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x4ae39c28, Offset: 0x3009
// Size: 0x100
function get_pathstruct()
{
    structs = utility::getstructarray( self.target, "targetname" );
    assert( structs.size != 0, "<dev string:x4c1>" + self.origin + "<dev string:x4d0>" );
    
    if ( structs.size == 1 )
    {
        return structs[ 0 ];
    }
    
    filtered = [];
    
    foreach ( struct in structs )
    {
        if ( !isdefined( struct.script_demeanor ) )
        {
            filtered[ filtered.size ] = struct;
        }
    }
    
    assert( filtered.size == 1, "<dev string:x4c1>" + self.origin + "<dev string:x4ee>" );
    return filtered[ 0 ];
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xa783eb4, Offset: 0x3112
// Size: 0x229
function getonpath( skip_attach )
{
    path_start = undefined;
    type = self.vehicletype;
    
    if ( isdefined( self.vehicle_spawner ) && self.vehicle_spawner.dontgetonpath )
    {
        return;
    }
    
    if ( isdefined( self.spawndata ) && self.spawndata.dontgetonpath )
    {
        return;
    }
    
    if ( isdefined( self.target ) )
    {
        path_start = getvehiclenode( self.target, #targetname );
        
        /#
            if ( vehicle::ishelicopter() && isdefined( path_start ) )
            {
                println( "<dev string:x52a>" + path_start.targetname );
                println( "<dev string:x54a>" + getxhashsourcename( self.vehicletype ) );
                assertmsg( "<dev string:x55b>" );
            }
        #/
        
        if ( !isdefined( path_start ) )
        {
            path_start = utility::getstruct( self.target, "targetname" );
        }
    }
    
    if ( !isdefined( path_start ) )
    {
        if ( vehicle::ishelicopter() )
        {
            self vehicle_setspeed( 60, 20, 10 );
        }
        
        return;
    }
    
    self.attachedpath = path_start;
    
    if ( !vehicle::ishelicopter() && !isstruct( path_start ) )
    {
        self.origin = path_start.origin;
        
        if ( !isdefined( skip_attach ) )
        {
            self attachpath( path_start );
        }
    }
    else if ( isdefined( self.speed ) )
    {
        self vehicle_setspeedimmediate( self.speed, 20 );
    }
    else if ( isdefined( path_start.speed ) )
    {
        accel = 20;
        decel = 10;
        
        if ( isdefined( path_start.script_accel ) )
        {
            accel = path_start.script_accel;
        }
        
        if ( isdefined( path_start.script_decel ) )
        {
            accel = path_start.script_decel;
        }
        
        speedfloat = float( path_start.speed );
        self vehicle_setspeedimmediate( speedfloat, accel, decel );
    }
    else
    {
        self vehicle_setspeed( 60, 20, 10 );
    }
    
    thread _vehicle_paths( undefined, vehicle::ishelicopter() );
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xe84e4ded, Offset: 0x3343
// Size: 0xc5
function _vehicle_resume_named( stop_name )
{
    if ( utility::issharedfuncdefined( #"vehicle", #"vehicle_resume" ) )
    {
        utility::callsharedfunc( #"vehicle", #"vehicle_resume", stop_name );
        return;
    }
    
    resume_speed = self.vehicle_stop_named[ stop_name ];
    self.vehicle_stop_named[ stop_name ] = undefined;
    
    if ( self.vehicle_stop_named.size )
    {
        return;
    }
    
    if ( self hascomponent( "path" ) )
    {
        self setconfigvalue( "path", "resume", 1 );
    }
    
    if ( self hascomponent( "p2p" ) )
    {
        self setconfigvalue( "p2p", "manualSpeed", resume_speed * 17.6 );
        return;
    }
    
    vehicle::function_25f904e1dc108b0( resume_speed );
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x1812db, Offset: 0x3410
// Size: 0x11b
function _vehicle_stop_named( stop_name, acceleration, deceleration )
{
    if ( utility::issharedfuncdefined( #"vehicle", #"vehicle_stop" ) )
    {
        utility::callsharedfunc( #"vehicle", #"vehicle_stop", stop_name, acceleration, deceleration );
        return;
    }
    
    if ( !isdefined( self.vehicle_stop_named ) )
    {
        self.vehicle_stop_named = [];
    }
    
    assert( !isdefined( self.vehicle_stop_named[ stop_name ] ), "<dev string:x591>" );
    
    if ( self hascomponent( "p2p" ) )
    {
        self.vehicle_stop_named[ stop_name ] = self function_24e10bf6894fa869( "p2p", "manualSpeed" ) * 0.056818;
    }
    else if ( self hascomponent( "c2p" ) )
    {
        self.vehicle_stop_named[ stop_name ] = self function_24e10bf6894fa869( "path", "targetSpeed" ) * 0.056818;
    }
    else
    {
        self.vehicle_stop_named[ stop_name ] = acceleration;
    }
    
    vehicle::function_698648338e3e7b6d( 0, acceleration, deceleration );
    
    if ( self hascomponent( "c2p" ) )
    {
        thread function_c817bde167e99ca6();
    }
}

// Namespace vehicle_paths
// Params 0, eflags: 0xc
// Checksum 0x2fd05b5e, Offset: 0x3533
// Size: 0x47
function private function_c817bde167e99ca6()
{
    self notify( "95c09dd9a1796a4d" );
    self endon( "95c09dd9a1796a4d" );
    self endon( "resumed_path" );
    
    while ( !vehicle_code::vehicle_is_stopped() )
    {
        waitframe();
    }
    
    if ( self hascomponent( "path" ) )
    {
        self setconfigvalue( "path", "pause", 1 );
    }
}

// Namespace vehicle_paths
// Params 1
// Checksum 0x20013565, Offset: 0x3582
// Size: 0x3e3
function unload_node( node )
{
    self endon( "death" );
    ishelicopter = vehicle::ishelicopter();
    var_45ed96868035eded = !ishelicopter && !islastnode( node );
    utility::ent_flag_set( "unload_node" );
    
    if ( isdefined( node.targetname ) )
    {
        pathnode = getnode( node.targetname, #target );
        
        if ( isdefined( pathnode ) && self.riders.size )
        {
            foreach ( rider in self.riders )
            {
                if ( isai( rider ) )
                {
                    rider thread utility::script_func( "go_to_node", pathnode );
                }
            }
        }
    }
    
    if ( ishelicopter )
    {
        if ( vehicle_ai::function_a21181ac3f485eeb() )
        {
            self function_d2b8ee2e1275daaf( 1 );
            animation = vehicle_ai::function_1f72bceb8e93b361();
            origin = getstartorigin( self.scenenode.origin, self.scenenode.angles, animation );
            angles = getstartangles( self.scenenode.origin, self.scenenode.angles, animation );
            startorigin = self.origin;
            startangles = self.angles;
            speed = max( vehicle_ai::function_a17e8d27cb11154c(), utility::mph_to_ips( self vehicle_getspeed() ) );
            dist = distance( startorigin, origin );
            time = min( 3, dist / speed );
            currenttime = 0;
            
            while ( currenttime < time )
            {
                self vehicle_teleport( vectorlerp( startorigin, origin, currenttime / time ), anglelerpquatfrac( startangles, angles, currenttime / time ), 1 );
                currenttime += level.framedurationseconds;
                waitframe();
            }
        }
        else
        {
            self sethoverparams( 0, 0, 0 );
            vehicle_code::waittill_stable( node );
        }
    }
    else if ( var_45ed96868035eded )
    {
        accel = 5;
        decel = 20;
        stop_msg = "unloading_" + gettime();
        _vehicle_stop_named( stop_msg, accel, decel );
        childthread vehicle_notifyonstop();
    }
    
    if ( node.script_noteworthy == "wait_for_flag" )
    {
        utility::flag_wait( node.script_flag );
    }
    
    if ( isdefined( node.script_unload ) )
    {
        if ( node.script_unload == "1" )
        {
            node.script_unload = "default";
        }
    }
    
    var_9a90df07a9fe1a03 = vehicle_aianim::function_b7200b981d41e212( node.script_unload );
    script_unload = vehicle_ai::get_unload_group( node.script_unload );
    
    if ( script_unload == "moving" && vehicle::function_df978a2fa3318bbd() )
    {
        vehicle_ai::unload( 0, undefined, "moving" );
    }
    else
    {
        var_9a90df07a9fe1a03 = vehicle_code::_vehicle_unload( script_unload );
    }
    
    if ( vehicle_aianim::riders_unloadable( node.script_unload ) )
    {
        self waittill( "unloaded" );
    }
    
    if ( isdefined( node.script_flag_wait ) || isdefined( node.script_flag_waitopen ) || isdefined( node.script_delay ) )
    {
        return var_9a90df07a9fe1a03;
    }
    
    if ( var_45ed96868035eded )
    {
        self notify( "resumed_path" );
        _vehicle_resume_named( stop_msg );
    }
    
    utility::ent_flag_clear( "unload_node" );
    return var_9a90df07a9fe1a03;
}

// Namespace vehicle_paths
// Params 1
// Checksum 0xf533b92b, Offset: 0x396e
// Size: 0x88
function function_f535f086527bcb5c( node )
{
    if ( node.target.size == 1 )
    {
        return node.target[ 0 ];
    }
    
    if ( isdefined( node.target[ self.choices[ node.unique_id ] ] ) )
    {
        return node.target[ self.choices[ node.unique_id ] ];
    }
    
    return utility::random( node.target );
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x3f4c887d, Offset: 0x39fe
// Size: 0xcd, Type: bool
function function_fbae94e5f76ceeff()
{
    if ( !isdefined( self.script_unload ) )
    {
        self.script_unload = "default";
    }
    
    foreach ( root_node in function_49a1aee62245084() )
    {
        root_node function_e8bcb2225f1b8f0e( [] );
    }
    
    return isdefined( self.target ) && !arraycompare( self.target, [ self ] ) && !arraycompare( self.rootnodes, [ self ] );
}

// Namespace vehicle_paths
// Params 0, eflags: 0x4
// Checksum 0xc0fd527d, Offset: 0x3ad4
// Size: 0x136
function private function_49a1aee62245084()
{
    var_7237854e3be197ca = self.rootnodes;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    if ( isdefined( self.targetname ) )
    {
        prev = utility::getstructarray( self.targetname, "target" );
        
        if ( prev.size == 0 )
        {
            assertmsg( "<dev string:x5b4>" + self.origin );
            self.rootnodes = [ self ];
            return self.rootnodes;
        }
        
        roots = [];
        
        foreach ( struct in prev )
        {
            roots = arraycombineunique( roots, struct function_49a1aee62245084() );
        }
        
        self.rootnodes = roots;
        return self.rootnodes;
    }
    
    self.rootnodes = [ self ];
    return self.rootnodes;
}

// Namespace vehicle_paths
// Params 1, eflags: 0x4
// Checksum 0xaa6264fa, Offset: 0x3c12
// Size: 0x17e
function private function_e8bcb2225f1b8f0e( choices )
{
    isunload = isdefined( self.script_unload );
    
    if ( isunload )
    {
        if ( !isdefined( self.choices ) )
        {
            self.choices = [];
        }
        
        if ( !isdefined( self.ground_pos ) )
        {
            self.ground_pos = utility::groundpos( self.origin );
        }
        
        choices = function_c6c06162c8e6ae75( self.choices, choices );
        self.choices = choices;
    }
    
    var_978a6ddd4227c5d6 = 0;
    
    if ( isstring( self.target ) )
    {
        self.target = utility::getstructarray( self.target, "targetname" );
        var_978a6ddd4227c5d6 = self.target.size > 1 && !isunload;
        
        if ( var_978a6ddd4227c5d6 && !isdefined( self.unique_id ) )
        {
            flags::assign_unique_id();
        }
    }
    
    if ( isdefined( self.target ) )
    {
        foreach ( index, next in self.target )
        {
            if ( var_978a6ddd4227c5d6 )
            {
                choices[ self.unique_id ] = index;
            }
            
            next function_e8bcb2225f1b8f0e( choices );
        }
    }
}

// Namespace vehicle_paths
// Params 0
// Checksum 0xe2280225, Offset: 0x3d98
// Size: 0x88
function function_ce159681d679b75e()
{
    if ( isdefined( self.rootnodes ) )
    {
        foreach ( node in self.rootnodes )
        {
            node function_668194c122139323();
        }
    }
}

// Namespace vehicle_paths
// Params 0, eflags: 0x4
// Checksum 0xce157ca, Offset: 0x3e28
// Size: 0xd1
function private function_668194c122139323()
{
    self.targetname = undefined;
    self.var_c58c73b693c2719b = undefined;
    rootnodes = self.rootnodes;
    
    if ( !isdefined( self.script_unload ) )
    {
        self.rootnodes = undefined;
        self.script_poi = undefined;
    }
    
    if ( isdefined( self.target ) )
    {
        foreach ( node in self.target )
        {
            node function_668194c122139323();
        }
    }
}

/#

    // Namespace vehicle_paths
    // Params 1
    // Checksum 0xae1386cd, Offset: 0x3f01
    // Size: 0x155, Type: dev
    function function_596216f58c3ed542( duration )
    {
        if ( !isdefined( duration ) )
        {
            duration = 100000;
        }
        
        if ( isdefined( self.rootnodes ) )
        {
            foreach ( node in self.rootnodes )
            {
                sphere( node.origin, 300, ( 0, 1, 0 ), 1, duration );
                print3d( node.origin + ( 0, 0, 150 ), "<dev string:x632>", ( 1, 1, 1 ), 1, 2, duration, 1 );
                print3d( node.origin + ( 0, 0, 100 ), "<dev string:x640>" + node.origin, ( 1, 1, 1 ), 1, 2, duration, 1 );
                node function_584f61b8bbf3b638( isdefined( node.script_unload ), duration );
            }
        }
    }

    // Namespace vehicle_paths
    // Params 2, eflags: 0x4
    // Checksum 0x85dd02fa, Offset: 0x405e
    // Size: 0x499, Type: dev
    function private function_584f61b8bbf3b638( is_exit, duration )
    {
        utility::draw_angles( self.angles, self.origin, undefined, duration, 100 );
        
        if ( isdefined( self.target ) )
        {
            foreach ( node in self.target )
            {
                line( self.origin, node.origin, is_exit ? ( 1, 0, 0 ) : ( 0, 1, 0 ), 1, 1, duration );
                
                if ( isdefined( node.script_unload ) )
                {
                    sphere( node.origin, 300, ( 0, 0, 1 ), 1, duration );
                    unload = node.script_unload == "<dev string:x64c>" || node.script_unload == "<dev string:x651>" ? "<dev string:x65c>" : node.script_unload;
                    print3d( node.origin, "<dev string:x663>" + unload, ( 1, 1, 1 ), 1, 2, duration, 1 );
                    
                    if ( node.script_vehiclerefs )
                    {
                        print3d( node.origin + ( 0, 0, 50 ), "<dev string:x676>" + node.script_vehiclerefs, ( 1, 1, 1 ), 1, 2, duration, 1 );
                    }
                    else if ( node.script_vehiclebundle )
                    {
                        print3d( node.origin + ( 0, 0, 50 ), "<dev string:x68e>" + getxhashsourcename( node.script_vehiclebundle ), ( 1, 1, 1 ), 1, 2, duration, 1 );
                    }
                    else
                    {
                        print3d( node.origin + ( 0, 0, 50 ), "<dev string:x6a8>" + ( node.script_vehicleref ?? "<dev string:x6bf>" ), ( 1, 1, 1 ), 1, 2, duration, 1 );
                    }
                    
                    print3d( node.origin + ( 0, 0, 100 ), "<dev string:x640>" + node.origin, ( 1, 1, 1 ), 1, 2, duration, 1 );
                    print3d( node.origin + ( 0, 0, 150 ), "<dev string:x6cc>", ( 1, 1, 1 ), 1, 2, duration, 1 );
                }
                
                if ( isdefined( node.radius ) )
                {
                    print3d( node.origin - ( 0, 0, 50 ), "<dev string:x3dc>" + node.radius, ( 1, 1, 1 ), 1, 2, duration, 1 );
                }
                
                if ( isdefined( node.speed ) )
                {
                    print3d( node.origin - ( 0, 0, 100 ), "<dev string:x6db>" + node.speed, ( 1, 1, 1 ), 1, 2, duration, 1 );
                }
                
                if ( isdefined( node.script_accel ) )
                {
                    print3d( node.origin - ( 0, 0, 150 ), "<dev string:x6e6>" + node.script_accel, ( 1, 1, 1 ), 1, 2, duration, 1 );
                }
                
                if ( isdefined( node.script_decel ) )
                {
                    print3d( node.origin - ( 0, 0, 2000 ), "<dev string:x6f8>" + node.script_decel, ( 1, 1, 1 ), 1, 2, duration, 1 );
                }
                
                node function_584f61b8bbf3b638( is_exit || isdefined( node.script_unload ), duration );
            }
        }
    }

#/

// Namespace vehicle_paths
// Params 4
// Checksum 0xb844b41f, Offset: 0x44ff
// Size: 0x51
function function_90c1230ca7860463( value, key, origin, radiuscheck = 2000 )
{
    nodes = getvehiclenodearray( value, key );
    nodes = sortbydistancecullbyradius( nodes, origin, radiuscheck );
    return nodes[ 0 ];
}

// Namespace vehicle_paths
// Params 4
// Checksum 0xf1aa9ec7, Offset: 0x4559
// Size: 0x53
function function_7425a3e7418fac8( value, key, origin, radiuscheck = 2000 )
{
    nodes = utility::getstructarray( value, key );
    nodes = sortbydistancecullbyradius( nodes, origin, radiuscheck );
    return nodes[ 0 ];
}

// Namespace vehicle_paths
// Params 3
// Checksum 0xbbb4010f, Offset: 0x45b5
// Size: 0x127
function function_4977c502edc6c430( value, key, radiuscheck = 2000 )
{
    var_da2beca968b7a3df = undefined;
    nodes = getvehiclenodearray( value, key );
    nodes = sortbydistancecullbyradius( nodes, self.origin, radiuscheck );
    var_7c04a76400ce2b78 = anglestoforward( ( 0, self.angles[ 1 ], 0 ) );
    
    foreach ( node in nodes )
    {
        normal = vectornormalize( utility::flat_origin( node.origin ) - utility::flat_origin( self.origin ) );
        dot = vectordot( var_7c04a76400ce2b78, normal );
        
        if ( dot > 0 )
        {
            return node;
        }
    }
}

// Namespace vehicle_paths
// Params 2
// Checksum 0x6d5e0f88, Offset: 0x46e4
// Size: 0x61
function function_5d0f296ef68c3d46( node, pos )
{
    nextnode = getvehiclenode( node.target, #targetname );
    point = pointonsegmentnearesttopoint( node.origin, nextnode.origin, pos );
    return point;
}

// Namespace vehicle_paths
// Params 2
// Checksum 0xd7409345, Offset: 0x474e
// Size: 0x14d
function function_3af3e800ea34763f( node, origin )
{
    startnode = node;
    prevnode = node;
    is_struct = isstruct( node );
    nextnode = function_47eb09e1fb494ee5( node.target, "targetname", is_struct );
    lastpoint = pointonsegmentnearesttopoint( prevnode.origin, nextnode.origin, origin );
    var_15b2d570c455ab04 = distancesquared( lastpoint, origin );
    data = spawnstruct();
    
    while ( nextnode != startnode )
    {
        prevnode = nextnode;
        nextnode = function_47eb09e1fb494ee5( nextnode.target, "targetname", is_struct );
        point = pointonsegmentnearesttopoint( prevnode.origin, nextnode.origin, origin );
        distsqrd = distancesquared( point, origin );
        
        if ( distsqrd > var_15b2d570c455ab04 )
        {
            data.pos = lastpoint;
            data.nextnode = nextnode;
            data.prevnode = prevnode;
            break;
        }
        
        var_15b2d570c455ab04 = distsqrd;
        lastpoint = point;
        
        if ( nextnode == startnode )
        {
            break;
        }
    }
    
    return data;
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x256d1392, Offset: 0x48a4
// Size: 0x38
function function_47eb09e1fb494ee5( value, key, is_struct )
{
    if ( is_struct )
    {
        return utility::getstruct( value, key );
    }
    
    return getvehiclenode( value, key );
}

// Namespace vehicle_paths
// Params 3
// Checksum 0x974d2b5e, Offset: 0x48e4
// Size: 0x38
function function_30d7403e1f422766( value, key, is_struct )
{
    if ( is_struct )
    {
        return utility::getstructarray( value, key );
    }
    
    return getvehiclenodearray( value, key );
}

// Namespace vehicle_paths
// Params 2
// Checksum 0x2711f41b, Offset: 0x4924
// Size: 0x9b
function function_130e9b7e55701b39( node, nodearray )
{
    foreach ( n in nodearray )
    {
        if ( node.script_noteworthy == n.script_noteworthy )
        {
            return n;
        }
    }
}

// Namespace vehicle_paths
// Params 0
// Checksum 0x6d12ff79, Offset: 0x49c7
// Size: 0x101
function function_a2e57b598f36d85c()
{
    if ( !isdefined( self.var_ac3bff952bc81567 ) )
    {
        nodes = function_30d7403e1f422766( self.targetname, "target", isstruct( self ) );
        prevnode = undefined;
        
        if ( nodes.size > 1 )
        {
            foreach ( node in nodes )
            {
                if ( node.script_noteworthy == self.script_noteworthy )
                {
                    prevnode = node;
                    break;
                }
            }
        }
        else
        {
            prevnode = nodes[ 0 ];
        }
        
        self.var_ac3bff952bc81567 = distance( prevnode.origin, self.origin );
    }
    
    return self.var_ac3bff952bc81567;
}

// Namespace vehicle_paths
// Params 4
// Checksum 0xd7a60540, Offset: 0x4ad1
// Size: 0x2f6
function function_92bf30cce4141ecb( origin, node, dist, var_a7b05ea697da616a )
{
    data = spawnstruct();
    
    if ( var_a7b05ea697da616a )
    {
        var_4b440261c7222eb9 = function_3af3e800ea34763f( node, origin );
        data.pos = var_4b440261c7222eb9.pos;
        node = var_4b440261c7222eb9.prevnode;
    }
    else
    {
        data.pos = origin;
    }
    
    is_struct = isstruct( node );
    isnegative = dist < 0;
    
    if ( isnegative )
    {
        dist *= -1;
    }
    
    if ( isnegative )
    {
        if ( is_struct )
        {
            nextnodes = utility::getstructarray( node.targetname, "target" );
            nextnode = function_130e9b7e55701b39( node, nextnodes );
            nextnodes = utility::getstructarray( nextnode.targetname, "target" );
        }
        else
        {
            nextnode = getvehiclenode( node.targetname, #target );
            nextnodes = getvehiclenodearray( nextnode.targetname, #target );
        }
        
        nextnodes = function_30d7403e1f422766( node.targetname, "target", is_struct );
        nextnode = function_130e9b7e55701b39( node, nextnodes );
    }
    else
    {
        nextnode = function_47eb09e1fb494ee5( node.target, "targetname", is_struct );
    }
    
    data.node = nextnode;
    currpos = data.pos;
    var_604b2d02a0780914 = 0;
    points = [];
    points[ 0 ] = currpos;
    
    while ( true )
    {
        if ( !isdefined( nextnode ) )
        {
            break;
        }
        
        if ( !var_604b2d02a0780914 )
        {
            temp = distance( currpos, nextnode.origin );
        }
        else if ( dist < nextnode function_a2e57b598f36d85c() )
        {
            temp = dist;
        }
        else
        {
            temp = nextnode function_a2e57b598f36d85c();
        }
        
        dist -= temp;
        
        if ( dist <= 0 )
        {
            dist += temp;
            dir = vectornormalize( nextnode.origin - currpos );
            data.pos = currpos + dir * dist;
            points[ points.size ] = data.pos;
            
            if ( isnegative )
            {
                nextnode = function_47eb09e1fb494ee5( nextnode.target, "targetname", is_struct );
            }
            
            data.node = nextnode;
            break;
        }
        
        currpos = nextnode.origin;
        var_604b2d02a0780914 = 1;
        points[ points.size ] = currpos;
        
        if ( isnegative )
        {
            nextnodes = function_30d7403e1f422766( nextnode.targetname, "target", is_struct );
        }
        else
        {
            nextnodes = function_30d7403e1f422766( nextnode.target, "targetname", is_struct );
        }
        
        nextnode = function_130e9b7e55701b39( nextnode, nextnodes );
    }
    
    return data;
}

