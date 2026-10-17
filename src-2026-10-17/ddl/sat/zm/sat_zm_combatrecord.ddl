// file .... ddl\sat\zm\sat_zm_combatrecord.ddl

version 1 {
    // enums ..... 11 (0xb)
    // structs ... 29 (0x1d)
    // bit size .. 4947888 (0x4b7fb0)
    // byte size . 618486 (0x96ff6)
    // archive ... hash_98f62177541ee26a

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

    // bitSize: 0xaa0, members: 1
    struct ZmStatMap {
        // offset: 0x0, bitSize: 0xaa0(0x154 Byte(s)), array:0x11(hti:0x6)
        ZmBestStats modestats[ZmStatGameMode];
    };

    // bitSize: 0x128, members: 18
    struct ZtronPlayerStats {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_9009ef91c08af0ee;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_2ee35735c4c19e1e;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_2d4af68852060478;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        int hash_5180153f6fc3b707;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_5529516cb185e6c8;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int highestround;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int highestscore;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_4041aec2771fe8da;
        // offset: 0x88, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_12a8fa246c6864e2;
        // offset: 0x90, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_bde6e28ad5d4f0a8;
        // offset: 0x98, bitSize: 0x20(0x4 Byte(s))
        int hash_5323fd7b458a613;
        // offset: 0xb8, bitSize: 0x10(0x2 Byte(s))
        uint:16 hash_8f3604e99664ae3a;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        int hash_b1b37f7116e836d8;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_32f9ce0163b4759c;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_e5745f5c8242b41f;
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_8d79105e64a44233;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_213282fe31545fc0;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        int hash_88582d3b6a99d708;
    };

    // bitSize: 0x96c8, members: 4
    struct ZmPlayerStats {
        // offset: 0x0, bitSize: 0x128(0x25 Byte(s))
        ZtronPlayerStats ztronplayerstats;
        // offset: 0x128, bitSize: 0x94c0(0x1298 Byte(s)), array:0xe(hti:0x5)
        ZmStatMap mapstats[MapList];
        // offset: 0x95e8, bitSize: 0xa0(0x14 Byte(s))
        ZmBestStats beststats;
        // offset: 0x9688, bitSize: 0x40(0x8 Byte(s))
        ZmGlobalMatchStats matchstats;
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

    // bitSize: 0xf228, members: 1
    struct ZMAllWeaponStats {
        // offset: 0x0, bitSize: 0xf228(0x1e45 Byte(s)), array:0x7b(hti:0x0)
        ZMWeaponStats weaponstats[Weapon];
    };

    // bitSize: 0x1f0, members: 18
    struct ZMEquipmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint stunassists;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        Equipment equipment;
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
        int hash_e6473fd955ad59fa;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint killsafteruse;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        uint distractionassists;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int maxkillsperuse;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        uint stunnedandkilled;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        int hash_ad6eb1400c3764d7;
        // offset: 0x1c8, bitSize: 0x20(0x4 Byte(s))
        uint electrocuteassists;
        // offset: 0x1e8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0xdaf0, members: 1
    struct ZMAllEquipmentStats {
        // offset: 0x0, bitSize: 0xdaf0(0x1b5e Byte(s)), array:0x71(hti:0x1)
        ZMEquipmentStats equipmentstats[Equipment];
    };

    // bitSize: 0x1b0, members: 16
    struct ZMFieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        Super super;
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

    // bitSize: 0x13ef0, members: 1
    struct ZMAllFieldUpgradeStats {
        // offset: 0x0, bitSize: 0x13ef0(0x27de Byte(s)), array:0xbd(hti:0x3)
        ZMFieldUpgradeStats fieldupgradestats[Super];
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
        Killstreak killstreak;
        // offset: 0x88, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x2640, members: 1
    struct ZMAllScorestreakStats {
        // offset: 0x0, bitSize: 0x2640(0x4c8 Byte(s)), array:0x44(hti:0x2)
        ZMScorestreakStats killstreakstats[Killstreak];
    };

    // bitSize: 0x1b0, members: 16
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
        int hash_5aae992845f8721a;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int timeactiveseconds;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        uint meleekills;
        // offset: 0x1a8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x1b00, members: 1
    struct ZMAllPerkStats {
        // offset: 0x0, bitSize: 0x1b00(0x360 Byte(s)), array:0x10(hti:0x7)
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

    // bitSize: 0x78, members: 6
    struct ZMAugmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int majoraugmentsunlocked;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint timeactiveseconds;
        // offset: 0x40, bitSize: 0x10(0x2 Byte(s))
        SatZMAugment augment;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        int minoraugmentsunlocked;
        // offset: 0x70, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x8778, members: 1
    struct ZMAllAugmentStats {
        // offset: 0x0, bitSize: 0x8778(0x10ef Byte(s)), array:0x121(hti:0x9)
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

    // bitSize: 0x150, members: 6
    struct ZMTopMap {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        MapList map;
        // offset: 0x8, bitSize: 0x100(0x20 Byte(s))
        string(32) poi;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint highestexfil;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint highestroundscompleted;
        // offset: 0x148, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x308, members: 13
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
        // offset: 0xc0, bitSize: 0x150(0x2a Byte(s))
        ZMTopMap zmtopmap;
        // offset: 0x210, bitSize: 0x90(0x12 Byte(s)), array:0x3(hti:0xffff)
        ZMTopWeapon zmtopweapons[3];
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        uint exfils;
        // offset: 0x2c0, bitSize: 0x20(0x4 Byte(s))
        uint eliminated;
        // offset: 0x2e0, bitSize: 0x20(0x4 Byte(s))
        uint gamesplayed;
        // offset: 0x300, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x3e8, members: 23
    struct ZMRecentMatch {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        MapList map;
        // offset: 0x8, bitSize: 0x100(0x20 Byte(s))
        string(32) poi;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint matchdurationsec;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint bosseliminations;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint criticalkills;
        // offset: 0x188, bitSize: 0x40(0x8 Byte(s))
        uint64 matchid;
        // offset: 0x1c8, bitSize: 0x20(0x4 Byte(s))
        uint revives;
        // offset: 0x1e8, bitSize: 0xb0(0x16 Byte(s))
        ZMDeadliestWeapon dweapon;
        // offset: 0x298, bitSize: 0x20(0x4 Byte(s))
        uint doorbuys;
        // offset: 0x2b8, bitSize: 0x20(0x4 Byte(s))
        uint roundscompleted;
        // offset: 0x2d8, bitSize: 0x40(0x8 Byte(s))
        uint64 matchtsmsec;
        // offset: 0x318, bitSize: 0x20(0x4 Byte(s))
        uint salvage;
        // offset: 0x338, bitSize: 0x20(0x4 Byte(s))
        uint eliteeliminations;
        // offset: 0x358, bitSize: 0x8(0x1 Byte(s))
        ZmStatGameMode gametype;
        // offset: 0x360, bitSize: 0x20(0x4 Byte(s))
        uint essence;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        uint exfils;
        // offset: 0x3a0, bitSize: 0x20(0x4 Byte(s))
        uint specialeliminations;
        // offset: 0x3c0, bitSize: 0x20(0x4 Byte(s))
        uint qualifiedexfils;
        // offset: 0x3e0, bitSize: 0x1
        bool valid;
        // offset: 0x3e1, bitSize: 0x1
        bool reachedmatchend;
        // offset: 0x3e2, bitSize: 0x1
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

    // bitSize: 0x278, members: 5
    struct ZMGameModeMapStats {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        MapList map;
        // offset: 0x8, bitSize: 0x100(0x20 Byte(s))
        string(32) poi;
        // offset: 0x108, bitSize: 0x168(0x2d Byte(s))
        ZMGameModeStats stats;
        // offset: 0x270, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x2408, members: 5
    struct ZMGameModeAllMapsStats {
        // offset: 0x0, bitSize: 0x2290(0x452 Byte(s)), array:0xe(hti:0x5)
        ZMGameModeMapStats maps[MapList];
        // offset: 0x2290, bitSize: 0x8(0x1 Byte(s))
        ZmStatGameMode mode;
        // offset: 0x2298, bitSize: 0x168(0x2d Byte(s))
        ZMGameModeStats stats;
        // offset: 0x2400, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x26488, members: 1
    struct ZMAllGameModesStats {
        // offset: 0x0, bitSize: 0x26488(0x4c91 Byte(s)), array:0x11(hti:0x6)
        ZMGameModeAllMapsStats gamemodestats[ZmStatGameMode];
    };

    // idx 0x0 members: 0x7b type: 5
    enum Weapon {
        none, // 0x0
        sat_ar_condor, // 0x1
        sat_ar_eagle, // 0x2
        sat_ar_egret, // 0x3
        sat_ar_falcon, // 0x4
        sat_ar_hawk, // 0x5
        sat_ar_hawkexotic, // 0x6
        sat_ar_heron, // 0x7
        sat_ar_kite, // 0x8
        sat_ar_kiteexotic, // 0x9
        sat_ar_macaw, // 0xa
        sat_ar_vulture, // 0xb
        sat_ar_ztrondg2, // 0xc
        sat_dm_kara, // 0xd
        sat_dm_oman, // 0xe
        sat_dm_scotia, // 0xf
        sat_dm_scotiaexotic, // 0x10
        sat_dm_solomon, // 0x11
        sat_ks_annihilator, // 0x12
        sat_ks_deathmachine, // 0x13
        sat_ks_handcannon, // 0x14
        sat_ks_smartgun, // 0x15
        sat_ks_warmachine, // 0x16
        sat_la_fang, // 0x17
        sat_la_mutant_injection_cannon, // 0x18
        sat_la_polis, // 0x19
        sat_la_zm_dinj, // 0x1a
        sat_la_ztroncrossbow, // 0x1b
        sat_la_ztronpable3, // 0x1c
        sat_la_ztronwarmachine, // 0x1d
        sat_lm_deathmachine, // 0x1e
        sat_lm_hades, // 0x1f
        sat_lm_typhon, // 0x20
        sat_lm_zeus, // 0x21
        sat_lm_zeusexotic, // 0x22
        sat_lm_ztrondeathmachine, // 0x23
        sat_lm_ztronjetgun, // 0x24
        sat_lm_ztronlmg, // 0x25
        sat_me_ballisticknife, // 0x26
        sat_me_knife, // 0x27
        sat_me_saiph, // 0x28
        sat_me_shockbaton, // 0x29
        sat_me_zombie_melee, // 0x2a
        sat_me_zombie_mimic, // 0x2b
        sat_mp_assaultshield, // 0x2c
        sat_mp_black_hat, // 0x2d
        sat_ob_ks_warmachine, // 0x2e
        sat_pi_alcor, // 0x2f
        sat_pi_atlas, // 0x30
        sat_pi_orion, // 0x31
        sat_pi_timir, // 0x32
        sat_pi_ztronraygun, // 0x33
        sat_sh_akita, // 0x34
        sat_sh_corso, // 0x35
        sat_sh_corsoexotic, // 0x36
        sat_sh_husky, // 0x37
        sat_sh_shepherd, // 0x38
        sat_sh_ztronshotgun, // 0x39
        sat_sl_crossbow, // 0x3a
        sat_sl_nembus, // 0x3b
        sat_sm_bear, // 0x3c
        sat_sm_bengal, // 0x3d
        sat_sm_cobra, // 0x3e
        sat_sm_cobraexotic, // 0x3f
        sat_sm_gecko, // 0x40
        sat_sm_hyena, // 0x41
        sat_sm_komodo, // 0x42
        sat_sm_orca, // 0x43
        sat_sm_otter, // 0x44
        sat_sm_puma, // 0x45
        sat_sm_zebra, // 0x46
        sat_sm_zebraexotic, // 0x47
        sat_sn_aden, // 0x48
        sat_sn_baltic, // 0x49
        sat_sn_caspian, // 0x4a
        sat_sn_drake, // 0x4b
        sat_sn_drakeexotic, // 0x4c
        sat_ww_firefly, // 0x4d
        sat_ww_locust, // 0x4e
        sat_ww_mantis, // 0x4f
        sat_ww_raygun, // 0x50
        sat_ww_raygunmark2, // 0x51
        sat_ww_ruby, // 0x52
        sat_ww_hornet, // 0x53
        sat_ww_scarab, // 0x54
        saw_ar_daisy, // 0x55
        saw_daisy_minigun, // 0x56
        saw_dm_daisy, // 0x57
        saw_la_daisy, // 0x58
        saw_pi_daisy, // 0x59
        saw_sh_daisy, // 0x5a
        t10_me_climbfists, // 0x5b
        t10_me_diveknife, // 0x5c
        t10_me_fists, // 0x5d
        t10_swimfists, // 0x5e
        sat_pi_handcannon, // 0x5f
        sat_ar_finch, // 0x60
        sat_ar_finchexotic, // 0x61
        sat_sn_coral, // 0x62
        sat_sl_sargas, // 0x63
        sat_me_nashira, // 0x64
        sat_me_nashiraexotic, // 0x65
        t10_knifestab, // 0x66
        sat_ar_albatross, // 0x67
        sat_ar_kiwi, // 0x68
        sat_sm_mammoth, // 0x69
        sat_me_maru, // 0x6a
        sat_dm_samar, // 0x6b
        sat_sm_marmot, // 0x6c
        sat_sl_atria, // 0x6d
        sat_ks_compound, // 0x6e
        sat_sm_serval, // 0x6f
        sat_me_castor, // 0x70
        sat_me_elnath, // 0x71
        sat_sm_stoat, // 0x72
        sat_sh_terrier, // 0x73
        sat_dm_tasman, // 0x74
        sat_ar_wren, // 0x75
        sat_lm_hildr, // 0x76
        sat_ar_emu, // 0x77
        sat_sm_civet, // 0x78
        sat_me_wasat, // 0x79
        sat_sl_carina // 0x7a
    };

    // idx 0x1 members: 0x71 type: 5
    enum Equipment {
        equip_adrenaline, // 0x0
        equip_advanced_supply_drop, // 0x1
        equip_aethercounter, // 0x2
        equip_armor_onehanded, // 0x3
        equip_armor_onehanded_quick, // 0x4
        equip_armor_onehanded_quick_30, // 0x5
        equip_armorbox, // 0x6
        equip_armorplate, // 0x7
        equip_assault_pack, // 0x8
        equip_at_mine, // 0x9
        equip_attractor, // 0xa
        equip_blackhole_bomb, // 0xb
        equip_bunkerbuster, // 0xc
        equip_bunkerbuster_gl, // 0xd
        equip_c4, // 0xe
        equip_carrier, // 0xf
        equip_claymore, // 0x10
        equip_cluster_grenade, // 0x11
        equip_combat_hologram, // 0x12
        equip_combataxe, // 0x13
        equip_concussion, // 0x14
        equip_dart_mark_zero, // 0x15
        equip_decon_station, // 0x16
        equip_decoy, // 0x17
        equip_decoy_trinket, // 0x18
        equip_decryption_device, // 0x19
        equip_deployable_kiosk_drop, // 0x1a
        equip_drone_launcher, // 0x1b
        equip_emp, // 0x1c
        equip_europa_remote_control, // 0x1d
        equip_flash, // 0x1e
        equip_frag, // 0x1f
        equip_frag_hsg, // 0x20
        equip_gas_grenade, // 0x21
        equip_gas_grenade_doppelgas, // 0x22
        equip_gas_trap_plantable, // 0x23
        equip_geigercounter, // 0x24
        equip_grappling_hook, // 0x25
        equip_grappling_hook_dreadspinner_ee, // 0x26
        equip_grappling_hook_upgraded, // 0x27
        equip_guild_bot_death_emp, // 0x28
        equip_hb_sensor, // 0x29
        equip_ied, // 0x2a
        equip_impact_grenade, // 0x2b
        equip_inc_dark, // 0x2c
        equip_inc_earth, // 0x2d
        equip_inc_electric, // 0x2e
        equip_inc_fire, // 0x2f
        equip_inc_fire_t10_zm_scarab_torch, // 0x30
        equip_inc_light, // 0x31
        equip_inhibitor, // 0x32
        equip_jammer, // 0x33
        equip_landmine, // 0x34
        equip_mini_sentry, // 0x35
        equip_molotov, // 0x36
        equip_molotov_hellhound, // 0x37
        equip_molotov_purple, // 0x38
        equip_molotov_sat_zm_scarab_torch, // 0x39
        equip_monkey_bomb, // 0x3a
        equip_munitionsbox, // 0x3b
        equip_pop_candy, // 0x3c
        equip_proximity_alarm, // 0x3d
        equip_rallying_cry, // 0x3e
        equip_recondrone, // 0x3f
        equip_redeploy_drone_beacon, // 0x40
        equip_reinforcement_flare, // 0x41
        equip_rock, // 0x42
        equip_semtex, // 0x43
        equip_semtex_mike32_v5008, // 0x44
        equip_sensor_dart, // 0x45
        equip_sensor_grenade, // 0x46
        equip_shockstick, // 0x47
        equip_smart_seeker, // 0x48
        equip_smoke, // 0x49
        equip_smoke_gl, // 0x4a
        equip_snowball, // 0x4b
        equip_super_aether_blade, // 0x4c
        equip_super_aether_shroud, // 0x4d
        equip_super_black_hat, // 0x4e
        equip_super_bubble_shield, // 0x4f
        equip_super_cradle_gas_grenade, // 0x50
        equip_super_dash, // 0x51
        equip_super_energy_mine, // 0x52
        equip_super_flame_blast, // 0x53
        equip_super_frenzied_guard, // 0x54
        equip_super_frost_blast, // 0x55
        equip_super_grappling_hook, // 0x56
        equip_super_grappling_hook_sm, // 0x57
        equip_super_healing_aura, // 0x58
        equip_super_mary_paris, // 0x59
        equip_super_mega_jump, // 0x5a
        equip_super_monkey_bomb, // 0x5b
        equip_super_overcharge, // 0x5c
        equip_super_portal_summon, // 0x5d
        equip_super_radar_ping, // 0x5e
        equip_super_rallying_cry, // 0x5f
        equip_super_redeploy, // 0x60
        equip_super_shadow_break, // 0x61
        equip_super_survival_life_drain, // 0x62
        equip_super_teleport, // 0x63
        equip_super_tesla_storm, // 0x64
        equip_super_toxic_growth, // 0x65
        equip_super_vehicle_summoner, // 0x66
        equip_super_wiley_fox, // 0x67
        equip_tac_cover, // 0x68
        equip_tac_insert, // 0x69
        equip_thermite, // 0x6a
        equip_thermobaric_grenade, // 0x6b
        equip_trophy, // 0x6c
        equip_utilitybox, // 0x6d
        equip_vacuum_seal_device, // 0x6e
        equip_zombie_ranged_attack, // 0x6f
        none // 0x70
    };

    // idx 0x2 members: 0x44 type: 5
    enum Killstreak {
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
        bombardment_gas, // 0xb
        bombardment_smoke, // 0xc
        bunker_buster, // 0xd
        chopper_door_gunner, // 0xe
        circle_peek, // 0xf
        combat_bow, // 0x10
        counter_uav, // 0x11
        daisy_jugg, // 0x12
        daisy_streak, // 0x13
        dawg, // 0x14
        death_machine_gun, // 0x15
        directional_uav, // 0x16
        drone_formation_swarm, // 0x17
        emp_blast, // 0x18
        gas_strike, // 0x19
        ground_drone_unit, // 0x1a
        gunship, // 0x1b
        hand_cannon, // 0x1c
        hellstorm_missile, // 0x1d
        isotope_core, // 0x1e
        juggernaut, // 0x1f
        m202_launcher, // 0x20
        machete_attack, // 0x21
        mangler_cannon, // 0x22
        mega_death_machine_gun, // 0x23
        minj_random, // 0x24
        missile_turret, // 0x25
        napalm_strike, // 0x26
        none, // 0x27
        nuke, // 0x28
        nuke_multi, // 0x29
        precision_airstrike, // 0x2a
        radar_ping, // 0x2b
        radiation_blast, // 0x2c
        rcxd, // 0x2d
        remote_robot, // 0x2e
        remote_turret, // 0x2f
        scrambler_drone_guard, // 0x30
        sentry_gun, // 0x31
        skewer, // 0x32
        skybreak, // 0x33
        smart_gun, // 0x34
        sniper_briefcase, // 0x35
        sniper_drone, // 0x36
        supply_sweep, // 0x37
        switchblade_drone, // 0x38
        tank_drone, // 0x39
        toma_strike, // 0x3a
        uav, // 0x3b
        valkyrie_rocket, // 0x3c
        vtol_warship, // 0x3d
        war_machine_launcher, // 0x3e
        zm_bernard_primary, // 0x3f
        zm_bernard_secondary, // 0x40
        zm_dinj, // 0x41
        zm_minj, // 0x42
        zm_minj_nocannon // 0x43
    };

    // idx 0x3 members: 0xbd type: 5
    enum Super {
        none, // 0x0
        super_acoustic_amp, // 0x1
        super_active_camo, // 0x2
        super_active_camo_ob, // 0x3
        super_aether_blade, // 0x4
        super_aether_blade_ob, // 0x5
        super_aether_shroud, // 0x6
        super_ammo_drop, // 0x7
        super_ammo_drop_ob, // 0x8
        super_annihilator, // 0x9
        super_annihilator_ob, // 0xa
        super_armor_drop, // 0xb
        super_armory, // 0xc
        super_assault_shield, // 0xd
        super_balloon_extract, // 0xe
        super_battlerage, // 0xf
        super_black_hat, // 0x10
        super_black_hat_ob, // 0x11
        super_blastshield_drop, // 0x12
        super_blinding_turret, // 0x13
        super_blowtorch, // 0x14
        super_boba, // 0x15
        super_body_cam_hack, // 0x16
        super_br_aether_upgrade, // 0x17
        super_br_extract, // 0x18
        super_bradley, // 0x19
        super_bubble_shield, // 0x1a
        super_bubble_shield_ob, // 0x1b
        super_capture_bot, // 0x1c
        super_chopper_gunner, // 0x1d
        super_combat_hologram, // 0x1e
        super_combat_link, // 0x1f
        super_comm_scrambler, // 0x20
        super_contract_skipper, // 0x21
        super_cradle_gas_grenade, // 0x22
        super_cradle_gas_grenade_ob, // 0x23
        super_cranked, // 0x24
        super_cruise_predator, // 0x25
        super_dark_flare, // 0x26
        super_dark_flare_13s, // 0x27
        super_dark_flare_shadow_ball, // 0x28
        super_dash, // 0x29
        super_dash_ob, // 0x2a
        super_deadsilence, // 0x2b
        super_death_machine, // 0x2c
        super_death_machine_ob, // 0x2d
        super_decon_station, // 0x2e
        super_defibrillator, // 0x2f
        super_deployable_kiosk, // 0x30
        super_deployed_decoy, // 0x31
        super_door_barricade, // 0x32
        super_drone_launcher, // 0x33
        super_drone_launcher_ob, // 0x34
        super_electric_discharge, // 0x35
        super_elite_ironclad_drive, // 0x36
        super_emp_drone, // 0x37
        super_emp_pulse, // 0x38
        super_energy_mine, // 0x39
        super_energy_mine_ob, // 0x3a
        super_evg, // 0x3b
        super_flame_blast, // 0x3c
        super_flame_blast_ob, // 0x3d
        super_frenzied_guard, // 0x3e
        super_frost_blast, // 0x3f
        super_frost_blast_ob, // 0x40
        super_fulton, // 0x41
        super_fulton_marker, // 0x42
        super_gas_trap, // 0x43
        super_grappling_hook, // 0x44
        super_grappling_hook_sm, // 0x45
        super_guild_bot, // 0x46
        super_guild_bot_ob, // 0x47
        super_haunted_drop, // 0x48
        super_hb_sensor, // 0x49
        super_healing_aura, // 0x4a
        super_high_jump, // 0x4b
        super_honeypot, // 0x4c
        super_jammer, // 0x4d
        super_juggernaut, // 0x4e
        super_kazimir, // 0x4f
        super_kazimir_ob, // 0x50
        super_la_gromeo, // 0x51
        super_la_jp22_dromeo, // 0x52
        super_la_juliet, // 0x53
        super_la_kgolf, // 0x54
        super_la_mike32, // 0x55
        super_la_rpapa7, // 0x56
        super_landmine, // 0x57
        super_laser_beam, // 0x58
        super_laser_charge, // 0x59
        super_laststand_syringe, // 0x5a
        super_leader_drop, // 0x5b
        super_loadout_drop, // 0x5c
        super_mary_paris, // 0x5d
        super_med_box, // 0x5e
        super_med_kit, // 0x5f
        super_medical_box, // 0x60
        super_mega_jump, // 0x61
        super_mega_jump_ob, // 0x62
        super_melee_jugg, // 0x63
        super_mini_nuke, // 0x64
        super_monkey_bomb, // 0x65
        super_monkey_bomb_ob, // 0x66
        super_mutation, // 0x67
        super_mutation_boba_stim, // 0x68
        super_mutation_density_dive, // 0x69
        super_mutation_give_density_dive, // 0x6a
        super_mutation_give_jump, // 0x6b
        super_mutation_jump, // 0x6c
        super_mutation_ninja_sense, // 0x6d
        super_mutation_ninja_vanish, // 0x6e
        super_mutation_shell_shocked, // 0x6f
        super_mutation_shuriken_fury, // 0x70
        super_mutation_turtle_power, // 0x71
        super_none, // 0x72
        super_nvg, // 0x73
        super_overcharge, // 0x74
        super_overcharge_ob, // 0x75
        super_oxygen_mask, // 0x76
        super_oxygenmask, // 0x77
        super_pac_sentry, // 0x78
        super_personal_redeploy_drone, // 0x79
        super_pop_candy, // 0x7a
        super_portal_summon, // 0x7b
        super_portal_summon_ob, // 0x7c
        super_precision_airstrike, // 0x7d
        super_radar_ping, // 0x7e
        super_rallying_cry, // 0x7f
        super_rallying_cry_ob, // 0x80
        super_razor_wire, // 0x81
        super_recon_dart, // 0x82
        super_recon_drone, // 0x83
        super_redeploy, // 0x84
        super_redeploy_drone_beacon, // 0x85
        super_redeploy_ob, // 0x86
        super_reinforcement_flare, // 0x87
        super_remote_detonate, // 0x88
        super_riot_shield, // 0x89
        super_sam_airburst_turret, // 0x8a
        super_scramble, // 0x8b
        super_select, // 0x8c
        super_self_revive_box, // 0x8d
        super_shadow_break, // 0x8e
        super_shadow_break_ob, // 0x8f
        super_shadow_link, // 0x90
        super_smoke_airdrop, // 0x91
        super_smoke_shroud, // 0x92
        super_smoke_wall, // 0x93
        super_sonar_pulse, // 0x94
        super_sound_veil, // 0x95
        super_spykit, // 0x96
        super_squadrage, // 0x97
        super_stealth_perks, // 0x98
        super_stimpistol, // 0x99
        super_supply_drop, // 0x9a
        super_support_box, // 0x9b
        super_suppression_rounds, // 0x9c
        super_survival_life_drain, // 0x9d
        super_survival_life_drain_ob, // 0x9e
        super_sweeper_drones, // 0x9f
        super_tac_camera, // 0xa0
        super_tac_cover, // 0xa1
        super_tac_insert, // 0xa2
        super_tar_bomb, // 0xa3
        super_teleport, // 0xa4
        super_teleport_deploy, // 0xa5
        super_teleport_ob, // 0xa6
        super_temp_v, // 0xa7
        super_tesla_coil, // 0xa8
        super_tesla_storm, // 0xa9
        super_test, // 0xaa
        super_toma_strike, // 0xab
        super_toxic_growth, // 0xac
        super_toxic_growth_ob, // 0xad
        super_trauma_kit, // 0xae
        super_treasure_hunter, // 0xaf
        super_treasure_hunter_ob, // 0xb0
        super_trophy, // 0xb1
        super_uav, // 0xb2
        super_utility_drop, // 0xb3
        super_vehicle_drop, // 0xb4
        super_vehicle_summoner, // 0xb5
        super_vehicle_summoner_ob, // 0xb6
        super_vision_pulse, // 0xb7
        super_vision_pulse_ob, // 0xb8
        super_war_machine, // 0xb9
        super_war_machine_ob, // 0xba
        super_weapon_drop, // 0xbb
        super_wiley_fox // 0xbc
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

    // idx 0x5 members: 0xe type: c
    enum MapList {
        zm_t10_garnet, // 0x0
        zm_t10_quartz, // 0x1
        zm_t10_bloodstone, // 0x2
        zm_t10_opal, // 0x3
        zm_t10_topaz, // 0x4
        zm_t10_jade, // 0x5
        zm_t10_garnet_jh, // 0x6
        zm_sat_firefly, // 0x7
        zm_sat_ruby, // 0x8
        zm_sat_ruby_jh, // 0x9
        zm_sat_hornet, // 0xa
        zm_sat_locust, // 0xb
        zm_sat_mantis, // 0xc
        zm_sat_scarab // 0xd
    };

    // idx 0x6 members: 0x11 type: 5
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
        zm_rb_survival, // 0x9
        zm_rb_r_mod, // 0xa
        zm_rb_r_mod_survival, // 0xb
        zm_rb_daisy, // 0xc
        zm_rb_battle, // 0xd
        zm_rb_startroom, // 0xe
        zm_rb_echo, // 0xf
        zm_rb_rh_mod // 0x10
    };

    // idx 0x7 members: 0x10 type: 5
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
        specialty_w_mod, // 0xe
        specialty_y_mod // 0xf
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

    // idx 0x9 members: 0x121 type: 5
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
        deadshot_dead_heat, // 0x29
        deadshot_dead_to_rights, // 0x2a
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
        deathperception_hidden_gems, // 0x3d
        deathperception_sixth_sense, // 0x3e
        deathperception_treasure_hunter, // 0x3f
        elemental_pop_advantage, // 0x40
        elemental_pop_electric_cherry, // 0x41
        elemental_pop_elemental_equipment, // 0x42
        elemental_pop_elemental_protection, // 0x43
        elemental_pop_more_pop, // 0x44
        elemental_pop_rainbow_pop, // 0x45
        elemental_pop_refresh_mint, // 0x46
        elemental_pop_tuned_frequency, // 0x47
        energy_mine_carousel, // 0x48
        energy_mine_frequency_boost, // 0x49
        energy_mine_high_capacity, // 0x4a
        energy_mine_recycle, // 0x4b
        energy_mine_scatter_mine, // 0x4c
        energy_mine_siren, // 0x4d
        energy_mine_smart_mine, // 0x4e
        energy_mine_spire, // 0x4f
        frenzied_guard_extension, // 0x50
        frenzied_guard_fists_of_frenzy, // 0x51
        frenzied_guard_frenzy_fire, // 0x52
        frenzied_guard_high_defense, // 0x53
        frenzied_guard_phalanx, // 0x54
        frenzied_guard_rally, // 0x55
        frenzied_guard_repair_boost, // 0x56
        frenzied_guard_retribution, // 0x57
        frost_blast_cast, // 0x58
        frost_blast_extension, // 0x59
        frost_blast_flash_freeze, // 0x5a
        frost_blast_frostbite, // 0x5b
        frost_blast_high_capacity, // 0x5c
        frost_blast_slick, // 0x5d
        frost_blast_slow_extend, // 0x5e
        frost_blast_stone_cold_stronghold, // 0x5f
        fw_big_bang, // 0x60
        fw_big_game, // 0x61
        fw_condensed_yield, // 0x62
        fw_farfalle, // 0x63
        fw_fire_wheel, // 0x64
        fw_haste, // 0x65
        fw_starlight, // 0x66
        fw_weeping_willow, // 0x67
        healingaura_bountiful_harvest, // 0x68
        healingaura_inner_strength, // 0x69
        healingaura_keep_perks, // 0x6a
        healingaura_necromancer, // 0x6b
        healingaura_pillar_of_light, // 0x6c
        healingaura_protection, // 0x6d
        healingaura_resilience, // 0x6e
        healingaura_stoic_presence, // 0x6f
        juggernog_iron_core, // 0x70
        juggernog_juggernaut, // 0x71
        juggernog_perfect_counter, // 0x72
        juggernog_reactive_armor, // 0x73
        juggernog_retaliation, // 0x74
        juggernog_thicker_plates, // 0x75
        juggernog_turtle_shell, // 0x76
        juggernog_well_constructed, // 0x77
        lightray_antibiotic, // 0x78
        lightray_big_game, // 0x79
        lightray_booster_shot, // 0x7a
        lightray_dual_action, // 0x7b
        lightray_express_remedy, // 0x7c
        lightray_extra_strength, // 0x7d
        lightray_longer_life, // 0x7e
        lightray_mitosis, // 0x7f
        m_mod_backpedal, // 0x80
        m_mod_closing_argument, // 0x81
        m_mod_faster_melee, // 0x82
        m_mod_hidden_impact, // 0x83
        m_mod_overwhelming_force, // 0x84
        m_mod_panic_knife, // 0x85
        m_mod_pressure_points, // 0x86
        m_mod_vampirism, // 0x87
        mary_paris_apex_hunter, // 0x88
        mary_paris_arcane_fury, // 0x89
        mary_paris_dance_party, // 0x8a
        mary_paris_family_discount, // 0x8b
        mary_paris_paris_favor, // 0x8c
        mary_paris_party_animal, // 0x8d
        mary_paris_peek_health, // 0x8e
        mary_paris_social_butterfly, // 0x8f
        napalmburst_backdraft, // 0x90
        napalmburst_big_game, // 0x91
        napalmburst_contact_burn, // 0x92
        napalmburst_damage_boost, // 0x93
        napalmburst_extension, // 0x94
        napalmburst_incendiary, // 0x95
        napalmburst_petrol, // 0x96
        napalmburst_pyro, // 0x97
        phdflopper_double_whammy, // 0x98
        phdflopper_explosive_fall, // 0x99
        phdflopper_hair_trigger, // 0x9a
        phdflopper_safe_slide, // 0x9b
        phdflopper_shove, // 0x9c
        phdflopper_slide_boost, // 0x9d
        phdflopper_slider, // 0x9e
        phdflopper_wall_flopper, // 0x9f
        quick_revive_adrenaline_rush, // 0xa0
        quick_revive_die_hard, // 0xa1
        quick_revive_dying_wish, // 0xa2
        quick_revive_emergency_medical_kit, // 0xa3
        quick_revive_escape_plan, // 0xa4
        quick_revive_last_chance, // 0xa5
        quick_revive_payback, // 0xa6
        quick_revive_precision_surgery, // 0xa7
        shadowvortex_big_game, // 0xa8
        shadowvortex_blackhole, // 0xa9
        shadowvortex_explosive_rain, // 0xaa
        shadowvortex_haste, // 0xab
        shadowvortex_reload, // 0xac
        shadowvortex_supermassive, // 0xad
        shadowvortex_targeted, // 0xae
        shadowvortex_topple_danger, // 0xaf
        shatterblast_big_game, // 0xb0
        shatterblast_blast_boost, // 0xb1
        shatterblast_blast_chain, // 0xb2
        shatterblast_blast_off, // 0xb3
        shatterblast_blast_repair, // 0xb4
        shatterblast_blast_shield, // 0xb5
        shatterblast_blast_wave, // 0xb6
        shatterblast_blast_zone, // 0xb7
        speedcola_classic_formula, // 0xb8
        speedcola_faster_equipment, // 0xb9
        speedcola_faster_field_upgrade, // 0xba
        speedcola_faster_magicbox, // 0xbb
        speedcola_faster_switch, // 0xbc
        speedcola_phantom_reload, // 0xbd
        speedcola_sprint_reload, // 0xbe
        speedcola_stock_reload, // 0xbf
        staminup_endurance, // 0xc0
        staminup_fire_walker, // 0xc1
        staminup_footwork, // 0xc2
        staminup_guns_up, // 0xc3
        staminup_light_footed, // 0xc4
        staminup_multitask, // 0xc5
        staminup_slippery_target, // 0xc6
        staminup_speed_boost, // 0xc7
        staminup_stalker, // 0xc8
        tesla_storm_lithium_charged, // 0xc9
        tesla_storm_overclocked, // 0xca
        tesla_storm_power_grid, // 0xcb
        tesla_storm_sat_major, // 0xcc
        tesla_storm_sat_minor, // 0xcd
        tesla_storm_shockwave, // 0xce
        tesla_storm_static_discharge, // 0xcf
        tesla_storm_transformer, // 0xd0
        toxic_growth_ankle_shredder, // 0xd1
        toxic_growth_cordyception, // 0xd2
        toxic_growth_crescent, // 0xd3
        toxic_growth_extra_charge, // 0xd4
        toxic_growth_green_thumb, // 0xd5
        toxic_growth_plant_food, // 0xd6
        toxic_growth_pollination, // 0xd7
        toxic_growth_zoochory, // 0xd8
        vulture_aid_camouflage, // 0xd9
        vulture_aid_carrion_luggage, // 0xda
        vulture_aid_condors_reach, // 0xdb
        vulture_aid_extra_serving, // 0xdc
        vulture_aid_fetidupgraid, // 0xdd
        vulture_aid_parting_gift, // 0xde
        vulture_aid_picky_eater, // 0xdf
        vulture_aid_replate, // 0xe0
        w_mod_demon_mask, // 0xe1
        w_mod_extension, // 0xe2
        w_mod_fetcher, // 0xe3
        w_mod_haste, // 0xe4
        w_mod_lure, // 0xe5
        w_mod_pretty_mask, // 0xe6
        w_mod_savior, // 0xe7
        w_mod_will_o_wisp, // 0xe8
        wiley_fox_backdraft, // 0xe9
        wiley_fox_fireball, // 0xea
        wiley_fox_firestorm, // 0xeb
        wiley_fox_flashover, // 0xec
        wiley_fox_freeradical, // 0xed
        wiley_fox_heatsurge, // 0xee
        wiley_fox_moltencore, // 0xef
        wiley_fox_oxidizer, // 0xf0
        y_mod_extension, // 0xf1
        y_mod_haste, // 0xf2
        y_mod_hatchling, // 0xf3
        y_mod_lethal_equipment, // 0xf4
        y_mod_tangled_web, // 0xf5
        y_mod_web_spinner, // 0xf6
        y_mod_wide_web, // 0xf7
        y_mod_widows_bite, // 0xf8
        z_mod_buy_one_get_one, // 0xf9
        z_mod_free_throw, // 0xfa
        z_mod_fully_equipped, // 0xfb
        z_mod_kick_back, // 0xfc
        z_mod_multi_pack, // 0xfd
        z_mod_ol_reliable, // 0xfe
        z_mod_pack_mule, // 0xff
        z_mod_plate_hunter, // 0x100
        zombie_augment_bonus_minor_unlock_aether_shroud, // 0x101
        zombie_augment_bonus_minor_unlock_brainrot, // 0x102
        zombie_augment_bonus_minor_unlock_cryofreeze, // 0x103
        zombie_augment_bonus_minor_unlock_d_mod, // 0x104
        zombie_augment_bonus_minor_unlock_dark_flare, // 0x105
        zombie_augment_bonus_minor_unlock_deadshot, // 0x106
        zombie_augment_bonus_minor_unlock_deadwire, // 0x107
        zombie_augment_bonus_minor_unlock_death_perception, // 0x108
        zombie_augment_bonus_minor_unlock_elemental_pop, // 0x109
        zombie_augment_bonus_minor_unlock_energy_mine, // 0x10a
        zombie_augment_bonus_minor_unlock_frenzied_guard, // 0x10b
        zombie_augment_bonus_minor_unlock_frost_blast, // 0x10c
        zombie_augment_bonus_minor_unlock_fw_ammomod, // 0x10d
        zombie_augment_bonus_minor_unlock_healing_aura, // 0x10e
        zombie_augment_bonus_minor_unlock_juggernog, // 0x10f
        zombie_augment_bonus_minor_unlock_lightray, // 0x110
        zombie_augment_bonus_minor_unlock_m_mod, // 0x111
        zombie_augment_bonus_minor_unlock_mary_paris, // 0x112
        zombie_augment_bonus_minor_unlock_napalmburst, // 0x113
        zombie_augment_bonus_minor_unlock_phd_flopper, // 0x114
        zombie_augment_bonus_minor_unlock_quick_revive, // 0x115
        zombie_augment_bonus_minor_unlock_shadow_vortex, // 0x116
        zombie_augment_bonus_minor_unlock_shatterbast, // 0x117
        zombie_augment_bonus_minor_unlock_speed_cola, // 0x118
        zombie_augment_bonus_minor_unlock_staminup, // 0x119
        zombie_augment_bonus_minor_unlock_tesla_storm, // 0x11a
        zombie_augment_bonus_minor_unlock_toxic_growth, // 0x11b
        zombie_augment_bonus_minor_unlock_vulture_aid, // 0x11c
        zombie_augment_bonus_minor_unlock_w_mod, // 0x11d
        zombie_augment_bonus_minor_unlock_wiley_fox, // 0x11e
        zombie_augment_bonus_minor_unlock_y_mod, // 0x11f
        zombie_augment_bonus_minor_unlock_z_mod // 0x120
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

    // root: bitSize: 0x4b7f00, members: 12

    // offset: 0x0, bitSize: 0x1cb00(0x3960 Byte(s)), array:0xc(hti:0x4)
    ZMAllScorestreakStats killstreakstatslist[TimeScope];
    // offset: 0x1cb00, bitSize: 0xb59e0(0x16b3c Byte(s)), array:0xc(hti:0x4)
    ZMAllWeaponStats weaponstatslist[TimeScope];
    // offset: 0xd24e0, bitSize: 0xa4340(0x14868 Byte(s)), array:0xc(hti:0x4)
    ZMAllEquipmentStats equipmentstatslist[TimeScope];
    // offset: 0x176820, bitSize: 0xef340(0x1de68 Byte(s)), array:0xc(hti:0x4)
    ZMAllFieldUpgradeStats fieldupgradestatslist[TimeScope];
    // offset: 0x265b60, bitSize: 0x3e8(0x7d Byte(s))
    ZMRecentMatch lastmatch;
    // offset: 0x265f48, bitSize: 0x2460(0x48c Byte(s)), array:0xc(hti:0x4)
    ZMCareer zmcareer[TimeScope];
    // offset: 0x2683a8, bitSize: 0x1cb660(0x396cc Byte(s)), array:0xc(hti:0x4)
    ZMAllGameModesStats allgamemodestats[TimeScope];
    // offset: 0x433a08, bitSize: 0x2710(0x4e2 Byte(s)), array:0xa(hti:0xffff)
    ZMRecentMatch recentmatches[10];
    // offset: 0x436118, bitSize: 0x8040(0x1008 Byte(s)), array:0xc(hti:0x4)
    ZMAllAmmoModStats ammomodstatslist[TimeScope];
    // offset: 0x43e158, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
    // offset: 0x43e160, bitSize: 0x659a0(0xcb34 Byte(s)), array:0xc(hti:0x4)
    ZMAllAugmentStats augmentstatslist[TimeScope];
    // offset: 0x4a3b00, bitSize: 0x14400(0x2880 Byte(s)), array:0xc(hti:0x4)
    ZMAllPerkStats perkstatslist[TimeScope];
};

