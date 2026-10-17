#using scripts\common\callbacks;

#namespace specialty_outlander_bongo;

// Namespace specialty_outlander_bongo
// Params 0, eflags: 0x1
// Checksum 0xfa4c1625, Offset: 0x93
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_outlander_bongo
// Params 1
// Checksum 0x2062b1f4, Offset: 0xb3
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_outlander_bongo" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_outlander_bongo" );
    }
}

