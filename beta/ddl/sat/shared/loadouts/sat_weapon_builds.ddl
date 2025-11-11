// file .... ddl\sat\shared\loadouts\sat_weapon_builds.ddl

version 1 {
    // enums ..... 2 (0x2)
    // structs ... 7 (0x7)
    // bit size .. 3874600 (0x3b1f28)
    // byte size . 484325 (0x763e5)
    // archive ... hash_f85e08ba8b099391

    // bitSize: 0x68, members: 7
    struct AttachmentSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint attachmentlootid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint attachmentblueprintlootid;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:8 attachmentvariantid;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte attachmentoverridechildindex;
        // offset: 0x50, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte customtune[2];
        // offset: 0x60, bitSize: 0x1
        bool hasbptune;
    };

    // bitSize: 0x988, members: 17
    struct WeaponSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint weaponlootid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint paintjobid;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint lastinteractiontime;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint camolootid;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint reticlelootid;
        // offset: 0xa0, bitSize: 0xa0(0x14 Byte(s))
        string(20) blueprintname;
        // offset: 0x140, bitSize: 0x8(0x1 Byte(s))
        uint:7 weaponvariantid;
        // offset: 0x148, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        uint stickerlootids[5];
        // offset: 0x1e8, bitSize: 0x20(0x4 Byte(s))
        uint cosmeticattachmentlootid;
        // offset: 0x208, bitSize: 0x20(0x4 Byte(s))
        int lastinteractionevent;
        // offset: 0x228, bitSize: 0x40(0x8 Byte(s))
        hashres chroma;
        // offset: 0x268, bitSize: 0x6e8(0xdd Byte(s)), array:0x11(hti:0xffff)
        AttachmentSetup attachmentsetup[17];
        // offset: 0x950, bitSize: 0x20(0x4 Byte(s))
        int lootitemid;
        // offset: 0x970, bitSize: 0x10(0x2 Byte(s))
        uint:9 weaponbuildindex;
        // offset: 0x980, bitSize: 0x1
        bool hasmodifiedblueprint;
        // offset: 0x981, bitSize: 0x1
        bool isreceiverskin;
    };

    // bitSize: 0x50, members: 5
    struct EquipmentSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint equipmentlootid;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte equipmentvariantid;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        uint procontentlootid;
        // offset: 0x48, bitSize: 0x1
        bool extracharge;
    };

    // bitSize: 0x48, members: 3
    struct FieldUpgradeSetup {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte blueprintindex;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        uint procontentlootid;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        uint fieldupgradelootid;
    };

    // bitSize: 0x5f50, members: 1
    struct BlueprintWeaponEntry {
        // offset: 0x0, bitSize: 0x5f50(0xbea Byte(s)), array:0xa(hti:0xffff)
        WeaponSetup weaponsetup[10];
    };

    // bitSize: 0x998, members: 4
    struct WeaponBuildEntry {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        int:8 equippedinloadoutcount;
        // offset: 0x8, bitSize: 0x988(0x131 Byte(s))
        WeaponSetup weaponsetup;
        // offset: 0x990, bitSize: 0x1
        bool inuse;
        // offset: 0x991, bitSize: 0x7, array:0x7(hti:0xffff)
        bool hash_7a9ad55ef0e86173[7];
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

    // idx 0x1 members: 0x142 type: 5
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
        sat_dm_kara, // 0xb7
        sat_dm_oman, // 0xb8
        sat_dm_scotia, // 0xb9
        sat_ks_deathmachine, // 0xba
        sat_ks_handcannon, // 0xbb
        sat_ks_warmachine, // 0xbc
        sat_la_fang, // 0xbd
        sat_la_mutant_injection_cannon, // 0xbe
        sat_la_polis, // 0xbf
        sat_la_zm_dinj, // 0xc0
        sat_lm_hades, // 0xc1
        sat_lm_typhon, // 0xc2
        sat_lm_zeus, // 0xc3
        sat_me_ballisticknife, // 0xc4
        sat_me_knife, // 0xc5
        sat_me_shockbaton, // 0xc6
        sat_me_zombie_melee, // 0xc7
        sat_mp_assaultshield, // 0xc8
        sat_mp_black_hat, // 0xc9
        sat_pi_atlas, // 0xca
        sat_pi_orion, // 0xcb
        sat_pi_timir, // 0xcc
        sat_sh_akita, // 0xcd
        sat_sh_corso, // 0xce
        sat_sh_husky, // 0xcf
        sat_sh_shepherd, // 0xd0
        sat_sm_cobra, // 0xd1
        sat_sm_hyena, // 0xd2
        sat_sm_komodo, // 0xd3
        sat_sm_orca, // 0xd4
        sat_sm_otter, // 0xd5
        sat_sm_puma, // 0xd6
        sat_sm_zebra, // 0xd7
        sat_sn_aden, // 0xd8
        sat_sn_baltic, // 0xd9
        sat_sn_caspian, // 0xda
        sat_sn_drake, // 0xdb
        sat_ww_firefly, // 0xdc
        sat_ww_mantis, // 0xdd
        sat_ww_mantis2, // 0xde
        sat_ww_ruby, // 0xdf
        specialty_null, // 0xe0
        support_box_mp, // 0xe1
        t10_ar_p01_coslo723, // 0xe2
        t10_ar_p02_aking74, // 0xe3
        t10_ar_p04_clove, // 0xe4
        t10_ar_p05_fable, // 0xe5
        t10_ar_p05_rmary2, // 0xe6
        t10_ar_p06_asvalor, // 0xe7
        t10_ar_p22_able18, // 0xe8
        t10_ar_p23_love85, // 0xe9
        t10_ar_p34_tbaker, // 0xea
        t10_ar_p45_kent, // 0xeb
        t10_ar_p47_gilroy, // 0xec
        t10_ar_p49_fresno, // 0xed
        t10_ar_p54_aspen, // 0xee
        t10_ar_p56_milan, // 0xef
        t10_dm_p01_sroger25, // 0xf0
        t10_dm_p02_aeasy, // 0xf1
        t10_dm_p03_sgeorge550, // 0xf2
        t10_dm_p05_falove, // 0xf3
        t10_dm_p09_svalor, // 0xf4
        t10_dm_p50_erie, // 0xf5
        t10_knifestab, // 0xf6
        t10_ks_compound, // 0xf7
        t10_ks_deathmachine, // 0xf8
        t10_ks_handcannon, // 0xf9
        t10_ks_m202, // 0xfa
        t10_ks_warmachine, // 0xfb
        t10_la_mangler_cannon, // 0xfc
        t10_la_p17_pable3, // 0xfd
        t10_la_p18_stisaac, // 0xfe
        t10_la_p19_opalww, // 0xff
        t10_lm_dblmg_deathmachine, // 0x100
        t10_lm_p01_aroger10, // 0x101
        t10_lm_p02_puncle21, // 0x102
        t10_lm_p07_ksugar58, // 0x103
        t10_lm_p19_jetgun, // 0x104
        t10_lm_p25_drillgun, // 0x105
        t10_lm_p33_uxray, // 0x106
        t10_lm_p53_mesa, // 0x107
        t10_me_climbfists, // 0x108
        t10_me_diveknife, // 0x109
        t10_me_fists, // 0x10a
        t10_me_p15_knife, // 0x10b
        t10_me_p16_bat, // 0x10c
        t10_me_p30_cleaver, // 0x10d
        t10_me_p31_drill, // 0x10e
        t10_me_p36_skateboard, // 0x10f
        t10_me_p37_bobastreakkatanas, // 0x110
        t10_me_p37_katanas, // 0x111
        t10_me_p38_bobastreaksais, // 0x112
        t10_me_p38_sais, // 0x113
        t10_me_p39_bobastreaknunchaku, // 0x114
        t10_me_p39_nunchaku, // 0x115
        t10_me_p40_bobastreakbostaff, // 0x116
        t10_me_p40_bostaff, // 0x117
        t10_me_p48_keene, // 0x118
        t10_me_p51_pickaxe, // 0x119
        t10_me_p55_bgloves, // 0x11a
        t10_me_p55_bknuckles, // 0x11b
        t10_me_p59_csaw, // 0x11c
        t10_me_zombie_hellhound, // 0x11d
        t10_me_zombie_melee, // 0x11e
        t10_me_zombie_mimic, // 0x11f
        t10_me_zombiefists, // 0x120
        t10_pi_handcannon_oic, // 0x121
        t10_pi_p12_paris30, // 0x122
        t10_pi_p13_usugar9, // 0x123
        t10_pi_p14_mable, // 0x124
        t10_pi_p14_stiger, // 0x125
        t10_pi_p19_raygun, // 0x126
        t10_pi_p19_raygunmark2, // 0x127
        t10_pi_p42_pyork, // 0x128
        t10_sh_p10_moslo500, // 0x129
        t10_sh_p11_olove, // 0x12a
        t10_sh_p25_uncle12, // 0x12b
        t10_sh_p27_jhavana, // 0x12c
        t10_sl_p29_goslo, // 0x12d
        t10_sl_p35_blauncher, // 0x12e
        t10_sl_p44_napa, // 0x12f
        t10_sl_p58_wand, // 0x130
        t10_sm_p02_geasy9, // 0x131
        t10_sm_p03_safox, // 0x132
        t10_sm_p04_chuck9, // 0x133
        t10_sm_p06_sroger3, // 0x134
        t10_sm_p12_roger31, // 0x135
        t10_sm_p21_pparis90, // 0x136
        t10_sm_p28_saug, // 0x137
        t10_sm_p41_perth, // 0x138
        t10_sm_p43_schuck, // 0x139
        t10_sm_p52_lisbon, // 0x13a
        t10_sm_p57_mpug40, // 0x13b
        t10_sn_p08_ultiger, // 0x13c
        t10_sn_p09_droger, // 0x13d
        t10_sn_p24_love96, // 0x13e
        t10_sn_p26_mary82, // 0x13f
        t10_sn_p46_hugo, // 0x140
        t10_swimfists // 0x141
    };

    // root: bitSize: 0x3b1e78, members: 8

    // offset: 0x0, bitSize: 0x1d0a60(0x3a14c Byte(s)), array:0x4e(hti:0x0)
    BlueprintWeaponEntry blueprints[Weapon];
    // offset: 0x1d0a60, bitSize: 0x3200(0x640 Byte(s)), array:0x190(hti:0xffff)
    uint hash_97d80c1398abd858[400];
    // offset: 0x1d3c60, bitSize: 0xefd80(0x1dfb0 Byte(s)), array:0x190(hti:0xffff)
    WeaponBuildEntry weaponbuildlist[400];
    // offset: 0x2c39e0, bitSize: 0xbfd10(0x17fa2 Byte(s)), array:0x142(hti:0x1)
    WeaponSetup hash_6a1249e3978b30ce[SatWZWeapons];
    // offset: 0x3836f0, bitSize: 0x2e770(0x5cee Byte(s)), array:0x4e(hti:0x0)
    WeaponSetup zmfavoriteweaponsfrontend[Weapon];
    // offset: 0x3b1e60, bitSize: 0x10(0x2 Byte(s))
    uint:9 weaponbuildcount;
    // offset: 0x3b1e70, bitSize: 0x1
    bool hash_1964ed38a84adbb7;
};

