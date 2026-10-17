#using script_35ea2ad71d73089b;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\weapon;
#using scripts\mp\pack_a_punch;

#namespace zm_bgb_fully_packed;

// Namespace zm_bgb_fully_packed
// Params 0, eflags: 0x5
// Checksum 0x62917e3c, Offset: 0xa3
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "fully_packed", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_fully_packed
// Params 0
// Checksum 0xfb1d137f, Offset: 0xc8
// Size: 0x21
function __init__()
{
    bgb::register( "fully_packed", "activated", 1, undefined, undefined, &validation, &activation );
}

// Namespace zm_bgb_fully_packed
// Params 0
// Checksum 0x632862c5, Offset: 0xf1
// Size: 0x3c
function activation()
{
    weapon = self getcurrentweapon();
    pap_lvl = pack_a_punch::get_pap_level( weapon );
    pack_a_punch::pap_weapon( weapon, pap_lvl, undefined, undefined, undefined, undefined, undefined, 3 );
    wait 0.1;
}

// Namespace zm_bgb_fully_packed
// Params 0
// Checksum 0xdbe65af2, Offset: 0x135
// Size: 0x87, Type: bool
function validation()
{
    weapon = self getcurrentweapon();
    pap_lvl = pack_a_punch::get_pap_level( weapon );
    
    if ( !self isswitchingweapon() && !weapon::isfistweapon( weapon ) && !weapon::iskillstreakweapon( weapon ) && !killstreakdeploy::function_9670f0716ada309b( weapon.basename ) && !bgb::is_active( "hidden_power" ) && pack_a_punch::can_pap( weapon ) && pap_lvl < 3 )
    {
        return true;
    }
    
    return false;
}

