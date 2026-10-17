#using script_2aa77b5f4dfc2051;
#using script_3c8ea7f78632414c;
#using scripts\common\utility;
#using scripts\mp\fogofwar;

#namespace br_fogofwar;

// Namespace br_fogofwar
// Params 0
// Checksum 0xc2b707e3, Offset: 0x76
// Size: 0x45
function init()
{
    utility::registersharedfunc( #"fogofwar", #"isplayeringulag", &br_public::isplayeringulag );
    utility::registersharedfunc( #"fogofwar", #"givexpwithtext", &points::givexpwithtext );
    fogofwar::init();
}

