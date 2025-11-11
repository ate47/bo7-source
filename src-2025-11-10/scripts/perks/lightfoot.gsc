#using scripts\common\callbacks;

#namespace LIGHTFOOT;

// Namespace LIGHTFOOT
// Params 0, eflags: 0x1
// Checksum 0xe11f2470, Offset: 0x97
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_cdd400da4e3e8cf1 );
}

// Namespace LIGHTFOOT
// Params 1
// Checksum 0x4f73353d, Offset: 0xb7
// Size: 0x6c
function function_cdd400da4e3e8cf1( params )
{
    bundle = level.perkbundles[ "specialty_lightfoot" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_393f779ccdbb78d" );
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_lightfoot" );
    }
}

