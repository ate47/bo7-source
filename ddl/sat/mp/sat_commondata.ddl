// file .... ddl\sat\mp\sat_commondata.ddl

version 1 {
    // enums ..... 6 (0x6)
    // structs ... 15 (0xf)
    // bit size .. 22912 (0x5980)
    // byte size . 2864 (0xb30)
    // archive ... hash_3cba756084f4c76b

    // bitSize: 0x30, members: 2
    struct PlayerLevel {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int xp;
        // offset: 0x20, bitSize: 0x10(0x2 Byte(s))
        short prestige;
    };

    // bitSize: 0x160, members: 56
    struct Progression {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_06_checkpoint_id;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_06_successes;
        // offset: 0x10, bitSize: 0x30(0x6 Byte(s))
        PlayerLevel playerlevel;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_01_successes;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_01_checkpoint_id;
        // offset: 0x50, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_08_attempts;
        // offset: 0x58, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_08_successes;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_04_checkpoint_id;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_07_attempts;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_06_attempts;
        // offset: 0x78, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_07_checkpoint_id;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_03_successes;
        // offset: 0x88, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_05_attempts;
        // offset: 0x90, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_04_attempts;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_03_attempts;
        // offset: 0xa0, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_02_attempts;
        // offset: 0xa8, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_05_successes;
        // offset: 0xb0, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_01_attempts;
        // offset: 0xb8, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_02_checkpoint_id;
        // offset: 0xc0, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_00_attempts;
        // offset: 0xc8, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_00_successes;
        // offset: 0xd0, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_05_checkpoint_id;
        // offset: 0xd8, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_07_successes;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_08_checkpoint_id;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_02_successes;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_00_checkpoint_id;
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        uint:5 sboxmission_03_checkpoint_id;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        uint:8 sboxmission_04_successes;
        // offset: 0x108, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_06_map_unlocks[4];
        // offset: 0x10c, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_00_ks_unlocks[4];
        // offset: 0x110, bitSize: 0x1
        bool sboxmission_06_tacmapjammer;
        // offset: 0x111, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_01_ks_unlocks[4];
        // offset: 0x115, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_02_ks_unlocks[4];
        // offset: 0x119, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_05_map_unlocks[4];
        // offset: 0x11d, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_03_ks_unlocks[4];
        // offset: 0x121, bitSize: 0x1
        bool sboxmission_05_tacmapjammer;
        // offset: 0x122, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_04_ks_unlocks[4];
        // offset: 0x126, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_04_map_unlocks[4];
        // offset: 0x12a, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_05_ks_unlocks[4];
        // offset: 0x12e, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_06_ks_unlocks[4];
        // offset: 0x132, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_03_map_unlocks[4];
        // offset: 0x136, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_07_ks_unlocks[4];
        // offset: 0x13a, bitSize: 0x1
        bool sboxmission_04_tacmapjammer;
        // offset: 0x13b, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_08_ks_unlocks[4];
        // offset: 0x13f, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_02_map_unlocks[4];
        // offset: 0x143, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_01_map_unlocks[4];
        // offset: 0x147, bitSize: 0x1
        bool sboxmission_03_tacmapjammer;
        // offset: 0x148, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_00_map_unlocks[4];
        // offset: 0x14c, bitSize: 0x1
        bool sboxmission_02_tacmapjammer;
        // offset: 0x14d, bitSize: 0x1
        bool sboxmission_01_tacmapjammer;
        // offset: 0x14e, bitSize: 0x1
        bool sboxmission_00_tacmapjammer;
        // offset: 0x14f, bitSize: 0x1
        bool sboxmission_08_tacmapjammer;
        // offset: 0x150, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_08_map_unlocks[4];
        // offset: 0x154, bitSize: 0x1
        bool sboxmission_07_tacmapjammer;
        // offset: 0x155, bitSize: 0x4, array:0x4(hti:0xffff)
        bool sboxmission_07_map_unlocks[4];
    };

    // bitSize: 0x8, members: 2
    struct ValidationData {
        // offset: 0x0, bitSize: 0x5, array:0x5(hti:0x4)
        bool validationhint[ValidationHint];
    };

    // bitSize: 0x48, members: 3
    struct commonCustomization {
        // offset: 0x0, bitSize: 0x18(0x3 Byte(s))
        uint:19 musicbox;
        // offset: 0x18, bitSize: 0x18(0x3 Byte(s))
        uint:19 parachute;
        // offset: 0x30, bitSize: 0x18(0x3 Byte(s))
        uint:19 contrail;
    };

    // bitSize: 0xc0, members: 6
    struct AARData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int use_featured_operator_skin_xp;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int logistics_xp;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int combat_xp;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int strategy_xp;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int recon_xp;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int support_xp;
    };

    // bitSize: 0x610, members: 51
    struct RoundStats {
        // offset: 0x0, bitSize: 0x180(0x30 Byte(s))
        string(48) map;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int bonusxp;
        // offset: 0x1a0, bitSize: 0x10(0x2 Byte(s))
        short downs;
        // offset: 0x1b0, bitSize: 0x10(0x2 Byte(s))
        short kills;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x1e0, bitSize: 0x10(0x2 Byte(s))
        short stabs;
        // offset: 0x1f0, bitSize: 0x8(0x1 Byte(s))
        byte awardcount;
        // offset: 0x1f8, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int weaponxpearned[3];
        // offset: 0x258, bitSize: 0x10(0x2 Byte(s))
        short fieldgoals;
        // offset: 0x268, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x288, bitSize: 0x20(0x4 Byte(s))
        int gamemodescore;
        // offset: 0x2a8, bitSize: 0x20(0x4 Byte(s))
        int matchxp;
        // offset: 0x2c8, bitSize: 0x20(0x4 Byte(s))
        int medalxp;
        // offset: 0x2e8, bitSize: 0x10(0x2 Byte(s))
        short killsassurvivor;
        // offset: 0x2f8, bitSize: 0x10(0x2 Byte(s))
        short rescues;
        // offset: 0x308, bitSize: 0x10(0x2 Byte(s))
        short returns;
        // offset: 0x318, bitSize: 0x10(0x2 Byte(s))
        short squadmemberindex;
        // offset: 0x328, bitSize: 0x20(0x4 Byte(s))
        int matchbonusxp;
        // offset: 0x348, bitSize: 0x10(0x2 Byte(s))
        short setbacks;
        // offset: 0x358, bitSize: 0x8(0x1 Byte(s))
        ScoreboardType scoreboardtype;
        // offset: 0x360, bitSize: 0x10(0x2 Byte(s))
        short defends;
        // offset: 0x370, bitSize: 0x10(0x2 Byte(s))
        short defuses;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        int scorexp;
        // offset: 0x3a0, bitSize: 0x10(0x2 Byte(s))
        short killchains;
        // offset: 0x3b0, bitSize: 0x8(0x1 Byte(s))
        byte clientmatchindex;
        // offset: 0x3b8, bitSize: 0x8(0x1 Byte(s))
        BaseGameMode gamemode;
        // offset: 0x3c0, bitSize: 0x10(0x2 Byte(s))
        short objtime;
        // offset: 0x3d0, bitSize: 0x10(0x2 Byte(s))
        short segmentcaptures;
        // offset: 0x3e0, bitSize: 0x10(0x2 Byte(s))
        short touchdowns;
        // offset: 0x3f0, bitSize: 0x10(0x2 Byte(s))
        short killsasinfected;
        // offset: 0x400, bitSize: 0x10(0x2 Byte(s))
        short killstreak;
        // offset: 0x410, bitSize: 0x10(0x2 Byte(s))
        short damage;
        // offset: 0x420, bitSize: 0x10(0x2 Byte(s))
        short deaths;
        // offset: 0x430, bitSize: 0x10(0x2 Byte(s))
        short denied;
        // offset: 0x440, bitSize: 0xc0(0x18 Byte(s))
        AARData aardata;
        // offset: 0x500, bitSize: 0x20(0x4 Byte(s))
        int totalxp;
        // offset: 0x520, bitSize: 0x20(0x4 Byte(s))
        int fieldorderxp;
        // offset: 0x540, bitSize: 0x20(0x4 Byte(s))
        int miscxp;
        // offset: 0x560, bitSize: 0x10(0x2 Byte(s))
        short plants;
        // offset: 0x570, bitSize: 0x10(0x2 Byte(s))
        short destructions;
        // offset: 0x580, bitSize: 0x8(0x1 Byte(s))
        byte endreasontextindex;
        // offset: 0x588, bitSize: 0x10(0x2 Byte(s))
        short confirmed;
        // offset: 0x598, bitSize: 0x10(0x2 Byte(s))
        short assists;
        // offset: 0x5a8, bitSize: 0x20(0x4 Byte(s))
        int challengexp;
        // offset: 0x5c8, bitSize: 0x10(0x2 Byte(s))
        short contracts;
        // offset: 0x5d8, bitSize: 0x10(0x2 Byte(s))
        short challengenumcompleted;
        // offset: 0x5e8, bitSize: 0x10(0x2 Byte(s))
        short captures;
        // offset: 0x5f8, bitSize: 0x1
        bool win;
        // offset: 0x5f9, bitSize: 0x1
        bool loss;
        // offset: 0x5fa, bitSize: 0x14, array:0x14(hti:0xffff)
        Challenge challengescompleted[20];
    };

    // bitSize: 0x120, members: 5
    struct FilteredPlaylist {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint crc32;
        // offset: 0x20, bitSize: 0x40(0x8 Byte(s))
        uint64 localfilter;
        // offset: 0x60, bitSize: 0x40(0x8 Byte(s))
        uint64 high2filter;
        // offset: 0xa0, bitSize: 0x40(0x8 Byte(s))
        uint64 high3filter;
        // offset: 0xe0, bitSize: 0x40(0x8 Byte(s))
        uint64 filter;
    };

    // bitSize: 0x98, members: 10
    struct PastTitleData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int nextreadghosts;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int nextreadbo3;
        // offset: 0x40, bitSize: 0x10(0x2 Byte(s))
        short prestigeaw;
        // offset: 0x50, bitSize: 0x10(0x2 Byte(s))
        short prestigeghosts;
        // offset: 0x60, bitSize: 0x10(0x2 Byte(s))
        short prestigebo3;
        // offset: 0x70, bitSize: 0x20(0x4 Byte(s))
        int nextreadaw;
        // offset: 0x90, bitSize: 0x1
        bool playedaw;
        // offset: 0x91, bitSize: 0x1
        bool playedbo3;
        // offset: 0x92, bitSize: 0x1
        bool playedghosts;
    };

    // bitSize: 0x38, members: 3
    struct MPProgression {
        // offset: 0x0, bitSize: 0x30(0x6 Byte(s))
        PlayerLevel playerlevel;
        // offset: 0x30, bitSize: 0x1
        bool thirdperson;
    };

    // bitSize: 0x50, members: 3
    struct WeaponLevel {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int cpxp;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int mpxp;
        // offset: 0x40, bitSize: 0x10(0x2 Byte(s))
        short prestige;
    };

    // bitSize: 0x1860, members: 1
    struct SharedProgression {
        // offset: 0x0, bitSize: 0x1860(0x30c Byte(s)), array:0x4e(hti:0x5)
        WeaponLevel weaponlevel[Weapon];
    };

    // bitSize: 0x70, members: 16
    struct Achievements {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:7 hash_6d786d55c4cc1d3d;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_d1fd16ad3d591c25;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        uint:7 hash_b0e49d6fde7068f;
        // offset: 0x18, bitSize: 0x8(0x1 Byte(s))
        uint:6 hash_b3af697bc851af83;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        uint:6 hash_43e26bdf8be2fcc1;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        uint:7 hash_d93e9bc38723ced4;
        // offset: 0x30, bitSize: 0x10(0x2 Byte(s))
        uint:10 destroyer;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:2 hash_b72566f30f76d40d;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_648b0d0c6f2f0947;
        // offset: 0x50, bitSize: 0x10(0x2 Byte(s))
        uint:14 zm_eliminations;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        uint:6 hash_f460be13d24829e4;
        // offset: 0x68, bitSize: 0x1
        bool hash_6dcfb8613be32e82;
        // offset: 0x69, bitSize: 0x1
        bool hash_7a67e99930866e59;
        // offset: 0x6a, bitSize: 0x1
        bool hash_7c5e19efee6247a7;
        // offset: 0x6b, bitSize: 0x1
        bool hash_50091e34fcd341fc;
    };

    // bitSize: 0x500, members: 1
    struct InGameSeasonalEventData {
        // offset: 0x0, bitSize: 0x500(0xa0 Byte(s)), array:0x5(hti:0xffff)
        string(32) hash_60c2d8a133a9f261[5];
    };

    // bitSize: 0x58c8, members: 52
    struct CommonData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int extracustomclassesentitlement;
        // offset: 0x20, bitSize: 0x100(0x20 Byte(s))
        string(32) brsubgametype;
        // offset: 0x120, bitSize: 0x610(0xc2 Byte(s))
        RoundStats round;
        // offset: 0x730, bitSize: 0x8(0x1 Byte(s))
        byte sp_upsell_view_time_0;
        // offset: 0x738, bitSize: 0x8(0x1 Byte(s))
        byte sp_upsell_view_time_1;
        // offset: 0x740, bitSize: 0x10(0x2 Byte(s))
        short common_last_vote_base_counter;
        // offset: 0x750, bitSize: 0x8(0x1 Byte(s))
        byte sp_upsell_recent_updated_record;
        // offset: 0x758, bitSize: 0x8(0x1 Byte(s))
        byte previousprogressupsellpopuprank;
        // offset: 0x760, bitSize: 0x28(0x5 Byte(s))
        string(5) clantag;
        // offset: 0x788, bitSize: 0x8(0x1 Byte(s))
        byte isbad_preview;
        // offset: 0x790, bitSize: 0x1860(0x30c Byte(s))
        SharedProgression sharedprogression;
        // offset: 0x1ff0, bitSize: 0x20(0x4 Byte(s))
        int firstplayedsptime;
        // offset: 0x2010, bitSize: 0x20(0x4 Byte(s))
        uint codaccountrestrictedtimestamp;
        // offset: 0x2030, bitSize: 0x20(0x4 Byte(s))
        string(4) loggingcohort;
        // offset: 0x2050, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int quartermastereventids[4];
        // offset: 0x20d0, bitSize: 0x20(0x4 Byte(s))
        int common_entitlement_xp;
        // offset: 0x20f0, bitSize: 0x8(0x1 Byte(s))
        byte clantagtype;
        // offset: 0x20f8, bitSize: 0x120(0x24 Byte(s)), array:0x9(hti:0xffff)
        uint favoritecolors[9];
        // offset: 0x2218, bitSize: 0x8(0x1 Byte(s))
        byte mp_announcer_type;
        // offset: 0x2220, bitSize: 0x20(0x4 Byte(s))
        int sp_upsell_open_timestamp_0;
        // offset: 0x2240, bitSize: 0x20(0x4 Byte(s))
        int sp_upsell_open_timestamp_1;
        // offset: 0x2260, bitSize: 0xc0(0x18 Byte(s)), array:0xc(hti:0xffff)
        short common_read_news_articles[12];
        // offset: 0x2320, bitSize: 0x20(0x4 Byte(s))
        int numconsumables;
        // offset: 0x2340, bitSize: 0x20(0x4 Byte(s))
        int lastplayedtime;
        // offset: 0x2360, bitSize: 0x20(0x4 Byte(s))
        int common_clan_wars_xp;
        // offset: 0x2380, bitSize: 0x38(0x7 Byte(s))
        MPProgression mpprogression;
        // offset: 0x23b8, bitSize: 0x70(0xe Byte(s))
        Achievements achievements;
        // offset: 0x2428, bitSize: 0x1d40(0x3a8 Byte(s)), array:0x1a(hti:0xffff)
        FilteredPlaylist filteredplaylists[26];
        // offset: 0x4168, bitSize: 0x8(0x1 Byte(s))
        byte season_pass_upsell_count;
        // offset: 0x4170, bitSize: 0x400(0x80 Byte(s)), array:0x20(hti:0xffff)
        int consumablesused[32];
        // offset: 0x4570, bitSize: 0x20(0x4 Byte(s))
        uint clantaglootid;
        // offset: 0x4590, bitSize: 0x20(0x4 Byte(s))
        int timewarpoffsetseconds;
        // offset: 0x45b0, bitSize: 0x80(0x10 Byte(s)), array:0x10(hti:0xffff)
        byte lastmatchguid[16];
        // offset: 0x4630, bitSize: 0x48(0x9 Byte(s))
        commonCustomization commoncustomization;
        // offset: 0x4678, bitSize: 0x20(0x4 Byte(s))
        int extracustomclassesprestige;
        // offset: 0x4698, bitSize: 0x98(0x13 Byte(s))
        PastTitleData pasttitledata;
        // offset: 0x4730, bitSize: 0x8(0x1 Byte(s))
        byte sp_upsell_action_0;
        // offset: 0x4738, bitSize: 0x8(0x1 Byte(s))
        byte sp_upsell_action_1;
        // offset: 0x4740, bitSize: 0x800(0x100 Byte(s)), array:0x40(hti:0xffff)
        int lastlootdrops[64];
        // offset: 0x4f40, bitSize: 0x400(0x80 Byte(s)), array:0x80(hti:0xffff)
        byte reserved[128];
        // offset: 0x5340, bitSize: 0x500(0xa0 Byte(s))
        InGameSeasonalEventData InGameSeasonalEventData;
        // offset: 0x5840, bitSize: 0x20(0x4 Byte(s))
        int lastlootdropindex;
        // offset: 0x5860, bitSize: 0x20(0x4 Byte(s))
        uint favoritecolorscount;
        // offset: 0x5880, bitSize: 0x1
        bool shouldcheckcohortsampling;
        // offset: 0x5881, bitSize: 0x1
        bool quartermastersale;
        // offset: 0x5882, bitSize: 0x1
        bool newcraterewards;
        // offset: 0x5883, bitSize: 0x1
        bool shouldlogcohortdata;
        // offset: 0x5884, bitSize: 0x1
        bool gender;
        // offset: 0x5885, bitSize: 0x1
        bool isprivatepartyopen;
        // offset: 0x5886, bitSize: 0x1
        bool codaccountsignuprequest;
        // offset: 0x5887, bitSize: 0x40(0x8 Byte(s)), array:0x40(hti:0xffff)
        bool spcompletion[64];
    };

    // idx 0x0 members: 0x1 type: 5
    enum Challenge {
        ch_none // 0x0
    };

    // idx 0x1 members: 0x87 type: 5
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

    // idx 0x2 members: 0x10f type: 5
    enum LoadoutWeapon {
        none, // 0x0
        iw9_me_fists, // 0x1
        iw9_me_riotshield, // 0x2
        iw9_ar_golf3, // 0x3
        iw9_ar_kilo53, // 0x4
        iw9_ar_mike4, // 0x5
        iw9_ar_mike16, // 0x6
        iw9_ar_acharlie300, // 0x7
        iw9_ar_akilo, // 0x8
        iw9_ar_akilo105, // 0x9
        iw9_ar_akilo74, // 0xa
        iw9_ar_augolf, // 0xb
        iw9_ar_schotel, // 0xc
        iw9_ar_mcharlie, // 0xd
        iw9_ar_mcbravo, // 0xe
        iw9_ar_scharlie, // 0xf
        iw9_br_msecho, // 0x10
        iw9_br_soscar14, // 0x11
        iw9_br_ngsierra, // 0x12
        iw9_sm_aviktor, // 0x13
        iw9_sm_alpha57, // 0x14
        iw9_sm_mpapa5, // 0x15
        iw9_sm_mpapa7, // 0x16
        iw9_sm_beta, // 0x17
        iw9_sm_victor, // 0x18
        iw9_sm_apapa, // 0x19
        iw9_sm_mpapax, // 0x1a
        iw9_sm_papa90, // 0x1b
        iw9_pi_decho, // 0x1c
        iw9_pi_papa220, // 0x1d
        iw9_pi_golf17, // 0x1e
        iw9_pi_golf18, // 0x1f
        iw9_pi_swhiskey, // 0x20
        iw9_sn_alpha50, // 0x21
        iw9_sn_mromeo, // 0x22
        iw9_sn_limax, // 0x23
        iw9_lm_kilo21, // 0x24
        iw9_lm_slima, // 0x25
        iw9_lm_foxtrot, // 0x26
        iw9_lm_rkilo, // 0x27
        iw9_lm_ahotel, // 0x28
        iw9_lm_ngolf7, // 0x29
        iw9_sh_mbravo, // 0x2a
        iw9_sh_mike1014, // 0x2b
        iw9_sh_mviktor, // 0x2c
        iw9_sh_charlie725, // 0x2d
        iw9_sh_vecho, // 0x2e
        iw9_dm_mike24, // 0x2f
        iw9_dm_xmike2010, // 0x30
        iw9_dm_pgolf1, // 0x31
        iw9_dm_sa700, // 0x32
        iw9_dm_la700, // 0x33
        iw9_dm_sbeta, // 0x34
        iw9_dm_mike14, // 0x35
        iw9_dm_scromeo, // 0x36
        iw9_dm_stango25, // 0x37
        iw9_la_rpapa7, // 0x38
        iw9_la_juliet, // 0x39
        iw9_la_mike32, // 0x3a
        iw9_la_gromeo, // 0x3b
        iw9_la_kgolf, // 0x3c
        iw9_me_knife, // 0x3d
        iw9_lm_dblmg, // 0x3e
        iw9_me_sword01, // 0x3f
        jup_jp20_lm_evictor, // 0x40
        jup_jp08_lm_qbravo95lsw, // 0x41
        jup_jp19_dm_acharlied, // 0x42
        jup_ar_dg2, // 0x43
        jup_jp16_sh_recho870, // 0x44
        jup_jp09_sh_oromeo12, // 0x45
        iw9_swimfists, // 0x46
        iw9_me_diveknife, // 0x47
        iw9_me_climbfists, // 0x48
        jup_pi_raygun, // 0x49
        jup_pi_goldengun, // 0x4a
        iw9_pi_stimpistol, // 0x4b
        iw9_knifestab, // 0x4c
        iw9_lm_dblmg2, // 0x4d
        iw9_sn_india, // 0x4e
        iw9_pi_tango9, // 0x4f
        iw9_pi_dechoauto, // 0x50
        iw9_me_tonfa, // 0x51
        iw9_cyberemp, // 0x52
        iw9_me_rusherknife, // 0x53
        jup_me_zombie_hellhound, // 0x54
        jup_me_zombie_melee, // 0x55
        jup_me_zombie_mimic, // 0x56
        jup_jp07_sm_uzulup, // 0x57
        jup_jp01_ar_golf36, // 0x58
        jup_jp02_ar_bromeo805, // 0x59
        jup_jp19_ar_acharlie, // 0x5a
        jup_jp17_sn_hsierra, // 0x5b
        jup_jp05_ar_foxtrot2000, // 0x5c
        jup_jp07_pi_uzulum, // 0x5d
        jup_jp07_sm_uzulu, // 0x5e
        jup_jp02_sm_scharlie3, // 0x5f
        jup_jp01_dm_slima8, // 0x60
        jup_jp01_lm_mgolf36, // 0x61
        jup_cp01_sm_coscar635, // 0x62
        jup_jp13_dm_svictork, // 0x63
        jup_jp13_sn_svictor, // 0x64
        jup_jp04_sm_umike, // 0x65
        jup_jp04_sm_lwhiskey, // 0x66
        jup_jp06_lm_pkilop, // 0x67
        jup_jp12_pi_mike93, // 0x68
        jup_cp24_pi_glima21, // 0x69
        jup_jp14_pi_rsierra12, // 0x6a
        jup_jp02_br_bromeo2, // 0x6b
        jup_jp02_dm_bromeop, // 0x6c
        jup_jp19_br_acharlie450, // 0x6d
        jup_cp08_br_xmike5, // 0x6e
        jup_jp22_la_dromeo, // 0x6f
        jup_jp23_me_knife, // 0x70
        iw9_dm_crossbow, // 0x71
        jup_jp26_la_mike32, // 0x72
        iw9_la_mike32biolab, // 0x73
        jup_me_glassshiv, // 0x74
        jup_jp03_ar_aromeo160, // 0x75
        jup_jp03_sm_pmike, // 0x76
        jup_jp03_br_aromeo200, // 0x77
        jup_jp10_sn_cdelta50, // 0x78
        jup_jp25_ar_talpha95, // 0x79
        jup_jp26_la_cluster, // 0x7a
        jup_jp26_la_cluster32, // 0x7b
        jup_jp23_me_kalpha, // 0x7c
        jup_cp05_lm_halpha, // 0x7d
        jup_jp36_sn_boscar, // 0x7e
        jup_jp36_ar_anov94, // 0x7f
        jup_cp01_sh_aromeo410, // 0x80
        iw9_oxygenmask, // 0x81
        iw9_me_buzzsaw, // 0x82
        jup_me_axe, // 0x83
        jup_jp08_ar_qbravo97, // 0x84
        iw9_ar_helima, // 0x85
        iw9_sm_acharlie45, // 0x86
        iw9_ar_falpha, // 0x87
        iw9_ar_fecho, // 0x88
        iw9_sh_tsierra12, // 0x89
        iw9_me_superfists, // 0x8a
        iw9_ar_ralpha, // 0x8b
        iw9_sn_walpha, // 0x8c
        iw9_pi_mike2011, // 0x8d
        iw9_nukecore_mp, // 0x8e
        iw9_lm_dblmg_jup, // 0x8f
        iw9_drown, // 0x90
        support_box_mp, // 0x91
        specialty_null, // 0x92
        briefcase_bomb_mp, // 0x93
        iw9_sm_sdelta, // 0x94
        iw9_me_pickaxe, // 0x95
        jup_la_plasmagun, // 0x96
        iw9_ar_malima, // 0x97
        iw9_sm_acharlie9, // 0x98
        iw9_lm_mkilo3, // 0x99
        iw9_me_kamas, // 0x9a
        jup_cp06_ar_falpha, // 0x9b
        jup_cp15_lm_mkilo3, // 0x9c
        jup_jp31_dm_compound, // 0x9d
        jup_jp23_me_swhiskey, // 0x9e
        jup_jp32_pi_mpapa9, // 0x9f
        jup_jp34_ar_balpha27, // 0xa0
        jup_jp25_sm_talpham, // 0xa1
        jup_jp35_sn_moscar, // 0xa2
        jup_jp23_me_pdango, // 0xa3
        jup_cp01_sm_pcharlie9, // 0xa4
        jup_jp38_sh_spapa12, // 0xa5
        jup_jp37_dm_kappa98, // 0xa6
        jup_jp23_me_shotel, // 0xa7
        jup_jp41_sm_kpappa50, // 0xa8
        jup_jp23_me_spear, // 0xa9
        jup_jp44_ar_stango44, // 0xaa
        jup_jp23_me_pdango_arcade, // 0xab
        jup_jp28_lm_rpapa20, // 0xac
        jup_jp40_br_hcharlie36, // 0xad
        jup_jp23_me_shotel_arcade, // 0xae
        jup_amp_knifestab_mp, // 0xaf
        t10_ar_p01_coslo723, // 0xb0
        t10_ar_p02_aking74, // 0xb1
        t10_ar_p04_clove, // 0xb2
        t10_ar_p05_rmary2, // 0xb3
        t10_ar_p06_asvalor, // 0xb4
        t10_dm_p01_sroger25, // 0xb5
        t10_dm_p02_aeasy, // 0xb6
        t10_dm_p03_sgeorge550, // 0xb7
        t10_dm_p05_falove, // 0xb8
        t10_la_p17_pable3, // 0xb9
        t10_lm_p07_ksugar58, // 0xba
        t10_lm_p01_aroger10, // 0xbb
        t10_lm_p02_puncle21, // 0xbc
        t10_me_p15_knife, // 0xbd
        t10_pi_p13_usugar9, // 0xbe
        t10_pi_p12_paris30, // 0xbf
        t10_pi_p14_mable, // 0xc0
        t10_pi_p14_stiger, // 0xc1
        t10_sm_p04_chuck9, // 0xc2
        t10_sm_p03_safox, // 0xc3
        t10_sm_p06_sroger3, // 0xc4
        t10_sm_p02_geasy9, // 0xc5
        t10_sm_p12_roger31, // 0xc6
        t10_sn_p09_droger, // 0xc7
        t10_sn_p08_ultiger, // 0xc8
        t10_sh_p10_moslo500, // 0xc9
        t10_me_zombie_melee, // 0xca
        t10_me_zombie_hellhound, // 0xcb
        t10_me_zombie_mimic, // 0xcc
        t10_swimfists, // 0xcd
        t10_me_diveknife, // 0xce
        t10_me_fists, // 0xcf
        t10_me_climbfists, // 0xd0
        t10_me_zombiefists, // 0xd1
        t10_pi_p19_raygun, // 0xd2
        t10_lm_p19_jetgun, // 0xd3
        t10_la_mangler_cannon, // 0xd4
        t10_la_p18_stisaac, // 0xd5
        t10_lm_p25_drillgun, // 0xd6
        t10_ar_p22_able18, // 0xd7
        t10_ar_p23_love85, // 0xd8
        t10_dm_p09_svalor, // 0xd9
        t10_sn_p24_love96, // 0xda
        t10_sh_p25_uncle12, // 0xdb
        t10_sm_p21_pparis90, // 0xdc
        t10_lm_dblmg_deathmachine, // 0xdd
        t10_la_p19_opalww, // 0xde
        t10_me_p16_bat, // 0xdf
        t10_me_p19_bloodstoneww, // 0xe0
        t10_pi_p19_raygunmark2, // 0xe1
        t10_ar_p05_fable, // 0xe2
        t10_sm_p28_saug, // 0xe3
        t10_sn_p26_mary82, // 0xe4
        t10_sh_p27_jhavana, // 0xe5
        t10_sl_p29_goslo, // 0xe6
        t10_me_p30_cleaver, // 0xe7
        t10_me_p31_drill, // 0xe8
        t10_knifestab, // 0xe9
        jup_la_humangun, // 0xea
        jup_me_shovel, // 0xeb
        t10_ar_p34_tbaker, // 0xec
        t10_lm_p33_uxray, // 0xed
        t10_me_p36_skateboard, // 0xee
        t10_me_p37_katanas, // 0xef
        t10_me_p38_sais, // 0xf0
        t10_me_p39_nunchaku, // 0xf1
        t10_me_p40_bostaff, // 0xf2
        t10_sm_p41_perth, // 0xf3
        t10_sl_p35_blauncher, // 0xf4
        t10_ar_p45_kent, // 0xf5
        t10_ar_p47_gilroy, // 0xf6
        t10_pi_p42_pyork, // 0xf7
        t10_sm_p43_schuck, // 0xf8
        t10_sl_p44_napa, // 0xf9
        t10_me_p48_keene, // 0xfa
        t10_sn_p46_hugo, // 0xfb
        t10_ar_p49_fresno, // 0xfc
        t10_sm_p52_lisbon, // 0xfd
        t10_dm_p50_erie, // 0xfe
        sat_ar_condor, // 0xff
        sat_ar_eagle, // 0x100
        sat_ar_hawk, // 0x101
        sat_dm_scotia, // 0x102
        sat_la_polis, // 0x103
        sat_lm_hades, // 0x104
        sat_me_shockbaton, // 0x105
        sat_pi_atlas, // 0x106
        sat_pi_timir, // 0x107
        sat_sh_corso, // 0x108
        sat_sh_husky, // 0x109
        sat_sm_komodo, // 0x10a
        sat_sm_orca, // 0x10b
        sat_sm_zebra, // 0x10c
        sat_sn_baltic, // 0x10d
        sat_sn_drake // 0x10e
    };

    // idx 0x3 members: 0x5 type: 5
    enum ScoreboardType {
        none, // 0x0
        neutral, // 0x1
        allies, // 0x2
        axis, // 0x3
        multiteam // 0x4
    };

    // idx 0x4 members: 0x5 type: 5
    enum ValidationHint {
        StatsReset, // 0x0
        PrestigeReset, // 0x1
        FirstUpload, // 0x2
        FailedUpload, // 0x3
        DoubleXPUsed // 0x4
    };

    // idx 0x5 members: 0x4e type: 5
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

    // root: bitSize: 0x58d0, members: 2

    // offset: 0x0, bitSize: 0x58c8(0xb19 Byte(s))
    CommonData commondata;
    // offset: 0x58c8, bitSize: 0x8(0x1 Byte(s))
    ValidationData validationdata;
};

