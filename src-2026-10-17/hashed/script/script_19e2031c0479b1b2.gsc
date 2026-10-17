#using script_2e13fba0234d3dc4;
#using script_3c8ea7f78632414c;
#using script_629fd7d4479d556d;
#using script_6995a3eb7d571a9f;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace airdrop_escort_mp;

// Namespace airdrop_escort_mp
// Params 0
// Checksum 0xc691585c, Offset: 0x88
// Size: 0x99
function airdrop_escort_init()
{
    killstreaks::registerkillstreak( "airdrop_escort", &airdrop_escort::function_fb85603965ac497a );
    utility::registersharedfunc( #"airdrop_escort", #"attachxrays", &airdrop_escort_attachxrays );
    bundle = level.streakglobals.streakbundles[ "airdrop_escort" ];
    
    if ( bundle.var_442269833ef7493a )
    {
        killstreaks::registerkillstreakdamagedealingweapon( "airdrop_escort", bundle.var_442269833ef7493a, #"large" );
    }
    
    callback::add( #"player_death", &on_player_killed );
}

// Namespace airdrop_escort_mp
// Params 1
// Checksum 0x905761a0, Offset: 0x129
// Size: 0x22
function airdrop_escort_attachxrays( escortheli )
{
    escortheli setentityhudoutlinedata( 3, escortheli.team );
    return escortheli;
}

// Namespace airdrop_escort_mp
// Params 1
// Checksum 0x69c83882, Offset: 0x154
// Size: 0xd4
function on_player_killed( deathdata )
{
    if ( !isdefined( deathdata.objweapon ) )
    {
        return;
    }
    
    killstreakweaponname = killstreak::getkillstreaknamefromweapon( deathdata.objweapon );
    is_airdrop_escort = killstreakweaponname == "airdrop_escort";
    
    if ( !is_airdrop_escort )
    {
        return;
    }
    
    if ( !isdefined( deathdata.attacker.var_2caafa207b756de9 ) )
    {
        deathdata.attacker.var_2caafa207b756de9 = 1;
    }
    else
    {
        deathdata.attacker.var_2caafa207b756de9++;
    }
    
    if ( deathdata.attacker.var_2caafa207b756de9 == 3 )
    {
        deathdata.attacker thread points::doscoreevent( #"escort_chopper_triple" );
    }
}

