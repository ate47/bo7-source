#using scripts\common\callbacks;

#namespace specialty_supersprint;

// Namespace specialty_supersprint
// Params 0, eflags: 0x1
// Checksum 0x5e1321cf, Offset: 0x99
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_a8a4a034df7e7ae2 );
}

// Namespace specialty_supersprint
// Params 1
// Checksum 0x8cadedc3, Offset: 0xb9
// Size: 0x3a
function function_a8a4a034df7e7ae2( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_supersprint", &function_c361f5eecc50162d, &function_bcb99908ce0cb8ea, [] );
    }
}

// Namespace specialty_supersprint
// Params 0
// Checksum 0x7bc6c443, Offset: 0xfb
// Size: 0x2
function function_c361f5eecc50162d()
{
    
}

// Namespace specialty_supersprint
// Params 0
// Checksum 0x4cb4c56a, Offset: 0x105
// Size: 0x2
function function_bcb99908ce0cb8ea()
{
    
}

