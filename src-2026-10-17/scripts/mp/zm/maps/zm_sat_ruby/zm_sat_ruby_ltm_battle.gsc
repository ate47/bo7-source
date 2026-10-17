#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\gametypes\zm_rb_battle;
#using scripts\mp\zm\gametypes\zm_rb_startroom_sat;

#namespace zm_sat_ruby_ltm_battle;

// Namespace zm_sat_ruby_ltm_battle
// Params 0, eflags: 0x5
// Checksum 0x51d24869, Offset: 0xb0
// Size: 0x25
function private autoexec __init__system__()
{
    system::register( #"hash_678cc588ef07c489", #"zm_rb_battle", &pre_main, &post_main );
}

// Namespace zm_sat_ruby_ltm_battle
// Params 0, eflags: 0x4
// Checksum 0xd728ee82, Offset: 0xdd
// Size: 0x1a
function private pre_main()
{
    if ( !zm_rb_battle::is_mode_zm_rb_battle() )
    {
        return;
    }
    
    level utility::flag_set( "disable_galileo_spawn" );
}

// Namespace zm_sat_ruby_ltm_battle
// Params 0, eflags: 0x4
// Checksum 0x39f0aa95, Offset: 0xff
// Size: 0x2e
function private post_main()
{
    if ( !zm_rb_battle::is_mode_zm_rb_battle() )
    {
        return;
    }
    
    level thread zm_rb_startroom_sat::function_7ff4cf75757ec51();
    utility::flag_wait( "scriptables_ready" );
    level utility::flag_set( "power_on" );
}

