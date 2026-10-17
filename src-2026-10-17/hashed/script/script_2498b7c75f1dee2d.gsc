#using scripts\common\utility;

#namespace namespace_775af9b7afedb6d1;

// Namespace namespace_775af9b7afedb6d1
// Params 1
// Checksum 0x3fc6abaa, Offset: 0xcc
// Size: 0x5d
function init_scaling_health( var_66cdf76ec93556a0 )
{
    level.starting_health = [];
    level.var_b29bf68fec4ea398 = var_66cdf76ec93556a0;
    utility::registersharedfunc( #"zombie", #"health_scaling_get_starting_health", &get_starting_health );
    utility::registersharedfunc( #"zombie", #"health_scaling_get_subclass_health", &get_subclass_health );
}

// Namespace namespace_775af9b7afedb6d1
// Params 3
// Checksum 0xc117ceb2, Offset: 0x131
// Size: 0x316
function get_starting_health( scriptbundle_name, current_round = 1, var_97ec033c18291ffa = 0 )
{
    if ( !isdefined( scriptbundle_name ) || !isdefined( level.starting_health ) )
    {
        return 100;
    }
    
    scriptbundle_name = function_80df64beed5df7f9( scriptbundle_name );
    
    if ( !isdefined( level.starting_health[ scriptbundle_name ] ) )
    {
        level.starting_health[ scriptbundle_name ] = [];
    }
    
    num_players = var_97ec033c18291ffa ? 1 : level.var_b29bf68fec4ea398 ?? level.players.size;
    
    if ( !isdefined( level.starting_health[ scriptbundle_name ][ current_round ][ num_players ] ) )
    {
        health_bundle = getscriptbundle( "healthscalinground:" + scriptbundle_name );
        assert( isdefined( health_bundle ) );
        
        if ( isdefined( health_bundle.overridebasehealth ) && isdefined( self ) )
        {
            self.basehealth = health_bundle.overridebasehealth;
        }
        
        var_2db019d7a6312047 = health_bundle.var_cc106eb8f18f06bb;
        base = health_bundle.overridebasehealth ?? self.basehealth ?? 100;
        max = health_bundle.maxhealth ?? base;
        per_player_increase = health_bundle.var_674ca87a808f9ea1;
        result_health = base;
        
        if ( current_round > 1 && isdefined( var_2db019d7a6312047 ) )
        {
            for ( i = 0; i < var_2db019d7a6312047.size ; i++ )
            {
                if ( current_round >= var_2db019d7a6312047[ i ].startround )
                {
                    var_2b909369651addeb = var_2db019d7a6312047[ i ].healthadded ?? 0;
                    
                    if ( isdefined( var_2db019d7a6312047[ i + 1 ] ) && current_round >= var_2db019d7a6312047[ i + 1 ].startround )
                    {
                        health_rounds = var_2db019d7a6312047[ i + 1 ].startround - var_2db019d7a6312047[ i ].startround;
                    }
                    else
                    {
                        health_rounds = current_round - var_2db019d7a6312047[ i ].startround;
                    }
                    
                    result_health += var_2b909369651addeb * health_rounds;
                    continue;
                }
                
                break;
            }
        }
        
        if ( result_health > max )
        {
            result_health = max;
        }
        
        if ( isdefined( per_player_increase ) && num_players > 1 )
        {
            result_health += result_health * ( num_players - 1 ) * per_player_increase;
        }
        
        var_171053d32b7e9699 = 10;
        
        if ( level.starting_health[ scriptbundle_name ].size >= var_171053d32b7e9699 )
        {
            level.starting_health[ scriptbundle_name ] = [];
        }
        
        if ( !isdefined( level.starting_health[ scriptbundle_name ][ current_round ] ) )
        {
            level.starting_health[ scriptbundle_name ][ current_round ] = [];
        }
        
        level.starting_health[ scriptbundle_name ][ current_round ][ num_players ] = int( result_health );
    }
    
    result = level.starting_health[ scriptbundle_name ][ current_round ][ num_players ];
    basehealthscale = getdvarfloat( @"hash_a296d84ecc8ab62a", level.gametypebundle.var_6cfc57a4b0d987d ?? 1 );
    result *= basehealthscale;
    return result;
}

// Namespace namespace_775af9b7afedb6d1
// Params 4
// Checksum 0xb75e54f2, Offset: 0x450
// Size: 0x1e0
function get_round_health( scriptbundle_name, n_round, var_dee57567d3c9b844, n_max_health_override )
{
    scriptbundle_name = function_80df64beed5df7f9( scriptbundle_name );
    health_bundle = getscriptbundle( "healthscalinground:" + scriptbundle_name );
    assert( isdefined( health_bundle ) );
    var_2db019d7a6312047 = health_bundle.var_cc106eb8f18f06bb;
    base = var_dee57567d3c9b844 ?? health_bundle.overridebasehealth;
    base = base ?? self.basehealth;
    
    if ( !isdefined( base ) )
    {
        base = 100;
    }
    
    max = n_max_health_override ?? health_bundle.maxhealth;
    
    if ( !isdefined( max ) )
    {
        max = base;
    }
    
    per_player_increase = health_bundle.var_674ca87a808f9ea1;
    result_health = base;
    n_round_counter = 1;
    n_index = 0;
    
    while ( n_round_counter < n_round )
    {
        if ( isdefined( var_2db019d7a6312047[ n_index + 1 ].startround ) && n_round_counter >= var_2db019d7a6312047[ n_index + 1 ].startround )
        {
            n_index++;
        }
        
        if ( isdefined( var_2db019d7a6312047[ n_index ].healthadded ) )
        {
            result_health += var_2db019d7a6312047[ n_index ].healthadded;
        }
        
        n_round_counter++;
    }
    
    if ( result_health > max )
    {
        result_health = max;
    }
    
    num_players = level.var_b29bf68fec4ea398 ?? level.players.size;
    
    if ( isdefined( level.var_b7f59f63041499ca ) )
    {
        if ( [[ level.var_b7f59f63041499ca ]]( self ) )
        {
            num_players = level.players.size;
        }
        else
        {
            num_players = level.var_b29bf68fec4ea398 ?? 1;
        }
    }
    
    if ( isdefined( per_player_increase ) && num_players > 1 )
    {
        result_health += result_health * ( num_players - 1 ) * per_player_increase;
    }
    
    return int( result_health );
}

// Namespace namespace_775af9b7afedb6d1
// Params 3
// Checksum 0xbd6312b3, Offset: 0x639
// Size: 0x151
function get_subclass_health( subclass, n_round, var_97ec033c18291ffa = 0 )
{
    if ( !isdefined( level.var_e159810d1803d23b ) )
    {
        level.var_e159810d1803d23b = [];
    }
    
    if ( isdefined( level.var_e159810d1803d23b[ subclass ] ) )
    {
        round_health = get_starting_health( level.var_e159810d1803d23b[ subclass ], n_round, var_97ec033c18291ffa );
        return round_health;
    }
    
    utility::flag_wait( "subclass_to_aitype_map_initialized" );
    aitype = function_b3988325430ce242( subclass );
    assert( isdefined( aitype ), "<dev string:x24>" + subclass + "<dev string:x2f>" );
    
    if ( isaitypenamevalid( aitype ) )
    {
        aitype_scriptbundle = getaitypescriptbundle( aitype );
        
        if ( isdefined( aitype_scriptbundle.zombieaisetting ) && aitype_scriptbundle.zombieaisetting != "" )
        {
            health_scriptbundle = getscriptbundlefieldvalue( getxhashasset( "zombieaisettings:" + aitype_scriptbundle.zombieaisetting ), #"healthscriptbundle" );
            
            if ( isdefined( health_scriptbundle ) )
            {
                health_scriptbundle = function_80df64beed5df7f9( health_scriptbundle );
                level.var_e159810d1803d23b[ subclass ] = health_scriptbundle;
                round_health = get_starting_health( health_scriptbundle, n_round, var_97ec033c18291ffa );
                return round_health;
            }
            
            assertmsg( "<dev string:x24>" + subclass + "<dev string:x5e>" );
            return;
        }
    }
}

// Namespace namespace_775af9b7afedb6d1
// Params 0
// Checksum 0x35d62b53, Offset: 0x793
// Size: 0xc
function function_663107aa40ef00d1()
{
    level.var_b29bf68fec4ea398 = undefined;
}

// Namespace namespace_775af9b7afedb6d1
// Params 1
// Checksum 0xf7b96754, Offset: 0x7a7
// Size: 0x17
function function_f7526f8a5e2c1b0d( func )
{
    level.var_b7f59f63041499ca = func;
}

// Namespace namespace_775af9b7afedb6d1
// Params 1, eflags: 0x4
// Checksum 0x3297a453, Offset: 0x7c6
// Size: 0xd5
function private function_80df64beed5df7f9( scriptbundle )
{
    var_8d983a6167fdc6d6 = scriptbundle;
    
    foreach ( scriptbundle_struct in level.gametypebundle.var_b608dbcf2a9c24e6 ?? [] )
    {
        if ( scriptbundle_struct.originalhealth === hashcat( %"healthscalinground:", scriptbundle ) )
        {
            var_8d983a6167fdc6d6 = scriptbundle_struct.newhealth;
        }
    }
    
    assert( var_8d983a6167fdc6d6, "<dev string:x82>" + scriptbundle );
    return var_8d983a6167fdc6d6;
}

