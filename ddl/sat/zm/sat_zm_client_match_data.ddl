// file .... ddl\sat\zm\sat_zm_client_match_data.ddl

version 1 {
    // enums ..... 4 (0x4)
    // structs ... 4 (0x4)
    // bit size .. 49096 (0xbfc8)
    // byte size . 6137 (0x17f9)
    // archive ... hash_c6594a9b3096fb8d

    // bitSize: 0x28, members: 2
    struct cards_used {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint loot_id;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte num_of_times_used;
    };

    // bitSize: 0x28, members: 3
    struct Death {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte deathpos[2];
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte player;
        // offset: 0x18, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte attackerpos[2];
    };

    // bitSize: 0x16d0, members: 18
    struct Player {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short rank;
        // offset: 0x10, bitSize: 0x20(0x4 Byte(s))
        int total_headshots;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        byte characterindex;
        // offset: 0x38, bitSize: 0x20(0x4 Byte(s))
        int currency_earned;
        // offset: 0x58, bitSize: 0x8(0x1 Byte(s))
        Weapon deadliestweapon;
        // offset: 0x60, bitSize: 0x10(0x2 Byte(s))
        short zombie_death;
        // offset: 0x70, bitSize: 0x10(0x2 Byte(s))
        short revived_another_player;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        SatClientPlatform platform;
        // offset: 0x88, bitSize: 0x9c0(0x138 Byte(s)), array:0x4e(hti:0x0)
        uint killsperweapon[Weapon];
        // offset: 0xa48, bitSize: 0x20(0x4 Byte(s))
        int xuidhigh;
        // offset: 0xa68, bitSize: 0x20(0x4 Byte(s))
        int xuidlow;
        // offset: 0xa88, bitSize: 0x10(0x2 Byte(s))
        short dropped_to_last_stand;
        // offset: 0xa98, bitSize: 0x10(0x2 Byte(s))
        short entering_afterlife_arcade;
        // offset: 0xaa8, bitSize: 0x10(0x2 Byte(s))
        short prestige;
        // offset: 0xab8, bitSize: 0x20(0x4 Byte(s))
        uint deadliestweaponkills;
        // offset: 0xad8, bitSize: 0x170(0x2e Byte(s))
        string(46) username;
        // offset: 0xc48, bitSize: 0x9c0(0x138 Byte(s)), array:0x4e(hti:0x0)
        int headshots[Weapon];
        // offset: 0x1608, bitSize: 0xc8(0x19 Byte(s)), array:0x5(hti:0xffff)
        cards_used cardsused[5];
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

    // idx 0x1 members: 0xf type: 5
    enum SatClientPlatform {
        none, // 0x0
        steam, // 0x1
        bnet, // 0x2
        xb3, // 0x3
        xb4, // 0x4
        ps4, // 0x5
        ps5, // 0x6
        wegame, // 0x7
        ios, // 0x8
        android, // 0x9
        switch, // 0xa
        bot, // 0xb
        msstore, // 0xc
        ubiconnect, // 0xd
        any // 0xe
    };

    // idx 0x2 members: 0x18 type: 5
    enum questPiece {
        quest_piece_1, // 0x0
        quest_piece_2, // 0x1
        quest_piece_3, // 0x2
        quest_piece_4, // 0x3
        quest_piece_5, // 0x4
        quest_piece_6, // 0x5
        quest_piece_7, // 0x6
        quest_piece_8, // 0x7
        quest_piece_9, // 0x8
        quest_piece_10, // 0x9
        quest_piece_11, // 0xa
        quest_piece_12, // 0xb
        quest_piece_13, // 0xc
        quest_piece_14, // 0xd
        quest_piece_15, // 0xe
        quest_piece_16, // 0xf
        quest_piece_17, // 0x10
        quest_piece_18, // 0x11
        quest_piece_19, // 0x12
        quest_piece_20, // 0x13
        quest_piece_21, // 0x14
        quest_piece_22, // 0x15
        quest_piece_23, // 0x16
        quest_piece_24 // 0x17
    };

    // idx 0x3 members: 0x4 type: 5
    enum map_pack {
        dlc_1, // 0x0
        dlc_2, // 0x1
        dlc_3, // 0x2
        dlc_4 // 0x3
    };

    // root: bitSize: 0xbfb8, members: 15

    // offset: 0x0, bitSize: 0x100(0x20 Byte(s))
    string(32) map;
    // offset: 0x100, bitSize: 0x10(0x2 Byte(s))
    short waves_survived;
    // offset: 0x110, bitSize: 0x8(0x1 Byte(s))
    byte scoreboardplayercount;
    // offset: 0x118, bitSize: 0x8(0x1 Byte(s))
    byte numquestpiecescompleted;
    // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
    int stars_earned;
    // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
    int time_survived;
    // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
    int team_score;
    // offset: 0x180, bitSize: 0xb680(0x16d0 Byte(s)), array:0x8(hti:0xffff)
    Player player[8];
    // offset: 0xb800, bitSize: 0x780(0xf0 Byte(s)), array:0x1e(hti:0xffff)
    hashres relics[30];
    // offset: 0xbf80, bitSize: 0x8(0x1 Byte(s))
    byte totalnumofquestpieces;
    // offset: 0xbf88, bitSize: 0x10(0x2 Byte(s))
    short deathcount;
    // offset: 0xbf98, bitSize: 0x18(0x3 Byte(s)), array:0x18(hti:0x2)
    bool questpieces[questPiece];
    // offset: 0xbfb0, bitSize: 0x4, array:0x4(hti:0x3)
    bool playoutrovideo[map_pack];
    // offset: 0xbfb4, bitSize: 0x1
    bool ispublicmatch;
};

