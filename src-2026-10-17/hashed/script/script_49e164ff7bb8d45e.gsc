#using scripts\common\callbacks;

#namespace specialty_faster_health_regen;

// Namespace specialty_faster_health_regen
// Params 0, eflags: 0x1
// Checksum 0xb9b217f4, Offset: 0x97
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_faster_health_regen
// Params 1
// Checksum 0x6d0aaaed, Offset: 0xb7
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_faster_health_regen", &function_40d55b3e64d607f2, &function_df8f226c2740219, [] );
    }
}

// Namespace specialty_faster_health_regen
// Params 0
// Checksum 0x6894296c, Offset: 0xf9
// Size: 0x30
function function_40d55b3e64d607f2()
{
    self.var_dd77805de9dcde7d = self.var_9842326056fd7207.var_7e353976914c489f ?? getdvarfloat( @"hash_9c6401e541da3ee", 4 );
}

// Namespace specialty_faster_health_regen
// Params 0
// Checksum 0xe7257eaf, Offset: 0x131
// Size: 0xc
function function_df8f226c2740219()
{
    self.var_dd77805de9dcde7d = undefined;
}

