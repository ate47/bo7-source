#using script_2bf5529af94c9a0;
#using script_56e2519a4d33f9a2;
#using script_5e0cc00f069082d4;
#using script_629fd7d4479d556d;
#using script_6995a3eb7d571a9f;
#using script_6b56b541550363b5;
#using script_7f269af2f05b8a3c;
#using scripts\common\utility;
#using scripts\mp\damage;
#using scripts\mp\gameobjects;
#using scripts\mp\hud_message;

#namespace sentry_gun_mp;

// Namespace sentry_gun_mp
// Params 0
// Checksum 0x22ea74e4, Offset: 0x207
// Size: 0x123
function init()
{
    killstreaks::registerkillstreak( "sentry_gun", &sentry_gun::tryusesentryturretfromstruct );
    utility::registersharedfunc( #"sentry_gun", #"monitordamage", &sentryturret_monitordamage, 1 );
    utility::registersharedfunc( #"sentry_gun", #"createhintobject", &sentryturret_createhintobject );
    utility::registersharedfunc( #"sentry_gun", #"gettargetmarker", &sentryturret_gettargetmarker );
    utility::registersharedfunc( #"sentry_gun", #"initsentrysettings", &sentryturret_initsentrysettings );
    utility::registersharedfunc( #"sentry_gun", #"allowpickupofturret", &sentryturret_canpickup );
    utility::registersharedfunc( #"sentry_gun", #"handlemovingplatform", &manual_turret_mp::manual_turret_handlemovingplatform );
    utility::registersharedfunc( #"sentry_gun", #"empstarted", &sentryturret_empstarted );
    utility::registersharedfunc( #"sentry_gun", #"empcleared", &sentryturret_empcleared );
    utility::registersharedfunc( #"sentry_gun", #"attachxrays", &sentryturret_attachxrays );
}

// Namespace sentry_gun_mp
// Params 2
// Checksum 0x5b455dff, Offset: 0x332
// Size: 0x30
function sentryturret_gettargetmarker( streakinfo, ignorecancel )
{
    assert( isplayer( self ), "<dev string:x24>" );
    return target_marker::gettargetmarker( streakinfo, ignorecancel );
}

// Namespace sentry_gun_mp
// Params 11
// Checksum 0x23278775, Offset: 0x36b
// Size: 0x7b
function sentryturret_createhintobject( hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov )
{
    return gameobjects::createhintobject( hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov );
}

// Namespace sentry_gun_mp
// Params 1
// Checksum 0x6a359df1, Offset: 0x3ef
// Size: 0x50
function sentryturret_monitordamage( turret )
{
    assert( isplayer( self ), "<dev string:x24>" );
    turret notify( #"monitordamageend" );
    turret thread damage::monitordamage( turret.maxhealth, "hitequip", &sentryturret_handledeathdamage, &sentryturret_modifydamage, 1 );
}

// Namespace sentry_gun_mp
// Params 1
// Checksum 0x41520722, Offset: 0x447
// Size: 0x129
function sentryturret_handledeathdamage( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    config = level.sentrysettings[ self.turrettype ];
    notifyattacker = damage::onkillstreakkilled( config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash );
    self notify( #"enemy_destroyed_equipment", attacker );
    explosivedamage = 0;
    
    if ( type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH" || type == "MOD_CRUSH" )
    {
        explosivedamage = 1;
    }
    
    self notify( #"kill_turret", explosivedamage, 1 );
}

// Namespace sentry_gun_mp
// Params 1
// Checksum 0x51a3bc35, Offset: 0x578
// Size: 0x1b7
function sentryturret_modifydamage( data )
{
    sentryconfig = level.sentrysettings[ "sentry_turret" ];
    bundle = level.streakglobals.streakbundles[ "sentry_gun" ];
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    
    if ( level.var_deb9d2b3de25799b && utility::issharedfuncdefined( #"killstreak", #"getmodifieddamageusingdamagetuning" ) )
    {
        modifieddamage = self [[ utility::getsharedfunc( #"killstreak", #"getmodifieddamageusingdamagetuning" ) ]]( attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_20cb8f4e47f3353e, data );
    }
    else
    {
        modifieddamage = killstreak::getmodifiedantikillstreakdamage( attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 4, 12, 400 );
    }
    
    if ( !isdefined( self.damagetaken ) )
    {
        self.damagetaken = 0;
    }
    
    if ( isdefined( objweapon ) && objweapon.basename == "throwstar_mp" )
    {
        modifieddamage = 0;
    }
    
    var_9f6142336d9d2052 = self.damagetaken + modifieddamage;
    
    if ( var_9f6142336d9d2052 >= sentryconfig.lowhealth && !self.damagedstate )
    {
        self.damagedstate = 1;
        self setscriptablepartstate( "turret_damage", "on", 0 );
    }
    
    return modifieddamage;
}

// Namespace sentry_gun_mp
// Params 0
// Checksum 0x63966fb4, Offset: 0x738
// Size: 0x562
function sentryturret_initsentrysettings()
{
    bundle = level.streakglobals.streakbundles[ "sentry_gun" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    assert( isdefined( bundle.maxhealth ) );
    assert( isdefined( bundle.sentrylowhealth ) );
    assert( isdefined( bundle.spawnweapon ) );
    level.sentrysettings[ "sentry_turret" ] = spawnstruct();
    level.sentrysettings[ "sentry_turret" ].health = 999999;
    level.sentrysettings[ "sentry_turret" ].maxhealth = bundle.maxhealth ?? 650;
    level.sentrysettings[ "sentry_turret" ].lowhealth = bundle.sentrylowhealth ?? level.sentrysettings[ "sentry_turret" ].maxhealth * 0.5;
    level.sentrysettings[ "sentry_turret" ].burstmin = 35;
    level.sentrysettings[ "sentry_turret" ].burstmax = 70;
    level.sentrysettings[ "sentry_turret" ].pausemin = 0.15;
    level.sentrysettings[ "sentry_turret" ].pausemax = 0.25;
    level.sentrysettings[ "sentry_turret" ].lockstrength = 6;
    level.sentrysettings[ "sentry_turret" ].sentrymodeon = "sentry";
    level.sentrysettings[ "sentry_turret" ].sentrymodeoff = "sentry_offline";
    level.sentrysettings[ "sentry_turret" ].timeout = bundle.sentrytimeout ?? 120;
    level.sentrysettings[ "sentry_turret" ].spinuptime = 0.65;
    level.sentrysettings[ "sentry_turret" ].overheattime = 8;
    level.sentrysettings[ "sentry_turret" ].cooldowntime = 0.3;
    level.sentrysettings[ "sentry_turret" ].fxtime = 0.3;
    level.sentrysettings[ "sentry_turret" ].streakname = "sentry_gun";
    level.sentrysettings[ "sentry_turret" ].weaponinfo = bundle.spawnweapon ?? "sentry_turret_mp";
    level.sentrysettings[ "sentry_turret" ].playerweaponinfo = "sentry_turret_mp";
    level.sentrysettings[ "sentry_turret" ].modelbaseground = bundle.sentrymodelbaseground ?? "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings[ "sentry_turret" ].modeldestroyedground = bundle.var_d9bd50c66af5083a ?? "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings[ "sentry_turret" ].var_82765fcc48b457dc = bundle.var_30508d94d8d55a09;
    level.sentrysettings[ "sentry_turret" ].shootturrettag = bundle.var_59750b2550aba598 ?? #"tag_flash";
    level.sentrysettings[ "sentry_turret" ].placementhintstring = &"killstreaks_hints/sentry_gun_place";
    level.sentrysettings[ "sentry_turret" ].ownerusehintstring = &"killstreaks_hints/sentry_use";
    level.sentrysettings[ "sentry_turret" ].otherusehintstring = &"killstreaks_hints/sentry_other_use";
    level.sentrysettings[ "sentry_turret" ].dismantlehintstring = &"killstreaks_hints/sentry_dismantle";
    level.sentrysettings[ "sentry_turret" ].headicon = 1;
    level.sentrysettings[ "sentry_turret" ].teamsplash = "used_sentry_gun";
    level.sentrysettings[ "sentry_turret" ].destroyedsplash = "callout_destroyed_sentry_gun";
    level.sentrysettings[ "sentry_turret" ].shouldsplash = 1;
    level.sentrysettings[ "sentry_turret" ].votimeout = "sentry_gun_teamleader_crash";
    level.sentrysettings[ "sentry_turret" ].vodestroyed = "sentry_gun_teamleader_crash";
    level.sentrysettings[ "sentry_turret" ].scorepopup = "destroyed_sentry";
    level.sentrysettings[ "sentry_turret" ].lightfxtag = "tag_fx";
    level.sentrysettings[ "sentry_turret" ].iskillstreak = 1;
    level.sentrysettings[ "sentry_turret" ].headiconoffset = ( 0, 0, 75 );
}

// Namespace sentry_gun_mp
// Params 0
// Checksum 0x6c151d3c, Offset: 0xca2
// Size: 0x70, Type: bool
function sentryturret_canpickup()
{
    if ( inventory_utility::isanymonitoredweaponswitchinprogress() )
    {
        return false;
    }
    
    if ( killstreak_utility::iskillstreakdeployweapon( self getcurrentweapon() ) )
    {
        return false;
    }
    
    if ( self.isjuggernaut )
    {
        hud_message::showerrormessage( %"killstreaks/jugg_cannot_be_picked_up" );
        return false;
    }
    
    if ( self isswimming() )
    {
        hud_message::showerrormessage( %"killstreaks/cannot_be_picked_up_water" );
        return false;
    }
    
    if ( !self isonground() )
    {
        return false;
    }
    
    if ( self.oob )
    {
        return false;
    }
    
    return true;
}

// Namespace sentry_gun_mp
// Params 0
// Checksum 0x6234fa13, Offset: 0xd1b
// Size: 0x13
function sentryturret_empstarted()
{
    self setscriptablepartstate( "empd", "active", 0 );
}

// Namespace sentry_gun_mp
// Params 0
// Checksum 0xb6f4ddda, Offset: 0xd36
// Size: 0x13
function sentryturret_empcleared()
{
    self setscriptablepartstate( "empd", "neutral", 0 );
}

// Namespace sentry_gun_mp
// Params 1
// Checksum 0x77c8edbc, Offset: 0xd51
// Size: 0x22
function sentryturret_attachxrays( turret )
{
    turret setentityhudoutlinedata( 3, turret.team );
    return turret;
}

