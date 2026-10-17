#using scripts\common\callbacks;

#namespace nodeathicon;

// Namespace nodeathicon
// Params 0, eflags: 0x5
// Checksum 0xd6138c85, Offset: 0x8f
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_faa7ba7d7f8b9ff7 );
}

// Namespace nodeathicon
// Params 1
// Checksum 0xb9353025, Offset: 0xaf
// Size: 0x2f
function function_faa7ba7d7f8b9ff7( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_nodeathicon" );
    }
}

