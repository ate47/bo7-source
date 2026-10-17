#namespace namespace_f7e5bc4fc266882;

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0xe8c4cb77, Offset: 0x9e
// Size: 0x92, Type: bool
function function_4cbcbcdb92f86de2()
{
    if ( level.gamemodebundle.var_466182224fed917d && isdefined( level.gamemodebundle.var_d99b08c8f66883f4 ) && level.gamemodebundle.var_7d3e8d5033d22ced )
    {
        if ( isdefined( level.var_71749a9a1664454 ) )
        {
            prestigeclasstable = getscriptbundle( level.var_71749a9a1664454 );
            
            if ( isdefined( prestigeclasstable ) && isdefined( prestigeclasstable.classlist ) )
            {
                return ( prestigeclasstable.classlist.size > 0 );
            }
        }
    }
    
    return false;
}

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0xa1499bcd, Offset: 0x139
// Size: 0x5c, Type: bool
function function_d98ce6cdd84441eb()
{
    if ( !isbot( self ) && !istestclient( self ) && !isai( self ) )
    {
        if ( function_4cbcbcdb92f86de2() )
        {
            statsgroup = function_1f8e46a325f962ce();
            var_9dc1014067fb76e9 = self getplayerdata( statsgroup, #"challengeid" );
            return ( var_9dc1014067fb76e9 ?? 0 );
        }
    }
    
    return false;
}

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0xb2a1d5a4, Offset: 0x19e
// Size: 0x18, Type: bool
function function_ba46581a84b1edac()
{
    challengeid = function_d98ce6cdd84441eb();
    return challengeid > 0;
}

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0x3093d5eb, Offset: 0x1bf
// Size: 0xb2
function function_9bdd875e7b63531e()
{
    if ( !isdefined( level.var_910b6660150e3c51 ) )
    {
        level.var_910b6660150e3c51 = "prestige";
        
        if ( level.gamemodebundle.var_466182224fed917d && isdefined( level.gamemodebundle.var_d99b08c8f66883f4 ) && level.gamemodebundle.var_7d3e8d5033d22ced )
        {
            var_b783bb9b353a1075 = getscriptbundle( level.gamemodebundle.var_d99b08c8f66883f4 );
            
            if ( isdefined( var_b783bb9b353a1075.var_43fc7e25790d9097 ) )
            {
                level.var_910b6660150e3c51 = var_b783bb9b353a1075.var_43fc7e25790d9097;
            }
        }
    }
    
    return level.var_910b6660150e3c51;
}

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0x8e71e567, Offset: 0x27a
// Size: 0x97
function function_1f8e46a325f962ce()
{
    statsgroup = "weaponsetups";
    
    if ( level.gamemodebundle.var_466182224fed917d && isdefined( level.gamemodebundle.var_d99b08c8f66883f4 ) && level.gamemodebundle.var_7d3e8d5033d22ced )
    {
        var_b783bb9b353a1075 = getscriptbundle( level.gamemodebundle.var_d99b08c8f66883f4 );
        
        if ( isdefined( var_b783bb9b353a1075.var_71d94e93c0e60cf1 ) )
        {
            statsgroup = var_b783bb9b353a1075.var_71d94e93c0e60cf1;
        }
    }
    
    return statsgroup;
}

// Namespace namespace_f7e5bc4fc266882
// Params 1
// Checksum 0xf9052912, Offset: 0x31a
// Size: 0x18
function function_38b6d988f3bd7208( classname )
{
    return issubstr( classname, function_9bdd875e7b63531e() );
}

// Namespace namespace_f7e5bc4fc266882
// Params 0
// Checksum 0xebf01aec, Offset: 0x33b
// Size: 0x193
function function_615e6a7465344cf5()
{
    if ( function_4cbcbcdb92f86de2() )
    {
        var_379a098e70fe3155 = function_d98ce6cdd84441eb();
        prestigebundle = getscriptbundle( level.gamemodebundle.var_d99b08c8f66883f4 );
        prestigeclasstable = getscriptbundle( level.var_71749a9a1664454 );
        
        if ( isdefined( prestigebundle ) )
        {
            foreach ( var_e1801bfb5caf3711 in prestigebundle.prestigechallenges )
            {
                prestigechallenge = getscriptbundle( var_e1801bfb5caf3711 );
                
                if ( prestigechallenge.achievementid == var_379a098e70fe3155 )
                {
                    foreach ( loadout in prestigechallenge.defaultloadouts )
                    {
                        classtableindex = function_f02c63b99c9614c9( prestigeclasstable.classlist, loadout );
                        
                        if ( isdefined( classtableindex ) )
                        {
                            return ( function_9bdd875e7b63531e() + string( classtableindex + 1 ) );
                        }
                    }
                }
            }
        }
    }
    
    return "default1";
}

