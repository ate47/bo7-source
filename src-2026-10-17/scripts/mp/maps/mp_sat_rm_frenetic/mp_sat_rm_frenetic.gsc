#using script_49e4a4c208f44b76;
#using script_709f5f888cd7904d;
#using scripts\common\active_env\moving_platforms;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_frenetic\gen\mp_sat_rm_frenetic_art;
#using scripts\mp\maps\mp_sat_rm_frenetic\mp_sat_rm_frenetic_fx;
#using scripts\mp\maps\mp_sat_rm_frenetic\mp_sat_rm_frenetic_lighting;

#namespace mp_sat_rm_frenetic;

// Namespace mp_sat_rm_frenetic
// Params 0
// Checksum 0x56f719f3, Offset: 0x166
// Size: 0xdd
function main()
{
    mp_sat_rm_frenetic_art::main();
    namespace_e08bd746742e9ade::main();
    namespace_ec44d0420ce53ca4::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    function_298bb4b0e9f9e647();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_frenetic" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread moving_platforms::moving_platforms_init();
    level thread namespace_9802b2422c258ec9::main();
}

// Namespace mp_sat_rm_frenetic
// Params 0, eflags: 0x4
// Checksum 0x9adcb811, Offset: 0x24b
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

