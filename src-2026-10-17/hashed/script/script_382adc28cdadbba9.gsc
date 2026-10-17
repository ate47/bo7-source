#using scripts\common\callbacks;

#namespace specialty_improved_field_upgrades;

// Namespace specialty_improved_field_upgrades
// Params 0, eflags: 0x1
// Checksum 0x79bd954e, Offset: 0x9b
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_improved_field_upgrades
// Params 1
// Checksum 0x387347bb, Offset: 0xbb
// Size: 0x32
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_improved_field_upgrades", undefined, undefined, [] );
    }
}

