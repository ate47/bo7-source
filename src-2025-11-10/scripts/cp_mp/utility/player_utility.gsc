#using script_cbb0697de4c5728;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace player_utility;

// Namespace player_utility
// Params 1
// Checksum 0x590b934e, Offset: 0x40f
// Size: 0xcb
function isenemy( other )
{
    if ( level.teambased )
    {
        if ( isdefined( other.team ) && isdefined( self.team ) )
        {
            return ( other.team != self.team );
        }
        else
        {
            assertmsg( "<dev string:x24>" + ( self.team ?? "<dev string:x72>" ) + "<dev string:x7f>" + ( other.team ?? "<dev string:x72>" ) + "<dev string:x8f>" + ( other.classname ?? "<dev string:x72>" ) );
            return 1;
        }
        
        return;
    }
    
    if ( isdefined( other.owner ) )
    {
        return ( other.owner != self );
    }
    
    return other != self;
}

// Namespace player_utility
// Params 1
// Checksum 0xb4ff7416, Offset: 0x4e2
// Size: 0x32
function getvehicle( var_193f2bb22e471663 )
{
    if ( vehicle::function_502f53b13c796577() )
    {
        return self.vehicle;
    }
    else if ( var_193f2bb22e471663 )
    {
        return self.externalvehicle;
    }
    
    return undefined;
}

// Namespace player_utility
// Params 1
// Checksum 0x99ac24d3, Offset: 0x51d
// Size: 0x3e, Type: bool
function function_c0192d3e90f65e0e( player )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return false;
    }
    
    return player vehicle::function_502f53b13c796577( 1 ) || isdefined( player getmovingplatformparent() );
}

// Namespace player_utility
// Params 2
// Checksum 0xf0cfd73a, Offset: 0x564
// Size: 0x138
function getteamarray( team, var_10415208fe297864 )
{
    teamarray = [];
    
    if ( !isdefined( var_10415208fe297864 ) || var_10415208fe297864 )
    {
        foreach ( player in level.characters )
        {
            if ( player.team === team )
            {
                teamarray[ teamarray.size ] = player;
            }
        }
    }
    else
    {
        foreach ( player in level.players )
        {
            if ( player.team === team )
            {
                teamarray[ teamarray.size ] = player;
            }
        }
    }
    
    return teamarray;
}

// Namespace player_utility
// Params 3
// Checksum 0xc6245992, Offset: 0x6a5
// Size: 0x57
function _freezecontrols( frozen, force, debug )
{
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"player" ][ #"freezecontrols" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( frozen, force, debug );
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x9232fbf7, Offset: 0x704
// Size: 0x37
function function_b8d64912ebafb09()
{
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"player" ][ #"freezeControlsDebug" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]();
    }
}

// Namespace player_utility
// Params 2
// Checksum 0xc3aa0fdb, Offset: 0x743
// Size: 0x4d
function _freezelookcontrols( frozen, force )
{
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"player" ][ #"freezelookcontrols" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( frozen, force );
    }
}

// Namespace player_utility
// Params 1
// Checksum 0xc38ac73e, Offset: 0x798
// Size: 0x41
function getplayersuperfaction( player )
{
    playersuperfaction = 0;
    
    if ( isdefined( player.operatorcustomization ) )
    {
        playersuperfaction = player.operatorcustomization.superfaction;
    }
    
    return playersuperfaction;
}

// Namespace player_utility
// Params 3
// Checksum 0x329eb661, Offset: 0x7e2
// Size: 0x4b
function setthermalvision( bool, fstop, focusdistance )
{
    if ( bool )
    {
        self enablephysicaldepthoffieldscripting();
        self setphysicaldepthoffield( fstop, focusdistance, 20, 20 );
        self thermalvisionon();
        return;
    }
    
    self disablephysicaldepthoffieldscripting();
    self thermalvisionoff();
}

// Namespace player_utility
// Params 2
// Checksum 0x301ef280, Offset: 0x835
// Size: 0x98
function watchthermalinputchange( inairvehicle, var_41b147ca23b7366e )
{
    self notify( "watch_thermal_input_change" );
    self endon( "watch_thermal_input_change" );
    self endon( "disconnect" );
    
    while ( true )
    {
        var_57d1116398f2b84e = var_41b147ca23b7366e ?? getthermalswitchplayercommand( inairvehicle );
        self notifyonplayercommand( "switch_thermal_mode", var_57d1116398f2b84e );
        returnednotif = utility::waittill_any_return_no_endon_death( "input_type_changed", "thermal_handling_ended" );
        self notifyonplayercommandremove( "switch_thermal_mode", var_57d1116398f2b84e );
        
        if ( !isdefined( returnednotif ) || returnednotif == "thermal_handling_ended" )
        {
            break;
        }
    }
}

// Namespace player_utility
// Params 0
// Checksum 0xec7525b2, Offset: 0x8d5
// Size: 0xa
function stopwatchingthermalinputchange()
{
    self notify( "thermal_handling_ended" );
}

// Namespace player_utility
// Params 1
// Checksum 0xf266174b, Offset: 0x8e7
// Size: 0x2b
function getthermalswitchplayercommand( inairvehicle )
{
    if ( utility::is_player_gamepad_enabled() )
    {
        if ( inairvehicle )
        {
            return "+stance";
        }
        
        return "+gostand";
    }
    
    return "nightvision";
}

// Namespace player_utility
// Params 0
// Checksum 0xdb7fbc8e, Offset: 0x91b
// Size: 0x3c
function enabledemeanorsafe()
{
    if ( !isdefined( self.demeanorsafeenabled ) )
    {
        self.demeanorsafeenabled = 0;
    }
    
    self.demeanorsafeenabled++;
    
    if ( self.demeanorsafeenabled == 1 )
    {
        forcedemeanorsafe( 1 );
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x5e54699a, Offset: 0x95f
// Size: 0x44
function disabledemeanorsafe()
{
    assert( self.demeanorsafeenabled > 0, "<dev string:xa4>" );
    self.demeanorsafeenabled--;
    
    if ( self.demeanorsafeenabled == 0 )
    {
        self.demeanorsafeenabled = undefined;
        forcedemeanorsafe( 0 );
    }
}

// Namespace player_utility
// Params 1
// Checksum 0xb9f7dc42, Offset: 0x9ab
// Size: 0x4a
function forcedemeanorsafe( bool )
{
    if ( bool && self getdemeanorviewmodel() != "safe" )
    {
        thread forcedemeanorsafeinteral( bool );
        return;
    }
    
    if ( !bool && self getdemeanorviewmodel() == "safe" )
    {
        thread forcedemeanorsafeinteral( bool );
    }
}

// Namespace player_utility
// Params 1
// Checksum 0x1544e92, Offset: 0x9fd
// Size: 0xb5
function forcedemeanorsafeinteral( bool )
{
    self endon( "death_or_disconnect" );
    self notify( "forceDemeanorSafeInteral" );
    self endon( "forceDemeanorSafeInteral" );
    wassprinting = self issprinting();
    
    if ( !self.demeanorsprintdisable )
    {
        val::set( "forceDemeanor", "sprint", 0 );
        self.demeanorsprintdisable = 1;
    }
    
    if ( wassprinting )
    {
        wait 0.5;
    }
    
    if ( bool )
    {
        self setdemeanorviewmodel( "safe", "iw8_ges_demeanor_safe" );
    }
    else
    {
        self setdemeanorviewmodel( "normal" );
    }
    
    wait 0.5;
    
    if ( self.demeanorsprintdisable )
    {
        val::reset_all( "forceDemeanor" );
        self.demeanorsprintdisable = undefined;
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x9c25167d, Offset: 0xaba
// Size: 0x16
function cleardemeanorsafe()
{
    self.demeanorsafeenabled = undefined;
    self.demeanorsprintdisable = undefined;
}

// Namespace player_utility
// Params 2
// Checksum 0xbc8dae8, Offset: 0xad8
// Size: 0x5e
function playersareenemies( firstplayer, secondplayer )
{
    return level.teambased ? isdefined( firstplayer.team ) && isdefined( secondplayer.team ) && firstplayer.team != secondplayer.team : firstplayer != secondplayer;
}

// Namespace player_utility
// Params 2
// Checksum 0xe2eb50c8, Offset: 0xb3f
// Size: 0xae
function function_2b55094fe59356fe( firstplayer, secondplayer )
{
    if ( !( isdefined( firstplayer.team ) && isdefined( secondplayer.team ) ) )
    {
        return 0;
    }
    
    if ( level.teambased )
    {
        sameteam = firstplayer.team == secondplayer.team;
        var_9e55c69066c49c17 = firstplayer.var_52a4aad8e6eafc68 != "none" && firstplayer.var_52a4aad8e6eafc68 == secondplayer.var_52a4aad8e6eafc68;
        return ( !sameteam && !var_9e55c69066c49c17 );
    }
    
    return firstplayer != secondplayer;
}

// Namespace player_utility
// Params 2
// Checksum 0xca375d87, Offset: 0xbf5
// Size: 0x28
function function_51a0c300008ab56b( firstplayer, secondplayer )
{
    return isfriendly( firstplayer.team, secondplayer );
}

// Namespace player_utility
// Params 1
// Checksum 0x623084ba, Offset: 0xc26
// Size: 0x1e
function getteamindex( teamname )
{
    return level.teamdata[ teamname ][ "index" ];
}

// Namespace player_utility
// Params 0
// Checksum 0x9445bc0e, Offset: 0xc4d
// Size: 0x14, Type: bool
function playerbloodrestricted()
{
    return level.var_ce11fa8b9f14341d ?? utility::iswegameplatform();
}

// Namespace player_utility
// Params 0
// Checksum 0x1067ab09, Offset: 0xc6a
// Size: 0xc
function initdismembermentlist()
{
    level.playerswithoutdismemberment = [];
}

// Namespace player_utility
// Params 0
// Checksum 0x756845fc, Offset: 0xc7e
// Size: 0x33
function addtodismembermentlist()
{
    assert( isdefined( level.playerswithoutdismemberment ), "<dev string:xe6>" );
    
    if ( !self isdismembermentenabledforplayer() )
    {
        level.playerswithoutdismemberment[ self getxuid() ] = self;
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x6dc590b8, Offset: 0xcb9
// Size: 0x28
function removefromdismembermentlist()
{
    assert( isdefined( level.playerswithoutdismemberment ), "<dev string:x125>" );
    level.playerswithoutdismemberment[ self getxuid() ] = undefined;
}

// Namespace player_utility
// Params 0
// Checksum 0x9fc2ea39, Offset: 0xce9
// Size: 0xb
function getdismembermentlist()
{
    return level.playerswithoutdismemberment;
}

// Namespace player_utility
// Params 0
// Checksum 0x95e51607, Offset: 0xcfd
// Size: 0x39
function _playerhidestack()
{
    if ( !isdefined( self.playerhidden ) )
    {
        self.playerhidden = 0;
    }
    
    if ( self.playerhidden == 0 )
    {
        function_dbe5a52a6654a982();
    }
    
    self.playerhidden++;
}

// Namespace player_utility
// Params 1
// Checksum 0xea7df90a, Offset: 0xd3e
// Size: 0x29
function function_dbe5a52a6654a982( var_eb28bb08a5c7d49c )
{
    namespace_f6c441748a84c612::function_61f9d1047d33e77e();
    
    if ( var_eb28bb08a5c7d49c )
    {
        self playerhide( 1 );
        return;
    }
    
    self playerhide();
}

// Namespace player_utility
// Params 1
// Checksum 0xbb48091a, Offset: 0xd6f
// Size: 0x3d
function function_9d378d725bb4831e( reason )
{
    if ( getdvarint( @"hash_b5fe5be1cf552f2e", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerHide(): " + reason );
    println( "<dev string:x169>" + reason );
}

// Namespace player_utility
// Params 0
// Checksum 0xb3895699, Offset: 0xdb4
// Size: 0x52
function _playershowstack()
{
    assert( self.playerhidden > 0, "<dev string:x17b>" );
    
    if ( self.playerhidden == 1 )
    {
        function_b54a1e23734ef07();
    }
    
    self.playerhidden--;
    
    if ( self.playerhidden == 0 )
    {
        self.playerhidden = undefined;
    }
}

// Namespace player_utility
// Params 1
// Checksum 0xb52f1193, Offset: 0xe0e
// Size: 0x29
function function_b54a1e23734ef07( var_eb28bb08a5c7d49c )
{
    if ( var_eb28bb08a5c7d49c )
    {
        self playershow( 1 );
    }
    else
    {
        self playershow();
    }
    
    namespace_f6c441748a84c612::function_6e83b6d312e47cb3();
}

// Namespace player_utility
// Params 1
// Checksum 0x18bc12eb, Offset: 0xe3f
// Size: 0x3d
function function_4688d689820ff1ed( reason )
{
    if ( getdvarint( @"hash_11b8360f35c60d6f", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerShow(): " + reason );
    println( "<dev string:x1ac>" + reason );
}

// Namespace player_utility
// Params 0
// Checksum 0xb1c0a9e8, Offset: 0xe84
// Size: 0x12
function function_278a198455b7bee6()
{
    self.playerhidden = undefined;
    self playershow();
}

// Namespace player_utility
// Params 1
// Checksum 0x2db87489, Offset: 0xe9e
// Size: 0xa7
function function_bd8d26e4f03d2ca( var_f1d441fe1b436aa0 = 0 )
{
    activeanims = self getactiveanimations();
    
    foreach ( activeanim in activeanims )
    {
        self setanimtime( utility::getanim( activeanim[ "name" ] ), 0.999, undefined, var_f1d441fe1b436aa0 );
    }
}

// Namespace player_utility
// Params 0
// Checksum 0xaa769aae, Offset: 0xf4d
// Size: 0x10, Type: bool
function isswimmingunderwater()
{
    return self isswimming() && self isswimunderwater();
}

// Namespace player_utility
// Params 0
// Checksum 0x69743527, Offset: 0xf66
// Size: 0x11, Type: bool
function function_2e61ffcf29281b15()
{
    return self isswimming() && !self isswimunderwater();
}

// Namespace player_utility
// Params 4
// Checksum 0xcc2594f, Offset: 0xf80
// Size: 0x4a
function function_2a104cfb275afa1b( player, firstpersonsound, thirdpersonsound, var_d7cadebdd3516a03 )
{
    player playlocalsound( firstpersonsound );
    
    if ( var_d7cadebdd3516a03 )
    {
        player playsoundatviewheight( thirdpersonsound );
        return;
    }
    
    player playsound( thirdpersonsound, player, player );
}

// Namespace player_utility
// Params 4
// Checksum 0x3d32b79, Offset: 0xfd2
// Size: 0x10e
function function_99d180c3f0ca93b8( player, motionasset, priority, forceon )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return;
    }
    
    if ( !isdefined( player.var_eed72558c5c10954 ) )
    {
        player.var_eed72558c5c10954 = spawnstruct();
        player.var_eed72558c5c10954.asset = motionasset;
        player.var_eed72558c5c10954.priority = priority;
    }
    else if ( forceon || !isdefined( player.var_eed72558c5c10954.priority ) || player.var_eed72558c5c10954.priority <= priority )
    {
        player.var_eed72558c5c10954.asset = motionasset;
        player.var_eed72558c5c10954.priority = priority;
    }
    else
    {
        return;
    }
    
    player setcinematicmotionoverride( motionasset );
}

// Namespace player_utility
// Params 1
// Checksum 0xfafd0508, Offset: 0x10e8
// Size: 0x68
function function_c14762bb6e0b4edb( player )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return;
    }
    
    player clearcinematicmotionoverride();
    
    if ( isdefined( player.var_eed72558c5c10954 ) )
    {
        player.var_eed72558c5c10954.asset = undefined;
        player.var_eed72558c5c10954.priority = undefined;
    }
}

// Namespace player_utility
// Params 1
// Checksum 0xb79919b, Offset: 0x1158
// Size: 0xdd
function printspawnmessage( message )
{
    /#
        if ( getdvarint( @"hash_da3b86849f785e06", 0 ) == 1 )
        {
            println( "<dev string:x1be>" + gettime() + "<dev string:x1c4>" + self.name + "<dev string:x1ca>" + message );
            println( "<dev string:x1d0>" + self.sessionstate );
            println( "<dev string:x1e3>" + self.origin );
            
            if ( isdefined( self.forcedspawncameraref ) )
            {
                println( "<dev string:x1f7>" + self.forcedspawncameraref );
            }
            
            if ( isdefined( self.spawncameraent ) )
            {
                println( "<dev string:x217>" + self.spawncameraent.origin );
                println( "<dev string:x238>" + self.spawncameraent.angles );
            }
        }
    #/
}

// Namespace player_utility
// Params 0
// Checksum 0xfecea6b1, Offset: 0x123d
// Size: 0x67
function function_f1bdd64504937120()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    
    if ( level.killcam )
    {
        while ( !isdefined( self.var_193ef53f6ce54cf2 ) )
        {
            waitframe();
        }
        
        if ( level.killcam && self.killcam )
        {
            utility::waittill_any( "killcam_ended", "killcam_canceled", "abort_killcam" );
        }
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x927dd529, Offset: 0x12ac
// Size: 0x71
function function_230204b1e2875ed0()
{
    self endon( "disconnect" );
    assert( self.liveragdoll );
    cameraentity = function_232d44374eb29c6a( 0, 0 );
    self.var_193ef53f6ce54cf2 = undefined;
    wait getdvarfloat( @"hash_ac849f1ec300d19c", 1.75 );
    function_f1bdd64504937120();
    self allowspectateteam( self.team, 1 );
    self cameraunlink();
    cameraentity delete();
}

// Namespace player_utility
// Params 2
// Checksum 0x42c29186, Offset: 0x1325
// Size: 0xcc
function function_232d44374eb29c6a( var_a9427f67bd9fcf83, var_53b8cce0afd54244 )
{
    if ( !isdefined( var_a9427f67bd9fcf83 ) )
    {
        var_a9427f67bd9fcf83 = 0;
    }
    
    cameradata = function_cdda5b59decded4e( self, self.attacker, var_53b8cce0afd54244 );
    
    if ( !isdefined( cameradata ) )
    {
        return undefined;
    }
    
    cameraentity = spawn( "script_model", cameradata.origin );
    cameraentity setmodel( "tag_origin" );
    cameraentity.angles = cameradata.angles;
    cameraentity.data = cameradata;
    playermover = self getmovingplatformparent();
    
    if ( isdefined( playermover ) )
    {
        cameraentity linkto( playermover );
    }
    
    self allowspectateallteams( 0 );
    self cameralinkto( cameraentity, "tag_origin", 1, var_a9427f67bd9fcf83 );
    return cameraentity;
}

// Namespace player_utility
// Params 3
// Checksum 0x7e89ef6f, Offset: 0x13fa
// Size: 0x26a
function function_cdda5b59decded4e( victim, attacker, var_53b8cce0afd54244 )
{
    assert( isent( victim ) );
    assert( isent( attacker ) );
    deathpos = undefined;
    
    if ( isdefined( victim.origin ) )
    {
        deathpos = victim.origin;
    }
    else if ( isdefined( victim.lastdeathpos ) )
    {
        deathpos = victim.lastdeathpos;
    }
    
    if ( !isdefined( deathpos ) )
    {
        logstring( "Undefined deathPos for death ragdoll 3rd person camera." );
        return undefined;
    }
    
    if ( victim == attacker || !isdefined( attacker.origin ) )
    {
        forwardvector = anglestoforward( victim.angles );
        forwardvector = vectornormalize2( forwardvector );
    }
    else
    {
        forwardvector = vectornormalize( deathpos - attacker.origin );
    }
    
    baseangles = generateaxisanglesfromforwardvector( forwardvector, ( 0, 0, 1 ) );
    cameraposition = deathpos + ( 0, 0, 12 );
    cameradistance = 200;
    stepangle = 30;
    maxsteps = 360 / stepangle;
    validpositions = [];
    
    for ( i = 0; i < maxsteps ; i++ )
    {
        stepvector = anglestoforward( baseangles + ( 0, stepangle * i, 0 ) );
        startposition = deathpos + ( 0, 0, 12 );
        endposition = deathpos + stepvector * cameradistance + ( 0, 0, 150 );
        trace = trace::sphere_trace( startposition, endposition, 2, [ victim, attacker ] );
        
        if ( trace[ "fraction" ] > 0.99 )
        {
            validpositions[ validpositions.size ] = trace[ "position" ];
            
            if ( !var_53b8cce0afd54244 )
            {
                break;
            }
        }
    }
    
    if ( validpositions.size > 0 )
    {
        cameraposition = validpositions[ 0 ];
    }
    
    victimdirection = vectornormalize( deathpos - cameraposition );
    cameradata = spawnstruct();
    cameradata.origin = cameraposition;
    cameradata.angles = vectortoangles( victimdirection );
    cameradata.distance = cameradistance;
    cameradata.validpositions = validpositions;
    return cameradata;
}

// Namespace player_utility
// Params 2
// Checksum 0x2e9ad3d3, Offset: 0x166d
// Size: 0x1e1
function updatesessionstate( sessionstate, statusicon )
{
    assert( sessionstate == "<dev string:x259>" || sessionstate == "<dev string:x264>" || sessionstate == "<dev string:x26c>" || sessionstate == "<dev string:x279>" || sessionstate == "<dev string:x289>" );
    
    if ( self.liveragdoll )
    {
        if ( self.sessionstate == "playing_but_spectating" && ( sessionstate == "dead" || sessionstate == "spectator" ) )
        {
            printspawnmessage( "player::updateSessionState() didn't not update because we are in liveRagdoll" );
            return;
        }
        
        if ( sessionstate == "playing_but_spectating" )
        {
            if ( getdvarint( @"hash_f47d7bfe207dc431", 1 ) == 0 )
            {
                thread function_230204b1e2875ed0();
            }
        }
    }
    
    switch ( sessionstate )
    {
        case #"hash_6e223a17d0eb5015":
        case #"hash_7135993aa112803d":
            statusicon = "";
            break;
        case #"hash_9430ae82e6671e2a":
        case #"hash_cf14c509efeb3c87":
            if ( level.var_5b8d8574c0f12b9f )
            {
                statusicon = "";
            }
            else if ( level.numlifelimited )
            {
                if ( self.tagavailable )
                {
                    statusicon = "hud_status_dogtag";
                }
                else if ( self.revivetriggeravailable )
                {
                    if ( self.statusicon == "hud_status_revive_or" )
                    {
                        statusicon = "hud_status_revive_or";
                    }
                    else
                    {
                        statusicon = "hud_status_revive_wh";
                    }
                }
                else
                {
                    statusicon = "hud_status_dead";
                }
            }
            else
            {
                statusicon = "hud_status_dead";
            }
            
            break;
    }
    
    if ( !isdefined( statusicon ) )
    {
        statusicon = "";
    }
    
    self.sessionstate = sessionstate;
    self.statusicon = statusicon;
    ui_session_state = sessionstate == "playing_but_spectating" ? "spectator" : sessionstate;
    self setclientomnvar( "ui_session_state", ui_session_state );
    printspawnmessage( "player::updateSessionState() " + sessionstate );
}

// Namespace player_utility
// Params 1
// Checksum 0xc55400a3, Offset: 0x1856
// Size: 0x57
function clearkillcamstate( var_824c9d962d9cde74 )
{
    self.forcespectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.archiveusepotg = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    
    if ( !var_824c9d962d9cde74 )
    {
        thread function_d14fd7480f28bba9();
    }
}

// Namespace player_utility
// Params 0, eflags: 0x4
// Checksum 0xbf479626, Offset: 0x18b5
// Size: 0x60
function private function_d14fd7480f28bba9()
{
    self endon( "disconnect" );
    self notify( "reset_killcam_player" );
    self endon( "reset_killcam_player" );
    wait 0.05;
    restorepitch = 0;
    restoreroll = 0;
    var_2f9e1349ec2a4b90 = self getplayerangles();
    restoreyaw = var_2f9e1349ec2a4b90[ 1 ];
    self setplayerangles( ( restorepitch, restoreyaw, restoreroll ) );
}

// Namespace player_utility
// Params 4
// Checksum 0xb7bd8483, Offset: 0x191d
// Size: 0x33
function script_getplayersinradius( origin, radius, desiredteam, excludeent )
{
    return getplayersinradius( origin, radius, undefined, undefined, excludeent, desiredteam );
}

// Namespace player_utility
// Params 3
// Checksum 0xb67c13b0, Offset: 0x1959
// Size: 0xa5
function getplayerlookatpos( player, ignoreents, contentoverride )
{
    starttrace = player getcamerathirdperson() ? player getcamerathirdpersonorigin() : player getvieworigin();
    endtrace = starttrace + anglestoforward( player getplayerangles() ) * 20000;
    trace = trace::ray_trace( starttrace, endtrace, ignoreents, contentoverride );
    endpos = undefined;
    
    if ( isdefined( trace[ "hittype" ] ) && trace[ "hittype" ] != "hittype_none" )
    {
        endpos = trace[ "position" ];
    }
    
    return endpos;
}

// Namespace player_utility
// Params 2
// Checksum 0x7183c2ac, Offset: 0x1a07
// Size: 0xa4
function _visionsetnaked( visionset, time )
{
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( isai( player ) )
        {
            continue;
        }
        
        player visionsetnakedforplayer( visionset, time );
    }
}

// Namespace player_utility
// Params 2
// Checksum 0xe5a411fa, Offset: 0x1ab4
// Size: 0x90
function waittillrecoveredhealth( time, interval )
{
    self endon( "death_or_disconnect" );
    fullhealthtime = 0;
    
    if ( !isdefined( interval ) )
    {
        interval = 0.05;
    }
    
    if ( !isdefined( time ) )
    {
        time = 0;
    }
    
    while ( true )
    {
        if ( self.health != self.maxhealth )
        {
            fullhealthtime = 0;
        }
        else
        {
            fullhealthtime += interval;
        }
        
        wait interval;
        
        if ( self.health == self.maxhealth && fullhealthtime >= time )
        {
            break;
        }
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x836f877a, Offset: 0x1b4d
// Size: 0x3f
function hidehudenable()
{
    if ( !isdefined( self.ui_hudhidden ) )
    {
        self.hidehudenabled = 0;
    }
    
    if ( self.hidehudenabled == 0 )
    {
        self setclientomnvar( "ui_hide_hud", 1 );
    }
    
    self.hidehudenabled++;
}

// Namespace player_utility
// Params 0
// Checksum 0xd0e1c19d, Offset: 0x1b94
// Size: 0x3f
function hidehuddisable()
{
    assert( self.hidehudenabled > 0, "<dev string:x2a3>" );
    
    if ( self.hidehudenabled == 1 )
    {
        self setclientomnvar( "ui_hide_hud", 0 );
    }
    
    self.hidehudenabled--;
}

// Namespace player_utility
// Params 0
// Checksum 0x653c0167, Offset: 0x1bdb
// Size: 0x18
function hidehudclear()
{
    self.hidehudenabled = undefined;
    self setclientomnvar( "ui_hide_hud", 0 );
}

// Namespace player_utility
// Params 1
// Checksum 0x72246a19, Offset: 0x1bfb
// Size: 0x27, Type: bool
function function_cdedd9a19069ca4c( reviver )
{
    return reviver.revivingteammate && !reviver.var_e0a3e97f1aea8404;
}

// Namespace player_utility
// Params 2
// Checksum 0xbe60249b, Offset: 0x1c2b
// Size: 0x66, Type: bool
function isfriendly( teamtocheck, var_5b415c263e1d902 )
{
    assert( isdefined( var_5b415c263e1d902 ), "<dev string:x2d4>" );
    
    if ( !level.teambased )
    {
        return false;
    }
    
    if ( !isplayer( var_5b415c263e1d902 ) && !isdefined( var_5b415c263e1d902.team ) )
    {
        return false;
    }
    
    if ( teamtocheck != var_5b415c263e1d902.team )
    {
        return false;
    }
    
    return true;
}

// Namespace player_utility
// Params 0
// Checksum 0xaabb0919, Offset: 0x1c9a
// Size: 0x7
function _jumpbuttonpressed()
{
    return self jumpbuttonpressed();
}

// Namespace player_utility
// Params 0
// Checksum 0xc6d8f837, Offset: 0x1caa
// Size: 0x7
function function_a1e9194b63d531a4()
{
    return self superbuttonpressed();
}

// Namespace player_utility
// Params 1
// Checksum 0x39e8428d, Offset: 0x1cba
// Size: 0x3f
function getPlayerGuid( player )
{
    if ( isplayer( player ) && isdefined( player.guid ) )
    {
        return player.guid;
    }
    
    assertmsg( "<dev string:x300>" );
    return 0;
}

// Namespace player_utility
// Params 1, eflags: 0x4
// Checksum 0x10e359f9, Offset: 0x1d02
// Size: 0x36, Type: bool
function private function_5c2f3e06c2e39907( vehicle )
{
    return vehicle.occupants[ "driver" ] == self || vehicle.occupants[ "gunner" ] == self;
}

// Namespace player_utility
// Params 0
// Checksum 0xc48fd01f, Offset: 0x1d41
// Size: 0x22, Type: bool
function function_cb195d25060312a()
{
    vehicle = getvehicle();
    return vehicle && function_5c2f3e06c2e39907( vehicle );
}

// Namespace player_utility
// Params 0
// Checksum 0xc4934d5f, Offset: 0x1d6c
// Size: 0x23, Type: bool
function function_36e9830807a5007()
{
    vehicle = getvehicle();
    return vehicle && !function_5c2f3e06c2e39907( vehicle );
}

