#using scripts\common\scriptable_ascender;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\gametypes\zm_rb_startroom_sat;

#namespace zm_sat_locust_ltm_startroom;

// Namespace zm_sat_locust_ltm_startroom
// Params 0, eflags: 0x5
// Checksum 0xbf3fe1c4, Offset: 0xe8
// Size: 0x25
function private autoexec __init__system__()
{
    system::register( #"hash_9d78d37a123d9185", #"zm_rb_startroom_sat", &pre_main, &post_main );
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0x426322f0, Offset: 0x115
// Size: 0x22
function private pre_main()
{
    if ( !zm_rb_startroom_sat::is_mode_startroom() )
    {
        return;
    }
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
    
    level thread function_79fdc05c5155eb5();
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0xb3d8ba57, Offset: 0x13f
// Size: 0x2a
function private post_main()
{
    if ( !zm_rb_startroom_sat::is_mode_startroom() )
    {
        return;
    }
    
    /#
        iprintlnbold( "<dev string:x45>" );
    #/
    
    level thread startroom_turn_on_power();
    level thread function_5b5ea88dcb2a6b4d();
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0xa6b34299, Offset: 0x171
// Size: 0x35
function private startroom_turn_on_power()
{
    level.vending_machines_powered_on_at_start = 1;
    
    if ( !isdefined( level.var_1d3d915cc555bf38 ) )
    {
        level.var_1d3d915cc555bf38 = [];
    }
    
    level.var_1d3d915cc555bf38[ "specialty_quickrevive" ] = 1;
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0
// Checksum 0x8bc7f3df, Offset: 0x1ae
// Size: 0x2
function function_ff0d344a498f81d5()
{
    
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0
// Checksum 0xea8ca112, Offset: 0x1b8
// Size: 0xb6
function function_79fdc05c5155eb5()
{
    while ( !isdefined( level.zm_ascender_states ) )
    {
        wait 1;
    }
    
    a_trigs = getentarray( "db_power_start_to_lighthouse_instance", "target" );
    
    foreach ( trig in a_trigs )
    {
        trig delete();
    }
    
    scriptable_ascender::function_432ef320b0c53fcd( &startroom_ascender_can_use );
    scriptable_ascender::function_959621fba91be23a( &function_1ffddd8163753ba5 );
}

// Namespace zm_sat_locust_ltm_startroom
// Params 0, eflags: 0x4
// Checksum 0x1be10e8e, Offset: 0x276
// Size: 0x5a
function private function_5b5ea88dcb2a6b4d()
{
    level utility::flag_wait( "common_items_init" );
    common_item::function_f77c7eedea4fc99f( %"itemspawnentry:zm_t10_item_salvage_green", %"none" );
    common_item::function_f77c7eedea4fc99f( %"hash_6fcc2003910121a8", %"none" );
    common_item::function_f77c7eedea4fc99f( %"hash_76b88ec469fed206", %"none" );
}

// Namespace zm_sat_locust_ltm_startroom
// Params 5, eflags: 0x4
// Checksum 0x64da4e23, Offset: 0x2d8
// Size: 0x31, Type: bool
function private startroom_ascender_can_use( instance, player, edgeindex, isinverted, isvertical )
{
    return false;
}

// Namespace zm_sat_locust_ltm_startroom
// Params 6, eflags: 0x4
// Checksum 0x7884755a, Offset: 0x312
// Size: 0x71
function private function_1ffddd8163753ba5( instance, player, edgeindex, isvertical, isinverted, isgoingup )
{
    s = spawnstruct();
    s.type = "HINT_NOBUTTON";
    s.string = &"";
    return s;
}

