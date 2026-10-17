#using scripts\common\callbacks;

#namespace specialty_mountaineer;

// Namespace specialty_mountaineer
// Params 0, eflags: 0x1
// Checksum 0xc1e90462, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_mountaineer
// Params 1
// Checksum 0xbc10b4a, Offset: 0xaf
// Size: 0x52
function registerperk( params )
{
    bundle = level.perkbundles[ "specialty_mountaineer" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_mountaineer" );
    }
}

