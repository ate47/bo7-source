#using script_4faabe437aa3b975;
#using script_5560f3066718e34c;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\damagefeedback;
#using scripts\mp\equipment;
#using scripts\mp\loot\common_item;
#using scripts\mp\weapons;

#namespace throwing_knife_mp;

// Namespace throwing_knife_mp
// Params 0
// Checksum 0x95a81ccd, Offset: 0xfd
// Size: 0x7e
function throwing_knife_mp_init()
{
    utility::registersharedfunc( #"throwing_knife", #"ongive", &throwing_knife_mp_ongive );
    utility::registersharedfunc( #"throwing_knife", #"onTake", &throwing_knife_mp_ontake );
    utility::registersharedfunc( #"throwing_knife", #"trytopickup", &throwing_knife_mp_trytopickup );
    weapons::registerusedcallback( "throwingknife", &throwing_knife::throwing_knife_used );
    weapons::registerusedcallback( "shuriken", &throwing_knife::throwing_knife_used );
}

// Namespace throwing_knife_mp
// Params 4
// Checksum 0x2ec03023, Offset: 0x183
// Size: 0xd1
function throwing_knife_mp_ongive( equipmentref, equipmentslot, variantid, attachments )
{
    if ( isdefined( self.perks[ "specialty_equip_throwingKnife" ] ) )
    {
        weapons::weapon_removeperk( "specialty_equip_throwingKnife" );
    }
    
    if ( !isdefined( variantid ) && isdefined( self.var_8cf9648fae56099c[ equipmentref ] ) )
    {
        variantid = self.var_8cf9648fae56099c[ equipmentref ];
    }
    
    if ( equipmentref == "equip_shuriken" )
    {
        return;
    }
    
    if ( level.gamemodebundle.var_4c338b11c7e238a1 == 0 )
    {
        return;
    }
    
    if ( variantid > 0 )
    {
        self.throwingknifemelee = weapon::giveweaponblueprint( "iw9_knifestab_mp", variantid );
    }
    else
    {
        self.throwingknifemelee = weapon_utility::function_d2c8356dc369d9ce( "iw9_knifestab_mp" );
    }
    
    weapons::weapon_giveperk( "specialty_equip_throwingKnife" );
}

// Namespace throwing_knife_mp
// Params 2
// Checksum 0xfa38cdad, Offset: 0x25c
// Size: 0x39
function throwing_knife_mp_ontake( equipmentref, equipmentslot )
{
    if ( weapons::weapon_hasperk( "specialty_equip_throwingKnife" ) )
    {
        weapons::weapon_removeperk( "specialty_equip_throwingKnife" );
    }
    
    self.throwingknifemelee = undefined;
}

// Namespace throwing_knife_mp
// Params 2
// Checksum 0x96f3b1c7, Offset: 0x29d
// Size: 0x105, Type: bool
function throwing_knife_mp_trytopickup( equipmentref, variantid )
{
    if ( !isdefined( equipmentref ) )
    {
        /#
            self iprintlnbold( "<dev string:x24>" );
        #/
        
        return false;
    }
    
    if ( equipment_mp::getcurrentequipment( "primary" ) != "equip_throwing_knife" && equipment_mp::getequipmentammo( equipment_mp::getcurrentequipment( "primary" ) ) > 0 )
    {
        return false;
    }
    
    if ( equipment_mp::hasequipment( equipmentref ) )
    {
        if ( equipment_mp::getequipmentammo( equipmentref ) >= equipment_mp::getequipmentmaxammo( equipmentref ) )
        {
            return false;
        }
        
        equipment_mp::incrementequipmentammo( equipmentref, 1, undefined, 1 );
        throwing_knife_mp_ongive( equipmentref, undefined, variantid );
    }
    else if ( common_item::items_isenabled() )
    {
        scriptable = common_item::function_70d4affb770e8103( equipmentref );
        assert( isdefined( scriptable ) );
        throwingknife = spawnstruct();
        throwingknife.type = scriptable;
        throwingknife.count = 1;
        common_item::function_96119bed8ab4c5d9( throwingknife );
    }
    else
    {
        return false;
    }
    
    damagefeedback::hudicontype( "throwingknife" );
    return true;
}

