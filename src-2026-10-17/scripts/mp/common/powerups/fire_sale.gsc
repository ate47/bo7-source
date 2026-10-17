#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\powerups;
#using scripts\common\utility;
#using scripts\mp\common\powerups\powerups;
#using scripts\mp\magicbox;

#namespace fire_sale;

// Namespace fire_sale
// Params 0, eflags: 0x1
// Checksum 0xed3ec3f3, Offset: 0xd4
// Size: 0x9
function autoexec main()
{
    init_fire_sale();
}

// Namespace fire_sale
// Params 0
// Checksum 0xd3c89e, Offset: 0xe5
// Size: 0x5a
function init_fire_sale()
{
    powerups::register_powerup( "fire_sale", &grab_fire_sale, &should_drop_fire_sale );
    
    /#
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x34>", "<dev string:x50>", &powerups::spawn_powerup_debug );
        devgui::function_cd4e263c1f3018ae( "<dev string:x70>", "<dev string:x8c>", &powerups::spawn_powerup_debug );
        devgui::function_77df7fe7dd273e10();
    #/
}

// Namespace fire_sale
// Params 0
// Checksum 0xef9bb1cd, Offset: 0x147
// Size: 0x4b, Type: bool
function should_drop_fire_sale()
{
    if ( utility::flag( "magicbox_moving" ) || utility::flag( "powerup_fire_sale_active" ) || level.var_1c98168ff9213851 < 1 )
    {
        return false;
    }
    
    if ( level.zm_mode_modifiers.var_7d3d84e96a1a43b5 )
    {
        return false;
    }
    
    return true;
}

// Namespace fire_sale
// Params 2
// Checksum 0x6c7d1801, Offset: 0x19b
// Size: 0x1c
function grab_fire_sale( str_powerup, ent_powerup )
{
    thread run_fire_sale();
}

// Namespace fire_sale
// Params 0
// Checksum 0xa2697f2b, Offset: 0x1bf
// Size: 0x1e6
function run_fire_sale()
{
    level notify( #"run_fire_sale" );
    level endon( #"run_fire_sale" );
    utility::flag_set( "powerup_fire_sale_active" );
    level callback::callback( #"firesale_start" );
    level thread magicbox::firesale_start();
    root = powerups::get_powerups_root();
    n_lifetime = root.powerups[ "fire_sale" ].var_3f03b937c69044df;
    
    if ( isdefined( level.powerup_timeout_override ) )
    {
        n_lifetime = self [[ level.powerup_timeout_override ]]( n_lifetime );
    }
    
    a_players = powerups::get_powerup_players( "fire_sale" );
    
    foreach ( player in a_players )
    {
        player thread powerups_cpmp::function_52318afc13635e7c( "fire_sale", n_lifetime );
        player utility::ent_flag_set( "powerup_fire_sale_active" );
    }
    
    level utility::delaythreadendon( n_lifetime - 10, "run_fire_sale", &magicbox::function_6d085c8f7f79538d );
    level utility::waittill_any_timeout( n_lifetime - 1, "end_fire_sale" );
    utility::flag_clear( "powerup_fire_sale_active" );
    level callback::callback( #"firesale_end" );
    
    foreach ( player in a_players )
    {
        if ( isdefined( player ) )
        {
            player utility::ent_flag_clear( "powerup_fire_sale_active" );
        }
    }
}

