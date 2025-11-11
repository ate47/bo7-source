#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\damage;

#namespace namespace_bf400aa84aa4d031;

// Namespace namespace_bf400aa84aa4d031
// Params 0, eflags: 0x5
// Checksum 0x912bb06d, Offset: 0x2c5
// Size: 0x18
function private autoexec main()
{
    level callback::add( #"register_super", &function_afed2c92726ae0d6 );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x804d5984, Offset: 0x2e5
// Size: 0x86
function function_afed2c92726ae0d6( params )
{
    level callback::add( #"player_death", &function_381e3c9018e4e39a );
    level callback::add( #"player_disconnect", &function_91f07de9d1f88ab2 );
    utility::registersharedfunc( "gas_hallucination", #"hash_fafb93cf2eff0b4b", &function_190e9b395a23e44a );
    utility::registersharedfunc( "gas_hallucination", #"hash_f00f78b8f103a397", &function_81ce0d0c1e1afdea );
    utility::registersharedfunc( "gas_hallucination", #"hash_8d11dd86e8c44217", &function_eb5841e85910091c );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x77eb79e9, Offset: 0x373
// Size: 0x13
function function_381e3c9018e4e39a( params )
{
    function_81ce0d0c1e1afdea();
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xee4faefa, Offset: 0x38e
// Size: 0x13
function function_91f07de9d1f88ab2( params )
{
    function_81ce0d0c1e1afdea();
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x8beb0f10, Offset: 0x3a9
// Size: 0x5a
function function_190e9b395a23e44a( bundle )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !self isconnected() )
    {
        return;
    }
    
    if ( self function_5c766d1d0140b86( "ui_is_gas_effected" ) )
    {
        self setclientomnvar( "ui_is_gas_effected", 1 );
        function_bab6a447e5dc21f4();
    }
    
    self lerpfovbypreset( "gas_common_default" );
    self function_cea29dd946077443( 1 );
    thread function_559888eec09fcd58( bundle );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x2944918c, Offset: 0x40b
// Size: 0x60
function function_81ce0d0c1e1afdea( bundle )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !self isconnected() )
    {
        return;
    }
    
    if ( self function_5c766d1d0140b86( "ui_is_gas_effected" ) )
    {
        self setclientomnvar( "ui_is_gas_effected", 0 );
        function_c36bd8daa2909019();
    }
    
    self function_cea29dd946077443( 0 );
    function_1b87ec8f122d8f62( bundle );
    self lerpfovbypreset( "default_2seconds" );
    self notify( "gasHallucinationEnded" );
}

// Namespace namespace_bf400aa84aa4d031
// Params 0
// Checksum 0x893d82ce, Offset: 0x473
// Size: 0x8d
function function_bab6a447e5dc21f4()
{
    foreach ( player in level.players )
    {
        player utility::function_32b24db3127bff40( #"gas_vfx", #"vfx_on" );
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 0
// Checksum 0x1a356239, Offset: 0x508
// Size: 0xe9
function function_c36bd8daa2909019()
{
    if ( !isdefined( level.var_1e4c0c39a5ed9450[ #"gas_vfx" ] ) )
    {
        level.var_1e4c0c39a5ed9450[ #"gas_vfx" ] = utility::function_b6cf35b57ecf329c( #"gas_vfx" );
    }
    
    if ( level.var_1e4c0c39a5ed9450[ #"gas_vfx" ] )
    {
        foreach ( player in level.players )
        {
            if ( !player isscriptable() )
            {
                continue;
            }
            
            player setscriptablepartstate( #"gas_vfx", #"off", 1 );
        }
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xb9098d06, Offset: 0x5f9
// Size: 0x96
function function_eb5841e85910091c( var_4fd40c27416e22ff )
{
    if ( !utility::callsharedfunc( #"zombie_utils", #"hash_ed46e37d3efd53d3" ) )
    {
        var_4fd40c27416e22ff.var_f0f21071d94cee1 = self.team;
        self [[ utility::getsharedfunc( #"zombie_utils", #"turn_ai" ) ]]( var_4fd40c27416e22ff.trigger.owner );
        utility::function_32b24db3127bff40( "brainrot", "brainrot_on" );
        
        if ( var_4fd40c27416e22ff.var_701a252760f0c843 )
        {
            thread function_c87e21ae73d96d3c( var_4fd40c27416e22ff );
        }
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x2e831de2, Offset: 0x697
// Size: 0x14e
function function_c87e21ae73d96d3c( var_4fd40c27416e22ff )
{
    self endon( "death" );
    wait var_4fd40c27416e22ff.var_701a252760f0c843;
    self [[ utility::getsharedfunc( #"zombie_utils", #"hash_bdec37c0de8225a1" ) ]]( var_4fd40c27416e22ff.var_f0f21071d94cee1, "brainrot", "brainrot_off" );
    
    if ( var_4fd40c27416e22ff.ignored )
    {
        self.ignoreme = 1;
    }
    
    if ( var_4fd40c27416e22ff.var_5076313ebb1f3fbf )
    {
        self.forceannihilate = 1;
        
        if ( isdefined( level._effect[ "vfx_t10_gameplay_zm_ai_zai_explo_aoe_brain_rot" ] ) )
        {
            playfx( utility::getfx( "vfx_t10_gameplay_zm_ai_zai_explo_aoe_brain_rot" ), self.origin );
        }
        
        var_dc86a115c6b6bd43 = var_4fd40c27416e22ff.var_8c1a2cf93af1d063 ?? 1;
        round_difficulty = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
        zombie_base_health = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", round_difficulty );
        
        if ( !isdefined( zombie_base_health ) )
        {
            zombie_base_health = 125;
        }
        
        damage = zombie_base_health * var_dc86a115c6b6bd43;
        self dodamage( damage, self.origin, var_4fd40c27416e22ff.owner, var_4fd40c27416e22ff.owner, "MOD_ELEMENTAL_TOXIC", var_4fd40c27416e22ff.weapon, "torso_upper" );
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1, eflags: 0x4
// Checksum 0x4385a23, Offset: 0x7ed
// Size: 0x34d
function private function_bf88cd0ee604db85( spawndata )
{
    startpos = self.origin;
    startang = self.angles;
    forward = anglestoforward( startang );
    backward = -1 * forward;
    var_6dc48eb5eac7204 = spawndata.var_de3b77a5b88d82b3;
    var_5ddcd32346b788dd = 180 - spawndata.var_de3b77a5b88d82b3;
    var_7fef7e3a3cd57575 = ( spawndata.var_5248a6ad29e9da2b - spawndata.var_26ee141b1654d2c9 ) / max( spawndata.var_4518426ffa8411a1 - spawndata.var_721b8f4c560de5de, 1 );
    var_56ac8df6a49038a = ( spawndata.var_4dd221792ec088d6 - spawndata.var_b90808171ee88d04 ) / max( spawndata.var_721b8f4c560de5de, 1 );
    var_28f5b5e30cb24b38 = spawndata.var_4518426ffa8411a1;
    
    if ( isdefined( level.gametypebundle.var_8da97050894e91d6 ) && var_28f5b5e30cb24b38 > 0 )
    {
        var_28f5b5e30cb24b38 = function_303a03738221fabe( var_28f5b5e30cb24b38, 1, int( ( level.gametypebundle.var_8da97050894e91d6 - level.var_87534c32cbfc383.size ) / 2 ) );
    }
    
    var_148ae3205212f36 = var_28f5b5e30cb24b38 - self.decoys.size;
    var_8b262899184622f9 = 0;
    
    foreach ( decoy in self.decoys )
    {
        var_4a1e4cdbe9485a48 = vectornormalize( decoy.origin - self geteye() );
        dotproduct = vectordot( vectornormalize( anglestoforward( self.angles ) ), var_4a1e4cdbe9485a48 );
        
        if ( dotproduct >= 0.5 )
        {
            var_8b262899184622f9++;
        }
    }
    
    var_a1144a5f891db1a8 = int( clamp( spawndata.var_721b8f4c560de5de - var_8b262899184622f9, 0, spawndata.var_721b8f4c560de5de ) );
    
    for ( i = 0; i < var_148ae3205212f36 ; i++ )
    {
        curpos = undefined;
        result = undefined;
        
        if ( var_a1144a5f891db1a8 > 0 )
        {
            spawndist = spawndata.var_26ee141b1654d2c9 + var_56ac8df6a49038a * i + randomfloatrange( 0, var_56ac8df6a49038a );
            curpos = startpos + spawndist * rotatevector( forward, ( 0, randomfloatrange( var_6dc48eb5eac7204 * -1, var_6dc48eb5eac7204 ), 0 ) );
            result = function_dad62d4322c6217e( curpos, 1 );
            
            if ( isdefined( result ) )
            {
                function_cba7c4b22fce5d45( spawndata, result, 1 );
                var_a1144a5f891db1a8--;
            }
            
            continue;
        }
        
        if ( var_148ae3205212f36 - var_a1144a5f891db1a8 > 0 )
        {
            spawndist = spawndata.var_26ee141b1654d2c9 + var_7fef7e3a3cd57575 * i + randomfloatrange( 0, var_7fef7e3a3cd57575 );
            curpos = startpos + spawndist * rotatevector( backward, ( 0, randomfloatrange( var_5ddcd32346b788dd * -1, var_5ddcd32346b788dd ), 0 ) );
            result = function_dad62d4322c6217e( curpos, 0 );
            
            if ( isdefined( result ) )
            {
                function_cba7c4b22fce5d45( spawndata, result, 0 );
            }
        }
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 2
// Checksum 0x11597b43, Offset: 0xb42
// Size: 0x19e
function function_dad62d4322c6217e( spawnpoint, var_f045abe5bbc15dd9 )
{
    result = undefined;
    zoffset = ( 0, 0, 72 );
    collisioncontents = trace::create_contents( 1, 1, 1, 1, 1, 1, 1, 0, 1 );
    tracestart = spawnpoint + zoffset;
    spheretestradius = 50;
    var_a4a104a99365ead5 = trace::ray_trace_passed( self geteye(), tracestart, self, collisioncontents );
    
    if ( var_f045abe5bbc15dd9 && var_a4a104a99365ead5 )
    {
        return result;
    }
    
    if ( !var_f045abe5bbc15dd9 && !var_a4a104a99365ead5 )
    {
        return result;
    }
    
    groundtrace = trace::ray_trace( tracestart, tracestart - ( 0, 0, 1000 ), level.players, collisioncontents, 1 );
    
    if ( isdefined( groundtrace[ "position" ] ) && groundtrace[ "hittype" ] != "hittype_none" && isdefined( groundtrace[ "surfacetype" ] ) && groundtrace[ "surfacetype" ] != "surftype_water" && groundtrace[ "fraction" ] < 0.99 )
    {
        testspawnpos = groundtrace[ "position" ] + zoffset;
        var_d6e39170a55e23d0 = trace::sphere_trace_passed( testspawnpos, testspawnpos, spheretestradius, level.players, collisioncontents );
        teamtocheck = undefined;
        
        if ( level.teambased )
        {
            teamtocheck = self.team;
        }
        
        if ( var_d6e39170a55e23d0 && !namespace_9d8e359c3b1041e5::ispointinoutofboundssharedfunc( groundtrace[ "position" ], teamtocheck ) )
        {
            result = groundtrace[ "position" ];
        }
    }
    
    return result;
}

// Namespace namespace_bf400aa84aa4d031
// Params 1, eflags: 0x4
// Checksum 0x76926d43, Offset: 0xce9
// Size: 0x267
function private function_559888eec09fcd58( bundle )
{
    self endon( "gasHallucinationEnded" );
    var_df16e47c27497d77 = self;
    spawndata = { #var_dfa139d7066f373f:bundle.var_f8429a064e94b1d3.var_a88d403785adabdb ?? 0.5, #var_26b549a741e90fe8:bundle.var_f8429a064e94b1d3.var_d53deb8ecd070b33 ?? 1, #var_de3b77a5b88d82b3:( bundle.var_f8429a064e94b1d3.var_df30815db7d20709 ?? 100 ) / 2, #var_5248a6ad29e9da2b:bundle.var_f8429a064e94b1d3.var_e93e08546675eea6 ?? 650, #var_26ee141b1654d2c9:max( 200, bundle.var_f8429a064e94b1d3.var_31f7ae8e34a37a1c ?? 150 ), #var_4dd221792ec088d6:bundle.var_f8429a064e94b1d3.var_6696856db0869970 ?? 1000, #var_b90808171ee88d04:max( 200, bundle.var_f8429a064e94b1d3.var_66144d530177eec2 ?? 650 ), #var_721b8f4c560de5de:bundle.var_f8429a064e94b1d3.var_4c0322330dfba5e8 ?? 1, #var_4518426ffa8411a1:bundle.var_f8429a064e94b1d3.var_508b3e4b368472d9 ?? 4 };
    assert( spawndata.var_26ee141b1654d2c9 < spawndata.var_5248a6ad29e9da2b, "<dev string:x24>" );
    assert( spawndata.var_b90808171ee88d04 < spawndata.var_4dd221792ec088d6, "<dev string:x86>" );
    
    if ( !isdefined( var_df16e47c27497d77.decoys ) )
    {
        var_df16e47c27497d77.decoys = [];
    }
    
    if ( !isdefined( level.var_87534c32cbfc383 ) )
    {
        level.var_87534c32cbfc383 = [];
    }
    
    while ( true )
    {
        var_df16e47c27497d77.decoys = function_46f9072493651dc9( var_df16e47c27497d77.decoys );
        level.var_87534c32cbfc383 = function_46f9072493651dc9( level.var_87534c32cbfc383 );
        
        if ( var_df16e47c27497d77.decoys.size < spawndata.var_4518426ffa8411a1 )
        {
            spawnpositions = function_bf88cd0ee604db85( spawndata );
        }
        
        wait spawndata.var_26b549a741e90fe8;
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 3, eflags: 0x4
// Checksum 0xdf0e1f4, Offset: 0xf58
// Size: 0x322
function private function_cba7c4b22fce5d45( spawndata, position, var_30b5eaf7f63a08 )
{
    var_d7d5ba77dcda9f10 = spawn( "script_model", position );
    var_d7d5ba77dcda9f10 function_ce21f4102d5d17f6( self.operatorcustomization.body, self.operatorcustomization.head, "super_gas_decoy" );
    var_d7d5ba77dcda9f10.team = self.team;
    var_d7d5ba77dcda9f10.owner = self;
    var_d7d5ba77dcda9f10 setentityowner( self );
    var_d7d5ba77dcda9f10 setotherent( self );
    var_d7d5ba77dcda9f10.deletiondelay = spawndata.var_dfa139d7066f373f;
    var_35c83af455d3733b = vectortoangles( self.origin - position );
    var_d7d5ba77dcda9f10.angles = ( 0, var_35c83af455d3733b[ 1 ], 0 );
    weaponobj = self function_a4f068798d87b7ea( 0 );
    
    if ( isnullweapon( weaponobj ) || weaponobj.ismelee )
    {
        weaponobj = weapon::buildweapon( self.loadoutprimary );
        
        if ( isnullweapon( weaponobj ) || weaponobj.ismelee )
        {
            gamemodebundle = getgamemodescriptbundle();
            
            if ( gamemodebundle.weaponlist )
            {
                weaponlistbundle = getscriptbundle( gamemodebundle.weaponlist );
                weaponname = weaponlistbundle.defaultprimaryweapon;
                weaponobj = weapon::buildweapon( weaponname );
                assert( !isnullweapon( weaponobj ), "<dev string:xf8>" );
            }
        }
    }
    
    weaponent = spawn( "script_weapon", var_d7d5ba77dcda9f10.origin, 0, 0, weaponobj );
    weaponent makeunusable();
    weaponent linkto( var_d7d5ba77dcda9f10, "j_gun", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_d7d5ba77dcda9f10.weaponent = weaponent;
    var_e9cbdd915151cbb5 = randomintrange( 0, 2 );
    
    if ( var_e9cbdd915151cbb5 == 0 )
    {
        var_d7d5ba77dcda9f10 scriptmodelplayanim( "sdr_mp_crouch_idle", "gasVictim_notify" );
        var_d7d5ba77dcda9f10.var_5284c181e622aa3c = 1;
    }
    else
    {
        var_d7d5ba77dcda9f10 scriptmodelplayanim( "sdr_mp_stand_idle01", "gasVictim_notify" );
        var_d7d5ba77dcda9f10.var_5284c181e622aa3c = 0;
    }
    
    var_d7d5ba77dcda9f10 hide();
    weaponent hide();
    var_d7d5ba77dcda9f10 showtoplayer( self );
    weaponent showtoplayer( self );
    var_d7d5ba77dcda9f10 thread function_cd8cba22623f716c( self );
    var_7c170ceae0649b57 = [ #"teamselect", self getentitynumber() ];
    var_d7d5ba77dcda9f10.var_7c948a7f25d26919 = spawnscriptable( "super_gas_decoy_hitreact_noentity", position, undefined, undefined, var_7c170ceae0649b57 );
    var_d7d5ba77dcda9f10.health = 1;
    var_d7d5ba77dcda9f10 setcandamage( 1 );
    thread function_df28742310ea736( spawndata, var_d7d5ba77dcda9f10 );
    var_d7d5ba77dcda9f10 thread damage::monitordamage( var_d7d5ba77dcda9f10.health, "none", &function_d6219e8357881a71, &function_5c7502c21850b006 );
    self.decoys[ self.decoys.size ] = var_d7d5ba77dcda9f10;
    level.var_87534c32cbfc383[ level.var_87534c32cbfc383.size ] = var_d7d5ba77dcda9f10;
}

// Namespace namespace_bf400aa84aa4d031
// Params 1, eflags: 0x4
// Checksum 0xa3a71c45, Offset: 0x1282
// Size: 0x41
function private function_cd8cba22623f716c( owner )
{
    self endon( "death" );
    owner endon( "disconnect" );
    
    while ( true )
    {
        level waittill( "connected", player );
        self hidefromplayer( player );
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xca43fc39, Offset: 0x12cb
// Size: 0x95
function function_1b87ec8f122d8f62( bundle )
{
    if ( self )
    {
        foreach ( decoy in self.decoys )
        {
            decoy function_d6219e8357881a71( undefined, 0 );
        }
        
        self.decoys = undefined;
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 2, eflags: 0x4
// Checksum 0x8adb5f47, Offset: 0x1368
// Size: 0xda
function private function_df28742310ea736( spawndata, decoy )
{
    self endon( "death" );
    decoy endon( "death" );
    var_987a77e9508ae30b = max( spawndata.var_4dd221792ec088d6, spawndata.var_5248a6ad29e9da2b ) + 50;
    var_318fd78d4cd6d310 = var_987a77e9508ae30b * var_987a77e9508ae30b;
    
    while ( true )
    {
        waitframe();
        var_fb3b07a76164dac9 = distance2dsquared( self.origin, decoy.origin );
        
        if ( var_fb3b07a76164dac9 <= 10000 || var_fb3b07a76164dac9 > var_318fd78d4cd6d310 )
        {
            decoy function_d6219e8357881a71( undefined, 0 );
        }
        
        var_35c83af455d3733b = vectortoangles( self.origin - decoy.origin );
        decoy.angles = ( 0, var_35c83af455d3733b[ 1 ], 0 );
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 2
// Checksum 0xf9fde8b9, Offset: 0x144a
// Size: 0x57
function function_d6219e8357881a71( damagedata, immediate )
{
    if ( !isdefined( self ) || self.var_918f5731d316cbc )
    {
        return;
    }
    
    self setcandamage( 0 );
    deletiondelay = immediate ? 0 : self.deletiondelay;
    thread function_7f0f35536b352248( deletiondelay );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1, eflags: 0xc
// Checksum 0x2072d195, Offset: 0x14a9
// Size: 0xd1
function private function_7f0f35536b352248( deletiondelay )
{
    self notify( "32b73cfbb5bc903c" );
    self endon( "32b73cfbb5bc903c" );
    self notify( "death" );
    self.var_918f5731d316cbc = 1;
    
    if ( self.var_7c948a7f25d26919 )
    {
        if ( self.var_7c948a7f25d26919 getscriptablepartstate( #"hitreact_fx", 1 ) != "triggered" )
        {
            self.var_7c948a7f25d26919 setscriptablepartstate( #"hitreact_fx", #"triggered", 0 );
        }
    }
    
    if ( !isdefined( deletiondelay ) )
    {
        deletiondelay = 0;
    }
    
    if ( deletiondelay <= 0 )
    {
        waitframe();
    }
    else
    {
        wait deletiondelay;
    }
    
    if ( self.weaponent )
    {
        self.weaponent delete();
    }
    
    if ( self.var_7c948a7f25d26919 )
    {
        self.var_7c948a7f25d26919 freescriptable();
    }
    
    if ( self )
    {
        self delete();
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xaba81003, Offset: 0x1582
// Size: 0x70
function function_5c7502c21850b006( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    return modifieddamage;
}

