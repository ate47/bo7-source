#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_emp_resist;

// Namespace specialty_emp_resist
// Params 0, eflags: 0x1
// Checksum 0x76367579, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_emp_resist
// Params 1
// Checksum 0x81c8543e, Offset: 0xae
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_emp_resist", &setempresistance, &function_aa6c4ae592b43ee2, [] );
    }
}

// Namespace specialty_emp_resist
// Params 0
// Checksum 0x8a7258b6, Offset: 0xf0
// Size: 0x2f
function setempresistance()
{
    perks::function_70e4256c5fb41ada( "specialty_emp_resist" );
    self.var_a28afc32eacfeb65 = self.var_9842326056fd7207.var_916d966f87074c5d ?? 2;
}

// Namespace specialty_emp_resist
// Params 0
// Checksum 0x9b55893e, Offset: 0x127
// Size: 0xc
function function_aa6c4ae592b43ee2()
{
    self.var_a28afc32eacfeb65 = undefined;
}

