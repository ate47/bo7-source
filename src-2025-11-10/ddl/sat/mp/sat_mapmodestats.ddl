// file .... ddl\sat\mp\sat_mapmodestats.ddl

version 1 {
    // enums ..... 1 (0x1)
    // structs ... 51 (0x33)
    // bit size .. 770352 (0xbc130)
    // byte size . 96294 (0x17826)
    // archive ... hash_1fb30ec6a20061a3

    // bitSize: 0x100, members: 8
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
        int kdratio;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
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
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
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
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int plants;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x2a0, members: 21
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
        int tokens;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int topten;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        int weaponcasewins;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        int elitecompleted;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int secondaryvictories;
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int contracts;
    };

    // bitSize: 0x100, members: 8
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
        int kdratio;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int plants;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int confirms;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int streak;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
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

    // bitSize: 0x100, members: 8
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

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int throws;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int plants;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int plants;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
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
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
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
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x120, members: 9
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
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
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

    // bitSize: 0x120, members: 9
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
        int kdratio;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x140, members: 10
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
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x160, members: 11
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
        int cookie_collected;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x180, members: 12
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
        int assists;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int combo_score;
    };

    // bitSize: 0x140, members: 10
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
        int damage;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int deaths;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int flag_carrier_kill_count;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int overcharge_count;
    };

    // bitSize: 0x160, members: 11
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
        int kdratio;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x120, members: 9
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
        int gamesplayed;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int kdratio;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x100, members: 8
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
        int assists;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x160, members: 11
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
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int confirms;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int captures;
    };

    // bitSize: 0x100, members: 8
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
        int gamesplayed;
    };

    // bitSize: 0x160, members: 11
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
        int kdratio;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int assists;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int prop_survived;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int gamesplayed;
    };

    // bitSize: 0x88c0, members: 93
    struct GameModeStats {
        // offset: 0x0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br;
        // offset: 0x2a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_DD dd;
        // offset: 0x3a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_DM dm;
        // offset: 0x4a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_HQ hq;
        // offset: 0x5a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_OB ob;
        // offset: 0x6a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_SD sd;
        // offset: 0x7a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_SR sr;
        // offset: 0x8a0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Wm wm;
        // offset: 0x9c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Arm arm;
        // offset: 0xac0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Cmd cmd;
        // offset: 0xbe0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_CTF ctf;
        // offset: 0xce0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR dmz;
        // offset: 0xf80, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Dom dom;
        // offset: 0x1080, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Gun gun;
        // offset: 0x1180, bitSize: 0x100(0x20 Byte(s))
        ModeStats_HVT hvt;
        // offset: 0x1280, bitSize: 0x100(0x20 Byte(s))
        ModeStats_War war;
        // offset: 0x1380, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR zxp;
        // offset: 0x1620, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Ball ball;
        // offset: 0x1720, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR boba;
        // offset: 0x19c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Conf conf;
        // offset: 0x1ac0, bitSize: 0x180(0x30 Byte(s))
        ModeStats_Ctdm ctdm;
        // offset: 0x1c40, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Gold gold;
        // offset: 0x1d80, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Grnd grnd;
        // offset: 0x1e80, bitSize: 0xc0(0x18 Byte(s))
        ModeStats_High high;
        // offset: 0x1f40, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR jugg;
        // offset: 0x21e0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_KOTH koth;
        // offset: 0x22e0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR mini;
        // offset: 0x2580, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Prop prop;
        // offset: 0x26e0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Robj robj;
        // offset: 0x27e0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_TDef tdef;
        // offset: 0x28e0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR resurgence_mgl;
        // offset: 0x2b80, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Arena arena;
        // offset: 0x2ca0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR bongo;
        // offset: 0x2f40, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Cyber cyber;
        // offset: 0x3040, bitSize: 0x100(0x20 Byte(s))
        ModeStats_DM fo_dm;
        // offset: 0x3140, bitSize: 0x100(0x20 Byte(s))
        ModeStats_SD fo_sd;
        // offset: 0x3240, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Front front;
        // offset: 0x3340, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Grind grind;
        // offset: 0x3440, bitSize: 0x120(0x24 Byte(s))
        ModeStats_GWTDM gwtdm;
        // offset: 0x3560, bitSize: 0x100(0x20 Byte(s))
        ModeStats_DM hc_dm;
        // offset: 0x3660, bitSize: 0x100(0x20 Byte(s))
        ModeStats_HQ hc_hq;
        // offset: 0x3760, bitSize: 0x100(0x20 Byte(s))
        ModeStats_SD hc_sd;
        // offset: 0x3860, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Multi multi;
        // offset: 0x39c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Siege siege;
        // offset: 0x3ac0, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Sugar sugar;
        // offset: 0x3c20, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Xfire xfire;
        // offset: 0x3d20, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_auto;
        // offset: 0x3fc0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_evac;
        // offset: 0x4260, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR vanilla;
        // offset: 0x4500, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_champion;
        // offset: 0x47a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Conf hc_conf;
        // offset: 0x48a0, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Gold hc_gold;
        // offset: 0x49e0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_KOTH hc_koth;
        // offset: 0x4ae0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_TDef hc_tdef;
        // offset: 0x4be0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Control control;
        // offset: 0x4d00, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Arena hc_arena;
        // offset: 0x4e20, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Cyber hc_cyber;
        // offset: 0x4f20, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_zonecontrol;
        // offset: 0x51c0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR truckwar;
        // offset: 0x5460, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Gold_Gun gold_gun;
        // offset: 0x5560, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_mini_mgl;
        // offset: 0x5800, bitSize: 0x160(0x2c Byte(s))
        ModeStats_Skirmish skirmish;
        // offset: 0x5960, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_sandbox;
        // offset: 0x5c00, bitSize: 0xe0(0x1c Byte(s))
        ModeStats_Koth_Horde koth_horde;
        // offset: 0x5ce0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Team_Gun team_gun;
        // offset: 0x5de0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_StopGO stop_and_go;
        // offset: 0x5ee0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Landgrab landgrab;
        // offset: 0x6000, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR kingslayer;
        // offset: 0x62a0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_BigCTF bigctf;
        // offset: 0x63a0, bitSize: 0x120(0x24 Byte(s))
        ModeStats_Bounty bounty;
        // offset: 0x64c0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR mini_mgl;
        // offset: 0x6760, bitSize: 0xc0(0x18 Byte(s))
        ModeStats_Conf_V conf_v;
        // offset: 0x6820, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_resurgence_mgl;
        // offset: 0x6ac0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Dom fo_dom;
        // offset: 0x6bc0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_HVT fo_hvt;
        // offset: 0x6cc0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_War fo_war;
        // offset: 0x6dc0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Arm hc_arm;
        // offset: 0x6ec0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Dom hc_dom;
        // offset: 0x6fc0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_HVT hc_hvt;
        // offset: 0x70c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_War hc_war;
        // offset: 0x71c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Infect infect;
        // offset: 0x72c0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_War hc_fo_war;
        // offset: 0x73c0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_rumble_mgl;
        // offset: 0x7660, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_extract;
        // offset: 0x7900, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR zonecontrol;
        // offset: 0x7ba0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_ArmorUp armorup;
        // offset: 0x7ca0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Conf fo_conf;
        // offset: 0x7da0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_KOTH fo_koth;
        // offset: 0x7ea0, bitSize: 0x100(0x20 Byte(s))
        ModeStats_Conflict conflict;
        // offset: 0x7fa0, bitSize: 0x140(0x28 Byte(s))
        ModeStats_Sabattack sabattack;
        // offset: 0x80e0, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR br_resurgence;
        // offset: 0x8380, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR plunder;
        // offset: 0x8620, bitSize: 0x2a0(0x54 Byte(s))
        ModeStats_BR resurgence;
    };

    // bitSize: 0x88c0, members: 1
    struct MapAndGameModeStats {
        // offset: 0x0, bitSize: 0x88c0(0x1118 Byte(s))
        GameModeStats modestats;
    };

    // idx 0x0 members: 0x16 type: c
    enum MPMapList {
        mp_sat_homestead, // 0x0
        mp_sat_the_forge, // 0x1
        mp_sat_rm_raid, // 0x2
        mp_sat_rm_express, // 0x3
        mp_sat_rm_hijacked, // 0x4
        mp_sat_den, // 0x5
        mp_sat_karma, // 0x6
        mp_sat_whiteout, // 0x7
        mp_sat_roji, // 0x8
        mp_sat_sm_hospital, // 0x9
        mp_sat_scar, // 0xa
        mp_sat_shipyard, // 0xb
        mp_sat_sm_blackheart, // 0xc
        mp_sat_cortex, // 0xd
        mp_sat_frontier, // 0xe
        mp_sat_volt, // 0xf
        mp_sat_rm_nt2025, // 0x10
        mp_sat_co_sm_flat, // 0x11
        mp_sat_lm_avalon_ob_igc, // 0x12
        mp_sat_ava_hightown_skr, // 0x13
        mp_sat_ava_fort_skr, // 0x14
        mp_sat_the_forge_traincourse // 0x15
    };

    // root: bitSize: 0xbc080, members: 1

    // offset: 0x0, bitSize: 0xbc080(0x17810 Byte(s)), array:0x16(hti:0x0)
    MapAndGameModeStats hash_4293ae451b744ef[MPMapList];
};

