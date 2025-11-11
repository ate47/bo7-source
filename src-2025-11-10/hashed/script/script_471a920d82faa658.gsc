#using script_53651341190c5aab;
#using scripts\asm\asm;
#using scripts\common\cap;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;

#namespace door_check;

// Namespace door_check
// Params 1
// Checksum 0xbad79458, Offset: 0x348
// Size: 0x13e
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_9f9e07224ff2a95a":
            return &calcstartorigin;
        case #"hash_88347dbc54e3c555":
            return &function_d393bc9d5d3cd17d;
        case #"hash_55e74e391a612ea8":
            return &function_c15c3b5c7d9a70bd;
        case #"hash_d8934b522ed927fa":
            return &function_3920913d01f45199;
        case #"hash_818982b14b2af1f":
            return &arrivalsetup;
        case #"hash_3454d29ae45c6cdb":
            return &function_259b37243d1c2960;
        case #"hash_c5687eec52003555":
            return &onarrival;
        case #"hash_e016759d0510a58c":
            return &onbailout;
        case #"hash_d50b41c248a37316":
            return &onenter;
        case #"hash_214ba25246813d79":
            return &function_e111218404c76afa;
        case #"hash_1ac92cc267a9ec26":
            return &GoalCheckCleanup;
        case #"hash_f81d03def0fb7e01":
            return &function_a7469b67274c2f36;
        case #"hash_94e93145a62541a4":
            return &function_64f894e6c635e435;
        case #"hash_987435cc91e79a2f":
            return &function_c62577c2f2213500;
    }
    
    return interaction_common::function_d4be89b1cf3d4993( funcid );
}

// Namespace door_check
// Params 1, eflags: 0x4
// Checksum 0xad974851, Offset: 0x48f
// Size: 0x148
function private onuserinit( interactionid )
{
    setdvarifuninitialized( @"hash_6bff7f7a44419fce", 0 );
    
    if ( !isdefined( function_521b5a0a07a246a8( interactionid, "breachtype" ) ) )
    {
        types = [ "breach", "kick", "flashbang" ];
        type = utility::random( types );
        function_dd518df9ee8d217c( interactionid, "breachtype", type );
    }
    
    self.doorcheck = spawnstruct();
    
    if ( isdefined( self.node ) )
    {
        self.doorcheck.priornode = self.node;
    }
    else
    {
        self.doorcheck.priorgoalpos = self.pathgoalpos;
    }
    
    if ( !isdefined( level.bseq ) )
    {
        level.bseq = spawnstruct();
    }
    
    if ( !isdefined( level.bseq.instancedata ) )
    {
        level.bseq.instancedata = [];
    }
    
    if ( !isdefined( level.bseq.instancedata[ interactionid ] ) )
    {
        level.bseq.instancedata[ interactionid ] = spawnstruct();
    }
}

// Namespace door_check
// Params 1, eflags: 0x4
// Checksum 0x191c3432, Offset: 0x5df
// Size: 0xfb
function private onuserterminate( interactionid )
{
    val::reset( "door_check", "script_pushable" );
    val::reset( "door_check", "script_pushable_by_ai" );
    self.doorcheck = undefined;
    self clearbtgoal( 3 );
    self.capdata = undefined;
    self.customarrivalhandler = undefined;
    
    if ( self.defaultasm != self.asmname )
    {
        cap::cap_exit();
    }
    
    users = getbsequsers( interactionid );
    
    if ( users.size == 1 )
    {
        doorid = function_521b5a0a07a246a8( interactionid, "doorindex" );
        
        if ( isdefined( doorid ) )
        {
            if ( !level.bseq.instancedata[ interactionid ].bstarted )
            {
                updateroomdoorclaim( doorid, 0 );
            }
            else
            {
                updateroomdoorclaim( doorid, gettime() + 10000 );
            }
        }
        
        level.bseq.instancedata[ interactionid ] = undefined;
    }
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0x20031cc7, Offset: 0x6e2
// Size: 0x3ed
function private calcstartorigin( statename, role )
{
    id = self getinteractionid();
    assert( isdefined( id ) );
    origin = getinteractionorigin( id );
    angles = getinteractionangles( id );
    doordir = anglestoforward( angles );
    var_430a123ddfc8269d = origin - self.origin;
    cross = vectorcross( var_430a123ddfc8269d, doordir );
    bleft = 1;
    
    if ( cross[ 2 ] < 0 )
    {
        bleft = 0;
    }
    
    idlestate = "door_idle";
    
    if ( bleft )
    {
        idlealias = "left";
    }
    else
    {
        idlealias = "right";
    }
    
    door_knob = function_521b5a0a07a246a8( id, "door_knob" );
    
    if ( isdefined( door_knob ) )
    {
        idlealias = door_knob;
    }
    
    if ( role == "active" )
    {
        function_dd518df9ee8d217c( id, "activeside", idlealias );
    }
    else
    {
        occupiedside = function_521b5a0a07a246a8( id, "activeside" );
        
        if ( occupiedside == "left" )
        {
            idlealias = "right";
        }
        else
        {
            idlealias = "left";
        }
    }
    
    var_b0bd2129b55c6a9f = idlealias;
    openness = function_521b5a0a07a246a8( id, "openness" );
    
    if ( isdefined( openness ) )
    {
        openness = abs( openness );
    }
    
    var_336ae67a2f745bb0 = istrue( function_521b5a0a07a246a8( id, "path_has_door" ) );
    
    if ( !var_336ae67a2f745bb0 )
    {
        if ( utility::issp() )
        {
            var_28f78ee1a656b2ac = function_e9af04669d362eea( origin );
            
            if ( isdefined( var_28f78ee1a656b2ac ) )
            {
                if ( !self [[ self.fndooralreadyopen ]]( var_28f78ee1a656b2ac ) )
                {
                    function_dd518df9ee8d217c( id, "path_has_door", 1 );
                    var_336ae67a2f745bb0 = 1;
                }
            }
        }
    }
    
    if ( !var_336ae67a2f745bb0 || openness > 45 )
    {
        idlealias += "_doorless";
    }
    
    type = function_521b5a0a07a246a8( id, "breachtype" );
    rolestring = type;
    capinfo = getcapinfoforrole( self, rolestring );
    animset = capinfo.animation;
    animid = archetypegetrandomalias( animset, idlestate, idlealias, 0 );
    assert( animid >= 0 );
    xanim = animsetgetanimfromindex( animset, idlestate, animid );
    idleorigin = getstartorigin( origin, angles, xanim );
    idleangles = getstartangles( origin, angles, xanim );
    snappedidleorigin = getclosestpointonnavmesh( idleorigin, self, 0, 1, 0 );
    
    if ( isdefined( snappedidleorigin ) )
    {
        idleorigin = snappedidleorigin;
    }
    
    self.customarrivalstate = var_b0bd2129b55c6a9f + "_door_arrival";
    self.customarrivalanimset = animset;
    self.customarrivalangles = angles;
    self.customarrivalanimangles = idleangles;
    self.var_4568897d5b592329 = 1;
    self.var_e8bd8a7b2a998725 = 1;
    self.capdata = spawnstruct();
    self.capdata.asmname = capinfo.capname;
    self.capdata.animsetname = animset;
    self.capdata.dooralias = idlealias;
    self.capdata.angles = idleangles;
    self.capdata.var_9ca68a003e7b10c6 = "solo";
    self.capdata.role = role;
    self.capdata.idleorigin = idleorigin;
    
    if ( role == "support" )
    {
        self.capdata.var_9ca68a003e7b10c6 = "dual";
    }
    
    self.customarrivalhandler = &customarrivalhandler;
    
    /#
        if ( getdvarint( @"hash_6bff7f7a44419fce", 0 ) == 1 )
        {
            thread function_cf0f2bc1c543f66e( idleorigin, idleangles );
        }
    #/
    
    return idleorigin;
}

// Namespace door_check
// Params 3, eflags: 0x4
// Checksum 0x9ff0ccbb, Offset: 0xad8
// Size: 0x1c8
function private function_d393bc9d5d3cd17d( statename, mindist, maxdist )
{
    id = self getinteractionid();
    origin = getinteractionorigin( id );
    doortome = vectornormalize( self.origin - origin );
    dist = randomintrange( mindist, maxdist );
    endpoint = origin + doortome * dist;
    
    /#
        if ( getdvarint( @"hash_6bff7f7a44419fce", 0 ) == 1 )
        {
            line( origin, endpoint, ( 0, 0, 1 ), 1, 0, 200 );
        }
    #/
    
    point = findclosestlospointwithinradius( origin, maxdist, origin, endpoint );
    
    if ( !isdefined( point ) )
    {
        point = findclosesttacpoint( endpoint );
        
        if ( isdefined( point ) )
        {
            /#
                if ( getdvarint( @"hash_6bff7f7a44419fce", 0 ) == 1 )
                {
                    print3d( point.origin + ( 0, 0, 100 ), "<dev string:x24>", ( 255, 255, 255 ), 1, 0.6, 200 );
                    utility::draw_circle( point.origin, 16, ( 1, 1, 0 ), 1, 0, 200 );
                }
            #/
            
            return point.origin;
        }
        else
        {
            point = self getclosestreachablepointonnavmesh( endpoint );
        }
        
        /#
            if ( getdvarint( @"hash_6bff7f7a44419fce", 0 ) == 1 )
            {
                print3d( point + ( 0, 0, 100 ), "<dev string:x24>", ( 255, 255, 255 ), 1, 0.6, 200 );
                utility::draw_circle( point, 16, ( 1, 1, 0 ), 1, 0, 200 );
            }
        #/
    }
    
    return point;
}

// Namespace door_check
// Params 0, eflags: 0x4
// Checksum 0xd2435aa4, Offset: 0xca9
// Size: 0x57
function private customarrivalhandler()
{
    assert( isdefined( self.capdata ) );
    self.capdata.var_ec117174c7bbdce6 = 1;
    cap::cap_start( self.capdata.asmname, self.capdata.animsetname );
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0x6bbfd103, Offset: 0xd08
// Size: 0x15
function private arrivalsetup( statename, params )
{
    
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0x12e129d3, Offset: 0xd25
// Size: 0x51
function private arrivalcleanup( statename, params )
{
    self.customarrivalstate = undefined;
    self.customarrivalanimset = undefined;
    self.customarrivalangles = undefined;
    self.customarrivalanimangles = undefined;
    self.var_4568897d5b592329 = 0;
    self.var_e8bd8a7b2a998725 = 0;
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0xbdd5c0f4, Offset: 0xd7e
// Size: 0xa1
function private opendoor( interactionid, var_4e6c261e98adf1ea )
{
    doorobj = function_521b5a0a07a246a8( interactionid, "door" );
    
    if ( isdefined( doorobj ) )
    {
        if ( doorobj scriptabledoorisclosed() )
        {
            doorobj scriptabledooropen( "away", self.origin );
        }
        
        return;
    }
    
    if ( utility::issp() )
    {
        var_28f78ee1a656b2ac = function_e9af04669d362eea( self.origin );
        
        if ( isdefined( var_28f78ee1a656b2ac ) )
        {
            if ( !self [[ self.fndooralreadyopen ]]( var_28f78ee1a656b2ac ) )
            {
                self [[ self.fndooropen ]]( var_28f78ee1a656b2ac, 0.5 );
            }
        }
    }
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0xc6101d5b, Offset: 0xe27
// Size: 0x1a0
function private onarrival( statename, params )
{
    if ( !self.capdata.var_ec117174c7bbdce6 )
    {
        arrivalcleanup();
        cap::cap_start( self.capdata.asmname, self.capdata.animsetname );
    }
    
    self.doorcheck.arrived = 1;
    val::set( "door_check", "script_pushable", 0 );
    val::set( "door_check", "script_pushable_by_ai", 0 );
    sidetoken = self.capdata.dooralias;
    numbertoken = self.capdata.var_9ca68a003e7b10c6;
    roletoken = self.capdata.role;
    self.capdata.var_44b71e00f14cb477 = sidetoken + "_" + numbertoken + "_" + roletoken;
    self interactioncleargoalpos();
    id = self getinteractionid();
    breachtype = function_521b5a0a07a246a8( id, "breachtype" );
    var_dff150cdd3280db6 = breachtype == "flashbang";
    
    if ( var_dff150cdd3280db6 && function_521b5a0a07a246a8( id, "path_has_door" ) )
    {
        opendoor( id, self.origin );
    }
    
    level.bseq.instancedata[ id ].bstarted = 1;
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0xf6994b74, Offset: 0xfcf
// Size: 0x57
function private onbailout( statename, params )
{
    id = self getinteractionid();
    abortinteraction( id );
    doorid = function_521b5a0a07a246a8( id, "doorindex" );
    
    if ( isdefined( doorid ) )
    {
        updateroomdoorclaim( doorid, gettime() + 10000 );
    }
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0x29fbce07, Offset: 0x102e
// Size: 0xfc
function private onenter( statename, params )
{
    self endon( "death" );
    self.capdata.var_e35fd27cd8a38831 = 1;
    
    if ( isdefined( self.doorcheck.priornode ) )
    {
        self setbtgoalnode( 3, self.doorcheck.priornode );
        self.doorcheck.priornode = undefined;
    }
    else if ( isdefined( self.doorcheck.priorgoalpos ) )
    {
        self setbtgoalpos( 3, self.doorcheck.priorgoalpos );
        self.doorcheck.priorgoalpos = undefined;
    }
    
    endtime = gettime() + 5000;
    waitframe();
    
    while ( gettime() < endtime )
    {
        if ( self asmeventfired( self.asmname, "end" ) )
        {
            break;
        }
        
        waitframe();
    }
}

// Namespace door_check
// Params 4
// Checksum 0xcda98155, Offset: 0x1132
// Size: 0x3b, Type: bool
function doorcheck_shoulddoarrival( asmname, statename, tostatename, params )
{
    return istrue( self.capdata.var_ec117174c7bbdce6 );
}

// Namespace door_check
// Params 4
// Checksum 0x1b6e0e1b, Offset: 0x1176
// Size: 0x3b, Type: bool
function function_d823e1cd8e76b902( asmname, statename, tostatename, params )
{
    return istrue( self.capdata.var_e35fd27cd8a38831 );
}

// Namespace door_check
// Params 3
// Checksum 0x1fa34e94, Offset: 0x11ba
// Size: 0x46
function function_3b119c0789991605( asmname, statename, params )
{
    alias = self.capdata.dooralias;
    return asm::asm_lookupanimfromalias( statename, alias );
}

// Namespace door_check
// Params 3
// Checksum 0xe5294944, Offset: 0x1209
// Size: 0x7a
function function_83589e3def0e1f7b( asmname, statename, params )
{
    alias = self.capdata.dooralias + "_" + self.capdata.var_9ca68a003e7b10c6 + "_" + self.capdata.role;
    return asm::asm_lookupanimfromalias( statename, alias );
}

// Namespace door_check
// Params 1
// Checksum 0x850813fd, Offset: 0x128c
// Size: 0xe9
function function_e9af04669d362eea( var_a7d26a9a653b0203 )
{
    if ( !isdefined( level.interactive_doors ) || !isdefined( level.interactive_doors.ents ) )
    {
        return;
    }
    
    var_860971e903ef4d76 = 1296;
    
    foreach ( var_a2f7492330f7f79f in level.interactive_doors.ents )
    {
        assert( isdefined( var_a2f7492330f7f79f.origin ) );
        
        if ( distance2dsquared( var_a2f7492330f7f79f.origin, var_a7d26a9a653b0203 ) < var_860971e903ef4d76 )
        {
            return var_a2f7492330f7f79f;
        }
    }
}

// Namespace door_check
// Params 0
// Checksum 0x8389e704, Offset: 0x137d
// Size: 0x2d, Type: bool
function function_e11fec9097aedb73()
{
    return level.equipment.table[ "equip_flash" ].objweapon ?? "flash";
}

// Namespace door_check
// Params 1
// Checksum 0x32b94586, Offset: 0x13b3
// Size: 0x155
function function_55477afb735e892c( note )
{
    if ( note == "door_open" )
    {
        opendoor( self getinteractionid(), self.origin );
        return;
    }
    
    if ( note == "grenade_left" || note == "grenade_right" )
    {
        grenadeweapon = function_e11fec9097aedb73();
        grenademodel = getweaponmodel( grenadeweapon );
        assert( isdefined( grenademodel ) );
        
        if ( note == "grenade_left" )
        {
            self.grenadeattachtag = #"tag_accessory_left";
        }
        else
        {
            self.grenadeattachtag = #"tag_accessory_right";
        }
        
        self attach( grenademodel, self.grenadeattachtag );
        self.grenademodel = grenademodel;
        thread function_c021ab152a7a0ec1();
        return;
    }
    
    if ( note == "grenade_throw" )
    {
        assert( isdefined( self.grenadeattachtag ) );
        grenadeweapon = function_e11fec9097aedb73();
        grenadepos = self gettagorigin( self.grenadeattachtag );
        magicgrenademanual( grenadeweapon, grenadepos, self.doorcheck.grenadedir * 20, 1, self );
        self detach( self.grenademodel, self.grenadeattachtag );
        self.grenademodel = undefined;
        self.grenadeattachtag = undefined;
    }
}

// Namespace door_check
// Params 0
// Checksum 0x7f02959f, Offset: 0x1510
// Size: 0x93
function function_c021ab152a7a0ec1()
{
    self endon( "death" );
    self endon( "bseq_user_deleted" );
    prevhandpos = self gettagorigin( self.grenadeattachtag );
    self.doorcheck.grenadedir = anglestoforward( self.angles );
    waitframe();
    
    while ( isdefined( self.grenadeattachtag ) )
    {
        handpos = self gettagorigin( self.grenadeattachtag );
        self.doorcheck.grenadedir = handpos - prevhandpos;
        prevhandpos = handpos;
        waitframe();
    }
}

// Namespace door_check
// Params 3
// Checksum 0xa5b9045c, Offset: 0x15ab
// Size: 0x71
function function_fe01d3e90c41ae7b( asmname, statename, params )
{
    thread asm::function_b7619cbe4e9abaf4( asmname, statename, 1 );
    self orientmode( "face angle", self.capdata.angles[ 1 ] );
    self asmfireephemeralevent( "arrived", "end" );
    self.doorcheck.arrived = 1;
}

// Namespace door_check
// Params 3
// Checksum 0xbe0b4dc1, Offset: 0x1624
// Size: 0x5a
function function_35c09cfbc9b57021( asmname, statename, params )
{
    thread asm::asm_playanimstate( asmname, statename, params );
    self function_1899aad6a5246b8( self.capdata.idleorigin, self.capdata.angles, 0.3 );
}

// Namespace door_check
// Params 4
// Checksum 0xdc8fd329, Offset: 0x1686
// Size: 0xf9, Type: bool
function function_7ae07f1c63c7540( asmname, statename, tostatename, params )
{
    if ( !isdefined( params ) || isarray( params ) )
    {
        assertmsg( "<dev string:x3b>" );
        return false;
    }
    
    if ( !isdefined( self.capdata.dooralias ) )
    {
        return false;
    }
    
    side = self.capdata.dooralias;
    
    if ( self.capdata.role == "support" )
    {
        if ( side == "left" )
        {
            side = "right";
        }
        else if ( side == "right" )
        {
            side = "left";
        }
    }
    
    return self.capdata.dooralias == params || self.capdata.dooralias == params + "_doorless";
}

// Namespace door_check
// Params 1, eflags: 0x4
// Checksum 0x3a2c72c2, Offset: 0x1788
// Size: 0x4d, Type: bool
function private function_64f894e6c635e435( params )
{
    barriving = self.arriving;
    
    if ( barriving )
    {
        return false;
    }
    
    return self.doorcheck.arrived || self isingoal( self.origin );
}

// Namespace door_check
// Params 1, eflags: 0x4
// Checksum 0x409dc3f0, Offset: 0x17de
// Size: 0x20, Type: bool
function private function_c62577c2f2213500( params )
{
    return istrue( self.doorcheck.arrived );
}

// Namespace door_check
// Params 4, eflags: 0x4
// Checksum 0x89ab602c, Offset: 0x1807
// Size: 0x138, Type: bool
function private function_c15c3b5c7d9a70bd( asmname, statename, tostatename, params )
{
    id = self getinteractionid();
    assert( isdefined( id ) );
    origin = getinteractionorigin( id );
    angles = getinteractionangles( id );
    doordir = anglestoforward( angles );
    var_430a123ddfc8269d = origin - self.origin;
    cross = vectorcross( var_430a123ddfc8269d, doordir );
    bleft = 1;
    
    if ( cross[ 2 ] < 0 )
    {
        bleft = 0;
    }
    
    if ( bleft )
    {
        desiredside = "left";
    }
    else
    {
        desiredside = "right";
    }
    
    var_e419af8468929333 = function_521b5a0a07a246a8( id, "door_knob" );
    mustcross = desiredside == var_e419af8468929333;
    openness = function_521b5a0a07a246a8( id, "openness" );
    dooropen = 1;
    
    if ( isdefined( openness ) )
    {
        openness = abs( openness );
        dooropen = openness >= 45;
    }
    
    if ( mustcross && dooropen )
    {
        return false;
    }
    
    return true;
}

// Namespace door_check
// Params 4, eflags: 0x4
// Checksum 0xb854c5c0, Offset: 0x1948
// Size: 0x50, Type: bool
function private function_3920913d01f45199( asmname, statename, tostatename, params )
{
    id = self getinteractionid();
    hasdoor = function_521b5a0a07a246a8( id, "path_has_door" );
    return !hasdoor;
}

// Namespace door_check
// Params 4, eflags: 0x4
// Checksum 0xb2d1c109, Offset: 0x19a1
// Size: 0xd0, Type: bool
function private function_a7469b67274c2f36( asmname, statename, tostatename, params )
{
    if ( !isdefined( self.enemy ) )
    {
        return false;
    }
    
    if ( self cansee( self.enemy ) )
    {
        return true;
    }
    
    id = self getinteractionid();
    origin = getinteractionorigin( id );
    angles = getinteractionangles( id );
    doordir = anglestoforward( angles );
    enemypos = self.enemy.origin;
    toenemy = vectornormalize2( enemypos - origin );
    delta = vectordot( doordir, toenemy );
    return delta <= 0;
}

// Namespace door_check
// Params 1, eflags: 0x4
// Checksum 0x7eda40f5, Offset: 0x1a7a
// Size: 0x25
function private function_259b37243d1c2960( interactionid )
{
    self.capdata.var_9ca68a003e7b10c6 = "dual";
}

// Namespace door_check
// Params 1
// Checksum 0x3f29b25d, Offset: 0x1aa7
// Size: 0xc
function function_e111218404c76afa( interactionid )
{
    
}

// Namespace door_check
// Params 1
// Checksum 0xdccb34f5, Offset: 0x1abb
// Size: 0xc
function GoalCheckCleanup( interactionid )
{
    
}

// Namespace door_check
// Params 2, eflags: 0x4
// Checksum 0x154d1e6a, Offset: 0x1acf
// Size: 0x1a6
function private function_cf0f2bc1c543f66e( idleorigin, idleangles )
{
    self endon( "death" );
    forward = anglestoforward( idleangles );
    end = idleorigin + forward * 32;
    id = self getinteractionid();
    breachtype = function_521b5a0a07a246a8( id, "breachtype" );
    intorg = getinteractionorigin( id );
    intfwd = anglestoforward( getinteractionangles( id ) );
    intend = intorg + intfwd * 32;
    utility::draw_arrow_time( intorg, intend, ( 150, 50, 150 ), 5 );
    utility::draw_arrow_time( idleorigin, end, ( 150, 50, 150 ), 5 );
    
    /#
        print3d( idleorigin + ( 0, 0, 100 ), breachtype, ( 255, 255, 255 ), 1, 0.6, 200 );
    #/
    
    /#
        print3d( idleorigin + ( 0, 0, 80 ), self.capdata.dooralias + "<dev string:x76>" + self.capdata.var_9ca68a003e7b10c6 + "<dev string:x76>" + self.capdata.role, ( 255, 255, 255 ), 1, 0.6, 150 );
    #/
    
    /#
        print3d( idleorigin + ( 0, 0, 60 ), self.customarrivalstate, ( 255, 255, 255 ), 1, 0.4, 150 );
    #/
}

