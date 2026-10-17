#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;

#namespace namespace_824dcfdbdee5961d;

// Namespace namespace_824dcfdbdee5961d
// Params 0, eflags: 0x1
// Checksum 0xf1a85d9b, Offset: 0xde
// Size: 0x2e
function autoexec function_8fffbce6f5ea1eb3()
{
    level callback::add( #"player_weapon_change", &function_d0dbfb389fc9af1 );
    level callback::add( #"player_weapon_fire", &function_89191184375fa263 );
}

// Namespace namespace_824dcfdbdee5961d
// Params 1
// Checksum 0x1c0690cc, Offset: 0x114
// Size: 0xff
function function_d0dbfb389fc9af1( params )
{
    if ( !isdefined( self.primaryweapons ) )
    {
        return;
    }
    
    var_b84fe19ffda02063 = undefined;
    
    foreach ( weapon in self.primaryweapons )
    {
        if ( weapon hasattachmenthash( %"sat_mag_refill_sm_puma" ) )
        {
            var_b84fe19ffda02063 = 1;
            break;
        }
    }
    
    if ( !self.magrefill && var_b84fe19ffda02063 )
    {
        thread function_aefb11cc68e5ed2c();
        return;
    }
    
    if ( self.magrefill && !var_b84fe19ffda02063 )
    {
        self notify( #"hash_eba38d38831a5262" );
        self.magrefill = undefined;
        self.var_ac66d5db0d0aa2d = undefined;
    }
}

// Namespace namespace_824dcfdbdee5961d
// Params 0
// Checksum 0x6b57668b, Offset: 0x21b
// Size: 0x201
function function_aefb11cc68e5ed2c()
{
    self endon( #"disconnect" );
    self endon( #"hash_eba38d38831a5262" );
    self.magrefill = 1;
    
    for ( ;; )
    {
        foreach ( weapon in self.primaryweapons )
        {
            if ( !isdefined( weapon ) || !weapon hasattachmenthash( %"sat_mag_refill_sm_puma" ) )
            {
                continue;
            }
            
            n_clip_max = weaponclipsize( weapon );
            n_clip_current = self getweaponammoclip( weapon );
            paplevel = namespace_9d8e359c3b1041e5::function_1d4087075103b248( weapon );
            var_462226cf2c41f1fb = paplevel > 0 ? 1 : 1;
            rate_interval = paplevel > 0 ? 0.05 : 0.1;
            
            if ( n_clip_current >= n_clip_max || self attackbuttonpressed() && weapon == self.currentweapon )
            {
                continue;
            }
            
            if ( isdefined( self.var_ac66d5db0d0aa2d ) && gettime() - self.var_ac66d5db0d0aa2d < 1000 )
            {
                continue;
            }
            
            n_space = n_clip_max - n_clip_current;
            n_grant = min( var_462226cf2c41f1fb, n_space );
            new_n_clip_current = n_clip_current + n_grant;
            self setweaponammoclip( weapon, new_n_clip_current );
            
            if ( n_space > 1 && self.currentweapon == weapon )
            {
                self playsoundtoplayer( "fly_plr_sm_puma_printer_print", self );
                self playsound( "fly_npc_sm_puma_printer_print", self, self );
                continue;
            }
            
            if ( self.currentweapon == weapon )
            {
                self playsoundtoplayer( #"fly_plr_sm_puma_printer_print_last", self );
                self playsound( "fly_npc_sm_puma_printer_print_last", self, self );
            }
        }
        
        wait rate_interval;
    }
}

// Namespace namespace_824dcfdbdee5961d
// Params 1
// Checksum 0x67a2b5aa, Offset: 0x424
// Size: 0x49
function function_89191184375fa263( params )
{
    weapon = params.objweapon;
    
    if ( isdefined( weapon ) && weapon hasattachmenthash( %"sat_mag_refill_sm_puma" ) )
    {
        self.var_ac66d5db0d0aa2d = gettime();
    }
}

