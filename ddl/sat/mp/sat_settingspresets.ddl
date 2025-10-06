// file .... ddl\sat\mp\sat_settingspresets.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 8 (0x8)
    // bit size .. 7088 (0x1bb0)
    // byte size . 886 (0x376)
    // archive ... hash_54bda5b07521274c

    // bitSize: 0x48, members: 2
    struct SettingPreset {
        // offset: 0x0, bitSize: 0x40(0x8 Byte(s))
        hashres id;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte value;
    };

    // bitSize: 0x170, members: 3
    struct Subtitles {
        // offset: 0x0, bitSize: 0x168(0x2d Byte(s)), array:0x5(hti:0xffff)
        SettingPreset settingpreset[5];
        // offset: 0x168, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0x710, members: 5
    struct Quality {
        // offset: 0x0, bitSize: 0x708(0xe1 Byte(s)), array:0x19(hti:0xffff)
        SettingPreset settingpreset[25];
        // offset: 0x708, bitSize: 0x1
        bool test;
        // offset: 0x709, bitSize: 0x1
        bool initialized;
        // offset: 0x70a, bitSize: 0x1
        bool iscustom;
    };

    // bitSize: 0x440, members: 3
    struct Telemetry {
        // offset: 0x0, bitSize: 0x438(0x87 Byte(s)), array:0xf(hti:0xffff)
        SettingPreset settingpreset[15];
        // offset: 0x438, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0x170, members: 3
    struct SplashesAchievements {
        // offset: 0x0, bitSize: 0x168(0x2d Byte(s)), array:0x5(hti:0xffff)
        SettingPreset settingpreset[5];
        // offset: 0x168, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0x2d8, members: 3
    struct SplashesCallouts {
        // offset: 0x0, bitSize: 0x2d0(0x5a Byte(s)), array:0xa(hti:0xffff)
        SettingPreset settingpreset[10];
        // offset: 0x2d0, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0x2d8, members: 3
    struct SplashesUpdatesAlerts {
        // offset: 0x0, bitSize: 0x2d0(0x5a Byte(s)), array:0xa(hti:0xffff)
        SettingPreset settingpreset[10];
        // offset: 0x2d0, bitSize: 0x1
        bool initialized;
    };

    // root: bitSize: 0x1b00, members: 9

    // offset: 0x0, bitSize: 0x170(0x2e Byte(s))
    Subtitles subtitles;
    // offset: 0x170, bitSize: 0x440(0x88 Byte(s))
    Telemetry telemetrypreset;
    // offset: 0x5b0, bitSize: 0x2d8(0x5b Byte(s))
    SplashesUpdatesAlerts hash_41bb25dd9cbd20c4;
    // offset: 0x888, bitSize: 0x2d8(0x5b Byte(s))
    SplashesUpdatesAlerts splashesupdatealertpreset_wz;
    // offset: 0xb60, bitSize: 0x170(0x2e Byte(s))
    SplashesAchievements hash_310b75f55f31ba8e;
    // offset: 0xcd0, bitSize: 0x170(0x2e Byte(s))
    SplashesAchievements hash_311f73f55f426032;
    // offset: 0xe40, bitSize: 0x710(0xe2 Byte(s))
    Quality qualitypreset;
    // offset: 0x1550, bitSize: 0x2d8(0x5b Byte(s))
    SplashesCallouts splashescalloutpreset_mp;
    // offset: 0x1828, bitSize: 0x2d8(0x5b Byte(s))
    SplashesCallouts splashescalloutpreset_wz;
};

