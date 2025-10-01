#using script_2441c071c276c99e;
#using scripts\common\callbacks;
#using scripts\mp\utility\points;

#namespace namespace_a3284da203905963;

// Namespace namespace_a3284da203905963
// Params 0, eflags: 0x5
// Checksum 0xbcb8947c, Offset: 0xdb
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_8dea510ea7246159 );
    level callback::add( #"register_perk", &function_1e82f6e6b1878986 );
}

// Namespace namespace_a3284da203905963
// Params 1
// Checksum 0x1035856b, Offset: 0x111
// Size: 0x115
function function_8dea510ea7246159( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_damage_radar" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_damage_radar" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_25fbc18e703ba4f1" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_damage_radar", &function_cf316c2d135e9ee6, &function_ff9d3dea5862a055, [ "specialty_damage_radar" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_damage_radar" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_damage_radar" ] = "specialty_tps_buff_damage_radar";
        }
    }
    
    if ( perkbundle.var_140291717160affc )
    {
        level.var_140291717160affc = perkbundle.var_140291717160affc * perkbundle.var_140291717160affc;
    }
    else
    {
        level.var_140291717160affc = 640000;
    }
    
    level.var_c267f3cfc720a3be[ "specialty_tps_damage_radar" ] = &"hash_3f612526caa700f9";
}

// Namespace namespace_a3284da203905963
// Params 0
// Checksum 0x11f19f27, Offset: 0x22e
// Size: 0xe
function function_cf316c2d135e9ee6()
{
    namespace_6db61cded148a258::function_e01aea80d74c2f37( "specialty_tps_damage_radar" );
}

// Namespace namespace_a3284da203905963
// Params 0
// Checksum 0x6286cc49, Offset: 0x244
// Size: 0xe
function function_ff9d3dea5862a055()
{
    namespace_6db61cded148a258::function_13d095e25c63ffc6( "specialty_tps_damage_radar" );
}

// Namespace namespace_a3284da203905963
// Params 0
// Checksum 0x4682710f, Offset: 0x25a
// Size: 0x17
function function_fd875cc00e1579f3()
{
    callback::add( #"hash_bdda5c524eb0eb00", &function_20ef42964ba8bc11 );
}

// Namespace namespace_a3284da203905963
// Params 0
// Checksum 0xe874aeb6, Offset: 0x279
// Size: 0x17
function function_bb9c91cc08bbefdc()
{
    callback::remove( #"hash_bdda5c524eb0eb00", &function_20ef42964ba8bc11 );
}

// Namespace namespace_a3284da203905963
// Params 1
// Checksum 0x39efa69a, Offset: 0x298
// Size: 0xbd
function function_1e82f6e6b1878986( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_damage_radar" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_damage_radar" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_25fbc18e703ba4f1" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_buff_damage_radar", &function_fd875cc00e1579f3, &function_bb9c91cc08bbefdc, [ "specialty_damage_radar" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_damage_radar" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_damage_radar" ] = "specialty_tps_buff_damage_radar";
        }
    }
}

// Namespace namespace_a3284da203905963
// Params 1
// Checksum 0x8342dede, Offset: 0x35d
// Size: 0xc5
function function_20ef42964ba8bc11( params )
{
    var_9aea4c13eca1ef55 = self.var_c4b4f21cb358d87c[ "specialty_tps_buff_damage_radar" ];
    
    foreach ( var_6ffdd837c4fe2982 in var_9aea4c13eca1ef55 )
    {
        if ( distancesquared( self.origin, var_6ffdd837c4fe2982.origin ) <= level.var_ef60871979b5dce1 )
        {
            var_6ffdd837c4fe2982 points::function_4f713a46699e559d( #"hash_d2f3704db358507c" );
        }
    }
}

