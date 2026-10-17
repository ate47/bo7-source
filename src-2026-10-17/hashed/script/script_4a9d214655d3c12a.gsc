#using scripts\common\callbacks;

#namespace specialty_heartbreaker;

// Namespace specialty_heartbreaker
// Params 0, eflags: 0x1
// Checksum 0x1a0f1127, Offset: 0x90
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_heartbreaker
// Params 1
// Checksum 0x6dacdb4e, Offset: 0xb0
// Size: 0x55
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_heartbreaker" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_heartbreaker", undefined, undefined, [] );
    }
}

// Namespace specialty_heartbreaker
// Params 0
// Checksum 0x65b7635b, Offset: 0x10d
// Size: 0x2
function initheartbreaker()
{
    
}

// Namespace specialty_heartbreaker
// Params 0
// Checksum 0x287cd4de, Offset: 0x117
// Size: 0x2
function setheartbreaker()
{
    
}

// Namespace specialty_heartbreaker
// Params 0
// Checksum 0xbf997f57, Offset: 0x121
// Size: 0x2
function unsetheartbreaker()
{
    
}

