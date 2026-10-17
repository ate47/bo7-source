#using script_6995a3eb7d571a9f;

#namespace remoteturret;

// Namespace remoteturret
// Params 0, eflags: 0x1
// Checksum 0x3b88b925, Offset: 0x214
// Size: 0x34
function autoexec loadfx()
{
    level._effect[ "sentry_explode_mp" ] = loadfxasset( "vfx_core_mp_strk_sentry_gun_explo" );
    level._effect[ "sentry_smoke_mp" ] = loadfxasset( "vfx_core_mp_strk_sg_damage_blacksmoke" );
}

// Namespace remoteturret
// Params 0
// Checksum 0xa8a96a62, Offset: 0x250
// Size: 0x304
function init()
{
    level.turrettype = [];
    level.turrettype[ "mg_turret" ] = "remote_mg_turret";
    killstreaks::registerkillstreak( "remote_mg_turret", &tryuseremotemgturret );
    level.turretsettings = [];
    level.turretsettings[ "mg_turret" ] = spawnstruct();
    level.turretsettings[ "mg_turret" ].sentrymodeon = "manual";
    level.turretsettings[ "mg_turret" ].sentrymodeoff = "sentry_offline";
    level.turretsettings[ "mg_turret" ].timeout = 60;
    level.turretsettings[ "mg_turret" ].health = 999999;
    level.turretsettings[ "mg_turret" ].maxhealth = 1000;
    level.turretsettings[ "mg_turret" ].streakname = "remote_mg_turret";
    level.turretsettings[ "mg_turret" ].weaponinfo = "remote_turret_mp";
    level.turretsettings[ "mg_turret" ].modelbase = "mp_remote_turret";
    level.turretsettings[ "mg_turret" ].modelplacement = "mp_remote_turret_placement";
    level.turretsettings[ "mg_turret" ].modelplacementfailed = "mp_remote_turret_placement_failed";
    level.turretsettings[ "mg_turret" ].modeldestroyed = "mp_remote_turret";
    level.turretsettings[ "mg_turret" ].teamsplash = "used_remote_mg_turret";
    level.turretsettings[ "mg_turret" ].hintenter = &"killstreaks_enter_remote_turret";
    level.turretsettings[ "mg_turret" ].hintexit = &"killstreaks/early_exit";
    level.turretsettings[ "mg_turret" ].hintpickup = &"killstreaks_double_tap_to_carry";
    level.turretsettings[ "mg_turret" ].placestring = &"killstreaks_turret_place";
    level.turretsettings[ "mg_turret" ].cannotplacestring = &"killstreaks_turret_cannot_place";
    level.turretsettings[ "mg_turret" ].vodestroyed = "remote_sentry_destroyed";
    level.turretsettings[ "mg_turret" ].laptopinfo = "killstreak_remote_turret_laptop_mp";
    level.turretsettings[ "mg_turret" ].remoteinfo = "killstreak_remote_turret_remote_mp";
    
    /#
        setdevdvarifuninitialized( @"scr_remote_turret_timeout", 60 );
        setdevdvarifuninitialized( @"scr_remote_turret_scalar", 100 );
        setdevdvarifuninitialized( @"hash_11c4cbf36415fa0e", 10 );
    #/
}

// Namespace remoteturret
// Params 2
// Checksum 0x21462f0e, Offset: 0x55c
// Size: 0x15
function tryuseremotemgturret( lifeid, streakname )
{
    
}

