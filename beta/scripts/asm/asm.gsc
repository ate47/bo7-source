#using scripts\anim\animselector;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace asm;

// Namespace asm
// Params 1
// Checksum 0xf7beada, Offset: 0x95a
// Size: 0x28
function function_ad98228cc73bd51c( asmname )
{
    self asminstantiate( asmname );
    self.asmasset = undefined;
    self.animationarchetype = undefined;
}

// Namespace asm
// Params 2
// Checksum 0x9de774, Offset: 0x98a
// Size: 0x68
function asm_getfunction( asmname, funcid )
{
    assert( isdefined( anim.asmfuncs[ asmname ] ), "<dev string:x24>" + asmname );
    assert( isdefined( anim.asmfuncs[ asmname ][ funcid ] ), "<dev string:x4a>" + funcid + "<dev string:x66>" + asmname );
    return anim.asmfuncs[ asmname ][ funcid ];
}

// Namespace asm
// Params 0
// Checksum 0xc842ad2d, Offset: 0x9fb
// Size: 0x7
function asm_getgenerichandler()
{
    return &asm_generichandler;
}

// Namespace asm
// Params 4
// Checksum 0xb17fddbc, Offset: 0xa0b
// Size: 0x47
function asm_setupaim( asmname, statename, blendtime, use_5 )
{
    if ( isdefined( self.fnasm_setupaim ) )
    {
        self [[ self.fnasm_setupaim ]]( asmname, statename, blendtime, use_5 );
    }
}

// Namespace asm
// Params 2
// Checksum 0xa051b6b3, Offset: 0xa5a
// Size: 0x4b
function function_e4caaa59f812360f( var_f382079c3425cee6, var_87bc3552a49f9d07 )
{
    if ( var_f382079c3425cee6 )
    {
        updatepainvars();
    }
    
    if ( !shouldplaypainanim( var_87bc3552a49f9d07 ) )
    {
        return 0;
    }
    
    didpain = self asmevalpaintransition( self.asmname );
    return didpain;
}

// Namespace asm
// Params 1
// Checksum 0x8d6511cd, Offset: 0xaae
// Size: 0x7b
function shouldplaypainanim( var_87bc3552a49f9d07 )
{
    if ( isdefined( self.fnshouldplaypainanim ) )
    {
        return self [[ self.fnshouldplaypainanim ]]();
    }
    
    if ( self.a.disablepain )
    {
        return 0;
    }
    
    if ( self.allowpain == 0 )
    {
        return 0;
    }
    
    if ( self.var_28a81dd923b494fe )
    {
        return 0;
    }
    
    if ( isdefined( self.pathgoalpos ) && self pathdisttogoal( var_87bc3552a49f9d07 ) < 64 )
    {
        return 0;
    }
    
    return 1;
}

// Namespace asm
// Params 1, eflags: 0x4
// Checksum 0xe2b8147d, Offset: 0xb32
// Size: 0x10c
function private updatepainvars( damagedsubpart )
{
    if ( self.damageshield && !isdefined( self.disabledamageshieldpain ) )
    {
        if ( !isdefined( self.a.lastpaintime ) )
        {
            self.a.lastpaintime = 0;
        }
        
        if ( !isdefined( self.damageshieldcounter ) || gettime() - self.a.lastpaintime > 1500 )
        {
            self.damageshieldcounter = randomintrange( 2, 3 );
        }
        
        if ( isdefined( self.lastattacker ) && distancesquared( self.origin, self.lastattacker.origin ) < squared( 512 ) )
        {
            self.damageshieldcounter = 0;
        }
        
        if ( self.damageshieldcounter > 0 )
        {
            self.damageshieldcounter--;
        }
    }
    
    if ( isdefined( damagedsubpart ) )
    {
        self.damagedsubpart = damagedsubpart;
        return;
    }
    
    self.damagedsubpart = undefined;
}

// Namespace asm
// Params 1
// Checksum 0x5bd1ced, Offset: 0xc46
// Size: 0x152
function asm_settransitionorientmode( orient_mode )
{
    if ( !isai( self ) )
    {
        return;
    }
    
    switch ( orient_mode )
    {
        case #"hash_96a6a25bd7beed30":
            var_bea7fb00cbc6d91e = 1024;
            
            if ( utility::actor_is3d() )
            {
                orient_angles = self.angles;
                
                if ( isdefined( self.node ) && distancesquared( self.origin, self.node.origin ) < var_bea7fb00cbc6d91e )
                {
                    orient_angles = self function_dabf98356d840a64( self.node );
                }
                
                self orientmode( "face angle 3d", orient_angles );
            }
            else
            {
                yaw = self.angles[ 1 ];
                
                if ( isdefined( self.node ) && distancesquared( self.origin, self.node.origin ) < var_bea7fb00cbc6d91e )
                {
                    yaw = utility::getnodeforwardyaw( self.node );
                }
                
                self orientmode( "face angle", yaw );
            }
            
            break;
        case #"hash_579a1f64b8b40d31":
            self orientmode( "face angle 3d", self.angles );
            break;
        default:
            self orientmode( orient_mode );
            break;
    }
}

// Namespace asm
// Params 1
// Checksum 0xe6d60db0, Offset: 0xda0
// Size: 0x32
function asm_settransitionanimmode( anim_mode )
{
    if ( isdefined( self.fnasm_setanimmode ) )
    {
        self [[ self.fnasm_setanimmode ]]( anim_mode );
        return;
    }
    
    self animmode( anim_mode, 0 );
}

// Namespace asm
// Params 5
// Checksum 0x9a8e3465, Offset: 0xdda
// Size: 0xef
function asm_generichandler( handlername, asmname, param1, param2, param3 )
{
    switch ( handlername )
    {
        case #"hash_fc8a71042f2cb15b":
            asm_setupaim( asmname, param1, 0.2, undefined );
            break;
        case #"hash_db521e4972a48a9d":
            customhandler = asm_getnotehandler( asmname, undefined );
            val = [[ self.fnasm_handlenotetrack ]]( param2, param1, customhandler, undefined );
            
            if ( !isdefined( val ) )
            {
                val = asm_handlenewnotetracks( asmname, param2, param1 );
            }
            
            if ( isdefined( val ) && !asm_eventfired( asmname, "end" ) )
            {
                asm_fireevent( asmname, "end" );
            }
            
            break;
        default:
            assertmsg( "<dev string:x72>" + handlername );
            break;
    }
}

// Namespace asm
// Params 2
// Checksum 0x878cc2ad, Offset: 0xed1
// Size: 0x5d
function asm_setoverrideparams( asmname, params )
{
    assert( isdefined( anim.asmparams ) );
    assert( isdefined( anim.asmparams[ asmname ] ) );
    var_c872504af26084a6 = 9999;
    anim.asmparams[ asmname ][ var_c872504af26084a6 ] = params;
    return var_c872504af26084a6;
}

// Namespace asm
// Params 0
// Checksum 0x8f1e9f25, Offset: 0xf37
// Size: 0x1a
function asm_globalinit()
{
    if ( isdefined( anim.asm ) )
    {
        return;
    }
    
    anim.asm = [];
}

// Namespace asm
// Params 3
// Checksum 0x1a869f64, Offset: 0xf59
// Size: 0x28
function asm_fireephemeralevent( eventtarget, eventname, params )
{
    self asmfireephemeralevent( eventtarget, eventname, params );
}

// Namespace asm
// Params 0
// Checksum 0x8b80de63, Offset: 0xf89
// Size: 0x33
function asm_init_blackboard()
{
    if ( isdefined( self._blackboard ) )
    {
        return;
    }
    
    self._blackboard = self getaiblackboard();
    self._blackboard.bfire = 0;
}

// Namespace asm
// Params 2
// Checksum 0x28caa6e6, Offset: 0xfc4
// Size: 0x83
function asm_terminateandreplace( newasmname, newarchetype )
{
    self asmterminate();
    self clearaiblackboard();
    self._blackboard = undefined;
    self notify( "asm_terminated" );
    self.asmtrackasm = undefined;
    
    if ( !isdefined( newarchetype ) )
    {
        newarchetype = self.animsetname;
    }
    
    lowerasmname = tolower( newasmname );
    asm_init_blackboard();
    self [[ self.fnasm_init ]]( lowerasmname, newarchetype );
    self.defaultasm = lowerasmname;
}

// Namespace asm
// Params 2
// Checksum 0x997d9448, Offset: 0x104f
// Size: 0x6c
function function_5696a376795811d5( newasmname, newarchetype )
{
    self asmterminate();
    self notify( "asm_terminated" );
    self.asmtrackasm = undefined;
    
    if ( !isdefined( newarchetype ) )
    {
        newarchetype = self.animsetname;
    }
    
    lowerasmname = tolower( newasmname );
    self [[ self.fnasm_init ]]( lowerasmname, newarchetype );
    self.defaultasm = lowerasmname;
}

// Namespace asm
// Params 2
// Checksum 0xa6e150dc, Offset: 0x10c3
// Size: 0x55
function asm_getnotehandler( asmname, statename )
{
    noteid = self asmgetnotehandler( asmname );
    
    if ( !isdefined( noteid ) )
    {
        return undefined;
    }
    
    if ( isint( noteid ) )
    {
        if ( noteid != -1 )
        {
            return anim.asmfuncs[ asmname ][ noteid ];
        }
        
        return undefined;
    }
    
    return noteid;
}

// Namespace asm
// Params 2
// Checksum 0x8d8b51f, Offset: 0x1121
// Size: 0x2c
function asm_currentstatehasflag( asmname, flagname )
{
    if ( self.asmforcetrackloop )
    {
        return 1;
    }
    
    return self asmcurrentstatehasflag( asmname, flagname );
}

// Namespace asm
// Params 3
// Checksum 0x7021576a, Offset: 0x1156
// Size: 0x28
function asm_fireevent_internal( asmname, eventname, params )
{
    self asmfireevent( asmname, eventname, params );
}

// Namespace asm
// Params 3
// Checksum 0xf7687858, Offset: 0x1186
// Size: 0x51
function asm_fireevent( asmname, eventname, params )
{
    asm_fireevent_internal( asmname, eventname, params );
    
    if ( eventname == "anim_will_finish" || eventname == "finish" )
    {
        eventname = "end";
        asm_fireevent_internal( asmname, eventname );
    }
}

// Namespace asm
// Params 3
// Checksum 0xf3526409, Offset: 0x11df
// Size: 0x3b, Type: bool
function asm_ephemeraleventfired( eventtarget, eventname, var_8f8f4be4171af73 )
{
    bfired = self asmephemeraleventfired( eventtarget, eventname );
    
    if ( bfired )
    {
        return true;
    }
    
    return false;
}

// Namespace asm
// Params 2
// Checksum 0x9418a47b, Offset: 0x1223
// Size: 0x1f
function asm_eventfiredrecently( asmname, eventname )
{
    return self asmeventfiredwithin( asmname, eventname, 50 );
}

// Namespace asm
// Params 2
// Checksum 0x3eb2996e, Offset: 0x124b
// Size: 0x1d
function asm_geteventtime( asmname, eventname )
{
    return self asmgeteventtime( asmname, eventname );
}

// Namespace asm
// Params 2
// Checksum 0xfcd5f256, Offset: 0x1271
// Size: 0x1d
function asm_geteventdata( asmname, eventname )
{
    return self asmgeteventdata( asmname, eventname );
}

// Namespace asm
// Params 2
// Checksum 0x294d60ed, Offset: 0x1297
// Size: 0x1d
function asm_getephemeraleventdata( eventtarget, eventname )
{
    return self asmgetephemeraleventdata( eventtarget, eventname );
}

// Namespace asm
// Params 0
// Checksum 0x2063e76e, Offset: 0x12bd
// Size: 0x8
function asm_clearallephemeralevents()
{
    self asmclearephemeralevents();
}

// Namespace asm
// Params 2
// Checksum 0x1f777990, Offset: 0x12cd
// Size: 0x8a, Type: bool
function asm_shouldpowerdown( asmname, currentstate )
{
    if ( !isdefined( self.bpowerdown ) || !self.bpowerdown )
    {
        return false;
    }
    
    if ( self.asm.bpowereddown )
    {
        return false;
    }
    
    if ( !isalive( self ) )
    {
        return false;
    }
    
    if ( asm_bb::bb_isanimscripted() )
    {
        return false;
    }
    
    if ( isdefined( self._blackboard.btraversing ) )
    {
        return false;
    }
    
    if ( self.in_melee )
    {
        return false;
    }
    
    return true;
}

// Namespace asm
// Params 2
// Checksum 0x3803fb87, Offset: 0x1360
// Size: 0x1d
function asm_eventfired( asmname, eventname )
{
    return self asmeventfired( asmname, eventname );
}

// Namespace asm
// Params 3
// Checksum 0x4113428d, Offset: 0x1386
// Size: 0x26
function asm_checktransitions( asmname, currentstatename, inpassthrough )
{
    self asmtick( 1 );
}

// Namespace asm
// Params 2
// Checksum 0xecc6f6f4, Offset: 0x13b4
// Size: 0x60
function asm_setstate( tostatename, params )
{
    if ( self asmhasstate( self.asmname, tostatename ) )
    {
        if ( isdefined( anim.callbacks[ "StopAnimscripted" ] ) )
        {
            self [[ anim.callbacks[ "StopAnimscripted" ] ]]();
        }
        
        self asmsetstate( self.asmname, tostatename, params );
    }
}

// Namespace asm
// Params 2
// Checksum 0xe7a3e24b, Offset: 0x141c
// Size: 0x6d
function function_7256f5ba459c840b( state_name, params )
{
    current = self asmgetcurrentstate( self.asmname );
    
    if ( current != state_name )
    {
        if ( isdefined( anim.callbacks[ "StopAnimscripted" ] ) )
        {
            self [[ anim.callbacks[ "StopAnimscripted" ] ]]();
        }
        
        self asmsetstate( self.asmname, state_name );
    }
}

/#

    // Namespace asm
    // Params 0
    // Checksum 0x741620f3, Offset: 0x1491
    // Size: 0xf, Type: dev
    function asm_tick()
    {
        assertmsg( "<dev string:x87>" );
    }

#/

// Namespace asm
// Params 4
// Checksum 0x2e772e5, Offset: 0x14a8
// Size: 0x56, Type: bool
function highestallowedstance( asmname, statename, tostatename, stance )
{
    assert( isdefined( stance ) );
    highestallowedstance = utility::gethighestallowedstance();
    
    if ( isdefined( highestallowedstance ) && highestallowedstance != stance )
    {
        return false;
    }
    
    return true;
}

// Namespace asm
// Params 0
// Checksum 0x5a3b1543, Offset: 0x1507
// Size: 0x15
function asm_getdemeanor()
{
    return self._blackboard.movetype;
}

// Namespace asm
// Params 0
// Checksum 0x3bf391e4, Offset: 0x1525
// Size: 0x2
function asm_updatefrantic()
{
    
}

// Namespace asm
// Params 0
// Checksum 0x74235908, Offset: 0x152f
// Size: 0x3, Type: bool
function asm_isfrantic()
{
    return false;
}

// Namespace asm
// Params 0
// Checksum 0xb0fc6ce2, Offset: 0x153b
// Size: 0x16, Type: bool
function asm_iscrawlmelee()
{
    return isdefined( self.asm.crawlmelee );
}

// Namespace asm
// Params 1
// Checksum 0xaeb82699, Offset: 0x155a
// Size: 0x22
function asm_setcrawlmelee( val )
{
    self.asm.crawlmelee = val;
}

// Namespace asm
// Params 3
// Checksum 0xb23b60c3, Offset: 0x1584
// Size: 0x38
function asm_setdemeanoranimoverride( demeanor, override, anime )
{
    self.asm.animoverrides[ demeanor ][ override ] = anime;
}

// Namespace asm
// Params 2
// Checksum 0xd69ac0af, Offset: 0x15c4
// Size: 0x39
function asm_cleardemeanoranimoverride( demeanor, override )
{
    if ( asm_hasdemeanoranimoverride( demeanor, override ) )
    {
        self.asm.animoverrides[ demeanor ][ override ] = undefined;
    }
}

// Namespace asm
// Params 2
// Checksum 0x605b7d63, Offset: 0x1605
// Size: 0x48, Type: bool
function asm_hasdemeanoranimoverride( demeanor, override )
{
    return isdefined( self.asm.animoverrides[ demeanor ] ) && isdefined( self.asm.animoverrides[ demeanor ][ override ] );
}

// Namespace asm
// Params 2
// Checksum 0xa11ea573, Offset: 0x1656
// Size: 0x3e
function asm_getdemeanoranimoverride( demeanor, override )
{
    assert( asm_hasdemeanoranimoverride( demeanor, override ) );
    return self.asm.animoverrides[ demeanor ][ override ];
}

// Namespace asm
// Params 1
// Checksum 0xff8a2328, Offset: 0x169d
// Size: 0x13
function asm_getcurrentstate( asmname )
{
    return self asmgetcurrentstate( asmname );
}

// Namespace asm
// Params 2
// Checksum 0xc4827dd7, Offset: 0x16b9
// Size: 0x52, Type: bool
function asm_hasalias( statename, alias )
{
    arcname = utility::function_18bf04f16702b9b2();
    assert( isdefined( arcname ), "<dev string:xc7>" );
    animresult = archetypegetrandomalias( arcname, statename, alias, asm_isfrantic() );
    return isdefined( animresult );
}

// Namespace asm
// Params 3
// Checksum 0x71e57f74, Offset: 0x1714
// Size: 0x95
function asm_getanim( asmname, statename, params )
{
    if ( isarray( params ) )
    {
        if ( params.size == 1 )
        {
            return self asmgetanim( asmname, statename, params[ 0 ] );
        }
        else if ( params.size == 2 )
        {
            return self asmgetanim( asmname, statename, params[ 0 ], params[ 1 ] );
        }
        else if ( params.size == 3 )
        {
            return self asmgetanim( asmname, statename, params[ 0 ], params[ 1 ], params[ 2 ] );
        }
        else
        {
            assertmsg( "<dev string:xee>" );
        }
        
        return;
    }
    
    return self asmgetanim( asmname, statename, params );
}

// Namespace asm
// Params 2
// Checksum 0x76fa7067, Offset: 0x17b1
// Size: 0x32
function asm_getrandomanim( asmname, statename )
{
    randomalias = asm_getrandomalias( statename );
    return asm_lookupanimfromalias( statename, randomalias );
}

// Namespace asm
// Params 1
// Checksum 0x7bce3415, Offset: 0x17ec
// Size: 0x65
function asm_getrandomalias( statename )
{
    aliases = archetypegetaliases( self.animsetname, statename );
    assert( aliases.size > 0, "<dev string:x131>" + self.animsetname + "<dev string:x15a>" + statename + "<dev string:x160>" + self.classname );
    return aliases[ randomint( aliases.size ) ];
}

// Namespace asm
// Params 2
// Checksum 0x8494d722, Offset: 0x185a
// Size: 0x54
function function_a0231b5621315b1( statename, alias )
{
    arcname = self.basearchetype;
    assert( isdefined( arcname ), "<dev string:x16a>" );
    animresult = archetypegetrandomalias( arcname, statename, alias, asm_isfrantic() );
    return animresult;
}

// Namespace asm
// Params 2
// Checksum 0x6a53eb7c, Offset: 0x18b7
// Size: 0x51
function asm_lookupanimfromaliasifexists( statename, alias )
{
    arcname = utility::function_18bf04f16702b9b2();
    assert( isdefined( arcname ), "<dev string:xc7>" );
    animresult = archetypegetrandomalias( arcname, statename, alias, asm_isfrantic() );
    return animresult;
}

// Namespace asm
// Params 2
// Checksum 0x7ed1e3f6, Offset: 0x1911
// Size: 0xa9
function function_9cf70e7bc311b2de( statename, alias )
{
    arcname = self.basearchetype;
    assert( isdefined( arcname ), "<dev string:x16a>" );
    animresult = archetypegetrandomalias( arcname, statename, alias, asm_isfrantic() );
    
    /#
        if ( isint( alias ) )
        {
            alias += "<dev string:x196>";
        }
        
        assert( isdefined( animresult ), "<dev string:x19a>" + getxhashsourcename( alias ) + "<dev string:x1b4>" + arcname + "<dev string:x1c8>" + statename + "<dev string:x1d5>" + self.classname + "<dev string:x1e0>" );
    #/
    
    return animresult;
}

// Namespace asm
// Params 2
// Checksum 0xb10ec160, Offset: 0x19c3
// Size: 0xa6
function asm_lookupanimfromalias( statename, alias )
{
    arcname = utility::function_18bf04f16702b9b2();
    assert( isdefined( arcname ), "<dev string:xc7>" );
    animresult = archetypegetrandomalias( arcname, statename, alias, asm_isfrantic() );
    
    /#
        if ( isint( alias ) )
        {
            alias += "<dev string:x196>";
        }
        
        assert( isdefined( animresult ), "<dev string:x19a>" + getxhashsourcename( alias ) + "<dev string:x1b4>" + arcname + "<dev string:x1c8>" + statename + "<dev string:x1d5>" + self.classname + "<dev string:x1e0>" );
    #/
    
    return animresult;
}

// Namespace asm
// Params 1
// Checksum 0x673da5bc, Offset: 0x1a72
// Size: 0x104
function asm_getallanimsforstate( statename )
{
    assert( isdefined( self.animsetname ) );
    arc = self.animsetname;
    aliases = archetypegetaliases( arc, statename );
    anims = [];
    
    foreach ( alias in aliases )
    {
        animdata = archetypegetalias( arc, statename, alias, 0 );
        
        if ( isarray( animdata.anims ) )
        {
            anims = arraycombine( anims, animdata.anims );
            continue;
        }
        
        anims[ anims.size ] = animdata.anims;
    }
    
    return anims;
}

// Namespace asm
// Params 3
// Checksum 0x679790c3, Offset: 0x1b7f
// Size: 0x67
function asm_getallanimsforalias( archetype, statename, alias )
{
    redanims = archetypegetalias( archetype, statename, alias, 1 );
    
    if ( !isdefined( redanims ) )
    {
        return undefined;
    }
    
    returnanims = redanims.anims;
    
    if ( !isarray( returnanims ) )
    {
        returnanims = [ returnanims ];
    }
    
    return returnanims;
}

// Namespace asm
// Params 2
// Checksum 0x6b4628d5, Offset: 0x1bef
// Size: 0x25
function asm_getallanimindicesforalias( statename, alias )
{
    return animsetgetallanimindicesforalias( self.animsetname, statename, alias );
}

// Namespace asm
// Params 3
// Checksum 0x1194b305, Offset: 0x1c1d
// Size: 0x95
function asm_playanimstate( asmname, statename, params )
{
    self endon( statename + "_finished" );
    animid = asm_getanim( asmname, statename );
    self aisetanim( statename, animid );
    asm_playfacialanim( asmname, statename, asm_getxanim( statename, animid ) );
    endnote = asm_donotetracks( asmname, statename, asm_getnotehandler( asmname, statename ) );
    
    if ( endnote == "code_move" )
    {
        endnote = asm_donotetracks( asmname, statename, asm_getnotehandler( asmname, statename ) );
    }
}

// Namespace asm
// Params 3
// Checksum 0x25dd5c80, Offset: 0x1cba
// Size: 0x57
function function_22bfe157adf276dd( asmname, statename, params )
{
    self endon( statename + "_finished" );
    var_16a5a8450e52aab2 = float( params );
    thread asm_playanimstate( asmname, statename, params );
    wait var_16a5a8450e52aab2;
    asm_fireevent( asmname, "end" );
}

// Namespace asm
// Params 0
// Checksum 0xfc1b44fc, Offset: 0x1d19
// Size: 0x42, Type: bool
function asm_hasknobs()
{
    if ( isagent( self ) && !self.bsoldier && self.unittype != "civilian" && self.unittype != "dog" )
    {
        return false;
    }
    
    return true;
}

// Namespace asm
// Params 4
// Checksum 0xde27fe9d, Offset: 0x1d64
// Size: 0x241
function function_b7619cbe4e9abaf4( asmname, statename, playbackrate, ismovestate )
{
    self endon( statename + "_finished" );
    
    if ( !isdefined( playbackrate ) )
    {
        playbackrate = 1;
    }
    
    if ( asm_hasknobs() )
    {
        bodyknob = asm_getbodyknob();
        
        if ( ismovestate )
        {
            moveid = asm_lookupanimfromaliasifexists( "knobs", "move" );
            
            if ( isdefined( moveid ) )
            {
                moveknob = asm_getxanim( "knobs", moveid );
                self setmoveanimknob( moveknob );
            }
        }
    }
    
    notehandler = asm_getnotehandler( asmname, statename );
    timestep = 0.2;
    bmovestate = istrue( ismovestate );
    brestart = 1;
    
    while ( true )
    {
        loopanim = asm_getanim( asmname, statename );
        loopxanim = asm_getxanim( statename, loopanim );
        
        if ( ismovestate )
        {
            playbackrate = asm_getmoveplaybackrate();
            self codemoveanimrate( playbackrate );
        }
        
        if ( !bmovestate )
        {
            brestart = self aigetanimweight( loopxanim ) == 0;
        }
        
        if ( isnumber( loopanim ) )
        {
            self aisetanim( statename, loopanim, playbackrate );
        }
        else
        {
            assert( utility::issp(), "<dev string:x1e5>" );
            blankindex = asm_lookupanimfromalias( statename, "blank" );
            self aisetanim( statename, blankindex );
            
            if ( brestart )
            {
                self setflaggedanimrestart( statename, loopanim, 1, 0.2, playbackrate );
            }
            else
            {
                self setflaggedanim( statename, loopanim, 1, 0.2, playbackrate );
            }
        }
        
        if ( bmovestate )
        {
            brestart = 0;
        }
        
        asm_playfacialanim( asmname, statename, loopxanim );
        animtime = getanimlength( loopxanim );
        
        if ( animtime <= 0.05 )
        {
            return;
        }
        
        lastnote = undefined;
        prevplaybackrate = playbackrate;
        
        while ( !isdefined( lastnote ) )
        {
            lastnote = asm_donotetrackswithtimeout( asmname, statename, timestep, notehandler );
            
            if ( !isdefined( lastnote ) && bmovestate )
            {
                playbackrate = asm_getmoveplaybackrate();
                
                if ( playbackrate != prevplaybackrate )
                {
                    self codemoveanimrate( playbackrate );
                    
                    if ( isnumber( loopanim ) )
                    {
                        self aisetanimrate( statename, loopanim, playbackrate );
                        continue;
                    }
                    
                    self setanimrate( loopxanim, playbackrate );
                }
            }
        }
    }
}

// Namespace asm
// Params 5
// Checksum 0x30353d34, Offset: 0x1fad
// Size: 0x113
function asm_lookupdirectionalfootanim( keypaddirection, asmname, statename, var_6c70d8d5ac969ca9, optionalprefix )
{
    prefix = "";
    
    if ( isdefined( optionalprefix ) )
    {
        prefix = optionalprefix;
    }
    
    if ( var_6c70d8d5ac969ca9 )
    {
        if ( asm_eventfiredrecently( asmname, "pass_left" ) )
        {
            prefixfoot = prefix + "left";
        }
        else if ( asm_eventfiredrecently( asmname, "pass_right" ) )
        {
            prefixfoot = prefix + "right";
        }
        else if ( self.asm.footsteps.foot == "right" )
        {
            prefixfoot = prefix + "right";
        }
        else
        {
            prefixfoot = prefix + "left";
        }
    }
    else
    {
        prefixfoot = prefix;
    }
    
    var_7237854e3be197ca = asm_lookupanimfromaliasifexists( statename, prefixfoot + keypaddirection );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    if ( prefix != prefixfoot )
    {
        var_7237854e3be197ca = asm_lookupanimfromaliasifexists( statename, prefix + keypaddirection );
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
}

// Namespace asm
// Params 1
// Checksum 0x67ceabf0, Offset: 0x20c8
// Size: 0x17
function asm_setmoveplaybackrate( rate )
{
    self.moveplaybackrate = rate;
}

// Namespace asm
// Params 0
// Checksum 0x9de49d0d, Offset: 0x20e7
// Size: 0xb
function asm_getmoveplaybackrate()
{
    return self.moveplaybackrate;
}

// Namespace asm
// Params 1
// Checksum 0xd695eb78, Offset: 0x20fb
// Size: 0x13
function asm_getcurrentstatename( asmname )
{
    return self asmgetcurrentstate( asmname );
}

// Namespace asm
// Params 5
// Checksum 0x472c9375, Offset: 0x2117
// Size: 0x14a
function asm_dosinglenotetrack( asmname, statename, customfunction, customparams, customflagname )
{
    flagname = statename;
    
    if ( isdefined( customflagname ) )
    {
        flagname = customflagname;
    }
    
    self waittill( flagname, notes );
    
    if ( !isdefined( notes ) )
    {
        notes = [ "undefined" ];
    }
    
    if ( !isarray( notes ) )
    {
        notes = [ notes ];
    }
    
    assert( isdefined( self.fnasm_handlenotetrack ), "<dev string:x23f>" );
    defined_val = undefined;
    
    foreach ( note in notes )
    {
        asm_fireevent( asmname, note );
        val = [[ self.fnasm_handlenotetrack ]]( note, flagname, customfunction, customparams );
        
        if ( !isdefined( val ) )
        {
            val = asm_handlenewnotetracks( asmname, note, statename );
        }
        
        if ( isdefined( val ) )
        {
            defined_val = val;
        }
    }
    
    return defined_val;
}

// Namespace asm
// Params 3
// Checksum 0x92104e7e, Offset: 0x226a
// Size: 0x95
function asm_handlenewnotetracks( asmname, note, statename )
{
    if ( asm_tryhandledeathstatechangenotetrack( note ) )
    {
        return;
    }
    
    switch ( note )
    {
        case #"hash_3f80c02caeb2ec99":
            if ( asm_currentstatehasflag( asmname, "notetrackAim" ) )
            {
                asm_setupaim( asmname, statename, 0.2 );
            }
            
            break;
        case #"hash_9076111750d00173":
            self.var_d4da0a58a936a837 = 1;
            break;
        case #"hash_39f7ecb43786b597":
            self.var_d4da0a58a936a837 = 0;
            break;
    }
}

// Namespace asm
// Params 1
// Checksum 0x22cd94f1, Offset: 0x2307
// Size: 0x146, Type: bool
function asm_tryhandledeathstatechangenotetrack( notetrack )
{
    if ( !isstartstr( notetrack, "ds " ) )
    {
        return false;
    }
    
    charindex = 3;
    assert( notetrack[ charindex ] == "<dev string:x2a8>", "<dev string:x2ad>" );
    self.asm.deathstateoverride = spawnstruct();
    charindex += 1;
    deathstate = "";
    
    while ( charindex < notetrack.size && notetrack[ charindex ] != "]" )
    {
        deathstate += notetrack[ charindex ];
        charindex += 1;
    }
    
    self.asm.deathstateoverride.statename = deathstate;
    charindex += 1;
    
    if ( charindex < notetrack.size )
    {
        assert( notetrack[ charindex ] + notetrack[ charindex + 1 ] == "<dev string:x2f8>", "<dev string:x2fe>" );
        charindex += 2;
        params = "";
        
        while ( charindex < notetrack.size && notetrack[ charindex ] != "]" )
        {
            params += notetrack[ charindex ];
            charindex += 1;
        }
        
        self.asm.deathstateoverride.params = params;
    }
    
    return true;
}

// Namespace asm
// Params 5
// Checksum 0xb857b0b5, Offset: 0x2456
// Size: 0x68
function asm_donotetracksfortime( asmname, statename, time, customfunction, customparams )
{
    sztimedout = statename + "_timeout";
    self endon( sztimedout );
    childthread asm_donotetracksfortime_helper( sztimedout, time );
    
    while ( true )
    {
        asm_dosinglenotetrack( asmname, statename, customfunction, customparams );
    }
}

// Namespace asm
// Params 3
// Checksum 0xa9395316, Offset: 0x24c6
// Size: 0x2b
function asm_donotetrackswithtimeout_helper( endonstring, notifystring, timeout )
{
    self endon( endonstring );
    wait timeout;
    self notify( notifystring );
}

// Namespace asm
// Params 5
// Checksum 0x82b65aba, Offset: 0x24f9
// Size: 0x83
function asm_donotetrackswithtimeout( asmname, statename, timeout, customfunction, customparams )
{
    sztimedout = statename + "_timeout";
    var_246417e0e941e01b = statename + "_endHelper";
    self endon( sztimedout );
    childthread asm_donotetrackswithtimeout_helper( var_246417e0e941e01b, sztimedout, timeout );
    retval = asm_donotetracks( asmname, statename, customfunction, customparams );
    self notify( var_246417e0e941e01b );
    return retval;
}

// Namespace asm
// Params 6
// Checksum 0x543ac1c2, Offset: 0x2585
// Size: 0x8e
function asm_donotetracks( asmname, statename, customfunction, customparams, customflagname, var_ecd7cff44d4c6bbc )
{
    if ( !isdefined( var_ecd7cff44d4c6bbc ) )
    {
        var_ecd7cff44d4c6bbc = 1;
    }
    
    for ( ;; )
    {
        val = asm_dosinglenotetrack( asmname, statename, customfunction, customparams, customflagname );
        
        if ( isdefined( val ) )
        {
            if ( var_ecd7cff44d4c6bbc && !asm_eventfired( asmname, "end" ) )
            {
                asm_fireevent( asmname, "end" );
            }
            
            return val;
        }
    }
}

// Namespace asm
// Params 5
// Checksum 0xcf921102, Offset: 0x261b
// Size: 0x177
function asm_donotetrackswithinterceptor( asmname, statename, interceptfunction, interceptparams, customflagname )
{
    assert( isdefined( interceptfunction ) );
    flagname = statename;
    
    if ( isdefined( customflagname ) )
    {
        flagname = customflagname;
    }
    
    for ( ;; )
    {
        self waittill( flagname, notes );
        
        if ( !isdefined( notes ) )
        {
            notes = [ "undefined" ];
        }
        
        if ( !isarray( notes ) )
        {
            notes = [ notes ];
        }
        
        var_d08e0f0e5bc777c4 = undefined;
        
        foreach ( note in notes )
        {
            asm_fireevent( asmname, note );
            intercepted = [[ interceptfunction ]]( statename, note, interceptparams );
            
            if ( intercepted )
            {
                continue;
            }
            
            assert( isdefined( self.fnasm_handlenotetrack ) );
            val = [[ self.fnasm_handlenotetrack ]]( note, statename, undefined, undefined ) ?? asm_handlenewnotetracks( asmname, note, statename );
            
            if ( isdefined( val ) )
            {
                var_d08e0f0e5bc777c4 = val;
            }
        }
        
        var_7237854e3be197ca = var_d08e0f0e5bc777c4;
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
}

// Namespace asm
// Params 4
// Checksum 0x1be4e743, Offset: 0x279a
// Size: 0x9d
function asm_donotetrackssingleloop( asmname, statename, xanim, customfunction )
{
    notifyname = statename + "_note_loop_end";
    self endon( notifyname );
    animlength = getanimlength( xanim );
    assert( animlength > 0, "<dev string:x358>" + statename + "<dev string:x373>" + getxhashsourcename( getanimname( xanim ) ) + "<dev string:x37e>" );
    thread asm_donotetrackssingleloop_waiter( notifyname, statename + "_finished", animlength );
    asm_donotetracks( asmname, statename, customfunction );
    self notify( notifyname );
}

// Namespace asm
// Params 3
// Checksum 0xb1dfdc23, Offset: 0x283f
// Size: 0x40
function asm_donotetrackssingleloop_waiter( notifyname, endonname, time )
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );
    self endon( notifyname );
    self endon( endonname );
    wait time;
    self notify( notifyname );
}

// Namespace asm
// Params 2
// Checksum 0x542bea43, Offset: 0x2887
// Size: 0x1d
function asm_donotetracksfortime_helper( notifystring, time )
{
    wait time;
    self notify( notifystring );
}

// Namespace asm
// Params 3
// Checksum 0x8b344af3, Offset: 0x28ac
// Size: 0xe5
function asm_waitforaimnotetrack( asmname, statename, blendtime )
{
    self endon( statename + "_finished" );
    bdone = 0;
    
    while ( !bdone )
    {
        self waittill( statename, notes );
        
        if ( !isarray( notes ) )
        {
            notes = [ notes ];
        }
        
        foreach ( note in notes )
        {
            if ( note == "start_aim" )
            {
                asm_setupaim( asmname, statename, blendtime );
                bdone = 1;
                break;
            }
        }
    }
}

// Namespace asm
// Params 3
// Checksum 0xc889610f, Offset: 0x2999
// Size: 0x1c6
function asm_lookuprandomalias( statename, optionalprefix, allownone )
{
    assert( isdefined( self.animsetname ), "<dev string:xc7>" );
    archetype = self.animsetname;
    aliases = archetypegetaliases( archetype, statename );
    possible = 0;
    chosen = undefined;
    prefixlen = -1;
    
    if ( isdefined( optionalprefix ) )
    {
        prefixlen = optionalprefix.size;
    }
    
    if ( !isdefined( aliases ) )
    {
        /#
            if ( !allownone )
            {
                msg = "<dev string:x393>" + statename + "<dev string:x3bb>" + archetype;
                
                if ( isdefined( optionalprefix ) )
                {
                    msg += "<dev string:x3cd>" + optionalprefix;
                }
                
                assertmsg( msg );
            }
        #/
        
        return undefined;
    }
    
    foreach ( aliasname in aliases )
    {
        if ( prefixlen < 0 || getsubstr( aliasname, 0, prefixlen ) == optionalprefix )
        {
            possible += 1;
            chance = 1 / possible;
            
            if ( randomfloat( 1 ) <= chance )
            {
                chosen = aliasname;
            }
        }
    }
    
    /#
        if ( !allownone && !isdefined( chosen ) )
        {
            msg = "<dev string:x393>" + statename + "<dev string:x3bb>" + archetype;
            
            if ( isdefined( optionalprefix ) )
            {
                msg += "<dev string:x3cd>" + optionalprefix;
            }
            
            assertmsg( msg );
        }
    #/
    
    return chosen;
}

// Namespace asm
// Params 3
// Checksum 0x2ed7ef76, Offset: 0x2b68
// Size: 0xb4
function asm_chooseanim( asmname, statename, params )
{
    if ( !isdefined( params ) )
    {
        randomalias = asm_lookuprandomalias( statename );
        
        if ( isdefined( randomalias ) )
        {
            return asm_lookupanimfromalias( statename, randomalias );
        }
        else
        {
            assertmsg( "<dev string:x3de>" + asmname + "<dev string:x445>" + statename );
            return undefined;
        }
        
        return;
    }
    
    result = undefined;
    prefixstr = asm_bb::bb_getprefixstring( params );
    
    if ( isdefined( prefixstr ) )
    {
        randomalias = asm_lookuprandomalias( statename, prefixstr );
        result = asm_lookupanimfromalias( statename, randomalias );
    }
    else
    {
        result = asm_lookupanimfromalias( statename, params );
    }
    
    return result;
}

// Namespace asm
// Params 0
// Checksum 0xeba52885, Offset: 0x2c24
// Size: 0x7a
function asm_clearfacialanim()
{
    if ( self.facialstate != "filler" )
    {
        if ( isai( self ) )
        {
            self setfacialindex( "none" );
            return;
        }
        
        if ( isdefined( self.var_2eb71d32b982e8a4 ) )
        {
            facialknob = asm_lookupanimfromalias( "knobs", "head_fakeactor" );
            self clearanim( asm_getxanim( "knobs", facialknob ), 0.2 );
            return;
        }
        
        utility::setfacialindexfornonai( "none" );
    }
}

// Namespace asm
// Params 0
// Checksum 0x1c91c0f2, Offset: 0x2ca6
// Size: 0x4a
function asm_restorefacialanim()
{
    asmname = self.asmname;
    statename = self asmgetcurrentstate( asmname );
    
    if ( statename == "animscripted" || self function_fb1905f4ebf9177f( asmname ) )
    {
        return;
    }
    
    asm_playfacialanim( asmname, statename, undefined );
}

// Namespace asm
// Params 3
// Checksum 0xca95feb5, Offset: 0x2cf8
// Size: 0x3b
function asm_playfacialanim( asmname, statename, animname )
{
    if ( isdefined( self.fnasm_playfacialanim ) )
    {
        [[ self.fnasm_playfacialanim ]]( asmname, statename, animname );
    }
}

// Namespace asm
// Params 0
// Checksum 0x8eb3267f, Offset: 0x2d3b
// Size: 0x5f
function asm_getroot()
{
    assert( asm_hasknobs() );
    animid = asm_lookupanimfromaliasifexists( "knobs", "root" );
    
    if ( isdefined( animid ) )
    {
        return asm_getxanim( "knobs", animid );
    }
    
    animid = function_9cf70e7bc311b2de( "knobs", "root" );
    return function_e9dad979e1b462c6( "knobs", animid );
}

// Namespace asm
// Params 0
// Checksum 0x512e19a9, Offset: 0x2da3
// Size: 0x51
function asm_getbodyknob()
{
    animid = asm_lookupanimfromaliasifexists( "knobs", "body" );
    
    if ( isdefined( animid ) )
    {
        return asm_getxanim( "knobs", animid );
    }
    
    animid = function_9cf70e7bc311b2de( "knobs", "body" );
    return function_e9dad979e1b462c6( "knobs", animid );
}

// Namespace asm
// Params 0
// Checksum 0x8eb0409c, Offset: 0x2dfd
// Size: 0x5e
function asm_getinnerrootknob()
{
    animid = asm_lookupanimfromaliasifexists( "knobs", "inner_root" );
    
    if ( isdefined( animid ) )
    {
        return asm_getxanim( "knobs", animid );
    }
    
    animid = function_a0231b5621315b1( "knobs", "inner_root" );
    
    if ( isdefined( animid ) )
    {
        return function_e9dad979e1b462c6( "knobs", animid );
    }
    
    return asm_getbodyknob();
}

// Namespace asm
// Params 0
// Checksum 0xbb7bf06a, Offset: 0x2e64
// Size: 0x58
function asm_getfacialknob()
{
    animid = asm_lookupanimfromaliasifexists( "always_on", "facial" );
    
    if ( isdefined( animid ) )
    {
        return asm_getxanim( "always_on", animid );
    }
    
    animid = function_a0231b5621315b1( "always_on", "facial" );
    
    if ( isdefined( animid ) )
    {
        return function_e9dad979e1b462c6( "always_on", animid );
    }
}

// Namespace asm
// Params 0
// Checksum 0x84dd4973, Offset: 0x2ec4
// Size: 0x58
function asm_getheadlookknobifexists()
{
    animid = asm_lookupanimfromaliasifexists( "knobs", "headlook" );
    
    if ( isdefined( animid ) )
    {
        return asm_getxanim( "knobs", animid );
    }
    
    animid = function_a0231b5621315b1( "knobs", "headlook" );
    
    if ( isdefined( animid ) )
    {
        return function_e9dad979e1b462c6( "knobs", animid );
    }
}

// Namespace asm
// Params 0
// Checksum 0x24456c98, Offset: 0x2f24
// Size: 0xaa, Type: bool
function asm_isweaponoverride()
{
    currentweapon = self.weapon;
    weapon = getweaponbasename( currentweapon );
    weapontypeoverrides = [ "iw7_cheytac", "iw7_kbs", "iw7_m1", "iw7_m8", "iw7_mauler", "iw7_sdflmg", "iw7_ameli", "iw7_steeldragon", "iw7_sonic", "iw7_sdfshotty", "iw7_spas" ];
    
    if ( isdefined( weapon ) && arraycontains( weapontypeoverrides, weapon ) )
    {
        return true;
    }
    
    return false;
}

// Namespace asm
// Params 2
// Checksum 0xbf03e763, Offset: 0x2fd7
// Size: 0x60
function function_e9dad979e1b462c6( statename, animid )
{
    assert( isdefined( statename ) );
    assert( isdefined( animid ), "<dev string:x451>" + statename );
    
    if ( isnumber( animid ) )
    {
        archetype = self.basearchetype;
        return animsetgetanimfromindex( archetype, statename, animid );
    }
    
    return animid;
}

// Namespace asm
// Params 2
// Checksum 0x21bbb29a, Offset: 0x303f
// Size: 0x7b
function asm_getxanim( statename, animid )
{
    assert( isdefined( statename ) );
    assert( isdefined( animid ), "<dev string:x451>" + statename );
    
    if ( isnumber( animid ) )
    {
        archetype = utility::function_18bf04f16702b9b2();
        assert( animid != -1, "<dev string:x47a>" + statename + "<dev string:x49c>" + archetype );
        return animsetgetanimfromindex( archetype, statename, animid );
    }
    
    return animid;
}

// Namespace asm
// Params 4
// Checksum 0xe412a53c, Offset: 0x30c2
// Size: 0xa3
function asm_playanimstatewithnotetrackinterceptor( asmname, statename, var_ec9a99e9158712bf, var_c4d43a269775940d )
{
    self endon( statename + "_finished" );
    animid = asm_getanim( asmname, statename );
    self aisetanim( statename, animid );
    asm_playfacialanim( asmname, statename, asm_getxanim( statename, animid ) );
    endnote = asm_donotetrackswithinterceptor( asmname, statename, var_ec9a99e9158712bf, var_c4d43a269775940d );
    
    if ( endnote == "end" )
    {
        if ( !asm_eventfired( asmname, "end" ) )
        {
            asm_fireevent( asmname, "end" );
        }
    }
}

// Namespace asm
// Params 3
// Checksum 0x12640bf5, Offset: 0x316d
// Size: 0x76
function asm_playanimstatenotransition( asmname, statename, params )
{
    self endon( statename + "_finished" );
    animid = asm_getanim( asmname, statename );
    self aisetanim( statename, animid );
    asm_playfacialanim( asmname, statename, asm_getxanim( statename, animid ) );
    endnote = asm_donotetracks( asmname, statename, asm_getnotehandler( asmname, statename ) );
}

// Namespace asm
// Params 2
// Checksum 0x754faa02, Offset: 0x31eb
// Size: 0x83
function function_48f01027f17c6d8( statename, aliasname )
{
    self endon( "death" );
    asm_bb::bb_setanimscripted();
    self asmsetstate( self.asmname, "animscripted" );
    animindex = asm_lookupanimfromalias( statename, aliasname );
    self aisetanim( statename, animindex );
    xanim = asm_getxanim( statename, animindex );
    animlength = getanimlength( xanim );
    wait animlength;
    asm_bb::bb_clearanimscripted();
}

// Namespace asm
// Params 3
// Checksum 0xc24340f2, Offset: 0x3276
// Size: 0x40
function asm_playadditiveanimloopstate( asmname, statename, params )
{
    assert( isdefined( self.fnasm_playadditiveanimloopstate ) );
    [[ self.fnasm_playadditiveanimloopstate ]]( asmname, statename, params );
}

// Namespace asm
// Params 0
// Checksum 0x54e64ea, Offset: 0x32be
// Size: 0x1b
function function_24133a663bba593c()
{
    normalizedtime = self function_c8f2dd7dcd2cc37f();
    self restartanim( normalizedtime );
}

// Namespace asm
// Params 1
// Checksum 0xa0ec8ff, Offset: 0x32e1
// Size: 0x17
function function_d82cb83c9c260d49( rate )
{
    self.animplaybackratedefault = rate;
}

// Namespace asm
// Params 0
// Checksum 0x8ac8059a, Offset: 0x3300
// Size: 0xb
function function_27be172b46a89235()
{
    return self.animplaybackratedefault;
}

// Namespace asm
// Params 1
// Checksum 0x15c78fbf, Offset: 0x3314
// Size: 0x56
function yawdiffto2468( diff )
{
    if ( diff < -135 )
    {
        return "2";
    }
    
    if ( diff < -45 )
    {
        return "6";
    }
    
    if ( diff > 135 )
    {
        return "2";
    }
    
    if ( diff > 45 )
    {
        return "4";
    }
    
    return "8";
}

/#

    // Namespace asm
    // Params 0
    // Checksum 0xf654a74d, Offset: 0x3372
    // Size: 0x16, Type: dev
    function asm_debugenabled()
    {
        if ( level.asmdebugenabled )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace asm
    // Params 0
    // Checksum 0xc4493893, Offset: 0x3390
    // Size: 0x4d, Type: dev
    function function_ae2d2cb168819b86()
    {
        dvar = getdvar( @"debug_arrivals" );
        
        if ( dvar == "<dev string:x4a4>" )
        {
            return 0;
        }
        
        if ( dvar == "<dev string:x4ab>" )
        {
            return 1;
        }
        
        if ( int( dvar ) == self getentitynumber() )
        {
            return 1;
        }
        
        return 0;
    }

    // Namespace asm
    // Params 1
    // Checksum 0x63f873c7, Offset: 0x33e5
    // Size: 0x21, Type: dev
    function debug_arrival( msg )
    {
        if ( !function_ae2d2cb168819b86() )
        {
            return;
        }
        
        println( msg );
    }

#/

// Namespace asm
// Params 2
// Checksum 0x9ed741cc, Offset: 0x340e
// Size: 0x73d
function asm_setupgesture( asmname, statename )
{
    demeanor = asm_getdemeanor();
    bfrantic = asm_isfrantic();
    gestures = self.asm.gestures;
    arc = self.animsetname;
    gestures.gesture_moveup_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_move_up", bfrantic ) );
    gestures.gesture_armup_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_armup", bfrantic ) );
    gestures.gesture_onme_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_on_me", bfrantic ) );
    gestures.gesture_hold_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_hold", bfrantic ) );
    gestures.gesture_fallback_up_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_fallback_up", bfrantic ) );
    gestures.gesture_fallback_down_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_fallback_down", bfrantic ) );
    
    if ( demeanor == "casual" )
    {
        gestures.gesture_point_center = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_point_center", bfrantic ) );
        gestures.gesture_point_left = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_point_left", bfrantic ) );
        gestures.gesture_point_right = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_point_right", bfrantic ) );
        gestures.gesture_point_up = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_point_up", bfrantic ) );
        gestures.gesture_point_down = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_point_down", bfrantic ) );
        gestures.gesture_shrug_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_shrug_anim", bfrantic ) );
        gestures.gesture_cross_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_cross_anim", bfrantic ) );
        gestures.gesture_nod_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_nod_anim", bfrantic ) );
        gestures.gesture_shake_head_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_shake_head_anim", bfrantic ) );
        gestures.gesture_salute_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_salute_anim", bfrantic ) );
        gestures.gesture_wave_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_wave_anim", bfrantic ) );
        gestures.gesture_wait_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_wait_anim", bfrantic ) );
        return;
    }
    
    if ( demeanor == "casual_gun" )
    {
        gestures.gesture_point_center = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_casual_gun_point_center", bfrantic ) );
        gestures.gesture_point_left = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_casual_gun_point_left", bfrantic ) );
        gestures.gesture_point_right = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_casual_gun_point_right", bfrantic ) );
        gestures.gesture_point_up = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_casual_gun_point_up", bfrantic ) );
        gestures.gesture_point_down = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_casual_gun_point_down", bfrantic ) );
        gestures.gesture_shrug_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_shrug_anim", bfrantic ) );
        gestures.gesture_cross_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_cross_anim", bfrantic ) );
        gestures.gesture_nod_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_nod_anim", bfrantic ) );
        gestures.gesture_shake_head_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_shake_head_anim", bfrantic ) );
        gestures.gesture_salute_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_salute_anim", bfrantic ) );
        gestures.gesture_wave_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_wave_anim", bfrantic ) );
        gestures.gesture_wait_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_wait_anim", bfrantic ) );
        return;
    }
    
    gestures.gesture_point_center = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_gun_point_center", bfrantic ) );
    gestures.gesture_point_left = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_gun_point_left", bfrantic ) );
    gestures.gesture_point_right = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_gun_point_right", bfrantic ) );
    gestures.gesture_point_up = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_gun_point_up", bfrantic ) );
    gestures.gesture_point_down = asm_getxanim( "gesture_point", archetypegetrandomalias( arc, "gesture_point", "gesture_gun_point_down", bfrantic ) );
    gestures.gesture_shrug_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_shrug_anim", bfrantic ) );
    gestures.gesture_cross_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_cross_anim", bfrantic ) );
    gestures.gesture_nod_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_nod_anim", bfrantic ) );
    gestures.gesture_shake_head_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_shake_head_anim", bfrantic ) );
    gestures.gesture_salute_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_salute_anim", bfrantic ) );
    gestures.gesture_wave_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_wave_anim", bfrantic ) );
    gestures.gesture_wait_anim = asm_getxanim( "gesture_old", archetypegetrandomalias( arc, "gesture_old", "gesture_gun_wait_anim", bfrantic ) );
}

// Namespace asm
// Params 0
// Checksum 0xbf9a3f92, Offset: 0x3b53
// Size: 0x152
function setup_level_ents()
{
    level endon( "game_ended" );
    
    if ( getdvarint( @"hash_96f0961c5045c40f", 1 ) == 0 )
    {
        count = 0;
        
        foreach ( t in getnodearray( "traverse", #targetname ) )
        {
            t traversethink();
            count++;
            
            if ( count > 1000 )
            {
                count = 0;
                waitframe();
            }
        }
        
        callback::callback( "setup_all_traversals" );
    }
    
    /#
        foreach ( t in getnodearray( "<dev string:x4b1>", #targetname ) )
        {
            t thread deprecatedtraversethink();
        }
        
        level thread drawtraversaldata();
        level thread function_29d96ec9eaf4d567();
    #/
}

// Namespace asm
// Params 0
// Checksum 0x34b044c9, Offset: 0x3cad
// Size: 0x9c
function function_27264fa17da61bfd()
{
    foreach ( t in getallnodes() )
    {
        if ( t.type == "Begin" && !isdefined( t.traverse_height ) )
        {
            t function_80f47e6604a0bd05();
            waitframe();
        }
    }
}

// Namespace asm
// Params 1
// Checksum 0xfc474b60, Offset: 0x3d51
// Size: 0x15
function function_222bc7369d339dc0( startnode )
{
    startnode function_80f47e6604a0bd05();
}

// Namespace asm
// Params 1
// Checksum 0x2a096d73, Offset: 0x3d6e
// Size: 0x59
function processdoublejumpmantletraversal( target )
{
    assert( isdefined( target ) );
    self.doublejumpmantlepos = target.origin;
    self.startnodeoriginalangles = self.angles;
    
    if ( isent( target ) )
    {
        target delete();
        return;
    }
    
    utility::deletestruct_ref( target );
}

// Namespace asm
// Params 1
// Checksum 0xaeb6acd6, Offset: 0x3dcf
// Size: 0x1a6
function function_83faa08e56039deb( startnode )
{
    ent = undefined;
    
    if ( !level.var_13b70b3b5724494f )
    {
        ent = utility::getstruct( startnode.target, "targetname" );
    }
    
    if ( isdefined( ent ) && startnode.animscript == "traverse_wall" )
    {
        startnode function_10f85acdeccd847f( ent );
        startnode.var_213a703686d12d7a = 1;
        return;
    }
    else if ( startnode.animscript == "traverse_ground" )
    {
        startnode function_1ac102ffa6ca2786( ent );
        startnode.var_213a703686d12d7a = 1;
        return;
    }
    
    traversedata = function_a6d79799bb932140( startnode );
    
    if ( traversedata.var_2ad2e2c048afac29 )
    {
        startnode.apex_delta = traversedata.apexdelta;
        startnode.endpos = traversedata.endposition;
        startnode.traverse_height = traversedata.traverseheight;
        startnode.traverse_height_delta = traversedata.traverseheightdelta;
        startnode.traverse_drop_height_delta = traversedata.var_a0a64078ec2e6068;
        startnode.var_213a703686d12d7a = 1;
        
        if ( traversedata.var_73675b828542c89c )
        {
            startnode.across_delta = traversedata.acrossdelta;
        }
        
        if ( isdefined( self.parentname ) )
        {
            startnode store_original_traverse_data();
        }
    }
    else
    {
        startnode traversethink();
    }
    
    if ( !isdefined( startnode.traverse_height ) )
    {
        callback::callback( "setup_traversal", startnode );
    }
}

// Namespace asm
// Params 0
// Checksum 0x733e9fac, Offset: 0x3f7d
// Size: 0x50a
function traversethink()
{
    ent = getent( self.target, #targetname );
    
    if ( !isdefined( ent ) )
    {
        ent = utility::getstruct( self.target, "targetname" );
    }
    
    end_node = getnode( self.target, #targetname );
    
    if ( !isdefined( end_node ) )
    {
        if ( level.script != "mp_jup_map" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4" )
        {
            assert( isdefined( end_node ), "<dev string:x4c8>" + self.origin + "<dev string:x517>" + self.target );
        }
        
        logstring( "^1Warning: Unable to find matching negotiation_end_node for negotiation_start_node at " + self.origin + " " + self.target );
        return;
    }
    
    if ( self.animscript == "traverse_ground" )
    {
        function_1ac102ffa6ca2786( ent );
        return;
    }
    
    if ( !isdefined( ent ) )
    {
        println( "<dev string:x51c>" + self.animscript + "<dev string:x53e>" );
        calculate_traverse_data( averagepoint( [ self.origin, end_node.origin ] ), end_node.origin );
        return;
    }
    
    switch ( self.animscript )
    {
        case #"hash_8f681d217a32aef7":
            processwallruntraversal( ent );
            return;
        case #"hash_2517ba3af2f13858":
            function_10f85acdeccd847f( ent );
            return;
        case #"hash_6fc6878fd3fd1e7a":
        case #"hash_d14662a6eb371af5":
            /#
                if ( getdvarint( @"hash_a838875af4383ca1", 0 ) != 0 )
                {
                    if ( isdefined( self.target ) )
                    {
                        node = getnode( self.target, #targetname );
                        
                        if ( isdefined( node ) )
                        {
                            self.var_52abd4c0d33d2de2 = node.origin;
                        }
                    }
                }
            #/
            
            processdoublejumpmantletraversal( ent );
            return;
        case #"hash_5f054fa72e77b8dd":
            /#
                if ( getdvarint( @"hash_a838875af4383ca1", 0 ) != 0 )
                {
                    if ( isdefined( self.target ) )
                    {
                        node = getnode( self.target, #targetname );
                        
                        if ( isdefined( node ) )
                        {
                            self.var_52abd4c0d33d2de2 = node.origin;
                        }
                    }
                }
            #/
            
            self.startnodeoriginalangles = self.angles;
            self.jump_over_offset = ent.origin - self.origin;
            self.jump_over_ent_origin = ent.origin;
            break;
        case #"hash_3083e73248cdb399":
            self.startnodeoriginalangles = self.angles;
            
            /#
                if ( getdvarint( @"hash_a838875af4383ca1", 0 ) != 0 )
                {
                    self.var_52abd4c0d33d2de2 = getnode( self.target, #targetname ).origin;
                    self.var_fb3c10ddbdbd47bc = ent.origin;
                }
            #/
            
            break;
        default:
            break;
    }
    
    if ( isdefined( ent.target ) && ( level.script != "mp_jup_bigmap" && level.script != "mp_jup_bigmap_wz2" && level.script != "mp_jup_bm_live_wz2" && level.script != "mp_jup_bm_wz2_s4" || !isendstr( ent.target, "auto12190374188911454432" ) ) )
    {
        ent2 = getent( ent.target, #targetname );
        
        if ( !isdefined( ent2 ) )
        {
            ent2 = utility::getstruct( ent.target, "targetname" );
        }
        
        assert( isdefined( ent2 ), self.animscript + "<dev string:x5aa>" + self.origin + "<dev string:x5bb>" + ent.targetname + "<dev string:x5c8>" + ent.origin + "<dev string:x5d0>" + ent.target );
        
        if ( isdefined( ent2 ) )
        {
            calculate_traverse_data( ent.origin, end_node.origin, ent2.origin );
        }
        else
        {
            calculate_traverse_data( ent.origin, end_node.origin );
        }
    }
    else
    {
        calculate_traverse_data( ent.origin, end_node.origin );
    }
    
    if ( isdefined( self.parentname ) )
    {
        store_original_traverse_data();
    }
    
    if ( isent( ent ) )
    {
        ent delete();
        return;
    }
    
    utility::deletestruct_ref( ent );
}

// Namespace asm
// Params 0
// Checksum 0x1d03570c, Offset: 0x448f
// Size: 0xd0
function function_80f47e6604a0bd05()
{
    apex_pos = undefined;
    end_node = getnode( self.target, #targetname );
    assert( isdefined( end_node ), "<dev string:x4c8>" + self.origin + "<dev string:x517>" + self.target );
    apex_pos = function_5f6e47af34199e3a( self.origin, end_node.origin );
    
    if ( !isdefined( apex_pos ) )
    {
        assertmsg( "<dev string:x5f4>" + self.origin + "<dev string:x634>" );
        apex_pos = averagepoint( [ self.origin, end_node.origin ] );
    }
    
    calculate_traverse_data( apex_pos, end_node.origin );
}

// Namespace asm
// Params 0
// Checksum 0x18526247, Offset: 0x4567
// Size: 0x1af
function store_original_traverse_data()
{
    self.original_data = spawnstruct();
    self.original_data.origin = self.origin;
    self.original_data.angles = self.angles;
    self.original_data.traverse_height = self.traverse_height;
    self.original_data.traverse_height_delta = self.traverse_height_delta;
    self.original_data.traverse_drop_height_delta = self.traverse_drop_height_delta;
    self.original_data.apex_delta = self.apex_delta;
    self.original_data.apex_delta_local = rotatevectorinverted( self.apex_delta, self.angles );
    
    if ( isdefined( self.across_delta ) )
    {
        self.original_data.across_delta = self.across_delta;
        self.original_data.across_delta_local = rotatevectorinverted( self.across_delta, self.angles );
    }
    
    if ( isdefined( self.endpos ) )
    {
        self.original_data.endnode_pos = self.endpos;
        return;
    }
    
    end_node = getnode( self.target, #targetname );
    
    if ( isdefined( end_node ) )
    {
        self.original_data.endnode_pos = end_node.origin;
    }
}

// Namespace asm
// Params 3
// Checksum 0xbd0ab731, Offset: 0x471e
// Size: 0x124
function calculate_traverse_data( struct_pos, endnode_pos, struct2_pos )
{
    assert( self.type == "<dev string:x674>" );
    
    if ( self.animscript == "ladder_up" || self.animscript == "ladder_down" )
    {
        ladderend = struct2_pos ?? struct_pos ?? endnode_pos;
        self.traverse_height = ladderend[ 2 ];
        self.traverse_height_delta = ladderend[ 2 ] - self.origin[ 2 ];
        self.traverse_drop_height_delta = ladderend[ 2 ] - endnode_pos[ 2 ];
        self.apex_delta = ladderend - self.origin;
        return;
    }
    
    self.traverse_height = struct_pos[ 2 ];
    self.traverse_height_delta = struct_pos[ 2 ] - self.origin[ 2 ];
    self.traverse_drop_height_delta = struct_pos[ 2 ] - endnode_pos[ 2 ];
    self.apex_delta = struct_pos - self.origin;
    
    if ( isdefined( struct2_pos ) )
    {
        self.across_delta = struct2_pos - struct_pos;
    }
}

// Namespace asm
// Params 4
// Checksum 0x125d0bd9, Offset: 0x484a
// Size: 0xda
function re_calculate_traverse_data( ref_node, struct_pos, endnode_pos, struct2_pos )
{
    if ( !isdefined( struct_pos ) )
    {
        struct_pos = self.origin + rotatevector( ref_node.original_data.apex_delta_local, self.angles );
    }
    
    if ( !isdefined( endnode_pos ) )
    {
        endnode_pos = ref_node.original_data.endnode_pos;
    }
    
    if ( !isdefined( struct2_pos ) && isdefined( ref_node.original_data.across_delta_local ) )
    {
        var_f5f5d5a5a8e43492 = rotatevector( ref_node.original_data.across_delta_local, self.angles );
        struct2_pos = struct_pos + var_f5f5d5a5a8e43492;
    }
    
    calculate_traverse_data( struct_pos, endnode_pos, struct2_pos );
}

// Namespace asm
// Params 1
// Checksum 0x8eca7eac, Offset: 0x492c
// Size: 0x622
function processwallruntraversal( target )
{
    assert( isdefined( target ) );
    wallendnode = getent( target.target, #targetname );
    
    if ( !isdefined( wallendnode ) )
    {
        wallendnode = utility::getstruct( target.target, "targetname" );
    }
    
    assert( isdefined( wallendnode ) );
    
    /#
        dist = distance( self.origin, target.origin );
        
        if ( dist > 400 )
        {
            println( "<dev string:x67d>" + self.origin + "<dev string:x6b5>" + dist + "<dev string:x6d0>" + 400 );
        }
    #/
    
    self.wall_info = spawnstruct();
    var_767e71695667e555 = target;
    numnodes = 0;
    self.wall_info.startnodeoriginalangles = self.angles;
    
    /#
        deltaz = var_767e71695667e555.origin[ 2 ] - self.origin[ 2 ];
        
        if ( deltaz > 208 )
        {
            println( "<dev string:x6d7>" + var_767e71695667e555.origin + "<dev string:x705>" + deltaz + "<dev string:x6d0>" + 208 );
        }
    #/
    
    walldir = undefined;
    
    while ( isdefined( var_767e71695667e555 ) )
    {
        self.wall_info.nodeoffsets[ numnodes ] = var_767e71695667e555.origin - self.origin;
        numnodes++;
        var_1201543d3f39d723 = utility::getstruct( var_767e71695667e555.target, "targetname" );
        assert( isdefined( var_1201543d3f39d723 ) );
        
        /#
            dist = distance( var_767e71695667e555.origin, var_1201543d3f39d723.origin );
            
            if ( dist > 544 )
            {
                println( "<dev string:x732>" + var_767e71695667e555.origin + "<dev string:x756>" + dist + "<dev string:x6d0>" + 544 );
            }
            
            walldir = vectornormalize( var_1201543d3f39d723.origin - var_767e71695667e555.origin );
            dirtowall = var_767e71695667e555.origin - self.origin;
            dirtowall = ( dirtowall[ 0 ], dirtowall[ 1 ], 0 );
            dirtowall = vectornormalize( dirtowall );
            dotprod = vectordot( walldir, dirtowall );
            
            if ( dotprod < 0 )
            {
                println( "<dev string:x771>" + self.origin + "<dev string:x796>" );
            }
        #/
        
        utility::deletestruct_ref( var_767e71695667e555 );
        var_767e71695667e555 = var_1201543d3f39d723;
        assert( isdefined( var_767e71695667e555 ) );
        self.wall_info.nodeoffsets[ numnodes ] = var_767e71695667e555.origin - self.origin;
        numnodes++;
        
        if ( isdefined( var_767e71695667e555.target ) )
        {
            temp = utility::getstruct( var_767e71695667e555.target, "targetname" );
        }
        else
        {
            temp = undefined;
        }
        
        utility::deletestruct_ref( var_767e71695667e555 );
        var_767e71695667e555 = temp;
        
        /#
            if ( !isdefined( var_767e71695667e555 ) )
            {
                traversalendnode = getnode( self.target, #targetname );
                assert( isdefined( traversalendnode ) );
                assert( isdefined( walldir ) );
                dirtoendnode = traversalendnode.origin - var_1201543d3f39d723.origin;
                dirtoendnode = ( dirtoendnode[ 0 ], dirtoendnode[ 1 ], 0 );
                dirtoendnode = vectornormalize( dirtoendnode );
                dotprod = vectordot( dirtoendnode, walldir );
                
                if ( dotprod < 0 )
                {
                    println( "<dev string:x771>" + self.origin + "<dev string:x7c0>" );
                }
                
                dist = distance( var_1201543d3f39d723.origin, traversalendnode.origin );
                
                if ( dist > 512 )
                {
                    println( "<dev string:x771>" + self.origin + "<dev string:x808>" + dist + "<dev string:x6d0>" + 512 );
                }
            }
        #/
        
        if ( isdefined( var_767e71695667e555 ) && isdefined( var_767e71695667e555.script_wallrun_type ) )
        {
            if ( var_767e71695667e555.script_wallrun_type == "wallrun_mantle" )
            {
                /#
                    dist = distance( var_1201543d3f39d723.origin, var_767e71695667e555.origin );
                    deltaz = var_767e71695667e555.origin[ 2 ] - var_1201543d3f39d723.origin[ 2 ];
                    
                    if ( deltaz > 0 )
                    {
                        if ( dist > 420 )
                        {
                            println( "<dev string:x83a>" + var_767e71695667e555.origin + "<dev string:x882>" + dist + "<dev string:x6d0>" + 420 );
                        }
                        
                        if ( deltaz > 200 )
                        {
                            println( "<dev string:x894>" + var_767e71695667e555.origin + "<dev string:x8c3>" + deltaz + "<dev string:x6d0>" + 200 );
                        }
                    }
                    else if ( dist > 512 )
                    {
                        println( "<dev string:x8f3>" + var_767e71695667e555.origin + "<dev string:x882>" + dist + "<dev string:x6d0>" + 512 );
                    }
                #/
                
                self.wall_info.mantleoffset = var_767e71695667e555.origin - self.origin;
                
                if ( isdefined( var_767e71695667e555.angles ) )
                {
                    self.wall_info.mantleangles = var_767e71695667e555.angles;
                }
                
                utility::deletestruct_ref( var_767e71695667e555 );
                break;
            }
            
            if ( var_767e71695667e555.script_wallrun_type == "wallrun_vault" )
            {
                self.wall_info.mantleoffset = var_767e71695667e555.origin - self.origin;
                self.wall_info.bvaultover = 1;
                
                /#
                    deltaz = var_767e71695667e555.origin[ 2 ] - var_1201543d3f39d723.origin[ 2 ];
                    
                    if ( deltaz > 164 )
                    {
                        println( "<dev string:x93b>" + var_767e71695667e555.origin + "<dev string:x8c3>" + deltaz + "<dev string:x6d0>" + 164 );
                    }
                #/
                
                utility::deletestruct_ref( var_767e71695667e555 );
                break;
            }
        }
    }
}

// Namespace asm
// Params 1
// Checksum 0x53abefdf, Offset: 0x4f56
// Size: 0xe8
function function_1ac102ffa6ca2786( target )
{
    self.walk_nodes = [];
    self.walk_nodes[ self.walk_nodes.size ] = self.origin;
    
    for ( currentgoal = target; isdefined( currentgoal ) ; currentgoal = undefined )
    {
        self.walk_nodes[ self.walk_nodes.size ] = currentgoal.origin;
        
        if ( isdefined( currentgoal.target ) )
        {
            currentgoal = utility::getstruct( currentgoal.target, "targetname" );
            continue;
        }
    }
    
    end_node = getnode( self.target, #targetname );
    
    if ( isdefined( end_node ) )
    {
        self.walk_nodes[ self.walk_nodes.size ] = end_node.origin;
    }
    
    self.traverse_height = 0;
}

// Namespace asm
// Params 1
// Checksum 0xed3e4748, Offset: 0x5046
// Size: 0x25a
function function_10f85acdeccd847f( target )
{
    assert( isdefined( target ) );
    self.wall_nodes = [];
    self.wall_angles = [];
    self.var_62d0d61e122d910 = [];
    var_e154fb7c68162084 = 10;
    var_c4fc7876bc56e462 = 12;
    var_1d85dff58a96d23c = 10;
    var_9c8376fad05b0e33 = 8;
    contents = trace::create_contents( 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0 );
    currentgoal = target;
    
    while ( isdefined( currentgoal ) )
    {
        upvec = anglestoup( currentgoal.angles );
        var_b1a02f9b65f21f23 = currentgoal.origin + upvec * var_c4fc7876bc56e462;
        endwalltracepos = currentgoal.origin + -1 * upvec * var_c4fc7876bc56e462;
        walltrace = physics_raycast( var_b1a02f9b65f21f23, endwalltracepos, trace::create_world_contents(), [], 0, "physicsquery_closest" );
        
        if ( isdefined( walltrace[ 0 ][ "position" ] ) )
        {
            self.wall_nodes[ self.wall_nodes.size ] = walltrace[ 0 ][ "position" ] + upvec * var_1d85dff58a96d23c;
        }
        else
        {
            self.wall_nodes[ self.wall_nodes.size ] = currentgoal.origin + -1 * upvec * var_9c8376fad05b0e33;
        }
        
        self.wall_angles[ self.wall_angles.size ] = currentgoal.angles;
        
        if ( isdefined( currentgoal.var_755f0cc0b4d3c984 ) )
        {
            self.var_62d0d61e122d910[ self.var_62d0d61e122d910.size ] = currentgoal.var_755f0cc0b4d3c984;
        }
        else
        {
            self.var_62d0d61e122d910[ self.var_62d0d61e122d910.size ] = var_e154fb7c68162084;
        }
        
        oldgoal = currentgoal;
        
        if ( isdefined( currentgoal.target ) )
        {
            currentgoal = utility::getstruct( currentgoal.target, "targetname" );
        }
        else
        {
            currentgoal = undefined;
        }
        
        utility::deletestruct_ref( oldgoal );
    }
    
    assert( self.wall_nodes.size >= 2 && self.wall_nodes.size == self.var_62d0d61e122d910.size );
    self.traverse_height = 0;
}

// Namespace asm
// Params 2
// Checksum 0xd1a84cbd, Offset: 0x52a8
// Size: 0x2e4
function function_5f6e47af34199e3a( begin_pos, end_pos )
{
    apex_pos = undefined;
    var_65f47ffeffc8a0de = begin_pos;
    var_3936869aa8ae49d6 = end_pos;
    var_fc77e113f1f988eb = utility::flatten_vector( end_pos - begin_pos );
    delta_z = abs( end_pos[ 2 ] - begin_pos[ 2 ] );
    start_z = min( begin_pos[ 2 ], end_pos[ 2 ] );
    current_z = max( begin_pos[ 2 ], end_pos[ 2 ] ) + 1;
    begin_pos = ( begin_pos[ 0 ], begin_pos[ 1 ], current_z );
    end_pos = ( end_pos[ 0 ], end_pos[ 1 ], current_z );
    trace_end = physicstrace( begin_pos, end_pos );
    var_e4890a00d660c30f = 0.01;
    dist = distance2dsquared( trace_end, end_pos );
    
    if ( dist < var_e4890a00d660c30f )
    {
        if ( var_65f47ffeffc8a0de[ 2 ] < var_3936869aa8ae49d6[ 2 ] )
        {
            temp_pos = begin_pos;
            begin_pos = end_pos;
            end_pos = temp_pos;
        }
        
        iteration_limit = 3;
        cliff_pos = begin_pos;
        mid_point = undefined;
        var_e4fcddb41dacefb8 = undefined;
        
        for ( i = 0; i < iteration_limit ; i++ )
        {
            mid_point = averagepoint( [ begin_pos, end_pos ] );
            pit_height = 20;
            var_2709bf035525ea1d = mid_point - ( 0, 0, pit_height );
            trace_end = physicstrace( mid_point, var_2709bf035525ea1d );
            var_66b1882ab25c63a = vectordot( vectornormalize( begin_pos - trace_end ), vectornormalize( end_pos - trace_end ) );
            
            if ( trace_end == var_2709bf035525ea1d )
            {
                end_pos = mid_point;
                var_e4fcddb41dacefb8 = mid_point;
                continue;
            }
            
            begin_pos = mid_point;
            cliff_pos = trace_end;
        }
        
        if ( isdefined( var_e4fcddb41dacefb8 ) )
        {
            var_99cbc7d598ae5812 = ( var_e4fcddb41dacefb8[ 0 ], var_e4fcddb41dacefb8[ 1 ], cliff_pos[ 2 ] - 1 );
            apex_pos = physicstrace( var_99cbc7d598ae5812, cliff_pos );
            apex_pos = ( apex_pos[ 0 ], apex_pos[ 1 ], min( apex_pos[ 2 ], mid_point[ 2 ] ) );
        }
        else
        {
            apex_pos = ( cliff_pos[ 0 ], cliff_pos[ 1 ], min( cliff_pos[ 2 ], mid_point[ 2 ] ) );
        }
    }
    else
    {
        found_top = 0;
        var_2f7ef091f69eb90b = trace_end;
        iteration_limit = 10;
        iteration_index = 0;
        var_b9471e547535555 = 15;
        
        while ( !found_top && iteration_index < iteration_limit )
        {
            current_z += var_b9471e547535555;
            begin_pos = ( begin_pos[ 0 ], begin_pos[ 1 ], current_z );
            end_pos = ( end_pos[ 0 ], end_pos[ 1 ], current_z );
            trace_end = physicstrace( begin_pos, end_pos );
            
            if ( distance2dsquared( trace_end, end_pos ) < var_e4890a00d660c30f )
            {
                found_top = 1;
            }
            else
            {
                var_2f7ef091f69eb90b = trace_end;
            }
            
            iteration_index++;
        }
        
        if ( found_top )
        {
            above_top = var_2f7ef091f69eb90b + var_fc77e113f1f988eb + ( 0, 0, var_b9471e547535555 );
            apex_pos = physicstrace( above_top, above_top - ( 0, 0, var_b9471e547535555 ) );
        }
        
        /#
            if ( !isdefined( apex_pos ) )
            {
                println( "<dev string:x969>" + iteration_limit + "<dev string:x9b8>" + begin_pos );
            }
        #/
    }
    
    return apex_pos;
}

// Namespace asm
// Params 3
// Checksum 0x5d00e648, Offset: 0x5595
// Size: 0x31
function function_1b867cf5be4cf0b( asmname, statename, params )
{
    self notify( "agent_scene_stop" );
    self clearoverridearchetype( "animscript" );
}

// Namespace asm
// Params 1
// Checksum 0x17bd8531, Offset: 0x55ce
// Size: 0xd9, Type: bool
function function_85622bf0cacb63d6( door )
{
    if ( door scriptableisdoor() && door scriptabledoorisclosed() )
    {
        return false;
    }
    
    curstate = door getscriptablepartstate( "door", 1 );
    assert( isdefined( curstate ) );
    
    if ( curstate == "closed" || curstate == "setup" )
    {
        return false;
    }
    
    doortome = self.origin - door.origin;
    var_a0dfb0032303fa04 = vectortoyaw( doortome );
    doorclosedangles = door function_9ae4daa2a11c58bd();
    anglediff = angleclamp180( var_a0dfb0032303fa04 - doorclosedangles[ 1 ] );
    openangle = angleclamp180( door.angles[ 1 ] - doorclosedangles[ 1 ] );
    return anglediff * openangle > 0;
}

// Namespace asm
// Params 1
// Checksum 0x6b6e85f5, Offset: 0x56b0
// Size: 0x3b
function function_a4a0d4a33b623013( door )
{
    assert( isdefined( self._blackboard.doorpos ) );
    return self._blackboard.doorpos;
}

/#

    // Namespace asm
    // Params 0
    // Checksum 0x5cf0646a, Offset: 0x56f4
    // Size: 0x50, Type: dev
    function deprecatedtraversethink()
    {
        wait 0.05;
        println( "<dev string:x9d4>" + self.origin );
        
        if ( getdvarint( @"hash_60bc1b675216e3d" ) )
        {
            while ( true )
            {
                print3d( self.origin, "<dev string:xa19>" );
                wait 0.05;
            }
        }
    }

    // Namespace asm
    // Params 1
    // Checksum 0xe21bbb17, Offset: 0x574c
    // Size: 0x60, Type: dev
    function validatetraverse( traverse )
    {
        return traverse == "<dev string:xa31>" || traverse == "<dev string:xa45>" || traverse == "<dev string:xa5b>" || traverse == "<dev string:xa71>" || traverse == "<dev string:xa89>" || traverse == "<dev string:xaa3>" || traverse == "<dev string:xab6>";
    }

    // Namespace asm
    // Params 0
    // Checksum 0xf931c5df, Offset: 0x57b4
    // Size: 0x264, Type: dev
    function validatetraversenodes()
    {
        println( "<dev string:xac7>" );
        
        foreach ( t in getnodearray( "<dev string:xae6>", #targetname ) )
        {
            if ( !validatetraverse( t.animscript ) )
            {
                continue;
            }
            
            if ( getdvarint( @"hash_96f0961c5045c40f", 1 ) != 0 )
            {
                if ( !t.var_213a703686d12d7a )
                {
                    function_83faa08e56039deb( t );
                }
            }
            
            s = 20;
            
            while ( s < 280 )
            {
                yaw = -180;
                
                while ( yaw <= 180 )
                {
                    featurearray = [];
                    featurearray[ "<dev string:xaf2>" ] = t.traverse_height_delta;
                    featurearray[ "<dev string:xafc>" ] = t.traverse_drop_height_delta;
                    featurearray[ "<dev string:xb0b>" ] = yaw;
                    featurearray[ "<dev string:xb1a>" ] = s;
                    
                    if ( t.animscript == "<dev string:xa71>" )
                    {
                        featurearray[ "<dev string:xb23>" ] = length2d( t.across_delta );
                    }
                    
                    alias = level animselector::selectanim( t.animscript, featurearray, 0 );
                    
                    if ( alias == "<dev string:xb2d>" )
                    {
                        nodestring = "<dev string:xb38>";
                        nodestring = nodestring + "<dev string:xb78>" + t.animscript;
                        nodestring = nodestring + "<dev string:xb83>" + t.origin;
                        nodestring = nodestring + "<dev string:xb8f>" + t.traverse_height_delta;
                        nodestring = nodestring + "<dev string:xb9f>" + t.traverse_drop_height_delta;
                        nodestring = nodestring + "<dev string:xbad>" + s;
                        nodestring = nodestring + "<dev string:xbbc>" + yaw;
                        
                        if ( t.animscript == "<dev string:xa71>" )
                        {
                            nodestring = nodestring + "<dev string:xbc9>" + length2d( t.across_delta );
                        }
                        
                        nodestring += "<dev string:xbd9>";
                        println( nodestring );
                    }
                    
                    yaw += 15;
                }
                
                waitframe();
                s += 10;
            }
        }
    }

    // Namespace asm
    // Params 0
    // Checksum 0x520d96e9, Offset: 0x5a20
    // Size: 0x14d, Type: dev
    function drawtraversaldata()
    {
        while ( true )
        {
            waitframe();
            
            if ( getdvarint( @"hash_c67513927ea56f3a", 0 ) <= 0 )
            {
                continue;
            }
            
            recorder_enabled = getdvarint( @"recorder_enablerec", 0 ) > 0;
            
            foreach ( t in getallnodes() )
            {
                if ( t.type == "<dev string:x674>" )
                {
                    if ( getdvarint( @"hash_96f0961c5045c40f", 1 ) != 0 )
                    {
                        if ( !t.var_213a703686d12d7a )
                        {
                            function_83faa08e56039deb( t );
                        }
                    }
                    
                    if ( isdefined( t.traverse_height ) )
                    {
                        apex_pos = t.origin + t.apex_delta;
                        
                        if ( recorder_enabled )
                        {
                            recordsphere( apex_pos, 15, ( 0.2, 1, 0 ) );
                            continue;
                        }
                        
                        sphere( apex_pos, 15, ( 0.2, 1, 0 ) );
                    }
                }
            }
        }
    }

    // Namespace asm
    // Params 0, eflags: 0x4
    // Checksum 0x87943f4f, Offset: 0x5b75
    // Size: 0x4d5, Type: dev
    function private function_29d96ec9eaf4d567()
    {
        level endon( "<dev string:xbdf>" );
        setdvarifuninitialized( @"hash_e42ac6b1ddb1188e", 0 );
        
        while ( true )
        {
            if ( getdvarint( @"hash_e42ac6b1ddb1188e", 0 ) <= 0 )
            {
                waitframe();
                continue;
            }
            
            break;
        }
        
        while ( !isalive( level.players[ 0 ] ) )
        {
            waitframe();
        }
        
        var_16df4c1521e68ea1 = spawnstruct();
        var_16df4c1521e68ea1.room_nodes = [];
        var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70 = [];
        level childthread function_ef87eba444c374a5( var_16df4c1521e68ea1 );
        iprintlnbold( "<dev string:xbed>" );
        room_index = 0;
        room_node = function_6fbfe82892eab250( room_index );
        room_node = { #origin:getclosestpointonnavmesh( room_node.origin ) };
        var_7483aac93b95a062 = 0;
        
        while ( isdefined( room_node ) )
        {
            var_86c8ef38c1d862ea = undefined;
            var_dd9d1d4ea45f231 = [];
            
            foreach ( var_68d4080c4f2559c in var_16df4c1521e68ea1.room_nodes )
            {
                can_pathfind = 0;
                dist = distance( room_node.origin, var_68d4080c4f2559c.origin );
                
                if ( dist > 4000 )
                {
                    continue;
                }
                
                if ( var_86c8ef38c1d862ea == var_68d4080c4f2559c.island_id )
                {
                    can_pathfind = 1;
                }
                else if ( !can_pathfind )
                {
                    path1 = findpathcustom( room_node.origin, var_68d4080c4f2559c.origin );
                    can_pathfind = function_368265f3dd2ea684( path1, var_68d4080c4f2559c.origin );
                    
                    if ( can_pathfind )
                    {
                        path2 = findpathcustom( var_68d4080c4f2559c.origin, room_node.origin );
                        can_pathfind = function_368265f3dd2ea684( path2, room_node.origin );
                    }
                }
                
                if ( can_pathfind )
                {
                    if ( !isdefined( var_86c8ef38c1d862ea ) )
                    {
                        var_86c8ef38c1d862ea = var_68d4080c4f2559c.island_id;
                    }
                    
                    var_86c8ef38c1d862ea = min( var_86c8ef38c1d862ea, var_68d4080c4f2559c.island_id );
                    var_dd9d1d4ea45f231[ var_dd9d1d4ea45f231.size ] = var_68d4080c4f2559c;
                }
            }
            
            foreach ( var_68d4080c4f2559c in var_dd9d1d4ea45f231 )
            {
                var_68d4080c4f2559c.island_id = int( var_86c8ef38c1d862ea );
            }
            
            var_16df4c1521e68ea1.room_nodes[ var_16df4c1521e68ea1.room_nodes.size ] = room_node;
            
            if ( !isdefined( var_86c8ef38c1d862ea ) )
            {
                room_node.island_id = int( var_7483aac93b95a062 );
                var_7483aac93b95a062++;
            }
            else
            {
                room_node.island_id = int( var_86c8ef38c1d862ea );
            }
            
            room_index++;
            room_node = function_6fbfe82892eab250( room_index );
            
            if ( isdefined( room_node ) )
            {
                room_node = { #origin:getclosestpointonnavmesh( room_node.origin ) };
            }
            
            if ( room_index % 150 == 0 )
            {
                waitframe();
            }
        }
        
        foreach ( room_node in var_16df4c1521e68ea1.room_nodes )
        {
            if ( !isdefined( var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] ) )
            {
                var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] = 0;
            }
            
            var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] += 1;
        }
        
        waitframe();
        logstring( "<dev string:xc13>" );
        
        foreach ( room_node in var_16df4c1521e68ea1.room_nodes )
        {
            if ( var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] == 1 )
            {
                logstring( "<dev string:xc4f>" + room_node.origin );
            }
        }
        
        iprintlnbold( "<dev string:xc70>" );
    }

    // Namespace asm
    // Params 2, eflags: 0x4
    // Checksum 0xd33fca42, Offset: 0x6052
    // Size: 0x41, Type: dev
    function private function_368265f3dd2ea684( path, end_point )
    {
        if ( path.size > 0 )
        {
            dist = distance( path[ path.size - 1 ], end_point );
            return ( dist < 10 );
        }
        
        return 0;
    }

    // Namespace asm
    // Params 1, eflags: 0x4
    // Checksum 0x15f5241e, Offset: 0x609b
    // Size: 0x251, Type: dev
    function private function_ef87eba444c374a5( var_16df4c1521e68ea1 )
    {
        var_afc64bc64c4c9d95 = [];
        render_frames = int( ceil( 1 / level.framedurationseconds ) );
        
        while ( true )
        {
            if ( getdvarint( @"hash_e42ac6b1ddb1188e", 0 ) <= 0 )
            {
                waitframe();
                continue;
            }
            
            foreach ( room_node in var_16df4c1521e68ea1.room_nodes )
            {
                if ( !isdefined( var_afc64bc64c4c9d95[ room_node.island_id ] ) )
                {
                    var_afc64bc64c4c9d95[ room_node.island_id ] = ( randomfloat( 1 ), randomfloat( 1 ), randomfloat( 1 ) );
                }
                
                col = var_afc64bc64c4c9d95[ room_node.island_id ];
                alpha = 1;
                
                if ( isdefined( var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] ) )
                {
                    if ( var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] == 1 )
                    {
                        line( room_node.origin, room_node.origin + ( 0, 0, 4000 ), col, undefined, 0, render_frames );
                        sphere( room_node.origin + ( 0, 0, 4000 ), 500, col, 1, render_frames );
                    }
                    else if ( var_16df4c1521e68ea1.var_4c1eb3cfe83f0e70[ room_node.island_id ] > 50 )
                    {
                        alpha = 0.5;
                        
                        if ( distance( room_node.origin, level.players[ 0 ].origin ) > 2000 )
                        {
                            continue;
                        }
                    }
                }
                
                sphere( room_node.origin, 20, col, 0, render_frames );
                print3d( room_node.origin + ( 0, 0, 10 ), "<dev string:xc9f>" + room_node.island_id, col, alpha, undefined, render_frames );
            }
            
            wait 1;
        }
    }

#/

// Namespace asm
// Params 0
// Checksum 0x7ba4c87b, Offset: 0x62f4
// Size: 0x36
function freeze_ai()
{
    self.default_animrate = function_27be172b46a89235();
    function_d82cb83c9c260d49( 1e-06 );
    function_24133a663bba593c();
    self.aifrozen = 1;
    self setlookatenabled( 0 );
}

// Namespace asm
// Params 0
// Checksum 0x83f7d5be, Offset: 0x6332
// Size: 0x38
function unfreeze_ai()
{
    if ( isdefined( self.default_animrate ) )
    {
        function_d82cb83c9c260d49( self.default_animrate );
        function_24133a663bba593c();
    }
    
    self.aifrozen = 0;
    self setlookatenabled( 1 );
}

