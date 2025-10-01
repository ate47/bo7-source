#using script_cbb0697de4c5728;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace player_utility;

// Namespace player_utility
// Params 1
// Checksum 0xfa70acc5, Offset: 0x3fc
// Size: 0x85
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
            assertmsg( "<dev string:x24>" );
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
// Checksum 0xaff6ab07, Offset: 0x489
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
// Checksum 0xe64f085d, Offset: 0x4c4
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
// Checksum 0xeca8d47c, Offset: 0x50b
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
// Checksum 0x68d39a3d, Offset: 0x64c
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
// Checksum 0x3cc539ca, Offset: 0x6ab
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
// Checksum 0x6d5dcdce, Offset: 0x6ea
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
// Checksum 0x745e2fcb, Offset: 0x73f
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
// Checksum 0x61a8f4f2, Offset: 0x789
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
// Checksum 0x285f1cf5, Offset: 0x7dc
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
// Checksum 0x8e39b987, Offset: 0x87c
// Size: 0xa
function stopwatchingthermalinputchange()
{
    self notify( "thermal_handling_ended" );
}

// Namespace player_utility
// Params 1
// Checksum 0x9fbd587d, Offset: 0x88e
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
// Checksum 0x95d7ec59, Offset: 0x8c2
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
// Checksum 0xb3363e12, Offset: 0x906
// Size: 0x44
function disabledemeanorsafe()
{
    assert( self.demeanorsafeenabled > 0, "<dev string:x65>" );
    self.demeanorsafeenabled--;
    
    if ( self.demeanorsafeenabled == 0 )
    {
        self.demeanorsafeenabled = undefined;
        forcedemeanorsafe( 0 );
    }
}

// Namespace player_utility
// Params 1
// Checksum 0xb9f7df58, Offset: 0x952
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
// Checksum 0x57d6cf2f, Offset: 0x9a4
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
// Checksum 0xc6694265, Offset: 0xa61
// Size: 0x16
function cleardemeanorsafe()
{
    self.demeanorsafeenabled = undefined;
    self.demeanorsprintdisable = undefined;
}

// Namespace player_utility
// Params 2
// Checksum 0x25a4f786, Offset: 0xa7f
// Size: 0x5e
function playersareenemies( firstplayer, secondplayer )
{
    return level.teambased ? isdefined( firstplayer.team ) && isdefined( secondplayer.team ) && firstplayer.team != secondplayer.team : firstplayer != secondplayer;
}

// Namespace player_utility
// Params 2
// Checksum 0x98f27f8b, Offset: 0xae6
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
// Checksum 0x7c48cea7, Offset: 0xb9c
// Size: 0x28
function function_51a0c300008ab56b( firstplayer, secondplayer )
{
    return isfriendly( firstplayer.team, secondplayer );
}

// Namespace player_utility
// Params 1
// Checksum 0x58488174, Offset: 0xbcd
// Size: 0x1e
function getteamindex( teamname )
{
    return level.teamdata[ teamname ][ "index" ];
}

// Namespace player_utility
// Params 0
// Checksum 0xf38d685b, Offset: 0xbf4
// Size: 0x14, Type: bool
function playerbloodrestricted()
{
    return level.var_ce11fa8b9f14341d ?? utility::iswegameplatform();
}

// Namespace player_utility
// Params 0
// Checksum 0x1a0ca98a, Offset: 0xc11
// Size: 0xc
function initdismembermentlist()
{
    level.playerswithoutdismemberment = [];
}

// Namespace player_utility
// Params 0
// Checksum 0x8885d30a, Offset: 0xc25
// Size: 0x33
function addtodismembermentlist()
{
    assert( isdefined( level.playerswithoutdismemberment ), "<dev string:xa7>" );
    
    if ( !self isdismembermentenabledforplayer() )
    {
        level.playerswithoutdismemberment[ self getxuid() ] = self;
    }
}

// Namespace player_utility
// Params 0
// Checksum 0x596df9b4, Offset: 0xc60
// Size: 0x28
function removefromdismembermentlist()
{
    assert( isdefined( level.playerswithoutdismemberment ), "<dev string:xe6>" );
    level.playerswithoutdismemberment[ self getxuid() ] = undefined;
}

// Namespace player_utility
// Params 0
// Checksum 0x95a9e88c, Offset: 0xc90
// Size: 0xb
function getdismembermentlist()
{
    return level.playerswithoutdismemberment;
}

// Namespace player_utility
// Params 0
// Checksum 0x7058382c, Offset: 0xca4
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
// Checksum 0x5f524cc4, Offset: 0xce5
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
// Checksum 0xad107e5b, Offset: 0xd16
// Size: 0x3d
function function_9d378d725bb4831e( reason )
{
    if ( getdvarint( @"hash_b5fe5be1cf552f2e", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerHide(): " + reason );
    println( "<dev string:x12a>" + reason );
}

// Namespace player_utility
// Params 0
// Checksum 0xde7e1622, Offset: 0xd5b
// Size: 0x52
function _playershowstack()
{
    assert( self.playerhidden > 0, "<dev string:x13c>" );
    
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
// Checksum 0xc9c55c84, Offset: 0xdb5
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
// Checksum 0xf9a57ba5, Offset: 0xde6
// Size: 0x3d
function function_4688d689820ff1ed( reason )
{
    if ( getdvarint( @"hash_11b8360f35c60d6f", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerShow(): " + reason );
    println( "<dev string:x16d>" + reason );
}

// Namespace player_utility
// Params 0
// Checksum 0x1cb6141b, Offset: 0xe2b
// Size: 0x12
function function_278a198455b7bee6()
{
    self.playerhidden = undefined;
    self playershow();
}

// Namespace player_utility
// Params 1
// Checksum 0x5c54b15c, Offset: 0xe45
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
// Checksum 0x5c0c51a8, Offset: 0xef4
// Size: 0x10, Type: bool
function isswimmingunderwater()
{
    return self isswimming() && self isswimunderwater();
}

// Namespace player_utility
// Params 0
// Checksum 0x9f0efcfa, Offset: 0xf0d
// Size: 0x11, Type: bool
function function_2e61ffcf29281b15()
{
    return self isswimming() && !self isswimunderwater();
}

// Namespace player_utility
// Params 4
// Checksum 0x740e44d1, Offset: 0xf27
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
// Checksum 0x484afa94, Offset: 0xf79
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
// Checksum 0xbba5f20c, Offset: 0x108f
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
// Checksum 0x7bd4ac1a, Offset: 0x10ff
// Size: 0xdd
function printspawnmessage( message )
{
    /#
        if ( getdvarint( @"hash_da3b86849f785e06", 0 ) == 1 )
        {
            println( "<dev string:x17f>" + gettime() + "<dev string:x185>" + self.name + "<dev string:x18b>" + message );
            println( "<dev string:x191>" + self.sessionstate );
            println( "<dev string:x1a4>" + self.origin );
            
            if ( isdefined( self.forcedspawncameraref ) )
            {
                println( "<dev string:x1b8>" + self.forcedspawncameraref );
            }
            
            if ( isdefined( self.spawncameraent ) )
            {
                println( "<dev string:x1d8>" + self.spawncameraent.origin );
                println( "<dev string:x1f9>" + self.spawncameraent.angles );
            }
        }
    #/
}

// Namespace player_utility
// Params 0
// Checksum 0xffbd0ed3, Offset: 0x11e4
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
// Checksum 0xd8856cfe, Offset: 0x1253
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
// Checksum 0x4c09be93, Offset: 0x12cc
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
// Checksum 0x499f6fab, Offset: 0x13a1
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
// Checksum 0xbe99b81f, Offset: 0x1614
// Size: 0x1d5
function updatesessionstate( sessionstate, statusicon )
{
    assert( sessionstate == "<dev string:x21a>" || sessionstate == "<dev string:x225>" || sessionstate == "<dev string:x22d>" || sessionstate == "<dev string:x23a>" || sessionstate == "<dev string:x24a>" );
    ui_session_state = sessionstate;
    
    if ( self.liveragdoll )
    {
        if ( self.sessionstate == "playing_but_spectating" && ( sessionstate == "dead" || sessionstate == "spectator" ) )
        {
            printspawnmessage( "player::updateSessionState() didn't not update because we are in liveRagdoll" );
            return;
        }
        
        if ( sessionstate == "playing_but_spectating" )
        {
            ui_session_state = "spectator";
            
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
    self setclientomnvar( "ui_session_state", ui_session_state );
    printspawnmessage( "player::updateSessionState() " + sessionstate );
}

// Namespace player_utility
// Params 1
// Checksum 0xbd93b830, Offset: 0x17f1
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
// Checksum 0x716322f6, Offset: 0x1850
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
// Checksum 0x60a27dd, Offset: 0x18b8
// Size: 0x33
function script_getplayersinradius( origin, radius, desiredteam, excludeent )
{
    return getplayersinradius( origin, radius, undefined, undefined, excludeent, desiredteam );
}

// Namespace player_utility
// Params 3
// Checksum 0xaade65c0, Offset: 0x18f4
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
// Checksum 0xb16ff3bb, Offset: 0x19a2
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
// Checksum 0x54414507, Offset: 0x1a4f
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
// Checksum 0x8a8980f9, Offset: 0x1ae8
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
// Checksum 0x9b1a1895, Offset: 0x1b2f
// Size: 0x3f
function hidehuddisable()
{
    assert( self.hidehudenabled > 0, "<dev string:x264>" );
    
    if ( self.hidehudenabled == 1 )
    {
        self setclientomnvar( "ui_hide_hud", 0 );
    }
    
    self.hidehudenabled--;
}

// Namespace player_utility
// Params 0
// Checksum 0x8d0dc6c3, Offset: 0x1b76
// Size: 0x18
function hidehudclear()
{
    self.hidehudenabled = undefined;
    self setclientomnvar( "ui_hide_hud", 0 );
}

// Namespace player_utility
// Params 1
// Checksum 0xa790a2fa, Offset: 0x1b96
// Size: 0x27, Type: bool
function function_cdedd9a19069ca4c( reviver )
{
    return reviver.revivingteammate && !reviver.var_e0a3e97f1aea8404;
}

// Namespace player_utility
// Params 2
// Checksum 0x7f3e347d, Offset: 0x1bc6
// Size: 0x66, Type: bool
function isfriendly( teamtocheck, var_5b415c263e1d902 )
{
    assert( isdefined( var_5b415c263e1d902 ), "<dev string:x295>" );
    
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
// Checksum 0x6244d961, Offset: 0x1c35
// Size: 0x7
function _jumpbuttonpressed()
{
    return self jumpbuttonpressed();
}

// Namespace player_utility
// Params 0
// Checksum 0x6502002, Offset: 0x1c45
// Size: 0x7
function function_a1e9194b63d531a4()
{
    return self superbuttonpressed();
}

// Namespace player_utility
// Params 1
// Checksum 0x9dc676ee, Offset: 0x1c55
// Size: 0x3f
function getPlayerGuid( player )
{
    if ( isplayer( player ) && isdefined( player.guid ) )
    {
        return player.guid;
    }
    
    assertmsg( "<dev string:x2c1>" );
    return 0;
}

