#using scripts\common\system;
#using scripts\engine\utility;

#namespace scriptable_door_utility;

// Namespace scriptable_door_utility
// Params 0, eflags: 0x5
// Checksum 0xf265f558, Offset: 0x1d2
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"scriptable_door_utility", undefined, undefined, &post_main );
}

// Namespace scriptable_door_utility
// Params 0, eflags: 0x4
// Checksum 0x6fcecdce, Offset: 0x1f3
// Size: 0x1d
function private post_main()
{
    /#
        if ( function_1cb66215306f7914( 63 ) )
        {
            return;
        }
    #/
    
    init_post_funcs();
    function_348426697254d2e5();
}

// Namespace scriptable_door_utility
// Params 0, eflags: 0x4
// Checksum 0xc5b391fc, Offset: 0x218
// Size: 0x21
function private init_post_funcs()
{
    level.var_598f3043421fe530 = [];
    level.var_598f3043421fe530[ "door_trigger" ] = &door_trigger;
}

// Namespace scriptable_door_utility
// Params 0, eflags: 0x4
// Checksum 0x4a9b65d1, Offset: 0x241
// Size: 0xfa
function private function_348426697254d2e5()
{
    foreach ( targetname, func in level.var_598f3043421fe530 )
    {
        if ( isdefined( func ) )
        {
            entlist = getentarray( targetname, "targetname" );
            
            foreach ( entity in entlist )
            {
                entity thread [[ func ]]();
            }
        }
    }
}

// Namespace scriptable_door_utility
// Params 3
// Checksum 0x4bca09c6, Offset: 0x343
// Size: 0xf4
function scriptable_door_get_in_radius( position, radius, maxheightdiff )
{
    doors = getentitylessscriptablearray( undefined, undefined, position, radius, "door" );
    filtereddoors = [];
    
    foreach ( door in doors )
    {
        if ( !door scriptableisdoor() )
        {
            continue;
        }
        
        if ( isdefined( maxheightdiff ) )
        {
            heightdiff = door.origin[ 2 ] - position[ 2 ];
            
            if ( heightdiff <= maxheightdiff )
            {
                filtereddoors[ filtereddoors.size ] = door;
            }
            
            continue;
        }
        
        filtereddoors[ filtereddoors.size ] = door;
    }
    
    return filtereddoors;
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0xdb131a37, Offset: 0x440
// Size: 0xd4
function scriptable_door_freeze_open( isbashleft )
{
    self notify( "scriptable_door_freeze_open" );
    self endon( "scriptable_door_freeze_open" );
    bashstate = undefined;
    targetangles = undefined;
    
    if ( isbashleft )
    {
        bashstate = "bash_left_90";
        targetangles = self function_9ae4daa2a11c58bd() + ( 0, 90, 0 );
    }
    else
    {
        bashstate = "bash_right_90";
        targetangles = self function_9ae4daa2a11c58bd() + ( 0, -90, 0 );
    }
    
    while ( anglesdelta( self.angles, targetangles ) > 1 )
    {
        currentstate = self getscriptablepartstate( "door" );
        
        if ( currentstate != bashstate )
        {
            self setscriptablepartstate( "door", bashstate, 0 );
        }
        
        wait 0.05;
    }
    
    self setscriptablepartstate( "door", "ajar", 0 );
    self scriptabledoorfreeze( 1 );
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0x6c8b834, Offset: 0x51c
// Size: 0x7c
function function_a6d402d10d7a3a2e( doors )
{
    foreach ( door in doors )
    {
        door scriptabledoorfreeze();
    }
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0x18a576ec, Offset: 0x5a0
// Size: 0x62, Type: bool
function scriptable_door_is_double_door_pair( otherdoor )
{
    if ( self == otherdoor )
    {
        return false;
    }
    
    centera = self function_50ddcb729a6c2820();
    centerb = otherdoor function_50ddcb729a6c2820();
    distsqrd = distancesquared( centera, centerb );
    
    if ( distsqrd > 961 || distsqrd < 441 )
    {
        return false;
    }
    
    return true;
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0xbb14881e, Offset: 0x60b
// Size: 0xac, Type: bool
function function_c4446a4597ae7ab2( otherdoor )
{
    if ( self == otherdoor )
    {
        return false;
    }
    
    centera = self function_50ddcb729a6c2820();
    centerb = otherdoor function_50ddcb729a6c2820();
    centerdistsqrd = distancesquared( centera, centerb );
    
    if ( centerdistsqrd > 3249 || centerdistsqrd < 2209 )
    {
        return false;
    }
    
    hingea = self.origin;
    hingeb = otherdoor.origin;
    hingedistsqrd = distancesquared( hingea, hingeb );
    
    if ( hingedistsqrd > 11881 || hingedistsqrd < 9801 )
    {
        return false;
    }
    
    return true;
}

// Namespace scriptable_door_utility
// Params 0, eflags: 0x4
// Checksum 0x169de429, Offset: 0x6c0
// Size: 0xd6
function private function_f5b4bddd853e6304()
{
    if ( !isdefined( self.script_parameters ) )
    {
        return [];
    }
    
    parmlist = strtok( self.script_parameters, ";" );
    parmsresult = [];
    
    foreach ( parm in parmlist )
    {
        var_3cab52442d84430 = strtok( parm, " =" );
        
        if ( isdefined( var_3cab52442d84430[ 1 ] ) )
        {
            parmsresult[ var_3cab52442d84430[ 0 ] ] = var_3cab52442d84430[ 1 ];
            continue;
        }
        
        parmsresult[ var_3cab52442d84430[ 0 ] ] = 1;
    }
    
    return parmsresult;
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0x49113426, Offset: 0x79f
// Size: 0x1ee
function function_9e6f32944120e733( createnavobstacle = 1 )
{
    self endon( "death" );
    function_1864b7fc259dd0fb();
    self.var_1a797c53e833daea = 1;
    utility::flag_wait( "scriptables_ready" );
    locks = function_15e6a795bcb31934( "door_lock" );
    
    foreach ( lock in locks )
    {
        if ( !isdefined( lock ) )
        {
            continue;
        }
        
        lock setscriptablepartstate( "door_lock", "locked", 0 );
    }
    
    if ( createnavobstacle )
    {
        self.navobstacles = [];
        doorlist = function_15e6a795bcb31934( "door" );
        
        foreach ( door in doorlist )
        {
            if ( isdefined( door.model ) )
            {
                halfbounds = function_decb653c5689e4ca( door.model );
                localmid = function_caaf4dc13b656242( door.model );
                mid = coordtransform( localmid, door.origin, door.angles );
                self.navobstacles[ self.navobstacles.size ] = createnavobstaclebybounds( mid, halfbounds, door.angles );
            }
        }
    }
}

// Namespace scriptable_door_utility
// Params 0
// Checksum 0xcc623192, Offset: 0x995
// Size: 0xc1
function function_1dfd9b1468c691c6()
{
    self endon( "death" );
    utility::flag_wait( "scriptables_ready" );
    self.var_1a797c53e833daea = undefined;
    locks = function_15e6a795bcb31934( "door_lock" );
    
    foreach ( lock in locks )
    {
        if ( !isdefined( lock ) )
        {
            continue;
        }
        
        lock setscriptablepartstate( "door_lock", "static", 0 );
    }
    
    function_1864b7fc259dd0fb();
}

// Namespace scriptable_door_utility
// Params 0
// Checksum 0xaa2c6112, Offset: 0xa5e
// Size: 0x93
function function_1864b7fc259dd0fb()
{
    if ( isarray( self.navobstacles ) )
    {
        foreach ( obstacle in self.navobstacles )
        {
            destroynavobstacle( obstacle );
        }
        
        self.navobstacles = undefined;
    }
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0x8472ec47, Offset: 0xaf9
// Size: 0xb6
function function_ebbc2714ba8e6bd9( state )
{
    assert( isstring( state ), "<dev string:x24>" );
    doorlist = function_15e6a795bcb31934( "door" );
    
    foreach ( door in doorlist )
    {
        if ( !isdefined( door ) )
        {
            continue;
        }
        
        door setscriptablepartstate( "door", state, 0 );
    }
}

// Namespace scriptable_door_utility
// Params 1, eflags: 0x4
// Checksum 0x4154643, Offset: 0xbb7
// Size: 0x6a
function private function_15e6a795bcb31934( part )
{
    if ( !isdefined( self.doorlist[ part ] ) )
    {
        if ( isdefined( self.target ) )
        {
            self.doorlist[ part ] = getentitylessscriptablearray( self.target, "targetname", undefined, undefined, part );
        }
        else
        {
            self.doorlist[ part ] = [];
        }
    }
    
    return self.doorlist[ part ];
}

// Namespace scriptable_door_utility
// Params 0, eflags: 0x4
// Checksum 0xcc9fd9e9, Offset: 0xc2a
// Size: 0x215
function private door_trigger()
{
    self endon( "death_or_disconnect" );
    
    if ( !isdefined( self.target ) )
    {
        return;
    }
    
    parms = function_f5b4bddd853e6304();
    
    if ( parms[ "locked" ] )
    {
        thread function_9e6f32944120e733();
    }
    
    utility::flag_wait( "scriptables_ready" );
    doorlist = function_15e6a795bcb31934( "door" );
    
    while ( true )
    {
        self waittill( "trigger" );
        
        if ( self.var_1a797c53e833daea )
        {
            continue;
        }
        
        foreach ( door in doorlist )
        {
            if ( !isdefined( door ) )
            {
                continue;
            }
            
            if ( isstring( parms[ "state" ] ) )
            {
                door setscriptablepartstate( "door", parms[ "state" ], 0 );
                self notify( parms[ "state" ] );
                continue;
            }
            
            if ( parms[ "cycle_on_trigger" ] )
            {
                curstate = door getscriptablepartstate( "door", 1 );
                
                if ( isdefined( curstate ) && issubstr( curstate, "open" ) )
                {
                    door setscriptablepartstate( "door", "closing", 0 );
                    self notify( "closing" );
                }
                else if ( isdefined( curstate ) && issubstr( curstate, "clos" ) )
                {
                    door setscriptablepartstate( "door", "opening", 0 );
                    self notify( "opening" );
                }
                
                continue;
            }
            
            self.doorclosetime = gettime() + 250;
            curstate = door getscriptablepartstate( "door", 1 );
            
            if ( isdefined( curstate ) && issubstr( curstate, "clos" ) || curstate == "static" )
            {
                door setscriptablepartstate( "door", "opening", 0 );
                self notify( "opening" );
                door thread function_c054395efba03b21( self );
            }
        }
        
        if ( parms[ "delete" ] )
        {
            self delete();
        }
    }
}

// Namespace scriptable_door_utility
// Params 1
// Checksum 0x778eb526, Offset: 0xe47
// Size: 0x5e
function function_c054395efba03b21( trigger )
{
    self notify( "5bd9e1e46aadb587" );
    self endon( "5bd9e1e46aadb587" );
    self endon( "death_or_disconnet" );
    trigger endon( "death_or_disconnet" );
    
    while ( gettime() < trigger.doorclosetime )
    {
        waitframe();
    }
    
    self setscriptablepartstate( "door", "closing", 0 );
    trigger notify( "closing" );
}

