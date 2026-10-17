#using scripts\common\callbacks;

#namespace specialty_medic_bongo;

// Namespace specialty_medic_bongo
// Params 0, eflags: 0x1
// Checksum 0xcc18281c, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_medic_bongo
// Params 1
// Checksum 0x8cafb618, Offset: 0xaf
// Size: 0x50
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_medic_bongo" ];
    
    if ( !bundle )
    {
        return;
    }
    
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_medic_bongo" );
    }
}

