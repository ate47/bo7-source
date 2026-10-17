#using scripts\common\callbacks;

#namespace specialty_twoprimaries;

// Namespace specialty_twoprimaries
// Params 0, eflags: 0x1
// Checksum 0xe1f2dbf7, Offset: 0x90
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_twoprimaries
// Params 1
// Checksum 0xaca1838a, Offset: 0xb0
// Size: 0x52
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_twoprimaries" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_twoprimaries" );
    }
}

