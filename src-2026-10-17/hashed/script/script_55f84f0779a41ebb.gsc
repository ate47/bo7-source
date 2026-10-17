#using scripts\common\callbacks;

#namespace specialty_flexible_tactics;

// Namespace specialty_flexible_tactics
// Params 0, eflags: 0x1
// Checksum 0x728d0836, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_flexible_tactics
// Params 1
// Checksum 0x21374330, Offset: 0xb4
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_flexible_tactics", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_flexible_tactics
// Params 0
// Checksum 0x7cb8b3b0, Offset: 0xf6
// Size: 0x2
function setspecialty()
{
    
}

// Namespace specialty_flexible_tactics
// Params 0
// Checksum 0x4c0f07de, Offset: 0x100
// Size: 0x2
function unsetspecialty()
{
    
}

