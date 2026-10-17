#using script_15ce43f40ea0fd2b;
#using script_242cf49dd9ae59e0;
#using script_3401cf8ba2ee045;
#using script_34480588ab049163;
#using script_4752051716e28258;
#using script_52b2d6abd048104c;
#using script_e63b80d41b999c8;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\zm\systems\agent_manager;
#using scripts\mp\zm\ztron\ztron_debug;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_player_utility;

#namespace namespace_725ac80c95cdb365;

// Namespace namespace_725ac80c95cdb365
// Params 0, eflags: 0x5
// Checksum 0xf2a038f8, Offset: 0x278
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_a043c2d3cb8f3642", #"ztron_item", undefined, &init );
}

// Namespace namespace_725ac80c95cdb365
// Params 0
// Checksum 0xcf77d077, Offset: 0x2a1
// Size: 0x20
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"magic_hat", #"use", &use_magic_hat );
}

// Namespace namespace_725ac80c95cdb365
// Params 1
// Checksum 0x1f25450e, Offset: 0x2c9
// Size: 0x53
function use_magic_hat( params )
{
    player = params.player;
    itemdata = ztron_item::function_998f2b10462afbf4( params.bundle );
    player thread activate_magic_hat( player, itemdata.duration );
}

// Namespace namespace_725ac80c95cdb365
// Params 2
// Checksum 0x48733f5b, Offset: 0x324
// Size: 0x44
function activate_magic_hat( player, duration )
{
    self notify( #"hash_1f9b7a1873d98d9a" );
    self endon( #"hash_1f9b7a1873d98d9a" );
    player endon( #"disconnect" );
    player thread spawn_clones( duration );
}

// Namespace namespace_725ac80c95cdb365
// Params 1
// Checksum 0xcd3ff44e, Offset: 0x370
// Size: 0xcb
function function_d659821fc549f8f7( player )
{
    if ( isdefined( player.ztron.clones ) )
    {
        foreach ( clone in player.ztron.clones )
        {
            if ( isdefined( clone ) )
            {
                clone notify( #"clone_shutdown" );
            }
        }
    }
    
    player.ztron.clones = [];
}

// Namespace namespace_725ac80c95cdb365
// Params 3
// Checksum 0xc88f55af, Offset: 0x443
// Size: 0x23c
function calculate_spawn_origin( origin, angles, distance_from_player )
{
    player = self;
    start_angles = ( 0, angles[ 1 ], 0 );
    var_b2d39bfeb8d29bd1 = [];
    zoffests = [];
    zoffests[ 0 ] = 5;
    zoffests[ 1 ] = 0;
    
    foreach ( zoff in zoffests )
    {
        var_1383f742171d68b4 = 0;
        
        while ( var_1383f742171d68b4 < 180 )
        {
            yaw_diff_sign = -1;
            
            while ( yaw_diff_sign <= 1 )
            {
                if ( yaw_diff_sign == -1 && ( var_1383f742171d68b4 == 0 || var_1383f742171d68b4 == 180 ) )
                {
                }
                else
                {
                    current_angles = start_angles + ( 0, var_1383f742171d68b4 * yaw_diff_sign, 0 );
                    ztron_debug::debugmsg( " Player " + self.ztron.color + " Magic Hat Current Clone Spawn Angles Yaw:" + current_angles[ 1 ] );
                    start_point = origin + anglestoforward( current_angles ) * distance_from_player;
                    start_point += ( 0, 0, zoff );
                    trace = trace::ray_trace( origin + ( 0, 0, zoff ), start_point, [ self ], trace::create_all_contents() );
                    
                    if ( trace[ "hittype" ] != "hittype_none" )
                    {
                        start_point = trace[ "position" ] + anglestoforward( current_angles ) * -60;
                    }
                    
                    closestnavmeshpoint = getclosestpointonnavmesh( start_point, 500 );
                    
                    if ( isdefined( closestnavmeshpoint ) )
                    {
                        start_point = closestnavmeshpoint;
                        ground_pos = getgroundposition( start_point, 15, 24, 24 );
                        
                        if ( isdefined( ground_pos ) )
                        {
                            start_point = ground_pos;
                        }
                    }
                    
                    spawn_point = { #angles:current_angles, #origin:start_point };
                    var_b2d39bfeb8d29bd1[ var_b2d39bfeb8d29bd1.size ] = spawn_point;
                    
                    if ( var_b2d39bfeb8d29bd1.size == 3 )
                    {
                        return var_b2d39bfeb8d29bd1;
                    }
                }
                
                yaw_diff_sign += 2;
            }
            
            var_1383f742171d68b4 += 30;
        }
    }
    
    return var_b2d39bfeb8d29bd1;
}

// Namespace namespace_725ac80c95cdb365
// Params 1
// Checksum 0x90a19dc6, Offset: 0x688
// Size: 0x6a
function function_89e9058d8281ce83( clone )
{
    if ( !isdefined( self.ztron.clones ) )
    {
        self.ztron.clones = [];
    }
    
    if ( isplayer( self ) )
    {
        self.ztron.clones[ self.ztron.clones.size ] = clone;
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 1
// Checksum 0xd4ec9ae1, Offset: 0x6fa
// Size: 0x27b
function spawn_clones( clone_timeout )
{
    self endon( #"disconnect", #"death", #"last_stand_enter" );
    function_d659821fc549f8f7( self );
    clone_timeout = ztron_player_utility::function_10777122eee28fa8( clone_timeout );
    velocity = self getvelocity();
    velocity += ( 0, 0, velocity[ 2 ] * -1 );
    velocity = vectornormalize( velocity );
    origin = self.origin + velocity * 17 + anglestoforward( self.angles ) * 17;
    spawn_point_array = calculate_spawn_origin( origin, self.angles, 300 );
    
    if ( spawn_point_array.size < 3 )
    {
        var_3243f7b4dd259cb0 = calculate_spawn_origin( origin, self.angles, 900 );
        
        for ( index = 0; index < var_3243f7b4dd259cb0.size && spawn_point_array.size < 3 ; index++ )
        {
            spawn_point_array[ spawn_point_array.size ] = var_3243f7b4dd259cb0[ index ];
        }
    }
    
    orb_start_point = self gettagorigin( "j_spine4" );
    
    foreach ( spawn_point in spawn_point_array )
    {
        traveldistance = distance( spawn_point.origin, self.origin );
        spawn_delay_seconds = traveldistance / 200;
        clone = agent_manager::spawn_agent( "sat_ally_ar", spawn_point.origin, spawn_point.angles, self.team );
        
        if ( !isdefined( clone ) )
        {
            continue;
        }
        
        clone.ztron = spawnstruct();
        clone.ztron.var_2588c7465d7536b2 = 0;
        clone.team = self.team;
        clone.is_clone = 1;
        thread function_4965bf93598f05d6( clone, self, anglestoforward( spawn_point.angles ), clone_timeout, spawn_delay_seconds );
        function_89e9058d8281ce83( clone );
        orb_end_point = spawn_point.origin;
        clone thread function_b21aed0f0bbd10ac( orb_start_point, orb_end_point, spawn_delay_seconds );
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 1, eflags: 0x4
// Checksum 0x945c22be, Offset: 0x97d
// Size: 0xdf
function private _updateclonepathing( player )
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( isdefined( player ) )
        {
            self.clones_goal = player.origin;
        }
        
        distance = 0;
        
        if ( isdefined( self.clones_goal ) )
        {
            distance = distancesquared( self.clones_goal, self.origin );
        }
        
        if ( distance < 14400 || self pathdisttogoal() == 0 )
        {
            if ( isdefined( player ) )
            {
                forward = anglestoforward( player.angles );
            }
            else
            {
                forward = anglestoforward( self.angles );
            }
            
            searchorigin = self.origin + forward * 256;
            thread function_c111eca69d5a9b4c( searchorigin, 128, 256 );
        }
        
        wait 1.5;
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 5, eflags: 0x4
// Checksum 0xca75fe43, Offset: 0xa64
// Size: 0x1e2
function private function_4965bf93598f05d6( clone, player, forward, timeout, spawn_delay_seconds )
{
    if ( !isdefined( clone ) )
    {
        return;
    }
    
    player endon( #"disconnect" );
    clone.agent_damage_callback = &clone_damage_callback;
    clone.spawntime = gettime();
    clone.color = player.ztron.color;
    clone enableavoidance( 0, 0 );
    clone pushplayer( 0 );
    clone thread function_832fa8c31640949b( player, timeout + spawn_delay_seconds );
    clone thread function_54188b9fe4d658d8();
    clone val::set( "clone_team", "ignoreall", 1 );
    clone.owner = player;
    clone.team = player.team;
    clone setentityowner( player );
    clone.noragdoll = 1;
    clone val::set( "ztron_top_hat", "death", 0 );
    clone val::set( "ztron_top_hat", "damageshield", 1 );
    clone val::set( "ztron_top_hat", "hide", 1 );
    clone thread function_23332c8c052047b1( spawn_delay_seconds );
    msg = clone utility::waittill_any_timeout( spawn_delay_seconds + 0.5, "clone_reveal", "clone_shutdown" );
    
    if ( msg != "clone_shutdown" )
    {
        search_origin = forward * 1000 + clone.origin;
        clone thread function_c111eca69d5a9b4c( search_origin, 0, 450 );
        clone thread function_43fd97ecdbb91af3( timeout );
        clone thread _updateclonepathing( player );
        attractor = zombie_attractor_manager::add_attractor( clone, 0, 500, 1, undefined, &attractor_validator, 0, undefined, 1 );
        clone thread function_1dc0f495ed8b3313( attractor );
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 3, eflags: 0x4
// Checksum 0xd86aa4e6, Offset: 0xc4e
// Size: 0x10b
function private function_c111eca69d5a9b4c( search_origin, min_search_radius, max_search_radius )
{
    self._goal_center_point = search_origin;
    min_search_radius_sq = min_search_radius * min_search_radius;
    navmesh_point_array = getrandomnavpoints( search_origin, max_search_radius, 64 );
    
    foreach ( point in navmesh_point_array )
    {
        if ( distance2dsquared( self.origin, point ) >= min_search_radius_sq )
        {
            goal_point = point;
            break;
        }
    }
    
    if ( !isdefined( goal_point ) )
    {
        goal_point = getrandomnavpoint( self.origin, max_search_radius );
    }
    
    if ( isdefined( goal_point ) )
    {
        self setgoalpos( goal_point, 50 );
        self.clones_goal = goal_point;
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 1, eflags: 0x4
// Checksum 0x2d694f34, Offset: 0xd61
// Size: 0x42
function private function_23332c8c052047b1( spawn_delay_seconds )
{
    self endon( #"death", #"clone_shutdown" );
    wait spawn_delay_seconds;
    val::set( "ztron_top_hat", "hide", 0 );
    self notify( #"clone_reveal" );
}

// Namespace namespace_725ac80c95cdb365
// Params 1, eflags: 0x4
// Checksum 0x2feecfd2, Offset: 0xdab
// Size: 0x115
function private function_43fd97ecdbb91af3( timeout )
{
    self endon( #"death", #"clone_shutdown" );
    waitframe();
    roll = randomint( 6 );
    
    /#
        debug_roll = getdvarint( @"hash_9a953e2c8cf68fe1", -1 );
        
        if ( debug_roll >= 0 )
        {
            roll = debug_roll;
        }
    #/
    
    switch ( roll )
    {
        case 0:
            thread namespace_37fc6eb0d4ca3c9d::function_39f806f311a52dfd( self, timeout );
            break;
        case 1:
            thread namespace_c9144136d44580e6::activatemagnet( self, timeout );
            break;
        case 2:
            thread namespace_69e425310f27a5::activateteddybear( self );
            break;
        case 3:
            params = spawnstruct();
            params.duration = timeout;
            thread namespace_3b4a83e58739c229::activateteslaball( self, params );
            break;
        case 4:
            thread namespace_73e2c42fdcce1e90::activatebarrel( self, timeout );
            break;
        case 5:
            thread namespace_a1597a4eb2463645::activatesawblade( self, timeout );
            break;
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 16
// Checksum 0xa5720cbc, Offset: 0xec8
// Size: 0xbf, Type: bool
function clone_damage_callback( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_1791e13d07fb32af, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, modelindex, surfacetype, surfacenormal )
{
    if ( isdefined( eattacker ) && eattacker.team != self.team )
    {
        self notify( #"clone_shutdown" );
    }
    
    return false;
}

// Namespace namespace_725ac80c95cdb365
// Params 3, eflags: 0x4
// Checksum 0x3c778ffd, Offset: 0xf90
// Size: 0x142
function private function_b21aed0f0bbd10ac( orb_start_point, orb_end_point, orb_travel_time )
{
    fx_ent = spawn( "script_model", orb_start_point );
    fx_ent setmodel( "ztron_magic_hat_fx" );
    var_567144f79cece815 = orb_end_point + ( 0, 0, 35 );
    fx_ent setscriptablepartstate( "magic_fx", "before_appear" );
    fx_ent moveto( var_567144f79cece815, orb_travel_time );
    wait orb_travel_time;
    
    if ( isalive( self ) )
    {
        fx_ent linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        fx_ent setscriptablepartstate( "magic_fx", "appear" );
        color = self.color ?? self.owner.ztron.color;
        
        if ( color )
        {
            fx_ent setscriptablepartstate( "player_trail_fx", color );
        }
        
        utility::waittill_any( "clone_shutdown", "death" );
        fx_ent unlink();
    }
    
    fx_ent setscriptablepartstate( "player_trail_fx", "no_trail" );
    fx_ent setscriptablepartstate( "magic_fx", "vanish" );
    wait 3;
    fx_ent delete();
}

// Namespace namespace_725ac80c95cdb365
// Params 2
// Checksum 0xa6bb7758, Offset: 0x10da
// Size: 0x7f
function attractor_validator( attractor, zombie )
{
    if ( zombie.var_840153567385cc6b )
    {
        return 0;
    }
    
    if ( zombie.aicategory == "normal" || zombie.aicategory == "special" )
    {
        if ( zombie.team != attractor.source.team )
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace namespace_725ac80c95cdb365
// Params 2, eflags: 0xc
// Checksum 0x13066434, Offset: 0x1161
// Size: 0x88
function private function_832fa8c31640949b( player, timeout )
{
    self notify( #"hash_13053318fd3c13f2" );
    self endon( #"hash_13053318fd3c13f2" );
    clone = self;
    clone endon( #"clone_shutdown" );
    utility::waittill_any_ents_or_timeout_return( timeout, level, "ztron_exit_taken", level, "ztron_teleporter_taken", level, "deactivate_bonus_room", level, "arena_completed", level, "ztron_game_is_over", player, "disconnect" );
    
    if ( isdefined( clone ) )
    {
        clone notify( #"clone_shutdown" );
    }
}

// Namespace namespace_725ac80c95cdb365
// Params 1, eflags: 0x4
// Checksum 0x16777704, Offset: 0x11f1
// Size: 0x31
function private function_1dc0f495ed8b3313( attractor )
{
    msg = utility::waittill_any_return( "clone_shutdown", "death" );
    zombie_attractor_manager::remove_attractor( attractor );
}

// Namespace namespace_725ac80c95cdb365
// Params 0, eflags: 0x4
// Checksum 0x6b136ffc, Offset: 0x122a
// Size: 0xcf
function private function_54188b9fe4d658d8()
{
    clone = self;
    msg = clone utility::waittill_any_return( "clone_shutdown", "death" );
    clone notify( #"boxing_done" );
    clone notify( #"barrel_done" );
    
    if ( isdefined( clone.ztron.magnetorb ) )
    {
        clone.ztron.magnetorb notify( #"expired" );
    }
    
    waitframe();
    
    if ( isdefined( clone ) )
    {
        clone val::set( "ztron_top_hat", "hide", 1 );
        wait 3;
        clone val::set( "ztron_top_hat", "damageshield", 0 );
        clone val::set( "ztron_top_hat", "death", 1 );
        clone agent_utils::despawnagent();
    }
}

