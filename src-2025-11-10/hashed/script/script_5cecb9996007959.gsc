#using scripts\asm\asm;
#using scripts\common\cap;

#namespace use_armor_plate_solo;

// Namespace use_armor_plate_solo
// Params 1
// Checksum 0x99ad3982, Offset: 0x1aa
// Size: 0x80
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_902f9e79d5e57c83":
            return &oneventreceived;
        case #"hash_1637227a26307eb5":
            return &setstationary;
        case #"hash_6279e013ab5c4fdd":
            return &usearmorplate;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace use_armor_plate_solo
// Params 1
// Checksum 0x7fdd84fc, Offset: 0x232
// Size: 0xc
function onuserinit( interactionid )
{
    
}

// Namespace use_armor_plate_solo
// Params 1
// Checksum 0x15930267, Offset: 0x246
// Size: 0x9c
function onuserterminate( interactionid )
{
    self clearbtgoal( 1 );
    self notify( "endusearmorplate" );
    
    /#
        if ( isagent( self ) )
        {
            assert( self isscriptable(), "<dev string:x45>" + self.agent_type + "<dev string:x55>" );
        }
    #/
    
    scriptablepart = "armor_plate";
    
    if ( self isscriptable() && self getscriptablehaspart( scriptablepart ) )
    {
        self setscriptablepartstate( scriptablepart, "default" );
    }
    
    if ( isalive( self ) && self.asmname == "cap_use_armor_plate_solo" )
    {
        cap::cap_exit();
    }
}

// Namespace use_armor_plate_solo
// Params 3
// Checksum 0x347fbc77, Offset: 0x2ea
// Size: 0x6a, Type: bool
function oneventreceived( receiver, info, origin )
{
    if ( info == "focused_on" )
    {
        distsq = distancesquared( receiver.origin, origin );
        breakoutdist = 150;
        
        if ( distsq < breakoutdist * breakoutdist )
        {
            self notify( "endusearmorplate" );
            return true;
        }
        
        return true;
    }
    
    return false;
}

// Namespace use_armor_plate_solo
// Params 2
// Checksum 0x96144a0d, Offset: 0x35d
// Size: 0x28
function setstationary( statename, params )
{
    self function_461dc0438f85cf1d( 1 );
    self setbtgoalradius( 1, params[ 0 ] );
}

// Namespace use_armor_plate_solo
// Params 2
// Checksum 0xf6335e38, Offset: 0x38d
// Size: 0x78
function usearmorplate( statename, params )
{
    self endon( "death" );
    self endon( "endusearmorplate" );
    capname = "cap_use_armor_plate_solo";
    
    if ( self.asmname != capname )
    {
        cap::cap_start( capname, "caps/interactions/cap_use_armor_plate_solo" );
    }
    
    tempdialogue( "Using Armor Plate!" );
    self waittill( "cap_exit_completed" );
    asm::asm_fireephemeralevent( "use_armor_plate", "end" );
}

// Namespace use_armor_plate_solo
// Params 1
// Checksum 0x5bf96132, Offset: 0x40d
// Size: 0x64
function tempdialogue( var_4f6c17e0baa01798 )
{
    debug = getdvarint( @"hash_3e267ec6e066e2b", 0 );
    
    if ( debug )
    {
        /#
            print3d( self.origin + ( 0, 0, 80 ), var_4f6c17e0baa01798, ( 1, 1, 1 ), 1, 0.8, 1, 1 );
        #/
    }
}

