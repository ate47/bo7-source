#using scripts\common\callbacks;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\mp\destructibles\destructibles;

#namespace soul_harvest;

// Namespace soul_harvest
// Params 1
// Checksum 0x430759a1, Offset: 0xed
// Size: 0x214
function execute( params )
{
    init_vfx( params );
    init_sfx( params );
    vector_right = anglestoright( self.angles ) * params.soulharvestoffset.x;
    vector_forward = anglestoforward( self.angles ) * params.soulharvestoffset.y;
    vector_up = anglestoup( self.angles ) * params.soulharvestoffset.z;
    self.harvest_agents = params.soulharvestagents;
    self.harvest_players = params.soulharvestplayers;
    self.harvest_offset = vector_right + vector_forward + vector_up;
    self.required_souls = self.required_souls > 0 ? self.required_souls : params.requiredsouls;
    
    if ( !isdefined( self.harvest_radius ) )
    {
        self.harvest_radius = params.radius;
    }
    
    if ( !isdefined( self.var_f1254bfe6aa67aa4 ) )
    {
        self.var_f1254bfe6aa67aa4 = params.var_a18892d9b725c20e;
    }
    
    if ( !isdefined( self.behavior_params ) )
    {
        self.behavior_params = { #params:params, #destructible:self };
    }
    
    if ( self.harvest_agents && !level callback::exists( #"on_ai_killed", &function_8c5e06ee1e60aeb7, self.behavior_params ) )
    {
        level callback::add( #"on_ai_killed", &function_8c5e06ee1e60aeb7, self.behavior_params );
    }
    
    if ( self.harvest_players && !level callback::exists( #"player_death", &function_8c5e06ee1e60aeb7, self.behavior_params ) )
    {
        level callback::add( #"player_death", &function_8c5e06ee1e60aeb7, self.behavior_params );
    }
}

// Namespace soul_harvest
// Params 1, eflags: 0x4
// Checksum 0xe387dfef, Offset: 0x309
// Size: 0x12d
function private init_vfx( params )
{
    if ( !utility::fxexists( #"hash_604cfaa80b608b89" ) && isdefined( params.soulspawnvfx ) && params.soulspawnvfx != "" )
    {
        utility::add_fx( #"hash_604cfaa80b608b89", params.soulspawnvfx );
    }
    
    if ( !utility::fxexists( #"hash_88f6d1ad054f367a" ) && isdefined( params.var_734bd925083510d5 ) && params.var_734bd925083510d5 != "" )
    {
        utility::add_fx( #"hash_88f6d1ad054f367a", params.var_734bd925083510d5 );
    }
    
    if ( !utility::fxexists( #"hash_929c5a896f6cb634" ) && isdefined( params.var_885330eefe2c947 ) && params.var_885330eefe2c947 != "" )
    {
        utility::add_fx( #"hash_929c5a896f6cb634", params.var_885330eefe2c947 );
    }
    
    self.var_be660d5924a1eaaf = params.var_f07b39699a5482de;
    self.var_8522d40367bee98b = params.var_cef840be81ac44d4;
}

// Namespace soul_harvest
// Params 1, eflags: 0x4
// Checksum 0xfdf61116, Offset: 0x43e
// Size: 0x34
function private init_sfx( params )
{
    self.soul_sfx = params.soulsfx;
    self.var_51f5e4bbe463ed23 = params.soulharvestsfx;
}

// Namespace soul_harvest
// Params 2, eflags: 0x4
// Checksum 0x83996e17, Offset: 0x47a
// Size: 0xab
function private function_8c5e06ee1e60aeb7( callback_params, destructible_data )
{
    if ( !destructible_data || !destructible_data.destructible )
    {
        return;
    }
    
    destructible = destructible_data.destructible;
    attacker = callback_params.eattacker ?? callback_params.attacker;
    params = destructible_data.params;
    
    if ( destructible function_2b1d7974f9c50ccc( self, destructible.harvest_radius, attacker ) )
    {
        destructible thread harvest_soul( self, params.travelspeed, attacker );
    }
}

// Namespace soul_harvest
// Params 3, eflags: 0x4
// Checksum 0x6ffa79bc, Offset: 0x52d
// Size: 0xf6
function private function_2b1d7974f9c50ccc( var_74ef24ae7dede8b, max_radius, attacker )
{
    is_in_radius = distance2d( self.origin, var_74ef24ae7dede8b.origin ) < max_radius;
    is_hidden = self getscriptablepartstate( "body" ) == "hidden";
    is_valid_death = attacker.classname != "worldspawn";
    
    if ( !is_in_radius || is_hidden || !is_valid_death )
    {
        return 0;
    }
    
    trace = trace::ray_trace( self.origin + self.harvest_offset * 2, var_74ef24ae7dede8b.origin, attacker );
    is_in_sight = self.var_f1254bfe6aa67aa4 || trace[ "hittype" ] == "hittype_entity" && trace[ "entity" ] == var_74ef24ae7dede8b;
    return is_in_sight;
}

// Namespace soul_harvest
// Params 3, eflags: 0x4
// Checksum 0x4fd48039, Offset: 0x62c
// Size: 0x23f
function private harvest_soul( harvested_agent, speed, eattacker )
{
    if ( self.required_souls <= 0 )
    {
        return;
    }
    
    soul_spawn_position = harvested_agent gettagorigin( "j_spineupper", 1 ) ?? harvested_agent.origin;
    soul = utility::spawn_model( "tag_origin", soul_spawn_position );
    waitframe();
    
    if ( utility::fxexists( #"hash_604cfaa80b608b89" ) )
    {
        playfx( utility::getfx( #"hash_604cfaa80b608b89" ), soul_spawn_position );
    }
    
    if ( isdefined( self.soul_sfx ) )
    {
        soul utility::playsoundontag( self.soul_sfx, "tag_origin", 1 );
    }
    
    harvest_position = isdefined( self.harvest_offset ) ? self.origin + self.harvest_offset : self.origin;
    soul thread soul_fly( soul.origin, harvest_position, #"hash_88f6d1ad054f367a", 0, undefined, 0, speed, undefined, undefined, 0 );
    soul waittill( #"curve_done" );
    
    if ( utility::fxexists( #"hash_604cfaa80b608b89" ) )
    {
        playfxontag( utility::getfx( #"hash_929c5a896f6cb634" ), soul, "tag_origin" );
    }
    
    soul delete();
    
    if ( isdefined( self.var_be660d5924a1eaaf ) && isdefined( self.var_8522d40367bee98b ) && self getscriptablepartstate( self.var_be660d5924a1eaaf ) != self.var_8522d40367bee98b )
    {
        self setscriptablepartstate( self.var_be660d5924a1eaaf, self.var_8522d40367bee98b );
    }
    
    if ( isdefined( self.var_51f5e4bbe463ed23 ) )
    {
        playsoundatpos( self.origin, self.var_51f5e4bbe463ed23 );
    }
    
    self.required_souls--;
    
    if ( self.required_souls <= 0 && !destructible::is_destroyed() )
    {
        destructible::destroy();
        is_destroyed = 1;
    }
    
    params = { #is_destroyed:is_destroyed, #lastattacker:eattacker, #lastai:harvested_agent };
    callback::callback( #"hash_9789f5483d638c9", params );
}

// Namespace soul_harvest
// Params 10
// Checksum 0x706782f, Offset: 0x873
// Size: 0x278
function soul_fly( original_pos, targetpos, var_521d025b303e59da, fly_z_offset, angles_blend_speed, var_99dfa1bd6d86270a, var_bb08488146c540f, var_abb9bf56d9a02e67, override_distance, b_delete )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self endon( #"delete" );
    self.angles = vectortoangles( ( 0, 0, 1 ) );
    waitframe();
    
    if ( isdefined( var_521d025b303e59da ) && level._effect[ var_521d025b303e59da ] && level._effect[ var_521d025b303e59da ] != 0 )
    {
        playfxontag( level._effect[ var_521d025b303e59da ], self, "tag_origin" );
    }
    
    var_8be655dc8f7fe6fd = isdefined( var_abb9bf56d9a02e67 ) && var_abb9bf56d9a02e67.size >= 2;
    
    if ( var_8be655dc8f7fe6fd )
    {
        self playsound( var_abb9bf56d9a02e67[ 0 ] );
        waitframe();
        self playloopsound( var_abb9bf56d9a02e67[ 1 ] );
    }
    
    wait var_99dfa1bd6d86270a ?? 1;
    
    if ( !isdefined( fly_z_offset ) )
    {
        fly_z_offset = 100;
    }
    
    if ( fly_z_offset > 0 )
    {
        self movez( fly_z_offset, 1 );
        self waittill( #"movedone" );
    }
    
    if ( !isdefined( angles_blend_speed ) )
    {
        angles_blend_speed = 0.02;
    }
    
    fly_speed = var_bb08488146c540f ?? 10;
    angles_blend = 0;
    target_distance = override_distance ?? 100;
    
    while ( isdefined( targetpos ) )
    {
        v_destination = isent( targetpos ) ? targetpos.origin : targetpos;
        face_angles = vectortoangles( v_destination - self.origin );
        self.angles = anglelerpquatfrac( self.angles, face_angles, angles_blend );
        self.origin = anglestoforward( self.angles ) * fly_speed + self.origin;
        
        if ( angles_blend < 1 )
        {
            angles_blend += angles_blend_speed;
            angles_blend = clamp( angles_blend, 0, 1 );
        }
        
        if ( distancesquared( v_destination, self.origin ) <= target_distance )
        {
            break;
        }
        
        waitframe();
    }
    
    self notify( #"curve_done" );
    level utility::flag_set( "curve_done" );
    
    if ( isdefined( var_abb9bf56d9a02e67 ) && var_abb9bf56d9a02e67.size >= 3 )
    {
        self playsound( var_abb9bf56d9a02e67[ 2 ] );
        waitframe();
        self stoploopsound();
    }
    
    waitframe();
    
    if ( !isdefined( b_delete ) )
    {
        b_delete = 1;
    }
    
    if ( b_delete )
    {
        self delete();
    }
}

