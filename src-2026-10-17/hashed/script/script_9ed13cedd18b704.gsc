#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;

#namespace specialty_reduce_death_door;

// Namespace specialty_reduce_death_door
// Params 0, eflags: 0x5
// Checksum 0xd2f125a3, Offset: 0xad
// Size: 0x2e
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_3bbc8fef5e8a83f1 );
    level callback::add( #"deaths_door_enter", &function_1f17dbf98fcfdbbe );
}

// Namespace specialty_reduce_death_door
// Params 1, eflags: 0x4
// Checksum 0x2a8ee4f2, Offset: 0xe3
// Size: 0x32
function private function_3bbc8fef5e8a83f1( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_reduce_death_door", undefined, undefined, [] );
    }
}

// Namespace specialty_reduce_death_door
// Params 1, eflags: 0x4
// Checksum 0x805145ae, Offset: 0x11d
// Size: 0x7f
function private function_1f17dbf98fcfdbbe( params )
{
    player = params.player;
    
    if ( !isdefined( player.perks[ "specialty_reduce_death_door" ] ) )
    {
        return;
    }
    
    if ( isdefined( player.var_759df123d2f6806d ) && gettime() - player.var_759df123d2f6806d <= 10 )
    {
        return;
    }
    
    player.var_759df123d2f6806d = gettime();
    player namespace_9d8e359c3b1041e5::activateperksharedfunc( "specialty_bomb_squad" );
}

