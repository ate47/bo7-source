#using scripts\common\callbacks;

#namespace specialty_engineer_bongo;

// Namespace specialty_engineer_bongo
// Params 0, eflags: 0x1
// Checksum 0xb193b424, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_engineer_bongo
// Params 1
// Checksum 0xbbbacb1, Offset: 0xb2
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_engineer_bongo" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_engineer_bongo" );
    }
}

