#using scripts\common\callbacks;

#namespace specialty_mobility;

// Namespace specialty_mobility
// Params 0, eflags: 0x1
// Checksum 0x776608f0, Offset: 0x8c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_mobility
// Params 1
// Checksum 0x168df21f, Offset: 0xac
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_mobility" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_mobility" );
    }
}

