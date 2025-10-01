#using scripts\anim\notetracks;
#using scripts\anim\shared;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace death;

// Namespace death
// Params 3
// Checksum 0xada397cb, Offset: 0x1b5
// Size: 0x606
function playdeathanimcommon( asmname, statename, params )
{
    callback::callback( #"hash_f072e7c8a0d1d087", { #params:params, #statename:statename, #asmname:asmname } );
    stop_sounds();
    self stoplookat();
    
    if ( isdefined( self.fnasm_clearfingerposes ) )
    {
        self [[ self.fnasm_clearfingerposes ]]();
    }
    
    if ( isdefined( self.fnachievements ) )
    {
        self thread [[ self.fnachievements ]]();
    }
    
    self.disabledeathorient = !( isdefined( self.a ) && self.a.nodeath ) || self.noragdoll;
    
    if ( isdefined( self.a ) && self.a.nodeath )
    {
        deathcleanup();
        return;
    }
    
    bexplosivedamage = utility::wasdamagedbyexplosive();
    
    if ( !isdefined( self.skipdeathanim ) )
    {
        self aiclearanim( asm::asm_getroot(), 0.3 );
    }
    
    if ( isdefined( self.asm.deathfunc ) )
    {
        self [[ self.asm.deathfunc ]]();
        
        if ( !isdefined( self.deathfunction ) )
        {
            deathcleanup();
            return;
        }
    }
    
    if ( isdefined( self.deathfunction ) )
    {
        result = self [[ self.deathfunction ]]();
        
        if ( !isdefined( result ) )
        {
            result = 1;
        }
        
        if ( result )
        {
            deathcleanup();
            return;
        }
    }
    
    if ( isdefined( self.ragdoll_immediate ) || self.forceragdollimmediate )
    {
        if ( isagent( self ) )
        {
            return;
        }
        
        if ( isdefined( self.doantigravgrenaderagdoll ) && self.doantigravgrenaderagdoll )
        {
            self animmode( "noclip" );
        }
        else if ( self.nogravityragdoll )
        {
            self animmode( "nogravity" );
        }
        else
        {
            self animmode( "gravity" );
        }
        
        doimmediateragdolldeath();
        
        if ( !isdefined( self ) )
        {
            return;
        }
    }
    
    self endon( "entitydeleted" );
    deathanimdata = undefined;
    deathanim = undefined;
    deathxanim = undefined;
    assert( isdefined( self.deathalias ) && isdefined( self.deathstate ) || !isdefined( self.deathalias ) && !isdefined( self.deathstate ), "<dev string:x24>" );
    var_d3a64e06f02a5698 = isdefined( self.deathalias ) && isdefined( self.deathstate );
    
    if ( !isdefined( self.skipdeathanim ) || self.diedintransition )
    {
        deathanimdata = getdeathanimdata( asmname, statename, params );
        assert( isdefined( deathanimdata ) && deathanimdata.size == 2 );
        deathanim = deathanimdata[ 0 ];
        deathxanim = deathanimdata[ 1 ];
        self.deathanimduration = int( getanimlength( deathxanim ) * 1000 );
        directional_orient = params == "directional_orient";
        
        if ( self.disabledeathdirectionalorient )
        {
            directional_orient = 0;
        }
        
        if ( isnumber( deathanim ) )
        {
            if ( var_d3a64e06f02a5698 )
            {
                self aisetanim( self.deathstate, deathanim );
            }
            else
            {
                self aisetanim( statename, deathanim );
            }
        }
        else
        {
            assert( utility::issp(), "<dev string:x6c>" );
            bodyknob = asm::asm_getinnerrootknob();
            self clearanim( bodyknob, 0.05 );
            self setflaggedanimknoballrestart( statename, deathanim, bodyknob, 1, 0.05 );
        }
        
        if ( var_d3a64e06f02a5698 )
        {
            asm::asm_playfacialanim( asmname, self.deathstate, deathxanim );
        }
        else
        {
            asm::asm_playfacialanim( asmname, statename, deathxanim );
        }
    }
    
    if ( isdefined( self.deathanimmode ) )
    {
        self animmode( self.deathanimmode );
    }
    
    if ( isdefined( self.skipdeathanim ) )
    {
        assert( self.skipdeathanim, "<dev string:x97>" );
        
        if ( !isdefined( self.noragdoll ) )
        {
            if ( isdefined( self.fnpreragdoll ) )
            {
                self [[ self.fnpreragdoll ]]();
            }
            
            if ( !isdefined( self ) )
            {
                return;
            }
            
            self startragdoll();
        }
        
        if ( !isagent( self ) )
        {
            wait 0.05;
            
            if ( !isdefined( self ) )
            {
                return;
            }
            
            self animmode( "gravity" );
        }
    }
    else if ( isdefined( self.ragdolltime ) )
    {
        thread waitforragdoll( self.ragdolltime );
    }
    else if ( getdvarint( @"hash_8c30a87f78a7d97e" ) == 1 )
    {
        thread startragdollwithoutwait();
    }
    else
    {
        if ( !isdefined( deathanimdata ) )
        {
            deathanimdata = getdeathanimdata( asmname, statename, params );
        }
        
        assert( isdefined( deathanimdata ) && deathanimdata.size == 2 );
        deathanim = deathanimdata[ 0 ];
        deathxanim = deathanimdata[ 1 ];
        ragdollnotetracks = getnotetracktimes( deathxanim, "start_ragdoll" );
        var_b316835018fa6055 = !var_d3a64e06f02a5698 && !isdefined( self.deathanim ) && ( ragdollnotetracks.size == 0 || ragdollnotetracks[ 0 ] > 0.5 );
        
        if ( var_b316835018fa6055 )
        {
            if ( self.damagemod == "MOD_MELEE" )
            {
                ragdollscaler = 0.7;
            }
            else
            {
                ragdollscaler = 0.35;
            }
            
            thread waitforragdoll( getanimlength( deathxanim ) * ragdollscaler );
        }
    }
    
    self endon( "terminate_death_thread" );
    
    if ( !isagent( self ) )
    {
        if ( isdefined( self.skipdeathanim ) && !self.diedintransition )
        {
            wait 0.05;
        }
        else
        {
            notestatename = statename;
            
            if ( var_d3a64e06f02a5698 )
            {
                notestatename = self.deathstate;
            }
            
            asm::asm_donotetracks( asmname, notestatename, &deathnotetracks );
        }
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self notify( "endPlayDeathAnim" );
    
    if ( !isagent( self ) )
    {
        if ( isdefined( self.ragdoll_immediate ) || self.forceragdollimmediate )
        {
            wait 0.5;
            
            if ( !isdefined( self ) )
            {
                return;
            }
            
            self aisetanimrate( asm::asm_getroot(), 0 );
        }
    }
    
    deathcleanup();
}

// Namespace death
// Params 1
// Checksum 0xe193124b, Offset: 0x7c3
// Size: 0x15
function deathnotetracks( note )
{
    notetracks::notetrack_prefix_handler( note );
}

// Namespace death
// Params 3
// Checksum 0x2fd7d9b0, Offset: 0x7e0
// Size: 0x112
function getdeathanimdata( asmname, statename, params )
{
    assert( isdefined( self.deathalias ) && isdefined( self.deathstate ) || !isdefined( self.deathalias ) && !isdefined( self.deathstate ), "<dev string:x24>" );
    var_d3a64e06f02a5698 = isdefined( self.deathalias ) && isdefined( self.deathstate );
    
    if ( isdefined( self.deathanim ) )
    {
        deathanim = self.deathanim;
        deathxanim = asm::asm_getxanim( statename, deathanim );
    }
    else if ( var_d3a64e06f02a5698 )
    {
        deathanim = asm::asm_lookupanimfromalias( self.deathstate, self.deathalias );
        deathxanim = asm::asm_getxanim( self.deathstate, deathanim );
    }
    else
    {
        deathanim = asm::asm_getanim( asmname, statename, params );
        deathxanim = asm::asm_getxanim( statename, deathanim );
    }
    
    return [ deathanim, deathxanim ];
}

// Namespace death
// Params 0
// Checksum 0x4e066be8, Offset: 0x8fb
// Size: 0x26
function stop_sounds()
{
    self stopsoundchannel( "voice_bchatter_1_3d" );
    self stopsoundchannel( "voice_air_3d" );
    utility::disabledefaultfacialanims( 0 );
    self stoploopsound();
}

// Namespace death
// Params 0
// Checksum 0xac6d73bf, Offset: 0x929
// Size: 0x69
function deathcleanup()
{
    if ( self.skipdeathcleanup )
    {
        return;
    }
    
    asm_bb::bb_clearmeleetarget();
    self notify( "terminate_ai_threads" );
    
    if ( isagent( self ) )
    {
        return;
    }
    
    numattempts = 3;
    
    while ( isdefined( self ) && self.script != "death" && numattempts > 0 )
    {
        numattempts--;
        wait 0.05;
    }
    
    self notify( "killanimscript" );
}

// Namespace death
// Params 0
// Checksum 0x2a2f7f61, Offset: 0x99a
// Size: 0x1fe
function doimmediateragdolldeath()
{
    if ( isdefined( self.weapon ) )
    {
        shared::dropallaiweapons();
    }
    
    self.skipdeathanim = 1;
    
    if ( isdefined( self.fnpreragdoll ) )
    {
        self [[ self.fnpreragdoll ]]();
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( self.vehicle_idling )
    {
        return;
    }
    
    initialimpulse = 10;
    damagetype = utility::getdamagetype( self.damagemod );
    
    if ( self.attacker == level.player && damagetype == "melee" )
    {
        initialimpulse = 5;
    }
    
    damagetaken = self.damagetaken;
    
    if ( damagetype == "bullet" || self.damagemod == "MOD_FIRE" )
    {
        damagetaken = min( damagetaken, 300 );
    }
    else
    {
        damagetaken = min( damagetaken, 5000 );
    }
    
    damagescale = initialimpulse * damagetaken;
    
    if ( isdefined( self.var_b9516fe6b0f7199f ) )
    {
        vector = self.var_b9516fe6b0f7199f;
    }
    else
    {
        directionup = min( 0.3, self.damagedir[ 2 ] );
        vector = ( self.damagedir[ 0 ], self.damagedir[ 1 ], directionup );
    }
    
    if ( isdefined( self.var_82c1f17065f8db32 ) )
    {
        vector *= self.var_82c1f17065f8db32;
    }
    else if ( isdefined( self.damageweapon ) && self.damageweapon.classname == "throwingknife" )
    {
        vector *= damagescale * 0.25;
    }
    else
    {
        vector *= damagescale;
    }
    
    if ( self.forceragdollimmediate )
    {
        vector += self.prevanimdelta * 20 * 10;
    }
    
    damagelocation = self.damagelocation;
    
    if ( damagelocation == "none" )
    {
        damagelocation = "torso_upper";
    }
    
    self startragdollfromimpact( damagelocation, vector );
    waitframe();
}

// Namespace death
// Params 1
// Checksum 0xa911f938, Offset: 0xba0
// Size: 0x6b
function waitforragdoll( time )
{
    wait time;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isagent( self ) )
    {
        return;
    }
    
    if ( isdefined( self ) && isdefined( self.weapon ) )
    {
        shared::dropallaiweapons();
    }
    
    if ( isdefined( self.fnpreragdoll ) )
    {
        self [[ self.fnpreragdoll ]]();
    }
    
    if ( isdefined( self ) && !self.noragdoll )
    {
        self startragdoll();
    }
}

// Namespace death
// Params 0
// Checksum 0xd4258440, Offset: 0xc13
// Size: 0x58
function startragdollwithoutwait()
{
    if ( isagent( self ) )
    {
        return;
    }
    
    if ( isdefined( self ) && isdefined( self.weapon ) )
    {
        shared::dropallaiweapons();
    }
    
    if ( isdefined( self.fnpreragdoll ) )
    {
        self [[ self.fnpreragdoll ]]();
    }
    
    if ( isdefined( self ) && !isdefined( self.noragdoll ) )
    {
        self startragdoll();
    }
}

