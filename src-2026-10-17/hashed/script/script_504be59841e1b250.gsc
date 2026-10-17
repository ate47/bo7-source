#using scripts\common\callbacks;

#namespace specialty_explosive_regen_halt_immunity;

// Namespace specialty_explosive_regen_halt_immunity
// Params 0, eflags: 0x1
// Checksum 0x83899bc7, Offset: 0xa1
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_explosive_regen_halt_immunity
// Params 1
// Checksum 0x19663563, Offset: 0xc1
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_explosive_regen_halt_immunity", &function_4099243f539876bf, &function_6059f2dd5382da06, [] );
    }
}

// Namespace specialty_explosive_regen_halt_immunity
// Params 0
// Checksum 0xdac2e58f, Offset: 0x103
// Size: 0xd
function function_4099243f539876bf()
{
    self.explosiveregenhaltimmunity = 1;
}

// Namespace specialty_explosive_regen_halt_immunity
// Params 0
// Checksum 0x2320b442, Offset: 0x118
// Size: 0xc
function function_6059f2dd5382da06()
{
    self.explosiveregenhaltimmunity = 0;
}

