#using script_50689c1d9e3ef00a;
#using script_6995a3eb7d571a9f;
#using script_70d399b96f8edd30;
#using scripts\common\missilelauncher;
#using scripts\common\utility;
#using scripts\mp\spawnlogic;
#using scripts\mp\weapons;

#namespace gunship_mp;

// Namespace gunship_mp
// Params 0
// Checksum 0xf0647776, Offset: 0xb7
// Size: 0x199
function init()
{
    killstreaks::registerkillstreak( "gunship", &gunship::tryusegunshipfromstruct );
    utility::registersharedfunc( #"gunship", #"findboxcenter", &gunship_findboxcenter );
    utility::registersharedfunc( #"gunship", #"getbombingpoint", &gunship_getbombingpoint );
    utility::registersharedfunc( #"gunship", #"attachxrays", &gunship_attachxrays );
    utility::registersharedfunc( #"gunship", #"lockonlaunchers_gettargetarray", &weapons::lockonlaunchers_gettargetarray );
    utility::registersharedfunc( #"gunship", #"resetmissilelauncherlocking", &missilelauncher::resetmissilelauncherlocking );
    utility::registersharedfunc( #"gunship", #"missilelauncher_finalizelock", &missilelauncher::missilelauncher_finalizelock );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_create", &missilelauncher::stingtargstruct_create );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_getoffsets", &missilelauncher::stingtargstruct_getoffsets );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_getorigins", &missilelauncher::stingtargstruct_getorigins );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_getinreticle", &missilelauncher::stingtargstruct_getinreticle );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_isinreticle", &missilelauncher::stingtargstruct_isinreticle );
    utility::registersharedfunc( #"gunship", #"stingtargstruct_getinlos", &missilelauncher::stingtargstruct_getinlos );
    utility::registersharedfunc( #"gunship", #"softsighttest", &missilelauncher::softsighttest );
}

// Namespace gunship_mp
// Params 2
// Checksum 0xfcc03f38, Offset: 0x258
// Size: 0x1e
function gunship_findboxcenter( mins, maxs )
{
    return spawnlogic::findboxcenter( mins, maxs );
}

// Namespace gunship_mp
// Params 2
// Checksum 0xf58dd59, Offset: 0x27f
// Size: 0x35
function gunship_getbombingpoint( centerpoint, bombingradius )
{
    var_9e3443da58c12508 = toma_strike::tomastrike_getrandombombingpoint( centerpoint, bombingradius );
    return var_9e3443da58c12508.point;
}

// Namespace gunship_mp
// Params 1
// Checksum 0xd7b80325, Offset: 0x2bd
// Size: 0x22
function gunship_attachxrays( gunship )
{
    gunship setentityhudoutlinedata( 3, gunship.team );
    return gunship;
}

// Namespace gunship_mp
// Params 2
// Checksum 0x75042932, Offset: 0x2e8
// Size: 0x2c
function function_1e8307a2c306ba5f( channel, weaponindex )
{
    if ( channel != "gunship_weapon_selection" )
    {
        return;
    }
    
    self notify( "gunship_switch_weapon_" + weaponindex );
}

