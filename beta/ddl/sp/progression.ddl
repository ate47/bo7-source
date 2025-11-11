// file .... ddl\sp\progression.ddl

version 1 {
    // enums ..... 9 (0x9)
    // structs ... 15 (0xf)
    // bit size .. 74112 (0x12180)
    // byte size . 9264 (0x2430)
    // archive ... hash_271f394e33f2dfb8

    // bitSize: 0x18, members: 4
    struct sboxItemData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        uint:16 itemid;
        // offset: 0x10, bitSize: 0x1
        bool isnewunlock;
        // offset: 0x11, bitSize: 0x1
        bool unlockstate;
    };

    // bitSize: 0x300, members: 1
    struct sboxInventoryData {
        // offset: 0x0, bitSize: 0x300(0x60 Byte(s)), array:0x20(hti:0xffff)
        sboxItemData sboxitems[32];
    };

    // bitSize: 0x50, members: 10
    struct sboxLoadoutData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:8 tacticalgrenade;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:8 boots;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_e3198093659a7f50;
        // offset: 0x18, bitSize: 0x8(0x1 Byte(s))
        uint:8 plate;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        uint:8 secondaryweapon;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        uint:8 gloves;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        uint:8 helmet;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        uint:8 fieldequipment;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:8 lethalgrenade;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        uint:8 primaryweapon;
    };

    // bitSize: 0x80, members: 16
    struct gameplaytutorialData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_14884c44f7fe3923;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_4f994310473e8eb2;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_3aaef22df4e4a49d;
        // offset: 0x18, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_ae3544a406f6d904;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_2023ddb0b7171b84;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_c8c0592144c4621d;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_737ee8cf73a73007;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_9cf799831fc7026a;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_690d1a9817b964f6;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_4b2180eca8750a9b;
        // offset: 0x50, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_eed5ec4038339011;
        // offset: 0x58, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_17004cd449be4c28;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_88eee5e0f9de8ea8;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_7ce7533388134d91;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_bd1019f958954d1b;
        // offset: 0x78, bitSize: 0x8(0x1 Byte(s))
        uint:4 hash_ee6328fcfe744ea;
    };

    // bitSize: 0x28, members: 4
    struct MissionData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:5 collectedintelamount;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:5 majorstorychoiceindex;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte evidenceidobtained;
        // offset: 0x18, bitSize: 0x10(0x2 Byte(s))
        uint:16 collectedcashamount;
    };

    // bitSize: 0x428, members: 7
    struct Character {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:8 skin;
        // offset: 0x8, bitSize: 0x200(0x40 Byte(s))
        string(64) namefirst;
        // offset: 0x208, bitSize: 0x200(0x40 Byte(s))
        string(64) namelast;
        // offset: 0x408, bitSize: 0x8(0x1 Byte(s))
        uint:8 specialty;
        // offset: 0x410, bitSize: 0x8(0x1 Byte(s))
        uint:8 record;
        // offset: 0x418, bitSize: 0x8(0x1 Byte(s))
        uint:8 identity;
        // offset: 0x420, bitSize: 0x8(0x1 Byte(s))
        uint:8 variation;
    };

    // bitSize: 0x760, members: 108
    struct SBProgressionData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_69e007770cf9f23f;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_6c24721edb5f59fb;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_c954451c6cd3fb6a;
        // offset: 0x18, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_54018858e4b8c61;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_2b911eacb3231fa9;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_acf9164d880fd84d;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_da7f77330d4c15c0;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_fb6451b4d8892096;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_31e941865b151f02;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_d1565b58989ce95d;
        // offset: 0x50, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_e4339f5de9293870;
        // offset: 0x58, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_2a9e6c8091e20fcb;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_d63257f2a0537601;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_eed2e7bc8631d66;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_5ce5951424c5b4eb;
        // offset: 0x78, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_9e4916875d41080f;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_ab986ca5b7316ee2;
        // offset: 0x88, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_13e44207006962ec;
        // offset: 0x90, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_bf65b019a9659d9b;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_33cee4a1b904332;
        // offset: 0xa0, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_be77ba5bf34bb59d;
        // offset: 0xa8, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_5d9bbdff6df38672;
        // offset: 0xb0, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_ec1ca1154d98aa01;
        // offset: 0xb8, bitSize: 0x8(0x1 Byte(s))
        uint:5 hash_ec0dfa9c4f67d79a;
        // offset: 0xc0, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_be91ebd563f15f96;
        // offset: 0xc8, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_211756b86bca3647;
        // offset: 0xd0, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_ffcdd6432d2f2290;
        // offset: 0xd8, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_839d1c4dc607253c;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_2b5a8e847c89e83e;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_77d15ed96fdbd9d0;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_8993cbc2a2dc3db2;
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_93c4b483cf18d1ad;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_57c4fe7fe9fca287;
        // offset: 0x108, bitSize: 0x8(0x1 Byte(s))
        uint:3 hash_270d3a6ab4b03dd5;
        // offset: 0x110, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_c71cedef9055cabb;
        // offset: 0x118, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_357f89cef319951c;
        // offset: 0x120, bitSize: 0x1
        bool cp_jup_parachute_activated;
        // offset: 0x121, bitSize: 0x1
        bool hash_56f289752a00fec8;
        // offset: 0x122, bitSize: 0x1
        bool hash_18965f7860f45079;
        // offset: 0x123, bitSize: 0x1
        bool hash_c9907a1037a04498;
        // offset: 0x124, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_f2dbc77f3bc3cd66[4];
        // offset: 0x128, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_4f754073beec25d[4];
        // offset: 0x12c, bitSize: 0x1
        bool hash_9fdf1e2cda75691d;
        // offset: 0x12d, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_2d4816fd6b819d71[4];
        // offset: 0x131, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_d2b8cad638e10e65[200];
        // offset: 0x1f9, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_f4fd086e28284f04[4];
        // offset: 0x1fd, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_3607e1a1f6bf14b7[10];
        // offset: 0x207, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_7c21304065ccadf0[200];
        // offset: 0x2cf, bitSize: 0x1
        bool hash_5def2fe7db29682a;
        // offset: 0x2d0, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_fbb4e16e28da8693[4];
        // offset: 0x2d4, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_f7a4424b75462145[200];
        // offset: 0x39c, bitSize: 0x1
        bool hash_f31c5c7e7c85c0dd;
        // offset: 0x39d, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_67b10bc6a3768a20[10];
        // offset: 0x3a7, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_e3a77969aac41bac[4];
        // offset: 0x3ab, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_c367258a27026b28[4];
        // offset: 0x3af, bitSize: 0x1
        bool hash_cac7b586087d5794;
        // offset: 0x3b0, bitSize: 0x1
        bool hash_d1307ac6a827278d;
        // offset: 0x3b1, bitSize: 0x1
        bool hash_22c33a13a075aa72;
        // offset: 0x3b2, bitSize: 0x1
        bool hash_8c9c37f552888664;
        // offset: 0x3b3, bitSize: 0x1
        bool hash_294dd9f7ebaee157;
        // offset: 0x3b4, bitSize: 0x1
        bool hash_b7960d91b6b95678;
        // offset: 0x3b5, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_3e3bd3941f27085c[200];
        // offset: 0x47d, bitSize: 0x1
        bool hash_8134fa44facb7f24;
        // offset: 0x47e, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_54eef9ab223cbc2c[4];
        // offset: 0x482, bitSize: 0x1
        bool hash_fa7063efbd15acfb;
        // offset: 0x483, bitSize: 0x1
        bool hash_e92141cb3b0f1255;
        // offset: 0x484, bitSize: 0x1
        bool hash_a0943bfde3968f2d;
        // offset: 0x485, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_4e0cdea67d8016e8[4];
        // offset: 0x489, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_5d08d1737843fc0a[4];
        // offset: 0x48d, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_552127f563f01097[200];
        // offset: 0x555, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_b110bdff48f1c50d[4];
        // offset: 0x559, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_c594f27a4ef4ab33[10];
        // offset: 0x563, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_dcb850736a5f3b04[200];
        // offset: 0x62b, bitSize: 0x1
        bool hash_61eb73e70dbec0e5;
        // offset: 0x62c, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_274a7bbca7faa4d3[4];
        // offset: 0x630, bitSize: 0x1
        bool hash_746e54c7f94763d3;
        // offset: 0x631, bitSize: 0x1
        bool hash_90b26c0e3706fff2;
        // offset: 0x632, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_f14647ffd64afd43[4];
        // offset: 0x636, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_819526f91f2181a3[10];
        // offset: 0x640, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_19ae04d514945a3d[4];
        // offset: 0x644, bitSize: 0x1
        bool hash_3553cbc6d4199bb5;
        // offset: 0x645, bitSize: 0x1
        bool hash_bf9467ea09175276;
        // offset: 0x646, bitSize: 0x1
        bool hash_d5539270a0abb658;
        // offset: 0x647, bitSize: 0x1
        bool hash_fd1f57cafa3e1852;
        // offset: 0x648, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_58c68f8163fa18ed[10];
        // offset: 0x652, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_d430cd06539bf64a[10];
        // offset: 0x65c, bitSize: 0x1
        bool hash_51eb806d9ddb2e9;
        // offset: 0x65d, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_d2f28bc17799c2a3[4];
        // offset: 0x661, bitSize: 0x1
        bool hash_62896ddbe537bf37;
        // offset: 0x662, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_fae91a4721b4e843[10];
        // offset: 0x66c, bitSize: 0x1
        bool hash_bcab52b63f004fc0;
        // offset: 0x66d, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_70069513934e4964[10];
        // offset: 0x677, bitSize: 0x1
        bool hash_36f39298725c1cec;
        // offset: 0x678, bitSize: 0x1
        bool hash_378d65ce052806de;
        // offset: 0x679, bitSize: 0x1
        bool hash_757886b041d80cb5;
        // offset: 0x67a, bitSize: 0x1
        bool hash_eb59985a8f5eba7a;
        // offset: 0x67b, bitSize: 0x1
        bool hash_cb9373dcb18f8e67;
        // offset: 0x67c, bitSize: 0x1
        bool hash_e9e14809d0d3e4cd;
        // offset: 0x67d, bitSize: 0xc8(0x19 Byte(s)), array:0xc8(hti:0xffff)
        bool hash_92b9d4e04d87d6f5[200];
        // offset: 0x745, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_26d17c4aec516f55[4];
        // offset: 0x749, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_e42985de5a87fb54[4];
        // offset: 0x74d, bitSize: 0x1
        bool hash_2a04009fc428836;
        // offset: 0x74e, bitSize: 0x4, array:0x4(hti:0xffff)
        bool hash_3cbc52a42e154d57[4];
        // offset: 0x752, bitSize: 0x1
        bool hash_82979ab8cecbcd37;
        // offset: 0x753, bitSize: 0x1
        bool hash_9dcd797f85a44a61;
        // offset: 0x754, bitSize: 0xa, array:0xa(hti:0xffff)
        bool hash_b4d68d3eca7aeacc[10];
        // offset: 0x75e, bitSize: 0x1
        bool hash_e558029d7ebf04b;
    };

    // bitSize: 0x2448, members: 38
    struct SPProgression {
        // offset: 0x0, bitSize: 0x18(0x3 Byte(s)), array:0x3(hti:0x7)
        byte evidence[EvidenceData];
        // offset: 0x18, bitSize: 0x200(0x40 Byte(s)), array:0x40(hti:0xffff)
        byte perkrank[64];
        // offset: 0x218, bitSize: 0x20(0x4 Byte(s))
        int focuscounter;
        // offset: 0x238, bitSize: 0x20(0x4 Byte(s))
        int kleenexsessiongameplaytime;
        // offset: 0x258, bitSize: 0x1d0(0x3a Byte(s)), array:0x3a(hti:0x0)
        MissionState missionstatedata[Missions];
        // offset: 0x428, bitSize: 0xa8(0x15 Byte(s)), array:0x15(hti:0x2)
        byte perkactive[PerkSlots];
        // offset: 0x4d0, bitSize: 0x20(0x4 Byte(s))
        int playermountcounter;
        // offset: 0x4f0, bitSize: 0x20(0x4 Byte(s))
        uint cheatpoints;
        // offset: 0x510, bitSize: 0x38(0x7 Byte(s)), array:0x7(hti:0xffff)
        byte takedownstylerank[7];
        // offset: 0x548, bitSize: 0x20(0x4 Byte(s))
        int sessiongameplaytime;
        // offset: 0x568, bitSize: 0x20(0x4 Byte(s)), array:0x4(hti:0x3)
        byte stationrank[Stations];
        // offset: 0x588, bitSize: 0x428(0x85 Byte(s))
        Character character;
        // offset: 0x9b0, bitSize: 0x910(0x122 Byte(s)), array:0x3a(hti:0x0)
        MissionData playermissiondata[Missions];
        // offset: 0x12c0, bitSize: 0x100(0x20 Byte(s)), array:0x20(hti:0xffff)
        byte missionhighestdifficulty[32];
        // offset: 0x13c0, bitSize: 0x8(0x1 Byte(s))
        uint:4 currentgameskill;
        // offset: 0x13c8, bitSize: 0x8(0x1 Byte(s))
        uint:4 takecoverwarnings;
        // offset: 0x13d0, bitSize: 0x20(0x4 Byte(s))
        uint cheat_items_set1;
        // offset: 0x13f0, bitSize: 0x20(0x4 Byte(s))
        uint cheat_items_set2;
        // offset: 0x1410, bitSize: 0x20(0x4 Byte(s))
        int startpointdeaths;
        // offset: 0x1430, bitSize: 0x740(0xe8 Byte(s)), array:0x3a(hti:0x0)
        int civilianskilledgradebest[Missions];
        // offset: 0x1b70, bitSize: 0x20(0x4 Byte(s))
        int startpointfails;
        // offset: 0x1b90, bitSize: 0x20(0x4 Byte(s))
        int totalgameplaytime;
        // offset: 0x1bb0, bitSize: 0x20(0x4 Byte(s))
        int cursaveslot;
        // offset: 0x1bd0, bitSize: 0x8(0x1 Byte(s))
        byte takedownstyleactive;
        // offset: 0x1bd8, bitSize: 0x20(0x4 Byte(s))
        int hash_a1d36c3a3448c802;
        // offset: 0x1bf8, bitSize: 0x8(0x1 Byte(s))
        Missions currentmission;
        // offset: 0x1c00, bitSize: 0x740(0xe8 Byte(s)), array:0x3a(hti:0x0)
        int civilianskilledgrade[Missions];
        // offset: 0x2340, bitSize: 0x20(0x4 Byte(s))
        int kleenexsectiontime;
        // offset: 0x2360, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0x4)
        int resource[Resources];
        // offset: 0x23c0, bitSize: 0x20(0x4 Byte(s))
        int curdifficulty;
        // offset: 0x23e0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0x4)
        int resourcepending[Resources];
        // offset: 0x2440, bitSize: 0x1
        bool hash_e9e0ae6ab980cbb5;
        // offset: 0x2441, bitSize: 0x1
        bool hash_fc6f24c935f55eb;
        // offset: 0x2442, bitSize: 0x1
        bool beatrealism;
        // offset: 0x2443, bitSize: 0x1
        bool unlockedrealism;
        // offset: 0x2444, bitSize: 0x1
        bool blacklight;
        // offset: 0x2445, bitSize: 0x1
        bool hash_13b20fbad41d7667;
    };

    // bitSize: 0x70, members: 1
    struct JupMissionProgression {
        // offset: 0x0, bitSize: 0x70(0xe Byte(s)), array:0xe(hti:0xffff)
        uint:4 hash_5b79b5d5d46a669b[14];
    };

    // bitSize: 0x20, members: 1
    struct DDLVersionInfo {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int version;
    };

    // bitSize: 0x2000, members: 4
    struct FogOfWarMapData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int rows;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int version;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int columns;
        // offset: 0x60, bitSize: 0x1fa0(0x3f4 Byte(s)), array:0x1fa0(hti:0xffff)
        bool tilesdiscovered[8096];
    };

    // bitSize: 0xe000, members: 2
    struct FogOfWarData {
        // offset: 0x0, bitSize: 0xc000(0x1800 Byte(s)), array:0x6(hti:0x8)
        FogOfWarMapData fogofwarmapdata[FogOfWarMap];
        // offset: 0xc000, bitSize: 0x2000(0x400 Byte(s))
        FogOfWarMapData hash_1243cede11ff3110;
    };

    // bitSize: 0x10, members: 13
    struct SboxAchievements {
        // offset: 0x0, bitSize: 0x1
        bool hash_ea3fde235dff2154;
        // offset: 0x1, bitSize: 0x1
        bool hash_c5c95fbf91b1ac20;
        // offset: 0x2, bitSize: 0x1
        bool hash_2e1aec509fd63c59;
        // offset: 0x3, bitSize: 0x1
        bool hash_8be6b4bc5576740f;
        // offset: 0x4, bitSize: 0x1
        bool hash_e10b63b52f743d48;
        // offset: 0x5, bitSize: 0x1
        bool hash_86cda702bbcb148c;
        // offset: 0x6, bitSize: 0x1
        bool hash_2b8bdb823d22fa29;
        // offset: 0x7, bitSize: 0x1
        bool hash_cabc58e982540624;
        // offset: 0x8, bitSize: 0x1
        bool hash_307a82c825b343c0;
        // offset: 0x9, bitSize: 0x1
        bool hash_1cb3535a21265b1b;
        // offset: 0xa, bitSize: 0x1
        bool hash_6af9dd26ccaa1a6b;
        // offset: 0xb, bitSize: 0x1
        bool hash_acf2864eaa534259;
    };

    // bitSize: 0x20, members: 1
    struct Features {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_a272a6d40461e46a;
    };

    // idx 0x0 members: 0x3a type: 5
    enum Missions {
        none, // 0x0
        strike, // 0x1
        nightwar, // 0x2
        marina, // 0x3
        montage_canals, // 0x4
        border, // 0x5
        backstabbed, // 0x6
        gunship_compound, // 0x7
        gunship_ambush, // 0x8
        intercept, // 0x9
        convoy_chase, // 0xa
        party, // 0xb
        shipaf, // 0xc
        wounded, // 0xd
        prison, // 0xe
        stolen, // 0xf
        shadowbase, // 0x10
        tower, // 0x11
        sp_jup_vip, // 0x12
        cp_jup_chemical, // 0x13
        cp_jup_port, // 0x14
        sp_jup_silo, // 0x15
        cp_jup_ranch, // 0x16
        sp_jup_hijack, // 0x17
        sp_jup_flashback, // 0x18
        cp_jup_resort, // 0x19
        cp_jup_apt, // 0x1a
        sp_jup_tundra, // 0x1b
        cp_jup_dam, // 0x1c
        sp_jup_gunship, // 0x1d
        sp_jup_surge, // 0x1e
        sp_jup_milbase, // 0x1f
        sp_t10_intro, // 0x20
        sp_t10_extraction, // 0x21
        sp_t10_safehouse_arrival, // 0x22
        sp_t10_contract, // 0x23
        sp_t10_safehouse_assemble, // 0x24
        sp_t10_union, // 0x25
        sp_t10_safehouse_reunion, // 0x26
        sp_t10_sandbox, // 0x27
        sp_t10_sandbox_palace, // 0x28
        sp_t10_safehouse_domestic, // 0x29
        sp_t10_redacted, // 0x2a
        sp_t10_safehouse_recovery, // 0x2b
        sp_t10_heist, // 0x2c
        sp_t10_safehouse_destination, // 0x2d
        sp_t10_storm, // 0x2e
        sp_t10_safehouse_buried, // 0x2f
        sp_t10_sabotage, // 0x30
        sp_t10_safehouse_desperation, // 0x31
        sp_t10_interrogation, // 0x32
        sp_t10_interrogation_2, // 0x33
        sp_t10_safehouse_defend, // 0x34
        sp_t10_endgame1, // 0x35
        sp_t10_finale, // 0x36
        sp_t10_sidemission1, // 0x37
        sp_t10_sidemission2, // 0x38
        sp_t10_sidemission3 // 0x39
    };

    // idx 0x1 members: 0x3 type: 5
    enum MissionState {
        locked, // 0x0
        unlocked, // 0x1
        complete // 0x2
    };

    // idx 0x2 members: 0x15 type: 5
    enum PerkSlots {
        playerHealth, // 0x0
        playerSpecEnemy, // 0x1
        playerArmor, // 0x2
        playerExplosives, // 0x3
        playerFlinch, // 0x4
        meleePowerup, // 0x5
        weaponReload, // 0x6
        weaponADS, // 0x7
        weaponRecoil, // 0x8
        weaponMagazine, // 0x9
        equipmentAmmo, // 0xa
        equipmentShockCluster, // 0xb
        equipmentKnife, // 0xc
        equipmentAdrenaline, // 0xd
        equipmentDart, // 0xe
        resourceOne, // 0xf
        resourceTwo, // 0x10
        resourceThree, // 0x11
        resourceFour, // 0x12
        resourceFive, // 0x13
        resourceSix // 0x14
    };

    // idx 0x3 members: 0x4 type: 5
    enum Stations {
        stationWeapon, // 0x0
        stationPlayer, // 0x1
        stationGear, // 0x2
        stationResource // 0x3
    };

    // idx 0x4 members: 0x3 type: 5
    enum Resources {
        intel, // 0x0
        money, // 0x1
        operator // 0x2
    };

    // idx 0x5 members: 0x5 type: 5
    enum ObjectiveTypes {
        primaryObjective, // 0x0
        loyaltyObjective, // 0x1
        optionalObjectiveOne, // 0x2
        optionalObjectiveTwo, // 0x3
        optionalObjectiveThree // 0x4
    };

    // idx 0x6 members: 0x6 type: 5
    enum sboxMissions {
        cp_jup_apt, // 0x0
        cp_jup_chemical, // 0x1
        cp_jup_dam, // 0x2
        cp_jup_port, // 0x3
        cp_jup_ranch, // 0x4
        cp_jup_resort // 0x5
    };

    // idx 0x7 members: 0x3 type: 5
    enum EvidenceData {
        tempEvidence1, // 0x0
        tempEvidence2, // 0x1
        tempEvidence3 // 0x2
    };

    // idx 0x8 members: 0x6 type: 5
    enum FogOfWarMap {
        cp_jup_apt, // 0x0
        cp_jup_chemical, // 0x1
        cp_jup_dam, // 0x2
        cp_jup_port, // 0x3
        cp_jup_ranch, // 0x4
        cp_jup_resort // 0x5
    };

    // root: bitSize: 0x120d0, members: 12

    // offset: 0x0, bitSize: 0x1e0(0x3c Byte(s)), array:0x6(hti:0x6)
    sboxLoadoutData sandboxloadoutdata[sboxMissions];
    // offset: 0x1e0, bitSize: 0x80(0x10 Byte(s))
    gameplaytutorialData hash_36a5194fda20a9a4;
    // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
    DDLVersionInfo hash_d5510d2aea105b8c;
    // offset: 0x280, bitSize: 0x760(0xec Byte(s))
    SBProgressionData spprogdata;
    // offset: 0x9e0, bitSize: 0x10(0x2 Byte(s))
    SboxAchievements hash_551508e02be0cd3b;
    // offset: 0x9f0, bitSize: 0x70(0xe Byte(s))
    JupMissionProgression hash_b45566ddbaf525b;
    // offset: 0xa60, bitSize: 0xe000(0x1c00 Byte(s))
    FogOfWarData fogofwardata;
    // offset: 0xea60, bitSize: 0x2448(0x489 Byte(s))
    SPProgression spdata;
    // offset: 0x10ea8, bitSize: 0x20(0x4 Byte(s))
    Features features;
    // offset: 0x10ec8, bitSize: 0x1200(0x240 Byte(s)), array:0x6(hti:0x6)
    sboxInventoryData sandboxinventorydata[sboxMissions];
    // offset: 0x120c8, bitSize: 0x1
    bool exist;
};

