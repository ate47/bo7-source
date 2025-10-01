#using script_2441c071c276c99e;
#using scripts\common\callbacks;

#namespace namespace_99b7917780e7e956;

// Namespace namespace_99b7917780e7e956
// Params 0, eflags: 0x5
// Checksum 0x3fcf240b, Offset: 0x13f
// Size: 0x2e
function private autoexec main()
{
    level callback::add( #"register_perk", &function_4c52fc048b2a533d );
    level callback::add( #"register_perk", &function_153ef71a8638f374 );
}

// Namespace namespace_99b7917780e7e956
// Params 1
// Checksum 0xcc34772f, Offset: 0x175
// Size: 0xf5
function function_4c52fc048b2a533d( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_health_on_kill" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_health_on_kill" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_b82450246181dc8b" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_health_on_kill", &function_c72513f5353b3e54, &function_968e39152ae98171, [ "specialty_tps_buff_health_on_kill" ] );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_health_on_kill" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_health_on_kill" ] = "specialty_tps_buff_health_on_kill";
        }
    }
    
    if ( !isdefined( var_c08e832913e1c60f.var_fd9b39439920c808 ) )
    {
        var_c08e832913e1c60f.var_fd9b39439920c808 = "uin_cer_splash_medal_small";
    }
    
    level.var_c267f3cfc720a3be[ "specialty_tps_health_on_kill" ] = &"SAT_PERKS/TPS_HEALTH_ON_KILL";
}

// Namespace namespace_99b7917780e7e956
// Params 0
// Checksum 0xfda8c04b, Offset: 0x272
// Size: 0xe
function function_c72513f5353b3e54()
{
    namespace_6db61cded148a258::function_e01aea80d74c2f37( "specialty_tps_health_on_kill" );
}

// Namespace namespace_99b7917780e7e956
// Params 0
// Checksum 0xf5b68a5e, Offset: 0x288
// Size: 0xe
function function_968e39152ae98171()
{
    namespace_6db61cded148a258::function_13d095e25c63ffc6( "specialty_tps_health_on_kill" );
}

// Namespace namespace_99b7917780e7e956
// Params 1
// Checksum 0xb9013cbe, Offset: 0x29e
// Size: 0xf0
function function_153ef71a8638f374( params )
{
    perkbundle = level.perkbundles[ "specialty_tps_health_on_kill" ];
    var_c08e832913e1c60f = level.perkbundles[ "specialty_tps_buff_health_on_kill" ];
    
    if ( !( isdefined( perkbundle ) && isdefined( var_c08e832913e1c60f ) ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_b82450246181dc8b" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_tps_buff_health_on_kill", &function_d12ac75026758f65, &function_860781c632abedd0 );
        
        if ( !isdefined( level.var_e8baaf9a6a5a10e0[ "specialty_tps_health_on_kill" ] ) )
        {
            level.var_e8baaf9a6a5a10e0[ "specialty_tps_health_on_kill" ] = "specialty_tps_buff_health_on_kill";
        }
    }
    
    if ( isdefined( params.var_5109b530c69d18a1 ) )
    {
        level [[ params.var_5109b530c69d18a1 ]]( "specialty_tps_buff_health_on_kill", &function_eefb6c9f97f6e78 );
    }
    
    callback::add( #"hash_6a8a551945faab9", &function_84857b5be08cb7b3 );
}

// Namespace namespace_99b7917780e7e956
// Params 0
// Checksum 0xd0678d3, Offset: 0x396
// Size: 0xc
function function_d12ac75026758f65()
{
    self.var_c5daf17dab506187 = 0;
}

// Namespace namespace_99b7917780e7e956
// Params 0
// Checksum 0x217110e2, Offset: 0x3aa
// Size: 0xa
function function_860781c632abedd0()
{
    function_c8a2e9a86aca9fa8( 0 );
}

// Namespace namespace_99b7917780e7e956
// Params 1
// Checksum 0x95e554b2, Offset: 0x3bc
// Size: 0x52
function function_eefb6c9f97f6e78( params )
{
    smeansofdeath = params.smeansofdeath ?? "";
    
    if ( smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_EXECUTION" )
    {
        return;
    }
    
    self notify( "teamBuffHealthOnKill_applyBuff" );
    teamBuffHealthOnKill_applyBuff();
}

// Namespace namespace_99b7917780e7e956
// Params 0
// Checksum 0xabd27bfc, Offset: 0x416
// Size: 0xb7
function teamBuffHealthOnKill_applyBuff()
{
    if ( !isdefined( self.cranked ) )
    {
        self.var_c5daf17dab506187 = 1;
        var_5222dcea1434af75 = level.perkbundles[ "specialty_tps_health_on_kill" ].var_7b39691c9f15ba3 ?? 3;
        thread function_c8a2e9a86aca9fa8( var_5222dcea1434af75 );
        var_f427dd18ac2fe135 = level.sharedfuncs[ #"playerhealth" ][ #"hash_edc16c12ca11400" ];
        
        if ( isdefined( var_f427dd18ac2fe135 ) )
        {
            var_e532634220155578 = level.perkbundles[ "specialty_tps_health_on_kill" ].var_73e1e9ac7f4fc693 ?? 0.5;
            self [[ var_f427dd18ac2fe135 ]]( #"hash_c4b233e642a6a1d2", var_e532634220155578 );
        }
    }
}

// Namespace namespace_99b7917780e7e956
// Params 1
// Checksum 0xf94e6e38, Offset: 0x4d5
// Size: 0x6c
function function_c8a2e9a86aca9fa8( buffduration )
{
    if ( buffduration )
    {
        self endon( "teamBuffHealthOnKill_applyBuff" );
        self endon( "death_or_disconnect" );
        wait buffduration;
    }
    
    self.var_c5daf17dab506187 = 0;
    var_1c2fdadc1c73aca8 = level.sharedfuncs[ #"playerhealth" ][ #"hash_325a50f0cddc1ff" ];
    
    if ( isdefined( var_1c2fdadc1c73aca8 ) )
    {
        self [[ var_1c2fdadc1c73aca8 ]]( #"hash_c4b233e642a6a1d2" );
    }
}

// Namespace namespace_99b7917780e7e956
// Params 1
// Checksum 0x77c87d01, Offset: 0x549
// Size: 0x5c
function function_84857b5be08cb7b3( params )
{
    if ( self.var_c5daf17dab506187 )
    {
        var_45e18ebe6e47c2b5 = level.perkbundles[ "specialty_tps_health_on_kill" ].var_8ee970329e41f084 ?? 5;
        params.var_2b32a8de075bfd54 *= var_45e18ebe6e47c2b5;
    }
}

