#using scripts\common\callbacks;

#namespace specialty_munitions_two;

// Namespace specialty_munitions_two
// Params 0, eflags: 0x1
// Checksum 0x7b9ac0c5, Offset: 0xa9
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_d9ea7d008ac32376 );
}

// Namespace specialty_munitions_two
// Params 1
// Checksum 0x7e01d457, Offset: 0xc9
// Size: 0x5e
function function_d9ea7d008ac32376( params )
{
    bundle = level.perkbundles[ "specialty_munitions_2" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_munitions_2", undefined, undefined, [ "specialty_twoprimaries" ] );
    }
}

