#using script_31ee2a173f3499b7;
#using scripts\common\system;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_sound;

#namespace namespace_59a2646cd5fcc366;

// Namespace namespace_59a2646cd5fcc366
// Params 0, eflags: 0x5
// Checksum 0xa3d1500c, Offset: 0xa4
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_e5a6d1a01d44cc4b", #"ztron_item", undefined, &init );
}

// Namespace namespace_59a2646cd5fcc366
// Params 0
// Checksum 0xb4b973fb, Offset: 0xcd
// Size: 0x31
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"armor_vest", #"use", &use );
    ztron_sound::function_4ac735395b173fe( "armor_vestL1_OS", "evt_ztron_armorvest_get" );
}

// Namespace namespace_59a2646cd5fcc366
// Params 1
// Checksum 0xfa56aa47, Offset: 0x106
// Size: 0x9d
function use( params )
{
    if ( level.ztron.hardcoremode )
    {
        return;
    }
    
    player = params.player;
    player.ztron.armorvest = 1;
    player.ztron.var_6fe8ea86c8758aec = player.ztron.armorvest;
    player ztron_ui::function_38a72e402dc87ace();
    ztron_sound::ztron_playsound( "armor_vestL1_OS", player.origin );
}

