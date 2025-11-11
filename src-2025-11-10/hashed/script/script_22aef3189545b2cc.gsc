#using script_2441c071c276c99e;
#using scripts\common\callbacks;

#namespace namespace_8e8b310503e6c24;

// Namespace namespace_8e8b310503e6c24
// Params 0, eflags: 0x5
// Checksum 0x8fb7416a, Offset: 0xf2
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_de888dc68fbc4240 );
    level callback::add( #"register_perk", &function_1bc13548af6f30f7 );
}

// Namespace namespace_8e8b310503e6c24
// Params 1
// Checksum 0xe1f94fab, Offset: 0x128
// Size: 0xf5
function function_de888dc68fbc4240( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_alert" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_alert" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_cc135402ae86ab04" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_high_alert", &function_d42a4f6f7409357, &function_95a3bdfca8afd144, [ "specialty_tps_buff_high_alert" ] );
        
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

// Namespace namespace_8e8b310503e6c24
// Params 0
// Checksum 0x704f2e2b, Offset: 0x225
// Size: 0xe
function function_d42a4f6f7409357()
{
    namespace_6db61cded148a258::function_e01aea80d74c2f37( "specialty_tps_high_alert" );
}

// Namespace namespace_8e8b310503e6c24
// Params 0
// Checksum 0x4e860bef, Offset: 0x23b
// Size: 0xe
function function_95a3bdfca8afd144()
{
    namespace_6db61cded148a258::function_13d095e25c63ffc6( "specialty_tps_high_alert" );
}

// Namespace namespace_8e8b310503e6c24
// Params 1
// Checksum 0x328f32fc, Offset: 0x251
// Size: 0xb5
function function_1bc13548af6f30f7( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_alert" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_alert" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_cc135402ae86ab04" ) )
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

