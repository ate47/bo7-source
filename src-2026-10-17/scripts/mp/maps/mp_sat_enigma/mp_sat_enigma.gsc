#using script_353e34c229ca1589;
#using scripts\common\active_env\portals;
#using scripts\common\active_env\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_enigma\gen\mp_sat_enigma_art;
#using scripts\mp\maps\mp_sat_enigma\mp_sat_enigma_fx;
#using scripts\mp\maps\mp_sat_enigma\mp_sat_enigma_lighting;

#namespace mp_sat_enigma;

// Namespace mp_sat_enigma
// Params 0
// Checksum 0x81a89043, Offset: 0x182
// Size: 0x13e
function main()
{
    mp_sat_enigma_art::main();
    namespace_145704a8722b5d9b::main();
    mp_sat_enigma_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    level.var_1094bbb6422bd39a = 1;
    compass::setupminimap( "compass_map_mp_sat_enigma" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    portals::portals_init();
    level thread machete_anim();
    
    /#
        level thread update_dev();
    #/
    
    callback::add( #"player_death", &on_player_death );
    weaponfilter = [ #"dawg":1, #"missile_turret":1, #"remote_turret":1 ];
    utility::setup_no_deploy_zones( weaponfilter );
}

// Namespace mp_sat_enigma
// Params 0, eflags: 0x4
// Checksum 0x8e197ca2, Offset: 0x2c8
// Size: 0x75
function private update_dev()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        if ( getdvarfloat( @"hash_38dd5ea6c6100ebd", 0 ) > 0 )
        {
            var_6a3a8db71dbfe9f4 = getdvarfloat( @"hash_38dd5ea6c6100ebd" );
            setdvar( @"hash_38dd5ea6c6100ebd", 0 );
            
            if ( level.var_c8d6604369d16df5 )
            {
                level thread machete_anim( 0, var_6a3a8db71dbfe9f4 );
            }
        }
        
        waitframe();
    }
}

// Namespace mp_sat_enigma
// Params 2, eflags: 0x4
// Checksum 0xa1f4c7ba, Offset: 0x345
// Size: 0x1fd
function private machete_anim( var_608d0792d42ced87 = undefined, var_66a563ed6f8b36d1 = undefined )
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    level.var_c8d6604369d16df5 = 0;
    var_455207c226282e7a = level.prematchperiodend <= 0;
    
    if ( game_utility_mp::isfirstround() && !var_455207c226282e7a && !( level.var_339ac09e83d0d5f0 === 1 ) )
    {
        level waittill( #"match_start_real_countdown" );
        level.var_339ac09e83d0d5f0 = 1;
    }
    
    machetes = getscriptablearray( "machetefall", #targetname );
    InvalidOpCode( 0x8f, 1 );
    // Unknown operator ( 0x8f, t11, PC )
LOC_00000130:
    delay = isdefined( var_608d0792d42ced87 ) ? var_66a563ed6f8b36d1 : var_66a563ed6f8b36d1;
    InvalidOpCode( 0x1a, randomint( 4 ) );
    // Unknown operator ( 0x1a, t11, PC )
LOC_0000014f:
    interval = var_66a563ed6f8b36d1 ?? var_66a563ed6f8b36d1;
    
    foreach ( machete in machetes )
    {
        machete function_bc3d7c98d9c2a54( "default" );
    }
    
    wait delay;
    
    foreach ( machete in machetes )
    {
        wait interval;
        machete function_bc3d7c98d9c2a54( "anim" );
    }
    
    level.var_c8d6604369d16df5 = 1;
}

// Namespace mp_sat_enigma
// Params 1, eflags: 0x4
// Checksum 0x881e9306, Offset: 0x54a
// Size: 0x26
function private function_bc3d7c98d9c2a54( new_state )
{
    if ( self getscriptablepartstate( "base" ) )
    {
        self setscriptablepartstate( "base", new_state );
    }
}

// Namespace mp_sat_enigma
// Params 1, eflags: 0x4
// Checksum 0x83dc4636, Offset: 0x578
// Size: 0x13
function private on_player_death( params )
{
    thread player_death_watcher();
}

// Namespace mp_sat_enigma
// Params 0, eflags: 0x4
// Checksum 0xb6e7bc2c, Offset: 0x593
// Size: 0x22
function private player_death_watcher()
{
    e_body = self getcorpseentity();
    
    if ( isdefined( e_body ) )
    {
        e_body thread function_ce9350287261d087();
    }
}

// Namespace mp_sat_enigma
// Params 0, eflags: 0x4
// Checksum 0x89ce6ece, Offset: 0x5bd
// Size: 0x3e
function private function_ce9350287261d087()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    while ( true )
    {
        wait 5;
        
        if ( self.origin[ 2 ] < -350 )
        {
            self delete();
        }
    }
}

