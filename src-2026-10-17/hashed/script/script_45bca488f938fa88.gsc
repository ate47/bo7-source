#using script_16ea1b94f0f381b3;
#using scripts\common\system;
#using scripts\common\utility;

#namespace zm_combat_bow;

// Namespace zm_combat_bow
// Params 0, eflags: 0x5
// Checksum 0xb034647e, Offset: 0xbf
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"zm_combat_bow", undefined, &__init__, undefined );
}

// Namespace zm_combat_bow
// Params 0
// Checksum 0x1dcc3920, Offset: 0xe0
// Size: 0xa
function __init__()
{
    level thread init_zm_combat_bow();
}

// Namespace zm_combat_bow
// Params 0
// Checksum 0xd328edf, Offset: 0xf2
// Size: 0x50
function init_zm_combat_bow()
{
    utility::flag_wait( "combat_bow_initialized" );
    weaponname = utility::get_scripted_weapon_name( #"combat_bow" );
    
    if ( !isdefined( weaponname ) )
    {
        return;
    }
    
    namespace_9d8e359c3b1041e5::registerkillstreakdamagedealingweaponsharedfunc( "combat_bow", weaponname, #"low" );
    level thread register_on_kill_medal();
}

// Namespace zm_combat_bow
// Params 0, eflags: 0x4
// Checksum 0xc20ac0f, Offset: 0x14a
// Size: 0x6c
function private register_on_kill_medal()
{
    level utility::flag_wait( "StartGameTypeCallbackFinished" );
    
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        weaponname = utility::get_scripted_weapon_name( #"combat_bow" );
        
        if ( isdefined( weaponname ) )
        {
            utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", weaponname, &on_killed_medal );
        }
    }
}

// Namespace zm_combat_bow
// Params 4, eflags: 0x4
// Checksum 0x3f5a9ecc, Offset: 0x1be
// Size: 0xef
function private on_killed_medal( victim, einflictor, smeansofdeath, sweapon )
{
    if ( utility::issharedfuncdefined( #"medal", #"track_rapid_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_rapid_kill", "combat_bow", sweapon );
    }
    
    if ( isdefined( self.rapidkill_data ) )
    {
        if ( isdefined( self.rapidkill_data[ "combat_bow" ] ) && self.rapidkill_data[ "combat_bow" ].rapidkill_count === 15 )
        {
            namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_bowhunter" );
        }
    }
    
    if ( utility::issharedfuncdefined( #"medal", #"track_scorestreak_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_scorestreak_kill", "combat_bow", victim );
    }
}

