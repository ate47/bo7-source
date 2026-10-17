#using scripts\common\callbacks;

#namespace specialty_veteran;

// Namespace specialty_veteran
// Params 0, eflags: 0x1
// Checksum 0xc63ba327, Offset: 0x8b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_veteran
// Params 1
// Checksum 0x87f571d2, Offset: 0xab
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_veteran", undefined, undefined, [] );
    }
}

