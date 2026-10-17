// file .... ddl\sat\mp\sat_archivesummary.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 3 (0x3)
    // bit size .. 66008 (0x101d8)
    // byte size . 8251 (0x203b)
    // archive ... hash_641aa2463ead2208

    // bitSize: 0x118, members: 11
    struct PlayerStats {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int team;
        // offset: 0x20, bitSize: 0x40(0x8 Byte(s))
        uint64 xuid;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint time_in_match;
        // offset: 0x80, bitSize: 0x10(0x2 Byte(s))
        uint:16 kills;
        // offset: 0x90, bitSize: 0x20(0x4 Byte(s))
        int xpearned;
        // offset: 0xb0, bitSize: 0x20(0x4 Byte(s))
        float accuracy;
        // offset: 0xd0, bitSize: 0x10(0x2 Byte(s))
        uint:16 deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int subpartyindex;
        // offset: 0x100, bitSize: 0x10(0x2 Byte(s))
        uint:16 headshots;
        // offset: 0x110, bitSize: 0x1
        bool winner;
    };

    // bitSize: 0x3280, members: 4
    struct PlayerBestPlay {
        // offset: 0x0, bitSize: 0x40(0x8 Byte(s))
        uint64 xuid;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint endframebyteoffset;
        // offset: 0x60, bitSize: 0x3200(0x640 Byte(s)), array:0xc8(hti:0xffff)
        uint64 clientindextounomap[200];
        // offset: 0x3260, bitSize: 0x20(0x4 Byte(s))
        uint startframebyteoffset;
    };

    // root: bitSize: 0x10128, members: 16

    // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
    uint potgendtime;
    // offset: 0x20, bitSize: 0xdac0(0x1b58 Byte(s)), array:0xc8(hti:0xffff)
    PlayerStats playerstats[200];
    // offset: 0xdae0, bitSize: 0x100(0x20 Byte(s))
    string(32) mapname;
    // offset: 0xdbe0, bitSize: 0x40(0x8 Byte(s))
    uint64 matchid;
    // offset: 0xdc20, bitSize: 0x20(0x4 Byte(s))
    uint matchlength;
    // offset: 0xdc40, bitSize: 0x20(0x4 Byte(s))
    uint potgstarttime;
    // offset: 0xdc60, bitSize: 0x20(0x4 Byte(s))
    int compassbuildid;
    // offset: 0xdc80, bitSize: 0x20(0x4 Byte(s))
    int databuildnumber;
    // offset: 0xdca0, bitSize: 0x200(0x40 Byte(s))
    string(64) serverguid;
    // offset: 0xdea0, bitSize: 0x40(0x8 Byte(s))
    uint64 potgplayerxuid;
    // offset: 0xdee0, bitSize: 0x820(0x104 Byte(s))
    string(260) gametype;
    // offset: 0xe700, bitSize: 0x19c0(0x338 Byte(s)), array:0xce(hti:0xffff)
    int teamscores[206];
    // offset: 0x100c0, bitSize: 0x20(0x4 Byte(s))
    int codebuildnumber;
    // offset: 0x100e0, bitSize: 0x40(0x8 Byte(s))
    uint64 hostxuid;
    // offset: 0x10120, bitSize: 0x1
    bool ishostdedi;
};

