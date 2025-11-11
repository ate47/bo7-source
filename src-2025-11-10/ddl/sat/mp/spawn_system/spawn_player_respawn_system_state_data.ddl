// file .... ddl\sat\mp\spawn_system\spawn_player_respawn_system_state_data.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 5 (0x5)
    // bit size .. 21976 (0x55d8)
    // byte size . 2747 (0xabb)
    // archive ... hash_5732e69db01fcf94

    // bitSize: 0x80, members: 4
    struct FrontLineData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float dirx;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float diry;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float posx;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float posy;
    };

    // bitSize: 0x60, members: 3
    struct ClusterData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float posx;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float posy;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int size;
    };

    // bitSize: 0x78, members: 6
    struct SpawnScoreData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float score;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        uint:8 cornersights;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        CriticalFactorScore criticalscore;
        // offset: 0x30, bitSize: 0x20(0x4 Byte(s))
        float maxsightvalue;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float maxjumpsightvalue;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        uint:8 fullsights;
    };

    // bitSize: 0x88, members: 6
    struct ConsideredPointData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short index;
        // offset: 0x10, bitSize: 0x20(0x4 Byte(s))
        float score;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        CriticalFactorScore criticalscore;
        // offset: 0x38, bitSize: 0x20(0x4 Byte(s))
        float enemyposx;
        // offset: 0x58, bitSize: 0x20(0x4 Byte(s))
        float enemyposy;
        // offset: 0x78, bitSize: 0x10(0x2 Byte(s))
        short criticalscorereason;
    };

    // idx 0x0 members: 0x4 type: 5
    enum CriticalFactorScore {
        invalid, // 0x0
        good, // 0x1
        ok, // 0x2
        bad // 0x3
    };

    // root: bitSize: 0x5528, members: 4

    // offset: 0x0, bitSize: 0x4fb0(0x9f6 Byte(s)), array:0x96(hti:0xffff)
    ConsideredPointData consideredpointdata[150];
    // offset: 0x4fb0, bitSize: 0x80(0x10 Byte(s))
    FrontLineData frontlinedata;
    // offset: 0x5030, bitSize: 0x480(0x90 Byte(s)), array:0xc(hti:0xffff)
    ClusterData clusterdata[12];
    // offset: 0x54b0, bitSize: 0x78(0xf Byte(s))
    SpawnScoreData spawnscoredata;
};

