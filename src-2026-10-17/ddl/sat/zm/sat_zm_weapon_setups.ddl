// file .... ddl\sat\zm\sat_zm_weapon_setups.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 5 (0x5)
    // bit size .. 200496 (0x30f30)
    // byte size . 25062 (0x61e6)
    // archive ... hash_ede3d89f9cee6122

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

    // idx 0x0 members: 0x50 type: 5
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

    // root: bitSize: 0x30e80, members: 1

    // offset: 0x0, bitSize: 0x30e80(0x61d0 Byte(s)), array:0x50(hti:0x0)
    WeaponSetup zmfavoriteweapons[SatZMFavoriteWeapons];
};

