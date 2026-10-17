#using scripts\common\callbacks;

#namespace specialty_supersprint;

// Namespace specialty_supersprint
// Params 0, eflags: 0x1
// Checksum 0xf8b9f59f, Offset: 0x8f
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_a8a4a034df7e7ae2 );
}

// Namespace specialty_supersprint
// Params 1
// Checksum 0x6c018ff, Offset: 0xaf
// Size: 0x3a
function function_a8a4a034df7e7ae2( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_supersprint", &setsupersprint, &unsetsupersprint, [] );
    }
}

// Namespace specialty_supersprint
// Params 0
// Checksum 0x7bc6c47c, Offset: 0xf1
// Size: 0x2
function setsupersprint()
{
    
}

// Namespace specialty_supersprint
// Params 0
// Checksum 0x4cb4c577, Offset: 0xfb
// Size: 0x2
function unsetsupersprint()
{
    
}

