#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\values;
#using scripts\common\weapon;

#namespace zm_bgb_free_fire;

// Namespace zm_bgb_free_fire
// Params 0, eflags: 0x5
// Checksum 0x32431902, Offset: 0x128
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "free_fire", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_free_fire
// Params 0
// Checksum 0xf84bad97, Offset: 0x14d
// Size: 0x24
function __init__()
{
    bgb::register( "free_fire", "time", 60, &enable, &disable, &validation );
}

// Namespace zm_bgb_free_fire
// Params 0
// Checksum 0x54faf994, Offset: 0x179
// Size: 0x23
function enable()
{
    thread special_weapon_watcher();
    w_current = self getcurrentweapon();
    function_9b6bb01a25c57684( w_current );
}

// Namespace zm_bgb_free_fire
// Params 0
// Checksum 0xfb7dc516, Offset: 0x1a4
// Size: 0x31
function disable()
{
    self endon( #"disconnect" );
    self notify( #"disable_free_fire" );
    wait 0.1;
    val::reset( "bgb_free_fire", "allow_free_fire" );
}

// Namespace zm_bgb_free_fire
// Params 0
// Checksum 0xa44db60f, Offset: 0x1dd
// Size: 0x2e, Type: bool
function validation()
{
    w_current = self getcurrentweapon();
    
    if ( weapon::iswonderweapon( w_current ) || is_banned_weapon( w_current ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_bgb_free_fire
// Params 1
// Checksum 0x7930e016, Offset: 0x214
// Size: 0x86
function function_9b6bb01a25c57684( weapon )
{
    n_ammo_stock = self getweaponammostock( weapon );
    n_ammo_clip = self getweaponammoclip( weapon );
    n_ammo_total = n_ammo_stock + n_ammo_clip;
    
    if ( n_ammo_total == 0 )
    {
        self setweaponammoclip( weapon, 1 );
    }
    
    if ( weapon::isakimbo( weapon ) )
    {
        var_c0a43209a9ef296d = self getweaponammoclip( weapon, "left" );
        
        if ( var_c0a43209a9ef296d == 0 )
        {
            self setweaponammoclip( weapon, 1, "left" );
        }
    }
}

// Namespace zm_bgb_free_fire
// Params 0
// Checksum 0x675497ea, Offset: 0x2a2
// Size: 0xce
function special_weapon_watcher()
{
    self endon( #"disconnect" );
    self endon( #"disable_free_fire" );
    w_current = self getcurrentweapon();
    
    if ( !weapon::iswonderweapon( w_current ) && !weapon::iskillstreakweapon( w_current ) && !is_banned_weapon( w_current ) )
    {
        val::set( "bgb_free_fire", "allow_free_fire", 1 );
    }
    
    while ( true )
    {
        self waittill( #"weapon_change", new_weapon );
        
        if ( weapon::iswonderweapon( new_weapon ) || weapon::iskillstreakweapon( new_weapon ) || is_banned_weapon( new_weapon ) )
        {
            val::set( "bgb_free_fire", "allow_free_fire", 0 );
            continue;
        }
        
        val::set( "bgb_free_fire", "allow_free_fire", 1 );
    }
}

// Namespace zm_bgb_free_fire
// Params 1
// Checksum 0x16192dc1, Offset: 0x378
// Size: 0xaa, Type: bool
function is_banned_weapon( weapon )
{
    if ( weapon.isalternate )
    {
        if ( weapon.underbarrel )
        {
            switch ( weapon.underbarrel )
            {
                case #"hash_6cd108dcf4f84781":
                case #"hash_fd5160cf9d58fcf2":
                    return true;
            }
        }
        
        var_6d03eea324f864e4 = getattachmentbasetype( weapon, weapon.underbarrel );
        
        if ( var_6d03eea324f864e4 === "ub_gl" )
        {
            return true;
        }
    }
    
    switch ( weapon.basename )
    {
        case #"hash_ac5b079adcf1af6d":
            return true;
    }
    
    return false;
}

