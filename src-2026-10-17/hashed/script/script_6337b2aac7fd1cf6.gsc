#using scripts\common\callbacks;

#namespace specialty_throwback_extrafusetime;

// Namespace specialty_throwback_extrafusetime
// Params 0, eflags: 0x1
// Checksum 0x18872371, Offset: 0x9b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_throwback_extrafusetime
// Params 1
// Checksum 0x7b8adc35, Offset: 0xbb
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_throwback_extrafusetime" );
    }
}

