#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\gametypes\zm_rb_startroom_sat;

#namespace zm_sat_ruby_ltm_startroom;

// Namespace zm_sat_ruby_ltm_startroom
// Params 0, eflags: 0x5
// Checksum 0xb61030d7, Offset: 0xb0
// Size: 0x25
function private autoexec __init__system__()
{
    system::register( #"zm_sat_ruby_ltm_startroom", #"zm_rb_startroom_sat", &pre_main, &post_main );
}

// Namespace zm_sat_ruby_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0x9b41c24, Offset: 0xdd
// Size: 0x1a
function private pre_main()
{
    if ( !zm_rb_startroom_sat::is_mode_startroom() )
    {
        return;
    }
    
    level utility::flag_set( "disable_galileo_spawn" );
}

// Namespace zm_sat_ruby_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0x56107409, Offset: 0xff
// Size: 0x26
function private post_main()
{
    if ( !zm_rb_startroom_sat::is_mode_startroom() )
    {
        return;
    }
    
    utility::flag_wait( "scriptables_ready" );
    level utility::flag_set( "power_on" );
}

