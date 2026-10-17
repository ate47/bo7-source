#using scripts\common\system;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_bonus_room;
#using scripts\mp\zm\ztron\ztron_challenge;
#using scripts\mp\zm\ztron\ztron_enemy;

#namespace ztron_arena_museum;

// Namespace ztron_arena_museum
// Params 0, eflags: 0x5
// Checksum 0xa60a8a01, Offset: 0x94
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"museum", undefined, &arena_init, undefined );
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0x7906c9fc, Offset: 0xb5
// Size: 0x9
function arena_init()
{
    thread arena_init_internal();
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0xd5ddfc56, Offset: 0xc6
// Size: 0x61
function arena_init_internal()
{
    waittillframeend();
    ztron_arena::function_c61881897b87656d( "museum", &museum_init, &museum_shutdown );
    namespace_e1711960173e16b5::registerchallenge( "museum", "museum", &museum_challenge, &function_22ac8c21602a9a54, 1, &function_10aca8baf375b475 );
    
    if ( level.ztron.casualmode )
    {
        ztron_arena::function_37c3ad87b4c84a3f( "museum", 37, 4 );
    }
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0x26772257, Offset: 0x12f
// Size: 0xa
function museum_init()
{
    level thread museum_special_event();
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0x20476137, Offset: 0x141
// Size: 0x2
function museum_shutdown()
{
    
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0x921ee2e0, Offset: 0x14b
// Size: 0x97
function museum_special_event()
{
    level endon( #"ztron_game_is_over", #"arena_deactivated", #"arena_completed" );
    
    while ( true )
    {
        level waittill( #"round_about_to_start" );
        
        if ( level.ztron.arena_rounds_left == 2 )
        {
            if ( level.ztron.casualmode )
            {
                ztron_bonus_room::function_b018ee630661e155( "racing2" );
                continue;
            }
            
            if ( !level.ztron.hardcoremode )
            {
                ztron_bonus_room::function_b018ee630661e155( ztron_bonus_room::function_cc95fac45228eccd() );
            }
        }
    }
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0x3c791406, Offset: 0x1ea
// Size: 0x21
function museum_challenge()
{
    level.ztron.var_cd3b78b45db638d8 = ztron_enemy::function_96eea0d09d5640d1( "mimic" );
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0xa0fbad39, Offset: 0x213
// Size: 0x15
function function_22ac8c21602a9a54()
{
    level.ztron.var_cd3b78b45db638d8 = undefined;
}

// Namespace ztron_arena_museum
// Params 0
// Checksum 0xa8f410ac, Offset: 0x230
// Size: 0x4a
function function_10aca8baf375b475()
{
    chance = 5;
    
    if ( level.ztron.casualmode )
    {
        chance = 2;
    }
    
    if ( randomint( 100 ) < chance )
    {
        return level.ztron.var_cd3b78b45db638d8;
    }
}

