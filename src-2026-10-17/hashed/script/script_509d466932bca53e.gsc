#using script_1180c859f9cc1fbc;
#using script_14d76aa023628152;
#using script_15a5e1ffde586735;
#using script_1709f5071634a3de;
#using script_194f8050b4a6d3a1;
#using script_1ade2fa7cae9593d;
#using script_1d1eb2e41a985cd2;
#using script_208a12cbcccbfa63;
#using script_26f5997b01261edd;
#using script_2b51dca51198db31;
#using script_2bf5529af94c9a0;
#using script_2d110487966779fc;
#using script_2d7afcaab397c334;
#using script_319c90e90d9e6ecb;
#using script_3528d80049ffbcc0;
#using script_353e34c229ca1589;
#using script_35ea2ad71d73089b;
#using script_3c73e783818a9a01;
#using script_3c8ea7f78632414c;
#using script_3e324432284ce2c9;
#using script_49ad4836e54c2e6b;
#using script_49e4a4c208f44b76;
#using script_4b675da9f6a1fd20;
#using script_4ca4a30b15eb95bb;
#using script_4ee44c794c53009e;
#using script_4f9ce8d249a99f4a;
#using script_5560f3066718e34c;
#using script_56e2519a4d33f9a2;
#using script_5ad24b30e5045cbe;
#using script_5e0cc00f069082d4;
#using script_5efe37e054c73937;
#using script_60e83c26eb0cc317;
#using script_614a6922f8440723;
#using script_629fd7d4479d556d;
#using script_6549c4611bbb9960;
#using script_6995a3eb7d571a9f;
#using script_6a3544644b02bfb7;
#using script_6b56b541550363b5;
#using script_6ecce26a00447bae;
#using script_734dce84c468439b;
#using script_74b851b7aa1ef32d;
#using script_762e73cd6088bff;
#using script_76a9469bdb2c8bb1;
#using script_7897affa175bfab6;
#using script_7af4b8f37e520205;
#using script_7b1e082b2533e255;
#using script_7ca947eb17954434;
#using script_7dfe0b190edeca84;
#using script_9b5f893c39bde3a;
#using script_f11689e279a5173;
#using scripts\anim\notetracks_mp;
#using scripts\asm\asm_mp;
#using scripts\common\damage_effects;
#using scripts\common\script;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_damage;
#using scripts\common\vehicle_mines;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_tracking;
#using scripts\common\weapon;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\analyticslog;
#using scripts\mp\anim;
#using scripts\mp\anim_scene;
#using scripts\mp\armor;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\calloutmarkerping;
#using scripts\mp\challenges;
#using scripts\mp\class;
#using scripts\mp\compass;
#using scripts\mp\damage;
#using scripts\mp\damagefeedback;
#using scripts\mp\dev;
#using scripts\mp\dmz\dmz_poi;
#using scripts\mp\emp_debuff;
#using scripts\mp\emp_debuff_mp;
#using scripts\mp\ent_manager;
#using scripts\mp\entityheadicons;
#using scripts\mp\equipment;
#using scripts\mp\equipment_interact;
#using scripts\mp\events;
#using scripts\mp\execution;
#using scripts\mp\execution_mp;
#using scripts\mp\featurebans;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\common;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\juggernaut;
#using scripts\mp\laststand;
#using scripts\mp\loot\common_item;
#using scripts\mp\loot\common_item_weapon;
#using scripts\mp\matchdata;
#using scripts\mp\menus;
#using scripts\mp\movers;
#using scripts\mp\mp_agent;
#using scripts\mp\mp_gameskill;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\operator;
#using scripts\mp\outofbounds;
#using scripts\mp\oxygenmask_mp;
#using scripts\mp\playerhealth;
#using scripts\mp\playerlogic;
#using scripts\mp\poi;
#using scripts\mp\rank;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\shellshock;
#using scripts\mp\spawnlogic;
#using scripts\mp\stealth\enemy_mp;
#using scripts\mp\stealth\manager_mp;
#using scripts\mp\stealth\stealth_music_mp;
#using scripts\mp\supers;
#using scripts\mp\vehicles\vehicle_mp;
#using scripts\mp\weapons;

#namespace namespace_c1ad58c9f2d22230;

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x87135268, Offset: 0x12e
// Size: 0x1d6
function init()
{
    if ( !isdefined( level.players ) )
    {
        level.players = [];
    }
    
    level.var_6eeb39c05788e049 = &utility::issharedfuncdefined;
    level.sharedfuncget_func = &utility::getsharedfunc;
    anim_init();
    hud_init();
    splash_init();
    
    if ( !game[ "isLaunchChunk" ] )
    {
        killstreak_init();
    }
    
    equipment_init();
    perk_init();
    player_init();
    loadout_init();
    
    if ( !game[ "isLaunchChunk" ] )
    {
        vehicle_init();
    }
    
    ping_init();
    game_init();
    spawn_init();
    objective_init();
    
    if ( !game[ "isLaunchChunk" ] )
    {
        emp_init();
    }
    
    execution_init();
    entity_init();
    weapons_init();
    damage_effects_init();
    damage_init();
    sound_init();
    flares_init();
    shellshock_init();
    fx_init();
    ai_init();
    bots_init();
    agents_init();
    outline_init();
    game_utility_init();
    dvar_utility_init();
    rank_init();
    supers_init();
    gamescore_init();
    dlog_init();
    challenges_init();
    team_utility_init();
    stealth_init();
    gameskill_init();
    poi_init();
    aggregator_init();
    cameras_init();
    battlechatter_init();
    host_migration_init();
    function_356d0d186855d9();
    function_dcd0527cda0b07c1();
    script_init();
    loot_init();
    gasmask_init();
    health_init();
    autotests_init();
    utility::registersharedfunc( #"game", #"runleanthreadmode", &game_utility_mp::runleanthreadmode );
    utility::flag_set( "shared_functions_initialized" );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x3d8712db, Offset: 0x30c
// Size: 0x20
function gameskill_init()
{
    utility::registersharedfunc( #"gameskill", #"updateplayerattackeraccuracy", &mp_gameskill::update_player_attacker_accuracy );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xee74d4c7, Offset: 0x334
// Size: 0xe6
function poi_init()
{
    if ( game_utility::getgametype() == "dmz" )
    {
        utility::registersharedfunc( #"poi", #"issystemactive", &dmz_poi::dmzpoi_issystemactive );
        utility::registersharedfunc( #"poi", #"findpoioriginisin", &dmz_poi::dmzpoi_findpoioriginisin );
        utility::registersharedfunc( #"poi", #"isactive", &dmz_poi::function_a4891870d8e24df2 );
        return;
    }
    
    utility::registersharedfunc( #"poi", #"issystemactive", &poi::poi_issystemactive );
    utility::registersharedfunc( #"poi", #"findpoioriginisin", &poi::poi_findpoioriginisin );
    utility::registersharedfunc( #"poi", #"hash_274d8f14575dd2c1", &poi::function_356e66e91a150a02 );
    utility::registersharedfunc( #"poi", #"isactive", &poi::function_4da557e2eb873ee6 );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x6704ced7, Offset: 0x422
// Size: 0xb6
function stealth_init()
{
    utility::registersharedfunc( #"stealth", #"event_broadcast_generic", &event::event_broadcast_generic );
    utility::registersharedfunc( #"stealth", #"init", &manager_mp::init );
    utility::registersharedfunc( #"stealth_music", #"init", &stealth_music_mp::init );
    utility::registersharedfunc( #"stealth_enemy", #"init", &enemy_mp::init );
    utility::registersharedfunc( #"stealth", #"revertaiaccuracy", &manager_mp::revertaiaccuracy );
    utility::registersharedfunc( #"stealth", #"dropaiaccuracy", &manager_mp::dropaiaccuracy );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xc82015e9, Offset: 0x4e0
// Size: 0xb6
function anim_init()
{
    utility::registersharedfunc( #"anim", #"scriptmodelplayanimdeltamotion", &function_5dcd2d3a7a266a1 );
    utility::registersharedfunc( #"anim", #"asm_playfacialanim", &asm_mp::asm_playfacialanim_mp );
    utility::registersharedfunc( #"anim", #"handlenotetrack", &notetracks_mp::handlenotetrack );
    utility::registersharedfunc( #"anim", #"anim_scene", &anim_scene::anim_scene );
    utility::registersharedfunc( #"anim", #"anim_scene_create_actor", &anim_scene::anim_scene_create_actor );
    utility::registersharedfunc( #"anim", #"anim_player_solo", &anim_mp::anim_player_solo );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x7342ea61, Offset: 0x59e
// Size: 0x1c2
function hud_init()
{
    utility::registersharedfunc( #"hud", #"createnewheadicon", &entityheadicons::setheadicon_createnewicon );
    utility::registersharedfunc( #"hud", #"setheadiconfactionimage", &entityheadicons::setheadicon_factionimage );
    utility::registersharedfunc( #"hud", #"setheadiconequipment", &entityheadicons::setheadicon_equipment );
    utility::registersharedfunc( #"hud", #"setheadicondeleteicon", &entityheadicons::setheadicon_deleteicon );
    utility::registersharedfunc( #"hud", #"headiconremoveclientfrommask", &entityheadicons::setheadicon_removeclientfrommask );
    utility::registersharedfunc( #"hud", #"headiconaddclienttomask", &entityheadicons::setheadicon_addclienttomask );
    utility::registersharedfunc( #"hud", #"showsplash", &hud_message::showsplash );
    utility::registersharedfunc( #"hud", #"teamplayercardsplash", &hud_util::teamplayercardsplash );
    utility::registersharedfunc( #"hud", #"showerrormessage", &hud_message::showerrormessage );
    utility::registersharedfunc( #"hud", #"createhudelem", &hud_util::createhudelem );
    utility::registersharedfunc( #"hud", #"showelem", &hud_util::showelem );
    utility::registersharedfunc( #"hud", #"hideelem", &hud_util::hideelem );
    utility::registersharedfunc( #"hud", #"setparent", &hud_util::setparent );
    utility::registersharedfunc( #"hud", #"hash_6f07e8aa7e74982", &function_66dc8b6ae969f66d );
    utility::registersharedfunc( #"hud", #"hash_79ab725cea73e499", &hud_util::function_fc45922cb446818a );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xf279a430, Offset: 0x768
// Size: 0x20
function splash_init()
{
    utility::registersharedfunc( #"splash", #"registersplashbundle", &hud_message::registersplashbundle );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x9944a841, Offset: 0x790
// Size: 0x836
function killstreak_init()
{
    utility::registersharedfunc( #"killstreak", #"registervisibilityomnvarforkillstreak", &killstreak_utility::registervisibilityomnvarforkillstreak );
    utility::registersharedfunc( #"killstreak", #"createstreakinfo", &killstreak_utility::createstreakinfo );
    utility::registersharedfunc( #"killstreak", #"streakdeploy_doweapontabletdeploy", &killstreakdeploy::streakdeploy_doweapontabletdeploy );
    utility::registersharedfunc( #"killstreak", #"getkillstreakairstrikeheightent", &killstreak_utility::getkillstreakairstrikeheightent );
    utility::registersharedfunc( #"killstreak", #"playkillstreaktacomdialog", &killstreak_utility::playkillstreaktacomdialog );
    utility::registersharedfunc( #"killstreak", #"playkillstreakteamleaderdialog", &killstreak_utility::playkillstreakteamleaderdialog );
    utility::registersharedfunc( #"killstreak", #"hash_925d159a404f2c61", &killstreak_utility::function_d546aaa588f088c3 );
    utility::registersharedfunc( #"killstreak", #"restorekillstreakplayerangles", &killstreak_utility::restorekillstreakplayerangles );
    utility::registersharedfunc( #"killstreak", #"recordkillstreakendstats", &killstreak_utility::recordkillstreakendstats );
    utility::registersharedfunc( #"killstreak", #"hash_bf17c172d25e8b3d", &killstreaks::function_2d953e6a25a2ccd4 );
    utility::registersharedfunc( #"killstreak", #"killstreak_setmainvision", &killstreak_utility::killstreak_setmainvision );
    utility::registersharedfunc( #"killstreak", #"killstreak_setsubvision", &killstreak_utility::killstreak_setsubvision );
    utility::registersharedfunc( #"killstreak", #"iskillstreakweapon", &weapon::iskillstreakweapon );
    utility::registersharedfunc( #"killstreak", #"killstreak_registerminimapinfo", &killstreak_utility::killstreak_registerminimapinfo );
    utility::registersharedfunc( #"killstreak", #"killstreak_setupvehicledamagefunctionality", &killstreak_utility::killstreak_setupvehicledamagefunctionality );
    utility::registersharedfunc( #"killstreak", #"killstreak_updatedamagestate", &killstreak_utility::killstreak_updatedamagestate );
    utility::registersharedfunc( #"killstreak", #"playerkillstreakgetownerlookatignoreents", &killstreak_utility::playerkillstreakgetownerlookatignoreents );
    utility::registersharedfunc( #"killstreak", #"killstreak_dangernotifyplayersinrange", &killstreak_utility::killstreak_dangernotifyplayersinrange );
    utility::registersharedfunc( #"killstreak", #"streakdeploy_doweaponfireddeploy", &killstreakdeploy::streakdeploy_doweaponfireddeploy );
    utility::registersharedfunc( #"killstreak", #"streakdeploy_doweaponswitchdeploy", &killstreakdeploy::streakdeploy_doweaponswitchdeploy );
    utility::registersharedfunc( #"killstreak", #"killstreak_switchbacklastweapon", &killstreak_utility::killstreak_switchbacklastweapon );
    utility::registersharedfunc( #"killstreak", #"getridofkillstreakdeployweapon", &killstreakdeploy::getridofkillstreakdeployweapon );
    utility::registersharedfunc( #"killstreak", #"hash_1fa18935c88e6b0c", &killstreak_utility::function_e4f54128963e182 );
    utility::registersharedfunc( #"killstreak", #"hash_e8bc04d0addc2342", &killstreak_utility::function_3fcc14f5507d62f4 );
    utility::registersharedfunc( #"killstreak", #"getkillstreakminimapicon", &killstreak_utility::getkillstreakminimapicon );
    utility::registersharedfunc( #"killstreak", #"hash_183e3c892b7ef047", &killstreaks::function_b0968a642165bfd8 );
    utility::registersharedfunc( #"killstreak", #"hash_5f93815d19d9921b", &killstreaks::function_b3d3d7cda6e39b82 );
    utility::registersharedfunc( #"killstreak", #"hash_3163ed1117273710", &killstreaks::function_fc31d62878be253b );
    utility::registersharedfunc( #"killstreak", #"getplayerstreakdata", &killstreaks::getplayerstreakdata );
    utility::registersharedfunc( #"killstreak", #"init", &init_mp::init );
    utility::registersharedfunc( #"killstreak", #"addtoactivekillstreaklist", &killstreak::addtoactivekillstreaklist );
    utility::registersharedfunc( #"killstreak", #"logkillstreakevent", &matchdata::logkillstreakevent );
    utility::registersharedfunc( #"killstreak", #"givekillstreak", &killstreaks::givekillstreak );
    utility::registersharedfunc( #"killstreak", #"dokillstreakaction", &killstreaks::dokillstreakaction );
    utility::registersharedfunc( #"killstreak", #"killstreakmakevehicle", &killstreak::killstreak_make_vehicle );
    utility::registersharedfunc( #"killstreak", #"killstreaksetpremoddamagecallback", &killstreak::killstreak_set_pre_mod_damage_callback );
    utility::registersharedfunc( #"killstreak", #"killstreaksetpostmoddamagecallback", &killstreak::killstreak_set_post_mod_damage_callback );
    utility::registersharedfunc( #"killstreak", #"hash_133cc9c3bfd2aa66", &killstreak::killstreak_set_death_callback );
    utility::registersharedfunc( #"killstreak", #"hash_eb373f8102edadec", &killstreak::function_ca92421b98cb1c5 );
    utility::registersharedfunc( #"killstreak", #"maxvehiclesallowed", &killstreak::maxvehiclesallowed );
    utility::registersharedfunc( #"killstreak", #"currentactivevehiclecount", &killstreak::currentactivevehiclecount );
    utility::registersharedfunc( #"killstreak", #"allowridekillstreakplayerexit", &killstreaks::allowridekillstreakplayerexit );
    utility::registersharedfunc( #"killstreak", #"killstreakhit", &killstreaks::killstreakhit );
    utility::registersharedfunc( #"killstreak", #"getmodifieddamageusingdamagetuning", &killstreak::getmodifieddamageusingdamagetuning );
    utility::registersharedfunc( #"killstreak", #"getmodifiedantikillstreakdamage", &killstreak::getmodifiedantikillstreakdamage );
    utility::registersharedfunc( #"killstreak", #"iskillstreakweapon", &weapon::iskillstreakweapon );
    utility::registersharedfunc( #"killstreak", #"dodamagetokillstreak", &killstreak::dodamagetokillstreak );
    utility::registersharedfunc( #"killstreak", #"removefromactivekillstreaklist", &killstreak::removefromactivekillstreaklist );
    utility::registersharedfunc( #"killstreak", #"awardkillstreakfromstruct", &killstreaks::awardkillstreakfromstruct );
    utility::registersharedfunc( #"killstreak", #"getselectmappoint", &mapselect::function_ec95e9f1b6d329fb );
    utility::registersharedfunc( #"killstreak", #"startmapselectsequence", &mapselect::function_74e31405d43e142 );
    utility::registersharedfunc( #"killstreak", #"setkillstreakcontrolpriority", &killstreak::setkillstreakcontrolpriority );
    utility::registersharedfunc( #"killstreak", #"updatescrapassistdataforcecredit", &killstreaks::updatescrapassistdataforcecredit );
    utility::registersharedfunc( #"killstreak", #"updatescrapassistdata", &killstreaks::updatescrapassistdata );
    utility::registersharedfunc( #"killstreak", #"processscrapassist", &events::processscrapassist );
    utility::registersharedfunc( #"killstreak", #"gettargetmarker", &target_marker::gettargetmarker );
    utility::registersharedfunc( #"killstreak", #"waittill_confirm_or_cancel", &mapselect::waittill_confirm_or_cancel );
    utility::registersharedfunc( #"killstreak", #"awardkillstreak", &killstreaks::awardkillstreak );
    utility::registersharedfunc( #"killstreak", #"registerkillstreak", &killstreaks::registerkillstreak );
    utility::registersharedfunc( #"killstreak", #"registerkillstreakdamagedealingweapon", &killstreaks::registerkillstreakdamagedealingweapon );
    utility::registersharedfunc( #"killstreak", #"getkillstreaknamefromweapon", &killstreak::getkillstreaknamefromweapon );
    utility::registersharedfunc( #"killstreak", #"registerkillstreakstowableweapon", &killstreaks::registerkillstreakstowableweapon );
    utility::registersharedfunc( #"killstreak", #"handlemovingplatform", &manual_turret_mp::manual_turret_handlemovingplatform );
    utility::registersharedfunc( #"killstreak", #"registerkillstreakweaponfire", &killstreaks::function_9cd71155dc67fd8c );
    utility::registersharedfunc( #"killstreak", #"hash_5f93815d19d9921b", &killstreaks::function_b3d3d7cda6e39b82 );
    utility::registersharedfunc( #"killstreak", #"hash_3163ed1117273710", &killstreaks::function_fc31d62878be253b );
    utility::registersharedfunc( #"killstreak", #"getplayerstreakdata", &killstreaks::getplayerstreakdata );
    utility::registersharedfunc( #"killstreak", #"hash_ae9fad232ee97408", &killstreak_utility::function_b5d94c2d60f51b9d );
    utility::registersharedfunc( #"player", #"isenemy", &player_utility::isenemy );
    utility::registersharedfunc( #"challenges", #"onhack", &challenges::function_8e891c96efe9f293 );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xa97174f0, Offset: 0xfce
// Size: 0x296
function equipment_init()
{
    utility::registersharedfunc( #"equipment", #"hash_e54f01be6ce23bab", &equipment_utility::function_364a1a0e0c018518 );
    utility::registersharedfunc( #"throwing_knife", #"init", &throwing_knife_mp::throwing_knife_mp_init );
    utility::registersharedfunc( #"equipment", #"takeequipment", &equipment_mp::takeequipment );
    utility::registersharedfunc( #"equipment", #"giveequipment", &equipment_mp::giveequipment );
    utility::registersharedfunc( #"equipment", #"hasequipment", &equipment_mp::hasequipment );
    utility::registersharedfunc( #"equipment", #"findequipmentslot", &equipment_mp::findequipmentslot );
    utility::registersharedfunc( #"equipment", #"getequipmentammo", &equipment_mp::getequipmentammo );
    utility::registersharedfunc( #"equipment", #"setequipmentammo", &equipment_mp::setequipmentammo );
    utility::registersharedfunc( #"equipment", #"getequipmenttableinfo", &equipment_mp::getequipmenttableinfo );
    utility::registersharedfunc( #"equipment", #"getequipmentreffromweapon", &equipment_mp::getequipmentreffromweapon );
    utility::registersharedfunc( #"equipment", #"getequipmentbundlefromweaponname", &equipment_mp::getequipmentbundlefromweaponname );
    utility::registersharedfunc( #"equipment", #"hackequipment", &equipment_mp::hackequipment );
    utility::registersharedfunc( #"equipment", #"isplantedequipment", &weapons::isplantedequipment );
    utility::registersharedfunc( #"equipment", #"deleteexplosive", &weapons::deleteexplosive );
    utility::registersharedfunc( #"equipment", #"givescoreforequipment", &killstreaks::givescoreforequipment );
    utility::registersharedfunc( #"equipment", #"makeexplosiveusabletag", &weapons::makeexplosiveusabletag );
    utility::registersharedfunc( #"equipment", #"hash_abbcd9152e41d77f", &nvg::function_c58b7b66805088f5 );
    utility::registersharedfunc( #"equipment", #"combatrecordtacticalstat", &damage::combatrecordtacticalstat );
    utility::registersharedfunc( #"oxygenmask", #"init", &oxygenmask_mp::init );
    utility::registersharedfunc( #"equipment", #"remoteinteractsetup", &equipment_interact::remoteinteractsetup );
    utility::registersharedfunc( #"equipment", #"getmineignorelist", &equipment::get_mine_ignore_list );
    utility::registersharedfunc( #"equipment", #"watchflightcollision", &equipment::watch_flight_collision );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xf9a2ba0e, Offset: 0x126c
// Size: 0xb6
function entity_init()
{
    utility::registersharedfunc( #"entity", #"registerspawn", &ent_manager::registerspawn );
    utility::registersharedfunc( #"entity", #"registerspawncount", &ent_manager::registerspawncount );
    utility::registersharedfunc( #"entity", #"deregisterspawn", &ent_manager::deregisterspawn );
    utility::registersharedfunc( #"entity", #"touchingbadtrigger", &entity::touchingbadtrigger );
    utility::registersharedfunc( #"entity", #"delayentdelete", &script::delayentdelete );
    utility::registersharedfunc( #"entity", #"istouchingboundstrigger", &entity::istouchingboundstrigger );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xa11ee027, Offset: 0x132a
// Size: 0x12e
function perk_init()
{
    utility::registersharedfunc( #"perk", #"giveperk", &perk::giveperk );
    utility::registersharedfunc( #"perk", #"removeperk", &perk::removeperk );
    utility::registersharedfunc( #"perk", #"giveperk", &perk::giveperk );
    utility::registersharedfunc( #"perk", #"activateperk", &perks::activateperk );
    utility::registersharedfunc( #"perk", #"block", &perk::blockperkfunction );
    utility::registersharedfunc( #"perk", #"unblock", &perk::unblockperkfunction );
    utility::registersharedfunc( #"perk", #"perkpackage_giveoverridefieldupgrades", &perkpackage::perkpackage_giveoverridefieldupgrades );
    utility::registersharedfunc( #"perk", #"notifyperkbuffactive", &perks::notifyperkbuffactive );
    utility::registersharedfunc( #"perk", #"setperkbuffactive", &perks::setperkbuffactive );
    utility::registersharedfunc( #"perk", #"isperkinloadout", &perks::isperkinloadout );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xdf9932bd, Offset: 0x1460
// Size: 0x897
function player_init()
{
    utility::registersharedfunc( #"player", #"playerisalive", &player::isreallyalive );
    utility::registersharedfunc( #"player", #"getsuperfaction", &player_utility::getplayersuperfaction );
    utility::registersharedfunc( #"player", #"enableplayeruse", &enableplayeruse );
    utility::registersharedfunc( #"player", #"disableplayeruse", &disableplayeruse );
    utility::registersharedfunc( #"player", #"playerhide", &player_utility::function_dbe5a52a6654a982 );
    utility::registersharedfunc( #"player", #"playershow", &player_utility::function_b54a1e23734ef07 );
    utility::registersharedfunc( #"player", #"playersareenemies", &player_utility::playersareenemies );
    utility::registersharedfunc( #"player", #"getplayerdata", &getplayerdata );
    utility::registersharedfunc( #"player", #"setplayerdata", &setplayerdata );
    utility::registersharedfunc( #"player", #"controlturreton", &controlturreton );
    utility::registersharedfunc( #"player", #"controlturretoff", &controlturretoff );
    utility::registersharedfunc( #"player", #"suicide", &suicide );
    utility::registersharedfunc( #"player", #"ishost", &ishost );
    utility::registersharedfunc( #"player", #"getplayerguid", &player_utility::getplayerguid );
    utility::registersharedfunc( #"player", #"setscriptmoverkillcam", &setscriptmoverkillcam );
    utility::registersharedfunc( #"player", #"hash_d65b880897cec134", &challenges::challengesenabledforplayer );
    utility::registersharedfunc( #"player", #"getplayerclientnum", &player_utility::getplayerclientnum );
    utility::registersharedfunc( #"player", #"setusingremote", &player::setusingremote );
    utility::registersharedfunc( #"player", #"clearusingremote", &player::clearusingremote );
    utility::registersharedfunc( #"player", #"freezecontrols", &player::_freezecontrols );
    utility::registersharedfunc( #"player", #"freezecontrolsdebug", &player::function_b8d64912ebafb09 );
    utility::registersharedfunc( #"player", #"freezelookcontrols", &player::_freezelookcontrols );
    
    /#
        utility::registersharedfunc( #"player", #"printgameaction", &print::printgameaction );
    #/
    
    utility::registersharedfunc( #"player", #"doscoreevent", &points::doscoreevent );
    utility::registersharedfunc( #"player", #"setthirdpersondof", &player::setthirdpersondof );
    utility::registersharedfunc( #"player", #"hideminimap", &player::hideminimap );
    utility::registersharedfunc( #"player", #"showminimap", &player::showminimap );
    utility::registersharedfunc( #"player", #"getplayersinradius", &player_utility::script_getplayersinradius );
    utility::registersharedfunc( #"player", #"isfriendly", &player_utility::isfriendly );
    utility::registersharedfunc( #"player", #"isreallyalive", &player::isreallyalive );
    utility::registersharedfunc( #"player", #"loadout_finalizeweapons", &class::loadout_finalizeweapons );
    utility::registersharedfunc( #"player", #"getoperatorref", &operator::getoperatorref );
    utility::registersharedfunc( #"player", #"getsuperfactionindex", &operator::getsuperfactionindex );
    utility::registersharedfunc( #"player", #"hash_6dd14ba6248f5d2b", &operator::function_dc48b1d8163a5d60 );
    utility::registersharedfunc( #"player", #"isinlaststand", &player::isinlaststand );
    utility::registersharedfunc( #"player", #"isaliveandnotinlaststand", &player::isaliveandnotinlaststand );
    utility::registersharedfunc( #"player", #"disableclassswapallowed", &class::disableclassswapallowed );
    utility::registersharedfunc( #"player", #"getgametypehealthperframe", &playerhealth::getgametypehealthperframe );
    utility::registersharedfunc( #"player", #"issuperinuse", &supers_mp::issuperinuse );
    utility::registersharedfunc( #"player", #"getcurrentsuper", &supers_mp::getcurrentsuper );
    utility::registersharedfunc( #"player", #"getcurrentsuperref", &supers_mp::getcurrentsuperref );
    utility::registersharedfunc( #"player", #"hasselfrevivetoken", &laststand::hasselfrevivetoken );
    utility::registersharedfunc( #"player", #"laststandexit", &laststand::exit );
    utility::registersharedfunc( #"player", #"hash_a9665bbe77d890a2", &laststand::function_16a34021e980083d );
    utility::registersharedfunc( #"player", #"isjuggernaut", &killstreak::isjuggernaut );
    utility::registersharedfunc( #"player", #"jugg_removejuggernaut", &juggernaut::jugg_removejuggernaut );
    utility::registersharedfunc( #"player", #"preloadandqueueclass", &class::preloadandqueueclass );
    utility::registersharedfunc( #"player", #"savefavoriteloadout", &class::savefavoriteloadout );
    utility::registersharedfunc( #"player", #"playerwaittillstreamhintcomplete", &streamhint::playerwaittillstreamhintcomplete );
    utility::registersharedfunc( #"player", #"doonactionscoreevent", &namespace_5f4bb62dbf67ff87::doonactionscoreevent );
    utility::registersharedfunc( #"player", #"getuniqueid", &player::getuniqueid );
    utility::registersharedfunc( #"player", #"initplayergameobjects", &gameobjects::init_player_gameobjects );
    utility::registersharedfunc( #"player", #"shellshock", &shellshock_utility_cpmp::_shellshock );
    utility::registersharedfunc( #"player", #"stopshellshock", &shellshock_utility_cpmp::_stopshellshock );
    utility::registersharedfunc( #"player", #"fadetoblackforplayer", &game_utility::fadetoblackforplayer );
    utility::registersharedfunc( #"player", #"playerhasmoved", &playerlogic::playerhasmoved );
    utility::registersharedfunc( #"player", #"checkhit", &weapons::checkhit );
    utility::registersharedfunc( #"player", #"setdof_cruisefirst", undefined );
    utility::registersharedfunc( #"player", #"addextramovespeed", &weapons::addextramovespeed );
    utility::registersharedfunc( #"player", #"removeextramovespeed", &weapons::removeextramovespeed );
    utility::registersharedfunc( #"player", #"updatemovespeed", &weapons::updatemovespeedscale );
    utility::registersharedfunc( #"player", #"hash_f68bac609381d644", &weapons::function_6dc9cf7257519243 );
    utility::registersharedfunc( #"player", #"hash_17aaf00cf60c7a97", &weapons::function_c0a6483a3e0d7ebe );
    utility::registersharedfunc( #"player", #"setscriptmoverkillcam", &setscriptmoverkillcam );
    utility::registersharedfunc( #"player", #"setupminimap", &compass::setupminimap );
    utility::registersharedfunc( #"player", #"hash_c7518ff78ce0b708", &armor::function_2e65f2dc03880e80 );
    utility::registersharedfunc( #"player", #"hash_a539df2469b1b179", &armor::function_d5a70920ade0262e );
    utility::registersharedfunc( #"player", #"hash_5ddff9b3adcdae3a", &armor::function_521cde7757e75f0b );
    utility::registersharedfunc( #"player", #"hash_8622afcf80deaeac", &common::function_ac4bf3256b2545e3 );
    utility::registersharedfunc( #"player", #"hash_f42c37ef5b209a91", &common::function_a0f5c85d465c5f0a );
    utility::registersharedfunc( #"player", #"hash_b885d6037185a56e", &common::function_11a0a06c67c80f4d );
    utility::registersharedfunc( #"player", #"hash_1f1ccdc6843fdbb", &common::function_8ff835bf23198a0 );
    utility::registersharedfunc( #"player", #"hash_a769545511e9bef", &common::function_d85a92c557ea5a52 );
    utility::registersharedfunc( #"player", #"isspectatinganyone", &isspectatinganyone );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x1963f2c4, Offset: 0x1cff
// Size: 0x3e
function host_migration_init()
{
    utility::registersharedfunc( #"hostmigration", #"waitlongdurationwithpause", &hostmigration::waitlongdurationwithhostmigrationpause );
    utility::registersharedfunc( #"hostmigration", #"waittillnotifyortimeoutpause", &hostmigration::waittill_notify_or_timeout_hostmigration_pause );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x8931330d, Offset: 0x1d45
// Size: 0x256
function vehicle_init()
{
    utility::registersharedfunc( #"vehicle", #"vehicle_damage_clearvisuals", &vehicle_damage::clear_visuals );
    utility::registersharedfunc( #"vehicle", #"getvehicle", &player_utility::getvehicle );
    utility::registersharedfunc( #"vehicle", #"vehicle_occupancy_getoccupantseat", &vehicle_occupancy::get_occupant_seat );
    utility::registersharedfunc( #"vehicle", #"vehicle_occupancy_exit", &vehicle_occupancy::exit );
    utility::registersharedfunc( #"vehicle", #"vehicleminesgetleveldataformine", &vehicle_mines::get_mine_data );
    utility::registersharedfunc( #"vehicle", #"vehicleminesisfriendlytomine", &vehicle_mines::function_56d954c642e8acea );
    utility::registersharedfunc( #"vehicle", #"vehicleminesshouldvehicletriggermine", &vehicle_mines::function_60d53a1a3bd504cd );
    utility::registersharedfunc( #"vehicle", #"vehicleminesminetrigger", &vehicle_mines::trigger_mine );
    utility::registersharedfunc( #"vehicle", #"vehicleshowonminimap", &vehicleshowonminimap );
    utility::registersharedfunc( #"vehicle", #"vehicleshowonminimapforclient", &vehicleshowonminimapforclient );
    utility::registersharedfunc( #"vehicle", #"spawnhelicopter", &spawnhelicopter );
    utility::registersharedfunc( #"vehicle", #"setvehicleturretcamo", &setvehicleturretcamo );
    utility::registersharedfunc( #"vehicle", #"init", &vehicle_mp::vehicle_mp_init );
    utility::registersharedfunc( #"vehicle", #"incrementfauxvehiclecount", &killstreak::incrementfauxvehiclecount );
    utility::registersharedfunc( #"vehicle", #"decrementfauxvehiclecount", &killstreak::decrementfauxvehiclecount );
    utility::registersharedfunc( #"vehicle", #"clearvehiclereservation", &vehicle_tracking::function_4f76f5b4541acef1 );
    utility::registersharedfunc( #"vehicle", #"isvehicleweapon", &vehicle::isvehicleweapon );
    utility::registersharedfunc( #"vehicle", #"hash_d619f6815b2b6782", &damage_utility::register_vehicle_damage_callback );
    utility::create_func_ref( "fastrope_anim", &vehicle_mp::fastrope_anim );
    utility::create_func_ref( "vehicle_door_anim", &vehicle_mp::vehicle_anim );
    utility::create_func_ref( "vehiclePlayAnim", &vehicleplayanim );
    utility::create_func_ref( "vehicleClearAnims", &vehicleclearanims );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x41bdbfa2, Offset: 0x1fa3
// Size: 0x3e
function ping_init()
{
    utility::registersharedfunc( #"ping", #"create", &calloutmarkerping::createcallout );
    utility::registersharedfunc( #"ping", #"hash_83e18743373d032b", &calloutmarkerping::function_3c501da3379eca0a );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x9345178a, Offset: 0x1fe9
// Size: 0x6e0
function game_init()
{
    utility::registersharedfunc( #"game", #"forcenetfieldhighlod", &function_2fbc21ea8098cbcd );
    utility::registersharedfunc( #"game", #"getprogressiondata", &getprogressiondata );
    utility::registersharedfunc( #"game", #"setprogressiondata", &setprogressiondata );
    utility::registersharedfunc( #"game", #"gettimepassed", &game_utility::gettimepassed );
    utility::registersharedfunc( #"game", #"shouldmodesetsquads", &squad_utility::shouldmodesetsquads );
    utility::registersharedfunc( #"game", #"isusingmatchrulesdata", &isusingmatchrulesdata );
    utility::registersharedfunc( #"game", #"getmatchrulesdata", &getmatchrulesdata );
    utility::registersharedfunc( #"game", #"getmatchdata", &getmatchdata );
    utility::registersharedfunc( #"game", #"getgametype", &game_utility::getgametype );
    utility::registersharedfunc( #"game", #"isdedicatedserver", &isdedicatedserver );
    utility::registersharedfunc( #"game", #"getteamdata", &teams::getteamdata );
    utility::registersharedfunc( #"game", #"createobjective", &objidpoolmanager::createobjective );
    utility::registersharedfunc( #"game", #"createobjectiveengineer", &objidpoolmanager::createobjective_engineer );
    utility::registersharedfunc( #"game", #"createobjectivehidden", &objidpoolmanager::createobjective_hidden );
    utility::registersharedfunc( #"game", #"requestobjectiveid", &objidpoolmanager::requestobjectiveid );
    utility::registersharedfunc( #"game", #"returnobjectiveid", &objidpoolmanager::returnobjectiveid );
    utility::registersharedfunc( #"game", #"objectivesetiszone", &objidpoolmanager::function_e4d6a71507372662 );
    utility::registersharedfunc( #"game", #"handlemovingplatforms", &movers::handle_moving_platforms );
    utility::registersharedfunc( #"game", #"handlemovingplatformtouch", &movers::handle_moving_platform_touch );
    utility::registersharedfunc( #"game", #"registerentforoob", &outofbounds::registerentforoob );
    utility::registersharedfunc( #"game", #"clearoob", &outofbounds::clearoob );
    utility::registersharedfunc( #"game", #"onenteroobtrigger", &outofbounds::onenteroobtrigger );
    utility::registersharedfunc( #"game", #"onexitoobtrigger", &outofbounds::onexitoobtrigger );
    utility::registersharedfunc( #"game", #"checkinvalidoobtriggers", &outofbounds::checkinvalidoobtriggers );
    utility::registersharedfunc( #"game", #"getsquadmates", &teams::getsquadmates );
    utility::registersharedfunc( #"game", #"registerplayerframeupdatecallback", &player_frame_update_aggregator::registerplayerframeupdatecallback );
    utility::registersharedfunc( #"game", #"trysaylocalsound", &battlechatter_mp::trysaylocalsound );
    utility::registersharedfunc( #"game", #"addrecentattacker", &battlechatter_mp::addrecentattacker );
    utility::registersharedfunc( #"game", #"tutorialprint", &print::tutorialprint );
    utility::registersharedfunc( #"game", #"setovertimelimitdvar", &game_utility_mp::setovertimelimitdvar );
    utility::registersharedfunc( #"game", #"gethostplayer", &gamelogic_mp::gethostplayer );
    utility::registersharedfunc( #"game", #"makeenterexittrigger", &trigger::makeenterexittrigger );
    utility::registersharedfunc( #"game", #"registersentient", &sentientpoolmanager::registersentient );
    utility::registersharedfunc( #"game", #"unregistersentient", &sentientpoolmanager::unregistersentient );
    utility::registersharedfunc( #"game", #"gameflagclear", &flags::gameflagclear );
    utility::registersharedfunc( #"game", #"hash_cc3439d8b0f2281f", &flags::gameflag );
    utility::registersharedfunc( #"game", #"getitemdroporiginandangles", &pickups::getitemdroporiginandangles );
    utility::registersharedfunc( #"game", #"isjuggermoshgamemode", &game_utility_mp::isjuggermoshgamemode );
    utility::registersharedfunc( #"game", #"getoperatorcustomization", &operator::getoperatorcustomization );
    utility::registersharedfunc( #"game", #"registeronluieventcallback", &lui_game_event_aggregator::registeronluieventcallback );
    utility::registersharedfunc( #"game", #"isloadoutindexdefault", &menus::isloadoutindexdefault );
    utility::registersharedfunc( #"game", #"getclasschoice", &menus::getclasschoice );
    utility::registersharedfunc( #"game", #"createhintobject", &gameobjects::createhintobject );
    utility::registersharedfunc( #"game", #"processtouchent", &gameobjects::processtouchent );
    utility::registersharedfunc( #"game", #"updateuiprogress", &gameobjects::updateuiprogress );
    utility::registersharedfunc( #"game", #"non_player_add_ignore_damage_signature", &damage::non_player_add_ignore_damage_signature );
    utility::registersharedfunc( #"game", #"non_player_remove_ignore_damage_signature", &damage::non_player_remove_ignore_damage_signature );
    utility::registersharedfunc( #"game", #"registerscoreinfo", &rank::registerscoreinfo );
    utility::registersharedfunc( #"game", #"addspawnviewer", &spawnlogic::addspawnviewer );
    utility::registersharedfunc( #"game", #"removespawnviewer", &spawnlogic::removespawnviewer );
    utility::registersharedfunc( #"game", #"ispointinoutofbounds", &outofbounds::ispointinoutofbounds );
    utility::registersharedfunc( #"game", #"findboxcenter", &spawnlogic::findboxcenter );
    utility::registersharedfunc( #"game", #"isteamreviveenabled", &game_utility_mp::isteamreviveenabled );
    utility::registersharedfunc( #"game", #"hash_b59823ee25c7e338", &common::function_6b65663570bf5d41 );
    utility::registersharedfunc( #"game", #"hash_3344b007b716de5", &game_utility_mp::function_18eeb0e3becb75c2 );
    utility::registersharedfunc( #"game", #"islifelimited", &game_utility_mp::islifelimited );
    utility::registersharedfunc( #"game", #"squadAsTeamEnabled", &teams::squadasteamenabled );
    utility::registersharedfunc( #"game", #"hash_5efb2e5bbff12fc6", &teams::function_d032b36d01bbbab3 );
    utility::registersharedfunc( #"game", #"islaststandenabled", &game_utility_mp::islaststandenabled );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xf3427373, Offset: 0x26d1
// Size: 0x7a
function spawn_init()
{
    utility::registersharedfunc( #"spawn", #"removespawninfluencer", &spawnlogic::removespawninfluencer );
    utility::registersharedfunc( #"spawn", #"addspawninfluencer", &spawnlogic::addspawninfluencer );
    utility::registersharedfunc( #"spawn", #"isspawninfluenceractive", &spawnlogic::isspawninfluenceractive );
    utility::registersharedfunc( #"spawn", #"getcodehandlefromscripthandle", &spawnlogic::influencepoint_getcodehandlefromscripthandle );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xa134d066, Offset: 0x2753
// Size: 0x14c
function objective_init()
{
    utility::registersharedfunc( #"objective", #"showtoplayer", &objidpoolmanager::objective_playermask_addshowplayer );
    utility::registersharedfunc( #"objective", #"hidefromplayer", &objidpoolmanager::objective_playermask_hidefrom );
    utility::registersharedfunc( #"objective", #"hidefromall", &objidpoolmanager::objective_playermask_hidefromall );
    utility::registersharedfunc( #"objective", #"setminimapalphafromentity", &objidpoolmanager::function_fdc7130613f3a8ea );
    utility::registersharedfunc( #"objective", #"objective_add_objective", &objidpoolmanager::objective_add_objective );
    utility::registersharedfunc( #"objective", #"objective_set_play_intro", &objidpoolmanager::objective_set_play_intro );
    utility::registersharedfunc( #"objective", #"objective_set_play_outro", &objidpoolmanager::objective_set_play_outro );
    utility::registersharedfunc( #"objective", #"update_objective_onentity", &objidpoolmanager::update_objective_onentity );
    utility::registersharedfunc( #"objective", #"update_objective_setbackground", &objidpoolmanager::update_objective_setbackground );
    utility::registersharedfunc( #"objective", #"update_objective_ownerteam", &objidpoolmanager::update_objective_ownerteam );
    utility::registersharedfunc( #"objective", #"update_objective_ownerclient", &objidpoolmanager::update_objective_ownerclient );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x2ffe23fd, Offset: 0x28a7
// Size: 0x12e
function emp_init()
{
    utility::registersharedfunc( #"emp", #"clear_emp", &emp_debuff::clear_emp );
    utility::registersharedfunc( #"emp", #"allow_emp", &emp_debuff::allow_emp );
    utility::registersharedfunc( #"emp", #"emp_debuff_get_emp_count", &emp_debuff::emp_debuff_get_emp_count );
    utility::registersharedfunc( #"emp", #"is_empd", &emp_debuff::is_empd );
    utility::registersharedfunc( #"emp", #"play_scramble", &emp_debuff::play_scramble );
    utility::registersharedfunc( #"emp", #"stop_scramble", &emp_debuff::stop_scramble );
    utility::registersharedfunc( #"emp", #"emp_debuff_get_emp_ents", &emp_debuff::empdebuff_get_emp_ents );
    utility::registersharedfunc( #"emp", #"init", &emp_debuff_mp::emp_debuff_init );
    utility::registersharedfunc( #"emp", #"emp_debuff_register", &emp_debuff::emp_debuff_register );
    utility::registersharedfunc( #"emp", #"emp_debuff_deregister", &emp_debuff::emp_debuff_deregister );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x78b3d1bb, Offset: 0x29dd
// Size: 0x76
function execution_init()
{
    utility::registersharedfunc( #"executions", #"is_in_takedown", &execution::is_in_takedown );
    utility::registersharedfunc( #"execution", #"isinexecutionattack", &isinexecutionattack );
    utility::registersharedfunc( #"execution", #"isinexecutionvictim", &isinexecutionvictim );
    utility::registersharedfunc( #"execution", #"init", &execution_mp::execution_mp_init );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xdec53ebd, Offset: 0x2a5b
// Size: 0x5c
function damage_effects_init()
{
    utility::registersharedfunc( #"weapons", #"enableburnfx", &damage_effects::enableburnfx );
    utility::registersharedfunc( #"weapons", #"disableburnfx", &damage_effects::disableburnfx );
    utility::registersharedfunc( #"weapons", #"enableburnfxfortime", &damage_effects::enableburnfxfortime );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x5b725c0, Offset: 0x2abf
// Size: 0x78b
function weapons_init()
{
    utility::registersharedfunc( #"weapons", #"setmissileminimapvisible", &function_ac9df9f2a8e033db );
    utility::registersharedfunc( #"weapons", #"setmissileimpactminimapicon", &function_519a796719d62198 );
    utility::registersharedfunc( #"weapons", #"hash_a02d1dbbb057f8b0", &function_681f2a0d5c7420db );
    utility::registersharedfunc( #"weapons", #"hash_b36b4b3fd3a15594", &function_d0fcbff5a25cc481 );
    utility::registersharedfunc( #"weapons", #"hash_3db33cbf4379d27d", &function_d93054349b7f4e82 );
    utility::registersharedfunc( #"weapons", #"saveweaponstates", &weapon_utility::saveweaponstates );
    utility::registersharedfunc( #"weapons", #"switchtoweapon", &inventory_utility::_switchtoweapon );
    utility::registersharedfunc( #"weapons", #"switchtoweaponimmediate", &inventory_utility::_switchtoweaponimmediate );
    utility::registersharedfunc( #"weapons", #"giveweapon", &inventory_utility::_giveweapon );
    utility::registersharedfunc( #"weapons", #"takeweapon", &inventory_utility::_takeweapon );
    utility::registersharedfunc( #"weapons", #"getridofweapon", &inventory_utility::getridofweapon );
    utility::registersharedfunc( #"weapons", #"forcevalidweapon", &inventory_utility::forcevalidweapon );
    utility::registersharedfunc( #"weapons", #"domonitoredweaponswitch", &inventory_utility::domonitoredweaponswitch );
    utility::registersharedfunc( #"weapons", #"isswitchingtoweaponwithmonitoring", &inventory_utility::isswitchingtoweaponwithmonitoring );
    utility::registersharedfunc( #"weapons", #"abortmonitoredweaponswitch", &inventory_utility::abortmonitoredweaponswitch );
    utility::registersharedfunc( #"weapons", #"iscurrentweapon", &inventory_utility::iscurrentweapon );
    utility::registersharedfunc( #"weapons", #"givegunlessweapon", &inventory_utility::givegunlessweapon );
    utility::registersharedfunc( #"weapons", #"takegunlessweapon", &inventory_utility::takegunlessweapon );
    utility::registersharedfunc( #"weapons", #"issharpmeleeweapon", &weapon_utility::issharpmeleeweapon );
    utility::registersharedfunc( #"weapons", #"islockedonto", &weapon_utility::islockedonto );
    utility::registersharedfunc( #"weapons", #"hasincoming", &weapon_utility::hasincoming );
    utility::registersharedfunc( #"weapons", #"hasbunkerbustersattached", &weapon_utility::hasbunkerbustersattached );
    utility::registersharedfunc( #"weapons", #"isbulletweapon", &weapon_utility::isbulletweapon );
    utility::registersharedfunc( #"weapons", #"hash_591d84c60e3b7802", &weapon_utility::function_d2c8356dc369d9ce );
    utility::registersharedfunc( #"weapons", #"hash_e2adafa41f9e4a45", &weapon_utility::function_d2c8356dc369d9ce );
    utility::registersharedfunc( #"weapons", #"_launchgrenade", &weapon::_launchgrenade );
    utility::registersharedfunc( #"weapons", #"mapweapon", &weapon::mapweapon );
    utility::registersharedfunc( #"weapons", #"gas_createtrigger", &gas_grenade::gas_createtrigger );
    utility::registersharedfunc( #"weapons", #"iscacprimaryorsecondary", &weapon::iscacprimaryorsecondary );
    utility::registersharedfunc( #"weapons", #"attachmentisselectable", &weapon::attachmentisselectable );
    utility::registersharedfunc( #"weapons", #"attachmentisdefault", &weapon::attachmentisdefault );
    utility::registersharedfunc( #"weapons", #"hash_8f8c7ad6b7361eb1", &weapons::function_7cc000a4d4bc9a60 );
    utility::registersharedfunc( #"weapons", #"savetogglescopestates", &weapons::savetogglescopestates );
    utility::registersharedfunc( #"weapons", #"savealtstates", &weapons::savealtstates );
    utility::registersharedfunc( #"weapons", #"updatesavedaltstate", &weapons::updatesavedaltstate );
    utility::registersharedfunc( #"weapons", #"hash_4d5ead594208e17c", &weapons::function_bc0af64402b25353 );
    utility::registersharedfunc( #"weapons", #"updatetogglescopestate", &weapons::updatetogglescopestate );
    utility::registersharedfunc( #"weapons", #"onequipmentplanted", &weapons::onequipmentplanted );
    utility::registersharedfunc( #"weapons", #"removeequip", &weapons::removeequip );
    utility::registersharedfunc( #"weapons", #"magicbullet", &weapon_utility::_magicbullet );
    utility::registersharedfunc( #"weapons", #"watchforplacementfirestate", &target_marker::watchforplacementfirestate );
    utility::registersharedfunc( #"weapons", #"dropweaponfordeath", &weapons::dropweaponfordeath );
    utility::registersharedfunc( #"weapons", #"getweapongroup", &weapon::getweapongroup );
    utility::registersharedfunc( #"weapons", #"issuperweapon", &weapon::issuperweapon );
    utility::registersharedfunc( #"weapons", #"monitordisownedequipment", &weapons::monitordisownedequipment );
    utility::registersharedfunc( #"weapons", #"minedamagemonitor", &weapons::minedamagemonitor );
    utility::registersharedfunc( #"weapons", #"outlineequipmentforowner", &weapons::outlineequipmentforowner );
    utility::registersharedfunc( #"weapons", #"makeexplosiveunusuabletag", &weapons::makeexplosiveunusuabletag );
    utility::registersharedfunc( #"weapons", #"explosivetrigger", &weapons::explosivetrigger );
    utility::registersharedfunc( #"weapons", #"addlockedon", &weapon_utility::addlockedon );
    utility::registersharedfunc( #"weapons", #"removelockedon", &weapon_utility::removelockedon );
    utility::registersharedfunc( #"weapons", #"ismissilelauncherlockonallowed", &weapon_utility::ismissilelauncherlockonallowed );
    utility::registersharedfunc( #"weapons", #"lockonlaunchergettargetarray", &weapons::lockonlaunchers_gettargetarray );
    utility::registersharedfunc( #"weapons", #"iscurrenttertiaryweapon", &weapon::iscurrenttertiaryweapon );
    utility::registersharedfunc( #"weapons", #"hash_591d84c60e3b7802", &weapon_utility::function_d2c8356dc369d9ce );
    utility::registersharedfunc( #"weapons", #"hash_e2adafa41f9e4a45", &weapon_utility::function_d2c8356dc369d9ce );
    utility::registersharedfunc( #"weapons", #"isgestureweapon", &weapon::isgesture );
    utility::registersharedfunc( #"weapons", #"buildweapon", &weapon::buildweapon );
    utility::registersharedfunc( #"weapons", #"watchtargetlockedontobyprojectile", &weapon_utility::watchtargetlockedontobyprojectile );
    
    if ( common_item::items_isenabled() )
    {
        utility::registersharedfunc( #"weapons", #"hash_3095ace2af602519", &item_weapon::function_80e13ca8b843fd9e );
        utility::registersharedfunc( #"weapons", #"hash_2331be816b77366d", &item_weapon::function_7e6b6d717dfe28d8 );
    }
    else
    {
        utility::registersharedfunc( #"weapons", #"hash_3095ace2af602519", &weapon::function_dce93539f9791cd0 );
        utility::registersharedfunc( #"weapons", #"hash_2331be816b77366d", &weapon::function_4816b0b66e714dd8 );
    }
    
    /#
        utility::registersharedfunc( #"weapons_dev", #"gui_giveattachment_internal", &dev_mp::gui_giveattachment_internal );
    #/
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xb8073f66, Offset: 0x3252
// Size: 0x21e
function damage_init()
{
    utility::registersharedfunc( #"damage", #"isheadshot", &damage_utility::isheadshot );
    utility::registersharedfunc( #"damage", #"adddamagemodifier", &damage_utility::adddamagemodifier );
    utility::registersharedfunc( #"damage", #"removedamagemodifier", &damage_utility::removedamagemodifier );
    utility::registersharedfunc( #"damage", #"isstuckdamage", &damage_utility::isstuckdamage );
    utility::registersharedfunc( #"damage", #"enqueuecorpsetablefunc", &damage::enqueuecorpsetablefunc );
    utility::registersharedfunc( #"damage", #"dequeuecorpsetablefunc", &damage::dequeuecorpsetablefunc );
    utility::registersharedfunc( #"damage", #"updatedamagefeedback", &damagefeedback::updatedamagefeedback );
    utility::registersharedfunc( #"damage", #"onkillstreakkilled", &damage::onkillstreakkilled );
    utility::registersharedfunc( #"damage", #"logattackerkillstreak", &damage::logattackerkillstreak );
    utility::registersharedfunc( #"damage", #"handledamagefeedback", &damage::handledamagefeedback );
    utility::registersharedfunc( #"damage", #"_suicide", &damage::_suicide );
    utility::registersharedfunc( #"damage", #"hudicontype", &damagefeedback::hudicontype );
    utility::registersharedfunc( #"damage", #"handleapdamage", &damage::handleapdamage );
    utility::registersharedfunc( #"damage", #"monitordamage", &damage::monitordamage );
    utility::registersharedfunc( #"damage", #"isfmjdamage", &damage::isfmjdamage );
    utility::registersharedfunc( #"damage", #"handleapammodamage", &damage::handleapammodamage );
    utility::registersharedfunc( #"damage", #"istacticaldamage", &damage::istacticaldamage );
    utility::registersharedfunc( #"damage", #"validateattacker", &damage::_validateattacker );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xf369de9a, Offset: 0x3478
// Size: 0xb6
function sound_init()
{
    utility::registersharedfunc( #"sound", #"playsoundtoplayer", &playsoundtoplayer_cp_mp );
    utility::registersharedfunc( #"sound", #"hash_c1ada96a574a6fd2", &dialog::leaderdialogonplayer );
    utility::registersharedfunc( #"sound", #"trysaylocalsound", &battlechatter_mp::trysaylocalsound );
    utility::registersharedfunc( #"sound", #"playkillstreakdeploydialog", &battlechatter_mp::playkillstreakdeploydialog );
    utility::registersharedfunc( #"sound", #"playsoundontag", &sound::play_sound_on_tag );
    utility::registersharedfunc( #"sound", #"codcastersetplayerstatuseffect", &player::codcastersetplayerstatuseffect );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x8e5bb179, Offset: 0x3536
// Size: 0x7a
function flares_init()
{
    utility::registersharedfunc( #"flares", #"handleincomingstinger", &flares::flares_handleincomingstinger );
    utility::registersharedfunc( #"flares", #"reducereserves", &flares::flares_reducereserves );
    utility::registersharedfunc( #"flares", #"deploy", &flares::flares_deploy );
    utility::registersharedfunc( #"flares", #"playfx", &flares::flares_playfx );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x50fa29f7, Offset: 0x35b8
// Size: 0x3e
function shellshock_init()
{
    utility::registersharedfunc( #"shellshock", #"artillery_earthquake", &shellshock::artillery_earthquake );
    utility::registersharedfunc( #"shellshock", #"grenade_earthquakeatposition", &shellshock::grenade_earthquakeatposition );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x1581994a, Offset: 0x35fe
// Size: 0x5a
function ai_init()
{
    utility::registersharedfunc( #"ai", #"giveaiweapon", &function_5b86372aa279b26b );
    utility::registersharedfunc( #"ai", #"onusedarmorplate", &agent_utils::function_4e993a7242cafcc2 );
    utility::registersharedfunc( #"ai", #"getcorpseentity", &getcorpseentity );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x52eaebba, Offset: 0x3660
// Size: 0x56
function bots_init()
{
    utility::registersharedfunc( #"bots", #"botsetstance", &botsetstance );
    utility::registersharedfunc( #"bots", #"botpressbutton", &botpressbutton );
    utility::registersharedfunc( #"bots", #"botclearbutton", &botclearbutton );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x38f75110, Offset: 0x36be
// Size: 0x3e
function fx_init()
{
    utility::registersharedfunc( #"fx", #"spawnfxforclient", &function_d918a74b34d5d23 );
    utility::registersharedfunc( #"fx", #"setfxkilldefondelete", &function_2834566d5f04fcb );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x7b9f38c6, Offset: 0x3704
// Size: 0x45
function agents_init()
{
    namespace_abe3c6a0d1969d3c::function_cd44eebeae7412f5();
    utility::registersharedfunc( #"agents", #"deactivateagent", &agent_utility::deactivateagent );
    utility::registersharedfunc( #"agents", #"spawnnewagentaitype", &mp_agent::spawnnewagentaitype );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x450c068a, Offset: 0x3751
// Size: 0x98
function outline_init()
{
    utility::registersharedfunc( #"outline", #"outlinedisable", &outline::outlinedisable );
    utility::registersharedfunc( #"outline", #"outlineenableforplayer", &outline::outlineenableforplayer );
    utility::registersharedfunc( #"outline", #"outlineenableforteam", &outline::outlineenableforteam );
    utility::registersharedfunc( #"outline", #"hudoutlineviewmodelenable", &outline::_hudoutlineviewmodelenable );
    utility::registersharedfunc( #"outline", #"hudoutlineviewmodeldisable", &outline::_hudoutlineviewmodeldisable );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x2e0c3429, Offset: 0x37f1
// Size: 0x78
function game_utility_init()
{
    utility::registersharedfunc( #"game_utility", #"createprojectilepartition", &game_utility::createprojectilepartition );
    utility::registersharedfunc( #"game_utility", #"hash_2db015103a87210", &game_utility::function_affd501b220b03c5 );
    utility::registersharedfunc( #"game_utility", #"hash_c7bd2494f8cf6f3c", &isdedicatedserver );
    utility::registersharedfunc( #"game_utility", #"init", &game_utility_mp::game_utility_mp_init );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xaa9b0635, Offset: 0x3871
// Size: 0x10
function battlechatter_init()
{
    level.var_37c0365dad77223 = &function_404906047e600bb9;
}

// Namespace namespace_c1ad58c9f2d22230
// Params 2
// Checksum 0x814860ec, Offset: 0x3889
// Size: 0x2c
function function_404906047e600bb9( origin, maxdist = level.bcs_maxdist )
{
    return getcorpsearraywithinradius( origin, maxdist );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x91750606, Offset: 0x38be
// Size: 0x20
function dvar_utility_init()
{
    utility::registersharedfunc( #"dvar_utility", #"getfloatproperty", &dvars::getfloatproperty );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xa752e020, Offset: 0x38e6
// Size: 0xb6
function rank_init()
{
    utility::registersharedfunc( #"rank", #"getscoreinfovalue", &rank::getscoreinfovalue );
    utility::registersharedfunc( #"rank", #"getscoreinfoxp", &rank::getscoreinfoxp );
    utility::registersharedfunc( #"rank", #"giverankxp", &rank::giverankxp );
    utility::registersharedfunc( #"rank", #"scoreeventpopup", &rank::scoreeventpopup );
    utility::registersharedfunc( #"rank", #"displayscoreeventpoints", &points::displayscoreeventpoints );
    utility::registersharedfunc( #"rank", #"killeventtextpopup", &events::killeventtextpopup );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x9b2158f4, Offset: 0x39a4
// Size: 0x2b4
function supers_init()
{
    utility::registersharedfunc( #"supers", #"givesuper", &supers_mp::givesuper );
    utility::registersharedfunc( #"supers", #"givesuperpoints", &supers_mp::givesuperpoints );
    utility::registersharedfunc( #"supers", #"superusefinished", &supers_mp::superusefinished );
    utility::registersharedfunc( #"supers", #"getsuperpointsneeded", &supers_mp::getsuperpointsneeded );
    utility::registersharedfunc( #"supers", #"combatrecordsupermisc", &supers_mp::combatrecordsupermisc );
    utility::registersharedfunc( #"supers", #"hasaprrounds", &super_suppression_rounds::suppressionrounds_hasaprrounds );
    utility::registersharedfunc( #"supers", #"setsuperbasepoints", &supers_mp::setsuperbasepoints );
    utility::registersharedfunc( #"supers", #"refundsuper", &supers_mp::refundsuper );
    utility::registersharedfunc( #"supers", #"setsuperisinuse", &supers_mp::setsuperisinuse );
    utility::registersharedfunc( #"supers", #"setsuperisactive", &supers_mp::setsuperisactive );
    utility::registersharedfunc( #"supers", #"getcurrentsuper", &supers_mp::getcurrentsuper );
    utility::registersharedfunc( #"supers", #"trygiveuseweapon", &supers_mp::trygiveuseweapon );
    utility::registersharedfunc( #"supers", #"issuperinuse", &supers_mp::issuperinuse );
    utility::registersharedfunc( #"supers", #"updatesuperuiprogress", &supers_mp::updatesuperuiprogress );
    utility::registersharedfunc( #"supers", #"updatesuperuistate", &supers_mp::updatesuperuistate );
    utility::registersharedfunc( #"supers", #"getsuperbundlefromoffhandweaponname", &supers_mp::getsuperbundlefromoffhandweaponname );
    utility::registersharedfunc( #"supers", #"getsuperweapon", &supers_mp::getsuperweapon );
    utility::registersharedfunc( #"supers", #"handlesuperuistatechange", &supers_mp::handlesuperuistatechange );
    utility::registersharedfunc( #"supers", #"hash_d0c1f597fe066ed4", &supers_mp::function_328cd660d9471655 );
    utility::registersharedfunc( #"supers", #"hash_7539ea2b0ba9b967", &supers_mp::function_63dcc4ff1dda9316 );
    utility::registersharedfunc( #"supers", #"hash_5f9f3719cc732dd9", &supers_mp::function_ce731345fd5bb066 );
    utility::registersharedfunc( #"supers", #"hash_eb21ce00d0d2a9ba", &supers_mp::function_8431cb348bce2a35 );
    utility::registersharedfunc( #"supers", #"hash_9ab85ffac4b7745d", &supers_mp::function_b2c265eac24778f2 );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x55047607, Offset: 0x3c60
// Size: 0x3e
function gamescore_init()
{
    utility::registersharedfunc( #"gamescore", #"trackdebuffassist", &gamescore::trackdebuffassist );
    utility::registersharedfunc( #"gamescore", #"untrackdebuffassist", &gamescore::untrackdebuffassist );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xb6f6eb43, Offset: 0x3ca6
// Size: 0x3e
function dlog_init()
{
    utility::registersharedfunc( #"dlog", #"fieldupgradeexpired", &analyticslog::logevent_fieldupgradeexpired );
    utility::registersharedfunc( #"dlog", #"killstreakexpired", &analyticslog::logevent_killstreakexpired );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x732105d5, Offset: 0x3cec
// Size: 0xb6
function challenges_init()
{
    utility::registersharedfunc( #"challenges", #"onvehiclekilled", &challenges::vehiclekilled );
    utility::registersharedfunc( #"challenges", #"reportvehicleevent", &challenges::reportvehicleevent );
    utility::registersharedfunc( #"challenges", #"onfieldupgradeend", &challenges::function_31c9b007b2bdc1aa );
    utility::registersharedfunc( #"challenges", #"onkillstreakend", &challenges::function_5a6550a72220daf8 );
    utility::registersharedfunc( #"challenges", #"onping", &challenges::function_a9d044c119da4540 );
    utility::registersharedfunc( #"challenges", #"hash_fdebb4c8cc9f1d5e", &challenges::function_cf263d7c7bd3344b );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x7d1b48a6, Offset: 0x3daa
// Size: 0x5c
function team_utility_init()
{
    utility::registersharedfunc( #"team_utility", #"hash_5de02d9395de8621", &join_team_aggregator::registeronplayerjointeamcallback );
    utility::registersharedfunc( #"team_utility", #"getfriendlyplayers", &teams::getfriendlyplayers );
    utility::registersharedfunc( #"team_utility", #"getenemyplayers", &teams::getenemyplayers );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xb691eb58, Offset: 0x3e0e
// Size: 0x20
function aggregator_init()
{
    utility::registersharedfunc( #"aggregator", #"registeronluieventcallback", &lui_game_event_aggregator::registeronluieventcallback );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x9ce166fe, Offset: 0x3e36
// Size: 0x20
function cameras_init()
{
    utility::registersharedfunc( #"cameras", #"tacticalcamera_hack", &tactical_camera::tacticalcamera_hack );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x858ddd, Offset: 0x3e5e
// Size: 0x110
function loadout_init()
{
    utility::registersharedfunc( #"loadout", #"cac_getflcextraequipmentprimary", &class::cac_getflcextraequipmentprimary );
    utility::registersharedfunc( #"loadout", #"cac_getflcextraequipmentsecondary", &class::cac_getflcextraequipmentsecondary );
    utility::registersharedfunc( #"loadout", #"table_getflcextraequipmentprimary", &class::table_getflcextraequipmentprimary );
    utility::registersharedfunc( #"loadout", #"table_getflcextraequipmentsecondary", &class::table_getflcextraequipmentsecondary );
    utility::registersharedfunc( #"loadout", #"loadout_getclasstype", &class::loadout_getclasstype );
    utility::registersharedfunc( #"loadout", #"cac_getextraequipmentprimary", &class::cac_getextraequipmentprimary );
    utility::registersharedfunc( #"loadout", #"cac_getextraequipmentsecondary", &class::cac_getextraequipmentsecondary );
    utility::registersharedfunc( #"loadout", #"table_getextraequipmentprimary", &class::table_getextraequipmentprimary );
    utility::registersharedfunc( #"loadout", #"table_getextraequipmentsecondary", &class::table_getextraequipmentsecondary );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x2b62aa3, Offset: 0x3f76
// Size: 0x49
function function_356d0d186855d9()
{
    utility::create_func_ref( "setsaveddvar", &setdvar );
    utility::registersharedfunc( #"engine", #"hash_ff8355771dcc2c20", &isusingentitypartitiongrid );
    utility::registersharedfunc( #"engine", #"setomnvarforallclients", &setomnvarforallclients );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0x9f18bf54, Offset: 0x3fc7
// Size: 0x20
function function_dcd0527cda0b07c1()
{
    utility::registersharedfunc( #"featurebans", #"hash_b48bbbe473ee5a3c", &featurebans::function_5ee30699dd0c6001 );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xf03f3b2a, Offset: 0x3fef
// Size: 0xb6
function gasmask_init()
{
    utility::registersharedfunc( #"gasmask", #"toggleloopingcoughaudiosupression", &function_e13d0af3e40e5a30 );
    utility::registersharedfunc( #"gasmask", #"playequipgesture", &gasmaskplayequipgesture );
    utility::registersharedfunc( #"gasmask", #"iscrackenabled", &gasmaskiscrackenabled );
    utility::registersharedfunc( #"gasmask", #"crackthresholdone", &gasmaskcrackthresholdone );
    utility::registersharedfunc( #"gasmask", #"crackthresholdtwo", &gasmaskcrackthresholdtwo );
    utility::registersharedfunc( #"gasmask", #"hash_cc0d1013d30337b6", &function_c286ecb6979d89c );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xa39d93fd, Offset: 0x40ad
// Size: 0x3e
function health_init()
{
    utility::registersharedfunc( #"playerhealth", #"hash_edc16c12ca11400", &playerhealth::function_fd91e6d94cab77e7 );
    utility::registersharedfunc( #"playerhealth", #"hash_325a50f0cddc1ff", &playerhealth::function_b1fb4d148779580e );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0
// Checksum 0xcedcf18c, Offset: 0x40f3
// Size: 0x1b8
function autotests_init()
{
    utility::registersharedfunc( #"bots", #"botsetstance", &botsetstance );
    utility::registersharedfunc( #"bots", #"botpressbutton", &botpressbutton );
    utility::registersharedfunc( #"bots", #"botsetflag", &botsetflag );
    utility::registersharedfunc( #"bots", #"botsetscriptmove", &botsetscriptmove );
    utility::registersharedfunc( #"killstreak", #"equipkillstreak", &killstreaks::equipkillstreak );
    utility::registersharedfunc( #"killstreak", #"getequippedkillstreakslotbyname", &killstreaks::getequippedkillstreakslotbyname );
    utility::registersharedfunc( #"killstreak", #"getkillstreakinslot", &killstreaks::getkillstreakinslot );
    utility::registersharedfunc( #"killstreak", #"triggerkillstreak", &killstreaks::triggerkillstreak );
    utility::registersharedfunc( #"test", #"buildweapon", &weapon::buildweapon );
    utility::registersharedfunc( #"test", #"getplayerunoid", &getplayerunoid );
    utility::registersharedfunc( #"laststand", #"hash_937909b5e3eb98ab", &laststand::function_7072b516e6cffb7c );
    utility::registersharedfunc( #"laststand", #"hash_cce6b6252122ca0", &laststand::function_a2e03a85015b1897 );
    utility::registersharedfunc( #"laststand", #"hash_937909b5e3eb98ab", &laststand::function_7072b516e6cffb7c );
    utility::registersharedfunc( #"laststand", #"isinlaststand", &player::isinlaststand );
    utility::registersharedfunc( #"hash_f10502ba9a1e39b7", #"dropitem", &dropitem );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0xf1306a73, Offset: 0x42b3
// Size: 0x20
function private script_init()
{
    utility::registersharedfunc( #"script", #"hash_ef833ca514caad4b", &script::function_e1c5c030f026248c );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0xde7dced4, Offset: 0x42db
// Size: 0x5a
function private loot_init()
{
    utility::registersharedfunc( #"loot", #"getlootiteminfofromref", &getlootiteminfofromref );
    utility::registersharedfunc( #"loot", #"hash_ca4103c28ac67fef", &loot::function_f54ecb89dfab8e8c );
    utility::registersharedfunc( #"loot", #"isitembannedbyref", &loot::isitembannedbyref );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0xadaa3240, Offset: 0x433d
// Size: 0x14
function private function_2fbc21ea8098cbcd( set )
{
    self forcenetfieldhighlod( set );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 3, eflags: 0x4
// Checksum 0xa0f446fd, Offset: 0x4359
// Size: 0x28
function private playsoundtoplayer_cp_mp( aliasname, player, srcentity )
{
    self playsoundtoplayer( aliasname, player, srcentity );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 5, eflags: 0x4
// Checksum 0xf23c8685, Offset: 0x4389
// Size: 0x3b
function private function_d918a74b34d5d23( fxid, position, player, forward, up )
{
    return spawnfxforclient( fxid, position, player, forward, up );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0xe7c47d74, Offset: 0x43cd
// Size: 0x8
function private function_2834566d5f04fcb()
{
    self setfxkilldefondelete();
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x5fc3d1a1, Offset: 0x43dd
// Size: 0x14
function private function_5b86372aa279b26b( weapname )
{
    self giveweapon( weapname );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 4, eflags: 0x4
// Checksum 0xe287501e, Offset: 0x43f9
// Size: 0x33
function private function_5dcd2d3a7a266a1( animname, notifystring, animstarttimeseconds, blendtype )
{
    self scriptmodelplayanimdeltamotion( animname, notifystring, animstarttimeseconds, blendtype );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x5f8d062e, Offset: 0x4434
// Size: 0x14
function private function_ac9df9f2a8e033db( set )
{
    self setmissileminimapvisible( set );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x70f05ce3, Offset: 0x4450
// Size: 0x14
function private function_519a796719d62198( iconname )
{
    self setmissileimpactminimapicon( iconname );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x416da812, Offset: 0x446c
// Size: 0x22
function private function_e13d0af3e40e5a30( ison )
{
    if ( ison )
    {
        white_phosphorus::enableloopingcoughaudiosupression();
        return;
    }
    
    white_phosphorus::disableloopingcoughaudiosupression();
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x88e23ce, Offset: 0x4496
// Size: 0x2a
function private gasmaskplayequipgesture( ison )
{
    if ( ison )
    {
        self forceplaygestureviewmodel( "ges_visor_down" );
        return;
    }
    
    self forceplaygestureviewmodel( "ges_visor_up" );
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0xed0ef152, Offset: 0x44c8
// Size: 0x23, Type: bool
function private gasmaskiscrackenabled()
{
    return isdefined( level.gametypebundle ) && level.gametypebundle.var_7c3cdc5f1a8fb090;
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0x4278b437, Offset: 0x44f4
// Size: 0x15
function private gasmaskcrackthresholdone()
{
    return level.gametypebundle.gasmaskcrackthresholdone;
}

// Namespace namespace_c1ad58c9f2d22230
// Params 0, eflags: 0x4
// Checksum 0x4278b437, Offset: 0x4512
// Size: 0x15
function private gasmaskcrackthresholdtwo()
{
    return level.gametypebundle.gasmaskcrackthresholdtwo;
}

// Namespace namespace_c1ad58c9f2d22230
// Params 1, eflags: 0x4
// Checksum 0x31dbe5a, Offset: 0x4530
// Size: 0x22
function private function_c286ecb6979d89c( var_c08cfbfa9f0c5482 )
{
    if ( var_c08cfbfa9f0c5482 )
    {
        operator::function_89e5e91ee0fb0836();
        return;
    }
    
    operator::setgendersoundcontext();
}

