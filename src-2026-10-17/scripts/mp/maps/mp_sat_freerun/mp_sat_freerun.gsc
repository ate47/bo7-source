#using script_208a12cbcccbfa63;
#using scripts\common\active_env\moving_platforms;
#using scripts\common\utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_freerun\gen\mp_sat_freerun_art;
#using scripts\mp\maps\mp_sat_freerun\mp_sat_freerun_fx;
#using scripts\mp\maps\mp_sat_freerun\mp_sat_freerun_lighting;

#namespace mp_sat_freerun;

// Namespace mp_sat_freerun
// Params 0
// Checksum 0x98db1d16, Offset: 0x1ae
// Size: 0x7d
function main()
{
    mp_sat_freerun_art::main();
    mp_sat_freerun_fx::main();
    mp_sat_freerun_lighting::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_freerun" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread moving_platforms::moving_platforms_init();
}

// Namespace mp_sat_freerun
// Params 0
// Checksum 0x73bbd0ea, Offset: 0x233
// Size: 0x286
function setup_moving_platforms()
{
    wait 5;
    var_7a4eb683645a5cc = getentarray( "moving_platform", "script_noteworthy" );
    
    foreach ( e_platform in var_7a4eb683645a5cc )
    {
        if ( isdefined( e_platform.target ) )
        {
            utility::register_moving_platform_ent( e_platform );
            e_platform setmovingplatformdef( "movingplatform_noairtrack" );
            e_platform.destination = utility::getstruct( e_platform.target, "targetname" );
            level thread move_platform( e_platform );
        }
    }
    
    var_3ba80855e6482009 = getentarray( "moving_platform_rotator", "script_noteworthy" );
    
    foreach ( e_platform in var_3ba80855e6482009 )
    {
        utility::register_moving_platform_ent( e_platform );
        e_platform setmovingplatformdef( "movingplatform_noairtrack" );
        level thread move_platform_rotator( e_platform );
    }
    
    var_8dffa1456d97786a = getentarray( "animObj", "targetname" );
    
    foreach ( e_platform in var_8dffa1456d97786a )
    {
        utility::register_moving_platform_ent( e_platform );
        e_platform setmovingplatformdef( "movingplatform_noairtrack" );
    }
    
    var_5e7a865f0f9671de = getentarray( "moving_platform_trigger", "script_noteworthy" );
    
    foreach ( e_platformtrigger in var_5e7a865f0f9671de )
    {
        level trigger::makeenterexittrigger( e_platformtrigger, &moving_platform_trigger );
    }
}

// Namespace mp_sat_freerun
// Params 1
// Checksum 0xf32a740a, Offset: 0x4c1
// Size: 0x201
function move_platform( e_platform )
{
    level endon( #"game_ended" );
    n_startdelay = e_platform.script_delay;
    
    if ( !isdefined( n_startdelay ) )
    {
        n_startdelay = 0;
    }
    
    n_loopdelay = e_platform.script_wait;
    
    if ( !isdefined( n_loopdelay ) )
    {
        n_loopdelay = 0;
    }
    
    var_e661c6e9ff6f1059 = e_platform.script_speed;
    
    if ( !isdefined( var_e661c6e9ff6f1059 ) )
    {
        var_e661c6e9ff6f1059 = 0;
    }
    
    n_movetime = e_platform.script_timeout;
    
    if ( !isdefined( n_movetime ) )
    {
        n_movetime = 0;
    }
    
    var_4e1fa452e5a0c383 = 0;
    var_5240014eea17ad70 = 0;
    wait n_startdelay;
    
    while ( true )
    {
        var_55d6f7109a4c262b = n_movetime;
        
        if ( var_55d6f7109a4c262b == 0 )
        {
            var_55d6f7109a4c262b = abs( distance( e_platform.origin, e_platform.destination.origin ) ) / var_e661c6e9ff6f1059;
        }
        
        if ( var_55d6f7109a4c262b != 0 )
        {
            e_platform moveto( e_platform.destination.origin, var_55d6f7109a4c262b, var_4e1fa452e5a0c383, var_5240014eea17ad70 );
            
            if ( e_platform.destination.script_noteworthy == "rotate" )
            {
                e_platform rotateto( vectortoangles( e_platform.destination.origin - e_platform.origin ), var_55d6f7109a4c262b / 10 );
            }
            
            wait var_55d6f7109a4c262b + n_loopdelay;
            
            if ( e_platform.destination.script_noteworthy == "teleport" )
            {
                e_platform.destination = utility::getstruct( e_platform.destination.target, "targetname" );
                e_platform.origin = e_platform.destination.origin;
            }
        }
        
        e_platform.destination = utility::getstruct( e_platform.destination.target, "targetname" );
    }
}

// Namespace mp_sat_freerun
// Params 1
// Checksum 0xe269ebb, Offset: 0x6ca
// Size: 0x74
function move_platform_rotator( e_platform )
{
    level endon( #"game_ended" );
    var_4ac5227b58bdf660 = e_platform.script_rotation_amount;
    
    if ( !isdefined( var_4ac5227b58bdf660 ) )
    {
        var_4ac5227b58bdf660 = ( 0, 360, 0 );
    }
    
    var_c888bf9cc42af65a = e_platform.script_speed;
    
    if ( !isdefined( var_c888bf9cc42af65a ) )
    {
        var_c888bf9cc42af65a = 0;
    }
    
    while ( true )
    {
        e_platform rotateby( var_4ac5227b58bdf660, var_c888bf9cc42af65a );
        wait var_c888bf9cc42af65a;
    }
}

// Namespace mp_sat_freerun
// Params 2, eflags: 0x4
// Checksum 0x21861d33, Offset: 0x746
// Size: 0x14d
function private moving_platform_trigger( var_fd3a9f9e9a2a06c2, trigger )
{
    if ( isplayer( var_fd3a9f9e9a2a06c2 ) && isalive( var_fd3a9f9e9a2a06c2 ) )
    {
        var_731647e2320d5afe = getentarray( trigger.target, "targetname" );
        
        foreach ( e_platform in var_731647e2320d5afe )
        {
            s_targetlocation = utility::getstruct( e_platform.target, "targetname" );
            n_startdelay = e_platform.script_delay;
            
            if ( !isdefined( n_startdelay ) )
            {
                n_startdelay = 0;
            }
            
            var_e661c6e9ff6f1059 = e_platform.script_speed;
            
            if ( !isdefined( var_e661c6e9ff6f1059 ) )
            {
                var_e661c6e9ff6f1059 = 0;
            }
            
            wait n_startdelay;
            var_55d6f7109a4c262b = abs( distance( e_platform.origin, s_targetlocation.origin ) ) / var_e661c6e9ff6f1059;
            e_platform moveto( s_targetlocation.origin, var_55d6f7109a4c262b, 0, 0 );
        }
    }
}

