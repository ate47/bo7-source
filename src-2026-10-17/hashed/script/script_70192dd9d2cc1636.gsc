#using scripts\common\callbacks;

#namespace specialty_iron_lungs;

// Namespace specialty_iron_lungs
// Params 0, eflags: 0x1
// Checksum 0xc985521d, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_iron_lungs
// Params 1
// Checksum 0xc61a37da, Offset: 0xae
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_iron_lungs" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_iron_lungs" );
    }
}

