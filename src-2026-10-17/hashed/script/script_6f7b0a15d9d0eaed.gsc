#using scripts\common\callbacks;

#namespace specialty_awareness;

// Namespace specialty_awareness
// Params 0, eflags: 0x1
// Checksum 0xf3c7abba, Offset: 0x8d
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_awareness
// Params 1
// Checksum 0xafe0fb01, Offset: 0xad
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_awareness" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_awareness" );
    }
}

