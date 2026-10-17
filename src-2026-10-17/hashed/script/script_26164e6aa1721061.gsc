#using scripts\common\callbacks;

#namespace specialty_combat_tracker;

// Namespace specialty_combat_tracker
// Params 0, eflags: 0x1
// Checksum 0x272aa149, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_95966cb7d34c3b1d );
}

// Namespace specialty_combat_tracker
// Params 1
// Checksum 0x276ebc56, Offset: 0xb2
// Size: 0x55
function function_95966cb7d34c3b1d( params )
{
    bundle = level.perkbundles[ "specialty_combat_tracker" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_combat_tracker", undefined, undefined, [] );
    }
}

