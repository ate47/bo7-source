#using script_16ea1b94f0f381b3;
#using script_6b10011ac07f7291;
#using scripts\common\callbacks;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\values;

#namespace namespace_2bfee0fa87a9007a;

// Namespace namespace_2bfee0fa87a9007a
// Params 0
// Checksum 0xb1b1a690, Offset: 0x2b5
// Size: 0x73
function init_mech_beam_attack()
{
    callback::add( #"on_ai_killed", &cleanup_beam_ents );
    self.beam_ent = spawn( "script_model", ( 0, 0, 0 ) );
    self.beam_ent setmodel( "tag_origin_libra_mech_beam_tip" );
    self.beam_ent utility::function_7c10ea82c1e305b8( "beam_tip", "off" );
    thread utility::delete_on_death( self.beam_ent );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1
// Checksum 0xb9b91838, Offset: 0x330
// Size: 0x15
function start_beam_attack( speed_mult )
{
    thread beam_attack_loop( speed_mult );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 0
// Checksum 0xeceaf6ba, Offset: 0x34d
// Size: 0xe
function stop_beam_attack()
{
    self notify( #"beam_attack_loop_finished" );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0x793955ba, Offset: 0x363
// Size: 0x62
function private calculate_beam_damage( hit_ent )
{
    beam_damage = 12;
    
    if ( isplayer( hit_ent ) && !hit_ent utility::ent_flag( "mech_beam_shocked" ) )
    {
        if ( level.players.size <= 1 && hit_ent != self.focustarget )
        {
            beam_damage = 100;
        }
        else
        {
            beam_damage = 48;
        }
    }
    
    return beam_damage;
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0x3345e84d, Offset: 0x3ce
// Size: 0x27f
function private beam_attack_loop( speed_mult )
{
    self endon( #"death" );
    self endon( #"beam_attack_loop_finished" );
    thread beam_attack_on_end();
    mech = self;
    self.beam_ent dontinterpolate();
    last_hit_something = 0;
    var_c5b5bb741c705530 = 0;
    desired_end_pos = ( mech.origin[ 0 ], mech.origin[ 1 ], mech.origin[ 2 ] + 30 ) + get_head_forward() * 3000;
    fx = utility::getfx( "vfx_sat_wc_libra_mech_beam" );
    self.beam_fx = playfxontagsbetweenclients( fx, mech, "tag_aim", self.beam_ent, "tag_origin" );
    
    if ( isdefined( self.beam_fx ) )
    {
        self.beam_fx namespace_9d8e359c3b1041e5::forcenetfieldhighlod_sharedfunc( 1 );
    }
    
    self.beam_ent utility::function_7c10ea82c1e305b8( "beam_tip", "start" );
    
    while ( true )
    {
        assert( isdefined( self.beam_ent ) );
        source_pos = self gettagorigin( "tag_aim" );
        desired_end_pos = mech aim_beam( desired_end_pos, source_pos, speed_mult );
        end_pos = desired_end_pos;
        beam_trace = trace::ray_trace( source_pos, desired_end_pos );
        hit_ent = beam_trace[ "entity" ];
        hit_something = beam_trace[ "fraction" ] < 1;
        
        if ( hit_something )
        {
            end_pos = beam_trace[ "position" ];
            
            if ( !hit_ent )
            {
                if ( gettime() >= var_c5b5bb741c705530 )
                {
                    function_24f6c6f448bbc089( end_pos );
                    var_c5b5bb741c705530 = gettime() + 200;
                }
            }
            else if ( hit_ent == self.beamtarget )
            {
                self.beamlockedon = 1;
            }
        }
        
        /#
            debug_beam( source_pos, end_pos, desired_end_pos );
        #/
        
        self.beam_ent.origin = end_pos;
        is_beam_tip_off = self.beam_ent getscriptablepartstate( "beam_tip" ) == "off";
        
        if ( is_beam_tip_off || hit_something != last_hit_something )
        {
            if ( hit_something )
            {
                self.beam_ent utility::function_7c10ea82c1e305b8( "beam_tip", "hit" );
            }
            else
            {
                self.beam_ent utility::function_7c10ea82c1e305b8( "beam_tip", "hit_nothing" );
            }
        }
        
        last_hit_something = hit_something;
        
        if ( isdefined( hit_ent ) )
        {
            beam_hit( hit_ent );
        }
        
        waitframe();
    }
}

// Namespace namespace_2bfee0fa87a9007a
// Params 0, eflags: 0x4
// Checksum 0xd9841512, Offset: 0x655
// Size: 0xf5
function private function_6db185f129dffac()
{
    headforward = get_head_forward();
    bestplayer = undefined;
    bestdot = 0.8;
    
    foreach ( player in level.players )
    {
        if ( sat_libra_mech_turret::is_valid_target( player ) )
        {
            if ( !function_b1187ccaea28decd( player ) )
            {
                direction = vectornormalize2( player.origin - self.origin );
                dot = vectordot2( headforward, direction, 0 );
                
                if ( dot > bestdot )
                {
                    bestplayer = player;
                }
            }
        }
    }
    
    return bestplayer;
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0xf17d9f2c, Offset: 0x753
// Size: 0x36, Type: bool
function private function_b1187ccaea28decd( target_ent )
{
    if ( target_ent.var_bdd74df2bc62c24 && target_ent.var_bdd74df2bc62c24 + 3000 > gettime() )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0xdb9275dd, Offset: 0x792
// Size: 0xe3, Type: bool
function private function_9da25f3da83b7c51( target_ent )
{
    if ( isdefined( target_ent ) && self.var_c2b07ad93e615476 )
    {
        headforward = get_head_forward();
        direction = vectornormalize2( target_ent.origin - self.origin );
        dot = vectordot2( headforward, direction, 0 );
        
        if ( dot >= 0.8 )
        {
            source_pos = self gettagorigin( "tag_aim" );
            end_pos = ( target_ent.origin[ 0 ], target_ent.origin[ 1 ], target_ent.origin[ 2 ] + 30 );
            beam_trace = trace::ray_trace( source_pos, end_pos );
            
            if ( beam_trace[ "fraction" ] >= 0.97 )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace namespace_2bfee0fa87a9007a
// Params 0, eflags: 0x4
// Checksum 0x632320c7, Offset: 0x87e
// Size: 0x2d
function private get_head_forward()
{
    worldyaw = combineangles( self.angles, ( 0, self.headyaw, 0 ) );
    return anglestoforward( worldyaw );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 0, eflags: 0x4
// Checksum 0x42159c94, Offset: 0x8b4
// Size: 0x107
function private find_beam_target()
{
    if ( sat_libra_mech_turret::is_valid_target( self.focustarget ) )
    {
        self.beamtarget = undefined;
        self.beamlockedon = undefined;
        return self.focustarget;
    }
    
    if ( self.beamtarget )
    {
        if ( sat_libra_mech_turret::is_valid_target( self.beamtarget ) && self.var_a4e5bde9b01f2aa4 >= gettime() )
        {
            if ( function_9da25f3da83b7c51( self.beamtarget ) )
            {
                self.var_29ad6ead5d3765a1 = gettime();
                return self.beamtarget;
            }
            else if ( self.var_29ad6ead5d3765a1 > gettime() - 2000 )
            {
                return self.beamtarget;
            }
        }
        
        self.beamtarget = undefined;
        self.beamlockedon = undefined;
    }
    
    new_target = function_6db185f129dffac();
    
    if ( function_9da25f3da83b7c51( new_target ) )
    {
        self.var_a4e5bde9b01f2aa4 = gettime() + 3000;
        self.beamtarget = new_target;
        self.beamlockedon = undefined;
        return new_target;
    }
}

// Namespace namespace_2bfee0fa87a9007a
// Params 3, eflags: 0x4
// Checksum 0xe8650c76, Offset: 0x9c4
// Size: 0x134
function private aim_beam( current_end_pos, source_pos, speed_mult )
{
    sourceorigin = self.origin;
    target_ent = find_beam_target();
    
    if ( target_ent )
    {
        target_ent.var_bdd74df2bc62c24 = gettime();
        distance = distance( target_ent.origin, source_pos );
        point = ( sourceorigin[ 0 ], sourceorigin[ 1 ], target_ent.origin[ 2 ] + 30 ) + get_head_forward() * distance;
    }
    else
    {
        point = ( sourceorigin[ 0 ], sourceorigin[ 1 ], self.origin[ 2 ] + 30 ) + get_head_forward() * 1000;
    }
    
    direction = vectornormalize( point - source_pos );
    desired = source_pos + direction * 3000;
    
    if ( current_end_pos[ 2 ] < desired[ 2 ] )
    {
        adjusted_height = min( current_end_pos[ 2 ] + 50 * speed_mult, desired[ 2 ] );
    }
    else
    {
        adjusted_height = max( current_end_pos[ 2 ] - 50 * speed_mult, desired[ 2 ] );
    }
    
    return ( desired[ 0 ], desired[ 1 ], adjusted_height );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0x8edaa8bd, Offset: 0xb01
// Size: 0x126
function private beam_hit( hit_ent )
{
    if ( !hit_ent utility::ent_flag( "mech_beam_hit" ) )
    {
        can_dissolve = isai( hit_ent ) && isdefined( hit_ent.subclass ) && issubstr( hit_ent.subclass, "zombie_base" );
        damage = calculate_beam_damage( hit_ent );
        hit_ent dodamage( damage, self.origin, self, self, "MOD_PROJECTILE" );
        
        if ( can_dissolve && damage > hit_ent.health )
        {
            hit_ent utility::ent_flag_set( "dissolve" );
        }
        
        if ( sat_libra_mech_turret::is_valid_target( hit_ent ) )
        {
            if ( !hit_ent utility::ent_flag( "mech_beam_shocked" ) )
            {
                hit_ent utility::ent_flag_set( "mech_beam_shocked" );
                hit_ent thread utility::ent_flag_clear_delayed( "mech_beam_shocked", 3 );
                thread shock_target( hit_ent );
            }
            
            level notify( #"mech_beam_hit_player" );
            hit_ent playsoundevent( %"sndevent_abom_beam_hit_player" );
        }
        
        hit_ent utility::ent_flag_set( "mech_beam_hit" );
        hit_ent thread utility::ent_flag_clear_delayed( "mech_beam_hit", 0.2 );
    }
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0x6d5c5dd5, Offset: 0xc2f
// Size: 0x1e
function private function_24f6c6f448bbc089( end_pos )
{
    radiusdamage( end_pos, 5, 12, 12, self, undefined, undefined, 1 );
}

// Namespace namespace_2bfee0fa87a9007a
// Params 0, eflags: 0x4
// Checksum 0x9dbdbc7, Offset: 0xc55
// Size: 0x5d
function private beam_attack_on_end()
{
    self endon( #"death" );
    self waittill( #"beam_attack_loop_finished" );
    
    if ( isdefined( self.beam_fx ) )
    {
        self.beam_fx delete();
    }
    
    if ( isdefined( self.beam_ent ) )
    {
        self.beam_ent utility::function_7c10ea82c1e305b8( "beam_tip", "end" );
    }
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0xe4a6eeda, Offset: 0xcba
// Size: 0x42
function private cleanup_beam_ents( params )
{
    if ( isdefined( self.beam_fx ) )
    {
        self.beam_fx delete();
    }
    
    if ( isdefined( self.beam_ent ) )
    {
        self.beam_ent delete();
    }
}

// Namespace namespace_2bfee0fa87a9007a
// Params 1, eflags: 0x4
// Checksum 0xe4a38de, Offset: 0xd04
// Size: 0x1f8
function private shock_target( target )
{
    if ( isnullweapon( target getcurrentweapon() ) )
    {
        return;
    }
    
    target endon( #"death" );
    target shellshock( "cer_electric_damage_sp", 2.5, 1, 1 );
    target forceplaygestureviewmodel( "vm_ges_shockstick_react" );
    playfxontagforclients( level._effect[ "shock_hit_player" ], target, "j_head", target );
    playfxontagforclients( level._effect[ "shock_hit_player_arms" ], target, "j_wrist_le", target );
    target.shocked = 1;
    target val::set( "beam_shocked_player", "weapon_switch", 0 );
    target val::set( "beam_shocked_player", "reload", 0 );
    target val::set( "beam_shocked_player", "fire", 0 );
    target val::set( "beam_shocked_player", "mount_side", 0 );
    target val::set( "beam_shocked_player", "mount_top", 0 );
    target val::set( "beam_shocked_player", "mantle", 0 );
    target val::set( "beam_shocked_player", "offhand_weapons", 0 );
    target val::set( "beam_shocked_player", "supers", 0 );
    target val::set( "beam_shocked_player", "melee", 0 );
    target val::set( "beam_shocked_player", "ads", 0 );
    target val::set( "beam_shocked_player", "slide", 0 );
    target val::set( "beam_shocked_player", "sprint", 0 );
    target val::set( "beam_shocked_player", "supersprint", 0 );
    wait 3;
    target.shocked = undefined;
    target val::reset_all( "beam_shocked_player" );
    target stopgestureviewmodel( "vm_ges_shockstick_react", 2 );
    stopfxontagforclients( level._effect[ "shock_hit_player" ], target, "j_head", target );
    stopfxontagforclients( level._effect[ "shock_hit_player_arms" ], target, "j_wrist_le", target );
}

/#

    // Namespace namespace_2bfee0fa87a9007a
    // Params 3, eflags: 0x4
    // Checksum 0x70b672ca, Offset: 0xf04
    // Size: 0xe1, Type: dev
    function private debug_beam( source_pos, end_pos, desired_end_pos )
    {
        if ( getdvarint( @"debug_mech_beam", 0 ) > 0 )
        {
            point = ( self.origin[ 0 ], self.origin[ 1 ], self.origin[ 2 ] + 30 ) + get_head_forward() * 1000;
            sphere( point, 30, ( 1, 0, 0 ), 0, 1 );
            sphere( desired_end_pos, 30, ( 0, 1, 0 ), 0, 1 );
            sphere( end_pos, 30, ( 0, 0, 1 ), 0, 1 );
            line( source_pos, point, ( 1, 0, 0 ), 1, 0 );
        }
    }

#/
