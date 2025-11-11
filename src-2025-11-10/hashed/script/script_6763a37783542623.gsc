#using scripts\common\callbacks;

#namespace specialty_combat_medic;

// Namespace specialty_combat_medic
// Params 0, eflags: 0x1
// Checksum 0x67ffe8c9, Offset: 0xc8
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_combat_medic
// Params 1
// Checksum 0xc500eb64, Offset: 0xe8
// Size: 0x6b
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_combat_medic" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_combat_medic", &function_304c56b803480644, &function_3188ecd3b3f858fb, [ "specialty_reduce_regen_delay_on_objective" ], &function_87454bf1bf6b255a );
    }
}

// Namespace specialty_combat_medic
// Params 0
// Checksum 0x25f7b8b0, Offset: 0x15b
// Size: 0x2
function function_87454bf1bf6b255a()
{
    
}

// Namespace specialty_combat_medic
// Params 0
// Checksum 0x6e5571cb, Offset: 0x165
// Size: 0x26
function function_304c56b803480644()
{
    self.var_769791b1979771c8 = self.var_9842326056fd7207.var_6189f9d557ce572e ?? 1;
}

// Namespace specialty_combat_medic
// Params 0
// Checksum 0x606e284, Offset: 0x193
// Size: 0x10
function function_3188ecd3b3f858fb()
{
    self.var_769791b1979771c8 = 1;
}

