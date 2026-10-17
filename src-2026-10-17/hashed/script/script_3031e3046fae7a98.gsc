#using script_6a1b268260f5489a;
#using scripts\common\utility;
#using scripts\mp\damagefeedback;
#using scripts\mp\equipment;

#namespace armor_box_mp;

// Namespace armor_box_mp
// Params 0, eflags: 0x1
// Checksum 0x7a392ad9, Offset: 0xae
// Size: 0x1c
function autoexec main()
{
    utility::registersharedfunc( "armor_drop", #"init", &init );
}

// Namespace armor_box_mp
// Params 0
// Checksum 0xb8c9f2d8, Offset: 0xd2
// Size: 0x10
function init()
{
    level.onarmorboxusedbyplayer = &onarmorboxusedbyplayer;
}

// Namespace armor_box_mp
// Params 1
// Checksum 0x52dc3ef9, Offset: 0xea
// Size: 0xa0, Type: bool
function onarmorboxusedbyplayer( player )
{
    armoramount = getdvarint( @"hash_796878180a8e250", 4 );
    
    if ( isdefined( player.equipment ) && !isdefined( player.equipment[ "health" ] ) )
    {
        player.equipment[ "health" ] = level.armorref ?? "equip_armorplate";
    }
    
    player equipment_mp::incrementequipmentslotammo( "health", armoramount );
    player damagefeedback::hudicontype( "br_armor" );
    support_box::supportbox_playusesound( player );
    thread support_box::supportbox_onplayeruseanim();
    return true;
}

