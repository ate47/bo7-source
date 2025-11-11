#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\damage;
#using scripts\mp\utility\points;

#namespace namespace_bf400aa84aa4d031;

// Namespace namespace_bf400aa84aa4d031
// Params 0, eflags: 0x5
// Checksum 0x61160407, Offset: 0x2c3
// Size: 0x18
function private autoexec main()
{
    level callback::add( #"register_super", &function_afed2c92726ae0d6 );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x90fd24ac, Offset: 0x2e3
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
// Checksum 0x6166b251, Offset: 0x371
// Size: 0x13
function function_381e3c9018e4e39a( params )
{
    function_81ce0d0c1e1afdea();
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xf8c26559, Offset: 0x38c
// Size: 0x13
function function_91f07de9d1f88ab2( params )
{
    function_81ce0d0c1e1afdea();
}

// Namespace namespace_bf400aa84aa4d031
// Params 2
// Checksum 0x2ec34988, Offset: 0x3a7
// Size: 0x64
function function_190e9b395a23e44a( bundle, var_41cf17437eee98f3 )
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
    thread function_559888eec09fcd58( bundle, var_41cf17437eee98f3 );
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0x568814cb, Offset: 0x413
// Size: 0x59
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
    }
    
    self function_cea29dd946077443( 0 );
    function_1b87ec8f122d8f62( bundle );
    self lerpfovbypreset( "default_2seconds" );
    self notify( "gasHallucinationEnded" );
}

// Namespace namespace_bf400aa84aa4d031
// Params 0
// Checksum 0x47e4c6f7, Offset: 0x474
// Size: 0x9f
function function_bab6a447e5dc21f4()
{
    foreach ( player in level.players )
    {
        if ( player getscriptablehaspart( #"gas_vfx" ) )
        {
            player setscriptablepartstate( #"gas_vfx", #"vfx_on", 1 );
        }
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xca401c82, Offset: 0x51b
// Size: 0x14e
function function_eb5841e85910091c( var_4fd40c27416e22ff )
{
    if ( !utility::callsharedfunc( #"zombie_utils", #"hash_ed46e37d3efd53d3" ) )
    {
        var_4fd40c27416e22ff.var_f0f21071d94cee1 = self.team;
        var_4fd40c27416e22ff.oldhealth = self.health;
        self [[ utility::getsharedfunc( #"zombie_utils", #"turn_ai" ) ]]( var_4fd40c27416e22ff.trigger.owner );
        utility::function_32b24db3127bff40( "brainrot", "brainrot_on" );
        
        if ( var_4fd40c27416e22ff.ignored )
        {
            self.ignoreme = 1;
        }
        
        if ( var_4fd40c27416e22ff.var_2570f353fae877d0 )
        {
            var_f9a8e069bd9c141b = var_4fd40c27416e22ff.var_ec548528e2dd8d5d ?? 1;
            round_difficulty = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
            zombie_base_health = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", round_difficulty );
            
            if ( !isdefined( zombie_base_health ) )
            {
                zombie_base_health = 125;
            }
            
            var_8c1a2cf93af1d063 = var_4fd40c27416e22ff.var_e77dccd76216b0bd ?? 1;
            self.var_cab75db7e9e5b64c = zombie_base_health * var_8c1a2cf93af1d063;
        }
        
        if ( var_4fd40c27416e22ff.var_701a252760f0c843 )
        {
            thread function_c87e21ae73d96d3c( var_4fd40c27416e22ff );
        }
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1
// Checksum 0xd992ffa5, Offset: 0x671
// Size: 0x16e
function function_c87e21ae73d96d3c( var_4fd40c27416e22ff )
{
    self endon( "death" );
    wait var_4fd40c27416e22ff.var_701a252760f0c843;
    self [[ utility::getsharedfunc( #"zombie_utils", #"hash_bdec37c0de8225a1" ) ]]( var_4fd40c27416e22ff.var_f0f21071d94cee1, "brainrot", "brainrot_off" );
    
    if ( var_4fd40c27416e22ff.oldhealth && var_4fd40c27416e22ff.oldhealth > 0 )
    {
        self.health = var_4fd40c27416e22ff.oldhealth;
    }
    
    if ( var_4fd40c27416e22ff.var_5076313ebb1f3fbf )
    {
        self.forceannihilate = 1;
        
        if ( isdefined( level._effect[ "vfx_t10_gameplay_zm_ai_zai_explo_aoe_brain_rot" ] ) )
        {
            playfx( utility::getfx( "vfx_t10_gameplay_zm_ai_zai_explo_aoe_brain_rot" ), self.origin );
        }
        
        var_f9a8e069bd9c141b = var_4fd40c27416e22ff.var_ec548528e2dd8d5d ?? 1;
        round_difficulty = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
        zombie_base_health = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", round_difficulty );
        
        if ( !isdefined( zombie_base_health ) )
        {
            zombie_base_health = 125;
        }
        
        var_e200a870d5be49f1 = zombie_base_health * var_f9a8e069bd9c141b;
        self dodamage( var_e200a870d5be49f1, self.origin, var_4fd40c27416e22ff.owner, var_4fd40c27416e22ff.owner, "MOD_ELEMENTAL_TOXIC", var_4fd40c27416e22ff.weapon, "torso_upper", undefined, 402718720 );
    }
}

// Namespace namespace_bf400aa84aa4d031
// Params 1, eflags: 0x4
// Checksum 0x6c5fec, Offset: 0x7e7
// Size: 0x380
function private function_bf88cd0ee604db85( spawndata )
{
    if ( spawndata.var_41cf17437eee98f3 )
    {
        throttle::function_cc0eee553a602af0( spawndata.var_41cf17437eee98f3, self );
    }
    
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
    
    for ( i = 0; i < var_148ae3205212f36 && i < spawndata.var_93fc6c18523c0e29 ; i++ )
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
// Checksum 0xefcb4b09, Offset: 0xb6f
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
// Params 2, eflags: 0x4
// Checksum 0x5866eb17, Offset: 0xd16
// Size: 0x29f
function private function_559888eec09fcd58( bundle, var_41cf17437eee98f3 )
{
    self endon( "gasHallucinationEnded" );
    var_df16e47c27497d77 = self;
    spawndata = { #var_41cf17437eee98f3:var_41cf17437eee98f3, #var_93fc6c18523c0e29:bundle.var_f8429a064e94b1d3.var_a394f66610998c5a ?? 2147483647, #var_dfa139d7066f373f:bundle.var_f8429a064e94b1d3.var_a88d403785adabdb ?? 0.5, #var_26b549a741e90fe8:bundle.var_f8429a064e94b1d3.var_d53deb8ecd070b33 ?? 1, #var_de3b77a5b88d82b3:( bundle.var_f8429a064e94b1d3.var_df30815db7d20709 ?? 100 ) / 2, #var_5248a6ad29e9da2b:bundle.var_f8429a064e94b1d3.var_e93e08546675eea6 ?? 650, #var_26ee141b1654d2c9:max( 200, bundle.var_f8429a064e94b1d3.var_31f7ae8e34a37a1c ?? 150 ), #var_4dd221792ec088d6:bundle.var_f8429a064e94b1d3.var_6696856db0869970 ?? 1000, #var_b90808171ee88d04:max( 200, bundle.var_f8429a064e94b1d3.var_66144d530177eec2 ?? 650 ), #var_721b8f4c560de5de:bundle.var_f8429a064e94b1d3.var_4c0322330dfba5e8 ?? 0, #var_4518426ffa8411a1:bundle.var_f8429a064e94b1d3.var_508b3e4b368472d9 ?? 0 };
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
// Checksum 0xbcdfab17, Offset: 0xfbd
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
// Checksum 0x43fb2914, Offset: 0x12e7
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
// Checksum 0x854c04d6, Offset: 0x1330
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
// Checksum 0x3015066f, Offset: 0x13cd
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
// Checksum 0xc1b42a50, Offset: 0x14af
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
// Checksum 0x5ab5433a, Offset: 0x150e
// Size: 0xd1
function private function_7f0f35536b352248( deletiondelay )
{
    self notify( "83ad475dd79be719" );
    self endon( "83ad475dd79be719" );
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
// Checksum 0x78fc3ddd, Offset: 0x15e7
// Size: 0x14c
function function_5c7502c21850b006( data )
{
    attacker = data.attacker;
    
    foreach ( gasowner in attacker.var_dc025d4b9929cb1f.attackers )
    {
        if ( gasowner != attacker )
        {
            gasowner thread points::doscoreevent( #"hash_ade4f36c3759f240" );
        }
    }
    
    foreach ( gasowner in attacker.var_221bcd7e6f8830f8.attackers )
    {
        if ( gasowner != attacker )
        {
            gasowner thread points::doscoreevent( #"hash_ade4f36c3759f240" );
        }
    }
    
    return data.damage;
}

