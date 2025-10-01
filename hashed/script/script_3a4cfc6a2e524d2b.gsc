#using script_2441c071c276c99e;
#using scripts\common\callbacks;

#namespace namespace_1817f023bb625c2d;

// Namespace namespace_1817f023bb625c2d
// Params 0, eflags: 0x5
// Checksum 0x44a9174, Offset: 0x104
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_7cce4f5207876740 );
    level callback::add( #"register_perk", &function_794513c08263d74f );
}

// Namespace namespace_1817f023bb625c2d
// Params 1
// Checksum 0xfcde8b88, Offset: 0x13a
// Size: 0xf5
function function_7cce4f5207876740( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_gain_antenna" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_gain_antenna" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_8babf7acabf26adb" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_high_gain_antenna", &function_58993cfa9d59afaf, &function_5ae63dffa4806f84, [ "specialty_tps_buff_high_gain_antenna" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_gain_antenna" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_gain_antenna" ] = "specialty_tps_buff_high_gain_antenna";
        }
    }
    
    if ( !isdefined( var_c08e832913e1c60f.var_fd9b39439920c808 ) )
    {
        var_c08e832913e1c60f.var_fd9b39439920c808 = "uin_cer_dlgl_greenlight";
    }
    
    level.var_c267f3cfc720a3be[ "specialty_tps_high_gain_antenna" ] = &"SAT_PERKS/TPS_HIGH_GAIN_ANTENNA";
}

// Namespace namespace_1817f023bb625c2d
// Params 0
// Checksum 0x31183da, Offset: 0x237
// Size: 0xe
function function_58993cfa9d59afaf()
{
    namespace_6db61cded148a258::function_e01aea80d74c2f37( "specialty_tps_high_gain_antenna" );
}

// Namespace namespace_1817f023bb625c2d
// Params 0
// Checksum 0xade75c6d, Offset: 0x24d
// Size: 0xe
function function_5ae63dffa4806f84()
{
    namespace_6db61cded148a258::function_13d095e25c63ffc6( "specialty_tps_high_gain_antenna" );
}

// Namespace namespace_1817f023bb625c2d
// Params 1
// Checksum 0x30263759, Offset: 0x263
// Size: 0xb5
function function_794513c08263d74f( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_high_gain_antenna" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_high_gain_antenna" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_8babf7acabf26adb" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_buff_high_gain_antenna", undefined, undefined, [ "specialty_expanded_minimap" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_gain_antenna" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_high_gain_antenna" ] = "specialty_tps_buff_high_gain_antenna";
        }
    }
}

