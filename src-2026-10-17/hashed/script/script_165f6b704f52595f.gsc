#using scripts\common\callbacks;

#namespace specialty_brawler;

// Namespace specialty_brawler
// Params 0, eflags: 0x1
// Checksum 0xa050ad80, Offset: 0x8b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_brawler
// Params 1
// Checksum 0x77458533, Offset: 0xab
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_brawler" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_brawler" );
    }
}

