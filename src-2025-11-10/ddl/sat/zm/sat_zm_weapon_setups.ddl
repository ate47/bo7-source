// file .... ddl\sat\zm\sat_zm_weapon_setups.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 5 (0x5)
    // bit size .. 200256 (0x30e40)
    // byte size . 25032 (0x61c8)
    // archive ... hash_40592717fbda3fca

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

    // root: bitSize: 0x30d90, members: 1

    // offset: 0x0, bitSize: 0x30d90(0x61b2 Byte(s)), array:0x52(hti:0x0)
    WeaponSetup zmfavoriteweapons[Weapon];
};

