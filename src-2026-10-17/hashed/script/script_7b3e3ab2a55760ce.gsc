#using scripts\common\callbacks;

#namespace lightfoot;

// Namespace lightfoot
// Params 0, eflags: 0x1
// Checksum 0xe11f2470, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_cdd400da4e3e8cf1 );
}

// Namespace lightfoot
// Params 1
// Checksum 0x7a0ea170, Offset: 0xad
// Size: 0x52
function function_cdd400da4e3e8cf1( params )
{
    bundle = level.perkbundles[ "specialty_lightfoot" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_lightfoot" );
    }
}

