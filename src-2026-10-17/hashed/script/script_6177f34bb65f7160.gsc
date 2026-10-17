#using scripts\common\callbacks;

#namespace specialty_streak_wrapper;

// Namespace specialty_streak_wrapper
// Params 0, eflags: 0x1
// Checksum 0x676f7ff9, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_streak_wrapper
// Params 1
// Checksum 0x4628091, Offset: 0xb2
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_streak_wrapper", undefined, undefined, [] );
    }
}

