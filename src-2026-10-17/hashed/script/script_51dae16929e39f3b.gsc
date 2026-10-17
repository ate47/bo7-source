#using script_35ea2ad71d73089b;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\weapon;
#using scripts\mp\loot\common_item_weapon;

#namespace zm_bgb_hidden_power;

// Namespace zm_bgb_hidden_power
// Params 0, eflags: 0x5
// Checksum 0xe7142333, Offset: 0xa3
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "hidden_power", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_hidden_power
// Params 0
// Checksum 0xbe0efa20, Offset: 0xc8
// Size: 0x21
function __init__()
{
    bgb::register( "hidden_power", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_hidden_power
// Params 0
// Checksum 0xfa420dec, Offset: 0xf1
// Size: 0x7c, Type: bool
function validation()
{
    weapon = self getcurrentweapon();
    
    if ( !self isswitchingweapon() && !weapon::isfistweapon( weapon ) && !weapon::iswonderweapon( weapon ) && !weapon::iskillstreakweapon( weapon ) && !killstreakdeploy::function_9670f0716ada309b( weapon.basename ) && !bgb::is_active( "fully_packed" ) && item_weapon::function_fb81bd2fe070faa6( weapon ) < 4 )
    {
        return true;
    }
    
    return false;
}

// Namespace zm_bgb_hidden_power
// Params 0
// Checksum 0x5fce0b5d, Offset: 0x176
// Size: 0x24
function activation()
{
    weapon = self getcurrentweapon();
    item_weapon::function_40e1cbd0e1f47d1a( weapon, 4 );
    wait 0.1;
}

