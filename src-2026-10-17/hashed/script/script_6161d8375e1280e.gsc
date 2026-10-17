#using script_5560f3066718e34c;
#using script_5fead3bc6567669a;
#using script_6549c4611bbb9960;
#using scripts\asm\shared\mp\utility;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\gametypes\ob;

#namespace razor_agent;

// Namespace razor_agent
// Params 0, eflags: 0x5
// Checksum 0xb56130bd, Offset: 0x32c
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"razor", undefined, &precache, undefined );
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0x51684fd2, Offset: 0x34d
// Size: 0x2f
function private precache()
{
    utility::add_fx( "razor_overcharge_trail", "vfx_sat_light_doa_pickup_glow_green_ztron" );
    utility::add_fx( "razor_overcharge_target", "vfx_sat_light_doa_pickup_glow_green_ztron" );
    
    /#
        level thread razordev();
    #/
}

/#

    // Namespace razor_agent
    // Params 0, eflags: 0x4
    // Checksum 0x11dbedda, Offset: 0x384
    // Size: 0x283, Type: dev
    function private razordev()
    {
        debug_update_interval = 0.5;
        debug_print_frames = max( int( 20 * debug_update_interval ), 1 );
        
        while ( true )
        {
            if ( isdefined( level.var_4c46eae4ddd9b960 ) )
            {
                level.var_4c46eae4ddd9b960 = utility::array_removedead_or_dying( level.var_4c46eae4ddd9b960 );
                force_kill = getdvarint( @"scr_razor_force_kill", 0 );
                
                if ( force_kill )
                {
                    foreach ( RAZOR in level.var_4c46eae4ddd9b960 )
                    {
                        if ( isalive( RAZOR ) )
                        {
                            RAZOR kill();
                        }
                    }
                    
                    setdvar( @"scr_razor_force_kill", 0 );
                }
                
                if ( getdvarint( @"hash_374b878d8d65bb08", 0 ) )
                {
                    foreach ( RAZOR in level.var_4c46eae4ddd9b960 )
                    {
                        if ( isalive( RAZOR ) )
                        {
                            print3d( RAZOR.origin + ( 0, 0, 72 ), "<dev string:x24>", ( 1, 1, 0 ), 1, 0.8, debug_print_frames, 0 );
                        }
                    }
                }
                
                if ( getdvarint( @"hash_7d6ca17d496048e1", 0 ) )
                {
                    foreach ( RAZOR in level.var_4c46eae4ddd9b960 )
                    {
                        if ( isalive( RAZOR ) )
                        {
                            print3d( RAZOR.origin + ( 0, 0, 60 ), "<dev string:x36>", ( 1, 1, 0 ), 1, 0.8, debug_print_frames, 0 );
                        }
                    }
                }
            }
            
            wait debug_update_interval;
        }
    }

#/

// Namespace razor_agent
// Params 1
// Checksum 0x4a145c6a, Offset: 0x60f
// Size: 0x78
function init( taskid )
{
    RAZOR = self;
    level callback::callback( #"hash_9a299cdcfc8a796a", { #RAZOR:RAZOR } );
    RAZOR function_b69170f93fd1bb45();
    
    /#
        if ( !isdefined( level.var_4c46eae4ddd9b960 ) )
        {
            level.var_4c46eae4ddd9b960 = [];
        }
        
        level.var_4c46eae4ddd9b960[ level.var_4c46eae4ddd9b960.size ] = RAZOR;
    #/
    
    return anim.success;
}

// Namespace razor_agent
// Params 2
// Checksum 0xff014617, Offset: 0x690
// Size: 0xd8
function shouldteleport( taskid, params )
{
    RAZOR = self;
    
    /#
        if ( getdvarint( @"hash_374b878d8d65bb08", 0 ) )
        {
            return anim.failure;
        }
    #/
    
    if ( isdefined( RAZOR.callbacks[ #"razor_should_teleport" ] ) )
    {
        var_78b9f658d7f1e5fc = RAZOR getaiblackboarddynamic( "last_teleport_start_time" ) ?? 0;
        shouldteleport = RAZOR callback::response( 0, #"razor_should_teleport", { #var_78b9f658d7f1e5fc:var_78b9f658d7f1e5fc } );
    }
    else
    {
        debounce_end_time = RAZOR getaiblackboarddynamic( "teleport_debounce_end" ) ?? 0;
        shouldteleport = gettime() >= debounce_end_time;
    }
    
    if ( !shouldteleport )
    {
        return anim.failure;
    }
    
    return anim.success;
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0x6cfc43d9, Offset: 0x771
// Size: 0x33
function private function_b69170f93fd1bb45()
{
    RAZOR = self;
    RAZOR.teleportsuper = { #teleportdistance:400, #var_c4c8e715e8cef74b:5 };
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0xbb55549, Offset: 0x7ac
// Size: 0x325
function private function_649c3493f949541e()
{
    RAZOR = self;
    angles = RAZOR getplayerangles();
    pitch = angleclamp180( angles[ 0 ] );
    pitch = clamp( pitch, RAZOR.teleportsuper.var_c4c8e715e8cef74b * -1, RAZOR.teleportsuper.var_c4c8e715e8cef74b );
    angles = ( pitch, angles[ 1 ], 0 );
    forward = anglestoforward( angles );
    var_fda6f8fcad6fd904 = randomintrange( 60, 120 );
    
    if ( utility::cointoss() )
    {
        var_fda6f8fcad6fd904 *= -1;
    }
    
    direction = rotatevector( forward, ( 0, var_fda6f8fcad6fd904, 0 ) );
    capsule = RAZOR getcollision( "stand" );
    radius = capsule.capsule_radius;
    height = capsule.capsule_halfheight + capsule.capsule_midpoint_height + capsule.capsule_radius;
    heightoffset = ( 0, 0, height / 2 );
    tracestart = RAZOR.origin + heightoffset;
    traceend = tracestart + direction * RAZOR.teleportsuper.teleportdistance;
    traceground = teleport::function_c33d160170c4d03( traceend );
    
    if ( traceground )
    {
        traceground += heightoffset;
        contents = teleport::function_fecaa5985cc1ba5f();
        traceresult = trace::sphere_trace( tracestart, traceground, radius, RAZOR, contents );
        
        if ( traceresult[ "fraction" ] < 1 )
        {
            traceground = traceresult[ "shape_position" ];
        }
    }
    
    var_4713618a1528edce = { #var_43718e5d70973abe:traceground };
    var_84375a2858ae0a57 = RAZOR callback::response( 0, #"hash_77581cf1ebaf5f7b", var_4713618a1528edce );
    
    if ( var_84375a2858ae0a57 )
    {
        assert( isdefined( var_4713618a1528edce.var_75279a674dedfdeb ) );
        traceground = var_4713618a1528edce.var_75279a674dedfdeb;
        RAZOR.var_ace4896b0731607 = var_4713618a1528edce;
    }
    else if ( traceground )
    {
        /#
            if ( getdvarint( @"hash_e9b0e88454e8bf21", 0 ) )
            {
                forward_start = RAZOR.origin + ( 0, 0, 5 );
                forward_end = forward_start + forward * 20;
                line( forward_start, forward_end, ( 1, 1, 1 ), 1, 0, 400 );
                direction_end = forward_start + direction * 20;
                line( forward_start, direction_end, ( 0, 1, 0 ), 1, 0, 400 );
                sphere( traceground, 3, ( 1, 1, 0 ), 0, 400 );
                line( RAZOR.origin, traceground, ( 1, 1, 0 ), 1, 0, 400 );
                print3d( traceground, "<dev string:x4a>", ( 1, 1, 0 ), 1, 0.75, 400, 0 );
            }
        #/
    }
    
    return traceground;
}

// Namespace razor_agent
// Params 1, eflags: 0xc
// Checksum 0xc603a339, Offset: 0xada
// Size: 0x66
function private function_354465f71f91a7c5( teleportlocation )
{
    self notify( #"hash_260fb73603e37686" );
    self endon( #"hash_260fb73603e37686" );
    RAZOR = self;
    RAZOR endon( #"death" );
    RAZOR setscriptablepartstate( "teleport_fx", "teleport_finish" );
    wait 1;
    RAZOR setscriptablepartstate( "teleport_fx", "off" );
}

// Namespace razor_agent
// Params 2, eflags: 0xc
// Checksum 0xd21faa80, Offset: 0xb48
// Size: 0x84
function private function_a7c6495f347b732d( location, duration )
{
    self notify( #"hash_3fa45c695db4f0a8" );
    self endon( #"hash_3fa45c695db4f0a8" );
    RAZOR = self;
    RAZOR endon( #"death" );
    RAZOR setbtgoalpos( 3, location );
    RAZOR setbtgoalradius( 3, 16 );
    RAZOR.fixednode = 1;
    wait duration;
    RAZOR.fixednode = 0;
    RAZOR clearbtgoal( 3 );
}

// Namespace razor_agent
// Params 2, eflags: 0x4
// Checksum 0xbf253916, Offset: 0xbd4
// Size: 0xcc
function private doteleport( teleportlocation, var_4d61da830e8bc79e )
{
    RAZOR = self;
    RAZOR endon( #"death" );
    RAZOR val::set( "razor_teleport", "damage", 0 );
    RAZOR function_786bb6aa1b76c7ee( "last_teleport_start_time", gettime() );
    RAZOR function_786bb6aa1b76c7ee( "teleport_done", 0 );
    RAZOR thread function_a7c6495f347b732d( RAZOR.origin, level.framedurationseconds );
    RAZOR setscriptablepartstate( "teleport_fx", "teleport_start" );
    waitframe();
    RAZOR thread function_a7c6495f347b732d( teleportlocation, var_4d61da830e8bc79e );
    RAZOR teleport::function_39fb9b6876d9527d( teleportlocation, 1 );
    RAZOR thread function_354465f71f91a7c5( teleportlocation );
    RAZOR function_786bb6aa1b76c7ee( "teleport_done", 1 );
    RAZOR val::reset_all( "razor_teleport" );
}

// Namespace razor_agent
// Params 1
// Checksum 0xe743cf5d, Offset: 0xca8
// Size: 0xc6
function teleportstart( taskid )
{
    RAZOR = self;
    RAZOR.var_ace4896b0731607 = undefined;
    teleportlocation = RAZOR function_649c3493f949541e();
    
    if ( !teleportlocation )
    {
        return anim.failure;
    }
    
    if ( !RAZOR.var_ace4896b0731607 )
    {
        var_1a6c9b1e8a0bc922 = 65536;
        
        if ( distancesquared( teleportlocation, RAZOR.origin ) < var_1a6c9b1e8a0bc922 )
        {
            return anim.failure;
        }
    }
    
    RAZOR function_786bb6aa1b76c7ee( "teleport_start_success", 1 );
    RAZOR callback::callback( #"razor_teleport_start" );
    RAZOR thread doteleport( teleportlocation, randomfloatrange( 0.5, 1 ) );
    return anim.success;
}

// Namespace razor_agent
// Params 2
// Checksum 0x6a2b0425, Offset: 0xd77
// Size: 0x53
function teleportupdate( taskid, params )
{
    RAZOR = self;
    teleport_done = RAZOR getaiblackboarddynamic( "teleport_done" ) ?? 0;
    
    if ( teleport_done )
    {
        return anim.success;
    }
    
    return anim.running;
}

// Namespace razor_agent
// Params 1
// Checksum 0x524ba022, Offset: 0xdd3
// Size: 0xf2
function teleportend( taskid )
{
    RAZOR = self;
    RAZOR function_786bb6aa1b76c7ee( "teleport_done", 0 );
    
    /#
        if ( RAZOR.var_ace4896b0731607 )
        {
            assert( RAZOR getaiblackboarddynamic( "<dev string:x5f>" ) );
        }
    #/
    
    if ( RAZOR getaiblackboarddynamic( "teleport_start_success" ) )
    {
        RAZOR function_786bb6aa1b76c7ee( "teleport_start_success", 0 );
        debounce_time = randomintrange( 3000, 5000 );
        RAZOR function_786bb6aa1b76c7ee( "teleport_debounce_end", gettime() + debounce_time );
        overcharge_debounce_end_time = RAZOR getaiblackboarddynamic( "overcharge_debounce_end" ) ?? 0;
        var_5b00534a9cafb4ec = gettime() + 1000;
        
        if ( overcharge_debounce_end_time < var_5b00534a9cafb4ec )
        {
            RAZOR function_786bb6aa1b76c7ee( "overcharge_debounce_end", var_5b00534a9cafb4ec );
        }
        
        RAZOR callback::callback( #"razor_teleport_success" );
    }
    
    RAZOR.var_ace4896b0731607 = undefined;
    return anim.success;
}

// Namespace razor_agent
// Params 1
// Checksum 0x3d103276, Offset: 0xece
// Size: 0x97
function function_dda5c6f6cbfc210a( taskid )
{
    RAZOR = self;
    
    /#
        if ( getdvarint( @"hash_7d6ca17d496048e1", 0 ) )
        {
            return anim.failure;
        }
    #/
    
    debounce_end_time = RAZOR getaiblackboarddynamic( "overcharge_debounce_end" ) ?? 0;
    
    if ( gettime() < debounce_end_time )
    {
        return anim.failure;
    }
    
    if ( RAZOR.armorhealth < RAZOR.maxarmorhealth * 0.5 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

// Namespace razor_agent
// Params 1
// Checksum 0x559ea9f8, Offset: 0xf6e
// Size: 0x77
function overchargestart( taskid )
{
    RAZOR = self;
    RAZOR.var_f60dbf61db635d0b = [];
    RAZOR function_786bb6aa1b76c7ee( "overcharge_update_end", gettime() + 1500 );
    RAZOR function_786bb6aa1b76c7ee( "overcharge_ally_debounce_end", gettime() + 500 );
    RAZOR.armorhealth = RAZOR.maxarmorhealth;
    RAZOR thread function_627e0fe3e0ece17d();
    return anim.success;
}

// Namespace razor_agent
// Params 2
// Checksum 0xec6beab0, Offset: 0xfee
// Size: 0x198
function overchargeupdate( taskid, params )
{
    RAZOR = self;
    update_end_time = RAZOR getaiblackboarddynamic( "overcharge_update_end" ) ?? 0;
    
    if ( gettime() > update_end_time )
    {
        return anim.success;
    }
    
    ally_debounce_end = RAZOR getaiblackboarddynamic( "overcharge_ally_debounce_end" ) ?? 0;
    
    if ( gettime() < ally_debounce_end )
    {
        return anim.running;
    }
    
    friendlies = getaiarrayinradius( RAZOR.origin, 2000, RAZOR.team );
    
    foreach ( teammate in friendlies )
    {
        if ( teammate == RAZOR || !isalive( teammate ) )
        {
            continue;
        }
        
        if ( !teammate.maxarmorhealth || teammate.armorhealth == teammate.maxarmorhealth )
        {
            continue;
        }
        
        if ( arraycontains( RAZOR.var_f60dbf61db635d0b, teammate ) )
        {
            continue;
        }
        
        RAZOR thread function_76f5b7624f27d5ee( teammate );
        var_1186da92f39ef7df = gettime() + 100;
        RAZOR function_786bb6aa1b76c7ee( "overcharge_ally_debounce_end", var_1186da92f39ef7df );
        break;
    }
    
    return anim.running;
}

// Namespace razor_agent
// Params 1
// Checksum 0xf6d597e, Offset: 0x118f
// Size: 0x4e
function overchargeend( taskid )
{
    RAZOR = self;
    RAZOR notify( #"overcharge_end" );
    RAZOR function_786bb6aa1b76c7ee( "overcharge_debounce_end", gettime() + 15000 );
    RAZOR.var_f60dbf61db635d0b = undefined;
    return anim.success;
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0xc4611534, Offset: 0x11e6
// Size: 0xd1
function private function_627e0fe3e0ece17d()
{
    RAZOR = self;
    
    if ( isdefined( RAZOR.var_c945a9da69d2fc6e ) )
    {
        return;
    }
    
    fx_ent = RAZOR utility::function_1808878d1c511ce8();
    
    if ( !isdefined( fx_ent ) )
    {
        return;
    }
    
    RAZOR.var_c945a9da69d2fc6e = fx_ent;
    fx_ent linkto( RAZOR, "j_head", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    playfxontag( utility::getfx( "razor_overcharge_target" ), fx_ent, "tag_origin" );
    RAZOR utility::waittill_any( "death", "overcharge_end" );
    stopfxontag( utility::getfx( "razor_overcharge_target" ), fx_ent, "tag_origin" );
    fx_ent utility::delaycall( 0.5, &delete );
    
    if ( isdefined( RAZOR ) )
    {
        RAZOR.var_c945a9da69d2fc6e = undefined;
    }
}

// Namespace razor_agent
// Params 1, eflags: 0x4
// Checksum 0x4824a74d, Offset: 0x12bf
// Size: 0x13f
function private function_76f5b7624f27d5ee( targetai )
{
    RAZOR = self;
    RAZOR.var_f60dbf61db635d0b[ RAZOR.var_f60dbf61db635d0b.size ] = targetai;
    fx_ent = utility::function_1808878d1c511ce8( RAZOR getcentroid(), ( 0, 0, 0 ) );
    
    if ( !isdefined( fx_ent ) )
    {
        return;
    }
    
    playfxontag( utility::getfx( "razor_overcharge_trail" ), fx_ent, "tag_origin" );
    timeout = gettime() + 10000;
    
    while ( isalive( targetai ) && gettime() < timeout )
    {
        target_origin = targetai getcentroid();
        dist_to_target = distance( fx_ent.origin, target_origin );
        
        if ( dist_to_target < 25 )
        {
            stopfxontag( utility::getfx( "razor_overcharge_trail" ), fx_ent, "tag_origin" );
            targetai thread overchargetarget( fx_ent );
            return;
        }
        else
        {
            travel_time = dist_to_target / 1000;
            fx_ent moveto( target_origin, travel_time );
        }
        
        waitframe();
    }
    
    if ( !isalive( targetai ) )
    {
        killfxontag( utility::getfx( "razor_overcharge_trail" ), fx_ent, "tag_origin" );
        wait 0.1;
    }
    
    fx_ent delete();
}

// Namespace razor_agent
// Params 1, eflags: 0x4
// Checksum 0xe19fde3e, Offset: 0x1406
// Size: 0xb3
function private overchargetarget( fxent )
{
    target_ai = self;
    
    if ( target_ai.maxarmorhealth )
    {
        target_ai.armorhealth = target_ai.maxarmorhealth;
        playfxontag( utility::getfx( "razor_overcharge_target" ), fxent, "tag_origin" );
        fxent linkto( target_ai, "j_head", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        target_ai utility::waittill_notify_or_timeout( "death", 0.5 );
        stopfxontag( utility::getfx( "razor_overcharge_target" ), fxent, "tag_origin" );
        wait 0.5;
    }
    
    fxent delete();
}

// Namespace razor_agent
// Params 2
// Checksum 0xf27be390, Offset: 0x14c1
// Size: 0xba
function function_7144b18f8b209443( taskid, params )
{
    RAZOR = self;
    
    if ( isdefined( RAZOR.callbacks[ #"hash_d1496b2ebd724dcb" ] ) )
    {
        var_3b0e88701692e2de = RAZOR getaiblackboarddynamic( "last_mega_jump_start_time" ) ?? 0;
        shouldteleport = RAZOR callback::response( 0, #"hash_d1496b2ebd724dcb", { #var_3b0e88701692e2de:var_3b0e88701692e2de } );
    }
    else
    {
        debounce_end_time = RAZOR getaiblackboarddynamic( "mega_jump_debounce_end" ) ?? 0;
        shouldteleport = gettime() >= debounce_end_time;
    }
    
    if ( !shouldteleport )
    {
        return anim.failure;
    }
    
    return anim.success;
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0xc3a542e5, Offset: 0x1584
// Size: 0xef
function private function_19868ac59bb3314c()
{
    RAZOR = self;
    default_jump_start = RAZOR.origin;
    var_7cf552a045ec4772 = randomintrange( 128, 1800 );
    var_5fd01385bde60e8c = rotatevector( anglestoforward( RAZOR.angles ), ( 0, randomint( 360 ), 0 ) );
    default_jump_end = RAZOR.origin + var_5fd01385bde60e8c * var_7cf552a045ec4772;
    default_jump_end = getclosestpointonnavmesh( default_jump_end );
    ground_trace_start = default_jump_end + ( 0, 0, 650 );
    ground_trace_end = default_jump_end + ( 0, 0, -100 );
    trace_result = RAZOR trace::ai_trace( ground_trace_start, ground_trace_end );
    
    if ( trace_result[ "fraction" ] <= 0.95 )
    {
        default_jump_end = trace_result[ "shape_position" ];
        return [ default_jump_start, default_jump_end ];
    }
}

// Namespace razor_agent
// Params 2
// Checksum 0x1d0ef910, Offset: 0x167b
// Size: 0x34
function function_5b924c5d8846748c( taskid, params )
{
    RAZOR = self;
    RAZOR thread function_220f3d2693b19a45();
    return anim.success;
}

// Namespace razor_agent
// Params 2
// Checksum 0xca0ca086, Offset: 0x16b8
// Size: 0x53
function function_488131ed389df4e3( taskid, params )
{
    RAZOR = self;
    var_eb67133f6d0e1057 = RAZOR getaiblackboarddynamic( "preparing_for_mega_jump" ) ?? 0;
    
    if ( var_eb67133f6d0e1057 )
    {
        return anim.running;
    }
    
    return anim.success;
}

// Namespace razor_agent
// Params 0, eflags: 0xc
// Checksum 0x1819ef95, Offset: 0x1714
// Size: 0x78
function private function_aac5123df254ce1d()
{
    self notify( #"hash_73ea505909d7fcf0" );
    self endon( #"hash_73ea505909d7fcf0" );
    RAZOR = self;
    RAZOR endon( #"death" );
    RAZOR setscriptablepartstate( "super_mega_jump", "takeoff" );
    RAZOR waittill( #"razor_mega_jump_land" );
    RAZOR setscriptablepartstate( "super_mega_jump", "impact" );
    wait 1;
    RAZOR setscriptablepartstate( "super_mega_jump", "off" );
}

// Namespace razor_agent
// Params 4, eflags: 0x4
// Checksum 0xf6f68b3c, Offset: 0x1794
// Size: 0x71
function private scripted_movegravity_target_velocity( end, movetime, gravity, gravitynormal )
{
    delta = end - self.origin;
    drop = 0.5 * gravity * squared( movetime );
    drop *= gravitynormal;
    vel = ( delta - drop ) / movetime;
    return vel;
}

// Namespace razor_agent
// Params 2, eflags: 0x4
// Checksum 0xd60cae77, Offset: 0x180e
// Size: 0x23d
function private scripted_movegravity( RAZOR, jump_end )
{
    mover = self;
    gravity_normal = ( 0, 0, -1 );
    gravity = getgravity();
    move_time = 2.5;
    initial_vel = mover scripted_movegravity_target_velocity( jump_end, move_time, gravity, gravity_normal );
    start = mover.origin;
    start_time_ms = gettime();
    end_time_ms = start_time_ms + move_time * 1000;
    frame_count = 1;
    obstacle_fraction = 0.95;
    var_ee8257e5c548d01e = 3;
    var_5fe2c5971e2d42c1 = level.framedurationseconds * var_ee8257e5c548d01e;
    
    while ( gettime() <= end_time_ms )
    {
        delta_seconds = ( gettime() - start_time_ms ) * 0.001;
        applied_gravity = gravity_normal * 0.5 * gravity * squared( delta_seconds );
        mover.origin = start + delta_seconds * initial_vel + applied_gravity;
        
        if ( frame_count % var_ee8257e5c548d01e == 0 )
        {
            var_ac42b2aff462619a = delta_seconds + var_5fe2c5971e2d42c1 + level.framedurationseconds;
            applied_gravity = gravity_normal * 0.5 * gravity * squared( var_ac42b2aff462619a );
            var_8ea5229724e16786 = start + var_ac42b2aff462619a * initial_vel + applied_gravity;
            trace_content = trace::create_solid_ai_contents( 1 );
            trace_result = RAZOR trace::ai_trace( mover.origin, var_8ea5229724e16786, undefined, RAZOR, trace_content );
            
            if ( trace_result[ "fraction" ] < obstacle_fraction )
            {
                mover_hit_pos = trace_result[ "shape_position" ];
                dist_truncated = distance( mover.origin, mover_hit_pos );
                dist_total = distance( mover.origin, var_8ea5229724e16786 );
                collision_move_time = dist_truncated / dist_total * var_5fe2c5971e2d42c1;
                
                if ( collision_move_time > 0 )
                {
                    mover moveto( mover_hit_pos, collision_move_time, 0, 0 );
                    mover waittill( #"movedone" );
                }
                
                break;
            }
        }
        
        frame_count++;
        waitframe();
    }
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0xb6cd1a9c, Offset: 0x1a53
// Size: 0x189
function private function_8f9fb1dd44016f35()
{
    RAZOR = self;
    stun_radius = 256;
    
    if ( ob::nightmare() )
    {
        radiusdamage( RAZOR.origin, 128, 1000, 500, RAZOR );
    }
    else
    {
        radiusdamage( RAZOR.origin, stun_radius, 30, 5, RAZOR );
    }
    
    players_in_range = getplayersinradius( RAZOR.origin, stun_radius );
    
    foreach ( player in players_in_range )
    {
        if ( !RAZOR cansee( player ) )
        {
            continue;
        }
        
        knockback_dir = vectornormalize( player.origin - RAZOR.origin );
        player knockback( knockback_dir, 600, 1 );
        stun_duration = 2;
        player utility::setplayerstunned();
        player thread weapon_utility::cleanupconcussionstun( stun_duration );
        player thread shellshock_utility_cpmp::_shellshock( %"sat_ob_razor_mega_jump_impact", #"stun", stun_duration, 1, 1500 );
        player playrumbleonentity( "damage_heavy" );
    }
    
    earthquake( 0.65, 0.95, RAZOR.origin, 800 );
}

// Namespace razor_agent
// Params 0, eflags: 0x4
// Checksum 0x83cec6d1, Offset: 0x1be4
// Size: 0x362
function private function_220f3d2693b19a45()
{
    RAZOR = self;
    RAZOR endon( #"death" );
    RAZOR function_786bb6aa1b76c7ee( "preparing_for_mega_jump", 1 );
    var_887c61941305730d = undefined;
    jump_end = undefined;
    var_cfe799b3f8098a69 = { #var_eb4fa5ef492fcbeb:0 };
    
    while ( RAZOR callback::response( 0, #"hash_c6a9aa40faded202", var_cfe799b3f8098a69 ) )
    {
        if ( isdefined( var_cfe799b3f8098a69.var_c32f1dabd0a40652 ) && isdefined( var_cfe799b3f8098a69.var_61eb9e7b72b14237 ) )
        {
            var_887c61941305730d = var_cfe799b3f8098a69.var_c32f1dabd0a40652;
            jump_end = var_cfe799b3f8098a69.var_61eb9e7b72b14237;
            break;
        }
        else if ( !var_cfe799b3f8098a69.var_eb4fa5ef492fcbeb )
        {
            RAZOR function_786bb6aa1b76c7ee( "preparing_for_mega_jump", 0 );
            return;
        }
        
        waitframe();
    }
    
    if ( !( isdefined( var_887c61941305730d ) && isdefined( jump_end ) ) )
    {
        default_route = RAZOR function_19868ac59bb3314c();
        
        if ( !default_route )
        {
            RAZOR function_786bb6aa1b76c7ee( "preparing_for_mega_jump", 0 );
            return;
        }
        
        var_887c61941305730d = default_route[ 0 ];
        jump_end = default_route[ 1 ];
    }
    
    RAZOR enabletraversals( 0 );
    var_7d8e2e147d98fcea = distancesquared( RAZOR.origin, var_887c61941305730d );
    teleport_threshold = 8;
    
    if ( var_7d8e2e147d98fcea > teleport_threshold * teleport_threshold )
    {
        RAZOR callback::callback( #"razor_teleport_start" );
        var_e6d991eeadf17aa3 = randomfloatrange( 1, 2 );
        RAZOR doteleport( var_887c61941305730d, var_e6d991eeadf17aa3 );
        wait var_e6d991eeadf17aa3;
    }
    
    RAZOR function_786bb6aa1b76c7ee( "preparing_for_mega_jump", 0 );
    RAZOR function_786bb6aa1b76c7ee( "last_mega_jump_start_time", gettime() );
    var_dd2a2d1f98740710 = vectornormalize( jump_end - RAZOR.origin );
    var_fe77d3d43a66bc97 = vectortoangles( var_dd2a2d1f98740710 );
    var_a1986bbc32c0436a = utility::function_1808878d1c511ce8( RAZOR.origin, ( 0, var_fe77d3d43a66bc97[ 1 ], 0 ) );
    RAZOR thread utility::delete_on_death( var_a1986bbc32c0436a );
    
    while ( ai::is_doing_traversal( RAZOR ) )
    {
        waitframe();
    }
    
    RAZOR motionwarpcancel();
    RAZOR linkto( var_a1986bbc32c0436a, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    RAZOR utility::animscripted_single( "mega_jump", 1 );
    RAZOR thread function_aac5123df254ce1d();
    RAZOR callback::callback( #"hash_f095f31175704c94", { #jump_end:jump_end, #var_887c61941305730d:var_887c61941305730d } );
    
    if ( ob::nightmare() )
    {
        level thread spawn_vfx( jump_end + ( 0, 0, 8 ), ( 0, 0, 0 ), 0, "razor_mega_jump_land" );
    }
    
    var_a1986bbc32c0436a scripted_movegravity( RAZOR, jump_end );
    RAZOR notify( #"razor_mega_jump_land" );
    RAZOR thread function_8f9fb1dd44016f35();
    wait 0.1;
    RAZOR utility::animscripted_clear();
    RAZOR unlink();
    var_a1986bbc32c0436a delete();
    RAZOR enabletraversals( 1 );
    RAZOR thread function_a7c6495f347b732d( RAZOR.origin, randomfloatrange( 1, 2 ) );
    debounce_time = randomintrange( 5000, 10000 );
    RAZOR function_786bb6aa1b76c7ee( "mega_jump_debounce_end", gettime() + debounce_time );
    debounce_time = randomintrange( 3000, 5000 );
    RAZOR function_786bb6aa1b76c7ee( "teleport_debounce_end", gettime() + debounce_time );
    RAZOR callback::callback( #"hash_e77d2088d2c8e47b" );
}

// Namespace razor_agent
// Params 4
// Checksum 0x3b07b766, Offset: 0x1f4e
// Size: 0xba
function spawn_vfx( origin, angles, duration, flag )
{
    tag = level utility::function_1808878d1c511ce8( origin, angles );
    
    if ( !isdefined( level._effect[ "razor_land_target" ] ) )
    {
        utility::add_fx( "razor_land_target", "vfx_sat_wc_vgo_boss_attack_target_01_nm" );
    }
    
    waitframe();
    playfxontag( level._effect[ "razor_land_target" ], tag, "tag_origin" );
    
    if ( isdefined( flag ) )
    {
        level.RAZOR waittill( flag );
    }
    else
    {
        wait duration;
    }
    
    killfxontag( level._effect[ "razor_land_target" ], tag, "tag_origin" );
    tag delete();
}

