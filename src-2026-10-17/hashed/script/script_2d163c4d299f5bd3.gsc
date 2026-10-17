#using script_695729716dc6f653;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;
#using scripts\common\vehicle_damage;

#namespace chopper_support_mp;

// Namespace chopper_support_mp
// Params 0
// Checksum 0x1278c0fb, Offset: 0x9b
// Size: 0x8b
function init()
{
    bundle = level.streakglobals.streakbundles[ "airdrop_escort" ];
    
    if ( isdefined( bundle ) && isdefined( bundle.var_442269833ef7493a ) )
    {
        killstreaks::registerkillstreakdamagedealingweapon( "airdrop_escort", bundle.var_442269833ef7493a, #"large" );
    }
    
    killstreaks::registerkillstreak( "chopper_support", &chopper_support::tryusechoppersupportfromstruct );
    utility::registersharedfunc( #"chopper_support", #"set_vehicle_hit_damage_data", &chopper_support_set_vehicle_hit_damage_data );
}

// Namespace chopper_support_mp
// Params 2
// Checksum 0x68fffde, Offset: 0x12e
// Size: 0x1f
function chopper_support_set_vehicle_hit_damage_data( ref, hitstokill )
{
    vehicle_damage::set_vehicle_hit_damage_data( ref, hitstokill );
}

