#using scripts\common\callbacks;

#namespace specialty_paranoia;

// Namespace specialty_paranoia
// Params 0, eflags: 0x1
// Checksum 0xb669a1c, Offset: 0x8c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_paranoia
// Params 1
// Checksum 0xac2e367d, Offset: 0xac
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_paranoia" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_paranoia" );
    }
}

