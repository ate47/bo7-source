#using scripts\common\callbacks;

#namespace specialty_no_battle_chatter;

// Namespace specialty_no_battle_chatter
// Params 0, eflags: 0x1
// Checksum 0xf6e4abce, Offset: 0x95
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_no_battle_chatter
// Params 1
// Checksum 0x95e954a6, Offset: 0xb5
// Size: 0x32
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_no_battle_chatter", undefined, undefined, [] );
    }
}

