#using scripts\asm\asm;
#using scripts\asm\cap;
#using scripts\common\cap;

#namespace interaction_common;

// Namespace interaction_common
// Params 1
// Checksum 0xb15f60a7, Offset: 0x607
// Size: 0x2c
function function_b4c8cc8d02ad0b95( interactionid )
{
    var_6dcd087706b2fe81 = function_74c1da714488705c();
    thread function_61857cad428ddd0f();
    thread function_91053ba261a3aefc();
}

// Namespace interaction_common
// Params 1
// Checksum 0xe702eb7f, Offset: 0x63b
// Size: 0x60
function function_dabb6663ba0a5177( interactionid )
{
    if ( isai( self ) )
    {
        self._blackboard.idlenode = undefined;
        self._blackboard.var_8acd86e75a05d61a = undefined;
        self.var_e0bc276499c18875 = undefined;
        
        if ( isalive( self ) )
        {
            if ( self.var_74e6943ef6ad6db1 )
            {
                self enabletraversals( 1 );
            }
        }
    }
}

// Namespace interaction_common
// Params 1
// Checksum 0xceebb47c, Offset: 0x6a3
// Size: 0x20c
function function_d4be89b1cf3d4993( funcid )
{
    switch ( funcid )
    {
        case #"hash_4d7ca12cb5ce1028":
            return &startcap;
        case #"hash_68f0ff432f6351ef":
            return &function_8d857b0f49d5bc35;
        case #"hash_c8fcdf8b63cc465a":
            return &function_d7ce78b577ce3552;
        case #"hash_303d74db152a39b9":
            return &function_ac09dd92b7250c46;
        case #"hash_996b6e15533d90f1":
            return &withindisttogoal;
        case #"hash_b541f16499b1633d":
            return &processevent;
        case #"hash_c0639b15cea67610":
            return &function_b4c8cc8d02ad0b95;
        case #"hash_96053be986d24f88":
            return &function_dabb6663ba0a5177;
        case #"hash_6e88d76179a2a0c0":
            return &function_ac130d84a0eb32ff;
        case #"hash_cb33d1efb4e52f0c":
            return &function_36e116420f58ccb3;
        case #"hash_8cd577f687228a56":
            return &function_1ac2b621b44f294f;
        case #"hash_c2342f9a0757f30":
            return &function_35b47a28ed5af7f5;
        case #"hash_af8904470869cfc3":
            return &function_320f55574f0726f4;
        case #"hash_a56eca06864aaf61":
            return &inplace;
        case #"hash_8cc77e3e31358f72":
            return &function_a6d48b868d228471;
        case #"hash_fd9154ff75bc4e6b":
            return &function_4bb4e69fc697b378;
        case #"hash_da98e33c69929347":
            return &function_245a8ceff5a9a894;
        case #"hash_1e571ef374ec6101":
            return &cleanupscriptmodel;
        case #"hash_694e601f9cb204ca":
            return &setupscriptmodel;
        case #"hash_ec1950a022e6c185":
            return &function_77fcdaeeb8eee5e4;
        case #"hash_d218d98026b6b9d7":
            return &function_f9cec32b76c81972;
        case #"hash_747eeb8dcda02e2c":
            return &function_551d6f0d52dc24bd;
        case #"hash_e5196ef5ace8ec0c":
            return &function_f7e7d22da22dc26d;
        case #"hash_c7f66c13ac37bc15":
            return &function_a20f0c474fa24226;
        case #"hash_159e471acd245f61":
            return &function_3d3f02fd7a5fbeab;
        case #"hash_8014355657c4e7f0":
            return &function_ff3fb91b3d4e6197;
        case #"hash_2c7ce84b74bbddbd":
            return &debugstate;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace interaction_common
// Params 0
// Checksum 0x2c49a5da, Offset: 0x8b7
// Size: 0x9
function function_8d857b0f49d5bc35()
{
    function_38f8b447cf8ea7cc();
}

// Namespace interaction_common
// Params 0
// Checksum 0xbd469e24, Offset: 0x8c8
// Size: 0x2
function function_c0d7bc8e31affd7f()
{
    
}

// Namespace interaction_common
// Params 0
// Checksum 0x2dde6ea9, Offset: 0x8d2
// Size: 0x9
function function_d7ce78b577ce3552()
{
    function_88c7216b32d58113();
}

// Namespace interaction_common
// Params 2
// Checksum 0xa0988b15, Offset: 0x8e3
// Size: 0x3a
function debugstate( statename, params )
{
    println( "<dev string:x45>" + gettime() + "<dev string:x4f>" + statename + "<dev string:x5c>" + params[ 0 ] );
}

// Namespace interaction_common
// Params 2
// Checksum 0x43ddc674, Offset: 0x925
// Size: 0x90
function function_f7e7d22da22dc26d( statename, params )
{
    if ( isarray( params ) )
    {
        setting = params[ 0 ];
    }
    else
    {
        setting = params;
    }
    
    switch ( setting )
    {
        case #"hash_c1c88ef798270243":
            self animmode( "noclip" );
            break;
        case #"hash_6caf06e2c9e6872e":
            self animmode( "zonly_physics" );
            break;
        case #"hash_7038dec66d8275be":
            self animmode( self.var_b3af6fb4e258ac21 );
            break;
    }
}

// Namespace interaction_common
// Params 2
// Checksum 0xf5d537d9, Offset: 0x9bd
// Size: 0x51
function function_ac09dd92b7250c46( statename, params )
{
    assert( params.size == 1 );
    phasename = params[ 0 ];
    self._blackboard.bseqphase = phasename;
    function_c3d7c7c36e9eeb93( phasename );
}

// Namespace interaction_common
// Params 2
// Checksum 0xb663fc4f, Offset: 0xa16
// Size: 0x234
function startcap( statename, params )
{
    if ( self.startinteractionimmediate )
    {
        startcap_immediate( statename, params );
        return;
    }
    
    capinfo = getcapinfoforparticipant( self );
    
    if ( !isdefined( capinfo ) )
    {
        capinfo = getcapinfoforrole( self, params[ 0 ] );
        
        if ( !isdefined( capinfo ) )
        {
            return;
        }
    }
    
    capname = capinfo.capname;
    animset = capinfo.animation;
    arrivalstateoverride = capinfo.arrivalstateoverride;
    introstatename = capinfo.initialstate;
    introaliasname = capinfo.initialalias;
    thread function_61857cad428ddd0f();
    thread function_91053ba261a3aefc();
    interaction = spawnstruct();
    interaction.angles = self._blackboard.var_54bc96b8017ea2ee;
    interaction.origin = self._blackboard.var_8690cdaf3fef6fec;
    
    if ( isdefined( self findoverridearchetype( "default" ) ) )
    {
        var_7f3a6317b7eb7494 = self findoverridearchetype( "default" ) + "_cap_arrival";
        
        if ( archetypehasstate( capname, var_7f3a6317b7eb7494 ) )
        {
            arrivalstateoverride = var_7f3a6317b7eb7494;
        }
    }
    
    if ( isdefined( introstatename ) && isdefined( introaliasname ) )
    {
        alias = archetypegetalias( animset, introstatename, introaliasname, 0 );
        animation = alias.anims;
        
        if ( isarray( animation ) )
        {
            animation = animation[ 0 ];
        }
        
        originalangles = interaction.angles;
        originalorigin = interaction.origin;
        interaction.origin = getstartorigin( originalorigin, originalangles, animation );
        interaction.angles = getstartangles( originalorigin, originalangles, animation );
    }
    
    self.interaction_angles = interaction.angles;
    self.interaction_origin = getgroundposition( interaction.origin, 1 );
    self.var_6a5e9f806fe6f239 = params[ 0 ];
    function_67f4eef6ba6c5c29( arrivalstateoverride, animset );
    cap::cap_reach_and_arrive( interaction, capname, animset, arrivalstateoverride );
}

// Namespace interaction_common
// Params 2
// Checksum 0x210f2ec6, Offset: 0xc52
// Size: 0x229
function startcap_immediate( statename, params )
{
    capinfo = getcapinfoforparticipant( self );
    
    if ( !isdefined( capinfo ) )
    {
        capinfo = getcapinfoforrole( self, params[ 0 ] );
        
        if ( !isdefined( capinfo ) )
        {
            return;
        }
    }
    
    capname = capinfo.capname;
    animset = capinfo.animation;
    arrivalstateoverride = capinfo.arrivalstateoverride;
    introstatename = capinfo.initialstate;
    introaliasname = capinfo.initialalias;
    self.var_6a5e9f806fe6f239 = params[ 0 ];
    interaction = spawnstruct();
    interaction.angles = self._blackboard.var_54bc96b8017ea2ee;
    interaction.origin = self._blackboard.var_8690cdaf3fef6fec;
    
    if ( isdefined( self findoverridearchetype( "default" ) ) )
    {
        var_7f3a6317b7eb7494 = self findoverridearchetype( "default" ) + "_cap_arrival";
        
        if ( archetypehasstate( capname, var_7f3a6317b7eb7494 ) )
        {
            arrivalstateoverride = var_7f3a6317b7eb7494;
        }
    }
    
    if ( isdefined( introstatename ) && isdefined( introaliasname ) )
    {
        alias = archetypegetalias( animset, introstatename, introaliasname, 0 );
        animation = alias.anims;
        
        if ( isarray( animation ) )
        {
            animation = animation[ 0 ];
        }
        
        originalangles = interaction.angles;
        originalorigin = interaction.origin;
        interaction.origin = getstartorigin( originalorigin, originalangles, animation );
        interaction.angles = getstartangles( originalorigin, originalangles, animation );
    }
    
    self.interaction_angles = interaction.angles;
    self.interaction_origin = interaction.origin;
    cap::cap_start( capname, animset, 0 );
    asm::asm_fireephemeralevent( "move", "end" );
    self forceteleport( self.interaction_origin, self.interaction_angles, 2048 );
}

// Namespace interaction_common
// Params 4
// Checksum 0xe002f695, Offset: 0xe83
// Size: 0x2c
function function_1ac2b621b44f294f( asmname, statename, tostatename, params )
{
    return self function_51631ea7d587647d();
}

// Namespace interaction_common
// Params 4
// Checksum 0xcbe217c1, Offset: 0xeb8
// Size: 0x3a, Type: bool
function function_35b47a28ed5af7f5( asmname, statename, tostatename, params )
{
    return self function_51631ea7d587647d() && !self.arriving;
}

// Namespace interaction_common
// Params 3
// Checksum 0x94000310, Offset: 0xefb
// Size: 0x92
function function_995af6cdd5c3732d( asmname, statename, params )
{
    if ( self.var_9221857bb3db537a )
    {
        self animmode( "noclip" );
    }
    
    animid = asm::asm_getanim( asmname, statename );
    xanim = asm::asm_getxanim( statename, animid );
    
    if ( params == "loop" )
    {
        self.var_3501137537f98022 = getanimlength( xanim );
        asm_cap::cap_loopanim( asmname, statename, params );
        return;
    }
    
    asm_cap::function_bda11d6bbb0f9abc( asmname, statename, params, animid );
}

// Namespace interaction_common
// Params 3
// Checksum 0x96d6fb0d, Offset: 0xf95
// Size: 0x97, Type: bool
function function_ac130d84a0eb32ff( asmname, statename, params )
{
    if ( self._blackboard.idlenode.repeat_interaction )
    {
        return !self._blackboard.idlenode.repeat_interaction;
    }
    
    if ( self.var_88af750d8cd349c1 )
    {
        return false;
    }
    
    if ( isdefined( self.var_d6fe9dca389ea0cb ) )
    {
        curtime = gettime();
        return ( curtime >= self.var_d6fe9dca389ea0cb );
    }
    
    return true;
}

// Namespace interaction_common
// Params 3
// Checksum 0xfcf6f26f, Offset: 0x1035
// Size: 0x2e, Type: bool
function function_36e116420f58ccb3( asmname, statename, params )
{
    if ( self.startinteractionimmediate )
    {
        return true;
    }
    
    return false;
}

// Namespace interaction_common
// Params 2
// Checksum 0x851055c8, Offset: 0x106c
// Size: 0x3a, Type: bool
function withindisttogoal( statename, params )
{
    mindist = params[ 0 ];
    
    if ( self.pathpending )
    {
        return false;
    }
    
    return self pathdisttogoal() <= mindist;
}

// Namespace interaction_common
// Params 3
// Checksum 0x29f73491, Offset: 0x10af
// Size: 0x199, Type: bool
function processevent( receiver, info, origin )
{
    self notify( "interaction_process_event" );
    
    if ( info == "relaxed" )
    {
        return true;
    }
    else if ( info == "panicked" || info == "cower" || info == "scared" || info == "flee" )
    {
        asm_cap::prop_drop();
        self._blackboard.bseqphase = "exit";
    }
    else if ( info == "curious" )
    {
        self._blackboard.var_8acd86e75a05d61a = self._blackboard.bseqphase;
        var_4d127952a867f5cb = self function_78c2e7c4a70a2205();
        
        if ( asm_cap::cap_hasalias( "curious", "curious_anim" ) )
        {
            self._blackboard.bseqphase = "curious";
            return true;
        }
        else if ( !var_4d127952a867f5cb )
        {
            return true;
        }
        else
        {
            asm_cap::prop_drop();
            self._blackboard.bseqphase = "exit";
            return false;
        }
    }
    else if ( !isdefined( self._blackboard.bseqphase ) || isdefined( self._blackboard.bseqphase ) && self._blackboard.bseqphase != "end" )
    {
        self._blackboard.bseqphase = "react";
        return true;
    }
    
    return false;
}

// Namespace interaction_common
// Params 1
// Checksum 0x39e87258, Offset: 0x1251
// Size: 0xc
function empty( params )
{
    
}

// Namespace interaction_common
// Params 1
// Checksum 0x570b70e0, Offset: 0x1265
// Size: 0x51, Type: bool
function function_320f55574f0726f4( param )
{
    statename = "curious";
    alias = "curious_anim";
    animresult = archetypegetrandomalias( self.animsetname, statename, alias, 0 );
    
    if ( isdefined( animresult ) )
    {
        return true;
    }
    
    return false;
}

// Namespace interaction_common
// Params 2
// Checksum 0xd11fa7ca, Offset: 0x12bf
// Size: 0x68
function inplace( statename, params )
{
    self._blackboard.bseqinplace = 1;
    interactionid = self getinteractionid();
    assert( isdefined( interactionid ) );
    
    if ( level.var_bbff6df6ad9df430 )
    {
        createinteractionnavobstacle( interactionid );
        return;
    }
    
    createinteractionnavrepulsor( interactionid );
}

// Namespace interaction_common
// Params 1
// Checksum 0xf715d2f, Offset: 0x132f
// Size: 0x27
function function_9abedd84e16a2b9b( interactionid )
{
    repulsorname = function_562beb2c3d9ef8e2( interactionid );
    destroynavrepulsor( repulsorname );
}

// Namespace interaction_common
// Params 1
// Checksum 0xe609234b, Offset: 0x135e
// Size: 0x111
function function_de2253ab2039ac7c( interactionid )
{
    if ( isdefined( self._blackboard.var_c6236bc6766c2c2 ) )
    {
        destroynavobstacle( self._blackboard.var_c6236bc6766c2c2 );
        self._blackboard.var_c6236bc6766c2c2 = undefined;
    }
    
    bsequsers = getbsequsers( interactionid );
    
    if ( bsequsers.size == 0 )
    {
        return;
    }
    
    foreach ( bsequser in bsequsers )
    {
        obstacleid = bsequser._blackboard.var_c6236bc6766c2c2;
        
        if ( isdefined( obstacleid ) )
        {
            destroynavobstacle( obstacleid );
            bsequser._blackboard.var_c6236bc6766c2c2 = undefined;
        }
    }
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0x4fbab975, Offset: 0x1477
// Size: 0x14
function private function_562beb2c3d9ef8e2( interactionid )
{
    return "civilian_interaction_" + interactionid;
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0xccfeb856, Offset: 0x1494
// Size: 0x2ec
function private createinteractionnavrepulsor( interactionid )
{
    bsequsers = getbsequsers( interactionid );
    
    if ( bsequsers.size == 0 )
    {
        return;
    }
    
    var_86394cebdfe9c9a1 = [];
    
    foreach ( bsequser in bsequsers )
    {
        if ( isdefined( bsequser._blackboard ) && bsequser._blackboard.bseqinplace )
        {
            var_86394cebdfe9c9a1[ var_86394cebdfe9c9a1.size ] = bsequser;
        }
    }
    
    if ( var_86394cebdfe9c9a1.size <= 1 )
    {
        return;
    }
    
    circleorigin = ( 0, 0, 0 );
    circleradius = 0;
    
    if ( var_86394cebdfe9c9a1.size >= 2 )
    {
        minx = var_86394cebdfe9c9a1[ 0 ].origin[ 0 ];
        maxx = var_86394cebdfe9c9a1[ 0 ].origin[ 0 ];
        miny = var_86394cebdfe9c9a1[ 0 ].origin[ 1 ];
        maxy = var_86394cebdfe9c9a1[ 0 ].origin[ 1 ];
        
        for ( bsequserindex = 1; bsequserindex < var_86394cebdfe9c9a1.size ; bsequserindex++ )
        {
            bsequserorigin = var_86394cebdfe9c9a1[ bsequserindex ].origin;
            
            if ( bsequserorigin[ 0 ] < minx )
            {
                minx = bsequserorigin[ 0 ];
            }
            else if ( bsequserorigin[ 0 ] > maxx )
            {
                maxx = bsequserorigin[ 0 ];
            }
            
            if ( bsequserorigin[ 1 ] < miny )
            {
                miny = bsequserorigin[ 1 ];
                continue;
            }
            
            if ( bsequserorigin[ 1 ] > maxy )
            {
                maxy = bsequserorigin[ 1 ];
            }
        }
        
        circleorigin = ( ( maxx + minx ) / 2, ( maxy + miny ) / 2, 0 );
        circleradiussq = 0;
        circleoriginz = 0;
        
        foreach ( user in var_86394cebdfe9c9a1 )
        {
            circleoriginz += user.origin[ 2 ];
            distancefromcentersq = distance2dsquared( circleorigin, user.origin );
            
            if ( distancefromcentersq > circleradiussq )
            {
                circleradiussq = distancefromcentersq;
            }
        }
        
        circleoriginz /= var_86394cebdfe9c9a1.size;
        circleorigin += ( 0, 0, circleoriginz );
        circleradius = sqrt( circleradiussq ) + 24;
    }
    
    repulsorname = function_562beb2c3d9ef8e2( interactionid );
    destroynavrepulsor( repulsorname );
    createnavrepulsor( repulsorname, -1, circleorigin, circleradius, 0, "all" );
    thread function_b5b810a40f914e06();
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0xbec26988, Offset: 0x1788
// Size: 0x2f1
function private createinteractionnavobstacle( interactionid )
{
    bsequsers = getbsequsers( interactionid );
    
    if ( bsequsers.size == 0 )
    {
        return;
    }
    
    var_86394cebdfe9c9a1 = [];
    
    foreach ( bsequser in bsequsers )
    {
        if ( bsequser._blackboard.bseqinplace )
        {
            var_86394cebdfe9c9a1[ var_86394cebdfe9c9a1.size ] = bsequser;
        }
    }
    
    if ( var_86394cebdfe9c9a1.size <= 1 )
    {
        return;
    }
    
    obstacleorigin = ( 0, 0, 0 );
    obstacleangle = ( 0, 0, 0 );
    var_8e37c62c6e25e49e = 0;
    var_8e37c72c6e25e6d1 = 0;
    userhalfsize = 7;
    
    if ( var_86394cebdfe9c9a1.size == 2 )
    {
        obstacleorigin = ( var_86394cebdfe9c9a1[ 0 ].origin + var_86394cebdfe9c9a1[ 1 ].origin ) / 2;
        userdiff = var_86394cebdfe9c9a1[ 1 ].origin - var_86394cebdfe9c9a1[ 0 ].origin;
        obstacleangle = vectortoangles( userdiff );
        var_8e37c72c6e25e6d1 = userhalfsize;
        var_8e37c62c6e25e49e = length( userdiff ) / 2 + userhalfsize;
    }
    else if ( var_86394cebdfe9c9a1.size > 2 )
    {
        minx = var_86394cebdfe9c9a1[ 0 ].origin[ 0 ];
        maxx = var_86394cebdfe9c9a1[ 0 ].origin[ 0 ];
        miny = var_86394cebdfe9c9a1[ 0 ].origin[ 1 ];
        maxy = var_86394cebdfe9c9a1[ 0 ].origin[ 1 ];
        obstacleoriginz = 0;
        
        for ( bsequserindex = 1; bsequserindex < var_86394cebdfe9c9a1.size ; bsequserindex++ )
        {
            obstacleoriginz += var_86394cebdfe9c9a1[ bsequserindex ].origin[ 2 ];
            bsequserorigin = var_86394cebdfe9c9a1[ bsequserindex ].origin;
            
            if ( bsequserorigin[ 0 ] < minx )
            {
                minx = bsequserorigin[ 0 ];
            }
            else if ( bsequserorigin[ 0 ] > maxx )
            {
                maxx = bsequserorigin[ 0 ];
            }
            
            if ( bsequserorigin[ 1 ] < miny )
            {
                miny = bsequserorigin[ 1 ];
                continue;
            }
            
            if ( bsequserorigin[ 1 ] > maxy )
            {
                maxy = bsequserorigin[ 1 ];
            }
        }
        
        obstacleoriginz /= var_86394cebdfe9c9a1.size;
        obstacleorigin = ( ( maxx + minx ) / 2, ( maxy + miny ) / 2, obstacleoriginz );
        var_8e37c62c6e25e49e = ( maxx - minx ) / 2 + userhalfsize;
        var_8e37c72c6e25e6d1 = ( maxy - miny ) / 2 + userhalfsize;
    }
    
    function_de2253ab2039ac7c( interactionid );
    bounds = ( var_8e37c62c6e25e49e, var_8e37c72c6e25e6d1, userhalfsize );
    self._blackboard.var_c6236bc6766c2c2 = createnavbadplacebybounds( obstacleorigin, bounds, obstacleangle, 5 );
    thread function_b5b810a40f914e06();
}

// Namespace interaction_common
// Params 4
// Checksum 0x17fe31d0, Offset: 0x1a81
// Size: 0x18a, Type: bool
function function_a6d48b868d228471( asmname, statename, tostatename, params )
{
    reactyaw = 0;
    
    if ( !archetypehasstate( self.animsetname, tostatename ) )
    {
        return false;
    }
    
    if ( isdefined( self.var_dd6868ae78a8de98 ) )
    {
        delta = self.var_dd6868ae78a8de98 - self.origin;
        deltayaw = vectortoyaw( delta );
        reactyaw = self.angles[ 1 ] - deltayaw;
    }
    
    reactyaw = angleclamp180( reactyaw );
    directionindex = function_71a9f15871d4c043( reactyaw );
    alias = directionindex;
    animresult = archetypegetrandomalias( self.animsetname, tostatename, alias, 0 );
    
    if ( animresult )
    {
        return true;
    }
    
    if ( directionindex == 2 || directionindex == 8 )
    {
        doleft = 0;
        suffix = directionindex;
        
        if ( reactyaw < -120 && reactyaw > -180 )
        {
            doleft = 1;
        }
        
        alias = doleft ? suffix + "l" : suffix + "r";
        animresult = archetypegetrandomalias( self.animsetname, tostatename, alias, 0 );
        
        if ( !animresult )
        {
            doleft = !doleft;
            alias = doleft ? suffix + "l" : suffix + "r";
            animresult = archetypegetrandomalias( self.animsetname, tostatename, alias, 0 );
        }
        
        if ( animresult )
        {
            return true;
        }
        
        return false;
    }
    
    return false;
}

// Namespace interaction_common
// Params 3
// Checksum 0x91b5d221, Offset: 0x1c14
// Size: 0x2e, Type: bool
function function_286d9284164cc9c5( asmname, statename, params )
{
    if ( self.var_286d9284164cc9c5 )
    {
        return true;
    }
    
    return false;
}

// Namespace interaction_common
// Params 1
// Checksum 0x131878b9, Offset: 0x1c4b
// Size: 0x5a
function function_71a9f15871d4c043( angle )
{
    angle = angleclamp180( angle );
    
    if ( angle > 120 || angle < -120 )
    {
        index = 2;
    }
    else if ( angle < -30 )
    {
        index = 4;
    }
    else if ( angle > 30 )
    {
        index = 6;
    }
    else
    {
        index = 8;
    }
    
    return index;
}

// Namespace interaction_common
// Params 2
// Checksum 0x3060a24b, Offset: 0x1cae
// Size: 0xaf
function function_4bb4e69fc697b378( statename, params )
{
    newstate = "custom_patrol_lookaround_passthrough";
    
    if ( !isdefined( params[ 0 ] ) )
    {
        newstate = "stl_react_passthrough";
        
        if ( !isdefined( self.var_6002aa8166897fd7 ) )
        {
            if ( isdefined( self.var_8bb2da6a6aef303 ) )
            {
                self.var_6002aa8166897fd7 = self.var_8bb2da6a6aef303;
            }
            else
            {
                self.var_6002aa8166897fd7 = "med";
            }
        }
    }
    
    if ( self asmhasstate( self.asmname, newstate ) )
    {
        assert( self asmhasstate( self.asmname, newstate ) );
        self asmsetstate( self.asmname, newstate );
    }
}

// Namespace interaction_common
// Params 2
// Checksum 0x675b77ad, Offset: 0x1d65
// Size: 0x88
function function_245a8ceff5a9a894( statename, param )
{
    scriptlinkname = self function_13445ee74cf145d4();
    
    if ( isdefined( scriptlinkname ) )
    {
        scriptmodel = getent( scriptlinkname, #script_linkname );
        id = self getinteractionid();
        
        if ( isdefined( scriptmodel ) )
        {
            scriptmodel function_188718242ae3c942( id );
            return;
        }
        
        scriptable = getentitylessscriptablearray( scriptlinkname, #script_linkname );
        scriptable[ 0 ] function_efa6f9f9ab8d2157( id );
    }
}

// Namespace interaction_common
// Params 2
// Checksum 0xa874550c, Offset: 0x1df5
// Size: 0x4f
function setupscriptmodel( statename, param )
{
    if ( self isscriptableinstance() )
    {
        return;
    }
    
    self.animname = "script_model";
    self useanimtree( level.scr_animtree[ self.animname ] );
    self.var_e2d942184cb56c33 = 0;
}

// Namespace interaction_common
// Params 2
// Checksum 0xa6bdbd08, Offset: 0x1e4c
// Size: 0x3b
function function_77fcdaeeb8eee5e4( statename, param )
{
    if ( !self isscriptableinstance() )
    {
        return;
    }
    
    self.partname = self function_1102885d01e4b19b();
    self.endstatename = self function_b20ed534a5f3a9c0();
}

// Namespace interaction_common
// Params 2
// Checksum 0x56981ba7, Offset: 0x1e8f
// Size: 0x53
function cleanupscriptmodel( statename, param )
{
    if ( self isscriptableinstance() )
    {
        return;
    }
    
    self stopanimscripted();
    self unlink();
    
    if ( !self.var_e2d942184cb56c33 )
    {
        self physicslaunchserver( self.origin, ( 0, 0, 0 ) );
    }
}

// Namespace interaction_common
// Params 2
// Checksum 0x50a2403e, Offset: 0x1eea
// Size: 0x38
function function_551d6f0d52dc24bd( statename, param )
{
    if ( !self isscriptableinstance() )
    {
        return;
    }
    
    self setscriptablepartstate( self.partname, self.endstatename, 0 );
}

// Namespace interaction_common
// Params 2
// Checksum 0x98dfa2a5, Offset: 0x1f2a
// Size: 0x3a
function function_f9cec32b76c81972( statename, param )
{
    interactionscriptmodel = self function_90f71263a5ae4ecb();
    
    if ( isdefined( interactionscriptmodel ) )
    {
        interactionscriptmodel.var_e2d942184cb56c33 = 1;
    }
}

// Namespace interaction_common
// Params 2, eflags: 0x4
// Checksum 0xac33e7f7, Offset: 0x1f6c
// Size: 0x4d
function private function_67f4eef6ba6c5c29( statename, animset )
{
    aliases = archetypegetaliases( animset, statename );
    
    if ( isdefined( aliases ) )
    {
        if ( aliases.size == 18 )
        {
            self.var_e0bc276499c18875 = 1;
            return;
        }
    }
    
    self.var_e0bc276499c18875 = 0;
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0x76a15bc1, Offset: 0x1fc1
// Size: 0x15f
function private function_c3d7c7c36e9eeb93( phasename )
{
    userhalfsize = 5;
    
    if ( phasename == "single_loop" || phasename == "looping" )
    {
        if ( !isdefined( self._blackboard.var_627cb979706023d4 ) )
        {
            if ( level.var_bbff6df6ad9df430 )
            {
                bounds = ( userhalfsize, userhalfsize, userhalfsize );
                self._blackboard.var_627cb979706023d4 = createnavbadplacebybounds( self.origin, bounds, self.angles, 5 );
            }
            else
            {
                interactionid = self getinteractionid();
                self._blackboard.var_627cb979706023d4 = "solo_interaction_" + interactionid;
                createnavrepulsor( self._blackboard.var_627cb979706023d4, -1, self, undefined, undefined, "allies", "neutral", "axis" );
            }
            
            thread function_b5b810a40f914e06();
        }
        
        return;
    }
    
    if ( isdefined( self._blackboard.var_627cb979706023d4 ) )
    {
        if ( level.var_bbff6df6ad9df430 )
        {
            destroynavobstacle( self._blackboard.var_627cb979706023d4 );
        }
        else
        {
            destroynavrepulsor( self._blackboard.var_627cb979706023d4 );
        }
        
        self._blackboard.var_627cb979706023d4 = undefined;
    }
}

// Namespace interaction_common
// Params 0, eflags: 0xc
// Checksum 0x1b0c5080, Offset: 0x2128
// Size: 0xce
function private function_b5b810a40f914e06()
{
    self notify( "20aa01868175f123" );
    self endon( "20aa01868175f123" );
    level endon( "game_ended" );
    self waittill( "death" );
    
    if ( isdefined( self._blackboard.var_c6236bc6766c2c2 ) )
    {
        if ( level.var_bbff6df6ad9df430 )
        {
            destroynavobstacle( self._blackboard.var_c6236bc6766c2c2 );
        }
        else
        {
            destroynavrepulsor( self._blackboard.var_c6236bc6766c2c2 );
        }
    }
    
    if ( isdefined( self._blackboard.var_627cb979706023d4 ) )
    {
        if ( level.var_bbff6df6ad9df430 )
        {
            destroynavobstacle( self._blackboard.var_627cb979706023d4 );
            return;
        }
        
        destroynavrepulsor( self._blackboard.var_627cb979706023d4 );
    }
}

// Namespace interaction_common
// Params 4
// Checksum 0x8ab15db6, Offset: 0x21fe
// Size: 0x30
function function_a20f0c474fa24226( asmname, statename, tostatename, params )
{
    return self.stealth_enabled;
}

// Namespace interaction_common
// Params 2
// Checksum 0x41383ee, Offset: 0x2237
// Size: 0x47
function function_ff3fb91b3d4e6197( statename, param )
{
    id = self getinteractionid();
    
    if ( isdefined( level.var_ea329ecfbda528dc[ id ] ) )
    {
        return self [[ level.var_ea329ecfbda528dc[ id ] ]]();
    }
    
    return 0;
}

// Namespace interaction_common
// Params 1
// Checksum 0x4a2e405b, Offset: 0x2287
// Size: 0x4e
function function_65677bdf595d0c10( skit )
{
    var_6dcd087706b2fe81 = getaiinteractionscriptbundle( skit );
    
    if ( isdefined( var_6dcd087706b2fe81 ) && var_6dcd087706b2fe81.var_d519c5eb619a869e != "" )
    {
        return getscriptbundle( var_6dcd087706b2fe81.var_d519c5eb619a869e );
    }
    
    return undefined;
}

// Namespace interaction_common
// Params 0, eflags: 0x4
// Checksum 0x5893979a, Offset: 0x22dd
// Size: 0x158
function private function_74c1da714488705c()
{
    if ( !isdefined( level.var_dda5f2eb0a4e92e5 ) )
    {
        level.var_dda5f2eb0a4e92e5 = [];
    }
    
    interactionid = self getinteractionid();
    designdata = function_65677bdf595d0c10( interactionid );
    var_93b161ccfeecc92 = function_80eb2badd88a772d( interactionid );
    var_1a9b5e27b4a44993 = 0;
    var_4697f0c3cd41baef = undefined;
    
    if ( level.var_dda5f2eb0a4e92e5.size > 0 )
    {
        for ( i = 0; i < level.var_dda5f2eb0a4e92e5.size ; i++ )
        {
            if ( level.var_dda5f2eb0a4e92e5[ i ].var_93b161ccfeecc92 == var_93b161ccfeecc92 )
            {
                var_4697f0c3cd41baef = i;
                var_1a9b5e27b4a44993 = 1;
                break;
            }
        }
    }
    
    if ( !var_1a9b5e27b4a44993 )
    {
        var_4697f0c3cd41baef = level.var_dda5f2eb0a4e92e5.size;
        level.var_dda5f2eb0a4e92e5[ level.var_dda5f2eb0a4e92e5.size ] = spawnstruct();
        level.var_dda5f2eb0a4e92e5[ var_4697f0c3cd41baef ].var_93b161ccfeecc92 = var_93b161ccfeecc92;
        level.var_dda5f2eb0a4e92e5[ var_4697f0c3cd41baef ].designdata = function_65677bdf595d0c10( var_93b161ccfeecc92 );
    }
    
    var_6dcd087706b2fe81 = level.var_dda5f2eb0a4e92e5[ var_4697f0c3cd41baef ];
    function_7a66f7ad5b1e4e2b( var_6dcd087706b2fe81 );
    function_cc8bd33e9467ea51( var_6dcd087706b2fe81 );
    function_d8af3dd60e0f9dd8( var_6dcd087706b2fe81 );
    function_fd3432db2be7becf( var_6dcd087706b2fe81 );
    return var_6dcd087706b2fe81;
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0xa95cf51, Offset: 0x243e
// Size: 0xac
function private function_d8af3dd60e0f9dd8( var_6dcd087706b2fe81 )
{
    self.var_9221857bb3db537a = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.disablecollision;
    self.var_fda053823240135f = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_c0f48b7e563e339b;
    self.var_14c834e9d5890f26 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_fc417ba53b712766;
    self.var_ca126cc79643ebe7 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_92038f0454243433;
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0x6a8685d9, Offset: 0x24f2
// Size: 0x6e
function private function_cc8bd33e9467ea51( var_6dcd087706b2fe81 )
{
    if ( isdefined( var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_35289731ad3e1f9f ) )
    {
        self.var_4f2af3a3297f77a3 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_35289731ad3e1f9f;
        
        if ( self.var_4f2af3a3297f77a3 )
        {
            self.var_88af750d8cd349c1 = 1;
        }
    }
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0x5d7af469, Offset: 0x2568
// Size: 0xf5
function private function_7a66f7ad5b1e4e2b( var_6dcd087706b2fe81 )
{
    if ( isdefined( var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_e797a3f0850732e9 ) )
    {
        self.var_56f4e62552a79fe7 = 1;
        self.var_2e193c17d5de0ad5 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_e797a3f0850732e9;
        self.var_3e167603fbee66b4 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_2f766e8b86557248;
        self.var_cc855622aeaa2420 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_71b6a29997a37897;
        self.var_1a0d19442eb7c4c1 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_9f9ec768a850f92;
        self.var_f51597b9c53acf08 = self function_db3c4e3f2727b55b();
        return;
    }
    
    self.var_56f4e62552a79fe7 = 0;
}

// Namespace interaction_common
// Params 0, eflags: 0x4
// Checksum 0x86e8f4cb, Offset: 0x2665
// Size: 0x1c
function private function_91053ba261a3aefc()
{
    if ( self.var_fda053823240135f )
    {
        thread function_1f94d499721f7add();
        thread function_4fe3adfc69187fba();
    }
}

// Namespace interaction_common
// Params 1, eflags: 0x4
// Checksum 0xb3b33a1b, Offset: 0x2689
// Size: 0x6f
function private function_fd3432db2be7becf( var_6dcd087706b2fe81 )
{
    self.var_286d9284164cc9c5 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.canmove;
    self.var_74e6943ef6ad6db1 = var_6dcd087706b2fe81.designdata.var_9a403a747fd9d5dd.var_cfa2baf6dddc28ed;
    
    if ( self.var_74e6943ef6ad6db1 )
    {
        self enabletraversals( 0 );
    }
}

// Namespace interaction_common
// Params 0, eflags: 0xc
// Checksum 0x82e793e6, Offset: 0x2700
// Size: 0x7e
function private function_744cbf36477daa5b()
{
    self notify( "687c2ad427c06086" );
    self endon( "687c2ad427c06086" );
    self endon( "death" );
    var_1ba470c32d60835f = [ "game_ended", "clear_skit_designdata", "cap_exit_completed", "cleared_sight_config" ];
    
    for ( i = 0; i < var_1ba470c32d60835f.size ; i++ )
    {
        thread waittill_string( var_1ba470c32d60835f[ i ] );
    }
    
    self waittill( "remove_sight_config_string" );
    function_88c7216b32d58113();
}

// Namespace interaction_common
// Params 1
// Checksum 0x682b0585, Offset: 0x2786
// Size: 0x29
function waittill_string( string )
{
    self endon( "remove_sight_config_string" );
    self endon( "death" );
    self waittill( string );
    self notify( "remove_sight_config_string" );
}

// Namespace interaction_common
// Params 0, eflags: 0xc
// Checksum 0xb0a6b28a, Offset: 0x27b7
// Size: 0x8e
function private function_1f94d499721f7add()
{
    self notify( "b4a0a3cdcbabdd07" );
    self endon( "b4a0a3cdcbabdd07" );
    self endon( "death" );
    self endon( "death_or_disconnect" );
    self endon( "game_ended" );
    self endon( "clear_skit_designdata" );
    self endon( "cap_exit_completed" );
    
    while ( true )
    {
        if ( isdefined( self.var_14c834e9d5890f26 ) && self.var_14c834e9d5890f26 != "" )
        {
            self waittill( self.var_14c834e9d5890f26 );
        }
        else
        {
            self waittill( "skitEnableCollision" );
        }
        
        function_f7e7d22da22dc26d( undefined, "enable" );
        self notify( "SkitEnabledCollision" );
    }
}

// Namespace interaction_common
// Params 0, eflags: 0xc
// Checksum 0x9f6323f1, Offset: 0x284d
// Size: 0x8e
function private function_4fe3adfc69187fba()
{
    self notify( "9ae611116e9635f3" );
    self endon( "9ae611116e9635f3" );
    self endon( "death" );
    self endon( "death_or_disconnect" );
    self endon( "game_ended" );
    self endon( "clear_skit_designdata" );
    self endon( "cap_exit_completed" );
    
    while ( true )
    {
        if ( isdefined( self.var_ca126cc79643ebe7 ) && self.var_ca126cc79643ebe7 != "" )
        {
            self waittill( self.var_ca126cc79643ebe7 );
        }
        else
        {
            self waittill( "skitDisableCollision" );
        }
        
        function_f7e7d22da22dc26d( undefined, "disable" );
        self notify( "SkitDisabledCollision" );
    }
}

// Namespace interaction_common
// Params 0, eflags: 0xc
// Checksum 0x2c134cf4, Offset: 0x28e3
// Size: 0x6a
function private function_61857cad428ddd0f()
{
    self notify( "82c0468ae658929c" );
    self endon( "82c0468ae658929c" );
    self endon( "cleared_sight_config" );
    self endon( "death" );
    
    if ( !self.var_3e167603fbee66b4 )
    {
        thread function_38f8b447cf8ea7cc();
        return;
    }
    
    if ( isdefined( self.var_cc855622aeaa2420 ) )
    {
        self waittill( self.var_cc855622aeaa2420 );
        thread function_38f8b447cf8ea7cc();
        return;
    }
    else
    {
        self waittill( "applySight" );
    }
    
    thread function_38f8b447cf8ea7cc();
}

// Namespace interaction_common
// Params 0
// Checksum 0x77a09e8e, Offset: 0x2955
// Size: 0xe1
function function_38f8b447cf8ea7cc()
{
    self notify( "apply_sight_config" );
    self endon( "cleared_sight_config" );
    self endon( "apply_sight_config" );
    self endon( "death" );
    thread function_744cbf36477daa5b();
    var_17f4877ddc6f0be8 = 0;
    
    if ( self.var_c92a7956029e02a5 && self.var_c92a7956029e02a5 != self function_db3c4e3f2727b55b() )
    {
        var_17f4877ddc6f0be8 = 1;
    }
    
    if ( isdefined( self.var_2e193c17d5de0ad5 ) && ( !var_17f4877ddc6f0be8 || self.var_2e193c17d5de0ad5 == "sightless" ) )
    {
        self function_361dbeb559975407( self.var_2e193c17d5de0ad5 );
        self.var_56f4e62552a79fe7 = 1;
    }
    else
    {
        self.var_56f4e62552a79fe7 = 0;
        return;
    }
    
    if ( !self.var_3e167603fbee66b4 )
    {
        return;
    }
    
    if ( isdefined( self.var_1a0d19442eb7c4c1 ) )
    {
        self waittill( self.var_1a0d19442eb7c4c1 );
    }
    else
    {
        self waittill( "clearSight" );
    }
    
    function_88c7216b32d58113();
}

// Namespace interaction_common
// Params 0
// Checksum 0xc76389b3, Offset: 0x2a3e
// Size: 0x39
function function_88c7216b32d58113()
{
    if ( self.var_56f4e62552a79fe7 )
    {
        self function_361dbeb559975407( self.var_f51597b9c53acf08 );
    }
    
    self.var_2e193c17d5de0ad5 = undefined;
    self.var_56f4e62552a79fe7 = 0;
    self notify( "cleared_sight_config" );
}

// Namespace interaction_common
// Params 2
// Checksum 0x27433c32, Offset: 0x2a7f
// Size: 0x17, Type: bool
function function_3d3f02fd7a5fbeab( statename, params )
{
    return true;
}

// Namespace interaction_common
// Params 1
// Checksum 0xc3380c0b, Offset: 0x2a9f
// Size: 0x35, Type: bool
function function_9eb2dc936807b17a( ent )
{
    assert( isai( self ) );
    var_3e9bc4d4a5b80dfc = ent getinteractionid();
    
    if ( isdefined( var_3e9bc4d4a5b80dfc ) )
    {
        return true;
    }
    
    return false;
}

// Namespace interaction_common
// Params 1
// Checksum 0x1f7b55ce, Offset: 0x2add
// Size: 0x47
function function_60f1e301b0c68bed( skit )
{
    id = skit;
    
    if ( isstring( skit ) )
    {
        id = getinteractionidfortargetname( skit );
    }
    
    user = getbsequsers( id );
    
    if ( user.size == 0 )
    {
        return 0;
    }
    
    return user;
}

// Namespace interaction_common
// Params 2
// Checksum 0x30747b4e, Offset: 0x2b2d
// Size: 0x20
function function_6c11755fd3d9f83d( skit, function )
{
    level thread function_e6f138d784c2d32a( skit, function );
}

// Namespace interaction_common
// Params 2, eflags: 0x4
// Checksum 0x2bbb6079, Offset: 0x2b55
// Size: 0x7b
function private function_e6f138d784c2d32a( skit, function )
{
    level endon( "game_ended" );
    var_3e9bc4d4a5b80dfc = skit;
    
    if ( isstring( skit ) )
    {
        var_3e9bc4d4a5b80dfc = getinteractionidfortargetname( skit );
    }
    
    var_a932a3a07eb8baab = -1;
    
    while ( true )
    {
        level waittill( "skit_new_user_joined", id, user );
        
        if ( id == var_3e9bc4d4a5b80dfc )
        {
            [[ function ]]( user );
            return;
        }
        
        waitframe();
    }
}

// Namespace interaction_common
// Params 1
// Checksum 0xb32f32e0, Offset: 0x2bd8
// Size: 0x61
function function_a016ba80347cc7ce( var_ef89f9968497f2ba )
{
    assert( isai( self ) );
    self leaveinteraction();
    
    if ( var_ef89f9968497f2ba )
    {
        self._blackboard.bseqphase = "end";
    }
    else
    {
        self._blackboard.bseqphase = "react";
    }
    
    self notify( "clear_skit_designdata" );
}

// Namespace interaction_common
// Params 2
// Checksum 0xb6e8f4af, Offset: 0x2c41
// Size: 0x1f
function function_509792c4021ac833( startfunction, skit )
{
    thread function_3b17088f679311c8( startfunction, skit );
}

// Namespace interaction_common
// Params 2, eflags: 0x4
// Checksum 0xe06b6596, Offset: 0x2c68
// Size: 0x7c
function private function_3b17088f679311c8( startfunction, skit )
{
    self endon( "death" );
    
    if ( isdefined( skit ) )
    {
        var_3e9bc4d4a5b80dfc = skit;
        
        if ( isstring( skit ) )
        {
            var_3e9bc4d4a5b80dfc = getinteractionidfortargetname( skit );
        }
        
        while ( true )
        {
            self waittill( "interaction_started", id );
            
            if ( id == var_3e9bc4d4a5b80dfc )
            {
                [[ startfunction ]]();
                break;
            }
            
            waitframe();
        }
        
        return;
    }
    
    self waittill( "interaction_started" );
    [[ startfunction ]]();
}

// Namespace interaction_common
// Params 2
// Checksum 0xd13b0837, Offset: 0x2cec
// Size: 0x1f
function function_f305b6c589bc702a( var_637bf6a373ab35bf, skit )
{
    thread function_424dcfcc5c62676d( var_637bf6a373ab35bf, skit );
}

// Namespace interaction_common
// Params 2, eflags: 0x4
// Checksum 0x4e772f71, Offset: 0x2d13
// Size: 0x7a
function private function_424dcfcc5c62676d( var_637bf6a373ab35bf, skit )
{
    self endon( "death" );
    
    if ( isdefined( skit ) )
    {
        var_3e9bc4d4a5b80dfc = skit;
        
        if ( isstring( skit ) )
        {
            var_3e9bc4d4a5b80dfc = getinteractionidfortargetname( skit );
        }
        
        while ( true )
        {
            self waittill( "interaction_ended", id );
            
            if ( id == var_3e9bc4d4a5b80dfc )
            {
                [[ var_637bf6a373ab35bf ]]();
                return;
            }
            
            waitframe();
        }
        
        return;
    }
    
    self waittill( "interaction_ended" );
    [[ var_637bf6a373ab35bf ]]();
}

// Namespace interaction_common
// Params 3
// Checksum 0x344dac4a, Offset: 0x2d95
// Size: 0x4b
function function_c75f85a96a10a251( skit, function, userdata )
{
    var_3e9bc4d4a5b80dfc = skit;
    
    if ( isstring( skit ) )
    {
        var_3e9bc4d4a5b80dfc = getinteractionidfortargetname( skit );
    }
    
    level.var_ea329ecfbda528dc[ var_3e9bc4d4a5b80dfc ] = function;
}

