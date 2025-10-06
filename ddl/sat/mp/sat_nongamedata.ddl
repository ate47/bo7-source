// file .... ddl\sat\mp\sat_nongamedata.ddl

version 1 {
    // enums ..... 10 (0xa)
    // structs ... 28 (0x1c)
    // bit size .. 87664 (0x15670)
    // byte size . 10958 (0x2ace)
    // archive ... hash_1f84e9fd3b875e49

    // bitSize: 0x8, members: 2
    struct ValidationData {
        // offset: 0x0, bitSize: 0x5, array:0x5(hti:0x0)
        bool validationhint[ValidationHint];
    };

    // bitSize: 0x100e0, members: 45
    struct UnlockTable {
        // offset: 0x0, bitSize: 0x2200(0x440 Byte(s)), array:0x110(hti:0xffff)
        int camo[272];
        // offset: 0x2200, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int perk[4];
        // offset: 0x2280, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int relic[1];
        // offset: 0x22a0, bitSize: 0xc0(0x18 Byte(s)), array:0x6(hti:0xffff)
        int skill[6];
        // offset: 0x2360, bitSize: 0x100(0x20 Byte(s)), array:0x8(hti:0xffff)
        int spray[8];
        // offset: 0x2460, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int super[3];
        // offset: 0x24c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hudtheme[1];
        // offset: 0x24e0, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int firstpartylicense[5];
        // offset: 0x2580, bitSize: 0x1c0(0x38 Byte(s)), array:0xe(hti:0xffff)
        int executions[14];
        // offset: 0x2740, bitSize: 0x1340(0x268 Byte(s)), array:0x9a(hti:0xffff)
        int playercards[154];
        // offset: 0x3a80, bitSize: 0x720(0xe4 Byte(s)), array:0x39(hti:0xffff)
        int weapon_charm[57];
        // offset: 0x41a0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        int clantag[3];
        // offset: 0x4200, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int currencypack[1];
        // offset: 0x4220, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        int equipment[5];
        // offset: 0x42c0, bitSize: 0x900(0x120 Byte(s)), array:0x48(hti:0xffff)
        int reticle[72];
        // offset: 0x4bc0, bitSize: 0x740(0xe8 Byte(s)), array:0x3a(hti:0xffff)
        int operator_skin[58];
        // offset: 0x5300, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hash_9646a4363fb7e391[1];
        // offset: 0x5320, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hash_17ca6a5f56d56868[1];
        // offset: 0x5340, bitSize: 0x3e0(0x7c Byte(s)), array:0x1f(hti:0xffff)
        int loadingscreen[31];
        // offset: 0x5720, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int masterybadgecategory[2];
        // offset: 0x5760, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_track[1];
        // offset: 0x5780, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int hash_9be3508a8a322e5[1];
        // offset: 0x57a0, bitSize: 0x120(0x24 Byte(s)), array:0x9(hti:0xffff)
        int zombie_augment[9];
        // offset: 0x58c0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int parachute[1];
        // offset: 0x58e0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int battlepass[1];
        // offset: 0x5900, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int vehicle_camo[1];
        // offset: 0x5920, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int special[1];
        // offset: 0x5940, bitSize: 0x78a0(0xf14 Byte(s)), array:0x3c5(hti:0xffff)
        int attachment[965];
        // offset: 0xd1e0, bitSize: 0x8c0(0x118 Byte(s)), array:0x46(hti:0xffff)
        int sticker[70];
        // offset: 0xdaa0, bitSize: 0x160(0x2c Byte(s)), array:0xb(hti:0xffff)
        int levelicon[11];
        // offset: 0xdc00, bitSize: 0xe00(0x1c0 Byte(s)), array:0x70(hti:0xffff)
        int emblems[112];
        // offset: 0xea00, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int calloutmarkerpingitem[1];
        // offset: 0xea20, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int gobblegum[2];
        // offset: 0xea60, bitSize: 0xc0(0x18 Byte(s)), array:0x6(hti:0xffff)
        int emotes[6];
        // offset: 0xeb20, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int wildcard[1];
        // offset: 0xeb40, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int feature[2];
        // offset: 0xeb80, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        int genericblueprint[2];
        // offset: 0xebc0, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int ammomod[1];
        // offset: 0xebe0, bitSize: 0xee0(0x1dc Byte(s)), array:0x77(hti:0xffff)
        int weapon[119];
        // offset: 0xfac0, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int killstreak[4];
        // offset: 0xfb40, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int contrail[1];
        // offset: 0xfb60, bitSize: 0x120(0x24 Byte(s)), array:0x9(hti:0xffff)
        int operator[9];
        // offset: 0xfc80, bitSize: 0x2c0(0x58 Byte(s)), array:0x16(hti:0xffff)
        int consumable[22];
        // offset: 0xff40, bitSize: 0x20(0x4 Byte(s)), array:0x1(hti:0xffff)
        int gesture[1];
        // offset: 0xff60, bitSize: 0x180(0x30 Byte(s)), array:0xc(hti:0xffff)
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

    // bitSize: 0x2b8, members: 20
    struct SeasonalEventData {
        // offset: 0x0, bitSize: 0x100(0x20 Byte(s))
        string(32) eventname;
        // offset: 0x100, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_ae5b37a65f223e2;
        // offset: 0x140, bitSize: 0x40(0x8 Byte(s))
        uint64 lastprimaryxp;
        // offset: 0x180, bitSize: 0x40(0x8 Byte(s))
        uint64 prematchchallengeprogress;
        // offset: 0x1c0, bitSize: 0x40(0x8 Byte(s))
        uint64 lastsecondaryxp;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        uint prematchtrophycount;
        // offset: 0x220, bitSize: 0x8(0x1 Byte(s))
        byte communitymilestonesunlocksseen;
        // offset: 0x228, bitSize: 0x40(0x8 Byte(s))
        uint64 hash_7cf29754fb49acce;
        // offset: 0x268, bitSize: 0x1
        bool hasseenonboardingoutro;
        // offset: 0x269, bitSize: 0x40(0x8 Byte(s)), array:0x40(hti:0xffff)
        bool seasonalchallengesunlocksseen[64];
        // offset: 0x2a9, bitSize: 0x1
        bool hash_3c46037136f0265e;
        // offset: 0x2aa, bitSize: 0x1
        bool hasseeneventcompletebink;
        // offset: 0x2ab, bitSize: 0x1
        bool hash_47e32184eb4066d6;
        // offset: 0x2ac, bitSize: 0x1
        bool hash_baf9e99b39723807;
        // offset: 0x2ad, bitSize: 0x1
        bool hash_6adb713f1af9bd26;
        // offset: 0x2ae, bitSize: 0x1
        bool hasseenonboarding;
        // offset: 0x2af, bitSize: 0x1
        bool hash_bde5c0775cb9c830;
        // offset: 0x2b0, bitSize: 0x1
        bool hash_61fbfd5eccf6bc5c;
        // offset: 0x2b1, bitSize: 0x1
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

    // bitSize: 0x20, members: 1
    struct BattlePassSeasonData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint pageunlockbreadcrumbs;
    };

    // bitSize: 0xe8, members: 6
    struct BattlePassData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte lastblackcellpurchasecelebrationseen;
        // offset: 0x8, bitSize: 0xc0(0x18 Byte(s)), array:0x6(hti:0xffff)
        BattlePassSeasonData seasondata[6];
        // offset: 0xc8, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassseasonintroseen;
        // offset: 0xd0, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassftueseen;
        // offset: 0xd8, bitSize: 0x8(0x1 Byte(s))
        byte lastseasonrolloverautoconsumednotificationseen;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
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

    // bitSize: 0x15598, members: 77
    struct NonGameData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint lastseensurveyversion;
        // offset: 0x20, bitSize: 0x100e0(0x201c Byte(s))
        UnlockTable isnew;
        // offset: 0x10100, bitSize: 0x780(0xf0 Byte(s)), array:0x2(hti:0x7)
        TrackedChallenges hash_a257e7c00c256436[TrackedGameMode];
        // offset: 0x10880, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_background[2];
        // offset: 0x108a0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivewhispers;
        // offset: 0x108a8, bitSize: 0x40(0x8 Byte(s))
        uint64 toastnotificationunpausetimestamp;
        // offset: 0x108e8, bitSize: 0x20(0x4 Byte(s))
        uint lastseenchaptersteamoverlayofftoast;
        // offset: 0x10908, bitSize: 0x20(0x4 Byte(s))
        int hash_f5d770dd065a0f00;
        // offset: 0x10928, bitSize: 0x15c0(0x2b8 Byte(s)), array:0x8(hti:0xffff)
        SeasonalEventData seasonalevents[8];
        // offset: 0x11ee8, bitSize: 0x20(0x4 Byte(s))
        int lastplayedcategoryid;
        // offset: 0x11f08, bitSize: 0x8(0x1 Byte(s))
        byte quickplayfilter;
        // offset: 0x11f10, bitSize: 0x3c0(0x78 Byte(s)), array:0xa(hti:0xffff)
        TrackedChallenge trackedchallenge[10];
        // offset: 0x122d0, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        int tournamentquits[4];
        // offset: 0x12350, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivefriendrequests;
        // offset: 0x12358, bitSize: 0xc00(0x180 Byte(s))
        LFPSearchParameters lfpsearchparams;
        // offset: 0x12f58, bitSize: 0x200(0x40 Byte(s))
        string(64) lastplayedplaymenuref;
        // offset: 0x13158, bitSize: 0xb8(0x17 Byte(s)), array:0x17(hti:0xffff)
        uint:6 battlepassbreadcrumbs[23];
        // offset: 0x13210, bitSize: 0x8(0x1 Byte(s))
        PartyPrivacySetting partyprivacysettings;
        // offset: 0x13218, bitSize: 0x20(0x4 Byte(s))
        int bigtournamentbanstart;
        // offset: 0x13238, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeplayed;
        // offset: 0x13258, bitSize: 0x290(0x52 Byte(s))
        StoreData storedata;
        // offset: 0x134e8, bitSize: 0x20(0x4 Byte(s))
        int lastplayedplaylistid;
        // offset: 0x13508, bitSize: 0x20(0x4 Byte(s))
        int lastgamemodeselected;
        // offset: 0x13528, bitSize: 0x40(0x8 Byte(s))
        uint64 influencercodetime;
        // offset: 0x13568, bitSize: 0x20(0x4 Byte(s))
        int hash_6c16fcf7dda0c89a;
        // offset: 0x13588, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengeslastseentime;
        // offset: 0x135a8, bitSize: 0x50(0xa Byte(s))
        string(10) lastseenlocale;
        // offset: 0x135f8, bitSize: 0x20(0x4 Byte(s))
        uint dailychallengespopupchecksum;
        // offset: 0x13618, bitSize: 0x20(0x4 Byte(s))
        int rankedplay_crossplay_setting;
        // offset: 0x13638, bitSize: 0x258(0x4b Byte(s)), array:0x5(hti:0xffff)
        SocialPartySettings socialpartysettings[5];
        // offset: 0x13890, bitSize: 0x20(0x4 Byte(s))
        int tokensearnedsincelastbattlepassupsell;
        // offset: 0x138b0, bitSize: 0x20(0x4 Byte(s))
        uint spuninstallpromptlastseentimestamp;
        // offset: 0x138d0, bitSize: 0x20(0x4 Byte(s))
        uint lastbattlepassmenuxp;
        // offset: 0x138f0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivechannelinvites;
        // offset: 0x138f8, bitSize: 0xe8(0x1d Byte(s))
        BattlePassData battlepassdata;
        // offset: 0x139e0, bitSize: 0x20(0x4 Byte(s))
        uint lastrank;
        // offset: 0x13a00, bitSize: 0x20(0x4 Byte(s))
        uint lastseenseasonsteamoverlayofftoast;
        // offset: 0x13a20, bitSize: 0x780(0xf0 Byte(s)), array:0x2(hti:0x7)
        TrackedChallenges trackedweaponcamochallenge[TrackedGameMode];
        // offset: 0x141a0, bitSize: 0x10(0x2 Byte(s))
        DefaultPartySettings defaultpartysettings;
        // offset: 0x141b0, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receiveactivityinvites;
        // offset: 0x141b8, bitSize: 0x20(0x4 Byte(s))
        int hash_a3b001d5acb98134;
        // offset: 0x141d8, bitSize: 0x610(0xc2 Byte(s))
        TelescopeData telescopedata;
        // offset: 0x147e8, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_patch[2];
        // offset: 0x14808, bitSize: 0x20(0x4 Byte(s))
        int lastseenactivearmoryindex;
        // offset: 0x14828, bitSize: 0x8(0x1 Byte(s))
        SocialPrivacySetting receivegroupinvites;
        // offset: 0x14830, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_frame[2];
        // offset: 0x14850, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        short customization_playercard_title[2];
        // offset: 0x14870, bitSize: 0x78(0xf Byte(s))
        PlayerSortPreferences sortpreferences;
        // offset: 0x148e8, bitSize: 0x20(0x4 Byte(s))
        int hash_1a0731a9833a8db0;
        // offset: 0x14908, bitSize: 0x780(0xf0 Byte(s)), array:0x2(hti:0x7)
        TrackedChallenges trackedstickerbookchallenge[TrackedGameMode];
        // offset: 0x15088, bitSize: 0x8(0x1 Byte(s))
        byte seenftuevideoversion;
        // offset: 0x15090, bitSize: 0x200(0x40 Byte(s))
        string(64) savedusername;
        // offset: 0x15290, bitSize: 0x200(0x40 Byte(s))
        string(64) influencercode;
        // offset: 0x15490, bitSize: 0x8(0x1 Byte(s))
        byte lastbattlepassfreetierseen;
        // offset: 0x15498, bitSize: 0x20(0x4 Byte(s))
        uint storelastseentime;
        // offset: 0x154b8, bitSize: 0x8(0x1 Byte(s))
        byte battlepasspurchasependingseason;
        // offset: 0x154c0, bitSize: 0x20(0x4 Byte(s))
        int currenttournament;
        // offset: 0x154e0, bitSize: 0x1
        bool toggleofflinefriends;
        // offset: 0x154e1, bitSize: 0x1
        bool isbponboardingcleared;
        // offset: 0x154e2, bitSize: 0x1
        bool wereoperatorexecutionsvalidated;
        // offset: 0x154e3, bitSize: 0x1
        bool cross_play_enabled;
        // offset: 0x154e4, bitSize: 0x1
        bool isshowprosandconsenabled;
        // offset: 0x154e5, bitSize: 0x1
        bool hasseencerpreorderthankyoumenu;
        // offset: 0x154e6, bitSize: 0x1
        bool hasanytempbanactive;
        // offset: 0x154e7, bitSize: 0x1
        bool disablemeatshieldvoice;
        // offset: 0x154e8, bitSize: 0x1
        bool mobileshaderdlogstarted;
        // offset: 0x154e9, bitSize: 0x1, array:0x1(hti:0x1)
        bool seenstoryintro[MapList];
        // offset: 0x154ea, bitSize: 0x1
        bool rankedplay_crossplay_enabled;
        // offset: 0x154eb, bitSize: 0x80(0x10 Byte(s)), array:0x80(hti:0xffff)
        bool gamewidetutorials[128];
        // offset: 0x1556b, bitSize: 0x1
        bool hasseenfirstpartytoatvimenu;
        // offset: 0x1556c, bitSize: 0x1
        bool muteonjoinparty;
        // offset: 0x1556d, bitSize: 0x1
        bool party_autofill_lock;
        // offset: 0x1556e, bitSize: 0x1
        bool disableproximityvoice;
        // offset: 0x1556f, bitSize: 0x1
        bool wasprotuningplayerdataconverted;
        // offset: 0x15570, bitSize: 0x1
        bool hash_c25f189c1c6901bd;
        // offset: 0x15571, bitSize: 0x20(0x4 Byte(s)), array:0x20(hti:0xffff)
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

    // idx 0x1 members: 0x1 type: c
    enum MapList {
        zm_sat_firefly // 0x0
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

    // idx 0x7 members: 0x2 type: 5
    enum TrackedGameMode {
        MP, // 0x0
        ZM // 0x1
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

    // root: bitSize: 0x155c0, members: 3

    // offset: 0x0, bitSize: 0x15598(0x2ab3 Byte(s))
    NonGameData nongamedata;
    // offset: 0x15598, bitSize: 0x20(0x4 Byte(s))
    int design_version;
    // offset: 0x155b8, bitSize: 0x8(0x1 Byte(s))
    ValidationData validationdata;
};

