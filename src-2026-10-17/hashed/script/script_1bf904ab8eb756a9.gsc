#using scripts\common\callbacks;

#namespace specialty_squad_link;

// Namespace specialty_squad_link
// Params 0, eflags: 0x1
// Checksum 0xa14bce0b, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_squad_link
// Params 1
// Checksum 0xde2ac395, Offset: 0xae
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_squad_link" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_squad_link" );
    }
}

