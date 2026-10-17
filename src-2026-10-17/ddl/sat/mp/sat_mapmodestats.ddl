// file .... ddl\sat\mp\sat_mapmodestats.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 54 (0x36)
    // bit size .. 2409776 (0x24c530)
    // byte size . 301222 (0x498a6)
    // archive ... hash_a3b5456a81bcb3a9

    // bitSize: 0x120, members: 9
    struct ModeStats_War {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Arm {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Conflict {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_GWTDM {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int contribution;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Arena {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_HQ {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Cyber {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int revives;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int plants;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x2c0, members: 22
    struct ModeStats_BR {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int cash;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int downs;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int toptwentyfive;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int elitestarted;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int revives;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int eliteblocked;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int weaponcaseexfils;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int agentkills;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int topfive;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int tokens;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        int topten;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        int weaponcasewins;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int elitecompleted;
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int secondaryvictories;
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        int contracts;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Front {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Dom {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_SD {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defuses;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int plants;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Conf {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int denies;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int confirms;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_DM {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int streak;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0xc0, members: 6
    struct ModeStats_High {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int streak;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_KOTH {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0xe0, members: 7
    struct ModeStats_Koth_Horde {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int zombiedeaths;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_TDef {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Ball {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int carries;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int throws;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_DD {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defuses;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int plants;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_CTF {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int returns;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_BigCTF {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int returns;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_SR {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int rescues;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int plants;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Siege {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int revives;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Grind {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int banks;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int denies;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Infect {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int time;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int infected;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Gun {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int stabs;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int setbacks;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Sticks {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int stabs;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int setbacks;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Team_Gun {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int stabs;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int setbacks;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Grnd {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Cmd {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Control {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int segmentcaptures;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_OB {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Robj {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Bounty {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hvtkills;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Xfire {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_Gold_Gun {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0xc0, members: 6
    struct ModeStats_Conf_V {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int denies;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int confirms;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Wm {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x160, members: 11
    struct ModeStats_Gold {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int gold_secure;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gold_steal;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x180, members: 12
    struct ModeStats_Sugar {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int cookie_deposited;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int objective_kills;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int cookie_collected;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x1a0, members: 13
    struct ModeStats_Ctdm {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int combo_high_score;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int combo_action_count;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int combo_heat_time;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int combo_score;
    };

    // bitSize: 0x160, members: 11
    struct ModeStats_Sabattack {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hash_bb8898659e841b9c;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int damage;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int overcharge_count;
    };

    // bitSize: 0x180, members: 12
    struct ModeStats_Skirmish {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int top_squad_kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int objectives_completed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int supplies_retrieved;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Landgrab {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_ArmorUp {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_HVT {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hvtkills;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x180, members: 12
    struct ModeStats_Multi {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int confirms;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
    struct ModeStats_StopGO {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int time;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int placement;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x180, members: 12
    struct ModeStats_Prop {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int prop_obj_time;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int prop_decoys_destroyed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int prop_survived;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0xe0, members: 7
    struct ModeStats_Sharp {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x140, members: 10
    struct ModeStats_Escort {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int wins;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int score;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int timeplayed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int defends;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int objtime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_79a0b404acd3e2c4;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int losses;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x9ce0, members: 99
    struct GameModeStats {
        // offset: 0x0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br;
        // offset: 0x2c0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_DD dd;
        // offset: 0x3e0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_DM dm;
        // offset: 0x500, bitSize: 0x120(0x24 Byte(s))
        ModeStats_HQ hq;
        // offset: 0x620, bitSize: 0x120(0x24 Byte(s))
        ModeStats_OB ob;
        // offset: 0x740, bitSize: 0x120(0x24 Byte(s))
        ModeStats_SD sd;
        // offset: 0x860, bitSize: 0x120(0x24 Byte(s))
        ModeStats_SR sr;
        // offset: 0x980, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Wm wm;
        // offset: 0xac0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Arm arm;
        // offset: 0xbe0, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Cmd cmd;
        // offset: 0xd20, bitSize: 0x120(0x24 Byte(s))
        ModeStats_CTF ctf;
        // offset: 0xe40, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR dmz;
        // offset: 0x1100, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Dom dom;
        // offset: 0x1220, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Gun gun;
        // offset: 0x1340, bitSize: 0x120(0x24 Byte(s))
        ModeStats_HVT hvt;
        // offset: 0x1460, bitSize: 0x120(0x24 Byte(s))
        ModeStats_War war;
        // offset: 0x1580, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR zxp;
        // offset: 0x1840, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Ball ball;
        // offset: 0x1960, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR boba;
        // offset: 0x1c20, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Conf conf;
        // offset: 0x1d40, bitSize: 0x1a0(0x34 Byte(s))
        ModeStats_Ctdm ctdm;
        // offset: 0x1ee0, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Gold gold;
        // offset: 0x2040, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Grnd grnd;
        // offset: 0x2160, bitSize: 0xc0(0x18 Byte(s))
        ModeStats_High high;
        // offset: 0x2220, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR jugg;
        // offset: 0x24e0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_KOTH koth;
        // offset: 0x2600, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR mini;
        // offset: 0x28c0, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Prop prop;
        // offset: 0x2a40, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Robj robj;
        // offset: 0x2b60, bitSize: 0x120(0x24 Byte(s))
        ModeStats_TDef tdef;
        // offset: 0x2c80, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR resurgence_mgl;
        // offset: 0x2f40, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Arena arena;
        // offset: 0x3080, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR bongo;
        // offset: 0x3340, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Cyber cyber;
        // offset: 0x3460, bitSize: 0x120(0x24 Byte(s))
        ModeStats_DM fo_dm;
        // offset: 0x3580, bitSize: 0x120(0x24 Byte(s))
        ModeStats_SD fo_sd;
        // offset: 0x36a0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Front front;
        // offset: 0x37c0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Grind grind;
        // offset: 0x38e0, bitSize: 0x140(0x28 Byte(s))
        ModeStats_GWTDM gwtdm;
        // offset: 0x3a20, bitSize: 0x120(0x24 Byte(s))
        ModeStats_DM hc_dm;
        // offset: 0x3b40, bitSize: 0x120(0x24 Byte(s))
        ModeStats_HQ hc_hq;
        // offset: 0x3c60, bitSize: 0x120(0x24 Byte(s))
        ModeStats_SD hc_sd;
        // offset: 0x3d80, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Multi multi;
        // offset: 0x3f00, bitSize: 0xe0(0x1c Byte(s))
        ModeStats_Sharp sharp;
        // offset: 0x3fe0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Siege siege;
        // offset: 0x4100, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Sugar sugar;
        // offset: 0x4280, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Xfire xfire;
        // offset: 0x43a0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_auto;
        // offset: 0x4660, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_evac;
        // offset: 0x4920, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR vanilla;
        // offset: 0x4be0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_champion;
        // offset: 0x4ea0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Conf hc_conf;
        // offset: 0x4fc0, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Gold hc_gold;
        // offset: 0x5120, bitSize: 0x120(0x24 Byte(s))
        ModeStats_KOTH hc_koth;
        // offset: 0x5240, bitSize: 0x120(0x24 Byte(s))
        ModeStats_TDef hc_tdef;
        // offset: 0x5360, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR power_armor;
        // offset: 0x5620, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Control control;
        // offset: 0x5760, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Sabattack hc_sabattack;
        // offset: 0x58c0, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Arena hc_arena;
        // offset: 0x5a00, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Cyber hc_cyber;
        // offset: 0x5b20, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_zonecontrol;
        // offset: 0x5de0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR truckwar;
        // offset: 0x60a0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Gold_Gun gold_gun;
        // offset: 0x61c0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_mini_mgl;
        // offset: 0x6480, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Skirmish skirmish;
        // offset: 0x6600, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_sandbox;
        // offset: 0x68c0, bitSize: 0xe0(0x1c Byte(s))
        ModeStats_Koth_Horde koth_horde;
        // offset: 0x69a0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Team_Gun team_gun;
        // offset: 0x6ac0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_StopGO stop_and_go;
        // offset: 0x6be0, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Skirmish skirmishbt;
        // offset: 0x6d60, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Landgrab landgrab;
        // offset: 0x6ea0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR kingslayer;
        // offset: 0x7160, bitSize: 0x120(0x24 Byte(s))
        ModeStats_BigCTF bigctf;
        // offset: 0x7280, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Bounty bounty;
        // offset: 0x73c0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR mini_mgl;
        // offset: 0x7680, bitSize: 0xc0(0x18 Byte(s))
        ModeStats_Conf_V conf_v;
        // offset: 0x7740, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_resurgence_mgl;
        // offset: 0x7a00, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Escort escort;
        // offset: 0x7b40, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Dom fo_dom;
        // offset: 0x7c60, bitSize: 0x120(0x24 Byte(s))
        ModeStats_HVT fo_hvt;
        // offset: 0x7d80, bitSize: 0x120(0x24 Byte(s))
        ModeStats_War fo_war;
        // offset: 0x7ea0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Arm hc_arm;
        // offset: 0x7fc0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Dom hc_dom;
        // offset: 0x80e0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_HVT hc_hvt;
        // offset: 0x8200, bitSize: 0x120(0x24 Byte(s))
        ModeStats_War hc_war;
        // offset: 0x8320, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Infect infect;
        // offset: 0x8440, bitSize: 0x120(0x24 Byte(s))
        ModeStats_War hc_fo_war;
        // offset: 0x8560, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_rumble_mgl;
        // offset: 0x8820, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_extract;
        // offset: 0x8ae0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR zonecontrol;
        // offset: 0x8da0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Sticks sticks;
        // offset: 0x8ec0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_ArmorUp armorup;
        // offset: 0x8fe0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Conf fo_conf;
        // offset: 0x9100, bitSize: 0x120(0x24 Byte(s))
        ModeStats_KOTH fo_koth;
        // offset: 0x9220, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Conflict conflict;
        // offset: 0x9340, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Sabattack sabattack;
        // offset: 0x94a0, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR br_resurgence;
        // offset: 0x9760, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR plunder;
        // offset: 0x9a20, bitSize: 0x2c0(0x58 Byte(s))
        ModeStats_BR resurgence;
    };

    // bitSize: 0x9ce0, members: 1
    struct MapAndGameModeStats {
        // offset: 0x0, bitSize: 0x9ce0(0x139c Byte(s))
        GameModeStats modestats;
    };

    // idx 0x0 members: 0x3c type: c
    enum MPMapList {
        mp_sat_homestead, // 0x0
        mp_sat_the_forge, // 0x1
        mp_sat_rm_raid, // 0x2
        mp_sat_rm_express, // 0x3
        mp_sat_rm_hijacked, // 0x4
        mp_sat_sm_catacomb, // 0x5
        mp_sat_rm_vertigo, // 0x6
        mp_sat_rm_gridlock, // 0x7
        mp_sat_rm_mountain, // 0x8
        mp_sat_rm_cosmodrome, // 0x9
        mp_sat_rm_village, // 0xa
        mp_sat_rm_slums, // 0xb
        mp_sat_rm_meltdown, // 0xc
        mp_sat_rm_socotra2, // 0xd
        mp_sat_rm_nightclub, // 0xe
        mp_sat_den, // 0xf
        mp_sat_synapse, // 0x10
        mp_sat_karma, // 0x11
        mp_sat_whiteout, // 0x12
        mp_sat_barrel, // 0x13
        mp_sat_roji, // 0x14
        mp_sat_sm_hospital, // 0x15
        mp_sat_scar, // 0x16
        mp_sat_shipyard, // 0x17
        mp_sat_sm_blackheart, // 0x18
        mp_sat_cortex, // 0x19
        mp_sat_frontier, // 0x1a
        mp_sat_volt, // 0x1b
        mp_sat_flushed, // 0x1c
        mp_sat_enigma, // 0x1d
        mp_sat_rm_nt2025, // 0x1e
        mp_sat_co_penthouse, // 0x1f
        mp_sat_sm_zero, // 0x20
        mp_sat_odysseus, // 0x21
        mp_sat_co_sm_flat, // 0x22
        mp_sat_sm_freeway, // 0x23
        mp_sat_sm_sora, // 0x24
        mp_sat_sm_liminal, // 0x25
        mp_sat_beacon, // 0x26
        mp_sat_lm_avalon_ob_igc, // 0x27
        mp_sat_ava_hightown_skr, // 0x28
        mp_sat_ava_fort_skr, // 0x29
        mp_sat_sm_abyss, // 0x2a
        mp_sat_co_rm_firingrange2, // 0x2b
        mp_sat_sm_nexus, // 0x2c
        mp_sat_co_safehouse, // 0x2d
        mp_sat_gameshow, // 0x2e
        mp_sat_co_sm_babylon, // 0x2f
        mp_sat_co_rm_grind, // 0x30
        mp_sat_co_stealth, // 0x31
        mp_sat_co_sm_nomad, // 0x32
        mp_sat_co_sm_bullet, // 0x33
        mp_sat_co_rm_veiled, // 0x34
        mp_sat_buzzkill, // 0x35
        mp_sat_sm_onsen, // 0x36
        mp_sat_freerun, // 0x37
        mp_sat_the_forge_traincourse, // 0x38
        mp_sat_ava_rm_dig, // 0x39
        mp_sat_coolant, // 0x3a
        mp_sat_rm_nt2025_daisy // 0x3b
    };

    // root: bitSize: 0x24c480, members: 1

    // offset: 0x0, bitSize: 0x24c480(0x49890 Byte(s)), array:0x3c(hti:0x0)
    MapAndGameModeStats hash_4293ae451b744ef[MPMapList];
};

