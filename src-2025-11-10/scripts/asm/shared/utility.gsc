#using scripts\anim\battlechatter;
#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace utility;

// Namespace utility
// Params 3
// Checksum 0xedce4ba2, Offset: 0x690
// Size: 0x94
function chooseanimshoot( asmname, statename, params )
{
    var_b828d693a10ea881 = params;
    assert( isdefined( var_b828d693a10ea881 ) );
    alias = self._blackboard.shootstate + "_" + var_b828d693a10ea881;
    
    if ( isdefined( self._blackboard.shootstate ) && asm::asm_hasalias( statename, alias ) )
    {
        return asm::asm_lookupanimfromalias( statename, alias );
    }
    
    return asm::asm_lookupanimfromalias( statename, params );
}

// Namespace utility
// Params 3
// Checksum 0xb6b835e, Offset: 0x72d
// Size: 0x89
function choosedemeanoranimwithoverride( asmname, statename, params )
{
    demeanor = asm::asm_getdemeanor();
    
    if ( asm::asm_hasdemeanoranimoverride( demeanor, params ) )
    {
        override = asm::asm_getdemeanoranimoverride( demeanor, params );
        
        if ( isarray( override ) )
        {
            return override[ randomint( override.size ) ];
        }
        
        return override;
    }
    
    if ( !asm::asm_hasalias( statename, demeanor ) )
    {
        return asm::asm_lookupanimfromalias( statename, "default" );
    }
    
    return asm::asm_lookupanimfromalias( statename, demeanor );
}

// Namespace utility
// Params 3
// Checksum 0x74251ad7, Offset: 0x7bf
// Size: 0xd0
function choosedemeanoranimwithoverridevariants( asmname, statename, params )
{
    demeanor = asm::asm_getdemeanor();
    
    if ( asm::asm_hasdemeanoranimoverride( demeanor, params ) )
    {
        override = asm::asm_getdemeanoranimoverride( demeanor, params );
        
        if ( isarray( override ) )
        {
            return override[ randomint( override.size ) ];
        }
        
        return override;
    }
    
    if ( !asm::asm_hasalias( statename, demeanor ) )
    {
        moveanims = [];
        moveanims[ 0 ] = asm::asm_lookupanimfromalias( statename, "trans_to_one_hand_run" );
        moveanims[ 1 ] = asm::asm_lookupanimfromalias( statename, "one_hand_run" );
        moveanims[ 2 ] = asm::asm_lookupanimfromalias( statename, "trans_to_two_hand_run" );
        moveanims[ 3 ] = asm::asm_lookupanimfromalias( statename, "two_hand_run" );
        return moveanims;
    }
    
    return asm::asm_lookupanimfromalias( statename, demeanor );
}

// Namespace utility
// Params 1
// Checksum 0x6f44b055, Offset: 0x898
// Size: 0x57
function overridecovercrouchnodetype( node )
{
    if ( node.type == "Cover Crouch" && isdefined( self._blackboard.croucharrivaltype ) )
    {
        return self._blackboard.croucharrivaltype;
    }
    
    return node.type;
}

// Namespace utility
// Params 0
// Checksum 0x231369a1, Offset: 0x8f8
// Size: 0x8d, Type: bool
function allowlmgarrival()
{
    if ( self.disablelmgmount )
    {
        return false;
    }
    
    ismg = weaponclass( self.weapon ) == "mg";
    
    if ( ismg )
    {
        if ( !isdefined( self.node ) || self.node isnodelmgmountable() )
        {
            return true;
        }
        
        return false;
    }
    
    if ( self.node == self._blackboard.deployedlmgnode && self.node isnodelmgmountable() )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x5075c3b7, Offset: 0x98e
// Size: 0x6b
function getnodeforwardyaw( node, poseoverride, var_53587285fd5daa1f )
{
    assert( isai( self ) );
    assert( !actor_is3d() );
    
    if ( !isdefined( var_53587285fd5daa1f ) )
    {
        var_53587285fd5daa1f = 1;
    }
    
    offset = self getnodeyawoffset( node, poseoverride, var_53587285fd5daa1f );
    return node.angles[ 1 ] + offset;
}

// Namespace utility
// Params 1
// Checksum 0xf061deff, Offset: 0xa02
// Size: 0x2b, Type: bool
function nodeiscoverstand3dtype( node )
{
    if ( node.type == "Cover Stand 3D" )
    {
        return !nodeiscoverexposed3dtype( node );
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0xf6a42ab3, Offset: 0xa36
// Size: 0x38, Type: bool
function nodeiscoverexposed3dtype( node )
{
    if ( node.type == "Cover Stand 3D" )
    {
        if ( node.script_parameters == "exposed" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0xa1f2cd49, Offset: 0xa77
// Size: 0x37
function getnodetypename( node )
{
    if ( isdefined( node ) )
    {
        if ( nodeiscoverexposed3dtype( node ) )
        {
            return "Cover Exposed 3D";
        }
        else
        {
            return node.type;
        }
    }
    
    return "undefined";
}

// Namespace utility
// Params 3
// Checksum 0x80a52694, Offset: 0xab7
// Size: 0xbd
function choosestrongdamagedeath( asmname, statename, params )
{
    alias = undefined;
    
    if ( abs( self.damageyaw ) > 150 )
    {
        if ( damagelocationisany( "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower", "left_foot", "right_foot" ) )
        {
            alias = "legs";
        }
        else if ( self.damagelocation == "torso_lower" )
        {
            alias = "torso_lower";
        }
        else
        {
            alias = "default";
        }
    }
    else if ( self.damageyaw < 0 )
    {
        alias = "right";
    }
    else
    {
        alias = "left";
    }
    
    return asm::asm_lookupanimfromalias( statename, alias );
}

// Namespace utility
// Params 0
// Checksum 0xb6e2b369, Offset: 0xb7d
// Size: 0x9, Type: bool
function isatcovernode()
{
    return isdefined( asm_bb::bb_getcovernode() );
}

// Namespace utility
// Params 4
// Checksum 0xcd087765, Offset: 0xb8f
// Size: 0xb1, Type: bool
function shouldleaveanimscripted( asmname, statename, tostatename, params )
{
    if ( asm_bb::bb_isanimscripted() )
    {
        return false;
    }
    
    if ( isdefined( params ) )
    {
        assert( !isarray( params ) );
        var_6de663f46c8b84ba = params;
        
        if ( var_6de663f46c8b84ba )
        {
            if ( self.a.movement == "stop" )
            {
                return false;
            }
            
            if ( !asm_bb::bb_moverequested() )
            {
                return false;
            }
        }
        else if ( asm_bb::bb_moverequested() && self.a.movement != "stop" )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace utility
// Params 3
// Checksum 0x7d5d5941, Offset: 0xc49
// Size: 0x85
function animscriptedaction( asmname, statename, params )
{
    self endon( statename + "_finished" );
    self.a.movement = "run";
    self.gunposeoverride_internal = "disable";
    animindex = asm::asm_lookupanimfromalias( statename, "blank" );
    self aisetanim( statename, animindex );
    asm::asm_donotetracks( asmname, statename, asm::asm_getnotehandler( asmname, statename ) );
}

// Namespace utility
// Params 4
// Checksum 0x585c164e, Offset: 0xcd6
// Size: 0xe6, Type: bool
function randomizepassthroughchildren( asmname, statename, tostatename, params )
{
    ptostate = anim.asm[ asmname ].states[ tostatename ];
    assert( isdefined( ptostate ) );
    
    if ( isdefined( ptostate.transitions ) )
    {
        if ( ptostate.transitions.size == 2 )
        {
            if ( cointoss() )
            {
                temp = ptostate.transitions[ 0 ];
                ptostate.transitions[ 0 ] = ptostate.transitions[ 1 ];
                ptostate.transitions[ 1 ] = temp;
            }
        }
        else
        {
            ptostate.transitions = array_randomize( ptostate.transitions );
        }
    }
    
    return true;
}

// Namespace utility
// Params 1
// Checksum 0x4465c1f6, Offset: 0xdc5
// Size: 0x60, Type: bool
function nodeshouldfaceangles( node )
{
    if ( !isdefined( node ) )
    {
        return false;
    }
    
    if ( isdefined( node.angles ) )
    {
        return true;
    }
    
    if ( isstruct( node ) )
    {
        return false;
    }
    
    return isdefined( node.type ) && node.type != "Path" && !isnodeexposed3d( node );
}

// Namespace utility
// Params 2
// Checksum 0x3e37168f, Offset: 0xe2e
// Size: 0x4e
function choosecrouchorstand( guy, node )
{
    return int( node.origin[ 0 ] + node.origin[ 1 ] + node.origin[ 2 ] + guy getentitynumber() ) % 2;
}

// Namespace utility
// Params 2
// Checksum 0xcb120797, Offset: 0xe85
// Size: 0x34
function choosecrouchorstandtac( guy, tacorigin )
{
    return int( abs( tacorigin[ 0 ] + tacorigin[ 1 ] + tacorigin[ 2 ] + guy getentitynumber() ) ) % 2;
}

// Namespace utility
// Params 0
// Checksum 0xfbde8f7b, Offset: 0xec2
// Size: 0xd3
function getarrivalnode()
{
    if ( self.leavecasualkiller )
    {
        return undefined;
    }
    
    if ( isdefined( self.scriptedarrivalent ) && !self btgoalvalid() )
    {
        assert( isdefined( self.scriptedarrivalent.type ) );
        return self.scriptedarrivalent;
    }
    
    var_7237854e3be197ca = self.node;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    if ( isdefined( self.prevnode ) && isdefined( self.pathgoalpos ) && distance2dsquared( self.prevnode.origin, self.pathgoalpos ) < 36 )
    {
        return self.prevnode;
    }
    
    var_7237854e3be197ca = self.last_set_goalnode;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return self.last_set_goalent;
}

// Namespace utility
// Params 2
// Checksum 0x9a34aeb6, Offset: 0xf9e
// Size: 0x380
function isarrivaltypecivilian( asmname, arrivaltype )
{
    if ( isdefined( self.customarrivalstate ) )
    {
        return ( arrivaltype == "Custom" );
    }
    
    if ( asm_bb::bb_smartobjectrequested() )
    {
        return ( arrivaltype == "Exposed" );
    }
    
    node = getarrivalnode();
    
    if ( isnode( node ) && node iscovermultinode() )
    {
        target_nodetype = getbestcovermultinodetype( node );
        
        if ( isdefined( target_nodetype ) )
        {
            node setcovermultinodetype( target_nodetype );
        }
    }
    
    if ( !( isdefined( node ) && isdefined( node.type ) ) || node.type == "struct" || !self canusecover() )
    {
        return ( arrivaltype == "Exposed" );
    }
    
    if ( isdefined( node ) && node.type == "Cover Crouch" )
    {
        covertype = getdvar( @"hash_f72dde9792b94cc9" );
        
        if ( covertype != "" )
        {
            return ( arrivaltype == covertype );
        }
        
        if ( isdefined( self._blackboard.croucharrivaltype ) )
        {
            return ( arrivaltype == self._blackboard.croucharrivaltype );
        }
        else if ( isdefined( node.covercrouchtype ) )
        {
            return ( arrivaltype == node.covercrouchtype );
        }
    }
    
    demeanor = asm::asm_getdemeanor();
    canstand = ( !isnode( node ) || node doesnodeallowstance( "stand" ) ) && self isstanceallowed( "stand" );
    cancrouch = ( !isnode( node ) || node doesnodeallowstance( "crouch" ) ) && self isstanceallowed( "crouch" ) && demeanor != "casual" && demeanor != "casual_gun";
    
    switch ( arrivaltype )
    {
        case #"hash_cf178f370da8b13":
            if ( node.type != "Path" && node.type != "Exposed" )
            {
                return 0;
            }
            
            if ( cancrouch && choosecrouchorstand( self, node ) )
            {
                return 0;
            }
            
            return canstand;
        case #"hash_78bfa3258dd84af":
            if ( node.type != "Path" && node.type != "Exposed" )
            {
                return 0;
            }
            
            if ( canstand && !choosecrouchorstand( self, node ) )
            {
                return 0;
            }
            
            return cancrouch;
        case #"hash_c3b74422dec48736":
            return ( node.type == "Cover Crouch" || node.type == "Conceal Crouch" || node.type == "Cover Crouch Window" || node.type == "Cover Stand" || node.type == "Conceal Stand" || node.type == "Cover Prone" || node.type == "Conceal Prone" );
        case #"hash_e1d8e1adebed5a61":
            return ( node.type == "Cover Left" );
        case #"hash_cd3ffe799551db82":
            return ( node.type == "Cover Right" );
        case #"hash_a85b3cf9ab13da63":
            return ( node.type == "Exposed Moving" );
    }
    
    return arrivaltype == node.type;
}

// Namespace utility
// Params 4
// Checksum 0x179d1b70, Offset: 0x1327
// Size: 0x73e
function isarrivaltype( asmname, statename, tostatename, params )
{
    arrivaltype = params;
    
    if ( isdefined( self.customarrivalstate ) )
    {
        return ( arrivaltype == "Custom" );
    }
    
    if ( asm_bb::bb_smartobjectrequested() )
    {
        return ( arrivaltype == "Exposed" );
    }
    
    node = getarrivalnode();
    
    if ( isnode( node ) && node iscovermultinode() )
    {
        target_nodetype = getbestcovermultinodetype( node );
        
        if ( isdefined( target_nodetype ) && node.type != target_nodetype && arrivaltype == target_nodetype )
        {
            node setcovermultinodetype( target_nodetype );
        }
    }
    
    if ( !( isdefined( node ) && isdefined( node.type ) ) || node.type == "struct" || !self canusecover() )
    {
        if ( actor_is3d() )
        {
            return ( arrivaltype == "Exposed 3D" );
        }
        else
        {
            return ( arrivaltype == "Exposed" );
        }
    }
    
    lmg = allowlmgarrival();
    
    if ( isdefined( node ) && node.type == "Cover Crouch" && !lmg )
    {
        covertype = getdvar( @"hash_f72dde9792b94cc9" );
        
        if ( covertype != "" )
        {
            return ( arrivaltype == covertype );
        }
        
        if ( isdefined( self._blackboard.croucharrivaltype ) )
        {
            return ( arrivaltype == self._blackboard.croucharrivaltype );
        }
        else if ( isdefined( node.covercrouchtype ) )
        {
            return ( arrivaltype == node.covercrouchtype );
        }
    }
    
    demeanor = asm::asm_getdemeanor();
    canstand = ( !isnode( node ) || node doesnodeallowstance( "stand" ) ) && self isstanceallowed( "stand" );
    cancrouch = ( !isnode( node ) || node doesnodeallowstance( "crouch" ) ) && self isstanceallowed( "crouch" ) && demeanor != "casual" && demeanor != "casual_gun";
    
    if ( asmname == "zero_gravity_space" )
    {
        switch ( arrivaltype )
        {
            case #"hash_4626de3588a73d7e":
                return ( isnodeexposed3d( node ) && canstand );
            case #"hash_b786e406d37a0dd7":
                return ( node.type == "Cover 3D" );
            case #"hash_bdacbb6eaaa538c7":
                return nodeiscoverstand3dtype( node );
            case #"hash_a8e3c2570a26f937":
                return nodeiscoverexposed3dtype( node );
            case #"hash_78bfa3258dd84af":
            case #"hash_cf178f370da8b13":
            case #"hash_55ed607005f12d49":
            case #"hash_667bc7e605903a6c":
            case #"hash_c051a32186a33cae":
            case #"hash_c3b74422dec48736":
            case #"hash_cd3ffe799551db82":
            case #"hash_e1d8e1adebed5a61":
            case #"hash_fd7cd04a31eca976":
                assertmsg( arrivaltype + "<dev string:x24>" );
                break;
        }
    }
    else if ( asmname == "zero_gravity" )
    {
        switch ( arrivaltype )
        {
            case #"hash_cf178f370da8b13":
                return ( ( node.type == "Path" || node.type == "Exposed" ) && canstand );
            case #"hash_78bfa3258dd84af":
                return ( ( node.type == "Path" || node.type == "Exposed" ) && cancrouch );
            case #"hash_c3b74422dec48736":
                return ( node.type == "Cover Crouch" || node.type == "Conceal Crouch" );
            case #"hash_78b110033ccb68b0":
                return ( node.type == "Cover Stand" || node.type == "Conceal Stand" );
            case #"hash_55ed607005f12d49":
            case #"hash_667bc7e605903a6c":
            case #"hash_c051a32186a33cae":
            case #"hash_cd3ffe799551db82":
            case #"hash_e1d8e1adebed5a61":
                assertmsg( arrivaltype + "<dev string:x24>" );
                break;
        }
    }
    else
    {
        switch ( arrivaltype )
        {
            case #"hash_cf178f370da8b13":
                if ( node.type != "Path" && node.type != "Exposed" )
                {
                    return 0;
                }
                
                if ( cancrouch && choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return canstand;
            case #"hash_78bfa3258dd84af":
                if ( node.type != "Path" && node.type != "Exposed" )
                {
                    return 0;
                }
                
                if ( canstand && !choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return cancrouch;
            case #"hash_c3b74422dec48736":
                return ( node.type == "Cover Crouch" || node.type == "Conceal Crouch" || node.type == "Cover Crouch Window" );
            case #"hash_78b110033ccb68b0":
                return ( node.type == "Cover Stand" || node.type == "Conceal Stand" );
            case #"hash_c051a32186a33cae":
                return ( node.type == "Cover Prone" || node.type == "Conceal Prone" );
            case #"hash_e1d8e1adebed5a61":
                if ( node.type != "Cover Left" )
                {
                    return 0;
                }
                
                if ( cancrouch && choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return canstand;
            case #"hash_55ed607005f12d49":
                if ( node.type != "Cover Left" )
                {
                    return 0;
                }
                
                if ( canstand && !choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return cancrouch;
            case #"hash_cd3ffe799551db82":
                if ( node.type != "Cover Right" )
                {
                    return 0;
                }
                
                if ( cancrouch && choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return canstand;
            case #"hash_667bc7e605903a6c":
                if ( node.type != "Cover Right" )
                {
                    return 0;
                }
                
                if ( canstand && !choosecrouchorstand( self, node ) )
                {
                    return 0;
                }
                
                return cancrouch;
            case #"hash_5478c96ea12827c6":
                return ( ( node.type == "Cover Crouch" || node.type == "Cover Prone" ) && allowlmgarrival() );
            case #"hash_bfb9a0387a2536f4":
                return ( node.type == "Cover Stand" && allowlmgarrival() );
            case #"hash_a85b3cf9ab13da63":
                return ( node.type == "Exposed Moving" );
        }
    }
    
    return arrivaltype == node.type;
}

// Namespace utility
// Params 3
// Checksum 0xb24b2674, Offset: 0x1a6e
// Size: 0x67
function playmoveloop( asmname, statename, params )
{
    self endon( statename + "_finished" );
    self.requestarrivalnotify = 1;
    self.var_4ff0a015a19a428e = 1;
    self.var_2d4dd3f57eb8b4ed = 0;
    rate = 1;
    asm::function_b7619cbe4e9abaf4( asmname, statename, rate, 1 );
}

// Namespace utility
// Params 3
// Checksum 0x4538883d, Offset: 0x1add
// Size: 0x29
function playmoveloopcasual( asmname, statename, params )
{
    playmoveloop( asmname, statename, params );
}

// Namespace utility
// Params 3
// Checksum 0x8074f72b, Offset: 0x1b0e
// Size: 0x3f
function playanimwithdooropen( asmname, statename, params )
{
    self.var_4ff0a015a19a428e = 1;
    self.var_2d4dd3f57eb8b4ed = 1;
    playanim( asmname, statename, params );
}

// Namespace utility
// Params 3
// Checksum 0x289d47b, Offset: 0x1b55
// Size: 0x1e
function playmoveloopcasualcleanup( asmname, statename, params )
{
    
}

// Namespace utility
// Params 0
// Checksum 0xf64e1822, Offset: 0x1b7b
// Size: 0x5b
function calcdooropenspeed()
{
    t = 0.75;
    speed = length( self.velocity );
    
    if ( speed > 0 )
    {
        t = 24 / speed;
    }
    
    if ( t < 0.15 )
    {
        t = 0.15;
    }
    else if ( t > 1 )
    {
        t = 1;
    }
    
    return t;
}

// Namespace utility
// Params 0
// Checksum 0x592c9bf4, Offset: 0x1bdf
// Size: 0x15c
function opendooratreasonabletime()
{
    door = self._blackboard.doortoopen;
    fndooropen = self.fndooropen;
    
    if ( !( isdefined( door ) && isdefined( fndooropen ) ) )
    {
        return;
    }
    
    self._blackboard.door_opened = 1;
    self endon( "death" );
    door endon( "death" );
    self endon( "path_has_door" );
    doorcenter = self [[ self.fngetdoorcenter ]]( door );
    var_25f941702b158e0f = distance2dsquared( doorcenter, self.origin );
    opendistsq = 5476;
    
    if ( !issp() )
    {
        opendist = 0.8 * length( self.velocity );
        opendist *= 0.9;
        opendistsq = max( opendist * opendist, opendistsq );
    }
    
    while ( var_25f941702b158e0f > opendistsq )
    {
        if ( isdefined( self._blackboard.doortoopen ) && door != self._blackboard.doortoopen )
        {
            return;
        }
        
        waitframe();
        var_25f941702b158e0f = distance2dsquared( doorcenter, self.origin );
    }
    
    t = calcdooropenspeed();
    self notify( "opening_door" );
    self thread [[ fndooropen ]]( door, t );
    return t;
}

// Namespace utility
// Params 1
// Checksum 0x6d748938, Offset: 0x1d44
// Size: 0x4e
function opendooratreasonabletime_waitforabort( statename )
{
    self endon( "opening_door_done" );
    self waittill( statename + "_finished" );
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    self._blackboard.doortoopen = undefined;
    self.isopeningdoor = 0;
    self notify( "opening_door_done" );
}

// Namespace utility
// Params 1
// Checksum 0x6515052a, Offset: 0x1d9a
// Size: 0x3e
function closedoorifnecessary( door )
{
    assert( isdefined( self.fndoorneedstoclose ) );
    
    if ( self [[ self.fndoorneedstoclose ]]( door ) )
    {
        self [[ self.fndoorclose ]]( door );
    }
}

// Namespace utility
// Params 3
// Checksum 0x21be14e5, Offset: 0x1de0
// Size: 0xa8
function tryopendoor( asmname, statename, var_af96c65208f5951d )
{
    self endon( statename + "_finished" );
    self endon( "death" );
    
    if ( isdefined( self._blackboard.doortoopen ) )
    {
        var_b415255407627c99 = isdoorclear();
        
        if ( var_b415255407627c99 )
        {
            self._blackboard.doortoopen = undefined;
            return;
        }
        
        bdooropen = 0;
        
        if ( !self.facemotion )
        {
            bdooropen = function_d33453a69eac5d6a( statename );
        }
        
        if ( !bdooropen )
        {
            function_3c6bf5a6b2c5feb7( asmname, statename, var_af96c65208f5951d );
        }
    }
}

// Namespace utility
// Params 0
// Checksum 0xfe14b76f, Offset: 0x1e90
// Size: 0x89
function isdoorclear()
{
    var_b415255407627c99 = 0;
    
    if ( self [[ self.fndooralreadyopen ]]( self._blackboard.doortoopen ) )
    {
        var_b415255407627c99 = 1;
    }
    
    if ( !var_b415255407627c99 && !( isent( self._blackboard.doortoopen ) || self._blackboard.doortoopen scriptableisdoor() ) )
    {
        if ( !isdefined( self getmodifierlocationonpath( "door", 200 ) ) )
        {
            var_b415255407627c99 = 1;
        }
    }
    
    return var_b415255407627c99;
}

// Namespace utility
// Params 2
// Checksum 0x60cb780b, Offset: 0x1f22
// Size: 0xc0, Type: bool
function function_5aa09266a0bc8cdb( door, var_dcb66f941baa11e2 )
{
    if ( getdvarint( @"hash_11cc2c4936530ef4" ) == 0 )
    {
        return false;
    }
    
    if ( !self isdoingambush() )
    {
        return false;
    }
    
    var_3462594999eb5ba8 = getdvarfloat( @"hash_75f600e9a3c3cc4d", 1000 );
    
    if ( var_dcb66f941baa11e2 )
    {
        playersinradius = getplayersinradius( self.origin, var_3462594999eb5ba8, 120, 0 );
        
        if ( playersinradius.size > 0 )
        {
            return false;
        }
    }
    
    if ( isdefined( door ) && isdefined( self.pathgoalpos ) )
    {
        doororigin = self [[ self.fngetdoorcenter ]]( door );
        
        if ( distancesquared( doororigin, self.pathgoalpos ) < 4096 )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace utility
// Params 1
// Checksum 0xca16f863, Offset: 0x1feb
// Size: 0x61
function ambushclosedoor( door )
{
    var_5dfb14bc7b8fcbcd = getdvarfloat( @"hash_b26883cff4c56986", 0.5 );
    wait var_5dfb14bc7b8fcbcd;
    
    if ( isdefined( door ) && function_5aa09266a0bc8cdb( door, 1 ) )
    {
        if ( self [[ self.fndooralreadyopen ]]( door ) )
        {
            self [[ self.fndoorclose ]]( door );
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x6aad8115, Offset: 0x2054
// Size: 0x107
function function_d33453a69eac5d6a( statename )
{
    self endon( statename + "_finished" );
    self endon( "death" );
    bdooropen = 0;
    lookaheaddir = self.lookaheaddir;
    lookaheaddir = vectornormalize( ( lookaheaddir[ 0 ], lookaheaddir[ 1 ], 0 ) );
    facingdir = anglestoforward( self.angles );
    
    if ( vectordot( lookaheaddir, facingdir ) < 0.966 )
    {
        door = self._blackboard.doortoopen;
        self.isopeningdoor = 1;
        thread function_b48164633e07ef6a( statename );
        t = opendooratreasonabletime();
        
        if ( isdefined( t ) )
        {
            thread opendooratreasonabletime_waitforabort( statename );
            wait t;
        }
        
        self notify( "opening_door_done" );
        self._blackboard.doortoopen = undefined;
        self.isopeningdoor = 0;
        
        if ( function_5aa09266a0bc8cdb( door ) )
        {
            thread ambushclosedoor( door );
        }
        
        bdooropen = 1;
    }
    
    return bdooropen;
}

// Namespace utility
// Params 3
// Checksum 0x79441f9, Offset: 0x2164
// Size: 0x21d
function function_3c6bf5a6b2c5feb7( asmname, statename, var_af96c65208f5951d )
{
    self endon( statename + "_finished" );
    self endon( "death" );
    door = self._blackboard.doortoopen;
    self._blackboard.door_opened = undefined;
    var_4efe15e3722ef4ec = 1;
    cdooroffset = 160;
    cdoorpadding = 2;
    targetspeed = length2d( self.velocity );
    
    if ( !var_af96c65208f5951d )
    {
        var_88c50b997b3c8909 = function_4bd933288f40a37a( statename, targetspeed );
        
        if ( isdefined( var_88c50b997b3c8909[ 1 ] ) )
        {
            cdooroffset = function_69508e2071b7e081( var_88c50b997b3c8909[ 0 ], var_88c50b997b3c8909[ 1 ], targetspeed );
        }
        else
        {
            var_af96c65208f5951d = 1;
        }
    }
    
    var_e6a01c69839d7dac = var_4efe15e3722ef4ec + cdooroffset + cdoorpadding;
    doorcenter = self [[ self.fngetdoorcenter ]]( door );
    disttodoor = distance2d( doorcenter, self.origin );
    
    if ( disttodoor < var_e6a01c69839d7dac )
    {
        self.isopeningdoor = 1;
        thread closedoorifnecessary( door );
        var_98a54575ddd10fde = 5;
        
        if ( var_af96c65208f5951d )
        {
            var_98a54575ddd10fde = 2;
        }
        
        if ( var_af96c65208f5951d || disttodoor < var_e6a01c69839d7dac - targetspeed * var_98a54575ddd10fde * level.framedurationseconds )
        {
            assert( isdefined( self.fndooropen ) );
            thread function_b48164633e07ef6a( statename );
            t = opendooratreasonabletime();
            
            if ( isdefined( t ) )
            {
                thread opendooratreasonabletime_waitforabort( statename );
                wait t;
            }
            
            self notify( "opening_door_done" );
            self._blackboard.doortoopen = undefined;
            self.isopeningdoor = 0;
            
            if ( function_5aa09266a0bc8cdb( door ) )
            {
                thread ambushclosedoor( door );
            }
            
            return;
        }
        
        self setupdooropen( door, var_e6a01c69839d7dac, getdooropenspeedlookup() );
        thread handledooropennotetrack( asmname, statename );
        thread handledooropenterminate( asmname, statename );
        self waittill( "opening_door_done" );
        
        if ( function_5aa09266a0bc8cdb( door ) )
        {
            thread ambushclosedoor( door );
        }
    }
}

// Namespace utility
// Params 3
// Checksum 0xac284093, Offset: 0x2389
// Size: 0xd0
function function_69508e2071b7e081( doorstate, opendooranim, targetspeed )
{
    doorxanim = asm::asm_getxanim( doorstate, opendooranim );
    assert( animhasnotetrack( doorxanim, "<dev string:x51>" ), getxhashsourcename( getanimname( doorxanim ) ) + "<dev string:x5f>" );
    opentimes = getnotetracktimes( doorxanim, "door_touch" );
    assert( opentimes.size > 0 );
    animdist = ( opentimes[ 0 ] * getanimlength( doorxanim ) + 3 * level.framedurationseconds ) * targetspeed;
    cdooroffset = animdist + 24;
    assert( animhasnotetrack( doorxanim, "<dev string:x80>" ), getxhashsourcename( getanimname( doorxanim ) ) + "<dev string:x8d>" );
    return cdooroffset;
}

// Namespace utility
// Params 2
// Checksum 0x2c045df, Offset: 0x2462
// Size: 0xbf
function function_4bd933288f40a37a( statename, targetspeed )
{
    doorstate = statename;
    dooranim = asm::asm_lookupanimfromaliasifexists( statename, "2" );
    
    if ( !isdefined( dooranim ) )
    {
        targetspeed = self aigettargetspeed();
        speedstate = getnearestspeedthresholdname( self, targetspeed );
        
        if ( isdefined( speedstate ) )
        {
            dooralias = speedstate + "2";
            dooranim = asm::asm_lookupanimfromaliasifexists( statename, dooralias );
            
            if ( !isdefined( dooranim ) )
            {
                doorstate = "door_open";
                dooranim = asm::asm_lookupanimfromaliasifexists( "door_open", dooralias );
            }
        }
    }
    
    if ( !isdefined( dooranim ) )
    {
        dooranim = asm::asm_lookupanimfromaliasifexists( "door_open", "2" );
    }
    
    return [ doorstate, dooranim ];
}

// Namespace utility
// Params 2
// Checksum 0x38f5398, Offset: 0x252a
// Size: 0x12d
function handledooropennotetrack( asmname, statename )
{
    self endon( statename + "_finished" );
    self endon( "opening_door_done" );
    
    while ( true )
    {
        self waittill( "door_open", notes );
        
        if ( !isarray( notes ) )
        {
            notes = [ notes ];
        }
        
        for ( inote = 0; inote < notes.size ; inote++ )
        {
            if ( notes[ inote ] == "door_open" )
            {
                if ( isdefined( self.fndooropen ) && isdefined( self._blackboard.doortoopen ) )
                {
                    self notify( "opening_door" );
                    t = calcdooropenspeed();
                    self thread [[ self.fndooropen ]]( self._blackboard.doortoopen, t );
                    self._blackboard.door_opened = 1;
                }
                
                continue;
            }
            
            if ( notes[ inote ] == "end" )
            {
                self._blackboard.doortoopen = undefined;
                self.isopeningdoor = 0;
                self cleardooropen();
                self notify( "opening_door_done" );
            }
        }
        
        waitframe();
    }
}

// Namespace utility
// Params 2
// Checksum 0x3d6622a7, Offset: 0x265f
// Size: 0x73
function handledooropenterminate( asmname, statename )
{
    self endon( "opening_door_done" );
    self waittill( statename + "_finished" );
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( !self._blackboard.door_opened )
    {
        thread opendooratreasonabletime();
    }
    
    self._blackboard.doortoopen = undefined;
    self.isopeningdoor = 0;
    self cleardooropen();
}

// Namespace utility
// Params 1
// Checksum 0xd801981b, Offset: 0x26da
// Size: 0x58
function function_b48164633e07ef6a( statename )
{
    self endon( "opening_door_done" );
    self endon( "death" );
    statefinish = statename + "_finished";
    msg = waittill_any_return( statefinish, "opening_door" );
    
    if ( msg == statefinish )
    {
        self.isopeningdoor = 0;
    }
}

// Namespace utility
// Params 0
// Checksum 0xd5509522, Offset: 0x273a
// Size: 0x59
function getdooropenspeedlookup()
{
    if ( self.animsetname == "civilian_panic" )
    {
        return "civilian_panic";
    }
    
    if ( self.unittype == "civilian" )
    {
        return "civilian";
    }
    
    if ( self.animsetname == "juggernaut" )
    {
        return "soldier";
    }
    
    return "soldier";
}

// Namespace utility
// Params 3
// Checksum 0x159c1f49, Offset: 0x279b
// Size: 0x29
function playanim( asmname, statename, params )
{
    asm::asm_playanimstate( asmname, statename, params );
}

// Namespace utility
// Params 3
// Checksum 0x3c6d0f38, Offset: 0x27cc
// Size: 0x31
function playanimwithsound( asmname, statename, params )
{
    self playsound( params );
    asm::asm_playanimstate( asmname, statename, params );
}

// Namespace utility
// Params 3
// Checksum 0x946364e0, Offset: 0x2805
// Size: 0x2d
function loopanim( asmname, statename, params )
{
    asm::function_b7619cbe4e9abaf4( asmname, statename, 1 );
}

// Namespace utility
// Params 3
// Checksum 0x3a3c969d, Offset: 0x283a
// Size: 0xc3
function chooseanimidle( asmname, statename, params )
{
    demeanor = asm::asm_getdemeanor();
    
    if ( asm::asm_hasdemeanoranimoverride( demeanor, "idle" ) )
    {
        override = asm::asm_getdemeanoranimoverride( demeanor, "idle" );
        
        if ( isarray( override ) )
        {
            return override[ randomint( override.size ) ];
        }
        
        return override;
    }
    
    if ( isdefined( self.node ) && self.node.type == "Cover Stand" )
    {
        if ( !self.node isvalidpeekoutdir( "over" ) )
        {
            params += "_high";
        }
    }
    
    return chooseanim_weaponclassprepended( asmname, statename, params );
}

// Namespace utility
// Params 3
// Checksum 0x543a02f9, Offset: 0x2906
// Size: 0xcd
function chooseanim_weaponclassprepended( asmname, statename, params )
{
    assert( isdefined( self.weapon ) );
    weapclass = weaponclass( self.weapon );
    alias = undefined;
    
    if ( !isdefined( params ) )
    {
        return asm::asm_getrandomanim( asmname, statename );
    }
    else
    {
        alias = params;
    }
    
    if ( !asm::asm_hasalias( statename, weapclass + alias ) )
    {
        weapclass = "rifle";
        assert( asm::asm_hasalias( statename, weapclass + alias ), "<dev string:xad>" + self.animsetname + "<dev string:xbb>" + statename + "<dev string:xc6>" + weapclass + alias + "<dev string:xd8>" );
    }
    
    return asm::asm_lookupanimfromalias( statename, weapclass + alias );
}

// Namespace utility
// Params 4
// Checksum 0xad1e0405, Offset: 0x29dc
// Size: 0x48, Type: bool
function shouldstrafe( asmname, statename, tostatename, params )
{
    return asm_bb::bb_moverequested() && !self.facemotion && self.allowstrafe;
}

// Namespace utility
// Params 4
// Checksum 0xe9f7ea8c, Offset: 0x2a2d
// Size: 0x59, Type: bool
function shouldabortstrafe( asmname, statename, tostatename, params )
{
    if ( !shouldstrafe( asmname, statename, tostatename, params ) )
    {
        return true;
    }
    
    if ( !asm_bb::bb_movetyperequested( "combat" ) )
    {
        return true;
    }
    
    if ( asm_bb::bb_meleechargerequested() )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x5e69ddaa, Offset: 0x2a8f
// Size: 0x51
function chooseanimmovetype( asmname, statename, params )
{
    demeanor = asm::asm_getdemeanor();
    
    if ( !asm::asm_hasalias( statename, demeanor ) )
    {
        return asm::asm_chooseanim( asmname, statename, params );
    }
    
    return asm::asm_lookupanimfromalias( statename, demeanor );
}

// Namespace utility
// Params 4
// Checksum 0x49ad22e7, Offset: 0x2ae9
// Size: 0x2d
function transition_isflashed( asmname, statename, tostatename, params )
{
    return isflashed();
}

// Namespace utility
// Params 4
// Checksum 0x49ad22e7, Offset: 0x2b1f
// Size: 0x2d
function transition_isstunned( asmname, statename, tostatename, params )
{
    return isstunned();
}

// Namespace utility
// Params 4
// Checksum 0x8d8b05fb, Offset: 0x2b55
// Size: 0x49, Type: bool
function transition_isburning( asmname, statename, tostatename, params )
{
    return isdefined( self._blackboard.isburning ) && !self.damageshield;
}

// Namespace utility
// Params 4
// Checksum 0xc5a75100, Offset: 0x2ba7
// Size: 0x49, Type: bool
function function_8828553afce5cdc2( asmname, statename, tostatename, params )
{
    return self.damagemod == "MOD_EXPLOSIVE" || self.damagemod == "MOD_PROJECTILE_SPLASH";
}

// Namespace utility
// Params 4
// Checksum 0x2b7ef085, Offset: 0x2bf9
// Size: 0x5a, Type: bool
function function_7fe3c3e1a625f264( asmname, statename, tostatename, params )
{
    return isdefined( self._blackboard.lastpopuptime ) && gettime() - self._blackboard.lastpopuptime < 100;
}

// Namespace utility
// Params 4
// Checksum 0x766cfd4b, Offset: 0x2c5c
// Size: 0x5e, Type: bool
function shouldreacttolight( asmname, statename, tostatename, params )
{
    if ( self.lightreaction_requesttime >= gettime() - 1000 )
    {
        archetype = self getbasearchetype();
        
        if ( isspeedwithincqbrange( self, self aigetdesiredspeed() ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0xbfd2dde4, Offset: 0x2cc3
// Size: 0x149
function chooselightreactionanim( asmname, statename, params )
{
    direction = "center";
    
    if ( !isdefined( self.lightreaction_lightorigin ) )
    {
        return asm::asm_lookupanimfromalias( statename, direction );
    }
    
    if ( isdefined( self.covernode ) )
    {
        myright = anglestoright( self.covernode.angles );
        myforward = anglestoforward( self.covernode.angles );
        var_39cb8627be6360db = vectornormalize( self.lightreaction_lightorigin - self.origin );
    }
    else
    {
        myright = anglestoright( self.angles );
        myforward = anglestoforward( self.angles );
        var_39cb8627be6360db = vectornormalize( self.lightreaction_lightorigin - self.origin );
    }
    
    var_405ab2f68700ab94 = vectordot( myright, var_39cb8627be6360db ) >= 0;
    var_33d3b0d6d0363ef3 = vectordot( myforward, var_39cb8627be6360db );
    
    if ( var_33d3b0d6d0363ef3 >= 0.866 )
    {
        direction = "center";
    }
    else if ( var_405ab2f68700ab94 )
    {
        direction = "right";
    }
    else
    {
        direction = "left";
    }
    
    return asm::asm_lookupanimfromalias( statename, direction );
}

// Namespace utility
// Params 4
// Checksum 0xefdea844, Offset: 0x2e15
// Size: 0x130, Type: bool
function isshocked( asmname, currentstate, transitiontostate, params )
{
    if ( self.damagemod == "MOD_ELEMENTAL_ELEC" )
    {
        return true;
    }
    
    if ( self.damagemod == "MOD_IMPACT" )
    {
        return false;
    }
    
    if ( !isdefined( level.empweapon ) )
    {
        level.empweapon = makeweapon( "emp" );
    }
    
    if ( !isnullweapon( level.empweapon ) && isdamageweapon( level.empweapon ) )
    {
        return true;
    }
    
    if ( getdvarint( @"hash_7082b8028e0e3576", 0 ) == 1 )
    {
        if ( self.unittype == "c6" || self.unittype == "c8" )
        {
            if ( isdamageweapon( makeweapon( "iw7_sonic" ) ) && isweaponepic( self.damageweapon ) )
            {
                return true;
            }
        }
        
        if ( isdamageweapon( makeweapon( "iw7_atomizer" ) ) && self.damagemod != "MOD_MELEE" && self.health <= 0 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x45b090f, Offset: 0x2f4e
// Size: 0x93
function getdamagedirstring()
{
    damagedir = -1 * self.damagedir;
    facingdir = anglestoforward( self.angles );
    dot = vectordot( facingdir, damagedir );
    
    if ( dot > 0.707 )
    {
        return "front";
    }
    
    if ( dot < -0.707 )
    {
        return "back";
    }
    
    cross = vectorcross( facingdir, damagedir );
    
    if ( cross[ 2 ] > 0 )
    {
        return "left";
    }
    
    return "right";
}

// Namespace utility
// Params 0
// Checksum 0x1d90ed23, Offset: 0x2fe9
// Size: 0x51, Type: bool
function gethumandamagedirstring()
{
    damagedir = -1 * self.damagedir;
    facingdir = anglestoforward( self.angles );
    dot = vectordot( facingdir, damagedir );
    
    if ( dot < -0.5 )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x211767c6, Offset: 0x3043
// Size: 0x33
function playanimandusegoalweight( asmname, statename, params )
{
    self setuseanimgoalweight( 0.2 );
    asm::asm_playanimstate( asmname, statename );
}

// Namespace utility
// Params 3
// Checksum 0x1c451afa, Offset: 0x307e
// Size: 0x78
function animscriptedaction_terminate( asmname, statename, params )
{
    self orientmode( "face angle 3d", self.angles );
    self.gunposeoverride_internal = undefined;
    
    if ( isdefined( self.lookatatrnode ) )
    {
        headlook_graft_node = asm::asm_getheadlookknobifexists();
        
        if ( isdefined( headlook_graft_node ) )
        {
            self clearanim( headlook_graft_node, 0.2 );
            self.lookatatrnode = undefined;
        }
    }
}

// Namespace utility
// Params 3
// Checksum 0x69f2e3e9, Offset: 0x30fe
// Size: 0x2c
function function_775d70d993b5f498( asmname, statename, params )
{
    self clearoverridearchetype( "animscript", 0, 1 );
}

// Namespace utility
// Params 3
// Checksum 0x22bd6124, Offset: 0x3132
// Size: 0x63
function animsriptedactioncivilian_terminate( asmname, statename, params )
{
    if ( isdefined( self.lookatatrnode ) )
    {
        headlook_graft_node = asm::asm_getheadlookknobifexists();
        
        if ( isdefined( headlook_graft_node ) )
        {
            self clearanim( headlook_graft_node, 0.2, self.lookatatrnode );
            self.lookatatrnode = undefined;
        }
    }
}

// Namespace utility
// Params 0
// Checksum 0x353f8fa6, Offset: 0x319d
// Size: 0x13
function cleanupanimscriptedheadlook()
{
    self.ht_on = undefined;
    lookatentity();
}

// Namespace utility
// Params 3
// Checksum 0x28a68e5e, Offset: 0x31b8
// Size: 0x2e
function animscriptedstartup( asmname, statename, params )
{
    self.ht_on = undefined;
    self stoplookat();
}

// Namespace utility
// Params 3
// Checksum 0xbfcf51de, Offset: 0x31ee
// Size: 0x30
function animscriptedcleanup( asmname, statename, params )
{
    cleanupanimscriptedheadlook();
    self aisettargetspeed( self aigetdesiredspeed() );
}

// Namespace utility
// Params 3
// Checksum 0xaa31311e, Offset: 0x3226
// Size: 0x25
function animscriptedaction_cleanup( asmname, statename, params )
{
    cleanupanimscriptedheadlook();
}

// Namespace utility
// Params 1
// Checksum 0xad07b91b, Offset: 0x3253
// Size: 0x88
function disabledefaultfacialanims( bdisable )
{
    if ( !isdefined( self.headknob ) )
    {
        self.headknob = asm::asm_getxanim( "knobs", asm::asm_lookupanimfromalias( "knobs", "head" ) );
    }
    
    if ( !isdefined( bdisable ) || bdisable )
    {
        setfacialstate( "animscripted" );
        
        if ( isai( self ) )
        {
            self setfacialindex( "none" );
        }
        else
        {
            setfacialindexfornonai( "none" );
        }
        
        return;
    }
    
    clearfacialstate( "animscripted" );
}

// Namespace utility
// Params 1
// Checksum 0xab89b32a, Offset: 0x32e3
// Size: 0x150
function setfacialindexfornonai( state )
{
    states = [];
    states[ "none" ] = 0;
    states[ "idle" ] = 1;
    states[ "aim" ] = 2;
    states[ "run" ] = 3;
    states[ "pain" ] = 4;
    states[ "death" ] = 5;
    states[ "talk_lg" ] = 6;
    states[ "talk_md" ] = 7;
    states[ "talk_sm" ] = 8;
    states[ "happy" ] = 9;
    states[ "cheer" ] = 10;
    states[ "scared" ] = 11;
    states[ "angry" ] = 12;
    states[ "gas_death" ] = 13;
    assert( isdefined( states[ state ] ), "<dev string:xe2>" + state );
    assert( !isai( self ) );
    assert( issp() );
    self setcustomnodegameparameter( "animtime", self getentitynumber() );
    self setcustomnodegameparameterbyte( "facialindex", states[ state ] );
    facialknob = asm::asm_lookupanimfromalias( "knobs", "head" );
    
    if ( state == "none" )
    {
        self clearanim( asm::asm_getxanim( "knobs", facialknob ), 0.2 );
        return;
    }
    
    self setanim( asm::asm_getxanim( "knobs", facialknob ), 1, 0.2, 1 );
}

// Namespace utility
// Params 1
// Checksum 0x22c54c8f, Offset: 0x343b
// Size: 0xb0
function function_be1ba362de53a104( state )
{
    if ( state == "none" )
    {
        facialknob = asm::asm_lookupanimfromalias( "knobs", "head_fakeactor" );
        self clearanim( asm::asm_getxanim( "knobs", facialknob ), 0.2 );
        return;
    }
    
    facialanimid = asm::asm_lookupanimfromalias( "facial_animation_fakeactor", state );
    
    if ( !isdefined( facialanimid ) )
    {
        iprintln( "Missing facial: " + self.animsetname + " " + state );
    }
    
    facialxanim = asm::asm_getxanim( "facial_animation_fakeactor", facialanimid );
    self setanimknob( facialxanim, 1, 0.2 );
}

// Namespace utility
// Params 1
// Checksum 0xe26ccadc, Offset: 0x34f3
// Size: 0x17
function setfacialstate( state )
{
    self.facialstate = state;
}

// Namespace utility
// Params 1
// Checksum 0x73b34511, Offset: 0x3512
// Size: 0x2e
function clearfacialstate( state )
{
    self.facialstate = "asm";
    
    if ( !self.fakeactor_face_anim )
    {
        asm::asm_restorefacialanim();
    }
}

// Namespace utility
// Params 1
// Checksum 0x875038d, Offset: 0x3548
// Size: 0x9d, Type: bool
function isfacialstateallowed( state )
{
    if ( !isai( self ) && !self.fakeactor_face_anim )
    {
        return false;
    }
    
    if ( !isdefined( self.facialstate ) )
    {
        self.facialstate = "asm";
    }
    
    priorities = [];
    priorities[ "asm" ] = 0;
    priorities[ "filler" ] = 1;
    priorities[ "animscripted" ] = 2;
    assert( isdefined( priorities[ state ] ), "<dev string:xff>" + state + "<dev string:x115>" );
    
    if ( priorities[ state ] >= priorities[ self.facialstate ] )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0xe8cfc072, Offset: 0x35ee
// Size: 0x18
function decrementbulletsinclip()
{
    if ( self.bulletsinclip )
    {
        self.bulletsinclip--;
    }
}

// Namespace utility
// Params 2
// Checksum 0xf0a94808, Offset: 0x360e
// Size: 0xcc
function melee_checktimer( unittype, checkplayer )
{
    /#
        if ( getdvarint( @"hash_a36b45ede9e79a0a", 0 ) == 1 )
        {
            return 1;
        }
    #/
    
    if ( isdefined( self.meleeignoretimer ) && self.meleeignoretimer )
    {
        return 1;
    }
    
    if ( !isdefined( checkplayer ) )
    {
        checkplayer = 0;
    }
    
    if ( checkplayer )
    {
        if ( !isdefined( anim.meleechargeplayertimers ) )
        {
            return 1;
        }
        
        if ( !isdefined( anim.meleechargeplayertimers[ unittype ] ) )
        {
            return 1;
        }
        
        return ( gettime() > anim.meleechargeplayertimers[ unittype ] );
    }
    
    if ( !isdefined( anim.meleechargetimers ) )
    {
        return 1;
    }
    
    if ( !isdefined( anim.meleechargetimers[ unittype ] ) )
    {
        return 1;
    }
    
    return gettime() > anim.meleechargetimers[ unittype ];
}

// Namespace utility
// Params 0
// Checksum 0x28ef0527, Offset: 0x36e2
// Size: 0x1f5
function setupsoldierdefaults()
{
    curtime = gettime();
    self.laserenabled = 0;
    self.primaryweapon = self.weapon;
    self.agentname = &"mp/hostile_soldier";
    
    if ( level.gametype == "gwtdm" )
    {
        self.agentname = &"mp/gwtdm_soldier";
    }
    
    self.currentpose = "stand";
    self.a.movement = "stop";
    self.dropweapon = 1;
    self.minexposedgrenadedist = 750;
    isally = 0;
    
    if ( issp() )
    {
        isally = !self isbadguy();
    }
    
    self.a.lastenemytime = curtime;
    self.a.paintime = 0;
    self.reacttobulletchance = 0.8;
    self._animactive = 0;
    self._lastanimtime = 0;
    self.misstime = 0;
    self.a.nodeath = 0;
    self.misstime = 0;
    self.misstimedebounce = 0;
    self.a.disablepain = 0;
    self.battlechatter = spawnstruct();
    
    if ( !issp() )
    {
        callback::add( #"on_ai_killed", &battlechatter::function_5efbf583e218d4f3 );
    }
    
    self.chatinitialized = 0;
    setfacialstate( "asm" );
    self.speedscalemult = 0.85 + randomfloat( 0.3 );
    self.script_forcegrenade = 0;
    self.lastenemysighttime = 0;
    self.combattime = 0;
    self.suppressed = 0;
    self.suppressedtime = 0;
    self.ammocheatinterval = 8000;
    self.ammocheattime = 0;
}

// Namespace utility
// Params 3
// Checksum 0x92d2705d, Offset: 0x38df
// Size: 0x96
function getspeedmatchanimrate( xanim, samplestart, sampleend )
{
    assert( samplestart < sampleend );
    currentspeed = length( self.velocity );
    
    if ( currentspeed < 1 )
    {
        return 1;
    }
    
    animdist = length( getmovedelta( xanim, samplestart, sampleend ) );
    
    if ( animdist < 1 )
    {
        return 1;
    }
    
    animtime = getanimlength( xanim ) * ( sampleend - samplestart );
    animspeed = animdist / animtime;
    return currentspeed / animspeed;
}

// Namespace utility
// Params 0
// Checksum 0x2374b327, Offset: 0x397e
// Size: 0x24, Type: bool
function isentasoldier()
{
    return self.unittype == "soldier" || self.unittype == "juggernaut";
}

// Namespace utility
// Params 0
// Checksum 0x5569b035, Offset: 0x39ab
// Size: 0x24, Type: bool
function isentnotabomber()
{
    return self.asmname != "suicidebomber" && self.asmname != "suicidebomber_cp";
}

// Namespace utility
// Params 0
// Checksum 0xf7aaa9d9, Offset: 0x39d8
// Size: 0x1c, Type: bool
function demeanorhasblendspace()
{
    demeanor = asm::asm_getdemeanor();
    return demeanor == "combat";
}

// Namespace utility
// Params 0
// Checksum 0xf7d2bd7b, Offset: 0x39fd
// Size: 0x57, Type: bool
function isfixednodeinbadplaceandshouldcrouch()
{
    if ( self.fixednode && !isdefined( self.node ) && isdefined( self.color_node ) && self isnodeinbadplace( self.color_node ) && self.color_node doesnodeallowstance( "crouch" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x15d972b2, Offset: 0x3a5d
// Size: 0x284
function gethighestallowedstance()
{
    nodeshighestallowedstance = undefined;
    var_fa2135ec734a4a86 = 1;
    var_ebcfdf4938081ab8 = 1;
    var_b3b80406a926c3e0 = 1;
    
    if ( isdefined( self.node ) && isatcovernode() )
    {
        var_fa2135ec734a4a86 = self.node doesnodeallowstance( "stand" );
        var_ebcfdf4938081ab8 = self.node doesnodeallowstance( "crouch" );
        var_b3b80406a926c3e0 = self.node doesnodeallowstance( "prone" );
    }
    else if ( !asm_bb::bb_moverequested() && self._blackboard.shootparams_valid && isdefined( self._blackboard.shootparams_pos ) )
    {
        bcancrouch = self isstanceallowed( "crouch" );
        
        if ( bcancrouch && isfixednodeinbadplaceandshouldcrouch() )
        {
            return "crouch";
        }
        
        var_8d0e7f6a9007833c = distancesquared( self.origin, self._blackboard.shootparams_pos );
        
        if ( var_8d0e7f6a9007833c > 262144 && bcancrouch && !actor_is3d() && !utility_common::isusingsidearm() )
        {
            bcancrouch = 1;
            
            if ( isdefined( self.node ) && distancesquared( self.origin, self.node.origin ) < 16 && !self.node doesnodeallowstance( "crouch" ) )
            {
                bcancrouch = abs( angleclamp180( self.node.angles[ 1 ] - self.angles[ 1 ] ) ) > 90;
            }
            
            if ( bcancrouch )
            {
                if ( sighttracepassed( self.origin + ( 0, 0, 32 ), self._blackboard.shootparams_pos, 0, undefined ) )
                {
                    return "crouch";
                }
            }
        }
    }
    
    while ( true )
    {
        if ( self isstanceallowed( "stand" ) && var_fa2135ec734a4a86 )
        {
            return "stand";
        }
        
        if ( self isstanceallowed( "crouch" ) && var_ebcfdf4938081ab8 )
        {
            return "crouch";
        }
        
        if ( self isstanceallowed( "prone" ) && var_b3b80406a926c3e0 )
        {
            return "prone";
        }
        
        if ( !var_fa2135ec734a4a86 || !var_ebcfdf4938081ab8 || !var_b3b80406a926c3e0 )
        {
            var_fa2135ec734a4a86 = 1;
            var_ebcfdf4938081ab8 = 1;
            var_b3b80406a926c3e0 = 1;
            continue;
        }
        
        break;
    }
    
    assertmsg( "<dev string:x124>" );
    return "crouch";
}

// Namespace utility
// Params 0
// Checksum 0xfc711dea, Offset: 0x3cea
// Size: 0x157
function determinerequestedstance()
{
    higheststance = gethighestallowedstance();
    requestedstance = asm_bb::bb_getrequestedstance();
    stances = [];
    stances[ "prone" ] = 0;
    stances[ "crouch" ] = 1;
    stances[ "stand" ] = 2;
    demeanor = self getdemeanor();
    
    if ( isdefined( self.pathgoalpos ) && distance2dsquared( self.pathgoalpos, self.origin ) > 1 )
    {
        requestedstance = "stand";
    }
    
    if ( self._blackboard.bgrenadereturnthrow )
    {
        requestedstance = "stand";
    }
    
    if ( !isdefined( higheststance ) )
    {
        higheststance = requestedstance;
    }
    
    if ( demeanor == "casual" || demeanor == "casual_gun" )
    {
        requestedstance = "stand";
    }
    else if ( higheststance == "prone" && self.unittype == "c6" )
    {
        requestedstance = "crouch";
    }
    else if ( stances[ higheststance ] < stances[ requestedstance ] )
    {
        requestedstance = higheststance;
    }
    else if ( requestedstance == "prone" && higheststance != requestedstance )
    {
        requestedstance = higheststance;
    }
    else if ( requestedstance == "crouch" && stances[ higheststance ] > stances[ "crouch" ] )
    {
        if ( asm_bb::bb_isinbadcrouchspot() )
        {
            requestedstance = "stand";
        }
    }
    
    return requestedstance;
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0x37666d0e, Offset: 0x3e4a
    // Size: 0x57, Type: dev
    function function_2cb8edccdc4bb0b4( archetype )
    {
        if ( isagent( self ) )
        {
            return 1;
        }
        
        if ( !isdefined( level.var_35e2095babf7f4ed ) )
        {
            level.var_35e2095babf7f4ed = [];
        }
        
        if ( !isdefined( level.var_35e2095babf7f4ed[ archetype ] ) )
        {
            level.var_35e2095babf7f4ed[ archetype ] = 1;
            return 0;
        }
        
        return 1;
    }

    // Namespace utility
    // Params 4
    // Checksum 0x82daff3b, Offset: 0x3ea9
    // Size: 0x75, Type: dev
    function function_393f7331e6b5ac05( asmname, statename, xanim, note )
    {
        if ( !animhasnotetrack( xanim, note ) )
        {
            print( "<dev string:x170>" + note + "<dev string:x1bb>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
            level.var_1ca285a952c278f7 = 0;
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0xdf47eb3b, Offset: 0x3f26
    // Size: 0x74, Type: dev
    function function_a9bed088bb4f6076( asmname, statename, xanim, note )
    {
        if ( animhasnotetrack( xanim, note ) )
        {
            print( "<dev string:x1e4>" + note + "<dev string:x1bb>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
            level.var_1ca285a952c278f7 = 0;
        }
    }

    // Namespace utility
    // Params 5
    // Checksum 0x2b04f2fd, Offset: 0x3fa2
    // Size: 0xaa, Type: dev
    function function_710a0a5fefb10457( asmname, statename, xanim, note1, note2 )
    {
        if ( !animhasnotetrack( xanim, note1 ) || !animhasnotetrack( xanim, note2 ) )
        {
            return;
        }
        
        if ( getnotetracktimes( xanim, note1 )[ 0 ] >= getnotetracktimes( xanim, note2 )[ 0 ] )
        {
            print( "<dev string:x22f>" + note1 + "<dev string:x272>" + note2 + "<dev string:x1bb>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
            level.var_1ca285a952c278f7 = 0;
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0x947ca8e1, Offset: 0x4054
    // Size: 0xa0, Type: dev
    function function_bd19a17173b34749( asmname, statename, xanim, min_translation )
    {
        movedelta = getmovedelta( xanim );
        d = length( movedelta );
        
        if ( d < min_translation )
        {
            println( "<dev string:x28d>" + min_translation + "<dev string:x2e1>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x303>" );
            level.var_1ca285a952c278f7 = 0;
            println( "<dev string:x308>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x30d>" + d );
        }
    }

    // Namespace utility
    // Params 4
    // Checksum 0x412d6cf8, Offset: 0x40fc
    // Size: 0x1d5, Type: dev
    function function_81d9475a428b1367( asmname, statename, xanim, max_translation )
    {
        stop_time = 1;
        
        if ( animhasnotetrack( xanim, "<dev string:x31c>" ) || animhasnotetrack( xanim, "<dev string:x329>" ) )
        {
            var_5b2d16c12b1ff57f = getnotetracktimes( xanim, "<dev string:x31c>" );
            
            foreach ( note in var_5b2d16c12b1ff57f )
            {
                stop_time = min( stop_time, note );
            }
            
            finish_notes = getnotetracktimes( xanim, "<dev string:x329>" );
            
            foreach ( note in finish_notes )
            {
                stop_time = min( stop_time, note );
            }
        }
        
        movedelta = getmovedelta( xanim, 0, stop_time );
        d = length( movedelta );
        
        if ( d > max_translation )
        {
            println( "<dev string:x333>" + max_translation + "<dev string:x2e1>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x303>" );
            level.var_1ca285a952c278f7 = 0;
            println( "<dev string:x308>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x30d>" + d );
        }
    }

    // Namespace utility
    // Params 5
    // Checksum 0x1d46e943, Offset: 0x42d9
    // Size: 0x1e5, Type: dev
    function function_275d4cec10fb9a2e( asmname, statename, xanim, notetrack, max_translation )
    {
        stop_time = 1;
        
        if ( animhasnotetrack( xanim, "<dev string:x31c>" ) )
        {
            var_5b2d16c12b1ff57f = getnotetracktimes( xanim, "<dev string:x31c>" );
            
            if ( var_5b2d16c12b1ff57f.size != 1 )
            {
                println( "<dev string:x386>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x3d2>" + getxhashsourcename( getanimname( xanim ) ) );
            }
            
            stop_time = var_5b2d16c12b1ff57f[ 0 ];
        }
        
        if ( animhasnotetrack( xanim, "<dev string:x329>" ) )
        {
            finish_notes = getnotetracktimes( xanim, "<dev string:x329>" );
            
            if ( finish_notes.size != 1 )
            {
                println( "<dev string:x3d8>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x3d2>" + getxhashsourcename( getanimname( xanim ) ) );
            }
            
            stop_time = min( stop_time, finish_notes[ 0 ] );
        }
        
        start_time = 0;
        
        if ( animhasnotetrack( xanim, notetrack ) )
        {
            notes = getnotetracktimes( xanim, notetrack );
            
            if ( notes.size != 1 )
            {
                println( "<dev string:x421>" + notetrack + "<dev string:x454>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x3d2>" + getxhashsourcename( getanimname( xanim ) ) );
            }
            
            start_time = notes[ 0 ];
        }
        else
        {
            return;
        }
        
        movedelta = getmovedelta( xanim, start_time, stop_time );
        d = length( movedelta );
        
        if ( d > max_translation )
        {
            println( "<dev string:x468>" + max_translation + "<dev string:x4cb>" + notetrack + "<dev string:x4e2>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x303>" );
            level.var_1ca285a952c278f7 = 0;
            println( "<dev string:x308>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x30d>" + d );
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xb086056d, Offset: 0x44c6
    // Size: 0xb2, Type: dev
    function validator_notetrack( asmname, statename, note )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        xanims = asm::asm_getallanimsforstate( statename );
        
        foreach ( xanim in xanims )
        {
            function_393f7331e6b5ac05( asmname, statename, xanim, note );
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xe7d96519, Offset: 0x4580
    // Size: 0xb5, Type: dev
    function function_a7c0ec1fb983ea65( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        xanims = asm::asm_getallanimsforstate( statename );
        
        foreach ( xanim in xanims )
        {
            function_81d9475a428b1367( asmname, statename, xanim, 0.1 );
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x143778e0, Offset: 0x463d
    // Size: 0xc0, Type: dev
    function function_a92f7f2ecd3eadf4( asmname, statename, tolerance )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        if ( !isdefined( tolerance ) )
        {
            tolerance = 8;
        }
        
        xanims = asm::asm_getallanimsforstate( statename );
        
        foreach ( xanim in xanims )
        {
            function_bd19a17173b34749( asmname, statename, xanim, tolerance );
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xca16b054, Offset: 0x4705
    // Size: 0x168, Type: dev
    function function_dbc8952d55cc766b( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        tolerance = 0.1;
        samplefrac = 0.1;
        xanims = asm::asm_getallanimsforstate( statename );
        
        foreach ( xanim in xanims )
        {
            t = 0;
            
            while ( t < 1 )
            {
                t = min( t + samplefrac, 1 );
                movedelta = getmovedelta( xanim, 0, t );
                d = length( movedelta );
                
                if ( d > tolerance )
                {
                    println( "<dev string:x4f7>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x53e>" + tolerance + "<dev string:x303>" );
                    level.var_1ca285a952c278f7 = 0;
                    println( "<dev string:x308>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x30d>" + d + "<dev string:x54d>" + t );
                    break;
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x597a33a1, Offset: 0x4875
    // Size: 0x304, Type: dev
    function function_ddd688e678904250( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        if ( !isdefined( aliases ) )
        {
            println( "<dev string:x55a>" + self.animsetname + "<dev string:x2f8>" + statename + "<dev string:x303>" );
            return;
        }
        
        foreach ( alias in aliases )
        {
            var_78d95b70698a5d7e = undefined;
            
            if ( issubstr( alias, "<dev string:x595>" ) )
            {
                var_78d95b70698a5d7e = 1;
            }
            else if ( issubstr( alias, "<dev string:x59a>" ) )
            {
                var_78d95b70698a5d7e = 2;
            }
            else if ( issubstr( alias, "<dev string:x59f>" ) )
            {
                var_78d95b70698a5d7e = 3;
            }
            else if ( issubstr( alias, "<dev string:x5a4>" ) )
            {
                var_78d95b70698a5d7e = 4;
            }
            else if ( issubstr( alias, "<dev string:x5a9>" ) )
            {
                var_78d95b70698a5d7e = 5;
            }
            else if ( issubstr( alias, "<dev string:x5ae>" ) )
            {
                var_78d95b70698a5d7e = 6;
            }
            
            if ( isdefined( var_78d95b70698a5d7e ) )
            {
                organims = archetypegetalias( arc, statename, alias, 0 );
                redanims = archetypegetalias( arc, statename, alias, 1 );
                
                if ( isarray( organims.anims ) )
                {
                    anims = organims.anims;
                }
                else
                {
                    anims = [ organims.anims ];
                }
                
                if ( isarray( redanims.anims ) )
                {
                    redanims = redanims.anims;
                }
                else
                {
                    redanims = [ redanims.anims ];
                }
                
                xanims = arraycombineunique( anims, redanims );
                
                foreach ( xanim in xanims )
                {
                    shoottimes = getnotetracktimes( xanim, "<dev string:x5b3>" );
                    
                    if ( shoottimes.size < var_78d95b70698a5d7e )
                    {
                        println( "<dev string:x5bb>" + asmname + "<dev string:x2f8>" + statename + "<dev string:x303>" );
                        level.var_1ca285a952c278f7 = 0;
                        println( "<dev string:x601>" + alias + "<dev string:x60b>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x610>" + shoottimes.size + "<dev string:x61e>" + var_78d95b70698a5d7e );
                    }
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xa3ba161f, Offset: 0x4b81
    // Size: 0x21, Type: dev
    function function_3903e4ad3829bfc4( asmname, statename, params )
    {
        
    }

    // Namespace utility
    // Params 3
    // Checksum 0xf7b05764, Offset: 0x4baa
    // Size: 0x21, Type: dev
    function function_c0baa6d505a63f89( asmname, statename, params )
    {
        
    }

    // Namespace utility
    // Params 4
    // Checksum 0x3a1026c8, Offset: 0x4bd3
    // Size: 0xb1, Type: dev
    function function_34d560eadba55670( asmname, statename, alias, xanim )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        if ( issubstr( statename, "<dev string:x642>" ) && ( issubstr( alias, "<dev string:x64a>" ) || issubstr( alias, "<dev string:x64f>" ) ) || issubstr( statename, "<dev string:x654>" ) && ( issubstr( alias, "<dev string:x65d>" ) || issubstr( alias, "<dev string:x64f>" ) ) )
        {
            function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x662>" );
            function_710a0a5fefb10457( asmname, statename, xanim, "<dev string:x662>", "<dev string:x31c>" );
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x2869a555, Offset: 0x4c8c
    // Size: 0x1bd, Type: dev
    function validator_arrival( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_34d560eadba55670( asmname, statename, alias, xanim );
                    function_81d9475a428b1367( asmname, statename, xanim, 85 );
                    function_bd19a17173b34749( asmname, statename, xanim, 16 );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x677>" );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x68a>" );
                    function_275d4cec10fb9a2e( asmname, statename, xanim, "<dev string:x69b>", 1 );
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x5106fa95, Offset: 0x4e51
    // Size: 0x1d8, Type: dev
    function function_ee092fcbb5ef76f8( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_34d560eadba55670( asmname, statename, alias, xanim );
                    function_81d9475a428b1367( asmname, statename, xanim, 85 );
                    function_bd19a17173b34749( asmname, statename, xanim, 16 );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x677>" );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x68a>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x6ab>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x6b8>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x6ce>" );
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x11b9b7b7, Offset: 0x5031
    // Size: 0x235, Type: dev
    function function_1ce7df1dd6da4a59( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        pistol_pickup = "<dev string:x6e2>";
        var_b1e84382e568ba0c = "<dev string:x6f3>";
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    if ( !animhasnotetrack( xanim, "<dev string:x70b>" ) && !animhasnotetrack( xanim, "<dev string:x719>" ) && !animhasnotetrack( xanim, "<dev string:x728>" ) )
                    {
                        print( "<dev string:x73a>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
                        level.var_1ca285a952c278f7 = 0;
                    }
                    
                    if ( !animhasnotetrack( xanim, "<dev string:x6e2>" ) && !animhasnotetrack( xanim, "<dev string:x6f3>" ) )
                    {
                        print( "<dev string:x7d1>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
                        level.var_1ca285a952c278f7 = 0;
                    }
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x6c432ba3, Offset: 0x526e
    // Size: 0x1dd, Type: dev
    function validator_exit( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_34d560eadba55670( asmname, statename, alias, xanim );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x31c>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x329>" );
                    function_710a0a5fefb10457( asmname, statename, xanim, "<dev string:x31c>", "<dev string:x329>" );
                    function_81d9475a428b1367( asmname, statename, xanim, 65 );
                    function_bd19a17173b34749( asmname, statename, xanim, 8 );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x6b8>" );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x6ce>" );
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xe4700f6e, Offset: 0x5453
    // Size: 0x252, Type: dev
    function validator_death( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x866>" );
                    
                    if ( animhasnotetrack( xanim, "<dev string:x866>" ) )
                    {
                        var_8e5cf6465246b709 = 0.05 / max( getanimlength( xanim ), 0.05 );
                        ragdoll_times = getnotetracktimes( xanim, "<dev string:x866>" );
                        
                        foreach ( note in ragdoll_times )
                        {
                            if ( note > var_8e5cf6465246b709 )
                            {
                                print( "<dev string:x877>" + asmname + "<dev string:x1c7>" + statename + "<dev string:x1d3>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x1de>" );
                                level.var_1ca285a952c278f7 = 0;
                            }
                        }
                    }
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x968e0949, Offset: 0x56ad
    // Size: 0x1e0, Type: dev
    function function_5e94da3bc62ea963( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x66c>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x662>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x31c>" );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x329>" );
                    function_710a0a5fefb10457( asmname, statename, xanim, "<dev string:x31c>", "<dev string:x329>" );
                    function_81d9475a428b1367( asmname, statename, xanim, 65 );
                    function_bd19a17173b34749( asmname, statename, xanim, 8 );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x6b8>" );
                    function_a9bed088bb4f6076( asmname, statename, xanim, "<dev string:x6ce>" );
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0x4824b082, Offset: 0x5895
    // Size: 0x196, Type: dev
    function validator_reload( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            if ( issubstr( alias, "<dev string:x8cf>" ) )
            {
                continue;
            }
            
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            var_9889f1d2d37d1bc5 = !issubstr( alias, "<dev string:x8d6>" );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    if ( var_9889f1d2d37d1bc5 )
                    {
                        function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x8e1>" );
                    }
                    
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x6ab>" );
                }
            }
        }
    }

    // Namespace utility
    // Params 3
    // Checksum 0xe23041d1, Offset: 0x5a33
    // Size: 0x172, Type: dev
    function function_1e8ef4f6b4cc0d03( asmname, statename, params )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        assert( isdefined( self.animsetname ) );
        function_a92f7f2ecd3eadf4( asmname, statename, params );
        arc = self.animsetname;
        aliases = archetypegetaliases( arc, statename );
        
        foreach ( alias in aliases )
        {
            anims = asm::asm_getallanimsforalias( arc, statename, alias );
            
            if ( isdefined( anims ) )
            {
                foreach ( xanim in anims )
                {
                    function_34d560eadba55670( asmname, statename, alias, xanim );
                    function_393f7331e6b5ac05( asmname, statename, xanim, "<dev string:x31c>" );
                }
            }
        }
    }

#/

// Namespace utility
// Params 1
// Checksum 0xaf85b64f, Offset: 0x5bad
// Size: 0x53
function mapangleindextonumpad( idx )
{
    mapping = [ 2, 3, 6, 9, 8, 7, 4, 1, 2 ];
    return mapping[ idx ];
}

// Namespace utility
// Params 5
// Checksum 0x1242bff5, Offset: 0x5c09
// Size: 0x94
function toggle_poiauto( shouldenable, yawmin, yawmax, pitchmin, pitchmax )
{
    if ( shouldenable )
    {
        if ( !isdefined( self.poiauto ) )
        {
            poiauto_init( yawmin, yawmax, pitchmin, pitchmax );
            thread poiauto_think();
            ai::set_gunpose( "disable" );
        }
        
        return;
    }
    
    self notify( "poiauto_disable" );
    self.poiauto = undefined;
    self.poiauto_valid = 0;
    ai::set_gunpose( "automatic" );
    self stoplookat();
}

// Namespace utility
// Params 4
// Checksum 0x82ebbc3, Offset: 0x5ca5
// Size: 0x18d
function set_poiauto_constraints( yawmax, yawmin, pitchmin, pitchmax )
{
    assert( isdefined( self.poiauto ) );
    
    if ( !isdefined( self.poiauto.og_yawmax ) )
    {
        self.poiauto.og_yawmax = self.poiauto.yawmax;
    }
    
    if ( !isdefined( self.poiauto.og_yawmin ) )
    {
        self.poiauto.og_yawmin = self.poiauto.yawmin;
    }
    
    if ( !isdefined( self.poiauto.og_pitchmin ) )
    {
        self.poiauto.og_pitchmin = self.poiauto.pitchmin;
    }
    
    if ( !isdefined( self.poiauto.og_pitchmax ) )
    {
        self.poiauto.og_pitchmax = self.poiauto.pitchmax;
    }
    
    self.poiauto.yawmax = yawmax;
    self.poiauto.yawmin = yawmin;
    self.poiauto.pitchmin = pitchmin;
    self.poiauto.pitchmax = pitchmax;
}

// Namespace utility
// Params 0
// Checksum 0xf95e1f19, Offset: 0x5e3a
// Size: 0xe6
function reset_poiauto_constraints()
{
    assert( isdefined( self.og_yawmax ) );
    assert( isdefined( self.og_yawmin ) );
    assert( isdefined( self.og_pitchmin ) );
    assert( isdefined( self.og_pitchmax ) );
    self.poiauto.yawmax = self.poiauto.og_yawmax;
    self.poiauto.yawmin = self.poiauto.og_yawmin;
    self.poiauto.pitchmin = self.poiauto.og_pitchmin;
    self.poiauto.pitchmax = self.poiauto.og_pitchmax;
}

// Namespace utility
// Params 2
// Checksum 0x25a8e1ad, Offset: 0x5f28
// Size: 0x20c
function toggle_poi( shouldenable, firstpoint )
{
    assert( shouldenable == 1 || shouldenable == 0, "<dev string:x8f0>" );
    self.currentpoi = undefined;
    self.nextpoi = undefined;
    self.doingpoi = shouldenable;
    self.disablelookdownpath = shouldenable;
    
    if ( isdefined( self.cqb_point_of_interest ) )
    {
        self.cqb_point_of_interest = undefined;
        self function_e885c7bb61b04474( 0 );
    }
    
    if ( !shouldenable )
    {
        assert( isdefined( level.poi_activeai ), "<dev string:x921>" );
        level.poi_activeai = arrayremove( level.poi_activeai, self );
        self.turnrate = self.poi_oldturnrate ?? self.turnrate;
        self.gunadditiveoverride = undefined;
        self.disablelookdownpath = undefined;
        self._blackboard.forcestrafe = 0;
        self.gunposeoverride = undefined;
        self stoplookat();
        return;
    }
    
    currentspeed = self aigetdesiredspeed();
    archetype = self getbasearchetype();
    var_6e6239dad7a1931b = getanimspeedthreshold( self, "fast" );
    self aisetdesiredspeed( min( currentspeed, var_6e6239dad7a1931b ) );
    
    if ( !isdefined( level.poi_activeai ) )
    {
        level.poi_activeai = [];
    }
    
    level.poi_activeai[ level.poi_activeai.size ] = self;
    
    if ( isdefined( level.fnfindcqbpointsofinterest ) && !level.alreadyfindingpoi )
    {
        level thread [[ level.fnfindcqbpointsofinterest ]]();
        level.alreadyfindingpoi = 1;
    }
    
    assert( !isdefined( firstpoint ) || isstruct( firstpoint ) );
    self.poi_oldturnrate = self.turnrate;
    self.turnrate = 0.25;
    self.leftaimlimit = 90;
    self.rightaimlimit = -90;
    self.poi_firstpoint = firstpoint;
    self.gunposeoverride = "disable";
}

// Namespace utility
// Params 1
// Checksum 0x92b1751b, Offset: 0x613c
// Size: 0x1f
function shouldinitiallyattackfromexposed( node )
{
    return self._blackboard.shouldinitiallyattackfromexposed;
}

// Namespace utility
// Params 2
// Checksum 0x6e6be960, Offset: 0x6164
// Size: 0x1e9
function cover_canattackfromexposed( enemyorigin, node )
{
    assert( isdefined( self.enemy ) );
    
    if ( !isplayer( self.enemy ) && !isai( self.enemy ) )
    {
        return 1;
    }
    
    if ( cover_canattackfromexposedcached() )
    {
        return cover_canattackfromexposedgetcache();
    }
    
    if ( !isdefined( node ) )
    {
        node = self.covernode;
    }
    
    if ( !isdefined( node ) )
    {
        node = self.node;
    }
    
    if ( !isdefined( node ) )
    {
        return 0;
    }
    
    higheststance = gethighestallowedstance();
    zheight = 56;
    
    if ( higheststance != "stand" )
    {
        zheight = 32;
    }
    
    startorigin = node.origin + ( 0, 0, zheight );
    
    if ( !isdefined( enemyorigin ) )
    {
        if ( isai( self.enemy ) && !isbot( self.enemy ) )
        {
            enemyorigin = self.enemy getapproxeyepos();
        }
        else
        {
            enemyorigin = self.enemy geteye();
        }
    }
    
    var_8629d57648719a42 = 1000;
    self._blackboard.canattackfromexposed = sighttracepassed( startorigin, enemyorigin, 0, undefined );
    self._blackboard.canattackfromexposedtime = gettime() + var_8629d57648719a42;
    
    /#
        if ( getdvarint( @"hash_12099888645f099a" ) )
        {
            color = ( 1, 0, 0 );
            
            if ( self._blackboard.canattackfromexposed )
            {
                color = ( 0, 1, 0 );
            }
            
            print3d( startorigin, "<dev string:x95f>", color, 1, 1, 15 );
            line( startorigin, enemyorigin, color, 1, 1, 15 );
        }
    #/
    
    return self._blackboard.canattackfromexposed;
}

// Namespace utility
// Params 0
// Checksum 0xd8d41b3, Offset: 0x6356
// Size: 0x1a, Type: bool
function cover_canattackfromexposedcached()
{
    return self._blackboard.canattackfromexposedtime > gettime();
}

// Namespace utility
// Params 0
// Checksum 0xaa987b73, Offset: 0x6379
// Size: 0x15
function cover_canattackfromexposedgetcache()
{
    return self._blackboard.canattackfromexposed;
}

// Namespace utility
// Params 4
// Checksum 0x6031bf1c, Offset: 0x6397
// Size: 0xc2
function poiauto_init( yawmin, yawmax, pitchmin, pitchmax )
{
    if ( !isdefined( yawmin ) )
    {
        yawmin = 15;
    }
    
    if ( !isdefined( yawmax ) )
    {
        yawmax = 35;
    }
    
    if ( !isdefined( pitchmin ) )
    {
        pitchmin = -20;
    }
    
    if ( !isdefined( pitchmax ) )
    {
        pitchmax = 0;
    }
    
    self.poiauto = spawnstruct();
    self.poiauto.yawmax = yawmax;
    self.poiauto.yawmin = yawmin;
    self.poiauto.pitchmin = pitchmin;
    self.poiauto.pitchmax = pitchmax;
    self.poiauto_valid = 1;
}

// Namespace utility
// Params 0
// Checksum 0xa23b990b, Offset: 0x6461
// Size: 0x14a
function poiauto_think()
{
    self endon( "poiauto_disable" );
    self endon( "death" );
    var_b7de20bb3fb2775c = 500;
    nextaimtimer = 0;
    lastaimtimer = 0;
    var_13836a4164a21acd = gettime() + 30000;
    
    if ( !isdefined( self.poiauto ) )
    {
        poiauto_init();
    }
    
    while ( true )
    {
        secondaim = 0;
        
        if ( var_13836a4164a21acd <= gettime() )
        {
            self.poiauto_angles = ( 0, 0, 0 );
            
            if ( var_13836a4164a21acd == nextaimtimer )
            {
                secondaim = 1;
            }
        }
        
        if ( nextaimtimer <= gettime() )
        {
            var_13836a4164a21acd = gettime() + int( randomfloatrange( 0.8, 1.8 ) * 1000 );
            lastaimtimer = gettime();
            poiauto_setnewaimangle( secondaim );
            var_cb2d73cb9941d9e7 = var_b7de20bb3fb2775c - gettime();
            var_4d69883219d82b58 = var_13836a4164a21acd - gettime();
            
            if ( abs( var_4d69883219d82b58 - var_cb2d73cb9941d9e7 ) >= 550 && cointoss() )
            {
                nextaimtimer = var_13836a4164a21acd;
            }
            else if ( var_cb2d73cb9941d9e7 > 3000 )
            {
                nextaimtimer = gettime() + randomintrange( 2000, 3000 );
            }
            else
            {
                nextaimtimer = gettime() + var_cb2d73cb9941d9e7 + 550 + randomintrange( 1000, 2000 );
            }
        }
        
        waitframe();
    }
}

// Namespace utility
// Params 1
// Checksum 0x62aa3baa, Offset: 0x65b3
// Size: 0x5c
function poiauto_relativeangletopos( angles )
{
    forward = anglestoforward( angles );
    worldforward = rotatevector( forward, self.angles );
    eye = self getapproxeyepos();
    pos = eye + worldforward * 128;
    return pos;
}

// Namespace utility
// Params 0
// Checksum 0x52bfa9c4, Offset: 0x6618
// Size: 0x57
function poiauto_glancerandom()
{
    yaw = randomfloatrange( -45, 45 );
    pitch = randomfloatrange( -20, 20 );
    pos = poiauto_relativeangletopos( ( pitch, yaw, 0 ) );
    self.poiauto_glancing = 1;
    thread poiauto_glanceend();
    self glanceatpos( pos );
}

// Namespace utility
// Params 0
// Checksum 0x68a06b75, Offset: 0x6677
// Size: 0x22
function poiauto_glanceend()
{
    self notify( "poiauto_glanceend" );
    self endon( "poiauto_glanceend" );
    wait 0.55;
    self.poiauto_glancing = 0;
}

// Namespace utility
// Params 0
// Checksum 0x9e517753, Offset: 0x66a1
// Size: 0xc, Type: bool
function poiauto_isglancing()
{
    return istrue( self.poiauto_glancing );
}

// Namespace utility
// Params 1
// Checksum 0x4a88e1c0, Offset: 0x66b6
// Size: 0xf4
function poiauto_setnewaimangle( secondaim )
{
    if ( secondaim )
    {
        yaw = randomfloatrange( self.poiauto_angles[ 1 ] + 5, self.poiauto_angles[ 1 ] + 10 );
        pitch = randomfloatrange( 5, 10 );
        
        if ( cointoss() )
        {
            pitch *= -1;
        }
        
        pitch = self.poiauto_angles[ 0 ] + pitch;
    }
    else
    {
        poiauto = self.poiauto;
        yaw = randomfloatrange( poiauto.yawmin, poiauto.yawmax );
        pitch = randomfloatrange( poiauto.pitchmin, poiauto.pitchmax );
    }
    
    if ( cointoss() )
    {
        yaw *= -1;
    }
    
    self.poiauto_nextangles = ( pitch, yaw, 0 );
    self.poiauto_nextaimtime = randomintrange( 100, 300 ) + gettime();
}

// Namespace utility
// Params 0
// Checksum 0x5f695ca2, Offset: 0x67b2
// Size: 0x37
function function_18bf04f16702b9b2()
{
    arcname = undefined;
    
    if ( isdefined( self.animationarchetype ) )
    {
        arcname = self.animationarchetype;
    }
    else
    {
        arcname = self.animsetname;
    }
    
    return arcname;
}

// Namespace utility
// Params 1
// Checksum 0x9c4b7cf8, Offset: 0x67f2
// Size: 0xc7
function function_bead19f1fd2135a1( range )
{
    if ( !isdefined( range ) )
    {
        range = 1024;
    }
    
    if ( issp() )
    {
        player = level.player;
    }
    else
    {
        [ player ] = sortbydistance( level.players, self.origin );
    }
    
    if ( self isnearanyplayer( range ) )
    {
        lookpoint = player.origin + ( 0, 0, 55 );
    }
    else
    {
        lookpoint = self.origin + ( 0, 0, 55 ) + anglestoforward( self.angles + ( 0, randomintrange( -135, 180 ), 0 ) ) * 300;
    }
    
    return lookpoint;
}

