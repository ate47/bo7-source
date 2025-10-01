// file .... ddl\sat\mp\sat_combatrecord.ddl

version 1 {
    // enums ..... 7 (0x7)
    // structs ... 16 (0x10)
    // bit size .. 40830040 (0x26f0458)
    // byte size . 5103755 (0x4de08b)
    // archive ... hash_d224df505a24b47a

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
        int hash_b777b86f1ce2ec0;
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
        int hash_91227d8fd94fadea;
        // offset: 0x1a8, bitSize: 0x20(0x4 Byte(s))
        uint headshots;
        // offset: 0x1c8, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x8d60, members: 1
    struct WeaponStatsList {
        // offset: 0x0, bitSize: 0x8d60(0x11ac Byte(s)), array:0x4e(hti:0x0)
        WeaponStats weaponstats[Weapon];
    };

    // bitSize: 0x190, members: 15
    struct EquipmentStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        SatEquipment equipment;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        int hash_3b7e769bb1ecec3b;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint debuffkills;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        int hash_39a68ac8ca2237e0;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        uint hash_4087ffe9ec4a9d86;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        int destructions;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        int hash_bb476466e7f4ffa2;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int hash_609a309bc7777769;
        // offset: 0x168, bitSize: 0x20(0x4 Byte(s))
        int hash_91227d8fd94fadea;
        // offset: 0x188, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x8fc0, members: 1
    struct EquipmentStatsList {
        // offset: 0x0, bitSize: 0x8fc0(0x11f8 Byte(s)), array:0x5c(hti:0x1)
        EquipmentStats equipmentstats[SatEquipment];
    };

    // bitSize: 0x110, members: 11
    struct FieldUpgradeStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int moves;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        SatSuper super;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        int hash_65f121b80caefe6b;
        // offset: 0x88, bitSize: 0x20(0x4 Byte(s))
        int hash_f0b06b267c5b7cd9;
        // offset: 0xa8, bitSize: 0x20(0x4 Byte(s))
        int hash_39a68ac8ca2237e0;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        uint killedby;
        // offset: 0x108, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0xa290, members: 1
    struct FieldUpgradeStatsList {
        // offset: 0x0, bitSize: 0xa290(0x1452 Byte(s)), array:0x99(hti:0x3)
        FieldUpgradeStats fieldupgradestats[SatSuper];
    };

    // bitSize: 0x170, members: 14
    struct ScorestreakStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint uses;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_23ff37bd63f4566a;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_bfdc739b46eaef42;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hash_35ceb4ca0eddc686;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int hash_39a68ac8ca2237e0;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int hash_cb91410ec9bed341;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        uint destructions;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        uint assists;
        // offset: 0x120, bitSize: 0x8(0x1 Byte(s))
        SatKillstreak killstreak;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        int killedby;
        // offset: 0x148, bitSize: 0x20(0x4 Byte(s))
        int restocks;
        // offset: 0x168, bitSize: 0x1
        bool valid;
    };

    // bitSize: 0x4c30, members: 1
    struct ScorestreakStatsList {
        // offset: 0x0, bitSize: 0x4c30(0x986 Byte(s)), array:0x35(hti:0x2)
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
        uint64 hash_9cb1752e34def997;
        // offset: 0x1e0, bitSize: 0x70(0xe Byte(s))
        DeadliestWeapon deadliestweapon;
        // offset: 0x250, bitSize: 0x20(0x4 Byte(s))
        uint daysago;
        // offset: 0x270, bitSize: 0x20(0x4 Byte(s))
        int placement;
        // offset: 0x290, bitSize: 0x20(0x4 Byte(s))
        uint objectivescore;
        // offset: 0x2b0, bitSize: 0x20(0x4 Byte(s))
        int hash_115eb134d86dfa76;
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
        bool hash_b5405619ad0bd908;
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

    // bitSize: 0x31d580, members: 1
    struct GameModeStatsList {
        // offset: 0x0, bitSize: 0x31d580(0x63ab0 Byte(s)), array:0x87(hti:0x5)
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

    // idx 0x1 members: 0x5c type: 5
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
        equip_decryption_device, // 0x16
        equip_deployable_kiosk_drop, // 0x17
        equip_drone_launcher, // 0x18
        equip_emp, // 0x19
        equip_flash, // 0x1a
        equip_frag, // 0x1b
        equip_gas_grenade, // 0x1c
        equip_gas_trap_plantable, // 0x1d
        equip_geigercounter, // 0x1e
        equip_grappling_hook, // 0x1f
        equip_hb_sensor, // 0x20
        equip_ied, // 0x21
        equip_impact_grenade, // 0x22
        equip_inc_dark, // 0x23
        equip_inc_earth, // 0x24
        equip_inc_electric, // 0x25
        equip_inc_fire, // 0x26
        equip_inc_light, // 0x27
        equip_inhibitor, // 0x28
        equip_jammer, // 0x29
        equip_landmine, // 0x2a
        equip_mini_sentry, // 0x2b
        equip_molotov, // 0x2c
        equip_monkey_bomb, // 0x2d
        equip_munitionsbox, // 0x2e
        equip_pop_candy, // 0x2f
        equip_proximity_alarm, // 0x30
        equip_rallying_cry, // 0x31
        equip_recondrone, // 0x32
        equip_redeploy_drone_beacon, // 0x33
        equip_reinforcement_flare, // 0x34
        equip_rock, // 0x35
        equip_semtex, // 0x36
        equip_semtex_mike32_v5008, // 0x37
        equip_sensor_grenade, // 0x38
        equip_shockstick, // 0x39
        equip_smart_seeker, // 0x3a
        equip_smoke, // 0x3b
        equip_smoke_gl, // 0x3c
        equip_snowball, // 0x3d
        equip_super_aether_shroud, // 0x3e
        equip_super_black_hat, // 0x3f
        equip_super_cradle_gas_grenade, // 0x40
        equip_super_energy_mine, // 0x41
        equip_super_flame_blast, // 0x42
        equip_super_frenzied_guard, // 0x43
        equip_super_frost_blast, // 0x44
        equip_super_grappling_hook, // 0x45
        equip_super_healing_aura, // 0x46
        equip_super_mary_paris, // 0x47
        equip_super_mega_jump, // 0x48
        equip_super_monkey_bomb, // 0x49
        equip_super_overcharge, // 0x4a
        equip_super_portal_summon, // 0x4b
        equip_super_rallying_cry, // 0x4c
        equip_super_redeploy, // 0x4d
        equip_super_survival_life_drain, // 0x4e
        equip_super_teleport, // 0x4f
        equip_super_tesla_storm, // 0x50
        equip_super_toxic_growth, // 0x51
        equip_super_vehicle_summoner, // 0x52
        equip_tac_cover, // 0x53
        equip_tac_insert, // 0x54
        equip_thermite, // 0x55
        equip_thermobaric_grenade, // 0x56
        equip_trophy, // 0x57
        equip_utilitybox, // 0x58
        equip_vacuum_seal_device, // 0x59
        equip_zombie_ranged_attack, // 0x5a
        none // 0x5b
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

    // idx 0x3 members: 0x99 type: 5
    enum SatSuper {
        none, // 0x0
        super_acoustic_amp, // 0x1
        super_active_camo, // 0x2
        super_aether_shroud, // 0x3
        super_ammo_drop, // 0x4
        super_annihilator, // 0x5
        super_armor_drop, // 0x6
        super_armory, // 0x7
        super_assault_shield, // 0x8
        super_balloon_extract, // 0x9
        super_battlerage, // 0xa
        super_black_hat, // 0xb
        super_blastshield_drop, // 0xc
        super_blinding_turret, // 0xd
        super_blowtorch, // 0xe
        super_boba, // 0xf
        super_body_cam_hack, // 0x10
        super_br_extract, // 0x11
        super_bradley, // 0x12
        super_bubble_shield, // 0x13
        super_capture_bot, // 0x14
        super_chopper_gunner, // 0x15
        super_combat_hologram, // 0x16
        super_combat_link, // 0x17
        super_comm_scrambler, // 0x18
        super_contract_skipper, // 0x19
        super_cradle_gas_grenade, // 0x1a
        super_cranked, // 0x1b
        super_cruise_predator, // 0x1c
        super_dark_flare, // 0x1d
        super_dark_flare_13s, // 0x1e
        super_dark_flare_shadow_ball, // 0x1f
        super_deadsilence, // 0x20
        super_death_machine, // 0x21
        super_decon_station, // 0x22
        super_defibrillator, // 0x23
        super_deployable_kiosk, // 0x24
        super_deployed_decoy, // 0x25
        super_door_barricade, // 0x26
        super_dragonfly_drone, // 0x27
        super_drone_launcher, // 0x28
        super_electric_discharge, // 0x29
        super_emp_drone, // 0x2a
        super_emp_pulse, // 0x2b
        super_energy_mine, // 0x2c
        super_evg, // 0x2d
        super_flame_blast, // 0x2e
        super_frenzied_guard, // 0x2f
        super_frost_blast, // 0x30
        super_fulton, // 0x31
        super_fulton_marker, // 0x32
        super_gas_trap, // 0x33
        super_grappling_hook, // 0x34
        super_guild_bot, // 0x35
        super_hb_sensor, // 0x36
        super_healing_aura, // 0x37
        super_high_jump, // 0x38
        super_honeypot, // 0x39
        super_jammer, // 0x3a
        super_juggernaut, // 0x3b
        super_kazimir, // 0x3c
        super_la_gromeo, // 0x3d
        super_la_jp22_dromeo, // 0x3e
        super_la_juliet, // 0x3f
        super_la_kgolf, // 0x40
        super_la_mike32, // 0x41
        super_la_rpapa7, // 0x42
        super_landmine, // 0x43
        super_laser_charge, // 0x44
        super_laststand_syringe, // 0x45
        super_leader_drop, // 0x46
        super_loadout_drop, // 0x47
        super_mary_paris, // 0x48
        super_med_box, // 0x49
        super_medical_box, // 0x4a
        super_mega_jump, // 0x4b
        super_melee_jugg, // 0x4c
        super_monkey_bomb, // 0x4d
        super_mutation, // 0x4e
        super_mutation_boba_stim, // 0x4f
        super_mutation_density_dive, // 0x50
        super_mutation_give_density_dive, // 0x51
        super_mutation_give_jump, // 0x52
        super_mutation_jump, // 0x53
        super_mutation_ninja_sense, // 0x54
        super_mutation_ninja_vanish, // 0x55
        super_mutation_shell_shocked, // 0x56
        super_mutation_shuriken_fury, // 0x57
        super_mutation_turtle_power, // 0x58
        super_none, // 0x59
        super_nvg, // 0x5a
        super_overcharge, // 0x5b
        super_oxygen_mask, // 0x5c
        super_oxygenmask, // 0x5d
        super_pac_sentry, // 0x5e
        super_personal_redeploy_drone, // 0x5f
        super_pop_candy, // 0x60
        super_portal_summon, // 0x61
        super_precision_airstrike, // 0x62
        super_pw_antitank, // 0x63
        super_pw_flamethrower, // 0x64
        super_pw_grenade_gun, // 0x65
        super_pw_micro_minigun, // 0x66
        super_rallying_cry, // 0x67
        super_razor_wire, // 0x68
        super_recon_dart, // 0x69
        super_recon_drone, // 0x6a
        super_redeploy, // 0x6b
        super_redeploy_drone_beacon, // 0x6c
        super_reinforcement_flare, // 0x6d
        super_remote_detonate, // 0x6e
        super_rg_testweapon, // 0x6f
        super_riot_shield, // 0x70
        super_sam_airburst_turret, // 0x71
        super_scramble, // 0x72
        super_seismic, // 0x73
        super_select, // 0x74
        super_self_revive_box, // 0x75
        super_shadow_break, // 0x76
        super_smoke_airdrop, // 0x77
        super_smoke_shroud, // 0x78
        super_smoke_wall, // 0x79
        super_sonar_pulse, // 0x7a
        super_sound_veil, // 0x7b
        super_spykit, // 0x7c
        super_squadrage, // 0x7d
        super_stealth_perks, // 0x7e
        super_stimpistol, // 0x7f
        super_supply_drop, // 0x80
        super_support_box, // 0x81
        super_suppression_rounds, // 0x82
        super_survival_life_drain, // 0x83
        super_sweeper_drones, // 0x84
        super_tac_camera, // 0x85
        super_tac_cover, // 0x86
        super_tac_insert, // 0x87
        super_tar_bomb, // 0x88
        super_teleport, // 0x89
        super_teleport_deploy, // 0x8a
        super_temp_v, // 0x8b
        super_tesla_storm, // 0x8c
        super_test, // 0x8d
        super_toma_strike, // 0x8e
        super_toxic_growth, // 0x8f
        super_treasure_hunter, // 0x90
        super_trophy, // 0x91
        super_uav, // 0x92
        super_utility_drop, // 0x93
        super_vehicle_drop, // 0x94
        super_vehicle_summoner, // 0x95
        super_vision_pulse, // 0x96
        super_war_machine, // 0x97
        super_weapon_drop // 0x98
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

    // idx 0x5 members: 0x87 type: 5
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
        exgm, // 0x4e
        kingslayer, // 0x4f
        mini, // 0x50
        mini_mgl, // 0x51
        resurgence_mgl, // 0x52
        rsurge, // 0x53
        truckwar, // 0x54
        vanilla, // 0x55
        zxp, // 0x56
        benchmark, // 0x57
        ballmode, // 0x58
        brtdm_mgl, // 0x59
        conflict, // 0x5a
        havoc, // 0x5b
        bigctf, // 0x5c
        xfire, // 0x5d
        robj, // 0x5e
        zm_turned, // 0x5f
        wm, // 0x60
        escort, // 0x61
        training_course, // 0x62
        br_auto, // 0x63
        ctdm, // 0x64
        rogue, // 0x65
        fireteam, // 0x66
        augment, // 0x67
        tag_trap, // 0x68
        prop, // 0x69
        counter, // 0x6a
        hijack, // 0x6b
        towerclimb, // 0x6c
        sharp, // 0x6d
        gold, // 0x6e
        zm_rb_classic, // 0x6f
        zm_grief, // 0x70
        zm_nap, // 0x71
        skirmish, // 0x72
        zm_guided, // 0x73
        armorup, // 0x74
        zm_rb_jingle, // 0x75
        zm_rb_dead_light, // 0x76
        zm_rb_cranked, // 0x77
        wargames, // 0x78
        multi, // 0x79
        boba, // 0x7a
        sugar, // 0x7b
        stop_and_go, // 0x7c
        zm_training_course, // 0x7d
        zm_rb_loot_exfil, // 0x7e
        zm_rb_startroom, // 0x7f
        zm_panda, // 0x80
        ztron, // 0x81
        sabattack, // 0x82
        zm_rb_survival, // 0x83
        codmas_clash, // 0x84
        zm_rb_r_mod, // 0x85
        free_run // 0x86
    };

    // idx 0x6 members: 0x4 type: 5
    enum MatchResult {
        loss, // 0x0
        win, // 0x1
        tie, // 0x2
        loss_forgiven // 0x3
    };

    // root: bitSize: 0x26f03a8, members: 9

    // offset: 0x0, bitSize: 0x39240(0x7248 Byte(s)), array:0xc(hti:0x4)
    ScorestreakStatsList killstreakstatslist[TimeScope];
    // offset: 0x39240, bitSize: 0x41a0(0x834 Byte(s)), array:0xc(hti:0x4)
    OverviewStats overviewstats[TimeScope];
    // offset: 0x3d3e0, bitSize: 0x6a080(0xd410 Byte(s)), array:0xc(hti:0x4)
    WeaponStatsList weaponstatslist[TimeScope];
    // offset: 0xa7460, bitSize: 0x6bd00(0xd7a0 Byte(s)), array:0xc(hti:0x4)
    EquipmentStatsList equipmentstatslist[TimeScope];
    // offset: 0x113160, bitSize: 0x79ec0(0xf3d8 Byte(s)), array:0xc(hti:0x4)
    FieldUpgradeStatsList fieldupgradestatslist[TimeScope];
    // offset: 0x18d020, bitSize: 0x480(0x90 Byte(s))
    RecentMatchStats lastmatch;
    // offset: 0x18d4a0, bitSize: 0x2d00(0x5a0 Byte(s)), array:0xa(hti:0xffff)
    RecentMatchStats recentmatches[10];
    // offset: 0x1901a0, bitSize: 0x8(0x1 Byte(s))
    TimeScope highestprestige;
    // offset: 0x1901a8, bitSize: 0x2560200(0x4ac040 Byte(s)), array:0xc(hti:0x4)
    GameModeStatsList gamemodestatslist[TimeScope];
};

