#using scripts\common\damage_effects;
#using scripts\common\utility;
#using scripts\mp\armor;
#using scripts\mp\operator;
#using scripts\mp\playerhealth;

#namespace namespace_6a2c362dcd1562bc;

// Namespace namespace_6a2c362dcd1562bc
// Params 0
// Checksum 0x705b8c78, Offset: 0x76
// Size: 0x89
function init()
{
    damage_effects::init( &damage_effects::function_772d325bd6c693c, &damage_effects::function_bf2875d2fd55a5a );
    utility::registersharedfunc( #"damage_effects", #"isfemale", &operator::isfemale );
    utility::registersharedfunc( #"damage_effects", #"hasarmor", &armor::hasarmor );
    utility::registersharedfunc( #"damage_effects", #"hash_5be2154f8714fc82", &playerhealth::function_77704251ecdece64 );
    utility::registersharedfunc( #"damage_effects", #"hash_f93ac0b4812ca397", &visionsetnakedforplayer );
}

// Namespace namespace_6a2c362dcd1562bc
// Params 0
// Checksum 0x7d709787, Offset: 0x107
// Size: 0x9
function initdamageeffects()
{
    damage_effects::initdamageeffects();
}

