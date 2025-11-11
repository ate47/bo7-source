#using scripts\common\callbacks;
#using scripts\cp_mp\challenges;
#using scripts\mp\perks\perks;

#namespace wildcards;

// Namespace wildcards
// Params 0, eflags: 0x1
// Checksum 0x97b09af0, Offset: 0x1b4
// Size: 0x1f
function autoexec preinit()
{
    function_c9e23ef0cfb78673();
    level callback::add( #"register_perk", &registerwildcards );
}

// Namespace wildcards
// Params 1
// Checksum 0x72d9d367, Offset: 0x1db
// Size: 0xcc
function registerwildcards( params )
{
    if ( !isdefined( level.wildcardbundles ) )
    {
        return;
    }
    
    perks::registerscriptperk( "wildcard_danger_close", undefined, undefined, [ "specialty_extra_deadly" ] );
    perks::registerscriptperk( "wildcard_tactical_expert", undefined, undefined, [ "specialty_extraoffhandammo" ] );
    perks::registerscriptperk( "wildcard_overkill", undefined, undefined, undefined );
    perks::registerscriptperk( "wildcard_gunfighter", undefined, undefined, undefined );
    perks::registerscriptperk( "wildcard_field_captain", undefined, undefined, undefined );
    perks::registerscriptperk( "wildcard_perk_greed", undefined, undefined, undefined );
    perks::registerscriptperk( "wildcard_equipment_expert", undefined, undefined, [ "specialty_bandolier" ] );
    perks::registerscriptperk( "wildcard_master_tactician", undefined, undefined, [ "specialty_battle_ready" ] );
    callback::add( #"hash_f873effec093bd7d", &function_72068572f6a5f816 );
}

// Namespace wildcards
// Params 0
// Checksum 0x535e5c07, Offset: 0x2af
// Size: 0x166
function function_c9e23ef0cfb78673()
{
    str_list = level.gamemodebundle.wildcard_list;
    
    if ( !isdefined( str_list ) )
    {
        return;
    }
    
    if ( !isdefined( level.wildcardbundles ) )
    {
        level.wildcardbundles = [];
    }
    
    var_364b566f13cd8b14 = getscriptbundle( str_list );
    assert( isdefined( var_364b566f13cd8b14 ), "<dev string:x24>" );
    assert( isdefined( var_364b566f13cd8b14.wildcard_list ) );
    
    if ( !isdefined( var_364b566f13cd8b14.wildcard_list ) )
    {
        return;
    }
    
    foreach ( var_11d841e58e0d6ae8 in var_364b566f13cd8b14.wildcard_list )
    {
        if ( !isdefined( var_11d841e58e0d6ae8 ) )
        {
            continue;
        }
        
        wildcardref = var_11d841e58e0d6ae8.ref;
        
        if ( !isdefined( wildcardref ) )
        {
            continue;
        }
        
        wildcardbundlename = var_11d841e58e0d6ae8.bundle;
        
        if ( !isdefined( wildcardbundlename ) )
        {
            continue;
        }
        
        bundle = getscriptbundle( wildcardbundlename );
        
        if ( !isdefined( bundle ) )
        {
            continue;
        }
        
        level.wildcardbundles[ wildcardref ] = bundle;
    }
}

// Namespace wildcards
// Params 1
// Checksum 0xe6a9af05, Offset: 0x41d
// Size: 0x22
function function_64efa89a8031a2a5( wildcardref )
{
    return level.wildcardbundles[ wildcardref ].var_a362c1b75ace930f;
}

// Namespace wildcards
// Params 1
// Checksum 0x5c004a6c, Offset: 0x448
// Size: 0x22
function function_56215609cd11b947( wildcardref )
{
    return level.wildcardbundles[ wildcardref ].var_a5109ca42cf62f91;
}

// Namespace wildcards
// Params 1
// Checksum 0x7b8ad83, Offset: 0x473
// Size: 0x175
function function_72068572f6a5f816( params )
{
    var_78b8e4a13e63bc01 = params.var_78b8e4a13e63bc01;
    var_86c674a64c35ed94 = params.var_86c674a64c35ed94;
    var_b1c3134299e971f7 = [];
    
    foreach ( perk in var_78b8e4a13e63bc01 )
    {
        wildcardbit = function_64efa89a8031a2a5( perk );
        var_1ecbb57391540a39 = function_56215609cd11b947( perk );
        
        if ( isdefined( wildcardbit ) && isdefined( var_1ecbb57391540a39 ) )
        {
            switch ( var_1ecbb57391540a39 )
            {
                case 1:
                    var_86c674a64c35ed94.var_ec7be02dd7cc6d7d = challenges::function_a23641f33e985edb( var_86c674a64c35ed94.var_ec7be02dd7cc6d7d, wildcardbit );
                    break;
                case 2:
                    var_86c674a64c35ed94.var_7111292ef37e4f97 = challenges::function_a23641f33e985edb( var_86c674a64c35ed94.var_7111292ef37e4f97, wildcardbit );
                    break;
                default:
                    break;
            }
            
            continue;
        }
        
        var_b1c3134299e971f7[ var_b1c3134299e971f7.size ] = perk;
    }
    
    params.var_78b8e4a13e63bc01 = var_b1c3134299e971f7;
    params.var_86c674a64c35ed94 = var_86c674a64c35ed94;
}

