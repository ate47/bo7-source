#using scripts\common\utility;
#using scripts\mp\loot\common_item;

#namespace ob_covert_utility;

// Namespace ob_covert_utility
// Params 0
// Checksum 0xcdc77b9a, Offset: 0xb0
// Size: 0x2e
function function_ca660988c89ba0b1()
{
    if ( !level._effect[ "vfx_sat_ob_gameplay_chest_spawn" ] )
    {
        level._effect[ "vfx_sat_ob_gameplay_chest_spawn" ] = loadfxasset( "vfx_sat_ob_gameplay_chest_spawn" );
    }
}

// Namespace ob_covert_utility
// Params 3
// Checksum 0x4e526615, Offset: 0xe6
// Size: 0x79
function covert_spawn_reward( itemspawnlist, origin, angles )
{
    spawn_options = common_item::function_bc5ff2958b71a708( origin, angles );
    item_name = commonitem_selectfromlist( itemspawnlist, 1 );
    item = common_item::function_61c2c0251e742ffd( item_name[ 0 ], undefined, spawn_options );
    playfx( utility::getfx( "vfx_sat_ob_gameplay_chest_spawn" ), origin );
    playsoundatpos( origin, "evt_mimic_prop_hide" );
}

