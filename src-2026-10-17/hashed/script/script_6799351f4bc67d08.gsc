#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace specialty_gas_trap_resist;

// Namespace specialty_gas_trap_resist
// Params 0, eflags: 0x1
// Checksum 0x85cceff9, Offset: 0xa8
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_gas_trap_resist
// Params 1
// Checksum 0xdb8daabc, Offset: 0xc8
// Size: 0x58
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_gas_trap_resist", &function_5c165238a5d70d1d, &function_fc93281e133d0aa2, [] );
    }
    
    utility::registersharedfunc( #"specialty_gas_trap_resist", #"activate", &activate );
}

// Namespace specialty_gas_trap_resist
// Params 0
// Checksum 0xf3161ed5, Offset: 0x128
// Size: 0x5f
function activate()
{
    var_155f10385466f377 = self.var_773b81cf576594e5 && self.var_773b81cf576594e5[ "specialty_gas_trap_resist" ] ? self.var_773b81cf576594e5[ "specialty_gas_trap_resist" ] : "specialty_veteran";
    utility::callsharedfunc( #"perk", #"activateperk", var_155f10385466f377 );
}

// Namespace specialty_gas_trap_resist
// Params 0
// Checksum 0x96a5d3df, Offset: 0x18f
// Size: 0x32
function function_5c165238a5d70d1d()
{
    perks::function_70e4256c5fb41ada( "specialty_gas_trap_resist" );
    self.var_9a1a934ae5b99d2 = self.var_9842326056fd7207.var_55c958a38f72be63 ?? 0.8;
}

// Namespace specialty_gas_trap_resist
// Params 0
// Checksum 0xe4432b6a, Offset: 0x1c9
// Size: 0xc
function function_fc93281e133d0aa2()
{
    self.var_9a1a934ae5b99d2 = undefined;
}

