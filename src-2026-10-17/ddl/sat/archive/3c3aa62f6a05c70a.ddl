// file .... ddl\sat\archive\3c3aa62f6a05c70a.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 3 (0x3)
    // bit size .. 3224 (0xc98)
    // byte size . 403 (0x193)
    // archive ... hash_3c3aa62f6a05c70a

    // bitSize: 0x298, members: 26
    struct ZMSavePlayer {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint cash;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint downs;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint hash_bf9be321df01a21c;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        uint:8 armor_plates;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        uint fatemask;
        // offset: 0x88, bitSize: 0x8(0x1 Byte(s))
        uint:8 hash_99dfa4e30682a13d;
        // offset: 0x90, bitSize: 0x8(0x1 Byte(s))
        uint:8 scoremultix;
        // offset: 0x98, bitSize: 0x20(0x4 Byte(s))
        uint scorepoints;
        // offset: 0xb8, bitSize: 0x8(0x1 Byte(s))
        uint:8 scorebombs;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        uint scorekills;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        uint:8 scorelives;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        uint hash_7fd99f7bcdaa9296;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        uint scoregems;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        uint superpoints;
        // offset: 0x148, bitSize: 0x8(0x1 Byte(s))
        uint:8 armor_vest;
        // offset: 0x150, bitSize: 0x8(0x1 Byte(s))
        uint:8 healthregen;
        // offset: 0x158, bitSize: 0x20(0x4 Byte(s))
        uint superid;
        // offset: 0x178, bitSize: 0x20(0x4 Byte(s))
        uint gametime;
        // offset: 0x198, bitSize: 0x20(0x4 Byte(s))
        uint hash_bb350ab23ff0fe83;
        // offset: 0x1b8, bitSize: 0x20(0x4 Byte(s))
        uint hash_bb350bb23ff10036;
        // offset: 0x1d8, bitSize: 0x20(0x4 Byte(s))
        uint hash_bb350cb23ff101e9;
        // offset: 0x1f8, bitSize: 0x20(0x4 Byte(s))
        uint hash_28b4a44a03798811;
        // offset: 0x218, bitSize: 0x20(0x4 Byte(s))
        uint hash_97d8632832d9c755;
        // offset: 0x238, bitSize: 0x20(0x4 Byte(s))
        uint hash_d17ce9167c377d9d;
        // offset: 0x258, bitSize: 0x20(0x4 Byte(s))
        uint ammomod;
        // offset: 0x278, bitSize: 0x20(0x4 Byte(s))
        uint roundnumber;
    };

    // bitSize: 0xa80, members: 2
    struct ZTRONSave {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int timestamp;
        // offset: 0x20, bitSize: 0xa60(0x14c Byte(s)), array:0x4(hti:0xffff)
        ZMSavePlayer players[4];
    };

    // root: bitSize: 0xbe8, members: 7

    // offset: 0x0, bitSize: 0xa80(0x150 Byte(s))
    ZTRONSave save;
    // offset: 0xa80, bitSize: 0x100(0x20 Byte(s)), array:0x4(hti:0xffff)
    uint64 player_xuids[4];
    // offset: 0xb80, bitSize: 0x20(0x4 Byte(s))
    int num_players;
    // offset: 0xba0, bitSize: 0x20(0x4 Byte(s))
    int playlist_id;
    // offset: 0xbc0, bitSize: 0x20(0x4 Byte(s))
    int save_version;
    // offset: 0xbe0, bitSize: 0x1
    bool disconnect_save;
};

