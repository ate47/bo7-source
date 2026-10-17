#using scripts\common\system;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_slayer;

#namespace ztron_slayer_arena_beta;

// Namespace ztron_slayer_arena_beta
// Params 0, eflags: 0x5
// Checksum 0xee8a177, Offset: 0x8d
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"beta", undefined, &arena_init, undefined );
}

// Namespace ztron_slayer_arena_beta
// Params 0
// Checksum 0x4ae5a78, Offset: 0xae
// Size: 0x9
function arena_init()
{
    thread arena_init_internal();
}

// Namespace ztron_slayer_arena_beta
// Params 0
// Checksum 0x5bb2adc, Offset: 0xbf
// Size: 0x19
function arena_init_internal()
{
    waittillframeend();
    ztron_slayer::function_2295e22fea1bdcc3( "beta", &beta_init, &beta_shutdown );
}

// Namespace ztron_slayer_arena_beta
// Params 1
// Checksum 0xcc1624ae, Offset: 0xe0
// Size: 0x17
function beta_init( arena )
{
    level.var_8972cc8b6869f399 = 1;
}

// Namespace ztron_slayer_arena_beta
// Params 1
// Checksum 0xbfdb6e09, Offset: 0xff
// Size: 0x8b
function beta_shutdown( arena )
{
    if ( level.ztron.casualmode )
    {
        level.ztron.var_bdbf6cf2011e0b2d = ztron_arena::function_973956bb5a6e60f7( "town_square" ).id;
        level.ztron.var_a58d52a0faa75a57[ level.ztron.var_a58d52a0faa75a57.size ] = 0;
    }
    
    level.var_8972cc8b6869f399 = 0;
    level notify( #"hash_90b054ec711321cd" );
}

