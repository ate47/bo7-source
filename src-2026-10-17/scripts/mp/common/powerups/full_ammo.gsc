#using script_16ea1b94f0f381b3;
#using script_734dce84c468439b;
#using scripts\common\powerups;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\weapon;
#using scripts\mp\equipment;

#namespace full_ammo;

// Namespace full_ammo
// Params 0, eflags: 0x1
// Checksum 0xa42a28d6, Offset: 0xd1
// Size: 0x1b
function autoexec main()
{
    if ( getdvarint( @"scr_disable_powerup_full_ammo", 0 ) )
    {
        return;
    }
    
    init_full_ammo();
}

// Namespace full_ammo
// Params 0
// Checksum 0x5f596c12, Offset: 0xf4
// Size: 0x1d
function init_full_ammo()
{
    powerups::register_powerup( "full_ammo", &grab_full_ammo, &function_221d39e8091d9b86, &modify_drop_chance );
}

// Namespace full_ammo
// Params 2
// Checksum 0x10d00eff, Offset: 0x119
// Size: 0xc3
function grab_full_ammo( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    
    foreach ( player in a_players )
    {
        if ( !player val::get( "allow_full_ammo_powerup" ) )
        {
            continue;
        }
        
        player give_ammo();
        player thread namespace_9d8e359c3b1041e5::showpoweruphudsharedfunc( str_powerup );
    }
    
    level notify( #"zmb_max_ammo_level" );
}

// Namespace full_ammo
// Params 0
// Checksum 0x4a4e7e50, Offset: 0x1e4
// Size: 0x55
function function_221d39e8091d9b86()
{
    if ( utility::issharedfuncdefined( #"powerup_full_ammo", #"should_drop" ) )
    {
        return utility::callsharedfunc( #"powerup_full_ammo", #"should_drop" );
    }
    
    root = powerups::get_powerups_root();
    return root.var_e976cc211ff8126 == 0;
}

// Namespace full_ammo
// Params 2
// Checksum 0xdc961742, Offset: 0x242
// Size: 0x4e
function modify_drop_chance( chance, context )
{
    if ( utility::issharedfuncdefined( #"powerup_full_ammo", #"modify_drop_chance" ) )
    {
        return utility::callsharedfunc( #"powerup_full_ammo", #"modify_drop_chance", chance, context );
    }
    
    return chance;
}

// Namespace full_ammo
// Params 0
// Checksum 0x161cf6b7, Offset: 0x299
// Size: 0x247
function give_ammo()
{
    if ( utility::issharedfuncdefined( #"powerup_full_ammo", #"give_ammo" ) )
    {
        utility::callsharedfunc( #"powerup_full_ammo", #"give_ammo" );
        return;
    }
    
    weapons = self getweaponslistprimaries();
    var_482e9999b75ed3d8 = istrue( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_z_mod", #"z_mod_pack_mule" ) );
    
    foreach ( weapon in weapons )
    {
        if ( !weapon::iskillstreakweapon( weapon ) )
        {
            max_ammo = utility::get_max_stock_ammo( weapon, var_482e9999b75ed3d8 );
            self setweaponammostock( weapon, max_ammo );
            self cancelreload();
            n_clip_current = self getweaponammoclip( weapon );
            n_clip_max = weaponclipsize( weapon );
            
            if ( n_clip_current < n_clip_max )
            {
                self setweaponammoclip( weapon, weaponclipsize( weapon ) );
            }
            
            if ( weapon::isakimbo( weapon ) )
            {
                if ( !isdefined( lefthandquantity ) )
                {
                    lefthandquantity = weaponclipsize( weapon );
                }
                
                self setweaponammoclip( weapon, lefthandquantity, "left" );
            }
            
            if ( weapon.hasalternate && !weapon::isaxeweapon( weapon ) )
            {
                weaponaltobj = weapon getaltweapon();
                max_ammo = utility::get_max_stock_ammo( weaponaltobj, var_482e9999b75ed3d8 );
                self setweaponammostock( weaponaltobj, max_ammo );
                n_clip_current = self getweaponammoclip( weaponaltobj );
                n_clip_max = weaponclipsize( weaponaltobj );
                
                if ( n_clip_current < n_clip_max )
                {
                    self setweaponammoclip( weaponaltobj, weaponclipsize( weaponaltobj ) );
                }
            }
        }
    }
    
    primary_equip_ref = equipment_mp::getcurrentequipment( "primary" );
    var_382c92ced2f61c35 = equipment_mp::getequipmentmaxammo( primary_equip_ref );
    equipment_mp::setequipmentammo( primary_equip_ref, var_382c92ced2f61c35, var_382c92ced2f61c35 );
    secondary_equip_ref = equipment_mp::getcurrentequipment( "secondary" );
    var_f9720a7bbc3dc8a5 = equipment_mp::getequipmentmaxammo( secondary_equip_ref );
    equipment_mp::setequipmentammo( secondary_equip_ref, var_f9720a7bbc3dc8a5, var_f9720a7bbc3dc8a5 );
    self notify( #"zmb_max_ammo" );
}

