#using script_21a04df18edbd7c9;
#using script_31ee2a173f3499b7;
#using script_353e34c229ca1589;
#using script_76a9469bdb2c8bb1;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\gametypes\common;
#using scripts\mp\spawnlogic;
#using scripts\mp\zm\globallogic;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_main;
#using scripts\mp\zm\ztron\ztron_save;

#namespace zm_ztron;

// Namespace zm_ztron
// Params 0
// Checksum 0x7e040d94, Offset: 0x9c
// Size: 0x132
function main()
{
    level.callbackstartgametype = &void;
    level.callbackplayeractive = &void;
    level.callbackplayerconnect = &void;
    level.callbackplayerdisconnect = &void;
    level.callbackplayerkilled = &void;
    level.callbackplayerlaststand = &void;
    level.callbackplayermigrated = &void;
    level.var_16eab40d8f2ae445 = &void;
    level lui_game_event_aggregator::registeronluieventcallback( &luinotifylistener );
    setdvar( @"hash_607f3a4f730abeab", 1 );
    globallogic::init();
    globallogic::setupcallbacks();
    level.defaultcallbackplayerdamage = level.callbackplayerdamage;
    level.var_55bbdddfcf3fe14c = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &function_808cee2765a12558;
    level.initializematchrules = &initializematchrules;
    level.var_7a6587ea21b92883 = &setdefaultjiprules;
    [[ level.initializematchrules ]]();
    level thread game_utility_mp::reinitializematchrulesonmigration();
    common::updatecommongametypedvars();
    ztron_main::init();
    level ztron_ui::init_ztron_ui();
    level.noweaponsonstart = 1;
    level.var_5297cc84d8e87d08 = 1;
}

// Namespace zm_ztron
// Params 0
// Checksum 0x40d53a4e, Offset: 0x1d6
// Size: 0x12
function function_5008410667c78fbc()
{
    system::ignore( #"zm_save" );
}

// Namespace zm_ztron
// Params 0
// Checksum 0x179f802b, Offset: 0x1f0
// Size: 0x2
function void()
{
    
}

// Namespace zm_ztron
// Params 2
// Checksum 0xa8a5cf27, Offset: 0x1fa
// Size: 0x2c
function luinotifylistener( notification, value )
{
    if ( notification === "versus_done" )
    {
        utility::flag_set( "loading_screen_over" );
    }
}

// Namespace zm_ztron
// Params 0
// Checksum 0xbff2b460, Offset: 0x22e
// Size: 0x11
function onstartgametype()
{
    ztron_main::game_reset();
    level thread ztron_save::try_restore_from_cloud_save();
}

// Namespace zm_ztron
// Params 0
// Checksum 0x87634053, Offset: 0x247
// Size: 0x9
function initializematchrules()
{
    game_utility_mp::setcommonrulesfrommatchrulesdata();
}

// Namespace zm_ztron
// Params 0
// Checksum 0x9434da60, Offset: 0x258
// Size: 0x27
function setdefaultjiprules()
{
    setnojipscore( 0 );
    setnojiptime( 0 );
    setdvar( @"hash_925f7dceb8e6205e", 1 );
    rejoin_utility::function_bf028e9e4a180ae7( 1 );
}

// Namespace zm_ztron
// Params 0, eflags: 0x4
// Checksum 0xa7ee445e, Offset: 0x287
// Size: 0xa4
function private function_808cee2765a12558()
{
    playerstarts = function_ed4923c727c6864b();
    spawnpointindex = int( clamp( self.sessionuimemberindex, 0, playerstarts.size ) );
    playerstart = playerstarts[ spawnpointindex ];
    spawnpoint = spawnstruct();
    spawnpoint.origin = playerstart.origin;
    spawnpoint.angles = playerstart.angles;
    spawnpoint.index = spawnpointindex;
    spawnpoint.isdynamicspawn = 1;
    spawnpoint spawnlogic::spawnpointinit();
    return spawnpoint;
}

// Namespace zm_ztron
// Params 0
// Checksum 0xa3486443, Offset: 0x334
// Size: 0xbb, Type: bool
function function_ed4923c727c6864b()
{
    worldstate = ztron_main::function_4da200e9b8d58a3c();
    playerstarts = undefined;
    
    if ( worldstate == 1 )
    {
        playerstarts = ztron_arena::function_f689226c25e1df4e();
    }
    else if ( worldstate == 3 )
    {
        room = level.ztron.var_8a9067aa4cd65369;
        playerstarts = room.playersstarts;
    }
    else if ( worldstate == 5 )
    {
        slayer = level.ztron.slayer.active_arena;
        playerstarts = slayer.playerspawns;
    }
    
    return playerstarts ?? level.ztron.var_2b1f629006f6468b;
}

