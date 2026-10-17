#using scripts\common\callbacks;

#namespace specialty_hack_immunity;

// Namespace specialty_hack_immunity
// Params 0, eflags: 0x1
// Checksum 0xc5785132, Offset: 0x91
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_hack_immunity
// Params 1
// Checksum 0x4a9db215, Offset: 0xb1
// Size: 0x3d
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_hack_immunity" );
    }
    
    level.specialty_hack_immunity_ref = "specialty_hack_immunity";
}

