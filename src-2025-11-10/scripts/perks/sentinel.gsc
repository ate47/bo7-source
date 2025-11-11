#using scripts\common\callbacks;
#using scripts\mp\utility\points;

#namespace sentinel;

// Namespace sentinel
// Params 0, eflags: 0x1
// Checksum 0x59e43fab, Offset: 0xac
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_9d3a1e2263faaa27 );
}

// Namespace sentinel
// Params 1
// Checksum 0x8fb490f0, Offset: 0xcc
// Size: 0x12c
function function_9d3a1e2263faaa27( params )
{
    bundle = level.perkbundles[ "specialty_sentinel" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_9cedac93ff3196b7" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_sentinel", &function_a4cfc08f3d93d1ca, &function_e8061b574feb3c3b );
    }
    
    if ( isdefined( params.var_5109b530c69d18a1 ) )
    {
        level [[ params.var_5109b530c69d18a1 ]]( "specialty_sentinel", &function_e13e1fd915eedbb );
    }
    
    var_ec3f9f1b6f06edac = [];
    
    foreach ( var_77b249de0a7f0a25 in bundle.var_ec3f9f1b6f06edac )
    {
        var_ec3f9f1b6f06edac[ var_ec3f9f1b6f06edac.size ] = var_77b249de0a7f0a25.scoreevent;
    }
    
    level.var_ec3f9f1b6f06edac = var_ec3f9f1b6f06edac;
}

// Namespace sentinel
// Params 1
// Checksum 0x938cc560, Offset: 0x200
// Size: 0x2a
function function_e13e1fd915eedbb( params )
{
    if ( !self.var_7a44face12042213 )
    {
        return;
    }
    
    thread points::doscoreevent( #"hash_55782256fabdb232" );
}

// Namespace sentinel
// Params 1
// Checksum 0xa382677c, Offset: 0x232
// Size: 0xa1
function function_e70124bb42e890b5( params )
{
    if ( self.var_7a44face12042213 )
    {
        return;
    }
    
    if ( !arraycontains( level.var_ec3f9f1b6f06edac, params.event ) )
    {
        return;
    }
    
    self.var_7a44face12042213 = 1;
    bundle = level.perkbundles[ "specialty_sentinel" ];
    var_2c124e2ccc1e8842 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_2c124e2ccc1e8842 ) )
    {
        self [[ var_2c124e2ccc1e8842 ]]( bundle, %"hash_64b98a7a0e74cda5" );
    }
    
    thread function_4d94ec7647d9b6d6();
}

// Namespace sentinel
// Params 0
// Checksum 0xff0079f4, Offset: 0x2db
// Size: 0x21
function function_a4cfc08f3d93d1ca()
{
    self.var_7a44face12042213 = 0;
    callback::add( #"hash_fa7263897b3164e", &function_e70124bb42e890b5 );
}

// Namespace sentinel
// Params 0
// Checksum 0x68d190cc, Offset: 0x304
// Size: 0x21
function function_e8061b574feb3c3b()
{
    self.var_7a44face12042213 = 0;
    callback::remove( #"hash_fa7263897b3164e", &function_e70124bb42e890b5 );
}

// Namespace sentinel
// Params 0
// Checksum 0x6035c6d4, Offset: 0x32d
// Size: 0x4c
function function_4d94ec7647d9b6d6()
{
    self endon( "death_or_disconnect" );
    bundle = level.perkbundles[ "specialty_sentinel" ];
    buffduration = bundle.var_1ba056704c2c2b91 ?? 10;
    wait buffduration;
    self.var_7a44face12042213 = 0;
}

