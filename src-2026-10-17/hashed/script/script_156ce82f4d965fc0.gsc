#using script_501664a0dffc664d;
#using script_50689c1d9e3ef00a;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;
#using scripts\mp\damage;

#namespace toma_strike_mp;

// Namespace toma_strike_mp
// Params 0
// Checksum 0x7a00f894, Offset: 0x85
// Size: 0xde
function init()
{
    killstreaks::registerkillstreak( "toma_strike", &toma_strike::tryusetomastrikefromstruct );
    utility::registersharedfunc( #"toma_strike", #"monitordamage", &toma_strike_monitordamage );
    utility::registersharedfunc( #"toma_strike", #"molotov_branch_draw_hits", &toma_strike_molotov_branch_draw_hits );
    bundle = level.streakglobals.streakbundles[ "toma_strike" ];
    
    if ( isdefined( bundle ) && isdefined( bundle.toma_weapon_name ) )
    {
        killstreaks::registerkillstreakdamagedealingweapon( "toma_strike", bundle.toma_weapon_name, #"medium" );
    }
    
    if ( isdefined( bundle ) && isdefined( bundle.deployweaponname ) )
    {
        killstreaks::registerkillstreakdamagedealingweapon( "toma_strike", bundle.deployweaponname, #"donotregister" );
    }
}

// Namespace toma_strike_mp
// Params 7
// Checksum 0x9763537a, Offset: 0x16b
// Size: 0x53
function toma_strike_monitordamage( maxhealth, damagefeedback, ondeathfunc, modifydamagefunc, biskillstreak, rumble, resetdamagetaken )
{
    damage::monitordamage( maxhealth, damagefeedback, ondeathfunc, modifydamagefunc, biskillstreak, rumble, resetdamagetaken );
}

// Namespace toma_strike_mp
// Params 0
// Checksum 0x497c89a1, Offset: 0x1c6
// Size: 0xc
function toma_strike_molotov_branch_draw_hits()
{
    /#
        thread molotov::molotov_branch_draw_hits();
    #/
}

