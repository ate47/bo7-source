// file .... ddl\sat\mp\sat_favorite_operators.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 4 (0x4)
    // bit size .. 174256 (0x2a8b0)
    // byte size . 21782 (0x5516)
    // archive ... hash_97aff64889408359

    // bitSize: 0x160, members: 2
    struct FavoriteOperatorsSet {
        // offset: 0x0, bitSize: 0x140(0x28 Byte(s)), array:0x14(hti:0xffff)
        SatOperator hash_2a89e505d3c5e6b0[20];
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int hash_f2a870c35125876a;
    };

    // bitSize: 0x2a0, members: 2
    struct FavoriteOperatorSkinsData {
        // offset: 0x0, bitSize: 0x280(0x50 Byte(s)), array:0xa(hti:0xffff)
        hashres skinrefs[10];
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int hash_b6eb1605b3ccaf1b;
    };

    // bitSize: 0x2a540, members: 1
    struct FavoriteOperatorSkinsSet {
        // offset: 0x0, bitSize: 0x2a540(0x54a8 Byte(s)), array:0x102(hti:0x0)
        FavoriteOperatorSkinsData hash_d06398cc8f974efd[SatOperator];
    };

    // idx 0x0 members: 0x102 type: c
    enum SatOperator {
        aksel_eastern, // 0x0
        alejandro_western, // 0x1
        alex_western, // 0x2
        arthur_western, // 0x3
        ash_western, // 0x4
        blackcell_eastern, // 0x5
        blacknoir_eastern, // 0x6
        calisto_eastern, // 0x7
        cdl_female_east, // 0x8
        cdl_female_west, // 0x9
        cdl_male_east, // 0xa
        cdl_male_west, // 0xb
        chili_western, // 0xc
        conor_eastern, // 0xd
        cyborgvaleria_eastern, // 0xe
        dune_eastern, // 0xf
        farah_western, // 0x10
        fender_western, // 0x11
        freedom_western, // 0x12
        gaz_western, // 0x13
        ghost_western, // 0x14
        graves_eastern, // 0x15
        gromsko_western, // 0x16
        gus_western, // 0x17
        heather_eastern, // 0x18
        hellsing_western, // 0x19
        homelander_eastern, // 0x1a
        hutch_western, // 0x1b
        inarius_western, // 0x1c
        infected_western, // 0x1d
        io_western, // 0x1e
        jup_mp_alpha, // 0x1f
        jup_mp_ash, // 0x20
        jup_mp_beta, // 0x21
        jup_mp_bike, // 0x22
        jup_mp_bravo, // 0x23
        jup_mp_cal, // 0x24
        jup_mp_caramel, // 0x25
        jup_mp_cdl_female_away, // 0x26
        jup_mp_cdl_female_home, // 0x27
        jup_mp_cdl_male_away, // 0x28
        jup_mp_cdl_male_home, // 0x29
        jup_mp_charlie, // 0x2a
        jup_mp_clay, // 0x2b
        jup_mp_copper, // 0x2c
        jup_mp_darts, // 0x2d
        jup_mp_delta, // 0x2e
        jup_mp_echo, // 0x2f
        jup_mp_echo_17_mutant, // 0x30
        jup_mp_eta, // 0x31
        jup_mp_fall, // 0x32
        jup_mp_fuse, // 0x33
        jup_mp_gamma, // 0x34
        jup_mp_gelato, // 0x35
        jup_mp_golf, // 0x36
        jup_mp_gulag, // 0x37
        jup_mp_hammer, // 0x38
        jup_mp_hotel, // 0x39
        jup_mp_india, // 0x3a
        jup_mp_judo, // 0x3b
        jup_mp_juliet, // 0x3c
        jup_mp_kappa, // 0x3d
        jup_mp_kilo, // 0x3e
        jup_mp_lambda, // 0x3f
        jup_mp_laswell, // 0x40
        jup_mp_lima, // 0x41
        jup_mp_maestro, // 0x42
        jup_mp_makarov, // 0x43
        jup_mp_mike, // 0x44
        jup_mp_mithril, // 0x45
        jup_mp_mochi, // 0x46
        jup_mp_nolan, // 0x47
        jup_mp_november, // 0x48
        jup_mp_november_12_mutant, // 0x49
        jup_mp_onyx, // 0x4a
        jup_mp_oscar, // 0x4b
        jup_mp_papa, // 0x4c
        jup_mp_quebec, // 0x4d
        jup_mp_romeo, // 0x4e
        jup_mp_sage, // 0x4f
        jup_mp_shieldmaiden, // 0x50
        jup_mp_sierra, // 0x51
        jup_mp_sierra_17_mutant, // 0x52
        jup_mp_slamfire, // 0x53
        jup_mp_spring, // 0x54
        jup_mp_sub_maker, // 0x55
        jup_mp_summer, // 0x56
        jup_mp_tango, // 0x57
        jup_mp_thorn, // 0x58
        jup_mp_thyme, // 0x59
        jup_mp_uniform, // 0x5a
        jup_mp_void, // 0x5b
        jup_mp_whiskey, // 0x5c
        jup_mp_winter, // 0x5d
        jup_mp_woods, // 0x5e
        jup_mp_zeta, // 0x5f
        jup_mp_zulu, // 0x60
        jup_ob_warlord_disguise, // 0x61
        kd_western, // 0x62
        kilgore_eastern, // 0x63
        klaus_western, // 0x64
        kleo_western, // 0x65
        kpop_eastern, // 0x66
        lara_western, // 0x67
        lilith_eastern, // 0x68
        luna_western, // 0x69
        mace_eastern, // 0x6a
        messi_western, // 0x6b
        milsim_eastern_1, // 0x6c
        milsim_western_1, // 0x6d
        neotokyo_eastern, // 0x6e
        neymar_eastern, // 0x6f
        nicki_eastern, // 0x70
        nickmercs_eastern, // 0x71
        nikto_eastern, // 0x72
        nova_eastern, // 0x73
        oni_eastern, // 0x74
        pogba_western, // 0x75
        price_western, // 0x76
        reyes_western, // 0x77
        ronin_western, // 0x78
        roze_eastern, // 0x79
        sat_chn_pl_gold, // 0x7a
        sat_eth_pl_yellow, // 0x7b
        sat_ger_pl_blue, // 0x7c
        sat_ger_pl_purple, // 0x7d
        sat_ind_pl_azure, // 0x7e
        sat_ind_pl_violet, // 0x7f
        sat_jpn_pl_scarlet, // 0x80
        sat_jpn_pl_takeo, // 0x81
        sat_mex_pl_green, // 0x82
        sat_mex_pl_indigo, // 0x83
        sat_mi_disc, // 0x84
        sat_mstr_mangler, // 0x85
        sat_nzl_pl_rose, // 0x86
        sat_remote_robot, // 0x87
        sat_remote_robot_guild, // 0x88
        sat_rus_pl_magenta, // 0x89
        sat_usa_pl_amber, // 0x8a
        sat_usa_pl_black, // 0x8b
        sat_usa_pl_cdl_female, // 0x8c
        sat_usa_pl_cdl_female_away, // 0x8d
        sat_usa_pl_cdl_female_home, // 0x8e
        sat_usa_pl_cdl_male, // 0x8f
        sat_usa_pl_cdl_male_away, // 0x90
        sat_usa_pl_cdl_male_home, // 0x91
        sat_usa_pl_cyan, // 0x92
        sat_usa_pl_gray, // 0x93
        sat_usa_pl_jack_base, // 0x94
        sat_usa_pl_jill_base, // 0x95
        sat_usa_pl_maroon, // 0x96
        sat_usa_pl_orange, // 0x97
        sat_usa_pl_red, // 0x98
        sat_usa_pl_silver, // 0x99
        sat_usa_pl_voss, // 0x9a
        sat_usa_pl_white, // 0x9b
        sat_usa_training_course_bot, // 0x9c
        sat_zaf_pl_peach, // 0x9d
        savage_eastern, // 0x9e
        shredder_eastern, // 0x9f
        skeletor_eastern, // 0xa0
        snoop_western, // 0xa1
        soap_western, // 0xa2
        spawn_western, // 0xa3
        starlight_western, // 0xa4
        stiletto_eastern, // 0xa5
        t10_arg_pl_alejo, // 0xa6
        t10_ava_pl_sev, // 0xa7
        t10_gbr_pl_grey, // 0xa8
        t10_gbr_pl_park, // 0xa9
        t10_gbr_pl_pumpkin, // 0xaa
        t10_gbr_pl_ratcliff, // 0xab
        t10_gbr_pl_stone, // 0xac
        t10_ger_pl_dummy, // 0xad
        t10_ger_pl_panda, // 0xae
        t10_ita_pl_volta, // 0xaf
        t10_jap_pl_fang, // 0xb0
        t10_jap_pl_neatherheart, // 0xb1
        t10_mstr_mangler, // 0xb2
        t10_mstr_zombie_zxp, // 0xb3
        t10_pak_pl_nazir, // 0xb4
        t10_phl_pl_maya, // 0xb5
        t10_pol_pl_bayan, // 0xb6
        t10_pri_pl_yara, // 0xb7
        t10_rus_pl_brown, // 0xb8
        t10_rus_pl_stitch, // 0xb9
        t10_rus_pl_weaver, // 0xba
        t10_scorestreak_pl_chopper_gunner, // 0xbb
        t10_scorestreak_pl_gunship_gunner, // 0xbc
        t10_tha_pl_niran, // 0xbd
        t10_ury_pl_phantom, // 0xbe
        t10_ury_pl_vip_east, // 0xbf
        t10_ury_pl_vip_west, // 0xc0
        t10_ury_pl_witch, // 0xc1
        t10_usa_alpha_infiltration, // 0xc2
        t10_usa_bravo_infiltration, // 0xc3
        t10_usa_pl_adler, // 0xc4
        t10_usa_pl_bailey, // 0xc5
        t10_usa_pl_boar, // 0xc6
        t10_usa_pl_brimstone, // 0xc7
        t10_usa_pl_buck, // 0xc8
        t10_usa_pl_cabbage, // 0xc9
        t10_usa_pl_caine, // 0xca
        t10_usa_pl_caramel, // 0xcb
        t10_usa_pl_carver, // 0xcc
        t10_usa_pl_cdl_away, // 0xcd
        t10_usa_pl_cdl_home, // 0xce
        t10_usa_pl_chihuahua, // 0xcf
        t10_usa_pl_chocolate, // 0xd0
        t10_usa_pl_corgi, // 0xd1
        t10_usa_pl_cucumber, // 0xd2
        t10_usa_pl_dark, // 0xd3
        t10_usa_pl_deity, // 0xd4
        t10_usa_pl_doberman, // 0xd5
        t10_usa_pl_fall, // 0xd6
        t10_usa_pl_flycatcher, // 0xd7
        t10_usa_pl_freelance, // 0xd8
        t10_usa_pl_gummy, // 0xd9
        t10_usa_pl_hudson, // 0xda
        t10_usa_pl_jack, // 0xdb
        t10_usa_pl_jack_base, // 0xdc
        t10_usa_pl_jack_gray1, // 0xdd
        t10_usa_pl_jay, // 0xde
        t10_usa_pl_jellybean, // 0xdf
        t10_usa_pl_jill_base, // 0xe0
        t10_usa_pl_john, // 0xe1
        t10_usa_pl_leaf, // 0xe2
        t10_usa_pl_lettuce, // 0xe3
        t10_usa_pl_mace, // 0xe4
        t10_usa_pl_marshall, // 0xe5
        t10_usa_pl_martin, // 0xe6
        t10_usa_pl_maw, // 0xe7
        t10_usa_pl_milk, // 0xe8
        t10_usa_pl_oriole, // 0xe9
        t10_usa_pl_peachring, // 0xea
        t10_usa_pl_pitbull, // 0xeb
        t10_usa_pl_pitbulll, // 0xec
        t10_usa_pl_poodle, // 0xed
        t10_usa_pl_punch, // 0xee
        t10_usa_pl_redacted, // 0xef
        t10_usa_pl_retriever, // 0xf0
        t10_usa_pl_roze, // 0xf1
        t10_usa_pl_shiba, // 0xf2
        t10_usa_pl_sims, // 0xf3
        t10_usa_pl_tomato, // 0xf4
        t10_usa_pl_warden, // 0xf5
        t10_usa_pl_westpoint, // 0xf6
        t10_usa_pl_woods, // 0xf7
        t10_zmb_pl_jack_infected, // 0xf8
        t10_zmb_pl_jill_infected, // 0xf9
        tetiana_eastern, // 0xfa
        tim_western, // 0xfb
        valeria_eastern, // 0xfc
        velikan_eastern, // 0xfd
        zero_eastern, // 0xfe
        zeus_eastern, // 0xff
        zimo_western, // 0x100
        zoltan_eastern // 0x101
    };

    // root: bitSize: 0x2a800, members: 2

    // offset: 0x0, bitSize: 0x2a540(0x54a8 Byte(s))
    FavoriteOperatorSkinsSet favoriteoperatorskinsset;
    // offset: 0x2a540, bitSize: 0x2c0(0x58 Byte(s)), array:0x2(hti:0xffff)
    FavoriteOperatorsSet favoriteoperatorsset[2];
};

