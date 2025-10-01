#using scripts\common\callbacks;
#using scripts\mp\supers;
#using scripts\mp\utility\points;
#using scripts\mp\utility\weapon;

#namespace captain;

// Namespace captain
// Params 0, eflags: 0x1
// Checksum 0x9c8b0fd2, Offset: 0x114
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_936c1102f7fcfd5 );
}

// Namespace captain
// Params 1
// Checksum 0xf045cb96, Offset: 0x134
// Size: 0x95
function function_936c1102f7fcfd5( params )
{
    bundle = level.perkbundles[ "specialty_captain" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_dd431bea9be612d9" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_captain", &function_390fd60c2e8f00d6, &function_d40460cdfe84cb39 );
    }
    
    if ( isdefined( params.var_5109b530c69d18a1 ) )
    {
        level [[ params.var_5109b530c69d18a1 ]]( "specialty_captain", &function_9c9fcdbdd0d96cf );
    }
}

// Namespace captain
// Params 1
// Checksum 0x9a25cf39, Offset: 0x1d1
// Size: 0x137
function function_9c9fcdbdd0d96cf( params )
{
    if ( !function_3a35a82e9be58d3d( params ) )
    {
        return;
    }
    
    self notify( "captainOnKillBuff" );
    self.var_b85b83ea0a347ac3 = gettime();
    bundle = level.perkbundles[ "specialty_captain" ];
    superpoints = bundle.var_9defa51b3300632 ?? 100;
    thread namespace_e68fe57307286f8a::givesuperpoints( superpoints );
    thread points::function_4f713a46699e559d( #"hash_5b81a0857765114" );
    self.var_de0e5e468776d901 = 1;
    var_2c124e2ccc1e8842 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_2c124e2ccc1e8842 ) )
    {
        foreach ( var_6769521a9cab5947 in bundle.var_ee1c92198ad66b2f )
        {
            self [[ var_2c124e2ccc1e8842 ]]( bundle, var_6769521a9cab5947.var_fbd59bd982c1fe7c );
        }
    }
}

// Namespace captain
// Params 0
// Checksum 0x4aa42f1e, Offset: 0x310
// Size: 0x32
function function_390fd60c2e8f00d6()
{
    bundle = level.perkbundles[ "specialty_captain" ];
    
    if ( bundle.var_41187badcca3cdca )
    {
        thread captainWatchVisibility();
    }
}

// Namespace captain
// Params 0
// Checksum 0x6cb0cabe, Offset: 0x34a
// Size: 0xa
function function_d40460cdfe84cb39()
{
    self notify( "captainWatchVisibility" );
}

// Namespace captain
// Params 0
// Checksum 0xc416e8a, Offset: 0x35c
// Size: 0x59
function captainWatchVisibility()
{
    self notify( "captainWatchVisibility" );
    self endon( "captainWatchVisibility" );
    self endon( "death_or_disconnect" );
    
    while ( true )
    {
        var_6846bc37669eecd1 = self getplayerssightingme();
        
        if ( var_6846bc37669eecd1.size > 0 )
        {
            self.var_60d39f40a7383b40 = 1;
        }
        else
        {
            self.var_60d39f40a7383b40 = 0;
        }
        
        wait 0.25;
    }
}

// Namespace captain
// Params 1
// Checksum 0x45f53f02, Offset: 0x3bd
// Size: 0x169, Type: bool
function function_3a35a82e9be58d3d( deathdata )
{
    smeansofdeath = deathdata.smeansofdeath ?? "";
    currenttime = gettime();
    bundle = level.perkbundles[ "specialty_captain" ];
    cooldownms = ( bundle.var_a6f76cfe906dbe9b ?? 10 ) * 1000;
    
    if ( self.var_b85b83ea0a347ac3 > currenttime - cooldownms )
    {
        return false;
    }
    
    if ( bundle.var_6690867bb6204e91 && deathdata.objweapon issilenced() )
    {
        return true;
    }
    
    if ( bundle.var_41187badcca3cdca && !self.var_60d39f40a7383b40 )
    {
        return true;
    }
    
    if ( bundle.var_bcea45c9701b0ec )
    {
        if ( smeansofdeath == "MOD_MELEE" )
        {
            return true;
        }
        
        if ( smeansofdeath == "MOD_MELEE_TAKEDOWN" )
        {
            return true;
        }
        
        if ( smeansofdeath == "MOD_EXECUTION" )
        {
            return true;
        }
    }
    
    if ( bundle.var_5331692498cabc0 && weapon::function_e1a6c47f66c6de20( deathdata.objweapon ) )
    {
        return true;
    }
    
    var_835c51befc9941d1 = ( bundle.var_8abb2882ed9990d1 ?? 0.75 ) * 1000;
    
    if ( bundle.var_5064b8ba56c4edaa && self.var_fc366f38eebc5a48 >= currenttime - var_835c51befc9941d1 )
    {
        return true;
    }
    
    return false;
}

