#using script_22bf2244ec619ed7;
#using script_3bedf5e032fdac85;
#using scripts\mp\loot\common_item;

#namespace br_sidequest_access_card;

// Namespace br_sidequest_access_card
// Params 1
// Checksum 0xfc5e103f, Offset: 0x98
// Size: 0x75
function initquest( cardname )
{
    quest = { #on_infil:&on_infil, #on_prematch_end:&on_prematch_end, #on_start:&on_start, #on_precache:&on_precache, #on_init:&on_init, #name:cardname };
    br_map_quest::register( quest );
    return quest;
}

// Namespace br_sidequest_access_card
// Params 2
// Checksum 0x967a737, Offset: 0x116
// Size: 0x2b
function hasaccesscard( player, cardname )
{
    return player br_quest_inventory::has_quest_item( "wz_consumable_" + "access_card_" + cardname );
}

// Namespace br_sidequest_access_card
// Params 1
// Checksum 0x9869763b, Offset: 0x14a
// Size: 0x22
function getquest( cardname )
{
    quest = br_map_quest::get_quest( cardname );
    return quest;
}

// Namespace br_sidequest_access_card
// Params 2
// Checksum 0xf56f1d56, Offset: 0x175
// Size: 0x50
function createquestinstance( quest, accesscard )
{
    instance = { #item:accesscard, #quest:quest, #var_c65a01919bba66be:0 };
    quest.quest_instance = instance;
}

// Namespace br_sidequest_access_card
// Params 3
// Checksum 0x88e00f97, Offset: 0x1cd
// Size: 0x4b
function function_f94b1c2d2723f7a5( cardname, origin, angles )
{
    itembundle = common_item::function_cf68ad18114498b2( cardname );
    accesscard = common_item::function_a87dc047f584d2c7( itembundle, origin, angles, undefined, 1 );
    return accesscard;
}

// Namespace br_sidequest_access_card
// Params 0
// Checksum 0xd47586c2, Offset: 0x221
// Size: 0x3b
function on_init()
{
    br_quest_inventory::register_quest_item_funcs( "wz_consumable_" + "access_card_" + self.name, { #dropped:&function_aa9deb162358cbfc, #used:&function_b5d19e741b3a40f3 } );
}

// Namespace br_sidequest_access_card
// Params 0
// Checksum 0xbaf68103, Offset: 0x264
// Size: 0x2
function on_precache()
{
    
}

// Namespace br_sidequest_access_card
// Params 0
// Checksum 0x6b80f882, Offset: 0x26e
// Size: 0x2
function on_start()
{
    
}

// Namespace br_sidequest_access_card
// Params 0
// Checksum 0x87cb24b3, Offset: 0x278
// Size: 0x2
function on_prematch_end()
{
    
}

// Namespace br_sidequest_access_card
// Params 0
// Checksum 0xc1618513, Offset: 0x282
// Size: 0x2
function on_infil()
{
    
}

// Namespace br_sidequest_access_card
// Params 1
// Checksum 0x9a0370d0, Offset: 0x28c
// Size: 0x87
function function_b5d19e741b3a40f3( params )
{
    bundle = params.bundle;
    player = params.player;
    scriptable = params.scriptable;
    questinstance = scriptable.quest_instance;
    
    if ( !isdefined( questinstance ) )
    {
        return;
    }
    
    questinstance.var_c65a01919bba66be = 1;
    questinstance.var_cee1a3dda42c645e = player;
    return 0;
}

// Namespace br_sidequest_access_card
// Params 1
// Checksum 0x3eaf8eaf, Offset: 0x31c
// Size: 0x75
function function_aa9deb162358cbfc( params )
{
    scriptable = params.scriptable;
    questinstance = scriptable.quest_instance;
    quest = questinstance.quest;
    
    if ( questinstance.var_cee1a3dda42c645e == self )
    {
        params.scriptable.quest_instance = questinstance;
    }
}

