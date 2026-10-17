// file .... ddl\sat\mp\sat_settingspresets.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 10 (0xa)
    // bit size .. 12216 (0x2fb8)
    // byte size . 1527 (0x5f7)
    // archive ... hash_65c7e60da0d9a77c

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

    // bitSize: 0x908, members: 3
    struct HudVisibility {
        // offset: 0x0, bitSize: 0x900(0x120 Byte(s)), array:0x20(hti:0xffff)
        SettingPreset settingpreset[32];
        // offset: 0x900, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0xb00, members: 3
    struct HudInfoVisibility {
        // offset: 0x0, bitSize: 0xaf8(0x15f Byte(s)), array:0x27(hti:0xffff)
        SettingPreset settingpreset[39];
        // offset: 0xaf8, bitSize: 0x1
        bool initialized;
    };

    // root: bitSize: 0x2f08, members: 11

    // offset: 0x0, bitSize: 0x170(0x2e Byte(s))
    Subtitles subtitles;
    // offset: 0x170, bitSize: 0x440(0x88 Byte(s))
    Telemetry telemetrypreset;
    // offset: 0x5b0, bitSize: 0x2d8(0x5b Byte(s))
    SplashesUpdatesAlerts splashesupdatealertpreset_mp;
    // offset: 0x888, bitSize: 0x2d8(0x5b Byte(s))
    SplashesUpdatesAlerts splashesupdatealertpreset_wz;
    // offset: 0xb60, bitSize: 0xb00(0x160 Byte(s))
    HudInfoVisibility hudinfovisibility;
    // offset: 0x1660, bitSize: 0x908(0x121 Byte(s))
    HudVisibility hudvisibility;
    // offset: 0x1f68, bitSize: 0x170(0x2e Byte(s))
    SplashesAchievements hash_310b75f55f31ba8e;
    // offset: 0x20d8, bitSize: 0x170(0x2e Byte(s))
    SplashesAchievements hash_311f73f55f426032;
    // offset: 0x2248, bitSize: 0x710(0xe2 Byte(s))
    Quality qualitypreset;
    // offset: 0x2958, bitSize: 0x2d8(0x5b Byte(s))
    SplashesCallouts splashescalloutpreset_mp;
    // offset: 0x2c30, bitSize: 0x2d8(0x5b Byte(s))
    SplashesCallouts splashescalloutpreset_wz;
};

