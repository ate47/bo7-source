// file .... ddl\sat\mp\sat_favoritesettings.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 2 (0x2)
    // bit size .. 4024 (0xfb8)
    // byte size . 503 (0x1f7)
    // archive ... hash_dac0a889560e2334

    // bitSize: 0x780, members: 2
    struct favoriteList {
        // offset: 0x0, bitSize: 0x3c0(0x78 Byte(s)), array:0xf(hti:0xffff)
        hashres controller_favorite_settings[15];
        // offset: 0x3c0, bitSize: 0x3c0(0x78 Byte(s)), array:0xf(hti:0xffff)
        hashres kbm_favorite_settings[15];
    };

    // root: bitSize: 0xf08, members: 5

    // offset: 0x0, bitSize: 0x780(0xf0 Byte(s))
    favoriteList favorites_pc;
    // offset: 0x780, bitSize: 0x780(0xf0 Byte(s))
    favoriteList favorites_console;
    // offset: 0xf00, bitSize: 0x1
    bool favorites_console_hasbeenread;
    // offset: 0xf01, bitSize: 0x1
    bool favorites_pc_hasbeenread;
};

