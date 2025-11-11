// file .... ddl\sat\zm\sat_zm_combatrecord.ddl

version 1 {
    // enums ..... 11 (0xb)
    // structs ... 30 (0x1e)
    // bit size .. 2356440 (0x23f4d8)
    // byte size . 294555 (0x47e9b)
    // archive ... hash_ea01436ea512b475

    // bitSize: 0x40, members: 2
    struct ZmGlobalMatchStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int timeplayedtotal;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0xa0, members: 5
    struct ZmBestStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int killsinamatch;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int xpinamatch;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int highestround;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int deathsinamatch;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int exfils;
    };

    // bitSize: 0x640, members: 1
    struct ZmStatMap {
        // offset: 0x0, bitSize: 0x640(0xc8 Byte(s)), array:0xa(hti:0x6)
        ZmBestStats modestats[ZmStatGameMode];
    };

    // bitSize: 0x80, members: 4
    struct ZtronPlayerStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_5180153f6fc3b707;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int highestround;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int highestscore;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_b1b37f7116e836d8;
    };

    // bitSize: 0x1, members: 1
    struct ZtronPlayerFTUEStats {
        // offset: 0x0, bitSize: 0x1
        bool hash_fb1c8a63f33f31ed;
    };

    // bitSize: 0x7a8, members: 6
    struct ZmPlayerStats {
        // offset: 0x0, bitSize: 0x80(0x10 Byte(s))
        ZtronPlayerStats ztronplayerstats;
        // offset: 0x80, bitSize: 0x640(0xc8 Byte(s)), array:0x1(hti:0x5)
        ZmStatMap mapstats[MapList];
        // offset: 0x6c0, bitSize: 0xa0(0x14 Byte(s))
        ZmBestStats beststats;
        // offset: 0x760, bitSize: 0x40(0x8 Byte(s))
        ZmGlobalMatchStats matchstats;
        // offset: 0x7a0, bitSize: 0x1
        ZtronPlayerFTUEStats ztronplayerftuestats;
    };

    // bitSize: 0x1f8, members: 19
    struct ZMWeaponStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint gibs;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        ZMWeaponClass class;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        uint highestmultikill;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint specialzombieeliminations;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        uint bosseliminations;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        uint specialzombiekills;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        uint criticalkills;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint elitezombiekills;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint legendaryrarityeliminations;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        uint multikills;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint bosskills;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        float criticalkillpct;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        uint papeliminations;
        // offset: 0x1c8, bitSize: 0x20(0x4 Byte(s))
        uint elitezombieeliminations;
        // offset: 0x1e8, bitSize: 0x8(0x1 Byte(s))
        Weapon weapon;
        // offset: 0x1f0, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x9990, members: 1
    struct ZMAllWeaponStats {
        // offset: 0x0, bitSize: 0x9990(0x1332 Byte(s)), array:0x4e(hti:0x0)
        ZMWeaponStats weaponstats[Weapon];
    };

    // bitSize: 0x1b0, members: 16
    struct ZMEquipmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint stunassists;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        SatEquipment equipment;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint multikills;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        uint electrocutedandkilled;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        int gasassists;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        uint distractedandkilled;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        uint pullassists;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint killsafteruse;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint distractionassists;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int maxkillsperuse;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint stunnedandkilled;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        uint electrocuteassists;
        // offset: 0x1a8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x9b40, members: 1
    struct ZMAllEquipmentStats {
        // offset: 0x0, bitSize: 0x9b40(0x1368 Byte(s)), array:0x5c(hti:0x1)
        ZMEquipmentStats equipmentstats[SatEquipment];
    };

    // bitSize: 0x1b0, members: 16
    struct ZMFieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatSuper super;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        uint highestmultikill;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint enemiesfrozen;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        uint revives;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        uint killswhileactive;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        int slowassist;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        int killswhileslowed;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint reviveswhileshrouded;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        float tauntsperuse;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        uint highestelectrocutionsperuse;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint taunts;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        int misterpeeks;
        // offset: 0x1a8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x10230, members: 1
    struct ZMAllFieldUpgradeStats {
        // offset: 0x0, bitSize: 0x10230(0x2046 Byte(s)), array:0x99(hti:0x3)
        ZMFieldUpgradeStats fieldupgradestats[SatSuper];
    };

    // bitSize: 0x90, members: 7
    struct ZMScorestreakStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int highestkillsperuse;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float killsusesratio;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        SatKillstreak killstreak;
        // offset: 0x88, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x1dd0, members: 1
    struct ZMAllScorestreakStats {
        // offset: 0x0, bitSize: 0x1dd0(0x3ba Byte(s)), array:0x35(hti:0x2)
        ZMScorestreakStats killstreakstats[SatKillstreak];
    };

    // bitSize: 0x190, members: 15
    struct ZMPerkStats {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        ZMPerk perk;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        int uses;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        uint critical_kills;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        int wispkills;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        uint specialzombiekills;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        uint elitezombiekills;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        uint highestcriticaldamage;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        uint revives;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint multikills;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        int killswhileactive;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int timeactiveseconds;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint meleekills;
        // offset: 0x188, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x1770, members: 1
    struct ZMAllPerkStats {
        // offset: 0x0, bitSize: 0x1770(0x2ee Byte(s)), array:0xf(hti:0x7)
        ZMPerkStats perkstats[ZMPerk];
    };

    // bitSize: 0x130, members: 12
    struct ZMAmmoModStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int healthhealed;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint zombieselectrocuted;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int specialzombiekills;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint highestkillswithbrainrotzombie;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int elitezombiekills;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        uint multikills;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        uint zombiesignited;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        SatZMAmmoMod ammomod;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint zombiesfrozen;
        // offset: 0x128, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0xab0, members: 1
    struct ZMAllAmmoModStats {
        // offset: 0x0, bitSize: 0xab0(0x156 Byte(s)), array:0x9(hti:0x8)
        ZMAmmoModStats ammomodstats[SatZMAmmoMod];
    };

    // bitSize: 0x70, members: 6
    struct ZMAugmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int majoraugmentsunlocked;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint timeactiveseconds;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatZMAugment augment;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        int minoraugmentsunlocked;
        // offset: 0x68, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x6660, members: 1
    struct ZMAllAugmentStats {
        // offset: 0x0, bitSize: 0x6660(0xccc Byte(s)), array:0xea(hti:0x9)
        ZMAugmentStats augmentstats[SatZMAugment];
    };

    // bitSize: 0xb0, members: 8
    struct ZMDeadliestWeapon {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint criticalkills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint paplevel;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint eliminationspap;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint rarity;
        // offset: 0xa0, bitSize: 0x8(0x1 Byte(s))
        Weapon weapon;
        // offset: 0xa8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x30, members: 4
    struct ZMTopWeapon {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        Weapon weapon;
        // offset: 0x28, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x48, members: 5
    struct ZMTopMap {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint highestexfil;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint highestroundscompleted;
        // offset: 0x40, bitSize: 0x1
        MapList map;
        // offset: 0x41, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x200, members: 13
    struct ZMCareer {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint timeplayedsec;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint criticalkills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint highestexfil;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint noncriticalkills;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        uint highesteliminations;
        // offset: 0xc0, bitSize: 0x48(0x9 Byte(s))
        ZMTopMap zmtopmap;
        // offset: 0x108, bitSize: 0x90(0x12 Byte(s)), array:0x3(hti:0xffff)
        ZMTopWeapon zmtopweapons[3];
        // offset: 0x198, bitSize: 0x20(0x4 Byte(s))
        uint exfils;
        // offset: 0x1b8, bitSize: 0x20(0x4 Byte(s))
        uint eliminated;
        // offset: 0x1d8, bitSize: 0x20(0x4 Byte(s))
        uint gamesplayed;
        // offset: 0x1f8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x2e0, members: 22
    struct ZMRecentMatch {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint matchdurationsec;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint bosseliminations;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint criticalkills;
        // offset: 0x80, bitSize: 0x40(0x8 Byte(s))
        uint64 matchid;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        uint revives;
        // offset: 0xe0, bitSize: 0xb0(0x16 Byte(s))
        ZMDeadliestWeapon dweapon;
        // offset: 0x190, bitSize: 0x20(0x4 Byte(s))
        uint doorbuys;
        // offset: 0x1b0, bitSize: 0x20(0x4 Byte(s))
        uint roundscompleted;
        // offset: 0x1d0, bitSize: 0x40(0x8 Byte(s))
        uint64 matchtsmsec;
        // offset: 0x210, bitSize: 0x20(0x4 Byte(s))
        uint salvage;
        // offset: 0x230, bitSize: 0x20(0x4 Byte(s))
        uint eliteeliminations;
        // offset: 0x250, bitSize: 0x8(0x1 Byte(s))
        ZmStatGameMode gametype;
        // offset: 0x258, bitSize: 0x20(0x4 Byte(s))
        uint essence;
        // offset: 0x278, bitSize: 0x20(0x4 Byte(s))
        uint exfils;
        // offset: 0x298, bitSize: 0x20(0x4 Byte(s))
        uint specialeliminations;
        // offset: 0x2b8, bitSize: 0x20(0x4 Byte(s))
        uint qualifiedexfils;
        // offset: 0x2d8, bitSize: 0x1
        MapList map;
        // offset: 0x2d9, bitSize: 0x1
        bool valid;
        // offset: 0x2da, bitSize: 0x1
        bool reachedmatchend;
        // offset: 0x2db, bitSize: 0x1
        bool issolo;
    };

    // bitSize: 0x168, members: 12
    struct ZMGameModeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint timeplayedsec;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint highestexfil;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint highestessenceearned;
        // offset: 0x60, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_27ffb1b8dbc8d9ee;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float avgeliminations;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float avgexfil;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        uint highesteliminations;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float avgroundscompleted;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        uint highestroundscompleted;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        uint gamesplayed;
        // offset: 0x160, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x170, members: 4
    struct ZMGameModeMapStats {
        // offset: 0x0, bitSize: 0x168(0x2d Byte(s))
        ZMGameModeStats stats;
        // offset: 0x168, bitSize: 0x1
        MapList map;
        // offset: 0x169, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x2e8, members: 5
    struct ZMGameModeAllMapsStats {
        // offset: 0x0, bitSize: 0x170(0x2e Byte(s)), array:0x1(hti:0x5)
        ZMGameModeMapStats maps[MapList];
        // offset: 0x170, bitSize: 0x8(0x1 Byte(s))
        ZmStatGameMode mode;
        // offset: 0x178, bitSize: 0x168(0x2d Byte(s))
        ZMGameModeStats stats;
        // offset: 0x2e0, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x1d10, members: 1
    struct ZMAllGameModesStats {
        // offset: 0x0, bitSize: 0x1d10(0x3a2 Byte(s)), array:0xa(hti:0x6)
        ZMGameModeAllMapsStats gamemodestats[ZmStatGameMode];
    };

    // idx 0x0 members: 0x4e type: 5
    enum Weapon {
        none, // 0x0
        iw9_knifestab, // 0x1
        iw9_lm_dblmg_jup, // 0x2
        iw9_me_climbfists, // 0x3
        iw9_me_diveknife, // 0x4
        iw9_me_fists, // 0x5
        iw9_swimfists, // 0x6
        jup_ar_dg2, // 0x7
        jup_la_plasmagun, // 0x8
        sat_ar_condor, // 0x9
        sat_ar_eagle, // 0xa
        sat_ar_hawk, // 0xb
        sat_dm_scotia, // 0xc
        sat_la_mutant_injection_cannon, // 0xd
        sat_la_polis, // 0xe
        sat_la_zm_dinj, // 0xf
        sat_lm_hades, // 0x10
        sat_me_shockbaton, // 0x11
        sat_me_zombie_melee, // 0x12
        sat_mp_assaultshield, // 0x13
        sat_mp_black_hat, // 0x14
        sat_pi_atlas, // 0x15
        sat_pi_timir, // 0x16
        sat_sh_corso, // 0x17
        sat_sh_husky, // 0x18
        sat_sm_komodo, // 0x19
        sat_sm_orca, // 0x1a
        sat_sm_zebra, // 0x1b
        sat_sn_baltic, // 0x1c
        sat_sn_drake, // 0x1d
        t10_ar_p01_coslo723, // 0x1e
        t10_ar_p02_aking74, // 0x1f
        t10_ar_p04_clove, // 0x20
        t10_ar_p05_rmary2, // 0x21
        t10_ar_p06_asvalor, // 0x22
        t10_ar_p22_able18, // 0x23
        t10_ar_p23_love85, // 0x24
        t10_dm_p01_sroger25, // 0x25
        t10_dm_p02_aeasy, // 0x26
        t10_dm_p03_sgeorge550, // 0x27
        t10_dm_p05_falove, // 0x28
        t10_dm_p09_svalor, // 0x29
        t10_ks_warmachine, // 0x2a
        t10_la_mangler_cannon, // 0x2b
        t10_la_p17_pable3, // 0x2c
        t10_la_p18_stisaac, // 0x2d
        t10_la_p19_opalww, // 0x2e
        t10_lm_dblmg_deathmachine, // 0x2f
        t10_lm_p01_aroger10, // 0x30
        t10_lm_p02_puncle21, // 0x31
        t10_lm_p07_ksugar58, // 0x32
        t10_lm_p19_jetgun, // 0x33
        t10_lm_p25_drillgun, // 0x34
        t10_me_fists, // 0x35
        t10_me_p15_knife, // 0x36
        t10_me_p16_bat, // 0x37
        t10_me_zombie_hellhound, // 0x38
        t10_me_zombie_melee, // 0x39
        t10_me_zombie_mimic, // 0x3a
        t10_me_zombiefists, // 0x3b
        t10_pi_p12_paris30, // 0x3c
        t10_pi_p13_usugar9, // 0x3d
        t10_pi_p14_mable, // 0x3e
        t10_pi_p14_stiger, // 0x3f
        t10_pi_p19_raygun, // 0x40
        t10_pi_p19_raygunmark2, // 0x41
        t10_sh_p10_moslo500, // 0x42
        t10_sh_p25_uncle12, // 0x43
        t10_sm_p02_geasy9, // 0x44
        t10_sm_p03_safox, // 0x45
        t10_sm_p04_chuck9, // 0x46
        t10_sm_p06_sroger3, // 0x47
        t10_sm_p12_roger31, // 0x48
        t10_sm_p21_pparis90, // 0x49
        t10_sn_p08_ultiger, // 0x4a
        t10_sn_p09_droger, // 0x4b
        t10_sn_p24_love96, // 0x4c
        t10_me_climbfists // 0x4d
    };

    // idx 0x1 members: 0x5c type: 5
    enum SatEquipment {
        equip_adrenaline, // 0x0
        equip_advanced_supply_drop, // 0x1
        equip_aether_blade, // 0x2
        equip_aethercounter, // 0x3
        equip_armor_onehanded, // 0x4
        equip_armor_onehanded_quick, // 0x5
        equip_armorbox, // 0x6
        equip_armorplate, // 0x7
        equip_assault_pack, // 0x8
        equip_at_mine, // 0x9
        equip_blackhole_bomb, // 0xa
        equip_bunkerbuster, // 0xb
        equip_bunkerbuster_gl, // 0xc
        equip_c4, // 0xd
        equip_claymore, // 0xe
        equip_cluster_grenade, // 0xf
        equip_combat_hologram, // 0x10
        equip_combataxe, // 0x11
        equip_concussion, // 0x12
        equip_dart_mark_zero, // 0x13
        equip_decon_station, // 0x14
        equip_decoy, // 0x15
        equip_decryption_device, // 0x16
        equip_deployable_kiosk_drop, // 0x17
        equip_drone_launcher, // 0x18
        equip_emp, // 0x19
        equip_flash, // 0x1a
        equip_frag, // 0x1b
        equip_gas_grenade, // 0x1c
        equip_gas_trap_plantable, // 0x1d
        equip_geigercounter, // 0x1e
        equip_grappling_hook, // 0x1f
        equip_hb_sensor, // 0x20
        equip_ied, // 0x21
        equip_impact_grenade, // 0x22
        equip_inc_dark, // 0x23
        equip_inc_earth, // 0x24
        equip_inc_electric, // 0x25
        equip_inc_fire, // 0x26
        equip_inc_light, // 0x27
        equip_inhibitor, // 0x28
        equip_jammer, // 0x29
        equip_landmine, // 0x2a
        equip_mini_sentry, // 0x2b
        equip_molotov, // 0x2c
        equip_monkey_bomb, // 0x2d
        equip_munitionsbox, // 0x2e
        equip_pop_candy, // 0x2f
        equip_proximity_alarm, // 0x30
        equip_rallying_cry, // 0x31
        equip_recondrone, // 0x32
        equip_redeploy_drone_beacon, // 0x33
        equip_reinforcement_flare, // 0x34
        equip_rock, // 0x35
        equip_semtex, // 0x36
        equip_semtex_mike32_v5008, // 0x37
        equip_sensor_grenade, // 0x38
        equip_shockstick, // 0x39
        equip_smart_seeker, // 0x3a
        equip_smoke, // 0x3b
        equip_smoke_gl, // 0x3c
        equip_snowball, // 0x3d
        equip_super_aether_shroud, // 0x3e
        equip_super_black_hat, // 0x3f
        equip_super_cradle_gas_grenade, // 0x40
        equip_super_energy_mine, // 0x41
        equip_super_flame_blast, // 0x42
        equip_super_frenzied_guard, // 0x43
        equip_super_frost_blast, // 0x44
        equip_super_grappling_hook, // 0x45
        equip_super_healing_aura, // 0x46
        equip_super_mary_paris, // 0x47
        equip_super_mega_jump, // 0x48
        equip_super_monkey_bomb, // 0x49
        equip_super_overcharge, // 0x4a
        equip_super_portal_summon, // 0x4b
        equip_super_rallying_cry, // 0x4c
        equip_super_redeploy, // 0x4d
        equip_super_survival_life_drain, // 0x4e
        equip_super_teleport, // 0x4f
        equip_super_tesla_storm, // 0x50
        equip_super_toxic_growth, // 0x51
        equip_super_vehicle_summoner, // 0x52
        equip_tac_cover, // 0x53
        equip_tac_insert, // 0x54
        equip_thermite, // 0x55
        equip_thermobaric_grenade, // 0x56
        equip_trophy, // 0x57
        equip_utilitybox, // 0x58
        equip_vacuum_seal_device, // 0x59
        equip_zombie_ranged_attack, // 0x5a
        none // 0x5b
    };

    // idx 0x2 members: 0x35 type: 5
    enum SatKillstreak {
        air_patrol, // 0x0
        airdrop, // 0x1
        airdrop_crate, // 0x2
        airdrop_escort, // 0x3
        airdrop_explosion, // 0x4
        auto_drone, // 0x5
        boba_streak_blue, // 0x6
        boba_streak_cheese, // 0x7
        boba_streak_orange, // 0x8
        boba_streak_purple, // 0x9
        boba_streak_red, // 0xa
        bunker_buster, // 0xb
        chopper_door_gunner, // 0xc
        counter_uav, // 0xd
        dawg, // 0xe
        death_machine_gun, // 0xf
        directional_uav, // 0x10
        drone_formation_swarm, // 0x11
        emp_blast, // 0x12
        gas_strike, // 0x13
        ground_drone_unit, // 0x14
        gunship, // 0x15
        hand_cannon, // 0x16
        hellstorm_missile, // 0x17
        m202_launcher, // 0x18
        machete_attack, // 0x19
        mangler_cannon, // 0x1a
        missile_turret, // 0x1b
        napalm_strike, // 0x1c
        none, // 0x1d
        nuke_multi, // 0x1e
        precision_airstrike, // 0x1f
        radar_ping, // 0x20
        rcxd, // 0x21
        remote_robot, // 0x22
        remote_turret, // 0x23
        scrambler_drone_guard, // 0x24
        sentry_gun, // 0x25
        skewer, // 0x26
        sniper_briefcase, // 0x27
        sniper_drone, // 0x28
        supply_sweep, // 0x29
        switchblade_drone, // 0x2a
        tank_drone, // 0x2b
        toma_strike, // 0x2c
        uav, // 0x2d
        valkyrie_rocket, // 0x2e
        vtol_warship, // 0x2f
        war_machine_launcher, // 0x30
        zm_bernard, // 0x31
        zm_dinj, // 0x32
        zm_minj, // 0x33
        zm_minj_nocannon // 0x34
    };

    // idx 0x3 members: 0x99 type: 5
    enum SatSuper {
        none, // 0x0
        super_acoustic_amp, // 0x1
        super_active_camo, // 0x2
        super_aether_shroud, // 0x3
        super_ammo_drop, // 0x4
        super_annihilator, // 0x5
        super_armor_drop, // 0x6
        super_armory, // 0x7
        super_assault_shield, // 0x8
        super_balloon_extract, // 0x9
        super_battlerage, // 0xa
        super_black_hat, // 0xb
        super_blastshield_drop, // 0xc
        super_blinding_turret, // 0xd
        super_blowtorch, // 0xe
        super_boba, // 0xf
        super_body_cam_hack, // 0x10
        super_br_extract, // 0x11
        super_bradley, // 0x12
        super_bubble_shield, // 0x13
        super_capture_bot, // 0x14
        super_chopper_gunner, // 0x15
        super_combat_hologram, // 0x16
        super_combat_link, // 0x17
        super_comm_scrambler, // 0x18
        super_contract_skipper, // 0x19
        super_cradle_gas_grenade, // 0x1a
        super_cranked, // 0x1b
        super_cruise_predator, // 0x1c
        super_dark_flare, // 0x1d
        super_dark_flare_13s, // 0x1e
        super_dark_flare_shadow_ball, // 0x1f
        super_deadsilence, // 0x20
        super_death_machine, // 0x21
        super_decon_station, // 0x22
        super_defibrillator, // 0x23
        super_deployable_kiosk, // 0x24
        super_deployed_decoy, // 0x25
        super_door_barricade, // 0x26
        super_dragonfly_drone, // 0x27
        super_drone_launcher, // 0x28
        super_electric_discharge, // 0x29
        super_emp_drone, // 0x2a
        super_emp_pulse, // 0x2b
        super_energy_mine, // 0x2c
        super_evg, // 0x2d
        super_flame_blast, // 0x2e
        super_frenzied_guard, // 0x2f
        super_frost_blast, // 0x30
        super_fulton, // 0x31
        super_fulton_marker, // 0x32
        super_gas_trap, // 0x33
        super_grappling_hook, // 0x34
        super_guild_bot, // 0x35
        super_hb_sensor, // 0x36
        super_healing_aura, // 0x37
        super_high_jump, // 0x38
        super_honeypot, // 0x39
        super_jammer, // 0x3a
        super_juggernaut, // 0x3b
        super_kazimir, // 0x3c
        super_la_gromeo, // 0x3d
        super_la_jp22_dromeo, // 0x3e
        super_la_juliet, // 0x3f
        super_la_kgolf, // 0x40
        super_la_mike32, // 0x41
        super_la_rpapa7, // 0x42
        super_landmine, // 0x43
        super_laser_charge, // 0x44
        super_laststand_syringe, // 0x45
        super_leader_drop, // 0x46
        super_loadout_drop, // 0x47
        super_mary_paris, // 0x48
        super_med_box, // 0x49
        super_medical_box, // 0x4a
        super_mega_jump, // 0x4b
        super_melee_jugg, // 0x4c
        super_monkey_bomb, // 0x4d
        super_mutation, // 0x4e
        super_mutation_boba_stim, // 0x4f
        super_mutation_density_dive, // 0x50
        super_mutation_give_density_dive, // 0x51
        super_mutation_give_jump, // 0x52
        super_mutation_jump, // 0x53
        super_mutation_ninja_sense, // 0x54
        super_mutation_ninja_vanish, // 0x55
        super_mutation_shell_shocked, // 0x56
        super_mutation_shuriken_fury, // 0x57
        super_mutation_turtle_power, // 0x58
        super_none, // 0x59
        super_nvg, // 0x5a
        super_overcharge, // 0x5b
        super_oxygen_mask, // 0x5c
        super_oxygenmask, // 0x5d
        super_pac_sentry, // 0x5e
        super_personal_redeploy_drone, // 0x5f
        super_pop_candy, // 0x60
        super_portal_summon, // 0x61
        super_precision_airstrike, // 0x62
        super_pw_antitank, // 0x63
        super_pw_flamethrower, // 0x64
        super_pw_grenade_gun, // 0x65
        super_pw_micro_minigun, // 0x66
        super_rallying_cry, // 0x67
        super_razor_wire, // 0x68
        super_recon_dart, // 0x69
        super_recon_drone, // 0x6a
        super_redeploy, // 0x6b
        super_redeploy_drone_beacon, // 0x6c
        super_reinforcement_flare, // 0x6d
        super_remote_detonate, // 0x6e
        super_rg_testweapon, // 0x6f
        super_riot_shield, // 0x70
        super_sam_airburst_turret, // 0x71
        super_scramble, // 0x72
        super_seismic, // 0x73
        super_select, // 0x74
        super_self_revive_box, // 0x75
        super_shadow_break, // 0x76
        super_smoke_airdrop, // 0x77
        super_smoke_shroud, // 0x78
        super_smoke_wall, // 0x79
        super_sonar_pulse, // 0x7a
        super_sound_veil, // 0x7b
        super_spykit, // 0x7c
        super_squadrage, // 0x7d
        super_stealth_perks, // 0x7e
        super_stimpistol, // 0x7f
        super_supply_drop, // 0x80
        super_support_box, // 0x81
        super_suppression_rounds, // 0x82
        super_survival_life_drain, // 0x83
        super_sweeper_drones, // 0x84
        super_tac_camera, // 0x85
        super_tac_cover, // 0x86
        super_tac_insert, // 0x87
        super_tar_bomb, // 0x88
        super_teleport, // 0x89
        super_teleport_deploy, // 0x8a
        super_temp_v, // 0x8b
        super_tesla_storm, // 0x8c
        super_test, // 0x8d
        super_toma_strike, // 0x8e
        super_toxic_growth, // 0x8f
        super_treasure_hunter, // 0x90
        super_trophy, // 0x91
        super_uav, // 0x92
        super_utility_drop, // 0x93
        super_vehicle_drop, // 0x94
        super_vehicle_summoner, // 0x95
        super_vision_pulse, // 0x96
        super_war_machine, // 0x97
        super_weapon_drop // 0x98
    };

    // idx 0x4 members: 0xc type: 5
    enum TimeScope {
        lifetime, // 0x0
        prestige_1, // 0x1
        prestige_2, // 0x2
        prestige_3, // 0x3
        prestige_4, // 0x4
        prestige_5, // 0x5
        prestige_6, // 0x6
        prestige_7, // 0x7
        prestige_8, // 0x8
        prestige_9, // 0x9
        prestige_10, // 0xa
        prestige_11 // 0xb
    };

    // idx 0x5 members: 0x1 type: c
    enum MapList {
        zm_sat_firefly // 0x0
    };

    // idx 0x6 members: 0xa type: 5
    enum ZmStatGameMode {
        zm_rb, // 0x0
        zm_grief, // 0x1
        zm_guided, // 0x2
        zm_turned, // 0x3
        zm_rb_dead_light, // 0x4
        zm_rb_cranked, // 0x5
        zm_rb_jingle, // 0x6
        zm_panda, // 0x7
        zm_training_course, // 0x8
        zm_rb_survival // 0x9
    };

    // idx 0x7 members: 0xf type: 5
    enum ZMPerk {
        none, // 0x0
        specialty_deadshot, // 0x1
        specialty_death_perception, // 0x2
        specialty_elemental_pop, // 0x3
        specialty_juggernog, // 0x4
        specialty_phd_flopper, // 0x5
        specialty_quickrevive, // 0x6
        specialty_speedcola, // 0x7
        specialty_staminup, // 0x8
        specialty_tombstone, // 0x9
        specialty_m_mod, // 0xa
        specialty_vulture_aid, // 0xb
        specialty_d_mod, // 0xc
        specialty_z_mod, // 0xd
        specialty_w_mod // 0xe
    };

    // idx 0x8 members: 0x9 type: 5
    enum SatZMAmmoMod {
        none, // 0x0
        brainrot, // 0x1
        cryofreeze, // 0x2
        deadwire, // 0x3
        napalmburst, // 0x4
        shatterblast, // 0x5
        shadowvortex, // 0x6
        lightray, // 0x7
        fw_ammomod // 0x8
    };

    // idx 0x9 members: 0xea type: 5
    enum SatZMAugment {
        aether_shroud_aether_dash, // 0x0
        aether_shroud_afterimage, // 0x1
        aether_shroud_extension, // 0x2
        aether_shroud_group_shroud, // 0x3
        aether_shroud_high_capacity, // 0x4
        aether_shroud_otherworldly_reload, // 0x5
        aether_shroud_shadow_blade, // 0x6
        aether_shroud_taken, // 0x7
        brainrot_big_game, // 0x8
        brainrot_bloat, // 0x9
        brainrot_explosive, // 0xa
        brainrot_extension, // 0xb
        brainrot_haste, // 0xc
        brainrot_irradiated, // 0xd
        brainrot_more_damage, // 0xe
        brainrot_plague, // 0xf
        cryofreeze_aoe_proc, // 0x10
        cryofreeze_big_game, // 0x11
        cryofreeze_damage_boost, // 0x12
        cryofreeze_extension, // 0x13
        cryofreeze_focus, // 0x14
        cryofreeze_full_frost, // 0x15
        cryofreeze_ice_cloud, // 0x16
        cryofreeze_post_freeze_damage, // 0x17
        d_mod_double_dealer, // 0x18
        d_mod_double_impact, // 0x19
        d_mod_double_jeopardy, // 0x1a
        d_mod_double_or_nothing, // 0x1b
        d_mod_double_play, // 0x1c
        d_mod_double_standard, // 0x1d
        d_mod_double_time, // 0x1e
        d_mod_low_ammo, // 0x1f
        dark_flare_big_beam, // 0x20
        dark_flare_dark_pact, // 0x21
        dark_flare_extension, // 0x22
        dark_flare_high_capacity, // 0x23
        dark_flare_phantasmal, // 0x24
        dark_flare_shadow_ball, // 0x25
        dark_flare_shadow_burn, // 0x26
        dark_flare_slowdown, // 0x27
        deadshot_critical_efficiency, // 0x28
        deadshot_dead_bounty, // 0x29
        deadshot_dead_heat, // 0x2a
        deadshot_first_strike, // 0x2b
        deadshot_fmj, // 0x2c
        deadshot_gunslinger, // 0x2d
        deadshot_piercing_rounds, // 0x2e
        deadshot_steady, // 0x2f
        deadwire_aftershock, // 0x30
        deadwire_ball_lightning, // 0x31
        deadwire_big_game, // 0x32
        deadwire_chain_lightning, // 0x33
        deadwire_damage_boost, // 0x34
        deadwire_extension, // 0x35
        deadwire_haste, // 0x36
        deadwire_lightning_strike, // 0x37
        deathperception_birds_eye_view, // 0x38
        deathperception_critical_eye, // 0x39
        deathperception_death_stare, // 0x3a
        deathperception_extra_change, // 0x3b
        deathperception_further_insight, // 0x3c
        deathperception_treasure_hunter, // 0x3d
        elemental_pop_advantage, // 0x3e
        elemental_pop_electric_cherry, // 0x3f
        elemental_pop_elemental_equipment, // 0x40
        elemental_pop_elemental_protection, // 0x41
        elemental_pop_more_pop, // 0x42
        elemental_pop_rainbow_pop, // 0x43
        elemental_pop_refresh_mint, // 0x44
        elemental_pop_tuned_frequency, // 0x45
        energy_mine_carousel, // 0x46
        energy_mine_frequency_boost, // 0x47
        energy_mine_high_capacity, // 0x48
        energy_mine_recycle, // 0x49
        energy_mine_scatter_mine, // 0x4a
        energy_mine_siren, // 0x4b
        energy_mine_smart_mine, // 0x4c
        energy_mine_spire, // 0x4d
        frenzied_guard_extension, // 0x4e
        frenzied_guard_fists_of_frenzy, // 0x4f
        frenzied_guard_frenzy_fire, // 0x50
        frenzied_guard_high_defense, // 0x51
        frenzied_guard_phalanx, // 0x52
        frenzied_guard_rally, // 0x53
        frenzied_guard_repair_boost, // 0x54
        frenzied_guard_retribution, // 0x55
        frost_blast_cast, // 0x56
        frost_blast_extension, // 0x57
        frost_blast_flash_freeze, // 0x58
        frost_blast_frostbite, // 0x59
        frost_blast_high_capacity, // 0x5a
        frost_blast_slick, // 0x5b
        frost_blast_slow_extend, // 0x5c
        frost_blast_stone_cold_stronghold, // 0x5d
        fw_big_bang, // 0x5e
        fw_big_game, // 0x5f
        fw_condensed_yield, // 0x60
        fw_farfalle, // 0x61
        fw_fire_wheel, // 0x62
        fw_haste, // 0x63
        fw_starlight, // 0x64
        fw_target_focus, // 0x65
        fw_weeping_willow, // 0x66
        healingaura_bountiful_harvest, // 0x67
        healingaura_inner_strength, // 0x68
        healingaura_keep_perks, // 0x69
        healingaura_necromancer, // 0x6a
        healingaura_pillar_of_light, // 0x6b
        healingaura_protection, // 0x6c
        healingaura_resilience, // 0x6d
        healingaura_stoic_presence, // 0x6e
        juggernog_iron_core, // 0x6f
        juggernog_juggernaut, // 0x70
        juggernog_perfect_counter, // 0x71
        juggernog_reactive_armor, // 0x72
        juggernog_retaliation, // 0x73
        juggernog_thicker_plates, // 0x74
        juggernog_turtle_shell, // 0x75
        juggernog_well_constructed, // 0x76
        lightray_antibiotic, // 0x77
        lightray_big_game, // 0x78
        lightray_booster_shot, // 0x79
        lightray_dual_action, // 0x7a
        lightray_express_remedy, // 0x7b
        lightray_extra_strength, // 0x7c
        lightray_longer_life, // 0x7d
        lightray_mitosis, // 0x7e
        m_mod_backpedal, // 0x7f
        m_mod_closing_argument, // 0x80
        m_mod_faster_melee, // 0x81
        m_mod_hidden_impact, // 0x82
        m_mod_overwhelming_force, // 0x83
        m_mod_panic_knife, // 0x84
        m_mod_pressure_points, // 0x85
        m_mod_vampirism, // 0x86
        mary_paris_apex_hunter, // 0x87
        mary_paris_arcane_fury, // 0x88
        mary_paris_dance_party, // 0x89
        mary_paris_family_discount, // 0x8a
        mary_paris_paris_favor, // 0x8b
        mary_paris_party_animal, // 0x8c
        mary_paris_peek_health, // 0x8d
        mary_paris_social_butterfly, // 0x8e
        napalmburst_backdraft, // 0x8f
        napalmburst_big_game, // 0x90
        napalmburst_contact_burn, // 0x91
        napalmburst_damage_boost, // 0x92
        napalmburst_extension, // 0x93
        napalmburst_incendiary, // 0x94
        napalmburst_petrol, // 0x95
        napalmburst_pyro, // 0x96
        phdflopper_double_whammy, // 0x97
        phdflopper_explosive_fall, // 0x98
        phdflopper_hair_trigger, // 0x99
        phdflopper_safe_slide, // 0x9a
        phdflopper_shove, // 0x9b
        phdflopper_slide_boost, // 0x9c
        phdflopper_slider, // 0x9d
        phdflopper_wall_flopper, // 0x9e
        quick_revive_adrenaline_rush, // 0x9f
        quick_revive_die_hard, // 0xa0
        quick_revive_dying_wish, // 0xa1
        quick_revive_emergency_medical_kit, // 0xa2
        quick_revive_escape_plan, // 0xa3
        quick_revive_last_chance, // 0xa4
        quick_revive_payback, // 0xa5
        quick_revive_precision_surgery, // 0xa6
        shadowvortex_big_game, // 0xa7
        shadowvortex_blackhole, // 0xa8
        shadowvortex_explosive_rain, // 0xa9
        shadowvortex_haste, // 0xaa
        shadowvortex_reload, // 0xab
        shadowvortex_supermassive, // 0xac
        shadowvortex_targeted, // 0xad
        shadowvortex_topple_danger, // 0xae
        shatterblast_big_game, // 0xaf
        shatterblast_blast_boost, // 0xb0
        shatterblast_blast_chain, // 0xb1
        shatterblast_blast_off, // 0xb2
        shatterblast_blast_repair, // 0xb3
        shatterblast_blast_shield, // 0xb4
        shatterblast_blast_wave, // 0xb5
        shatterblast_blast_zone, // 0xb6
        speedcola_classic_formula, // 0xb7
        speedcola_faster_equipment, // 0xb8
        speedcola_faster_field_upgrade, // 0xb9
        speedcola_faster_magicbox, // 0xba
        speedcola_faster_switch, // 0xbb
        speedcola_phantom_reload, // 0xbc
        speedcola_sprint_reload, // 0xbd
        speedcola_stock_reload, // 0xbe
        staminup_endurance, // 0xbf
        staminup_fire_walker, // 0xc0
        staminup_footwork, // 0xc1
        staminup_guns_up, // 0xc2
        staminup_light_footed, // 0xc3
        staminup_multitask, // 0xc4
        staminup_slippery_target, // 0xc5
        staminup_speed_boost, // 0xc6
        staminup_stalker, // 0xc7
        tesla_storm_lithium_charged, // 0xc8
        tesla_storm_overclocked, // 0xc9
        tesla_storm_power_grid, // 0xca
        tesla_storm_sat_major, // 0xcb
        tesla_storm_sat_minor, // 0xcc
        tesla_storm_shockwave, // 0xcd
        tesla_storm_static_discharge, // 0xce
        tesla_storm_transformer, // 0xcf
        toxic_growth_ankle_shredder, // 0xd0
        toxic_growth_cordyception, // 0xd1
        toxic_growth_crescent, // 0xd2
        toxic_growth_extra_charge, // 0xd3
        toxic_growth_green_thumb, // 0xd4
        toxic_growth_pollination, // 0xd5
        vulture_aid_camouflage, // 0xd6
        vulture_aid_carrion_luggage, // 0xd7
        vulture_aid_condors_reach, // 0xd8
        vulture_aid_extra_serving, // 0xd9
        vulture_aid_fetidupgraid, // 0xda
        vulture_aid_parting_gift, // 0xdb
        vulture_aid_picky_eater, // 0xdc
        vulture_aid_replate, // 0xdd
        w_mod_demon_mask, // 0xde
        w_mod_extension, // 0xdf
        w_mod_haste, // 0xe0
        w_mod_lure, // 0xe1
        w_mod_savior, // 0xe2
        w_mod_will_o_wisp, // 0xe3
        z_mod_buy_one_get_one, // 0xe4
        z_mod_free_throw, // 0xe5
        z_mod_fully_equipped, // 0xe6
        z_mod_ol_reliable, // 0xe7
        z_mod_pack_mule, // 0xe8
        z_mod_plate_hunter // 0xe9
    };

    // idx 0xa members: 0xf type: 5
    enum ZMWeaponClass {
        Other, // 0x0
        weapon_assault, // 0x1
        weapon_smg, // 0x2
        weapon_shotgun, // 0x3
        weapon_lmg, // 0x4
        weapon_dmr, // 0x5
        weapon_sniper, // 0x6
        weapon_pistol, // 0x7
        weapon_projectile, // 0x8
        weapon_melee, // 0x9
        weapon_melee2, // 0xa
        weapon_battle, // 0xb
        weapon_active_armory, // 0xc
        weapon_secondary_special, // 0xd
        weapon_wonder // 0xe
    };

    // root: bitSize: 0x23f428, members: 12

    // offset: 0x0, bitSize: 0x165c0(0x2cb8 Byte(s)), array:0xc(hti:0x4)
    ZMAllScorestreakStats killstreakstatslist[TimeScope];
    // offset: 0x165c0, bitSize: 0x732c0(0xe658 Byte(s)), array:0xc(hti:0x4)
    ZMAllWeaponStats weaponstatslist[TimeScope];
    // offset: 0x89880, bitSize: 0x74700(0xe8e0 Byte(s)), array:0xc(hti:0x4)
    ZMAllEquipmentStats equipmentstatslist[TimeScope];
    // offset: 0xfdf80, bitSize: 0xc1a40(0x18348 Byte(s)), array:0xc(hti:0x4)
    ZMAllFieldUpgradeStats fieldupgradestatslist[TimeScope];
    // offset: 0x1bf9c0, bitSize: 0x2e0(0x5c Byte(s))
    ZMRecentMatch lastmatch;
    // offset: 0x1bfca0, bitSize: 0x1800(0x300 Byte(s)), array:0xc(hti:0x4)
    ZMCareer zmcareer[TimeScope];
    // offset: 0x1c14a0, bitSize: 0x15cc0(0x2b98 Byte(s)), array:0xc(hti:0x4)
    ZMAllGameModesStats allgamemodestats[TimeScope];
    // offset: 0x1d7160, bitSize: 0x1cc0(0x398 Byte(s)), array:0xa(hti:0xffff)
    ZMRecentMatch recentmatches[10];
    // offset: 0x1d8e20, bitSize: 0x8040(0x1008 Byte(s)), array:0xc(hti:0x4)
    ZMAllAmmoModStats ammomodstatslist[TimeScope];
    // offset: 0x1e0e60, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
    // offset: 0x1e0e68, bitSize: 0x4cc80(0x9990 Byte(s)), array:0xc(hti:0x4)
    ZMAllAugmentStats augmentstatslist[TimeScope];
    // offset: 0x22dae8, bitSize: 0x11940(0x2328 Byte(s)), array:0xc(hti:0x4)
    ZMAllPerkStats perkstatslist[TimeScope];
};

