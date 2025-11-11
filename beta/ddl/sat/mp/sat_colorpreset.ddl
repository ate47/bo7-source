// file .... ddl\sat\mp\sat_colorpreset.ddl

version 1 {
    // enums ..... 0 (0x0)
    // structs ... 3 (0x3)
    // bit size .. 808 (0x328)
    // byte size . 101 (0x65)
    // archive ... hash_755d2965245ae2de

    // bitSize: 0x1f0, members: 27
    struct ColorCustomizationFullscreenPreset {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad3advancedcolor;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad1index;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad2index;
        // offset: 0x30, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationpartyadvancedcolor;
        // offset: 0x50, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad3index;
        // offset: 0x58, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad4index;
        // offset: 0x60, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationallyindex;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad5index;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationsquad6index;
        // offset: 0x78, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad2advancedcolor;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        byte palette;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationneutraladvancedcolor;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad1advancedcolor;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationpartyindex;
        // offset: 0xe8, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationyouadvancedcolor;
        // offset: 0x108, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationcontestedadvancedcolor;
        // offset: 0x128, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationallyadvancedcolor;
        // offset: 0x148, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationneutralindex;
        // offset: 0x150, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationenemyindex;
        // offset: 0x158, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad6advancedcolor;
        // offset: 0x178, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad5advancedcolor;
        // offset: 0x198, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationenemyadvancedcolor;
        // offset: 0x1b8, bitSize: 0x20(0x4 Byte(s))
        int colorcustomizationsquad4advancedcolor;
        // offset: 0x1d8, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationyouindex;
        // offset: 0x1e0, bitSize: 0x8(0x1 Byte(s))
        byte colorcustomizationcontestedindex;
        // offset: 0x1e8, bitSize: 0x1
        bool initialized;
    };

    // bitSize: 0x88, members: 9
    struct CodCasterTeamColorPreset {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int advancedsecondarycolor;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int advancedprimarycolor;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte palette;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte codcaster_option_team_setting_secondary_color;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        int advancedsubstitutecolor;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        byte codcaster_option_team_setting_substitute_color;
        // offset: 0x78, bitSize: 0x8(0x1 Byte(s))
        byte codcaster_option_team_setting_primary_color;
        // offset: 0x80, bitSize: 0x1
        bool initialized;
    };

    // root: bitSize: 0x278, members: 2

    // offset: 0x0, bitSize: 0x1f0(0x3e Byte(s))
    ColorCustomizationFullscreenPreset colorcustomizationpalette;
    // offset: 0x1f0, bitSize: 0x88(0x11 Byte(s))
    CodCasterTeamColorPreset codcasterteamcolorpreset;
};

