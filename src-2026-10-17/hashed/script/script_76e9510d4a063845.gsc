#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_bgb_explosive_flourish;

// Namespace zm_bgb_explosive_flourish
// Params 0, eflags: 0x5
// Checksum 0xa451db33, Offset: 0x144
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "explosive_flourish", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0x6e596fe2, Offset: 0x169
// Size: 0x24
function __init__()
{
    bgb::register( "explosive_flourish", "time", 120, &enable, &disable, &validation );
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0x69f49496, Offset: 0x195
// Size: 0x9
function enable()
{
    thread function_2ea3b3a013f619f();
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0x8c175d05, Offset: 0x1a6
// Size: 0x18
function disable()
{
    self notify( #"kill_bgb_explosive_flourish" );
    self.bgb_explosive_flourish_cooldown = undefined;
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0x56c31cf9, Offset: 0x1c6
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0xaaf772a6, Offset: 0x1d3
// Size: 0x2d9
function function_2ea3b3a013f619f()
{
    self endon( #"disconnect", #"kill_bgb_explosive_flourish" );
    self.wait_on_reload = [];
    self.var_31b3a0eb94ce4613 = 0;
    
    while ( true )
    {
        self waittill( #"reload_start" );
        current_weapon = self getcurrentweapon();
        
        if ( arraycontains( self.wait_on_reload, current_weapon ) )
        {
            continue;
        }
        
        if ( current_weapon.isabilityweapon )
        {
            continue;
        }
        
        self.wait_on_reload[ self.wait_on_reload.size ] = current_weapon;
        self.var_31b3a0eb94ce4613++;
        n_clip_current = self getweaponammoclip( current_weapon );
        n_clip_max = weaponclipsize( current_weapon );
        
        if ( n_clip_max <= 0 )
        {
            continue;
        }
        
        n_fraction = 1 - n_clip_current / n_clip_max;
        perk_radius = 256;
        perk_dmg = mapfloat( 0, 1, 100, 575, n_fraction );
        thread check_for_reload_complete( current_weapon );
        
        if ( isdefined( self ) )
        {
            switch ( self.var_31b3a0eb94ce4613 )
            {
                case 0:
                case 1:
                    n_zombie_limit = undefined;
                    break;
                case 2:
                    n_zombie_limit = 8;
                    break;
                case 3:
                    n_zombie_limit = 4;
                    break;
                case 4:
                    n_zombie_limit = 2;
                    break;
                default:
                    n_zombie_limit = 0;
                    break;
            }
            
            thread function_c83f846de6de6b18( current_weapon );
            
            if ( n_zombie_limit === 0 )
            {
                continue;
            }
            
            thread function_4bc41d070eeefd21( n_fraction );
            self notify( #"hash_30bb8120b6489d6a" );
            a_zombies = getplayersandaiarrayinradius( self.origin, perk_radius );
            n_zombies_hit = 0;
            
            for ( i = 0; i < a_zombies.size ; i++ )
            {
                if ( self.team == a_zombies[ i ].team )
                {
                    continue;
                }
                
                if ( isalive( self ) && isalive( a_zombies[ i ] ) )
                {
                    if ( isdefined( n_zombie_limit ) )
                    {
                        if ( n_zombies_hit < n_zombie_limit )
                        {
                            n_zombies_hit++;
                        }
                        else
                        {
                            break;
                        }
                    }
                    
                    if ( isplayer( a_zombies[ i ] ) )
                    {
                    }
                    else if ( a_zombies[ i ].health <= perk_dmg )
                    {
                        a_zombies[ i ] thread explosive_flourish_death_fx();
                        
                        if ( !isdefined( self.bgb_explosive_flourish_kills ) )
                        {
                            self.bgb_explosive_flourish_kills = 0;
                        }
                        
                        self.bgb_explosive_flourish_kills++;
                    }
                    else if ( !isdefined( a_zombies[ i ].is_brutus ) )
                    {
                    }
                    
                    wait 0.1;
                    
                    if ( isalive( a_zombies[ i ] ) )
                    {
                        a_zombies[ i ] dodamage( perk_dmg, self.origin, self, self, "MOD_EXPLOSIVE", "<explicitweaponnone>" );
                    }
                }
            }
            
            self notify( #"explosive_flourish_end" );
        }
    }
}

// Namespace zm_bgb_explosive_flourish
// Params 1
// Checksum 0x1b7c7f90, Offset: 0x4b4
// Size: 0x9b
function check_for_reload_complete( weapon )
{
    self endon( #"disconnect", #"kill_bgb_explosive_flourish", "player_lost_weapon_" + weapon.basename );
    thread weapon_replaced_monitor( weapon );
    
    while ( true )
    {
        utility::waittill_any( "reload", "zmb_max_ammo_level" );
        current_weapon = self getcurrentweapon();
        
        if ( current_weapon == weapon )
        {
            self.wait_on_reload = arrayremove( self.wait_on_reload, weapon );
            self notify( "weapon_reload_complete_" + weapon.basename );
            break;
        }
    }
}

// Namespace zm_bgb_explosive_flourish
// Params 1
// Checksum 0x361ddea2, Offset: 0x557
// Size: 0x92
function weapon_replaced_monitor( weapon )
{
    self endon( #"disconnect", #"kill_bgb_explosive_flourish", "weapon_reload_complete_" + weapon.basename );
    
    while ( true )
    {
        self waittill( #"weapon_change" );
        primaryweapons = self getweaponslistprimaries();
        
        if ( !arraycontains( primaryweapons, weapon ) )
        {
            self notify( "player_lost_weapon_" + weapon.basename );
            self.wait_on_reload = arrayremove( self.wait_on_reload, weapon );
            break;
        }
    }
}

// Namespace zm_bgb_explosive_flourish
// Params 1
// Checksum 0x8052aaa, Offset: 0x5f1
// Size: 0x81
function function_c83f846de6de6b18( current_weapon )
{
    self endon( #"disconnect", #"kill_bgb_explosive_flourish" );
    
    if ( self.var_31b3a0eb94ce4613 > 4 && !isdefined( self.bgb_explosive_flourish_cooldown ) )
    {
        self.bgb_explosive_flourish_cooldown = 1;
        n_reload_time = 0.25;
        n_cooldown_time = n_reload_time + 3;
        wait n_cooldown_time;
        self.var_31b3a0eb94ce4613 = 0;
        self.bgb_explosive_flourish_cooldown = undefined;
    }
}

// Namespace zm_bgb_explosive_flourish
// Params 1
// Checksum 0xaf9202e3, Offset: 0x67a
// Size: 0x71
function function_4bc41d070eeefd21( n_fraction )
{
    self endon( #"disconnect", #"kill_bgb_explosive_flourish" );
    self setscriptablepartstate( "bgb_explosive_flourish", "bgb_fx_on", 0 );
    
    if ( n_fraction >= 0.67 )
    {
    }
    else if ( n_fraction >= 0.33 && n_fraction < 0.67 )
    {
    }
    
    wait 2;
    self setscriptablepartstate( "bgb_explosive_flourish", "bgb_fx_off", 0 );
}

// Namespace zm_bgb_explosive_flourish
// Params 0
// Checksum 0xe8dad265, Offset: 0x6f3
// Size: 0x1e
function explosive_flourish_death_fx()
{
    self endon( #"death" );
    
    if ( !self.head_gibbed )
    {
    }
}

