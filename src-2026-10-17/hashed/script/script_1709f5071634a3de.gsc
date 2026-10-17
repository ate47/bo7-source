#using script_11307d2756aa1530;
#using script_125ee02ab7989d2f;
#using script_156ce82f4d965fc0;
#using script_16de173bedb21c7f;
#using script_1855f2d6d50250a8;
#using script_19e2031c0479b1b2;
#using script_1df41c0907a26351;
#using script_2d163c4d299f5bd3;
#using script_2d72416e525b6efe;
#using script_2ec3d5d1dd2335ac;
#using script_353e34c229ca1589;
#using script_379d4631feecb8b7;
#using script_390e412343e6f124;
#using script_39101f2e3552c7a1;
#using script_3c01debcb22ddbda;
#using script_5e0cc00f069082d4;
#using script_6074448812f6d443;
#using script_6354b6a887ca61d0;
#using script_697980dd287ce599;
#using script_6995a3eb7d571a9f;
#using script_6b56b541550363b5;
#using script_6ecce26a00447bae;
#using script_76a9469bdb2c8bb1;
#using script_78c4eeb199715644;
#using script_7a6466d8e30fbe67;
#using script_7d929265a240b1db;
#using script_d79f4feed7d0186;
#using script_e4448977b5bb26f;
#using script_f55e70648dfbbe3;
#using script_fc585d8263e9676;
#using script_fe9d79f45d5b5ce;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\gametypes\jugg_mosh;
#using scripts\mp\outofbounds;

#namespace init_mp;

// Namespace init_mp
// Params 0
// Checksum 0xfc935781, Offset: 0xef
// Size: 0x553
function init()
{
    level.killstreaktriggeredfunc = &killstreaks::streakglobals_onkillstreaktriggered;
    level.killstreakbeginusefunc = &killstreaks::streakglobals_onkillstreakbeginuse;
    callback::add( #"killstreak_finish_use", &killstreaks::streakglobals_onkillstreakfinishuse );
    killstreaks::initkillstreakdata();
    
    if ( !isdefined( level.killstreaksetups ) )
    {
        level.killstreaksetups = [];
    }
    
    thread target_marker::init();
    thread mapselect::init();
    thread throwback_marker::init();
    thread helicopter::init();
    
    if ( getdvarint( @"hash_41e841cf6efad236", 0 ) || getdvar( @"ui_gametype", "" ) == "conf_jugg" )
    {
        thread namespace_a13b6c9f6b78efe9::init();
    }
    
    thread deployablebox::init();
    thread remoteturret::init();
    thread death_switch::init();
    thread circle_peek::init();
    utility::registersharedfunc( #"cruise_predator", #"init", &cruise_predator_mp::init );
    utility::registersharedfunc( #"sentry_gun", #"init", &sentry_gun_mp::init );
    utility::registersharedfunc( #"airstrike", #"init", &airstrike_mp::init );
    utility::registersharedfunc( #"juggernaut", #"init", &juggernaut_mp::init );
    utility::registersharedfunc( #"airdrop", #"init", &airdrop_mp::init );
    utility::registersharedfunc( #"airdrop_multiple", #"init", &airdrop_multiple_mp::airdrop_multiple_init );
    utility::registersharedfunc( #"airdrop_escort", #"init", &airdrop_escort_mp::airdrop_escort_init );
    utility::registersharedfunc( #"white_phosphorus", #"init", &white_phosphorus_mp::init );
    utility::registersharedfunc( #"manual_turret", #"init", &manual_turret_mp::init );
    utility::registersharedfunc( #"toma_strike", #"init", &toma_strike_mp::init );
    utility::registersharedfunc( #"chopper_support", #"init", &chopper_support_mp::init );
    utility::registersharedfunc( #"uav", #"init", &uav_mp::init_uav_mp );
    utility::registersharedfunc( #"uav_bigmap", #"init", &uav_bigmap_mp::init );
    utility::registersharedfunc( #"emp_drone", #"init", &emp_drone_mp::init );
    utility::registersharedfunc( #"emp_drone_targeted", #"init", &emp_drone_targeted_mp::init );
    utility::registersharedfunc( #"helper_drone", #"init", &helper_drone_mp::helper_drone_init );
    utility::registersharedfunc( #"nuke", #"init", &nuke_mp::init );
    utility::registersharedfunc( #"hover_jet", #"init", &hover_jet_mp::init );
    utility::registersharedfunc( #"cluster_spike", #"init", &cluster_spike_mp::init );
    utility::registersharedfunc( #"remote_turret", #"init", &remote_turret_mp::init );
    weapon::initkillstreakweaponmap();
    
    if ( isdefined( level.mapcustomkillstreakfunc ) )
    {
        [[ level.mapcustomkillstreakfunc ]]();
    }
    
    level.killstreakrounddelay = getmatchrulesdata( "commonOption", "killstreakDelay" );
    level.killstreakactivatedtime = [];
    
    if ( game_utility_mp::function_57f7c589ea92d695() && getdvarint( @"hash_4d5bd224f3f2f0bf", 1 ) )
    {
        setdvar( @"hash_daa203ef7cfc6ee2", 1 );
        killstreak1 = getdvar( @"hash_328d09718871cea9", "none" );
        killstreak2 = getdvar( @"hash_328d06718871c810", "uav" );
        killstreak3 = getdvar( @"hash_328d07718871ca43", "directional_uav" );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 1 ), killstreak1 );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 2 ), killstreak2 );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 3 ), killstreak3 );
    }
    
    if ( game_utility_mp::ismutationgamemode() && getdvarint( @"hash_52510a23c3e3de3c", 1 ) )
    {
        setdvar( @"hash_daa203ef7cfc6ee2", 1 );
        killstreak1 = getdvar( @"hash_a534c1c236717066", "cluster_spike" );
        killstreak2 = getdvar( @"hash_a534c0c236716e33", "airdrop_escort" );
        killstreak3 = getdvar( @"hash_a534bfc236716c00", "directional_uav" );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 1 ), killstreak1 );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 2 ), killstreak2 );
        setdvar( hashcat( @"hash_7129c8b31055dff8", 3 ), killstreak3 );
    }
    
    if ( !isdefined( level.var_9394f65c684e87fb ) )
    {
        level.var_9394f65c684e87fb = getdvarint( @"hash_daa203ef7cfc6ee2", 0 );
    }
    
    level thread killstreaks::onplayerconnect();
    level thread killstreaks::storescorestreakpointsongameend();
    outofbounds::killstreakregisteroobcallbacks();
    callback::add( #"player_spawned", &killstreaks::onplayerspawned );
    lui_game_event_aggregator::registeronluieventcallback( &killstreaks::listenkillstreakaction );
    lui_game_event_aggregator::registeronluieventcallback( &killstreaks::function_8b7328ae6e5f8f71 );
    level thread killstreaks::function_5ccf864a8230c0ce();
    
    /#
        setdevdvarifuninitialized( @"hash_2c01d701bac5d9d3", 0 );
        setdevdvarifuninitialized( @"hash_698613e6c8c52243", 0 );
    #/
}

