#using script_2bf5529af94c9a0;
#using script_641f981cc2b70c1a;
#using script_6995a3eb7d571a9f;
#using script_785265c2027066bf;
#using scripts\common\utility;
#using scripts\mp\flags;

#namespace recon_drone_mp;

// Namespace recon_drone_mp
// Params 0, eflags: 0x1
// Checksum 0xdf04b376, Offset: 0xcc
// Size: 0x9
function autoexec main()
{
    recondrone_init();
}

// Namespace recon_drone_mp
// Params 0
// Checksum 0xb6ea4062, Offset: 0xdd
// Size: 0x31
function recondrone_init()
{
    killstreaks::registerkillstreak( "radar_drone_recon", &helper_drone::tryusehelperdronefromstruct );
    utility::registersharedfunc( #"recondrone", #"hash_66946d6fe4c28180", &function_232ce837d5ac04cf );
}

// Namespace recon_drone_mp
// Params 0
// Checksum 0xe943155d, Offset: 0x116
// Size: 0x4a
function function_21dabd50ac2f7()
{
    if ( !isdefined( level.superglobals.staticsuperdata[ "super_recon_drone" ] ) )
    {
        return;
    }
    
    level.superglobals.staticsuperdata[ "super_recon_drone" ].var_1836be75d110dd2f = &recon_drone::function_ec5bc8c2dd7b60b4;
}

// Namespace recon_drone_mp
// Params 0
// Checksum 0xceeaddfd, Offset: 0x168
// Size: 0x20
function function_232ce837d5ac04cf()
{
    if ( isbrgamemode() && !flags::gameflag( "prematch_fade_done" ) )
    {
        thread function_b897400ae3e62135();
    }
}

// Namespace recon_drone_mp
// Params 0
// Checksum 0x76ba5f08, Offset: 0x190
// Size: 0x5a
function function_b897400ae3e62135()
{
    self endon( #"death_or_disconnect" );
    self endon( #"recondroneended" );
    self endon( #"recondroneunset" );
    flags::gameflagwait( "prematch_fade_done" );
    objweapon = makeweapon( "ks_remote_drone_mp" );
    
    if ( self hasweapon( objweapon ) )
    {
        inventory_utility::_takeweapon( objweapon );
    }
}

