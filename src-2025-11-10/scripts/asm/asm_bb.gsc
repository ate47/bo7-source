#using scripts\asm\asm;
#using scripts\asm\shared\utility;

#namespace asm_bb;

// Namespace asm_bb
// Params 1
// Checksum 0x5115c3d, Offset: 0xc0
// Size: 0xd
function bb_getprefixstring( category )
{
    return undefined;
}

// Namespace asm_bb
// Params 1
// Checksum 0xb12419a8, Offset: 0xd6
// Size: 0x22
function bb_requeststance( stance )
{
    self._blackboard.desiredstance = stance;
}

// Namespace asm_bb
// Params 0
// Checksum 0xda935fe1, Offset: 0x100
// Size: 0x15
function bb_getrequestedstance()
{
    return self._blackboard.desiredstance;
}

// Namespace asm_bb
// Params 4
// Checksum 0x20d9d2bf, Offset: 0x11e
// Size: 0x3d, Type: bool
function bb_isrequestedstance_refresh( asmname, statename, tostatename, params )
{
    requestedstance = utility::determinerequestedstance();
    return requestedstance == params;
}

// Namespace asm_bb
// Params 4
// Checksum 0x4c2e440f, Offset: 0x164
// Size: 0x5b, Type: bool
function bb_isrequestedstanceanddemeanor( asmname, statename, tostatename, params )
{
    assert( params.size == 2 );
    return self._blackboard.desiredstance == params[ 0 ] && asm::asm_getdemeanor() == params[ 1 ];
}

// Namespace asm_bb
// Params 1
// Checksum 0x1e35f44, Offset: 0x1c8
// Size: 0x1f
function bb_setisincombat( bincombat )
{
    self.bisincombat = !isdefined( bincombat ) || bincombat;
}

// Namespace asm_bb
// Params 4
// Checksum 0x838b05db, Offset: 0x1ef
// Size: 0x37, Type: bool
function bb_isweaponclass( asmname, statename, tostatename, params )
{
    return weaponclass( self.weapon ) == params;
}

// Namespace asm_bb
// Params 4
// Checksum 0x1da6ca86, Offset: 0x22f
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
// Checksum 0xe2a267ee, Offset: 0x29a
// Size: 0x7
function bb_moverequested()
{
    return self codemoverequested();
}

// Namespace asm_bb
// Params 1
// Checksum 0x70a0c413, Offset: 0x2aa
// Size: 0x22, Type: bool
function bb_movetyperequested( movetype )
{
    return self._blackboard.movetype == movetype;
}

// Namespace asm_bb
// Params 1
// Checksum 0x7707fb20, Offset: 0x2d5
// Size: 0x22
function bb_requestmovetype( movetype )
{
    self._blackboard.movetype = movetype;
}

// Namespace asm_bb
// Params 1
// Checksum 0x94de83b6, Offset: 0x2ff
// Size: 0x22
function bb_requestweapon( weapon )
{
    self._blackboard.weaponrequest = weapon;
}

// Namespace asm_bb
// Params 0
// Checksum 0x827d17cd, Offset: 0x329
// Size: 0x1b
function bb_clearweaponrequest()
{
    self._blackboard.weaponrequest = "none";
}

// Namespace asm_bb
// Params 0
// Checksum 0xca746949, Offset: 0x34c
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
// Checksum 0xe8143121, Offset: 0x388
// Size: 0x15
function bb_reloadrequested()
{
    return self._blackboard.breload;
}

// Namespace asm_bb
// Params 0
// Checksum 0xf9b206c2, Offset: 0x3a6
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
// Checksum 0xb54a2f89, Offset: 0x3f5
// Size: 0x15
function bb_getthrowgrenadetarget()
{
    return self._blackboard.throwgrenadetarget;
}

// Namespace asm_bb
// Params 1
// Checksum 0xf1d5f151, Offset: 0x413
// Size: 0x22
function bb_claimshootparams( taskid )
{
    self._blackboard.shootparams_taskid = taskid;
}

// Namespace asm_bb
// Params 1
// Checksum 0x852624d3, Offset: 0x43d
// Size: 0x3d
function bb_updateshootparams_pos( pos )
{
    assert( self._blackboard.shootparams_valid );
    self._blackboard.shootparams_pos = pos;
}

// Namespace asm_bb
// Params 0
// Checksum 0x780f4713, Offset: 0x482
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
// Checksum 0x6054fd67, Offset: 0x4be
// Size: 0x31, Type: bool
function bb_hadcovernode( asmname, statename, tostatename, params )
{
    return isdefined( self.covernode );
}

// Namespace asm_bb
// Params 0
// Checksum 0xe8fd9d4e, Offset: 0x4f8
// Size: 0xb
function bb_getcovernode()
{
    return self.covernode;
}

// Namespace asm_bb
// Params 0
// Checksum 0x4f161a79, Offset: 0x50c
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
// Checksum 0x6fc248a2, Offset: 0x53e
// Size: 0x22
function bb_requestturret( turret )
{
    self._blackboard.requestedturret = turret;
}

// Namespace asm_bb
// Params 0
// Checksum 0xb2d74aad, Offset: 0x568
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
// Checksum 0x9ac390a7, Offset: 0x5d2
// Size: 0x41
function function_d97733fe1476f19e( vehicle, turretindex )
{
    self._blackboard.var_22f41abfc5a5f544 = vehicle;
    self._blackboard.var_abd24c35bdded560 = turretindex;
}

// Namespace asm_bb
// Params 1
// Checksum 0x3706ec8c, Offset: 0x61b
// Size: 0x5e
function bb_requestturretpose( pose )
{
    assert( !isdefined( pose ) || pose == "<dev string:x24>" || pose == "<dev string:x2d>" || pose == "<dev string:x37>" || pose == "<dev string:x40>" );
    self._blackboard.requestedturretpose = pose;
}

// Namespace asm_bb
// Params 4
// Checksum 0x5b9691ab, Offset: 0x681
// Size: 0x6b, Type: bool
function bb_hasshufflenode( asmname, statename, tostatename, params )
{
    return self._blackboard.shufflenode == self.node && distancesquared( self.node.origin, self.origin ) > 16;
}

// Namespace asm_bb
// Params 0
// Checksum 0x4c317c2d, Offset: 0x6f5
// Size: 0x18
function bb_setanimscripted()
{
    self._blackboard.animscriptedactive = 1;
}

// Namespace asm_bb
// Params 0
// Checksum 0xce69fabd, Offset: 0x715
// Size: 0x17
function bb_clearanimscripted()
{
    self._blackboard.animscriptedactive = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0x938f0037, Offset: 0x734
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
// Checksum 0x916b974f, Offset: 0x788
// Size: 0x4d
function bb_requestmelee( target )
{
    self._blackboard.meleerequested = 1;
    self._blackboard.meleerequestedtarget = target;
    self._blackboard.meleerequestedcomplete = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0x333a3f03, Offset: 0x7dd
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
// Checksum 0x131a9611, Offset: 0x814
// Size: 0x2a
function bb_clearmeleerequest()
{
    self._blackboard.meleerequested = 0;
    self._blackboard.meleerequestedtarget = undefined;
}

// Namespace asm_bb
// Params 0
// Checksum 0x90aa3364, Offset: 0x846
// Size: 0x15
function bb_clearmeleerequestcomplete()
{
    self._blackboard.meleerequestedcomplete = undefined;
}

// Namespace asm_bb
// Params 4
// Checksum 0x50a992a3, Offset: 0x863
// Size: 0x3b, Type: bool
function bb_meleeinprogress( asmname, statename, tostatename, params )
{
    return isdefined( self._blackboard.meleerequestedcomplete );
}

// Namespace asm_bb
// Params 4
// Checksum 0x8dd92a39, Offset: 0x8a7
// Size: 0x3a
function bb_meleecomplete( asmname, statename, tostatename, params )
{
    return self._blackboard.meleerequestedcomplete;
}

// Namespace asm_bb
// Params 4
// Checksum 0x6c2c4ab4, Offset: 0x8ea
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
// Checksum 0xf482c430, Offset: 0x93c
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
// Checksum 0xdd791091, Offset: 0x9a6
// Size: 0x3d
function bb_clearmeleechargerequest()
{
    self._blackboard.meleerequestedcharge = 0;
    self._blackboard.meleerequestedcharge_target = undefined;
    self._blackboard.meleerequestedcharge_targetposition = undefined;
}

// Namespace asm_bb
// Params 0
// Checksum 0x9a7a9bd5, Offset: 0x9eb
// Size: 0x23, Type: bool
function bb_meleechargerequested()
{
    return isdefined( self.pathgoalpos ) && self._blackboard.meleerequestedcharge;
}

// Namespace asm_bb
// Params 4
// Checksum 0x4eb00dd1, Offset: 0xa17
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
// Checksum 0xa1b5fd49, Offset: 0xa54
// Size: 0x2e
function bb_getmeleechargetarget()
{
    if ( !self._blackboard.meleerequestedcharge )
    {
        return undefined;
    }
    
    return self._blackboard.meleerequestedcharge_target;
}

// Namespace asm_bb
// Params 0
// Checksum 0xf67a5ee3, Offset: 0xa8b
// Size: 0x30
function bb_getmeleechargetargetpos()
{
    assert( self._blackboard.meleerequestedcharge );
    return self._blackboard.meleerequestedcharge_targetposition;
}

// Namespace asm_bb
// Params 0
// Checksum 0x2f673ffc, Offset: 0xac4
// Size: 0x16, Type: bool
function bb_iswhizbyrequested()
{
    return isdefined( self._blackboard.whizbyeventtime );
}

// Namespace asm_bb
// Params 0
// Checksum 0xd0b5f1a5, Offset: 0xae3
// Size: 0x8
function bb_clearmeleetarget()
{
    self function_a227728f297b8669();
}

// Namespace asm_bb
// Params 1
// Checksum 0x89995521, Offset: 0xaf3
// Size: 0x22
function bb_setisinbadcrouchspot( bbadcrouchspot )
{
    self._blackboard.bbadcrouchspot = bbadcrouchspot;
}

// Namespace asm_bb
// Params 0
// Checksum 0x4234bc4d, Offset: 0xb1d
// Size: 0x16, Type: bool
function bb_isinbadcrouchspot()
{
    return istrue( self._blackboard.bbadcrouchspot );
}

// Namespace asm_bb
// Params 1
// Checksum 0xdd0b959a, Offset: 0xb3c
// Size: 0xc
function bb_setcivilianstate( state )
{
    
}

// Namespace asm_bb
// Params 0
// Checksum 0xb2c7946f, Offset: 0xb50
// Size: 0x7
function bb_getcivilianstate()
{
    return "deprecated";
}

// Namespace asm_bb
// Params 0
// Checksum 0xb3231318, Offset: 0xb60
// Size: 0x15
function bb_getcivilianstatetime()
{
    return self._blackboard.civstatetime;
}

// Namespace asm_bb
// Params 1
// Checksum 0x9a98c391, Offset: 0xb7e
// Size: 0x14
function bb_civilianrequestspeed( speed )
{
    self aisetdesiredspeed( speed );
}

// Namespace asm_bb
// Params 0
// Checksum 0x540f0cd4, Offset: 0xb9a
// Size: 0x16, Type: bool
function bb_isshort()
{
    return istrue( self._blackboard.bshort );
}

// Namespace asm_bb
// Params 1
// Checksum 0x4d1ea666, Offset: 0xbb9
// Size: 0x22
function bb_setshort( value )
{
    self._blackboard.bshort = value;
}

// Namespace asm_bb
// Params 0
// Checksum 0x11eeaaaf, Offset: 0xbe3
// Size: 0x16, Type: bool
function bb_smartobjectrequested()
{
    return isdefined( self._blackboard.smartobject );
}

// Namespace asm_bb
// Params 1
// Checksum 0x1ef4accd, Offset: 0xc02
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
// Checksum 0x1e2bbd30, Offset: 0xcab
// Size: 0x15
function bb_getrequestedsmartobject()
{
    return self._blackboard.smartobject;
}

// Namespace asm_bb
// Params 0
// Checksum 0xd30c8098, Offset: 0xcc9
// Size: 0x31
function bb_clearsmartobject()
{
    self._blackboard.smartobject = undefined;
    self._blackboard.smartobjectvalid = 0;
    bb_clearplaysmartobject();
}

// Namespace asm_bb
// Params 0
// Checksum 0x4207bb6a, Offset: 0xd02
// Size: 0x34
function bb_requestplaysmartobject()
{
    assert( isdefined( self._blackboard.smartobject ) );
    self._blackboard.bplaysmartobject = 1;
}

// Namespace asm_bb
// Params 0
// Checksum 0x504f51b7, Offset: 0xd3e
// Size: 0x17
function bb_clearplaysmartobject()
{
    self._blackboard.bplaysmartobject = 0;
}

// Namespace asm_bb
// Params 0
// Checksum 0x4362378f, Offset: 0xd5d
// Size: 0x16, Type: bool
function bb_playsmartobjectrequested()
{
    return istrue( self._blackboard.bplaysmartobject );
}

// Namespace asm_bb
// Params 0
// Checksum 0xa20529cd, Offset: 0xd7c
// Size: 0x31
function bb_getrequestedcovermultiswitchnodetype()
{
    assert( isdefined( self._blackboard.docovermultiswitchnodetype ) );
    return self._blackboard.docovermultiswitchnodetype;
}

// Namespace asm_bb
// Params 0
// Checksum 0x39efe9fc, Offset: 0xdb6
// Size: 0x16, Type: bool
function bb_iscovermultiswitchrequested()
{
    return isdefined( self._blackboard.docovermultiswitchnodetype );
}

// Namespace asm_bb
// Params 4
// Checksum 0xa845ec7d, Offset: 0xdd5
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

