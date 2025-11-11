#using script_2441c071c276c99e;
#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\mp\utility\points;

#namespace namespace_e0882d4e658d105b;

// Namespace namespace_e0882d4e658d105b
// Params 0, eflags: 0x5
// Checksum 0xba043d15, Offset: 0x117
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_f55cd1da8fed735e );
    level callback::add( #"register_perk", &function_b0398411a1676bdd );
}

// Namespace namespace_e0882d4e658d105b
// Params 1
// Checksum 0xb9b12777, Offset: 0x14d
// Size: 0x134
function function_f55cd1da8fed735e( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_overclock" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_overclock" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_b9d47dd6b28198e6" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_overclock", &function_b9c4e3467fef53d, &function_fa4e1e644e1dc7fa, [ "specialty_faster_field_upgrade" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_overclock" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_overclock" ] = "specialty_tps_buff_overclock";
        }
    }
    
    if ( !isdefined( var_c08e832913e1c60f.var_fd9b39439920c808 ) )
    {
        var_c08e832913e1c60f.var_fd9b39439920c808 = "uin_friend_request_alert";
    }
    
    if ( perkbundle.var_2d567850979cfd1d )
    {
        level.var_ef60871979b5dce1 = perkbundle.var_2d567850979cfd1d * perkbundle.var_2d567850979cfd1d;
    }
    else
    {
        level.var_ef60871979b5dce1 = 640000;
    }
    
    level.var_c267f3cfc720a3be[ "specialty_tps_overclock" ] = &"hash_2626bd20008aa101";
}

// Namespace namespace_e0882d4e658d105b
// Params 0
// Checksum 0x9cc4d273, Offset: 0x289
// Size: 0x4d
function function_b9c4e3467fef53d()
{
    perkbundle = level.perkbundles[ "specialty_tps_overclock" ];
    val::set( "specialty_tps_overclock", "field_upgrade_recharge_mult", perkbundle.var_36874ca2672346b ?? 1.4 );
    namespace_6db61cded148a258::function_e01aea80d74c2f37( "specialty_tps_overclock" );
}

// Namespace namespace_e0882d4e658d105b
// Params 0
// Checksum 0x85eb46d8, Offset: 0x2de
// Size: 0x1f
function function_fa4e1e644e1dc7fa()
{
    val::reset( "specialty_tps_overclock", "field_upgrade_recharge_mult" );
    namespace_6db61cded148a258::function_13d095e25c63ffc6( "specialty_tps_overclock" );
}

// Namespace namespace_e0882d4e658d105b
// Params 0
// Checksum 0xf747ed44, Offset: 0x305
// Size: 0x56
function function_d8be14e83c4df924()
{
    perkbundle = level.perkbundles[ "specialty_tps_overclock" ];
    val::set( "specialty_tps_overclock", "field_upgrade_recharge_mult", perkbundle.var_36874ca2672346b ?? 1.4 );
    callback::add( #"on_used_super", &function_9e4e05d4a0277348 );
}

// Namespace namespace_e0882d4e658d105b
// Params 0
// Checksum 0xf28e708d, Offset: 0x363
// Size: 0x28
function function_dc17fe0378aed8af()
{
    val::reset( "specialty_tps_overclock", "field_upgrade_recharge_mult" );
    callback::remove( #"on_used_super", &function_9e4e05d4a0277348 );
}

// Namespace namespace_e0882d4e658d105b
// Params 1
// Checksum 0x23ae1b75, Offset: 0x393
// Size: 0xbd
function function_b0398411a1676bdd( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_overclock" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_overclock" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_b9d47dd6b28198e6" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_buff_overclock", &function_d8be14e83c4df924, &function_dc17fe0378aed8af, [ "specialty_faster_field_upgrade" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_overclock" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_overclock" ] = "specialty_tps_buff_overclock";
        }
    }
}

// Namespace namespace_e0882d4e658d105b
// Params 1
// Checksum 0x31b7d1f8, Offset: 0x458
// Size: 0xc5
function function_9e4e05d4a0277348( params )
{
    var_9aea4c13eca1ef55 = self.var_c4b4f21cb358d87c[ "specialty_tps_buff_overclock" ];
    
    foreach ( var_6ffdd837c4fe2982 in var_9aea4c13eca1ef55 )
    {
        if ( distancesquared( self.origin, var_6ffdd837c4fe2982.origin ) <= level.var_ef60871979b5dce1 )
        {
            var_6ffdd837c4fe2982 points::doscoreevent( #"hash_9af51e22b4237a27" );
        }
    }
}

