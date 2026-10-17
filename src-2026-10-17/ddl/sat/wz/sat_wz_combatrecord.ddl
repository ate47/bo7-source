// file .... ddl\sat\wz\sat_wz_combatrecord.ddl

version 1 {
    // enums ..... 8 (0x8)
    // structs ... 15 (0xf)
    // bit size .. 2821984 (0x2b0f60)
    // byte size . 352748 (0x561ec)
    // archive ... hash_4d21f0e83d52b134

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
        uint killstreakdestructions;
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

    // bitSize: 0x26b20, members: 1
    struct WeaponStatsList {
        // offset: 0x0, bitSize: 0x26b20(0x4d64 Byte(s)), array:0x17d(hti:0x0)
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
        Equipment equipment;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint furthestkill;
        // offset: 0x88, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x3f90, members: 1
    struct EquipmentStatsList {
        // offset: 0x0, bitSize: 0x3f90(0x7f2 Byte(s)), array:0x71(hti:0x2)
        EquipmentStats equipmentstats[Equipment];
    };

    // bitSize: 0xe0, members: 10
    struct FieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        Super super;
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

    // bitSize: 0xa560, members: 1
    struct FieldUpgradeStatsList {
        // offset: 0x0, bitSize: 0xa560(0x14ac Byte(s)), array:0xbd(hti:0x4)
        FieldUpgradeStats fieldupgradestats[Super];
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
        Killstreak killstreak;
        // offset: 0xb8, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0xd8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x3b80, members: 1
    struct ScorestreakStatsList {
        // offset: 0x0, bitSize: 0x3b80(0x770 Byte(s)), array:0x44(hti:0x3)
        ScorestreakStats killstreakstats[Killstreak];
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

    // bitSize: 0x558, members: 23
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
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int srdelta;
        // offset: 0x280, bitSize: 0x100(0x20 Byte(s))
        string(32) gametype;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        uint deadliestweapondeaths;
        // offset: 0x3a0, bitSize: 0x20(0x4 Byte(s))
        float deadliestweaponaccuracy;
        // offset: 0x3c0, bitSize: 0x20(0x4 Byte(s))
        uint damage;
        // offset: 0x3e0, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x400, bitSize: 0x20(0x4 Byte(s))
        uint specialkills;
        // offset: 0x420, bitSize: 0x20(0x4 Byte(s))
        int matchplacement;
        // offset: 0x440, bitSize: 0x10(0x2 Byte(s))
        SatWZWeapons deadliestweaponname;
        // offset: 0x450, bitSize: 0x100(0x20 Byte(s))
        string(32) gametypevariant;
        // offset: 0x550, bitSize: 0x1
        bool valid;
        // offset: 0x551, bitSize: 0x1
        bool hash_70493287e369cdb7;
    };

    // bitSize: 0x488, members: 19
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
        // offset: 0x460, bitSize: 0x20(0x4 Byte(s))
        uint hash_1f4e321290d76bc3;
        // offset: 0x480, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x68, members: 5
    struct PrestigeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x60, bitSize: 0x1
        bool valid;
    };

    // idx 0x0 members: 0x17d type: 5
    enum SatWZWeapons {
        none, // 0x0
        cruise_proj_valkyrie_t10_mp, // 0x1
        iw9_ar_acharlie300, // 0x2
        iw9_ar_akilo, // 0x3
        iw9_ar_akilo105, // 0x4
        iw9_ar_akilo74, // 0x5
        iw9_ar_augolf, // 0x6
        iw9_ar_falpha, // 0x7
        iw9_ar_fecho, // 0x8
        iw9_ar_golf3, // 0x9
        iw9_ar_helima, // 0xa
        iw9_ar_kilo53, // 0xb
        iw9_ar_malima, // 0xc
        iw9_ar_mcbravo, // 0xd
        iw9_ar_mcharlie, // 0xe
        iw9_ar_mike16, // 0xf
        iw9_ar_mike4, // 0x10
        iw9_ar_ralpha, // 0x11
        iw9_ar_scharlie, // 0x12
        iw9_ar_schotel, // 0x13
        iw9_br_msecho, // 0x14
        iw9_br_ngsierra, // 0x15
        iw9_br_soscar14, // 0x16
        iw9_cyberemp, // 0x17
        iw9_dm_crossbow, // 0x18
        iw9_dm_la700, // 0x19
        iw9_dm_mike14, // 0x1a
        iw9_dm_mike24, // 0x1b
        iw9_dm_pgolf1, // 0x1c
        iw9_dm_sa700, // 0x1d
        iw9_dm_sbeta, // 0x1e
        iw9_dm_scromeo, // 0x1f
        iw9_dm_stango25, // 0x20
        iw9_dm_xmike2010, // 0x21
        iw9_drown, // 0x22
        iw9_knifestab, // 0x23
        iw9_la_gromeo, // 0x24
        iw9_la_juliet, // 0x25
        iw9_la_kgolf, // 0x26
        iw9_la_mike32, // 0x27
        iw9_la_mike32biolab, // 0x28
        iw9_la_rpapa7, // 0x29
        iw9_lm_ahotel, // 0x2a
        iw9_lm_dblmg, // 0x2b
        iw9_lm_dblmg2, // 0x2c
        iw9_lm_foxtrot, // 0x2d
        iw9_lm_kilo21, // 0x2e
        iw9_lm_mkilo3, // 0x2f
        iw9_lm_ngolf7, // 0x30
        iw9_lm_rkilo, // 0x31
        iw9_lm_slima, // 0x32
        iw9_me_buzzsaw, // 0x33
        iw9_me_climbfists, // 0x34
        iw9_me_diveknife, // 0x35
        iw9_me_fists, // 0x36
        iw9_me_kamas, // 0x37
        iw9_me_knife, // 0x38
        iw9_me_pickaxe, // 0x39
        iw9_me_riotshield, // 0x3a
        iw9_me_rusherknife, // 0x3b
        iw9_me_superfists, // 0x3c
        iw9_me_sword01, // 0x3d
        iw9_me_tonfa, // 0x3e
        iw9_nukecore_mp, // 0x3f
        iw9_oxygenmask, // 0x40
        iw9_pi_decho, // 0x41
        iw9_pi_dechoauto, // 0x42
        iw9_pi_golf17, // 0x43
        iw9_pi_golf18, // 0x44
        iw9_pi_mike2011, // 0x45
        iw9_pi_papa220, // 0x46
        iw9_pi_stimpistol, // 0x47
        iw9_pi_swhiskey, // 0x48
        iw9_pi_tango9, // 0x49
        iw9_sh_charlie725, // 0x4a
        iw9_sh_mbravo, // 0x4b
        iw9_sh_mike1014, // 0x4c
        iw9_sh_mviktor, // 0x4d
        iw9_sh_tsierra12, // 0x4e
        iw9_sh_vecho, // 0x4f
        iw9_sm_acharlie45, // 0x50
        iw9_sm_acharlie9, // 0x51
        iw9_sm_alpha57, // 0x52
        iw9_sm_apapa, // 0x53
        iw9_sm_aviktor, // 0x54
        iw9_sm_beta, // 0x55
        iw9_sm_mpapa5, // 0x56
        iw9_sm_mpapa7, // 0x57
        iw9_sm_mpapax, // 0x58
        iw9_sm_papa90, // 0x59
        iw9_sm_sdelta, // 0x5a
        iw9_sm_victor, // 0x5b
        iw9_sn_alpha50, // 0x5c
        iw9_sn_india, // 0x5d
        iw9_sn_limax, // 0x5e
        iw9_sn_mromeo, // 0x5f
        iw9_sn_walpha, // 0x60
        iw9_swimfists, // 0x61
        jup_amp_knifestab_mp, // 0x62
        jup_ar_dg2, // 0x63
        jup_cp01_sh_aromeo410, // 0x64
        jup_cp01_sm_coscar635, // 0x65
        jup_cp01_sm_pcharlie9, // 0x66
        jup_cp05_lm_halpha, // 0x67
        jup_cp06_ar_falpha, // 0x68
        jup_cp08_br_xmike5, // 0x69
        jup_cp15_lm_mkilo3, // 0x6a
        jup_cp24_pi_glima21, // 0x6b
        jup_jp01_ar_golf36, // 0x6c
        jup_jp01_dm_slima8, // 0x6d
        jup_jp01_lm_mgolf36, // 0x6e
        jup_jp02_ar_bromeo805, // 0x6f
        jup_jp02_br_bromeo2, // 0x70
        jup_jp02_dm_bromeop, // 0x71
        jup_jp02_sm_scharlie3, // 0x72
        jup_jp03_ar_aromeo160, // 0x73
        jup_jp03_br_aromeo200, // 0x74
        jup_jp03_sm_pmike, // 0x75
        jup_jp04_sm_lwhiskey, // 0x76
        jup_jp04_sm_umike, // 0x77
        jup_jp05_ar_foxtrot2000, // 0x78
        jup_jp06_lm_pkilop, // 0x79
        jup_jp07_pi_uzulum, // 0x7a
        jup_jp07_sm_uzulu, // 0x7b
        jup_jp07_sm_uzulup, // 0x7c
        jup_jp08_ar_qbravo97, // 0x7d
        jup_jp08_lm_qbravo95lsw, // 0x7e
        jup_jp09_sh_oromeo12, // 0x7f
        jup_jp10_sn_cdelta50, // 0x80
        jup_jp12_pi_mike93, // 0x81
        jup_jp13_dm_svictork, // 0x82
        jup_jp13_sn_svictor, // 0x83
        jup_jp14_pi_rsierra12, // 0x84
        jup_jp16_sh_recho870, // 0x85
        jup_jp17_sn_hsierra, // 0x86
        jup_jp19_ar_acharlie, // 0x87
        jup_jp19_br_acharlie450, // 0x88
        jup_jp19_dm_acharlied, // 0x89
        jup_jp20_lm_evictor, // 0x8a
        jup_jp22_la_dromeo, // 0x8b
        jup_jp23_me_kalpha, // 0x8c
        jup_jp23_me_knife, // 0x8d
        jup_jp23_me_pdango, // 0x8e
        jup_jp23_me_pdango_arcade, // 0x8f
        jup_jp23_me_shotel, // 0x90
        jup_jp23_me_shotel_arcade, // 0x91
        jup_jp23_me_spear, // 0x92
        jup_jp23_me_swhiskey, // 0x93
        jup_jp25_ar_talpha95, // 0x94
        jup_jp25_sm_talpham, // 0x95
        jup_jp26_la_cluster, // 0x96
        jup_jp26_la_cluster32, // 0x97
        jup_jp26_la_mike32, // 0x98
        jup_jp28_lm_rpapa20, // 0x99
        jup_jp31_dm_compound, // 0x9a
        jup_jp32_pi_mpapa9, // 0x9b
        jup_jp34_ar_balpha27, // 0x9c
        jup_jp35_sn_moscar, // 0x9d
        jup_jp36_ar_anov94, // 0x9e
        jup_jp36_sn_boscar, // 0x9f
        jup_jp37_dm_kappa98, // 0xa0
        jup_jp38_sh_spapa12, // 0xa1
        jup_jp40_br_hcharlie36, // 0xa2
        jup_jp41_sm_kpappa50, // 0xa3
        jup_jp44_ar_stango44, // 0xa4
        jup_la_humangun, // 0xa5
        jup_la_plasmagun, // 0xa6
        jup_me_axe, // 0xa7
        jup_me_glassshiv, // 0xa8
        jup_me_zombie_hellhound, // 0xa9
        jup_me_zombie_melee, // 0xaa
        jup_me_zombie_mimic, // 0xab
        jup_pi_goldengun, // 0xac
        jup_pi_raygun, // 0xad
        sat_ar_condor, // 0xae
        sat_ar_eagle, // 0xaf
        sat_ar_egret, // 0xb0
        sat_ar_falcon, // 0xb1
        sat_ar_hawk, // 0xb2
        sat_ar_hawkexotic, // 0xb3
        sat_ar_heron, // 0xb4
        sat_ar_kite, // 0xb5
        sat_ar_kiteexotic, // 0xb6
        sat_ar_macaw, // 0xb7
        sat_ar_vulture, // 0xb8
        sat_ar_ztrondg2, // 0xb9
        sat_dm_kara, // 0xba
        sat_dm_oman, // 0xbb
        sat_dm_scotia, // 0xbc
        sat_dm_scotiaexotic, // 0xbd
        sat_dm_solomon, // 0xbe
        sat_ks_annihilator, // 0xbf
        sat_ks_deathmachine, // 0xc0
        sat_ks_handcannon, // 0xc1
        sat_ks_smartgun, // 0xc2
        sat_ks_warmachine, // 0xc3
        sat_la_fang, // 0xc4
        sat_la_mutant_injection_cannon, // 0xc5
        sat_la_polis, // 0xc6
        sat_la_zm_dinj, // 0xc7
        sat_la_ztroncrossbow, // 0xc8
        sat_la_ztronpable3, // 0xc9
        sat_la_ztronwarmachine, // 0xca
        sat_lm_deathmachine, // 0xcb
        sat_lm_hades, // 0xcc
        sat_lm_typhon, // 0xcd
        sat_lm_zeus, // 0xce
        sat_lm_zeusexotic, // 0xcf
        sat_lm_ztrondeathmachine, // 0xd0
        sat_lm_ztronjetgun, // 0xd1
        sat_lm_ztronlmg, // 0xd2
        sat_me_ballisticknife, // 0xd3
        sat_me_knife, // 0xd4
        sat_me_saiph, // 0xd5
        sat_me_shockbaton, // 0xd6
        sat_me_zombie_melee, // 0xd7
        sat_me_zombie_mimic, // 0xd8
        sat_mp_assaultshield, // 0xd9
        sat_mp_black_hat, // 0xda
        sat_ob_ks_warmachine, // 0xdb
        sat_pi_alcor, // 0xdc
        sat_pi_atlas, // 0xdd
        sat_pi_orion, // 0xde
        sat_pi_timir, // 0xdf
        sat_pi_ztronraygun, // 0xe0
        sat_sh_akita, // 0xe1
        sat_sh_corso, // 0xe2
        sat_sh_corsoexotic, // 0xe3
        sat_sh_husky, // 0xe4
        sat_sh_shepherd, // 0xe5
        sat_sh_ztronshotgun, // 0xe6
        sat_sl_crossbow, // 0xe7
        sat_sl_nembus, // 0xe8
        sat_sm_bear, // 0xe9
        sat_sm_bengal, // 0xea
        sat_sm_cobra, // 0xeb
        sat_sm_cobraexotic, // 0xec
        sat_sm_gecko, // 0xed
        sat_sm_hyena, // 0xee
        sat_sm_komodo, // 0xef
        sat_sm_orca, // 0xf0
        sat_sm_otter, // 0xf1
        sat_sm_puma, // 0xf2
        sat_sm_zebra, // 0xf3
        sat_sm_zebraexotic, // 0xf4
        sat_sn_aden, // 0xf5
        sat_sn_baltic, // 0xf6
        sat_sn_caspian, // 0xf7
        sat_sn_drake, // 0xf8
        sat_sn_drakeexotic, // 0xf9
        sat_ww_firefly, // 0xfa
        sat_ww_locust, // 0xfb
        sat_ww_mantis, // 0xfc
        sat_ww_raygun, // 0xfd
        sat_ww_raygunmark2, // 0xfe
        sat_ww_ruby, // 0xff
        sat_ww_hornet, // 0x100
        saw_ar_daisy, // 0x101
        saw_daisy_minigun, // 0x102
        saw_dm_daisy, // 0x103
        saw_la_daisy, // 0x104
        saw_pi_daisy, // 0x105
        saw_sh_daisy, // 0x106
        support_box_mp, // 0x107
        t10_ar_p01_coslo723, // 0x108
        t10_ar_p02_aking74, // 0x109
        t10_ar_p04_clove, // 0x10a
        t10_ar_p05_fable, // 0x10b
        t10_ar_p05_rmary2, // 0x10c
        t10_ar_p06_asvalor, // 0x10d
        t10_ar_p22_able18, // 0x10e
        t10_ar_p23_love85, // 0x10f
        t10_ar_p34_tbaker, // 0x110
        t10_ar_p45_kent, // 0x111
        t10_ar_p47_gilroy, // 0x112
        t10_ar_p49_fresno, // 0x113
        t10_ar_p54_aspen, // 0x114
        t10_ar_p56_milan, // 0x115
        t10_dm_p01_sroger25, // 0x116
        t10_dm_p02_aeasy, // 0x117
        t10_dm_p03_sgeorge550, // 0x118
        t10_dm_p05_falove, // 0x119
        t10_dm_p09_svalor, // 0x11a
        t10_dm_p50_erie, // 0x11b
        t10_ks_compound, // 0x11c
        t10_ks_deathmachine, // 0x11d
        t10_ks_handcannon, // 0x11e
        t10_ks_m202, // 0x11f
        t10_ks_warmachine, // 0x120
        t10_la_mangler_cannon, // 0x121
        t10_la_p17_pable3, // 0x122
        t10_la_p18_stisaac, // 0x123
        t10_lm_dblmg_deathmachine, // 0x124
        t10_lm_p01_aroger10, // 0x125
        t10_lm_p02_puncle21, // 0x126
        t10_lm_p07_ksugar58, // 0x127
        t10_lm_p33_uxray, // 0x128
        t10_lm_p53_mesa, // 0x129
        t10_me_climbfists, // 0x12a
        t10_me_diveknife, // 0x12b
        t10_me_fists, // 0x12c
        t10_me_p15_knife, // 0x12d
        t10_me_p16_bat, // 0x12e
        t10_me_p30_cleaver, // 0x12f
        t10_me_p31_drill, // 0x130
        t10_me_p36_skateboard, // 0x131
        t10_me_p37_bobastreakkatanas, // 0x132
        t10_me_p37_katanas, // 0x133
        t10_me_p38_bobastreaksais, // 0x134
        t10_me_p38_sais, // 0x135
        t10_me_p39_bobastreaknunchaku, // 0x136
        t10_me_p39_nunchaku, // 0x137
        t10_me_p40_bobastreakbostaff, // 0x138
        t10_me_p40_bostaff, // 0x139
        t10_me_p48_keene, // 0x13a
        t10_me_p51_pickaxe, // 0x13b
        t10_me_p55_bgloves, // 0x13c
        t10_me_p59_csaw, // 0x13d
        t10_me_zombie_hellhound, // 0x13e
        t10_me_zombie_melee, // 0x13f
        t10_me_zombie_mimic, // 0x140
        t10_me_zombiefists, // 0x141
        t10_pi_handcannon_oic, // 0x142
        t10_pi_p12_paris30, // 0x143
        t10_pi_p13_usugar9, // 0x144
        t10_pi_p14_mable, // 0x145
        t10_pi_p14_stiger, // 0x146
        t10_pi_p42_pyork, // 0x147
        t10_sh_p10_moslo500, // 0x148
        t10_sh_p11_olove, // 0x149
        t10_sh_p25_uncle12, // 0x14a
        t10_sh_p27_jhavana, // 0x14b
        t10_sl_p29_goslo, // 0x14c
        t10_sl_p35_blauncher, // 0x14d
        t10_sl_p44_napa, // 0x14e
        t10_sl_p58_wand, // 0x14f
        t10_sm_p02_geasy9, // 0x150
        t10_sm_p03_safox, // 0x151
        t10_sm_p04_chuck9, // 0x152
        t10_sm_p06_sroger3, // 0x153
        t10_sm_p12_roger31, // 0x154
        t10_sm_p21_pparis90, // 0x155
        t10_sm_p28_saug, // 0x156
        t10_sm_p41_perth, // 0x157
        t10_sm_p43_schuck, // 0x158
        t10_sm_p52_lisbon, // 0x159
        t10_sm_p57_mpug40, // 0x15a
        t10_sn_p08_ultiger, // 0x15b
        t10_sn_p09_droger, // 0x15c
        t10_sn_p24_love96, // 0x15d
        t10_sn_p26_mary82, // 0x15e
        t10_sn_p46_hugo, // 0x15f
        t10_swimfists, // 0x160
        sat_pi_handcannon, // 0x161
        sat_ar_finch, // 0x162
        sat_ar_finchexotic, // 0x163
        sat_sn_coral, // 0x164
        sat_sl_sargas, // 0x165
        sat_me_nashira, // 0x166
        sat_me_nashiraexotic, // 0x167
        t10_knifestab, // 0x168
        sat_ar_albatross, // 0x169
        sat_ar_kiwi, // 0x16a
        sat_sm_mammoth, // 0x16b
        sat_me_maru, // 0x16c
        sat_dm_samar, // 0x16d
        sat_sm_marmot, // 0x16e
        sat_sl_atria, // 0x16f
        sat_ks_compound, // 0x170
        sat_sm_serval, // 0x171
        sat_me_castor, // 0x172
        sat_me_elnath, // 0x173
        sat_sm_stoat, // 0x174
        sat_sh_terrier, // 0x175
        sat_dm_tasman, // 0x176
        sat_ar_wren, // 0x177
        sat_lm_hildr, // 0x178
        sat_ar_emu, // 0x179
        sat_sm_civet, // 0x17a
        sat_me_wasat, // 0x17b
        sat_sl_carina // 0x17c
    };

    // idx 0x1 members: 0x9c type: 5
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
        sharp_team_blueprint, // 0x70
        gold, // 0x71
        zm_rb_classic, // 0x72
        zm_grief, // 0x73
        zm_nap, // 0x74
        skirmish, // 0x75
        zm_guided, // 0x76
        armorup, // 0x77
        zm_rb_jingle, // 0x78
        zm_rb_dead_light, // 0x79
        zm_rb_cranked, // 0x7a
        wargames, // 0x7b
        multi, // 0x7c
        boba, // 0x7d
        sugar, // 0x7e
        stop_and_go, // 0x7f
        zm_training_course, // 0x80
        zm_rb_loot_exfil, // 0x81
        zm_rb_startroom, // 0x82
        zm_panda, // 0x83
        ztron, // 0x84
        sabattack, // 0x85
        zm_rb_survival, // 0x86
        codmas_clash, // 0x87
        zm_rb_r_mod, // 0x88
        zm_rb_r_mod_survival, // 0x89
        free_run, // 0x8a
        ztron_adv_start, // 0x8b
        bongo, // 0x8c
        echelon, // 0x8d
        br_buyback, // 0x8e
        sticks, // 0x8f
        zm_rb_daisy, // 0x90
        power_armor, // 0x91
        zm_rb_battle, // 0x92
        zm_rb_echo, // 0x93
        zonecontrol, // 0x94
        freeze, // 0x95
        clash, // 0x96
        free_run_evo, // 0x97
        zm_rb_cranked_team, // 0x98
        arena_melee, // 0x99
        zm_rb_rh_mod, // 0x9a
        clash_ops // 0x9b
    };

    // idx 0x2 members: 0x71 type: 5
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

    // idx 0x3 members: 0x44 type: 5
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

    // idx 0x4 members: 0xbd type: 5
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

    // root: bitSize: 0x2b0eb0, members: 10

    // offset: 0x0, bitSize: 0x2ca00(0x5940 Byte(s)), array:0xc(hti:0x5)
    ScorestreakStatsList killstreakstatslist[TimeScope];
    // offset: 0x2ca00, bitSize: 0x3660(0x6cc Byte(s)), array:0xc(hti:0x5)
    OverviewStats overviewstats[TimeScope];
    // offset: 0x30060, bitSize: 0x1d0580(0x3a0b0 Byte(s)), array:0xc(hti:0x5)
    WeaponStatsList weaponstatslist[TimeScope];
    // offset: 0x2005e0, bitSize: 0x4e0(0x9c Byte(s)), array:0xc(hti:0x5)
    PrestigeStats hash_fdc83599a84b7de3[TimeScope];
    // offset: 0x200ac0, bitSize: 0x2fac0(0x5f58 Byte(s)), array:0xc(hti:0x5)
    EquipmentStatsList equipmentstatslist[TimeScope];
    // offset: 0x230580, bitSize: 0x7c080(0xf810 Byte(s)), array:0xc(hti:0x5)
    FieldUpgradeStatsList fieldupgradestatslist[TimeScope];
    // offset: 0x2ac600, bitSize: 0xde0(0x1bc Byte(s)), array:0xc(hti:0x5)
    PlacementStatsGroup placementstatsgrouplist[TimeScope];
    // offset: 0x2ad3e0, bitSize: 0x558(0xab Byte(s))
    RecentMatchStats lastmatch;
    // offset: 0x2ad938, bitSize: 0x3570(0x6ae Byte(s)), array:0xa(hti:0xffff)
    RecentMatchStats recentmatches[10];
    // offset: 0x2b0ea8, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
};

