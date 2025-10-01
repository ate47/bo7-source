#using scripts\asm\asm;
#using scripts\asm\shared\utility;

#namespace asm_bb;

// Namespace asm_bb
// Params 1
// Checksum 0x5115c23, Offset: 0xc0
// Size: 0xd
function bb_getprefixstring( category )
{
    return undefined;
}

// Namespace asm_bb
// Params 1
// Checksum 0x359dcb16, Offset: 0xd6
// Size: 0x22
function bb_requeststance( stance )
{
    self._blackboard.desiredstance = stance;
}

// Namespace asm_bb
// Params 0
// Checksum 0x5e2a8d6a, Offset: 0x100
// Size: 0x15
function bb_getrequestedstance()
{
    return self._blackboard.desiredstance;
}

// Namespace asm_bb
// Params 4
// Checksum 0x8ba28eed, Offset: 0x11e
// Size: 0x3d, Type: bool
function bb_isrequestedstance_refresh( asmname, statename, tostatename, params )
{
    requestedstance = utility::determinerequestedstance();
    return requestedstance == params;
}

// Namespace asm_bb
// Params 4
// Checksum 0xc592acdc, Offset: 0x164
// Size: 0x5b, Type: bool
function bb_isrequestedstanceanddemeanor( asmname, statename, tostatename, params )
{
    assert( params.size == 2 );
    return self._blackboard.desiredstance == params[ 0 ] && asm::asm_getdemeanor() == params[ 1 ];
}

// Namespace asm_bb
// Params 1
// Checksum 0xaebedfc4, Offset: 0x1c8
// Size: 0x1f
function bb_setisincombat( bincombat )
{
    self.bisincombat = !isdefined( bincombat ) || bincombat;
}

// Namespace asm_bb
// Params 4
// Checksum 0x740a8a63, Offset: 0x1ef
// Size: 0x37, Type: bool
function bb_isweaponclass( asmname, statename, tostatename, params )
{
    return weaponclass( self.weapon ) == params;
}

// Namespace asm_bb
// Params 4
// Checksum 0x1b758d52, Offset: 0x22f
// Size: 0x62, Type: bool
function bb_shoulddroprocketlauncher( asmname, statename, tostatename, params )
{
    if ( weaponclass( self.weapon ) != "rocketlauncher" )
    {
        return false;
    }
    
    requestedweapon = bb_getrequestedweapon();
    
    if ( !isdefined( requestedweapon ) )
    {
        return false;
    }
    
    return requestedweapon != "rocketlauncher";
}

// Namespace asm_bb
// Params 0
// Checksum 0xa67d08a9, Offset: 0x29a
// Size: 0x7
function bb_moverequested()
{
    return self codemoverequested();
}

// Namespace asm_bb
// Params 1
// Checksum 0xb77de714, Offset: 0x2aa
// Size: 0x22, Type: bool
function bb_movetyperequested( movetype )
{
    return self._blackboard.movetype == movetype;
}

// Namespace asm_bb
// Params 1
// Checksum 0xb0dad84a, Offset: 0x2d5
// Size: 0x22
function bb_requestmovetype( movetype )
{
    self._blackboard.movetype = movetype;
}

// Namespace asm_bb
// Params 1
// Checksum 0xde532f25, Offset: 0x2ff
// Size: 0x22
function bb_requestweapon( weapon )
{
    self._blackboard.weaponrequest = weapon;
}

// Namespace asm_bb
// Params 0
// Checksum 0xb760bba0, Offset: 0x329
// Size: 0x1b
function bb_clearweaponrequest()
{
    self._blackboard.weaponrequest = "none";
}

// Namespace asm_bb
// Params 0
// Checksum 0xb5e46910, Offset: 0x34c
// Size: 0x33
function bb_getrequestedweapon()
{
    if ( self._blackboard.weaponrequest == "none" )
    {
        return undefined;
    }
    
    return self._blackboard.weaponrequest;
}

// Namespace asm_bb
// Params 0
// Checksum 0xcff7378f, Offset: 0x388
// Size: 0x15
function bb_reloadrequested()
{
    return self._blackboard.breload;
}

// Namespace asm_bb
// Params 0
// Checksum 0xd9546afa, Offset: 0x3a6
// Size: 0x46, Type: bool
function bb_throwgrenaderequested()
{
    if ( isdefined( self._blackboard.bthrowgrenade ) )
    {
        return ( self._blackboard.bthrowgrenade && isdefined( self._blackboard.throwgrenadetarget ) );
    }
    
    return false;
}

// Namespace asm_bb
// Params 0
// Checksum 0x95ac4238, Offset: 0x3f5
// Size: 0x15
function bb_getthrowgrenadetarget()
{
    return self._blackboard.throwgrenadetarget;
}

// Namespace asm_bb
// Params 1
// Checksum 0xfbd82a91, Offset: 0x413
// Size: 0x22
function bb_claimshootparams( taskid )
{
    self._blackboard.shootparams_taskid = taskid;
}

// Namespace asm_bb
// Params 1
// Checksum 0x57cf88f6, Offset: 0x43d
// Size: 0x3d
function bb_updateshootparams_pos( pos )
{
    assert( self._blackboard.shootparams_valid );
    self._blackboard.shootparams_pos = pos;
}

// Namespace asm_bb
// Params 0
// Checksum 0x79f46ec, Offset: 0x482
// Size: 0x33
function bb_getrequestedcoverstate()
{
    if ( !isdefined( self._blackboard.coverstate ) )
    {
        return "none";
    }
    
    return self._blackboard.coverstate;
}

// Namespace asm_bb
// Params 4
// Checksum 0x1ad0197b, Offset: 0x4be
// Size: 0x31, Type: bool
function bb_hadcovernode( asmname, statename, tostatename, params )
{
    return isdefined( self.covernode );
}

// Namespace asm_bb
// Params 0
// Checksum 0x92797884, Offset: 0x4f8
// Size: 0xb
function bb_getcovernode()
{
    return self.covernode;
}

// Namespace asm_bb
// Params 0
// Checksum 0x5e56ad9c, Offset: 0x50c
// Size: 0x2a
function bb_getrequestedturret()
{
    var_7237854e3be197ca = self._blackboard.requestedturret;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
}

// Namespace asm_bb
// Params 1
// Checksum 0x7e82f688, Offset: 0x53e
// Size: 0x22
function bb_requestturret( turret )
{
    self._blackboard.requestedturret = turret;
}

// Namespace asm_bb
// Params 0
// Checksum 0xb2d74bdc, Offset: 0x568
// Size: 0x61
function function_988e0cf7bedac7eb()
{
    if ( isdefined( self._blackboard.var_22f41abfc5a5f544 ) && isdefined( self._blackboard.var_abd24c35bdded560 ) )
    {
        return [ self._blackboard.var_22f41abfc5a5f544, self._blackboard.var_abd24c35bdded560 ];
    }
    
    return undefined;
}

// Namespace asm_bb
// Params 2
// Checksum 0xc163873b, Offset: 0x5d2
// Size: 0x41
function function_d97733fe1476f19e( vehicle, turretindex )
{
    self._blackboard.var_22f41abfc5a5f544 = vehicle;
    self._blackboard.var_abd24c35bdded560 = turretindex;
}

// Namespace asm_bb
// Params 1
// Checksum 0x6e9f77f8, Offset: 0x61b
// Size: 0x5e
function bb_requestturretpose( pose )
{
    assert( !isdefined( pose ) || pose == "<dev string:x24>" || pose == "<dev string:x2d>" || pose == "<dev string:x37>" || pose == "<dev string:x40>" );
    self._blackboard.requestedturretpose = pose;
}

// Namespace asm_bb
// Params 4
// Checksum 0x6c78bc94, Offset: 0x681
// Size: 0x6b, Type: bool
function bb_hasshufflenode( asmname, statename, tostatename, params )
{
    return self._blackboard.shufflenode == self.node && distancesquared( self.node.origin, self.origin ) > 16;
}

// Namespace asm_bb
// Params 0
// Checksum 0x7e532771, Offset: 0x6f5
// Size: 0x18
function bb_setanimscripted()
{
    self._blackboard.animscriptedactive = 1;
}

// Namespace asm_bb
// Params 0
// Checksum 0xfc0ba166, Offset: 0x715
// Size: 0x17
function bb_clearanimscripted()
{
    self._blackboard.animscriptedactive = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0xa6f25fe5, Offset: 0x734
// Size: 0x4b, Type: bool
function bb_isanimscripted()
{
    if ( isdefined( self.script ) )
    {
        if ( self.script == "scripted" || self.script == "<custom>" )
        {
            return true;
        }
    }
    
    return istrue( self._blackboard.animscriptedactive );
}

// Namespace asm_bb
// Params 1
// Checksum 0xf9adfa2f, Offset: 0x788
// Size: 0x4d
function bb_requestmelee( target )
{
    self._blackboard.meleerequested = 1;
    self._blackboard.meleerequestedtarget = target;
    self._blackboard.meleerequestedcomplete = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0x8f112e55, Offset: 0x7dd
// Size: 0x2e
function bb_getmeleetarget()
{
    if ( !self._blackboard.meleerequested )
    {
        return undefined;
    }
    
    return self._blackboard.meleerequestedtarget;
}

// Namespace asm_bb
// Params 0
// Checksum 0xaf31876f, Offset: 0x814
// Size: 0x2a
function bb_clearmeleerequest()
{
    self._blackboard.meleerequested = 0;
    self._blackboard.meleerequestedtarget = undefined;
}

// Namespace asm_bb
// Params 0
// Checksum 0x44474d2c, Offset: 0x846
// Size: 0x15
function bb_clearmeleerequestcomplete()
{
    self._blackboard.meleerequestedcomplete = undefined;
}

// Namespace asm_bb
// Params 4
// Checksum 0x8444ea67, Offset: 0x863
// Size: 0x3b, Type: bool
function bb_meleeinprogress( asmname, statename, tostatename, params )
{
    return isdefined( self._blackboard.meleerequestedcomplete );
}

// Namespace asm_bb
// Params 4
// Checksum 0x5934532d, Offset: 0x8a7
// Size: 0x3a
function bb_meleecomplete( asmname, statename, tostatename, params )
{
    return self._blackboard.meleerequestedcomplete;
}

// Namespace asm_bb
// Params 4
// Checksum 0x2248b7e2, Offset: 0x8ea
// Size: 0x49, Type: bool
function bb_meleerequestinvalid( asmname, statename, tostatename, params )
{
    if ( !self.in_melee )
    {
        return true;
    }
    
    if ( !isdefined( self.meleetarget ) )
    {
        return true;
    }
    
    return false;
}

// Namespace asm_bb
// Params 2
// Checksum 0xbd5a5a0b, Offset: 0x93c
// Size: 0x62
function bb_requestmeleecharge( target, targetpos )
{
    assert( isdefined( targetpos ) );
    self._blackboard.meleerequestedcharge = 1;
    self._blackboard.meleerequestedcharge_target = target;
    self._blackboard.meleerequestedcharge_targetposition = targetpos;
}

// Namespace asm_bb
// Params 0
// Checksum 0xb38d6ee5, Offset: 0x9a6
// Size: 0x3d
function bb_clearmeleechargerequest()
{
    self._blackboard.meleerequestedcharge = 0;
    self._blackboard.meleerequestedcharge_target = undefined;
    self._blackboard.meleerequestedcharge_targetposition = undefined;
}

// Namespace asm_bb
// Params 0
// Checksum 0x24cf9e99, Offset: 0x9eb
// Size: 0x3a, Type: bool
function bb_meleechargerequested()
{
    return isdefined( self._blackboard.meleerequestedcharge ) && isdefined( self.pathgoalpos ) && self._blackboard.meleerequestedcharge;
}

// Namespace asm_bb
// Params 4
// Checksum 0xeb60b94b, Offset: 0xa2e
// Size: 0x34, Type: bool
function bb_meleechargeaborted( asmname, statename, tostatename, params )
{
    if ( bb_meleechargerequested() )
    {
        return false;
    }
    
    return true;
}

// Namespace asm_bb
// Params 0
// Checksum 0xed545c56, Offset: 0xa6b
// Size: 0x47
function bb_getmeleechargetarget()
{
    if ( !isdefined( self._blackboard.meleerequestedcharge ) || !self._blackboard.meleerequestedcharge )
    {
        return undefined;
    }
    
    return self._blackboard.meleerequestedcharge_target;
}

// Namespace asm_bb
// Params 0
// Checksum 0x55be2442, Offset: 0xabb
// Size: 0x30
function bb_getmeleechargetargetpos()
{
    assert( self._blackboard.meleerequestedcharge );
    return self._blackboard.meleerequestedcharge_targetposition;
}

// Namespace asm_bb
// Params 0
// Checksum 0xff77f8ed, Offset: 0xaf4
// Size: 0x16, Type: bool
function bb_iswhizbyrequested()
{
    return isdefined( self._blackboard.whizbyeventtime );
}

// Namespace asm_bb
// Params 0
// Checksum 0x6fc0f5a4, Offset: 0xb13
// Size: 0x8
function bb_clearmeleetarget()
{
    self function_a227728f297b8669();
}

// Namespace asm_bb
// Params 1
// Checksum 0x5152d852, Offset: 0xb23
// Size: 0x22
function bb_setisinbadcrouchspot( bbadcrouchspot )
{
    self._blackboard.bbadcrouchspot = bbadcrouchspot;
}

// Namespace asm_bb
// Params 0
// Checksum 0x9aff300b, Offset: 0xb4d
// Size: 0x16, Type: bool
function bb_isinbadcrouchspot()
{
    return istrue( self._blackboard.bbadcrouchspot );
}

// Namespace asm_bb
// Params 1
// Checksum 0xdd0b95e8, Offset: 0xb6c
// Size: 0xc
function bb_setcivilianstate( state )
{
    
}

// Namespace asm_bb
// Params 0
// Checksum 0x4c8e3695, Offset: 0xb80
// Size: 0x7
function bb_getcivilianstate()
{
    return "deprecated";
}

// Namespace asm_bb
// Params 0
// Checksum 0xb16c09b6, Offset: 0xb90
// Size: 0x15
function bb_getcivilianstatetime()
{
    return self._blackboard.civstatetime;
}

// Namespace asm_bb
// Params 1
// Checksum 0x3a2c14f5, Offset: 0xbae
// Size: 0x14
function bb_civilianrequestspeed( speed )
{
    self aisetdesiredspeed( speed );
}

// Namespace asm_bb
// Params 0
// Checksum 0x5c278c97, Offset: 0xbca
// Size: 0x16, Type: bool
function bb_isshort()
{
    return istrue( self._blackboard.bshort );
}

// Namespace asm_bb
// Params 1
// Checksum 0x45362634, Offset: 0xbe9
// Size: 0x22
function bb_setshort( value )
{
    self._blackboard.bshort = value;
}

// Namespace asm_bb
// Params 0
// Checksum 0x2849b55f, Offset: 0xc13
// Size: 0x16, Type: bool
function bb_smartobjectrequested()
{
    return isdefined( self._blackboard.smartobject );
}

// Namespace asm_bb
// Params 1
// Checksum 0x2208da67, Offset: 0xc32
// Size: 0xa1
function bb_requestsmartobject( value )
{
    self._blackboard.smartobject = value;
    
    if ( isdefined( self._blackboard.smartobject ) && isdefined( self._blackboard.smartobject.angles ) )
    {
        self._blackboard.smartobjectvalid = 1;
        self._blackboard.smartobjectangles = self._blackboard.smartobject.angles;
    }
}

// Namespace asm_bb
// Params 0
// Checksum 0x278ca2cb, Offset: 0xcdb
// Size: 0x15
function bb_getrequestedsmartobject()
{
    return self._blackboard.smartobject;
}

// Namespace asm_bb
// Params 0
// Checksum 0x28cd937c, Offset: 0xcf9
// Size: 0x31
function bb_clearsmartobject()
{
    self._blackboard.smartobject = undefined;
    self._blackboard.smartobjectvalid = 0;
    bb_clearplaysmartobject();
}

// Namespace asm_bb
// Params 0
// Checksum 0x96047735, Offset: 0xd32
// Size: 0x34
function bb_requestplaysmartobject()
{
    assert( isdefined( self._blackboard.smartobject ) );
    self._blackboard.bplaysmartobject = 1;
}

// Namespace asm_bb
// Params 0
// Checksum 0x9ac760db, Offset: 0xd6e
// Size: 0x17
function bb_clearplaysmartobject()
{
    self._blackboard.bplaysmartobject = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0x89ea07d3, Offset: 0xd8d
// Size: 0x16, Type: bool
function bb_playsmartobjectrequested()
{
    return istrue( self._blackboard.bplaysmartobject );
}

// Namespace asm_bb
// Params 0
// Checksum 0x8529ca23, Offset: 0xdac
// Size: 0x31
function bb_getrequestedcovermultiswitchnodetype()
{
    assert( isdefined( self._blackboard.docovermultiswitchnodetype ) );
    return self._blackboard.docovermultiswitchnodetype;
}

// Namespace asm_bb
// Params 0
// Checksum 0x20759c3d, Offset: 0xde6
// Size: 0x16, Type: bool
function bb_iscovermultiswitchrequested()
{
    return isdefined( self._blackboard.docovermultiswitchnodetype );
}

// Namespace asm_bb
// Params 4
// Checksum 0x3f7d7119, Offset: 0xe05
// Size: 0xf2, Type: bool
function bb_canplaygesture( asmname, statename, tostatename, gesture )
{
    if ( !isdefined( self._blackboard.gesturerequest ) )
    {
        return false;
    }
    
    if ( isdefined( gesture ) && self._blackboard.gesturerequest.gesture != gesture )
    {
        return false;
    }
    
    if ( !isdefined( self._blackboard.gesturerequest.latestalias ) )
    {
        return false;
    }
    
    if ( gettime() > self._blackboard.gesturerequest.timeoutms )
    {
        return false;
    }
    
    gesture_alias = self._blackboard.gesturerequest.latestalias;
    
    if ( !asm::asm_hasalias( tostatename, gesture_alias ) )
    {
        return false;
    }
    
    return true;
}

