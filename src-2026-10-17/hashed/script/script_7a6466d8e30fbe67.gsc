#using script_60e83c26eb0cc317;
#using script_6995a3eb7d571a9f;
#using script_7543504db9674cd8;
#using script_785265c2027066bf;
#using scripts\common\utility;

#namespace helper_drone_mp;

// Namespace helper_drone_mp
// Params 0
// Checksum 0x7f346cf5, Offset: 0x8f
// Size: 0x44
function helper_drone_init()
{
    assault_drone_mp::assaultdrone_init();
    killstreaks::registerkillstreak( "radar_drone_overwatch", &helper_drone::tryusehelperdronefromstruct );
    join_team_aggregator::registeronplayerjointeamcallback( &helperdrone_updateheadicononjointeam );
    utility::registersharedfunc( #"helper_drone", #"attachxrays", &helperdrone_attachxrays );
}

// Namespace helper_drone_mp
// Params 1
// Checksum 0xdf2d69e2, Offset: 0xdb
// Size: 0xc
function helperdrone_updateheadicononjointeam( player )
{
    
}

// Namespace helper_drone_mp
// Params 1
// Checksum 0xe45d2da9, Offset: 0xef
// Size: 0x22
function helperdrone_attachxrays( helperdrone )
{
    helperdrone setentityhudoutlinedata( 3, helperdrone.team );
    return helperdrone;
}

