#using scripts\common\callbacks;

#namespace specialty_reinforced;

// Namespace specialty_reinforced
// Params 0, eflags: 0x1
// Checksum 0x360c6a08, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_reinforced
// Params 1
// Checksum 0xa82c33f5, Offset: 0xae
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_reinforced" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reinforced" );
    }
}

