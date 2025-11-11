#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_paths;
#using scripts\common\vehicle_tracking;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace vehicle_roads;

// Namespace vehicle_roads
// Params 17
// Checksum 0x4745c751, Offset: 0x2ed
// Size: 0x194
function function_b5bd79b51773c046( usep2p = 1, var_d2b2b98d77c9c0 = 0, checkstuck = 0, brakeatgoal = 1, autonormal = 1, brakeongoalgasbrake = 1, goalthreshold = 100, throttlespeedclose = 0, throttlespeedthreshold = 1, var_f04cadb28ee6016d = 1, throttlespeedfarbelow = 0, throttlespeedfarabove = 0, gastostopmovement = 0.9, steeringmultiplier = 1, stepradius, stepspeedfactor, usemanualspeed )
{
    if ( var_d2b2b98d77c9c0 )
    {
        if ( !self hascomponent( "animator" ) )
        {
            self addcomponent( "animator" );
        }
    }
    
    if ( usep2p )
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
// Checksum 0x86b5d953, Offset: 0x489
// Size: 0x5ee
function function_c64bd96044937781( var_faaa47fc6aa1f40a, speed = "medium", useroads = 1, var_c3e9f4759ee0b1fe = 1, var_de2ce60209cec7b0 = 1, var_12e420084a68860e, amortize = 1, vehiclenavmeshlayer = undefined, debugdraw = 0 )
{
    result = 0;
    
    if ( !self || !vehicle::is_vehicle() )
    {
        assertmsg( "<dev string:x24>" );
        return result;
    }
    
    if ( !vehiclenavmeshlayer )
    {
        vehiclenavmeshlayer = level.vehiclenavmeshlayer ?? "vehicle_large";
    }
    
    goalorigin = undefined;
    goalvehiclenode = undefined;
    
    if ( !isvector( var_faaa47fc6aa1f40a ) )
    {
        if ( !isdefined( var_faaa47fc6aa1f40a.origin ) )
        {
            assertmsg( "<dev string:x53>" );
            return result;
        }
        
        goalvehiclenode = var_faaa47fc6aa1f40a;
        goalorigin = var_faaa47fc6aa1f40a.origin;
    }
    else
    {
        navgoalorigin = getclosestpointonnavmesh( var_faaa47fc6aa1f40a, vehiclenavmeshlayer );
        
        if ( !navgoalorigin )
        {
            assertmsg( "<dev string:x8c>" + goalorigin );
            return result;
        }
        
        goalorigin = navgoalorigin;
    }
    
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
    var_8c7acf989e28e271 = { #isoffroad:1, #origin:goalorigin };
    
    if ( !useroads || !level.roads )
    {
        self.attachedpath = var_8c7acf989e28e271;
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
        [ var_5e0b5b09c7d63725, beststartnode, bestgoalnode ] = function_3fd54488ab0c7c72( self.origin, var_faaa47fc6aa1f40a, self.var_94e9dec930dce0a8, anglestoforward( self.angles ), amortize, undefined, 200, undefined, debugdraw );
        
        if ( !var_5e0b5b09c7d63725 )
        {
            print( "<dev string:xdf>" + self.origin + "<dev string:x11a>" + goalorigin );
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
                print3d( self.var_26b28c4d11c39de.origin, "<dev string:x123>" + var_f7fc8e68cde5d150, ( 1, 1, 1 ), 1, 1, 600 );
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
                    print3d( self.origin, "<dev string:x152>", ( 1, 1, 1 ), 1, 600 );
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
            print3d( self.origin, "<dev string:x184>", ( 1, 1, 1 ), 1, 600 );
            thread function_ccc37c74c8357da7( var_5e0b5b09c7d63725, self.var_26b28c4d11c39de.targetname, self.var_aa9420e9c34ecebd.targetname );
        }
    #/
    
    if ( var_57de6de536cd690d )
    {
        arrayinsert( var_5e0b5b09c7d63725, var_57de6de536cd690d, 0 );
    }
    
    if ( !isdefined( goalvehiclenode ) && var_c3e9f4759ee0b1fe || var_5e0b5b09c7d63725.size == 0 )
    {
        var_5e0b5b09c7d63725[ var_5e0b5b09c7d63725.size ] = var_8c7acf989e28e271;
    }
    
    function_60e8cec67a1f4910( var_5e0b5b09c7d63725 );
    
    /#
        if ( debugdraw )
        {
            print3d( var_5e0b5b09c7d63725[ var_5e0b5b09c7d63725.size - 1 ].origin, "<dev string:x1b4>", ( 1, 1, 1 ), 1, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x68ac38ec, Offset: 0xa80
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
// Checksum 0x7ca7c224, Offset: 0xacf
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
// Checksum 0x22632500, Offset: 0xb3c
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
// Checksum 0x3ba88bc4, Offset: 0xca3
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
// Checksum 0x8bbee93f, Offset: 0xd38
// Size: 0x25d
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
            if ( level.roads[ nextpoint.targetname ] )
            {
                nextnode = function_d5de32e196353afe( nextpoint.target );
                
                if ( nextnode && nextnode.var_5262adea3d5fcba3 == self.var_aa9420e9c34ecebd.var_5262adea3d5fcba3 )
                {
                    var_a1c5c8fc030b7b6 = self.var_aa9420e9c34ecebd;
                }
            }
            
            if ( !isdefined( var_a1c5c8fc030b7b6 ) )
            {
                var_a1c5c8fc030b7b6 = function_d5de32e196353afe( level.roads[ nextpoint.targetname ].endkey );
            }
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
// Checksum 0xe386f672, Offset: 0xf9d
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
// Params 9
// Checksum 0x6339d063, Offset: 0x100e
// Size: 0x52b
function function_3fd54488ab0c7c72( startorigin, var_faaa47fc6aa1f40a, var_94e9dec930dce0a8, vehicleheading, amortize = 1, var_c0790d419ef64889 = 1500, var_128160ef87ef26fd = 200, var_ce44cb2bc998e1a0 = 800, debug = 0 )
{
    assert( var_c0790d419ef64889 && ( !isdefined( var_128160ef87ef26fd ) || var_c0790d419ef64889 > var_128160ef87ef26fd ) );
    result = [ undefined, undefined, undefined ];
    
    if ( !isvector( startorigin ) )
    {
        assertmsg( "<dev string:x1d5>" );
        return result;
    }
    
    goalorigin = undefined;
    goalvehiclenode = undefined;
    
    if ( !isvector( var_faaa47fc6aa1f40a ) )
    {
        if ( !isdefined( var_faaa47fc6aa1f40a.origin ) )
        {
            assertmsg( "<dev string:x1fc>" );
            return result;
        }
        
        goalvehiclenode = var_faaa47fc6aa1f40a;
        goalorigin = var_faaa47fc6aa1f40a.origin;
    }
    else
    {
        goalorigin = var_faaa47fc6aa1f40a;
    }
    
    var_ee45b4a96a1031 = distance( startorigin, goalorigin );
    
    if ( var_ee45b4a96a1031 < max( var_c0790d419ef64889, var_ce44cb2bc998e1a0 ) )
    {
        return result;
    }
    
    minlength = undefined;
    bestpath = undefined;
    var_7c3e88b4efbf7806 = undefined;
    var_1949c9765e5ad6c2 = undefined;
    beststartnode = undefined;
    bestgoalnode = undefined;
    var_274850134e12f7b5 = function_3127fbf4fc495e2c( var_94e9dec930dce0a8, startorigin, var_128160ef87ef26fd, vehicleheading );
    var_6471f4e0e6b6314b = function_d3465c4295cd717c( startorigin, goalorigin, var_c0790d419ef64889, var_128160ef87ef26fd, vehicleheading, 1, 0, 1, debug, ( 0, 1, 1 ), "Start" );
    var_a2edd42814eec542 = [];
    
    if ( !isdefined( goalvehiclenode ) )
    {
        var_a2edd42814eec542 = function_d3465c4295cd717c( goalorigin, startorigin, var_c0790d419ef64889, undefined, undefined, 1, 1, 0, debug, ( 1, 0.06, 0.94 ), "Goal" );
    }
    else
    {
        var_a2edd42814eec542[ 0 ] = goalvehiclenode;
    }
    
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
    
    if ( !bestpath || minlength > var_ee45b4a96a1031 * 5 )
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
// Checksum 0x3bbcc6b1, Offset: 0x1542
// Size: 0x41a
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
        
        foreach ( var_dae9d8b7f3417a74 in road.connections ?? [] )
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
// Checksum 0x68033706, Offset: 0x1965
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
            print3d( startnode.origin, "<dev string:x22f>", debugcolor, 1, 3, 600 );
            print3d( goalnode.origin, "<dev string:x23d>", debugcolor, 1, 3, 600 );
            print3d( goalorigin, "<dev string:x24a>", debugcolor, 1, 3, 600 );
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
            print3d( startorigin + debugoffset, "<dev string:x259>" + result, debugcolor, 1, 3, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 7, eflags: 0x4
// Checksum 0x8943298c, Offset: 0x1c82
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
            print3d( startnode.origin, "<dev string:x22f>", debugcolor, 1, 3, 600 );
            print3d( goalnode.origin, "<dev string:x23d>", debugcolor, 1, 3, 600 );
            print3d( goalorigin, "<dev string:x24a>", debugcolor, 1, 3, 600 );
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
            print3d( startorigin + debugoffset, "<dev string:x259>" + result, debugcolor, 1, 3, 600 );
        }
    #/
    
    return result;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xa115cd50, Offset: 0x1f8d
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
// Checksum 0xca7cefd5, Offset: 0x2019
// Size: 0x3a8
function follow_roads( var_c677a1872ed9e343, var_a013e99fabd91cd5, debugdraw )
{
    self endon( "death" );
    self notify( "follow_roads" );
    self endon( "follow_roads" );
    self notify( "vehiclePursueEntity" );
    currentsplinename = var_c677a1872ed9e343;
    var_a013e99fabd91cd5 = isdefined( var_a013e99fabd91cd5 ) ? var_a013e99fabd91cd5 : var_c677a1872ed9e343;
    vehicle_paths::function_2af4522b1fc2bcc9( var_a013e99fabd91cd5 );
    
    /#
        if ( debugdraw )
        {
            debugduration = 500;
            debugcolor = ( 1, 0.75, 0.8 );
            var_f5c916067a4457bd = randomint( 15 );
            var_4ccfa6ba4a135353 = getvehiclenode( var_a013e99fabd91cd5, #targetname );
            line( self.origin, var_4ccfa6ba4a135353.origin, debugcolor, 1, 0, debugduration );
            sphere( var_4ccfa6ba4a135353.origin, 150 + var_f5c916067a4457bd, debugcolor, 0, debugduration );
        }
    #/
    
    while ( true )
    {
        if ( level.var_2aa90a9ef4e6c7c6 )
        {
            var_a1c5c8fc030b7b6 = undefined;
            
            if ( self.closestvehiclenode && currentsplinename == getvehiclenode( self.closestvehiclenode.var_5262adea3d5fcba3 ).targetname )
            {
                var_a1c5c8fc030b7b6 = self.var_aa9420e9c34ecebd;
            }
            else
            {
                var_a1c5c8fc030b7b6 = getvehiclenode( level.roads[ currentsplinename ].endkey, #targetname );
            }
            
            function_256de0610be6fee1( var_a1c5c8fc030b7b6, debugdraw );
        }
        else
        {
            self waittill( "reached_end_node" );
        }
        
        if ( !level.roads[ currentsplinename ].connections.size )
        {
            self notify( "reached_end_of_route" );
            break;
        }
        
        var_9f31af136fe72cdd = [[ self.var_7bad066f66519780 ?? &function_40be5cbb0e8c2ad2 ]]( currentsplinename );
        
        if ( !isdefined( var_9f31af136fe72cdd ) && level.roads[ currentsplinename ].connections.size )
        {
            if ( level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ].var_c7209d94145d9827[ currentsplinename ] )
            {
                var_9f31af136fe72cdd = level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ].var_c7209d94145d9827[ currentsplinename ];
            }
            else
            {
                foreach ( connection in utility::array_randomize( level.roads[ currentsplinename ].connections ) )
                {
                    if ( level.roads[ connection ].connections.size )
                    {
                        var_9f31af136fe72cdd = connection;
                        break;
                    }
                }
                
                if ( !isdefined( var_9f31af136fe72cdd ) )
                {
                    var_9f31af136fe72cdd = utility::random( level.roads[ currentsplinename ].connections );
                }
                
                if ( level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ] )
                {
                    if ( !isdefined( level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ].var_c7209d94145d9827 ) )
                    {
                        level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ].var_c7209d94145d9827 = [];
                    }
                    
                    level.var_19e3377845b45a89[ self.var_a1379d3eb7064f7c ].var_c7209d94145d9827[ currentsplinename ] = var_9f31af136fe72cdd;
                }
            }
            
            self.veh_pathdir = "forward";
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
// Checksum 0x7729ae68, Offset: 0x23c9
// Size: 0xa
function function_a35b358d899efcf6()
{
    self notify( "follow_roads" );
}

// Namespace vehicle_roads
// Params 0
// Checksum 0x2ce623a0, Offset: 0x23db
// Size: 0xa
function function_95a3bf8ea721adce()
{
    self notify( "move_to_done" );
}

// Namespace vehicle_roads
// Params 5
// Checksum 0xa7e02c85, Offset: 0x23ed
// Size: 0x1e3
function function_123852fba4d3e231( goallocation, speedmph, vehiclenavmeshlayer, goaldirection = ( 0, 0, 0 ), debugdraw = 0 )
{
    self notify( "7cc968324b4b5e83" );
    self endon( "7cc968324b4b5e83" );
    
    if ( !isdefined( vehiclenavmeshlayer ) )
    {
        vehiclenavmeshlayer = level.vehiclenavmeshlayer ?? "vehicle_large";
    }
    
    startlocation = self.origin;
    vehicleforward = anglestoforward( self.angles );
    splinepoints = self findsplinepath( startlocation, goallocation, 50, 200, 100, vehicleforward, goaldirection, 300, 0.4, 0, 1, vehiclenavmeshlayer, 0, 1 );
    
    if ( !isdefined( splinepoints ) )
    {
        /#
            println( "<dev string:x25d>" + self getentitynumber() + "<dev string:x28f>" + startlocation + "<dev string:x2b4>" + goallocation );
            
            if ( debugdraw )
            {
                debugduration = 200;
                line( startlocation, goallocation, ( 1, 0, 0 ), 1, 0, debugduration );
                line( goallocation, goallocation + ( 0, 0, 1024 ), ( 1, 0, 0 ), 1, 0, debugduration );
            }
        #/
        
        return "vehicleFailedToFindNavSpline";
    }
    
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
// Checksum 0x94989945, Offset: 0x25d9
// Size: 0x12e
function watch_stuck( debugdraw )
{
    self notify( "16017dd53c156adb" );
    self endon( "16017dd53c156adb" );
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
                    print3d( self getcentroid(), "<dev string:x2bc>", ( 1, 1, 1 ), 1, 1, 4000 );
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
// Checksum 0x3406efdd, Offset: 0x270f
// Size: 0x7d
function watch_interrupt( debugdraw )
{
    self notify( "51d669dad52d53f1" );
    self endon( "51d669dad52d53f1" );
    self endon( "death" );
    self endon( "move_to_done" );
    self endon( "newpath" );
    
    while ( true )
    {
        self waittill( "navspline_interrupted" );
        
        /#
            if ( debugdraw )
            {
                print3d( self getcentroid(), "<dev string:x2d7>", ( 1, 1, 1 ), 1, 1, 4000 );
            }
        #/
        
        self notify( "vehicleNavSplineInterrupted" );
        self stoppath();
    }
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x5afe8c6c, Offset: 0x2794
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
// Checksum 0x81b82850, Offset: 0x2915
// Size: 0x18, Type: bool
function function_d6d259c92d42b7e7( vehiclenode )
{
    return !vehiclenode.disabled;
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x1487f06e, Offset: 0x2936
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
// Checksum 0x78d6b448, Offset: 0x2a81
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
// Checksum 0x6c03de0d, Offset: 0x2b5b
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
// Checksum 0x654bc002, Offset: 0x2c97
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
                assert( vehiclenode.target, "<dev string:x2f8>" + vehiclenode.targetname + "<dev string:x332>" );
                
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
                assert( targetvehiclenode, "<dev string:x35d>" + vehiclenode.targetname + "<dev string:x36d>" );
                
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
// Checksum 0xd6c05e7c, Offset: 0x30dc
// Size: 0x79
function function_4cda58395996a9a5( searchorigin, maxdistance = 3500 )
{
    assert( isdefined( level.roads ) );
    function_d8c6e9644ca5eddd();
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
// Params 0
// Checksum 0x9c993d7f, Offset: 0x315e
// Size: 0x26
function function_d8c6e9644ca5eddd()
{
    if ( !isdefined( level.vehiclenodes ) )
    {
        level.vehiclenodes = utility::create_partition( getallvehiclenodes(), 3500, 1 );
    }
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0xa5cad9cf, Offset: 0x318c
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
// Checksum 0xbb26cca7, Offset: 0x31f2
// Size: 0x2c3
function function_a59922ce43367d92( goalorigin, maxdistance = 3500, goaldirection = undefined, var_8a4f78052b5273fa = 90, var_debd3da3c83a10e9 = 90, skipend = 1, debugdraw = 0 )
{
    assert( isdefined( level.roads ) );
    function_d8c6e9644ca5eddd();
    var_ae98ea54b5bb34da = level.vehiclenodes utility::function_822c5feaca90abc1( goalorigin, maxdistance );
    var_ae98ea54b5bb34da = sortbydistance( var_ae98ea54b5bb34da, goalorigin );
    result = [ undefined, undefined ];
    
    if ( var_ae98ea54b5bb34da.size > 0 )
    {
        foreach ( vehiclenode in var_ae98ea54b5bb34da )
        {
            if ( !isdefined( vehiclenode.var_5262adea3d5fcba3 ) )
            {
                continue;
            }
            
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
// Checksum 0xa513a832, Offset: 0x34be
// Size: 0x17b
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
        
        var_5262adea3d5fcba3 = nextnode.var_5262adea3d5fcba3;
        roadstartvehiclenode = getvehiclenode( var_5262adea3d5fcba3 );
        
        if ( level.var_2aa90a9ef4e6c7c6 )
        {
            if ( nextnode.targetname == level.roads[ roadstartvehiclenode.targetname ].endkey )
            {
                break;
            }
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
// Checksum 0x8f755e6, Offset: 0x3642
// Size: 0xed
function private function_1a2a323483b5dc15( var_8977d39d6839964e, var_187f313073672917 )
{
    result = 0;
    
    foreach ( closestvehiclenode in var_187f313073672917 )
    {
        var_4e9e28158e5f126c = getvehiclenode( closestvehiclenode.var_5262adea3d5fcba3 ).targetname;
        
        if ( level.roads[ var_4e9e28158e5f126c ].connections.size )
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
    // Checksum 0xd397e214, Offset: 0x3738
    // Size: 0x158, Type: dev
    function private function_95b21505afdddd54( searchorigin, var_187f313073672917, debugcolor, debugmessage )
    {
        notifyname = "<dev string:x38c>" + debugmessage;
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
                print3d( searchorigin + offset, "<dev string:x3b1>" + debugmessage, debugcolor, 1, 1, 1 );
                print3d( vehiclenode.origin + offset, "<dev string:x259>" + roadindex + "<dev string:x3d0>" + nodedistance, debugcolor, 1, 1, 1 );
                roadindex++;
            }
        }
    }

#/

// Namespace vehicle_roads
// Params 11, eflags: 0x4
// Checksum 0x24e9af4c, Offset: 0x3898
// Size: 0x12e
function private function_d3465c4295cd717c( searchorigin, goalorigin, maxdistance, var_cfaff5e2d53d4413, vehicleheading, var_c8588ac7478dc8c3, skipstartnodes, var_2324545dc6510f0f, debugdraw, debugcolor, debugmessage )
{
    assert( searchorigin && isvector( searchorigin ), "<dev string:x3de>" );
    assert( goalorigin && isvector( goalorigin ), "<dev string:x41b>" );
    assert( maxdistance && ( !isdefined( var_cfaff5e2d53d4413 ) || maxdistance > var_cfaff5e2d53d4413 ) );
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
// Checksum 0x740d04ad, Offset: 0x39cf
// Size: 0x34a
function private function_3e6f292cbbccd99c( searchorigin, maxdistance, var_cfaff5e2d53d4413, vehicleheading, var_c8588ac7478dc8c3, skipstartnodes, var_2324545dc6510f0f, debugdraw, debugcolor, debugmessage )
{
    assert( searchorigin && isvector( searchorigin ), "<dev string:x3de>" );
    assert( isdefined( level.roads ) );
    assert( maxdistance && ( !isdefined( var_cfaff5e2d53d4413 ) || maxdistance > var_cfaff5e2d53d4413 ) );
    function_d8c6e9644ca5eddd();
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
// Checksum 0x3e501ead, Offset: 0x3d22
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
    // Checksum 0x95e28493, Offset: 0x3d83
    // Size: 0xcb, Type: dev
    function private function_717e5a3dace1786d( vehiclenode )
    {
        self notify( "<dev string:x456>" );
        self endon( "<dev string:x456>" );
        self endon( "<dev string:x471>" );
        
        while ( true )
        {
            waitframe();
            debugcolor = ( 0, 0.6, 1 );
            offset = ( 0, 0, 15 );
            line( self.origin + offset, vehiclenode.origin + offset, debugcolor, 0, 0, 1 );
            sphere( vehiclenode.origin + offset, 75, debugcolor, 0, 1 );
            print3d( vehiclenode.origin + offset, "<dev string:x47a>" + vehiclenode.targetname, debugcolor, 1, 2, 1 );
        }
    }

#/

// Namespace vehicle_roads
// Params 2
// Checksum 0xb5fed484, Offset: 0x3e56
// Size: 0x8a
function function_256de0610be6fee1( vehiclenode, debugdraw )
{
    self notify( "b2af10ead7fafd38" );
    self endon( "b2af10ead7fafd38" );
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
                    self notify( "<dev string:x456>" );
                }
            #/
            
            self.var_94e9dec930dce0a8 = vehiclenode;
            break;
        }
    }
}

// Namespace vehicle_roads
// Params 1
// Checksum 0x7ab034d, Offset: 0x3ee8
// Size: 0x37
function function_1d5d124423620d81( vehiclenode )
{
    self notify( "e02ef5ad3f2881db" );
    self endon( "e02ef5ad3f2881db" );
    function_256de0610be6fee1( vehiclenode );
    self setconfigvalue( "path", "pause", 1 );
}

// Namespace vehicle_roads
// Params 1
// Checksum 0xee3e23a8, Offset: 0x3f27
// Size: 0x1b
function function_d5de32e196353afe( targetname )
{
    return getvehiclenode( targetname, #targetname );
}

/#

    // Namespace vehicle_roads
    // Params 5
    // Checksum 0xddd2b12, Offset: 0x3f4b
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
        
        level.var_2ac6c688b6c64715 = openfile( "<dev string:x490>" + level.mapname + "<dev string:x4a4>" + uniquenamestring + "<dev string:x4af>", "<dev string:x4b7>" );
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x4c1>" );
        
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
        
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x501>" + level.var_cbffedb9ee41c670.size );
        fprintln( level.var_2ac6c688b6c64715, "<dev string:x528>" );
        function_9425451336d717f();
        fileid = closefile( level.var_2ac6c688b6c64715 );
    }

    // Namespace vehicle_roads
    // Params 6, eflags: 0x4
    // Checksum 0xfa0037f8, Offset: 0x4177
    // Size: 0x115, Type: dev
    function private function_398eef1e3adddd4f( startnodetargetname, var_624e3db72c1e28b, var_6d326efa2b9d6677, outputtargetname, debugdraw, var_26f80580d6c058c5 )
    {
        level notify( "<dev string:x566>" );
        
        if ( outputtargetname )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x587>" );
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x5d1>" + startnodetargetname );
        }
        
        level.recursioncount = 0;
        level.var_7a2c2c84a106e2c3 = 0;
        level.var_6779a56d21feef71 = 0;
        level.var_6287a1f1e9ba75c6 = [];
        function_f1d028a88164b0a( startnodetargetname, 0, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 );
        
        if ( outputtargetname )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x5f6>" + level.var_6779a56d21feef71 + "<dev string:x607>" + level.var_7a2c2c84a106e2c3 );
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x612>" );
        }
        
        level.recursioncount = undefined;
        level.var_7a2c2c84a106e2c3 = 0;
        level.var_6779a56d21feef71 = 0;
        level.var_6287a1f1e9ba75c6 = [];
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x53c1340b, Offset: 0x4294
    // Size: 0x44, Type: dev
    function private getmatchstarttimeutc()
    {
        if ( getdvarint( @"online_matchdata_enabled" ) == 0 )
        {
            return level.starttimeutcseconds;
        }
        
        return utility::callsharedfunc( #"game", #"getmatchdata", "<dev string:x65a>", "<dev string:x66d>" );
    }

    // Namespace vehicle_roads
    // Params 2
    // Checksum 0x3cfb6cd9, Offset: 0x42e0
    // Size: 0x3e, Type: dev
    function function_9425451336d717f( startnodetargetname, debugdraw )
    {
        level notify( "<dev string:x566>" );
        level.var_cbffedb9ee41c670 = undefined;
        level.var_c04a3381e31d618b = undefined;
        level.var_590fc06b263f99dc = undefined;
    }

    // Namespace vehicle_roads
    // Params 5, eflags: 0x4
    // Checksum 0xcfc5b869, Offset: 0x4326
    // Size: 0x517, Type: dev
    function private function_f1d028a88164b0a( startnodetargetname, var_9d8204c4caf4d047, var_6d326efa2b9d6677, debugdraw, var_26f80580d6c058c5 )
    {
        if ( isdefined( level.var_2d49d8a06d62313c ) && isdefined( function_f02c63b99c9614c9( level.var_2d49d8a06d62313c, startnodetargetname ) ) )
        {
            return;
        }
        
        splinestartnode = function_d5de32e196353afe( startnodetargetname );
        
        if ( !isdefined( splinestartnode ) )
        {
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x681>" + startnodetargetname );
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
        
        if ( var_ee5c3878b106067a.connections.size )
        {
            if ( var_6d326efa2b9d6677 )
            {
                assert( var_ee5c3878b106067a.connections.size <= 3 );
            }
            
            connectionsstring = "<dev string:x6ac>";
            
            for ( connectionindex = 0; connectionindex < var_ee5c3878b106067a.connections.size ; connectionindex++ )
            {
                if ( !var_ee5c3878b106067a.connections[ connectionindex ] )
                {
                    continue;
                }
                
                if ( connectionindex > 0 )
                {
                    connectionsstring += "<dev string:x6b3>";
                }
                
                connectionsstring += var_ee5c3878b106067a.connections[ connectionindex ];
            }
            
            connectionsstring += "<dev string:x6bb>";
            
            if ( !isdefined( level.var_cbffedb9ee41c670[ startnodetargetname ] ) )
            {
                var_755df835f76897b0++;
                level.var_cbffedb9ee41c670[ startnodetargetname ] = 1;
                
                if ( var_6d326efa2b9d6677 )
                {
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x6c2>" + startnodetargetname + "<dev string:x6eb>" + var_ee5c3878b106067a.var_ab3915e451d72b25 + "<dev string:x6f2>" + var_ee5c3878b106067a.endkey + "<dev string:x6eb>" + connectionsstring + "<dev string:x6f9>" );
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
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x700>" + startnodetargetname + "<dev string:x6eb>" + connectionsstring + "<dev string:x6f9>" );
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
                    assert( var_ee5c3878b106067a.endkey, "<dev string:x725>" );
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x6c2>" + startnodetargetname + "<dev string:x6eb>" + var_ee5c3878b106067a.var_ab3915e451d72b25 + "<dev string:x6f2>" + var_ee5c3878b106067a.endkey + "<dev string:x74f>" );
                    level.roadsoutput[ startnodetargetname ] = 1;
                }
                else
                {
                    fprintln( level.var_2ac6c688b6c64715, "<dev string:x700>" + startnodetargetname + "<dev string:x74f>" );
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
    // Checksum 0x52532eae, Offset: 0x4845
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
    // Checksum 0x4ec36ea6, Offset: 0x4971
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
    // Checksum 0x65862e7b, Offset: 0x4b2d
    // Size: 0x35c, Type: dev
    function private function_2683d87a28296d03( nodetargetname, var_ee5c3878b106067a )
    {
        assert( isdefined( level.var_67119a9659b67e6d ), "<dev string:x757>" );
        assert( isdefined( level.var_57587d488f0edd2f ), "<dev string:x7b9>" );
        assert( isdefined( nodetargetname ) );
        var_ee5c3878b106067a.endkey = undefined;
        var_ee5c3878b106067a.connections = [];
        var_4ca26a6b565d1f87 = function_d5de32e196353afe( nodetargetname );
        
        if ( !isdefined( var_4ca26a6b565d1f87 ) )
        {
            assert( var_4ca26a6b565d1f87, "<dev string:x81b>" + nodetargetname + "<dev string:x84a>" );
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
                assert( currentvehiclenode.target, "<dev string:x859>" + currentvehiclenode.targetname + "<dev string:x332>" );
                connectionstartnode = function_d5de32e196353afe( currentvehiclenode.target );
                assert( connectionstartnode );
                var_ee5c3878b106067a.connections[ 0 ] = currentvehiclenode.targetname;
                
                if ( currentvehiclenode.target2 )
                {
                    assert( currentvehiclenode.target, "<dev string:x859>" + currentvehiclenode.targetname + "<dev string:x880>" );
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
                assert( currentvehiclenode.target, "<dev string:x859>" + currentvehiclenode.targetname + "<dev string:x880>" );
                var_ee5c3878b106067a.connections[ 0 ] = currentvehiclenode.targetname;
                break;
            }
        }
        
        var_ee5c3878b106067a.var_ab3915e451d72b25 = var_71cbdedca6019172;
        var_ee5c3878b106067a.endkey = currentvehiclenode.targetname;
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0xd6974c08, Offset: 0x4e91
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
    // Checksum 0xd19bfd8c, Offset: 0x4f91
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
    // Checksum 0xadbb035d, Offset: 0x511a
    // Size: 0xc6, Type: dev
    function private function_724071863068c117()
    {
        if ( level.var_2d49d8a06d62313c.size > 0 )
        {
            var_f954e692cd8aa19f = "<dev string:x259>";
            
            foreach ( index, vehiclenodetargetname in level.var_2d49d8a06d62313c )
            {
                if ( index == 0 )
                {
                    var_f954e692cd8aa19f += vehiclenodetargetname;
                    continue;
                }
                
                var_f954e692cd8aa19f += "<dev string:x8a0>" + vehiclenodetargetname;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x8a6>" + var_f954e692cd8aa19f );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x6e13d8b4, Offset: 0x51e8
    // Size: 0xc6, Type: dev
    function private function_756daa27d2758d7e()
    {
        if ( level.var_6287a1f1e9ba75c6.size > 0 )
        {
            var_3862ccadd1c38270 = "<dev string:x259>";
            
            foreach ( index, vehiclenodetargetname in level.var_6287a1f1e9ba75c6 )
            {
                if ( index == 0 )
                {
                    var_3862ccadd1c38270 += vehiclenodetargetname;
                    continue;
                }
                
                var_3862ccadd1c38270 += "<dev string:x8a0>" + vehiclenodetargetname;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x8cc>" + var_3862ccadd1c38270 );
        }
    }

    // Namespace vehicle_roads
    // Params 1, eflags: 0x4
    // Checksum 0x2731b1d5, Offset: 0x52b6
    // Size: 0x111, Type: dev
    function private function_97b65653c95d883d( startnodetargetnames )
    {
        if ( startnodetargetnames && startnodetargetnames.size > 0 && level.var_590fc06b263f99dc && level.var_590fc06b263f99dc.size > 0 )
        {
            var_96c43fae8bdee0b2 = arraydifference( startnodetargetnames, level.var_590fc06b263f99dc );
            var_a5ee6d03bec1bb17 = "<dev string:x259>";
            
            foreach ( index, vehiclenodetargetname in var_96c43fae8bdee0b2 )
            {
                if ( index == 0 )
                {
                    var_a5ee6d03bec1bb17 += "<dev string:x8fb>" + vehiclenodetargetname + "<dev string:x8fb>";
                    continue;
                }
                
                var_a5ee6d03bec1bb17 += "<dev string:x6f2>" + vehiclenodetargetname + "<dev string:x8fb>";
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x900>" + var_a5ee6d03bec1bb17 );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x38dbcde5, Offset: 0x53cf
    // Size: 0x167, Type: dev
    function private function_2bdcf2c1a54ec800()
    {
        if ( level.var_85cb7e571f2fa9ab )
        {
            invalidtargetstring = "<dev string:x259>";
            
            foreach ( index, invalidtarget in level.var_85cb7e571f2fa9ab )
            {
                if ( index == 0 )
                {
                    invalidtargetstring += invalidtarget;
                    continue;
                }
                
                invalidtargetstring += "<dev string:x8a0>" + invalidtarget;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x931>" + invalidtargetstring );
        }
        
        if ( level.var_40c7a94c6037d9b4 )
        {
            invalidtargetstring = "<dev string:x259>";
            
            foreach ( index, invalidtarget in level.var_40c7a94c6037d9b4 )
            {
                if ( index == 0 )
                {
                    invalidtargetstring += invalidtarget;
                    continue;
                }
                
                invalidtargetstring += "<dev string:x8a0>" + invalidtarget;
            }
            
            fprintln( level.var_2ac6c688b6c64715, "<dev string:x955>" + invalidtargetstring );
        }
    }

    // Namespace vehicle_roads
    // Params 0, eflags: 0x4
    // Checksum 0x1ce5d8c1, Offset: 0x553e
    // Size: 0x98, Type: dev
    function private function_a98823b5193d96e4()
    {
        foreach ( connectiontargetname in level.connectionsoutput )
        {
            assert( isdefined( level.roadsoutput[ connectiontargetname ] ), "<dev string:x979>" + connectiontargetname + "<dev string:x99e>" );
        }
    }

#/

// Namespace vehicle_roads
// Params 1, eflags: 0x4
// Checksum 0xba943f05, Offset: 0x55de
// Size: 0x3a
function private function_4d7349201f8b39f8( nodename )
{
    node = spawnstruct();
    node.key = nodename;
    level.roads[ nodename ] = node;
    return node;
}

// Namespace vehicle_roads
// Params 2, eflags: 0x4
// Checksum 0x2a029b0d, Offset: 0x5621
// Size: 0xba
function private function_e170b782e02a9da9( nodename, connectionname )
{
    assert( isdefined( function_d5de32e196353afe( connectionname ) ), "<dev string:x9d1>" + connectionname + "<dev string:x84a>" );
    
    if ( !isdefined( level.roads[ nodename ].connections ) )
    {
        level.roads[ nodename ].connections = [];
    }
    
    level.roads[ nodename ].connections[ level.roads[ nodename ].connections.size ] = connectionname;
    
    if ( !isdefined( level.roads[ connectionname ] ) )
    {
        connectionnode = function_4d7349201f8b39f8( connectionname );
    }
}

// Namespace vehicle_roads
// Params 2
// Checksum 0x7ab5ede7, Offset: 0x56e3
// Size: 0x20d
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
    assert( isdefined( var_4ca26a6b565d1f87 ), "<dev string:x81b>" + nodetargetname + "<dev string:x84a>" );
    
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
            level thread function_a8f9dfdffa161ebd( nodetargetname );
        #/
    }
}

/#

    // Namespace vehicle_roads
    // Params 1
    // Checksum 0x3c9e3a66, Offset: 0x58f8
    // Size: 0x7b, Type: dev
    function function_a8f9dfdffa161ebd( nodetargetname )
    {
        convoy = "<dev string:x9f3>" + nodetargetname;
        single = "<dev string:x9fe>" + nodetargetname;
        
        while ( !adddebugcommand( "<dev string:xa09>" + nodetargetname + "<dev string:xa43>" + single + "<dev string:xa5f>" ) )
        {
            waitframe();
        }
        
        while ( !adddebugcommand( "<dev string:xa65>" + nodetargetname + "<dev string:xa43>" + convoy + "<dev string:xa5f>" ) )
        {
            waitframe();
        }
    }

    // Namespace vehicle_roads
    // Params 1
    // Checksum 0x4f620117, Offset: 0x597b
    // Size: 0x169, Type: dev
    function function_8437fc8203abb755( vehiclenavmeshlayer )
    {
        self endon( "<dev string:xa9f>" );
        duration = 400;
        textverticaloffset = 15;
        
        if ( utility::issp() )
        {
            var_af2b0500d15056d9 = getdvarint( @"hash_4e06d4ff70605269", 0 );
            print3d( self.origin, "<dev string:xaaf>" + var_af2b0500d15056d9, ( 1, 1, 1 ), 1, 1, duration );
        }
        
        navmeshlayer = vehiclenavmeshlayer ?? "<dev string:xace>";
        speedmph = undefined;
        
        if ( self hascomponent( "<dev string:xad9>" ) )
        {
            speedmph = self function_24e10bf6894fa869( "<dev string:xad9>", "<dev string:xae0>" ) * 0.056818;
        }
        else if ( self hascomponent( "<dev string:xaef>" ) )
        {
            speedmph = self function_24e10bf6894fa869( "<dev string:xaf6>", "<dev string:xafe>" ) * 0.056818;
        }
        
        var_d1b86c0732a152e0 = getdvarint( @"hash_b0706332ae0689bc", 1 );
        print3d( self.origin + ( 0, 0, textverticaloffset * 3 ), "<dev string:xb0d>" + navmeshlayer + "<dev string:xb1e>" + speedmph, ( 1, 1, 1 ), 1, 1, duration );
        print3d( self.origin + ( 0, 0, textverticaloffset ), "<dev string:xb29>" + var_d1b86c0732a152e0, ( 1, 1, 1 ), 1, 1, duration );
    }

    // Namespace vehicle_roads
    // Params 2
    // Checksum 0x12f003d5, Offset: 0x5aec
    // Size: 0x96, Type: dev
    function function_2b723e6a5a86a006( splinepoints, pathcolor )
    {
        self notify( "ba89b9ed6e1a8a94" );
        self endon( "ba89b9ed6e1a8a94" );
        self endon( "<dev string:x471>" );
        self endon( "<dev string:xa9f>" );
        
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
    // Checksum 0x757ba, Offset: 0x5b8a
    // Size: 0xfa, Type: dev
    function private function_773b3991cba8bcd1( road, vehicleendnode, var_ffa77065c35c927f )
    {
        if ( isdefined( road.connections ) )
        {
            foreach ( connectionnode in road.connections )
            {
                connectionvehiclenode = function_d5de32e196353afe( connectionnode );
                assert( isdefined( connectionvehiclenode ), "<dev string:x9d1>" + connectionnode + "<dev string:x84a>" );
                line( vehicleendnode.origin, connectionvehiclenode.origin, ( 1, 0.65, 0 ), 1, 0, var_ffa77065c35c927f );
            }
        }
    }

    // Namespace vehicle_roads
    // Params 8
    // Checksum 0xfedcc498, Offset: 0x5c8c
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
    // Checksum 0xc1f9181a, Offset: 0x5e0b
    // Size: 0x73, Type: dev
    function function_38bcfc0e39bb2fda()
    {
        self notify( "f28b44a02ea5bf71" );
        self endon( "f28b44a02ea5bf71" );
        self endon( "<dev string:xb4f>" );
        self endon( "<dev string:x471>" );
        
        while ( true )
        {
            waitframe();
            line( self.origin + ( 0, 0, 200 ), self.origin + ( 0, 0, 2048 ), ( 1, 0, 0 ), 1, 0, 1 );
        }
    }

    // Namespace vehicle_roads
    // Params 3
    // Checksum 0xe4c9ded2, Offset: 0x5e86
    // Size: 0x311, Type: dev
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
        
        self notify( "<dev string:xb4f>" );
        self endon( "<dev string:xb4f>" );
        self endon( "<dev string:x471>" );
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
                            endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections ?? [], 0, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, startnodetargetname, goalnodetargetname, pathcolor );
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
                            endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections ?? [], 0, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, goalnodetargetname, undefined, var_157569322bb6e6e3 );
                        }
                        else
                        {
                            endnode = function_e79d9bfa12a8d0ff( roadstartvehiclenode, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, goalnodetargetname, undefined, var_157569322bb6e6e3 );
                        }
                    }
                    else if ( level.var_2aa90a9ef4e6c7c6 )
                    {
                        road = level.roads[ roadstartvehiclenode.targetname ];
                        endnode = function_e8fff5ff35e19e5e( roadstartvehiclenode, road.endkey, road.connections ?? [], 0, pathoffset, pathcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
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
    // Checksum 0x951acea5, Offset: 0x619f
    // Size: 0x19f, Type: dev
    function function_86e92f70942a3e4( drawconnections, var_553d47d9b2d39dda )
    {
        level notify( "<dev string:xb67>" );
        level endon( "<dev string:xb67>" );
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
                print3d( vehiclenode.origin, road.key + "<dev string:xb7b>" + vehiclenode.var_5262adea3d5fcba3, ( 1, 1, 1 ), 1, 1, var_ffa77065c35c927f );
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
    // Checksum 0xadbeca6f, Offset: 0x6346
    // Size: 0x2aa, Type: dev
    function function_46e7fc115379abb2( speedmph, vehiclenavmeshlayer, debugdraw )
    {
        self notify( "fee61966cd148123" );
        self endon( "fee61966cd148123" );
        self endon( "<dev string:x471>" );
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
                tacpoint = getexposedtacpointwithvisinradius( enemy.origin, enemy.origin, minradius, maxradius, var_1d748eca4605b943 );
                
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
                    visible = trace[ "<dev string:xb80>" ] == "<dev string:xb8b>" && trace[ "<dev string:xb9d>" ] == enemy;
                    color = visible ? ( 1, 1, 0 ) : ( 1, 0, 0 );
                    line( enemy getcentroid(), self.origin, color, 1, 0, 1 );
                    print3d( self.origin, string( attackpointdistance ), color, 1, 1, 1 );
                }
                
                if ( trace[ "<dev string:xb80>" ] == "<dev string:xb8b>" && trace[ "<dev string:xb9d>" ] == enemy )
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
    // Checksum 0x95f2568d, Offset: 0x65f8
    // Size: 0x4e, Type: dev
    function private function_1ceeee887e2dc5e8( vehiclenode )
    {
        level endon( "<dev string:x566>" );
        
        while ( true )
        {
            waitframe();
            endnode = function_e79d9bfa12a8d0ff( vehiclenode, ( 0, 0, 100 ), ( 0.99, 0.2, 0.49 ) );
        }
    }

    // Namespace vehicle_roads
    // Params 2, eflags: 0x4
    // Checksum 0x99bd80b3, Offset: 0x664e
    // Size: 0xcd, Type: dev
    function private function_789eebef8abc2637( splinestartnode, connectiontargetname )
    {
        level endon( "<dev string:x566>" );
        
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
    // Checksum 0xcbf84930, Offset: 0x6723
    // Size: 0x165, Type: dev
    function private function_c0237c77838fe9cc( selectedvehiclenode )
    {
        level notify( "<dev string:xba7>" );
        level endon( "<dev string:xba7>" );
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
            print3d( selectedvehiclenode.origin + debugoffset, "<dev string:x259>" + roadstartnode.targetname, debugcolor, 1, 3, waitdurationframes );
            sphere( selectedvehiclenode.origin, 175, debugcolor, 0, waitdurationframes );
            
            if ( nodeheading )
            {
                utility::draw_arrow( selectedvehiclenode.origin + debugoffset, selectedvehiclenode.origin + debugoffset + nodeheading * 500, debugcolor, 100, 0, waitdurationframes );
            }
        }
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0x96710936, Offset: 0x6890
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
            traceendlocation = traceresults[ "<dev string:xbcb>" ];
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
// Checksum 0x8acb557b, Offset: 0x6961
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
// Checksum 0x748ce371, Offset: 0x69bf
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
// Checksum 0xe25e24fd, Offset: 0x6abe
// Size: 0x2de
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
                    assert( isdefined( function_d5de32e196353afe( connectionname ) ), "<dev string:x9d1>" + connectionname + "<dev string:x84a>" );
                    
                    if ( !isdefined( level.roads[ nodetargetname ].connections ) )
                    {
                        level.roads[ nodetargetname ].connections = [];
                    }
                    
                    level.roads[ nodetargetname ].connections[ level.roads[ nodetargetname ].connections.size ] = connectionname;
                    continue;
                }
                
                if ( !isdefined( level.roads[ nodetargetname ].connections ) )
                {
                    level.roads[ nodetargetname ].connections = [];
                }
                
                level.roads[ nodetargetname ].connections[ level.roads[ nodetargetname ].connections.size ] = connectionname;
            }
        }
    }
}

/#

    // Namespace vehicle_roads
    // Params 11
    // Checksum 0xbf7ee25f, Offset: 0x6da4
    // Size: 0x472, Type: dev
    function function_e8fff5ff35e19e5e( startnode, endkey, connections, var_e1b83da6b2b72321, nodeoffset, roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda, var_4fd2ba081528d08e, var_4fd2b9081528ce5b, var_dfbdb69003a1b65d )
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
        
        if ( isdefined( level.players[ 0 ] ) && var_e1b83da6b2b72321 && isdefined( level.players[ 0 ].origin ) && distancesquared( startnode.origin, level.players[ 0 ].origin ) < 9000000 )
        {
            print3d( startnode.origin + ( 0, 0, 10 ), startnode.targetname, ( 1, 1, 1 ), 1, 3, var_ffa77065c35c927f );
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
    // Checksum 0x68e830fa, Offset: 0x721e
    // Size: 0x14a, Type: dev
    function function_3fa3631d2dc72ced( var_553d47d9b2d39dda )
    {
        level notify( "<dev string:xbd7>" );
        level endon( "<dev string:xbd7>" );
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
                endnode = function_e8fff5ff35e19e5e( vehiclenode, road.endkey, road.connections ?? [], level.var_3c3f052296848dc7, ( 0, 0, 15 ), roadcolor, var_ffa77065c35c927f, var_553d47d9b2d39dda );
            }
            
            wait waitduration;
        }
    }

    // Namespace vehicle_roads
    // Params 0
    // Checksum 0x715faaf4, Offset: 0x7370
    // Size: 0x3d6, Type: dev
    function function_c126d9b5dec4bc58()
    {
        if ( level.var_7a244f0b785880cc )
        {
            return;
        }
        
        level.var_7a244f0b785880cc = 1;
        contents = physics_createcontents( [ "<dev string:xbef>", "<dev string:xc07>", "<dev string:xc20>", "<dev string:xc3f>" ] );
        ignore = vehicle_tracking::function_5820a38c9873992e();
        caststhisframe = 0;
        var_27994b09a1d37d56 = [];
        
        foreach ( road in level.roads )
        {
            var_27994b09a1d37d56 = arraycombineunique( var_27994b09a1d37d56, road.connections ?? [], [ road.key ] );
        }
        
        visited = [];
        
        foreach ( targetname in var_27994b09a1d37d56 )
        {
            vehiclenode = function_d5de32e196353afe( targetname );
            
            if ( visited[ vehiclenode.index ] )
            {
                continue;
            }
            
            visited[ vehiclenode.index ] = 1;
            vehiclenode.groundpos = utility::drop_to_ground( vehiclenode.origin, 200 ) + ( 0, 0, 125 );
            
            if ( distance( vehiclenode.origin, vehiclenode.groundpos ) > 5000 )
            {
                vehiclenode.groundpos = getclosestpointonnavmesh( vehiclenode.origin, level.vehiclenavmeshlayer ) + ( 0, 0, 125 );
            }
            
            while ( vehiclenode.target )
            {
                startorigin = vehiclenode.groundpos;
                vehiclenode = function_d5de32e196353afe( vehiclenode.target );
                
                if ( visited[ vehiclenode.index ] )
                {
                    break;
                }
                
                visited[ vehiclenode.index ] = 1;
                vehiclenode.groundpos = utility::drop_to_ground( vehiclenode.origin, 200 ) + ( 0, 0, 125 );
                
                if ( distance( vehiclenode.origin, vehiclenode.groundpos ) > 5000 )
                {
                    vehiclenode.groundpos = getclosestpointonnavmesh( vehiclenode.origin, level.vehiclenavmeshlayer ) + ( 0, 0, 125 );
                }
                
                cast = physics_spherecast( startorigin, vehiclenode.groundpos, 50, contents, ignore, "<dev string:xc5d>", "<dev string:xc75>", 1 );
                
                if ( cast.size > 0 && isdefined( cast[ 0 ][ 0 ][ "<dev string:xbcb>" ] ) )
                {
                    println( "<dev string:xc89>" + cast[ 0 ][ 0 ][ "<dev string:xbcb>" ] );
                    line( startorigin, vehiclenode.groundpos, ( 1, 0, 0 ), 1, 0, 100000 );
                    sphere( cast[ 0 ][ 0 ][ "<dev string:xbcb>" ], 20, ( 1, 0, 0 ), 0, 100000 );
                }
                
                caststhisframe += 1;
                
                if ( caststhisframe >= 50 )
                {
                    waitframe();
                    caststhisframe = 0;
                }
            }
        }
        
        level.var_7a244f0b785880cc = undefined;
    }

#/
