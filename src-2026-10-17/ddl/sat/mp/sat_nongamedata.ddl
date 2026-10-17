// file .... ddl\sat\mp\sat_nongamedata.ddl

version 1 {
    // enums ..... 10 (0xa)
    // structs ... 29 (0x1d)
    // bit size .. 137888 (0x21aa0)
    // byte size . 17236 (0x4354)
    // archive ... hash_dcc2646a2341fdd1

    // bitSize: 0x8, members: 2
    struct ValidationData {
        // offset: 0x0, bitSize: 0x5, array:0x5(hti:0x0)
        bool validationhint[ValidationHint];
    };

    // bitSize: 0x133a0, members: 44
    struct UnlockTable {
        // offset: 0x0, bitSize: 0x2d00(0x5a0 Byte(s)), array:0x168(hti:0xffff)
        int camo[360];
        // offset: 0x2d00, bitSize: 0xc0(0x18 Byte(s)), array:0x6(hti:0xffff)
        int perk[6];
        // offset: 0x2dc0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int relic[1];
        // offset: 0x2de0, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int skill[11];
        // offset: 0x2f40, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int spray[11];
        // offset: 0x30a0, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int super[4];
        // offset: 0x3120, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hudtheme[1];
        // offset: 0x3140, bitSize: 0x240(0x48 Byte(s)), array:0x12(hti:0xffff)
        int executions[18];
        // offset: 0x3380, bitSize: 0x14e0(0x29c Byte(s)), array:0xa7(hti:0xffff)
        int playercards[167];
        // offset: 0x4860, bitSize: 0x840(0x108 Byte(s)), array:0x42(hti:0xffff)
        int weapon_charm[66];
        // offset: 0x50a0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int clantag[3];
        // offset: 0x5100, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int currencypack[1];
        // offset: 0x5120, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int equipment[5];
        // offset: 0x51c0, bitSize: 0x9c0(0x138 Byte(s)), array:0x4e(hti:0xffff)
        int reticle[78];
        // offset: 0x5b80, bitSize: 0x920(0x124 Byte(s)), array:0x49(hti:0xffff)
        int operator_skin[73];
        // offset: 0x64a0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int prestigemastercolor[2];
        // offset: 0x64e0, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int prestigemastertitle[4];
        // offset: 0x6560, bitSize: 0x440(0x88 Byte(s)), array:0x22(hti:0xffff)
        int loadingscreen[34];
        // offset: 0x69a0, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int masterybadgecategory[2];
        // offset: 0x69e0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_track[1];
        // offset: 0x6a00, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int skilltrack[1];
        // offset: 0x6a20, bitSize: 0x140(0x28 Byte(s)), array:0xa(hti:0xffff)
        int zombie_augment[10];
        // offset: 0x6b60, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int parachute[1];
        // offset: 0x6b80, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int battlepass[1];
        // offset: 0x6ba0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_camo[1];
        // offset: 0x6bc0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int special[1];
        // offset: 0x6be0, bitSize: 0x9060(0x120c Byte(s)), array:0x483(hti:0xffff)
        int attachment[1155];
        // offset: 0xfc40, bitSize: 0x980(0x130 Byte(s)), array:0x4c(hti:0xffff)
        int sticker[76];
        // offset: 0x105c0, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int levelicon[11];
        // offset: 0x10720, bitSize: 0xfe0(0x1fc Byte(s)), array:0x7f(hti:0xffff)
        int emblems[127];
        // offset: 0x11700, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int calloutmarkerpingitem[1];
        // offset: 0x11720, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int gobblegum[2];
        // offset: 0x11760, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int emotes[11];
        // offset: 0x118c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int wildcard[1];
        // offset: 0x118e0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int feature[3];
        // offset: 0x11940, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int genericblueprint[4];
        // offset: 0x119c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int ammomod[1];
        // offset: 0x119e0, bitSize: 0x11e0(0x23c Byte(s)), array:0x8f(hti:0xffff)
        int weapon[143];
        // offset: 0x12bc0, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int killstreak[5];
        // offset: 0x12c60, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int contrail[1];
        // offset: 0x12c80, bitSize: 0x140(0x28 Byte(s)), array:0xa(hti:0xffff)
        int operator[10];
        // offset: 0x12dc0, bitSize: 0x400(0x80 Byte(s)), array:0x20(hti:0xffff)
        int consumable[32];
        // offset: 0x131c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int gesture[1];
        // offset: 0x131e0, bitSize: 0x1c0(0x38 Byte(s)), array:0xe(hti:0xffff)
        int masterybadge[14];
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

    // bitSize: 0x3d8, members: 6
    struct SeasonalEventChallengeTrackProgression {
        // offset: 0x0, bitSize: 0x380(0x70 Byte(s)), array:0xe(hti:0xffff)
        uint64 hash_2292dd32fed2d7f8[14];
        // offset: 0x380, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_67aefb21e148fc0a;
        // offset: 0x3c0, bitSize: 0xe, array:0xe(hti:0xffff)
        bool hash_feddd5fc76a7f1a6[14];
        // offset: 0x3ce, bitSize: 0x3, array:0x3(hti:0xffff)
        bool hash_f6ccca05ad2a3cf[3];
        // offset: 0x3d1, bitSize: 0x1
        bool hash_563e22ee0d9625c8;
    };

    // bitSize: 0x11d0, members: 21
    struct SeasonalEventData {
        // offset: 0x0, bitSize: 0x100(0x20 Byte(s))
        string(32) eventname;
        // offset: 0x100, bitSize: 0xf60(0x1ec Byte(s)), array:0x4(hti:0xffff)
        SeasonalEventChallengeTrackProgression hash_a12f68cd624c9920[4];
        // offset: 0x1060, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_ae5b37a65f223e2;
        // offset: 0x10a0, bitSize: 0x40(0x8 Byte(s))
        uint64 prematchchallengeprogress;
        // offset: 0x10e0, bitSize: 0x20(0x4 Byte(s))
        uint hash_932f2d0141d8e8aa;
        // offset: 0x1100, bitSize: 0x20(0x4 Byte(s))
        int hash_e1684caf686347a4;
        // offset: 0x1120, bitSize: 0x20(0x4 Byte(s))
        int hash_24a3e8c0cef06bf5;
        // offset: 0x1140, bitSize: 0x20(0x4 Byte(s))
        uint hash_363b132a8abb6ae9;
        // offset: 0x1160, bitSize: 0x20(0x4 Byte(s))
        uint prematchtrophycount;
        // offset: 0x1180, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_7cf29754fb49acce;
        // offset: 0x11c0, bitSize: 0x1
        bool hasseenonboardingoutro;
        // offset: 0x11c1, bitSize: 0x1
        bool hash_3c46037136f0265e;
        // offset: 0x11c2, bitSize: 0x1
        bool hasseeneventcompletebink;
        // offset: 0x11c3, bitSize: 0x1
        bool hasseeninstantreward;
        // offset: 0x11c4, bitSize: 0x1
        bool hasseenpremiumpurchaseupsell;
        // offset: 0x11c5, bitSize: 0x1
        bool hash_6adb713f1af9bd26;
        // offset: 0x11c6, bitSize: 0x1
        bool hasseenonboarding;
        // offset: 0x11c7, bitSize: 0x2, array:0x2(hti:0xffff)
        bool hash_f3c88ef2b10b361f[2];
        // offset: 0x11c9, bitSize: 0x1
        bool hasseenlockreward;
        // offset: 0x11ca, bitSize: 0x1
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

    // bitSize: 0x50, members: 7
    struct BattlePassSeasonData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte hash_6c208c1b32b835fc;
        // offset: 0x8, bitSize: 0x10(0x2 Byte(s))
        uint:16 hash_41e9a1b791a425f6;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        uint pageunlockbreadcrumbs;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        byte hash_16a3a704496161f8;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte hash_d3a2c9b05f84d6f8;
        // offset: 0x48, bitSize: 0x1
        bool hash_a4768ce1b4335f2e;
    };

    // bitSize: 0x2b0, members: 7
    struct BattlePassData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte lastblackcellpurchasecelebrationseen;
        // offset: 0x8, bitSize: 0x280(0x50 Byte(s)), array:0x8(hti:0xffff)
        BattlePassSeasonData seasondata[8];
        // offset: 0x288, bitSize: 0x8(0x1 Byte(s))
        byte hash_770ccaeb56024b93;
        // offset: 0x290, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassseasonintroseen;
        // offset: 0x298, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassftueseen;
        // offset: 0x2a0, bitSize: 0x8(0x1 Byte(s))
        byte lastseasonrolloverautoconsumednotificationseen;
        // offset: 0x2a8, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassautospendftueseen;
    };

    // bitSize: 0x8, members: 4
    struct NextTitlePreOrderData {
        // offset: 0x0, bitSize: 0x1
        bool hash_a8cd5a2b889bba8d;
        // offset: 0x1, bitSize: 0x1
        bool hash_364142981df6be57;
        // offset: 0x2, bitSize: 0x1
        bool hash_1fb8a2c8585b5b13;
    };

    // bitSize: 0x2a0, members: 6
    struct StoreData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte hash_d507171b17876ba;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        NextTitlePreOrderData hash_8af5969a2b53a94e;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        NextTitlePreOrderData hash_7fb86b9a243adba5;
        // offset: 0x18, bitSize: 0x280(0x50 Byte(s)), array:0x14(hti:0xffff)
        uint hash_7e8cbc444ebcc6ff[20];
        // offset: 0x298, bitSize: 0x1
        bool hash_b0d98eb09d31415;
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

    // bitSize: 0x219c8, members: 79
    struct NonGameData {
        // offset: 0x0, bitSize: 0x133a0(0x2674 Byte(s))
        UnlockTable isnew;
        // offset: 0x133a0, bitSize: 0xf00(0x1e0 Byte(s)), array:0x4(hti:0x7)
        TrackedChallenges hash_a257e7c00c256436[TrackedGameMode];
        // offset: 0x142a0, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_background[2];
        // offset: 0x142c0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivewhispers;
        // offset: 0x142c8, bitSize: 0x40(0x8 Byte(s))
        uint64 toastnotificationunpausetimestamp;
        // offset: 0x14308, bitSize: 0x20(0x4 Byte(s))
        uint lastseenchaptersteamoverlayofftoast;
        // offset: 0x14328, bitSize: 0x20(0x4 Byte(s))
        int hash_f5d770dd065a0f00;
        // offset: 0x14348, bitSize: 0x8e80(0x11d0 Byte(s)), array:0x8(hti:0xffff)
        SeasonalEventData seasonalevents[8];
        // offset: 0x1d1c8, bitSize: 0x20(0x4 Byte(s))
        int lastplayedcategoryid;
        // offset: 0x1d1e8, bitSize: 0x8(0x1 Byte(s))
        byte quickplayfilter;
        // offset: 0x1d1f0, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_80a73fad25c8e6ce;
        // offset: 0x1d230, bitSize: 0x3c0(0x78 Byte(s)), array:0xa(hti:0xffff)
        TrackedChallenge trackedchallenge[10];
        // offset: 0x1d5f0, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int tournamentquits[4];
        // offset: 0x1d670, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivefriendrequests;
        // offset: 0x1d678, bitSize: 0xc00(0x180 Byte(s))
        LFPSearchParameters lfpsearchparams;
        // offset: 0x1e278, bitSize: 0x200(0x40 Byte(s))
        string(64) lastplayedplaymenuref;
        // offset: 0x1e478, bitSize: 0xb8(0x17 Byte(s)), array:0x17(hti:0xffff)
        uint:6 battlepassbreadcrumbs[23];
        // offset: 0x1e530, bitSize: 0x8(0x1 Byte(s))
        PartyPrivacySetting partyprivacysettings;
        // offset: 0x1e538, bitSize: 0x20(0x4 Byte(s))
        int bigtournamentbanstart;
        // offset: 0x1e558, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeplayed;
        // offset: 0x1e578, bitSize: 0x2a0(0x54 Byte(s))
        StoreData storedata;
        // offset: 0x1e818, bitSize: 0x20(0x4 Byte(s))
        int lastplayedplaylistid;
        // offset: 0x1e838, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeselected;
        // offset: 0x1e858, bitSize: 0x40(0x8 Byte(s))
        uint64 influencercodetime;
        // offset: 0x1e898, bitSize: 0x20(0x4 Byte(s))
        int hash_6c16fcf7dda0c89a;
        // offset: 0x1e8b8, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengeslastseentime;
        // offset: 0x1e8d8, bitSize: 0x50(0xa Byte(s))
        string(10) lastseenlocale;
        // offset: 0x1e928, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengespopupchecksum;
        // offset: 0x1e948, bitSize: 0x20(0x4 Byte(s))
        int rankedplay_crossplay_setting;
        // offset: 0x1e968, bitSize: 0x258(0x4b Byte(s)), array:0x5(hti:0xffff)
        SocialPartySettings socialpartysettings[5];
        // offset: 0x1ebc0, bitSize: 0x20(0x4 Byte(s))
        int tokensearnedsincelastbattlepassupsell;
        // offset: 0x1ebe0, bitSize: 0x20(0x4 Byte(s))
        uint spuninstallpromptlastseentimestamp;
        // offset: 0x1ec00, bitSize: 0x20(0x4 Byte(s))
        uint lastbattlepassmenuxp;
        // offset: 0x1ec20, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivechannelinvites;
        // offset: 0x1ec28, bitSize: 0x20(0x4 Byte(s))
        uint hash_aac6b8a67634a5b6;
        // offset: 0x1ec48, bitSize: 0x2b0(0x56 Byte(s))
        BattlePassData battlepassdata;
        // offset: 0x1eef8, bitSize: 0x20(0x4 Byte(s))
        uint lastrank;
        // offset: 0x1ef18, bitSize: 0x20(0x4 Byte(s))
        uint lastseenseasonsteamoverlayofftoast;
        // offset: 0x1ef38, bitSize: 0xf00(0x1e0 Byte(s)), array:0x4(hti:0x7)
        TrackedChallenges trackedweaponcamochallenge[TrackedGameMode];
        // offset: 0x1fe38, bitSize: 0x10(0x2 Byte(s))
        DefaultPartySettings defaultpartysettings;
        // offset: 0x1fe48, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receiveactivityinvites;
        // offset: 0x1fe50, bitSize: 0x20(0x4 Byte(s))
        int hash_a3b001d5acb98134;
        // offset: 0x1fe70, bitSize: 0x610(0xc2 Byte(s))
        TelescopeData telescopedata;
        // offset: 0x20480, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_patch[2];
        // offset: 0x204a0, bitSize: 0x20(0x4 Byte(s))
        int lastseenactivearmoryindex;
        // offset: 0x204c0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivegroupinvites;
        // offset: 0x204c8, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_frame[2];
        // offset: 0x204e8, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_title[2];
        // offset: 0x20508, bitSize: 0x78(0xf Byte(s))
        PlayerSortPreferences sortpreferences;
        // offset: 0x20580, bitSize: 0x20(0x4 Byte(s))
        int hash_1a0731a9833a8db0;
        // offset: 0x205a0, bitSize: 0xf00(0x1e0 Byte(s)), array:0x4(hti:0x7)
        TrackedChallenges trackedstickerbookchallenge[TrackedGameMode];
        // offset: 0x214a0, bitSize: 0x8(0x1 Byte(s))
        byte seenftuevideoversion;
        // offset: 0x214a8, bitSize: 0x200(0x40 Byte(s))
        string(64) savedusername;
        // offset: 0x216a8, bitSize: 0x200(0x40 Byte(s))
        string(64) influencercode;
        // offset: 0x218a8, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassfreetierseen;
        // offset: 0x218b0, bitSize: 0x20(0x4 Byte(s))
        uint storelastseentime;
        // offset: 0x218d0, bitSize: 0x8(0x1 Byte(s))
        byte battlepasspurchasependingseason;
        // offset: 0x218d8, bitSize: 0x20(0x4 Byte(s))
        int currenttournament;
        // offset: 0x218f8, bitSize: 0x1
        bool toggleofflinefriends;
        // offset: 0x218f9, bitSize: 0x1
        bool isbponboardingcleared;
        // offset: 0x218fa, bitSize: 0x1
        bool wereoperatorexecutionsvalidated;
        // offset: 0x218fb, bitSize: 0x1
        bool cross_play_enabled;
        // offset: 0x218fc, bitSize: 0x1
        bool isshowprosandconsenabled;
        // offset: 0x218fd, bitSize: 0x1
        bool hasseencerpreorderthankyoumenu;
        // offset: 0x218fe, bitSize: 0x1
        bool hasanytempbanactive;
        // offset: 0x218ff, bitSize: 0x1
        bool disablemeatshieldvoice;
        // offset: 0x21900, bitSize: 0x10(0x2 Byte(s)), array:0x10(hti:0xffff)
        bool hash_35e14cda83c7c4b8[16];
        // offset: 0x21910, bitSize: 0x1
        bool mobileshaderdlogstarted;
        // offset: 0x21911, bitSize: 0xe, array:0xe(hti:0x1)
        bool seenstoryintro[MapList];
        // offset: 0x2191f, bitSize: 0x1
        bool rankedplay_crossplay_enabled;
        // offset: 0x21920, bitSize: 0x80(0x10 Byte(s)), array:0x80(hti:0xffff)
        bool gamewidetutorials[128];
        // offset: 0x219a0, bitSize: 0x1
        bool hasseenfirstpartytoatvimenu;
        // offset: 0x219a1, bitSize: 0x1
        bool muteonjoinparty;
        // offset: 0x219a2, bitSize: 0x1
        bool party_autofill_lock;
        // offset: 0x219a3, bitSize: 0x1
        bool disableproximityvoice;
        // offset: 0x219a4, bitSize: 0x1
        bool wasprotuningplayerdataconverted;
        // offset: 0x219a5, bitSize: 0x1
        bool hash_c25f189c1c6901bd;
        // offset: 0x219a6, bitSize: 0x20(0x4 Byte(s)), array:0x20(hti:0xffff)
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

    // idx 0x1 members: 0xe type: c
    enum MapList {
        zm_t10_garnet, // 0x0
        zm_t10_quartz, // 0x1
        zm_t10_bloodstone, // 0x2
        zm_t10_opal, // 0x3
        zm_t10_topaz, // 0x4
        zm_t10_jade, // 0x5
        zm_t10_garnet_jh, // 0x6
        zm_sat_firefly, // 0x7
        zm_sat_ruby, // 0x8
        zm_sat_ruby_jh, // 0x9
        zm_sat_hornet, // 0xa
        zm_sat_locust, // 0xb
        zm_sat_mantis, // 0xc
        zm_sat_scarab // 0xd
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

    // idx 0x7 members: 0x4 type: 5
    enum TrackedGameMode {
        MP, // 0x0
        ZM, // 0x1
        BR, // 0x2
        OB // 0x3
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

    // root: bitSize: 0x219f0, members: 3

    // offset: 0x0, bitSize: 0x219c8(0x4339 Byte(s))
    NonGameData nongamedata;
    // offset: 0x219c8, bitSize: 0x20(0x4 Byte(s))
    int design_version;
    // offset: 0x219e8, bitSize: 0x8(0x1 Byte(s))
    ValidationData validationdata;
};

