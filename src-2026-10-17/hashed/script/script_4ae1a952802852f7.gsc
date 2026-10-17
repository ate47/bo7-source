#using script_5925e714a9b193a8;
#using script_d74ae0b4aa21186;
#using scripts\common\utility;
#using scripts\mp\bots\bots_gametype_super_shared;
#using scripts\mp\bots\bots_util;

#namespace namespace_73faf998e0ac6104;

// Namespace namespace_73faf998e0ac6104
// Params 0
// Checksum 0x3e22524d, Offset: 0xea
// Size: 0x12
function createdecision()
{
    return mind::function_6e220221dd563155( &evaluatescore, &createaction );
}

// Namespace namespace_73faf998e0ac6104
// Params 1
// Checksum 0x66905dbe, Offset: 0x105
// Size: 0x1f
function evaluatescore( bot )
{
    return self.constants.basescore;
}

// Namespace namespace_73faf998e0ac6104
// Params 1
// Checksum 0xdc0b0055, Offset: 0x12d
// Size: 0x28
function createaction( bot )
{
    return mind::createactionbase( "wander", undefined, "main", "", &actionprocess, self );
}

// Namespace namespace_73faf998e0ac6104
// Params 1
// Checksum 0xbf8efa11, Offset: 0x15e
// Size: 0xaf
function actionprocess( bot )
{
    if ( isdefined( level.bot_funcs[ "mp_wander_select_destination" ] ) )
    {
        pointonnavmesh = bot [[ level.bot_funcs[ "mp_wander_select_destination" ] ]]();
    }
    else
    {
        pointonnavmesh = bot selectdestination();
    }
    
    if ( !isdefined( pointonnavmesh ) )
    {
        return "No destination";
    }
    
    bot bots_gametype_super_shared::setscriptgoal( pointonnavmesh, 400 );
    result = bot utility::waittill_any_in_array_or_timeout( [ "goal", "bad_path", "long_path" ], 15 );
    
    if ( result != "goal" && result != "timeout" )
    {
        return result;
    }
}

// Namespace namespace_73faf998e0ac6104
// Params 2, eflags: 0x4
// Checksum 0x3ed997cb, Offset: 0x215
// Size: 0x89
function private selectdestination( radius = 2500, center = self.origin )
{
    var_33ff6787341013c = 60;
    point = function_4e32e8e2f4faf77e( center, radius, 0.85, 1, self.angles[ 1 ] - var_33ff6787341013c, self.angles[ 1 ] + var_33ff6787341013c );
    reachable_point = bots_gametype_super_shared::function_95089351b7addf9f( point );
    return reachable_point;
}

// Namespace namespace_73faf998e0ac6104
// Params 6, eflags: 0x4
// Checksum 0xbb667a9b, Offset: 0x2a7
// Size: 0x70
function private function_4e32e8e2f4faf77e( origin, radius, percentmin, percentmax, minangle, maxangle )
{
    pos = br_circle::getrandompointincircle( origin, radius, percentmin, percentmax, 0, 0, minangle, maxangle );
    return bots_util_mp::function_1882f18076610076( ( pos[ 0 ], pos[ 1 ], self.origin[ 2 ] ) );
}

