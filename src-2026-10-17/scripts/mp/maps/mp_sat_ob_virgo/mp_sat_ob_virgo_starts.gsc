#using scripts\mp\gametypes\ob_gametype_story_mission;

#namespace ob_virgo_startpoint;

// Namespace ob_virgo_startpoint
// Params 0
// Checksum 0x85ac668e, Offset: 0x21d
// Size: 0x8e
function function_dde497892d9a4eca()
{
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_INTRO", { #loadout:{ #rarity:2, #index:0 }, #joinspawn:1, #power:"virgo_launch", #difficulty:2 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_INVERTED" );
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_BROKEN" );
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_PARKOUR" );
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_CRASHSITE" );
    ob_gametype_story_mission::add_start( "OB_VIRGO_FREEWAY_DRONE" );
}

// Namespace ob_virgo_startpoint
// Params 0
// Checksum 0xffb75686, Offset: 0x2b3
// Size: 0x4e
function function_2410a69c1fa2d233()
{
    ob_gametype_story_mission::add_start( "OB_VIRGO_JAPAN_INTRO", { #power:"virgo_launch", #difficulty:2 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_JAPAN_FIGHT", { #power:"cancer_intro", #difficulty:3 } );
}

// Namespace ob_virgo_startpoint
// Params 0
// Checksum 0x9eb9920f, Offset: 0x309
// Size: 0x40
function init_virgo_carrier_activities()
{
    ob_gametype_story_mission::add_start( "OB_VIRGO_CARRIER_INTRO", { #power:"cancer_intro", #difficulty:3 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_CARRIER_2" );
    ob_gametype_story_mission::add_start( "OB_VIRGO_CARRIER_3" );
}

// Namespace ob_virgo_startpoint
// Params 0
// Checksum 0x71785eec, Offset: 0x351
// Size: 0x56
function function_b22efc63f5e59851()
{
    ob_gametype_story_mission::add_start( "OB_VIRGO_NM_JPN", { #joinspawn:1 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_NM_LA", { #joinspawn:1 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_NM_CARRIER", { #joinspawn:1 } );
    ob_gametype_story_mission::add_start( "OB_VIRGO_NM_REWARD" );
}

// Namespace ob_virgo_startpoint
// Params 0
// Checksum 0xdaad901, Offset: 0x3af
// Size: 0x21
function init_virgo_return()
{
    ob_gametype_story_mission::add_start( "ACTIVITY_STORY_RETURN", { #storycontract:#"virgo_complete" } );
}

