#using script_16ea1b94f0f381b3;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_fb8e1cb9cfec339d;

// Namespace namespace_fb8e1cb9cfec339d
// Params 0, eflags: 0x5
// Checksum 0x10bbb96, Offset: 0xe7
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_c7512eec174792f6", undefined, &__init__, undefined );
}

// Namespace namespace_fb8e1cb9cfec339d
// Params 0
// Checksum 0x90552a17, Offset: 0x108
// Size: 0xa
function __init__()
{
    level thread function_5bfdf30f0e3893fe();
}

// Namespace namespace_fb8e1cb9cfec339d
// Params 0
// Checksum 0x47b40340, Offset: 0x11a
// Size: 0x30
function function_5bfdf30f0e3893fe()
{
    utility::flag_wait( "remote_turret_initialized" );
    namespace_9d8e359c3b1041e5::registerkillstreakdamagedealingweaponsharedfunc( "remote_turret", "sat_remote_turret_zm", #"low" );
    level thread register_on_kill_medal();
}

// Namespace namespace_fb8e1cb9cfec339d
// Params 0, eflags: 0x4
// Checksum 0x3aa9deba, Offset: 0x152
// Size: 0x70
function private register_on_kill_medal()
{
    level utility::flag_wait( "StartGameTypeCallbackFinished" );
    
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        weaponname = utility::function_d0cb6b33aff40a94( "remote_turret" ) ?? "sat_remote_turret_zm";
        
        if ( isdefined( weaponname ) )
        {
            utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", weaponname, &function_8a4be28d3ada0c69 );
        }
    }
}

// Namespace namespace_fb8e1cb9cfec339d
// Params 4, eflags: 0x4
// Checksum 0xb5a1587b, Offset: 0x1ca
// Size: 0xef
function private function_8a4be28d3ada0c69( victim, einflictor, smeansofdeath, sweapon )
{
    if ( utility::issharedfuncdefined( #"medal", #"track_rapid_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_rapid_kill", "remote_turret", sweapon );
    }
    
    if ( isdefined( self.rapidkill_data ) )
    {
        if ( isdefined( self.rapidkill_data[ "remote_turret" ] ) && self.rapidkill_data[ "remote_turret" ].rapidkill_count === 5 )
        {
            namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_remote_crackdown" );
        }
    }
    
    if ( utility::issharedfuncdefined( #"medal", #"track_scorestreak_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_scorestreak_kill", "remote_turret", victim );
    }
}

