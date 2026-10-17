#using script_31ee2a173f3499b7;
#using scripts\common\system;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_sound;

#namespace namespace_cd9161dece516ac8;

// Namespace namespace_cd9161dece516ac8
// Params 0, eflags: 0x5
// Checksum 0x3ab8bd6c, Offset: 0xac
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_ca1e03860f7d49fb", #"ztron_item", undefined, &init );
}

// Namespace namespace_cd9161dece516ac8
// Params 0
// Checksum 0x92dd3408, Offset: 0xd5
// Size: 0x6d
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"armor_plate", #"use", &use );
    ztron_item::function_5844a9c240f7dc8d( #"armor_plate", #"canautouse", &canautouse );
    ztron_item::function_5844a9c240f7dc8d( #"armor_plate", #"canspawn", &canitemspawn );
    ztron_sound::function_4ac735395b173fe( "armopr_plate_pickup_OS", "evt_ztron_armorplate_get" );
}

// Namespace namespace_cd9161dece516ac8
// Params 1
// Checksum 0x83b9e807, Offset: 0x14a
// Size: 0xcb, Type: bool
function canitemspawn( params )
{
    foreach ( player in level.players )
    {
        if ( player.ztron.armorvest == 0 )
        {
            continue;
        }
        
        if ( player.ztron.var_6fe8ea86c8758aec < player.ztron.armorvest )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_cd9161dece516ac8
// Params 1
// Checksum 0xb38ae2b4, Offset: 0x21e
// Size: 0x89, Type: bool
function canautouse( params )
{
    if ( level.ztron.hardcoremode )
    {
        return false;
    }
    
    player = params.player;
    
    if ( player.ztron.armorvest == 0 )
    {
        return false;
    }
    
    if ( player.ztron.var_6fe8ea86c8758aec == player.ztron.armorvest )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_cd9161dece516ac8
// Params 1
// Checksum 0x82be283d, Offset: 0x2b0
// Size: 0xc2
function use( params )
{
    if ( level.ztron.hardcoremode )
    {
        return;
    }
    
    player = params.player;
    assert( player.ztron.armorvest > 0, "<dev string:x24>" );
    
    if ( player.ztron.var_6fe8ea86c8758aec < player.ztron.armorvest )
    {
        player.ztron.var_6fe8ea86c8758aec++;
        ztron_sound::ztron_playsound( "armopr_plate_pickup_OS", player.origin );
        player ztron_ui::function_38a72e402dc87ace();
    }
}

