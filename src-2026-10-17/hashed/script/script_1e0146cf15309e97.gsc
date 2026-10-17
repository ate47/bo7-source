#using scripts\common\callbacks;

#namespace specialty_hidden_from_location_callouts;

// Namespace specialty_hidden_from_location_callouts
// Params 0, eflags: 0x1
// Checksum 0xeef6d015, Offset: 0xa1
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_hidden_from_location_callouts
// Params 1
// Checksum 0x8dfb2f51, Offset: 0xc1
// Size: 0x2f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_hidden_from_location_callouts" );
    }
}

