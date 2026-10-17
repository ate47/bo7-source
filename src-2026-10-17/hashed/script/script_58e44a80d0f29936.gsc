#using script_70d399b96f8edd30;
#using scripts\common\killstreaks\killstreak_shared;

#namespace namespace_6e9a5e61eb83d488;

// Namespace namespace_6e9a5e61eb83d488
// Params 0, eflags: 0x5
// Checksum 0x8b08362e, Offset: 0x76
// Size: 0x17
function private autoexec main()
{
    killstreak_shared::registerkillstreakinitfunction( #"gunship", &gunship::init );
}

