#using script_15ce43f40ea0fd2b;
#using script_48cc39a686b43438;
#using script_5004300c8ee32b35;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\zm\systems\zm_vo;
#using scripts\mp\zm\zm_utility;

#namespace saw_blade_trap;

// Namespace saw_blade_trap
// Params 0
// Checksum 0x21d36e13, Offset: 0x2e4
// Size: 0x170
function init()
{
    level._effect[ "saw_blade_trap_kill_explo" ] = loadfxasset( "vfx_sat_levels_zm_saw_blade_trap_cyclone_blood_explo" );
    level utility::flag_wait( "scriptables_ready" );
    trap_core::function_63a557f0f22161af( "saw_blade_trap_switch", &activate_saw_blade_trap, &deactivate_saw_blade_trap );
    level utility::flag_wait( "saw_blade_trap_switch_trap_init_finished" );
    var_bb37cfa5b54c79c4 = getentarray( "saw_blade_clip_base", "script_noteworthy" );
    
    foreach ( clip in var_bb37cfa5b54c79c4 )
    {
        clip solid();
        clip disconnectpaths();
    }
    
    level.var_da53b5a26cef6ee4 = getentarray( "sb_trap_blade_clip", "script_noteworthy" );
    
    foreach ( clip in level.var_da53b5a26cef6ee4 )
    {
        clip solid();
    }
    
    level callback::add( "on_zombie_ai_killed", &on_zombie_killed );
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x5604117e, Offset: 0x45c
// Size: 0x9d
function activate_saw_blade_trap( activator )
{
    level thread function_99a2f2d6cfadc5af( activator );
    self.center_loc = utility::getstruct( self.target, "targetname" );
    add_attractor();
    thread radius_watcher( activator );
    
    if ( !isdefined( self.var_d4d8eb6f65469588 ) )
    {
        self.var_d4d8eb6f65469588 = function_47c86977a18df38b( level.var_da53b5a26cef6ee4, self.origin );
    }
    
    self.var_d4d8eb6f65469588 notsolid();
    self.trap_scriptable utility::function_7c10ea82c1e305b8( "fx", "on_ambient" );
    thread function_a697c2e608abf60e();
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x29566b9f, Offset: 0x501
// Size: 0x4f
function deactivate_saw_blade_trap( activator )
{
    self notify( #"saw_blade_shutdown" );
    thread remove_attractor();
    do_reset( self );
    self.var_d4d8eb6f65469588 solid();
    self.trap_scriptable utility::function_7c10ea82c1e305b8( "fx", "off" );
}

// Namespace saw_blade_trap
// Params 1, eflags: 0x4
// Checksum 0xd490bfd1, Offset: 0x558
// Size: 0x75, Type: bool
function private function_95ace6e6876c7791( trap )
{
    height_to_center = trap.center_loc.origin[ 2 ] - self.origin[ 2 ];
    
    if ( height_to_center >= 0 && height_to_center <= 36 )
    {
        return ( distance2dsquared( trap.center_loc.origin, self.origin ) <= 4096 );
    }
    
    return false;
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x6764f3f8, Offset: 0x5d6
// Size: 0x353
function radius_watcher( activator )
{
    level endon( #"game_ended" );
    self endon( #"saw_blade_shutdown" );
    
    while ( true )
    {
        a_zombies = getaiarray( zm_utility::get_zombie_team() );
        
        foreach ( zombie in a_zombies )
        {
            if ( zombie function_95ace6e6876c7791( self ) )
            {
                if ( zombie.var_a0638b4666757d60 != self )
                {
                    zombie.var_a0638b4666757d60 = self;
                    
                    if ( level.var_2e54bebec956dfed )
                    {
                        zombie.var_a13bed1ac47e1b2c = undefined;
                    }
                    else
                    {
                        zombie.var_a13bed1ac47e1b2c = 1;
                    }
                    
                    zombie thread do_dmg( self, activator );
                }
                
                continue;
            }
            
            zombie.var_a0638b4666757d60 = undefined;
            zombie.var_a13bed1ac47e1b2c = 0;
        }
        
        alliesteams = [];
        
        foreach ( player in level.players )
        {
            alliesteams = arraycombineunique( alliesteams, [ player.team ] );
            
            if ( player function_95ace6e6876c7791( self ) )
            {
                player utility::function_32b24db3127bff40( "saw_blade_trap_approximate", "on" );
                
                if ( !player function_8132a0acf1bf4dc0() )
                {
                    if ( player.var_a0638b4666757d60 != self )
                    {
                        player.var_a0638b4666757d60 = self;
                        player thread do_dmg( self, activator );
                        player playsoundtoplayer( "evt_trap_sawblade_cut_plr", player );
                    }
                }
                
                continue;
            }
            
            player.var_a0638b4666757d60 = undefined;
            player utility::function_32b24db3127bff40( "saw_blade_trap_approximate", "off" );
        }
        
        allies = getaiarray( alliesteams );
        
        foreach ( ally in allies )
        {
            if ( ally function_95ace6e6876c7791( self ) )
            {
                if ( ally.var_a0638b4666757d60 != self )
                {
                    ally.var_a0638b4666757d60 = self;
                    ally thread do_dmg( self, activator );
                }
                
                continue;
            }
            
            ally.var_a0638b4666757d60 = undefined;
        }
        
        /#
            if ( getdvarint( @"scr_debug_saw_blade_trap", 0 ) )
            {
                cylinder( self.center_loc.origin, self.center_loc.origin - ( 0, 0, 36 ), sqrt( 4096 ), ( 1, 0, 0 ), 1 );
            }
        #/
        
        waitframe();
    }
}

// Namespace saw_blade_trap
// Params 2
// Checksum 0x503a4e67, Offset: 0x931
// Size: 0x23b
function do_dmg( trap_struct, activator )
{
    level endon( #"game_ended" );
    trap_struct endon( #"saw_blade_shutdown" );
    self endon( #"death" );
    
    while ( true )
    {
        if ( !isalive( self ) )
        {
            return;
        }
        
        if ( !isdefined( self.var_a0638b4666757d60 ) )
        {
            return;
        }
        
        if ( isplayer( self ) )
        {
            utility::function_32b24db3127bff40( "saw_blade_trap_hit", "on" );
            self dodamage( self.maxhealth * 0.08, self.origin, trap_struct.attack_entity, trap_struct.attack_entity, undefined );
            v_knock_dir = ( self.origin[ 0 ], self.origin[ 1 ], 0 ) - ( trap_struct.origin[ 0 ], trap_struct.origin[ 1 ], 0 );
            self knockback( v_knock_dir, 800 );
        }
        else if ( isai( self ) )
        {
            if ( zombie_dismemberment::is_crawling() )
            {
                return;
            }
            
            is_base_zombie = isstartstr( self.subclass, "zombie_base" );
            
            if ( is_base_zombie )
            {
                function_2d86b75c5dc72867( trap_struct );
            }
            
            if ( is_base_zombie || self.aicategory == "normal" )
            {
                utility::ent_flag_set( "saw_blade_trap_kill" );
                
                if ( self.magic_bullet_shield )
                {
                    ai::stop_magic_bullet_shield();
                }
                
                self kill( undefined, undefined, trap_struct.attack_entity );
            }
            else
            {
                if ( issubstr( self.subclass, "hvt" ) || self.aicategory == "hvt" )
                {
                    damage_ratio = 0.05;
                }
                else if ( self.aicategory == "special" )
                {
                    damage_ratio = 0.09;
                }
                else if ( self.aicategory == "elite" )
                {
                    damage_ratio = 0.07;
                }
                
                if ( damage_ratio )
                {
                    self dodamage( self.maxhealth * damage_ratio, self.origin, activator, trap_struct.attack_entity, undefined );
                }
            }
        }
        
        callback::callback( "callback_on_saw_blade_trap_hit", { #trap:trap_struct } );
        wait 1;
    }
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x91bda64, Offset: 0xb74
// Size: 0xab
function function_2d86b75c5dc72867( trap )
{
    level endon( #"game_ended" );
    self endon( #"dealth" );
    v_offset = ( 0, 0, 50 );
    impact_vector = vectornormalize( self.origin + v_offset - trap.origin ) * 3500;
    self.ragdollimpactvector = impact_vector;
    self.ragdollhitloc = "torso_lower";
    self.do_immediate_ragdoll = 1;
    self playsoundonmovingent( "evt_trap_sawblade_cut_zmb" );
    waitframe();
    
    if ( zombie_dismemberment::is_dismemberment_allowed() )
    {
        zombie_dismemberment::dismember_limb( 1, 15 );
    }
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x9626f6ed, Offset: 0xc27
// Size: 0x131
function do_reset( trap_struct )
{
    a_zombies = getaiarray( zm_utility::get_zombie_team() );
    
    foreach ( zombie in a_zombies )
    {
        if ( zombie.var_a0638b4666757d60 == trap_struct )
        {
            zombie.var_a0638b4666757d60 = undefined;
        }
    }
    
    foreach ( player in level.players )
    {
        player.var_a0638b4666757d60 = undefined;
        player utility::function_32b24db3127bff40( "saw_blade_trap_approximate", "off" );
    }
}

// Namespace saw_blade_trap
// Params 0
// Checksum 0x13dc6099, Offset: 0xd60
// Size: 0x1d, Type: bool
function function_8132a0acf1bf4dc0()
{
    if ( self getstance() == "prone" || self issprintsliding() )
    {
        return true;
    }
    
    return false;
}

// Namespace saw_blade_trap
// Params 0
// Checksum 0x70385931, Offset: 0xd86
// Size: 0x15
function add_attractor()
{
    zombie_attractor_manager::add_attractor( self, 2, 240, 0, undefined, &function_cc6605aa869c9c71 );
}

// Namespace saw_blade_trap
// Params 0
// Checksum 0xec5805c8, Offset: 0xda3
// Size: 0xa
function remove_attractor()
{
    zombie_attractor_manager::remove_attractor( self );
}

// Namespace saw_blade_trap
// Params 2
// Checksum 0x98e875bd, Offset: 0xdb5
// Size: 0x75, Type: bool
function function_cc6605aa869c9c71( attractor, zombie )
{
    if ( zombie.mq_zombie )
    {
        return false;
    }
    
    if ( zombie.aicategory == "hvt" || zombie.aicategory == "elite" || zombie.aicategory == "special" )
    {
        return false;
    }
    
    zombie.disallow_grab = 1;
    return true;
}

// Namespace saw_blade_trap
// Params 0
// Checksum 0x32761761, Offset: 0xe33
// Size: 0x93
function function_a697c2e608abf60e()
{
    level endon( #"game_ended" );
    self endon( #"saw_blade_shutdown" );
    self.trap_scriptable.var_dcda067e9619e14b = 0;
    
    while ( true )
    {
        if ( self.trap_scriptable.var_dcda067e9619e14b >= 1 )
        {
            self.trap_scriptable utility::function_7c10ea82c1e305b8( "fx", "on_ambient_blood" );
            self notify( #"hash_a89700892bf5c892" );
            thread function_e54bc6bf258b288a();
            self.trap_scriptable.var_dcda067e9619e14b = 0;
        }
        
        waitframe();
    }
}

// Namespace saw_blade_trap
// Params 0
// Checksum 0xd3a5f2d0, Offset: 0xece
// Size: 0x43
function function_e54bc6bf258b288a()
{
    level endon( #"game_ended" );
    self endon( #"saw_blade_shutdown" );
    self endon( #"hash_a89700892bf5c892" );
    wait 3;
    self.trap_scriptable utility::function_7c10ea82c1e305b8( "fx", "on_ambient" );
}

// Namespace saw_blade_trap
// Params 1
// Checksum 0x246b4d22, Offset: 0xf19
// Size: 0x97
function on_zombie_killed( params )
{
    if ( isdefined( params.einflictor ) && params.einflictor.var_fcda7168a743663a == "saw_blade_trap_switch" )
    {
        playfxontag( level._effect[ "saw_blade_trap_kill_explo" ], self, "j_spine4" );
        
        if ( isdefined( params.einflictor.trap_scriptable.var_dcda067e9619e14b ) )
        {
            params.einflictor.trap_scriptable.var_dcda067e9619e14b++;
        }
    }
}

// Namespace saw_blade_trap
// Params 1, eflags: 0x4
// Checksum 0x110ed2f2, Offset: 0xfb8
// Size: 0x75
function private function_99a2f2d6cfadc5af( player )
{
    level endon( #"game_ended" );
    player endon( #"death_or_disconnect" );
    
    if ( player utility::ent_flag( "saw_trap_activated_first_time_vo" ) )
    {
        return;
    }
    
    player utility::ent_flag_set( "saw_trap_activated_first_time_vo" );
    b_played = player zm_vo::function_8c1a12974bd11f01( #"hash_51c2876fe7df2983" );
    
    if ( !b_played )
    {
        player utility::ent_flag_clear( "saw_trap_activated_first_time_vo" );
    }
}

