// file .... ddl\sat\wz\sat_wz_combatrecord.ddl

version 1 {
    // enums ..... 8 (0x8)
    // structs ... 14 (0xe)
    // bit size .. 2484992 (0x25eb00)
    // byte size . 310624 (0x4bd60)
    // archive ... hash_cb1ba716d9803ad5

    // bitSize: 0x1a0, members: 16
    struct WeaponStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint hits;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint shots;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float accuracy;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float headshotpercentage;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        uint hash_6988edf68bf18da;
        // offset: 0x120, bitSize: 0x10(0x2 Byte(s))
        SatWZWeapons weapon;
        // offset: 0x130, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x150, bitSize: 0x8(0x1 Byte(s))
        SatCombatRecordWeaponClass weaponclass;
        // offset: 0x158, bitSize: 0x20(0x4 Byte(s))
        float furthestkill;
        // offset: 0x178, bitSize: 0x20(0x4 Byte(s))
        uint headshots;
        // offset: 0x198, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x219e0, members: 1
    struct WeaponStatsList {
        // offset: 0x0, bitSize: 0x219e0(0x433c Byte(s)), array:0x14b(hti:0x0)
        WeaponStats weaponstats[SatWZWeapons];
    };

    // bitSize: 0x48, members: 4
    struct PlacementStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint numwins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int bestplacement;
        // offset: 0x40, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x128, members: 6
    struct PlacementStatsGroup {
        // offset: 0x0, bitSize: 0x48(0x9 Byte(s))
        PlacementStats duostats;
        // offset: 0x48, bitSize: 0x48(0x9 Byte(s))
        PlacementStats quadstats;
        // offset: 0x90, bitSize: 0x48(0x9 Byte(s))
        PlacementStats solostats;
        // offset: 0xd8, bitSize: 0x48(0x9 Byte(s))
        PlacementStats triostats;
        // offset: 0x120, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x90, members: 7
    struct EquipmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatEquipment equipment;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint furthestkill;
        // offset: 0x88, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x3720, members: 1
    struct EquipmentStatsList {
        // offset: 0x0, bitSize: 0x3720(0x6e4 Byte(s)), array:0x62(hti:0x2)
        EquipmentStats equipmentstats[SatEquipment];
    };

    // bitSize: 0xe0, members: 10
    struct FieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatSuper super;
        // offset: 0x48, bitSize: 0x10(0x2 Byte(s))
        short mostkillsperuse;
        // offset: 0x58, bitSize: 0x20(0x4 Byte(s))
        float highestkillsperuse;
        // offset: 0x78, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x98, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0xb8, bitSize: 0x20(0x4 Byte(s))
        uint furthestkill;
        // offset: 0xd8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x9f40, members: 1
    struct FieldUpgradeStatsList {
        // offset: 0x0, bitSize: 0x9f40(0x13e8 Byte(s)), array:0xb6(hti:0x4)
        FieldUpgradeStats fieldupgradestats[SatSuper];
    };

    // bitSize: 0xe0, members: 10
    struct ScorestreakStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x10(0x2 Byte(s))
        short mostkillsperuse;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float highestkillsperuse;
        // offset: 0x70, bitSize: 0x20(0x4 Byte(s))
        uint destructions;
        // offset: 0x90, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0xb0, bitSize: 0x8(0x1 Byte(s))
        SatKillstreak killstreak;
        // offset: 0xb8, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0xd8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x2e60, members: 1
    struct ScorestreakStatsList {
        // offset: 0x0, bitSize: 0x2e60(0x5cc Byte(s)), array:0x35(hti:0x3)
        ScorestreakStats killstreakstats[SatKillstreak];
    };

    // bitSize: 0x78, members: 6
    struct DeadliestWeapon {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float ratio;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float accuracy;
        // offset: 0x60, bitSize: 0x10(0x2 Byte(s))
        SatWZWeapons weapon;
        // offset: 0x70, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x518, members: 20
    struct RecentMatchStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x100(0x20 Byte(s))
        string(32) map;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        uint score;
        // offset: 0x140, bitSize: 0x40(0x8 Byte(s))
        uint64 matchtsmilli;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        uint matchdurationsec;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        uint survivaltimesec;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        uint cashspent;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x200, bitSize: 0x40(0x8 Byte(s))
        uint64 matchid;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        uint deadliestweaponeliminations;
        // offset: 0x260, bitSize: 0x100(0x20 Byte(s))
        string(32) gametype;
        // offset: 0x360, bitSize: 0x20(0x4 Byte(s))
        uint deadliestweapondeaths;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        float hash_1dfc09d7c2353969;
        // offset: 0x3a0, bitSize: 0x20(0x4 Byte(s))
        uint damage;
        // offset: 0x3c0, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x3e0, bitSize: 0x20(0x4 Byte(s))
        int matchplacement;
        // offset: 0x400, bitSize: 0x10(0x2 Byte(s))
        SatWZWeapons deadliestweaponname;
        // offset: 0x410, bitSize: 0x100(0x20 Byte(s))
        string(32) gametypevariant;
        // offset: 0x510, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x468, members: 18
    struct OverviewStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint top5;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint wins;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint top10;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint top25;
        // offset: 0x80, bitSize: 0x168(0x2d Byte(s)), array:0x3(hti:0xffff)
        DeadliestWeapon topelimweapons[3];
        // offset: 0x1e8, bitSize: 0x20(0x4 Byte(s))
        uint highesteliminationspergame;
        // offset: 0x208, bitSize: 0x10(0x2 Byte(s))
        short scoreperminute;
        // offset: 0x218, bitSize: 0x20(0x4 Byte(s))
        uint timeplayed;
        // offset: 0x238, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x258, bitSize: 0x20(0x4 Byte(s))
        uint highestscore;
        // offset: 0x278, bitSize: 0x10(0x2 Byte(s))
        short averageeliminationspergame;
        // offset: 0x288, bitSize: 0x20(0x4 Byte(s))
        uint highestcashspent;
        // offset: 0x2a8, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x2c8, bitSize: 0x168(0x2d Byte(s)), array:0x3(hti:0xffff)
        DeadliestWeapon topedrweapons[3];
        // offset: 0x430, bitSize: 0x10(0x2 Byte(s))
        short lifetimeedr;
        // offset: 0x440, bitSize: 0x20(0x4 Byte(s))
        uint gamesplayed;
        // offset: 0x460, bitSize: 0x1
        bool valid;
    };

    // idx 0x0 members: 0x14b type: 5
    enum SatWZWeapons {
        none, // 0x0
        briefcase_bomb_mp, // 0x1
        cruise_proj_valkyrie_t10_mp, // 0x2
        iw9_ar_acharlie300, // 0x3
        iw9_ar_akilo, // 0x4
        iw9_ar_akilo105, // 0x5
        iw9_ar_akilo74, // 0x6
        iw9_ar_augolf, // 0x7
        iw9_ar_falpha, // 0x8
        iw9_ar_fecho, // 0x9
        iw9_ar_golf3, // 0xa
        iw9_ar_helima, // 0xb
        iw9_ar_kilo53, // 0xc
        iw9_ar_malima, // 0xd
        iw9_ar_mcbravo, // 0xe
        iw9_ar_mcharlie, // 0xf
        iw9_ar_mike16, // 0x10
        iw9_ar_mike4, // 0x11
        iw9_ar_ralpha, // 0x12
        iw9_ar_scharlie, // 0x13
        iw9_ar_schotel, // 0x14
        iw9_br_msecho, // 0x15
        iw9_br_ngsierra, // 0x16
        iw9_br_soscar14, // 0x17
        iw9_cyberemp, // 0x18
        iw9_dm_crossbow, // 0x19
        iw9_dm_la700, // 0x1a
        iw9_dm_mike14, // 0x1b
        iw9_dm_mike24, // 0x1c
        iw9_dm_pgolf1, // 0x1d
        iw9_dm_sa700, // 0x1e
        iw9_dm_sbeta, // 0x1f
        iw9_dm_scromeo, // 0x20
        iw9_dm_stango25, // 0x21
        iw9_dm_xmike2010, // 0x22
        iw9_drown, // 0x23
        iw9_knifestab, // 0x24
        iw9_la_gromeo, // 0x25
        iw9_la_juliet, // 0x26
        iw9_la_kgolf, // 0x27
        iw9_la_mike32, // 0x28
        iw9_la_mike32biolab, // 0x29
        iw9_la_rpapa7, // 0x2a
        iw9_lm_ahotel, // 0x2b
        iw9_lm_dblmg, // 0x2c
        iw9_lm_dblmg2, // 0x2d
        iw9_lm_dblmg_jup, // 0x2e
        iw9_lm_foxtrot, // 0x2f
        iw9_lm_kilo21, // 0x30
        iw9_lm_mkilo3, // 0x31
        iw9_lm_ngolf7, // 0x32
        iw9_lm_rkilo, // 0x33
        iw9_lm_slima, // 0x34
        iw9_me_buzzsaw, // 0x35
        iw9_me_climbfists, // 0x36
        iw9_me_diveknife, // 0x37
        iw9_me_fists, // 0x38
        iw9_me_kamas, // 0x39
        iw9_me_knife, // 0x3a
        iw9_me_pickaxe, // 0x3b
        iw9_me_riotshield, // 0x3c
        iw9_me_rusherknife, // 0x3d
        iw9_me_superfists, // 0x3e
        iw9_me_sword01, // 0x3f
        iw9_me_tonfa, // 0x40
        iw9_nukecore_mp, // 0x41
        iw9_oxygenmask, // 0x42
        iw9_pi_decho, // 0x43
        iw9_pi_dechoauto, // 0x44
        iw9_pi_golf17, // 0x45
        iw9_pi_golf18, // 0x46
        iw9_pi_mike2011, // 0x47
        iw9_pi_papa220, // 0x48
        iw9_pi_stimpistol, // 0x49
        iw9_pi_swhiskey, // 0x4a
        iw9_pi_tango9, // 0x4b
        iw9_sh_charlie725, // 0x4c
        iw9_sh_mbravo, // 0x4d
        iw9_sh_mike1014, // 0x4e
        iw9_sh_mviktor, // 0x4f
        iw9_sh_tsierra12, // 0x50
        iw9_sh_vecho, // 0x51
        iw9_sm_acharlie45, // 0x52
        iw9_sm_acharlie9, // 0x53
        iw9_sm_alpha57, // 0x54
        iw9_sm_apapa, // 0x55
        iw9_sm_aviktor, // 0x56
        iw9_sm_beta, // 0x57
        iw9_sm_mpapa5, // 0x58
        iw9_sm_mpapa7, // 0x59
        iw9_sm_mpapax, // 0x5a
        iw9_sm_papa90, // 0x5b
        iw9_sm_sdelta, // 0x5c
        iw9_sm_victor, // 0x5d
        iw9_sn_alpha50, // 0x5e
        iw9_sn_india, // 0x5f
        iw9_sn_limax, // 0x60
        iw9_sn_mromeo, // 0x61
        iw9_sn_walpha, // 0x62
        iw9_swimfists, // 0x63
        jup_amp_knifestab_mp, // 0x64
        jup_ar_dg2, // 0x65
        jup_cp01_sh_aromeo410, // 0x66
        jup_cp01_sm_coscar635, // 0x67
        jup_cp01_sm_pcharlie9, // 0x68
        jup_cp05_lm_halpha, // 0x69
        jup_cp06_ar_falpha, // 0x6a
        jup_cp08_br_xmike5, // 0x6b
        jup_cp15_lm_mkilo3, // 0x6c
        jup_cp24_pi_glima21, // 0x6d
        jup_jp01_ar_golf36, // 0x6e
        jup_jp01_dm_slima8, // 0x6f
        jup_jp01_lm_mgolf36, // 0x70
        jup_jp02_ar_bromeo805, // 0x71
        jup_jp02_br_bromeo2, // 0x72
        jup_jp02_dm_bromeop, // 0x73
        jup_jp02_sm_scharlie3, // 0x74
        jup_jp03_ar_aromeo160, // 0x75
        jup_jp03_br_aromeo200, // 0x76
        jup_jp03_sm_pmike, // 0x77
        jup_jp04_sm_lwhiskey, // 0x78
        jup_jp04_sm_umike, // 0x79
        jup_jp05_ar_foxtrot2000, // 0x7a
        jup_jp06_lm_pkilop, // 0x7b
        jup_jp07_pi_uzulum, // 0x7c
        jup_jp07_sm_uzulu, // 0x7d
        jup_jp07_sm_uzulup, // 0x7e
        jup_jp08_ar_qbravo97, // 0x7f
        jup_jp08_lm_qbravo95lsw, // 0x80
        jup_jp09_sh_oromeo12, // 0x81
        jup_jp10_sn_cdelta50, // 0x82
        jup_jp12_pi_mike93, // 0x83
        jup_jp13_dm_svictork, // 0x84
        jup_jp13_sn_svictor, // 0x85
        jup_jp14_pi_rsierra12, // 0x86
        jup_jp16_sh_recho870, // 0x87
        jup_jp17_sn_hsierra, // 0x88
        jup_jp19_ar_acharlie, // 0x89
        jup_jp19_br_acharlie450, // 0x8a
        jup_jp19_dm_acharlied, // 0x8b
        jup_jp20_lm_evictor, // 0x8c
        jup_jp22_la_dromeo, // 0x8d
        jup_jp23_me_kalpha, // 0x8e
        jup_jp23_me_knife, // 0x8f
        jup_jp23_me_pdango, // 0x90
        jup_jp23_me_pdango_arcade, // 0x91
        jup_jp23_me_shotel, // 0x92
        jup_jp23_me_shotel_arcade, // 0x93
        jup_jp23_me_spear, // 0x94
        jup_jp23_me_swhiskey, // 0x95
        jup_jp25_ar_talpha95, // 0x96
        jup_jp25_sm_talpham, // 0x97
        jup_jp26_la_cluster, // 0x98
        jup_jp26_la_cluster32, // 0x99
        jup_jp26_la_mike32, // 0x9a
        jup_jp28_lm_rpapa20, // 0x9b
        jup_jp31_dm_compound, // 0x9c
        jup_jp32_pi_mpapa9, // 0x9d
        jup_jp34_ar_balpha27, // 0x9e
        jup_jp35_sn_moscar, // 0x9f
        jup_jp36_ar_anov94, // 0xa0
        jup_jp36_sn_boscar, // 0xa1
        jup_jp37_dm_kappa98, // 0xa2
        jup_jp38_sh_spapa12, // 0xa3
        jup_jp40_br_hcharlie36, // 0xa4
        jup_jp41_sm_kpappa50, // 0xa5
        jup_jp44_ar_stango44, // 0xa6
        jup_la_humangun, // 0xa7
        jup_la_plasmagun, // 0xa8
        jup_me_axe, // 0xa9
        jup_me_glassshiv, // 0xaa
        jup_me_zombie_hellhound, // 0xab
        jup_me_zombie_melee, // 0xac
        jup_me_zombie_mimic, // 0xad
        jup_pi_goldengun, // 0xae
        jup_pi_raygun, // 0xaf
        sat_ar_condor, // 0xb0
        sat_ar_eagle, // 0xb1
        sat_ar_falcon, // 0xb2
        sat_ar_hawk, // 0xb3
        sat_ar_kite, // 0xb4
        sat_ar_macaw, // 0xb5
        sat_ar_vulture, // 0xb6
        sat_ar_ztrondg2, // 0xb7
        sat_dm_kara, // 0xb8
        sat_dm_oman, // 0xb9
        sat_dm_scotia, // 0xba
        sat_ks_deathmachine, // 0xbb
        sat_ks_handcannon, // 0xbc
        sat_ks_warmachine, // 0xbd
        sat_la_fang, // 0xbe
        sat_la_mutant_injection_cannon, // 0xbf
        sat_la_polis, // 0xc0
        sat_la_zm_dinj, // 0xc1
        sat_la_ztroncrossbow, // 0xc2
        sat_la_ztronpable3, // 0xc3
        sat_la_ztronwarmachine, // 0xc4
        sat_lm_hades, // 0xc5
        sat_lm_typhon, // 0xc6
        sat_lm_zeus, // 0xc7
        sat_lm_ztronaroger, // 0xc8
        sat_lm_ztrondeathmachine, // 0xc9
        sat_lm_ztronjetgun, // 0xca
        sat_me_ballisticknife, // 0xcb
        sat_me_knife, // 0xcc
        sat_me_shockbaton, // 0xcd
        sat_me_zombie_melee, // 0xce
        sat_mp_assaultshield, // 0xcf
        sat_mp_black_hat, // 0xd0
        sat_pi_atlas, // 0xd1
        sat_pi_orion, // 0xd2
        sat_pi_timir, // 0xd3
        sat_pi_ztronraygun, // 0xd4
        sat_sh_akita, // 0xd5
        sat_sh_corso, // 0xd6
        sat_sh_husky, // 0xd7
        sat_sh_shepherd, // 0xd8
        sat_sh_ztronakita, // 0xd9
        sat_sm_cobra, // 0xda
        sat_sm_hyena, // 0xdb
        sat_sm_komodo, // 0xdc
        sat_sm_orca, // 0xdd
        sat_sm_otter, // 0xde
        sat_sm_puma, // 0xdf
        sat_sm_zebra, // 0xe0
        sat_sn_aden, // 0xe1
        sat_sn_baltic, // 0xe2
        sat_sn_caspian, // 0xe3
        sat_sn_drake, // 0xe4
        sat_ww_firefly, // 0xe5
        sat_ww_mantis, // 0xe6
        sat_ww_mantis2, // 0xe7
        sat_ww_ruby, // 0xe8
        specialty_null, // 0xe9
        support_box_mp, // 0xea
        t10_ar_p01_coslo723, // 0xeb
        t10_ar_p02_aking74, // 0xec
        t10_ar_p04_clove, // 0xed
        t10_ar_p05_fable, // 0xee
        t10_ar_p05_rmary2, // 0xef
        t10_ar_p06_asvalor, // 0xf0
        t10_ar_p22_able18, // 0xf1
        t10_ar_p23_love85, // 0xf2
        t10_ar_p34_tbaker, // 0xf3
        t10_ar_p45_kent, // 0xf4
        t10_ar_p47_gilroy, // 0xf5
        t10_ar_p49_fresno, // 0xf6
        t10_ar_p54_aspen, // 0xf7
        t10_ar_p56_milan, // 0xf8
        t10_dm_p01_sroger25, // 0xf9
        t10_dm_p02_aeasy, // 0xfa
        t10_dm_p03_sgeorge550, // 0xfb
        t10_dm_p05_falove, // 0xfc
        t10_dm_p09_svalor, // 0xfd
        t10_dm_p50_erie, // 0xfe
        t10_knifestab, // 0xff
        t10_ks_compound, // 0x100
        t10_ks_deathmachine, // 0x101
        t10_ks_handcannon, // 0x102
        t10_ks_m202, // 0x103
        t10_ks_warmachine, // 0x104
        t10_la_mangler_cannon, // 0x105
        t10_la_p17_pable3, // 0x106
        t10_la_p18_stisaac, // 0x107
        t10_la_p19_opalww, // 0x108
        t10_lm_dblmg_deathmachine, // 0x109
        t10_lm_p01_aroger10, // 0x10a
        t10_lm_p02_puncle21, // 0x10b
        t10_lm_p07_ksugar58, // 0x10c
        t10_lm_p19_jetgun, // 0x10d
        t10_lm_p25_drillgun, // 0x10e
        t10_lm_p33_uxray, // 0x10f
        t10_lm_p53_mesa, // 0x110
        t10_me_climbfists, // 0x111
        t10_me_diveknife, // 0x112
        t10_me_fists, // 0x113
        t10_me_p15_knife, // 0x114
        t10_me_p16_bat, // 0x115
        t10_me_p30_cleaver, // 0x116
        t10_me_p31_drill, // 0x117
        t10_me_p36_skateboard, // 0x118
        t10_me_p37_bobastreakkatanas, // 0x119
        t10_me_p37_katanas, // 0x11a
        t10_me_p38_bobastreaksais, // 0x11b
        t10_me_p38_sais, // 0x11c
        t10_me_p39_bobastreaknunchaku, // 0x11d
        t10_me_p39_nunchaku, // 0x11e
        t10_me_p40_bobastreakbostaff, // 0x11f
        t10_me_p40_bostaff, // 0x120
        t10_me_p48_keene, // 0x121
        t10_me_p51_pickaxe, // 0x122
        t10_me_p55_bgloves, // 0x123
        t10_me_p55_bknuckles, // 0x124
        t10_me_p59_csaw, // 0x125
        t10_me_zombie_hellhound, // 0x126
        t10_me_zombie_melee, // 0x127
        t10_me_zombie_mimic, // 0x128
        t10_me_zombiefists, // 0x129
        t10_pi_handcannon_oic, // 0x12a
        t10_pi_p12_paris30, // 0x12b
        t10_pi_p13_usugar9, // 0x12c
        t10_pi_p14_mable, // 0x12d
        t10_pi_p14_stiger, // 0x12e
        t10_pi_p19_raygun, // 0x12f
        t10_pi_p19_raygunmark2, // 0x130
        t10_pi_p42_pyork, // 0x131
        t10_sh_p10_moslo500, // 0x132
        t10_sh_p11_olove, // 0x133
        t10_sh_p25_uncle12, // 0x134
        t10_sh_p27_jhavana, // 0x135
        t10_sl_p29_goslo, // 0x136
        t10_sl_p35_blauncher, // 0x137
        t10_sl_p44_napa, // 0x138
        t10_sl_p58_wand, // 0x139
        t10_sm_p02_geasy9, // 0x13a
        t10_sm_p03_safox, // 0x13b
        t10_sm_p04_chuck9, // 0x13c
        t10_sm_p06_sroger3, // 0x13d
        t10_sm_p12_roger31, // 0x13e
        t10_sm_p21_pparis90, // 0x13f
        t10_sm_p28_saug, // 0x140
        t10_sm_p41_perth, // 0x141
        t10_sm_p43_schuck, // 0x142
        t10_sm_p52_lisbon, // 0x143
        t10_sm_p57_mpug40, // 0x144
        t10_sn_p08_ultiger, // 0x145
        t10_sn_p09_droger, // 0x146
        t10_sn_p24_love96, // 0x147
        t10_sn_p26_mary82, // 0x148
        t10_sn_p46_hugo, // 0x149
        t10_swimfists // 0x14a
    };

    // idx 0x1 members: 0x88 type: 5
    enum BaseGameMode {
        aon, // 0x0
        dm, // 0x1
        war, // 0x2
        war_bigmap, // 0x3
        sd, // 0x4
        sab, // 0x5
        dom, // 0x6
        koth, // 0x7
        ctf, // 0x8
        dd, // 0x9
        conf, // 0xa
        control, // 0xb
        tdef, // 0xc
        siege, // 0xd
        grnd, // 0xe
        tjugg, // 0xf
        jugg, // 0x10
        gun, // 0x11
        infect, // 0x12
        oic, // 0x13
        mugger, // 0x14
        blitz, // 0x15
        sr, // 0x16
        grind, // 0x17
        sotf, // 0x18
        sotf_ffa, // 0x19
        assault, // 0x1a
        aliens, // 0x1b
        cp_survival, // 0x1c
        cp_wave_sv, // 0x1d
        cp_specops, // 0x1e
        zombie, // 0x1f
        escape, // 0x20
        cp_pvpve, // 0x21
        cp_strike, // 0x22
        cp_trials, // 0x23
        ball, // 0x24
        front, // 0x25
        arena, // 0x26
        cmd, // 0x27
        br, // 0x28
        dmz, // 0x29
        cyber, // 0x2a
        rush, // 0x2b
        esc, // 0x2c
        vip, // 0x2d
        btm, // 0x2e
        rugby, // 0x2f
        arm, // 0x30
        mtmc, // 0x31
        snatch, // 0x32
        hq, // 0x33
        defcon, // 0x34
        pill, // 0x35
        brm, // 0x36
        hvt, // 0x37
        trial, // 0x38
        brtdm, // 0x39
        br_risk, // 0x3a
        incursion, // 0x3b
        missions, // 0x3c
        cqc, // 0x3d
        plunder, // 0x3e
        ko, // 0x3f
        risk, // 0x40
        hstg, // 0x41
        fr, // 0x42
        gwbomb, // 0x43
        rescue, // 0x44
        landgrab, // 0x45
        elim, // 0x46
        gwai, // 0x47
        bounty, // 0x48
        zm_rb, // 0x49
        gwtdm, // 0x4a
        ob, // 0x4b
        dungeons, // 0x4c
        resurgence, // 0x4d
        resurgence_loaded, // 0x4e
        prop_royale, // 0x4f
        exgm, // 0x50
        kingslayer, // 0x51
        mini, // 0x52
        mini_mgl, // 0x53
        resurgence_mgl, // 0x54
        rsurge, // 0x55
        truckwar, // 0x56
        vanilla, // 0x57
        zxp, // 0x58
        benchmark, // 0x59
        ballmode, // 0x5a
        brtdm_mgl, // 0x5b
        conflict, // 0x5c
        havoc, // 0x5d
        bigctf, // 0x5e
        xfire, // 0x5f
        robj, // 0x60
        zm_turned, // 0x61
        wm, // 0x62
        escort, // 0x63
        training_course, // 0x64
        br_auto, // 0x65
        ctdm, // 0x66
        rogue, // 0x67
        fireteam, // 0x68
        augment, // 0x69
        tag_trap, // 0x6a
        prop, // 0x6b
        counter, // 0x6c
        hijack, // 0x6d
        towerclimb, // 0x6e
        sharp, // 0x6f
        gold, // 0x70
        zm_rb_classic, // 0x71
        zm_grief, // 0x72
        zm_nap, // 0x73
        skirmish, // 0x74
        zm_guided, // 0x75
        armorup, // 0x76
        zm_rb_jingle, // 0x77
        zm_rb_dead_light, // 0x78
        zm_rb_cranked, // 0x79
        wargames, // 0x7a
        multi, // 0x7b
        boba, // 0x7c
        sugar, // 0x7d
        stop_and_go, // 0x7e
        zm_training_course, // 0x7f
        zm_rb_loot_exfil, // 0x80
        zm_rb_startroom, // 0x81
        zm_panda, // 0x82
        ztron, // 0x83
        sabattack, // 0x84
        zm_rb_survival, // 0x85
        zm_rb_r_mod, // 0x86
        free_run // 0x87
    };

    // idx 0x2 members: 0x62 type: 5
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
        equip_decoy_trinket, // 0x16
        equip_decryption_device, // 0x17
        equip_deployable_kiosk_drop, // 0x18
        equip_drone_launcher, // 0x19
        equip_emp, // 0x1a
        equip_europa_remote_control, // 0x1b
        equip_flash, // 0x1c
        equip_frag, // 0x1d
        equip_gas_grenade, // 0x1e
        equip_gas_trap_plantable, // 0x1f
        equip_geigercounter, // 0x20
        equip_grappling_hook, // 0x21
        equip_hb_sensor, // 0x22
        equip_ied, // 0x23
        equip_impact_grenade, // 0x24
        equip_inc_dark, // 0x25
        equip_inc_earth, // 0x26
        equip_inc_electric, // 0x27
        equip_inc_fire, // 0x28
        equip_inc_light, // 0x29
        equip_inhibitor, // 0x2a
        equip_jammer, // 0x2b
        equip_landmine, // 0x2c
        equip_mini_sentry, // 0x2d
        equip_molotov, // 0x2e
        equip_monkey_bomb, // 0x2f
        equip_munitionsbox, // 0x30
        equip_pop_candy, // 0x31
        equip_proximity_alarm, // 0x32
        equip_rallying_cry, // 0x33
        equip_recondrone, // 0x34
        equip_redeploy_drone_beacon, // 0x35
        equip_reinforcement_flare, // 0x36
        equip_rock, // 0x37
        equip_semtex, // 0x38
        equip_semtex_mike32_v5008, // 0x39
        equip_sensor_dart, // 0x3a
        equip_sensor_grenade, // 0x3b
        equip_shockstick, // 0x3c
        equip_smart_seeker, // 0x3d
        equip_smoke, // 0x3e
        equip_smoke_gl, // 0x3f
        equip_snowball, // 0x40
        equip_super_aether_shroud, // 0x41
        equip_super_black_hat, // 0x42
        equip_super_bubble_shield, // 0x43
        equip_super_cradle_gas_grenade, // 0x44
        equip_super_dash, // 0x45
        equip_super_energy_mine, // 0x46
        equip_super_flame_blast, // 0x47
        equip_super_frenzied_guard, // 0x48
        equip_super_frost_blast, // 0x49
        equip_super_grappling_hook, // 0x4a
        equip_super_grappling_hook_sm, // 0x4b
        equip_super_healing_aura, // 0x4c
        equip_super_mary_paris, // 0x4d
        equip_super_mega_jump, // 0x4e
        equip_super_monkey_bomb, // 0x4f
        equip_super_overcharge, // 0x50
        equip_super_portal_summon, // 0x51
        equip_super_rallying_cry, // 0x52
        equip_super_redeploy, // 0x53
        equip_super_survival_life_drain, // 0x54
        equip_super_teleport, // 0x55
        equip_super_tesla_storm, // 0x56
        equip_super_toxic_growth, // 0x57
        equip_super_vehicle_summoner, // 0x58
        equip_tac_cover, // 0x59
        equip_tac_insert, // 0x5a
        equip_thermite, // 0x5b
        equip_thermobaric_grenade, // 0x5c
        equip_trophy, // 0x5d
        equip_utilitybox, // 0x5e
        equip_vacuum_seal_device, // 0x5f
        equip_zombie_ranged_attack, // 0x60
        none // 0x61
    };

    // idx 0x3 members: 0x35 type: 5
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

    // idx 0x4 members: 0xb6 type: 5
    enum SatSuper {
        none, // 0x0
        super_acoustic_amp, // 0x1
        super_active_camo, // 0x2
        super_active_camo_ob, // 0x3
        super_aether_shroud, // 0x4
        super_ammo_drop, // 0x5
        super_ammo_drop_ob, // 0x6
        super_annihilator, // 0x7
        super_annihilator_ob, // 0x8
        super_armor_drop, // 0x9
        super_armory, // 0xa
        super_assault_shield, // 0xb
        super_balloon_extract, // 0xc
        super_battlerage, // 0xd
        super_black_hat, // 0xe
        super_black_hat_ob, // 0xf
        super_blastshield_drop, // 0x10
        super_blinding_turret, // 0x11
        super_blowtorch, // 0x12
        super_boba, // 0x13
        super_body_cam_hack, // 0x14
        super_br_aether_upgrade, // 0x15
        super_br_extract, // 0x16
        super_bradley, // 0x17
        super_bubble_shield, // 0x18
        super_bubble_shield_ob, // 0x19
        super_capture_bot, // 0x1a
        super_chopper_gunner, // 0x1b
        super_combat_hologram, // 0x1c
        super_combat_link, // 0x1d
        super_comm_scrambler, // 0x1e
        super_contract_skipper, // 0x1f
        super_cradle_gas_grenade, // 0x20
        super_cradle_gas_grenade_ob, // 0x21
        super_cranked, // 0x22
        super_cruise_predator, // 0x23
        super_dark_flare, // 0x24
        super_dark_flare_13s, // 0x25
        super_dark_flare_shadow_ball, // 0x26
        super_dash, // 0x27
        super_dash_ob, // 0x28
        super_deadsilence, // 0x29
        super_death_machine, // 0x2a
        super_death_machine_ob, // 0x2b
        super_decon_station, // 0x2c
        super_defibrillator, // 0x2d
        super_deployable_kiosk, // 0x2e
        super_deployed_decoy, // 0x2f
        super_door_barricade, // 0x30
        super_drone_launcher, // 0x31
        super_drone_launcher_ob, // 0x32
        super_electric_discharge, // 0x33
        super_emp_drone, // 0x34
        super_emp_pulse, // 0x35
        super_energy_mine, // 0x36
        super_energy_mine_ob, // 0x37
        super_evg, // 0x38
        super_flame_blast, // 0x39
        super_flame_blast_ob, // 0x3a
        super_frenzied_guard, // 0x3b
        super_frost_blast, // 0x3c
        super_frost_blast_ob, // 0x3d
        super_fulton, // 0x3e
        super_fulton_marker, // 0x3f
        super_gas_trap, // 0x40
        super_grappling_hook, // 0x41
        super_grappling_hook_sm, // 0x42
        super_guild_bot, // 0x43
        super_guild_bot_ob, // 0x44
        super_haunted_drop, // 0x45
        super_hb_sensor, // 0x46
        super_healing_aura, // 0x47
        super_high_jump, // 0x48
        super_honeypot, // 0x49
        super_jammer, // 0x4a
        super_juggernaut, // 0x4b
        super_kazimir, // 0x4c
        super_kazimir_ob, // 0x4d
        super_la_gromeo, // 0x4e
        super_la_jp22_dromeo, // 0x4f
        super_la_juliet, // 0x50
        super_la_kgolf, // 0x51
        super_la_mike32, // 0x52
        super_la_rpapa7, // 0x53
        super_landmine, // 0x54
        super_laser_charge, // 0x55
        super_laststand_syringe, // 0x56
        super_leader_drop, // 0x57
        super_loadout_drop, // 0x58
        super_mary_paris, // 0x59
        super_med_box, // 0x5a
        super_med_kit, // 0x5b
        super_medical_box, // 0x5c
        super_mega_jump, // 0x5d
        super_mega_jump_ob, // 0x5e
        super_melee_jugg, // 0x5f
        super_mini_nuke, // 0x60
        super_monkey_bomb, // 0x61
        super_monkey_bomb_ob, // 0x62
        super_mutation, // 0x63
        super_mutation_boba_stim, // 0x64
        super_mutation_density_dive, // 0x65
        super_mutation_give_density_dive, // 0x66
        super_mutation_give_jump, // 0x67
        super_mutation_jump, // 0x68
        super_mutation_ninja_sense, // 0x69
        super_mutation_ninja_vanish, // 0x6a
        super_mutation_shell_shocked, // 0x6b
        super_mutation_shuriken_fury, // 0x6c
        super_mutation_turtle_power, // 0x6d
        super_none, // 0x6e
        super_nvg, // 0x6f
        super_overcharge, // 0x70
        super_overcharge_ob, // 0x71
        super_oxygen_mask, // 0x72
        super_oxygenmask, // 0x73
        super_pac_sentry, // 0x74
        super_personal_redeploy_drone, // 0x75
        super_pop_candy, // 0x76
        super_portal_summon, // 0x77
        super_portal_summon_ob, // 0x78
        super_precision_airstrike, // 0x79
        super_rallying_cry, // 0x7a
        super_rallying_cry_ob, // 0x7b
        super_razor_wire, // 0x7c
        super_recon_dart, // 0x7d
        super_recon_drone, // 0x7e
        super_redeploy, // 0x7f
        super_redeploy_drone_beacon, // 0x80
        super_redeploy_ob, // 0x81
        super_reinforcement_flare, // 0x82
        super_remote_detonate, // 0x83
        super_riot_shield, // 0x84
        super_sam_airburst_turret, // 0x85
        super_scramble, // 0x86
        super_select, // 0x87
        super_self_revive_box, // 0x88
        super_shadow_break, // 0x89
        super_shadow_break_ob, // 0x8a
        super_smoke_airdrop, // 0x8b
        super_smoke_shroud, // 0x8c
        super_smoke_wall, // 0x8d
        super_sonar_pulse, // 0x8e
        super_sound_veil, // 0x8f
        super_spykit, // 0x90
        super_squadrage, // 0x91
        super_stealth_perks, // 0x92
        super_stimpistol, // 0x93
        super_supply_drop, // 0x94
        super_support_box, // 0x95
        super_suppression_rounds, // 0x96
        super_survival_life_drain, // 0x97
        super_survival_life_drain_ob, // 0x98
        super_sweeper_drones, // 0x99
        super_tac_camera, // 0x9a
        super_tac_cover, // 0x9b
        super_tac_insert, // 0x9c
        super_tar_bomb, // 0x9d
        super_teleport, // 0x9e
        super_teleport_deploy, // 0x9f
        super_teleport_ob, // 0xa0
        super_temp_v, // 0xa1
        super_tesla_coil, // 0xa2
        super_tesla_storm, // 0xa3
        super_test, // 0xa4
        super_toma_strike, // 0xa5
        super_toxic_growth, // 0xa6
        super_toxic_growth_ob, // 0xa7
        super_trauma_kit, // 0xa8
        super_treasure_hunter, // 0xa9
        super_treasure_hunter_ob, // 0xaa
        super_trophy, // 0xab
        super_uav, // 0xac
        super_utility_drop, // 0xad
        super_vehicle_drop, // 0xae
        super_vehicle_summoner, // 0xaf
        super_vehicle_summoner_ob, // 0xb0
        super_vision_pulse, // 0xb1
        super_vision_pulse_ob, // 0xb2
        super_war_machine, // 0xb3
        super_war_machine_ob, // 0xb4
        super_weapon_drop // 0xb5
    };

    // idx 0x5 members: 0xc type: 5
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

    // idx 0x6 members: 0x3 type: 5
    enum MatchResult {
        loss, // 0x0
        win, // 0x1
        draw // 0x2
    };

    // idx 0x7 members: 0xd type: 5
    enum SatCombatRecordWeaponClass {
        sat_none, // 0x0
        sat_assault, // 0x1
        sat_smg, // 0x2
        sat_shotgun, // 0x3
        sat_lmg, // 0x4
        sat_dmr, // 0x5
        sat_sniper, // 0x6
        sat_pistol, // 0x7
        sat_projectile, // 0x8
        sat_melee, // 0x9
        sat_melee2, // 0xa
        sat_battle, // 0xb
        sat_active_armory // 0xc
    };

    // root: bitSize: 0x25ea50, members: 9

    // offset: 0x0, bitSize: 0x22c80(0x4590 Byte(s)), array:0xc(hti:0x5)
    ScorestreakStatsList killstreakstatslist[TimeScope];
    // offset: 0x22c80, bitSize: 0x34e0(0x69c Byte(s)), array:0xc(hti:0x5)
    OverviewStats overviewstats[TimeScope];
    // offset: 0x26160, bitSize: 0x193680(0x326d0 Byte(s)), array:0xc(hti:0x5)
    WeaponStatsList weaponstatslist[TimeScope];
    // offset: 0x1b97e0, bitSize: 0x29580(0x52b0 Byte(s)), array:0xc(hti:0x5)
    EquipmentStatsList equipmentstatslist[TimeScope];
    // offset: 0x1e2d60, bitSize: 0x77700(0xeee0 Byte(s)), array:0xc(hti:0x5)
    FieldUpgradeStatsList fieldupgradestatslist[TimeScope];
    // offset: 0x25a460, bitSize: 0xde0(0x1bc Byte(s)), array:0xc(hti:0x5)
    PlacementStatsGroup placementstatsgrouplist[TimeScope];
    // offset: 0x25b240, bitSize: 0x518(0xa3 Byte(s))
    RecentMatchStats lastmatch;
    // offset: 0x25b758, bitSize: 0x32f0(0x65e Byte(s)), array:0xa(hti:0xffff)
    RecentMatchStats recentmatches[10];
    // offset: 0x25ea48, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
};

