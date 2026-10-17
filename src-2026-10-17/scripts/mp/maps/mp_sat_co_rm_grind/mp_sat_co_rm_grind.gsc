#using scripts\common\utility;
#using scripts\mp\animation_suite;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_co_rm_grind\gen\mp_sat_co_rm_grind_art;
#using scripts\mp\maps\mp_sat_co_rm_grind\mp_sat_co_rm_grind_fx;
#using scripts\mp\maps\mp_sat_co_rm_grind\mp_sat_co_rm_grind_lighting;

#namespace mp_sat_co_rm_grind;

// Namespace mp_sat_co_rm_grind
// Params 0
// Checksum 0xc8210063, Offset: 0x18e
// Size: 0xd9
function main()
{
    mp_sat_co_rm_grind_art::main();
    namespace_1527e428e71c059f::main();
    namespace_43980ab29a7d1c45::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_co_rm_grind" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread animation_suite::animationsuite();
    thread setup_vista_driving_boats();
}

// Namespace mp_sat_co_rm_grind
// Params 0
// Checksum 0xb4d9fc05, Offset: 0x26f
// Size: 0x177
function setup_vista_driving_boats()
{
    wait 10;
    boats = getentarray( "boat_vista", #targetname );
    boatspeed = 0.004;
    var_b4468cde7da77962 = 0.0166667;
    wait 2;
    
    foreach ( boat in boats )
    {
        boat.boatfx = utility::spawn_tag_origin();
        boat.boatfx.origin = boat.origin;
        boat.boatfx.angles = boat.angles;
        boat.boatfx.targetname = "boatFX";
        boat.boatfx show();
        boat.boatfx linkto( boat );
        
        if ( boat.model == "jup_periph_yacht_princess_01" )
        {
            boatspeed = 0.000666667;
        }
        else
        {
            boatspeed = 0.004;
        }
        
        wait 0.1;
        thread vista_boat_drive( boat, boatspeed );
    }
}

// Namespace mp_sat_co_rm_grind
// Params 2
// Checksum 0x197d3320, Offset: 0x3ee
// Size: 0xdb
function vista_boat_drive( boat, boatspeed )
{
    currentdest = utility::getstruct( boat.target, "targetname" );
    
    while ( true )
    {
        boatmovetime = abs( distance( boat.origin, currentdest.origin ) * boatspeed );
        boat moveto( currentdest.origin, boatmovetime, 0, 0 );
        
        if ( isdefined( currentdest.angles ) )
        {
            boat rotateto( currentdest.angles, boatmovetime, 0, 0 );
        }
        else
        {
            boat rotateto( ( 0, 0, 0 ), boatmovetime, 0, 0 );
        }
        
        currentdest = utility::getstruct( currentdest.target, "targetname" );
        wait boatmovetime;
    }
}

