#using script_209f40b97ba0bbe7;
#using scripts\common\system;
#using scripts\mp\ammo_cache;

#namespace zm_weap_jetgun;

// Namespace zm_weap_jetgun
// Params 0, eflags: 0x5
// Checksum 0x67bada43, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"zm_weap_jetgun", undefined, &init, undefined );
}

// Namespace zm_weap_jetgun
// Params 0
// Checksum 0x33fedc05, Offset: 0x97
// Size: 0x1a
function init()
{
    weap_jetgun::init();
    level ammo_cache::function_a3aebb9fda9f2bef( level.jetgun_weapon_basename );
}

