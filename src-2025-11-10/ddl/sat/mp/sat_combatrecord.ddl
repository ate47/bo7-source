// file .... ddl\sat\mp\sat_combatrecord.ddl

version 1 {
    // enums ..... 7 (0x7)
    // structs ... 16 (0x10)
    // bit size .. 42106648 (0x2827f18)
    // byte size . 5263331 (0x504fe3)
    // archive ... hash_348a31e37019223c

    // bitSize: 0x1d0, members: 17
    struct WeaponStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float kdr;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hits;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int shots;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int thrownkills;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        float accuracy;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float headshotpercentage;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        uint destructions;
        // offset: 0x160, bitSize: 0x8(0x1 Byte(s))
        Weapon weapon;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        int furthestkill;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        uint headshots;
        // offset: 0x1c8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x94a0, members: 1
    struct WeaponStatsList {
        // offset: 0x0, bitSize: 0x94a0(0x1294 Byte(s)), array:0x52(hti:0x0)
        WeaponStats weaponstats[Weapon];
    };

    // bitSize: 0x210, members: 19
    struct EquipmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_b2dd3b92e4b7937f;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_d8fc6ebf9c4f8c5d;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        SatEquipment equipment;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        int hash_3b7e769bb1ecec3b;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        int hash_2bf0cdbba7961455;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        uint debuffkills;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        int maxkillsperuse;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint buffedkills;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        int hash_92be8f51af17b0bf;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int destructions;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int specialhits;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x1c8, bitSize: 0x20(0x4 Byte(s))
        int hash_609a309bc7777769;
        // offset: 0x1e8, bitSize: 0x20(0x4 Byte(s))
        int furthestkill;
        // offset: 0x208, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0xca20, members: 1
    struct EquipmentStatsList {
        // offset: 0x0, bitSize: 0xca20(0x1944 Byte(s)), array:0x62(hti:0x1)
        EquipmentStats equipmentstats[SatEquipment];
    };

    // bitSize: 0x230, members: 20
    struct FieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatSuper super;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        int hash_b2dd3b92e4b7937f;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        int hash_9164351906ddc58e;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        int hash_d8fc6ebf9c4f8c5d;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        int objectivescaptured;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        int gearstolen;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        int hash_2bf0cdbba7961455;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        int hash_4b8c3947795ce039;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        int debuffkills;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int maxkillsperuse;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int buffedkills;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        int hash_92be8f51af17b0bf;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        int specialhits;
        // offset: 0x1c8, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x1e8, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x208, bitSize: 0x20(0x4 Byte(s))
        int furthestkill;
        // offset: 0x228, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x18e20, members: 1
    struct FieldUpgradeStatsList {
        // offset: 0x0, bitSize: 0x18e20(0x31c4 Byte(s)), array:0xb6(hti:0x3)
        FieldUpgradeStats fieldupgradestats[SatSuper];
    };

    // bitSize: 0x1d0, members: 17
    struct ScorestreakStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_23ff37bd63f4566a;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int maxdestructionsperuse;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int grenadekills;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int debuffkills;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int maxkillsperuse;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_cb91410ec9bed341;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int hash_728144b1600cc7c;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        uint destructions;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x160, bitSize: 0x8(0x1 Byte(s))
        SatKillstreak killstreak;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int killedby;
        // offset: 0x188, bitSize: 0x20(0x4 Byte(s))
        int restocks;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        int hash_9b466d961641d0f0;
        // offset: 0x1c8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x6010, members: 1
    struct ScorestreakStatsList {
        // offset: 0x0, bitSize: 0x6010(0xc02 Byte(s)), array:0x35(hti:0x2)
        ScorestreakStats killstreakstats[SatKillstreak];
    };

    // bitSize: 0x70, members: 6
    struct DeadliestWeapon {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float ratio;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float accuracy;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        Weapon weapon;
        // offset: 0x68, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x480, members: 20
    struct RecentMatchStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x100(0x20 Byte(s))
        string(32) map;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        uint score;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x160, bitSize: 0x40(0x8 Byte(s))
        uint64 matchid;
        // offset: 0x1a0, bitSize: 0x40(0x8 Byte(s))
        uint64 matchtimestampepoch;
        // offset: 0x1e0, bitSize: 0x70(0xe Byte(s))
        DeadliestWeapon deadliestweapon;
        // offset: 0x250, bitSize: 0x20(0x4 Byte(s))
        uint daysago;
        // offset: 0x270, bitSize: 0x20(0x4 Byte(s))
        int placement;
        // offset: 0x290, bitSize: 0x20(0x4 Byte(s))
        uint objectivescore;
        // offset: 0x2b0, bitSize: 0x20(0x4 Byte(s))
        int srdelta;
        // offset: 0x2d0, bitSize: 0x100(0x20 Byte(s))
        string(32) gametype;
        // offset: 0x3d0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        uint teamscores[2];
        // offset: 0x410, bitSize: 0x20(0x4 Byte(s))
        uint damage;
        // offset: 0x430, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x450, bitSize: 0x8(0x1 Byte(s))
        MatchResult result;
        // offset: 0x458, bitSize: 0x20(0x4 Byte(s))
        uint durationsec;
        // offset: 0x478, bitSize: 0x1
        bool valid;
        // offset: 0x479, bitSize: 0x1
        bool issrdeltavalid;
    };

    // bitSize: 0x208, members: 12
    struct GameModeMapStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x100(0x20 Byte(s))
        string(32) map;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        uint wins;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        float winlossratio;
        // offset: 0x180, bitSize: 0x10(0x2 Byte(s))
        short avgelimspergame;
        // offset: 0x190, bitSize: 0x10(0x2 Byte(s))
        short scorepermin;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        uint losses;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int higheststreak;
        // offset: 0x200, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x5e80, members: 13
    struct GameModeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float edr;
        // offset: 0x20, bitSize: 0x5d70(0xbae Byte(s)), array:0x2e(hti:0xffff)
        GameModeMapStats maps[46];
        // offset: 0x5d90, bitSize: 0x20(0x4 Byte(s))
        uint wins;
        // offset: 0x5db0, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x5dd0, bitSize: 0x20(0x4 Byte(s))
        float winlossratio;
        // offset: 0x5df0, bitSize: 0x10(0x2 Byte(s))
        short avgelimspergame;
        // offset: 0x5e00, bitSize: 0x10(0x2 Byte(s))
        short scorepermin;
        // offset: 0x5e10, bitSize: 0x8(0x1 Byte(s))
        BaseGameMode gamemode;
        // offset: 0x5e18, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x5e38, bitSize: 0x20(0x4 Byte(s))
        uint losses;
        // offset: 0x5e58, bitSize: 0x20(0x4 Byte(s))
        int higheststreak;
        // offset: 0x5e78, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x323400, members: 1
    struct GameModeStatsList {
        // offset: 0x0, bitSize: 0x323400(0x64680 Byte(s)), array:0x88(hti:0x5)
        GameModeStats gamemodestats[BaseGameMode];
    };

    // bitSize: 0x50, members: 5
    struct TopGameMode {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float winlossratio;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        BaseGameMode gamemode;
        // offset: 0x48, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x578, members: 16
    struct OverviewStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint loses;
        // offset: 0x40, bitSize: 0x150(0x2a Byte(s)), array:0x3(hti:0xffff)
        DeadliestWeapon topelimweapons[3];
        // offset: 0x190, bitSize: 0x20(0x4 Byte(s))
        uint highesteliminationspergame;
        // offset: 0x1b0, bitSize: 0x10(0x2 Byte(s))
        short scoreperminute;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        uint timeplayed;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        uint highestwinstreak;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        uint eliminations;
        // offset: 0x220, bitSize: 0x10(0x2 Byte(s))
        short averageeliminationspergame;
        // offset: 0x230, bitSize: 0x190(0x32 Byte(s)), array:0x5(hti:0xffff)
        TopGameMode topgamemodes[5];
        // offset: 0x3c0, bitSize: 0x20(0x4 Byte(s))
        uint deaths;
        // offset: 0x3e0, bitSize: 0x150(0x2a Byte(s)), array:0x3(hti:0xffff)
        DeadliestWeapon topedrweapons[3];
        // offset: 0x530, bitSize: 0x20(0x4 Byte(s))
        uint gamesplayed;
        // offset: 0x550, bitSize: 0x20(0x4 Byte(s))
        uint higheststreak;
        // offset: 0x570, bitSize: 0x1
        bool valid;
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

    // idx 0x1 members: 0x62 type: 5
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

    // idx 0x2 members: 0x35 type: 5
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

    // idx 0x3 members: 0xb6 type: 5
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

    // idx 0x5 members: 0x88 type: 5
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

    // idx 0x6 members: 0x4 type: 5
    enum MatchResult {
        loss, // 0x0
        win, // 0x1
        tie, // 0x2
        loss_forgiven // 0x3
    };

    // root: bitSize: 0x2827e68, members: 9

    // offset: 0x0, bitSize: 0x480c0(0x9018 Byte(s)), array:0xc(hti:0x4)
    ScorestreakStatsList killstreakstatslist[TimeScope];
    // offset: 0x480c0, bitSize: 0x41a0(0x834 Byte(s)), array:0xc(hti:0x4)
    OverviewStats overviewstats[TimeScope];
    // offset: 0x4c260, bitSize: 0x6f780(0xdef0 Byte(s)), array:0xc(hti:0x4)
    WeaponStatsList weaponstatslist[TimeScope];
    // offset: 0xbb9e0, bitSize: 0x97980(0x12f30 Byte(s)), array:0xc(hti:0x4)
    EquipmentStatsList equipmentstatslist[TimeScope];
    // offset: 0x153360, bitSize: 0x12a980(0x25530 Byte(s)), array:0xc(hti:0x4)
    FieldUpgradeStatsList fieldupgradestatslist[TimeScope];
    // offset: 0x27dce0, bitSize: 0x480(0x90 Byte(s))
    RecentMatchStats lastmatch;
    // offset: 0x27e160, bitSize: 0x2d00(0x5a0 Byte(s)), array:0xa(hti:0xffff)
    RecentMatchStats recentmatches[10];
    // offset: 0x280e60, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
    // offset: 0x280e68, bitSize: 0x25a7000(0x4b4e00 Byte(s)), array:0xc(hti:0x4)
    GameModeStatsList gamemodestatslist[TimeScope];
};

