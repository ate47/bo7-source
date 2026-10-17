#using script_4bc38131d8ecd20b;
#using scripts\common\callbacks;
#using scripts\common\status_effects\effect_stun;
#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\zm\traps\traps;

#namespace electric_trap;

// Namespace electric_trap
// Params 0
// Checksum 0x722b6874, Offset: 0x1be
// Size: 0x5a
function init_electric_trap()
{
    level._effect[ "trap_electric_player" ] = loadfxasset( "vfx_jup_ob_gameplay_zm_screen_elec_shock_bot" );
    traps::function_84ce1d5572ecd46a( "electric_switch", undefined, undefined, undefined, undefined );
    level thread traps::function_63a557f0f22161af( "electric_switch", &activate_trap, &deactivate_trap );
    level.electric_trap_throttle = throttle::throttle_initialize( "electric_trap", 2, 1 );
}

// Namespace electric_trap
// Params 1
// Checksum 0xa3f3ef0, Offset: 0x220
// Size: 0x250
function activate_trap( activator )
{
    level endon( #"game_ended" );
    self endon( #"deactivate_trap" );
    self.damage_volume = getent( self.target, #targetname );
    var_12579d90f8031d5 = utility::getstructarray( self.target, "targetname" );
    
    while ( true )
    {
        current_time = gettime();
        nearby_zombies = getaiarrayinradius( self.damage_volume.origin, 500, level.zombie_team );
        
        foreach ( zombie in nearby_zombies )
        {
            if ( !isalive( zombie ) )
            {
                continue;
            }
            
            if ( zombie istouching( self.damage_volume ) )
            {
                if ( !isdefined( zombie.var_f85d385156d7fbac ) )
                {
                    zombie function_a3343db3df219663( current_time, activator );
                    continue;
                }
                
                if ( current_time > zombie.var_f85d385156d7fbac )
                {
                    zombie function_a3343db3df219663( current_time, activator );
                }
            }
        }
        
        foreach ( player in level.players )
        {
            if ( !isdefined( player.var_f85d385156d7fbac ) )
            {
                player.var_f85d385156d7fbac = 0;
            }
            
            if ( current_time > player.var_f85d385156d7fbac && isalive( player ) && player istouching( self.damage_volume ) )
            {
                player dodamage( 20, player.origin, undefined, player );
                player.var_f85d385156d7fbac = current_time + 1000;
                player thread function_6a059e76eb0d6cce();
            }
        }
        
        waitframe();
    }
}

// Namespace electric_trap
// Params 1
// Checksum 0xe8b4b036, Offset: 0x478
// Size: 0x24
function deactivate_trap( activator )
{
    level endon( #"game_ended" );
    self notify( #"deactivate_trap" );
}

// Namespace electric_trap
// Params 2
// Checksum 0x4e3c851f, Offset: 0x4a4
// Size: 0xbf
function function_a3343db3df219663( current_time, attacker )
{
    if ( self.aicategory == "normal" || self.aicategory == "special" )
    {
        if ( !utility::ent_flag( "electric_trap_stunned" ) )
        {
            params = spawnstruct();
            params.attacker = attacker;
            callback::callback( "shocked", params );
            utility::ent_flag_set( "electric_trap_stunned" );
            effect_stun::stun( "electric_trap", 1000, params.attacker, undefined, undefined, "electrical" );
            self.var_f85d385156d7fbac = current_time + utility::function_4b74c15943231980( 2 );
            thread function_207384b81fa7f7f5( attacker );
        }
    }
}

// Namespace electric_trap
// Params 1
// Checksum 0x8b536c03, Offset: 0x56b
// Size: 0x130
function function_207384b81fa7f7f5( attacker )
{
    self endon( #"death" );
    
    while ( zombie_stun::is_stunned() && gettime() <= self.var_f85d385156d7fbac )
    {
        self setscriptablepartstate( "shocked_electric", "shocked_electric_on" );
        
        if ( isalive( self ) )
        {
            thedamage = int( self.maxhealth * 0.4 );
            
            if ( self.health - thedamage < 1 )
            {
                self.health = 1;
            }
            else
            {
                self dodamage( thedamage, self.origin, attacker, attacker, "MOD_UNKNOWN", undefined, "none", undefined, 65536 );
            }
        }
        
        throttle::throttle_wait_in_queue( level.electric_trap_throttle, self );
        time = gettime();
    }
    
    params = spawnstruct();
    params.attacker = attacker;
    callback::callback( "shocked_end", params );
    utility::ent_flag_clear( "electric_trap_stunned" );
    self setscriptablepartstate( "shocked_electric", "shocked_electric_off" );
    
    if ( isalive( self ) )
    {
        self kill( self.origin, attacker );
    }
}

// Namespace electric_trap
// Params 0
// Checksum 0x71cd100a, Offset: 0x6a3
// Size: 0xb4
function function_6a059e76eb0d6cce()
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    self notify( #"hash_6063f49d5d888d5d" );
    self endon( #"hash_6063f49d5d888d5d" );
    
    if ( !self.var_b4d756413b7103ef )
    {
        playfxontagforclients( level._effect[ "trap_electric_player" ], self, "j_head", self );
        self.var_b4d756413b7103ef = 1;
    }
    
    val::set( "electric_trap", "move_speed_scale", 0.5 );
    wait 2;
    val::reset( "electric_trap", "move_speed_scale" );
    stopfxontagforclients( level._effect[ "trap_electric_player" ], self, "j_head", self );
    self.var_b4d756413b7103ef = undefined;
}

