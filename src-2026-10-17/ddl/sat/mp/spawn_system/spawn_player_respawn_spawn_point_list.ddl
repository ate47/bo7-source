// file .... ddl\sat\mp\spawn_system\spawn_player_respawn_spawn_point_list.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 2 (0x2)
    // bit size .. 102576 (0x190b0)
    // byte size . 12822 (0x3216)
    // archive ... hash_b0928d9cd56088c

    // bitSize: 0x80, members: 4
    struct SpawnPointData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float dir;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float posx;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float posy;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint index;
    };

    // root: bitSize: 0x19000, members: 1

    // offset: 0x0, bitSize: 0x19000(0x3200 Byte(s)), array:0x320(hti:0xffff)
    SpawnPointData pointdata[800];
};

