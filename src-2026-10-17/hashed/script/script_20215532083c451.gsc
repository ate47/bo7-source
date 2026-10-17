#using script_31ee2a173f3499b7;
#using scripts\common\system;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_sound;

#namespace namespace_1ce62f5a9ae191bc;

// Namespace namespace_1ce62f5a9ae191bc
// Params 0, eflags: 0x5
// Checksum 0xc277771b, Offset: 0xa4
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_7f42ac11bbe7719b", #"ztron_item", undefined, &init );
}

// Namespace namespace_1ce62f5a9ae191bc
// Params 0
// Checksum 0x3cf5605a, Offset: 0xcd
// Size: 0x31
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"armor_vest2", #"use", &use );
    ztron_sound::function_4ac735395b173fe( "armor_vestL2_OS", "evt_ztron_armorvest_get" );
}

// Namespace namespace_1ce62f5a9ae191bc
// Params 0
// Checksum 0xe6f0f42e, Offset: 0x106
// Size: 0x5d
function function_2929e770a5529f55()
{
    profilestart();
    self.ztron.armorvest = 2;
    self.ztron.var_6fe8ea86c8758aec = self.ztron.armorvest;
    ztron_ui::function_38a72e402dc87ace();
    ztron_sound::ztron_playsound( "armor_vestL2_OS", self.origin );
    profilestop();
}

// Namespace namespace_1ce62f5a9ae191bc
// Params 1
// Checksum 0x9436a820, Offset: 0x16b
// Size: 0x43
function use( params )
{
    if ( level.ztron.hardcoremode )
    {
        return;
    }
    
    player = params.player;
    player function_2929e770a5529f55();
}

