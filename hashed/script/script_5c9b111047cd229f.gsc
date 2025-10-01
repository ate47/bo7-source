#using script_16ea1b94f0f381b3;
#using scripts\common\devgui;
#using scripts\engine\utility;

#namespace subclass_to_aitype_map;

// Namespace subclass_to_aitype_map
// Params 0, eflags: 0x1
// Checksum 0x73cad651, Offset: 0x132
// Size: 0xa
function autoexec init()
{
    level thread function_378daafe824a5c0();
}

// Namespace subclass_to_aitype_map
// Params 0, eflags: 0x4
// Checksum 0x5005dca1, Offset: 0x144
// Size: 0x1bc
function private function_378daafe824a5c0()
{
    level endon( "game_ended" );
    waitframe();
    level.var_396ff1f8ac66b808 = "ChooseSmallest";
    level.var_54d7099494ead715 = undefined;
    level.var_e33e1be8dabea955 = undefined;
    level.var_c9e0fca55204d8c4 = [];
    level.subclass_to_aitype_map = [];
    level.var_962742d9501c1412 = [];
    subclass_names = getscriptbundlenames( "ai_subclass" );
    
    foreach ( str_bundle in subclass_names )
    {
        name = getscriptbundlefieldvalue( str_bundle, "name" );
        level.var_962742d9501c1412[ level.var_962742d9501c1412.size ] = name;
    }
    
    add_map();
    gametypebundle = getgametypescriptbundle();
    
    if ( isdefined( gametypebundle ) && isdefined( gametypebundle.subclass_to_aitype_map ) )
    {
        add_map( gametypebundle.subclass_to_aitype_map );
    }
    
    mapinfo = function_3161539e0a96d772();
    
    if ( isdefined( mapinfo ) && isdefined( mapinfo.subclass_to_aitype_map ) && mapinfo.subclass_to_aitype_map.size > 0 )
    {
        add_map( mapinfo.subclass_to_aitype_map );
    }
    
    if ( isdefined( gametypebundle ) && isdefined( gametypebundle.var_d72ac83fac014227 ) )
    {
        add_map( gametypebundle.var_d72ac83fac014227 );
    }
    
    utility::flag_set( "subclass_to_aitype_map_initialized" );
    level thread function_e3f62c04fcbf8c79();
    
    /#
        level thread function_3de693086adddd24();
    #/
}

// Namespace subclass_to_aitype_map
// Params 1
// Checksum 0x1eb78d6e, Offset: 0x308
// Size: 0x2d
function function_7f9ebc41207674e9( subclass )
{
    assert( utility::flag( "<dev string:x24>" ), "<dev string:x4a>" );
    return function_b3988325430ce242( subclass );
}

// Namespace subclass_to_aitype_map
// Params 1
// Checksum 0xed9b2ee0, Offset: 0x33e
// Size: 0x15d
function add_map( map_asset )
{
    processed_map = function_f2e8fd0f21849cd9( map_asset, level.var_396ff1f8ac66b808, level.var_54d7099494ead715, level.var_e33e1be8dabea955, level.subclass_to_aitype_map );
    level.var_396ff1f8ac66b808 = processed_map.default_mapping ?? level.var_396ff1f8ac66b808;
    level.var_54d7099494ead715 = processed_map.var_6171a3f2dfa8c0db ?? level.var_54d7099494ead715;
    level.var_e33e1be8dabea955 = processed_map.default_substring ?? level.var_e33e1be8dabea955;
    level.subclass_to_aitype_map = processed_map.subclass_map;
    
    foreach ( subclass_name in level.var_962742d9501c1412 )
    {
        aitype = function_9fc4e9f61d6b21d8( subclass_name );
        
        if ( isdefined( aitype ) )
        {
            function_6f4ed5b6d73255d7( subclass_name, aitype );
        }
    }
    
    level.var_c9e0fca55204d8c4[ level.var_c9e0fca55204d8c4.size ] = map_asset;
}

// Namespace subclass_to_aitype_map
// Params 1
// Checksum 0xcc1ef551, Offset: 0x4a3
// Size: 0xbe
function remove_map( map_asset )
{
    assert( arraycontains( level.var_c9e0fca55204d8c4, map_asset ) );
    level.var_c9e0fca55204d8c4 = arrayremove( level.var_c9e0fca55204d8c4, map_asset );
    level.subclass_to_aitype_map = [];
    
    foreach ( var_b9908945e1ad2545 in level.var_c9e0fca55204d8c4 )
    {
        add_map( var_b9908945e1ad2545 );
    }
}

// Namespace subclass_to_aitype_map
// Params 2
// Checksum 0xc70cc6ed, Offset: 0x569
// Size: 0x11e
function function_427ae77ce1056e01( subclass, map_assets )
{
    assert( utility::flag( "<dev string:x24>" ), "<dev string:x4a>" );
    
    if ( !isarray( map_assets ) )
    {
        map_assets = [ map_assets ];
    }
    
    assert( map_assets.size > 0 );
    processed_map = function_f2e8fd0f21849cd9( map_assets[ 0 ] );
    
    for ( map_index = 1; map_index < map_assets.size ; map_index++ )
    {
        processed_map = function_f2e8fd0f21849cd9( map_assets[ map_index ], processed_map.default_mapping, processed_map.var_6171a3f2dfa8c0db, processed_map.default_substring, processed_map.subclass_to_aitype_map );
    }
    
    if ( isdefined( processed_map.subclass_map[ subclass ] ) )
    {
        return processed_map.subclass_map[ subclass ];
    }
    
    if ( isdefined( processed_map.default_mapping ) )
    {
        calculated_aitype = calculate_aitype( subclass, processed_map.default_mapping, processed_map.var_6171a3f2dfa8c0db, processed_map.default_substring );
        return calculated_aitype;
    }
    
    return undefined;
}

// Namespace subclass_to_aitype_map
// Params 5, eflags: 0x4
// Checksum 0xaf2bcec2, Offset: 0x690
// Size: 0x275
function private function_f2e8fd0f21849cd9( map_asset, var_c38644f1895fa744, var_f46f630650bf02a1, var_3525afc904fd1449, var_9a727457179279b )
{
    return_map = { #subclass_map:arraycopy( var_9a727457179279b ?? [] ), #default_substring:var_3525afc904fd1449, #var_6171a3f2dfa8c0db:var_f46f630650bf02a1, #default_mapping:var_c38644f1895fa744 };
    
    if ( !isdefined( map_asset ) )
    {
        return return_map;
    }
    
    if ( isstring( map_asset ) )
    {
        if ( !issubstr( map_asset, "subclass_to_aitype_map:" ) )
        {
            map_asset = "subclass_to_aitype_map:" + map_asset;
        }
        
        map_asset = getxhashasset( map_asset );
    }
    
    scriptbundle = function_ecac6e0758db5e7c( map_asset );
    
    if ( isdefined( scriptbundle ) )
    {
        if ( isdefined( scriptbundle.default_mapping ) && scriptbundle.default_mapping != "DontChange" )
        {
            return_map.default_mapping = scriptbundle.default_mapping;
            
            if ( return_map.default_mapping == "Specific" )
            {
                assert( isstring( scriptbundle.defaultspecificaitype ) );
                return_map.var_6171a3f2dfa8c0db = scriptbundle.defaultspecificaitype;
            }
            else if ( return_map.default_mapping == "ContainsString" )
            {
                assert( isstring( scriptbundle.defaultsubstring ) );
                return_map.default_substring = scriptbundle.defaultsubstring;
            }
        }
        
        if ( isdefined( scriptbundle.entry_list ) )
        {
            foreach ( entry in scriptbundle.entry_list )
            {
                subclass_name = getscriptbundlefieldvalue( entry.subclass, "name" );
                
                if ( !isdefined( subclass_name ) )
                {
                    continue;
                }
                
                calculated_aitype = calculate_aitype( subclass_name, entry.mapping, entry.specificaitype, entry.substring );
                
                if ( !isdefined( calculated_aitype ) )
                {
                    continue;
                }
                
                return_map.subclass_map[ subclass_name ] = calculated_aitype;
            }
        }
    }
    
    return return_map;
}

// Namespace subclass_to_aitype_map
// Params 4, eflags: 0x4
// Checksum 0x626153e4, Offset: 0x90e
// Size: 0x199
function private calculate_aitype( subclass_name, mapping, specific_aitype, substring )
{
    assert( isdefined( mapping ) );
    
    if ( !isdefined( mapping ) )
    {
        return;
    }
    
    if ( mapping == "Specific" )
    {
        assert( isstring( specific_aitype ) );
        return specific_aitype;
    }
    
    aitypes = namespace_9d8e359c3b1041e5::get_aitype_by_subclass_sharedfunc( subclass_name );
    
    if ( !isarray( aitypes ) || aitypes.size <= 0 )
    {
        return;
    }
    
    if ( mapping == "ContainsString" )
    {
        assert( isstring( substring ) );
        
        foreach ( aitype in aitypes )
        {
            if ( issubstr( aitype, substring ) )
            {
                return aitype;
            }
        }
    }
    
    smallest_aitype = undefined;
    
    foreach ( aitype in aitypes )
    {
        strlen = aitype.size;
        
        if ( !isdefined( smallest_aitype ) || smallest_aitype.size > strlen )
        {
            smallest_aitype = aitype;
        }
    }
    
    return smallest_aitype;
}

// Namespace subclass_to_aitype_map
// Params 1, eflags: 0x4
// Checksum 0x941b43a3, Offset: 0xab2
// Size: 0x9b
function private function_ecac6e0758db5e7c( map_asset )
{
    assert( isxhash( map_asset ) || isxhashasset( map_asset ) );
    
    if ( !isdefined( level.var_e6acc6202bec467e ) )
    {
        level.var_e6acc6202bec467e = [];
    }
    
    scriptbundle = undefined;
    
    if ( !isdefined( level.var_e6acc6202bec467e[ map_asset ] ) )
    {
        scriptbundle = getscriptbundle( map_asset );
        
        if ( !isdefined( scriptbundle ) )
        {
            assertmsg( "<dev string:x78>" + getxhashsourcename( map_asset ) );
            return undefined;
        }
        
        level.var_e6acc6202bec467e[ map_asset ] = scriptbundle;
    }
    
    scriptbundle = level.var_e6acc6202bec467e[ map_asset ];
    return scriptbundle;
}

// Namespace subclass_to_aitype_map
// Params 0, eflags: 0x4
// Checksum 0xd68d9d98, Offset: 0xb56
// Size: 0x10c
function private function_e3f62c04fcbf8c79()
{
    level endon( "game_ended" );
    setdvarifuninitialized( @"hash_33aa1a0677d2f25f", "" );
    
    while ( true )
    {
        var_dc930f4d5ca8084d = getdvar( @"hash_33aa1a0677d2f25f" );
        
        if ( var_dc930f4d5ca8084d == "" )
        {
            wait 1;
            continue;
        }
        
        setdvar( @"hash_33aa1a0677d2f25f", "" );
        map_assets = strtok( var_dc930f4d5ca8084d, "|" );
        
        foreach ( map_asset in map_assets )
        {
            if ( map_asset[ 0 ] == "-" )
            {
                map_asset = getsubstr( map_asset, 1, map_asset.size );
                remove_map( map_asset );
                continue;
            }
            
            add_map( map_asset );
        }
    }
}

// Namespace subclass_to_aitype_map
// Params 1, eflags: 0x4
// Checksum 0x5199b37, Offset: 0xc6a
// Size: 0x5a
function private function_9fc4e9f61d6b21d8( subclass )
{
    if ( isdefined( level.subclass_to_aitype_map[ subclass ] ) )
    {
        return level.subclass_to_aitype_map[ subclass ];
    }
    
    calculated_aitype = calculate_aitype( subclass, level.var_396ff1f8ac66b808, level.var_54d7099494ead715, level.var_e33e1be8dabea955 );
    return calculated_aitype;
}

/#

    // Namespace subclass_to_aitype_map
    // Params 0, eflags: 0x4
    // Checksum 0x6c32194e, Offset: 0xccd
    // Size: 0x4b, Type: dev
    function private function_3de693086adddd24()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        devgui::function_9082edeb5db93280( "<dev string:x91>" );
        devgui::function_502a7d5e4d9dfa5b( "<dev string:xb4>", "<dev string:xc9>", &function_cc177ffde4bc515f );
        devgui::function_77df7fe7dd273e10();
        level thread function_7f543939155b54dc();
    }

    // Namespace subclass_to_aitype_map
    // Params 0, eflags: 0x4
    // Checksum 0x155374d, Offset: 0xd20
    // Size: 0x1a, Type: dev
    function private function_cc177ffde4bc515f()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:xf5>", @"hash_2b1d5239d2b0170b" );
    }

    // Namespace subclass_to_aitype_map
    // Params 0, eflags: 0x4
    // Checksum 0xfc843ce5, Offset: 0xd42
    // Size: 0x260, Type: dev
    function private function_7f543939155b54dc()
    {
        level endon( "<dev string:x103>" );
        
        while ( true )
        {
            if ( getdvarint( @"hash_2b1d5239d2b0170b", 0 ) == 0 )
            {
                waitframe();
                continue;
            }
            
            col = ( 0, 1, 0 );
            yy = 400;
            printtoscreen2d( 10, yy, "<dev string:x111>", col );
            yy += 20;
            printtoscreen2d( 10, yy, "<dev string:x12b>" + level.var_396ff1f8ac66b808, col );
            yy += 20;
            
            if ( level.var_396ff1f8ac66b808 == "<dev string:x140>" )
            {
                printtoscreen2d( 10, yy, "<dev string:x152>" + level.var_e33e1be8dabea955, col );
            }
            else if ( level.var_396ff1f8ac66b808 == "<dev string:x16b>" )
            {
                printtoscreen2d( 10, yy, "<dev string:x177>" + level.var_bb740e14e3b6aefc, col );
            }
            
            yy += 30;
            entry_i = 0;
            
            foreach ( subclass in level.var_962742d9501c1412 )
            {
                aitype = function_b3988325430ce242( subclass );
                col = arraycontains( level.subclass_to_aitype_map, aitype ) ? ( 0.9, 0.6, 0 ) : ( 0.8, 0.5, 0 );
                printtoscreen2d( 200, yy + entry_i * 20, subclass + "<dev string:x18c>" + aitype, col );
                entry_i++;
            }
            
            printtoscreen2d( 10, yy, "<dev string:x194>", col );
            yy += 20;
            entry_i = 0;
            
            foreach ( map_name in level.var_c9e0fca55204d8c4 )
            {
                printtoscreen2d( 10, yy + entry_i * 20, map_name, col );
                entry_i++;
            }
            
            waitframe();
        }
    }

#/
