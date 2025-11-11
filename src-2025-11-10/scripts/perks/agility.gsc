#using scripts\common\callbacks;

#namespace agility;

// Namespace agility
// Params 0, eflags: 0x1
// Checksum 0x190c1f75, Offset: 0x96
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_a9cc26118dbe6ea );
}

// Namespace agility
// Params 1
// Checksum 0x7dd49ab3, Offset: 0xb6
// Size: 0x63
function function_a9cc26118dbe6ea( params )
{
    bundle = level.perkbundles[ "specialty_agility" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( function_64872fcef35cb56c( #"hash_2e107a9f2531679c" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_agility" );
    }
}

