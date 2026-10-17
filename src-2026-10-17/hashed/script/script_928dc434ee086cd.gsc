#using script_16ea1b94f0f381b3;
#using script_25a8fa2ac8997425;
#using scripts\common\callbacks;
#using scripts\common\scriptable;
#using scripts\common\system;
#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\mp\currency;

#namespace perk_d_mod;

// Namespace perk_d_mod
// Params 0, eflags: 0x5
// Checksum 0xc2851eae, Offset: 0x15f
// Size: 0x15
function private autoexec __init__system__()
{
    system::register( "specialty_d_mod", undefined, &__init__, undefined );
}

// Namespace perk_d_mod
// Params 0, eflags: 0x1
// Checksum 0x19f8ad04, Offset: 0x17c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_11681b7dc353705e );
}

// Namespace perk_d_mod
// Params 0
// Checksum 0xf28a6d4d, Offset: 0x19c
// Size: 0xa
function __init__()
{
    level thread perk_d_mod_init();
}

// Namespace perk_d_mod
// Params 1
// Checksum 0x71c712ea, Offset: 0x1ae
// Size: 0x5e
function function_11681b7dc353705e( params )
{
    bundle = level.perkbundles[ "specialty_d_mod" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( isfunction( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_d_mod", &function_9660c879e02b41dc, &function_6ff25ae5e2efe0d6 );
    }
}

// Namespace perk_d_mod
// Params 0
// Checksum 0x44e0b8db, Offset: 0x214
// Size: 0xbf
function perk_d_mod_init()
{
    if ( !level.zombie_perks_in_use )
    {
        return;
    }
    
    level endon( #"game_ended" );
    level utility::flag_init( "specialty_d_mod" + "init_complete" );
    level utility::flag_wait_all( "StartGameTypeCallbackFinished", "zombie_perks_init_complete" );
    str_currency = currency::get_perk_machine_currency( "specialty_d_mod" );
    var_fcb7626c79b3c98f = currency::get_perk_machine_cost( "specialty_d_mod" );
    n_perk_cost = var_fcb7626c79b3c98f ?? 2000;
    level thread zombie_perks::function_a01321e09bcca843( "specialty_d_mod", str_currency, n_perk_cost, &function_9660c879e02b41dc, &function_6ff25ae5e2efe0d6, 1 );
    level utility::flag_set( "specialty_d_mod" + "init_complete" );
    scriptable::scriptable_addnotifycallback( "d_mod_shot", &d_mod_machine_shoot );
}

// Namespace perk_d_mod
// Params 0
// Checksum 0xc0d6477e, Offset: 0x2db
// Size: 0x1a
function function_9660c879e02b41dc()
{
    utility::ent_flag_set( "perk_d_mod_active" );
    zombie_perks::function_5d65c3d58cc084ec( "specialty_d_mod" );
}

// Namespace perk_d_mod
// Params 4
// Checksum 0x9e914f65, Offset: 0x2fd
// Size: 0x3f
function function_6ff25ae5e2efe0d6( b_pause, str_perk, str_result, n_slot )
{
    utility::ent_flag_clear( "perk_d_mod_active" );
    zombie_perks::function_25539251d02082( "specialty_d_mod" );
}

// Namespace perk_d_mod
// Params 0
// Checksum 0xa11c7dcb, Offset: 0x344
// Size: 0xd
function function_b606df5a456e349e()
{
    return utility::ent_flag( "perk_d_mod_active" );
}

// Namespace perk_d_mod
// Params 4
// Checksum 0x74ecba92, Offset: 0x35a
// Size: 0x1ec
function d_mod_machine_shoot( eattacker, note, param, var_64ffacba090c91be )
{
    round_difficulty = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
    zombie_base_health = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", round_difficulty );
    
    if ( !isdefined( level.d_mod_machine_shoot_throttle ) )
    {
        level.d_mod_machine_shoot_throttle = throttle::throttle_initialize( "d_mod_machine_shoot_throttle", 1, level.framedurationseconds );
    }
    
    nearbyzombies = getaiarrayinradius( eattacker.origin, 256 );
    var_a134472124fa2713 = spawnstruct();
    machine_forward = vectornormalize( anglestoforward( eattacker.angles ) );
    
    foreach ( zombie in nearbyzombies )
    {
        if ( zombie_base_health >= zombie.health )
        {
            zombie namespace_9d8e359c3b1041e5::function_fd2dd8546ecc345e();
        }
        
        to_target = vectornormalize( ( zombie.origin[ 0 ], zombie.origin[ 1 ], 0 ) - ( eattacker.origin[ 0 ], eattacker.origin[ 1 ], 0 ) );
        dot = vectordot( machine_forward, to_target );
        
        if ( dot > 0.5 )
        {
            zombie dodamage( zombie_base_health, self.origin, eattacker, eattacker, "MOD_RIFLE_BULLET", "<explicitweaponnone>", "none", undefined, 1073807360 );
        }
        
        throttle::throttle_wait_in_queue( level.d_mod_machine_shoot_throttle, var_a134472124fa2713 );
    }
}

