// file .... ddl\cer\mp\cer_recipes.ddl

version 1 {
    // enums ..... 37 (0x25)
    // structs ... 97 (0x61)
    // bit size .. 140616 (0x22548)
    // byte size . 17577 (0x44a9)
    // archive ... hash_4996070d2731998c

    // bitSize: 0x68, members: 7
    struct AttachmentSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint attachmentlootid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint attachmentblueprintlootid;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        uint:8 attachmentvariantid;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte attachmentoverridechildindex;
        // offset: 0x50, bitSize: 0x10(0x2 Byte(s)), array:0x2(hti:0xffff)
        byte customtune[2];
        // offset: 0x60, bitSize: 0x1
        bool hasbptune;
    };

    // bitSize: 0x988, members: 17
    struct WeaponSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint weaponlootid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        uint paintjobid;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        uint lastinteractiontime;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        uint camolootid;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        uint reticlelootid;
        // offset: 0xa0, bitSize: 0xa0(0x14 Byte(s))
        string(20) blueprintname;
        // offset: 0x140, bitSize: 0x8(0x1 Byte(s))
        uint:7 weaponvariantid;
        // offset: 0x148, bitSize: 0xa0(0x14 Byte(s)), array:0x5(hti:0xffff)
        uint stickerlootids[5];
        // offset: 0x1e8, bitSize: 0x20(0x4 Byte(s))
        uint cosmeticattachmentlootid;
        // offset: 0x208, bitSize: 0x20(0x4 Byte(s))
        int lastinteractionevent;
        // offset: 0x228, bitSize: 0x40(0x8 Byte(s))
        hashres chroma;
        // offset: 0x268, bitSize: 0x6e8(0xdd Byte(s)), array:0x11(hti:0xffff)
        AttachmentSetup attachmentsetup[17];
        // offset: 0x950, bitSize: 0x20(0x4 Byte(s))
        int lootitemid;
        // offset: 0x970, bitSize: 0x10(0x2 Byte(s))
        uint:9 weaponbuildindex;
        // offset: 0x980, bitSize: 0x1
        bool hasmodifiedblueprint;
        // offset: 0x981, bitSize: 0x1
        bool isreceiverskin;
    };

    // bitSize: 0x30, members: 4
    struct EquipmentSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint equipmentlootid;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte equipmentvariantid;
        // offset: 0x28, bitSize: 0x1
        bool extracharge;
    };

    // bitSize: 0x28, members: 2
    struct FieldUpgradeSetup {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte blueprintindex;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        uint fieldupgradelootid;
    };

    // bitSize: 0x28, members: 2
    struct KillstreakSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        uint killstreaklootid;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte blueprintindex;
    };

    // bitSize: 0x8, members: 1
    struct KillstreakSettings {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        int:2 killstreakearnmode;
    };

    // bitSize: 0x68, members: 3
    struct VehicleCustomization {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        uint:10 camo;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte horn;
        // offset: 0x18, bitSize: 0x50(0xa Byte(s)), array:0xa(hti:0xffff)
        byte tracks[10];
    };

    // bitSize: 0xa0, members: 5
    struct SelectedOperator {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int executionlootid;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int operatorlootid;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int skinlootid;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int tauntlootid;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int introlootid;
    };

    // bitSize: 0xd0, members: 7
    struct OperatorCustomization {
        // offset: 0x0, bitSize: 0x40(0x8 Byte(s))
        hashres skin;
        // offset: 0x40, bitSize: 0x18(0x3 Byte(s))
        uint:19 intro;
        // offset: 0x58, bitSize: 0x18(0x3 Byte(s))
        uint:19 taunt;
        // offset: 0x70, bitSize: 0x40(0x8 Byte(s))
        hashres chroma;
        // offset: 0xb0, bitSize: 0x18(0x3 Byte(s))
        uint:19 execution;
        // offset: 0xc8, bitSize: 0x1
        bool israndom;
    };

    // bitSize: 0x78, members: 1
    struct EmoteCustomization {
        // offset: 0x0, bitSize: 0x78(0xf Byte(s)), array:0x5(hti:0xffff)
        uint:19 emotes[5];
    };

    // bitSize: 0x140, members: 1
    struct SprayCustomization {
        // offset: 0x0, bitSize: 0x140(0x28 Byte(s)), array:0x5(hti:0xffff)
        hashres sprays[5];
    };

    // bitSize: 0x40, members: 1
    struct WonderWeaponCustomization {
        // offset: 0x0, bitSize: 0x40(0x8 Byte(s))
        hashres blueprintname;
    };

    // bitSize: 0x80, members: 2
    struct SkydiveCustomization {
        // offset: 0x0, bitSize: 0x40(0x8 Byte(s))
        hashres parachute;
        // offset: 0x40, bitSize: 0x40(0x8 Byte(s))
        hashres contrail;
    };

    // bitSize: 0x8, members: 1
    struct EquipmentCustomization {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        uint:6 variantid;
    };

    // bitSize: 0x115b8, members: 12
    struct CustomizationSetup {
        // offset: 0x0, bitSize: 0x80(0x10 Byte(s))
        SkydiveCustomization skydivecustomization;
        // offset: 0x80, bitSize: 0x78(0xf Byte(s))
        EmoteCustomization emotecustomization;
        // offset: 0xf8, bitSize: 0xf970(0x1f2e Byte(s)), array:0x133(hti:0xe)
        OperatorCustomization operatorcustomization[Operator];
        // offset: 0xfa68, bitSize: 0x20(0x4 Byte(s)), array:0x2(hti:0xffff)
        Operator operators[2];
        // offset: 0xfa88, bitSize: 0x140(0x28 Byte(s))
        SprayCustomization spraycustomization;
        // offset: 0xfbc8, bitSize: 0x240(0x48 Byte(s)), array:0x9(hti:0x18)
        WonderWeaponCustomization wonderweaponcustomization[WonderWeapon];
        // offset: 0xfe08, bitSize: 0x12b0(0x256 Byte(s)), array:0x2e(hti:0x15)
        VehicleCustomization vehiclecustomization[Vehicle];
        // offset: 0x110b8, bitSize: 0x2b8(0x57 Byte(s)), array:0x57(hti:0xb)
        EquipmentCustomization equipmentcustomization[Equipment];
        // offset: 0x11370, bitSize: 0x100(0x20 Byte(s)), array:0x8(hti:0xffff)
        int radial[8];
        // offset: 0x11470, bitSize: 0x140(0x28 Byte(s)), array:0x2(hti:0xffff)
        SelectedOperator selectedoperator[2];
        // offset: 0x115b0, bitSize: 0x1
        bool selectedoperatorindex;
    };

    // bitSize: 0xe30, members: 14
    struct CustomizationFavorites {
        // offset: 0x0, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritereticles[10];
        // offset: 0xf0, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritevehiclecamos[10];
        // offset: 0x1e0, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoriteemblems[10];
        // offset: 0x2d0, bitSize: 0x2d0(0x5a Byte(s)), array:0x1e(hti:0xffff)
        uint:22 favoriteattachments[30];
        // offset: 0x5a0, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 trackedcallingcards[10];
        // offset: 0x690, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritecharms[10];
        // offset: 0x780, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritestickers[10];
        // offset: 0x870, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritesprays[10];
        // offset: 0x960, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritegestures[10];
        // offset: 0xa50, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritevoices[10];
        // offset: 0xb40, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritecallingcards[10];
        // offset: 0xc30, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritecamos[10];
        // offset: 0xd20, bitSize: 0x20(0x4 Byte(s))
        int favoriteloadoutindex;
        // offset: 0xd40, bitSize: 0xf0(0x1e Byte(s)), array:0xa(hti:0xffff)
        uint:22 favoritewatches[10];
    };

    // bitSize: 0x30, members: 4
    struct PowerSetup {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        Power power;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        int lootitemid;
        // offset: 0x28, bitSize: 0x1
        bool extracharge;
    };

    // bitSize: 0x8, members: 1
    struct MunitionSetup {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        Munition munition;
    };

    // bitSize: 0x50, members: 10
    struct ArchetypeSetup {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        BodyCustomization body;
        // offset: 0x10, bitSize: 0x10(0x2 Byte(s))
        HeadCustomization head;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        Accessory accessory;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        Super archetypesuper;
        // offset: 0x30, bitSize: 0x10(0x2 Byte(s))
        Perk archetypeperk;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        Gesture gesture;
        // offset: 0x48, bitSize: 0x1
        TauntCustomization taunt;
        // offset: 0x49, bitSize: 0x1
        CharacterArchetype archetype;
        // offset: 0x4a, bitSize: 0x4, array:0x4(hti:0xffff)
        TauntCustomization taunts[4];
    };

    // bitSize: 0xe0, members: 2
    struct PerkPackage {
        // offset: 0x0, bitSize: 0xa0(0x14 Byte(s))
        string(20) name;
        // offset: 0xa0, bitSize: 0x40(0x8 Byte(s)), array:0x4(hti:0xffff)
        Perk perks[4];
    };

    // bitSize: 0xe0, members: 2
    struct PMCMission {
        // offset: 0x0, bitSize: 0xc0(0x18 Byte(s)), array:0x8(hti:0xffff)
        uint:17 challengeprogress[8];
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int challengeid;
    };

    // bitSize: 0x1c98, members: 1
    struct InsuredWeapons {
        // offset: 0x0, bitSize: 0x1c98(0x393 Byte(s)), array:0x3(hti:0xffff)
        WeaponSetup weaponsetups[3];
    };

    // bitSize: 0x20, members: 1
    struct AcquisitionSetup {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int lootid;
    };

    // bitSize: 0x60, members: 1
    struct InsuredAcquisitions {
        // offset: 0x0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        AcquisitionSetup acquisitionsetups[3];
    };

    // bitSize: 0x40, members: 2
    struct AugmentCustomization {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int minoraugment;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int majoraugment;
    };

    // bitSize: 0x20, members: 3
    struct MasteryInfo {
        // offset: 0x0, bitSize: 0x18(0x3 Byte(s))
        int:21 progress;
        // offset: 0x18, bitSize: 0x1
        bool isdiamond;
    };

    // bitSize: 0x140, members: 4
    struct SelectedLoadoutMastery {
        // offset: 0x0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        MasteryInfo weaponsetups[3];
        // offset: 0x60, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        MasteryInfo equipmentsetups[2];
        // offset: 0xa0, bitSize: 0x60(0xc Byte(s)), array:0x3(hti:0xffff)
        MasteryInfo killstreaksetups[3];
        // offset: 0x100, bitSize: 0x40(0x8 Byte(s)), array:0x2(hti:0xffff)
        MasteryInfo fieldupgradesetups[2];
    };

    // bitSize: 0x1eb0, members: 9
    struct LoadoutMP {
        // offset: 0x0, bitSize: 0xa0(0x14 Byte(s))
        string(20) name;
        // offset: 0xa0, bitSize: 0x1c98(0x393 Byte(s)), array:0x3(hti:0xffff)
        WeaponSetup weaponsetups[3];
        // offset: 0x1d38, bitSize: 0x60(0xc Byte(s)), array:0x2(hti:0xffff)
        EquipmentSetup equipmentsetups[2];
        // offset: 0x1d98, bitSize: 0x20(0x4 Byte(s))
        uint wildcardlootid;
        // offset: 0x1db8, bitSize: 0x80(0x10 Byte(s)), array:0x4(hti:0xffff)
        uint perklootids[4];
        // offset: 0x1e38, bitSize: 0x20(0x4 Byte(s))
        uint perkbonuslootid;
        // offset: 0x1e58, bitSize: 0x50(0xa Byte(s)), array:0x2(hti:0xffff)
        FieldUpgradeSetup fieldupgradesetups[2];
        // offset: 0x1ea8, bitSize: 0x1
        bool inuse;
    };

    // bitSize: 0x1d1c0, members: 41
    struct SquadMember {
        // offset: 0x0, bitSize: 0xa0(0x14 Byte(s))
        string(20) name;
        // offset: 0xa0, bitSize: 0x8(0x1 Byte(s))
        byte ai_loadout;
        // offset: 0xa8, bitSize: 0x920(0x124 Byte(s)), array:0x49(hti:0xc)
        int streakpreferences[Killstreak];
        // offset: 0x9c8, bitSize: 0x10(0x2 Byte(s))
        short patch;
        // offset: 0x9d8, bitSize: 0x10(0x2 Byte(s))
        Operator operatorref;
        // offset: 0x9e8, bitSize: 0x20(0x4 Byte(s))
        int lastselectedloadoutindex;
        // offset: 0xa08, bitSize: 0x28(0x5 Byte(s))
        KillstreakSetup highrollerkillstreaksetup;
        // offset: 0xa30, bitSize: 0x340(0x68 Byte(s)), array:0xd(hti:0x19)
        AugmentCustomization perkcustomization[ZMPerk];
        // offset: 0xd70, bitSize: 0x78(0xf Byte(s)), array:0x3(hti:0xffff)
        KillstreakSetup killstreaksetups[3];
        // offset: 0xde8, bitSize: 0x988(0x131 Byte(s))
        WeaponSetup freemeleesetup;
        // offset: 0x1770, bitSize: 0x18(0x3 Byte(s)), array:0x3(hti:0xffff)
        MunitionSetup munitionsetups[3];
        // offset: 0x1788, bitSize: 0x17040(0x2e08 Byte(s)), array:0xc(hti:0xffff)
        LoadoutMP loadouts[12];
        // offset: 0x187c8, bitSize: 0x16c0(0x2d8 Byte(s)), array:0x5b(hti:0x14)
        AugmentCustomization supercustomization[Super];
        // offset: 0x19e88, bitSize: 0x40(0x8 Byte(s))
        hashres skinref;
        // offset: 0x19ec8, bitSize: 0x8(0x1 Byte(s))
        Accessory accessory;
        // offset: 0x19ed0, bitSize: 0x10(0x2 Byte(s))
        short armorplate;
        // offset: 0x19ee0, bitSize: 0x20(0x4 Byte(s))
        int player_xp;
        // offset: 0x19f00, bitSize: 0x20(0x4 Byte(s))
        int commendationsearned;
        // offset: 0x19f20, bitSize: 0x200(0x40 Byte(s)), array:0x8(hti:0x1)
        AugmentCustomization ammomodcustomization[AmmoMod];
        // offset: 0x1a120, bitSize: 0x10(0x2 Byte(s))
        short background;
        // offset: 0x1a130, bitSize: 0x18(0x3 Byte(s)), array:0x3(hti:0xffff)
        MunitionSetup munitionwavemodesetups[3];
        // offset: 0x1a148, bitSize: 0x8(0x1 Byte(s))
        CPSuper cpfieldupgrade;
        // offset: 0x1a150, bitSize: 0x20(0x4 Byte(s))
        int cploadoutsel;
        // offset: 0x1a170, bitSize: 0xda0(0x1b4 Byte(s)), array:0x6d(hti:0x16)
        int weapon_xp[CerWeapons];
        // offset: 0x1af10, bitSize: 0x8(0x1 Byte(s))
        Super archetypesuper;
        // offset: 0x1af18, bitSize: 0x1eb0(0x3d6 Byte(s))
        LoadoutMP loadoutwavemode;
        // offset: 0x1cdc8, bitSize: 0x20(0x4 Byte(s))
        int season_rank;
        // offset: 0x1cde8, bitSize: 0x140(0x28 Byte(s))
        SelectedLoadoutMastery selectedloadoutmastery;
        // offset: 0x1cf28, bitSize: 0x20(0x4 Byte(s))
        int currencywavemode;
        // offset: 0x1cf48, bitSize: 0x230(0x46 Byte(s)), array:0x7(hti:0xffff)
        ArchetypeSetup archetypepreferences[7];
        // offset: 0x1d178, bitSize: 0x10(0x2 Byte(s))
        short scriptmover;
        // offset: 0x1d188, bitSize: 0x10(0x2 Byte(s))
        short patchbacking;
        // offset: 0x1d198, bitSize: 0x10(0x2 Byte(s))
        Perk archetypeperk;
        // offset: 0x1d1a8, bitSize: 0x8(0x1 Byte(s))
        Gesture gesture;
        // offset: 0x1d1b0, bitSize: 0x1
        bool inuse;
        // offset: 0x1d1b1, bitSize: 0x1
        TauntCustomization taunt;
        // offset: 0x1d1b2, bitSize: 0x1
        bool defaultset;
        // offset: 0x1d1b3, bitSize: 0x1
        bool scorestreak;
        // offset: 0x1d1b4, bitSize: 0x1
        CharacterArchetype archetype;
        // offset: 0x1d1b5, bitSize: 0x4, array:0x4(hti:0xffff)
        TauntCustomization taunts[4];
    };

    // bitSize: 0x60, members: 3
    struct StatLimits {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int kills;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int rankxp;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int headshots;
    };

    // bitSize: 0x20, members: 1
    struct ActionParkData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_48ca56e16f0a0597;
    };

    // bitSize: 0x3c0, members: 8
    struct AonData {
        // offset: 0x0, bitSize: 0xd0(0x1a Byte(s))
        string(26) perkref1;
        // offset: 0xd0, bitSize: 0xd0(0x1a Byte(s))
        string(26) perkref2;
        // offset: 0x1a0, bitSize: 0xd0(0x1a Byte(s))
        string(26) perkref3;
        // offset: 0x270, bitSize: 0xd0(0x1a Byte(s))
        string(26) perkref4;
        // offset: 0x340, bitSize: 0x20(0x4 Byte(s))
        int perkkills1;
        // offset: 0x360, bitSize: 0x20(0x4 Byte(s))
        int perkkills2;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        int perkkills3;
        // offset: 0x3a0, bitSize: 0x20(0x4 Byte(s))
        int perkkills4;
    };

    // bitSize: 0x88, members: 5
    struct AssaultData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float bombresettimer;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float defusetime;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float planttime;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float roundlength;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        byte bombtimer;
    };

    // bitSize: 0x30, members: 3
    struct BlitzData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float returntime;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte winrule;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte capturecondition;
    };

    // bitSize: 0x50, members: 10
    struct BombData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float defusetime;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float planttime;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte bombtimer;
        // offset: 0x48, bitSize: 0x1
        bool defenderscanseedroppedbomb;
        // offset: 0x49, bitSize: 0x1
        bool silentplant;
        // offset: 0x4a, bitSize: 0x1
        bool defenderscanseeplantedbomb;
        // offset: 0x4b, bitSize: 0x1
        bool resetprogress;
        // offset: 0x4c, bitSize: 0x1
        bool assignbombzonechevrons;
        // offset: 0x4d, bitSize: 0x1
        bool multibomb;
    };

    // bitSize: 0x40, members: 2
    struct BountyData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hvtsperteam;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int pointsperhvtkill;
    };

    // bitSize: 0x48, members: 5
    struct BtmData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short jugghealth;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte ppkasjugg;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        float juggswitchtime;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        byte ppkjuggonjugg;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte ppkonjugg;
    };

    // bitSize: 0x10, members: 3
    struct CaptureData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte capturetype;
        // offset: 0x8, bitSize: 0x1
        bool capturedecay;
    };

    // bitSize: 0x78, members: 7
    struct CarryData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float possessionresettime;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte possessionresetcondition;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        float pickuptime;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte showenemycarrier;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float idleresettime;
        // offset: 0x70, bitSize: 0x1
        bool manualdropenabled;
    };

    // bitSize: 0x130, members: 11
    struct CMDData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float capturedurationcenter;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float activationdelaybase;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float activationdelayhalf;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float activationdelaycenter;
        // offset: 0x80, bitSize: 0x8(0x1 Byte(s))
        byte juggspawnbehavior;
        // offset: 0x88, bitSize: 0x8(0x1 Byte(s))
        byte cmdrules;
        // offset: 0x90, bitSize: 0x20(0x4 Byte(s))
        float holddurationbase;
        // offset: 0xb0, bitSize: 0x20(0x4 Byte(s))
        float holddurationhalf;
        // offset: 0xd0, bitSize: 0x20(0x4 Byte(s))
        float holddurationcenter;
        // offset: 0xf0, bitSize: 0x20(0x4 Byte(s))
        float capturedurationbase;
        // offset: 0x110, bitSize: 0x20(0x4 Byte(s))
        float capturedurationhalf;
    };

    // bitSize: 0x18, members: 4
    struct ConfData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte pointsperdeny;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte pointsperconfirm;
        // offset: 0x10, bitSize: 0x1
        bool killstreakconfirmed;
    };

    // bitSize: 0x60, members: 9
    struct ControlData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte overtimedefenders;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        float captureextratime;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte numteamlives;
        // offset: 0x30, bitSize: 0x20(0x4 Byte(s))
        float segmentcaptureextratime;
        // offset: 0x50, bitSize: 0x8(0x1 Byte(s))
        byte numcapturesegments;
        // offset: 0x58, bitSize: 0x1
        bool usesegments;
        // offset: 0x59, bitSize: 0x1
        bool disablemajoritycapprogress;
        // offset: 0x5a, bitSize: 0x1
        bool suicideteamkilllowerslives;
    };

    // bitSize: 0x30, members: 3
    struct CTFData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float returntime;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte winrule;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte capturecondition;
    };

    // bitSize: 0x38, members: 5
    struct CyberData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte empspawn;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte detonatescore;
        // offset: 0x10, bitSize: 0x20(0x4 Byte(s))
        float radarpingtime;
        // offset: 0x30, bitSize: 0x1
        bool persbombtimer;
    };

    // bitSize: 0x40, members: 2
    struct DemData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float overtimelimit;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float extratime;
    };

    // bitSize: 0x18, members: 5
    struct DmData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte aonrules;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte showtargettime;
        // offset: 0x10, bitSize: 0x1
        bool targetplayercycle;
        // offset: 0x11, bitSize: 0x1
        bool scoreontargetplayer;
    };

    // bitSize: 0x120, members: 18
    struct DomData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float flagcapturetimemin;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte flagreinforcement;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte flagsrequiredtoscore;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        byte usestrongholdscoring;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        byte flagneutralization;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte strongholdscoreincrement;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte strongholdscoreallcapincrement;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float flagdecaytime;
        // offset: 0x70, bitSize: 0x20(0x4 Byte(s))
        float objscalar;
        // offset: 0x90, bitSize: 0x8(0x1 Byte(s))
        byte shufflehillroundcount;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        byte flagblockcapdisabled;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float strongholdscoreinterval;
        // offset: 0xc0, bitSize: 0x8(0x1 Byte(s))
        byte pointsperflag;
        // offset: 0xc8, bitSize: 0x8(0x1 Byte(s))
        byte pointsperreinforcedflag;
        // offset: 0xd0, bitSize: 0x20(0x4 Byte(s))
        float reinforcementstompscalar;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        byte numflagsscoreonkill;
        // offset: 0xf8, bitSize: 0x20(0x4 Byte(s))
        float flagcapturetime;
        // offset: 0x118, bitSize: 0x8(0x1 Byte(s))
        byte flagmodelhidden;
    };

    // bitSize: 0x28, members: 3
    struct EscData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float escapetimer;
        // offset: 0x20, bitSize: 0x1
        bool capzone;
    };

    // bitSize: 0xa0, members: 5
    struct EscortHordeData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float robotmovecheckpointscalar;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float robotmoveotscalar;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float robotcapturetime;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int robotcaptureradius;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float robotmovespeed;
    };

    // bitSize: 0xa8, members: 7
    struct FortressData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int numriotshieldhero;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int numriotshieldmedium;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int numriotshieldheroepic;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int numriotshieldlarge;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int numriotshieldsmall;
        // offset: 0xa0, bitSize: 0x1
        bool spawntraps;
    };

    // bitSize: 0xc0, members: 6
    struct FrontData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int midfieldscore;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float bountytimer;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int friendlybasescore;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int enemybasescore;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float bountybonusscore;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float enemybasekillreveal;
    };

    // bitSize: 0x1, members: 1
    struct GameObjectRules {
        // offset: 0x0, bitSize: 0x1
        bool enablerefactor;
    };

    // bitSize: 0xa8, members: 10
    struct GrindData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int megabankbonus;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte megabanklimit;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        float bankcapturetime;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte bankdisabletags;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float bankdisabletime;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        byte bankrate;
        // offset: 0x78, bitSize: 0x20(0x4 Byte(s))
        float banktime;
        // offset: 0x98, bitSize: 0x8(0x1 Byte(s))
        byte megabankbonusks;
        // offset: 0xa0, bitSize: 0x1
        bool bankdisable;
    };

    // bitSize: 0x28, members: 3
    struct GrndData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float droptime;
        // offset: 0x20, bitSize: 0x1
        bool enablevariantdz;
    };

    // bitSize: 0x120, members: 9
    struct HijackData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_1b44b3444d4b8ede;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float hash_e02ab6daa7330936;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float hash_c36116c6259be633;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int detonatescore;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hash_a8c514c1917ba595;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float hash_be33d17543931dec;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float hash_77bc7df6d83c0df7;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_e6789a80aead4f14;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float bombtimer;
    };

    // bitSize: 0xc8, members: 12
    struct HQData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float zoneselectiondelay;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float firstzoneactivationdelay;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float zonetimeout;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float zonecapturetime;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float zonelifetime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float zoneactivationdelay;
        // offset: 0xc0, bitSize: 0x1
        bool delayplayer;
        // offset: 0xc1, bitSize: 0x1
        bool pausetime;
        // offset: 0xc2, bitSize: 0x1
        bool combinezones;
        // offset: 0xc3, bitSize: 0x1
        bool additivescoring;
        // offset: 0xc4, bitSize: 0x1
        bool randomlocationorder;
    };

    // bitSize: 0x78, members: 7
    struct HstgData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float hstgfreetime;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte hstgspawnlocation;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        float hstgcapturetime;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte numhostages;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        int hstghealth;
        // offset: 0x70, bitSize: 0x1
        bool hstgallowkill;
    };

    // bitSize: 0x8, members: 8
    struct JLData {
        // offset: 0x0, bitSize: 0x1
        bool enablethrowingstars;
        // offset: 0x1, bitSize: 0x1
        bool enablethermite;
        // offset: 0x2, bitSize: 0x1
        bool enablethrowingknives;
        // offset: 0x3, bitSize: 0x1
        bool enablemolotov;
        // offset: 0x4, bitSize: 0x1
        bool enablesemtex;
        // offset: 0x5, bitSize: 0x1
        bool enablefrags;
        // offset: 0x6, bitSize: 0x1
        bool enabledrillcharges;
    };

    // bitSize: 0x68, members: 5
    struct KOData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float flagactivationdelay;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float flagholdtimer;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float flagforcetimer;
        // offset: 0x60, bitSize: 0x1
        bool flagholdreward;
    };

    // bitSize: 0x20, members: 1
    struct LandgrabData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float capturelocktime;
    };

    // bitSize: 0x10, members: 1
    struct MtdmData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short numteams;
    };

    // bitSize: 0x30, members: 3
    struct MuggerData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte jackpotlimit;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        float throwknifefrac;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte banklimit;
    };

    // bitSize: 0x70, members: 5
    struct PillData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int megabankbonus;
        // offset: 0x20, bitSize: 0x8(0x1 Byte(s))
        byte megabanklimit;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        float bankcapturetime;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte bankrate;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float banktime;
    };

    // bitSize: 0xa0, members: 6
    struct RugbyData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short helpermax;
        // offset: 0x10, bitSize: 0x10(0x2 Byte(s))
        short jugghealth;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float juggtimeout;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float juggspeed;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float juggteamspeed;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float juggcapturetime;
    };

    // bitSize: 0x60, members: 3
    struct RushData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float captureduration;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float activationdelay;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float extratimebonus;
    };

    // bitSize: 0x50, members: 5
    struct SabData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float defusetime;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float planttime;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte bombtimer;
        // offset: 0x48, bitSize: 0x1
        bool sharedbombtimer;
    };

    // bitSize: 0x28, members: 3
    struct SdData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float postroundextratimer;
        // offset: 0x20, bitSize: 0x1
        bool roundstartreadyup;
    };

    // bitSize: 0x88, members: 8
    struct SiegeData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float holdalltimer;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float caprate;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float objscalar;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float rushtimeramount;
        // offset: 0x80, bitSize: 0x1
        bool sharedrushtimer;
        // offset: 0x81, bitSize: 0x1
        bool precappoints;
        // offset: 0x82, bitSize: 0x1
        bool rushtimer;
    };

    // bitSize: 0x80, members: 9
    struct SnatchData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte goaltype;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        float goalmovetimer;
        // offset: 0x28, bitSize: 0x20(0x4 Byte(s))
        float cratedroptimer;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        float goalenabletimer;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        byte numendgame;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        byte brloadouts;
        // offset: 0x78, bitSize: 0x1
        bool goalprotection;
        // offset: 0x79, bitSize: 0x1
        bool radarendgame;
    };

    // bitSize: 0x30, members: 3
    struct SotfData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short crategunamount;
        // offset: 0x10, bitSize: 0x10(0x2 Byte(s))
        short cratedroptimer;
        // offset: 0x20, bitSize: 0x10(0x2 Byte(s))
        short crateamount;
    };

    // bitSize: 0x60, members: 3
    struct SotfFFAData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int crategunamount;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int cratedroptimer;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int crateamount;
    };

    // bitSize: 0xd0, members: 12
    struct TDefData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte ppkteamnoflag;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte scorepertick;
        // offset: 0x10, bitSize: 0x20(0x4 Byte(s))
        float flagactivationdelay;
        // offset: 0x30, bitSize: 0x8(0x1 Byte(s))
        byte carrierbonusscore;
        // offset: 0x38, bitSize: 0x20(0x4 Byte(s))
        float spawndelay;
        // offset: 0x58, bitSize: 0x20(0x4 Byte(s))
        float scoringtime;
        // offset: 0x78, bitSize: 0x20(0x4 Byte(s))
        float flagresetactivationdelay;
        // offset: 0x98, bitSize: 0x20(0x4 Byte(s))
        float carrierbonustime;
        // offset: 0xb8, bitSize: 0x8(0x1 Byte(s))
        byte ppkteamwithflag;
        // offset: 0xc0, bitSize: 0x8(0x1 Byte(s))
        byte ppkflagcarrier;
        // offset: 0xc8, bitSize: 0x1
        bool delayplayer;
    };

    // bitSize: 0x48, members: 5
    struct TjuggData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short jugghealth;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte ppkasjugg;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        float juggswitchtime;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        byte ppkjuggonjugg;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte ppkonjugg;
    };

    // bitSize: 0x160, members: 11
    struct GoldData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float neutralpiletimelimit;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int goldbarsheavyweightminvalue;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int enemyscoretoshowwinningsplash;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float enemycapturetime;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int goldbarslightweightminvalue;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float neutralpilechangetimer;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int neutralpilecount;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        float timerbeforesamesplashappears;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int maxplayermoney;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        float neutralcapturetime;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        float teampiledroptime;
    };

    // bitSize: 0x1a0, members: 13
    struct SugarData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float movementspeedbuff;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float deposittimer;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float healthregendelaybuff;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float slidedivemovementbuff;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int cookieseaten4thirdbuff;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int maxstealablecookies;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float tableactivetimer;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int cookieseaten4firstbuff;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float eattimer;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int maxpoints;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int cookieseaten4secondbuff;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        float lootingtimer;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float nextactivetabletimer;
    };

    // bitSize: 0x438, members: 44
    struct WMData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float hackrestoretime;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float tankspeed;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float destroytimelimit;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float bombtimelimit;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float hackusetime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float sdvehiclespeed;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float neutralpiletimelimit;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        float destroyplanttimelimit;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float defendersrespawndelay;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int goldbarsheavyweightminvalue;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int enemyscoretoshowwinningsplash;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int tankmaxhealth;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float escortwheelsontimelimit;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int goldbarslightweightminvalue;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        float neutralpilechangetimer;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int neutralpilecount;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        float attackersrespawndelay;
        // offset: 0x220, bitSize: 0x8(0x1 Byte(s))
        byte respawntype;
        // offset: 0x228, bitSize: 0x20(0x4 Byte(s))
        float hackbombtimelimit;
        // offset: 0x248, bitSize: 0x20(0x4 Byte(s))
        float aibosstimelimit;
        // offset: 0x268, bitSize: 0x20(0x4 Byte(s))
        float captureflagzonetime;
        // offset: 0x288, bitSize: 0x20(0x4 Byte(s))
        float lfescorttimelimit;
        // offset: 0x2a8, bitSize: 0x20(0x4 Byte(s))
        float timerbeforesamesplashappears;
        // offset: 0x2c8, bitSize: 0x20(0x4 Byte(s))
        float lfflagcapturetime;
        // offset: 0x2e8, bitSize: 0x20(0x4 Byte(s))
        float teampiledroptime;
        // offset: 0x308, bitSize: 0x20(0x4 Byte(s))
        float hackuploadtime;
        // offset: 0x328, bitSize: 0x20(0x4 Byte(s))
        float hostagetimelimit;
        // offset: 0x348, bitSize: 0x20(0x4 Byte(s))
        float zonetimelimit;
        // offset: 0x368, bitSize: 0x20(0x4 Byte(s))
        float captureflagtimelimit;
        // offset: 0x388, bitSize: 0x20(0x4 Byte(s))
        float sdhackuploadtime;
        // offset: 0x3a8, bitSize: 0x20(0x4 Byte(s))
        float escorttimelimit;
        // offset: 0x3c8, bitSize: 0x20(0x4 Byte(s))
        float escortcapturetime;
        // offset: 0x3e8, bitSize: 0x20(0x4 Byte(s))
        float hacktimelimit;
        // offset: 0x408, bitSize: 0x20(0x4 Byte(s))
        float aibosszonetimelimit;
        // offset: 0x428, bitSize: 0x1
        bool buildableenabled;
        // offset: 0x429, bitSize: 0x1
        bool tankrepair;
        // offset: 0x42a, bitSize: 0x1
        bool rpgagentsenabled;
        // offset: 0x42b, bitSize: 0x1
        bool tankcontestable;
        // offset: 0x42c, bitSize: 0x1
        bool zonereversible;
        // offset: 0x42d, bitSize: 0x1
        bool tankreversible;
        // offset: 0x42e, bitSize: 0x1
        bool stopwatchenabled;
        // offset: 0x42f, bitSize: 0x1
        bool tankturretusable;
        // offset: 0x430, bitSize: 0x1
        bool iedbombenabled;
    };

    // bitSize: 0x1e0, members: 15
    struct MomentumMeterData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int combomomentumbaseactionpoints;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float momentummultiplier_0;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float momentummultiplier_1;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float momentummultiplier_2;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float momentummultiplier_3;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int momentumlevel_1;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int momentumlevel_2;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int momentumlevel_3;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int momentumlevel_4;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int combomomentumpointcap;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        float momentumdecaymultiplier_0;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        float momentumdecaymultiplier_1;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float momentumdecaymultiplier_2;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        float momentumdecaymultiplier_3;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        float combomomentumdecaybasevalue;
    };

    // bitSize: 0x970, members: 31
    struct ArenaData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte arenaloadouts;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte arenaattachments;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        byte blastshieldmod;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        float flagactivationdelay;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        byte prematchloadoutpreviewseconds;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte objmodifier;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        float hash_8feee0ed72bdfeb6;
        // offset: 0x68, bitSize: 0xd0(0x1a Byte(s))
        string(26) startweapon;
        // offset: 0x138, bitSize: 0x20(0x4 Byte(s))
        float tacticaltimemod;
        // offset: 0x158, bitSize: 0x20(0x4 Byte(s))
        float flagholdtimer;
        // offset: 0x178, bitSize: 0x8(0x1 Byte(s))
        byte blastshieldclamp;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float hash_80d29119e42069f0;
        // offset: 0x1a0, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_30ddf171c292e931;
        // offset: 0x270, bitSize: 0x8(0x1 Byte(s))
        byte wincondition;
        // offset: 0x278, bitSize: 0x20(0x4 Byte(s))
        float overtimeflag;
        // offset: 0x298, bitSize: 0x8(0x1 Byte(s))
        byte loadoutchangeround;
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        int hash_1b2a29ae8fe3a9d1;
        // offset: 0x2c0, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier1;
        // offset: 0x390, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier2;
        // offset: 0x460, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier3;
        // offset: 0x530, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier4;
        // offset: 0x600, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier5;
        // offset: 0x6d0, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier6;
        // offset: 0x7a0, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier7;
        // offset: 0x870, bitSize: 0xd0(0x1a Byte(s))
        string(26) weapontier8;
        // offset: 0x940, bitSize: 0x8(0x1 Byte(s))
        Super arenasuper;
        // offset: 0x948, bitSize: 0x20(0x4 Byte(s))
        float flagcapturetime;
        // offset: 0x968, bitSize: 0x1
        bool switchspawns;
        // offset: 0x969, bitSize: 0x1
        bool hash_ab00c8395b4cb2af;
        // offset: 0x96a, bitSize: 0x1
        bool hash_6b492be136043d2f;
    };

    // bitSize: 0x1b58, members: 89
    struct BrData {
        // offset: 0x0, bitSize: 0x180(0x30 Byte(s))
        string(48) exfil;
        // offset: 0x180, bitSize: 0x180(0x30 Byte(s))
        string(48) infil;
        // offset: 0x300, bitSize: 0xd0(0x1a Byte(s))
        string(26) loadoutoption;
        // offset: 0x3d0, bitSize: 0x20(0x4 Byte(s))
        float hash_3f4dac8dcd2475ca;
        // offset: 0x3f0, bitSize: 0x20(0x4 Byte(s))
        int hash_5fdced0d3cdbd843;
        // offset: 0x410, bitSize: 0x20(0x4 Byte(s))
        float resurgencepointstosecondkioskbuyratio;
        // offset: 0x430, bitSize: 0x8(0x1 Byte(s))
        GiveFavoriteLoadoutOption givefavoriteloadout;
        // offset: 0x438, bitSize: 0x180(0x30 Byte(s))
        string(48) brmissionrewardtable;
        // offset: 0x5b8, bitSize: 0x8(0x1 Byte(s))
        byte prematchstarttimer;
        // offset: 0x5c0, bitSize: 0x20(0x4 Byte(s))
        int plunderbotstartamount;
        // offset: 0x5e0, bitSize: 0x20(0x4 Byte(s))
        int numcirclesfollowtrain;
        // offset: 0x600, bitSize: 0x20(0x4 Byte(s))
        float plunderdropshare;
        // offset: 0x620, bitSize: 0x20(0x4 Byte(s))
        int resurgencepointstofirstsecondoffset;
        // offset: 0x640, bitSize: 0x20(0x4 Byte(s))
        float hash_575cd1c096f4eda8;
        // offset: 0x660, bitSize: 0x20(0x4 Byte(s))
        float hash_5b61f0d486da1957;
        // offset: 0x680, bitSize: 0x20(0x4 Byte(s))
        float circletimescale;
        // offset: 0x6a0, bitSize: 0x8(0x1 Byte(s))
        byte resurgencevengeancedecreaserespawndelay;
        // offset: 0x6a8, bitSize: 0x20(0x4 Byte(s))
        float hash_d8d9176c32ce50f5;
        // offset: 0x6c8, bitSize: 0x180(0x30 Byte(s))
        string(48) gulageventlist;
        // offset: 0x848, bitSize: 0x180(0x30 Byte(s))
        string(48) gunroyaleweaponslist;
        // offset: 0x9c8, bitSize: 0x20(0x4 Byte(s))
        int plunderstartamount;
        // offset: 0x9e8, bitSize: 0x20(0x4 Byte(s))
        float resurgencepointstosecondratio;
        // offset: 0xa08, bitSize: 0x20(0x4 Byte(s))
        float hash_db3bf94a974a5ec1;
        // offset: 0xa28, bitSize: 0x20(0x4 Byte(s))
        float hash_ef3c379d70a16694;
        // offset: 0xa48, bitSize: 0x20(0x4 Byte(s))
        float plundersaveshare;
        // offset: 0xa68, bitSize: 0x20(0x4 Byte(s))
        float hash_a7772cec69b526ed;
        // offset: 0xa88, bitSize: 0x20(0x4 Byte(s))
        int plunderresurgencelowerbound;
        // offset: 0xaa8, bitSize: 0x180(0x30 Byte(s))
        string(48) percircletrainspeeds;
        // offset: 0xc28, bitSize: 0x20(0x4 Byte(s))
        int numcirclesattrain;
        // offset: 0xc48, bitSize: 0x180(0x30 Byte(s))
        string(48) gulagnamedarenalist;
        // offset: 0xdc8, bitSize: 0x180(0x30 Byte(s))
        string(48) circletrainradiusoverrides;
        // offset: 0xf48, bitSize: 0x20(0x4 Byte(s))
        float plundertaxshare;
        // offset: 0xf68, bitSize: 0x20(0x4 Byte(s))
        float circletrainacceleration;
        // offset: 0xf88, bitSize: 0x20(0x4 Byte(s))
        float hash_8802fff47d13c91a;
        // offset: 0xfa8, bitSize: 0x20(0x4 Byte(s))
        float plunderinflation;
        // offset: 0xfc8, bitSize: 0x200(0x40 Byte(s))
        string(64) firesalefreeitems;
        // offset: 0x11c8, bitSize: 0x20(0x4 Byte(s))
        int hash_450f15af6675fa88;
        // offset: 0x11e8, bitSize: 0x20(0x4 Byte(s))
        float hash_fe3d94ed268a48ea;
        // offset: 0x1208, bitSize: 0x20(0x4 Byte(s))
        float cratedroptimer;
        // offset: 0x1228, bitSize: 0x20(0x4 Byte(s))
        int hash_bdda4cd203263ed4;
        // offset: 0x1248, bitSize: 0x8(0x1 Byte(s))
        byte gulagcircledisable;
        // offset: 0x1250, bitSize: 0x180(0x30 Byte(s))
        string(48) brmissionrewardgroupstable;
        // offset: 0x13d0, bitSize: 0x8(0x1 Byte(s))
        byte circledamagemultiplier;
        // offset: 0x13d8, bitSize: 0x20(0x4 Byte(s))
        int circlestartsize;
        // offset: 0x13f8, bitSize: 0x180(0x30 Byte(s))
        string(48) gunroyaleweaponsseries;
        // offset: 0x1578, bitSize: 0x20(0x4 Byte(s))
        int startingweapon;
        // offset: 0x1598, bitSize: 0x180(0x30 Byte(s))
        string(48) svdata;
        // offset: 0x1718, bitSize: 0xd0(0x1a Byte(s))
        string(26) plundermodeltype;
        // offset: 0x17e8, bitSize: 0x20(0x4 Byte(s))
        int stopcircleindex;
        // offset: 0x1808, bitSize: 0x180(0x30 Byte(s))
        string(48) respawnloadouttable;
        // offset: 0x1988, bitSize: 0x20(0x4 Byte(s))
        int plunderdropsomeamount;
        // offset: 0x19a8, bitSize: 0x180(0x30 Byte(s))
        string(48) percircleclosetrainspeedoverrides;
        // offset: 0x1b28, bitSize: 0x8(0x1 Byte(s))
        byte brloadouts;
        // offset: 0x1b30, bitSize: 0x1
        bool resurgenceusevengeance;
        // offset: 0x1b31, bitSize: 0x1
        bool gulag;
        // offset: 0x1b32, bitSize: 0x1
        bool includeeliminatedplayersinplayercount;
        // offset: 0x1b33, bitSize: 0x1
        bool disableautolootpickup;
        // offset: 0x1b34, bitSize: 0x1
        bool hash_f9a1c6808a4333d7;
        // offset: 0x1b35, bitSize: 0x1
        bool infilc130;
        // offset: 0x1b36, bitSize: 0x1
        bool infilheli;
        // offset: 0x1b37, bitSize: 0x1
        bool hash_489eb790983dbf34;
        // offset: 0x1b38, bitSize: 0x1
        bool scavengergivearmor;
        // offset: 0x1b39, bitSize: 0x1
        bool uselootablecorpse;
        // offset: 0x1b3a, bitSize: 0x1
        bool hash_aefcfa74f6f3382d;
        // offset: 0x1b3b, bitSize: 0x1
        bool showperkpackagehud;
        // offset: 0x1b3c, bitSize: 0x1
        bool hash_360121366deec212;
        // offset: 0x1b3d, bitSize: 0x1
        bool svenabled;
        // offset: 0x1b3e, bitSize: 0x1
        bool infilconvoy;
        // offset: 0x1b3f, bitSize: 0x1
        bool hash_c05bfaa09fccba7d;
        // offset: 0x1b40, bitSize: 0x1
        bool hash_667407e745d67b8e;
        // offset: 0x1b41, bitSize: 0x1
        bool resurgenceusepointstoreducerespawntime;
        // offset: 0x1b42, bitSize: 0x1
        bool gondolaenabled;
        // offset: 0x1b43, bitSize: 0x1
        bool hash_5034fb7ac08d9304;
        // offset: 0x1b44, bitSize: 0x1
        bool resurgenceusevengeancedecreaserespawntimer;
        // offset: 0x1b45, bitSize: 0x1
        bool hash_9471a5229362381c;
        // offset: 0x1b46, bitSize: 0x1
        bool hash_2d0d830020b2d671;
        // offset: 0x1b47, bitSize: 0x1
        bool plunderlobby;
        // offset: 0x1b48, bitSize: 0x1
        bool plundersites;
        // offset: 0x1b49, bitSize: 0x1
        bool resurgencevengeanceuseanykill;
        // offset: 0x1b4a, bitSize: 0x1
        bool hash_daa07b0dd56d68bb;
        // offset: 0x1b4b, bitSize: 0x1
        bool hash_da7cf5d5214f3587;
        // offset: 0x1b4c, bitSize: 0x1
        bool trainenabled;
        // offset: 0x1b4d, bitSize: 0x1
        bool allowloadout;
        // offset: 0x1b4e, bitSize: 0x1
        bool hash_94aa534472336520;
        // offset: 0x1b4f, bitSize: 0x1
        bool plunder;
        // offset: 0x1b50, bitSize: 0x1
        bool traincontrolsenabled;
        // offset: 0x1b51, bitSize: 0x1
        bool gametypeintroductionsplash;
        // offset: 0x1b52, bitSize: 0x1
        bool allowloadoutprelobbyonly;
    };

    // bitSize: 0x60, members: 3
    struct CollectibleData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_58453adfb6683830;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int hash_8f2a6d1d9a9a64d9;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float hash_5dc437138c5ff5c0;
    };

    // bitSize: 0xc0, members: 6
    struct EscortData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float robotmovecheckpointscalar;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float robotmoveotscalar;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float robotcapturetime;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float hash_daca0a67dcf96d73;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int robotcaptureradius;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float robotmovespeed;
    };

    // bitSize: 0x6a8, members: 7
    struct HelmetData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int durability;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int damageclamp;
        // offset: 0x40, bitSize: 0x320(0x64 Byte(s))
        string(100) excludedmeansofdeath;
        // offset: 0x360, bitSize: 0x20(0x4 Byte(s))
        int damagethreshold;
        // offset: 0x380, bitSize: 0x320(0x64 Byte(s))
        string(100) excludedweaponclasses;
        // offset: 0x6a0, bitSize: 0x1
        bool enabled;
    };

    // bitSize: 0x68, members: 8
    struct HVTData {
        // offset: 0x0, bitSize: 0x10(0x2 Byte(s))
        short hvtpointsperkillashvt;
        // offset: 0x10, bitSize: 0x10(0x2 Byte(s))
        short hvtmaxtargets;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float hvtactivationdelay;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        byte hvtspawnarmor;
        // offset: 0x48, bitSize: 0x8(0x1 Byte(s))
        byte hvtspawnarmorplates;
        // offset: 0x50, bitSize: 0x10(0x2 Byte(s))
        short hvtcapturevalue;
        // offset: 0x60, bitSize: 0x1
        bool hvtallowarmor;
    };

    // bitSize: 0xe8, members: 15
    struct KOTHData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float spawndelay;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float firstzoneactivationdelay;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float hash_f798daefd409cb19;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        float zonecapturetime;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float nextzonerevealtime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float zonelifetime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float zoneactivationdelay;
        // offset: 0xe0, bitSize: 0x1
        bool pausetime;
        // offset: 0xe1, bitSize: 0x1
        bool hash_5ffea0ef93cc7c65;
        // offset: 0xe2, bitSize: 0x1
        bool additivescoring;
        // offset: 0xe3, bitSize: 0x1
        bool hash_43879080049a7279;
        // offset: 0xe4, bitSize: 0x1
        bool disableovertime;
        // offset: 0xe5, bitSize: 0x1
        bool randomlocationorder;
        // offset: 0xe6, bitSize: 0x1
        bool zonemajoritycapture;
    };

    // bitSize: 0x8, members: 8
    struct ZmData {
        // offset: 0x0, bitSize: 0x1
        bool autosaveonclientdisconnectenabled;
        // offset: 0x1, bitSize: 0x1
        bool papquest;
        // offset: 0x2, bitSize: 0x1
        bool wwquest;
        // offset: 0x3, bitSize: 0x1
        bool sidecontentenabled;
        // offset: 0x4, bitSize: 0x1
        bool autosaveenabled;
        // offset: 0x5, bitSize: 0x1
        bool hash_44979868e1fbdd84;
        // offset: 0x6, bitSize: 0x1
        bool disablebgb;
        // offset: 0x7, bitSize: 0x1
        bool hash_cc44efab7d5ea16f;
    };

    // bitSize: 0x2e8, members: 29
    struct PaybackData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_d24d99fc8e38e23a;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int hash_3227267d09e7325b;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_7b128706edd21aad;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_ab2091f59112868f;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float stealtime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int hash_bb013dbfe72f342a;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int hash_748994b1869733e9;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_b9131a514de4cb92;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int hash_e5b705656e1d0728;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        float hash_8889b03737a96d3;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int hash_8f2b584786f6741c;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        float hash_e7d871d476f8ba4c;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float banktime;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int hash_cbaa20bcb7426942;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        float hash_bd9bff3123197073;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int hash_37346ebab9485d4f;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        int hash_260d8fca2d31229d;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        float hash_158369c7848ca0c0;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int hash_97414f170b93c42a;
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int hash_3227c70ba1d4404f;
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int hash_8a8ad876a1082dda;
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        int hash_4556d6b26f55b395;
        // offset: 0x2c0, bitSize: 0x20(0x4 Byte(s))
        float hash_2256c587012481aa;
        // offset: 0x2e0, bitSize: 0x1
        bool hash_c17ae718d76cefdd;
        // offset: 0x2e1, bitSize: 0x1
        bool hash_be68e8b8ec9a0e94;
        // offset: 0x2e2, bitSize: 0x1
        bool hash_3cc56a017242d21d;
        // offset: 0x2e3, bitSize: 0x1
        bool hash_d6b3b5f9bac50278;
        // offset: 0x2e4, bitSize: 0x1
        bool hash_7defe82505135d15;
    };

    // bitSize: 0x5038, members: 315
    struct CommonOptions {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte thirdperson;
        // offset: 0x8, bitSize: 0x20(0x4 Byte(s))
        int infilstartdelay;
        // offset: 0x28, bitSize: 0x8(0x1 Byte(s))
        byte nameplatesetting;
        // offset: 0x30, bitSize: 0x20(0x4 Byte(s))
        float timelimit;
        // offset: 0x50, bitSize: 0x20(0x4 Byte(s))
        float pleagracetime;
        // offset: 0x70, bitSize: 0x20(0x4 Byte(s))
        int killstreaklotterynumwinners;
        // offset: 0x90, bitSize: 0x20(0x4 Byte(s))
        int ffkickdamagelimit;
        // offset: 0xb0, bitSize: 0x20(0x4 Byte(s))
        float killstreaklotterymintime;
        // offset: 0xd0, bitSize: 0x20(0x4 Byte(s))
        float radiationmindistancefrommaporigin;
        // offset: 0xf0, bitSize: 0x20(0x4 Byte(s))
        float headshotdamagemultiplier;
        // offset: 0x110, bitSize: 0x20(0x4 Byte(s))
        int parachuteoverheadwarningheight;
        // offset: 0x130, bitSize: 0x20(0x4 Byte(s))
        float laststandrevivehealth;
        // offset: 0x150, bitSize: 0x180(0x30 Byte(s))
        string(48) nameplatesettings;
        // offset: 0x2d0, bitSize: 0x180(0x30 Byte(s))
        string(48) buystationitemlist;
        // offset: 0x450, bitSize: 0x20(0x4 Byte(s))
        int ffpunishlimit;
        // offset: 0x470, bitSize: 0x20(0x4 Byte(s))
        float laststandhealth;
        // offset: 0x490, bitSize: 0x20(0x4 Byte(s))
        float meatshieldhealthscale;
        // offset: 0x4b0, bitSize: 0x20(0x4 Byte(s))
        float radiationstartingoriginmaxoffset;
        // offset: 0x4d0, bitSize: 0x20(0x4 Byte(s))
        int parachuteoverheadwarningradius;
        // offset: 0x4f0, bitSize: 0x20(0x4 Byte(s))
        int friendlyfire;
        // offset: 0x510, bitSize: 0x20(0x4 Byte(s))
        int vehicleabandonedtimeout;
        // offset: 0x530, bitSize: 0x8(0x1 Byte(s))
        byte platecarrierstartlevel;
        // offset: 0x538, bitSize: 0x20(0x4 Byte(s))
        float aidisperseinitialrange;
        // offset: 0x558, bitSize: 0x100(0x20 Byte(s))
        string(32) nvgvisionset;
        // offset: 0x658, bitSize: 0x20(0x4 Byte(s))
        float vehiclepatrolspeed;
        // offset: 0x678, bitSize: 0x20(0x4 Byte(s))
        float pleatimeout;
        // offset: 0x698, bitSize: 0x20(0x4 Byte(s))
        float durationtoshowspawncamera;
        // offset: 0x6b8, bitSize: 0xd0(0x1a Byte(s))
        string(26) restrictedperk2fallback;
        // offset: 0x788, bitSize: 0x8(0x1 Byte(s))
        byte crankedbombtimer;
        // offset: 0x790, bitSize: 0x20(0x4 Byte(s))
        float carepackagedroptime;
        // offset: 0x7b0, bitSize: 0x20(0x4 Byte(s))
        float aidisperserange;
        // offset: 0x7d0, bitSize: 0x20(0x4 Byte(s))
        float healthregenmultiplier;
        // offset: 0x7f0, bitSize: 0x20(0x4 Byte(s))
        int parachuteoverheadwarningprematchtimeoutms;
        // offset: 0x810, bitSize: 0x20(0x4 Byte(s))
        float laststandinvulntime;
        // offset: 0x830, bitSize: 0x20(0x4 Byte(s))
        float spawnprotectiontimer;
        // offset: 0x850, bitSize: 0x20(0x4 Byte(s))
        float superpointsmod;
        // offset: 0x870, bitSize: 0x20(0x4 Byte(s))
        int ammorestocklauncherclipnum;
        // offset: 0x890, bitSize: 0x20(0x4 Byte(s))
        int respawnreserveplates;
        // offset: 0x8b0, bitSize: 0x20(0x4 Byte(s))
        float laststandsuicidetimer;
        // offset: 0x8d0, bitSize: 0x8(0x1 Byte(s))
        byte classtableoverride;
        // offset: 0x8d8, bitSize: 0x8(0x1 Byte(s))
        Equipment restrictedtacticalfallback;
        // offset: 0x8e0, bitSize: 0x8(0x1 Byte(s))
        Equipment restrictedlethalfallback;
        // offset: 0x8e8, bitSize: 0x60(0xc Byte(s))
        string(12) fedteamname;
        // offset: 0x948, bitSize: 0x20(0x4 Byte(s))
        int startconnectedmsgtime;
        // offset: 0x968, bitSize: 0x20(0x4 Byte(s))
        float meatshieldduration;
        // offset: 0x988, bitSize: 0x20(0x4 Byte(s))
        float radiationforceoriginx;
        // offset: 0x9a8, bitSize: 0x20(0x4 Byte(s))
        float radiationforceoriginy;
        // offset: 0x9c8, bitSize: 0x8(0x1 Byte(s))
        byte spawnarmorplates;
        // offset: 0x9d0, bitSize: 0x20(0x4 Byte(s))
        float meatshieldgiveupdelay;
        // offset: 0x9f0, bitSize: 0x20(0x4 Byte(s))
        float meatshieldgiveupspeed;
        // offset: 0xa10, bitSize: 0x20(0x4 Byte(s))
        int vehiclerespawndelay;
        // offset: 0xa30, bitSize: 0x20(0x4 Byte(s))
        int aidispersetimeout;
        // offset: 0xa50, bitSize: 0x20(0x4 Byte(s))
        float damagemultiplier;
        // offset: 0xa70, bitSize: 0x8(0x1 Byte(s))
        byte squadsize;
        // offset: 0xa78, bitSize: 0x20(0x4 Byte(s))
        int spawnarmor;
        // offset: 0xa98, bitSize: 0xd0(0x1a Byte(s))
        string(26) restrictedultimateperkfallback;
        // offset: 0xb68, bitSize: 0x20(0x4 Byte(s))
        float exfilactivetimer;
        // offset: 0xb88, bitSize: 0x8(0x1 Byte(s))
        byte infilreserveplates;
        // offset: 0xb90, bitSize: 0x20(0x4 Byte(s))
        int reactiveArmorPiecesUsed;
        // offset: 0xbb0, bitSize: 0x80(0x10 Byte(s))
        string(16) weatheroption;
        // offset: 0xc30, bitSize: 0x20(0x4 Byte(s))
        float radiationstartdamage;
        // offset: 0xc50, bitSize: 0x200(0x40 Byte(s))
        string(64) nvglightaltfx;
        // offset: 0xe50, bitSize: 0x20(0x4 Byte(s))
        float deathsdoorexitpct;
        // offset: 0xe70, bitSize: 0x20(0x4 Byte(s))
        float hash_fa06da3d82b3f053;
        // offset: 0xe90, bitSize: 0x20(0x4 Byte(s))
        int uavtowercooldown;
        // offset: 0xeb0, bitSize: 0x20(0x4 Byte(s))
        float laststanddamagetakenscalar;
        // offset: 0xed0, bitSize: 0x20(0x4 Byte(s))
        float radiationfinalradius;
        // offset: 0xef0, bitSize: 0x20(0x4 Byte(s))
        int scorelimit;
        // offset: 0xf10, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_20dbda35a8b62224;
        // offset: 0xfe0, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_20dbdd35a8b6273d;
        // offset: 0x10b0, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_20dbdc35a8b6258a;
        // offset: 0x1180, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_20dbd735a8b61d0b;
        // offset: 0x1250, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_20dbd635a8b61b58;
        // offset: 0x1320, bitSize: 0x20(0x4 Byte(s))
        float airstrikenotifycircleaddedrange;
        // offset: 0x1340, bitSize: 0x20(0x4 Byte(s))
        int superfastchargerate;
        // offset: 0x1360, bitSize: 0x8(0x1 Byte(s))
        byte armordropamount;
        // offset: 0x1368, bitSize: 0x8(0x1 Byte(s))
        byte radaralwayson;
        // offset: 0x1370, bitSize: 0x20(0x4 Byte(s))
        int killstreakdelay;
        // offset: 0x1390, bitSize: 0x20(0x4 Byte(s))
        float vehiclediveoutminspeed;
        // offset: 0x13b0, bitSize: 0x20(0x4 Byte(s))
        float teamrevivetimeout;
        // offset: 0x13d0, bitSize: 0x20(0x4 Byte(s))
        float radiationstartradius;
        // offset: 0x13f0, bitSize: 0x20(0x4 Byte(s))
        int localeid;
        // offset: 0x1410, bitSize: 0x20(0x4 Byte(s))
        int dogtagpointsperconfirmedkill;
        // offset: 0x1430, bitSize: 0x20(0x4 Byte(s))
        float radiationstartingoriginradius;
        // offset: 0x1450, bitSize: 0x180(0x30 Byte(s))
        string(48) hash_cdee0da015b5ad7c;
        // offset: 0x15d0, bitSize: 0x8(0x1 Byte(s))
        byte laststand;
        // offset: 0x15d8, bitSize: 0x20(0x4 Byte(s))
        float killstreaklotterycooldowntime;
        // offset: 0x15f8, bitSize: 0x20(0x4 Byte(s))
        int graceperiod;
        // offset: 0x1618, bitSize: 0x20(0x4 Byte(s))
        int ammorestockclipnum;
        // offset: 0x1638, bitSize: 0x20(0x4 Byte(s))
        int respawnarmor;
        // offset: 0x1658, bitSize: 0x20(0x4 Byte(s))
        float respawndelay;
        // offset: 0x1678, bitSize: 0x20(0x4 Byte(s))
        int maxpleaperplayer;
        // offset: 0x1698, bitSize: 0x20(0x4 Byte(s))
        float equipmentdelay;
        // offset: 0x16b8, bitSize: 0x20(0x4 Byte(s))
        float radiationmindistancefrompoi;
        // offset: 0x16d8, bitSize: 0x20(0x4 Byte(s))
        int backuppistolreload;
        // offset: 0x16f8, bitSize: 0x20(0x4 Byte(s))
        float radiationmindistancefromspawn;
        // offset: 0x1718, bitSize: 0x20(0x4 Byte(s))
        float airstrikezonevisiblerange;
        // offset: 0x1738, bitSize: 0x20(0x4 Byte(s))
        float laststandrevivetimer;
        // offset: 0x1758, bitSize: 0x200(0x40 Byte(s))
        string(64) nvglightfx;
        // offset: 0x1958, bitSize: 0x20(0x4 Byte(s))
        int waverespawndelayalt;
        // offset: 0x1978, bitSize: 0x20(0x4 Byte(s))
        float healthregen;
        // offset: 0x1998, bitSize: 0x20(0x4 Byte(s))
        int numlives;
        // offset: 0x19b8, bitSize: 0x20(0x4 Byte(s))
        int winbytwomaxrounds;
        // offset: 0x19d8, bitSize: 0xd0(0x1a Byte(s))
        string(26) restrictedperk1fallback;
        // offset: 0x1aa8, bitSize: 0x180(0x30 Byte(s))
        string(48) restrictedsecondaryfallback;
        // offset: 0x1c28, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_6f97117b59c16c0;
        // offset: 0x1cf8, bitSize: 0x8(0x1 Byte(s))
        byte numrevives;
        // offset: 0x1d00, bitSize: 0x20(0x4 Byte(s))
        float minimumtimetospectateteammates;
        // offset: 0x1d20, bitSize: 0x20(0x4 Byte(s))
        float radiationspreadingticktime;
        // offset: 0x1d40, bitSize: 0x20(0x4 Byte(s))
        int ffkickkilllimit;
        // offset: 0x1d60, bitSize: 0x8(0x1 Byte(s))
        byte teamsize;
        // offset: 0x1d68, bitSize: 0x20(0x4 Byte(s))
        float pleacameraintervaltime;
        // offset: 0x1d88, bitSize: 0x20(0x4 Byte(s))
        int infilenddelay;
        // offset: 0x1da8, bitSize: 0x8(0x1 Byte(s))
        byte classforceloadouts;
        // offset: 0x1db0, bitSize: 0x20(0x4 Byte(s))
        int waverespawndelay;
        // offset: 0x1dd0, bitSize: 0x20(0x4 Byte(s))
        float hash_4b8b92c23436c8ff;
        // offset: 0x1df0, bitSize: 0x20(0x4 Byte(s))
        float hash_87dece329ce57905;
        // offset: 0x1e10, bitSize: 0x20(0x4 Byte(s))
        int spectatemodeallowed;
        // offset: 0x1e30, bitSize: 0xd0(0x1a Byte(s))
        string(26) backuppistolcamo;
        // offset: 0x1f00, bitSize: 0x20(0x4 Byte(s))
        float vehicleunmannedkillprotectiontimeout;
        // offset: 0x1f20, bitSize: 0x20(0x4 Byte(s))
        int ffpunishdamagelimit;
        // offset: 0x1f40, bitSize: 0x20(0x4 Byte(s))
        float teamrevivehealth;
        // offset: 0x1f60, bitSize: 0xd0(0x1a Byte(s))
        string(26) resetconfig;
        // offset: 0x2030, bitSize: 0x20(0x4 Byte(s))
        int infilarmor;
        // offset: 0x2050, bitSize: 0xd0(0x1a Byte(s))
        string(26) restrictedperk3fallback;
        // offset: 0x2120, bitSize: 0x20(0x4 Byte(s))
        int winlimit;
        // offset: 0x2140, bitSize: 0x20(0x4 Byte(s))
        int maxagents;
        // offset: 0x2160, bitSize: 0x20(0x4 Byte(s))
        float radiationstartticktime;
        // offset: 0x2180, bitSize: 0x20(0x4 Byte(s))
        float laststandtimer;
        // offset: 0x21a0, bitSize: 0x20(0x4 Byte(s))
        float hash_b33d64c0c2dd124d;
        // offset: 0x21c0, bitSize: 0x20(0x4 Byte(s))
        float radiationexpansionseconds;
        // offset: 0x21e0, bitSize: 0x20(0x4 Byte(s))
        float hash_7707690e4d15d7c8;
        // offset: 0x2200, bitSize: 0x20(0x4 Byte(s))
        float deathsdoorenterpct;
        // offset: 0x2220, bitSize: 0x8(0x1 Byte(s))
        byte pointsperdeath;
        // offset: 0x2228, bitSize: 0x20(0x4 Byte(s))
        int parachuteoverheadwarningtimeoutms;
        // offset: 0x2248, bitSize: 0x20(0x4 Byte(s))
        float equipmentmsprotect;
        // offset: 0x2268, bitSize: 0x180(0x30 Byte(s))
        string(48) radiationquestcircletemplateid;
        // offset: 0x23e8, bitSize: 0x20(0x4 Byte(s))
        float radiationspreadingdamage;
        // offset: 0x2408, bitSize: 0x20(0x4 Byte(s))
        float hash_b9d62d4d8e9357de;
        // offset: 0x2428, bitSize: 0x180(0x30 Byte(s))
        string(48) buystationlist;
        // offset: 0x25a8, bitSize: 0x400(0x80 Byte(s))
        string(128) buystationpool;
        // offset: 0x29a8, bitSize: 0x20(0x4 Byte(s))
        float maxhealth;
        // offset: 0x29c8, bitSize: 0x8(0x1 Byte(s))
        byte pointsperkill;
        // offset: 0x29d0, bitSize: 0x20(0x4 Byte(s))
        int maxpleasactive;
        // offset: 0x29f0, bitSize: 0x180(0x30 Byte(s))
        string(48) wcdata;
        // offset: 0x2b70, bitSize: 0x20(0x4 Byte(s))
        float exfilextracttimer;
        // offset: 0x2b90, bitSize: 0x20(0x4 Byte(s))
        int matchstarttime;
        // offset: 0x2bb0, bitSize: 0x8(0x1 Byte(s))
        byte radarhideshots;
        // offset: 0x2bb8, bitSize: 0x8(0x1 Byte(s))
        byte roundswitch;
        // offset: 0x2bc0, bitSize: 0x20(0x4 Byte(s))
        float suicidespawndelay;
        // offset: 0x2be0, bitSize: 0x20(0x4 Byte(s))
        float airstrikezonesizemultiplier;
        // offset: 0x2c00, bitSize: 0x20(0x4 Byte(s))
        int roundstarttime;
        // offset: 0x2c20, bitSize: 0x8(0x1 Byte(s))
        byte pointsheadshotbonus;
        // offset: 0x2c28, bitSize: 0x20(0x4 Byte(s))
        float teamrevivetime;
        // offset: 0x2c48, bitSize: 0x20(0x4 Byte(s))
        int ammorestocksniperclipnum;
        // offset: 0x2c68, bitSize: 0x8(0x1 Byte(s))
        byte compasshidepings;
        // offset: 0x2c70, bitSize: 0x60(0xc Byte(s))
        string(12) ghoststeamname;
        // offset: 0x2cd0, bitSize: 0x8(0x1 Byte(s))
        byte killcamtype;
        // offset: 0x2cd8, bitSize: 0x20(0x4 Byte(s))
        int dogtagpointsperdeny;
        // offset: 0x2cf8, bitSize: 0xa0(0x14 Byte(s))
        string(20) ammorestockammoicon;
        // offset: 0x2d98, bitSize: 0x8(0x1 Byte(s))
        byte teamcount;
        // offset: 0x2da0, bitSize: 0xd0(0x1a Byte(s))
        string(26) hash_c7c429ae1442a57c;
        // offset: 0x2e70, bitSize: 0x20(0x4 Byte(s))
        int roundlimit;
        // offset: 0x2e90, bitSize: 0x180(0x30 Byte(s))
        string(48) restrictedprimaryfallback;
        // offset: 0x3010, bitSize: 0x20(0x4 Byte(s))
        float killstreaklotterymaxtime;
        // offset: 0x3030, bitSize: 0x8(0x1 Byte(s))
        byte magcount;
        // offset: 0x3038, bitSize: 0x8(0x1 Byte(s))
        byte startingequipmentcount;
        // offset: 0x3040, bitSize: 0x8(0x1 Byte(s))
        byte pointsperkskill;
        // offset: 0x3048, bitSize: 0xd0(0x1a Byte(s))
        string(26) backuppistol;
        // offset: 0x3118, bitSize: 0x20(0x4 Byte(s))
        float plearequestradius;
        // offset: 0x3138, bitSize: 0x1
        bool hash_5e99f28c44a0cf3e;
        // offset: 0x3139, bitSize: 0x1
        bool dynamicmapelementsdisabled;
        // offset: 0x313a, bitSize: 0x1
        bool ammorestockforceclipsize;
        // offset: 0x313b, bitSize: 0x1
        bool ammorestockmaxequipment;
        // offset: 0x313c, bitSize: 0x1
        bool meatshieldallowairrelease;
        // offset: 0x313d, bitSize: 0x1
        bool buymode;
        // offset: 0x313e, bitSize: 0x1
        bool radiationenabled;
        // offset: 0x313f, bitSize: 0x1
        bool hash_fc15e9e47ab1c803;
        // offset: 0x3140, bitSize: 0x1
        bool swaptospawncameraifallteammatesdead;
        // offset: 0x3141, bitSize: 0x1
        bool wcenabled;
        // offset: 0x3142, bitSize: 0x1
        bool hash_235ebefcbc75a4e4;
        // offset: 0x3143, bitSize: 0x1
        bool vehicleinvulnerablehusks;
        // offset: 0x3144, bitSize: 0x1
        bool hash_acfac621284a4e3b;
        // offset: 0x3145, bitSize: 0x1
        bool casualscorestreaks;
        // offset: 0x3146, bitSize: 0x1
        bool laststandoutlineenabled;
        // offset: 0x3147, bitSize: 0x1
        bool hardcoremodeon;
        // offset: 0x3148, bitSize: 0x1
        bool hash_5051f958740677f8;
        // offset: 0x3149, bitSize: 0x49, array:0x49(hti:0xc)
        bool killstreakrestricted[Killstreak];
        // offset: 0x3192, bitSize: 0x1
        bool helmetcamdisabled;
        // offset: 0x3193, bitSize: 0x1
        bool vehiclehusktimeoutenabled;
        // offset: 0x3194, bitSize: 0x1
        bool meatshieldallowrelease;
        // offset: 0x3195, bitSize: 0x1
        bool aiagentsinmp;
        // offset: 0x3196, bitSize: 0x1
        bool disablespawncamera;
        // offset: 0x3197, bitSize: 0xc, array:0xc(hti:0x17)
        bool wildcardrestricted[Wildcard];
        // offset: 0x31a3, bitSize: 0x1
        bool nvgusecantedads;
        // offset: 0x31a4, bitSize: 0x1
        bool radiationblockedbyiodine;
        // offset: 0x31a5, bitSize: 0x1
        bool ammorestockallowsuperweapons;
        // offset: 0x31a6, bitSize: 0x1
        bool hash_e8b44fdfa4bbce86;
        // offset: 0x31a7, bitSize: 0x1
        bool aikilledscoreeventsenabled;
        // offset: 0x31a8, bitSize: 0x1
        bool allowsupers;
        // offset: 0x31a9, bitSize: 0x1
        bool aispawnondeath;
        // offset: 0x31aa, bitSize: 0x1
        bool hash_d722513150367973;
        // offset: 0x31ab, bitSize: 0x1
        bool infilskip;
        // offset: 0x31ac, bitSize: 0x1
        bool allowcustomclasses;
        // offset: 0x31ad, bitSize: 0x1
        bool showairstrikeonmap;
        // offset: 0x31ae, bitSize: 0x1
        bool laststandselfreviveanim;
        // offset: 0x31af, bitSize: 0x1
        bool allowserverpauseoncoopdedi;
        // offset: 0x31b0, bitSize: 0x1
        bool allowcloseddoorpings;
        // offset: 0x31b1, bitSize: 0x1
        bool disablesupersprint;
        // offset: 0x31b2, bitSize: 0x1
        bool tacticalmode;
        // offset: 0x31b3, bitSize: 0x1
        bool hash_d0fb3314204d514d;
        // offset: 0x31b4, bitSize: 0x1
        bool droparmorondeath;
        // offset: 0x31b5, bitSize: 0x1
        bool roundretainstreaks;
        // offset: 0x31b6, bitSize: 0x1
        bool useammorestocklocs;
        // offset: 0x31b7, bitSize: 0x1
        bool playerbackpackdrop;
        // offset: 0x31b8, bitSize: 0x1
        bool headshotsonly;
        // offset: 0x31b9, bitSize: 0x1
        bool platecarrierenabled;
        // offset: 0x31ba, bitSize: 0x1
        bool serverpauseonpausemenu;
        // offset: 0x31bb, bitSize: 0x1
        bool radiationspawnsatstart;
        // offset: 0x31bc, bitSize: 0x1
        bool pleashouldtimeout;
        // offset: 0x31bd, bitSize: 0x1
        bool forcerespawn;
        // offset: 0x31be, bitSize: 0x1
        bool winbytwoenabled;
        // offset: 0x31bf, bitSize: 0x1
        bool vehicleenginehealenabled;
        // offset: 0x31c0, bitSize: 0x1
        bool lootcacheinventorystrip;
        // offset: 0x31c1, bitSize: 0x1
        bool platecarriervariantsenabled;
        // offset: 0x31c2, bitSize: 0x1
        bool allowkillstreaks;
        // offset: 0x31c3, bitSize: 0x1
        bool deathretainstreaks;
        // offset: 0x31c4, bitSize: 0x7, array:0x7(hti:0x1e)
        bool perkclassrestricted[PerkClass];
        // offset: 0x31cb, bitSize: 0x1
        bool aibackpackdrop;
        // offset: 0x31cc, bitSize: 0x1
        bool dogtags;
        // offset: 0x31cd, bitSize: 0x1
        bool exfilrespawn;
        // offset: 0x31ce, bitSize: 0x5b, array:0x5b(hti:0x14)
        bool superrestricted[Super];
        // offset: 0x3229, bitSize: 0x1
        bool pleaallowallyrevive;
        // offset: 0x322a, bitSize: 0x1
        bool blockbrweaponentitydrops;
        // offset: 0x322b, bitSize: 0x1
        bool enablecustomoperatoricons;
        // offset: 0x322c, bitSize: 0x1
        bool pleaallowsolo;
        // offset: 0x322d, bitSize: 0x1
        bool vehicletrunksenabled;
        // offset: 0x322e, bitSize: 0x1
        bool allowcalloutmarkerping;
        // offset: 0x322f, bitSize: 0x1
        bool ammorestockmaxammo;
        // offset: 0x3230, bitSize: 0x1
        bool tier1modeenabled;
        // offset: 0x3231, bitSize: 0x1
        bool allowparachute;
        // offset: 0x3232, bitSize: 0x1
        bool enablebrloot;
        // offset: 0x3233, bitSize: 0x1
        bool hash_6aeabe90274fb0fc;
        // offset: 0x3234, bitSize: 0x1
        bool hash_de999c17a1e53ad0;
        // offset: 0x3235, bitSize: 0x1
        bool ingameloot;
        // offset: 0x3236, bitSize: 0x1
        bool enableminimap;
        // offset: 0x3237, bitSize: 0xe, array:0xe(hti:0x1d)
        bool attachmentclassrestricted[AttachmentClass];
        // offset: 0x3245, bitSize: 0x1
        bool hash_974d4fe234af816f;
        // offset: 0x3246, bitSize: 0x1
        bool teamassignmentallowed;
        // offset: 0x3247, bitSize: 0x1bd6, array:0x1bd6(hti:0x2)
        bool attachmentrestricted[Attachment];
        // offset: 0x4e1d, bitSize: 0x1
        bool shouldohkprotect;
        // offset: 0x4e1e, bitSize: 0x1
        bool pleaallowgraceperiod;
        // offset: 0x4e1f, bitSize: 0x1
        bool vehicleabandonedtimeoutenabled;
        // offset: 0x4e20, bitSize: 0x1
        bool enableperkpackages;
        // offset: 0x4e21, bitSize: 0x1
        bool vehiclelockingenabled;
        // offset: 0x4e22, bitSize: 0x1
        bool removeexploders;
        // offset: 0x4e23, bitSize: 0x1
        bool reviveuseweapon;
        // offset: 0x4e24, bitSize: 0x1
        bool replaceindividualrestrictedperks;
        // offset: 0x4e25, bitSize: 0x1
        bool practiceround;
        // offset: 0x4e26, bitSize: 0x1
        bool blockweaponentitydrops;
        // offset: 0x4e27, bitSize: 0x1
        bool hardcoremodeenabled;
        // offset: 0x4e28, bitSize: 0x1
        bool vehiclefuelenabled;
        // offset: 0x4e29, bitSize: 0x1
        bool meatshielddisableautoairrelease;
        // offset: 0x4e2a, bitSize: 0x1
        bool hash_be2cedf64b03aad5;
        // offset: 0x4e2b, bitSize: 0x1
        bool isairstrikezonerandom;
        // offset: 0x4e2c, bitSize: 0x1
        bool pleaallowanyteam;
        // offset: 0x4e2d, bitSize: 0x1
        bool meatshieldallowgiveup;
        // offset: 0x4e2e, bitSize: 0x1
        bool allowarmor;
        // offset: 0x4e2f, bitSize: 0x1
        bool allowintel;
        // offset: 0x4e30, bitSize: 0x1
        bool allowperks;
        // offset: 0x4e31, bitSize: 0x1
        bool freeforall;
        // offset: 0x4e32, bitSize: 0x1
        bool allowdoorpings;
        // offset: 0x4e33, bitSize: 0x1
        bool hash_9ce3450104964371;
        // offset: 0x4e34, bitSize: 0x1
        bool loadoutrestrictions;
        // offset: 0x4e35, bitSize: 0x6d, array:0x6d(hti:0x16)
        bool weaponrestricted[CerWeapons];
        // offset: 0x4ea2, bitSize: 0x1
        bool liveragdollrevive;
        // offset: 0x4ea3, bitSize: 0x1
        bool disableannouncer;
        // offset: 0x4ea4, bitSize: 0x1
        bool spectate3rdallowed;
        // offset: 0x4ea5, bitSize: 0x1
        bool disablebattlechatter;
        // offset: 0x4ea6, bitSize: 0x10a, array:0x10a(hti:0xf)
        bool perkrestricted[Perk];
        // offset: 0x4fb0, bitSize: 0x1
        bool allowserverpauseonsolodedi;
        // offset: 0x4fb1, bitSize: 0x1
        bool cannotenterbrokenvehicles;
        // offset: 0x4fb2, bitSize: 0x1
        bool radiationforceorigin;
        // offset: 0x4fb3, bitSize: 0xd, array:0xd(hti:0x23)
        bool weaponclassrestricted[WeaponClass];
        // offset: 0x4fc0, bitSize: 0x1
        bool roundretainstreakprog;
        // offset: 0x4fc1, bitSize: 0x1
        bool allowvehicles;
        // offset: 0x4fc2, bitSize: 0x1
        bool disablemount;
        // offset: 0x4fc3, bitSize: 0x1
        bool execconfig;
        // offset: 0x4fc4, bitSize: 0x1
        bool spawnvehiclepatrols;
        // offset: 0x4fc5, bitSize: 0x1
        bool hash_3161415f66b340d3;
        // offset: 0x4fc6, bitSize: 0x1
        bool buddyspawnenabled;
        // offset: 0x4fc7, bitSize: 0x1
        bool enablefriendlyoutlines;
        // offset: 0x4fc8, bitSize: 0x1
        bool hash_7274aed3a97eec0;
        // offset: 0x4fc9, bitSize: 0x1
        bool killstreaklottery;
        // offset: 0x4fca, bitSize: 0x57, array:0x57(hti:0xb)
        bool equipmentrestricted[Equipment];
        // offset: 0x5021, bitSize: 0x1
        bool trainenabled;
        // offset: 0x5022, bitSize: 0x1
        bool meatshieldoutlinevictimteam;
        // offset: 0x5023, bitSize: 0x1
        bool pleadontassim;
        // offset: 0x5024, bitSize: 0x1
        bool wrapkillstreaks;
        // offset: 0x5025, bitSize: 0x1, array:0x1(hti:0x24)
        bool attachmentrestrictedperweapon[WeaponAttachmentRestricted];
        // offset: 0x5026, bitSize: 0x1
        bool restrictionsonly;
        // offset: 0x5027, bitSize: 0x1
        bool hash_6c5f4735f519ca2e;
        // offset: 0x5028, bitSize: 0x1
        bool exfilshowlocation;
        // offset: 0x5029, bitSize: 0x1
        bool inputswapenabled;
        // offset: 0x502a, bitSize: 0x1
        bool compasshideenemy;
        // offset: 0x502b, bitSize: 0x1
        bool showkillcam;
        // offset: 0x502c, bitSize: 0x1
        bool pleaforhelpenabled;
        // offset: 0x502d, bitSize: 0x4, array:0x4(hti:0x1b)
        bool killstreakclassrestricted[KillstreakClass];
        // offset: 0x5031, bitSize: 0x1
        bool postgameexfil;
        // offset: 0x5032, bitSize: 0x1
        bool aidispersewhenplayerdowned;
        // offset: 0x5033, bitSize: 0x1
        bool gamepadallowdrivingwhiletacmapisopen;
        // offset: 0x5034, bitSize: 0x1
        bool hash_4db62ce8a2b2518a;
        // offset: 0x5035, bitSize: 0x1
        bool vampirism;
        // offset: 0x5036, bitSize: 0x1
        bool enableenemyoutlines;
    };

    // bitSize: 0x1eb8, members: 3
    struct CustomGameClass {
        // offset: 0x0, bitSize: 0x1eb0(0x3d6 Byte(s))
        LoadoutMP class;
        // offset: 0x1eb0, bitSize: 0x1
        bool juggernaut;
    };

    // bitSize: 0x2a0, members: 12
    struct GunData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        byte setbackstreak;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        byte setback;
        // offset: 0x10, bitSize: 0xd0(0x1a Byte(s))
        string(26) gungameweaponstable;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        byte killsperweapon;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        byte ladderindex;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        GunGameVictoryConditions gungamevictoryconditions;
        // offset: 0xf8, bitSize: 0xd0(0x1a Byte(s))
        string(26) gungamethrowingweapon;
        // offset: 0x1c8, bitSize: 0xd0(0x1a Byte(s))
        string(26) gungameweapontierlist;
        // offset: 0x298, bitSize: 0x1
        bool useladderindex;
        // offset: 0x299, bitSize: 0x1
        bool meleedemotesvictim;
        // offset: 0x29a, bitSize: 0x1
        bool meleegivesscore;
    };

    // bitSize: 0x128, members: 26
    struct InfectData {
        // offset: 0x0, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponinitialprimary;
        // offset: 0x8, bitSize: 0x8(0x1 Byte(s))
        Super superinfecttwo;
        // offset: 0x10, bitSize: 0x8(0x1 Byte(s))
        Super supersurvivortwo;
        // offset: 0x18, bitSize: 0x20(0x4 Byte(s))
        int survivorscorepertick;
        // offset: 0x38, bitSize: 0x8(0x1 Byte(s))
        Equipment lethalinfect;
        // offset: 0x40, bitSize: 0x8(0x1 Byte(s))
        Equipment lethalsurvivor;
        // offset: 0x48, bitSize: 0x20(0x4 Byte(s))
        float survivorscoretime;
        // offset: 0x68, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponinfectprimary;
        // offset: 0x70, bitSize: 0x8(0x1 Byte(s))
        Equipment tacticalsurvivor;
        // offset: 0x78, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponinfectsecondary;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float infectextratimeperkill;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int infectstreakbonus;
        // offset: 0xc0, bitSize: 0x8(0x1 Byte(s))
        Super superinfect;
        // offset: 0xc8, bitSize: 0x20(0x4 Byte(s))
        int survivoralivescore;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        byte numinitialinfected;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponsurvivorsecondary;
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponinitialsecondary;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weaponsurvivorprimary;
        // offset: 0x108, bitSize: 0x8(0x1 Byte(s))
        Super supersurvivor;
        // offset: 0x110, bitSize: 0x8(0x1 Byte(s))
        byte infectattachments;
        // offset: 0x118, bitSize: 0x8(0x1 Byte(s))
        Equipment tacticalinfect;
        // offset: 0x120, bitSize: 0x1
        bool enableping;
        // offset: 0x121, bitSize: 0x1
        bool givetkontispawn;
        // offset: 0x122, bitSize: 0x1
        bool hash_3f125cf19154b933;
        // offset: 0x123, bitSize: 0x1
        bool enableinfectedtracker;
    };

    // bitSize: 0x118, members: 11
    struct OicData {
        // offset: 0x0, bitSize: 0xd0(0x1a Byte(s))
        string(26) weaponstable;
        // offset: 0xd0, bitSize: 0x8(0x1 Byte(s))
        byte pistolweight;
        // offset: 0xd8, bitSize: 0x8(0x1 Byte(s))
        byte killrewardammocount;
        // offset: 0xe0, bitSize: 0x8(0x1 Byte(s))
        byte assaultweight;
        // offset: 0xe8, bitSize: 0x8(0x1 Byte(s))
        byte initialammocount;
        // offset: 0xf0, bitSize: 0x8(0x1 Byte(s))
        byte sniperweight;
        // offset: 0xf8, bitSize: 0x8(0x1 Byte(s))
        byte lmgweight;
        // offset: 0x100, bitSize: 0x8(0x1 Byte(s))
        byte smgweight;
        // offset: 0x108, bitSize: 0x8(0x1 Byte(s))
        CerWeapons weapon;
        // offset: 0x110, bitSize: 0x1
        bool oneshotkill;
    };

    // bitSize: 0x268, members: 21
    struct CtdmData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue1;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue2;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue3;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue4;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue5;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int buffunlockvalue6;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int combobaseactionpoints;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int buffvisionminrange;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        float rarepointmultiplier;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        float buffqdscalesniper;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        float uncommonpointmultiplier;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        float buffspeedscalar;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        float buffweapspreadmultiplier;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int buffvisionmaxrange;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        float buffqdscalemp;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        float epicpointmultiplier;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        float legendarypointmultiplier;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        float buffpointmultiplier;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int combotimer;
        // offset: 0x260, bitSize: 0x1
        bool suicidecompletescombos;
    };

    // bitSize: 0x400, members: 32
    struct SabattackData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_482dd36e3a574095;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int hash_98736b82edc56dda;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_4793ba33436616c6;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_b32867ca21e5073e;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float hash_b2f9f60b0665bfba;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int hash_c6ced8a2c5a3b808;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int hash_38d83a6f4b3e90b2;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int capturescore;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int sabattackovertime;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int flagpickupheight;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int hash_cebd3a6ba9af1cf0;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int hash_8d168f2a082618ca;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int antistall;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int hash_325ca5c19ecf1b4d;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        int flagrespawntime;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int hash_41f7827225180dc5;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        int hash_8b86da667177f7b0;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        int hash_5a7602e165b1dcf6;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int hash_e27beb039ae1feb1;
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int flagpickupsize;
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int hash_77a8cee24e4109a5;
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        int hash_ea6bf9e4b67304ce;
        // offset: 0x2c0, bitSize: 0x20(0x4 Byte(s))
        int hash_d9bfd044759faa59;
        // offset: 0x2e0, bitSize: 0x20(0x4 Byte(s))
        int hash_b0e4057fc6f506b2;
        // offset: 0x300, bitSize: 0x20(0x4 Byte(s))
        int hash_3c547f042abf0bc;
        // offset: 0x320, bitSize: 0x20(0x4 Byte(s))
        int hash_86969b721a8784b4;
        // offset: 0x340, bitSize: 0x20(0x4 Byte(s))
        float hash_7207db9f53145a87;
        // offset: 0x360, bitSize: 0x20(0x4 Byte(s))
        int hash_fc6d2fba95faff4f;
        // offset: 0x380, bitSize: 0x20(0x4 Byte(s))
        int hash_8919a3bae63ee2e6;
        // offset: 0x3a0, bitSize: 0x20(0x4 Byte(s))
        int hash_d45cbe6dbd906ac7;
        // offset: 0x3c0, bitSize: 0x20(0x4 Byte(s))
        int hash_30bba3cbedb45fd;
        // offset: 0x3e0, bitSize: 0x20(0x4 Byte(s))
        int hash_e819974c50f2699a;
    };

    // bitSize: 0x2c0, members: 22
    struct LoadoutEconomyData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int hash_f29da8bb299c09e2;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int hash_a4842cb65d4db492;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_3d481d8e76aa8467;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_8698654925bd406c;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hash_dd70ab90f7d25e;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int hash_638fc501d22518c0;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int hash_a1a05b877ea01351;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_a1bb4d877eb6c33f;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int hash_b694c514e3fcc226;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int hash_eb810ba92297f93;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        int hash_bbd81e9b6ed1cbe2;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int hash_a3cbe7f9433b4e2b;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int hash_4af4d7aebc081232;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int hash_52f363cda3467faf;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        int hash_ee5317580a6b8941;
        // offset: 0x1e0, bitSize: 0x20(0x4 Byte(s))
        int hash_ed8da4fd5a1e4cc8;
        // offset: 0x200, bitSize: 0x20(0x4 Byte(s))
        int hash_39b0c0d854c7aae8;
        // offset: 0x220, bitSize: 0x20(0x4 Byte(s))
        int hash_74b0f6cf051f100b;
        // offset: 0x240, bitSize: 0x20(0x4 Byte(s))
        int hash_95502cd9d124ba95;
        // offset: 0x260, bitSize: 0x20(0x4 Byte(s))
        int hash_1df9a5799137a7cd;
        // offset: 0x280, bitSize: 0x20(0x4 Byte(s))
        int hash_c36eabcf8d07a0ad;
        // offset: 0x2a0, bitSize: 0x20(0x4 Byte(s))
        int hash_755388df670b5e97;
    };

    // bitSize: 0x1e0, members: 15
    struct skirmishData {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        float rewindtime;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        float capturetime;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        float secureradius;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int hash_e36b4d1708e6f6c;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        float captureobjtime;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        float defusetime;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        float spawndelay;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int hash_ae533d22cbf4fa96;
        // offset: 0x100, bitSize: 0x20(0x4 Byte(s))
        int activityradius;
        // offset: 0x120, bitSize: 0x20(0x4 Byte(s))
        int maxlockdelay;
        // offset: 0x140, bitSize: 0x20(0x4 Byte(s))
        float planttime;
        // offset: 0x160, bitSize: 0x20(0x4 Byte(s))
        int maxactivitiesstarting;
        // offset: 0x180, bitSize: 0x20(0x4 Byte(s))
        int initiallockedtime;
        // offset: 0x1a0, bitSize: 0x20(0x4 Byte(s))
        int activitycooldown;
        // offset: 0x1c0, bitSize: 0x20(0x4 Byte(s))
        float bombtimer;
    };

    // bitSize: 0x100, members: 8
    struct ScriptableSettings {
        // offset: 0x0, bitSize: 0x20(0x4 Byte(s))
        int instancecountruntimeplayer;
        // offset: 0x20, bitSize: 0x20(0x4 Byte(s))
        int hash_6413d1b51e83628;
        // offset: 0x40, bitSize: 0x20(0x4 Byte(s))
        int hash_51a45f38ecc46219;
        // offset: 0x60, bitSize: 0x20(0x4 Byte(s))
        int instancecountruntimebase;
        // offset: 0x80, bitSize: 0x20(0x4 Byte(s))
        int hash_74905b9e8c759f6b;
        // offset: 0xa0, bitSize: 0x20(0x4 Byte(s))
        int hash_9b65751b281fffa7;
        // offset: 0xc0, bitSize: 0x20(0x4 Byte(s))
        int hash_26fa0d57cba124f8;
        // offset: 0xe0, bitSize: 0x20(0x4 Byte(s))
        int instancecountruntimeagent;
    };

    // idx 0x0 members: 0x3b type: 5
    enum Accessory {
        accessory000, // 0x0
        accessory001, // 0x1
        accessory002, // 0x2
        accessory003, // 0x3
        accessory004, // 0x4
        accessory005, // 0x5
        accessory006, // 0x6
        accessory007, // 0x7
        accessory008, // 0x8
        accessory009, // 0x9
        accessory010, // 0xa
        accessory011, // 0xb
        accessory012, // 0xc
        accessory013, // 0xd
        accessory014, // 0xe
        accessory015, // 0xf
        accessory016, // 0x10
        accessory017, // 0x11
        accessory018, // 0x12
        accessory019, // 0x13
        accessory020, // 0x14
        accessory021, // 0x15
        accessory022, // 0x16
        accessory023, // 0x17
        accessory024, // 0x18
        accessory025, // 0x19
        accessory026, // 0x1a
        accessory027, // 0x1b
        accessory028, // 0x1c
        accessory029, // 0x1d
        accessory030, // 0x1e
        accessory031, // 0x1f
        accessory032, // 0x20
        accessory033, // 0x21
        accessory034, // 0x22
        accessory035, // 0x23
        accessory036, // 0x24
        accessory037, // 0x25
        accessory038, // 0x26
        accessory039, // 0x27
        accessory040, // 0x28
        accessory041, // 0x29
        accessory042, // 0x2a
        accessory043, // 0x2b
        accessory044, // 0x2c
        accessory045, // 0x2d
        accessory046, // 0x2e
        accessory047, // 0x2f
        accessory048, // 0x30
        accessory049, // 0x31
        accessory050, // 0x32
        accessory051, // 0x33
        accessory052, // 0x34
        accessory053, // 0x35
        accessory054, // 0x36
        accessory055, // 0x37
        accessory056, // 0x38
        accessory057, // 0x39
        accessory058 // 0x3a
    };

    // idx 0x1 members: 0x8 type: 5
    enum AmmoMod {
        none, // 0x0
        brainrot, // 0x1
        cryofreeze, // 0x2
        deadwire, // 0x3
        napalmburst, // 0x4
        shatterblast, // 0x5
        shadowvortex, // 0x6
        lightray // 0x7
    };

    // idx 0x2 members: 0x1bd6 type: 5
    enum Attachment {
        none, // 0x0
        comp02, // 0x1
        iw9_brake01, // 0x2
        iw9_flashhider, // 0x3
        iw9_silencer01, // 0x4
        iw9_silencer02, // 0x5
        iw9_silencer03, // 0x6
        bar_ar_long_p04, // 0x7
        bar_ar_heavy_p04, // 0x8
        stock_ar_tactical_p04, // 0x9
        stock_sm_tactical_p04, // 0xa
        stock_sm_p04, // 0xb
        stock_ar_light_p04, // 0xc
        iw9_minireddot01, // 0xd
        iw9_minireddot02, // 0xe
        iw9_minireddot03, // 0xf
        iw9_minireddot04, // 0x10
        fourx01, // 0x11
        fourx02, // 0x12
        hybrid01, // 0x13
        hybrid02, // 0x14
        hybrid03, // 0x15
        holo01, // 0x16
        holo02, // 0x17
        holo03, // 0x18
        reflex01, // 0x19
        reflex02, // 0x1a
        reflex03, // 0x1b
        reflex04, // 0x1c
        grip_angled02, // 0x1d
        grip_vert01, // 0x1e
        grip_vert02, // 0x1f
        grip_vert03, // 0x20
        grip_vertshort01, // 0x21
        grip_vertshort02, // 0x22
        pgrip_aim_p04, // 0x23
        pgrip_ass_p04, // 0x24
        pgrip_tac_p04, // 0x25
        stock_ar_heavy_p04, // 0x26
        ub_glmini01, // 0x27
        comp01, // 0x28
        bar_ar_light_p04, // 0x29
        bar_ar_hvyshort2_p04, // 0x2a
        bar_ar_lgtshort_p04, // 0x2b
        stock_ar_p04, // 0x2c
        bar_sm_short_p03, // 0x2d
        mag_sn_p03, // 0x2e
        pgrip_aim_p03, // 0x2f
        pgrip_ass_p03, // 0x30
        pgrip_tac_p03, // 0x31
        comb_heavy_p03, // 0x32
        comb_ammo_p03, // 0x33
        bar_ar_short_p02, // 0x34
        bar_lm_p02, // 0x35
        bar_lm_long_p02, // 0x36
        bar_br_light_p02, // 0x37
        bar_lm_short_p02, // 0x38
        bar_ar_light_p02, // 0x39
        stock_lm_p02, // 0x3a
        stock_ar_tactical_p02, // 0x3b
        stock_ar_assault_p02, // 0x3c
        stock_sm_p02, // 0x3d
        mag_ar_small_p02, // 0x3e
        mag_ar_large_p02, // 0x3f
        drum_ar_p02, // 0x40
        bar_ar_longhvy_p01, // 0x41
        bar_ar_heavy_p01, // 0x42
        bar_ar_shorthvy_p01, // 0x43
        bar_ar_light_p01, // 0x44
        bar_ar_short_p01, // 0x45
        bar_ar_long_p01, // 0x46
        stock_ar_tactical_p01, // 0x47
        stock_ar_light_p01, // 0x48
        stock_sm_p01, // 0x49
        stock_ar_assault_p01, // 0x4a
        stock_sn_p01, // 0x4b
        stockno_ar_p01, // 0x4c
        mag_ar_large_p01, // 0x4d
        mag_ar_xlarge_p01, // 0x4e
        ub_gl01, // 0x4f
        ub_sh01, // 0x50
        pgrip_aim_p01, // 0x51
        pgrip_ass_p01, // 0x52
        pgrip_tac_p01, // 0x53
        pgrip_ske_p01, // 0x54
        pgrip_snp_p01, // 0x55
        stock_sn_p02, // 0x56
        kilo21_sidegrip, // 0x57
        bar_br_short_p05, // 0x58
        bar_br_long_p05, // 0x59
        mag_br_p05, // 0x5a
        drum_br_p05, // 0x5b
        ironsdefault_schotel, // 0x5c
        pgrip_aim_p05, // 0x5d
        pgrip_ass_p05, // 0x5e
        pgrip_tac_p05, // 0x5f
        stockr_dm_heavy_p20, // 0x60
        stockr_dm_tactical_p20, // 0x61
        stock_dm_p20, // 0x62
        mike24_scope, // 0x63
        chas_sa700, // 0x64
        pgrip_ass_p20, // 0x65
        pgrip_aim_p20, // 0x66
        bolt_hvy_p20, // 0x67
        bolt_lgt_p20, // 0x68
        bar_dm_short_p19, // 0x69
        bar_dm_light_p19, // 0x6a
        bar_dm_long_p19, // 0x6b
        bar_dm_hvylong_p19, // 0x6c
        stockr_dm_light_p19, // 0x6d
        stockr_dm_tactical_p19, // 0x6e
        stockno_dm_p19, // 0x6f
        tube_4_45gvt, // 0x70
        tube_8_45gvt, // 0x71
        iw9_ironsdefault_sbeta, // 0x72
        comb_ammo_p19, // 0x73
        comb_tactical_p19, // 0x74
        lever_heavy_p19, // 0x75
        lever_light_p19, // 0x76
        stock_sn_heavy_p20, // 0x77
        stock_sn_tactical_p20, // 0x78
        pgrip_tac_p20, // 0x79
        comb_hvy_p20, // 0x7a
        comb_tac_p20, // 0x7b
        stock_ar_p02, // 0x7c
        bar_sm_long_p04, // 0x7d
        bar_sm_light_p04, // 0x7e
        bar_sm_short_p04, // 0x7f
        iw9_ironsdefault_beta, // 0x80
        bar_sm_long_p02, // 0x81
        bar_sm_short_p02, // 0x82
        bar_sm_light_p02, // 0x83
        stockno_sm_p02, // 0x84
        bar_sm_hvyxlong_p09, // 0x85
        bar_sm_xlong_p09, // 0x86
        bar_sm_long_p09, // 0x87
        bar_sm_hvylong_p09, // 0x88
        bar_sm_heavy_p09, // 0x89
        bar_sm_short_p09, // 0x8a
        bar_sm_hvyshort_p09, // 0x8b
        stock_sm_heavy_p09, // 0x8c
        stock_sm_p09, // 0x8d
        stock_sm_tactical_p09, // 0x8e
        stockno_sm_p09, // 0x8f
        mag_sm_small_p09, // 0x90
        mag_sm_large_p09, // 0x91
        mag_sm_xlarge_p09, // 0x92
        pgrip_aim_p09, // 0x93
        pgrip_ass_p09, // 0x94
        pgrip_tac_p09, // 0x95
        bar_lm_heavy_p15, // 0x96
        bar_lm_long_p15, // 0x97
        bar_lm_short_p15, // 0x98
        stock_lm_lgttactical_p15, // 0x99
        stockno_lm_p15, // 0x9a
        stock_lm_p15, // 0x9b
        stock_lm_tactical_p15, // 0x9c
        stock_lm_heavy_p15, // 0x9d
        belt_lm_large_p15, // 0x9e
        mag_lm_small_p15, // 0x9f
        pgrip_ass_p15, // 0xa0
        pgrip_tac_p15, // 0xa1
        pgrip_p15, // 0xa2
        bar_lm_long_p04, // 0xa3
        bar_lm_light_p04, // 0xa4
        stock_lmg_heavy_p04, // 0xa5
        bar_lm_short_p16, // 0xa6
        bar_lm_hvy_p16, // 0xa7
        bar_lm_long_p16, // 0xa8
        stock_lm_assault_p16, // 0xa9
        stock_lm_light_p16, // 0xaa
        stock_lm_tactical_p16, // 0xab
        belt_lm_large_p16, // 0xac
        belt_lm_small_p16, // 0xad
        pgrip_aim_p16, // 0xae
        pgrip_ass_p16, // 0xaf
        pgrip_tac_p16, // 0xb0
        stockr_sn_heavy_p20, // 0xb1
        stockr_sn_tactical_p20, // 0xb2
        mag_sn_p20, // 0xb3
        iw9_snprscope_alpha50, // 0xb4
        bar_sn_long_p21, // 0xb5
        bar_sn_short_p21, // 0xb6
        barsil_sn_long_p21, // 0xb7
        stock_sn_heavy_p21, // 0xb8
        stock_sn_light_p21, // 0xb9
        stock_sn_tactical_p21, // 0xba
        mag_sn_small_p21, // 0xbb
        mag_sn_large_p21, // 0xbc
        snprscope_mromeo, // 0xbd
        pgrip_aim_p21, // 0xbe
        pgrip_ass_p21, // 0xbf
        pgrip_tac_p21, // 0xc0
        bolt_hvy_p21, // 0xc1
        bolt_lgt_p21, // 0xc2
        bar_sn_long_p22, // 0xc3
        bar_sn_light_p22, // 0xc4
        stock_sn_heavy_p22, // 0xc5
        stock_sn_tactical_p22, // 0xc6
        stock_sn_light_p22, // 0xc7
        mag_sn_large_p22, // 0xc8
        limax_snprscope, // 0xc9
        br_rangeext_snpr, // 0xca
        pgrip_aim_p22, // 0xcb
        pgrip_ass_p22, // 0xcc
        pgrip_tac_p22, // 0xcd
        bar_pi_heavy_p24, // 0xce
        bar_pi_light_p24, // 0xcf
        stockp_sm_tactical_p24, // 0xd0
        stockp_sm_light_p24, // 0xd1
        stockp_pi_p24, // 0xd2
        stockno_pi_p24, // 0xd3
        mag_pi_large_p24, // 0xd4
        mag_pi_xlarge_p24, // 0xd5
        drum_pi_p24, // 0xd6
        pgrip_aim_p24, // 0xd7
        pgrip_ass_p24, // 0xd8
        pgrip_tac_p24, // 0xd9
        bar_sm_lngheavy_p24, // 0xda
        bar_sm_p24, // 0xdb
        stockp_sm_heavy_p24, // 0xdc
        bar_pi_long_p27, // 0xdd
        bar_pi_light_p27, // 0xde
        bar_pi_short_p27, // 0xdf
        mag_pi_large_p27, // 0xe0
        mag_pi_xlarge_p27, // 0xe1
        hammer_sa_p27, // 0xe2
        akimbo_papa220, // 0xe3
        pgrip_aim_p27, // 0xe4
        pgrip_ass_p27, // 0xe5
        pgrip_tac_p27, // 0xe6
        trigger_heavy_p27, // 0xe7
        trigger_hair_p27, // 0xe8
        ironsdefault, // 0xe9
        ironsdefault_mpapa5, // 0xea
        ironsdefault_mpapa7, // 0xeb
        ironsdefault_decho, // 0xec
        rec_akilo, // 0xed
        ironsdefault_akilo, // 0xee
        selectsemi_akilo, // 0xef
        ammo_762s, // 0xf0
        grip_angled01, // 0xf1
        pgrip_p04, // 0xf2
        rec_akilo105, // 0xf3
        ironsdefault_akilo105, // 0xf4
        ammo_545s, // 0xf5
        rec_akilo74, // 0xf6
        bar_ar_short_p04, // 0xf7
        ironsdefault_akilo74, // 0xf8
        iw9_rec_augolf, // 0xf9
        iw9_ironsdefault_augolf, // 0xfa
        ammo_556n, // 0xfb
        pgrip_p03, // 0xfc
        comb_tactical_p03, // 0xfd
        rec_kilo53, // 0xfe
        bar_ar_p02, // 0xff
        mag_ar_p02, // 0x100
        ironsdefault_kilo53, // 0x101
        iw9_rec_mcharlie, // 0x102
        bar_ar_p08, // 0x103
        bar_ar_long_p08, // 0x104
        bar_ar_short_p08, // 0x105
        stock_ar_p08, // 0x106
        stock_sm_light_p08, // 0x107
        mag_ar_p08, // 0x108
        mag_ar_xlarge_p08, // 0x109
        mag_ar_large_p08, // 0x10a
        iw9_ironsdefault_mcharlie, // 0x10b
        rec_mike16, // 0x10c
        bar_ar_p01, // 0x10d
        stock_ar_p01, // 0x10e
        mag_ar_p01, // 0x10f
        ironsdefault_mike16, // 0x110
        pgrip_p01, // 0x111
        iw9_rec_mike4, // 0x112
        iw9_ironsdefault_mike4, // 0x113
        flashlight_box01, // 0x114
        flashlight_cyl01, // 0x115
        rec_golf3, // 0x116
        ironsdefault_golf3, // 0x117
        selectauto_golf3, // 0x118
        ammo_762n, // 0x119
        rec_schotel, // 0x11a
        bar_br_p05, // 0x11b
        pgrip_p05, // 0x11c
        rec_msecho, // 0x11d
        bar_br_heavy_p01, // 0x11e
        ironsdefault_msecho, // 0x11f
        ammo_458s, // 0x120
        rec_sa700, // 0x121
        stockr_dm_p20, // 0x122
        ironsdefault_sa700, // 0x123
        bolt_p20, // 0x124
        iw9_rec_sbeta, // 0x125
        bar_dm_p19, // 0x126
        stockr_dm_p19, // 0x127
        tube_6_45gvt, // 0x128
        ammo_45gvt, // 0x129
        comb_p19, // 0x12a
        lever_p19, // 0x12b
        rec_xmike2010, // 0x12c
        stock_sn_p20, // 0x12d
        ironsdefault_xmike2010, // 0x12e
        ammo_300wm, // 0x12f
        chas_xmike2010, // 0x130
        iw9_rec_mike14, // 0x131
        stock_dm_heavy_p18, // 0x132
        mag_sn_p18, // 0x133
        mag_sn_large_p18, // 0x134
        iw9_ironsdefault_mike14, // 0x135
        pgrip_dm_p18, // 0x136
        pgrip_aim_p18, // 0x137
        pgrip_ass_p18, // 0x138
        pgrip_tac_p18, // 0x139
        comb_tactical_p18, // 0x13a
        comb_ammo_p18, // 0x13b
        comb_ergo_p18, // 0x13c
        rec_mike24, // 0x13d
        ironsdefault_mike24, // 0x13e
        rec_pgolf1, // 0x13f
        bar_sn_p02, // 0x140
        ironsdefault_pgolf1, // 0x141
        rec_alpha57, // 0x142
        bar_sm_p01, // 0x143
        bar_sm_long_p01, // 0x144
        barsil_sm_p01, // 0x145
        stock_sm_light_p01, // 0x146
        stockno_sm_p01, // 0x147
        mag_sm_p01, // 0x148
        ironsdefault_alpha57, // 0x149
        ammo_5x28, // 0x14a
        rec_aviktor, // 0x14b
        bar_sm_p04, // 0x14c
        ironsdefault_aviktor, // 0x14d
        ammo_9p, // 0x14e
        iw9_rec_beta, // 0x14f
        bar_sm_lgtshort_p04, // 0x150
        rec_mpapa5_mp, // 0x151
        bar_sm_p02, // 0x152
        rec_mpapa7, // 0x153
        bar_sm_p09, // 0x154
        stock_sm_light_p09, // 0x155
        mag_sm_p09, // 0x156
        ammo_4x30, // 0x157
        pgrip_p09, // 0x158
        iw9_rec_victor, // 0x159
        bar_sm_short_p10, // 0x15a
        barsil_sm_hvylong_p10, // 0x15b
        bar_sm_p10, // 0x15c
        barsil_sm_long_p10, // 0x15d
        bar_sm_long_p10, // 0x15e
        bar_sm_lgtshort_p10, // 0x15f
        stock_sm_light_p10, // 0x160
        stock_sm_heavy_p10, // 0x161
        stock_sm_p10, // 0x162
        stock_sm_tactical_p10, // 0x163
        stock_sm_lgttactical_p10, // 0x164
        stockno_sm_p10, // 0x165
        mag_p10, // 0x166
        mag_small_p10, // 0x167
        drum_p10, // 0x168
        iw9_ironsdefault_victor, // 0x169
        ammo_45acp, // 0x16a
        pgrip_p10, // 0x16b
        pgrip_ass_p10, // 0x16c
        pgrip_aim_p10, // 0x16d
        pgrip_tac_p10, // 0x16e
        rec_foxtrot, // 0x16f
        bar_lm_p01, // 0x170
        bar_lm_long_p01, // 0x171
        bar_lm_short_p01, // 0x172
        belt_lm_p01, // 0x173
        belt_lm_large_p01, // 0x174
        ironsdefault_foxtrot, // 0x175
        rec_kilo21, // 0x176
        ironsdefault_kilo21, // 0x177
        iw9_rec_mkilo3, // 0x178
        bar_sm_p15, // 0x179
        stock_lm_light_p15, // 0x17a
        belt_lm_p15, // 0x17b
        iw9_ironsdefault_mkilo3, // 0x17c
        pgrip_aim_p15, // 0x17d
        firerate_adverse_p15, // 0x17e
        rec_rkilo, // 0x17f
        bar_lm_p04, // 0x180
        ironsdefault_rkilo, // 0x181
        rec_slima, // 0x182
        bar_lm_p16, // 0x183
        stock_lm_p16, // 0x184
        belt_lm_p16, // 0x185
        ironsdefault_slima, // 0x186
        ammo_338nm, // 0x187
        pgrip_p16, // 0x188
        rec_la700, // 0x189
        stockr_sn_p20, // 0x18a
        ironsdefault_la700, // 0x18b
        rec_alpha50, // 0x18c
        ammo_50b, // 0x18d
        rec_mromeo, // 0x18e
        bar_sn_p21, // 0x18f
        stock_sn_p21, // 0x190
        mag_sn_p21, // 0x191
        pgrip_p21, // 0x192
        bolt_p21, // 0x193
        rec_limax, // 0x194
        bar_sn_heavy_p22, // 0x195
        stock_sn_p22, // 0x196
        mag_sn_p22, // 0x197
        pgrip_p22, // 0x198
        rec_decho, // 0x199
        bar_pi_p25, // 0x19a
        barbrake_pi_p25, // 0x19b
        barcomp_pi_p25, // 0x19c
        bar_pi_long_p25, // 0x19d
        bar_pi_hvylong_p25, // 0x19e
        stockno_pi_p25, // 0x19f
        mag_pi_p25, // 0x1a0
        mag_pi_large_p25, // 0x1a1
        mag_pi_xlarge_p25, // 0x1a2
        ammo_50p, // 0x1a3
        iw9_akimbo_decho, // 0x1a4
        silencer_decho, // 0x1a5
        pgrip_p25, // 0x1a6
        pgrip_aim_p25, // 0x1a7
        pgrip_ass_p25, // 0x1a8
        pgrip_tac_p25, // 0x1a9
        trigger_p25, // 0x1aa
        trigger_light_p25, // 0x1ab
        trigger_heavy_p25, // 0x1ac
        trigger_hair_p25, // 0x1ad
        rec_golf17, // 0x1ae
        rec_auto_golf17, // 0x1af
        bar_pi_p24, // 0x1b0
        mag_pi_p24, // 0x1b1
        ironsdefault_golf17, // 0x1b2
        pgrip_p24, // 0x1b3
        bar_sm_heavy_p24, // 0x1b4
        ironsdefault_romeo18_pdw, // 0x1b5
        trigger_p24, // 0x1b6
        rec_papa220, // 0x1b7
        bar_pi_p27, // 0x1b8
        mag_pi_p27, // 0x1b9
        ironsdefault_papa220, // 0x1ba
        hammer_da_p27, // 0x1bb
        pgrip_p27, // 0x1bc
        trigger_light_p27, // 0x1bd
        rec_gromeo, // 0x1be
        rec_juliet, // 0x1bf
        rec_kgolf, // 0x1c0
        rec_mike32, // 0x1c1
        rec_rpapa7, // 0x1c2
        hybrid05, // 0x1c3
        hybrid06, // 0x1c4
        ub_glmini01_xmags, // 0x1c5
        ub_gl01_xmags, // 0x1c6
        mag_br_large_p05, // 0x1c7
        ironsdefault_soscar14, // 0x1c8
        iw9_selectsemi, // 0x1c9
        pgrip_ar_ass_p02, // 0x1ca
        pgrip_ar_snp_p02, // 0x1cb
        pgrip_ar_p02, // 0x1cc
        pgrip_ar_aim_p02, // 0x1cd
        pgrip_ar_tac_p02, // 0x1ce
        iw9_rec_scharlie, // 0x1cf
        bar_ar_p05, // 0x1d0
        mag_ar_p05, // 0x1d1
        mag_ar_large_p05, // 0x1d2
        mag_ar_xlarge_p05, // 0x1d3
        iw9_ironsdefault_scharlie, // 0x1d4
        ub_gl_scharlie, // 0x1d5
        rec_scsierra, // 0x1d6
        bar_ar_light_p05, // 0x1d7
        bar_ar_lgtshort_p05, // 0x1d8
        bar_ar_lgtlong_p05, // 0x1d9
        ironsdefault_scsierra, // 0x1da
        pgrip_br_ass_p02, // 0x1db
        pgrip_br_snp_p02, // 0x1dc
        pgrip_br_p02, // 0x1dd
        pgrip_br_aim_p02, // 0x1de
        pgrip_br_tac_p02, // 0x1df
        selectauto_msecho, // 0x1e0
        rec_soscar14, // 0x1e1
        pgrip_dm_ass_p02, // 0x1e2
        pgrip_dm_aim_p02, // 0x1e3
        pgrip_dm_p02, // 0x1e4
        pgrip_dm_snp_p02, // 0x1e5
        pgrip_dm_tac_p02, // 0x1e6
        rec_scromeo, // 0x1e7
        bar_sn_p05, // 0x1e8
        bar_sn_short_p05, // 0x1e9
        bar_sn_long_p05, // 0x1ea
        stock_sn_light_p05, // 0x1eb
        mag_sn_p05, // 0x1ec
        mag_sn_large_p05, // 0x1ed
        mag_sn_xlarge_p05, // 0x1ee
        ironsdefault_scromeo, // 0x1ef
        ammo_65cm, // 0x1f0
        pgrip_sm_ass_p02, // 0x1f1
        pgrip_sm_p02, // 0x1f2
        pgrip_sm_aim_p02, // 0x1f3
        pgrip_sm_tac_p02, // 0x1f4
        ammo_762n_db, // 0x1f5
        pgrip_lm_ass_p02, // 0x1f6
        pgrip_lm_aim_p02, // 0x1f7
        pgrip_lm_p02, // 0x1f8
        pgrip_lm_tac_p02, // 0x1f9
        iw9_rec_charlie725, // 0x1fa
        bar_sh_p14, // 0x1fb
        bar_sh_xlong_p14, // 0x1fc
        bar_sh_long_p14, // 0x1fd
        bar_sh_short_p14, // 0x1fe
        stockr_sh_p14, // 0x1ff
        stockr_sh_tactical_p14, // 0x200
        stockr_sh_assault_p14, // 0x201
        stockr_sh_heavy_p14, // 0x202
        stockno_sh_p14, // 0x203
        ammo_12g_db, // 0x204
        iw9_ironsdefault_charlie725, // 0x205
        br_rangeext_shtgn, // 0x206
        wounded_shotgun, // 0x207
        rec_mbravo, // 0x208
        bar_sh_p13, // 0x209
        bar_sh_heavy_p13, // 0x20a
        bar_sh_light_p13, // 0x20b
        bar_sh_short_p13, // 0x20c
        bar_sh_hvylong_p13, // 0x20d
        bar_sh_hvyshort_p13, // 0x20e
        ironsdefault_mbravo, // 0x20f
        guard_p13, // 0x210
        guard_chainsaw_p13, // 0x211
        guard_vert_p13, // 0x212
        guard_tactical_p13, // 0x213
        guard_angled_p13, // 0x214
        guard_heavy_p13, // 0x215
        guard_light_p13, // 0x216
        iw9_minireddot01_tall, // 0x217
        iw9_minireddot02_tall, // 0x218
        iw9_minireddot03_tall, // 0x219
        iw9_minireddot04_tall, // 0x21a
        iw9_minireddot05_tall, // 0x21b
        iw9_minireddot06_tall, // 0x21c
        iw9_minireddot07_tall, // 0x21d
        reflex01_tall, // 0x21e
        reflex02_tall, // 0x21f
        reflex03_tall, // 0x220
        reflex04_tall, // 0x221
        reflex05_tall, // 0x222
        reflex06_tall, // 0x223
        reflex07_tall, // 0x224
        reflex08_tall, // 0x225
        reflex09_tall, // 0x226
        holo04, // 0x227
        holo05, // 0x228
        holo06, // 0x229
        holotherm01, // 0x22a
        holorange01, // 0x22b
        fourx04, // 0x22c
        fourx05, // 0x22d
        fourxtherm01, // 0x22e
        fourxtherm02, // 0x22f
        fourxtherm03, // 0x230
        fourxtherm04, // 0x231
        hybrid07, // 0x232
        hybridrange01, // 0x233
        hybridtherm01, // 0x234
        arscope01, // 0x235
        arscope02, // 0x236
        arscope_vz01, // 0x237
        arscope_vz02, // 0x238
        arscope_nvgvz01, // 0x239
        arscope_nvg01, // 0x23a
        arscope_nvg02, // 0x23b
        arscope_therm01, // 0x23c
        hybridscope_ar01, // 0x23d
        barsil_ar_p08, // 0x23e
        bar_ar_hvy_short_p08, // 0x23f
        mag_ar_heavy_p08, // 0x240
        mag_ar_hvysmall_p08, // 0x241
        mag_ar_hvylarge_p08, // 0x242
        ironsdefault_mcbravo, // 0x243
        ammo_blk, // 0x244
        pgrip_ar2_p08, // 0x245
        pgrip_ar2_aim_p08, // 0x246
        pgrip_ar2_ass_p08, // 0x247
        pgrip_ar2_tac_p08, // 0x248
        rec_mcbravo, // 0x249
        pgrip_ar_p08, // 0x24a
        pgrip_ar_aim_p08, // 0x24b
        pgrip_ar_ass_p08, // 0x24c
        pgrip_ar_tac_p08, // 0x24d
        bar_ar_lgtshort_p01, // 0x24e
        dmscope01, // 0x24f
        dmscope_vz01, // 0x250
        dmscope_vz02, // 0x251
        dmscope_therm01, // 0x252
        vzscope_dm_01_2x, // 0x253
        dynamic_null_equipment, // 0x254
        iw9_me_knife, // 0x255
        iw9_minireddot05, // 0x256
        iw9_minireddot06, // 0x257
        reflex05, // 0x258
        reflex06, // 0x259
        reflex07, // 0x25a
        reflex08, // 0x25b
        shscope01, // 0x25c
        shscope02, // 0x25d
        snscope01, // 0x25e
        snscope_vz01, // 0x25f
        snscope_therm01, // 0x260
        snscope_rf01, // 0x261
        snscope_drop01, // 0x262
        selectauto_soscar, // 0x263
        ballistics_nogravity_mike14, // 0x264
        me_hatchet02, // 0x265
        bar_lm_p03, // 0x266
        ironsdefault_ahotel, // 0x267
        rec_ahotel, // 0x268
        dynamic_null_dblmg, // 0x269
        bar_lm_short_p17, // 0x26a
        bar_lm_p17, // 0x26b
        bar_lm_long_p17, // 0x26c
        stock_lm_p17, // 0x26d
        stock_lm_heavy_p17, // 0x26e
        stock_lm_assault_p17, // 0x26f
        stock_lm_light_p17, // 0x270
        belt_lm_p17, // 0x271
        belt_lm_large_p17, // 0x272
        belt_lm_xlarge_p17, // 0x273
        ironsdefault_ngolf7, // 0x274
        pgrip_p17, // 0x275
        pgrip_ass_p17, // 0x276
        pgrip_aim_p17, // 0x277
        pgrip_tac_p17, // 0x278
        rec_ngolf7, // 0x279
        ammo_45acp_notracer, // 0x27a
        ammo_12g, // 0x27b
        bar_sh_light_p12, // 0x27c
        bar_sh_short_p12, // 0x27d
        bartube_sh_short_p12, // 0x27e
        bartube_sh_p12, // 0x27f
        bar_sh_heavy_p12, // 0x280
        stock_sh_light_p12, // 0x281
        stockno_sh_p12, // 0x282
        stockr_sh_heavy_p12, // 0x283
        stock_sh_p12, // 0x284
        ironsdefault_mike1014, // 0x285
        pgrip_p12, // 0x286
        pgrip_aim_p12, // 0x287
        pgrip_ass_p12, // 0x288
        pgrip_tac_p12, // 0x289
        bolt_p12, // 0x28a
        rec_mike1014, // 0x28b
        mag_sh_p13, // 0x28c
        mag_sh_small_p13, // 0x28d
        mag_sh_large_p13, // 0x28e
        ironsdefault_mviktor, // 0x28f
        rec_mviktor, // 0x290
        ironsdefault_apapa, // 0x291
        rec_apapa, // 0x292
        bar_sm_p08, // 0x293
        bar_sm_long_p08, // 0x294
        barsil_sm_p08, // 0x295
        bar_sm_short_p08, // 0x296
        bar_sm_lgtshort_p08, // 0x297
        stockno_sm_p08, // 0x298
        mag_sm_p08, // 0x299
        mag_sm_small_p08, // 0x29a
        drum_sm_p08, // 0x29b
        ironsdefault_mpapax, // 0x29c
        pgrip_sm_p08, // 0x29d
        pgrip_sm_aim_p08, // 0x29e
        pgrip_sm_ass_p08, // 0x29f
        pgrip_sm_tac_p08, // 0x2a0
        rec_mpapax, // 0x2a1
        bar_sm_short_p07, // 0x2a2
        bar_sm_p07, // 0x2a3
        bar_sm_long_p07, // 0x2a4
        bar_sm_heavy_p07, // 0x2a5
        bar_sm_hvylong_p07, // 0x2a6
        barsil_sm_p07, // 0x2a7
        barsil_sm_long_p07, // 0x2a8
        stock_sm_light_p07, // 0x2a9
        mag_sm_p07, // 0x2aa
        iw9_ironsdefault_papa90, // 0x2ab
        pgrip_p07, // 0x2ac
        pgrip_aim_p07, // 0x2ad
        pgrip_ass_p07, // 0x2ae
        pgrip_tac_p07, // 0x2af
        comb_tactical_p07, // 0x2b0
        comb_ergo_p07, // 0x2b1
        comb_heavy_p07, // 0x2b2
        iw9_rec_papa90, // 0x2b3
        bar_sn_p23, // 0x2b4
        bar_sn_long_p23, // 0x2b5
        bar_sn_short_p23, // 0x2b6
        bar_sn_heavy_p23, // 0x2b7
        bar_sn_hvyshort_p23, // 0x2b8
        stock_sn_p23, // 0x2b9
        stock_sn_heavy_p23, // 0x2ba
        stock_sn_tac_p23, // 0x2bb
        stock_sn_assault_p23, // 0x2bc
        mag_sn_p23, // 0x2bd
        mag_sn_large_p23, // 0x2be
        mag_sn_xlarge_p23, // 0x2bf
        pgrip_aim_p23, // 0x2c0
        pgrip_ass_p23, // 0x2c1
        pgrip_tac_p23, // 0x2c2
        pgrip_aim_stockass_p23, // 0x2c3
        pgrip_aim_stockhvyass_p23, // 0x2c4
        pgrip_aim_stocksn_p23, // 0x2c5
        pgrip_aim_stocktac_p23, // 0x2c6
        pgrip_ass_stockass_p23, // 0x2c7
        pgrip_ass_stockhvyass_p23, // 0x2c8
        pgrip_ass_stocksn_p23, // 0x2c9
        pgrip_ass_stocktac_p23, // 0x2ca
        pgrip_tac_stockass_p23, // 0x2cb
        pgrip_tac_stockhvy_p23, // 0x2cc
        pgrip_tac_stocksn_p23, // 0x2cd
        pgrip_tac_stocktac_p23, // 0x2ce
        bgrip_sn_p23, // 0x2cf
        bgrip_sn_hvy_p23, // 0x2d0
        dynamic_null_spotterscope, // 0x2d1
        dynamic_null_launcher, // 0x2d2
        dynamic_null_gromeo, // 0x2d3
        dynamic_null_juliette, // 0x2d4
        xmags_cp_juliet, // 0x2d5
        dynamic_null_kgolf, // 0x2d6
        dynamic_null_mike32, // 0x2d7
        dynamic_null_rpapa7, // 0x2d8
        laserbox_ads01, // 0x2d9
        laserbox_ads02, // 0x2da
        laserbox_ads03, // 0x2db
        laserbox_ads04, // 0x2dc
        laserbox_ads05, // 0x2dd
        laserbox_hip01, // 0x2de
        laserbox_hip02, // 0x2df
        laserbox_hip03, // 0x2e0
        laserbox_hip04, // 0x2e1
        flashlight_box02, // 0x2e2
        lasercyl_ads01, // 0x2e3
        lasercyl_ads02, // 0x2e4
        lasercyl_ads03, // 0x2e5
        lasercyl_ads04, // 0x2e6
        lasercyl_ads05, // 0x2e7
        lasercyl_hip01, // 0x2e8
        lasercyl_hip02, // 0x2e9
        lasercyl_hip03, // 0x2ea
        lasercyl_hip04, // 0x2eb
        flashlight_cyl02, // 0x2ec
        laserpstl_ads01, // 0x2ed
        laserpstl_ads02, // 0x2ee
        laserpstl_hip01, // 0x2ef
        laserpstl_hip02, // 0x2f0
        flashlight_pstl01, // 0x2f1
        flashlight_pstl02, // 0x2f2
        ammo_762s_fr, // 0x2f3
        ammo_762s_hp, // 0x2f4
        ammo_762s_tr, // 0x2f5
        ammo_762s_ap, // 0x2f6
        ammo_762s_op, // 0x2f7
        ammo_762s_hv, // 0x2f8
        ammo_762s_db, // 0x2f9
        ammo_545s_fr, // 0x2fa
        ammo_545s_hp, // 0x2fb
        ammo_545s_tr, // 0x2fc
        ammo_545s_ap, // 0x2fd
        ammo_545s_op, // 0x2fe
        ammo_545s_hv, // 0x2ff
        ammo_556n_fr, // 0x300
        ammo_556n_hp, // 0x301
        ammo_556n_tr, // 0x302
        ammo_556n_ap, // 0x303
        ammo_556n_op, // 0x304
        ammo_556n_hv, // 0x305
        ammo_556n_db, // 0x306
        ammo_762n_fr, // 0x307
        ammo_762n_hp, // 0x308
        ammo_762n_tr, // 0x309
        ammo_762n_ap, // 0x30a
        ammo_762n_op, // 0x30b
        ammo_762n_hv, // 0x30c
        stock_ar_light_p08, // 0x30d
        ammo_blk_fr, // 0x30e
        ammo_blk_hp, // 0x30f
        ammo_blk_ap, // 0x310
        ammo_blk_op, // 0x311
        ammo_12g_sl, // 0x312
        ammo_12g_he, // 0x313
        ammo_458s_fr, // 0x314
        ammo_458s_hp, // 0x315
        ammo_458s_tr, // 0x316
        ammo_458s_ap, // 0x317
        ammo_458s_op, // 0x318
        ammo_458s_hv, // 0x319
        ammo_300wm_fr, // 0x31a
        ammo_300wm_hp, // 0x31b
        ammo_300wm_ap, // 0x31c
        ammo_300wm_op, // 0x31d
        ammo_300wm_hv, // 0x31e
        ammo_300wm_db, // 0x31f
        ammo_45gvt_fr, // 0x320
        ammo_45gvt_hp, // 0x321
        ammo_45gvt_ap, // 0x322
        ammo_45gvt_op, // 0x323
        ammo_45gvt_hv, // 0x324
        ammo_45gvt_db, // 0x325
        ammo_65c_hp, // 0x326
        ammo_65c_ap, // 0x327
        ammo_65c_fr, // 0x328
        ammo_65c_op, // 0x329
        ammo_65c_hv, // 0x32a
        ammo_65c_db, // 0x32b
        ammo_338nm_fr, // 0x32c
        ammo_338nm_hp, // 0x32d
        ammo_338nm_ap, // 0x32e
        ammo_338nm_op, // 0x32f
        ammo_338nm_hv, // 0x330
        ammo_338nm_db, // 0x331
        ammo_50p_fr, // 0x332
        ammo_50p_hp, // 0x333
        ammo_50p_tr, // 0x334
        ammo_50p_ap, // 0x335
        ammo_50p_op, // 0x336
        ammo_9p_fr, // 0x337
        ammo_9p_hp, // 0x338
        ammo_9p_tr, // 0x339
        ammo_9p_ap, // 0x33a
        ammo_9p_op, // 0x33b
        trigger_heavy_p24, // 0x33c
        trigger_light_p24, // 0x33d
        trigger_hair_p24, // 0x33e
        ammo_45acp_fr, // 0x33f
        ammo_45acp_hp, // 0x340
        ammo_45acp_ap, // 0x341
        ammo_45acp_op, // 0x342
        ammo_5x28_fr, // 0x343
        ammo_5x28_hp, // 0x344
        ammo_5x28_tr, // 0x345
        ammo_5x28_ap, // 0x346
        ammo_5x28_op, // 0x347
        ammo_4x30_fr, // 0x348
        ammo_4x30_hp, // 0x349
        ammo_4x30_tr, // 0x34a
        ammo_4x30_ap, // 0x34b
        ammo_4x30_op, // 0x34c
        ammo_50b_fr, // 0x34d
        ammo_50b_ap, // 0x34e
        ammo_50b_hv, // 0x34f
        ammo_50b_db, // 0x350
        ammo_50b_he, // 0x351
        laserir_box, // 0x352
        laserir_cyl, // 0x353
        laserir_pstl, // 0x354
        bar_dm_p38, // 0x355
        bar_dm_heavy_p38, // 0x356
        bar_dm_light_p38, // 0x357
        bar_dm_hvyass_p38, // 0x358
        bar_dm_tac_p38, // 0x359
        stock_dm_p38, // 0x35a
        stock_dm_heavy_p38, // 0x35b
        stock_dm_light_p38, // 0x35c
        stock_dm_hvyass_p38, // 0x35d
        stock_dm_tac_p38, // 0x35e
        mag_dm_p38, // 0x35f
        iw9_ironsdefault_crossbow, // 0x360
        ammo_bolt_std, // 0x361
        ammo_bolt_he, // 0x362
        bgrip_p38, // 0x363
        wire_dm_p38, // 0x364
        wire_hvy_p38, // 0x365
        wire_lgt_p38, // 0x366
        iw9_rec_crossbow, // 0x367
        bar_pi_xshort_p26, // 0x368
        bar_pi_short_p26, // 0x369
        bar_pi_p26, // 0x36a
        bar_pi_light_p26, // 0x36b
        bar_pi_long_p26, // 0x36c
        cylinder_pi_p26, // 0x36d
        ironsdefault_swhiskey, // 0x36e
        piscope01, // 0x36f
        speedloader_hvy_p26, // 0x370
        speedloader_lgt_p26, // 0x371
        ammo_500sw, // 0x372
        ammo_500sw_ap, // 0x373
        ammo_500sw_fr, // 0x374
        ammo_500sw_hp, // 0x375
        ammo_500sw_op, // 0x376
        ammo_500sw_ss, // 0x377
        pgrip_p26, // 0x378
        pgrip_ass_p26, // 0x379
        pgrip_aim_p26, // 0x37a
        pgrip_tac_p26, // 0x37b
        trigger_p26, // 0x37c
        trigger_hair_p26, // 0x37d
        trigger_heavy_p26, // 0x37e
        trigger_light_p26, // 0x37f
        laserhip_dim_p26, // 0x380
        laserhip_bright_p26, // 0x381
        laserads_bright_p26, // 0x382
        rec_swhiskey, // 0x383
        ub_gl_akilo, // 0x384
        grip_angled03, // 0x385
        grip_angled04, // 0x386
        grip_angled05, // 0x387
        grip_angled06, // 0x388
        grip_angled07, // 0x389
        grip_angled08, // 0x38a
        grip_angled09, // 0x38b
        grip_angled10, // 0x38c
        grip_angled11, // 0x38d
        grip_angled12, // 0x38e
        grip_angled13, // 0x38f
        grip_angled14, // 0x390
        grip_vert04, // 0x391
        grip_vert05, // 0x392
        grip_vertshort03, // 0x393
        grip_vertshort04, // 0x394
        grip_vertshort05, // 0x395
        bipod01, // 0x396
        bipod02, // 0x397
        bipod03, // 0x398
        bipodgrip_small, // 0x399
        grip_vertshort06, // 0x39a
        grip_vertshort07, // 0x39b
        bgrip_hvy_p03, // 0x39c
        bgrip_lgt_p03, // 0x39d
        wounded_ar, // 0x39e
        selectsemi_schotel, // 0x39f
        wounded_dmr, // 0x3a0
        wounded_pistol, // 0x3a1
        onehand, // 0x3a2
        wounded_sniper, // 0x3a3
        guard_p19, // 0x3a4
        guard_heavy_p19, // 0x3a5
        guard_light_p19, // 0x3a6
        guard_tactical_p19, // 0x3a7
        bipod_ahotel, // 0x3a8
        laserads_bright_dblmg, // 0x3a9
        bipod_mkilo3, // 0x3aa
        gripside_large_p17, // 0x3ab
        gripside_med_p17, // 0x3ac
        gripside_small_p17, // 0x3ad
        bipod_ngolf7, // 0x3ae
        bipod_rkilo, // 0x3af
        gripside_small_p16, // 0x3b0
        gripside_med_p16, // 0x3b1
        gripside_large_p16, // 0x3b2
        bipod_slima, // 0x3b3
        iw9_me_hammer, // 0x3b4
        onehand_decho, // 0x3b5
        akimbo_golf17, // 0x3b6
        onehand_mike1911, // 0x3b7
        guard_p14, // 0x3b8
        guard_heavy_p14, // 0x3b9
        guard_light_p14, // 0x3ba
        guard_tactical_p14, // 0x3bb
        guard_p12, // 0x3bc
        guard_light_p12, // 0x3bd
        guard_tactical_p12, // 0x3be
        guard_heavy_p12, // 0x3bf
        rail_sm_p07, // 0x3c0
        railreflex_sm_p07, // 0x3c1
        rail_sm_small_p07, // 0x3c2
        ammo_50b_intercept, // 0x3c3
        mod_infil_alpha50, // 0x3c4
        ammo_50b_shipaf, // 0x3c5
        ub_gl_akilo_xmags, // 0x3c6
        flash_br_01, // 0x3c7
        flash_br_02, // 0x3c8
        flash_br_03, // 0x3c9
        silencer01_br, // 0x3ca
        silencer02_br, // 0x3cb
        silencer03_br, // 0x3cc
        silencer04_br, // 0x3cd
        silencer05_br, // 0x3ce
        silencer06_br, // 0x3cf
        silencer07_br, // 0x3d0
        comp_br_01, // 0x3d1
        comp_br_02, // 0x3d2
        comp_br_03, // 0x3d3
        comp_br_04, // 0x3d4
        comp_br_05, // 0x3d5
        comp_br_06, // 0x3d6
        breacher_br_01, // 0x3d7
        breacher_br_02, // 0x3d8
        flash_ar_01, // 0x3d9
        flash_ar_02, // 0x3da
        flash_ar_03, // 0x3db
        flash_ar_04, // 0x3dc
        silencer01_ar, // 0x3dd
        silencer02_ar, // 0x3de
        silencer03_ar, // 0x3df
        silencer04_ar, // 0x3e0
        silencer05_ar, // 0x3e1
        silencer06_ar, // 0x3e2
        silencer07_ar, // 0x3e3
        silencer08_ar, // 0x3e4
        comp_ar_01, // 0x3e5
        comp_ar_02, // 0x3e6
        comp_ar_03, // 0x3e7
        comp_ar_04, // 0x3e8
        comp_ar_05, // 0x3e9
        comp_ar_06, // 0x3ea
        comp_ar_07, // 0x3eb
        comp_ar_08, // 0x3ec
        breacher_ar_01, // 0x3ed
        breacher_ar_02, // 0x3ee
        silencer01_pi, // 0x3ef
        silencer02_pi, // 0x3f0
        silencer03_pi, // 0x3f1
        silencer04_pi, // 0x3f2
        comp_pi_01, // 0x3f3
        comp_pi_02, // 0x3f4
        comp_pi_03, // 0x3f5
        comp_pi_04, // 0x3f6
        comp_pi_05, // 0x3f7
        comp_pi_06, // 0x3f8
        flash_pi_01, // 0x3f9
        flash_pi_02, // 0x3fa
        breacher_pi_01, // 0x3fb
        silencer01_sh, // 0x3fc
        silencer02_sh, // 0x3fd
        silencer03_sh, // 0x3fe
        silencer04_sh, // 0x3ff
        comp_sh_01, // 0x400
        comp_sh_02, // 0x401
        comp_sh_03, // 0x402
        flash_sh_01, // 0x403
        flash_sh_02, // 0x404
        breacher_sh_01, // 0x405
        breacher_sh_02, // 0x406
        choke_sh01, // 0x407
        choke_sh02, // 0x408
        choke_sh03, // 0x409
        choke_sh04, // 0x40a
        silencer01_sm, // 0x40b
        silencer02_sm, // 0x40c
        silencer03_sm, // 0x40d
        silencer04_sm, // 0x40e
        silencer05_sm, // 0x40f
        silencer06_sm, // 0x410
        silencer07_sm, // 0x411
        comp_sm_01, // 0x412
        comp_sm_02, // 0x413
        comp_sm_03, // 0x414
        comp_sm_04, // 0x415
        comp_sm_05, // 0x416
        comp_sm_06, // 0x417
        comp_sm_07, // 0x418
        comp_sm_08, // 0x419
        flash_sm_01, // 0x41a
        flash_sm_02, // 0x41b
        breacher_sm_01, // 0x41c
        flash_dm_01, // 0x41d
        flash_dm_02, // 0x41e
        flash_dm_03, // 0x41f
        flash_dm_04, // 0x420
        silencer01_dm, // 0x421
        silencer02_dm, // 0x422
        silencer03_dm, // 0x423
        silencer04_dm, // 0x424
        silencer05_dm, // 0x425
        silencer06_dm, // 0x426
        comp_dm_01, // 0x427
        comp_dm_02, // 0x428
        comp_dm_03, // 0x429
        comp_dm_04, // 0x42a
        comp_dm_05, // 0x42b
        comp_decho_01, // 0x42c
        comp_decho_02, // 0x42d
        comp_decho_03, // 0x42e
        comp_decho_04, // 0x42f
        flash_decho_01, // 0x430
        comp_swhiskey_01, // 0x431
        comp_swhiskey_02, // 0x432
        comp_swhiskey_03, // 0x433
        flash_swhiskey_01, // 0x434
        silencer1_charlie725, // 0x435
        silencer2_charlie725, // 0x436
        silencer3_charlie725, // 0x437
        comp_charlie725_01, // 0x438
        comp_charlie725_02, // 0x439
        breacher_charlie725_01, // 0x43a
        charlie725_choke01, // 0x43b
        charlie725_choke02, // 0x43c
        charlie725_choke03, // 0x43d
        charlie725_choke04, // 0x43e
        comb_heavy_p12, // 0x43f
        comb_ammo_p12, // 0x440
        silencer1_victor, // 0x441
        silencer01_sn, // 0x442
        silencer02_sn, // 0x443
        silencer03_sn, // 0x444
        silencer04_sn, // 0x445
        silencer05_sn, // 0x446
        comp_sn_01, // 0x447
        comp_sn_02, // 0x448
        comp_sn_03, // 0x449
        flash_sn_01, // 0x44a
        flash_sn_02, // 0x44b
        bar_sn_hvylong_p22, // 0x44c
        vzscope_mromeo, // 0x44d
        selectburst_mpapa5, // 0x44e
        bar_lm_light_p04_akilo, // 0x44f
        bar_ar_hvylong_p04_akilo, // 0x450
        bar_ar_long_p04_akilo, // 0x451
        bar_ar_heavy_p04_akilo, // 0x452
        bar_ar_p04_akilo, // 0x453
        bar_ar_hvyshort_p04_akilo, // 0x454
        stock_lmg_p04_akilo, // 0x455
        stock_ar_p04_akilo, // 0x456
        stock_ar_tactical_p04_akilo, // 0x457
        stock_sm_p04_akilo, // 0x458
        stock_ar_light_p04_akilo, // 0x459
        bar_ar_hvylong_p04_akilo105, // 0x45a
        bar_ar_long_p04_akilo105, // 0x45b
        bar_ar_heavy_p04_akilo105, // 0x45c
        bar_ar_p04_akilo105, // 0x45d
        bar_ar_hvyshort_p04_akilo105, // 0x45e
        stock_lmg_p04_akilo105, // 0x45f
        stock_ar_heavy_p04_akilo105, // 0x460
        stock_ar_p04_akilo105, // 0x461
        stock_ar_tactical_p04_akilo105, // 0x462
        stock_sm_p04_akilo105, // 0x463
        stock_ar_light_p04_akilo105, // 0x464
        stock_lmg_p04_akilo74, // 0x465
        stock_ar_heavy_p04_akilo74, // 0x466
        stock_ar_p04_akilo74, // 0x467
        stock_ar_tactical_p04_akilo74, // 0x468
        stock_sm_p04_akilo74, // 0x469
        stock_sm_light_p04_akilo74, // 0x46a
        stockno_sm_p04_akilo74, // 0x46b
        barsil_lm_p03_augolf, // 0x46c
        bar_lm_heavy_p03_augolf, // 0x46d
        bar_ar_heavy_p03_augolf, // 0x46e
        bargrip_ar_long_p03_augolf, // 0x46f
        bar_ar_long_p03_augolf, // 0x470
        bar_ar_p03_augolf, // 0x471
        bar_ar_light_p03_augolf, // 0x472
        stock_ar_p03_augolf, // 0x473
        stock_sm_p03_augolf, // 0x474
        stock_lm_p03_augolf, // 0x475
        bar_lm_long_p02_golf3, // 0x476
        bar_br_p02_golf3, // 0x477
        bar_ar_p02_golf3, // 0x478
        bar_br_light_p02_golf3, // 0x479
        bar_lm_short_p02_golf3, // 0x47a
        bar_ar_short_p02_golf3, // 0x47b
        bar_lm_p02_golf3, // 0x47c
        stock_sn_p02_golf3, // 0x47d
        stock_lm_p02_golf3, // 0x47e
        stock_ar_p02_golf3, // 0x47f
        stock_ar_assault_p02_golf3, // 0x480
        stock_ar_tactical_p02_golf3, // 0x481
        stock_sm_p02_golf3, // 0x482
        bar_ar_p02_kilo53, // 0x483
        bar_br_light_p02_kilo53, // 0x484
        bar_lm_short_p02_kilo53, // 0x485
        bar_ar_short_p02_kilo53, // 0x486
        bar_lm_p02_kilo53, // 0x487
        stock_sn_p02_kilo53, // 0x488
        stock_lm_p02_kilo53, // 0x489
        stock_ar_p02_kilo53, // 0x48a
        stock_ar_assault_p02_kilo53, // 0x48b
        stock_ar_tactical_p02_kilo53, // 0x48c
        stock_sm_p02_kilo53, // 0x48d
        bar_ar_longhvy_p01_mike16, // 0x48e
        bar_ar_heavy_p01_mike16, // 0x48f
        bar_ar_p01_mike16, // 0x490
        bar_ar_shorthvy_p01_mike16, // 0x491
        bar_ar_short_p01_mike16, // 0x492
        stock_ar_p01_mike16, // 0x493
        stock_ar_tactical_p01_mike16, // 0x494
        stock_ar_light_p01_mike16, // 0x495
        stock_ar_assault_p01_mike16, // 0x496
        stock_sn_p01_mike16, // 0x497
        bar_ar_heavy_p01_mike4, // 0x498
        bar_ar_lgtshort_p01_mike4, // 0x499
        bar_ar_light_p01_mike4, // 0x49a
        bar_ar_long_p01_mike4, // 0x49b
        bar_ar_longhvy_p01_mike4, // 0x49c
        bar_ar_p01_mike4, // 0x49d
        bar_ar_short_p01_mike4, // 0x49e
        bar_ar_shorthvy_p01_mike4, // 0x49f
        stock_ar_p01_mike4, // 0x4a0
        stock_ar_tactical_p01_mike4, // 0x4a1
        stock_ar_light_p01_mike4, // 0x4a2
        stock_sm_p01_mike4, // 0x4a3
        stock_ar_assault_p01_mike4, // 0x4a4
        stock_sn_p01_mike4, // 0x4a5
        bar_ar_light_p01_msecho, // 0x4a6
        bar_ar_p01_msecho, // 0x4a7
        bar_ar_long_p01_msecho, // 0x4a8
        bar_ar_lgtshort_p01_msecho, // 0x4a9
        stock_ar_p01_msecho, // 0x4aa
        stock_ar_tactical_p01_msecho, // 0x4ab
        stock_ar_light_p01_msecho, // 0x4ac
        bar_sn_heavy_p20_la700, // 0x4ad
        bar_sn_p20_la700, // 0x4ae
        bar_sn_light_p20_la700, // 0x4af
        bar_dm_p20_la700, // 0x4b0
        comb_ammo_p20_mike24, // 0x4b1
        comb_ammo_p20_la700, // 0x4b2
        fourxtherm04_highzoom, // 0x4b3
        bar_sn_p20_mike24, // 0x4b4
        bar_sn_light_p20_mike24, // 0x4b5
        barsil_dm_p20_mike24, // 0x4b6
        bar_dm_p20_mike24, // 0x4b7
        bar_dm_short_p20_mike24, // 0x4b8
        bar_dm_light_p20_mike24, // 0x4b9
        bar_br_p02_pgolf1, // 0x4ba
        bar_ar_p02_pgolf1, // 0x4bb
        stock_sn_p02_pgolf1, // 0x4bc
        stock_lm_p02_pgolf1, // 0x4bd
        stock_ar_p02_pgolf1, // 0x4be
        stock_ar_assault_p02_pgolf1, // 0x4bf
        stock_ar_tactical_p02_pgolf1, // 0x4c0
        barsil_dm_p20_sa700, // 0x4c1
        bar_dm_p20_sa700, // 0x4c2
        bar_dm_short_p20_sa700, // 0x4c3
        bar_dm_light_p20_sa700, // 0x4c4
        fourxtherm02_highzoom, // 0x4c5
        bar_sn_heavy_p20_xmike2010, // 0x4c6
        bar_sn_p20_xmike2010, // 0x4c7
        bar_sn_light_p20_xmike2010, // 0x4c8
        bar_dm_p20_xmike2010, // 0x4c9
        barsil_lm_p03_ahotel, // 0x4ca
        bar_lm_heavy_p03_ahotel, // 0x4cb
        bar_ar_heavy_p03_ahotel, // 0x4cc
        bargrip_ar_long_p03_ahotel, // 0x4cd
        stock_ar_p03_ahotel, // 0x4ce
        stock_sm_p03_ahotel, // 0x4cf
        stock_lm_p03_ahotel, // 0x4d0
        stock_ar_p01_foxtrot, // 0x4d1
        stock_ar_tactical_p01_foxtrot, // 0x4d2
        stock_ar_light_p01_foxtrot, // 0x4d3
        stock_ar_assault_p01_foxtrot, // 0x4d4
        stock_sn_p01_foxtrot, // 0x4d5
        bar_lm_long_p02_kilo21, // 0x4d6
        bar_br_p02_kilo21, // 0x4d7
        bar_ar_p02_kilo21, // 0x4d8
        bar_lm_short_p02_kilo21, // 0x4d9
        bar_lm_p02_kilo21, // 0x4da
        stock_lm_p02_kilo21, // 0x4db
        stock_ar_p02_kilo21, // 0x4dc
        stock_ar_assault_p02_kilo21, // 0x4dd
        stock_ar_tactical_p02_kilo21, // 0x4de
        bar_lm_light_p04_rkilo, // 0x4df
        bar_ar_hvylong_p04_rkilo, // 0x4e0
        stock_lmg_p04_rkilo, // 0x4e1
        stock_ar_heavy_p04_rkilo, // 0x4e2
        stock_ar_light_p04_rkilo, // 0x4e3
        rec_golf18, // 0x4e4
        akimbo_swhiskey, // 0x4e5
        comp_charlie725_03, // 0x4e6
        bartube_sh_heavy_p13, // 0x4e7
        bartube_sh_hvylong_p13, // 0x4e8
        bartube_sh_hvyshort_p13, // 0x4e9
        bartube_sh_lgtshort_p13, // 0x4ea
        bartube_sh_light_p13, // 0x4eb
        bartube_sh_p13, // 0x4ec
        bartube_sh_short_p13, // 0x4ed
        bolt_lgt_p12, // 0x4ee
        bolt_hvy_p12, // 0x4ef
        stock_ar_p01_alpha57, // 0x4f0
        stock_ar_tactical_p01_alpha57, // 0x4f1
        stock_ar_light_p01_alpha57, // 0x4f2
        stock_sm_p01_alpha57, // 0x4f3
        bar_ar_long_p03_apapa, // 0x4f4
        bar_ar_p03_apapa, // 0x4f5
        bar_ar_light_p03_apapa, // 0x4f6
        stock_ar_p03_apapa, // 0x4f7
        stock_sm_p03_apapa, // 0x4f8
        stock_lm_p03_apapa, // 0x4f9
        ammo_9s, // 0x4fa
        ammo_9s_fr, // 0x4fb
        ammo_9s_hp, // 0x4fc
        ammo_9s_ap, // 0x4fd
        ammo_9s_op, // 0x4fe
        stock_ar_p04_aviktor, // 0x4ff
        stock_ar_tactical_p04_aviktor, // 0x500
        stock_sm_p04_aviktor, // 0x501
        stock_sm_light_p04_aviktor, // 0x502
        stockno_sm_p04_aviktor, // 0x503
        stock_ar_p04_beta, // 0x504
        stock_ar_tactical_p04_beta, // 0x505
        stock_sm_p04_beta, // 0x506
        stock_sm_light_p04_beta, // 0x507
        stockno_sm_p04_beta, // 0x508
        ammo_9m, // 0x509
        ammo_9m_fr, // 0x50a
        ammo_9m_hp, // 0x50b
        ammo_9m_ap, // 0x50c
        ammo_9m_op, // 0x50d
        stock_ar_p02_mpapa5, // 0x50e
        stock_ar_assault_p02_mpapa5, // 0x50f
        stock_ar_tactical_p02_mpapa5, // 0x510
        stock_sm_p02_mpapa5, // 0x511
        mag_ar_p04, // 0x512
        mag_ar_small_p04, // 0x513
        mag_ar_large_p04, // 0x514
        mag_ar_p04_akilo, // 0x515
        mag_ar_large_p04_akilo, // 0x516
        mag_ar_lgtxlarge_p04, // 0x517
        mag_ar_lgtsmall_p04_akilo105, // 0x518
        mag_ar_light_p04_akilo105, // 0x519
        mag_ar_lgtlarge_p04_akilo105, // 0x51a
        mag_ar_lgtsmall_p04_akilo74, // 0x51b
        mag_ar_light_p04_akilo74, // 0x51c
        mag_ar_lgtlarge_p04_akilo74, // 0x51d
        mag_ar_p03_augolf, // 0x51e
        mag_ar_large_p03_augolf, // 0x51f
        drum_br_p02, // 0x520
        mag_br_large_p02_golf3, // 0x521
        mag_br_p02_golf3, // 0x522
        mag_sn_large_p02_golf3, // 0x523
        mag_sn_p02_golf3, // 0x524
        mag_ar_small_p01, // 0x525
        mag_br_p01, // 0x526
        mag_br_small_p01, // 0x527
        mag_br_large_p01, // 0x528
        mag_sn_p02_pgolf1, // 0x529
        mag_sn_large_p02_pgolf1, // 0x52a
        mag_br_p02_pgolf1, // 0x52b
        drum_lm_p03, // 0x52c
        mag_lm_large_p03, // 0x52d
        mag_ar_p03_ahotel, // 0x52e
        mag_ar_large_p03_ahotel, // 0x52f
        belt_lm_p02, // 0x530
        belt_lm_large_p02, // 0x531
        drum_lm_p04, // 0x532
        drum_lm_large_p04, // 0x533
        mag_ar_p04_rkilo, // 0x534
        mag_ar_large_p04_rkilo, // 0x535
        mag_sm_p03, // 0x536
        mag_sm_large_p03, // 0x537
        mag_sm_p04, // 0x538
        mag_sm_large_p04, // 0x539
        magheli_sm_p04, // 0x53a
        magheligrip_sm_p04, // 0x53b
        mag_sm_p02, // 0x53c
        mag_sm_small_p02, // 0x53d
        mag_sm_large_p02, // 0x53e
        drum_sm_p02, // 0x53f
        stock_sm_tactical_p04_akilo, // 0x540
        hybridtherm02, // 0x541
        stock_sm_tactical_p04_akilo105, // 0x542
        stock_sm_tactical_p04_akilo74, // 0x543
        stock_ar_p08_mcbravo, // 0x544
        stock_ar_tactical_p08_mcbravo, // 0x545
        stock_ar_tactical_p08_mcharlie, // 0x546
        stock_sm_light_p08_mcharlie, // 0x547
        stock_sm_p08_mcharlie, // 0x548
        stock_ar_heavy_p05_scharlie, // 0x549
        stock_ar_p05_scharlie, // 0x54a
        stock_ar_tactical_p05_scharlie, // 0x54b
        stock_sn_p05_scharlie, // 0x54c
        stock_ar_p05_schotel, // 0x54d
        stock_ar_tactical_p05_schotel, // 0x54e
        stock_sn_p05_schotel, // 0x54f
        stock_ar_heavy_p05_schotel, // 0x550
        stock_ar_tactical_p05_scsierra, // 0x551
        stock_ar_p05_scsierra, // 0x552
        dmscope02, // 0x553
        hybrid05_le, // 0x554
        hybridtherm02_le, // 0x555
        hybridscope_sn01_le, // 0x556
        stock_ar_assault_p01_msecho, // 0x557
        stock_sn_p01_msecho, // 0x558
        stock_dm_light_p18_soscar14, // 0x559
        stock_dm_tac_p18_soscar14, // 0x55a
        stockr_dm_p18_soscar14, // 0x55b
        xmag_sn_p20, // 0x55c
        stock_dm_tac_p18_mike14, // 0x55d
        stockr_dm_p18_mike14, // 0x55e
        mag_dm_p20_mike24, // 0x55f
        mag_dm_large_p20_mike24, // 0x560
        mag_dm_xlarge_p20_mike24, // 0x561
        mag_dm_p20_sa700, // 0x562
        mag_dm_large_p20_sa700, // 0x563
        mag_dm_xlarge_p20_sa700, // 0x564
        stock_ar_p05_scromeo, // 0x565
        stock_ar_heavy_p05_scromeo, // 0x566
        stock_sn_p05_scromeo, // 0x567
        fourx_aug, // 0x568
        stock_ar_tactical_p04_rkilo, // 0x569
        stock_ar_p04_rkilo, // 0x56a
        ironsdefault_golf17_stockp, // 0x56b
        tacknife, // 0x56c
        stockpno_sm_p24, // 0x56d
        ammo_12g_sl_charlie725, // 0x56e
        ammo_12g_he_charlie725, // 0x56f
        stockr_sh_p13_mbravo, // 0x570
        stockr_sh_heavy_p13_mbravo, // 0x571
        stock_sh_heavy_p13_mbravo, // 0x572
        stock_sh_tactical_p13_mbravo, // 0x573
        stock_sh_light_p13_mbravo, // 0x574
        stockno_sh_p13_mbravo, // 0x575
        stockno_sh_light_p13_mbravo, // 0x576
        tube_8_12g_mbravo, // 0x577
        ammo_12g_he_mbravo, // 0x578
        ammo_12g_sl_mbravo, // 0x579
        ammo_12g_db_mbravo, // 0x57a
        ammo_12g_he_mike1014, // 0x57b
        ammo_12g_sl_mike1014, // 0x57c
        ammo_12g_db_mike1014, // 0x57d
        ammo_12g_db_oromeo12, // 0x57e
        stockr_sh_p13_mviktor, // 0x57f
        stockr_sh_heavy_p13_mviktor, // 0x580
        stock_sh_heavy_p13_mviktor, // 0x581
        stock_sh_tactical_p13_mviktor, // 0x582
        stock_sh_light_p13_mviktor, // 0x583
        stockno_sh_p13_mviktor, // 0x584
        stockno_sh_light_p13_mviktor, // 0x585
        ammo_12g_he_mviktor, // 0x586
        ammo_12g_sl_mviktor, // 0x587
        ammo_12g_db_mviktor, // 0x588
        stock_sm_tactical_p04_aviktor, // 0x589
        stock_sm_tactical_p04_beta, // 0x58a
        stock_sm_p08_mpapax, // 0x58b
        stock_ar_tactical_p08_mpapax, // 0x58c
        stock_sm_p07, // 0x58d
        stock_sm_tactical_p07, // 0x58e
        stock_sm_assault_p07, // 0x58f
        stock_sm_heavy_p07, // 0x590
        railreflex_sm_reflex_p07, // 0x591
        rail_lgt_irons_p07, // 0x592
        bar_ar_light_p08, // 0x593
        bar_ar_lgt_short_p08, // 0x594
        bar_ar_short_p05, // 0x595
        bar_ar_long_p05, // 0x596
        bar_dm_p18_soscar14, // 0x597
        bar_dm_heavy_p18_soscar14, // 0x598
        bar_br_p18_soscar14, // 0x599
        bar_br_heavy_p18_soscar14, // 0x59a
        bar_br_short_p18_soscar14, // 0x59b
        drum_br_p18, // 0x59c
        mag_br_large_p18, // 0x59d
        mag_br_p18_soscar14, // 0x59e
        bar_dm_short_p20_la700, // 0x59f
        bar_dm_p18_mike14, // 0x5a0
        bar_dm_heavy_p18_mike14, // 0x5a1
        bar_br_heavy_p18_mike14, // 0x5a2
        bar_br_p18_mike14, // 0x5a3
        bar_br_short_p18_mike14, // 0x5a4
        mag_br_p18_mike14, // 0x5a5
        bar_dm_lgtshort_p20, // 0x5a6
        barsil_dm_p19, // 0x5a7
        bar_dm_short_p20_xmike2010, // 0x5a8
        barcomp_pi_p27, // 0x5a9
        bar_pi_heavy_p26, // 0x5aa
        tube_2_12g_charlie725, // 0x5ab
        bartube_sh_long_p13, // 0x5ac
        tube_3_12g_mbravo, // 0x5ad
        tube_5_12g_mbravo, // 0x5ae
        tube_6_12g_mbravo, // 0x5af
        bar_sh_p12, // 0x5b0
        tube_5_12g_mike1014, // 0x5b1
        tube_7_12g_mike1014, // 0x5b2
        tube_10_12g_mike1014, // 0x5b3
        bar_sn_p22, // 0x5b4
        stock_sm_p05_scharlie, // 0x5b5
        stock_ar_tactical_p05_scromeo, // 0x5b6
        pgrip_p01_foxtrot, // 0x5b7
        fourx06, // 0x5b8
        bar_lm_light_p15, // 0x5b9
        bar_lm_hvylong_p17, // 0x5ba
        bar_sh_hvylong_p14, // 0x5bb
        stock_sh_tactical_p12, // 0x5bc
        stockr_br_heavy_p18, // 0x5bd
        stock_dm_heavy_p20, // 0x5be
        stock_dm_tactical_p20, // 0x5bf
        stockno_dm_p20, // 0x5c0
        ammo_308w, // 0x5c1
        ammo_308w_fr, // 0x5c2
        ammo_308w_hp, // 0x5c3
        ammo_308w_ap, // 0x5c4
        ammo_308w_op, // 0x5c5
        ammo_308w_hv, // 0x5c6
        ammo_308w_db, // 0x5c7
        stockno_lm_p16, // 0x5c8
        stock_sn_hvy2_p23, // 0x5c9
        pgrip_snp_p05, // 0x5ca
        selectsemi_kilo53, // 0x5cb
        kilo21_sidegrip02, // 0x5cc
        kilo21_sidegrip03, // 0x5cd
        ironsbarshort_papa220, // 0x5ce
        ironsbarlong_papa220, // 0x5cf
        ironsbarheavy_swhiskey, // 0x5d0
        pgrip_p20_sa700, // 0x5d1
        pgrip_p20_xmike2010, // 0x5d2
        iw9_minireddot03_tall_p01, // 0x5d3
        reflex07_tall_p01, // 0x5d4
        holo02_p01, // 0x5d5
        fourx04_p01, // 0x5d6
        arscope_therm01_p01, // 0x5d7
        ub_gl01_p01, // 0x5d8
        silencer03_ar_p01, // 0x5d9
        comp_ar_06_p01, // 0x5da
        breacher_ar_01_p01, // 0x5db
        grip_angled09_p01, // 0x5dc
        grip_vert05_p01, // 0x5dd
        laserbox_hip01_p01, // 0x5de
        pgrip_p04_akilo105, // 0x5df
        pgolf1_scope, // 0x5e0
        akimbo_golf18, // 0x5e1
        ammo_12g_db_charlie725, // 0x5e2
        beadiron_short_mbravo, // 0x5e3
        beadiron_mbravo, // 0x5e4
        laserbox_ads05_mromeo, // 0x5e5
        selectsemi_mike4, // 0x5e6
        test_roll_0, // 0x5e7
        test_roll_25, // 0x5e8
        test_roll_50, // 0x5e9
        test_roll_75, // 0x5ea
        test_roll_100, // 0x5eb
        pgrip_snp_p27, // 0x5ec
        ammo_300nm, // 0x5ed
        ammo_300nm_ap, // 0x5ee
        ammo_300nm_db, // 0x5ef
        ammo_300nm_fr, // 0x5f0
        ammo_300nm_hp, // 0x5f1
        ammo_300nm_hv, // 0x5f2
        ammo_300nm_op, // 0x5f3
        comb_default_heavy_p12, // 0x5f4
        comb_default_ammo_p12, // 0x5f5
        snscope03, // 0x5f6
        snscope02, // 0x5f7
        ironsdefault_mike4_mike16, // 0x5f8
        ironsdefault_mike16_mike4, // 0x5f9
        breacher_sm_02, // 0x5fa
        iw9_minireddot01_pstl, // 0x5fb
        iw9_minireddot02_pstl, // 0x5fc
        iw9_minireddot03_pstl, // 0x5fd
        iw9_minireddot04_pstl, // 0x5fe
        iw9_minireddot05_pstl, // 0x5ff
        iw9_minireddot06_pstl, // 0x600
        bar_sm_light_p24, // 0x601
        iron_mromeo, // 0x602
        iron_mromeo_laser, // 0x603
        selectsemi_mcbravo, // 0x604
        bar_sh_p04, // 0x605
        drum_sh_p04, // 0x606
        ironsdefault_vecho, // 0x607
        pgrip_p04_vecho, // 0x608
        bolt_p04, // 0x609
        rec_vecho, // 0x60a
        bar_ar_p43, // 0x60b
        stock_ar_p43, // 0x60c
        mag_ar_p43, // 0x60d
        ironsdefault_acharlie300, // 0x60e
        pgrip_p43, // 0x60f
        rec_acharlie300, // 0x610
        bar_sh_lgtshort_p04, // 0x611
        bar_sh_short_p04, // 0x612
        bar_sh_lgtlong_p04, // 0x613
        bar_sh_hvyshort_p04, // 0x614
        bar_sh_light_p04, // 0x615
        bar_sh_hvylong_p04, // 0x616
        bar_sh_long_p04, // 0x617
        bar_sh_hvylong2_p04, // 0x618
        stock_ar_p04_vecho, // 0x619
        stock_ar_tactical_p04_vecho, // 0x61a
        stock_sm_tactical_p04_vecho, // 0x61b
        stock_sm_p04_vecho, // 0x61c
        stock_sm_light_p04_vecho, // 0x61d
        stockno_sm_p04_vecho, // 0x61e
        mag_sh_large_p04, // 0x61f
        mag_sh_p04, // 0x620
        ammo_12g_sl_vecho, // 0x621
        ammo_12g_db_vecho, // 0x622
        ammo_12g_he_vecho, // 0x623
        comp_sh_05, // 0x624
        pgrip_snp_p04, // 0x625
        bolt_hvy_p04, // 0x626
        bolt_lgt_p04, // 0x627
        ammo_blk_p43, // 0x628
        ammo_blk_ap_p43, // 0x629
        ammo_blk_fr_p43, // 0x62a
        ammo_blk_hp_p43, // 0x62b
        ammo_blk_op_p43, // 0x62c
        ammo_blk_tuning_p43, // 0x62d
        ammo_blk_tuning_sil_p43, // 0x62e
        stock_ar_heavy_p04_akilo, // 0x62f
        stock_sm_p05_schotel, // 0x630
        selectsemi_mike16, // 0x631
        stock_sh_light_p04_akilo, // 0x632
        stock_sh_tactical_p04_akilo, // 0x633
        stock_sh_light_p04_akilo105, // 0x634
        stock_sh_tactical_p04_akilo105, // 0x635
        stock_sh_light_p04_akilo74, // 0x636
        stock_sh_light_p04_rkilo, // 0x637
        stock_sh_tactical_p04_rkilo, // 0x638
        stock_sh_light_p04_vecho, // 0x639
        stock_sh_tactical_p04_vecho, // 0x63a
        stock_sh_light_p04_aviktor, // 0x63b
        stock_sh_light_p04_beta, // 0x63c
        bar_dm_p01, // 0x63d
        mag_dm_p01, // 0x63e
        guard_p01, // 0x63f
        ironsdefault_stango25, // 0x640
        rec_stango25, // 0x641
        bar_ar_lgtshort_p43, // 0x642
        bar_ar_short_p43, // 0x643
        barsil_ar_p43, // 0x644
        bar_ar_long_p43, // 0x645
        bar_ar_heavy_p43, // 0x646
        stock_ar_lgt_tactical_p43, // 0x647
        stock_ar_tactical_p43, // 0x648
        stock_ar_heavy_p43, // 0x649
        stock_ar_light_p43, // 0x64a
        stockno_ar_p43, // 0x64b
        mag_ar_hvylarge_p43, // 0x64c
        mag_ar_heavy_p43, // 0x64d
        mag_ar_hvysmall_p43, // 0x64e
        mag_ar_large_p43, // 0x64f
        mag_ar_small_p43, // 0x650
        pgrip_ass_p43, // 0x651
        pgrip_tac_p43, // 0x652
        pgrip_ske_p43, // 0x653
        pgrip_snp_p43, // 0x654
        bipodgrip_skel, // 0x655
        stock_dm_light_p18_mike14, // 0x656
        comp_sh_04, // 0x657
        hybridscope_ar02, // 0x658
        ammo_bolt_db, // 0x659
        ammo_bolt_gas, // 0x65a
        holorange01_pstl, // 0x65b
        ammo_556n_p43, // 0x65c
        ammo_556n_fr_p43, // 0x65d
        ammo_556n_hp_p43, // 0x65e
        ammo_556n_ap_p43, // 0x65f
        ammo_556n_op_p43, // 0x660
        ammo_556n_hv_p43, // 0x661
        stock_dm_p01_mike16, // 0x662
        stock_dm_heavy_p01_mike16, // 0x663
        stock_dm_p01_mike4, // 0x664
        stock_dm_heavy_p01_mike4, // 0x665
        stock_dm_p01_msecho, // 0x666
        stock_dm_heavy_p01_msecho, // 0x667
        barsil_dm_p01, // 0x668
        bar_dm_short_p01, // 0x669
        bar_dm_long_p01, // 0x66a
        bar_dm_lgtshort_p01, // 0x66b
        stock_dm_p01_stango25, // 0x66c
        stock_ar_p01_stango25, // 0x66d
        stock_ar_tactical_p01_stango25, // 0x66e
        stock_ar_light_p01_stango25, // 0x66f
        stock_ar_assault_p01_stango25, // 0x670
        stock_sn_p01_stango25, // 0x671
        stock_dm_heavy_p01_stango25, // 0x672
        mag_dm_large_p01, // 0x673
        drum_dm_p01, // 0x674
        guard_tac_p01, // 0x675
        guard_hvy_p01, // 0x676
        guard_lgt_p01, // 0x677
        stock_dm_p01_foxtrot, // 0x678
        stock_dm_heavy_p01_foxtrot, // 0x679
        stock_dm_p01_alpha57, // 0x67a
        dmscope_vz03, // 0x67b
        bar_br_p42, // 0x67c
        bar_br_short_p42, // 0x67d
        bar_br_long_p42, // 0x67e
        bar_br_heavy_p42, // 0x67f
        stock_br_p42, // 0x680
        stock_br_light_p42, // 0x681
        stock_br_heavy_p42, // 0x682
        stock_br_tactical_p42, // 0x683
        mag_br_p42, // 0x684
        mag_br_large_p42, // 0x685
        drum_br_p42, // 0x686
        comb_p42, // 0x687
        comb_ergo_p42, // 0x688
        comb_heavy_p42, // 0x689
        ironsdefault_ngsierra, // 0x68a
        ammo_277f, // 0x68b
        ammo_277f_ap, // 0x68c
        ammo_277f_cp, // 0x68d
        ammo_277f_fr, // 0x68e
        ammo_277f_hp, // 0x68f
        ammo_277f_hv, // 0x690
        ammo_277f_op, // 0x691
        silencer08_br, // 0x692
        pgrip_p42, // 0x693
        pgrip_ass_p42, // 0x694
        pgrip_aim_p42, // 0x695
        pgrip_tac_p42, // 0x696
        pgrip_ske_p42, // 0x697
        rec_ngsierra, // 0x698
        bar_sn_p53, // 0x699
        stock_sn_p53, // 0x69a
        mag_sn_p53, // 0x69b
        guard_p53, // 0x69c
        iw9_snprscope_india, // 0x69d
        ammo_408c, // 0x69e
        pgrip_p53, // 0x69f
        bolt_p53, // 0x6a0
        rec_india, // 0x6a1
        mag_sn_p20_xmike2010, // 0x6a2
        xmag_sn_p20_xmike2010, // 0x6a3
        bar_sn_long_p53, // 0x6a4
        bar_sn_light_p53, // 0x6a5
        bar_sn_short_p53, // 0x6a6
        stock_sn_light_p53, // 0x6a7
        stock_sn_heavy_p53, // 0x6a8
        mag_sn_large_p53, // 0x6a9
        guard_tac_p53, // 0x6aa
        guard_hvy_p53, // 0x6ab
        ammo_408c_ap, // 0x6ac
        ammo_408c_db, // 0x6ad
        ammo_408c_fr, // 0x6ae
        ammo_408c_hp, // 0x6af
        ammo_408c_hv, // 0x6b0
        ammo_408c_op, // 0x6b1
        pgrip_snp_p53, // 0x6b2
        pgrip_ske_p53, // 0x6b3
        bolt_lgt_p53, // 0x6b4
        bolt_hvy_p53, // 0x6b5
        ub_main_tuning, // 0x6b6
        ub_gl_semtex_mini, // 0x6b7
        ub_gl_drill_mini, // 0x6b8
        ub_gl_db_mini, // 0x6b9
        ub_gl_gas_mini, // 0x6ba
        ub_gl_conc_mini, // 0x6bb
        ub_gl_shock_mini, // 0x6bc
        ub_gl_flash_mini, // 0x6bd
        ub_gl_smoke_mini, // 0x6be
        ub_gl_snap_mini, // 0x6bf
        ub_gl_semtex_akilo, // 0x6c0
        ub_gl_drill_akilo, // 0x6c1
        ub_gl_db_akilo, // 0x6c2
        ub_gl_gas_akilo, // 0x6c3
        ub_gl_conc_akilo, // 0x6c4
        ub_gl_shock_akilo, // 0x6c5
        ub_gl_flash_akilo, // 0x6c6
        ub_gl_smoke_akilo, // 0x6c7
        ub_gl_snap_akilo, // 0x6c8
        ub_gl_semtex, // 0x6c9
        ub_gl_drill, // 0x6ca
        ub_gl_db, // 0x6cb
        ub_gl_gas, // 0x6cc
        ub_gl_conc, // 0x6cd
        ub_gl_shock, // 0x6ce
        ub_gl_flash, // 0x6cf
        ub_gl_smoke, // 0x6d0
        ub_gl_snap, // 0x6d1
        ub_gl_semtex_scharlie, // 0x6d2
        ub_gl_drill_scharlie, // 0x6d3
        ub_gl_db_scharlie, // 0x6d4
        ub_gl_gas_scharlie, // 0x6d5
        ub_gl_conc_scharlie, // 0x6d6
        ub_gl_shock_scharlie, // 0x6d7
        ub_gl_flash_scharlie, // 0x6d8
        ub_gl_smoke_scharlie, // 0x6d9
        ub_gl_snap_scharlie, // 0x6da
        barbip_sn_p53, // 0x6db
        barbip_sn_long_p53, // 0x6dc
        bar_pi_p49, // 0x6dd
        stockpno_pi_heavy_p49, // 0x6de
        mag_pi_p49, // 0x6df
        ironsdefault_tango9, // 0x6e0
        pgrip_p49, // 0x6e1
        rec_tango9, // 0x6e2
        snscope03_stpat, // 0x6e3
        unique_sn_alpha50_stpats, // 0x6e4
        lasercyl_ads04_stpat, // 0x6e5
        ammo_556n_db_p43, // 0x6e6
        rec_dechoauto, // 0x6e7
        stock_sn_tactical_p53, // 0x6e8
        ammo_408c_he, // 0x6e9
        ammo_300nm_he, // 0x6ea
        selectsemi_ngsierra, // 0x6eb
        snscope05, // 0x6ec
        bipod_india, // 0x6ed
        bar_pi_short_p49, // 0x6ee
        bar_pi_light_p49, // 0x6ef
        bar_pi_heavy_p49, // 0x6f0
        bar_pi_long_p49, // 0x6f1
        bar_pi_hvylong_p49, // 0x6f2
        barsil_pi_p49, // 0x6f3
        barsil_pi_short_p49, // 0x6f4
        stockp_pi_light_p49, // 0x6f5
        stockp_pi_assault_p49, // 0x6f6
        stockp_pi_tactical_p49, // 0x6f7
        stockp_pi_heavy_p49, // 0x6f8
        mag_pi_small_p49, // 0x6f9
        drum_pi_p49, // 0x6fa
        drum_pi_large_p49, // 0x6fb
        grip_angled_p49, // 0x6fc
        grip_vert_p49, // 0x6fd
        grip_vert_short_p49, // 0x6fe
        silencer01_tango9, // 0x6ff
        pgrip_aim_p49, // 0x700
        pgrip_ass_p49, // 0x701
        pgrip_tac_p49, // 0x702
        bar_ar_p52, // 0x703
        stock_ar_p52, // 0x704
        mag_ar_p52, // 0x705
        comb_p52, // 0x706
        ironsdefault_helima, // 0x707
        pgrip_p52, // 0x708
        rec_helima, // 0x709
        rec_tonfa, // 0x70a
        bar_sm_p43, // 0x70b
        stock_sm_p43, // 0x70c
        mag_sm_p43, // 0x70d
        ironsdefault_acharlie45, // 0x70e
        pgrip_sm_p43, // 0x70f
        rec_acharlie45, // 0x710
        selectsemi_slima, // 0x711
        bar_ar_long_p52, // 0x712
        bar_ar_short_p52, // 0x713
        bar_ar_longhvy_p52, // 0x714
        stock_ar_light_p52, // 0x715
        stock_ar_heavy_p52, // 0x716
        stock_ar_tactical_p52, // 0x717
        mag_ar_large_p52, // 0x718
        mag_ar_xlarge_p52, // 0x719
        comb_tac_p52, // 0x71a
        comb_erg_p52, // 0x71b
        comb_hvy_p52, // 0x71c
        bar_ar_short_reflex_p52, // 0x71d
        bar_ar_longhvy_scope_p52, // 0x71e
        grip_angled_p52, // 0x71f
        pgrip_tac_p52, // 0x720
        pgrip_ske_p52, // 0x721
        pgrip_erg_p52, // 0x722
        bar_sm_short_p43, // 0x723
        bar_sm_heavy_p43, // 0x724
        bar_sm_long_p43, // 0x725
        barsil_sm_p43, // 0x726
        stock_sm_lgt_tactical_p43, // 0x727
        stock_sm_heavy_p43, // 0x728
        stock_sm_light_p43, // 0x729
        stock_sm_assault_p43, // 0x72a
        mag_sm_small_p43, // 0x72b
        mag_sm_large_p43, // 0x72c
        pgrip_sm_erg_p43, // 0x72d
        pgrip_sm_tac_p43, // 0x72e
        pgrip_sm_ass_p43, // 0x72f
        holo03_pstl, // 0x730
        iw9_akimbo_dechoauto, // 0x731
        ironsdefault_tango9_stock, // 0x732
        ironsdefault_dechoauto, // 0x733
        bar_sh_p44, // 0x734
        stock_sh_p44, // 0x735
        mag_sh_p44, // 0x736
        ironsdefault_tsierra12, // 0x737
        ammo_12g_sl_tsierra12, // 0x738
        ammo_12g_db_tsierra12, // 0x739
        ammo_12g_he_tsierra12, // 0x73a
        pgrip_sh_p44, // 0x73b
        trig_sh_p44, // 0x73c
        rec_tsierra12, // 0x73d
        bar_pi_p25_dechoauto, // 0x73e
        mag_pi_p25_dechoauto, // 0x73f
        pgrip_p25_dechoauto, // 0x740
        trigger_p25_dechoauto, // 0x741
        bar_ar_heavy_p52, // 0x742
        akimbo_tango9, // 0x743
        bar_ar_p08_ralpha, // 0x744
        bar_ar_short_p08_ralpha, // 0x745
        bar_ar_long_p08_ralpha, // 0x746
        stock_ar_p08_ralpha, // 0x747
        stock_ar_tactical_p08_ralpha, // 0x748
        stock_sm_p08_ralpha, // 0x749
        stock_sm_light_p08_ralpha, // 0x74a
        mag_ar_heavy2_p08, // 0x74b
        mag_ar_hvylarge2_p08, // 0x74c
        mag_ar_hvyxlarge_p08, // 0x74d
        ironsdefault_ralpha, // 0x74e
        pgrip_p08_ralpha, // 0x74f
        rec_ralpha, // 0x750
        selectsemi_acharlie45, // 0x751
        snscope06, // 0x752
        bar_sn_p54, // 0x753
        barbip_sn_p54, // 0x754
        stock_sn_p54, // 0x755
        mag_sn_p54, // 0x756
        guard_p54, // 0x757
        snscope_walpha, // 0x758
        pgrip_p54, // 0x759
        rec_walpha, // 0x75a
        bipod_walpha, // 0x75b
        bar_ar_lgtlong_p04, // 0x75c
        bar_sh_short_p44, // 0x75d
        bar_sh_long_p44, // 0x75e
        bar_sh_hvylong_p44, // 0x75f
        stock_sh_assault_p44, // 0x760
        stock_sh_heavy_p44, // 0x761
        stock_sh_light_p44, // 0x762
        magheligrip_sh_p44, // 0x763
        pgrip_aim_p44, // 0x764
        pgrip_ass_p44, // 0x765
        pgrip_tac_p44, // 0x766
        pgrip_ske_p44, // 0x767
        trig_sh_light_p44, // 0x768
        trig_sh_heavy_p44, // 0x769
        mag_sn_large_p54, // 0x76a
        mag_sn_xlarge_p54, // 0x76b
        bar_pi_p55, // 0x76c
        mag_pi_p55, // 0x76d
        ironsdefault_mike2011, // 0x76e
        akimbo_mike2011, // 0x76f
        pgrip_p55, // 0x770
        trigger_p55, // 0x771
        rec_mike2011, // 0x772
        ammo_bolt_mol, // 0x773
        pgrip_tac_p24_stock, // 0x774
        ammo_12g_sl_tsierra12_burst, // 0x775
        ammo_12g_sl_tsierra12_semi, // 0x776
        ammo_12g_db_tsierra12_burst, // 0x777
        ammo_12g_db_tsierra12_semi, // 0x778
        ammo_12g_he_tsierra12_burst, // 0x779
        ammo_12g_he_tsierra12_semi, // 0x77a
        ammo_277f_db, // 0x77b
        selectsemi_ralpha, // 0x77c
        bipod_sml_p06, // 0x77d
        equip_frag_rec, // 0x77e
        selfrevive_rec, // 0x77f
        equip_throwingknife_rec, // 0x780
        bipod_med_p06, // 0x781
        ub_sh01_db, // 0x782
        mag_pi_large_p55, // 0x783
        mag_pi_xlarge_p55, // 0x784
        snscope_vz02, // 0x785
        bar_sn_long_p54, // 0x786
        barbip_sn_long_p54, // 0x787
        bar_sn_heavy_p54, // 0x788
        barsil_sn_p54, // 0x789
        barbipsil_sn_p54, // 0x78a
        stock_sn_light_p54, // 0x78b
        stock_sn_tactical_p54, // 0x78c
        pgrip_ass_p54, // 0x78d
        pgrip_tac_p54, // 0x78e
        pgrip_snp_p54, // 0x78f
        ammo_12g_sl_tuning_p44, // 0x790
        selectsemi_kilo21, // 0x791
        bar_ar_short2_p08_ralpha, // 0x792
        stock_ar_lgt_tactical_p08_ralpha, // 0x793
        stockno_ar_p08_ralpha, // 0x794
        stock_ar_lgt_tactical_p08_mcbravo, // 0x795
        stockno_ar_p08_mcbravo, // 0x796
        bar_ar_short2_p08_mcharlie, // 0x797
        stock_ar_lgt_tactical_p08_mcharlie, // 0x798
        stockno_ar_p08_mcharlie, // 0x799
        bar_pi_light_p55, // 0x79a
        bar_pi_heavy_p55, // 0x79b
        barcomp_pi_p55, // 0x79c
        bar_pi_short_p55, // 0x79d
        bar_pi_long_p55, // 0x79e
        barcomp_pi_reflex_p55, // 0x79f
        pgrip_ass_p55, // 0x7a0
        pgrip_aim_p55, // 0x7a1
        pgrip_tac_p55, // 0x7a2
        pgrip_ske_p55, // 0x7a3
        trigger_heavy_p55, // 0x7a4
        trigger_light_p55, // 0x7a5
        trigger_hair_p55, // 0x7a6
        bar_sh_xlong_p14_doom, // 0x7a7
        trigger_sh_p14, // 0x7a8
        hybrid05_le_tall, // 0x7a9
        hybridtherm02_le_tall, // 0x7aa
        hybridscope_sn01_le_tall, // 0x7ab
        pgrip_tac_p24_romeo18, // 0x7ac
        jup_ironsdefault, // 0x7ad
        jup_cp01_sm_coscar635_barsil2, // 0x7ae
        jup_cp01_sm_coscar635_bar_shorthvy2, // 0x7af
        jup_cp01_sm_coscar635_stock, // 0x7b0
        jup_cp01_sm_coscar635_stockno, // 0x7b1
        jup_cp01_sm_coscar635_stock_ultlight, // 0x7b2
        jup_cp01_sm_coscar635_stock_ultlight2, // 0x7b3
        jup_cp01_sm_coscar635_stock_taclight, // 0x7b4
        jup_cp01_sm_coscar635_mag_30_9mm, // 0x7b5
        jup_cp01_sm_coscar635_mag_50_9mm, // 0x7b6
        jup_cp01_sm_coscar635_drum_100_9mm, // 0x7b7
        jup_cp01_sm_coscar635_mag_20_9mm, // 0x7b8
        jup_coscar635_ironsdefault, // 0x7b9
        jup_cp01_sm_coscar635_pgrip, // 0x7ba
        jup_cp01_sm_coscar635_pgrip_ass, // 0x7bb
        jup_cp01_sm_coscar635_pgrip_tac, // 0x7bc
        jup_coscar635_rec, // 0x7bd
        jup_cp08_br_xmike5_bar, // 0x7be
        jup_cp08_br_xmike5_stock, // 0x7bf
        jup_cp08_br_xmike5_pgrip, // 0x7c0
        jup_xmike5_rec, // 0x7c1
        jup_cp24_pi_glima21_bar, // 0x7c2
        jup_cp24_pi_glima21_bar_hvylong, // 0x7c3
        jup_cp24_pi_glima21_bar_light, // 0x7c4
        jup_cp24_sm_glima21_bar_convert, // 0x7c5
        jup_cp24_pi_glima21_stockno, // 0x7c6
        jup_cp24_pi_glima21_mag_13_45acp, // 0x7c7
        jup_cp24_pi_glima21_mag_18_45acp, // 0x7c8
        jup_cp24_pi_glima21_mag_30_45acp, // 0x7c9
        jup_cp24_pi_glima21_drum_40_45acp, // 0x7ca
        jup_wounded_pistol, // 0x7cb
        jup_onehand_mike1911, // 0x7cc
        jup_glima21_ironsdefault, // 0x7cd
        jup_cp24_pi_glima21_pgrip, // 0x7ce
        jup_cp24_pi_glima21_pgrip_aim, // 0x7cf
        jup_cp24_pi_glima21_pgrip_ass, // 0x7d0
        jup_cp24_pi_glima21_pgrip_tac, // 0x7d1
        jup_cp24_pi_glima21_trigger_heavy, // 0x7d2
        jup_cp24_pi_glima21_trigger_light, // 0x7d3
        jup_cp24_pi_glima21_trigger_hair, // 0x7d4
        jup_cp24_pi_glima21_trigger_tac, // 0x7d5
        jup_cp24_pi_glima21_trigger_bi, // 0x7d6
        jup_glima21_rec, // 0x7d7
        jup_jp01_ar_golf36_bar, // 0x7d8
        jup_jp01_ar_golf36_bar_light, // 0x7d9
        jup_jp01_ar_golf36_bar_fusion, // 0x7da
        jup_jp01_ar_golf36_bar_short_heavy, // 0x7db
        jup_jp01_ar_golf36_bar_short, // 0x7dc
        jup_jp01_ar_golf36_stock_heavy, // 0x7dd
        jup_jp01_ar_golf36_stock_assault, // 0x7de
        jup_jp01_ar_golf36_stockno, // 0x7df
        jup_jp01_ar_golf36_mag_20_556n, // 0x7e0
        jup_jp01_ar_golf36_mag_30_556n, // 0x7e1
        jup_jp01_ar_golf36_mag_40_556n, // 0x7e2
        jup_golf36_ironsdefault, // 0x7e3
        jup_golf36_rec, // 0x7e4
        jup_jp01_dm_slima8_bar_heavy, // 0x7e5
        jup_jp01_dm_slima8_bar_heavy_bipod, // 0x7e6
        jup_jp01_dm_slima8_bar_heavy_long, // 0x7e7
        jup_jp01_dm_slima8_bar_fusion, // 0x7e8
        jup_jp01_dm_slima8_bar_short_marksman, // 0x7e9
        jup_jp01_dm_slima8_stock_marksman_rubber, // 0x7ea
        jup_jp01_dm_slima8_stock_marksman_padded, // 0x7eb
        jup_jp01_dm_slima8_mag_20_556n, // 0x7ec
        jup_jp01_dm_slima8_mag_30_556n, // 0x7ed
        jup_jp01_dm_slima8_mag_40_556n, // 0x7ee
        jup_jp05_ar_foxtrot2000_comb_tac, // 0x7ef
        jup_jp05_ar_foxtrot2000_comb_ergo, // 0x7f0
        jup_jp05_ar_foxtrot2000_comb_heavy, // 0x7f1
        jup_slima8_ironsdefault, // 0x7f2
        jup_slima8_rec, // 0x7f3
        jup_mgolf36_ironsdefault, // 0x7f4
        jup_mgolf36_rec, // 0x7f5
        jup_jp02_ar_bromeo2m_bar_heavy, // 0x7f6
        jup_jp02_ar_bromeo2m_bar_heavy_long, // 0x7f7
        jup_jp02_ar_bromeo2m_bar_heavy_short, // 0x7f8
        jup_jp02_ar_bromeo2m_bar_heavy_xshort, // 0x7f9
        jup_jp02_ar_bromeo2m_stock_assault, // 0x7fa
        jup_jp02_ar_bromeo2m_stock_folding, // 0x7fb
        jup_jp02_ar_bromeo2m_stock_heavy, // 0x7fc
        jup_jp02_ar_bromeo2m_stock_heavyskel, // 0x7fd
        jup_jp02_ar_bromeo2m_stock_tacheavy, // 0x7fe
        jup_jp02_ar_bromeo2m_stock_taclight, // 0x7ff
        jup_jp02_ar_bromeo2m_stock_weighted, // 0x800
        jup_jp02_ar_bromeo2m_stockno, // 0x801
        jup_jp02_ar_bromeo2m_mag_20_762s, // 0x802
        jup_jp02_ar_bromeo2m_mag_30_762s, // 0x803
        jup_jp02_ar_bromeo2m_mag_40_762s, // 0x804
        jup_bromeo2m_ironsdefault, // 0x805
        jup_jp02_ar_bromeo2m_pgrip, // 0x806
        jup_jp02_ar_bromeo2m_pgrip_ass, // 0x807
        jup_jp02_ar_bromeo2m_pgrip_grooved, // 0x808
        jup_bromeo2m_rec, // 0x809
        jup_jp02_ar_bromeo805_bar, // 0x80a
        jup_jp02_ar_bromeo805_bar_heavy, // 0x80b
        jup_jp02_ar_bromeo805_bar_heavy_short, // 0x80c
        jup_jp02_ar_bromeo805_bar_heavy_xlong, // 0x80d
        jup_jp02_ar_bromeo805_bar_heavy_long, // 0x80e
        jup_jp02_ar_bromeo805_bar_heavy_xshort, // 0x80f
        jup_jp02_ar_bromeo805_bar_long, // 0x810
        jup_jp02_ar_bromeo805_stock_assault, // 0x811
        jup_jp02_ar_bromeo805_stock_folding, // 0x812
        jup_jp02_ar_bromeo805_stock_light, // 0x813
        jup_jp02_ar_bromeo805_stock_heavyskel, // 0x814
        jup_jp02_ar_bromeo805_stock_tacheavy, // 0x815
        jup_jp02_ar_bromeo805_stock_taclight, // 0x816
        jup_jp02_ar_bromeo805_stockno, // 0x817
        jup_jp02_ar_bromeo805_mag_30_556n, // 0x818
        jup_jp02_ar_bromeo805_mag_20_556n, // 0x819
        jup_jp02_ar_bromeo805_drum_50_556n, // 0x81a
        jup_bromeo805_ironsdefault, // 0x81b
        jup_jp02_ar_bromeo805_pgrip, // 0x81c
        jup_jp02_ar_bromeo805_pgrip_aim, // 0x81d
        jup_jp02_ar_bromeo805_pgrip_ass, // 0x81e
        jup_bromeo805_rec, // 0x81f
        jup_jp02_br_bromeo2_bar_heavy, // 0x820
        jup_jp02_br_bromeo2_bar_heavy_long, // 0x821
        jup_jp02_br_bromeo2_bar_heavy_xlong, // 0x822
        jup_jp02_br_bromeo2_stock_assault, // 0x823
        jup_jp02_br_bromeo2_stock_folding, // 0x824
        jup_jp02_br_bromeo2_stock_heavy, // 0x825
        jup_jp02_br_bromeo2_stock_heavyskel, // 0x826
        jup_jp02_br_bromeo2_stock_tacheavy, // 0x827
        jup_jp02_br_bromeo2_stock_taclight, // 0x828
        jup_jp02_br_bromeo2_stock_weighted, // 0x829
        jup_jp02_br_bromeo2_mag_10_762n, // 0x82a
        jup_jp02_br_bromeo2_mag_20_762n, // 0x82b
        jup_jp02_br_bromeo2_mag_30_762n, // 0x82c
        jup_bromeo2_ironsdefault, // 0x82d
        jup_jp02_br_bromeo2_pgrip, // 0x82e
        jup_jp02_br_bromeo2_pgrip_ass, // 0x82f
        jup_jp02_br_bromeo2_pgrip_grooved, // 0x830
        jup_bromeo2_rec, // 0x831
        jup_jp02_dm_bromeop_bar_heavy_long, // 0x832
        jup_jp02_dm_bromeop_bar_heavy_xlong, // 0x833
        jup_jp02_dm_bromeop_bar_precision, // 0x834
        jup_jp02_dm_bromeop_stock_heavy, // 0x835
        jup_jp02_dm_bromeop_stock_heavyskel, // 0x836
        jup_jp02_dm_bromeop_stock_precision, // 0x837
        jup_jp02_dm_bromeop_stock_weighted, // 0x838
        jup_jp02_dm_bromeop_mag_10_762n, // 0x839
        jup_jp02_dm_bromeop_mag_20_762n, // 0x83a
        jup_bromeop_ironsdefault, // 0x83b
        jup_jp02_dm_bromeop_pgrip, // 0x83c
        jup_jp02_dm_bromeop_pgrip_aim, // 0x83d
        jup_jp02_dm_bromeop_pgrip_ass, // 0x83e
        jup_jp02_dm_bromeop_pgrip_grooved, // 0x83f
        jup_bromeop_rec, // 0x840
        jup_jp02_sm_scharlie3_bar_light, // 0x841
        jup_jp02_sm_scharlie3_bar_lgtlong, // 0x842
        jup_jp02_sm_scharlie3_barsil, // 0x843
        jup_jp02_sm_scharlie3_bar_lgtshort, // 0x844
        jup_jp02_sm_scharlie3_stock_assault, // 0x845
        jup_jp02_sm_scharlie3_stock_skeltac, // 0x846
        jup_jp02_sm_scharlie3_stock_skel, // 0x847
        jup_jp02_sm_scharlie3_stock_tac, // 0x848
        jup_jp02_sm_scharlie3_stock_taclight, // 0x849
        jup_jp02_sm_scharlie3_stockno, // 0x84a
        jup_jp02_sm_scharlie3_mag_30_9mm, // 0x84b
        jup_jp02_sm_scharlie3_mag_40_9mm, // 0x84c
        jup_jp02_sm_scharlie3_drum_50_9mm, // 0x84d
        jup_scharlie3_ironsdefault, // 0x84e
        jup_jp02_sm_scharlie3_pgrip_smg, // 0x84f
        jup_jp02_sm_scharlie3_pgrip_rubber, // 0x850
        jup_jp02_sm_scharlie3_pgrip_ass, // 0x851
        jup_jp02_sm_scharlie3_pgrip_gtape, // 0x852
        jup_scharlie3_rec, // 0x853
        jup_jp04_sm_lwhiskey_bar, // 0x854
        jup_jp04_sm_lwhiskey_bar_heavy, // 0x855
        jup_jp04_sm_lwhiskey_bar_hvylong, // 0x856
        jup_jp04_sm_lwhiskey_bar_long, // 0x857
        jup_jp04_sm_lwhiskey_stock_light, // 0x858
        jup_jp04_sm_lwhiskey_stock_assault, // 0x859
        jup_jp04_sm_lwhiskey_stock_hvybrace, // 0x85a
        jup_jp04_sm_lwhiskey_stock_brace, // 0x85b
        jup_jp04_sm_lwhiskey_stock_folding, // 0x85c
        jup_lwhiskey_ironsdefault, // 0x85d
        jup_lwhiskey_rec, // 0x85e
        jup_jp04_sm_umike_bar, // 0x85f
        jup_jp04_sm_umike_bar_heavy, // 0x860
        jup_jp04_sm_umike_bar_hvylong, // 0x861
        jup_jp04_sm_umike_bar_long, // 0x862
        jup_jp04_sm_umike_stock_assault, // 0x863
        jup_jp04_sm_umike_stock_light, // 0x864
        jup_jp04_sm_umike_stockno, // 0x865
        jup_jp04_sm_umike_stock_brace, // 0x866
        jup_jp04_sm_umike_stock_folding, // 0x867
        jup_jp04_sm_umike_stock_precision, // 0x868
        jup_jp04_sm_umike_drum_50_45acp, // 0x869
        jup_jp04_sm_umike_mag_30_45acp, // 0x86a
        jup_jp04_sm_umike_mag_25_45acp, // 0x86b
        jup_jp04_sm_umike_mag_15_45acp, // 0x86c
        jup_umike_ironsdefault, // 0x86d
        jup_jp04_sm_umike_pgrip, // 0x86e
        jup_jp04_sm_umike_pgrip_aim, // 0x86f
        jup_jp04_sm_umike_pgrip_ass, // 0x870
        jup_jp04_sm_umike_pgrip_tac, // 0x871
        jup_umike_rec, // 0x872
        jup_jp05_ar_foxtrot2000_bar, // 0x873
        jup_jp05_ar_foxtrot2000_bar_hvylong, // 0x874
        jup_jp05_ar_foxtrot2000_bar_light, // 0x875
        jup_jp05_ar_foxtrot2000_bar_short, // 0x876
        jup_jp05_ar_foxtrot2000_stock, // 0x877
        jup_jp05_ar_foxtrot2000_stock_heavy, // 0x878
        jup_jp05_ar_foxtrot2000_stock_padded, // 0x879
        jup_jp05_ar_foxtrot2000_mag_30_556n, // 0x87a
        jup_jp05_ar_foxtrot2000_mag_45_556n, // 0x87b
        jup_foxtrot2000_ironsdefault, // 0x87c
        jup_jp05_ar_foxtrot2000_pgrip, // 0x87d
        jup_jp05_ar_foxtrot2000_pgrip_aim, // 0x87e
        jup_jp05_ar_foxtrot2000_pgrip_ass, // 0x87f
        jup_jp05_ar_foxtrot2000_pgrip_tac, // 0x880
        jup_foxtrot2000_rec, // 0x881
        jup_jp06_lm_pkilob_bar_light, // 0x882
        jup_jp06_lm_pkilob_bar_bulllong, // 0x883
        jup_jp06_lm_pkilob_bar_bull, // 0x884
        jup_jp06_lm_pkilob_bar_short, // 0x885
        jup_jp06_lm_pkilob_bar_bullshort, // 0x886
        jup_jp06_lm_pkilob_stock_nopad, // 0x887
        jup_jp06_lm_pkilob_stock_reduc, // 0x888
        jup_jp06_lm_pkilob_stock_ergo, // 0x889
        jup_jp06_lm_pkilob_stock_rubber, // 0x88a
        jup_jp06_lm_pkilob_belt_100_762n, // 0x88b
        jup_jp06_lm_pkilob_belt_200_762n, // 0x88c
        jup_pkilob_ironsdefault, // 0x88d
        jup_jp06_lm_pkilob_pgrip, // 0x88e
        jup_jp06_lm_pkilob_pgrip_aim, // 0x88f
        jup_jp06_lm_pkilob_pgrip_ass, // 0x890
        jup_jp06_lm_pkilob_pgrip_tac, // 0x891
        jup_jp06_lm_pkilob_pgrip_snp, // 0x892
        jup_pkilob_rec, // 0x893
        jup_jp06_lm_pkilop_bar, // 0x894
        jup_jp06_lm_pkilop_bar_light, // 0x895
        jup_jp06_lm_pkilop_bar_bulllong, // 0x896
        jup_jp06_lm_pkilop_bar_short, // 0x897
        jup_jp06_lm_pkilop_bar_heavy, // 0x898
        jup_jp06_lm_pkilop_stock_heavy, // 0x899
        jup_jp06_lm_pkilop_stock_heavy2, // 0x89a
        jup_jp06_lm_pkilop_stock_tac, // 0x89b
        jup_jp06_lm_pkilop_stock_pdhv, // 0x89c
        jup_jp06_lm_pkilop_stock_sp, // 0x89d
        jup_jp06_lm_pkilop_belt_100_762n, // 0x89e
        jup_jp06_lm_pkilop_belt_200_762n, // 0x89f
        jup_pkilop_ironsdefault, // 0x8a0
        jup_jp06_lm_pkilop_pgrip, // 0x8a1
        jup_jp06_lm_pkilop_pgrip_aim, // 0x8a2
        jup_jp06_lm_pkilop_pgrip_ass, // 0x8a3
        jup_jp06_lm_pkilop_pgrip_tac, // 0x8a4
        jup_jp06_lm_pkilop_pgrip_snp, // 0x8a5
        jup_pkilop_rec, // 0x8a6
        jup_jp07_pi_uzulum_bar, // 0x8a7
        jup_jp07_pi_uzulum_bar_heavy, // 0x8a8
        jup_jp07_pi_uzulum_bar_short, // 0x8a9
        jup_jp07_pi_uzulum_bar_shortcomp, // 0x8aa
        jup_jp07_pi_uzulum_stock_skelbrace, // 0x8ab
        jup_jp07_pi_uzulum_stock_wire, // 0x8ac
        jup_jp07_pi_uzulum_stockno, // 0x8ad
        jup_jp07_pi_uzulum_mag_20_9mm, // 0x8ae
        jup_jp07_pi_uzulum_mag_25_9mm, // 0x8af
        jup_uzulum_akimbo, // 0x8b0
        jup_uzulum_ironsdefault, // 0x8b1
        jup_uzulum_ironsdefault_stockp, // 0x8b2
        jup_jp07_pi_uzulum_pgrip_aim, // 0x8b3
        jup_jp07_pi_uzulum_pgrip_ass, // 0x8b4
        jup_jp07_pi_uzulum_pgrip_tac, // 0x8b5
        jup_uzulum_rec, // 0x8b6
        jup_uzulum_rec_auto, // 0x8b7
        jup_jp07_sm_uzulu_bar, // 0x8b8
        jup_jp07_sm_uzulu_bar_short, // 0x8b9
        jup_jp07_sm_uzulu_bar_heavy, // 0x8ba
        jup_jp07_sm_uzulu_bar_hvylong, // 0x8bb
        jup_jp07_sm_uzulu_bar_long, // 0x8bc
        jup_jp07_sm_uzulu_bar_long2, // 0x8bd
        jup_jp07_sm_uzulu_barsil, // 0x8be
        jup_jp07_sm_uzulu_stock_light, // 0x8bf
        jup_jp07_sm_uzulu_stock_assault, // 0x8c0
        jup_jp07_sm_uzulu_stock_heavy, // 0x8c1
        jup_jp07_sm_uzulu_stock_tactical, // 0x8c2
        jup_jp07_sm_uzulu_stockno, // 0x8c3
        jup_jp07_sm_uzulu_mag_40_9mm, // 0x8c4
        jup_jp07_sm_uzulu_mag_50_9mm, // 0x8c5
        jup_jp07_sm_uzulu_mag_25_9mm, // 0x8c6
        jup_jp07_sm_uzulu_22_45acp, // 0x8c7
        jup_uzulu_ironsdefault, // 0x8c8
        jup_jp07_sm_uzulu_pgrip, // 0x8c9
        jup_jp07_sm_uzulu_pgrip_aim, // 0x8ca
        jup_jp07_sm_uzulu_pgrip_ass, // 0x8cb
        jup_jp07_sm_uzulu_pgrip_tac, // 0x8cc
        jup_uzulu_grip_vert, // 0x8cd
        jup_uzulu_rec, // 0x8ce
        jup_jp07_sm_uzulup_bar_short, // 0x8cf
        jup_jp07_sm_uzulup_bar, // 0x8d0
        jup_jp07_sm_uzulup_barsil, // 0x8d1
        jup_jp07_sm_uzulup_bar_long, // 0x8d2
        jup_jp07_sm_uzulup_bar_heavy, // 0x8d3
        jup_jp07_sm_uzulup_bar_long2, // 0x8d4
        jup_jp07_sm_uzulup_bar_shortcomp, // 0x8d5
        jup_jp07_sm_uzulup_bar_hvylong, // 0x8d6
        jup_jp07_sm_uzulup_stock_brace, // 0x8d7
        jup_jp07_sm_uzulup_stock_heavytac, // 0x8d8
        jup_jp07_sm_uzulup_stock_rod, // 0x8d9
        jup_jp07_sm_uzulup_stock_skelbrace, // 0x8da
        jup_jp07_sm_uzulup_stock_skeltac, // 0x8db
        jup_jp07_sm_uzulup_stockno, // 0x8dc
        jup_jp07_sm_uzulup_mag_25_9mm, // 0x8dd
        jup_jp07_sm_uzulup_mag_20_9mm, // 0x8de
        jup_jp07_sm_uzulup_drum_100_9mm, // 0x8df
        jup_jp07_sm_uzulup_mag_40_9mm, // 0x8e0
        jup_jp07_sm_uzulup_mag_50_9mm, // 0x8e1
        jup_uzulup_ironsdefault, // 0x8e2
        jup_jp07_sm_uzulup_pgrip, // 0x8e3
        jup_jp07_sm_uzulup_pgrip_ass, // 0x8e4
        jup_jp07_sm_uzulup_pgrip_aim, // 0x8e5
        jup_jp07_sm_uzulup_pgrip_tac, // 0x8e6
        jup_grip_uzulup1, // 0x8e7
        jup_uzulup_rec, // 0x8e8
        jup_jp08_ar_qbravo95_bar_long, // 0x8e9
        jup_jp08_ar_qbravo95_bar, // 0x8ea
        jup_qbravo95_ironsdefault, // 0x8eb
        jup_qbravo95_rec, // 0x8ec
        jup_jp12_pi_mike93_bar, // 0x8ed
        jup_jp12_pi_mike93_bar_long, // 0x8ee
        jup_jp12_pi_mike93_bar_hvylong, // 0x8ef
        jup_jp12_pi_mike93_bar_short, // 0x8f0
        jup_jp12_pi_mike93_stockno, // 0x8f1
        jup_jp12_pi_mike93_stock_folding, // 0x8f2
        jup_jp12_pi_mike93_mag_15_9mm, // 0x8f3
        jup_jp12_pi_mike93_mag_24_9mm, // 0x8f4
        jup_jp12_pi_mike93_mag_30_9mm, // 0x8f5
        jup_jp12_pi_mike93_drum_50_9mm, // 0x8f6
        jup_mike93_akimbo, // 0x8f7
        jup_mike93_ironsdefault, // 0x8f8
        jup_mike93_ironsdefault_stockp, // 0x8f9
        jup_jp12_pi_mike93_pgrip, // 0x8fa
        jup_jp12_pi_mike93_pgrip_ass, // 0x8fb
        jup_jp12_pi_mike93_pgrip_tac, // 0x8fc
        jup_jp12_pi_mike93_trigger, // 0x8fd
        jup_jp12_pi_mike93_trigger_hair, // 0x8fe
        jup_jp12_pi_mike93_trigger_light, // 0x8ff
        jup_jp12_pi_mike93_trigger_heavy, // 0x900
        jup_mike93_rec, // 0x901
        jup_jp13_dm_svictork_bar, // 0x902
        jup_jp13_dm_svictork_bar_hvylong, // 0x903
        jup_jp13_dm_svictork_bar_classic, // 0x904
        jup_jp13_dm_svictork_bar_mm, // 0x905
        jup_jp13_dm_svictork_bar_long, // 0x906
        jup_jp13_dm_svictork_stock_tac, // 0x907
        jup_jp13_dm_svictork_stock_mm, // 0x908
        jup_jp13_dm_svictork_stock_lmm, // 0x909
        jup_jp13_dm_svictork_stock_ass, // 0x90a
        jup_jp13_dm_svictork_stock_skel, // 0x90b
        jup_jp13_dm_svictork_stock_hvytac, // 0x90c
        jup_jp13_dm_svictork_stock_comptac, // 0x90d
        jup_svictork_ironsdefault, // 0x90e
        jup_jp13_dm_svictork_pgrip, // 0x90f
        jup_jp13_dm_svictork_pgrip_aim, // 0x910
        jup_jp13_dm_svictork_pgrip_ass, // 0x911
        jup_jp13_dm_svictork_pgrip_ass2, // 0x912
        jup_jp13_dm_svictork_pgrip_tac, // 0x913
        jup_jp13_dm_svictork_pgrip_ergo, // 0x914
        jup_jp13_dm_svictork_pgrip_snp, // 0x915
        jup_svictork_rec, // 0x916
        jup_jp13_sn_svictor_bar, // 0x917
        jup_jp13_sn_svictor_bar_classic, // 0x918
        jup_jp13_sn_svictor_bar_hvylong, // 0x919
        jup_jp13_sn_svictor_bar_long, // 0x91a
        jup_jp13_sn_svictor_bar_short, // 0x91b
        jup_jp13_sn_svictor_bar_mm, // 0x91c
        jup_jp13_sn_svictor_stock_mm, // 0x91d
        jup_jp13_sn_svictor_stock_heavy, // 0x91e
        jup_jp13_sn_svictor_stock_padded, // 0x91f
        jup_jp13_sn_svictor_stock_ass, // 0x920
        jup_jp13_sn_svictor_stock_skel, // 0x921
        jup_jp13_sn_svictor_stock_comptac, // 0x922
        jup_jp13_sn_svictor_mag_10_338lmp, // 0x923
        jup_jp13_sn_svictor_mag_20_338lmp, // 0x924
        jup_silencer06_lap, // 0x925
        jup_jp13_sn_svictor_pgrip, // 0x926
        jup_jp13_sn_svictor_pgrip_aim, // 0x927
        jup_jp13_sn_svictor_pgrip_ass, // 0x928
        jup_jp13_sn_svictor_pgrip_tac, // 0x929
        jup_jp13_sn_svictor_pgrip_ergo, // 0x92a
        jup_jp13_sn_svictor_pgrip_snp, // 0x92b
        jup_jp13_sn_svictor_pgrip_ass2, // 0x92c
        jup_svictor_rec, // 0x92d
        jup_jp14_pi_rsierra12_bar, // 0x92e
        jup_jp14_pi_rsierra12_bar_hvylong, // 0x92f
        jup_rsierra12_onehand, // 0x930
        jup_rsierra12_ironsdefault, // 0x931
        jup_jp14_pi_rsierra12_pgrip, // 0x932
        jup_jp14_pi_rsierra12_pgrip_aim, // 0x933
        jup_jp14_pi_rsierra12_pgrip_ass, // 0x934
        jup_jp14_pi_rsierra12_pgrip_tac, // 0x935
        jup_rsierra12_rec, // 0x936
        jup_hsierra_rec, // 0x937
        jup_jp19_ar_acharlie_bar_heavy, // 0x938
        jup_jp19_ar_acharlie_bar_long, // 0x939
        jup_jp19_ar_acharlie_bar, // 0x93a
        jup_jp19_ar_acharlie_stock_light, // 0x93b
        jup_jp19_ar_acharlie_stock_assault, // 0x93c
        jup_acharlie_ironsdefault, // 0x93d
        jup_acharlie_rec, // 0x93e
        jup_jp19_br_acharlie450_bar_heavy, // 0x93f
        jup_acharlie450_ironsdefault, // 0x940
        jup_acharlie450_selectauto, // 0x941
        jup_acharlie450_rec, // 0x942
        jup_jp08_ar_qbravo97_bar, // 0x943
        jup_jp08_ar_qbravo97_bar_long, // 0x944
        jup_jp08_ar_qbravo97_stock, // 0x945
        jup_qbravo97_ironsdefault, // 0x946
        jup_qbravo97_rec, // 0x947
        jup_jp08_lm_qbravo95lsw_bar, // 0x948
        jup_jp08_lm_qbravo95lsw_bar_heavy, // 0x949
        jup_qbravo95lsw_ironsdefault, // 0x94a
        jup_qbravo95lsw_rec, // 0x94b
        jup_jp19_ar_acharlie300_barsil, // 0x94c
        jup_acharlie300_ironsdefault, // 0x94d
        jup_acharlie300_rec, // 0x94e
        jup_acharlied_ironsdefault, // 0x94f
        jup_acharlied_rec, // 0x950
        jup_jp20_lm_evictor_bar, // 0x951
        jup_jp20_lm_evictor_bar_long, // 0x952
        jup_jp20_lm_evictor_bar_short, // 0x953
        jup_jp20_lm_evictor_stock, // 0x954
        jup_evictor_ironsdefault, // 0x955
        jup_selectsemi, // 0x956
        jup_jp20_lm_evictor_pgrip_ass, // 0x957
        jup_jp20_lm_evictor_pgrip_aim, // 0x958
        jup_jp20_lm_evictor_pgrip, // 0x959
        jup_jp20_lm_evictor_pgrip_tac, // 0x95a
        jup_evictor_rec, // 0x95b
        jup_cp01_sm_coscar635_stock_carbine, // 0x95c
        jup_cp01_sm_coscar635_stock_precision, // 0x95d
        jup_cp08_br_xmike5_bar_long, // 0x95e
        jup_cp08_br_xmike5_bar_short, // 0x95f
        jup_cp08_br_xmike5_stock_folding, // 0x960
        jup_cp08_br_xmike5_stock_heavy, // 0x961
        jup_cp08_br_xmike5_mag_20_277f, // 0x962
        jup_cp08_br_xmike5_mag_30_277f, // 0x963
        jup_cp08_br_xmike5_mag_45_277f, // 0x964
        jup_cp08_br_xmike5_pgrip_aim, // 0x965
        jup_cp08_br_xmike5_pgrip_ass, // 0x966
        jup_cp08_br_xmike5_pgrip_tac, // 0x967
        jup_jp01_dm_slima8_comb_tactical, // 0x968
        jup_jp01_dm_slima8_comb_ergo, // 0x969
        jup_jp01_dm_slima8_comb_pouch, // 0x96a
        jup_jp01_dm_slima8_comb_ammo, // 0x96b
        jup_jp01_lm_mgolf36_bar_short_heavy, // 0x96c
        jup_jp01_lm_mgolf36_bar_heavy_long, // 0x96d
        jup_jp01_lm_mgolf36_bar_heavy_bipod, // 0x96e
        jup_jp01_lm_mgolf36_bar_heavy, // 0x96f
        jup_jp01_lm_mgolf36_bar_fusion, // 0x970
        jup_jp01_lm_mgolf36_stock_assault, // 0x971
        jup_jp01_lm_mgolf36_stock_heavy, // 0x972
        jup_jp01_lm_mgolf36_drum_100_556n, // 0x973
        jup_jp01_lm_mgolf36_mag_40_556n, // 0x974
        jup_jp01_lm_mgolf36_drum_50_556n, // 0x975
        jup_jp06_lm_pkilob_stock_pad, // 0x976
        jup_jp06_lm_pkilop_stock_heavy3, // 0x977
        jup_jp08_ar_qbravo95_bar_short, // 0x978
        jup_jp08_ar_qbravo95_bar_hvylong, // 0x979
        jup_jp08_ar_qbravo95_mag_20_58, // 0x97a
        jup_jp08_ar_qbravo95_mag_30_58, // 0x97b
        jup_jp08_ar_qbravo95_mag_40_58, // 0x97c
        jup_jp08_ar_qbravo97_bar_hvyshort, // 0x97d
        jup_jp08_ar_qbravo97_bar_hvylong, // 0x97e
        jup_jp08_ar_qbravo97_bar_short, // 0x97f
        jup_jp08_ar_qbravo97_stock_ergo, // 0x980
        jup_jp08_ar_qbravo97_stock_padded, // 0x981
        jup_jp08_ar_qbravo97_stock_reduc, // 0x982
        jup_jp08_ar_qbravo97_stock_rubber, // 0x983
        jup_jp08_ar_qbravo97_mag_20_556n, // 0x984
        jup_jp08_ar_qbravo97_mag_30_556n, // 0x985
        jup_jp08_ar_qbravo97_mag_40_556n, // 0x986
        jup_jp08_ar_qbravo97_drum_60_556n, // 0x987
        jup_jp08_lm_qbravo95lsw_bar_light, // 0x988
        jup_jp08_lm_qbravo95lsw_bar_hvyshort, // 0x989
        jup_jp08_lm_qbravo95lsw_stock_padded, // 0x98a
        jup_jp08_lm_qbravo95lsw_stock_ergo, // 0x98b
        jup_jp08_lm_qbravo95lsw_stock_reduc, // 0x98c
        jup_jp08_lm_qbravo95lsw_stock_rubber, // 0x98d
        jup_jp08_lm_qbravo95lsw_drum_60_58h, // 0x98e
        jup_jp08_lm_qbravo95lsw_drum_100_58h, // 0x98f
        jup_jp09_sh_oromeo12_bar, // 0x990
        jup_jp09_sh_oromeo12_stock, // 0x991
        jup_oromeo12_ironsdefault, // 0x992
        jup_jp09_sh_oromeo12_pgrip, // 0x993
        jup_jp09_sh_oromeo12_pgrip_aim, // 0x994
        jup_jp09_sh_oromeo12_pgrip_ass, // 0x995
        jup_jp09_sh_oromeo12_pgrip_tac, // 0x996
        jup_oromeo12_rec, // 0x997
        jup_jp14_pi_rsierra12_bar_short, // 0x998
        jup_jp14_pi_rsierra12_stock_heavy, // 0x999
        jup_jp14_pi_rsierra12_stock_precision, // 0x99a
        jup_jp14_pi_rsierra12_pgrip_stippled, // 0x99b
        jup_jp16_sh_recho870_bartube_hvylong, // 0x99c
        jup_jp16_sh_recho870_bartube_hvyshort, // 0x99d
        jup_jp16_sh_recho870_bartube, // 0x99e
        jup_jp16_sh_recho870_bartube_long, // 0x99f
        jup_jp16_sh_recho870_stock_heavy, // 0x9a0
        jup_jp16_sh_recho870_stockno, // 0x9a1
        jup_recho870_ironsdefault, // 0x9a2
        jup_recho870_beadiron_short, // 0x9a3
        jup_recho870_beadiron, // 0x9a4
        jup_recho870_rec, // 0x9a5
        jup_jp17_sn_hsierra_bar, // 0x9a6
        jup_jp17_sn_hsierra_bar_short, // 0x9a7
        jup_jp17_sn_hsierra_bar_long, // 0x9a8
        jup_jp17_sn_hsierra_bar_hvylong, // 0x9a9
        jup_jp17_sn_hsierra_stock, // 0x9aa
        jup_jp17_sn_hsierra_stock_heavy, // 0x9ab
        jup_jp17_sn_hsierra_stock_precision, // 0x9ac
        jup_jp17_sn_hsierra_stock_tac, // 0x9ad
        jup_jp17_sn_hsierra_stock_light, // 0x9ae
        jup_jp17_sn_hsierra_mag_5_50b, // 0x9af
        jup_jp17_sn_hsierra_mag_7_50b, // 0x9b0
        jup_jp17_sn_hsierra_pgrip, // 0x9b1
        jup_jp17_sn_hsierra_pgrip_aim, // 0x9b2
        jup_jp17_sn_hsierra_pgrip_ass, // 0x9b3
        jup_jp17_sn_hsierra_pgrip_tac, // 0x9b4
        jup_jp17_sn_hsierra_pgrip_ske, // 0x9b5
        jup_jp17_sn_hsierra_pgrip_snp, // 0x9b6
        jup_jp19_ar_acharlie_bar_hvyshort, // 0x9b7
        jup_jp19_ar_acharlie_barsil, // 0x9b8
        jup_jp19_ar_acharlie_stock_precision, // 0x9b9
        jup_jp19_ar_acharlie_stock_tacheavy, // 0x9ba
        jup_jp19_ar_acharlie_stock_heavy, // 0x9bb
        jup_jp19_ar_acharlie_stock_tac, // 0x9bc
        jup_jp19_ar_acharlie_mag_20_556n, // 0x9bd
        jup_jp19_ar_acharlie_mag_30_556n, // 0x9be
        jup_jp19_ar_acharlie_mag_40_556n, // 0x9bf
        jup_jp19_ar_acharlie_drum_60_556n, // 0x9c0
        jup_jp19_ar_acharlie_pgrip, // 0x9c1
        jup_jp19_ar_acharlie_pgrip_aim, // 0x9c2
        jup_jp19_ar_acharlie_pgrip_ass, // 0x9c3
        jup_jp19_ar_acharlie_pgrip_snp, // 0x9c4
        jup_jp19_ar_acharlie300_bar, // 0x9c5
        jup_jp19_ar_acharlie300_bar_hvylong, // 0x9c6
        jup_jp19_ar_acharlie300_hvyshort, // 0x9c7
        jup_jp19_ar_acharlie300_bar_heavy, // 0x9c8
        jup_jp19_ar_acharlie300_stock_assault, // 0x9c9
        jup_jp19_ar_acharlie300_stock_light, // 0x9ca
        jup_jp19_ar_acharlie300_stock_tacheavy, // 0x9cb
        jup_jp19_ar_acharlie300_stock_tac, // 0x9cc
        jup_jp19_ar_acharlie300_mag_20_blk, // 0x9cd
        jup_jp19_ar_acharlie300_mag_30_blk, // 0x9ce
        jup_jp19_ar_acharlie300_mag_40_blk, // 0x9cf
        jup_jp19_ar_acharlie300_pgrip, // 0x9d0
        jup_jp19_ar_acharlie300_pgrip_aim, // 0x9d1
        jup_jp19_ar_acharlie300_pgrip_ass, // 0x9d2
        jup_jp19_ar_acharlie300_pgrip_snp, // 0x9d3
        jup_jp19_br_acharlie450_bar, // 0x9d4
        jup_jp19_br_acharlie450_barsil, // 0x9d5
        jup_jp19_br_acharlie450_stock_assault, // 0x9d6
        jup_jp19_br_acharlie450_stock_precision, // 0x9d7
        jup_jp19_br_acharlie450_stock_light, // 0x9d8
        jup_jp19_br_acharlie450_stock_tacheavy, // 0x9d9
        jup_jp19_br_acharlie450_stock_heavy, // 0x9da
        jup_jp19_br_acharlie450_stock_tac, // 0x9db
        jup_jp19_br_acharlie450_mag_10_450b, // 0x9dc
        jup_jp19_br_acharlie450_mag_15_450b, // 0x9dd
        jup_jp19_br_acharlie450_mag_20_450b, // 0x9de
        jup_jp19_br_acharlie450_drum_30_450b, // 0x9df
        jup_jp19_br_acharlie450_pgrip, // 0x9e0
        jup_jp19_br_acharlie450_pgrip_aim, // 0x9e1
        jup_jp19_br_acharlie450_pgrip_ass, // 0x9e2
        jup_jp19_br_acharlie450_pgrip_snp, // 0x9e3
        jup_jp19_dm_acharlied_bar, // 0x9e4
        jup_jp19_dm_acharlied_barsil, // 0x9e5
        jup_jp19_dm_acharlied_stock_assault, // 0x9e6
        jup_jp19_dm_acharlied_stock_precision, // 0x9e7
        jup_jp19_dm_acharlied_stock_heavy, // 0x9e8
        jup_jp19_dm_acharlied_mag_10_68r, // 0x9e9
        jup_jp19_dm_acharlied_mag_30_68r, // 0x9ea
        jup_jp19_dm_acharlied_drum_60_68r, // 0x9eb
        jup_jp19_dm_acharlied_pgrip, // 0x9ec
        jup_jp19_dm_acharlied_pgrip_aim, // 0x9ed
        jup_jp19_dm_acharlied_pgrip_ass, // 0x9ee
        jup_jp19_dm_acharlied_pgrip_snp, // 0x9ef
        jup_jp20_lm_evictor_bar_heavy, // 0x9f0
        jup_jp20_lm_evictor_stock_precision, // 0x9f1
        jup_jp20_lm_evictor_stock_assault, // 0x9f2
        jup_jp20_lm_evictor_stock_heavy, // 0x9f3
        jup_jp20_lm_evictor_stock_weighted, // 0x9f4
        jup_jp20_lm_evictor_stock_skel, // 0x9f5
        jup_jp20_lm_evictor_belt_100_762n, // 0x9f6
        jup_jp20_lm_evictor_belt_100_556n, // 0x9f7
        jup_jp20_lm_evictor_belt_200_556n, // 0x9f8
        jup_cp08_br_xmike5_bar_lgtlong, // 0x9f9
        jup_cp08_br_xmike5_bar_lgtshort, // 0x9fa
        jup_cp08_br_xmike5_bar_light, // 0x9fb
        jup_cp08_br_xmike5_stock_hvyprecision, // 0x9fc
        jup_cp08_br_xmike5_stock_lgtprecision, // 0x9fd
        jup_cp08_br_xmike5_stock_light, // 0x9fe
        jup_jp01_ar_golf36_stock_tacheavy, // 0x9ff
        jup_jp01_ar_golf36_stock_skel, // 0xa00
        jup_jp01_ar_golf36_stock_tac, // 0xa01
        jup_jp01_ar_golf36_pgrip_aim, // 0xa02
        jup_jp01_ar_golf36_pgrip_snp, // 0xa03
        jup_jp01_ar_golf36_pgrip, // 0xa04
        jup_jp01_ar_golf36_pgrip_ske, // 0xa05
        jup_jp01_ar_golf36_pgrip_tac, // 0xa06
        jup_jp01_dm_slima8_stock_marksman_ergo, // 0xa07
        jup_jp01_dm_slima8_stock_marksman_reduc, // 0xa08
        jup_jp01_dm_slima8_mag_10_556n, // 0xa09
        jup_jp01_lm_mgolf36_stock_tac, // 0xa0a
        jup_jp01_lm_mgolf36_stock_tacheavy, // 0xa0b
        jup_jp01_lm_mgolf36_pgrip, // 0xa0c
        jup_jp01_lm_mgolf36_pgrip_snp, // 0xa0d
        jup_jp01_lm_mgolf36_pgrip_tac, // 0xa0e
        jup_jp01_lm_mgolf36_pgrip_ske, // 0xa0f
        jup_jp01_lm_mgolf36_pgrip_aim, // 0xa10
        jup_jp09_sh_oromeo12_bar_short, // 0xa11
        jup_jp09_sh_oromeo12_bar_long, // 0xa12
        jup_jp09_sh_oromeo12_stock_tac, // 0xa13
        jup_jp09_sh_oromeo12_stock_heavy, // 0xa14
        jup_jp09_sh_oromeo12_mag_5_12g, // 0xa15
        jup_jp09_sh_oromeo12_mag_8_12g, // 0xa16
        jup_jp09_sh_oromeo12_pgrip_ass2, // 0xa17
        jup_jp09_sh_oromeo12_pgrip_snp, // 0xa18
        jup_jp16_sh_recho870_bartube_short, // 0xa19
        jup_jp16_sh_recho870_stock, // 0xa1a
        jup_jp16_sh_recho870_stock_assault, // 0xa1b
        jup_jp16_sh_recho870_stock_folding, // 0xa1c
        jup_jp16_sh_recho870_stock_precision, // 0xa1d
        jup_jp16_sh_recho870_stock_tac, // 0xa1e
        jup_jp16_sh_recho870_tube_4_12g, // 0xa1f
        jup_jp16_sh_recho870_tube_6_12g, // 0xa20
        jup_jp16_sh_recho870_tube_8_12g, // 0xa21
        jup_jp16_sh_recho870_tube_10_12g, // 0xa22
        jup_jp16_sh_recho870_guard, // 0xa23
        jup_jp16_sh_recho870_guard_heavy, // 0xa24
        jup_jp16_sh_recho870_guard_ergo, // 0xa25
        jup_jp16_sh_recho870_guard_tac, // 0xa26
        jup_jp16_sh_recho870_guard_skel, // 0xa27
        jup_jp16_sh_recho870_bolt, // 0xa28
        jup_jp16_sh_recho870_bolt_heavy, // 0xa29
        jup_jp16_sh_recho870_bolt_light, // 0xa2a
        jup_jp06_lm_pkilob_bar, // 0xa2b
        zm_la_rpapa7_pack, // 0xa2c
        zm_la_rpapa7, // 0xa2d
        bar_raygun, // 0xa2e
        mag_raygun, // 0xa2f
        rec_raygun, // 0xa30
        jup_jp05_ar_foxtrot2000_stock_reduc, // 0xa31
        jup_jp19_ar_acharlie_bar_lgtlong, // 0xa32
        jup_jp19_ar_acharlie_bar_hvylong, // 0xa33
        jup_jp19_ar_acharlie300_stockno, // 0xa34
        jup_jp19_br_acharlie450_bar_marksman, // 0xa35
        zm_dm_sa700, // 0xa36
        zm_dm_sa700_pack, // 0xa37
        jup_xmike5_ironsdefault, // 0xa38
        jup_jp02_ar_bromeo805_stock_skeltac, // 0xa39
        jup_jp02_br_bromeo2_bar_precision, // 0xa3a
        zm_sm_scharlie3, // 0xa3b
        zm_sm_scharlie3_pack, // 0xa3c
        jup_jp12_pi_mike93_pgrip_ergo, // 0xa3d
        jup_jp14_pi_rsierra12_bar_heavy, // 0xa3e
        jup_jp14_pi_rsierra12_cylinder_5_12, // 0xa3f
        bar_ar_p06, // 0xa40
        bar_ar_long_p06, // 0xa41
        bar_ar_short_p06, // 0xa42
        bar_ar_short2_p06, // 0xa43
        stock_ar_heavy_p06, // 0xa44
        stock_ar_p06, // 0xa45
        stock_ar_tactical_p06, // 0xa46
        mag_ar_p06, // 0xa47
        mag_ar_large_p06, // 0xa48
        mag_ar_xlarge_p06, // 0xa49
        comb_p06, // 0xa4a
        comb_tactical_p06, // 0xa4b
        comb_heavy_p06, // 0xa4c
        comb_ergo_p06, // 0xa4d
        rail_ar_large_p06, // 0xa4e
        pgrip_p06, // 0xa4f
        pgrip_ass_p06, // 0xa50
        pgrip_aim_p06, // 0xa51
        pgrip_tac_p06, // 0xa52
        iw9_rec_falpha, // 0xa53
        rec_fecho, // 0xa54
        iw9_me_sword01, // 0xa55
        stockr_sh_p13, // 0xa56
        stockr_sh_heavy_p13, // 0xa57
        stock_sh_heavy_p13, // 0xa58
        stock_sh_tactical_p13, // 0xa59
        stock_sh_light_p13, // 0xa5a
        stockno_sh_p13, // 0xa5b
        stockno_sh_light_p13, // 0xa5c
        jup_jp19_ar_acharlie300_bar_lgtlong, // 0xa5d
        jup_jp19_br_acharlie450_bar_hvylong2, // 0xa5e
        jup_jp19_br_acharlie450_bar_hvyshort2, // 0xa5f
        jup_jp19_br_acharlie450_bar_heavy2, // 0xa60
        jup_jp19_br_acharlie450_bar_hvymarksman, // 0xa61
        jup_jp19_dm_acharlied_bar_hvylong2, // 0xa62
        jup_jp19_dm_acharlied_bar_hvyshort2, // 0xa63
        jup_jp19_dm_acharlied_bar_heavy2, // 0xa64
        jup_jp19_dm_acharlied_bar_hvymarksman, // 0xa65
        jup_cp01_sm_coscar635_bar_light_mike4, // 0xa66
        jup_hybridtherm01, // 0xa67
        jup_hybridtherm02, // 0xa68
        jup_reflex01, // 0xa69
        jup_risr_reflex01, // 0xa6a
        jup_twofivex01, // 0xa6b
        jup_twofivex02, // 0xa6c
        jup_twofivex03, // 0xa6d
        jup_twofivex04, // 0xa6e
        jup_twofivex05, // 0xa6f
        jup_twofivex06, // 0xa70
        jup_twofivex07, // 0xa71
        jup_twofivextherm01, // 0xa72
        jup_risr_twofivex01, // 0xa73
        jup_las_twofivex01, // 0xa74
        jup_fourx01, // 0xa75
        jup_fourx02, // 0xa76
        jup_las_fourx01, // 0xa77
        jup_las_minireddot01, // 0xa78
        jup_risr_minireddot01, // 0xa79
        jup_silencer_ar_04, // 0xa7a
        jup_grip_angled_01, // 0xa7b
        jup_grip_angled_02, // 0xa7c
        jup_grip_angled_03, // 0xa7d
        jup_grip_angled_04, // 0xa7e
        jup_grip_angled_05, // 0xa7f
        jup_grip_stop_01, // 0xa80
        jup_grip_stop_02, // 0xa81
        jup_grip_stop_03, // 0xa82
        jup_grip_stop_04, // 0xa83
        jup_grip_stop_05, // 0xa84
        jup_grip_vert_01, // 0xa85
        jup_grip_vert_02, // 0xa86
        jup_grip_vert_03, // 0xa87
        jup_grip_vert_04, // 0xa88
        jup_grip_vert_05, // 0xa89
        jup_grip_vert_06, // 0xa8a
        jup_laslight_box_01, // 0xa8b
        jup_comp_dm_10, // 0xa8c
        jup_comp_pi_01, // 0xa8d
        jup_comp_pi_03, // 0xa8e
        jup_comp_pi_11, // 0xa8f
        jup_laslight_pstl_01, // 0xa90
        jup_comp_sh_01, // 0xa91
        jup_comp_sh_02, // 0xa92
        jup_comp_sh_03, // 0xa93
        jup_silencer_sm_01, // 0xa94
        jup_silencer_sm_04, // 0xa95
        jup_comp_sm_01, // 0xa96
        jup_comp_sm_04, // 0xa97
        jup_comp_sm_03, // 0xa98
        jup_comp_sm_05, // 0xa99
        jup_comp_sm_07, // 0xa9a
        jup_comp_sm_08, // 0xa9b
        jup_breacher_sm_01, // 0xa9c
        jup_laslight_cyl_01, // 0xa9d
        jup_hybridscope_01, // 0xa9e
        jup_hybridscope_01_rsierra, // 0xa9f
        jup_las_dmscope01, // 0xaa0
        jup_comp_sn_03, // 0xaa1
        jup_comp_sn_10, // 0xaa2
        jup_silencer_sn_02, // 0xaa3
        jup_silencer_sn_03, // 0xaa4
        jup_silencer_br_01, // 0xaa5
        jup_silencer_br_02, // 0xaa6
        jup_comp_br_01, // 0xaa7
        jup_comp_br_02, // 0xaa8
        jup_comp_br_03, // 0xaa9
        jup_comp_br_04, // 0xaaa
        jup_comp_br_05, // 0xaab
        jup_comp_br_06, // 0xaac
        jup_comp_br_07, // 0xaad
        jup_comp_br_08, // 0xaae
        jup_breacher_br_01, // 0xaaf
        jup_flash_br_01, // 0xab0
        jup_silencer_ar_01, // 0xab1
        jup_silencer_ar_02, // 0xab2
        jup_comp_ar_01, // 0xab3
        jup_comp_ar_03, // 0xab4
        jup_comp_ar_04, // 0xab5
        jup_comp_ar_05, // 0xab6
        jup_comp_ar_06, // 0xab7
        jup_comp_ar_07, // 0xab8
        jup_comp_ar_08, // 0xab9
        jup_breacher_ar_01, // 0xaba
        jup_flash_ar_01, // 0xabb
        jup_jp12_pi_mike93_bar_hvyconvert, // 0xabc
        jup_jp12_pi_mike93_stock, // 0xabd
        jup_jp12_pi_mike93_stock_brace, // 0xabe
        jup_jp12_pi_mike93_stock_heavy, // 0xabf
        jup_jp02_ar_bromeo805_pgrip_grooved, // 0xac0
        jup_grip_uzulup2, // 0xac1
        jup_jp04_sm_lwhiskey_stockno, // 0xac2
        jup_jp04_sm_lwhiskey_stock_precision, // 0xac3
        jup_jp04_sm_lwhiskey_pgrip_aim, // 0xac4
        jup_jp04_sm_lwhiskey_pgrip_ass, // 0xac5
        jup_jp04_sm_lwhiskey_pgrip_tac, // 0xac6
        jup_jp04_sm_lwhiskey_pgrip, // 0xac7
        jup_jp07_pi_uzulum_pgrip, // 0xac8
        jup_jp09_sh_oromeo12_stock_brace, // 0xac9
        jup_jp09_sh_oromeo12_stock_taclight, // 0xaca
        jup_jp09_sh_oromeo12_stockno, // 0xacb
        jup_jp09_sh_oromeo12_mag_12_12g, // 0xacc
        jup_jp09_sh_oromeo12_drum_20_12g, // 0xacd
        jup_cp24_pi_glima21_stockcc_heavy, // 0xace
        jup_cp24_pi_glima21_stockcc, // 0xacf
        jup_cp24_pi_glima21_stockcc_light, // 0xad0
        jup_glima21_akimbo, // 0xad1
        jup_ub_sh_12g_01, // 0xad2
        jup_twofivex_golf36, // 0xad3
        jup_ammo_277f, // 0xad4
        jup_ammo_277f_fr, // 0xad5
        jup_ammo_277f_hp, // 0xad6
        jup_ammo_277f_tr, // 0xad7
        jup_ammo_277f_ap, // 0xad8
        jup_ammo_277f_op, // 0xad9
        jup_ammo_277f_hv, // 0xada
        jup_ammo_277f_db, // 0xadb
        jup_jp02_ar_bromeo805_pgrip_light, // 0xadc
        jup_jp04_sm_lwhiskey_stock_hvyskel, // 0xadd
        jup_jp04_sm_umike_stock_hvyskel, // 0xade
        jup_jp13_sn_svictor_stock_precision, // 0xadf
        jup_jp14_pi_rsierra12_bar_light, // 0xae0
        jup_ammo_450b, // 0xae1
        jup_ammo_450b_fr, // 0xae2
        jup_ammo_450b_hp, // 0xae3
        jup_ammo_450b_tr, // 0xae4
        jup_ammo_450b_ap, // 0xae5
        jup_ammo_450b_op, // 0xae6
        jup_ammo_450b_hv, // 0xae7
        jup_jp13_sn_svictor_stock_lmm, // 0xae8
        jup_silencer_dm_01, // 0xae9
        jup_silencer_dm_02, // 0xaea
        jup_comp_dm_01, // 0xaeb
        jup_comp_dm_03, // 0xaec
        jup_comp_dm_05, // 0xaed
        jup_comp_dm_06, // 0xaee
        jup_comp_dm_08, // 0xaef
        jup_ammo_762r, // 0xaf0
        jup_ammo_762r_fr, // 0xaf1
        jup_ammo_762r_hp, // 0xaf2
        jup_ammo_762r_tr, // 0xaf3
        jup_ammo_762r_ap, // 0xaf4
        jup_ammo_762r_op, // 0xaf5
        jup_ammo_762r_hv, // 0xaf6
        jup_ammo_762r_db, // 0xaf7
        jup_ammo_58h, // 0xaf8
        jup_ammo_58h_fr, // 0xaf9
        jup_ammo_58h_hp, // 0xafa
        jup_ammo_58h_tr, // 0xafb
        jup_ammo_58h_ap, // 0xafc
        jup_ammo_58h_op, // 0xafd
        jup_ammo_58h_hv, // 0xafe
        jup_ammo_58h_db, // 0xaff
        jup_ammo_68r, // 0xb00
        jup_ammo_68r_hp, // 0xb01
        jup_ammo_68r_ap, // 0xb02
        jup_ammo_68r_fr, // 0xb03
        jup_ammo_68r_op, // 0xb04
        jup_ammo_68r_hv, // 0xb05
        jup_ammo_68r_db, // 0xb06
        jup_ammo_68r_tr, // 0xb07
        jup_jp02_br_bromeo2_pgrip_aim, // 0xb08
        jup_jp05_ar_foxtrot2000_mag_20_556n, // 0xb09
        jup_jp06_lm_pkilop_belt_75_762n, // 0xb0a
        jup_jp06_lm_pkilop_belt_150_762n, // 0xb0b
        jup_jp06_lm_pkilop_grip_akilo, // 0xb0c
        jup_ub_gl_qbravo_he_01, // 0xb0d
        jup_jp13_dm_svictork_mag_10_762r, // 0xb0e
        jup_jp13_dm_svictork_mag_15_762r, // 0xb0f
        jup_jp13_dm_svictork_mag_20_762r, // 0xb10
        jup_jp14_pi_rsierra12_speedloader_5_12, // 0xb11
        jup_jp14_pi_rsierra12_trigger, // 0xb12
        jup_jp14_pi_rsierra12_trigger_hair, // 0xb13
        jup_jp14_pi_rsierra12_trigger_heavy, // 0xb14
        jup_jp14_pi_rsierra12_trigger_light, // 0xb15
        jup_jp07_sm_uzulu_stock_wire, // 0xb16
        jup_hybridscope_02, // 0xb17
        jup_hybridscope_02_rsierra, // 0xb18
        jup_cp08_br_xmike5_stockno, // 0xb19
        jup_jp08_lm_qbravo95lsw_bar_hvylong, // 0xb1a
        jup_jp19_dm_acharlied_bar_marksman, // 0xb1b
        jup_acharlie_amp_300blk, // 0xb1c
        jup_uzulup_akimbo, // 0xb1d
        jup_grip_side_01, // 0xb1e
        jup_grip_side_02, // 0xb1f
        jup_grip_side_03, // 0xb20
        jup_cp24_pi_glima21_stock_tactical, // 0xb21
        jup_cp24_pi_glima21_stockcc_brace, // 0xb22
        jup_jp03_ar_aromeo160_bar, // 0xb23
        jup_jp03_ar_aromeo160_stock, // 0xb24
        jup_jp03_ar_aromeo160_stock_heavy, // 0xb25
        jup_jp03_ar_aromeo160_stock_light, // 0xb26
        jup_jp03_ar_aromeo160_stockno, // 0xb27
        jup_aromeo160_ironsdefault, // 0xb28
        jup_jp03_ar_aromeo160_pgrip, // 0xb29
        jup_jp03_ar_aromeo160_pgrip_ass, // 0xb2a
        jup_jp03_ar_aromeo160_pgrip_tac, // 0xb2b
        jup_jp03_ar_aromeo160_pgrip_snp, // 0xb2c
        jup_aromeo160_rec, // 0xb2d
        jup_jp03_br_aromeo200_bar, // 0xb2e
        jup_jp03_br_aromeo200_bar_short, // 0xb2f
        jup_jp03_br_aromeo200_bar_long, // 0xb30
        jup_jp03_br_aromeo200_stock, // 0xb31
        jup_jp03_br_aromeo200_stock_sn, // 0xb32
        jup_jp03_br_aromeo200_stock_heavy, // 0xb33
        jup_jp03_br_aromeo200_stock_tactical, // 0xb34
        jup_jp03_br_aromeo200_stock_sm, // 0xb35
        jup_aromeo200_ironsdefault, // 0xb36
        jup_aromeo200_selectsemi, // 0xb37
        jup_jp03_pgrip, // 0xb38
        jup_jp03_pgrip_aim, // 0xb39
        jup_jp03_pgrip_ass, // 0xb3a
        jup_jp03_pgrip_tac, // 0xb3b
        jup_aromeo200_rec, // 0xb3c
        jup_jp03_sm_pmike_bar, // 0xb3d
        jup_jp03_sm_pmike_bar_long, // 0xb3e
        jup_jp03_sm_pmike_stock_light, // 0xb3f
        jup_jp03_sm_pmike_stockno, // 0xb40
        jup_jp03_sm_pmike_stock, // 0xb41
        jup_pmike_ironsdefault, // 0xb42
        jup_jp03_sm_pmike_pgrip, // 0xb43
        jup_pmike_rec, // 0xb44
        jup_jp10_sn_cdelta50_bar, // 0xb45
        jup_jp10_sn_cdelta50_bar_long, // 0xb46
        jup_jp10_sn_cdelta50_bar_short, // 0xb47
        jup_jp10_sn_cdelta50_bar_hvyshort, // 0xb48
        jup_jp10_sn_cdelta50_stock, // 0xb49
        jup_jp10_sn_cdelta50_stock_heavy, // 0xb4a
        jup_jp10_sn_cdelta50_stock_tac, // 0xb4b
        jup_jp10_sn_cdelta50_pgrip_aim, // 0xb4c
        jup_jp10_sn_cdelta50_pgrip_ass, // 0xb4d
        jup_jp10_sn_cdelta50_pgrip_tac, // 0xb4e
        jup_cdelta50_rec, // 0xb4f
        jup_jp13_dm_svictork_bar_short, // 0xb50
        jup_jp25_ar_talpha95_bar, // 0xb51
        jup_jp25_ar_talpha95_bar_long, // 0xb52
        jup_jp25_ar_talpha95_bar_light, // 0xb53
        jup_jp25_ar_talpha95_stock, // 0xb54
        jup_jp25_ar_talpha95_comb_ammo, // 0xb55
        jup_talpha95_ironsdefault, // 0xb56
        jup_jp25_pgrip, // 0xb57
        jup_jp25_ar_talpha95_pgrip_aim, // 0xb58
        jup_jp25_ar_talpha95_pgrip_ass, // 0xb59
        jup_jp25_ar_talpha95_pgrip_tac, // 0xb5a
        jup_talpha95_rec, // 0xb5b
        jup_reflex_dromeo, // 0xb5c
        jup_dromeo_rec, // 0xb5d
        jup_lasgrip_glima21, // 0xb5e
        jup_silencer_pi_04, // 0xb5f
        jup_flashcomp_sn_01, // 0xb60
        jup_comp_sn_12, // 0xb61
        jup_bipod_01, // 0xb62
        jup_jp03_ar_aromeo160_bar_short, // 0xb63
        jup_jp03_ar_aromeo160_bar_hvyshort, // 0xb64
        jup_jp03_ar_aromeo160_bar_long, // 0xb65
        jup_jp03_ar_aromeo160_bar_heavy, // 0xb66
        jup_jp03_ar_aromeo160_stock_tac, // 0xb67
        jup_jp03_ar_aromeo160_stock_precision, // 0xb68
        jup_jp03_ar_aromeo160_stock_skel, // 0xb69
        jup_jp03_ar_aromeo160_mag_30_556n, // 0xb6a
        jup_jp03_ar_aromeo160_drum_100_556n, // 0xb6b
        jup_jp03_ar_aromeo160_mag_40_556n, // 0xb6c
        jup_jp03_ar_aromeo160_mag_20_556n, // 0xb6d
        jup_jp03_sm_pmike_bar_hvylong, // 0xb6e
        jup_jp03_sm_pmike_stock_ass, // 0xb6f
        jup_jp10_sn_cdelta50_bar_hvylong, // 0xb70
        jup_jp10_sn_cdelta50_stock_skel, // 0xb71
        jup_jp10_sn_cdelta50_stock_light, // 0xb72
        jup_jp10_sn_cdelta50_stockno, // 0xb73
        jup_jp10_sn_cdelta50_mag_5_50b, // 0xb74
        jup_jp10_sn_cdelta50_mag_7_50b, // 0xb75
        jup_jp10_sn_cdelta50_mag_10_50b, // 0xb76
        jup_jp10_sn_cdelta50_pgrip, // 0xb77
        jup_jp25_ar_talpha95_bar_hvy, // 0xb78
        jup_jp25_ar_talpha95_bar_hvylong, // 0xb79
        jup_jp25_ar_talpha95_bar_shorthvy, // 0xb7a
        jup_jp25_ar_talpha95_bar_xlong, // 0xb7b
        jup_jp25_ar_talpha95_stock_taclight, // 0xb7c
        jup_jp25_ar_talpha95_stock_hvy, // 0xb7d
        jup_jp25_ar_talpha95_stock_hvy_ass, // 0xb7e
        jup_jp25_ar_talpha95_stock_tac, // 0xb7f
        jup_jp25_ar_talpha95_mag_30_556n, // 0xb80
        jup_jp25_ar_talpha95_mag_20_556n, // 0xb81
        jup_jp25_ar_talpha95_mag_40_556n, // 0xb82
        jup_jp25_ar_talpha95_drum_60_556n, // 0xb83
        jup_jp25_ar_talpha95_comb_tac, // 0xb84
        jup_jp25_ar_talpha95_comb_ergo, // 0xb85
        jup_pkilop_amp_bull, // 0xb86
        jup_xmike5_selectsemi, // 0xb87
        jup_bromeo2_selectauto, // 0xb88
        jup_jp10_sn_cdelta50_barsil, // 0xb89
        jup_ammo_556n, // 0xb8a
        jup_ammo_556n_fr, // 0xb8b
        jup_ammo_556n_hp, // 0xb8c
        jup_ammo_556n_tr, // 0xb8d
        jup_ammo_556n_rn, // 0xb8e
        jup_ammo_556n_op, // 0xb8f
        jup_ammo_556n_hg, // 0xb90
        jup_ammo_556n_lg, // 0xb91
        iw9_lnchrscope_mike32, // 0xb92
        jup_jp08_ar_qbravo95_pgrip, // 0xb93
        jup_jp19_ar_acharlie_bar_hvyshort2, // 0xb94
        jup_cdelta50_scope, // 0xb95
        jup_svictor_scope, // 0xb96
        jup_hsierra_scope, // 0xb97
        jup_hsierra_bipod, // 0xb98
        jup_silencer_br_04, // 0xb99
        jup_comp_br_10, // 0xb9a
        jup_cp01_sm_coscar635_bar_lgtshort_mike4, // 0xb9b
        jup_jp10_sn_cdelta50_bolt, // 0xb9c
        jup_jp10_sn_cdelta50_bolt_heavy, // 0xb9d
        jup_jp10_sn_cdelta50_bolt_light, // 0xb9e
        jup_jp10_sn_cdelta50_guard, // 0xb9f
        jup_jp10_sn_cdelta50_guardlgt, // 0xba0
        jup_jp10_sn_cdelta50_guardhvy, // 0xba1
        jup_bromeo2m_amp, // 0xba2
        jup_ammo_556n_xp, // 0xba3
        jup_jp03_br_aromeo200_mag_20_762n, // 0xba4
        jup_jp03_br_aromeo200_drum_50_762n, // 0xba5
        jup_jp03_sm_pmike_mag_30_9mm, // 0xba6
        jup_jp03_sm_pmike_mag_20_9mm, // 0xba7
        jup_jp03_sm_pmike_drum_50_9mm, // 0xba8
        jup_ammo_9p_hg, // 0xba9
        jup_ammo_9p_lg, // 0xbaa
        jup_ammo_277f_lg, // 0xbab
        jup_ammo_277f_hg, // 0xbac
        jup_ammo_277f_rn, // 0xbad
        jup_ammo_277f_xp, // 0xbae
        jup_ammo_45acp_hg, // 0xbaf
        jup_ammo_45acp_lg, // 0xbb0
        jup_ammo_45acp_tc, // 0xbb1
        jup_ammo_45acp_rip, // 0xbb2
        jup_ammo_762s_lg, // 0xbb3
        jup_ammo_762s_hg, // 0xbb4
        jup_ammo_762s_rn, // 0xbb5
        jup_ammo_762s_xp, // 0xbb6
        jup_ammo_762n_lg, // 0xbb7
        jup_ammo_762n_hg, // 0xbb8
        jup_ammo_762n_rn, // 0xbb9
        jup_ammo_762n_xp, // 0xbba
        jup_ammo_762r_lg, // 0xbbb
        jup_ammo_762r_hg, // 0xbbc
        jup_ammo_762r_rn, // 0xbbd
        jup_ammo_762r_xp, // 0xbbe
        jup_ammo_58h_hg, // 0xbbf
        jup_ammo_58h_lg, // 0xbc0
        jup_ammo_58h_rn, // 0xbc1
        jup_ammo_58h_xp, // 0xbc2
        jup_ammo_50b_hg, // 0xbc3
        jup_ammo_50b_lg, // 0xbc4
        jup_ammo_50b_xp, // 0xbc5
        jup_ammo_50b_bb, // 0xbc6
        jup_ammo_127, // 0xbc7
        jup_ammo_127_ap, // 0xbc8
        jup_ammo_127_fr, // 0xbc9
        jup_ammo_127_hp, // 0xbca
        jup_ammo_127_op, // 0xbcb
        jup_ammo_127_hg, // 0xbcc
        jup_ammo_127_lg, // 0xbcd
        jup_ammo_450b_lg, // 0xbce
        jup_ammo_450b_hg, // 0xbcf
        jup_ammo_450b_rn, // 0xbd0
        jup_ammo_450b_xp, // 0xbd1
        jup_ammo_68r_lg, // 0xbd2
        jup_ammo_68r_hg, // 0xbd3
        jup_ammo_68r_rn, // 0xbd4
        jup_ammo_68r_xp, // 0xbd5
        jup_ammo_blk_lg, // 0xbd6
        jup_ammo_blk_hg, // 0xbd7
        jup_ammo_blk_rn, // 0xbd8
        jup_ammo_blk_xp, // 0xbd9
        jup_comp_ar_10, // 0xbda
        jup_reflex01_tall, // 0xbdb
        jup_ub_gl_foxtrot2000_he_01, // 0xbdc
        jup_jp08_lm_qbravo95lsw_pgrip, // 0xbdd
        jup_rec_halpha, // 0xbde
        jup_rec_boscar, // 0xbdf
        jup_jp07_pi_uzulum_mag_32_9mm, // 0xbe0
        jup_jp07_sm_uzulu_mag_32_9mm, // 0xbe1
        jup_jp07_sm_uzulup_stock_wire, // 0xbe2
        jup_jp07_sm_uzulup_mag_32_9mm, // 0xbe3
        zm_la_ub_plasmagun, // 0xbe4
        jup_choke_sh05, // 0xbe5
        jup_cp01_sm_coscar635_barsil3, // 0xbe6
        jup_cp01_sm_coscar635_pgrip_skelsnp, // 0xbe7
        jup_cp01_sm_coscar635_pgrip_skelass, // 0xbe8
        jup_rsierra12_akimbo, // 0xbe9
        jup_cp01_sh_aromeo410_bar, // 0xbea
        jup_cp01_sh_aromeo410_bar_shorthvy, // 0xbeb
        jup_cp01_sh_aromeo410_bar_long, // 0xbec
        jup_cp01_sh_aromeo410_stock, // 0xbed
        jup_cp01_sh_aromeo410_stock_ultlight, // 0xbee
        jup_cp01_sh_aromeo410_stock_hvycarbine, // 0xbef
        jup_cp01_sh_aromeo410_stock_carbine, // 0xbf0
        jup_cp01_sh_aromeo410_stockno, // 0xbf1
        jup_cp01_sh_aromeo410_stock_ultlight2, // 0xbf2
        jup_cp01_sh_aromeo410_stock_taclight, // 0xbf3
        backup_pistol, // 0xbf4
        jup_cp01_sh_aromeo410_stock_assault, // 0xbf5
        jup_cp01_sh_aromeo410_mag_16_410g, // 0xbf6
        jup_cp01_sh_aromeo410_mag_32_410g, // 0xbf7
        jup_cp01_sh_aromeo410_mag_8_410g, // 0xbf8
        jup_cp01_sh_aromeo410_pgrip, // 0xbf9
        jup_cp01_sh_aromeo410_pgrip_tac, // 0xbfa
        jup_cp01_sh_aromeo410_pgrip_skelass, // 0xbfb
        jup_cp01_sh_aromeo410_pgrip_skelsnp, // 0xbfc
        jup_cp01_sh_aromeo410_pgrip_ass, // 0xbfd
        jup_cp01_sm_coscar635_bar_long_mike4, // 0xbfe
        jup_aromeo410_ironsdefault, // 0xbff
        jup_cp01_sm_coscar635_stock_hvycarbine, // 0xc00
        jup_cp01_sm_coscar635_stock_assault, // 0xc01
        jup_me_shovel, // 0xc02
        jup_jp01_dm_slima8_comb_default, // 0xc03
        akimbo_golf17_onehand, // 0xc04
        sp_reserve_ammo_270, // 0xc05
        jup_jp16_sh_recho870_mag_8_12g, // 0xc06
        jup_recho870_amp_rec, // 0xc07
        jup_anov94_rec, // 0xc08
        jup_cp05_lm_halpha_bar, // 0xc09
        jup_cp05_lm_halpha_bar_bipod, // 0xc0a
        jup_cp05_lm_halpha_bar_light, // 0xc0b
        jup_cp05_lm_halpha_bar_short, // 0xc0c
        jup_cp05_lm_halpha_bar_long, // 0xc0d
        jup_cp05_lm_halpha_stock, // 0xc0e
        jup_cp05_lm_halpha_stock_ass, // 0xc0f
        jup_cp05_lm_halpha_stock_hvy, // 0xc10
        jup_cp05_lm_halpha_stock_tac, // 0xc11
        jup_cp05_lm_halpha_stock_lgt, // 0xc12
        jup_cp05_lm_halpha_mag_45_762n, // 0xc13
        jup_cp05_lm_halpha_drum_75_762n, // 0xc14
        jup_cp05_lm_halpha_drum_150_762n, // 0xc15
        jup_silencer_br_08, // 0xc16
        jup_jp06_lm_pkilop_ub_bipod, // 0xc17
        jup_cp24_pi_glima21_trigger, // 0xc18
        jup_jp17_sn_hsierra_bolt, // 0xc19
        jup_jp17_sn_hsierra_bolt_heavy, // 0xc1a
        jup_jp17_sn_hsierra_bolt_light, // 0xc1b
        jup_cp01_sh_aromeo410_barsil, // 0xc1c
        jup_me_knife, // 0xc1d
        iw9_me_tonfa, // 0xc1e
        jup_jp36_sn_boscar_bar, // 0xc1f
        jup_jp36_sn_boscar_barsil, // 0xc20
        jup_jp36_sn_boscar_bar_short, // 0xc21
        jup_jp36_sn_boscar_bar_long, // 0xc22
        jup_jp36_sn_boscar_stock_comptac, // 0xc23
        jup_jp36_sn_boscar_stock_skel, // 0xc24
        jup_jp36_sn_boscar_stock_lmm, // 0xc25
        jup_jp36_sn_boscar_stock_mm, // 0xc26
        jup_jp36_sn_boscar_stock_precision, // 0xc27
        jup_jp36_sn_boscar_stock_tac, // 0xc28
        jup_jp36_sn_boscar_mag_10_762s, // 0xc29
        jup_jp36_sn_boscar_mag_20_762s, // 0xc2a
        jup_jp36_sn_boscar_mag_30_762s, // 0xc2b
        jup_jp36_sn_boscar_bolt, // 0xc2c
        jup_jp36_sn_boscar_bolt_light, // 0xc2d
        jup_jp36_sn_boscar_bolt_heavy, // 0xc2e
        jup_jp36_sn_boscar_pgrip_ass2, // 0xc2f
        jup_jp36_sn_boscar_pgrip_ass, // 0xc30
        jup_jp36_sn_boscar_pgrip, // 0xc31
        jup_jp36_ar_anov94_bar_light, // 0xc32
        jup_jp36_ar_anov94_bar_short, // 0xc33
        jup_jp36_ar_anov94_bar_lgtshort, // 0xc34
        jup_jp36_ar_anov94_bar_heavy, // 0xc35
        jup_jp36_ar_anov94_barsil, // 0xc36
        jup_jp36_ar_anov94_bar_long, // 0xc37
        jup_jp36_ar_anov94_stock_mm, // 0xc38
        jup_jp36_ar_anov94_stock_lmm, // 0xc39
        jup_jp36_ar_anov94_stock_precision, // 0xc3a
        jup_jp36_ar_anov94_stock_heavy, // 0xc3b
        jup_jp36_ar_anov94_stock_tac, // 0xc3c
        jup_jp36_ar_anov94_stock_skel, // 0xc3d
        jup_jp36_ar_anov94_stock_comptac, // 0xc3e
        jup_jp36_sn_boscar_stockno, // 0xc3f
        jup_jp36_ar_anov94_pgrip, // 0xc40
        jup_jp36_ar_anov94_pgrip_ass, // 0xc41
        jup_jp36_ar_anov94_pgrip_ass2, // 0xc42
        jup_jp36_ar_anov94_pgrip_skelsnp, // 0xc43
        jup_jp36_sn_boscar_stock_heavy, // 0xc44
        jup_jp36_ar_anov94_pgrip_skeltac, // 0xc45
        jup_jp19_ar_acharlie_stockno, // 0xc46
        jup_jp36_sn_boscar_pgrip_skelsnp, // 0xc47
        jup_jp36_sn_boscar_pgrip_skeltac, // 0xc48
        jup_me_kalpha, // 0xc49
        jup_minireddot01_tall, // 0xc4a
        jup_reflex02_tall, // 0xc4b
        jup_reflex03_tall, // 0xc4c
        jup_reflex04_tall, // 0xc4d
        jup_silencer_br_05, // 0xc4e
        jup_silencer_br_06, // 0xc4f
        jup_silencer_br_07, // 0xc50
        jup_reflex02, // 0xc51
        jup_reflex03, // 0xc52
        jup_reflex04, // 0xc53
        jup_silencer_sh_410, // 0xc54
        jup_silencer_sm_05, // 0xc55
        jup_silencer_sm_06, // 0xc56
        jup_silencer_sm_07, // 0xc57
        jup_silencer_jp07, // 0xc58
        jup_laserbox_jump, // 0xc59
        jup_laserbox_slide, // 0xc5a
        jup_laserbox_cs, // 0xc5b
        jup_minireddot01_pstl, // 0xc5c
        jup_silencer_pi_05, // 0xc5d
        jup_silencer_pi_06, // 0xc5e
        jup_silencer_pi_07, // 0xc5f
        jup_laserpstl_cs, // 0xc60
        jup_laserpstl_jump, // 0xc61
        jup_laserpstl_slide, // 0xc62
        jup_silencer_ar_05, // 0xc63
        jup_silencer_ar_06, // 0xc64
        jup_silencer_ar_07, // 0xc65
        jup_silencer_dm_05, // 0xc66
        jup_silencer_dm_06, // 0xc67
        jup_silencer_dm_07, // 0xc68
        jup_lasercyl_cs, // 0xc69
        jup_lasercyl_jump, // 0xc6a
        jup_lasercyl_slide, // 0xc6b
        jup_jp08_lm_qbravo95lsw_pgrip_aim, // 0xc6c
        jup_jp08_lm_qbravo95lsw_pgrip_ass, // 0xc6d
        jup_jp08_lm_qbravo95lsw_pgrip_tac, // 0xc6e
        jup_ammo_sh_fla, // 0xc6f
        jup_silencer_sn_05, // 0xc70
        jup_silencer_sn_06, // 0xc71
        jup_silencer_sn_07, // 0xc72
        jup_boscar_scope, // 0xc73
        jup_ammo_410g, // 0xc74
        jup_cp08_silencer, // 0xc75
        jup_jp06_lm_pkilob_belt_75_762n, // 0xc76
        jup_jp06_lm_pkilob_belt_150_762n, // 0xc77
        jup_jp25_ar_talpha95_comb_pouch, // 0xc78
        jup_jp36_ar_anov94_stockno, // 0xc79
        jup_jp19_br_acharlie450_drum_50_450b, // 0xc7a
        jup_acharlied_selectauto, // 0xc7b
        jup_acharlied_amp_rec, // 0xc7c
        jup_me_axe, // 0xc7d
        jup_ammo_9p_rip, // 0xc7e
        jup_ammo_9p_tc, // 0xc7f
        jup_comp_sm_11, // 0xc80
        jup_jp04_sm_lwhiskey_mag_25_9mm, // 0xc81
        jup_jp04_sm_lwhiskey_mag_30_9mm, // 0xc82
        jup_jp04_sm_lwhiskey_mag_40_9mm, // 0xc83
        jup_jp04_sm_lwhiskey_drum_50_9mm, // 0xc84
        jup_jp16_sh_recho870_pgrip, // 0xc85
        jup_jp16_sh_recho870_pgrip_ass, // 0xc86
        jup_jp16_sh_recho870_pgrip_tac, // 0xc87
        jup_jp16_sh_recho870_pgrip_skel, // 0xc88
        jup_jp08_ar_qbravo97_pgrip, // 0xc89
        jup_jp08_ar_qbravo97_pgrip_aim, // 0xc8a
        jup_jp08_ar_qbravo97_pgrip_ass, // 0xc8b
        jup_jp08_ar_qbravo97_pgrip_tac, // 0xc8c
        jup_jp14_pi_rsierra12_bar_amp, // 0xc8d
        jup_jp14_pi_rsierra12_stock_amp, // 0xc8e
        jup_jp14_pi_rsierra12_pgrip_amp, // 0xc8f
        jup_rsierra12_convert_rec, // 0xc90
        jup_ub_flame_01, // 0xc91
        jup_flash_sm_01, // 0xc92
        jup_jp08_ar_qbravo95_amp_t95, // 0xc93
        jup_jp36_ar_anov94_mag_20_545, // 0xc94
        jup_jp36_ar_anov94_mag_30_545, // 0xc95
        jup_jp36_ar_anov94_mag_45_545, // 0xc96
        jup_jp36_ar_anov94_mag_60_545, // 0xc97
        jup_jp08_ar_qbravo95_pgrip_ass, // 0xc98
        jup_jp08_ar_qbravo95_pgrip_aim, // 0xc99
        jup_jp08_ar_qbravo95_pgrip_tac, // 0xc9a
        jup_aromeo410_rec, // 0xc9b
        jup_jp08_ar_qbravo97_bar_light, // 0xc9c
        jup_sandbox_x150, // 0xc9d
        jup_rsierra12_irons_stock, // 0xc9e
        jup_mgolf36_amp_selectauto2, // 0xc9f
        jup_mgolf36_amp_rec2, // 0xca0
        mag_dg2, // 0xca1
        jup_jp36_sn_boscar_mag_40_762s, // 0xca2
        jup_cp01_sm_coscar635_bar_amp, // 0xca3
        jup_coscar635_amp_rec, // 0xca4
        jup_anov94_ironsdefault, // 0xca5
        jup_ammo_50p_tc, // 0xca6
        jup_ammo_50p_rip, // 0xca7
        jup_ammo_500sw_lg, // 0xca8
        jup_ammo_500sw_hg, // 0xca9
        jup_ammo_500sw_tc, // 0xcaa
        jup_ammo_500sw_rip, // 0xcab
        jup_ammo_410g_ball, // 0xcac
        jup_ammo_410g_sl, // 0xcad
        jup_ammo_410g_db, // 0xcae
        jup_ammo_338lp, // 0xcaf
        jup_ammo_338lp_fr, // 0xcb0
        jup_ammo_338lp_ap, // 0xcb1
        jup_ammo_338lp_hp, // 0xcb2
        jup_ammo_338lp_op, // 0xcb3
        jup_ammo_338lp_db, // 0xcb4
        jup_ammo_338lp_hg, // 0xcb5
        jup_ammo_338lp_lg, // 0xcb6
        jup_ammo_338lp_xp, // 0xcb7
        jup_ammo_338lp_bb, // 0xcb8
        jup_ammo_127_tc, // 0xcb9
        jup_ammo_127_rip, // 0xcba
        jup_ammo_127_ss, // 0xcbb
        jup_ammo_68r_bb, // 0xcbc
        jup_ammo_338lp_rn, // 0xcbd
        jup_ammo_338nm_rn, // 0xcbe
        jup_ammo_50p_lg, // 0xcbf
        jup_ammo_50p_hg, // 0xcc0
        jup_jp25_ar_talpha95_barsil, // 0xcc1
        ironsdefault_fecho, // 0xcc2
        jup_jp08_ar_qbravo97_comb_ammo, // 0xcc3
        jup_jp08_ar_qbravo97_comb_ergo, // 0xcc4
        jup_jp08_ar_qbravo97_comb_pouch, // 0xcc5
        jup_jp08_ar_qbravo97_comb_tac, // 0xcc6
        jup_jp08_lm_qbravo95lsw_comb_ammo, // 0xcc7
        jup_jp08_lm_qbravo95lsw_comb_ergo, // 0xcc8
        jup_jp08_lm_qbravo95lsw_comb_tac, // 0xcc9
        jup_jp08_lm_qbravo95lsw_comb_pouch, // 0xcca
        jup_cp24_pi_glima21_bar_hijack, // 0xccb
        jup_cp24_pi_glima21_mag_hijack, // 0xccc
        jup_cp24_pi_glima21_trigger_hijack, // 0xccd
        jup_glima21_rec_hijack, // 0xcce
        ammo_bolt_ap, // 0xccf
        jup_oromeo12_ammo_12g_br, // 0xcd0
        jup_recho870_ammo_12g_br, // 0xcd1
        jup_bipod_mgolf, // 0xcd2
        jup_barbip_halpha, // 0xcd3
        jup_jp03_sm_pmike_barsil, // 0xcd4
        jup_comp_sn_01, // 0xcd5
        jup_jp20_lm_evictor_belt_50_762n, // 0xcd6
        jup_flashcomp_br_01, // 0xcd7
        jup_flashcomp_ar_01, // 0xcd8
        jup_sandbox_mike1014_tube_5_to_7, // 0xcd9
        jup_jp02_sm_scharlie3_bar_amp, // 0xcda
        jup_scharlie3_rec_amp, // 0xcdb
        jup_jp01_ar_golf36_bar_amp, // 0xcdc
        jup_golf36_rec_amp, // 0xcdd
        bar_ar_p56, // 0xcde
        bar_ar_heavy_p56, // 0xcdf
        bar_ar_long_p56, // 0xce0
        bar_ar_short_p56, // 0xce1
        bar_ar_hvylong_p56, // 0xce2
        barsil_ar_hvylong_p56, // 0xce3
        stock_ar_p56, // 0xce4
        stock_ar_heavy_p56, // 0xce5
        stock_ar_light_p56, // 0xce6
        stock_ar_tactical_p56, // 0xce7
        mag_ar_p56, // 0xce8
        mag_ar_small_p56, // 0xce9
        mag_ar_large_p56, // 0xcea
        ironsdefault_malima, // 0xceb
        selectsemi_malima, // 0xcec
        pgrip_p56, // 0xced
        pgrip_ass_p56, // 0xcee
        pgrip_aim_p56, // 0xcef
        pgrip_tac_p56, // 0xcf0
        rec_malima, // 0xcf1
        rec_kamas, // 0xcf2
        pickaxe_doom_blueprint_tuning, // 0xcf3
        bar_sm_short_p43_acharlie9, // 0xcf4
        bar_sm_p43_acharlie9, // 0xcf5
        barsil_sm_short_p43, // 0xcf6
        stock_sm_lgt_tactical_p43_acharlie9, // 0xcf7
        stock_sm_p43_acharlie9, // 0xcf8
        stockno_sm_p43, // 0xcf9
        mag_sm2_p43, // 0xcfa
        mag_sm2_small_p43, // 0xcfb
        drum_sm2_p43, // 0xcfc
        ironsdefault_acharlie9, // 0xcfd
        selectsemi_acharlie9, // 0xcfe
        ammo_9p_hv, // 0xcff
        pgrip_sm2_p43, // 0xd00
        pgrip_sm_p43_acharlie9, // 0xd01
        rec_acharlie9, // 0xd02
        barsil_sm_p02, // 0xd03
        barsil_sm_long_p02, // 0xd04
        barsil_sm_short_p02, // 0xd05
        stock_sm_p02_sdelta, // 0xd06
        mag_sm_p02_sdelta, // 0xd07
        ironsdefault_sdelta, // 0xd08
        selectauto_sdelta, // 0xd09
        pgrip_sm_tac_p02_sdelta, // 0xd0a
        rec_sdelta, // 0xd0b
        jup_reflex08_tall_amp, // 0xd0c
        jup_snprscope_hybrid_xl, // 0xd0d
        jup_ub_gl_drill_anov94, // 0xd0e
        jup_jp36_ar_anov94_stock_ass, // 0xd0f
        jup_jp36_sn_boscar_stock_ass, // 0xd10
        rec_pickaxe, // 0xd11
        pgrip_sm_ass_p02_sdelta, // 0xd12
        pgrip_sm_aim_p02_sdelta, // 0xd13
        comb_p56, // 0xd14
        comb_ergo_p56, // 0xd15
        comb_heavy_p56, // 0xd16
        comb_tactical_p56, // 0xd17
        trigger_heavy_p14, // 0xd18
        equip_smoke_rec, // 0xd19
        charlie725_doom_blueprint_tuning, // 0xd1a
        jup_boscar_ironsdefault, // 0xd1b
        jup_las_minireddot01_laser, // 0xd1c
        jup_ammo_545s_lg, // 0xd1d
        jup_ammo_545s_hg, // 0xd1e
        jup_jp19_dm_acharlied_stock_light, // 0xd1f
        jup_jp19_dm_acharlied_stock_tac, // 0xd20
        ammo_12g_sl_charlie725_heavytrig, // 0xd21
        ammo_12g_db_charlie725_heavytrig, // 0xd22
        jup_jp01_ar_golf36_bar_amp_dbar, // 0xd23
        jup_jp01_ar_golf36_drum_amp_dbar, // 0xd24
        jup_jp01_ar_golf36_grip_amp_dbar, // 0xd25
        jup_golf36_amp_dbar_rec, // 0xd26
        jup_jp09_sh_oromeo12_drum_amp_410g, // 0xd27
        jup_oromeo12_amp_rec, // 0xd28
        jup_cp05_lm_halpha_pgrip, // 0xd29
        jup_cp05_lm_halpha_pgrip_aim, // 0xd2a
        jup_cp05_lm_halpha_pgrip_ass, // 0xd2b
        jup_cp05_lm_halpha_pgrip_tac, // 0xd2c
        jup_cp05_lm_halpha_pgrip_snp, // 0xd2d
        jup_pkilob_bipod, // 0xd2e
        jup_jp07_sm_uzulu_bar_amp_45, // 0xd2f
        jup_jp07_sm_uzulu_stock_amp_45, // 0xd30
        jup_grip_uzulup1_amp, // 0xd31
        jup_uzulu_rec_amp, // 0xd32
        jup_laserir_cyl, // 0xd33
        jup_ammo_450b_bb, // 0xd34
        iw9_ironsdefault_falpha, // 0xd35
        iw9_selectsemi_falpha, // 0xd36
        jup_cp06_ar_falpha_bar, // 0xd37
        jup_cp06_ar_falpha_blong, // 0xd38
        jup_cp06_ar_falpha_bshort, // 0xd39
        jup_cp06_ar_falpha_bshort2, // 0xd3a
        jup_cp06_ar_falpha_stock_heavy, // 0xd3b
        jup_cp06_ar_falpha_stock, // 0xd3c
        jup_cp06_ar_falpha_stock_tactical, // 0xd3d
        jup_cp06_ar_falpha_mag, // 0xd3e
        jup_cp06_ar_falpha_mag_large, // 0xd3f
        jup_cp06_ar_falpha_mag_xlarge, // 0xd40
        jup_cp06_ar_falpha_comb, // 0xd41
        jup_cp06_ar_falpha_comb_tactical, // 0xd42
        jup_cp06_ar_falpha_comb_heavy, // 0xd43
        jup_cp06_ar_falpha_comb_ergo, // 0xd44
        jup_falpha_ironsdefault, // 0xd45
        jup_cp06_ar_falpha_pgrip, // 0xd46
        jup_cp06_ar_falpha_pgrip_ass, // 0xd47
        jup_cp06_ar_falpha_pgrip_aim, // 0xd48
        jup_cp06_ar_falpha_pgrip_tac, // 0xd49
        jup_falpha_rec, // 0xd4a
        jup_jp12_mike93_grip_amp_vert, // 0xd4b
        sp_reduce_idle, // 0xd4c
        jup_cp15_lm_mkilo3_bar_sm, // 0xd4d
        jup_cp15_lm_mkilo3_bar_heavy, // 0xd4e
        jup_cp15_lm_mkilo3_bar_long, // 0xd4f
        jup_cp15_lm_mkilo3_bar_light, // 0xd50
        jup_cp15_lm_mkilo3_bar_short, // 0xd51
        jup_cp15_lm_mkilo3_stock_heavy, // 0xd52
        jup_cp15_lm_mkilo3_stock_light, // 0xd53
        jup_cp15_lm_mkilo3_stock_lgttactical, // 0xd54
        jup_cp15_lm_mkilo3_stock, // 0xd55
        jup_cp15_lm_mkilo3_stock_tactical, // 0xd56
        jup_cp15_lm_mkilo3_belt, // 0xd57
        jup_cp15_lm_mkilo3_belt_large, // 0xd58
        jup_cp15_lm_mkilo3_mag_small, // 0xd59
        jup_mkilo3_ironsdefault, // 0xd5a
        jup_cp15_lm_mkilo3_pgrip, // 0xd5b
        jup_cp15_lm_mkilo3_pgrip_tac, // 0xd5c
        jup_cp15_lm_mkilo3_pgrip_ass, // 0xd5d
        jup_cp15_pgrip_aim, // 0xd5e
        jup_mkilo3_rec, // 0xd5f
        jup_cp15_lm_mkilo3_stockno, // 0xd60
        jup_jp13_sn_svictor_mag_5_338lmp, // 0xd61
        laserbox_ads05_cp_ai, // 0xd62
        jup_mkilo3_bipod, // 0xd63
        jup_jp19_dm_acharlied_mag_20_68r_amp, // 0xd64
        jup_jp19_dm_acharlied_stock_tacheavy, // 0xd65
        jup_oromeo12_ammo_12g_sl, // 0xd66
        jup_oromeo12_ammo_12g_he, // 0xd67
        jup_recho870_ammo_12g_sl, // 0xd68
        jup_recho870_ammo_12g_he, // 0xd69
        jup_boscar_scope_global, // 0xd6a
        jup_hsierra_scope_global, // 0xd6b
        jup_svictor_scope_global, // 0xd6c
        jup_boscar_irons_amp, // 0xd6d
        jup_ammo_86b, // 0xd6e
        jup_rec_boscar_amp, // 0xd6f
        jup_jp03_sm_pmike_pgrip_aim, // 0xd70
        jup_jp03_sm_pmike_pgrip_ass, // 0xd71
        jup_jp03_sm_pmike_pgrip_tac, // 0xd72
        jup_glima21_ironsdefault_convert, // 0xd73
        jup_ammo_45acp, // 0xd74
        cos_iw9_screen_001, // 0xd75
        cos_iw9_screen_002, // 0xd76
        cos_iw9_screen_003, // 0xd77
        cos_iw9_screen_004, // 0xd78
        cos_iw9_screen_005, // 0xd79
        cos_iw9_screen_006, // 0xd7a
        cos_iw9_screen_007, // 0xd7b
        cos_iw9_screen_008, // 0xd7c
        cos_iw9_screen_009, // 0xd7d
        cos_iw9_screen_010, // 0xd7e
        cos_iw9_screen_011, // 0xd7f
        cos_iw9_screen_012, // 0xd80
        cos_iw9_screen_013, // 0xd81
        cos_iw9_screen_014, // 0xd82
        cos_iw9_screen_015, // 0xd83
        cos_iw9_screen_016, // 0xd84
        cos_iw9_screen_017, // 0xd85
        cos_iw9_screen_018, // 0xd86
        cos_iw9_screen_019, // 0xd87
        cos_iw9_screen_020, // 0xd88
        cos_iw9_screen_021, // 0xd89
        cos_iw9_screen_022, // 0xd8a
        cos_iw9_screen_023, // 0xd8b
        cos_iw9_screen_024, // 0xd8c
        cos_iw9_screen_025, // 0xd8d
        cos_iw9_screen_026, // 0xd8e
        cos_iw9_screen_027, // 0xd8f
        cos_iw9_screen_028, // 0xd90
        cos_iw9_screen_029, // 0xd91
        cos_iw9_screen_030, // 0xd92
        cos_iw9_screen_031, // 0xd93
        cos_iw9_screen_032, // 0xd94
        cos_iw9_screen_033, // 0xd95
        cos_iw9_screen_034, // 0xd96
        cos_iw9_screen_035, // 0xd97
        cos_iw9_screen_036, // 0xd98
        cos_iw9_screen_037, // 0xd99
        cos_iw9_screen_038, // 0xd9a
        cos_iw9_screen_039, // 0xd9b
        cos_iw9_screen_040, // 0xd9c
        cos_iw9_screen_041, // 0xd9d
        cos_iw9_screen_042, // 0xd9e
        cos_iw9_screen_043, // 0xd9f
        cos_iw9_screen_044, // 0xda0
        cos_iw9_screen_045, // 0xda1
        cos_iw9_screen_046, // 0xda2
        cos_iw9_screen_047, // 0xda3
        cos_iw9_screen_048, // 0xda4
        cos_iw9_screen_049, // 0xda5
        cos_iw9_screen_050, // 0xda6
        cos_iw9_screen_051, // 0xda7
        cos_iw9_screen_052, // 0xda8
        cos_iw9_screen_053, // 0xda9
        cos_iw9_screen_054, // 0xdaa
        cos_iw9_screen_055, // 0xdab
        cos_iw9_screen_056, // 0xdac
        cos_iw9_screen_057, // 0xdad
        cos_iw9_screen_058, // 0xdae
        cos_iw9_screen_059, // 0xdaf
        cos_iw9_screen_060, // 0xdb0
        cos_iw9_screen_061, // 0xdb1
        cos_iw9_screen_062, // 0xdb2
        cos_iw9_screen_063, // 0xdb3
        cos_iw9_screen_064, // 0xdb4
        cos_iw9_screen_065, // 0xdb5
        cos_iw9_screen_066, // 0xdb6
        cos_iw9_screen_067, // 0xdb7
        cos_iw9_screen_068, // 0xdb8
        cos_iw9_screen_069, // 0xdb9
        cos_iw9_screen_070, // 0xdba
        cos_iw9_screen_071, // 0xdbb
        cos_iw9_screen_072, // 0xdbc
        cos_iw9_screen_073, // 0xdbd
        cos_iw9_screen_074, // 0xdbe
        cos_iw9_screen_075, // 0xdbf
        cos_iw9_screen_076, // 0xdc0
        cos_iw9_screen_077, // 0xdc1
        cos_iw9_screen_078, // 0xdc2
        cos_iw9_screen_079, // 0xdc3
        cos_iw9_screen_080, // 0xdc4
        cos_iw9_screen_081, // 0xdc5
        cos_iw9_screen_082, // 0xdc6
        cos_iw9_screen_083, // 0xdc7
        cos_iw9_screen_084, // 0xdc8
        cos_iw9_screen_085, // 0xdc9
        cos_iw9_screen_086, // 0xdca
        cos_iw9_screen_087, // 0xdcb
        cos_iw9_screen_088, // 0xdcc
        cos_iw9_screen_089, // 0xdcd
        cos_iw9_screen_090, // 0xdce
        cos_iw9_screen_091, // 0xdcf
        cos_iw9_screen_092, // 0xdd0
        cos_iw9_screen_093, // 0xdd1
        cos_iw9_screen_094, // 0xdd2
        cos_iw9_screen_095, // 0xdd3
        cos_iw9_screen_096, // 0xdd4
        cos_iw9_screen_097, // 0xdd5
        cos_iw9_screen_098, // 0xdd6
        cos_iw9_screen_099, // 0xdd7
        cos_iw9_screen_100, // 0xdd8
        cos_iw9_screen_101, // 0xdd9
        cos_iw9_screen_102, // 0xdda
        cos_iw9_screen_103, // 0xddb
        cos_iw9_screen_104, // 0xddc
        cos_iw9_screen_105, // 0xddd
        cos_iw9_screen_106, // 0xdde
        cos_iw9_screen_107, // 0xddf
        cos_iw9_screen_108, // 0xde0
        cos_iw9_screen_109, // 0xde1
        cos_iw9_screen_110, // 0xde2
        cos_iw9_screen_111, // 0xde3
        cos_iw9_screen_112, // 0xde4
        cos_iw9_screen_113, // 0xde5
        cos_iw9_screen_114, // 0xde6
        cos_iw9_screen_115, // 0xde7
        cos_iw9_screen_116, // 0xde8
        cos_iw9_screen_117, // 0xde9
        cos_iw9_screen_118, // 0xdea
        cos_iw9_screen_119, // 0xdeb
        cos_iw9_screen_120, // 0xdec
        cos_iw9_screen_121, // 0xded
        cos_iw9_screen_122, // 0xdee
        cos_iw9_screen_123, // 0xdef
        cos_iw9_screen_124, // 0xdf0
        cos_iw9_screen_125, // 0xdf1
        cos_iw9_screen_126, // 0xdf2
        cos_iw9_screen_127, // 0xdf3
        cos_iw9_screen_128, // 0xdf4
        cos_iw9_screen_129, // 0xdf5
        cos_iw9_screen_130, // 0xdf6
        cos_iw9_screen_131, // 0xdf7
        cos_iw9_screen_132, // 0xdf8
        cos_iw9_screen_133, // 0xdf9
        cos_iw9_screen_134, // 0xdfa
        cos_iw9_screen_135, // 0xdfb
        cos_iw9_screen_136, // 0xdfc
        cos_iw9_screen_137, // 0xdfd
        cos_iw9_screen_138, // 0xdfe
        cos_iw9_screen_139, // 0xdff
        cos_iw9_screen_140, // 0xe00
        cos_iw9_screen_141, // 0xe01
        cos_iw9_screen_142, // 0xe02
        cos_iw9_screen_143, // 0xe03
        cos_iw9_screen_144, // 0xe04
        cos_iw9_screen_145, // 0xe05
        cos_iw9_screen_146, // 0xe06
        cos_iw9_screen_147, // 0xe07
        cos_iw9_screen_148, // 0xe08
        cos_iw9_screen_149, // 0xe09
        cos_iw9_screen_150, // 0xe0a
        cos_jup_screen_001, // 0xe0b
        jup_sandbox_x125, // 0xe0c
        jup_sandbox_x200, // 0xe0d
        jup_ammo_50p_rn, // 0xe0e
        jup_ammo_50p_xp, // 0xe0f
        jup_jp25_ar_talpha95_bar_lgtlong, // 0xe10
        jup_comp_ar_13, // 0xe11
        jup_comp_ar_xxl, // 0xe12
        jup_grip_vertshort_01, // 0xe13
        jup_comp_sm_13, // 0xe14
        jup_flashcomp_sm_01, // 0xe15
        jup_comp_br_xxl, // 0xe16
        jup_comp_dm_xxl, // 0xe17
        jup_flashcomp_dm_01, // 0xe18
        jup_compound_ironsdefault, // 0xe19
        jup_ammo_arrow_std, // 0xe1a
        jup_ammo_arrow_rip, // 0xe1b
        jup_ammo_arrow_broad, // 0xe1c
        jup_ammo_arrow_shotgun, // 0xe1d
        jup_ammo_arrow_he, // 0xe1e
        jup_ammo_arrow_db, // 0xe1f
        jup_ammo_arrow_gas, // 0xe20
        jup_compound_rec, // 0xe21
        comp_sm_05_p01, // 0xe22
        breacher_sm_01_p01, // 0xe23
        jup_jp01_dm_slima8_bar_amp, // 0xe24
        jup_slima8_rec_amp, // 0xe25
        jup_acharlie450_rec_amp, // 0xe26
        jup_minireddot_hor_tall, // 0xe27
        jup_reflex05_tall, // 0xe28
        jup_reflex08_tall, // 0xe29
        jup_hybrid_proj, // 0xe2a
        jup_bipod01, // 0xe2b
        jup_reflex05_pstl, // 0xe2c
        jup_reflex08_pstl, // 0xe2d
        jup_flashcomp_pi_01, // 0xe2e
        jup_reflex05, // 0xe2f
        jup_reflex08, // 0xe30
        jup_jp10_sn_cdelta50_silencer_000, // 0xe31
        jup_comp_sn_xxl, // 0xe32
        jup_comp_sm_14, // 0xe33
        jup_comp_sm_xxl, // 0xe34
        jup_cdelta50_scope_global, // 0xe35
        jup_riotshield_rec, // 0xe36
        jup_comp_sm_14_amp, // 0xe37
        jup_jp23_me_swhiskey_rec, // 0xe38
        jup_jp32_pi_mpapa9_bar, // 0xe39
        jup_jp32_pi_mpapa9_bar_light, // 0xe3a
        jup_jp32_pi_mpapa9_bar_heavy, // 0xe3b
        jup_jp32_pi_mpapa9_bar_long, // 0xe3c
        jup_jp32_pi_mpapa9_stockno, // 0xe3d
        jup_jp32_pi_mpapa9_stock_skel, // 0xe3e
        jup_jp32_pi_mpapa9_stock_assault, // 0xe3f
        jup_jp32_pi_mpapa9_stock_tactical, // 0xe40
        jup_jp32_pi_mpapa9_mag, // 0xe41
        jup_jp32_pi_mpapa9_mag_small, // 0xe42
        jup_jp32_pi_mpapa9_mag_large, // 0xe43
        jup_mpapa9_ironsdefault, // 0xe44
        jup_jp32_pgrip, // 0xe45
        jup_jp32_pi_mpapa9_pgrip_aim, // 0xe46
        jup_jp32_pi_mpapa9_pgrip_ass, // 0xe47
        jup_jp32_pi_mpapa9_pgrip_tac, // 0xe48
        jup_mpapa9_rec, // 0xe49
        jup_jp34_ar_balpha27_bar, // 0xe4a
        jup_jp34_ar_balpha27_bar_light, // 0xe4b
        jup_jp34_ar_balpha27_bar_long, // 0xe4c
        jup_jp34_ar_balpha27_bar_heavy, // 0xe4d
        jup_jp34_ar_balpha27_barsil, // 0xe4e
        jup_jp34_ar_balpha27_stock_light, // 0xe4f
        jup_jp34_ar_balpha27_stock, // 0xe50
        jup_jp34_ar_balpha27_stock_tactical, // 0xe51
        jup_jp34_ar_balpha27_stock_heavy, // 0xe52
        jup_balpha27_ironsdefault, // 0xe53
        jup_jp34_pgrip, // 0xe54
        jup_jp34_ar_balpha27_pgrip_aim, // 0xe55
        jup_jp34_ar_balpha27_pgrip_ass, // 0xe56
        jup_jp34_ar_balpha27_pgrip_tac, // 0xe57
        jup_jp34_ar_balpha27_pgrip_snp, // 0xe58
        jup_balpha27_rec, // 0xe59
        jup_jp25_sm_talpham_bar_shorthvy, // 0xe5a
        jup_jp25_sm_talpham_bar_light, // 0xe5b
        jup_jp25_sm_talpham_bar, // 0xe5c
        jup_jp25_sm_talpham_bar_shortlight, // 0xe5d
        jup_jp25_sm_talpham_barsil, // 0xe5e
        jup_jp25_sm_talpham_stock, // 0xe5f
        jup_jp25_sm_talpham_stock_hvy, // 0xe60
        jup_jp25_sm_talpham_stock_hvy_ass, // 0xe61
        jup_jp25_sm_talpham_stock_tac, // 0xe62
        jup_jp25_sm_talpham_stock_taclight, // 0xe63
        jup_jp25_sm_talpham_mag_9p, // 0xe64
        jup_jp25_sm_talpham_mag_large_9p, // 0xe65
        jup_jp25_sm_talpham_mag_xl_9p, // 0xe66
        jup_jp25_sm_talpham_comb_ammo, // 0xe67
        jup_jp25_sm_talpham_comb_ergo, // 0xe68
        jup_jp25_sm_talpham_comb_pouch, // 0xe69
        jup_jp25_sm_talpham_comb_tac, // 0xe6a
        jup_talpham_ironsdefault, // 0xe6b
        jup_jp25_sm_talpham_pgrip_aim, // 0xe6c
        jup_jp25_sm_talpham_pgrip_ass, // 0xe6d
        jup_jp25_sm_talpham_pgrip_tac, // 0xe6e
        jup_talpham_rec, // 0xe6f
        jup_jp03_br_aromeo200_mag_30_762n, // 0xe70
        jup_cp08_br_xmike5_lever_stockno_amp, // 0xe71
        jup_cp08_br_xmike5_lever_stock_amp, // 0xe72
        jup_cp08_br_xmike5_mag_amp, // 0xe73
        jup_xmike5_rec_amp, // 0xe74
        jup_jp35_sn_moscar_bar, // 0xe75
        jup_jp35_sn_moscar_bar_heavy, // 0xe76
        jup_jp35_sn_moscar_bar_short, // 0xe77
        jup_jp35_sn_moscar_bar_long, // 0xe78
        jup_jp35_sn_moscar_bar_blund, // 0xe79
        jup_jp35_sn_moscar_bar_charge, // 0xe7a
        jup_jp35_sn_moscar_bar_light, // 0xe7b
        jup_jp35_sn_moscar_stock, // 0xe7c
        jup_jp35_sn_moscar_stock_lgt, // 0xe7d
        jup_jp35_sn_moscar_stock_hvy, // 0xe7e
        jup_jp35_sn_moscar_stock_tac, // 0xe7f
        jup_jp35_sn_moscar_stockno, // 0xe80
        jup_jp35_sn_moscar_bolt, // 0xe81
        jup_jp35_sn_moscar_bolt_hvy, // 0xe82
        jup_jp35_sn_moscar_bolt_light, // 0xe83
        jup_moscar_ironsdefault, // 0xe84
        jup_ammo_rail_std, // 0xe85
        jup_ammo_rail_hv, // 0xe86
        jup_ammo_rail_he, // 0xe87
        jup_jp35_sn_moscar_pgrip, // 0xe88
        jup_jp35_sn_moscar_pgrip_aim, // 0xe89
        jup_jp35_sn_moscar_pgrip_tac, // 0xe8a
        jup_jp35_sn_moscar_pgrip_ass, // 0xe8b
        jup_moscar_rec, // 0xe8c
        jup_jp25_ar_talpha95_mag_30_9mm_amp, // 0xe8d
        jup_talpha95_rec_amp, // 0xe8e
        jup_piscope01_rsierra, // 0xe8f
        jup_arscope_vz01_rsierra, // 0xe90
        jup_arscope_vz02_rsierra, // 0xe91
        jup_arscope_vz01_rsierra_amp, // 0xe92
        jup_arscope_vz02_rsierra_amp, // 0xe93
        jup_ub_saw_01, // 0xe94
        jup_selectburst_single, // 0xe95
        jup_ub_shield_amp, // 0xe96
        jup_jp05_ar_foxtrot2000_9mm_amp, // 0xe97
        jup_mpapa9_grip_vert, // 0xe98
        jup_grip_angled_mpapa9, // 0xe99
        jup_silencer_sm_mpapa9, // 0xe9a
        jup_reflex_proj_tall, // 0xe9b
        equip_ammo_box_rec, // 0xe9c
        jup_equip_thermite_rec, // 0xe9d
        equip_flash_rec, // 0xe9e
        equip_shock_rec, // 0xe9f
        jup_equip_deployable_cover_rec, // 0xea0
        jup_jp01_lm_mgolf36_bar_adverse_amp, // 0xea1
        jup_twofivex08, // 0xea2
        jup_reflex_proj, // 0xea3
        jup_reflex07, // 0xea4
        jup_me_pdango, // 0xea5
        jup_iron_xmike5_amp, // 0xea6
        jup_reflex09_tall, // 0xea7
        jup_cp01_sm_coscar635_bar_hmr_amp, // 0xea8
        jup_cp01_sm_coscar635_stock_hmr_amp, // 0xea9
        jup_cp01_sm_coscar635_mag_30_556n, // 0xeaa
        jup_coscar635_hmr_amp_rec, // 0xeab
        equip_stun_rec, // 0xeac
        jup_cp19_dm_sbeta_bar_1887_amp, // 0xead
        jup_cp19_dm_sbeta_stock_1887_amp, // 0xeae
        jup_cp19_dm_sbeta_guard_1887_amp, // 0xeaf
        jup_cp19_dm_sbeta_lever_1887_amp, // 0xeb0
        jup_cp19_dm_sbeta_rec_1887_amp, // 0xeb1
        jup_jp36_sn_boscar_bolt_heavy_amp, // 0xeb2
        jup_moscar_bipod, // 0xeb3
        jup_cp04_sh_vecho_bar_br_amp, // 0xeb4
        jup_cp04_sh_vecho_mag_br_amp, // 0xeb5
        jup_cp04_sh_vecho_rec_br_amp, // 0xeb6
        jup_ammo_762n_amp, // 0xeb7
        jup_cp15_lm_mkilo3_barsil_300_amp, // 0xeb8
        jup_cp15_lm_mkilo3_stock_300_amp, // 0xeb9
        jup_mkilo3_rec_amp, // 0xeba
        jup_cp15_lm_mkilo3_mag_300_amp, // 0xebb
        jup_jp12_pi_mike93_trigger_amp, // 0xebc
        jup_killstreak_cluster_spike_rec, // 0xebd
        jup_killstreak_sentry_gun_rec, // 0xebe
        jup_cp02_sm_sdelta_pgrip_amp, // 0xebf
        jup_jp05_ar_foxtrot2000_bar_amp, // 0xec0
        jup_jp05_ar_foxtrot2000_stock_amp, // 0xec1
        jup_foxtrot2000_rec_amp, // 0xec2
        jup_cp01_ar_mike4_bar_amp_50b, // 0xec3
        jup_cp01_ar_mike4_mag_7_50b_amp, // 0xec4
        jup_ammo_50bw_amp, // 0xec5
        jup_cp01_ar_mike4_rec_amp, // 0xec6
        jup_ammo_44mm_slug, // 0xec7
        jup_ammo_44mm_sticky, // 0xec8
        jup_jp26_la_mike32_rec_amp, // 0xec9
        jup_ammo_44mm_airburst, // 0xeca
        jup_ammo_44mm_drill, // 0xecb
        jup_ammo_44mm_impact, // 0xecc
        jup_iron_mike16_amp, // 0xecd
        jup_iron_cdelta50, // 0xece
        jup_rec_mike16, // 0xecf
        jup_cp01_ar_mike16_bar_amp, // 0xed0
        jup_equip_trophy_rec, // 0xed1
        jup_jp32_pi_mpapa9_stock_light, // 0xed2
        jup_equip_thermobaric_rec, // 0xed3
        jup_silencer_ar_jp34, // 0xed4
        jup_silencer_br_jp34, // 0xed5
        jup_jp25_ar_balpha27_mag, // 0xed6
        jup_jp25_ar_balpha27_mag_large, // 0xed7
        jup_jp25_ar_balpha27_mag_las, // 0xed8
        jup_ammo_5x28_lg, // 0xed9
        jup_ammo_5x28_hg, // 0xeda
        jup_cp01_sm_pcharlie9_bar, // 0xedb
        jup_cp01_sm_pcharlie9_bar_hvy, // 0xedc
        jup_cp01_sm_pcharlie9_bar_hvy_long, // 0xedd
        jup_cp01_sm_pcharlie9_bar_short, // 0xede
        jup_cp01_sm_pcharlie9_bar_light_long, // 0xedf
        jup_cp01_sm_pcharlie9_barsil_long, // 0xee0
        jup_cp01_sm_pcharlie9_barsil_short, // 0xee1
        jup_cp01_sm_pcharlie9_stock_aim, // 0xee2
        jup_cp01_sm_pcharlie9_stockno, // 0xee3
        jup_cp01_sm_pcharlie9_stock, // 0xee4
        jup_cp01_sm_pcharlie9_stock_ass, // 0xee5
        jup_cp01_sm_pcharlie9_stockr, // 0xee6
        jup_cp01_sm_pcharlie9_mag_30_4x30, // 0xee7
        jup_cp01_sm_pcharlie9_mag_20_4x30, // 0xee8
        jup_cp01_sm_pcharlie9_mag_40_4x30, // 0xee9
        jup_pcharlie9_ironsdefault, // 0xeea
        jup_cp01_sm_pcharlie9_pgrip, // 0xeeb
        jup_cp01_sm_pcharlie9_pgrip_aim, // 0xeec
        jup_cp01_sm_pcharlie9_pgrip_skelass, // 0xeed
        jup_cp01_sm_pcharlie9_pgrip_tac, // 0xeee
        jup_pcharlie9_rec, // 0xeef
        jup_moscar_scope_global, // 0xef0
        jup_moscar_scope, // 0xef1
        jup_killstreak_cluster_spike_proj_rec, // 0xef2
        jup_jp38_sh_spapa12_stock_light, // 0xef3
        jup_jp38_sh_spapa12_stockno, // 0xef4
        jup_spapa12_rec, // 0xef5
        jup_jp38_sh_spapa12_bar, // 0xef6
        jup_jp38_sh_spapa12_bar_long, // 0xef7
        jup_jp38_sh_spapa12_bar_long_hvy, // 0xef8
        jup_jp38_sh_spapa12_stock, // 0xef9
        jup_jp38_sh_spapa12_stock_hvy, // 0xefa
        jup_jp38_sh_spapa12_stocno_irons, // 0xefb
        jup_jp38_sh_spapa12_pgrip, // 0xefc
        jup_jp38_sh_spapa12_pgrip_aim, // 0xefd
        jup_jp38_sh_spapa12_pgrip_ass, // 0xefe
        jup_jp38_sh_spapa12_pgrip_tac, // 0xeff
        jup_jp38_sh_spapa12_irons, // 0xf00
        jup_moscar_minidot_global, // 0xf01
        jup_jp37_dm_kappa98_bar, // 0xf02
        jup_jp37_dm_kappa98_bar_short, // 0xf03
        jup_kappa98_rec, // 0xf04
        jup_jp37_dm_kappa98_bar_hvy, // 0xf05
        jup_jp37_dm_kappa98_bar_long, // 0xf06
        jup_jp37_dm_kappa98_stock, // 0xf07
        jup_jp37_dm_kappa98_stock_precision, // 0xf08
        jup_jp37_dm_kappa98_stock_tac, // 0xf09
        jup_jp37_dm_kappa98_stockno, // 0xf0a
        jup_jp37_dm_kappa98_mag_stripper, // 0xf0b
        jup_jp37_dm_kappa98_irons, // 0xf0c
        jup_jp37_dm_kappa98_scope, // 0xf0d
        jup_me_shotel, // 0xf0e
        jup_jp37_dm_kappa98_single, // 0xf0f
        jup_ammo_8mm, // 0xf10
        jup_ammo_8mm_lg, // 0xf11
        jup_ammo_8mm_hg, // 0xf12
        jup_ammo_8mm_rn, // 0xf13
        jup_ammo_8mm_xp, // 0xf14
        jup_ammo_8mm_fr, // 0xf15
        jup_ammo_8mm_hp, // 0xf16
        jup_ammo_8mm_ap, // 0xf17
        jup_ammo_8mm_op, // 0xf18
        jup_ammo_8mm_hv, // 0xf19
        jup_ammo_8mm_sp, // 0xf1a
        jup_foxtrot2000_grip_vert_amp, // 0xf1b
        jup_jp41_sm_kpappa50_bar, // 0xf1c
        jup_jp41_sm_kpappa50_bar_light, // 0xf1d
        jup_jp41_sm_kpappa50_bar_long, // 0xf1e
        jup_jp41_sm_kpappa50_barcomp, // 0xf1f
        jup_jp41_sm_kpappa50_stock_light, // 0xf20
        jup_jp41_sm_kpappa50_stock, // 0xf21
        jup_jp41_sm_kpappa50_stock_tac, // 0xf22
        jup_jp41_sm_kpappa50_stock_ass, // 0xf23
        jup_jp41_sm_kpappa50_stockno, // 0xf24
        jup_jp41_sm_kpappa50_mag_50, // 0xf25
        jup_kpappa50_ironsdefault, // 0xf26
        jup_jp41_sm_kpappa50_pgrip, // 0xf27
        jup_jp41_sm_kpappa50_pgrip_aim, // 0xf28
        jup_jp41_sm_kpappa50_pgrip_ass, // 0xf29
        jup_jp41_sm_kpappa50_pgrip_skel, // 0xf2a
        jup_kpappa50_rec, // 0xf2b
        jup_jp41_sm_kpappa50_stockr_heavy, // 0xf2c
        jup_me_spear, // 0xf2d
        jup_cp01_ar_mike4_bar_amp, // 0xf2e
        jup_jp32_pi_mpapa9_bar_amp, // 0xf2f
        jup_jp32_pi_mpapa9_drum, // 0xf30
        jup_jp32_pi_mpapa9_drum_amp, // 0xf31
        jup_mpapa9_rec_amp, // 0xf32
        jup_cp26_pi_swhiskey_cyl_amp, // 0xf33
        jup_ammo_357, // 0xf34
        jup_swhiskey_rec_amp, // 0xf35
        jup_ammo_410g_sl_amp, // 0xf36
        jup_ammo_410g_db_amp, // 0xf37
        jup_ammo_410g_ball_amp, // 0xf38
        jup_jp34_ar_balpha27_bar_burst, // 0xf39
        jup_jp44_ar_stango44_bar, // 0xf3a
        jup_jp44_ar_stango44_bar_hvy, // 0xf3b
        jup_jp44_ar_stango44_bar_short, // 0xf3c
        jup_jp44_ar_stango44_barsil, // 0xf3d
        jup_jp44_ar_stango44_bar_long, // 0xf3e
        jup_jp44_ar_stango44_bar_hvy_long, // 0xf3f
        jup_jp44_ar_stango44_stock, // 0xf40
        jup_jp44_ar_stango44_stock_tac, // 0xf41
        jup_jp44_ar_stango44_stock_ass, // 0xf42
        jup_jp44_ar_stango44_stockr, // 0xf43
        jup_jp44_ar_stango44_stock_stockno, // 0xf44
        jup_jp44_ar_stango44_mag_30, // 0xf45
        jup_jp44_ar_stango44_mag_40, // 0xf46
        jup_jp44_ar_stango44_mag_50, // 0xf47
        jup_stango44_ironsdefault, // 0xf48
        jup_jp44_ar_stango44_pgrip, // 0xf49
        jup_jp44_ar_stango44_pgrip_ass, // 0xf4a
        jup_stango44_rec, // 0xf4b
        jup_bromeo_stock_hmr_amp, // 0xf4c
        jup_acharlie_stock_hmr_amp, // 0xf4d
        jup_tube_6_410g_amp, // 0xf4e
        jup_cp01_sm_pcharlie9_pgrip_ass, // 0xf4f
        jup_jp13_rec_amp, // 0xf50
        jup_jp37_dm_kappa98_pgrip_aim, // 0xf51
        jup_jp37_dm_kappa98_pgrip_quick, // 0xf52
        jup_jp37_dm_kappa98_pgrip_tac, // 0xf53
        jup_jp35_sn_moscar_bar_explode, // 0xf54
        jup_ub_arc, // 0xf55
        jup_ammo_410g_vortex, // 0xf56
        jup_ammo_5x28_hv, // 0xf57
        dmscope_vz01_kappa98, // 0xf58
        vzscope_mromeo_kappa98, // 0xf59
        jup_silencer_kappa98, // 0xf5a
        jup_kappa98_bayonet, // 0xf5b
        jup_cp01_ar_mike4_bar_long_amp_50b, // 0xf5c
        jup_cp01_ar_mike4_bar_short_amp_50b, // 0xf5d
        jup_jp38_sh_spapa12_bar_short_hvy, // 0xf5e
        jup_jp38_sh_spapa12_tube_std_12g, // 0xf5f
        jup_jp38_sh_spapa12_tube_large_12g, // 0xf60
        jup_jp38_sh_spapa12_tube_small_12g, // 0xf61
        guard_p19_barsil, // 0xf62
        ammo_762n_vortex, // 0xf63
        jup_spapa12_akimbo, // 0xf64
        jup_spapa12_selectsemi, // 0xf65
        jup_rec_sdelta_amp, // 0xf66
        jup_mike93_rec_semi, // 0xf67
        jup_ammo_4x30_hg, // 0xf68
        jup_ammo_4x30_lg, // 0xf69
        jup_jp28_lm_rpapa20_bar, // 0xf6a
        jup_jp28_lm_rpapa20_bar_long, // 0xf6b
        jup_jp28_lm_rpapa20_bar_short, // 0xf6c
        jup_jp28_lm_rpapa20_stock, // 0xf6d
        jup_jp28_lm_rpapa20_stock_heavy, // 0xf6e
        jup_jp28_lm_rpapa20_stock_ass, // 0xf6f
        jup_jp28_lm_rpapa20_stockno, // 0xf70
        jup_jp28_lm_rpapa20_stock_light, // 0xf71
        jup_jp28_lm_rpapa20_belt_100_545, // 0xf72
        jup_jp28_lm_rpapa20_belt_150_545, // 0xf73
        jup_rpapa20_ironsdefault, // 0xf74
        jup_jp28_lm_rpapa20_pgrip, // 0xf75
        jup_jp28_lm_rpapa20_pgrip_aim, // 0xf76
        jup_jp28_lm_rpapa20_pgrip_ass, // 0xf77
        jup_jp28_lm_rpapa20_pgrip_tac, // 0xf78
        jup_jp28_lm_rpapa20_pgrip_snp, // 0xf79
        jup_rpapa20_bipod, // 0xf7a
        jup_rec_rpapa20, // 0xf7b
        jup_jp40_br_hcharlie36_bar, // 0xf7c
        jup_jp40_br_hcharlie36_bar_long, // 0xf7d
        jup_jp40_br_hcharlie36_bar_hvy, // 0xf7e
        jup_jp40_br_hcharlie36_bar_hvylong, // 0xf7f
        jup_jp40_br_hcharlie36_bar_short, // 0xf80
        jup_jp40_br_hcharlie36_barsil, // 0xf81
        jup_jp40_br_hcharlie36_stock, // 0xf82
        jup_jp40_br_hcharlie36_stock_ass, // 0xf83
        jup_jp40_br_hcharlie36_stock_marksman, // 0xf84
        jup_jp40_br_hcharlie36_stockr, // 0xf85
        jup_jp40_br_hcharlie36_stock_aim, // 0xf86
        jup_jp40_br_hcharlie36_mag_20_36s, // 0xf87
        jup_jp40_br_hcharlie36_mag_30_36s, // 0xf88
        jup_jp40_br_hcharlie36_mag_40_36s, // 0xf89
        jup_hcharlie36_ironsdefault, // 0xf8a
        jup_jp40_br_hcharlie36_pgrip, // 0xf8b
        jup_jp40_br_hcharlie36_pgrip_ass, // 0xf8c
        jup_jp40_br_hcharlie36_pgrip_tac, // 0xf8d
        jup_jp40_br_hcharlie36_pgrip_snp, // 0xf8e
        jup_hcharlie36_rec, // 0xf8f
        jup_cp16_lm_rkilo_bar_amp, // 0xf90
        jup_cp04_lm_rkilo_drum_amp, // 0xf91
        jup_cp16_lm_rkilo_scope_amp, // 0xf92
        jup_rkilo_rec_amp, // 0xf93
        jup_cp16_lm_slima_bar_amp, // 0xf94
        jup_cp16_lm_slima_irons_amp, // 0xf95
        jup_cp16_lm_slima_select_amp, // 0xf96
        jup_cp16_lm_slima_barbip, // 0xf97
        jup_slima_rec_amp, // 0xf98
        jup_jp35_sn_moscar_ammo_blund, // 0xf99
        jup_moscar_rec_blund, // 0xf9a
        jup_cp01_ar_mike4_stock_amp_50b, // 0xf9b
        jup_jp38_sh_spapa12_bar_amp, // 0xf9c
        jup_spapa12_rec_amp, // 0xf9d
        jup_bar_ar_p04_akilo_amp, // 0xf9e
        jup_ironsdefault_akilo_amp, // 0xf9f
        jup_rec_akilo_amp, // 0xfa0
        jup_las_dmscope01_kappa98, // 0xfa1
        jup_ammo_792, // 0xfa2
        jup_ammo_792_lg, // 0xfa3
        jup_ammo_792_hg, // 0xfa4
        jup_ammo_792_rn, // 0xfa5
        jup_ammo_792_xp, // 0xfa6
        jup_ammo_792_fr, // 0xfa7
        jup_ammo_792_hp, // 0xfa8
        jup_ammo_792_tr, // 0xfa9
        jup_ammo_792_ap, // 0xfaa
        jup_ammo_792_op, // 0xfab
        jup_ammo_792_hv, // 0xfac
        jup_ammo_792_db, // 0xfad
        jup_lnchrscope_mike32_amp, // 0xfae
        jup_jp41_sm_kpappa50_barsil, // 0xfaf
        jup_comp_sm_16, // 0xfb0
        jup_grip_vert_tk_amp, // 0xfb1
        jup_grip_vert_09, // 0xfb2
        jup_jp17_sn_hsierra_bar_amp, // 0xfb3
        jup_jp17_sn_hsierra_mag_amp, // 0xfb4
        jup_ammo_sab_amp, // 0xfb5
        jup_hsierra_rec_amp, // 0xfb6
        jup_axefist, // 0xfb7
        jup_ub_flame_01_mutation, // 0xfb8
        jup_jp13_stockr_amp_svictork, // 0xfb9
        jup_jp13_stockr_amp_svictor, // 0xfba
        jup_jp44_ar_stango44_pgrip_skeltac, // 0xfbb
        jup_jp44_ar_stango44_pgrip_skelsnp, // 0xfbc
        jup_jp44_ar_stango44_pgrip_ass2, // 0xfbd
        jup_ammo_arrow_snapshot, // 0xfbe
        jup_ammo_127_db_arcade, // 0xfbf
        jup_ammo_50b_mini, // 0xfc0
        ammo_45acp_tracer, // 0xfc1
        jup_jp34_ar_balpha27_bar_scatter, // 0xfc2
        jup_spapa12_selectsemi_slug, // 0xfc3
        jup_spapa12_selectsemi_bolo, // 0xfc4
        jup_spapa12_ammo_12g_br, // 0xfc5
        jup_spapa12_ammo_12g_sl, // 0xfc6
        jup_spapa12_ammo_12g_he, // 0xfc7
        jup_silencer_xxl_ar, // 0xfc8
        jup_grip_angled_gh, // 0xfc9
        jup_silencer_xxl_br, // 0xfca
        jup_silencer_xxl_sm, // 0xfcb
        jup_silencer_xxl_dm, // 0xfcc
        jup_silencer_xxl_sn, // 0xfcd
        jup_jp06_lm_pkilop_stock_heavy3_amp, // 0xfce
        jup_hybrid03_amp, // 0xfcf
        jup_balpha27_rec_amp, // 0xfd0
        jup_silencer_br_las, // 0xfd1
        jup_grip_side_hip, // 0xfd2
        jup_jp28_lm_rpapa20_bar_heavy, // 0xfd3
        jup_comp_rpapa20, // 0xfd4
        jup_moscar_minidot_amp, // 0xfd5
        jup_paintball, // 0xfd6
        jup_ammo_30_06_xp, // 0xfd7
        jup_ammo_30_06_lg, // 0xfd8
        jup_ammo_30_06_hg, // 0xfd9
        jup_ammo_30_06_tr, // 0xfda
        jup_ammo_30_06, // 0xfdb
        jup_ammo_30_06_op, // 0xfdc
        jup_ammo_30_06_hv, // 0xfdd
        jup_ammo_30_06_hp, // 0xfde
        jup_ammo_30_06_fr, // 0xfdf
        jup_ammo_30_06_ap, // 0xfe0
        jup_reflex_compound, // 0xfe1
        jup_bar_sh_cp44_amp, // 0xfe2
        jup_mag_sh_cp44_amp, // 0xfe3
        jup_pgrip_sh_cp44_amp, // 0xfe4
        jup_rec_tsierra12_amp, // 0xfe5
        jup_ammo_arrow_sh_tsierra12, // 0xfe6
        jup_jp38_sh_spapa12_tube_std_12g_amp, // 0xfe7
        jup_dromeo_rec_amp, // 0xfe8
        jup_jp38_sh_spapa12_stock_double_amp, // 0xfe9
        jup_comp_br_17, // 0xfea
        jup_stock_sh_p44_amp, // 0xfeb
        jup_trig_sh_p44_amp, // 0xfec
        zm_ar_acharlie300, // 0xfed
        zm_ar_acharlie300_pack, // 0xfee
        bar_ar_p04_akilo_amp, // 0xfef
        ironsdefault_akilo_amp, // 0xff0
        rec_akilo_amp, // 0xff1
        rec_akilo_test, // 0xff2
        zm_ar_akilo, // 0xff3
        zm_ar_akilo_pack, // 0xff4
        zm_ar_akilo105, // 0xff5
        zm_ar_akilo105_pack, // 0xff6
        zm_ar_akilo74, // 0xff7
        zm_ar_akilo74_pack, // 0xff8
        test_stocksaw_1, // 0xff9
        test_stocksaw_2, // 0xffa
        test_stocksaw_3, // 0xffb
        zm_ar_augolf, // 0xffc
        zm_ar_augolf_pack, // 0xffd
        zm_ar_falpha, // 0xffe
        zm_ar_falpha_pack, // 0xfff
        zm_br_golf3, // 0x1000
        zm_br_golf3_pack, // 0x1001
        zm_ar_helima, // 0x1002
        zm_ar_helima_pack, // 0x1003
        zm_ar_kilo53, // 0x1004
        zm_ar_kilo53_pack, // 0x1005
        zm_ar_malima, // 0x1006
        zm_ar_malima_pap, // 0x1007
        zm_ar_mcbravo, // 0x1008
        zm_ar_mcbravo_pack, // 0x1009
        zm_ar_mcharlie, // 0x100a
        zm_ar_mcharlie_pack, // 0x100b
        zm_ar_mike16, // 0x100c
        zm_ar_mike16_pack, // 0x100d
        zm_ar_mike4, // 0x100e
        zm_ar_mike4_pack, // 0x100f
        zm_ar_ralpha, // 0x1010
        zm_ar_ralpha_pack, // 0x1011
        zm_ar_scharlie, // 0x1012
        zm_ar_scharlie_pack, // 0x1013
        zm_ar_schotel, // 0x1014
        zm_ar_schotel_pack, // 0x1015
        zm_br_msecho, // 0x1016
        zm_br_msecho_pack, // 0x1017
        flash_dm_04_p01, // 0x1018
        silencer02_dm_p01, // 0x1019
        comp_dm_03_p01, // 0x101a
        zm_br_ngsierra, // 0x101b
        zm_br_ngsierra_pack, // 0x101c
        zm_br_soscar14, // 0x101d
        zm_br_soscar14_pack, // 0x101e
        zm_dm_crossbow, // 0x101f
        zm_dm_crossbow_pack, // 0x1020
        zm_dm_la700, // 0x1021
        zm_dm_la700_pack, // 0x1022
        zm_dm_mike14, // 0x1023
        zm_dm_mike14_pack, // 0x1024
        zm_dm_mike24, // 0x1025
        zm_dm_mike24_pack, // 0x1026
        zm_dm_pgolf1, // 0x1027
        zm_dm_pgolf1_pack, // 0x1028
        zm_dm_sbeta, // 0x1029
        zm_dm_sbeta_pack, // 0x102a
        zm_dm_scromeo, // 0x102b
        zm_dm_scromeo_pack, // 0x102c
        zm_dm_stango25, // 0x102d
        zm_dm_stango25_pack, // 0x102e
        zm_dm_xmike2010, // 0x102f
        zm_dm_xmike2010_pack, // 0x1030
        zm_me_jup_knife_ob, // 0x1031
        zm_lm_ahotel, // 0x1032
        zm_lm_ahotel_pack, // 0x1033
        t10_sp_laserads_bright_dblmg, // 0x1034
        zm_lm_foxtrot, // 0x1035
        zm_lm_foxtrot_pack, // 0x1036
        zm_lm_kilo21, // 0x1037
        zm_lm_kilo21_pack, // 0x1038
        zm_lm_mkilo3, // 0x1039
        zm_lm_mkilo3_pack, // 0x103a
        zm_lm_ngolf7, // 0x103b
        zm_lm_ngolf7_pack, // 0x103c
        zm_lm_rkilo, // 0x103d
        zm_lm_rkilo_pack, // 0x103e
        zm_lm_slima, // 0x103f
        zm_lm_slima_pack, // 0x1040
        zm_me_kamas, // 0x1041
        zm_me_kamas_pap, // 0x1042
        zm_me_iw9_knife, // 0x1043
        zm_me_iw9_knife_pap, // 0x1044
        zm_me_jup_pickaxe, // 0x1045
        zm_me_jup_pickaxe_pap, // 0x1046
        zm_me_riotshield, // 0x1047
        zm_me_riotshield_pap, // 0x1048
        zm_me_sword01, // 0x1049
        zm_me_sword01_pap, // 0x104a
        zm_me_tonfa, // 0x104b
        zm_me_tonfa_pap, // 0x104c
        zm_pi_decho, // 0x104d
        zm_pi_decho_pack, // 0x104e
        zm_pi_dechoauto, // 0x104f
        zm_pi_dechoauto_pack, // 0x1050
        zm_pi_golf17, // 0x1051
        zm_pi_golf17_pack, // 0x1052
        zm_pi_golf18, // 0x1053
        zm_pi_golf18_pack, // 0x1054
        zm_pi_mike2011, // 0x1055
        zm_pi_mike2011_pap, // 0x1056
        zm_pi_papa220, // 0x1057
        zm_pi_papa220_pack, // 0x1058
        zm_pi_swhiskey, // 0x1059
        zm_pi_swhiskey_pack, // 0x105a
        test_hipfire_1, // 0x105b
        test_hipfire_2, // 0x105c
        zm_pi_tango9, // 0x105d
        zm_pi_tango9_pack, // 0x105e
        zm_sh_charlie725, // 0x105f
        zm_sh_charlie725_pack, // 0x1060
        zm_sh_mbravo, // 0x1061
        zm_sh_mbravo_pack, // 0x1062
        zm_sh_mike1014, // 0x1063
        zm_sh_mike1014_pack, // 0x1064
        zm_sh_mviktor, // 0x1065
        zm_sh_mviktor_pack, // 0x1066
        zm_sh_tsierra12, // 0x1067
        zm_sh_tsierra12_pack, // 0x1068
        zm_sh_vecho, // 0x1069
        zm_sh_vecho_pack, // 0x106a
        zm_sm_acharlie45, // 0x106b
        zm_sm_acharlie45_pack, // 0x106c
        zm_sm_acharlie9, // 0x106d
        zm_sm_acharlie9_pap, // 0x106e
        zm_sm_alpha57, // 0x106f
        zm_sm_alpha57_pack, // 0x1070
        zm_sm_apapa, // 0x1071
        zm_sm_apapa_pack, // 0x1072
        zm_sm_aviktor, // 0x1073
        zm_sm_aviktor_pack, // 0x1074
        zm_sm_beta, // 0x1075
        zm_sm_beta_pack, // 0x1076
        bar_sm_heavy_p04, // 0x1077
        zm_sm_mpapa5, // 0x1078
        zm_sm_mpapa5_pack, // 0x1079
        zm_sm_mpapa7, // 0x107a
        zm_sm_mpapa7_pack, // 0x107b
        zm_sm_mpapax, // 0x107c
        zm_sm_mpapax_pack, // 0x107d
        zm_sm_papa90, // 0x107e
        zm_sm_papa90_pack, // 0x107f
        zm_sm_sdelta, // 0x1080
        zm_sm_sdelta_pap, // 0x1081
        zm_sm_victor, // 0x1082
        zm_sm_victor_pack, // 0x1083
        zm_sn_alpha50, // 0x1084
        zm_sn_alpha50_pack, // 0x1085
        jup_ammo_408c_hg, // 0x1086
        jup_ammo_408c_lg, // 0x1087
        jup_ammo_408c_rn, // 0x1088
        jup_ammo_408c_xp, // 0x1089
        zm_sn_india, // 0x108a
        zm_sn_india_pack, // 0x108b
        zm_sn_limax, // 0x108c
        zm_sn_limax_pack, // 0x108d
        zm_sn_mromeo, // 0x108e
        zm_sn_mromeo_pack, // 0x108f
        zm_sn_walpha, // 0x1090
        zm_sn_walpha_pack, // 0x1091
        hybridscope_sn01, // 0x1092
        jup_saw_melee_1sk, // 0x1093
        zm_sh_aromeo410, // 0x1094
        zm_sh_aromeo410_pack, // 0x1095
        zm_sm_coscar635, // 0x1096
        zm_sm_coscar635_pack, // 0x1097
        zm_lm_halpha, // 0x1098
        zm_lm_halpha_pack, // 0x1099
        zm_br_xmike5, // 0x109a
        zm_br_xmike5_pack, // 0x109b
        zm_br_xmike5_pack_mp, // 0x109c
        zm_br_xmike5_pack_mp_2, // 0x109d
        zm_pi_glima21, // 0x109e
        zm_pi_glima21_pack, // 0x109f
        zm_ar_golf36, // 0x10a0
        zm_ar_golf36_pack, // 0x10a1
        zm_dm_slima8, // 0x10a2
        zm_dm_slima8_pack, // 0x10a3
        jup_twofivex_mgolf36, // 0x10a4
        zm_lm_mgolf36, // 0x10a5
        zm_lm_mgolf36_pack, // 0x10a6
        zm_ar_bromeo2m, // 0x10a7
        zm_ar_bromeo2m_pack, // 0x10a8
        zm_ar_bromeo805, // 0x10a9
        zm_ar_bromeo805_pack, // 0x10aa
        zm_br_bromeo2, // 0x10ab
        zm_br_bromeo2_pack, // 0x10ac
        zm_dm_bromeop, // 0x10ad
        zm_dm_bromeop_pack, // 0x10ae
        zm_dm_bromeop_pack_mp, // 0x10af
        zm_dm_bromeop_pack_mp_2, // 0x10b0
        zm_sm_scharlie3_pack_mp, // 0x10b1
        zm_sm_scharlie3_pack_mp_2, // 0x10b2
        zm_ar_aromeo160, // 0x10b3
        zm_ar_aromeo160_pack, // 0x10b4
        zm_br_aromeo200, // 0x10b5
        zm_br_aromeo200_pack, // 0x10b6
        zm_sm_pmike, // 0x10b7
        zm_sm_pmike_pack, // 0x10b8
        zm_sm_lwhiskey, // 0x10b9
        zm_sm_lwhiskey_pack, // 0x10ba
        zm_sm_umike, // 0x10bb
        zm_sm_umike_pack, // 0x10bc
        zm_ar_f2000, // 0x10bd
        zm_ar_f2000_pack, // 0x10be
        zm_lm_pkilob, // 0x10bf
        zm_lm_pkilob_pack, // 0x10c0
        zm_lm_pkilop, // 0x10c1
        zm_lm_pkilop_pack, // 0x10c2
        zm_lm_pkilop_pack_mp, // 0x10c3
        zm_lm_pkilop_pack_mp_2, // 0x10c4
        zm_pi_uzulum, // 0x10c5
        zm_pi_uzulum_pack, // 0x10c6
        gripvert, // 0x10c7
        zm_sm_uzulu, // 0x10c8
        zm_sm_uzulu_pack, // 0x10c9
        zm_sm_uzulup, // 0x10ca
        zm_sm_uzulup_pack, // 0x10cb
        jup_grip_vertshort, // 0x10cc
        zm_ar_qbravo97, // 0x10cd
        zm_ar_qbravo97_pack, // 0x10ce
        zm_lm_qbravo95lsw, // 0x10cf
        zm_lm_qbravo95lsw_pack, // 0x10d0
        zm_sh_oromeo12, // 0x10d1
        zm_sh_oromeo12_pack, // 0x10d2
        zm_sn_cdelta50, // 0x10d3
        zm_sn_cdelta50_pack, // 0x10d4
        zm_pi_mike93, // 0x10d5
        zm_pi_mike93_pack, // 0x10d6
        jup_jp13_stockr_amp, // 0x10d7
        zm_dm_svictork, // 0x10d8
        zm_dm_svictork_pack, // 0x10d9
        zm_sn_svictor, // 0x10da
        zm_sn_svictor_pack, // 0x10db
        zm_pi_rsierra12, // 0x10dc
        zm_pi_rsierra12_pack, // 0x10dd
        zm_sh_recho870, // 0x10de
        zm_sh_recho870_pack, // 0x10df
        zm_sn_hsierra, // 0x10e0
        zm_sn_hsierra_pack, // 0x10e1
        zm_ar_acharlie, // 0x10e2
        zm_ar_acharlie_pack, // 0x10e3
        zm_ar_acharlie_pack_mp, // 0x10e4
        zm_ar_acharlie_pack_mp_2, // 0x10e5
        zm_ar_acharlie3h, // 0x10e6
        zm_ar_acharlie3h_pack, // 0x10e7
        zm_br_acharlie450, // 0x10e8
        zm_br_acharlie450_pack, // 0x10e9
        zm_dm_acharlied, // 0x10ea
        zm_dm_acharlied_pack, // 0x10eb
        zm_lm_evictor, // 0x10ec
        zm_lm_evictor_pack, // 0x10ed
        zm_me_kalpha, // 0x10ee
        zm_me_kalpha_pap, // 0x10ef
        zm_me_jup_knife, // 0x10f0
        zm_me_jup_knife_pap, // 0x10f1
        zm_me_pdango, // 0x10f2
        zm_me_pdango_pap, // 0x10f3
        zm_me_jup_swhiskey, // 0x10f4
        zm_me_jup_swhiskey_pap, // 0x10f5
        zm_ar_talpha95, // 0x10f6
        zm_ar_talpha95_pack, // 0x10f7
        zm_sm_talpham, // 0x10f8
        zm_sm_talpham_pack, // 0x10f9
        zm_pi_mpapa9, // 0x10fa
        zm_pi_mpapa9_pack, // 0x10fb
        zm_ar_balpha27, // 0x10fc
        zm_ar_balpha27_pack, // 0x10fd
        zm_sn_moscar, // 0x10fe
        zm_sn_moscar_pack, // 0x10ff
        zm_ar_anov94, // 0x1100
        zm_ar_anov94_pack, // 0x1101
        zm_sn_boscar, // 0x1102
        zm_sn_boscar_pack, // 0x1103
        snscope02_kappa98, // 0x1104
        jup_cdelta50_scope_global_kappa98, // 0x1105
        jup_jp37_dm_kappa98_irons2, // 0x1106
        jup_jp37_dm_kappa98_irons3, // 0x1107
        jup_ammo_12g_he, // 0x1108
        jup_jp44_ar_stango44_stock_light, // 0x1109
        jup_jp44_ar_stango44_pgrip_tac, // 0x110a
        jup_jp44_ar_stango44_pgrip_aim, // 0x110b
        zm_me_glass_shiv, // 0x110c
        zm_me_glass_shiv_pap, // 0x110d
        broken_reflex_a, // 0x110e
        jup_comp_ar_02, // 0x110f
        jup_comp_ar_09, // 0x1110
        fov_test_ar, // 0x1111
        jup_comp_br_09, // 0x1112
        ub_msl_ngsierra, // 0x1113
        stocksaw_sierrax_attributes, // 0x1114
        silencer07_gru, // 0x1115
        jup_silencer_08, // 0x1116
        fov_test_pi, // 0x1117
        broken_scope_a, // 0x1118
        t10_bar_ar_p01, // 0x1119
        t10_bar_range_ar_coslo, // 0x111a
        t10_bar_velocity_ar_coslo, // 0x111b
        t10_bar_highcal_ar_coslo, // 0x111c
        t10_bar_mixbarrel_ar_coslo, // 0x111d
        t10_bar_jump_ar_coslo, // 0x111e
        t10_stock_ar_p01, // 0x111f
        t10_stocks_adsmove_ar_coslo, // 0x1120
        t10_stocks_hipfiremove_ar_coslo, // 0x1121
        t10_stocks_mixstock_ar_coslo, // 0x1122
        t10_stocks_flinch_ar_coslo, // 0x1123
        t10_stocks_mixstock2_ar_coslo, // 0x1124
        t10_stocks_bufferweight_ar_coslo, // 0x1125
        t10_mag_ar_p01, // 0x1126
        t10_mags_extclip_ar_coslo, // 0x1127
        t10_mags_fastreload_ar_coslo, // 0x1128
        t10_mags_extclip2_ar_coslo, // 0x1129
        t10_mags_flip_ar_coslo, // 0x112a
        t10_mags_extclip3_ar_coslo, // 0x112b
        t10_mags_fastreload3_ar_coslo, // 0x112c
        t10_ironsdefault_coslo723, // 0x112d
        t10_microreflex01_ar, // 0x112e
        t10_microreflex02_ar, // 0x112f
        t10_microreflex03_ar, // 0x1130
        t10_microreflex04_ar_tall, // 0x1131
        t10_reflex01_ar_tall, // 0x1132
        t10_reflex02_ar, // 0x1133
        t10_reflex03_ar, // 0x1134
        t10_reflex04_ar, // 0x1135
        t10_reflex05_ar, // 0x1136
        t10_reflex06_ar, // 0x1137
        t10_reddot01_ar, // 0x1138
        t10_reddot02_ar, // 0x1139
        t10_reddot03_ar_tall, // 0x113a
        t10_dualzoom01_ar, // 0x113b
        t10_holo01_ar, // 0x113c
        t10_holo02_ar, // 0x113d
        t10_holo_range_ar, // 0x113e
        t10_hybrid01_ar, // 0x113f
        t10_hybrid02_ar, // 0x1140
        t10_twox01_ar, // 0x1141
        t10_threex01_ar, // 0x1142
        t10_fourx01_ar, // 0x1143
        t10_fourx02_ar, // 0x1144
        t10_snprscope_ar_ar, // 0x1145
        t10_thermal01_ar, // 0x1146
        t10_ironsdefault_coslo723_burst, // 0x1147
        t10_selectsemi_coslo723, // 0x1148
        t10_ub_gl_std_ar_coslo723, // 0x1149
        t10_ub_gl_he_ar_coslo723, // 0x114a
        t10_ub_gl_dc_ar_coslo723, // 0x114b
        t10_ub_gl_smoke_ar_coslo723, // 0x114c
        t10_ammo_556n, // 0x114d
        t10_ammo_556n_fmj_ar_coslo723, // 0x114e
        t10_ammo_556n_velocity_ar_coslo723, // 0x114f
        t10_firemod_springs_ar_coslo723, // 0x1150
        t10_firemod_boltcarrier_ar_coslo723, // 0x1151
        t10_selectburst_ar_coslo723, // 0x1152
        t10_muzzles_suppressor_ar_coslo, // 0x1153
        t10_muzzles_comp_ar_coslo, // 0x1154
        t10_muzzles_brake_ar_coslo, // 0x1155
        t10_muzzles_mixmuzzle_ar_coslo, // 0x1156
        t10_pgrip_ar_p01, // 0x1157
        t10_grips_quickdraw_ar_coslo, // 0x1158
        t10_grips_sprintout_ar_coslo, // 0x1159
        t10_grips_mixgrip_ar_coslo, // 0x115a
        t10_grips_quickdraw2_ar_coslo, // 0x115b
        t10_grips_sprintout2_ar_coslo, // 0x115c
        t10_underbarrel_sway_ar_coslo, // 0x115d
        t10_underbarrel_recoil_ar_coslo, // 0x115e
        t10_underbarrel_focus_ar_coslo, // 0x115f
        t10_underbarrel_mixunder_ar_coslo, // 0x1160
        t10_underbarrel_mixunder2_ar_coslo, // 0x1161
        t10_lasers_hipaccuracy_ar_coslo, // 0x1162
        t10_lasers_strelok_ar_coslo, // 0x1163
        t10_lasers_focuslaser_ar_coslo, // 0x1164
        t10_lasers_mixlaser_ar_coslo, // 0x1165
        t10_lasers_mixlaser2_ar_coslo, // 0x1166
        t10_rec_coslo723, // 0x1167
        t10_zm_coslo723, // 0x1168
        t10_zm_coslo723_pack, // 0x1169
        t10_bar_ar_p02, // 0x116a
        t10_bar_range_ar_aking, // 0x116b
        t10_bar_velocity_ar_aking, // 0x116c
        t10_bar_highcal_ar_aking, // 0x116d
        t10_bar_mixbarrel_ar_aking, // 0x116e
        t10_bar_jump_ar_aking, // 0x116f
        t10_stock_ar_p02, // 0x1170
        t10_stocks_adsmove_ar_aking, // 0x1171
        t10_stocks_hipfiremove_ar_aking, // 0x1172
        t10_stocks_mixstock_ar_aking, // 0x1173
        t10_stocks_flinch_ar_aking, // 0x1174
        t10_stocks_mixstock2_ar_aking, // 0x1175
        t10_mag_ar_p02, // 0x1176
        t10_mags_extclip_ar_aking, // 0x1177
        t10_mags_fastreload_ar_aking, // 0x1178
        t10_mags_extclip2_ar_aking, // 0x1179
        t10_mags_flip_ar_aking, // 0x117a
        t10_mags_extclip3_ar_aking, // 0x117b
        t10_mags_fastreload3_ar_aking, // 0x117c
        t10_ironsdefault_aking74, // 0x117d
        t10_microreflex04_ar, // 0x117e
        t10_reflex01_ar, // 0x117f
        t10_reflex02_ar_tall, // 0x1180
        t10_reflex05_ar_tall, // 0x1181
        t10_reddot02_ar_tall, // 0x1182
        t10_reddot03_ar, // 0x1183
        t10_selectsemi_aking74, // 0x1184
        t10_ub_gl_std_ar_aking74, // 0x1185
        t10_ub_gl_he_ar_aking74, // 0x1186
        t10_ub_gl_smoke_ar_aking74, // 0x1187
        t10_ub_gl_dc_ar_aking74, // 0x1188
        t10_ammo_545s, // 0x1189
        t10_ammo_545s_fmj_ar_aking74, // 0x118a
        t10_ammo_545s_velocity_ar_aking74, // 0x118b
        t10_firemod_springs_ar_aking74, // 0x118c
        t10_firemod_boltcarrier_ar_aking74, // 0x118d
        t10_muzzles_suppressor_ar_aking74, // 0x118e
        t10_muzzles_brake_ar_aking74, // 0x118f
        t10_muzzles_comp_ar_aking74, // 0x1190
        t10_muzzles_mixmuzzle_ar_aking74, // 0x1191
        t10_pgrip_ar_p02, // 0x1192
        t10_grips_quickdraw_ar_aking, // 0x1193
        t10_grips_sprintout_ar_aking, // 0x1194
        t10_grips_mixgrip_ar_aking, // 0x1195
        t10_grips_quickdraw2_ar_aking, // 0x1196
        t10_grips_sprintout2_ar_aking, // 0x1197
        t10_underbarrel_sway_ar_aking, // 0x1198
        t10_underbarrel_recoil_ar_aking, // 0x1199
        t10_underbarrel_mixunder_ar_aking, // 0x119a
        t10_underbarrel_mixunder2_ar_aking, // 0x119b
        t10_underbarrel_focus_ar_aking, // 0x119c
        t10_lasers_hipaccuracy_ar_aking, // 0x119d
        t10_lasers_strelok_ar_aking, // 0x119e
        t10_lasers_mixlaser_ar_aking, // 0x119f
        t10_lasers_mixlaser2_ar_aking, // 0x11a0
        t10_lasers_focuslaser_ar_aking, // 0x11a1
        t10_rec_aking74, // 0x11a2
        t10_zm_aking74, // 0x11a3
        t10_zm_aking74_pack, // 0x11a4
        t10_bar_ar_p04, // 0x11a5
        t10_bar_range_ar_clove, // 0x11a6
        t10_bar_velocity_ar_clove, // 0x11a7
        t10_bar_highcal_ar_clove, // 0x11a8
        t10_bar_mixbarrel_ar_clove, // 0x11a9
        t10_bar_jump_ar_clove, // 0x11aa
        t10_stock_ar_p04, // 0x11ab
        t10_stocks_adsmove_ar_clove, // 0x11ac
        t10_stocks_hipfiremove_ar_clove, // 0x11ad
        t10_stocks_mixstock_ar_clove, // 0x11ae
        t10_stocks_flinch_ar_clove, // 0x11af
        t10_stocks_mixstock2_ar_clove, // 0x11b0
        t10_mag_ar_p04, // 0x11b1
        t10_mags_extclip_ar_clove, // 0x11b2
        t10_mags_fastreload_ar_clove, // 0x11b3
        t10_mags_extclip2_ar_clove, // 0x11b4
        t10_mags_flip_ar_clove, // 0x11b5
        t10_ironsdefault_clove, // 0x11b6
        t10_selectsemi_clove, // 0x11b7
        t10_ub_gl_std_ar_clove, // 0x11b8
        t10_ub_gl_he_ar_clove, // 0x11b9
        t10_ub_gl_smoke_ar_clove, // 0x11ba
        t10_ub_gl_dc_ar_clove, // 0x11bb
        t10_ammo_556n_fmj_ar_clove, // 0x11bc
        t10_ammo_556n_velocity, // 0x11bd
        t10_firemod_springs_ar_clove, // 0x11be
        t10_firemod_boltcarrier_ar_clove, // 0x11bf
        t10_muzzles_suppressor_ar_clove, // 0x11c0
        t10_muzzles_comp_ar_clove, // 0x11c1
        t10_muzzles_brake_ar_clove, // 0x11c2
        t10_muzzles_mixmuzzle_ar_clove, // 0x11c3
        t10_pgrip_ar_p04, // 0x11c4
        t10_grips_quickdraw_ar_clove, // 0x11c5
        t10_grips_sprintout_ar_clove, // 0x11c6
        t10_grips_mixgrip_ar_clove, // 0x11c7
        t10_grips_quickdraw2_ar_clove, // 0x11c8
        t10_grips_sprintout2_ar_clove, // 0x11c9
        t10_underbarrel_sway_ar_clove, // 0x11ca
        t10_underbarrel_recoil_ar_clove, // 0x11cb
        t10_underbarrel_focus_ar_clove, // 0x11cc
        t10_underbarrel_mixunder_ar_clove, // 0x11cd
        t10_underbarrel_mixunder2_ar_clove, // 0x11ce
        t10_lasers_hipaccuracy_ar_clove, // 0x11cf
        t10_lasers_strelok_ar_clove, // 0x11d0
        t10_lasers_focuslaser_ar_clove, // 0x11d1
        t10_lasers_mixlaser_ar_clove, // 0x11d2
        t10_lasers_mixlaser2_ar_clove, // 0x11d3
        t10_rec_clove, // 0x11d4
        t10_zm_clove, // 0x11d5
        t10_zm_clove_pack, // 0x11d6
        t10_bar_ar_p05_fable, // 0x11d7
        t10_bar_range_ar_fable, // 0x11d8
        t10_bar_velocity_ar_fable, // 0x11d9
        t10_bar_jump_ar_fable, // 0x11da
        t10_bar_mixbarrel_ar_fable, // 0x11db
        t10_bar_highcal_ar_fable, // 0x11dc
        t10_stock_ar_p05_fable, // 0x11dd
        t10_stocks_adsmove_ar_fable, // 0x11de
        t10_stocks_hipfiremove_ar_fable, // 0x11df
        t10_stocks_mixstock_ar_fable, // 0x11e0
        t10_stocks_flinch_ar_fable, // 0x11e1
        t10_stocks_mixstock2_ar_fable, // 0x11e2
        t10_mag_ar_p05_fable, // 0x11e3
        t10_mags_extclip_ar_fable, // 0x11e4
        t10_mags_flip_ar_fable, // 0x11e5
        t10_mags_extclip2_ar_fable, // 0x11e6
        t10_mags_fastreload2_ar_fable, // 0x11e7
        t10_ironsdefault_fable, // 0x11e8
        t10_reddot04_ar, // 0x11e9
        t10_selectsemi_fable, // 0x11ea
        t10_ub_gl_std_ar_fable, // 0x11eb
        t10_ub_gl_he_ar_fable, // 0x11ec
        t10_ub_gl_smoke_ar_fable, // 0x11ed
        t10_ub_gl_dc_ar_fable, // 0x11ee
        t10_ammo_556n_velocity_ar_fable, // 0x11ef
        t10_ammo_556n_fmj_ar_fable, // 0x11f0
        t10_firemod_springs_ar_fable, // 0x11f1
        t10_firemod_boltcarrier_ar_fable, // 0x11f2
        t10_muzzles_suppressor_ar_fable, // 0x11f3
        t10_muzzles_comp_ar_fable, // 0x11f4
        t10_muzzles_brake_ar_fable, // 0x11f5
        t10_muzzles_mixmuzzle_ar_fable, // 0x11f6
        t10_pgrip_ar_p05_fable, // 0x11f7
        t10_grips_quickdraw_ar_fable, // 0x11f8
        t10_grips_sprintout_ar_fable, // 0x11f9
        t10_grips_mixgrip_ar_fable, // 0x11fa
        t10_grips_quickdraw2_ar_fable, // 0x11fb
        t10_grips_sprintout2_ar_fable, // 0x11fc
        t10_underbarrel_sway_ar_fable, // 0x11fd
        t10_underbarrel_recoil_ar_fable, // 0x11fe
        t10_underbarrel_focus_ar_fable, // 0x11ff
        t10_underbarrel_mixunder_ar_fable, // 0x1200
        t10_underbarrel_mixunder2_ar_fable, // 0x1201
        t10_lasers_hipaccuracy_ar_fable, // 0x1202
        t10_lasers_strelok_ar_fable, // 0x1203
        t10_lasers_focuslaser_ar_fable, // 0x1204
        t10_lasers_mixlaser_ar_fable, // 0x1205
        t10_lasers_mixlaser2_ar_fable, // 0x1206
        t10_rec_fable, // 0x1207
        t10_zm_fable, // 0x1208
        t10_zm_fable_pack, // 0x1209
        t10_bar_ar_p05, // 0x120a
        t10_bar_range_ar_rmary2, // 0x120b
        t10_bar_velocity_ar_rmary2, // 0x120c
        t10_bar_highcal_ar_rmary2, // 0x120d
        t10_bar_mixbarrel_ar_rmary2, // 0x120e
        t10_bar_jump_ar_rmary2, // 0x120f
        t10_stock_ar_p05, // 0x1210
        t10_stocks_adsmove_ar_rmary2, // 0x1211
        t10_stocks_hipfiremove_ar_rmary2, // 0x1212
        t10_stocks_mixstock_ar_rmary2, // 0x1213
        t10_stocks_flinch_ar_rmary2, // 0x1214
        t10_stocks_mixstock2_ar_rmary2, // 0x1215
        t10_mag_ar_p05, // 0x1216
        t10_mags_extclip_ar_rmary2, // 0x1217
        t10_mags_flip_ar_rmary2, // 0x1218
        t10_mags_extclip2_ar_rmary2, // 0x1219
        t10_mags_fastreload2_ar_rmary2, // 0x121a
        t10_firemod_trigger_ar_rmary2, // 0x121b
        t10_ironsdefault_rmary2, // 0x121c
        t10_ub_gl_std_ar_rmary2, // 0x121d
        t10_ub_gl_he_ar_rmary2, // 0x121e
        t10_ub_gl_smoke_ar_rmary2, // 0x121f
        t10_ub_gl_dc_ar_rmary2, // 0x1220
        t10_ammo_556n_velocity_ar_rmary2, // 0x1221
        t10_firemod_springs_ar_rmary2, // 0x1222
        t10_muzzles_suppressor_ar_rmary2, // 0x1223
        t10_muzzles_comp_ar_rmary2, // 0x1224
        t10_muzzles_brake_ar_rmary2, // 0x1225
        t10_muzzles_mixmuzzle_ar_rmary2, // 0x1226
        t10_pgrip_ar_p05, // 0x1227
        t10_grips_quickdraw_ar_rmary2, // 0x1228
        t10_grips_sprintout_ar_rmary2, // 0x1229
        t10_grips_mixgrip_ar_rmary2, // 0x122a
        t10_grips_quickdraw2_ar_rmary2, // 0x122b
        t10_grips_sprintout2_ar_rmary2, // 0x122c
        t10_underbarrel_recoil_ar_rmary2, // 0x122d
        t10_underbarrel_sway_ar_rmary2, // 0x122e
        t10_underbarrel_focus_ar_rmary2, // 0x122f
        t10_underbarrel_mixunder_ar_rmary2, // 0x1230
        t10_underbarrel_mixunder2_ar_rmary2, // 0x1231
        t10_lasers_hipaccuracy_ar_rmary2, // 0x1232
        t10_lasers_strelok_ar_rmary2, // 0x1233
        t10_lasers_focuslaser_ar_rmary2, // 0x1234
        t10_lasers_mixlaser_ar_rmary2, // 0x1235
        t10_lasers_mixlaser2_ar_rmary2, // 0x1236
        t10_rec_rmary2, // 0x1237
        t10_zm_rmary2, // 0x1238
        t10_zm_rmary2_pack, // 0x1239
        t10_bar_ar_p06, // 0x123a
        t10_barsil_range_ar_asvalor, // 0x123b
        t10_barsil_velocity_ar_asvalor, // 0x123c
        t10_barsil_mixbarrel_ar_asvalor, // 0x123d
        t10_barsil_highcal_ar_asvalor, // 0x123e
        t10_stock_ar_p06, // 0x123f
        t10_stocks_adsmove_ar_asvalor, // 0x1240
        t10_stocks_hipfiremove_ar_asvalor, // 0x1241
        t10_stocks_mixstock_ar_asvalor, // 0x1242
        t10_stocks_flinch_ar_asvalor, // 0x1243
        t10_stocks_mixstock2_ar_asvalor, // 0x1244
        t10_stocks_grip_ar_asvalor, // 0x1245
        t10_mag_ar_p06, // 0x1246
        t10_mags_flip_ar_asvalor, // 0x1247
        t10_mags_extclip_ar_asvalor, // 0x1248
        t10_mags_extclip2_ar_asvalor, // 0x1249
        t10_mags_extclip3_ar_asvalor, // 0x124a
        t10_ironsdefault_asvalor, // 0x124b
        t10_snprscope_droger_ar, // 0x124c
        t10_selectsemi_asvalor, // 0x124d
        t10_ub_gl_std_ar_asvalor, // 0x124e
        t10_ub_gl_he_ar_asvalor, // 0x124f
        t10_ub_gl_smoke_ar_asvalor, // 0x1250
        t10_ub_gl_dc_ar_asvalor, // 0x1251
        t10_ammo_9x39, // 0x1252
        t10_ammo_9x39_fmj_ar_asvalor, // 0x1253
        t10_ammo_9x39_velocity_ar_asvalor, // 0x1254
        t10_firemod_boltcarrier_ar_asvalor, // 0x1255
        t10_firemod_springs_ar_asvalor, // 0x1256
        t10_pgrip_ar_p06, // 0x1257
        t10_grips_quickdraw_ar_asvalor, // 0x1258
        t10_grips_sprintout_ar_asvalor, // 0x1259
        t10_grips_mixgrip_ar_asvalor, // 0x125a
        t10_grips_quickdraw2_ar_asvalor, // 0x125b
        t10_grips_sprintout2_ar_asvalor, // 0x125c
        t10_underbarrel_recoil_ar_asvalor, // 0x125d
        t10_underbarrel_sway_ar_asvalor, // 0x125e
        t10_underbarrel_focus_ar_asvalor, // 0x125f
        t10_underbarrel_mixunder_ar_asvalor, // 0x1260
        t10_underbarrel_mixunder2_ar_asvalor, // 0x1261
        t10_lasers_hipaccuracy_ar_asvalor, // 0x1262
        t10_lasers_strelok_ar_asvalor, // 0x1263
        t10_lasers_focuslaser_ar_asvalor, // 0x1264
        t10_lasers_mixlaser_ar_asvalor, // 0x1265
        t10_lasers_mixlaser2_ar_asvalor, // 0x1266
        t10_rec_asvalor, // 0x1267
        t10_zm_asvalor, // 0x1268
        t10_zm_asvalor_pack, // 0x1269
        t10_bar_ar_p22, // 0x126a
        t10_bar_range_ar_able18, // 0x126b
        t10_bar_velocity_ar_able18, // 0x126c
        t10_bar_highcal_ar_able18, // 0x126d
        t10_bar_mixbarrel_ar_able18, // 0x126e
        t10_bar_jump_ar_able18, // 0x126f
        t10_stock_ar_p22, // 0x1270
        t10_stocks_adsmove_ar_able18, // 0x1271
        t10_stocks_hipfiremove_ar_able18, // 0x1272
        t10_stocks_mixstock_ar_able18, // 0x1273
        t10_stocks_flinch_ar_able18, // 0x1274
        t10_stocks_mixstock2_ar_able18, // 0x1275
        t10_mag_ar_p22, // 0x1276
        t10_mags_extclip_ar_able18, // 0x1277
        t10_mags_fastreload_ar_able18, // 0x1278
        t10_mags_extclip2_ar_able18, // 0x1279
        t10_mags_flip_ar_able18, // 0x127a
        t10_ironsdefault_able18, // 0x127b
        t10_selectsemi_able18, // 0x127c
        t10_ub_gl_std_ar_able18, // 0x127d
        t10_ub_gl_he_ar_able18, // 0x127e
        t10_ub_gl_smoke_ar_able18, // 0x127f
        t10_ub_gl_dc_ar_able18, // 0x1280
        t10_ammo_556n_fmj_ar_able18, // 0x1281
        t10_ammo_556n_velocity_ar_able18, // 0x1282
        t10_firemod_boltcarrier_ar_able18, // 0x1283
        t10_firemod_springs_ar_able18, // 0x1284
        t10_muzzles_suppressor_ar_able18, // 0x1285
        t10_muzzles_comp_ar_able18, // 0x1286
        t10_muzzles_brake_ar_able18, // 0x1287
        t10_muzzles_mixmuzzle_ar_able18, // 0x1288
        t10_pgrip_ar_p22, // 0x1289
        t10_grips_quickdraw_ar_able18, // 0x128a
        t10_grips_sprintout_ar_able18, // 0x128b
        t10_grips_mixgrip_ar_able18, // 0x128c
        t10_grips_quickdraw2_ar_able18, // 0x128d
        t10_grips_sprintout2_ar_able18, // 0x128e
        t10_underbarrel_sway_ar_able18, // 0x128f
        t10_underbarrel_recoil_ar_able18, // 0x1290
        t10_underbarrel_focus_ar_able18, // 0x1291
        t10_underbarrel_mixunder_ar_able18, // 0x1292
        t10_underbarrel_mixunder2_ar_able18, // 0x1293
        t10_lasers_hipaccuracy_ar_able18, // 0x1294
        t10_lasers_strelok_ar_able18, // 0x1295
        t10_lasers_focuslaser_ar_able18, // 0x1296
        t10_lasers_mixlaser_ar_able18, // 0x1297
        t10_lasers_mixlaser2_ar_able18, // 0x1298
        t10_rec_able18, // 0x1299
        t10_zm_able18, // 0x129a
        t10_zm_able18_pack, // 0x129b
        t10_bar_ar_p23, // 0x129c
        t10_bar_range_ar_love85, // 0x129d
        t10_bar_velocity_ar_love85, // 0x129e
        t10_bar_highcal_ar_love85, // 0x129f
        t10_bar_mixbarrel_ar_love85, // 0x12a0
        t10_bar_jump_ar_love85, // 0x12a1
        t10_stock_ar_p23, // 0x12a2
        t10_stocks_adsmove_ar_love85, // 0x12a3
        t10_stocks_hipfiremove_ar_love85, // 0x12a4
        t10_stocks_mixstock_ar_love85, // 0x12a5
        t10_stocks_flinch_ar_love85, // 0x12a6
        t10_stocks_mixstock2_ar_love85, // 0x12a7
        t10_mag_ar_p23, // 0x12a8
        t10_mags_extclip_ar_love85, // 0x12a9
        t10_mags_fastreload_ar_love85, // 0x12aa
        t10_mags_extclip2_ar_love85, // 0x12ab
        t10_mags_flip_ar_love85, // 0x12ac
        t10_ironsdefault_love85, // 0x12ad
        t10_selectsemi_love85, // 0x12ae
        t10_ub_gl_std_ar_love85, // 0x12af
        t10_ub_gl_he_ar_love85, // 0x12b0
        t10_ub_gl_smoke_ar_love85, // 0x12b1
        t10_ub_gl_dc_ar_love85, // 0x12b2
        t10_ammo_556n_fmj_ar_love85, // 0x12b3
        t10_ammo_556n_velocity_ar_love85, // 0x12b4
        t10_firemod_springs_ar_love85, // 0x12b5
        t10_firemod_boltcarrier_ar_love85, // 0x12b6
        t10_muzzles_suppressor_ar_love85, // 0x12b7
        t10_muzzles_comp_ar_love85, // 0x12b8
        t10_muzzles_brake_ar_love85, // 0x12b9
        t10_muzzles_mixmuzzle_ar_love85, // 0x12ba
        t10_pgrip_ar_p23, // 0x12bb
        t10_grips_quickdraw_ar_love85, // 0x12bc
        t10_grips_sprintout_ar_love85, // 0x12bd
        t10_grips_mixgrip_ar_love85, // 0x12be
        t10_grips_quickdraw2_ar_love85, // 0x12bf
        t10_grips_sprintout2_ar_love85, // 0x12c0
        t10_underbarrel_sway_ar_love85, // 0x12c1
        t10_underbarrel_recoil_ar_love85, // 0x12c2
        t10_underbarrel_focus_ar_love85, // 0x12c3
        t10_underbarrel_mixunder_ar_love85, // 0x12c4
        t10_underbarrel_mixunder2_ar_love85, // 0x12c5
        t10_lasers_hipaccuracy_ar_love85, // 0x12c6
        t10_lasers_strelok_ar_love85, // 0x12c7
        t10_lasers_focuslaser_ar_love85, // 0x12c8
        t10_lasers_mixlaser_ar_love85, // 0x12c9
        t10_lasers_mixlaser2_ar_love85, // 0x12ca
        t10_rec_love85, // 0x12cb
        t10_zm_love85, // 0x12cc
        t10_zm_love85_pack, // 0x12cd
        t10_rec_valkyrie, // 0x12ce
        t10_bar_dm_p03, // 0x12cf
        t10_stock_dm_p03, // 0x12d0
        t10_mag_dm_p03, // 0x12d1
        t10_ironsdefault_sgeorge550, // 0x12d2
        t10_selectsemi_sgeorge550, // 0x12d3
        t10_pgrip_dm_p03, // 0x12d4
        t10_rec_sgeorge550, // 0x12d5
        t10_zm_sgeorge550, // 0x12d6
        t10_zm_sgeorge550_pack, // 0x12d7
        t10_bar_dm_p01, // 0x12d8
        t10_stock_dm_p01, // 0x12d9
        t10_mag_dm_p01, // 0x12da
        t10_sn_scopes_sroger25, // 0x12db
        t10_ammo_762n, // 0x12dc
        t10_pgrip_dm_p01, // 0x12dd
        t10_underbarrel_dm_p01, // 0x12de
        t10_rec_sroger25, // 0x12df
        t10_zm_sroger25, // 0x12e0
        t10_zm_sroger25_pack, // 0x12e1
        t10_bar_lm_p01, // 0x12e2
        t10_stock_lm_p01, // 0x12e3
        t10_ironsdefault_aroger10, // 0x12e4
        t10_pgrip_lm_p01, // 0x12e5
        t10_rec_aroger10, // 0x12e6
        t10_zm_aroger10, // 0x12e7
        t10_zm_aroger10_pack, // 0x12e8
        t10_me_knife, // 0x12e9
        t10_bar_pi_p13, // 0x12ea
        t10_mag_pi_p13, // 0x12eb
        t10_ironsdefault_usugar9, // 0x12ec
        t10_ammo_45acp, // 0x12ed
        t10_hammer_p13_usugar9, // 0x12ee
        t10_pgrip_pi_p13, // 0x12ef
        t10_rec_usugar9, // 0x12f0
        t10_zm_usugar9, // 0x12f1
        t10_zm_usugar9_pack, // 0x12f2
        t10_bar_sh_p10, // 0x12f3
        t10_stock_sh_p10, // 0x12f4
        t10_tube_sh_p10, // 0x12f5
        t10_grip_sh_p10, // 0x12f6
        t10_ironsdefault_moslo500, // 0x12f7
        t10_ammo_12g, // 0x12f8
        t10_guard_sh_p10, // 0x12f9
        t10_rec_moslo500, // 0x12fa
        t10_zm_moslo500, // 0x12fb
        t10_zm_moslo500_pack, // 0x12fc
        t10_bar_sm_p06, // 0x12fd
        t10_stock_sm_p06, // 0x12fe
        t10_mag_sm_p06, // 0x12ff
        t10_ironsdefault_sroger3, // 0x1300
        t10_selectsemi_sroger3, // 0x1301
        t10_pgrip_sm_p06, // 0x1302
        t10_rec_sroger3, // 0x1303
        t10_zm_sroger3, // 0x1304
        t10_zm_sroger3_pack, // 0x1305
        t10_bar_sn_p08, // 0x1306
        t10_stock_sn_p08, // 0x1307
        t10_mag_sn_p08, // 0x1308
        t10_bolt_sn_p08, // 0x1309
        t10_sn_scopes_ultiger, // 0x130a
        t10_pgrip_sn_p08, // 0x130b
        t10_underbarrel_sn_p08, // 0x130c
        t10_rec_ultiger, // 0x130d
        t10_zm_ultiger, // 0x130e
        t10_zm_ultiger_pack, // 0x130f
        t10_bar_sn_p09, // 0x1310
        t10_stock_sn_p09, // 0x1311
        t10_mag_sn_p09, // 0x1312
        t10_sn_scopes_droger, // 0x1313
        t10_ammo_762r, // 0x1314
        t10_pgrip_sn_p09, // 0x1315
        t10_underbarrel_sn_p09, // 0x1316
        t10_rec_droger, // 0x1317
        t10_zm_droger, // 0x1318
        t10_zm_droger_pack, // 0x1319
        t10_bar_range_dm_sroger25, // 0x131a
        t10_bar_velocity_dm_sroger25, // 0x131b
        t10_bar_highcal_dm_sroger25, // 0x131c
        t10_bar_mixbarrel_dm_sroger25, // 0x131d
        t10_bar_jump_dm_sroger25, // 0x131e
        t10_stocks_adsmove_dm_sroger25, // 0x131f
        t10_stocks_hipfiremove_dm_sroger25, // 0x1320
        t10_stocks_mixstock_dm_sroger25, // 0x1321
        t10_stocks_flinch_dm_sroger25, // 0x1322
        t10_stocks_mixstock2_dm_sroger25, // 0x1323
        t10_mags_extclip_dm_sroger25, // 0x1324
        t10_mags_fastreload_dm_sroger25, // 0x1325
        t10_mags_extclip2_dm_sroger25, // 0x1326
        t10_mags_flip_dm_sroger25, // 0x1327
        t10_mags_fastreload3_dm_sroger25, // 0x1328
        t10_firemod_trigger_dm_sroger25, // 0x1329
        t10_irons_dm_sroger25, // 0x132a
        t10_microreflex03_dmr, // 0x132b
        t10_reflex01_dmr, // 0x132c
        t10_reflex02_dmr, // 0x132d
        t10_reflex04_dmr, // 0x132e
        t10_reddot01_dmr, // 0x132f
        t10_reddot02_dmr, // 0x1330
        t10_reddot03_dmr, // 0x1331
        t10_dualzoom01_dmr, // 0x1332
        t10_holo01_dmr, // 0x1333
        t10_holo02_dmr, // 0x1334
        t10_holo_range_dmr, // 0x1335
        t10_hybrid01_dmr, // 0x1336
        t10_hybrid02_dmr, // 0x1337
        t10_twox01_dmr, // 0x1338
        t10_threex01_dmr, // 0x1339
        t10_fourx01_dmr, // 0x133a
        t10_fourx02_dmr, // 0x133b
        t10_snprscope_dm_dmr, // 0x133c
        t10_varizoom01_dmr, // 0x133d
        t10_varizoom02_dmr, // 0x133e
        t10_scope_rangefinder_dmr, // 0x133f
        t10_thermal01_dmr, // 0x1340
        t10_thermal_holo_dmr, // 0x1341
        t10_thermal_scope_dmr, // 0x1342
        t10_ammo_762n_velocity_dm_sroger25, // 0x1343
        t10_ammo_762n_fmj_dm_sroger25, // 0x1344
        t10_firemod_springs_dm_sroger25, // 0x1345
        t10_muzzles_suppressor_dm_sroger25, // 0x1346
        t10_muzzles_comp_dm_sroger25, // 0x1347
        t10_muzzles_brake_dm_sroger25, // 0x1348
        t10_muzzles_mixmuzzle_dm_sroger25, // 0x1349
        t10_grips_quickdraw_dm_sroger25, // 0x134a
        t10_grips_sprintout_dm_sroger25, // 0x134b
        t10_grips_mixgrip_dm_sroger25, // 0x134c
        t10_grips_quickdraw2_dm_sroger25, // 0x134d
        t10_grips_sprintout2_dm_sroger25, // 0x134e
        t10_underbarrel_recoil_dm_sroger25, // 0x134f
        t10_underbarrel_sway_dm_sroger25, // 0x1350
        t10_underbarrel_mixunder_dm_sroger25, // 0x1351
        t10_underbarrel_focus_dm_sroger25, // 0x1352
        t10_underbarrel_mixunder2_dm_sroger25, // 0x1353
        t10_lasers_hipaccuracy_dm_sroger25, // 0x1354
        t10_lasers_strelok_dm_sroger25, // 0x1355
        t10_lasers_focuslaser_dm_sroger25, // 0x1356
        t10_lasers_mixlaser_dm_sroger25, // 0x1357
        t10_lasers_mixlaser2_dm_sroger25, // 0x1358
        t10_bar_dm_p02, // 0x1359
        t10_bar_range_dm_aeasy, // 0x135a
        t10_bar_velocity_dm_aeasy, // 0x135b
        t10_bar_highcal_dm_aeasy, // 0x135c
        t10_bar_mixbarrel_dm_aeasy, // 0x135d
        t10_bar_jump_dm_aeasy, // 0x135e
        t10_stock_dm_p02, // 0x135f
        t10_stocks_hipfiremove_dm_aeasy, // 0x1360
        t10_stocks_adsmove_dm_aeasy, // 0x1361
        t10_stocks_mixstock_dm_aeasy, // 0x1362
        t10_stocks_flinch_dm_aeasy, // 0x1363
        t10_stocks_mixstock2_dm_aeasy, // 0x1364
        t10_mag_dm_p02, // 0x1365
        t10_mags_extclip_dm_aeasy, // 0x1366
        t10_mags_extclip2_dm_aeasy, // 0x1367
        t10_mags_fastreload_dm_aeasy, // 0x1368
        t10_mags_flip_dm_aeasy, // 0x1369
        t10_ironsdefault_aeasy, // 0x136a
        t10_selectsemi_aeasy, // 0x136b
        t10_ub_gl_std_dm_aeasy, // 0x136c
        t10_ub_gl_he_dm_aeasy, // 0x136d
        t10_ub_gl_smoke_dm_aeasy, // 0x136e
        t10_ub_gl_dc_dm_aeasy, // 0x136f
        t10_ammo_762s, // 0x1370
        t10_ammo_762s_velocity_dm_aeasy, // 0x1371
        t10_ammo_762s_fmj_dm_aeasy, // 0x1372
        t10_firemod_boltcarrier_dm_aeasy, // 0x1373
        t10_firemod_springs_dm_aeasy, // 0x1374
        t10_selectauto_dm_aeasy, // 0x1375
        t10_muzzles_suppressor_dm_aeasy, // 0x1376
        t10_muzzles_comp_dm_aeasy, // 0x1377
        t10_muzzles_brake_dm_aeasy, // 0x1378
        t10_muzzles_mixmuzzle_dm_aeasy, // 0x1379
        t10_pgrip_dm_p02, // 0x137a
        t10_grips_quickdraw_dm_aeasy, // 0x137b
        t10_grips_sprintout_dm_aeasy, // 0x137c
        t10_grips_mixgrip_dm_aeasy, // 0x137d
        t10_grips_quickdraw2_dm_aeasy, // 0x137e
        t10_grips_sprintout2_dm_aeasy, // 0x137f
        t10_underbarrel_sway_dm_aeasy, // 0x1380
        t10_underbarrel_recoil_dm_aeasy, // 0x1381
        t10_underbarrel_focus_dm_aeasy, // 0x1382
        t10_underbarrel_mixunder_dm_aeasy, // 0x1383
        t10_underbarrel_mixunder2_dm_aeasy, // 0x1384
        t10_lasers_hipaccuracy_dm_aeasy, // 0x1385
        t10_lasers_strelok_dm_aeasy, // 0x1386
        t10_lasers_focuslaser_dm_aeasy, // 0x1387
        t10_lasers_mixlaser_dm_aeasy, // 0x1388
        t10_lasers_mixlaser2_dm_aeasy, // 0x1389
        t10_rec_aeasy, // 0x138a
        t10_zm_aeasy, // 0x138b
        t10_zm_aeasy_pack, // 0x138c
        t10_bar_range_dm_sgeorge, // 0x138d
        t10_bar_velocity_dm_sgeorge, // 0x138e
        t10_bar_highcal_dm_sgeorge, // 0x138f
        t10_bar_mixbarrel_dm_sgeorge, // 0x1390
        t10_bar_jump_dm_sgeorge, // 0x1391
        t10_stocks_adsmove_dm_sgeorge, // 0x1392
        t10_stocks_hipfiremove_dm_sgeorge, // 0x1393
        t10_stocks_mixstock_dm_sgeorge, // 0x1394
        t10_stocks_flinch_dm_sgeorge, // 0x1395
        t10_stocks_mixstock2_dm_sgeorge, // 0x1396
        t10_mags_extclip_dm_sgeorge, // 0x1397
        t10_mags_fastreload_dm_sgeorge, // 0x1398
        t10_mags_extclip2_dm_sgeorge, // 0x1399
        t10_mags_flip_dm_sgeorge, // 0x139a
        t10_ub_gl_std_dm_sgeorge550, // 0x139b
        t10_ub_gl_he_dm_sgeorge550, // 0x139c
        t10_ub_gl_smoke_dm_sgeorge550, // 0x139d
        t10_ub_gl_dc_dm_sgeorge550, // 0x139e
        t10_ammo_556n_velocity_dm_sgeorge550, // 0x139f
        t10_ammo_556n_fmj_dm_sgeorge550, // 0x13a0
        t10_firemod_springs_dm_sgeorge550, // 0x13a1
        t10_firemod_boltcarrier_dm_sgeorge550, // 0x13a2
        t10_selectauto_dm_sgeorge, // 0x13a3
        t10_muzzles_suppressor_dm_sgeorge, // 0x13a4
        t10_muzzles_comp_dm_sgeorge, // 0x13a5
        t10_muzzles_brake_dm_sgeorge, // 0x13a6
        t10_muzzles_mixmuzzle_dm_sgeorge, // 0x13a7
        t10_grips_quickdraw_dm_sgeorge, // 0x13a8
        t10_grips_sprintout_dm_sgeorge, // 0x13a9
        t10_grips_mixgrip_dm_sgeorge, // 0x13aa
        t10_grips_quickdraw2_dm_sgeorge, // 0x13ab
        t10_grips_sprintout2_dm_sgeorge, // 0x13ac
        t10_underbarrel_recoil_dm_sgeorge, // 0x13ad
        t10_underbarrel_sway_dm_sgeorge, // 0x13ae
        t10_underbarrel_focus_dm_sgeorge, // 0x13af
        t10_underbarrel_mixunder_dm_sgeorge, // 0x13b0
        t10_underbarrel_mixunder2_dm_sgeorge, // 0x13b1
        t10_lasers_hipaccuracy_dm_sgeorge, // 0x13b2
        t10_lasers_strelok_dm_sgeorge, // 0x13b3
        t10_lasers_focuslaser_dm_sgeorge, // 0x13b4
        t10_lasers_mixlaser_dm_sgeorge, // 0x13b5
        t10_lasers_mixlaser2_dm_sgeorge, // 0x13b6
        t10_bar_dm_p05, // 0x13b7
        t10_bar_range_dm_falove, // 0x13b8
        t10_bar_velocity_dm_falove, // 0x13b9
        t10_bar_highcal_dm_falove, // 0x13ba
        t10_bar_mixbarrel_dm_falove, // 0x13bb
        t10_bar_jump_dm_falove, // 0x13bc
        t10_stock_dm_p05, // 0x13bd
        t10_stocks_adsmove_dm_falove, // 0x13be
        t10_stocks_hipfiremove_dm_falove, // 0x13bf
        t10_stocks_mixstock_dm_falove, // 0x13c0
        t10_stocks_flinch_dm_falove, // 0x13c1
        t10_stocks_mixstock2_dm_falove, // 0x13c2
        t10_mag_dm_p05, // 0x13c3
        t10_mags_extclip_dm_falove, // 0x13c4
        t10_mags_extclip2_dm_falove, // 0x13c5
        t10_mags_fastreload2_dm_falove, // 0x13c6
        t10_ironsdefault_falove, // 0x13c7
        t10_muzzles_suppressor_dm_falove, // 0x13c8
        t10_muzzles_comp_dm_falove, // 0x13c9
        t10_muzzles_brake_dm_falove, // 0x13ca
        t10_muzzles_mixmuzzle_dm_falove, // 0x13cb
        t10_pgrip_dm_p05, // 0x13cc
        t10_grips_quickdraw_dm_falove, // 0x13cd
        t10_grips_sprintout_dm_falove, // 0x13ce
        t10_grips_mixgrip_dm_falove, // 0x13cf
        t10_grips_quickdraw2_dm_falove, // 0x13d0
        t10_grips_sprintout2_dm_falove, // 0x13d1
        t10_underbarrel_sway_dm_falove, // 0x13d2
        t10_underbarrel_recoil_dm_falove, // 0x13d3
        t10_underbarrel_focus_dm_falove, // 0x13d4
        t10_underbarrel_mixunder_dm_falove, // 0x13d5
        t10_underbarrel_mixunder2_dm_falove, // 0x13d6
        t10_lasers_hipaccuracy_dm_falove, // 0x13d7
        t10_lasers_strelok_dm_falove, // 0x13d8
        t10_lasers_focuslaser_dm_falove, // 0x13d9
        t10_lasers_mixlaser_dm_falove, // 0x13da
        t10_lasers_mixlaser2_dm_falove, // 0x13db
        t10_rec_falove, // 0x13dc
        t10_zm_falove, // 0x13dd
        t10_zm_falove_pack, // 0x13de
        t10_bar_dm_p09, // 0x13df
        t10_bar_range_dm_svalor, // 0x13e0
        t10_bar_velocity_dm_svalor, // 0x13e1
        t10_bar_highcal_dm_svalor, // 0x13e2
        t10_bar_mixbarrel_dm_svalor, // 0x13e3
        t10_bar_jump_dm_svalor, // 0x13e4
        t10_stock_dm_p09, // 0x13e5
        t10_stocks_adsmove_dm_svalor, // 0x13e6
        t10_stocks_hipfiremove_dm_svalor, // 0x13e7
        t10_stocks_mixstock_dm_svalor, // 0x13e8
        t10_stocks_flinch_dm_svalor, // 0x13e9
        t10_stocks_mixstock2_dm_svalor, // 0x13ea
        t10_mag_dm_p09, // 0x13eb
        t10_mags_extclip_dm_svalor, // 0x13ec
        t10_mags_flip_dm_svalor, // 0x13ed
        t10_mags_extclip2_dm_svalor, // 0x13ee
        t10_mags_fastreload2_dm_svalor, // 0x13ef
        t10_firemod_trigger_dm_svalor, // 0x13f0
        t10_ironsdefault_svalor, // 0x13f1
        t10_snprscope_droger_dm, // 0x13f2
        t10_ammo_762r_velocity_dm_svalor, // 0x13f3
        t10_ammo_762r_fmj_dm_svalor, // 0x13f4
        t10_firemod_springs_dm_svalor, // 0x13f5
        t10_muzzles_suppressor_dm_svalor, // 0x13f6
        t10_muzzles_comp_dm_svalor, // 0x13f7
        t10_muzzles_brake_dm_svalor, // 0x13f8
        t10_muzzles_mixmuzzle_dm_svalor, // 0x13f9
        t10_pgrip_dm_p09, // 0x13fa
        t10_grips_quickdraw_dm_svalor, // 0x13fb
        t10_grips_sprintout_dm_svalor, // 0x13fc
        t10_grips_mixgrip_dm_svalor, // 0x13fd
        t10_grips_quickdraw2_dm_svalor, // 0x13fe
        t10_grips_sprintout2_dm_svalor, // 0x13ff
        t10_underbarrel_dm_p09, // 0x1400
        t10_underbarrel_sway_dm_svalor, // 0x1401
        t10_underbarrel_recoil_dm_svalor, // 0x1402
        t10_underbarrel_focus_dm_svalor, // 0x1403
        t10_underbarrel_mixunder_dm_svalor, // 0x1404
        t10_underbarrel_mixunder2_dm_svalor, // 0x1405
        t10_lasers_hipaccuracy_dm_svalor, // 0x1406
        t10_lasers_strelok_dm_svalor, // 0x1407
        t10_lasers_focuslaser_dm_svalor, // 0x1408
        t10_lasers_mixlaser_dm_svalor, // 0x1409
        t10_lasers_mixlaser2_dm_svalor, // 0x140a
        t10_rec_svalor, // 0x140b
        t10_zm_svalor, // 0x140c
        t10_zm_svalor_pack, // 0x140d
        t10_me_bat, // 0x140e
        t10_bar_range_lm_aroger10, // 0x140f
        t10_bar_velocity_lm_aroger10, // 0x1410
        t10_bar_highcal_lm_aroger10, // 0x1411
        t10_bar_mixbarrel_lm_aroger10, // 0x1412
        t10_bar_jump_lm_aroger10, // 0x1413
        t10_stocks_adsmove_lm_aroger10, // 0x1414
        t10_stocks_hipfiremove_lm_aroger10, // 0x1415
        t10_stocks_mixstock_lm_aroger10, // 0x1416
        t10_stocks_flinch_lm_aroger10, // 0x1417
        t10_stocks_mixstock2_lm_aroger10, // 0x1418
        t10_belt_lm_p01, // 0x1419
        t10_mags_extclip_lm_aroger10, // 0x141a
        t10_mags_fastreload_lm_aroger10, // 0x141b
        t10_mags_extclip2_lm_aroger10, // 0x141c
        t10_mags_fastreload2_lm_aroger10, // 0x141d
        t10_mags_beltfed_aroger10, // 0x141e
        t10_microreflex03_lmg, // 0x141f
        t10_reflex01_lmg, // 0x1420
        t10_reflex02_lmg, // 0x1421
        t10_reflex03_lmg, // 0x1422
        t10_reflex05_lmg, // 0x1423
        t10_reddot01_lmg, // 0x1424
        t10_reddot02_lmg, // 0x1425
        t10_reddot03_lmg, // 0x1426
        t10_dualzoom01_lmg, // 0x1427
        t10_holo01_lmg, // 0x1428
        t10_holo02_lmg, // 0x1429
        t10_holo_range_lmg, // 0x142a
        t10_hybrid01_lmg, // 0x142b
        t10_hybrid02_lmg, // 0x142c
        t10_twox01_lmg, // 0x142d
        t10_threex01_lmg, // 0x142e
        t10_fourx01_lmg, // 0x142f
        t10_fourx02_lmg, // 0x1430
        t10_varizoom01_lmg, // 0x1431
        t10_varizoom02_lmg, // 0x1432
        t10_scope_rangefinder_lmg, // 0x1433
        t10_thermal01_lmg, // 0x1434
        t10_thermal_holo_lmg, // 0x1435
        t10_ammo_762n_velocity_lm_aroger10, // 0x1436
        t10_ammo_762n_fmj_lm_aroger10, // 0x1437
        t10_firemod_springs_lm_aroger10, // 0x1438
        t10_firemod_boltcarrier_lm_aroger10, // 0x1439
        t10_muzzles_suppressor_lm_aroger10, // 0x143a
        t10_muzzles_comp_lm_aroger10, // 0x143b
        t10_muzzles_brake_lm_aroger10, // 0x143c
        t10_muzzles_mixmuzzle_lm_aroger10, // 0x143d
        t10_grips_quickdraw_lm_aroger10, // 0x143e
        t10_grips_sprintout_lm_aroger10, // 0x143f
        t10_grips_mixgrip_lm_aroger10, // 0x1440
        t10_grips_quickdraw2_lm_aroger10, // 0x1441
        t10_grips_sprintout2_lm_aroger10, // 0x1442
        t10_underbarrel_recoil_lm_aroger10, // 0x1443
        t10_underbarrel_sway_lm_aroger10, // 0x1444
        t10_underbarrel_mixunder_lm_aroger10, // 0x1445
        t10_underbarrel_focus_lm_aroger10, // 0x1446
        t10_underbarrel_mixunder2_lm_aroger10, // 0x1447
        t10_ub_crossbar_lm_aroger10, // 0x1448
        t10_lasers_hipaccuracy_lm_aroger10, // 0x1449
        t10_lasers_strelok_lm_aroger10, // 0x144a
        t10_lasers_focuslaser_lm_aroger10, // 0x144b
        t10_lasers_mixlaser_lm_aroger10, // 0x144c
        t10_lasers_mixlaser2_lm_aroger10, // 0x144d
        t10_bar_lm_p02, // 0x144e
        t10_bar_range_lm_puncle21, // 0x144f
        t10_bar_velocity_lm_puncle21, // 0x1450
        t10_bar_highcal_lm_puncle21, // 0x1451
        t10_bar_mixbarrel_lm_puncle21, // 0x1452
        t10_bar_jump_lm_puncle21, // 0x1453
        t10_stock_lm_p02, // 0x1454
        t10_stocks_adsmove_lm_puncle21, // 0x1455
        t10_stocks_hipfiremove_lm_puncle21, // 0x1456
        t10_stocks_mixstock_lm_puncle21, // 0x1457
        t10_stocks_flinch_lm_puncle21, // 0x1458
        t10_stocks_mixstock2_lm_puncle21, // 0x1459
        t10_drum_lm_p02, // 0x145a
        t10_mags_extclip_lm_puncle21, // 0x145b
        t10_mags_fastreload_lm_puncle21, // 0x145c
        t10_mags_extclip2_lm_puncle21, // 0x145d
        t10_mags_fastreload2_lm_puncle21, // 0x145e
        t10_mags_beltfed_puncle21, // 0x145f
        t10_ironsdefault_puncle21, // 0x1460
        t10_ammo_545s_velocity_lm_puncle21, // 0x1461
        t10_ammo_545s_fmj_lm_puncle21, // 0x1462
        t10_firemod_springs_lm_puncle21, // 0x1463
        t10_firemod_boltcarrier_lm_puncle21, // 0x1464
        t10_muzzles_suppressor_lm_puncle21, // 0x1465
        t10_muzzles_comp_lm_puncle21, // 0x1466
        t10_muzzles_brake_lm_puncle21, // 0x1467
        t10_muzzles_mixmuzzle_lm_puncle21, // 0x1468
        t10_pgrip_lm_p02, // 0x1469
        t10_grips_quickdraw_lm_puncle21, // 0x146a
        t10_grips_sprintout_lm_puncle21, // 0x146b
        t10_grips_mixgrip_lm_puncle21, // 0x146c
        t10_grips_quickdraw2_lm_puncle21, // 0x146d
        t10_grips_sprintout2_lm_puncle21, // 0x146e
        t10_underbarrel_recoil_lm_puncle21, // 0x146f
        t10_underbarrel_sway_lm_puncle21, // 0x1470
        t10_underbarrel_mixunder_lm_puncle21, // 0x1471
        t10_underbarrel_focus_lm_puncle21, // 0x1472
        t10_underbarrel_mixunder2_lm_puncle21, // 0x1473
        t10_ub_crossbar_lm_puncle21, // 0x1474
        t10_lasers_hipaccuracy_lm_puncle21, // 0x1475
        t10_lasers_strelok_lm_puncle21, // 0x1476
        t10_lasers_focuslaser_lm_puncle21, // 0x1477
        t10_lasers_mixlaser_lm_puncle21, // 0x1478
        t10_lasers_mixlaser2_lm_puncle21, // 0x1479
        t10_rec_puncle21, // 0x147a
        t10_zm_puncle21, // 0x147b
        t10_zm_puncle21_pack, // 0x147c
        t10_bar_lm_p07, // 0x147d
        t10_bar_range_lm_ksugar58, // 0x147e
        t10_bar_velocity_lm_ksugar58, // 0x147f
        t10_bar_highcal_lm_ksugar58, // 0x1480
        t10_bar_mixbarrel_lm_ksugar58, // 0x1481
        t10_bar_jump_lm_ksugar58, // 0x1482
        t10_stock_lm_p07, // 0x1483
        t10_stocks_adsmove_lm_ksugar58, // 0x1484
        t10_stocks_hipfiremove_lm_ksugar58, // 0x1485
        t10_stocks_mixstock_lm_ksugar58, // 0x1486
        t10_stocks_flinch_lm_ksugar58, // 0x1487
        t10_stocks_mixstock2_lm_ksugar58, // 0x1488
        t10_belt_lm_p07, // 0x1489
        t10_mags_extclip_lm_ksugar58, // 0x148a
        t10_mags_extclip2_lm_ksugar58, // 0x148b
        t10_mags_extclip3_lm_ksugar58, // 0x148c
        t10_mags_extclip4_lm_ksugar58, // 0x148d
        t10_mags_beltfed_ksugar58, // 0x148e
        t10_ironsdefault_ksugar58, // 0x148f
        t10_ammo_762n_velocity_lm_ksugar58, // 0x1490
        t10_ammo_762n_fmj_lm_ksugar58, // 0x1491
        t10_firemod_springs_lm_ksugar58, // 0x1492
        t10_firemod_boltcarrier_lm_ksugar58, // 0x1493
        t10_muzzles_suppressor_lm_ksugar58, // 0x1494
        t10_muzzles_comp_lm_ksugar58, // 0x1495
        t10_muzzles_brake_lm_ksugar58, // 0x1496
        t10_muzzles_mixmuzzle_lm_ksugar58, // 0x1497
        t10_pgrip_lm_p07, // 0x1498
        t10_grips_quickdraw_lm_ksugar58, // 0x1499
        t10_grips_sprintout_lm_ksugar58, // 0x149a
        t10_grips_mixgrip_lm_ksugar58, // 0x149b
        t10_grips_quickdraw2_lm_ksugar58, // 0x149c
        t10_grips_sprintout2_lm_ksugar58, // 0x149d
        t10_underbarrel_recoil_lm_ksugar58, // 0x149e
        t10_underbarrel_sway_lm_ksugar58, // 0x149f
        t10_underbarrel_mixunder_lm_ksugar58, // 0x14a0
        t10_underbarrel_focus_lm_ksugar58, // 0x14a1
        t10_underbarrel_mixunder2_lm_ksugar58, // 0x14a2
        t10_ub_crossbar_lm_ksugar58, // 0x14a3
        t10_lasers_hipaccuracy_lm_ksugar58, // 0x14a4
        t10_lasers_strelok_lm_ksugar58, // 0x14a5
        t10_lasers_focuslaser_lm_ksugar58, // 0x14a6
        t10_lasers_mixlaser_lm_ksugar58, // 0x14a7
        t10_lasers_mixlaser2_lm_ksugar58, // 0x14a8
        t10_rec_ksugar58, // 0x14a9
        t10_zm_ksugar58, // 0x14aa
        t10_zm_ksugar58_pack, // 0x14ab
        t10_zm_ub_drillgun, // 0x14ac
        t10_rec_drillgun, // 0x14ad
        t10_zm_drillgun, // 0x14ae
        t10_zm_drillgun_pack, // 0x14af
        t10_zm_knife, // 0x14b0
        t10_zm_knife_pack, // 0x14b1
        t10_zm_bat_forcefinisher, // 0x14b2
        t10_zm_bat, // 0x14b3
        t10_zm_bat_pack, // 0x14b4
        t10_zm_bloodstoneeasy_quest, // 0x14b5
        t10_zm_bloodstonefun_quest, // 0x14b6
        t10_zm_bloodstonelife_quest, // 0x14b7
        t10_zm_bloodstoneww, // 0x14b8
        t10_me_cleaver, // 0x14b9
        t10_me_drill, // 0x14ba
        t10_bar_pi_p12, // 0x14bb
        t10_bar_range_pi_paris30, // 0x14bc
        t10_bar_velocity_pi_paris30, // 0x14bd
        t10_bar_highcal_pi_paris30, // 0x14be
        t10_bar_mixbarrel_pi_paris30, // 0x14bf
        t10_bar_jump_pi_paris30, // 0x14c0
        t10_bar_short_pi_paris30, // 0x14c1
        t10_stockno_pi_p12, // 0x14c2
        t10_mag_pi_p12, // 0x14c3
        t10_mags_extclip_pi_paris30, // 0x14c4
        t10_mags_fastreload_pi_paris30, // 0x14c5
        t10_mags_extclip2_pi_paris30, // 0x14c6
        t10_mags_fastreload2_pi_paris30, // 0x14c7
        t10_akimbo_paris30, // 0x14c8
        t10_ironsdefault_paris30, // 0x14c9
        t10_microreflex01_pi_tall, // 0x14ca
        t10_microreflex02_pi_tall, // 0x14cb
        t10_microreflex03_pi_tall, // 0x14cc
        t10_microreflex04_pi_tall, // 0x14cd
        t10_reflex06_pi_tall, // 0x14ce
        t10_scope_pi, // 0x14cf
        t10_selectburst_pi_paris30, // 0x14d0
        t10_ammo_22wmr, // 0x14d1
        t10_ammo_22wmr_velocity_pi_paris30, // 0x14d2
        t10_ammo_22wmr_fmj_pi_paris30, // 0x14d3
        t10_firemod_springs_pi_paris30, // 0x14d4
        t10_muzzles_suppressor_pi_paris30, // 0x14d5
        t10_muzzles_comp_pi_paris30, // 0x14d6
        t10_muzzles_brake_pi_paris30, // 0x14d7
        t10_muzzles_mixmuzzle_pi_paris30, // 0x14d8
        t10_pgrip_pi_p12, // 0x14d9
        t10_grips_quickdraw_pi_paris30, // 0x14da
        t10_grips_sprintout_pi_paris30, // 0x14db
        t10_grips_mixgrip_pi_paris30, // 0x14dc
        t10_grips_quickdraw2_pi_paris30, // 0x14dd
        t10_grips_sprintout2_pi_paris30, // 0x14de
        t10_trigger_p12, // 0x14df
        t10_firemod_trigger_pi_paris30, // 0x14e0
        t10_lasers_hipaccuracy_pi_paris30, // 0x14e1
        t10_lasers_strelok_pi_paris30, // 0x14e2
        t10_lasers_focuslaser_pi_paris30, // 0x14e3
        t10_lasers_mixlaser_pi_paris30, // 0x14e4
        t10_lasers_mixlaser2_pi_paris30, // 0x14e5
        t10_rec_paris30, // 0x14e6
        t10_zm_paris30, // 0x14e7
        t10_zm_paris30_pack, // 0x14e8
        t10_bar_range_pi_usugar45, // 0x14e9
        t10_bar_velocity_pi_usugar45, // 0x14ea
        t10_bar_highcal_pi_usugar45, // 0x14eb
        t10_bar_mixbarrel_pi_usugar45, // 0x14ec
        t10_bar_jump_pi_usugar45, // 0x14ed
        t10_akimbo_usugar9, // 0x14ee
        t10_mags_extclip_pi_usugar45, // 0x14ef
        t10_mags_fastreload_pi_usugar45, // 0x14f0
        t10_mags_extclip2_pi_usugar45, // 0x14f1
        t10_mags_fastreload2_pi_usugar45, // 0x14f2
        t10_microreflex01_pi, // 0x14f3
        t10_microreflex02_pi, // 0x14f4
        t10_microreflex03_pi, // 0x14f5
        t10_microreflex04_pi, // 0x14f6
        t10_reflex06_pi, // 0x14f7
        t10_ammo_45acp_velocity_pi_usugar45, // 0x14f8
        t10_ammo_45acp_fmj_pi_usugar45, // 0x14f9
        t10_muzzles_suppressor_pi_usugar9, // 0x14fa
        t10_muzzles_comp_pi_usugar45, // 0x14fb
        t10_muzzles_brake_pi_usugar45, // 0x14fc
        t10_muzzles_mixmuzzle_pi_usugar45, // 0x14fd
        t10_grips_quickdraw_pi_usugar45, // 0x14fe
        t10_grips_sprintout_pi_usugar45, // 0x14ff
        t10_grips_mixgrip_pi_usugar45, // 0x1500
        t10_grips_quickdraw2_pi_usugar45, // 0x1501
        t10_grips_sprintout2_pi_usugar45, // 0x1502
        t10_firemod_trigger_pi_usugar45, // 0x1503
        t10_firemod_springs_pi_usugar45, // 0x1504
        t10_lasers_hipaccuracy_pi_usugar45, // 0x1505
        t10_lasers_focuslaser_pi_usugar45, // 0x1506
        t10_lasers_mixlaser_pi_usugar45, // 0x1507
        t10_lasers_strelok_pi_usugar45, // 0x1508
        t10_lasers_mixlaser2_pi_usugar45, // 0x1509
        t10_oic, // 0x150a
        t10_bar_pi_p14_mable, // 0x150b
        t10_bar_range_pi_mable, // 0x150c
        t10_bar_velocity_pi_mable, // 0x150d
        t10_bar_highcal_pi_mable, // 0x150e
        t10_bar_mixbarrel_pi_mable, // 0x150f
        t10_bar_jump_pi_mable, // 0x1510
        t10_akimbo_mable, // 0x1511
        t10_mag_pi_p14_mable, // 0x1512
        t10_mags_extclip_pi_mable, // 0x1513
        t10_mags_fastreload_pi_mable, // 0x1514
        t10_mags_extclip2_pi_mable, // 0x1515
        t10_mags_fastreload2_pi_mable, // 0x1516
        t10_ironsdefault_mable, // 0x1517
        t10_ammo_9x18, // 0x1518
        t10_ammo_9x18_velocity_pi_mable, // 0x1519
        t10_ammo_9x18_fmj_pi_mable, // 0x151a
        t10_firemod_springs_pi_mable, // 0x151b
        t10_muzzles_suppressor_pi_mable, // 0x151c
        t10_muzzles_comp_pi_mable, // 0x151d
        t10_muzzles_brake_pi_mable, // 0x151e
        t10_muzzles_mixmuzzle_pi_mable, // 0x151f
        t10_pgrip_pi_p14_mable, // 0x1520
        t10_grips_quickdraw_pi_mable, // 0x1521
        t10_grips_sprintout_pi_mable, // 0x1522
        t10_grips_mixgrip_pi_mable, // 0x1523
        t10_grips_quickdraw2_pi_mable, // 0x1524
        t10_grips_sprintout2_pi_mable, // 0x1525
        t10_trigger_p14_mable, // 0x1526
        t10_firemod_trigger_pi_mable, // 0x1527
        t10_lasers_hipaccuracy_pi_mable, // 0x1528
        t10_lasers_strelok_pi_mable, // 0x1529
        t10_lasers_focuslaser_pi_mable, // 0x152a
        t10_lasers_mixlaser_pi_mable, // 0x152b
        t10_lasers_mixlaser2_pi_mable, // 0x152c
        t10_rec_mable, // 0x152d
        t10_zm_mable, // 0x152e
        t10_zm_mable_pack, // 0x152f
        t10_bar_pi_p14_stiger, // 0x1530
        t10_bar_range_pi_stiger, // 0x1531
        t10_bar_velocity_pi_stiger, // 0x1532
        t10_bar_highcal_pi_stiger, // 0x1533
        t10_bar_mixbarrel_pi_stiger, // 0x1534
        t10_bar_jump_pi_stiger, // 0x1535
        t10_stockno_pi_p14_stiger, // 0x1536
        t10_stocks_pstlstock_pi_stiger, // 0x1537
        t10_mag_pi_p14_stiger, // 0x1538
        t10_mags_extclip_pi_stiger, // 0x1539
        t10_mags_extclip2_pi_stiger, // 0x153a
        t10_mags_fastreload_pi_stiger, // 0x153b
        t10_mags_extclip3_pi_stiger, // 0x153c
        t10_ironsdefault_stiger, // 0x153d
        t10_ammo_9x18_velocity_pi_stiger, // 0x153e
        t10_ammo_9x18_fmj_pi_stiger, // 0x153f
        t10_akimbo_stiger, // 0x1540
        t10_muzzles_suppressor_pi_stiger, // 0x1541
        t10_muzzles_comp_pi_stiger, // 0x1542
        t10_muzzles_brake_pi_stiger, // 0x1543
        t10_muzzles_mixmuzzle_pi_stiger, // 0x1544
        t10_pgrip_pi_p14_stiger, // 0x1545
        t10_grips_quickdraw_pi_stiger, // 0x1546
        t10_grips_sprintout_pi_stiger, // 0x1547
        t10_grips_mixgrip_pi_stiger, // 0x1548
        t10_grips_quickdraw2_pi_stiger, // 0x1549
        t10_grips_sprintout2_pi_stiger, // 0x154a
        t10_firemod_springs_pi_stiger, // 0x154b
        t10_firemod_trigger_pi_stiger, // 0x154c
        t10_lasers_hipaccuracy_pi_stiger, // 0x154d
        t10_lasers_strelok_pi_stiger, // 0x154e
        t10_lasers_focuslaser_pi_stiger, // 0x154f
        t10_lasers_mixlaser_pi_stiger, // 0x1550
        t10_lasers_mixlaser2_pi_stiger, // 0x1551
        t10_rec_stiger, // 0x1552
        t10_zm_stiger, // 0x1553
        t10_zm_stiger_pack, // 0x1554
        t10_bar_sh_p27_jhavana, // 0x1555
        t10_stock_sh_p27_jhavana, // 0x1556
        t10_mag_sh_p27_jhavana, // 0x1557
        t10_ironsdefault_jhavana, // 0x1558
        t10_grip_sh_p27_jhavana, // 0x1559
        t10_rec_jhavana, // 0x155a
        t10_zm_jhavana, // 0x155b
        t10_zm_jhavana_pack, // 0x155c
        t10_bar_sh_moslo_range, // 0x155d
        t10_bar_sh_moslo_sprintout, // 0x155e
        t10_bar_sh_moslo_mixbarrel, // 0x155f
        t10_bar_sh_moslo_recoil, // 0x1560
        t10_bar_sh_moslo_reload, // 0x1561
        t10_stocks_adsmove_sh_moslo, // 0x1562
        t10_stocks_quickdraw_sh_moslo, // 0x1563
        t10_stocks_walkspeed_sh_moslo, // 0x1564
        t10_stocks_quickdraw2_sh_moslo, // 0x1565
        t10_stocks_movespeed_sh_moslo, // 0x1566
        t10_stocks_moverecovery_sh_moslo, // 0x1567
        t10_stocks_sprintout_sh_moslo, // 0x1568
        t10_firemod_pump_sh_moslo500, // 0x1569
        t10_microreflex01_sh, // 0x156a
        t10_microreflex02_sh, // 0x156b
        t10_microreflex03_sh, // 0x156c
        t10_microreflex04_sh, // 0x156d
        t10_reflex01_sh, // 0x156e
        t10_reflex02_sh, // 0x156f
        t10_reflex05_sh, // 0x1570
        t10_reflex06_sh, // 0x1571
        t10_reddot01_sh, // 0x1572
        t10_reddot02_sh, // 0x1573
        t10_reddot03_sh, // 0x1574
        t10_holo01_sh, // 0x1575
        t10_holo_range_sh, // 0x1576
        t10_thermal_holo_sh, // 0x1577
        t10_hybrid01_sh, // 0x1578
        t10_twox01_sh, // 0x1579
        t10_threex01_sh, // 0x157a
        t10_ammo_12g_slug_sh_moslo500, // 0x157b
        t10_ammo_12g_db_sh_moslo500, // 0x157c
        t10_muzzles_choke_sh_moslo, // 0x157d
        t10_muzzles_suppressor_sh_moslo500, // 0x157e
        t10_muzzles_brake_sh_moslo500, // 0x157f
        t10_muzzles_choke2_sh_moslo, // 0x1580
        t10_underbarrel_recoil_sh_moslo500, // 0x1581
        t10_underbarrel_sway_sh_moslo500, // 0x1582
        t10_underbarrel_mixunder_sh_moslo500, // 0x1583
        t10_underbarrel_mixunder2_sh_moslo500, // 0x1584
        t10_lasers_hipaccuracy_sh_moslo500, // 0x1585
        t10_lasers_focuslaser_sh_moslo500, // 0x1586
        t10_lasers_mixlaser_sh_moslo500, // 0x1587
        t10_lasers_mixlaser2_sh_moslo500, // 0x1588
        t10_lasers_strelok_sh_moslo500, // 0x1589
        t10_bar_sh_p25, // 0x158a
        t10_bar_range_sh_uncle12, // 0x158b
        t10_bar_velocity_sh_uncle12, // 0x158c
        t10_bar_highcal_sh_uncle12, // 0x158d
        t10_bar_mixbarrel_sh_uncle12, // 0x158e
        t10_bar_jump_sh_uncle12, // 0x158f
        t10_stock_sh_p25, // 0x1590
        t10_stocks_adsmove_sh_uncle12, // 0x1591
        t10_stocks_hipfiremove_sh_uncle12, // 0x1592
        t10_stocks_mixstock_sh_uncle12, // 0x1593
        t10_stocks_flinch_sh_uncle12, // 0x1594
        t10_stocks_mixstock2_sh_uncle12, // 0x1595
        t10_mag_sh_p25, // 0x1596
        t10_mags_extclip_sh_uncle12, // 0x1597
        t10_mags_fastreload_sh_uncle12, // 0x1598
        t10_mags_extclip2_sh_uncle12, // 0x1599
        t10_mags_fastreload2_sh_uncle12, // 0x159a
        t10_ironsdefault_uncle12, // 0x159b
        t10_ammo_12g_slug_sh_uncle12, // 0x159c
        t10_ammo_12g_db_sh_uncle12, // 0x159d
        t10_firemod_springs_sh_uncle12, // 0x159e
        t10_muzzles_suppressor_sh_uncle12, // 0x159f
        t10_muzzles_brake_sh_uncle12, // 0x15a0
        t10_muzzles_choke_sh_uncle12, // 0x15a1
        t10_muzzles_choke2_sh_uncle12, // 0x15a2
        t10_grip_sh_p25, // 0x15a3
        t10_grips_quickdraw_sh_uncle12, // 0x15a4
        t10_grips_sprintout_sh_uncle12, // 0x15a5
        t10_grips_mixgrip_sh_uncle12, // 0x15a6
        t10_grips_quickdraw2_sh_uncle12, // 0x15a7
        t10_grips_sprintout2_sh_uncle12, // 0x15a8
        t10_underbarrel_sway_sh_uncle12, // 0x15a9
        t10_underbarrel_recoil_sh_uncle12, // 0x15aa
        t10_underbarrel_mixunder_sh_uncle12, // 0x15ab
        t10_underbarrel_mixunder2_sh_uncle12, // 0x15ac
        t10_lasers_hipaccuracy_sh_uncle12, // 0x15ad
        t10_lasers_strelok_sh_uncle12, // 0x15ae
        t10_lasers_focuslaser_sh_uncle12, // 0x15af
        t10_lasers_mixlaser_sh_uncle12, // 0x15b0
        t10_lasers_mixlaser2_sh_uncle12, // 0x15b1
        t10_rec_uncle12, // 0x15b2
        t10_zm_uncle12, // 0x15b3
        t10_zm_uncle12_pack, // 0x15b4
        t10_bar_range_sh_jhavana, // 0x15b5
        t10_bar_velocity_sh_jhavana, // 0x15b6
        t10_bar_jump_sh_jhavana, // 0x15b7
        t10_bar_mixbarrel_sh_jhavana, // 0x15b8
        t10_bar_highcal_sh_jhavana, // 0x15b9
        t10_stocks_adsmove_sh_jhavana, // 0x15ba
        t10_stocks_hipfiremove_sh_jhavana, // 0x15bb
        t10_stocks_mixstock_sh_jhavana, // 0x15bc
        t10_stocks_flinch_sh_jhavana, // 0x15bd
        t10_stocks_mixstock2_sh_jhavana, // 0x15be
        t10_mags_extclip_sh_jhavana, // 0x15bf
        t10_mags_extclip2_sh_jhavana, // 0x15c0
        t10_ammo_12g_db_sh_jhavana, // 0x15c1
        t10_ammo_12g_slug_sh_jhavana, // 0x15c2
        t10_firemod_springs_sh_jhavana, // 0x15c3
        t10_firemod_boltcarrier_sh_jhavana, // 0x15c4
        t10_muzzles_suppressor_sh_jhavana, // 0x15c5
        t10_muzzles_brake_sh_jhavana, // 0x15c6
        t10_muzzles_choke_sh_jhavana, // 0x15c7
        t10_muzzles_choke2_sh_jhavana, // 0x15c8
        t10_grips_quickdraw_sh_jhavana, // 0x15c9
        t10_grips_sprintout_sh_jhavana, // 0x15ca
        t10_grips_mixgrip_sh_jhavana, // 0x15cb
        t10_grips_quickdraw2_sh_jhavana, // 0x15cc
        t10_grips_sprintout2_sh_jhavana, // 0x15cd
        t10_underbarrel_sway_sh_jhavana, // 0x15ce
        t10_underbarrel_recoil_sh_jhavana, // 0x15cf
        t10_underbarrel_mixunder_sh_jhavana, // 0x15d0
        t10_underbarrel_mixunder2_sh_jhavana, // 0x15d1
        t10_lasers_hipaccuracy_sh_jhavana, // 0x15d2
        t10_lasers_strelok_sh_jhavana, // 0x15d3
        t10_lasers_mixlaser_sh_jhavana, // 0x15d4
        t10_lasers_focuslaser_sh_jhavana, // 0x15d5
        t10_lasers_mixlaser2_sh_jhavana, // 0x15d6
        t10_bar_sl_p29_goslo, // 0x15d7
        t10_bar_range_sl_goslo, // 0x15d8
        t10_mag_sl_p29_goslo, // 0x15d9
        t10_mags_extclip_sl_goslo, // 0x15da
        t10_mags_fastreload_sl_goslo, // 0x15db
        t10_ironsdefault_goslo, // 0x15dc
        t10_irons_sl_goslo, // 0x15dd
        t10_reddot_goslo, // 0x15de
        t10_muzzles_suppressor_sl_goslo, // 0x15df
        t10_pgrip_sl_p29_goslo, // 0x15e0
        t10_underbarrel_sway_sl_goslo, // 0x15e1
        t10_underbarrel_recoil_sl_goslo, // 0x15e2
        t10_rec_goslo, // 0x15e3
        t10_zm_goslo, // 0x15e4
        t10_zm_goslo_pack, // 0x15e5
        t10_bar_sm_p02, // 0x15e6
        t10_bar_range_sm_geasy9, // 0x15e7
        t10_bar_velocity_sm_geasy9, // 0x15e8
        t10_bar_highcal_sm_geasy9, // 0x15e9
        t10_bar_mixbarrel_sm_geasy9, // 0x15ea
        t10_bar_jump_sm_geasy9, // 0x15eb
        t10_stock_sm_p02, // 0x15ec
        t10_stocks_adsmove_sm_geasy9, // 0x15ed
        t10_stocks_hipfiremove_sm_geasy9, // 0x15ee
        t10_stocks_mixstock_sm_geasy9, // 0x15ef
        t10_stocks_flinch_sm_geasy9, // 0x15f0
        t10_stocks_mixstock2_sm_geasy9, // 0x15f1
        t10_mag_sm_p02, // 0x15f2
        t10_mags_extclip_sm_geasy9, // 0x15f3
        t10_mags_fastreload_sm_geasy9, // 0x15f4
        t10_mags_extclip2_sm_geasy9, // 0x15f5
        t10_mags_fastreload2_sm_geasy9, // 0x15f6
        t10_ironsdefault_geasy9, // 0x15f7
        t10_microreflex01_smg, // 0x15f8
        t10_microreflex02_smg, // 0x15f9
        t10_microreflex03_smg, // 0x15fa
        t10_microreflex04_smg_tall, // 0x15fb
        t10_reflex01_smg, // 0x15fc
        t10_reflex02_smg, // 0x15fd
        t10_reflex03_smg, // 0x15fe
        t10_reflex04_smg, // 0x15ff
        t10_reflex05_smg, // 0x1600
        t10_reflex06_smg, // 0x1601
        t10_reddot01_smg, // 0x1602
        t10_reddot02_smg, // 0x1603
        t10_reddot03_smg, // 0x1604
        t10_dualzoom01_smg, // 0x1605
        t10_holo01_smg, // 0x1606
        t10_holo02_smg, // 0x1607
        t10_holo_range_smg, // 0x1608
        t10_thermal_holo_smg, // 0x1609
        t10_hybrid01_smg, // 0x160a
        t10_twox01_smg, // 0x160b
        t10_threex01_smg, // 0x160c
        t10_fourx01_smg, // 0x160d
        t10_varizoom01_smg, // 0x160e
        t10_thermal01_smg, // 0x160f
        t10_selectsemi_geasy9, // 0x1610
        t10_ammo_9x19_velocity_sm_geasy9, // 0x1611
        t10_ammo_9x19_fmj_sm_geasy9, // 0x1612
        t10_firemod_springs_sm_geasy9, // 0x1613
        t10_firemod_boltcarrier_sm_geasy9, // 0x1614
        t10_muzzles_suppressor_sm_geasy9, // 0x1615
        t10_muzzles_comp_sm_geasy9, // 0x1616
        t10_muzzles_brake_sm_geasy9, // 0x1617
        t10_muzzles_mixmuzzle_sm_geasy9, // 0x1618
        t10_pgrip_sm_p02, // 0x1619
        t10_grips_quickdraw_sm_geasy9, // 0x161a
        t10_grips_sprintout_sm_geasy9, // 0x161b
        t10_grips_mixgrip_sm_geasy9, // 0x161c
        t10_grips_quickdraw2_sm_geasy9, // 0x161d
        t10_grips_sprintout2_sm_geasy9, // 0x161e
        t10_underbarrel_recoil_sm_geasy9, // 0x161f
        t10_underbarrel_sway_sm_geasy9, // 0x1620
        t10_underbarrel_focus_sm_geasy9, // 0x1621
        t10_underbarrel_mixunder_sm_geasy9, // 0x1622
        t10_underbarrel_mixunder2_sm_geasy9, // 0x1623
        t10_lasers_hipaccuracy_sm_geasy9, // 0x1624
        t10_lasers_strelok_sm_geasy9, // 0x1625
        t10_lasers_focuslaser_sm_geasy9, // 0x1626
        t10_lasers_mixlaser_sm_geasy9, // 0x1627
        t10_lasers_mixlaser2_sm_geasy9, // 0x1628
        t10_rec_geasy9, // 0x1629
        t10_zm_geasy9, // 0x162a
        t10_zm_geasy9_pack, // 0x162b
        t10_bar_sm_p03, // 0x162c
        t10_bar_range_sm_safox, // 0x162d
        t10_bar_velocity_sm_safox, // 0x162e
        t10_bar_highcal_sm_safox, // 0x162f
        t10_bar_mixbarrel_sm_safox, // 0x1630
        t10_bar_jump_sm_safox, // 0x1631
        t10_barsil_sm_safox, // 0x1632
        t10_bar_grip_sm_safox, // 0x1633
        t10_stock_sm_p03, // 0x1634
        t10_stocks_adsmove_sm_safox, // 0x1635
        t10_stocks_hipfiremove_sm_safox, // 0x1636
        t10_stocks_mixstock_sm_safox, // 0x1637
        t10_stocks_flinch_sm_safox, // 0x1638
        t10_stocks_mixstock2_sm_safox, // 0x1639
        t10_mag_sm_p03, // 0x163a
        t10_mags_extclip_sm_safox, // 0x163b
        t10_mags_flip_sm_safox, // 0x163c
        t10_mags_extclip2_sm_safox, // 0x163d
        t10_mags_fastreload2_sm_safox, // 0x163e
        t10_mags_extclip3_sm_safox, // 0x163f
        t10_ironsdefault_safox, // 0x1640
        t10_reflex01_smg_tall, // 0x1641
        t10_selectsemi_safox, // 0x1642
        t10_ammo_9x19, // 0x1643
        t10_ammo_9x19_velocity_sm_safox, // 0x1644
        t10_ammo_9x19_fmj_sm_safox, // 0x1645
        t10_firemod_springs_sm_safox, // 0x1646
        t10_firemod_boltcarrier_sm_safox, // 0x1647
        t10_selectburst_sm_safox, // 0x1648
        t10_muzzles_suppressor_sm_safox, // 0x1649
        t10_muzzles_comp_sm_safox, // 0x164a
        t10_muzzles_brake_sm_safox, // 0x164b
        t10_muzzles_mixmuzzle_sm_safox, // 0x164c
        t10_pgrip_sm_p03, // 0x164d
        t10_grips_quickdraw_sm_safox, // 0x164e
        t10_grips_sprintout_sm_safox, // 0x164f
        t10_grips_mixgrip_sm_safox, // 0x1650
        t10_grips_quickdraw2_sm_safox, // 0x1651
        t10_grips_sprintout2_sm_safox, // 0x1652
        t10_underbarrel_recoil_sm_safox, // 0x1653
        t10_underbarrel_sway_sm_safox, // 0x1654
        t10_underbarrel_mixunder_sm_safox, // 0x1655
        t10_underbarrel_focus_sm_safox, // 0x1656
        t10_underbarrel_mixunder2_sm_safox, // 0x1657
        t10_lasers_hipaccuracy_sm_safox, // 0x1658
        t10_lasers_strelok_sm_safox, // 0x1659
        t10_lasers_focuslaser_sm_safox, // 0x165a
        t10_lasers_mixlaser_sm_safox, // 0x165b
        t10_lasers_mixlaser2_sm_safox, // 0x165c
        t10_rec_safox, // 0x165d
        t10_zm_safox, // 0x165e
        t10_zm_safox_pack, // 0x165f
        t10_bar_sm_p04, // 0x1660
        t10_bar_range_sm_chuck9, // 0x1661
        t10_bar_velocity_sm_chuck9, // 0x1662
        t10_bar_highcal_sm_chuck9, // 0x1663
        t10_bar_mixbarrel_sm_chuck9, // 0x1664
        t10_bar_jump_sm_chuck9, // 0x1665
        t10_stock_sm_p04, // 0x1666
        t10_stocks_adsmove_sm_chuck9, // 0x1667
        t10_stocks_hipfiremove_sm_chuck9, // 0x1668
        t10_stocks_mixstock_sm_chuck9, // 0x1669
        t10_stocks_flinch_sm_chuck9, // 0x166a
        t10_stocks_mixstock2_sm_chuck9, // 0x166b
        t10_mag_sm_p04, // 0x166c
        t10_mags_extclip_sm_chuck9, // 0x166d
        t10_mags_flip_sm_chuck9, // 0x166e
        t10_mags_extclip2_sm_chuck9, // 0x166f
        t10_mags_fastreload2_sm_chuck9, // 0x1670
        t10_ironsdefault_chuck9, // 0x1671
        t10_microreflex04_smg, // 0x1672
        t10_selectsemi_chuck9, // 0x1673
        t10_ammo_9x19_velocity_sm_chuck9, // 0x1674
        t10_ammo_9x19_fmj_sm_chuck9, // 0x1675
        t10_firemod_springs_sm_chuck9, // 0x1676
        t10_firemod_boltcarrier_sm_chuck9, // 0x1677
        t10_selectburst_sm_chuck9, // 0x1678
        t10_muzzles_suppressor_sm_chuck9, // 0x1679
        t10_muzzles_comp_sm_chuck9, // 0x167a
        t10_muzzles_brake_sm_chuck9, // 0x167b
        t10_muzzles_mixmuzzle_sm_chuck9, // 0x167c
        t10_pgrip_sm_p04, // 0x167d
        t10_grips_quickdraw_sm_chuck9, // 0x167e
        t10_grips_sprintout_sm_chuck9, // 0x167f
        t10_grips_mixgrip_sm_chuck9, // 0x1680
        t10_grips_quickdraw2_sm_chuck9, // 0x1681
        t10_grips_sprintout2_sm_chuck9, // 0x1682
        t10_underbarrel_sway_sm_chuck9, // 0x1683
        t10_underbarrel_recoil_sm_chuck9, // 0x1684
        t10_underbarrel_focus_sm_chuck9, // 0x1685
        t10_underbarrel_mixunder_sm_chuck9, // 0x1686
        t10_underbarrel_mixunder2_sm_chuck9, // 0x1687
        t10_lasers_hipaccuracy_sm_chuck9, // 0x1688
        t10_lasers_strelok_sm_chuck9, // 0x1689
        t10_lasers_focuslaser_sm_chuck9, // 0x168a
        t10_lasers_mixlaser_sm_chuck9, // 0x168b
        t10_lasers_mixlaser2_sm_chuck9, // 0x168c
        t10_rec_chuck9, // 0x168d
        t10_zm_chuck9, // 0x168e
        t10_zm_chuck9_pack, // 0x168f
        t10_bar_range_sm_sroger3, // 0x1690
        t10_bar_velocity_sm_sroger3, // 0x1691
        t10_bar_highcal_sm_sroger3, // 0x1692
        t10_bar_mixbarrel_sm_sroger3, // 0x1693
        t10_bar_jump_sm_sroger3, // 0x1694
        t10_stocks_adsmove_sm_sroger3, // 0x1695
        t10_stocks_hipfiremove_sm_sroger3, // 0x1696
        t10_stocks_mixstock_sm_sroger3, // 0x1697
        t10_stocks_flinch_sm_sroger3, // 0x1698
        t10_stocks_mixstock2_sm_sroger3, // 0x1699
        t10_mags_extclip_sm_sroger3, // 0x169a
        t10_mags_flip_sm_sroger3, // 0x169b
        t10_mags_extclip2_sm_sroger3, // 0x169c
        t10_mags_fastreload2_sm_sroger3, // 0x169d
        t10_ammo_9x39_velocity_sm_sroger3, // 0x169e
        t10_ammo_9x39_fmj_sm_sroger3, // 0x169f
        t10_firemod_springs_sm_sroger3, // 0x16a0
        t10_firemod_boltcarrier_sm_sroger3, // 0x16a1
        t10_muzzles_suppressor_sm_sroger3, // 0x16a2
        t10_muzzles_comp_sm_sroger3, // 0x16a3
        t10_muzzles_brake_sm_sroger3, // 0x16a4
        t10_muzzles_mixmuzzle_sm_sroger3, // 0x16a5
        t10_grips_quickdraw_sm_sroger3, // 0x16a6
        t10_grips_sprintout_sm_sroger3, // 0x16a7
        t10_grips_mixgrip_sm_sroger3, // 0x16a8
        t10_grips_quickdraw2_sm_sroger3, // 0x16a9
        t10_grips_sprintout2_sm_sroger3, // 0x16aa
        t10_underbarrel_recoil_sm_sroger3, // 0x16ab
        t10_underbarrel_sway_sm_sroger3, // 0x16ac
        t10_underbarrel_focus_sm_sroger3, // 0x16ad
        t10_underbarrel_mixunder_sm_sroger3, // 0x16ae
        t10_underbarrel_mixunder2_sm_sroger3, // 0x16af
        t10_lasers_hipaccuracy_sm_sroger3, // 0x16b0
        t10_lasers_strelok_sm_sroger3, // 0x16b1
        t10_lasers_focuslaser_sm_sroger3, // 0x16b2
        t10_lasers_mixlaser_sm_sroger3, // 0x16b3
        t10_lasers_mixlaser2_sm_sroger3, // 0x16b4
        t10_bar_sm_p12, // 0x16b5
        t10_bar_range_sm_roger31, // 0x16b6
        t10_bar_velocity_sm_roger31, // 0x16b7
        t10_bar_highcal_sm_roger31, // 0x16b8
        t10_bar_mixbarrel_sm_roger31, // 0x16b9
        t10_bar_jump_sm_roger31, // 0x16ba
        t10_bar_grip_sm_roger31, // 0x16bb
        t10_stock_sm_p12, // 0x16bc
        t10_stocks_adsmove_sm_roger31, // 0x16bd
        t10_stocks_hipfiremove_sm_roger31, // 0x16be
        t10_stocks_mixstock_sm_roger31, // 0x16bf
        t10_stocks_flinch_sm_roger31, // 0x16c0
        t10_stocks_mixstock2_sm_roger31, // 0x16c1
        t10_mag_sm_p12, // 0x16c2
        t10_mags_extclip_sm_roger31, // 0x16c3
        t10_mags_fastreload_sm_roger31, // 0x16c4
        t10_mags_extclip2_sm_roger31, // 0x16c5
        t10_mags_fastreload2_sm_roger31, // 0x16c6
        t10_ironsdefault_roger31, // 0x16c7
        t10_ammo_22wmr_velocity_sm_roger31, // 0x16c8
        t10_ammo_22wmr_fmj_sm_roger31, // 0x16c9
        t10_firemod_springs_sm_roger31, // 0x16ca
        t10_firemod_boltcarrier_sm_roger31, // 0x16cb
        t10_muzzles_brake_sm_roger31, // 0x16cc
        t10_muzzles_comp_sm_roger31, // 0x16cd
        t10_muzzles_suppressor_sm_roger31, // 0x16ce
        t10_muzzles_mixmuzzle_sm_roger31, // 0x16cf
        t10_pgrip_sm_p12, // 0x16d0
        t10_grips_quickdraw_sm_roger31, // 0x16d1
        t10_grips_sprintout_sm_roger31, // 0x16d2
        t10_grips_mixgrip_sm_roger31, // 0x16d3
        t10_grips_quickdraw2_sm_roger31, // 0x16d4
        t10_grips_sprintout2_sm_roger31, // 0x16d5
        t10_underbarrel_sway_sm_roger31, // 0x16d6
        t10_underbarrel_recoil_sm_roger31, // 0x16d7
        t10_underbarrel_mixunder_sm_roger31, // 0x16d8
        t10_underbarrel_focus_sm_roger31, // 0x16d9
        t10_underbarrel_mixunder2_sm_roger31, // 0x16da
        t10_lasers_hipaccuracy_sm_roger31, // 0x16db
        t10_lasers_mixlaser_sm_roger31, // 0x16dc
        t10_lasers_mixlaser2_sm_roger31, // 0x16dd
        t10_lasers_focuslaser_sm_roger31, // 0x16de
        t10_lasers_strelok_sm_roger31, // 0x16df
        t10_rec_roger31, // 0x16e0
        t10_zm_roger31, // 0x16e1
        t10_zm_roger31_pack, // 0x16e2
        t10_bar_sm_p21, // 0x16e3
        t10_bar_range_sm_pparis90, // 0x16e4
        t10_bar_velocity_sm_pparis90, // 0x16e5
        t10_bar_highcal_sm_pparis90, // 0x16e6
        t10_bar_mixbarrel_sm_pparis90, // 0x16e7
        t10_bar_jump_sm_pparis90, // 0x16e8
        t10_stock_sm_p21, // 0x16e9
        t10_stocks_adsmove_sm_pparis90, // 0x16ea
        t10_stocks_hipfiremove_sm_pparis90, // 0x16eb
        t10_stocks_mixstock_sm_pparis90, // 0x16ec
        t10_stocks_flinch_sm_pparis90, // 0x16ed
        t10_stocks_mixstock2_sm_pparis90, // 0x16ee
        t10_mag_sm_p21, // 0x16ef
        t10_mags_extclip_sm_pparis90, // 0x16f0
        t10_mags_fastreload_sm_pparis90, // 0x16f1
        t10_mags_fastreload2_sm_pparis90, // 0x16f2
        t10_mags_fastreload3_sm_pparis90, // 0x16f3
        t10_ironsdefault_pparis90, // 0x16f4
        t10_selectsemi_pparis90, // 0x16f5
        t10_ammo_9x18_velocity_sm_pparis90, // 0x16f6
        t10_ammo_9x18_fmj_sm_pparis90, // 0x16f7
        t10_firemod_springs_sm_pparis90, // 0x16f8
        t10_firemod_boltcarrier_sm_pparis90, // 0x16f9
        t10_muzzles_suppressor_sm_pparis90, // 0x16fa
        t10_muzzles_comp_sm_pparis90, // 0x16fb
        t10_muzzles_brake_sm_pparis90, // 0x16fc
        t10_muzzles_mixmuzzle_sm_pparis90, // 0x16fd
        t10_pgrip_sm_p21, // 0x16fe
        t10_grips_quickdraw_sm_pparis90, // 0x16ff
        t10_grips_sprintout_sm_pparis90, // 0x1700
        t10_grips_mixgrip_sm_pparis90, // 0x1701
        t10_grips_quickdraw2_sm_pparis90, // 0x1702
        t10_grips_sprintout2_sm_pparis90, // 0x1703
        t10_lasers_hipaccuracy_sm_pparis90, // 0x1704
        t10_lasers_strelok_sm_pparis90, // 0x1705
        t10_lasers_focuslaser_sm_pparis90, // 0x1706
        t10_lasers_mixlaser_sm_pparis90, // 0x1707
        t10_lasers_mixlaser2_sm_pparis90, // 0x1708
        t10_rec_pparis90, // 0x1709
        t10_zm_pparis90, // 0x170a
        t10_zm_pparis90_pack, // 0x170b
        t10_bar_sm_p28_saug, // 0x170c
        t10_bar_range_sm_saug, // 0x170d
        t10_bar_velocity_sm_saug, // 0x170e
        t10_bar_jump_sm_saug, // 0x170f
        t10_bar_mixbarrel_sm_saug, // 0x1710
        t10_bar_highcal_sm_saug, // 0x1711
        t10_stock_sm_p28_saug, // 0x1712
        t10_stocks_adsmove_sm_saug, // 0x1713
        t10_stocks_hipfiremove_sm_saug, // 0x1714
        t10_stocks_mixstock_sm_saug, // 0x1715
        t10_stocks_flinch_sm_saug, // 0x1716
        t10_stocks_mixstock2_sm_saug, // 0x1717
        t10_mag_sm_p28_saug, // 0x1718
        t10_mags_extclip_sm_saug, // 0x1719
        t10_ironsdefault_saug, // 0x171a
        t10_selectsemi_saug, // 0x171b
        t10_firemod_springs_sm_saug, // 0x171c
        t10_firemod_boltcarrier_sm_saug, // 0x171d
        t10_muzzles_suppressor_sm_saug, // 0x171e
        t10_muzzles_comp_sm_saug, // 0x171f
        t10_muzzles_brake_sm_saug, // 0x1720
        t10_muzzles_mixmuzzle_sm_saug, // 0x1721
        t10_pgrip_sm_p28_saug, // 0x1722
        t10_grips_quickdraw_sm_saug, // 0x1723
        t10_grips_sprintout_sm_saug, // 0x1724
        t10_grips_mixgrip_sm_saug, // 0x1725
        t10_grips_quickdraw2_sm_saug, // 0x1726
        t10_grips_sprintout2_sm_saug, // 0x1727
        t10_underbarrel_sway_sm_saug, // 0x1728
        t10_underbarrel_recoil_sm_saug, // 0x1729
        t10_underbarrel_mixunder_sm_saug, // 0x172a
        t10_underbarrel_focus_sm_saug, // 0x172b
        t10_underbarrel_mixunder2_sm_saug, // 0x172c
        t10_lasers_hipaccuracy_sm_saug, // 0x172d
        t10_lasers_strelok_sm_saug, // 0x172e
        t10_lasers_focuslaser_sm_saug, // 0x172f
        t10_lasers_mixlaser_sm_saug, // 0x1730
        t10_lasers_mixlaser2_sm_saug, // 0x1731
        t10_rec_saug, // 0x1732
        t10_zm_saug, // 0x1733
        t10_zm_saug_pack, // 0x1734
        t10_bar_range_sn_ultiger, // 0x1735
        t10_bar_velocity_sn_ultiger, // 0x1736
        t10_bar_highcal_sn_ultiger, // 0x1737
        t10_bar_mixbarrel_sn_ultiger, // 0x1738
        t10_bar_jump_sn_ultiger, // 0x1739
        t10_stocks_adsmove_sn_ultiger, // 0x173a
        t10_stocks_hipfiremove_sn_ultiger, // 0x173b
        t10_stocks_mixstock_sn_ultiger, // 0x173c
        t10_stocks_flinch_sn_ultiger, // 0x173d
        t10_stocks_mixstock2_sn_ultiger, // 0x173e
        t10_mags_extclip_sn_ultiger, // 0x173f
        t10_mags_fastreload_sn_ultiger, // 0x1740
        t10_mags_extclip2_sn_ultiger, // 0x1741
        t10_mags_fastreload2_sn_ultiger, // 0x1742
        t10_firemod_bolt_sn_ultiger, // 0x1743
        t10_microreflex03_sn, // 0x1744
        t10_reflex01_sn, // 0x1745
        t10_reflex04_sn, // 0x1746
        t10_reddot01_sn, // 0x1747
        t10_reddot02_sn, // 0x1748
        t10_irons_sn_ultiger, // 0x1749
        t10_dualzoom01_sn, // 0x174a
        t10_holo01_sn, // 0x174b
        t10_holo_range_sn, // 0x174c
        t10_hybrid01_sn, // 0x174d
        t10_hybrid02_sn, // 0x174e
        t10_threex01_sn, // 0x174f
        t10_fourx01_sn, // 0x1750
        t10_fourx02_sn, // 0x1751
        t10_snprscope_ar_sn, // 0x1752
        t10_snprscope_dm_sn, // 0x1753
        t10_varizoom01_sn, // 0x1754
        t10_varizoom02_sn, // 0x1755
        t10_scope_rangefinder_sn, // 0x1756
        t10_thermal01_sn, // 0x1757
        t10_thermal_holo_sn, // 0x1758
        t10_thermal_scope_sn, // 0x1759
        t10_ammo_762n_velocity_sn_ultiger, // 0x175a
        t10_ammo_762n_fmj_sn_ultiger, // 0x175b
        t10_muzzles_suppressor_sn_ultiger, // 0x175c
        t10_muzzles_comp_sn_ultiger, // 0x175d
        t10_muzzles_brake_sn_ultiger, // 0x175e
        t10_muzzles_mixmuzzle_sn_ultiger, // 0x175f
        t10_grips_quickdraw_sn_ultiger, // 0x1760
        t10_grips_sprintout_sn_ultiger, // 0x1761
        t10_grips_mixgrip_sn_ultiger, // 0x1762
        t10_grips_quickdraw2_sn_ultiger, // 0x1763
        t10_grips_sprintout2_sn_ultiger, // 0x1764
        t10_underbarrel_recoil_sn_ultiger, // 0x1765
        t10_underbarrel_sway_sn_ultiger, // 0x1766
        t10_underbarrel_mixunder_sn_ultiger, // 0x1767
        t10_underbarrel_focus_sn_ultiger, // 0x1768
        t10_underbarrel_mixunder2_sn_ultiger, // 0x1769
        t10_lasers_hipaccuracy_sn_ultiger, // 0x176a
        t10_lasers_strelok_sn_ultiger, // 0x176b
        t10_lasers_focuslaser_sn_ultiger, // 0x176c
        t10_lasers_mixlaser_sn_ultiger, // 0x176d
        t10_lasers_mixlaser2_sn_ultiger, // 0x176e
        t10_bar_velocity_sn_ultiger_sp_contract, // 0x176f
        t10_sn_scopes_ultiger_sp_contract, // 0x1770
        t10_bar_range_sn_droger, // 0x1771
        t10_bar_velocity_sn_droger, // 0x1772
        t10_bar_highcal_sn_droger, // 0x1773
        t10_bar_mixbarrel_sn_droger, // 0x1774
        t10_bar_jump_sn_droger, // 0x1775
        t10_stocks_adsmove_sn_droger, // 0x1776
        t10_stocks_hipfiremove_sn_droger, // 0x1777
        t10_stocks_mixstock_sn_droger, // 0x1778
        t10_stocks_flinch_sn_droger, // 0x1779
        t10_stocks_mixstock2_sn_droger, // 0x177a
        t10_mags_extclip_sn_droger, // 0x177b
        t10_mags_fastreload_sn_droger, // 0x177c
        t10_mags_extclip2_sn_droger, // 0x177d
        t10_mags_fastreload2_sn_droger, // 0x177e
        t10_firemod_trigger_sn_droger, // 0x177f
        t10_irons_sn_droger, // 0x1780
        t10_ammo_762r_velocity_sn_droger, // 0x1781
        t10_ammo_762r_fmj_sn_droger, // 0x1782
        t10_firemod_springs_sn_droger, // 0x1783
        t10_muzzles_suppressor_sn_droger, // 0x1784
        t10_muzzles_comp_sn_droger, // 0x1785
        t10_muzzles_brake_sn_droger, // 0x1786
        t10_muzzles_mixmuzzle_sn_droger, // 0x1787
        t10_grips_quickdraw_sn_droger, // 0x1788
        t10_grips_sprintout_sn_droger, // 0x1789
        t10_grips_mixgrip_sn_droger, // 0x178a
        t10_grips_quickdraw2_sn_droger, // 0x178b
        t10_grips_sprintout2_sn_droger, // 0x178c
        t10_underbarrel_recoil_sn_droger, // 0x178d
        t10_underbarrel_sway_sn_droger, // 0x178e
        t10_underbarrel_mixunder_sn_droger, // 0x178f
        t10_underbarrel_focus_sn_droger, // 0x1790
        t10_underbarrel_mixunder2_sn_droger, // 0x1791
        t10_lasers_hipaccuracy_sn_droger, // 0x1792
        t10_lasers_strelok_sn_droger, // 0x1793
        t10_lasers_focuslaser_sn_droger, // 0x1794
        t10_lasers_mixlaser_sn_droger, // 0x1795
        t10_lasers_mixlaser2_sn_droger, // 0x1796
        t10_bar_sn_p24, // 0x1797
        t10_bar_range_sn_love96, // 0x1798
        t10_bar_velocity_sn_love96, // 0x1799
        t10_bar_mixbarrel_sn_love96, // 0x179a
        t10_bar_highcal_sn_love96, // 0x179b
        t10_bar_jump_sn_love96, // 0x179c
        t10_stock_sn_p24, // 0x179d
        t10_stocks_adsmove_sn_love96, // 0x179e
        t10_stocks_hipfiremove_sn_love96, // 0x179f
        t10_stocks_mixstock_sn_love96, // 0x17a0
        t10_stocks_flinch_sn_love96, // 0x17a1
        t10_stocks_mixstock2_sn_love96, // 0x17a2
        t10_mag_sn_p24, // 0x17a3
        t10_mags_extclip_sn_love96, // 0x17a4
        t10_mags_fastreload_sn_love96, // 0x17a5
        t10_mags_extclip2_sn_love96, // 0x17a6
        t10_bolt_sn_p24, // 0x17a7
        t10_firemod_bolt_sn_love96, // 0x17a8
        t10_sn_scopes_love96, // 0x17a9
        t10_irons_sn_love96, // 0x17aa
        t10_ammo_762n_velocity_sn_love96, // 0x17ab
        t10_ammo_762n_fmj_sn_love96, // 0x17ac
        t10_muzzles_suppressor_sn_love96, // 0x17ad
        t10_muzzles_comp_sn_love96, // 0x17ae
        t10_muzzles_brake_sn_love96, // 0x17af
        t10_muzzles_mixmuzzle_sn_love96, // 0x17b0
        t10_pgrip_sn_p24, // 0x17b1
        t10_grips_quickdraw_sn_love96, // 0x17b2
        t10_grips_sprintout_sn_love96, // 0x17b3
        t10_grips_mixgrip_sn_love96, // 0x17b4
        t10_grips_quickdraw2_sn_love96, // 0x17b5
        t10_grips_sprintout2_sn_love96, // 0x17b6
        t10_underbarrel_sn_love96, // 0x17b7
        t10_underbarrel_sway_sn_love96, // 0x17b8
        t10_underbarrel_recoil_sn_love96, // 0x17b9
        t10_underbarrel_focus_sn_love96, // 0x17ba
        t10_underbarrel_mixunder_sn_love96, // 0x17bb
        t10_underbarrel_mixunder2_sn_love96, // 0x17bc
        t10_lasers_hipaccuracy_sn_love96, // 0x17bd
        t10_lasers_strelok_sn_love96, // 0x17be
        t10_lasers_focuslaser_sn_love96, // 0x17bf
        t10_lasers_mixlaser_sn_love96, // 0x17c0
        t10_lasers_mixlaser2_sn_love96, // 0x17c1
        t10_rec_love96, // 0x17c2
        t10_zm_love96, // 0x17c3
        t10_zm_love96_pack, // 0x17c4
        t10_bar_sn_p26_mary82, // 0x17c5
        t10_bar_range_sn_mary82, // 0x17c6
        t10_bar_velocity_sn_mary82, // 0x17c7
        t10_bar_jump_sn_mary82, // 0x17c8
        t10_bar_mixbarrel_sn_mary82, // 0x17c9
        t10_bar_highcal_sn_mary82, // 0x17ca
        t10_stock_sn_p26_mary82, // 0x17cb
        t10_stocks_adsmove_sn_mary82, // 0x17cc
        t10_stocks_hipfiremove_sn_mary82, // 0x17cd
        t10_stocks_mixstock_sn_mary82, // 0x17ce
        t10_stocks_flinch_sn_mary82, // 0x17cf
        t10_stocks_mixstock2_sn_mary82, // 0x17d0
        t10_mag_sn_p26_mary82, // 0x17d1
        t10_mags_extclip_sn_mary82, // 0x17d2
        t10_mags_fastreload_sn_mary82, // 0x17d3
        t10_mags_extclip2_sn_mary82, // 0x17d4
        t10_sn_scopes_mary82, // 0x17d5
        t10_irons_sn_mary82, // 0x17d6
        t10_ammo_50b, // 0x17d7
        t10_ammo_50b_velocity_sn_mary82, // 0x17d8
        t10_ammo_50b_fmj_sn_mary82, // 0x17d9
        t10_firemod_springs_sn_mary82, // 0x17da
        t10_firemod_trigger_sn_mary82, // 0x17db
        t10_muzzles_suppressor_sn_mary82, // 0x17dc
        t10_muzzles_comp_sn_mary82, // 0x17dd
        t10_muzzles_brake_sn_mary82, // 0x17de
        t10_muzzles_mixmuzzle_sn_mary82, // 0x17df
        t10_pgrip_sn_p26_mary82, // 0x17e0
        t10_grips_quickdraw_sn_mary82, // 0x17e1
        t10_grips_sprintout_sn_mary82, // 0x17e2
        t10_grips_mixgrip_sn_mary82, // 0x17e3
        t10_grips_quickdraw2_sn_mary82, // 0x17e4
        t10_grips_sprintout2_sn_mary82, // 0x17e5
        t10_underbarrel_sn_p26_mary82, // 0x17e6
        t10_underbarrel_sway_sn_mary82, // 0x17e7
        t10_underbarrel_recoil_sn_mary82, // 0x17e8
        t10_underbarrel_focus_sn_mary82, // 0x17e9
        t10_underbarrel_mixunder_sn_mary82, // 0x17ea
        t10_underbarrel_mixunder2_sn_mary82, // 0x17eb
        t10_lasers_hipaccuracy_sn_mary82, // 0x17ec
        t10_lasers_strelok_sn_mary82, // 0x17ed
        t10_lasers_focuslaser_sn_mary82, // 0x17ee
        t10_lasers_mixlaser_sn_mary82, // 0x17ef
        t10_lasers_mixlaser2_sn_mary82, // 0x17f0
        t10_rec_mary82, // 0x17f1
        t10_zm_mary82, // 0x17f2
        t10_zm_mary82_pack, // 0x17f3
        zm_la_gromeo, // 0x17f4
        zm_la_gromeo_pack, // 0x17f5
        zm_la_juliet, // 0x17f6
        zm_la_juliet_pack, // 0x17f7
        zm_la_kgolf, // 0x17f8
        zm_la_kgolf_pack, // 0x17f9
        zm_la_mike32, // 0x17fa
        zm_la_mike32_pack, // 0x17fb
        zm_ar_dg2, // 0x17fc
        zm_ar_dg2_pack, // 0x17fd
        zm_la_dromeo, // 0x17fe
        zm_la_dromeo_pap, // 0x17ff
        zm_la_humangun, // 0x1800
        zm_la_humangun_pap, // 0x1801
        zm_la_plasmagun, // 0x1802
        zm_la_plasmagun_pap, // 0x1803
        zm_pi_raygun, // 0x1804
        zm_pi_raygun_pack, // 0x1805
        cer_equip_assault_pack_rec, // 0x1806
        cer_equip_bunkerbuster_burrowed_rec, // 0x1807
        cer_equip_bunkerbuster_rec, // 0x1808
        cer_equip_bunkerbuster_not_burrowed_rec, // 0x1809
        cer_equip_bunkerbuster_round_rec, // 0x180a
        t10_equip_flash_rec, // 0x180b
        t10_equip_semtex_rec, // 0x180c
        t10_equip_frag_rec, // 0x180d
        t10_equip_stun_rec, // 0x180e
        t10_equip_smoke_rec, // 0x180f
        t10_equip_c4_rec, // 0x1810
        t10_equip_combat_axe_rec, // 0x1811
        t10_equip_monkey_bomb_rec, // 0x1812
        t10_equip_blackhole_bomb_rec, // 0x1813
        cer_equip_gas_trap_rec, // 0x1814
        cer_equip_jammer_rec, // 0x1815
        cer_equip_trophy_rec, // 0x1816
        t10_zm_bloodstonedope_quest, // 0x1817
        cer_equip_bunkerbuster_burrowed_gl_rec, // 0x1818
        cer_equip_bunkerbuster_gl_rec, // 0x1819
        cer_equip_bunkerbuster_not_burrowed_gl_rec, // 0x181a
        cer_equip_bunkerbuster_round_gl_rec, // 0x181b
        t10_mags_flip_sm_saug, // 0x181c
        t10_mags_extclip2_sm_saug, // 0x181d
        t10_mags_fastreload2_sm_saug, // 0x181e
        t10_mags_fastreload2_sn_mary82, // 0x181f
        equip_smoke_gl_rec, // 0x1820
        t10_ammo_9x19_velocity_sm_saug, // 0x1821
        t10_ammo_9x19_fmj_sm_saug, // 0x1822
        t10_firemod_trigger_sh_uncle12, // 0x1823
        t10_dynamic_null_launcher, // 0x1824
        t10_rec_mangler, // 0x1825
        t10_lnchrscope_pable3, // 0x1826
        t10_dynamic_null_pable3, // 0x1827
        t10_rec_pable3, // 0x1828
        t10_lnchrscope_stisaac, // 0x1829
        t10_dynamic_null_stisaac, // 0x182a
        t10_rec_stisaac, // 0x182b
        t10_zm_stisaac, // 0x182c
        t10_zm_stisaac_pack, // 0x182d
        t10_lnchrscope_stisaac_sp_intro, // 0x182e
        t10_zm_opalww_tip, // 0x182f
        t10_zm_opalww_healingorb1, // 0x1830
        t10_zm_opalww_healingorb2, // 0x1831
        t10_zm_opalww_healingorb3, // 0x1832
        t10_zm_opalww_pack2, // 0x1833
        t10_zm_opalww_pack3, // 0x1834
        t10_zm_opalww_rec, // 0x1835
        t10_zm_opalww, // 0x1836
        t10_zm_opalww_pack, // 0x1837
        t10_zm_jetgun_ub, // 0x1838
        t10_rec_jetgun, // 0x1839
        t10_zm_jetgun, // 0x183a
        t10_zm_jetgun_pack, // 0x183b
        t10_bar_jadeww, // 0x183c
        t10_mag_jadeww, // 0x183d
        t10_rec_jadeww, // 0x183e
        t10_zm_jadeww, // 0x183f
        t10_zm_jadeww_pack, // 0x1840
        t10_bar_raygun, // 0x1841
        t10_mag_raygun, // 0x1842
        t10_rec_raygun, // 0x1843
        t10_zm_pi_raygun, // 0x1844
        t10_zm_pi_raygun_pack, // 0x1845
        t10_rec_raygunmark2, // 0x1846
        t10_zm_pi_raygunmark2, // 0x1847
        t10_zm_pi_raygunmark2_pack, // 0x1848
        t10_stocks_bufferweight_dm_sroger25, // 0x1849
        t10_stocks_bufferweight_lm_aroger10, // 0x184a
        t10_akimbo_saug, // 0x184b
        t10_ammo_556n_velocity_ar_clove, // 0x184c
        t10_ammo_556n_fmj_ar_rmary2, // 0x184d
        t10_zm_pable3, // 0x184e
        t10_zm_pable3_pack, // 0x184f
        t10_rec_bloodstoneww, // 0x1850
        t10_rec_bloodstoneeasy, // 0x1851
        t10_rec_bloodstonelife, // 0x1852
        t10_rec_bloodstonefun, // 0x1853
        t10_zm_bloodstonefun, // 0x1854
        t10_rec_bloodstonedope, // 0x1855
        t10_selectsemi_roger31, // 0x1856
        t10_bar_sh_moslo_db, // 0x1857
        t10_reddot02_ar_coslo723, // 0x1858
        t10_zm_cleaver, // 0x1859
        t10_zm_cleaver_pack, // 0x185a
        t10_zm_drill, // 0x185b
        t10_zm_drill_pack, // 0x185c
        t10_bar_ar_p34_tbaker, // 0x185d
        t10_ironsdefault_tbaker, // 0x185e
        t10_mag_ar_p34_tbaker, // 0x185f
        t10_pgrip_ar_p34_tbaker, // 0x1860
        t10_rec_tbaker, // 0x1861
        t10_selectsemi_tbaker, // 0x1862
        t10_stock_ar_p34_tbaker, // 0x1863
        t10_zm_tbaker, // 0x1864
        t10_zm_tbaker_pack, // 0x1865
        t10_rec_uxray, // 0x1866
        t10_bar_lm_p33_uxray, // 0x1867
        t10_stock_lm_p33_uxray, // 0x1868
        t10_mag_lm_p33_uxray, // 0x1869
        t10_pgrip_lm_p33_uxray, // 0x186a
        t10_ironsdefault_uxray, // 0x186b
        t10_zm_uxray, // 0x186c
        t10_zm_uxray_pack, // 0x186d
        t10_me_skateboard, // 0x186e
        t10_me_katanas, // 0x186f
        t10_me_sais, // 0x1870
        t10_me_nunchaku, // 0x1871
        t10_me_bostaff, // 0x1872
        t10_ammo_762s_velocity_ar_tbaker, // 0x1873
        t10_bar_highcal_ar_tbaker, // 0x1874
        t10_ammo_762s_fmj_ar_tbaker, // 0x1875
        t10_bar_jump_ar_tbaker, // 0x1876
        t10_bar_mixbarrel_ar_tbaker, // 0x1877
        t10_bar_range_ar_tbaker, // 0x1878
        t10_bar_velocity_ar_tbaker, // 0x1879
        t10_firemod_boltcarrier_ar_tbaker, // 0x187a
        t10_firemod_springs_ar_tbaker, // 0x187b
        t10_grips_mixgrip_ar_tbaker, // 0x187c
        t10_grips_quickdraw_ar_tbaker, // 0x187d
        t10_grips_quickdraw2_ar_tbaker, // 0x187e
        t10_grips_sprintout_ar_tbaker, // 0x187f
        t10_grips_sprintout2_ar_tbaker, // 0x1880
        t10_lasers_focuslaser_ar_tbaker, // 0x1881
        t10_lasers_hipaccuracy_ar_tbaker, // 0x1882
        t10_lasers_mixlaser_ar_tbaker, // 0x1883
        t10_lasers_mixlaser2_ar_tbaker, // 0x1884
        t10_lasers_strelok_ar_tbaker, // 0x1885
        t10_mags_extclip_ar_tbaker, // 0x1886
        t10_mags_extclip2_ar_tbaker, // 0x1887
        t10_mags_fastreload_ar_tbaker, // 0x1888
        t10_muzzles_brake_ar_tbaker, // 0x1889
        t10_muzzles_comp_ar_tbaker, // 0x188a
        t10_muzzles_mixmuzzle_ar_tbaker, // 0x188b
        t10_muzzles_suppressor_ar_tbaker, // 0x188c
        t10_stocks_adsmove_ar_tbaker, // 0x188d
        t10_stocks_flinch_ar_tbaker, // 0x188e
        t10_stocks_hipfiremove_ar_tbaker, // 0x188f
        t10_stocks_mixstock_ar_tbaker, // 0x1890
        t10_stocks_mixstock2_ar_tbaker, // 0x1891
        t10_underbarrel_focus_ar_tbaker, // 0x1892
        t10_underbarrel_mixunder_ar_tbaker, // 0x1893
        t10_underbarrel_mixunder2_ar_tbaker, // 0x1894
        t10_underbarrel_recoil_ar_tbaker, // 0x1895
        t10_underbarrel_sway_ar_tbaker, // 0x1896
        t10_ub_gl_dc_ar_tbaker, // 0x1897
        t10_ub_gl_he_ar_tbaker, // 0x1898
        t10_ub_gl_smoke_ar_tbaker, // 0x1899
        t10_ub_gl_std_ar_tbaker, // 0x189a
        t10_ub_crossbow_ar_coslo723, // 0x189b
        t10_ub_crossbow_ar_aking74, // 0x189c
        t10_ub_crossbow_ar_able18, // 0x189d
        t10_ub_crossbow_ar_clove, // 0x189e
        t10_ub_crossbow_ar_asvalor, // 0x189f
        t10_ub_crossbow_ar_fable, // 0x18a0
        t10_ub_crossbow_ar_tbaker, // 0x18a1
        t10_ub_crossbow_ar_rmary2, // 0x18a2
        t10_ub_crossbow_ar_love85, // 0x18a3
        t10_ub_crossbow_dm_sgeorge550, // 0x18a4
        t10_ub_crossbow_dm_aeasy, // 0x18a5
        t10_selectauto_sn_droger, // 0x18a6
        t10_bar_fullauto_sn_droger, // 0x18a7
        t10_underbarrel_fullauto_sn_droger, // 0x18a8
        t10_mags_fullauto_sn_droger, // 0x18a9
        t10_stocks_fullauto_sn_droger, // 0x18aa
        t10_rec_perth, // 0x18ab
        t10_bar_sm_p41_perth, // 0x18ac
        t10_stock_sm_p41_perth, // 0x18ad
        t10_mag_sm_p41_perth, // 0x18ae
        t10_pgrip_sm_p41_perth, // 0x18af
        t10_ironsdefault_perth, // 0x18b0
        t10_selectsemi_perth, // 0x18b1
        t10_ammo_762t, // 0x18b2
        t10_rec_blauncher, // 0x18b3
        t10_reflex_blauncher, // 0x18b4
        t10_zm_blauncher, // 0x18b5
        t10_zm_blauncher_pack, // 0x18b6
        t10_lasers_hipaccuracy_lm_uxray, // 0x18b7
        t10_lasers_mixlaser_lm_uxray, // 0x18b8
        t10_lasers_mixlaser2_lm_uxray, // 0x18b9
        t10_lasers_focuslaser_lm_uxray, // 0x18ba
        t10_lasers_strelok_lm_uxray, // 0x18bb
        t10_ub_crossbar_lm_uxray, // 0x18bc
        t10_underbarrel_mixunder2_lm_uxray, // 0x18bd
        t10_underbarrel_focus_lm_uxray, // 0x18be
        t10_underbarrel_mixunder_lm_uxray, // 0x18bf
        t10_underbarrel_recoil_lm_uxray, // 0x18c0
        t10_underbarrel_sway_lm_uxray, // 0x18c1
        t10_grips_sprintout2_lm_uxray, // 0x18c2
        t10_grips_quickdraw2_lm_uxray, // 0x18c3
        t10_grips_mixgrip_lm_uxray, // 0x18c4
        t10_grips_sprintout_lm_uxray, // 0x18c5
        t10_grips_quickdraw_lm_uxray, // 0x18c6
        t10_muzzles_suppressor_lm_uxray, // 0x18c7
        t10_muzzles_mixmuzzle_lm_uxray, // 0x18c8
        t10_muzzles_comp_lm_uxray, // 0x18c9
        t10_muzzles_brake_lm_uxray, // 0x18ca
        t10_firemod_springs_lm_uxray, // 0x18cb
        t10_firemod_boltcarrier_lm_uxray, // 0x18cc
        t10_ammo_556n_velocity_lm_uxray, // 0x18cd
        t10_ammo_556n_fmj_lm_uxray, // 0x18ce
        t10_stocks_mixstock2_lm_uxray, // 0x18cf
        t10_stocks_mixstock_lm_uxray, // 0x18d0
        t10_stocks_hipfiremove_lm_uxray, // 0x18d1
        t10_stocks_flinch_lm_uxray, // 0x18d2
        t10_stocks_adsmove_lm_uxray, // 0x18d3
        t10_bar_highcal_lm_uxray, // 0x18d4
        t10_bar_jump_lm_uxray, // 0x18d5
        t10_bar_mixbarrel_lm_uxray, // 0x18d6
        t10_bar_velocity_lm_uxray, // 0x18d7
        t10_bar_range_lm_uxray, // 0x18d8
        t10_bar_db_sh_uncle12, // 0x18d9
        t10_bar_db_sh_jhavana, // 0x18da
        jup_ammo_410g_extra, // 0x18db
        ammo_556n_extra, // 0x18dc
        ammo_blk_extra, // 0x18dd
        ammo_762s_extra, // 0x18de
        ammo_9p_extra, // 0x18df
        jup_ammo_762n_extra, // 0x18e0
        jup_jp17_pgrip_snp, // 0x18e1
        jup_jp17_bar_long, // 0x18e2
        t10_lasers_hipaccuracy_sm_perth, // 0x18e3
        t10_lasers_mixlaser_sm_perth, // 0x18e4
        t10_lasers_mixlaser2_sm_perth, // 0x18e5
        t10_lasers_focuslaser_sm_perth, // 0x18e6
        t10_lasers_strelok_sm_perth, // 0x18e7
        t10_underbarrel_mixunder2_sm_perth, // 0x18e8
        t10_underbarrel_focus_sm_perth, // 0x18e9
        t10_underbarrel_mixunder_sm_perth, // 0x18ea
        t10_underbarrel_recoil_sm_perth, // 0x18eb
        t10_underbarrel_sway_sm_perth, // 0x18ec
        t10_muzzles_suppressor_sm_perth, // 0x18ed
        t10_muzzles_mixmuzzle_sm_perth, // 0x18ee
        t10_muzzles_comp_sm_perth, // 0x18ef
        t10_muzzles_brake_sm_perth, // 0x18f0
        t10_firemod_springs_sm_perth, // 0x18f1
        t10_firemod_boltcarrier_sm_perth, // 0x18f2
        t10_ammo_762t_velocity_sm_perth, // 0x18f3
        t10_ammo_762t_fmj_sm_perth, // 0x18f4
        t10_bar_highcal_sm_perth, // 0x18f5
        t10_bar_jump_sm_perth, // 0x18f6
        t10_bar_mixbarrel_sm_perth, // 0x18f7
        t10_bar_velocity_sm_perth, // 0x18f8
        t10_bar_range_sm_perth, // 0x18f9
        t10_mags_fastreload_sm_perth, // 0x18fa
        t10_mags_flip_sm_perth, // 0x18fb
        t10_mags_extclip_sm_perth, // 0x18fc
        t10_mags_extclip2_sm_perth, // 0x18fd
        t10_zm_handcannon, // 0x18fe
        t10_mags_extclip_lm_uxray, // 0x18ff
        t10_mags_extclip2_lm_uxray, // 0x1900
        t10_mags_fastreload_lm_uxray, // 0x1901
        t10_stocks_adsmove_sm_perth, // 0x1902
        t10_stocks_moverecovery_sm_perth, // 0x1903
        t10_stocks_movespeed_sm_perth, // 0x1904
        t10_stocks_quickdraw2_sm_perth, // 0x1905
        t10_stocks_quickdraw_sm_perth, // 0x1906
        t10_stocks_sprintout_sm_perth, // 0x1907
        t10_stocks_walkspeed_sm_perth, // 0x1908
        t10_zm_bloodstonedope_upgraded, // 0x1909
        t10_zm_bloodstoneeasy_upgraded, // 0x190a
        t10_zm_bloodstonefun_upgraded, // 0x190b
        t10_zm_bloodstonelife_upgraded, // 0x190c
        t10_mag_545_dm_aeasy, // 0x190d
        t10_mag_545_dm_ext_aeasy, // 0x190e
        t10_pgrip_sl_p35_blauncher, // 0x190f
        t10_stock_sl_p35_blauncher, // 0x1910
        t10_mag_sl_p35_blauncher, // 0x1911
        t10_ub_crossbow_sh_uncle12, // 0x1912
        t10_bar_range_sl_blauncher, // 0x1913
        t10_mags_blauncher_ricochet, // 0x1914
        t10_mags_blauncher_vehicle, // 0x1915
        t10_stocks_blauncher_power, // 0x1916
        t10_ub_crossbar_sl_blauncher, // 0x1917
        t10_mags_flip_ar_tbaker, // 0x1918
        iw9_lnchrscope_gromeo, // 0x1919
        jup_ammo_rocket_amp, // 0x191a
        selectsemi_jup_cp16_lm_slima_select_amp, // 0x191b
        t10_ammo_762n_fmj_dm_falove, // 0x191c
        t10_ammo_762n_velocity_dm_falove, // 0x191d
        t10_firemod_trigger_dm_falove, // 0x191e
        t10_firemod_springs_dm_falove, // 0x191f
        t10_mags_flip_dm_falove, // 0x1920
        jup_jp17_mag_5_50b, // 0x1921
        t10_mags_beltfed_lm_uxray, // 0x1922
        t10_zm_warmachine, // 0x1923
        t10_launcherscope_warmachine, // 0x1924
        t10_ammo_556n_velocity_ar_kent, // 0x1925
        t10_ammo_556n_fmj_ar_kent, // 0x1926
        t10_underbarrel_sway_ar_kent, // 0x1927
        t10_underbarrel_recoil_ar_kent, // 0x1928
        t10_underbarrel_mixunder2_ar_kent, // 0x1929
        t10_underbarrel_mixunder_ar_kent, // 0x192a
        t10_underbarrel_gl_std_ar_kent, // 0x192b
        t10_underbarrel_gl_smoke_ar_kent, // 0x192c
        t10_underbarrel_gl_he_ar_kent, // 0x192d
        t10_underbarrel_gl_dc_ar_kent, // 0x192e
        t10_underbarrel_focus_ar_kent, // 0x192f
        t10_ub_crossbow_ar_kent, // 0x1930
        t10_stocks_mixstock2_ar_kent, // 0x1931
        t10_stocks_mixstock_ar_kent, // 0x1932
        t10_stocks_hipfiremove_ar_kent, // 0x1933
        t10_stocks_flinch_ar_kent, // 0x1934
        t10_stocks_adsmove_ar_kent, // 0x1935
        t10_muzzles_suppressor_ar_kent, // 0x1936
        t10_muzzles_mixmuzzle_ar_kent, // 0x1937
        t10_muzzles_comp_ar_kent, // 0x1938
        t10_muzzles_brake_ar_kent, // 0x1939
        t10_mags_flip_ar_kent, // 0x193a
        t10_mags_extclip3_ar_kent, // 0x193b
        t10_mags_extclip2_ar_kent, // 0x193c
        t10_mags_extclip_ar_kent, // 0x193d
        t10_lasers_strelok_ar_kent, // 0x193e
        t10_lasers_mixlaser2_ar_kent, // 0x193f
        t10_lasers_mixlaser_ar_kent, // 0x1940
        t10_lasers_hipaccuracy_ar_kent, // 0x1941
        t10_lasers_focuslaser_ar_kent, // 0x1942
        t10_grips_sprintout2_ar_kent, // 0x1943
        t10_grips_sprintout_ar_kent, // 0x1944
        t10_grips_quickdraw2_ar_kent, // 0x1945
        t10_grips_quickdraw_ar_kent, // 0x1946
        t10_grips_mixgrip_ar_kent, // 0x1947
        t10_firemod_springs_ar_kent, // 0x1948
        t10_firemod_boltcarrier_ar_kent, // 0x1949
        t10_bar_velocity_ar_kent, // 0x194a
        t10_bar_range_ar_kent, // 0x194b
        t10_bar_mixbarrel_ar_kent, // 0x194c
        t10_bar_jump_ar_kent, // 0x194d
        t10_bar_highcal_ar_kent, // 0x194e
        t10_underbarrel_sway_ar_gilroy, // 0x194f
        t10_underbarrel_recoil_ar_gilroy, // 0x1950
        t10_underbarrel_mixunder2_ar_gilroy, // 0x1951
        t10_underbarrel_mixunder_ar_gilroy, // 0x1952
        t10_underbarrel_gl_std_ar_gilroy, // 0x1953
        t10_underbarrel_gl_smoke_ar_gilroy, // 0x1954
        t10_underbarrel_gl_he_ar_gilroy, // 0x1955
        t10_underbarrel_gl_dc_ar_gilroy, // 0x1956
        t10_underbarrel_focus_ar_gilroy, // 0x1957
        t10_ub_crossbow_ar_gilroy, // 0x1958
        t10_stocks_mixstock2_ar_gilroy, // 0x1959
        t10_stocks_mixstock_ar_gilroy, // 0x195a
        t10_stocks_hipfiremove_ar_gilroy, // 0x195b
        t10_stocks_flinch_ar_gilroy, // 0x195c
        t10_stocks_adsmove_ar_gilroy, // 0x195d
        t10_muzzles_suppressor_ar_gilroy, // 0x195e
        t10_muzzles_mixmuzzle_ar_gilroy, // 0x195f
        t10_muzzles_brake_ar_gilroy, // 0x1960
        t10_muzzles_comp_ar_gilroy, // 0x1961
        t10_mags_flip_ar_gilroy, // 0x1962
        t10_mags_extclip2_ar_gilroy, // 0x1963
        t10_mags_extclip_ar_gilroy, // 0x1964
        t10_mags_10rd_ar_gilroy, // 0x1965
        t10_lasers_strelok_ar_gilroy, // 0x1966
        t10_lasers_mixlaser2_ar_gilroy, // 0x1967
        t10_lasers_mixlaser_ar_gilroy, // 0x1968
        t10_lasers_hipaccuracy_ar_gilroy, // 0x1969
        t10_lasers_focuslaser_ar_gilroy, // 0x196a
        t10_grips_sprintout2_ar_gilroy, // 0x196b
        t10_grips_sprintout_ar_gilroy, // 0x196c
        t10_grips_quickdraw2_ar_gilroy, // 0x196d
        t10_grips_quickdraw_ar_gilroy, // 0x196e
        t10_grips_mixgrip_ar_gilroy, // 0x196f
        t10_firemod_springs_ar_gilroy, // 0x1970
        t10_firemod_boltcarrier_ar_gilroy, // 0x1971
        t10_bar_velocity_ar_gilroy, // 0x1972
        t10_bar_range_ar_gilroy, // 0x1973
        t10_bar_mixbarrel_ar_gilroy, // 0x1974
        t10_bar_jump_ar_gilroy, // 0x1975
        t10_bar_highcal_ar_gilroy, // 0x1976
        t10_ammo_762s_velocity_ar_gilroy, // 0x1977
        t10_ammo_762s_fmj_ar_gilroy, // 0x1978
        t10_mags_extclip2_sm_schuck, // 0x1979
        t10_mags_fastreload_sm_schuck, // 0x197a
        t10_mags_fastreload2_sm_schuck, // 0x197b
        t10_muzzles_brake_sm_schuck, // 0x197c
        t10_muzzles_comp_sm_schuck, // 0x197d
        t10_muzzles_mixmuzzle_sm_schuck, // 0x197e
        t10_muzzles_suppressor_sm_schuck, // 0x197f
        t10_stocks_adsmove_sm_schuck, // 0x1980
        t10_stocks_flinch_sm_schuck, // 0x1981
        t10_stocks_hipfiremove_sm_schuck, // 0x1982
        t10_stocks_mixstock_sm_schuck, // 0x1983
        t10_stocks_mixstock2_sm_schuck, // 0x1984
        t10_underbarrel_focus_sm_schuck, // 0x1985
        t10_underbarrel_mixunder_sm_schuck, // 0x1986
        t10_underbarrel_mixunder2_sm_schuck, // 0x1987
        t10_underbarrel_recoil_sm_schuck, // 0x1988
        t10_underbarrel_sway_sm_schuck, // 0x1989
        t10_mags_extclip_sm_schuck, // 0x198a
        t10_lasers_strelok_sm_schuck, // 0x198b
        t10_lasers_mixlaser2_sm_schuck, // 0x198c
        t10_lasers_mixlaser_sm_schuck, // 0x198d
        t10_lasers_hipaccuracy_sm_schuck, // 0x198e
        t10_lasers_focuslaser_sm_schuck, // 0x198f
        t10_grips_sprintout2_sm_schuck, // 0x1990
        t10_grips_sprintout_sm_schuck, // 0x1991
        t10_grips_quickdraw2_sm_schuck, // 0x1992
        t10_grips_quickdraw_sm_schuck, // 0x1993
        t10_grips_mixgrip_sm_schuck, // 0x1994
        t10_firemod_springs_sm_schuck, // 0x1995
        t10_firemod_boltcarrier_sm_schuck, // 0x1996
        t10_bar_velocity_sm_schuck, // 0x1997
        t10_bar_range_sm_schuck, // 0x1998
        t10_bar_mixbarrel_sm_schuck, // 0x1999
        t10_bar_jump_sm_schuck, // 0x199a
        t10_bar_highcal_sm_schuck, // 0x199b
        t10_ammo_9x19_velocity_sm_schuck, // 0x199c
        t10_ammo_9x19_fmj_sm_schuck, // 0x199d
        t10_ammo_108mm_fmj_sn_hugo, // 0x199e
        t10_ammo_108mm_velocity_sn_hugo, // 0x199f
        t10_irons_sn_hugo, // 0x19a0
        t10_underbarrel_sway_sn_hugo, // 0x19a1
        t10_underbarrel_recoil_sn_hugo, // 0x19a2
        t10_underbarrel_mixunder2_sn_hugo, // 0x19a3
        t10_underbarrel_mixunder_sn_hugo, // 0x19a4
        t10_underbarrel_focus_sn_hugo, // 0x19a5
        t10_stocks_mixstock2_sn_hugo, // 0x19a6
        t10_stocks_mixstock_sn_hugo, // 0x19a7
        t10_stocks_hipfiremove_sn_hugo, // 0x19a8
        t10_stocks_flinch_sn_hugo, // 0x19a9
        t10_stocks_adsmove_sn_hugo, // 0x19aa
        t10_muzzles_suppressor_sn_hugo, // 0x19ab
        t10_muzzles_mixmuzzle_sn_hugo, // 0x19ac
        t10_muzzles_comp_sn_hugo, // 0x19ad
        t10_muzzles_brake_sn_hugo, // 0x19ae
        t10_mags_fastreload2_sn_hugo, // 0x19af
        t10_mags_fastreload_sn_hugo, // 0x19b0
        t10_mags_extclip2_sn_hugo, // 0x19b1
        t10_mags_extclip_sn_hugo, // 0x19b2
        t10_lasers_strelok_sn_hugo, // 0x19b3
        t10_lasers_mixlaser2_sn_hugo, // 0x19b4
        t10_lasers_mixlaser_sn_hugo, // 0x19b5
        t10_lasers_hipaccuracy_sn_hugo, // 0x19b6
        t10_lasers_focuslaser_sn_hugo, // 0x19b7
        t10_grips_sprintout2_sn_hugo, // 0x19b8
        t10_grips_sprintout_sn_hugo, // 0x19b9
        t10_grips_quickdraw_sn_hugo, // 0x19ba
        t10_grips_quickdraw2_sn_hugo, // 0x19bb
        t10_grips_mixgrip_sn_hugo, // 0x19bc
        t10_firemod_bolt_sn_hugo, // 0x19bd
        t10_bar_velocity_sn_hugo, // 0x19be
        t10_bar_range_sn_hugo, // 0x19bf
        t10_bar_mixbarrel_sn_hugo, // 0x19c0
        t10_bar_jump_sn_hugo, // 0x19c1
        t10_bar_highcal_sn_hugo, // 0x19c2
        t10_irons_fullauto_sn_droger, // 0x19c3
        t10_mags_fullauto_dm_sgeorge550, // 0x19c4
        t10_mags_fullauto_ext_dm_sgeorge550, // 0x19c5
        t10_bar_fullauto_dm_sgeorge550, // 0x19c6
        t10_muzzles_mono_suppressor, // 0x19c7
        t10_muzzles_mono_suppressor_sn_ultiger, // 0x19c8
        t10_muzzles_mono_suppressor_sn_mary82, // 0x19c9
        t10_muzzles_mono_suppressor_sn_love96, // 0x19ca
        t10_muzzles_mono_suppressor_sn_hugo, // 0x19cb
        t10_muzzles_mono_suppressor_sn_droger, // 0x19cc
        t10_muzzles_mono_suppressor_sm_schuck, // 0x19cd
        t10_muzzles_mono_suppressor_sm_sroger3, // 0x19ce
        t10_muzzles_mono_suppressor_sm_saug, // 0x19cf
        t10_muzzles_mono_suppressor_sm_safox, // 0x19d0
        t10_muzzles_mono_suppressor_sm_roger31, // 0x19d1
        t10_muzzles_mono_suppressor_sm_pparis90, // 0x19d2
        t10_muzzles_mono_suppressor_sm_perth, // 0x19d3
        t10_muzzles_mono_suppressor_sm_geasy9, // 0x19d4
        t10_muzzles_mono_suppressor_sm_chuck9, // 0x19d5
        t10_muzzles_mono_suppressor_sh_uncle12, // 0x19d6
        t10_muzzles_mono_suppressor_sh_moslo500, // 0x19d7
        t10_muzzles_mono_suppressor_sh_jhavana, // 0x19d8
        t10_muzzles_mono_suppressor_pi_usugar9, // 0x19d9
        t10_muzzles_mono_suppressor_pi_stiger, // 0x19da
        t10_muzzles_mono_suppressor_pi_paris30, // 0x19db
        t10_muzzles_mono_suppressor_pi_mable, // 0x19dc
        t10_muzzles_mono_suppressor_lm_uxray, // 0x19dd
        t10_muzzles_mono_suppressor_lm_puncle21, // 0x19de
        t10_muzzles_mono_suppressor_lm_ksugar58, // 0x19df
        t10_muzzles_mono_suppressor_lm_aroger10, // 0x19e0
        t10_muzzles_mono_suppressor_dm_svalor, // 0x19e1
        t10_muzzles_mono_suppressor_dm_sroger25, // 0x19e2
        t10_muzzles_mono_suppressor_dm_sgeorge, // 0x19e3
        t10_muzzles_mono_suppressor_dm_falove, // 0x19e4
        t10_muzzles_mono_suppressor_dm_aeasy, // 0x19e5
        t10_muzzles_mono_suppressor_ar_tbaker, // 0x19e6
        t10_muzzles_mono_suppressor_ar_rmary2, // 0x19e7
        t10_muzzles_mono_suppressor_ar_love85, // 0x19e8
        t10_muzzles_mono_suppressor_ar_kent, // 0x19e9
        t10_muzzles_mono_suppressor_ar_gilroy, // 0x19ea
        t10_muzzles_mono_suppressor_ar_fable, // 0x19eb
        t10_muzzles_mono_suppressor_ar_coslo, // 0x19ec
        t10_muzzles_mono_suppressor_ar_clove, // 0x19ed
        t10_muzzles_mono_suppressor_ar_aking74, // 0x19ee
        t10_muzzles_mono_suppressor_ar_able18, // 0x19ef
        t10_ammo_10mm, // 0x19f0
        t10_ammo_10mm_fmj_sm_chuck9, // 0x19f1
        t10_ammo_10mm_velocity_sm_chuck9, // 0x19f2
        t10_mag_10mm_sm_chuck9, // 0x19f3
        t10_mag_rocket_ar_rmary2, // 0x19f4
        t10_bar_rocket_ar_rmary2, // 0x19f5
        t10_ammo_762n_rocket_rmary2, // 0x19f6
        t10_zm_deathmachine, // 0x19f7
        t10_rec_dg2, // 0x19f8
        t10_bar_range_sm_lisbon, // 0x19f9
        t10_bar_velocity_sm_lisbon, // 0x19fa
        t10_bar_highcal_sm_lisbon, // 0x19fb
        t10_bar_jump_sm_lisbon, // 0x19fc
        t10_bar_mixbarrel_sm_lisbon, // 0x19fd
        t10_muzzles_suppressor_sm_lisbon, // 0x19fe
        t10_muzzles_comp_sm_lisbon, // 0x19ff
        t10_muzzles_brake_sm_lisbon, // 0x1a00
        t10_muzzles_mixmuzzle_sm_lisbon, // 0x1a01
        t10_lasers_strelok_sm_lisbon, // 0x1a02
        t10_lasers_hipaccuracy_sm_lisbon, // 0x1a03
        t10_lasers_focuslaser_sm_lisbon, // 0x1a04
        t10_lasers_mixlaser_sm_lisbon, // 0x1a05
        t10_lasers_mixlaser2_sm_lisbon, // 0x1a06
        t10_underbarrel_sway_sm_lisbon, // 0x1a07
        t10_underbarrel_recoil_sm_lisbon, // 0x1a08
        t10_underbarrel_focus_sm_lisbon, // 0x1a09
        t10_underbarrel_mixunder_sm_lisbon, // 0x1a0a
        t10_underbarrel_mixunder2_sm_lisbon, // 0x1a0b
        t10_mags_extclip_sm_lisbon, // 0x1a0c
        t10_mags_extclip2_sm_lisbon, // 0x1a0d
        t10_grips_quickdraw_sm_lisbon, // 0x1a0e
        t10_grips_sprintout_sm_lisbon, // 0x1a0f
        t10_grips_quickdraw2_sm_lisbon, // 0x1a10
        t10_grips_sprintout2_sm_lisbon, // 0x1a11
        t10_grips_mixgrip_sm_lisbon, // 0x1a12
        t10_stocks_adsmove_sm_lisbon, // 0x1a13
        t10_stocks_hipfiremove_sm_lisbon, // 0x1a14
        t10_stocks_flinch_sm_lisbon, // 0x1a15
        t10_stocks_mixstock_sm_lisbon, // 0x1a16
        t10_stocks_mixstock2_sm_lisbon, // 0x1a17
        t10_firemod_springs_sm_lisbon, // 0x1a18
        t10_ammo_9x19_velocity_sm_lisbon, // 0x1a19
        t10_ammo_9x19_fmj_sm_lisbon, // 0x1a1a
        t10_bar_range_dm_erie, // 0x1a1b
        t10_bar_velocity_dm_erie, // 0x1a1c
        t10_bar_highcal_dm_erie, // 0x1a1d
        t10_bar_jump_dm_erie, // 0x1a1e
        t10_bar_mixbarrel_dm_erie, // 0x1a1f
        t10_muzzles_suppressor_dm_erie, // 0x1a20
        t10_muzzles_comp_dm_erie, // 0x1a21
        t10_muzzles_brake_dm_erie, // 0x1a22
        t10_muzzles_mixmuzzle_dm_erie, // 0x1a23
        t10_lasers_strelok_dm_erie, // 0x1a24
        t10_lasers_hipaccuracy_dm_erie, // 0x1a25
        t10_lasers_focuslaser_dm_erie, // 0x1a26
        t10_lasers_mixlaser_dm_erie, // 0x1a27
        t10_lasers_mixlaser2_dm_erie, // 0x1a28
        t10_underbarrel_sway_dm_erie, // 0x1a29
        t10_underbarrel_recoil_dm_erie, // 0x1a2a
        t10_underbarrel_focus_dm_erie, // 0x1a2b
        t10_underbarrel_mixunder_dm_erie, // 0x1a2c
        t10_underbarrel_mixunder2_dm_erie, // 0x1a2d
        t10_mags_extclip_dm_erie, // 0x1a2e
        t10_mags_extclip2_dm_erie, // 0x1a2f
        t10_mags_fastreload_dm_erie, // 0x1a30
        t10_grips_quickdraw_dm_erie, // 0x1a31
        t10_grips_sprintout_dm_erie, // 0x1a32
        t10_grips_quickdraw2_dm_erie, // 0x1a33
        t10_grips_sprintout2_dm_erie, // 0x1a34
        t10_grips_mixgrip_dm_erie, // 0x1a35
        t10_stocks_adsmove_dm_erie, // 0x1a36
        t10_stocks_hipfiremove_dm_erie, // 0x1a37
        t10_stocks_flinch_dm_erie, // 0x1a38
        t10_stocks_mixstock_dm_erie, // 0x1a39
        t10_stocks_mixstock2_dm_erie, // 0x1a3a
        t10_firemod_springs_dm_erie, // 0x1a3b
        t10_ammo_762n_velocity_dm_erie, // 0x1a3c
        t10_ammo_762n_fmj_dm_erie, // 0x1a3d
        t10_bar_range_ar_fresno, // 0x1a3e
        t10_bar_velocity_ar_fresno, // 0x1a3f
        t10_bar_highcal_ar_fresno, // 0x1a40
        t10_bar_jump_ar_fresno, // 0x1a41
        t10_bar_mixbarrel_ar_fresno, // 0x1a42
        t10_muzzles_suppressor_ar_fresno, // 0x1a43
        t10_muzzles_comp_ar_fresno, // 0x1a44
        t10_muzzles_brake_ar_fresno, // 0x1a45
        t10_muzzles_mixmuzzle_ar_fresno, // 0x1a46
        t10_lasers_strelok_ar_fresno, // 0x1a47
        t10_lasers_hipaccuracy_ar_fresno, // 0x1a48
        t10_lasers_focuslaser_ar_fresno, // 0x1a49
        t10_lasers_mixlaser_ar_fresno, // 0x1a4a
        t10_lasers_mixlaser2_ar_fresno, // 0x1a4b
        t10_underbarrel_sway_ar_fresno, // 0x1a4c
        t10_underbarrel_recoil_ar_fresno, // 0x1a4d
        t10_underbarrel_focus_ar_fresno, // 0x1a4e
        t10_underbarrel_mixunder_ar_fresno, // 0x1a4f
        t10_underbarrel_mixunder2_ar_fresno, // 0x1a50
        t10_ub_gl_std_ar_fresno, // 0x1a51
        t10_mags_extclip_ar_fresno, // 0x1a52
        t10_mags_extclip2_ar_fresno, // 0x1a53
        t10_mags_fastreload2_ar_fresno, // 0x1a54
        t10_mags_flip_ar_fresno, // 0x1a55
        t10_grips_quickdraw_ar_fresno, // 0x1a56
        t10_grips_sprintout_ar_fresno, // 0x1a57
        t10_grips_quickdraw2_ar_fresno, // 0x1a58
        t10_grips_sprintout2_ar_fresno, // 0x1a59
        t10_grips_mixgrip_ar_fresno, // 0x1a5a
        t10_stocks_adsmove_ar_fresno, // 0x1a5b
        t10_stocks_hipfiremove_ar_fresno, // 0x1a5c
        t10_stocks_flinch_ar_fresno, // 0x1a5d
        t10_stocks_mixstock_ar_fresno, // 0x1a5e
        t10_stocks_mixstock2_ar_fresno, // 0x1a5f
        t10_firemod_springs_ar_fresno, // 0x1a60
        t10_firemod_boltcarrier_ar_fresno, // 0x1a61
        t10_ub_gl_smoke_ar_fresno, // 0x1a62
        t10_ub_gl_he_ar_fresno, // 0x1a63
        t10_ub_gl_dc_ar_fresno, // 0x1a64
        t10_ub_crossbow_ar_fresno, // 0x1a65
        t10_mag_45acp_ar_fresno, // 0x1a66
        t10_mags_belt_sm_perth, // 0x1a67
        t10_underbarrel_2n1_ar_coslo723, // 0x1a68
        t10_underbarrel_2n1_ar_aking74, // 0x1a69
        t10_underbarrel_2n1_ar_clove, // 0x1a6a
        t10_underbarrel_2n1_ar_fable, // 0x1a6b
        t10_underbarrel_2n1_ar_rmary2, // 0x1a6c
        t10_underbarrel_2n1_ar_asvalor, // 0x1a6d
        t10_underbarrel_2n1_ar_able18, // 0x1a6e
        t10_underbarrel_2n1_ar_love85, // 0x1a6f
        t10_underbarrel_2n1_ar_tbaker, // 0x1a70
        t10_underbarrel_2n1_ar_kent, // 0x1a71
        t10_underbarrel_2n1_ar_gilroy, // 0x1a72
        t10_underbarrel_2n1_ar_fresno, // 0x1a73
        t10_underbarrel_2n1_sm_geasy9, // 0x1a74
        t10_underbarrel_2n1_sm_safox, // 0x1a75
        t10_underbarrel_2n1_sm_chuck9, // 0x1a76
        t10_underbarrel_2n1_sm_sroger3, // 0x1a77
        t10_underbarrel_2n1_sm_roger31, // 0x1a78
        t10_underbarrel_2n1_sm_pparis90, // 0x1a79
        t10_underbarrel_2n1_sm_saug, // 0x1a7a
        t10_underbarrel_2n1_sm_perth, // 0x1a7b
        t10_underbarrel_2n1_sm_schuck, // 0x1a7c
        t10_underbarrel_2n1_sm_lisbon, // 0x1a7d
        t10_stock_ar_p54_aspen, // 0x1a7e
        t10_stock_ar_p56_milan, // 0x1a7f
        t10_stock_lm_p53_mesa, // 0x1a80
        t10_stock_sl_p11_olove, // 0x1a81
        t10_bar_ar_p54_aspen, // 0x1a82
        t10_bar_ar_p56_milan, // 0x1a83
        t10_bar_lm_p53_mesa, // 0x1a84
        t10_bar_sl_p11_olove, // 0x1a85
        t10_mag_ar_p54_aspen, // 0x1a86
        t10_mag_ar_p56_milan, // 0x1a87
        t10_belt_lm_p53_mesa, // 0x1a88
        t10_tube_sl_p11_olove, // 0x1a89
        t10_pgrip_ar_p54_aspen, // 0x1a8a
        t10_pgrip_ar_p56_milan, // 0x1a8b
        t10_pgrip_lm_p53_mesa, // 0x1a8c
        t10_pgrip_sl_p11_olove, // 0x1a8d
        t10_selectsemi_aspen, // 0x1a8e
        t10_selectsemi_milan, // 0x1a8f
        t10_ironsdefault_aspen, // 0x1a90
        t10_ironsdefault_milan, // 0x1a91
        t10_ironsdefault_mesa, // 0x1a92
        t10_ironsdefault_olove, // 0x1a93
        t10_rec_aspen, // 0x1a94
        t10_rec_milan, // 0x1a95
        t10_rec_mesa, // 0x1a96
        t10_rec_olove, // 0x1a97
        t10_rec_m202, // 0x1a98
        t10_lnchrscope_m202, // 0x1a99
        t10_dynamic_null_m202, // 0x1a9a
        t10_mags_fastreload_sm_lisbon, // 0x1a9b
        t10_mags_flip_sm_lisbon, // 0x1a9c
        t10_rec_45acp_falove, // 0x1a9d
        t10_bar_45acp_dm_falove, // 0x1a9e
        t10_mag_45acp_dm_falove, // 0x1a9f
        t10_mag_45acp_ext_dm_falove, // 0x1aa0
        t10_selectauto_dm_falove, // 0x1aa1
        t10_stocks_grip_sl_olove, // 0x1aa2
        t10_bar_short_sl_olove, // 0x1aa3
        t10_mag_burst_pi_paris30, // 0x1aa4
        t10_bar_range_ar_aspen, // 0x1aa5
        t10_bar_range_ar_milan, // 0x1aa6
        t10_bar_velocity_ar_aspen, // 0x1aa7
        t10_bar_velocity_ar_milan, // 0x1aa8
        t10_bar_highcal_ar_aspen, // 0x1aa9
        t10_bar_highcal_ar_milan, // 0x1aaa
        t10_bar_jump_ar_aspen, // 0x1aab
        t10_bar_jump_ar_milan, // 0x1aac
        t10_bar_mixbarrel_ar_aspen, // 0x1aad
        t10_bar_mixbarrel_ar_milan, // 0x1aae
        t10_bar_range_lm_mesa, // 0x1aaf
        t10_bar_velocity_lm_mesa, // 0x1ab0
        t10_bar_highcal_lm_mesa, // 0x1ab1
        t10_bar_jump_lm_mesa, // 0x1ab2
        t10_bar_mixbarrel_lm_mesa, // 0x1ab3
        t10_bar_range_pi_pyork, // 0x1ab4
        t10_bar_velocity_pi_pyork, // 0x1ab5
        t10_bar_highcal_pi_pyork, // 0x1ab6
        t10_bar_jump_pi_pyork, // 0x1ab7
        t10_bar_mixbarrel_pi_pyork, // 0x1ab8
        t10_muzzles_suppressor_ar_aspen, // 0x1ab9
        t10_muzzles_comp_ar_aspen, // 0x1aba
        t10_muzzles_brake_ar_aspen, // 0x1abb
        t10_muzzles_mixmuzzle_ar_aspen, // 0x1abc
        t10_muzzles_suppressor_ar_milan, // 0x1abd
        t10_muzzles_comp_ar_milan, // 0x1abe
        t10_muzzles_brake_ar_milan, // 0x1abf
        t10_muzzles_mixmuzzle_ar_milan, // 0x1ac0
        t10_muzzles_suppressor_lm_mesa, // 0x1ac1
        t10_muzzles_comp_lm_mesa, // 0x1ac2
        t10_muzzles_brake_lm_mesa, // 0x1ac3
        t10_muzzles_mixmuzzle_lm_mesa, // 0x1ac4
        t10_muzzles_comp_pi_pyork, // 0x1ac5
        t10_muzzles_brake_pi_pyork, // 0x1ac6
        t10_muzzles_mixmuzzle_pi_pyork, // 0x1ac7
        t10_lasers_strelok_ar_aspen, // 0x1ac8
        t10_lasers_hipaccuracy_ar_aspen, // 0x1ac9
        t10_lasers_focuslaser_ar_aspen, // 0x1aca
        t10_lasers_mixlaser_ar_aspen, // 0x1acb
        t10_lasers_mixlaser2_ar_aspen, // 0x1acc
        t10_lasers_strelok_ar_milan, // 0x1acd
        t10_lasers_hipaccuracy_ar_milan, // 0x1ace
        t10_lasers_focuslaser_ar_milan, // 0x1acf
        t10_lasers_mixlaser_ar_milan, // 0x1ad0
        t10_lasers_mixlaser2_ar_milan, // 0x1ad1
        t10_lasers_strelok_lm_mesa, // 0x1ad2
        t10_lasers_hipaccuracy_lm_mesa, // 0x1ad3
        t10_lasers_focuslaser_lm_mesa, // 0x1ad4
        t10_lasers_mixlaser_lm_mesa, // 0x1ad5
        t10_lasers_mixlaser2_lm_mesa, // 0x1ad6
        t10_lasers_strelok_pi_pyork, // 0x1ad7
        t10_lasers_hipaccuracy_pi_pyork, // 0x1ad8
        t10_lasers_focuslaser_pi_pyork, // 0x1ad9
        t10_lasers_mixlaser_pi_pyork, // 0x1ada
        t10_lasers_mixlaser2_pi_pyork, // 0x1adb
        t10_underbarrel_sway_ar_aspen, // 0x1adc
        t10_underbarrel_recoil_ar_aspen, // 0x1add
        t10_underbarrel_focus_ar_aspen, // 0x1ade
        t10_underbarrel_mixunder_ar_aspen, // 0x1adf
        t10_underbarrel_mixunder2_ar_aspen, // 0x1ae0
        t10_underbarrel_sway_ar_milan, // 0x1ae1
        t10_underbarrel_recoil_ar_milan, // 0x1ae2
        t10_underbarrel_focus_ar_milan, // 0x1ae3
        t10_underbarrel_mixunder_ar_milan, // 0x1ae4
        t10_underbarrel_mixunder2_ar_milan, // 0x1ae5
        t10_underbarrel_sway_lm_mesa, // 0x1ae6
        t10_underbarrel_recoil_lm_mesa, // 0x1ae7
        t10_underbarrel_focus_lm_mesa, // 0x1ae8
        t10_underbarrel_mixunder_lm_mesa, // 0x1ae9
        t10_underbarrel_mixunder2_lm_mesa, // 0x1aea
        t10_mags_extclip_ar_aspen, // 0x1aeb
        t10_mags_fastreload_ar_aspen, // 0x1aec
        t10_mags_extclip2_ar_aspen, // 0x1aed
        t10_mags_fastreload2_ar_aspen, // 0x1aee
        t10_mags_extclip_ar_milan, // 0x1aef
        t10_mags_fastreload_ar_milan, // 0x1af0
        t10_mags_extclip2_ar_milan, // 0x1af1
        t10_mags_fastreload2_ar_milan, // 0x1af2
        t10_mags_extclip_lm_mesa, // 0x1af3
        t10_mags_fastreload_lm_mesa, // 0x1af4
        t10_mags_extclip2_lm_mesa, // 0x1af5
        t10_mags_fastreload_pi_pyork, // 0x1af6
        t10_mags_fastreload2_pi_pyork, // 0x1af7
        t10_grips_quickdraw_ar_aspen, // 0x1af8
        t10_grips_sprintout_ar_aspen, // 0x1af9
        t10_grips_quickdraw2_ar_aspen, // 0x1afa
        t10_grips_sprintout2_ar_aspen, // 0x1afb
        t10_grips_mixgrip_ar_aspen, // 0x1afc
        t10_grips_quickdraw_ar_milan, // 0x1afd
        t10_grips_sprintout_ar_milan, // 0x1afe
        t10_grips_quickdraw2_ar_milan, // 0x1aff
        t10_grips_sprintout2_ar_milan, // 0x1b00
        t10_grips_mixgrip_ar_milan, // 0x1b01
        t10_grips_quickdraw_lm_mesa, // 0x1b02
        t10_grips_sprintout_lm_mesa, // 0x1b03
        t10_grips_quickdraw2_lm_mesa, // 0x1b04
        t10_grips_sprintout2_lm_mesa, // 0x1b05
        t10_grips_mixgrip_lm_mesa, // 0x1b06
        t10_grips_quickdraw_pi_pyork, // 0x1b07
        t10_grips_sprintout_pi_pyork, // 0x1b08
        t10_grips_quickdraw2_pi_pyork, // 0x1b09
        t10_grips_sprintout2_pi_pyork, // 0x1b0a
        t10_grips_mixgrip_pi_pyork, // 0x1b0b
        t10_stocks_adsmove_ar_aspen, // 0x1b0c
        t10_stocks_hipfiremove_ar_aspen, // 0x1b0d
        t10_stocks_flinch_ar_aspen, // 0x1b0e
        t10_stocks_mixstock_ar_aspen, // 0x1b0f
        t10_stocks_mixstock2_ar_aspen, // 0x1b10
        t10_stocks_adsmove_ar_milan, // 0x1b11
        t10_stocks_hipfiremove_ar_milan, // 0x1b12
        t10_stocks_flinch_ar_milan, // 0x1b13
        t10_stocks_mixstock_ar_milan, // 0x1b14
        t10_stocks_mixstock2_ar_milan, // 0x1b15
        t10_stocks_adsmove_lm_mesa, // 0x1b16
        t10_stocks_hipfiremove_lm_mesa, // 0x1b17
        t10_stocks_flinch_lm_mesa, // 0x1b18
        t10_stocks_mixstock_lm_mesa, // 0x1b19
        t10_stocks_mixstock2_lm_mesa, // 0x1b1a
        t10_firemod_hammer_dm_erie, // 0x1b1b
        t10_firemod_fast_hammer_dm_erie, // 0x1b1c
        t10_stocks_cutoff_dm_erie, // 0x1b1d
        t10_rec_gilroy, // 0x1b1e
        t10_rec_kent, // 0x1b1f
        t10_bar_ar_p45_kent, // 0x1b20
        t10_stock_ar_p45_kent, // 0x1b21
        t10_mag_ar_p45_kent, // 0x1b22
        t10_ironsdefault_kent, // 0x1b23
        t10_selectsemi_kent, // 0x1b24
        t10_bar_ar_p47_gilroy, // 0x1b25
        t10_stock_ar_p47_gilroy, // 0x1b26
        t10_mag_ar_p47_gilroy, // 0x1b27
        t10_pgrip_ar_p47_gilroy, // 0x1b28
        t10_ironsdefault_gilroy, // 0x1b29
        t10_selectsemi_gilroy, // 0x1b2a
        t10_bar_sn_p46, // 0x1b2b
        t10_stock_sn_p46, // 0x1b2c
        t10_mag_sn_p46, // 0x1b2d
        t10_pgrip_sn_p46, // 0x1b2e
        t10_sn_scopes_hugo, // 0x1b2f
        t10_underbarrel_sn_p46, // 0x1b30
        t10_bolt_sn_p46, // 0x1b31
        t10_rec_hugo, // 0x1b32
        t10_ammo_108mm, // 0x1b33
        t10_rec_schuck, // 0x1b34
        t10_bar_sm_p43, // 0x1b35
        t10_stock_sm_p43, // 0x1b36
        t10_mag_sm_p43, // 0x1b37
        t10_pgrip_sm_p43, // 0x1b38
        t10_ironsdefault_schuck, // 0x1b39
        t10_selectsemi_schuck, // 0x1b3a
        t10_rec_napa, // 0x1b3b
        t10_stock_sl_p44_napa, // 0x1b3c
        t10_mag_sl_p44_napa, // 0x1b3d
        t10_pgrip_sl_p44_napa, // 0x1b3e
        t10_reflex_napa, // 0x1b3f
        t10_me_keene, // 0x1b40
        t10_muzzles_mono_suppressor_ar_fresno, // 0x1b41
        t10_muzzles_mono_suppressor_ar_aspen, // 0x1b42
        t10_muzzles_mono_suppressor_ar_milan, // 0x1b43
        t10_muzzles_mono_suppressor_dm_erie, // 0x1b44
        t10_muzzles_mono_suppressor_lm_mesa, // 0x1b45
        t10_muzzles_mono_suppressor_sm_lisbon, // 0x1b46
        t10_rec_fresno, // 0x1b47
        t10_bar_ar_p49_fresno, // 0x1b48
        t10_stock_ar_p49_fresno, // 0x1b49
        t10_mag_ar_p49_fresno, // 0x1b4a
        t10_pgrip_ar_p49_fresno, // 0x1b4b
        t10_ironsdefault_fresno, // 0x1b4c
        t10_selectsemi_fresno, // 0x1b4d
        t10_rec_erie, // 0x1b4e
        t10_bar_dm_p50_erie, // 0x1b4f
        t10_stock_dm_p50_erie, // 0x1b50
        t10_tube_dm_erie, // 0x1b51
        t10_grip_dm_p50_erie, // 0x1b52
        t10_ironsdefault_erie, // 0x1b53
        t10_underbarrel_dm_p50, // 0x1b54
        t10_rec_pyork, // 0x1b55
        t10_bar_pi_p42, // 0x1b56
        t10_mag_pi_p42, // 0x1b57
        t10_pgrip_pi_p42, // 0x1b58
        t10_ironsdefault_pyork, // 0x1b59
        t10_hammer_p42_pyork, // 0x1b5a
        t10_rec_lisbon, // 0x1b5b
        t10_bar_sm_p52_lisbon, // 0x1b5c
        t10_stock_sm_p52_lisbon, // 0x1b5d
        t10_mag_sm_p52_lisbon, // 0x1b5e
        t10_pgrip_sm_p52_lisbon, // 0x1b5f
        t10_ironsdefault_lisbon, // 0x1b60
        t10_selectsemi_lisbon, // 0x1b61
        t10_firemod_boltcarrier_sm_lisbon, // 0x1b62
        t10_lasers_skullsplitter_pi_mable, // 0x1b63
        t10_ub_gl_std_ar_milan, // 0x1b64
        t10_ub_gl_he_ar_milan, // 0x1b65
        t10_ub_gl_smoke_ar_milan, // 0x1b66
        t10_ub_gl_dc_ar_milan, // 0x1b67
        t10_ub_crossbow_ar_milan, // 0x1b68
        t10_ub_gl_std_ar_aspen, // 0x1b69
        t10_ub_gl_he_ar_aspen, // 0x1b6a
        t10_ub_gl_smoke_ar_aspen, // 0x1b6b
        t10_ub_gl_dc_ar_aspen, // 0x1b6c
        t10_ub_crossbow_ar_aspen, // 0x1b6d
        t10_ammo_556n_fmj_ar_fresno, // 0x1b6e
        t10_ammo_556n_velocity_ar_fresno, // 0x1b6f
        t10_zm_m202, // 0x1b70
        t10_stock_sm_p57, // 0x1b71
        t10_bar_sm_p57, // 0x1b72
        t10_mag_sm_p57, // 0x1b73
        t10_pgrip_sm_p57, // 0x1b74
        t10_ironsdefault_mpug40, // 0x1b75
        t10_selectsemi_mpug40, // 0x1b76
        t10_rec_mpug40, // 0x1b77
        t10_bar_highcal_sm_mpug40, // 0x1b78
        t10_bar_jump_sm_mpug40, // 0x1b79
        t10_bar_mixbarrel_sm_mpug40, // 0x1b7a
        t10_bar_range_sm_mpug40, // 0x1b7b
        t10_bar_velocity_sm_mpug40, // 0x1b7c
        t10_lasers_focuslaser_sm_mpug40, // 0x1b7d
        t10_lasers_hipaccuracy_sm_mpug40, // 0x1b7e
        t10_lasers_mixlaser_sm_mpug40, // 0x1b7f
        t10_lasers_mixlaser2_sm_mpug40, // 0x1b80
        t10_lasers_strelok_sm_mpug40, // 0x1b81
        t10_mags_extclip_sm_mpug40, // 0x1b82
        t10_mags_extclip2_sm_mpug40, // 0x1b83
        t10_mags_fastreload_sm_mpug40, // 0x1b84
        t10_mags_fastreload2_sm_mpug40, // 0x1b85
        t10_ammo_9x19_fmj_sm_mpug40, // 0x1b86
        t10_ammo_9x19_velocity_sm_mpug40, // 0x1b87
        t10_firemod_boltcarrier_sm_mpug40, // 0x1b88
        t10_firemod_springs_sm_mpug40, // 0x1b89
        t10_underbarrel_focus_sm_mpug40, // 0x1b8a
        t10_underbarrel_mixunder_sm_mpug40, // 0x1b8b
        t10_underbarrel_mixunder2_sm_mpug40, // 0x1b8c
        t10_underbarrel_recoil_sm_mpug40, // 0x1b8d
        t10_underbarrel_sway_sm_mpug40, // 0x1b8e
        t10_muzzles_brake_sm_mpug40, // 0x1b8f
        t10_muzzles_comp_sm_mpug40, // 0x1b90
        t10_muzzles_mixmuzzle_sm_mpug40, // 0x1b91
        t10_muzzles_suppressor_sm_mpug40, // 0x1b92
        t10_ammo_arrow_std, // 0x1b93
        t10_rec_compound, // 0x1b94
        t10_ironsdefault_compound, // 0x1b95
        t10_ammo_45acp_dm_falove, // 0x1b96
        t10_irons_ar_aspen, // 0x1b97
        t10_reflex_ar_aspen, // 0x1b98
        t10_underbarrel_ar_aspen, // 0x1b99
        t10_mags_fastreload2_lm_mesa, // 0x1b9a
        t10_crossbar_lm_mesa, // 0x1b9b
        t10_ub_crossbar_lm_mesa, // 0x1b9c
        t10_mags_beltfed_lm_mesa, // 0x1b9d
        t10_mags_skull_pi_mable, // 0x1b9e
        t10_mags_skull_ext_pi_mable, // 0x1b9f
        t10_bar_skull_pi_mable, // 0x1ba0
        t10_rec_mable_skull, // 0x1ba1
        t10_me_bgloves, // 0x1ba2
        t10_underbarrel_2n1_ar_aspen, // 0x1ba3
        t10_underbarrel_2n1_ar_milan, // 0x1ba4
        t10_underbarrel_2n1_sm_mpug40, // 0x1ba5
        t10_muzzles_mono_suppressor_sm_mpug40, // 0x1ba6
        t10_firemod_boltcarrier_ar_aspen, // 0x1ba7
        t10_firemod_boltcarrier_ar_milan, // 0x1ba8
        t10_firemod_boltcarrier_lm_mesa, // 0x1ba9
        t10_firemod_springs_ar_aspen, // 0x1baa
        t10_firemod_springs_ar_milan, // 0x1bab
        t10_firemod_springs_lm_mesa, // 0x1bac
        t10_grips_quickdraw_sm_mpug40, // 0x1bad
        t10_grips_mixgrip_sm_mpug40, // 0x1bae
        t10_grips_quickdraw2_sm_mpug40, // 0x1baf
        t10_grips_sprintout2_sm_mpug40, // 0x1bb0
        t10_grips_sprintout_sm_mpug40, // 0x1bb1
        t10_stocks_flinch_sm_mpug40, // 0x1bb2
        t10_stocks_hipfiremove_sm_mpug40, // 0x1bb3
        t10_stocks_mixstock_sm_mpug40, // 0x1bb4
        t10_stocks_mixstock2_sm_mpug40, // 0x1bb5
        t10_stocks_adsmove_sm_mpug40, // 0x1bb6
        t10_akimbo_pyork, // 0x1bb7
        t10_me_pickaxe, // 0x1bb8
        t10_stocks_quickdraw_ar_milan, // 0x1bb9
        t10_stocks_moverecovery_ar_milan, // 0x1bba
        t10_stocks_movespeed_ar_milan, // 0x1bbb
        t10_stocks_quickdraw2_ar_milan, // 0x1bbc
        t10_stocks_sprintout_ar_milan, // 0x1bbd
        t10_stocks_walkspeed_ar_milan, // 0x1bbe
        t10_firemod_springs_pi_pyork, // 0x1bbf
        t10_ammo_357m_velocity_pyork, // 0x1bc0
        t10_ammo_357m_fmj_pyork, // 0x1bc1
        t10_ammo_556n_velocity_ar_aspen, // 0x1bc2
        t10_ammo_556n_fmj_ar_aspen, // 0x1bc3
        t10_me_csaw, // 0x1bc4
        t10_ammo_556n_velocity_lm_mesa, // 0x1bc5
        t10_ammo_556n_fmj_lm_mesa, // 0x1bc6
        t10_zm_compound, // 0x1bc7
        t10_lefthand_bglove, // 0x1bc8
        t10_muzzles_booster_lm_ksugar58, // 0x1bc9
        t10_bar_booster_lm_ksugar58, // 0x1bca
        t10_bar_db_ar_love85, // 0x1bcb
        t10_lefthand_bglove_extra, // 0x1bcc
        t10_rec_wand, // 0x1bcd
        t10_hammer_rapid_p42_pyork, // 0x1bce
        t10_mags_wand_spine, // 0x1bcf
        t10_mags_wand_spikes, // 0x1bd0
        t10_mags_wand_bulbs, // 0x1bd1
        t10_mags_wand_rock, // 0x1bd2
        t10_ammo_556n_velocity_ar_milan, // 0x1bd3
        t10_ammo_556n_fmj_ar_milan, // 0x1bd4
        t10_slash // 0x1bd5
    };

    // idx 0x3 members: 0x1927 type: 5
    enum Camouflage {
        camo_none, // 0x0
        camo_a_01, // 0x1
        camo_a_02, // 0x2
        camo_a_03, // 0x3
        camo_a_04, // 0x4
        camo_a_05, // 0x5
        camo_a_06, // 0x6
        camo_a_07, // 0x7
        camo_a_08, // 0x8
        camo_a_09, // 0x9
        camo_a_10, // 0xa
        camo_a_11, // 0xb
        camo_a_12, // 0xc
        camo_a_13, // 0xd
        camo_a_14, // 0xe
        camo_a_15, // 0xf
        camo_b_01, // 0x10
        camo_b_02, // 0x11
        camo_b_03, // 0x12
        camo_b_04, // 0x13
        camo_b_05, // 0x14
        camo_b_06, // 0x15
        camo_b_07, // 0x16
        camo_b_08, // 0x17
        camo_b_09, // 0x18
        camo_b_10, // 0x19
        camo_b_11, // 0x1a
        camo_b_12, // 0x1b
        camo_b_13, // 0x1c
        camo_b_14, // 0x1d
        camo_b_15, // 0x1e
        camo_c_01, // 0x1f
        camo_c_02, // 0x20
        camo_c_03, // 0x21
        camo_c_04, // 0x22
        camo_c_05, // 0x23
        camo_c_06, // 0x24
        camo_c_07, // 0x25
        camo_c_08, // 0x26
        camo_c_09, // 0x27
        camo_c_10, // 0x28
        camo_c_11, // 0x29
        camo_c_12, // 0x2a
        camo_c_13, // 0x2b
        camo_c_14, // 0x2c
        camo_c_15, // 0x2d
        camo_d_01, // 0x2e
        camo_d_02, // 0x2f
        camo_d_03, // 0x30
        camo_d_04, // 0x31
        camo_d_05, // 0x32
        camo_d_06, // 0x33
        camo_d_07, // 0x34
        camo_d_08, // 0x35
        camo_d_09, // 0x36
        camo_d_10, // 0x37
        camo_d_11, // 0x38
        camo_d_12, // 0x39
        camo_d_13, // 0x3a
        camo_d_14, // 0x3b
        camo_d_15, // 0x3c
        camo_e_01, // 0x3d
        camo_e_02, // 0x3e
        camo_e_03, // 0x3f
        camo_e_04, // 0x40
        camo_e_05, // 0x41
        camo_e_06, // 0x42
        camo_e_07, // 0x43
        camo_e_08, // 0x44
        camo_e_09, // 0x45
        camo_e_10, // 0x46
        camo_e_11, // 0x47
        camo_e_12, // 0x48
        camo_e_13, // 0x49
        camo_e_14, // 0x4a
        camo_e_15, // 0x4b
        camo_f_01, // 0x4c
        camo_f_02, // 0x4d
        camo_f_03, // 0x4e
        camo_f_04, // 0x4f
        camo_f_05, // 0x50
        camo_f_06, // 0x51
        camo_f_07, // 0x52
        camo_f_08, // 0x53
        camo_f_09, // 0x54
        camo_f_10, // 0x55
        camo_f_11, // 0x56
        camo_f_12, // 0x57
        camo_f_13, // 0x58
        camo_f_14, // 0x59
        camo_f_15, // 0x5a
        camo_g_01, // 0x5b
        camo_g_02, // 0x5c
        camo_g_03, // 0x5d
        camo_g_04, // 0x5e
        camo_g_05, // 0x5f
        camo_g_06, // 0x60
        camo_g_07, // 0x61
        camo_g_08, // 0x62
        camo_g_09, // 0x63
        camo_g_10, // 0x64
        camo_g_11, // 0x65
        camo_g_12, // 0x66
        camo_g_13, // 0x67
        camo_g_14, // 0x68
        camo_g_15, // 0x69
        camo_h_01, // 0x6a
        camo_h_02, // 0x6b
        camo_h_03, // 0x6c
        camo_h_04, // 0x6d
        camo_h_05, // 0x6e
        camo_h_06, // 0x6f
        camo_h_07, // 0x70
        camo_h_08, // 0x71
        camo_h_09, // 0x72
        camo_h_10, // 0x73
        camo_h_11, // 0x74
        camo_h_12, // 0x75
        camo_h_13, // 0x76
        camo_h_14, // 0x77
        camo_h_15, // 0x78
        camo_i_01, // 0x79
        camo_i_02, // 0x7a
        camo_i_03, // 0x7b
        camo_i_04, // 0x7c
        camo_i_05, // 0x7d
        camo_i_06, // 0x7e
        camo_i_07, // 0x7f
        camo_i_08, // 0x80
        camo_i_09, // 0x81
        camo_i_10, // 0x82
        camo_i_11, // 0x83
        camo_i_12, // 0x84
        camo_i_13, // 0x85
        camo_i_14, // 0x86
        camo_i_15, // 0x87
        camo_j_01, // 0x88
        camo_j_02, // 0x89
        camo_j_03, // 0x8a
        camo_j_04, // 0x8b
        camo_j_05, // 0x8c
        camo_j_06, // 0x8d
        camo_j_07, // 0x8e
        camo_j_08, // 0x8f
        camo_j_09, // 0x90
        camo_j_10, // 0x91
        camo_j_11, // 0x92
        camo_j_12, // 0x93
        camo_j_13, // 0x94
        camo_j_14, // 0x95
        camo_j_15, // 0x96
        camo_k_01, // 0x97
        camo_k_02, // 0x98
        camo_k_03, // 0x99
        camo_k_04, // 0x9a
        camo_k_05, // 0x9b
        camo_k_06, // 0x9c
        camo_k_07, // 0x9d
        camo_k_08, // 0x9e
        camo_k_09, // 0x9f
        camo_k_10, // 0xa0
        camo_k_11, // 0xa1
        camo_k_12, // 0xa2
        camo_k_13, // 0xa3
        camo_k_14, // 0xa4
        camo_k_15, // 0xa5
        camo_l_01, // 0xa6
        camo_l_02, // 0xa7
        camo_l_03, // 0xa8
        camo_l_04, // 0xa9
        camo_l_05, // 0xaa
        camo_l_06, // 0xab
        camo_l_07, // 0xac
        camo_l_08, // 0xad
        camo_l_09, // 0xae
        camo_l_10, // 0xaf
        camo_l_11, // 0xb0
        camo_l_12, // 0xb1
        camo_l_13, // 0xb2
        camo_l_14, // 0xb3
        camo_l_15, // 0xb4
        camo_m_01, // 0xb5
        camo_m_02, // 0xb6
        camo_m_03, // 0xb7
        camo_m_04, // 0xb8
        camo_m_05, // 0xb9
        camo_m_06, // 0xba
        camo_m_07, // 0xbb
        camo_m_08, // 0xbc
        camo_m_09, // 0xbd
        camo_m_10, // 0xbe
        camo_m_11, // 0xbf
        camo_m_12, // 0xc0
        camo_m_13, // 0xc1
        camo_m_14, // 0xc2
        camo_m_15, // 0xc3
        camo_n_01, // 0xc4
        camo_n_02, // 0xc5
        camo_n_03, // 0xc6
        camo_n_04, // 0xc7
        camo_n_05, // 0xc8
        camo_n_06, // 0xc9
        camo_n_07, // 0xca
        camo_n_08, // 0xcb
        camo_n_09, // 0xcc
        camo_n_10, // 0xcd
        camo_n_11, // 0xce
        camo_n_12, // 0xcf
        camo_n_13, // 0xd0
        camo_n_14, // 0xd1
        camo_n_15, // 0xd2
        camo_o_01, // 0xd3
        camo_o_02, // 0xd4
        camo_o_03, // 0xd5
        camo_o_04, // 0xd6
        camo_o_05, // 0xd7
        camo_o_06, // 0xd8
        camo_o_07, // 0xd9
        camo_o_08, // 0xda
        camo_o_09, // 0xdb
        camo_o_10, // 0xdc
        camo_o_11, // 0xdd
        camo_o_12, // 0xde
        camo_o_13, // 0xdf
        camo_o_14, // 0xe0
        camo_o_15, // 0xe1
        camo_cdl_01, // 0xe2
        camo_cdl_02, // 0xe3
        camo_cdl_03, // 0xe4
        camo_cdl_04, // 0xe5
        camo_cdl_05, // 0xe6
        camo_cdl_06, // 0xe7
        camo_cdl_07, // 0xe8
        camo_cdl_08, // 0xe9
        camo_cdl_09, // 0xea
        camo_cdl_10, // 0xeb
        camo_cdl_11, // 0xec
        camo_cdl_12, // 0xed
        camo_cdl_13, // 0xee
        camo_comp_01, // 0xef
        camo_comp_02, // 0xf0
        camo_comp_03, // 0xf1
        camo_comp_04, // 0xf2
        camo_r_01, // 0xf3
        camo_r_02, // 0xf4
        camo_p_01, // 0xf5
        camo_p_02, // 0xf6
        camo_p_03, // 0xf7
        camo_p_04, // 0xf8
        camo_p_05, // 0xf9
        camo_p_06, // 0xfa
        camo_p_07, // 0xfb
        camo_p_08, // 0xfc
        camo_p_09, // 0xfd
        camo_p_10, // 0xfe
        camo_p_11, // 0xff
        camo_p_12, // 0x100
        camo_p_13, // 0x101
        camo_p_14, // 0x102
        camo_p_15, // 0x103
        camo_q_01, // 0x104
        camo_q_02, // 0x105
        camo_q_03, // 0x106
        camo_q_04, // 0x107
        camo_q_05, // 0x108
        camo_q_06, // 0x109
        camo_q_07, // 0x10a
        camo_q_08, // 0x10b
        camo_q_09, // 0x10c
        camo_q_10, // 0x10d
        camo_q_11, // 0x10e
        camo_q_12, // 0x10f
        camo_q_13, // 0x110
        camo_q_14, // 0x111
        camo_q_15, // 0x112
        camo_r_03, // 0x113
        camo_r_04, // 0x114
        camo_r_05, // 0x115
        camo_r_06, // 0x116
        camo_r_07, // 0x117
        camo_r_08, // 0x118
        camo_r_09, // 0x119
        camo_r_10, // 0x11a
        camo_r_11, // 0x11b
        camo_r_12, // 0x11c
        camo_r_13, // 0x11d
        camo_r_14, // 0x11e
        camo_r_15, // 0x11f
        camo_s_01, // 0x120
        camo_s_02, // 0x121
        camo_s_03, // 0x122
        camo_s_04, // 0x123
        camo_s_05, // 0x124
        camo_s_06, // 0x125
        camo_s_07, // 0x126
        camo_s_08, // 0x127
        camo_s_09, // 0x128
        camo_s_10, // 0x129
        camo_s_11, // 0x12a
        camo_s_12, // 0x12b
        camo_s_13, // 0x12c
        camo_s_14, // 0x12d
        camo_s_15, // 0x12e
        camo_t_01, // 0x12f
        camo_t_02, // 0x130
        camo_t_03, // 0x131
        camo_t_04, // 0x132
        camo_t_05, // 0x133
        camo_t_06, // 0x134
        camo_t_07, // 0x135
        camo_t_08, // 0x136
        camo_t_09, // 0x137
        camo_t_10, // 0x138
        camo_t_11, // 0x139
        camo_t_12, // 0x13a
        camo_t_13, // 0x13b
        camo_t_14, // 0x13c
        camo_t_15, // 0x13d
        camo_u_01, // 0x13e
        camo_u_02, // 0x13f
        camo_u_03, // 0x140
        camo_u_04, // 0x141
        camo_u_05, // 0x142
        camo_u_06, // 0x143
        camo_u_07, // 0x144
        camo_u_08, // 0x145
        camo_u_09, // 0x146
        camo_u_10, // 0x147
        camo_u_11, // 0x148
        camo_u_12, // 0x149
        camo_u_13, // 0x14a
        camo_u_14, // 0x14b
        camo_u_15, // 0x14c
        camo_v_01, // 0x14d
        camo_v_02, // 0x14e
        camo_v_03, // 0x14f
        camo_v_04, // 0x150
        camo_v_05, // 0x151
        camo_v_06, // 0x152
        camo_v_07, // 0x153
        camo_v_08, // 0x154
        camo_v_09, // 0x155
        camo_v_10, // 0x156
        camo_v_11, // 0x157
        camo_v_12, // 0x158
        camo_v_13, // 0x159
        camo_v_14, // 0x15a
        camo_v_15, // 0x15b
        camo_w_01, // 0x15c
        camo_w_02, // 0x15d
        camo_w_03, // 0x15e
        camo_w_04, // 0x15f
        camo_w_05, // 0x160
        camo_w_06, // 0x161
        camo_w_07, // 0x162
        camo_w_08, // 0x163
        camo_w_09, // 0x164
        camo_w_10, // 0x165
        camo_w_11, // 0x166
        camo_w_12, // 0x167
        camo_w_13, // 0x168
        camo_w_14, // 0x169
        camo_w_15, // 0x16a
        jup_camo_pap_a_01, // 0x16b
        jup_camo_pap_a_02, // 0x16c
        jup_camo_pap_a_03, // 0x16d
        jup_camo_02a, // 0x16e
        jup_camo_02b, // 0x16f
        jup_camo_02c, // 0x170
        jup_camo_02d, // 0x171
        jup_camo_02e, // 0x172
        jup_camo_02f, // 0x173
        jup_camo_09a, // 0x174
        jup_camo_09b, // 0x175
        jup_camo_09c, // 0x176
        jup_camo_09d, // 0x177
        jup_camo_09e, // 0x178
        jup_camo_09f, // 0x179
        jup_camo_09g, // 0x17a
        jup_camo_09h, // 0x17b
        jup_camo_16a, // 0x17c
        jup_camo_16b, // 0x17d
        jup_camo_16c, // 0x17e
        jup_camo_16d, // 0x17f
        jup_camo_16e, // 0x180
        jup_camo_16f, // 0x181
        jup_camo_16g, // 0x182
        jup_camo_16h, // 0x183
        jup_camo_16i, // 0x184
        jup_camo_16j, // 0x185
        jup_camo_16k, // 0x186
        jup_camo_16l, // 0x187
        jup_camo_16m, // 0x188
        jup_camo_20a, // 0x189
        jup_camo_20b, // 0x18a
        jup_camo_20c, // 0x18b
        jup_camo_20d, // 0x18c
        jup_camo_20e, // 0x18d
        jup_camo_20f, // 0x18e
        jup_camo_20g, // 0x18f
        jup_camo_20h, // 0x190
        jup_camo_20i, // 0x191
        jup_camo_20j, // 0x192
        jup_camo_22a, // 0x193
        jup_camo_22b, // 0x194
        jup_camo_22c, // 0x195
        jup_camo_22d, // 0x196
        jup_camo_22e, // 0x197
        jup_camo_22f, // 0x198
        jup_camo_22g, // 0x199
        jup_camo_22h, // 0x19a
        jup_camo_24a, // 0x19b
        jup_camo_24b, // 0x19c
        jup_camo_24c, // 0x19d
        jup_camo_24d, // 0x19e
        jup_camo_24e, // 0x19f
        jup_camo_24f, // 0x1a0
        jup_camo_25a, // 0x1a1
        jup_camo_25b, // 0x1a2
        jup_camo_25c, // 0x1a3
        jup_camo_25d, // 0x1a4
        jup_camo_25e, // 0x1a5
        jup_camo_25f, // 0x1a6
        jup_camo_25g, // 0x1a7
        jup_camo_25h, // 0x1a8
        jup_camo_comp_01, // 0x1a9
        jup_camo_comp_02, // 0x1aa
        jup_camo_comp_03, // 0x1ab
        jup_camo_comp_04, // 0x1ac
        jup_camo_speciala, // 0x1ad
        jup_camo_eventsa, // 0x1ae
        jup_camo_eventsb, // 0x1af
        jup_camo_eventsc, // 0x1b0
        jup_camo_eventsd, // 0x1b1
        jup_camo_eventse, // 0x1b2
        jup_camo_eventsf, // 0x1b3
        jup_camo_04a, // 0x1b4
        jup_camo_04b, // 0x1b5
        jup_camo_04c, // 0x1b6
        jup_camo_04d, // 0x1b7
        jup_camo_04e, // 0x1b8
        jup_camo_04f, // 0x1b9
        jup_camo_04g, // 0x1ba
        jup_camo_04h, // 0x1bb
        jup_camo_04i, // 0x1bc
        jup_camo_04j, // 0x1bd
        jup_camo_04k, // 0x1be
        jup_camo_04l, // 0x1bf
        jup_camo_07a, // 0x1c0
        jup_camo_07b, // 0x1c1
        jup_camo_07c, // 0x1c2
        jup_camo_07d, // 0x1c3
        jup_camo_07e, // 0x1c4
        jup_camo_07f, // 0x1c5
        jup_camo_07g, // 0x1c6
        jup_camo_07h, // 0x1c7
        jup_camo_07i, // 0x1c8
        jup_camo_07j, // 0x1c9
        jup_camo_11a, // 0x1ca
        jup_camo_11b, // 0x1cb
        jup_camo_11c, // 0x1cc
        jup_camo_11d, // 0x1cd
        jup_camo_11e, // 0x1ce
        jup_camo_11f, // 0x1cf
        jup_camo_11g, // 0x1d0
        jup_camo_11h, // 0x1d1
        jup_camo_11i, // 0x1d2
        jup_camo_11j, // 0x1d3
        jup_camo_11k, // 0x1d4
        jup_camo_11l, // 0x1d5
        jup_camo_14a, // 0x1d6
        jup_camo_14b, // 0x1d7
        jup_camo_14c, // 0x1d8
        jup_camo_14d, // 0x1d9
        jup_camo_14e, // 0x1da
        jup_camo_14f, // 0x1db
        jup_camo_14g, // 0x1dc
        jup_camo_14h, // 0x1dd
        jup_camo_14i, // 0x1de
        jup_camo_14j, // 0x1df
        jup_camo_14k, // 0x1e0
        jup_camo_14l, // 0x1e1
        jup_camo_18a, // 0x1e2
        jup_camo_18b, // 0x1e3
        jup_camo_18c, // 0x1e4
        jup_camo_18d, // 0x1e5
        jup_camo_18e, // 0x1e6
        jup_camo_18f, // 0x1e7
        jup_camo_18g, // 0x1e8
        jup_camo_18h, // 0x1e9
        jup_camo_18i, // 0x1ea
        jup_camo_18j, // 0x1eb
        jup_camo_18k, // 0x1ec
        jup_camo_18l, // 0x1ed
        jup_camo_05a, // 0x1ee
        jup_camo_05b, // 0x1ef
        jup_camo_05c, // 0x1f0
        jup_camo_05d, // 0x1f1
        jup_camo_05e, // 0x1f2
        jup_camo_05f, // 0x1f3
        jup_camo_05g, // 0x1f4
        jup_camo_06a, // 0x1f5
        jup_camo_06b, // 0x1f6
        jup_camo_06c, // 0x1f7
        jup_camo_06d, // 0x1f8
        jup_camo_06e, // 0x1f9
        jup_camo_06f, // 0x1fa
        jup_camo_06g, // 0x1fb
        jup_camo_06h, // 0x1fc
        jup_camo_06i, // 0x1fd
        jup_camo_06j, // 0x1fe
        jup_camo_08a, // 0x1ff
        jup_camo_08b, // 0x200
        jup_camo_08c, // 0x201
        jup_camo_08d, // 0x202
        jup_camo_08e, // 0x203
        jup_camo_08f, // 0x204
        jup_camo_08g, // 0x205
        jup_camo_08h, // 0x206
        jup_camo_10a, // 0x207
        jup_camo_10b, // 0x208
        jup_camo_10c, // 0x209
        jup_camo_10d, // 0x20a
        jup_camo_10e, // 0x20b
        jup_camo_10f, // 0x20c
        jup_camo_10g, // 0x20d
        jup_camo_10h, // 0x20e
        jup_camo_10i, // 0x20f
        jup_camo_10j, // 0x210
        jup_camo_10k, // 0x211
        jup_camo_10l, // 0x212
        jup_camo_12a, // 0x213
        jup_camo_12b, // 0x214
        jup_camo_12c, // 0x215
        jup_camo_12d, // 0x216
        jup_camo_12e, // 0x217
        jup_camo_12f, // 0x218
        jup_camo_12g, // 0x219
        jup_camo_12h, // 0x21a
        jup_camo_12i, // 0x21b
        jup_camo_13a, // 0x21c
        jup_camo_13b, // 0x21d
        jup_camo_13c, // 0x21e
        jup_camo_13d, // 0x21f
        jup_camo_13e, // 0x220
        jup_camo_13f, // 0x221
        jup_camo_13g, // 0x222
        jup_camo_13h, // 0x223
        jup_camo_13i, // 0x224
        jup_camo_13j, // 0x225
        jup_camo_13k, // 0x226
        jup_camo_13l, // 0x227
        jup_camo_15a, // 0x228
        jup_camo_15b, // 0x229
        jup_camo_15c, // 0x22a
        jup_camo_15d, // 0x22b
        jup_camo_15e, // 0x22c
        jup_camo_15f, // 0x22d
        jup_camo_15g, // 0x22e
        jup_camo_15h, // 0x22f
        jup_camo_15i, // 0x230
        jup_camo_15j, // 0x231
        jup_camo_15k, // 0x232
        jup_camo_15l, // 0x233
        jup_camo_17a, // 0x234
        jup_camo_17b, // 0x235
        jup_camo_17c, // 0x236
        jup_camo_17d, // 0x237
        jup_camo_17e, // 0x238
        jup_camo_17f, // 0x239
        jup_camo_19a, // 0x23a
        jup_camo_19b, // 0x23b
        jup_camo_19c, // 0x23c
        jup_camo_19d, // 0x23d
        jup_camo_19e, // 0x23e
        jup_camo_19f, // 0x23f
        jup_camo_19g, // 0x240
        jup_camo_19h, // 0x241
        jup_camo_19i, // 0x242
        jup_camo_19j, // 0x243
        jup_camo_19k, // 0x244
        jup_camo_19l, // 0x245
        jup_camo_19m, // 0x246
        jup_camo_21a, // 0x247
        jup_camo_21b, // 0x248
        jup_camo_21c, // 0x249
        jup_camo_21d, // 0x24a
        jup_camo_21e, // 0x24b
        jup_camo_21f, // 0x24c
        jup_camo_21g, // 0x24d
        jup_camo_21h, // 0x24e
        jup_camo_23a, // 0x24f
        jup_camo_23b, // 0x250
        jup_camo_23c, // 0x251
        jup_camo_23d, // 0x252
        jup_camo_23e, // 0x253
        jup_camo_ob_iw9_1a, // 0x254
        jup_camo_ob_iw9_1b, // 0x255
        jup_camo_ob_iw9_1c, // 0x256
        jup_camo_ob_iw9_1d, // 0x257
        jup_camo_ob_iw9_1e, // 0x258
        jup_camo_ob_iw9_1f, // 0x259
        jup_camo_ob_iw9_1g, // 0x25a
        jup_camo_ob_iw9_1h, // 0x25b
        jup_camo_ob_iw9_1i, // 0x25c
        jup_camo_ob_iw9_1j, // 0x25d
        jup_camo_ob_iw9_1k, // 0x25e
        jup_camo_ob_iw9_1l, // 0x25f
        jup_camo_ob_iw9_1m, // 0x260
        jup_camo_ob_iw9_1n, // 0x261
        jup_camo_ob_iw9_1o, // 0x262
        jup_camo_ob_iw9_1p, // 0x263
        jup_camo_ob_iw9_1q, // 0x264
        jup_camo_ob_iw9_1r, // 0x265
        jup_camo_ob_iw9_1s, // 0x266
        jup_camo_ob_iw9_1t, // 0x267
        jup_camo_ob_iw9_1u, // 0x268
        jup_camo_ob_iw9_1v, // 0x269
        jup_camo_ob_iw9_1w, // 0x26a
        jup_camo_ob_iw9_2a, // 0x26b
        jup_camo_ob_iw9_2b, // 0x26c
        jup_camo_ob_iw9_2c, // 0x26d
        jup_camo_ob_iw9_2d, // 0x26e
        jup_camo_ob_iw9_2e, // 0x26f
        jup_camo_ob_iw9_2f, // 0x270
        jup_camo_ob_iw9_2g, // 0x271
        jup_camo_ob_iw9_2h, // 0x272
        jup_camo_ob_iw9_2i, // 0x273
        jup_camo_ob_iw9_2j, // 0x274
        jup_camo_ob_iw9_2k, // 0x275
        jup_camo_ob_iw9_2l, // 0x276
        jup_camo_ob_iw9_2m, // 0x277
        jup_camo_ob_iw9_2n, // 0x278
        jup_camo_ob_iw9_2o, // 0x279
        jup_camo_ob_iw9_2p, // 0x27a
        jup_camo_ob_iw9_2q, // 0x27b
        jup_camo_ob_iw9_2r, // 0x27c
        jup_camo_ob_iw9_2s, // 0x27d
        jup_camo_ob_iw9_2t, // 0x27e
        jup_camo_ob_iw9_2u, // 0x27f
        jup_camo_ob_iw9_2v, // 0x280
        jup_camo_ob_iw9_2w, // 0x281
        jup_camo_ob_iw9_3a, // 0x282
        jup_camo_ob_iw9_3b, // 0x283
        jup_camo_ob_iw9_3c, // 0x284
        jup_camo_ob_iw9_3d, // 0x285
        jup_camo_ob_iw9_3e, // 0x286
        jup_camo_ob_iw9_3f, // 0x287
        jup_camo_ob_iw9_3g, // 0x288
        jup_camo_ob_iw9_3h, // 0x289
        jup_camo_ob_iw9_3i, // 0x28a
        jup_camo_ob_iw9_3j, // 0x28b
        jup_camo_ob_iw9_3k, // 0x28c
        jup_camo_ob_iw9_3l, // 0x28d
        jup_camo_ob_iw9_3m, // 0x28e
        jup_camo_ob_iw9_3n, // 0x28f
        jup_camo_ob_iw9_3o, // 0x290
        jup_camo_ob_iw9_3p, // 0x291
        jup_camo_ob_iw9_3q, // 0x292
        jup_camo_ob_iw9_3r, // 0x293
        jup_camo_ob_iw9_3s, // 0x294
        jup_camo_ob_iw9_3t, // 0x295
        jup_camo_ob_iw9_3u, // 0x296
        jup_camo_ob_iw9_3v, // 0x297
        jup_camo_ob_iw9_3w, // 0x298
        jup_camo_ob_iw9_4a, // 0x299
        jup_camo_ob_iw9_4b, // 0x29a
        jup_camo_ob_iw9_4c, // 0x29b
        jup_camo_ob_iw9_4d, // 0x29c
        jup_camo_ob_iw9_4e, // 0x29d
        jup_camo_ob_iw9_4f, // 0x29e
        jup_camo_ob_iw9_4g, // 0x29f
        jup_camo_ob_iw9_4h, // 0x2a0
        jup_camo_ob_iw9_4i, // 0x2a1
        jup_camo_ob_iw9_4j, // 0x2a2
        jup_camo_ob_iw9_4k, // 0x2a3
        jup_camo_ob_iw9_4l, // 0x2a4
        jup_camo_ob_iw9_4m, // 0x2a5
        jup_camo_ob_iw9_4n, // 0x2a6
        jup_camo_ob_iw9_4o, // 0x2a7
        jup_camo_ob_iw9_4p, // 0x2a8
        jup_camo_ob_iw9_4q, // 0x2a9
        jup_camo_ob_iw9_4r, // 0x2aa
        jup_camo_ob_iw9_4s, // 0x2ab
        jup_camo_ob_iw9_4t, // 0x2ac
        jup_camo_ob_iw9_4u, // 0x2ad
        jup_camo_ob_iw9_4v, // 0x2ae
        jup_camo_ob_iw9_4w, // 0x2af
        jup_camo_ob_iw9_5a, // 0x2b0
        jup_camo_ob_iw9_5b, // 0x2b1
        jup_camo_ob_iw9_5c, // 0x2b2
        jup_camo_ob_iw9_5d, // 0x2b3
        jup_camo_ob_iw9_5e, // 0x2b4
        jup_camo_ob_iw9_5f, // 0x2b5
        jup_camo_ob_iw9_5g, // 0x2b6
        jup_camo_ob_iw9_5h, // 0x2b7
        jup_camo_ob_iw9_5i, // 0x2b8
        jup_camo_ob_iw9_5j, // 0x2b9
        jup_camo_ob_iw9_5k, // 0x2ba
        jup_camo_ob_iw9_5l, // 0x2bb
        jup_camo_ob_iw9_5m, // 0x2bc
        jup_camo_ob_iw9_5n, // 0x2bd
        jup_camo_ob_iw9_5o, // 0x2be
        jup_camo_ob_iw9_5p, // 0x2bf
        jup_camo_ob_iw9_5q, // 0x2c0
        jup_camo_ob_iw9_5r, // 0x2c1
        jup_camo_ob_iw9_5s, // 0x2c2
        jup_camo_ob_iw9_5t, // 0x2c3
        jup_camo_ob_iw9_5u, // 0x2c4
        jup_camo_ob_iw9_5v, // 0x2c5
        jup_camo_ob_iw9_5w, // 0x2c6
        jup_camo_ob_iw9_6a, // 0x2c7
        jup_camo_ob_iw9_6b, // 0x2c8
        jup_camo_ob_iw9_6c, // 0x2c9
        jup_camo_ob_iw9_6d, // 0x2ca
        jup_camo_ob_iw9_6e, // 0x2cb
        jup_camo_ob_iw9_6f, // 0x2cc
        jup_camo_ob_iw9_6g, // 0x2cd
        jup_camo_ob_iw9_6h, // 0x2ce
        jup_camo_ob_iw9_6i, // 0x2cf
        jup_camo_ob_iw9_6j, // 0x2d0
        jup_camo_ob_iw9_6k, // 0x2d1
        jup_camo_ob_iw9_6l, // 0x2d2
        jup_camo_ob_iw9_6m, // 0x2d3
        jup_camo_ob_iw9_6n, // 0x2d4
        jup_camo_ob_iw9_6o, // 0x2d5
        jup_camo_ob_iw9_6p, // 0x2d6
        jup_camo_ob_iw9_6q, // 0x2d7
        jup_camo_ob_iw9_6r, // 0x2d8
        jup_camo_ob_iw9_6s, // 0x2d9
        jup_camo_ob_iw9_6t, // 0x2da
        jup_camo_ob_iw9_6u, // 0x2db
        jup_camo_ob_iw9_6v, // 0x2dc
        jup_camo_ob_iw9_6w, // 0x2dd
        jup_camo_ob_iw9_7a, // 0x2de
        jup_camo_ob_iw9_7b, // 0x2df
        jup_camo_ob_iw9_7c, // 0x2e0
        jup_camo_ob_iw9_7d, // 0x2e1
        jup_camo_ob_iw9_7e, // 0x2e2
        jup_camo_ob_iw9_7f, // 0x2e3
        jup_camo_ob_iw9_7g, // 0x2e4
        jup_camo_ob_iw9_7h, // 0x2e5
        jup_camo_ob_iw9_7i, // 0x2e6
        jup_camo_ob_iw9_7j, // 0x2e7
        jup_camo_ob_iw9_7k, // 0x2e8
        jup_camo_ob_iw9_7l, // 0x2e9
        jup_camo_ob_iw9_7m, // 0x2ea
        jup_camo_ob_iw9_7n, // 0x2eb
        jup_camo_ob_iw9_7o, // 0x2ec
        jup_camo_ob_iw9_7p, // 0x2ed
        jup_camo_ob_iw9_7q, // 0x2ee
        jup_camo_ob_iw9_7r, // 0x2ef
        jup_camo_ob_iw9_7s, // 0x2f0
        jup_camo_ob_iw9_7t, // 0x2f1
        jup_camo_ob_iw9_7u, // 0x2f2
        jup_camo_ob_iw9_7v, // 0x2f3
        jup_camo_ob_iw9_7w, // 0x2f4
        jup_camo_ob_iw9_8a, // 0x2f5
        jup_camo_ob_iw9_8b, // 0x2f6
        jup_camo_ob_iw9_8c, // 0x2f7
        jup_camo_ob_iw9_8d, // 0x2f8
        jup_camo_ob_iw9_8e, // 0x2f9
        jup_camo_ob_iw9_8f, // 0x2fa
        jup_camo_ob_iw9_8g, // 0x2fb
        jup_camo_ob_iw9_8h, // 0x2fc
        jup_camo_ob_iw9_8i, // 0x2fd
        jup_camo_ob_iw9_8j, // 0x2fe
        jup_camo_ob_iw9_8k, // 0x2ff
        jup_camo_ob_iw9_8l, // 0x300
        jup_camo_ob_iw9_8m, // 0x301
        jup_camo_ob_iw9_8n, // 0x302
        jup_camo_ob_iw9_8o, // 0x303
        jup_camo_ob_iw9_8p, // 0x304
        jup_camo_ob_iw9_8q, // 0x305
        jup_camo_ob_iw9_8r, // 0x306
        jup_camo_ob_iw9_8s, // 0x307
        jup_camo_ob_iw9_8t, // 0x308
        jup_camo_ob_iw9_8u, // 0x309
        jup_camo_ob_iw9_8v, // 0x30a
        jup_camo_ob_iw9_8w, // 0x30b
        jup_camo_ob_iw9_9a, // 0x30c
        jup_camo_ob_iw9_9b, // 0x30d
        jup_camo_ob_iw9_9c, // 0x30e
        jup_camo_ob_iw9_9d, // 0x30f
        jup_camo_ob_iw9_9e, // 0x310
        jup_camo_ob_iw9_9f, // 0x311
        jup_camo_ob_iw9_9g, // 0x312
        jup_camo_ob_iw9_9h, // 0x313
        jup_camo_ob_iw9_9i, // 0x314
        jup_camo_ob_iw9_9j, // 0x315
        jup_camo_ob_iw9_9k, // 0x316
        jup_camo_ob_iw9_9l, // 0x317
        jup_camo_ob_iw9_9m, // 0x318
        jup_camo_ob_iw9_9n, // 0x319
        jup_camo_ob_iw9_9o, // 0x31a
        jup_camo_ob_iw9_9p, // 0x31b
        jup_camo_ob_iw9_9q, // 0x31c
        jup_camo_ob_iw9_9r, // 0x31d
        jup_camo_ob_iw9_9s, // 0x31e
        jup_camo_ob_iw9_9t, // 0x31f
        jup_camo_ob_iw9_9u, // 0x320
        jup_camo_ob_iw9_9v, // 0x321
        jup_camo_ob_iw9_9w, // 0x322
        jup_camo_ob_iw9_10a, // 0x323
        jup_camo_ob_iw9_10b, // 0x324
        jup_camo_ob_iw9_10c, // 0x325
        jup_camo_ob_iw9_10d, // 0x326
        jup_camo_ob_iw9_10e, // 0x327
        jup_camo_ob_iw9_10f, // 0x328
        jup_camo_ob_iw9_10g, // 0x329
        jup_camo_ob_iw9_10h, // 0x32a
        jup_camo_ob_iw9_10i, // 0x32b
        jup_camo_ob_iw9_10j, // 0x32c
        jup_camo_ob_iw9_10k, // 0x32d
        jup_camo_ob_iw9_10l, // 0x32e
        jup_camo_ob_iw9_10m, // 0x32f
        jup_camo_ob_iw9_10n, // 0x330
        jup_camo_ob_iw9_10o, // 0x331
        jup_camo_ob_iw9_10p, // 0x332
        jup_camo_ob_iw9_10q, // 0x333
        jup_camo_ob_iw9_10r, // 0x334
        jup_camo_ob_iw9_10s, // 0x335
        jup_camo_ob_iw9_10t, // 0x336
        jup_camo_ob_iw9_10u, // 0x337
        jup_camo_ob_iw9_10v, // 0x338
        jup_camo_ob_iw9_10w, // 0x339
        jup_camo_ob_iw9_11a, // 0x33a
        jup_camo_ob_iw9_11b, // 0x33b
        jup_camo_ob_iw9_11c, // 0x33c
        jup_camo_ob_iw9_11d, // 0x33d
        jup_camo_ob_iw9_11e, // 0x33e
        jup_camo_ob_iw9_11f, // 0x33f
        jup_camo_ob_iw9_11g, // 0x340
        jup_camo_ob_iw9_11h, // 0x341
        jup_camo_ob_iw9_11i, // 0x342
        jup_camo_ob_iw9_11j, // 0x343
        jup_camo_ob_iw9_11k, // 0x344
        jup_camo_ob_iw9_11l, // 0x345
        jup_camo_ob_iw9_11m, // 0x346
        jup_camo_ob_iw9_11n, // 0x347
        jup_camo_ob_iw9_11o, // 0x348
        jup_camo_ob_iw9_11p, // 0x349
        jup_camo_ob_iw9_11q, // 0x34a
        jup_camo_ob_iw9_11r, // 0x34b
        jup_camo_ob_iw9_11s, // 0x34c
        jup_camo_ob_iw9_11t, // 0x34d
        jup_camo_ob_iw9_11u, // 0x34e
        jup_camo_ob_iw9_11v, // 0x34f
        jup_camo_ob_iw9_11w, // 0x350
        jup_camo_ob_iw9_12a, // 0x351
        jup_camo_ob_iw9_12b, // 0x352
        jup_camo_ob_iw9_12c, // 0x353
        jup_camo_ob_iw9_12d, // 0x354
        jup_camo_ob_iw9_12e, // 0x355
        jup_camo_ob_iw9_12f, // 0x356
        jup_camo_ob_iw9_12g, // 0x357
        jup_camo_ob_iw9_12h, // 0x358
        jup_camo_ob_iw9_12i, // 0x359
        jup_camo_ob_iw9_12j, // 0x35a
        jup_camo_ob_iw9_12k, // 0x35b
        jup_camo_ob_iw9_12l, // 0x35c
        jup_camo_ob_iw9_12m, // 0x35d
        jup_camo_ob_iw9_12n, // 0x35e
        jup_camo_ob_iw9_12o, // 0x35f
        jup_camo_ob_iw9_12p, // 0x360
        jup_camo_ob_iw9_12q, // 0x361
        jup_camo_ob_iw9_12r, // 0x362
        jup_camo_ob_iw9_12s, // 0x363
        jup_camo_ob_iw9_12t, // 0x364
        jup_camo_ob_iw9_12u, // 0x365
        jup_camo_ob_iw9_12v, // 0x366
        jup_camo_ob_iw9_12w, // 0x367
        jup_camo_ob_iw9_13a, // 0x368
        jup_camo_ob_iw9_13b, // 0x369
        jup_camo_ob_iw9_13c, // 0x36a
        jup_camo_ob_iw9_13d, // 0x36b
        jup_camo_ob_iw9_13e, // 0x36c
        jup_camo_ob_iw9_13f, // 0x36d
        jup_camo_ob_iw9_13g, // 0x36e
        jup_camo_ob_iw9_13h, // 0x36f
        jup_camo_ob_iw9_13i, // 0x370
        jup_camo_ob_iw9_13j, // 0x371
        jup_camo_ob_iw9_13k, // 0x372
        jup_camo_ob_iw9_13l, // 0x373
        jup_camo_ob_iw9_13m, // 0x374
        jup_camo_ob_iw9_13n, // 0x375
        jup_camo_ob_iw9_13o, // 0x376
        jup_camo_ob_iw9_13p, // 0x377
        jup_camo_ob_iw9_13q, // 0x378
        jup_camo_ob_iw9_13r, // 0x379
        jup_camo_ob_iw9_13s, // 0x37a
        jup_camo_ob_iw9_13t, // 0x37b
        jup_camo_ob_iw9_13u, // 0x37c
        jup_camo_ob_iw9_13v, // 0x37d
        jup_camo_ob_iw9_13w, // 0x37e
        jup_camo_ob_iw9_14a, // 0x37f
        jup_camo_ob_iw9_14b, // 0x380
        jup_camo_ob_iw9_14c, // 0x381
        jup_camo_ob_iw9_14d, // 0x382
        jup_camo_ob_iw9_14e, // 0x383
        jup_camo_ob_iw9_14f, // 0x384
        jup_camo_ob_iw9_14g, // 0x385
        jup_camo_ob_iw9_14h, // 0x386
        jup_camo_ob_iw9_14i, // 0x387
        jup_camo_ob_iw9_14j, // 0x388
        jup_camo_ob_iw9_14k, // 0x389
        jup_camo_ob_iw9_14l, // 0x38a
        jup_camo_ob_iw9_14m, // 0x38b
        jup_camo_ob_iw9_14n, // 0x38c
        jup_camo_ob_iw9_14o, // 0x38d
        jup_camo_ob_iw9_14p, // 0x38e
        jup_camo_ob_iw9_14q, // 0x38f
        jup_camo_ob_iw9_14r, // 0x390
        jup_camo_ob_iw9_14s, // 0x391
        jup_camo_ob_iw9_14t, // 0x392
        jup_camo_ob_iw9_14u, // 0x393
        jup_camo_ob_iw9_14v, // 0x394
        jup_camo_ob_iw9_14w, // 0x395
        jup_camo_ob_iw9_15a, // 0x396
        jup_camo_ob_iw9_15b, // 0x397
        jup_camo_ob_iw9_15c, // 0x398
        jup_camo_ob_iw9_15d, // 0x399
        jup_camo_ob_iw9_15e, // 0x39a
        jup_camo_ob_iw9_15f, // 0x39b
        jup_camo_ob_iw9_15g, // 0x39c
        jup_camo_ob_iw9_15h, // 0x39d
        jup_camo_ob_iw9_15i, // 0x39e
        jup_camo_ob_iw9_15j, // 0x39f
        jup_camo_ob_iw9_15k, // 0x3a0
        jup_camo_ob_iw9_15l, // 0x3a1
        jup_camo_ob_iw9_15m, // 0x3a2
        jup_camo_ob_iw9_15n, // 0x3a3
        jup_camo_ob_iw9_15o, // 0x3a4
        jup_camo_ob_iw9_15p, // 0x3a5
        jup_camo_ob_iw9_15q, // 0x3a6
        jup_camo_ob_iw9_15r, // 0x3a7
        jup_camo_ob_iw9_15s, // 0x3a8
        jup_camo_ob_iw9_15t, // 0x3a9
        jup_camo_ob_iw9_15u, // 0x3aa
        jup_camo_ob_iw9_15v, // 0x3ab
        jup_camo_ob_iw9_15w, // 0x3ac
        jup_camo_03a, // 0x3ad
        jup_camo_03b, // 0x3ae
        jup_camo_03c, // 0x3af
        jup_camo_03d, // 0x3b0
        jup_camo_03e, // 0x3b1
        jup_camo_03f, // 0x3b2
        jup_camo_03g, // 0x3b3
        jup_camo_03h, // 0x3b4
        jup_camo_03i, // 0x3b5
        jup_camo_03j, // 0x3b6
        jup_camo_03k, // 0x3b7
        jup_camo_03l, // 0x3b8
        jup_camo_03m, // 0x3b9
        jup_camo_ob_iw9_comp_01, // 0x3ba
        jup_camo_ob_iw9_comp_02, // 0x3bb
        jup_camo_ob_iw9_comp_03, // 0x3bc
        jup_camo_ob_iw9_comp_04, // 0x3bd
        jup_camo_ob_25a, // 0x3be
        jup_camo_ob_25b, // 0x3bf
        jup_camo_ob_25c, // 0x3c0
        jup_camo_ob_25d, // 0x3c1
        jup_camo_ob_25e, // 0x3c2
        jup_camo_ob_25f, // 0x3c3
        jup_camo_ob_25g, // 0x3c4
        jup_camo_ob_25h, // 0x3c5
        jup_camo_ob_22a, // 0x3c6
        jup_camo_ob_22b, // 0x3c7
        jup_camo_ob_22c, // 0x3c8
        jup_camo_ob_22d, // 0x3c9
        jup_camo_ob_22e, // 0x3ca
        jup_camo_ob_22f, // 0x3cb
        jup_camo_ob_20a, // 0x3cc
        jup_camo_ob_20b, // 0x3cd
        jup_camo_ob_20c, // 0x3ce
        jup_camo_ob_20d, // 0x3cf
        jup_camo_ob_20e, // 0x3d0
        jup_camo_ob_20f, // 0x3d1
        jup_camo_ob_20g, // 0x3d2
        jup_camo_ob_20h, // 0x3d3
        jup_camo_ob_20i, // 0x3d4
        jup_camo_ob_20j, // 0x3d5
        jup_camo_ob_19a, // 0x3d6
        jup_camo_ob_19b, // 0x3d7
        jup_camo_ob_19c, // 0x3d8
        jup_camo_ob_19d, // 0x3d9
        jup_camo_ob_19e, // 0x3da
        jup_camo_ob_19f, // 0x3db
        jup_camo_ob_19g, // 0x3dc
        jup_camo_ob_19h, // 0x3dd
        jup_camo_ob_19i, // 0x3de
        jup_camo_ob_19j, // 0x3df
        jup_camo_ob_19k, // 0x3e0
        jup_camo_ob_19l, // 0x3e1
        jup_camo_ob_19m, // 0x3e2
        jup_camo_ob_18a, // 0x3e3
        jup_camo_ob_18b, // 0x3e4
        jup_camo_ob_18c, // 0x3e5
        jup_camo_ob_18d, // 0x3e6
        jup_camo_ob_18e, // 0x3e7
        jup_camo_ob_18f, // 0x3e8
        jup_camo_ob_18g, // 0x3e9
        jup_camo_ob_18h, // 0x3ea
        jup_camo_ob_18i, // 0x3eb
        jup_camo_ob_18j, // 0x3ec
        jup_camo_ob_18k, // 0x3ed
        jup_camo_ob_18l, // 0x3ee
        jup_camo_ob_17a, // 0x3ef
        jup_camo_ob_17b, // 0x3f0
        jup_camo_ob_17c, // 0x3f1
        jup_camo_ob_17d, // 0x3f2
        jup_camo_ob_17e, // 0x3f3
        jup_camo_ob_17f, // 0x3f4
        jup_camo_ob_16a, // 0x3f5
        jup_camo_ob_16b, // 0x3f6
        jup_camo_ob_16c, // 0x3f7
        jup_camo_ob_16d, // 0x3f8
        jup_camo_ob_16e, // 0x3f9
        jup_camo_ob_16f, // 0x3fa
        jup_camo_ob_16g, // 0x3fb
        jup_camo_ob_16h, // 0x3fc
        jup_camo_ob_16i, // 0x3fd
        jup_camo_ob_16j, // 0x3fe
        jup_camo_ob_16k, // 0x3ff
        jup_camo_ob_16l, // 0x400
        jup_camo_ob_16m, // 0x401
        jup_camo_ob_14a, // 0x402
        jup_camo_ob_14b, // 0x403
        jup_camo_ob_14c, // 0x404
        jup_camo_ob_14d, // 0x405
        jup_camo_ob_14e, // 0x406
        jup_camo_ob_14f, // 0x407
        jup_camo_ob_14g, // 0x408
        jup_camo_ob_14h, // 0x409
        jup_camo_ob_14i, // 0x40a
        jup_camo_ob_14j, // 0x40b
        jup_camo_ob_14k, // 0x40c
        jup_camo_ob_14l, // 0x40d
        jup_camo_ob_14m, // 0x40e
        jup_camo_ob_09a, // 0x40f
        jup_camo_ob_09b, // 0x410
        jup_camo_ob_09c, // 0x411
        jup_camo_ob_09d, // 0x412
        jup_camo_ob_09e, // 0x413
        jup_camo_ob_09f, // 0x414
        jup_camo_ob_09g, // 0x415
        jup_camo_ob_09h, // 0x416
        jup_camo_ob_06a, // 0x417
        jup_camo_ob_06b, // 0x418
        jup_camo_ob_06c, // 0x419
        jup_camo_ob_06d, // 0x41a
        jup_camo_ob_06e, // 0x41b
        jup_camo_ob_06f, // 0x41c
        jup_camo_ob_06g, // 0x41d
        jup_camo_ob_06h, // 0x41e
        jup_camo_ob_06i, // 0x41f
        jup_camo_ob_06j, // 0x420
        jup_camo_ob_04a, // 0x421
        jup_camo_ob_04b, // 0x422
        jup_camo_ob_04c, // 0x423
        jup_camo_ob_04d, // 0x424
        jup_camo_ob_04e, // 0x425
        jup_camo_ob_04f, // 0x426
        jup_camo_ob_04g, // 0x427
        jup_camo_ob_04h, // 0x428
        jup_camo_ob_04i, // 0x429
        jup_camo_ob_04j, // 0x42a
        jup_camo_ob_04k, // 0x42b
        jup_camo_ob_04l, // 0x42c
        jup_camo_ob_02a, // 0x42d
        jup_camo_ob_02b, // 0x42e
        jup_camo_ob_02c, // 0x42f
        jup_camo_ob_02d, // 0x430
        jup_camo_ob_02e, // 0x431
        jup_camo_ob_02f, // 0x432
        jup_camo_ob_03a, // 0x433
        jup_camo_ob_03b, // 0x434
        jup_camo_ob_03c, // 0x435
        jup_camo_ob_03d, // 0x436
        jup_camo_ob_03e, // 0x437
        jup_camo_ob_03f, // 0x438
        jup_camo_ob_03g, // 0x439
        jup_camo_ob_03h, // 0x43a
        jup_camo_ob_03i, // 0x43b
        jup_camo_ob_03j, // 0x43c
        jup_camo_ob_03k, // 0x43d
        jup_camo_ob_03l, // 0x43e
        jup_camo_ob_03m, // 0x43f
        jup_camo_ob_03n, // 0x440
        jup_camo_ob_03o, // 0x441
        jup_camo_ob_05a, // 0x442
        jup_camo_ob_05b, // 0x443
        jup_camo_ob_05c, // 0x444
        jup_camo_ob_05d, // 0x445
        jup_camo_ob_05e, // 0x446
        jup_camo_ob_05f, // 0x447
        jup_camo_ob_05g, // 0x448
        jup_camo_ob_07a, // 0x449
        jup_camo_ob_07b, // 0x44a
        jup_camo_ob_07c, // 0x44b
        jup_camo_ob_07d, // 0x44c
        jup_camo_ob_07e, // 0x44d
        jup_camo_ob_07f, // 0x44e
        jup_camo_ob_07g, // 0x44f
        jup_camo_ob_07h, // 0x450
        jup_camo_ob_07i, // 0x451
        jup_camo_ob_07j, // 0x452
        jup_camo_ob_08a, // 0x453
        jup_camo_ob_08b, // 0x454
        jup_camo_ob_08c, // 0x455
        jup_camo_ob_08d, // 0x456
        jup_camo_ob_08e, // 0x457
        jup_camo_ob_08f, // 0x458
        jup_camo_ob_08g, // 0x459
        jup_camo_ob_08h, // 0x45a
        jup_camo_ob_10a, // 0x45b
        jup_camo_ob_10b, // 0x45c
        jup_camo_ob_10c, // 0x45d
        jup_camo_ob_10d, // 0x45e
        jup_camo_ob_10e, // 0x45f
        jup_camo_ob_10f, // 0x460
        jup_camo_ob_10g, // 0x461
        jup_camo_ob_10h, // 0x462
        jup_camo_ob_10i, // 0x463
        jup_camo_ob_10j, // 0x464
        jup_camo_ob_10k, // 0x465
        jup_camo_ob_10l, // 0x466
        jup_camo_ob_11a, // 0x467
        jup_camo_ob_11b, // 0x468
        jup_camo_ob_11c, // 0x469
        jup_camo_ob_11d, // 0x46a
        jup_camo_ob_11e, // 0x46b
        jup_camo_ob_11f, // 0x46c
        jup_camo_ob_11g, // 0x46d
        jup_camo_ob_11h, // 0x46e
        jup_camo_ob_11i, // 0x46f
        jup_camo_ob_11j, // 0x470
        jup_camo_ob_11k, // 0x471
        jup_camo_ob_11l, // 0x472
        jup_camo_ob_12a, // 0x473
        jup_camo_ob_12b, // 0x474
        jup_camo_ob_12c, // 0x475
        jup_camo_ob_12d, // 0x476
        jup_camo_ob_12e, // 0x477
        jup_camo_ob_12f, // 0x478
        jup_camo_ob_12g, // 0x479
        jup_camo_ob_12h, // 0x47a
        jup_camo_ob_12i, // 0x47b
        jup_camo_ob_13a, // 0x47c
        jup_camo_ob_13b, // 0x47d
        jup_camo_ob_13c, // 0x47e
        jup_camo_ob_13d, // 0x47f
        jup_camo_ob_13e, // 0x480
        jup_camo_ob_13f, // 0x481
        jup_camo_ob_13g, // 0x482
        jup_camo_ob_13h, // 0x483
        jup_camo_ob_13i, // 0x484
        jup_camo_ob_13j, // 0x485
        jup_camo_ob_13k, // 0x486
        jup_camo_ob_13l, // 0x487
        jup_camo_ob_15a, // 0x488
        jup_camo_ob_15b, // 0x489
        jup_camo_ob_15c, // 0x48a
        jup_camo_ob_15d, // 0x48b
        jup_camo_ob_15e, // 0x48c
        jup_camo_ob_15f, // 0x48d
        jup_camo_ob_15g, // 0x48e
        jup_camo_ob_15h, // 0x48f
        jup_camo_ob_15i, // 0x490
        jup_camo_ob_15j, // 0x491
        jup_camo_ob_15k, // 0x492
        jup_camo_ob_15l, // 0x493
        jup_camo_ob_21a, // 0x494
        jup_camo_ob_21b, // 0x495
        jup_camo_ob_21c, // 0x496
        jup_camo_ob_21d, // 0x497
        jup_camo_ob_21e, // 0x498
        jup_camo_ob_21f, // 0x499
        jup_camo_ob_21g, // 0x49a
        jup_camo_ob_21h, // 0x49b
        jup_camo_ob_24a, // 0x49c
        jup_camo_ob_24b, // 0x49d
        jup_camo_ob_24c, // 0x49e
        jup_camo_ob_24d, // 0x49f
        jup_camo_ob_24e, // 0x4a0
        jup_camo_ob_24f, // 0x4a1
        jup_camo_ob_24g, // 0x4a2
        jup_camo_ob_24h, // 0x4a3
        jup_camo_rankeda, // 0x4a4
        jup_camo_rankedb, // 0x4a5
        jup_camo_rankedc, // 0x4a6
        jup_camo_rankedd, // 0x4a7
        jup_camo_rankede, // 0x4a8
        jup_camo_rankedf, // 0x4a9
        jup_camo_rankedg, // 0x4aa
        jup_camo_rankedh, // 0x4ab
        jup_camo_rankedi, // 0x4ac
        jup_camo_rankedj, // 0x4ad
        jup_camo_rankedk, // 0x4ae
        jup_camo_rankedl, // 0x4af
        jup_camo_specialb, // 0x4b0
        jup_camo_specialc, // 0x4b1
        jup_camo_speciald, // 0x4b2
        jup_camo_speciale, // 0x4b3
        jup_camo_specialf, // 0x4b4
        jup_camo_ob_comp_01, // 0x4b5
        jup_camo_ob_comp_02, // 0x4b6
        jup_camo_ob_comp_03, // 0x4b7
        jup_camo_ob_comp_04, // 0x4b8
        jup_camo_eventsg, // 0x4b9
        jup_camo_eventsh, // 0x4ba
        jup_camo_eventsi, // 0x4bb
        jup_camo_eventsj, // 0x4bc
        jup_camo_eventsk, // 0x4bd
        jup_camo_eventsl, // 0x4be
        jup_camo_eventsm, // 0x4bf
        jup_camo_eventsn, // 0x4c0
        jup_camo_eventso, // 0x4c1
        jup_camo_eventsp, // 0x4c2
        jup_camo_specialg, // 0x4c3
        jup_camo_eventq, // 0x4c4
        jup_camo_eventsr, // 0x4c5
        jup_camo_eventss, // 0x4c6
        jup_camo_eventst, // 0x4c7
        jup_camo_eventsu, // 0x4c8
        jup_camo_eventsv, // 0x4c9
        jup_camo_eventsw, // 0x4ca
        jup_camo_eventsx, // 0x4cb
        jup_camo_eventsy, // 0x4cc
        jup_camo_eventsz, // 0x4cd
        jup_camo_23f, // 0x4ce
        jup_camo_ob_23a, // 0x4cf
        jup_camo_ob_23d, // 0x4d0
        jup_camo_ob_23f, // 0x4d1
        jup_camo_ob_22g, // 0x4d2
        jup_camo_ob_22h, // 0x4d3
        jup_camo_iw9_v_14, // 0x4d4
        jup_camo_iw9_v_15, // 0x4d5
        jup_camo_iw9_w_01, // 0x4d6
        jup_camo_iw9_v_13, // 0x4d7
        jup_camo_iw9_v_09, // 0x4d8
        jup_camo_iw9_v_10, // 0x4d9
        jup_camo_iw9_v_11, // 0x4da
        jup_camo_iw9_v_12, // 0x4db
        jup_camo_specialh, // 0x4dc
        jup_camo_speciali, // 0x4dd
        jup_camo_eventsaa, // 0x4de
        jup_camo_eventsab, // 0x4df
        jup_camo_eventsac, // 0x4e0
        jup_camo_eventsad, // 0x4e1
        jup_camo_eventsae, // 0x4e2
        jup_camo_eventsaf, // 0x4e3
        jup_camo_eventsag, // 0x4e4
        jup_camo_11m, // 0x4e5
        jup_camo_11n, // 0x4e6
        jup_camo_09i, // 0x4e7
        jup_camo_24j, // 0x4e8
        jup_camo_17g, // 0x4e9
        jup_camo_23g, // 0x4ea
        jup_camo_13m, // 0x4eb
        jup_camo_24i, // 0x4ec
        jup_camo_rankedm, // 0x4ed
        jup_camo_specialj, // 0x4ee
        jup_camo_specialk, // 0x4ef
        jup_camo_speciall, // 0x4f0
        jup_camo_specialm, // 0x4f1
        jup_camo_specialn, // 0x4f2
        jup_camo_specialo, // 0x4f3
        jup_camo_specialp, // 0x4f4
        jup_camo_specialq, // 0x4f5
        jup_camo_rankedn, // 0x4f6
        jup_camo_rankedo, // 0x4f7
        jup_camo_rankedp, // 0x4f8
        jup_camo_rankedq, // 0x4f9
        jup_camo_rankedr, // 0x4fa
        jup_camo_rankeds, // 0x4fb
        jup_camo_rankedt, // 0x4fc
        jup_camo_rankedu, // 0x4fd
        jup_camo_specialr, // 0x4fe
        jup_camo_specials, // 0x4ff
        jup_camo_specialt, // 0x500
        jup_camo_specialu, // 0x501
        jup_camo_specialv, // 0x502
        jup_camo_ob_18m, // 0x503
        jup_camo_ob_13m, // 0x504
        jup_camo_ob_14n, // 0x505
        jup_camo_ob_11m, // 0x506
        jup_camo_ob_11n, // 0x507
        jup_camo_ob_09i, // 0x508
        jup_camo_ob_09j, // 0x509
        jup_camo_ob_24i, // 0x50a
        jup_camo_ob_23g, // 0x50b
        jup_camo_ob_25i, // 0x50c
        jup_camo_specialw, // 0x50d
        jup_camo_specialx, // 0x50e
        jup_camo_specialy, // 0x50f
        jup_camo_specialz, // 0x510
        jup_camo_special_01a, // 0x511
        jup_camo_b2068, // 0x512
        jup_camo_24h, // 0x513
        jup_camo_26a, // 0x514
        jup_camo_26b, // 0x515
        jup_camo_03p, // 0x516
        jup_camo_ob_17g, // 0x517
        jup_camo_ob_23e, // 0x518
        jup_camo_ob_26a, // 0x519
        jup_camo_ob_26b, // 0x51a
        jup_camo_ob_03p, // 0x51b
        jup_camo_26c, // 0x51c
        jup_camo_26d, // 0x51d
        jup_camo_26e, // 0x51e
        jup_camo_n2919_2, // 0x51f
        jup_camo_b2068_5, // 0x520
        jup_camo_n2940_1, // 0x521
        jup_camo_n3930_4, // 0x522
        jup_camo_n3929_5, // 0x523
        jup_camo_n3925_1, // 0x524
        jup_camo_n3918_7, // 0x525
        jup_camo_n3920_8, // 0x526
        jup_camo_b3001_9, // 0x527
        jup_camo_n3914_24, // 0x528
        jup_camo_n3914_23, // 0x529
        jup_camo_n3914_22, // 0x52a
        jup_camo_n3914_21, // 0x52b
        jup_camo_n3914_20, // 0x52c
        jup_camo_n3914_19, // 0x52d
        jup_camo_n3914_4, // 0x52e
        jup_camo_n3908_12, // 0x52f
        jup_camo_n3908_13, // 0x530
        jup_camo_n3908_11, // 0x531
        jup_camo_n3908_10, // 0x532
        jup_camo_n3907_25, // 0x533
        jup_camo_n3907_26, // 0x534
        jup_camo_n3907_24, // 0x535
        jup_camo_n3907_23, // 0x536
        jup_camo_n3907_13, // 0x537
        jup_camo_n3907_12, // 0x538
        jup_camo_n3907_11, // 0x539
        jup_camo_n3907_10, // 0x53a
        jup_camo_n3906_2, // 0x53b
        jup_camo_n3917_6, // 0x53c
        jup_camo_n3909_10, // 0x53d
        jup_camo_n3909_11, // 0x53e
        jup_camo_n3909_12, // 0x53f
        jup_camo_n3909_13, // 0x540
        jup_camo_n3909_23, // 0x541
        jup_camo_n3910_10, // 0x542
        jup_camo_n3910_11, // 0x543
        jup_camo_n3910_12, // 0x544
        jup_camo_n3910_13, // 0x545
        jup_camo_n3921_8, // 0x546
        jup_camo_n3913_4, // 0x547
        jup_camo_n3907_36, // 0x548
        jup_camo_n3909_36, // 0x549
        jup_camo_n3909_39, // 0x54a
        jup_camo_n3909_38, // 0x54b
        jup_camo_n3909_37, // 0x54c
        jup_camo_n3936_1, // 0x54d
        jup_camo_n4933_27, // 0x54e
        jup_camo_n4933_26, // 0x54f
        jup_camo_n4933_25, // 0x550
        jup_camo_n4931_20, // 0x551
        jup_camo_n4931_19, // 0x552
        jup_camo_n4931_18, // 0x553
        jup_camo_n4931_17, // 0x554
        jup_camo_n4931_16, // 0x555
        jup_camo_n4931_15, // 0x556
        jup_camo_n4931_14, // 0x557
        jup_camo_n4931_13, // 0x558
        jup_camo_n4931_12, // 0x559
        jup_camo_n4931_11, // 0x55a
        jup_camo_n4931_10, // 0x55b
        jup_camo_n4931_8, // 0x55c
        jup_camo_n4931_7, // 0x55d
        jup_camo_n4931_6, // 0x55e
        jup_camo_n4931_5, // 0x55f
        jup_camo_n4931_4, // 0x560
        jup_camo_n4931_3, // 0x561
        jup_camo_n4931_2, // 0x562
        jup_camo_n4931_1, // 0x563
        jup_camo_n4927_10, // 0x564
        jup_camo_n4927_9, // 0x565
        jup_camo_n4927_8, // 0x566
        jup_camo_n4927_7, // 0x567
        jup_camo_n4927_6, // 0x568
        jup_camo_n4927_5, // 0x569
        jup_camo_n4927_4, // 0x56a
        jup_camo_n4927_3, // 0x56b
        jup_camo_n4927_2, // 0x56c
        jup_camo_n4927_1, // 0x56d
        jup_camo_n4925_1, // 0x56e
        jup_camo_n4923_6, // 0x56f
        jup_camo_n4920_6, // 0x570
        jup_camo_n4905_2, // 0x571
        jup_camo_n4931_9, // 0x572
        jup_camo_n3924_1, // 0x573
        jup_camo_n3938_1, // 0x574
        jup_camo_prest_01, // 0x575
        jup_camo_n3939_1, // 0x576
        jup_camo_n4909_26, // 0x577
        jup_camo_n4909_25, // 0x578
        jup_camo_n4909_24, // 0x579
        jup_camo_n4909_23, // 0x57a
        jup_camo_n4909_13, // 0x57b
        jup_camo_n4909_12, // 0x57c
        jup_camo_n4909_11, // 0x57d
        jup_camo_n4909_10, // 0x57e
        jup_camo_n4907_26, // 0x57f
        jup_camo_n4907_25, // 0x580
        jup_camo_n4907_24, // 0x581
        jup_camo_n4907_23, // 0x582
        jup_camo_n4907_13, // 0x583
        jup_camo_n4907_12, // 0x584
        jup_camo_n4907_11, // 0x585
        jup_camo_n4907_10, // 0x586
        jup_camo_n4918_10, // 0x587
        jup_camo_n4917_4, // 0x588
        jup_camo_n4914_4, // 0x589
        jup_camo_n4934_1, // 0x58a
        jup_camo_n4910_23, // 0x58b
        jup_camo_n4910_13, // 0x58c
        jup_camo_n4910_12, // 0x58d
        jup_camo_n4910_11, // 0x58e
        jup_camo_n4910_10, // 0x58f
        jup_camo_n4908_23, // 0x590
        jup_camo_n4908_13, // 0x591
        jup_camo_n4908_12, // 0x592
        jup_camo_n4908_11, // 0x593
        jup_camo_n4908_10, // 0x594
        jup_camo_prest_02, // 0x595
        jup_camo_n4924_1, // 0x596
        jup_camo_n4922_2, // 0x597
        jup_camo_n4935_1, // 0x598
        jup_camo_n4943_1, // 0x599
        jup_camo_n4942_1, // 0x59a
        jup_camo_prest_03, // 0x59b
        jup_camo_prest_04, // 0x59c
        jup_camo_n5907_26, // 0x59d
        jup_camo_n5907_25, // 0x59e
        jup_camo_n5907_24, // 0x59f
        jup_camo_n5907_23, // 0x5a0
        jup_camo_n5907_13, // 0x5a1
        jup_camo_n5907_12, // 0x5a2
        jup_camo_n5907_11, // 0x5a3
        jup_camo_n5907_10, // 0x5a4
        jup_camo_n5909_26, // 0x5a5
        jup_camo_n5909_25, // 0x5a6
        jup_camo_n5909_24, // 0x5a7
        jup_camo_n5909_23, // 0x5a8
        jup_camo_n5909_13, // 0x5a9
        jup_camo_n5909_12, // 0x5aa
        jup_camo_n5909_11, // 0x5ab
        jup_camo_n5909_10, // 0x5ac
        jup_camo_n5914_24, // 0x5ad
        jup_camo_n5914_23, // 0x5ae
        jup_camo_n5914_22, // 0x5af
        jup_camo_n5914_21, // 0x5b0
        jup_camo_n5914_20, // 0x5b1
        jup_camo_n5914_19, // 0x5b2
        jup_camo_n5914_4, // 0x5b3
        jup_camo_n5915_4, // 0x5b4
        jup_camo_n5930_10, // 0x5b5
        jup_camo_n5928_1, // 0x5b6
        jup_camo_n5926_1, // 0x5b7
        jup_camo_n5924_1, // 0x5b8
        jup_camo_n5922_1, // 0x5b9
        jup_camo_n5918_1, // 0x5ba
        jup_camo_n5930_13, // 0x5bb
        jup_camo_n5930_12, // 0x5bc
        jup_camo_n5930_11, // 0x5bd
        jup_camo_n5923_1, // 0x5be
        jup_camo_n5927_2, // 0x5bf
        jup_camo_n4945_2, // 0x5c0
        jup_camo_n4945_3, // 0x5c1
        jup_camo_n4945_4, // 0x5c2
        jup_camo_n6912_1, // 0x5c3
        jup_camo_n5920_7, // 0x5c4
        jup_camo_n5919_1, // 0x5c5
        jup_camo_n5931_1, // 0x5c6
        jup_camo_n5908_20, // 0x5c7
        jup_camo_n5908_10, // 0x5c8
        jup_camo_ob_n5910_20, // 0x5c9
        jup_camo_ob_n5910_10, // 0x5ca
        jup_camo_n5920_9, // 0x5cb
        jup_camo_n5920_10, // 0x5cc
        jup_camo_n5920_14, // 0x5cd
        jup_camo_n5920_15, // 0x5ce
        jup_camo_ob_n6908_13, // 0x5cf
        jup_camo_ob_n6908_12, // 0x5d0
        jup_camo_n6918_1, // 0x5d1
        jup_camo_n6918_2, // 0x5d2
        jup_camo_n6918_6, // 0x5d3
        jup_camo_n6920_1, // 0x5d4
        jup_camo_n6907_26, // 0x5d5
        jup_camo_n6907_25, // 0x5d6
        jup_camo_n6907_24, // 0x5d7
        jup_camo_n6907_23, // 0x5d8
        jup_camo_n6907_13, // 0x5d9
        jup_camo_n6907_12, // 0x5da
        jup_camo_n6907_11, // 0x5db
        jup_camo_n6907_10, // 0x5dc
        jup_camo_n6908_26, // 0x5dd
        jup_camo_n6908_25, // 0x5de
        jup_camo_n6908_24, // 0x5df
        jup_camo_n6908_23, // 0x5e0
        jup_camo_n6908_11, // 0x5e1
        jup_camo_n6908_10, // 0x5e2
        jup_camo_n6910_10, // 0x5e3
        jup_camo_n6911_24, // 0x5e4
        jup_camo_n6911_23, // 0x5e5
        jup_camo_n6911_22, // 0x5e6
        jup_camo_n6911_21, // 0x5e7
        jup_camo_n6911_20, // 0x5e8
        jup_camo_n6911_19, // 0x5e9
        jup_camo_n6911_4, // 0x5ea
        jup_camo_n6914_7, // 0x5eb
        jup_camo_n6915_1, // 0x5ec
        jup_camo_n6916_7, // 0x5ed
        jup_camo_n6917_1, // 0x5ee
        jup_camo_n6916_13, // 0x5ef
        jup_camo_n6916_12, // 0x5f0
        jup_camo_n6916_10, // 0x5f1
        jup_camo_n6916_9, // 0x5f2
        jup_camo_n6916_8, // 0x5f3
        jup_camo_n6922_1, // 0x5f4
        jup_camo_n6922_2, // 0x5f5
        jup_camo_n6922_3, // 0x5f6
        jup_camo_n6922_4, // 0x5f7
        jup_camo_n6905_1, // 0x5f8
        cer_camo_base_01, // 0x5f9
        cer_camo_base_02, // 0x5fa
        cer_camo_base_03, // 0x5fb
        cer_camo_base_04, // 0x5fc
        cer_camo_base_05, // 0x5fd
        cer_camo_base_06, // 0x5fe
        cer_camo_base_07, // 0x5ff
        cer_camo_base_08, // 0x600
        cer_camo_base_09, // 0x601
        cer_camo_comp_01, // 0x602
        cer_camo_comp_02, // 0x603
        cer_camo_comp_03, // 0x604
        cer_camo_comp_04, // 0x605
        cer_camo_alfa_01, // 0x606
        cer_camo_alfa_01_wz, // 0x607
        cer_camo_alfa_01_zm, // 0x608
        cer_camo_alfa_02, // 0x609
        cer_camo_alfa_02_wz, // 0x60a
        cer_camo_alfa_02_zm, // 0x60b
        cer_camo_alfa_03, // 0x60c
        cer_camo_alfa_03_wz, // 0x60d
        cer_camo_alfa_03_zm, // 0x60e
        cer_camo_alfa_04, // 0x60f
        cer_camo_alfa_04_wz, // 0x610
        cer_camo_alfa_04_zm, // 0x611
        cer_camo_alfa_05, // 0x612
        cer_camo_alfa_05_wz, // 0x613
        cer_camo_alfa_05_zm, // 0x614
        cer_camo_alfa_06, // 0x615
        cer_camo_alfa_06_wz, // 0x616
        cer_camo_alfa_06_zm, // 0x617
        cer_camo_alfa_07, // 0x618
        cer_camo_alfa_07_wz, // 0x619
        cer_camo_alfa_07_zm, // 0x61a
        cer_camo_alfa_08, // 0x61b
        cer_camo_alfa_08_wz, // 0x61c
        cer_camo_alfa_08_zm, // 0x61d
        cer_camo_bravo_01, // 0x61e
        cer_camo_bravo_01_wz, // 0x61f
        cer_camo_bravo_01_zm, // 0x620
        cer_camo_bravo_02, // 0x621
        cer_camo_bravo_02_wz, // 0x622
        cer_camo_bravo_02_zm, // 0x623
        cer_camo_bravo_03, // 0x624
        cer_camo_bravo_03_wz, // 0x625
        cer_camo_bravo_03_zm, // 0x626
        cer_camo_bravo_04, // 0x627
        cer_camo_bravo_04_wz, // 0x628
        cer_camo_bravo_04_zm, // 0x629
        cer_camo_bravo_05, // 0x62a
        cer_camo_bravo_05_wz, // 0x62b
        cer_camo_bravo_05_zm, // 0x62c
        cer_camo_bravo_06, // 0x62d
        cer_camo_bravo_06_wz, // 0x62e
        cer_camo_bravo_06_zm, // 0x62f
        cer_camo_bravo_07, // 0x630
        cer_camo_bravo_07_wz, // 0x631
        cer_camo_bravo_07_zm, // 0x632
        cer_camo_bravo_08, // 0x633
        cer_camo_bravo_08_wz, // 0x634
        cer_camo_bravo_08_zm, // 0x635
        cer_camo_charlie_01, // 0x636
        cer_camo_charlie_01_wz, // 0x637
        cer_camo_charlie_01_zm, // 0x638
        cer_camo_charlie_02, // 0x639
        cer_camo_charlie_02_wz, // 0x63a
        cer_camo_charlie_02_zm, // 0x63b
        cer_camo_charlie_03, // 0x63c
        cer_camo_charlie_03_wz, // 0x63d
        cer_camo_charlie_03_zm, // 0x63e
        cer_camo_charlie_04, // 0x63f
        cer_camo_charlie_04_wz, // 0x640
        cer_camo_charlie_04_zm, // 0x641
        cer_camo_charlie_05, // 0x642
        cer_camo_charlie_05_wz, // 0x643
        cer_camo_charlie_05_zm, // 0x644
        cer_camo_charlie_06, // 0x645
        cer_camo_charlie_06_wz, // 0x646
        cer_camo_charlie_06_zm, // 0x647
        cer_camo_charlie_07, // 0x648
        cer_camo_charlie_07_wz, // 0x649
        cer_camo_charlie_07_zm, // 0x64a
        cer_camo_charlie_08, // 0x64b
        cer_camo_charlie_08_wz, // 0x64c
        cer_camo_charlie_08_zm, // 0x64d
        cer_camo_delta_01, // 0x64e
        cer_camo_delta_01_wz, // 0x64f
        cer_camo_delta_01_zm, // 0x650
        cer_camo_delta_02, // 0x651
        cer_camo_delta_02_wz, // 0x652
        cer_camo_delta_02_zm, // 0x653
        cer_camo_delta_03, // 0x654
        cer_camo_delta_03_wz, // 0x655
        cer_camo_delta_03_zm, // 0x656
        cer_camo_delta_04, // 0x657
        cer_camo_delta_04_wz, // 0x658
        cer_camo_delta_04_zm, // 0x659
        cer_camo_delta_05, // 0x65a
        cer_camo_delta_05_wz, // 0x65b
        cer_camo_delta_05_zm, // 0x65c
        cer_camo_delta_06, // 0x65d
        cer_camo_delta_06_wz, // 0x65e
        cer_camo_delta_06_zm, // 0x65f
        cer_camo_delta_07, // 0x660
        cer_camo_delta_07_wz, // 0x661
        cer_camo_delta_07_zm, // 0x662
        cer_camo_delta_08, // 0x663
        cer_camo_delta_08_wz, // 0x664
        cer_camo_delta_08_zm, // 0x665
        cer_camo_echo_01, // 0x666
        cer_camo_echo_01_wz, // 0x667
        cer_camo_echo_01_zm, // 0x668
        cer_camo_echo_02, // 0x669
        cer_camo_echo_02_wz, // 0x66a
        cer_camo_echo_02_zm, // 0x66b
        cer_camo_echo_03, // 0x66c
        cer_camo_echo_03_wz, // 0x66d
        cer_camo_echo_03_zm, // 0x66e
        cer_camo_echo_04, // 0x66f
        cer_camo_echo_04_wz, // 0x670
        cer_camo_echo_04_zm, // 0x671
        cer_camo_echo_05, // 0x672
        cer_camo_echo_05_wz, // 0x673
        cer_camo_echo_05_zm, // 0x674
        cer_camo_echo_06, // 0x675
        cer_camo_echo_06_wz, // 0x676
        cer_camo_echo_06_zm, // 0x677
        cer_camo_echo_07, // 0x678
        cer_camo_echo_07_wz, // 0x679
        cer_camo_echo_07_zm, // 0x67a
        cer_camo_echo_08, // 0x67b
        cer_camo_echo_08_wz, // 0x67c
        cer_camo_echo_08_zm, // 0x67d
        cer_camo_foxtrot_01, // 0x67e
        cer_camo_foxtrot_01_wz, // 0x67f
        cer_camo_foxtrot_01_zm, // 0x680
        cer_camo_foxtrot_02, // 0x681
        cer_camo_foxtrot_02_wz, // 0x682
        cer_camo_foxtrot_02_zm, // 0x683
        cer_camo_foxtrot_03, // 0x684
        cer_camo_foxtrot_03_wz, // 0x685
        cer_camo_foxtrot_03_zm, // 0x686
        cer_camo_foxtrot_04, // 0x687
        cer_camo_foxtrot_04_wz, // 0x688
        cer_camo_foxtrot_04_zm, // 0x689
        cer_camo_foxtrot_05, // 0x68a
        cer_camo_foxtrot_05_wz, // 0x68b
        cer_camo_foxtrot_05_zm, // 0x68c
        cer_camo_foxtrot_06, // 0x68d
        cer_camo_foxtrot_06_wz, // 0x68e
        cer_camo_foxtrot_06_zm, // 0x68f
        cer_camo_foxtrot_07, // 0x690
        cer_camo_foxtrot_07_wz, // 0x691
        cer_camo_foxtrot_07_zm, // 0x692
        cer_camo_foxtrot_08, // 0x693
        cer_camo_foxtrot_08_wz, // 0x694
        cer_camo_foxtrot_08_zm, // 0x695
        cer_camo_golf_01, // 0x696
        cer_camo_golf_01_wz, // 0x697
        cer_camo_golf_01_zm, // 0x698
        cer_camo_golf_02, // 0x699
        cer_camo_golf_02_wz, // 0x69a
        cer_camo_golf_02_zm, // 0x69b
        cer_camo_golf_03, // 0x69c
        cer_camo_golf_03_wz, // 0x69d
        cer_camo_golf_03_zm, // 0x69e
        cer_camo_golf_04, // 0x69f
        cer_camo_golf_04_wz, // 0x6a0
        cer_camo_golf_04_zm, // 0x6a1
        cer_camo_golf_05, // 0x6a2
        cer_camo_golf_05_wz, // 0x6a3
        cer_camo_golf_05_zm, // 0x6a4
        cer_camo_golf_06, // 0x6a5
        cer_camo_golf_06_wz, // 0x6a6
        cer_camo_golf_06_zm, // 0x6a7
        cer_camo_golf_07, // 0x6a8
        cer_camo_golf_07_wz, // 0x6a9
        cer_camo_golf_07_zm, // 0x6aa
        cer_camo_golf_08, // 0x6ab
        cer_camo_golf_08_wz, // 0x6ac
        cer_camo_golf_08_zm, // 0x6ad
        cer_camo_hotel_01, // 0x6ae
        cer_camo_hotel_01_wz, // 0x6af
        cer_camo_hotel_01_zm, // 0x6b0
        cer_camo_hotel_02, // 0x6b1
        cer_camo_hotel_02_wz, // 0x6b2
        cer_camo_hotel_02_zm, // 0x6b3
        cer_camo_hotel_03, // 0x6b4
        cer_camo_hotel_03_wz, // 0x6b5
        cer_camo_hotel_03_zm, // 0x6b6
        cer_camo_hotel_04, // 0x6b7
        cer_camo_hotel_04_wz, // 0x6b8
        cer_camo_hotel_04_zm, // 0x6b9
        cer_camo_hotel_05, // 0x6ba
        cer_camo_hotel_05_wz, // 0x6bb
        cer_camo_hotel_05_zm, // 0x6bc
        cer_camo_hotel_06, // 0x6bd
        cer_camo_hotel_06_wz, // 0x6be
        cer_camo_hotel_06_zm, // 0x6bf
        cer_camo_hotel_07, // 0x6c0
        cer_camo_hotel_07_wz, // 0x6c1
        cer_camo_hotel_07_zm, // 0x6c2
        cer_camo_hotel_08, // 0x6c3
        cer_camo_hotel_08_wz, // 0x6c4
        cer_camo_hotel_08_zm, // 0x6c5
        cer_camo_india_01, // 0x6c6
        cer_camo_india_01_wz, // 0x6c7
        cer_camo_india_01_zm, // 0x6c8
        cer_camo_india_02, // 0x6c9
        cer_camo_india_02_wz, // 0x6ca
        cer_camo_india_02_zm, // 0x6cb
        cer_camo_india_03, // 0x6cc
        cer_camo_india_03_wz, // 0x6cd
        cer_camo_india_03_zm, // 0x6ce
        cer_camo_india_04, // 0x6cf
        cer_camo_india_04_wz, // 0x6d0
        cer_camo_india_04_zm, // 0x6d1
        cer_camo_india_05, // 0x6d2
        cer_camo_india_05_wz, // 0x6d3
        cer_camo_india_05_zm, // 0x6d4
        cer_camo_india_06, // 0x6d5
        cer_camo_india_06_wz, // 0x6d6
        cer_camo_india_06_zm, // 0x6d7
        cer_camo_india_07, // 0x6d8
        cer_camo_india_07_wz, // 0x6d9
        cer_camo_india_07_zm, // 0x6da
        cer_camo_india_08, // 0x6db
        cer_camo_india_08_wz, // 0x6dc
        cer_camo_india_08_zm, // 0x6dd
        cer_camo_juliett_01, // 0x6de
        cer_camo_juliett_01_wz, // 0x6df
        cer_camo_juliett_01_zm, // 0x6e0
        cer_camo_juliett_02, // 0x6e1
        cer_camo_juliett_02_wz, // 0x6e2
        cer_camo_juliett_02_zm, // 0x6e3
        cer_camo_juliett_03, // 0x6e4
        cer_camo_juliett_03_wz, // 0x6e5
        cer_camo_juliett_03_zm, // 0x6e6
        cer_camo_juliett_04, // 0x6e7
        cer_camo_juliett_04_wz, // 0x6e8
        cer_camo_juliett_04_zm, // 0x6e9
        cer_camo_juliett_05, // 0x6ea
        cer_camo_juliett_05_wz, // 0x6eb
        cer_camo_juliett_05_zm, // 0x6ec
        cer_camo_juliett_06, // 0x6ed
        cer_camo_juliett_06_wz, // 0x6ee
        cer_camo_juliett_06_zm, // 0x6ef
        cer_camo_juliett_07, // 0x6f0
        cer_camo_juliett_07_wz, // 0x6f1
        cer_camo_juliett_07_zm, // 0x6f2
        cer_camo_juliett_08, // 0x6f3
        cer_camo_juliett_08_wz, // 0x6f4
        cer_camo_juliett_08_zm, // 0x6f5
        cer_camo_kilo_01, // 0x6f6
        cer_camo_kilo_01_wz, // 0x6f7
        cer_camo_kilo_01_zm, // 0x6f8
        cer_camo_kilo_02, // 0x6f9
        cer_camo_kilo_02_wz, // 0x6fa
        cer_camo_kilo_02_zm, // 0x6fb
        cer_camo_kilo_03, // 0x6fc
        cer_camo_kilo_03_wz, // 0x6fd
        cer_camo_kilo_03_zm, // 0x6fe
        cer_camo_kilo_04, // 0x6ff
        cer_camo_kilo_04_wz, // 0x700
        cer_camo_kilo_04_zm, // 0x701
        cer_camo_kilo_05, // 0x702
        cer_camo_kilo_05_wz, // 0x703
        cer_camo_kilo_05_zm, // 0x704
        cer_camo_kilo_06, // 0x705
        cer_camo_kilo_06_wz, // 0x706
        cer_camo_kilo_06_zm, // 0x707
        cer_camo_kilo_07, // 0x708
        cer_camo_kilo_07_wz, // 0x709
        cer_camo_kilo_07_zm, // 0x70a
        cer_camo_kilo_08, // 0x70b
        cer_camo_kilo_08_wz, // 0x70c
        cer_camo_kilo_08_zm, // 0x70d
        cer_camo_base_01_mp, // 0x70e
        cer_camo_base_01_wz, // 0x70f
        cer_camo_base_01_zm, // 0x710
        cer_camo_base_02_mp, // 0x711
        cer_camo_base_02_wz, // 0x712
        cer_camo_base_02_zm, // 0x713
        cer_camo_base_03_mp, // 0x714
        cer_camo_base_03_wz, // 0x715
        cer_camo_base_03_zm, // 0x716
        cer_camo_base_04_mp, // 0x717
        cer_camo_base_04_wz, // 0x718
        cer_camo_base_04_zm, // 0x719
        cer_camo_base_05_mp, // 0x71a
        cer_camo_base_05_wz, // 0x71b
        cer_camo_base_05_zm, // 0x71c
        cer_camo_base_06_mp, // 0x71d
        cer_camo_base_06_wz, // 0x71e
        cer_camo_base_06_zm, // 0x71f
        cer_camo_base_07_mp, // 0x720
        cer_camo_base_07_wz, // 0x721
        cer_camo_base_07_zm, // 0x722
        cer_camo_base_08_mp, // 0x723
        cer_camo_base_08_wz, // 0x724
        cer_camo_base_08_zm, // 0x725
        cer_camo_base_09_mp, // 0x726
        cer_camo_base_09_wz, // 0x727
        cer_camo_base_09_zm, // 0x728
        cer_camo_comp_01_mp, // 0x729
        cer_camo_comp_01_wz, // 0x72a
        cer_camo_comp_01_zm, // 0x72b
        cer_camo_comp_02_mp, // 0x72c
        cer_camo_comp_02_wz, // 0x72d
        cer_camo_comp_02_zm, // 0x72e
        cer_camo_comp_03_mp, // 0x72f
        cer_camo_comp_03_wz, // 0x730
        cer_camo_comp_03_zm, // 0x731
        cer_camo_comp_04_mp, // 0x732
        cer_camo_comp_04_wz, // 0x733
        cer_camo_comp_04_zm, // 0x734
        cer_camo_incentive_01, // 0x735
        cer_camo_incentive_02, // 0x736
        cer_camo_incentive_s4shop, // 0x737
        cer_camo_incentive_sat, // 0x738
        cer_camo_special_cdllau, // 0x739
        cer_camo_special_cdlfal, // 0x73a
        cer_camo_special_cdlult, // 0x73b
        cer_camo_special_cdlopt, // 0x73c
        cer_camo_special_cdlsur, // 0x73d
        cer_camo_special_cdlrok, // 0x73e
        cer_camo_special_cdlher, // 0x73f
        cer_camo_special_cdlthi, // 0x740
        cer_camo_special_cdlgur, // 0x741
        cer_camo_special_cdlclo, // 0x742
        cer_camo_special_cdlbre, // 0x743
        cer_camo_special_cdlrav, // 0x744
        cer_camo_special_cdlfaz, // 0x745
        cer_camo_special_ev420, // 0x746
        cer_camo_special_ev420blk, // 0x747
        cer_camo_special_evs45, // 0x748
        cer_camo_special_evs45blk, // 0x749
        cer_camo_special_evs55jab, // 0x74a
        cer_camo_special_evbacklog, // 0x74b
        cer_camo_special_evbacklogblk, // 0x74c
        cer_camo_special_evghost, // 0x74d
        cer_camo_special_evghostblk, // 0x74e
        cer_camo_special_evgummy, // 0x74f
        cer_camo_ranked_01, // 0x750
        cer_camo_ranked_wz_s1_01, // 0x751
        cer_camo_ranked_mp_s1_01, // 0x752
        cer_camo_ranked_mp_s2_01, // 0x753
        cer_camo_ranked_mp_s2_02, // 0x754
        cer_camo_ranked_mp_s2_03, // 0x755
        cer_camo_ranked_mp_s2_04, // 0x756
        cer_camo_ranked_mp_s2_05, // 0x757
        cer_camo_ranked_mp_s2_06, // 0x758
        cer_camo_ranked_mp_s5_01, // 0x759
        cer_camo_ranked_mp_s5_02, // 0x75a
        cer_camo_ranked_mp_s5_03, // 0x75b
        cer_camo_ranked_mp_s5_04, // 0x75c
        cer_camo_ranked_mp_s5_05, // 0x75d
        cer_camo_ranked_mp_s5_06, // 0x75e
        cer_camo_ranked_mp_s6_01, // 0x75f
        cer_camo_ranked_mp_s6_02, // 0x760
        cer_camo_ranked_mp_s6_03, // 0x761
        cer_camo_ranked_mp_s6_04, // 0x762
        cer_camo_ranked_mp_s6_05, // 0x763
        cer_camo_ranked_mp_s6_06, // 0x764
        cer_camo_ranked_wz_s2_01, // 0x765
        cer_camo_ranked_wz_s2_02, // 0x766
        cer_camo_ranked_wz_s2_03, // 0x767
        cer_camo_ranked_wz_s2_04, // 0x768
        cer_camo_ranked_wz_s2_05, // 0x769
        cer_camo_ranked_wz_s2_06, // 0x76a
        cer_camo_ranked_wz_s2_07, // 0x76b
        cer_camo_ranked_wz_s2_08, // 0x76c
        cer_camo_ranked_wz_s2_09, // 0x76d
        cer_camo_ranked_wz_s3_01, // 0x76e
        cer_camo_ranked_wz_s4_01, // 0x76f
        cer_camo_ranked_wz_s5_01, // 0x770
        cer_camo_ranked_wz_s6_01, // 0x771
        cer_camo_alfa_09, // 0x772
        cer_camo_alfa_10, // 0x773
        cer_camo_alfa_11, // 0x774
        cer_camo_alfa_12, // 0x775
        cer_camo_alfa_13, // 0x776
        cer_camo_alfa_14, // 0x777
        cer_camo_alfa_15, // 0x778
        cer_camo_alfa_16, // 0x779
        cer_camo_bravo_09, // 0x77a
        cer_camo_bravo_10, // 0x77b
        cer_camo_bravo_11, // 0x77c
        cer_camo_bravo_12, // 0x77d
        cer_camo_bravo_13, // 0x77e
        cer_camo_bravo_14, // 0x77f
        cer_camo_bravo_15, // 0x780
        cer_camo_bravo_16, // 0x781
        cer_camo_charlie_09, // 0x782
        cer_camo_charlie_10, // 0x783
        cer_camo_charlie_11, // 0x784
        cer_camo_charlie_12, // 0x785
        cer_camo_charlie_13, // 0x786
        cer_camo_charlie_14, // 0x787
        cer_camo_charlie_15, // 0x788
        cer_camo_charlie_16, // 0x789
        cer_camo_alfa_09_wz, // 0x78a
        cer_camo_alfa_10_wz, // 0x78b
        cer_camo_alfa_11_wz, // 0x78c
        cer_camo_alfa_12_wz, // 0x78d
        cer_camo_alfa_13_wz, // 0x78e
        cer_camo_alfa_14_wz, // 0x78f
        cer_camo_alfa_15_wz, // 0x790
        cer_camo_alfa_16_wz, // 0x791
        cer_camo_bravo_09_wz, // 0x792
        cer_camo_bravo_10_wz, // 0x793
        cer_camo_bravo_11_wz, // 0x794
        cer_camo_bravo_12_wz, // 0x795
        cer_camo_bravo_13_wz, // 0x796
        cer_camo_bravo_14_wz, // 0x797
        cer_camo_bravo_15_wz, // 0x798
        cer_camo_bravo_16_wz, // 0x799
        cer_camo_charlie_09_wz, // 0x79a
        cer_camo_charlie_10_wz, // 0x79b
        cer_camo_charlie_11_wz, // 0x79c
        cer_camo_charlie_12_wz, // 0x79d
        cer_camo_charlie_13_wz, // 0x79e
        cer_camo_charlie_14_wz, // 0x79f
        cer_camo_charlie_15_wz, // 0x7a0
        cer_camo_charlie_16_wz, // 0x7a1
        cer_camo_alfa_09_zm, // 0x7a2
        cer_camo_alfa_10_zm, // 0x7a3
        cer_camo_alfa_11_zm, // 0x7a4
        cer_camo_alfa_12_zm, // 0x7a5
        cer_camo_alfa_13_zm, // 0x7a6
        cer_camo_alfa_14_zm, // 0x7a7
        cer_camo_alfa_15_zm, // 0x7a8
        cer_camo_alfa_16_zm, // 0x7a9
        cer_camo_bravo_09_zm, // 0x7aa
        cer_camo_bravo_10_zm, // 0x7ab
        cer_camo_bravo_11_zm, // 0x7ac
        cer_camo_bravo_12_zm, // 0x7ad
        cer_camo_bravo_13_zm, // 0x7ae
        cer_camo_bravo_14_zm, // 0x7af
        cer_camo_bravo_15_zm, // 0x7b0
        cer_camo_bravo_16_zm, // 0x7b1
        cer_camo_charlie_09_zm, // 0x7b2
        cer_camo_charlie_10_zm, // 0x7b3
        cer_camo_charlie_11_zm, // 0x7b4
        cer_camo_charlie_12_zm, // 0x7b5
        cer_camo_charlie_13_zm, // 0x7b6
        cer_camo_charlie_14_zm, // 0x7b7
        cer_camo_charlie_15_zm, // 0x7b8
        cer_camo_charlie_16_zm, // 0x7b9
        cer_camo_delta_09, // 0x7ba
        cer_camo_delta_10, // 0x7bb
        cer_camo_delta_11, // 0x7bc
        cer_camo_delta_12, // 0x7bd
        cer_camo_delta_13, // 0x7be
        cer_camo_delta_14, // 0x7bf
        cer_camo_delta_15, // 0x7c0
        cer_camo_delta_16, // 0x7c1
        cer_camo_echo_09, // 0x7c2
        cer_camo_echo_10, // 0x7c3
        cer_camo_echo_11, // 0x7c4
        cer_camo_echo_12, // 0x7c5
        cer_camo_echo_13, // 0x7c6
        cer_camo_echo_14, // 0x7c7
        cer_camo_echo_15, // 0x7c8
        cer_camo_echo_16, // 0x7c9
        cer_camo_foxtrot_09, // 0x7ca
        cer_camo_foxtrot_10, // 0x7cb
        cer_camo_foxtrot_11, // 0x7cc
        cer_camo_foxtrot_12, // 0x7cd
        cer_camo_foxtrot_13, // 0x7ce
        cer_camo_foxtrot_14, // 0x7cf
        cer_camo_foxtrot_15, // 0x7d0
        cer_camo_foxtrot_16, // 0x7d1
        cer_camo_delta_09_wz, // 0x7d2
        cer_camo_delta_10_wz, // 0x7d3
        cer_camo_delta_11_wz, // 0x7d4
        cer_camo_delta_12_wz, // 0x7d5
        cer_camo_delta_13_wz, // 0x7d6
        cer_camo_delta_14_wz, // 0x7d7
        cer_camo_delta_15_wz, // 0x7d8
        cer_camo_delta_16_wz, // 0x7d9
        cer_camo_echo_09_wz, // 0x7da
        cer_camo_echo_10_wz, // 0x7db
        cer_camo_echo_11_wz, // 0x7dc
        cer_camo_echo_12_wz, // 0x7dd
        cer_camo_echo_13_wz, // 0x7de
        cer_camo_echo_14_wz, // 0x7df
        cer_camo_echo_15_wz, // 0x7e0
        cer_camo_echo_16_wz, // 0x7e1
        cer_camo_foxtrot_09_wz, // 0x7e2
        cer_camo_foxtrot_10_wz, // 0x7e3
        cer_camo_foxtrot_11_wz, // 0x7e4
        cer_camo_foxtrot_12_wz, // 0x7e5
        cer_camo_foxtrot_13_wz, // 0x7e6
        cer_camo_foxtrot_14_wz, // 0x7e7
        cer_camo_foxtrot_15_wz, // 0x7e8
        cer_camo_foxtrot_16_wz, // 0x7e9
        cer_camo_delta_09_zm, // 0x7ea
        cer_camo_delta_10_zm, // 0x7eb
        cer_camo_delta_11_zm, // 0x7ec
        cer_camo_delta_12_zm, // 0x7ed
        cer_camo_delta_13_zm, // 0x7ee
        cer_camo_delta_14_zm, // 0x7ef
        cer_camo_delta_15_zm, // 0x7f0
        cer_camo_delta_16_zm, // 0x7f1
        cer_camo_echo_09_zm, // 0x7f2
        cer_camo_echo_10_zm, // 0x7f3
        cer_camo_echo_11_zm, // 0x7f4
        cer_camo_echo_12_zm, // 0x7f5
        cer_camo_echo_13_zm, // 0x7f6
        cer_camo_echo_14_zm, // 0x7f7
        cer_camo_echo_15_zm, // 0x7f8
        cer_camo_echo_16_zm, // 0x7f9
        cer_camo_foxtrot_09_zm, // 0x7fa
        cer_camo_foxtrot_10_zm, // 0x7fb
        cer_camo_foxtrot_11_zm, // 0x7fc
        cer_camo_foxtrot_12_zm, // 0x7fd
        cer_camo_foxtrot_13_zm, // 0x7fe
        cer_camo_foxtrot_14_zm, // 0x7ff
        cer_camo_foxtrot_15_zm, // 0x800
        cer_camo_foxtrot_16_zm, // 0x801
        cer_camo_golf_09, // 0x802
        cer_camo_golf_10, // 0x803
        cer_camo_golf_11, // 0x804
        cer_camo_golf_12, // 0x805
        cer_camo_golf_13, // 0x806
        cer_camo_golf_14, // 0x807
        cer_camo_golf_15, // 0x808
        cer_camo_golf_16, // 0x809
        cer_camo_hotel_09, // 0x80a
        cer_camo_hotel_10, // 0x80b
        cer_camo_hotel_11, // 0x80c
        cer_camo_hotel_12, // 0x80d
        cer_camo_hotel_13, // 0x80e
        cer_camo_hotel_14, // 0x80f
        cer_camo_hotel_15, // 0x810
        cer_camo_hotel_16, // 0x811
        cer_camo_india_09, // 0x812
        cer_camo_india_10, // 0x813
        cer_camo_india_11, // 0x814
        cer_camo_india_12, // 0x815
        cer_camo_india_13, // 0x816
        cer_camo_india_14, // 0x817
        cer_camo_india_15, // 0x818
        cer_camo_india_16, // 0x819
        cer_camo_golf_09_wz, // 0x81a
        cer_camo_golf_10_wz, // 0x81b
        cer_camo_golf_11_wz, // 0x81c
        cer_camo_golf_12_wz, // 0x81d
        cer_camo_golf_13_wz, // 0x81e
        cer_camo_golf_14_wz, // 0x81f
        cer_camo_golf_15_wz, // 0x820
        cer_camo_golf_16_wz, // 0x821
        cer_camo_hotel_09_wz, // 0x822
        cer_camo_hotel_10_wz, // 0x823
        cer_camo_hotel_11_wz, // 0x824
        cer_camo_hotel_12_wz, // 0x825
        cer_camo_hotel_13_wz, // 0x826
        cer_camo_hotel_14_wz, // 0x827
        cer_camo_hotel_15_wz, // 0x828
        cer_camo_hotel_16_wz, // 0x829
        cer_camo_india_09_wz, // 0x82a
        cer_camo_india_10_wz, // 0x82b
        cer_camo_india_11_wz, // 0x82c
        cer_camo_india_12_wz, // 0x82d
        cer_camo_india_13_wz, // 0x82e
        cer_camo_india_14_wz, // 0x82f
        cer_camo_india_15_wz, // 0x830
        cer_camo_india_16_wz, // 0x831
        cer_camo_golf_09_zm, // 0x832
        cer_camo_golf_10_zm, // 0x833
        cer_camo_golf_11_zm, // 0x834
        cer_camo_golf_12_zm, // 0x835
        cer_camo_golf_13_zm, // 0x836
        cer_camo_golf_14_zm, // 0x837
        cer_camo_golf_15_zm, // 0x838
        cer_camo_golf_16_zm, // 0x839
        cer_camo_hotel_09_zm, // 0x83a
        cer_camo_hotel_10_zm, // 0x83b
        cer_camo_hotel_11_zm, // 0x83c
        cer_camo_hotel_12_zm, // 0x83d
        cer_camo_hotel_13_zm, // 0x83e
        cer_camo_hotel_14_zm, // 0x83f
        cer_camo_hotel_15_zm, // 0x840
        cer_camo_hotel_16_zm, // 0x841
        cer_camo_india_09_zm, // 0x842
        cer_camo_india_10_zm, // 0x843
        cer_camo_india_11_zm, // 0x844
        cer_camo_india_12_zm, // 0x845
        cer_camo_india_13_zm, // 0x846
        cer_camo_india_14_zm, // 0x847
        cer_camo_india_15_zm, // 0x848
        cer_camo_india_16_zm, // 0x849
        cer_camo_base_01_mp_able18, // 0x84a
        cer_camo_base_01_mp_aeasy, // 0x84b
        cer_camo_base_01_mp_aking74, // 0x84c
        cer_camo_base_01_mp_aroger10, // 0x84d
        cer_camo_base_01_mp_asvalor, // 0x84e
        cer_camo_base_01_mp_bat, // 0x84f
        cer_camo_base_01_mp_chuck9, // 0x850
        cer_camo_base_01_mp_clove, // 0x851
        cer_camo_base_01_mp_coslo723, // 0x852
        cer_camo_base_01_mp_droger, // 0x853
        cer_camo_base_01_mp_falove, // 0x854
        cer_camo_base_01_mp_geasy9, // 0x855
        cer_camo_base_01_mp_knife, // 0x856
        cer_camo_base_01_mp_ksugar58, // 0x857
        cer_camo_base_01_mp_love85, // 0x858
        cer_camo_base_01_mp_love96, // 0x859
        cer_camo_base_01_mp_mable, // 0x85a
        cer_camo_base_01_mp_moslo500, // 0x85b
        cer_camo_base_01_mp_pable3, // 0x85c
        cer_camo_base_01_mp_paris30, // 0x85d
        cer_camo_base_01_mp_pparis90, // 0x85e
        cer_camo_base_01_mp_puncle21, // 0x85f
        cer_camo_base_01_mp_rmary2, // 0x860
        cer_camo_base_01_mp_roger31, // 0x861
        cer_camo_base_01_mp_safox, // 0x862
        cer_camo_base_01_mp_sgeorge550, // 0x863
        cer_camo_base_01_mp_sroger25, // 0x864
        cer_camo_base_01_mp_sroger3, // 0x865
        cer_camo_base_01_mp_stiger, // 0x866
        cer_camo_base_01_mp_stisaac, // 0x867
        cer_camo_base_01_mp_svalor, // 0x868
        cer_camo_base_01_mp_ultiger, // 0x869
        cer_camo_base_01_mp_uncle12, // 0x86a
        cer_camo_base_01_mp_usugar9, // 0x86b
        cer_camo_base_01_wz_able18, // 0x86c
        cer_camo_base_01_wz_aeasy, // 0x86d
        cer_camo_base_01_wz_aking74, // 0x86e
        cer_camo_base_01_wz_aroger10, // 0x86f
        cer_camo_base_01_wz_asvalor, // 0x870
        cer_camo_base_01_wz_bat, // 0x871
        cer_camo_base_01_wz_chuck9, // 0x872
        cer_camo_base_01_wz_clove, // 0x873
        cer_camo_base_01_wz_coslo723, // 0x874
        cer_camo_base_01_wz_droger, // 0x875
        cer_camo_base_01_wz_falove, // 0x876
        cer_camo_base_01_wz_geasy9, // 0x877
        cer_camo_base_01_wz_knife, // 0x878
        cer_camo_base_01_wz_ksugar58, // 0x879
        cer_camo_base_01_wz_love85, // 0x87a
        cer_camo_base_01_wz_love96, // 0x87b
        cer_camo_base_01_wz_mable, // 0x87c
        cer_camo_base_01_wz_moslo500, // 0x87d
        cer_camo_base_01_wz_pable3, // 0x87e
        cer_camo_base_01_wz_paris30, // 0x87f
        cer_camo_base_01_wz_pparis90, // 0x880
        cer_camo_base_01_wz_puncle21, // 0x881
        cer_camo_base_01_wz_rmary2, // 0x882
        cer_camo_base_01_wz_roger31, // 0x883
        cer_camo_base_01_wz_safox, // 0x884
        cer_camo_base_01_wz_sgeorge550, // 0x885
        cer_camo_base_01_wz_sroger25, // 0x886
        cer_camo_base_01_wz_sroger3, // 0x887
        cer_camo_base_01_wz_stiger, // 0x888
        cer_camo_base_01_wz_stisaac, // 0x889
        cer_camo_base_01_wz_svalor, // 0x88a
        cer_camo_base_01_wz_ultiger, // 0x88b
        cer_camo_base_01_wz_uncle12, // 0x88c
        cer_camo_base_01_wz_usugar9, // 0x88d
        cer_camo_base_01_zm_able18, // 0x88e
        cer_camo_base_01_zm_aeasy, // 0x88f
        cer_camo_base_01_zm_aking74, // 0x890
        cer_camo_base_01_zm_aroger10, // 0x891
        cer_camo_base_01_zm_asvalor, // 0x892
        cer_camo_base_01_zm_bat, // 0x893
        cer_camo_base_01_zm_chuck9, // 0x894
        cer_camo_base_01_zm_clove, // 0x895
        cer_camo_base_01_zm_coslo723, // 0x896
        cer_camo_base_01_zm_droger, // 0x897
        cer_camo_base_01_zm_falove, // 0x898
        cer_camo_base_01_zm_geasy9, // 0x899
        cer_camo_base_01_zm_knife, // 0x89a
        cer_camo_base_01_zm_ksugar58, // 0x89b
        cer_camo_base_01_zm_love85, // 0x89c
        cer_camo_base_01_zm_love96, // 0x89d
        cer_camo_base_01_zm_mable, // 0x89e
        cer_camo_base_01_zm_moslo500, // 0x89f
        cer_camo_base_01_zm_pable3, // 0x8a0
        cer_camo_base_01_zm_paris30, // 0x8a1
        cer_camo_base_01_zm_pparis90, // 0x8a2
        cer_camo_base_01_zm_puncle21, // 0x8a3
        cer_camo_base_01_zm_rmary2, // 0x8a4
        cer_camo_base_01_zm_roger31, // 0x8a5
        cer_camo_base_01_zm_safox, // 0x8a6
        cer_camo_base_01_zm_sgeorge550, // 0x8a7
        cer_camo_base_01_zm_sroger25, // 0x8a8
        cer_camo_base_01_zm_sroger3, // 0x8a9
        cer_camo_base_01_zm_stiger, // 0x8aa
        cer_camo_base_01_zm_stisaac, // 0x8ab
        cer_camo_base_01_zm_svalor, // 0x8ac
        cer_camo_base_01_zm_ultiger, // 0x8ad
        cer_camo_base_01_zm_uncle12, // 0x8ae
        cer_camo_base_01_zm_usugar9, // 0x8af
        cer_camo_base_02_mp_able18, // 0x8b0
        cer_camo_base_02_mp_aeasy, // 0x8b1
        cer_camo_base_02_mp_aking74, // 0x8b2
        cer_camo_base_02_mp_aroger10, // 0x8b3
        cer_camo_base_02_mp_asvalor, // 0x8b4
        cer_camo_base_02_mp_bat, // 0x8b5
        cer_camo_base_02_mp_chuck9, // 0x8b6
        cer_camo_base_02_mp_clove, // 0x8b7
        cer_camo_base_02_mp_coslo723, // 0x8b8
        cer_camo_base_02_mp_droger, // 0x8b9
        cer_camo_base_02_mp_falove, // 0x8ba
        cer_camo_base_02_mp_geasy9, // 0x8bb
        cer_camo_base_02_mp_knife, // 0x8bc
        cer_camo_base_02_mp_ksugar58, // 0x8bd
        cer_camo_base_02_mp_love85, // 0x8be
        cer_camo_base_02_mp_love96, // 0x8bf
        cer_camo_base_02_mp_mable, // 0x8c0
        cer_camo_base_02_mp_moslo500, // 0x8c1
        cer_camo_base_02_mp_pable3, // 0x8c2
        cer_camo_base_02_mp_paris30, // 0x8c3
        cer_camo_base_02_mp_pparis90, // 0x8c4
        cer_camo_base_02_mp_puncle21, // 0x8c5
        cer_camo_base_02_mp_rmary2, // 0x8c6
        cer_camo_base_02_mp_roger31, // 0x8c7
        cer_camo_base_02_mp_safox, // 0x8c8
        cer_camo_base_02_mp_sgeorge550, // 0x8c9
        cer_camo_base_02_mp_sroger25, // 0x8ca
        cer_camo_base_02_mp_sroger3, // 0x8cb
        cer_camo_base_02_mp_stiger, // 0x8cc
        cer_camo_base_02_mp_stisaac, // 0x8cd
        cer_camo_base_02_mp_svalor, // 0x8ce
        cer_camo_base_02_mp_ultiger, // 0x8cf
        cer_camo_base_02_mp_uncle12, // 0x8d0
        cer_camo_base_02_mp_usugar9, // 0x8d1
        cer_camo_base_02_wz_able18, // 0x8d2
        cer_camo_base_02_wz_aeasy, // 0x8d3
        cer_camo_base_02_wz_aking74, // 0x8d4
        cer_camo_base_02_wz_aroger10, // 0x8d5
        cer_camo_base_02_wz_asvalor, // 0x8d6
        cer_camo_base_02_wz_bat, // 0x8d7
        cer_camo_base_02_wz_chuck9, // 0x8d8
        cer_camo_base_02_wz_clove, // 0x8d9
        cer_camo_base_02_wz_coslo723, // 0x8da
        cer_camo_base_02_wz_droger, // 0x8db
        cer_camo_base_02_wz_falove, // 0x8dc
        cer_camo_base_02_wz_geasy9, // 0x8dd
        cer_camo_base_02_wz_knife, // 0x8de
        cer_camo_base_02_wz_ksugar58, // 0x8df
        cer_camo_base_02_wz_love85, // 0x8e0
        cer_camo_base_02_wz_love96, // 0x8e1
        cer_camo_base_02_wz_mable, // 0x8e2
        cer_camo_base_02_wz_moslo500, // 0x8e3
        cer_camo_base_02_wz_pable3, // 0x8e4
        cer_camo_base_02_wz_paris30, // 0x8e5
        cer_camo_base_02_wz_pparis90, // 0x8e6
        cer_camo_base_02_wz_puncle21, // 0x8e7
        cer_camo_base_02_wz_rmary2, // 0x8e8
        cer_camo_base_02_wz_roger31, // 0x8e9
        cer_camo_base_02_wz_safox, // 0x8ea
        cer_camo_base_02_wz_sgeorge550, // 0x8eb
        cer_camo_base_02_wz_sroger25, // 0x8ec
        cer_camo_base_02_wz_sroger3, // 0x8ed
        cer_camo_base_02_wz_stiger, // 0x8ee
        cer_camo_base_02_wz_stisaac, // 0x8ef
        cer_camo_base_02_wz_svalor, // 0x8f0
        cer_camo_base_02_wz_ultiger, // 0x8f1
        cer_camo_base_02_wz_uncle12, // 0x8f2
        cer_camo_base_02_wz_usugar9, // 0x8f3
        cer_camo_base_02_zm_able18, // 0x8f4
        cer_camo_base_02_zm_aeasy, // 0x8f5
        cer_camo_base_02_zm_aking74, // 0x8f6
        cer_camo_base_02_zm_aroger10, // 0x8f7
        cer_camo_base_02_zm_asvalor, // 0x8f8
        cer_camo_base_02_zm_bat, // 0x8f9
        cer_camo_base_02_zm_chuck9, // 0x8fa
        cer_camo_base_02_zm_clove, // 0x8fb
        cer_camo_base_02_zm_coslo723, // 0x8fc
        cer_camo_base_02_zm_droger, // 0x8fd
        cer_camo_base_02_zm_falove, // 0x8fe
        cer_camo_base_02_zm_geasy9, // 0x8ff
        cer_camo_base_02_zm_knife, // 0x900
        cer_camo_base_02_zm_ksugar58, // 0x901
        cer_camo_base_02_zm_love85, // 0x902
        cer_camo_base_02_zm_love96, // 0x903
        cer_camo_base_02_zm_mable, // 0x904
        cer_camo_base_02_zm_moslo500, // 0x905
        cer_camo_base_02_zm_pable3, // 0x906
        cer_camo_base_02_zm_paris30, // 0x907
        cer_camo_base_02_zm_pparis90, // 0x908
        cer_camo_base_02_zm_puncle21, // 0x909
        cer_camo_base_02_zm_rmary2, // 0x90a
        cer_camo_base_02_zm_roger31, // 0x90b
        cer_camo_base_02_zm_safox, // 0x90c
        cer_camo_base_02_zm_sgeorge550, // 0x90d
        cer_camo_base_02_zm_sroger25, // 0x90e
        cer_camo_base_02_zm_sroger3, // 0x90f
        cer_camo_base_02_zm_stiger, // 0x910
        cer_camo_base_02_zm_stisaac, // 0x911
        cer_camo_base_02_zm_svalor, // 0x912
        cer_camo_base_02_zm_ultiger, // 0x913
        cer_camo_base_02_zm_uncle12, // 0x914
        cer_camo_base_02_zm_usugar9, // 0x915
        cer_camo_base_03_mp_able18, // 0x916
        cer_camo_base_03_mp_aeasy, // 0x917
        cer_camo_base_03_mp_aking74, // 0x918
        cer_camo_base_03_mp_aroger10, // 0x919
        cer_camo_base_03_mp_asvalor, // 0x91a
        cer_camo_base_03_mp_bat, // 0x91b
        cer_camo_base_03_mp_chuck9, // 0x91c
        cer_camo_base_03_mp_clove, // 0x91d
        cer_camo_base_03_mp_coslo723, // 0x91e
        cer_camo_base_03_mp_droger, // 0x91f
        cer_camo_base_03_mp_falove, // 0x920
        cer_camo_base_03_mp_geasy9, // 0x921
        cer_camo_base_03_mp_knife, // 0x922
        cer_camo_base_03_mp_ksugar58, // 0x923
        cer_camo_base_03_mp_love85, // 0x924
        cer_camo_base_03_mp_love96, // 0x925
        cer_camo_base_03_mp_mable, // 0x926
        cer_camo_base_03_mp_moslo500, // 0x927
        cer_camo_base_03_mp_pable3, // 0x928
        cer_camo_base_03_mp_paris30, // 0x929
        cer_camo_base_03_mp_pparis90, // 0x92a
        cer_camo_base_03_mp_puncle21, // 0x92b
        cer_camo_base_03_mp_rmary2, // 0x92c
        cer_camo_base_03_mp_roger31, // 0x92d
        cer_camo_base_03_mp_safox, // 0x92e
        cer_camo_base_03_mp_sgeorge550, // 0x92f
        cer_camo_base_03_mp_sroger25, // 0x930
        cer_camo_base_03_mp_sroger3, // 0x931
        cer_camo_base_03_mp_stiger, // 0x932
        cer_camo_base_03_mp_stisaac, // 0x933
        cer_camo_base_03_mp_svalor, // 0x934
        cer_camo_base_03_mp_ultiger, // 0x935
        cer_camo_base_03_mp_uncle12, // 0x936
        cer_camo_base_03_mp_usugar9, // 0x937
        cer_camo_base_03_wz_able18, // 0x938
        cer_camo_base_03_wz_aeasy, // 0x939
        cer_camo_base_03_wz_aking74, // 0x93a
        cer_camo_base_03_wz_aroger10, // 0x93b
        cer_camo_base_03_wz_asvalor, // 0x93c
        cer_camo_base_03_wz_bat, // 0x93d
        cer_camo_base_03_wz_chuck9, // 0x93e
        cer_camo_base_03_wz_clove, // 0x93f
        cer_camo_base_03_wz_coslo723, // 0x940
        cer_camo_base_03_wz_droger, // 0x941
        cer_camo_base_03_wz_falove, // 0x942
        cer_camo_base_03_wz_geasy9, // 0x943
        cer_camo_base_03_wz_knife, // 0x944
        cer_camo_base_03_wz_ksugar58, // 0x945
        cer_camo_base_03_wz_love85, // 0x946
        cer_camo_base_03_wz_love96, // 0x947
        cer_camo_base_03_wz_mable, // 0x948
        cer_camo_base_03_wz_moslo500, // 0x949
        cer_camo_base_03_wz_pable3, // 0x94a
        cer_camo_base_03_wz_paris30, // 0x94b
        cer_camo_base_03_wz_pparis90, // 0x94c
        cer_camo_base_03_wz_puncle21, // 0x94d
        cer_camo_base_03_wz_rmary2, // 0x94e
        cer_camo_base_03_wz_roger31, // 0x94f
        cer_camo_base_03_wz_safox, // 0x950
        cer_camo_base_03_wz_sgeorge550, // 0x951
        cer_camo_base_03_wz_sroger25, // 0x952
        cer_camo_base_03_wz_sroger3, // 0x953
        cer_camo_base_03_wz_stiger, // 0x954
        cer_camo_base_03_wz_stisaac, // 0x955
        cer_camo_base_03_wz_svalor, // 0x956
        cer_camo_base_03_wz_ultiger, // 0x957
        cer_camo_base_03_wz_uncle12, // 0x958
        cer_camo_base_03_wz_usugar9, // 0x959
        cer_camo_base_03_zm_able18, // 0x95a
        cer_camo_base_03_zm_aeasy, // 0x95b
        cer_camo_base_03_zm_aking74, // 0x95c
        cer_camo_base_03_zm_aroger10, // 0x95d
        cer_camo_base_03_zm_asvalor, // 0x95e
        cer_camo_base_03_zm_bat, // 0x95f
        cer_camo_base_03_zm_chuck9, // 0x960
        cer_camo_base_03_zm_clove, // 0x961
        cer_camo_base_03_zm_coslo723, // 0x962
        cer_camo_base_03_zm_droger, // 0x963
        cer_camo_base_03_zm_falove, // 0x964
        cer_camo_base_03_zm_geasy9, // 0x965
        cer_camo_base_03_zm_knife, // 0x966
        cer_camo_base_03_zm_ksugar58, // 0x967
        cer_camo_base_03_zm_love85, // 0x968
        cer_camo_base_03_zm_love96, // 0x969
        cer_camo_base_03_zm_mable, // 0x96a
        cer_camo_base_03_zm_moslo500, // 0x96b
        cer_camo_base_03_zm_pable3, // 0x96c
        cer_camo_base_03_zm_paris30, // 0x96d
        cer_camo_base_03_zm_pparis90, // 0x96e
        cer_camo_base_03_zm_puncle21, // 0x96f
        cer_camo_base_03_zm_rmary2, // 0x970
        cer_camo_base_03_zm_roger31, // 0x971
        cer_camo_base_03_zm_safox, // 0x972
        cer_camo_base_03_zm_sgeorge550, // 0x973
        cer_camo_base_03_zm_sroger25, // 0x974
        cer_camo_base_03_zm_sroger3, // 0x975
        cer_camo_base_03_zm_stiger, // 0x976
        cer_camo_base_03_zm_stisaac, // 0x977
        cer_camo_base_03_zm_svalor, // 0x978
        cer_camo_base_03_zm_ultiger, // 0x979
        cer_camo_base_03_zm_uncle12, // 0x97a
        cer_camo_base_03_zm_usugar9, // 0x97b
        cer_camo_base_04_mp_able18, // 0x97c
        cer_camo_base_04_mp_aeasy, // 0x97d
        cer_camo_base_04_mp_aking74, // 0x97e
        cer_camo_base_04_mp_aroger10, // 0x97f
        cer_camo_base_04_mp_asvalor, // 0x980
        cer_camo_base_04_mp_bat, // 0x981
        cer_camo_base_04_mp_chuck9, // 0x982
        cer_camo_base_04_mp_clove, // 0x983
        cer_camo_base_04_mp_coslo723, // 0x984
        cer_camo_base_04_mp_droger, // 0x985
        cer_camo_base_04_mp_falove, // 0x986
        cer_camo_base_04_mp_geasy9, // 0x987
        cer_camo_base_04_mp_knife, // 0x988
        cer_camo_base_04_mp_ksugar58, // 0x989
        cer_camo_base_04_mp_love85, // 0x98a
        cer_camo_base_04_mp_love96, // 0x98b
        cer_camo_base_04_mp_mable, // 0x98c
        cer_camo_base_04_mp_moslo500, // 0x98d
        cer_camo_base_04_mp_pable3, // 0x98e
        cer_camo_base_04_mp_paris30, // 0x98f
        cer_camo_base_04_mp_pparis90, // 0x990
        cer_camo_base_04_mp_puncle21, // 0x991
        cer_camo_base_04_mp_rmary2, // 0x992
        cer_camo_base_04_mp_roger31, // 0x993
        cer_camo_base_04_mp_safox, // 0x994
        cer_camo_base_04_mp_sgeorge550, // 0x995
        cer_camo_base_04_mp_sroger25, // 0x996
        cer_camo_base_04_mp_sroger3, // 0x997
        cer_camo_base_04_mp_stiger, // 0x998
        cer_camo_base_04_mp_stisaac, // 0x999
        cer_camo_base_04_mp_svalor, // 0x99a
        cer_camo_base_04_mp_ultiger, // 0x99b
        cer_camo_base_04_mp_uncle12, // 0x99c
        cer_camo_base_04_mp_usugar9, // 0x99d
        cer_camo_base_04_wz_able18, // 0x99e
        cer_camo_base_04_wz_aeasy, // 0x99f
        cer_camo_base_04_wz_aking74, // 0x9a0
        cer_camo_base_04_wz_aroger10, // 0x9a1
        cer_camo_base_04_wz_asvalor, // 0x9a2
        cer_camo_base_04_wz_bat, // 0x9a3
        cer_camo_base_04_wz_chuck9, // 0x9a4
        cer_camo_base_04_wz_clove, // 0x9a5
        cer_camo_base_04_wz_coslo723, // 0x9a6
        cer_camo_base_04_wz_droger, // 0x9a7
        cer_camo_base_04_wz_falove, // 0x9a8
        cer_camo_base_04_wz_geasy9, // 0x9a9
        cer_camo_base_04_wz_knife, // 0x9aa
        cer_camo_base_04_wz_ksugar58, // 0x9ab
        cer_camo_base_04_wz_love85, // 0x9ac
        cer_camo_base_04_wz_love96, // 0x9ad
        cer_camo_base_04_wz_mable, // 0x9ae
        cer_camo_base_04_wz_moslo500, // 0x9af
        cer_camo_base_04_wz_pable3, // 0x9b0
        cer_camo_base_04_wz_paris30, // 0x9b1
        cer_camo_base_04_wz_pparis90, // 0x9b2
        cer_camo_base_04_wz_puncle21, // 0x9b3
        cer_camo_base_04_wz_rmary2, // 0x9b4
        cer_camo_base_04_wz_roger31, // 0x9b5
        cer_camo_base_04_wz_safox, // 0x9b6
        cer_camo_base_04_wz_sgeorge550, // 0x9b7
        cer_camo_base_04_wz_sroger25, // 0x9b8
        cer_camo_base_04_wz_sroger3, // 0x9b9
        cer_camo_base_04_wz_stiger, // 0x9ba
        cer_camo_base_04_wz_stisaac, // 0x9bb
        cer_camo_base_04_wz_svalor, // 0x9bc
        cer_camo_base_04_wz_ultiger, // 0x9bd
        cer_camo_base_04_wz_uncle12, // 0x9be
        cer_camo_base_04_wz_usugar9, // 0x9bf
        cer_camo_base_04_zm_able18, // 0x9c0
        cer_camo_base_04_zm_aeasy, // 0x9c1
        cer_camo_base_04_zm_aking74, // 0x9c2
        cer_camo_base_04_zm_aroger10, // 0x9c3
        cer_camo_base_04_zm_asvalor, // 0x9c4
        cer_camo_base_04_zm_bat, // 0x9c5
        cer_camo_base_04_zm_chuck9, // 0x9c6
        cer_camo_base_04_zm_clove, // 0x9c7
        cer_camo_base_04_zm_coslo723, // 0x9c8
        cer_camo_base_04_zm_droger, // 0x9c9
        cer_camo_base_04_zm_falove, // 0x9ca
        cer_camo_base_04_zm_geasy9, // 0x9cb
        cer_camo_base_04_zm_knife, // 0x9cc
        cer_camo_base_04_zm_ksugar58, // 0x9cd
        cer_camo_base_04_zm_love85, // 0x9ce
        cer_camo_base_04_zm_love96, // 0x9cf
        cer_camo_base_04_zm_mable, // 0x9d0
        cer_camo_base_04_zm_moslo500, // 0x9d1
        cer_camo_base_04_zm_pable3, // 0x9d2
        cer_camo_base_04_zm_paris30, // 0x9d3
        cer_camo_base_04_zm_pparis90, // 0x9d4
        cer_camo_base_04_zm_puncle21, // 0x9d5
        cer_camo_base_04_zm_rmary2, // 0x9d6
        cer_camo_base_04_zm_roger31, // 0x9d7
        cer_camo_base_04_zm_safox, // 0x9d8
        cer_camo_base_04_zm_sgeorge550, // 0x9d9
        cer_camo_base_04_zm_sroger25, // 0x9da
        cer_camo_base_04_zm_sroger3, // 0x9db
        cer_camo_base_04_zm_stiger, // 0x9dc
        cer_camo_base_04_zm_stisaac, // 0x9dd
        cer_camo_base_04_zm_svalor, // 0x9de
        cer_camo_base_04_zm_ultiger, // 0x9df
        cer_camo_base_04_zm_uncle12, // 0x9e0
        cer_camo_base_04_zm_usugar9, // 0x9e1
        cer_camo_base_05_mp_able18, // 0x9e2
        cer_camo_base_05_mp_aeasy, // 0x9e3
        cer_camo_base_05_mp_aking74, // 0x9e4
        cer_camo_base_05_mp_aroger10, // 0x9e5
        cer_camo_base_05_mp_asvalor, // 0x9e6
        cer_camo_base_05_mp_bat, // 0x9e7
        cer_camo_base_05_mp_chuck9, // 0x9e8
        cer_camo_base_05_mp_clove, // 0x9e9
        cer_camo_base_05_mp_coslo723, // 0x9ea
        cer_camo_base_05_mp_droger, // 0x9eb
        cer_camo_base_05_mp_falove, // 0x9ec
        cer_camo_base_05_mp_geasy9, // 0x9ed
        cer_camo_base_05_mp_knife, // 0x9ee
        cer_camo_base_05_mp_ksugar58, // 0x9ef
        cer_camo_base_05_mp_love85, // 0x9f0
        cer_camo_base_05_mp_love96, // 0x9f1
        cer_camo_base_05_mp_mable, // 0x9f2
        cer_camo_base_05_mp_moslo500, // 0x9f3
        cer_camo_base_05_mp_pable3, // 0x9f4
        cer_camo_base_05_mp_paris30, // 0x9f5
        cer_camo_base_05_mp_pparis90, // 0x9f6
        cer_camo_base_05_mp_puncle21, // 0x9f7
        cer_camo_base_05_mp_rmary2, // 0x9f8
        cer_camo_base_05_mp_roger31, // 0x9f9
        cer_camo_base_05_mp_safox, // 0x9fa
        cer_camo_base_05_mp_sgeorge550, // 0x9fb
        cer_camo_base_05_mp_sroger25, // 0x9fc
        cer_camo_base_05_mp_sroger3, // 0x9fd
        cer_camo_base_05_mp_stiger, // 0x9fe
        cer_camo_base_05_mp_stisaac, // 0x9ff
        cer_camo_base_05_mp_svalor, // 0xa00
        cer_camo_base_05_mp_ultiger, // 0xa01
        cer_camo_base_05_mp_uncle12, // 0xa02
        cer_camo_base_05_mp_usugar9, // 0xa03
        cer_camo_base_05_wz_able18, // 0xa04
        cer_camo_base_05_wz_aeasy, // 0xa05
        cer_camo_base_05_wz_aking74, // 0xa06
        cer_camo_base_05_wz_aroger10, // 0xa07
        cer_camo_base_05_wz_asvalor, // 0xa08
        cer_camo_base_05_wz_bat, // 0xa09
        cer_camo_base_05_wz_chuck9, // 0xa0a
        cer_camo_base_05_wz_clove, // 0xa0b
        cer_camo_base_05_wz_coslo723, // 0xa0c
        cer_camo_base_05_wz_droger, // 0xa0d
        cer_camo_base_05_wz_falove, // 0xa0e
        cer_camo_base_05_wz_geasy9, // 0xa0f
        cer_camo_base_05_wz_knife, // 0xa10
        cer_camo_base_05_wz_ksugar58, // 0xa11
        cer_camo_base_05_wz_love85, // 0xa12
        cer_camo_base_05_wz_love96, // 0xa13
        cer_camo_base_05_wz_mable, // 0xa14
        cer_camo_base_05_wz_moslo500, // 0xa15
        cer_camo_base_05_wz_pable3, // 0xa16
        cer_camo_base_05_wz_paris30, // 0xa17
        cer_camo_base_05_wz_pparis90, // 0xa18
        cer_camo_base_05_wz_puncle21, // 0xa19
        cer_camo_base_05_wz_rmary2, // 0xa1a
        cer_camo_base_05_wz_roger31, // 0xa1b
        cer_camo_base_05_wz_safox, // 0xa1c
        cer_camo_base_05_wz_sgeorge550, // 0xa1d
        cer_camo_base_05_wz_sroger25, // 0xa1e
        cer_camo_base_05_wz_sroger3, // 0xa1f
        cer_camo_base_05_wz_stiger, // 0xa20
        cer_camo_base_05_wz_stisaac, // 0xa21
        cer_camo_base_05_wz_svalor, // 0xa22
        cer_camo_base_05_wz_ultiger, // 0xa23
        cer_camo_base_05_wz_uncle12, // 0xa24
        cer_camo_base_05_wz_usugar9, // 0xa25
        cer_camo_base_05_zm_able18, // 0xa26
        cer_camo_base_05_zm_aeasy, // 0xa27
        cer_camo_base_05_zm_aking74, // 0xa28
        cer_camo_base_05_zm_aroger10, // 0xa29
        cer_camo_base_05_zm_asvalor, // 0xa2a
        cer_camo_base_05_zm_bat, // 0xa2b
        cer_camo_base_05_zm_chuck9, // 0xa2c
        cer_camo_base_05_zm_clove, // 0xa2d
        cer_camo_base_05_zm_coslo723, // 0xa2e
        cer_camo_base_05_zm_droger, // 0xa2f
        cer_camo_base_05_zm_falove, // 0xa30
        cer_camo_base_05_zm_geasy9, // 0xa31
        cer_camo_base_05_zm_knife, // 0xa32
        cer_camo_base_05_zm_ksugar58, // 0xa33
        cer_camo_base_05_zm_love85, // 0xa34
        cer_camo_base_05_zm_love96, // 0xa35
        cer_camo_base_05_zm_mable, // 0xa36
        cer_camo_base_05_zm_moslo500, // 0xa37
        cer_camo_base_05_zm_pable3, // 0xa38
        cer_camo_base_05_zm_paris30, // 0xa39
        cer_camo_base_05_zm_pparis90, // 0xa3a
        cer_camo_base_05_zm_puncle21, // 0xa3b
        cer_camo_base_05_zm_rmary2, // 0xa3c
        cer_camo_base_05_zm_roger31, // 0xa3d
        cer_camo_base_05_zm_safox, // 0xa3e
        cer_camo_base_05_zm_sgeorge550, // 0xa3f
        cer_camo_base_05_zm_sroger25, // 0xa40
        cer_camo_base_05_zm_sroger3, // 0xa41
        cer_camo_base_05_zm_stiger, // 0xa42
        cer_camo_base_05_zm_stisaac, // 0xa43
        cer_camo_base_05_zm_svalor, // 0xa44
        cer_camo_base_05_zm_ultiger, // 0xa45
        cer_camo_base_05_zm_uncle12, // 0xa46
        cer_camo_base_05_zm_usugar9, // 0xa47
        cer_camo_base_06_mp_able18, // 0xa48
        cer_camo_base_06_mp_aeasy, // 0xa49
        cer_camo_base_06_mp_aking74, // 0xa4a
        cer_camo_base_06_mp_aroger10, // 0xa4b
        cer_camo_base_06_mp_asvalor, // 0xa4c
        cer_camo_base_06_mp_bat, // 0xa4d
        cer_camo_base_06_mp_chuck9, // 0xa4e
        cer_camo_base_06_mp_clove, // 0xa4f
        cer_camo_base_06_mp_coslo723, // 0xa50
        cer_camo_base_06_mp_droger, // 0xa51
        cer_camo_base_06_mp_falove, // 0xa52
        cer_camo_base_06_mp_geasy9, // 0xa53
        cer_camo_base_06_mp_knife, // 0xa54
        cer_camo_base_06_mp_ksugar58, // 0xa55
        cer_camo_base_06_mp_love85, // 0xa56
        cer_camo_base_06_mp_love96, // 0xa57
        cer_camo_base_06_mp_mable, // 0xa58
        cer_camo_base_06_mp_moslo500, // 0xa59
        cer_camo_base_06_mp_pable3, // 0xa5a
        cer_camo_base_06_mp_paris30, // 0xa5b
        cer_camo_base_06_mp_pparis90, // 0xa5c
        cer_camo_base_06_mp_puncle21, // 0xa5d
        cer_camo_base_06_mp_rmary2, // 0xa5e
        cer_camo_base_06_mp_roger31, // 0xa5f
        cer_camo_base_06_mp_safox, // 0xa60
        cer_camo_base_06_mp_sgeorge550, // 0xa61
        cer_camo_base_06_mp_sroger25, // 0xa62
        cer_camo_base_06_mp_sroger3, // 0xa63
        cer_camo_base_06_mp_stiger, // 0xa64
        cer_camo_base_06_mp_stisaac, // 0xa65
        cer_camo_base_06_mp_svalor, // 0xa66
        cer_camo_base_06_mp_ultiger, // 0xa67
        cer_camo_base_06_mp_uncle12, // 0xa68
        cer_camo_base_06_mp_usugar9, // 0xa69
        cer_camo_base_06_wz_able18, // 0xa6a
        cer_camo_base_06_wz_aeasy, // 0xa6b
        cer_camo_base_06_wz_aking74, // 0xa6c
        cer_camo_base_06_wz_aroger10, // 0xa6d
        cer_camo_base_06_wz_asvalor, // 0xa6e
        cer_camo_base_06_wz_bat, // 0xa6f
        cer_camo_base_06_wz_chuck9, // 0xa70
        cer_camo_base_06_wz_clove, // 0xa71
        cer_camo_base_06_wz_coslo723, // 0xa72
        cer_camo_base_06_wz_droger, // 0xa73
        cer_camo_base_06_wz_falove, // 0xa74
        cer_camo_base_06_wz_geasy9, // 0xa75
        cer_camo_base_06_wz_knife, // 0xa76
        cer_camo_base_06_wz_ksugar58, // 0xa77
        cer_camo_base_06_wz_love85, // 0xa78
        cer_camo_base_06_wz_love96, // 0xa79
        cer_camo_base_06_wz_mable, // 0xa7a
        cer_camo_base_06_wz_moslo500, // 0xa7b
        cer_camo_base_06_wz_pable3, // 0xa7c
        cer_camo_base_06_wz_paris30, // 0xa7d
        cer_camo_base_06_wz_pparis90, // 0xa7e
        cer_camo_base_06_wz_puncle21, // 0xa7f
        cer_camo_base_06_wz_rmary2, // 0xa80
        cer_camo_base_06_wz_roger31, // 0xa81
        cer_camo_base_06_wz_safox, // 0xa82
        cer_camo_base_06_wz_sgeorge550, // 0xa83
        cer_camo_base_06_wz_sroger25, // 0xa84
        cer_camo_base_06_wz_sroger3, // 0xa85
        cer_camo_base_06_wz_stiger, // 0xa86
        cer_camo_base_06_wz_stisaac, // 0xa87
        cer_camo_base_06_wz_svalor, // 0xa88
        cer_camo_base_06_wz_ultiger, // 0xa89
        cer_camo_base_06_wz_uncle12, // 0xa8a
        cer_camo_base_06_wz_usugar9, // 0xa8b
        cer_camo_base_06_zm_able18, // 0xa8c
        cer_camo_base_06_zm_aeasy, // 0xa8d
        cer_camo_base_06_zm_aking74, // 0xa8e
        cer_camo_base_06_zm_aroger10, // 0xa8f
        cer_camo_base_06_zm_asvalor, // 0xa90
        cer_camo_base_06_zm_bat, // 0xa91
        cer_camo_base_06_zm_chuck9, // 0xa92
        cer_camo_base_06_zm_clove, // 0xa93
        cer_camo_base_06_zm_coslo723, // 0xa94
        cer_camo_base_06_zm_droger, // 0xa95
        cer_camo_base_06_zm_falove, // 0xa96
        cer_camo_base_06_zm_geasy9, // 0xa97
        cer_camo_base_06_zm_knife, // 0xa98
        cer_camo_base_06_zm_ksugar58, // 0xa99
        cer_camo_base_06_zm_love85, // 0xa9a
        cer_camo_base_06_zm_love96, // 0xa9b
        cer_camo_base_06_zm_mable, // 0xa9c
        cer_camo_base_06_zm_moslo500, // 0xa9d
        cer_camo_base_06_zm_pable3, // 0xa9e
        cer_camo_base_06_zm_paris30, // 0xa9f
        cer_camo_base_06_zm_pparis90, // 0xaa0
        cer_camo_base_06_zm_puncle21, // 0xaa1
        cer_camo_base_06_zm_rmary2, // 0xaa2
        cer_camo_base_06_zm_roger31, // 0xaa3
        cer_camo_base_06_zm_safox, // 0xaa4
        cer_camo_base_06_zm_sgeorge550, // 0xaa5
        cer_camo_base_06_zm_sroger25, // 0xaa6
        cer_camo_base_06_zm_sroger3, // 0xaa7
        cer_camo_base_06_zm_stiger, // 0xaa8
        cer_camo_base_06_zm_stisaac, // 0xaa9
        cer_camo_base_06_zm_svalor, // 0xaaa
        cer_camo_base_06_zm_ultiger, // 0xaab
        cer_camo_base_06_zm_uncle12, // 0xaac
        cer_camo_base_06_zm_usugar9, // 0xaad
        cer_camo_base_07_mp_able18, // 0xaae
        cer_camo_base_07_mp_aeasy, // 0xaaf
        cer_camo_base_07_mp_aking74, // 0xab0
        cer_camo_base_07_mp_aroger10, // 0xab1
        cer_camo_base_07_mp_asvalor, // 0xab2
        cer_camo_base_07_mp_bat, // 0xab3
        cer_camo_base_07_mp_chuck9, // 0xab4
        cer_camo_base_07_mp_clove, // 0xab5
        cer_camo_base_07_mp_coslo723, // 0xab6
        cer_camo_base_07_mp_droger, // 0xab7
        cer_camo_base_07_mp_falove, // 0xab8
        cer_camo_base_07_mp_geasy9, // 0xab9
        cer_camo_base_07_mp_knife, // 0xaba
        cer_camo_base_07_mp_ksugar58, // 0xabb
        cer_camo_base_07_mp_love85, // 0xabc
        cer_camo_base_07_mp_love96, // 0xabd
        cer_camo_base_07_mp_mable, // 0xabe
        cer_camo_base_07_mp_moslo500, // 0xabf
        cer_camo_base_07_mp_pable3, // 0xac0
        cer_camo_base_07_mp_paris30, // 0xac1
        cer_camo_base_07_mp_pparis90, // 0xac2
        cer_camo_base_07_mp_puncle21, // 0xac3
        cer_camo_base_07_mp_rmary2, // 0xac4
        cer_camo_base_07_mp_roger31, // 0xac5
        cer_camo_base_07_mp_safox, // 0xac6
        cer_camo_base_07_mp_sgeorge550, // 0xac7
        cer_camo_base_07_mp_sroger25, // 0xac8
        cer_camo_base_07_mp_sroger3, // 0xac9
        cer_camo_base_07_mp_stiger, // 0xaca
        cer_camo_base_07_mp_stisaac, // 0xacb
        cer_camo_base_07_mp_svalor, // 0xacc
        cer_camo_base_07_mp_ultiger, // 0xacd
        cer_camo_base_07_mp_uncle12, // 0xace
        cer_camo_base_07_mp_usugar9, // 0xacf
        cer_camo_base_07_wz_able18, // 0xad0
        cer_camo_base_07_wz_aeasy, // 0xad1
        cer_camo_base_07_wz_aking74, // 0xad2
        cer_camo_base_07_wz_aroger10, // 0xad3
        cer_camo_base_07_wz_asvalor, // 0xad4
        cer_camo_base_07_wz_bat, // 0xad5
        cer_camo_base_07_wz_chuck9, // 0xad6
        cer_camo_base_07_wz_clove, // 0xad7
        cer_camo_base_07_wz_coslo723, // 0xad8
        cer_camo_base_07_wz_droger, // 0xad9
        cer_camo_base_07_wz_falove, // 0xada
        cer_camo_base_07_wz_geasy9, // 0xadb
        cer_camo_base_07_wz_knife, // 0xadc
        cer_camo_base_07_wz_ksugar58, // 0xadd
        cer_camo_base_07_wz_love85, // 0xade
        cer_camo_base_07_wz_love96, // 0xadf
        cer_camo_base_07_wz_mable, // 0xae0
        cer_camo_base_07_wz_moslo500, // 0xae1
        cer_camo_base_07_wz_pable3, // 0xae2
        cer_camo_base_07_wz_paris30, // 0xae3
        cer_camo_base_07_wz_pparis90, // 0xae4
        cer_camo_base_07_wz_puncle21, // 0xae5
        cer_camo_base_07_wz_rmary2, // 0xae6
        cer_camo_base_07_wz_roger31, // 0xae7
        cer_camo_base_07_wz_safox, // 0xae8
        cer_camo_base_07_wz_sgeorge550, // 0xae9
        cer_camo_base_07_wz_sroger25, // 0xaea
        cer_camo_base_07_wz_sroger3, // 0xaeb
        cer_camo_base_07_wz_stiger, // 0xaec
        cer_camo_base_07_wz_stisaac, // 0xaed
        cer_camo_base_07_wz_svalor, // 0xaee
        cer_camo_base_07_wz_ultiger, // 0xaef
        cer_camo_base_07_wz_uncle12, // 0xaf0
        cer_camo_base_07_wz_usugar9, // 0xaf1
        cer_camo_base_07_zm_able18, // 0xaf2
        cer_camo_base_07_zm_aeasy, // 0xaf3
        cer_camo_base_07_zm_aking74, // 0xaf4
        cer_camo_base_07_zm_aroger10, // 0xaf5
        cer_camo_base_07_zm_asvalor, // 0xaf6
        cer_camo_base_07_zm_bat, // 0xaf7
        cer_camo_base_07_zm_chuck9, // 0xaf8
        cer_camo_base_07_zm_clove, // 0xaf9
        cer_camo_base_07_zm_coslo723, // 0xafa
        cer_camo_base_07_zm_droger, // 0xafb
        cer_camo_base_07_zm_falove, // 0xafc
        cer_camo_base_07_zm_geasy9, // 0xafd
        cer_camo_base_07_zm_knife, // 0xafe
        cer_camo_base_07_zm_ksugar58, // 0xaff
        cer_camo_base_07_zm_love85, // 0xb00
        cer_camo_base_07_zm_love96, // 0xb01
        cer_camo_base_07_zm_mable, // 0xb02
        cer_camo_base_07_zm_moslo500, // 0xb03
        cer_camo_base_07_zm_pable3, // 0xb04
        cer_camo_base_07_zm_paris30, // 0xb05
        cer_camo_base_07_zm_pparis90, // 0xb06
        cer_camo_base_07_zm_puncle21, // 0xb07
        cer_camo_base_07_zm_rmary2, // 0xb08
        cer_camo_base_07_zm_roger31, // 0xb09
        cer_camo_base_07_zm_safox, // 0xb0a
        cer_camo_base_07_zm_sgeorge550, // 0xb0b
        cer_camo_base_07_zm_sroger25, // 0xb0c
        cer_camo_base_07_zm_sroger3, // 0xb0d
        cer_camo_base_07_zm_stiger, // 0xb0e
        cer_camo_base_07_zm_stisaac, // 0xb0f
        cer_camo_base_07_zm_svalor, // 0xb10
        cer_camo_base_07_zm_ultiger, // 0xb11
        cer_camo_base_07_zm_uncle12, // 0xb12
        cer_camo_base_07_zm_usugar9, // 0xb13
        cer_camo_base_08_mp_able18, // 0xb14
        cer_camo_base_08_mp_aeasy, // 0xb15
        cer_camo_base_08_mp_aking74, // 0xb16
        cer_camo_base_08_mp_aroger10, // 0xb17
        cer_camo_base_08_mp_asvalor, // 0xb18
        cer_camo_base_08_mp_bat, // 0xb19
        cer_camo_base_08_mp_chuck9, // 0xb1a
        cer_camo_base_08_mp_clove, // 0xb1b
        cer_camo_base_08_mp_coslo723, // 0xb1c
        cer_camo_base_08_mp_droger, // 0xb1d
        cer_camo_base_08_mp_falove, // 0xb1e
        cer_camo_base_08_mp_geasy9, // 0xb1f
        cer_camo_base_08_mp_knife, // 0xb20
        cer_camo_base_08_mp_ksugar58, // 0xb21
        cer_camo_base_08_mp_love85, // 0xb22
        cer_camo_base_08_mp_love96, // 0xb23
        cer_camo_base_08_mp_mable, // 0xb24
        cer_camo_base_08_mp_moslo500, // 0xb25
        cer_camo_base_08_mp_pable3, // 0xb26
        cer_camo_base_08_mp_paris30, // 0xb27
        cer_camo_base_08_mp_pparis90, // 0xb28
        cer_camo_base_08_mp_puncle21, // 0xb29
        cer_camo_base_08_mp_rmary2, // 0xb2a
        cer_camo_base_08_mp_roger31, // 0xb2b
        cer_camo_base_08_mp_safox, // 0xb2c
        cer_camo_base_08_mp_sgeorge550, // 0xb2d
        cer_camo_base_08_mp_sroger25, // 0xb2e
        cer_camo_base_08_mp_sroger3, // 0xb2f
        cer_camo_base_08_mp_stiger, // 0xb30
        cer_camo_base_08_mp_stisaac, // 0xb31
        cer_camo_base_08_mp_svalor, // 0xb32
        cer_camo_base_08_mp_ultiger, // 0xb33
        cer_camo_base_08_mp_uncle12, // 0xb34
        cer_camo_base_08_mp_usugar9, // 0xb35
        cer_camo_base_08_wz_able18, // 0xb36
        cer_camo_base_08_wz_aeasy, // 0xb37
        cer_camo_base_08_wz_aking74, // 0xb38
        cer_camo_base_08_wz_aroger10, // 0xb39
        cer_camo_base_08_wz_asvalor, // 0xb3a
        cer_camo_base_08_wz_bat, // 0xb3b
        cer_camo_base_08_wz_chuck9, // 0xb3c
        cer_camo_base_08_wz_clove, // 0xb3d
        cer_camo_base_08_wz_coslo723, // 0xb3e
        cer_camo_base_08_wz_droger, // 0xb3f
        cer_camo_base_08_wz_falove, // 0xb40
        cer_camo_base_08_wz_geasy9, // 0xb41
        cer_camo_base_08_wz_knife, // 0xb42
        cer_camo_base_08_wz_ksugar58, // 0xb43
        cer_camo_base_08_wz_love85, // 0xb44
        cer_camo_base_08_wz_love96, // 0xb45
        cer_camo_base_08_wz_mable, // 0xb46
        cer_camo_base_08_wz_moslo500, // 0xb47
        cer_camo_base_08_wz_pable3, // 0xb48
        cer_camo_base_08_wz_paris30, // 0xb49
        cer_camo_base_08_wz_pparis90, // 0xb4a
        cer_camo_base_08_wz_puncle21, // 0xb4b
        cer_camo_base_08_wz_rmary2, // 0xb4c
        cer_camo_base_08_wz_roger31, // 0xb4d
        cer_camo_base_08_wz_safox, // 0xb4e
        cer_camo_base_08_wz_sgeorge550, // 0xb4f
        cer_camo_base_08_wz_sroger25, // 0xb50
        cer_camo_base_08_wz_sroger3, // 0xb51
        cer_camo_base_08_wz_stiger, // 0xb52
        cer_camo_base_08_wz_stisaac, // 0xb53
        cer_camo_base_08_wz_svalor, // 0xb54
        cer_camo_base_08_wz_ultiger, // 0xb55
        cer_camo_base_08_wz_uncle12, // 0xb56
        cer_camo_base_08_wz_usugar9, // 0xb57
        cer_camo_base_08_zm_able18, // 0xb58
        cer_camo_base_08_zm_aeasy, // 0xb59
        cer_camo_base_08_zm_aking74, // 0xb5a
        cer_camo_base_08_zm_aroger10, // 0xb5b
        cer_camo_base_08_zm_asvalor, // 0xb5c
        cer_camo_base_08_zm_bat, // 0xb5d
        cer_camo_base_08_zm_chuck9, // 0xb5e
        cer_camo_base_08_zm_clove, // 0xb5f
        cer_camo_base_08_zm_coslo723, // 0xb60
        cer_camo_base_08_zm_droger, // 0xb61
        cer_camo_base_08_zm_falove, // 0xb62
        cer_camo_base_08_zm_geasy9, // 0xb63
        cer_camo_base_08_zm_knife, // 0xb64
        cer_camo_base_08_zm_ksugar58, // 0xb65
        cer_camo_base_08_zm_love85, // 0xb66
        cer_camo_base_08_zm_love96, // 0xb67
        cer_camo_base_08_zm_mable, // 0xb68
        cer_camo_base_08_zm_moslo500, // 0xb69
        cer_camo_base_08_zm_pable3, // 0xb6a
        cer_camo_base_08_zm_paris30, // 0xb6b
        cer_camo_base_08_zm_pparis90, // 0xb6c
        cer_camo_base_08_zm_puncle21, // 0xb6d
        cer_camo_base_08_zm_rmary2, // 0xb6e
        cer_camo_base_08_zm_roger31, // 0xb6f
        cer_camo_base_08_zm_safox, // 0xb70
        cer_camo_base_08_zm_sgeorge550, // 0xb71
        cer_camo_base_08_zm_sroger25, // 0xb72
        cer_camo_base_08_zm_sroger3, // 0xb73
        cer_camo_base_08_zm_stiger, // 0xb74
        cer_camo_base_08_zm_stisaac, // 0xb75
        cer_camo_base_08_zm_svalor, // 0xb76
        cer_camo_base_08_zm_ultiger, // 0xb77
        cer_camo_base_08_zm_uncle12, // 0xb78
        cer_camo_base_08_zm_usugar9, // 0xb79
        cer_camo_base_09_mp_able18, // 0xb7a
        cer_camo_base_09_mp_aeasy, // 0xb7b
        cer_camo_base_09_mp_aking74, // 0xb7c
        cer_camo_base_09_mp_aroger10, // 0xb7d
        cer_camo_base_09_mp_asvalor, // 0xb7e
        cer_camo_base_09_mp_bat, // 0xb7f
        cer_camo_base_09_mp_chuck9, // 0xb80
        cer_camo_base_09_mp_clove, // 0xb81
        cer_camo_base_09_mp_coslo723, // 0xb82
        cer_camo_base_09_mp_droger, // 0xb83
        cer_camo_base_09_mp_falove, // 0xb84
        cer_camo_base_09_mp_geasy9, // 0xb85
        cer_camo_base_09_mp_knife, // 0xb86
        cer_camo_base_09_mp_ksugar58, // 0xb87
        cer_camo_base_09_mp_love85, // 0xb88
        cer_camo_base_09_mp_love96, // 0xb89
        cer_camo_base_09_mp_mable, // 0xb8a
        cer_camo_base_09_mp_moslo500, // 0xb8b
        cer_camo_base_09_mp_pable3, // 0xb8c
        cer_camo_base_09_mp_paris30, // 0xb8d
        cer_camo_base_09_mp_pparis90, // 0xb8e
        cer_camo_base_09_mp_puncle21, // 0xb8f
        cer_camo_base_09_mp_rmary2, // 0xb90
        cer_camo_base_09_mp_roger31, // 0xb91
        cer_camo_base_09_mp_safox, // 0xb92
        cer_camo_base_09_mp_sgeorge550, // 0xb93
        cer_camo_base_09_mp_sroger25, // 0xb94
        cer_camo_base_09_mp_sroger3, // 0xb95
        cer_camo_base_09_mp_stiger, // 0xb96
        cer_camo_base_09_mp_stisaac, // 0xb97
        cer_camo_base_09_mp_svalor, // 0xb98
        cer_camo_base_09_mp_ultiger, // 0xb99
        cer_camo_base_09_mp_uncle12, // 0xb9a
        cer_camo_base_09_mp_usugar9, // 0xb9b
        cer_camo_base_09_wz_able18, // 0xb9c
        cer_camo_base_09_wz_aeasy, // 0xb9d
        cer_camo_base_09_wz_aking74, // 0xb9e
        cer_camo_base_09_wz_aroger10, // 0xb9f
        cer_camo_base_09_wz_asvalor, // 0xba0
        cer_camo_base_09_wz_bat, // 0xba1
        cer_camo_base_09_wz_chuck9, // 0xba2
        cer_camo_base_09_wz_clove, // 0xba3
        cer_camo_base_09_wz_coslo723, // 0xba4
        cer_camo_base_09_wz_droger, // 0xba5
        cer_camo_base_09_wz_falove, // 0xba6
        cer_camo_base_09_wz_geasy9, // 0xba7
        cer_camo_base_09_wz_knife, // 0xba8
        cer_camo_base_09_wz_ksugar58, // 0xba9
        cer_camo_base_09_wz_love85, // 0xbaa
        cer_camo_base_09_wz_love96, // 0xbab
        cer_camo_base_09_wz_mable, // 0xbac
        cer_camo_base_09_wz_moslo500, // 0xbad
        cer_camo_base_09_wz_pable3, // 0xbae
        cer_camo_base_09_wz_paris30, // 0xbaf
        cer_camo_base_09_wz_pparis90, // 0xbb0
        cer_camo_base_09_wz_puncle21, // 0xbb1
        cer_camo_base_09_wz_rmary2, // 0xbb2
        cer_camo_base_09_wz_roger31, // 0xbb3
        cer_camo_base_09_wz_safox, // 0xbb4
        cer_camo_base_09_wz_sgeorge550, // 0xbb5
        cer_camo_base_09_wz_sroger25, // 0xbb6
        cer_camo_base_09_wz_sroger3, // 0xbb7
        cer_camo_base_09_wz_stiger, // 0xbb8
        cer_camo_base_09_wz_stisaac, // 0xbb9
        cer_camo_base_09_wz_svalor, // 0xbba
        cer_camo_base_09_wz_ultiger, // 0xbbb
        cer_camo_base_09_wz_uncle12, // 0xbbc
        cer_camo_base_09_wz_usugar9, // 0xbbd
        cer_camo_base_09_zm_able18, // 0xbbe
        cer_camo_base_09_zm_aeasy, // 0xbbf
        cer_camo_base_09_zm_aking74, // 0xbc0
        cer_camo_base_09_zm_aroger10, // 0xbc1
        cer_camo_base_09_zm_asvalor, // 0xbc2
        cer_camo_base_09_zm_bat, // 0xbc3
        cer_camo_base_09_zm_chuck9, // 0xbc4
        cer_camo_base_09_zm_clove, // 0xbc5
        cer_camo_base_09_zm_coslo723, // 0xbc6
        cer_camo_base_09_zm_droger, // 0xbc7
        cer_camo_base_09_zm_falove, // 0xbc8
        cer_camo_base_09_zm_geasy9, // 0xbc9
        cer_camo_base_09_zm_knife, // 0xbca
        cer_camo_base_09_zm_ksugar58, // 0xbcb
        cer_camo_base_09_zm_love85, // 0xbcc
        cer_camo_base_09_zm_love96, // 0xbcd
        cer_camo_base_09_zm_mable, // 0xbce
        cer_camo_base_09_zm_moslo500, // 0xbcf
        cer_camo_base_09_zm_pable3, // 0xbd0
        cer_camo_base_09_zm_paris30, // 0xbd1
        cer_camo_base_09_zm_pparis90, // 0xbd2
        cer_camo_base_09_zm_puncle21, // 0xbd3
        cer_camo_base_09_zm_rmary2, // 0xbd4
        cer_camo_base_09_zm_roger31, // 0xbd5
        cer_camo_base_09_zm_safox, // 0xbd6
        cer_camo_base_09_zm_sgeorge550, // 0xbd7
        cer_camo_base_09_zm_sroger25, // 0xbd8
        cer_camo_base_09_zm_sroger3, // 0xbd9
        cer_camo_base_09_zm_stiger, // 0xbda
        cer_camo_base_09_zm_stisaac, // 0xbdb
        cer_camo_base_09_zm_svalor, // 0xbdc
        cer_camo_base_09_zm_ultiger, // 0xbdd
        cer_camo_base_09_zm_uncle12, // 0xbde
        cer_camo_base_09_zm_usugar9, // 0xbdf
        cer_camo_base_01_mp_cleaver, // 0xbe0
        cer_camo_base_01_mp_drill, // 0xbe1
        cer_camo_base_01_mp_fable, // 0xbe2
        cer_camo_base_01_mp_goslo, // 0xbe3
        cer_camo_base_01_mp_jhavana, // 0xbe4
        cer_camo_base_01_mp_mary82, // 0xbe5
        cer_camo_base_01_mp_saug, // 0xbe6
        cer_camo_base_01_mp_perth, // 0xbe7
        cer_camo_base_01_mp_uxray, // 0xbe8
        cer_camo_base_01_mp_tbaker, // 0xbe9
        cer_camo_base_01_mp_blauncher, // 0xbea
        cer_camo_base_01_mp_skateboard, // 0xbeb
        cer_camo_base_01_mp_bostaff, // 0xbec
        cer_camo_base_01_mp_katanas, // 0xbed
        cer_camo_base_01_mp_nunchaku, // 0xbee
        cer_camo_base_01_mp_sais, // 0xbef
        cer_camo_base_01_mp_gilroy, // 0xbf0
        cer_camo_base_01_mp_hugo, // 0xbf1
        cer_camo_base_01_mp_keene, // 0xbf2
        cer_camo_base_01_mp_kent, // 0xbf3
        cer_camo_base_01_mp_pyork, // 0xbf4
        cer_camo_base_01_mp_schuck, // 0xbf5
        cer_camo_base_01_mp_napa, // 0xbf6
        cer_camo_base_01_mp_erie, // 0xbf7
        cer_camo_base_01_mp_fresno, // 0xbf8
        cer_camo_base_01_mp_lisbon, // 0xbf9
        cer_camo_base_01_mp_olove, // 0xbfa
        cer_camo_base_01_mp_pickaxe, // 0xbfb
        cer_camo_base_01_mp_aspen, // 0xbfc
        cer_camo_base_01_mp_mesa, // 0xbfd
        cer_camo_base_01_mp_bgloves, // 0xbfe
        cer_camo_base_01_mp_csaw, // 0xbff
        cer_camo_base_01_mp_milan, // 0xc00
        cer_camo_base_01_mp_mpug40, // 0xc01
        cer_camo_base_01_mp_wand, // 0xc02
        cer_camo_base_01_wz_cleaver, // 0xc03
        cer_camo_base_01_wz_drill, // 0xc04
        cer_camo_base_01_wz_fable, // 0xc05
        cer_camo_base_01_wz_goslo, // 0xc06
        cer_camo_base_01_wz_jhavana, // 0xc07
        cer_camo_base_01_wz_mary82, // 0xc08
        cer_camo_base_01_wz_saug, // 0xc09
        cer_camo_base_01_wz_perth, // 0xc0a
        cer_camo_base_01_wz_uxray, // 0xc0b
        cer_camo_base_01_wz_tbaker, // 0xc0c
        cer_camo_base_01_wz_blauncher, // 0xc0d
        cer_camo_base_01_wz_skateboard, // 0xc0e
        cer_camo_base_01_wz_bostaff, // 0xc0f
        cer_camo_base_01_wz_katanas, // 0xc10
        cer_camo_base_01_wz_nunchaku, // 0xc11
        cer_camo_base_01_wz_sais, // 0xc12
        cer_camo_base_01_wz_gilroy, // 0xc13
        cer_camo_base_01_wz_hugo, // 0xc14
        cer_camo_base_01_wz_keene, // 0xc15
        cer_camo_base_01_wz_kent, // 0xc16
        cer_camo_base_01_wz_pyork, // 0xc17
        cer_camo_base_01_wz_schuck, // 0xc18
        cer_camo_base_01_wz_napa, // 0xc19
        cer_camo_base_01_wz_erie, // 0xc1a
        cer_camo_base_01_wz_fresno, // 0xc1b
        cer_camo_base_01_wz_lisbon, // 0xc1c
        cer_camo_base_01_wz_olove, // 0xc1d
        cer_camo_base_01_wz_pickaxe, // 0xc1e
        cer_camo_base_01_wz_aspen, // 0xc1f
        cer_camo_base_01_wz_mesa, // 0xc20
        cer_camo_base_01_wz_bgloves, // 0xc21
        cer_camo_base_01_wz_csaw, // 0xc22
        cer_camo_base_01_wz_milan, // 0xc23
        cer_camo_base_01_wz_mpug40, // 0xc24
        cer_camo_base_01_wz_wand, // 0xc25
        cer_camo_base_01_zm_cleaver, // 0xc26
        cer_camo_base_01_zm_drill, // 0xc27
        cer_camo_base_01_zm_fable, // 0xc28
        cer_camo_base_01_zm_goslo, // 0xc29
        cer_camo_base_01_zm_jhavana, // 0xc2a
        cer_camo_base_01_zm_mary82, // 0xc2b
        cer_camo_base_01_zm_saug, // 0xc2c
        cer_camo_base_01_zm_perth, // 0xc2d
        cer_camo_base_01_zm_uxray, // 0xc2e
        cer_camo_base_01_zm_tbaker, // 0xc2f
        cer_camo_base_01_zm_blauncher, // 0xc30
        cer_camo_base_01_zm_skateboard, // 0xc31
        cer_camo_base_01_zm_bostaff, // 0xc32
        cer_camo_base_01_zm_katanas, // 0xc33
        cer_camo_base_01_zm_nunchaku, // 0xc34
        cer_camo_base_01_zm_sais, // 0xc35
        cer_camo_base_01_zm_gilroy, // 0xc36
        cer_camo_base_01_zm_hugo, // 0xc37
        cer_camo_base_01_zm_keene, // 0xc38
        cer_camo_base_01_zm_kent, // 0xc39
        cer_camo_base_01_zm_pyork, // 0xc3a
        cer_camo_base_01_zm_schuck, // 0xc3b
        cer_camo_base_01_zm_napa, // 0xc3c
        cer_camo_base_01_zm_erie, // 0xc3d
        cer_camo_base_01_zm_fresno, // 0xc3e
        cer_camo_base_01_zm_lisbon, // 0xc3f
        cer_camo_base_01_zm_olove, // 0xc40
        cer_camo_base_01_zm_pickaxe, // 0xc41
        cer_camo_base_01_zm_aspen, // 0xc42
        cer_camo_base_01_zm_mesa, // 0xc43
        cer_camo_base_01_zm_bgloves, // 0xc44
        cer_camo_base_01_zm_csaw, // 0xc45
        cer_camo_base_01_zm_milan, // 0xc46
        cer_camo_base_01_zm_mpug40, // 0xc47
        cer_camo_base_01_zm_wand, // 0xc48
        cer_camo_base_02_mp_cleaver, // 0xc49
        cer_camo_base_02_mp_drill, // 0xc4a
        cer_camo_base_02_mp_fable, // 0xc4b
        cer_camo_base_02_mp_goslo, // 0xc4c
        cer_camo_base_02_mp_jhavana, // 0xc4d
        cer_camo_base_02_mp_mary82, // 0xc4e
        cer_camo_base_02_mp_saug, // 0xc4f
        cer_camo_base_02_mp_perth, // 0xc50
        cer_camo_base_02_mp_uxray, // 0xc51
        cer_camo_base_02_mp_tbaker, // 0xc52
        cer_camo_base_02_mp_blauncher, // 0xc53
        cer_camo_base_02_mp_skateboard, // 0xc54
        cer_camo_base_02_mp_bostaff, // 0xc55
        cer_camo_base_02_mp_katanas, // 0xc56
        cer_camo_base_02_mp_nunchaku, // 0xc57
        cer_camo_base_02_mp_sais, // 0xc58
        cer_camo_base_02_mp_gilroy, // 0xc59
        cer_camo_base_02_mp_hugo, // 0xc5a
        cer_camo_base_02_mp_keene, // 0xc5b
        cer_camo_base_02_mp_kent, // 0xc5c
        cer_camo_base_02_mp_pyork, // 0xc5d
        cer_camo_base_02_mp_schuck, // 0xc5e
        cer_camo_base_02_mp_napa, // 0xc5f
        cer_camo_base_02_mp_erie, // 0xc60
        cer_camo_base_02_mp_fresno, // 0xc61
        cer_camo_base_02_mp_lisbon, // 0xc62
        cer_camo_base_02_mp_olove, // 0xc63
        cer_camo_base_02_mp_pickaxe, // 0xc64
        cer_camo_base_02_mp_aspen, // 0xc65
        cer_camo_base_02_mp_mesa, // 0xc66
        cer_camo_base_02_mp_bgloves, // 0xc67
        cer_camo_base_02_mp_csaw, // 0xc68
        cer_camo_base_02_mp_milan, // 0xc69
        cer_camo_base_02_mp_mpug40, // 0xc6a
        cer_camo_base_02_mp_wand, // 0xc6b
        cer_camo_base_02_wz_cleaver, // 0xc6c
        cer_camo_base_02_wz_drill, // 0xc6d
        cer_camo_base_02_wz_fable, // 0xc6e
        cer_camo_base_02_wz_goslo, // 0xc6f
        cer_camo_base_02_wz_jhavana, // 0xc70
        cer_camo_base_02_wz_mary82, // 0xc71
        cer_camo_base_02_wz_saug, // 0xc72
        cer_camo_base_02_wz_perth, // 0xc73
        cer_camo_base_02_wz_uxray, // 0xc74
        cer_camo_base_02_wz_tbaker, // 0xc75
        cer_camo_base_02_wz_blauncher, // 0xc76
        cer_camo_base_02_wz_skateboard, // 0xc77
        cer_camo_base_02_wz_bostaff, // 0xc78
        cer_camo_base_02_wz_katanas, // 0xc79
        cer_camo_base_02_wz_nunchaku, // 0xc7a
        cer_camo_base_02_wz_sais, // 0xc7b
        cer_camo_base_02_wz_gilroy, // 0xc7c
        cer_camo_base_02_wz_hugo, // 0xc7d
        cer_camo_base_02_wz_keene, // 0xc7e
        cer_camo_base_02_wz_kent, // 0xc7f
        cer_camo_base_02_wz_pyork, // 0xc80
        cer_camo_base_02_wz_schuck, // 0xc81
        cer_camo_base_02_wz_napa, // 0xc82
        cer_camo_base_02_wz_erie, // 0xc83
        cer_camo_base_02_wz_fresno, // 0xc84
        cer_camo_base_02_wz_lisbon, // 0xc85
        cer_camo_base_02_wz_olove, // 0xc86
        cer_camo_base_02_wz_pickaxe, // 0xc87
        cer_camo_base_02_wz_aspen, // 0xc88
        cer_camo_base_02_wz_mesa, // 0xc89
        cer_camo_base_02_wz_bgloves, // 0xc8a
        cer_camo_base_02_wz_csaw, // 0xc8b
        cer_camo_base_02_wz_milan, // 0xc8c
        cer_camo_base_02_wz_mpug40, // 0xc8d
        cer_camo_base_02_wz_wand, // 0xc8e
        cer_camo_base_02_zm_cleaver, // 0xc8f
        cer_camo_base_02_zm_drill, // 0xc90
        cer_camo_base_02_zm_fable, // 0xc91
        cer_camo_base_02_zm_goslo, // 0xc92
        cer_camo_base_02_zm_jhavana, // 0xc93
        cer_camo_base_02_zm_mary82, // 0xc94
        cer_camo_base_02_zm_saug, // 0xc95
        cer_camo_base_02_zm_perth, // 0xc96
        cer_camo_base_02_zm_uxray, // 0xc97
        cer_camo_base_02_zm_tbaker, // 0xc98
        cer_camo_base_02_zm_blauncher, // 0xc99
        cer_camo_base_02_zm_skateboard, // 0xc9a
        cer_camo_base_02_zm_bostaff, // 0xc9b
        cer_camo_base_02_zm_katanas, // 0xc9c
        cer_camo_base_02_zm_nunchaku, // 0xc9d
        cer_camo_base_02_zm_sais, // 0xc9e
        cer_camo_base_02_zm_gilroy, // 0xc9f
        cer_camo_base_02_zm_hugo, // 0xca0
        cer_camo_base_02_zm_keene, // 0xca1
        cer_camo_base_02_zm_kent, // 0xca2
        cer_camo_base_02_zm_pyork, // 0xca3
        cer_camo_base_02_zm_schuck, // 0xca4
        cer_camo_base_02_zm_napa, // 0xca5
        cer_camo_base_02_zm_erie, // 0xca6
        cer_camo_base_02_zm_fresno, // 0xca7
        cer_camo_base_02_zm_lisbon, // 0xca8
        cer_camo_base_02_zm_olove, // 0xca9
        cer_camo_base_02_zm_pickaxe, // 0xcaa
        cer_camo_base_02_zm_aspen, // 0xcab
        cer_camo_base_02_zm_mesa, // 0xcac
        cer_camo_base_02_zm_bgloves, // 0xcad
        cer_camo_base_02_zm_csaw, // 0xcae
        cer_camo_base_02_zm_milan, // 0xcaf
        cer_camo_base_02_zm_mpug40, // 0xcb0
        cer_camo_base_02_zm_wand, // 0xcb1
        cer_camo_base_03_mp_cleaver, // 0xcb2
        cer_camo_base_03_mp_drill, // 0xcb3
        cer_camo_base_03_mp_fable, // 0xcb4
        cer_camo_base_03_mp_goslo, // 0xcb5
        cer_camo_base_03_mp_jhavana, // 0xcb6
        cer_camo_base_03_mp_mary82, // 0xcb7
        cer_camo_base_03_mp_saug, // 0xcb8
        cer_camo_base_03_mp_perth, // 0xcb9
        cer_camo_base_03_mp_uxray, // 0xcba
        cer_camo_base_03_mp_tbaker, // 0xcbb
        cer_camo_base_03_mp_blauncher, // 0xcbc
        cer_camo_base_03_mp_skateboard, // 0xcbd
        cer_camo_base_03_mp_bostaff, // 0xcbe
        cer_camo_base_03_mp_katanas, // 0xcbf
        cer_camo_base_03_mp_nunchaku, // 0xcc0
        cer_camo_base_03_mp_sais, // 0xcc1
        cer_camo_base_03_mp_gilroy, // 0xcc2
        cer_camo_base_03_mp_hugo, // 0xcc3
        cer_camo_base_03_mp_keene, // 0xcc4
        cer_camo_base_03_mp_kent, // 0xcc5
        cer_camo_base_03_mp_pyork, // 0xcc6
        cer_camo_base_03_mp_schuck, // 0xcc7
        cer_camo_base_03_mp_napa, // 0xcc8
        cer_camo_base_03_mp_erie, // 0xcc9
        cer_camo_base_03_mp_fresno, // 0xcca
        cer_camo_base_03_mp_lisbon, // 0xccb
        cer_camo_base_03_mp_olove, // 0xccc
        cer_camo_base_03_mp_pickaxe, // 0xccd
        cer_camo_base_03_mp_aspen, // 0xcce
        cer_camo_base_03_mp_mesa, // 0xccf
        cer_camo_base_03_mp_bgloves, // 0xcd0
        cer_camo_base_03_mp_csaw, // 0xcd1
        cer_camo_base_03_mp_milan, // 0xcd2
        cer_camo_base_03_mp_mpug40, // 0xcd3
        cer_camo_base_03_mp_wand, // 0xcd4
        cer_camo_base_03_wz_cleaver, // 0xcd5
        cer_camo_base_03_wz_drill, // 0xcd6
        cer_camo_base_03_wz_fable, // 0xcd7
        cer_camo_base_03_wz_goslo, // 0xcd8
        cer_camo_base_03_wz_jhavana, // 0xcd9
        cer_camo_base_03_wz_mary82, // 0xcda
        cer_camo_base_03_wz_saug, // 0xcdb
        cer_camo_base_03_wz_perth, // 0xcdc
        cer_camo_base_03_wz_uxray, // 0xcdd
        cer_camo_base_03_wz_tbaker, // 0xcde
        cer_camo_base_03_wz_blauncher, // 0xcdf
        cer_camo_base_03_wz_skateboard, // 0xce0
        cer_camo_base_03_wz_bostaff, // 0xce1
        cer_camo_base_03_wz_katanas, // 0xce2
        cer_camo_base_03_wz_nunchaku, // 0xce3
        cer_camo_base_03_wz_sais, // 0xce4
        cer_camo_base_03_wz_gilroy, // 0xce5
        cer_camo_base_03_wz_hugo, // 0xce6
        cer_camo_base_03_wz_keene, // 0xce7
        cer_camo_base_03_wz_kent, // 0xce8
        cer_camo_base_03_wz_pyork, // 0xce9
        cer_camo_base_03_wz_schuck, // 0xcea
        cer_camo_base_03_wz_napa, // 0xceb
        cer_camo_base_03_wz_erie, // 0xcec
        cer_camo_base_03_wz_fresno, // 0xced
        cer_camo_base_03_wz_lisbon, // 0xcee
        cer_camo_base_03_wz_olove, // 0xcef
        cer_camo_base_03_wz_pickaxe, // 0xcf0
        cer_camo_base_03_wz_aspen, // 0xcf1
        cer_camo_base_03_wz_mesa, // 0xcf2
        cer_camo_base_03_wz_bgloves, // 0xcf3
        cer_camo_base_03_wz_csaw, // 0xcf4
        cer_camo_base_03_wz_milan, // 0xcf5
        cer_camo_base_03_wz_mpug40, // 0xcf6
        cer_camo_base_03_wz_wand, // 0xcf7
        cer_camo_base_03_zm_cleaver, // 0xcf8
        cer_camo_base_03_zm_drill, // 0xcf9
        cer_camo_base_03_zm_fable, // 0xcfa
        cer_camo_base_03_zm_goslo, // 0xcfb
        cer_camo_base_03_zm_jhavana, // 0xcfc
        cer_camo_base_03_zm_mary82, // 0xcfd
        cer_camo_base_03_zm_saug, // 0xcfe
        cer_camo_base_03_zm_perth, // 0xcff
        cer_camo_base_03_zm_uxray, // 0xd00
        cer_camo_base_03_zm_tbaker, // 0xd01
        cer_camo_base_03_zm_blauncher, // 0xd02
        cer_camo_base_03_zm_skateboard, // 0xd03
        cer_camo_base_03_zm_bostaff, // 0xd04
        cer_camo_base_03_zm_katanas, // 0xd05
        cer_camo_base_03_zm_nunchaku, // 0xd06
        cer_camo_base_03_zm_sais, // 0xd07
        cer_camo_base_03_zm_gilroy, // 0xd08
        cer_camo_base_03_zm_hugo, // 0xd09
        cer_camo_base_03_zm_keene, // 0xd0a
        cer_camo_base_03_zm_kent, // 0xd0b
        cer_camo_base_03_zm_pyork, // 0xd0c
        cer_camo_base_03_zm_schuck, // 0xd0d
        cer_camo_base_03_zm_napa, // 0xd0e
        cer_camo_base_03_zm_erie, // 0xd0f
        cer_camo_base_03_zm_fresno, // 0xd10
        cer_camo_base_03_zm_lisbon, // 0xd11
        cer_camo_base_03_zm_olove, // 0xd12
        cer_camo_base_03_zm_pickaxe, // 0xd13
        cer_camo_base_03_zm_aspen, // 0xd14
        cer_camo_base_03_zm_mesa, // 0xd15
        cer_camo_base_03_zm_bgloves, // 0xd16
        cer_camo_base_03_zm_csaw, // 0xd17
        cer_camo_base_03_zm_milan, // 0xd18
        cer_camo_base_03_zm_mpug40, // 0xd19
        cer_camo_base_03_zm_wand, // 0xd1a
        cer_camo_base_04_mp_cleaver, // 0xd1b
        cer_camo_base_04_mp_drill, // 0xd1c
        cer_camo_base_04_mp_fable, // 0xd1d
        cer_camo_base_04_mp_goslo, // 0xd1e
        cer_camo_base_04_mp_jhavana, // 0xd1f
        cer_camo_base_04_mp_mary82, // 0xd20
        cer_camo_base_04_mp_saug, // 0xd21
        cer_camo_base_04_mp_perth, // 0xd22
        cer_camo_base_04_mp_uxray, // 0xd23
        cer_camo_base_04_mp_tbaker, // 0xd24
        cer_camo_base_04_mp_blauncher, // 0xd25
        cer_camo_base_04_mp_skateboard, // 0xd26
        cer_camo_base_04_mp_bostaff, // 0xd27
        cer_camo_base_04_mp_katanas, // 0xd28
        cer_camo_base_04_mp_nunchaku, // 0xd29
        cer_camo_base_04_mp_sais, // 0xd2a
        cer_camo_base_04_mp_gilroy, // 0xd2b
        cer_camo_base_04_mp_hugo, // 0xd2c
        cer_camo_base_04_mp_keene, // 0xd2d
        cer_camo_base_04_mp_kent, // 0xd2e
        cer_camo_base_04_mp_pyork, // 0xd2f
        cer_camo_base_04_mp_schuck, // 0xd30
        cer_camo_base_04_mp_napa, // 0xd31
        cer_camo_base_04_mp_erie, // 0xd32
        cer_camo_base_04_mp_fresno, // 0xd33
        cer_camo_base_04_mp_lisbon, // 0xd34
        cer_camo_base_04_mp_olove, // 0xd35
        cer_camo_base_04_mp_pickaxe, // 0xd36
        cer_camo_base_04_mp_aspen, // 0xd37
        cer_camo_base_04_mp_mesa, // 0xd38
        cer_camo_base_04_mp_bgloves, // 0xd39
        cer_camo_base_04_mp_csaw, // 0xd3a
        cer_camo_base_04_mp_milan, // 0xd3b
        cer_camo_base_04_mp_mpug40, // 0xd3c
        cer_camo_base_04_mp_wand, // 0xd3d
        cer_camo_base_04_wz_cleaver, // 0xd3e
        cer_camo_base_04_wz_drill, // 0xd3f
        cer_camo_base_04_wz_fable, // 0xd40
        cer_camo_base_04_wz_goslo, // 0xd41
        cer_camo_base_04_wz_jhavana, // 0xd42
        cer_camo_base_04_wz_mary82, // 0xd43
        cer_camo_base_04_wz_saug, // 0xd44
        cer_camo_base_04_wz_perth, // 0xd45
        cer_camo_base_04_wz_uxray, // 0xd46
        cer_camo_base_04_wz_tbaker, // 0xd47
        cer_camo_base_04_wz_blauncher, // 0xd48
        cer_camo_base_04_wz_skateboard, // 0xd49
        cer_camo_base_04_wz_bostaff, // 0xd4a
        cer_camo_base_04_wz_katanas, // 0xd4b
        cer_camo_base_04_wz_nunchaku, // 0xd4c
        cer_camo_base_04_wz_sais, // 0xd4d
        cer_camo_base_04_wz_gilroy, // 0xd4e
        cer_camo_base_04_wz_hugo, // 0xd4f
        cer_camo_base_04_wz_keene, // 0xd50
        cer_camo_base_04_wz_kent, // 0xd51
        cer_camo_base_04_wz_pyork, // 0xd52
        cer_camo_base_04_wz_schuck, // 0xd53
        cer_camo_base_04_wz_napa, // 0xd54
        cer_camo_base_04_wz_erie, // 0xd55
        cer_camo_base_04_wz_fresno, // 0xd56
        cer_camo_base_04_wz_lisbon, // 0xd57
        cer_camo_base_04_wz_olove, // 0xd58
        cer_camo_base_04_wz_pickaxe, // 0xd59
        cer_camo_base_04_wz_aspen, // 0xd5a
        cer_camo_base_04_wz_mesa, // 0xd5b
        cer_camo_base_04_wz_bgloves, // 0xd5c
        cer_camo_base_04_wz_csaw, // 0xd5d
        cer_camo_base_04_wz_milan, // 0xd5e
        cer_camo_base_04_wz_mpug40, // 0xd5f
        cer_camo_base_04_wz_wand, // 0xd60
        cer_camo_base_04_zm_cleaver, // 0xd61
        cer_camo_base_04_zm_drill, // 0xd62
        cer_camo_base_04_zm_fable, // 0xd63
        cer_camo_base_04_zm_goslo, // 0xd64
        cer_camo_base_04_zm_jhavana, // 0xd65
        cer_camo_base_04_zm_mary82, // 0xd66
        cer_camo_base_04_zm_saug, // 0xd67
        cer_camo_base_04_zm_perth, // 0xd68
        cer_camo_base_04_zm_uxray, // 0xd69
        cer_camo_base_04_zm_tbaker, // 0xd6a
        cer_camo_base_04_zm_blauncher, // 0xd6b
        cer_camo_base_04_zm_skateboard, // 0xd6c
        cer_camo_base_04_zm_bostaff, // 0xd6d
        cer_camo_base_04_zm_katanas, // 0xd6e
        cer_camo_base_04_zm_nunchaku, // 0xd6f
        cer_camo_base_04_zm_sais, // 0xd70
        cer_camo_base_04_zm_gilroy, // 0xd71
        cer_camo_base_04_zm_hugo, // 0xd72
        cer_camo_base_04_zm_keene, // 0xd73
        cer_camo_base_04_zm_kent, // 0xd74
        cer_camo_base_04_zm_pyork, // 0xd75
        cer_camo_base_04_zm_schuck, // 0xd76
        cer_camo_base_04_zm_napa, // 0xd77
        cer_camo_base_04_zm_erie, // 0xd78
        cer_camo_base_04_zm_fresno, // 0xd79
        cer_camo_base_04_zm_lisbon, // 0xd7a
        cer_camo_base_04_zm_olove, // 0xd7b
        cer_camo_base_04_zm_pickaxe, // 0xd7c
        cer_camo_base_04_zm_aspen, // 0xd7d
        cer_camo_base_04_zm_mesa, // 0xd7e
        cer_camo_base_04_zm_bgloves, // 0xd7f
        cer_camo_base_04_zm_csaw, // 0xd80
        cer_camo_base_04_zm_milan, // 0xd81
        cer_camo_base_04_zm_mpug40, // 0xd82
        cer_camo_base_04_zm_wand, // 0xd83
        cer_camo_base_05_mp_cleaver, // 0xd84
        cer_camo_base_05_mp_drill, // 0xd85
        cer_camo_base_05_mp_fable, // 0xd86
        cer_camo_base_05_mp_goslo, // 0xd87
        cer_camo_base_05_mp_jhavana, // 0xd88
        cer_camo_base_05_mp_mary82, // 0xd89
        cer_camo_base_05_mp_saug, // 0xd8a
        cer_camo_base_05_mp_perth, // 0xd8b
        cer_camo_base_05_mp_uxray, // 0xd8c
        cer_camo_base_05_mp_tbaker, // 0xd8d
        cer_camo_base_05_mp_blauncher, // 0xd8e
        cer_camo_base_05_mp_skateboard, // 0xd8f
        cer_camo_base_05_mp_bostaff, // 0xd90
        cer_camo_base_05_mp_katanas, // 0xd91
        cer_camo_base_05_mp_nunchaku, // 0xd92
        cer_camo_base_05_mp_sais, // 0xd93
        cer_camo_base_05_mp_gilroy, // 0xd94
        cer_camo_base_05_mp_hugo, // 0xd95
        cer_camo_base_05_mp_keene, // 0xd96
        cer_camo_base_05_mp_kent, // 0xd97
        cer_camo_base_05_mp_pyork, // 0xd98
        cer_camo_base_05_mp_schuck, // 0xd99
        cer_camo_base_05_mp_napa, // 0xd9a
        cer_camo_base_05_mp_erie, // 0xd9b
        cer_camo_base_05_mp_fresno, // 0xd9c
        cer_camo_base_05_mp_lisbon, // 0xd9d
        cer_camo_base_05_mp_olove, // 0xd9e
        cer_camo_base_05_mp_pickaxe, // 0xd9f
        cer_camo_base_05_mp_aspen, // 0xda0
        cer_camo_base_05_mp_mesa, // 0xda1
        cer_camo_base_05_mp_bgloves, // 0xda2
        cer_camo_base_05_mp_csaw, // 0xda3
        cer_camo_base_05_mp_milan, // 0xda4
        cer_camo_base_05_mp_mpug40, // 0xda5
        cer_camo_base_05_mp_wand, // 0xda6
        cer_camo_base_05_wz_cleaver, // 0xda7
        cer_camo_base_05_wz_drill, // 0xda8
        cer_camo_base_05_wz_fable, // 0xda9
        cer_camo_base_05_wz_goslo, // 0xdaa
        cer_camo_base_05_wz_jhavana, // 0xdab
        cer_camo_base_05_wz_mary82, // 0xdac
        cer_camo_base_05_wz_saug, // 0xdad
        cer_camo_base_05_wz_perth, // 0xdae
        cer_camo_base_05_wz_uxray, // 0xdaf
        cer_camo_base_05_wz_tbaker, // 0xdb0
        cer_camo_base_05_wz_blauncher, // 0xdb1
        cer_camo_base_05_wz_skateboard, // 0xdb2
        cer_camo_base_05_wz_bostaff, // 0xdb3
        cer_camo_base_05_wz_katanas, // 0xdb4
        cer_camo_base_05_wz_nunchaku, // 0xdb5
        cer_camo_base_05_wz_sais, // 0xdb6
        cer_camo_base_05_wz_gilroy, // 0xdb7
        cer_camo_base_05_wz_hugo, // 0xdb8
        cer_camo_base_05_wz_keene, // 0xdb9
        cer_camo_base_05_wz_kent, // 0xdba
        cer_camo_base_05_wz_pyork, // 0xdbb
        cer_camo_base_05_wz_schuck, // 0xdbc
        cer_camo_base_05_wz_napa, // 0xdbd
        cer_camo_base_05_wz_erie, // 0xdbe
        cer_camo_base_05_wz_fresno, // 0xdbf
        cer_camo_base_05_wz_lisbon, // 0xdc0
        cer_camo_base_05_wz_olove, // 0xdc1
        cer_camo_base_05_wz_pickaxe, // 0xdc2
        cer_camo_base_05_wz_aspen, // 0xdc3
        cer_camo_base_05_wz_mesa, // 0xdc4
        cer_camo_base_05_wz_bgloves, // 0xdc5
        cer_camo_base_05_wz_csaw, // 0xdc6
        cer_camo_base_05_wz_milan, // 0xdc7
        cer_camo_base_05_wz_mpug40, // 0xdc8
        cer_camo_base_05_wz_wand, // 0xdc9
        cer_camo_base_05_zm_cleaver, // 0xdca
        cer_camo_base_05_zm_drill, // 0xdcb
        cer_camo_base_05_zm_fable, // 0xdcc
        cer_camo_base_05_zm_goslo, // 0xdcd
        cer_camo_base_05_zm_jhavana, // 0xdce
        cer_camo_base_05_zm_mary82, // 0xdcf
        cer_camo_base_05_zm_saug, // 0xdd0
        cer_camo_base_05_zm_perth, // 0xdd1
        cer_camo_base_05_zm_uxray, // 0xdd2
        cer_camo_base_05_zm_tbaker, // 0xdd3
        cer_camo_base_05_zm_blauncher, // 0xdd4
        cer_camo_base_05_zm_skateboard, // 0xdd5
        cer_camo_base_05_zm_bostaff, // 0xdd6
        cer_camo_base_05_zm_katanas, // 0xdd7
        cer_camo_base_05_zm_nunchaku, // 0xdd8
        cer_camo_base_05_zm_sais, // 0xdd9
        cer_camo_base_05_zm_gilroy, // 0xdda
        cer_camo_base_05_zm_hugo, // 0xddb
        cer_camo_base_05_zm_keene, // 0xddc
        cer_camo_base_05_zm_kent, // 0xddd
        cer_camo_base_05_zm_pyork, // 0xdde
        cer_camo_base_05_zm_schuck, // 0xddf
        cer_camo_base_05_zm_napa, // 0xde0
        cer_camo_base_05_zm_erie, // 0xde1
        cer_camo_base_05_zm_fresno, // 0xde2
        cer_camo_base_05_zm_lisbon, // 0xde3
        cer_camo_base_05_zm_olove, // 0xde4
        cer_camo_base_05_zm_pickaxe, // 0xde5
        cer_camo_base_05_zm_aspen, // 0xde6
        cer_camo_base_05_zm_mesa, // 0xde7
        cer_camo_base_05_zm_bgloves, // 0xde8
        cer_camo_base_05_zm_csaw, // 0xde9
        cer_camo_base_05_zm_milan, // 0xdea
        cer_camo_base_05_zm_mpug40, // 0xdeb
        cer_camo_base_05_zm_wand, // 0xdec
        cer_camo_base_06_mp_cleaver, // 0xded
        cer_camo_base_06_mp_drill, // 0xdee
        cer_camo_base_06_mp_fable, // 0xdef
        cer_camo_base_06_mp_goslo, // 0xdf0
        cer_camo_base_06_mp_jhavana, // 0xdf1
        cer_camo_base_06_mp_mary82, // 0xdf2
        cer_camo_base_06_mp_saug, // 0xdf3
        cer_camo_base_06_mp_perth, // 0xdf4
        cer_camo_base_06_mp_uxray, // 0xdf5
        cer_camo_base_06_mp_tbaker, // 0xdf6
        cer_camo_base_06_mp_blauncher, // 0xdf7
        cer_camo_base_06_mp_skateboard, // 0xdf8
        cer_camo_base_06_mp_bostaff, // 0xdf9
        cer_camo_base_06_mp_katanas, // 0xdfa
        cer_camo_base_06_mp_nunchaku, // 0xdfb
        cer_camo_base_06_mp_sais, // 0xdfc
        cer_camo_base_06_mp_gilroy, // 0xdfd
        cer_camo_base_06_mp_hugo, // 0xdfe
        cer_camo_base_06_mp_keene, // 0xdff
        cer_camo_base_06_mp_kent, // 0xe00
        cer_camo_base_06_mp_pyork, // 0xe01
        cer_camo_base_06_mp_schuck, // 0xe02
        cer_camo_base_06_mp_napa, // 0xe03
        cer_camo_base_06_mp_erie, // 0xe04
        cer_camo_base_06_mp_fresno, // 0xe05
        cer_camo_base_06_mp_lisbon, // 0xe06
        cer_camo_base_06_mp_olove, // 0xe07
        cer_camo_base_06_mp_pickaxe, // 0xe08
        cer_camo_base_06_mp_aspen, // 0xe09
        cer_camo_base_06_mp_mesa, // 0xe0a
        cer_camo_base_06_mp_bgloves, // 0xe0b
        cer_camo_base_06_mp_csaw, // 0xe0c
        cer_camo_base_06_mp_milan, // 0xe0d
        cer_camo_base_06_mp_mpug40, // 0xe0e
        cer_camo_base_06_mp_wand, // 0xe0f
        cer_camo_base_06_wz_cleaver, // 0xe10
        cer_camo_base_06_wz_drill, // 0xe11
        cer_camo_base_06_wz_fable, // 0xe12
        cer_camo_base_06_wz_goslo, // 0xe13
        cer_camo_base_06_wz_jhavana, // 0xe14
        cer_camo_base_06_wz_mary82, // 0xe15
        cer_camo_base_06_wz_saug, // 0xe16
        cer_camo_base_06_wz_perth, // 0xe17
        cer_camo_base_06_wz_uxray, // 0xe18
        cer_camo_base_06_wz_tbaker, // 0xe19
        cer_camo_base_06_wz_blauncher, // 0xe1a
        cer_camo_base_06_wz_skateboard, // 0xe1b
        cer_camo_base_06_wz_bostaff, // 0xe1c
        cer_camo_base_06_wz_katanas, // 0xe1d
        cer_camo_base_06_wz_nunchaku, // 0xe1e
        cer_camo_base_06_wz_sais, // 0xe1f
        cer_camo_base_06_wz_gilroy, // 0xe20
        cer_camo_base_06_wz_hugo, // 0xe21
        cer_camo_base_06_wz_keene, // 0xe22
        cer_camo_base_06_wz_kent, // 0xe23
        cer_camo_base_06_wz_pyork, // 0xe24
        cer_camo_base_06_wz_schuck, // 0xe25
        cer_camo_base_06_wz_napa, // 0xe26
        cer_camo_base_06_wz_erie, // 0xe27
        cer_camo_base_06_wz_fresno, // 0xe28
        cer_camo_base_06_wz_lisbon, // 0xe29
        cer_camo_base_06_wz_olove, // 0xe2a
        cer_camo_base_06_wz_pickaxe, // 0xe2b
        cer_camo_base_06_wz_aspen, // 0xe2c
        cer_camo_base_06_wz_mesa, // 0xe2d
        cer_camo_base_06_wz_bgloves, // 0xe2e
        cer_camo_base_06_wz_csaw, // 0xe2f
        cer_camo_base_06_wz_milan, // 0xe30
        cer_camo_base_06_wz_mpug40, // 0xe31
        cer_camo_base_06_wz_wand, // 0xe32
        cer_camo_base_06_zm_cleaver, // 0xe33
        cer_camo_base_06_zm_drill, // 0xe34
        cer_camo_base_06_zm_fable, // 0xe35
        cer_camo_base_06_zm_goslo, // 0xe36
        cer_camo_base_06_zm_jhavana, // 0xe37
        cer_camo_base_06_zm_mary82, // 0xe38
        cer_camo_base_06_zm_saug, // 0xe39
        cer_camo_base_06_zm_perth, // 0xe3a
        cer_camo_base_06_zm_uxray, // 0xe3b
        cer_camo_base_06_zm_tbaker, // 0xe3c
        cer_camo_base_06_zm_blauncher, // 0xe3d
        cer_camo_base_06_zm_skateboard, // 0xe3e
        cer_camo_base_06_zm_bostaff, // 0xe3f
        cer_camo_base_06_zm_katanas, // 0xe40
        cer_camo_base_06_zm_nunchaku, // 0xe41
        cer_camo_base_06_zm_sais, // 0xe42
        cer_camo_base_06_zm_gilroy, // 0xe43
        cer_camo_base_06_zm_hugo, // 0xe44
        cer_camo_base_06_zm_keene, // 0xe45
        cer_camo_base_06_zm_kent, // 0xe46
        cer_camo_base_06_zm_pyork, // 0xe47
        cer_camo_base_06_zm_schuck, // 0xe48
        cer_camo_base_06_zm_napa, // 0xe49
        cer_camo_base_06_zm_erie, // 0xe4a
        cer_camo_base_06_zm_fresno, // 0xe4b
        cer_camo_base_06_zm_lisbon, // 0xe4c
        cer_camo_base_06_zm_olove, // 0xe4d
        cer_camo_base_06_zm_pickaxe, // 0xe4e
        cer_camo_base_06_zm_aspen, // 0xe4f
        cer_camo_base_06_zm_mesa, // 0xe50
        cer_camo_base_06_zm_bgloves, // 0xe51
        cer_camo_base_06_zm_csaw, // 0xe52
        cer_camo_base_06_zm_milan, // 0xe53
        cer_camo_base_06_zm_mpug40, // 0xe54
        cer_camo_base_06_zm_wand, // 0xe55
        cer_camo_base_07_mp_cleaver, // 0xe56
        cer_camo_base_07_mp_drill, // 0xe57
        cer_camo_base_07_mp_fable, // 0xe58
        cer_camo_base_07_mp_goslo, // 0xe59
        cer_camo_base_07_mp_jhavana, // 0xe5a
        cer_camo_base_07_mp_mary82, // 0xe5b
        cer_camo_base_07_mp_saug, // 0xe5c
        cer_camo_base_07_mp_perth, // 0xe5d
        cer_camo_base_07_mp_uxray, // 0xe5e
        cer_camo_base_07_mp_tbaker, // 0xe5f
        cer_camo_base_07_mp_blauncher, // 0xe60
        cer_camo_base_07_mp_skateboard, // 0xe61
        cer_camo_base_07_mp_bostaff, // 0xe62
        cer_camo_base_07_mp_katanas, // 0xe63
        cer_camo_base_07_mp_nunchaku, // 0xe64
        cer_camo_base_07_mp_sais, // 0xe65
        cer_camo_base_07_mp_gilroy, // 0xe66
        cer_camo_base_07_mp_hugo, // 0xe67
        cer_camo_base_07_mp_keene, // 0xe68
        cer_camo_base_07_mp_kent, // 0xe69
        cer_camo_base_07_mp_pyork, // 0xe6a
        cer_camo_base_07_mp_schuck, // 0xe6b
        cer_camo_base_07_mp_napa, // 0xe6c
        cer_camo_base_07_mp_erie, // 0xe6d
        cer_camo_base_07_mp_fresno, // 0xe6e
        cer_camo_base_07_mp_lisbon, // 0xe6f
        cer_camo_base_07_mp_olove, // 0xe70
        cer_camo_base_07_mp_pickaxe, // 0xe71
        cer_camo_base_07_mp_aspen, // 0xe72
        cer_camo_base_07_mp_mesa, // 0xe73
        cer_camo_base_07_mp_bgloves, // 0xe74
        cer_camo_base_07_mp_csaw, // 0xe75
        cer_camo_base_07_mp_milan, // 0xe76
        cer_camo_base_07_mp_mpug40, // 0xe77
        cer_camo_base_07_mp_wand, // 0xe78
        cer_camo_base_07_wz_cleaver, // 0xe79
        cer_camo_base_07_wz_drill, // 0xe7a
        cer_camo_base_07_wz_fable, // 0xe7b
        cer_camo_base_07_wz_goslo, // 0xe7c
        cer_camo_base_07_wz_jhavana, // 0xe7d
        cer_camo_base_07_wz_mary82, // 0xe7e
        cer_camo_base_07_wz_saug, // 0xe7f
        cer_camo_base_07_wz_perth, // 0xe80
        cer_camo_base_07_wz_uxray, // 0xe81
        cer_camo_base_07_wz_tbaker, // 0xe82
        cer_camo_base_07_wz_blauncher, // 0xe83
        cer_camo_base_07_wz_skateboard, // 0xe84
        cer_camo_base_07_wz_bostaff, // 0xe85
        cer_camo_base_07_wz_katanas, // 0xe86
        cer_camo_base_07_wz_nunchaku, // 0xe87
        cer_camo_base_07_wz_sais, // 0xe88
        cer_camo_base_07_wz_gilroy, // 0xe89
        cer_camo_base_07_wz_hugo, // 0xe8a
        cer_camo_base_07_wz_keene, // 0xe8b
        cer_camo_base_07_wz_kent, // 0xe8c
        cer_camo_base_07_wz_pyork, // 0xe8d
        cer_camo_base_07_wz_schuck, // 0xe8e
        cer_camo_base_07_wz_napa, // 0xe8f
        cer_camo_base_07_wz_erie, // 0xe90
        cer_camo_base_07_wz_fresno, // 0xe91
        cer_camo_base_07_wz_lisbon, // 0xe92
        cer_camo_base_07_wz_olove, // 0xe93
        cer_camo_base_07_wz_pickaxe, // 0xe94
        cer_camo_base_07_wz_aspen, // 0xe95
        cer_camo_base_07_wz_mesa, // 0xe96
        cer_camo_base_07_wz_bgloves, // 0xe97
        cer_camo_base_07_wz_csaw, // 0xe98
        cer_camo_base_07_wz_milan, // 0xe99
        cer_camo_base_07_wz_mpug40, // 0xe9a
        cer_camo_base_07_wz_wand, // 0xe9b
        cer_camo_base_07_zm_cleaver, // 0xe9c
        cer_camo_base_07_zm_drill, // 0xe9d
        cer_camo_base_07_zm_fable, // 0xe9e
        cer_camo_base_07_zm_goslo, // 0xe9f
        cer_camo_base_07_zm_jhavana, // 0xea0
        cer_camo_base_07_zm_mary82, // 0xea1
        cer_camo_base_07_zm_saug, // 0xea2
        cer_camo_base_07_zm_perth, // 0xea3
        cer_camo_base_07_zm_uxray, // 0xea4
        cer_camo_base_07_zm_tbaker, // 0xea5
        cer_camo_base_07_zm_blauncher, // 0xea6
        cer_camo_base_07_zm_skateboard, // 0xea7
        cer_camo_base_07_zm_bostaff, // 0xea8
        cer_camo_base_07_zm_katanas, // 0xea9
        cer_camo_base_07_zm_nunchaku, // 0xeaa
        cer_camo_base_07_zm_sais, // 0xeab
        cer_camo_base_07_zm_gilroy, // 0xeac
        cer_camo_base_07_zm_hugo, // 0xead
        cer_camo_base_07_zm_keene, // 0xeae
        cer_camo_base_07_zm_kent, // 0xeaf
        cer_camo_base_07_zm_pyork, // 0xeb0
        cer_camo_base_07_zm_schuck, // 0xeb1
        cer_camo_base_07_zm_napa, // 0xeb2
        cer_camo_base_07_zm_erie, // 0xeb3
        cer_camo_base_07_zm_fresno, // 0xeb4
        cer_camo_base_07_zm_lisbon, // 0xeb5
        cer_camo_base_07_zm_olove, // 0xeb6
        cer_camo_base_07_zm_pickaxe, // 0xeb7
        cer_camo_base_07_zm_aspen, // 0xeb8
        cer_camo_base_07_zm_mesa, // 0xeb9
        cer_camo_base_07_zm_bgloves, // 0xeba
        cer_camo_base_07_zm_csaw, // 0xebb
        cer_camo_base_07_zm_milan, // 0xebc
        cer_camo_base_07_zm_mpug40, // 0xebd
        cer_camo_base_07_zm_wand, // 0xebe
        cer_camo_base_08_mp_cleaver, // 0xebf
        cer_camo_base_08_mp_drill, // 0xec0
        cer_camo_base_08_mp_fable, // 0xec1
        cer_camo_base_08_mp_goslo, // 0xec2
        cer_camo_base_08_mp_jhavana, // 0xec3
        cer_camo_base_08_mp_mary82, // 0xec4
        cer_camo_base_08_mp_saug, // 0xec5
        cer_camo_base_08_mp_perth, // 0xec6
        cer_camo_base_08_mp_uxray, // 0xec7
        cer_camo_base_08_mp_tbaker, // 0xec8
        cer_camo_base_08_mp_blauncher, // 0xec9
        cer_camo_base_08_mp_skateboard, // 0xeca
        cer_camo_base_08_mp_bostaff, // 0xecb
        cer_camo_base_08_mp_katanas, // 0xecc
        cer_camo_base_08_mp_nunchaku, // 0xecd
        cer_camo_base_08_mp_sais, // 0xece
        cer_camo_base_08_mp_gilroy, // 0xecf
        cer_camo_base_08_mp_hugo, // 0xed0
        cer_camo_base_08_mp_keene, // 0xed1
        cer_camo_base_08_mp_kent, // 0xed2
        cer_camo_base_08_mp_pyork, // 0xed3
        cer_camo_base_08_mp_schuck, // 0xed4
        cer_camo_base_08_mp_napa, // 0xed5
        cer_camo_base_08_mp_erie, // 0xed6
        cer_camo_base_08_mp_fresno, // 0xed7
        cer_camo_base_08_mp_lisbon, // 0xed8
        cer_camo_base_08_mp_olove, // 0xed9
        cer_camo_base_08_mp_pickaxe, // 0xeda
        cer_camo_base_08_mp_aspen, // 0xedb
        cer_camo_base_08_mp_mesa, // 0xedc
        cer_camo_base_08_mp_bgloves, // 0xedd
        cer_camo_base_08_mp_csaw, // 0xede
        cer_camo_base_08_mp_milan, // 0xedf
        cer_camo_base_08_mp_mpug40, // 0xee0
        cer_camo_base_08_mp_wand, // 0xee1
        cer_camo_base_08_wz_cleaver, // 0xee2
        cer_camo_base_08_wz_drill, // 0xee3
        cer_camo_base_08_wz_fable, // 0xee4
        cer_camo_base_08_wz_goslo, // 0xee5
        cer_camo_base_08_wz_jhavana, // 0xee6
        cer_camo_base_08_wz_mary82, // 0xee7
        cer_camo_base_08_wz_saug, // 0xee8
        cer_camo_base_08_wz_perth, // 0xee9
        cer_camo_base_08_wz_uxray, // 0xeea
        cer_camo_base_08_wz_tbaker, // 0xeeb
        cer_camo_base_08_wz_blauncher, // 0xeec
        cer_camo_base_08_wz_skateboard, // 0xeed
        cer_camo_base_08_wz_bostaff, // 0xeee
        cer_camo_base_08_wz_katanas, // 0xeef
        cer_camo_base_08_wz_nunchaku, // 0xef0
        cer_camo_base_08_wz_sais, // 0xef1
        cer_camo_base_08_wz_gilroy, // 0xef2
        cer_camo_base_08_wz_hugo, // 0xef3
        cer_camo_base_08_wz_keene, // 0xef4
        cer_camo_base_08_wz_kent, // 0xef5
        cer_camo_base_08_wz_pyork, // 0xef6
        cer_camo_base_08_wz_schuck, // 0xef7
        cer_camo_base_08_wz_napa, // 0xef8
        cer_camo_base_08_wz_erie, // 0xef9
        cer_camo_base_08_wz_fresno, // 0xefa
        cer_camo_base_08_wz_lisbon, // 0xefb
        cer_camo_base_08_wz_olove, // 0xefc
        cer_camo_base_08_wz_pickaxe, // 0xefd
        cer_camo_base_08_wz_aspen, // 0xefe
        cer_camo_base_08_wz_mesa, // 0xeff
        cer_camo_base_08_wz_bgloves, // 0xf00
        cer_camo_base_08_wz_csaw, // 0xf01
        cer_camo_base_08_wz_milan, // 0xf02
        cer_camo_base_08_wz_mpug40, // 0xf03
        cer_camo_base_08_wz_wand, // 0xf04
        cer_camo_base_08_zm_cleaver, // 0xf05
        cer_camo_base_08_zm_drill, // 0xf06
        cer_camo_base_08_zm_fable, // 0xf07
        cer_camo_base_08_zm_goslo, // 0xf08
        cer_camo_base_08_zm_jhavana, // 0xf09
        cer_camo_base_08_zm_mary82, // 0xf0a
        cer_camo_base_08_zm_saug, // 0xf0b
        cer_camo_base_08_zm_perth, // 0xf0c
        cer_camo_base_08_zm_uxray, // 0xf0d
        cer_camo_base_08_zm_tbaker, // 0xf0e
        cer_camo_base_08_zm_blauncher, // 0xf0f
        cer_camo_base_08_zm_skateboard, // 0xf10
        cer_camo_base_08_zm_bostaff, // 0xf11
        cer_camo_base_08_zm_katanas, // 0xf12
        cer_camo_base_08_zm_nunchaku, // 0xf13
        cer_camo_base_08_zm_sais, // 0xf14
        cer_camo_base_08_zm_gilroy, // 0xf15
        cer_camo_base_08_zm_hugo, // 0xf16
        cer_camo_base_08_zm_keene, // 0xf17
        cer_camo_base_08_zm_kent, // 0xf18
        cer_camo_base_08_zm_pyork, // 0xf19
        cer_camo_base_08_zm_schuck, // 0xf1a
        cer_camo_base_08_zm_napa, // 0xf1b
        cer_camo_base_08_zm_erie, // 0xf1c
        cer_camo_base_08_zm_fresno, // 0xf1d
        cer_camo_base_08_zm_lisbon, // 0xf1e
        cer_camo_base_08_zm_olove, // 0xf1f
        cer_camo_base_08_zm_pickaxe, // 0xf20
        cer_camo_base_08_zm_aspen, // 0xf21
        cer_camo_base_08_zm_mesa, // 0xf22
        cer_camo_base_08_zm_bgloves, // 0xf23
        cer_camo_base_08_zm_csaw, // 0xf24
        cer_camo_base_08_zm_milan, // 0xf25
        cer_camo_base_08_zm_mpug40, // 0xf26
        cer_camo_base_08_zm_wand, // 0xf27
        cer_camo_base_09_mp_cleaver, // 0xf28
        cer_camo_base_09_mp_drill, // 0xf29
        cer_camo_base_09_mp_fable, // 0xf2a
        cer_camo_base_09_mp_goslo, // 0xf2b
        cer_camo_base_09_mp_jhavana, // 0xf2c
        cer_camo_base_09_mp_mary82, // 0xf2d
        cer_camo_base_09_mp_saug, // 0xf2e
        cer_camo_base_09_mp_perth, // 0xf2f
        cer_camo_base_09_mp_uxray, // 0xf30
        cer_camo_base_09_mp_tbaker, // 0xf31
        cer_camo_base_09_mp_blauncher, // 0xf32
        cer_camo_base_09_mp_skateboard, // 0xf33
        cer_camo_base_09_mp_bostaff, // 0xf34
        cer_camo_base_09_mp_katanas, // 0xf35
        cer_camo_base_09_mp_nunchaku, // 0xf36
        cer_camo_base_09_mp_sais, // 0xf37
        cer_camo_base_09_mp_gilroy, // 0xf38
        cer_camo_base_09_mp_hugo, // 0xf39
        cer_camo_base_09_mp_keene, // 0xf3a
        cer_camo_base_09_mp_kent, // 0xf3b
        cer_camo_base_09_mp_pyork, // 0xf3c
        cer_camo_base_09_mp_schuck, // 0xf3d
        cer_camo_base_09_mp_napa, // 0xf3e
        cer_camo_base_09_mp_erie, // 0xf3f
        cer_camo_base_09_mp_fresno, // 0xf40
        cer_camo_base_09_mp_lisbon, // 0xf41
        cer_camo_base_09_mp_olove, // 0xf42
        cer_camo_base_09_mp_pickaxe, // 0xf43
        cer_camo_base_09_mp_aspen, // 0xf44
        cer_camo_base_09_mp_mesa, // 0xf45
        cer_camo_base_09_mp_bgloves, // 0xf46
        cer_camo_base_09_mp_csaw, // 0xf47
        cer_camo_base_09_mp_milan, // 0xf48
        cer_camo_base_09_mp_mpug40, // 0xf49
        cer_camo_base_09_mp_wand, // 0xf4a
        cer_camo_base_09_wz_cleaver, // 0xf4b
        cer_camo_base_09_wz_drill, // 0xf4c
        cer_camo_base_09_wz_fable, // 0xf4d
        cer_camo_base_09_wz_goslo, // 0xf4e
        cer_camo_base_09_wz_jhavana, // 0xf4f
        cer_camo_base_09_wz_mary82, // 0xf50
        cer_camo_base_09_wz_saug, // 0xf51
        cer_camo_base_09_wz_perth, // 0xf52
        cer_camo_base_09_wz_uxray, // 0xf53
        cer_camo_base_09_wz_tbaker, // 0xf54
        cer_camo_base_09_wz_blauncher, // 0xf55
        cer_camo_base_09_wz_skateboard, // 0xf56
        cer_camo_base_09_wz_bostaff, // 0xf57
        cer_camo_base_09_wz_katanas, // 0xf58
        cer_camo_base_09_wz_nunchaku, // 0xf59
        cer_camo_base_09_wz_sais, // 0xf5a
        cer_camo_base_09_wz_gilroy, // 0xf5b
        cer_camo_base_09_wz_hugo, // 0xf5c
        cer_camo_base_09_wz_keene, // 0xf5d
        cer_camo_base_09_wz_kent, // 0xf5e
        cer_camo_base_09_wz_pyork, // 0xf5f
        cer_camo_base_09_wz_schuck, // 0xf60
        cer_camo_base_09_wz_napa, // 0xf61
        cer_camo_base_09_wz_erie, // 0xf62
        cer_camo_base_09_wz_fresno, // 0xf63
        cer_camo_base_09_wz_lisbon, // 0xf64
        cer_camo_base_09_wz_olove, // 0xf65
        cer_camo_base_09_wz_pickaxe, // 0xf66
        cer_camo_base_09_wz_aspen, // 0xf67
        cer_camo_base_09_wz_mesa, // 0xf68
        cer_camo_base_09_wz_bgloves, // 0xf69
        cer_camo_base_09_wz_csaw, // 0xf6a
        cer_camo_base_09_wz_milan, // 0xf6b
        cer_camo_base_09_wz_mpug40, // 0xf6c
        cer_camo_base_09_wz_wand, // 0xf6d
        cer_camo_base_09_zm_cleaver, // 0xf6e
        cer_camo_base_09_zm_drill, // 0xf6f
        cer_camo_base_09_zm_fable, // 0xf70
        cer_camo_base_09_zm_goslo, // 0xf71
        cer_camo_base_09_zm_jhavana, // 0xf72
        cer_camo_base_09_zm_mary82, // 0xf73
        cer_camo_base_09_zm_saug, // 0xf74
        cer_camo_base_09_zm_perth, // 0xf75
        cer_camo_base_09_zm_uxray, // 0xf76
        cer_camo_base_09_zm_tbaker, // 0xf77
        cer_camo_base_09_zm_blauncher, // 0xf78
        cer_camo_base_09_zm_skateboard, // 0xf79
        cer_camo_base_09_zm_bostaff, // 0xf7a
        cer_camo_base_09_zm_katanas, // 0xf7b
        cer_camo_base_09_zm_nunchaku, // 0xf7c
        cer_camo_base_09_zm_sais, // 0xf7d
        cer_camo_base_09_zm_gilroy, // 0xf7e
        cer_camo_base_09_zm_hugo, // 0xf7f
        cer_camo_base_09_zm_keene, // 0xf80
        cer_camo_base_09_zm_kent, // 0xf81
        cer_camo_base_09_zm_pyork, // 0xf82
        cer_camo_base_09_zm_schuck, // 0xf83
        cer_camo_base_09_zm_napa, // 0xf84
        cer_camo_base_09_zm_erie, // 0xf85
        cer_camo_base_09_zm_fresno, // 0xf86
        cer_camo_base_09_zm_lisbon, // 0xf87
        cer_camo_base_09_zm_olove, // 0xf88
        cer_camo_base_09_zm_pickaxe, // 0xf89
        cer_camo_base_09_zm_aspen, // 0xf8a
        cer_camo_base_09_zm_mesa, // 0xf8b
        cer_camo_base_09_zm_bgloves, // 0xf8c
        cer_camo_base_09_zm_csaw, // 0xf8d
        cer_camo_base_09_zm_milan, // 0xf8e
        cer_camo_base_09_zm_mpug40, // 0xf8f
        cer_camo_base_09_zm_wand, // 0xf90
        cer_camo_comp_01_mp_able18, // 0xf91
        cer_camo_comp_01_mp_aeasy, // 0xf92
        cer_camo_comp_01_mp_aking74, // 0xf93
        cer_camo_comp_01_mp_aroger10, // 0xf94
        cer_camo_comp_01_mp_asvalor, // 0xf95
        cer_camo_comp_01_mp_bat, // 0xf96
        cer_camo_comp_01_mp_chuck9, // 0xf97
        cer_camo_comp_01_mp_clove, // 0xf98
        cer_camo_comp_01_mp_coslo723, // 0xf99
        cer_camo_comp_01_mp_droger, // 0xf9a
        cer_camo_comp_01_mp_falove, // 0xf9b
        cer_camo_comp_01_mp_geasy9, // 0xf9c
        cer_camo_comp_01_mp_knife, // 0xf9d
        cer_camo_comp_01_mp_ksugar58, // 0xf9e
        cer_camo_comp_01_mp_love85, // 0xf9f
        cer_camo_comp_01_mp_love96, // 0xfa0
        cer_camo_comp_01_mp_mable, // 0xfa1
        cer_camo_comp_01_mp_moslo500, // 0xfa2
        cer_camo_comp_01_mp_pable3, // 0xfa3
        cer_camo_comp_01_mp_paris30, // 0xfa4
        cer_camo_comp_01_mp_pparis90, // 0xfa5
        cer_camo_comp_01_mp_puncle21, // 0xfa6
        cer_camo_comp_01_mp_rmary2, // 0xfa7
        cer_camo_comp_01_mp_roger31, // 0xfa8
        cer_camo_comp_01_mp_safox, // 0xfa9
        cer_camo_comp_01_mp_sgeorge550, // 0xfaa
        cer_camo_comp_01_mp_sroger25, // 0xfab
        cer_camo_comp_01_mp_sroger3, // 0xfac
        cer_camo_comp_01_mp_stiger, // 0xfad
        cer_camo_comp_01_mp_stisaac, // 0xfae
        cer_camo_comp_01_mp_svalor, // 0xfaf
        cer_camo_comp_01_mp_ultiger, // 0xfb0
        cer_camo_comp_01_mp_uncle12, // 0xfb1
        cer_camo_comp_01_mp_usugar9, // 0xfb2
        cer_camo_comp_01_wz_able18, // 0xfb3
        cer_camo_comp_01_wz_aeasy, // 0xfb4
        cer_camo_comp_01_wz_aking74, // 0xfb5
        cer_camo_comp_01_wz_aroger10, // 0xfb6
        cer_camo_comp_01_wz_asvalor, // 0xfb7
        cer_camo_comp_01_wz_bat, // 0xfb8
        cer_camo_comp_01_wz_chuck9, // 0xfb9
        cer_camo_comp_01_wz_clove, // 0xfba
        cer_camo_comp_01_wz_coslo723, // 0xfbb
        cer_camo_comp_01_wz_droger, // 0xfbc
        cer_camo_comp_01_wz_falove, // 0xfbd
        cer_camo_comp_01_wz_geasy9, // 0xfbe
        cer_camo_comp_01_wz_knife, // 0xfbf
        cer_camo_comp_01_wz_ksugar58, // 0xfc0
        cer_camo_comp_01_wz_love85, // 0xfc1
        cer_camo_comp_01_wz_love96, // 0xfc2
        cer_camo_comp_01_wz_mable, // 0xfc3
        cer_camo_comp_01_wz_moslo500, // 0xfc4
        cer_camo_comp_01_wz_pable3, // 0xfc5
        cer_camo_comp_01_wz_paris30, // 0xfc6
        cer_camo_comp_01_wz_pparis90, // 0xfc7
        cer_camo_comp_01_wz_puncle21, // 0xfc8
        cer_camo_comp_01_wz_rmary2, // 0xfc9
        cer_camo_comp_01_wz_roger31, // 0xfca
        cer_camo_comp_01_wz_safox, // 0xfcb
        cer_camo_comp_01_wz_sgeorge550, // 0xfcc
        cer_camo_comp_01_wz_sroger25, // 0xfcd
        cer_camo_comp_01_wz_sroger3, // 0xfce
        cer_camo_comp_01_wz_stiger, // 0xfcf
        cer_camo_comp_01_wz_stisaac, // 0xfd0
        cer_camo_comp_01_wz_svalor, // 0xfd1
        cer_camo_comp_01_wz_ultiger, // 0xfd2
        cer_camo_comp_01_wz_uncle12, // 0xfd3
        cer_camo_comp_01_wz_usugar9, // 0xfd4
        cer_camo_comp_01_zm_able18, // 0xfd5
        cer_camo_comp_01_zm_aeasy, // 0xfd6
        cer_camo_comp_01_zm_aking74, // 0xfd7
        cer_camo_comp_01_zm_aroger10, // 0xfd8
        cer_camo_comp_01_zm_asvalor, // 0xfd9
        cer_camo_comp_01_zm_bat, // 0xfda
        cer_camo_comp_01_zm_chuck9, // 0xfdb
        cer_camo_comp_01_zm_clove, // 0xfdc
        cer_camo_comp_01_zm_coslo723, // 0xfdd
        cer_camo_comp_01_zm_droger, // 0xfde
        cer_camo_comp_01_zm_falove, // 0xfdf
        cer_camo_comp_01_zm_geasy9, // 0xfe0
        cer_camo_comp_01_zm_knife, // 0xfe1
        cer_camo_comp_01_zm_ksugar58, // 0xfe2
        cer_camo_comp_01_zm_love85, // 0xfe3
        cer_camo_comp_01_zm_love96, // 0xfe4
        cer_camo_comp_01_zm_mable, // 0xfe5
        cer_camo_comp_01_zm_moslo500, // 0xfe6
        cer_camo_comp_01_zm_pable3, // 0xfe7
        cer_camo_comp_01_zm_paris30, // 0xfe8
        cer_camo_comp_01_zm_pparis90, // 0xfe9
        cer_camo_comp_01_zm_puncle21, // 0xfea
        cer_camo_comp_01_zm_rmary2, // 0xfeb
        cer_camo_comp_01_zm_roger31, // 0xfec
        cer_camo_comp_01_zm_safox, // 0xfed
        cer_camo_comp_01_zm_sgeorge550, // 0xfee
        cer_camo_comp_01_zm_sroger25, // 0xfef
        cer_camo_comp_01_zm_sroger3, // 0xff0
        cer_camo_comp_01_zm_stiger, // 0xff1
        cer_camo_comp_01_zm_stisaac, // 0xff2
        cer_camo_comp_01_zm_svalor, // 0xff3
        cer_camo_comp_01_zm_ultiger, // 0xff4
        cer_camo_comp_01_zm_uncle12, // 0xff5
        cer_camo_comp_01_zm_usugar9, // 0xff6
        cer_camo_comp_02_mp_able18, // 0xff7
        cer_camo_comp_02_mp_aeasy, // 0xff8
        cer_camo_comp_02_mp_aking74, // 0xff9
        cer_camo_comp_02_mp_aroger10, // 0xffa
        cer_camo_comp_02_mp_asvalor, // 0xffb
        cer_camo_comp_02_mp_bat, // 0xffc
        cer_camo_comp_02_mp_chuck9, // 0xffd
        cer_camo_comp_02_mp_clove, // 0xffe
        cer_camo_comp_02_mp_coslo723, // 0xfff
        cer_camo_comp_02_mp_droger, // 0x1000
        cer_camo_comp_02_mp_falove, // 0x1001
        cer_camo_comp_02_mp_geasy9, // 0x1002
        cer_camo_comp_02_mp_knife, // 0x1003
        cer_camo_comp_02_mp_ksugar58, // 0x1004
        cer_camo_comp_02_mp_love85, // 0x1005
        cer_camo_comp_02_mp_love96, // 0x1006
        cer_camo_comp_02_mp_mable, // 0x1007
        cer_camo_comp_02_mp_moslo500, // 0x1008
        cer_camo_comp_02_mp_pable3, // 0x1009
        cer_camo_comp_02_mp_paris30, // 0x100a
        cer_camo_comp_02_mp_pparis90, // 0x100b
        cer_camo_comp_02_mp_puncle21, // 0x100c
        cer_camo_comp_02_mp_rmary2, // 0x100d
        cer_camo_comp_02_mp_roger31, // 0x100e
        cer_camo_comp_02_mp_safox, // 0x100f
        cer_camo_comp_02_mp_sgeorge550, // 0x1010
        cer_camo_comp_02_mp_sroger25, // 0x1011
        cer_camo_comp_02_mp_sroger3, // 0x1012
        cer_camo_comp_02_mp_stiger, // 0x1013
        cer_camo_comp_02_mp_stisaac, // 0x1014
        cer_camo_comp_02_mp_svalor, // 0x1015
        cer_camo_comp_02_mp_ultiger, // 0x1016
        cer_camo_comp_02_mp_uncle12, // 0x1017
        cer_camo_comp_02_mp_usugar9, // 0x1018
        cer_camo_comp_02_wz_able18, // 0x1019
        cer_camo_comp_02_wz_aeasy, // 0x101a
        cer_camo_comp_02_wz_aking74, // 0x101b
        cer_camo_comp_02_wz_aroger10, // 0x101c
        cer_camo_comp_02_wz_asvalor, // 0x101d
        cer_camo_comp_02_wz_bat, // 0x101e
        cer_camo_comp_02_wz_chuck9, // 0x101f
        cer_camo_comp_02_wz_clove, // 0x1020
        cer_camo_comp_02_wz_coslo723, // 0x1021
        cer_camo_comp_02_wz_droger, // 0x1022
        cer_camo_comp_02_wz_falove, // 0x1023
        cer_camo_comp_02_wz_geasy9, // 0x1024
        cer_camo_comp_02_wz_knife, // 0x1025
        cer_camo_comp_02_wz_ksugar58, // 0x1026
        cer_camo_comp_02_wz_love85, // 0x1027
        cer_camo_comp_02_wz_love96, // 0x1028
        cer_camo_comp_02_wz_mable, // 0x1029
        cer_camo_comp_02_wz_moslo500, // 0x102a
        cer_camo_comp_02_wz_pable3, // 0x102b
        cer_camo_comp_02_wz_paris30, // 0x102c
        cer_camo_comp_02_wz_pparis90, // 0x102d
        cer_camo_comp_02_wz_puncle21, // 0x102e
        cer_camo_comp_02_wz_rmary2, // 0x102f
        cer_camo_comp_02_wz_roger31, // 0x1030
        cer_camo_comp_02_wz_safox, // 0x1031
        cer_camo_comp_02_wz_sgeorge550, // 0x1032
        cer_camo_comp_02_wz_sroger25, // 0x1033
        cer_camo_comp_02_wz_sroger3, // 0x1034
        cer_camo_comp_02_wz_stiger, // 0x1035
        cer_camo_comp_02_wz_stisaac, // 0x1036
        cer_camo_comp_02_wz_svalor, // 0x1037
        cer_camo_comp_02_wz_ultiger, // 0x1038
        cer_camo_comp_02_wz_uncle12, // 0x1039
        cer_camo_comp_02_wz_usugar9, // 0x103a
        cer_camo_comp_02_zm_able18, // 0x103b
        cer_camo_comp_02_zm_aeasy, // 0x103c
        cer_camo_comp_02_zm_aking74, // 0x103d
        cer_camo_comp_02_zm_aroger10, // 0x103e
        cer_camo_comp_02_zm_asvalor, // 0x103f
        cer_camo_comp_02_zm_bat, // 0x1040
        cer_camo_comp_02_zm_chuck9, // 0x1041
        cer_camo_comp_02_zm_clove, // 0x1042
        cer_camo_comp_02_zm_coslo723, // 0x1043
        cer_camo_comp_02_zm_droger, // 0x1044
        cer_camo_comp_02_zm_falove, // 0x1045
        cer_camo_comp_02_zm_geasy9, // 0x1046
        cer_camo_comp_02_zm_knife, // 0x1047
        cer_camo_comp_02_zm_ksugar58, // 0x1048
        cer_camo_comp_02_zm_love85, // 0x1049
        cer_camo_comp_02_zm_love96, // 0x104a
        cer_camo_comp_02_zm_mable, // 0x104b
        cer_camo_comp_02_zm_moslo500, // 0x104c
        cer_camo_comp_02_zm_pable3, // 0x104d
        cer_camo_comp_02_zm_paris30, // 0x104e
        cer_camo_comp_02_zm_pparis90, // 0x104f
        cer_camo_comp_02_zm_puncle21, // 0x1050
        cer_camo_comp_02_zm_rmary2, // 0x1051
        cer_camo_comp_02_zm_roger31, // 0x1052
        cer_camo_comp_02_zm_safox, // 0x1053
        cer_camo_comp_02_zm_sgeorge550, // 0x1054
        cer_camo_comp_02_zm_sroger25, // 0x1055
        cer_camo_comp_02_zm_sroger3, // 0x1056
        cer_camo_comp_02_zm_stiger, // 0x1057
        cer_camo_comp_02_zm_stisaac, // 0x1058
        cer_camo_comp_02_zm_svalor, // 0x1059
        cer_camo_comp_02_zm_ultiger, // 0x105a
        cer_camo_comp_02_zm_uncle12, // 0x105b
        cer_camo_comp_02_zm_usugar9, // 0x105c
        cer_camo_comp_03_mp_able18, // 0x105d
        cer_camo_comp_03_mp_aeasy, // 0x105e
        cer_camo_comp_03_mp_aking74, // 0x105f
        cer_camo_comp_03_mp_aroger10, // 0x1060
        cer_camo_comp_03_mp_asvalor, // 0x1061
        cer_camo_comp_03_mp_bat, // 0x1062
        cer_camo_comp_03_mp_chuck9, // 0x1063
        cer_camo_comp_03_mp_clove, // 0x1064
        cer_camo_comp_03_mp_coslo723, // 0x1065
        cer_camo_comp_03_mp_droger, // 0x1066
        cer_camo_comp_03_mp_falove, // 0x1067
        cer_camo_comp_03_mp_geasy9, // 0x1068
        cer_camo_comp_03_mp_knife, // 0x1069
        cer_camo_comp_03_mp_ksugar58, // 0x106a
        cer_camo_comp_03_mp_love85, // 0x106b
        cer_camo_comp_03_mp_love96, // 0x106c
        cer_camo_comp_03_mp_mable, // 0x106d
        cer_camo_comp_03_mp_moslo500, // 0x106e
        cer_camo_comp_03_mp_pable3, // 0x106f
        cer_camo_comp_03_mp_paris30, // 0x1070
        cer_camo_comp_03_mp_pparis90, // 0x1071
        cer_camo_comp_03_mp_puncle21, // 0x1072
        cer_camo_comp_03_mp_rmary2, // 0x1073
        cer_camo_comp_03_mp_roger31, // 0x1074
        cer_camo_comp_03_mp_safox, // 0x1075
        cer_camo_comp_03_mp_sgeorge550, // 0x1076
        cer_camo_comp_03_mp_sroger25, // 0x1077
        cer_camo_comp_03_mp_sroger3, // 0x1078
        cer_camo_comp_03_mp_stiger, // 0x1079
        cer_camo_comp_03_mp_stisaac, // 0x107a
        cer_camo_comp_03_mp_svalor, // 0x107b
        cer_camo_comp_03_mp_ultiger, // 0x107c
        cer_camo_comp_03_mp_uncle12, // 0x107d
        cer_camo_comp_03_mp_usugar9, // 0x107e
        cer_camo_comp_03_wz_able18, // 0x107f
        cer_camo_comp_03_wz_aeasy, // 0x1080
        cer_camo_comp_03_wz_aking74, // 0x1081
        cer_camo_comp_03_wz_aroger10, // 0x1082
        cer_camo_comp_03_wz_asvalor, // 0x1083
        cer_camo_comp_03_wz_bat, // 0x1084
        cer_camo_comp_03_wz_chuck9, // 0x1085
        cer_camo_comp_03_wz_clove, // 0x1086
        cer_camo_comp_03_wz_coslo723, // 0x1087
        cer_camo_comp_03_wz_droger, // 0x1088
        cer_camo_comp_03_wz_falove, // 0x1089
        cer_camo_comp_03_wz_geasy9, // 0x108a
        cer_camo_comp_03_wz_knife, // 0x108b
        cer_camo_comp_03_wz_ksugar58, // 0x108c
        cer_camo_comp_03_wz_love85, // 0x108d
        cer_camo_comp_03_wz_love96, // 0x108e
        cer_camo_comp_03_wz_mable, // 0x108f
        cer_camo_comp_03_wz_moslo500, // 0x1090
        cer_camo_comp_03_wz_pable3, // 0x1091
        cer_camo_comp_03_wz_paris30, // 0x1092
        cer_camo_comp_03_wz_pparis90, // 0x1093
        cer_camo_comp_03_wz_puncle21, // 0x1094
        cer_camo_comp_03_wz_rmary2, // 0x1095
        cer_camo_comp_03_wz_roger31, // 0x1096
        cer_camo_comp_03_wz_safox, // 0x1097
        cer_camo_comp_03_wz_sgeorge550, // 0x1098
        cer_camo_comp_03_wz_sroger25, // 0x1099
        cer_camo_comp_03_wz_sroger3, // 0x109a
        cer_camo_comp_03_wz_stiger, // 0x109b
        cer_camo_comp_03_wz_stisaac, // 0x109c
        cer_camo_comp_03_wz_svalor, // 0x109d
        cer_camo_comp_03_wz_ultiger, // 0x109e
        cer_camo_comp_03_wz_uncle12, // 0x109f
        cer_camo_comp_03_wz_usugar9, // 0x10a0
        cer_camo_comp_03_zm_able18, // 0x10a1
        cer_camo_comp_03_zm_aeasy, // 0x10a2
        cer_camo_comp_03_zm_aking74, // 0x10a3
        cer_camo_comp_03_zm_aroger10, // 0x10a4
        cer_camo_comp_03_zm_asvalor, // 0x10a5
        cer_camo_comp_03_zm_bat, // 0x10a6
        cer_camo_comp_03_zm_chuck9, // 0x10a7
        cer_camo_comp_03_zm_clove, // 0x10a8
        cer_camo_comp_03_zm_coslo723, // 0x10a9
        cer_camo_comp_03_zm_droger, // 0x10aa
        cer_camo_comp_03_zm_falove, // 0x10ab
        cer_camo_comp_03_zm_geasy9, // 0x10ac
        cer_camo_comp_03_zm_knife, // 0x10ad
        cer_camo_comp_03_zm_ksugar58, // 0x10ae
        cer_camo_comp_03_zm_love85, // 0x10af
        cer_camo_comp_03_zm_love96, // 0x10b0
        cer_camo_comp_03_zm_mable, // 0x10b1
        cer_camo_comp_03_zm_moslo500, // 0x10b2
        cer_camo_comp_03_zm_pable3, // 0x10b3
        cer_camo_comp_03_zm_paris30, // 0x10b4
        cer_camo_comp_03_zm_pparis90, // 0x10b5
        cer_camo_comp_03_zm_puncle21, // 0x10b6
        cer_camo_comp_03_zm_rmary2, // 0x10b7
        cer_camo_comp_03_zm_roger31, // 0x10b8
        cer_camo_comp_03_zm_safox, // 0x10b9
        cer_camo_comp_03_zm_sgeorge550, // 0x10ba
        cer_camo_comp_03_zm_sroger25, // 0x10bb
        cer_camo_comp_03_zm_sroger3, // 0x10bc
        cer_camo_comp_03_zm_stiger, // 0x10bd
        cer_camo_comp_03_zm_stisaac, // 0x10be
        cer_camo_comp_03_zm_svalor, // 0x10bf
        cer_camo_comp_03_zm_ultiger, // 0x10c0
        cer_camo_comp_03_zm_uncle12, // 0x10c1
        cer_camo_comp_03_zm_usugar9, // 0x10c2
        cer_camo_comp_04_mp_able18, // 0x10c3
        cer_camo_comp_04_mp_aeasy, // 0x10c4
        cer_camo_comp_04_mp_aking74, // 0x10c5
        cer_camo_comp_04_mp_aroger10, // 0x10c6
        cer_camo_comp_04_mp_asvalor, // 0x10c7
        cer_camo_comp_04_mp_bat, // 0x10c8
        cer_camo_comp_04_mp_chuck9, // 0x10c9
        cer_camo_comp_04_mp_clove, // 0x10ca
        cer_camo_comp_04_mp_coslo723, // 0x10cb
        cer_camo_comp_04_mp_droger, // 0x10cc
        cer_camo_comp_04_mp_falove, // 0x10cd
        cer_camo_comp_04_mp_geasy9, // 0x10ce
        cer_camo_comp_04_mp_knife, // 0x10cf
        cer_camo_comp_04_mp_ksugar58, // 0x10d0
        cer_camo_comp_04_mp_love85, // 0x10d1
        cer_camo_comp_04_mp_love96, // 0x10d2
        cer_camo_comp_04_mp_mable, // 0x10d3
        cer_camo_comp_04_mp_moslo500, // 0x10d4
        cer_camo_comp_04_mp_pable3, // 0x10d5
        cer_camo_comp_04_mp_paris30, // 0x10d6
        cer_camo_comp_04_mp_pparis90, // 0x10d7
        cer_camo_comp_04_mp_puncle21, // 0x10d8
        cer_camo_comp_04_mp_rmary2, // 0x10d9
        cer_camo_comp_04_mp_roger31, // 0x10da
        cer_camo_comp_04_mp_safox, // 0x10db
        cer_camo_comp_04_mp_sgeorge550, // 0x10dc
        cer_camo_comp_04_mp_sroger25, // 0x10dd
        cer_camo_comp_04_mp_sroger3, // 0x10de
        cer_camo_comp_04_mp_stiger, // 0x10df
        cer_camo_comp_04_mp_stisaac, // 0x10e0
        cer_camo_comp_04_mp_svalor, // 0x10e1
        cer_camo_comp_04_mp_ultiger, // 0x10e2
        cer_camo_comp_04_mp_uncle12, // 0x10e3
        cer_camo_comp_04_mp_usugar9, // 0x10e4
        cer_camo_comp_04_wz_able18, // 0x10e5
        cer_camo_comp_04_wz_aeasy, // 0x10e6
        cer_camo_comp_04_wz_aking74, // 0x10e7
        cer_camo_comp_04_wz_aroger10, // 0x10e8
        cer_camo_comp_04_wz_asvalor, // 0x10e9
        cer_camo_comp_04_wz_bat, // 0x10ea
        cer_camo_comp_04_wz_chuck9, // 0x10eb
        cer_camo_comp_04_wz_clove, // 0x10ec
        cer_camo_comp_04_wz_coslo723, // 0x10ed
        cer_camo_comp_04_wz_droger, // 0x10ee
        cer_camo_comp_04_wz_falove, // 0x10ef
        cer_camo_comp_04_wz_geasy9, // 0x10f0
        cer_camo_comp_04_wz_knife, // 0x10f1
        cer_camo_comp_04_wz_ksugar58, // 0x10f2
        cer_camo_comp_04_wz_love85, // 0x10f3
        cer_camo_comp_04_wz_love96, // 0x10f4
        cer_camo_comp_04_wz_mable, // 0x10f5
        cer_camo_comp_04_wz_moslo500, // 0x10f6
        cer_camo_comp_04_wz_pable3, // 0x10f7
        cer_camo_comp_04_wz_paris30, // 0x10f8
        cer_camo_comp_04_wz_pparis90, // 0x10f9
        cer_camo_comp_04_wz_puncle21, // 0x10fa
        cer_camo_comp_04_wz_rmary2, // 0x10fb
        cer_camo_comp_04_wz_roger31, // 0x10fc
        cer_camo_comp_04_wz_safox, // 0x10fd
        cer_camo_comp_04_wz_sgeorge550, // 0x10fe
        cer_camo_comp_04_wz_sroger25, // 0x10ff
        cer_camo_comp_04_wz_sroger3, // 0x1100
        cer_camo_comp_04_wz_stiger, // 0x1101
        cer_camo_comp_04_wz_stisaac, // 0x1102
        cer_camo_comp_04_wz_svalor, // 0x1103
        cer_camo_comp_04_wz_ultiger, // 0x1104
        cer_camo_comp_04_wz_uncle12, // 0x1105
        cer_camo_comp_04_wz_usugar9, // 0x1106
        cer_camo_comp_04_zm_able18, // 0x1107
        cer_camo_comp_04_zm_aeasy, // 0x1108
        cer_camo_comp_04_zm_aking74, // 0x1109
        cer_camo_comp_04_zm_aroger10, // 0x110a
        cer_camo_comp_04_zm_asvalor, // 0x110b
        cer_camo_comp_04_zm_bat, // 0x110c
        cer_camo_comp_04_zm_chuck9, // 0x110d
        cer_camo_comp_04_zm_clove, // 0x110e
        cer_camo_comp_04_zm_coslo723, // 0x110f
        cer_camo_comp_04_zm_droger, // 0x1110
        cer_camo_comp_04_zm_falove, // 0x1111
        cer_camo_comp_04_zm_geasy9, // 0x1112
        cer_camo_comp_04_zm_knife, // 0x1113
        cer_camo_comp_04_zm_ksugar58, // 0x1114
        cer_camo_comp_04_zm_love85, // 0x1115
        cer_camo_comp_04_zm_love96, // 0x1116
        cer_camo_comp_04_zm_mable, // 0x1117
        cer_camo_comp_04_zm_moslo500, // 0x1118
        cer_camo_comp_04_zm_pable3, // 0x1119
        cer_camo_comp_04_zm_paris30, // 0x111a
        cer_camo_comp_04_zm_pparis90, // 0x111b
        cer_camo_comp_04_zm_puncle21, // 0x111c
        cer_camo_comp_04_zm_rmary2, // 0x111d
        cer_camo_comp_04_zm_roger31, // 0x111e
        cer_camo_comp_04_zm_safox, // 0x111f
        cer_camo_comp_04_zm_sgeorge550, // 0x1120
        cer_camo_comp_04_zm_sroger25, // 0x1121
        cer_camo_comp_04_zm_sroger3, // 0x1122
        cer_camo_comp_04_zm_stiger, // 0x1123
        cer_camo_comp_04_zm_stisaac, // 0x1124
        cer_camo_comp_04_zm_svalor, // 0x1125
        cer_camo_comp_04_zm_ultiger, // 0x1126
        cer_camo_comp_04_zm_uncle12, // 0x1127
        cer_camo_comp_04_zm_usugar9, // 0x1128
        cer_camo_comp_01_mp_cleaver, // 0x1129
        cer_camo_comp_01_mp_drill, // 0x112a
        cer_camo_comp_01_mp_fable, // 0x112b
        cer_camo_comp_01_mp_goslo, // 0x112c
        cer_camo_comp_01_mp_jhavana, // 0x112d
        cer_camo_comp_01_mp_mary82, // 0x112e
        cer_camo_comp_01_mp_saug, // 0x112f
        cer_camo_comp_01_mp_perth, // 0x1130
        cer_camo_comp_01_mp_uxray, // 0x1131
        cer_camo_comp_01_mp_tbaker, // 0x1132
        cer_camo_comp_01_mp_blauncher, // 0x1133
        cer_camo_comp_01_mp_skateboard, // 0x1134
        cer_camo_comp_01_mp_bostaff, // 0x1135
        cer_camo_comp_01_mp_katanas, // 0x1136
        cer_camo_comp_01_mp_nunchaku, // 0x1137
        cer_camo_comp_01_mp_sais, // 0x1138
        cer_camo_comp_01_mp_gilroy, // 0x1139
        cer_camo_comp_01_mp_hugo, // 0x113a
        cer_camo_comp_01_mp_keene, // 0x113b
        cer_camo_comp_01_mp_kent, // 0x113c
        cer_camo_comp_01_mp_pyork, // 0x113d
        cer_camo_comp_01_mp_schuck, // 0x113e
        cer_camo_comp_01_mp_napa, // 0x113f
        cer_camo_comp_01_mp_erie, // 0x1140
        cer_camo_comp_01_mp_fresno, // 0x1141
        cer_camo_comp_01_mp_lisbon, // 0x1142
        cer_camo_comp_01_mp_olove, // 0x1143
        cer_camo_comp_01_mp_pickaxe, // 0x1144
        cer_camo_comp_01_mp_aspen, // 0x1145
        cer_camo_comp_01_mp_mesa, // 0x1146
        cer_camo_comp_01_mp_bgloves, // 0x1147
        cer_camo_comp_01_mp_csaw, // 0x1148
        cer_camo_comp_01_mp_milan, // 0x1149
        cer_camo_comp_01_mp_mpug40, // 0x114a
        cer_camo_comp_01_mp_wand, // 0x114b
        cer_camo_comp_01_wz_cleaver, // 0x114c
        cer_camo_comp_01_wz_drill, // 0x114d
        cer_camo_comp_01_wz_fable, // 0x114e
        cer_camo_comp_01_wz_goslo, // 0x114f
        cer_camo_comp_01_wz_jhavana, // 0x1150
        cer_camo_comp_01_wz_mary82, // 0x1151
        cer_camo_comp_01_wz_saug, // 0x1152
        cer_camo_comp_01_wz_perth, // 0x1153
        cer_camo_comp_01_wz_uxray, // 0x1154
        cer_camo_comp_01_wz_tbaker, // 0x1155
        cer_camo_comp_01_wz_blauncher, // 0x1156
        cer_camo_comp_01_wz_skateboard, // 0x1157
        cer_camo_comp_01_wz_bostaff, // 0x1158
        cer_camo_comp_01_wz_katanas, // 0x1159
        cer_camo_comp_01_wz_nunchaku, // 0x115a
        cer_camo_comp_01_wz_sais, // 0x115b
        cer_camo_comp_01_wz_gilroy, // 0x115c
        cer_camo_comp_01_wz_hugo, // 0x115d
        cer_camo_comp_01_wz_keene, // 0x115e
        cer_camo_comp_01_wz_kent, // 0x115f
        cer_camo_comp_01_wz_pyork, // 0x1160
        cer_camo_comp_01_wz_schuck, // 0x1161
        cer_camo_comp_01_wz_napa, // 0x1162
        cer_camo_comp_01_wz_erie, // 0x1163
        cer_camo_comp_01_wz_fresno, // 0x1164
        cer_camo_comp_01_wz_lisbon, // 0x1165
        cer_camo_comp_01_wz_olove, // 0x1166
        cer_camo_comp_01_wz_pickaxe, // 0x1167
        cer_camo_comp_01_wz_aspen, // 0x1168
        cer_camo_comp_01_wz_mesa, // 0x1169
        cer_camo_comp_01_wz_bgloves, // 0x116a
        cer_camo_comp_01_wz_csaw, // 0x116b
        cer_camo_comp_01_wz_milan, // 0x116c
        cer_camo_comp_01_wz_mpug40, // 0x116d
        cer_camo_comp_01_wz_wand, // 0x116e
        cer_camo_comp_01_zm_cleaver, // 0x116f
        cer_camo_comp_01_zm_drill, // 0x1170
        cer_camo_comp_01_zm_fable, // 0x1171
        cer_camo_comp_01_zm_goslo, // 0x1172
        cer_camo_comp_01_zm_jhavana, // 0x1173
        cer_camo_comp_01_zm_mary82, // 0x1174
        cer_camo_comp_01_zm_saug, // 0x1175
        cer_camo_comp_01_zm_perth, // 0x1176
        cer_camo_comp_01_zm_uxray, // 0x1177
        cer_camo_comp_01_zm_tbaker, // 0x1178
        cer_camo_comp_01_zm_blauncher, // 0x1179
        cer_camo_comp_01_zm_skateboard, // 0x117a
        cer_camo_comp_01_zm_bostaff, // 0x117b
        cer_camo_comp_01_zm_katanas, // 0x117c
        cer_camo_comp_01_zm_nunchaku, // 0x117d
        cer_camo_comp_01_zm_sais, // 0x117e
        cer_camo_comp_01_zm_gilroy, // 0x117f
        cer_camo_comp_01_zm_hugo, // 0x1180
        cer_camo_comp_01_zm_keene, // 0x1181
        cer_camo_comp_01_zm_kent, // 0x1182
        cer_camo_comp_01_zm_pyork, // 0x1183
        cer_camo_comp_01_zm_schuck, // 0x1184
        cer_camo_comp_01_zm_napa, // 0x1185
        cer_camo_comp_01_zm_erie, // 0x1186
        cer_camo_comp_01_zm_fresno, // 0x1187
        cer_camo_comp_01_zm_lisbon, // 0x1188
        cer_camo_comp_01_zm_olove, // 0x1189
        cer_camo_comp_01_zm_pickaxe, // 0x118a
        cer_camo_comp_01_zm_aspen, // 0x118b
        cer_camo_comp_01_zm_mesa, // 0x118c
        cer_camo_comp_01_zm_bgloves, // 0x118d
        cer_camo_comp_01_zm_csaw, // 0x118e
        cer_camo_comp_01_zm_milan, // 0x118f
        cer_camo_comp_01_zm_mpug40, // 0x1190
        cer_camo_comp_01_zm_wand, // 0x1191
        cer_camo_comp_02_mp_cleaver, // 0x1192
        cer_camo_comp_02_mp_drill, // 0x1193
        cer_camo_comp_02_mp_fable, // 0x1194
        cer_camo_comp_02_mp_goslo, // 0x1195
        cer_camo_comp_02_mp_jhavana, // 0x1196
        cer_camo_comp_02_mp_mary82, // 0x1197
        cer_camo_comp_02_mp_saug, // 0x1198
        cer_camo_comp_02_mp_perth, // 0x1199
        cer_camo_comp_02_mp_uxray, // 0x119a
        cer_camo_comp_02_mp_tbaker, // 0x119b
        cer_camo_comp_02_mp_blauncher, // 0x119c
        cer_camo_comp_02_mp_skateboard, // 0x119d
        cer_camo_comp_02_mp_bostaff, // 0x119e
        cer_camo_comp_02_mp_katanas, // 0x119f
        cer_camo_comp_02_mp_nunchaku, // 0x11a0
        cer_camo_comp_02_mp_sais, // 0x11a1
        cer_camo_comp_02_mp_gilroy, // 0x11a2
        cer_camo_comp_02_mp_hugo, // 0x11a3
        cer_camo_comp_02_mp_keene, // 0x11a4
        cer_camo_comp_02_mp_kent, // 0x11a5
        cer_camo_comp_02_mp_pyork, // 0x11a6
        cer_camo_comp_02_mp_schuck, // 0x11a7
        cer_camo_comp_02_mp_napa, // 0x11a8
        cer_camo_comp_02_mp_erie, // 0x11a9
        cer_camo_comp_02_mp_fresno, // 0x11aa
        cer_camo_comp_02_mp_lisbon, // 0x11ab
        cer_camo_comp_02_mp_olove, // 0x11ac
        cer_camo_comp_02_mp_pickaxe, // 0x11ad
        cer_camo_comp_02_mp_aspen, // 0x11ae
        cer_camo_comp_02_mp_mesa, // 0x11af
        cer_camo_comp_02_mp_bgloves, // 0x11b0
        cer_camo_comp_02_mp_csaw, // 0x11b1
        cer_camo_comp_02_mp_milan, // 0x11b2
        cer_camo_comp_02_mp_mpug40, // 0x11b3
        cer_camo_comp_02_mp_wand, // 0x11b4
        cer_camo_comp_02_wz_cleaver, // 0x11b5
        cer_camo_comp_02_wz_drill, // 0x11b6
        cer_camo_comp_02_wz_fable, // 0x11b7
        cer_camo_comp_02_wz_goslo, // 0x11b8
        cer_camo_comp_02_wz_jhavana, // 0x11b9
        cer_camo_comp_02_wz_mary82, // 0x11ba
        cer_camo_comp_02_wz_saug, // 0x11bb
        cer_camo_comp_02_wz_perth, // 0x11bc
        cer_camo_comp_02_wz_uxray, // 0x11bd
        cer_camo_comp_02_wz_tbaker, // 0x11be
        cer_camo_comp_02_wz_blauncher, // 0x11bf
        cer_camo_comp_02_wz_skateboard, // 0x11c0
        cer_camo_comp_02_wz_bostaff, // 0x11c1
        cer_camo_comp_02_wz_katanas, // 0x11c2
        cer_camo_comp_02_wz_nunchaku, // 0x11c3
        cer_camo_comp_02_wz_sais, // 0x11c4
        cer_camo_comp_02_wz_gilroy, // 0x11c5
        cer_camo_comp_02_wz_hugo, // 0x11c6
        cer_camo_comp_02_wz_keene, // 0x11c7
        cer_camo_comp_02_wz_kent, // 0x11c8
        cer_camo_comp_02_wz_pyork, // 0x11c9
        cer_camo_comp_02_wz_schuck, // 0x11ca
        cer_camo_comp_02_wz_napa, // 0x11cb
        cer_camo_comp_02_wz_erie, // 0x11cc
        cer_camo_comp_02_wz_fresno, // 0x11cd
        cer_camo_comp_02_wz_lisbon, // 0x11ce
        cer_camo_comp_02_wz_olove, // 0x11cf
        cer_camo_comp_02_wz_pickaxe, // 0x11d0
        cer_camo_comp_02_wz_aspen, // 0x11d1
        cer_camo_comp_02_wz_mesa, // 0x11d2
        cer_camo_comp_02_wz_bgloves, // 0x11d3
        cer_camo_comp_02_wz_csaw, // 0x11d4
        cer_camo_comp_02_wz_milan, // 0x11d5
        cer_camo_comp_02_wz_mpug40, // 0x11d6
        cer_camo_comp_02_wz_wand, // 0x11d7
        cer_camo_comp_02_zm_cleaver, // 0x11d8
        cer_camo_comp_02_zm_drill, // 0x11d9
        cer_camo_comp_02_zm_fable, // 0x11da
        cer_camo_comp_02_zm_goslo, // 0x11db
        cer_camo_comp_02_zm_jhavana, // 0x11dc
        cer_camo_comp_02_zm_mary82, // 0x11dd
        cer_camo_comp_02_zm_saug, // 0x11de
        cer_camo_comp_02_zm_perth, // 0x11df
        cer_camo_comp_02_zm_uxray, // 0x11e0
        cer_camo_comp_02_zm_tbaker, // 0x11e1
        cer_camo_comp_02_zm_blauncher, // 0x11e2
        cer_camo_comp_02_zm_skateboard, // 0x11e3
        cer_camo_comp_02_zm_bostaff, // 0x11e4
        cer_camo_comp_02_zm_katanas, // 0x11e5
        cer_camo_comp_02_zm_nunchaku, // 0x11e6
        cer_camo_comp_02_zm_sais, // 0x11e7
        cer_camo_comp_02_zm_gilroy, // 0x11e8
        cer_camo_comp_02_zm_hugo, // 0x11e9
        cer_camo_comp_02_zm_keene, // 0x11ea
        cer_camo_comp_02_zm_kent, // 0x11eb
        cer_camo_comp_02_zm_pyork, // 0x11ec
        cer_camo_comp_02_zm_schuck, // 0x11ed
        cer_camo_comp_02_zm_napa, // 0x11ee
        cer_camo_comp_02_zm_erie, // 0x11ef
        cer_camo_comp_02_zm_fresno, // 0x11f0
        cer_camo_comp_02_zm_lisbon, // 0x11f1
        cer_camo_comp_02_zm_olove, // 0x11f2
        cer_camo_comp_02_zm_pickaxe, // 0x11f3
        cer_camo_comp_02_zm_aspen, // 0x11f4
        cer_camo_comp_02_zm_mesa, // 0x11f5
        cer_camo_comp_02_zm_bgloves, // 0x11f6
        cer_camo_comp_02_zm_csaw, // 0x11f7
        cer_camo_comp_02_zm_milan, // 0x11f8
        cer_camo_comp_02_zm_mpug40, // 0x11f9
        cer_camo_comp_02_zm_wand, // 0x11fa
        cer_camo_comp_03_mp_cleaver, // 0x11fb
        cer_camo_comp_03_mp_drill, // 0x11fc
        cer_camo_comp_03_mp_fable, // 0x11fd
        cer_camo_comp_03_mp_goslo, // 0x11fe
        cer_camo_comp_03_mp_jhavana, // 0x11ff
        cer_camo_comp_03_mp_mary82, // 0x1200
        cer_camo_comp_03_mp_saug, // 0x1201
        cer_camo_comp_03_mp_perth, // 0x1202
        cer_camo_comp_03_mp_uxray, // 0x1203
        cer_camo_comp_03_mp_tbaker, // 0x1204
        cer_camo_comp_03_mp_blauncher, // 0x1205
        cer_camo_comp_03_mp_skateboard, // 0x1206
        cer_camo_comp_03_mp_bostaff, // 0x1207
        cer_camo_comp_03_mp_katanas, // 0x1208
        cer_camo_comp_03_mp_nunchaku, // 0x1209
        cer_camo_comp_03_mp_sais, // 0x120a
        cer_camo_comp_03_mp_gilroy, // 0x120b
        cer_camo_comp_03_mp_hugo, // 0x120c
        cer_camo_comp_03_mp_keene, // 0x120d
        cer_camo_comp_03_mp_kent, // 0x120e
        cer_camo_comp_03_mp_pyork, // 0x120f
        cer_camo_comp_03_mp_schuck, // 0x1210
        cer_camo_comp_03_mp_napa, // 0x1211
        cer_camo_comp_03_mp_erie, // 0x1212
        cer_camo_comp_03_mp_fresno, // 0x1213
        cer_camo_comp_03_mp_lisbon, // 0x1214
        cer_camo_comp_03_mp_olove, // 0x1215
        cer_camo_comp_03_mp_pickaxe, // 0x1216
        cer_camo_comp_03_mp_aspen, // 0x1217
        cer_camo_comp_03_mp_mesa, // 0x1218
        cer_camo_comp_03_mp_bgloves, // 0x1219
        cer_camo_comp_03_mp_csaw, // 0x121a
        cer_camo_comp_03_mp_milan, // 0x121b
        cer_camo_comp_03_mp_mpug40, // 0x121c
        cer_camo_comp_03_mp_wand, // 0x121d
        cer_camo_comp_03_wz_cleaver, // 0x121e
        cer_camo_comp_03_wz_drill, // 0x121f
        cer_camo_comp_03_wz_fable, // 0x1220
        cer_camo_comp_03_wz_goslo, // 0x1221
        cer_camo_comp_03_wz_jhavana, // 0x1222
        cer_camo_comp_03_wz_mary82, // 0x1223
        cer_camo_comp_03_wz_saug, // 0x1224
        cer_camo_comp_03_wz_perth, // 0x1225
        cer_camo_comp_03_wz_uxray, // 0x1226
        cer_camo_comp_03_wz_tbaker, // 0x1227
        cer_camo_comp_03_wz_blauncher, // 0x1228
        cer_camo_comp_03_wz_skateboard, // 0x1229
        cer_camo_comp_03_wz_bostaff, // 0x122a
        cer_camo_comp_03_wz_katanas, // 0x122b
        cer_camo_comp_03_wz_nunchaku, // 0x122c
        cer_camo_comp_03_wz_sais, // 0x122d
        cer_camo_comp_03_wz_gilroy, // 0x122e
        cer_camo_comp_03_wz_hugo, // 0x122f
        cer_camo_comp_03_wz_keene, // 0x1230
        cer_camo_comp_03_wz_kent, // 0x1231
        cer_camo_comp_03_wz_pyork, // 0x1232
        cer_camo_comp_03_wz_schuck, // 0x1233
        cer_camo_comp_03_wz_napa, // 0x1234
        cer_camo_comp_03_wz_erie, // 0x1235
        cer_camo_comp_03_wz_fresno, // 0x1236
        cer_camo_comp_03_wz_lisbon, // 0x1237
        cer_camo_comp_03_wz_olove, // 0x1238
        cer_camo_comp_03_wz_pickaxe, // 0x1239
        cer_camo_comp_03_wz_aspen, // 0x123a
        cer_camo_comp_03_wz_mesa, // 0x123b
        cer_camo_comp_03_wz_bgloves, // 0x123c
        cer_camo_comp_03_wz_csaw, // 0x123d
        cer_camo_comp_03_wz_milan, // 0x123e
        cer_camo_comp_03_wz_mpug40, // 0x123f
        cer_camo_comp_03_wz_wand, // 0x1240
        cer_camo_comp_03_zm_cleaver, // 0x1241
        cer_camo_comp_03_zm_drill, // 0x1242
        cer_camo_comp_03_zm_fable, // 0x1243
        cer_camo_comp_03_zm_goslo, // 0x1244
        cer_camo_comp_03_zm_jhavana, // 0x1245
        cer_camo_comp_03_zm_mary82, // 0x1246
        cer_camo_comp_03_zm_saug, // 0x1247
        cer_camo_comp_03_zm_perth, // 0x1248
        cer_camo_comp_03_zm_uxray, // 0x1249
        cer_camo_comp_03_zm_tbaker, // 0x124a
        cer_camo_comp_03_zm_blauncher, // 0x124b
        cer_camo_comp_03_zm_skateboard, // 0x124c
        cer_camo_comp_03_zm_bostaff, // 0x124d
        cer_camo_comp_03_zm_katanas, // 0x124e
        cer_camo_comp_03_zm_nunchaku, // 0x124f
        cer_camo_comp_03_zm_sais, // 0x1250
        cer_camo_comp_03_zm_gilroy, // 0x1251
        cer_camo_comp_03_zm_hugo, // 0x1252
        cer_camo_comp_03_zm_keene, // 0x1253
        cer_camo_comp_03_zm_kent, // 0x1254
        cer_camo_comp_03_zm_pyork, // 0x1255
        cer_camo_comp_03_zm_schuck, // 0x1256
        cer_camo_comp_03_zm_napa, // 0x1257
        cer_camo_comp_03_zm_erie, // 0x1258
        cer_camo_comp_03_zm_fresno, // 0x1259
        cer_camo_comp_03_zm_lisbon, // 0x125a
        cer_camo_comp_03_zm_olove, // 0x125b
        cer_camo_comp_03_zm_pickaxe, // 0x125c
        cer_camo_comp_03_zm_aspen, // 0x125d
        cer_camo_comp_03_zm_mesa, // 0x125e
        cer_camo_comp_03_zm_bgloves, // 0x125f
        cer_camo_comp_03_zm_csaw, // 0x1260
        cer_camo_comp_03_zm_milan, // 0x1261
        cer_camo_comp_03_zm_mpug40, // 0x1262
        cer_camo_comp_03_zm_wand, // 0x1263
        cer_camo_comp_04_mp_cleaver, // 0x1264
        cer_camo_comp_04_mp_drill, // 0x1265
        cer_camo_comp_04_mp_fable, // 0x1266
        cer_camo_comp_04_mp_goslo, // 0x1267
        cer_camo_comp_04_mp_jhavana, // 0x1268
        cer_camo_comp_04_mp_mary82, // 0x1269
        cer_camo_comp_04_mp_saug, // 0x126a
        cer_camo_comp_04_mp_perth, // 0x126b
        cer_camo_comp_04_mp_uxray, // 0x126c
        cer_camo_comp_04_mp_tbaker, // 0x126d
        cer_camo_comp_04_mp_blauncher, // 0x126e
        cer_camo_comp_04_mp_skateboard, // 0x126f
        cer_camo_comp_04_mp_bostaff, // 0x1270
        cer_camo_comp_04_mp_katanas, // 0x1271
        cer_camo_comp_04_mp_nunchaku, // 0x1272
        cer_camo_comp_04_mp_sais, // 0x1273
        cer_camo_comp_04_mp_gilroy, // 0x1274
        cer_camo_comp_04_mp_hugo, // 0x1275
        cer_camo_comp_04_mp_keene, // 0x1276
        cer_camo_comp_04_mp_kent, // 0x1277
        cer_camo_comp_04_mp_pyork, // 0x1278
        cer_camo_comp_04_mp_schuck, // 0x1279
        cer_camo_comp_04_mp_napa, // 0x127a
        cer_camo_comp_04_mp_erie, // 0x127b
        cer_camo_comp_04_mp_fresno, // 0x127c
        cer_camo_comp_04_mp_lisbon, // 0x127d
        cer_camo_comp_04_mp_olove, // 0x127e
        cer_camo_comp_04_mp_pickaxe, // 0x127f
        cer_camo_comp_04_mp_aspen, // 0x1280
        cer_camo_comp_04_mp_mesa, // 0x1281
        cer_camo_comp_04_mp_bgloves, // 0x1282
        cer_camo_comp_04_mp_csaw, // 0x1283
        cer_camo_comp_04_mp_milan, // 0x1284
        cer_camo_comp_04_mp_mpug40, // 0x1285
        cer_camo_comp_04_mp_wand, // 0x1286
        cer_camo_comp_04_wz_cleaver, // 0x1287
        cer_camo_comp_04_wz_drill, // 0x1288
        cer_camo_comp_04_wz_fable, // 0x1289
        cer_camo_comp_04_wz_goslo, // 0x128a
        cer_camo_comp_04_wz_jhavana, // 0x128b
        cer_camo_comp_04_wz_mary82, // 0x128c
        cer_camo_comp_04_wz_saug, // 0x128d
        cer_camo_comp_04_wz_perth, // 0x128e
        cer_camo_comp_04_wz_uxray, // 0x128f
        cer_camo_comp_04_wz_tbaker, // 0x1290
        cer_camo_comp_04_wz_blauncher, // 0x1291
        cer_camo_comp_04_wz_skateboard, // 0x1292
        cer_camo_comp_04_wz_bostaff, // 0x1293
        cer_camo_comp_04_wz_katanas, // 0x1294
        cer_camo_comp_04_wz_nunchaku, // 0x1295
        cer_camo_comp_04_wz_sais, // 0x1296
        cer_camo_comp_04_wz_gilroy, // 0x1297
        cer_camo_comp_04_wz_hugo, // 0x1298
        cer_camo_comp_04_wz_keene, // 0x1299
        cer_camo_comp_04_wz_kent, // 0x129a
        cer_camo_comp_04_wz_pyork, // 0x129b
        cer_camo_comp_04_wz_schuck, // 0x129c
        cer_camo_comp_04_wz_napa, // 0x129d
        cer_camo_comp_04_wz_erie, // 0x129e
        cer_camo_comp_04_wz_fresno, // 0x129f
        cer_camo_comp_04_wz_lisbon, // 0x12a0
        cer_camo_comp_04_wz_olove, // 0x12a1
        cer_camo_comp_04_wz_pickaxe, // 0x12a2
        cer_camo_comp_04_wz_aspen, // 0x12a3
        cer_camo_comp_04_wz_mesa, // 0x12a4
        cer_camo_comp_04_wz_bgloves, // 0x12a5
        cer_camo_comp_04_wz_csaw, // 0x12a6
        cer_camo_comp_04_wz_milan, // 0x12a7
        cer_camo_comp_04_wz_mpug40, // 0x12a8
        cer_camo_comp_04_wz_wand, // 0x12a9
        cer_camo_comp_04_zm_cleaver, // 0x12aa
        cer_camo_comp_04_zm_drill, // 0x12ab
        cer_camo_comp_04_zm_fable, // 0x12ac
        cer_camo_comp_04_zm_goslo, // 0x12ad
        cer_camo_comp_04_zm_jhavana, // 0x12ae
        cer_camo_comp_04_zm_mary82, // 0x12af
        cer_camo_comp_04_zm_saug, // 0x12b0
        cer_camo_comp_04_zm_perth, // 0x12b1
        cer_camo_comp_04_zm_uxray, // 0x12b2
        cer_camo_comp_04_zm_tbaker, // 0x12b3
        cer_camo_comp_04_zm_blauncher, // 0x12b4
        cer_camo_comp_04_zm_skateboard, // 0x12b5
        cer_camo_comp_04_zm_bostaff, // 0x12b6
        cer_camo_comp_04_zm_katanas, // 0x12b7
        cer_camo_comp_04_zm_nunchaku, // 0x12b8
        cer_camo_comp_04_zm_sais, // 0x12b9
        cer_camo_comp_04_zm_gilroy, // 0x12ba
        cer_camo_comp_04_zm_hugo, // 0x12bb
        cer_camo_comp_04_zm_keene, // 0x12bc
        cer_camo_comp_04_zm_kent, // 0x12bd
        cer_camo_comp_04_zm_pyork, // 0x12be
        cer_camo_comp_04_zm_schuck, // 0x12bf
        cer_camo_comp_04_zm_napa, // 0x12c0
        cer_camo_comp_04_zm_erie, // 0x12c1
        cer_camo_comp_04_zm_fresno, // 0x12c2
        cer_camo_comp_04_zm_lisbon, // 0x12c3
        cer_camo_comp_04_zm_olove, // 0x12c4
        cer_camo_comp_04_zm_pickaxe, // 0x12c5
        cer_camo_comp_04_zm_aspen, // 0x12c6
        cer_camo_comp_04_zm_mesa, // 0x12c7
        cer_camo_comp_04_zm_bgloves, // 0x12c8
        cer_camo_comp_04_zm_csaw, // 0x12c9
        cer_camo_comp_04_zm_milan, // 0x12ca
        cer_camo_comp_04_zm_mpug40, // 0x12cb
        cer_camo_comp_04_zm_wand, // 0x12cc
        cer_camo_juliett_09, // 0x12cd
        cer_camo_juliett_10, // 0x12ce
        cer_camo_juliett_11, // 0x12cf
        cer_camo_juliett_12, // 0x12d0
        cer_camo_juliett_13, // 0x12d1
        cer_camo_juliett_14, // 0x12d2
        cer_camo_juliett_15, // 0x12d3
        cer_camo_juliett_16, // 0x12d4
        cer_camo_juliett_09_wz, // 0x12d5
        cer_camo_juliett_10_wz, // 0x12d6
        cer_camo_juliett_11_wz, // 0x12d7
        cer_camo_juliett_12_wz, // 0x12d8
        cer_camo_juliett_13_wz, // 0x12d9
        cer_camo_juliett_14_wz, // 0x12da
        cer_camo_juliett_15_wz, // 0x12db
        cer_camo_juliett_16_wz, // 0x12dc
        cer_camo_juliett_09_zm, // 0x12dd
        cer_camo_juliett_10_zm, // 0x12de
        cer_camo_juliett_11_zm, // 0x12df
        cer_camo_juliett_12_zm, // 0x12e0
        cer_camo_juliett_13_zm, // 0x12e1
        cer_camo_juliett_14_zm, // 0x12e2
        cer_camo_juliett_15_zm, // 0x12e3
        cer_camo_juliett_16_zm, // 0x12e4
        cer_camo_kilo_09, // 0x12e5
        cer_camo_kilo_10, // 0x12e6
        cer_camo_kilo_11, // 0x12e7
        cer_camo_kilo_12, // 0x12e8
        cer_camo_kilo_13, // 0x12e9
        cer_camo_kilo_14, // 0x12ea
        cer_camo_kilo_15, // 0x12eb
        cer_camo_kilo_16, // 0x12ec
        cer_camo_kilo_09_wz, // 0x12ed
        cer_camo_kilo_10_wz, // 0x12ee
        cer_camo_kilo_11_wz, // 0x12ef
        cer_camo_kilo_12_wz, // 0x12f0
        cer_camo_kilo_13_wz, // 0x12f1
        cer_camo_kilo_14_wz, // 0x12f2
        cer_camo_kilo_15_wz, // 0x12f3
        cer_camo_kilo_16_wz, // 0x12f4
        cer_camo_kilo_09_zm, // 0x12f5
        cer_camo_kilo_10_zm, // 0x12f6
        cer_camo_kilo_11_zm, // 0x12f7
        cer_camo_kilo_12_zm, // 0x12f8
        cer_camo_kilo_13_zm, // 0x12f9
        cer_camo_kilo_14_zm, // 0x12fa
        cer_camo_kilo_15_zm, // 0x12fb
        cer_camo_kilo_16_zm, // 0x12fc
        cer_camo_lima_01, // 0x12fd
        cer_camo_lima_02, // 0x12fe
        cer_camo_lima_03, // 0x12ff
        cer_camo_lima_04, // 0x1300
        cer_camo_lima_05, // 0x1301
        cer_camo_lima_06, // 0x1302
        cer_camo_lima_07, // 0x1303
        cer_camo_lima_08, // 0x1304
        cer_camo_lima_09, // 0x1305
        cer_camo_lima_10, // 0x1306
        cer_camo_lima_11, // 0x1307
        cer_camo_lima_12, // 0x1308
        cer_camo_lima_13, // 0x1309
        cer_camo_lima_14, // 0x130a
        cer_camo_lima_15, // 0x130b
        cer_camo_lima_16, // 0x130c
        cer_camo_lima_01_wz, // 0x130d
        cer_camo_lima_02_wz, // 0x130e
        cer_camo_lima_03_wz, // 0x130f
        cer_camo_lima_04_wz, // 0x1310
        cer_camo_lima_05_wz, // 0x1311
        cer_camo_lima_06_wz, // 0x1312
        cer_camo_lima_07_wz, // 0x1313
        cer_camo_lima_08_wz, // 0x1314
        cer_camo_lima_09_wz, // 0x1315
        cer_camo_lima_10_wz, // 0x1316
        cer_camo_lima_11_wz, // 0x1317
        cer_camo_lima_12_wz, // 0x1318
        cer_camo_lima_13_wz, // 0x1319
        cer_camo_lima_14_wz, // 0x131a
        cer_camo_lima_15_wz, // 0x131b
        cer_camo_lima_16_wz, // 0x131c
        cer_camo_lima_01_zm, // 0x131d
        cer_camo_lima_02_zm, // 0x131e
        cer_camo_lima_03_zm, // 0x131f
        cer_camo_lima_04_zm, // 0x1320
        cer_camo_lima_05_zm, // 0x1321
        cer_camo_lima_06_zm, // 0x1322
        cer_camo_lima_07_zm, // 0x1323
        cer_camo_lima_08_zm, // 0x1324
        cer_camo_lima_09_zm, // 0x1325
        cer_camo_lima_10_zm, // 0x1326
        cer_camo_lima_11_zm, // 0x1327
        cer_camo_lima_12_zm, // 0x1328
        cer_camo_lima_13_zm, // 0x1329
        cer_camo_lima_14_zm, // 0x132a
        cer_camo_lima_15_zm, // 0x132b
        cer_camo_lima_16_zm, // 0x132c
        cer_camo_mike_01, // 0x132d
        cer_camo_mike_02, // 0x132e
        cer_camo_mike_03, // 0x132f
        cer_camo_mike_04, // 0x1330
        cer_camo_mike_05, // 0x1331
        cer_camo_mike_06, // 0x1332
        cer_camo_mike_07, // 0x1333
        cer_camo_mike_08, // 0x1334
        cer_camo_mike_09, // 0x1335
        cer_camo_mike_10, // 0x1336
        cer_camo_mike_11, // 0x1337
        cer_camo_mike_12, // 0x1338
        cer_camo_mike_13, // 0x1339
        cer_camo_mike_14, // 0x133a
        cer_camo_mike_15, // 0x133b
        cer_camo_mike_16, // 0x133c
        cer_camo_mike_01_wz, // 0x133d
        cer_camo_mike_02_wz, // 0x133e
        cer_camo_mike_03_wz, // 0x133f
        cer_camo_mike_04_wz, // 0x1340
        cer_camo_mike_05_wz, // 0x1341
        cer_camo_mike_06_wz, // 0x1342
        cer_camo_mike_07_wz, // 0x1343
        cer_camo_mike_08_wz, // 0x1344
        cer_camo_mike_09_wz, // 0x1345
        cer_camo_mike_10_wz, // 0x1346
        cer_camo_mike_11_wz, // 0x1347
        cer_camo_mike_12_wz, // 0x1348
        cer_camo_mike_13_wz, // 0x1349
        cer_camo_mike_14_wz, // 0x134a
        cer_camo_mike_15_wz, // 0x134b
        cer_camo_mike_16_wz, // 0x134c
        cer_camo_mike_01_zm, // 0x134d
        cer_camo_mike_02_zm, // 0x134e
        cer_camo_mike_03_zm, // 0x134f
        cer_camo_mike_04_zm, // 0x1350
        cer_camo_mike_05_zm, // 0x1351
        cer_camo_mike_06_zm, // 0x1352
        cer_camo_mike_07_zm, // 0x1353
        cer_camo_mike_08_zm, // 0x1354
        cer_camo_mike_09_zm, // 0x1355
        cer_camo_mike_10_zm, // 0x1356
        cer_camo_mike_11_zm, // 0x1357
        cer_camo_mike_12_zm, // 0x1358
        cer_camo_mike_13_zm, // 0x1359
        cer_camo_mike_14_zm, // 0x135a
        cer_camo_mike_15_zm, // 0x135b
        cer_camo_mike_16_zm, // 0x135c
        camo_comp_01_acharlie300, // 0x135d
        camo_comp_01_acharlie45, // 0x135e
        camo_comp_01_acharlie9, // 0x135f
        camo_comp_01_ahotel, // 0x1360
        camo_comp_01_akilo, // 0x1361
        camo_comp_01_akilo105, // 0x1362
        camo_comp_01_akilo74, // 0x1363
        camo_comp_01_alpha50, // 0x1364
        camo_comp_01_alpha57, // 0x1365
        camo_comp_01_apapa, // 0x1366
        camo_comp_01_augolf, // 0x1367
        camo_comp_01_aviktor, // 0x1368
        camo_comp_01_beta, // 0x1369
        camo_comp_01_charlie725, // 0x136a
        camo_comp_01_crossbow, // 0x136b
        camo_comp_01_decho, // 0x136c
        camo_comp_01_dechoauto, // 0x136d
        camo_comp_01_falpha, // 0x136e
        camo_comp_01_fecho, // 0x136f
        camo_comp_01_foxtrot, // 0x1370
        camo_comp_01_golf17, // 0x1371
        camo_comp_01_golf18, // 0x1372
        camo_comp_01_golf3, // 0x1373
        camo_comp_01_gromeo, // 0x1374
        camo_comp_01_helima, // 0x1375
        camo_comp_01_india, // 0x1376
        camo_comp_01_juliet, // 0x1377
        camo_comp_01_kamas, // 0x1378
        camo_comp_01_kgolf, // 0x1379
        camo_comp_01_kilo21, // 0x137a
        camo_comp_01_kilo53, // 0x137b
        camo_comp_01_knife, // 0x137c
        camo_comp_01_la700, // 0x137d
        camo_comp_01_limax, // 0x137e
        camo_comp_01_malima, // 0x137f
        camo_comp_01_mbravo, // 0x1380
        camo_comp_01_mcbravo, // 0x1381
        camo_comp_01_mcharlie, // 0x1382
        camo_comp_01_mike1014, // 0x1383
        camo_comp_01_mike14, // 0x1384
        camo_comp_01_mike16, // 0x1385
        camo_comp_01_mike2011, // 0x1386
        camo_comp_01_mike24, // 0x1387
        camo_comp_01_mike32, // 0x1388
        camo_comp_01_mike4, // 0x1389
        camo_comp_01_mkilo3, // 0x138a
        camo_comp_01_mpapa5, // 0x138b
        camo_comp_01_mpapa7, // 0x138c
        camo_comp_01_mpapax, // 0x138d
        camo_comp_01_mromeo, // 0x138e
        camo_comp_01_msecho, // 0x138f
        camo_comp_01_mviktor, // 0x1390
        camo_comp_01_ngolf7, // 0x1391
        camo_comp_01_ngsierra, // 0x1392
        camo_comp_01_papa220, // 0x1393
        camo_comp_01_papa90, // 0x1394
        camo_comp_01_pgolf1, // 0x1395
        camo_comp_01_pickaxe, // 0x1396
        camo_comp_01_ralpha, // 0x1397
        camo_comp_01_riotshield, // 0x1398
        camo_comp_01_rkilo, // 0x1399
        camo_comp_01_rpapa7, // 0x139a
        camo_comp_01_sa700, // 0x139b
        camo_comp_01_sbeta, // 0x139c
        camo_comp_01_scharlie, // 0x139d
        camo_comp_01_schotel, // 0x139e
        camo_comp_01_scromeo, // 0x139f
        camo_comp_01_sdelta, // 0x13a0
        camo_comp_01_slima, // 0x13a1
        camo_comp_01_soscar14, // 0x13a2
        camo_comp_01_stango25, // 0x13a3
        camo_comp_01_swhiskey, // 0x13a4
        camo_comp_01_sword01, // 0x13a5
        camo_comp_01_tango9, // 0x13a6
        camo_comp_01_tonfa, // 0x13a7
        camo_comp_01_tsierra12, // 0x13a8
        camo_comp_01_vecho, // 0x13a9
        camo_comp_01_victor, // 0x13aa
        camo_comp_01_walpha, // 0x13ab
        camo_comp_01_xmike2010, // 0x13ac
        camo_comp_02_acharlie300, // 0x13ad
        camo_comp_02_acharlie45, // 0x13ae
        camo_comp_02_acharlie9, // 0x13af
        camo_comp_02_ahotel, // 0x13b0
        camo_comp_02_akilo, // 0x13b1
        camo_comp_02_akilo105, // 0x13b2
        camo_comp_02_akilo74, // 0x13b3
        camo_comp_02_alpha50, // 0x13b4
        camo_comp_02_alpha57, // 0x13b5
        camo_comp_02_apapa, // 0x13b6
        camo_comp_02_augolf, // 0x13b7
        camo_comp_02_aviktor, // 0x13b8
        camo_comp_02_beta, // 0x13b9
        camo_comp_02_charlie725, // 0x13ba
        camo_comp_02_crossbow, // 0x13bb
        camo_comp_02_decho, // 0x13bc
        camo_comp_02_dechoauto, // 0x13bd
        camo_comp_02_falpha, // 0x13be
        camo_comp_02_fecho, // 0x13bf
        camo_comp_02_foxtrot, // 0x13c0
        camo_comp_02_golf17, // 0x13c1
        camo_comp_02_golf18, // 0x13c2
        camo_comp_02_golf3, // 0x13c3
        camo_comp_02_gromeo, // 0x13c4
        camo_comp_02_helima, // 0x13c5
        camo_comp_02_india, // 0x13c6
        camo_comp_02_juliet, // 0x13c7
        camo_comp_02_kamas, // 0x13c8
        camo_comp_02_kgolf, // 0x13c9
        camo_comp_02_kilo21, // 0x13ca
        camo_comp_02_kilo53, // 0x13cb
        camo_comp_02_knife, // 0x13cc
        camo_comp_02_la700, // 0x13cd
        camo_comp_02_limax, // 0x13ce
        camo_comp_02_malima, // 0x13cf
        camo_comp_02_mbravo, // 0x13d0
        camo_comp_02_mcbravo, // 0x13d1
        camo_comp_02_mcharlie, // 0x13d2
        camo_comp_02_mike1014, // 0x13d3
        camo_comp_02_mike14, // 0x13d4
        camo_comp_02_mike16, // 0x13d5
        camo_comp_02_mike2011, // 0x13d6
        camo_comp_02_mike24, // 0x13d7
        camo_comp_02_mike32, // 0x13d8
        camo_comp_02_mike4, // 0x13d9
        camo_comp_02_mkilo3, // 0x13da
        camo_comp_02_mpapa5, // 0x13db
        camo_comp_02_mpapa7, // 0x13dc
        camo_comp_02_mpapax, // 0x13dd
        camo_comp_02_mromeo, // 0x13de
        camo_comp_02_msecho, // 0x13df
        camo_comp_02_mviktor, // 0x13e0
        camo_comp_02_ngolf7, // 0x13e1
        camo_comp_02_ngsierra, // 0x13e2
        camo_comp_02_papa220, // 0x13e3
        camo_comp_02_papa90, // 0x13e4
        camo_comp_02_pgolf1, // 0x13e5
        camo_comp_02_pickaxe, // 0x13e6
        camo_comp_02_ralpha, // 0x13e7
        camo_comp_02_riotshield, // 0x13e8
        camo_comp_02_rkilo, // 0x13e9
        camo_comp_02_rpapa7, // 0x13ea
        camo_comp_02_sa700, // 0x13eb
        camo_comp_02_sbeta, // 0x13ec
        camo_comp_02_scharlie, // 0x13ed
        camo_comp_02_schotel, // 0x13ee
        camo_comp_02_scromeo, // 0x13ef
        camo_comp_02_sdelta, // 0x13f0
        camo_comp_02_slima, // 0x13f1
        camo_comp_02_soscar14, // 0x13f2
        camo_comp_02_stango25, // 0x13f3
        camo_comp_02_swhiskey, // 0x13f4
        camo_comp_02_sword01, // 0x13f5
        camo_comp_02_tango9, // 0x13f6
        camo_comp_02_tonfa, // 0x13f7
        camo_comp_02_tsierra12, // 0x13f8
        camo_comp_02_vecho, // 0x13f9
        camo_comp_02_victor, // 0x13fa
        camo_comp_02_walpha, // 0x13fb
        camo_comp_02_xmike2010, // 0x13fc
        camo_comp_03_acharlie300, // 0x13fd
        camo_comp_03_acharlie45, // 0x13fe
        camo_comp_03_acharlie9, // 0x13ff
        camo_comp_03_ahotel, // 0x1400
        camo_comp_03_akilo, // 0x1401
        camo_comp_03_akilo105, // 0x1402
        camo_comp_03_akilo74, // 0x1403
        camo_comp_03_alpha50, // 0x1404
        camo_comp_03_alpha57, // 0x1405
        camo_comp_03_apapa, // 0x1406
        camo_comp_03_augolf, // 0x1407
        camo_comp_03_aviktor, // 0x1408
        camo_comp_03_beta, // 0x1409
        camo_comp_03_charlie725, // 0x140a
        camo_comp_03_crossbow, // 0x140b
        camo_comp_03_decho, // 0x140c
        camo_comp_03_dechoauto, // 0x140d
        camo_comp_03_falpha, // 0x140e
        camo_comp_03_fecho, // 0x140f
        camo_comp_03_foxtrot, // 0x1410
        camo_comp_03_golf17, // 0x1411
        camo_comp_03_golf18, // 0x1412
        camo_comp_03_golf3, // 0x1413
        camo_comp_03_gromeo, // 0x1414
        camo_comp_03_helima, // 0x1415
        camo_comp_03_india, // 0x1416
        camo_comp_03_juliet, // 0x1417
        camo_comp_03_kamas, // 0x1418
        camo_comp_03_kgolf, // 0x1419
        camo_comp_03_kilo21, // 0x141a
        camo_comp_03_kilo53, // 0x141b
        camo_comp_03_knife, // 0x141c
        camo_comp_03_la700, // 0x141d
        camo_comp_03_limax, // 0x141e
        camo_comp_03_malima, // 0x141f
        camo_comp_03_mbravo, // 0x1420
        camo_comp_03_mcbravo, // 0x1421
        camo_comp_03_mcharlie, // 0x1422
        camo_comp_03_mike1014, // 0x1423
        camo_comp_03_mike14, // 0x1424
        camo_comp_03_mike16, // 0x1425
        camo_comp_03_mike2011, // 0x1426
        camo_comp_03_mike24, // 0x1427
        camo_comp_03_mike32, // 0x1428
        camo_comp_03_mike4, // 0x1429
        camo_comp_03_mkilo3, // 0x142a
        camo_comp_03_mpapa5, // 0x142b
        camo_comp_03_mpapa7, // 0x142c
        camo_comp_03_mpapax, // 0x142d
        camo_comp_03_mromeo, // 0x142e
        camo_comp_03_msecho, // 0x142f
        camo_comp_03_mviktor, // 0x1430
        camo_comp_03_ngolf7, // 0x1431
        camo_comp_03_ngsierra, // 0x1432
        camo_comp_03_papa220, // 0x1433
        camo_comp_03_papa90, // 0x1434
        camo_comp_03_pgolf1, // 0x1435
        camo_comp_03_pickaxe, // 0x1436
        camo_comp_03_ralpha, // 0x1437
        camo_comp_03_riotshield, // 0x1438
        camo_comp_03_rkilo, // 0x1439
        camo_comp_03_rpapa7, // 0x143a
        camo_comp_03_sa700, // 0x143b
        camo_comp_03_sbeta, // 0x143c
        camo_comp_03_scharlie, // 0x143d
        camo_comp_03_schotel, // 0x143e
        camo_comp_03_scromeo, // 0x143f
        camo_comp_03_sdelta, // 0x1440
        camo_comp_03_slima, // 0x1441
        camo_comp_03_soscar14, // 0x1442
        camo_comp_03_stango25, // 0x1443
        camo_comp_03_swhiskey, // 0x1444
        camo_comp_03_sword01, // 0x1445
        camo_comp_03_tango9, // 0x1446
        camo_comp_03_tonfa, // 0x1447
        camo_comp_03_tsierra12, // 0x1448
        camo_comp_03_vecho, // 0x1449
        camo_comp_03_victor, // 0x144a
        camo_comp_03_walpha, // 0x144b
        camo_comp_03_xmike2010, // 0x144c
        camo_event_01_ar, // 0x144d
        camo_event_01_br, // 0x144e
        camo_event_01_dm, // 0x144f
        camo_event_01_la, // 0x1450
        camo_event_01_lm, // 0x1451
        camo_event_01_me, // 0x1452
        camo_event_01_pi, // 0x1453
        camo_event_01_sh, // 0x1454
        camo_event_01_sm, // 0x1455
        camo_event_01_sn, // 0x1456
        camo_event_02_ar, // 0x1457
        camo_event_02_br, // 0x1458
        camo_event_02_dm, // 0x1459
        camo_event_02_la, // 0x145a
        camo_event_02_lm, // 0x145b
        camo_event_02_me, // 0x145c
        camo_event_02_pi, // 0x145d
        camo_event_02_sh, // 0x145e
        camo_event_02_sm, // 0x145f
        camo_event_02_sn, // 0x1460
        camo_event_03_ar, // 0x1461
        camo_event_03_br, // 0x1462
        camo_event_03_dm, // 0x1463
        camo_event_03_la, // 0x1464
        camo_event_03_lm, // 0x1465
        camo_event_03_me, // 0x1466
        camo_event_03_pi, // 0x1467
        camo_event_03_sh, // 0x1468
        camo_event_03_sm, // 0x1469
        camo_event_03_sn, // 0x146a
        camo_event_04_ar, // 0x146b
        camo_event_04_br, // 0x146c
        camo_event_04_dm, // 0x146d
        camo_event_04_la, // 0x146e
        camo_event_04_lm, // 0x146f
        camo_event_04_me, // 0x1470
        camo_event_04_pi, // 0x1471
        camo_event_04_sh, // 0x1472
        camo_event_04_sm, // 0x1473
        camo_event_04_sn, // 0x1474
        cer_camo_november_01, // 0x1475
        cer_camo_oscar_01, // 0x1476
        cer_camo_pap_bloodstone_01, // 0x1477
        cer_camo_pap_bloodstone_02, // 0x1478
        cer_camo_pap_bloodstone_03, // 0x1479
        cer_camo_pap_garnet_01, // 0x147a
        cer_camo_pap_garnet_02, // 0x147b
        cer_camo_pap_garnet_03, // 0x147c
        cer_camo_pap_jade_01, // 0x147d
        cer_camo_pap_jade_02, // 0x147e
        cer_camo_pap_jade_03, // 0x147f
        cer_camo_pap_opal_01, // 0x1480
        cer_camo_pap_opal_02, // 0x1481
        cer_camo_pap_opal_03, // 0x1482
        cer_camo_pap_quartz_01, // 0x1483
        cer_camo_pap_quartz_02, // 0x1484
        cer_camo_pap_quartz_03, // 0x1485
        cer_camo_pap_topaz_01, // 0x1486
        cer_camo_pap_topaz_02, // 0x1487
        cer_camo_pap_topaz_03, // 0x1488
        cer_camo_papa_01, // 0x1489
        cer_camo_quebec_01, // 0x148a
        cer_camo_romeo_01, // 0x148b
        cer_camo_sierra_01, // 0x148c
        cer_camo_tango_01, // 0x148d
        cer_camo_temp_01, // 0x148e
        cer_camo_test_01, // 0x148f
        cer_camo_uniform_01, // 0x1490
        cer_camo_victor_01, // 0x1491
        cer_camo_whiskey_01, // 0x1492
        cer_camo_xray_01, // 0x1493
        cer_camo_yankee_01, // 0x1494
        cer_camo_zulu_01, // 0x1495
        jup_camo_03n, // 0x1496
        jup_camo_03o, // 0x1497
        jup_camo_14m, // 0x1498
        jup_camo_comp_01_acharlie, // 0x1499
        jup_camo_comp_01_acharlie450, // 0x149a
        jup_camo_comp_01_acharlied, // 0x149b
        jup_camo_comp_01_anov94, // 0x149c
        jup_camo_comp_01_aromeo200, // 0x149d
        jup_camo_comp_01_aromeo410, // 0x149e
        jup_camo_comp_01_balpha27, // 0x149f
        jup_camo_comp_01_boscar, // 0x14a0
        jup_camo_comp_01_bromeo2, // 0x14a1
        jup_camo_comp_01_bromeo805, // 0x14a2
        jup_camo_comp_01_bromeop, // 0x14a3
        jup_camo_comp_01_cdelta50, // 0x14a4
        jup_camo_comp_01_compound, // 0x14a5
        jup_camo_comp_01_coscar635, // 0x14a6
        jup_camo_comp_01_dromeo, // 0x14a7
        jup_camo_comp_01_evictor, // 0x14a8
        jup_camo_comp_01_falpha, // 0x14a9
        jup_camo_comp_01_foxtrot2000, // 0x14aa
        jup_camo_comp_01_glima21, // 0x14ab
        jup_camo_comp_01_golf36, // 0x14ac
        jup_camo_comp_01_halpha, // 0x14ad
        jup_camo_comp_01_hcharlie36, // 0x14ae
        jup_camo_comp_01_hsierra, // 0x14af
        jup_camo_comp_01_kalpha, // 0x14b0
        jup_camo_comp_01_kappa98, // 0x14b1
        jup_camo_comp_01_knife, // 0x14b2
        jup_camo_comp_01_kpappa50, // 0x14b3
        jup_camo_comp_01_lwhiskey, // 0x14b4
        jup_camo_comp_01_mgolf36, // 0x14b5
        jup_camo_comp_01_mike32, // 0x14b6
        jup_camo_comp_01_mike93, // 0x14b7
        jup_camo_comp_01_mkilo3, // 0x14b8
        jup_camo_comp_01_moscar, // 0x14b9
        jup_camo_comp_01_mpapa9, // 0x14ba
        jup_camo_comp_01_oromeo12, // 0x14bb
        jup_camo_comp_01_pcharlie9, // 0x14bc
        jup_camo_comp_01_pdango, // 0x14bd
        jup_camo_comp_01_pkilop, // 0x14be
        jup_camo_comp_01_pmike, // 0x14bf
        jup_camo_comp_01_qbravo95lsw, // 0x14c0
        jup_camo_comp_01_qbravo97, // 0x14c1
        jup_camo_comp_01_recho870, // 0x14c2
        jup_camo_comp_01_rpapa20, // 0x14c3
        jup_camo_comp_01_rsierra12, // 0x14c4
        jup_camo_comp_01_scharlie3, // 0x14c5
        jup_camo_comp_01_shotel, // 0x14c6
        jup_camo_comp_01_slima8, // 0x14c7
        jup_camo_comp_01_spapa12, // 0x14c8
        jup_camo_comp_01_spear, // 0x14c9
        jup_camo_comp_01_stango44, // 0x14ca
        jup_camo_comp_01_svictor, // 0x14cb
        jup_camo_comp_01_svictork, // 0x14cc
        jup_camo_comp_01_swhiskey, // 0x14cd
        jup_camo_comp_01_talpha95, // 0x14ce
        jup_camo_comp_01_talpham, // 0x14cf
        jup_camo_comp_01_umike, // 0x14d0
        jup_camo_comp_01_uzulu, // 0x14d1
        jup_camo_comp_01_uzulum, // 0x14d2
        jup_camo_comp_01_uzulup, // 0x14d3
        jup_camo_comp_01_xmike5, // 0x14d4
        jup_camo_comp_02_acharlie, // 0x14d5
        jup_camo_comp_02_acharlie450, // 0x14d6
        jup_camo_comp_02_acharlied, // 0x14d7
        jup_camo_comp_02_anov94, // 0x14d8
        jup_camo_comp_02_aromeo200, // 0x14d9
        jup_camo_comp_02_aromeo410, // 0x14da
        jup_camo_comp_02_balpha27, // 0x14db
        jup_camo_comp_02_boscar, // 0x14dc
        jup_camo_comp_02_bromeo2, // 0x14dd
        jup_camo_comp_02_bromeo805, // 0x14de
        jup_camo_comp_02_bromeop, // 0x14df
        jup_camo_comp_02_cdelta50, // 0x14e0
        jup_camo_comp_02_compound, // 0x14e1
        jup_camo_comp_02_coscar635, // 0x14e2
        jup_camo_comp_02_dromeo, // 0x14e3
        jup_camo_comp_02_evictor, // 0x14e4
        jup_camo_comp_02_falpha, // 0x14e5
        jup_camo_comp_02_foxtrot2000, // 0x14e6
        jup_camo_comp_02_glima21, // 0x14e7
        jup_camo_comp_02_golf36, // 0x14e8
        jup_camo_comp_02_halpha, // 0x14e9
        jup_camo_comp_02_hcharlie36, // 0x14ea
        jup_camo_comp_02_hsierra, // 0x14eb
        jup_camo_comp_02_kalpha, // 0x14ec
        jup_camo_comp_02_kappa98, // 0x14ed
        jup_camo_comp_02_knife, // 0x14ee
        jup_camo_comp_02_kpappa50, // 0x14ef
        jup_camo_comp_02_lwhiskey, // 0x14f0
        jup_camo_comp_02_mgolf36, // 0x14f1
        jup_camo_comp_02_mike32, // 0x14f2
        jup_camo_comp_02_mike93, // 0x14f3
        jup_camo_comp_02_mkilo3, // 0x14f4
        jup_camo_comp_02_moscar, // 0x14f5
        jup_camo_comp_02_mpapa9, // 0x14f6
        jup_camo_comp_02_oromeo12, // 0x14f7
        jup_camo_comp_02_pcharlie9, // 0x14f8
        jup_camo_comp_02_pdango, // 0x14f9
        jup_camo_comp_02_pkilop, // 0x14fa
        jup_camo_comp_02_pmike, // 0x14fb
        jup_camo_comp_02_qbravo95lsw, // 0x14fc
        jup_camo_comp_02_qbravo97, // 0x14fd
        jup_camo_comp_02_recho870, // 0x14fe
        jup_camo_comp_02_rpapa20, // 0x14ff
        jup_camo_comp_02_rsierra12, // 0x1500
        jup_camo_comp_02_scharlie3, // 0x1501
        jup_camo_comp_02_shotel, // 0x1502
        jup_camo_comp_02_slima8, // 0x1503
        jup_camo_comp_02_spapa12, // 0x1504
        jup_camo_comp_02_spear, // 0x1505
        jup_camo_comp_02_stango44, // 0x1506
        jup_camo_comp_02_svictor, // 0x1507
        jup_camo_comp_02_svictork, // 0x1508
        jup_camo_comp_02_swhiskey, // 0x1509
        jup_camo_comp_02_talpha95, // 0x150a
        jup_camo_comp_02_talpham, // 0x150b
        jup_camo_comp_02_umike, // 0x150c
        jup_camo_comp_02_uzulu, // 0x150d
        jup_camo_comp_02_uzulum, // 0x150e
        jup_camo_comp_02_uzulup, // 0x150f
        jup_camo_comp_02_xmike5, // 0x1510
        jup_camo_comp_03_acharlie, // 0x1511
        jup_camo_comp_03_acharlie450, // 0x1512
        jup_camo_comp_03_acharlied, // 0x1513
        jup_camo_comp_03_anov94, // 0x1514
        jup_camo_comp_03_aromeo200, // 0x1515
        jup_camo_comp_03_aromeo410, // 0x1516
        jup_camo_comp_03_balpha27, // 0x1517
        jup_camo_comp_03_boscar, // 0x1518
        jup_camo_comp_03_bromeo2, // 0x1519
        jup_camo_comp_03_bromeo805, // 0x151a
        jup_camo_comp_03_bromeop, // 0x151b
        jup_camo_comp_03_cdelta50, // 0x151c
        jup_camo_comp_03_compound, // 0x151d
        jup_camo_comp_03_coscar635, // 0x151e
        jup_camo_comp_03_dromeo, // 0x151f
        jup_camo_comp_03_evictor, // 0x1520
        jup_camo_comp_03_falpha, // 0x1521
        jup_camo_comp_03_foxtrot2000, // 0x1522
        jup_camo_comp_03_glima21, // 0x1523
        jup_camo_comp_03_golf36, // 0x1524
        jup_camo_comp_03_halfa, // 0x1525
        jup_camo_comp_03_halpha, // 0x1526
        jup_camo_comp_03_hcharlie36, // 0x1527
        jup_camo_comp_03_hsierra, // 0x1528
        jup_camo_comp_03_kalpha, // 0x1529
        jup_camo_comp_03_kappa98, // 0x152a
        jup_camo_comp_03_knife, // 0x152b
        jup_camo_comp_03_kpappa50, // 0x152c
        jup_camo_comp_03_lwhiskey, // 0x152d
        jup_camo_comp_03_mgolf36, // 0x152e
        jup_camo_comp_03_mike32, // 0x152f
        jup_camo_comp_03_mike93, // 0x1530
        jup_camo_comp_03_mkilo3, // 0x1531
        jup_camo_comp_03_moscar, // 0x1532
        jup_camo_comp_03_mpapa9, // 0x1533
        jup_camo_comp_03_oromeo12, // 0x1534
        jup_camo_comp_03_pcharlie9, // 0x1535
        jup_camo_comp_03_pdango, // 0x1536
        jup_camo_comp_03_pkilop, // 0x1537
        jup_camo_comp_03_pmike, // 0x1538
        jup_camo_comp_03_qbravo95lsw, // 0x1539
        jup_camo_comp_03_qbravo97, // 0x153a
        jup_camo_comp_03_recho870, // 0x153b
        jup_camo_comp_03_rpapa20, // 0x153c
        jup_camo_comp_03_rsierra12, // 0x153d
        jup_camo_comp_03_scharlie3, // 0x153e
        jup_camo_comp_03_shotel, // 0x153f
        jup_camo_comp_03_slima8, // 0x1540
        jup_camo_comp_03_spapa12, // 0x1541
        jup_camo_comp_03_spear, // 0x1542
        jup_camo_comp_03_stango44, // 0x1543
        jup_camo_comp_03_svictor, // 0x1544
        jup_camo_comp_03_svictork, // 0x1545
        jup_camo_comp_03_swhiskey, // 0x1546
        jup_camo_comp_03_talpha95, // 0x1547
        jup_camo_comp_03_talpham, // 0x1548
        jup_camo_comp_03_umike, // 0x1549
        jup_camo_comp_03_uzulu, // 0x154a
        jup_camo_comp_03_uzulum, // 0x154b
        jup_camo_comp_03_uzulup, // 0x154c
        jup_camo_comp_03_xmike5, // 0x154d
        jup_camo_iw9_prest_01_acharlie300, // 0x154e
        jup_camo_iw9_prest_01_acharlie45, // 0x154f
        jup_camo_iw9_prest_01_acharlie9, // 0x1550
        jup_camo_iw9_prest_01_ahotel, // 0x1551
        jup_camo_iw9_prest_01_akilo, // 0x1552
        jup_camo_iw9_prest_01_akilo105, // 0x1553
        jup_camo_iw9_prest_01_akilo74, // 0x1554
        jup_camo_iw9_prest_01_alpha50, // 0x1555
        jup_camo_iw9_prest_01_alpha57, // 0x1556
        jup_camo_iw9_prest_01_apapa, // 0x1557
        jup_camo_iw9_prest_01_augolf, // 0x1558
        jup_camo_iw9_prest_01_aviktor, // 0x1559
        jup_camo_iw9_prest_01_beta, // 0x155a
        jup_camo_iw9_prest_01_charlie725, // 0x155b
        jup_camo_iw9_prest_01_crossbow, // 0x155c
        jup_camo_iw9_prest_01_decho, // 0x155d
        jup_camo_iw9_prest_01_dechoauto, // 0x155e
        jup_camo_iw9_prest_01_fecho, // 0x155f
        jup_camo_iw9_prest_01_foxtrot, // 0x1560
        jup_camo_iw9_prest_01_golf17, // 0x1561
        jup_camo_iw9_prest_01_golf18, // 0x1562
        jup_camo_iw9_prest_01_golf3, // 0x1563
        jup_camo_iw9_prest_01_gromeo, // 0x1564
        jup_camo_iw9_prest_01_helima, // 0x1565
        jup_camo_iw9_prest_01_india, // 0x1566
        jup_camo_iw9_prest_01_juliet, // 0x1567
        jup_camo_iw9_prest_01_kamas, // 0x1568
        jup_camo_iw9_prest_01_kgolf, // 0x1569
        jup_camo_iw9_prest_01_kilo21, // 0x156a
        jup_camo_iw9_prest_01_kilo53, // 0x156b
        jup_camo_iw9_prest_01_knife, // 0x156c
        jup_camo_iw9_prest_01_la700, // 0x156d
        jup_camo_iw9_prest_01_limax, // 0x156e
        jup_camo_iw9_prest_01_malima, // 0x156f
        jup_camo_iw9_prest_01_mbravo, // 0x1570
        jup_camo_iw9_prest_01_mcbravo, // 0x1571
        jup_camo_iw9_prest_01_mcharlie, // 0x1572
        jup_camo_iw9_prest_01_mike1014, // 0x1573
        jup_camo_iw9_prest_01_mike14, // 0x1574
        jup_camo_iw9_prest_01_mike16, // 0x1575
        jup_camo_iw9_prest_01_mike2011, // 0x1576
        jup_camo_iw9_prest_01_mike24, // 0x1577
        jup_camo_iw9_prest_01_mike32, // 0x1578
        jup_camo_iw9_prest_01_mike4, // 0x1579
        jup_camo_iw9_prest_01_mkilo3, // 0x157a
        jup_camo_iw9_prest_01_mpapa5, // 0x157b
        jup_camo_iw9_prest_01_mpapa7, // 0x157c
        jup_camo_iw9_prest_01_mpapax, // 0x157d
        jup_camo_iw9_prest_01_mromeo, // 0x157e
        jup_camo_iw9_prest_01_msecho, // 0x157f
        jup_camo_iw9_prest_01_mviktor, // 0x1580
        jup_camo_iw9_prest_01_ngolf7, // 0x1581
        jup_camo_iw9_prest_01_ngsierra, // 0x1582
        jup_camo_iw9_prest_01_papa220, // 0x1583
        jup_camo_iw9_prest_01_papa90, // 0x1584
        jup_camo_iw9_prest_01_pgolf1, // 0x1585
        jup_camo_iw9_prest_01_pickaxe, // 0x1586
        jup_camo_iw9_prest_01_ralpha, // 0x1587
        jup_camo_iw9_prest_01_riotshield, // 0x1588
        jup_camo_iw9_prest_01_rkilo, // 0x1589
        jup_camo_iw9_prest_01_rpapa7, // 0x158a
        jup_camo_iw9_prest_01_sa700, // 0x158b
        jup_camo_iw9_prest_01_sbeta, // 0x158c
        jup_camo_iw9_prest_01_scharlie, // 0x158d
        jup_camo_iw9_prest_01_schotel, // 0x158e
        jup_camo_iw9_prest_01_scromeo, // 0x158f
        jup_camo_iw9_prest_01_sdelta, // 0x1590
        jup_camo_iw9_prest_01_slima, // 0x1591
        jup_camo_iw9_prest_01_soscar14, // 0x1592
        jup_camo_iw9_prest_01_stango25, // 0x1593
        jup_camo_iw9_prest_01_swhiskey, // 0x1594
        jup_camo_iw9_prest_01_sword01, // 0x1595
        jup_camo_iw9_prest_01_tango9, // 0x1596
        jup_camo_iw9_prest_01_tonfa, // 0x1597
        jup_camo_iw9_prest_01_tsierra12, // 0x1598
        jup_camo_iw9_prest_01_vecho, // 0x1599
        jup_camo_iw9_prest_01_victor, // 0x159a
        jup_camo_iw9_prest_01_walpha, // 0x159b
        jup_camo_iw9_prest_01_xmike2010, // 0x159c
        jup_camo_iw9_prest_02_acharlie300, // 0x159d
        jup_camo_iw9_prest_02_acharlie45, // 0x159e
        jup_camo_iw9_prest_02_acharlie9, // 0x159f
        jup_camo_iw9_prest_02_ahotel, // 0x15a0
        jup_camo_iw9_prest_02_akilo, // 0x15a1
        jup_camo_iw9_prest_02_akilo105, // 0x15a2
        jup_camo_iw9_prest_02_akilo74, // 0x15a3
        jup_camo_iw9_prest_02_alpha50, // 0x15a4
        jup_camo_iw9_prest_02_alpha57, // 0x15a5
        jup_camo_iw9_prest_02_apapa, // 0x15a6
        jup_camo_iw9_prest_02_augolf, // 0x15a7
        jup_camo_iw9_prest_02_aviktor, // 0x15a8
        jup_camo_iw9_prest_02_beta, // 0x15a9
        jup_camo_iw9_prest_02_charlie725, // 0x15aa
        jup_camo_iw9_prest_02_crossbow, // 0x15ab
        jup_camo_iw9_prest_02_decho, // 0x15ac
        jup_camo_iw9_prest_02_dechoauto, // 0x15ad
        jup_camo_iw9_prest_02_fecho, // 0x15ae
        jup_camo_iw9_prest_02_foxtrot, // 0x15af
        jup_camo_iw9_prest_02_golf17, // 0x15b0
        jup_camo_iw9_prest_02_golf18, // 0x15b1
        jup_camo_iw9_prest_02_golf3, // 0x15b2
        jup_camo_iw9_prest_02_gromeo, // 0x15b3
        jup_camo_iw9_prest_02_helima, // 0x15b4
        jup_camo_iw9_prest_02_india, // 0x15b5
        jup_camo_iw9_prest_02_juliet, // 0x15b6
        jup_camo_iw9_prest_02_kamas, // 0x15b7
        jup_camo_iw9_prest_02_kgolf, // 0x15b8
        jup_camo_iw9_prest_02_kilo21, // 0x15b9
        jup_camo_iw9_prest_02_kilo53, // 0x15ba
        jup_camo_iw9_prest_02_knife, // 0x15bb
        jup_camo_iw9_prest_02_la700, // 0x15bc
        jup_camo_iw9_prest_02_limax, // 0x15bd
        jup_camo_iw9_prest_02_malima, // 0x15be
        jup_camo_iw9_prest_02_mbravo, // 0x15bf
        jup_camo_iw9_prest_02_mcbravo, // 0x15c0
        jup_camo_iw9_prest_02_mcharlie, // 0x15c1
        jup_camo_iw9_prest_02_mike1014, // 0x15c2
        jup_camo_iw9_prest_02_mike14, // 0x15c3
        jup_camo_iw9_prest_02_mike16, // 0x15c4
        jup_camo_iw9_prest_02_mike2011, // 0x15c5
        jup_camo_iw9_prest_02_mike24, // 0x15c6
        jup_camo_iw9_prest_02_mike32, // 0x15c7
        jup_camo_iw9_prest_02_mike4, // 0x15c8
        jup_camo_iw9_prest_02_mkilo3, // 0x15c9
        jup_camo_iw9_prest_02_mpapa5, // 0x15ca
        jup_camo_iw9_prest_02_mpapa7, // 0x15cb
        jup_camo_iw9_prest_02_mpapax, // 0x15cc
        jup_camo_iw9_prest_02_mromeo, // 0x15cd
        jup_camo_iw9_prest_02_msecho, // 0x15ce
        jup_camo_iw9_prest_02_mviktor, // 0x15cf
        jup_camo_iw9_prest_02_ngolf7, // 0x15d0
        jup_camo_iw9_prest_02_ngsierra, // 0x15d1
        jup_camo_iw9_prest_02_papa220, // 0x15d2
        jup_camo_iw9_prest_02_papa90, // 0x15d3
        jup_camo_iw9_prest_02_pgolf1, // 0x15d4
        jup_camo_iw9_prest_02_pickaxe, // 0x15d5
        jup_camo_iw9_prest_02_ralpha, // 0x15d6
        jup_camo_iw9_prest_02_riotshield, // 0x15d7
        jup_camo_iw9_prest_02_rkilo, // 0x15d8
        jup_camo_iw9_prest_02_rpapa7, // 0x15d9
        jup_camo_iw9_prest_02_sa700, // 0x15da
        jup_camo_iw9_prest_02_sbeta, // 0x15db
        jup_camo_iw9_prest_02_scharlie, // 0x15dc
        jup_camo_iw9_prest_02_schotel, // 0x15dd
        jup_camo_iw9_prest_02_scromeo, // 0x15de
        jup_camo_iw9_prest_02_sdelta, // 0x15df
        jup_camo_iw9_prest_02_slima, // 0x15e0
        jup_camo_iw9_prest_02_soscar14, // 0x15e1
        jup_camo_iw9_prest_02_stango25, // 0x15e2
        jup_camo_iw9_prest_02_swhiskey, // 0x15e3
        jup_camo_iw9_prest_02_sword01, // 0x15e4
        jup_camo_iw9_prest_02_tango9, // 0x15e5
        jup_camo_iw9_prest_02_tonfa, // 0x15e6
        jup_camo_iw9_prest_02_tsierra12, // 0x15e7
        jup_camo_iw9_prest_02_vecho, // 0x15e8
        jup_camo_iw9_prest_02_victor, // 0x15e9
        jup_camo_iw9_prest_02_walpha, // 0x15ea
        jup_camo_iw9_prest_02_xmike2010, // 0x15eb
        jup_camo_iw9_prest_03_acharlie300, // 0x15ec
        jup_camo_iw9_prest_03_acharlie45, // 0x15ed
        jup_camo_iw9_prest_03_acharlie9, // 0x15ee
        jup_camo_iw9_prest_03_ahotel, // 0x15ef
        jup_camo_iw9_prest_03_akilo, // 0x15f0
        jup_camo_iw9_prest_03_akilo105, // 0x15f1
        jup_camo_iw9_prest_03_akilo74, // 0x15f2
        jup_camo_iw9_prest_03_alpha50, // 0x15f3
        jup_camo_iw9_prest_03_alpha57, // 0x15f4
        jup_camo_iw9_prest_03_apapa, // 0x15f5
        jup_camo_iw9_prest_03_augolf, // 0x15f6
        jup_camo_iw9_prest_03_aviktor, // 0x15f7
        jup_camo_iw9_prest_03_beta, // 0x15f8
        jup_camo_iw9_prest_03_charlie725, // 0x15f9
        jup_camo_iw9_prest_03_crossbow, // 0x15fa
        jup_camo_iw9_prest_03_decho, // 0x15fb
        jup_camo_iw9_prest_03_dechoauto, // 0x15fc
        jup_camo_iw9_prest_03_fecho, // 0x15fd
        jup_camo_iw9_prest_03_foxtrot, // 0x15fe
        jup_camo_iw9_prest_03_golf17, // 0x15ff
        jup_camo_iw9_prest_03_golf18, // 0x1600
        jup_camo_iw9_prest_03_golf3, // 0x1601
        jup_camo_iw9_prest_03_gromeo, // 0x1602
        jup_camo_iw9_prest_03_helima, // 0x1603
        jup_camo_iw9_prest_03_india, // 0x1604
        jup_camo_iw9_prest_03_juliet, // 0x1605
        jup_camo_iw9_prest_03_kamas, // 0x1606
        jup_camo_iw9_prest_03_kgolf, // 0x1607
        jup_camo_iw9_prest_03_kilo21, // 0x1608
        jup_camo_iw9_prest_03_kilo53, // 0x1609
        jup_camo_iw9_prest_03_knife, // 0x160a
        jup_camo_iw9_prest_03_la700, // 0x160b
        jup_camo_iw9_prest_03_limax, // 0x160c
        jup_camo_iw9_prest_03_malima, // 0x160d
        jup_camo_iw9_prest_03_mbravo, // 0x160e
        jup_camo_iw9_prest_03_mcbravo, // 0x160f
        jup_camo_iw9_prest_03_mcharlie, // 0x1610
        jup_camo_iw9_prest_03_mike1014, // 0x1611
        jup_camo_iw9_prest_03_mike14, // 0x1612
        jup_camo_iw9_prest_03_mike16, // 0x1613
        jup_camo_iw9_prest_03_mike2011, // 0x1614
        jup_camo_iw9_prest_03_mike24, // 0x1615
        jup_camo_iw9_prest_03_mike32, // 0x1616
        jup_camo_iw9_prest_03_mike4, // 0x1617
        jup_camo_iw9_prest_03_mkilo3, // 0x1618
        jup_camo_iw9_prest_03_mpapa5, // 0x1619
        jup_camo_iw9_prest_03_mpapa7, // 0x161a
        jup_camo_iw9_prest_03_mpapax, // 0x161b
        jup_camo_iw9_prest_03_mromeo, // 0x161c
        jup_camo_iw9_prest_03_msecho, // 0x161d
        jup_camo_iw9_prest_03_mviktor, // 0x161e
        jup_camo_iw9_prest_03_ngolf7, // 0x161f
        jup_camo_iw9_prest_03_ngsierra, // 0x1620
        jup_camo_iw9_prest_03_papa220, // 0x1621
        jup_camo_iw9_prest_03_papa90, // 0x1622
        jup_camo_iw9_prest_03_pgolf1, // 0x1623
        jup_camo_iw9_prest_03_pickaxe, // 0x1624
        jup_camo_iw9_prest_03_ralpha, // 0x1625
        jup_camo_iw9_prest_03_riotshield, // 0x1626
        jup_camo_iw9_prest_03_rkilo, // 0x1627
        jup_camo_iw9_prest_03_rpapa7, // 0x1628
        jup_camo_iw9_prest_03_sa700, // 0x1629
        jup_camo_iw9_prest_03_sbeta, // 0x162a
        jup_camo_iw9_prest_03_scharlie, // 0x162b
        jup_camo_iw9_prest_03_schotel, // 0x162c
        jup_camo_iw9_prest_03_scromeo, // 0x162d
        jup_camo_iw9_prest_03_sdelta, // 0x162e
        jup_camo_iw9_prest_03_slima, // 0x162f
        jup_camo_iw9_prest_03_soscar14, // 0x1630
        jup_camo_iw9_prest_03_stango25, // 0x1631
        jup_camo_iw9_prest_03_swhiskey, // 0x1632
        jup_camo_iw9_prest_03_sword01, // 0x1633
        jup_camo_iw9_prest_03_tango9, // 0x1634
        jup_camo_iw9_prest_03_tonfa, // 0x1635
        jup_camo_iw9_prest_03_tsierra12, // 0x1636
        jup_camo_iw9_prest_03_vecho, // 0x1637
        jup_camo_iw9_prest_03_victor, // 0x1638
        jup_camo_iw9_prest_03_walpha, // 0x1639
        jup_camo_iw9_prest_03_xmike2010, // 0x163a
        jup_camo_iw9_prest_04_acharlie300, // 0x163b
        jup_camo_iw9_prest_04_acharlie45, // 0x163c
        jup_camo_iw9_prest_04_acharlie9, // 0x163d
        jup_camo_iw9_prest_04_ahotel, // 0x163e
        jup_camo_iw9_prest_04_akilo, // 0x163f
        jup_camo_iw9_prest_04_akilo105, // 0x1640
        jup_camo_iw9_prest_04_akilo74, // 0x1641
        jup_camo_iw9_prest_04_alpha50, // 0x1642
        jup_camo_iw9_prest_04_alpha57, // 0x1643
        jup_camo_iw9_prest_04_apapa, // 0x1644
        jup_camo_iw9_prest_04_augolf, // 0x1645
        jup_camo_iw9_prest_04_aviktor, // 0x1646
        jup_camo_iw9_prest_04_beta, // 0x1647
        jup_camo_iw9_prest_04_charlie725, // 0x1648
        jup_camo_iw9_prest_04_crossbow, // 0x1649
        jup_camo_iw9_prest_04_decho, // 0x164a
        jup_camo_iw9_prest_04_dechoauto, // 0x164b
        jup_camo_iw9_prest_04_fecho, // 0x164c
        jup_camo_iw9_prest_04_foxtrot, // 0x164d
        jup_camo_iw9_prest_04_golf17, // 0x164e
        jup_camo_iw9_prest_04_golf18, // 0x164f
        jup_camo_iw9_prest_04_golf3, // 0x1650
        jup_camo_iw9_prest_04_gromeo, // 0x1651
        jup_camo_iw9_prest_04_helima, // 0x1652
        jup_camo_iw9_prest_04_india, // 0x1653
        jup_camo_iw9_prest_04_juliet, // 0x1654
        jup_camo_iw9_prest_04_kamas, // 0x1655
        jup_camo_iw9_prest_04_kgolf, // 0x1656
        jup_camo_iw9_prest_04_kilo21, // 0x1657
        jup_camo_iw9_prest_04_kilo53, // 0x1658
        jup_camo_iw9_prest_04_knife, // 0x1659
        jup_camo_iw9_prest_04_la700, // 0x165a
        jup_camo_iw9_prest_04_limax, // 0x165b
        jup_camo_iw9_prest_04_malima, // 0x165c
        jup_camo_iw9_prest_04_mbravo, // 0x165d
        jup_camo_iw9_prest_04_mcbravo, // 0x165e
        jup_camo_iw9_prest_04_mcharlie, // 0x165f
        jup_camo_iw9_prest_04_mike1014, // 0x1660
        jup_camo_iw9_prest_04_mike14, // 0x1661
        jup_camo_iw9_prest_04_mike16, // 0x1662
        jup_camo_iw9_prest_04_mike2011, // 0x1663
        jup_camo_iw9_prest_04_mike24, // 0x1664
        jup_camo_iw9_prest_04_mike32, // 0x1665
        jup_camo_iw9_prest_04_mike4, // 0x1666
        jup_camo_iw9_prest_04_mkilo3, // 0x1667
        jup_camo_iw9_prest_04_mpapa5, // 0x1668
        jup_camo_iw9_prest_04_mpapa7, // 0x1669
        jup_camo_iw9_prest_04_mpapax, // 0x166a
        jup_camo_iw9_prest_04_mromeo, // 0x166b
        jup_camo_iw9_prest_04_msecho, // 0x166c
        jup_camo_iw9_prest_04_mviktor, // 0x166d
        jup_camo_iw9_prest_04_ngolf7, // 0x166e
        jup_camo_iw9_prest_04_ngsierra, // 0x166f
        jup_camo_iw9_prest_04_papa220, // 0x1670
        jup_camo_iw9_prest_04_papa90, // 0x1671
        jup_camo_iw9_prest_04_pgolf1, // 0x1672
        jup_camo_iw9_prest_04_pickaxe, // 0x1673
        jup_camo_iw9_prest_04_ralpha, // 0x1674
        jup_camo_iw9_prest_04_riotshield, // 0x1675
        jup_camo_iw9_prest_04_rkilo, // 0x1676
        jup_camo_iw9_prest_04_rpapa7, // 0x1677
        jup_camo_iw9_prest_04_sa700, // 0x1678
        jup_camo_iw9_prest_04_sbeta, // 0x1679
        jup_camo_iw9_prest_04_scharlie, // 0x167a
        jup_camo_iw9_prest_04_schotel, // 0x167b
        jup_camo_iw9_prest_04_scromeo, // 0x167c
        jup_camo_iw9_prest_04_sdelta, // 0x167d
        jup_camo_iw9_prest_04_slima, // 0x167e
        jup_camo_iw9_prest_04_soscar14, // 0x167f
        jup_camo_iw9_prest_04_stango25, // 0x1680
        jup_camo_iw9_prest_04_swhiskey, // 0x1681
        jup_camo_iw9_prest_04_sword01, // 0x1682
        jup_camo_iw9_prest_04_tango9, // 0x1683
        jup_camo_iw9_prest_04_tonfa, // 0x1684
        jup_camo_iw9_prest_04_tsierra12, // 0x1685
        jup_camo_iw9_prest_04_vecho, // 0x1686
        jup_camo_iw9_prest_04_victor, // 0x1687
        jup_camo_iw9_prest_04_walpha, // 0x1688
        jup_camo_iw9_prest_04_xmike2010, // 0x1689
        jup_camo_n3924_1_hsierra, // 0x168a
        jup_camo_n3924_1_oromeo12, // 0x168b
        jup_camo_n3924_1_pmike, // 0x168c
        jup_camo_n3924_1_talpha95, // 0x168d
        jup_camo_ob_23b, // 0x168e
        jup_camo_ob_23c, // 0x168f
        jup_camo_ob_comp_01_acharlie, // 0x1690
        jup_camo_ob_comp_01_acharlie450, // 0x1691
        jup_camo_ob_comp_01_acharlied, // 0x1692
        jup_camo_ob_comp_01_anov94, // 0x1693
        jup_camo_ob_comp_01_aromeo200, // 0x1694
        jup_camo_ob_comp_01_aromeo410, // 0x1695
        jup_camo_ob_comp_01_balpha27, // 0x1696
        jup_camo_ob_comp_01_boscar, // 0x1697
        jup_camo_ob_comp_01_bromeo2, // 0x1698
        jup_camo_ob_comp_01_bromeo805, // 0x1699
        jup_camo_ob_comp_01_bromeop, // 0x169a
        jup_camo_ob_comp_01_cdelta50, // 0x169b
        jup_camo_ob_comp_01_compound, // 0x169c
        jup_camo_ob_comp_01_coscar635, // 0x169d
        jup_camo_ob_comp_01_dromeo, // 0x169e
        jup_camo_ob_comp_01_evictor, // 0x169f
        jup_camo_ob_comp_01_falpha, // 0x16a0
        jup_camo_ob_comp_01_foxtrot2000, // 0x16a1
        jup_camo_ob_comp_01_glima21, // 0x16a2
        jup_camo_ob_comp_01_golf36, // 0x16a3
        jup_camo_ob_comp_01_halpha, // 0x16a4
        jup_camo_ob_comp_01_hcharlie36, // 0x16a5
        jup_camo_ob_comp_01_hsierra, // 0x16a6
        jup_camo_ob_comp_01_kalpha, // 0x16a7
        jup_camo_ob_comp_01_kappa98, // 0x16a8
        jup_camo_ob_comp_01_knife, // 0x16a9
        jup_camo_ob_comp_01_kpappa50, // 0x16aa
        jup_camo_ob_comp_01_lwhiskey, // 0x16ab
        jup_camo_ob_comp_01_mgolf36, // 0x16ac
        jup_camo_ob_comp_01_mike32, // 0x16ad
        jup_camo_ob_comp_01_mike93, // 0x16ae
        jup_camo_ob_comp_01_mkilo3, // 0x16af
        jup_camo_ob_comp_01_moscar, // 0x16b0
        jup_camo_ob_comp_01_mpapa9, // 0x16b1
        jup_camo_ob_comp_01_oromeo12, // 0x16b2
        jup_camo_ob_comp_01_pcharlie9, // 0x16b3
        jup_camo_ob_comp_01_pdango, // 0x16b4
        jup_camo_ob_comp_01_pkilop, // 0x16b5
        jup_camo_ob_comp_01_pmike, // 0x16b6
        jup_camo_ob_comp_01_qbravo95, // 0x16b7
        jup_camo_ob_comp_01_qbravo95lsw, // 0x16b8
        jup_camo_ob_comp_01_qbravo97, // 0x16b9
        jup_camo_ob_comp_01_recho870, // 0x16ba
        jup_camo_ob_comp_01_rpapa20, // 0x16bb
        jup_camo_ob_comp_01_rsierra12, // 0x16bc
        jup_camo_ob_comp_01_scharlie3, // 0x16bd
        jup_camo_ob_comp_01_shotel, // 0x16be
        jup_camo_ob_comp_01_slima8, // 0x16bf
        jup_camo_ob_comp_01_spapa12, // 0x16c0
        jup_camo_ob_comp_01_spear, // 0x16c1
        jup_camo_ob_comp_01_stango44, // 0x16c2
        jup_camo_ob_comp_01_svictor, // 0x16c3
        jup_camo_ob_comp_01_svictork, // 0x16c4
        jup_camo_ob_comp_01_swhiskey, // 0x16c5
        jup_camo_ob_comp_01_talpha95, // 0x16c6
        jup_camo_ob_comp_01_talpham, // 0x16c7
        jup_camo_ob_comp_01_umike, // 0x16c8
        jup_camo_ob_comp_01_uzulu, // 0x16c9
        jup_camo_ob_comp_01_uzulum, // 0x16ca
        jup_camo_ob_comp_01_uzulup, // 0x16cb
        jup_camo_ob_comp_01_xmike5, // 0x16cc
        jup_camo_ob_comp_02_acharlie, // 0x16cd
        jup_camo_ob_comp_02_acharlie450, // 0x16ce
        jup_camo_ob_comp_02_acharlied, // 0x16cf
        jup_camo_ob_comp_02_anov94, // 0x16d0
        jup_camo_ob_comp_02_aromeo200, // 0x16d1
        jup_camo_ob_comp_02_aromeo410, // 0x16d2
        jup_camo_ob_comp_02_balpha27, // 0x16d3
        jup_camo_ob_comp_02_boscar, // 0x16d4
        jup_camo_ob_comp_02_bromeo2, // 0x16d5
        jup_camo_ob_comp_02_bromeo805, // 0x16d6
        jup_camo_ob_comp_02_bromeop, // 0x16d7
        jup_camo_ob_comp_02_cdelta50, // 0x16d8
        jup_camo_ob_comp_02_compound, // 0x16d9
        jup_camo_ob_comp_02_coscar635, // 0x16da
        jup_camo_ob_comp_02_dromeo, // 0x16db
        jup_camo_ob_comp_02_evictor, // 0x16dc
        jup_camo_ob_comp_02_falpha, // 0x16dd
        jup_camo_ob_comp_02_foxtrot2000, // 0x16de
        jup_camo_ob_comp_02_glima21, // 0x16df
        jup_camo_ob_comp_02_golf36, // 0x16e0
        jup_camo_ob_comp_02_halpha, // 0x16e1
        jup_camo_ob_comp_02_hcharlie36, // 0x16e2
        jup_camo_ob_comp_02_hsierra, // 0x16e3
        jup_camo_ob_comp_02_kalpha, // 0x16e4
        jup_camo_ob_comp_02_kappa98, // 0x16e5
        jup_camo_ob_comp_02_knife, // 0x16e6
        jup_camo_ob_comp_02_kpappa50, // 0x16e7
        jup_camo_ob_comp_02_lwhiskey, // 0x16e8
        jup_camo_ob_comp_02_mgolf36, // 0x16e9
        jup_camo_ob_comp_02_mike32, // 0x16ea
        jup_camo_ob_comp_02_mike93, // 0x16eb
        jup_camo_ob_comp_02_mkilo3, // 0x16ec
        jup_camo_ob_comp_02_moscar, // 0x16ed
        jup_camo_ob_comp_02_mpapa9, // 0x16ee
        jup_camo_ob_comp_02_oromeo12, // 0x16ef
        jup_camo_ob_comp_02_pcharlie9, // 0x16f0
        jup_camo_ob_comp_02_pdango, // 0x16f1
        jup_camo_ob_comp_02_pkilop, // 0x16f2
        jup_camo_ob_comp_02_pmike, // 0x16f3
        jup_camo_ob_comp_02_qbravo95, // 0x16f4
        jup_camo_ob_comp_02_qbravo95lsw, // 0x16f5
        jup_camo_ob_comp_02_qbravo97, // 0x16f6
        jup_camo_ob_comp_02_recho870, // 0x16f7
        jup_camo_ob_comp_02_rpapa20, // 0x16f8
        jup_camo_ob_comp_02_rsierra12, // 0x16f9
        jup_camo_ob_comp_02_scharlie3, // 0x16fa
        jup_camo_ob_comp_02_shotel, // 0x16fb
        jup_camo_ob_comp_02_slima8, // 0x16fc
        jup_camo_ob_comp_02_spapa12, // 0x16fd
        jup_camo_ob_comp_02_spear, // 0x16fe
        jup_camo_ob_comp_02_stango44, // 0x16ff
        jup_camo_ob_comp_02_svictor, // 0x1700
        jup_camo_ob_comp_02_svictork, // 0x1701
        jup_camo_ob_comp_02_swhiskey, // 0x1702
        jup_camo_ob_comp_02_talpha95, // 0x1703
        jup_camo_ob_comp_02_talpham, // 0x1704
        jup_camo_ob_comp_02_umike, // 0x1705
        jup_camo_ob_comp_02_uzulu, // 0x1706
        jup_camo_ob_comp_02_uzulum, // 0x1707
        jup_camo_ob_comp_02_uzulup, // 0x1708
        jup_camo_ob_comp_02_xmike5, // 0x1709
        jup_camo_ob_comp_03_acharlie, // 0x170a
        jup_camo_ob_comp_03_acharlie450, // 0x170b
        jup_camo_ob_comp_03_acharlied, // 0x170c
        jup_camo_ob_comp_03_anov94, // 0x170d
        jup_camo_ob_comp_03_aromeo200, // 0x170e
        jup_camo_ob_comp_03_aromeo410, // 0x170f
        jup_camo_ob_comp_03_balpha27, // 0x1710
        jup_camo_ob_comp_03_boscar, // 0x1711
        jup_camo_ob_comp_03_bromeo2, // 0x1712
        jup_camo_ob_comp_03_bromeo805, // 0x1713
        jup_camo_ob_comp_03_bromeop, // 0x1714
        jup_camo_ob_comp_03_cdelta50, // 0x1715
        jup_camo_ob_comp_03_compound, // 0x1716
        jup_camo_ob_comp_03_coscar635, // 0x1717
        jup_camo_ob_comp_03_dromeo, // 0x1718
        jup_camo_ob_comp_03_evictor, // 0x1719
        jup_camo_ob_comp_03_falpha, // 0x171a
        jup_camo_ob_comp_03_foxtrot2000, // 0x171b
        jup_camo_ob_comp_03_glima21, // 0x171c
        jup_camo_ob_comp_03_golf36, // 0x171d
        jup_camo_ob_comp_03_halpha, // 0x171e
        jup_camo_ob_comp_03_hcharlie36, // 0x171f
        jup_camo_ob_comp_03_hsierra, // 0x1720
        jup_camo_ob_comp_03_kalpha, // 0x1721
        jup_camo_ob_comp_03_kappa98, // 0x1722
        jup_camo_ob_comp_03_knife, // 0x1723
        jup_camo_ob_comp_03_kpappa50, // 0x1724
        jup_camo_ob_comp_03_lwhiskey, // 0x1725
        jup_camo_ob_comp_03_mgolf36, // 0x1726
        jup_camo_ob_comp_03_mike32, // 0x1727
        jup_camo_ob_comp_03_mike93, // 0x1728
        jup_camo_ob_comp_03_mkilo3, // 0x1729
        jup_camo_ob_comp_03_moscar, // 0x172a
        jup_camo_ob_comp_03_mpapa9, // 0x172b
        jup_camo_ob_comp_03_oromeo12, // 0x172c
        jup_camo_ob_comp_03_pcharlie9, // 0x172d
        jup_camo_ob_comp_03_pdango, // 0x172e
        jup_camo_ob_comp_03_pkilop, // 0x172f
        jup_camo_ob_comp_03_pmike, // 0x1730
        jup_camo_ob_comp_03_qbravo95, // 0x1731
        jup_camo_ob_comp_03_qbravo95lsw, // 0x1732
        jup_camo_ob_comp_03_qbravo97, // 0x1733
        jup_camo_ob_comp_03_recho870, // 0x1734
        jup_camo_ob_comp_03_rpapa20, // 0x1735
        jup_camo_ob_comp_03_rsierra12, // 0x1736
        jup_camo_ob_comp_03_scharlie3, // 0x1737
        jup_camo_ob_comp_03_shotel, // 0x1738
        jup_camo_ob_comp_03_slima8, // 0x1739
        jup_camo_ob_comp_03_spapa12, // 0x173a
        jup_camo_ob_comp_03_spear, // 0x173b
        jup_camo_ob_comp_03_stango44, // 0x173c
        jup_camo_ob_comp_03_svictor, // 0x173d
        jup_camo_ob_comp_03_svictork, // 0x173e
        jup_camo_ob_comp_03_swhiskey, // 0x173f
        jup_camo_ob_comp_03_talpha95, // 0x1740
        jup_camo_ob_comp_03_talpham, // 0x1741
        jup_camo_ob_comp_03_umike, // 0x1742
        jup_camo_ob_comp_03_uzulu, // 0x1743
        jup_camo_ob_comp_03_uzulum, // 0x1744
        jup_camo_ob_comp_03_uzulup, // 0x1745
        jup_camo_ob_comp_03_xmike5, // 0x1746
        jup_camo_ob_iw9_comp_01_acharlie300, // 0x1747
        jup_camo_ob_iw9_comp_01_acharlie45, // 0x1748
        jup_camo_ob_iw9_comp_01_acharlie9, // 0x1749
        jup_camo_ob_iw9_comp_01_ahotel, // 0x174a
        jup_camo_ob_iw9_comp_01_akilo, // 0x174b
        jup_camo_ob_iw9_comp_01_akilo105, // 0x174c
        jup_camo_ob_iw9_comp_01_akilo74, // 0x174d
        jup_camo_ob_iw9_comp_01_alpha50, // 0x174e
        jup_camo_ob_iw9_comp_01_alpha57, // 0x174f
        jup_camo_ob_iw9_comp_01_apapa, // 0x1750
        jup_camo_ob_iw9_comp_01_augolf, // 0x1751
        jup_camo_ob_iw9_comp_01_aviktor, // 0x1752
        jup_camo_ob_iw9_comp_01_beta, // 0x1753
        jup_camo_ob_iw9_comp_01_charlie725, // 0x1754
        jup_camo_ob_iw9_comp_01_crossbow, // 0x1755
        jup_camo_ob_iw9_comp_01_decho, // 0x1756
        jup_camo_ob_iw9_comp_01_dechoauto, // 0x1757
        jup_camo_ob_iw9_comp_01_fecho, // 0x1758
        jup_camo_ob_iw9_comp_01_foxtrot, // 0x1759
        jup_camo_ob_iw9_comp_01_golf17, // 0x175a
        jup_camo_ob_iw9_comp_01_golf18, // 0x175b
        jup_camo_ob_iw9_comp_01_golf3, // 0x175c
        jup_camo_ob_iw9_comp_01_gromeo, // 0x175d
        jup_camo_ob_iw9_comp_01_helima, // 0x175e
        jup_camo_ob_iw9_comp_01_india, // 0x175f
        jup_camo_ob_iw9_comp_01_juliet, // 0x1760
        jup_camo_ob_iw9_comp_01_kamas, // 0x1761
        jup_camo_ob_iw9_comp_01_kgolf, // 0x1762
        jup_camo_ob_iw9_comp_01_kilo21, // 0x1763
        jup_camo_ob_iw9_comp_01_kilo53, // 0x1764
        jup_camo_ob_iw9_comp_01_knife, // 0x1765
        jup_camo_ob_iw9_comp_01_la700, // 0x1766
        jup_camo_ob_iw9_comp_01_limax, // 0x1767
        jup_camo_ob_iw9_comp_01_malima, // 0x1768
        jup_camo_ob_iw9_comp_01_mbravo, // 0x1769
        jup_camo_ob_iw9_comp_01_mcbravo, // 0x176a
        jup_camo_ob_iw9_comp_01_mcharlie, // 0x176b
        jup_camo_ob_iw9_comp_01_mike1014, // 0x176c
        jup_camo_ob_iw9_comp_01_mike14, // 0x176d
        jup_camo_ob_iw9_comp_01_mike16, // 0x176e
        jup_camo_ob_iw9_comp_01_mike2011, // 0x176f
        jup_camo_ob_iw9_comp_01_mike24, // 0x1770
        jup_camo_ob_iw9_comp_01_mike32, // 0x1771
        jup_camo_ob_iw9_comp_01_mike4, // 0x1772
        jup_camo_ob_iw9_comp_01_mkilo3, // 0x1773
        jup_camo_ob_iw9_comp_01_mpapa5, // 0x1774
        jup_camo_ob_iw9_comp_01_mpapa7, // 0x1775
        jup_camo_ob_iw9_comp_01_mpapax, // 0x1776
        jup_camo_ob_iw9_comp_01_mromeo, // 0x1777
        jup_camo_ob_iw9_comp_01_msecho, // 0x1778
        jup_camo_ob_iw9_comp_01_mviktor, // 0x1779
        jup_camo_ob_iw9_comp_01_ngolf7, // 0x177a
        jup_camo_ob_iw9_comp_01_ngsierra, // 0x177b
        jup_camo_ob_iw9_comp_01_papa220, // 0x177c
        jup_camo_ob_iw9_comp_01_papa90, // 0x177d
        jup_camo_ob_iw9_comp_01_pgolf1, // 0x177e
        jup_camo_ob_iw9_comp_01_pickaxe, // 0x177f
        jup_camo_ob_iw9_comp_01_ralpha, // 0x1780
        jup_camo_ob_iw9_comp_01_riotshield, // 0x1781
        jup_camo_ob_iw9_comp_01_rkilo, // 0x1782
        jup_camo_ob_iw9_comp_01_rpapa7, // 0x1783
        jup_camo_ob_iw9_comp_01_sa700, // 0x1784
        jup_camo_ob_iw9_comp_01_sbeta, // 0x1785
        jup_camo_ob_iw9_comp_01_scharlie, // 0x1786
        jup_camo_ob_iw9_comp_01_schotel, // 0x1787
        jup_camo_ob_iw9_comp_01_scromeo, // 0x1788
        jup_camo_ob_iw9_comp_01_sdelta, // 0x1789
        jup_camo_ob_iw9_comp_01_slima, // 0x178a
        jup_camo_ob_iw9_comp_01_soscar14, // 0x178b
        jup_camo_ob_iw9_comp_01_stango25, // 0x178c
        jup_camo_ob_iw9_comp_01_swhiskey, // 0x178d
        jup_camo_ob_iw9_comp_01_sword01, // 0x178e
        jup_camo_ob_iw9_comp_01_tango9, // 0x178f
        jup_camo_ob_iw9_comp_01_tonfa, // 0x1790
        jup_camo_ob_iw9_comp_01_tsierra12, // 0x1791
        jup_camo_ob_iw9_comp_01_vecho, // 0x1792
        jup_camo_ob_iw9_comp_01_victor, // 0x1793
        jup_camo_ob_iw9_comp_01_walpha, // 0x1794
        jup_camo_ob_iw9_comp_01_xmike2010, // 0x1795
        jup_camo_ob_iw9_comp_02_acharlie300, // 0x1796
        jup_camo_ob_iw9_comp_02_acharlie45, // 0x1797
        jup_camo_ob_iw9_comp_02_acharlie9, // 0x1798
        jup_camo_ob_iw9_comp_02_ahotel, // 0x1799
        jup_camo_ob_iw9_comp_02_akilo, // 0x179a
        jup_camo_ob_iw9_comp_02_akilo105, // 0x179b
        jup_camo_ob_iw9_comp_02_akilo74, // 0x179c
        jup_camo_ob_iw9_comp_02_alpha50, // 0x179d
        jup_camo_ob_iw9_comp_02_alpha57, // 0x179e
        jup_camo_ob_iw9_comp_02_apapa, // 0x179f
        jup_camo_ob_iw9_comp_02_augolf, // 0x17a0
        jup_camo_ob_iw9_comp_02_aviktor, // 0x17a1
        jup_camo_ob_iw9_comp_02_beta, // 0x17a2
        jup_camo_ob_iw9_comp_02_charlie725, // 0x17a3
        jup_camo_ob_iw9_comp_02_crossbow, // 0x17a4
        jup_camo_ob_iw9_comp_02_decho, // 0x17a5
        jup_camo_ob_iw9_comp_02_dechoauto, // 0x17a6
        jup_camo_ob_iw9_comp_02_fecho, // 0x17a7
        jup_camo_ob_iw9_comp_02_foxtrot, // 0x17a8
        jup_camo_ob_iw9_comp_02_golf17, // 0x17a9
        jup_camo_ob_iw9_comp_02_golf18, // 0x17aa
        jup_camo_ob_iw9_comp_02_golf3, // 0x17ab
        jup_camo_ob_iw9_comp_02_gromeo, // 0x17ac
        jup_camo_ob_iw9_comp_02_helima, // 0x17ad
        jup_camo_ob_iw9_comp_02_india, // 0x17ae
        jup_camo_ob_iw9_comp_02_juliet, // 0x17af
        jup_camo_ob_iw9_comp_02_kamas, // 0x17b0
        jup_camo_ob_iw9_comp_02_kgolf, // 0x17b1
        jup_camo_ob_iw9_comp_02_kilo21, // 0x17b2
        jup_camo_ob_iw9_comp_02_kilo53, // 0x17b3
        jup_camo_ob_iw9_comp_02_knife, // 0x17b4
        jup_camo_ob_iw9_comp_02_la700, // 0x17b5
        jup_camo_ob_iw9_comp_02_limax, // 0x17b6
        jup_camo_ob_iw9_comp_02_malima, // 0x17b7
        jup_camo_ob_iw9_comp_02_mbravo, // 0x17b8
        jup_camo_ob_iw9_comp_02_mcbravo, // 0x17b9
        jup_camo_ob_iw9_comp_02_mcharlie, // 0x17ba
        jup_camo_ob_iw9_comp_02_mike1014, // 0x17bb
        jup_camo_ob_iw9_comp_02_mike14, // 0x17bc
        jup_camo_ob_iw9_comp_02_mike16, // 0x17bd
        jup_camo_ob_iw9_comp_02_mike2011, // 0x17be
        jup_camo_ob_iw9_comp_02_mike24, // 0x17bf
        jup_camo_ob_iw9_comp_02_mike32, // 0x17c0
        jup_camo_ob_iw9_comp_02_mike4, // 0x17c1
        jup_camo_ob_iw9_comp_02_mkilo3, // 0x17c2
        jup_camo_ob_iw9_comp_02_mpapa5, // 0x17c3
        jup_camo_ob_iw9_comp_02_mpapa7, // 0x17c4
        jup_camo_ob_iw9_comp_02_mpapax, // 0x17c5
        jup_camo_ob_iw9_comp_02_mromeo, // 0x17c6
        jup_camo_ob_iw9_comp_02_msecho, // 0x17c7
        jup_camo_ob_iw9_comp_02_mviktor, // 0x17c8
        jup_camo_ob_iw9_comp_02_ngolf7, // 0x17c9
        jup_camo_ob_iw9_comp_02_ngsierra, // 0x17ca
        jup_camo_ob_iw9_comp_02_papa220, // 0x17cb
        jup_camo_ob_iw9_comp_02_papa90, // 0x17cc
        jup_camo_ob_iw9_comp_02_pgolf1, // 0x17cd
        jup_camo_ob_iw9_comp_02_pickaxe, // 0x17ce
        jup_camo_ob_iw9_comp_02_ralpha, // 0x17cf
        jup_camo_ob_iw9_comp_02_riotshield, // 0x17d0
        jup_camo_ob_iw9_comp_02_rkilo, // 0x17d1
        jup_camo_ob_iw9_comp_02_rpapa7, // 0x17d2
        jup_camo_ob_iw9_comp_02_sa700, // 0x17d3
        jup_camo_ob_iw9_comp_02_sbeta, // 0x17d4
        jup_camo_ob_iw9_comp_02_scharlie, // 0x17d5
        jup_camo_ob_iw9_comp_02_schotel, // 0x17d6
        jup_camo_ob_iw9_comp_02_scromeo, // 0x17d7
        jup_camo_ob_iw9_comp_02_sdelta, // 0x17d8
        jup_camo_ob_iw9_comp_02_slima, // 0x17d9
        jup_camo_ob_iw9_comp_02_soscar14, // 0x17da
        jup_camo_ob_iw9_comp_02_stango25, // 0x17db
        jup_camo_ob_iw9_comp_02_swhiskey, // 0x17dc
        jup_camo_ob_iw9_comp_02_sword01, // 0x17dd
        jup_camo_ob_iw9_comp_02_tango9, // 0x17de
        jup_camo_ob_iw9_comp_02_tonfa, // 0x17df
        jup_camo_ob_iw9_comp_02_tsierra12, // 0x17e0
        jup_camo_ob_iw9_comp_02_vecho, // 0x17e1
        jup_camo_ob_iw9_comp_02_victor, // 0x17e2
        jup_camo_ob_iw9_comp_02_walpha, // 0x17e3
        jup_camo_ob_iw9_comp_02_xmike2010, // 0x17e4
        jup_camo_ob_iw9_comp_03_acharlie300, // 0x17e5
        jup_camo_ob_iw9_comp_03_acharlie45, // 0x17e6
        jup_camo_ob_iw9_comp_03_acharlie9, // 0x17e7
        jup_camo_ob_iw9_comp_03_ahotel, // 0x17e8
        jup_camo_ob_iw9_comp_03_akilo, // 0x17e9
        jup_camo_ob_iw9_comp_03_akilo105, // 0x17ea
        jup_camo_ob_iw9_comp_03_akilo74, // 0x17eb
        jup_camo_ob_iw9_comp_03_alpha50, // 0x17ec
        jup_camo_ob_iw9_comp_03_alpha57, // 0x17ed
        jup_camo_ob_iw9_comp_03_apapa, // 0x17ee
        jup_camo_ob_iw9_comp_03_augolf, // 0x17ef
        jup_camo_ob_iw9_comp_03_aviktor, // 0x17f0
        jup_camo_ob_iw9_comp_03_beta, // 0x17f1
        jup_camo_ob_iw9_comp_03_charlie725, // 0x17f2
        jup_camo_ob_iw9_comp_03_crossbow, // 0x17f3
        jup_camo_ob_iw9_comp_03_decho, // 0x17f4
        jup_camo_ob_iw9_comp_03_dechoauto, // 0x17f5
        jup_camo_ob_iw9_comp_03_fecho, // 0x17f6
        jup_camo_ob_iw9_comp_03_foxtrot, // 0x17f7
        jup_camo_ob_iw9_comp_03_golf17, // 0x17f8
        jup_camo_ob_iw9_comp_03_golf18, // 0x17f9
        jup_camo_ob_iw9_comp_03_golf3, // 0x17fa
        jup_camo_ob_iw9_comp_03_gromeo, // 0x17fb
        jup_camo_ob_iw9_comp_03_helima, // 0x17fc
        jup_camo_ob_iw9_comp_03_india, // 0x17fd
        jup_camo_ob_iw9_comp_03_juliet, // 0x17fe
        jup_camo_ob_iw9_comp_03_kamas, // 0x17ff
        jup_camo_ob_iw9_comp_03_kgolf, // 0x1800
        jup_camo_ob_iw9_comp_03_kilo21, // 0x1801
        jup_camo_ob_iw9_comp_03_kilo53, // 0x1802
        jup_camo_ob_iw9_comp_03_knife, // 0x1803
        jup_camo_ob_iw9_comp_03_la700, // 0x1804
        jup_camo_ob_iw9_comp_03_limax, // 0x1805
        jup_camo_ob_iw9_comp_03_malima, // 0x1806
        jup_camo_ob_iw9_comp_03_mbravo, // 0x1807
        jup_camo_ob_iw9_comp_03_mcbravo, // 0x1808
        jup_camo_ob_iw9_comp_03_mcharlie, // 0x1809
        jup_camo_ob_iw9_comp_03_mike1014, // 0x180a
        jup_camo_ob_iw9_comp_03_mike14, // 0x180b
        jup_camo_ob_iw9_comp_03_mike16, // 0x180c
        jup_camo_ob_iw9_comp_03_mike2011, // 0x180d
        jup_camo_ob_iw9_comp_03_mike24, // 0x180e
        jup_camo_ob_iw9_comp_03_mike32, // 0x180f
        jup_camo_ob_iw9_comp_03_mike4, // 0x1810
        jup_camo_ob_iw9_comp_03_mkilo3, // 0x1811
        jup_camo_ob_iw9_comp_03_mpapa5, // 0x1812
        jup_camo_ob_iw9_comp_03_mpapa7, // 0x1813
        jup_camo_ob_iw9_comp_03_mpapax, // 0x1814
        jup_camo_ob_iw9_comp_03_mromeo, // 0x1815
        jup_camo_ob_iw9_comp_03_msecho, // 0x1816
        jup_camo_ob_iw9_comp_03_mviktor, // 0x1817
        jup_camo_ob_iw9_comp_03_ngolf7, // 0x1818
        jup_camo_ob_iw9_comp_03_ngsierra, // 0x1819
        jup_camo_ob_iw9_comp_03_papa220, // 0x181a
        jup_camo_ob_iw9_comp_03_papa90, // 0x181b
        jup_camo_ob_iw9_comp_03_pgolf1, // 0x181c
        jup_camo_ob_iw9_comp_03_pickaxe, // 0x181d
        jup_camo_ob_iw9_comp_03_ralpha, // 0x181e
        jup_camo_ob_iw9_comp_03_riotshield, // 0x181f
        jup_camo_ob_iw9_comp_03_rkilo, // 0x1820
        jup_camo_ob_iw9_comp_03_rpapa7, // 0x1821
        jup_camo_ob_iw9_comp_03_sa700, // 0x1822
        jup_camo_ob_iw9_comp_03_sbeta, // 0x1823
        jup_camo_ob_iw9_comp_03_scharlie, // 0x1824
        jup_camo_ob_iw9_comp_03_schotel, // 0x1825
        jup_camo_ob_iw9_comp_03_scromeo, // 0x1826
        jup_camo_ob_iw9_comp_03_sdelta, // 0x1827
        jup_camo_ob_iw9_comp_03_slima, // 0x1828
        jup_camo_ob_iw9_comp_03_soscar14, // 0x1829
        jup_camo_ob_iw9_comp_03_stango25, // 0x182a
        jup_camo_ob_iw9_comp_03_swhiskey, // 0x182b
        jup_camo_ob_iw9_comp_03_sword01, // 0x182c
        jup_camo_ob_iw9_comp_03_tango9, // 0x182d
        jup_camo_ob_iw9_comp_03_tonfa, // 0x182e
        jup_camo_ob_iw9_comp_03_tsierra12, // 0x182f
        jup_camo_ob_iw9_comp_03_vecho, // 0x1830
        jup_camo_ob_iw9_comp_03_victor, // 0x1831
        jup_camo_ob_iw9_comp_03_walpha, // 0x1832
        jup_camo_ob_iw9_comp_03_xmike2010, // 0x1833
        jup_camo_ob_pap_a_01, // 0x1834
        jup_camo_ob_pap_a_02, // 0x1835
        jup_camo_ob_pap_a_03, // 0x1836
        jup_camo_prest_01_acharlie, // 0x1837
        jup_camo_prest_01_acharlie450, // 0x1838
        jup_camo_prest_01_acharlied, // 0x1839
        jup_camo_prest_01_anov94, // 0x183a
        jup_camo_prest_01_aromeo200, // 0x183b
        jup_camo_prest_01_aromeo410, // 0x183c
        jup_camo_prest_01_balpha27, // 0x183d
        jup_camo_prest_01_boscar, // 0x183e
        jup_camo_prest_01_bromeo2, // 0x183f
        jup_camo_prest_01_bromeo805, // 0x1840
        jup_camo_prest_01_bromeop, // 0x1841
        jup_camo_prest_01_cdelta50, // 0x1842
        jup_camo_prest_01_compound, // 0x1843
        jup_camo_prest_01_coscar635, // 0x1844
        jup_camo_prest_01_dromeo, // 0x1845
        jup_camo_prest_01_evictor, // 0x1846
        jup_camo_prest_01_falpha, // 0x1847
        jup_camo_prest_01_foxtrot2000, // 0x1848
        jup_camo_prest_01_glima21, // 0x1849
        jup_camo_prest_01_golf36, // 0x184a
        jup_camo_prest_01_halpha, // 0x184b
        jup_camo_prest_01_hcharlie36, // 0x184c
        jup_camo_prest_01_hsierra, // 0x184d
        jup_camo_prest_01_kalpha, // 0x184e
        jup_camo_prest_01_kappa98, // 0x184f
        jup_camo_prest_01_knife, // 0x1850
        jup_camo_prest_01_kpappa50, // 0x1851
        jup_camo_prest_01_lwhiskey, // 0x1852
        jup_camo_prest_01_mgolf36, // 0x1853
        jup_camo_prest_01_mike32, // 0x1854
        jup_camo_prest_01_mike93, // 0x1855
        jup_camo_prest_01_mkilo3, // 0x1856
        jup_camo_prest_01_moscar, // 0x1857
        jup_camo_prest_01_mpapa9, // 0x1858
        jup_camo_prest_01_oromeo12, // 0x1859
        jup_camo_prest_01_pcharlie9, // 0x185a
        jup_camo_prest_01_pdango, // 0x185b
        jup_camo_prest_01_pkilop, // 0x185c
        jup_camo_prest_01_pmike, // 0x185d
        jup_camo_prest_01_qbravo95lsw, // 0x185e
        jup_camo_prest_01_qbravo97, // 0x185f
        jup_camo_prest_01_recho870, // 0x1860
        jup_camo_prest_01_rpapa20, // 0x1861
        jup_camo_prest_01_rsierra12, // 0x1862
        jup_camo_prest_01_scharlie3, // 0x1863
        jup_camo_prest_01_shotel, // 0x1864
        jup_camo_prest_01_slima8, // 0x1865
        jup_camo_prest_01_spapa12, // 0x1866
        jup_camo_prest_01_spear, // 0x1867
        jup_camo_prest_01_stango44, // 0x1868
        jup_camo_prest_01_svictor, // 0x1869
        jup_camo_prest_01_svictork, // 0x186a
        jup_camo_prest_01_swhiskey, // 0x186b
        jup_camo_prest_01_talpha95, // 0x186c
        jup_camo_prest_01_talpham, // 0x186d
        jup_camo_prest_01_umike, // 0x186e
        jup_camo_prest_01_uzulu, // 0x186f
        jup_camo_prest_01_uzulum, // 0x1870
        jup_camo_prest_01_uzulup, // 0x1871
        jup_camo_prest_01_xmike5, // 0x1872
        jup_camo_prest_02_acharlie, // 0x1873
        jup_camo_prest_02_acharlie450, // 0x1874
        jup_camo_prest_02_acharlied, // 0x1875
        jup_camo_prest_02_anov94, // 0x1876
        jup_camo_prest_02_aromeo200, // 0x1877
        jup_camo_prest_02_aromeo410, // 0x1878
        jup_camo_prest_02_balpha27, // 0x1879
        jup_camo_prest_02_boscar, // 0x187a
        jup_camo_prest_02_bromeo2, // 0x187b
        jup_camo_prest_02_bromeo805, // 0x187c
        jup_camo_prest_02_bromeop, // 0x187d
        jup_camo_prest_02_cdelta50, // 0x187e
        jup_camo_prest_02_compound, // 0x187f
        jup_camo_prest_02_coscar635, // 0x1880
        jup_camo_prest_02_dromeo, // 0x1881
        jup_camo_prest_02_evictor, // 0x1882
        jup_camo_prest_02_falpha, // 0x1883
        jup_camo_prest_02_foxtrot2000, // 0x1884
        jup_camo_prest_02_glima21, // 0x1885
        jup_camo_prest_02_golf36, // 0x1886
        jup_camo_prest_02_halpha, // 0x1887
        jup_camo_prest_02_hcharlie36, // 0x1888
        jup_camo_prest_02_hsierra, // 0x1889
        jup_camo_prest_02_kalpha, // 0x188a
        jup_camo_prest_02_kappa98, // 0x188b
        jup_camo_prest_02_knife, // 0x188c
        jup_camo_prest_02_kpappa50, // 0x188d
        jup_camo_prest_02_lwhiskey, // 0x188e
        jup_camo_prest_02_mgolf36, // 0x188f
        jup_camo_prest_02_mike32, // 0x1890
        jup_camo_prest_02_mike93, // 0x1891
        jup_camo_prest_02_mkilo3, // 0x1892
        jup_camo_prest_02_moscar, // 0x1893
        jup_camo_prest_02_mpapa9, // 0x1894
        jup_camo_prest_02_oromeo12, // 0x1895
        jup_camo_prest_02_pcharlie9, // 0x1896
        jup_camo_prest_02_pdango, // 0x1897
        jup_camo_prest_02_pkilop, // 0x1898
        jup_camo_prest_02_pmike, // 0x1899
        jup_camo_prest_02_qbravo95lsw, // 0x189a
        jup_camo_prest_02_qbravo97, // 0x189b
        jup_camo_prest_02_recho870, // 0x189c
        jup_camo_prest_02_rpapa20, // 0x189d
        jup_camo_prest_02_rsierra12, // 0x189e
        jup_camo_prest_02_scharlie3, // 0x189f
        jup_camo_prest_02_shotel, // 0x18a0
        jup_camo_prest_02_slima8, // 0x18a1
        jup_camo_prest_02_spapa12, // 0x18a2
        jup_camo_prest_02_spear, // 0x18a3
        jup_camo_prest_02_stango44, // 0x18a4
        jup_camo_prest_02_svictor, // 0x18a5
        jup_camo_prest_02_svictork, // 0x18a6
        jup_camo_prest_02_swhiskey, // 0x18a7
        jup_camo_prest_02_talpha95, // 0x18a8
        jup_camo_prest_02_talpham, // 0x18a9
        jup_camo_prest_02_umike, // 0x18aa
        jup_camo_prest_02_uzulu, // 0x18ab
        jup_camo_prest_02_uzulum, // 0x18ac
        jup_camo_prest_02_uzulup, // 0x18ad
        jup_camo_prest_02_xmike5, // 0x18ae
        jup_camo_prest_03_acharlie, // 0x18af
        jup_camo_prest_03_acharlie450, // 0x18b0
        jup_camo_prest_03_acharlied, // 0x18b1
        jup_camo_prest_03_anov94, // 0x18b2
        jup_camo_prest_03_aromeo200, // 0x18b3
        jup_camo_prest_03_aromeo410, // 0x18b4
        jup_camo_prest_03_balpha27, // 0x18b5
        jup_camo_prest_03_boscar, // 0x18b6
        jup_camo_prest_03_bromeo2, // 0x18b7
        jup_camo_prest_03_bromeo805, // 0x18b8
        jup_camo_prest_03_bromeop, // 0x18b9
        jup_camo_prest_03_cdelta50, // 0x18ba
        jup_camo_prest_03_compound, // 0x18bb
        jup_camo_prest_03_coscar635, // 0x18bc
        jup_camo_prest_03_dromeo, // 0x18bd
        jup_camo_prest_03_evictor, // 0x18be
        jup_camo_prest_03_falpha, // 0x18bf
        jup_camo_prest_03_foxtrot2000, // 0x18c0
        jup_camo_prest_03_glima21, // 0x18c1
        jup_camo_prest_03_golf36, // 0x18c2
        jup_camo_prest_03_halpha, // 0x18c3
        jup_camo_prest_03_hcharlie36, // 0x18c4
        jup_camo_prest_03_hsierra, // 0x18c5
        jup_camo_prest_03_kalpha, // 0x18c6
        jup_camo_prest_03_kappa98, // 0x18c7
        jup_camo_prest_03_knife, // 0x18c8
        jup_camo_prest_03_kpappa50, // 0x18c9
        jup_camo_prest_03_lwhiskey, // 0x18ca
        jup_camo_prest_03_mgolf36, // 0x18cb
        jup_camo_prest_03_mike32, // 0x18cc
        jup_camo_prest_03_mike93, // 0x18cd
        jup_camo_prest_03_mkilo3, // 0x18ce
        jup_camo_prest_03_moscar, // 0x18cf
        jup_camo_prest_03_mpapa9, // 0x18d0
        jup_camo_prest_03_oromeo12, // 0x18d1
        jup_camo_prest_03_pcharlie9, // 0x18d2
        jup_camo_prest_03_pdango, // 0x18d3
        jup_camo_prest_03_pkilop, // 0x18d4
        jup_camo_prest_03_pmike, // 0x18d5
        jup_camo_prest_03_qbravo95lsw, // 0x18d6
        jup_camo_prest_03_qbravo97, // 0x18d7
        jup_camo_prest_03_recho870, // 0x18d8
        jup_camo_prest_03_rpapa20, // 0x18d9
        jup_camo_prest_03_rsierra12, // 0x18da
        jup_camo_prest_03_scharlie3, // 0x18db
        jup_camo_prest_03_shotel, // 0x18dc
        jup_camo_prest_03_slima8, // 0x18dd
        jup_camo_prest_03_spapa12, // 0x18de
        jup_camo_prest_03_spear, // 0x18df
        jup_camo_prest_03_stango44, // 0x18e0
        jup_camo_prest_03_svictor, // 0x18e1
        jup_camo_prest_03_svictork, // 0x18e2
        jup_camo_prest_03_swhiskey, // 0x18e3
        jup_camo_prest_03_talpha95, // 0x18e4
        jup_camo_prest_03_talpham, // 0x18e5
        jup_camo_prest_03_umike, // 0x18e6
        jup_camo_prest_03_uzulu, // 0x18e7
        jup_camo_prest_03_uzulum, // 0x18e8
        jup_camo_prest_03_uzulup, // 0x18e9
        jup_camo_prest_03_xmike5, // 0x18ea
        jup_camo_prest_04_acharlie, // 0x18eb
        jup_camo_prest_04_acharlie450, // 0x18ec
        jup_camo_prest_04_acharlied, // 0x18ed
        jup_camo_prest_04_anov94, // 0x18ee
        jup_camo_prest_04_aromeo200, // 0x18ef
        jup_camo_prest_04_aromeo410, // 0x18f0
        jup_camo_prest_04_balpha27, // 0x18f1
        jup_camo_prest_04_boscar, // 0x18f2
        jup_camo_prest_04_bromeo2, // 0x18f3
        jup_camo_prest_04_bromeo805, // 0x18f4
        jup_camo_prest_04_bromeop, // 0x18f5
        jup_camo_prest_04_cdelta50, // 0x18f6
        jup_camo_prest_04_compound, // 0x18f7
        jup_camo_prest_04_coscar635, // 0x18f8
        jup_camo_prest_04_dromeo, // 0x18f9
        jup_camo_prest_04_evictor, // 0x18fa
        jup_camo_prest_04_falpha, // 0x18fb
        jup_camo_prest_04_foxtrot2000, // 0x18fc
        jup_camo_prest_04_glima21, // 0x18fd
        jup_camo_prest_04_golf36, // 0x18fe
        jup_camo_prest_04_halpha, // 0x18ff
        jup_camo_prest_04_hcharlie36, // 0x1900
        jup_camo_prest_04_hsierra, // 0x1901
        jup_camo_prest_04_kalpha, // 0x1902
        jup_camo_prest_04_kappa98, // 0x1903
        jup_camo_prest_04_knife, // 0x1904
        jup_camo_prest_04_kpappa50, // 0x1905
        jup_camo_prest_04_lwhiskey, // 0x1906
        jup_camo_prest_04_mgolf36, // 0x1907
        jup_camo_prest_04_mike32, // 0x1908
        jup_camo_prest_04_mike93, // 0x1909
        jup_camo_prest_04_mkilo3, // 0x190a
        jup_camo_prest_04_moscar, // 0x190b
        jup_camo_prest_04_mpapa9, // 0x190c
        jup_camo_prest_04_oromeo12, // 0x190d
        jup_camo_prest_04_pcharlie9, // 0x190e
        jup_camo_prest_04_pdango, // 0x190f
        jup_camo_prest_04_pkilop, // 0x1910
        jup_camo_prest_04_pmike, // 0x1911
        jup_camo_prest_04_qbravo95lsw, // 0x1912
        jup_camo_prest_04_qbravo97, // 0x1913
        jup_camo_prest_04_recho870, // 0x1914
        jup_camo_prest_04_rpapa20, // 0x1915
        jup_camo_prest_04_rsierra12, // 0x1916
        jup_camo_prest_04_scharlie3, // 0x1917
        jup_camo_prest_04_shotel, // 0x1918
        jup_camo_prest_04_slima8, // 0x1919
        jup_camo_prest_04_spapa12, // 0x191a
        jup_camo_prest_04_spear, // 0x191b
        jup_camo_prest_04_stango44, // 0x191c
        jup_camo_prest_04_svictor, // 0x191d
        jup_camo_prest_04_svictork, // 0x191e
        jup_camo_prest_04_swhiskey, // 0x191f
        jup_camo_prest_04_talpha95, // 0x1920
        jup_camo_prest_04_talpham, // 0x1921
        jup_camo_prest_04_umike, // 0x1922
        jup_camo_prest_04_uzulu, // 0x1923
        jup_camo_prest_04_uzulum, // 0x1924
        jup_camo_prest_04_uzulup, // 0x1925
        jup_camo_prest_04_xmike5 // 0x1926
    };

    // idx 0x4 members: 0x2 type: 5
    enum CharacterArchetype {
        none, // 0x0
        archetype_assault // 0x1
    };

    // idx 0x5 members: 0x7f2 type: 5
    enum CosmeticAttachment {
        charm_none, // 0x0
        gunscreen_none, // 0x1
        cos_iw9_001, // 0x2
        cos_iw9_002, // 0x3
        cos_iw9_003, // 0x4
        cos_iw9_004, // 0x5
        cos_iw9_005, // 0x6
        cos_iw9_006, // 0x7
        cos_iw9_007, // 0x8
        cos_iw9_008, // 0x9
        cos_iw9_009, // 0xa
        cos_iw9_010, // 0xb
        cos_iw9_011, // 0xc
        cos_iw9_012, // 0xd
        cos_iw9_013, // 0xe
        cos_iw9_014, // 0xf
        cos_iw9_015, // 0x10
        cos_iw9_016, // 0x11
        cos_iw9_017, // 0x12
        cos_iw9_018, // 0x13
        cos_iw9_019, // 0x14
        cos_iw9_020, // 0x15
        cos_iw9_021, // 0x16
        cos_iw9_022, // 0x17
        cos_iw9_023, // 0x18
        cos_iw9_024, // 0x19
        cos_iw9_025, // 0x1a
        cos_iw9_026, // 0x1b
        cos_iw9_027, // 0x1c
        cos_iw9_028, // 0x1d
        cos_iw9_029, // 0x1e
        cos_iw9_030, // 0x1f
        cos_iw9_031, // 0x20
        cos_iw9_032, // 0x21
        cos_iw9_033, // 0x22
        cos_iw9_034, // 0x23
        cos_iw9_035, // 0x24
        cos_iw9_036, // 0x25
        cos_iw9_037, // 0x26
        cos_iw9_038, // 0x27
        cos_iw9_039, // 0x28
        cos_iw9_040, // 0x29
        cos_iw9_041, // 0x2a
        cos_iw9_042, // 0x2b
        cos_iw9_043, // 0x2c
        cos_iw9_044, // 0x2d
        cos_iw9_045, // 0x2e
        cos_iw9_046, // 0x2f
        cos_iw9_047, // 0x30
        cos_iw9_048, // 0x31
        cos_iw9_049, // 0x32
        cos_iw9_050, // 0x33
        cos_iw9_051, // 0x34
        cos_iw9_052, // 0x35
        cos_iw9_053, // 0x36
        cos_iw9_054, // 0x37
        cos_iw9_055, // 0x38
        cos_iw9_056, // 0x39
        cos_iw9_057, // 0x3a
        cos_iw9_058, // 0x3b
        cos_iw9_059, // 0x3c
        cos_iw9_060, // 0x3d
        cos_iw9_061, // 0x3e
        cos_iw9_062, // 0x3f
        cos_iw9_063, // 0x40
        cos_iw9_064, // 0x41
        cos_iw9_065, // 0x42
        cos_iw9_066, // 0x43
        cos_iw9_067, // 0x44
        cos_iw9_068, // 0x45
        cos_iw9_069, // 0x46
        cos_iw9_070, // 0x47
        cos_iw9_071, // 0x48
        cos_iw9_072, // 0x49
        cos_iw9_073, // 0x4a
        cos_iw9_074, // 0x4b
        cos_iw9_075, // 0x4c
        cos_iw9_076, // 0x4d
        cos_iw9_077, // 0x4e
        cos_iw9_078, // 0x4f
        cos_iw9_079, // 0x50
        cos_iw9_080, // 0x51
        cos_iw9_081, // 0x52
        cos_iw9_082, // 0x53
        cos_iw9_083, // 0x54
        cos_iw9_084, // 0x55
        cos_iw9_085, // 0x56
        cos_iw9_086, // 0x57
        cos_iw9_087, // 0x58
        cos_iw9_088, // 0x59
        cos_iw9_089, // 0x5a
        cos_iw9_090, // 0x5b
        cos_iw9_091, // 0x5c
        cos_iw9_092, // 0x5d
        cos_iw9_093, // 0x5e
        cos_iw9_094, // 0x5f
        cos_iw9_095, // 0x60
        cos_iw9_096, // 0x61
        cos_iw9_097, // 0x62
        cos_iw9_098, // 0x63
        cos_iw9_099, // 0x64
        cos_iw9_100, // 0x65
        cos_iw9_101, // 0x66
        cos_iw9_102, // 0x67
        cos_iw9_103, // 0x68
        cos_iw9_104, // 0x69
        cos_iw9_105, // 0x6a
        cos_iw9_106, // 0x6b
        cos_iw9_107, // 0x6c
        cos_iw9_108, // 0x6d
        cos_iw9_109, // 0x6e
        cos_iw9_110, // 0x6f
        cos_iw9_111, // 0x70
        cos_iw9_112, // 0x71
        cos_iw9_113, // 0x72
        cos_iw9_114, // 0x73
        cos_iw9_115, // 0x74
        cos_iw9_116, // 0x75
        cos_iw9_117, // 0x76
        cos_iw9_118, // 0x77
        cos_iw9_119, // 0x78
        cos_iw9_120, // 0x79
        cos_iw9_121, // 0x7a
        cos_iw9_122, // 0x7b
        cos_iw9_123, // 0x7c
        cos_iw9_124, // 0x7d
        cos_iw9_125, // 0x7e
        cos_iw9_126, // 0x7f
        cos_iw9_127, // 0x80
        cos_iw9_128, // 0x81
        cos_iw9_129, // 0x82
        cos_iw9_130, // 0x83
        cos_iw9_131, // 0x84
        cos_iw9_132, // 0x85
        cos_iw9_133, // 0x86
        cos_iw9_134, // 0x87
        cos_iw9_135, // 0x88
        cos_iw9_136, // 0x89
        cos_iw9_137, // 0x8a
        cos_iw9_138, // 0x8b
        cos_iw9_139, // 0x8c
        cos_iw9_140, // 0x8d
        cos_iw9_141, // 0x8e
        cos_iw9_142, // 0x8f
        cos_iw9_143, // 0x90
        cos_iw9_144, // 0x91
        cos_iw9_145, // 0x92
        cos_iw9_146, // 0x93
        cos_iw9_147, // 0x94
        cos_iw9_148, // 0x95
        cos_iw9_149, // 0x96
        cos_iw9_150, // 0x97
        cos_iw9_151, // 0x98
        cos_iw9_152, // 0x99
        cos_iw9_153, // 0x9a
        cos_iw9_154, // 0x9b
        cos_iw9_155, // 0x9c
        cos_iw9_156, // 0x9d
        cos_iw9_157, // 0x9e
        cos_iw9_158, // 0x9f
        cos_iw9_159, // 0xa0
        cos_iw9_160, // 0xa1
        cos_iw9_161, // 0xa2
        cos_iw9_162, // 0xa3
        cos_iw9_163, // 0xa4
        cos_iw9_164, // 0xa5
        cos_iw9_165, // 0xa6
        cos_iw9_166, // 0xa7
        cos_iw9_167, // 0xa8
        cos_iw9_168, // 0xa9
        cos_iw9_169, // 0xaa
        cos_iw9_170, // 0xab
        cos_iw9_171, // 0xac
        cos_iw9_172, // 0xad
        cos_iw9_173, // 0xae
        cos_iw9_174, // 0xaf
        cos_iw9_175, // 0xb0
        cos_iw9_176, // 0xb1
        cos_iw9_177, // 0xb2
        cos_iw9_178, // 0xb3
        cos_iw9_179, // 0xb4
        cos_iw9_180, // 0xb5
        cos_iw9_181, // 0xb6
        cos_iw9_182, // 0xb7
        cos_iw9_183, // 0xb8
        cos_iw9_184, // 0xb9
        cos_iw9_185, // 0xba
        cos_iw9_186, // 0xbb
        cos_iw9_187, // 0xbc
        cos_iw9_188, // 0xbd
        cos_iw9_189, // 0xbe
        cos_iw9_190, // 0xbf
        cos_iw9_191, // 0xc0
        cos_iw9_192, // 0xc1
        cos_iw9_193, // 0xc2
        cos_iw9_194, // 0xc3
        cos_iw9_195, // 0xc4
        cos_iw9_196, // 0xc5
        cos_iw9_197, // 0xc6
        cos_iw9_198, // 0xc7
        cos_iw9_199, // 0xc8
        cos_iw9_200, // 0xc9
        cos_iw9_201, // 0xca
        cos_iw9_202, // 0xcb
        cos_iw9_203, // 0xcc
        cos_iw9_204, // 0xcd
        cos_iw9_205, // 0xce
        cos_iw9_206, // 0xcf
        cos_iw9_207, // 0xd0
        cos_iw9_208, // 0xd1
        cos_iw9_209, // 0xd2
        cos_iw9_210, // 0xd3
        cos_iw9_211, // 0xd4
        cos_iw9_212, // 0xd5
        cos_iw9_213, // 0xd6
        cos_iw9_214, // 0xd7
        cos_iw9_215, // 0xd8
        cos_iw9_216, // 0xd9
        cos_iw9_217, // 0xda
        cos_iw9_218, // 0xdb
        cos_iw9_219, // 0xdc
        cos_iw9_220, // 0xdd
        cos_iw9_221, // 0xde
        cos_iw9_222, // 0xdf
        cos_iw9_223, // 0xe0
        cos_iw9_224, // 0xe1
        cos_iw9_225, // 0xe2
        cos_iw9_226, // 0xe3
        cos_iw9_227, // 0xe4
        cos_iw9_228, // 0xe5
        cos_iw9_229, // 0xe6
        cos_iw9_230, // 0xe7
        cos_iw9_231, // 0xe8
        cos_iw9_232, // 0xe9
        cos_iw9_233, // 0xea
        cos_iw9_234, // 0xeb
        cos_iw9_235, // 0xec
        cos_iw9_236, // 0xed
        cos_iw9_237, // 0xee
        cos_iw9_238, // 0xef
        cos_iw9_239, // 0xf0
        cos_iw9_240, // 0xf1
        cos_iw9_241, // 0xf2
        cos_iw9_242, // 0xf3
        cos_iw9_243, // 0xf4
        cos_iw9_244, // 0xf5
        cos_iw9_245, // 0xf6
        cos_iw9_246, // 0xf7
        cos_iw9_247, // 0xf8
        cos_iw9_248, // 0xf9
        cos_iw9_249, // 0xfa
        cos_iw9_250, // 0xfb
        cos_iw9_251, // 0xfc
        cos_iw9_252, // 0xfd
        cos_iw9_253, // 0xfe
        cos_iw9_254, // 0xff
        cos_iw9_255, // 0x100
        cos_iw9_256, // 0x101
        cos_iw9_257, // 0x102
        cos_iw9_258, // 0x103
        cos_iw9_259, // 0x104
        cos_iw9_260, // 0x105
        cos_iw9_261, // 0x106
        cos_iw9_262, // 0x107
        cos_iw9_263, // 0x108
        cos_iw9_264, // 0x109
        cos_iw9_265, // 0x10a
        cos_iw9_266, // 0x10b
        cos_iw9_267, // 0x10c
        cos_iw9_268, // 0x10d
        cos_iw9_269, // 0x10e
        cos_iw9_270, // 0x10f
        cos_iw9_271, // 0x110
        cos_iw9_272, // 0x111
        cos_iw9_273, // 0x112
        cos_iw9_274, // 0x113
        cos_iw9_275, // 0x114
        cos_iw9_276, // 0x115
        cos_iw9_277, // 0x116
        cos_iw9_278, // 0x117
        cos_iw9_279, // 0x118
        cos_iw9_280, // 0x119
        cos_iw9_281, // 0x11a
        cos_iw9_282, // 0x11b
        cos_iw9_283, // 0x11c
        cos_iw9_284, // 0x11d
        cos_iw9_285, // 0x11e
        cos_iw9_286, // 0x11f
        cos_iw9_287, // 0x120
        cos_iw9_288, // 0x121
        cos_iw9_289, // 0x122
        cos_iw9_290, // 0x123
        cos_iw9_291, // 0x124
        cos_iw9_292, // 0x125
        cos_iw9_293, // 0x126
        cos_iw9_294, // 0x127
        cos_iw9_295, // 0x128
        cos_iw9_296, // 0x129
        cos_iw9_297, // 0x12a
        cos_iw9_298, // 0x12b
        cos_iw9_299, // 0x12c
        cos_iw9_300, // 0x12d
        cos_iw9_301, // 0x12e
        cos_iw9_302, // 0x12f
        cos_iw9_303, // 0x130
        cos_iw9_304, // 0x131
        cos_iw9_305, // 0x132
        cos_iw9_306, // 0x133
        cos_iw9_307, // 0x134
        cos_iw9_308, // 0x135
        cos_iw9_309, // 0x136
        cos_iw9_310, // 0x137
        cos_iw9_311, // 0x138
        cos_iw9_312, // 0x139
        cos_iw9_313, // 0x13a
        cos_iw9_314, // 0x13b
        cos_iw9_315, // 0x13c
        cos_iw9_316, // 0x13d
        cos_iw9_317, // 0x13e
        cos_iw9_318, // 0x13f
        cos_iw9_319, // 0x140
        cos_iw9_320, // 0x141
        cos_iw9_321, // 0x142
        cos_iw9_322, // 0x143
        cos_iw9_323, // 0x144
        cos_iw9_324, // 0x145
        cos_iw9_325, // 0x146
        cos_iw9_326, // 0x147
        cos_iw9_327, // 0x148
        cos_iw9_328, // 0x149
        cos_iw9_329, // 0x14a
        cos_iw9_330, // 0x14b
        cos_iw9_331, // 0x14c
        cos_iw9_332, // 0x14d
        cos_iw9_333, // 0x14e
        cos_iw9_334, // 0x14f
        cos_iw9_335, // 0x150
        cos_iw9_336, // 0x151
        cos_iw9_337, // 0x152
        cos_iw9_338, // 0x153
        cos_iw9_339, // 0x154
        cos_iw9_340, // 0x155
        cos_iw9_341, // 0x156
        cos_iw9_342, // 0x157
        cos_iw9_343, // 0x158
        cos_iw9_344, // 0x159
        cos_iw9_345, // 0x15a
        cos_iw9_346, // 0x15b
        cos_iw9_347, // 0x15c
        cos_iw9_348, // 0x15d
        cos_iw9_349, // 0x15e
        cos_iw9_350, // 0x15f
        cos_iw9_351, // 0x160
        cos_iw9_352, // 0x161
        cos_iw9_353, // 0x162
        cos_iw9_354, // 0x163
        cos_iw9_355, // 0x164
        cos_iw9_356, // 0x165
        cos_iw9_357, // 0x166
        cos_iw9_358, // 0x167
        cos_iw9_359, // 0x168
        cos_iw9_360, // 0x169
        cos_iw9_361, // 0x16a
        cos_iw9_362, // 0x16b
        cos_iw9_363, // 0x16c
        cos_iw9_364, // 0x16d
        cos_iw9_365, // 0x16e
        cos_iw9_366, // 0x16f
        cos_iw9_367, // 0x170
        cos_iw9_368, // 0x171
        cos_iw9_369, // 0x172
        cos_iw9_370, // 0x173
        cos_iw9_371, // 0x174
        cos_iw9_372, // 0x175
        cos_iw9_373, // 0x176
        cos_iw9_374, // 0x177
        cos_iw9_375, // 0x178
        cos_iw9_376, // 0x179
        cos_iw9_377, // 0x17a
        cos_iw9_378, // 0x17b
        cos_iw9_379, // 0x17c
        cos_iw9_380, // 0x17d
        cos_iw9_381, // 0x17e
        cos_iw9_382, // 0x17f
        cos_iw9_383, // 0x180
        cos_iw9_384, // 0x181
        cos_iw9_385, // 0x182
        cos_iw9_386, // 0x183
        cos_iw9_387, // 0x184
        cos_iw9_388, // 0x185
        cos_iw9_389, // 0x186
        cos_iw9_390, // 0x187
        cos_iw9_391, // 0x188
        cos_iw9_392, // 0x189
        cos_iw9_393, // 0x18a
        cos_iw9_394, // 0x18b
        cos_iw9_395, // 0x18c
        cos_iw9_396, // 0x18d
        cos_iw9_397, // 0x18e
        cos_iw9_398, // 0x18f
        cos_iw9_399, // 0x190
        cos_iw9_400, // 0x191
        cos_iw9_401, // 0x192
        cos_iw9_402, // 0x193
        cos_iw9_403, // 0x194
        cos_iw9_404, // 0x195
        cos_iw9_405, // 0x196
        cos_iw9_406, // 0x197
        cos_iw9_407, // 0x198
        cos_iw9_408, // 0x199
        cos_iw9_409, // 0x19a
        cos_iw9_410, // 0x19b
        cos_iw9_411, // 0x19c
        cos_iw9_412, // 0x19d
        cos_iw9_413, // 0x19e
        cos_iw9_414, // 0x19f
        cos_iw9_415, // 0x1a0
        cos_iw9_416, // 0x1a1
        cos_iw9_417, // 0x1a2
        cos_iw9_418, // 0x1a3
        cos_iw9_419, // 0x1a4
        cos_iw9_420, // 0x1a5
        cos_iw9_421, // 0x1a6
        cos_iw9_422, // 0x1a7
        cos_iw9_423, // 0x1a8
        cos_iw9_424, // 0x1a9
        cos_iw9_425, // 0x1aa
        cos_iw9_426, // 0x1ab
        cos_iw9_427, // 0x1ac
        cos_iw9_428, // 0x1ad
        cos_iw9_429, // 0x1ae
        cos_iw9_430, // 0x1af
        cos_iw9_431, // 0x1b0
        cos_iw9_432, // 0x1b1
        cos_iw9_433, // 0x1b2
        cos_iw9_434, // 0x1b3
        cos_iw9_435, // 0x1b4
        cos_iw9_436, // 0x1b5
        cos_iw9_437, // 0x1b6
        cos_iw9_438, // 0x1b7
        cos_iw9_439, // 0x1b8
        cos_iw9_440, // 0x1b9
        cos_iw9_441, // 0x1ba
        cos_iw9_442, // 0x1bb
        cos_iw9_443, // 0x1bc
        cos_iw9_444, // 0x1bd
        cos_iw9_445, // 0x1be
        cos_iw9_446, // 0x1bf
        cos_iw9_447, // 0x1c0
        cos_iw9_448, // 0x1c1
        cos_iw9_449, // 0x1c2
        cos_iw9_450, // 0x1c3
        cos_iw9_451, // 0x1c4
        cos_iw9_452, // 0x1c5
        cos_iw9_453, // 0x1c6
        cos_iw9_454, // 0x1c7
        cos_iw9_455, // 0x1c8
        cos_iw9_456, // 0x1c9
        cos_iw9_457, // 0x1ca
        cos_iw9_458, // 0x1cb
        cos_iw9_459, // 0x1cc
        cos_iw9_460, // 0x1cd
        cos_iw9_461, // 0x1ce
        cos_iw9_462, // 0x1cf
        cos_iw9_463, // 0x1d0
        cos_iw9_464, // 0x1d1
        cos_iw9_465, // 0x1d2
        cos_iw9_466, // 0x1d3
        cos_iw9_467, // 0x1d4
        cos_iw9_468, // 0x1d5
        cos_iw9_469, // 0x1d6
        cos_iw9_470, // 0x1d7
        cos_iw9_471, // 0x1d8
        cos_iw9_472, // 0x1d9
        cos_iw9_473, // 0x1da
        cos_iw9_474, // 0x1db
        cos_iw9_475, // 0x1dc
        cos_iw9_476, // 0x1dd
        cos_iw9_477, // 0x1de
        cos_iw9_478, // 0x1df
        cos_iw9_479, // 0x1e0
        cos_iw9_480, // 0x1e1
        cos_iw9_481, // 0x1e2
        cos_iw9_482, // 0x1e3
        cos_iw9_483, // 0x1e4
        cos_iw9_484, // 0x1e5
        cos_iw9_485, // 0x1e6
        cos_iw9_486, // 0x1e7
        cos_iw9_487, // 0x1e8
        cos_iw9_488, // 0x1e9
        cos_iw9_489, // 0x1ea
        cos_iw9_490, // 0x1eb
        cos_iw9_491, // 0x1ec
        cos_iw9_492, // 0x1ed
        cos_iw9_493, // 0x1ee
        cos_iw9_494, // 0x1ef
        cos_iw9_495, // 0x1f0
        cos_iw9_496, // 0x1f1
        cos_iw9_497, // 0x1f2
        cos_iw9_498, // 0x1f3
        cos_iw9_499, // 0x1f4
        cos_iw9_500, // 0x1f5
        cos_iw9_501, // 0x1f6
        cos_iw9_502, // 0x1f7
        cos_iw9_503, // 0x1f8
        cos_iw9_504, // 0x1f9
        cos_iw9_505, // 0x1fa
        cos_iw9_506, // 0x1fb
        cos_iw9_507, // 0x1fc
        cos_iw9_508, // 0x1fd
        cos_iw9_509, // 0x1fe
        cos_iw9_510, // 0x1ff
        cos_iw9_511, // 0x200
        cos_iw9_512, // 0x201
        cos_iw9_513, // 0x202
        cos_iw9_514, // 0x203
        cos_iw9_515, // 0x204
        cos_iw9_516, // 0x205
        cos_iw9_517, // 0x206
        cos_iw9_518, // 0x207
        jup_sticker_iw9_519, // 0x208
        cos_iw9_520, // 0x209
        cos_iw9_521, // 0x20a
        cos_iw9_522, // 0x20b
        cos_iw9_523, // 0x20c
        cos_iw9_524, // 0x20d
        cos_iw9_525, // 0x20e
        cos_iw9_526, // 0x20f
        cos_iw9_527, // 0x210
        cos_iw9_528, // 0x211
        cos_iw9_529, // 0x212
        cos_iw9_530, // 0x213
        cos_iw9_531, // 0x214
        cos_iw9_532, // 0x215
        cos_iw9_533, // 0x216
        cos_iw9_534, // 0x217
        cos_iw9_535, // 0x218
        cos_iw9_536, // 0x219
        cos_iw9_537, // 0x21a
        cos_iw9_538, // 0x21b
        cos_iw9_539, // 0x21c
        cos_iw9_540, // 0x21d
        cos_iw9_541, // 0x21e
        cos_iw9_542, // 0x21f
        cos_iw9_543, // 0x220
        cos_iw9_544, // 0x221
        cos_iw9_545, // 0x222
        cos_iw9_546, // 0x223
        cos_iw9_547, // 0x224
        cos_iw9_548, // 0x225
        cos_iw9_549, // 0x226
        cos_iw9_550, // 0x227
        cos_iw9_551, // 0x228
        cos_iw9_552, // 0x229
        cos_iw9_553, // 0x22a
        cos_iw9_554, // 0x22b
        cos_iw9_555, // 0x22c
        cos_iw9_556, // 0x22d
        cos_iw9_557, // 0x22e
        cos_iw9_558, // 0x22f
        cos_iw9_559, // 0x230
        cos_iw9_560, // 0x231
        cos_iw9_561, // 0x232
        cos_iw9_562, // 0x233
        cos_iw9_563, // 0x234
        cos_iw9_564, // 0x235
        cos_iw9_565, // 0x236
        cos_iw9_566, // 0x237
        cos_iw9_567, // 0x238
        cos_iw9_568, // 0x239
        cos_iw9_569, // 0x23a
        cos_iw9_570, // 0x23b
        cos_iw9_571, // 0x23c
        cos_iw9_572, // 0x23d
        cos_iw9_573, // 0x23e
        cos_iw9_574, // 0x23f
        cos_iw9_575, // 0x240
        cos_iw9_576, // 0x241
        cos_iw9_577, // 0x242
        cos_iw9_578, // 0x243
        cos_iw9_579, // 0x244
        cos_iw9_580, // 0x245
        cos_iw9_581, // 0x246
        cos_iw9_582, // 0x247
        cos_iw9_583, // 0x248
        cos_iw9_584, // 0x249
        cos_iw9_585, // 0x24a
        cos_iw9_586, // 0x24b
        cos_iw9_587, // 0x24c
        cos_iw9_588, // 0x24d
        cos_iw9_589, // 0x24e
        cos_iw9_590, // 0x24f
        cos_iw9_591, // 0x250
        cos_iw9_592, // 0x251
        cos_iw9_593, // 0x252
        cos_iw9_594, // 0x253
        cos_iw9_595, // 0x254
        cos_iw9_596, // 0x255
        cos_iw9_597, // 0x256
        cos_iw9_598, // 0x257
        cos_iw9_599, // 0x258
        cos_iw9_600, // 0x259
        cos_iw9_601, // 0x25a
        cos_iw9_602, // 0x25b
        cos_iw9_603, // 0x25c
        cos_iw9_604, // 0x25d
        cos_iw9_605, // 0x25e
        cos_iw9_606, // 0x25f
        cos_iw9_607, // 0x260
        cos_iw9_608, // 0x261
        cos_iw9_609, // 0x262
        cos_iw9_610, // 0x263
        cos_iw9_611, // 0x264
        cos_iw9_612, // 0x265
        cos_iw9_613, // 0x266
        cos_iw9_614, // 0x267
        cos_iw9_615, // 0x268
        cos_iw9_616, // 0x269
        cos_iw9_617, // 0x26a
        cos_iw9_618, // 0x26b
        cos_iw9_619, // 0x26c
        cos_iw9_620, // 0x26d
        cos_iw9_621, // 0x26e
        cos_iw9_622, // 0x26f
        cos_iw9_623, // 0x270
        cos_iw9_624, // 0x271
        cos_iw9_625, // 0x272
        cos_iw9_626, // 0x273
        cos_iw9_627, // 0x274
        cos_iw9_628, // 0x275
        cos_iw9_629, // 0x276
        cos_iw9_630, // 0x277
        cos_iw9_631, // 0x278
        cos_iw9_632, // 0x279
        cos_iw9_633, // 0x27a
        cos_iw9_634, // 0x27b
        cos_iw9_635, // 0x27c
        cos_iw9_636, // 0x27d
        cos_iw9_637, // 0x27e
        cos_iw9_638, // 0x27f
        cos_iw9_639, // 0x280
        cos_iw9_640, // 0x281
        cos_iw9_641, // 0x282
        cos_iw9_642, // 0x283
        cos_iw9_643, // 0x284
        cos_iw9_644, // 0x285
        cos_iw9_645, // 0x286
        cos_iw9_646, // 0x287
        cos_iw9_647, // 0x288
        cos_iw9_648, // 0x289
        cos_iw9_649, // 0x28a
        cos_iw9_650, // 0x28b
        cos_iw9_651, // 0x28c
        cos_iw9_652, // 0x28d
        cos_iw9_653, // 0x28e
        cos_iw9_654, // 0x28f
        cos_iw9_655, // 0x290
        cos_iw9_656, // 0x291
        cos_iw9_657, // 0x292
        cos_iw9_658, // 0x293
        cos_iw9_659, // 0x294
        cos_iw9_660, // 0x295
        cos_iw9_661, // 0x296
        cos_iw9_662, // 0x297
        cos_iw9_663, // 0x298
        cos_iw9_664, // 0x299
        cos_iw9_665, // 0x29a
        cos_iw9_666, // 0x29b
        cos_iw9_667, // 0x29c
        cos_iw9_668, // 0x29d
        cos_iw9_669, // 0x29e
        cos_iw9_670, // 0x29f
        cos_iw9_671, // 0x2a0
        cos_iw9_672, // 0x2a1
        cos_iw9_673, // 0x2a2
        cos_iw9_674, // 0x2a3
        cos_iw9_675, // 0x2a4
        cos_iw9_676, // 0x2a5
        cos_iw9_677, // 0x2a6
        cos_iw9_678, // 0x2a7
        cos_iw9_679, // 0x2a8
        cos_iw9_680, // 0x2a9
        cos_iw9_681, // 0x2aa
        cos_iw9_682, // 0x2ab
        cos_iw9_683, // 0x2ac
        cos_iw9_684, // 0x2ad
        cos_iw9_685, // 0x2ae
        cos_iw9_686, // 0x2af
        cos_iw9_687, // 0x2b0
        cos_iw9_688, // 0x2b1
        cos_iw9_689, // 0x2b2
        cos_iw9_690, // 0x2b3
        cos_iw9_691, // 0x2b4
        cos_iw9_692, // 0x2b5
        cos_iw9_693, // 0x2b6
        cos_iw9_694, // 0x2b7
        cos_iw9_695, // 0x2b8
        cos_iw9_696, // 0x2b9
        cos_iw9_697, // 0x2ba
        cos_iw9_698, // 0x2bb
        cos_iw9_699, // 0x2bc
        cos_iw9_700, // 0x2bd
        cos_iw9_701, // 0x2be
        cos_iw9_702, // 0x2bf
        cos_iw9_703, // 0x2c0
        cos_iw9_704, // 0x2c1
        cos_iw9_705, // 0x2c2
        cos_iw9_706, // 0x2c3
        cos_iw9_707, // 0x2c4
        cos_iw9_708, // 0x2c5
        cos_iw9_709, // 0x2c6
        cos_iw9_710, // 0x2c7
        cos_iw9_711, // 0x2c8
        cos_iw9_712, // 0x2c9
        cos_iw9_713, // 0x2ca
        cos_iw9_714, // 0x2cb
        cos_iw9_715, // 0x2cc
        cos_iw9_716, // 0x2cd
        cos_iw9_717, // 0x2ce
        cos_iw9_718, // 0x2cf
        cos_iw9_719, // 0x2d0
        cos_iw9_720, // 0x2d1
        cos_iw9_721, // 0x2d2
        cos_iw9_722, // 0x2d3
        cos_iw9_723, // 0x2d4
        cos_iw9_724, // 0x2d5
        cos_iw9_725, // 0x2d6
        cos_iw9_726, // 0x2d7
        cos_iw9_727, // 0x2d8
        cos_iw9_728, // 0x2d9
        cos_iw9_729, // 0x2da
        cos_iw9_730, // 0x2db
        cos_iw9_731, // 0x2dc
        cos_iw9_732, // 0x2dd
        cos_iw9_733, // 0x2de
        cos_iw9_734, // 0x2df
        cos_iw9_735, // 0x2e0
        cos_iw9_736, // 0x2e1
        cos_iw9_737, // 0x2e2
        cos_iw9_738, // 0x2e3
        cos_iw9_739, // 0x2e4
        cos_iw9_740, // 0x2e5
        cos_iw9_741, // 0x2e6
        cos_iw9_742, // 0x2e7
        cos_iw9_743, // 0x2e8
        cos_iw9_744, // 0x2e9
        cos_iw9_745, // 0x2ea
        cos_iw9_746, // 0x2eb
        cos_iw9_747, // 0x2ec
        cos_iw9_748, // 0x2ed
        cos_iw9_749, // 0x2ee
        cos_iw9_750, // 0x2ef
        cos_iw9_751, // 0x2f0
        cos_iw9_752, // 0x2f1
        cos_iw9_753, // 0x2f2
        cos_iw9_754, // 0x2f3
        cos_iw9_755, // 0x2f4
        cos_iw9_756, // 0x2f5
        cos_iw9_757, // 0x2f6
        cos_iw9_758, // 0x2f7
        cos_iw9_759, // 0x2f8
        cos_iw9_760, // 0x2f9
        cos_iw9_761, // 0x2fa
        cos_iw9_762, // 0x2fb
        cos_iw9_763, // 0x2fc
        cos_iw9_764, // 0x2fd
        cos_iw9_765, // 0x2fe
        cos_iw9_766, // 0x2ff
        cos_iw9_767, // 0x300
        cos_iw9_768, // 0x301
        cos_iw9_769, // 0x302
        cos_iw9_770, // 0x303
        cos_iw9_771, // 0x304
        cos_iw9_772, // 0x305
        cos_iw9_773, // 0x306
        cos_iw9_774, // 0x307
        cos_iw9_775, // 0x308
        cos_iw9_776, // 0x309
        cos_iw9_777, // 0x30a
        cos_iw9_778, // 0x30b
        cos_iw9_779, // 0x30c
        cos_iw9_780, // 0x30d
        cos_iw9_781, // 0x30e
        cos_iw9_782, // 0x30f
        cos_iw9_783, // 0x310
        cos_iw9_784, // 0x311
        cos_iw9_785, // 0x312
        cos_iw9_786, // 0x313
        cos_iw9_787, // 0x314
        cos_iw9_788, // 0x315
        cos_iw9_789, // 0x316
        cos_iw9_790, // 0x317
        cos_iw9_791, // 0x318
        cos_iw9_792, // 0x319
        cos_iw9_793, // 0x31a
        cos_iw9_794, // 0x31b
        cos_iw9_795, // 0x31c
        cos_iw9_796, // 0x31d
        cos_iw9_797, // 0x31e
        cos_iw9_798, // 0x31f
        cos_iw9_799, // 0x320
        cos_iw9_screen_001, // 0x321
        cos_iw9_screen_002, // 0x322
        cos_iw9_screen_003, // 0x323
        cos_iw9_screen_004, // 0x324
        cos_iw9_screen_005, // 0x325
        cos_iw9_screen_006, // 0x326
        cos_iw9_screen_007, // 0x327
        cos_iw9_screen_008, // 0x328
        cos_iw9_screen_009, // 0x329
        cos_iw9_screen_010, // 0x32a
        cos_iw9_screen_011, // 0x32b
        cos_iw9_screen_012, // 0x32c
        cos_iw9_screen_013, // 0x32d
        cos_iw9_screen_014, // 0x32e
        cos_iw9_screen_015, // 0x32f
        cos_iw9_screen_016, // 0x330
        cos_iw9_screen_017, // 0x331
        cos_iw9_screen_018, // 0x332
        cos_iw9_screen_019, // 0x333
        cos_iw9_screen_020, // 0x334
        cos_iw9_screen_021, // 0x335
        cos_iw9_screen_022, // 0x336
        cos_iw9_screen_023, // 0x337
        cos_iw9_screen_024, // 0x338
        cos_iw9_screen_025, // 0x339
        cos_iw9_screen_026, // 0x33a
        cos_iw9_screen_027, // 0x33b
        cos_iw9_screen_028, // 0x33c
        cos_iw9_screen_029, // 0x33d
        cos_iw9_screen_030, // 0x33e
        cos_iw9_screen_031, // 0x33f
        cos_iw9_screen_032, // 0x340
        cos_iw9_screen_033, // 0x341
        cos_iw9_screen_034, // 0x342
        cos_iw9_screen_035, // 0x343
        cos_iw9_screen_036, // 0x344
        cos_iw9_screen_037, // 0x345
        cos_iw9_screen_038, // 0x346
        cos_iw9_screen_039, // 0x347
        cos_iw9_screen_040, // 0x348
        cos_iw9_screen_041, // 0x349
        cos_iw9_screen_042, // 0x34a
        cos_iw9_screen_043, // 0x34b
        cos_iw9_screen_044, // 0x34c
        cos_iw9_screen_045, // 0x34d
        cos_iw9_screen_046, // 0x34e
        cos_iw9_screen_047, // 0x34f
        cos_iw9_screen_048, // 0x350
        cos_iw9_screen_049, // 0x351
        cos_iw9_screen_050, // 0x352
        cos_iw9_screen_051, // 0x353
        cos_iw9_screen_052, // 0x354
        cos_iw9_screen_053, // 0x355
        cos_iw9_screen_054, // 0x356
        cos_iw9_screen_055, // 0x357
        cos_iw9_screen_056, // 0x358
        cos_iw9_screen_057, // 0x359
        cos_iw9_screen_058, // 0x35a
        cos_iw9_screen_059, // 0x35b
        cos_iw9_screen_060, // 0x35c
        cos_iw9_screen_061, // 0x35d
        cos_iw9_screen_062, // 0x35e
        cos_iw9_screen_063, // 0x35f
        cos_iw9_screen_064, // 0x360
        cos_iw9_screen_065, // 0x361
        cos_iw9_screen_066, // 0x362
        cos_iw9_screen_067, // 0x363
        cos_iw9_screen_068, // 0x364
        cos_iw9_screen_069, // 0x365
        cos_iw9_screen_070, // 0x366
        cos_iw9_screen_071, // 0x367
        cos_iw9_screen_072, // 0x368
        cos_iw9_screen_073, // 0x369
        cos_iw9_screen_074, // 0x36a
        cos_iw9_screen_075, // 0x36b
        cos_iw9_screen_076, // 0x36c
        cos_iw9_screen_077, // 0x36d
        cos_iw9_screen_078, // 0x36e
        cos_iw9_screen_079, // 0x36f
        cos_iw9_screen_080, // 0x370
        cos_iw9_screen_081, // 0x371
        cos_iw9_screen_082, // 0x372
        cos_iw9_screen_083, // 0x373
        cos_iw9_screen_084, // 0x374
        cos_iw9_screen_085, // 0x375
        cos_iw9_screen_086, // 0x376
        cos_iw9_screen_087, // 0x377
        cos_iw9_screen_088, // 0x378
        cos_iw9_screen_089, // 0x379
        cos_iw9_screen_090, // 0x37a
        cos_iw9_screen_091, // 0x37b
        cos_iw9_screen_092, // 0x37c
        cos_iw9_screen_093, // 0x37d
        cos_iw9_screen_094, // 0x37e
        cos_iw9_screen_095, // 0x37f
        cos_iw9_screen_096, // 0x380
        cos_iw9_screen_097, // 0x381
        cos_iw9_screen_098, // 0x382
        cos_iw9_screen_099, // 0x383
        cos_iw9_screen_100, // 0x384
        cos_iw9_screen_101, // 0x385
        cos_iw9_screen_102, // 0x386
        cos_iw9_screen_103, // 0x387
        cos_iw9_screen_104, // 0x388
        cos_iw9_screen_105, // 0x389
        cos_iw9_screen_106, // 0x38a
        cos_iw9_screen_107, // 0x38b
        cos_iw9_screen_108, // 0x38c
        cos_iw9_screen_109, // 0x38d
        cos_iw9_screen_110, // 0x38e
        cos_iw9_screen_111, // 0x38f
        cos_iw9_screen_112, // 0x390
        cos_iw9_screen_113, // 0x391
        cos_iw9_screen_114, // 0x392
        cos_iw9_screen_115, // 0x393
        cos_iw9_screen_116, // 0x394
        cos_iw9_screen_117, // 0x395
        cos_iw9_screen_118, // 0x396
        cos_iw9_screen_119, // 0x397
        cos_iw9_screen_120, // 0x398
        cos_iw9_screen_121, // 0x399
        cos_iw9_screen_122, // 0x39a
        cos_iw9_screen_123, // 0x39b
        cos_iw9_screen_124, // 0x39c
        cos_iw9_screen_125, // 0x39d
        cos_iw9_screen_126, // 0x39e
        cos_iw9_screen_127, // 0x39f
        cos_iw9_screen_128, // 0x3a0
        cos_iw9_screen_129, // 0x3a1
        cos_iw9_screen_130, // 0x3a2
        cos_iw9_screen_131, // 0x3a3
        cos_iw9_screen_132, // 0x3a4
        cos_iw9_screen_133, // 0x3a5
        cos_iw9_screen_134, // 0x3a6
        cos_iw9_screen_135, // 0x3a7
        cos_iw9_screen_136, // 0x3a8
        cos_iw9_screen_137, // 0x3a9
        cos_iw9_screen_138, // 0x3aa
        cos_iw9_screen_139, // 0x3ab
        cos_iw9_screen_140, // 0x3ac
        cos_iw9_screen_141, // 0x3ad
        cos_iw9_screen_142, // 0x3ae
        cos_iw9_screen_143, // 0x3af
        cos_iw9_screen_144, // 0x3b0
        cos_iw9_screen_145, // 0x3b1
        cos_iw9_screen_146, // 0x3b2
        cos_iw9_screen_147, // 0x3b3
        cos_iw9_screen_148, // 0x3b4
        cos_iw9_screen_149, // 0x3b5
        cos_iw9_screen_150, // 0x3b6
        cos_mgl_001, // 0x3b7
        cos_mgl_002, // 0x3b8
        cos_mgl_003, // 0x3b9
        cos_mgl_004, // 0x3ba
        cos_mgl_005, // 0x3bb
        cos_mgl_006, // 0x3bc
        cos_mgl_007, // 0x3bd
        cos_mgl_008, // 0x3be
        cos_mgl_009, // 0x3bf
        cos_mgl_010, // 0x3c0
        cos_mgl_011, // 0x3c1
        cos_mgl_012, // 0x3c2
        cos_mgl_013, // 0x3c3
        cos_mgl_014, // 0x3c4
        cos_mgl_015, // 0x3c5
        cos_mgl_016, // 0x3c6
        cos_mgl_017, // 0x3c7
        cos_mgl_018, // 0x3c8
        cos_mgl_019, // 0x3c9
        cos_mgl_020, // 0x3ca
        cos_mgl_021, // 0x3cb
        cos_mgl_022, // 0x3cc
        cos_mgl_023, // 0x3cd
        cos_mgl_024, // 0x3ce
        cos_mgl_025, // 0x3cf
        cos_mgl_026, // 0x3d0
        cos_mgl_027, // 0x3d1
        cos_mgl_028, // 0x3d2
        cos_mgl_029, // 0x3d3
        cos_mgl_030, // 0x3d4
        cos_mgl_031, // 0x3d5
        cos_mgl_032, // 0x3d6
        cos_mgl_033, // 0x3d7
        cos_mgl_034, // 0x3d8
        cos_mgl_035, // 0x3d9
        cos_mgl_036, // 0x3da
        cos_mgl_037, // 0x3db
        cos_mgl_038, // 0x3dc
        cos_mgl_039, // 0x3dd
        cos_mgl_040, // 0x3de
        cos_mgl_041, // 0x3df
        cos_mgl_042, // 0x3e0
        cos_mgl_043, // 0x3e1
        cos_mgl_044, // 0x3e2
        cos_mgl_045, // 0x3e3
        cos_mgl_046, // 0x3e4
        cos_mgl_047, // 0x3e5
        cos_mgl_048, // 0x3e6
        cos_mgl_049, // 0x3e7
        cos_mgl_050, // 0x3e8
        cos_mgl_051, // 0x3e9
        cos_mgl_052, // 0x3ea
        cos_mgl_053, // 0x3eb
        cos_mgl_054, // 0x3ec
        cos_mgl_055, // 0x3ed
        cos_mgl_056, // 0x3ee
        cos_mgl_057, // 0x3ef
        cos_mgl_058, // 0x3f0
        cos_mgl_059, // 0x3f1
        cos_mgl_060, // 0x3f2
        cos_mgl_061, // 0x3f3
        cos_mgl_062, // 0x3f4
        cos_mgl_063, // 0x3f5
        cos_mgl_064, // 0x3f6
        cos_mgl_065, // 0x3f7
        cos_mgl_066, // 0x3f8
        cos_mgl_067, // 0x3f9
        cos_mgl_068, // 0x3fa
        cos_mgl_069, // 0x3fb
        cos_mgl_070, // 0x3fc
        cos_mgl_071, // 0x3fd
        cos_mgl_072, // 0x3fe
        cos_mgl_073, // 0x3ff
        cos_mgl_074, // 0x400
        cos_mgl_075, // 0x401
        cos_mgl_076, // 0x402
        cos_mgl_077, // 0x403
        cos_mgl_078, // 0x404
        cos_mgl_079, // 0x405
        cos_mgl_080, // 0x406
        cos_mgl_081, // 0x407
        cos_mgl_082, // 0x408
        cos_mgl_083, // 0x409
        cos_mgl_084, // 0x40a
        cos_mgl_085, // 0x40b
        cos_mgl_086, // 0x40c
        cos_mgl_087, // 0x40d
        cos_mgl_088, // 0x40e
        cos_mgl_089, // 0x40f
        cos_mgl_090, // 0x410
        cos_mgl_091, // 0x411
        cos_mgl_092, // 0x412
        cos_mgl_093, // 0x413
        cos_mgl_094, // 0x414
        cos_mgl_095, // 0x415
        cos_mgl_096, // 0x416
        cos_mgl_097, // 0x417
        cos_mgl_098, // 0x418
        cos_mgl_099, // 0x419
        cos_mgl_100, // 0x41a
        cos_mgl_101, // 0x41b
        cos_mgl_102, // 0x41c
        cos_mgl_103, // 0x41d
        cos_mgl_104, // 0x41e
        cos_mgl_105, // 0x41f
        cos_mgl_106, // 0x420
        cos_mgl_107, // 0x421
        cos_mgl_108, // 0x422
        cos_mgl_109, // 0x423
        cos_mgl_110, // 0x424
        cos_mgl_111, // 0x425
        cos_mgl_112, // 0x426
        cos_mgl_113, // 0x427
        cos_mgl_114, // 0x428
        cos_mgl_115, // 0x429
        cos_mgl_116, // 0x42a
        cos_mgl_117, // 0x42b
        cos_mgl_118, // 0x42c
        cos_mgl_119, // 0x42d
        cos_mgl_120, // 0x42e
        cos_mgl_121, // 0x42f
        cos_mgl_122, // 0x430
        cos_mgl_123, // 0x431
        cos_mgl_124, // 0x432
        cos_mgl_125, // 0x433
        cos_mgl_126, // 0x434
        cos_mgl_127, // 0x435
        cos_mgl_128, // 0x436
        cos_mgl_129, // 0x437
        cos_mgl_130, // 0x438
        cos_mgl_131, // 0x439
        cos_mgl_132, // 0x43a
        cos_mgl_133, // 0x43b
        cos_mgl_134, // 0x43c
        cos_mgl_135, // 0x43d
        cos_mgl_136, // 0x43e
        cos_mgl_137, // 0x43f
        cos_mgl_138, // 0x440
        cos_mgl_139, // 0x441
        cos_mgl_140, // 0x442
        cos_mgl_141, // 0x443
        cos_mgl_142, // 0x444
        cos_mgl_143, // 0x445
        cos_mgl_144, // 0x446
        cos_mgl_145, // 0x447
        cos_mgl_146, // 0x448
        cos_mgl_147, // 0x449
        cos_mgl_148, // 0x44a
        cos_mgl_149, // 0x44b
        cos_mgl_150, // 0x44c
        cos_mgl_151, // 0x44d
        cos_mgl_152, // 0x44e
        cos_mgl_153, // 0x44f
        cos_mgl_154, // 0x450
        cos_mgl_155, // 0x451
        cos_mgl_156, // 0x452
        cos_mgl_157, // 0x453
        cos_mgl_158, // 0x454
        cos_mgl_159, // 0x455
        cos_mgl_160, // 0x456
        cos_mgl_161, // 0x457
        cos_mgl_162, // 0x458
        cos_mgl_163, // 0x459
        cos_mgl_164, // 0x45a
        cos_mgl_165, // 0x45b
        cos_mgl_166, // 0x45c
        cos_mgl_167, // 0x45d
        cos_mgl_168, // 0x45e
        cos_mgl_169, // 0x45f
        cos_mgl_170, // 0x460
        cos_mgl_171, // 0x461
        cos_mgl_172, // 0x462
        cos_mgl_173, // 0x463
        cos_mgl_174, // 0x464
        cos_mgl_175, // 0x465
        cos_mgl_176, // 0x466
        cos_mgl_177, // 0x467
        cos_mgl_178, // 0x468
        cos_mgl_179, // 0x469
        cos_mgl_180, // 0x46a
        cos_mgl_181, // 0x46b
        cos_mgl_182, // 0x46c
        cos_mgl_183, // 0x46d
        cos_mgl_184, // 0x46e
        cos_mgl_185, // 0x46f
        cos_mgl_186, // 0x470
        cos_mgl_187, // 0x471
        cos_mgl_188, // 0x472
        cos_mgl_189, // 0x473
        cos_mgl_190, // 0x474
        cos_mgl_191, // 0x475
        cos_mgl_192, // 0x476
        cos_mgl_193, // 0x477
        cos_mgl_194, // 0x478
        cos_mgl_195, // 0x479
        cos_mgl_196, // 0x47a
        cos_mgl_197, // 0x47b
        cos_mgl_198, // 0x47c
        cos_mgl_199, // 0x47d
        cos_mgl_200, // 0x47e
        cos_iw9_800, // 0x47f
        cos_jup_1043_proton, // 0x480
        cos_jup_ob1, // 0x481
        cos_jup_ob2, // 0x482
        cos_jup_ob3, // 0x483
        cos_jup_ob4, // 0x484
        cos_jup_1079_machineguns_06, // 0x485
        cos_jup_1947_influencer_mp_launch_01, // 0x486
        cos_jup_1949_influencer_nov, // 0x487
        cos_jup_1943_incentives_10, // 0x488
        cos_jup_1943_incentives_09, // 0x489
        cos_jup_1943_incentives_07, // 0x48a
        cos_jup_1943_incentives_05, // 0x48b
        cos_jup_1943_incentives_06, // 0x48c
        cos_jup_1943_incentives_04, // 0x48d
        cos_jup_1063_cdl_launch, // 0x48e
        cos_jup_1076_trident, // 0x48f
        cos_jup_1912_masterycoin_acharlie, // 0x490
        cos_jup_1912_masterycoin_acharlie45_ob, // 0x491
        cos_jup_1912_masterycoin_ahotel_ob, // 0x492
        cos_jup_1912_masterycoin_akilo105_ob, // 0x493
        cos_jup_1912_masterycoin_akilo74_ob, // 0x494
        cos_jup_1912_masterycoin_akilo_ob, // 0x495
        cos_jup_1912_masterycoin_alpha57_ob, // 0x496
        cos_jup_1912_masterycoin_anov94_ob, // 0x497
        cos_jup_1912_masterycoin_apapa_ob, // 0x498
        cos_jup_1912_masterycoin_ar_acharlie, // 0x499
        cos_jup_1912_masterycoin_ar_acharlie_ob, // 0x49a
        cos_jup_1912_masterycoin_ar_anov94, // 0x49b
        cos_jup_1912_masterycoin_ar_bromeo805, // 0x49c
        cos_jup_1912_masterycoin_ar_bromeo805_ob, // 0x49d
        cos_jup_1912_masterycoin_ar_golf36, // 0x49e
        cos_jup_1912_masterycoin_ar_qbravo97, // 0x49f
        cos_jup_1912_masterycoin_ar_qbravo97_ob, // 0x4a0
        cos_jup_1912_masterycoin_ar_talpha95, // 0x4a1
        cos_jup_1912_masterycoin_aromeo410_ob, // 0x4a2
        cos_jup_1912_masterycoin_augolf_ob, // 0x4a3
        cos_jup_1912_masterycoin_aviktor_ob, // 0x4a4
        cos_jup_1912_masterycoin_beta_ob, // 0x4a5
        cos_jup_1912_masterycoin_boscar_ob, // 0x4a6
        cos_jup_1912_masterycoin_br_acharlie450, // 0x4a7
        cos_jup_1912_masterycoin_br_acharlie450_ob, // 0x4a8
        cos_jup_1912_masterycoin_br_bromeo2, // 0x4a9
        cos_jup_1912_masterycoin_br_bromeo2_ob, // 0x4aa
        cos_jup_1912_masterycoin_br_xmike5, // 0x4ab
        cos_jup_1912_masterycoin_bromeop_ob, // 0x4ac
        cos_jup_1912_masterycoin_coscar635_ob, // 0x4ad
        cos_jup_1912_masterycoin_decho_ob, // 0x4ae
        cos_jup_1912_masterycoin_dechoauto_ob, // 0x4af
        cos_jup_1912_masterycoin_devname, // 0x4b0
        cos_jup_1912_masterycoin_dm_acharlied, // 0x4b1
        cos_jup_1912_masterycoin_dm_acharlied_ob, // 0x4b2
        cos_jup_1912_masterycoin_dm_bromeop, // 0x4b3
        cos_jup_1912_masterycoin_dm_slima8, // 0x4b4
        cos_jup_1912_masterycoin_dm_stango25_ob, // 0x4b5
        cos_jup_1912_masterycoin_dm_svictork, // 0x4b6
        cos_jup_1912_masterycoin_dromeo_ob, // 0x4b7
        cos_jup_1912_masterycoin_evictor_ob, // 0x4b8
        cos_jup_1912_masterycoin_fecho_ob, // 0x4b9
        cos_jup_1912_masterycoin_foxtrot_ob, // 0x4ba
        cos_jup_1912_masterycoin_golf17_ob, // 0x4bb
        cos_jup_1912_masterycoin_golf18_ob, // 0x4bc
        cos_jup_1912_masterycoin_golf36_ob, // 0x4bd
        cos_jup_1912_masterycoin_golf3_ob, // 0x4be
        cos_jup_1912_masterycoin_gromeo_ob, // 0x4bf
        cos_jup_1912_masterycoin_helima_ob, // 0x4c0
        cos_jup_1912_masterycoin_india_ob, // 0x4c1
        cos_jup_1912_masterycoin_iw9_ar_acharlie300_ob, // 0x4c2
        cos_jup_1912_masterycoin_iw9_ar_falpha, // 0x4c3
        cos_jup_1912_masterycoin_iw9_ar_falpha_ob, // 0x4c4
        cos_jup_1912_masterycoin_iw9_ar_mcbravo_mp_ob, // 0x4c5
        cos_jup_1912_masterycoin_iw9_ar_mcharlie_mp_ob, // 0x4c6
        cos_jup_1912_masterycoin_iw9_dm_crossbow_ob, // 0x4c7
        cos_jup_1912_masterycoin_iw9_dm_scromeo_mp_ob, // 0x4c8
        cos_jup_1912_masterycoin_iw9_lm_mkilo3, // 0x4c9
        cos_jup_1912_masterycoin_iw9_lm_ngolf7_ob, // 0x4ca
        cos_jup_1912_masterycoin_iw9_lm_slima_ob, // 0x4cb
        cos_jup_1912_masterycoin_iw9_me_sword01_ob, // 0x4cc
        cos_jup_1912_masterycoin_iw9_sh_charlie725_ob, // 0x4cd
        cos_jup_1912_masterycoin_iw9_sh_mbravo_ob, // 0x4ce
        cos_jup_1912_masterycoin_iw9_sh_mike1014_ob, // 0x4cf
        cos_jup_1912_masterycoin_iw9_sh_mviktor_ob, // 0x4d0
        cos_jup_1912_masterycoin_iw9_sh_vecho_ob, // 0x4d1
        cos_jup_1912_masterycoin_iw9_sm_mpapa7_ob, // 0x4d2
        cos_jup_1912_masterycoin_iw9_sm_mpapax_mp_ob, // 0x4d3
        cos_jup_1912_masterycoin_iw9_sm_papa90_ob, // 0x4d4
        cos_jup_1912_masterycoin_iw9_sm_victor_ob, // 0x4d5
        cos_jup_1912_masterycoin_iw9_sn_alpha50_ob, // 0x4d6
        cos_jup_1912_masterycoin_juliet_ob, // 0x4d7
        cos_jup_1912_masterycoin_kgolf_ob, // 0x4d8
        cos_jup_1912_masterycoin_kilo21_ob, // 0x4d9
        cos_jup_1912_masterycoin_kilo53_ob, // 0x4da
        cos_jup_1912_masterycoin_knife_ob, // 0x4db
        cos_jup_1912_masterycoin_la700_ob, // 0x4dc
        cos_jup_1912_masterycoin_la_dromeo, // 0x4dd
        cos_jup_1912_masterycoin_la_mike32, // 0x4de
        cos_jup_1912_masterycoin_la_mike32_ob, // 0x4df
        cos_jup_1912_masterycoin_limax_ob, // 0x4e0
        cos_jup_1912_masterycoin_lm_evictor, // 0x4e1
        cos_jup_1912_masterycoin_lm_halpha, // 0x4e2
        cos_jup_1912_masterycoin_lm_halpha_ob, // 0x4e3
        cos_jup_1912_masterycoin_lm_mgolf36, // 0x4e4
        cos_jup_1912_masterycoin_lm_mkilo3_ob, // 0x4e5
        cos_jup_1912_masterycoin_lm_pkilop, // 0x4e6
        cos_jup_1912_masterycoin_lm_pkilop_ob, // 0x4e7
        cos_jup_1912_masterycoin_lm_qbravo95slw, // 0x4e8
        cos_jup_1912_masterycoin_lm_qbravo95slw_ob, // 0x4e9
        cos_jup_1912_masterycoin_me_kalpha, // 0x4ea
        cos_jup_1912_masterycoin_me_kalpha_ob, // 0x4eb
        cos_jup_1912_masterycoin_me_knife, // 0x4ec
        cos_jup_1912_masterycoin_me_knife_ob, // 0x4ed
        cos_jup_1912_masterycoin_mgolf36_ob, // 0x4ee
        cos_jup_1912_masterycoin_mike14_ob, // 0x4ef
        cos_jup_1912_masterycoin_mike16_ob, // 0x4f0
        cos_jup_1912_masterycoin_mike2011_ob, // 0x4f1
        cos_jup_1912_masterycoin_mike24_ob, // 0x4f2
        cos_jup_1912_masterycoin_mike4_ob, // 0x4f3
        cos_jup_1912_masterycoin_mike93_ob, // 0x4f4
        cos_jup_1912_masterycoin_mpapa5_ob, // 0x4f5
        cos_jup_1912_masterycoin_mromeo_ob, // 0x4f6
        cos_jup_1912_masterycoin_msecho_ob, // 0x4f7
        cos_jup_1912_masterycoin_ngsierra_ob, // 0x4f8
        cos_jup_1912_masterycoin_oromeo12_ob, // 0x4f9
        cos_jup_1912_masterycoin_papa220_ob, // 0x4fa
        cos_jup_1912_masterycoin_pgolf1_ob, // 0x4fb
        cos_jup_1912_masterycoin_pi_glima21, // 0x4fc
        cos_jup_1912_masterycoin_pi_glima21_ob, // 0x4fd
        cos_jup_1912_masterycoin_pi_mike93, // 0x4fe
        cos_jup_1912_masterycoin_pi_rsierra12, // 0x4ff
        cos_jup_1912_masterycoin_pi_uzulum, // 0x500
        cos_jup_1912_masterycoin_pickaxe_ob, // 0x501
        cos_jup_1912_masterycoin_ralpha_ob, // 0x502
        cos_jup_1912_masterycoin_riotshield_ob, // 0x503
        cos_jup_1912_masterycoin_riotshield_ob_000, // 0x504
        cos_jup_1912_masterycoin_rkilo_ob, // 0x505
        cos_jup_1912_masterycoin_rpapa7_ob, // 0x506
        cos_jup_1912_masterycoin_rsierra12_ob, // 0x507
        cos_jup_1912_masterycoin_sa700_ob, // 0x508
        cos_jup_1912_masterycoin_sbeta_ob, // 0x509
        cos_jup_1912_masterycoin_scharlie_ob, // 0x50a
        cos_jup_1912_masterycoin_schotel_ob, // 0x50b
        cos_jup_1912_masterycoin_sdelta_ob, // 0x50c
        cos_jup_1912_masterycoin_sh_aromeo410, // 0x50d
        cos_jup_1912_masterycoin_sh_oromeo12, // 0x50e
        cos_jup_1912_masterycoin_sh_recho870, // 0x50f
        cos_jup_1912_masterycoin_sh_recho870_ob, // 0x510
        cos_jup_1912_masterycoin_slima8_ob, // 0x511
        cos_jup_1912_masterycoin_sm_coscar635, // 0x512
        cos_jup_1912_masterycoin_sm_lwhiskey, // 0x513
        cos_jup_1912_masterycoin_sm_lwhiskey_ob, // 0x514
        cos_jup_1912_masterycoin_sm_scharlie3, // 0x515
        cos_jup_1912_masterycoin_sm_scharlie3_ob, // 0x516
        cos_jup_1912_masterycoin_sm_umike, // 0x517
        cos_jup_1912_masterycoin_sm_umike_ob, // 0x518
        cos_jup_1912_masterycoin_sm_uzulu, // 0x519
        cos_jup_1912_masterycoin_sm_uzulup, // 0x51a
        cos_jup_1912_masterycoin_sm_uzulup_ob, // 0x51b
        cos_jup_1912_masterycoin_sn_boscar, // 0x51c
        cos_jup_1912_masterycoin_sn_hsierra, // 0x51d
        cos_jup_1912_masterycoin_sn_hsierra_ob, // 0x51e
        cos_jup_1912_masterycoin_sn_sviktor, // 0x51f
        cos_jup_1912_masterycoin_soscar14_ob, // 0x520
        cos_jup_1912_masterycoin_svictork_ob, // 0x521
        cos_jup_1912_masterycoin_sviktor_ob, // 0x522
        cos_jup_1912_masterycoin_swhiskey_ob, // 0x523
        cos_jup_1912_masterycoin_talpha95_ob, // 0x524
        cos_jup_1912_masterycoin_tango9_ob, // 0x525
        cos_jup_1912_masterycoin_tonfa_ob, // 0x526
        cos_jup_1912_masterycoin_tsierra12_ob, // 0x527
        cos_jup_1912_masterycoin_uzulu_ob, // 0x528
        cos_jup_1912_masterycoin_uzulum_ob, // 0x529
        cos_jup_1912_masterycoin_walpha_ob, // 0x52a
        cos_jup_1912_masterycoin_xmike2010_ob, // 0x52b
        cos_jup_1912_masterycoin_xmike5_ob, // 0x52c
        cos_jup_1954_emea_partnership_retro_ghost, // 0x52d
        cos_jup_1953_emea_partnership_8bitghost, // 0x52e
        cos_jup_1973_code, // 0x52f
        cos_jup_1972_field_rep, // 0x530
        cos_jup_1955_emea_partnership_kawaii_gaz, // 0x531
        cos_jup_1932_little_caesars_partnership, // 0x532
        cos_jup_1005_motorcyclist, // 0x533
        cos_jup_1007_horseman_war_weapon, // 0x534
        cos_jup_1008_nebula_parallax, // 0x535
        cos_jup_1011_screentone_pop_art, // 0x536
        cos_jup_1016_undead_santa, // 0x537
        cos_jup_1032_nebula, // 0x538
        cos_jup_1033_celtic, // 0x539
        cos_jup_1049_smooth_obsidian, // 0x53a
        cos_jup_1051_haunted_forest, // 0x53b
        cos_jup_1959_season_1_mp_ranked_play_rewards_4, // 0x53c
        cos_jup_1908_champions_01, // 0x53d
        cos_jup_1941_crm_birthday_rewards, // 0x53e
        cos_jup_1944_internal_employee_gift, // 0x53f
        cos_jup_1501_battle_zone_01, // 0x540
        cos_jup_1506_battlemap_zone_06, // 0x541
        cos_jup_1520_battlezone_20, // 0x542
        cos_jup_1066_cdl_mutineers, // 0x543
        cos_jup_1084_machineguns_02, // 0x544
        cos_jup_1956_cdl_opening, // 0x545
        cos_jup_1072_cdl_optic, // 0x546
        cos_jup_1065_cdl_breach, // 0x547
        cos_jup_1027_aetherium_outbreak, // 0x548
        cos_jup_1028_cryptid_wendigo, // 0x549
        cos_jup_1959_season_1_mp_ranked_play_rewards_8, // 0x54a
        cos_jup_1905_outbreak_s1_reward, // 0x54b
        cos_jup_1980_challenge_reward, // 0x54c
        cos_jup_1978_challenge_reward_winter_holiday, // 0x54d
        cos_jup_1976_event_new_year, // 0x54e
        cos_jup_1975_field_rep, // 0x54f
        cos_jup_1907_warzone_season_1_rewards_25, // 0x550
        cos_jup_1075_cdl_vegas_legion, // 0x551
        cos_jup_1074_toronto_ultra, // 0x552
        cos_jup_1073_cdl_team_pack, // 0x553
        cos_jup_1071_subliners, // 0x554
        cos_jup_1070_cdl_rokkrs, // 0x555
        cos_jup_1069_cdl_thieves, // 0x556
        cos_jup_1068_cdl_guerillas, // 0x557
        cos_jup_1067_ravens, // 0x558
        cos_jup_1515_battlemap_zone_15, // 0x559
        cos_jup_1514_battlemap_zone_14, // 0x55a
        cos_jup_1507_battlemap_zone_07, // 0x55b
        cos_jup_1502_battlemap_zone_02, // 0x55c
        cos_jup_1959_season_1_mp_ranked_play_rewards_9, // 0x55d
        cos_jup_1959_season_1_mp_ranked_play_rewards_7, // 0x55e
        cos_jup_1959_season_1_mp_ranked_play_rewards_6, // 0x55f
        cos_jup_1959_season_1_mp_ranked_play_rewards_5, // 0x560
        cos_jup_1959_season_1_mp_ranked_play_rewards_3, // 0x561
        cos_jup_1060_bullet_pack_rubber_duck, // 0x562
        cos_jup_1058_egyptian, // 0x563
        cos_jup_1057_jade_scrollwork, // 0x564
        cos_jup_1054_manga, // 0x565
        cos_jup_1053_transluscent_fossil, // 0x566
        cos_jup_1052_tiger, // 0x567
        cos_jup_1050_classic_tech_fractal, // 0x568
        cos_jup_1044_electron, // 0x569
        cos_jup_1025_pc_gamer, // 0x56a
        cos_jup_1024_white_hat_hacker, // 0x56b
        cos_jup_1010_cryptocurrency, // 0x56c
        cos_jup_1009_transparent_hardware, // 0x56d
        cos_jup_1006_urban_techwear, // 0x56e
        cos_jup_1979_challenge_reward, // 0x56f
        cos_jup_1904_outbreak_launch_rewards_4, // 0x570
        cos_jup_1904_outbreak_launch_rewards_3, // 0x571
        cos_jup_1904_outbreak_launch_rewards_2, // 0x572
        cos_jup_1904_outbreak_launch_rewards_1, // 0x573
        cos_jup_1902_beta_reward, // 0x574
        cos_jup_1943_incentives_08, // 0x575
        cos_jup_1943_incentives_03, // 0x576
        cos_jup_1912_masterycoin_iw9_ar_malima_v0_ob, // 0x577
        cos_jup_1912_masterycoin_iw9_me_kamas_v0_ob, // 0x578
        cos_jup_1912_masterycoin_iw9_sm_acharlie9_v0_ob, // 0x579
        cos_jup_1912_masterycoin_v0, // 0x57a
        cos_jup_001_empire, // 0x57b
        cos_jup_002_tropical_fruit, // 0x57c
        cos_jup_003_retro_arcade, // 0x57d
        cos_jup_004_email_incentive, // 0x57e
        cos_jup_1063_cdl_faze, // 0x57f
        cos_jup_1512_battlemap_zone_12, // 0x580
        cos_jup_1912_masterycoin_ob, // 0x581
        cos_jup_iw9_200_masterycoin_ob, // 0x582
        cos_jup_1977_comp_v, // 0x583
        cos_jup_1932_pizza, // 0x584
        cos_jup_1957_snowman, // 0x585
        cos_jup_1945_influencer_beta_02, // 0x586
        cos_jup_1945_influencer_beta_03, // 0x587
        cos_jup_1946_influencer_stream_event_01, // 0x588
        cos_jup_1948_influencer_wz_drops, // 0x589
        cos_jup_1950_influencer_dec, // 0x58a
        cos_jup_1952_marketing_season_1_incentives, // 0x58b
        cos_jup_1958_persistent_mp_ranked_play_rewards_12, // 0x58c
        cos_jup_1958_persistent_mp_ranked_play_rewards_13, // 0x58d
        cos_jup_1003_ptwo_eta, // 0x58e
        cos_jup_1523_incoming, // 0x58f
        cos_jup_1522_strongbox, // 0x590
        cos_jup_1521_evil_snowman, // 0x591
        cos_jup_1524_blacksite_key, // 0x592
        cos_jup_1002_pone_beta, // 0x593
        cos_jup_1014_paladin, // 0x594
        cos_jup_1062_sony_combat_pack, // 0x595
        cos_jup_1061_pone_gamma, // 0x596
        cos_jup_2048_prehistoric, // 0x597
        cos_jup_1093_4_free_bundle, // 0x598
        cos_jup_2502_5_battlemap_zone_2, // 0x599
        cos_jup_1004_ptwo_zeta, // 0x59a
        cos_jup_2932_1_s2_incentives, // 0x59b
        cos_jup_2900_2_monkey, // 0x59c
        cos_jup_2922_9_s2_ranked, // 0x59d
        cos_jup_2903_4_wz, // 0x59e
        cos_jup_2520_5_battlemap_zone_20, // 0x59f
        cos_jup_2515_5_battlemap_zone_15, // 0x5a0
        cos_jup_2514_2_battlemap_zone_14, // 0x5a1
        cos_jup_2513_4_battlemap_zone_13, // 0x5a2
        cos_jup_2512_battlemap_zone_12, // 0x5a3
        cos_jup_2507_4_battlemap_zone_07, // 0x5a4
        cos_jup_2506_4_battlemap_zone_6, // 0x5a5
        cos_jup_2505_3_battlemap_zone_05, // 0x5a6
        cos_jup_2501_battlemap_zone_01, // 0x5a7
        cos_jup_2925_8_monster, // 0x5a8
        cos_jup_2926_5_field_replunar_new_year, // 0x5a9
        cos_jup_2081_6_zombie, // 0x5aa
        cos_jup_2067_6_combat_02, // 0x5ab
        cos_jup_2934_4_bat, // 0x5ac
        cos_jup_2006_6_trash, // 0x5ad
        cos_jup_2083_year_dragon, // 0x5ae
        cos_jup_2033_evergreen, // 0x5af
        cos_jup_2073_free_05, // 0x5b0
        cos_jup_2072_free_04, // 0x5b1
        cos_jup_2071_free_03, // 0x5b2
        cos_jup_2084_ob_worm, // 0x5b3
        cos_jup_2058_amber_fossil, // 0x5b4
        cos_jup_2052_modern_lethal_luxury, // 0x5b5
        cos_jup_2040_mothman, // 0x5b6
        cos_jup_2038_cryptid_nessie, // 0x5b7
        cos_jup_2026_nova_6_powder, // 0x5b8
        cos_jup_2025_alien_mtl, // 0x5b9
        cos_jup_2019_annihilation, // 0x5ba
        cos_jup_2087_glow_in_dark, // 0x5bb
        cos_jup_2017_muscle_armor, // 0x5bc
        cos_jup_2013_neon_terrarium, // 0x5bd
        cos_jup_2056_vaporware, // 0x5be
        cos_jup_2057_octopus, // 0x5bf
        cos_jup_2043_blood_moon, // 0x5c0
        cos_jup_2039_bigfoot, // 0x5c1
        cos_jup_2010_bloodless_biomech_human, // 0x5c2
        cos_jup_2004_nova_6_soldier, // 0x5c3
        cos_jup_1963_persistent_warzone_ranked_play_rewards_2, // 0x5c4
        cos_jup_1963_pers_wz_rank_play_rewards_3, // 0x5c5
        cos_jup_1964_ranked, // 0x5c6
        cos_jup_2070_free_02, // 0x5c7
        cos_jup_2088_paranormal_weapons, // 0x5c8
        cos_jup_2915_22_masterycoin_talpham_ob, // 0x5c9
        cos_jup_2927_3_challenge_eventcryptid_challenges_1, // 0x5ca
        cos_jup_2931_4_field_rep_event_rewards_pone_omega, // 0x5cb
        cos_jup_2094_5_underworld, // 0x5cc
        cos_jup_2080_7_pone_tama, // 0x5cd
        cos_jup_2007_9_raspberry, // 0x5ce
        cos_jup_2002_7_berry, // 0x5cf
        cos_jup_2930_3_challenge_eventapocalypse_pestilence, // 0x5d0
        cos_jup_2011_5_tooth_fairy, // 0x5d1
        cos_jup_2086_cultist, // 0x5d2
        cos_jup_2085_makarov_tattoo, // 0x5d3
        cos_jup_2050_armored, // 0x5d4
        cos_jup_2036_acrylic_ramen, // 0x5d5
        cos_jup_2035_chrome_abb, // 0x5d6
        cos_jup_2034_transp_tech, // 0x5d7
        cos_jup_2003_scout_10, // 0x5d8
        cos_jup_2003_scout_11, // 0x5d9
        cos_jup_2078_free_10, // 0x5da
        cos_jup_2077_free_09, // 0x5db
        cos_jup_2076_free_08, // 0x5dc
        cos_jup_2075_free_07, // 0x5dd
        cos_jup_2032_holidays, // 0x5de
        cos_jup_2031_carnival, // 0x5df
        cos_jup_2030_st_patties, // 0x5e0
        cos_jup_2055_edc_orange, // 0x5e1
        cos_jup_2045_sawblade, // 0x5e2
        cos_jup_2041_marbled_wagyu_beef, // 0x5e3
        cos_jup_2014_prototype_riva, // 0x5e4
        cos_jup_2009_horsemandecay_weapon, // 0x5e5
        cos_jup_2008_proxy_weapon, // 0x5e6
        cos_jup_2016_horseman_decay, // 0x5e7
        cos_jup_2059_amber_entombment, // 0x5e8
        cos_jup_2074_free_06, // 0x5e9
        cos_jup_2916_22_masterycoin_aromeo200_ob, // 0x5ea
        cos_jup_2079_7_banana, // 0x5eb
        cos_jup_2093_sports_bike, // 0x5ec
        cos_jup_2906_8_wz_s2_royale, // 0x5ed
        cos_jup_2906_7_wz_s2_royale, // 0x5ee
        cos_jup_2909_3_wz_s2_quest, // 0x5ef
        cos_jup_2914_22_masterycoin_aromeo200, // 0x5f0
        cos_jup_2904_3_wz_s2_zombie, // 0x5f1
        cos_jup_2069_6_free_01, // 0x5f2
        cos_jup_2906_9_wz_s2_royale, // 0x5f3
        cos_jup_2015_zodiac_scorpio, // 0x5f4
        cos_jup_1525_zip_shooter, // 0x5f5
        cos_jup_1912_masterycoin_ar_foxtrot2000_ob, // 0x5f6
        cos_jup_1912_masterycoin_ar_foxtrot2000, // 0x5f7
        cos_jup_2913_22_masterycoin_talpham, // 0x5f8
        cos_jup_1912_masterycoin_me_swhiskey, // 0x5f9
        cos_jup_1912_masterycoin_sm_pmike_ob, // 0x5fa
        cos_jup_2929_6_community_event_berry_blueberry, // 0x5fb
        cos_jup_1912_masterycoin_me_swhiskey_ob, // 0x5fc
        cos_jup_3048_4_rebirth_soldier, // 0x5fd
        cos_jup_3034_4_dinosaur, // 0x5fe
        cos_jup_3520_5_battlemap_zone_20, // 0x5ff
        cos_jup_3003_6_sloth_ghillie, // 0x600
        cos_jup_3010_6_golden_week, // 0x601
        cos_jup_3012_6_headtank, // 0x602
        cos_jup_3018_6_horseman_virus_avatar, // 0x603
        cos_jup_3028_5_spider_cocoon, // 0x604
        cos_jup_3029_5_el_porteno, // 0x605
        cos_jup_3032_6_augmented_bandit, // 0x606
        cos_jup_3037_6_killer_dead_eyes, // 0x607
        cos_jup_3038_6_killer_doll_collector, // 0x608
        cos_jup_3039_6_killer_serial_killer, // 0x609
        cos_jup_3040_6_killer_bone_collector, // 0x60a
        cos_jup_3041_6_action_figure, // 0x60b
        cos_jup_3045_6_banshee_geisha, // 0x60c
        cos_jup_3049_6_danger_buds, // 0x60d
        cos_jup_3053_6_vintage_firecracker, // 0x60e
        cos_jup_3064_6_sony_combat_pack_3, // 0x60f
        cos_jup_3932_5_drone, // 0x610
        cos_jup_3051_6_fractured, // 0x611
        cos_jup_3512_4_battlemap_zone_12, // 0x612
        cos_jup_3928_2_glove_boxing, // 0x613
        cos_jup_3079_8_cheech_and_chong, // 0x614
        cos_jup_3060_5_deaths_head_moth, // 0x615
        cos_jup_3058_5_monster_truck, // 0x616
        cos_jup_3057_5_nixie_tube, // 0x617
        cos_jup_3056_5_beer_shotgun, // 0x618
        cos_jup_3055_5_color_duality, // 0x619
        cos_jup_3054_6_ants, // 0x61a
        cos_jup_3052_6_broken_glass, // 0x61b
        cos_jup_3050_6_black_hexagon, // 0x61c
        cos_jup_3047_6_underworld_gods_anubis, // 0x61d
        cos_jup_3046_6_wildlife_wanted_bat, // 0x61e
        cos_jup_3042_6_demon_eyes, // 0x61f
        cos_jup_3031_9_moto_girl, // 0x620
        cos_jup_3025_6_april_fools_keyboard_ghillie, // 0x621
        cos_jup_3024_6_cinco_de_mayo, // 0x622
        cos_jup_3023_5_color_change, // 0x623
        cos_jup_3027_6_sculpture, // 0x624
        cos_jup_3026_5_easter_killer_bunny, // 0x625
        cos_jup_3015_6_echo_fox, // 0x626
        cos_jup_3007_6_biolumescent, // 0x627
        cos_jup_3909_35_masterycoin_pdango_ob, // 0x628
        cos_jup_3907_35_masterycoin_pdango, // 0x629
        cos_jup_3929_3_bomb, // 0x62a
        cos_jup_3927_4_die_20, // 0x62b
        cos_jup_3925_2_gummy_bear, // 0x62c
        cos_jup_3022_5_anemone, // 0x62d
        cos_jup_3515_5_battlemap_zone_15, // 0x62e
        cos_jup_3514_2_battlemap_zone_14, // 0x62f
        cos_jup_3506_4_battlemap_zone_06, // 0x630
        cos_jup_3021_7_fruit_plantain, // 0x631
        cos_jup_3013_7_fruit_plum, // 0x632
        cos_jup_3909_22_masterycoin_moscar_ob, // 0x633
        cos_jup_3501_3_battlemap_zone_1, // 0x634
        cos_jup_3907_9_masterycoin_mpapa9, // 0x635
        cos_jup_3907_22_masterycoin_moscar, // 0x636
        cos_jup_3909_9_masterycoin_mpapa9_ob, // 0x637
        cos_jup_3044_6_makarov_urban, // 0x638
        cos_jup_3079_9_c_and_c, // 0x639
        cos_jup_3502_5_battlemap_zone_02, // 0x63a
        cos_jup_3507_4_battlemap_zone_7, // 0x63b
        cos_jup_3918_5_fruit_peach, // 0x63c
        cos_jup_3919_3_how_high, // 0x63d
        cos_jup_3920_7_vortex_virus, // 0x63e
        cos_jup_3923_1_s3_incentives, // 0x63f
        cos_jup_3911_6_monster, // 0x640
        cos_jup_3914_18_s3_wz_ranked, // 0x641
        cos_jup_3915_4_fruit_kiwi, // 0x642
        cos_jup_3017_7_fruit_pineapple, // 0x643
        cos_jup_3043_6_zombies_mangler, // 0x644
        cos_jup_3913_18_s3_mp_ranked, // 0x645
        cos_jup_3910_9_masterycoin_balpha27_ob, // 0x646
        cos_jup_3908_9_masterycoin_balpha27, // 0x647
        cos_jup_3900_2_s3_reward, // 0x648
        cos_jup_3030_red_black_geo, // 0x649
        cos_jup_3016_6_riva_moving_energy, // 0x64a
        cos_jup_n4932_1, // 0x64b
        cos_jup_3014_6_clockwork_ornate, // 0x64c
        cos_jup_3019_6_form_change_jet, // 0x64d
        cos_jup_3921_9_community_field_rep_voxel, // 0x64e
        cos_jup_3033_6_trash_talk_two, // 0x64f
        cos_jup_3011_5_combining_military_branches, // 0x650
        cos_jup_3036_6_riva_material_prototype, // 0x651
        cos_jup_3065_3_cdl_cel_shaded, // 0x652
        cos_jup_3917_5_code_military_appreciation_uav_event_rewards, // 0x653
        cos_jup_3009_5_voxel, // 0x654
        cos_jup_3059_5_energy_within, // 0x655
        cos_jup_3067_4_military_appreciation_month, // 0x656
        cos_jup_3080_9_mr_ultra, // 0x657
        cos_jup_3001_6_devin_booker, // 0x658
        cos_jup_4923_2_trophy_hunt_altered_strain, // 0x659
        cos_jup_4042_4_cdl_reaper, // 0x65a
        cos_jup_4914_3_cdl_champs_24_incentives, // 0x65b
        cos_jup_4911_2_trident_gum_partnership, // 0x65c
        cos_jup_4913_1_cdl_major_5_incentives, // 0x65d
        cos_jup_4917_18_s4_ranked, // 0x65e
        cos_jup_4918_24_season_4_warzone_ranked_play_rewards, // 0x65f
        cos_jup_1912_masterycoin_sm_pcharlie9_ob, // 0x660
        cos_jup_4510_3_battlemap_zone_10, // 0x661
        cos_jup_4004_10_grain_oats, // 0x662
        cos_jup_4917_20_s4_mp_ranked, // 0x663
        cos_jup_4917_19_s4_mp_ranked, // 0x664
        cos_jup_4933_24_wz_s4_rewards, // 0x665
        cos_jup_4933_22_wz_s4_rewards, // 0x666
        cos_jup_4933_20_wz_s4_rewards, // 0x667
        cos_jup_4912_1_s4_incentives, // 0x668
        cos_jup_4041_6_sony_combat_pack_04, // 0x669
        cos_jup_4944_1_deadshot_dacquiri, // 0x66a
        cos_jup_4019_5_tacgas, // 0x66b
        cos_jup_4933_23_wz_s4_rewards, // 0x66c
        cos_jup_4917_21_s4_mp_ranked, // 0x66d
        cos_jup_4917_22_s4_mp_ranked, // 0x66e
        cos_jup_4001_10_dough_wonton, // 0x66f
        cos_jup_4001_12_dough_wonton, // 0x670
        cos_jup_4004_11_grain_oats, // 0x671
        cos_jup_4917_23_s4_mp_ranked, // 0x672
        cos_jup_4917_24_s4_mp_ranked, // 0x673
        cos_jup_4922_10_dough_momo, // 0x674
        cos_jup_4924_6_grain_barley, // 0x675
        cos_jup_4933_21_wz_s4_rewards, // 0x676
        cos_jup_4002_10_dough_mandu, // 0x677
        cos_jup_4003_7_dough_samosa, // 0x678
        cos_jup_4003_8_dough_samosa, // 0x679
        cos_jup_4003_9_dough_samosa, // 0x67a
        cos_jup_1912_masterycoin_dm_kappa98, // 0x67b
        cos_jup_1912_masterycoin_dm_kappa98_ob, // 0x67c
        cos_jup_1912_masterycoin_sm_pcharlie9, // 0x67d
        cos_jup_4002_12_dough_mandu, // 0x67e
        cos_jup_4925_12_vortex_death, // 0x67f
        cos_jup_4055_6_black_hole, // 0x680
        cos_jup_1912_masterycoin_me_shotel, // 0x681
        cos_jup_1912_masterycoin_me_shotel_ob, // 0x682
        cos_jup_1912_masterycoin_sh_spapa12, // 0x683
        cos_jup_1912_masterycoin_sh_spapa12_ob, // 0x684
        cos_jup_5911_2_crisps, // 0x685
        cos_jup_4057_6_morrigan, // 0x686
        cos_jup_5912_1_s5_incentives, // 0x687
        cos_jup_5018_7_cryptex, // 0x688
        cos_jup_5019_7_shapechanger, // 0x689
        cos_jup_n5927_1, // 0x68a
        cos_jup_5915_24_s5_wz_ranked, // 0x68b
        cos_jup_1912_masterycoin_sm_kpappa50, // 0x68c
        cos_jup_1912_masterycoin_sm_kpappa50_ob, // 0x68d
        cos_jup_5015_6_weed_slug, // 0x68e
        cos_jup_5010_6_echo_endo_hotaru, // 0x68f
        cos_jup_5914_18_s5_mp_ranked, // 0x690
        cos_jup_5915_19_s5_wz_ranked, // 0x691
        cos_jup_5915_20_s5_wz_ranked, // 0x692
        cos_jup_5915_21_s5_wz_ranked, // 0x693
        cos_jup_5915_22_s5_wz_ranked, // 0x694
        cos_jup_5915_23_s5_wz_ranked, // 0x695
        cos_jup_5025_6_sony_combat_05, // 0x696
        cos_jup_5003_7_sweet_mochi, // 0x697
        cos_jup_5917_4_deathmatch, // 0x698
        cos_jup_5002_7_sweet_gelato, // 0x699
        cos_jup_5513_7_battlemap_zone_13, // 0x69a
        cos_jup_5915_18_s5_wz_ranked, // 0x69b
        cos_jup_5916_6_sweet_flan, // 0x69c
        cos_jup_5918_4_echo_endo, // 0x69d
        cos_jup_1912_masterycoin_ar_stango44_ob, // 0x69e
        cos_jup_1912_masterycoin_ar_stango44, // 0x69f
        cos_jup_5001_5_greek_goddess, // 0x6a0
        cos_jup_1912_masterycoin_me_spear, // 0x6a1
        cos_jup_1912_masterycoin_me_spear_ob, // 0x6a2
        cos_jup_1912_masterycoin_dm_compound, // 0x6a3
        cos_jup_1912_masterycoin_dm_compound_ob, // 0x6a4
        cos_jup_5932_2_s5_mwz_rewards, // 0x6a5
        cos_jup_5931_4_code_bowl_v, // 0x6a6
        cos_jup_5920_6_battle_beasts, // 0x6a7
        cos_jup_4054_8_rose_thorn, // 0x6a8
        cos_jup_5007_punk_ghost, // 0x6a9
        cos_jup_6006_6_oktoberfest, // 0x6aa
        cos_jup_6010_6_echo_endo_mahou, // 0x6ab
        cos_jup_1912_masterycoin_hcharlie36, // 0x6ac
        cos_jup_1912_masterycoin_hcharlie36_ob, // 0x6ad
        cos_jup_6505_5_battlemap_zone_5, // 0x6ae
        cos_cer_258_reg, // 0x6af
        cos_cer_271_execut, // 0x6b0
        cos_cer_270_gummy, // 0x6b1
        cos_cer_269_lollipop, // 0x6b2
        cos_cer_268_caramel, // 0x6b3
        cos_cer_267_jellybean, // 0x6b4
        cos_cer_256_scarecrow, // 0x6b5
        cos_cer_266_ghostwar, // 0x6b6
        cos_cer_253_comedy, // 0x6b7
        cos_cer_233_offgrid, // 0x6b8
        cos_cer_248_vamptool, // 0x6b9
        cos_cer_252_extra, // 0x6ba
        cos_cer_247_grindh, // 0x6bb
        cos_cer_255_muertos, // 0x6bc
        cos_cer_265_witch, // 0x6bd
        cos_cer_249_creepy, // 0x6be
        cos_cer_254_larpers, // 0x6bf
        cos_cer_262_braing, // 0x6c0
        cos_cer_239_celmonster, // 0x6c1
        cos_cer_238_wninja, // 0x6c2
        cos_cer_261_victory, // 0x6c3
        cos_cer_221_diffuse, // 0x6c4
        cos_cer_259_round, // 0x6c5
        cos_cer_232_beach, // 0x6c6
        cos_cer_264_smuggler, // 0x6c7
        cos_cer_236_astrology, // 0x6c8
        cos_cer_241_juggbot, // 0x6c9
        cos_cer_240_khnum, // 0x6ca
        cos_cer_239_ahunter, // 0x6cb
        cos_cer_260_penguin, // 0x6cc
        cos_cer_222_bluntev, // 0x6cd
        cos_cer_263_anime2d, // 0x6ce
        cos_cer_185_queen, // 0x6cf
        cos_cer_188_nuketown, // 0x6d0
        cos_cer_246_redoni, // 0x6d1
        cos_cer_235_techguy, // 0x6d2
        cos_cer_242_mrpeeks, // 0x6d3
        cos_cer_250_actionh, // 0x6d4
        cos_cer_231_person, // 0x6d5
        cos_cer_230_lastm, // 0x6d6
        cos_cer_229_leather, // 0x6d7
        cos_cer_228_roller, // 0x6d8
        cos_cer_227_angler, // 0x6d9
        cos_cer_257_kick, // 0x6da
        cos_cer_237_janus, // 0x6db
        cos_cer_234_oneman, // 0x6dc
        cos_cer_220_combo, // 0x6dd
        cos_cer_245_s5blk, // 0x6de
        cos_cer_217_epoc, // 0x6df
        cos_cer_251_ironnavigator, // 0x6e0
        cos_cer_218_timemach, // 0x6e1
        cos_cer_197_lowrez, // 0x6e2
        cos_cer_194_altitude, // 0x6e3
        cos_cer_223_retriever, // 0x6e4
        cos_cer_219_codtoons, // 0x6e5
        cos_cer_216_diver, // 0x6e6
        cos_cer_224_yorkie, // 0x6e7
        cos_cer_135_pday, // 0x6e8
        cos_cer_225_clown, // 0x6e9
        cos_cer_226_goblins, // 0x6ea
        cos_cer_215_cdlchamps, // 0x6eb
        cos_cer_214_cdlview, // 0x6ec
        cos_cer_213_s4repevent, // 0x6ed
        cos_cer_212_s4ranked06, // 0x6ee
        cos_cer_211_s4ranked05, // 0x6ef
        cos_cer_210_s4ranked04, // 0x6f0
        cos_cer_209_s4ranked03, // 0x6f1
        cos_cer_208_s4ranked02, // 0x6f2
        cos_cer_207_s4ranked, // 0x6f3
        cos_cer_206_usagi, // 0x6f4
        cos_cer_205_printer, // 0x6f5
        cos_cer_204_waterb, // 0x6f6
        cos_cer_203_conband, // 0x6f7
        cos_cer_202_cdlmidpackb, // 0x6f8
        cos_cer_201_doberman02, // 0x6f9
        cos_cer_200_gobble, // 0x6fa
        cos_cer_199_riley, // 0x6fb
        cos_cer_198_potato, // 0x6fc
        cos_cer_196_doberman, // 0x6fd
        cos_cer_195_guards, // 0x6fe
        cos_cer_193_animez, // 0x6ff
        cos_cer_192_breakout, // 0x700
        cos_cer_191_goated, // 0x701
        cos_cer_190_celnoir, // 0x702
        cos_cer_189_jaguar, // 0x703
        cos_cer_187_fighter, // 0x704
        cos_cer_186_dadler, // 0x705
        cos_cer_184_greenivy, // 0x706
        cos_cer_183_woodland, // 0x707
        cos_cer_182_upcevent, // 0x708
        cos_cer_181_cortea, // 0x709
        cos_cer_180_corbot, // 0x70a
        cos_cer_179_outlaw, // 0x70b
        cos_cer_178_paintball, // 0x70c
        cos_cer_177_lucky, // 0x70d
        cos_cer_176_jailer, // 0x70e
        cos_cer_175_bo4, // 0x70f
        cos_cer_174_bo3, // 0x710
        cos_cer_173_winter, // 0x711
        cos_cer_172_bdog, // 0x712
        cos_cer_171_swolf, // 0x713
        cos_cer_170_enforcer, // 0x714
        cos_cer_169_lettuce, // 0x715
        cos_cer_168_highfan, // 0x716
        cos_cer_167_s3ranked, // 0x717
        cos_cer_166_martini, // 0x718
        cos_cer_165_necro, // 0x719
        cos_cer_164_mansion, // 0x71a
        cos_cer_163_cdlmidpacka, // 0x71b
        cos_cer_162_gamer, // 0x71c
        cos_cer_161_cucumber, // 0x71d
        cos_cer_160_gbronze, // 0x71e
        cos_cer_159_bublamp, // 0x71f
        cos_cer_158_claws02, // 0x720
        cos_cer_156_cardboard, // 0x721
        cos_cer_155_carver, // 0x722
        cos_cer_154_hnoevil, // 0x723
        cos_cer_153_drkmagic, // 0x724
        cos_cer_152_comic, // 0x725
        cos_cer_151_viking, // 0x726
        cos_cer_151_s2_5_dr, // 0x727
        cos_cer_150_voyage, // 0x728
        cos_cer_150_map, // 0x729
        cos_cer_149_archie, // 0x72a
        cos_cer_148_notch, // 0x72b
        cos_cer_147_haunted, // 0x72c
        cos_cer_146_wizard, // 0x72d
        cos_cer_145_lychee, // 0x72e
        cos_cer_144_fieldrep, // 0x72f
        cos_cer_143_challeng, // 0x730
        cos_cer_142_cyberlock, // 0x731
        cos_cer_141_ggs, // 0x732
        cos_cer_140_mecha, // 0x733
        cos_cer_139_nuclear, // 0x734
        cos_cer_138_jcrafts, // 0x735
        cos_cer_137_hponics, // 0x736
        cos_cer_136_tparent, // 0x737
        cos_cer_134_bigjoke, // 0x738
        cos_cer_133_digsite, // 0x739
        cos_cer_132_redpanda, // 0x73a
        cos_cer_131_assam, // 0x73b
        cos_cer_130_glowdark, // 0x73c
        cos_cer_129_rcombat, // 0x73d
        cos_cer_128_pinata, // 0x73e
        cos_cer_127_icenlava, // 0x73f
        cos_cer_126_hitlist, // 0x740
        cos_cer_125_jasmine, // 0x741
        cos_cer_122_taro, // 0x742
        cos_cer_121_ghillie, // 0x743
        cos_cer_120_fatale, // 0x744
        cos_cer_119_pklaus, // 0x745
        cos_cer_118_burger, // 0x746
        cos_cer_117_creature, // 0x747
        cos_cer_116_rpcrown, // 0x748
        cos_cer_115_piratekeg, // 0x749
        cos_cer_114_nlog, // 0x74a
        cos_cer_113_volt, // 0x74b
        cos_cer_112_nscroll, // 0x74c
        cos_cer_111_angeldem, // 0x74d
        cos_cer_110_vhunter, // 0x74e
        cos_cer_109_cyber, // 0x74f
        cos_cer_108_mystery, // 0x750
        cos_cer_107_rhornet, // 0x751
        cos_cer_106_ninstar, // 0x752
        cos_cer_105_ranked01, // 0x753
        cos_cer_104_vertigo, // 0x754
        cos_cer_103_gsquad, // 0x755
        cos_cer_102_jfrost, // 0x756
        cos_cer_101_sbrobber, // 0x757
        cos_cer_100_repair, // 0x758
        cos_cer_099_mime, // 0x759
        cos_cer_098_snowchibi, // 0x75a
        cos_cer_097_seahorse, // 0x75b
        cos_cer_096_pr08, // 0x75c
        cos_cer_095_pr07, // 0x75d
        cos_cer_094_pr06, // 0x75e
        cos_cer_093_bitfish, // 0x75f
        cos_cer_092_mushroom, // 0x760
        cos_cer_091_dots, // 0x761
        cos_cer_090_keep, // 0x762
        cos_cer_089_cdlfaz, // 0x763
        cos_cer_088_cdlrav, // 0x764
        cos_cer_087_cdlbre, // 0x765
        cos_cer_086_cdlclo, // 0x766
        cos_cer_085_cdlgur, // 0x767
        cos_cer_084_cdlthi, // 0x768
        cos_cer_083_cdlher, // 0x769
        cos_cer_082_cdlrok, // 0x76a
        cos_cer_081_cdlsur, // 0x76b
        cos_cer_080_cdlopt, // 0x76c
        cos_cer_079_cdlult, // 0x76d
        cos_cer_078_cdlfal, // 0x76e
        cos_cer_077_cdllau, // 0x76f
        cos_cer_076_cdlope, // 0x770
        cos_cer_075_cdlmaj, // 0x771
        cos_cer_074_reptile, // 0x772
        cos_cer_073_boyband, // 0x773
        cos_cer_072_ademon, // 0x774
        cos_cer_071_phelmet, // 0x775
        cos_cer_070_stingray01, // 0x776
        cos_cer_069_milsim, // 0x777
        cos_cer_068_speed, // 0x778
        cos_cer_067_termin, // 0x779
        cos_cer_066_lfalls, // 0x77a
        cos_cer_065_contpc, // 0x77b
        cos_cer_064_bgame, // 0x77c
        cos_cer_063_hacker, // 0x77d
        cos_cer_062_noevil, // 0x77e
        cos_cer_061_safety, // 0x77f
        cos_cer_060_pr05, // 0x780
        cos_cer_059_pr04, // 0x781
        cos_cer_058_pr03, // 0x782
        cos_cer_057_pr02, // 0x783
        cos_cer_056_tvff, // 0x784
        cos_cer_055_arcade, // 0x785
        cos_cer_054_pr01, // 0x786
        cos_cer_053_maskbank, // 0x787
        cos_cer_052_woods, // 0x788
        cos_cer_051_in01, // 0x789
        cos_cer_050_diamond, // 0x78a
        cos_cer_049_cartoon, // 0x78b
        cos_cer_048_jugsoda, // 0x78c
        cos_cer_047_hypnosis, // 0x78d
        cos_cer_046_falone, // 0x78e
        cos_cer_045_lunar, // 0x78f
        cos_cer_044_darkcoin, // 0x790
        cos_cer_043_macchi, // 0x791
        cos_cer_042_endow, // 0x792
        cos_cer_041_mystery, // 0x793
        cos_cer_040_inlc, // 0x794
        cos_cer_038_zmbus, // 0x795
        cos_cer_036_beta01, // 0x796
        cos_cer_034_steam, // 0x797
        cos_cer_032_panther, // 0x798
        cos_cer_030_tundra, // 0x799
        cos_cer_029_bp03, // 0x79a
        cos_cer_028_bp02, // 0x79b
        cos_cer_027_bp01, // 0x79c
        cos_cer_025_manga, // 0x79d
        cos_cer_024_steel, // 0x79e
        cos_cer_023_highend, // 0x79f
        cos_cer_022_slayer, // 0x7a0
        cos_cer_021_police, // 0x7a1
        cos_cer_020_turkey, // 0x7a2
        cos_cer_019_tattooed, // 0x7a3
        cos_cer_018_deco, // 0x7a4
        cos_cer_017_arsenal, // 0x7a5
        cos_cer_016_nye, // 0x7a6
        cos_cer_015_bong, // 0x7a7
        cos_cer_014_trophy, // 0x7a8
        cos_cer_013_gvibes, // 0x7a9
        cos_cer_012_zombie, // 0x7aa
        cos_cer_010_shark, // 0x7ab
        cos_cer_009_exec, // 0x7ac
        cos_cer_008_biker, // 0x7ad
        cos_cer_007_dsniper, // 0x7ae
        cos_cer_006_quartz, // 0x7af
        cos_cer_005_garnet, // 0x7b0
        cos_cer_004_beta01, // 0x7b1
        cos_cer_003_in03, // 0x7b2
        cos_cer_002_in02, // 0x7b3
        cos_cer_001_in01, // 0x7b4
        cos_cer_000_temp, // 0x7b5
        cos_cer_screen_022_s6blk, // 0x7b6
        cos_cer_screen_021_gummy, // 0x7b7
        cos_cer_screen_020_nuketown, // 0x7b8
        cos_cer_screen_019_clown, // 0x7b9
        cos_cer_screen_018_bichon, // 0x7ba
        cos_cer_screen_017_diver, // 0x7bb
        cos_cer_screen_016_s4blk, // 0x7bc
        cos_cer_screen_015_cucumber, // 0x7bd
        cos_cer_screen_014_carver, // 0x7be
        cos_cer_screen_013_swolf, // 0x7bf
        cos_cer_screen_012_verdansk, // 0x7c0
        cos_cer_screen_011_lychee, // 0x7c1
        cos_cer_screen_010_fluid, // 0x7c2
        cos_cer_screen_009_bloody, // 0x7c3
        cos_cer_screen_008_fatale, // 0x7c4
        cos_cer_screen_006_stingray04, // 0x7c5
        cos_cer_screen_005_zposter, // 0x7c6
        cos_cer_screen_004_rps1, // 0x7c7
        cos_cer_screen_003_hiphop, // 0x7c8
        cos_cer_screen_002_scifi, // 0x7c9
        cos_cer_screen_001_base, // 0x7ca
        cos_cer_screen_000_temp, // 0x7cb
        cos_iw9_519, // 0x7cc
        cos_jup_1068, // 0x7cd
        cos_jup_1070, // 0x7ce
        cos_jup_1072, // 0x7cf
        cos_jup_1912_masterycoin_cdelta50_ob, // 0x7d0
        cos_jup_1912_masterycoin_rpapa20, // 0x7d1
        cos_jup_1912_masterycoin_rpapa20_ob, // 0x7d2
        cos_jup_1912_masterycoin_sm_pmike, // 0x7d3
        cos_jup_1912_masterycoin_sn_cdelta50, // 0x7d4
        cos_jup_1945_influencer_relations_beta_02, // 0x7d5
        cos_jup_1945_influencer_relations_beta_03, // 0x7d6
        cos_jup_1946_influencer_relations_stream_event_01, // 0x7d7
        cos_jup_1947_influencer_relations_mp_launch_01, // 0x7d8
        cos_jup_1948_influencer_relations_wz_drops, // 0x7d9
        cos_jup_1949_influencer_relations_nov, // 0x7da
        cos_jup_1950_influencer_relations_dec, // 0x7db
        cos_jup_1952_digital_marketing_season_1_incentives, // 0x7dc
        cos_jup_1958_pers_mp_rank_play_rewards_12, // 0x7dd
        cos_jup_1958_pers_mp_rank_play_rewards_13, // 0x7de
        cos_jup_1978_challenge_event_rewardswinter_holiday, // 0x7df
        cos_jup_6001_8_ore_copper, // 0x7e0
        cos_jup_6002_mineral_clay_7, // 0x7e1
        cos_jup_6007_6_entity, // 0x7e2
        cos_jup_6009_6_horseman_madness, // 0x7e3
        cos_jup_6013_5_vertigo, // 0x7e4
        cos_jup_6016_6_s6_mp_ranked, // 0x7e5
        cos_jup_6909_1_s6_incentives, // 0x7e6
        cos_jup_6910_24_s6_mp_ranked, // 0x7e7
        cos_jup_6911_18_season_6_warzone_ranked_play_rewards, // 0x7e8
        cos_jup_6914_5_ore_tin, // 0x7e9
        cos_jup_6915_4_sports_sumo_event_rewards, // 0x7ea
        cos_jup_6916_4_wrapped_event, // 0x7eb
        cos_jup_6918_5_limbo_interaction_rewards, // 0x7ec
        cos_jup_6918_9_limbo_interaction_rewards, // 0x7ed
        cos_jup_6920_2_amp_mastery, // 0x7ee
        jup_cos_iw9_544, // 0x7ef
        jup_cos_iw9_548, // 0x7f0
        jup_cos_iw9_549 // 0x7f1
    };

    // idx 0x6 members: 0xa type: 5
    enum CPSuper {
        none, // 0x0
        role_tank, // 0x1
        role_hunter, // 0x2
        role_engineer, // 0x3
        role_demolition, // 0x4
        role_medic, // 0x5
        role_assault, // 0x6
        kitAssault, // 0x7
        kitMedic, // 0x8
        kitRecon // 0x9
    };

    // idx 0x7 members: 0x12c type: 5
    enum BodyCustomization {
        body_0, // 0x0
        body_1, // 0x1
        body_2, // 0x2
        body_3, // 0x3
        body_4, // 0x4
        body_5, // 0x5
        body_6, // 0x6
        body_7, // 0x7
        body_8, // 0x8
        body_9, // 0x9
        body_10, // 0xa
        body_11, // 0xb
        body_12, // 0xc
        body_13, // 0xd
        body_14, // 0xe
        body_15, // 0xf
        body_16, // 0x10
        body_17, // 0x11
        body_18, // 0x12
        body_19, // 0x13
        body_20, // 0x14
        body_21, // 0x15
        body_22, // 0x16
        body_23, // 0x17
        body_24, // 0x18
        body_25, // 0x19
        body_26, // 0x1a
        body_27, // 0x1b
        body_28, // 0x1c
        body_29, // 0x1d
        body_30, // 0x1e
        body_31, // 0x1f
        body_32, // 0x20
        body_33, // 0x21
        body_34, // 0x22
        body_35, // 0x23
        body_36, // 0x24
        body_37, // 0x25
        body_38, // 0x26
        body_39, // 0x27
        body_40, // 0x28
        body_41, // 0x29
        body_42, // 0x2a
        body_43, // 0x2b
        body_44, // 0x2c
        body_45, // 0x2d
        body_46, // 0x2e
        body_47, // 0x2f
        body_48, // 0x30
        body_49, // 0x31
        body_50, // 0x32
        body_51, // 0x33
        body_52, // 0x34
        body_53, // 0x35
        body_54, // 0x36
        body_55, // 0x37
        body_56, // 0x38
        body_57, // 0x39
        body_58, // 0x3a
        body_59, // 0x3b
        body_60, // 0x3c
        body_61, // 0x3d
        body_62, // 0x3e
        body_63, // 0x3f
        body_64, // 0x40
        body_65, // 0x41
        body_66, // 0x42
        body_67, // 0x43
        body_68, // 0x44
        body_69, // 0x45
        body_70, // 0x46
        body_71, // 0x47
        body_72, // 0x48
        body_73, // 0x49
        body_74, // 0x4a
        body_75, // 0x4b
        body_76, // 0x4c
        body_77, // 0x4d
        body_78, // 0x4e
        body_79, // 0x4f
        body_80, // 0x50
        body_81, // 0x51
        body_82, // 0x52
        body_83, // 0x53
        body_84, // 0x54
        body_85, // 0x55
        body_86, // 0x56
        body_87, // 0x57
        body_88, // 0x58
        body_89, // 0x59
        body_90, // 0x5a
        body_91, // 0x5b
        body_92, // 0x5c
        body_93, // 0x5d
        body_94, // 0x5e
        body_95, // 0x5f
        body_96, // 0x60
        body_97, // 0x61
        body_98, // 0x62
        body_99, // 0x63
        body_100, // 0x64
        body_101, // 0x65
        body_102, // 0x66
        body_103, // 0x67
        body_104, // 0x68
        body_105, // 0x69
        body_106, // 0x6a
        body_107, // 0x6b
        body_108, // 0x6c
        body_109, // 0x6d
        body_110, // 0x6e
        body_111, // 0x6f
        body_112, // 0x70
        body_113, // 0x71
        body_114, // 0x72
        body_115, // 0x73
        body_116, // 0x74
        body_117, // 0x75
        body_118, // 0x76
        body_119, // 0x77
        body_120, // 0x78
        body_121, // 0x79
        body_122, // 0x7a
        body_123, // 0x7b
        body_124, // 0x7c
        body_125, // 0x7d
        body_126, // 0x7e
        body_127, // 0x7f
        body_128, // 0x80
        body_129, // 0x81
        body_130, // 0x82
        body_131, // 0x83
        body_132, // 0x84
        body_133, // 0x85
        body_134, // 0x86
        body_135, // 0x87
        body_136, // 0x88
        body_137, // 0x89
        body_138, // 0x8a
        body_139, // 0x8b
        body_140, // 0x8c
        body_141, // 0x8d
        body_142, // 0x8e
        body_143, // 0x8f
        body_144, // 0x90
        body_145, // 0x91
        body_146, // 0x92
        body_147, // 0x93
        body_148, // 0x94
        body_149, // 0x95
        body_150, // 0x96
        body_151, // 0x97
        body_152, // 0x98
        body_153, // 0x99
        body_154, // 0x9a
        body_155, // 0x9b
        body_156, // 0x9c
        body_157, // 0x9d
        body_158, // 0x9e
        body_159, // 0x9f
        body_160, // 0xa0
        body_161, // 0xa1
        body_162, // 0xa2
        body_163, // 0xa3
        body_164, // 0xa4
        body_165, // 0xa5
        body_166, // 0xa6
        body_167, // 0xa7
        body_168, // 0xa8
        body_169, // 0xa9
        body_170, // 0xaa
        body_171, // 0xab
        body_172, // 0xac
        body_173, // 0xad
        body_174, // 0xae
        body_175, // 0xaf
        body_176, // 0xb0
        body_177, // 0xb1
        body_178, // 0xb2
        body_179, // 0xb3
        body_180, // 0xb4
        body_181, // 0xb5
        body_182, // 0xb6
        body_183, // 0xb7
        body_184, // 0xb8
        body_185, // 0xb9
        body_186, // 0xba
        body_187, // 0xbb
        body_188, // 0xbc
        body_189, // 0xbd
        body_190, // 0xbe
        body_191, // 0xbf
        body_192, // 0xc0
        body_193, // 0xc1
        body_194, // 0xc2
        body_195, // 0xc3
        body_196, // 0xc4
        body_197, // 0xc5
        body_198, // 0xc6
        body_199, // 0xc7
        body_200, // 0xc8
        body_201, // 0xc9
        body_202, // 0xca
        body_203, // 0xcb
        body_204, // 0xcc
        body_205, // 0xcd
        body_206, // 0xce
        body_207, // 0xcf
        body_208, // 0xd0
        body_209, // 0xd1
        body_210, // 0xd2
        body_211, // 0xd3
        body_212, // 0xd4
        body_213, // 0xd5
        body_214, // 0xd6
        body_215, // 0xd7
        body_216, // 0xd8
        body_217, // 0xd9
        body_218, // 0xda
        body_219, // 0xdb
        body_220, // 0xdc
        body_221, // 0xdd
        body_222, // 0xde
        body_223, // 0xdf
        body_224, // 0xe0
        body_225, // 0xe1
        body_226, // 0xe2
        body_227, // 0xe3
        body_228, // 0xe4
        body_229, // 0xe5
        body_230, // 0xe6
        body_231, // 0xe7
        body_232, // 0xe8
        body_233, // 0xe9
        body_234, // 0xea
        body_235, // 0xeb
        body_236, // 0xec
        body_237, // 0xed
        body_238, // 0xee
        body_239, // 0xef
        body_240, // 0xf0
        body_241, // 0xf1
        body_242, // 0xf2
        body_243, // 0xf3
        body_244, // 0xf4
        body_245, // 0xf5
        body_246, // 0xf6
        body_247, // 0xf7
        body_248, // 0xf8
        body_249, // 0xf9
        body_250, // 0xfa
        body_251, // 0xfb
        body_252, // 0xfc
        body_253, // 0xfd
        body_254, // 0xfe
        body_255, // 0xff
        body_256, // 0x100
        body_257, // 0x101
        body_258, // 0x102
        body_259, // 0x103
        body_260, // 0x104
        body_261, // 0x105
        body_262, // 0x106
        body_263, // 0x107
        body_264, // 0x108
        body_265, // 0x109
        body_266, // 0x10a
        body_267, // 0x10b
        body_268, // 0x10c
        body_269, // 0x10d
        body_270, // 0x10e
        body_271, // 0x10f
        body_272, // 0x110
        body_273, // 0x111
        body_274, // 0x112
        body_275, // 0x113
        body_276, // 0x114
        body_277, // 0x115
        body_278, // 0x116
        body_279, // 0x117
        body_280, // 0x118
        body_281, // 0x119
        body_282, // 0x11a
        body_283, // 0x11b
        body_284, // 0x11c
        body_285, // 0x11d
        body_286, // 0x11e
        body_287, // 0x11f
        body_288, // 0x120
        body_289, // 0x121
        body_290, // 0x122
        body_291, // 0x123
        body_292, // 0x124
        body_293, // 0x125
        body_294, // 0x126
        body_295, // 0x127
        body_296, // 0x128
        body_297, // 0x129
        body_298, // 0x12a
        body_299 // 0x12b
    };

    // idx 0x8 members: 0x15 type: 5
    enum Gesture {
        ui_gesture_thumbs_up, // 0x0
        ui_gesture_chest_beat, // 0x1
        ui_gesture_come, // 0x2
        ui_gesture_crush, // 0x3
        ui_gesture_devil_horns, // 0x4
        ui_gesture_doubletime, // 0x5
        ui_gesture_eyes_on_you, // 0x6
        ui_gesture_hang_loose, // 0x7
        ui_gesture_hold, // 0x8
        ui_gesture_kill, // 0x9
        ui_gesture_lights_off, // 0xa
        ui_gesture_lights_on, // 0xb
        ui_gesture_live, // 0xc
        ui_gesture_rally_up, // 0xd
        ui_gesture_salute, // 0xe
        ui_gesture_sniper, // 0xf
        ui_gesture_thank_you, // 0x10
        ui_gesture_thumbs_down, // 0x11
        ui_gesture_watch_interact, // 0x12
        ui_gesture_watch_shake, // 0x13
        ui_gesture_west_side // 0x14
    };

    // idx 0x9 members: 0x190 type: 5
    enum HeadCustomization {
        head_none, // 0x0
        head_1, // 0x1
        head_2, // 0x2
        head_3, // 0x3
        head_4, // 0x4
        head_5, // 0x5
        head_6, // 0x6
        head_7, // 0x7
        head_8, // 0x8
        head_9, // 0x9
        head_10, // 0xa
        head_11, // 0xb
        head_12, // 0xc
        head_13, // 0xd
        head_14, // 0xe
        head_15, // 0xf
        head_16, // 0x10
        head_17, // 0x11
        head_18, // 0x12
        head_19, // 0x13
        head_20, // 0x14
        head_21, // 0x15
        head_22, // 0x16
        head_23, // 0x17
        head_24, // 0x18
        head_25, // 0x19
        head_26, // 0x1a
        head_27, // 0x1b
        head_28, // 0x1c
        head_29, // 0x1d
        head_30, // 0x1e
        head_31, // 0x1f
        head_32, // 0x20
        head_33, // 0x21
        head_34, // 0x22
        head_35, // 0x23
        head_36, // 0x24
        head_37, // 0x25
        head_38, // 0x26
        head_39, // 0x27
        head_40, // 0x28
        head_41, // 0x29
        head_42, // 0x2a
        head_43, // 0x2b
        head_44, // 0x2c
        head_45, // 0x2d
        head_46, // 0x2e
        head_47, // 0x2f
        head_48, // 0x30
        head_49, // 0x31
        head_50, // 0x32
        head_51, // 0x33
        head_52, // 0x34
        head_53, // 0x35
        head_54, // 0x36
        head_55, // 0x37
        head_56, // 0x38
        head_57, // 0x39
        head_58, // 0x3a
        head_59, // 0x3b
        head_60, // 0x3c
        head_61, // 0x3d
        head_62, // 0x3e
        head_63, // 0x3f
        head_64, // 0x40
        head_65, // 0x41
        head_66, // 0x42
        head_67, // 0x43
        head_68, // 0x44
        head_69, // 0x45
        head_70, // 0x46
        head_71, // 0x47
        head_72, // 0x48
        head_73, // 0x49
        head_74, // 0x4a
        head_75, // 0x4b
        head_76, // 0x4c
        head_77, // 0x4d
        head_78, // 0x4e
        head_79, // 0x4f
        head_80, // 0x50
        head_81, // 0x51
        head_82, // 0x52
        head_83, // 0x53
        head_84, // 0x54
        head_85, // 0x55
        head_86, // 0x56
        head_87, // 0x57
        head_88, // 0x58
        head_89, // 0x59
        head_90, // 0x5a
        head_91, // 0x5b
        head_92, // 0x5c
        head_93, // 0x5d
        head_94, // 0x5e
        head_95, // 0x5f
        head_96, // 0x60
        head_97, // 0x61
        head_98, // 0x62
        head_99, // 0x63
        head_100, // 0x64
        head_101, // 0x65
        head_102, // 0x66
        head_103, // 0x67
        head_104, // 0x68
        head_105, // 0x69
        head_106, // 0x6a
        head_107, // 0x6b
        head_108, // 0x6c
        head_109, // 0x6d
        head_110, // 0x6e
        head_111, // 0x6f
        head_112, // 0x70
        head_113, // 0x71
        head_114, // 0x72
        head_115, // 0x73
        head_116, // 0x74
        head_117, // 0x75
        head_118, // 0x76
        head_119, // 0x77
        head_120, // 0x78
        head_121, // 0x79
        head_122, // 0x7a
        head_123, // 0x7b
        head_124, // 0x7c
        head_125, // 0x7d
        head_126, // 0x7e
        head_127, // 0x7f
        head_128, // 0x80
        head_129, // 0x81
        head_130, // 0x82
        head_131, // 0x83
        head_132, // 0x84
        head_133, // 0x85
        head_134, // 0x86
        head_135, // 0x87
        head_136, // 0x88
        head_137, // 0x89
        head_138, // 0x8a
        head_139, // 0x8b
        head_140, // 0x8c
        head_141, // 0x8d
        head_142, // 0x8e
        head_143, // 0x8f
        head_144, // 0x90
        head_145, // 0x91
        head_146, // 0x92
        head_147, // 0x93
        head_148, // 0x94
        head_149, // 0x95
        head_150, // 0x96
        head_151, // 0x97
        head_152, // 0x98
        head_153, // 0x99
        head_154, // 0x9a
        head_155, // 0x9b
        head_156, // 0x9c
        head_157, // 0x9d
        head_158, // 0x9e
        head_159, // 0x9f
        head_160, // 0xa0
        head_161, // 0xa1
        head_162, // 0xa2
        head_163, // 0xa3
        head_164, // 0xa4
        head_165, // 0xa5
        head_166, // 0xa6
        head_167, // 0xa7
        head_168, // 0xa8
        head_169, // 0xa9
        head_170, // 0xaa
        head_171, // 0xab
        head_172, // 0xac
        head_173, // 0xad
        head_174, // 0xae
        head_175, // 0xaf
        head_176, // 0xb0
        head_177, // 0xb1
        head_178, // 0xb2
        head_179, // 0xb3
        head_180, // 0xb4
        head_181, // 0xb5
        head_182, // 0xb6
        head_183, // 0xb7
        head_184, // 0xb8
        head_185, // 0xb9
        head_186, // 0xba
        head_187, // 0xbb
        head_188, // 0xbc
        head_189, // 0xbd
        head_190, // 0xbe
        head_191, // 0xbf
        head_192, // 0xc0
        head_193, // 0xc1
        head_194, // 0xc2
        head_195, // 0xc3
        head_196, // 0xc4
        head_197, // 0xc5
        head_198, // 0xc6
        head_199, // 0xc7
        head_200, // 0xc8
        head_201, // 0xc9
        head_202, // 0xca
        head_203, // 0xcb
        head_204, // 0xcc
        head_205, // 0xcd
        head_206, // 0xce
        head_207, // 0xcf
        head_208, // 0xd0
        head_209, // 0xd1
        head_210, // 0xd2
        head_211, // 0xd3
        head_212, // 0xd4
        head_213, // 0xd5
        head_214, // 0xd6
        head_215, // 0xd7
        head_216, // 0xd8
        head_217, // 0xd9
        head_218, // 0xda
        head_219, // 0xdb
        head_220, // 0xdc
        head_221, // 0xdd
        head_222, // 0xde
        head_223, // 0xdf
        head_224, // 0xe0
        head_225, // 0xe1
        head_226, // 0xe2
        head_227, // 0xe3
        head_228, // 0xe4
        head_229, // 0xe5
        head_230, // 0xe6
        head_231, // 0xe7
        head_232, // 0xe8
        head_233, // 0xe9
        head_234, // 0xea
        head_235, // 0xeb
        head_236, // 0xec
        head_237, // 0xed
        head_238, // 0xee
        head_239, // 0xef
        head_240, // 0xf0
        head_241, // 0xf1
        head_242, // 0xf2
        head_243, // 0xf3
        head_244, // 0xf4
        head_245, // 0xf5
        head_246, // 0xf6
        head_247, // 0xf7
        head_248, // 0xf8
        head_249, // 0xf9
        head_250, // 0xfa
        head_251, // 0xfb
        head_252, // 0xfc
        head_253, // 0xfd
        head_254, // 0xfe
        head_255, // 0xff
        head_256, // 0x100
        head_257, // 0x101
        head_258, // 0x102
        head_259, // 0x103
        head_260, // 0x104
        head_261, // 0x105
        head_262, // 0x106
        head_263, // 0x107
        head_264, // 0x108
        head_265, // 0x109
        head_266, // 0x10a
        head_267, // 0x10b
        head_268, // 0x10c
        head_269, // 0x10d
        head_270, // 0x10e
        head_271, // 0x10f
        head_272, // 0x110
        head_273, // 0x111
        head_274, // 0x112
        head_275, // 0x113
        head_276, // 0x114
        head_277, // 0x115
        head_278, // 0x116
        head_279, // 0x117
        head_280, // 0x118
        head_281, // 0x119
        head_282, // 0x11a
        head_283, // 0x11b
        head_284, // 0x11c
        head_285, // 0x11d
        head_286, // 0x11e
        head_287, // 0x11f
        head_288, // 0x120
        head_289, // 0x121
        head_290, // 0x122
        head_291, // 0x123
        head_292, // 0x124
        head_293, // 0x125
        head_294, // 0x126
        head_295, // 0x127
        head_296, // 0x128
        head_297, // 0x129
        head_298, // 0x12a
        head_299, // 0x12b
        head_300, // 0x12c
        head_301, // 0x12d
        head_302, // 0x12e
        head_303, // 0x12f
        head_304, // 0x130
        head_305, // 0x131
        head_306, // 0x132
        head_307, // 0x133
        head_308, // 0x134
        head_309, // 0x135
        head_310, // 0x136
        head_311, // 0x137
        head_312, // 0x138
        head_313, // 0x139
        head_314, // 0x13a
        head_315, // 0x13b
        head_316, // 0x13c
        head_317, // 0x13d
        head_318, // 0x13e
        head_319, // 0x13f
        head_320, // 0x140
        head_321, // 0x141
        head_322, // 0x142
        head_323, // 0x143
        head_324, // 0x144
        head_325, // 0x145
        head_326, // 0x146
        head_327, // 0x147
        head_328, // 0x148
        head_329, // 0x149
        head_330, // 0x14a
        head_331, // 0x14b
        head_332, // 0x14c
        head_333, // 0x14d
        head_334, // 0x14e
        head_335, // 0x14f
        head_336, // 0x150
        head_337, // 0x151
        head_338, // 0x152
        head_339, // 0x153
        head_340, // 0x154
        head_341, // 0x155
        head_342, // 0x156
        head_343, // 0x157
        head_344, // 0x158
        head_345, // 0x159
        head_346, // 0x15a
        head_347, // 0x15b
        head_348, // 0x15c
        head_349, // 0x15d
        head_350, // 0x15e
        head_351, // 0x15f
        head_352, // 0x160
        head_353, // 0x161
        head_354, // 0x162
        head_355, // 0x163
        head_356, // 0x164
        head_357, // 0x165
        head_358, // 0x166
        head_359, // 0x167
        head_360, // 0x168
        head_361, // 0x169
        head_362, // 0x16a
        head_363, // 0x16b
        head_364, // 0x16c
        head_365, // 0x16d
        head_366, // 0x16e
        head_367, // 0x16f
        head_368, // 0x170
        head_369, // 0x171
        head_370, // 0x172
        head_371, // 0x173
        head_372, // 0x174
        head_373, // 0x175
        head_374, // 0x176
        head_375, // 0x177
        head_376, // 0x178
        head_377, // 0x179
        head_378, // 0x17a
        head_379, // 0x17b
        head_380, // 0x17c
        head_381, // 0x17d
        head_382, // 0x17e
        head_383, // 0x17f
        head_384, // 0x180
        head_385, // 0x181
        head_386, // 0x182
        head_387, // 0x183
        head_388, // 0x184
        head_389, // 0x185
        head_390, // 0x186
        head_391, // 0x187
        head_392, // 0x188
        head_393, // 0x189
        head_394, // 0x18a
        head_395, // 0x18b
        head_396, // 0x18c
        head_397, // 0x18d
        head_398, // 0x18e
        head_399 // 0x18f
    };

    // idx 0xa members: 0x1 type: 5
    enum TauntCustomization {
        none // 0x0
    };

    // idx 0xb members: 0x57 type: 5
    enum Equipment {
        none, // 0x0
        equip_frag, // 0x1
        equip_semtex, // 0x2
        equip_c4, // 0x3
        equip_throwing_knife, // 0x4
        equip_claymore, // 0x5
        equip_molotov, // 0x6
        equip_thermite, // 0x7
        equip_at_mine, // 0x8
        equip_pop_rocket, // 0x9
        equip_helmet, // 0xa
        equip_flash, // 0xb
        equip_smoke, // 0xc
        equip_concussion, // 0xd
        equip_adrenaline, // 0xe
        equip_trophy, // 0xf
        equip_snapshot_grenade, // 0x10
        equip_decoy, // 0x11
        equip_tac_cover, // 0x12
        equip_emp, // 0x13
        equip_nvg, // 0x14
        equip_tac_insert, // 0x15
        equip_gas_grenade, // 0x16
        equip_hb_sensor, // 0x17
        equip_rock, // 0x18
        equip_throwing_knife_fire, // 0x19
        equip_geigercounter, // 0x1a
        equip_deployed_decoy, // 0x1b
        equip_shockstick, // 0x1c
        equip_bunkerbuster, // 0x1d
        equip_binoculars, // 0x1e
        equip_iodine_pills, // 0x1f
        equip_shuriken, // 0x20
        equip_throwstar, // 0x21
        equip_thermal_phone, // 0x22
        equip_impact_grenade, // 0x23
        equip_tracker_grenade, // 0x24
        equip_ied, // 0x25
        equip_spycam, // 0x26
        equip_proximity_alarm, // 0x27
        equip_combataxe, // 0x28
        equip_butterfly_mine, // 0x29
        equip_monkey_bomb, // 0x2a
        equip_capture_bot, // 0x2b
        equip_breacher_drone, // 0x2c
        equip_blackhole_bomb, // 0x2d
        equip_med_box, // 0x2e
        equip_thermobaric_grenade, // 0x2f
        equip_battlerage, // 0x30
        equip_comm_scrambler, // 0x31
        equip_armor_onehanded, // 0x32
        equip_recondrone, // 0x33
        equip_gas_trap_plantable, // 0x34
        equip_landmine, // 0x35
        equip_assault_pack, // 0x36
        equip_jammer, // 0x37
        equip_armory, // 0x38
        equip_evg, // 0x39
        equip_snowball, // 0x3a
        equip_pball, // 0x3b
        equip_spike_trap, // 0x3c
        equip_norepinephrine, // 0x3d
        equip_bandages, // 0x3e
        equip_pain_killers, // 0x3f
        equip_squadrage, // 0x40
        equip_tracker_mine, // 0x41
        equip_sensor_grenade, // 0x42
        equip_screamer_mine, // 0x43
        equip_mini_mortar, // 0x44
        equip_sedative_inhaler, // 0x45
        equip_spider_mine, // 0x46
        equip_cluster_grenade, // 0x47
        equip_chaff_grenade, // 0x48
        equip_mutation_mutant_vision, // 0x49
        equip_mutation_sludge_sling, // 0x4a
        equip_mutation_shield, // 0x4b
        equip_mutation_gas_cloud, // 0x4c
        equip_wounding_grenade, // 0x4d
        equip_redeploy_drone_beacon, // 0x4e
        equip_inc_dark, // 0x4f
        equip_inc_fire, // 0x50
        equip_inc_electric, // 0x51
        equip_inc_light, // 0x52
        equip_pop_candy, // 0x53
        equip_aether_blade, // 0x54
        equip_spycam_party, // 0x55
        equip_vacuum_seal_device // 0x56
    };

    // idx 0xc members: 0x49 type: 5
    enum Killstreak {
        none, // 0x0
        uav, // 0x1
        airdrop, // 0x2
        precision_airstrike, // 0x3
        directional_uav, // 0x4
        nuke, // 0x5
        bradley, // 0x6
        radar_drone_recon, // 0x7
        radar_drone_overwatch, // 0x8
        scrambler_drone_guard, // 0x9
        support_box, // 0xa
        manual_turret, // 0xb
        toma_strike, // 0xc
        multi_airstrike, // 0xd
        cruise_predator, // 0xe
        pac_sentry, // 0xf
        chopper_gunner, // 0x10
        gunship, // 0x11
        tacops_beacon_mp, // 0x12
        fuel_airstrike, // 0x13
        chopper_support, // 0x14
        juggernaut, // 0x15
        sentry_gun, // 0x16
        white_phosphorus, // 0x17
        hover_jet, // 0x18
        death_switch, // 0x19
        airdrop_multiple, // 0x1a
        nuke_select_location, // 0x1b
        ammo_drop, // 0x1c
        specialist_perk_1, // 0x1d
        specialist_perk_2, // 0x1e
        specialist_perk_3, // 0x1f
        specialist_perk_bonus, // 0x20
        assault_drone, // 0x21
        auto_drone, // 0x22
        cluster_spike, // 0x23
        airdrop_escort, // 0x24
        nuke_multi, // 0x25
        counter_uav, // 0x26
        switchblade_drone, // 0x27
        lrad, // 0x28
        remote_turret, // 0x29
        loitering_munition, // 0x2a
        juggernaut_recon, // 0x2b
        drone_swarm, // 0x2c
        ims, // 0x2d
        emp, // 0x2e
        nova_gas_bomb, // 0x2f
        static_discharge, // 0x30
        bunker_buster, // 0x31
        electric_discharge, // 0x32
        laser_charge, // 0x33
        dna_nuke, // 0x34
        reaper_drone, // 0x35
        napalm_strike, // 0x36
        missile_turret, // 0x37
        rcxd, // 0x38
        radar_ping, // 0x39
        gas_strike, // 0x3a
        hellstorm_missile, // 0x3b
        valkyrie_rocket, // 0x3c
        air_patrol, // 0x3d
        mangler_cannon, // 0x3e
        zm_minj, // 0x3f
        chopper_door_gunner, // 0x40
        tank_drone, // 0x41
        hand_cannon, // 0x42
        false_flag, // 0x43
        war_machine_launcher, // 0x44
        death_machine_gun, // 0x45
        m202_launcher, // 0x46
        combat_bow, // 0x47
        zm_minj_nocannon // 0x48
    };

    // idx 0xd members: 0x27 type: 5
    enum Munition {
        none, // 0x0
        empty1, // 0x1
        empty2, // 0x2
        empty3, // 0x3
        ammo_crate, // 0x4
        armor, // 0x5
        grenade_crate, // 0x6
        trophysystem, // 0x7
        sentry, // 0x8
        drone_strike, // 0x9
        ac130, // 0xa
        scout_drone, // 0xb
        riot_shield, // 0xc
        adrenaline, // 0xd
        deployable_cover, // 0xe
        manual_turret, // 0xf
        grenade_launcher, // 0x10
        recon_drone, // 0x11
        nvg, // 0x12
        molotov, // 0x13
        apache, // 0x14
        precision_airstrike, // 0x15
        respawn, // 0x16
        auav, // 0x17
        cluster_strike, // 0x18
        uav, // 0x19
        white_phos, // 0x1a
        hover_jet, // 0x1b
        juggernaut, // 0x1c
        cruise_missile, // 0x1d
        remote_turret, // 0x1e
        switchblade_drone, // 0x1f
        lrad, // 0x20
        loitering_munition, // 0x21
        juggernaut_recon, // 0x22
        drone_swarm, // 0x23
        ims, // 0x24
        emp, // 0x25
        dna_nuke // 0x26
    };

    // idx 0xe members: 0x133 type: c
    enum Operator {
        shadow_ar_western, // 0x0
        shadow_smg_western, // 0x1
        shadow_sg_western, // 0x2
        shadow_lg_western, // 0x3
        shadow_dmr_western, // 0x4
        bravos_sas_a_western, // 0x5
        bravos_sas_b_western, // 0x6
        bravos_sas_c_western, // 0x7
        bravos_sas_d_western, // 0x8
        default_male_t10, // 0x9
        default_female_t10, // 0xa
        fender_western, // 0xb
        kilgore_eastern, // 0xc
        gunnar_western, // 0xd
        calisto_eastern, // 0xe
        chili_western, // 0xf
        stiletto_eastern, // 0x10
        hutch_western, // 0x11
        kpop_eastern, // 0x12
        ronin_western, // 0x13
        gus_western, // 0x14
        zimo_western, // 0x15
        kleo_western, // 0x16
        nova_eastern, // 0x17
        price_western, // 0x18
        farah_western, // 0x19
        ghost_western, // 0x1a
        beta_western, // 0x1b
        milsim_western_1, // 0x1c
        milsim_western_2, // 0x1d
        milsim_western_3, // 0x1e
        milsim_western_4, // 0x1f
        milsim_eastern_1, // 0x20
        milsim_eastern_2, // 0x21
        milsim_eastern_3, // 0x22
        milsim_eastern_4, // 0x23
        soap_western, // 0x24
        oni_eastern, // 0x25
        gromsko_western, // 0x26
        reyes_western, // 0x27
        luna_western, // 0x28
        roze_eastern, // 0x29
        zero_eastern, // 0x2a
        conor_eastern, // 0x2b
        aksel_eastern, // 0x2c
        zeus_eastern, // 0x2d
        neymar_eastern, // 0x2e
        messi_western, // 0x2f
        pogba_western, // 0x30
        cdl_male_west, // 0x31
        cdl_male_east, // 0x32
        cdl_female_west, // 0x33
        cdl_female_east, // 0x34
        gaz_western, // 0x35
        klaus_western, // 0x36
        infected_western, // 0x37
        blackcell_eastern, // 0x38
        shredder_eastern, // 0x39
        alejandro_western, // 0x3a
        valeria_eastern, // 0x3b
        nickmercs_eastern, // 0x3c
        kd_western, // 0x3d
        alex_western, // 0x3e
        tim_western, // 0x3f
        nikto_eastern, // 0x40
        neotokyo_eastern, // 0x41
        heather_eastern, // 0x42
        freedom_western, // 0x43
        io_western, // 0x44
        homelander_eastern, // 0x45
        blacknoir_eastern, // 0x46
        starlight_western, // 0x47
        savage_eastern, // 0x48
        lara_western, // 0x49
        mace_eastern, // 0x4a
        snoop_western, // 0x4b
        zoltan_eastern, // 0x4c
        tetiana_eastern, // 0x4d
        nicki_eastern, // 0x4e
        arthur_western, // 0x4f
        velikan_eastern, // 0x50
        graves_eastern, // 0x51
        skeletor_eastern, // 0x52
        dune_eastern, // 0x53
        hellsing_western, // 0x54
        inarius_western, // 0x55
        lilith_eastern, // 0x56
        spawn_western, // 0x57
        ash_western, // 0x58
        cyborgvaleria_eastern, // 0x59
        jup_mp_delta, // 0x5a
        jup_mp_charlie, // 0x5b
        jup_mp_cdl_female_home, // 0x5c
        jup_mp_cdl_female_away, // 0x5d
        jup_mp_cdl_male_away, // 0x5e
        jup_mp_cdl_male_home, // 0x5f
        jup_mp_shieldmaiden, // 0x60
        jup_mp_makarov, // 0x61
        jup_mp_zulu, // 0x62
        jup_mp_whiskey, // 0x63
        jup_mp_uniform, // 0x64
        jup_mp_nolan, // 0x65
        jup_mp_laswell, // 0x66
        jup_mp_sierra, // 0x67
        jup_mp_romeo, // 0x68
        jup_mp_quebec, // 0x69
        jup_mp_papa, // 0x6a
        jup_mp_oscar, // 0x6b
        jup_mp_november, // 0x6c
        jup_mp_lima, // 0x6d
        jup_mp_juliet, // 0x6e
        jup_mp_hotel, // 0x6f
        jup_mp_echo, // 0x70
        jup_mp_golf, // 0x71
        jup_mp_tango, // 0x72
        jup_mp_alpha, // 0x73
        jup_mp_india, // 0x74
        jup_mp_bravo, // 0x75
        jup_mp_mike, // 0x76
        jup_mp_foxtrot, // 0x77
        jup_mp_kilo, // 0x78
        jup_mp_sub_maker, // 0x79
        jup_mp_maestro, // 0x7a
        jup_mp_eta, // 0x7b
        jup_mp_beta, // 0x7c
        jup_mp_gamma, // 0x7d
        jup_mp_zeta, // 0x7e
        jup_mp_ash, // 0x7f
        jup_mp_ghost, // 0x80
        jup_mp_cal, // 0x81
        jup_mp_judo, // 0x82
        jup_mp_price, // 0x83
        jup_mp_soap, // 0x84
        jup_mp_bike, // 0x85
        jup_mp_valeria, // 0x86
        jup_mp_farah, // 0x87
        jup_mp_ranked_male_wzrp, // 0x88
        jup_mp_ranked_female_wzrp, // 0x89
        jup_mp_lambda, // 0x8a
        jup_mp_kappa, // 0x8b
        jup_mp_snoop, // 0x8c
        jup_ob_warlord_disguise, // 0x8d
        jup_mp_horangi, // 0x8e
        jup_mp_summer, // 0x8f
        jup_mp_gaz, // 0x90
        jup_mp_fall, // 0x91
        jup_mp_spring, // 0x92
        jup_mp_winter, // 0x93
        jup_mp_thyme, // 0x94
        jup_mp_konig, // 0x95
        jup_mp_sage, // 0x96
        jup_mp_void, // 0x97
        jup_mp_woods, // 0x98
        jup_mp_hammer, // 0x99
        jup_mp_november_12_mutant, // 0x9a
        jup_mp_echo_17_mutant, // 0x9b
        jup_mp_mochi, // 0x9c
        jup_mp_gelato, // 0x9d
        jup_mp_caramel, // 0x9e
        jup_mp_onyx, // 0x9f
        jup_mp_gulag, // 0xa0
        jup_mp_sierra_17_mutant, // 0xa1
        jup_mp_thorn, // 0xa2
        jup_mp_fuse, // 0xa3
        jup_mp_slamfire, // 0xa4
        jup_mp_darts, // 0xa5
        jup_mp_copper, // 0xa6
        jup_mp_mithril, // 0xa7
        jup_mp_alejandro, // 0xa8
        jup_mp_ratcliff, // 0xa9
        jup_mp_clay, // 0xaa
        jup_mp_marshall, // 0xab
        mgl_aksel_eastern, // 0xac
        mgl_alejandro_western, // 0xad
        mgl_alex_western, // 0xae
        mgl_blackcell_eastern, // 0xaf
        mgl_calisto_eastern, // 0xb0
        mgl_cdl_female_east, // 0xb1
        mgl_cdl_female_west, // 0xb2
        mgl_cdl_male_east, // 0xb3
        mgl_cdl_male_west, // 0xb4
        mgl_chili_western, // 0xb5
        mgl_conor_eastern, // 0xb6
        mgl_farah_western, // 0xb7
        mgl_fender_western, // 0xb8
        mgl_freedom_western, // 0xb9
        mgl_gaz_western, // 0xba
        mgl_ghost_western, // 0xbb
        mgl_gromsko_western, // 0xbc
        mgl_gus_western, // 0xbd
        mgl_heather_eastern, // 0xbe
        mgl_hutch_western, // 0xbf
        mgl_io_western, // 0xc0
        mgl_kd_western, // 0xc1
        mgl_kilgore_eastern, // 0xc2
        mgl_klaus_western, // 0xc3
        mgl_kleo_western, // 0xc4
        mgl_kpop_eastern, // 0xc5
        mgl_luna_western, // 0xc6
        mgl_messi_western, // 0xc7
        mgl_milsim_eastern_1, // 0xc8
        mgl_milsim_western_1, // 0xc9
        mgl_neotokyo_eastern, // 0xca
        mgl_neymar_eastern, // 0xcb
        mgl_nickmercs_eastern, // 0xcc
        mgl_nikto_eastern, // 0xcd
        mgl_nova_eastern, // 0xce
        mgl_oni_eastern, // 0xcf
        mgl_pogba_western, // 0xd0
        mgl_price_western, // 0xd1
        mgl_reyes_western, // 0xd2
        mgl_ronin_western, // 0xd3
        mgl_roze_eastern, // 0xd4
        mgl_shredder_eastern, // 0xd5
        mgl_soap_western, // 0xd6
        mgl_stiletto_eastern, // 0xd7
        mgl_tim_western, // 0xd8
        mgl_valeria_eastern, // 0xd9
        mgl_zero_eastern, // 0xda
        mgl_zeus_eastern, // 0xdb
        mgl_zimo_western, // 0xdc
        t10_usa_alpha_infiltration, // 0xdd
        t10_usa_bravo_infiltration, // 0xde
        t10_usa_pl_carver, // 0xdf
        t10_ita_pl_volta, // 0xe0
        t10_rus_pl_weaver, // 0xe1
        t10_usa_pl_bailey, // 0xe2
        t10_pri_pl_yara, // 0xe3
        t10_gbr_pl_stone, // 0xe4
        t10_ger_pl_dummy, // 0xe5
        t10_gbr_pl_park, // 0xe6
        t10_usa_pl_jack_base, // 0xe7
        t10_usa_pl_jill_base, // 0xe8
        t10_zmb_pl_jill_infected, // 0xe9
        t10_zmb_pl_jack_infected, // 0xea
        t10_usa_pl_adler, // 0xeb
        t10_usa_pl_warden, // 0xec
        t10_usa_pl_jack_gray1, // 0xed
        t10_scorestreak_pl_gunship_gunner, // 0xee
        t10_scorestreak_pl_chopper_gunner, // 0xef
        t10_usa_pl_jack, // 0xf0
        t10_pak_pl_nazir, // 0xf1
        t10_usa_pl_marshall, // 0xf2
        t10_pol_pl_bayan, // 0xf3
        t10_arg_pl_alejo, // 0xf4
        t10_gbr_pl_grey, // 0xf5
        t10_usa_pl_westpoint, // 0xf6
        t10_usa_pl_caine, // 0xf7
        t10_phl_pl_maya, // 0xf8
        t10_gbr_pl_ratcliff, // 0xf9
        t10_tha_pl_niran, // 0xfa
        t10_mstr_mangler, // 0xfb
        t10_usa_pl_woods, // 0xfc
        t10_ava_pl_sev, // 0xfd
        t10_usa_pl_brimstone, // 0xfe
        t10_ury_pl_phantom, // 0xff
        t10_usa_pl_freelance, // 0x100
        t10_ury_pl_witch, // 0x101
        t10_usa_pl_cdl_home, // 0x102
        t10_usa_pl_cdl_away, // 0x103
        t10_usa_pl_redacted, // 0x104
        t10_usa_pl_oriole, // 0x105
        t10_usa_pl_buck, // 0x106
        t10_jap_pl_fang, // 0x107
        t10_usa_pl_jay, // 0x108
        t10_usa_pl_martin, // 0x109
        t10_usa_pl_flycatcher, // 0x10a
        t10_usa_pl_tomato, // 0x10b
        t10_usa_pl_cucumber, // 0x10c
        t10_ger_pl_panda, // 0x10d
        t10_jap_pl_neatherheart, // 0x10e
        t10_ury_pl_vip_east, // 0x10f
        t10_ury_pl_vip_west, // 0x110
        t10_gbr_pl_pumpkin, // 0x111
        t10_usa_pl_fall, // 0x112
        t10_usa_pl_leaf, // 0x113
        t10_usa_pl_lettuce, // 0x114
        t10_usa_pl_cabbage, // 0x115
        t10_usa_pl_john, // 0x116
        t10_usa_pl_roze, // 0x117
        t10_usa_pl_mace, // 0x118
        t10_usa_pl_hudson, // 0x119
        t10_usa_pl_doberman, // 0x11a
        t10_rus_pl_stitch, // 0x11b
        t10_usa_pl_corgi, // 0x11c
        t10_usa_pl_poodle, // 0x11d
        t10_usa_pl_shiba, // 0x11e
        t10_usa_pl_pitbull, // 0x11f
        t10_usa_pl_boar, // 0x120
        t10_usa_pl_retriever, // 0x121
        t10_usa_pl_pitbulll, // 0x122
        t10_usa_pl_chihuahua, // 0x123
        t10_usa_pl_sims, // 0x124
        t10_fra_pl_domino, // 0x125
        t10_usa_pl_milsim, // 0x126
        t10_usa_pl_chocolate, // 0x127
        t10_usa_pl_jellybean, // 0x128
        t10_usa_pl_deity, // 0x129
        t10_usa_pl_punch, // 0x12a
        t10_rus_pl_brown, // 0x12b
        t10_usa_pl_gummy, // 0x12c
        t10_usa_pl_peachring, // 0x12d
        t10_usa_pl_milk, // 0x12e
        t10_usa_pl_caramel, // 0x12f
        t10_usa_pl_dark, // 0x130
        t10_mstr_zombie_zxp, // 0x131
        t10_usa_pl_maw // 0x132
    };

    // idx 0xf members: 0x10a type: 5
    enum Perk {
        specialty_null, // 0x0
        specialty_expanded_minimap, // 0x1
        specialty_blindeye, // 0x2
        specialty_blastshield, // 0x3
        specialty_dexterity, // 0x4
        specialty_overclock, // 0x5
        specialty_boom, // 0x6
        specialty_gpsjammer, // 0x7
        specialty_ghost, // 0x8
        specialty_momentum, // 0x9
        specialty_hardline, // 0xa
        specialty_coldblooded, // 0xb
        specialty_empimmune, // 0xc
        specialty_tracker, // 0xd
        specialty_tracker_jammer, // 0xe
        specialty_scavenger, // 0xf
        specialty_scavenger_ammo_and_equipment, // 0x10
        specialty_sprintfire, // 0x11
        specialty_bullet_outline, // 0x12
        specialty_selectivehearing, // 0x13
        specialty_improvedmelee, // 0x14
        specialty_hard_shell, // 0x15
        specialty_engineer, // 0x16
        specialty_quieter, // 0x17
        specialty_bulletdamage, // 0x18
        specialty_armorvest, // 0x19
        specialty_twoprimaries, // 0x1a
        specialty_solobuddyboost, // 0x1b
        specialty_bling, // 0x1c
        specialty_underkill, // 0x1d
        specialty_third_person, // 0x1e
        specialty_bulletsuppress, // 0x1f
        specialty_ante_up, // 0x20
        specialty_flak_jacket, // 0x21
        specialty_gungho, // 0x22
        specialty_quartermaster, // 0x23
        specialty_slayer, // 0x24
        specialty_operative, // 0x25
        specialty_tactician, // 0x26
        specialty_engineer_minimap, // 0x27
        specialty_support_streaker, // 0x28
        specialty_perceptive, // 0x29
        specialty_coldblooded_and_hidden, // 0x2a
        specialty_assassin, // 0x2b
        specialty_gearhead, // 0x2c
        specialty_forwardintel, // 0x2d
        specialty_combat_medic, // 0x2e
        specialty_hand_to_hand, // 0x2f
        specialty_lightfoot, // 0x30
        specialty_damage_radar, // 0x31
        specialty_ping_enemy_after_kill, // 0x32
        specialty_allterrain, // 0x33
        specialty_perkstreaks, // 0x34
        specialty_no_killstreaks, // 0x35
        specialty_melee_without_swap, // 0x36
        specialty_extraammo, // 0x37
        specialty_fastsprintrecovery, // 0x38
        specialty_fastreload, // 0x39
        specialty_incog, // 0x3a
        specialty_detectexplosive, // 0x3b
        specialty_stun_resistance, // 0x3c
        specialty_chain_reaction, // 0x3d
        specialty_cloak_aerial, // 0x3e
        specialty_spawn_radar, // 0x3f
        specialty_thief, // 0x40
        specialty_extendedmelee, // 0x41
        specialty_meleekill, // 0x42
        specialty_afterburner, // 0x43
        specialty_paint, // 0x44
        specialty_viewkickoverride, // 0x45
        specialty_undying, // 0x46
        specialty_teleport, // 0x47
        specialty_activereload, // 0x48
        specialty_thruster, // 0x49
        specialty_sixth_sense, // 0x4a
        specialty_ai_stealth_sixth_sense, // 0x4b
        specialty_mark_targets, // 0x4c
        specialty_rush, // 0x4d
        specialty_superpack, // 0x4e
        specialty_enhanced_sixth_sense, // 0x4f
        specialty_dodge, // 0x50
        specialty_ground_pound, // 0x51
        specialty_personal_trophy, // 0x52
        specialty_regenfaster, // 0x53
        specialty_rugged_eqp, // 0x54
        specialty_gung_ho, // 0x55
        specialty_man_at_arms, // 0x56
        specialty_cloak, // 0x57
        specialty_wall_lock, // 0x58
        specialty_comexp, // 0x59
        specialty_scavenger_eqp, // 0x5a
        specialty_ftlslide, // 0x5b
        specialty_support_killstreaks, // 0x5c
        specialty_marksman, // 0x5d
        specialty_ads_awareness, // 0x5e
        specialty_rearguard, // 0x5f
        specialty_ballcarrier, // 0x60
        specialty_powercell, // 0x61
        specialty_improved_prone, // 0x62
        specialty_spawnview, // 0x63
        specialty_phaseslash, // 0x64
        specialty_phase_fall, // 0x65
        specialty_headgear, // 0x66
        specialty_disruptor_punch, // 0x67
        specialty_dodge_defense, // 0x68
        specialty_dodge_wave, // 0x69
        specialty_extra_dodge, // 0x6a
        specialty_extend_dodge, // 0x6b
        specialty_blast_suppressor, // 0x6c
        specialty_hover, // 0x6d
        specialty_spawncloak, // 0x6e
        specialty_phaseslash_rephase, // 0x6f
        specialty_battleslide_offense, // 0x70
        specialty_ground_pound_shield, // 0x71
        specialty_ground_pound_shock, // 0x72
        specialty_phase_slide, // 0x73
        specialty_tele_slide, // 0x74
        specialty_battleslide, // 0x75
        specialty_camo_elite, // 0x76
        specialty_batterypack, // 0x77
        specialty_scorestreakpack, // 0x78
        specialty_medic, // 0x79
        specialty_can_be_revived, // 0x7a
        specialty_kill_report, // 0x7b
        specialty_ads_mark_target, // 0x7c
        specialty_healer, // 0x7d
        specialty_hunter, // 0x7e
        specialty_helmet, // 0x7f
        specialty_breacher, // 0x80
        specialty_ladder, // 0x81
        specialty_revive_use_weapon, // 0x82
        specialty_regen_delay_reduced, // 0x83
        specialty_classic_laststand, // 0x84
        specialty_location_marking, // 0x85
        specialty_remote_defuse, // 0x86
        specialty_faster_field_upgrade, // 0x87
        specialty_improved_target_mark, // 0x88
        specialty_door_breach, // 0x89
        specialty_door_sense, // 0x8a
        specialty_strategist, // 0x8b
        specialty_munitions_2, // 0x8c
        specialty_surveillance, // 0x8d
        specialty_guerrilla, // 0x8e
        specialty_tune_up, // 0x8f
        specialty_restock, // 0x90
        specialty_hustle, // 0x91
        specialty_tactical_recon, // 0x92
        specialty_tac_resist, // 0x93
        specialty_heavy_metal, // 0x94
        specialty_scavenger_plus, // 0x95
        specialty_extra_shrapnel, // 0x96
        specialty_covert_ops, // 0x97
        specialty_eod, // 0x98
        specialty_huntmaster, // 0x99
        specialty_graverobber, // 0x9a
        specialty_mercenary, // 0x9b
        specialty_warhead, // 0x9c
        specialty_sonar, // 0x9d
        specialty_quick_fix, // 0x9e
        specialty_headhunter, // 0x9f
        specialty_armored, // 0xa0
        specialty_overcharge_field_upgrade, // 0xa1
        specialty_survivor, // 0xa2
        specialty_overwatch, // 0xa3
        specialty_grenade_expert, // 0xa4
        specialty_focus, // 0xa5
        specialty_extra_tactical, // 0xa6
        specialty_pc_medic, // 0xa7
        specialty_pc_comms, // 0xa8
        specialty_pc_stealth, // 0xa9
        specialty_pc_tempered, // 0xaa
        specialty_hijacked_iff_strobe, // 0xab
        specialty_acoustic_sensor, // 0xac
        specialty_tac_mask, // 0xad
        specialty_fast_hands, // 0xae
        specialty_lr_detector, // 0xaf
        specialty_signal_jammer, // 0xb0
        specialty_monomer_plate, // 0xb1
        specialty_thermal_camo, // 0xb2
        specialty_elasomer_pads, // 0xb3
        specialty_dex_gloves, // 0xb4
        specialty_tac_gloves, // 0xb5
        specialty_canvas_sneakers, // 0xb6
        specialty_maritime_boots, // 0xb7
        specialty_blacklight_flashlight, // 0xb8
        specialty_ultra_light_boots, // 0xb9
        specialty_high_gain_antenna, // 0xba
        specialty_silicon_gloves, // 0xbb
        specialty_impact_res_gloves, // 0xbc
        specialty_custom_gloves, // 0xbd
        specialty_nods, // 0xbe
        specialty_taccom_system, // 0xbf
        specialty_bone_conduction, // 0xc0
        specialty_intel_jacker, // 0xc1
        specialty_radio_intercept, // 0xc2
        specialty_flame_res_insulation, // 0xc3
        specialty_shielded_carrier, // 0xc4
        specialty_suspension_pads, // 0xc5
        specialty_assault_gloves, // 0xc6
        specialty_tac_pads, // 0xc7
        specialty_running_sneakers, // 0xc8
        specialty_treadless_boots, // 0xc9
        specialty_eod_vest, // 0xca
        specialty_compression_carrier_vest, // 0xcb
        specialty_ghost_camo, // 0xcc
        specialty_compression_carrier, // 0xcd
        specialty_compression_plate, // 0xce
        specialty_rhino_rig, // 0xcf
        specialty_lightweight_vest, // 0xd0
        specialty_shielded_electronics, // 0xd1
        specialty_thermal_insulation, // 0xd2
        specialty_extra_plate, // 0xd3
        specialty_fast_armor, // 0xd4
        specialty_armor_regen, // 0xd5
        specialty_aegis_vest, // 0xd6
        specialty_cct_vest, // 0xd7
        specialty_marksman_gloves, // 0xd8
        specialty_stalker_boots, // 0xd9
        specialty_infantry_vest, // 0xda
        specialty_grenadier_vest, // 0xdb
        specialty_scout_vest, // 0xdc
        specialty_overkill_vest, // 0xdd
        specialty_tac_vest, // 0xde
        specialty_gunner_vest, // 0xdf
        specialty_fast_reload, // 0xe0
        specialty_ninja_vest, // 0xe1
        specialty_dauntless_boots, // 0xe2
        specialty_pistol_vest, // 0xe3
        specialty_ninja_gloves, // 0xe4
        specialty_vendetta, // 0xe5
        specialty_adrenaline, // 0xe6
        specialty_outlander, // 0xe7
        specialty_shroud, // 0xe8
        specialty_combat_scout, // 0xe9
        specialty_mechanic, // 0xea
        specialty_contract_payout, // 0xeb
        specialty_lightweight_br, // 0xec
        specialty_restock_br, // 0xed
        specialty_shrapnel_br, // 0xee
        specialty_treadless_boots_br, // 0xef
        specialty_tac_pads_br, // 0xf0
        specialty_tac_resist_br, // 0xf1
        specialty_silicon_gloves_br, // 0xf2
        specialty_scavenger_br, // 0xf3
        specialty_survivor_br, // 0xf4
        specialty_tempered_br, // 0xf5
        specialty_mutation_gas_cloud, // 0xf6
        specialty_self_tracked, // 0xf7
        specialty_grenadier, // 0xf8
        specialty_veteran, // 0xf9
        specialty_flex, // 0xfa
        specialty_bomb_squad, // 0xfb
        specialty_cold_blooded, // 0xfc
        specialty_combat_tracker, // 0xfd
        specialty_resolute, // 0xfe
        specialty_tempered, // 0xff
        specialty_specialist, // 0x100
        specialty_athletics, // 0x101
        specialty_alertness, // 0x102
        specialty_zombie_vision, // 0x103
        specialty_zombie_legs, // 0x104
        specialty_double_points, // 0x105
        specialty_speed_boost, // 0x106
        specialty_reactive_armor, // 0x107
        specialty_mountaineer, // 0x108
        specialty_low_profile // 0x109
    };

    // idx 0x10 members: 0x4 type: 5
    enum LoadoutPerkBonusType {
        specialty_null, // 0x0
        specialty_slayer, // 0x1
        specialty_operative, // 0x2
        specialty_tactician // 0x3
    };

    // idx 0x11 members: 0x52 type: 5
    enum Power {
        none, // 0x0
        power_mobileRadar, // 0x1
        power_sensorGrenade, // 0x2
        power_bioSpike, // 0x3
        power_gasGrenade, // 0x4
        power_blinkKnife, // 0x5
        power_clusterGrenade, // 0x6
        power_siegeMode, // 0x7
        power_playerTrophySystem, // 0x8
        power_bulletstorm, // 0x9
        power_stickyBomb, // 0xa
        power_proxyBomb, // 0xb
        power_bouncingBetty, // 0xc
        power_smokeGrenade, // 0xd
        power_blackoutGrenade, // 0xe
        power_lifeLink, // 0xf
        power_dash, // 0x10
        power_opticWave, // 0x11
        power_periphVis, // 0x12
        power_phaseSplit, // 0x13
        power_discMarker, // 0x14
        power_caseBomb, // 0x15
        power_adrenalineMist, // 0x16
        power_engineerDrone, // 0x17
        power_semtex, // 0x18
        power_overCharge, // 0x19
        power_thermobaric, // 0x1a
        power_domeshield, // 0x1b
        power_smokeWall, // 0x1c
        power_blackholeGrenade, // 0x1d
        power_speedStrip, // 0x1e
        power_comlink, // 0x1f
        power_sonicPulse, // 0x20
        power_empGrenade, // 0x21
        power_shardBall, // 0x22
        power_splashGrenade, // 0x23
        power_forcePush, // 0x24
        power_c4, // 0x25
        power_teleReap, // 0x26
        power_throwingReap, // 0x27
        power_portalGenerator, // 0x28
        power_transponder, // 0x29
        power_blackholeWarpGrenade, // 0x2a
        power_sonicSensor, // 0x2b
        power_headgear, // 0x2c
        power_barrier, // 0x2d
        power_battery, // 0x2e
        power_mortarMount, // 0x2f
        power_stickyMine, // 0x30
        power_tripMine, // 0x31
        power_adrenaline, // 0x32
        power_multiVisor, // 0x33
        power_trophy, // 0x34
        power_stealthMode, // 0x35
        power_disruptor, // 0x36
        power_pulseGrenade, // 0x37
        power_niagara, // 0x38
        power_siphonKnife, // 0x39
        power_arcGrenade, // 0x3a
        power_ammoBox, // 0x3b
        power_portalGrenade, // 0x3c
        power_virusGrenade, // 0x3d
        power_fearGrenade, // 0x3e
        power_distortionField, // 0x3f
        power_attackDrone, // 0x40
        power_frag, // 0x41
        power_cryoMine, // 0x42
        power_wristRocket, // 0x43
        power_explodingDrone, // 0x44
        power_claymore, // 0x45
        power_coneFlash, // 0x46
        power_blackhat, // 0x47
        power_deployableCover, // 0x48
        power_spiderGrenade, // 0x49
        power_hackKnife, // 0x4a
        power_concussionGrenade, // 0x4b
        power_splitGrenade, // 0x4c
        power_implosionGrenade, // 0x4d
        power_throwingKnife, // 0x4e
        power_tacInsert, // 0x4f
        power_flash, // 0x50
        power_helmet // 0x51
    };

    // idx 0x12 members: 0x44f type: 5
    enum Reticle {
        none, // 0x0
        ret01, // 0x1
        ret02, // 0x2
        ret03, // 0x3
        ret04, // 0x4
        ret05, // 0x5
        ret06, // 0x6
        ret07, // 0x7
        ret08, // 0x8
        ret09, // 0x9
        ret10, // 0xa
        ret11, // 0xb
        ret12, // 0xc
        ret13, // 0xd
        ret14, // 0xe
        ret15, // 0xf
        ret16, // 0x10
        ret17, // 0x11
        ret18, // 0x12
        ret19, // 0x13
        ret20, // 0x14
        ret21, // 0x15
        ret22, // 0x16
        ret23, // 0x17
        ret24, // 0x18
        ret25, // 0x19
        ret26, // 0x1a
        ret27, // 0x1b
        ret28, // 0x1c
        ret29, // 0x1d
        ret30, // 0x1e
        ret31, // 0x1f
        ret32, // 0x20
        ret33, // 0x21
        ret34, // 0x22
        ret35, // 0x23
        ret36, // 0x24
        ret37, // 0x25
        ret38, // 0x26
        ret39, // 0x27
        ret40, // 0x28
        ret41, // 0x29
        ret42, // 0x2a
        ret43, // 0x2b
        ret44, // 0x2c
        ret45, // 0x2d
        ret46, // 0x2e
        ret47, // 0x2f
        ret48, // 0x30
        ret49, // 0x31
        ret50, // 0x32
        retsnpr01, // 0x33
        retsnpr02, // 0x34
        retsnpr03, // 0x35
        retsnpr04, // 0x36
        retsnpr05, // 0x37
        retsnpr06, // 0x38
        retsnpr07, // 0x39
        retsnpr08, // 0x3a
        retsnpr09, // 0x3b
        retsnpr10, // 0x3c
        retsnpr11, // 0x3d
        retsnpr12, // 0x3e
        retsnpr13, // 0x3f
        retsnpr14, // 0x40
        retsnpr15, // 0x41
        retsnpr16, // 0x42
        retsnpr17, // 0x43
        retsnpr18, // 0x44
        retsnpr19, // 0x45
        retsnpr20, // 0x46
        retsnpr21, // 0x47
        retsnpr22, // 0x48
        retsnpr23, // 0x49
        retsnpr24, // 0x4a
        retsnpr25, // 0x4b
        retsnpr26, // 0x4c
        retsnpr27, // 0x4d
        retsnpr28, // 0x4e
        retsnpr29, // 0x4f
        retsnpr30, // 0x50
        retsnpr31, // 0x51
        retsnpr32, // 0x52
        retsnpr33, // 0x53
        retsnpr34, // 0x54
        retsnpr35, // 0x55
        retsnpr36, // 0x56
        retsnpr37, // 0x57
        retsnpr38, // 0x58
        retsnpr39, // 0x59
        retsnpr40, // 0x5a
        acogdef, // 0x5b
        cer_reticle_dualzoom, // 0x5c
        cer_reticle_dualzoom_01_mp, // 0x5d
        cer_reticle_dualzoom_01_wz, // 0x5e
        cer_reticle_dualzoom_01_zm, // 0x5f
        cer_reticle_dualzoom_02_mp, // 0x60
        cer_reticle_dualzoom_02_wz, // 0x61
        cer_reticle_dualzoom_02_zm, // 0x62
        cer_reticle_dualzoom_03_mp, // 0x63
        cer_reticle_dualzoom_03_wz, // 0x64
        cer_reticle_dualzoom_03_zm, // 0x65
        cer_reticle_dualzoom_04_mp, // 0x66
        cer_reticle_dualzoom_04_wz, // 0x67
        cer_reticle_dualzoom_04_zm, // 0x68
        cer_reticle_dualzoom_05_mp, // 0x69
        cer_reticle_dualzoom_05_wz, // 0x6a
        cer_reticle_dualzoom_05_zm, // 0x6b
        cer_reticle_fourx01, // 0x6c
        cer_reticle_fourx01_01_mp, // 0x6d
        cer_reticle_fourx01_01_wz, // 0x6e
        cer_reticle_fourx01_01_zm, // 0x6f
        cer_reticle_fourx01_02_mp, // 0x70
        cer_reticle_fourx01_02_wz, // 0x71
        cer_reticle_fourx01_02_zm, // 0x72
        cer_reticle_fourx01_03_mp, // 0x73
        cer_reticle_fourx01_03_wz, // 0x74
        cer_reticle_fourx01_03_zm, // 0x75
        cer_reticle_fourx01_04_mp, // 0x76
        cer_reticle_fourx01_04_wz, // 0x77
        cer_reticle_fourx01_04_zm, // 0x78
        cer_reticle_fourx01_05_mp, // 0x79
        cer_reticle_fourx01_05_wz, // 0x7a
        cer_reticle_fourx01_05_zm, // 0x7b
        cer_reticle_fourx01_06_mp, // 0x7c
        cer_reticle_fourx01_06_wz, // 0x7d
        cer_reticle_fourx01_06_zm, // 0x7e
        cer_reticle_fourx01_07_mp, // 0x7f
        cer_reticle_fourx01_07_wz, // 0x80
        cer_reticle_fourx01_07_zm, // 0x81
        cer_reticle_fourx01_08_mp, // 0x82
        cer_reticle_fourx01_08_wz, // 0x83
        cer_reticle_fourx01_08_zm, // 0x84
        cer_reticle_fourx01_09_mp, // 0x85
        cer_reticle_fourx01_09_wz, // 0x86
        cer_reticle_fourx01_09_zm, // 0x87
        cer_reticle_fourx01_10_mp, // 0x88
        cer_reticle_fourx01_10_wz, // 0x89
        cer_reticle_fourx01_10_zm, // 0x8a
        cer_reticle_fourx02, // 0x8b
        cer_reticle_fourx02_01_mp, // 0x8c
        cer_reticle_fourx02_01_wz, // 0x8d
        cer_reticle_fourx02_01_zm, // 0x8e
        cer_reticle_fourx02_02_mp, // 0x8f
        cer_reticle_fourx02_02_wz, // 0x90
        cer_reticle_fourx02_02_zm, // 0x91
        cer_reticle_fourx02_03_mp, // 0x92
        cer_reticle_fourx02_03_wz, // 0x93
        cer_reticle_fourx02_03_zm, // 0x94
        cer_reticle_fourx02_04_mp, // 0x95
        cer_reticle_fourx02_04_wz, // 0x96
        cer_reticle_fourx02_04_zm, // 0x97
        cer_reticle_fourx02_05_mp, // 0x98
        cer_reticle_fourx02_05_wz, // 0x99
        cer_reticle_fourx02_05_zm, // 0x9a
        cer_reticle_fourx02_06_mp, // 0x9b
        cer_reticle_fourx02_06_wz, // 0x9c
        cer_reticle_fourx02_06_zm, // 0x9d
        cer_reticle_fourx02_07_mp, // 0x9e
        cer_reticle_fourx02_07_wz, // 0x9f
        cer_reticle_fourx02_07_zm, // 0xa0
        cer_reticle_fourx02_08_mp, // 0xa1
        cer_reticle_fourx02_08_wz, // 0xa2
        cer_reticle_fourx02_08_zm, // 0xa3
        cer_reticle_fourx02_09_mp, // 0xa4
        cer_reticle_fourx02_09_wz, // 0xa5
        cer_reticle_fourx02_09_zm, // 0xa6
        cer_reticle_fourx02_10_mp, // 0xa7
        cer_reticle_fourx02_10_wz, // 0xa8
        cer_reticle_fourx02_10_zm, // 0xa9
        cer_reticle_holo01, // 0xaa
        cer_reticle_holo01_01_mp, // 0xab
        cer_reticle_holo01_01_wz, // 0xac
        cer_reticle_holo01_01_zm, // 0xad
        cer_reticle_holo01_02_mp, // 0xae
        cer_reticle_holo01_02_wz, // 0xaf
        cer_reticle_holo01_02_zm, // 0xb0
        cer_reticle_holo01_03_mp, // 0xb1
        cer_reticle_holo01_03_wz, // 0xb2
        cer_reticle_holo01_03_zm, // 0xb3
        cer_reticle_holo01_04_mp, // 0xb4
        cer_reticle_holo01_04_wz, // 0xb5
        cer_reticle_holo01_04_zm, // 0xb6
        cer_reticle_holo01_05_mp, // 0xb7
        cer_reticle_holo01_05_wz, // 0xb8
        cer_reticle_holo01_05_zm, // 0xb9
        cer_reticle_holo01_06_mp, // 0xba
        cer_reticle_holo01_06_wz, // 0xbb
        cer_reticle_holo01_06_zm, // 0xbc
        cer_reticle_holo01_07_mp, // 0xbd
        cer_reticle_holo01_07_wz, // 0xbe
        cer_reticle_holo01_07_zm, // 0xbf
        cer_reticle_holo01_08_mp, // 0xc0
        cer_reticle_holo01_08_wz, // 0xc1
        cer_reticle_holo01_08_zm, // 0xc2
        cer_reticle_holo01_09_mp, // 0xc3
        cer_reticle_holo01_09_wz, // 0xc4
        cer_reticle_holo01_09_zm, // 0xc5
        cer_reticle_holo01_10_mp, // 0xc6
        cer_reticle_holo01_10_wz, // 0xc7
        cer_reticle_holo01_10_zm, // 0xc8
        cer_reticle_holo02, // 0xc9
        cer_reticle_holo02_01_mp, // 0xca
        cer_reticle_holo02_01_wz, // 0xcb
        cer_reticle_holo02_01_zm, // 0xcc
        cer_reticle_holo02_02_mp, // 0xcd
        cer_reticle_holo02_02_wz, // 0xce
        cer_reticle_holo02_02_zm, // 0xcf
        cer_reticle_holo02_03_mp, // 0xd0
        cer_reticle_holo02_03_wz, // 0xd1
        cer_reticle_holo02_03_zm, // 0xd2
        cer_reticle_holo02_04_mp, // 0xd3
        cer_reticle_holo02_04_wz, // 0xd4
        cer_reticle_holo02_04_zm, // 0xd5
        cer_reticle_holo02_05_mp, // 0xd6
        cer_reticle_holo02_05_wz, // 0xd7
        cer_reticle_holo02_05_zm, // 0xd8
        cer_reticle_holo02_06_mp, // 0xd9
        cer_reticle_holo02_06_wz, // 0xda
        cer_reticle_holo02_06_zm, // 0xdb
        cer_reticle_holo02_07_mp, // 0xdc
        cer_reticle_holo02_07_wz, // 0xdd
        cer_reticle_holo02_07_zm, // 0xde
        cer_reticle_holo02_08_mp, // 0xdf
        cer_reticle_holo02_08_wz, // 0xe0
        cer_reticle_holo02_08_zm, // 0xe1
        cer_reticle_holo02_09_mp, // 0xe2
        cer_reticle_holo02_09_wz, // 0xe3
        cer_reticle_holo02_09_zm, // 0xe4
        cer_reticle_holo02_10_mp, // 0xe5
        cer_reticle_holo02_10_wz, // 0xe6
        cer_reticle_holo02_10_zm, // 0xe7
        cer_reticle_holo_range, // 0xe8
        cer_reticle_holo_range_01_mp, // 0xe9
        cer_reticle_holo_range_01_wz, // 0xea
        cer_reticle_holo_range_01_zm, // 0xeb
        cer_reticle_holo_range_02_mp, // 0xec
        cer_reticle_holo_range_02_wz, // 0xed
        cer_reticle_holo_range_02_zm, // 0xee
        cer_reticle_holo_range_03_mp, // 0xef
        cer_reticle_holo_range_03_wz, // 0xf0
        cer_reticle_holo_range_03_zm, // 0xf1
        cer_reticle_holo_range_04_mp, // 0xf2
        cer_reticle_holo_range_04_wz, // 0xf3
        cer_reticle_holo_range_04_zm, // 0xf4
        cer_reticle_holo_range_05_mp, // 0xf5
        cer_reticle_holo_range_05_wz, // 0xf6
        cer_reticle_holo_range_05_zm, // 0xf7
        cer_reticle_holo_range_06_mp, // 0xf8
        cer_reticle_holo_range_06_wz, // 0xf9
        cer_reticle_holo_range_06_zm, // 0xfa
        cer_reticle_holo_range_07_mp, // 0xfb
        cer_reticle_holo_range_07_wz, // 0xfc
        cer_reticle_holo_range_07_zm, // 0xfd
        cer_reticle_holo_range_08_mp, // 0xfe
        cer_reticle_holo_range_08_wz, // 0xff
        cer_reticle_holo_range_08_zm, // 0x100
        cer_reticle_holo_range_09_mp, // 0x101
        cer_reticle_holo_range_09_wz, // 0x102
        cer_reticle_holo_range_09_zm, // 0x103
        cer_reticle_holo_range_10_mp, // 0x104
        cer_reticle_holo_range_10_wz, // 0x105
        cer_reticle_holo_range_10_zm, // 0x106
        cer_reticle_hybrid01, // 0x107
        cer_reticle_hybrid01_01_mp, // 0x108
        cer_reticle_hybrid01_01_wz, // 0x109
        cer_reticle_hybrid01_01_zm, // 0x10a
        cer_reticle_hybrid01_02_mp, // 0x10b
        cer_reticle_hybrid01_02_wz, // 0x10c
        cer_reticle_hybrid01_02_zm, // 0x10d
        cer_reticle_hybrid01_03_mp, // 0x10e
        cer_reticle_hybrid01_03_wz, // 0x10f
        cer_reticle_hybrid01_03_zm, // 0x110
        cer_reticle_hybrid01_04_mp, // 0x111
        cer_reticle_hybrid01_04_wz, // 0x112
        cer_reticle_hybrid01_04_zm, // 0x113
        cer_reticle_hybrid01_05_mp, // 0x114
        cer_reticle_hybrid01_05_wz, // 0x115
        cer_reticle_hybrid01_05_zm, // 0x116
        cer_reticle_hybrid01_06_mp, // 0x117
        cer_reticle_hybrid01_06_wz, // 0x118
        cer_reticle_hybrid01_06_zm, // 0x119
        cer_reticle_hybrid01_07_mp, // 0x11a
        cer_reticle_hybrid01_07_wz, // 0x11b
        cer_reticle_hybrid01_07_zm, // 0x11c
        cer_reticle_hybrid01_08_mp, // 0x11d
        cer_reticle_hybrid01_08_wz, // 0x11e
        cer_reticle_hybrid01_08_zm, // 0x11f
        cer_reticle_hybrid01_09_mp, // 0x120
        cer_reticle_hybrid01_09_wz, // 0x121
        cer_reticle_hybrid01_09_zm, // 0x122
        cer_reticle_hybrid01_10_mp, // 0x123
        cer_reticle_hybrid01_10_wz, // 0x124
        cer_reticle_hybrid01_10_zm, // 0x125
        cer_reticle_hybrid02, // 0x126
        cer_reticle_hybrid02_01_mp, // 0x127
        cer_reticle_hybrid02_01_wz, // 0x128
        cer_reticle_hybrid02_01_zm, // 0x129
        cer_reticle_hybrid02_02_mp, // 0x12a
        cer_reticle_hybrid02_02_wz, // 0x12b
        cer_reticle_hybrid02_02_zm, // 0x12c
        cer_reticle_hybrid02_03_mp, // 0x12d
        cer_reticle_hybrid02_03_wz, // 0x12e
        cer_reticle_hybrid02_03_zm, // 0x12f
        cer_reticle_hybrid02_04_mp, // 0x130
        cer_reticle_hybrid02_04_wz, // 0x131
        cer_reticle_hybrid02_04_zm, // 0x132
        cer_reticle_hybrid02_05_mp, // 0x133
        cer_reticle_hybrid02_05_wz, // 0x134
        cer_reticle_hybrid02_05_zm, // 0x135
        cer_reticle_hybrid02_06_mp, // 0x136
        cer_reticle_hybrid02_06_wz, // 0x137
        cer_reticle_hybrid02_06_zm, // 0x138
        cer_reticle_hybrid02_07_mp, // 0x139
        cer_reticle_hybrid02_07_wz, // 0x13a
        cer_reticle_hybrid02_07_zm, // 0x13b
        cer_reticle_hybrid02_08_mp, // 0x13c
        cer_reticle_hybrid02_08_wz, // 0x13d
        cer_reticle_hybrid02_08_zm, // 0x13e
        cer_reticle_hybrid02_09_mp, // 0x13f
        cer_reticle_hybrid02_09_wz, // 0x140
        cer_reticle_hybrid02_09_zm, // 0x141
        cer_reticle_hybrid02_10_mp, // 0x142
        cer_reticle_hybrid02_10_wz, // 0x143
        cer_reticle_hybrid02_10_zm, // 0x144
        cer_reticle_loot_90splaid, // 0x145
        cer_reticle_loot_arsenal, // 0x146
        cer_reticle_loot_bong, // 0x147
        cer_reticle_loot_deadops, // 0x148
        cer_reticle_loot_decay, // 0x149
        cer_reticle_loot_deco, // 0x14a
        cer_reticle_loot_egaux, // 0x14b
        cer_reticle_loot_firework, // 0x14c
        cer_reticle_loot_forge, // 0x14d
        cer_reticle_loot_maskbank, // 0x14e
        cer_reticle_loot_mecha, // 0x14f
        cer_reticle_loot_occult, // 0x150
        cer_reticle_loot_pmorte, // 0x151
        cer_reticle_loot_shg01, // 0x152
        cer_reticle_loot_shrouded, // 0x153
        cer_reticle_loot_steam, // 0x154
        cer_reticle_loot_stingray01, // 0x155
        cer_reticle_loot_sweater, // 0x156
        cer_reticle_loot_templar, // 0x157
        cer_reticle_loot_unicorn, // 0x158
        cer_reticle_loot_vhunter, // 0x159
        cer_reticle_loot_zexterm, // 0x15a
        cer_reticle_microreflex01, // 0x15b
        cer_reticle_microreflex01_01_mp, // 0x15c
        cer_reticle_microreflex01_01_wz, // 0x15d
        cer_reticle_microreflex01_01_zm, // 0x15e
        cer_reticle_microreflex01_02_mp, // 0x15f
        cer_reticle_microreflex01_02_wz, // 0x160
        cer_reticle_microreflex01_02_zm, // 0x161
        cer_reticle_microreflex01_03_mp, // 0x162
        cer_reticle_microreflex01_03_wz, // 0x163
        cer_reticle_microreflex01_03_zm, // 0x164
        cer_reticle_microreflex01_04_mp, // 0x165
        cer_reticle_microreflex01_04_wz, // 0x166
        cer_reticle_microreflex01_04_zm, // 0x167
        cer_reticle_microreflex01_05_mp, // 0x168
        cer_reticle_microreflex01_05_wz, // 0x169
        cer_reticle_microreflex01_05_zm, // 0x16a
        cer_reticle_microreflex01_06_mp, // 0x16b
        cer_reticle_microreflex01_06_wz, // 0x16c
        cer_reticle_microreflex01_06_zm, // 0x16d
        cer_reticle_microreflex01_07_mp, // 0x16e
        cer_reticle_microreflex01_07_wz, // 0x16f
        cer_reticle_microreflex01_07_zm, // 0x170
        cer_reticle_microreflex01_08_mp, // 0x171
        cer_reticle_microreflex01_08_wz, // 0x172
        cer_reticle_microreflex01_08_zm, // 0x173
        cer_reticle_microreflex01_09_mp, // 0x174
        cer_reticle_microreflex01_09_wz, // 0x175
        cer_reticle_microreflex01_09_zm, // 0x176
        cer_reticle_microreflex01_10_mp, // 0x177
        cer_reticle_microreflex01_10_wz, // 0x178
        cer_reticle_microreflex01_10_zm, // 0x179
        cer_reticle_microreflex02, // 0x17a
        cer_reticle_microreflex02_01_mp, // 0x17b
        cer_reticle_microreflex02_01_wz, // 0x17c
        cer_reticle_microreflex02_01_zm, // 0x17d
        cer_reticle_microreflex02_02_mp, // 0x17e
        cer_reticle_microreflex02_02_wz, // 0x17f
        cer_reticle_microreflex02_02_zm, // 0x180
        cer_reticle_microreflex02_03_mp, // 0x181
        cer_reticle_microreflex02_03_wz, // 0x182
        cer_reticle_microreflex02_03_zm, // 0x183
        cer_reticle_microreflex02_04_mp, // 0x184
        cer_reticle_microreflex02_04_wz, // 0x185
        cer_reticle_microreflex02_04_zm, // 0x186
        cer_reticle_microreflex02_05_mp, // 0x187
        cer_reticle_microreflex02_05_wz, // 0x188
        cer_reticle_microreflex02_05_zm, // 0x189
        cer_reticle_microreflex02_06_mp, // 0x18a
        cer_reticle_microreflex02_06_wz, // 0x18b
        cer_reticle_microreflex02_06_zm, // 0x18c
        cer_reticle_microreflex02_07_mp, // 0x18d
        cer_reticle_microreflex02_07_wz, // 0x18e
        cer_reticle_microreflex02_07_zm, // 0x18f
        cer_reticle_microreflex02_08_mp, // 0x190
        cer_reticle_microreflex02_08_wz, // 0x191
        cer_reticle_microreflex02_08_zm, // 0x192
        cer_reticle_microreflex02_09_mp, // 0x193
        cer_reticle_microreflex02_09_wz, // 0x194
        cer_reticle_microreflex02_09_zm, // 0x195
        cer_reticle_microreflex02_10_mp, // 0x196
        cer_reticle_microreflex02_10_wz, // 0x197
        cer_reticle_microreflex02_10_zm, // 0x198
        cer_reticle_microreflex03, // 0x199
        cer_reticle_microreflex03_01_mp, // 0x19a
        cer_reticle_microreflex03_01_wz, // 0x19b
        cer_reticle_microreflex03_01_zm, // 0x19c
        cer_reticle_microreflex03_02_mp, // 0x19d
        cer_reticle_microreflex03_02_wz, // 0x19e
        cer_reticle_microreflex03_02_zm, // 0x19f
        cer_reticle_microreflex03_03_mp, // 0x1a0
        cer_reticle_microreflex03_03_wz, // 0x1a1
        cer_reticle_microreflex03_03_zm, // 0x1a2
        cer_reticle_microreflex03_04_mp, // 0x1a3
        cer_reticle_microreflex03_04_wz, // 0x1a4
        cer_reticle_microreflex03_04_zm, // 0x1a5
        cer_reticle_microreflex03_05_mp, // 0x1a6
        cer_reticle_microreflex03_05_wz, // 0x1a7
        cer_reticle_microreflex03_05_zm, // 0x1a8
        cer_reticle_microreflex03_06_mp, // 0x1a9
        cer_reticle_microreflex03_06_wz, // 0x1aa
        cer_reticle_microreflex03_06_zm, // 0x1ab
        cer_reticle_microreflex03_07_mp, // 0x1ac
        cer_reticle_microreflex03_07_wz, // 0x1ad
        cer_reticle_microreflex03_07_zm, // 0x1ae
        cer_reticle_microreflex03_08_mp, // 0x1af
        cer_reticle_microreflex03_08_wz, // 0x1b0
        cer_reticle_microreflex03_08_zm, // 0x1b1
        cer_reticle_microreflex03_09_mp, // 0x1b2
        cer_reticle_microreflex03_09_wz, // 0x1b3
        cer_reticle_microreflex03_09_zm, // 0x1b4
        cer_reticle_microreflex03_10_mp, // 0x1b5
        cer_reticle_microreflex03_10_wz, // 0x1b6
        cer_reticle_microreflex03_10_zm, // 0x1b7
        cer_reticle_microreflex04, // 0x1b8
        cer_reticle_microreflex04_01_mp, // 0x1b9
        cer_reticle_microreflex04_01_wz, // 0x1ba
        cer_reticle_microreflex04_01_zm, // 0x1bb
        cer_reticle_microreflex04_02_mp, // 0x1bc
        cer_reticle_microreflex04_02_wz, // 0x1bd
        cer_reticle_microreflex04_02_zm, // 0x1be
        cer_reticle_microreflex04_03_mp, // 0x1bf
        cer_reticle_microreflex04_03_wz, // 0x1c0
        cer_reticle_microreflex04_03_zm, // 0x1c1
        cer_reticle_microreflex04_04_mp, // 0x1c2
        cer_reticle_microreflex04_04_wz, // 0x1c3
        cer_reticle_microreflex04_04_zm, // 0x1c4
        cer_reticle_microreflex04_05_mp, // 0x1c5
        cer_reticle_microreflex04_05_wz, // 0x1c6
        cer_reticle_microreflex04_05_zm, // 0x1c7
        cer_reticle_microreflex04_06_mp, // 0x1c8
        cer_reticle_microreflex04_06_wz, // 0x1c9
        cer_reticle_microreflex04_06_zm, // 0x1ca
        cer_reticle_microreflex04_07_mp, // 0x1cb
        cer_reticle_microreflex04_07_wz, // 0x1cc
        cer_reticle_microreflex04_07_zm, // 0x1cd
        cer_reticle_microreflex04_08_mp, // 0x1ce
        cer_reticle_microreflex04_08_wz, // 0x1cf
        cer_reticle_microreflex04_08_zm, // 0x1d0
        cer_reticle_microreflex04_09_mp, // 0x1d1
        cer_reticle_microreflex04_09_wz, // 0x1d2
        cer_reticle_microreflex04_09_zm, // 0x1d3
        cer_reticle_microreflex04_10_mp, // 0x1d4
        cer_reticle_microreflex04_10_wz, // 0x1d5
        cer_reticle_microreflex04_10_zm, // 0x1d6
        cer_reticle_reddot01, // 0x1d7
        cer_reticle_reddot01_01_mp, // 0x1d8
        cer_reticle_reddot01_01_wz, // 0x1d9
        cer_reticle_reddot01_01_zm, // 0x1da
        cer_reticle_reddot01_02_mp, // 0x1db
        cer_reticle_reddot01_02_wz, // 0x1dc
        cer_reticle_reddot01_02_zm, // 0x1dd
        cer_reticle_reddot01_03_mp, // 0x1de
        cer_reticle_reddot01_03_wz, // 0x1df
        cer_reticle_reddot01_03_zm, // 0x1e0
        cer_reticle_reddot01_04_mp, // 0x1e1
        cer_reticle_reddot01_04_wz, // 0x1e2
        cer_reticle_reddot01_04_zm, // 0x1e3
        cer_reticle_reddot01_05_mp, // 0x1e4
        cer_reticle_reddot01_05_wz, // 0x1e5
        cer_reticle_reddot01_05_zm, // 0x1e6
        cer_reticle_reddot01_06_mp, // 0x1e7
        cer_reticle_reddot01_06_wz, // 0x1e8
        cer_reticle_reddot01_06_zm, // 0x1e9
        cer_reticle_reddot01_07_mp, // 0x1ea
        cer_reticle_reddot01_07_wz, // 0x1eb
        cer_reticle_reddot01_07_zm, // 0x1ec
        cer_reticle_reddot01_08_mp, // 0x1ed
        cer_reticle_reddot01_08_wz, // 0x1ee
        cer_reticle_reddot01_08_zm, // 0x1ef
        cer_reticle_reddot01_09_mp, // 0x1f0
        cer_reticle_reddot01_09_wz, // 0x1f1
        cer_reticle_reddot01_09_zm, // 0x1f2
        cer_reticle_reddot01_10_mp, // 0x1f3
        cer_reticle_reddot01_10_wz, // 0x1f4
        cer_reticle_reddot01_10_zm, // 0x1f5
        cer_reticle_reddot02, // 0x1f6
        cer_reticle_reddot02_01_mp, // 0x1f7
        cer_reticle_reddot02_01_wz, // 0x1f8
        cer_reticle_reddot02_01_zm, // 0x1f9
        cer_reticle_reddot02_02_mp, // 0x1fa
        cer_reticle_reddot02_02_wz, // 0x1fb
        cer_reticle_reddot02_02_zm, // 0x1fc
        cer_reticle_reddot02_03_mp, // 0x1fd
        cer_reticle_reddot02_03_wz, // 0x1fe
        cer_reticle_reddot02_03_zm, // 0x1ff
        cer_reticle_reddot02_04_mp, // 0x200
        cer_reticle_reddot02_04_wz, // 0x201
        cer_reticle_reddot02_04_zm, // 0x202
        cer_reticle_reddot02_05_mp, // 0x203
        cer_reticle_reddot02_05_wz, // 0x204
        cer_reticle_reddot02_05_zm, // 0x205
        cer_reticle_reddot02_06_mp, // 0x206
        cer_reticle_reddot02_06_wz, // 0x207
        cer_reticle_reddot02_06_zm, // 0x208
        cer_reticle_reddot02_07_mp, // 0x209
        cer_reticle_reddot02_07_wz, // 0x20a
        cer_reticle_reddot02_07_zm, // 0x20b
        cer_reticle_reddot02_08_mp, // 0x20c
        cer_reticle_reddot02_08_wz, // 0x20d
        cer_reticle_reddot02_08_zm, // 0x20e
        cer_reticle_reddot02_09_mp, // 0x20f
        cer_reticle_reddot02_09_wz, // 0x210
        cer_reticle_reddot02_09_zm, // 0x211
        cer_reticle_reddot02_10_mp, // 0x212
        cer_reticle_reddot02_10_wz, // 0x213
        cer_reticle_reddot02_10_zm, // 0x214
        cer_reticle_reddot03, // 0x215
        cer_reticle_reddot03_01_mp, // 0x216
        cer_reticle_reddot03_01_wz, // 0x217
        cer_reticle_reddot03_01_zm, // 0x218
        cer_reticle_reddot03_02_mp, // 0x219
        cer_reticle_reddot03_02_wz, // 0x21a
        cer_reticle_reddot03_02_zm, // 0x21b
        cer_reticle_reddot03_03_mp, // 0x21c
        cer_reticle_reddot03_03_wz, // 0x21d
        cer_reticle_reddot03_03_zm, // 0x21e
        cer_reticle_reddot03_04_mp, // 0x21f
        cer_reticle_reddot03_04_wz, // 0x220
        cer_reticle_reddot03_04_zm, // 0x221
        cer_reticle_reddot03_05_mp, // 0x222
        cer_reticle_reddot03_05_wz, // 0x223
        cer_reticle_reddot03_05_zm, // 0x224
        cer_reticle_reddot03_06_mp, // 0x225
        cer_reticle_reddot03_06_wz, // 0x226
        cer_reticle_reddot03_06_zm, // 0x227
        cer_reticle_reddot03_07_mp, // 0x228
        cer_reticle_reddot03_07_wz, // 0x229
        cer_reticle_reddot03_07_zm, // 0x22a
        cer_reticle_reddot03_08_mp, // 0x22b
        cer_reticle_reddot03_08_wz, // 0x22c
        cer_reticle_reddot03_08_zm, // 0x22d
        cer_reticle_reddot03_09_mp, // 0x22e
        cer_reticle_reddot03_09_wz, // 0x22f
        cer_reticle_reddot03_09_zm, // 0x230
        cer_reticle_reddot03_10_mp, // 0x231
        cer_reticle_reddot03_10_wz, // 0x232
        cer_reticle_reddot03_10_zm, // 0x233
        cer_reticle_reddot04, // 0x234
        cer_reticle_reddot04_01_mp, // 0x235
        cer_reticle_reddot04_01_wz, // 0x236
        cer_reticle_reddot04_01_zm, // 0x237
        cer_reticle_reddot04_02_mp, // 0x238
        cer_reticle_reddot04_02_wz, // 0x239
        cer_reticle_reddot04_02_zm, // 0x23a
        cer_reticle_reddot04_03_mp, // 0x23b
        cer_reticle_reddot04_03_wz, // 0x23c
        cer_reticle_reddot04_03_zm, // 0x23d
        cer_reticle_reddot04_04_mp, // 0x23e
        cer_reticle_reddot04_04_wz, // 0x23f
        cer_reticle_reddot04_04_zm, // 0x240
        cer_reticle_reddot04_05_mp, // 0x241
        cer_reticle_reddot04_05_wz, // 0x242
        cer_reticle_reddot04_05_zm, // 0x243
        cer_reticle_reddot04_06_mp, // 0x244
        cer_reticle_reddot04_06_wz, // 0x245
        cer_reticle_reddot04_06_zm, // 0x246
        cer_reticle_reddot04_07_mp, // 0x247
        cer_reticle_reddot04_07_wz, // 0x248
        cer_reticle_reddot04_07_zm, // 0x249
        cer_reticle_reddot04_08_mp, // 0x24a
        cer_reticle_reddot04_08_wz, // 0x24b
        cer_reticle_reddot04_08_zm, // 0x24c
        cer_reticle_reddot04_09_mp, // 0x24d
        cer_reticle_reddot04_09_wz, // 0x24e
        cer_reticle_reddot04_09_zm, // 0x24f
        cer_reticle_reddot04_10_mp, // 0x250
        cer_reticle_reddot04_10_wz, // 0x251
        cer_reticle_reddot04_10_zm, // 0x252
        cer_reticle_reflex01, // 0x253
        cer_reticle_reflex01_01_mp, // 0x254
        cer_reticle_reflex01_01_wz, // 0x255
        cer_reticle_reflex01_01_zm, // 0x256
        cer_reticle_reflex01_02_mp, // 0x257
        cer_reticle_reflex01_02_wz, // 0x258
        cer_reticle_reflex01_02_zm, // 0x259
        cer_reticle_reflex01_03_mp, // 0x25a
        cer_reticle_reflex01_03_wz, // 0x25b
        cer_reticle_reflex01_03_zm, // 0x25c
        cer_reticle_reflex01_04_mp, // 0x25d
        cer_reticle_reflex01_04_wz, // 0x25e
        cer_reticle_reflex01_04_zm, // 0x25f
        cer_reticle_reflex01_05_mp, // 0x260
        cer_reticle_reflex01_05_wz, // 0x261
        cer_reticle_reflex01_05_zm, // 0x262
        cer_reticle_reflex01_06_mp, // 0x263
        cer_reticle_reflex01_06_wz, // 0x264
        cer_reticle_reflex01_06_zm, // 0x265
        cer_reticle_reflex01_07_mp, // 0x266
        cer_reticle_reflex01_07_wz, // 0x267
        cer_reticle_reflex01_07_zm, // 0x268
        cer_reticle_reflex01_08_mp, // 0x269
        cer_reticle_reflex01_08_wz, // 0x26a
        cer_reticle_reflex01_08_zm, // 0x26b
        cer_reticle_reflex01_09_mp, // 0x26c
        cer_reticle_reflex01_09_wz, // 0x26d
        cer_reticle_reflex01_09_zm, // 0x26e
        cer_reticle_reflex01_10_mp, // 0x26f
        cer_reticle_reflex01_10_wz, // 0x270
        cer_reticle_reflex01_10_zm, // 0x271
        cer_reticle_reflex02, // 0x272
        cer_reticle_reflex02_01_mp, // 0x273
        cer_reticle_reflex02_01_wz, // 0x274
        cer_reticle_reflex02_01_zm, // 0x275
        cer_reticle_reflex02_02_mp, // 0x276
        cer_reticle_reflex02_02_wz, // 0x277
        cer_reticle_reflex02_02_zm, // 0x278
        cer_reticle_reflex02_03_mp, // 0x279
        cer_reticle_reflex02_03_wz, // 0x27a
        cer_reticle_reflex02_03_zm, // 0x27b
        cer_reticle_reflex02_04_mp, // 0x27c
        cer_reticle_reflex02_04_wz, // 0x27d
        cer_reticle_reflex02_04_zm, // 0x27e
        cer_reticle_reflex02_05_mp, // 0x27f
        cer_reticle_reflex02_05_wz, // 0x280
        cer_reticle_reflex02_05_zm, // 0x281
        cer_reticle_reflex02_06_mp, // 0x282
        cer_reticle_reflex02_06_wz, // 0x283
        cer_reticle_reflex02_06_zm, // 0x284
        cer_reticle_reflex02_07_mp, // 0x285
        cer_reticle_reflex02_07_wz, // 0x286
        cer_reticle_reflex02_07_zm, // 0x287
        cer_reticle_reflex02_08_mp, // 0x288
        cer_reticle_reflex02_08_wz, // 0x289
        cer_reticle_reflex02_08_zm, // 0x28a
        cer_reticle_reflex02_09_mp, // 0x28b
        cer_reticle_reflex02_09_wz, // 0x28c
        cer_reticle_reflex02_09_zm, // 0x28d
        cer_reticle_reflex02_10_mp, // 0x28e
        cer_reticle_reflex02_10_wz, // 0x28f
        cer_reticle_reflex02_10_zm, // 0x290
        cer_reticle_reflex03, // 0x291
        cer_reticle_reflex03_01_mp, // 0x292
        cer_reticle_reflex03_01_wz, // 0x293
        cer_reticle_reflex03_01_zm, // 0x294
        cer_reticle_reflex03_02_mp, // 0x295
        cer_reticle_reflex03_02_wz, // 0x296
        cer_reticle_reflex03_02_zm, // 0x297
        cer_reticle_reflex03_03_mp, // 0x298
        cer_reticle_reflex03_03_wz, // 0x299
        cer_reticle_reflex03_03_zm, // 0x29a
        cer_reticle_reflex03_04_mp, // 0x29b
        cer_reticle_reflex03_04_wz, // 0x29c
        cer_reticle_reflex03_04_zm, // 0x29d
        cer_reticle_reflex03_05_mp, // 0x29e
        cer_reticle_reflex03_05_wz, // 0x29f
        cer_reticle_reflex03_05_zm, // 0x2a0
        cer_reticle_reflex03_06_mp, // 0x2a1
        cer_reticle_reflex03_06_wz, // 0x2a2
        cer_reticle_reflex03_06_zm, // 0x2a3
        cer_reticle_reflex03_07_mp, // 0x2a4
        cer_reticle_reflex03_07_wz, // 0x2a5
        cer_reticle_reflex03_07_zm, // 0x2a6
        cer_reticle_reflex03_08_mp, // 0x2a7
        cer_reticle_reflex03_08_wz, // 0x2a8
        cer_reticle_reflex03_08_zm, // 0x2a9
        cer_reticle_reflex03_09_mp, // 0x2aa
        cer_reticle_reflex03_09_wz, // 0x2ab
        cer_reticle_reflex03_09_zm, // 0x2ac
        cer_reticle_reflex03_10_mp, // 0x2ad
        cer_reticle_reflex03_10_wz, // 0x2ae
        cer_reticle_reflex03_10_zm, // 0x2af
        cer_reticle_reflex04, // 0x2b0
        cer_reticle_reflex04_01_mp, // 0x2b1
        cer_reticle_reflex04_01_wz, // 0x2b2
        cer_reticle_reflex04_01_zm, // 0x2b3
        cer_reticle_reflex04_02_mp, // 0x2b4
        cer_reticle_reflex04_02_wz, // 0x2b5
        cer_reticle_reflex04_02_zm, // 0x2b6
        cer_reticle_reflex04_03_mp, // 0x2b7
        cer_reticle_reflex04_03_wz, // 0x2b8
        cer_reticle_reflex04_03_zm, // 0x2b9
        cer_reticle_reflex04_04_mp, // 0x2ba
        cer_reticle_reflex04_04_wz, // 0x2bb
        cer_reticle_reflex04_04_zm, // 0x2bc
        cer_reticle_reflex04_05_mp, // 0x2bd
        cer_reticle_reflex04_05_wz, // 0x2be
        cer_reticle_reflex04_05_zm, // 0x2bf
        cer_reticle_reflex04_06_mp, // 0x2c0
        cer_reticle_reflex04_06_wz, // 0x2c1
        cer_reticle_reflex04_06_zm, // 0x2c2
        cer_reticle_reflex04_07_mp, // 0x2c3
        cer_reticle_reflex04_07_wz, // 0x2c4
        cer_reticle_reflex04_07_zm, // 0x2c5
        cer_reticle_reflex04_08_mp, // 0x2c6
        cer_reticle_reflex04_08_wz, // 0x2c7
        cer_reticle_reflex04_08_zm, // 0x2c8
        cer_reticle_reflex04_09_mp, // 0x2c9
        cer_reticle_reflex04_09_wz, // 0x2ca
        cer_reticle_reflex04_09_zm, // 0x2cb
        cer_reticle_reflex04_10_mp, // 0x2cc
        cer_reticle_reflex04_10_wz, // 0x2cd
        cer_reticle_reflex04_10_zm, // 0x2ce
        cer_reticle_reflex05, // 0x2cf
        cer_reticle_reflex05_01_mp, // 0x2d0
        cer_reticle_reflex05_01_wz, // 0x2d1
        cer_reticle_reflex05_01_zm, // 0x2d2
        cer_reticle_reflex05_02_mp, // 0x2d3
        cer_reticle_reflex05_02_wz, // 0x2d4
        cer_reticle_reflex05_02_zm, // 0x2d5
        cer_reticle_reflex05_03_mp, // 0x2d6
        cer_reticle_reflex05_03_wz, // 0x2d7
        cer_reticle_reflex05_03_zm, // 0x2d8
        cer_reticle_reflex05_04_mp, // 0x2d9
        cer_reticle_reflex05_04_wz, // 0x2da
        cer_reticle_reflex05_04_zm, // 0x2db
        cer_reticle_reflex05_05_mp, // 0x2dc
        cer_reticle_reflex05_05_wz, // 0x2dd
        cer_reticle_reflex05_05_zm, // 0x2de
        cer_reticle_reflex05_06_mp, // 0x2df
        cer_reticle_reflex05_06_wz, // 0x2e0
        cer_reticle_reflex05_06_zm, // 0x2e1
        cer_reticle_reflex05_07_mp, // 0x2e2
        cer_reticle_reflex05_07_wz, // 0x2e3
        cer_reticle_reflex05_07_zm, // 0x2e4
        cer_reticle_reflex05_08_mp, // 0x2e5
        cer_reticle_reflex05_08_wz, // 0x2e6
        cer_reticle_reflex05_08_zm, // 0x2e7
        cer_reticle_reflex05_09_mp, // 0x2e8
        cer_reticle_reflex05_09_wz, // 0x2e9
        cer_reticle_reflex05_09_zm, // 0x2ea
        cer_reticle_reflex05_10_mp, // 0x2eb
        cer_reticle_reflex05_10_wz, // 0x2ec
        cer_reticle_reflex05_10_zm, // 0x2ed
        cer_reticle_reflex06, // 0x2ee
        cer_reticle_reflex06_01_mp, // 0x2ef
        cer_reticle_reflex06_01_wz, // 0x2f0
        cer_reticle_reflex06_01_zm, // 0x2f1
        cer_reticle_reflex06_02_mp, // 0x2f2
        cer_reticle_reflex06_02_wz, // 0x2f3
        cer_reticle_reflex06_02_zm, // 0x2f4
        cer_reticle_reflex06_03_mp, // 0x2f5
        cer_reticle_reflex06_03_wz, // 0x2f6
        cer_reticle_reflex06_03_zm, // 0x2f7
        cer_reticle_reflex06_04_mp, // 0x2f8
        cer_reticle_reflex06_04_wz, // 0x2f9
        cer_reticle_reflex06_04_zm, // 0x2fa
        cer_reticle_reflex06_05_mp, // 0x2fb
        cer_reticle_reflex06_05_wz, // 0x2fc
        cer_reticle_reflex06_05_zm, // 0x2fd
        cer_reticle_reflex06_06_mp, // 0x2fe
        cer_reticle_reflex06_06_wz, // 0x2ff
        cer_reticle_reflex06_06_zm, // 0x300
        cer_reticle_reflex06_07_mp, // 0x301
        cer_reticle_reflex06_07_wz, // 0x302
        cer_reticle_reflex06_07_zm, // 0x303
        cer_reticle_reflex06_08_mp, // 0x304
        cer_reticle_reflex06_08_wz, // 0x305
        cer_reticle_reflex06_08_zm, // 0x306
        cer_reticle_reflex06_09_mp, // 0x307
        cer_reticle_reflex06_09_wz, // 0x308
        cer_reticle_reflex06_09_zm, // 0x309
        cer_reticle_reflex06_10_mp, // 0x30a
        cer_reticle_reflex06_10_wz, // 0x30b
        cer_reticle_reflex06_10_zm, // 0x30c
        cer_reticle_scope_pi, // 0x30d
        cer_reticle_scope_pi_01_mp, // 0x30e
        cer_reticle_scope_pi_01_wz, // 0x30f
        cer_reticle_scope_pi_01_zm, // 0x310
        cer_reticle_scope_pi_02_mp, // 0x311
        cer_reticle_scope_pi_02_wz, // 0x312
        cer_reticle_scope_pi_02_zm, // 0x313
        cer_reticle_scope_pi_03_mp, // 0x314
        cer_reticle_scope_pi_03_wz, // 0x315
        cer_reticle_scope_pi_03_zm, // 0x316
        cer_reticle_scope_pi_04_mp, // 0x317
        cer_reticle_scope_pi_04_wz, // 0x318
        cer_reticle_scope_pi_04_zm, // 0x319
        cer_reticle_scope_pi_05_mp, // 0x31a
        cer_reticle_scope_pi_05_wz, // 0x31b
        cer_reticle_scope_pi_05_zm, // 0x31c
        cer_reticle_scope_rangefinder, // 0x31d
        cer_reticle_scope_rangefinder_01_mp, // 0x31e
        cer_reticle_scope_rangefinder_01_wz, // 0x31f
        cer_reticle_scope_rangefinder_01_zm, // 0x320
        cer_reticle_scope_rangefinder_02_mp, // 0x321
        cer_reticle_scope_rangefinder_02_wz, // 0x322
        cer_reticle_scope_rangefinder_02_zm, // 0x323
        cer_reticle_scope_rangefinder_03_mp, // 0x324
        cer_reticle_scope_rangefinder_03_wz, // 0x325
        cer_reticle_scope_rangefinder_03_zm, // 0x326
        cer_reticle_scope_rangefinder_04_mp, // 0x327
        cer_reticle_scope_rangefinder_04_wz, // 0x328
        cer_reticle_scope_rangefinder_04_zm, // 0x329
        cer_reticle_scope_rangefinder_05_mp, // 0x32a
        cer_reticle_scope_rangefinder_05_wz, // 0x32b
        cer_reticle_scope_rangefinder_05_zm, // 0x32c
        cer_reticle_snprscope_ar, // 0x32d
        cer_reticle_snprscope_ar_01_mp, // 0x32e
        cer_reticle_snprscope_ar_01_wz, // 0x32f
        cer_reticle_snprscope_ar_01_zm, // 0x330
        cer_reticle_snprscope_ar_02_mp, // 0x331
        cer_reticle_snprscope_ar_02_wz, // 0x332
        cer_reticle_snprscope_ar_02_zm, // 0x333
        cer_reticle_snprscope_ar_03_mp, // 0x334
        cer_reticle_snprscope_ar_03_wz, // 0x335
        cer_reticle_snprscope_ar_03_zm, // 0x336
        cer_reticle_snprscope_ar_04_mp, // 0x337
        cer_reticle_snprscope_ar_04_wz, // 0x338
        cer_reticle_snprscope_ar_04_zm, // 0x339
        cer_reticle_snprscope_ar_05_mp, // 0x33a
        cer_reticle_snprscope_ar_05_wz, // 0x33b
        cer_reticle_snprscope_ar_05_zm, // 0x33c
        cer_reticle_snprscope_dm, // 0x33d
        cer_reticle_snprscope_dm_01_mp, // 0x33e
        cer_reticle_snprscope_dm_01_wz, // 0x33f
        cer_reticle_snprscope_dm_01_zm, // 0x340
        cer_reticle_snprscope_dm_02_mp, // 0x341
        cer_reticle_snprscope_dm_02_wz, // 0x342
        cer_reticle_snprscope_dm_02_zm, // 0x343
        cer_reticle_snprscope_dm_03_mp, // 0x344
        cer_reticle_snprscope_dm_03_wz, // 0x345
        cer_reticle_snprscope_dm_03_zm, // 0x346
        cer_reticle_snprscope_dm_04_mp, // 0x347
        cer_reticle_snprscope_dm_04_wz, // 0x348
        cer_reticle_snprscope_dm_04_zm, // 0x349
        cer_reticle_snprscope_dm_05_mp, // 0x34a
        cer_reticle_snprscope_dm_05_wz, // 0x34b
        cer_reticle_snprscope_dm_05_zm, // 0x34c
        cer_reticle_snprscope_droger_ar, // 0x34d
        cer_reticle_snprscope_droger_ar_01_mp, // 0x34e
        cer_reticle_snprscope_droger_ar_01_wz, // 0x34f
        cer_reticle_snprscope_droger_ar_01_zm, // 0x350
        cer_reticle_snprscope_droger_ar_02_mp, // 0x351
        cer_reticle_snprscope_droger_ar_02_wz, // 0x352
        cer_reticle_snprscope_droger_ar_02_zm, // 0x353
        cer_reticle_snprscope_droger_ar_03_mp, // 0x354
        cer_reticle_snprscope_droger_ar_03_wz, // 0x355
        cer_reticle_snprscope_droger_ar_03_zm, // 0x356
        cer_reticle_snprscope_droger_ar_04_mp, // 0x357
        cer_reticle_snprscope_droger_ar_04_wz, // 0x358
        cer_reticle_snprscope_droger_ar_04_zm, // 0x359
        cer_reticle_snprscope_droger_ar_05_mp, // 0x35a
        cer_reticle_snprscope_droger_ar_05_wz, // 0x35b
        cer_reticle_snprscope_droger_ar_05_zm, // 0x35c
        cer_reticle_snprscope_droger_dm, // 0x35d
        cer_reticle_snprscope_droger_dm_01_mp, // 0x35e
        cer_reticle_snprscope_droger_dm_01_wz, // 0x35f
        cer_reticle_snprscope_droger_dm_01_zm, // 0x360
        cer_reticle_snprscope_droger_dm_02_mp, // 0x361
        cer_reticle_snprscope_droger_dm_02_wz, // 0x362
        cer_reticle_snprscope_droger_dm_02_zm, // 0x363
        cer_reticle_snprscope_droger_dm_03_mp, // 0x364
        cer_reticle_snprscope_droger_dm_03_wz, // 0x365
        cer_reticle_snprscope_droger_dm_03_zm, // 0x366
        cer_reticle_snprscope_droger_dm_04_mp, // 0x367
        cer_reticle_snprscope_droger_dm_04_wz, // 0x368
        cer_reticle_snprscope_droger_dm_04_zm, // 0x369
        cer_reticle_snprscope_droger_dm_05_mp, // 0x36a
        cer_reticle_snprscope_droger_dm_05_wz, // 0x36b
        cer_reticle_snprscope_droger_dm_05_zm, // 0x36c
        cer_reticle_thermal01, // 0x36d
        cer_reticle_thermal01_01_mp, // 0x36e
        cer_reticle_thermal01_01_wz, // 0x36f
        cer_reticle_thermal01_01_zm, // 0x370
        cer_reticle_thermal01_02_mp, // 0x371
        cer_reticle_thermal01_02_wz, // 0x372
        cer_reticle_thermal01_02_zm, // 0x373
        cer_reticle_thermal01_03_mp, // 0x374
        cer_reticle_thermal01_03_wz, // 0x375
        cer_reticle_thermal01_03_zm, // 0x376
        cer_reticle_thermal01_04_mp, // 0x377
        cer_reticle_thermal01_04_wz, // 0x378
        cer_reticle_thermal01_04_zm, // 0x379
        cer_reticle_thermal01_05_mp, // 0x37a
        cer_reticle_thermal01_05_wz, // 0x37b
        cer_reticle_thermal01_05_zm, // 0x37c
        cer_reticle_thermal01_06_mp, // 0x37d
        cer_reticle_thermal01_06_wz, // 0x37e
        cer_reticle_thermal01_06_zm, // 0x37f
        cer_reticle_thermal01_07_mp, // 0x380
        cer_reticle_thermal01_07_wz, // 0x381
        cer_reticle_thermal01_07_zm, // 0x382
        cer_reticle_thermal01_08_mp, // 0x383
        cer_reticle_thermal01_08_wz, // 0x384
        cer_reticle_thermal01_08_zm, // 0x385
        cer_reticle_thermal01_09_mp, // 0x386
        cer_reticle_thermal01_09_wz, // 0x387
        cer_reticle_thermal01_09_zm, // 0x388
        cer_reticle_thermal01_10_mp, // 0x389
        cer_reticle_thermal01_10_wz, // 0x38a
        cer_reticle_thermal01_10_zm, // 0x38b
        cer_reticle_thermal_holo, // 0x38c
        cer_reticle_thermal_holo_01_mp, // 0x38d
        cer_reticle_thermal_holo_01_wz, // 0x38e
        cer_reticle_thermal_holo_01_zm, // 0x38f
        cer_reticle_thermal_holo_02_mp, // 0x390
        cer_reticle_thermal_holo_02_wz, // 0x391
        cer_reticle_thermal_holo_02_zm, // 0x392
        cer_reticle_thermal_holo_03_mp, // 0x393
        cer_reticle_thermal_holo_03_wz, // 0x394
        cer_reticle_thermal_holo_03_zm, // 0x395
        cer_reticle_thermal_holo_04_mp, // 0x396
        cer_reticle_thermal_holo_04_wz, // 0x397
        cer_reticle_thermal_holo_04_zm, // 0x398
        cer_reticle_thermal_holo_05_mp, // 0x399
        cer_reticle_thermal_holo_05_wz, // 0x39a
        cer_reticle_thermal_holo_05_zm, // 0x39b
        cer_reticle_thermal_holo_06_mp, // 0x39c
        cer_reticle_thermal_holo_06_wz, // 0x39d
        cer_reticle_thermal_holo_06_zm, // 0x39e
        cer_reticle_thermal_holo_07_mp, // 0x39f
        cer_reticle_thermal_holo_07_wz, // 0x3a0
        cer_reticle_thermal_holo_07_zm, // 0x3a1
        cer_reticle_thermal_holo_08_mp, // 0x3a2
        cer_reticle_thermal_holo_08_wz, // 0x3a3
        cer_reticle_thermal_holo_08_zm, // 0x3a4
        cer_reticle_thermal_holo_09_mp, // 0x3a5
        cer_reticle_thermal_holo_09_wz, // 0x3a6
        cer_reticle_thermal_holo_09_zm, // 0x3a7
        cer_reticle_thermal_holo_10_mp, // 0x3a8
        cer_reticle_thermal_holo_10_wz, // 0x3a9
        cer_reticle_thermal_holo_10_zm, // 0x3aa
        cer_reticle_thermal_scope, // 0x3ab
        cer_reticle_thermal_scope_01_mp, // 0x3ac
        cer_reticle_thermal_scope_01_wz, // 0x3ad
        cer_reticle_thermal_scope_01_zm, // 0x3ae
        cer_reticle_thermal_scope_02_mp, // 0x3af
        cer_reticle_thermal_scope_02_wz, // 0x3b0
        cer_reticle_thermal_scope_02_zm, // 0x3b1
        cer_reticle_thermal_scope_03_mp, // 0x3b2
        cer_reticle_thermal_scope_03_wz, // 0x3b3
        cer_reticle_thermal_scope_03_zm, // 0x3b4
        cer_reticle_thermal_scope_04_mp, // 0x3b5
        cer_reticle_thermal_scope_04_wz, // 0x3b6
        cer_reticle_thermal_scope_04_zm, // 0x3b7
        cer_reticle_thermal_scope_05_mp, // 0x3b8
        cer_reticle_thermal_scope_05_wz, // 0x3b9
        cer_reticle_thermal_scope_05_zm, // 0x3ba
        cer_reticle_threex01, // 0x3bb
        cer_reticle_threex01_01_mp, // 0x3bc
        cer_reticle_threex01_01_wz, // 0x3bd
        cer_reticle_threex01_01_zm, // 0x3be
        cer_reticle_threex01_02_mp, // 0x3bf
        cer_reticle_threex01_02_wz, // 0x3c0
        cer_reticle_threex01_02_zm, // 0x3c1
        cer_reticle_threex01_03_mp, // 0x3c2
        cer_reticle_threex01_03_wz, // 0x3c3
        cer_reticle_threex01_03_zm, // 0x3c4
        cer_reticle_threex01_04_mp, // 0x3c5
        cer_reticle_threex01_04_wz, // 0x3c6
        cer_reticle_threex01_04_zm, // 0x3c7
        cer_reticle_threex01_05_mp, // 0x3c8
        cer_reticle_threex01_05_wz, // 0x3c9
        cer_reticle_threex01_05_zm, // 0x3ca
        cer_reticle_threex01_06_mp, // 0x3cb
        cer_reticle_threex01_06_wz, // 0x3cc
        cer_reticle_threex01_06_zm, // 0x3cd
        cer_reticle_threex01_07_mp, // 0x3ce
        cer_reticle_threex01_07_wz, // 0x3cf
        cer_reticle_threex01_07_zm, // 0x3d0
        cer_reticle_threex01_08_mp, // 0x3d1
        cer_reticle_threex01_08_wz, // 0x3d2
        cer_reticle_threex01_08_zm, // 0x3d3
        cer_reticle_threex01_09_mp, // 0x3d4
        cer_reticle_threex01_09_wz, // 0x3d5
        cer_reticle_threex01_09_zm, // 0x3d6
        cer_reticle_threex01_10_mp, // 0x3d7
        cer_reticle_threex01_10_wz, // 0x3d8
        cer_reticle_threex01_10_zm, // 0x3d9
        cer_reticle_twox01, // 0x3da
        cer_reticle_twox01_01_mp, // 0x3db
        cer_reticle_twox01_01_wz, // 0x3dc
        cer_reticle_twox01_01_zm, // 0x3dd
        cer_reticle_twox01_02_mp, // 0x3de
        cer_reticle_twox01_02_wz, // 0x3df
        cer_reticle_twox01_02_zm, // 0x3e0
        cer_reticle_twox01_03_mp, // 0x3e1
        cer_reticle_twox01_03_wz, // 0x3e2
        cer_reticle_twox01_03_zm, // 0x3e3
        cer_reticle_twox01_04_mp, // 0x3e4
        cer_reticle_twox01_04_wz, // 0x3e5
        cer_reticle_twox01_04_zm, // 0x3e6
        cer_reticle_twox01_05_mp, // 0x3e7
        cer_reticle_twox01_05_wz, // 0x3e8
        cer_reticle_twox01_05_zm, // 0x3e9
        cer_reticle_twox01_06_mp, // 0x3ea
        cer_reticle_twox01_06_wz, // 0x3eb
        cer_reticle_twox01_06_zm, // 0x3ec
        cer_reticle_twox01_07_mp, // 0x3ed
        cer_reticle_twox01_07_wz, // 0x3ee
        cer_reticle_twox01_07_zm, // 0x3ef
        cer_reticle_twox01_08_mp, // 0x3f0
        cer_reticle_twox01_08_wz, // 0x3f1
        cer_reticle_twox01_08_zm, // 0x3f2
        cer_reticle_twox01_09_mp, // 0x3f3
        cer_reticle_twox01_09_wz, // 0x3f4
        cer_reticle_twox01_09_zm, // 0x3f5
        cer_reticle_twox01_10_mp, // 0x3f6
        cer_reticle_twox01_10_wz, // 0x3f7
        cer_reticle_twox01_10_zm, // 0x3f8
        cer_reticle_varizoom01, // 0x3f9
        cer_reticle_varizoom01_01_mp, // 0x3fa
        cer_reticle_varizoom01_01_wz, // 0x3fb
        cer_reticle_varizoom01_01_zm, // 0x3fc
        cer_reticle_varizoom01_02_mp, // 0x3fd
        cer_reticle_varizoom01_02_wz, // 0x3fe
        cer_reticle_varizoom01_02_zm, // 0x3ff
        cer_reticle_varizoom01_03_mp, // 0x400
        cer_reticle_varizoom01_03_wz, // 0x401
        cer_reticle_varizoom01_03_zm, // 0x402
        cer_reticle_varizoom01_04_mp, // 0x403
        cer_reticle_varizoom01_04_wz, // 0x404
        cer_reticle_varizoom01_04_zm, // 0x405
        cer_reticle_varizoom01_05_mp, // 0x406
        cer_reticle_varizoom01_05_wz, // 0x407
        cer_reticle_varizoom01_05_zm, // 0x408
        cer_reticle_varizoom02, // 0x409
        cer_reticle_varizoom02_01_mp, // 0x40a
        cer_reticle_varizoom02_01_wz, // 0x40b
        cer_reticle_varizoom02_01_zm, // 0x40c
        cer_reticle_varizoom02_02_mp, // 0x40d
        cer_reticle_varizoom02_02_wz, // 0x40e
        cer_reticle_varizoom02_02_zm, // 0x40f
        cer_reticle_varizoom02_03_mp, // 0x410
        cer_reticle_varizoom02_03_wz, // 0x411
        cer_reticle_varizoom02_03_zm, // 0x412
        cer_reticle_varizoom02_04_mp, // 0x413
        cer_reticle_varizoom02_04_wz, // 0x414
        cer_reticle_varizoom02_04_zm, // 0x415
        cer_reticle_varizoom02_05_mp, // 0x416
        cer_reticle_varizoom02_05_wz, // 0x417
        cer_reticle_varizoom02_05_zm, // 0x418
        holodef, // 0x419
        hybriddef, // 0x41a
        reflexdef, // 0x41b
        thermaldef, // 0x41c
        vzscopedef, // 0x41d
        cer_reticle_loot_s2bp1, // 0x41e
        cer_reticle_loot_s2bp6, // 0x41f
        cer_reticle_loot_s2bp8, // 0x420
        cer_reticle_loot_s2carnival, // 0x421
        cer_reticle_loot_s2cartoon, // 0x422
        cer_reticle_loot_s2cdplayer, // 0x423
        cer_reticle_loot_s2ghillie, // 0x424
        cer_reticle_loot_s2icenlava, // 0x425
        cer_reticle_loot_s2saintpat, // 0x426
        cer_reticle_loot_s2special, // 0x427
        cer_reticle_loot_s2thai, // 0x428
        cer_reticle_loot_s2vtuber, // 0x429
        cer_reticle_loot_s2wizard, // 0x42a
        cer_reticle_loot_s3bdog, // 0x42b
        cer_reticle_loot_s3brush, // 0x42c
        cer_reticle_loot_s3carver, // 0x42d
        cer_reticle_loot_s3comics, // 0x42e
        cer_reticle_loot_s3ev7a, // 0x42f
        cer_reticle_loot_s3hponics, // 0x430
        cer_reticle_loot_s3nuclear, // 0x431
        cer_reticle_loot_s3over, // 0x432
        cer_reticle_loot_s3pink, // 0x433
        cer_reticle_loot_s3swolf, // 0x434
        cer_reticle_loot_s35jcrafts, // 0x435
        cer_reticle_loot_s35magic, // 0x436
        cer_reticle_loot_s35redact, // 0x437
        cer_reticle_loot_s35ssword, // 0x438
        cer_reticle_loot_s4dadler, // 0x439
        cer_reticle_loot_s4improv, // 0x43a
        cer_reticle_loot_s4infrared, // 0x43b
        cer_reticle_loot_s4versus, // 0x43c
        cer_reticle_loot_s45diver, // 0x43d
        cer_reticle_loot_s45lowrez, // 0x43e
        cer_reticle_loot_s45pday, // 0x43f
        cer_reticle_loot_s5alterego, // 0x440
        cer_reticle_loot_s5gberet, // 0x441
        cer_reticle_loot_s5leather, // 0x442
        cer_reticle_loot_s5pdoctor, // 0x443
        cer_reticle_loot_s5sensei, // 0x444
        cer_reticle_loot_s55ademon, // 0x445
        cer_reticle_loot_s55beach, // 0x446
        cer_reticle_loot_s55queen, // 0x447
        cer_reticle_loot_s55smuggler, // 0x448
        cer_reticle_loot_s6ghost, // 0x449
        cer_reticle_loot_s6jock, // 0x44a
        cer_reticle_loot_s6milk, // 0x44b
        cer_reticle_loot_s6record, // 0x44c
        cer_reticle_loot_s6skateboard, // 0x44d
        cer_reticle_loot_s6upside // 0x44e
    };

    // idx 0x13 members: 0x95a type: 5
    enum Sticker {
        sticker_none, // 0x0
        sticker_iw9_001, // 0x1
        sticker_iw9_002, // 0x2
        sticker_iw9_003, // 0x3
        sticker_iw9_004, // 0x4
        sticker_iw9_005, // 0x5
        sticker_iw9_006, // 0x6
        sticker_iw9_007, // 0x7
        sticker_iw9_008, // 0x8
        sticker_iw9_009, // 0x9
        sticker_iw9_010, // 0xa
        sticker_iw9_011, // 0xb
        sticker_iw9_012, // 0xc
        sticker_iw9_013, // 0xd
        sticker_iw9_014, // 0xe
        sticker_iw9_015, // 0xf
        sticker_iw9_016, // 0x10
        sticker_iw9_017, // 0x11
        sticker_iw9_018, // 0x12
        sticker_iw9_019, // 0x13
        sticker_iw9_020, // 0x14
        sticker_iw9_021, // 0x15
        sticker_iw9_022, // 0x16
        sticker_iw9_023, // 0x17
        sticker_iw9_024, // 0x18
        sticker_iw9_025, // 0x19
        sticker_iw9_026, // 0x1a
        sticker_iw9_027, // 0x1b
        sticker_iw9_028, // 0x1c
        sticker_iw9_029, // 0x1d
        sticker_iw9_030, // 0x1e
        sticker_iw9_031, // 0x1f
        sticker_iw9_032, // 0x20
        sticker_iw9_033, // 0x21
        sticker_iw9_034, // 0x22
        sticker_iw9_035, // 0x23
        sticker_iw9_036, // 0x24
        sticker_iw9_037, // 0x25
        sticker_iw9_038, // 0x26
        sticker_iw9_039, // 0x27
        sticker_iw9_040, // 0x28
        sticker_iw9_041, // 0x29
        sticker_iw9_042, // 0x2a
        sticker_iw9_043, // 0x2b
        sticker_iw9_044, // 0x2c
        sticker_iw9_045, // 0x2d
        sticker_iw9_046, // 0x2e
        sticker_iw9_047, // 0x2f
        sticker_iw9_048, // 0x30
        sticker_iw9_049, // 0x31
        sticker_iw9_050, // 0x32
        sticker_iw9_051, // 0x33
        sticker_iw9_052, // 0x34
        sticker_iw9_053, // 0x35
        sticker_iw9_054, // 0x36
        sticker_iw9_055, // 0x37
        sticker_iw9_056, // 0x38
        sticker_iw9_057, // 0x39
        sticker_iw9_058, // 0x3a
        sticker_iw9_059, // 0x3b
        sticker_iw9_060, // 0x3c
        sticker_iw9_061, // 0x3d
        sticker_iw9_062, // 0x3e
        sticker_iw9_063, // 0x3f
        sticker_iw9_064, // 0x40
        sticker_iw9_065, // 0x41
        sticker_iw9_066, // 0x42
        sticker_iw9_067, // 0x43
        sticker_iw9_068, // 0x44
        sticker_iw9_069, // 0x45
        sticker_iw9_070, // 0x46
        sticker_iw9_071, // 0x47
        sticker_iw9_072, // 0x48
        sticker_iw9_073, // 0x49
        sticker_iw9_074, // 0x4a
        sticker_iw9_075, // 0x4b
        sticker_iw9_076, // 0x4c
        sticker_iw9_077, // 0x4d
        sticker_iw9_078, // 0x4e
        sticker_iw9_079, // 0x4f
        sticker_iw9_080, // 0x50
        sticker_iw9_081, // 0x51
        sticker_iw9_082, // 0x52
        sticker_iw9_083, // 0x53
        sticker_iw9_084, // 0x54
        sticker_iw9_085, // 0x55
        sticker_iw9_086, // 0x56
        sticker_iw9_087, // 0x57
        sticker_iw9_088, // 0x58
        sticker_iw9_089, // 0x59
        sticker_iw9_090, // 0x5a
        sticker_iw9_091, // 0x5b
        sticker_iw9_092, // 0x5c
        sticker_iw9_093, // 0x5d
        sticker_iw9_094, // 0x5e
        sticker_iw9_095, // 0x5f
        sticker_iw9_096, // 0x60
        sticker_iw9_097, // 0x61
        sticker_iw9_098, // 0x62
        sticker_iw9_099, // 0x63
        sticker_iw9_100, // 0x64
        sticker_iw9_101, // 0x65
        sticker_iw9_102, // 0x66
        sticker_iw9_103, // 0x67
        sticker_iw9_104, // 0x68
        sticker_iw9_105, // 0x69
        sticker_iw9_106, // 0x6a
        sticker_iw9_107, // 0x6b
        sticker_iw9_108, // 0x6c
        sticker_iw9_109, // 0x6d
        sticker_iw9_110, // 0x6e
        sticker_iw9_111, // 0x6f
        sticker_iw9_112, // 0x70
        sticker_iw9_113, // 0x71
        sticker_iw9_114, // 0x72
        sticker_iw9_115, // 0x73
        sticker_iw9_116, // 0x74
        sticker_iw9_117, // 0x75
        sticker_iw9_118, // 0x76
        sticker_iw9_119, // 0x77
        sticker_iw9_120, // 0x78
        sticker_iw9_121, // 0x79
        sticker_iw9_122, // 0x7a
        sticker_iw9_123, // 0x7b
        sticker_iw9_124, // 0x7c
        sticker_iw9_125, // 0x7d
        sticker_iw9_126, // 0x7e
        sticker_iw9_127, // 0x7f
        sticker_iw9_128, // 0x80
        sticker_iw9_129, // 0x81
        sticker_iw9_130, // 0x82
        sticker_iw9_131, // 0x83
        sticker_iw9_132, // 0x84
        sticker_iw9_133, // 0x85
        sticker_iw9_134, // 0x86
        sticker_iw9_135, // 0x87
        sticker_iw9_136, // 0x88
        sticker_iw9_137, // 0x89
        sticker_iw9_138, // 0x8a
        sticker_iw9_139, // 0x8b
        sticker_iw9_140, // 0x8c
        sticker_iw9_141, // 0x8d
        sticker_iw9_142, // 0x8e
        sticker_iw9_143, // 0x8f
        sticker_iw9_144, // 0x90
        sticker_iw9_145, // 0x91
        sticker_iw9_146, // 0x92
        sticker_iw9_147, // 0x93
        sticker_iw9_148, // 0x94
        sticker_iw9_149, // 0x95
        sticker_iw9_150, // 0x96
        sticker_iw9_151, // 0x97
        sticker_iw9_152, // 0x98
        sticker_iw9_153, // 0x99
        sticker_iw9_154, // 0x9a
        sticker_iw9_155, // 0x9b
        sticker_iw9_156, // 0x9c
        sticker_iw9_157, // 0x9d
        sticker_iw9_158, // 0x9e
        sticker_iw9_159, // 0x9f
        sticker_iw9_160, // 0xa0
        sticker_iw9_161, // 0xa1
        sticker_iw9_162, // 0xa2
        sticker_iw9_163, // 0xa3
        sticker_iw9_164, // 0xa4
        sticker_iw9_165, // 0xa5
        sticker_iw9_166, // 0xa6
        sticker_iw9_167, // 0xa7
        sticker_iw9_168, // 0xa8
        sticker_iw9_169, // 0xa9
        sticker_iw9_170, // 0xaa
        sticker_iw9_171, // 0xab
        sticker_iw9_172, // 0xac
        sticker_iw9_173, // 0xad
        sticker_iw9_174, // 0xae
        sticker_iw9_175, // 0xaf
        sticker_iw9_176, // 0xb0
        sticker_iw9_177, // 0xb1
        sticker_iw9_178, // 0xb2
        sticker_iw9_179, // 0xb3
        sticker_iw9_180, // 0xb4
        sticker_iw9_181, // 0xb5
        sticker_iw9_182, // 0xb6
        sticker_iw9_183, // 0xb7
        sticker_iw9_184, // 0xb8
        sticker_iw9_185, // 0xb9
        sticker_iw9_186, // 0xba
        sticker_iw9_187, // 0xbb
        sticker_iw9_188, // 0xbc
        sticker_iw9_189, // 0xbd
        sticker_iw9_190, // 0xbe
        sticker_iw9_191, // 0xbf
        sticker_iw9_192, // 0xc0
        sticker_iw9_193, // 0xc1
        sticker_iw9_194, // 0xc2
        sticker_iw9_195, // 0xc3
        sticker_iw9_196, // 0xc4
        sticker_iw9_197, // 0xc5
        sticker_iw9_198, // 0xc6
        sticker_iw9_199, // 0xc7
        sticker_iw9_200, // 0xc8
        sticker_iw9_201, // 0xc9
        sticker_iw9_202, // 0xca
        sticker_iw9_203, // 0xcb
        sticker_iw9_204, // 0xcc
        sticker_iw9_205, // 0xcd
        sticker_iw9_206, // 0xce
        sticker_iw9_207, // 0xcf
        sticker_iw9_208, // 0xd0
        sticker_iw9_209, // 0xd1
        sticker_iw9_210, // 0xd2
        sticker_iw9_211, // 0xd3
        sticker_iw9_212, // 0xd4
        sticker_iw9_213, // 0xd5
        sticker_iw9_214, // 0xd6
        sticker_iw9_215, // 0xd7
        sticker_iw9_216, // 0xd8
        sticker_iw9_217, // 0xd9
        sticker_iw9_218, // 0xda
        sticker_iw9_219, // 0xdb
        sticker_iw9_220, // 0xdc
        sticker_iw9_221, // 0xdd
        sticker_iw9_222, // 0xde
        sticker_iw9_223, // 0xdf
        sticker_iw9_224, // 0xe0
        sticker_iw9_225, // 0xe1
        sticker_iw9_226, // 0xe2
        sticker_iw9_227, // 0xe3
        sticker_iw9_228, // 0xe4
        sticker_iw9_229, // 0xe5
        sticker_iw9_230, // 0xe6
        sticker_iw9_231, // 0xe7
        sticker_iw9_232, // 0xe8
        sticker_iw9_233, // 0xe9
        sticker_iw9_234, // 0xea
        sticker_iw9_235, // 0xeb
        sticker_iw9_236, // 0xec
        sticker_iw9_237, // 0xed
        sticker_iw9_238, // 0xee
        sticker_iw9_239, // 0xef
        sticker_iw9_240, // 0xf0
        sticker_iw9_241, // 0xf1
        sticker_iw9_242, // 0xf2
        sticker_iw9_243, // 0xf3
        sticker_iw9_244, // 0xf4
        sticker_iw9_245, // 0xf5
        sticker_iw9_246, // 0xf6
        sticker_iw9_247, // 0xf7
        sticker_iw9_248, // 0xf8
        sticker_iw9_249, // 0xf9
        sticker_iw9_250, // 0xfa
        sticker_iw9_251, // 0xfb
        sticker_iw9_252, // 0xfc
        sticker_iw9_253, // 0xfd
        sticker_iw9_254, // 0xfe
        sticker_iw9_255, // 0xff
        sticker_iw9_256, // 0x100
        sticker_iw9_257, // 0x101
        sticker_iw9_258, // 0x102
        sticker_iw9_259, // 0x103
        sticker_iw9_260, // 0x104
        sticker_iw9_261, // 0x105
        sticker_iw9_262, // 0x106
        sticker_iw9_263, // 0x107
        sticker_iw9_264, // 0x108
        sticker_iw9_265, // 0x109
        sticker_iw9_266, // 0x10a
        sticker_iw9_267, // 0x10b
        sticker_iw9_268, // 0x10c
        sticker_iw9_269, // 0x10d
        sticker_iw9_270, // 0x10e
        sticker_iw9_271, // 0x10f
        sticker_iw9_272, // 0x110
        sticker_iw9_273, // 0x111
        sticker_iw9_274, // 0x112
        sticker_iw9_275, // 0x113
        sticker_iw9_276, // 0x114
        sticker_iw9_277, // 0x115
        sticker_iw9_278, // 0x116
        sticker_iw9_279, // 0x117
        sticker_iw9_280, // 0x118
        sticker_iw9_281, // 0x119
        sticker_iw9_282, // 0x11a
        sticker_iw9_283, // 0x11b
        sticker_iw9_284, // 0x11c
        sticker_iw9_285, // 0x11d
        sticker_iw9_286, // 0x11e
        sticker_iw9_287, // 0x11f
        sticker_iw9_288, // 0x120
        sticker_iw9_289, // 0x121
        sticker_iw9_290, // 0x122
        sticker_iw9_291, // 0x123
        sticker_iw9_292, // 0x124
        sticker_iw9_293, // 0x125
        sticker_iw9_294, // 0x126
        sticker_iw9_295, // 0x127
        sticker_iw9_296, // 0x128
        sticker_iw9_297, // 0x129
        sticker_iw9_298, // 0x12a
        sticker_iw9_299, // 0x12b
        sticker_iw9_300, // 0x12c
        sticker_iw9_301, // 0x12d
        sticker_iw9_302, // 0x12e
        sticker_iw9_303, // 0x12f
        sticker_iw9_304, // 0x130
        sticker_iw9_305, // 0x131
        sticker_iw9_306, // 0x132
        sticker_iw9_307, // 0x133
        sticker_iw9_308, // 0x134
        sticker_iw9_309, // 0x135
        sticker_iw9_310, // 0x136
        sticker_iw9_311, // 0x137
        sticker_iw9_312, // 0x138
        sticker_iw9_313, // 0x139
        sticker_iw9_314, // 0x13a
        sticker_iw9_315, // 0x13b
        sticker_iw9_316, // 0x13c
        sticker_iw9_317, // 0x13d
        sticker_iw9_318, // 0x13e
        sticker_iw9_319, // 0x13f
        sticker_iw9_320, // 0x140
        sticker_iw9_321, // 0x141
        sticker_iw9_322, // 0x142
        sticker_iw9_323, // 0x143
        sticker_iw9_324, // 0x144
        sticker_iw9_325, // 0x145
        sticker_iw9_326, // 0x146
        sticker_iw9_327, // 0x147
        sticker_iw9_328, // 0x148
        sticker_iw9_329, // 0x149
        sticker_iw9_330, // 0x14a
        sticker_iw9_331, // 0x14b
        sticker_iw9_332, // 0x14c
        sticker_iw9_333, // 0x14d
        sticker_iw9_334, // 0x14e
        sticker_iw9_335, // 0x14f
        sticker_iw9_336, // 0x150
        sticker_iw9_337, // 0x151
        sticker_iw9_338, // 0x152
        sticker_iw9_339, // 0x153
        sticker_iw9_340, // 0x154
        sticker_iw9_341, // 0x155
        sticker_iw9_342, // 0x156
        sticker_iw9_343, // 0x157
        sticker_iw9_344, // 0x158
        sticker_iw9_345, // 0x159
        sticker_iw9_346, // 0x15a
        sticker_iw9_347, // 0x15b
        sticker_iw9_348, // 0x15c
        sticker_iw9_349, // 0x15d
        sticker_iw9_350, // 0x15e
        sticker_iw9_351, // 0x15f
        sticker_iw9_352, // 0x160
        sticker_iw9_353, // 0x161
        sticker_iw9_354, // 0x162
        sticker_iw9_355, // 0x163
        sticker_iw9_356, // 0x164
        sticker_iw9_357, // 0x165
        sticker_iw9_358, // 0x166
        sticker_iw9_359, // 0x167
        sticker_iw9_360, // 0x168
        sticker_iw9_361, // 0x169
        sticker_iw9_362, // 0x16a
        sticker_iw9_363, // 0x16b
        sticker_iw9_364, // 0x16c
        sticker_iw9_365, // 0x16d
        sticker_iw9_366, // 0x16e
        sticker_iw9_367, // 0x16f
        sticker_iw9_368, // 0x170
        sticker_iw9_369, // 0x171
        sticker_iw9_370, // 0x172
        sticker_iw9_371, // 0x173
        sticker_iw9_372, // 0x174
        sticker_iw9_373, // 0x175
        sticker_iw9_374, // 0x176
        sticker_iw9_375, // 0x177
        sticker_iw9_376, // 0x178
        sticker_iw9_377, // 0x179
        sticker_iw9_378, // 0x17a
        sticker_iw9_379, // 0x17b
        sticker_iw9_380, // 0x17c
        sticker_iw9_381, // 0x17d
        sticker_iw9_382, // 0x17e
        sticker_iw9_383, // 0x17f
        sticker_iw9_384, // 0x180
        sticker_iw9_385, // 0x181
        sticker_iw9_386, // 0x182
        sticker_iw9_387, // 0x183
        sticker_iw9_388, // 0x184
        sticker_iw9_389, // 0x185
        sticker_iw9_390, // 0x186
        sticker_iw9_391, // 0x187
        sticker_iw9_392, // 0x188
        sticker_iw9_393, // 0x189
        sticker_iw9_394, // 0x18a
        sticker_iw9_395, // 0x18b
        sticker_iw9_396, // 0x18c
        sticker_iw9_397, // 0x18d
        sticker_iw9_398, // 0x18e
        sticker_iw9_399, // 0x18f
        sticker_iw9_400, // 0x190
        sticker_iw9_401, // 0x191
        sticker_iw9_402, // 0x192
        sticker_iw9_403, // 0x193
        sticker_iw9_404, // 0x194
        sticker_iw9_405, // 0x195
        sticker_iw9_406, // 0x196
        sticker_iw9_407, // 0x197
        sticker_iw9_408, // 0x198
        sticker_iw9_409, // 0x199
        sticker_iw9_410, // 0x19a
        sticker_iw9_411, // 0x19b
        sticker_iw9_412, // 0x19c
        sticker_iw9_413, // 0x19d
        sticker_iw9_414, // 0x19e
        sticker_iw9_415, // 0x19f
        sticker_iw9_416, // 0x1a0
        sticker_iw9_417, // 0x1a1
        sticker_iw9_418, // 0x1a2
        sticker_iw9_419, // 0x1a3
        sticker_iw9_420, // 0x1a4
        sticker_iw9_421, // 0x1a5
        sticker_iw9_422, // 0x1a6
        sticker_iw9_423, // 0x1a7
        sticker_iw9_424, // 0x1a8
        sticker_iw9_425, // 0x1a9
        sticker_iw9_426, // 0x1aa
        sticker_iw9_427, // 0x1ab
        sticker_iw9_428, // 0x1ac
        sticker_iw9_429, // 0x1ad
        sticker_iw9_430, // 0x1ae
        sticker_iw9_431, // 0x1af
        sticker_iw9_432, // 0x1b0
        sticker_iw9_433, // 0x1b1
        sticker_iw9_434, // 0x1b2
        sticker_iw9_435, // 0x1b3
        sticker_iw9_436, // 0x1b4
        sticker_iw9_437, // 0x1b5
        sticker_iw9_438, // 0x1b6
        sticker_iw9_439, // 0x1b7
        sticker_iw9_440, // 0x1b8
        sticker_iw9_441, // 0x1b9
        sticker_iw9_442, // 0x1ba
        sticker_iw9_443, // 0x1bb
        sticker_iw9_444, // 0x1bc
        sticker_iw9_445, // 0x1bd
        sticker_iw9_446, // 0x1be
        sticker_iw9_447, // 0x1bf
        sticker_iw9_448, // 0x1c0
        sticker_iw9_449, // 0x1c1
        sticker_iw9_450, // 0x1c2
        sticker_iw9_451, // 0x1c3
        sticker_iw9_452, // 0x1c4
        sticker_iw9_453, // 0x1c5
        sticker_iw9_454, // 0x1c6
        sticker_iw9_455, // 0x1c7
        sticker_iw9_456, // 0x1c8
        sticker_iw9_457, // 0x1c9
        sticker_iw9_458, // 0x1ca
        sticker_iw9_459, // 0x1cb
        sticker_iw9_460, // 0x1cc
        sticker_iw9_461, // 0x1cd
        sticker_iw9_462, // 0x1ce
        sticker_iw9_463, // 0x1cf
        sticker_iw9_464, // 0x1d0
        sticker_iw9_465, // 0x1d1
        sticker_iw9_466, // 0x1d2
        sticker_iw9_467, // 0x1d3
        sticker_iw9_468, // 0x1d4
        sticker_iw9_469, // 0x1d5
        sticker_iw9_470, // 0x1d6
        sticker_iw9_471, // 0x1d7
        sticker_iw9_472, // 0x1d8
        sticker_iw9_473, // 0x1d9
        sticker_iw9_474, // 0x1da
        sticker_iw9_475, // 0x1db
        sticker_iw9_476, // 0x1dc
        sticker_iw9_477, // 0x1dd
        sticker_iw9_478, // 0x1de
        sticker_iw9_479, // 0x1df
        sticker_iw9_480, // 0x1e0
        sticker_iw9_481, // 0x1e1
        sticker_iw9_482, // 0x1e2
        sticker_iw9_483, // 0x1e3
        sticker_iw9_484, // 0x1e4
        sticker_iw9_485, // 0x1e5
        sticker_iw9_486, // 0x1e6
        sticker_iw9_487, // 0x1e7
        sticker_iw9_488, // 0x1e8
        sticker_iw9_489, // 0x1e9
        sticker_iw9_490, // 0x1ea
        sticker_iw9_491, // 0x1eb
        sticker_iw9_492, // 0x1ec
        sticker_iw9_493, // 0x1ed
        sticker_iw9_494, // 0x1ee
        sticker_iw9_495, // 0x1ef
        sticker_iw9_496, // 0x1f0
        sticker_iw9_497, // 0x1f1
        sticker_iw9_498, // 0x1f2
        sticker_iw9_499, // 0x1f3
        sticker_iw9_500, // 0x1f4
        sticker_iw9_501, // 0x1f5
        sticker_iw9_502, // 0x1f6
        sticker_iw9_503, // 0x1f7
        sticker_iw9_504, // 0x1f8
        sticker_iw9_505, // 0x1f9
        sticker_iw9_506, // 0x1fa
        sticker_iw9_507, // 0x1fb
        sticker_iw9_508, // 0x1fc
        sticker_iw9_509, // 0x1fd
        sticker_iw9_510, // 0x1fe
        sticker_iw9_511, // 0x1ff
        sticker_iw9_512, // 0x200
        sticker_iw9_513, // 0x201
        sticker_iw9_514, // 0x202
        sticker_iw9_515, // 0x203
        sticker_iw9_516, // 0x204
        sticker_iw9_517, // 0x205
        sticker_iw9_518, // 0x206
        sticker_iw9_519, // 0x207
        sticker_iw9_520, // 0x208
        sticker_iw9_521, // 0x209
        sticker_iw9_522, // 0x20a
        sticker_iw9_523, // 0x20b
        sticker_iw9_524, // 0x20c
        sticker_iw9_525, // 0x20d
        sticker_iw9_526, // 0x20e
        sticker_iw9_527, // 0x20f
        sticker_iw9_528, // 0x210
        sticker_iw9_529, // 0x211
        sticker_iw9_530, // 0x212
        sticker_iw9_531, // 0x213
        sticker_iw9_532, // 0x214
        sticker_iw9_533, // 0x215
        sticker_iw9_534, // 0x216
        sticker_iw9_535, // 0x217
        sticker_iw9_536, // 0x218
        sticker_iw9_537, // 0x219
        sticker_iw9_538, // 0x21a
        sticker_iw9_539, // 0x21b
        sticker_iw9_540, // 0x21c
        sticker_iw9_541, // 0x21d
        sticker_iw9_542, // 0x21e
        sticker_iw9_543, // 0x21f
        sticker_iw9_544, // 0x220
        sticker_iw9_545, // 0x221
        sticker_iw9_546, // 0x222
        sticker_iw9_547, // 0x223
        sticker_iw9_548, // 0x224
        sticker_iw9_549, // 0x225
        sticker_iw9_550, // 0x226
        vinyl_iw9_001, // 0x227
        vinyl_iw9_002, // 0x228
        vinyl_iw9_003, // 0x229
        vinyl_iw9_004, // 0x22a
        vinyl_iw9_005, // 0x22b
        vinyl_iw9_006, // 0x22c
        vinyl_iw9_007, // 0x22d
        vinyl_iw9_008, // 0x22e
        vinyl_iw9_009, // 0x22f
        vinyl_iw9_010, // 0x230
        vinyl_iw9_011, // 0x231
        vinyl_iw9_012, // 0x232
        vinyl_iw9_013, // 0x233
        vinyl_iw9_014, // 0x234
        vinyl_iw9_015, // 0x235
        vinyl_iw9_016, // 0x236
        vinyl_iw9_017, // 0x237
        vinyl_iw9_018, // 0x238
        vinyl_iw9_019, // 0x239
        vinyl_iw9_020, // 0x23a
        vinyl_iw9_021, // 0x23b
        vinyl_iw9_022, // 0x23c
        vinyl_iw9_023, // 0x23d
        vinyl_iw9_024, // 0x23e
        vinyl_iw9_025, // 0x23f
        vinyl_iw9_026, // 0x240
        vinyl_iw9_027, // 0x241
        vinyl_iw9_028, // 0x242
        vinyl_iw9_029, // 0x243
        vinyl_iw9_030, // 0x244
        vinyl_iw9_031, // 0x245
        vinyl_iw9_032, // 0x246
        vinyl_iw9_033, // 0x247
        vinyl_iw9_034, // 0x248
        vinyl_iw9_035, // 0x249
        vinyl_iw9_036, // 0x24a
        vinyl_iw9_037, // 0x24b
        vinyl_iw9_038, // 0x24c
        vinyl_iw9_039, // 0x24d
        vinyl_iw9_040, // 0x24e
        vinyl_iw9_041, // 0x24f
        vinyl_iw9_042, // 0x250
        vinyl_iw9_043, // 0x251
        vinyl_iw9_044, // 0x252
        vinyl_iw9_045, // 0x253
        vinyl_iw9_046, // 0x254
        vinyl_iw9_047, // 0x255
        vinyl_iw9_048, // 0x256
        vinyl_iw9_049, // 0x257
        vinyl_iw9_050, // 0x258
        vinyl_iw9_051, // 0x259
        vinyl_iw9_052, // 0x25a
        vinyl_iw9_053, // 0x25b
        vinyl_iw9_054, // 0x25c
        vinyl_iw9_055, // 0x25d
        vinyl_iw9_056, // 0x25e
        vinyl_iw9_057, // 0x25f
        vinyl_iw9_058, // 0x260
        vinyl_iw9_059, // 0x261
        vinyl_iw9_060, // 0x262
        vinyl_iw9_061, // 0x263
        vinyl_iw9_062, // 0x264
        vinyl_iw9_063, // 0x265
        vinyl_iw9_064, // 0x266
        vinyl_iw9_065, // 0x267
        vinyl_iw9_066, // 0x268
        vinyl_iw9_067, // 0x269
        vinyl_iw9_068, // 0x26a
        vinyl_iw9_069, // 0x26b
        vinyl_iw9_070, // 0x26c
        vinyl_iw9_071, // 0x26d
        vinyl_iw9_072, // 0x26e
        vinyl_iw9_073, // 0x26f
        vinyl_iw9_074, // 0x270
        vinyl_iw9_075, // 0x271
        vinyl_iw9_076, // 0x272
        vinyl_iw9_077, // 0x273
        vinyl_iw9_078, // 0x274
        vinyl_iw9_079, // 0x275
        vinyl_iw9_080, // 0x276
        vinyl_iw9_081, // 0x277
        vinyl_iw9_082, // 0x278
        vinyl_iw9_083, // 0x279
        vinyl_iw9_084, // 0x27a
        vinyl_iw9_085, // 0x27b
        vinyl_iw9_086, // 0x27c
        vinyl_iw9_087, // 0x27d
        vinyl_iw9_088, // 0x27e
        vinyl_iw9_089, // 0x27f
        vinyl_iw9_090, // 0x280
        vinyl_iw9_091, // 0x281
        vinyl_iw9_092, // 0x282
        vinyl_iw9_093, // 0x283
        vinyl_iw9_094, // 0x284
        vinyl_iw9_095, // 0x285
        vinyl_iw9_096, // 0x286
        vinyl_iw9_097, // 0x287
        vinyl_iw9_098, // 0x288
        vinyl_iw9_099, // 0x289
        vinyl_iw9_100, // 0x28a
        sticker_mgl_001, // 0x28b
        sticker_mgl_002, // 0x28c
        sticker_wzm_003, // 0x28d
        sticker_wzm_004, // 0x28e
        sticker_wzm_005, // 0x28f
        sticker_wzm_006, // 0x290
        sticker_wzm_007, // 0x291
        sticker_wzm_008, // 0x292
        sticker_wzm_009, // 0x293
        sticker_wzm_010, // 0x294
        sticker_wzm_011, // 0x295
        sticker_wzm_012, // 0x296
        sticker_wzm_013, // 0x297
        sticker_wzm_014, // 0x298
        sticker_wzm_015, // 0x299
        sticker_wzm_016, // 0x29a
        sticker_wzm_017, // 0x29b
        sticker_wzm_018, // 0x29c
        sticker_mgl_019, // 0x29d
        sticker_wzm_020, // 0x29e
        sticker_wzm_021, // 0x29f
        sticker_wzm_022, // 0x2a0
        sticker_wzm_023, // 0x2a1
        sticker_wzm_024, // 0x2a2
        sticker_mgl_025, // 0x2a3
        sticker_wzm_026, // 0x2a4
        sticker_wzm_027, // 0x2a5
        sticker_wzm_028, // 0x2a6
        sticker_wzm_029, // 0x2a7
        sticker_wzm_030, // 0x2a8
        sticker_wzm_031, // 0x2a9
        sticker_wzm_032, // 0x2aa
        sticker_wzm_033, // 0x2ab
        sticker_mgl_034, // 0x2ac
        sticker_mgl_035, // 0x2ad
        sticker_mgl_036, // 0x2ae
        sticker_mgl_037, // 0x2af
        sticker_mgl_038, // 0x2b0
        sticker_mgl_039, // 0x2b1
        sticker_mgl_049, // 0x2b2
        sticker_mgl_060, // 0x2b3
        vinyl_mgl_001, // 0x2b4
        vinyl_mgl_002, // 0x2b5
        vinyl_wzm_003, // 0x2b6
        vinyl_wzm_004, // 0x2b7
        vinyl_wzm_005, // 0x2b8
        vinyl_wzm_006, // 0x2b9
        vinyl_wzm_007, // 0x2ba
        vinyl_wzm_008, // 0x2bb
        vinyl_wzm_009, // 0x2bc
        vinyl_wzm_010, // 0x2bd
        vinyl_wzm_011, // 0x2be
        vinyl_wzm_012, // 0x2bf
        vinyl_wzm_013, // 0x2c0
        vinyl_wzm_014, // 0x2c1
        vinyl_wzm_015, // 0x2c2
        vinyl_wzm_016, // 0x2c3
        vinyl_wzm_017, // 0x2c4
        vinyl_wzm_018, // 0x2c5
        vinyl_wzm_019, // 0x2c6
        vinyl_wzm_020, // 0x2c7
        vinyl_wzm_021, // 0x2c8
        vinyl_wzm_022, // 0x2c9
        vinyl_wzm_023, // 0x2ca
        vinyl_wzm_024, // 0x2cb
        vinyl_mgl_025, // 0x2cc
        vinyl_mgl_026, // 0x2cd
        vinyl_mgl_027, // 0x2ce
        vinyl_wzm_028, // 0x2cf
        vinyl_wzm_029, // 0x2d0
        vinyl_wzm_030, // 0x2d1
        vinyl_wzm_031, // 0x2d2
        vinyl_wzm_032, // 0x2d3
        vinyl_wzm_034, // 0x2d4
        vinyl_mgl_035, // 0x2d5
        vinyl_mgl_036, // 0x2d6
        vinyl_mgl_037, // 0x2d7
        vinyl_mgl_038, // 0x2d8
        vinyl_mgl_039, // 0x2d9
        vinyl_mgl_047, // 0x2da
        vinyl_iw9_101, // 0x2db
        vinyl_iw9_102, // 0x2dc
        vinyl_iw9_103, // 0x2dd
        vinyl_iw9_104, // 0x2de
        vinyl_iw9_105, // 0x2df
        vinyl_iw9_106, // 0x2e0
        vinyl_iw9_107, // 0x2e1
        vinyl_iw9_108, // 0x2e2
        vinyl_iw9_109, // 0x2e3
        vinyl_iw9_110, // 0x2e4
        vinyl_iw9_111, // 0x2e5
        vinyl_iw9_112, // 0x2e6
        vinyl_iw9_113, // 0x2e7
        vinyl_iw9_114, // 0x2e8
        vinyl_iw9_115, // 0x2e9
        vinyl_iw9_116, // 0x2ea
        vinyl_iw9_117, // 0x2eb
        vinyl_iw9_118, // 0x2ec
        vinyl_iw9_119, // 0x2ed
        vinyl_iw9_120, // 0x2ee
        vinyl_iw9_121, // 0x2ef
        vinyl_iw9_122, // 0x2f0
        vinyl_iw9_123, // 0x2f1
        vinyl_iw9_124, // 0x2f2
        vinyl_iw9_125, // 0x2f3
        vinyl_iw9_126, // 0x2f4
        vinyl_iw9_127, // 0x2f5
        vinyl_iw9_128, // 0x2f6
        vinyl_iw9_129, // 0x2f7
        vinyl_iw9_130, // 0x2f8
        vinyl_iw9_131, // 0x2f9
        vinyl_iw9_132, // 0x2fa
        vinyl_iw9_133, // 0x2fb
        vinyl_iw9_134, // 0x2fc
        vinyl_iw9_135, // 0x2fd
        vinyl_iw9_136, // 0x2fe
        vinyl_iw9_137, // 0x2ff
        vinyl_iw9_138, // 0x300
        vinyl_iw9_139, // 0x301
        vinyl_iw9_140, // 0x302
        vinyl_iw9_141, // 0x303
        vinyl_iw9_142, // 0x304
        vinyl_iw9_143, // 0x305
        vinyl_iw9_144, // 0x306
        vinyl_iw9_145, // 0x307
        vinyl_iw9_146, // 0x308
        vinyl_iw9_147, // 0x309
        vinyl_iw9_148, // 0x30a
        vinyl_iw9_149, // 0x30b
        vinyl_iw9_150, // 0x30c
        vinyl_iw9_151, // 0x30d
        vinyl_iw9_152, // 0x30e
        vinyl_iw9_153, // 0x30f
        vinyl_iw9_154, // 0x310
        vinyl_iw9_155, // 0x311
        vinyl_iw9_156, // 0x312
        vinyl_iw9_157, // 0x313
        vinyl_iw9_158, // 0x314
        vinyl_iw9_159, // 0x315
        vinyl_iw9_160, // 0x316
        vinyl_iw9_161, // 0x317
        vinyl_iw9_162, // 0x318
        vinyl_iw9_163, // 0x319
        vinyl_iw9_164, // 0x31a
        vinyl_iw9_165, // 0x31b
        vinyl_iw9_166, // 0x31c
        vinyl_iw9_167, // 0x31d
        vinyl_iw9_168, // 0x31e
        vinyl_iw9_169, // 0x31f
        vinyl_iw9_170, // 0x320
        vinyl_iw9_171, // 0x321
        vinyl_iw9_172, // 0x322
        vinyl_iw9_173, // 0x323
        vinyl_iw9_174, // 0x324
        vinyl_iw9_175, // 0x325
        vinyl_iw9_176, // 0x326
        vinyl_iw9_177, // 0x327
        vinyl_iw9_178, // 0x328
        vinyl_iw9_179, // 0x329
        vinyl_iw9_180, // 0x32a
        vinyl_iw9_181, // 0x32b
        vinyl_iw9_182, // 0x32c
        vinyl_iw9_183, // 0x32d
        vinyl_iw9_184, // 0x32e
        vinyl_iw9_185, // 0x32f
        vinyl_iw9_186, // 0x330
        vinyl_iw9_187, // 0x331
        vinyl_iw9_188, // 0x332
        vinyl_iw9_189, // 0x333
        vinyl_iw9_190, // 0x334
        vinyl_iw9_191, // 0x335
        vinyl_iw9_192, // 0x336
        vinyl_iw9_193, // 0x337
        vinyl_iw9_194, // 0x338
        vinyl_iw9_195, // 0x339
        vinyl_iw9_196, // 0x33a
        vinyl_iw9_197, // 0x33b
        vinyl_iw9_198, // 0x33c
        vinyl_iw9_199, // 0x33d
        vinyl_iw9_200, // 0x33e
        vinyl_iw9_201, // 0x33f
        vinyl_iw9_202, // 0x340
        vinyl_iw9_203, // 0x341
        vinyl_iw9_204, // 0x342
        vinyl_iw9_205, // 0x343
        vinyl_iw9_206, // 0x344
        vinyl_iw9_207, // 0x345
        vinyl_iw9_208, // 0x346
        vinyl_iw9_209, // 0x347
        vinyl_iw9_210, // 0x348
        vinyl_iw9_211, // 0x349
        vinyl_iw9_212, // 0x34a
        vinyl_iw9_213, // 0x34b
        vinyl_iw9_214, // 0x34c
        vinyl_iw9_215, // 0x34d
        vinyl_iw9_216, // 0x34e
        vinyl_iw9_217, // 0x34f
        vinyl_iw9_218, // 0x350
        vinyl_iw9_219, // 0x351
        vinyl_iw9_220, // 0x352
        vinyl_iw9_221, // 0x353
        vinyl_iw9_222, // 0x354
        vinyl_iw9_223, // 0x355
        vinyl_iw9_224, // 0x356
        vinyl_iw9_225, // 0x357
        vinyl_iw9_226, // 0x358
        vinyl_iw9_227, // 0x359
        vinyl_iw9_228, // 0x35a
        vinyl_iw9_229, // 0x35b
        vinyl_iw9_230, // 0x35c
        vinyl_iw9_231, // 0x35d
        vinyl_iw9_232, // 0x35e
        vinyl_iw9_233, // 0x35f
        vinyl_iw9_234, // 0x360
        vinyl_iw9_235, // 0x361
        vinyl_iw9_236, // 0x362
        vinyl_iw9_237, // 0x363
        vinyl_iw9_238, // 0x364
        vinyl_iw9_239, // 0x365
        vinyl_iw9_240, // 0x366
        vinyl_iw9_241, // 0x367
        vinyl_iw9_242, // 0x368
        vinyl_iw9_243, // 0x369
        vinyl_iw9_244, // 0x36a
        vinyl_iw9_245, // 0x36b
        vinyl_iw9_246, // 0x36c
        vinyl_iw9_247, // 0x36d
        vinyl_iw9_248, // 0x36e
        vinyl_iw9_249, // 0x36f
        vinyl_iw9_250, // 0x370
        vinyl_iw9_251, // 0x371
        vinyl_iw9_252, // 0x372
        vinyl_iw9_253, // 0x373
        vinyl_iw9_254, // 0x374
        vinyl_iw9_255, // 0x375
        vinyl_iw9_256, // 0x376
        vinyl_iw9_257, // 0x377
        vinyl_iw9_258, // 0x378
        vinyl_iw9_259, // 0x379
        vinyl_iw9_260, // 0x37a
        vinyl_iw9_261, // 0x37b
        vinyl_iw9_262, // 0x37c
        vinyl_iw9_263, // 0x37d
        vinyl_iw9_264, // 0x37e
        vinyl_iw9_265, // 0x37f
        vinyl_iw9_266, // 0x380
        vinyl_iw9_267, // 0x381
        vinyl_iw9_268, // 0x382
        vinyl_iw9_269, // 0x383
        vinyl_iw9_270, // 0x384
        vinyl_iw9_271, // 0x385
        vinyl_iw9_272, // 0x386
        vinyl_iw9_273, // 0x387
        vinyl_iw9_274, // 0x388
        vinyl_iw9_275, // 0x389
        vinyl_iw9_276, // 0x38a
        vinyl_iw9_277, // 0x38b
        vinyl_iw9_278, // 0x38c
        vinyl_iw9_279, // 0x38d
        vinyl_iw9_280, // 0x38e
        vinyl_iw9_281, // 0x38f
        vinyl_iw9_282, // 0x390
        vinyl_iw9_283, // 0x391
        vinyl_iw9_284, // 0x392
        vinyl_iw9_285, // 0x393
        vinyl_iw9_286, // 0x394
        vinyl_iw9_287, // 0x395
        vinyl_iw9_288, // 0x396
        vinyl_iw9_289, // 0x397
        vinyl_iw9_290, // 0x398
        vinyl_iw9_291, // 0x399
        vinyl_iw9_292, // 0x39a
        vinyl_iw9_293, // 0x39b
        vinyl_iw9_294, // 0x39c
        vinyl_iw9_295, // 0x39d
        vinyl_iw9_296, // 0x39e
        vinyl_iw9_297, // 0x39f
        vinyl_iw9_298, // 0x3a0
        vinyl_iw9_299, // 0x3a1
        vinyl_iw9_300, // 0x3a2
        vinyl_iw9_301, // 0x3a3
        vinyl_iw9_302, // 0x3a4
        vinyl_iw9_303, // 0x3a5
        vinyl_iw9_304, // 0x3a6
        vinyl_iw9_305, // 0x3a7
        vinyl_iw9_306, // 0x3a8
        vinyl_iw9_307, // 0x3a9
        vinyl_iw9_308, // 0x3aa
        vinyl_iw9_309, // 0x3ab
        vinyl_iw9_310, // 0x3ac
        vinyl_iw9_311, // 0x3ad
        vinyl_iw9_312, // 0x3ae
        vinyl_iw9_313, // 0x3af
        vinyl_iw9_314, // 0x3b0
        vinyl_iw9_315, // 0x3b1
        vinyl_iw9_316, // 0x3b2
        vinyl_iw9_317, // 0x3b3
        vinyl_iw9_318, // 0x3b4
        vinyl_iw9_319, // 0x3b5
        vinyl_iw9_320, // 0x3b6
        vinyl_iw9_321, // 0x3b7
        vinyl_iw9_322, // 0x3b8
        vinyl_iw9_323, // 0x3b9
        vinyl_iw9_324, // 0x3ba
        vinyl_iw9_325, // 0x3bb
        vinyl_iw9_326, // 0x3bc
        vinyl_iw9_327, // 0x3bd
        vinyl_iw9_328, // 0x3be
        vinyl_iw9_329, // 0x3bf
        vinyl_iw9_330, // 0x3c0
        vinyl_iw9_331, // 0x3c1
        vinyl_iw9_332, // 0x3c2
        vinyl_iw9_333, // 0x3c3
        vinyl_iw9_334, // 0x3c4
        vinyl_iw9_335, // 0x3c5
        vinyl_iw9_336, // 0x3c6
        vinyl_iw9_337, // 0x3c7
        vinyl_iw9_338, // 0x3c8
        vinyl_iw9_339, // 0x3c9
        vinyl_iw9_340, // 0x3ca
        vinyl_iw9_341, // 0x3cb
        vinyl_iw9_342, // 0x3cc
        vinyl_iw9_343, // 0x3cd
        vinyl_iw9_344, // 0x3ce
        vinyl_iw9_345, // 0x3cf
        vinyl_iw9_346, // 0x3d0
        vinyl_iw9_347, // 0x3d1
        vinyl_iw9_348, // 0x3d2
        vinyl_iw9_349, // 0x3d3
        vinyl_iw9_350, // 0x3d4
        vinyl_iw9_351, // 0x3d5
        vinyl_iw9_352, // 0x3d6
        vinyl_iw9_353, // 0x3d7
        vinyl_iw9_354, // 0x3d8
        vinyl_iw9_355, // 0x3d9
        vinyl_iw9_356, // 0x3da
        vinyl_iw9_357, // 0x3db
        vinyl_iw9_358, // 0x3dc
        vinyl_iw9_359, // 0x3dd
        vinyl_iw9_360, // 0x3de
        vinyl_iw9_361, // 0x3df
        vinyl_iw9_362, // 0x3e0
        vinyl_iw9_363, // 0x3e1
        vinyl_iw9_364, // 0x3e2
        vinyl_iw9_365, // 0x3e3
        vinyl_iw9_366, // 0x3e4
        vinyl_iw9_367, // 0x3e5
        vinyl_iw9_368, // 0x3e6
        vinyl_iw9_369, // 0x3e7
        vinyl_iw9_370, // 0x3e8
        vinyl_iw9_371, // 0x3e9
        vinyl_iw9_372, // 0x3ea
        vinyl_iw9_373, // 0x3eb
        vinyl_iw9_374, // 0x3ec
        vinyl_iw9_375, // 0x3ed
        vinyl_iw9_376, // 0x3ee
        vinyl_iw9_377, // 0x3ef
        vinyl_iw9_378, // 0x3f0
        vinyl_iw9_379, // 0x3f1
        vinyl_iw9_380, // 0x3f2
        vinyl_iw9_381, // 0x3f3
        vinyl_iw9_382, // 0x3f4
        vinyl_iw9_383, // 0x3f5
        vinyl_iw9_384, // 0x3f6
        vinyl_iw9_385, // 0x3f7
        vinyl_iw9_386, // 0x3f8
        vinyl_iw9_387, // 0x3f9
        vinyl_iw9_388, // 0x3fa
        vinyl_iw9_389, // 0x3fb
        vinyl_iw9_390, // 0x3fc
        vinyl_iw9_391, // 0x3fd
        vinyl_iw9_392, // 0x3fe
        vinyl_iw9_393, // 0x3ff
        vinyl_iw9_394, // 0x400
        vinyl_iw9_395, // 0x401
        vinyl_iw9_396, // 0x402
        vinyl_iw9_397, // 0x403
        vinyl_iw9_398, // 0x404
        vinyl_iw9_399, // 0x405
        vinyl_iw9_400, // 0x406
        vinyl_mgl_040, // 0x407
        sticker_mgl_082, // 0x408
        sticker_mgl_048, // 0x409
        vinyl_mgl_045, // 0x40a
        vinyl_mgl_041, // 0x40b
        sticker_mgl_040, // 0x40c
        vinyl_mgl_076, // 0x40d
        vinyl_mgl_070, // 0x40e
        vinyl_mgl_051, // 0x40f
        vinyl_mgl_069, // 0x410
        sticker_mgl_041, // 0x411
        sticker_mgl_042, // 0x412
        sticker_mgl_063, // 0x413
        sticker_mgl_072, // 0x414
        sticker_mgl_044, // 0x415
        sticker_mgl_045, // 0x416
        sticker_mgl_046, // 0x417
        sticker_mgl_047, // 0x418
        sticker_mgl_050, // 0x419
        sticker_mgl_051, // 0x41a
        sticker_mgl_052, // 0x41b
        sticker_mgl_053, // 0x41c
        sticker_mgl_055, // 0x41d
        sticker_mgl_056, // 0x41e
        sticker_mgl_057, // 0x41f
        sticker_mgl_058, // 0x420
        sticker_mgl_061, // 0x421
        sticker_mgl_062, // 0x422
        sticker_mgl_064, // 0x423
        sticker_mgl_065, // 0x424
        sticker_mgl_066, // 0x425
        sticker_mgl_067, // 0x426
        sticker_mgl_068, // 0x427
        sticker_mgl_069, // 0x428
        sticker_mgl_070, // 0x429
        sticker_mgl_071, // 0x42a
        sticker_mgl_074, // 0x42b
        sticker_mgl_075, // 0x42c
        sticker_mgl_078, // 0x42d
        sticker_mgl_079, // 0x42e
        sticker_mgl_080, // 0x42f
        sticker_mgl_081, // 0x430
        sticker_mgl_083, // 0x431
        sticker_mgl_084, // 0x432
        sticker_mgl_085, // 0x433
        sticker_mgl_086, // 0x434
        sticker_mgl_087, // 0x435
        sticker_mgl_088, // 0x436
        sticker_mgl_089, // 0x437
        sticker_mgl_090, // 0x438
        sticker_mgl_091, // 0x439
        sticker_mgl_093, // 0x43a
        sticker_mgl_094, // 0x43b
        sticker_mgl_095, // 0x43c
        sticker_mgl_096, // 0x43d
        sticker_mgl_097, // 0x43e
        sticker_mgl_098, // 0x43f
        sticker_mgl_099, // 0x440
        sticker_mgl_100, // 0x441
        sticker_mgl_101, // 0x442
        sticker_mgl_102, // 0x443
        sticker_mgl_103, // 0x444
        sticker_mgl_104, // 0x445
        sticker_mgl_105, // 0x446
        sticker_mgl_106, // 0x447
        sticker_mgl_108, // 0x448
        sticker_mgl_109, // 0x449
        sticker_mgl_110, // 0x44a
        sticker_mgl_111, // 0x44b
        sticker_mgl_112, // 0x44c
        sticker_mgl_114, // 0x44d
        sticker_mgl_115, // 0x44e
        sticker_mgl_117, // 0x44f
        sticker_mgl_118, // 0x450
        sticker_mgl_120, // 0x451
        sticker_mgl_121, // 0x452
        sticker_mgl_128, // 0x453
        sticker_mgl_138, // 0x454
        sticker_mgl_139, // 0x455
        sticker_mgl_140, // 0x456
        sticker_mgl_143, // 0x457
        sticker_mgl_146, // 0x458
        sticker_mgl_147, // 0x459
        sticker_mgl_148, // 0x45a
        sticker_mgl_149, // 0x45b
        sticker_mgl_150, // 0x45c
        sticker_mgl_151, // 0x45d
        sticker_mgl_152, // 0x45e
        sticker_mgl_153, // 0x45f
        sticker_mgl_155, // 0x460
        sticker_mgl_199, // 0x461
        vinyl_mgl_034, // 0x462
        vinyl_mgl_042, // 0x463
        vinyl_mgl_043, // 0x464
        vinyl_mgl_044, // 0x465
        vinyl_mgl_048, // 0x466
        vinyl_mgl_050, // 0x467
        vinyl_mgl_052, // 0x468
        vinyl_mgl_053, // 0x469
        vinyl_mgl_054, // 0x46a
        vinyl_mgl_055, // 0x46b
        vinyl_mgl_056, // 0x46c
        vinyl_mgl_057, // 0x46d
        vinyl_mgl_058, // 0x46e
        vinyl_mgl_059, // 0x46f
        vinyl_mgl_060, // 0x470
        vinyl_mgl_061, // 0x471
        vinyl_mgl_062, // 0x472
        vinyl_mgl_063, // 0x473
        vinyl_mgl_064, // 0x474
        vinyl_mgl_065, // 0x475
        vinyl_mgl_066, // 0x476
        vinyl_mgl_068, // 0x477
        vinyl_mgl_071, // 0x478
        vinyl_mgl_072, // 0x479
        vinyl_mgl_075, // 0x47a
        vinyl_mgl_077, // 0x47b
        vinyl_mgl_078, // 0x47c
        vinyl_mgl_079, // 0x47d
        vinyl_mgl_081, // 0x47e
        vinyl_mgl_082, // 0x47f
        vinyl_mgl_084, // 0x480
        vinyl_mgl_085, // 0x481
        vinyl_mgl_086, // 0x482
        vinyl_mgl_087, // 0x483
        vinyl_mgl_088, // 0x484
        vinyl_mgl_089, // 0x485
        vinyl_mgl_091, // 0x486
        vinyl_mgl_094, // 0x487
        vinyl_mgl_096, // 0x488
        vinyl_mgl_097, // 0x489
        vinyl_mgl_098, // 0x48a
        vinyl_mgl_099, // 0x48b
        vinyl_mgl_100, // 0x48c
        vinyl_mgl_103, // 0x48d
        vinyl_mgl_104, // 0x48e
        vinyl_mgl_105, // 0x48f
        vinyl_mgl_109, // 0x490
        vinyl_mgl_110, // 0x491
        vinyl_mgl_111, // 0x492
        vinyl_mgl_112, // 0x493
        vinyl_mgl_116, // 0x494
        vinyl_mgl_119, // 0x495
        vinyl_mgl_126, // 0x496
        vinyl_mgl_127, // 0x497
        vinyl_mgl_128, // 0x498
        vinyl_mgl_129, // 0x499
        vinyl_mgl_131, // 0x49a
        vinyl_mgl_135, // 0x49b
        vinyl_mgl_136, // 0x49c
        vinyl_mgl_137, // 0x49d
        vinyl_mgl_140, // 0x49e
        vinyl_mgl_141, // 0x49f
        vinyl_mgl_143, // 0x4a0
        vinyl_mgl_148, // 0x4a1
        vinyl_mgl_150, // 0x4a2
        vinyl_mgl_152, // 0x4a3
        vinyl_mgl_153, // 0x4a4
        vinyl_mgl_154, // 0x4a5
        vinyl_mgl_155, // 0x4a6
        vinyl_mgl_156, // 0x4a7
        jup_sticker_b4019_6, // 0x4a8
        jup_sticker_z4520_4, // 0x4a9
        jup_sticker_z4513_3, // 0x4aa
        jup_sticker_z4511_4, // 0x4ab
        jup_sticker_n4933_16, // 0x4ac
        jup_sticker_b3089_2, // 0x4ad
        jup_sticker_b3001_5, // 0x4ae
        jup_sticker_z4519_2, // 0x4af
        jup_sticker_z4518_6, // 0x4b0
        jup_sticker_z4516_3, // 0x4b1
        jup_sticker_z4512_5, // 0x4b2
        jup_sticker_z4510_6, // 0x4b3
        jup_sticker_b4033_5, // 0x4b4
        jup_sticker_b4006_5, // 0x4b5
        jup_sticker_n4917_2, // 0x4b6
        jup_sticker_b3076_2, // 0x4b7
        jup_sticker_b3073_2, // 0x4b8
        jup_sticker_b3077_2, // 0x4b9
        jup_sticker_n3921_2, // 0x4ba
        jup_sticker_n3917_3, // 0x4bb
        jup_sticker_b3080_8, // 0x4bc
        jup_sticker_b3075_2, // 0x4bd
        jup_sticker_b3074_2, // 0x4be
        jup_sticker_b3067_6, // 0x4bf
        jup_sticker_b3079_12, // 0x4c0
        jup_sticker_n3914_2, // 0x4c1
        jup_sticker_n3913_2, // 0x4c2
        jup_sticker_b3078_5, // 0x4c3
        jup_sticker_b3036_5, // 0x4c4
        jup_sticker_b3068_2, // 0x4c5
        jup_sticker_n3920_9, // 0x4c6
        jup_sticker_b3072_2, // 0x4c7
        jup_sticker_b3069_2, // 0x4c8
        jup_sticker_b3043_5, // 0x4c9
        jup_sticker_n3935_13, // 0x4ca
        jup_sticker_b3083_4, // 0x4cb
        jup_sticker_b3065_7, // 0x4cc
        jup_sticker_b3025_5, // 0x4cd
        jup_sticker_b3019_5, // 0x4ce
        jup_sticker_b3014_5, // 0x4cf
        jup_sticker_n3935_9, // 0x4d0
        jup_sticker_n3935_8, // 0x4d1
        jup_sticker_n3935_7, // 0x4d2
        jup_sticker_n3935_6, // 0x4d3
        jup_sticker_n3935_5, // 0x4d4
        jup_sticker_n3935_4, // 0x4d5
        jup_sticker_n3935_3, // 0x4d6
        jup_sticker_n3935_2, // 0x4d7
        jup_sticker_n3935_12, // 0x4d8
        jup_sticker_n3935_11, // 0x4d9
        jup_sticker_n3935_10, // 0x4da
        jup_sticker_b3070_2, // 0x4db
        jup_sticker_n3932_7, // 0x4dc
        jup_sticker_n3932_6, // 0x4dd
        jup_sticker_n3931_4, // 0x4de
        jup_sticker_n3929_4, // 0x4df
        jup_sticker_n3920_1, // 0x4e0
        jup_sticker_b3071_2, // 0x4e1
        jup_sticker_n3934_4, // 0x4e2
        jup_sticker_n3919_5, // 0x4e3
        jup_sticker_n3919_2, // 0x4e4
        jup_sticker_n3918_1, // 0x4e5
        jup_sticker_n3915_3, // 0x4e6
        jup_sticker_n3912_13, // 0x4e7
        jup_sticker_n3912_12, // 0x4e8
        jup_sticker_b3066_4, // 0x4e9
        jup_sticker_b3044_5, // 0x4ea
        jup_sticker_b3018_5, // 0x4eb
        jup_sticker_z3517_7, // 0x4ec
        jup_sticker_z3520_4, // 0x4ed
        jup_sticker_z3519_2, // 0x4ee
        jup_sticker_z3518_6, // 0x4ef
        jup_sticker_z3513_5, // 0x4f0
        jup_sticker_z3507_2, // 0x4f1
        jup_sticker_z3506_2, // 0x4f2
        jup_sticker_b3064_5, // 0x4f3
        jup_sticker_b3060_4, // 0x4f4
        jup_sticker_b3059_4, // 0x4f5
        jup_sticker_b3058_4, // 0x4f6
        jup_sticker_b3057_4, // 0x4f7
        jup_sticker_b3056_4, // 0x4f8
        jup_sticker_b3055_4, // 0x4f9
        jup_sticker_b3054_5, // 0x4fa
        jup_sticker_b3053_5, // 0x4fb
        jup_sticker_b3052_5, // 0x4fc
        jup_sticker_b3051_5, // 0x4fd
        jup_sticker_b3050_5, // 0x4fe
        jup_sticker_b3049_5, // 0x4ff
        jup_sticker_b3047_5, // 0x500
        jup_sticker_b3046_5, // 0x501
        jup_sticker_b3045_5, // 0x502
        jup_sticker_b3042_5, // 0x503
        jup_sticker_b3041_5, // 0x504
        jup_sticker_b3040_5, // 0x505
        jup_sticker_b3039_5, // 0x506
        jup_sticker_b3038_5, // 0x507
        jup_sticker_b3037_5, // 0x508
        jup_sticker_b3033_5, // 0x509
        jup_sticker_b3032_5, // 0x50a
        jup_sticker_b3031_11, // 0x50b
        jup_sticker_b3027_5, // 0x50c
        jup_sticker_b3024_5, // 0x50d
        jup_sticker_b3023_4, // 0x50e
        jup_sticker_b3016_5, // 0x50f
        jup_sticker_b3007_5, // 0x510
        jup_sticker_b3015_5, // 0x511
        jup_sticker_b3012_5, // 0x512
        jup_sticker_b3010_5, // 0x513
        jup_sticker_b3003_5, // 0x514
        jup_sticker_n2909_4, // 0x515
        jup_sticker_z2517_6, // 0x516
        jup_sticker_z2514_5, // 0x517
        jup_sticker_z2511_5, // 0x518
        jup_sticker_z2510_3, // 0x519
        jup_sticker_b2068_10, // 0x51a
        jup_sticker_n2920_5, // 0x51b
        jup_sticker_n2938_2, // 0x51c
        jup_sticker_n2931_1, // 0x51d
        jup_sticker_n2930_4, // 0x51e
        jup_sticker_n2929_7, // 0x51f
        jup_sticker_b2094_4, // 0x520
        jup_sticker_b2091_5, // 0x521
        jup_sticker_b2086_4, // 0x522
        jup_sticker_b2078_1, // 0x523
        jup_sticker_b2077_2, // 0x524
        jup_sticker_b2076_1, // 0x525
        jup_sticker_b2075_2, // 0x526
        jup_sticker_b2074_1, // 0x527
        jup_sticker_b2065_3, // 0x528
        jup_sticker_b2063_3, // 0x529
        jup_sticker_b2054_5, // 0x52a
        jup_sticker_b2048_5, // 0x52b
        jup_sticker_b2044_4, // 0x52c
        jup_sticker_b2041_4, // 0x52d
        jup_sticker_b2036_4, // 0x52e
        jup_sticker_b2035_4, // 0x52f
        jup_sticker_b2034_5, // 0x530
        jup_sticker_b2032_4, // 0x531
        jup_sticker_b2031_4, // 0x532
        jup_sticker_b2030_5, // 0x533
        jup_sticker_b2016_5, // 0x534
        jup_sticker_b2014_5, // 0x535
        jup_sticker_b2002_6, // 0x536
        jup_sticker_b2069_1, // 0x537
        jup_sticker_b2042_5, // 0x538
        jup_sticker_z2520_4, // 0x539
        jup_sticker_n2922_10, // 0x53a
        jup_sticker_n2921_12, // 0x53b
        jup_sticker_n2921_11, // 0x53c
        jup_sticker_z2518_6, // 0x53d
        jup_sticker_z2515_4, // 0x53e
        jup_sticker_z2513_5, // 0x53f
        jup_sticker_z2508_3, // 0x540
        jup_sticker_z2507_2, // 0x541
        jup_sticker_z2506_2, // 0x542
        jup_sticker_n2927_1, // 0x543
        jup_sticker_n2926_1, // 0x544
        jup_sticker_n1963_19, // 0x545
        jup_sticker_n1964_9, // 0x546
        jup_sticker_n1963_20, // 0x547
        jup_sticker_n2934_1, // 0x548
        jup_sticker_b2093_5, // 0x549
        jup_sticker_b2090_5, // 0x54a
        jup_sticker_b2089_4, // 0x54b
        jup_sticker_b2087_8, // 0x54c
        jup_sticker_b2083_12, // 0x54d
        jup_sticker_b2081_5, // 0x54e
        jup_sticker_b2073_2, // 0x54f
        jup_sticker_b2072_1, // 0x550
        jup_sticker_b2071_2, // 0x551
        jup_sticker_b2070_2, // 0x552
        jup_sticker_b2067_5, // 0x553
        jup_sticker_b2061_4, // 0x554
        jup_sticker_b2043_3, // 0x555
        jup_sticker_b2042_4, // 0x556
        jup_sticker_b2033_5, // 0x557
        jup_sticker_b2028_5, // 0x558
        jup_sticker_b2026_3, // 0x559
        jup_sticker_b2025_5, // 0x55a
        jup_sticker_b2019_5, // 0x55b
        jup_sticker_b2017_5, // 0x55c
        jup_sticker_b2013_5, // 0x55d
        jup_sticker_b2010_5, // 0x55e
        jup_sticker_b2004_5, // 0x55f
        sticker_jup_rh_phoenix_02, // 0x560
        sticker_jup_rh_bombsquad_02, // 0x561
        sticker_jup_rh_biowarfare_05, // 0x562
        sticker_jup_urban_techwear, // 0x563
        sticker_jup_holo_material, // 0x564
        sticker_jup_haunted_forest, // 0x565
        sticker_jup_paladin, // 0x566
        sticker_jup_rh_retroarcade_01, // 0x567
        sticker_jup_rh_transparentnearfuture_01, // 0x568
        sticker_jup_rh_christmas_01, // 0x569
        sticker_jup_rh_christmas_03, // 0x56a
        sticker_jup_opc_betarewards_02, // 0x56b
        sticker_jup_opc_teamsquads_02, // 0x56c
        sticker_jup_opc_badassmale_01, // 0x56d
        sticker_jup_opc_teamsquads_01, // 0x56e
        sticker_jup_rh_bombsquad_04, // 0x56f
        sticker_jup_rh_bombsquad_01, // 0x570
        sticker_jup_rh_dystopiansoldier_02, // 0x571
        sticker_jup_rh_popartanime_01, // 0x572
        sticker_jup_rh_soldierindesert_03, // 0x573
        sticker_jup_rh_soldierinforest_03, // 0x574
        sticker_jup_rh_geo_01, // 0x575
        sticker_jup_opc_gold_02, // 0x576
        sticker_jup_opc_eastasian_01, // 0x577
        sticker_jup_opc_skulls_03, // 0x578
        sticker_jup_opc_betarewards_01, // 0x579
        sticker_jup_opc_psyopscyberpunk_02, // 0x57a
        sticker_jup_rh_bugborg_01, // 0x57b
        sticker_jup_rh_christmas_02, // 0x57c
        sticker_jup_rh_comicbook_01, // 0x57d
        sticker_jup_rh_cryptocoin_01, // 0x57e
        sticker_jup_rh_soldierinspace_01, // 0x57f
        sticker_jup_rh_motorcycle_10, // 0x580
        sticker_jup_vegaslegion, // 0x581
        sticker_jup_torontoultra, // 0x582
        sticker_jup_optictexas, // 0x583
        sticker_jup_seattlesurge, // 0x584
        sticker_jup_newyorksubliners, // 0x585
        sticker_jup_rokkr, // 0x586
        sticker_jup_lathieves, // 0x587
        sticker_jup_laguerrillas, // 0x588
        sticker_jup_bostonbreach, // 0x589
        sticker_jup_atlantafaze, // 0x58a
        sticker_jup_morninggrind, // 0x58b
        sticker_jup_opc_warzoneseason1championsquest_01, // 0x58c
        sticker_jup_opc_codepack_01, // 0x58d
        sticker_jup_opc_egyptian_01, // 0x58e
        sticker_jup_opc_medicalxray_01, // 0x58f
        sticker_jup_rh_neon_08, // 0x590
        sticker_jup_opc_badcowboy_01, // 0x591
        sticker_jup_opc_jadescrollwork_01, // 0x592
        sticker_jup_opc_tropicalfruit_01, // 0x593
        sticker_jup_opc_classicaltechfractal_01, // 0x594
        sticker_jup_opc_polymertrooper_01, // 0x595
        sticker_jup_opc_foundersweek_rewards_01, // 0x596
        sticker_jup_opc_codeben_01, // 0x597
        sticker_jup_opc_challengeeventrewardswinterholiday_01, // 0x598
        sticker_jup_rh_bombsquad_06, // 0x599
        sticker_jup_rh_bombsquad_10, // 0x59a
        sticker_jup_rh_neon_04, // 0x59b
        sticker_jup_rh_nightvision_10, // 0x59c
        sticker_jup_opc_bulletpackrubberduck_01, // 0x59d
        sticker_jup_opc_graphicart_01, // 0x59e
        sticker_jup_gg, // 0x59f
        sticker_jup_360noscope, // 0x5a0
        sticker_jup_haveaniceday, // 0x5a1
        sticker_jup_chiefskiss, // 0x5a2
        sticker_jup_fieldrepeventrewardsnewyear_01, // 0x5a3
        sticker_jup_opc_fieldrepeventrewardscode_01, // 0x5a4
        sticker_jup_opc_fieldrepeventrewardsmakarov_01, // 0x5a5
        sticker_jup_opc_persistentmprankedplay_01, // 0x5a6
        sticker_jup_opc_warzoneseason1_22, // 0x5a7
        sticker_jup_opc_warzoneseason1_21, // 0x5a8
        sticker_jup_opc_warzoneseason1_13, // 0x5a9
        sticker_jup_opc_warzoneseason1_05, // 0x5aa
        sticker_jup_opc_warzoneseason1_03, // 0x5ab
        sticker_jup_opc_warzoneseason1_02, // 0x5ac
        sticker_jup_opc_warzoneseason1_01, // 0x5ad
        sticker_jup_valentine256, // 0x5ae
        sticker_jup_aftn, // 0x5af
        sticker_jup_padlock_stickers_01, // 0x5b0
        sticker_jup_opc_outbreaklaunchrewards_01, // 0x5b1
        sticker_jup_opc_outbreaklaunchrewards_02, // 0x5b2
        sticker_jup_opc_outbreaklaunchrewards_03, // 0x5b3
        jup_sticker_opc_warzoneseason1_07, // 0x5b4
        jup_sticker_opc_warzoneseason1_09, // 0x5b5
        jup_sticker_opc_warzoneseason1_10, // 0x5b6
        jup_sticker_opc_warzoneseason1_11, // 0x5b7
        jup_sticker_opc_warzoneseason1_12, // 0x5b8
        jup_sticker_opc_warzoneseason1_18, // 0x5b9
        jup_sticker_opc_warzoneseason1_25, // 0x5ba
        jup_sticker_opc_warzoneseason1_26, // 0x5bb
        jup_sticker_opc_warzoneseason1_27, // 0x5bc
        jup_sticker_opc_warzoneseason1_28, // 0x5bd
        jup_sticker_opc_season1mprankedplay_01, // 0x5be
        jup_sticker_opc_fieldrepeventrewardsptwo_01, // 0x5bf
        jup_sticker_opc_codepartner_01, // 0x5c0
        jup_sticker_opc_monsterenergypartnership_01, // 0x5c1
        JUP_sticker_OPC_WarzoneSeason1_24, // 0x5c2
        JUP_sticker_OPC_WarzoneSeason1_23, // 0x5c3
        JUP_sticker_OPC_WarzoneSeason1_17, // 0x5c4
        JUP_sticker_OPC_WarzoneSeason1_16, // 0x5c5
        JUP_sticker_OPC_WarzoneSeason1_15, // 0x5c6
        JUP_sticker_OPC_WarzoneSeason1_14, // 0x5c7
        JUP_sticker_OPC_WarzoneSeason1_08, // 0x5c8
        JUP_sticker_OPC_WarzoneSeason1_06, // 0x5c9
        JUP_sticker_OPC_WarzoneSeason1_04, // 0x5ca
        jup_Miami_Heretics_Sticker, // 0x5cb
        jup_Carolina_Royale_Ravens_Sticker, // 0x5cc
        sticker_jup_rh_transparentfuture_01, // 0x5cd
        jup_sticker_opc_fieldrepeventrewardspone_01, // 0x5ce
        jup_sticker_rh_bombsquad_09, // 0x5cf
        sticker_jup_og_adam, // 0x5d0
        jup_sticker_ptwo_eta, // 0x5d1
        jup_sticker_ptwo_zeta, // 0x5d2
        jup_vinyl_b4017_4, // 0x5d3
        jup_vinyl_b4017_5, // 0x5d4
        jup_vinyl_b4033_3, // 0x5d5
        jup_vinyl_n4921_4, // 0x5d6
        jup_vinyl_z4512_6, // 0x5d7
        jup_vinyl_z4514_4, // 0x5d8
        jup_vinyl_z4515_5, // 0x5d9
        jup_vinyl_z4517_5, // 0x5da
        jup_vinyl_b3089_3, // 0x5db
        jup_vinyl_b3082_5, // 0x5dc
        jup_vinyl_b3081_5, // 0x5dd
        jup_vinyl_z4507_2, // 0x5de
        jup_vinyl_b3050_4, // 0x5df
        jup_vinyl_b4006_4, // 0x5e0
        jup_vinyl_b4015_7, // 0x5e1
        jup_vinyl_b4033_4, // 0x5e2
        jup_vinyl_n4917_3, // 0x5e3
        jup_vinyl_b3077_1, // 0x5e4
        jup_vinyl_b3001_4, // 0x5e5
        jup_vinyl_b3076_1, // 0x5e6
        jup_vinyl_b3073_1, // 0x5e7
        jup_vinyl_b3075_1, // 0x5e8
        jup_vinyl_n3917_4, // 0x5e9
        jup_vinyl_b3080_7, // 0x5ea
        jup_vinyl_b3078_4, // 0x5eb
        jup_vinyl_b3074_1, // 0x5ec
        jup_vinyl_b3067_5, // 0x5ed
        jup_vinyl_n3913_24, // 0x5ee
        jup_vinyl_n3913_23, // 0x5ef
        jup_vinyl_n3913_22, // 0x5f0
        jup_vinyl_n3913_21, // 0x5f1
        jup_vinyl_n3913_20, // 0x5f2
        jup_vinyl_n3913_19, // 0x5f3
        jup_vinyl_n3913_3, // 0x5f4
        jup_vinyl_n3921_4, // 0x5f5
        jup_vinyl_n3921_3, // 0x5f6
        jup_vinyl_b3078_6, // 0x5f7
        jup_vinyl_b3036_4, // 0x5f8
        jup_vinyl_n3911_3, // 0x5f9
        jup_vinyl_b3072_1, // 0x5fa
        jup_vinyl_b3070_1, // 0x5fb
        jup_vinyl_n3914_3, // 0x5fc
        jup_vinyl_b3069_1, // 0x5fd
        jup_vinyl_b3068_1, // 0x5fe
        jup_vinyl_b3043_4, // 0x5ff
        jup_vinyl_b3083_3, // 0x600
        jup_vinyl_b3065_5, // 0x601
        jup_vinyl_b3060_3, // 0x602
        jup_vinyl_b3059_3, // 0x603
        jup_vinyl_b3058_3, // 0x604
        jup_vinyl_b3057_3, // 0x605
        jup_vinyl_b3056_3, // 0x606
        jup_vinyl_b3055_3, // 0x607
        jup_vinyl_b3054_4, // 0x608
        jup_vinyl_b3052_4, // 0x609
        jup_vinyl_b3046_4, // 0x60a
        jup_vinyl_b3042_4, // 0x60b
        jup_vinyl_b3033_4, // 0x60c
        jup_vinyl_b3027_4, // 0x60d
        jup_vinyl_b3026_4, // 0x60e
        jup_vinyl_b3024_4, // 0x60f
        jup_vinyl_b3023_3, // 0x610
        jup_vinyl_b3019_4, // 0x611
        jup_vinyl_b3016_4, // 0x612
        jup_vinyl_b3015_4, // 0x613
        jup_vinyl_b3014_4, // 0x614
        jup_vinyl_b3011_4, // 0x615
        jup_vinyl_b3009_4, // 0x616
        jup_vinyl_b3007_4, // 0x617
        jup_vinyl_n3918_3, // 0x618
        jup_vinyl_n3918_2, // 0x619
        jup_vinyl_n3920_3, // 0x61a
        jup_vinyl_n3920_2, // 0x61b
        jup_vinyl_b3071_1, // 0x61c
        jup_vinyl_n3934_3, // 0x61d
        jup_vinyl_n3919_4, // 0x61e
        jup_vinyl_b3051_4, // 0x61f
        jup_vinyl_b3044_4, // 0x620
        jup_vinyl_b3041_4, // 0x621
        jup_vinyl_b3040_4, // 0x622
        jup_vinyl_z3511_7, // 0x623
        jup_vinyl_z3506_5, // 0x624
        jup_vinyl_z3519_3, // 0x625
        jup_vinyl_z3513_6, // 0x626
        jup_vinyl_z3507_5, // 0x627
        jup_vinyl_z3503_5, // 0x628
        jup_vinyl_z3516_4, // 0x629
        jup_vinyl_z3502_2, // 0x62a
        jup_vinyl_b3079_7, // 0x62b
        jup_vinyl_b3079_6, // 0x62c
        jup_vinyl_b3053_4, // 0x62d
        jup_vinyl_b3049_4, // 0x62e
        jup_vinyl_b3047_4, // 0x62f
        jup_vinyl_b3045_4, // 0x630
        jup_vinyl_b3039_4, // 0x631
        jup_vinyl_b3038_4, // 0x632
        jup_vinyl_b3037_4, // 0x633
        jup_vinyl_b3032_4, // 0x634
        jup_vinyl_b3031_10, // 0x635
        jup_vinyl_b3030_4, // 0x636
        jup_vinyl_b3029_4, // 0x637
        jup_vinyl_b3028_4, // 0x638
        jup_vinyl_b3025_4, // 0x639
        jup_vinyl_b3021_5, // 0x63a
        jup_vinyl_b3018_4, // 0x63b
        jup_vinyl_b3017_5, // 0x63c
        jup_vinyl_b3013_5, // 0x63d
        jup_vinyl_b3012_4, // 0x63e
        jup_vinyl_b3010_4, // 0x63f
        jup_vinyl_b3003_4, // 0x640
        jup_vinyl_b3034_6, // 0x641
        jup_vinyl_b2093_4, // 0x642
        jup_vinyl_b2068_3, // 0x643
        jup_vinyl_n2920_4, // 0x644
        jup_vinyl_b2007_7, // 0x645
        jup_vinyl_n2931_3, // 0x646
        jup_vinyl_n2931_2, // 0x647
        jup_vinyl_n2929_12, // 0x648
        jup_vinyl_b2094_3, // 0x649
        jup_vinyl_b2091_4, // 0x64a
        jup_vinyl_b2086_3, // 0x64b
        jup_vinyl_b2085_4, // 0x64c
        jup_vinyl_b2080_6, // 0x64d
        jup_vinyl_b2079_5, // 0x64e
        jup_vinyl_b2078_2, // 0x64f
        jup_vinyl_b2077_1, // 0x650
        jup_vinyl_b2076_2, // 0x651
        jup_vinyl_b2075_1, // 0x652
        jup_vinyl_b2074_2, // 0x653
        jup_vinyl_b2065_2, // 0x654
        jup_vinyl_b2063_2, // 0x655
        jup_vinyl_b2059_3, // 0x656
        jup_vinyl_b2055_3, // 0x657
        jup_vinyl_b2054_4, // 0x658
        jup_vinyl_b2050_4, // 0x659
        jup_vinyl_b2048_4, // 0x65a
        jup_vinyl_b2045_3, // 0x65b
        jup_vinyl_b2044_3, // 0x65c
        jup_vinyl_b2041_3, // 0x65d
        jup_vinyl_b2036_3, // 0x65e
        jup_vinyl_b2035_3, // 0x65f
        jup_vinyl_b2034_4, // 0x660
        jup_vinyl_b2032_3, // 0x661
        jup_vinyl_b2031_3, // 0x662
        jup_vinyl_b2030_4, // 0x663
        jup_vinyl_b2016_4, // 0x664
        jup_vinyl_b2014_4, // 0x665
        jup_vinyl_b2011_4, // 0x666
        jup_vinyl_b2009_4, // 0x667
        jup_vinyl_b2008_4, // 0x668
        jup_vinyl_b2002_5, // 0x669
        jup_vinyl_n2934_3, // 0x66a
        jup_vinyl_z2519_3, // 0x66b
        jup_vinyl_z2516_4, // 0x66c
        jup_vinyl_z2513_6, // 0x66d
        jup_vinyl_z2507_5, // 0x66e
        jup_vinyl_z2506_5, // 0x66f
        jup_vinyl_z2503_5, // 0x670
        jup_vinyl_z2502_2, // 0x671
        jup_vinyl_n2938_3, // 0x672
        jup_vinyl_n2934_2, // 0x673
        jup_vinyl_n2928_4, // 0x674
        jup_vinyl_n2926_3, // 0x675
        jup_vinyl_n2926_2, // 0x676
        jup_vinyl_n2925_3, // 0x677
        jup_vinyl_n2922_11, // 0x678
        jup_vinyl_n2903_7, // 0x679
        jup_vinyl_n1964_10, // 0x67a
        jup_vinyl_n1964_8, // 0x67b
        jup_vinyl_n1964_7, // 0x67c
        jup_vinyl_n1964_6, // 0x67d
        jup_vinyl_n1964_5, // 0x67e
        jup_vinyl_n1964_4, // 0x67f
        jup_vinyl_n1964_3, // 0x680
        jup_vinyl_n1963_5, // 0x681
        jup_vinyl_b2090_4, // 0x682
        jup_vinyl_b2089_3, // 0x683
        jup_vinyl_b2088_4, // 0x684
        jup_vinyl_b2087_4, // 0x685
        jup_vinyl_b2084_4, // 0x686
        jup_vinyl_b2083_11, // 0x687
        jup_vinyl_b2081_4, // 0x688
        jup_vinyl_b2073_1, // 0x689
        jup_vinyl_b2072_2, // 0x68a
        jup_vinyl_b2071_1, // 0x68b
        jup_vinyl_b2070_1, // 0x68c
        jup_vinyl_b2069_5, // 0x68d
        jup_vinyl_b2061_3, // 0x68e
        jup_vinyl_b2058_3, // 0x68f
        jup_vinyl_b2057_3, // 0x690
        jup_vinyl_b2056_3, // 0x691
        jup_vinyl_b2052_3, // 0x692
        jup_vinyl_b2043_2, // 0x693
        jup_vinyl_b2042_3, // 0x694
        jup_vinyl_b2040_4, // 0x695
        jup_vinyl_b2039_4, // 0x696
        jup_vinyl_b2038_4, // 0x697
        jup_vinyl_b2033_4, // 0x698
        jup_vinyl_b2028_4, // 0x699
        jup_vinyl_b2026_2, // 0x69a
        jup_vinyl_b2025_4, // 0x69b
        jup_vinyl_b2019_4, // 0x69c
        jup_vinyl_b2017_4, // 0x69d
        jup_vinyl_b2013_4, // 0x69e
        jup_vinyl_b2010_4, // 0x69f
        jup_vinyl_b2006_5, // 0x6a0
        vinyl_jup_codmas_01, // 0x6a1
        vinyl_jup_opc_fieldrepeventrewardspone_02, // 0x6a2
        vinyl_jup_smooth_obsidian, // 0x6a3
        vinyl_jup_opc_betarewards_01, // 0x6a4
        vinyl_jup_rh_infrared_01, // 0x6a5
        vinyl_jup_rh_text_06, // 0x6a6
        vinyl_jup_rh_nightvision_02, // 0x6a7
        vinyl_jup_rh_text_03, // 0x6a8
        vinyl_jup_rh_geometric_03, // 0x6a9
        vinyl_jup_rh_geometric_01, // 0x6aa
        vinyl_jup_rh_fireflame_02, // 0x6ab
        vinyl_jup_rh_crystal_01, // 0x6ac
        vinyl_jup_rh_geometric_10, // 0x6ad
        vinyl_jup_rh_geometric_08, // 0x6ae
        vinyl_jup_rh_text_02, // 0x6af
        vinyl_jup_rh_celtic_01, // 0x6b0
        vinyl_jup_rh_nebula_01, // 0x6b1
        vinyl_jup_rh_mirrorinverted_01, // 0x6b2
        vinyl_jup_rh_greekmyth_02, // 0x6b3
        vinyl_jup_rh_greekgodhades_01, // 0x6b4
        vinyl_jup_rh_cryptid_01, // 0x6b5
        vinyl_jup_rh_aetherium_01, // 0x6b6
        vinyl_jup_rh_text_10, // 0x6b7
        vinyl_jup_rh_hacker_01, // 0x6b8
        vinyl_jup_rh_aztec_02, // 0x6b9
        vinyl_jup_rh_nightvision_01, // 0x6ba
        vinyl_jup_rh_alebrijes_02, // 0x6bb
        vinyl_jup_rh_neon_02, // 0x6bc
        vinyl_jup_rh_newyear_01, // 0x6bd
        vinyl_jup_rh_undeadsanta_01, // 0x6be
        vinyl_jup_rh_echo_01, // 0x6bf
        vinyl_jup_rh_fireflame_01, // 0x6c0
        vinyl_jup_vegaslegion, // 0x6c1
        vinyl_jup_torontoultra, // 0x6c2
        vinyl_jup_optictexas, // 0x6c3
        vinyl_jup_seattlesurge, // 0x6c4
        vinyl_jup_newyorksubliners, // 0x6c5
        vinyl_jup_minrokkr, // 0x6c6
        vinyl_jup_lathieves, // 0x6c7
        vinyl_jup_laguerrillas, // 0x6c8
        vinyl_jup_bostonbreach, // 0x6c9
        vinyl_jup_atlantafaze, // 0x6ca
        vinyl_jup_letemcook, // 0x6cb
        vinyl_jup_opc_internalemployeegift_01, // 0x6cc
        vinyl_jup_opc_foundersweek_rewards_01, // 0x6cd
        vinyl_jup_opc_fieldrepeventrewardscode_02, // 0x6ce
        vinyl_jup_opc_fieldrepeventrewardsnewyear_01, // 0x6cf
        vinyl_jup_opc_fieldrepeventrewardsnewyear_02, // 0x6d0
        vinyl_jup_opc_fieldrepeventrewardscode_01, // 0x6d1
        vinyl_jup_opc_influencerrelationsdecember_01, // 0x6d2
        vinyl_jup_opc_influencerrelationsnovember_01, // 0x6d3
        jup_vinyl_rh_graffiti_01, // 0x6d4
        jup_vinyl_opc_challengeeventrewardsptwo1_01, // 0x6d5
        jup_vinyl_opc_fieldrepeventrewardsptwo_01, // 0x6d6
        jup_vinyl_opc_fieldrepeventrewardsmakarov_01, // 0x6d7
        jup_vinyl_opc_persistentmprankedplay_01, // 0x6d8
        jup_vinyl_opc_warzone_01, // 0x6d9
        jup_vinyl_opc_monsterenergypartnership_02, // 0x6da
        jup_vinyl_opc_monsterenergypartnership_03, // 0x6db
        jup_vinyl_opc_hyperxpartnership_01, // 0x6dc
        jup_vinyl_opc_mplaunch_01, // 0x6dd
        jup_vinyl_opc_warzone_launch_01, // 0x6de
        jup_shg_season_1_rewards_vinyl_v01, // 0x6df
        JUP_vinyl_OPC_FieldRepEventRewardsPone_01, // 0x6e0
        JUP_vinyl_OPC_FieldRepEventRewardsPtwo_02, // 0x6e1
        JUP_vinyl_OPC_ChallengeEventRewardsPtwo2_01_A, // 0x6e2
        JUP_vinyl_WarzoneSeason1_04, // 0x6e3
        JUP_vinyl_WarzoneSeason1_03, // 0x6e4
        JUP_vinyl_OPC_Warzone_02, // 0x6e5
        jup_Carolina_Royal_Ravens_vinyl, // 0x6e6
        jup_Miami_Heretics_vinyl, // 0x6e7
        jup_vinyl_warzoneseason1_championsquest_09, // 0x6e8
        jup_vinyl_fieldrepeventrewards_terminus, // 0x6e9
        vinyl_mgl_106, // 0x6ea
        sticker_cer_000_temp, // 0x6eb
        sticker_cer_001_parasite, // 0x6ec
        sticker_cer_002_1980s_arsenal, // 0x6ed
        sticker_cer_003_mime, // 0x6ee
        sticker_cer_004_1960scifi, // 0x6ef
        sticker_cer_005_exec, // 0x6f0
        sticker_cer_006_in_endow15, // 0x6f1
        sticker_cer_007_in_90splaid, // 0x6f2
        sticker_cer_008_bsnake, // 0x6f3
        sticker_cer_009_vertigo, // 0x6f4
        sticker_cer_010_90slasher, // 0x6f5
        sticker_cer_011_zomext, // 0x6f6
        sticker_cer_012_cdl_teama, // 0x6f7
        sticker_cer_013_turkey, // 0x6f8
        sticker_cer_014_sp, // 0x6f9
        sticker_cer_015_graphiczombie, // 0x6fa
        sticker_cer_016_in_endow, // 0x6fb
        sticker_cer_017_cdl_teamb, // 0x6fc
        sticker_cer_018_cdl_teamc, // 0x6fd
        sticker_cer_019_cdl_teamd, // 0x6fe
        sticker_cer_020_cdl_teame, // 0x6ff
        sticker_cer_021_cdl_teamf, // 0x700
        sticker_cer_022_cdl_teamg, // 0x701
        sticker_cer_023_cdl_teamh, // 0x702
        sticker_cer_024_cdl_teami, // 0x703
        sticker_cer_025_cdl_teamj, // 0x704
        sticker_cer_026_cdl_teamk, // 0x705
        sticker_cer_027_cdl_teaml, // 0x706
        sticker_cer_028_cdl_launch, // 0x707
        sticker_cer_029_zombieslayer, // 0x708
        sticker_cer_030_bps1_p11, // 0x709
        sticker_cer_031_90shiphop, // 0x70a
        sticker_cer_032_manga, // 0x70b
        sticker_cer_033_camo, // 0x70c
        sticker_cer_034_plastic, // 0x70d
        sticker_cer_035_in_views, // 0x70e
        sticker_cer_036_in_views, // 0x70f
        sticker_cer_037_in_views2, // 0x710
        sticker_cer_038_in_views2, // 0x711
        sticker_cer_039_sp, // 0x712
        sticker_cer_040_bps1_p2, // 0x713
        sticker_cer_041_bps1_p3, // 0x714
        sticker_cer_042_bps1_p8, // 0x715
        sticker_cer_043_rp_s3, // 0x716
        sticker_cer_044_bps1_ig, // 0x717
        sticker_cer_045_rp_s4, // 0x718
        sticker_cer_046_rp_s4_2, // 0x719
        sticker_cer_047_rp_s4_3, // 0x71a
        sticker_cer_048_rps4_3, // 0x71b
        sticker_cer_049_zm_dig, // 0x71c
        sticker_cer_050_fem_fatale, // 0x71d
        sticker_cer_051_wizard, // 0x71e
        sticker_cer_052_vtuber, // 0x71f
        sticker_cer_053_ferrofluid, // 0x720
        sticker_cer_054_cdplayer, // 0x721
        sticker_cer_055_presidentsday, // 0x722
        sticker_cer_056_alone, // 0x723
        sticker_cer_057_explosive, // 0x724
        sticker_cer_058_hacker, // 0x725
        sticker_cer_059_aerospace, // 0x726
        sticker_cer_060_jack, // 0x727
        sticker_cer_061_s2sb_12376, // 0x728
        sticker_cer_062_in_mon, // 0x729
        sticker_cer_063_bps1_p13, // 0x72a
        sticker_cer_064_stingray_mp, // 0x72b
        sticker_cer_065_ev, // 0x72c
        sticker_cer_066_bps1_p5, // 0x72d
        sticker_cer_066_wz_rps1, // 0x72e
        sticker_cer_068_bps2, // 0x72f
        sticker_cer_070_bps2, // 0x730
        sticker_cer_071_bps2, // 0x731
        sticker_cer_072_bps2, // 0x732
        sticker_cer_073_bps2, // 0x733
        sticker_cer_074_bps2, // 0x734
        sticker_cer_075_s2ev, // 0x735
        sticker_cer_076_s2cdl, // 0x736
        sticker_cer_077_s2cdl, // 0x737
        sticker_cer_078_s2mon, // 0x738
        sticker_cer_079_bps2, // 0x739
        sticker_cer_080_verd, // 0x73a
        sticker_cer_081_s2_5_dr, // 0x73b
        sticker_cer_082_boba, // 0x73c
        sticker_cer_083_jasmine, // 0x73d
        sticker_cer_084_pat, // 0x73e
        sticker_cer_085_cdl, // 0x73f
        sticker_cer_086_cdl, // 0x740
        sticker_cer_087_cdl, // 0x741
        sticker_cer_088_wz_rps3, // 0x742
        sticker_cer_089_bp_s3, // 0x743
        sticker_cer_090_bp_s3, // 0x744
        sticker_cer_091_bp_s3, // 0x745
        sticker_cer_092_bp_s3, // 0x746
        sticker_cer_093_bp_s3, // 0x747
        sticker_cer_094_b06, // 0x748
        sticker_cer_095_b06, // 0x749
        sticker_cer_096_b06, // 0x74a
        sticker_cer_097_cdl, // 0x74b
        sticker_cer_098_hammer, // 0x74c
        sticker_cer_099_fantasy, // 0x74d
        sticker_cer_100_bacon, // 0x74e
        sticker_cer_101_hydro, // 0x74f
        sticker_cer_102_green, // 0x750
        sticker_cer_103_joke, // 0x751
        sticker_cer_104_haunt, // 0x752
        sticker_cer_105_cel, // 0x753
        sticker_cer_107_mam, // 0x754
        sticker_cer_108_cucumber, // 0x755
        sticker_cer_109_darkmagic, // 0x756
        sticker_cer_110_deep, // 0x757
        sticker_cer_111_hear, // 0x758
        sticker_cer_112_mam, // 0x759
        sticker_cer_113_delta, // 0x75a
        vinyl_cer_096_delta, // 0x75b
        vinyl_cer_095_car, // 0x75c
        vinyl_cer_094_enforcer, // 0x75d
        vinyl_cer_093_bubble, // 0x75e
        vinyl_cer_092_peeks, // 0x75f
        vinyl_cer_091_atom, // 0x760
        vinyl_cer_090_necro, // 0x761
        vinyl_cer_089_cucumber, // 0x762
        vinyl_cer_088_420, // 0x763
        vinyl_cer_081_rps3, // 0x764
        vinyl_cer_080_lettuce, // 0x765
        vinyl_cer_079_bacon, // 0x766
        vinyl_cer_078_fantasy, // 0x767
        vinyl_cer_077_cor, // 0x768
        vinyl_cer_076_b06, // 0x769
        vinyl_cer_075_bp_s3, // 0x76a
        vinyl_cer_074_bp_s3, // 0x76b
        vinyl_cer_073_bp_s3, // 0x76c
        vinyl_cer_072_bp_s3, // 0x76d
        vinyl_cer_071_cdl, // 0x76e
        vinyl_cer_070_taro, // 0x76f
        vinyl_cer_069_rps1_wr, // 0x770
        vinyl_cer_068_rps1_sil, // 0x771
        vinyl_cer_067_wz_vic, // 0x772
        vinyl_cer_066_wz_rps1_07, // 0x773
        vinyl_cer_065_wz_rps1_06, // 0x774
        vinyl_cer_064_wz_rps1_05, // 0x775
        vinyl_cer_063_wz_rps1_04, // 0x776
        vinyl_cer_062_wz_rps1_03, // 0x777
        vinyl_cer_061_wz_rps1_02, // 0x778
        vinyl_cer_060_wz_rps1_01, // 0x779
        vinyl_cer_059_s1rp, // 0x77a
        vinyl_cer_058_s1rp, // 0x77b
        vinyl_cer_057_s1rp, // 0x77c
        vinyl_cer_056_s1rp, // 0x77d
        vinyl_cer_055_s1rp, // 0x77e
        vinyl_cer_054_s1rp, // 0x77f
        vinyl_cer_053_wz_ftue, // 0x780
        vinyl_cer_052_s1fieldrep, // 0x781
        vinyl_cer_051_bps2_p8, // 0x782
        vinyl_cer_051_bps1_p2, // 0x783
        vinyl_cer_050_bps2_p13, // 0x784
        vinyl_cer_049_bps2_p8, // 0x785
        vinyl_cer_048_bps2_p4, // 0x786
        vinyl_cer_047_verd, // 0x787
        vinyl_cer_044_ng, // 0x788
        vinyl_cer_043_verd_ev, // 0x789
        vinyl_cer_042_rps2, // 0x78a
        vinyl_cer_040_molly, // 0x78b
        vinyl_cer_039_cyborg, // 0x78c
        vinyl_cer_038_in_mon2, // 0x78d
        vinyl_cer_037_in_cor, // 0x78e
        vinyl_cer_036_in_mon, // 0x78f
        vinyl_cer_035_s1sb_12376, // 0x790
        vinyl_cer_034_hunter, // 0x791
        vinyl_cer_033_assassin, // 0x792
        vinyl_cer_032_carnival, // 0x793
        vinyl_cer_031_joke, // 0x794
        vinyl_cer_030_punk, // 0x795
        vinyl_cer_029_in_mons1, // 0x796
        vinyl_cer_028_bloody, // 0x797
        vinyl_cer_027_s1bp_p14, // 0x798
        vinyl_cer_026_s1bp_p8, // 0x799
        vinyl_cer_025_s1bp_p5, // 0x79a
        vinyl_cer_024_ghillie, // 0x79b
        vinyl_cer_023_cdl_launch, // 0x79c
        vinyl_cer_022_cdl_teaml, // 0x79d
        vinyl_cer_021_cdl_teamk, // 0x79e
        vinyl_cer_020_cdl_teamj, // 0x79f
        vinyl_cer_019_cdl_teami, // 0x7a0
        vinyl_cer_018_cdl_teamh, // 0x7a1
        vinyl_cer_017_cdl_teamg, // 0x7a2
        vinyl_cer_016_cdl_teamf, // 0x7a3
        vinyl_cer_015_cdl_teame, // 0x7a4
        vinyl_cer_014_cdl_teamd, // 0x7a5
        vinyl_cer_013_cdl_teamc, // 0x7a6
        vinyl_cer_012_cdl_teamb, // 0x7a7
        vinyl_cer_011_cdl_teama, // 0x7a8
        vinyl_cer_010_slick, // 0x7a9
        vinyl_cer_009_rps1, // 0x7aa
        vinyl_cer_008_rider, // 0x7ab
        vinyl_cer_007_art, // 0x7ac
        vinyl_cer_006_goggle, // 0x7ad
        vinyl_cer_005_shark, // 0x7ae
        vinyl_cer_004_animal, // 0x7af
        vinyl_cer_003_biker, // 0x7b0
        vinyl_cer_002_zm_rm, // 0x7b1
        vinyl_cer_001_rps1, // 0x7b2
        vinyl_cer_000_temp, // 0x7b3
        jup_sticker_b4001_14, // 0x7b4
        jup_sticker_b4001_9, // 0x7b5
        jup_sticker_b4002_14, // 0x7b6
        jup_sticker_b4002_9, // 0x7b7
        jup_sticker_b4003_12, // 0x7b8
        jup_sticker_b4003_13, // 0x7b9
        jup_sticker_b4003_14, // 0x7ba
        jup_sticker_b4004_9, // 0x7bb
        jup_sticker_b4007_6, // 0x7bc
        jup_sticker_b4008_5, // 0x7bd
        jup_sticker_b4009_5, // 0x7be
        jup_sticker_b4009_6, // 0x7bf
        jup_sticker_b4014_6, // 0x7c0
        jup_sticker_b4016_5, // 0x7c1
        jup_sticker_b4017_6, // 0x7c2
        jup_sticker_b4018_6, // 0x7c3
        jup_sticker_b4020_5, // 0x7c4
        jup_sticker_b4020_6, // 0x7c5
        jup_sticker_b4021_4, // 0x7c6
        jup_sticker_b4022_5, // 0x7c7
        jup_sticker_b4022_6, // 0x7c8
        jup_sticker_b4023_6, // 0x7c9
        jup_sticker_b4025_6, // 0x7ca
        jup_sticker_b4026_6, // 0x7cb
        jup_sticker_b4027_5, // 0x7cc
        jup_sticker_b4028_5, // 0x7cd
        jup_sticker_b4034_4, // 0x7ce
        jup_sticker_b4040_5, // 0x7cf
        jup_sticker_b4041_5, // 0x7d0
        jup_sticker_b4042_10, // 0x7d1
        jup_sticker_b4042_9, // 0x7d2
        jup_sticker_b4046_2, // 0x7d3
        jup_sticker_b4048_2, // 0x7d4
        jup_sticker_b4054_7, // 0x7d5
        jup_sticker_b4055_5, // 0x7d6
        jup_sticker_b4057_5, // 0x7d7
        jup_sticker_b4063_5, // 0x7d8
        jup_sticker_b4065_3, // 0x7d9
        jup_sticker_b5002_6, // 0x7da
        jup_sticker_b5003_6, // 0x7db
        jup_sticker_b5006_7, // 0x7dc
        jup_sticker_b5007_7, // 0x7dd
        jup_sticker_b5008_5, // 0x7de
        jup_sticker_b5009_6, // 0x7df
        jup_sticker_b5010_5, // 0x7e0
        jup_sticker_b5011_5, // 0x7e1
        jup_sticker_b5012_6, // 0x7e2
        jup_sticker_b5012_7, // 0x7e3
        jup_sticker_b5013_5, // 0x7e4
        jup_sticker_b5014_6, // 0x7e5
        jup_sticker_b5014_7, // 0x7e6
        jup_sticker_b5015_5, // 0x7e7
        jup_sticker_b5016_5, // 0x7e8
        jup_sticker_b5016_6, // 0x7e9
        jup_sticker_b5017_5, // 0x7ea
        jup_sticker_b5020_8, // 0x7eb
        jup_sticker_b5020_9, // 0x7ec
        jup_sticker_b5021_5, // 0x7ed
        jup_sticker_b5022_10, // 0x7ee
        jup_sticker_b5022_5, // 0x7ef
        jup_sticker_b5023_6, // 0x7f0
        jup_sticker_b5024_5, // 0x7f1
        jup_sticker_b5024_6, // 0x7f2
        jup_sticker_b5025_5, // 0x7f3
        jup_sticker_b5026_9, // 0x7f4
        jup_sticker_b5027_6, // 0x7f5
        jup_sticker_b5028_1, // 0x7f6
        jup_sticker_b5037_3, // 0x7f7
        jup_sticker_b5042_5, // 0x7f8
        jup_sticker_b5043_5, // 0x7f9
        jup_sticker_b5044_2, // 0x7fa
        jup_sticker_b6002_6, // 0x7fb
        jup_sticker_b6003_6, // 0x7fc
        jup_sticker_b6004_7, // 0x7fd
        jup_sticker_b6006_5, // 0x7fe
        jup_sticker_b6007_5, // 0x7ff
        jup_sticker_b6009_5, // 0x800
        jup_sticker_b6011_7, // 0x801
        jup_sticker_b6013_6, // 0x802
        jup_sticker_b6016_5, // 0x803
        jup_sticker_b6017_7, // 0x804
        jup_sticker_b6032_5, // 0x805
        jup_sticker_iw9_498, // 0x806
        jup_sticker_iw9_518, // 0x807
        jup_sticker_iw9_519, // 0x808
        jup_sticker_n4913_12, // 0x809
        jup_sticker_n4913_13, // 0x80a
        jup_sticker_n4914_17, // 0x80b
        jup_sticker_n4914_18, // 0x80c
        jup_sticker_n4914_19, // 0x80d
        jup_sticker_n4918_8, // 0x80e
        jup_sticker_n4920_5, // 0x80f
        jup_sticker_n4921_5, // 0x810
        jup_sticker_n4922_3, // 0x811
        jup_sticker_n4923_5, // 0x812
        jup_sticker_n4924_2, // 0x813
        jup_sticker_n4925_2, // 0x814
        jup_sticker_n4932_4, // 0x815
        jup_sticker_n4933_14, // 0x816
        jup_sticker_n4933_15, // 0x817
        jup_sticker_n4933_17, // 0x818
        jup_sticker_n4943_4, // 0x819
        jup_sticker_n4943_6, // 0x81a
        jup_sticker_n5914_2, // 0x81b
        jup_sticker_n5915_2, // 0x81c
        jup_sticker_n5916_5, // 0x81d
        jup_sticker_n5917_6, // 0x81e
        jup_sticker_n5918_6, // 0x81f
        jup_sticker_n5922_4, // 0x820
        jup_sticker_n5922_5, // 0x821
        jup_sticker_n6910_8, // 0x822
        jup_sticker_n6911_2, // 0x823
        jup_sticker_n6915_6, // 0x824
        jup_sticker_n6916_6, // 0x825
        jup_sticker_n6917_4, // 0x826
        jup_sticker_n6917_5, // 0x827
        jup_sticker_opc_warzoneseason1_73, // 0x828
        jup_sticker_z4501_3, // 0x829
        jup_sticker_z4502_5, // 0x82a
        jup_sticker_z4503_6, // 0x82b
        jup_sticker_z4505_2, // 0x82c
        jup_sticker_z4506_2, // 0x82d
        jup_sticker_z4508_4, // 0x82e
        jup_sticker_z4515_7, // 0x82f
        jup_sticker_z4517_9, // 0x830
        jup_sticker_z5501_3, // 0x831
        jup_sticker_z5502_5, // 0x832
        jup_sticker_z5503_6, // 0x833
        jup_sticker_z5505_2, // 0x834
        jup_sticker_z5506_4, // 0x835
        jup_sticker_z5507_2, // 0x836
        jup_sticker_z5509_6, // 0x837
        jup_sticker_z5511_3, // 0x838
        jup_sticker_z5514_4, // 0x839
        jup_sticker_z5515_3, // 0x83a
        jup_sticker_z5518_3, // 0x83b
        jup_sticker_z5519_4, // 0x83c
        jup_sticker_z5520_2, // 0x83d
        jup_sticker_z5523_7, // 0x83e
        jup_sticker_z6502_3, // 0x83f
        jup_sticker_z6503_4, // 0x840
        jup_sticker_z6505_4, // 0x841
        jup_sticker_z6506_2, // 0x842
        jup_sticker_z6508_5, // 0x843
        jup_sticker_z6509_2, // 0x844
        jup_sticker_z6511_6, // 0x845
        jup_sticker_z6512_3, // 0x846
        jup_sticker_z6514_5, // 0x847
        jup_sticker_z6516_3, // 0x848
        jup_sticker_z6517_6, // 0x849
        jup_sticker_z6518_4, // 0x84a
        jup_sticker_z6519_2, // 0x84b
        jup_vinyl_b4001_13, // 0x84c
        jup_vinyl_b4002_13, // 0x84d
        jup_vinyl_b4003_10, // 0x84e
        jup_vinyl_b4003_11, // 0x84f
        jup_vinyl_b4004_8, // 0x850
        jup_vinyl_b4007_5, // 0x851
        jup_vinyl_b4008_6, // 0x852
        jup_vinyl_b4009_4, // 0x853
        jup_vinyl_b4013_4, // 0x854
        jup_vinyl_b4014_4, // 0x855
        jup_vinyl_b4016_6, // 0x856
        jup_vinyl_b4018_4, // 0x857
        jup_vinyl_b4020_3, // 0x858
        jup_vinyl_b4020_4, // 0x859
        jup_vinyl_b4021_6, // 0x85a
        jup_vinyl_b4022_3, // 0x85b
        jup_vinyl_b4022_4, // 0x85c
        jup_vinyl_b4023_5, // 0x85d
        jup_vinyl_b4025_5, // 0x85e
        jup_vinyl_b4026_4, // 0x85f
        jup_vinyl_b4027_3, // 0x860
        jup_vinyl_b4028_3, // 0x861
        jup_vinyl_b4034_3, // 0x862
        jup_vinyl_b4035_3, // 0x863
        jup_vinyl_b4039_4, // 0x864
        jup_vinyl_b4040_4, // 0x865
        jup_vinyl_b4041_4, // 0x866
        jup_vinyl_b4051_2, // 0x867
        jup_vinyl_b4053_1, // 0x868
        jup_vinyl_b4053_2, // 0x869
        jup_vinyl_b4054_13, // 0x86a
        jup_vinyl_b4054_6, // 0x86b
        jup_vinyl_b4055_4, // 0x86c
        jup_vinyl_b4057_4, // 0x86d
        jup_vinyl_b4063_4, // 0x86e
        jup_vinyl_b5002_5, // 0x86f
        jup_vinyl_b5003_5, // 0x870
        jup_vinyl_b5006_5, // 0x871
        jup_vinyl_b5007_5, // 0x872
        jup_vinyl_b5008_4, // 0x873
        jup_vinyl_b5009_5, // 0x874
        jup_vinyl_b5010_4, // 0x875
        jup_vinyl_b5011_4, // 0x876
        jup_vinyl_b5013_4, // 0x877
        jup_vinyl_b5014_5, // 0x878
        jup_vinyl_b5015_4, // 0x879
        jup_vinyl_b5016_4, // 0x87a
        jup_vinyl_b5017_4, // 0x87b
        jup_vinyl_b5018_6, // 0x87c
        jup_vinyl_b5019_6, // 0x87d
        jup_vinyl_b5020_7, // 0x87e
        jup_vinyl_b5021_4, // 0x87f
        jup_vinyl_b5022_4, // 0x880
        jup_vinyl_b5023_5, // 0x881
        jup_vinyl_b5024_4, // 0x882
        jup_vinyl_b5025_4, // 0x883
        jup_vinyl_b5027_5, // 0x884
        jup_vinyl_b5031_1, // 0x885
        jup_vinyl_b5032_1, // 0x886
        jup_vinyl_b5042_4, // 0x887
        jup_vinyl_b5043_6, // 0x888
        jup_vinyl_b5044_1, // 0x889
        jup_vinyl_b6002_5, // 0x88a
        jup_vinyl_b6003_5, // 0x88b
        jup_vinyl_b6004_5, // 0x88c
        jup_vinyl_b6007_4, // 0x88d
        jup_vinyl_b6008_6, // 0x88e
        jup_vinyl_b6009_4, // 0x88f
        jup_vinyl_b6016_4, // 0x890
        jup_vinyl_b6025_1, // 0x891
        jup_vinyl_b6032_4, // 0x892
        jup_vinyl_n3931_2, // 0x893
        jup_vinyl_n4918_9, // 0x894
        jup_vinyl_n4920_4, // 0x895
        jup_vinyl_n4922_4, // 0x896
        jup_vinyl_n4922_5, // 0x897
        jup_vinyl_n4923_4, // 0x898
        jup_vinyl_n4924_3, // 0x899
        jup_vinyl_n4925_3, // 0x89a
        jup_vinyl_n4931_29, // 0x89b
        jup_vinyl_n4931_30, // 0x89c
        jup_vinyl_n4931_31, // 0x89d
        jup_vinyl_n4931_32, // 0x89e
        jup_vinyl_n4933_13, // 0x89f
        jup_vinyl_n4943_5, // 0x8a0
        jup_vinyl_n5914_3, // 0x8a1
        jup_vinyl_n5915_3, // 0x8a2
        jup_vinyl_n5916_4, // 0x8a3
        jup_vinyl_n5917_5, // 0x8a4
        jup_vinyl_n5918_5, // 0x8a5
        jup_vinyl_n5930_14, // 0x8a6
        jup_vinyl_n5930_15, // 0x8a7
        jup_vinyl_n5930_16, // 0x8a8
        jup_vinyl_n5930_17, // 0x8a9
        jup_vinyl_n6910_9, // 0x8aa
        jup_vinyl_n6911_3, // 0x8ab
        jup_vinyl_n6914_6, // 0x8ac
        jup_vinyl_n6915_5, // 0x8ad
        jup_vinyl_n6915_7, // 0x8ae
        jup_vinyl_n6916_16, // 0x8af
        jup_vinyl_n6916_5, // 0x8b0
        jup_vinyl_z4502_4, // 0x8b1
        jup_vinyl_z4505_5, // 0x8b2
        jup_vinyl_z4506_5, // 0x8b3
        jup_vinyl_z4509_4, // 0x8b4
        jup_vinyl_z4520_5, // 0x8b5
        jup_vinyl_z4523_3, // 0x8b6
        jup_vinyl_z5501_7, // 0x8b7
        jup_vinyl_z5502_4, // 0x8b8
        jup_vinyl_z5505_5, // 0x8b9
        jup_vinyl_z5507_5, // 0x8ba
        jup_vinyl_z5508_4, // 0x8bb
        jup_vinyl_z5510_5, // 0x8bc
        jup_vinyl_z5512_3, // 0x8bd
        jup_vinyl_z5513_4, // 0x8be
        jup_vinyl_z5516_5, // 0x8bf
        jup_vinyl_z5517_5, // 0x8c0
        jup_vinyl_z5519_5, // 0x8c1
        jup_vinyl_z5523_2, // 0x8c2
        jup_vinyl_z6506_5, // 0x8c3
        jup_vinyl_z6507_2, // 0x8c4
        jup_vinyl_z6508_4, // 0x8c5
        jup_vinyl_z6509_5, // 0x8c6
        jup_vinyl_z6510_4, // 0x8c7
        jup_vinyl_z6513_4, // 0x8c8
        jup_vinyl_z6514_6, // 0x8c9
        jup_vinyl_z6515_4, // 0x8ca
        jup_vinyl_z6518_5, // 0x8cb
        jup_vinyl_z6520_5, // 0x8cc
        sticker_iw9_551, // 0x8cd
        sticker_iw9_552, // 0x8ce
        sticker_iw9_553, // 0x8cf
        sticker_iw9_554, // 0x8d0
        sticker_iw9_555, // 0x8d1
        sticker_iw9_556, // 0x8d2
        sticker_iw9_557, // 0x8d3
        sticker_iw9_558, // 0x8d4
        sticker_iw9_559, // 0x8d5
        sticker_iw9_560, // 0x8d6
        sticker_iw9_561, // 0x8d7
        sticker_iw9_562, // 0x8d8
        sticker_iw9_563, // 0x8d9
        sticker_iw9_564, // 0x8da
        sticker_iw9_565, // 0x8db
        sticker_iw9_566, // 0x8dc
        sticker_iw9_567, // 0x8dd
        sticker_iw9_568, // 0x8de
        sticker_iw9_569, // 0x8df
        sticker_iw9_570, // 0x8e0
        sticker_iw9_571, // 0x8e1
        sticker_iw9_572, // 0x8e2
        sticker_iw9_573, // 0x8e3
        sticker_iw9_574, // 0x8e4
        sticker_iw9_575, // 0x8e5
        sticker_iw9_576, // 0x8e6
        sticker_iw9_577, // 0x8e7
        sticker_iw9_578, // 0x8e8
        sticker_iw9_579, // 0x8e9
        sticker_iw9_580, // 0x8ea
        sticker_iw9_581, // 0x8eb
        sticker_iw9_582, // 0x8ec
        sticker_iw9_583, // 0x8ed
        sticker_iw9_584, // 0x8ee
        sticker_iw9_585, // 0x8ef
        sticker_iw9_586, // 0x8f0
        sticker_iw9_587, // 0x8f1
        sticker_iw9_588, // 0x8f2
        sticker_iw9_589, // 0x8f3
        sticker_iw9_590, // 0x8f4
        sticker_iw9_591, // 0x8f5
        sticker_iw9_592, // 0x8f6
        sticker_iw9_593, // 0x8f7
        sticker_iw9_594, // 0x8f8
        sticker_iw9_595, // 0x8f9
        sticker_iw9_596, // 0x8fa
        sticker_iw9_597, // 0x8fb
        sticker_iw9_598, // 0x8fc
        sticker_iw9_599, // 0x8fd
        sticker_iw9_600, // 0x8fe
        sticker_iw9_rp_01, // 0x8ff
        vinyl_none, // 0x900
        sticker_cer_067_wzrp_s2, // 0x901
        sticker_cer_106_wz_rps4, // 0x902
        sticker_cer_114_s4bp, // 0x903
        sticker_cer_115_s4bp, // 0x904
        sticker_cer_116_s4bp, // 0x905
        sticker_cer_117_s4bp, // 0x906
        sticker_cer_118_s4bp, // 0x907
        sticker_cer_119_ev, // 0x908
        sticker_cer_120_ev, // 0x909
        sticker_cer_121_cdl, // 0x90a
        sticker_cer_122_cel, // 0x90b
        sticker_cer_123_fighter, // 0x90c
        sticker_cer_124_goat, // 0x90d
        sticker_cer_125_light, // 0x90e
        sticker_cer_126_cdl, // 0x90f
        sticker_cer_127_shiba, // 0x910
        sticker_cer_128_horse, // 0x911
        sticker_cer_129_dive, // 0x912
        sticker_cer_130_robber, // 0x913
        sticker_cer_131_mech, // 0x914
        vinyl_cer_082_wz_rps4, // 0x915
        vinyl_cer_083_wz_rps4, // 0x916
        vinyl_cer_084_wz_rps4, // 0x917
        vinyl_cer_085_wz_rps4, // 0x918
        vinyl_cer_086_wz_rps4, // 0x919
        vinyl_cer_087_wz_rps4, // 0x91a
        vinyl_cer_097_s4bp, // 0x91b
        vinyl_cer_098_s4bp, // 0x91c
        vinyl_cer_099_s4bp, // 0x91d
        vinyl_cer_100_s4bp, // 0x91e
        vinyl_cer_101_s4bp, // 0x91f
        vinyl_cer_102_ev, // 0x920
        vinyl_cer_103_fighter, // 0x921
        vinyl_cer_104_zm, // 0x922
        vinyl_cer_105_magic, // 0x923
        vinyl_cer_106_rps4, // 0x924
        vinyl_cer_107_tv, // 0x925
        vinyl_cer_108_retriever, // 0x926
        vinyl_cer_109_jet, // 0x927
        vinyl_cer_110_dino, // 0x928
        sticker_cer_127_wz_rps5, // 0x929
        sticker_cer_132_bps5, // 0x92a
        sticker_cer_133_bps5, // 0x92b
        sticker_cer_134_bps5, // 0x92c
        sticker_cer_135_bps5, // 0x92d
        sticker_cer_136_bps5, // 0x92e
        sticker_cer_137_mt, // 0x92f
        sticker_cer_138_plague, // 0x930
        vinyl_cer_045_rps5, // 0x931
        vinyl_cer_111_bps5, // 0x932
        vinyl_cer_112_bps5, // 0x933
        vinyl_cer_113_bps5, // 0x934
        vinyl_cer_114_bps5, // 0x935
        vinyl_cer_115_bps5, // 0x936
        vinyl_cer_116_bps5, // 0x937
        vinyl_cer_117_ww, // 0x938
        vinyl_cer_118_time, // 0x939
        vinyl_cer_119_anime, // 0x93a
        vinyl_cer_120_roller, // 0x93b
        vinyl_cer_121_beret, // 0x93c
        sticker_cer_139_nuke, // 0x93d
        sticker_cer_140_bandit, // 0x93e
        sticker_cer_141_70s, // 0x93f
        sticker_cer_142_cel, // 0x940
        sticker_cer_143_jugger, // 0x941
        sticker_cer_144_bps6, // 0x942
        sticker_cer_145_bps6, // 0x943
        sticker_cer_146_bps6, // 0x944
        sticker_cer_147_bps6, // 0x945
        sticker_cer_148_bps6, // 0x946
        sticker_cer_149_hdl, // 0x947
        sticker_cer_150_lollipop, // 0x948
        sticker_cer_151_skate, // 0x949
        sticker_cer_152_head, // 0x94a
        sticker_cer_153_hades, // 0x94b
        sticker_cer_154_sas, // 0x94c
        vinyl_cer_046_rps6, // 0x94d
        vinyl_cer_122_nuke, // 0x94e
        vinyl_cer_123_penguin, // 0x94f
        vinyl_cer_124_cards, // 0x950
        vinyl_cer_125_bps6, // 0x951
        vinyl_cer_126_bps6, // 0x952
        vinyl_cer_127_bps6, // 0x953
        vinyl_cer_128_bps6, // 0x954
        vinyl_cer_129_bps6, // 0x955
        vinyl_cer_130_ev, // 0x956
        vinyl_cer_131_oni, // 0x957
        vinyl_cer_132_hades, // 0x958
        vinyl_cer_133_piper // 0x959
    };

    // idx 0x14 members: 0x5b type: 5
    enum Super {
        none, // 0x0
        super_tac_cover, // 0x1
        super_recon_drone, // 0x2
        super_emp_drone, // 0x3
        super_support_box, // 0x4
        super_laststand_heal, // 0x5
        super_trophy, // 0x6
        super_deadsilence, // 0x7
        super_tac_insert, // 0x8
        super_ammo_drop, // 0x9
        super_weapon_drop, // 0xa
        super_tac_camera, // 0xb
        super_suppression_rounds, // 0xc
        super_sonar_pulse, // 0xd
        super_emp_pulse, // 0xe
        super_battlerage, // 0xf
        super_armor_drop, // 0x10
        super_stimpistol, // 0x11
        super_sound_veil, // 0x12
        super_blastshield_drop, // 0x13
        super_smoke_airdrop, // 0x14
        super_blinding_turret, // 0x15
        super_deployed_decoy, // 0x16
        super_loadout_drop, // 0x17
        super_leader_drop, // 0x18
        super_armory, // 0x19
        super_personal_redeploy_drone, // 0x1a
        super_reinforcement_flare, // 0x1b
        super_oxygen_mask, // 0x1c
        super_decon_station, // 0x1d
        super_deployable_kiosk, // 0x1e
        super_temp_v, // 0x1f
        super_laser_charge, // 0x20
        super_high_jump, // 0x21
        super_melee_jugg, // 0x22
        super_teleport_deploy, // 0x23
        super_electric_discharge, // 0x24
        super_self_revive_box, // 0x25
        super_utility_drop, // 0x26
        super_aether_shroud, // 0x27
        super_healing_aura, // 0x28
        super_landmine, // 0x29
        super_honeypot, // 0x2a
        super_gas_trap, // 0x2b
        super_frost_blast, // 0x2c
        super_energy_mine, // 0x2d
        super_frenzied_guard, // 0x2e
        super_tesla_storm, // 0x2f
        super_dark_flare, // 0x30
        super_mary_paris, // 0x31
        super_cranked, // 0x32
        super_boba, // 0x33
        super_rallying_cry, // 0x34
        super_spykit, // 0x35
        super_jammer, // 0x36
        super_capture_bot, // 0x37
        super_laststand_syringe, // 0x38
        super_med_box, // 0x39
        super_hb_sensor, // 0x3a
        super_la_rpapa7, // 0x3b
        super_la_gromeo, // 0x3c
        super_la_juliet, // 0x3d
        super_la_kgolf, // 0x3e
        super_la_mike32, // 0x3f
        super_la_jp22_dromeo, // 0x40
        super_comm_scrambler, // 0x41
        super_evg, // 0x42
        super_smoke_shroud, // 0x43
        super_riot_shield, // 0x44
        super_sweeper_drones, // 0x45
        super_squadrage, // 0x46
        super_mutation, // 0x47
        super_mutation_jump, // 0x48
        super_mutation_density_dive, // 0x49
        super_redeploy_drone_beacon, // 0x4a
        super_acoustic_amp, // 0x4b
        super_contract_skipper, // 0x4c
        super_fulton, // 0x4d
        super_supply_drop, // 0x4e
        super_balloon_extract, // 0x4f
        super_door_barricade, // 0x50
        super_mutation_ninja_vanish, // 0x51
        super_mutation_shuriken_fury, // 0x52
        super_mutation_turtle_power, // 0x53
        super_mutation_ninja_sense, // 0x54
        super_mutation_boba_stim, // 0x55
        super_mutation_shell_shocked, // 0x56
        super_pop_candy, // 0x57
        super_slasher_teleport, // 0x58
        super_haunted_drop, // 0x59
        super_wiley_fox // 0x5a
    };

    // idx 0x15 members: 0x2e type: 5
    enum Vehicle {
        atv, // 0x0
        acharlie130, // 0x1
        light_tank, // 0x2
        little_bird, // 0x3
        veh9_apc_8x8, // 0x4
        veh9_cougar, // 0x5
        veh9_hummer, // 0x6
        veh9_jltv_cargo, // 0x7
        veh9_jltv_mg, // 0x8
        veh9_mil_cargo_truck, // 0x9
        veh9_overland_2016, // 0xa
        veh9_palfa, // 0xb
        veh9_patrol_boat, // 0xc
        veh9_rhib, // 0xd
        veh9_sedan_hatchback_1985, // 0xe
        veh9_suv_1996, // 0xf
        veh9_utv, // 0x10
        veh9_acv_6x6, // 0x11
        veh9_pwc, // 0x12
        veh9_techo_rebel_armor, // 0x13
        veh9_mil_lnd_mrap, // 0x14
        veh9_armored_acv_6x6, // 0x15
        veh9_civ_lnd_dirt_bike, // 0x16
        veh9_civ_lnd_scooter_eu, // 0x17
        veh9_civ_lnd_motorcycle_cruiser_2008, // 0x18
        veh_jup_dirt_bike, // 0x19
        veh_jup_razorback, // 0x1a
        veh_jup_orav, // 0x1b
        veh_jup_motorcycle_blood_burner, // 0x1c
        veh_jup_truck_tech_hmg, // 0x1d
        veh_jup_truck_tech_aa, // 0x1e
        veh_jup_cougar_mg, // 0x1f
        veh_jup_nuclear_locomotive, // 0x20
        veh_jup_polaris_utv, // 0x21
        veh_cer_port_atv, // 0x22
        veh_cer_port_atv_80s, // 0x23
        veh_cer_port_atv_sportsman, // 0x24
        veh_cer_mil_heli_med, // 0x25
        veh_cer_mil_heli_little_bird, // 0x26
        veh_cer_port_mil_lnd_cargo_truck, // 0x27
        veh_cer_port_medium_truck, // 0x28
        veh_cer_port_utv, // 0x29
        veh_cer_port_utv_polaris, // 0x2a
        veh_cer_port_civ_lnd_dirt_bike, // 0x2b
        veh_cer_mil_boat_raider_rc, // 0x2c
        veh_cer_mil_boat_rigid_tactical_raft // 0x2d
    };

    // idx 0x16 members: 0x6d type: 5
    enum CerWeapons {
        t10_knifestab, // 0x0
        t10_me_climbfists, // 0x1
        t10_me_diveknife, // 0x2
        t10_me_fists, // 0x3
        t10_swimfists, // 0x4
        t10_me_zombiefists, // 0x5
        t10_ar_p01_coslo723, // 0x6
        t10_ar_p02_aking74, // 0x7
        t10_ar_p04_clove, // 0x8
        t10_ar_p05_fable, // 0x9
        t10_ar_p05_rmary2, // 0xa
        t10_ar_p06_asvalor, // 0xb
        t10_ar_p22_able18, // 0xc
        t10_ar_p23_love85, // 0xd
        t10_dm_p01_sroger25, // 0xe
        t10_dm_p02_aeasy, // 0xf
        t10_dm_p03_sgeorge550, // 0x10
        t10_dm_p05_falove, // 0x11
        t10_dm_p09_svalor, // 0x12
        t10_la_mangler_cannon, // 0x13
        t10_la_p17_pable3, // 0x14
        t10_la_p18_stisaac, // 0x15
        t10_la_p19_opalww, // 0x16
        t10_lm_dblmg_deathmachine, // 0x17
        t10_lm_p01_aroger10, // 0x18
        t10_lm_p02_puncle21, // 0x19
        t10_lm_p07_ksugar58, // 0x1a
        t10_lm_p19_jetgun, // 0x1b
        t10_lm_p25_drillgun, // 0x1c
        t10_me_p15_knife, // 0x1d
        t10_me_p16_bat, // 0x1e
        t10_me_p19_bloodstonedope, // 0x1f
        t10_me_p19_bloodstoneeasy, // 0x20
        t10_me_p19_bloodstonefun, // 0x21
        t10_me_p19_bloodstonelife, // 0x22
        t10_me_p19_bloodstoneww, // 0x23
        t10_me_p30_cleaver, // 0x24
        t10_me_p31_drill, // 0x25
        t10_me_zombie_hellhound, // 0x26
        t10_me_zombie_melee, // 0x27
        t10_me_zombie_mimic, // 0x28
        t10_pi_p12_paris30, // 0x29
        t10_pi_p13_usugar9, // 0x2a
        t10_pi_p14_mable, // 0x2b
        t10_pi_p14_stiger, // 0x2c
        t10_ar_p19_dg2, // 0x2d
        t10_pi_p19_jadeww, // 0x2e
        t10_pi_p19_jadewwc, // 0x2f
        t10_pi_p19_jadewwn, // 0x30
        t10_pi_p19_raygun, // 0x31
        t10_pi_p19_raygunmark2, // 0x32
        t10_pi_p19_raygunmark2p, // 0x33
        t10_pi_p19_raygunmark2r, // 0x34
        t10_pi_p19_raygunmark2w, // 0x35
        t10_sh_p10_moslo500, // 0x36
        t10_sh_p25_uncle12, // 0x37
        t10_sh_p27_jhavana, // 0x38
        t10_sl_p29_goslo, // 0x39
        t10_sm_p02_geasy9, // 0x3a
        t10_sm_p03_safox, // 0x3b
        t10_sm_p04_chuck9, // 0x3c
        t10_sm_p06_sroger3, // 0x3d
        t10_sm_p12_roger31, // 0x3e
        t10_sm_p21_pparis90, // 0x3f
        t10_sm_p28_saug, // 0x40
        t10_sn_p08_ultiger, // 0x41
        t10_sn_p09_droger, // 0x42
        t10_sn_p24_love96, // 0x43
        t10_sn_p26_mary82, // 0x44
        t10_ar_p34_tbaker, // 0x45
        t10_lm_p33_uxray, // 0x46
        t10_me_p36_skateboard, // 0x47
        t10_me_p37_katanas, // 0x48
        t10_me_p38_sais, // 0x49
        t10_me_p39_nunchaku, // 0x4a
        t10_me_p40_bostaff, // 0x4b
        t10_sm_p41_perth, // 0x4c
        t10_sl_p35_blauncher, // 0x4d
        t10_ks_handcannon, // 0x4e
        t10_zm_opalww_pack, // 0x4f
        t10_ar_p45_kent, // 0x50
        t10_ar_p47_gilroy, // 0x51
        t10_pi_p42_pyork, // 0x52
        t10_sm_p43_schuck, // 0x53
        t10_sl_p44_napa, // 0x54
        t10_me_p48_keene, // 0x55
        t10_sn_p46_hugo, // 0x56
        t10_ks_warmachine, // 0x57
        cruise_proj_valkyrie_t10_mp, // 0x58
        t10_me_p38_bobastreaksais, // 0x59
        t10_me_p37_bobastreakkatanas, // 0x5a
        t10_me_p39_bobastreaknunchaku, // 0x5b
        t10_me_p40_bobastreakbostaff, // 0x5c
        t10_ks_deathmachine, // 0x5d
        t10_ar_p49_fresno, // 0x5e
        t10_sm_p52_lisbon, // 0x5f
        t10_dm_p50_erie, // 0x60
        t10_ar_p54_aspen, // 0x61
        t10_ar_p56_milan, // 0x62
        t10_sh_p11_olove, // 0x63
        t10_lm_p53_mesa, // 0x64
        t10_ks_m202, // 0x65
        t10_me_p51_pickaxe, // 0x66
        t10_pi_handcannon_oic, // 0x67
        t10_sm_p57_mpug40, // 0x68
        t10_me_p55_bgloves, // 0x69
        t10_me_p59_csaw, // 0x6a
        t10_ks_compound, // 0x6b
        t10_sl_p58_wand // 0x6c
    };

    // idx 0x17 members: 0xc type: 5
    enum Wildcard {
        wildcard_none, // 0x0
        wildcard_overkill, // 0x1
        wildcard_danger_close, // 0x2
        wildcard_gunfighter, // 0x3
        wildcard_perk_greed, // 0x4
        wildcard_tactical_expert, // 0x5
        wildcard_field_captain, // 0x6
        wildcard_equipment_expert, // 0x7
        wildcard_master_tactician, // 0x8
        wildcard_high_roller, // 0x9
        wildcard_flyswatter, // 0xa
        wildcard_perkstreak // 0xb
    };

    // idx 0x18 members: 0x9 type: c
    enum WonderWeapon {
        t10_pi_p19_jadeww, // 0x0
        t10_pi_p19_raygun, // 0x1
        t10_la_p19_opalww, // 0x2
        t10_me_p19_bloodstoneww, // 0x3
        t10_lm_p25_drillgun, // 0x4
        t10_lm_p19_jetgun, // 0x5
        t10_la_mangler_cannon, // 0x6
        t10_pi_p19_raygunmark2, // 0x7
        t10_ar_p19_dg2 // 0x8
    };

    // idx 0x19 members: 0xd type: 5
    enum ZMPerk {
        none, // 0x0
        specialty_deadshot, // 0x1
        specialty_death_perception, // 0x2
        specialty_elemental_pop, // 0x3
        specialty_juggernog, // 0x4
        specialty_phd_flopper, // 0x5
        specialty_quickrevive, // 0x6
        specialty_speedcola, // 0x7
        specialty_staminup, // 0x8
        specialty_tombstone, // 0x9
        specialty_m_mod, // 0xa
        specialty_vulture_aid, // 0xb
        specialty_d_mod // 0xc
    };

    // idx 0x1a members: 0x87 type: 5
    enum BaseGameMode {
        aon, // 0x0
        dm, // 0x1
        war, // 0x2
        war_bigmap, // 0x3
        sd, // 0x4
        sab, // 0x5
        dom, // 0x6
        koth, // 0x7
        ctf, // 0x8
        dd, // 0x9
        conf, // 0xa
        control, // 0xb
        tdef, // 0xc
        siege, // 0xd
        grnd, // 0xe
        tjugg, // 0xf
        jugg, // 0x10
        gun, // 0x11
        infect, // 0x12
        oic, // 0x13
        mugger, // 0x14
        blitz, // 0x15
        sr, // 0x16
        grind, // 0x17
        sotf, // 0x18
        sotf_ffa, // 0x19
        assault, // 0x1a
        aliens, // 0x1b
        cp_survival, // 0x1c
        cp_wave_sv, // 0x1d
        cp_specops, // 0x1e
        zombie, // 0x1f
        escape, // 0x20
        cp_pvpve, // 0x21
        cp_strike, // 0x22
        cp_trials, // 0x23
        ball, // 0x24
        front, // 0x25
        arena, // 0x26
        cmd, // 0x27
        br, // 0x28
        dmz, // 0x29
        cyber, // 0x2a
        rush, // 0x2b
        esc, // 0x2c
        vip, // 0x2d
        btm, // 0x2e
        rugby, // 0x2f
        arm, // 0x30
        mtmc, // 0x31
        snatch, // 0x32
        hq, // 0x33
        defcon, // 0x34
        pill, // 0x35
        brm, // 0x36
        hvt, // 0x37
        trial, // 0x38
        brtdm, // 0x39
        br_risk, // 0x3a
        incursion, // 0x3b
        missions, // 0x3c
        cqc, // 0x3d
        plunder, // 0x3e
        ko, // 0x3f
        risk, // 0x40
        hstg, // 0x41
        fr, // 0x42
        gwbomb, // 0x43
        rescue, // 0x44
        landgrab, // 0x45
        elim, // 0x46
        gwai, // 0x47
        bounty, // 0x48
        zm_rb, // 0x49
        gwtdm, // 0x4a
        ob, // 0x4b
        dungeons, // 0x4c
        resurgence, // 0x4d
        exgm, // 0x4e
        kingslayer, // 0x4f
        mini, // 0x50
        mini_mgl, // 0x51
        resurgence_mgl, // 0x52
        rsurge, // 0x53
        truckwar, // 0x54
        vanilla, // 0x55
        zxp, // 0x56
        benchmark, // 0x57
        ballmode, // 0x58
        brtdm_mgl, // 0x59
        conflict, // 0x5a
        havoc, // 0x5b
        bigctf, // 0x5c
        xfire, // 0x5d
        robj, // 0x5e
        zm_turned, // 0x5f
        wm, // 0x60
        escort, // 0x61
        training_course, // 0x62
        br_auto, // 0x63
        ctdm, // 0x64
        rogue, // 0x65
        fireteam, // 0x66
        augment, // 0x67
        tag_trap, // 0x68
        prop, // 0x69
        counter, // 0x6a
        hijack, // 0x6b
        towerclimb, // 0x6c
        sharp, // 0x6d
        gold, // 0x6e
        zm_rb_classic, // 0x6f
        zm_grief, // 0x70
        zm_nap, // 0x71
        skirmish, // 0x72
        zm_guided, // 0x73
        armorup, // 0x74
        zm_rb_jingle, // 0x75
        zm_rb_dead_light, // 0x76
        zm_rb_cranked, // 0x77
        zm_rb_cranked_team, // 0x78
        wargames, // 0x79
        multi, // 0x7a
        boba, // 0x7b
        sugar, // 0x7c
        stop_and_go, // 0x7d
        zm_training_course, // 0x7e
        zm_rb_boba, // 0x7f
        cparty, // 0x80
        clash, // 0x81
        zm_abom_challenge, // 0x82
        zm_rb_startroom, // 0x83
        resurgence_havoc, // 0x84
        zm_rb_orange, // 0x85
        slash // 0x86
    };

    // idx 0x1b members: 0x4 type: 5
    enum KillstreakClass {
        streaktype_assault, // 0x0
        streaktype_support, // 0x1
        streaktype_specialist, // 0x2
        streaktype_tactical // 0x3
    };

    // idx 0x1c members: 0x2 type: 5
    enum PlayerGroup {
        axis, // 0x0
        allies // 0x1
    };

    // idx 0x1d members: 0xe type: 5
    enum AttachmentClass {
        optic, // 0x0
        muzzle, // 0x1
        frontpiece, // 0x2
        undermount, // 0x3
        magazine, // 0x4
        reargrip, // 0x5
        backpiece, // 0x6
        extra, // 0x7
        gunperk, // 0x8
        trigger, // 0x9
        pump, // 0xa
        guard, // 0xb
        charm, // 0xc
        sticker // 0xd
    };

    // idx 0x1e members: 0x7 type: 5
    enum PerkClass {
        ability_speed, // 0x0
        ability_handling, // 0x1
        ability_stealth, // 0x2
        ability_awareness, // 0x3
        ability_resistance, // 0x4
        ability_equipment, // 0x5
        ability_elite // 0x6
    };

    // idx 0x1f members: 0x4 type: 5
    enum GunGameVictoryConditions {
        all_kills_win, // 0x0
        throwing_knife_or_executions, // 0x1
        throwing_knife_only, // 0x2
        executions_only // 0x3
    };

    // idx 0x20 members: 0x9 type: 5
    enum GunGameWeaponTier {
        rand_pistol, // 0x0
        rand_smg, // 0x1
        rand_assault, // 0x2
        rand_sniper, // 0x3
        rand_shotgun, // 0x4
        rand_lmg, // 0x5
        rand_launcher, // 0x6
        rand_knife_end, // 0x7
        rand_dmr // 0x8
    };

    // idx 0x21 members: 0x2 type: 5
    enum SubGameMode {
        none, // 0x0
        dmz // 0x1
    };

    // idx 0x22 members: 0x3 type: 5
    enum GiveFavoriteLoadoutOption {
        disabled, // 0x0
        ondroponly, // 0x1
        ondropandgulagwinner // 0x2
    };

    // idx 0x23 members: 0xd type: 5
    enum WeaponClass {
        weapon_assault, // 0x0
        weapon_smg, // 0x1
        weapon_shotgun, // 0x2
        weapon_lmg, // 0x3
        weapon_dmr, // 0x4
        weapon_sniper, // 0x5
        weapon_pistol, // 0x6
        weapon_projectile, // 0x7
        weapon_melee, // 0x8
        weapon_melee2, // 0x9
        weapon_battle, // 0xa
        weapon_active_armory, // 0xb
        weapon_secondary_special // 0xc
    };

    // idx 0x24 members: 0x1 type: 5
    enum WeaponAttachmentRestricted {
        none // 0x0
    };

    // root: bitSize: 0x22498, members: 72

    // offset: 0x0, bitSize: 0x5038(0xa07 Byte(s))
    CommonOptions commonoption;
    // offset: 0x5038, bitSize: 0xc0(0x18 Byte(s))
    FrontData frontdata;
    // offset: 0x50f8, bitSize: 0x1a0(0x34 Byte(s))
    SugarData sugardata;
    // offset: 0x5298, bitSize: 0x10(0x2 Byte(s))
    CaptureData capturedata;
    // offset: 0x52a8, bitSize: 0x78(0xf Byte(s))
    CarryData carrydata;
    // offset: 0x5320, bitSize: 0x48(0x9 Byte(s))
    BtmData btmdata;
    // offset: 0x5368, bitSize: 0x970(0x12e Byte(s))
    ArenaData arenadata;
    // offset: 0x5cd8, bitSize: 0x30(0x6 Byte(s))
    BlitzData blitzdata;
    // offset: 0x5d08, bitSize: 0x48(0x9 Byte(s))
    TjuggData tjuggdata;
    // offset: 0x5d50, bitSize: 0x2a0(0x54 Byte(s))
    GunData gundata;
    // offset: 0x5ff0, bitSize: 0x28(0x5 Byte(s))
    GrndData grnddata;
    // offset: 0x6018, bitSize: 0x2c0(0x58 Byte(s))
    LoadoutEconomyData LoadoutEconomyData;
    // offset: 0x62d8, bitSize: 0xe8(0x1d Byte(s))
    KOTHData kothdata;
    // offset: 0x63c0, bitSize: 0x130(0x26 Byte(s))
    CMDData cmddata;
    // offset: 0x64f0, bitSize: 0x60(0xc Byte(s))
    RushData rushdata;
    // offset: 0x6550, bitSize: 0x30(0x6 Byte(s))
    CTFData ctfdata;
    // offset: 0x6580, bitSize: 0x2e8(0x5d Byte(s))
    PaybackData paybackdata;
    // offset: 0x6868, bitSize: 0x20(0x4 Byte(s))
    ActionParkData actionparkdata;
    // offset: 0x6888, bitSize: 0x68(0xd Byte(s))
    HVTData hvtdata;
    // offset: 0x68f0, bitSize: 0x60(0xc Byte(s))
    SotfFFAData sotfffadata;
    // offset: 0x6950, bitSize: 0x40(0x8 Byte(s))
    DemData demdata;
    // offset: 0x6990, bitSize: 0xa8(0x15 Byte(s))
    GrindData grinddata;
    // offset: 0x6a38, bitSize: 0x38(0x7 Byte(s))
    CyberData cyberdata;
    // offset: 0x6a70, bitSize: 0x30(0x6 Byte(s))
    SotfData sotfdata;
    // offset: 0x6aa0, bitSize: 0x120(0x24 Byte(s))
    DomData domdata;
    // offset: 0x6bc0, bitSize: 0xd0(0x1a Byte(s))
    TDefData tdefdata;
    // offset: 0x6c90, bitSize: 0x50(0xa Byte(s))
    SabData sabdata;
    // offset: 0x6ce0, bitSize: 0x50(0xa Byte(s))
    BombData bombdata;
    // offset: 0x6d30, bitSize: 0xa0(0x14 Byte(s))
    RugbyData rugbydata;
    // offset: 0x6dd0, bitSize: 0xa0(0x14 Byte(s))
    EscortHordeData escorthordedata;
    // offset: 0x6e70, bitSize: 0x160(0x2c Byte(s))
    GoldData golddata;
    // offset: 0x6fd0, bitSize: 0x100(0x20 Byte(s))
    ScriptableSettings scriptablesettings;
    // offset: 0x70d0, bitSize: 0xa8(0x15 Byte(s))
    FortressData fortressdata;
    // offset: 0x7178, bitSize: 0x60(0xc Byte(s))
    CollectibleData collectibledata;
    // offset: 0x71d8, bitSize: 0x30(0x6 Byte(s))
    MuggerData muggerdata;
    // offset: 0x7208, bitSize: 0x20(0x4 Byte(s))
    LandgrabData landgrabdata;
    // offset: 0x7228, bitSize: 0x8(0x1 Byte(s))
    BaseGameMode gametype;
    // offset: 0x7230, bitSize: 0x60(0xc Byte(s))
    ControlData controldata;
    // offset: 0x7290, bitSize: 0x400(0x80 Byte(s))
    SabattackData sabattackdata;
    // offset: 0x7690, bitSize: 0x1e0(0x3c Byte(s))
    skirmishData skirmishdata;
    // offset: 0x7870, bitSize: 0x118(0x23 Byte(s))
    OicData oicdata;
    // offset: 0x7988, bitSize: 0x28(0x5 Byte(s))
    EscData escdata;
    // offset: 0x79b0, bitSize: 0x170a0(0x2e14 Byte(s)), array:0xc(hti:0xffff)
    CustomGameClass defaultclasses[12];
    // offset: 0x1ea50, bitSize: 0x400(0x80 Byte(s))
    string(128) recipedescription;
    // offset: 0x1ee50, bitSize: 0x1b58(0x36b Byte(s))
    BrData brdata;
    // offset: 0x209a8, bitSize: 0x18(0x3 Byte(s))
    DmData dmdata;
    // offset: 0x209c0, bitSize: 0xc8(0x19 Byte(s))
    HQData hqdata;
    // offset: 0x20a88, bitSize: 0x8(0x1 Byte(s))
    JLData jldata;
    // offset: 0x20a90, bitSize: 0x68(0xd Byte(s))
    KOData kodata;
    // offset: 0x20af8, bitSize: 0x78(0xf Byte(s))
    HstgData hstgdata;
    // offset: 0x20b70, bitSize: 0x60(0xc Byte(s))
    StatLimits statlimits;
    // offset: 0x20bd0, bitSize: 0x6a8(0xd5 Byte(s))
    HelmetData helmetdata;
    // offset: 0x21278, bitSize: 0x28(0x5 Byte(s))
    SdData sddata;
    // offset: 0x212a0, bitSize: 0x88(0x11 Byte(s))
    SiegeData siegedata;
    // offset: 0x21328, bitSize: 0x120(0x24 Byte(s))
    HijackData HijackData;
    // offset: 0x21448, bitSize: 0x1e0(0x3c Byte(s))
    MomentumMeterData momentummeterdata;
    // offset: 0x21628, bitSize: 0x3c0(0x78 Byte(s))
    AonData aondata;
    // offset: 0x219e8, bitSize: 0x40(0x8 Byte(s))
    BountyData bountydata;
    // offset: 0x21a28, bitSize: 0x438(0x87 Byte(s))
    WMData wmdata;
    // offset: 0x21e60, bitSize: 0xa0(0x14 Byte(s))
    string(20) mlgversion;
    // offset: 0x21f00, bitSize: 0x268(0x4d Byte(s))
    CtdmData ctdmdata;
    // offset: 0x22168, bitSize: 0x8(0x1 Byte(s))
    ZmData zmdata;
    // offset: 0x22170, bitSize: 0x128(0x25 Byte(s))
    InfectData infectdata;
    // offset: 0x22298, bitSize: 0x18(0x3 Byte(s))
    ConfData confdata;
    // offset: 0x222b0, bitSize: 0xc0(0x18 Byte(s))
    EscortData escortdata;
    // offset: 0x22370, bitSize: 0x70(0xe Byte(s))
    PillData pilldata;
    // offset: 0x223e0, bitSize: 0x10(0x2 Byte(s))
    MtdmData mtdmdata;
    // offset: 0x223f0, bitSize: 0xa0(0x14 Byte(s))
    string(20) recipename;
    // offset: 0x22490, bitSize: 0x1
    bool cwlrulesenabled;
    // offset: 0x22491, bitSize: 0x1
    GameObjectRules gameobjectrules;
    // offset: 0x22492, bitSize: 0x1
    SubGameMode subgametype;
};

