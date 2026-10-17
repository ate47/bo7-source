#using script_762e73cd6088bff;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\weapons;

#namespace namespace_6f10280b43b03d84;

// Namespace namespace_6f10280b43b03d84
// Params 0, eflags: 0x5
// Checksum 0xd4f8241a, Offset: 0x19c
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_ba3c09f18edced11", undefined, &function_f606ef4b3f9d1a49, undefined );
}

// Namespace namespace_6f10280b43b03d84
// Params 0
// Checksum 0xefb81d81, Offset: 0x1bd
// Size: 0x82
function function_f606ef4b3f9d1a49()
{
    if ( !level.zombie_augments_in_use )
    {
        return;
    }
    
    level thread function_824c1553435bc546();
    callback::add( "zm_perk_obtained", &function_288f120db5b6defb );
    callback::add( "zm_perk_lost", &function_9e09844df6bf44c7 );
    callback::add( #"reload_start", &function_a1f7e7796a33d409 );
    callback::add( #"reload", &function_1e8c882f8a032a34 );
    utility::registersharedfunc( #"zombie", #"hash_fc6574ba8b7263fc", &function_aefd315770e1f56d );
}

// Namespace namespace_6f10280b43b03d84
// Params 0
// Checksum 0x1f7cf57d, Offset: 0x247
// Size: 0x3
function function_824c1553435bc546()
{
    waitframe();
}

// Namespace namespace_6f10280b43b03d84
// Params 1
// Checksum 0x95ff1d79, Offset: 0x252
// Size: 0x10a
function function_288f120db5b6defb( params )
{
    if ( isdefined( params ) && params.specialtyperk == "specialty_speedcola" )
    {
        if ( function_b99aa77884bbe01e( #"speedcola_faster_field_upgrade" ) && utility::issharedfuncdefined( #"zombie", #"hash_fb5407d9c2bf5a3c" ) )
        {
            utility::callsharedfunc( #"zombie", #"hash_fb5407d9c2bf5a3c", #"speedcola_faster_field_upgrade", 1 );
        }
        
        if ( function_b99aa77884bbe01e( #"hash_6efb497e5fa473b4" ) )
        {
            perk::giveperk( "specialty_fastermelee" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_faster_equipment" ) )
        {
            perk::giveperk( "specialty_fastoffhand" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_faster_switch" ) )
        {
            perk::giveperk( "specialty_quickswap" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_classic_formula" ) )
        {
            perk::giveperk( "specialty_zombies_fastreload_augment" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_phantom_reload" ) )
        {
            thread function_7c65e01d1a67aca0();
        }
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 1
// Checksum 0xd19c1b2c, Offset: 0x364
// Size: 0x15e
function function_9e09844df6bf44c7( params )
{
    if ( isdefined( params ) && params.specialtyperk == "specialty_speedcola" )
    {
        if ( function_b99aa77884bbe01e( #"speedcola_faster_field_upgrade" ) && utility::issharedfuncdefined( #"zombie", #"hash_fb5407d9c2bf5a3c" ) )
        {
            utility::callsharedfunc( #"zombie", #"hash_fb5407d9c2bf5a3c", #"speedcola_faster_field_upgrade", 0 );
        }
        
        if ( function_b99aa77884bbe01e( #"hash_6efb497e5fa473b4" ) && isdefined( self.perks[ "specialty_fastermelee" ] ) )
        {
            perk::removeperk( "specialty_fastermelee" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_faster_equipment" ) && isdefined( self.perks[ "specialty_fastoffhand" ] ) )
        {
            perk::removeperk( "specialty_fastoffhand" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_faster_switch" ) && isdefined( self.perks[ "specialty_quickswap" ] ) )
        {
            perk::removeperk( "specialty_quickswap" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_classic_formula" ) && isdefined( self.perks[ "specialty_zombies_fastreload_augment" ] ) )
        {
            perk::removeperk( "specialty_zombies_fastreload_augment" );
        }
        
        if ( function_b99aa77884bbe01e( #"speedcola_phantom_reload" ) )
        {
            self notify( #"hash_b2cead66f5db30bc" );
        }
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 0
// Checksum 0x27340b30, Offset: 0x4ca
// Size: 0x81
function function_7c65e01d1a67aca0()
{
    self endon( #"death_or_disconnect" );
    self endon( #"hash_b2cead66f5db30bc" );
    reloadtime = level.zombie_augments[ #"speedcola_phantom_reload" ].var_6dd8f1ed5ab593d9 ?? 5;
    reloadpercent = level.zombie_augments[ #"speedcola_phantom_reload" ].var_d67ec85b1b003bd1 ?? 0.25;
    childthread function_b9fc48cc6db17de6( reloadtime, reloadpercent );
}

// Namespace namespace_6f10280b43b03d84
// Params 3
// Checksum 0xf126e1e0, Offset: 0x553
// Size: 0x81
function function_b9fc48cc6db17de6( reloadtime, reloadpercent, var_f264159b81f1629a )
{
    reloadtime *= 1000;
    lasttimefired = gettime();
    
    while ( true )
    {
        if ( self attackbuttonpressed() )
        {
            lasttimefired = gettime();
        }
        
        if ( self isdualwielding() && self adsbuttonpressed() )
        {
            lasttimefired = gettime();
        }
        
        if ( gettime() - lasttimefired > reloadtime )
        {
            lasttimefired = gettime();
            function_c5426f3a36bbfd25( reloadpercent, var_f264159b81f1629a );
        }
        
        waitframe();
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 2
// Checksum 0x2230f8ce, Offset: 0x5dc
// Size: 0x11b
function function_c5426f3a36bbfd25( reloadpercent, var_f264159b81f1629a )
{
    weapons = self getweaponslist( "primary" );
    
    foreach ( weapon in weapons )
    {
        function_da858510ecd707de( weapon, reloadpercent );
        
        if ( var_f264159b81f1629a && weapon.hasalternate )
        {
            alt_weapon = weapon getaltweapon();
            
            if ( isdefined( alt_weapon ) && alt_weapon != weapon )
            {
                var_c0a84c871f4165a7 = isdefined( weapon.underbarrel ) && getattachmentbasetype( weapon, weapon.underbarrel ) == "selectfire";
                
                if ( !var_c0a84c871f4165a7 )
                {
                    function_da858510ecd707de( alt_weapon, reloadpercent );
                }
            }
        }
    }
    
    callback::callback( "phantom_augment_reload_completed" );
}

// Namespace namespace_6f10280b43b03d84
// Params 2, eflags: 0x4
// Checksum 0x6a76ba9d, Offset: 0x6ff
// Size: 0x2e2
function private function_da858510ecd707de( weapon, reloadpercent )
{
    var_f40d3888c3a0cd44 = weaponmaxammo( weapon );
    n_clip_max = weaponclipsize( weapon );
    n_clip_current = self getweaponammoclip( weapon );
    var_7a98ae64be9c0943 = self getweaponammostock( weapon );
    n_clip_current_max = n_clip_max - n_clip_current;
    n_clip_current_left = 0;
    var_2a587142370a296d = 0;
    var_f6aaaf9cb98b9f27 = isweaponcliponly( weapon );
    var_5a0f63045da23715 = issubstr( weapon.magazine, "beltfed" );
    var_4b84689143748612 = weapon.reloaddisabled;
    
    if ( var_5a0f63045da23715 || var_f6aaaf9cb98b9f27 || var_4b84689143748612 )
    {
        return;
    }
    
    if ( weapon.isdualwield )
    {
        n_clip_current_left = self getweaponammoclip( weapon, "left" );
        var_9cc2ddc87f2b8ff8 = n_clip_max - n_clip_current_left;
    }
    
    if ( !weapon.ismelee && !weapon::iskillstreakweapon( weapon ) && !weapon::iswonderweapon( weapon ) && var_f40d3888c3a0cd44 > 0 && n_clip_max > 0 && var_7a98ae64be9c0943 > 0 && ( n_clip_current_max > 0 || var_9cc2ddc87f2b8ff8 > 0 ) )
    {
        if ( n_clip_current_max > 0 )
        {
            var_2a587142370a296d = int( n_clip_max * reloadpercent );
            var_2a587142370a296d = int( max( 1, var_2a587142370a296d ) );
            var_2a587142370a296d = int( clamp( var_2a587142370a296d, 0, var_7a98ae64be9c0943 ) );
            var_2a587142370a296d = int( clamp( var_2a587142370a296d, 0, n_clip_current_max ) );
        }
        
        if ( var_2a587142370a296d > 0 && var_7a98ae64be9c0943 >= var_2a587142370a296d && n_clip_current_max > 0 )
        {
            n_clip_current += var_2a587142370a296d;
            n_clip_current = int( clamp( n_clip_current, 0, n_clip_max ) );
            
            if ( weapon.isdualwield )
            {
                self setweaponammoclip( weapon, n_clip_current, "right" );
            }
            else
            {
                self setweaponammoclip( weapon, n_clip_current );
            }
            
            var_7a98ae64be9c0943 -= var_2a587142370a296d;
            var_7a98ae64be9c0943 = int( clamp( var_7a98ae64be9c0943, 0, var_f40d3888c3a0cd44 ) );
            self setweaponammostock( weapon, var_7a98ae64be9c0943 );
            
            if ( self.currentweapon == weapon )
            {
                self playlocalsound( #"hash_46be05cdfd26f72f" );
            }
        }
        
        if ( weapon.isdualwield && var_9cc2ddc87f2b8ff8 > 0 )
        {
            var_7a98ae64be9c0943 = self getweaponammostock( weapon );
            var_2a587142370a296d = 0;
            var_2a587142370a296d = int( n_clip_max * reloadpercent );
            var_2a587142370a296d = int( max( 1, var_2a587142370a296d ) );
            var_2a587142370a296d = int( clamp( var_2a587142370a296d, 0, var_7a98ae64be9c0943 ) );
            var_2a587142370a296d = int( clamp( var_2a587142370a296d, 0, n_clip_max - n_clip_current_left ) );
            
            if ( var_2a587142370a296d > 0 && var_7a98ae64be9c0943 >= var_2a587142370a296d )
            {
                n_clip_current_left += var_2a587142370a296d;
                n_clip_current_left = int( clamp( n_clip_current_left, 0, n_clip_max ) );
                self setweaponammoclip( weapon, n_clip_current_left, "left" );
                var_7a98ae64be9c0943 -= var_2a587142370a296d;
                var_7a98ae64be9c0943 = int( clamp( var_7a98ae64be9c0943, 0, var_f40d3888c3a0cd44 ) );
                self setweaponammostock( weapon, var_7a98ae64be9c0943 );
                
                if ( self.currentweapon == weapon )
                {
                    self playlocalsound( #"hash_46be05cdfd26f72f" );
                }
            }
        }
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 1
// Checksum 0x19ca0c90, Offset: 0x9e9
// Size: 0x26
function function_b99aa77884bbe01e( augmentname )
{
    return utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", augmentname );
}

// Namespace namespace_6f10280b43b03d84
// Params 0
// Checksum 0xb3ac7128, Offset: 0xa18
// Size: 0x5b, Type: bool
function function_aefd315770e1f56d()
{
    if ( utility::callsharedfunc( #"zombie_perks", #"has_zombie_perk", "specialty_speedcola" ) )
    {
        if ( function_b99aa77884bbe01e( #"speedcola_faster_magicbox" ) )
        {
            return ( level.zombie_augments[ #"speedcola_faster_magicbox" ].var_bde7a60ea80c1509 ?? 2.5 );
        }
    }
    
    return false;
}

// Namespace namespace_6f10280b43b03d84
// Params 1, eflags: 0x4
// Checksum 0x4e58b212, Offset: 0xa7c
// Size: 0x10a
function private function_1e8c882f8a032a34( sparams )
{
    if ( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_speedcola", #"speedcola_stock_reload" ) )
    {
        percent_chance = level.zombie_augments[ #"speedcola_stock_reload" ].var_fba3fc255cbdb457 ?? 0.05;
        percent_chance *= 100;
        var_430536335bcd8f37 = self.currentweapon.reloadtype;
        
        if ( utility::percent_chance( percent_chance ) )
        {
            if ( self.var_8fa219f0881979bb > 0 )
            {
                current_weapon = self getcurrentweapon();
                current_stock = self getweaponammostock( current_weapon );
                var_48a8f7224c85ab09 = ( var_430536335bcd8f37 == 1 ? self.var_c81bca6e0b28262b : self.var_8fa219f0881979bb ) + current_stock;
                self setweaponammostock( current_weapon, var_48a8f7224c85ab09 );
                self.var_8fa219f0881979bb = undefined;
                self.var_c81bca6e0b28262b = undefined;
            }
        }
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 1, eflags: 0x4
// Checksum 0xd792991d, Offset: 0xb8e
// Size: 0x1a5
function private function_a1f7e7796a33d409( sparams )
{
    current_weapon = self getcurrentweapon();
    current_clip = self getweaponammoclip( current_weapon );
    current_stock = self getweaponammostock( current_weapon );
    max_clip_ammo = weaponclipsize( current_weapon );
    
    if ( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_speedcola", #"speedcola_sprint_reload" ) )
    {
        cooldown = level.zombie_augments[ #"speedcola_sprint_reload" ].var_ee136d1d2c744233 ?? 2;
        cooldown *= 1000;
        
        if ( !isdefined( self.var_43d7d76f7f46b696 ) )
        {
            self.var_43d7d76f7f46b696 = gettime();
        }
        else if ( gettime() - self.var_43d7d76f7f46b696 < cooldown )
        {
            return;
        }
        
        threshold_clip = int( max_clip_ammo * ( level.zombie_augments[ #"speedcola_sprint_reload" ].var_ee136d1d2c744233 ?? 0.5 ) );
        var_96a5c0bba5d8043a = 0;
        b_zero = 0;
        
        if ( current_clip > threshold_clip )
        {
            var_96a5c0bba5d8043a = 1;
        }
        
        if ( current_clip == 0 )
        {
            b_zero = 1;
        }
        
        self.var_43d7d76f7f46b696 = gettime();
        thread function_441fa81aae1a1bc2( b_zero, var_96a5c0bba5d8043a );
    }
    
    if ( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_speedcola", #"speedcola_stock_reload" ) )
    {
        var_eef48e40c12aee37 = max_clip_ammo - current_clip;
        self.var_8fa219f0881979bb = var_eef48e40c12aee37;
        self.var_c81bca6e0b28262b = 1;
    }
}

// Namespace namespace_6f10280b43b03d84
// Params 2, eflags: 0xc
// Checksum 0xd3c20ed4, Offset: 0xd3b
// Size: 0x14a
function private function_441fa81aae1a1bc2( bzero, var_23dea841cc76aae4 )
{
    self notify( #"hash_47e1257e02667f7b" );
    self endon( #"hash_47e1257e02667f7b" );
    self endon( #"disconnect" );
    duration = level.zombie_augments[ #"speedcola_sprint_reload" ].var_1a8162620afb7b00 ?? 2;
    
    if ( var_23dea841cc76aae4 )
    {
        speed_boost = level.zombie_augments[ #"speedcola_sprint_reload" ].var_b8227b1c11658ada ?? 0.05;
        weapons::addextramovespeed( "speed_cola_reload_speed_boost", speed_boost );
    }
    else if ( bzero )
    {
        speed_boost = level.zombie_augments[ #"speedcola_sprint_reload" ].var_c8f8991bb51ebcad ?? 0.1;
        weapons::addextramovespeed( "speed_cola_reload_speed_boost", speed_boost );
    }
    else
    {
        speed_boost = level.zombie_augments[ #"speedcola_sprint_reload" ].var_c10e3756fe064f5e ?? 0.075;
        weapons::addextramovespeed( "speed_cola_reload_speed_boost", speed_boost );
    }
    
    weapons::updatemovespeedscale();
    self playlocalsound( #"hash_75136e8ed4ddce9c" );
    wait duration;
    weapons::removeextramovespeed( "speed_cola_reload_speed_boost" );
    weapons::updatemovespeedscale();
}

