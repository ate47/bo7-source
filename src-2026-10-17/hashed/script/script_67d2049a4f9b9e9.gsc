#using script_13865ca76df87ea;
#using script_16ea1b94f0f381b3;
#using script_2b51dca51198db31;
#using scripts\anim\shared;
#using scripts\asm\asm;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\status_effects\effect_slow;
#using scripts\common\system;
#using scripts\common\throttle;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vortex;
#using scripts\common\weapon;
#using scripts\mp\flags;
#using scripts\mp\weapons;

#namespace blackhole_bomb;

// Namespace blackhole_bomb
// Params 0, eflags: 0x5
// Checksum 0x5a3ae1e2, Offset: 0x4fe
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"blackhole_bomb", undefined, &pre_main, &post_main );
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x218f60f7, Offset: 0x523
// Size: 0xce
function private pre_main()
{
    level.blackhole_bomb_funcs[ "pull" ][ "zombie" ] = &pull_zombie;
    level.blackhole_bomb_funcs[ "pull" ][ "soldier" ] = &pull_soldier;
    level.blackhole_bomb_funcs[ "pull" ][ "dog" ] = &pull_zombie;
    level.blackhole_bomb_funcs[ "damage" ][ "zombie" ] = &damage_zombie;
    level.blackhole_bomb_funcs[ "damage" ][ "soldier" ] = &damage_soldier;
    level.blackhole_bomb_funcs[ "damage" ][ "dog" ] = &damage_zombie;
    level.blackhole_portal_player_search_throttle = throttle::throttle_initialize( "blackhole_portal_player_search", 1, 0.5 );
    level vortex::register_vortex_priority( "blackhole", 1 );
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x2461ef81, Offset: 0x5f9
// Size: 0x15a
function private post_main()
{
    level endon( #"game_ended" );
    weapons::registerusedcallback( "blackhole_bomb", &blackhole_bomb_used );
    weapons::registeragentusedcallback( "blackhole_bomb", &blackhole_bomb_used );
    flags::function_2f3408423ccc9b2e( "prematch_done" );
    waittillframeend();
    assert( isdefined( level.equipment.callbacks ) );
    level.equipment.callbacks[ "equip_blackhole_bomb" ][ "onGive" ] = &blackhole_bomb_on_give;
    level.equipment.callbacks[ "equip_blackhole_bomb" ][ "onTake" ] = &function_224ff04440917dc2;
    assert( isdefined( level.equipment.table ) );
    
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) && isdefined( level.equipment.table[ "equip_blackhole_bomb" ].weaponname ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", level.equipment.table[ "equip_blackhole_bomb" ].weaponname, &function_9c37dab83025b0c2 );
    }
    
    level callback::add( #"on_ai_killed_medal", &function_bbd5ce0e67f46847 );
}

// Namespace blackhole_bomb
// Params 4, eflags: 0x4
// Checksum 0xf31f8821, Offset: 0x75b
// Size: 0xb6
function private blackhole_bomb_on_give( equipment_ref, slot, variant_id, attachments )
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    self endon( #"blackhole_bomb_taken" );
    
    while ( true )
    {
        self waittill( #"offhand_pullback", objweapon );
        
        if ( getweaponrootstring( objweapon ) == "blackhole_bomb" )
        {
            utility::function_7c10ea82c1e305b8( "blackhole_bomb_fx", "grenade_pullback" );
            
            while ( self getheldoffhand() == objweapon && !self function_a6d700f2335edc93() )
            {
                waitframe();
            }
            
            utility::function_7c10ea82c1e305b8( "blackhole_bomb_fx", "off" );
        }
    }
}

// Namespace blackhole_bomb
// Params 2, eflags: 0x4
// Checksum 0x5f11a60a, Offset: 0x819
// Size: 0x32
function private function_224ff04440917dc2( equipment_ref, slot )
{
    self notify( #"blackhole_bomb_taken" );
    utility::function_32b24db3127bff40( "blackhole_bomb_fx", "off" );
}

// Namespace blackhole_bomb
// Params 1
// Checksum 0xf4d11f94, Offset: 0x853
// Size: 0x233
function blackhole_bomb_used( grenade )
{
    grenade endon( #"death" );
    grenade utility::registersharedfunc( #"blackhole_bomb", #"end_vortex", &end_vortex );
    grenade thread monitor_timeout();
    var_2096094c4703a515 = grenade utility::waittill_any_return_params( "missile_stuck", "missile_water_impact" );
    
    if ( var_2096094c4703a515[ "message" ] == "missile_water_impact" )
    {
        grenade [[ level.var_3f5d2a9c52592654 ]]();
        grenade thread end_vortex();
        return;
    }
    else
    {
        hitent = var_2096094c4703a515[ 0 ];
    }
    
    is_first_update = 1;
    is_on_vehicle = hitent && hitent vehicle::is_vehicle();
    grenade.update_time = is_on_vehicle ? 0.1 : 0.5;
    
    while ( true )
    {
        navmesh_point = grenade function_d279b3fce7bd86f();
        grenade.closest_navmesh_point = navmesh_point;
        
        if ( utility::issharedfuncdefined( #"equipment", #"hash_e0ab82e8a3d12d1d" ) && !grenade utility::callsharedfunc( #"equipment", #"hash_e0ab82e8a3d12d1d", grenade.origin, 0, [ "navobstacle_nonblocking", "navobstacle_fire" ], 1 ) )
        {
            break;
        }
        
        if ( !isdefined( navmesh_point ) )
        {
            break;
        }
        
        if ( !isdefined( grenade.vortex_struct ) )
        {
            grenade.vortex_struct = grenade start_timed_vortex( navmesh_point, 60, 1000, 275, 10, 32, !is_on_vehicle );
            
            if ( !grenade.avoidteleport )
            {
                grenade thread function_8f3c979df66aa378( !is_on_vehicle );
            }
            
            grenade thread watch_grenade_tilt();
            grenade thread function_97482c68a6fe6018();
        }
        else
        {
            grenade.vortex_struct.navmesh_origin = navmesh_point;
        }
        
        /#
            grenade.vortex_struct thread debug_vortex();
        #/
        
        wait grenade.update_time;
        is_first_update = 0;
    }
    
    if ( is_first_update )
    {
        if ( isdefined( level.var_3f5d2a9c52592654 ) )
        {
            grenade [[ level.var_3f5d2a9c52592654 ]]();
        }
    }
    
    grenade end_vortex();
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x59c1a35a, Offset: 0xa8e
// Size: 0xe1
function private function_d279b3fce7bd86f()
{
    closest_navmesh_point = getclosestpointonnavmesh( self.origin, undefined, 1, 0, 0, 0, 0, 0, [ "navobstacle_nonblocking", "navobstacle_fire" ], 1 );
    
    /#
        if ( getdvarint( @"scr_debug_vortex", 0 ) )
        {
            half_height = ( 0, 0, 80 );
            cylinder( self.origin - half_height, self.origin + half_height, sqrt( 16384 ), ( 0, 1, 1 ), 1, int( self.update_time * 20 ) );
        }
    #/
    
    if ( isdefined( closest_navmesh_point ) )
    {
        if ( distance2dsquared( closest_navmesh_point, self.origin ) <= 16384 && abs( closest_navmesh_point[ 2 ] - self.origin[ 2 ] ) <= 80 )
        {
            return closest_navmesh_point;
        }
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xf0a2be1, Offset: 0xb78
// Size: 0x56
function private watch_grenade_tilt()
{
    self endon( #"death" );
    
    while ( true )
    {
        grenade_tilt = vectordot( anglestoup( self.angles ), ( 0, 0, 1 ) );
        
        if ( grenade_tilt < 0.7 )
        {
            end_vortex();
            break;
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xd2d45d2c, Offset: 0xbd6
// Size: 0x1b
function private function_97482c68a6fe6018()
{
    if ( isdefined( self ) )
    {
        self waittill( #"death" );
    }
    
    end_vortex();
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x8eb8f538, Offset: 0xbf9
// Size: 0x3c
function private end_vortex()
{
    if ( isdefined( self.vortex_struct ) )
    {
        self.vortex_struct notify( #"vortex_implode" );
    }
    
    if ( isdefined( self ) )
    {
        utility::delaycallendon( 1.2, "death", &delete );
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xda73c0be, Offset: 0xc3d
// Size: 0x28
function private monitor_timeout()
{
    self endon( #"death" );
    self endon( #"missile_stuck" );
    wait 10;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x8baefb6f, Offset: 0xc6d
// Size: 0xe9
function private pull_enemies_in_range()
{
    level endon( #"game_ended" );
    callback::callback( "blackhole_bomb_start", self );
    thread function_88092fbe2b8dc3f3();
    thread function_846099c9d101fe8d();
    thread function_67108439b8a291f8();
    thread function_da55e9ccd3ff703c();
    self.grenade waittill( #"death" );
    callback::callback( "blackhole_bomb_end" );
    
    foreach ( agent in self.agents_pulled )
    {
        if ( !isalive( agent ) )
        {
            continue;
        }
        
        agent end_pull( self );
    }
    
    self.agents_pulled = [];
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0xff2ac5a4, Offset: 0xd5e
// Size: 0x24f
function private function_4332649577eefb5( params )
{
    if ( isdefined( params ) && params.mode === "blackhole" )
    {
        if ( self.unittype == "soldier" )
        {
            self.blackhole_weapon_cache[ "left" ] = shared::getweaponforpos( "left" );
            self.blackhole_weapon_cache[ "right" ] = shared::getweaponforpos( "right" );
            
            foreach ( cached_weapon in self.blackhole_weapon_cache )
            {
                if ( isdefined( cached_weapon ) )
                {
                    shared::dropaiweapon( cached_weapon );
                }
            }
            
            self.var_a13bed1ac47e1b2c = 1;
        }
        
        utility::function_7c10ea82c1e305b8( "blackhole_pulled", "blackhole_pulled_on" );
        
        if ( self.noragdoll || self.script_noragdoll || self.type == "zombie" && self.aicategory == "normal" )
        {
            self.forceannihilate = 1;
        }
        else
        {
            self.do_immediate_ragdoll = 1;
        }
        
        return;
    }
    
    if ( self.unittype == "soldier" )
    {
        if ( isdefined( self.blackhole_weapon_cache ) )
        {
            foreach ( weapon_slot, cached_weapon in self.blackhole_weapon_cache )
            {
                if ( isdefined( cached_weapon ) )
                {
                    shared::placeweaponon( cached_weapon, weapon_slot );
                }
            }
        }
        
        self.blackhole_weapon_cache = undefined;
        self.var_a13bed1ac47e1b2c = undefined;
    }
    
    utility::function_7c10ea82c1e305b8( "blackhole_pulled", "blackhole_pulled_off" );
    
    if ( self.noragdoll || self.script_noragdoll )
    {
        self.forceannihilate = undefined;
        return;
    }
    
    self.do_immediate_ragdoll = undefined;
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0x46da28af, Offset: 0xfb5
// Size: 0x59
function private end_pull( vortex_struct )
{
    is_removed = vortex::clear_vortex_state( "blackhole", vortex_struct );
    
    if ( vortex::function_7e9f78caee66e33d( "blackhole" ) == 0 )
    {
        callback::remove( "on_vortex_pull_changed", &function_4332649577eefb5 );
        callback::remove( "on_vortex_pull_ended", &function_4332649577eefb5 );
    }
    
    return is_removed;
}

// Namespace blackhole_bomb
// Params 2
// Checksum 0x57431598, Offset: 0x1017
// Size: 0x1ab
function function_8a0e4d915f64425c( vortex_struct, is_pulled )
{
    assert( isagent( self ) );
    
    if ( is_pulled )
    {
        pull_origin = vortex_struct.navmesh_origin;
        
        if ( !vortex::is_pulled() )
        {
            if ( self._blackboard.onTheWall )
            {
                pull_origin = vortex_struct.vortex_center;
            }
        }
        else if ( self.var_507d3f5433b78f74 )
        {
            pull_origin = vortex_struct.vortex_center;
        }
        
        if ( vortex::function_7e9f78caee66e33d( "blackhole" ) == 0 )
        {
            callback::add( "on_vortex_pull_changed", &function_4332649577eefb5 );
            callback::add( "on_vortex_pull_ended", &function_4332649577eefb5 );
        }
        
        vortex_height = max( vortex_struct.vortex_center[ 2 ] - vortex_struct.navmesh_origin[ 2 ], 0 );
        vortex_payload = { #mode:"blackhole", #height:vortex_height, #grenade:vortex_struct.grenade };
        is_new = vortex::set_vortex_state( "blackhole", vortex_struct, pull_origin, vortex_struct.death_range, vortex_payload );
        
        if ( is_new )
        {
            vortex_struct.agents_pulled[ vortex_struct.agents_pulled.size ] = self;
            self.vortex_pull_owner = vortex_struct.owner;
        }
        
        return;
    }
    
    is_removed = end_pull( vortex_struct );
    
    if ( is_removed )
    {
        vortex_struct.agents_pulled = arrayremove( vortex_struct.agents_pulled, self );
    }
}

// Namespace blackhole_bomb
// Params 2
// Checksum 0x1f3d03c0, Offset: 0x11ca
// Size: 0x127
function function_5fb80118ae8ab3b2( vortex_struct, damage_ratio )
{
    round_difficulty = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
    var_1a1c333cb875e7e1 = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", round_difficulty );
    var_749ae3de5300181e = 1;
    current_time = gettime();
    
    if ( !isdefined( self.vortex_damage_time ) || self.vortex_damage_time + 1000 <= current_time )
    {
        if ( isdefined( var_1a1c333cb875e7e1 ) && isent( self ) && isalive( self ) )
        {
            idflags = 536936448 | ( var_749ae3de5300181e ? 1073741824 : 0 );
            blackhole_damage = var_1a1c333cb875e7e1 * damage_ratio;
            self dodamage( blackhole_damage, vortex_struct.vortex_center, vortex_struct.grenade.owner, vortex_struct.grenade, "MOD_CRUSH", vortex_struct.grenade.weapon_object, "none", undefined, idflags );
            self.vortex_damage_time = current_time;
        }
    }
}

// Namespace blackhole_bomb
// Params 2, eflags: 0x4
// Checksum 0xdb77cb02, Offset: 0x12f9
// Size: 0x55
function private pull_zombie( zombie, is_pulled )
{
    if ( !zombie.var_19238dbcc969affa || !zombie.var_5927d2279779cec0 || !zombie val::get( "allow_secondary_attack_damage" ) )
    {
        is_pulled = 0;
    }
    
    zombie thread function_8a0e4d915f64425c( self, is_pulled );
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0x526580f7, Offset: 0x1356
// Size: 0x13f
function private damage_zombie( zombie )
{
    if ( !zombie.var_19238dbcc969affa )
    {
        return;
    }
    
    if ( zombie.var_5927d2279779cec0 )
    {
        return;
    }
    
    damage_health_ratio = 0;
    slow_rate = 1;
    
    if ( isdefined( zombie.aicategory ) )
    {
        if ( zombie.subclass == "zombie_viper_mini_popcorn" )
        {
            slow_rate = 0.8;
        }
        else if ( zombie.aicategory == "normal" )
        {
            slow_rate = 0.6;
        }
        else if ( zombie.aicategory == "special" )
        {
            slow_rate = 0.7;
        }
        else if ( zombie.aicategory == "elite" || zombie.aicategory == "hvt" )
        {
            slow_rate = 0.7;
        }
        else if ( zombie.aicategory == "boss" )
        {
            slow_rate = 1;
        }
        
        damage_health_ratio = 2;
    }
    
    if ( slow_rate < 1 )
    {
        zombie effect_slow::slow( "blackhole", slow_rate, 0.5, self.grenade.owner, undefined, undefined, "dark" );
    }
    
    zombie function_5fb80118ae8ab3b2( self, damage_health_ratio );
}

// Namespace blackhole_bomb
// Params 2, eflags: 0x4
// Checksum 0x8f1e335e, Offset: 0x149d
// Size: 0x5d
function private pull_soldier( soldier, is_pulled )
{
    if ( soldier ai::is_warlord() )
    {
        is_pulled = 0;
    }
    
    if ( soldier.bhasriotshieldattached && isdefined( soldier.deathfunction ) )
    {
        soldier [[ soldier.deathfunction ]]();
    }
    
    soldier thread function_8a0e4d915f64425c( self, is_pulled );
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0x543f7768, Offset: 0x1502
// Size: 0x58
function private damage_soldier( soldier )
{
    if ( soldier ai::is_warlord() )
    {
        soldier effect_slow::slow( "blackhole", 0.7, 0.5, self.grenade.owner, undefined, undefined, "dark" );
        soldier function_5fb80118ae8ab3b2( self, 0.02 );
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xd10f763e, Offset: 0x1562
// Size: 0x325
function private function_88092fbe2b8dc3f3()
{
    level endon( #"game_ended" );
    self.grenade endon( #"death" );
    childthread function_2a53a7d6af18643c();
    
    while ( true )
    {
        affected_agents = getaiarrayinradius( self.vortex_center, self.pull_radius );
        
        if ( isplayer( self.grenade.owner ) && utility::issharedfuncdefined( #"zm", #"hash_275603844e04e7ac" ) )
        {
            affected_agents = level [[ utility::getsharedfunc( #"zm", #"hash_275603844e04e7ac" ) ]]( affected_agents, self.grenade.owner );
        }
        
        self.agents_pulled = function_46f9072493651dc9( self.agents_pulled );
        affected_agents = arraycombineunique( affected_agents, self.agents_pulled );
        
        if ( affected_agents.size == 0 )
        {
            waitframe();
            continue;
        }
        
        pull_distance_squared = squared( self.pull_radius + 200 );
        var_3ae58588ddfc1990 = 0;
        
        foreach ( agent in affected_agents )
        {
            if ( !isalive( agent ) )
            {
                continue;
            }
            
            if ( agent.team == self.team )
            {
                continue;
            }
            
            if ( agent val::get( "ignore_blackhole_bomb" ) )
            {
                continue;
            }
            
            var_b96b03906adea51d = distancesquared( agent.origin, self.vortex_center ) <= pull_distance_squared;
            
            if ( var_b96b03906adea51d && agent val::get( "postpone_vortex_pull" ) && !agent.vortex_pull_triggered_while_postponed )
            {
                agent.vortex_pull_triggered_while_postponed = 1;
                agent notify( #"vortex_pull_triggered_while_postponed" );
                continue;
            }
            else if ( !agent val::get( "postpone_vortex_pull" ) && agent.vortex_pull_triggered_while_postponed )
            {
                agent.vortex_pull_triggered_while_postponed = undefined;
            }
            
            if ( var_b96b03906adea51d && getdvarint( @"hash_b85ad3ef347d0ba4", 0 ) )
            {
                agent_center = agent getcentroid();
                var_b96b03906adea51d = sighttracepassed( self.vortex_center, agent_center, 0, agent, undefined, 1 );
                
                /#
                    if ( getdvarint( @"scr_debug_vortex", 0 ) )
                    {
                        line( self.vortex_center, agent_center, var_b96b03906adea51d ? ( 0, 1, 0 ) : ( 1, 0, 0 ) );
                    }
                #/
            }
            
            pull_func = level.blackhole_bomb_funcs[ "pull" ][ agent.unittype ];
            
            if ( isdefined( pull_func ) )
            {
                self [[ pull_func ]]( agent, var_b96b03906adea51d );
            }
            
            var_3ae58588ddfc1990++;
            
            if ( var_3ae58588ddfc1990 % 10 == 0 )
            {
                waitframe();
            }
        }
        
        if ( var_3ae58588ddfc1990 == 0 || var_3ae58588ddfc1990 % 10 > 0 )
        {
            waitframe();
        }
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x845d4154, Offset: 0x188f
// Size: 0x192
function private function_2a53a7d6af18643c()
{
    while ( true )
    {
        foreach ( agent in self.agents_pulled )
        {
            if ( !isalive( agent ) )
            {
                continue;
            }
            
            if ( agent vortex::function_9fe39de8aadab2b9( "blackhole", self ) )
            {
                agent.do_immediate_ragdoll = undefined;
                
                if ( isdefined( self.vortex ) )
                {
                    self.vortex setscriptablepartstate( "fake_gib_audio", "play_gib_audio" );
                }
                
                if ( agent.var_fe7f2e477eb71311 && isdefined( agent.asmname ) )
                {
                    agent.var_fe7f2e477eb71311 = undefined;
                    agent.var_56886d1cc8a39b2 = 1;
                    agent asm::asm_fireevent( agent.asmname, "vortex_death" );
                }
                else if ( !agent.var_56886d1cc8a39b2 )
                {
                    agent kill( self.vortex_center, self.grenade.owner, self.grenade, "MOD_CRUSH" );
                }
                
                if ( !isdefined( self.agents_killed ) )
                {
                    self.agents_killed = 0;
                }
                
                self.agents_killed++;
            }
        }
        
        self.agents_pulled = function_46f9072493651dc9( self.agents_pulled );
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x87436b, Offset: 0x1a29
// Size: 0x10f
function private function_846099c9d101fe8d()
{
    level endon( #"game_ended" );
    self.grenade endon( #"death" );
    
    while ( true )
    {
        affected_agents = getaiarrayinradius( self.vortex_center, self.damage_radius );
        
        foreach ( agent in affected_agents )
        {
            if ( !isalive( agent ) )
            {
                continue;
            }
            
            if ( agent.team == self.team )
            {
                continue;
            }
            
            damage_func = level.blackhole_bomb_funcs[ "damage" ][ agent.unittype ];
            
            if ( isdefined( damage_func ) )
            {
                self [[ damage_func ]]( agent );
            }
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xb161872b, Offset: 0x1b40
// Size: 0xf9
function private function_67108439b8a291f8()
{
    level endon( #"game_ended" );
    self.grenade endon( #"death" );
    
    while ( true )
    {
        affected_vehicles = vehicle_getarrayinradius( self.vortex_center, self.damage_radius );
        
        foreach ( vehicle in affected_vehicles )
        {
            if ( !isalive( vehicle ) )
            {
                continue;
            }
            
            if ( vehicle vehicle::is_destroyed() )
            {
                continue;
            }
            
            if ( vehicle.team == self.team )
            {
                continue;
            }
            
            vehicle function_5fb80118ae8ab3b2( self, 0.05 );
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x3b2b6ba0, Offset: 0x1c41
// Size: 0xf4
function private function_da55e9ccd3ff703c()
{
    level endon( #"game_ended" );
    self.grenade endon( #"death" );
    var_385af019de758c7b = self.damage_radius * self.damage_radius;
    
    while ( true )
    {
        affected_ents = damage_utility::function_cf1c753aefa70ea1( self.team );
        
        foreach ( ent in affected_ents )
        {
            if ( distancesquared( ent.origin, self.vortex_center ) <= var_385af019de758c7b )
            {
                ent function_5fb80118ae8ab3b2( self, 2 );
            }
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x3fcc7276, Offset: 0x1d3d
// Size: 0x40d
function private spawn_vortex()
{
    level endon( #"game_ended" );
    offset_origin = self.grenade.origin + ( 0, 0, 4 );
    self.grenade hideallparts();
    fake_model = spawn( "script_model", offset_origin );
    fake_model.angles = self.grenade.angles;
    blueprintindex = self.grenade.weapon_object.variantid;
    
    if ( !isdefined( blueprintindex ) )
    {
        blueprintindex = 0;
    }
    
    tableinfo = weapon::getequipmenttableinfo( "equip_blackhole_bomb" );
    bundle = tableinfo.bundle;
    genericblueprintname = namespace_de7b719e85d98dcc::function_9800c005d17e1d42( bundle, blueprintindex );
    
    if ( isdefined( genericblueprintname ) )
    {
        fake_model setgenericblueprintmodel( genericblueprintname, #"hash_13239327fd97153e" );
    }
    else
    {
        self.grenade showallparts();
    }
    
    self.vortex = spawnscriptable( "equip_blackhole_bomb_vortex_t10_mp", self.grenade.origin, self.grenade.angles );
    self.vortex scriptablesetparententity( self.grenade );
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex setscriptablepartstate( "vortex", "loop" );
    }
    
    owner = self.owner;
    
    if ( owner )
    {
        assert( !owner callback::exists( #"super_cancel", &vortex_cancel, self ) );
        owner callback::add( #"super_cancel", &vortex_cancel, self );
    }
    
    utility::waittill_notify_or_timeout( "vortex_implode", self.duration );
    
    if ( isdefined( fake_model ) )
    {
        fake_model delete();
    }
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex setscriptablepartstate( "vortex", "implode" );
    }
    
    if ( isdefined( self.grenade ) )
    {
        self.grenade radiusdamage( self.vortex_center, 300, 500, 250, self.grenade.owner ?? self.grenade, "MOD_EXPLOSIVE", self.grenade.weapon_object );
        playrumbleonposition( "blackhole_bomb_implode", self.grenade.origin );
        earthquake( 0.8, 0.3, self.grenade.origin, 300 );
        
        foreach ( agentpulled in self.grenade.vortex_struct.agents_pulled )
        {
            if ( agentpulled.var_507d3f5433b78f74 )
            {
                agentpulled.forceannihilate = 1;
                agentpulled kill( self.vortex_center, self.grenade.owner, self.grenade, "MOD_CRUSH" );
            }
        }
        
        self.grenade utility::delaycallendon( 1, "death", &delete );
    }
    
    if ( isdefined( self.vortex ) )
    {
        self.vortex utility::delaycallendon( 7, "death", &freescriptable );
    }
    
    if ( owner )
    {
        assert( owner callback::exists( #"super_cancel", &vortex_cancel, self ) );
        owner callback::remove( #"super_cancel", &vortex_cancel, self );
    }
}

// Namespace blackhole_bomb
// Params 2, eflags: 0x4
// Checksum 0x75b7231e, Offset: 0x2152
// Size: 0x40
function private vortex_cancel( params, vortex_struct )
{
    if ( vortex_struct.vortex )
    {
        vortex_struct.vortex freescriptable();
    }
    
    vortex_struct notify( #"vortex_implode" );
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0x9abea77d, Offset: 0x219a
// Size: 0x26
function private get_vortex_center( center_height )
{
    return self.origin + center_height * anglestoup( self.angles );
}

// Namespace blackhole_bomb
// Params 7
// Checksum 0x6a600462, Offset: 0x21c9
// Size: 0x13b
function start_timed_vortex( vortex_origin, center_height, vortex_pull_radius, vortex_damage_radius, duration, death_range, is_static )
{
    vortex_struct = spawnstruct();
    vortex_struct.navmesh_origin = vortex_origin;
    vortex_struct.center_height = center_height;
    vortex_struct.grenade = self;
    vortex_struct.team = self.team;
    vortex_struct.pull_radius = vortex_pull_radius;
    vortex_struct.damage_radius = vortex_damage_radius;
    vortex_struct.death_range = death_range ?? 0;
    vortex_struct.duration = duration;
    vortex_struct.owner = self.owner;
    vortex_struct.agents_pulled = [];
    
    if ( is_static )
    {
        vortex_struct.vortex_center = vortex_struct.grenade get_vortex_center( vortex_struct.center_height );
    }
    else
    {
        vortex_struct thread update_vortex_center();
    }
    
    vortex_struct thread pull_enemies_in_range();
    vortex_struct thread spawn_vortex();
    return vortex_struct;
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x1a1332ec, Offset: 0x230d
// Size: 0x40
function private update_vortex_center()
{
    self.grenade endon( #"death" );
    
    while ( true )
    {
        self.vortex_center = self.grenade get_vortex_center( self.center_height );
        waitframe();
    }
}

/#

    // Namespace blackhole_bomb
    // Params 0
    // Checksum 0xa829fea1, Offset: 0x2355
    // Size: 0xbf, Type: dev
    function debug_vortex()
    {
        if ( getdvarint( @"scr_debug_vortex", 0 ) )
        {
            vortex_debug_color = ( 0, 0, 0 );
            vortex_debug_duration = int( self.grenade.update_time * 20 );
            debugstar( self.navmesh_origin, vortex_debug_color, vortex_debug_duration, "<dev string:x24>" );
            debugstar( self.vortex_center, vortex_debug_color, vortex_debug_duration, "<dev string:x33>" );
            utility::draw_circle( self.vortex_center, self.pull_radius, vortex_debug_color, 1, 0, vortex_debug_duration );
            utility::draw_circle( self.vortex_center, self.damage_radius, vortex_debug_color, 1, 0, vortex_debug_duration );
        }
    }

#/

// Namespace blackhole_bomb
// Params 1
// Checksum 0x8b4d06f6, Offset: 0x241c
// Size: 0x1c8
function function_54f540c482b9ebca( exit_count )
{
    self notify( #"hash_8caabc3af6c23f9a" );
    self endon( #"hash_8caabc3af6c23f9a" );
    self.anchor endon( #"death" );
    var_e23e7dbd5b176a13 = self.cached_exit_count;
    self.cached_exit_count = 0;
    
    for ( i = 0; i < var_e23e7dbd5b176a13 ; i++ )
    {
        exit_point = self.cached_exits[ i ];
        assert( isvector( exit_point ) );
        var_d8531ee3a6026a07 = distance2dsquared( self.anchor.origin, exit_point );
        
        if ( var_d8531ee3a6026a07 < 1000 || var_d8531ee3a6026a07 > 2000 )
        {
            continue;
        }
        
        self.cached_exits[ self.cached_exit_count ] = exit_point;
        self.cached_exit_count++;
    }
    
    while ( self.cached_exit_count < exit_count )
    {
        throttle_count = min( exit_count - self.cached_exit_count, 2 );
        exit_points = ai::function_7bcb54b16c07d1ec( throttle_count, self.anchor.origin, 160, 2000, 1000, 0 );
        
        foreach ( exit_point in exit_points )
        {
            self.cached_exits[ self.cached_exit_count ] = exit_point;
            self.cached_exit_count++;
        }
        
        waitframe();
    }
}

/#

    // Namespace blackhole_bomb
    // Params 0, eflags: 0x4
    // Checksum 0x541ee578, Offset: 0x25ec
    // Size: 0x7a, Type: dev
    function private function_b01850e92f2d2d52()
    {
        self.anchor endon( #"death" );
        
        while ( true )
        {
            if ( getdvarint( @"scr_debug_blackhole_teleport", 0 ) )
            {
                for ( i = 0; i < self.cached_exit_count ; i++ )
                {
                    debugstar( self.cached_exits[ i ], ( 1, 1, 1 ), 1, "<dev string:x41>" );
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xb4fe905f, Offset: 0x266e
// Size: 0x49, Type: bool
function private can_teleport()
{
    return !self isonascender() && !self isonladder() && !self ismantling() && !isdefined( self.vehicle ) && val::get( "allow_movement" ) && val::get( "allow_teleport" );
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xbc355073, Offset: 0x26c0
// Size: 0xb1
function private monitor_players_nearby()
{
    self.anchor endon( #"death" );
    
    while ( true )
    {
        throttle::throttle_wait_in_queue( level.blackhole_portal_player_search_throttle, self );
        portal_center = self.anchor get_vortex_center( self.center_height );
        self.nearby_players = getplayersinradius( portal_center, 512 );
        
        /#
            if ( getdvarint( @"scr_debug_blackhole_teleport", 0 ) )
            {
                duration = int( 0.5 / level.framedurationseconds );
                sphere( portal_center, 512, ( 1, 1, 1 ), 1, duration );
            }
        #/
    }
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0xecb0b441, Offset: 0x2779
// Size: 0x1d0
function private function_6e4bc65fe95ab552( player )
{
    if ( !isdefined( self.cached_exits ) || self.cached_exit_count <= 0 )
    {
        return;
    }
    
    valid_exits = utility::array_slice( self.cached_exits, 0, self.cached_exit_count );
    var_b45f0c69a2f522cb = arrayrandomize( valid_exits );
    fallback_exits = [];
    
    foreach ( exit_point in var_b45f0c69a2f522cb )
    {
        if ( namespace_9d8e359c3b1041e5::ispointinoutofboundssharedfunc( exit_point, player.team ) )
        {
            continue;
        }
        
        fallback_exits[ 0 ] = exit_point;
        
        if ( positionwouldtelefrag( exit_point ) )
        {
            continue;
        }
        
        fallback_exits[ 1 ] = exit_point;
        var_3a0d28ac40a2195b = getplayersandaiarrayinradius( exit_point, 250 );
        var_af032e7ac465d49c = 1;
        
        foreach ( var_93637d803e02c1ec in var_3a0d28ac40a2195b )
        {
            if ( isdefined( var_93637d803e02c1ec.team ) && var_93637d803e02c1ec.team != player.team )
            {
                var_af032e7ac465d49c = 0;
                break;
            }
        }
        
        if ( var_af032e7ac465d49c )
        {
            return exit_point;
        }
    }
    
    return fallback_exits[ 1 ] ?? fallback_exits[ 0 ] ?? var_b45f0c69a2f522cb[ 0 ];
}

// Namespace blackhole_bomb
// Params 0, eflags: 0xc
// Checksum 0xb9b58e3b, Offset: 0x2952
// Size: 0x1bb
function private teleport_screen_flash()
{
    self notify( #"hash_6dd9bab0b449f29d" );
    self endon( #"hash_6dd9bab0b449f29d" );
    level endon( #"game_ended" );
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( !isdefined( self.blackhole_teleport_overlay ) )
    {
        self.blackhole_teleport_overlay = newclienthudelem( self );
        self.blackhole_teleport_overlay.x = 0;
        self.blackhole_teleport_overlay.y = 0;
        self.blackhole_teleport_overlay setshader( "white", 640, 480 );
        self.blackhole_teleport_overlay.alignx = "left";
        self.blackhole_teleport_overlay.aligny = "top";
        self.blackhole_teleport_overlay.sort = 1;
        self.blackhole_teleport_overlay.horzalign = "fullscreen";
        self.blackhole_teleport_overlay.vertalign = "fullscreen";
        self.blackhole_teleport_overlay.alpha = 0;
        self.blackhole_teleport_overlay.foreground = 1;
        self.blackhole_teleport_overlay.archived = 0;
    }
    
    blackhole_teleport_overlay = self.blackhole_teleport_overlay;
    fade_duration = 0.15;
    blackhole_teleport_overlay fadeovertime( fade_duration );
    blackhole_teleport_overlay.alpha = 1;
    wait 0.7;
    fade_duration = 0.7;
    
    if ( isdefined( blackhole_teleport_overlay ) )
    {
        blackhole_teleport_overlay fadeovertime( fade_duration );
        blackhole_teleport_overlay.alpha = 0;
    }
    
    wait fade_duration;
    
    if ( isdefined( blackhole_teleport_overlay ) )
    {
        blackhole_teleport_overlay destroy();
    }
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0xfcdfaeb8, Offset: 0x2b15
// Size: 0x115
function private teleport_to_exit( exit_point )
{
    self endon( #"death" );
    portal = spawnscriptable( "equip_blackhole_bomb_portal_exit_t10_mp", exit_point );
    portal utility::delaycallendon( 7, "death", &freescriptable );
    destination = exit_point + ( 0, 0, 16 );
    val::set( "blackhole_teleport", "freezecontrols", 1 );
    val::set( "blackhole_teleport", "offhand_weapons", 0 );
    val::set( "blackhole_teleport", "fire", 0 );
    self playsoundevent( %"sndevent_kasimir_teleport" );
    thread teleport_screen_flash();
    wait 0.2;
    self setorigin( destination, 1 );
    waitframe();
    
    if ( isdefined( self ) )
    {
        val::reset_all( "blackhole_teleport" );
        utility::ent_flag_clear( "blackhole_teleporting" );
    }
    
    wait 0.2;
    playrumbleonposition( "blackhole_bomb_portal", exit_point );
    earthquake( 0.1, 0.5, exit_point, 256 );
    callback::callback( "on_blackhole_bomb_teleport", { #exit_point:exit_point } );
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x7461c32c, Offset: 0x2c32
// Size: 0x26b
function private teleport_players()
{
    self.anchor endon( #"death" );
    
    while ( true )
    {
        foreach ( player in self.nearby_players )
        {
            if ( !level.var_bc75d47c88b4c3cc && self.cached_exit_count == 0 )
            {
                break;
            }
            
            if ( !isalive( player ) || !player jumpbuttonpressed() || !player can_teleport() )
            {
                continue;
            }
            
            can_affect = 1;
            
            if ( isplayer( self.anchor.owner ) && utility::issharedfuncdefined( #"zm", #"hash_95f8b65e45fc2ef4" ) )
            {
                can_affect = level [[ utility::getsharedfunc( #"zm", #"hash_95f8b65e45fc2ef4" ) ]]( self.anchor.owner, player );
            }
            
            if ( !can_affect )
            {
                continue;
            }
            
            if ( player utility::ent_flag( "blackhole_teleporting" ) )
            {
                continue;
            }
            
            player_eye = player geteye();
            portal_center = self.anchor get_vortex_center( self.center_height );
            
            if ( distancesquared( player_eye, portal_center ) > 4096 )
            {
                continue;
            }
            
            if ( !trace::ray_trace_passed( player_eye, portal_center, player ) )
            {
                continue;
            }
            
            exit_point = undefined;
            
            if ( isdefined( level.var_38c5fa2d18ab8362 ) )
            {
                exit_point = self [[ level.var_38c5fa2d18ab8362 ]]( player );
            }
            else
            {
                exit_point = function_6e4bc65fe95ab552( player );
            }
            
            if ( isdefined( exit_point ) && isalive( player ) )
            {
                player utility::ent_flag_set( "blackhole_teleporting" );
                player thread teleport_to_exit( exit_point );
                
                if ( isdefined( self.anchor.vortex_struct ) && self.anchor.owner == player )
                {
                    self.anchor.vortex_struct.teleportedowner = 1;
                }
                
                wait 0.1;
            }
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0x328d2b63, Offset: 0x2ea5
// Size: 0x66
function private function_998d90b86a1d3909()
{
    self.anchor endon( #"death" );
    
    while ( true )
    {
        playrumbleonposition( "blackhole_bomb_portal", self.anchor.origin );
        earthquake( 0.1, 0.5, self.anchor.origin, 256 );
        wait 0.5;
    }
}

// Namespace blackhole_bomb
// Params 1
// Checksum 0xe3a2a089, Offset: 0x2f13
// Size: 0xba
function function_8f3c979df66aa378( is_static )
{
    level endon( #"game_ended" );
    portal_struct = spawnstruct();
    portal_struct.anchor = self;
    portal_struct.center_height = 60;
    portal_struct.nearby_players = [];
    portal_struct.cached_exits = [];
    portal_struct.cached_exit_count = 0;
    
    if ( !level.var_bc75d47c88b4c3cc )
    {
        if ( is_static )
        {
            portal_struct thread function_54f540c482b9ebca( 16 );
        }
        else
        {
            portal_struct thread function_a18d7f7c09e76f74();
        }
        
        /#
            portal_struct thread function_b01850e92f2d2d52();
        #/
    }
    
    portal_struct thread function_998d90b86a1d3909();
    portal_struct thread monitor_players_nearby();
    portal_struct thread teleport_players();
}

// Namespace blackhole_bomb
// Params 0, eflags: 0x4
// Checksum 0xc26abb78, Offset: 0x2fd5
// Size: 0x74
function private function_a18d7f7c09e76f74()
{
    self.anchor endon( #"death" );
    var_7dfb97cb604f008 = undefined;
    
    while ( true )
    {
        if ( !isdefined( var_7dfb97cb604f008 ) || distancesquared( self.anchor.origin, var_7dfb97cb604f008 ) > 65536 )
        {
            thread function_54f540c482b9ebca( 16 );
            var_7dfb97cb604f008 = self.anchor.origin;
        }
        
        waitframe();
    }
}

// Namespace blackhole_bomb
// Params 4, eflags: 0x4
// Checksum 0xe7084594, Offset: 0x3051
// Size: 0xf8
function private function_9c37dab83025b0c2( victim, einflictor, smeansofdeath, sweapon )
{
    if ( !isdefined( einflictor.birthtime ) )
    {
        return;
    }
    
    if ( !isdefined( self.grenade_kills ) )
    {
        self.grenade_kills = [];
    }
    
    if ( !isdefined( self.grenade_kills[ einflictor.birthtime ] ) )
    {
        self.grenade_kills[ einflictor.birthtime ] = 0;
    }
    
    victim.is_tatical_kill = 1;
    
    if ( self.grenade_kills[ einflictor.birthtime ] == 0 )
    {
        thread function_90a02e964e5bdd73( einflictor.birthtime );
    }
    
    self.grenade_kills[ einflictor.birthtime ]++;
    
    if ( self.grenade_kills[ einflictor.birthtime ] == 10 )
    {
        namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_eventhorizon" );
    }
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0x41e7e494, Offset: 0x3151
// Size: 0x2c
function private function_90a02e964e5bdd73( birth_time )
{
    self endon( #"death_or_disconnect" );
    wait 10;
    
    if ( isdefined( self ) )
    {
        self.grenade_kills[ birth_time ] = undefined;
    }
}

// Namespace blackhole_bomb
// Params 1, eflags: 0x4
// Checksum 0xd414f419, Offset: 0x3185
// Size: 0x97
function private function_bbd5ce0e67f46847( params )
{
    if ( isdefined( params.victim ) && params.victim vortex::is_pulled() )
    {
        if ( isplayer( params.victim.vortex_pull_owner ) && !( params.attacker === params.victim.vortex_pull_owner ) )
        {
            params.victim.vortex_pull_owner namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"pull_assist" );
        }
    }
}

