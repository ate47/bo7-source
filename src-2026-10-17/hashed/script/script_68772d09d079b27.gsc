#using scripts\common\callbacks;

#namespace specialty_subsequent_jump_slowdown_disable;

// Namespace specialty_subsequent_jump_slowdown_disable
// Params 0, eflags: 0x5
// Checksum 0xf491ca2b, Offset: 0xa4
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_6f13a1c90bb20645 );
}

// Namespace specialty_subsequent_jump_slowdown_disable
// Params 1, eflags: 0x4
// Checksum 0xa271dabd, Offset: 0xc4
// Size: 0x32
function private function_6f13a1c90bb20645( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_subsequent_jump_slowdown_disable", undefined, undefined, [] );
    }
}

