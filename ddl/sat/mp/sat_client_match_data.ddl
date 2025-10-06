// file .... ddl\sat\mp\sat_client_match_data.ddl

version 1 {
    // enums ..... 3 (0x3)
    // structs ... 3 (0x3)
    // bit size .. 181920 (0x2c6a0)
    // byte size . 22740 (0x58d4)
    // archive ... hash_d943a775fc8d357b

    // bitSize: 0x30, members: 4
    struct Death {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte deathpos[2];
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte attacker;
        // offset: 0x18, bitSize: 0x8(0x1 Byte(s))
        byte player;
        // offset: 0x20, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte attackerpos[2];
    };

    // bitSize: 0x318, members: 26
    struct Player {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short rank;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        SatTeam team;
        // offset: 0x18, bitSize: 0x10(0x2 Byte(s))
        short kills;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        string(4) clantag;
        // offset: 0x68, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x88, bitSize: 0x10(0x2 Byte(s))
        short placement;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        SatClientPlatform platform;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objectivescore;
        // offset: 0xc0, bitSize: 0x10(0x2 Byte(s))
        short extrascore0;
        // offset: 0xd0, bitSize: 0x10(0x2 Byte(s))
        short extrascore1;
        // offset: 0xe0, bitSize: 0x10(0x2 Byte(s))
        short extrascore2;
        // offset: 0xf0, bitSize: 0x10(0x2 Byte(s))
        short extrascore3;
        // offset: 0x100, bitSize: 0x10(0x2 Byte(s))
        short extrascore4;
        // offset: 0x110, bitSize: 0x10(0x2 Byte(s))
        short extrascore5;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int xuidhigh;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int xuidlow;
        // offset: 0x160, bitSize: 0x10(0x2 Byte(s))
        short deaths;
        // offset: 0x170, bitSize: 0x10(0x2 Byte(s))
        short prestige;
        // offset: 0x180, bitSize: 0x8(0x1 Byte(s))
        SatFaction faction;
        // offset: 0x188, bitSize: 0x10(0x2 Byte(s))
        short assists;
        // offset: 0x198, bitSize: 0x170(0x2e Byte(s))
        string(46) username;
        // offset: 0x308, bitSize: 0x8(0x1 Byte(s))
        byte uniqueclientid;
        // offset: 0x310, bitSize: 0x1
        bool isbot;
        // offset: 0x311, bitSize: 0x1
        bool leagueplaymatchcancelled;
    };

    // idx 0x0 members: 0xf type: 5
    enum SatClientPlatform {
        none, // 0x0
        steam, // 0x1
        bnet, // 0x2
        xb3, // 0x3
        xb4, // 0x4
        ps4, // 0x5
        ps5, // 0x6
        wegame, // 0x7
        ios, // 0x8
        android, // 0x9
        switch, // 0xa
        bot, // 0xb
        msstore, // 0xc
        ubiconnect, // 0xd
        any // 0xe
    };

    // idx 0x1 members: 0x12 type: 5
    enum SatFaction {
        CIA, // 0x0
        FIVE, // 0x1
        MILI, // 0x2
        N_A, // 0x3
        NAVY, // 0x4
        OPFOR, // 0x5
        RANGERS, // 0x6
        RUSF, // 0x7
        Requiem, // 0x8
        SABF, // 0x9
        SAS, // 0xa
        SEVEN, // 0xb
        SIX, // 0xc
        SPTNZ, // 0xd
        TF141, // 0xe
        USMC, // 0xf
        _REDACTED_, // 0x10
        none // 0x11
    };

    // idx 0x2 members: 0xcf type: 5
    enum SatTeam {
        none, // 0x0
        free, // 0x1
        axis, // 0x2
        allies, // 0x3
        team_three, // 0x4
        team_four, // 0x5
        team_five, // 0x6
        team_six, // 0x7
        team_seven, // 0x8
        team_eight, // 0x9
        team_nine, // 0xa
        team_ten, // 0xb
        team_eleven, // 0xc
        team_twelve, // 0xd
        team_thirteen, // 0xe
        team_fourteen, // 0xf
        team_fifteen, // 0x10
        team_sixteen, // 0x11
        team_seventeen, // 0x12
        team_eighteen, // 0x13
        team_nineteen, // 0x14
        team_twenty, // 0x15
        team_twenty_one, // 0x16
        team_twenty_two, // 0x17
        team_twenty_three, // 0x18
        team_twenty_four, // 0x19
        team_twenty_five, // 0x1a
        team_twenty_six, // 0x1b
        team_twenty_seven, // 0x1c
        team_twenty_eight, // 0x1d
        team_twenty_nine, // 0x1e
        team_thirty, // 0x1f
        team_thirty_one, // 0x20
        team_thirty_two, // 0x21
        team_thirty_three, // 0x22
        team_thirty_four, // 0x23
        team_thirty_five, // 0x24
        team_thirty_six, // 0x25
        team_thirty_seven, // 0x26
        team_thirty_eight, // 0x27
        team_thirty_nine, // 0x28
        team_forty, // 0x29
        team_forty_one, // 0x2a
        team_forty_two, // 0x2b
        team_forty_three, // 0x2c
        team_forty_four, // 0x2d
        team_forty_five, // 0x2e
        team_forty_six, // 0x2f
        team_forty_seven, // 0x30
        team_forty_eight, // 0x31
        team_forty_nine, // 0x32
        team_fifty, // 0x33
        team_fifty_one, // 0x34
        team_fifty_two, // 0x35
        team_fifty_three, // 0x36
        team_fifty_four, // 0x37
        team_fifty_five, // 0x38
        team_fifty_six, // 0x39
        team_fifty_seven, // 0x3a
        team_fifty_eight, // 0x3b
        team_fifty_nine, // 0x3c
        team_sixty, // 0x3d
        team_sixty_one, // 0x3e
        team_sixty_two, // 0x3f
        team_sixty_three, // 0x40
        team_sixty_four, // 0x41
        team_sixty_five, // 0x42
        team_sixty_six, // 0x43
        team_sixty_seven, // 0x44
        team_sixty_eight, // 0x45
        team_sixty_nine, // 0x46
        team_seventy, // 0x47
        team_seventy_one, // 0x48
        team_seventy_two, // 0x49
        team_seventy_three, // 0x4a
        team_seventy_four, // 0x4b
        team_seventy_five, // 0x4c
        team_seventy_six, // 0x4d
        team_seventy_seven, // 0x4e
        team_seventy_eight, // 0x4f
        team_seventy_nine, // 0x50
        team_eighty, // 0x51
        team_eighty_one, // 0x52
        team_eighty_two, // 0x53
        team_eighty_three, // 0x54
        team_eighty_four, // 0x55
        team_eighty_five, // 0x56
        team_eighty_six, // 0x57
        team_eighty_seven, // 0x58
        team_eighty_eight, // 0x59
        team_eighty_nine, // 0x5a
        team_ninety, // 0x5b
        team_ninety_one, // 0x5c
        team_ninety_two, // 0x5d
        team_ninety_three, // 0x5e
        team_ninety_four, // 0x5f
        team_ninety_five, // 0x60
        team_ninety_six, // 0x61
        team_ninety_seven, // 0x62
        team_ninety_eight, // 0x63
        team_ninety_nine, // 0x64
        team_hundred, // 0x65
        team_hundred_one, // 0x66
        team_hundred_two, // 0x67
        team_hundred_three, // 0x68
        team_hundred_four, // 0x69
        team_hundred_five, // 0x6a
        team_hundred_six, // 0x6b
        team_hundred_seven, // 0x6c
        team_hundred_eight, // 0x6d
        team_hundred_nine, // 0x6e
        team_hundred_ten, // 0x6f
        team_hundred_eleven, // 0x70
        team_hundred_twelve, // 0x71
        team_hundred_thirteen, // 0x72
        team_hundred_fourteen, // 0x73
        team_hundred_fifteen, // 0x74
        team_hundred_sixteen, // 0x75
        team_hundred_seventeen, // 0x76
        team_hundred_eightteen, // 0x77
        team_hundred_nineteen, // 0x78
        team_hundred_twenty, // 0x79
        team_hundred_twenty_one, // 0x7a
        team_hundred_twenty_two, // 0x7b
        team_hundred_twenty_three, // 0x7c
        team_hundred_twenty_four, // 0x7d
        team_hundred_twenty_five, // 0x7e
        team_hundred_twenty_six, // 0x7f
        team_hundred_twenty_seven, // 0x80
        team_hundred_twenty_eight, // 0x81
        team_hundred_twenty_nine, // 0x82
        team_hundred_thirty, // 0x83
        team_hundred_thirty_one, // 0x84
        team_hundred_thirty_two, // 0x85
        team_hundred_thirty_three, // 0x86
        team_hundred_thirty_four, // 0x87
        team_hundred_thirty_five, // 0x88
        team_hundred_thirty_six, // 0x89
        team_hundred_thirty_seven, // 0x8a
        team_hundred_thirty_eight, // 0x8b
        team_hundred_thirty_nine, // 0x8c
        team_hundred_forty, // 0x8d
        team_hundred_forty_one, // 0x8e
        team_hundred_forty_two, // 0x8f
        team_hundred_forty_three, // 0x90
        team_hundred_forty_four, // 0x91
        team_hundred_forty_five, // 0x92
        team_hundred_forty_six, // 0x93
        team_hundred_forty_seven, // 0x94
        team_hundred_forty_eight, // 0x95
        team_hundred_forty_nine, // 0x96
        team_hundred_fifty, // 0x97
        team_hundred_fifty_one, // 0x98
        team_hundred_fifty_two, // 0x99
        team_hundred_fifty_three, // 0x9a
        team_hundred_fifty_four, // 0x9b
        team_hundred_fifty_five, // 0x9c
        team_hundred_fifty_six, // 0x9d
        team_hundred_fifty_seven, // 0x9e
        team_hundred_fifty_eight, // 0x9f
        team_hundred_fifty_nine, // 0xa0
        team_hundred_sixty, // 0xa1
        team_hundred_sixty_one, // 0xa2
        team_hundred_sixty_two, // 0xa3
        team_hundred_sixty_three, // 0xa4
        team_hundred_sixty_four, // 0xa5
        team_hundred_sixty_five, // 0xa6
        team_hundred_sixty_six, // 0xa7
        team_hundred_sixty_seven, // 0xa8
        team_hundred_sixty_eight, // 0xa9
        team_hundred_sixty_nine, // 0xaa
        team_hundred_seventy, // 0xab
        team_hundred_seventy_one, // 0xac
        team_hundred_seventy_two, // 0xad
        team_hundred_seventy_three, // 0xae
        team_hundred_seventy_four, // 0xaf
        team_hundred_seventy_five, // 0xb0
        team_hundred_seventy_six, // 0xb1
        team_hundred_seventy_seven, // 0xb2
        team_hundred_seventy_eight, // 0xb3
        team_hundred_seventy_nine, // 0xb4
        team_hundred_eighty, // 0xb5
        team_hundred_eighty_one, // 0xb6
        team_hundred_eighty_two, // 0xb7
        team_hundred_eighty_three, // 0xb8
        team_hundred_eighty_four, // 0xb9
        team_hundred_eighty_five, // 0xba
        team_hundred_eighty_six, // 0xbb
        team_hundred_eighty_seven, // 0xbc
        team_hundred_eighty_eight, // 0xbd
        team_hundred_eighty_nine, // 0xbe
        team_hundred_ninety, // 0xbf
        team_hundred_ninety_one, // 0xc0
        team_hundred_ninety_two, // 0xc1
        team_hundred_ninety_three, // 0xc2
        team_hundred_ninety_four, // 0xc3
        team_hundred_ninety_five, // 0xc4
        team_hundred_ninety_six, // 0xc5
        team_hundred_ninety_seven, // 0xc6
        team_hundred_ninety_eight, // 0xc7
        team_hundred_ninety_nine, // 0xc8
        team_two_hundred, // 0xc9
        spectator, // 0xca
        codcaster, // 0xcb
        civilian, // 0xcc
        team_big_map_agent, // 0xcd
        random // 0xce
    };

    // root: bitSize: 0x2c690, members: 20

    // offset: 0x0, bitSize: 0x100(0x20 Byte(s))
    string(32) map;
    // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
    float alliesttb;
    // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
    int allieskills;
    // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
    int alliesscore;
    // offset: 0x160, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
    byte bestteams[2];
    // offset: 0x170, bitSize: 0x20(0x4 Byte(s))
    int axisscore;
    // offset: 0x190, bitSize: 0x8(0x1 Byte(s))
    byte scoreboardplayercount;
    // offset: 0x198, bitSize: 0x20(0x4 Byte(s))
    int team3score;
    // offset: 0x1b8, bitSize: 0x1f40(0x3e8 Byte(s)), array:0x3e8(hti:0xffff)
    byte scoreboards[1000];
    // offset: 0x20f8, bitSize: 0x100(0x20 Byte(s))
    string(32) gametype;
    // offset: 0x21f8, bitSize: 0x20(0x4 Byte(s))
    int maxplayercount;
    // offset: 0x2218, bitSize: 0x3840(0x708 Byte(s)), array:0x12c(hti:0xffff)
    Death deaths[300];
    // offset: 0x5a58, bitSize: 0x20(0x4 Byte(s))
    int scoreprogresslimit;
    // offset: 0x5a78, bitSize: 0x20(0x4 Byte(s))
    int alliesdeaths;
    // offset: 0x5a98, bitSize: 0x20(0x4 Byte(s))
    float axisttb;
    // offset: 0x5ab8, bitSize: 0x26ac0(0x4d58 Byte(s)), array:0xc8(hti:0xffff)
    Player players[200];
    // offset: 0x2c578, bitSize: 0x100(0x20 Byte(s))
    string(32) gametypenamekey;
    // offset: 0x2c678, bitSize: 0x10(0x2 Byte(s))
    short deathcount;
    // offset: 0x2c688, bitSize: 0x1
    bool ispublicmatch;
};

