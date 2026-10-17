#using script_208a12cbcccbfa63;
#using scripts\common\active_env\utility;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace portals;

// Namespace portals
// Params 0
// Checksum 0x70558b63, Offset: 0x2a0
// Size: 0x496
function portals_init()
{
    level.var_eb26bc1937ca083f = [ "veh_drone_launcher_bomb_mp", "veh_ground_drone_unit", "veh_ground_drone_unit_guild", %"hash_149e5b4ae609aede", "veh_sat_dart_mark_zero_controlled", "veh_t10_valkyrie_rocket" ];
    
    if ( !level callback::exists( #"grenade_fire", &on_grenade_fire ) )
    {
        level callback::add( #"grenade_fire", &on_grenade_fire );
    }
    
    if ( !level callback::exists( #"missile_fire", &on_missile_fire ) )
    {
        level callback::add( #"missile_fire", &on_missile_fire );
    }
    
    if ( !level callback::exists( #"vehicle_spawn", &on_vehicle_spawn ) )
    {
        level callback::add( #"vehicle_spawn", &on_vehicle_spawn );
    }
    
    var_391b152193c736c3 = getentarray( "portal_forward", #script_noteworthy );
    var_3ad8001cd7c748eb = getentarray( "portal_backward", #script_noteworthy );
    level.var_d9b64c8c2369f915 = arraycombine( var_391b152193c736c3, var_3ad8001cd7c748eb );
    level.var_85b6ad765e4e6748 = squared( 90 );
    
    foreach ( e_portal in level.var_d9b64c8c2369f915 )
    {
        e_portal.b_backwards = e_portal.script_noteworthy == "portal_backward";
        var_5a9a7b799f0865e9 = e_portal getboundscorners();
        
        if ( isdefined( var_5a9a7b799f0865e9 ) )
        {
            e_portal.var_d989bdd2f7142386 = ( var_5a9a7b799f0865e9[ 0 ] + var_5a9a7b799f0865e9[ 1 ] ) / 2;
        }
        
        e_portal.end_portal = undefined;
        
        foreach ( e_portal_target in level.var_d9b64c8c2369f915 )
        {
            if ( e_portal.target === e_portal_target.targetname )
            {
                e_portal.end_portal = e_portal_target;
                e_portal.var_7568471ee00ffbec = e_portal.end_portal.angles - e_portal.angles;
                e_portal.var_98b525faf6361e54 = e_portal getboundshalfsize();
                e_portal.end_portal.var_98b525faf6361e54 = e_portal.end_portal getboundshalfsize();
                e_portal.var_3a87370b07a6c406 = e_portal.end_portal.var_98b525faf6361e54 / e_portal.var_98b525faf6361e54;
                break;
            }
        }
        
        if ( !isdefined( e_portal.end_portal ) )
        {
            logstring( "portal_init(): Couldn't find end portal for portal " + e_portal.targetname );
            continue;
        }
        
        var_6ea2cc156ecd65d4 = getentarray( "portal_grenade_catcher", #script_noteworthy );
        
        foreach ( e_portal_grenade_catcher in var_6ea2cc156ecd65d4 )
        {
            if ( e_portal.targetname === e_portal_grenade_catcher.target )
            {
                e_portal.e_grenade_catcher = e_portal_grenade_catcher;
                e_portal_grenade_catcher.e_parent_portal = e_portal;
                e_portal.e_grenade_catcher thread function_9b114fd07a904844();
                break;
            }
        }
        
        if ( isdefined( e_portal.script_speed_scale ) )
        {
            e_portal.var_24fc9c98b7363929 = float( e_portal.script_speed_scale );
        }
        
        e_portal.b_match_portal_forward = issubstr( e_portal.script_parameters, "exit_matching_forward" );
        e_portal.var_c8c69c9965ffb891 = issubstr( e_portal.script_parameters, "exit_from_center" );
        e_portal thread attach_fx();
        trigger::makeenterexittrigger( e_portal, &portal_enter, &portal_exit );
    }
}

// Namespace portals
// Params 2, eflags: 0x4
// Checksum 0x6c26a2a3, Offset: 0x73e
// Size: 0xd7
function private function_7f3b987936c7714f( initialangles, trigger )
{
    if ( trigger.end_portal.b_match_portal_forward )
    {
        var_61fbd8cc0d14a973 = trigger.end_portal.angles;
        
        if ( !trigger.end_portal.b_backwards )
        {
            var_61fbd8cc0d14a973 += ( 0, 180, 0 );
        }
        
        return ( initialangles[ 0 ], var_61fbd8cc0d14a973[ 1 ], initialangles[ 2 ] );
    }
    
    if ( isdefined( trigger.end_portal.script_rotation_amount ) )
    {
        return trigger.end_portal.script_rotation_amount;
    }
    
    return ( initialangles[ 0 ], initialangles[ 1 ] + trigger.var_7568471ee00ffbec[ 1 ], initialangles[ 2 ] );
}

// Namespace portals
// Params 3
// Checksum 0x1f26e6f7, Offset: 0x81d
// Size: 0x3a
function function_c2784dc7bd1c4dba( portal, part, state )
{
    portal.var_dda180a08dea7a7a = part;
    portal.var_4118ba7b49bef668 = state;
}

// Namespace portals
// Params 2, eflags: 0x4
// Checksum 0x778ea821, Offset: 0x85f
// Size: 0x5b
function private function_9eeea91c9816ce7f( portal, e_player )
{
    playerpart = portal.var_dda180a08dea7a7a ?? "playerTeleport";
    playerstate = portal.var_4118ba7b49bef668 ?? "on";
    e_player setscriptablepartstate( playerpart, playerstate, 0 );
}

// Namespace portals
// Params 3, eflags: 0x4
// Checksum 0x8113fbb1, Offset: 0x8c2
// Size: 0x61
function private function_60a30c7aa21c4587( var_4cf6bb3de7021811, var_1e74cadce9bae5ba, var_ec285c40cae2723 )
{
    var_a5fea4b5b174628 = utility::function_136bd9aeb8121a6b( var_4cf6bb3de7021811, var_1e74cadce9bae5ba );
    var_5da0e93623194c38 = anglestoright( var_ec285c40cae2723 ) * var_a5fea4b5b174628[ 0 ] + anglestoup( var_ec285c40cae2723 ) * var_a5fea4b5b174628[ 1 ] + anglestoforward( var_ec285c40cae2723 ) * var_a5fea4b5b174628[ 2 ];
    return var_5da0e93623194c38;
}

// Namespace portals
// Params 2, eflags: 0x4
// Checksum 0xee44c83e, Offset: 0x92c
// Size: 0xd3
function private function_4ef03da65b0ecbfc( var_1ac5aa9d55bd6513, trigger )
{
    if ( trigger.end_portal.b_match_portal_forward )
    {
        var_d1f605a42e48e93b = anglestoforward( trigger.end_portal.angles );
        
        if ( !trigger.end_portal.b_backwards )
        {
            var_d1f605a42e48e93b *= -1;
        }
        
        var_76d9d358545ef74 = length( var_1ac5aa9d55bd6513 ) * var_d1f605a42e48e93b;
    }
    else
    {
        var_76d9d358545ef74 = function_60a30c7aa21c4587( var_1ac5aa9d55bd6513, trigger.angles, trigger.end_portal.angles );
    }
    
    var_76d9d358545ef74 *= trigger.end_portal.var_24fc9c98b7363929 ?? 1;
    return var_76d9d358545ef74;
}

/#

    // Namespace portals
    // Params 1, eflags: 0x4
    // Checksum 0x8dbf805, Offset: 0xa08
    // Size: 0x13a, Type: dev
    function private function_f470b8bb4fc3a248( gameobject )
    {
        var_798e62c5664f570f = 400;
        var_798e61c5664f54dc = 400;
        warningmessage = [ "<dev string:x24>", "<dev string:x4c>", "<dev string:x7d>" + ( gameobject.code_classname ? gameobject.code_classname : "<dev string:x8e>" ), "<dev string:x98>" + gameobject getentitynumber() ];
        color = ( 1, 1, 1 );
        scale = 1.5;
        duration = 180;
        
        foreach ( line in warningmessage )
        {
            printtoscreen2d( var_798e62c5664f570f, var_798e61c5664f54dc, line, color, scale, duration );
            println( line );
            var_798e61c5664f54dc += 16 * scale;
        }
    }

#/

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0xd3df5b35, Offset: 0xb4a
// Size: 0xf6
function private function_a2da9cb21d254e6( trigger )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( self.var_6ed5e4d8e31f97d )
    {
        return;
    }
    
    self.var_6ed5e4d8e31f97d = 1;
    var_694419cc60025f14 = trigger;
    
    while ( self.var_6ed5e4d8e31f97d )
    {
        var_c21abe997a5dce41 = anglestoforward( self.angles );
        var_c21abb997a5dc7a8 = anglestoforward( var_694419cc60025f14.angles );
        n_dot = vectordot( var_c21abe997a5dce41, var_c21abb997a5dc7a8 );
        
        if ( var_694419cc60025f14.b_backwards )
        {
            n_dot *= -1;
        }
        
        if ( n_dot >= 0 )
        {
            portal_exit( self, var_694419cc60025f14, 1 );
            
            if ( isdefined( trigger.end_portal ) )
            {
                var_694419cc60025f14 = trigger.end_portal;
                waitframe();
            }
        }
        
        if ( self istouching( var_694419cc60025f14 ) === 0 )
        {
            self.var_6ed5e4d8e31f97d = 0;
        }
        
        waitframe();
    }
}

// Namespace portals
// Params 1
// Checksum 0x3bfb0ce5, Offset: 0xc48
// Size: 0x1a
function portal_disable( trigger )
{
    trigger.portal_disabled = 1;
}

// Namespace portals
// Params 1
// Checksum 0x98724edf, Offset: 0xc6a
// Size: 0x19
function portal_enable( trigger )
{
    trigger.portal_disabled = 0;
}

// Namespace portals
// Params 2, eflags: 0x4
// Checksum 0x308665db, Offset: 0xc8b
// Size: 0x80
function private portal_enter( var_fd3a9f9e9a2a06c2, trigger )
{
    if ( trigger.portal_disabled )
    {
        return;
    }
    
    if ( var_fd3a9f9e9a2a06c2.var_670c0bc02418cdc3 )
    {
        var_fd3a9f9e9a2a06c2 thread [[ var_fd3a9f9e9a2a06c2.var_670c0bc02418cdc3 ]]( trigger );
    }
    
    if ( trigger.var_670c0bc02418cdc3 )
    {
        trigger thread [[ trigger.var_670c0bc02418cdc3 ]]( var_fd3a9f9e9a2a06c2 );
    }
    
    if ( var_fd3a9f9e9a2a06c2.vehiclename === "veh_sniper_drone_mp" )
    {
        var_fd3a9f9e9a2a06c2 thread function_a2da9cb21d254e6( trigger );
    }
}

// Namespace portals
// Params 3, eflags: 0x4
// Checksum 0x60217981, Offset: 0xd13
// Size: 0x718
function private portal_exit( var_fd3a9f9e9a2a06c2, trigger, var_ee0397e52bee4ac3 = 0 )
{
    if ( trigger.portal_disabled || trigger.var_2758a512189db7aa )
    {
        return;
    }
    
    e_parent = var_fd3a9f9e9a2a06c2 getlinkedparent();
    
    if ( e_parent )
    {
        return;
    }
    
    if ( trigger.end_portal.var_c8c69c9965ffb891 )
    {
        var_363abe40bb74d86 = trigger.end_portal.var_d989bdd2f7142386;
    }
    else
    {
        if ( trigger.var_3a87370b07a6c406 === ( 1, 1, 1 ) )
        {
            var_363abe40bb74d86 = var_fd3a9f9e9a2a06c2.origin + trigger.end_portal.var_d989bdd2f7142386 - trigger.var_d989bdd2f7142386;
        }
        else
        {
            var_e30d6120c156005c = var_fd3a9f9e9a2a06c2.origin - trigger.var_d989bdd2f7142386;
            var_e30d6120c156005c = utility::function_6b6c127afa12d17( ( 0, 0, 0 ), var_e30d6120c156005c, trigger.angles * -1 );
            var_e30d6120c156005c = ( clamp( var_e30d6120c156005c[ 0 ], trigger.var_98b525faf6361e54[ 0 ] * -1, trigger.var_98b525faf6361e54[ 0 ] ), clamp( var_e30d6120c156005c[ 1 ], trigger.var_98b525faf6361e54[ 1 ] * -1, trigger.var_98b525faf6361e54[ 1 ] ), clamp( var_e30d6120c156005c[ 2 ], trigger.var_98b525faf6361e54[ 2 ] * -1, trigger.var_98b525faf6361e54[ 2 ] ) );
            var_d0578d07d14a547 = var_e30d6120c156005c * trigger.var_3a87370b07a6c406;
            var_d0578d07d14a547 = utility::function_6b6c127afa12d17( ( 0, 0, 0 ), var_d0578d07d14a547, trigger.angles );
            var_363abe40bb74d86 = trigger.end_portal.var_d989bdd2f7142386 + var_d0578d07d14a547;
        }
        
        var_363abe40bb74d86 = utility::function_6b6c127afa12d17( trigger.end_portal.var_d989bdd2f7142386, var_363abe40bb74d86, trigger.var_7568471ee00ffbec );
    }
    
    if ( var_fd3a9f9e9a2a06c2.targetname == "player_corpse" )
    {
        var_fd3a9f9e9a2a06c2 show();
        
        if ( isdefined( trigger.end_portal.script_rotation_amount ) )
        {
            var_229de8f72718880b = trigger.end_portal.script_rotation_amount;
        }
        else
        {
            var_1e5fd95e5c830b24 = var_fd3a9f9e9a2a06c2.angles;
            var_229de8f72718880b = ( var_1e5fd95e5c830b24[ 0 ], var_1e5fd95e5c830b24[ 1 ] + trigger.var_7568471ee00ffbec[ 1 ], var_1e5fd95e5c830b24[ 2 ] );
        }
        
        var_8c04fa0af1c9355c = function_4ef03da65b0ecbfc( var_fd3a9f9e9a2a06c2 getentityvelocity(), trigger );
        var_fd3a9f9e9a2a06c2 teleportentity( var_363abe40bb74d86, var_229de8f72718880b, var_8c04fa0af1c9355c );
        trigger play_portal_fx();
    }
    else if ( isplayer( var_fd3a9f9e9a2a06c2 ) )
    {
        e_player = var_fd3a9f9e9a2a06c2;
        
        if ( !var_ee0397e52bee4ac3 )
        {
            if ( !function_3d92f463028dabb7( var_fd3a9f9e9a2a06c2.origin, trigger ) )
            {
                return;
            }
        }
        
        if ( !isalive( e_player ) )
        {
            return;
        }
        
        if ( e_player.portal_disabled )
        {
            return;
        }
        
        var_229de8f72718880b = function_7f3b987936c7714f( e_player getplayerangles(), trigger );
        var_8c04fa0af1c9355c = function_4ef03da65b0ecbfc( e_player getvelocity(), trigger );
        e_player setorigin( var_363abe40bb74d86 );
        e_player setplayerangles( var_229de8f72718880b );
        e_player setvelocity( var_8c04fa0af1c9355c );
        var_a99e9591d3290aa3 = e_player function_45d2d1c66809e8b9();
        e_player function_fe1d70a07d74725( var_a99e9591d3290aa3 + trigger.var_7568471ee00ffbec[ 1 ] );
        function_9eeea91c9816ce7f( trigger, e_player );
        trigger play_portal_fx( "trigger_player" );
    }
    else if ( var_fd3a9f9e9a2a06c2 vehicle::is_vehicle() )
    {
        e_vehicle = var_fd3a9f9e9a2a06c2;
        
        if ( !var_ee0397e52bee4ac3 )
        {
            if ( !function_3d92f463028dabb7( var_fd3a9f9e9a2a06c2.origin, trigger ) )
            {
                return;
            }
        }
        
        var_e8b3880d0b418bf2 = function_7f3b987936c7714f( e_vehicle.angles, trigger );
        var_a5138e4eb36411ef = function_4ef03da65b0ecbfc( e_vehicle vehicle_getvelocity(), trigger );
        
        if ( e_vehicle.vehiclename == "veh_sat_dart_mark_zero_controlled" || e_vehicle.vehiclename == "veh_t10_valkyrie_rocket" )
        {
            if ( e_vehicle.b_teleporting )
            {
                return;
            }
            
            e_vehicle.b_teleporting = 1;
            e_vehicle thread function_ed4215fc01e15b32();
            e_vehicle vehicle_teleport( var_363abe40bb74d86, var_e8b3880d0b418bf2 );
        }
        else
        {
            if ( e_vehicle.b_teleporting )
            {
                return;
            }
            
            e_vehicle.b_teleporting = 1;
            e_vehicle thread function_ed4215fc01e15b32();
            e_vehicle function_3054541584df8ab4( 1 );
            e_vehicle thread function_d2ae2f55a056f821();
            e_vehicle vehicle_teleport( var_363abe40bb74d86, var_e8b3880d0b418bf2 );
            e_vehicle vehicle_setvelocity( var_a5138e4eb36411ef );
            e_driver = e_vehicle getvehicleowner();
            
            if ( isdefined( e_driver ) )
            {
                e_driver setplayerangles( var_e8b3880d0b418bf2 );
            }
        }
        
        trigger play_portal_fx();
    }
    else if ( isagent( var_fd3a9f9e9a2a06c2 ) || isactor( var_fd3a9f9e9a2a06c2 ) )
    {
        e_agent = var_fd3a9f9e9a2a06c2;
        
        if ( !var_ee0397e52bee4ac3 )
        {
            if ( !function_3d92f463028dabb7( var_fd3a9f9e9a2a06c2.origin, trigger ) )
            {
                return;
            }
        }
        
        var_975539d8dc62c4e3 = function_7f3b987936c7714f( e_agent.angles, trigger );
        var_76d9d358545ef74 = function_4ef03da65b0ecbfc( e_agent getvelocity(), trigger );
        e_agent forceteleport( var_363abe40bb74d86, var_975539d8dc62c4e3 );
        e_agent setvelocity( var_76d9d358545ef74 );
        trigger play_portal_fx();
    }
    else if ( var_fd3a9f9e9a2a06c2.code_classname == "script_model" )
    {
        e_model = var_fd3a9f9e9a2a06c2;
        e_model show();
        
        if ( e_model.weapon_name == "sat_smart_seeker_mp" )
        {
            if ( e_model.b_teleporting )
            {
                return;
            }
            
            e_model.b_teleporting = 1;
            
            if ( utility::issharedfuncdefined( #"smart_seeker", #"teleport_values" ) )
            {
                var_569c40882e35d266 = utility::getsharedfunc( #"smart_seeker", #"teleport_values" );
                e_model [[ var_569c40882e35d266 ]]( var_363abe40bb74d86, trigger.var_7568471ee00ffbec );
            }
            
            trigger play_portal_fx();
        }
        else
        {
            /#
                function_f470b8bb4fc3a248( var_fd3a9f9e9a2a06c2 );
            #/
            
            return;
        }
    }
    else if ( isvalidmissile( var_fd3a9f9e9a2a06c2 ) )
    {
        e_missile = var_fd3a9f9e9a2a06c2;
        e_missile show();
        
        if ( e_missile.equipmentref == "equip_dart_mark_zero" )
        {
            if ( utility::issharedfuncdefined( #"dart_mark_zero", #"hash_5af6280fe208d22d" ) )
            {
                var_ee2df06fbc95c651 = utility::getsharedfunc( #"dart_mark_zero", #"hash_5af6280fe208d22d" );
                e_missile [[ var_ee2df06fbc95c651 ]]( var_363abe40bb74d86, trigger.var_7568471ee00ffbec );
            }
        }
        else
        {
            var_975539d8dc62c4e3 = function_7f3b987936c7714f( e_missile.angles, trigger );
            var_807b6350888288f6 = function_4ef03da65b0ecbfc( e_missile getentityvelocity(), trigger );
            e_missile teleportentity( var_363abe40bb74d86, var_975539d8dc62c4e3, var_807b6350888288f6 );
        }
        
        trigger play_portal_fx();
    }
    else
    {
        /#
            function_f470b8bb4fc3a248( var_fd3a9f9e9a2a06c2 );
        #/
        
        return;
    }
    
    if ( var_fd3a9f9e9a2a06c2.var_485899a46494a80f )
    {
        var_fd3a9f9e9a2a06c2 thread [[ var_fd3a9f9e9a2a06c2.var_485899a46494a80f ]]( trigger );
    }
}

// Namespace portals
// Params 2, eflags: 0x4
// Checksum 0x9ce9082b, Offset: 0x1433
// Size: 0x67, Type: bool
function private function_3d92f463028dabb7( var_d0390b7c9fe91b6c, e_trigger )
{
    var_95c36de452225ba3 = var_d0390b7c9fe91b6c - e_trigger.var_d989bdd2f7142386;
    var_cd59f3dbef8670ac = vectordot( var_95c36de452225ba3, anglestoforward( e_trigger.angles ) );
    
    if ( e_trigger.b_backwards )
    {
        var_cd59f3dbef8670ac *= -1;
    }
    
    return var_cd59f3dbef8670ac > 0;
}

// Namespace portals
// Params 0, eflags: 0x4
// Checksum 0xa6899282, Offset: 0x14a3
// Size: 0x2a
function private function_ed4215fc01e15b32()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    wait 0.5;
    self.b_teleporting = 0;
}

// Namespace portals
// Params 0, eflags: 0x4
// Checksum 0x7149cb30, Offset: 0x14d5
// Size: 0x27
function private function_d2ae2f55a056f821()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    wait 0.1;
    self function_3054541584df8ab4( 0 );
}

// Namespace portals
// Params 0, eflags: 0x4
// Checksum 0x47a0f655, Offset: 0x1504
// Size: 0x4f
function private attach_fx()
{
    level endon( #"game_ended" );
    utility::flag_wait( "scriptables_ready" );
    scriptables = getscriptablearray( self.targetname, #script_noteworthy );
    
    if ( isdefined( scriptables[ 0 ] ) )
    {
        self.var_68cbf87d1d84490b = scriptables[ 0 ];
    }
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0xe125d0cc, Offset: 0x155b
// Size: 0x70
function private play_portal_fx( str_fx_state = "trigger_nonplayer" )
{
    if ( isdefined( self.var_68cbf87d1d84490b ) )
    {
        self.var_68cbf87d1d84490b setscriptablepartstate( "portal_anim", str_fx_state );
    }
    
    if ( isdefined( self.end_portal.var_68cbf87d1d84490b ) )
    {
        self.end_portal.var_68cbf87d1d84490b setscriptablepartstate( "portal_anim", str_fx_state );
    }
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0x5cfc9de4, Offset: 0x15d3
// Size: 0x1f
function private on_grenade_fire( params )
{
    level thread function_6ad4b6f3b8e7c345( params.grenade );
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0xea51ac97, Offset: 0x15fa
// Size: 0x1f
function private on_missile_fire( params )
{
    level thread function_6ad4b6f3b8e7c345( params.missile );
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0x5ce18e7f, Offset: 0x1621
// Size: 0x1f
function private on_vehicle_spawn( params )
{
    level thread function_6ad4b6f3b8e7c345( params.vehicle );
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0xb4569cbc, Offset: 0x1648
// Size: 0x246
function private function_6ad4b6f3b8e7c345( e_ent )
{
    level endon( #"game_ended" );
    e_ent endon( #"death" );
    
    while ( e_ent )
    {
        switch ( e_ent.code_classname )
        {
            case #"hash_8b48887639da2db5":
            case #"hash_e224d0b635d0dadd":
                if ( e_ent.b_teleporting != 1 )
                {
                    foreach ( e_portal in level.var_d9b64c8c2369f915 )
                    {
                        if ( isdefined( e_portal.e_grenade_catcher ) )
                        {
                            if ( e_portal.e_grenade_catcher istouchingpoint( e_ent.origin ) )
                            {
                                e_ent.b_teleporting = 1;
                                e_ent thread function_f50d8c3306506550( e_portal );
                            }
                        }
                    }
                }
                
                break;
            case #"hash_4af55147c6098215":
                if ( !arraycontains( level.var_eb26bc1937ca083f, e_ent.vehiclename ) )
                {
                    return;
                }
                
                if ( e_ent.var_cc53278fbd5b9af8 != 1 )
                {
                    foreach ( e_portal in level.var_d9b64c8c2369f915 )
                    {
                        if ( e_portal istouchingpoint( e_ent.origin ) )
                        {
                            e_ent.var_cc53278fbd5b9af8 = 1;
                            e_ent.var_c0ed8d2ec47260c1 = e_portal;
                            break;
                        }
                    }
                }
                else if ( !e_ent.var_c0ed8d2ec47260c1 istouchingpoint( e_ent.origin ) )
                {
                    e_ent.var_cc53278fbd5b9af8 = 0;
                    portal_exit( e_ent, e_ent.var_c0ed8d2ec47260c1 );
                }
                
                break;
            default:
                return;
        }
        
        waitframe();
    }
}

// Namespace portals
// Params 0, eflags: 0x4
// Checksum 0xd24b4e5c, Offset: 0x1896
// Size: 0x41
function private function_9b114fd07a904844()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"portal", e_ent );
        e_ent thread function_f50d8c3306506550( self.e_parent_portal );
    }
}

// Namespace portals
// Params 1, eflags: 0x4
// Checksum 0x7e674f0c, Offset: 0x18df
// Size: 0x2d
function private function_f50d8c3306506550( e_portal )
{
    level endon( #"game_ended" );
    self hide();
    waitframe();
    
    if ( self )
    {
        portal_exit( self, e_portal );
    }
}

