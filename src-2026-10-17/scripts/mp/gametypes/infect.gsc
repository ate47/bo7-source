#using script_11083f13727030d8;
#using script_194f8050b4a6d3a1;
#using script_19aec99df234f03a;
#using script_26f5997b01261edd;
#using script_2ad7dff7e51218da;
#using script_2b51dca51198db31;
#using script_2bf5529af94c9a0;
#using script_30a611dc97bb45c;
#using script_353e34c229ca1589;
#using script_3c8ea7f78632414c;
#using script_49ad4836e54c2e6b;
#using script_49e4a4c208f44b76;
#using script_4f9ce8d249a99f4a;
#using script_5560f3066718e34c;
#using script_596b87215f1ff115;
#using script_5c71abbf7c9f54bc;
#using script_629fd7d4479d556d;
#using script_6995a3eb7d571a9f;
#using script_734dce84c468439b;
#using script_762e73cd6088bff;
#using script_7af4b8f37e520205;
#using script_7b1e082b2533e255;
#using script_7c5632db7555b4f5;
#using script_9b5f893c39bde3a;
#using script_d661692006989e6;
#using scripts\common\callbacks;
#using scripts\common\gameplay_sound_fx;
#using scripts\common\script;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_spawn;
#using scripts\common\weapon;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\class;
#using scripts\mp\equipment;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\arm;
#using scripts\mp\gametypes\common;
#using scripts\mp\globallogic;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\juggernaut;
#using scripts\mp\matchdata;
#using scripts\mp\menus;
#using scripts\mp\operator;
#using scripts\mp\parachute;
#using scripts\mp\persistence;
#using scripts\mp\playerhealth;
#using scripts\mp\playerlogic;
#using scripts\mp\playerstats_interface;
#using scripts\mp\rank;
#using scripts\mp\spawnlogic;
#using scripts\mp\supers;

#namespace infect;

// Namespace infect
// Params 0
// Checksum 0x1b1f8dae, Offset: 0x11a1
// Size: 0x405
function main()
{
    globallogic::init();
    globallogic::setupcallbacks();
    matchmakingmatch = getdvarint( @"onlinegame" ) && !getdvarint( @"xblive_privatematch" );
    
    if ( matchmakingmatch )
    {
        level.isgroundwarinfected = getdvarint( @"scr_infect_groundwarinfect", 0 );
    }
    
    /#
        level.isgroundwarinfected = getdvarint( @"scr_infect_groundwarinfect", 0 );
    #/
    
    allowed[ 0 ] = game_utility::getgametype();
    allowed[ allowed.size ] = "grnd";
    
    if ( level.isgroundwarinfected )
    {
        allowed[ allowed.size ] = "arm";
    }
    
    gameobjects::main( allowed );
    level.initializematchrules = &initializematchrules;
    [[ level.initializematchrules ]]();
    level thread game_utility_mp::reinitializematchrulesonmigration();
    updategametypedvars();
    thread buildandloadweapons();
    level.extratimeincreasecount = 0;
    level.extratimeincreasecountcap = getdvarint( @"hash_12925902a8e3c314", 20 );
    level.ignorekdrstats = 1;
    level.didhalfscorevoboost = 0;
    level.var_7adc552c43621a2d = 0;
    thread waitthensetstatgroupreadonly();
    callback::add( #"game_ended", &ongameended );
    callback::add( #"grenade_fire", &function_bae757b92b999235 );
    callback::add( #"player_death", &infect_onplayerkilled );
    callback::add( #"player_spawned", &infect_onplayerspawned );
    
    if ( level.gametypebundle.var_bd8c24ff7eaf506 )
    {
        callback::add( #"hash_d4bbb4278ed1fcab", &function_e8330199e3be6ed7 );
    }
    
    level.teambased = 1;
    level.supportintel = 0;
    level.disableforfeit = 1;
    level.nobuddyspawns = 1;
    level.var_c998633bab11f3f8 = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.modeonspawnplayer = &onspawnplayer;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.onnormaldeath = &onnormaldeath;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.forceteamassignmentoverride = &function_4edd66f3e43a1aa3;
    level.var_a36865ea27883563 = &disable_headless;
    level.bypassclasschoicefunc = &class::alwaysgamemodeclass;
    level.var_4a236ad5127e311f = &function_b491a9663b287bce;
    level.gamemodespawnprotectedcallback = &gamemodespawnprotectedcallback;
    level.var_d0594eb464c4d6ee = &function_558b081106d8c6e8;
    
    if ( isdefined( level.gametypebundle.var_991982d965bdf89d ) )
    {
        level callback::add( "on_zombie_ai_killed", &function_6ed4bb386145f46 );
    }
    
    level.disablecopycatloadout = 1;
    setomnvar( "ui_killcam_copycat", 0 );
    level.infectednightmode = getdvarint( @"scr_infect_nvgmode", 0 );
    level.infecteddisablenvg = getdvarint( @"hash_b236732b505b9983", 0 );
    level.onlineprimaryoverride = getdvarint( @"scr_infect_onlineprimaryoverride", 0 );
    utility::registersharedfunc( #"game", #"roundnumberdifficulty", &get_shared_round_number );
    utility::registersharedfunc( #"damage", #"hash_7f94b6a02e13629f", &function_f3e5f008e97aa938 );
    
    if ( getdvarint( @"scr_snowball_pile_enabled", 0 ) )
    {
        level.var_43f317b13b746709 = &function_2b3b88a70165417f;
    }
    
    utility::registersharedfunc( #"tac_insert", #"hash_3a8e8197efa33bc1", &function_93ab72f2ed0af45d );
    utility::registersharedfunc( #"powerups", #"checkShouldDrop", &function_f6b0aca81fd1fec4 );
    level.infect_analytics = {};
    level.var_f616fa52ba357b3 = isdefined( level.gametypebundle.awardtiers );
    level.var_206b7613991179e2 = isdefined( level.gametypebundle.var_95af438b170b17d0 );
    thread function_91f5a744be64c1ee();
}

// Namespace infect
// Params 0
// Checksum 0x6e14a5c1, Offset: 0x15ae
// Size: 0x11, Type: bool
function function_2b3b88a70165417f()
{
    return !arraycontains( level.infect_players, self );
}

// Namespace infect
// Params 0
// Checksum 0xf5dedd25, Offset: 0x15c8
// Size: 0x42
function waitthensetstatgroupreadonly()
{
    self endon( #"game_ended" );
    wait 1;
    
    if ( isdefined( level.playerstats ) )
    {
        playerstats_interface::makeplayerstatgroupreadonly( "kdr" );
        playerstats_interface::makeplayerstatgroupreadonly( "losses" );
        playerstats_interface::makeplayerstatgroupreadonly( "winLoss" );
    }
}

// Namespace infect
// Params 0
// Checksum 0x338d047, Offset: 0x1612
// Size: 0x2d4
function initializematchrules()
{
    game_utility_mp::setcommonrulesfrommatchrulesdata();
    setdynamicdvar( @"scr_infect_numinitialinfected", getmatchrulesdata( "infectData", "numInitialInfected" ) );
    setdynamicdvar( @"hash_f86609bf7337dbc", getmatchrulesdata( "infectData", "infectedEnableInitialLoadouts" ) );
    setdynamicdvar( @"scr_infect_weaponsurvivorprimary", getmatchrulesdata( "infectData", "weaponSurvivorPrimary" ) );
    setdynamicdvar( @"scr_infect_weaponsurvivorsecondary", getmatchrulesdata( "infectData", "weaponSurvivorSecondary" ) );
    setdynamicdvar( @"scr_infect_lethalsurvivor", getmatchrulesdata( "infectData", "lethalSurvivor" ) );
    setdynamicdvar( @"scr_infect_tacticalsurvivor", getmatchrulesdata( "infectData", "tacticalSurvivor" ) );
    setdynamicdvar( @"scr_infect_supersurvivor", getmatchrulesdata( "infectData", "superSurvivor" ) );
    setdynamicdvar( @"scr_infect_supersurvivortwo", getmatchrulesdata( "infectData", "superSurvivorTwo" ) );
    setdynamicdvar( @"scr_infect_weaponinfectprimary", getmatchrulesdata( "infectData", "weaponInfectPrimary" ) );
    setdynamicdvar( @"scr_infect_weaponinfectsecondary", getmatchrulesdata( "infectData", "weaponInfectSecondary" ) );
    setdynamicdvar( @"scr_infect_lethalinfect", getmatchrulesdata( "infectData", "lethalInfect" ) );
    setdynamicdvar( @"scr_infect_tacticalinfect", getmatchrulesdata( "infectData", "tacticalInfect" ) );
    setdynamicdvar( @"scr_infect_weaponinitialprimary", getmatchrulesdata( "infectData", "weaponInitialPrimary" ) );
    setdynamicdvar( @"scr_infect_weaponinitialsecondary", getmatchrulesdata( "infectData", "weaponInitialSecondary" ) );
    setdynamicdvar( @"scr_infect_superinfect", getmatchrulesdata( "infectData", "superInfect" ) );
    setdynamicdvar( @"scr_infect_superinfecttwo", getmatchrulesdata( "infectData", "superInfectTwo" ) );
    setdynamicdvar( @"scr_infect_infectextratimeperkill", getmatchrulesdata( "infectData", "infectExtraTimePerKill" ) );
    setdynamicdvar( @"scr_infect_survivoralivescore", getmatchrulesdata( "infectData", "survivorAliveScore" ) );
    setdynamicdvar( @"scr_infect_survivorscoretime", getmatchrulesdata( "infectData", "survivorScoreTime" ) );
    setdynamicdvar( @"scr_infect_survivorscorepertick", getmatchrulesdata( "infectData", "survivorScorePerTick" ) );
    setdynamicdvar( @"scr_infect_infectstreakbonus", getmatchrulesdata( "infectData", "infectStreakBonus" ) );
    setdynamicdvar( @"scr_infect_enableinfectedtracker", getmatchrulesdata( "infectData", "enableInfectedTracker" ) );
    setdynamicdvar( @"scr_infect_enableping", getmatchrulesdata( "infectData", "enablePing" ) );
    setdynamicdvar( @"scr_infect_givetkontispawn", getmatchrulesdata( "infectData", "giveTKOnTISpawn" ) );
    setdynamicdvar( @"scr_infect_promode", 0 );
    level.infectedrounds = getmatchrulesdata( "commonOption", "roundLimit" ) ?? 1;
}

// Namespace infect
// Params 0
// Checksum 0x9ac4c40b, Offset: 0x18ee
// Size: 0x2c1
function onstartgametype()
{
    setclientnamemode( "auto_change" );
    
    foreach ( entry in level.teamnamelist )
    {
        game_utility_mp::setobjectivetext( entry, &"objectives/infect" );
        
        if ( level.splitscreen )
        {
            game_utility_mp::setobjectivescoretext( entry, &"objectives/infect" );
        }
        else
        {
            game_utility_mp::setobjectivescoretext( entry, &"objectives/infect_score" );
        }
        
        game_utility_mp::setobjectivehinttext( entry, &"objectives/infect_hint" );
    }
    
    if ( game_utility::islargemap() )
    {
        parachute::initparachutedvars();
        
        if ( !isdefined( level.var_f49e119ce25800d3 ) )
        {
            level.var_f49e119ce25800d3 = getdvarint( @"scr_infect_parachute_allowed", 1 );
        }
        
        level.infectparachuteheightoffset = getdvarint( @"hash_11c720f90b371e56", 3000 );
        level.alwaysdoskyspawnontacinsert = getdvarint( @"hash_9f8c0b29c8fb3bef", 0 );
        level.skydiveontacinsertplacement = getdvarint( @"hash_497acc345b08a223", 0 );
        level.allowskydivecutparachute = getdvarint( @"hash_756dcd63dd986f4c", 0 );
        level.var_da12a3c2d9ba0ce2 = getdvarfloat( @"hash_ae7ec88a72783b3e", 2 );
        level.perkpackage_checkifready_callback = &perkpackage_checkifready_callback;
        level.tacinsert_gamemode_callback = &tacinsert_gamemode_callback;
        level.var_55e3eacb4bfeaea6 = &function_48aa21419a10c983;
    }
    
    initspawns();
    level.quickmessagetoall = 1;
    level.infect_allowsuicide = 0;
    level.infect_skipsounds = 0;
    level.playgotinfectedsoundcount = 0;
    level.infect_chosefirstinfected = 0;
    level.infect_choosingfirstinfected = 0;
    level.infect_teamscores[ "axis" ] = 0;
    level.infect_teamscores[ "allies" ] = 0;
    level.infect_players = [];
    
    if ( level.isgroundwarinfected )
    {
        arm::emergency_cleanupents();
        thread init_infectgroundwarvehicles();
    }
    
    thread infectradarthread();
    
    if ( isdefined( level.var_2c037101e01c3dfb ) )
    {
        level thread [[ level.var_2c037101e01c3dfb ]]();
    }
    
    if ( isdefined( level.gametypebundle.powerup_list ) && isdefined( level.sharedfuncs[ #"powerups" ][ #"hash_4ca007fc716f1af9" ] ) )
    {
        level.var_56f90d470cc6babe = &function_9235f31157cec5bc;
        utility::callsharedfunc( #"powerups", #"hash_4ca007fc716f1af9", &function_115e178ce87d08b1 );
    }
    
    updateteamscores();
}

// Namespace infect
// Params 1
// Checksum 0xc8a450ae, Offset: 0x1bb7
// Size: 0x11
function function_4edd66f3e43a1aa3( params )
{
    return "allies";
}

// Namespace infect
// Params 0
// Checksum 0x62dbfe7a, Offset: 0x1bd1
// Size: 0x4b0
function updategametypedvars()
{
    common::updatecommongametypedvars();
    level.numinitialinfected = dvars::dvarintvalue( "numInitialInfected", 1, 1, 9 );
    level.infectedEnableInitialLoadouts = getdvarint( @"hash_f86609bf7337dbc", 0 );
    level.survivorprimaryweapon = getdvar( @"scr_infect_weaponsurvivorprimary", "iw9_sh_mbravo_mp" );
    level.survivorsecondaryweapon = getdvar( @"scr_infect_weaponsurvivorsecondary", "iw9_pi_golf17_mp" );
    level.survivorlethal = getdvar( @"scr_infect_lethalsurvivor", "equip_claymore" );
    level.survivortactical = getdvar( @"scr_infect_tacticalsurvivor", "equip_concussion" );
    level.survivorsuper = getdvar( @"scr_infect_supersurvivor", "super_tac_cover" );
    level.survivorsupertwo = getdvar( @"scr_infect_supersurvivortwo", "none" );
    level.infectedprimaryweapon = getdvar( @"scr_infect_weaponinfectprimary", "iw9_me_knife_mp" );
    level.infectedsecondaryweapon = getdvar( @"scr_infect_weaponinfectsecondary", "iw9_me_fists_mp" );
    level.initialprimaryweapon = getdvar( @"scr_infect_weaponinitialprimary", "iw9_sh_mbravo_mp" );
    level.initialsecondaryweapon = getdvar( @"scr_infect_weaponinitialsecondary", "iw9_pi_golf17_mp" );
    level.infectedlethal = getdvar( @"scr_infect_lethalinfect", "equip_throwing_knife" );
    level.infectedtactical = getdvar( @"scr_infect_tacticalinfect", "equip_tac_insert" );
    level.infectedsuper = getdvar( @"scr_infect_superinfect", "super_deadsilence" );
    level.infectedsupertwo = getdvar( @"scr_infect_superinfecttwo", "none" );
    level.infectextratimeperkill = dvars::dvarfloatvalue( "infectExtraTimePerKill", 30, 0, 60 );
    level.survivoralivescore = dvars::dvarintvalue( "survivorAliveScore", 25, 0, 100 );
    level.survivorscoretime = dvars::dvarfloatvalue( "survivorScoreTime", 30, 0, 60 );
    level.survivorscorepertick = dvars::dvarintvalue( "survivorScorePerTick", 50, 0, 100 );
    level.infectstreakbonus = dvars::dvarintvalue( "infectStreakBonus", 50, 0, 100 );
    level.enableinfectedtracker = dvars::dvarintvalue( "enableInfectedTracker", 0, 0, 1 );
    level.enableping = dvars::dvarintvalue( "enablePing", 0, 0, 1 );
    level.givetkontispawn = dvars::dvarintvalue( "giveTKOnTISpawn", 0, 0, 1 );
    level.infectbonusscore = getdvarint( @"scr_infect_infectbonusscore", 150 );
    level.infectbonussuperonspawn = getdvarint( @"hash_3cf02ba1288e7934", 0 );
    level.infectbonussuperontacinsert = getdvarint( @"hash_21521abc03c44042", 0 );
    level.var_97836b1ed9f70149 = getdvarint( @"hash_79432649c9607465", 20 );
    level.var_7e7e3ab67614fdb6 = getdvarint( @"hash_e72561acfdea085a", 3 );
    level.var_ce114035f4529cfa = getdvarint( @"hash_b577c0842850bf7e", 24 );
    level.var_35c64b9e1c2b3798 = getdvarint( @"hash_2748c18c28569b64", 1 );
    level.survivorstreakoverride = [];
    survivorstreakoverride = getdvar( @"scr_infect_survivorstreakoverride", "" );
    
    if ( survivorstreakoverride != "" )
    {
        level.survivorstreakoverride = strtok( survivorstreakoverride, "," );
    }
    
    mapname = game_utility::getmapname();
    
    if ( issubstr( mapname, "mp_m_" ) && mapname != "mp_m_speed" )
    {
        level.survivorsuper = fixupsupersandtacticalsforgunfightmaps( 0, 0 );
        level.survivorsupertwo = fixupsupersandtacticalsforgunfightmaps( 0, 1 );
        level.infectedsuper = fixupsupersandtacticalsforgunfightmaps( 1, 0 );
        level.infectedsupertwo = fixupsupersandtacticalsforgunfightmaps( 1, 1 );
    }
    
    if ( level.survivorsuper == level.survivorsupertwo )
    {
        level.survivorsupertwo = "none";
    }
    else if ( level.survivorsuper == "none" && level.survivorsupertwo != "none" )
    {
        level.survivorsuper = level.survivorsupertwo;
        level.survivorsupertwo = "none";
    }
    
    if ( level.infectedsuper == level.infectedsupertwo )
    {
        level.infectedsupertwo = "none";
        return;
    }
    
    if ( level.infectedsuper == "none" && level.infectedsupertwo != "none" )
    {
        level.infectedsuper = level.infectedsupertwo;
        level.infectedsupertwo = "none";
    }
}

// Namespace infect
// Params 0
// Checksum 0xb88871b7, Offset: 0x2089
// Size: 0x73
function postfxcleanup()
{
    if ( isdefined( level.gametypebundle.infectedpbgpostfxbundle ) )
    {
        pbgpostfxbundlekill( #"all", level.gametypebundle.infectedpbgpostfxbundle );
    }
    
    waitframe();
    
    if ( isdefined( level.gametypebundle.survivorpbgpostfxbundle ) )
    {
        pbgpostfxbundlestart( #"all", level.gametypebundle.survivorpbgpostfxbundle );
    }
}

// Namespace infect
// Params 1
// Checksum 0x25985262, Offset: 0x2104
// Size: 0x156, Type: bool
function ongameended( winner )
{
    if ( isdefined( level.gametypebundle.powerup_list ) && isdefined( level.sharedfuncs[ #"powerups" ][ #"hudclear" ] ) )
    {
        foreach ( player in level.players )
        {
            player utility::callsharedfunc( #"powerups", #"hudclear" );
        }
    }
    
    foreach ( player in teams::getteamdata( "axis", "players" ) )
    {
        player thread setinfectedmodels();
    }
    
    level thread postfxcleanup();
    function_d668b7424493c625();
    return false;
}

// Namespace infect
// Params 0
// Checksum 0x5bca315d, Offset: 0x2263
// Size: 0x2db
function function_d668b7424493c625()
{
    if ( !isdefined( level.infect_analytics ) )
    {
        level.infect_analytics = {};
    }
    
    if ( !isdefined( level.infect_analytics.powerupdrops ) )
    {
        level.infect_analytics.powerupdrops = [];
    }
    
    game_type = game_utility::getgametype() ?? "";
    map_name = game_utility::getmapname() ?? "";
    playlist_id = getplaylistid() ?? 0;
    playlist_name = getplaylistname() ?? "";
    time = matchdata::gettimefrommatchstart( gettime() );
    time = int( clamp( time, 0, 2147483647 ) );
    infectedplayers = teams::getteamdata( "axis", "players" );
    kills = 0;
    deaths = 0;
    
    foreach ( player in infectedplayers )
    {
        kills += player.pers[ "kills" ] ?? 0;
        deaths += player.pers[ "deaths" ] ?? 0;
    }
    
    deaths = max( deaths, 1 );
    infectedkd = kills / deaths;
    dlog_recordevent( "dlog_event_infect_match_end", [ "game_type", game_type, "map_name", map_name, "playlist_id", playlist_id, "playlist_name", playlist_name, "matchtime_ms", time, "total_infected_killed", level.infect_analytics.infectedkilled ?? 0, "total_fix_up_dropped", level.infect_analytics.powerupdrops[ "fix_up" ] ?? 0, "total_maxammo_dropped", level.infect_analytics.powerupdrops[ "full_ammo" ] ?? 0, "total_fullpower_dropped", level.infect_analytics.powerupdrops[ "full_power" ] ?? 0, "total_instakill_dropped", level.infect_analytics.powerupdrops[ "insta_kill" ] ?? 0, "infected_k_d", infectedkd ?? 0 ] );
}

// Namespace infect
// Params 1
// Checksum 0xab3ecae7, Offset: 0x2546
// Size: 0xe, Type: bool
function get_shared_round_number( v_origin )
{
    return true;
}

// Namespace infect
// Params 0
// Checksum 0xb8790dfd, Offset: 0x255d
// Size: 0x7d
function function_fd8c7d5bca6b5400()
{
    for ( i = 0; i < level.allweapons.size ; i++ )
    {
        weaponname = level.allweapons[ i ];
        
        if ( weaponname == "none" )
        {
            continue;
        }
        
        if ( getsubstr( weaponname, weaponname.size - 3 ) != "_mp" )
        {
            level.allweapons[ i ] += "_mp";
        }
    }
}

// Namespace infect
// Params 0
// Checksum 0xe75b711c, Offset: 0x25e2
// Size: 0x33
function getrandomweapon()
{
    if ( isdefined( level.gametypebundle.var_4c97c92db2cf655a ) )
    {
        return utility::array_random( level.gametypebundle.var_7e0699c7fe2f3355 );
    }
}

// Namespace infect
// Params 0
// Checksum 0x8fae1abb, Offset: 0x261d
// Size: 0x117
function function_5a85540822dd168a()
{
    classtables = [];
    classtables[ #"infected" ] = [];
    classtables[ #"survivor" ] = [];
    classtables[ #"initial_infected" ] = [];
    var_51b719d5f13179ff = level.gametypebundle.var_14a374941dd4696c;
    
    foreach ( loadoutentry in var_51b719d5f13179ff )
    {
        if ( !isdefined( loadoutentry.bundle ) )
        {
            continue;
        }
        
        classtablebundle = getscriptbundle( loadoutentry.bundle );
        assert( isdefined( classtablebundle ), "<dev string:x24>" );
        classtables[ loadoutentry.weapon_type ][ classtables[ loadoutentry.weapon_type ].size ] = classtablebundle;
    }
    
    return classtables;
}

// Namespace infect
// Params 0
// Checksum 0x3496fbf, Offset: 0x273d
// Size: 0x470
function buildandloadweapons()
{
    waitframe();
    
    if ( level.gametypebundle.var_8ae861913d1c7284 )
    {
        function_9b3ffd0cd7cace4b();
        return;
    }
    
    if ( level.onlineprimaryoverride )
    {
        switch ( level.survivorprimaryweapon )
        {
            case #"hash_68a11d587d71608f":
                level.arenaloadouts = 10;
                break;
            case #"hash_173baf947ad402b":
                level.arenaloadouts = 7;
                break;
            case #"hash_daf5a16da560ec6d":
                level.arenaloadouts = 9;
                break;
            case #"hash_fe5820862a460ef4":
                level.arenaloadouts = 8;
                break;
            case #"hash_5d48fa913e5b8a2f":
                level.arenaloadouts = 11;
                break;
            default:
                level.arenaloadouts = 7;
                break;
        }
        
        game[ "arenaRandomLoadout" ] = utility::callsharedfunc( #"arena", #"randomize_loadouts" );
        level.survivorprimaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ];
        
        if ( game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ] != "none" )
        {
            level.survivorsecondaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ];
        }
        
        level.initialprimaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ];
        
        if ( game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ] != "none" )
        {
            level.initialsecondaryweapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondary" ];
        }
    }
    
    level.allweapons = [];
    level.allweapons[ level.allweapons.size ] = level.survivorprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.survivorsecondaryweapon;
    level.allweapons[ level.allweapons.size ] = level.infectedprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.infectedsecondaryweapon;
    level.allweapons[ level.allweapons.size ] = level.initialprimaryweapon;
    level.allweapons[ level.allweapons.size ] = level.initialsecondaryweapon;
    level.allweapons = arrayremoveduplicates( level.allweapons );
    function_fd8c7d5bca6b5400();
    
    foreach ( weapon in level.allweapons )
    {
        if ( weapon != "none" )
        {
            rootname = weapon::getweaponrootname( weapon );
            chosenattachments = [];
            
            if ( level.onlineprimaryoverride )
            {
                if ( weapon == level.allweapons[ 0 ] || weapon == level.allweapons[ 4 ] )
                {
                    for ( i = 1; i < 6 ; i++ )
                    {
                        concat = i;
                        
                        if ( i == 1 )
                        {
                            concat = "";
                        }
                        
                        attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" + concat ];
                        
                        if ( attachment != "none" )
                        {
                            chosenattachments[ chosenattachments.size ] = attachment;
                        }
                    }
                }
                
                if ( weapon == level.allweapons[ 1 ] || weapon == level.allweapons[ 5 ] )
                {
                    for ( i = 1; i < 6 ; i++ )
                    {
                        concat = i;
                        
                        if ( i == 1 )
                        {
                            concat = "";
                        }
                        
                        attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutSecondaryAttachment" + concat ];
                        
                        if ( attachment != "none" )
                        {
                            chosenattachments[ chosenattachments.size ] = attachment;
                        }
                    }
                }
            }
            
            if ( level.infectednightmode )
            {
                game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ] = getthermalscopeperweaponclass();
            }
            
            camoindex = "camo_none";
            reticleindex = "none";
            newweaponobject = weapon::buildweapon( rootname, chosenattachments, camoindex, reticleindex );
            newweapon = getcompleteweaponname( newweaponobject );
        }
    }
    
    level thread setspecialloadouts();
}

// Namespace infect
// Params 0
// Checksum 0x14fa21d2, Offset: 0x2bb5
// Size: 0x145
function getthermalscopeperweaponclass()
{
    weapon = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimary" ] + "_mp";
    weapon_class = weaponclass( weapon );
    level.weapon_class = weapon_class;
    attachment = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
    
    switch ( weapon_class )
    {
        case #"hash_8cdaf2e4ecfe5b51":
        case #"hash_900cb96c552c5e8e":
        case #"hash_fa24dff6bd60a12d":
            var_42c348892189299b = randomintrange( 0, 3 );
            
            if ( var_42c348892189299b == 0 )
            {
                attachment = "thermal";
            }
            else if ( var_42c348892189299b == 0 )
            {
                attachment = "thermal2";
            }
            else
            {
                attachment = "hybrid3";
            }
            
            break;
        case #"hash_6191aaef9f922f96":
            var_42c348892189299b = randomintrange( 0, 3 );
            
            if ( var_42c348892189299b == 0 )
            {
                attachment = "thermal";
            }
            else if ( var_42c348892189299b == 0 )
            {
                attachment = "thermal2";
            }
            else
            {
                attachment = "thermalvz";
            }
            
            break;
        case #"hash_690c0d6a821b42e":
            attachment = "thermal";
        case #"hash_61e969dacaaf9881":
            break;
        case #"hash_719417cb1de832b6":
            break;
        default:
            break;
    }
    
    return attachment;
}

// Namespace infect
// Params 1
// Checksum 0xe2f5584e, Offset: 0x2d03
// Size: 0x5d
function stripweapsuffix( weaponname )
{
    if ( issubstr( weaponname, "mpr" ) )
    {
        weaponname = script::strip_suffix( weaponname, "_mpr" );
    }
    else if ( issubstr( weaponname, "mpl" ) )
    {
        weaponname = script::strip_suffix( weaponname, "_mpl" );
    }
    else
    {
        weaponname = script::strip_suffix( weaponname, "_mp" );
    }
    
    return weaponname;
}

// Namespace infect
// Params 2
// Checksum 0x48a713d6, Offset: 0x2d69
// Size: 0x149
function fixupsupersandtacticalsforgunfightmaps( infected, fieldupgradepro )
{
    if ( fieldupgradepro )
    {
        super = infected ? level.infectedsupertwo : level.survivorsupertwo;
    }
    else
    {
        super = infected ? level.infectedsuper : level.survivorsuper;
    }
    
    switch ( super )
    {
        case #"hash_699e6c3e460adde4":
        case #"hash_7266a252f51150e9":
        case #"hash_ac520bae8aaba66b":
            super = "super_ammo_drop";
            break;
        case #"hash_16577b244953e989":
            if ( infected && level.infectedtactical == "equip_tac_insert" )
            {
                level.infectedtactical = "none";
            }
            else if ( level.survivortactical == "equip_tac_insert" )
            {
                level.survivortactical = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( infected && level.infectedtactical == "equip_trophy" )
            {
                level.infectedtactical = "none";
            }
            else if ( level.survivortactical == "equip_trophy" )
            {
                level.survivortactical = "none";
            }
            
            break;
    }
    
    return super;
}

// Namespace infect
// Params 1
// Checksum 0xb2ecb215, Offset: 0x2ebb
// Size: 0x110
function onplayerconnect( player )
{
    player.gamemodefirstspawn = 1;
    player.gamemodejoinedatstart = 1;
    player.infectedrejoined = 0;
    player.waitedtospawn = 0;
    
    if ( !flags::gameflag( "prematch_done" ) || level.infect_countdowninprogress )
    {
        player.waitedtospawn = 1;
    }
    
    player class::function_e84a99f0f4904c66();
    player loadweaponsforplayer( level.allweapons, 1 );
    
    if ( flags::gameflag( "prematch_done" ) )
    {
        player.gamemodejoinedatstart = 0;
        
        if ( level.infect_chosefirstinfected )
        {
            player.infectedrejoined = 1;
        }
    }
    
    if ( arraycontains( level.infect_players, player ) )
    {
        player.infectedrejoined = 1;
    }
    
    player setplayerloadout();
    player thread monitorsurvivaltime();
    
    if ( level.isgroundwarinfected && level.var_f49e119ce25800d3 )
    {
        player thread skydivehintnotify();
    }
}

// Namespace infect
// Params 0
// Checksum 0x858bfa08, Offset: 0x2fd3
// Size: 0x66
function setplayerloadout()
{
    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
        return;
    }
    
    if ( self.infectedrejoined )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis" ];
        return;
    }
    
    function_9efe0a0a4a484d88();
}

// Namespace infect
// Params 0
// Checksum 0x297abced, Offset: 0x3041
// Size: 0x87
function function_9efe0a0a4a484d88()
{
    survivorloadout = level.infect_loadouts[ "allies" ];
    
    if ( level.gametypebundle.var_7edf0d63e82bf925 )
    {
        survivorloadout = utility::array_random( level.infect_loadouts[ "allies" ] );
    }
    else if ( isdefined( level.infect_loadouts[ "allies" ][ 0 ] ) )
    {
        survivorloadout = level.infect_loadouts[ "allies" ][ 0 ];
    }
    
    self.pers[ "gamemodeLoadout" ] = survivorloadout;
}

// Namespace infect
// Params 0
// Checksum 0x99c0ceaf, Offset: 0x30d0
// Size: 0xc0
function givesurvivortimescore()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        wait level.survivorscoretime;
        
        foreach ( player in level.players )
        {
            if ( player.team == "allies" )
            {
                player thread points::doscoreevent( #"survivor", undefined, level.survivorscorepertick );
            }
        }
    }
}

// Namespace infect
// Params 0
// Checksum 0x164cae0a, Offset: 0x3198
// Size: 0x12d
function initspawns()
{
    spawnlogic::setactivespawnlogic( #"default" );
    spawnlogic::function_6dbabb72223a4bca();
    spawnkey = spawnlogic::function_d5c160a4110b573e();
    level.var_96d0868b3b64b0a1 = spawnlogic::function_5cf82e30c52a895d( spawnkey );
    
    if ( level.var_96d0868b3b64b0a1 )
    {
        spawnlogic::function_3cdbb94b81729d5f( spawnkey );
    }
    else if ( game_utility::islargemap() )
    {
        spawnlogic::function_9bd2654564d3372d( #"start", #"start_attackers", "mp_gw_spawn_allies_start", game[ "attackers" ] );
        spawnlogic::function_9bd2654564d3372d( #"start", #"start_defenders", "mp_gw_spawn_axis_start", game[ "defenders" ] );
        spawnlogic::function_17e08e497a9b4136( #"primary", #"primary", "mp_tdm_spawn" );
        spawnlogic::function_17e08e497a9b4136( #"fallback", #"fallback", "mp_tdm_spawn_secondary", 1 );
    }
    else
    {
        spawnlogic::function_17e08e497a9b4136( #"primary", #"primary", "mp_tdm_spawn" );
        spawnlogic::function_17e08e497a9b4136( #"fallback", #"fallback", "mp_tdm_spawn_secondary", 1 );
    }
    
    spawnlogic::finalizemap();
}

// Namespace infect
// Params 0
// Checksum 0xbf69ed22, Offset: 0x32cd
// Size: 0x87
function getspawnpoint()
{
    if ( isplayer( self ) && self.gamemodefirstspawn )
    {
        self.gamemodefirstspawn = 0;
        class::function_e84a99f0f4904c66();
        teamchoice = "allies";
        
        if ( self.infectedrejoined )
        {
            teamchoice = "axis";
        }
        
        menus::addtoteam( teamchoice );
        thread monitordisconnect();
    }
    
    if ( level.ingraceperiod )
    {
        spawnpoint = spawnlogic::function_ae052a703385152c( self );
    }
    else
    {
        spawnpoint = spawnlogic::function_3f9d5fcfb93d4190( self );
    }
    
    return spawnpoint;
}

// Namespace infect
// Params 1
// Checksum 0xde57713b, Offset: 0x335d
// Size: 0x26f
function onspawnplayer( revivespawn )
{
    self.teamchangedthisframe = undefined;
    self.infect_spawnpos = self.origin;
    self.infectedkillsthislife = 0;
    
    if ( self.pers[ "team" ] == "axis" )
    {
        if ( !isdefined( level.gametypebundle.var_ced21cc5bcb72482 ) )
        {
            battlechatter_mp::disablebattlechatter( self );
        }
        
        if ( level.isgroundwarinfected )
        {
            self.var_48fe61030a581373 = 1;
        }
        
        if ( level.allowskydivecutparachute )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self skydive_cutparachuteoff();
        }
    }
    
    updateteamscores();
    
    if ( !level.infect_choosingfirstinfected )
    {
        level.infect_choosingfirstinfected = 1;
        level thread choosefirstinfected();
    }
    
    if ( !flags::gameflag( "prematch_done" ) || level.infect_countdowninprogress )
    {
        self.waitedtospawn = 0;
    }
    
    if ( self.infectedrejoined )
    {
        if ( !level.infect_allowsuicide )
        {
            level notify( #"infect_stopcountdown" );
            level.infect_chosefirstinfected = 1;
            level.infect_allowsuicide = 1;
            
            foreach ( player in level.players )
            {
                if ( isdefined( player.infect_isbeingchosen ) )
                {
                    player.infect_isbeingchosen = undefined;
                }
            }
        }
        
        foreach ( player in level.players )
        {
            if ( isdefined( player.isinitialinfected ) )
            {
                player thread setinitialtonormalinfected();
            }
        }
        
        if ( level.infect_teamscores[ "axis" ] == 1 )
        {
            self.isinitialinfected = 1;
        }
        
        initsurvivaltime( 1 );
    }
    
    thread onspawnfinished();
    thread updatematchstatushintonspawn();
    level notify( #"spawned_player" );
}

// Namespace infect
// Params 1
// Checksum 0xbf8ee46, Offset: 0x35d4
// Size: 0x77
function function_bae757b92b999235( grenadedata )
{
    if ( self.pers[ "team" ] == "axis" )
    {
        return;
    }
    
    if ( !isdefined( self.var_cd2bd63d770231b5 ) )
    {
        self.var_cd2bd63d770231b5 = [];
    }
    
    self.var_cd2bd63d770231b5 = function_5713d46873b29625( self.var_cd2bd63d770231b5 );
    self.var_cd2bd63d770231b5 = arraycombineunique( self.var_cd2bd63d770231b5, [ grenadedata.grenade ] );
}

// Namespace infect
// Params 0
// Checksum 0x1dcd4e1b, Offset: 0x3653
// Size: 0xac
function spawnwithplayersecondary()
{
    playerweapons = self getweaponslistprimaries();
    playercurrentweapon = self getcurrentprimaryweapon();
    
    if ( playerweapons.size > 1 )
    {
        if ( weapon_utility::isknifeonly( playercurrentweapon ) )
        {
            foreach ( weapon in playerweapons )
            {
                if ( weapon != playercurrentweapon )
                {
                    self setspawnweapon( weapon );
                }
            }
        }
    }
}

// Namespace infect
// Params 1
// Checksum 0x337cb2a5, Offset: 0x3707
// Size: 0x4b
function setdefaultammoclip( team )
{
    setdefaultammoclip = 1;
    
    if ( isdefined( self.isinitialinfected ) )
    {
        if ( game_utility_mp::isusingdefaultclass( team, 1 ) )
        {
            setdefaultammoclip = 0;
        }
    }
    else if ( game_utility_mp::isusingdefaultclass( team, 0 ) )
    {
        setdefaultammoclip = 0;
    }
    
    return setdefaultammoclip;
}

// Namespace infect
// Params 0
// Checksum 0x703fa56b, Offset: 0x375b
// Size: 0x7b4
function onspawnfinished()
{
    self endon( #"death_or_disconnect" );
    self waittill( #"giveloadout" );
    
    if ( self.waitedtospawn )
    {
        self.waitedtospawn = 0;
        self.suicidedfromspawnwait = 1;
        wait 0.1;
        self suicide();
    }
    
    self.last_infected_class = self.infected_class;
    
    if ( self.pers[ "team" ] == "allies" )
    {
        if ( level.enableping )
        {
            perk::giveperk( "specialty_boom" );
        }
        
        if ( level.isgroundwarinfected )
        {
            thread givesuperpointsonprematchdone();
        }
        
        spawnwithplayersecondary();
        
        if ( level.infectednightmode && !level.infecteddisablenvg && !isbot( self ) )
        {
            thread nvgwatcher();
        }
        
        if ( isdefined( level.gametypebundle.survivorpbgpostfxbundle ) )
        {
            pbgpostfxbundlestart( self, level.gametypebundle.survivorpbgpostfxbundle );
        }
        
        self.var_4c85e0abc60e914a = 0;
    }
    else if ( self.pers[ "team" ] == "axis" )
    {
        if ( level.allowskydivecutparachute )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self.var_48fe61030a581373 = 1;
            self skydive_cutparachuteoff();
        }
        
        if ( level.enableping )
        {
            perk::giveperk( "specialty_boom" );
        }
        
        if ( level.gametypebundle.infectedmaxhealth )
        {
            infected_sethealth( level.gametypebundle.infectedmaxhealth, 1 );
        }
        
        self.allowfriendlyfire = level.gametypebundle.var_f8a25ff843aed0e;
        
        if ( level.gametypebundle.var_95af438b170b17d0.spawnchance > 0 && !self.var_94b5dbf11cafc171 && !self.isinitialinfected )
        {
            roll = randomfloatrange( 0, 1 );
            var_2fa4e13353ea45c0 = roll < level.gametypebundle.var_95af438b170b17d0.spawnchance;
            
            /#
                if ( getdvarint( @"hash_7e6e4fb12e97f612", 0 ) )
                {
                    var_2fa4e13353ea45c0 = 1;
                }
            #/
            
            if ( var_2fa4e13353ea45c0 )
            {
                if ( isdefined( level.sharedfuncs[ #"custominfected" ][ #"setSpecialProperties" ] ) )
                {
                    utility::callsharedfunc( #"custominfected", #"setSpecialProperties" );
                }
                
                if ( dialog_utility::function_51c8a1c4bba55ed2( "infect_special_spawned", "allies" ) )
                {
                    dialog::statusdialog( "infect_special_spawned", "allies", "survivorWarning", undefined, undefined, 10000 );
                }
            }
        }
        else if ( self.isinitialinfected && level.gametypebundle.var_95af438b170b17d0 && isdefined( level.sharedfuncs[ #"custominfected" ][ #"setSpecialProperties" ] ) )
        {
            utility::callsharedfunc( #"custominfected", #"setSpecialProperties" );
            waitframe();
        }
        
        self.var_4c85e0abc60e914a = level.gametypebundle.var_b0388bdf8e7c8546;
        
        if ( !self.var_94b5dbf11cafc171 )
        {
            if ( level.gametypebundle.var_c1becf8091cb0499 )
            {
                self setscriptablepartstate( #"infected_vfx", #"super_fx_on" );
            }
            
            if ( isdefined( level.gametypebundle.infectedpbgpostfxbundle ) )
            {
                pbgpostfxbundlestart( self, level.gametypebundle.infectedpbgpostfxbundle );
            }
        }
        
        var_6cb76273b04e3aba = self.var_2e83c20b5dc7c13b ?? 1.05;
        
        if ( !level.isgroundwarinfected )
        {
            var_4f5cd0a8797b75d2 = int( floor( level.infect_teamscores[ "axis" ] / 3 ) );
            var_4f5cd0a8797b75d2 *= 0.01;
            var_6cb76273b04e3aba = max( 1, var_6cb76273b04e3aba - var_4f5cd0a8797b75d2 );
        }
        
        self.overrideweaponspeed_speedscale = var_6cb76273b04e3aba;
        thread setinfectedmsg();
        
        if ( level.infectedtactical == "equip_tac_insert" && !self.isinitialinfected )
        {
            if ( level.givetkontispawn || !level.givetkontispawn && !self.ti_spawn )
            {
                equipment_mp::giveequipment( level.infectedlethal, "primary" );
            }
            else
            {
                equipment_mp::decrementequipmentammo( level.infectedlethal, 1 );
            }
        }
        
        if ( level.infectedtactical != "equip_tac_insert" || level.infectedtactical == "none" )
        {
            equipment_mp::giveequipment( level.infectedtactical, "secondary" );
        }
        else
        {
            perk::giveperk( "specialty_tacticalinsertion" );
        }
        
        thread setinfectedmodels();
        
        if ( level.gametypebundle.var_981033e04d37200c )
        {
            self setcamerathirdperson( 1 );
        }
        
        if ( isdefined( level.gametypebundle.powerup_list ) && isdefined( level.sharedfuncs[ #"powerups" ][ #"getroot" ] ) )
        {
            root = utility::callsharedfunc( #"powerups", #"getroot" );
            
            foreach ( powerup in root.active_powerups )
            {
                powerup function_dd8378dbd3013c27( self );
                waitframe();
            }
        }
        
        if ( level.gametypebundle.var_3a0e5ccce3e62fbd )
        {
            managefists( self.loadoutprimary, self.loadoutsecondary );
        }
        
        self function_3181733c19782bcc( 0 );
    }
    
    if ( level.gametypebundle.var_ad057d62cc415f5b || level.gametypebundle.var_644b9fb84285876 || level.gametypebundle.var_d8d63dca1fcb80db )
    {
        giveextrainfectedperks();
    }
    
    if ( self.movedtoinfected )
    {
        if ( !level.isgroundwarinfected || level.isgroundwarinfected && level.mapname == "mp_aniyah" )
        {
            self.movedtoinfected = undefined;
        }
        
        thread supers_mp::givesuperpoints( 350, undefined, 1 );
        dialog::leaderdialogonplayer( #"infected" );
    }
    
    if ( !level.gametypebundle.var_8598807754a1d1d3 )
    {
        rootname = weapon::getweaponrootname( self.loadoutprimary );
        
        if ( rootname != "iw9_me_knife" )
        {
            self giveweapon( level.defaultknifestab );
            self assignweaponmeleeslot( level.defaultknifestab );
            
            if ( self.loadoutsecondary == "iw9_me_knife_mp" )
            {
                inventory_utility::takeweaponwhensafe( "iw9_me_knife_mp" );
                self giveweapon( "iw9_me_knife_mp" );
            }
        }
    }
    
    if ( self.faux_spawn_infected )
    {
        if ( isdefined( supers_mp::getcurrentsuper() ) && supers_mp::getcurrentsuperref() == "super_deadsilence" )
        {
            thread startdeadsilence();
        }
    }
    
    self.faux_spawn_infected = undefined;
    
    if ( self.isparachutespawning )
    {
        waitframe();
        self.isparachutespawning = undefined;
        thread parachute::startfreefall( level.var_da12a3c2d9ba0ce2, 0, undefined, undefined, 1 );
    }
    
    if ( level.infectbonussuperonspawn > 0 )
    {
        thread supers_mp::givesuperpoints( level.infectbonussuperonspawn, undefined, 1 );
    }
    
    thread waitthensetgendersoundcontext();
}

// Namespace infect
// Params 0
// Checksum 0xaf64c7fa, Offset: 0x3f17
// Size: 0x3b
function function_d86d634b2129d342()
{
    currentsuper = supers_mp::getcurrentsuper( #"default" );
    supercost = supers_mp::getsuperpointsneeded( currentsuper );
    thread supers_mp::givesuperpoints( supercost, undefined, 1 );
}

// Namespace infect
// Params 1
// Checksum 0x19e5da76, Offset: 0x3f5a
// Size: 0xd3
function function_6ed4bb386145f46( params )
{
    attacker = params.eattacker;
    
    if ( !isdefined( attacker ) )
    {
        return;
    }
    
    var_9bc09bc79f28a18e = 1;
    
    if ( level.gametypebundle.var_92a68a8dcbe7314c && attacker.team == "axis" )
    {
        var_9bc09bc79f28a18e = 0;
        attacker.var_a19349c578e7b61 = attacker.var_a19349c578e7b61 ?? 0;
        
        if ( attacker.var_a19349c578e7b61 < level.gametypebundle.var_92a68a8dcbe7314c )
        {
            var_9bc09bc79f28a18e = 1;
        }
        
        attacker.var_a19349c578e7b61++;
    }
    
    if ( var_9bc09bc79f28a18e )
    {
        attacker thread points::doscoreevent( level.gametypebundle.var_991982d965bdf89d );
    }
}

// Namespace infect
// Params 1
// Checksum 0x755a6cb6, Offset: 0x4035
// Size: 0x24, Type: bool
function function_f3e5f008e97aa938( victim )
{
    if ( victim.team == "allies" )
    {
        return true;
    }
    
    return false;
}

// Namespace infect
// Params 2
// Checksum 0x6db4cc9, Offset: 0x4062
// Size: 0x48
function function_9235f31157cec5bc( pickupplayer, powerupinfo )
{
    isinfected = arraycontains( level.infect_players, pickupplayer );
    
    if ( powerupinfo.var_ea83f93d1d359224 && isinfected )
    {
        return 0;
    }
    
    return isinfected;
}

// Namespace infect
// Params 1
// Checksum 0x290d2efd, Offset: 0x40b3
// Size: 0x16
function function_115e178ce87d08b1( powerupent )
{
    level thread function_cdb3a9727d697caf( powerupent );
}

// Namespace infect
// Params 1
// Checksum 0xb0830a92, Offset: 0x40d1
// Size: 0x124
function function_cdb3a9727d697caf( powerupent )
{
    waitframe();
    var_bde93b870aa42ced = level.infect_players;
    
    if ( isdefined( level.sharedfuncs[ #"powerups" ][ #"getroot" ] ) )
    {
        root = utility::callsharedfunc( #"powerups", #"getroot" );
        s_powerup_info = root.powerups[ powerupent.str_powerup ];
        
        if ( s_powerup_info.var_ea83f93d1d359224 )
        {
            var_bde93b870aa42ced = teams::getteamdata( "allies", "players" );
        }
    }
    
    foreach ( player in var_bde93b870aa42ced )
    {
        if ( isdefined( player ) && isdefined( powerupent ) )
        {
            powerupent function_dd8378dbd3013c27( player );
            waitframe();
        }
    }
}

// Namespace infect
// Params 1
// Checksum 0xc341c638, Offset: 0x41fd
// Size: 0x54
function function_dd8378dbd3013c27( player )
{
    self hidefromplayer( player );
    
    if ( isdefined( self.mesh_mdl ) )
    {
        self.mesh_mdl hidefromplayer( player );
    }
    
    if ( isdefined( self.n_powerup_fx ) )
    {
        stopfxontagforclients( self.n_powerup_fx, self, "tag_origin", player );
    }
}

// Namespace infect
// Params 0
// Checksum 0x22e5416, Offset: 0x4259
// Size: 0x49
function waitthensetgendersoundcontext()
{
    self endon( #"death_or_disconnect" );
    wait 0.2;
    
    if ( self.operatorcustomization.gender == "female" )
    {
        self setclientgender( "female" );
        return;
    }
    
    self setclientgender( "" );
}

// Namespace infect
// Params 0
// Checksum 0x2eb059c2, Offset: 0x42aa
// Size: 0x5a
function givesuperpointsonprematchdone()
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    flags::gameflagwait( "prematch_done" );
    
    if ( !isdefined( level.infect_countdowninprogress ) || level.infect_countdowninprogress )
    {
        level waittill( #"hash_10bce3ea93692ce3" );
    }
    
    thread supers_mp::givesuperpoints( 200, undefined, 1 );
}

// Namespace infect
// Params 2
// Checksum 0xf89e7aae, Offset: 0x430c
// Size: 0x6a
function managefists( primary, secondary )
{
    if ( primary != weapon::getweaponrootname( level.defaultfist ) || secondary != weapon::getweaponrootname( level.defaultfist ) )
    {
        if ( primary == "none" && secondary == "none" )
        {
            return;
        }
        
        inventory_utility::takeweaponwhensafe( level.defaultfist );
    }
}

// Namespace infect
// Params 0
// Checksum 0x7f59065f, Offset: 0x437e
// Size: 0x11a
function giveextrainfectedperks()
{
    if ( self.pers[ "team" ] == "allies" )
    {
        extraperks = level.gametypebundle.var_ad057d62cc415f5b;
    }
    else
    {
        extraperks = level.gametypebundle.var_644b9fb84285876;
        
        if ( self.isinitialinfected && !level.gametypebundle.var_eedb2f4cad2abe34 )
        {
            var_b2704c491606a630 = level.gametypebundle.var_d8d63dca1fcb80db;
            extraperks = arraycombine( extraperks, var_b2704c491606a630 );
        }
    }
    
    foreach ( perk in extraperks )
    {
        if ( isdefined( perk ) )
        {
            perk::giveperk( perk.extraperk );
        }
    }
}

// Namespace infect
// Params 0
// Checksum 0xf621c667, Offset: 0x44a0
// Size: 0x12c
function function_31725f5036584fd2()
{
    menus::addtoteam( "axis" );
    
    if ( isdefined( level.gametypebundle.var_ced21cc5bcb72482 ) )
    {
        battlechatter_mp::function_1faea47bf380fcff( level.gametypebundle.var_ced21cc5bcb72482 );
    }
    
    if ( !self.var_88bb12e9468ce4fc )
    {
        self.var_88bb12e9468ce4fc = 1;
        gameplay_sound_fx::function_e319dc8e16c85fcb( #"hash_a90f1482e08eda16", teams::getteamdata( "axis", "players" ) );
    }
    
    if ( !isdefined( self.var_cd2bd63d770231b5 ) )
    {
        self.var_cd2bd63d770231b5 = [];
    }
    
    foreach ( activegrenade in self.var_cd2bd63d770231b5 )
    {
        if ( isdefined( activegrenade ) )
        {
            activegrenade delete();
        }
    }
    
    self.var_cd2bd63d770231b5 = function_5713d46873b29625( self.var_cd2bd63d770231b5 );
    hud_message::showsplash( "infected" );
}

// Namespace infect
// Params 0
// Checksum 0xc68f7653, Offset: 0x45d4
// Size: 0x12, Type: bool
function function_93ab72f2ed0af45d()
{
    if ( self.isinitialinfected )
    {
        return false;
    }
    
    return true;
}

// Namespace infect
// Params 2
// Checksum 0xb1314659, Offset: 0x45ef
// Size: 0x4a
function infected_sethealth( newmaxhealth, var_8d6017cd69685ec9 )
{
    if ( self.health >= newmaxhealth )
    {
        self.health = newmaxhealth;
    }
    
    self.maxhealth = newmaxhealth;
    
    if ( var_8d6017cd69685ec9 )
    {
        self.health = newmaxhealth;
    }
}

// Namespace infect
// Params 0
// Checksum 0x934ab6ec, Offset: 0x4641
// Size: 0x123
function setinfectedmodels()
{
    if ( isdefined( level.gametypebundle.var_ed4ee37d8e5d6445 ) && isdefined( level.gametypebundle.var_48be32eeff875d04 ) )
    {
        operatorref = operator::isfemale() ? level.gametypebundle.var_ed4ee37d8e5d6445 : level.gametypebundle.var_48be32eeff875d04;
        operatorbundle = getoperatorscriptbundle( operatorref );
        skinindex = operator::isfemale() ? level.gametypebundle.var_29ed4b11caaefa1 : level.gametypebundle.var_97e6299c1523b262;
        var_16b1d09e3f9d5e94 = isdefined( skinindex ) && isdefined( operatorbundle.skins[ skinindex ].skin );
        var_2106ff72782c3841 = var_16b1d09e3f9d5e94 ? operatorbundle.skins[ skinindex ].skin : operatorbundle.defaultskin;
        operator::createoperatorcustomization( operatorref, var_2106ff72782c3841 );
    }
}

// Namespace infect
// Params 0
// Checksum 0xfec0dade, Offset: 0x476c
// Size: 0xbc
function setinfectedmsg()
{
    if ( isdefined( self.isinitialinfected ) )
    {
        if ( !self.showninfected )
        {
            gameplay_sound_fx::function_e319dc8e16c85fcb( #"hash_7271a2a5f163e289", level.players );
            thread rank::scoreeventpopup( #"first_infected" );
            self.showninfected = 1;
        }
        
        return;
    }
    
    if ( isdefined( self.changingtoregularinfected ) )
    {
        self.changingtoregularinfected = undefined;
        
        if ( isdefined( self.changingtoregularinfectedbykill ) )
        {
            self.changingtoregularinfectedbykill = undefined;
            thread points::doscoreevent( #"first_infected" );
        }
        
        return;
    }
    
    if ( !self.showninfected )
    {
        thread rank::scoreeventpopup( #"got_infected" );
        self.showninfected = 1;
    }
}

// Namespace infect
// Params 0
// Checksum 0x4af7dbf4, Offset: 0x4830
// Size: 0x60a
function choosefirstinfected()
{
    level endon( #"game_ended" );
    level endon( #"infect_stopcountdown" );
    level endon( #"force_end" );
    level.infect_allowsuicide = 0;
    flags::gameflagwait( "prematch_done" );
    wait level.gametypebundle.var_646829ef0234c942 ?? 0;
    level.infect_countdowninprogress = 1;
    musicbank_utility::function_5aca66c390aa347d( level.players, #"hash_c8dca22fcbb35087" );
    hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    
    if ( !level.gametypebundle.var_1452b6c0208a13cc )
    {
        setomnvar( "ui_match_start_text", "first_infected_in" );
    }
    
    counttime = 15;
    
    /#
        counttime = getdvarint( @"hash_9e3fc499001686d8", 15 );
    #/
    
    countdownomnvar = level.gametypebundle.var_1452b6c0208a13cc ? "ui_infect_start_countdown" : "ui_match_start_countdown";
    countdownendtime = gettime() + counttime * 1000;
    setomnvar( o"ui_infect_start_countdown_endtime", countdownendtime );
    
    while ( counttime > 0 && !level.gameended )
    {
        foreach ( p in level.players )
        {
            p setclientomnvar( countdownomnvar, counttime );
        }
        
        counttime--;
        hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    }
    
    setomnvar( o"ui_infect_start_countdown_endtime", 0 );
    setomnvar( "ui_match_start_text", "match_starting_in" );
    
    foreach ( p in level.players )
    {
        p setclientomnvar( countdownomnvar, 0 );
    }
    
    level.infect_countdowninprogress = 0;
    level notify( #"hash_10bce3ea93692ce3" );
    possibleinfected = [];
    
    foreach ( player in level.players )
    {
        if ( game_utility_mp::matchmakinggame() && level.players.size > 1 && player ishost() )
        {
            continue;
        }
        
        if ( player.team == "spectator" )
        {
            continue;
        }
        
        if ( !player.hasspawned )
        {
            continue;
        }
        
        if ( player.pers[ "firstInfected" ] >= 1 )
        {
            continue;
        }
        
        /#
            if ( player == level.player && level.players.size > 1 && getdvarint( @"hash_3f727adfddd97073", 0 ) )
            {
                continue;
            }
        #/
        
        possibleinfected[ possibleinfected.size ] = player;
    }
    
    /#
        if ( getdvarint( @"hash_c1f08d488a289c6b", 0 ) == 1 )
        {
            possibleinfected = [];
            possibleinfected[ possibleinfected.size ] = level.players[ 0 ];
        }
        else if ( getdvarint( @"hash_e5c19264131c5355", 0 ) == 1 )
        {
            possibleinfected = arrayremove( possibleinfected, level.players[ 0 ] );
        }
    #/
    
    if ( possibleinfected.size <= 0 )
    {
        if ( level.players.size <= level.infectedrounds && level.players.size > 1 )
        {
            possibleinfected = level.players;
        }
        else
        {
            level thread gamelogic_mp::endgame( "allies", game[ "end_reason" ][ "mp_faction_eliminated" ] );
            return;
        }
    }
    
    level.firstinfectedsplash = 0;
    
    if ( possibleinfected.size <= level.numinitialinfected && possibleinfected.size > 1 )
    {
        level.numinitialinfected = possibleinfected.size - 1;
    }
    
    var_c4f654606e2f55b6 = [];
    
    for ( i = 0; i < level.numinitialinfected ; i++ )
    {
        infectedplayer = possibleinfected[ randomint( possibleinfected.size ) ];
        var_c4f654606e2f55b6[ var_c4f654606e2f55b6.size ] = infectedplayer;
        possibleinfected = arrayremove( possibleinfected, infectedplayer );
    }
    
    /#
        if ( getdvarint( @"hash_aeb3c90d77a88b5c", 0 ) )
        {
            var_c4f654606e2f55b6 = [];
            var_c4f654606e2f55b6[ var_c4f654606e2f55b6.size ] = level.player;
        }
    #/
    
    foreach ( infectedplayer in var_c4f654606e2f55b6 )
    {
        infectedplayer setfirstinfected( 1 );
    }
    
    level.infect_allowsuicide = 1;
    
    foreach ( player in level.players )
    {
        if ( player.isinitialinfected )
        {
            player thread hud_message::showsplash( "first_infected" );
            player dialog::leaderdialogonplayer( "infected_first" );
            continue;
        }
        
        player thread hud_message::showsplash( "first_survivor" );
        player.survivalstarttime = gettime();
        player dialog::leaderdialogonplayer( "infected_first_survivor" );
    }
}

// Namespace infect
// Params 1
// Checksum 0xfe9dc14, Offset: 0x4e42
// Size: 0x376
function setfirstinfected( waschosen )
{
    self endon( #"death_or_disconnect" );
    
    if ( waschosen )
    {
        self.infect_isbeingchosen = 1;
    }
    
    while ( !player::isreallyalive( self ) || utility::isusingremote() || isdefined( self.vehiclereserved ) )
    {
        waitframe();
    }
    
    if ( self.iscarrying == 1 )
    {
        self notify( #"force_cancel_placement" );
        waitframe();
    }
    
    vehicle = vehicle::get_vehicle();
    
    if ( isdefined( vehicle ) )
    {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread vehicle_occupancy::exit( vehicle, undefined, self, data, 1 );
        
        while ( vehicle::is_in_vehicle() )
        {
            waitframe();
        }
    }
    
    while ( self ismantling() )
    {
        waitframe();
    }
    
    while ( !isalive( self ) )
    {
        waitframe();
    }
    
    while ( self.usingascender )
    {
        waitframe();
    }
    
    if ( waschosen )
    {
        menus::addtoteam( "axis", undefined, 1 );
        thread monitordisconnect();
        level.infect_chosefirstinfected = 1;
        self.infect_isbeingchosen = undefined;
        self.var_48fe61030a581373 = 1;
        self.var_c61a2f885a280013 = 1;
        
        if ( level.allowskydivecutparachute )
        {
            self skydive_cutparachuteon();
        }
        else
        {
            self skydive_cutparachuteoff();
        }
        
        updateteamscores();
        
        if ( operator::isfemale() )
        {
            self playlocalsound( "Fem_breathing_better" );
        }
        else
        {
            self playlocalsound( "breathing_better" );
        }
        
        function_31725f5036584fd2();
    }
    
    self.isinitialinfected = 1;
    
    if ( !isdefined( self.pers[ "firstInfected" ] ) )
    {
        self.pers[ "firstInfected" ] = 0;
    }
    
    if ( !( istrue( game[ "practiceRound" ] ) || istrue( level.disablestattracking ) || isagent( self ) ) )
    {
        if ( isdefined( self.leaderboarddata[ "firstInfected" ] ) )
        {
            self.leaderboarddata[ "firstInfected" ] = self.leaderboarddata[ "firstInfected" ] + 1;
        }
        
        if ( isdefined( level.leaderboardfunc[ "firstInfected" ] ) )
        {
            [[ level.leaderboardfunc[ "firstInfected" ] ]]( self, 1 );
        }
        
        assert( isint( 1 ) || isfloat( 1 ), "<dev string:x66>" );
        
        if ( isdefined( self.pers[ "firstInfected" ] ) )
        {
            self.pers[ "firstInfected" ] = self.pers[ "firstInfected" ] + 1;
        }
    }
    
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
    playerlogic::spawnpoint_setspawnpoint( self.origin, self.angles );
    self notify( #"faux_spawn" );
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    perkpackage::function_a921047acdb4eb1f();
    waittillframeend();
    thread playerlogic::spawnplayer( 1 );
    
    if ( level.isgroundwarinfected )
    {
        thread supers_mp::givesuperpoints( 350, undefined, 1 );
    }
    
    if ( waschosen )
    {
        level.infect_players[ level.infect_players.size ] = self;
    }
    
    level.firstinfectedsplash = 1;
    
    if ( !level.firstinfectedsplash )
    {
        level thread hud_util::teamplayercardsplash( "callout_first_infected", self );
    }
    
    if ( !level.infect_skipsounds )
    {
        level.infect_skipsounds = 1;
    }
    
    thread waitthenshowinfecttext();
    initsurvivaltime( 1 );
}

// Namespace infect
// Params 0
// Checksum 0xca2e81c5, Offset: 0x51c0
// Size: 0x20
function waitthenshowinfecttext()
{
    self endon( #"death_or_disconnect" );
    wait 4;
    self iprintlnbold( &"splashes/infect_all" );
}

// Namespace infect
// Params 0
// Checksum 0x3c0c0d4c, Offset: 0x51e8
// Size: 0x1c
function startdeadsilence()
{
    thread supers_mp::givesuperpoints( 4000, undefined, 1 );
    wait 0.5;
    thread perkpackage::perkpackage_forceusesuper();
}

// Namespace infect
// Params 2
// Checksum 0x7e6f7041, Offset: 0x520c
// Size: 0x166
function setinitialtonormalinfected( gotkill, smeansofdeath )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self.isinitialinfected = undefined;
    self.changingtoregularinfected = 1;
    
    if ( isdefined( gotkill ) )
    {
        self.changingtoregularinfectedbykill = 1;
    }
    
    if ( level.gametypebundle.var_9081ce67cc558b96 && level.infect_teamscores[ "axis" ] == 1 )
    {
        return;
    }
    
    while ( !player::isreallyalive( self ) )
    {
        waitframe();
    }
    
    if ( self.iscarrying == 1 )
    {
        self notify( #"force_cancel_placement" );
        waitframe();
    }
    
    while ( self ismantling() )
    {
        waitframe();
    }
    
    while ( self ismeleeing() )
    {
        waitframe();
    }
    
    while ( !player::isreallyalive( self ) )
    {
        waitframe();
    }
    
    self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis" ];
    playerlogic::spawnpoint_setspawnpoint( self.origin, self.angles );
    self notify( #"faux_spawn" );
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    
    if ( isdefined( supers_mp::getcurrentsuper() ) && supers_mp::getcurrentsuper().isinuse )
    {
        thread supers_mp::superusefinished( 0 );
    }
    
    perkpackage::function_a921047acdb4eb1f();
    waitframe();
    thread playerlogic::spawnplayer( 1 );
}

// Namespace infect
// Params 1
// Checksum 0xd6a2c091, Offset: 0x537a
// Size: 0x78
function function_e8330199e3be6ed7( params )
{
    if ( !isplayer( params.attacker ) && params.attacker.team == "axis" && params.victim.team == "allies" )
    {
        params.attacker thread points::doscoreevent( #"hash_a165f7bf4737d52f" );
    }
}

// Namespace infect
// Params 10
// Checksum 0x7cdbd195, Offset: 0x53fa
// Size: 0x7fb
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid )
{
    if ( level.gameended )
    {
        return;
    }
    
    processkill = 0;
    wassuicide = 0;
    self.var_a19349c578e7b61 = 0;
    level thread shouldplayhalfwayvo();
    
    if ( self.team == "allies" && isdefined( attacker ) )
    {
        if ( isplayer( attacker ) && attacker != self )
        {
            processkill = 1;
        }
        else if ( level.infect_allowsuicide && ( attacker == self || !isplayer( attacker ) ) )
        {
            processkill = 1;
            wassuicide = 1;
        }
        
        gameplay_sound_fx::function_e319dc8e16c85fcb( #"hash_2a918c751ebf0136", teams::getteamdata( "allies", "players" ) );
    }
    
    if ( self.team == "allies" && level.nukeinfo.incoming )
    {
        if ( self == level.nukeinfo.player )
        {
            processkill = 0;
            wassuicide = 0;
        }
    }
    
    if ( isplayer( attacker ) && attacker.team == "allies" && attacker != self )
    {
        if ( !( istrue( game[ "practiceRound" ] ) || istrue( level.disablestattracking ) || isagent( attacker ) ) )
        {
            if ( isdefined( attacker.leaderboarddata[ "killsAsSurvivor" ] ) )
            {
                attacker.leaderboarddata[ "killsAsSurvivor" ] = attacker.leaderboarddata[ "killsAsSurvivor" ] + 1;
            }
            
            if ( isdefined( level.leaderboardfunc[ "killsAsSurvivor" ] ) )
            {
                [[ level.leaderboardfunc[ "killsAsSurvivor" ] ]]( attacker, 1 );
            }
            
            assert( isint( 1 ) || isfloat( 1 ), "<dev string:x66>" );
            
            if ( isdefined( attacker.pers[ "killsAsSurvivor" ] ) )
            {
                attacker.pers[ "killsAsSurvivor" ] = attacker.pers[ "killsAsSurvivor" ] + 1;
            }
        }
        
        attacker persistence::statsetchild( "round", "killsAsSurvivor", attacker.pers[ "killsAsSurvivor" ] );
    }
    else if ( isplayer( attacker ) && attacker.team == "axis" && attacker != self )
    {
        if ( !( istrue( game[ "practiceRound" ] ) || istrue( level.disablestattracking ) || isagent( attacker ) ) )
        {
            if ( isdefined( attacker.leaderboarddata[ "killsAsInfected" ] ) )
            {
                attacker.leaderboarddata[ "killsAsInfected" ] = attacker.leaderboarddata[ "killsAsInfected" ] + 1;
            }
            
            if ( isdefined( level.leaderboardfunc[ "killsAsInfected" ] ) )
            {
                [[ level.leaderboardfunc[ "killsAsInfected" ] ]]( attacker, 1 );
            }
            
            assert( isint( 1 ) || isfloat( 1 ), "<dev string:x66>" );
            
            if ( isdefined( attacker.pers[ "killsAsInfected" ] ) )
            {
                attacker.pers[ "killsAsInfected" ] = attacker.pers[ "killsAsInfected" ] + 1;
            }
        }
        
        attacker persistence::statsetchild( "round", "killsAsInfected", attacker.pers[ "killsAsInfected" ] );
        
        if ( isplayer( attacker ) )
        {
            attacker stats::setextrascore1( attacker.pers[ "killsAsInfected" ], "killsAsInfected" );
        }
    }
    
    if ( processkill )
    {
        thread delayedprocesskill( attacker, wassuicide );
        
        if ( wassuicide )
        {
            foreach ( player in level.players )
            {
                if ( isdefined( player.isinitialinfected ) )
                {
                    player thread setinitialtonormalinfected();
                }
            }
        }
        else
        {
            if ( !isdefined( attacker.infectedkillsthislife ) )
            {
                attacker.infectedkillsthislife = 1;
            }
            else
            {
                attacker.infectedkillsthislife++;
            }
            
            if ( attacker.infectedkillsthislife == 3 )
            {
                attacker thread points::doscoreevent( #"triple_infect" );
            }
            
            if ( isdefined( attacker.isinitialinfected ) )
            {
                foreach ( player in level.players )
                {
                    if ( isdefined( player.isinitialinfected ) )
                    {
                        player thread setinitialtonormalinfected( 1 );
                    }
                }
            }
            
            if ( einflictor.var_7ad2b0799b4c6a09 )
            {
                attacker thread [[ einflictor.var_7ad2b0799b4c6a09 ]]();
            }
            else if ( attacker.var_7ad2b0799b4c6a09 )
            {
                attacker thread [[ attacker.var_7ad2b0799b4c6a09 ]]();
            }
            else if ( level.infectstreakbonus > 0 )
            {
                attacker thread points::doscoreevent( #"infected_survivor", undefined, level.infectstreakbonus * attacker.infectedkillsthislife );
            }
            else if ( level.gamemodebundle.var_2fc669d4ccb1f63e )
            {
                foreach ( player in self.attackers )
                {
                    if ( !isplayer( player ) )
                    {
                        continue;
                    }
                    
                    player thread points::doscoreevent( #"infected_survivor" );
                }
            }
            else
            {
                attacker thread points::doscoreevent( #"infected_survivor" );
            }
        }
        
        if ( level.timelimit != 0 )
        {
            var_588edf9e162beb3e = 1;
            
            if ( game_utility_mp::matchmakinggame() )
            {
                level.extratimeincreasecount++;
                var_588edf9e162beb3e = level.extratimeincreasecount <= level.extratimeincreasecountcap;
            }
            
            if ( var_588edf9e162beb3e )
            {
                if ( !isdefined( level.extratime ) )
                {
                    level.extratime = level.gametypebundle.var_e4ecfd1ce6458352 ?? level.infectextratimeperkill;
                }
                else
                {
                    level.extratime += level.infectextratimeperkill;
                }
            }
        }
        
        setsurvivaltime( 1 );
        return;
    }
    
    if ( isbot( self ) )
    {
        self.classcallback = "gamemode";
    }
    
    self.infected_class = self.pers[ "team" ];
    
    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
        self.infected_class = "axis_initial";
    }
    else if ( self.pers[ "team" ] == "axis" )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ self.pers[ "team" ] ];
    }
    
    if ( level.gametypebundle.var_c1becf8091cb0499 )
    {
        self setscriptablepartstate( #"infected_vfx", #"super_fx_deactivate" );
    }
}

// Namespace infect
// Params 2
// Checksum 0x7dde3520, Offset: 0x5bfd
// Size: 0x3be
function delayedprocesskill( attacker, wassuicide )
{
    self.movedtoinfected = 1;
    waitframe();
    self.teamchangedthisframe = 1;
    function_31725f5036584fd2();
    
    if ( level.isgroundwarinfected && level.mapname != "mp_aniyah" )
    {
        setfaketispawnpoint();
    }
    
    updateteamscores();
    level.infect_players[ level.infect_players.size ] = self;
    thread monitordisconnect();
    
    if ( level.infect_teamscores[ "allies" ] > 1 )
    {
        if ( level.isgroundwarinfected )
        {
            level.playgotinfectedsoundcount++;
            
            if ( level.playgotinfectedsoundcount > 3 )
            {
                level.playgotinfectedsoundcount = 1;
            }
        }
        
        if ( level.var_35c64b9e1c2b3798 )
        {
            if ( level.infect_teamscores[ "allies" ] <= level.var_ce114035f4529cfa )
            {
                level notify( #"hash_4fafa72ecca45fdd" );
                thread function_cd9c759f82852d3();
            }
        }
        
        if ( level.playgotinfectedsoundcount == 1 )
        {
            thread hud_util::teamplayercardsplash( "callout_got_infected", self, "allies" );
        }
        
        if ( !wassuicide )
        {
            thread hud_util::teamplayercardsplash( "callout_infected", attacker, "axis" );
            
            if ( !isdefined( level.survivorscoreevent ) )
            {
                var_e1105a3050bdc71e = getdvarint( @"scr_infect_survivorinitialscore", 50 );
                
                if ( var_e1105a3050bdc71e > 0 )
                {
                    level.survivorscoreevent = var_e1105a3050bdc71e;
                }
                else
                {
                    level.survivorscoreevent = rank::getscoreinfovalue( #"survivor" );
                }
            }
            else
            {
                level.survivorscoreevent += level.survivoralivescore;
            }
            
            foreach ( player in level.players )
            {
                if ( !player::isreallyalive( player ) || self.sessionstate == "spectator" )
                {
                    continue;
                }
                
                if ( player.team == "allies" && player != self && distance( player.infect_spawnpos, player.origin ) > 32 )
                {
                    player thread points::doscoreevent( #"survivor", undefined, level.survivorscoreevent );
                }
                
                if ( player.team == "axis" && player != attacker && player != self )
                {
                    player thread points::doscoreevent( #"assist", undefined, level.infectbonusscore );
                }
            }
        }
    }
    else if ( level.infect_teamscores[ "allies" ] == 1 )
    {
        onfinalsurvivor();
    }
    else if ( level.infect_teamscores[ "allies" ] == 0 )
    {
        onsurvivorseliminated();
    }
    
    if ( isbot( self ) )
    {
        self.classcallback = "gamemode";
    }
    
    self.infected_class = self.pers[ "team" ];
    
    if ( isdefined( self.isinitialinfected ) )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ "axis_initial" ];
        self.infected_class = "axis_initial";
        return;
    }
    
    if ( self.pers[ "team" ] == "axis" )
    {
        self.pers[ "gamemodeLoadout" ] = level.infect_loadouts[ self.pers[ "team" ] ];
    }
}

// Namespace infect
// Params 6
// Checksum 0xb705234, Offset: 0x5fc3
// Size: 0x12b
function onnormaldeath( victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon )
{
    if ( isdefined( victim ) && level.matchmakingmatch && isplayer( attacker ) )
    {
        fireteammembers = attacker getfireteammembers();
        
        if ( isdefined( fireteammembers ) && fireteammembers.size > 0 )
        {
            foreach ( member in fireteammembers )
            {
                if ( victim == member )
                {
                    attacker killstreaks::givestreakpoints( #"kill", -1, 0 );
                    attacker.nukepoints = attacker.nukepoints > 0 ? attacker.nukepoints - 1 : 0;
                    break;
                }
            }
        }
    }
}

// Namespace infect
// Params 0
// Checksum 0x19c0ffde, Offset: 0x60f6
// Size: 0x245
function onfinalsurvivor()
{
    level musicbank_utility::function_5aca66c390aa347d( level.players, #"infect_last_alive" );
    
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        player gameplay_sound_fx::playlocalsoundfx( #"hash_1dc0a13ab6a14912" );
        
        if ( player.team == "allies" )
        {
            player dialog::leaderdialogonplayer( "infected_lastalive" );
            player thread points::doscoreevent( #"final_survivor" );
            
            if ( !( istrue( game[ "practiceRound" ] ) || istrue( level.disablestattracking ) || isagent( player ) ) )
            {
                if ( isdefined( player.leaderboarddata[ "lastSurvivor" ] ) )
                {
                    player.leaderboarddata[ "lastSurvivor" ] = player.leaderboarddata[ "lastSurvivor" ] + 1;
                }
                
                if ( isdefined( level.leaderboardfunc[ "lastSurvivor" ] ) )
                {
                    [[ level.leaderboardfunc[ "lastSurvivor" ] ]]( player, 1 );
                }
                
                assert( isint( 1 ) || isfloat( 1 ), "<dev string:x66>" );
                
                if ( isdefined( player.pers[ "lastSurvivor" ] ) )
                {
                    player.pers[ "lastSurvivor" ] = player.pers[ "lastSurvivor" ] + 1;
                }
            }
            
            player thread function_30abe90e031bf17( 6, 500 );
            
            if ( game_utility_mp::matchmakinggame() && !player killstreak::isjuggernaut() )
            {
                player.maxhealth = 200;
                playerhealth::forcehealthregen( player );
            }
            
            thread hud_util::teamplayercardsplash( "callout_final_survivor", player );
            player hud_message::showsplash( "infected_last_survivor" );
            
            if ( level.infectednightmode )
            {
            }
            else if ( game_utility_mp::matchmakinggame() && !player killstreak::isjuggernaut() )
            {
                level thread function_9570460cda91d246( player );
            }
            
            break;
        }
    }
}

// Namespace infect
// Params 1
// Checksum 0xc24c4866, Offset: 0x6343
// Size: 0x8e
function function_9570460cda91d246( finalplayer )
{
    level endon( #"game_ended" );
    finalplayer endon( #"disconnect" );
    finalplayer endon( #"eliminated" );
    
    while ( true )
    {
        if ( level.infect_teamscores[ "allies" ] > 1 )
        {
            finalplayer.health = finalplayer.health > 100 ? 100 : finalplayer.health;
            finalplayer.maxhealth = 100;
            break;
        }
        
        waitframe();
    }
}

// Namespace infect
// Params 0, eflags: 0x4
// Checksum 0xc74e1c66, Offset: 0x63d9
// Size: 0x146
function private infectradarthread()
{
    level notify( #"hash_195fcc989f12f794" );
    level endon( #"game_ended" );
    level endon( #"hash_195fcc989f12f794" );
    flags::gameflagwait( "prematch_done" );
    
    if ( !isdefined( level.infect_countdowninprogress ) || level.infect_countdowninprogress )
    {
        level waittill( #"hash_10bce3ea93692ce3" );
    }
    
    if ( level.var_35c64b9e1c2b3798 )
    {
        level waittill( #"hash_4fafa72ecca45fdd" );
        setteamradar( "axis", 1 );
        return;
    }
    
    while ( true )
    {
        foreach ( player in level.players )
        {
            if ( player.team == "axis" )
            {
                triggeroneoffradarsweep( player );
            }
        }
        
        if ( level.infect_teamscores[ "allies" ] > level.var_ce114035f4529cfa )
        {
            wait level.var_97836b1ed9f70149;
            continue;
        }
        
        wait level.var_7e7e3ab67614fdb6;
    }
}

// Namespace infect
// Params 0, eflags: 0x4
// Checksum 0xe817339c, Offset: 0x6527
// Size: 0x58
function private function_cd9c759f82852d3()
{
    level notify( #"hash_b9d83b12ddafa34" );
    level endon( #"game_ended" );
    level endon( #"hash_b9d83b12ddafa34" );
    
    while ( level.infect_teamscores[ "allies" ] <= level.var_ce114035f4529cfa )
    {
        waitframe();
    }
    
    setteamradar( "axis", 0 );
    thread infectradarthread();
}

// Namespace infect
// Params 0
// Checksum 0xa9781b04, Offset: 0x6587
// Size: 0x30f
function monitordisconnect()
{
    level endon( #"game_ended" );
    self endon( #"eliminated" );
    self notify( #"hash_60b1bcbd9aa67d4" );
    self endon( #"hash_60b1bcbd9aa67d4" );
    team = self.team;
    
    if ( !isdefined( team ) && isdefined( self.bot_team ) )
    {
        team = self.bot_team;
    }
    
    self waittill( #"disconnect" );
    updateteamscores();
    
    if ( isdefined( self.infect_isbeingchosen ) || level.infect_chosefirstinfected )
    {
        if ( level.infect_teamscores[ "axis" ] && level.infect_teamscores[ "allies" ] )
        {
            if ( team == "allies" && level.infect_teamscores[ "allies" ] == 1 )
            {
                onfinalsurvivor();
            }
            else if ( team == "axis" && level.infect_teamscores[ "axis" ] == 1 )
            {
                foreach ( player in level.players )
                {
                    if ( player != self && player.team == "axis" )
                    {
                        player setfirstinfected( 0 );
                    }
                }
            }
        }
        else if ( level.infect_teamscores[ "allies" ] == 0 )
        {
            if ( level.hostmigration )
            {
                hostmigration::waittillhostmigrationdone();
            }
            
            onsurvivorseliminated();
        }
        else if ( level.infect_teamscores[ "axis" ] == 0 )
        {
            if ( level.infect_teamscores[ "allies" ] == 1 )
            {
                level thread gamelogic_mp::endgame( "allies", game[ "end_reason" ][ "mp_faction_eliminated" ] );
            }
            else if ( level.infect_teamscores[ "allies" ] > 1 )
            {
                level.infect_chosefirstinfected = 0;
                level thread choosefirstinfected();
            }
        }
    }
    else if ( level.infect_countdowninprogress && level.infect_teamscores[ "allies" ] == 0 && level.infect_teamscores[ "axis" ] == 0 )
    {
        level notify( #"infect_stopcountdown" );
        level.infect_choosingfirstinfected = 0;
        
        foreach ( p in level.players )
        {
            p setclientomnvar( "ui_match_start_countdown", 0 );
        }
    }
    
    self.isinitialinfected = undefined;
}

// Namespace infect
// Params 1
// Checksum 0xd9c8de40, Offset: 0x689e
// Size: 0xc
function ondeadevent( team )
{
    
}

// Namespace infect
// Params 0
// Checksum 0x8aaebbb5, Offset: 0x68b3
// Size: 0x6a
function ontimelimit()
{
    if ( level.infectedrounds )
    {
        gamescore::setteamscore( "allies", game[ "roundsWon" ][ "allies" ], 0 );
        gamescore::setteamscore( "axis", game[ "roundsWon" ][ "axis" ], 0 );
        thread gamescore::giveteamscoreforobjective( "allies", 1 );
    }
    
    level thread gamelogic_mp::endgame( "allies", game[ "end_reason" ][ "time_limit_reached" ] );
}

// Namespace infect
// Params 0
// Checksum 0x49fc3d88, Offset: 0x6925
// Size: 0x6a
function onsurvivorseliminated()
{
    if ( level.infectedrounds )
    {
        gamescore::setteamscore( "allies", game[ "roundsWon" ][ "allies" ], 0 );
        gamescore::setteamscore( "axis", game[ "roundsWon" ][ "axis" ], 0 );
        thread gamescore::giveteamscoreforobjective( "axis", 1 );
    }
    
    level thread gamelogic_mp::endgame( "axis", game[ "end_reason" ][ "survivors_eliminated" ] );
}

// Namespace infect
// Params 1
// Checksum 0x3bc15b39, Offset: 0x6997
// Size: 0xd4
function getteamsize( team )
{
    size = 0;
    
    foreach ( player in level.players )
    {
        if ( player.sessionstate == "spectator" && !player.spectatekillcam && !player.inspawncamera )
        {
            continue;
        }
        
        if ( player.team == team )
        {
            size++;
        }
    }
    
    return size;
}

// Namespace infect
// Params 0
// Checksum 0x4c9e1783, Offset: 0x6a74
// Size: 0x206
function updateteamscores()
{
    level.infect_teamscores[ "allies" ] = getteamsize( "allies" );
    game[ "teamScores" ][ "allies" ] = level.infect_teamscores[ "allies" ];
    setteamscore( "allies", level.infect_teamscores[ "allies" ] );
    level.infect_teamscores[ "axis" ] = getteamsize( "axis" );
    game[ "teamScores" ][ "axis" ] = level.infect_teamscores[ "axis" ];
    setteamscore( "axis", level.infect_teamscores[ "axis" ] );
    totalplayers = level.infect_teamscores[ "axis" ] + level.infect_teamscores[ "allies" ];
    
    if ( totalplayers > 0 )
    {
        survivorspercentage = level.infect_teamscores[ "allies" ] / totalplayers;
        
        if ( survivorspercentage < 0.3 )
        {
            dialog::statusdialog( #"team_low_lives", "allies" );
            dialog::statusdialog( #"enemy_low_lives", "axis" );
        }
        
        if ( !level.nojip )
        {
            if ( !level.infectrounds )
            {
                axispercentage = level.infect_teamscores[ "axis" ] / totalplayers;
                
                if ( axispercentage > level.scorepercentagecutoff )
                {
                    setnojipscore( 1, 1 );
                    level.nojip = 1;
                }
            }
        }
    }
    
    if ( isplayer( self ) )
    {
        self setclientomnvar( "ui_infect_player_infected", self.team == "axis" );
    }
    
    setomnvar( "ui_allies_alive", level.infect_teamscores[ "allies" ] );
    setomnvar( "ui_axis_alive", level.infect_teamscores[ "axis" ] );
    setomnvar( "ui_allies_lives_remaining", level.infect_teamscores[ "allies" ] );
    setomnvar( "ui_axis_lives_remaining", level.infect_teamscores[ "axis" ] );
}

// Namespace infect
// Params 0
// Checksum 0x5e16b7e3, Offset: 0x6c82
// Size: 0x4c5
function function_9b3ffd0cd7cace4b()
{
    var_5f6de800d5148786 = function_5a85540822dd168a();
    var_968168563555a3c1 = #"asset";
    level.allweapons = [];
    level.infect_loadouts[ "allies" ] = [];
    
    foreach ( classtable in var_5f6de800d5148786[ #"survivor" ][ 0 ].classlist )
    {
        var_e724e2113d4c148 = hashcat( %"classtableentry:", classtable.entry );
        survivorclasstableentry = getscriptbundle( var_e724e2113d4c148 );
        assert( isdefined( survivorclasstableentry ), "<dev string:x8c>" );
        survivorloadout = class::function_79947c7814a64d0e( survivorclasstableentry );
        level.infect_loadouts[ "allies" ][ level.infect_loadouts[ "allies" ].size ] = survivorloadout;
        var_a00300b55cfe4f8e = weapon::function_c37ac3c4f987e506( survivorloadout[ "loadoutPrimary" ], var_968168563555a3c1 );
        var_c71368738ee9dfbe = weapon::function_c37ac3c4f987e506( survivorloadout[ "loadoutSecondary" ], var_968168563555a3c1 );
        level.allweapons[ level.allweapons.size ] = var_a00300b55cfe4f8e;
        level.allweapons[ level.allweapons.size ] = var_c71368738ee9dfbe;
    }
    
    if ( level.gametypebundle.var_1d0a455960df8e73 && isdefined( level.gametypebundle.var_c9cef8b6f515ffb ) )
    {
        var_70d8619fd769eae4 = getscriptbundle( level.gametypebundle.var_c9cef8b6f515ffb );
        randomprimary = utility::array_random( var_70d8619fd769eae4.weapons ).weapondata;
        var_2296ac2f3f33a717 = weapon::function_c37ac3c4f987e506( randomprimary, var_968168563555a3c1 );
        defaultattachments = getweapondefaultattachments( var_2296ac2f3f33a717 );
        defaultattachments = utility::array_random_slice( defaultattachments, 5 );
        
        for ( i = 0; i < level.infect_loadouts[ "allies" ].size ; i++ )
        {
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimaryAttachment" ] = defaultattachments[ 0 ];
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimaryAttachment2" ] = defaultattachments[ 1 ];
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimaryAttachment3" ] = defaultattachments[ 2 ];
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimaryAttachment4" ] = defaultattachments[ 3 ];
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimaryAttachment5" ] = defaultattachments[ 4 ];
            level.infect_loadouts[ "allies" ][ i ][ "loadoutPrimary" ] = randomprimary;
            level.allweapons[ level.allweapons.size ] = var_2296ac2f3f33a717;
        }
    }
    
    var_12941ee4be674e6 = hashcat( %"classtableentry:", var_5f6de800d5148786[ #"infected" ][ 0 ].classlist[ 0 ].entry );
    infectedclasstableentry = getscriptbundle( var_12941ee4be674e6 );
    assert( isdefined( infectedclasstableentry ), "<dev string:xba>" );
    level.infect_loadouts[ "axis" ] = class::function_79947c7814a64d0e( infectedclasstableentry );
    var_aa7879d8f4889588 = weapon::function_c37ac3c4f987e506( level.infect_loadouts[ "axis" ][ "loadoutPrimary" ], var_968168563555a3c1 );
    var_f9d624d30df5ac18 = weapon::function_c37ac3c4f987e506( level.infect_loadouts[ "axis" ][ "loadoutSecondary" ], var_968168563555a3c1 );
    level.allweapons[ level.allweapons.size ] = var_aa7879d8f4889588;
    level.allweapons[ level.allweapons.size ] = var_f9d624d30df5ac18;
    
    if ( level.infectedEnableInitialLoadouts )
    {
        var_704470fb47592b3a = hashcat( %"classtableentry:", var_5f6de800d5148786[ #"initial_infected" ][ 0 ].classlist[ 0 ].entry );
        var_8ecb1daabaf4946a = getscriptbundle( var_704470fb47592b3a );
        assert( isdefined( infectedclasstableentry ), "<dev string:xba>" );
        level.infect_loadouts[ "axis_initial" ] = class::function_79947c7814a64d0e( var_8ecb1daabaf4946a );
    }
    else
    {
        level.infect_loadouts[ "axis_initial" ] = level.infect_loadouts[ "axis" ];
    }
    
    level.allweapons = arrayremoveduplicates( level.allweapons );
}

// Namespace infect
// Params 0
// Checksum 0xb1a3e7bb, Offset: 0x714f
// Size: 0x13cd
function setspecialloadouts()
{
    waitframe();
    
    if ( !isdefined( level.survivorprimaryweapon ) || level.survivorprimaryweapon == "" )
    {
        level.survivorprimaryweapon = "iw9_sh_mbravo_mp";
    }
    
    if ( !isdefined( level.survivorsecondaryweapon ) || level.survivorsecondaryweapon == "" )
    {
        level.survivorsecondaryweapon = "iw9_pi_golf17_mp";
    }
    
    if ( !isdefined( level.infectedprimaryweapon ) || level.infectedprimaryweapon == "" )
    {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
    }
    
    if ( !isdefined( level.infectedsecondaryweapon ) || level.infectedsecondaryweapon == "" )
    {
        level.infectedsecondaryweapon = level.defaultfist;
    }
    
    if ( !isdefined( level.initialprimaryweapon ) || level.initialprimaryweapon == "" )
    {
        level.initialprimaryweapon = "iw9_sh_mbravo_mp";
    }
    
    if ( level.infectedprimaryweapon == "iw9_me_knife_mp" )
    {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
        
        if ( level.infectedsecondaryweapon == "iw9_me_knife_mp" )
        {
            level.infectedsecondaryweapon = "none";
        }
    }
    
    if ( !isdefined( level.initialsecondaryweapon ) || level.initialsecondaryweapon == "" )
    {
        level.initialsecondaryweapon = "iw9_pi_golf17_mp";
    }
    
    if ( !isdefined( level.survivorlethal ) || level.survivorlethal == "" )
    {
        level.survivorlethal = "equip_claymore";
    }
    
    if ( !isdefined( level.survivortactical ) || level.survivortactical == "" )
    {
        level.survivortactical = "equip_concussion";
    }
    
    if ( !isdefined( level.infectedlethal ) || level.infectedlethal == "" )
    {
        level.infectedlethal = "equip_throwing_knife";
    }
    
    if ( !isdefined( level.infectedtactical ) || level.infectedtactical == "" )
    {
        level.infectedtactical = "equip_tac_insert";
    }
    
    level.infect_allyrigs = [];
    level.infect_allyrigs[ level.infect_allyrigs.size ] = "archetype_assault";
    
    if ( game_utility_mp::isusingdefaultclass( "allies", 0 ) )
    {
        level.infect_loadouts[ "allies" ] = game_utility_mp::getmatchrulesspecialclass( "allies", 0 );
    }
    else if ( level.onlineprimaryoverride )
    {
        level.infect_loadouts[ "allies" ][ "loadoutPrimary" ] = level.survivorprimaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment2" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment2" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment3" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment3" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment4" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment4" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment5" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment5" ];
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutSecondary" ] = level.survivorsecondaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment" ] = level.attachmentsurvivorsecondary;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment2" ] = level.attachmentsurvivorsecondarytwo;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentPrimary" ] = level.survivorlethal;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentSecondary" ] = level.survivortactical;
        level.infect_loadouts[ "allies" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutStreakType" ] = "assault";
        
        if ( level.survivorstreakoverride.size > 0 )
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = level.survivorstreakoverride[ 0 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = level.survivorstreakoverride[ 1 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = level.survivorstreakoverride[ 2 ];
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_warhead", "specialty_scavenger_plus", "specialty_restock" ];
        }
        else
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutUsingSpecialist" ] = 1;
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_hardline" ];
            level.infect_loadouts[ "allies" ][ "loadoutExtraPerks" ] = [ "specialty_scavenger_plus", "specialty_warhead", "specialty_restock" ];
        }
        
        level.infect_loadouts[ "allies" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade1" ] = level.survivorsuper;
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade2" ] = level.survivorsupertwo;
    }
    else
    {
        level.infect_loadouts[ "allies" ][ "loadoutPrimary" ] = level.survivorprimaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment" ] = level.attachmentsurvivorprimary;
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryAttachment2" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutSecondary" ] = level.survivorsecondaryweapon;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment" ] = level.attachmentsurvivorsecondary;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryAttachment2" ] = level.attachmentsurvivorsecondarytwo;
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentPrimary" ] = level.survivorlethal;
        level.infect_loadouts[ "allies" ][ "loadoutEquipmentSecondary" ] = level.survivortactical;
        level.infect_loadouts[ "allies" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "allies" ][ "loadoutStreakType" ] = "assault";
        
        if ( level.survivorstreakoverride.size > 0 )
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = level.survivorstreakoverride[ 0 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = level.survivorstreakoverride[ 1 ];
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = level.survivorstreakoverride[ 2 ];
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_warhead", "specialty_scavenger_plus", "specialty_restock" ];
        }
        else
        {
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak1" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak2" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutKillstreak3" ] = "none";
            level.infect_loadouts[ "allies" ][ "loadoutUsingSpecialist" ] = 1;
            level.infect_loadouts[ "allies" ][ "loadoutPerks" ] = [ "specialty_hardline" ];
            level.infect_loadouts[ "allies" ][ "loadoutExtraPerks" ] = [ "specialty_scavenger_plus", "specialty_warhead", "specialty_restock" ];
        }
        
        level.infect_loadouts[ "allies" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade1" ] = level.survivorsuper;
        level.infect_loadouts[ "allies" ][ "loadoutFieldUpgrade2" ] = level.survivorsupertwo;
    }
    
    initialperks = [];
    
    if ( level.isgroundwarinfected )
    {
        initialperks[ initialperks.size ] = "specialty_restock";
    }
    
    if ( game_utility_mp::isusingdefaultclass( "axis", 1 ) )
    {
        level.infect_loadouts[ "axis_initial" ] = game_utility_mp::getmatchrulesspecialclass( "axis", 1 );
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
    }
    else if ( level.onlineprimaryoverride )
    {
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimary" ] = level.initialprimaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment2" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment2" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment3" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment3" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment4" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment4" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment5" ] = game[ "arenaRandomLoadout" ][ 0 ][ "loadoutPrimaryAttachment5" ];
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondary" ] = level.initialsecondaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment" ] = level.attachmentinitialsecondary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment2" ] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPerks" ] = initialperks;
        level.infect_loadouts[ "axis_initial" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
    }
    else
    {
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimary" ] = level.initialprimaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment" ] = level.attachmentinitialprimary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryAttachment2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondary" ] = level.initialsecondaryweapon;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment" ] = level.attachmentinitialsecondary;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryAttachment2" ] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutSecondaryVariantID" ] = 0;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis_initial" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis_initial" ][ "loadoutSuper" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis_initial" ][ "loadoutPerks" ] = initialperks;
        level.infect_loadouts[ "axis_initial" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis_initial" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
    }
    
    var_5d49028ab862ee6a = [];
    
    if ( level.isgroundwarinfected )
    {
        var_5d49028ab862ee6a[ var_5d49028ab862ee6a.size ] = "specialty_restock";
    }
    
    if ( game_utility_mp::isusingdefaultclass( "axis", 0 ) )
    {
        level.infect_loadouts[ "axis" ] = game_utility_mp::getmatchrulesspecialclass( "axis", 0 );
        level.infect_loadouts[ "axis" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak3" ] = "none";
    }
    else
    {
        level.infect_loadouts[ "axis" ][ "loadoutPrimary" ] = level.infectedprimaryweapon;
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryAttachment2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryCamo" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryReticle" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPrimaryVariantID" ] = 0;
        level.infect_loadouts[ "axis" ][ "loadoutSecondary" ] = level.infectedsecondaryweapon;
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryAttachment2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryCamo" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryReticle" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutSecondaryVariantID" ] = -1;
        level.infect_loadouts[ "axis" ][ "loadoutEquipmentPrimary" ] = level.infectedlethal;
        level.infect_loadouts[ "axis" ][ "loadoutEquipmentSecondary" ] = level.infectedtactical;
        level.infect_loadouts[ "axis" ][ "loadoutSuper" ] = level.infectedsuper;
        level.infect_loadouts[ "axis" ][ "loadoutStreakType" ] = "assault";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak1" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak2" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutKillstreak3" ] = "none";
        level.infect_loadouts[ "axis" ][ "loadoutPerks" ] = var_5d49028ab862ee6a;
        level.infect_loadouts[ "axis" ][ "loadoutGesture" ] = "playerData";
        level.infect_loadouts[ "axis" ][ "loadoutFieldUpgrade1" ] = level.infectedsuper;
        level.infect_loadouts[ "axis" ][ "loadoutFieldUpgrade2" ] = level.infectedsupertwo;
    }
    
    level.infect_loadouts[ "allies" ] = finalizeloadout( level.infect_loadouts[ "allies" ] );
    level.infect_loadouts[ "axis" ] = finalizeloadout( level.infect_loadouts[ "axis" ] );
    level.infect_loadouts[ "axis_initial" ] = finalizeloadout( level.infect_loadouts[ "axis_initial" ] );
}

// Namespace infect
// Params 1, eflags: 0x4
// Checksum 0x702dd42f, Offset: 0x8524
// Size: 0x102
function private finalizeloadout( loadout )
{
    if ( !isdefined( loadout ) )
    {
        return;
    }
    
    switch ( loadout[ "loadoutFieldUpgrade1" ] )
    {
        case #"hash_16577b244953e989":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_tac_insert" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_trophy" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        default:
            break;
    }
    
    switch ( loadout[ "loadoutFieldUpgrade2" ] )
    {
        case #"hash_16577b244953e989":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_tac_insert" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        case #"hash_b17ed5514d85b71b":
            if ( loadout[ "loadoutEquipmentSecondary" ] == "equip_trophy" )
            {
                loadout[ "loadoutEquipmentSecondary" ] = "none";
            }
            
            break;
        default:
            break;
    }
    
    return loadout;
}

// Namespace infect
// Params 1
// Checksum 0xa08dbc2c, Offset: 0x862f
// Size: 0x9f
function addsurvivorattachmentsprimary( weapon )
{
    level.attachmentsurvivorprimary = "none";
    group = weapon::getweapongroup( weapon );
    
    if ( group == "weapon_shotgun" )
    {
        level.attachmentsurvivorprimary = "barrelrange";
        return;
    }
    
    if ( group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c" )
    {
        level.attachmentsurvivorprimary = "highcal";
    }
}

// Namespace infect
// Params 1
// Checksum 0xcfc90d, Offset: 0x86d6
// Size: 0x9f
function addinitialattachmentsprimary( weapon )
{
    level.attachmentinitialprimary = "none";
    group = weapon::getweapongroup( weapon );
    
    if ( group == "weapon_shotgun" )
    {
        level.attachmentinitialprimary = "barrelrange";
        return;
    }
    
    if ( group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c" )
    {
        level.attachmentinitialprimary = "highcal";
    }
}

// Namespace infect
// Params 1
// Checksum 0x20c2e808, Offset: 0x877d
// Size: 0x85
function addsurvivorattachmentssecondary( weapon )
{
    level.attachmentsurvivorsecondary = "none";
    level.attachmentsurvivorsecondarytwo = "none";
    group = weapon::getweapongroup( weapon );
    
    if ( group == "weapon_pistol" )
    {
        level.attachmentsurvivorsecondary = "highcal";
    }
    
    if ( game_utility_mp::matchmakinggame() )
    {
        if ( weapon == "iw7_g18c" )
        {
            level.attachmentsurvivorsecondary = "akimbo";
            level.attachmentsurvivorsecondarytwo = "highcal";
        }
    }
}

// Namespace infect
// Params 1
// Checksum 0x8c32d81a, Offset: 0x880a
// Size: 0x85
function addinitialattachmentssecondary( weapon )
{
    level.attachmentinitialsecondary = "none";
    level.attachmentinitialsecondarytwo = "none";
    group = weapon::getweapongroup( weapon );
    
    if ( group == "weapon_pistol" )
    {
        level.attachmentinitialsecondary = "highcal";
    }
    
    if ( game_utility_mp::matchmakinggame() )
    {
        if ( weapon == "iw7_g18c" )
        {
            level.attachmentinitialsecondary = "akimbo";
            level.attachmentinitialsecondarytwo = "highcal";
        }
    }
}

// Namespace infect
// Params 0
// Checksum 0x9f23e97, Offset: 0x8897
// Size: 0x66
function monitorsurvivaltime()
{
    self endon( #"death_or_disconnect" );
    self endon( #"infected" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        if ( !level.infect_chosefirstinfected || !isdefined( self.survivalstarttime ) || !isalive( self ) )
        {
            waitframe();
            continue;
        }
        
        setsurvivaltime( 0 );
        wait 1;
    }
}

// Namespace infect
// Params 1
// Checksum 0x3997460d, Offset: 0x8905
// Size: 0x2a
function initsurvivaltime( infected )
{
    stats::setextrascore0( 0, "survivalTime" );
    
    if ( infected )
    {
        self notify( #"infected" );
    }
}

// Namespace infect
// Params 1
// Checksum 0xef18062, Offset: 0x8937
// Size: 0x8c
function setsurvivaltime( infected )
{
    if ( !isdefined( self.survivalstarttime ) )
    {
        self.survivalstarttime = self.spawntime;
    }
    
    timesurvived = int( ( gettime() - self.survivalstarttime ) / 1000 );
    
    if ( timesurvived > 999 )
    {
        timesurvived = 999;
    }
    
    stats::setextrascore0( timesurvived );
    
    if ( timesurvived == 180 )
    {
        thread points::doscoreevent( #"infected_long_survival" );
    }
    
    if ( infected )
    {
        self notify( #"infected" );
    }
}

// Namespace infect
// Params 0
// Checksum 0x13d0becb, Offset: 0x89cb
// Size: 0xf5
function shouldplayhalfwayvo()
{
    if ( !level.didhalfscorevoboost && level.infect_players.size >= int( level.players.size - level.players.size / 2 ) )
    {
        team = "axis";
        dialog::leaderdialog( "halfway_friendly_score", team, "status" );
        enemyteams = team_utility::getenemyteams( team );
        
        foreach ( entry in enemyteams )
        {
            dialog::leaderdialog( "halfway_enemy_score", entry, "status" );
        }
        
        level.didhalfscorevoboost = 1;
    }
}

// Namespace infect
// Params 0
// Checksum 0x5f3f89af, Offset: 0x8ac8
// Size: 0x43
function updatematchstatushintonspawn()
{
    level endon( #"game_ended" );
    
    if ( self.team == "allies" )
    {
        hud_message::function_ef4318a0090caa0f( #"infect_survive" );
        return;
    }
    
    hud_message::function_ef4318a0090caa0f( #"infect_all" );
}

// Namespace infect
// Params 0
// Checksum 0xc778227f, Offset: 0x8b13
// Size: 0xdb
function nvgwatcher()
{
    self endon( #"death" );
    self endon( #"spawned" );
    flags::gameflagwait( "prematch_done" );
    timer = 0;
    var_903bdf24da6b1053 = 0;
    
    while ( true )
    {
        if ( self isnightvisionon() )
        {
            timer += level.framedurationseconds;
            
            if ( timer >= 1 && !var_903bdf24da6b1053 )
            {
                hud_message::showerrormessage( %"mp_ingame_only/low_battery" );
                var_903bdf24da6b1053 = 1;
            }
            
            if ( timer >= 2 )
            {
                self nightvisionviewoff();
                self setclientomnvar( "ui_infect_nvg_hud_icon", 1 );
                val::set( "nvgWatcher", "nvg", 0 );
                rechargenvg();
                val::reset_all( "nvgWatcher" );
                var_903bdf24da6b1053 = 0;
                self setclientomnvar( "ui_infect_nvg_hud_icon", 0 );
                timer = 0;
            }
        }
        
        wait level.framedurationseconds;
    }
}

// Namespace infect
// Params 0
// Checksum 0x4016a72f, Offset: 0x8bf6
// Size: 0x40
function rechargenvg()
{
    timer = 0;
    
    while ( timer < 5 )
    {
        timer += level.framedurationseconds;
        
        if ( self isnightvisionon() )
        {
            self nightvisionviewoff();
        }
        
        wait level.framedurationseconds;
    }
}

// Namespace infect
// Params 0
// Checksum 0x31d4d545, Offset: 0x8c3e
// Size: 0x68
function perkpackage_checkifready_callback()
{
    if ( self.team == "axis" )
    {
        if ( isdefined( self.perks[ "specialty_tacticalinsertion" ] ) )
        {
            perk::removeperk( "specialty_tacticalinsertion" );
        }
        
        if ( !isdefined( self.perks[ "specialty_tacticalinsertion" ] ) )
        {
            perk::giveperk( "specialty_tacticalinsertion" );
        }
        
        equipment_mp::giveequipment( level.infectedtactical, "secondary" );
    }
}

// Namespace infect
// Params 0
// Checksum 0xa763c5, Offset: 0x8cae
// Size: 0x9
function tacinsert_gamemode_callback()
{
    thread clearandrestoreinfectedtacinsert();
}

// Namespace infect
// Params 1, eflags: 0x4
// Checksum 0x98711ee4, Offset: 0x8cbf
// Size: 0x97, Type: bool
function private function_48aa21419a10c983( spawnposition )
{
    if ( isdefined( level.var_a2df9322146498cb ) )
    {
        foreach ( volume in level.var_a2df9322146498cb )
        {
            if ( ispointinvolume( spawnposition, volume ) )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace infect
// Params 1, eflags: 0x4
// Checksum 0x8d0bd204, Offset: 0x8d5f
// Size: 0xa4
function private function_8d6fdd1081307bd( spawnpointarray )
{
    if ( isdefined( spawnpointarray ) && spawnpointarray.size > 0 )
    {
        foreach ( spawnpoint in spawnpointarray )
        {
            if ( !function_48aa21419a10c983( spawnpoint.origin ) )
            {
                spawnpointarray = arrayremove( spawnpointarray, spawnpoint );
            }
        }
    }
    
    return spawnpointarray;
}

// Namespace infect
// Params 0
// Checksum 0xb3ba294b, Offset: 0x8e0c
// Size: 0x186
function clearandrestoreinfectedtacinsert()
{
    self.setspawnpoint.issuper = 1;
    self.loadoutfieldupgrade1 = "none";
    self.loadoutfieldupgrade2 = "none";
    self.loadoutfieldupgrade1 = level.infectedsuper;
    self.loadoutfieldupgrade2 = level.infectedsupertwo;
    wait 0.1;
    
    if ( !isdefined( self.setspawnpoint ) || !level.var_f49e119ce25800d3 )
    {
        return;
    }
    
    if ( level.skydiveontacinsertplacement )
    {
        if ( player::isreallyalive( self ) )
        {
            self notify( #"giveloadout_start" );
            supers_mp::clearsuper();
            perkpackage::perkpackage_reset();
            self.perkpackagedata.istwomode = 1;
            perkpackage::perkpackage_setstate( 0 );
            self.perkpackagedata.super = "super_select";
            class = "gamemode";
            globalstruct = class::loadout_getglobalclassstruct();
            globalstruct = class::loadout_updateglobalclass( globalstruct, class );
            class::loadout_updatefieldupgrades( globalstruct, class );
            
            if ( isdefined( self.perks[ "specialty_tacticalinsertion" ] ) )
            {
                perk::removeperk( "specialty_tacticalinsertion" );
            }
            
            if ( !isdefined( self.perks[ "specialty_tacticalinsertion" ] ) )
            {
                perk::giveperk( "specialty_tacticalinsertion" );
            }
            
            equipment_mp::giveequipment( level.infectedtactical, "secondary" );
            thread supers_mp::givesuperpoints( level.infectbonussuperontacinsert, undefined, 1 );
        }
        
        thread suicideandskydive();
    }
}

// Namespace infect
// Params 0
// Checksum 0x27a90d13, Offset: 0x8f9a
// Size: 0x6c
function suicideandskydive()
{
    if ( player::isreallyalive( self ) )
    {
        self.skipdeathicon = 1;
        self suicide();
        waitframe();
        
        if ( isdefined( self ) )
        {
            self.deaths -= 1;
            self.pers[ "deaths" ] = self.pers[ "deaths" ] - 1;
        }
    }
    
    wait 1;
    
    if ( isdefined( self ) )
    {
        self.skipdeathicon = undefined;
    }
}

// Namespace infect
// Params 2
// Checksum 0x2d3b57f8, Offset: 0x900e
// Size: 0x98
function registervehicletype( refname, spawnvehiclecallback )
{
    assert( isdefined( refname ) );
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = spawnvehiclecallback;
    vehicleinfo.vehiclespawns = vehicle_spawn::get_spawn_structs( refname );
    assert( isdefined( vehicleinfo.vehiclespawns ) );
    
    if ( !isdefined( level.vehicleinfo ) )
    {
        level.vehicleinfo = [];
    }
    
    level.vehicleinfo[ refname ] = vehicleinfo;
}

// Namespace infect
// Params 0
// Checksum 0xd015ea7d, Offset: 0x90ae
// Size: 0x7b1
function init_infectgroundwarvehicles()
{
    registervehicletype( %"hash_21df6558fa3c728b", &vehiclespawn_atv );
    level.vehiclespawnlocs = [];
    
    foreach ( vehicleinfo in level.vehicleinfo )
    {
        if ( vehicleinfo.refname == %"hash_21df6558fa3c728b" )
        {
            if ( level.mapname == "mp_farms2_gw" && level.localeid == "locale_9" )
            {
                overrideorigin = [];
                overrideangles = [];
                overrideorigin[ 0 ] = ( 46022, 1039, 56 );
                overrideangles[ 0 ] = ( 7, 289, 0 );
                overrideorigin[ 1 ] = ( 47881, -1404, 115 );
                overrideangles[ 1 ] = ( 8, 294, 0 );
                overrideorigin[ 2 ] = ( 47970, -22545, -320 );
                overrideangles[ 2 ] = ( 9, 105, 0 );
                
                for ( i = 0; i < overrideorigin.size ; i++ )
                {
                    tempspawn = spawnstruct();
                    tempspawn.origin = overrideorigin[ i ];
                    tempspawn.angles = overrideangles[ i ];
                    tempspawn.script_noteworthy = "locale_9";
                    tempspawn.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[ vehicleinfo.vehiclespawns.size ] = tempspawn;
                }
                
                foreach ( spawnpoint in vehicleinfo.vehiclespawns )
                {
                    if ( distancesquared( spawnpoint.origin, ( 53109, -8400, -710 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 46868, -457, 18 );
                        spawnpoint.angles = ( 11, 252, 0 );
                        continue;
                    }
                    
                    if ( distancesquared( spawnpoint.origin, ( 48215, -1671, 56 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 47906, -676, 55 );
                        spawnpoint.angles = ( 11, 309, 0 );
                    }
                }
            }
            else if ( level.mapname == "mp_downtown_gw" && level.localeid == "locale_6" )
            {
                overrideorigin = [];
                overrideangles = [];
                overrideorigin[ 0 ] = ( 17806, -20823, -110 );
                overrideangles[ 0 ] = ( 11, 358, 0 );
                overrideorigin[ 1 ] = ( 16109, -24057, -144 );
                overrideangles[ 1 ] = ( 1, 90, 0 );
                overrideorigin[ 2 ] = ( 18227, -704, -448 );
                overrideangles[ 2 ] = ( 7, 266, 0 );
                overrideorigin[ 3 ] = ( 19180, 332, -447 );
                overrideangles[ 3 ] = ( 6, 298, 0 );
                
                for ( i = 0; i < overrideorigin.size ; i++ )
                {
                    tempspawn = spawnstruct();
                    tempspawn.origin = overrideorigin[ i ];
                    tempspawn.angles = overrideangles[ i ];
                    tempspawn.script_noteworthy = "locale_6";
                    tempspawn.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[ vehicleinfo.vehiclespawns.size ] = tempspawn;
                }
                
                foreach ( spawnpoint in vehicleinfo.vehiclespawns )
                {
                    if ( distancesquared( spawnpoint.origin, ( 18368, -21157, -107 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 16572, -19828, 86 );
                        spawnpoint.angles = ( 2, 55, 0 );
                        continue;
                    }
                    
                    if ( distancesquared( spawnpoint.origin, ( 19526, -15475, -97 ) ) < 16384 )
                    {
                        spawnpoint.origin = ( 19177, -15490, -116 );
                        spawnpoint.angles = ( 2, 64, 0 );
                    }
                }
            }
        }
        
        foreach ( spawnpoint in vehicleinfo.vehiclespawns )
        {
            if ( isdefined( game_utility::getlocaleid() ) && isdefined( spawnpoint.script_noteworthy ) && spawnpoint.script_noteworthy == level.localeid )
            {
                index = level.vehiclespawnlocs.size;
                level.vehiclespawnlocs[ index ] = spawnpoint;
                level.vehiclespawnlocs[ index ].refname = vehicleinfo.refname;
            }
        }
    }
    
    if ( false )
    {
        foreach ( loc in level.vehiclespawnlocs )
        {
            thread debug::drawline( loc.origin, loc.origin + ( 0, 0, 1500 ), 1000, ( 1, 0, 0 ) );
        }
    }
    
    level.vehiclespawnlocs = arrayrandomize( level.vehiclespawnlocs );
    numtospawn = level.numnonrallyvehicles;
    
    if ( !isdefined( level.numnonrallyvehicles ) )
    {
        numtospawn = 25;
    }
    
    if ( false )
    {
        for ( i = 0; i < numtospawn ; i++ )
        {
            loc = level.vehiclespawnlocs[ i ];
            thread debug::drawline( loc.origin + ( 0, 0, 1500 ), loc.origin + ( 0, 0, 2500 ), 1000, ( 0, 1, 0 ) );
        }
    }
    
    for ( i = 0; i < numtospawn ; i++ )
    {
        loc = level.vehiclespawnlocs[ i ];
        
        if ( isdefined( loc ) )
        {
            vehicleinfo = level.vehicleinfo[ loc.refname ];
            [[ vehicleinfo.spawncallback ]]( loc );
        }
    }
}

// Namespace infect
// Params 2
// Checksum 0x22c8f87c, Offset: 0x9867
// Size: 0x5f
function vehiclespawn_atv( loc, faildata )
{
    if ( !isdefined( loc.angles ) )
    {
        loc.angles = ( 0, randomfloat( 360 ), 0 );
    }
    
    spawndata = vehiclespawn_getspawndata( loc );
    return vehicle::spawn( %"hash_21df6558fa3c728b", spawndata, faildata );
}

// Namespace infect
// Params 1
// Checksum 0xee84cd91, Offset: 0x98cf
// Size: 0x6b
function vehiclespawn_getspawndata( loc )
{
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace infect
// Params 0
// Checksum 0x8b3998f9, Offset: 0x9943
// Size: 0x78
function function_b491a9663b287bce()
{
    config = juggernaut::jugg_createconfig( level.streakglobals.streakbundles[ "juggernaut" ].juggernautconfig );
    health = getdvarint( @"hash_be3134dff20f353a", 2000 );
    config.maxhealth = health;
    config.startinghealth = health;
    juggernaut::function_2ef6e7bd444b89ea( config );
    return config;
}

// Namespace infect
// Params 6
// Checksum 0xe4c4205b, Offset: 0x99c4
// Size: 0x8f
function gamemodespawnprotectedcallback( eattacker, victim, idamage, objweapon, smeansofdeath, streakname )
{
    spawnprotected = 0;
    
    if ( eattacker.team == "axis" && weapon::iskillstreakweapon( objweapon.basename ) && !weapon::weaponbypassspawnprotection( objweapon, streakname ) && smeansofdeath != "MOD_MELEE" )
    {
        spawnprotected = 1;
    }
    
    return spawnprotected;
}

// Namespace infect
// Params 0
// Checksum 0xafd39521, Offset: 0x9a5c
// Size: 0x94
function setfaketispawnpoint()
{
    spawnpoint = getspawnpoint();
    setspawnpoint = spawn( "script_model", spawnpoint.origin );
    setspawnpoint.playerspawnpos = spawnpoint.origin;
    setspawnpoint.playerspawnangles = spawnpoint.angles;
    setspawnpoint.notti = 0;
    setspawnpoint.issuper = 1;
    setspawnpoint.skipscriptable = 1;
    self.setspawnpoint = setspawnpoint;
}

// Namespace infect
// Params 0
// Checksum 0x32d85e1c, Offset: 0x9af8
// Size: 0xb9
function skydivehintnotify()
{
    self endon( #"disconnect" );
    self notify( #"hash_4e2339ba7cd72cc3" );
    self endon( #"hash_4e2339ba7cd72cc3" );
    nummessages = 0;
    firstspawn = 1;
    
    while ( true )
    {
        if ( firstspawn )
        {
            self waittill( #"giveloadout" );
        }
        else
        {
            self waittill( #"spawned" );
        }
        
        if ( self.pers[ "team" ] == "allies" )
        {
            continue;
        }
        
        if ( nummessages < 2 )
        {
            if ( !nummessages )
            {
                wait 5;
            }
            
            lower_message::setlowermessageomnvar( "infect_super_tac_hint" );
            wait 5;
            lower_message::setlowermessageomnvar( "clear_lower_msg" );
            nummessages++;
            continue;
        }
        
        break;
    }
}

// Namespace infect
// Params 0
// Checksum 0xd3ac00d, Offset: 0x9bb9
// Size: 0x1e
function function_558b081106d8c6e8()
{
    var_80e3f99b37e0667c = getdvarint( @"hash_71ea7a20ebc4487e", 0 );
    return var_80e3f99b37e0667c;
}

// Namespace infect
// Params 2
// Checksum 0xdfdbf1e1, Offset: 0x9be0
// Size: 0x95
function function_30abe90e031bf17( timer, dist )
{
    self endon( #"death_or_disconnect" );
    self endon( #"eliminated" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        enemycast = physics_spherecast( self.origin, self.origin, dist, physics_createcontents( [ "physicscontents_characterproxy" ] ), self, "physicsquery_any" );
        
        if ( enemycast == 1 )
        {
            self playlocalsound( "jup_infected_player_death_pulse" );
            wait timer;
            continue;
        }
        
        wait 1;
    }
}

// Namespace infect
// Params 0
// Checksum 0x1037df0f, Offset: 0x9c7d
// Size: 0x3, Type: bool
function disable_headless()
{
    return false;
}

// Namespace infect
// Params 0
// Checksum 0x465463ff, Offset: 0x9c89
// Size: 0x16f
function function_91f5a744be64c1ee()
{
    level flags::function_2f3408423ccc9b2e( "prematch_done" );
    level waittill( #"hash_10bce3ea93692ce3" );
    
    if ( isdefined( level.sharedfuncs[ #"custominfected" ][ #"hash_9f0b30c4b78eda59" ] ) )
    {
        utility::callsharedfunc( #"custominfected", #"hash_9f0b30c4b78eda59" );
    }
    
    if ( isdefined( level.gametypebundle.var_c9962eac7977bd0e ) )
    {
        level thread function_938ca7d8adebbdb0();
    }
    
    if ( isdefined( level.gametypebundle.var_56251b38df117440 ) )
    {
        level thread function_b5ced5bec219e3fe();
    }
    
    if ( level.var_206b7613991179e2 )
    {
        level._effect[ "specialExplosion" ] = loadfxasset( level.gametypebundle.var_95af438b170b17d0.var_91b6e3fa51745266 ?? "" );
        
        if ( !isdefined( level.sharedfuncs[ #"custominfected" ][ "setSpecialProperties" ] ) )
        {
            utility::registersharedfunc( #"custominfected", #"setSpecialProperties", &function_8aa7fa570e6af4c0 );
        }
        
        if ( !isdefined( level.sharedfuncs[ #"custominfected" ][ "clearSpecialInfectedProperties" ] ) )
        {
            utility::registersharedfunc( #"custominfected", #"hash_a737b6f01ae79050", &clearSpecialInfectedProperties );
        }
    }
    
    utility::registersharedfunc( #"powerups", #"fix_up_pickup", &function_635c76943270ed6f );
}

// Namespace infect
// Params 0
// Checksum 0x7f75ac26, Offset: 0x9e00
// Size: 0x64
function function_938ca7d8adebbdb0()
{
    self notify( #"hash_8a4a2a426050575b" );
    self endon( #"hash_8a4a2a426050575b" );
    self endon( #"game_ended" );
    
    /#
        if ( getdvarint( @"hash_849a75fd426a67a6", 0 ) )
        {
            return;
        }
    #/
    
    level.var_5f281371b34720a5 = 1;
    wait level.gametypebundle.var_c9962eac7977bd0e;
    level.var_5f281371b34720a5 = 0;
}

// Namespace infect
// Params 0
// Checksum 0xa5bed6a, Offset: 0x9e6c
// Size: 0x5d
function function_b5ced5bec219e3fe()
{
    self notify( #"hash_a19c36f8a5678b3c" );
    self endon( #"hash_a19c36f8a5678b3c" );
    self endon( #"game_ended" );
    wait level.gametypebundle.var_56251b38df117440;
    updateteamscores();
    
    if ( level.infect_teamscores[ "axis" ] == 1 )
    {
        ontimelimit();
    }
}

// Namespace infect
// Params 2
// Checksum 0xad441e6a, Offset: 0x9ed1
// Size: 0x12a, Type: bool
function function_f6b0aca81fd1fec4( powerup_ref, victim )
{
    if ( level.var_5f281371b34720a5 )
    {
        return false;
    }
    
    if ( isdefined( level.sharedfuncs[ #"custominfected" ][ "checkShouldDrop" ] ) )
    {
        if ( !utility::callsharedfunc( #"custominfected", #"checkShouldDrop" ) )
        {
            return false;
        }
    }
    
    if ( isdefined( level.sharedfuncs[ #"powerups" ][ #"getroot" ] ) )
    {
        root = utility::callsharedfunc( #"powerups", #"getroot" );
        powerupinfo = root.powerups[ powerup_ref ];
        
        if ( victim.team == "axis" && powerupinfo.var_ea83f93d1d359224 )
        {
            return false;
        }
    }
    
    if ( !isdefined( level.infect_analytics.powerupdrops[ powerup_ref ] ) )
    {
        level.infect_analytics.powerupdrops[ powerup_ref ] = 0;
    }
    
    level.infect_analytics.powerupdrops[ powerup_ref ]++;
    return true;
}

// Namespace infect
// Params 1
// Checksum 0x582bf871, Offset: 0xa004
// Size: 0x307
function infect_onplayerkilled( params )
{
    victim = params.victim;
    
    if ( victim.var_94b5dbf11cafc171 )
    {
        if ( !self.isinitialinfected )
        {
            clearSpecialInfectedProperties();
        }
        
        if ( level.gametypebundle.var_95af438b170b17d0.var_5b2ae8f75db98c79 )
        {
            var_ef8fc5d47f6777a0 = getplayersinradius( victim.origin, level.gametypebundle.var_95af438b170b17d0.explosionradius ?? 500 );
            
            foreach ( player in var_ef8fc5d47f6777a0 )
            {
                if ( player.team == "axis" || !player::isreallyalive( player ) )
                {
                    continue;
                }
                
                player dodamage( level.gametypebundle.var_95af438b170b17d0.var_5b2ae8f75db98c79, victim.origin, victim, undefined, "MOD_EXPLOSIVE" );
            }
        }
        
        if ( level.gametypebundle.var_95af438b170b17d0.var_91b6e3fa51745266 )
        {
            playfx( level._effect[ "specialExplosion" ], victim.origin );
        }
        
        if ( level.gametypebundle.var_95af438b170b17d0.var_e68c01e87fc73718 )
        {
            gameplay_sound_fx::function_28103d3430792dce( victim.origin, level.gametypebundle.var_95af438b170b17d0.var_e68c01e87fc73718 );
        }
    }
    
    if ( victim.team == "axis" )
    {
        if ( level.var_f616fa52ba357b3 )
        {
            foreach ( attacker in victim.attackers ?? [ params.attacker ] )
            {
                if ( isalive( attacker ) && attacker.team == "allies" )
                {
                    attacker function_e673953550ec21e1();
                }
            }
        }
        
        if ( !isdefined( level.infect_analytics.infectedkilled ) )
        {
            level.infect_analytics.infectedkilled = 0;
        }
        
        level.infect_analytics.infectedkilled++;
    }
    
    victim.var_91fa21e6b0699c65 = 0;
}

// Namespace infect
// Params 0
// Checksum 0x345bbbeb, Offset: 0xa313
// Size: 0x74
function function_e673953550ec21e1()
{
    if ( self.var_91fa21e6b0699c65 >= 5 )
    {
        return;
    }
    
    self.var_91fa21e6b0699c65++;
    
    if ( self.var_91fa21e6b0699c65 - self.var_4896c8dd2a0bdbaa > 0 )
    {
        namespace_69e3a436b5d8370e::function_65899efd82f98479( level.gametypebundle.awardtiers[ self.var_91fa21e6b0699c65 - self.var_4896c8dd2a0bdbaa - 1 ] );
        self playlocalsound( #"hash_5c02a6742019f27c" );
    }
}

// Namespace infect
// Params 0
// Checksum 0xf829b82f, Offset: 0xa38f
// Size: 0x39
function function_75fdd2a583e6271f()
{
    for ( i = 1; i <= level.gametypebundle.bonusitems.size ; i++ )
    {
        namespace_69e3a436b5d8370e::function_323d8c9159939a6d( i );
    }
}

// Namespace infect
// Params 1
// Checksum 0x8198eab3, Offset: 0xa3d0
// Size: 0xda
function infect_onplayerspawned( params )
{
    if ( level.var_f616fa52ba357b3 )
    {
        if ( self.var_91fa21e6b0699c65 > 0 )
        {
            for ( i = 0; i < self.var_91fa21e6b0699c65 ; i++ )
            {
                namespace_69e3a436b5d8370e::removeawardtier( level.gametypebundle.awardtiers[ i ], 1 );
            }
        }
        
        self.var_91fa21e6b0699c65 = 0;
        self.var_4896c8dd2a0bdbaa = 0;
        self setclientomnvar( "ui_hide_bonus_widget", 0 );
        
        if ( self.var_94b5dbf11cafc171 )
        {
            function_75fdd2a583e6271f();
            return;
        }
    }
    
    if ( self.team == "axis" )
    {
        if ( level.var_f616fa52ba357b3 )
        {
            self setclientomnvar( "ui_hide_bonus_widget", 1 );
        }
        
        function_d86d634b2129d342();
        return;
    }
    
    self.var_e8c071e4abe4facf = 0;
}

// Namespace infect
// Params 0
// Checksum 0xdb63759a, Offset: 0xa4b2
// Size: 0x9
function function_635c76943270ed6f()
{
    function_261c0421dd672b91();
}

// Namespace infect
// Params 0
// Checksum 0x5035b861, Offset: 0xa4c3
// Size: 0xc3
function function_261c0421dd672b91()
{
    if ( self.team == "allies" )
    {
        return;
    }
    
    if ( self.var_94b5dbf11cafc171 )
    {
        clearSpecialInfectedProperties();
    }
    
    menus::addtoteam( "allies" );
    function_9efe0a0a4a484d88();
    playerlogic::spawnpoint_setspawnpoint( self.origin, self.angles );
    self notify( #"faux_spawn" );
    self.faux_spawn_stance = self getstance();
    perkpackage::function_a921047acdb4eb1f();
    waittillframeend();
    thread playerlogic::spawnplayer( 1 );
    level.infect_players = arrayremove( level.infect_players, self );
    self.movedtoinfected = undefined;
    initsurvivaltime( 0 );
    thread monitorsurvivaltime();
    level updateteamscores();
    hud_message::showsplash( "fix_up_powerup_pickup_splash" );
}

// Namespace infect
// Params 0
// Checksum 0xfa5aa7b9, Offset: 0xa58e
// Size: 0x1a6
function function_8aa7fa570e6af4c0()
{
    self.var_94b5dbf11cafc171 = 1;
    properties = level.gametypebundle.var_95af438b170b17d0;
    self setclientomnvar( "ui_use_alt_bonus_items", 1 );
    
    if ( properties.var_308ea6553e1810f1 )
    {
        pbgpostfxbundlestart( self, properties.var_308ea6553e1810f1 );
    }
    
    self.var_4a17c312a3e4a9f9 = properties.var_4c85e0abc60e914a ?? 0;
    self.var_75e9852ae1d2345f = properties.var_75e9852ae1d2345f ?? 0;
    
    if ( self.var_75e9852ae1d2345f && !callback::exists( #"hash_2346898712859996", &function_fa0e6ab5ccfef701 ) )
    {
        callback::add( #"hash_2346898712859996", &function_fa0e6ab5ccfef701 );
    }
    
    self.var_af6f88510527f004 = properties.outline;
    function_6b425b46cd07e841();
    
    if ( properties.playerpart )
    {
        self setscriptablepartstate( properties.playerpart, properties.playerstate );
    }
    
    self.maxhealth = properties.maxhealth ?? self.maxhealth;
    infected_sethealth( properties.maxhealth ?? self.maxhealth, 1 );
    self.var_50937fdcf29f8297 = properties.headshotscalar ?? 1;
    
    if ( !callback::exists( #"hash_652eb614ba902b3d", &function_50ff4ab83f650f10 ) )
    {
        callback::add( #"hash_652eb614ba902b3d", &function_50ff4ab83f650f10 );
    }
    
    self.var_2e83c20b5dc7c13b = properties.movespeedscalar ?? 1;
}

// Namespace infect
// Params 0
// Checksum 0xf4ec71d4, Offset: 0xa73c
// Size: 0x127
function clearSpecialInfectedProperties()
{
    self.var_94b5dbf11cafc171 = 0;
    properties = level.gametypebundle.var_95af438b170b17d0;
    self setclientomnvar( "ui_use_alt_bonus_items", 0 );
    self.var_4a17c312a3e4a9f9 = 0;
    self.var_75e9852ae1d2345f = 0;
    
    if ( callback::exists( #"hash_2346898712859996", &function_fa0e6ab5ccfef701 ) )
    {
        callback::remove( #"hash_2346898712859996", &function_fa0e6ab5ccfef701 );
    }
    
    self.var_af6f88510527f004 = undefined;
    outline::outlinedisable( self.friendlyoutlineid, self );
    outline::outlinedisable( self.var_e82835bccfbadc6d, self );
    
    if ( properties.playerpart )
    {
        self setscriptablepartstate( properties.playerpart, #"super_fx_deactivate" );
    }
    
    infected_sethealth( level.gametypebundle.infectedmaxhealth, 1 );
    self.var_50937fdcf29f8297 = undefined;
    
    if ( callback::exists( #"hash_652eb614ba902b3d", &function_50ff4ab83f650f10 ) )
    {
        callback::remove( #"hash_652eb614ba902b3d", &function_50ff4ab83f650f10 );
    }
    
    self.var_2e83c20b5dc7c13b = undefined;
}

// Namespace infect
// Params 0
// Checksum 0x908e53af, Offset: 0xa86b
// Size: 0x79
function function_6b425b46cd07e841()
{
    if ( self.var_af6f88510527f004 )
    {
        outline::_hudoutlineviewmodelenable( self.var_af6f88510527f004, 0 );
        self.friendlyoutlineid = outline::outlineenableforteam( self, self.team, self.var_af6f88510527f004, "level_script", undefined, 1 );
        self.var_e82835bccfbadc6d = outline::outlineenableforteam( self, team_utility::getotherteam( self.team ), self.var_af6f88510527f004, "level_script", undefined, 1 );
    }
}

// Namespace infect
// Params 1
// Checksum 0x3754f3ce, Offset: 0xa8ec
// Size: 0xfd
function function_50ff4ab83f650f10( params )
{
    attacker = params.eattacker;
    victim = params.victim;
    meansofdeath = params.smeansofdeath;
    damage = params.idamage;
    hitlocation = params.shitloc;
    
    if ( !isdefined( attacker ) || !isdefined( victim ) || !isdefined( meansofdeath ) || !isdefined( victim.var_50937fdcf29f8297 ) )
    {
        return;
    }
    
    if ( attacker == victim || level.teambased && attacker.team == victim.team )
    {
        return;
    }
    
    if ( !damage_utility::isheadshot( hitlocation, meansofdeath, attacker ) )
    {
        return;
    }
    
    damage *= victim.var_50937fdcf29f8297;
    params.idamage = damage;
}

// Namespace infect
// Params 1
// Checksum 0x9b8591e0, Offset: 0xa9f1
// Size: 0xc5
function function_fa0e6ab5ccfef701( params )
{
    attacker = params.eattacker;
    victim = params.victim;
    damage = params.idamage;
    meansofdeath = params.smeansofdeath;
    
    if ( !isdefined( attacker ) || !isdefined( victim ) || !isdefined( attacker.var_75e9852ae1d2345f ) )
    {
        return;
    }
    
    if ( meansofdeath == "MOD_MELEE" && attacker.var_75e9852ae1d2345f && player_utility::playersareenemies( attacker, victim ) )
    {
        damage = victim.maxhealth;
    }
    
    params.idamage = damage;
}

