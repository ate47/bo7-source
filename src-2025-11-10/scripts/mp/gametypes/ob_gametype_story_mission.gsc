#using script_157e7fec25404847;
#using script_16ea1b94f0f381b3;
#using script_1aae2eb1ef28b239;
#using script_2f11ea014b8bb8eb;
#using script_41ca4cfec8297132;
#using script_50cece4fabbdcc75;
#using script_5a38602f6a9ab5d4;
#using script_6c127c3e52a25f42;
#using script_6e82764a30a99f8c;
#using script_cd391879f999cb7;
#using scripts\common\callbacks;
#using scripts\common\damage_effects;
#using scripts\common\devgui;
#using scripts\common\save;
#using scripts\common\values;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\engine\utility;
#using scripts\game\dialogue_speaker;
#using scripts\mp\coop;
#using scripts\mp\gametypes\elim;
#using scripts\mp\gametypes\ob;
#using scripts\mp\laststand;
#using scripts\mp\playerlogic;
#using scripts\mp\spawnlogic;
#using scripts\mp\teamrevive;
#using scripts\mp\utility\player;

#namespace ob_gametype_story_mission;

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0xa981958, Offset: 0x4eb
// Size: 0x199
function main()
{
    function_5e3806c5d39995e2();
    level.var_539c069e9c881d35 = &init;
    level.var_4ff066f519fa9449 = &function_32114e935f496880;
    level.var_10459e4184c44ea4 = &function_82b7113c91892e85;
    level.var_b3e0b38145c782a3 = &function_effb274e1e64bcfc;
    level.var_1885dec6f8399bd0 = &function_7a372913cd484c04;
    level.var_bb86f77304f193c4 = getscriptbundle( %"hash_7ac78b2774622482" );
    level thread init();
    level.var_6488d1fb560a08fb = function_9f1e246e38a43444();
    ob::main();
    
    /#
        level.var_8b324f76eefee199 = &function_a218cde1c6260be2;
        level.var_b6c6978dacab8f7b = &function_23e93443efaab71e;
    #/
    
    utility::registersharedfunc( #"coop", #"hash_ef677de46ca0c35", &function_4ed8e794289fc666 );
    utility::registersharedfunc( #"coop", #"hash_c28de838cda2f4da", &function_4cded001aa8458fb );
    level.onsquadeliminated = &function_1fb9ccca3958dbb2;
    level.var_9a7facf0cbad27fd = &function_9142baea1cccc1ed;
    level callback::callback( "register_activity_variant_definitions" );
    
    /#
        level thread namespace_f45dbec1c03bfc10::function_4e8cfeac80565812();
    #/
    
    thread namespace_f3a407bc35a59caf::init();
    callback::add( #"player_spawned", &on_player_spawned );
    activity_common::function_2dd4f07fa5c3e911( "ActivityBegin", &function_d75c7c1c7a10b8f1 );
    level elim::function_1bd2057248452f5e( 1 );
    level function_a84a883b65da29a1();
    namespace_9d8e359c3b1041e5::function_95538e4344ab0bfb( #"hash_346e2100fa4e4a03", &function_23e93443efaab71e );
    level.allowfauxdeath = 0;
    utility::registersharedfunc( #"ob_gametype_story_mission", #"hash_b065bf3f05c1b1e2", &function_5bfc61f98c2501a5 );
    level.var_ddb0652fbf187f6e = 1;
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xa23c3f97, Offset: 0x68c
// Size: 0xc
function private function_7a372913cd484c04( params )
{
    
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0x30db7d5d, Offset: 0x6a0
// Size: 0x23, Type: bool
function private function_7ebdcb1564ed7596()
{
    return level.var_ae7c2fda204460e5[ level.var_7d47cb5d61025784 ][ "activity_name" ] ?? "<unknown>";
}

// Namespace ob_gametype_story_mission/event_c91584356d5d4265
// Params 0, eflags: 0x20
// Checksum 0x43e55c1f, Offset: 0x6cc
// Size: 0x24
function event_handler[event_c91584356d5d4265] function_a8aa6906b5ff9d68()
{
    activityname = function_7ebdcb1564ed7596();
    function_a3c0c640dcc68f63( #"activity", activityname );
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0xe3a7ca40, Offset: 0x6f8
// Size: 0xe4
function private function_5e3806c5d39995e2()
{
    setdvar( @"hash_70bf831e0968bcdd", 1 );
    setdvar( @"hash_9bb82c2a874ffc6d", 1 );
    setdvar( @"hash_97016f0844118818", 0 );
    setdvar( @"hash_f1d095735ac37f33", 0 );
    setdvar( @"hash_c5a52a0ae6ed1529", 2000 );
    setdvar( @"hash_c69456bc853363e0", 1 );
    setdvarifuninitialized( @"hash_550484f2b30cf121", 1 );
    setdvarifuninitialized( @"hash_1661f35e34f544eb", 1 );
    setdvar( @"hash_2fe0283b419ff08a", 1 );
    setdvar( @"hash_dff65df98f544f1b", 0 );
    setdvarifuninitialized( @"hash_4af72e5b55859fa9", 1 );
    
    /#
        var_46caebf23eaec487 = getdvarint( @"scr_devchangetimelimit", -1 );
        
        if ( var_46caebf23eaec487 < 0 )
        {
            setdevdvar( @"scr_devchangetimelimit", 0 );
        }
    #/
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0x158750b6, Offset: 0x7e4
// Size: 0xac
function private function_9f1e246e38a43444()
{
    map_name = level.var_d2ad35d68057f138.mapname;
    
    if ( isdefined( map_name ) )
    {
        switch ( map_name )
        {
            case #"hash_fb5b52497f18b4f2":
                return "leo_launch";
            case #"hash_aa57751870ed56c8":
                return "aries_launch";
            case #"hash_155fc6a1623fc995":
                return "capricorn_launch";
            case #"hash_73a439379493fc99":
                return "virgo_launch";
            case #"hash_81327b83385c34a5":
                return "gemini_launch";
            case #"hash_4d2fb3330f72cfb4":
                return "libra_launch";
            default:
                break;
        }
    }
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0xf07a400c, Offset: 0x898
// Size: 0x1a
function init()
{
    /#
        adddebugcommand( "<dev string:x24>" );
    #/
    
    self.var_8afd2d97bc4003e4 = 1;
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x1ae31659, Offset: 0x8ba
// Size: 0x15
function function_7ce217a3236fe968( var_62cb148feb32186e )
{
    namespace_d2e8fad0efd14692::function_7ce217a3236fe968( var_62cb148feb32186e );
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0xd5adf57a, Offset: 0x8d7
// Size: 0x1b
function function_4ed8e794289fc666()
{
    assert( isplayer( self ) );
    thread function_7ce217a3236fe968( "ob_sm_checkpoint_loadout" );
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x397b5202, Offset: 0x8fa
// Size: 0x49
function function_4cded001aa8458fb()
{
    assert( isplayer( self ) );
    self endon( "disconnect" );
    var_ae227300221f1b4 = save::function_61358373d07ec9f1( "ob_sm_checkpoint_loadout" );
    
    if ( isdefined( var_ae227300221f1b4 ) )
    {
        namespace_d2e8fad0efd14692::function_381fa2e725bb88d1( self, var_ae227300221f1b4 );
        self.var_b8cfeb206bb587fc = 1;
    }
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x55502206, Offset: 0x94b
// Size: 0x1b
function function_79b85152b04adf1f()
{
    assert( isplayer( self ) );
    thread function_7ce217a3236fe968( "ob_sm_checkpoint_laststand" );
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0xbdac1a4e, Offset: 0x96e
// Size: 0x4a
function function_58db9c7cee228798()
{
    assert( isplayer( self ) );
    var_ae227300221f1b4 = save::function_61358373d07ec9f1( "ob_sm_checkpoint_laststand" );
    
    if ( !isdefined( var_ae227300221f1b4 ) )
    {
        var_ae227300221f1b4 = save::function_61358373d07ec9f1( "ob_sm_checkpoint_loadout" );
    }
    
    if ( isdefined( var_ae227300221f1b4 ) )
    {
        namespace_d2e8fad0efd14692::function_381fa2e725bb88d1( self, var_ae227300221f1b4 );
    }
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x24cc0bb1, Offset: 0x9c0
// Size: 0xd7
function function_bdac21d30de781da()
{
    assert( isplayer( self ) );
    var_850001ba16258e16 = 1;
    var_8e5fb11bbcaa20c5 = squad_utility::getsquadmembers();
    var_8e5fb11bbcaa20c5 = function_5713d46873b29625( var_8e5fb11bbcaa20c5 );
    
    foreach ( player in var_8e5fb11bbcaa20c5 )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            if ( player.game_extrainfo & 256 )
            {
                continue;
            }
            
            var_850001ba16258e16 = 0;
            break;
        }
    }
    
    return var_850001ba16258e16;
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0xb7608e16, Offset: 0xaa0
// Size: 0x314, Type: bool
function private function_32114e935f496880()
{
    level.spawnmins = ( 2.14748e+09, 2.14748e+09, 2.14748e+09 );
    level.spawnmaxs = ( -2.14748e+09, -2.14748e+09, -2.14748e+09 );
    level.var_d5adf83bde10c3f2 = [];
    var_96b6e1b8e7e19fa6 = 100;
    var_63196b4068cab675 = 100;
    var_535c5014851f97ee = 32;
    var_90e6314bb00ab7f9 = "mp_ob_spawn_start";
    start_activity = toupper( function_bee0f1dccea194c9() );
    var_ca1f4c8224f92d6d = start_activity != "" && start_activity != "UNDEFINED";
    var_afd5a968e27dae5f = getspawnarray( var_90e6314bb00ab7f9 );
    squadspawnpoints = [];
    var_38661a89fb25fc54 = level.var_d2ad35d68057f138.var_3bcb5ddcb3ca5279 && issubstr( level.var_d2ad35d68057f138.gametypes ?? "", "story" );
    
    foreach ( spawnpoint in var_afd5a968e27dae5f )
    {
        level.spawnmins = spawnlogic::expandmins( level.spawnmins, spawnpoint.origin );
        level.spawnmaxs = spawnlogic::expandmaxs( level.spawnmaxs, spawnpoint.origin );
        
        if ( var_ca1f4c8224f92d6d && spawnpoint.script_noteworthy != start_activity )
        {
            continue;
        }
        
        if ( !playerlogic::function_3fe6f281aeceb6b2( spawnpoint.origin ) )
        {
            v_ground = getgroundposition( spawnpoint.origin, var_535c5014851f97ee, var_63196b4068cab675, var_96b6e1b8e7e19fa6 );
            
            if ( v_ground && spawnpoint.origin[ 2 ] < v_ground[ 2 ] )
            {
                spawnpoint.v_original_origin = spawnpoint.origin;
                spawnpoint.origin = v_ground;
            }
            else if ( var_38661a89fb25fc54 && ( !v_ground || v_ground && spawnpoint.origin[ 2 ] > v_ground[ 2 ] && spawnpoint.origin[ 2 ] - v_ground[ 2 ] >= var_63196b4068cab675 ) )
            {
                assertmsg( "<dev string:x3e>" + start_activity + "<dev string:x43>" + spawnpoint.origin );
            }
        }
        
        squadspawnpoints[ squadspawnpoints.size ] = spawnpoint;
    }
    
    if ( var_38661a89fb25fc54 )
    {
        assert( squadspawnpoints.size >= level.maxsquadsize, "<dev string:x77>" + var_90e6314bb00ab7f9 + "<dev string:x87>" + start_activity + "<dev string:xb7>" + squadspawnpoints.size + "<dev string:xc5>" + level.maxsquadsize + "<dev string:xdb>" );
    }
    
    level.var_d5adf83bde10c3f2[ 0 ] = squadspawnpoints;
    level.obspawnarray = [];
    spawnlogic::function_7586157857e9f1be();
    return true;
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x72bb9b24, Offset: 0xdbd
// Size: 0x130, Type: bool
function private function_effb274e1e64bcfc( player )
{
    assert( isplayer( player ) );
    
    if ( !level.gametypebundle.var_76d11c34dc9ca0bf )
    {
        return false;
    }
    
    if ( level utility::flag( "squad_play_begin" ) == 0 )
    {
        return false;
    }
    
    var_1a8adad035115f9e = 0;
    
    foreach ( otherplayer in level.players )
    {
        if ( otherplayer.sessionstate != "spectator" )
        {
            var_1a8adad035115f9e = 1;
            break;
        }
    }
    
    if ( !var_1a8adad035115f9e )
    {
        return false;
    }
    
    activityname = function_7ebdcb1564ed7596();
    var_d27dfde942bc52d1 = level.var_bc6897c06376ba35[ activityname ];
    
    if ( !var_d27dfde942bc52d1 )
    {
        player.var_76d11c34dc9ca0bf = 1;
        player.spawnedasspectator = 1;
        return true;
    }
    
    return false;
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x17250ce, Offset: 0xef6
// Size: 0x6d
function function_6d29b07cb9e7c02b( var_72824aeffdc0d409 )
{
    activity_common::function_944074f3079c1d4e( level.var_15bbf557e90b0a5d, 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( level.var_15bbf557e90b0a5d, 2, &activity_ended );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &function_7c59af1aa960303f, level.var_15bbf557e90b0a5d );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &function_a27d7b127018ca1f, level.var_15bbf557e90b0a5d );
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x2559ec3a, Offset: 0xf6b
// Size: 0x3e
function activity_setup()
{
    level.current_activity = undefined;
    level.var_5bebfee0c0532c02 = undefined;
    activity_instance = self;
    activity_instance endon( "activity_ended" );
    activity_instance endon( "instance_destroyed" );
    namespace_f7219b8aba83a6d5::function_46135a69bddfec2c( activity_instance );
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0xcdd473e0, Offset: 0xfb1
// Size: 0x2a
function activity_ended( activity_succeeded )
{
    activity_instance = self;
    activity_instance endon( "instance_destroyed" );
    self notify( "story_mission_activity_complete" );
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0xdb1da9dd, Offset: 0xfe3
// Size: 0x4e
function function_470b4f0cecef4cf4( relevantinfostruct )
{
    var_983974fc347bb3cb = spawnstruct();
    var_983974fc347bb3cb.origin = ( 0, 0, 0 );
    var_983974fc347bb3cb.angles = ( 0, 0, 0 );
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0xaf35f85d, Offset: 0x1039
// Size: 0x38
function function_7c59af1aa960303f( var_8fb6571535ac1544 )
{
    player_list = var_8fb6571535ac1544.playerlist;
    var_99e714060e093089 = var_8fb6571535ac1544.playerjoinreason;
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x736a1179, Offset: 0x1079
// Size: 0x23
function function_a27d7b127018ca1f( var_8fb6571535ac1544 )
{
    player_list = var_8fb6571535ac1544.playerlist;
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x71837c52, Offset: 0x10a4
// Size: 0xa6
function function_a535ecaaab8427b7()
{
    activity_name = function_bee0f1dccea194c9();
    level thread activity_dvar_monitor( activity_name );
    function_8ad3cf87f4ba10c1();
    
    foreach ( player in level.players )
    {
        player function_88ce0712f3ddff2b();
    }
    
    waittillframeend();
    function_920a32d79864afc9( activity_name );
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0xed125d2, Offset: 0x1152
// Size: 0x6b
function function_b69ee4ccc5e7a2ae( var_c4b81fdb7227e24a )
{
    assert( isdefined( var_c4b81fdb7227e24a ) );
    level.var_a382d6287e313bba = var_c4b81fdb7227e24a;
    spawnstructs = function_cd6312d47189177e( level.var_a382d6287e313bba );
    
    if ( spawnstructs.size > 0 && isstruct( spawnstructs[ 0 ] ) && isdefined( spawnstructs[ 0 ].origin ) )
    {
        namespace_d2e8fad0efd14692::function_951c981f223e8243( spawnstructs );
    }
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x8fc2a972, Offset: 0x11c5
// Size: 0x174
function function_ea3b18bcb9d3712c( var_c4b81fdb7227e24a )
{
    level endon( "story_mission_startpoint_called" );
    utility::flag_wait( "ai_spawn_director_initialized" );
    utility::flag_wait( "squad_play_begin" );
    var_df38c15053330cc6 = 1;
    function_b69ee4ccc5e7a2ae( var_c4b81fdb7227e24a );
    level.var_7d47cb5d61025784 = level.var_61ebb29663502331[ var_c4b81fdb7227e24a ][ "index" ];
    level utility::flag_wait( "player_ready_check" );
    
    for ( i = level.var_7d47cb5d61025784; i < level.var_ae7c2fda204460e5.size ; i++ )
    {
        activityname = level.var_ae7c2fda204460e5[ i ][ "activity_name" ];
        level.var_7d47cb5d61025784 = level.var_ae7c2fda204460e5[ i ][ "index" ];
        var_34db64412ba799f3 = i == 0 || level.var_f60eae0064d6d1d5 != 0;
        ob::function_b2d4c209cff8d689( level.players, level.var_cb018da643621c92[ activityname ], var_34db64412ba799f3 );
        
        if ( isdefined( level.var_410d479b8aef0b04[ activityname ] ) )
        {
            namespace_299913de46d0a77::function_a48b62f60cf25573( level.players, level.var_410d479b8aef0b04[ activityname ] );
        }
        
        function_7f13f428fbfac6fc( activityname );
        namespace_d2e8fad0efd14692::function_748eea17e27f7d83( level.var_f0a9140ddebbe709[ activityname ] );
        activity_instance = function_13e5713a964f6b0d( activityname, activityname, var_df38c15053330cc6 );
        var_df38c15053330cc6 = 0;
        activity_instance waittill( "story_mission_activity_complete" );
        function_52b64d7eb77155b8();
    }
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xc23d9d6f, Offset: 0x1341
// Size: 0x242
function private function_d75c7c1c7a10b8f1( relevantinfostruct )
{
    activityinstance = self;
    activitymoment = relevantinfostruct.activitymoment;
    
    if ( activitymoment == "ActivityBegin" && isdefined( activityinstance.type ) )
    {
        function_b69ee4ccc5e7a2ae( activityinstance.type );
    }
    
    if ( level.var_c50d61acef71b3a3[ activityinstance.type ] )
    {
        foreach ( player in level.players )
        {
            player function_53bd6710a606e0a();
        }
    }
    
    if ( isarray( level.players ) && isdefined( level.outbreakdata ) )
    {
        foreach ( player in level.players )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            level.mapindex = level.mapindex ?? -1;
            
            if ( level.mapindex < 0 )
            {
                maptable = getmapnamesforgamemode();
                
                if ( isdefined( maptable ) )
                {
                    level.mapindex = function_f02c63b99c9614c9( maptable, level.mapname ?? "" ) ?? -1;
                }
            }
            
            player setplayerdata( level.outbreakdata, "missionContinue", "map", level.mapindex );
            player setplayerdata( level.outbreakdata, "missionContinue", "start", level.var_7d47cb5d61025784 ?? -1 );
            player setplayerdata( level.outbreakdata, "missionContinue", "playlist", getplaylistid() );
        }
    }
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0xbfc878a7, Offset: 0x158b
// Size: 0xf
function private function_82b7113c91892e85()
{
    level utility::flag_wait( "story_mission_party_check_complete" );
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x4651bcf6, Offset: 0x15a2
// Size: 0x115
function private function_7f13f428fbfac6fc( var_c4b81fdb7227e24a )
{
    missiondata = utility::callsharedfunc( #"save", #"hash_98f4cb052667f5b" );
    
    if ( isdefined( missiondata ) )
    {
        if ( missiondata.var_25b6a3a8ca3b16ed != var_c4b81fdb7227e24a )
        {
            foreach ( player in level.players )
            {
                player.var_27fd0d2a449557bf = undefined;
                player.var_755ed09478df002 = undefined;
                
                if ( player.sessionstate == "playing" )
                {
                    player utility::callsharedfunc( #"coop", #"hash_ef677de46ca0c35" );
                }
            }
            
            save::function_422a0e1d525c7257();
        }
        
        missiondata.var_25b6a3a8ca3b16ed = namespace_d2e8fad0efd14692::function_4d54689d3fb836( var_c4b81fdb7227e24a );
    }
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x9bbb9ef1, Offset: 0x16bf
// Size: 0x14a
function function_4cb6bbb828dc347d()
{
    if ( level.var_4cb6bbb828dc347d || function_9ff5a5ba55728756() )
    {
        return;
    }
    
    missiondata = utility::callsharedfunc( #"save", #"hash_98f4cb052667f5b" );
    
    if ( isdefined( missiondata.var_25b6a3a8ca3b16ed ) )
    {
        foreach ( player in level.players )
        {
            if ( player.sessionstate == "playing" )
            {
                player namespace_f3a407bc35a59caf::function_4db318217e28a53d( "was_killed" );
            }
            
            player namespace_f3a407bc35a59caf::function_4db318217e28a53d( "was_wiped" );
        }
        
        level notify( "activity_dvar_monitor" );
        setdvar( @"hash_b80f8f4bc6065e30", 1 );
        setdvar( @"hash_d5d17ffd60db08fc", level.players.size );
        function_e0f025dda3384eb5( missiondata.var_25b6a3a8ca3b16ed );
        missiondata.var_9c49f989244a10d1 = 1;
        level.var_4cb6bbb828dc347d = 1;
        map_restart( 1 );
    }
}

// Namespace ob_gametype_story_mission
// Params 2
// Checksum 0x9a506df4, Offset: 0x1811
// Size: 0x2e3
function add_start( activity_name, options )
{
    regiondifficulty = options.difficulty;
    var_191c73a8b440065c = options.power;
    var_ceec1187bd7a80cb = options.var_174cf701b025c115 ?? 0;
    var_8504ec12ea75e5d0 = options.var_41cf7da898eb883 ?? 0;
    var_c301ec3772c83a3c = options.var_c301ec3772c83a3c ?? 1;
    var_66a51509ad2a0abe = options.var_b4be2168cc0ffea5;
    var_40c1329849e4e91f = options.var_40c1329849e4e91f ?? 0;
    
    if ( !isdefined( level.var_ae7c2fda204460e5 ) )
    {
        level.var_ae7c2fda204460e5 = [];
    }
    
    if ( isstring( var_66a51509ad2a0abe ) )
    {
        var_66a51509ad2a0abe = getxhash( var_66a51509ad2a0abe );
    }
    
    level.var_cc108054db3da739 = regiondifficulty ?? level.var_cc108054db3da739 ?? 1;
    level.var_f7374e0d443a0f83 = var_191c73a8b440065c ?? level.var_f7374e0d443a0f83 ?? "leo_launch";
    
    if ( isdefined( options.loadout ) )
    {
        loadout_index = options.loadout.index;
        var_95b6d03f99b22b74 = options.loadout.rarity;
        level.var_401e11219204bca8 = loadout_index ?? level.var_401e11219204bca8 ?? 0;
        level.var_d752e93d5df524a3 = var_95b6d03f99b22b74 ?? level.var_d752e93d5df524a3 ?? level.var_cc108054db3da739;
        level.var_bc5d95b7b8715a85 = { #var_f91170067a6d805c:options.loadout.var_f91170067a6d805c, #rarity:level.var_d752e93d5df524a3, #index:level.var_401e11219204bca8 };
    }
    else
    {
        level.var_bc5d95b7b8715a85 = level.var_bc5d95b7b8715a85 ?? { #rarity:1, #index:0 };
    }
    
    array = function_b8b9a9cfcefd512d( activity_name );
    level.var_ae7c2fda204460e5[ level.var_ae7c2fda204460e5.size ] = array;
    level.var_61ebb29663502331[ activity_name ] = array;
    level.var_f0a9140ddebbe709[ activity_name ] = level.var_cc108054db3da739;
    level.var_cb018da643621c92[ activity_name ] = level.var_f7374e0d443a0f83;
    level.var_bc6897c06376ba35[ activity_name ] = var_ceec1187bd7a80cb;
    level.var_5cc84d07fa47a2af[ activity_name ] = var_8504ec12ea75e5d0;
    level.var_9bef01ac1984cb4[ activity_name ] = var_40c1329849e4e91f;
    level.var_c50d61acef71b3a3[ activity_name ] = var_c301ec3772c83a3c;
    level.var_e186318f0d510d88[ activity_name ] = level.var_bc5d95b7b8715a85;
    level.var_410d479b8aef0b04[ activity_name ] = var_66a51509ad2a0abe;
}

/#

    // Namespace ob_gametype_story_mission
    // Params 0
    // Checksum 0x8fb38c89, Offset: 0x1afc
    // Size: 0xae, Type: dev
    function function_aaee996f5214b375()
    {
        devgui::function_9082edeb5db93280( "<dev string:xe1>" );
        
        foreach ( startpoint in level.var_ae7c2fda204460e5 )
        {
            devgui::function_cd4e263c1f3018ae( startpoint[ "<dev string:x106>" ], "<dev string:x117>" + "<dev string:x126>" + startpoint[ "<dev string:x106>" ], &function_24e8d33629a4bd36 );
        }
        
        devgui::function_77df7fe7dd273e10();
    }

#/

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xf99c4aeb, Offset: 0x1bb2
// Size: 0x103
function private function_920a32d79864afc9( activity_name )
{
    level notify( "story_mission_startpoint_called" );
    level utility::flag_set( "flag_story_mission_startpoint_called" );
    function_52b64d7eb77155b8();
    var_c4b81fdb7227e24a = activity_name;
    
    if ( getdvarint( @"fpstool_run" ) || getdvarint( @"prof_gameplaygfx" ) )
    {
        setdvar( @"hash_46467383874e22fd", activity_name );
    }
    
    missiondata = utility::callsharedfunc( #"save", #"hash_98f4cb052667f5b" );
    
    if ( !missiondata.var_9c49f989244a10d1 )
    {
        var_ccb5862a325c57a0 = ob::function_1737d21aae7148d2();
        
        if ( var_ccb5862a325c57a0 != "default" )
        {
            var_c4b81fdb7227e24a = var_ccb5862a325c57a0;
        }
    }
    
    level coop::function_84a4cb79f12b855();
    a_s_start = function_cd6312d47189177e( var_c4b81fdb7227e24a );
    
    if ( isdefined( a_s_start ) && isarray( level.players ) )
    {
        coop::teleport_players( level.players, a_s_start );
    }
    
    function_ea3b18bcb9d3712c( var_c4b81fdb7227e24a );
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xe798c8e4, Offset: 0x1cbd
// Size: 0x137
function private activity_dvar_monitor( activity_name )
{
    level endon( "game_ended" );
    level endon( "activity_dvar_monitor" );
    current_activity = activity_name;
    
    while ( true )
    {
        var_211f3d582dc94bd0 = function_bee0f1dccea194c9();
        
        if ( var_211f3d582dc94bd0 != current_activity )
        {
            var_2c7f016546acd09d = var_211f3d582dc94bd0;
            
            if ( isdefined( level.var_61ebb29663502331[ var_211f3d582dc94bd0 ] ) )
            {
                current_activity = var_211f3d582dc94bd0;
                level thread function_920a32d79864afc9( current_activity );
            }
            else
            {
                assertmsg( var_2c7f016546acd09d + "<dev string:x12b>" );
                function_e0f025dda3384eb5( current_activity );
            }
        }
        
        if ( getdvarint( @"hash_b80f8f4bc6065e30", 0 ) == 1 )
        {
            setdvar( @"hash_b80f8f4bc6065e30", 0 );
            
            foreach ( player in level.players )
            {
                player damage_effects::onexitdeathsdoor();
            }
            
            wait 0.1;
            thread function_4cb6bbb828dc347d();
        }
        
        waitframe();
    }
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xff41de93, Offset: 0x1dfc
// Size: 0x1c
function private function_e0f025dda3384eb5( start_activity )
{
    setdvar( @"hash_c55be8c19db4b2b", start_activity );
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0xe04b9e8f, Offset: 0x1e20
// Size: 0x6a
function private function_bee0f1dccea194c9()
{
    var_8a65589f928bfb95 = level.var_ae7c2fda204460e5[ 0 ][ "activity_name" ];
    setdvarifuninitialized( @"hash_c55be8c19db4b2b", var_8a65589f928bfb95 );
    start_activity = getdvar( @"hash_c55be8c19db4b2b" );
    
    if ( tolower( start_activity ) == "spawn" )
    {
        start_activity = var_8a65589f928bfb95 ?? start_activity;
    }
    
    start_activity = namespace_d2e8fad0efd14692::function_4d54689d3fb836( start_activity );
    return start_activity;
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xac7fb0d7, Offset: 0x1e93
// Size: 0x24
function private function_24e8d33629a4bd36( params )
{
    activity_name = params[ 0 ];
    function_e0f025dda3384eb5( activity_name );
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x743880f9, Offset: 0x1ebf
// Size: 0x37
function private function_b8b9a9cfcefd512d( activity_name )
{
    array = [];
    array[ "activity_name" ] = activity_name;
    array[ "index" ] = level.var_ae7c2fda204460e5.size;
    return array;
}

// Namespace ob_gametype_story_mission
// Params 2, eflags: 0x4
// Checksum 0x28c1a226, Offset: 0x1eff
// Size: 0x32
function private function_52b64d7eb77155b8( var_7797d1586091c491, var_3112e7aaad668534 )
{
    if ( isdefined( level.current_activity ) )
    {
        namespace_f7219b8aba83a6d5::function_9aeeabe50fc9cc3e( level.current_activity );
    }
}

// Namespace ob_gametype_story_mission
// Params 3
// Checksum 0x20230945, Offset: 0x1f39
// Size: 0x9e
function function_13e5713a964f6b0d( activity_type, variant_tag, var_df38c15053330cc6 = 0 )
{
    additionalspawndata = { #var_df38c15053330cc6:var_df38c15053330cc6 };
    level.current_activity = namespace_f7219b8aba83a6d5::createactivityinstance( activity_type, variant_tag, undefined, additionalspawndata );
    
    /#
        iprintlnbold( "<dev string:x147>" + activity_type );
    #/
    
    if ( isdefined( level.players ) )
    {
        activity_participation::function_fb0ec90aaf6d4c61( level.current_activity, level.players );
    }
    
    utility::flag_clear( "flag_story_mission_startpoint_called" );
    return level.current_activity;
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x3ff6b7ad, Offset: 0x1fe0
// Size: 0x17d
function on_player_spawned( params )
{
    self endon( "disconnect" );
    
    if ( !level.var_13808aa36628768a )
    {
        utility::flag_set( "story_mission_party_check_complete" );
    }
    
    if ( !utility::flag( "story_mission_party_check_complete" ) )
    {
        function_72a20681265953cc();
    }
    
    thread ob::function_86ef6f9996499233();
    namespace_b91b956d95a5ec9e::function_5a819ae5d4855fc9();
    
    if ( !level.var_9668852e8a58f4fb )
    {
        while ( !isdefined( level.current_activity ) )
        {
            waitframe();
        }
        
        if ( isdefined( level.var_8ff57499f0d46359 ) )
        {
            namespace_299913de46d0a77::function_8b11db0fe2323bee( level.var_8ff57499f0d46359 );
        }
        
        if ( !self.wasrevived )
        {
            coop::teleport_players( [ self ], level.var_9915faed11e44328 );
            self.wasrevived = undefined;
        }
        
        activity_participation::function_fb0ec90aaf6d4c61( level.current_activity, [ self ] );
        
        /#
            if ( getdvarint( @"hash_6430560bc1ca31b1", 0 ) )
            {
                thread namespace_d2e8fad0efd14692::function_c512e98688e4e357( self );
            }
        #/
        
        if ( getdvarint( @"hash_83571f4204668bf4", 0 ) == 1 )
        {
            thread namespace_d2e8fad0efd14692::function_56b8e693a8061a3d( self );
        }
        
        if ( getdvarint( @"hash_a5bc4354be7c0fe7", 1 ) == 1 && ( !isdefined( self.primaryweapons[ 0 ] ) || isnullweapon( self.primaryweapons[ 0 ] ) || self.primaryweapons[ 0 ].classname == "fist" ) )
        {
            thread namespace_d2e8fad0efd14692::function_4657f38861c52871( "sat_sm_zebra", "sat_pi_atlas" );
        }
        
        utility::ent_flag_set( "ob_sm_player_in_position" );
    }
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x253ba1bf, Offset: 0x2165
// Size: 0x1fb
function function_cd6312d47189177e( activity_name )
{
    var_8170ac7dd7c9e34d = getspawnarray( "mp_ob_spawn_start" );
    a_s_start = [];
    
    foreach ( spawn_point in var_8170ac7dd7c9e34d )
    {
        if ( spawn_point.script_noteworthy == activity_name )
        {
            a_s_start[ a_s_start.size ] = spawn_point;
        }
    }
    
    if ( a_s_start.size == 0 )
    {
        /#
            iprintln( "<dev string:x15d>" );
        #/
        
        return;
    }
    else if ( level.var_5cc84d07fa47a2af[ activity_name ] )
    {
        a_s_start = arraysort( a_s_start, undefined, &function_ccdacd9f1ae0b310 );
    }
    else if ( getdvarint( @"hash_ffbd82cbb1c53080", 0 ) )
    {
        /#
            iprintln( "<dev string:x19d>" );
        #/
        
        sortedarray = [];
        
        for ( index = 0; index < a_s_start.size ; index++ )
        {
            foreach ( item in a_s_start )
            {
                if ( item.target == string( index ) )
                {
                    sortedarray[ sortedarray.size ] = item;
                }
            }
        }
        
        if ( sortedarray.size > 0 )
        {
            a_s_start = sortedarray;
            var_2d864b272511228d = getdvarint( @"hash_25a7a7035efac106", 0 );
            
            if ( var_2d864b272511228d > 0 && isdefined( a_s_start[ var_2d864b272511228d ] ) )
            {
                var_ef56e55153b624e7 = a_s_start[ var_2d864b272511228d ];
                a_s_start[ var_2d864b272511228d ] = a_s_start[ 0 ];
                a_s_start[ 0 ] = var_ef56e55153b624e7;
            }
        }
    }
    
    return a_s_start;
}

// Namespace ob_gametype_story_mission
// Params 2, eflags: 0x4
// Checksum 0x7f108e80, Offset: 0x2369
// Size: 0x34, Type: bool
function private function_ccdacd9f1ae0b310( a, b )
{
    return int( a.target ) < int( b.target );
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0x4c25a27, Offset: 0x23a6
// Size: 0x13f
function function_951e15447cade3c3( var_588cb01a53ec997a )
{
    if ( isdefined( var_588cb01a53ec997a ) )
    {
        level notify( "story_mission_instant_kill_enemy_soldiers_called" );
        
        foreach ( requestid in var_588cb01a53ec997a )
        {
            requestdata = function_9b649316adcccbaa( requestid );
            
            if ( isdefined( requestdata ) )
            {
                function_ef57f478f96b050c( requestid, 0 );
                ai_spawn_director::function_c0dbeea93ba5e2fe( requestid, 1 );
                
                foreach ( ai in requestdata.ai )
                {
                    ai.diequietly = 1;
                    ai.nocorpse = 1;
                    ai kill();
                }
            }
        }
    }
}

// Namespace ob_gametype_story_mission
// Params 1
// Checksum 0xa4ccb8e6, Offset: 0x24ed
// Size: 0xe, Type: bool
function function_9b991061f96ab4f7( v_origin )
{
    return true;
}

/#

    // Namespace ob_gametype_story_mission
    // Params 1
    // Checksum 0xdff066ff, Offset: 0x2504
    // Size: 0x19, Type: dev
    function function_e7e6b5241a21f205( params )
    {
        iprintlnbold( "<dev string:x1cf>" );
    }

#/

// Namespace ob_gametype_story_mission
// Params 2
// Checksum 0xba43db3a, Offset: 0x2525
// Size: 0x1f1
function function_1fb9ccca3958dbb2( var_8e5fb11bbcaa20c5, var_958151dbd0f282ec )
{
    if ( var_958151dbd0f282ec )
    {
        return;
    }
    
    var_7ba7385968835a67 = 0;
    
    foreach ( player in var_8e5fb11bbcaa20c5 )
    {
        player coop::function_eb6e09941acb48e9();
        
        if ( player.sessionstate == "playing" )
        {
            var_7ba7385968835a67++;
        }
    }
    
    if ( var_7ba7385968835a67 > 0 )
    {
        wait 1;
    }
    
    var_c3a9406489555079 = getdvarint( @"hash_4af72e5b55859fa9", 1 ) == 2;
    
    foreach ( player in var_8e5fb11bbcaa20c5 )
    {
        if ( var_c3a9406489555079 )
        {
            player function_53bd6710a606e0a();
            continue;
        }
        
        level thread game_utility::fadetoblackforplayer( player, 1, var_7ba7385968835a67 > 0 ? 0.5 : 0 );
    }
    
    if ( var_c3a9406489555079 )
    {
        return;
    }
    
    if ( var_7ba7385968835a67 > 0 )
    {
        foreach ( player in var_8e5fb11bbcaa20c5 )
        {
            player utility::delaythread( 0.65, &damage_effects::onexitdeathsdoor );
        }
        
        wait 0.75;
    }
    
    level thread function_4cb6bbb828dc347d();
}

// Namespace ob_gametype_story_mission
// Params 2, eflags: 0x4
// Checksum 0x3d4ee856, Offset: 0x271e
// Size: 0x5f
function private function_9142baea1cccc1ed( spectatedplayer, locationoverride )
{
    assert( isplayer( self ) );
    var_9ac0510d86642c41 = namespace_ac5173199f83b454::function_c1ff5f7338491b7( spectatedplayer, locationoverride );
    
    if ( !var_9ac0510d86642c41.success || level.var_1fe9ae2fed8cc836 )
    {
        var_9ac0510d86642c41 = function_5d1c2eb342892bb( var_9ac0510d86642c41 );
    }
    
    return var_9ac0510d86642c41;
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0xa2ba2811, Offset: 0x2786
// Size: 0x81
function private function_5d1c2eb342892bb( var_cd70627ca77f529a )
{
    assert( isplayer( self ) );
    player = self;
    var_717209934d6fe63a = level.var_9915faed11e44328;
    
    if ( isarray( var_717209934d6fe63a ) && isdefined( player.sessionuimemberindex ) )
    {
        squadmemberindex = int( clamp( player.sessionuimemberindex ?? 0, 0, var_717209934d6fe63a.size - 1 ) );
        return var_717209934d6fe63a[ squadmemberindex ];
    }
    
    return var_cd70627ca77f529a;
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x723f62b9, Offset: 0x2810
// Size: 0x82
function function_53bd6710a606e0a()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    assert( isplayer( self ) );
    player = self;
    
    if ( player.sessionstate == "playing" && player.inlaststand )
    {
        player thread function_71ff58ec1ea94ec8( &laststand::exit, "last_stand_revived", player );
        return;
    }
    
    if ( player.sessionstate != "playing" )
    {
        player thread function_71ff58ec1ea94ec8( &teamrevive::respawn );
        return;
    }
}

// Namespace ob_gametype_story_mission
// Params 3, eflags: 0x4c variadic
// Checksum 0xc9fe7e69, Offset: 0x289a
// Size: 0xa4
function private function_71ff58ec1ea94ec8( var_a4dcb81b82e3e6e4, ... )
{
    self notify( "a890b8529cadbd3d" );
    self endon( "a890b8529cadbd3d" );
    assert( isplayer( self ) );
    assert( isfunction( var_a4dcb81b82e3e6e4 ) );
    player = self;
    player endon( "disconnect" );
    player [[ var_a4dcb81b82e3e6e4 ]]( flat_args( vararg, varargcount ) );
    
    while ( player.sessionstate != "playing" )
    {
        waitframe();
    }
    
    waitframe();
    s_start = player function_5d1c2eb342892bb();
    
    if ( isdefined( s_start ) )
    {
        coop::teleport_player( player, s_start );
    }
}

/#

    // Namespace ob_gametype_story_mission
    // Params 0, eflags: 0x4
    // Checksum 0xf29046b2, Offset: 0x2946
    // Size: 0x8a, Type: dev
    function private function_a218cde1c6260be2()
    {
        var_9e1797348c8d20d5 = [];
        
        foreach ( actname, var_861d34a0c5f52303 in level.var_61ebb29663502331 )
        {
            var_9e1797348c8d20d5[ var_9e1797348c8d20d5.size ] = actname;
        }
        
        return var_9e1797348c8d20d5;
    }

#/

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x9db7a2ab, Offset: 0x29d8
// Size: 0x144
function private function_23e93443efaab71e( params )
{
    activityname = params[ 0 ] ?? "???";
    
    if ( isdefined( level.var_61ebb29663502331[ activityname ] ) )
    {
        /#
            level thread ob::function_e1170951b62312fc( level.players, activityname );
        #/
        
        setdvar( @"start", activityname );
    }
    else
    {
        setdvar( @"start", "default" );
        setdvar( @"hash_364afa6c813448af", "default" );
    }
    
    foreach ( player in level.players )
    {
        player damage_effects::onexitdeathsdoor();
    }
    
    wait 0.1;
    setdvar( @"hash_b80f8f4bc6065e30", 2 );
    setdvar( @"hash_d5d17ffd60db08fc", level.players.size );
    setdvar( @"hash_10a81f3d3159dfd6", level.players.size );
    map_restart();
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0x3470aed2, Offset: 0x2b24
// Size: 0x30
function private function_8ad3cf87f4ba10c1()
{
    level.var_13808aa36628768a = 1;
    
    if ( utility::flag( "story_mission_party_check_complete" ) )
    {
        return;
    }
    
    level coop::player_ready_check();
    utility::flag_set( "story_mission_party_check_complete" );
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0x68201396, Offset: 0x2b5c
// Size: 0x15
function private function_72a20681265953cc()
{
    val::set( "story_mission_lock", "freezecontrols", 1 );
}

// Namespace ob_gametype_story_mission
// Params 0, eflags: 0x4
// Checksum 0xd2fc1ed7, Offset: 0x2b79
// Size: 0xe
function private function_88ce0712f3ddff2b()
{
    val::reset_all( "story_mission_lock" );
}

// Namespace ob_gametype_story_mission
// Params 0
// Checksum 0x1b41ba92, Offset: 0x2b8f
// Size: 0x56
function function_a84a883b65da29a1()
{
    utility::flag_wait( "ai_spawn_director_initialized" );
    function_a25acb62ddab20e2( "squad_size_large", 1 );
    
    if ( getdvarint( @"hash_f8331ad7ff441fb2", 1 ) )
    {
        callback::add( #"player_spawned", &function_43008c4ae1605b4b );
        callback::add( #"player_disconnect", &function_43008c4ae1605b4b );
    }
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x8ca0d583, Offset: 0x2bed
// Size: 0xcd
function private function_43008c4ae1605b4b( params )
{
    player_count = level.players.size;
    function_a25acb62ddab20e2( "squad_size_small", 0 );
    function_a25acb62ddab20e2( "squad_size_large", 0 );
    
    switch ( player_count )
    {
        case 1:
        case 2:
            var_cfba1881f075f71c = "squad_size_small";
            level.var_2d579c257171a921 = 1;
            break;
        case 3:
        case 4:
            var_cfba1881f075f71c = "squad_size_large";
            level.var_2d579c257171a921 = 0;
            break;
        default:
            var_cfba1881f075f71c = "squad_size_small";
            level.var_2d579c257171a921 = 1;
            break;
    }
    
    function_a25acb62ddab20e2( var_cfba1881f075f71c, 1 );
}

// Namespace ob_gametype_story_mission
// Params 2
// Checksum 0x8f8fb602, Offset: 0x2cc2
// Size: 0x58
function function_bdbb24f577154fa7( var_2ef8371291854d07, var_5b5db2cdb5580eb2 = 0 )
{
    if ( isdefined( var_2ef8371291854d07 ) )
    {
        player::_setsuit( var_2ef8371291854d07 );
        self skydive_autodeployoff();
    }
    
    if ( var_5b5db2cdb5580eb2 )
    {
        self skydive_setbasejumpingstatus( 0 );
        self skydive_setdeploymentstatus( 0 );
        return;
    }
    
    self skydive_setbasejumpingstatus( 1 );
    self skydive_setdeploymentstatus( 1 );
}

// Namespace ob_gametype_story_mission
// Params 1, eflags: 0x4
// Checksum 0x4b189a79, Offset: 0x2d22
// Size: 0x1f
function private function_5bfc61f98c2501a5( player )
{
    if ( player )
    {
        player thread function_7ce217a3236fe968( "ob_sm_checkpoint_loadout" );
    }
}

