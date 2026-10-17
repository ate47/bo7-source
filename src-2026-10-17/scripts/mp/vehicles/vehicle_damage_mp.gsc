#using script_3c8ea7f78632414c;
#using scripts\common\utility;
#using scripts\common\vehicle_damage;
#using scripts\mp\events;
#using scripts\mp\rank;
#using scripts\mp\vehicles\damage;

#namespace vehicle_damage_mp;

// Namespace vehicle_damage_mp
// Params 0
// Checksum 0xfebe8d8b, Offset: 0x76
// Size: 0xb6
function vehicle_damage_mp_init()
{
    utility::registersharedfunc( #"vehicle_damage", #"setpremoddamagecallback", &damage::set_pre_mod_damage_callback );
    utility::registersharedfunc( #"vehicle_damage", #"setpostmoddamagecallback", &damage::set_post_mod_damage_callback );
    utility::registersharedfunc( #"vehicle_damage", #"setdeathcallback", &damage::set_death_callback );
    utility::registersharedfunc( #"vehicle_damage", #"givescore", &vehicle_damage_givescore );
    utility::registersharedfunc( #"vehicle_damage", #"giveaward", &vehicle_damage_giveaward );
    utility::registersharedfunc( #"vehicle_damage", #"vehicle_setuphitdamageoverrideforweapon", &vehicle_setuphitdamageoverrideforweapon );
}

// Namespace vehicle_damage_mp
// Params 3
// Checksum 0xf84fadf1, Offset: 0x134
// Size: 0x39
function vehicle_damage_givescore( ref, objweapon, var_f6852c1452a96a07 )
{
    if ( var_f6852c1452a96a07 )
    {
        rank::scoreeventpopup( ref );
        return;
    }
    
    points::doscoreevent( ref, objweapon );
}

// Namespace vehicle_damage_mp
// Params 3
// Checksum 0xdf18a278, Offset: 0x175
// Size: 0x37
function vehicle_damage_giveaward( ref, objweapon, var_f6852c1452a96a07 )
{
    thread events::killeventtextpopup( ref );
    
    if ( !var_f6852c1452a96a07 )
    {
        points::doscoreevent( ref, objweapon );
    }
}

// Namespace vehicle_damage_mp
// Params 4
// Checksum 0x5e81ca41, Offset: 0x1b4
// Size: 0x49
function vehicle_setuphitdamageoverrideforweapon( weaponname, weaponhitsperattack, weaponhitstokill, vehiclename )
{
    if ( isdefined( weaponhitsperattack ) )
    {
        vehicle_damage::set_weapon_hit_damage_data_for_vehicle( weaponname, weaponhitsperattack, vehiclename );
    }
    
    if ( isdefined( weaponhitstokill ) )
    {
        vehicle_damage::set_vehicle_hit_damage_data_for_weapon( vehiclename, weaponhitstokill, weaponname );
    }
}

