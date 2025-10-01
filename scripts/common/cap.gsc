#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace cap;

// Namespace cap
// Params 0
// Checksum 0xf21c833, Offset: 0x33d
// Size: 0x4f
function init_cap()
{
    if ( isdefined( level.cap ) )
    {
        return;
    }
    
    level.cap = spawnstruct();
    level.cap.fnstart = &cap_start;
    level.cap.fnexit = &cap_exit;
}

// Namespace cap
// Params 3
// Checksum 0x2b6cf9d5, Offset: 0x394
// Size: 0x177, Type: bool
function cap_start( capname, animset, animscripted )
{
    if ( isai( self ) && self isinscriptedstate() )
    {
        msg1 = "AI $e" + self getentitynumber() + " attempting to start CAP '" + capname + "' with Arc '" + animset + "' ";
        msg2 = "but is currently playing a scripted anim (ASM state: '" + asm::asm_getcurrentstate( self.asmname ) + "') ";
        msg3 = "This is not supported - you either need to avoid starting";
        msg4 = " a CAP when the AI is scripted, or first clear the scripted state using the normal method.";
        assertmsg( msg1 + msg2 + msg3 + msg4 );
        return false;
    }
    
    self.caporigin = self.origin;
    self.capangles = self.angles;
    self notify( "cap_start" );
    
    if ( !isai( self ) )
    {
        self._blackboard = spawnstruct();
        self._blackboard.bfire = 0;
        function_64df1eb8fc59357a( capname, animset );
        return true;
    }
    else
    {
        self._blackboard.bseqphase = undefined;
    }
    
    assert( isalive( self ) && isdefined( self.asm ) );
    self setoverridearchetype( "animscript", animset, 0 );
    self function_d505f743c28f3545( capname );
    cap_terminateandreplace( capname );
    
    if ( animscripted )
    {
        asm_bb::bb_setanimscripted();
    }
    
    return true;
}

// Namespace cap
// Params 2
// Checksum 0xa9714954, Offset: 0x514
// Size: 0x11d
function function_64df1eb8fc59357a( baseasmname, archetypename )
{
    if ( archetypename == "hero_salter" || archetypename == "farah" || archetypename == "soldier_female" )
    {
        asm_bb::bb_setshort( 1 );
    }
    
    self.asmname = baseasmname;
    
    if ( !isdefined( self.asm ) )
    {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    
    assert( isdefined( archetypename ) || isdefined( self.animsetname ) );
    
    if ( isdefined( archetypename ) )
    {
        self.animsetname = archetypename;
        self.originalanimationarchetype = self.animationarchetype;
        self.animationarchetype = undefined;
    }
    
    self.scriptmodelcap = 1;
    self asminstantiate( baseasmname );
    
    if ( !isdefined( level.capscriptmodels ) )
    {
        level.capscriptmodels = [];
        level thread function_804046ad9cf64f5b();
    }
    
    if ( !arraycontains( level.capscriptmodels, self ) )
    {
        level.capscriptmodels[ level.capscriptmodels.size ] = self;
    }
}

// Namespace cap
// Params 0
// Checksum 0xebb27bc9, Offset: 0x639
// Size: 0x59
function function_804046ad9cf64f5b()
{
    while ( true )
    {
        for ( capindex = 0; capindex < level.capscriptmodels.size ; capindex++ )
        {
            capent = level.capscriptmodels[ capindex ];
            
            if ( isalive( capent ) )
            {
                capent asmtick();
            }
        }
        
        wait 0.05;
    }
}

// Namespace cap
// Params 2
// Checksum 0x897554d5, Offset: 0x69a
// Size: 0x54
function cap_terminateandreplace( newasmname, newarchetype )
{
    self asmterminate();
    self notify( "asm_terminated" );
    self.asmtrackasm = undefined;
    
    if ( !isdefined( newarchetype ) )
    {
        newarchetype = self.animsetname;
    }
    
    self [[ self.fnasm_init ]]( tolower( newasmname ), newarchetype );
}

// Namespace cap
// Params 0
// Checksum 0x2c97bf3e, Offset: 0x6f6
// Size: 0xd7
function cap_exit()
{
    if ( !isai( self ) )
    {
        self.asmname = undefined;
        self.animationarchetype = self.originalanimationarchetype;
        self.originalanimationarchetype = undefined;
        self.scriptmodelcap = undefined;
        
        if ( arraycontains( level.capscriptmodels, self ) )
        {
            level.capscriptmodels = arrayremove( level.capscriptmodels, self );
        }
        
        return;
    }
    
    assert( self function_51631ea7d587647d(), "<dev string:x24>" + self.asmname );
    
    if ( !self function_51631ea7d587647d() )
    {
        return;
    }
    
    if ( asm_bb::bb_isanimscripted() )
    {
        asm_bb::bb_clearanimscripted();
    }
    
    self.asmtrackasm = undefined;
    self clearcap();
    self.var_f6cf297cd6c37337 = undefined;
    
    if ( isdefined( self.capgroup ) )
    {
        function_1dc69bd8c64496fc();
    }
    
    function_82acad1b355efb61();
    self notify( "cap_exit_completed" );
}

// Namespace cap
// Params 0
// Checksum 0xadd79fc4, Offset: 0x7d5
// Size: 0x9c
function function_4fe8a1b9dc2d0bbc()
{
    self endon( "entitydeleted" );
    self endon( "cap_exit_completed" );
    
    if ( self.team == "axis" )
    {
        utility::waittill_any( "death", utility::function_215bebaff8aa653c() );
    }
    else
    {
        self waittill( "death" );
    }
    
    if ( asm_bb::bb_isanimscripted() )
    {
        asm_bb::bb_clearanimscripted();
    }
    
    self stopanimscripted();
    self clearoverridearchetype( "animscript" );
    self function_d505f743c28f3545( undefined );
    cap_terminateandreplace( self.defaultasm );
    
    if ( isdefined( self.capgroup ) )
    {
        function_1dc69bd8c64496fc();
    }
    
    function_82acad1b355efb61();
    self notify( "cap_exit_completed" );
}

// Namespace cap
// Params 4
// Checksum 0xe94d78e0, Offset: 0x879
// Size: 0xb5
function function_b26f782b6bed85d5( origin, capname, animset, var_b9018c9fc0176a5c )
{
    self endon( "death" );
    
    if ( var_b9018c9fc0176a5c )
    {
        self.oldscriptgoalpos = self.scriptgoalpos;
        self.oldgoalradius = self.goalradius;
    }
    
    self setgoalpos( origin, 1 );
    self waittill( "goal" );
    cap_start( capname, animset );
    self waittill( "cap_exit_completed" );
    
    if ( isdefined( self.oldscriptgoalpos ) )
    {
        self setgoalpos( self.oldscriptgoalpos, self.oldgoalradius );
        self.oldscriptgoalpos = undefined;
        self.oldgoalradius = undefined;
    }
}

// Namespace cap
// Params 0
// Checksum 0x438193de, Offset: 0x936
// Size: 0x91
function function_7362fbe78a0a00b6()
{
    msg = utility::waittill_any_return( "cap_reach_and_arrive", "bseq_user_deleted" );
    
    if ( isdefined( self.scriptedarrivalent ) )
    {
        self.scriptedarrivalent delete();
    }
    
    if ( isdefined( self.customarrivalhandler ) )
    {
        self.customarrivalhandler = undefined;
    }
    
    if ( isdefined( msg ) )
    {
        self finishcoverarrival( "Custom" );
        self clearbtgoal( 1 );
        
        if ( msg == "bseq_user_deleted" )
        {
            if ( self.defaultasm != self.asmname )
            {
                cap_exit();
            }
        }
    }
}

// Namespace cap
// Params 4
// Checksum 0xd9a6b12e, Offset: 0x9cf
// Size: 0x329
function cap_reach_and_arrive( scriptednode, capname, animset, var_42619fd983f8ba36 )
{
    assert( isdefined( scriptednode.origin ) );
    self notify( "cap_reach_and_arrive" );
    self endon( "cap_reach_and_arrive" );
    thread function_7362fbe78a0a00b6();
    self endon( "bseq_user_deleted" );
    self endon( "death" );
    
    if ( !isdefined( self.scriptedarrivalent ) )
    {
        self.scriptedarrivalent = spawn( "script_origin", scriptednode.origin );
        self.scriptedarrivalent.targetname = "cap_reach_and_arrive";
    }
    
    self.scriptedarrivalent.angles = scriptednode.angles;
    self.scriptedarrivalent.origin = scriptednode.origin;
    self.scriptedarrivalent.type = "Custom";
    arrival_state = "cap_arrival";
    
    if ( isdefined( var_42619fd983f8ba36 ) )
    {
        arrival_state = var_42619fd983f8ba36;
    }
    
    oldpushable = self.pushable;
    self.pushable = 0;
    
    if ( !self.var_e0bc276499c18875 )
    {
        approachpos = function_82491e1bc74dd239( capname, arrival_state, scriptednode.origin, animset );
        var_e3e28571d43b1f01 = 0;
        
        if ( isarray( approachpos ) )
        {
            var_e3e28571d43b1f01 = 1;
            approachpos = approachpos[ 1 ];
        }
        
        if ( isdefined( approachpos ) )
        {
            while ( distance2d( self.origin, approachpos ) > 40 )
            {
                waitframe();
            }
            
            if ( var_e3e28571d43b1f01 )
            {
                self clearbtgoal( 1 );
            }
        }
    }
    
    goalrad = 4;
    self setbtgoalradius( 1, goalrad );
    self setbtgoalpos( 1, scriptednode.origin );
    asm::asm_fireephemeralevent( "path_chosen", "end" );
    assert( archetypehasstate( animset, arrival_state ), "<dev string:x5e>" + animset + "<dev string:x6b>" + arrival_state + "<dev string:x87>" );
    self.customarrivalstate = arrival_state;
    self.customarrivalanimset = animset;
    self.customarrivalangles = scriptednode.angles;
    self.var_4568897d5b592329 = 1;
    self.customarrivalhandler = &function_299e3a2ee5531551;
    self.capdata = spawnstruct();
    self.capdata.arrivalangles = scriptednode.angles;
    self.capdata.asmname = capname;
    self.capdata.var_ec117174c7bbdce6 = 0;
    self waittill( "bt_goal" );
    waitforalignment( scriptednode.angles );
    
    if ( self.capdata.var_ec117174c7bbdce6 )
    {
        self waittill( "custom_arrival_handler_done" );
        self notify( "lerp_arrive_finished" );
    }
    else
    {
        self notify( "lerp_arrive_finished" );
        cap_start( capname, animset );
    }
    
    asm::asm_fireephemeralevent( "move", "end" );
    self.pushable = oldpushable;
    self.capdata = undefined;
    self notify( "cap_reach_and_arrive" );
}

// Namespace cap
// Params 1
// Checksum 0xe2dcbf0f, Offset: 0xd00
// Size: 0x58
function waitforalignment( var_a8147e6a98a38f54 )
{
    timeout = gettime() + 3000;
    
    while ( gettime() < timeout )
    {
        anglediff = var_a8147e6a98a38f54[ 1 ] - self.angles[ 1 ];
        
        if ( abs( anglediff ) < 2 )
        {
            break;
        }
        
        waitframe();
    }
}

// Namespace cap
// Params 0, eflags: 0x4
// Checksum 0xc583142a, Offset: 0xd60
// Size: 0x11a
function private function_299e3a2ee5531551()
{
    self endon( "death" );
    self endon( "cap_exit_completed" );
    assert( isdefined( self.capdata ) );
    self.capdata.var_ec117174c7bbdce6 = 1;
    cap_start( self.capdata.asmname, self.customarrivalanimset );
    initstate = self asmgetcurrentstate( self.asmname );
    self asmsetstate( self.asmname, self.customarrivalstate );
    timeouttime = gettime() + 10000;
    
    while ( !asm::asm_eventfired( self.asmname, "end" ) && gettime() < timeouttime )
    {
        waitframe();
    }
    
    if ( isdefined( self.capdata ) && isdefined( self.capdata.var_ec117174c7bbdce6 ) )
    {
        self.capdata.var_ec117174c7bbdce6 = 0;
    }
    
    self asmsetstate( self.asmname, initstate );
    self notify( "custom_arrival_handler_done" );
}

// Namespace cap
// Params 1
// Checksum 0x7dab1f55, Offset: 0xe82
// Size: 0xcb
function function_f97b52e357e14785( group )
{
    assert( isarray( group ) );
    
    if ( !isdefined( level.capgroups ) )
    {
        level.capgroups = [];
    }
    
    newcapgroup = level.capgroups.size;
    level.capgroups[ newcapgroup ] = group;
    
    foreach ( ent in group )
    {
        ent.capgroup = newcapgroup;
    }
}

// Namespace cap
// Params 0
// Checksum 0x5680d336, Offset: 0xf55
// Size: 0x51
function function_1dc69bd8c64496fc()
{
    assert( isdefined( level.capgroups ) && isdefined( self.capgroup ) && isdefined( level.capgroups[ self.capgroup ] ) );
    
    if ( level.capgroups[ self.capgroup ].size == 0 )
    {
    }
}

// Namespace cap
// Params 0
// Checksum 0x89e53d83, Offset: 0xfae
// Size: 0xda
function function_82acad1b355efb61()
{
    if ( isdefined( level.sight_trace_queue ) && utility::function_9dac7ef683ed0e52( level.sight_trace_queue, self ) )
    {
        level notify( "player_look_at_process" );
        
        if ( isdefined( level.civreactdata.lookatlock ) )
        {
            level.civreactdata.lookatlock = 0;
        }
        
        if ( isdefined( level.sight_trace_queue ) )
        {
            level.sight_trace_queue = undefined;
        }
    }
    
    if ( isdefined( level.var_795e84d9e048e019 ) && utility::function_9dac7ef683ed0e52( level.var_795e84d9e048e019, self ) )
    {
        level notify( "civilian_process_eye_look_at" );
        
        if ( isdefined( level.civreactdata.civilianlookatlock ) )
        {
            level.civreactdata.civilianlookatlock = 0;
        }
        
        if ( isdefined( level.var_795e84d9e048e019 ) )
        {
            level.var_795e84d9e048e019 = undefined;
        }
    }
}

// Namespace cap
// Params 2
// Checksum 0x17f0f137, Offset: 0x1090
// Size: 0x65
function cap_prop( capname, animset )
{
    self.asmname = capname;
    
    if ( !isdefined( self.asm ) )
    {
        self.asm = spawnstruct();
        self.asm.animoverrides = [];
    }
    
    self.animsetname = animset;
    self.animationarchetype = undefined;
}

// Namespace cap
// Params 2
// Checksum 0x7cd9e38a, Offset: 0x10fd
// Size: 0xbe
function function_bb57e4c61b3b6dbd( states, var_56f54d90816c4970 )
{
    self.resumestatetime = [];
    
    if ( !isarray( states ) )
    {
        states = [ states ];
    }
    
    foreach ( state in states )
    {
        self.resumestatetime[ state ] = 0;
    }
    
    if ( isdefined( var_56f54d90816c4970 ) )
    {
        self.var_2fa91f90efb30033 = var_56f54d90816c4970;
    }
}

// Namespace cap
// Params 1
// Checksum 0xace370ca, Offset: 0x11c3
// Size: 0x2a
function function_61f1ed9cea162fab( states )
{
    if ( !isarray( states ) )
    {
        states = [ states ];
    }
    
    self.relativestates = states;
}

// Namespace cap
// Params 4, eflags: 0x4
// Checksum 0xcba58824, Offset: 0x11f5
// Size: 0x1ac
function private function_82491e1bc74dd239( capasmname, arrivalstate, finalpos, animset )
{
    path = findpathcustom( self.origin, finalpos );
    
    if ( !isdefined( path ) || path.size < 2 )
    {
        assert( "<dev string:x8d>" );
        return undefined;
    }
    
    approachang = vectortoangles( finalpos - path[ path.size - 2 ] );
    anglediff = angleclamp180( self.scriptedarrivalent.angles[ 1 ] - approachang[ 1 ] );
    angleindex = getangleindex( anglediff, 22.5 );
    
    if ( angleindex == 8 )
    {
        angleindex = 0;
    }
    
    nextindexsign = anglediff + getangleoffset( angleindex );
    
    if ( nextindexsign < 0 )
    {
        nextindexsign = -1;
    }
    else
    {
        nextindexsign = 1;
    }
    
    nextindex = nextindexsign;
    array = function_42a823c020248a21( angleindex, nextindexsign );
    
    for ( arrayindex = 0; arrayindex < array.size ; arrayindex++ )
    {
        caparrivalanim = function_845718f590c62817( arrivalstate, animset, array[ arrayindex ] );
        
        if ( isdefined( caparrivalanim ) )
        {
            pos = function_6de1b23288eb153f( finalpos, angleindex, array[ arrayindex ], nextindexsign, caparrivalanim );
            
            if ( isarray( pos ) )
            {
                self setgoalpath( [ pos[ 0 ], pos[ 1 ] ] );
                return pos;
            }
            
            if ( isdefined( pos ) )
            {
                self setbtgoalradius( 1, 10 );
                self setbtgoalpos( 1, pos );
                return pos;
            }
        }
    }
    
    assert( isdefined( pos ), "<dev string:xbb>" );
    return pos;
}

// Namespace cap
// Params 5, eflags: 0x4
// Checksum 0x19776f6e, Offset: 0x13aa
// Size: 0x17c
function private function_6de1b23288eb153f( goalpos, angleindex, closestangleindex, nextindexsign, xanim )
{
    addangle = ( 0, getangleoffset( closestangleindex ), 0 );
    newangle = combineangles( self.interaction_angles, addangle );
    movedelta = getmovedelta( xanim, 0, 1 );
    arrivalanimdis = distance2d( ( 0, 0, 0 ), movedelta );
    adddistance = 40;
    approachpos = goalpos - anglestoforward( newangle ) * ( arrivalanimdis + adddistance );
    navtraceresult = navtrace( goalpos, approachpos, self, 0 );
    
    if ( navtraceresult )
    {
        return undefined;
    }
    
    diff = angleindex - closestangleindex;
    
    if ( abs( diff ) == 4 )
    {
        detourindex = closestangleindex + nextindexsign * -1;
        
        if ( detourindex > 7 )
        {
            detourindex -= 8;
        }
        else if ( detourindex < 0 )
        {
            detourindex += 8;
        }
        
        addangle = ( 0, getangleoffset( detourindex ), 0 );
        newangle = combineangles( self.interaction_angles, addangle );
        detourpos = goalpos - anglestoforward( newangle ) * ( arrivalanimdis + adddistance );
        navtraceresult = navtrace( detourpos, approachpos, self, 0 );
        
        if ( !navtraceresult )
        {
            listpos = [ detourpos, approachpos ];
            return listpos;
        }
    }
    
    return approachpos;
}

// Namespace cap
// Params 1, eflags: 0x4
// Checksum 0x6d13dd68, Offset: 0x152f
// Size: 0x65
function private getangleoffset( index )
{
    anglearray = [ 180, 135, 90, 45, 0, -45, -90, -135 ];
    return anglearray[ index ];
}

// Namespace cap
// Params 3, eflags: 0x4
// Checksum 0xcf474cd0, Offset: 0x159d
// Size: 0x171
function private function_845718f590c62817( statename, animset, index )
{
    aliasesindex = [ 8, 9, 6, 3, 2, 1, 4, 7, 8 ];
    angleindex = aliasesindex[ index ];
    
    if ( angleindex == 8 )
    {
        angleindex = "8l";
        leftindex = "left" + angleindex;
        leftalias = archetypegetalias( animset, statename, leftindex, 1 );
        rightindex = "right" + angleindex;
        rightalias = archetypegetalias( animset, statename, rightindex, 1 );
        
        if ( isdefined( leftalias ) && isdefined( rightalias ) )
        {
            return leftalias.anims;
        }
        
        angleindex = "8r";
    }
    
    leftindex = "left" + angleindex;
    leftalias = archetypegetalias( animset, statename, leftindex, 1 );
    rightindex = "right" + angleindex;
    rightalias = archetypegetalias( animset, statename, rightindex, 1 );
    
    if ( isdefined( leftalias ) )
    {
        assert( isdefined( rightalias ), "<dev string:x119>" + leftindex + "<dev string:x12d>" + rightindex );
    }
    
    if ( isdefined( rightalias ) )
    {
        assert( isdefined( leftalias ), "<dev string:x119>" + rightindex + "<dev string:x12d>" + leftindex );
    }
    
    if ( isdefined( leftalias ) && isdefined( rightalias ) )
    {
        return leftalias.anims;
    }
}

// Namespace cap
// Params 2, eflags: 0x4
// Checksum 0x30028bfa, Offset: 0x1716
// Size: 0xc0
function private function_42a823c020248a21( angleindex, nextindexsign )
{
    closestangleindex = angleindex;
    nextindex = nextindexsign;
    arrayindex = 0;
    array[ arrayindex ] = closestangleindex;
    
    for ( nextangleindex = 1; nextangleindex < 5 ; nextangleindex++ )
    {
        for ( checkbothsides = 0; checkbothsides < 2 ; checkbothsides++ )
        {
            arrayindex++;
            closestangleindex = angleindex + nextangleindex * nextindex;
            
            if ( closestangleindex < 0 )
            {
                closestangleindex += 8;
            }
            else if ( closestangleindex > 7 )
            {
                closestangleindex -= 8;
            }
            
            array[ arrayindex ] = closestangleindex;
            nextindex *= -1;
            
            if ( nextangleindex == 4 )
            {
                break;
            }
        }
    }
    
    return array;
}

