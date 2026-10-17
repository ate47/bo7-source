// file .... ddl\sat\shared\loadouts\sat_weapon_builds.ddl

version 1 {
    // enums ..... 3 (0x3)
    // structs ... 7 (0x7)
    // bit size .. 5255264 (0x503060)
    // byte size . 656908 (0xa060c)
    // archive ... hash_3ae57a5438ff46bf

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

    // bitSize: 0x9c8, members: 18
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
        // offset: 0xa0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        uint hash_afc60af6ede88bfd[2];
        // offset: 0xe0, bitSize: 0xa0(0x14 Byte(s))
        string(20) blueprintname;
        // offset: 0x180, bitSize: 0x8(0x1 Byte(s))
        uint:7 weaponvariantid;
        // offset: 0x188, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        uint stickerlootids[5];
        // offset: 0x228, bitSize: 0x20(0x4 Byte(s))
        uint cosmeticattachmentlootid;
        // offset: 0x248, bitSize: 0x20(0x4 Byte(s))
        int lastinteractionevent;
        // offset: 0x268, bitSize: 0x40(0x8 Byte(s))
        hashres chroma;
        // offset: 0x2a8, bitSize: 0x6e8(0xdd Byte(s)), array:0x11(hti:0xffff)
        AttachmentSetup attachmentsetup[17];
        // offset: 0x990, bitSize: 0x20(0x4 Byte(s))
        int lootitemid;
        // offset: 0x9b0, bitSize: 0x10(0x2 Byte(s))
        uint:9 weaponbuildindex;
        // offset: 0x9c0, bitSize: 0x1
        bool hasmodifiedblueprint;
        // offset: 0x9c1, bitSize: 0x1
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

    // bitSize: 0x61d0, members: 1
    struct BlueprintWeaponEntry {
        // offset: 0x0, bitSize: 0x61d0(0xc3a Byte(s)), array:0xa(hti:0xffff)
        WeaponSetup weaponsetup[10];
    };

    // bitSize: 0x9d8, members: 4
    struct WeaponBuildEntry {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        int:8 equippedinloadoutcount;
        // offset: 0x8, bitSize: 0x9c8(0x139 Byte(s))
        WeaponSetup weaponsetup;
        // offset: 0x9d0, bitSize: 0x1
        bool inuse;
        // offset: 0x9d1, bitSize: 0x7, array:0x7(hti:0xffff)
        bool hash_7a9ad55ef0e86173[7];
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

    // idx 0x1 members: 0x50 type: 5
    enum SatZMFavoriteWeapons {
        sat_ar_albatross, // 0x0
        sat_ar_condor, // 0x1
        sat_ar_eagle, // 0x2
        sat_ar_egret, // 0x3
        sat_ar_emu, // 0x4
        sat_ar_falcon, // 0x5
        sat_ar_finch, // 0x6
        sat_ar_hawk, // 0x7
        sat_ar_heron, // 0x8
        sat_ar_kite, // 0x9
        sat_ar_kiwi, // 0xa
        sat_ar_macaw, // 0xb
        sat_ar_vulture, // 0xc
        sat_ar_wren, // 0xd
        sat_dm_kara, // 0xe
        sat_dm_oman, // 0xf
        sat_dm_samar, // 0x10
        sat_dm_scotia, // 0x11
        sat_dm_scotiaexotic, // 0x12
        sat_dm_solomon, // 0x13
        sat_dm_tasman, // 0x14
        sat_la_fang, // 0x15
        sat_la_polis, // 0x16
        sat_lm_hades, // 0x17
        sat_lm_hildr, // 0x18
        sat_lm_typhon, // 0x19
        sat_lm_zeus, // 0x1a
        sat_lm_zeusexotic, // 0x1b
        sat_me_ballisticknife, // 0x1c
        sat_me_castor, // 0x1d
        sat_me_elnath, // 0x1e
        sat_me_knife, // 0x1f
        sat_me_maru, // 0x20
        sat_me_nashira, // 0x21
        sat_me_saiph, // 0x22
        sat_me_shockbaton, // 0x23
        sat_me_wasat, // 0x24
        sat_pi_alcor, // 0x25
        sat_pi_atlas, // 0x26
        sat_pi_handcannon, // 0x27
        sat_pi_orion, // 0x28
        sat_pi_timir, // 0x29
        sat_pi_ztronraygun, // 0x2a
        sat_sh_akita, // 0x2b
        sat_sh_corso, // 0x2c
        sat_sh_husky, // 0x2d
        sat_sh_shepherd, // 0x2e
        sat_sh_terrier, // 0x2f
        sat_sl_atria, // 0x30
        sat_sl_carina, // 0x31
        sat_sl_crossbow, // 0x32
        sat_sl_nembus, // 0x33
        sat_sl_sargas, // 0x34
        sat_sm_bear, // 0x35
        sat_sm_bengal, // 0x36
        sat_sm_civet, // 0x37
        sat_sm_cobra, // 0x38
        sat_sm_gecko, // 0x39
        sat_sm_hyena, // 0x3a
        sat_sm_komodo, // 0x3b
        sat_sm_mammoth, // 0x3c
        sat_sm_marmot, // 0x3d
        sat_sm_orca, // 0x3e
        sat_sm_otter, // 0x3f
        sat_sm_puma, // 0x40
        sat_sm_serval, // 0x41
        sat_sm_stoat, // 0x42
        sat_sm_zebra, // 0x43
        sat_sm_zebraexotic, // 0x44
        sat_sn_aden, // 0x45
        sat_sn_baltic, // 0x46
        sat_sn_caspian, // 0x47
        sat_sn_coral, // 0x48
        sat_sn_drake, // 0x49
        saw_ar_daisy, // 0x4a
        saw_daisy_minigun, // 0x4b
        saw_dm_daisy, // 0x4c
        saw_la_daisy, // 0x4d
        saw_pi_daisy, // 0x4e
        saw_sh_daisy // 0x4f
    };

    // idx 0x2 members: 0x17d type: 5
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

    // root: bitSize: 0x502fb0, members: 8

    // offset: 0x0, bitSize: 0x2efef0(0x5dfde Byte(s)), array:0x7b(hti:0x0)
    BlueprintWeaponEntry blueprints[Weapon];
    // offset: 0x2efef0, bitSize: 0x3200(0x640 Byte(s)), array:0x190(hti:0xffff)
    uint nextbuild[400];
    // offset: 0x2f30f0, bitSize: 0xf6180(0x1ec30 Byte(s)), array:0x190(hti:0xffff)
    WeaponBuildEntry weaponbuildlist[400];
    // offset: 0x3e9270, bitSize: 0xe8ea8(0x1d1d5 Byte(s)), array:0x17d(hti:0x2)
    WeaponSetup hash_6a1249e3978b30ce[SatWZWeapons];
    // offset: 0x4d2118, bitSize: 0x30e80(0x61d0 Byte(s)), array:0x50(hti:0x1)
    WeaponSetup zmfavoriteweaponsfrontend[SatZMFavoriteWeapons];
    // offset: 0x502f98, bitSize: 0x10(0x2 Byte(s))
    uint:9 weaponbuildcount;
    // offset: 0x502fa8, bitSize: 0x1
    bool hash_1964ed38a84adbb7;
};

