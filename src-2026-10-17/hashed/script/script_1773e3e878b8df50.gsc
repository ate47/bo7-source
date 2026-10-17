#using script_326e44f18084416a;
#using scripts\common\callbacks;

#namespace perk_tps_high_alert;

// Namespace perk_tps_high_alert
// Params 0, eflags: 0x5
// Checksum 0x8fb7416a, Offset: 0xe8
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_de888dc68fbc4240 );
    level callback::add( #"register_perk", &function_1bc13548af6f30f7 );
}

// Namespace perk_tps_high_alert
// Params 1
// Checksum 0x586132d3, Offset: 0x11e
// Size: 0xe4
function function_de888dc68fbc4240( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_alert" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_alert" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_high_alert", &setteamhighalert, &function_95a3bdfca8afd144, [ "specialty_tps_buff_high_alert" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_alert" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_alert" ] = "specialty_tps_buff_high_alert";
        }
    }
    
    if ( !isdefined( var_c08e832913e1c60f.var_fd9b39439920c808 ) )
    {
        var_c08e832913e1c60f.var_fd9b39439920c808 = "uin_friend_request_alert";
    }
    
    level.var_c267f3cfc720a3be[ "specialty_tps_high_alert" ] = &"sat_perks/tps_high_alert";
}

// Namespace perk_tps_high_alert
// Params 0
// Checksum 0x704f2e2b, Offset: 0x20a
// Size: 0xe
function setteamhighalert()
{
    namespace_6db61cded148a258::set_team_perk( "specialty_tps_high_alert" );
}

// Namespace perk_tps_high_alert
// Params 0
// Checksum 0x4e860bef, Offset: 0x220
// Size: 0xe
function function_95a3bdfca8afd144()
{
    namespace_6db61cded148a258::unset_team_perk( "specialty_tps_high_alert" );
}

// Namespace perk_tps_high_alert
// Params 1
// Checksum 0x8b174f84, Offset: 0x236
// Size: 0xa4
function function_1bc13548af6f30f7( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_alert" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_alert" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_buff_high_alert", undefined, undefined, [ "specialty_sixth_sense" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_alert" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_alert" ] = "specialty_tps_buff_high_alert";
        }
    }
}

