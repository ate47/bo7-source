#using scripts\common\callbacks;

#namespace wildcard_flyswatter;

// Namespace wildcard_flyswatter
// Params 0, eflags: 0x5
// Checksum 0xed01d3b3, Offset: 0xb3
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_f60601811546e928 );
}

// Namespace wildcard_flyswatter
// Params 1
// Checksum 0x99180a2c, Offset: 0xd3
// Size: 0x5e
function function_f60601811546e928( params )
{
    bundle = level.wildcardbundles[ "wildcard_flyswatter" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "wildcard_flyswatter", undefined, undefined, [ "specialty_tertiary_allow_launchers" ] );
    }
}

