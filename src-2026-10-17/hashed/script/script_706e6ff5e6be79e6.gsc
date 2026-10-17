#using script_16703a7a81b5d957;
#using scripts\common\callbacks;

#namespace specialty_reload_on_switch;

// Namespace specialty_reload_on_switch
// Params 0, eflags: 0x1
// Checksum 0xa5d3e245, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_reload_on_switch
// Params 1
// Checksum 0x6d9bd386, Offset: 0xb4
// Size: 0x39
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reload_on_switch", &perkfunctions::function_b171574387e7502e, &perkfunctions::function_27bc83ee3dea9e27 );
    }
}

