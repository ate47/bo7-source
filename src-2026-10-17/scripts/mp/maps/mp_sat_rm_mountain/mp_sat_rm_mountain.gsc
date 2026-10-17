#using script_49e4a4c208f44b76;
#using scripts\common\active_env\moving_platforms;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_mountain\gen\mp_sat_rm_mountain_art;
#using scripts\mp\maps\mp_sat_rm_mountain\mp_sat_rm_mountain_fx;
#using scripts\mp\maps\mp_sat_rm_mountain\mp_sat_rm_mountain_lighting;

#namespace mp_sat_rm_mountain;

// Namespace mp_sat_rm_mountain
// Params 0
// Checksum 0xf8f7b08a, Offset: 0x158
// Size: 0xd9
function main()
{
    mp_sat_rm_mountain_art::main();
    namespace_5339300d6b14b5d5::main();
    namespace_b34dbbfa684cb0e3::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    function_298bb4b0e9f9e647();
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_mountain" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread moving_platforms::moving_platforms_init();
}

// Namespace mp_sat_rm_mountain
// Params 0, eflags: 0x4
// Checksum 0x9d0a83cf, Offset: 0x239
// Size: 0xb1
function private function_298bb4b0e9f9e647()
{
    var_f0ea585a6d12887b = getentarray( "propHuntOOBs", #script_noteworthy );
    var_3ec3bb552a1449d0 = getxhash( game_utility::getgametype() );
    
    if ( var_3ec3bb552a1449d0 != #"prop" )
    {
        foreach ( trigger in var_f0ea585a6d12887b )
        {
            trigger delete();
        }
    }
}

