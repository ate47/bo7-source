#using scripts\common\callbacks;
#using scripts\mp\weapons;

#namespace specialty_reload_on_melee;

// Namespace specialty_reload_on_melee
// Params 0, eflags: 0x1
// Checksum 0xaa9d0e06, Offset: 0xa0
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_reload_on_melee
// Params 1
// Checksum 0x5d632f6d, Offset: 0xc0
// Size: 0x39
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reload_on_melee", &function_f2ea879dd5c2e9e, &function_ae2b9db844ee1b89 );
    }
}

// Namespace specialty_reload_on_melee
// Params 0
// Checksum 0xabe8bc9c, Offset: 0x101
// Size: 0x18
function function_f2ea879dd5c2e9e()
{
    level callback::add( #"on_ai_damaged", &function_8500b60c0046ecf2 );
}

// Namespace specialty_reload_on_melee
// Params 0
// Checksum 0xaa810c64, Offset: 0x121
// Size: 0x18
function function_ae2b9db844ee1b89()
{
    level callback::remove( #"on_ai_damaged", &function_8500b60c0046ecf2 );
}

// Namespace specialty_reload_on_melee
// Params 1
// Checksum 0xb8c8291b, Offset: 0x141
// Size: 0x41
function function_8500b60c0046ecf2( params )
{
    if ( params.smeansofdeath == "MOD_MELEE" )
    {
        params.eattacker weapons::function_937faff615744271( params.eattacker getcurrentweapon() );
    }
}

