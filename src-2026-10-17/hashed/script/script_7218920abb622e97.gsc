#using script_1ade2fa7cae9593d;
#using script_1bd0e23811fecd83;
#using script_501d719ea707242;
#using script_6c7e7ed734c643d8;
#using script_c6a99c521eb6b99;
#using scripts\common\callbacks;
#using scripts\common\omnvar_utility;
#using scripts\common\utility;

#namespace zm_item;

// Namespace zm_item
// Params 0
// Checksum 0xf70a1eba, Offset: 0x111
// Size: 0x56
function init_items()
{
    level.init_item_ammo_override = &zm_item_ammo::init_item_ammo;
    level.var_820a394c85bc5b35 = &zm_item_currency::init_item_currency;
    level.var_22064d9de4434e37 = &zm_item_armor::init_item_armor;
    level.init_item_perk_override = &zm_item_perk::init_item_perk;
    callback::add( "lootcache_looted", &function_17ec67ddca962aaf );
    level.var_5c489f2dd81149e9 = 1;
}

// Namespace zm_item
// Params 1
// Checksum 0x42027363, Offset: 0x16f
// Size: 0x1b5
function function_17ec67ddca962aaf( params )
{
    omnvarsused = 0;
    i = 0;
    
    while ( i < params.items.size )
    {
        item = params.items[ i ];
        typename = loot::function_52cf8374c44a4ff5( item.lootid );
        
        if ( typename == "weapon" && isdefined( item.weapondata ) )
        {
            if ( omnvarsused >= 4 )
            {
                assertmsg( "<dev string:x24>" + 4 + "<dev string:x2a>" );
                break;
            }
            
            params.player omnvar_utility::setcachedclientomnvar( "ui_zm_loot_container_index_" + omnvarsused, i );
            params.player omnvar_utility::setcachedclientomnvar( "ui_zm_loot_container_rarity_" + omnvarsused, item.weapondata.rarity ?? 0 );
            params.player omnvar_utility::setcachedclientomnvar( "ui_zm_loot_container_pap_" + omnvarsused, item.weapondata.paplv ?? 0 );
            params.player omnvar_utility::setcachedclientomnvar( "ui_zm_loot_container_ammomod_" + omnvarsused, utility::callsharedfunc( #"ammo_mod", #"get_id_from_ammo_mod_name", item.weapondata.ammomod ) ?? 0 );
            omnvarsused += 1;
        }
        
        i += 1;
    }
    
    i = omnvarsused;
    
    while ( i < 4 )
    {
        params.player omnvar_utility::setcachedclientomnvar( "ui_zm_loot_container_index_" + i, -1 );
        i += 1;
    }
}

