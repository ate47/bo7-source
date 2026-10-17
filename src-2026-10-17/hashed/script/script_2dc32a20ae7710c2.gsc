#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_explosive_regen_delay_immunity;

// Namespace specialty_explosive_regen_delay_immunity
// Params 0, eflags: 0x1
// Checksum 0xf2a51adf, Offset: 0xa2
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_explosive_regen_delay_immunity
// Params 1
// Checksum 0xafdd211d, Offset: 0xc2
// Size: 0x36
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_explosive_regen_delay_immunity", &setspecialty, undefined, [] );
    }
}

// Namespace specialty_explosive_regen_delay_immunity
// Params 0
// Checksum 0x7d9408be, Offset: 0x100
// Size: 0xe
function setspecialty()
{
    perks::function_70e4256c5fb41ada( "specialty_explosive_regen_delay_immunity" );
}

