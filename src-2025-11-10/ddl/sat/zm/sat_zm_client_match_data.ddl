// file .... ddl\sat\zm\sat_zm_client_match_data.ddl

version 1 {
    // enums ..... 4 (0x4)
    // structs ... 4 (0x4)
    // bit size .. 51144 (0xc7c8)
    // byte size . 6393 (0x18f9)
    // archive ... hash_2082cbd2de425752

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

    // bitSize: 0x17d0, members: 18
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
        // offset: 0x88, bitSize: 0xa40(0x148 Byte(s)), array:0x52(hti:0x0)
        uint killsperweapon[Weapon];
        // offset: 0xac8, bitSize: 0x20(0x4 Byte(s))
        int xuidhigh;
        // offset: 0xae8, bitSize: 0x20(0x4 Byte(s))
        int xuidlow;
        // offset: 0xb08, bitSize: 0x10(0x2 Byte(s))
        short dropped_to_last_stand;
        // offset: 0xb18, bitSize: 0x10(0x2 Byte(s))
        short entering_afterlife_arcade;
        // offset: 0xb28, bitSize: 0x10(0x2 Byte(s))
        short prestige;
        // offset: 0xb38, bitSize: 0x20(0x4 Byte(s))
        uint deadliestweaponkills;
        // offset: 0xb58, bitSize: 0x170(0x2e Byte(s))
        string(46) username;
        // offset: 0xcc8, bitSize: 0xa40(0x148 Byte(s)), array:0x52(hti:0x0)
        int headshots[Weapon];
        // offset: 0x1708, bitSize: 0xc8(0x19 Byte(s)), array:0x5(hti:0xffff)
        cards_used cardsused[5];
    };

    // idx 0x0 members: 0x52 type: 5
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
        sat_ks_warmachine, // 0x15
        sat_la_fang, // 0x16
        sat_la_mutant_injection_cannon, // 0x17
        sat_la_polis, // 0x18
        sat_la_zm_dinj, // 0x19
        sat_la_ztroncrossbow, // 0x1a
        sat_la_ztronpable3, // 0x1b
        sat_la_ztronwarmachine, // 0x1c
        sat_lm_hades, // 0x1d
        sat_lm_typhon, // 0x1e
        sat_lm_zeus, // 0x1f
        sat_lm_zeusexotic, // 0x20
        sat_lm_ztrondeathmachine, // 0x21
        sat_lm_ztronjetgun, // 0x22
        sat_lm_ztronlmg, // 0x23
        sat_me_ballisticknife, // 0x24
        sat_me_knife, // 0x25
        sat_me_saiph, // 0x26
        sat_me_shockbaton, // 0x27
        sat_me_zombie_melee, // 0x28
        sat_me_zombie_mimic, // 0x29
        sat_mp_assaultshield, // 0x2a
        sat_mp_black_hat, // 0x2b
        sat_ob_ks_warmachine, // 0x2c
        sat_pi_atlas, // 0x2d
        sat_pi_orion, // 0x2e
        sat_pi_timir, // 0x2f
        sat_pi_ztronraygun, // 0x30
        sat_sh_akita, // 0x31
        sat_sh_corso, // 0x32
        sat_sh_corsoexotic, // 0x33
        sat_sh_husky, // 0x34
        sat_sh_shepherd, // 0x35
        sat_sh_ztronshotgun, // 0x36
        sat_sl_crossbow, // 0x37
        sat_sl_nembus, // 0x38
        sat_sm_bengal, // 0x39
        sat_sm_cobra, // 0x3a
        sat_sm_cobraexotic, // 0x3b
        sat_sm_gecko, // 0x3c
        sat_sm_hyena, // 0x3d
        sat_sm_komodo, // 0x3e
        sat_sm_orca, // 0x3f
        sat_sm_otter, // 0x40
        sat_sm_puma, // 0x41
        sat_sm_zebra, // 0x42
        sat_sm_zebraexotic, // 0x43
        sat_sn_aden, // 0x44
        sat_sn_baltic, // 0x45
        sat_sn_caspian, // 0x46
        sat_sn_drake, // 0x47
        sat_sn_drakeexotic, // 0x48
        sat_ww_firefly, // 0x49
        sat_ww_raygun, // 0x4a
        sat_ww_raygunmark2, // 0x4b
        saw_power_armor_minigun, // 0x4c
        t10_lm_dblmg_deathmachine, // 0x4d
        t10_me_climbfists, // 0x4e
        t10_me_diveknife, // 0x4f
        t10_me_fists, // 0x50
        t10_swimfists // 0x51
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

    // root: bitSize: 0xc7b8, members: 15

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
    // offset: 0x180, bitSize: 0xbe80(0x17d0 Byte(s)), array:0x8(hti:0xffff)
    Player player[8];
    // offset: 0xc000, bitSize: 0x780(0xf0 Byte(s)), array:0x1e(hti:0xffff)
    hashres relics[30];
    // offset: 0xc780, bitSize: 0x8(0x1 Byte(s))
    byte totalnumofquestpieces;
    // offset: 0xc788, bitSize: 0x10(0x2 Byte(s))
    short deathcount;
    // offset: 0xc798, bitSize: 0x18(0x3 Byte(s)), array:0x18(hti:0x2)
    bool questpieces[questPiece];
    // offset: 0xc7b0, bitSize: 0x4, array:0x4(hti:0x3)
    bool playoutrovideo[map_pack];
    // offset: 0xc7b4, bitSize: 0x1
    bool ispublicmatch;
};

