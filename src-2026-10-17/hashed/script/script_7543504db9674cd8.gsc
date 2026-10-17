#using script_6995a3eb7d571a9f;
#using script_785265c2027066bf;

#namespace assault_drone_mp;

// Namespace assault_drone_mp
// Params 0
// Checksum 0x9574e5fb, Offset: 0x87
// Size: 0x13
function assaultdrone_init()
{
    killstreaks::registerkillstreak( "assault_drone", &helper_drone::tryusehelperdronefromstruct );
}

