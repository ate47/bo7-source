#using scripts\common\callbacks;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_shipyard\gen\mp_sat_shipyard_art;
#using scripts\mp\maps\mp_sat_shipyard\mp_sat_shipyard_fx;
#using scripts\mp\maps\mp_sat_shipyard\mp_sat_shipyard_lighting;

#namespace mp_sat_shipyard;

// Namespace mp_sat_shipyard
// Params 0
// Checksum 0xe5a57c57, Offset: 0x19f
// Size: 0xe6
function main()
{
    mp_sat_shipyard_art::main();
    namespace_154b38b21c5b8042::main();
    namespace_d5cf07aa816477e8::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_shipyard" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    callback::add( #"player_spawn_init", &on_spawn_init );
    function_4c3843705e1e2ae7();
}

// Namespace mp_sat_shipyard
// Params 0
// Checksum 0xeca8343c, Offset: 0x28d
// Size: 0xa0
function function_4c3843705e1e2ae7()
{
    var_aec35452541520ef = spawn( "script_model", ( -456, 1834, 136.5 ) );
    var_aec35452541520ef.angles = ( 0, 191.539, 0 );
    var_aec35452541520ef setscale( 4 );
    var_aec35452541520ef setmodel( "t10_construction_pipes_metal_joint_2way_01" );
    var_aec3555254152322 = spawn( "script_model", ( 96.875, 446.375, 185 ) );
    var_aec3555254152322.angles = ( 0, 90, 0 );
    var_aec3555254152322 setscale( 1 );
    var_aec3555254152322 setmodel( "door_old_rusted_metal_02" );
}

// Namespace mp_sat_shipyard
// Params 1
// Checksum 0xfca6c4aa, Offset: 0x335
// Size: 0xc
function on_spawn_init( params )
{
    
}

