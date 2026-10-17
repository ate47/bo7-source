#using script_400030cfadc03f31;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;
#using scripts\mp\damage;

#namespace airdrop_multiple_mp;

// Namespace airdrop_multiple_mp
// Params 0
// Checksum 0xcccead77, Offset: 0x8a
// Size: 0x31
function airdrop_multiple_init()
{
    killstreaks::registerkillstreak( "airdrop_multiple", &airdrop::tryuseairdropmarkerfromstruct );
    utility::registersharedfunc( #"airdrop_multiple", #"monitordamage", &airdrop_multiple_monitordamage );
}

// Namespace airdrop_multiple_mp
// Params 7
// Checksum 0x9f4601c5, Offset: 0xc3
// Size: 0x53
function airdrop_multiple_monitordamage( maxhealth, damagefeedback, ondeathfunc, modifydamagefunc, biskillstreak, rumble, resetdamagetaken )
{
    damage::monitordamage( maxhealth, damagefeedback, ondeathfunc, modifydamagefunc, biskillstreak, rumble, resetdamagetaken );
}

