#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_paths;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace vehicle_roads;

// Namespace vehicle_roads
// Params 17
// Checksum 0x8ee7c25, Offset: 0x2cc
// Size: 0x194
function function_b5bd79b51773c046( var_2a53549997639275 = 1, var_d2b2b98d77c9c0 = 0, checkstuck = 0, brakeatgoal = 1, autonormal = 1, brakeongoalgasbrake = 1, goalthreshold = 100, throttlespeedclose = 0, throttlespeedthreshold = 1, var_f04cadb28ee6016d = 1, throttlespeedfarbelow = 0, throttlespeedfarabove = 0, gastostopmovement = 0.9, steeringmultiplier = 1, stepradius, stepspeedfactor, usemanualspeed )
{
    if ( var_d2b2b98d77c9c0 )
    {
        if ( !self hascomponent( "animator" ) )
        {
            self addcomponent( "animator" );
        }
    }
    
    if ( var_2a53549997639275 )
    {
        vehicle_paths::function_53e592e2d38c05ca( checkstuck, brakeatgoal, autonormal, brakeongoalgasbrake, goalthreshold, throttlespeedclose, throttlespeedthreshold, var_f04cadb28ee6016d, throttlespeedfarbelow, throttlespeedfarabove, gastostopmovement, steeringmultiplier );
        self setconfigvalue( "p2p", "goalPoint", self.origin );
    }
    else
    {
        vehicle_paths::function_6080e3e7e4316b48();
    }
    
    vehicle_paths::function_44b075692bd28f39( 300, 2, 1 );
    self.stopping = 0;
    self vehphys_parkingbrake( 0 );
}

// Namespace vehicle_roads
// Params 9
// Checksum 0xdac5c426, Offset: 0x468
// Size: 0x5b1
function function_c64bd96044937781( goalorigin, speed = "medium", useroads = 1, var_c3e9f4759ee0b1fe = 1, var_de2ce60209cec7b0 = 1, var_12e420084a68860e, amortize = 1, vehiclenavmeshlayer = undefined, debugdraw = 0 )
{
    result = 0;
    
    if ( !self || !vehicle::is_vehicle() )
    {
        assertmsg( "<dev string:x24>" );
        return result;
    }
    
    if ( !goalorigin || !isvector( goalorigin ) )
    {
        assertmsg( "<dev string:x53>" );
        return result;
    }
    
    if ( !vehiclenavmeshlayer )
    {
        vehiclenavmeshlayer = level.vehiclenavmeshlayer ?? "vehicle_large";
    }
    
    navgoalorigin = getclosestpointonnavmesh( goalorigin, vehiclenavmeshlayer );
    
    if ( !navgoalorigin )
    {
        assertmsg( "<dev string:x7f>" + goalorigin );
        return result;
    }
    
    goalorigin = navgoalorigin;
    
    if ( isstring( speed ) )
    {
        switch ( speed )
        {
            case #"hash_e8f0758a10ec7618":
                speed = 10;
                break;
            case #"hash_c71b112fe04823d6":
                speed = 20;
                break;
            case #"hash_9c8ed152deb360f":
                speed = 35;
                break;
            case #"hash_289ae26c1f0ee7f9":
                speed = 45;
                break;
            default:
                speed = 20;
                break;
        }
    }
    
    result = 1;
    self.usenavmesh = 1;
    self.navmeshlayer = vehiclenavmeshlayer;
    self.var_75ea1b9acbb56f2a = var_de2ce60209cec7b0;
    vehicle::function_698648338e3e7b6d( speed, 12, 6 );
    utility::ent_flag_set( "vehicle_paths_scripted_speed" );
    finalnode = { #isoffroad:1, #origin:goalorigin };
    
    if ( !useroads || !level.roads )
    {
        self.attachedpath = finalnode;
        self.var_26b28c4d11c39de = undefined;
        self.var_aa9420e9c34ecebd = undefined;
        return result;
    }
    
    if ( distance( self.origin, goalorigin ) < 800 )
    {
        var_5e0b5b09c7d63725 = [];
        self.var_26b28c4d11c39de = undefined;
        self.var_aa9420e9c34ecebd = undefined;
    }
    else
    {
        [ var_5e0b5b09c7d63725, beststartnode, bestgoalnode ] = function_3fd54488ab0c7c72( self.origin, goalorigin, self.var_94e9dec930dce0a8, anglestoforward( self.angles ), amortize, undefined, undefined, debugdraw );
        
        if ( !var_5e0b5b09c7d63725 )
        {
            print( "<dev string:xd2>" + self.origin + "<dev string:x10d>" + goalorigin );
            var_5e0b5b09c7d63725 = [];
            self.var_26b28c4d11c39de = undefined;
            self.var_aa9420e9c34ecebd = undefined;
        }
        else
        {
            self.var_26b28c4d11c39de = beststartnode;
            self.var_aa9420e9c34ecebd = bestgoalnode;
        }
    }
    
    var_57de6de536cd690d = undefined;
    
    if ( self.var_26b28c4d11c39de )
    {
        var_f7fc8e68cde5d150 = distance2d( self.origin, self.var_26b28c4d11c39de.origin );
        
        /#
            if ( debugdraw )
            {
                print3d( self.var_26b28c4d11c39de.origin, "<dev string:x116>" + var_f7fc8e68cde5d150, ( 1, 1, 1 ), 1, 1, 600 );
            }
        #/
        
        var_20f18a5cb8d966b0 = undefined;
        
        if ( self.var_26b28c4d11c39de.target )
        {
            var_20f18a5cb8d966b0 = vectornormalize2( function_d5de32e196353afe( self.var_26b28c4d11c39de.target ).origin - self.var_26b28c4d11c39de.origin );
            self.isonroad = var_f7fc8e68cde5d150 < 500 && math::anglebetweenvectors( var_20f18a5cb8d966b0, anglestoforward( self.angles ) ) < 20;
        }
        
        if ( !self.isonroad )
        {
            var_57de6de536cd690d = { #target:1, #isoffroad:1, #forward:var_20f18a5cb8d966b0, #origin:self.var_26b28c4d11c39de.origin };
            
            /#
                if ( debugdraw )
                {
                    print3d( self.origin, "<dev string:x145>", ( 1, 1, 1 ), 1, 600 );
                }
            #/
        }
        
        /#
            if ( debugdraw && self.var_aa9420e9c34ecebd )
            {
                goalcolor = ( 0, 1, 0 );
                sphere( goalorigin, 100, goalcolor, 0, 600 );
                line( goalorigin, self.var_aa9420e9c34ecebd.origin, goalcolor, 1, 0, 600 );
            }
        #/
    }
    
    /#
        if ( debugdraw )
        {
            print3d( self.origin, "<dev string:x177>", ( 1, 1, 1 ), 1, 600 );
            thread function_ccc37c74c8357da7( var_5e0b5b09c7d63725, self.var_26b28c4d11c39de.targetname, self.var_aa9420e9c34ecebd.targetname );
        }
    #/
    
    if ( var_57de6de536cd690d )
    {
        arrayinsert( var_5e0b5b09c7d63725, var_57de6de536cd690d, 0 );
    }
    
    if ( var_c3e9f4759ee0b1fe || var_5e0b5b09c7d63725.size == 0 )
    {
        var_5e0b5b09c7d63725[ var_5e0b5b09c7d63725.size ] = finalnode;
    }
    
    function_60e8cec67a1f4910( var_5e0b5b09c7d63725 );
    
    /#
        if ( debugdraw )
        {
            print3d( var_5e0b5b09c7d63725[ var_5e0b5b09c7d63725.size - 1 ].origin, "<dev string:x1a7>", ( 1, 1, 1 ), 1, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x641db661, Offset: 0xa22
// Size: 0x47
function function_60e8cec67a1f4910( roadpath )
{
    assert( isdefined( level.roads ) );
    self setconfigvalue( "path", "resume", 1 );
    self.roadpath = roadpath;
    self.attachedpath = roadpath[ 0 ];
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0xfeaf26e2, Offset: 0xa71
// Size: 0x65
function private function_e9925980866c2c9a( var_56524e214b5e7d81, var_4e929e6a688742de = undefined )
{
    assert( var_56524e214b5e7d81 );
    nodeindex = getvehiclenodeindex( var_56524e214b5e7d81, #targetname );
    self setconfigvalue( "path", "radiantId", nodeindex );
    
    if ( isdefined( var_4e929e6a688742de ) )
    {
        self.splinetargetname = var_4e929e6a688742de;
    }
}

// Namespace vehicle_roads
// Params 4
// Checksum 0x3e6787a9, Offset: 0xade
// Size: 0x15f
function function_a5252349d3eb14f2( var_c677a1872ed9e343, var_a013e99fabd91cd5, goalvehiclenode, var_5e0b5b09c7d63725 )
{
    self notify( "follow_road_path" );
    self endon( "follow_road_path" );
    assert( var_5e0b5b09c7d63725 );
    currentsplinename = var_c677a1872ed9e343;
    function_e9925980866c2c9a( var_a013e99fabd91cd5, var_c677a1872ed9e343 );
    var_38a58e5386089535 = undefined;
    
    if ( var_5e0b5b09c7d63725.size == 1 )
    {
        var_38a58e5386089535 = goalvehiclenode;
    }
    else
    {
    }
    
    for ( var_38a58e5386089535 = function_d5de32e196353afe( level.roads[ var_c677a1872ed9e343 ].endkey ); true ; var_38a58e5386089535 = function_d5de32e196353afe( level.roads[ var_9f31af136fe72cdd ].endkey ) )
    {
        function_256de0610be6fee1( var_38a58e5386089535, 1 );
        
        if ( var_38a58e5386089535 == goalvehiclenode )
        {
            self notify( "reached_end_of_route" );
            break;
        }
        
        var_9f31af136fe72cdd = undefined;
        var_583c512cc2da2a02 = 0;
        
        for ( var_583c512cc2da2a02 = 0; var_583c512cc2da2a02 < var_5e0b5b09c7d63725.size ; var_583c512cc2da2a02++ )
        {
            if ( var_5e0b5b09c7d63725[ var_583c512cc2da2a02 ].targetname == currentsplinename )
            {
                var_9f31af136fe72cdd = var_5e0b5b09c7d63725[ var_583c512cc2da2a02 + 1 ].targetname;
                break;
            }
        }
        
        function_e9925980866c2c9a( var_9f31af136fe72cdd, var_9f31af136fe72cdd );
        currentsplinename = var_9f31af136fe72cdd;
        
        if ( var_583c512cc2da2a02 == var_5e0b5b09c7d63725.size - 1 )
        {
            var_38a58e5386089535 = goalvehiclenode;
            continue;
        }
    }
    
    self vehicle_setspeedimmediate( 0 );
    self setconfigvalue( "path", "pause", 1 );
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xab69446, Offset: 0xc45
// Size: 0x8d
function function_8fe66e18c5435268( node )
{
    if ( !self.roadpath )
    {
        return;
    }
    
    index = function_f02c63b99c9614c9( self.roadpath, node );
    
    if ( isdefined( index ) )
    {
        return self.roadpath[ index + 1 ];
    }
    
    currentsplinename = node.targetname;
    var_9f31af136fe72cdd = [[ self.var_7bad066f66519780 ?? &function_40be5cbb0e8c2ad2 ]]( currentsplinename );
    
    if ( var_9f31af136fe72cdd )
    {
        return function_d5de32e196353afe( var_9f31af136fe72cdd );
    }
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x4b5ceace, Offset: 0xcda
// Size: 0x1f0
function navmesh_wait( nextpoint, debugdraw = 0 )
{
    if ( isstruct( nextpoint ) )
    {
        function_123852fba4d3e231( nextpoint.origin, undefined, self.navmeshlayer ?? level.vehiclenavmeshlayer ?? "vehicle_large", nextpoint.forward, debugdraw );
        self.isonroad = !nextpoint.isoffroad;
        return;
    }
    
    var_ca05ad09063fdd87 = 0;
    
    foreach ( node in self.roadpath )
    {
        if ( !node.isoffroad )
        {
            if ( nextpoint == node )
            {
                var_ca05ad09063fdd87 = 1;
            }
            
            break;
        }
    }
    
    if ( var_ca05ad09063fdd87 )
    {
        vehicle_paths::function_2af4522b1fc2bcc9( self.var_26b28c4d11c39de );
    }
    else
    {
        vehicle_paths::function_2af4522b1fc2bcc9( nextpoint );
    }
    
    if ( level.var_2aa90a9ef4e6c7c6 )
    {
        assert( level.roads[ nextpoint.targetname ] );
        var_a1c5c8fc030b7b6 = undefined;
        
        if ( nextpoint.var_5262adea3d5fcba3 == self.var_aa9420e9c34ecebd.var_5262adea3d5fcba3 )
        {
            var_a1c5c8fc030b7b6 = self.var_aa9420e9c34ecebd;
        }
        else
        {
            var_a1c5c8fc030b7b6 = function_d5de32e196353afe( level.roads[ nextpoint.targetname ].endkey );
        }
        
        assert( var_a1c5c8fc030b7b6 );
        function_256de0610be6fee1( var_a1c5c8fc030b7b6, debugdraw );
        return;
    }
    
    self endon( "reached_end_node" );
    function_256de0610be6fee1( self.var_aa9420e9c34ecebd, debugdraw );
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0xeb664c62, Offset: 0xed2
// Size: 0x68
function private function_65b879deddf25051( var_f66763de0244a4b1, var_f66760de02449e18 )
{
    result = 1;
    
    if ( level.var_2aa90a9ef4e6c7c6 )
    {
        if ( var_f66763de0244a4b1.var_5262adea3d5fcba3 == var_f66760de02449e18.var_5262adea3d5fcba3 )
        {
            if ( var_f66763de0244a4b1.var_acc28514b93af430 > var_f66760de02449e18.var_acc28514b93af430 )
            {
                result = 0;
            }
        }
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 8
// Checksum 0x38111a1a, Offset: 0xf43
// Size: 0x4a7
function function_3fd54488ab0c7c72( startorigin, goalorigin, var_94e9dec930dce0a8, vehicleheading, amortize = 1, var_a5a3f8253b5e30bd = 1500, var_ce44cb2bc998e1a0 = 800, debug = 0 )
{
    result = [ undefined, undefined, undefined ];
    
    if ( !startorigin || !isvector( startorigin ) )
    {
        assertmsg( "<dev string:x1c8>" );
        return result;
    }
    
    if ( !goalorigin || !isvector( goalorigin ) )
    {
        assertmsg( "<dev string:x1ef>" );
        return result;
    }
    
    if ( distance( startorigin, goalorigin ) < max( var_a5a3f8253b5e30bd, var_ce44cb2bc998e1a0 ) )
    {
        return result;
    }
    
    minlength = undefined;
    bestpath = undefined;
    var_7c3e88b4efbf7806 = undefined;
    var_1949c9765e5ad6c2 = undefined;
    beststartnode = undefined;
    bestgoalnode = undefined;
    var_274850134e12f7b5 = function_3127fbf4fc495e2c( var_94e9dec930dce0a8, startorigin, 200, vehicleheading );
    var_6471f4e0e6b6314b = function_d3465c4295cd717c( startorigin, goalorigin, var_a5a3f8253b5e30bd, 200, vehicleheading, 1, 0, 1, debug, ( 0, 1, 1 ), "Start" );
    var_a2edd42814eec542 = function_d3465c4295cd717c( goalorigin, startorigin, var_a5a3f8253b5e30bd, undefined, undefined, 1, 1, 0, debug, ( 1, 0.06, 0.94 ), "Goal" );
    
    if ( var_274850134e12f7b5 && !arraycontains( var_6471f4e0e6b6314b, var_274850134e12f7b5 ) )
    {
        /#
            if ( debug )
            {
                line( startorigin + ( 0, 0, 100 ), var_274850134e12f7b5.origin, ( 0, 1, 1 ), 1, 0, 600 );
            }
        #/
        
        var_6471f4e0e6b6314b = arraycombine( [ var_274850134e12f7b5 ], var_6471f4e0e6b6314b );
    }
    
    foreach ( roadnearstart in var_6471f4e0e6b6314b )
    {
        if ( arraycontains( var_a2edd42814eec542, roadnearstart ) )
        {
            /#
                if ( debug )
                {
                    sphere( roadnearstart.origin, 35, ( 0, 1, 1 ), 0, 600 );
                }
            #/
            
            return result;
        }
    }
    
    for ( goalindex = 0; goalindex < var_a2edd42814eec542.size && goalindex < 10 ; goalindex++ )
    {
        var_e196dff1687b3cba = function_1d43376f84a16476( var_a2edd42814eec542[ goalindex ] );
        
        for ( startindex = 0; startindex < var_6471f4e0e6b6314b.size && startindex < 10 ; startindex++ )
        {
            if ( !function_65b879deddf25051( var_6471f4e0e6b6314b[ startindex ], var_a2edd42814eec542[ goalindex ] ) )
            {
                continue;
            }
            
            var_9b4a3fbbb093b8c9 = function_1d43376f84a16476( var_6471f4e0e6b6314b[ startindex ] );
            [ path, pathcost ] = function_d33b56d65e85b678( var_9b4a3fbbb093b8c9, var_e196dff1687b3cba, var_7c3e88b4efbf7806 );
            
            if ( amortize )
            {
                waitframe();
            }
            
            if ( !path )
            {
                continue;
            }
            
            if ( level.var_2aa90a9ef4e6c7c6 )
            {
                pathlength = function_c5f4027066f63f00( path, startorigin, goalorigin, var_6471f4e0e6b6314b[ startindex ], var_a2edd42814eec542[ goalindex ], 0, ( goalindex + startindex ) * ( 0, 0, 40 ) );
            }
            else
            {
                pathlength = function_cbb69c875b8549b2( path, startorigin, goalorigin, var_6471f4e0e6b6314b[ startindex ], var_a2edd42814eec542[ goalindex ], 0, ( goalindex + startindex ) * ( 0, 0, 40 ) );
            }
            
            if ( !pathlength )
            {
                continue;
            }
            
            if ( !minlength || pathlength < minlength )
            {
                bestpath = path;
                var_7c3e88b4efbf7806 = pathcost;
                minlength = pathlength;
                var_1949c9765e5ad6c2 = var_9b4a3fbbb093b8c9;
                beststartnode = var_6471f4e0e6b6314b[ startindex ];
                bestgoalnode = var_a2edd42814eec542[ goalindex ];
            }
        }
    }
    
    if ( !bestpath )
    {
        return result;
    }
    
    /#
        if ( debug )
        {
            sphere( beststartnode.origin, 35, ( 0, 1, 1 ), 0, 600 );
            sphere( bestgoalnode.origin, 35, ( 1, 0.06, 0.94 ), 0, 600 );
            
            if ( level.var_2aa90a9ef4e6c7c6 )
            {
                pathlength = function_c5f4027066f63f00( bestpath, startorigin, goalorigin, beststartnode, bestgoalnode, 1, ( 0, 0, 40 ) );
            }
            else
            {
                pathlength = function_cbb69c875b8549b2( bestpath, startorigin, goalorigin, beststartnode, bestgoalnode, 1, ( 0, 0, 40 ) );
            }
        }
    #/
    
    result = [ bestpath, beststartnode, bestgoalnode ];
    return result;
}

// Namespace vehicle_roads
// Params 3
// Checksum 0xbad3abe3, Offset: 0x13f3
// Size: 0x416
function function_d33b56d65e85b678( startvehiclenode, goalvehiclenode, maxcost )
{
    assert( startvehiclenode );
    assert( goalvehiclenode );
    openlist = [];
    camefrom = [];
    knowncosts = [];
    var_439958ee2d3de264 = [];
    totalcosts = [];
    openlist[ openlist.size ] = startvehiclenode;
    knowncosts[ startvehiclenode.targetname ] = 0;
    var_439958ee2d3de264[ startvehiclenode.targetname ] = distance( startvehiclenode.origin, goalvehiclenode.origin );
    totalcosts[ startvehiclenode.targetname ] = var_439958ee2d3de264[ startvehiclenode.targetname ];
    
    while ( openlist.size )
    {
        currnode = undefined;
        lowestcost = undefined;
        lowestcostidx = undefined;
        
        foreach ( idx, node in openlist )
        {
            cost = totalcosts[ node.targetname ];
            
            if ( !isdefined( lowestcost ) || lowestcost > cost )
            {
                currnode = node;
                lowestcost = cost;
                lowestcostidx = idx;
            }
        }
        
        road = level.roads[ currnode.targetname ];
        assert( isdefined( road ) );
        
        if ( currnode == goalvehiclenode )
        {
            curr = currnode;
            arr = [ curr ];
            
            while ( isdefined( camefrom[ curr.targetname ] ) )
            {
                curr = camefrom[ curr.targetname ];
                arr[ arr.size ] = curr;
            }
            
            return [ utility::array_reverse( arr ), cost ];
        }
        else if ( maxcost && cost > maxcost + 1500 )
        {
            return [ undefined, undefined ];
        }
        
        openlist[ lowestcostidx ] = openlist[ openlist.size - 1 ];
        openlist[ openlist.size - 1 ] = undefined;
        
        if ( !road.endkey )
        {
            continue;
        }
        
        endvehiclenode = function_d5de32e196353afe( road.endkey );
        
        foreach ( var_dae9d8b7f3417a74 in road.connections )
        {
            if ( level.roads[ var_dae9d8b7f3417a74 ].disabled )
            {
                continue;
            }
            
            neighborvehiclenode = function_d5de32e196353afe( var_dae9d8b7f3417a74 );
            pathcost = knowncosts[ currnode.targetname ] + road.var_ab3915e451d72b25 + distance( neighborvehiclenode.origin, endvehiclenode.origin );
            
            if ( !isdefined( knowncosts[ neighborvehiclenode.targetname ] ) || pathcost < knowncosts[ neighborvehiclenode.targetname ] )
            {
                camefrom[ neighborvehiclenode.targetname ] = currnode;
                knowncosts[ neighborvehiclenode.targetname ] = pathcost;
                
                if ( !isdefined( var_439958ee2d3de264[ neighborvehiclenode.targetname ] ) )
                {
                    var_439958ee2d3de264[ neighborvehiclenode.targetname ] = distance( neighborvehiclenode.origin, goalvehiclenode.origin );
                }
                
                totalcosts[ neighborvehiclenode.targetname ] = knowncosts[ neighborvehiclenode.targetname ] + var_439958ee2d3de264[ neighborvehiclenode.targetname ];
                
                if ( !arraycontains( openlist, neighborvehiclenode ) )
                {
                    openlist[ openlist.size ] = neighborvehiclenode;
                }
            }
        }
    }
    
    return [ undefined, undefined ];
}

// Namespace vehicle_roads
// Params 7, eflags: 0x4
// Checksum 0x87a8d242, Offset: 0x1812
// Size: 0x314
function private function_cbb69c875b8549b2( path, startorigin, goalorigin, startnode, goalnode, debug = 0, debugoffset = ( 0, 0, 0 ) )
{
    assert( isdefined( level.roads ) );
    assert( goalnode.var_5262adea3d5fcba3 );
    result = distance( startnode.origin, startorigin ) + distance( goalnode.origin, goalorigin );
    
    /#
        if ( debug )
        {
            debugcolor = ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) );
            print3d( startnode.origin, "<dev string:x215>", debugcolor, 1, 3, 600 );
            print3d( goalnode.origin, "<dev string:x223>", debugcolor, 1, 3, 600 );
            print3d( goalorigin, "<dev string:x230>", debugcolor, 1, 3, 600 );
            line( startnode.origin + debugoffset, startorigin + debugoffset, debugcolor, 1, 0, 600 );
            line( goalnode.origin + debugoffset, goalorigin + debugoffset, debugcolor, 1, 0, 600 );
        }
    #/
    
    index = 1;
    currentnode = startnode;
    nextnode = undefined;
    var_5e13e6a920e11506 = goalnode.var_5262adea3d5fcba3;
    
    while ( true )
    {
        if ( currentnode == goalnode )
        {
            break;
        }
        
        var_6732d93a48e8f4f7 = 0;
        
        if ( currentnode.spawnflags > 0 && level.roads[ currentnode.targetname ] && currentnode.var_5262adea3d5fcba3 != var_5e13e6a920e11506 )
        {
            var_6732d93a48e8f4f7 = 1;
            nextnode = function_d5de32e196353afe( level.roads[ currentnode.targetname ].endkey );
        }
        else if ( currentnode.target )
        {
            nextnode = function_d5de32e196353afe( currentnode.target );
        }
        else
        {
            nextnode = path[ index ];
            index += 1;
        }
        
        if ( !nextnode )
        {
            return undefined;
        }
        
        /#
            if ( debug )
            {
                line( currentnode.origin + debugoffset, nextnode.origin + debugoffset, debugcolor, 1, 0, 600 );
            }
        #/
        
        if ( var_6732d93a48e8f4f7 )
        {
            result += level.roads[ currentnode.targetname ].var_ab3915e451d72b25;
        }
        else
        {
            result += distance( currentnode.origin, nextnode.origin );
        }
        
        currentnode = nextnode;
    }
    
    /#
        if ( debug )
        {
            print3d( startorigin + debugoffset, "<dev string:x23f>" + result, debugcolor, 1, 3, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 7, eflags: 0x4
// Checksum 0x3317f321, Offset: 0x1b2f
// Size: 0x302
function private function_c5f4027066f63f00( path, startorigin, goalorigin, startnode, goalnode, debug = 0, debugoffset = ( 0, 0, 0 ) )
{
    assert( isdefined( level.roads ) );
    assert( goalnode.var_5262adea3d5fcba3 );
    result = distance( startnode.origin, startorigin ) + distance( goalnode.origin, goalorigin );
    
    /#
        if ( debug )
        {
            debugcolor = ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) );
            print3d( startnode.origin, "<dev string:x215>", debugcolor, 1, 3, 600 );
            print3d( goalnode.origin, "<dev string:x223>", debugcolor, 1, 3, 600 );
            print3d( goalorigin, "<dev string:x230>", debugcolor, 1, 3, 600 );
            line( startnode.origin + debugoffset, startorigin + debugoffset, debugcolor, 1, 0, 600 );
            line( goalnode.origin + debugoffset, goalorigin + debugoffset, debugcolor, 1, 0, 600 );
        }
    #/
    
    foreach ( roadnode in path )
    {
        assert( roadnode.var_5262adea3d5fcba3 );
        assert( level.roads[ roadnode.targetname ] );
        
        if ( roadnode.var_5262adea3d5fcba3 == startnode.var_5262adea3d5fcba3 && roadnode != startnode )
        {
            result += level.roads[ roadnode.targetname ].var_ab3915e451d72b25 * ( 1 - startnode.var_acc28514b93af430 );
            continue;
        }
        
        if ( roadnode.var_5262adea3d5fcba3 == goalnode.var_5262adea3d5fcba3 && roadnode != goalnode )
        {
            result += level.roads[ roadnode.targetname ].var_ab3915e451d72b25 * goalnode.var_acc28514b93af430;
            continue;
        }
        
        result += level.roads[ roadnode.targetname ].var_ab3915e451d72b25;
    }
    
    /#
        if ( debug )
        {
            print3d( startorigin + debugoffset, "<dev string:x23f>" + result, debugcolor, 1, 3, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xa115f6be, Offset: 0x1e3a
// Size: 0x83
function function_40be5cbb0e8c2ad2( currentsplinename )
{
    resulttargetname = undefined;
    
    if ( isdefined( self.roadpath ) )
    {
        for ( index = 0; index < self.roadpath.size ; index++ )
        {
            if ( self.roadpath[ index ].targetname == currentsplinename )
            {
                resulttargetname = self.roadpath[ index + 1 ].targetname;
                break;
            }
        }
    }
    
    return resulttargetname;
}

// Namespace vehicle_roads
// Params 3
// Checksum 0x81159933, Offset: 0x1ec6
// Size: 0x184
function follow_roads( var_c677a1872ed9e343, var_a013e99fabd91cd5, debugdraw )
{
    self notify( "follow_roads" );
    self endon( "follow_roads" );
    self notify( "vehiclePursueEntity" );
    currentsplinename = var_c677a1872ed9e343;
    var_a013e99fabd91cd5 = isdefined( var_a013e99fabd91cd5 ) ? var_a013e99fabd91cd5 : var_c677a1872ed9e343;
    vehicle_paths::function_2af4522b1fc2bcc9( var_a013e99fabd91cd5 );
    
    while ( true )
    {
        self waittill( "reached_end_node" );
        
        if ( !isdefined( level.roads[ currentsplinename ].connections ) || level.roads[ currentsplinename ].connections.size == 0 )
        {
            self notify( "reached_end_of_route" );
            break;
        }
        
        var_9f31af136fe72cdd = [[ self.var_7bad066f66519780 ?? &function_40be5cbb0e8c2ad2 ]]( currentsplinename );
        
        if ( !isdefined( var_9f31af136fe72cdd ) )
        {
            if ( level.roads[ currentsplinename ].connections.size > 0 )
            {
                var_a69683a038c73f28 = 0;
                
                if ( !isdefined( self.var_a1379d3eb7064f7c ) )
                {
                    var_a69683a038c73f28 = randomint( level.roads[ currentsplinename ].connections.size );
                }
                
                var_9f31af136fe72cdd = level.roads[ level.roads[ currentsplinename ].connections[ var_a69683a038c73f28 ] ].key;
                self.veh_pathdir = "forward";
            }
        }
        
        if ( isdefined( var_9f31af136fe72cdd ) )
        {
            vehicle_paths::function_2af4522b1fc2bcc9( var_9f31af136fe72cdd );
            currentsplinename = var_9f31af136fe72cdd;
            continue;
        }
        
        self notify( "reached_end_of_route" );
        break;
    }
}

// Namespace vehicle_roads
// Params 0
// Checksum 0xc530cf62, Offset: 0x2052
// Size: 0xa
function function_a35b358d899efcf6()
{
    self notify( "follow_roads" );
}

// Namespace vehicle_roads
// Params 0
// Checksum 0x29e81218, Offset: 0x2064
// Size: 0xa
function function_95a3bf8ea721adce()
{
    self notify( "move_to_done" );
}

// Namespace vehicle_roads
// Params 5
// Checksum 0xfbfdf2e9, Offset: 0x2076
// Size: 0x15d
function function_123852fba4d3e231( goallocation, speedmph, vehiclenavmeshlayer, goaldirection = ( 0, 0, 0 ), debugdraw = 0 )
{
    self notify( "c479d122ab51aa37" );
    self endon( "c479d122ab51aa37" );
    
    if ( !isdefined( vehiclenavmeshlayer ) )
    {
        vehiclenavmeshlayer = level.vehiclenavmeshlayer ?? "vehicle_large";
    }
    
    startlocation = self.origin;
    vehicleforward = anglestoforward( self.angles );
    splinepoints = self function_4c871eec1ca1279b( startlocation, goallocation, 50, 200, 100, vehicleforward, goaldirection, 300, 0.4, 0, 1, vehiclenavmeshlayer, 0, 1 );
    
    if ( speedmph )
    {
        vehicle::function_698648338e3e7b6d( speedmph, 12, 6 );
    }
    
    /#
        if ( splinepoints.size && debugdraw )
        {
            thread function_2b723e6a5a86a006( splinepoints, isdefined( vehiclenavmeshlayer ) ? ( 1, 1, 1 ) : ( 1, 0, 0 ) );
            thread function_8437fc8203abb755( vehiclenavmeshlayer );
        }
    #/
    
    thread watch_stuck();
    thread watch_interrupt();
    result = utility::waittill_any_return( "reached_end_node", "vehicleStuckNavSpline", "vehicleNavSplineInterrupted", "death" );
    self notify( "move_to_done" );
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x1e9ec654, Offset: 0x21dc
// Size: 0x12e
function watch_stuck( debugdraw )
{
    self notify( "8b8fde774f0843c3" );
    self endon( "8b8fde774f0843c3" );
    self endon( "death" );
    self endon( "move_to_done" );
    self endon( "newpath" );
    laststucktime = undefined;
    laststuckposition = undefined;
    stuckdistancethreshold = 100;
    var_d847e2f7986ada00 = 5;
    
    while ( true )
    {
        self waittill( "path_blocked" );
        
        if ( !( isdefined( laststucktime ) && isdefined( laststuckposition ) ) )
        {
            laststucktime = gettime();
            laststuckposition = self.origin;
            continue;
        }
        
        stuckdistance = length2d( self.origin - laststuckposition );
        
        if ( stuckdistance > stuckdistancethreshold )
        {
            laststucktime = gettime();
            laststuckposition = self.origin;
            continue;
        }
        
        timeelapsed = gettime() - laststucktime;
        timeelapsedseconds = timeelapsed / 1000;
        
        if ( timeelapsedseconds > var_d847e2f7986ada00 )
        {
            /#
                if ( debugdraw )
                {
                    print3d( self getcentroid(), "<dev string:x243>", ( 1, 1, 1 ), 1, 1, 4000 );
                }
            #/
            
            self notify( "vehicleStuckNavSpline" );
            self stoppath();
            break;
        }
    }
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xea6ad8e6, Offset: 0x2312
// Size: 0x7d
function watch_interrupt( debugdraw )
{
    self notify( "994662de46d548e7" );
    self endon( "994662de46d548e7" );
    self endon( "death" );
    self endon( "move_to_done" );
    self endon( "newpath" );
    
    while ( true )
    {
        self waittill( "navspline_interrupted" );
        
        /#
            if ( debugdraw )
            {
                print3d( self getcentroid(), "<dev string:x25e>", ( 1, 1, 1 ), 1, 1, 4000 );
            }
        #/
        
        self notify( "vehicleNavSplineInterrupted" );
        self stoppath();
    }
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x88e9597b, Offset: 0x2397
// Size: 0x179
function enable_roads( enablespline = 0, splinetargetnames )
{
    assert( isdefined( level.roads ) );
    disabled = enablespline ? undefined : 1;
    
    foreach ( splinetargetname in splinetargetnames )
    {
        network = level.roads[ splinetargetname ];
        
        if ( !network )
        {
            continue;
        }
        
        network.disabled = disabled;
        startnode = function_d5de32e196353afe( network.key );
        startnode.disabled = disabled;
        prevnode = startnode;
        nextnode = function_d5de32e196353afe( startnode.target );
        nextnode.disabled = disabled;
        
        while ( startnode != nextnode )
        {
            if ( !nextnode.target )
            {
                break;
            }
            
            prevnode = nextnode;
            nextnode = function_d5de32e196353afe( nextnode.target );
            nextnode.disabled = disabled;
        }
    }
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x5464b37, Offset: 0x2518
// Size: 0x18, Type: bool
function function_d6d259c92d42b7e7( vehiclenode )
{
    return !vehiclenode.disabled;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xbccccf01, Offset: 0x2539
// Size: 0x142
function function_3660b26e3e6babd3( var_1d51a17199022249 = undefined )
{
    assert( isdefined( level.roads ) );
    result = [];
    
    foreach ( road in level.roads )
    {
        var_34b2b1d458e6bced = 1;
        
        if ( var_1d51a17199022249 )
        {
            var_34b2b1d458e6bced = !road.disabled;
        }
        
        if ( var_34b2b1d458e6bced )
        {
            roadstartvehiclenode = function_d5de32e196353afe( road.key );
            nextnode = function_d5de32e196353afe( roadstartvehiclenode.target );
            result[ result.size ] = roadstartvehiclenode;
            result[ result.size ] = nextnode;
            
            while ( roadstartvehiclenode != nextnode )
            {
                if ( !isdefined( nextnode.target ) )
                {
                    break;
                }
                
                nextnode = function_d5de32e196353afe( nextnode.target );
                result[ result.size ] = nextnode;
            }
        }
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 0
// Checksum 0x69dc7877, Offset: 0x2684
// Size: 0xd1
function function_ead8c1253a45bd10()
{
    if ( !isdefined( level.vehiclestartnodes ) )
    {
        allvehiclenodes = getallvehiclenodes();
        level.vehiclestartnodes = [];
        
        foreach ( vehiclenode in allvehiclenodes )
        {
            if ( vehiclenode.spawnflags > 0 && isdefined( vehiclenode.target ) )
            {
                level.vehiclestartnodes[ level.vehiclestartnodes.size ] = vehiclenode;
            }
        }
    }
    
    return level.vehiclestartnodes;
}

// Namespace vehicle_roads
// Params 1, eflags: 0x4
// Checksum 0xee773976, Offset: 0x275e
// Size: 0x133
function private function_cd5f416b97d4464( checkvehiclenode )
{
    result = [];
    
    if ( !level.allvehiclenodes )
    {
        level.allvehiclenodes = getallvehiclenodes();
    }
    
    foreach ( vehiclenode in level.allvehiclenodes )
    {
        if ( vehiclenode.target && vehiclenode.target == checkvehiclenode.targetname )
        {
            result[ result.size ] = vehiclenode;
        }
        
        if ( vehiclenode.target2 && vehiclenode.target2 == checkvehiclenode.targetname )
        {
            result[ result.size ] = vehiclenode;
        }
        
        if ( vehiclenode.target3 && vehiclenode.target3 == checkvehiclenode.targetname )
        {
            result[ result.size ] = vehiclenode;
        }
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x23348bb, Offset: 0x289a
// Size: 0x43c
function function_e6974b6c2f2c11cd( debugdraw = 0 )
{
    if ( !isdefined( level.var_666f4d8169dc4fbf ) )
    {
        allvehiclenodes = getallvehiclenodes();
        level.var_666f4d8169dc4fbf = [];
        level.var_c9ac523ccb3f4305 = [];
        level.var_42b5a3f97906fc3 = [];
        level.var_57587d488f0edd2f = [];
        level.var_67119a9659b67e6d = [];
        
        foreach ( vehiclenodeindex, vehiclenode in allvehiclenodes )
        {
            if ( mod( vehiclenodeindex, 20 ) == 0 )
            {
                waitframe();
            }
            
            if ( vehiclenode.target2 || vehiclenode.target3 )
            {
                assert( vehiclenode.target, "<dev string:x27f>" + vehiclenode.targetname + "<dev string:x2b9>" );
                
                if ( vehiclenode.target )
                {
                    level.var_666f4d8169dc4fbf = arraycombineunique( level.var_666f4d8169dc4fbf, [ vehiclenode ] );
                    level.var_67119a9659b67e6d = arraycombineunique( level.var_67119a9659b67e6d, [ vehiclenode ] );
                    targetvehiclenode = function_d5de32e196353afe( vehiclenode.target );
                    assert( targetvehiclenode );
                    
                    if ( targetvehiclenode )
                    {
                        level.var_42b5a3f97906fc3 = arraycombineunique( level.var_42b5a3f97906fc3, [ vehiclenode ] );
                    }
                    
                    if ( vehiclenode.target2 )
                    {
                        target2vehiclenode = function_d5de32e196353afe( vehiclenode.target2 );
                        
                        if ( target2vehiclenode )
                        {
                            level.var_42b5a3f97906fc3 = arraycombineunique( level.var_42b5a3f97906fc3, [ target2vehiclenode ] );
                        }
                    }
                    
                    if ( vehiclenode.target3 )
                    {
                        target3vehiclenode = function_d5de32e196353afe( vehiclenode.target3 );
                        
                        if ( target3vehiclenode )
                        {
                            level.var_42b5a3f97906fc3 = arraycombineunique( level.var_42b5a3f97906fc3, [ target3vehiclenode ] );
                        }
                    }
                }
                
                continue;
            }
            
            incomingconnections = function_cd5f416b97d4464( vehiclenode );
            
            if ( incomingconnections.size >= 2 )
            {
                level.var_57587d488f0edd2f = arraycombineunique( level.var_57587d488f0edd2f, [ vehiclenode ] );
                level.var_666f4d8169dc4fbf = arraycombineunique( level.var_666f4d8169dc4fbf, [ vehiclenode ] );
                targetvehiclenode = function_d5de32e196353afe( vehiclenode.target );
                assert( targetvehiclenode, "<dev string:x2e4>" + vehiclenode.targetname + "<dev string:x2f4>" );
                
                if ( targetvehiclenode )
                {
                    level.var_42b5a3f97906fc3 = arraycombineunique( level.var_42b5a3f97906fc3, [ vehiclenode ] );
                }
                
                continue;
            }
            
            if ( vehiclenode.spawnflags > 0 && vehiclenode.target && incomingconnections.size == 0 )
            {
                level.var_42b5a3f97906fc3 = arraycombineunique( level.var_42b5a3f97906fc3, [ vehiclenode ] );
                level.var_c9ac523ccb3f4305 = arraycombineunique( level.var_c9ac523ccb3f4305, [ vehiclenode ] );
            }
        }
    }
    
    /#
        if ( debugdraw )
        {
            foreach ( node in level.var_666f4d8169dc4fbf )
            {
                line( node.origin, node.origin + ( 0, 0, 2048 ), ( 1, 0.77, 0.82 ), 1, 0, 18000 );
                sphere( node.origin, 75, ( 1, 0.77, 0.82 ), 0, 18000 );
            }
        }
    #/
    
    return level.var_42b5a3f97906fc3;
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x9f2fea32, Offset: 0x2cdf
// Size: 0x96
function function_4cda58395996a9a5( searchorigin, maxdistance = 3500 )
{
    assert( isdefined( level.roads ) );
    
    if ( !isdefined( level.vehiclenodes ) )
    {
        level.vehiclenodes = utility::create_partition( getallvehiclenodes(), 3500, 1 );
    }
    
    result = undefined;
    var_ae98ea54b5bb34da = level.vehiclenodes utility::function_822c5feaca90abc1( searchorigin, maxdistance );
    var_ae98ea54b5bb34da = sortbydistance( var_ae98ea54b5bb34da, searchorigin );
    
    if ( var_ae98ea54b5bb34da.size > 0 )
    {
        result = var_ae98ea54b5bb34da[ 0 ];
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0x1c09782e, Offset: 0x2d7e
// Size: 0x5d
function private function_5b999b3f4e8b90c8( node, origin )
{
    roadnodes = [];
    roadnodes[ roadnodes.size ] = node;
    
    while ( node.target )
    {
        node = function_d5de32e196353afe( node.target );
        roadnodes[ roadnodes.size ] = node;
    }
    
    return sortbydistance( roadnodes, origin )[ 0 ];
}

// Namespace vehicle_roads
// Params 7
// Checksum 0xabea96d9, Offset: 0x2de4
// Size: 0x2cd
function function_a59922ce43367d92( goalorigin, maxdistance = 3500, goaldirection = undefined, var_8a4f78052b5273fa = 90, var_debd3da3c83a10e9 = 90, skipend = 1, debugdraw = 0 )
{
    assert( isdefined( level.roads ) );
    
    if ( !isdefined( level.vehiclenodes ) )
    {
        level.vehiclenodes = utility::create_partition( getallvehiclenodes(), 3500, 1 );
    }
    
    var_ae98ea54b5bb34da = level.vehiclenodes utility::function_822c5feaca90abc1( goalorigin, maxdistance );
    var_ae98ea54b5bb34da = sortbydistance( var_ae98ea54b5bb34da, goalorigin );
    result = [ undefined, undefined ];
    
    if ( var_ae98ea54b5bb34da.size > 0 )
    {
        foreach ( vehiclenode in var_ae98ea54b5bb34da )
        {
            if ( skipend && !isdefined( vehiclenode.target ) )
            {
                continue;
            }
            
            if ( isdefined( goaldirection ) && isdefined( vehiclenode.target ) )
            {
                nextnode = function_d5de32e196353afe( vehiclenode.target );
                nodeheading = vectornormalize2( nextnode.origin - vehiclenode.origin );
                var_16ed23c977a1370a = vectornormalize2( vehiclenode.origin - goalorigin );
                
                if ( vectordot2( nodeheading, goaldirection ) < cos( var_8a4f78052b5273fa ) )
                {
                    continue;
                }
                
                if ( vectordot2( var_16ed23c977a1370a, goaldirection ) < cos( var_debd3da3c83a10e9 ) )
                {
                    continue;
                }
            }
            
            var_5262adea3d5fcba3 = vehiclenode.var_5262adea3d5fcba3;
            roadstartvehiclenode = getvehiclenode( var_5262adea3d5fcba3 );
            
            if ( level.roads[ roadstartvehiclenode.targetname ].disabled )
            {
                continue;
            }
            
            result = [ vehiclenode, roadstartvehiclenode.targetname ];
            
            /#
                if ( debugdraw )
                {
                    duration = 600;
                    line( goalorigin, vehiclenode.origin, ( 1, 1, 0 ), 1, 0, duration );
                    sphere( vehiclenode.origin, 15, ( 1, 1, 0 ), 0, duration );
                }
            #/
            
            break;
        }
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 4, eflags: 0x4
// Checksum 0x55dcbf58, Offset: 0x30ba
// Size: 0x119
function private function_3127fbf4fc495e2c( var_94e9dec930dce0a8, searchorigin, var_cfaff5e2d53d4413, vehicleheading )
{
    result = undefined;
    currentnode = var_94e9dec930dce0a8;
    
    while ( !isdefined( result ) )
    {
        if ( !isdefined( currentnode ) || !isdefined( currentnode.target ) )
        {
            break;
        }
        
        nextnode = function_d5de32e196353afe( currentnode.target );
        
        if ( distance2dsquared( searchorigin, nextnode.origin ) < squared( var_cfaff5e2d53d4413 ) )
        {
            currentnode = nextnode;
            continue;
        }
        
        vehiclenodeheading = nextnode.origin - currentnode.origin;
        var_69e497f2f3ca4d34 = nextnode.origin - searchorigin;
        var_43c59b0b0ee771e3 = vectordot2( vehicleheading, vehiclenodeheading );
        var_7804fabc892a1361 = vectordot2( vehicleheading, var_69e497f2f3ca4d34 );
        
        if ( var_43c59b0b0ee771e3 > 0 && var_7804fabc892a1361 < 0 )
        {
            currentnode = nextnode;
            continue;
        }
        
        result = nextnode;
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0xf23163ca, Offset: 0x31dc
// Size: 0xec
function private function_1a2a323483b5dc15( var_8977d39d6839964e, var_187f313073672917 )
{
    result = 0;
    
    foreach ( closestvehiclenode in var_187f313073672917 )
    {
        var_4e9e28158e5f126c = getvehiclenode( closestvehiclenode.var_5262adea3d5fcba3 ).targetname;
        
        if ( level.roads[ var_4e9e28158e5f126c ].connections )
        {
            if ( function_f02c63b99c9614c9( level.roads[ var_4e9e28158e5f126c ].connections, var_8977d39d6839964e ) )
            {
                result = 1;
                break;
            }
        }
    }
    
    return result;
}

/#

    // Namespace vehicle_roads
    // Params 4, eflags: 0x4
    // Checksum 0xc9575298, Offset: 0x32d1
    // Size: 0x158, Type: dev
    function private function_95b21505afdddd54( searchorigin, var_187f313073672917, debugcolor, debugmessage )
    {
        notifyname = "<dev string:x313>" + debugmessage;
        self notify( notifyname );
        self endon( notifyname );
        offset = ( 0, 0, 100 );
        
        while ( true )
        {
            waitframe();
            roadindex = 0;
            
            foreach ( vehiclenode in var_187f313073672917 )
            {
                nodedistance = distance( vehiclenode.origin, searchorigin );
                line( searchorigin + offset, vehiclenode.origin, debugcolor, 1, 0, 1 );
                print3d( searchorigin + offset, "<dev string:x338>" + debugmessage, debugcolor, 1, 1, 1 );
                print3d( vehiclenode.origin + offset, "<dev string:x23f>" + roadindex + "<dev string:x357>" + nodedistance, debugcolor, 1, 1, 1 );
                roadindex++;
            }
        }
    }

#/

// Namespace vehicle_roads
// Params 11, eflags: 0x4
// Checksum 0xb56b96a0, Offset: 0x3431
// Size: 0x114
function private function_d3465c4295cd717c( searchorigin, goalorigin, maxdistance, var_cfaff5e2d53d4413, vehicleheading, var_c8588ac7478dc8c3, skipstartnodes, var_2324545dc6510f0f, debugdraw, debugcolor, debugmessage )
{
    assert( searchorigin && isvector( searchorigin ), "<dev string:x365>" );
    assert( goalorigin && isvector( goalorigin ), "<dev string:x3a2>" );
    var_21e370a618019339 = searchorigin;
    goaldirection = vectornormalize2( goalorigin - searchorigin );
    maxdistancesq = squared( maxdistance );
    result = [];
    
    while ( true )
    {
        result = function_3e6f292cbbccd99c( var_21e370a618019339, maxdistance, var_cfaff5e2d53d4413, vehicleheading, var_c8588ac7478dc8c3, skipstartnodes, var_2324545dc6510f0f, debugdraw, debugcolor, debugmessage );
        
        if ( result.size > 0 || distance2dsquared( var_21e370a618019339, goalorigin ) <= maxdistancesq )
        {
            break;
        }
        
        var_21e370a618019339 += goaldirection * maxdistance;
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 10, eflags: 0x4
// Checksum 0x588e43b1, Offset: 0x354e
// Size: 0x34d
function private function_3e6f292cbbccd99c( searchorigin, maxdistance, var_cfaff5e2d53d4413, vehicleheading, var_c8588ac7478dc8c3, skipstartnodes, var_2324545dc6510f0f, debugdraw, debugcolor, debugmessage )
{
    assert( searchorigin && isvector( searchorigin ), "<dev string:x365>" );
    assert( isdefined( level.roads ) );
    
    if ( !isdefined( level.vehiclenodes ) )
    {
        level.vehiclenodes = utility::create_partition( getallvehiclenodes(), 3500, 1 );
    }
    
    var_ae98ea54b5bb34da = level.vehiclenodes utility::function_822c5feaca90abc1( searchorigin, maxdistance );
    var_ae98ea54b5bb34da = sortbydistance( var_ae98ea54b5bb34da, searchorigin );
    var_ad03c58a6f789f23 = var_cfaff5e2d53d4413 ? squared( var_cfaff5e2d53d4413 ) : undefined;
    var_187f313073672917 = [];
    result = [];
    
    if ( var_ae98ea54b5bb34da.size > 0 )
    {
        foreach ( vehiclenode in var_ae98ea54b5bb34da )
        {
            if ( !isdefined( vehiclenode.var_5262adea3d5fcba3 ) )
            {
                continue;
            }
            
            if ( skipstartnodes && level.roads[ vehiclenode.targetname ] )
            {
                continue;
            }
            
            if ( var_2324545dc6510f0f && !isdefined( vehiclenode.target ) )
            {
                continue;
            }
            
            var_5262adea3d5fcba3 = vehiclenode.var_5262adea3d5fcba3;
            roadstartvehiclenode = getvehiclenode( var_5262adea3d5fcba3 );
            
            if ( level.roads[ roadstartvehiclenode.targetname ].disabled )
            {
                continue;
            }
            
            if ( level.var_2aa90a9ef4e6c7c6 && var_2324545dc6510f0f )
            {
                if ( vehiclenode.targetname == level.roads[ roadstartvehiclenode.targetname ].endkey )
                {
                    continue;
                }
            }
            
            if ( !isdefined( var_187f313073672917[ var_5262adea3d5fcba3 ] ) )
            {
                if ( var_ad03c58a6f789f23 && distance2dsquared( searchorigin, vehiclenode.origin ) < var_ad03c58a6f789f23 )
                {
                    continue;
                }
                
                if ( function_1a2a323483b5dc15( roadstartvehiclenode.targetname, var_187f313073672917 ) )
                {
                    continue;
                }
                
                if ( vehicleheading && vehiclenode.target )
                {
                    nextnode = function_d5de32e196353afe( vehiclenode.target );
                    vehiclenodeheading = nextnode.origin - vehiclenode.origin;
                    var_69e497f2f3ca4d34 = vehiclenode.origin - searchorigin;
                    var_43c59b0b0ee771e3 = vectordot2( vehicleheading, vehiclenodeheading );
                    var_7804fabc892a1361 = vectordot2( vehicleheading, var_69e497f2f3ca4d34 );
                    
                    if ( var_43c59b0b0ee771e3 > 0 && var_7804fabc892a1361 < 0 )
                    {
                        continue;
                    }
                }
                
                var_187f313073672917[ var_5262adea3d5fcba3 ] = vehiclenode;
                result[ result.size ] = vehiclenode;
            }
        }
    }
    
    /#
        if ( debugdraw )
        {
            thread function_95b21505afdddd54( searchorigin, var_187f313073672917, debugcolor, debugmessage );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 1, eflags: 0x4
// Checksum 0x6903b078, Offset: 0x38a4
// Size: 0x58
function private function_1d43376f84a16476( vehiclenode )
{
    assert( isdefined( vehiclenode ) );
    assert( isdefined( level.roads ) );
    result = undefined;
    
    if ( isdefined( vehiclenode.var_5262adea3d5fcba3 ) )
    {
        result = getvehiclenode( vehiclenode.var_5262adea3d5fcba3 );
    }
    
    return result;
}

/#

    // Namespace vehicle_roads
    // Params 1, eflags: 0x4
    // Checksum 0x9d7c65d0, Offset: 0x3905
    // Size: 0xcb, Type: dev
    function private function_717e5a3dace1786d( vehiclenode )
    {
        self notify( "<dev string:x3dd>" );
        self endon( "<dev string:x3dd>" );
        self endon( "<dev string:x3f8>" );
        
        while ( true )
        {
            waitframe();
            debugcolor = ( 0, 0.6, 1 );
            offset = ( 0, 0, 15 );
            line( self.origin + offset, vehiclenode.origin + offset, debugcolor, 0, 0, 1 );
            sphere( vehiclenode.origin + offset, 75, debugcolor, 0, 1 );
            print3d( vehiclenode.origin + offset, "<dev string:x401>" + vehiclenode.targetname, debugcolor, 1, 2, 1 );
        }
    }

#/

// Namespace vehicle_roads
// Params 2
// Checksum 0x325c33d3, Offset: 0x39d8
// Size: 0x8a
function function_256de0610be6fee1( vehiclenode, debugdraw )
{
    self notify( "a036f31ae806cc8d" );
    self endon( "a036f31ae806cc8d" );
    self endon( "death" );
    assert( vehiclenode );
    
    while ( true )
    {
        /#
            if ( debugdraw )
            {
                thread function_717e5a3dace1786d( vehiclenode );
            }
        #/
        
        vehiclenode waittill( "trigger", var_9ea6c782513a7bb2 );
        
        if ( var_9ea6c782513a7bb2 == self )
        {
            /#
                if ( debugdraw )
                {
                    self notify( "<dev string:x3dd>" );
                }
            #/
            
            self.var_94e9dec930dce0a8 = vehiclenode;
            break;
        }
    }
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x1a8f8412, Offset: 0x3a6a
// Size: 0x37
function function_1d5d124423620d81( vehiclenode )
{
    self notify( "3b87e07cea82611" );
    self endon( "3b87e07cea82611" );
    function_256de0610be6fee1( vehiclenode );
    self setconfigvalue( "path", "pause", 1 );
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x1e90351c, Offset: 0x3aa9
// Size: 0x1b
function function_d5de32e196353afe( targetname )
{
    return getvehiclenode( targetname, #targetname );
}

/#

    // Namespace vehicle_roads
    // Params 5
    // Checksum 0x4eba2f84, Offset: 0x3acd
    // Size: 0x224, Type: dev
    function function_79aaa1cb03c55265( startnodetargetnames, var_624e3db72c1e28b, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 )
    {
        if ( !isdefined( level.roads ) )
        {
            level.roads = [];
        }
        
        if ( !isdefined( level.var_cbffedb9ee41c670 ) )
        {
            level.var_cbffedb9ee41c670 = [];
        }
        
        if ( !isdefined( level.var_c04a3381e31d618b ) || var_624e3db72c1e28b )
        {
            level.var_c04a3381e31d618b = [];
        }
        
        if ( !isdefined( level.var_590fc06b263f99dc ) )
        {
            level.var_590fc06b263f99dc = [];
        }
        
        if ( !isdefined( level.var_2d49d8a06d62313c ) )
        {
            level.var_2d49d8a06d62313c = [];
            function_efcfd353d4a53d5b();
        }
        
        if ( var_6d326efa2b9d6677 )
        {
            level.var_85cb7e571f2fa9ab = [];
            level.var_40c7a94c6037d9b4 = [];
            level.roadsoutput = [];
            level.connectionsoutput = [];
        }
        
        uniquenamestring = getmatchstarttimeutc();
        
        if ( !uniquenamestring )
        {
            uniquenamestring = randomintrange( 1, 10000 );
        }
        
        level.var_2ac6c688b6c64715 = openfile( "<dev string:x417>" + level.mapname + "<dev string:x42b>" + uniquenamestring + "<dev string:x436>", "<dev string:x43e>" );
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x448>" );
        
        foreach ( startnodetargetname in startnodetargetnames )
        {
            function_398eef1e3adddd4f( startnodetargetname, var_624e3db72c1e28b, var_6d326efa2b9d6677, 0, debugdraw, var_26f80580d6c058c5 );
            waitframe();
        }
        
        if ( var_6d326efa2b9d6677 )
        {
            function_2bdcf2c1a54ec800();
            function_a98823b5193d96e4();
        }
        
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x488>" + level.var_cbffedb9ee41c670.size );
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x4af>" );
        function_9425451336d717f();
        fileid = closefile( level.var_2ac6c688b6c64715 );
    }

    // Namespace vehicle_roads
    // Params 6, eflags: 0x4
    // Checksum 0xb2b40541, Offset: 0x3cf9
    // Size: 0x115, Type: dev
    function private function_398eef1e3adddd4f( startnodetargetname, var_624e3db72c1e28b, var_6d326efa2b9d6677, outputtargetname, debugdraw, var_26f80580d6c058c5 )
    {
        level notify( "<dev string:x4ed>" );
        
        if ( outputtargetname )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x50e>" );
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x558>" + startnodetargetname );
        }
        
        level.recursioncount = 0;
        level.var_7a2c2c84a106e2c3 = 0;
        level.var_6779a56d21feef71 = 0;
        level.var_6287a1f1e9ba75c6 = [];
        function_f1d028a88164b0a( startnodetargetname, 0, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 );
        
        if ( outputtargetname )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x57d>" + level.var_6779a56d21feef71 + "<dev string:x58e>" + level.var_7a2c2c84a106e2c3 );
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x599>" );
        }
        
        level.recursioncount = undefined;
        level.var_7a2c2c84a106e2c3 = 0;
        level.var_6779a56d21feef71 = 0;
        level.var_6287a1f1e9ba75c6 = [];
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x378aa635, Offset: 0x3e16
    // Size: 0x44, Type: dev
    function private getmatchstarttimeutc()
    {
        if ( getdvarint( @"online_matchdata_enabled" ) == 0 )
        {
            return level.starttimeutcseconds;
        }
        
        return utility::callsharedfunc( #"game", #"getmatchdata", "<dev string:x5e1>", "<dev string:x5f4>" );
    }

    // Namespace vehicle_roads
    // Params 2
    // Checksum 0x7563901c, Offset: 0x3e62
    // Size: 0x3e, Type: dev
    function function_9425451336d717f( startnodetargetname, debugdraw )
    {
        level notify( "<dev string:x4ed>" );
        level.var_cbffedb9ee41c670 = undefined;
        level.var_c04a3381e31d618b = undefined;
        level.var_590fc06b263f99dc = undefined;
    }

    // Namespace vehicle_roads
    // Params 5, eflags: 0x4
    // Checksum 0x536bd92e, Offset: 0x3ea8
    // Size: 0x519, Type: dev
    function private function_f1d028a88164b0a( startnodetargetname, var_9d8204c4caf4d047, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 )
    {
        if ( isdefined( level.var_2d49d8a06d62313c ) && isdefined( function_f02c63b99c9614c9( level.var_2d49d8a06d62313c, startnodetargetname ) ) )
        {
            return;
        }
        
        splinestartnode = function_d5de32e196353afe( startnodetargetname );
        
        if ( !isdefined( splinestartnode ) )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x608>" + startnodetargetname );
            return;
        }
        
        level.var_c04a3381e31d618b[ startnodetargetname ] = level.var_c04a3381e31d618b[ startnodetargetname ] ? level.var_c04a3381e31d618b[ startnodetargetname ] + 1 : 1;
        var_ee5c3878b106067a = spawnstruct();
        
        if ( var_6d326efa2b9d6677 )
        {
            function_2683d87a28296d03( startnodetargetname, var_ee5c3878b106067a );
        }
        else
        {
            function_c1a11db30bf2480e( startnodetargetname, var_ee5c3878b106067a );
        }
        
        var_755df835f76897b0 = 0;
        
        if ( var_ee5c3878b106067a.connections.size > 0 )
        {
            if ( var_6d326efa2b9d6677 )
            {
                assert( var_ee5c3878b106067a.connections.size <= 3 );
            }
            
            connectionsstring = "<dev string:x633>";
            
            for ( connectionindex = 0; connectionindex < var_ee5c3878b106067a.connections.size ; connectionindex++ )
            {
                if ( !var_ee5c3878b106067a.connections[ connectionindex ] )
                {
                    continue;
                }
                
                if ( connectionindex > 0 )
                {
                    connectionsstring += "<dev string:x63a>";
                }
                
                connectionsstring += var_ee5c3878b106067a.connections[ connectionindex ];
            }
            
            connectionsstring += "<dev string:x642>";
            
            if ( !isdefined( level.var_cbffedb9ee41c670[ startnodetargetname ] ) )
            {
                var_755df835f76897b0++;
                level.var_cbffedb9ee41c670[ startnodetargetname ] = 1;
                
                if ( var_6d326efa2b9d6677 )
                {
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x649>" + startnodetargetname + "<dev string:x672>" + var_ee5c3878b106067a.var_ab3915e451d72b25 + "<dev string:x679>" + var_ee5c3878b106067a.endkey + "<dev string:x672>" + connectionsstring + "<dev string:x680>" );
                    level.roadsoutput[ startnodetargetname ] = 1;
                    
                    foreach ( connectiontargetname in var_ee5c3878b106067a.connections )
                    {
                        if ( connectiontargetname )
                        {
                            level.connectionsoutput = arraycombineunique( level.connectionsoutput, [ connectiontargetname ] );
                        }
                    }
                }
                else
                {
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x687>" + startnodetargetname + "<dev string:x672>" + connectionsstring + "<dev string:x680>" );
                }
            }
            
            if ( debugdraw )
            {
                if ( var_26f80580d6c058c5 > 0 )
                {
                    wait var_26f80580d6c058c5;
                }
                
                level thread function_1ceeee887e2dc5e8( splinestartnode );
            }
            
            foreach ( connectionindex, connectiontargetname in var_ee5c3878b106067a.connections )
            {
                if ( !isdefined( level.var_c04a3381e31d618b[ connectiontargetname ] ) )
                {
                    var_9d8204c4caf4d047++;
                    level.recursioncount++;
                    
                    if ( var_9d8204c4caf4d047 > 50 || level.recursioncount > 50 )
                    {
                        level.var_6287a1f1e9ba75c6[ level.var_6287a1f1e9ba75c6.size ] = connectiontargetname;
                        continue;
                    }
                    
                    if ( level.recursioncount > level.var_7a2c2c84a106e2c3 )
                    {
                        level.var_7a2c2c84a106e2c3 = level.recursioncount;
                    }
                    
                    if ( var_9d8204c4caf4d047 > level.var_6779a56d21feef71 )
                    {
                        level.var_6779a56d21feef71 = var_9d8204c4caf4d047;
                    }
                    
                    if ( debugdraw )
                    {
                        if ( var_26f80580d6c058c5 > 0 )
                        {
                            wait var_26f80580d6c058c5;
                        }
                        
                        level thread function_789eebef8abc2637( splinestartnode, connectiontargetname );
                    }
                    
                    if ( var_6d326efa2b9d6677 )
                    {
                        function_f1d028a88164b0a( var_ee5c3878b106067a.endkey, var_9d8204c4caf4d047, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 );
                        continue;
                    }
                    
                    function_f1d028a88164b0a( connectiontargetname, var_9d8204c4caf4d047, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 );
                }
            }
        }
        else
        {
            if ( debugdraw )
            {
                if ( var_26f80580d6c058c5 > 0 )
                {
                    wait var_26f80580d6c058c5;
                }
                
                level thread function_1ceeee887e2dc5e8( splinestartnode );
            }
            
            if ( !isdefined( level.var_cbffedb9ee41c670[ startnodetargetname ] ) )
            {
                var_755df835f76897b0++;
                level.var_cbffedb9ee41c670[ startnodetargetname ] = 1;
                
                if ( var_6d326efa2b9d6677 )
                {
                    assert( var_ee5c3878b106067a.endkey, "<dev string:x6ac>" );
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x649>" + startnodetargetname + "<dev string:x672>" + var_ee5c3878b106067a.var_ab3915e451d72b25 + "<dev string:x679>" + var_ee5c3878b106067a.endkey + "<dev string:x6d6>" );
                    level.roadsoutput[ startnodetargetname ] = 1;
                }
                else
                {
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x687>" + startnodetargetname + "<dev string:x6d6>" );
                }
            }
        }
        
        if ( var_9d8204c4caf4d047 == 0 && var_755df835f76897b0 == 0 )
        {
            level.var_590fc06b263f99dc = arraycombineunique( level.var_590fc06b263f99dc, [ startnodetargetname ] );
        }
        
        level.recursioncount--;
    }

    // Namespace vehicle_roads
    // Params 5, eflags: 0x4
    // Checksum 0x34406743, Offset: 0x43c9
    // Size: 0x124, Type: dev
    function private function_3daa50fd657bd243( splineendnode, var_5d94e00d5687d985, var_a46673569c1678ca, var_a01c77d01d9721b5, var_99f43506d94fcbad )
    {
        result = 0;
        connectiondistancesq = length2dsquared( var_99f43506d94fcbad.origin - splineendnode.origin );
        
        if ( connectiondistancesq < 810000 )
        {
            var_c2df213a82cc675a = function_d5de32e196353afe( var_99f43506d94fcbad.target );
            connectionheading = vectornormalize2( var_c2df213a82cc675a.origin - var_99f43506d94fcbad.origin );
            var_459c03987163b47b = vectordot2( var_5d94e00d5687d985, connectionheading );
            
            if ( var_459c03987163b47b > var_a46673569c1678ca )
            {
                connectiondirection = vectornormalize2( var_99f43506d94fcbad.origin - splineendnode.origin );
                var_b56ec0f432c9e38 = vectordot2( var_5d94e00d5687d985, connectiondirection );
                
                if ( var_b56ec0f432c9e38 > var_a01c77d01d9721b5 )
                {
                    var_f13786ee5dc9bca0 = vectordot2( connectiondirection, connectionheading );
                    
                    if ( var_f13786ee5dc9bca0 > var_a01c77d01d9721b5 )
                    {
                        result = 1;
                    }
                }
            }
        }
        
        return result;
    }

    // Namespace vehicle_roads
    // Params 2, eflags: 0x4
    // Checksum 0x9797e787, Offset: 0x44f5
    // Size: 0x1b4, Type: dev
    function private function_c1a11db30bf2480e( startnodetargetname, var_ee5c3878b106067a )
    {
        var_ee5c3878b106067a.connections = [];
        result = 0;
        splinestartnode = function_d5de32e196353afe( startnodetargetname );
        currentnode = splinestartnode;
        currentnodedirection = undefined;
        splineendnode = undefined;
        
        while ( true )
        {
            splineendnode = function_d5de32e196353afe( currentnode.target );
            
            if ( splineendnode == splinestartnode )
            {
                return result;
            }
            
            if ( !isdefined( splineendnode.target ) )
            {
                currentnodedirection = vectornormalize2( splineendnode.origin - currentnode.origin );
                break;
            }
            
            currentnode = splineendnode;
        }
        
        var_a46673569c1678ca = cos( 135 );
        var_a01c77d01d9721b5 = cos( 120 );
        vehiclenodes = getallvehiclenodes();
        
        for ( nodeindex = 0; nodeindex < vehiclenodes.size ; nodeindex++ )
        {
            var_99f43506d94fcbad = vehiclenodes[ nodeindex ];
            
            if ( var_99f43506d94fcbad.spawnflags == 0 )
            {
                continue;
            }
            
            if ( !isdefined( var_99f43506d94fcbad.target ) )
            {
                continue;
            }
            
            if ( isdefined( level.var_2d49d8a06d62313c ) && isdefined( function_f02c63b99c9614c9( level.var_2d49d8a06d62313c, var_99f43506d94fcbad.targetname ) ) )
            {
                continue;
            }
            
            if ( var_99f43506d94fcbad.targetname == startnodetargetname )
            {
                continue;
            }
            
            if ( function_3daa50fd657bd243( splineendnode, currentnodedirection, var_a46673569c1678ca, var_a01c77d01d9721b5, var_99f43506d94fcbad ) )
            {
                var_ee5c3878b106067a.connections[ var_ee5c3878b106067a.connections.size ] = var_99f43506d94fcbad.targetname;
            }
        }
        
        return result;
    }

    // Namespace vehicle_roads
    // Params 2, eflags: 0x4
    // Checksum 0x1178dec8, Offset: 0x46b1
    // Size: 0x35c, Type: dev
    function private function_2683d87a28296d03( nodetargetname, var_ee5c3878b106067a )
    {
        assert( isdefined( level.var_67119a9659b67e6d ), "<dev string:x6de>" );
        assert( isdefined( level.var_57587d488f0edd2f ), "<dev string:x740>" );
        assert( isdefined( nodetargetname ) );
        var_ee5c3878b106067a.endkey = undefined;
        var_ee5c3878b106067a.connections = [];
        var_4ca26a6b565d1f87 = function_d5de32e196353afe( nodetargetname );
        
        if ( !isdefined( var_4ca26a6b565d1f87 ) )
        {
            assert( var_4ca26a6b565d1f87, "<dev string:x7a2>" + nodetargetname + "<dev string:x7d1>" );
            return;
        }
        
        var_647dcaaadd4b5a0d = getvehiclenodeindex( nodetargetname, #targetname );
        var_ab3915e451d72b25 = 0;
        currentvehiclenode = var_4ca26a6b565d1f87;
        prevvehiclenode = undefined;
        var_71cbdedca6019172 = 0;
        
        while ( isdefined( currentvehiclenode.target ) )
        {
            prevvehiclenode = currentvehiclenode;
            currentvehiclenode = function_d5de32e196353afe( currentvehiclenode.target );
            
            if ( prevvehiclenode )
            {
                var_71cbdedca6019172 += distance( prevvehiclenode.origin, currentvehiclenode.origin );
            }
            
            if ( currentvehiclenode.target2 || currentvehiclenode.target3 )
            {
                assert( currentvehiclenode.target, "<dev string:x7e0>" + currentvehiclenode.targetname + "<dev string:x2b9>" );
                connectionstartnode = function_d5de32e196353afe( currentvehiclenode.target );
                assert( connectionstartnode );
                var_ee5c3878b106067a.connections[ 0 ] = currentvehiclenode.targetname;
                
                if ( currentvehiclenode.target2 )
                {
                    assert( currentvehiclenode.target, "<dev string:x7e0>" + currentvehiclenode.targetname + "<dev string:x807>" );
                    connectionstartnode = function_d5de32e196353afe( currentvehiclenode.target2 );
                    
                    if ( connectionstartnode )
                    {
                        var_ee5c3878b106067a.connections[ 1 ] = connectionstartnode.targetname;
                    }
                    else
                    {
                        level.var_85cb7e571f2fa9ab[ level.var_85cb7e571f2fa9ab.size ] = currentvehiclenode.target2;
                    }
                }
                
                if ( currentvehiclenode.target3 )
                {
                    if ( !var_ee5c3878b106067a.connections[ 1 ] )
                    {
                        var_ee5c3878b106067a.connections[ 1 ] = undefined;
                    }
                    
                    connectionstartnode = function_d5de32e196353afe( currentvehiclenode.target3 );
                    
                    if ( connectionstartnode )
                    {
                        var_ee5c3878b106067a.connections[ 2 ] = connectionstartnode.targetname;
                    }
                    else
                    {
                        level.var_40c7a94c6037d9b4[ level.var_40c7a94c6037d9b4.size ] = currentvehiclenode.target3;
                    }
                }
                
                assert( arraycontains( level.var_67119a9659b67e6d, currentvehiclenode ) );
                break;
            }
            
            if ( arraycontains( level.var_57587d488f0edd2f, currentvehiclenode ) )
            {
                assert( currentvehiclenode.target, "<dev string:x7e0>" + currentvehiclenode.targetname + "<dev string:x807>" );
                var_ee5c3878b106067a.connections[ 0 ] = currentvehiclenode.targetname;
                break;
            }
        }
        
        var_ee5c3878b106067a.var_ab3915e451d72b25 = var_71cbdedca6019172;
        var_ee5c3878b106067a.endkey = currentvehiclenode.targetname;
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0xa74cac99, Offset: 0x4a15
    // Size: 0xf8, Type: dev
    function function_f19bb03dc3a51efe()
    {
        allvehiclenodes = getallvehiclenodes();
        result = [];
        
        foreach ( vehiclenode in allvehiclenodes )
        {
            if ( vehiclenode.target2 && !vehiclenode.target )
            {
                result[ result.size ] = vehiclenode.targetname;
            }
            
            if ( vehiclenode.target3 && ( !vehiclenode.target2 || !vehiclenode.target ) )
            {
                result[ result.size ] = vehiclenode.targetname;
            }
        }
        
        return result;
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x6c8af387, Offset: 0x4b15
    // Size: 0x181, Type: dev
    function private function_efcfd353d4a53d5b()
    {
        allvehiclenodes = getallvehiclenodes();
        vehiclestartnodes = [];
        
        foreach ( vehiclenode in allvehiclenodes )
        {
            if ( !isdefined( vehiclenode.targetname ) || vehiclenode.spawnflags == 0 )
            {
                continue;
            }
            
            if ( isdefined( vehiclestartnodes[ vehiclenode.targetname ] ) )
            {
                vehiclestartnodes[ vehiclenode.targetname ] += 1;
                continue;
            }
            
            vehiclestartnodes[ vehiclenode.targetname ] = 1;
        }
        
        duplicatetargetnames = [];
        
        foreach ( vehiclenodetargetname, targetnamecount in vehiclestartnodes )
        {
            if ( targetnamecount > 1 )
            {
                duplicatetargetnames[ duplicatetargetnames.size ] = vehiclenodetargetname;
            }
        }
        
        if ( duplicatetargetnames.size > 0 )
        {
            level.var_2d49d8a06d62313c = duplicatetargetnames;
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x2131bd46, Offset: 0x4c9e
    // Size: 0xc6, Type: dev
    function private function_724071863068c117()
    {
        if ( level.var_2d49d8a06d62313c.size > 0 )
        {
            var_f954e692cd8aa19f = "<dev string:x23f>";
            
            foreach ( index, vehiclenodetargetname in level.var_2d49d8a06d62313c )
            {
                if ( index == 0 )
                {
                    var_f954e692cd8aa19f += vehiclenodetargetname;
                    continue;
                }
                
                var_f954e692cd8aa19f += "<dev string:x827>" + vehiclenodetargetname;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x82d>" + var_f954e692cd8aa19f );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x158f68c6, Offset: 0x4d6c
    // Size: 0xc6, Type: dev
    function private function_756daa27d2758d7e()
    {
        if ( level.var_6287a1f1e9ba75c6.size > 0 )
        {
            var_3862ccadd1c38270 = "<dev string:x23f>";
            
            foreach ( index, vehiclenodetargetname in level.var_6287a1f1e9ba75c6 )
            {
                if ( index == 0 )
                {
                    var_3862ccadd1c38270 += vehiclenodetargetname;
                    continue;
                }
                
                var_3862ccadd1c38270 += "<dev string:x827>" + vehiclenodetargetname;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x853>" + var_3862ccadd1c38270 );
        }
    }

    // Namespace vehicle_roads
    // Params 1, eflags: 0x4
    // Checksum 0x5e02fd2f, Offset: 0x4e3a
    // Size: 0x111, Type: dev
    function private function_97b65653c95d883d( startnodetargetnames )
    {
        if ( startnodetargetnames && startnodetargetnames.size > 0 && level.var_590fc06b263f99dc && level.var_590fc06b263f99dc.size > 0 )
        {
            var_96c43fae8bdee0b2 = arraydifference( startnodetargetnames, level.var_590fc06b263f99dc );
            var_a5ee6d03bec1bb17 = "<dev string:x23f>";
            
            foreach ( index, vehiclenodetargetname in var_96c43fae8bdee0b2 )
            {
                if ( index == 0 )
                {
                    var_a5ee6d03bec1bb17 += "<dev string:x882>" + vehiclenodetargetname + "<dev string:x882>";
                    continue;
                }
                
                var_a5ee6d03bec1bb17 += "<dev string:x679>" + vehiclenodetargetname + "<dev string:x882>";
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x887>" + var_a5ee6d03bec1bb17 );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x38db30f9, Offset: 0x4f53
    // Size: 0x167, Type: dev
    function private function_2bdcf2c1a54ec800()
    {
        if ( level.var_85cb7e571f2fa9ab )
        {
            invalidtargetstring = "<dev string:x23f>";
            
            foreach ( index, invalidtarget in level.var_85cb7e571f2fa9ab )
            {
                if ( index == 0 )
                {
                    invalidtargetstring += invalidtarget;
                    continue;
                }
                
                invalidtargetstring += "<dev string:x827>" + invalidtarget;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x8b8>" + invalidtargetstring );
        }
        
        if ( level.var_40c7a94c6037d9b4 )
        {
            invalidtargetstring = "<dev string:x23f>";
            
            foreach ( index, invalidtarget in level.var_40c7a94c6037d9b4 )
            {
                if ( index == 0 )
                {
                    invalidtargetstring += invalidtarget;
                    continue;
                }
                
                invalidtargetstring += "<dev string:x827>" + invalidtarget;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x8dc>" + invalidtargetstring );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0xecdb0543, Offset: 0x50c2
    // Size: 0x98, Type: dev
    function private function_a98823b5193d96e4()
    {
        foreach ( connectiontargetname in level.connectionsoutput )
        {
            assert( isdefined( level.roadsoutput[ connectiontargetname ] ), "<dev string:x900>" + connectiontargetname + "<dev string:x925>" );
        }
    }

#/

// Namespace vehicle_roads
// Params 1, eflags: 0x4
// Checksum 0x10b15008, Offset: 0x5162
// Size: 0x47
function private function_4d7349201f8b39f8( nodename )
{
    node = spawnstruct();
    node.key = nodename;
    node.connections = [];
    level.roads[ nodename ] = node;
    return node;
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0xfe2c11c3, Offset: 0x51b2
// Size: 0x89
function private function_e170b782e02a9da9( nodename, connectionname )
{
    assert( isdefined( function_d5de32e196353afe( connectionname ) ), "<dev string:x958>" + connectionname + "<dev string:x7d1>" );
    level.roads[ nodename ].connections[ level.roads[ nodename ].connections.size ] = connectionname;
    
    if ( !isdefined( level.roads[ connectionname ] ) )
    {
        connectionnode = function_4d7349201f8b39f8( connectionname );
    }
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x4cdb8c94, Offset: 0x5243
// Size: 0x25f
function function_674c4d46af7f9ea9( nodetargetname, nodeconnections )
{
    if ( !isdefined( level.roads ) )
    {
        level.roads = [];
        level.var_4bfe0bc400b10439 = [];
        level.var_347348da9d796fe7 = 1;
    }
    
    assert( isdefined( nodetargetname ) );
    var_4ca26a6b565d1f87 = function_d5de32e196353afe( nodetargetname );
    var_647dcaaadd4b5a0d = getvehiclenodeindex( nodetargetname, #targetname );
    assert( isdefined( var_4ca26a6b565d1f87 ), "<dev string:x7a2>" + nodetargetname + "<dev string:x7d1>" );
    
    if ( isdefined( var_4ca26a6b565d1f87 ) )
    {
        node = level.roads[ nodetargetname ];
        
        if ( !isdefined( node ) )
        {
            node = function_4d7349201f8b39f8( nodetargetname );
        }
        
        var_ab3915e451d72b25 = 0;
        currentvehiclenode = var_4ca26a6b565d1f87;
        currentvehiclenode.var_5262adea3d5fcba3 = var_647dcaaadd4b5a0d;
        prevvehiclenode = undefined;
        
        while ( isdefined( currentvehiclenode.target ) )
        {
            prevvehiclenode = currentvehiclenode;
            currentvehiclenode = function_d5de32e196353afe( currentvehiclenode.target );
            currentvehiclenode.var_5262adea3d5fcba3 = var_647dcaaadd4b5a0d;
            
            if ( isdefined( prevvehiclenode ) )
            {
                var_ab3915e451d72b25 += distance( prevvehiclenode.origin, currentvehiclenode.origin );
            }
        }
        
        level.var_4bfe0bc400b10439[ currentvehiclenode.targetname ] = nodetargetname;
        node.var_ab3915e451d72b25 = var_ab3915e451d72b25;
        node.endkey = currentvehiclenode.targetname;
        
        if ( isdefined( nodeconnections ) )
        {
            foreach ( connection in nodeconnections )
            {
                function_e170b782e02a9da9( nodetargetname, connection );
            }
        }
        
        /#
            convoy = "<dev string:x97a>" + nodetargetname;
            single = "<dev string:x985>" + nodetargetname;
            adddebugcommand( "<dev string:x990>" + nodetargetname + "<dev string:x9cb>" + single + "<dev string:x9e7>" );
            adddebugcommand( "<dev string:x9ed>" + nodetargetname + "<dev string:x9cb>" + convoy + "<dev string:x9e7>" );
        #/
    }
}

/#

    // Namespace vehicle_roads
    // Params 1
    // Checksum 0xd7dc9e53, Offset: 0x54aa
    // Size: 0x169, Type: dev
    function function_8437fc8203abb755( vehiclenavmeshlayer )
    {
        self endon( "<dev string:xa28>" );
        duration = 400;
        textverticaloffset = 15;
        
        if ( utility::issp() )
        {
            var_af2b0500d15056d9 = getdvarint( @"hash_4e06d4ff70605269", 0 );
            print3d( self.origin, "<dev string:xa38>" + var_af2b0500d15056d9, ( 1, 1, 1 ), 1, 1, duration );
        }
        
        navmeshlayer = vehiclenavmeshlayer ?? "<dev string:xa57>";
        speedmph = undefined;
        
        if ( self hascomponent( "<dev string:xa62>" ) )
        {
            speedmph = self function_24e10bf6894fa869( "<dev string:xa62>", "<dev string:xa69>" ) * 0.056818;
        }
        else if ( self hascomponent( "<dev string:xa78>" ) )
        {
            speedmph = self function_24e10bf6894fa869( "<dev string:xa7f>", "<dev string:xa87>" ) * 0.056818;
        }
        
        var_d1b86c0732a152e0 = getdvarint( @"hash_b0706332ae0689bc", 1 );
        print3d( self.origin + ( 0, 0, textverticaloffset * 3 ), "<dev string:xa96>" + navmeshlayer + "<dev string:xaa7>" + speedmph, ( 1, 1, 1 ), 1, 1, duration );
        print3d( self.origin + ( 0, 0, textverticaloffset ), "<dev string:xab2>" + var_d1b86c0732a152e0, ( 1, 1, 1 ), 1, 1, duration );
    }

    // Namespace vehicle_roads
    // Params 2
    // Checksum 0x961a2ff6, Offset: 0x561b
    // Size: 0x96, Type: dev
    function function_2b723e6a5a86a006( splinepoints, pathcolor )
    {
        self notify( "b5b35676ba163151" );
        self endon( "b5b35676ba163151" );
        self endon( "<dev string:x3f8>" );
        self endon( "<dev string:xa28>" );
        
        while ( true )
        {
            waitframe();
            sphere( splinepoints[ 0 ], 5, pathcolor, 0, 1 );
            
            if ( !isdefined( pathcolor ) )
            {
                pathcolor = ( 1, 1, 1 );
            }
            
            for ( index = 1; index < splinepoints.size ; index++ )
            {
                line( splinepoints[ index - 1 ], splinepoints[ index ], pathcolor, 1, 0, 1 );
            }
        }
    }

    // Namespace vehicle_roads
    // Params 3, eflags: 0x4
    // Checksum 0x472265e, Offset: 0x56b9
    // Size: 0xfa, Type: dev
    function private function_773b3991cba8bcd1( road, vehicleendnode, var_ffa77065c35c927f )
    {
        if ( isdefined( road.connections ) )
        {
            foreach ( connectionnode in road.connections )
            {
                connectionvehiclenode = function_d5de32e196353afe( connectionnode );
                assert( isdefined( connectionvehiclenode ), "<dev string:x958>" + connectionnode + "<dev string:x7d1>" );
                line( vehicleendnode.origin, connectionvehiclenode.origin, ( 1, 0.65, 0 ), 1, 0, var_ffa77065c35c927f );
            }
        }
    }

    // Namespace vehicle_roads
    // Params 8
    // Checksum 0xfa0e2c7a, Offset: 0x57bb
    // Size: 0x177, Type: dev
    function function_e79d9bfa12a8d0ff( startnode, nodeoffset, roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, var_4fd2ba081528d08e, var_4fd2b9081528ce5b, var_dfbdb69003a1b65d )
    {
        assert( isdefined( startnode ) );
        
        if ( !isdefined( var_ffa77065c35c927f ) )
        {
            var_ffa77065c35c927f = 1;
        }
        
        if ( !isdefined( var_553d47d9b2d39dda ) )
        {
            var_553d47d9b2d39dda = 1;
        }
        
        var_553d47d9b2d39dda = min( 1, var_553d47d9b2d39dda );
        previousnode = startnode;
        nextnode = function_d5de32e196353afe( startnode.target );
        
        for ( var_792739c70ea7c028 = roadcolor; startnode != nextnode ; var_792739c70ea7c028 = roadcolor )
        {
            if ( !isdefined( nextnode ) )
            {
                break;
            }
            
            line( previousnode.origin + nodeoffset, nextnode.origin + nodeoffset, var_792739c70ea7c028, 1, 0, var_ffa77065c35c927f );
            
            if ( !isdefined( nextnode.target ) )
            {
                break;
            }
            
            previousnode = nextnode;
            
            for ( numsteps = 0; numsteps < var_553d47d9b2d39dda ; numsteps++ )
            {
                if ( !isdefined( nextnode.target ) )
                {
                    break;
                }
                
                nextnode = function_d5de32e196353afe( nextnode.target );
            }
            
            if ( var_4fd2ba081528d08e && previousnode.targetname == var_4fd2ba081528d08e )
            {
                var_792739c70ea7c028 = var_dfbdb69003a1b65d;
                continue;
            }
            
            if ( var_4fd2b9081528ce5b && previousnode.targetname == var_4fd2b9081528ce5b )
            {
            }
        }
        
        return nextnode;
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0xd5bfc11d, Offset: 0x593a
    // Size: 0x73, Type: dev
    function function_38bcfc0e39bb2fda()
    {
        self notify( "df488dfba9642459" );
        self endon( "df488dfba9642459" );
        self endon( "<dev string:xad8>" );
        self endon( "<dev string:x3f8>" );
        
        while ( true )
        {
            waitframe();
            line( self.origin + ( 0, 0, 200 ), self.origin + ( 0, 0, 2048 ), ( 1, 0, 0 ), 1, 0, 1 );
        }
    }

    // Namespace vehicle_roads
    // Params 3
    // Checksum 0xd04339a6, Offset: 0x59b5
    // Size: 0x302, Type: dev
    function function_ccc37c74c8357da7( var_5e0b5b09c7d63725, startnodetargetname, goalnodetargetname )
    {
        if ( !isdefined( startnodetargetname ) )
        {
            startnodetargetname = undefined;
        }
        
        if ( !isdefined( goalnodetargetname ) )
        {
            goalnodetargetname = undefined;
        }
        
        self notify( "<dev string:xad8>" );
        self endon( "<dev string:xad8>" );
        self endon( "<dev string:x3f8>" );
        var_ffa77065c35c927f = 10;
        waitduration = max( var_ffa77065c35c927f - 1, 1 ) * 0.05;
        var_553d47d9b2d39dda = 1;
        pathoffset = ( 0, 0, 100 );
        pathcolor = ( 1, 1, 0 );
        var_157569322bb6e6e3 = ( 1, 0.6, 0 );
        thread function_38bcfc0e39bb2fda();
        
        while ( true )
        {
            wait waitduration;
            
            for ( roadindex = 0; roadindex < var_5e0b5b09c7d63725.size ; roadindex++ )
            {
                roadstartvehiclenode = var_5e0b5b09c7d63725[ roadindex ];
                
                if ( isstruct( roadstartvehiclenode ) )
                {
                    continue;
                }
                
                if ( roadstartvehiclenode.target )
                {
                    endnode = undefined;
                    
                    if ( startnodetargetname && roadindex == 0 && roadstartvehiclenode.targetname != startnodetargetname )
                    {
                        if ( level.var_2aa90a9ef4e6c7c6 )
                        {
                            road = level.roads[ roadstartvehiclenode.targetname ];
                            endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, startnodetargetname, goalnodetargetname, pathcolor );
                        }
                        else
                        {
                            endnode = function_e79d9bfa12a8d0ff( roadstartvehiclenode, pathoffset, var_157569322bb6e6e3, var_ffa77065c35c927f, var_553d47d9b2d39dda, startnodetargetname, goalnodetargetname, pathcolor );
                        }
                    }
                    else if ( goalnodetargetname && roadindex == var_5e0b5b09c7d63725.size - 1 )
                    {
                        if ( level.var_2aa90a9ef4e6c7c6 )
                        {
                            road = level.roads[ roadstartvehiclenode.targetname ];
                            endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, goalnodetargetname, undefined, var_157569322bb6e6e3 );
                        }
                        else
                        {
                            endnode = function_e79d9bfa12a8d0ff( roadstartvehiclenode, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, goalnodetargetname, undefined, var_157569322bb6e6e3 );
                        }
                    }
                    else if ( level.var_2aa90a9ef4e6c7c6 )
                    {
                        road = level.roads[ roadstartvehiclenode.targetname ];
                        endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
                    }
                    else
                    {
                        endnode = function_e79d9bfa12a8d0ff( roadstartvehiclenode, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
                    }
                    
                    if ( endnode && roadindex + 1 < var_5e0b5b09c7d63725.size && !isstruct( var_5e0b5b09c7d63725[ roadindex + 1 ] ) && !level.var_2aa90a9ef4e6c7c6 )
                    {
                        var_e7d6815f353c02b5 = getvehiclenode( var_5e0b5b09c7d63725[ roadindex + 1 ].var_5262adea3d5fcba3 );
                        line( endnode.origin + pathoffset, var_e7d6815f353c02b5.origin + pathoffset, ( 1, 0.8, 0.1 ), 1, 0, var_ffa77065c35c927f );
                    }
                }
            }
        }
    }

    // Namespace vehicle_roads
    // Params 2
    // Checksum 0x3ad4e39d, Offset: 0x5cbf
    // Size: 0x19f, Type: dev
    function function_86e92f70942a3e4( drawconnections, var_553d47d9b2d39dda )
    {
        level notify( "<dev string:xaf0>" );
        level endon( "<dev string:xaf0>" );
        var_ffa77065c35c927f = 60;
        waitduration = max( var_ffa77065c35c927f - 2, 1 ) * 0.05;
        
        while ( true )
        {
            wait waitduration;
            
            if ( !isdefined( level.roads ) )
            {
                continue;
            }
            
            foreach ( road in level.roads )
            {
                vehiclenode = function_d5de32e196353afe( road.key );
                print3d( vehiclenode.origin, road.key + "<dev string:xb04>" + vehiclenode.var_5262adea3d5fcba3, ( 1, 1, 1 ), 1, 1, var_ffa77065c35c927f );
                roadcolor = !road.disabled ? ( 0.5, 0, 0.5 ) : ( 1, 0, 0 );
                endnode = function_e79d9bfa12a8d0ff( vehiclenode, ( 0, 0, 0 ), roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
                
                if ( drawconnections )
                {
                    function_773b3991cba8bcd1( road, endnode, var_ffa77065c35c927f );
                }
            }
        }
    }

    // Namespace vehicle_roads
    // Params 3
    // Checksum 0x5e847139, Offset: 0x5e66
    // Size: 0x2aa, Type: dev
    function function_46e7fc115379abb2( speedmph, vehiclenavmeshlayer, debugdraw )
    {
        self notify( "9b713faaefc25ee" );
        self endon( "9b713faaefc25ee" );
        self endon( "<dev string:x3f8>" );
        minradius = 500;
        maxradius = 1200;
        var_1d748eca4605b943 = 150;
        var_9e106aa74effb825 = 1500;
        var_30459f336f7c69d = 4000;
        
        while ( true )
        {
            enemy = level.players[ 0 ];
            
            if ( !isdefined( enemy ) )
            {
                waitframe();
                continue;
            }
            
            if ( !isdefined( self.attackpoint ) )
            {
                tacpoint = function_7e25aae1cb61ea83( enemy.origin, enemy.origin, minradius, maxradius, var_1d748eca4605b943 );
                
                if ( !isdefined( tacpoint ) )
                {
                    wait 1;
                    continue;
                }
                else
                {
                    self.attackpoint = tacpoint.origin;
                }
            }
            
            if ( debugdraw )
            {
                line( self.attackpoint, self.origin, ( 0, 1, 0 ), 1, 0, 100 );
                sphere( self.attackpoint, 15, ( 0, 1, 0 ), 1, 100 );
            }
            
            function_123852fba4d3e231( self.attackpoint, speedmph, vehiclenavmeshlayer, undefined, debugdraw );
            self.enemyvisibletime = gettime();
            
            while ( true )
            {
                waitframe();
                attackpointdistance = distance2d( enemy.origin, self.attackpoint );
                
                if ( attackpointdistance > var_9e106aa74effb825 )
                {
                    self.attackpoint = undefined;
                    break;
                }
                
                trace = trace::ray_trace( self.origin, enemy getcentroid(), self );
                
                if ( debugdraw )
                {
                    visible = trace[ "<dev string:xb09>" ] == "<dev string:xb14>" && trace[ "<dev string:xb26>" ] == enemy;
                    color = visible ? ( 1, 1, 0 ) : ( 1, 0, 0 );
                    line( enemy getcentroid(), self.origin, color, 1, 0, 1 );
                    print3d( self.origin, string( attackpointdistance ), color, 1, 1, 1 );
                }
                
                if ( trace[ "<dev string:xb09>" ] == "<dev string:xb14>" && trace[ "<dev string:xb26>" ] == enemy )
                {
                    self.enemyvisibletime = gettime();
                    continue;
                }
                
                if ( gettime() - self.enemyvisibletime > var_30459f336f7c69d )
                {
                    self.attackpoint = undefined;
                    break;
                }
            }
        }
    }

    // Namespace vehicle_roads
    // Params 1, eflags: 0x4
    // Checksum 0x7e2227e1, Offset: 0x6118
    // Size: 0x4e, Type: dev
    function private function_1ceeee887e2dc5e8( vehiclenode )
    {
        level endon( "<dev string:x4ed>" );
        
        while ( true )
        {
            waitframe();
            endnode = function_e79d9bfa12a8d0ff( vehiclenode, ( 0, 0, 100 ), ( 0.99, 0.2, 0.49 ) );
        }
    }

    // Namespace vehicle_roads
    // Params 2, eflags: 0x4
    // Checksum 0xaf1b7bf3, Offset: 0x616e
    // Size: 0xcd, Type: dev
    function private function_789eebef8abc2637( splinestartnode, connectiontargetname )
    {
        level endon( "<dev string:x4ed>" );
        
        for ( nextnode = function_d5de32e196353afe( splinestartnode.target ); splinestartnode != nextnode ; nextnode = function_d5de32e196353afe( nextnode.target ) )
        {
            if ( !isdefined( nextnode.target ) )
            {
                break;
            }
        }
        
        connectionnode = function_d5de32e196353afe( connectiontargetname );
        offset = ( 0, 0, 100 );
        
        while ( true )
        {
            waitframe();
            line( nextnode.origin + offset, connectionnode.origin + offset, ( 1, 1, 0 ) );
        }
    }

    // Namespace vehicle_roads
    // Params 1, eflags: 0x4
    // Checksum 0x34e7c317, Offset: 0x6243
    // Size: 0x165, Type: dev
    function private function_c0237c77838fe9cc( selectedvehiclenode )
    {
        level notify( "<dev string:xb30>" );
        level endon( "<dev string:xb30>" );
        assert( selectedvehiclenode );
        debugcolor = ( 1, 0.65, 0 );
        debugoffset = ( 0, 0, 15 );
        nextvehiclenode = undefined;
        nodeheading = undefined;
        roadstartnode = function_1d43376f84a16476( selectedvehiclenode );
        waitdurationframes = 10;
        waitdurationseconds = waitdurationframes / 20;
        
        if ( selectedvehiclenode.target )
        {
            nextvehiclenode = getvehiclenode( selectedvehiclenode.target, #targetname );
            nodeheading = vectornormalize( nextvehiclenode.origin - selectedvehiclenode.origin );
        }
        
        while ( true )
        {
            wait waitdurationseconds;
            print3d( selectedvehiclenode.origin + debugoffset, "<dev string:x23f>" + roadstartnode.targetname, debugcolor, 1, 3, waitdurationframes );
            sphere( selectedvehiclenode.origin, 175, debugcolor, 0, waitdurationframes );
            
            if ( nodeheading )
            {
                utility::draw_arrow( selectedvehiclenode.origin + debugoffset, selectedvehiclenode.origin + debugoffset + nodeheading * 500, debugcolor, 100, 0, waitdurationframes );
            }
        }
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0x4ffa2cdf, Offset: 0x63b0
    // Size: 0xc9, Type: dev
    function function_57a84daa7ba90219()
    {
        player = level.players[ 0 ];
        playerangles = player getplayerangles();
        playerforward = anglestoforward( playerangles );
        playereyelocation = player geteye();
        traceendlocation = playereyelocation + playerforward * 5000;
        traceresults = trace::ray_trace( playereyelocation, traceendlocation, player );
        
        if ( isdefined( traceresults ) )
        {
            traceendlocation = traceresults[ "<dev string:xb54>" ];
        }
        
        [ closestvehiclenode, var_64603e0e7a8a4a75 ] = function_a59922ce43367d92( traceendlocation );
        
        if ( closestvehiclenode )
        {
            level.selectedvehiclenode = closestvehiclenode;
            level thread function_c0237c77838fe9cc( closestvehiclenode );
        }
    }

#/

// Namespace vehicle_roads
// Params 2
// Checksum 0x8acb39aa, Offset: 0x6481
// Size: 0x55
function function_2f9545121ae770f2( var_4ca26a6b565d1f87, loopnode )
{
    slow = var_4ca26a6b565d1f87;
    
    while ( slow != loopnode )
    {
        slow = function_d5de32e196353afe( slow.target );
        loopnode = function_d5de32e196353afe( loopnode.target );
    }
    
    return slow;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x2e0b176d, Offset: 0x64df
// Size: 0xf6
function function_580d55eeb353c8cc( var_4ca26a6b565d1f87 )
{
    slow = var_4ca26a6b565d1f87;
    fast = var_4ca26a6b565d1f87;
    result = [ 0, undefined, 0 ];
    
    while ( isdefined( fast ) && isdefined( fast.target ) )
    {
        if ( isdefined( slow.var_5262adea3d5fcba3 ) )
        {
            var_24f0e3f1b4b638f6 = 1;
        }
        
        slow = function_d5de32e196353afe( slow.target );
        fasttarget = function_d5de32e196353afe( fast.target );
        fast = isdefined( fasttarget ) && isdefined( fasttarget.target ) ? function_d5de32e196353afe( fasttarget.target ) : undefined;
        
        if ( slow == fast )
        {
            result = [ 1, function_2f9545121ae770f2( var_4ca26a6b565d1f87, slow ), var_24f0e3f1b4b638f6 ];
            break;
        }
    }
    
    return result;
}

// Namespace vehicle_roads
// Params 4
// Checksum 0xdd6f2f8b, Offset: 0x65de
// Size: 0x27c
function function_9149142c3ccf24ac( nodetargetname, var_ab3915e451d72b25, endnodetargetname, nodeconnections )
{
    if ( !isdefined( level.roads ) )
    {
        level.roads = [];
    }
    
    assert( nodetargetname );
    var_4ca26a6b565d1f87 = function_d5de32e196353afe( nodetargetname );
    var_647dcaaadd4b5a0d = getvehiclenodeindex( nodetargetname, #targetname );
    
    if ( var_4ca26a6b565d1f87 )
    {
        node = level.roads[ nodetargetname ];
        
        if ( !isdefined( node ) )
        {
            node = function_4d7349201f8b39f8( nodetargetname );
        }
        
        var_71cbdedca6019172 = 0;
        currentvehiclenode = var_4ca26a6b565d1f87;
        currentvehiclenode.var_5262adea3d5fcba3 = var_647dcaaadd4b5a0d;
        currentvehiclenode.var_acc28514b93af430 = 0;
        prevvehiclenode = undefined;
        
        while ( true )
        {
            if ( currentvehiclenode.targetname == endnodetargetname )
            {
                break;
            }
            
            prevvehiclenode = currentvehiclenode;
            currentvehiclenode = function_d5de32e196353afe( currentvehiclenode.target );
            currentvehiclenode.var_5262adea3d5fcba3 = var_647dcaaadd4b5a0d;
            var_71cbdedca6019172 += distance( prevvehiclenode.origin, currentvehiclenode.origin );
            currentvehiclenode.var_acc28514b93af430 = clamp( var_71cbdedca6019172 / var_ab3915e451d72b25, 0, 1 );
        }
        
        assert( currentvehiclenode.targetname == endnodetargetname );
        node.var_ab3915e451d72b25 = var_ab3915e451d72b25;
        node.endkey = endnodetargetname;
        
        if ( isdefined( nodeconnections ) )
        {
            foreach ( connectionname in nodeconnections )
            {
                if ( connectionname )
                {
                    assert( isdefined( function_d5de32e196353afe( connectionname ) ), "<dev string:x958>" + connectionname + "<dev string:x7d1>" );
                    level.roads[ nodetargetname ].connections[ level.roads[ nodetargetname ].connections.size ] = connectionname;
                    continue;
                }
                
                level.roads[ nodetargetname ].connections[ level.roads[ nodetargetname ].connections.size ] = connectionname;
            }
        }
    }
}

/#

    // Namespace vehicle_roads
    // Params 10
    // Checksum 0x7b04bb0f, Offset: 0x6862
    // Size: 0x3d1, Type: dev
    function function_e8fff5ff35e19e5e( startnode, endkey, connections, nodeoffset, roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, var_4fd2ba081528d08e, var_4fd2b9081528ce5b, var_dfbdb69003a1b65d )
    {
        assert( isdefined( startnode ) );
        assert( isdefined( endkey ) );
        
        if ( !isdefined( var_ffa77065c35c927f ) )
        {
            var_ffa77065c35c927f = 1;
        }
        
        if ( !isdefined( var_553d47d9b2d39dda ) )
        {
            var_553d47d9b2d39dda = 1;
        }
        
        var_553d47d9b2d39dda = min( 1, var_553d47d9b2d39dda );
        previousnode = startnode;
        nextnode = undefined;
        var_792739c70ea7c028 = roadcolor;
        nodeindex = 0;
        
        if ( !isdefined( startnode.target ) )
        {
            return;
        }
        
        nextnode = function_d5de32e196353afe( startnode.target );
        
        while ( true )
        {
            if ( !isdefined( nextnode ) )
            {
                break;
            }
            
            if ( nextnode.targetname == endkey )
            {
                additionaloffset = ( 0, 0, 15 );
                line( previousnode.origin + nodeoffset, nextnode.origin + nodeoffset + additionaloffset, var_792739c70ea7c028, 1, 0, var_ffa77065c35c927f );
                break;
            }
            else
            {
                line( previousnode.origin + nodeoffset, nextnode.origin + nodeoffset, var_792739c70ea7c028, 1, 0, var_ffa77065c35c927f );
            }
            
            previousnode = nextnode;
            
            for ( numsteps = 0; numsteps < var_553d47d9b2d39dda ; numsteps++ )
            {
                if ( !isdefined( nextnode.target ) )
                {
                    break;
                }
                
                nextnode = function_d5de32e196353afe( nextnode.target );
            }
            
            if ( var_4fd2ba081528d08e && previousnode.targetname == var_4fd2ba081528d08e )
            {
                var_792739c70ea7c028 = var_dfbdb69003a1b65d;
            }
            else if ( var_4fd2b9081528ce5b && previousnode.targetname == var_4fd2b9081528ce5b )
            {
                var_792739c70ea7c028 = roadcolor;
            }
            
            nodeindex++;
        }
        
        foreach ( connectionindex, connection in connections )
        {
            var_4ec531501ff3f3a9 = 45;
            var_6499ad7e486f9e81 = 512;
            
            if ( !isdefined( connection ) )
            {
                continue;
            }
            
            switch ( connectionindex )
            {
                case 0:
                    segmentcolor = ( 0.74, 0.46, 0.96 );
                    line( nextnode.origin + nodeoffset, nextnode.origin + nodeoffset + ( var_4ec531501ff3f3a9, var_4ec531501ff3f3a9, var_6499ad7e486f9e81 ), segmentcolor, 1, 0, var_ffa77065c35c927f );
                    break;
                case 1:
                    segmentcolor = ( 1, 0.65, 0 );
                    line( nextnode.origin + nodeoffset, nextnode.origin + nodeoffset + ( 0, var_4ec531501ff3f3a9, var_6499ad7e486f9e81 ), segmentcolor, 1, 0, var_ffa77065c35c927f );
                    break;
                case 2:
                    segmentcolor = ( 0, 0, 1 );
                    line( nextnode.origin + nodeoffset, nextnode.origin + nodeoffset + ( var_4ec531501ff3f3a9, 0, var_6499ad7e486f9e81 ), segmentcolor, 1, 0, var_ffa77065c35c927f );
                    break;
                default:
                    break;
            }
            
            connectionnode = function_d5de32e196353afe( connection );
            assert( connectionnode );
            line( nextnode.origin + nodeoffset, connectionnode.origin + nodeoffset + additionaloffset, segmentcolor, 1, 0, var_ffa77065c35c927f );
        }
        
        return nextnode;
    }

    // Namespace vehicle_roads
    // Params 1
    // Checksum 0xf7cfa923, Offset: 0x6c3b
    // Size: 0x13d, Type: dev
    function function_3fa3631d2dc72ced( var_553d47d9b2d39dda )
    {
        level notify( "<dev string:xb60>" );
        level endon( "<dev string:xb60>" );
        var_ffa77065c35c927f = 60;
        waitduration = max( var_ffa77065c35c927f - 2, 1 ) * 0.05;
        
        while ( true )
        {
            if ( !isdefined( level.roads ) )
            {
                continue;
            }
            
            foreach ( road in level.roads )
            {
                vehiclenode = function_d5de32e196353afe( road.key );
                roadcolor = ( 0.5, 0, 0.5 );
                endnode = function_e8fff5ff35e19e5e( vehiclenode, road.endkey, road.connections, ( 0, 0, 15 ), roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
            }
            
            wait waitduration;
        }
    }

#/
