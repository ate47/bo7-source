#using script_5efe37e054c73937;
#using script_6995a3eb7d571a9f;
#using script_6ecce26a00447bae;
#using scripts\common\utility;

#namespace white_phosphorus_mp;

// Namespace white_phosphorus_mp
// Params 0
// Checksum 0x8dafcca2, Offset: 0x8a
// Size: 0x4f
function init()
{
    killstreaks::registerkillstreak( "white_phosphorus", &white_phosphorus::tryusewpfromstruct );
    utility::registersharedfunc( #"white_phosphorus", #"startmapselectsequence", &white_phosphorus_startmapselectsequence );
    utility::registersharedfunc( #"white_phosphorus", #"getselectmappoint", &white_phosphorus_getmapselectpoint );
}

// Namespace white_phosphorus_mp
// Params 4
// Checksum 0x9daca1a3, Offset: 0xe1
// Size: 0x44
function white_phosphorus_startmapselectsequence( navmesh, directionalselection, directionaltype, selectortype )
{
    assert( isplayer( self ), "<dev string:x24>" );
    mapselect::function_74e31405d43e142( navmesh, directionalselection, directionaltype );
}

// Namespace white_phosphorus_mp
// Params 3
// Checksum 0xb71b15fe, Offset: 0x12d
// Size: 0x3a
function white_phosphorus_getmapselectpoint( streakinfo, selectnum, directionalselection )
{
    assert( isplayer( self ), "<dev string:x24>" );
    return mapselect::function_ec95e9f1b6d329fb( streakinfo, selectnum, directionalselection );
}

