#using scripts\common\callbacks;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_rm_express\gen\mp_sat_rm_express_art;
#using scripts\mp\maps\mp_sat_rm_express\mp_sat_rm_express_fx;
#using scripts\mp\maps\mp_sat_rm_express\mp_sat_rm_express_lighting;
#using scripts\mp\maps\mp_sat_rm_express\mp_sat_rm_express_train;

#namespace mp_sat_rm_express;

// Namespace mp_sat_rm_express
// Params 0
// Checksum 0xc1a4496f, Offset: 0x147
// Size: 0x109
function main()
{
    mp_sat_rm_express_art::main();
    mp_sat_rm_express_fx::main();
    mp_sat_rm_express_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_rm_express" );
    setdvar( @"r_umbraminobjectcontribution", 8 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    callback::add( #"player_spawn_init", &on_spawn_init );
    
    if ( getdvarint( @"hash_e36b3949e73e35a0", 1 ) )
    {
        level thread mp_sat_rm_express_train::main();
    }
}

// Namespace mp_sat_rm_express
// Params 1
// Checksum 0x65bf20b2, Offset: 0x258
// Size: 0xc
function on_spawn_init( params )
{
    
}

