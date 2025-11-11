// file .... ddl\sat\mp\sat_nongamedata.ddl

version 1 {
    // enums ..... 10 (0xa)
    // structs ... 28 (0x1c)
    // bit size .. 92408 (0x168f8)
    // byte size . 11551 (0x2d1f)
    // archive ... hash_2b710bee845e9cb9

    // bitSize: 0x8, members: 2
    struct ValidationData {
        // offset: 0x0, bitSize: 0x5, array:0x5(hti:0x0)
        bool validationhint[ValidationHint];
    };

    // bitSize: 0x106e0, members: 45
    struct UnlockTable {
        // offset: 0x0, bitSize: 0x2240(0x448 Byte(s)), array:0x112(hti:0xffff)
        int camo[274];
        // offset: 0x2240, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int perk[5];
        // offset: 0x22e0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int relic[1];
        // offset: 0x2300, bitSize: 0xc0(0x18 Byte(s)), array:0x6(hti:0xffff)
        int skill[6];
        // offset: 0x23c0, bitSize: 0x100(0x20 Byte(s)), array:0x8(hti:0xffff)
        int spray[8];
        // offset: 0x24c0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int super[3];
        // offset: 0x2520, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hudtheme[1];
        // offset: 0x2540, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int firstpartylicense[5];
        // offset: 0x25e0, bitSize: 0x1e0(0x3c Byte(s)), array:0xf(hti:0xffff)
        int executions[15];
        // offset: 0x27c0, bitSize: 0x1340(0x268 Byte(s)), array:0x9a(hti:0xffff)
        int playercards[154];
        // offset: 0x3b00, bitSize: 0x760(0xec Byte(s)), array:0x3b(hti:0xffff)
        int weapon_charm[59];
        // offset: 0x4260, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int clantag[3];
        // offset: 0x42c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int currencypack[1];
        // offset: 0x42e0, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int equipment[5];
        // offset: 0x4380, bitSize: 0x920(0x124 Byte(s)), array:0x49(hti:0xffff)
        int reticle[73];
        // offset: 0x4ca0, bitSize: 0x780(0xf0 Byte(s)), array:0x3c(hti:0xffff)
        int operator_skin[60];
        // offset: 0x5420, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int prestigemastercolor[2];
        // offset: 0x5460, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int prestigemastertitle[3];
        // offset: 0x54c0, bitSize: 0x3e0(0x7c Byte(s)), array:0x1f(hti:0xffff)
        int loadingscreen[31];
        // offset: 0x58a0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int masterybadgecategory[2];
        // offset: 0x58e0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_track[1];
        // offset: 0x5900, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int skilltrack[1];
        // offset: 0x5920, bitSize: 0x120(0x24 Byte(s)), array:0x9(hti:0xffff)
        int zombie_augment[9];
        // offset: 0x5a40, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int parachute[1];
        // offset: 0x5a60, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int battlepass[1];
        // offset: 0x5a80, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_camo[1];
        // offset: 0x5aa0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int special[1];
        // offset: 0x5ac0, bitSize: 0x7c40(0xf88 Byte(s)), array:0x3e2(hti:0xffff)
        int attachment[994];
        // offset: 0xd700, bitSize: 0x8c0(0x118 Byte(s)), array:0x46(hti:0xffff)
        int sticker[70];
        // offset: 0xdfc0, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int levelicon[11];
        // offset: 0xe120, bitSize: 0xe00(0x1c0 Byte(s)), array:0x70(hti:0xffff)
        int emblems[112];
        // offset: 0xef20, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int calloutmarkerpingitem[1];
        // offset: 0xef40, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int gobblegum[2];
        // offset: 0xef80, bitSize: 0xe0(0x1c Byte(s)), array:0x7(hti:0xffff)
        int emotes[7];
        // offset: 0xf060, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int wildcard[1];
        // offset: 0xf080, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int feature[2];
        // offset: 0xf0c0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int genericblueprint[2];
        // offset: 0xf100, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int ammomod[1];
        // offset: 0xf120, bitSize: 0xf40(0x1e8 Byte(s)), array:0x7a(hti:0xffff)
        int weapon[122];
        // offset: 0x10060, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int killstreak[5];
        // offset: 0x10100, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int contrail[1];
        // offset: 0x10120, bitSize: 0x120(0x24 Byte(s)), array:0x9(hti:0xffff)
        int operator[9];
        // offset: 0x10240, bitSize: 0x300(0x60 Byte(s)), array:0x18(hti:0xffff)
        int consumable[24];
        // offset: 0x10540, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int gesture[1];
        // offset: 0x10560, bitSize: 0x180(0x30 Byte(s)), array:0xc(hti:0xffff)
        int masterybadge[12];
    };

    // bitSize: 0x18, members: 4
    struct FTUEVideo {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short version;
        // offset: 0x10, bitSize: 0x1
        bool iscomplete;
        // offset: 0x11, bitSize: 0x1
        bool isviewed;
    };

    // bitSize: 0x610, members: 2
    struct TelescopeData {
        // offset: 0x0, bitSize: 0x600(0xc0 Byte(s)), array:0x40(hti:0xffff)
        FTUEVideo ftuevideo[64];
        // offset: 0x600, bitSize: 0x10(0x2 Byte(s))
        short ftuevideowatchedversion;
    };

    // bitSize: 0x10, members: 2
    struct CallingCardSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        RaritySortOptions raritysortpreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        SeasonSortOptions seasonsortpreference;
    };

    // bitSize: 0x18, members: 4
    struct EmblemSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        RaritySortOptions raritysortpreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        SeasonSortOptions seasonsortpreference;
        // offset: 0x10, bitSize: 0x1
        OfficerProgressionSortOptions officersortpreference;
    };

    // bitSize: 0x10, members: 2
    struct GesturesSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        RaritySortOptions raritysortpreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        SeasonSortOptions seasonsortpreference;
    };

    // bitSize: 0x10, members: 2
    struct CharmsSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        RaritySortOptions raritysortpreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        SeasonSortOptions seasonsortpreference;
    };

    // bitSize: 0x10, members: 2
    struct StickersSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        RaritySortOptions raritysortpreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        SeasonSortOptions seasonsortpreference;
    };

    // bitSize: 0x8, members: 8
    struct AttachmentStatsPreferences {
        // offset: 0x0, bitSize: 0x1
        bool handling;
        // offset: 0x1, bitSize: 0x1
        bool range;
        // offset: 0x2, bitSize: 0x1
        bool accuracy;
        // offset: 0x3, bitSize: 0x1
        bool damage;
        // offset: 0x4, bitSize: 0x1
        bool recoil;
        // offset: 0x5, bitSize: 0x1
        bool mobility;
        // offset: 0x6, bitSize: 0x1
        bool fire_rate;
    };

    // bitSize: 0x8, members: 3
    struct UnlockPreferences {
        // offset: 0x0, bitSize: 0x1
        bool locked;
        // offset: 0x1, bitSize: 0x1
        bool unlocked;
    };

    // bitSize: 0x10, members: 2
    struct AttachmentSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        AttachmentStatsPreferences attachmentstatspreference;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        UnlockPreferences unlockpreference;
    };

    // bitSize: 0x10, members: 2
    struct VehicleSortPreferences {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        CamoActiveFilter camoactivefilter;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        TrackActiveFilter trackactivefilter;
    };

    // bitSize: 0x78, members: 7
    struct PlayerSortPreferences {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        GesturesSortPreferences gesturessortpreference;
        // offset: 0x10, bitSize: 0x18(0x3 Byte(s))
        EmblemSortPreferences emblemsortpreference;
        // offset: 0x28, bitSize: 0x10(0x2 Byte(s))
        StickersSortPreferences stickersortpreference;
        // offset: 0x38, bitSize: 0x10(0x2 Byte(s))
        CharmsSortPreferences charmssortpreference;
        // offset: 0x48, bitSize: 0x10(0x2 Byte(s))
        AttachmentSortPreferences attachmentsortpreference;
        // offset: 0x58, bitSize: 0x10(0x2 Byte(s))
        VehicleSortPreferences vehiclesortpreference;
        // offset: 0x68, bitSize: 0x10(0x2 Byte(s))
        CallingCardSortPreferences callingcardsortpreference;
    };

    // bitSize: 0x8, members: 8
    struct NotificationSettings {
        // offset: 0x0, bitSize: 0x1
        bool broadcastchannelinvite;
        // offset: 0x1, bitSize: 0x1
        bool broadcastclaninvite;
        // offset: 0x2, bitSize: 0x1
        bool broadcastgroupinvite;
        // offset: 0x3, bitSize: 0x1
        bool voicesharestarted;
        // offset: 0x4, bitSize: 0x1
        bool newmember;
        // offset: 0x5, bitSize: 0x1
        bool broadcastpartyinvite;
        // offset: 0x6, bitSize: 0x1
        bool newtextchatmessages;
    };

    // bitSize: 0x8, members: 6
    struct FeedFilterSettings {
        // offset: 0x0, bitSize: 0x1
        bool broadcastchannelinvite;
        // offset: 0x1, bitSize: 0x1
        bool membertextmessages;
        // offset: 0x2, bitSize: 0x1
        bool broadcastclaninvite;
        // offset: 0x3, bitSize: 0x1
        bool broadcastgroupinvite;
        // offset: 0x4, bitSize: 0x1
        bool broadcastpartyinvite;
    };

    // bitSize: 0x78, members: 6
    struct SocialPartySettings {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint color;
        // offset: 0x20, bitSize: 0x40(0x8 Byte(s))
        uint64 partyid;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        NotificationSettings notificationsettings;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        FeedFilterSettings feedfilters;
        // offset: 0x70, bitSize: 0x1
        bool usedefault;
    };

    // bitSize: 0x10, members: 2
    struct DefaultPartySettings {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        NotificationSettings notificationsettings;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        FeedFilterSettings feedfilters;
    };

    // bitSize: 0x2d8, members: 21
    struct SeasonalEventData {
        // offset: 0x0, bitSize: 0x100(0x20 Byte(s))
        string(32) eventname;
        // offset: 0x100, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_ae5b37a65f223e2;
        // offset: 0x140, bitSize: 0x40(0x8 Byte(s))
        uint64 lastprimaryxp;
        // offset: 0x180, bitSize: 0x40(0x8 Byte(s))
        uint64 prematchchallengeprogress;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        uint hash_932f2d0141d8e8aa;
        // offset: 0x1e0, bitSize: 0x40(0x8 Byte(s))
        uint64 lastsecondaryxp;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        uint prematchtrophycount;
        // offset: 0x240, bitSize: 0x8(0x1 Byte(s))
        byte communitymilestonesunlocksseen;
        // offset: 0x248, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_7cf29754fb49acce;
        // offset: 0x288, bitSize: 0x1
        bool hasseenonboardingoutro;
        // offset: 0x289, bitSize: 0x40(0x8 Byte(s)), array:0x40(hti:0xffff)
        bool seasonalchallengesunlocksseen[64];
        // offset: 0x2c9, bitSize: 0x1
        bool hash_3c46037136f0265e;
        // offset: 0x2ca, bitSize: 0x1
        bool hasseeneventcompletebink;
        // offset: 0x2cb, bitSize: 0x1
        bool hash_47e32184eb4066d6;
        // offset: 0x2cc, bitSize: 0x1
        bool hash_baf9e99b39723807;
        // offset: 0x2cd, bitSize: 0x1
        bool hash_6adb713f1af9bd26;
        // offset: 0x2ce, bitSize: 0x1
        bool hasseenonboarding;
        // offset: 0x2cf, bitSize: 0x1
        bool hash_bde5c0775cb9c830;
        // offset: 0x2d0, bitSize: 0x1
        bool hash_61fbfd5eccf6bc5c;
        // offset: 0x2d1, bitSize: 0x1
        bool hash_d6d99f371ff675c6;
    };

    // bitSize: 0xc00, members: 4
    struct LFPSearchParameters {
        // offset: 0x0, bitSize: 0x300(0x60 Byte(s)), array:0x4(hti:0xffff)
        string(24) secondary_playstyle[4];
        // offset: 0x300, bitSize: 0x300(0x60 Byte(s)), array:0x4(hti:0xffff)
        string(24) playstyle[4];
        // offset: 0x600, bitSize: 0x300(0x60 Byte(s)), array:0x4(hti:0xffff)
        string(24) language[4];
        // offset: 0x900, bitSize: 0x300(0x60 Byte(s)), array:0x4(hti:0xffff)
        string(24) communication[4];
    };

    // bitSize: 0x28, members: 2
    struct BattlePassSeasonData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte hash_6c208c1b32b835fc;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        uint pageunlockbreadcrumbs;
    };

    // bitSize: 0x118, members: 6
    struct BattlePassData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte lastblackcellpurchasecelebrationseen;
        // offset: 0x8, bitSize: 0xf0(0x1e Byte(s)), array:0x6(hti:0xffff)
        BattlePassSeasonData seasondata[6];
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassseasonintroseen;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassftueseen;
        // offset: 0x108, bitSize: 0x8(0x1 Byte(s))
        byte lastseasonrolloverautoconsumednotificationseen;
        // offset: 0x110, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassautospendftueseen;
    };

    // bitSize: 0x8, members: 3
    struct NextTitlePreOrderData {
        // offset: 0x0, bitSize: 0x1
        bool hash_364142981df6be57;
        // offset: 0x1, bitSize: 0x1
        bool hash_1fb8a2c8585b5b13;
    };

    // bitSize: 0x290, members: 3
    struct StoreData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte hash_d507171b17876ba;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        NextTitlePreOrderData hash_7fb86b9a243adba5;
        // offset: 0x10, bitSize: 0x280(0x50 Byte(s)), array:0x14(hti:0xffff)
        uint hash_7e8cbc444ebcc6ff[20];
    };

    // bitSize: 0x60, members: 3
    struct TrackedChallenge {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int achievementid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int lootid;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int aekindid;
    };

    // bitSize: 0x3c0, members: 1
    struct TrackedChallenges {
        // offset: 0x0, bitSize: 0x3c0(0x78 Byte(s)), array:0xa(hti:0xffff)
        TrackedChallenge trackedchallenge[10];
    };

    // bitSize: 0x16820, members: 78
    struct NonGameData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint lastseensurveyversion;
        // offset: 0x20, bitSize: 0x106e0(0x20dc Byte(s))
        UnlockTable isnew;
        // offset: 0x10700, bitSize: 0xb40(0x168 Byte(s)), array:0x3(hti:0x7)
        TrackedChallenges hash_a257e7c00c256436[TrackedGameMode];
        // offset: 0x11240, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_background[2];
        // offset: 0x11260, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivewhispers;
        // offset: 0x11268, bitSize: 0x40(0x8 Byte(s))
        uint64 toastnotificationunpausetimestamp;
        // offset: 0x112a8, bitSize: 0x20(0x4 Byte(s))
        uint lastseenchaptersteamoverlayofftoast;
        // offset: 0x112c8, bitSize: 0x20(0x4 Byte(s))
        int hash_f5d770dd065a0f00;
        // offset: 0x112e8, bitSize: 0x16c0(0x2d8 Byte(s)), array:0x8(hti:0xffff)
        SeasonalEventData seasonalevents[8];
        // offset: 0x129a8, bitSize: 0x20(0x4 Byte(s))
        int lastplayedcategoryid;
        // offset: 0x129c8, bitSize: 0x8(0x1 Byte(s))
        byte quickplayfilter;
        // offset: 0x129d0, bitSize: 0x3c0(0x78 Byte(s)), array:0xa(hti:0xffff)
        TrackedChallenge trackedchallenge[10];
        // offset: 0x12d90, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int tournamentquits[4];
        // offset: 0x12e10, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivefriendrequests;
        // offset: 0x12e18, bitSize: 0xc00(0x180 Byte(s))
        LFPSearchParameters lfpsearchparams;
        // offset: 0x13a18, bitSize: 0x200(0x40 Byte(s))
        string(64) lastplayedplaymenuref;
        // offset: 0x13c18, bitSize: 0xb8(0x17 Byte(s)), array:0x17(hti:0xffff)
        uint:6 battlepassbreadcrumbs[23];
        // offset: 0x13cd0, bitSize: 0x8(0x1 Byte(s))
        PartyPrivacySetting partyprivacysettings;
        // offset: 0x13cd8, bitSize: 0x20(0x4 Byte(s))
        int bigtournamentbanstart;
        // offset: 0x13cf8, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeplayed;
        // offset: 0x13d18, bitSize: 0x290(0x52 Byte(s))
        StoreData storedata;
        // offset: 0x13fa8, bitSize: 0x20(0x4 Byte(s))
        int lastplayedplaylistid;
        // offset: 0x13fc8, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeselected;
        // offset: 0x13fe8, bitSize: 0x40(0x8 Byte(s))
        uint64 influencercodetime;
        // offset: 0x14028, bitSize: 0x20(0x4 Byte(s))
        int hash_6c16fcf7dda0c89a;
        // offset: 0x14048, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengeslastseentime;
        // offset: 0x14068, bitSize: 0x50(0xa Byte(s))
        string(10) lastseenlocale;
        // offset: 0x140b8, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengespopupchecksum;
        // offset: 0x140d8, bitSize: 0x20(0x4 Byte(s))
        int rankedplay_crossplay_setting;
        // offset: 0x140f8, bitSize: 0x258(0x4b Byte(s)), array:0x5(hti:0xffff)
        SocialPartySettings socialpartysettings[5];
        // offset: 0x14350, bitSize: 0x20(0x4 Byte(s))
        int tokensearnedsincelastbattlepassupsell;
        // offset: 0x14370, bitSize: 0x20(0x4 Byte(s))
        uint spuninstallpromptlastseentimestamp;
        // offset: 0x14390, bitSize: 0x20(0x4 Byte(s))
        uint lastbattlepassmenuxp;
        // offset: 0x143b0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivechannelinvites;
        // offset: 0x143b8, bitSize: 0x118(0x23 Byte(s))
        BattlePassData battlepassdata;
        // offset: 0x144d0, bitSize: 0x20(0x4 Byte(s))
        uint lastrank;
        // offset: 0x144f0, bitSize: 0x20(0x4 Byte(s))
        uint lastseenseasonsteamoverlayofftoast;
        // offset: 0x14510, bitSize: 0xb40(0x168 Byte(s)), array:0x3(hti:0x7)
        TrackedChallenges trackedweaponcamochallenge[TrackedGameMode];
        // offset: 0x15050, bitSize: 0x10(0x2 Byte(s))
        DefaultPartySettings defaultpartysettings;
        // offset: 0x15060, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receiveactivityinvites;
        // offset: 0x15068, bitSize: 0x20(0x4 Byte(s))
        int hash_a3b001d5acb98134;
        // offset: 0x15088, bitSize: 0x610(0xc2 Byte(s))
        TelescopeData telescopedata;
        // offset: 0x15698, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_patch[2];
        // offset: 0x156b8, bitSize: 0x20(0x4 Byte(s))
        int lastseenactivearmoryindex;
        // offset: 0x156d8, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivegroupinvites;
        // offset: 0x156e0, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_frame[2];
        // offset: 0x15700, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_title[2];
        // offset: 0x15720, bitSize: 0x78(0xf Byte(s))
        PlayerSortPreferences sortpreferences;
        // offset: 0x15798, bitSize: 0x20(0x4 Byte(s))
        int hash_1a0731a9833a8db0;
        // offset: 0x157b8, bitSize: 0xb40(0x168 Byte(s)), array:0x3(hti:0x7)
        TrackedChallenges trackedstickerbookchallenge[TrackedGameMode];
        // offset: 0x162f8, bitSize: 0x8(0x1 Byte(s))
        byte seenftuevideoversion;
        // offset: 0x16300, bitSize: 0x200(0x40 Byte(s))
        string(64) savedusername;
        // offset: 0x16500, bitSize: 0x200(0x40 Byte(s))
        string(64) influencercode;
        // offset: 0x16700, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassfreetierseen;
        // offset: 0x16708, bitSize: 0x20(0x4 Byte(s))
        uint storelastseentime;
        // offset: 0x16728, bitSize: 0x8(0x1 Byte(s))
        byte battlepasspurchasependingseason;
        // offset: 0x16730, bitSize: 0x20(0x4 Byte(s))
        int currenttournament;
        // offset: 0x16750, bitSize: 0x1
        bool toggleofflinefriends;
        // offset: 0x16751, bitSize: 0x1
        bool isbponboardingcleared;
        // offset: 0x16752, bitSize: 0x1
        bool wereoperatorexecutionsvalidated;
        // offset: 0x16753, bitSize: 0x1
        bool cross_play_enabled;
        // offset: 0x16754, bitSize: 0x1
        bool isshowprosandconsenabled;
        // offset: 0x16755, bitSize: 0x1
        bool hasseencerpreorderthankyoumenu;
        // offset: 0x16756, bitSize: 0x1
        bool hasanytempbanactive;
        // offset: 0x16757, bitSize: 0x1
        bool disablemeatshieldvoice;
        // offset: 0x16758, bitSize: 0x10(0x2 Byte(s)), array:0x10(hti:0xffff)
        bool hash_35e14cda83c7c4b8[16];
        // offset: 0x16768, bitSize: 0x1
        bool mobileshaderdlogstarted;
        // offset: 0x16769, bitSize: 0x9, array:0x9(hti:0x1)
        bool seenstoryintro[MapList];
        // offset: 0x16772, bitSize: 0x1
        bool rankedplay_crossplay_enabled;
        // offset: 0x16773, bitSize: 0x80(0x10 Byte(s)), array:0x80(hti:0xffff)
        bool gamewidetutorials[128];
        // offset: 0x167f3, bitSize: 0x1
        bool hasseenfirstpartytoatvimenu;
        // offset: 0x167f4, bitSize: 0x1
        bool muteonjoinparty;
        // offset: 0x167f5, bitSize: 0x1
        bool party_autofill_lock;
        // offset: 0x167f6, bitSize: 0x1
        bool disableproximityvoice;
        // offset: 0x167f7, bitSize: 0x1
        bool wasprotuningplayerdataconverted;
        // offset: 0x167f8, bitSize: 0x1
        bool hash_c25f189c1c6901bd;
        // offset: 0x167f9, bitSize: 0x20(0x4 Byte(s)), array:0x20(hti:0xffff)
        bool postshipflags[32];
    };

    // idx 0x0 members: 0x5 type: 5
    enum ValidationHint {
        StatsReset, // 0x0
        PrestigeReset, // 0x1
        FirstUpload, // 0x2
        FailedUpload, // 0x3
        DoubleXPUsed // 0x4
    };

    // idx 0x1 members: 0x9 type: c
    enum MapList {
        zm_t10_garnet, // 0x0
        zm_t10_quartz, // 0x1
        zm_t10_bloodstone, // 0x2
        zm_t10_opal, // 0x3
        zm_t10_topaz, // 0x4
        zm_t10_jade, // 0x5
        zm_t10_garnet_jh, // 0x6
        zm_sat_firefly, // 0x7
        zm_sat_hornet // 0x8
    };

    // idx 0x2 members: 0x5 type: 5
    enum PartyPrivacySetting {
        public, // 0x0
        socially_connected, // 0x1
        joinable_by_friends, // 0x2
        invite_only, // 0x3
        closed // 0x4
    };

    // idx 0x3 members: 0x4 type: 5
    enum SocialPrivacySetting {
        everyone, // 0x0
        socially_connected, // 0x1
        friends_only, // 0x2
        no_one // 0x3
    };

    // idx 0x4 members: 0x3 type: 5
    enum RaritySortOptions {
        rarity_high_first, // 0x0
        rarity_low_first, // 0x1
        rarity_none // 0x2
    };

    // idx 0x5 members: 0x3 type: 5
    enum SeasonSortOptions {
        season_recent_first, // 0x0
        season_old_first, // 0x1
        season_none // 0x2
    };

    // idx 0x6 members: 0x2 type: 5
    enum OfficerProgressionSortOptions {
        officer_none, // 0x0
        officer_first // 0x1
    };

    // idx 0x7 members: 0x3 type: 5
    enum TrackedGameMode {
        MP, // 0x0
        ZM, // 0x1
        OB // 0x2
    };

    // idx 0x8 members: 0x5 type: 5
    enum CamoActiveFilter {
        all, // 0x0
        favorites, // 0x1
        collected, // 0x2
        fromBattlePass, // 0x3
        fromStoreBundle // 0x4
    };

    // idx 0x9 members: 0x4 type: 5
    enum TrackActiveFilter {
        all, // 0x0
        favorites, // 0x1
        unlocked, // 0x2
        fromBattlePass // 0x3
    };

    // root: bitSize: 0x16848, members: 3

    // offset: 0x0, bitSize: 0x16820(0x2d04 Byte(s))
    NonGameData nongamedata;
    // offset: 0x16820, bitSize: 0x20(0x4 Byte(s))
    int design_version;
    // offset: 0x16840, bitSize: 0x8(0x1 Byte(s))
    ValidationData validationdata;
};

