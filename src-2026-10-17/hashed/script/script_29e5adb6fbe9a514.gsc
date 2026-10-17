#using script_25a8fa2ac8997425;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\currency;

#namespace perk_speedcola;

// Namespace perk_speedcola
// Params 0, eflags: 0x5
// Checksum 0x4c13f7ab, Offset: 0xdd
// Size: 0x15
function private autoexec __init__system__()
{
    system::register( "specialty_speedcola", undefined, &__init__, undefined );
}

// Namespace perk_speedcola
// Params 0, eflags: 0x1
// Checksum 0x205f9ad7, Offset: 0xfa
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_233428a7649c2bcf );
}

// Namespace perk_speedcola
// Params 0
// Checksum 0x54c8276e, Offset: 0x11a
// Size: 0xa
function __init__()
{
    level thread perk_speedcola_init();
}

// Namespace perk_speedcola
// Params 1
// Checksum 0x7fa7215d, Offset: 0x12c
// Size: 0x5e
function function_233428a7649c2bcf( params )
{
    bundle = level.perkbundles[ "specialty_speedcola" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( isfunction( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_speedcola", &function_e43d1fcb687c22ab, &function_adda939e40fcd839 );
    }
}

// Namespace perk_speedcola
// Params 0
// Checksum 0xa66cee0c, Offset: 0x192
// Size: 0x9a
function perk_speedcola_init()
{
    if ( !level.zombie_perks_in_use )
    {
        return;
    }
    
    level endon( #"game_ended" );
    level utility::flag_init( "specialty_speedcola" + "init_complete" );
    level utility::flag_wait_all( "StartGameTypeCallbackFinished", "zombie_perks_init_complete" );
    str_currency = currency::get_perk_machine_currency( "specialty_speedcola" );
    var_fcb7626c79b3c98f = currency::get_perk_machine_cost( "specialty_speedcola" );
    level thread zombie_perks::function_a01321e09bcca843( "specialty_speedcola", str_currency, var_fcb7626c79b3c98f, &function_e43d1fcb687c22ab, &function_adda939e40fcd839 );
    level utility::flag_set( "specialty_speedcola" + "init_complete" );
}

// Namespace perk_speedcola
// Params 0
// Checksum 0x8a2752c8, Offset: 0x234
// Size: 0x9
function function_e43d1fcb687c22ab()
{
    function_fbd26d686b7de9bc();
}

// Namespace perk_speedcola
// Params 4
// Checksum 0xd8f58f76, Offset: 0x245
// Size: 0x2e
function function_adda939e40fcd839( b_pause, str_perk, str_result, n_slot )
{
    function_ab0154a417c92252();
}

// Namespace perk_speedcola
// Params 0
// Checksum 0xa5148951, Offset: 0x27b
// Size: 0xe
function function_fbd26d686b7de9bc()
{
    zombie_perks::function_5d65c3d58cc084ec( "specialty_speedcola" );
}

// Namespace perk_speedcola
// Params 0
// Checksum 0x36f53d5d, Offset: 0x291
// Size: 0xe
function function_ab0154a417c92252()
{
    zombie_perks::function_25539251d02082( "specialty_speedcola" );
}

