#using scripts\common\callbacks;
#using scripts\mp\utility\player;

#namespace scout;

// Namespace scout
// Params 0, eflags: 0x1
// Checksum 0xced65e, Offset: 0xf4
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_85564e6cae7d634b );
}

// Namespace scout
// Params 1
// Checksum 0x49b59727, Offset: 0x114
// Size: 0x8b
function function_85564e6cae7d634b( params )
{
    bundle = level.perkbundles[ "specialty_scout" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_a22bd5316362a38f" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_scout" );
    }
    
    if ( isdefined( params.var_5109b530c69d18a1 ) )
    {
        level [[ params.var_5109b530c69d18a1 ]]( "specialty_scout", &scoutonkillbuff );
    }
}

// Namespace scout
// Params 1
// Checksum 0x22d45924, Offset: 0x1a7
// Size: 0x176
function scoutonkillbuff( params )
{
    smeansofdeath = params.smeansofdeath ?? "";
    
    if ( smeansofdeath == "MOD_MELEE" )
    {
        return;
    }
    
    if ( smeansofdeath == "MOD_MELEE_TAKEDOWN" )
    {
        return;
    }
    
    if ( smeansofdeath == "MOD_EXECUTION" )
    {
        return;
    }
    
    self notify( "scoutOnKillBuff" );
    
    if ( self.var_4a067337b84d8676 )
    {
        self.var_dfb4efc4c9e3d3ec = 1;
    }
    
    self.var_4a067337b84d8676 = 1;
    player::function_e4f77222086e66b( 1 );
    self function_e5ab5088cc09b666( 1 );
    bundle = level.perkbundles[ "specialty_scout" ];
    buffduration = bundle.var_e472c78f440d7681 ?? 5;
    thread function_9b50188e8f3ce2b5( buffduration );
    var_2c124e2ccc1e8842 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_2c124e2ccc1e8842 ) )
    {
        foreach ( var_6769521a9cab5947 in bundle.var_ee1c92198ad66b2f )
        {
            self [[ var_2c124e2ccc1e8842 ]]( bundle, var_6769521a9cab5947.var_fbd59bd982c1fe7c );
        }
    }
}

// Namespace scout
// Params 1
// Checksum 0x4be3d61f, Offset: 0x325
// Size: 0x47
function function_9b50188e8f3ce2b5( buffduration )
{
    if ( buffduration )
    {
        self endon( "scoutOnKillBuff" );
        self endon( "death_or_disconnect" );
        wait buffduration;
    }
    
    self.var_4a067337b84d8676 = undefined;
    self.var_dfb4efc4c9e3d3ec = undefined;
    player::function_e4f77222086e66b( 0 );
    self function_e5ab5088cc09b666( 0 );
}

