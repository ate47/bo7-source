#using scripts\common\callbacks;

#namespace specialty_revived_faster;

// Namespace specialty_revived_faster
// Params 0, eflags: 0x1
// Checksum 0xa8a3ecd7, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_revived_faster
// Params 1
// Checksum 0x5f5dcd90, Offset: 0xb2
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_revived_faster", &function_23c550dc2fdc0b64, &function_99e0f5b7fdc22743, [] );
    }
}

// Namespace specialty_revived_faster
// Params 0
// Checksum 0x258042f, Offset: 0xf4
// Size: 0x33
function function_23c550dc2fdc0b64()
{
    self.var_400070c824a25410 = self.var_9842326056fd7207.var_b5a4d6f683d2387e ?? getdvarfloat( @"hash_62f5a23e338fbc5c", 3.5 );
}

// Namespace specialty_revived_faster
// Params 0
// Checksum 0x40ac8c14, Offset: 0x12f
// Size: 0xc
function function_99e0f5b7fdc22743()
{
    self.var_400070c824a25410 = undefined;
}

