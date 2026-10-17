#namespace scripted_weapons;

// Namespace scripted_weapons
// Params 0
// Checksum 0x28210d32, Offset: 0x76
// Size: 0xf6
function init()
{
    bundlename = level.gamemodebundle.scriptedweapon_list;
    
    if ( !isdefined( bundlename ) )
    {
        return;
    }
    
    bundle = getscriptbundle( bundlename );
    weaponlist = bundle.scriptedweapon_list;
    
    foreach ( weaponstruct in weaponlist )
    {
        if ( isdefined( weaponstruct.weaponref ) )
        {
            weaponstruct.objweapon = makeweapon( weaponstruct.weaponref );
        }
    }
    
    level.var_363840efc0e8a5a0 = weaponlist;
    level notify( #"scripted_weapons_init" );
}

// Namespace scripted_weapons
// Params 1
// Checksum 0xe77e16e4, Offset: 0x174
// Size: 0x39
function get_scripted_weapon_object( basenamehash )
{
    assert( isdefined( level.var_363840efc0e8a5a0 ), "<dev string:x24>" );
    return level.var_363840efc0e8a5a0[ basenamehash ].objweapon;
}

