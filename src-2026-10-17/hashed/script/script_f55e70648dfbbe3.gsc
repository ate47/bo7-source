#using script_50ef91777fbaecc3;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;
#using scripts\mp\events;

#namespace cruise_predator_mp;

// Namespace cruise_predator_mp
// Params 0
// Checksum 0xc9be6257, Offset: 0x109
// Size: 0x61
function init()
{
    killstreaks::registerkillstreak( "cruise_predator", &cruise_predator::tryusecruisepredatorfromstruct );
    utility::registersharedfunc( "cruise_predator", #"registervo", &cruisepredator_registervo );
    utility::registersharedfunc( "cruise_predator", #"eventrecord", &cruisepredator_eventrecord );
    utility::registersharedfunc( "cruise_predator", #"assigntargetmarkers", &cruisepredator_assigntargetmarkers );
}

// Namespace cruise_predator_mp
// Params 0
// Checksum 0x4bd7f909, Offset: 0x172
// Size: 0x5f
function cruisepredator_registervo()
{
    game[ "dialog" ][ "cruise_predator" + "_use" ] = "killstreak_remote_operator" + "_request_response";
    game[ "dialog" ][ "cruise_predator" + "_hit_target" ] = "killstreak_remote_operator" + "_hit_target";
    game[ "dialog" ][ "cruise_predator" + "_miss_target" ] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace cruise_predator_mp
// Params 1
// Checksum 0x68af6da2, Offset: 0x1d9
// Size: 0x1b
function cruisepredator_eventrecord( explodepos )
{
    if ( isdefined( explodepos ) )
    {
        events::predatormissileimpact( explodepos );
    }
}

// Namespace cruise_predator_mp
// Params 1
// Checksum 0x72f574a8, Offset: 0x1fc
// Size: 0x1a4
function cruisepredator_assigntargetmarkers( user )
{
    var_361a7ab2055af3a = [];
    var_d79ad8c4fb866425 = [];
    characterarray = level.players;
    groupsstruct = spawnstruct();
    
    foreach ( player in characterarray )
    {
        if ( level.teambased && player.team == user.team || player == user )
        {
            var_d79ad8c4fb866425[ var_d79ad8c4fb866425.size ] = player;
            continue;
        }
        
        if ( isdefined( player.perks[ "specialty_noscopeoutline" ] ) )
        {
            continue;
        }
        
        var_361a7ab2055af3a[ var_361a7ab2055af3a.size ] = player;
    }
    
    if ( isdefined( level.killstreak_additional_targets ) )
    {
        foreach ( target in level.killstreak_additional_targets )
        {
            var_361a7ab2055af3a[ var_361a7ab2055af3a.size ] = target;
        }
    }
    
    groupsstruct.enemytargetmarkergroup = var_361a7ab2055af3a;
    groupsstruct.friendlytargetmarkergroup = var_d79ad8c4fb866425;
    return groupsstruct;
}

