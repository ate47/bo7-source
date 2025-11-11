// file .... ddl\sat\mp\sat_webview.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 7 (0x7)
    // bit size .. 288 (0x120)
    // byte size . 36 (0x24)
    // archive ... hash_10d5bc8a5c603df7

    // bitSize: 0x1, members: 1
    struct MotDInfo {
        // offset: 0x0, bitSize: 0x1
        bool seen;
    };

    // bitSize: 0x20, members: 1
    struct ToSInfo {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int accept;
    };

    // bitSize: 0x28, members: 3
    struct EventInfo {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int currenteventindex;
        // offset: 0x20, bitSize: 0x1
        bool ftueseen;
    };

    // bitSize: 0x1, members: 1
    struct PushNotifications {
        // offset: 0x0, bitSize: 0x1
        bool seensoftprompt;
    };

    // bitSize: 0x20, members: 1
    struct AppReview {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int timesshown;
    };

    // bitSize: 0x70, members: 6
    struct LiveInfo {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        ToSInfo tos;
        // offset: 0x20, bitSize: 0x28(0x5 Byte(s))
        EventInfo event;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        AppReview appreview;
        // offset: 0x68, bitSize: 0x1
        MotDInfo motd;
        // offset: 0x69, bitSize: 0x1
        PushNotifications pushnotifications;
    };

    // root: bitSize: 0x70, members: 1

    // offset: 0x0, bitSize: 0x70(0xe Byte(s))
    LiveInfo live;
};

