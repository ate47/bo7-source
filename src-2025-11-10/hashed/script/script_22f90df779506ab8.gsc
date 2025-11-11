#using script_26f456dbdf9aa216;
#using scripts\asm\cap;
#using scripts\common\cap;
#using scripts\engine\utility;

#namespace coverfire;

// Namespace coverfire
// Params 1
// Checksum 0x19e274aa, Offset: 0x209
// Size: 0x110
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_99e614e786e54290":
            return &askforcoverfire;
        case #"hash_58cdde322b1d5c53":
            return &acknowledge;
        case #"hash_99efb042f2d3bcd8":
            return &changecover;
        case #"hash_713dc5b1c250d91c":
            return &coveringfire;
        case #"hash_a3836dc7307ecb50":
            return &coveringfirecleanup;
        case #"hash_80804c8d4d60b774":
            return &namespace_f9e15975f25db152::function_f5f982ce9e32c830;
        case #"hash_e345e196d91640b5":
            return &waitforbackup;
        case #"hash_ebecb858f57398a5":
            return &function_ae52034c879574e8;
        case #"hash_72afbfa1ff115f7b":
            return &gohide;
        case #"hash_3a1541c3369e831c":
            return &clearandpausepath;
        case #"hash_e0740123af2138d0":
            return &doresumepath;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace coverfire
// Params 1
// Checksum 0x7e792721, Offset: 0x321
// Size: 0x2a
function onuserinit( interactionid )
{
    self.bulletsinclip = weaponclipsize( self.weapon );
    self function_79425128a4b03dfe( 1 );
}

// Namespace coverfire
// Params 1
// Checksum 0x701abf41, Offset: 0x353
// Size: 0x27
function waitforcooldown( target )
{
    self endon( "death", "coverfire_cooldown_completed" );
    target endon( "death", "coverfire_cooldown_completed" );
}

// Namespace coverfire
// Params 1
// Checksum 0xb89c1d8a, Offset: 0x382
// Size: 0xf2
function onuserterminate( interactionid )
{
    self function_79425128a4b03dfe( 0 );
    self clearbtgoal( 1 );
    self.maxfaceenemydist = 300;
    self aiclearscriptdesiredspeed();
    self notify( "endcoverfire" );
    self.keepclaimednode = 0;
    self.shootstyleoverride = undefined;
    self.var_fccfc00935827567 = 0;
    self.var_911e12c7cc4a33c1 = 0;
    
    if ( utility::is_dead_or_dying( self ) )
    {
        function_dd518df9ee8d217c( interactionid, "death", 1 );
    }
    
    if ( !getdvarint( @"hash_14b2e1d1e450bdd5", 0 ) || !getdvarint( @"hash_39e8da7ee4a82193", 0 ) )
    {
        return;
    }
    
    thread waitforcooldown( self );
    
    if ( isdefined( self.var_c2f50f5982356ebf ) )
    {
        self.var_c2f50f5982356ebf thread waitforcooldown( self );
        self.var_c2f50f5982356ebf = undefined;
    }
    
    if ( isdefined( self.var_600056ad41b5b0e4 ) )
    {
        thread waitforcooldown( self.var_600056ad41b5b0e4 );
        self.var_600056ad41b5b0e4 = undefined;
    }
}

// Namespace coverfire
// Params 2
// Checksum 0xc051751b, Offset: 0x47c
// Size: 0x15
function waitforbackup( statename, params )
{
    
}

// Namespace coverfire
// Params 2
// Checksum 0x4feaebdc, Offset: 0x499
// Size: 0x57
function askforcoverfire( statename, params )
{
    other = function_1eb65c7d78445b4a();
    
    if ( !isdefined( other ) )
    {
        return;
    }
    
    self endon( "death" );
    other endon( "death" );
    self pausepath();
    self clearpath();
    self.keepclaimednode = 1;
}

// Namespace coverfire
// Params 2
// Checksum 0xf58dd968, Offset: 0x4f8
// Size: 0xc7
function acknowledge( statename, params )
{
    other = function_1eb65c7d78445b4a();
    
    if ( !isdefined( other ) )
    {
        return;
    }
    
    self endon( "death" );
    other endon( "death" );
    self.bulletsinclip = weaponclipsize( self.weapon );
    capinfo = getcapinfoforparticipant( self );
    capname = capinfo.capname;
    animset = capinfo.animation;
    
    if ( isdefined( capname ) && isdefined( capinfo ) && isdefined( animset ) )
    {
        cap::cap_start( capname, animset );
    }
    else
    {
        cap::cap_start( "cap_coverfire", "caps/interactions/cap_coverfire" );
    }
    
    self waittill( "cap_exit_completed" );
}

// Namespace coverfire
// Params 2
// Checksum 0xa4767ec7, Offset: 0x5c7
// Size: 0x98
function coveringfire( statename, params )
{
    self.maxfaceenemydistcache = self.maxfaceenemydist;
    self.maxfaceenemydist = 2048;
    var_689157bc40450e50 = 3000;
    var_819551943d7cf102 = gettime() + 10000;
    self.var_fccfc00935827567 = 0;
    self.balwayscoverexposed = 1;
    self.providecoveringfire = 1;
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.shootstyleoverride = "full";
}

// Namespace coverfire
// Params 2
// Checksum 0x9e218abc, Offset: 0x667
// Size: 0x59
function coveringfirecleanup( statename, params )
{
    self.maxfaceenemydist = self.maxfaceenemydistcache;
    self.maxfaceenemydistcache = undefined;
    self.balwayscoverexposed = 0;
    self.providecoveringfire = 0;
    self.var_911e12c7cc4a33c1 = 0;
    self.shootstyleoverride = undefined;
}

// Namespace coverfire
// Params 2
// Checksum 0xf1b20935, Offset: 0x6c8
// Size: 0x2f
function changecover( statename, params )
{
    self endon( "death" );
    self endon( "endcoverfire" );
    self.keepclaimednode = 0;
}

// Namespace coverfire
// Params 1
// Checksum 0x8052a847, Offset: 0x6ff
// Size: 0x20, Type: bool
function function_ae52034c879574e8( statename )
{
    return isdefined( self.covernode ) || !isalive( self );
}

// Namespace coverfire
// Params 2
// Checksum 0x32fa7f5e, Offset: 0x728
// Size: 0x2b
function gohide( statename, params )
{
    self.var_fccfc00935827567 = 1;
    self.var_911e12c7cc4a33c1 = 1;
}

// Namespace coverfire
// Params 2
// Checksum 0x730c7f6b, Offset: 0x75b
// Size: 0x21
function clearandpausepath( statename, params )
{
    self clearpath();
    self pausepath();
}

// Namespace coverfire
// Params 2
// Checksum 0x84742d52, Offset: 0x784
// Size: 0x1b
function doresumepath( statename, params )
{
    self resumepath();
}

// Namespace coverfire
// Params 4
// Checksum 0xdabb53e, Offset: 0x7a7
// Size: 0x6c
function dodelay( interval, func, param, bool )
{
    time = gettime() + interval;
    
    while ( gettime() < time )
    {
        if ( !isdefined( bool ) )
        {
            waitframe();
        }
        
        if ( isdefined( func ) )
        {
            if ( isdefined( param ) )
            {
                self [[ func ]]( param );
                continue;
            }
            
            self [[ func ]]();
        }
    }
}

// Namespace coverfire
// Params 0
// Checksum 0xfd34f654, Offset: 0x81b
// Size: 0x13d
function function_1eb65c7d78445b4a()
{
    other = undefined;
    users = getbsequsers( self getinteractionid() );
    
    if ( users.size == 2 )
    {
        if ( users[ 0 ] == self )
        {
            other = users[ 1 ];
        }
        else
        {
            other = users[ 0 ];
        }
        
        return other;
    }
    
    var_9e3e624d8883e714 = self function_2e50bdd9495d2b8c();
    var_b3a5b7a830ced38 = isdefined( var_9e3e624d8883e714 );
    interactionid = self getinteractionid();
    users = getbsequsers( interactionid );
    
    if ( users.size > 0 )
    {
        foreach ( user in users )
        {
            othertag = user function_2e50bdd9495d2b8c();
            var_bb3349036d5bdc6 = var_9e3e624d8883e714 == othertag;
            
            if ( var_bb3349036d5bdc6 )
            {
                continue;
            }
            
            if ( var_b3a5b7a830ced38 )
            {
                if ( !var_bb3349036d5bdc6 && othertag != "extra" )
                {
                    other = user;
                    break;
                }
                
                continue;
            }
            
            if ( self != user )
            {
                other = user;
                break;
            }
        }
    }
    
    return other;
}

// Namespace coverfire
// Params 3
// Checksum 0x5767e954, Offset: 0x961
// Size: 0xee
function function_1b287ff03ab61b36( asmname, statename, params )
{
    other = function_1eb65c7d78445b4a();
    var_d0462464cf69decf = other.origin - self.origin;
    var_d1e281958c2a817e = vectortoyaw( var_d0462464cf69decf );
    anglediff = angleclamp180( self.angles[ 1 ], var_d1e281958c2a817e );
    var_dcb72ee798303cb6 = "";
    
    if ( anglediff > 135 )
    {
        var_dcb72ee798303cb6 = "2r";
    }
    else if ( anglediff < -135 )
    {
        var_dcb72ee798303cb6 = "2l";
    }
    else if ( anglediff > 0 && anglediff <= 135 )
    {
        var_dcb72ee798303cb6 = "6";
    }
    else
    {
        var_dcb72ee798303cb6 = "4";
    }
    
    turnanim = asm_cap::cap_lookupanimfromalias( statename, statename + "_" + var_dcb72ee798303cb6 );
    return turnanim;
}

